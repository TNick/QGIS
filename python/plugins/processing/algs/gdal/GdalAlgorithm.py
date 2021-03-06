# -*- coding: utf-8 -*-

"""
***************************************************************************
    GdalAlgorithm.py
    ---------------------
    Date                 : August 2012
    Copyright            : (C) 2012 by Victor Olaya
    Email                : volayaf at gmail dot com
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""

__author__ = 'Victor Olaya'
__date__ = 'August 2012'
__copyright__ = '(C) 2012, Victor Olaya'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

import os
import re

from qgis.PyQt.QtCore import QUrl

from qgis.core import (QgsApplication,
                       QgsVectorFileWriter,
                       QgsProcessingUtils,
                       QgsProject)

from processing.core.GeoAlgorithm import GeoAlgorithm
from processing.algs.gdal.GdalAlgorithmDialog import GdalAlgorithmDialog
from processing.algs.gdal.GdalUtils import GdalUtils
from processing.tools import dataobjects

pluginPath = os.path.normpath(os.path.join(
    os.path.split(os.path.dirname(__file__))[0], os.pardir))


class GdalAlgorithm(GeoAlgorithm):

    def __init__(self):
        GeoAlgorithm.__init__(self)

    def icon(self):
        return QgsApplication.getThemeIcon("/providerGdal.svg")

    def svgIconPath(self):
        return QgsApplication.iconPath("providerGdal.svg")

    def createCustomParametersWidget(self, parent):
        return GdalAlgorithmDialog(self)

    def getConsoleCommands(self, parameters):
        return None

    def processAlgorithm(self, parameters, context, feedback):
        commands = self.getConsoleCommands(parameters)
        layers = QgsProcessingUtils.compatibleVectorLayers(QgsProject.instance())
        supported = QgsVectorFileWriter.supportedFormatExtensions()
        for i, c in enumerate(commands):
            for layer in layers:
                if layer.source() in c:
                    exported = dataobjects.exportVectorLayer(layer, supported)
                    exportedFileName = os.path.splitext(os.path.split(exported)[1])[0]
                    c = c.replace(layer.source(), exported)
                    if os.path.isfile(layer.source()):
                        fileName = os.path.splitext(os.path.split(layer.source())[1])[0]
                        c = re.sub('[\s]{}[\s]'.format(fileName), ' ' + exportedFileName + ' ', c)
                        c = re.sub('[\s]{}'.format(fileName), ' ' + exportedFileName, c)
                        c = re.sub('["\']{}["\']'.format(fileName), "'" + exportedFileName + "'", c)

            commands[i] = c
        GdalUtils.runGdal(commands, feedback)

    def helpUrl(self):
        helpPath = GdalUtils.gdalHelpPath()
        if helpPath == '':
            return None

        if os.path.exists(helpPath):
            return QUrl.fromLocalFile(os.path.join(helpPath, '{}.html'.format(self.commandName()))).toString()
        else:
            return helpPath + '{}.html'.format(self.commandName())

    def commandName(self):
        parameters = {}
        for output in self.outputs:
            output.setValue("dummy")
        for param in self.parameterDefinitions():
            parameters[param.name()] = "1"
        name = self.getConsoleCommands(parameters)[0]
        if name.endswith(".py"):
            name = name[:-3]
        return name

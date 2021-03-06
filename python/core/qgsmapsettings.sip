/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsmapsettings.h                                            *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/







class QgsMapSettings
{
%Docstring
 The QgsMapSettings class contains configuration for rendering of the map.
 The rendering itself is done by QgsMapRendererJob subclasses.

 In order to set up QgsMapSettings instance, it is necessary to set at least
 few members: extent, output size and layers.

 QgsMapSettings and QgsMapRendererJob (+subclasses) are intended to replace
 QgsMapRenderer class that existed before QGIS 2.4. The advantage of the new
 classes is that they separate the settings from the rendering and provide
 asynchronous API for map rendering.

.. versionadded:: 2.4
%End

%TypeHeaderCode
#include "qgsmapsettings.h"
%End
  public:
    QgsMapSettings();

    QgsRectangle extent() const;
%Docstring
of output size. Use visibleExtent() to get the resulting extent.
 :rtype: QgsRectangle
%End
    void setExtent( const QgsRectangle &rect, bool magnified = true );
%Docstring
of output size. Use visibleExtent() to get the resulting extent.
%End

    QSize outputSize() const;
%Docstring
Return the size of the resulting map image
 :rtype: QSize
%End
    void setOutputSize( QSize size );
%Docstring
Set the size of the resulting map image
%End

    double rotation() const;
%Docstring
 Returns the rotation of the resulting map image, in degrees clockwise.
.. versionadded:: 2.8
.. seealso:: setRotation()
 :rtype: float
%End

    void setRotation( double rotation );
%Docstring
 Sets the ``rotation`` of the resulting map image, in degrees clockwise.
.. versionadded:: 2.8
.. seealso:: rotation()
%End

    double outputDpi() const;
%Docstring
Default value is 96
 :rtype: float
%End
    void setOutputDpi( double dpi );
%Docstring
Set DPI used for conversion between real world units (e.g. mm) and pixels
%End

    void setMagnificationFactor( double factor );
%Docstring
 Set the magnification factor.
 \param factor the factor of magnification
.. versionadded:: 2.16
.. seealso:: magnificationFactor()
%End

    double magnificationFactor() const;
%Docstring
.. seealso:: setMagnificationFactor()
 :rtype: float
%End

    QStringList layerIds() const;
%Docstring
The layers are stored in the reverse order of how they are rendered (layer with index 0 will be on top)
 :rtype: list of str
%End
    QList<QgsMapLayer *> layers() const;
%Docstring
The layers are stored in the reverse order of how they are rendered (layer with index 0 will be on top)
 :rtype: list of QgsMapLayer
%End
    void setLayers( const QList<QgsMapLayer *> &layers );
%Docstring
The layers are stored in the reverse order of how they are rendered (layer with index 0 will be on top)
%End

    QMap<QString, QString> layerStyleOverrides() const;
%Docstring
.. versionadded:: 2.8
 :rtype: QMap<str, QString>
%End
    void setLayerStyleOverrides( const QMap<QString, QString> &overrides );
%Docstring
.. versionadded:: 2.8
%End

    QString customRenderFlags() const;
%Docstring
 Get custom rendering flags. Layers might honour these to alter their rendering.
  :return: custom flags strings, separated by ';'
.. versionadded:: 2.16
.. seealso:: setCustomRenderFlags()
 :rtype: str
%End

    void setCustomRenderFlags( const QString &customRenderFlags );
%Docstring
 Sets the custom rendering flags. Layers might honour these to alter their rendering.
 \param customRenderFlags custom flags strings, separated by ';'
.. versionadded:: 2.16
.. seealso:: customRenderFlags()
%End

    void setDestinationCrs( const QgsCoordinateReferenceSystem &crs );
%Docstring
sets destination coordinate reference system
%End
    QgsCoordinateReferenceSystem destinationCrs() const;
%Docstring
returns CRS of destination coordinate reference system
 :rtype: QgsCoordinateReferenceSystem
%End

    QgsUnitTypes::DistanceUnit mapUnits() const;
%Docstring
Get units of map's geographical coordinates - used for scale calculation
 :rtype: QgsUnitTypes.DistanceUnit
%End

    void setBackgroundColor( const QColor &color );
%Docstring
Set the background color of the map
%End
    QColor backgroundColor() const;
%Docstring
Get the background color of the map
 :rtype: QColor
%End

    void setSelectionColor( const QColor &color );
%Docstring
Set color that is used for drawing of selected vector features
%End
    QColor selectionColor() const;
%Docstring
Get color that is used for drawing of selected vector features
 :rtype: QColor
%End

    enum Flag
    {
      Antialiasing,
      DrawEditingInfo,
      ForceVectorOutput,
      UseAdvancedEffects,
      DrawLabeling,
      UseRenderingOptimization,
      DrawSelection,
      DrawSymbolBounds,
      RenderMapTile,
      RenderPartialOutput,
      // TODO
    };
    typedef QFlags<QgsMapSettings::Flag> Flags;


    void setFlags( QgsMapSettings::Flags flags );
%Docstring
Set combination of flags that will be used for rendering
%End
    void setFlag( Flag flag, bool on = true );
%Docstring
Enable or disable a particular flag (other flags are not affected)
%End
    Flags flags() const;
%Docstring
Return combination of flags used for rendering
 :rtype: Flags
%End
    bool testFlag( Flag flag ) const;
%Docstring
Check whether a particular flag is enabled
 :rtype: bool
%End

    void setOutputImageFormat( QImage::Format format );
%Docstring
sets format of internal QImage
%End
    QImage::Format outputImageFormat() const;
%Docstring
format of internal QImage, default QImage.Format_ARGB32_Premultiplied
 :rtype: QImage.Format
%End

    bool hasValidSettings() const;
%Docstring
Check whether the map settings are valid and can be used for rendering
 :rtype: bool
%End
    QgsRectangle visibleExtent() const;
%Docstring
Return the actual extent derived from requested extent that takes takes output image size into account
 :rtype: QgsRectangle
%End
    QPolygonF visiblePolygon() const;
%Docstring
.. versionadded:: 2.8
 :rtype: QPolygonF
%End
    double mapUnitsPerPixel() const;
%Docstring
Return the distance in geographical coordinates that equals to one pixel in the map
 :rtype: float
%End
    double scale() const;
%Docstring
Return the calculated scale of the map
 :rtype: float
%End

    void setExpressionContext( const QgsExpressionContext &context );
%Docstring
 Sets the expression context. This context is used for all expression evaluation
 associated with this map settings.
.. seealso:: expressionContext()
.. versionadded:: 2.12
%End

    const QgsExpressionContext &expressionContext() const;
%Docstring
 Gets the expression context. This context should be used for all expression evaluation
 associated with this map settings.
.. seealso:: setExpressionContext()
.. versionadded:: 2.12
 :rtype: QgsExpressionContext
%End


    QgsDatumTransformStore &datumTransformStore();
%Docstring
 :rtype: QgsDatumTransformStore
%End

    const QgsMapToPixel &mapToPixel() const;
%Docstring
 :rtype: QgsMapToPixel
%End

    double layerToMapUnits( const QgsMapLayer *layer, const QgsRectangle &referenceExtent = QgsRectangle() ) const;
%Docstring
 Computes an *estimated* conversion factor between layer and map units: layerUnits * layerToMapUnits = mapUnits
 \param layer The layer
 \param referenceExtent A reference extent based on which to perform the computation. If not specified, the layer extent is used
.. versionadded:: 2.12
 :rtype: float
%End

    QgsRectangle layerExtentToOutputExtent( const QgsMapLayer *layer, QgsRectangle extent ) const;
%Docstring
 transform bounding box from layer's CRS to output CRS
.. seealso:: layerToMapCoordinates( QgsMapLayer* layer, QgsRectangle rect ) if you want to transform a rectangle
 :return: a bounding box (aligned rectangle) containing the transformed extent
 :rtype: QgsRectangle
%End

    QgsRectangle outputExtentToLayerExtent( const QgsMapLayer *layer, QgsRectangle extent ) const;
%Docstring
 transform bounding box from output CRS to layer's CRS
.. seealso:: mapToLayerCoordinates( QgsMapLayer* layer,QgsRectangle rect ) if you want to transform a rectangle
 :return: a bounding box (aligned rectangle) containing the transformed extent
 :rtype: QgsRectangle
%End

    QgsPointXY layerToMapCoordinates( const QgsMapLayer *layer, QgsPointXY point ) const;
%Docstring
 transform point coordinates from layer's CRS to output CRS
 :return: the transformed point
 :rtype: QgsPointXY
%End

    QgsRectangle layerToMapCoordinates( const QgsMapLayer *layer, QgsRectangle rect ) const;
%Docstring
 transform rectangle from layer's CRS to output CRS
.. seealso:: layerExtentToOutputExtent() if you want to transform a bounding box
 :return: the transformed rectangle
 :rtype: QgsRectangle
%End

    QgsPointXY mapToLayerCoordinates( const QgsMapLayer *layer, QgsPointXY point ) const;
%Docstring
 transform point coordinates from output CRS to layer's CRS
 :return: the transformed point
 :rtype: QgsPointXY
%End

    QgsRectangle mapToLayerCoordinates( const QgsMapLayer *layer, QgsRectangle rect ) const;
%Docstring
 transform rectangle from output CRS to layer's CRS
.. seealso:: outputExtentToLayerExtent() if you want to transform a bounding box
 :return: the transformed rectangle
 :rtype: QgsRectangle
%End

    QgsCoordinateTransform layerTransform( const QgsMapLayer *layer ) const;
%Docstring
 Return coordinate transform from layer's CRS to destination CRS
 \param layer
 :return: transform - may be invalid if the transform is not needed
 :rtype: QgsCoordinateTransform
%End

    QgsRectangle fullExtent() const;
%Docstring
returns current extent of layer set
 :rtype: QgsRectangle
%End


    void readXml( QDomNode &node );
%Docstring
 serialization */
%End

    void writeXml( QDomNode &node, QDomDocument &doc );

    void setSegmentationTolerance( double tolerance );
%Docstring
 Sets the segmentation tolerance applied when rendering curved geometries
\param tolerance the segmentation tolerance*
%End
    double segmentationTolerance() const;
%Docstring
Gets the segmentation tolerance applied when rendering curved geometries
 :rtype: float
%End

    void setSegmentationToleranceType( QgsAbstractGeometry::SegmentationToleranceType type );
%Docstring
 Sets segmentation tolerance type (maximum angle or maximum difference between curve and approximation)
\param type the segmentation tolerance typename*
%End
    QgsAbstractGeometry::SegmentationToleranceType segmentationToleranceType() const;
%Docstring
Gets segmentation tolerance type (maximum angle or maximum difference between curve and approximation)
 :rtype: QgsAbstractGeometry.SegmentationToleranceType
%End

    void setLabelingEngineSettings( const QgsLabelingEngineSettings &settings );
%Docstring
 Sets global configuration of the labeling engine
.. versionadded:: 3.0
%End

    const QgsLabelingEngineSettings &labelingEngineSettings() const;
%Docstring
 Returns global configuration of the labeling engine
.. versionadded:: 3.0
 :rtype: QgsLabelingEngineSettings
%End

  protected:














    void updateDerived();
};

QFlags<QgsMapSettings::Flag> operator|(QgsMapSettings::Flag f1, QFlags<QgsMapSettings::Flag> f2);



/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsmapsettings.h                                            *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/

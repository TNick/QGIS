/***************************************************************************
  qgslegendsettings.h
  --------------------------------------
  Date                 : July 2014
  Copyright            : (C) 2014 by Martin Dobias
  Email                : wonder dot sk at gmail dot com
 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef QGSLEGENDSETTINGS_H
#define QGSLEGENDSETTINGS_H

#include "qgis_core.h"
#include "qgis_sip.h"
#include <QColor>
#include <QSizeF>

class QRectF;

#include "qgslegendstyle.h"


/** \ingroup core
 * \brief The QgsLegendSettings class stores the appearance and layout settings
 * for legend drawing with QgsLegendRenderer. The content of the legend is given
 * in QgsLegendModel class.
 *
 * \since QGIS 2.6
 */
class CORE_EXPORT QgsLegendSettings
{
  public:
    QgsLegendSettings();

    void setTitle( const QString &t ) { mTitle = t; }
    QString title() const { return mTitle; }

    /** Returns the alignment of the legend title
     * \returns Qt::AlignmentFlag for the legend title
     * \see setTitleAlignment
     */
    Qt::AlignmentFlag titleAlignment() const { return mTitleAlignment; }

    /** Sets the alignment of the legend title
     * \param alignment Text alignment for drawing the legend title
     * \see titleAlignment
     */
    void setTitleAlignment( Qt::AlignmentFlag alignment ) { mTitleAlignment = alignment; }

    /**
     * Returns reference to modifiable style
     *
     * \note Not available in Python bindings.
     */
    SIP_SKIP QgsLegendStyle &rstyle( QgsLegendStyle::Style s ) { return mStyleMap[s]; } SIP_SKIP
    //! Returns style
    QgsLegendStyle style( QgsLegendStyle::Style s ) const { return mStyleMap.value( s ); }
    void setStyle( QgsLegendStyle::Style s, const QgsLegendStyle &style ) { mStyleMap[s] = style; }

    double boxSpace() const {return mBoxSpace;}
    void setBoxSpace( double s ) {mBoxSpace = s;}

    void setWrapChar( const QString &t ) {mWrapChar = t;}
    QString wrapChar() const {return mWrapChar;}

    double columnSpace() const {return mColumnSpace;}
    void setColumnSpace( double s ) { mColumnSpace = s;}

    int columnCount() const { return mColumnCount; }
    void setColumnCount( int c ) { mColumnCount = c;}

    bool splitLayer() const { return mSplitLayer; }
    void setSplitLayer( bool s ) { mSplitLayer = s;}

    bool equalColumnWidth() const { return mEqualColumnWidth; }
    void setEqualColumnWidth( bool s ) { mEqualColumnWidth = s;}

    QColor fontColor() const {return mFontColor;}
    void setFontColor( const QColor &c ) {mFontColor = c;}

    QSizeF symbolSize() const {return mSymbolSize;}
    void setSymbolSize( QSizeF s ) {mSymbolSize = s;}

    /** Returns whether a stroke will be drawn around raster symbol items.
     * \see setDrawRasterStroke()
     * \see rasterStrokeColor()
     * \see rasterStrokeWidth()
     * \since QGIS 2.12
     */
    bool drawRasterStroke() const { return mRasterSymbolStroke; }

    /** Sets whether a stroke will be drawn around raster symbol items.
     * \param enabled set to true to draw borders
     * \see drawRasterStroke()
     * \see setRasterStrokeColor()
     * \see setRasterStrokeWidth()
     * \since QGIS 2.12
     */
    void setDrawRasterStroke( bool enabled ) { mRasterSymbolStroke = enabled; }

    /** Returns the stroke color for the stroke drawn around raster symbol items. The stroke is
     * only drawn if drawRasterStroke() is true.
     * \see setRasterStrokeColor()
     * \see drawRasterStroke()
     * \see rasterStrokeWidth()
     * \since QGIS 2.12
     */
    QColor rasterStrokeColor() const { return mRasterStrokeColor; }

    /** Sets the stroke color for the stroke drawn around raster symbol items. The stroke is
     * only drawn if drawRasterStroke() is true.
     * \param color stroke color
     * \see rasterStrokeColor()
     * \see setDrawRasterStroke()
     * \see setRasterStrokeWidth()
     * \since QGIS 2.12
     */
    void setRasterStrokeColor( const QColor &color ) { mRasterStrokeColor = color; }

    /** Returns the stroke width (in millimeters) for the stroke drawn around raster symbol items. The stroke is
     * only drawn if drawRasterStroke() is true.
     * \see setRasterStrokeWidth()
     * \see drawRasterStroke()
     * \see rasterStrokeColor()
     * \since QGIS 2.12
     */
    double rasterStrokeWidth() const { return mRasterStrokeWidth; }

    /** Sets the stroke width for the stroke drawn around raster symbol items. The stroke is
     * only drawn if drawRasterStroke() is true.
     * \param width stroke width in millimeters
     * \see rasterStrokeWidth()
     * \see setDrawRasterStroke()
     * \see setRasterStrokeColor()
     * \since QGIS 2.12
     */
    void setRasterStrokeWidth( double width ) { mRasterStrokeWidth = width; }

    QSizeF wmsLegendSize() const {return mWmsLegendSize;}
    void setWmsLegendSize( QSizeF s ) {mWmsLegendSize = s;}

    double lineSpacing() const { return mLineSpacing; }
    void setLineSpacing( double s ) { mLineSpacing = s; }

    double mmPerMapUnit() const { return mMmPerMapUnit; }
    void setMmPerMapUnit( double mmPerMapUnit ) { mMmPerMapUnit = mmPerMapUnit; }

    bool useAdvancedEffects() const { return mUseAdvancedEffects; }
    void setUseAdvancedEffects( bool use ) { mUseAdvancedEffects = use; }

    double mapScale() const { return mMapScale; }
    void setMapScale( double scale ) { mMapScale = scale; }

    int dpi() const { return mDpi; }
    void setDpi( int dpi ) { mDpi = dpi; }

    // utility functions

    /** Splits a string using the wrap char taking into account handling empty
     * wrap char which means no wrapping
     */
    QStringList splitStringForWrapping( const QString &stringToSplt ) const;

    /** Draws Text. Takes care about all the composer specific issues (calculation to
     * pixel, scaling of font and painter to work around the Qt font bug)
     */
    void drawText( QPainter *p, double x, double y, const QString &text, const QFont &font ) const;

    /** Like the above, but with a rectangle for multiline text
     * \param p painter to use
     * \param rect rectangle to draw into
     * \param text text to draw
     * \param font font to use
     * \param halignment optional horizontal alignment
     * \param valignment optional vertical alignment
     * \param flags allows for passing Qt::TextFlags to control appearance of rendered text
     */
    void drawText( QPainter *p, const QRectF &rect, const QString &text, const QFont &font, Qt::AlignmentFlag halignment = Qt::AlignLeft, Qt::AlignmentFlag valignment = Qt::AlignTop, int flags = Qt::TextWordWrap ) const;

    //! Returns a font where size is in pixel and font size is upscaled with FONT_WORKAROUND_SCALE
    QFont scaledFontPixelSize( const QFont &font ) const;

    //! Calculates font to from point size to pixel size
    double pixelFontSize( double pointSize ) const;

    //! Returns the font width in millimeters (considers upscaling and downscaling with FONT_WORKAROUND_SCALE
    double textWidthMillimeters( const QFont &font, const QString &text ) const;

    //! Returns the font height of a character in millimeters
    double fontHeightCharacterMM( const QFont &font, QChar c ) const;

    //! Returns the font ascent in Millimeters (considers upscaling and downscaling with FONT_WORKAROUND_SCALE
    double fontAscentMillimeters( const QFont &font ) const;

    //! Returns the font descent in Millimeters (considers upscaling and downscaling with FONT_WORKAROUND_SCALE
    double fontDescentMillimeters( const QFont &font ) const;

  private:

    QString mTitle;

    //! Title alignment, one of Qt::AlignLeft, Qt::AlignHCenter, Qt::AlignRight)
    Qt::AlignmentFlag mTitleAlignment;

    QString mWrapChar;

    QColor mFontColor;

    //! Space between item box and contents
    qreal mBoxSpace;

    //! Width and height of symbol icon
    QSizeF mSymbolSize;

    //! Width and height of WMS legendGraphic pixmap
    QSizeF mWmsLegendSize;

    //! Spacing between lines when wrapped
    double mLineSpacing;

    //! Space between columns
    double mColumnSpace;

    //! Number of legend columns
    int mColumnCount;

    //! Allow splitting layers into multiple columns
    bool mSplitLayer;

    //! Use the same width (maximum) for all columns
    bool mEqualColumnWidth;

    bool mRasterSymbolStroke;
    QColor mRasterStrokeColor;
    double mRasterStrokeWidth;

    QMap<QgsLegendStyle::Style, QgsLegendStyle> mStyleMap;

    //! Conversion ratio between millimeters and map units - for symbols with size given in map units
    double mMmPerMapUnit;

    //! Whether to use advanced effects like opacity for symbols - may require their rasterization
    bool mUseAdvancedEffects;

    //! Denominator of map's scale
    double mMapScale;

    //! DPI to be used when rendering legend
    int mDpi;
};



#endif // QGSLEGENDSETTINGS_H

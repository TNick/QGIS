/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/processing/qgsprocessingalgrunnertask.h                     *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/





class QgsProcessingAlgRunnerTask : QgsTask
{
%Docstring
 QgsTask task which runs a QgsProcessingAlgorithm in a background task.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgsprocessingalgrunnertask.h"
%End
  public:

    QgsProcessingAlgRunnerTask( const QgsProcessingAlgorithm *algorithm,
                                const QVariantMap &parameters,
                                QgsProcessingContext &context );
%Docstring
 Constructor for QgsProcessingAlgRunnerTask. Takes an ``algorithm``, algorithm ``parameters``
 and processing ``context``.
%End

    virtual void cancel();

  protected:

    virtual bool run();
    virtual void finished( bool result );

};



/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/processing/qgsprocessingalgrunnertask.h                     *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/

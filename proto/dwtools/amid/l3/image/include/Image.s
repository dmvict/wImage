( function _Image_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( './Basic.s' );

  require( './Reader.s' );
  require( './ReaderPngdotjs.s' );
  // require( './Writer.s' );

  module[ 'exports' ] = _global_.wTools;
}

} )();

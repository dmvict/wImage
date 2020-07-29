( function _ReaderBmpDashJs_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../../../../wtools/Tools.s' );
  require( '../image/entry/ReaderBmpDashJs.s' );
  require( './ReaderAbstract.test.s' );
}

let _ = _global_.wTools;
let Parent = _global_.wTests.ImageReadAbstract; /* xxx : rename */

// --
// context
// --

// --
// tests
// --

// --
// declare
// --

var Proto =
{

  name : 'ImageReadBmpDashJs',
  abstract : 0,

  context :
  {
    ext : 'bmp',
    format : 'bmp',
    readerName : 'BmpDashJs',
  },

  tests :
  {


  },

}

//

var Self = new wTestSuite( Proto ).inherit( Parent );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();

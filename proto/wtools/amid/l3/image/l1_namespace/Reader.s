( function _Reader_s_()
{

'use strict';

let _ = _global_.wTools;
let Self = _.image = _.image || Object.create( null );
_.image.reader = _.image.reader || Object.create( null );

// --
// inter
// --

function reader_pre( routine, args )
{
  let o = _.routineOptions( routine, args );
  _.assert( arguments.length === 2 );
  _.assert( _.longHas( [ 'full', 'head' ], o.mode ) );

  return o;
}

//

function read_body( o )
{

  let self = this;

  if( o.filePath && !o.ext )
  o.ext = _.path.ext( o.filePath ).toLowerCase();

  if( o.reader === null )
  {
    let o2 = _.mapOnly( o, self.readerDeduce.defaults );
    o2.single = 1;
    let selected = self.readerDeduce( o2 );

    _.assert( selected instanceof _.gdf.Context, `Cant deduce reader` );
    o.reader = selected;
  }

  let methodName = o.mode === 'full' ? 'read' : 'readHead';
  let o2 = _.mapOnly( o, o.reader[ methodName ].defaults );
  o2.params = o2.params || Object.create( null );
  o2.params.onHead = o.onHead;
  // o2.params.sync = o.sync;
  o2.params.mode = o.mode;
  o2.format = o.inFormat;

  let result = o.reader[ methodName ]( o2 );
  if( o.sync )
  return end( result );
  result.then( end );
  return result;

  /* */

  function end( result )
  {
    return result;
  }

  /* */

}

read_body.defaults =
{
  reader : null,
  data : null,
  filePath : null,
  inFormat : null,
  ext : null,
  sync : 1,
  mode : null,
  onHead : null,
}

//

let readHead = _.routineFromPreAndBody( reader_pre, read_body );
readHead.defaults.mode = 'head';

//

let read = _.routineFromPreAndBody( reader_pre, read_body );
read.defaults.mode = 'full';

//

function readerDeduce( o )
{
  let self = this;
  let temp = _.gdf;
  o = _.routineOptions( readerDeduce, arguments );
  o.outFormat = 'structure.image';
  debugger;
  let result = _.gdf.selectSingleContext( o );
  return result;
}

readerDeduce.defaults =
{
  data : null,
  inFormat : null,
  filePath : null,
  ext : null,
  single : 1,
}

// --
// declare
// --

let Extension =
{

  readHead,
  read,
  readerDeduce,

}

_.mapExtend( Self, Extension );


if( typeof module !== 'undefined' )
module[ 'exports' ] = _global_.wTools;

})();

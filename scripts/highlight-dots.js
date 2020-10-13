// Source: https://stackoverflow.com/a/43747218
function get_polygon_centroid(pts) { // pts: { x: number, y: number }
   var first = pts[0], last = pts[pts.length-1];
   if (first.x != last.x || first.y != last.y) pts.push(first);
   var twicearea=0,
   x=0, y=0,
   nPts = pts.length,
   p1, p2, f;
   for ( var i=0, j=nPts-1 ; i<nPts ; j=i++ ) {
      p1 = pts[i]; p2 = pts[j];
      f = (p1.y - first.y) * (p2.x - first.x) - (p2.y - first.y) * (p1.x - first.x);
      twicearea += f;
      x += (p1.x + p2.x - 2 * first.x) * f;
      y += (p1.y + p2.y - 2 * first.y) * f;
   }
   f = twicearea * 3;
   return { x:x/f + first.x, y:y/f + first.y };
}

function coordsToPoints(src) {
  let points = [];
  src = src.split(',');
  for (let i = 0; i < src.length; i = i + 2) {
    points.push({x: parseInt(src[i]), y: parseInt(src[i+1])});
  }
  return points;
}

/**
 * Get the URL parameters
 * source: https://css-tricks.com/snippets/javascript/get-url-variables/
 * @param  {String} url The URL
 * @return {Object}     The URL parameters
 */
function getParams(url) {
	var params = {};
	var parser = document.createElement('a');
	parser.href = url;
	var query = parser.search.substring(1);
	var vars = query.split('&');
	for (var i = 0; i < vars.length; i++) {
		var pair = vars[i].split('=');
		params[pair[0]] = decodeURIComponent(pair[1]);
	}
	return params;
};


function createDot(point) { // type: {x: number, y: number}
  console.log('Creating highlight dot:', point);
  let dot = document.createElement('img');
  dot.style.left = point.x + "px";
  dot.style.top = point.y + "px";
  dot.style.position = 'absolute';
  dot.src="/UDS4/images/Knipperbolletje.gif"
  document.body.appendChild(dot);
};

document.addEventListener("DOMContentLoaded", function(e) {
  const queryObjNr = getParams(location.search).objectnr;
  // console.log(queryObjNr.objectnr);

  const areas = document.getElementsByTagName("area");
  for(let i = 0; i < areas.length; i++) {
    const area = areas.item(i);
    const areaObjNr = getParams(area.href).Idnr;
    const areaCoords = area.coords;

    let areaPoints = coordsToPoints(areaCoords);
    // console.log(areaPoints);
    let areaCenter = get_polygon_centroid(areaPoints);
    // console.log(areaCenter);

    if (queryObjNr && queryObjNr === areaObjNr) {
        createDot(areaCenter);
    }
  }
});



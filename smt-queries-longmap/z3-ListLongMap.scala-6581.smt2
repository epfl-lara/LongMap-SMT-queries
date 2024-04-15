; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83352 () Bool)

(assert start!83352)

(declare-fun b_free!19363 () Bool)

(declare-fun b_next!19363 () Bool)

(assert (=> start!83352 (= b_free!19363 (not b_next!19363))))

(declare-fun tp!67368 () Bool)

(declare-fun b_and!30921 () Bool)

(assert (=> start!83352 (= tp!67368 b_and!30921)))

(declare-fun b!973252 () Bool)

(declare-fun res!651525 () Bool)

(declare-fun e!548575 () Bool)

(assert (=> b!973252 (=> (not res!651525) (not e!548575))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34665 0))(
  ( (V!34666 (val!11181 Int)) )
))
(declare-datatypes ((ValueCell!10649 0))(
  ( (ValueCellFull!10649 (v!13739 V!34665)) (EmptyCell!10649) )
))
(declare-datatypes ((array!60492 0))(
  ( (array!60493 (arr!29110 (Array (_ BitVec 32) ValueCell!10649)) (size!29591 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60492)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60494 0))(
  ( (array!60495 (arr!29111 (Array (_ BitVec 32) (_ BitVec 64))) (size!29592 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60494)

(assert (=> b!973252 (= res!651525 (and (= (size!29591 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29592 _keys!1717) (size!29591 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973253 () Bool)

(declare-fun e!548574 () Bool)

(assert (=> b!973253 (= e!548575 e!548574)))

(declare-fun res!651519 () Bool)

(assert (=> b!973253 (=> (not res!651519) (not e!548574))))

(declare-datatypes ((tuple2!14428 0))(
  ( (tuple2!14429 (_1!7225 (_ BitVec 64)) (_2!7225 V!34665)) )
))
(declare-datatypes ((List!20237 0))(
  ( (Nil!20234) (Cons!20233 (h!21395 tuple2!14428) (t!28689 List!20237)) )
))
(declare-datatypes ((ListLongMap!13115 0))(
  ( (ListLongMap!13116 (toList!6573 List!20237)) )
))
(declare-fun lt!432295 () ListLongMap!13115)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5614 (ListLongMap!13115 (_ BitVec 64)) Bool)

(assert (=> b!973253 (= res!651519 (contains!5614 lt!432295 (select (arr!29111 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34665)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34665)

(declare-fun getCurrentListMap!3735 (array!60494 array!60492 (_ BitVec 32) (_ BitVec 32) V!34665 V!34665 (_ BitVec 32) Int) ListLongMap!13115)

(assert (=> b!973253 (= lt!432295 (getCurrentListMap!3735 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973254 () Bool)

(declare-fun e!548577 () Bool)

(declare-fun tp_is_empty!22261 () Bool)

(assert (=> b!973254 (= e!548577 tp_is_empty!22261)))

(declare-fun b!973255 () Bool)

(declare-fun res!651521 () Bool)

(assert (=> b!973255 (=> (not res!651521) (not e!548575))))

(declare-datatypes ((List!20238 0))(
  ( (Nil!20235) (Cons!20234 (h!21396 (_ BitVec 64)) (t!28690 List!20238)) )
))
(declare-fun arrayNoDuplicates!0 (array!60494 (_ BitVec 32) List!20238) Bool)

(assert (=> b!973255 (= res!651521 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20235))))

(declare-fun b!973256 () Bool)

(declare-fun res!651523 () Bool)

(assert (=> b!973256 (=> (not res!651523) (not e!548575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60494 (_ BitVec 32)) Bool)

(assert (=> b!973256 (= res!651523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973257 () Bool)

(declare-fun e!548578 () Bool)

(assert (=> b!973257 (= e!548578 tp_is_empty!22261)))

(declare-fun b!973258 () Bool)

(declare-fun res!651526 () Bool)

(assert (=> b!973258 (=> (not res!651526) (not e!548575))))

(assert (=> b!973258 (= res!651526 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29592 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29592 _keys!1717))))))

(declare-fun res!651520 () Bool)

(assert (=> start!83352 (=> (not res!651520) (not e!548575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83352 (= res!651520 (validMask!0 mask!2147))))

(assert (=> start!83352 e!548575))

(assert (=> start!83352 true))

(declare-fun e!548576 () Bool)

(declare-fun array_inv!22575 (array!60492) Bool)

(assert (=> start!83352 (and (array_inv!22575 _values!1425) e!548576)))

(assert (=> start!83352 tp_is_empty!22261))

(assert (=> start!83352 tp!67368))

(declare-fun array_inv!22576 (array!60494) Bool)

(assert (=> start!83352 (array_inv!22576 _keys!1717)))

(declare-fun b!973259 () Bool)

(declare-fun mapRes!35401 () Bool)

(assert (=> b!973259 (= e!548576 (and e!548578 mapRes!35401))))

(declare-fun condMapEmpty!35401 () Bool)

(declare-fun mapDefault!35401 () ValueCell!10649)

(assert (=> b!973259 (= condMapEmpty!35401 (= (arr!29110 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10649)) mapDefault!35401)))))

(declare-fun b!973260 () Bool)

(declare-fun res!651522 () Bool)

(assert (=> b!973260 (=> (not res!651522) (not e!548575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973260 (= res!651522 (validKeyInArray!0 (select (arr!29111 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35401 () Bool)

(declare-fun tp!67369 () Bool)

(assert (=> mapNonEmpty!35401 (= mapRes!35401 (and tp!67369 e!548577))))

(declare-fun mapRest!35401 () (Array (_ BitVec 32) ValueCell!10649))

(declare-fun mapValue!35401 () ValueCell!10649)

(declare-fun mapKey!35401 () (_ BitVec 32))

(assert (=> mapNonEmpty!35401 (= (arr!29110 _values!1425) (store mapRest!35401 mapKey!35401 mapValue!35401))))

(declare-fun b!973261 () Bool)

(declare-fun e!548580 () Bool)

(assert (=> b!973261 (= e!548574 e!548580)))

(declare-fun res!651524 () Bool)

(assert (=> b!973261 (=> (not res!651524) (not e!548580))))

(declare-fun lt!432299 () (_ BitVec 64))

(assert (=> b!973261 (= res!651524 (validKeyInArray!0 lt!432299))))

(assert (=> b!973261 (= lt!432299 (select (arr!29111 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432300 () ListLongMap!13115)

(assert (=> b!973261 (= lt!432300 (getCurrentListMap!3735 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35401 () Bool)

(assert (=> mapIsEmpty!35401 mapRes!35401))

(declare-fun b!973262 () Bool)

(assert (=> b!973262 (= e!548580 (not true))))

(declare-fun lt!432298 () tuple2!14428)

(declare-fun +!2926 (ListLongMap!13115 tuple2!14428) ListLongMap!13115)

(assert (=> b!973262 (contains!5614 (+!2926 lt!432295 lt!432298) (select (arr!29111 _keys!1717) i!822))))

(declare-datatypes ((Unit!32304 0))(
  ( (Unit!32305) )
))
(declare-fun lt!432294 () Unit!32304)

(declare-fun lt!432297 () V!34665)

(declare-fun addStillContains!596 (ListLongMap!13115 (_ BitVec 64) V!34665 (_ BitVec 64)) Unit!32304)

(assert (=> b!973262 (= lt!432294 (addStillContains!596 lt!432295 lt!432299 lt!432297 (select (arr!29111 _keys!1717) i!822)))))

(assert (=> b!973262 (= lt!432300 (+!2926 (getCurrentListMap!3735 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432298))))

(assert (=> b!973262 (= lt!432298 (tuple2!14429 lt!432299 lt!432297))))

(declare-fun get!15099 (ValueCell!10649 V!34665) V!34665)

(declare-fun dynLambda!1682 (Int (_ BitVec 64)) V!34665)

(assert (=> b!973262 (= lt!432297 (get!15099 (select (arr!29110 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1682 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432296 () Unit!32304)

(declare-fun lemmaListMapRecursiveValidKeyArray!266 (array!60494 array!60492 (_ BitVec 32) (_ BitVec 32) V!34665 V!34665 (_ BitVec 32) Int) Unit!32304)

(assert (=> b!973262 (= lt!432296 (lemmaListMapRecursiveValidKeyArray!266 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83352 res!651520) b!973252))

(assert (= (and b!973252 res!651525) b!973256))

(assert (= (and b!973256 res!651523) b!973255))

(assert (= (and b!973255 res!651521) b!973258))

(assert (= (and b!973258 res!651526) b!973260))

(assert (= (and b!973260 res!651522) b!973253))

(assert (= (and b!973253 res!651519) b!973261))

(assert (= (and b!973261 res!651524) b!973262))

(assert (= (and b!973259 condMapEmpty!35401) mapIsEmpty!35401))

(assert (= (and b!973259 (not condMapEmpty!35401)) mapNonEmpty!35401))

(get-info :version)

(assert (= (and mapNonEmpty!35401 ((_ is ValueCellFull!10649) mapValue!35401)) b!973254))

(assert (= (and b!973259 ((_ is ValueCellFull!10649) mapDefault!35401)) b!973257))

(assert (= start!83352 b!973259))

(declare-fun b_lambda!14509 () Bool)

(assert (=> (not b_lambda!14509) (not b!973262)))

(declare-fun t!28688 () Bool)

(declare-fun tb!6303 () Bool)

(assert (=> (and start!83352 (= defaultEntry!1428 defaultEntry!1428) t!28688) tb!6303))

(declare-fun result!12591 () Bool)

(assert (=> tb!6303 (= result!12591 tp_is_empty!22261)))

(assert (=> b!973262 t!28688))

(declare-fun b_and!30923 () Bool)

(assert (= b_and!30921 (and (=> t!28688 result!12591) b_and!30923)))

(declare-fun m!900341 () Bool)

(assert (=> b!973262 m!900341))

(declare-fun m!900343 () Bool)

(assert (=> b!973262 m!900343))

(declare-fun m!900345 () Bool)

(assert (=> b!973262 m!900345))

(declare-fun m!900347 () Bool)

(assert (=> b!973262 m!900347))

(assert (=> b!973262 m!900343))

(declare-fun m!900349 () Bool)

(assert (=> b!973262 m!900349))

(declare-fun m!900351 () Bool)

(assert (=> b!973262 m!900351))

(assert (=> b!973262 m!900341))

(assert (=> b!973262 m!900347))

(declare-fun m!900353 () Bool)

(assert (=> b!973262 m!900353))

(assert (=> b!973262 m!900349))

(declare-fun m!900355 () Bool)

(assert (=> b!973262 m!900355))

(declare-fun m!900357 () Bool)

(assert (=> b!973262 m!900357))

(assert (=> b!973262 m!900349))

(assert (=> b!973262 m!900345))

(declare-fun m!900359 () Bool)

(assert (=> b!973262 m!900359))

(declare-fun m!900361 () Bool)

(assert (=> b!973255 m!900361))

(declare-fun m!900363 () Bool)

(assert (=> b!973261 m!900363))

(declare-fun m!900365 () Bool)

(assert (=> b!973261 m!900365))

(declare-fun m!900367 () Bool)

(assert (=> b!973261 m!900367))

(assert (=> b!973253 m!900349))

(assert (=> b!973253 m!900349))

(declare-fun m!900369 () Bool)

(assert (=> b!973253 m!900369))

(declare-fun m!900371 () Bool)

(assert (=> b!973253 m!900371))

(assert (=> b!973260 m!900349))

(assert (=> b!973260 m!900349))

(declare-fun m!900373 () Bool)

(assert (=> b!973260 m!900373))

(declare-fun m!900375 () Bool)

(assert (=> start!83352 m!900375))

(declare-fun m!900377 () Bool)

(assert (=> start!83352 m!900377))

(declare-fun m!900379 () Bool)

(assert (=> start!83352 m!900379))

(declare-fun m!900381 () Bool)

(assert (=> b!973256 m!900381))

(declare-fun m!900383 () Bool)

(assert (=> mapNonEmpty!35401 m!900383))

(check-sat (not b!973261) (not b!973253) (not b!973255) b_and!30923 (not mapNonEmpty!35401) (not b_lambda!14509) (not b_next!19363) tp_is_empty!22261 (not b!973260) (not b!973262) (not b!973256) (not start!83352))
(check-sat b_and!30923 (not b_next!19363))

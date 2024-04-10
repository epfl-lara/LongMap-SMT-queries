; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83832 () Bool)

(assert start!83832)

(declare-fun b_free!19641 () Bool)

(declare-fun b_next!19641 () Bool)

(assert (=> start!83832 (= b_free!19641 (not b_next!19641))))

(declare-fun tp!68365 () Bool)

(declare-fun b_and!31371 () Bool)

(assert (=> start!83832 (= tp!68365 b_and!31371)))

(declare-fun b!979261 () Bool)

(declare-fun e!552024 () Bool)

(declare-fun e!552019 () Bool)

(declare-fun mapRes!35981 () Bool)

(assert (=> b!979261 (= e!552024 (and e!552019 mapRes!35981))))

(declare-fun condMapEmpty!35981 () Bool)

(declare-datatypes ((V!35163 0))(
  ( (V!35164 (val!11368 Int)) )
))
(declare-datatypes ((ValueCell!10836 0))(
  ( (ValueCellFull!10836 (v!13930 V!35163)) (EmptyCell!10836) )
))
(declare-datatypes ((array!61289 0))(
  ( (array!61290 (arr!29502 (Array (_ BitVec 32) ValueCell!10836)) (size!29981 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61289)

(declare-fun mapDefault!35981 () ValueCell!10836)

(assert (=> b!979261 (= condMapEmpty!35981 (= (arr!29502 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10836)) mapDefault!35981)))))

(declare-fun b!979262 () Bool)

(declare-fun res!655347 () Bool)

(declare-fun e!552022 () Bool)

(assert (=> b!979262 (=> (not res!655347) (not e!552022))))

(declare-datatypes ((array!61291 0))(
  ( (array!61292 (arr!29503 (Array (_ BitVec 32) (_ BitVec 64))) (size!29982 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61291)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61291 (_ BitVec 32)) Bool)

(assert (=> b!979262 (= res!655347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979263 () Bool)

(declare-fun tp_is_empty!22635 () Bool)

(assert (=> b!979263 (= e!552019 tp_is_empty!22635)))

(declare-fun b!979264 () Bool)

(declare-fun e!552023 () Bool)

(assert (=> b!979264 (= e!552023 true)))

(declare-datatypes ((tuple2!14584 0))(
  ( (tuple2!14585 (_1!7303 (_ BitVec 64)) (_2!7303 V!35163)) )
))
(declare-fun lt!434302 () tuple2!14584)

(declare-datatypes ((List!20453 0))(
  ( (Nil!20450) (Cons!20449 (h!21611 tuple2!14584) (t!29050 List!20453)) )
))
(declare-datatypes ((ListLongMap!13281 0))(
  ( (ListLongMap!13282 (toList!6656 List!20453)) )
))
(declare-fun lt!434308 () ListLongMap!13281)

(declare-fun lt!434307 () tuple2!14584)

(declare-fun lt!434301 () ListLongMap!13281)

(declare-fun +!2961 (ListLongMap!13281 tuple2!14584) ListLongMap!13281)

(assert (=> b!979264 (= lt!434308 (+!2961 (+!2961 lt!434301 lt!434307) lt!434302))))

(declare-fun lt!434304 () V!35163)

(declare-fun zeroValue!1220 () V!35163)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((Unit!32561 0))(
  ( (Unit!32562) )
))
(declare-fun lt!434305 () Unit!32561)

(declare-fun addCommutativeForDiffKeys!589 (ListLongMap!13281 (_ BitVec 64) V!35163 (_ BitVec 64) V!35163) Unit!32561)

(assert (=> b!979264 (= lt!434305 (addCommutativeForDiffKeys!589 lt!434301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29503 _keys!1544) from!1932) lt!434304))))

(declare-fun b!979265 () Bool)

(declare-fun res!655346 () Bool)

(assert (=> b!979265 (=> (not res!655346) (not e!552022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979265 (= res!655346 (validKeyInArray!0 (select (arr!29503 _keys!1544) from!1932)))))

(declare-fun res!655342 () Bool)

(assert (=> start!83832 (=> (not res!655342) (not e!552022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83832 (= res!655342 (validMask!0 mask!1948))))

(assert (=> start!83832 e!552022))

(assert (=> start!83832 true))

(assert (=> start!83832 tp_is_empty!22635))

(declare-fun array_inv!22811 (array!61289) Bool)

(assert (=> start!83832 (and (array_inv!22811 _values!1278) e!552024)))

(assert (=> start!83832 tp!68365))

(declare-fun array_inv!22812 (array!61291) Bool)

(assert (=> start!83832 (array_inv!22812 _keys!1544)))

(declare-fun b!979266 () Bool)

(declare-fun res!655348 () Bool)

(assert (=> b!979266 (=> (not res!655348) (not e!552022))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979266 (= res!655348 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979267 () Bool)

(declare-fun res!655343 () Bool)

(assert (=> b!979267 (=> (not res!655343) (not e!552022))))

(assert (=> b!979267 (= res!655343 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29982 _keys!1544))))))

(declare-fun b!979268 () Bool)

(declare-fun res!655349 () Bool)

(assert (=> b!979268 (=> (not res!655349) (not e!552022))))

(declare-datatypes ((List!20454 0))(
  ( (Nil!20451) (Cons!20450 (h!21612 (_ BitVec 64)) (t!29051 List!20454)) )
))
(declare-fun arrayNoDuplicates!0 (array!61291 (_ BitVec 32) List!20454) Bool)

(assert (=> b!979268 (= res!655349 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20451))))

(declare-fun mapNonEmpty!35981 () Bool)

(declare-fun tp!68364 () Bool)

(declare-fun e!552021 () Bool)

(assert (=> mapNonEmpty!35981 (= mapRes!35981 (and tp!68364 e!552021))))

(declare-fun mapKey!35981 () (_ BitVec 32))

(declare-fun mapRest!35981 () (Array (_ BitVec 32) ValueCell!10836))

(declare-fun mapValue!35981 () ValueCell!10836)

(assert (=> mapNonEmpty!35981 (= (arr!29502 _values!1278) (store mapRest!35981 mapKey!35981 mapValue!35981))))

(declare-fun b!979269 () Bool)

(assert (=> b!979269 (= e!552022 (not e!552023))))

(declare-fun res!655344 () Bool)

(assert (=> b!979269 (=> res!655344 e!552023)))

(assert (=> b!979269 (= res!655344 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29503 _keys!1544) from!1932)))))

(declare-fun lt!434300 () tuple2!14584)

(declare-fun lt!434306 () ListLongMap!13281)

(assert (=> b!979269 (= (+!2961 lt!434306 lt!434307) (+!2961 lt!434308 lt!434300))))

(declare-fun lt!434303 () ListLongMap!13281)

(assert (=> b!979269 (= lt!434308 (+!2961 lt!434303 lt!434307))))

(assert (=> b!979269 (= lt!434307 (tuple2!14585 (select (arr!29503 _keys!1544) from!1932) lt!434304))))

(assert (=> b!979269 (= lt!434306 (+!2961 lt!434303 lt!434300))))

(declare-fun minValue!1220 () V!35163)

(assert (=> b!979269 (= lt!434300 (tuple2!14585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434309 () Unit!32561)

(assert (=> b!979269 (= lt!434309 (addCommutativeForDiffKeys!589 lt!434303 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29503 _keys!1544) from!1932) lt!434304))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15287 (ValueCell!10836 V!35163) V!35163)

(declare-fun dynLambda!1748 (Int (_ BitVec 64)) V!35163)

(assert (=> b!979269 (= lt!434304 (get!15287 (select (arr!29502 _values!1278) from!1932) (dynLambda!1748 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979269 (= lt!434303 (+!2961 lt!434301 lt!434302))))

(assert (=> b!979269 (= lt!434302 (tuple2!14585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3362 (array!61291 array!61289 (_ BitVec 32) (_ BitVec 32) V!35163 V!35163 (_ BitVec 32) Int) ListLongMap!13281)

(assert (=> b!979269 (= lt!434301 (getCurrentListMapNoExtraKeys!3362 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979270 () Bool)

(assert (=> b!979270 (= e!552021 tp_is_empty!22635)))

(declare-fun b!979271 () Bool)

(declare-fun res!655345 () Bool)

(assert (=> b!979271 (=> (not res!655345) (not e!552022))))

(assert (=> b!979271 (= res!655345 (and (= (size!29981 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29982 _keys!1544) (size!29981 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35981 () Bool)

(assert (=> mapIsEmpty!35981 mapRes!35981))

(assert (= (and start!83832 res!655342) b!979271))

(assert (= (and b!979271 res!655345) b!979262))

(assert (= (and b!979262 res!655347) b!979268))

(assert (= (and b!979268 res!655349) b!979267))

(assert (= (and b!979267 res!655343) b!979265))

(assert (= (and b!979265 res!655346) b!979266))

(assert (= (and b!979266 res!655348) b!979269))

(assert (= (and b!979269 (not res!655344)) b!979264))

(assert (= (and b!979261 condMapEmpty!35981) mapIsEmpty!35981))

(assert (= (and b!979261 (not condMapEmpty!35981)) mapNonEmpty!35981))

(get-info :version)

(assert (= (and mapNonEmpty!35981 ((_ is ValueCellFull!10836) mapValue!35981)) b!979270))

(assert (= (and b!979261 ((_ is ValueCellFull!10836) mapDefault!35981)) b!979263))

(assert (= start!83832 b!979261))

(declare-fun b_lambda!14685 () Bool)

(assert (=> (not b_lambda!14685) (not b!979269)))

(declare-fun t!29049 () Bool)

(declare-fun tb!6447 () Bool)

(assert (=> (and start!83832 (= defaultEntry!1281 defaultEntry!1281) t!29049) tb!6447))

(declare-fun result!12883 () Bool)

(assert (=> tb!6447 (= result!12883 tp_is_empty!22635)))

(assert (=> b!979269 t!29049))

(declare-fun b_and!31373 () Bool)

(assert (= b_and!31371 (and (=> t!29049 result!12883) b_and!31373)))

(declare-fun m!906535 () Bool)

(assert (=> b!979264 m!906535))

(assert (=> b!979264 m!906535))

(declare-fun m!906537 () Bool)

(assert (=> b!979264 m!906537))

(declare-fun m!906539 () Bool)

(assert (=> b!979264 m!906539))

(assert (=> b!979264 m!906539))

(declare-fun m!906541 () Bool)

(assert (=> b!979264 m!906541))

(declare-fun m!906543 () Bool)

(assert (=> start!83832 m!906543))

(declare-fun m!906545 () Bool)

(assert (=> start!83832 m!906545))

(declare-fun m!906547 () Bool)

(assert (=> start!83832 m!906547))

(declare-fun m!906549 () Bool)

(assert (=> b!979269 m!906549))

(declare-fun m!906551 () Bool)

(assert (=> b!979269 m!906551))

(declare-fun m!906553 () Bool)

(assert (=> b!979269 m!906553))

(declare-fun m!906555 () Bool)

(assert (=> b!979269 m!906555))

(declare-fun m!906557 () Bool)

(assert (=> b!979269 m!906557))

(assert (=> b!979269 m!906539))

(declare-fun m!906559 () Bool)

(assert (=> b!979269 m!906559))

(assert (=> b!979269 m!906539))

(declare-fun m!906561 () Bool)

(assert (=> b!979269 m!906561))

(declare-fun m!906563 () Bool)

(assert (=> b!979269 m!906563))

(declare-fun m!906565 () Bool)

(assert (=> b!979269 m!906565))

(assert (=> b!979269 m!906549))

(assert (=> b!979269 m!906565))

(declare-fun m!906567 () Bool)

(assert (=> b!979269 m!906567))

(assert (=> b!979265 m!906539))

(assert (=> b!979265 m!906539))

(declare-fun m!906569 () Bool)

(assert (=> b!979265 m!906569))

(declare-fun m!906571 () Bool)

(assert (=> b!979262 m!906571))

(declare-fun m!906573 () Bool)

(assert (=> mapNonEmpty!35981 m!906573))

(declare-fun m!906575 () Bool)

(assert (=> b!979268 m!906575))

(check-sat (not start!83832) (not b_next!19641) (not b!979265) (not mapNonEmpty!35981) (not b!979262) (not b_lambda!14685) (not b!979264) tp_is_empty!22635 b_and!31373 (not b!979269) (not b!979268))
(check-sat b_and!31373 (not b_next!19641))

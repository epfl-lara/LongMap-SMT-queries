; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78896 () Bool)

(assert start!78896)

(declare-fun b_free!17109 () Bool)

(declare-fun b_next!17109 () Bool)

(assert (=> start!78896 (= b_free!17109 (not b_next!17109))))

(declare-fun tp!59768 () Bool)

(declare-fun b_and!27955 () Bool)

(assert (=> start!78896 (= tp!59768 b_and!27955)))

(declare-fun b!922283 () Bool)

(declare-fun res!621943 () Bool)

(declare-fun e!517500 () Bool)

(assert (=> b!922283 (=> (not res!621943) (not e!517500))))

(declare-datatypes ((array!55210 0))(
  ( (array!55211 (arr!26550 (Array (_ BitVec 32) (_ BitVec 64))) (size!27009 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55210)

(declare-datatypes ((List!18630 0))(
  ( (Nil!18627) (Cons!18626 (h!19772 (_ BitVec 64)) (t!26469 List!18630)) )
))
(declare-fun arrayNoDuplicates!0 (array!55210 (_ BitVec 32) List!18630) Bool)

(assert (=> b!922283 (= res!621943 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18627))))

(declare-fun b!922284 () Bool)

(declare-fun res!621950 () Bool)

(declare-fun e!517501 () Bool)

(assert (=> b!922284 (=> (not res!621950) (not e!517501))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31121 0))(
  ( (V!31122 (val!9859 Int)) )
))
(declare-fun v!791 () V!31121)

(declare-datatypes ((tuple2!12826 0))(
  ( (tuple2!12827 (_1!6424 (_ BitVec 64)) (_2!6424 V!31121)) )
))
(declare-datatypes ((List!18631 0))(
  ( (Nil!18628) (Cons!18627 (h!19773 tuple2!12826) (t!26470 List!18631)) )
))
(declare-datatypes ((ListLongMap!11523 0))(
  ( (ListLongMap!11524 (toList!5777 List!18631)) )
))
(declare-fun lt!414154 () ListLongMap!11523)

(declare-fun apply!614 (ListLongMap!11523 (_ BitVec 64)) V!31121)

(assert (=> b!922284 (= res!621950 (= (apply!614 lt!414154 k0!1099) v!791))))

(declare-fun b!922285 () Bool)

(declare-fun res!621947 () Bool)

(assert (=> b!922285 (=> (not res!621947) (not e!517500))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9327 0))(
  ( (ValueCellFull!9327 (v!12377 V!31121)) (EmptyCell!9327) )
))
(declare-datatypes ((array!55212 0))(
  ( (array!55213 (arr!26551 (Array (_ BitVec 32) ValueCell!9327)) (size!27010 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55212)

(assert (=> b!922285 (= res!621947 (and (= (size!27010 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27009 _keys!1487) (size!27010 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922286 () Bool)

(declare-fun e!517504 () Bool)

(declare-fun tp_is_empty!19617 () Bool)

(assert (=> b!922286 (= e!517504 tp_is_empty!19617)))

(declare-fun b!922287 () Bool)

(declare-fun res!621949 () Bool)

(assert (=> b!922287 (=> (not res!621949) (not e!517500))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922287 (= res!621949 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27009 _keys!1487))))))

(declare-fun res!621948 () Bool)

(assert (=> start!78896 (=> (not res!621948) (not e!517500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78896 (= res!621948 (validMask!0 mask!1881))))

(assert (=> start!78896 e!517500))

(assert (=> start!78896 true))

(assert (=> start!78896 tp_is_empty!19617))

(declare-fun e!517497 () Bool)

(declare-fun array_inv!20682 (array!55212) Bool)

(assert (=> start!78896 (and (array_inv!20682 _values!1231) e!517497)))

(assert (=> start!78896 tp!59768))

(declare-fun array_inv!20683 (array!55210) Bool)

(assert (=> start!78896 (array_inv!20683 _keys!1487)))

(declare-fun b!922288 () Bool)

(assert (=> b!922288 (= e!517500 e!517501)))

(declare-fun res!621945 () Bool)

(assert (=> b!922288 (=> (not res!621945) (not e!517501))))

(declare-fun contains!4840 (ListLongMap!11523 (_ BitVec 64)) Bool)

(assert (=> b!922288 (= res!621945 (contains!4840 lt!414154 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31121)

(declare-fun minValue!1173 () V!31121)

(declare-fun getCurrentListMap!3031 (array!55210 array!55212 (_ BitVec 32) (_ BitVec 32) V!31121 V!31121 (_ BitVec 32) Int) ListLongMap!11523)

(assert (=> b!922288 (= lt!414154 (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922289 () Bool)

(declare-fun e!517499 () Bool)

(declare-fun mapRes!31182 () Bool)

(assert (=> b!922289 (= e!517497 (and e!517499 mapRes!31182))))

(declare-fun condMapEmpty!31182 () Bool)

(declare-fun mapDefault!31182 () ValueCell!9327)

(assert (=> b!922289 (= condMapEmpty!31182 (= (arr!26551 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9327)) mapDefault!31182)))))

(declare-fun b!922290 () Bool)

(declare-fun res!621946 () Bool)

(assert (=> b!922290 (=> (not res!621946) (not e!517501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922290 (= res!621946 (validKeyInArray!0 k0!1099))))

(declare-fun b!922291 () Bool)

(declare-fun res!621951 () Bool)

(assert (=> b!922291 (=> (not res!621951) (not e!517500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55210 (_ BitVec 32)) Bool)

(assert (=> b!922291 (= res!621951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922292 () Bool)

(declare-fun res!621944 () Bool)

(assert (=> b!922292 (=> (not res!621944) (not e!517501))))

(assert (=> b!922292 (= res!621944 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31182 () Bool)

(declare-fun tp!59767 () Bool)

(assert (=> mapNonEmpty!31182 (= mapRes!31182 (and tp!59767 e!517504))))

(declare-fun mapValue!31182 () ValueCell!9327)

(declare-fun mapKey!31182 () (_ BitVec 32))

(declare-fun mapRest!31182 () (Array (_ BitVec 32) ValueCell!9327))

(assert (=> mapNonEmpty!31182 (= (arr!26551 _values!1231) (store mapRest!31182 mapKey!31182 mapValue!31182))))

(declare-fun b!922293 () Bool)

(assert (=> b!922293 (= e!517499 tp_is_empty!19617)))

(declare-fun b!922294 () Bool)

(declare-fun e!517502 () Bool)

(assert (=> b!922294 (= e!517502 (not true))))

(declare-fun lt!414153 () (_ BitVec 64))

(assert (=> b!922294 (not (= lt!414153 k0!1099))))

(declare-datatypes ((Unit!31114 0))(
  ( (Unit!31115) )
))
(declare-fun lt!414152 () Unit!31114)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55210 (_ BitVec 64) (_ BitVec 32) List!18630) Unit!31114)

(assert (=> b!922294 (= lt!414152 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18627))))

(declare-fun e!517503 () Bool)

(assert (=> b!922294 e!517503))

(declare-fun c!96165 () Bool)

(assert (=> b!922294 (= c!96165 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414149 () Unit!31114)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!190 (array!55210 array!55212 (_ BitVec 32) (_ BitVec 32) V!31121 V!31121 (_ BitVec 64) (_ BitVec 32) Int) Unit!31114)

(assert (=> b!922294 (= lt!414149 (lemmaListMapContainsThenArrayContainsFrom!190 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922294 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18627)))

(declare-fun lt!414151 () Unit!31114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55210 (_ BitVec 32) (_ BitVec 32)) Unit!31114)

(assert (=> b!922294 (= lt!414151 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414147 () tuple2!12826)

(declare-fun +!2683 (ListLongMap!11523 tuple2!12826) ListLongMap!11523)

(assert (=> b!922294 (contains!4840 (+!2683 lt!414154 lt!414147) k0!1099)))

(declare-fun lt!414148 () V!31121)

(declare-fun lt!414150 () Unit!31114)

(declare-fun addStillContains!407 (ListLongMap!11523 (_ BitVec 64) V!31121 (_ BitVec 64)) Unit!31114)

(assert (=> b!922294 (= lt!414150 (addStillContains!407 lt!414154 lt!414153 lt!414148 k0!1099))))

(assert (=> b!922294 (= (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2683 (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414147))))

(assert (=> b!922294 (= lt!414147 (tuple2!12827 lt!414153 lt!414148))))

(declare-fun get!13942 (ValueCell!9327 V!31121) V!31121)

(declare-fun dynLambda!1472 (Int (_ BitVec 64)) V!31121)

(assert (=> b!922294 (= lt!414148 (get!13942 (select (arr!26551 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1472 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414146 () Unit!31114)

(declare-fun lemmaListMapRecursiveValidKeyArray!73 (array!55210 array!55212 (_ BitVec 32) (_ BitVec 32) V!31121 V!31121 (_ BitVec 32) Int) Unit!31114)

(assert (=> b!922294 (= lt!414146 (lemmaListMapRecursiveValidKeyArray!73 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922295 () Bool)

(assert (=> b!922295 (= e!517501 e!517502)))

(declare-fun res!621952 () Bool)

(assert (=> b!922295 (=> (not res!621952) (not e!517502))))

(assert (=> b!922295 (= res!621952 (validKeyInArray!0 lt!414153))))

(assert (=> b!922295 (= lt!414153 (select (arr!26550 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922296 () Bool)

(declare-fun arrayContainsKey!0 (array!55210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922296 (= e!517503 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31182 () Bool)

(assert (=> mapIsEmpty!31182 mapRes!31182))

(declare-fun b!922297 () Bool)

(assert (=> b!922297 (= e!517503 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!78896 res!621948) b!922285))

(assert (= (and b!922285 res!621947) b!922291))

(assert (= (and b!922291 res!621951) b!922283))

(assert (= (and b!922283 res!621943) b!922287))

(assert (= (and b!922287 res!621949) b!922288))

(assert (= (and b!922288 res!621945) b!922284))

(assert (= (and b!922284 res!621950) b!922292))

(assert (= (and b!922292 res!621944) b!922290))

(assert (= (and b!922290 res!621946) b!922295))

(assert (= (and b!922295 res!621952) b!922294))

(assert (= (and b!922294 c!96165) b!922296))

(assert (= (and b!922294 (not c!96165)) b!922297))

(assert (= (and b!922289 condMapEmpty!31182) mapIsEmpty!31182))

(assert (= (and b!922289 (not condMapEmpty!31182)) mapNonEmpty!31182))

(get-info :version)

(assert (= (and mapNonEmpty!31182 ((_ is ValueCellFull!9327) mapValue!31182)) b!922286))

(assert (= (and b!922289 ((_ is ValueCellFull!9327) mapDefault!31182)) b!922293))

(assert (= start!78896 b!922289))

(declare-fun b_lambda!13611 () Bool)

(assert (=> (not b_lambda!13611) (not b!922294)))

(declare-fun t!26468 () Bool)

(declare-fun tb!5689 () Bool)

(assert (=> (and start!78896 (= defaultEntry!1235 defaultEntry!1235) t!26468) tb!5689))

(declare-fun result!11201 () Bool)

(assert (=> tb!5689 (= result!11201 tp_is_empty!19617)))

(assert (=> b!922294 t!26468))

(declare-fun b_and!27957 () Bool)

(assert (= b_and!27955 (and (=> t!26468 result!11201) b_and!27957)))

(declare-fun m!856329 () Bool)

(assert (=> b!922296 m!856329))

(declare-fun m!856331 () Bool)

(assert (=> b!922288 m!856331))

(declare-fun m!856333 () Bool)

(assert (=> b!922288 m!856333))

(declare-fun m!856335 () Bool)

(assert (=> b!922294 m!856335))

(declare-fun m!856337 () Bool)

(assert (=> b!922294 m!856337))

(assert (=> b!922294 m!856337))

(declare-fun m!856339 () Bool)

(assert (=> b!922294 m!856339))

(declare-fun m!856341 () Bool)

(assert (=> b!922294 m!856341))

(declare-fun m!856343 () Bool)

(assert (=> b!922294 m!856343))

(declare-fun m!856345 () Bool)

(assert (=> b!922294 m!856345))

(declare-fun m!856347 () Bool)

(assert (=> b!922294 m!856347))

(declare-fun m!856349 () Bool)

(assert (=> b!922294 m!856349))

(assert (=> b!922294 m!856347))

(assert (=> b!922294 m!856349))

(declare-fun m!856351 () Bool)

(assert (=> b!922294 m!856351))

(declare-fun m!856353 () Bool)

(assert (=> b!922294 m!856353))

(declare-fun m!856355 () Bool)

(assert (=> b!922294 m!856355))

(declare-fun m!856357 () Bool)

(assert (=> b!922294 m!856357))

(declare-fun m!856359 () Bool)

(assert (=> b!922294 m!856359))

(assert (=> b!922294 m!856343))

(declare-fun m!856361 () Bool)

(assert (=> b!922294 m!856361))

(declare-fun m!856363 () Bool)

(assert (=> mapNonEmpty!31182 m!856363))

(declare-fun m!856365 () Bool)

(assert (=> b!922295 m!856365))

(declare-fun m!856367 () Bool)

(assert (=> b!922295 m!856367))

(declare-fun m!856369 () Bool)

(assert (=> b!922284 m!856369))

(declare-fun m!856371 () Bool)

(assert (=> b!922291 m!856371))

(declare-fun m!856373 () Bool)

(assert (=> start!78896 m!856373))

(declare-fun m!856375 () Bool)

(assert (=> start!78896 m!856375))

(declare-fun m!856377 () Bool)

(assert (=> start!78896 m!856377))

(declare-fun m!856379 () Bool)

(assert (=> b!922290 m!856379))

(declare-fun m!856381 () Bool)

(assert (=> b!922283 m!856381))

(check-sat (not b!922294) (not b!922284) (not b_lambda!13611) (not mapNonEmpty!31182) (not start!78896) b_and!27957 (not b!922288) (not b_next!17109) (not b!922290) tp_is_empty!19617 (not b!922296) (not b!922295) (not b!922283) (not b!922291))
(check-sat b_and!27957 (not b_next!17109))

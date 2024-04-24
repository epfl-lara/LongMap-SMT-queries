; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79212 () Bool)

(assert start!79212)

(declare-fun b_free!17257 () Bool)

(declare-fun b_next!17257 () Bool)

(assert (=> start!79212 (= b_free!17257 (not b_next!17257))))

(declare-fun tp!60213 () Bool)

(declare-fun b_and!28261 () Bool)

(assert (=> start!79212 (= tp!60213 b_and!28261)))

(declare-fun mapNonEmpty!31404 () Bool)

(declare-fun mapRes!31404 () Bool)

(declare-fun tp!60212 () Bool)

(declare-fun e!520587 () Bool)

(assert (=> mapNonEmpty!31404 (= mapRes!31404 (and tp!60212 e!520587))))

(declare-datatypes ((V!31319 0))(
  ( (V!31320 (val!9933 Int)) )
))
(declare-datatypes ((ValueCell!9401 0))(
  ( (ValueCellFull!9401 (v!12448 V!31319)) (EmptyCell!9401) )
))
(declare-fun mapRest!31404 () (Array (_ BitVec 32) ValueCell!9401))

(declare-datatypes ((array!55547 0))(
  ( (array!55548 (arr!26714 (Array (_ BitVec 32) ValueCell!9401)) (size!27174 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55547)

(declare-fun mapValue!31404 () ValueCell!9401)

(declare-fun mapKey!31404 () (_ BitVec 32))

(assert (=> mapNonEmpty!31404 (= (arr!26714 _values!1231) (store mapRest!31404 mapKey!31404 mapValue!31404))))

(declare-fun b!927286 () Bool)

(declare-datatypes ((Unit!31310 0))(
  ( (Unit!31311) )
))
(declare-fun e!520585 () Unit!31310)

(declare-fun Unit!31312 () Unit!31310)

(assert (=> b!927286 (= e!520585 Unit!31312)))

(declare-fun b!927287 () Bool)

(declare-fun res!624483 () Bool)

(declare-fun e!520582 () Bool)

(assert (=> b!927287 (=> (not res!624483) (not e!520582))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31319)

(declare-datatypes ((tuple2!12948 0))(
  ( (tuple2!12949 (_1!6485 (_ BitVec 64)) (_2!6485 V!31319)) )
))
(declare-datatypes ((List!18758 0))(
  ( (Nil!18755) (Cons!18754 (h!19906 tuple2!12948) (t!26737 List!18758)) )
))
(declare-datatypes ((ListLongMap!11647 0))(
  ( (ListLongMap!11648 (toList!5839 List!18758)) )
))
(declare-fun lt!417556 () ListLongMap!11647)

(declare-fun apply!690 (ListLongMap!11647 (_ BitVec 64)) V!31319)

(assert (=> b!927287 (= res!624483 (= (apply!690 lt!417556 k0!1099) v!791))))

(declare-fun b!927288 () Bool)

(assert (=> b!927288 (= e!520582 (not true))))

(declare-fun e!520584 () Bool)

(assert (=> b!927288 e!520584))

(declare-fun res!624475 () Bool)

(assert (=> b!927288 (=> (not res!624475) (not e!520584))))

(declare-fun lt!417555 () ListLongMap!11647)

(declare-fun contains!4911 (ListLongMap!11647 (_ BitVec 64)) Bool)

(assert (=> b!927288 (= res!624475 (contains!4911 lt!417555 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!55549 0))(
  ( (array!55550 (arr!26715 (Array (_ BitVec 32) (_ BitVec 64))) (size!27175 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55549)

(declare-fun zeroValue!1173 () V!31319)

(declare-fun minValue!1173 () V!31319)

(declare-fun getCurrentListMap!3089 (array!55549 array!55547 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 32) Int) ListLongMap!11647)

(assert (=> b!927288 (= lt!417555 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417563 () Unit!31310)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!83 (array!55549 array!55547 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 64) V!31319 (_ BitVec 32) Int) Unit!31310)

(assert (=> b!927288 (= lt!417563 (lemmaListMapApplyFromThenApplyFromZero!83 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927289 () Bool)

(declare-fun e!520581 () Bool)

(declare-fun e!520579 () Bool)

(assert (=> b!927289 (= e!520581 (and e!520579 mapRes!31404))))

(declare-fun condMapEmpty!31404 () Bool)

(declare-fun mapDefault!31404 () ValueCell!9401)

(assert (=> b!927289 (= condMapEmpty!31404 (= (arr!26714 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9401)) mapDefault!31404)))))

(declare-fun res!624477 () Bool)

(declare-fun e!520580 () Bool)

(assert (=> start!79212 (=> (not res!624477) (not e!520580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79212 (= res!624477 (validMask!0 mask!1881))))

(assert (=> start!79212 e!520580))

(assert (=> start!79212 true))

(declare-fun tp_is_empty!19765 () Bool)

(assert (=> start!79212 tp_is_empty!19765))

(declare-fun array_inv!20904 (array!55547) Bool)

(assert (=> start!79212 (and (array_inv!20904 _values!1231) e!520581)))

(assert (=> start!79212 tp!60213))

(declare-fun array_inv!20905 (array!55549) Bool)

(assert (=> start!79212 (array_inv!20905 _keys!1487)))

(declare-fun b!927290 () Bool)

(declare-fun e!520583 () Bool)

(declare-fun e!520588 () Bool)

(assert (=> b!927290 (= e!520583 e!520588)))

(declare-fun res!624476 () Bool)

(assert (=> b!927290 (=> (not res!624476) (not e!520588))))

(declare-fun lt!417559 () V!31319)

(assert (=> b!927290 (= res!624476 (and (= lt!417559 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!417566 () ListLongMap!11647)

(assert (=> b!927290 (= lt!417559 (apply!690 lt!417566 k0!1099))))

(declare-fun b!927291 () Bool)

(assert (=> b!927291 (= e!520584 (= (apply!690 lt!417555 k0!1099) v!791))))

(declare-fun e!520578 () Bool)

(declare-fun b!927292 () Bool)

(declare-fun arrayContainsKey!0 (array!55549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927292 (= e!520578 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927293 () Bool)

(assert (=> b!927293 (= e!520578 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927294 () Bool)

(declare-fun e!520576 () Bool)

(assert (=> b!927294 (= e!520576 e!520582)))

(declare-fun res!624473 () Bool)

(assert (=> b!927294 (=> (not res!624473) (not e!520582))))

(assert (=> b!927294 (= res!624473 (contains!4911 lt!417556 k0!1099))))

(assert (=> b!927294 (= lt!417556 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927295 () Bool)

(declare-fun res!624479 () Bool)

(assert (=> b!927295 (=> (not res!624479) (not e!520580))))

(assert (=> b!927295 (= res!624479 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27175 _keys!1487))))))

(declare-fun b!927296 () Bool)

(declare-fun e!520586 () Unit!31310)

(declare-fun Unit!31313 () Unit!31310)

(assert (=> b!927296 (= e!520586 Unit!31313)))

(declare-fun b!927297 () Bool)

(declare-fun res!624481 () Bool)

(assert (=> b!927297 (=> (not res!624481) (not e!520580))))

(declare-datatypes ((List!18759 0))(
  ( (Nil!18756) (Cons!18755 (h!19907 (_ BitVec 64)) (t!26738 List!18759)) )
))
(declare-fun arrayNoDuplicates!0 (array!55549 (_ BitVec 32) List!18759) Bool)

(assert (=> b!927297 (= res!624481 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18756))))

(declare-fun mapIsEmpty!31404 () Bool)

(assert (=> mapIsEmpty!31404 mapRes!31404))

(declare-fun b!927298 () Bool)

(assert (=> b!927298 (= e!520580 e!520583)))

(declare-fun res!624478 () Bool)

(assert (=> b!927298 (=> (not res!624478) (not e!520583))))

(assert (=> b!927298 (= res!624478 (contains!4911 lt!417566 k0!1099))))

(assert (=> b!927298 (= lt!417566 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927299 () Bool)

(assert (=> b!927299 (= e!520585 e!520586)))

(declare-fun lt!417562 () (_ BitVec 64))

(assert (=> b!927299 (= lt!417562 (select (arr!26715 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96999 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927299 (= c!96999 (validKeyInArray!0 lt!417562))))

(declare-fun b!927300 () Bool)

(declare-fun res!624474 () Bool)

(assert (=> b!927300 (=> (not res!624474) (not e!520580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55549 (_ BitVec 32)) Bool)

(assert (=> b!927300 (= res!624474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927301 () Bool)

(declare-fun res!624480 () Bool)

(assert (=> b!927301 (=> (not res!624480) (not e!520580))))

(assert (=> b!927301 (= res!624480 (and (= (size!27174 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27175 _keys!1487) (size!27174 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927302 () Bool)

(assert (=> b!927302 (= e!520587 tp_is_empty!19765)))

(declare-fun b!927303 () Bool)

(assert (=> b!927303 (= e!520588 e!520576)))

(declare-fun res!624482 () Bool)

(assert (=> b!927303 (=> (not res!624482) (not e!520576))))

(assert (=> b!927303 (= res!624482 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27175 _keys!1487)))))

(declare-fun lt!417560 () Unit!31310)

(assert (=> b!927303 (= lt!417560 e!520585)))

(declare-fun c!96997 () Bool)

(assert (=> b!927303 (= c!96997 (validKeyInArray!0 k0!1099))))

(declare-fun b!927304 () Bool)

(declare-fun lt!417567 () ListLongMap!11647)

(assert (=> b!927304 (= (apply!690 lt!417567 k0!1099) lt!417559)))

(declare-fun lt!417561 () Unit!31310)

(declare-fun lt!417564 () V!31319)

(declare-fun addApplyDifferent!388 (ListLongMap!11647 (_ BitVec 64) V!31319 (_ BitVec 64)) Unit!31310)

(assert (=> b!927304 (= lt!417561 (addApplyDifferent!388 lt!417566 lt!417562 lt!417564 k0!1099))))

(assert (=> b!927304 (not (= lt!417562 k0!1099))))

(declare-fun lt!417554 () Unit!31310)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55549 (_ BitVec 64) (_ BitVec 32) List!18759) Unit!31310)

(assert (=> b!927304 (= lt!417554 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18756))))

(assert (=> b!927304 e!520578))

(declare-fun c!96998 () Bool)

(assert (=> b!927304 (= c!96998 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417557 () Unit!31310)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!243 (array!55549 array!55547 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 64) (_ BitVec 32) Int) Unit!31310)

(assert (=> b!927304 (= lt!417557 (lemmaListMapContainsThenArrayContainsFrom!243 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927304 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18756)))

(declare-fun lt!417568 () Unit!31310)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55549 (_ BitVec 32) (_ BitVec 32)) Unit!31310)

(assert (=> b!927304 (= lt!417568 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927304 (contains!4911 lt!417567 k0!1099)))

(declare-fun lt!417569 () tuple2!12948)

(declare-fun +!2752 (ListLongMap!11647 tuple2!12948) ListLongMap!11647)

(assert (=> b!927304 (= lt!417567 (+!2752 lt!417566 lt!417569))))

(declare-fun lt!417558 () Unit!31310)

(declare-fun addStillContains!461 (ListLongMap!11647 (_ BitVec 64) V!31319 (_ BitVec 64)) Unit!31310)

(assert (=> b!927304 (= lt!417558 (addStillContains!461 lt!417566 lt!417562 lt!417564 k0!1099))))

(assert (=> b!927304 (= (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2752 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417569))))

(assert (=> b!927304 (= lt!417569 (tuple2!12949 lt!417562 lt!417564))))

(declare-fun get!14073 (ValueCell!9401 V!31319) V!31319)

(declare-fun dynLambda!1549 (Int (_ BitVec 64)) V!31319)

(assert (=> b!927304 (= lt!417564 (get!14073 (select (arr!26714 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1549 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417565 () Unit!31310)

(declare-fun lemmaListMapRecursiveValidKeyArray!132 (array!55549 array!55547 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 32) Int) Unit!31310)

(assert (=> b!927304 (= lt!417565 (lemmaListMapRecursiveValidKeyArray!132 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927304 (= e!520586 lt!417561)))

(declare-fun b!927305 () Bool)

(assert (=> b!927305 (= e!520579 tp_is_empty!19765)))

(assert (= (and start!79212 res!624477) b!927301))

(assert (= (and b!927301 res!624480) b!927300))

(assert (= (and b!927300 res!624474) b!927297))

(assert (= (and b!927297 res!624481) b!927295))

(assert (= (and b!927295 res!624479) b!927298))

(assert (= (and b!927298 res!624478) b!927290))

(assert (= (and b!927290 res!624476) b!927303))

(assert (= (and b!927303 c!96997) b!927299))

(assert (= (and b!927303 (not c!96997)) b!927286))

(assert (= (and b!927299 c!96999) b!927304))

(assert (= (and b!927299 (not c!96999)) b!927296))

(assert (= (and b!927304 c!96998) b!927292))

(assert (= (and b!927304 (not c!96998)) b!927293))

(assert (= (and b!927303 res!624482) b!927294))

(assert (= (and b!927294 res!624473) b!927287))

(assert (= (and b!927287 res!624483) b!927288))

(assert (= (and b!927288 res!624475) b!927291))

(assert (= (and b!927289 condMapEmpty!31404) mapIsEmpty!31404))

(assert (= (and b!927289 (not condMapEmpty!31404)) mapNonEmpty!31404))

(get-info :version)

(assert (= (and mapNonEmpty!31404 ((_ is ValueCellFull!9401) mapValue!31404)) b!927302))

(assert (= (and b!927289 ((_ is ValueCellFull!9401) mapDefault!31404)) b!927305))

(assert (= start!79212 b!927289))

(declare-fun b_lambda!13773 () Bool)

(assert (=> (not b_lambda!13773) (not b!927304)))

(declare-fun t!26736 () Bool)

(declare-fun tb!5829 () Bool)

(assert (=> (and start!79212 (= defaultEntry!1235 defaultEntry!1235) t!26736) tb!5829))

(declare-fun result!11489 () Bool)

(assert (=> tb!5829 (= result!11489 tp_is_empty!19765)))

(assert (=> b!927304 t!26736))

(declare-fun b_and!28263 () Bool)

(assert (= b_and!28261 (and (=> t!26736 result!11489) b_and!28263)))

(declare-fun m!862219 () Bool)

(assert (=> b!927304 m!862219))

(declare-fun m!862221 () Bool)

(assert (=> b!927304 m!862221))

(declare-fun m!862223 () Bool)

(assert (=> b!927304 m!862223))

(declare-fun m!862225 () Bool)

(assert (=> b!927304 m!862225))

(declare-fun m!862227 () Bool)

(assert (=> b!927304 m!862227))

(assert (=> b!927304 m!862223))

(assert (=> b!927304 m!862225))

(declare-fun m!862229 () Bool)

(assert (=> b!927304 m!862229))

(declare-fun m!862231 () Bool)

(assert (=> b!927304 m!862231))

(declare-fun m!862233 () Bool)

(assert (=> b!927304 m!862233))

(declare-fun m!862235 () Bool)

(assert (=> b!927304 m!862235))

(declare-fun m!862237 () Bool)

(assert (=> b!927304 m!862237))

(declare-fun m!862239 () Bool)

(assert (=> b!927304 m!862239))

(declare-fun m!862241 () Bool)

(assert (=> b!927304 m!862241))

(declare-fun m!862243 () Bool)

(assert (=> b!927304 m!862243))

(declare-fun m!862245 () Bool)

(assert (=> b!927304 m!862245))

(assert (=> b!927304 m!862239))

(declare-fun m!862247 () Bool)

(assert (=> b!927304 m!862247))

(declare-fun m!862249 () Bool)

(assert (=> b!927304 m!862249))

(declare-fun m!862251 () Bool)

(assert (=> start!79212 m!862251))

(declare-fun m!862253 () Bool)

(assert (=> start!79212 m!862253))

(declare-fun m!862255 () Bool)

(assert (=> start!79212 m!862255))

(declare-fun m!862257 () Bool)

(assert (=> b!927288 m!862257))

(declare-fun m!862259 () Bool)

(assert (=> b!927288 m!862259))

(declare-fun m!862261 () Bool)

(assert (=> b!927288 m!862261))

(declare-fun m!862263 () Bool)

(assert (=> mapNonEmpty!31404 m!862263))

(declare-fun m!862265 () Bool)

(assert (=> b!927292 m!862265))

(declare-fun m!862267 () Bool)

(assert (=> b!927303 m!862267))

(declare-fun m!862269 () Bool)

(assert (=> b!927297 m!862269))

(declare-fun m!862271 () Bool)

(assert (=> b!927298 m!862271))

(declare-fun m!862273 () Bool)

(assert (=> b!927298 m!862273))

(declare-fun m!862275 () Bool)

(assert (=> b!927299 m!862275))

(declare-fun m!862277 () Bool)

(assert (=> b!927299 m!862277))

(declare-fun m!862279 () Bool)

(assert (=> b!927291 m!862279))

(declare-fun m!862281 () Bool)

(assert (=> b!927300 m!862281))

(declare-fun m!862283 () Bool)

(assert (=> b!927287 m!862283))

(declare-fun m!862285 () Bool)

(assert (=> b!927294 m!862285))

(assert (=> b!927294 m!862231))

(declare-fun m!862287 () Bool)

(assert (=> b!927290 m!862287))

(check-sat (not b!927292) (not b!927299) (not b!927294) (not b!927288) (not b!927291) (not b!927297) (not b!927300) (not b!927304) tp_is_empty!19765 (not start!79212) (not b!927298) (not b_next!17257) (not b!927303) (not b!927290) b_and!28263 (not b_lambda!13773) (not mapNonEmpty!31404) (not b!927287))
(check-sat b_and!28263 (not b_next!17257))

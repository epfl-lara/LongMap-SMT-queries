; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79068 () Bool)

(assert start!79068)

(declare-fun b_free!17113 () Bool)

(declare-fun b_next!17113 () Bool)

(assert (=> start!79068 (= b_free!17113 (not b_next!17113))))

(declare-fun tp!59780 () Bool)

(declare-fun b_and!27973 () Bool)

(assert (=> start!79068 (= tp!59780 b_and!27973)))

(declare-fun b!923280 () Bool)

(declare-fun res!622354 () Bool)

(declare-fun e!518133 () Bool)

(assert (=> b!923280 (=> (not res!622354) (not e!518133))))

(declare-datatypes ((array!55265 0))(
  ( (array!55266 (arr!26573 (Array (_ BitVec 32) (_ BitVec 64))) (size!27033 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55265)

(declare-datatypes ((List!18635 0))(
  ( (Nil!18632) (Cons!18631 (h!19783 (_ BitVec 64)) (t!26470 List!18635)) )
))
(declare-fun arrayNoDuplicates!0 (array!55265 (_ BitVec 32) List!18635) Bool)

(assert (=> b!923280 (= res!622354 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18632))))

(declare-fun b!923281 () Bool)

(declare-fun e!518134 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!923281 (= e!518134 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923282 () Bool)

(declare-fun e!518128 () Bool)

(declare-fun e!518130 () Bool)

(assert (=> b!923282 (= e!518128 e!518130)))

(declare-fun res!622348 () Bool)

(assert (=> b!923282 (=> (not res!622348) (not e!518130))))

(declare-fun lt!414567 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923282 (= res!622348 (validKeyInArray!0 lt!414567))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923282 (= lt!414567 (select (arr!26573 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923283 () Bool)

(declare-fun res!622356 () Bool)

(assert (=> b!923283 (=> (not res!622356) (not e!518128))))

(assert (=> b!923283 (= res!622356 (validKeyInArray!0 k0!1099))))

(declare-fun res!622349 () Bool)

(assert (=> start!79068 (=> (not res!622349) (not e!518133))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79068 (= res!622349 (validMask!0 mask!1881))))

(assert (=> start!79068 e!518133))

(assert (=> start!79068 true))

(declare-fun tp_is_empty!19621 () Bool)

(assert (=> start!79068 tp_is_empty!19621))

(declare-datatypes ((V!31127 0))(
  ( (V!31128 (val!9861 Int)) )
))
(declare-datatypes ((ValueCell!9329 0))(
  ( (ValueCellFull!9329 (v!12376 V!31127)) (EmptyCell!9329) )
))
(declare-datatypes ((array!55267 0))(
  ( (array!55268 (arr!26574 (Array (_ BitVec 32) ValueCell!9329)) (size!27034 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55267)

(declare-fun e!518127 () Bool)

(declare-fun array_inv!20798 (array!55267) Bool)

(assert (=> start!79068 (and (array_inv!20798 _values!1231) e!518127)))

(assert (=> start!79068 tp!59780))

(declare-fun array_inv!20799 (array!55265) Bool)

(assert (=> start!79068 (array_inv!20799 _keys!1487)))

(declare-fun b!923284 () Bool)

(assert (=> b!923284 (= e!518130 (not true))))

(assert (=> b!923284 (not (= lt!414567 k0!1099))))

(declare-datatypes ((Unit!31114 0))(
  ( (Unit!31115) )
))
(declare-fun lt!414564 () Unit!31114)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55265 (_ BitVec 64) (_ BitVec 32) List!18635) Unit!31114)

(assert (=> b!923284 (= lt!414564 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18632))))

(assert (=> b!923284 e!518134))

(declare-fun c!96453 () Bool)

(assert (=> b!923284 (= c!96453 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414566 () Unit!31114)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31127)

(declare-fun minValue!1173 () V!31127)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!192 (array!55265 array!55267 (_ BitVec 32) (_ BitVec 32) V!31127 V!31127 (_ BitVec 64) (_ BitVec 32) Int) Unit!31114)

(assert (=> b!923284 (= lt!414566 (lemmaListMapContainsThenArrayContainsFrom!192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923284 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18632)))

(declare-fun lt!414562 () Unit!31114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55265 (_ BitVec 32) (_ BitVec 32)) Unit!31114)

(assert (=> b!923284 (= lt!414562 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12818 0))(
  ( (tuple2!12819 (_1!6420 (_ BitVec 64)) (_2!6420 V!31127)) )
))
(declare-datatypes ((List!18636 0))(
  ( (Nil!18633) (Cons!18632 (h!19784 tuple2!12818) (t!26471 List!18636)) )
))
(declare-datatypes ((ListLongMap!11517 0))(
  ( (ListLongMap!11518 (toList!5774 List!18636)) )
))
(declare-fun lt!414565 () ListLongMap!11517)

(declare-fun lt!414568 () tuple2!12818)

(declare-fun contains!4847 (ListLongMap!11517 (_ BitVec 64)) Bool)

(declare-fun +!2701 (ListLongMap!11517 tuple2!12818) ListLongMap!11517)

(assert (=> b!923284 (contains!4847 (+!2701 lt!414565 lt!414568) k0!1099)))

(declare-fun lt!414569 () V!31127)

(declare-fun lt!414563 () Unit!31114)

(declare-fun addStillContains!410 (ListLongMap!11517 (_ BitVec 64) V!31127 (_ BitVec 64)) Unit!31114)

(assert (=> b!923284 (= lt!414563 (addStillContains!410 lt!414565 lt!414567 lt!414569 k0!1099))))

(declare-fun getCurrentListMap!3025 (array!55265 array!55267 (_ BitVec 32) (_ BitVec 32) V!31127 V!31127 (_ BitVec 32) Int) ListLongMap!11517)

(assert (=> b!923284 (= (getCurrentListMap!3025 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2701 (getCurrentListMap!3025 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414568))))

(assert (=> b!923284 (= lt!414568 (tuple2!12819 lt!414567 lt!414569))))

(declare-fun get!13974 (ValueCell!9329 V!31127) V!31127)

(declare-fun dynLambda!1498 (Int (_ BitVec 64)) V!31127)

(assert (=> b!923284 (= lt!414569 (get!13974 (select (arr!26574 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1498 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414561 () Unit!31114)

(declare-fun lemmaListMapRecursiveValidKeyArray!81 (array!55265 array!55267 (_ BitVec 32) (_ BitVec 32) V!31127 V!31127 (_ BitVec 32) Int) Unit!31114)

(assert (=> b!923284 (= lt!414561 (lemmaListMapRecursiveValidKeyArray!81 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923285 () Bool)

(declare-fun e!518129 () Bool)

(declare-fun mapRes!31188 () Bool)

(assert (=> b!923285 (= e!518127 (and e!518129 mapRes!31188))))

(declare-fun condMapEmpty!31188 () Bool)

(declare-fun mapDefault!31188 () ValueCell!9329)

(assert (=> b!923285 (= condMapEmpty!31188 (= (arr!26574 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9329)) mapDefault!31188)))))

(declare-fun b!923286 () Bool)

(assert (=> b!923286 (= e!518133 e!518128)))

(declare-fun res!622355 () Bool)

(assert (=> b!923286 (=> (not res!622355) (not e!518128))))

(assert (=> b!923286 (= res!622355 (contains!4847 lt!414565 k0!1099))))

(assert (=> b!923286 (= lt!414565 (getCurrentListMap!3025 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923287 () Bool)

(declare-fun res!622350 () Bool)

(assert (=> b!923287 (=> (not res!622350) (not e!518128))))

(assert (=> b!923287 (= res!622350 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923288 () Bool)

(declare-fun res!622351 () Bool)

(assert (=> b!923288 (=> (not res!622351) (not e!518133))))

(assert (=> b!923288 (= res!622351 (and (= (size!27034 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27033 _keys!1487) (size!27034 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923289 () Bool)

(declare-fun res!622352 () Bool)

(assert (=> b!923289 (=> (not res!622352) (not e!518133))))

(assert (=> b!923289 (= res!622352 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27033 _keys!1487))))))

(declare-fun b!923290 () Bool)

(declare-fun res!622347 () Bool)

(assert (=> b!923290 (=> (not res!622347) (not e!518133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55265 (_ BitVec 32)) Bool)

(assert (=> b!923290 (= res!622347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923291 () Bool)

(declare-fun res!622353 () Bool)

(assert (=> b!923291 (=> (not res!622353) (not e!518128))))

(declare-fun v!791 () V!31127)

(declare-fun apply!633 (ListLongMap!11517 (_ BitVec 64)) V!31127)

(assert (=> b!923291 (= res!622353 (= (apply!633 lt!414565 k0!1099) v!791))))

(declare-fun mapNonEmpty!31188 () Bool)

(declare-fun tp!59781 () Bool)

(declare-fun e!518131 () Bool)

(assert (=> mapNonEmpty!31188 (= mapRes!31188 (and tp!59781 e!518131))))

(declare-fun mapRest!31188 () (Array (_ BitVec 32) ValueCell!9329))

(declare-fun mapKey!31188 () (_ BitVec 32))

(declare-fun mapValue!31188 () ValueCell!9329)

(assert (=> mapNonEmpty!31188 (= (arr!26574 _values!1231) (store mapRest!31188 mapKey!31188 mapValue!31188))))

(declare-fun b!923292 () Bool)

(declare-fun arrayContainsKey!0 (array!55265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923292 (= e!518134 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923293 () Bool)

(assert (=> b!923293 (= e!518129 tp_is_empty!19621)))

(declare-fun mapIsEmpty!31188 () Bool)

(assert (=> mapIsEmpty!31188 mapRes!31188))

(declare-fun b!923294 () Bool)

(assert (=> b!923294 (= e!518131 tp_is_empty!19621)))

(assert (= (and start!79068 res!622349) b!923288))

(assert (= (and b!923288 res!622351) b!923290))

(assert (= (and b!923290 res!622347) b!923280))

(assert (= (and b!923280 res!622354) b!923289))

(assert (= (and b!923289 res!622352) b!923286))

(assert (= (and b!923286 res!622355) b!923291))

(assert (= (and b!923291 res!622353) b!923287))

(assert (= (and b!923287 res!622350) b!923283))

(assert (= (and b!923283 res!622356) b!923282))

(assert (= (and b!923282 res!622348) b!923284))

(assert (= (and b!923284 c!96453) b!923292))

(assert (= (and b!923284 (not c!96453)) b!923281))

(assert (= (and b!923285 condMapEmpty!31188) mapIsEmpty!31188))

(assert (= (and b!923285 (not condMapEmpty!31188)) mapNonEmpty!31188))

(get-info :version)

(assert (= (and mapNonEmpty!31188 ((_ is ValueCellFull!9329) mapValue!31188)) b!923294))

(assert (= (and b!923285 ((_ is ValueCellFull!9329) mapDefault!31188)) b!923293))

(assert (= start!79068 b!923285))

(declare-fun b_lambda!13629 () Bool)

(assert (=> (not b_lambda!13629) (not b!923284)))

(declare-fun t!26469 () Bool)

(declare-fun tb!5685 () Bool)

(assert (=> (and start!79068 (= defaultEntry!1235 defaultEntry!1235) t!26469) tb!5685))

(declare-fun result!11201 () Bool)

(assert (=> tb!5685 (= result!11201 tp_is_empty!19621)))

(assert (=> b!923284 t!26469))

(declare-fun b_and!27975 () Bool)

(assert (= b_and!27973 (and (=> t!26469 result!11201) b_and!27975)))

(declare-fun m!857731 () Bool)

(assert (=> b!923284 m!857731))

(declare-fun m!857733 () Bool)

(assert (=> b!923284 m!857733))

(declare-fun m!857735 () Bool)

(assert (=> b!923284 m!857735))

(declare-fun m!857737 () Bool)

(assert (=> b!923284 m!857737))

(declare-fun m!857739 () Bool)

(assert (=> b!923284 m!857739))

(declare-fun m!857741 () Bool)

(assert (=> b!923284 m!857741))

(declare-fun m!857743 () Bool)

(assert (=> b!923284 m!857743))

(declare-fun m!857745 () Bool)

(assert (=> b!923284 m!857745))

(assert (=> b!923284 m!857731))

(declare-fun m!857747 () Bool)

(assert (=> b!923284 m!857747))

(declare-fun m!857749 () Bool)

(assert (=> b!923284 m!857749))

(declare-fun m!857751 () Bool)

(assert (=> b!923284 m!857751))

(declare-fun m!857753 () Bool)

(assert (=> b!923284 m!857753))

(assert (=> b!923284 m!857749))

(assert (=> b!923284 m!857735))

(declare-fun m!857755 () Bool)

(assert (=> b!923284 m!857755))

(assert (=> b!923284 m!857751))

(declare-fun m!857757 () Bool)

(assert (=> b!923284 m!857757))

(declare-fun m!857759 () Bool)

(assert (=> mapNonEmpty!31188 m!857759))

(declare-fun m!857761 () Bool)

(assert (=> b!923292 m!857761))

(declare-fun m!857763 () Bool)

(assert (=> b!923290 m!857763))

(declare-fun m!857765 () Bool)

(assert (=> b!923280 m!857765))

(declare-fun m!857767 () Bool)

(assert (=> b!923282 m!857767))

(declare-fun m!857769 () Bool)

(assert (=> b!923282 m!857769))

(declare-fun m!857771 () Bool)

(assert (=> b!923283 m!857771))

(declare-fun m!857773 () Bool)

(assert (=> start!79068 m!857773))

(declare-fun m!857775 () Bool)

(assert (=> start!79068 m!857775))

(declare-fun m!857777 () Bool)

(assert (=> start!79068 m!857777))

(declare-fun m!857779 () Bool)

(assert (=> b!923291 m!857779))

(declare-fun m!857781 () Bool)

(assert (=> b!923286 m!857781))

(declare-fun m!857783 () Bool)

(assert (=> b!923286 m!857783))

(check-sat (not b_lambda!13629) (not b!923286) (not b!923290) (not mapNonEmpty!31188) (not b!923292) (not b!923283) (not b!923282) (not b_next!17113) b_and!27975 (not b!923280) (not b!923284) (not start!79068) (not b!923291) tp_is_empty!19621)
(check-sat b_and!27975 (not b_next!17113))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79206 () Bool)

(assert start!79206)

(declare-fun b_free!17251 () Bool)

(declare-fun b_next!17251 () Bool)

(assert (=> start!79206 (= b_free!17251 (not b_next!17251))))

(declare-fun tp!60195 () Bool)

(declare-fun b_and!28249 () Bool)

(assert (=> start!79206 (= tp!60195 b_and!28249)))

(declare-fun b!927100 () Bool)

(declare-fun e!520471 () Bool)

(declare-fun e!520468 () Bool)

(declare-fun mapRes!31395 () Bool)

(assert (=> b!927100 (= e!520471 (and e!520468 mapRes!31395))))

(declare-fun condMapEmpty!31395 () Bool)

(declare-datatypes ((V!31311 0))(
  ( (V!31312 (val!9930 Int)) )
))
(declare-datatypes ((ValueCell!9398 0))(
  ( (ValueCellFull!9398 (v!12445 V!31311)) (EmptyCell!9398) )
))
(declare-datatypes ((array!55535 0))(
  ( (array!55536 (arr!26708 (Array (_ BitVec 32) ValueCell!9398)) (size!27168 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55535)

(declare-fun mapDefault!31395 () ValueCell!9398)

(assert (=> b!927100 (= condMapEmpty!31395 (= (arr!26708 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9398)) mapDefault!31395)))))

(declare-fun b!927101 () Bool)

(declare-fun res!624379 () Bool)

(declare-fun e!520459 () Bool)

(assert (=> b!927101 (=> (not res!624379) (not e!520459))))

(declare-datatypes ((array!55537 0))(
  ( (array!55538 (arr!26709 (Array (_ BitVec 32) (_ BitVec 64))) (size!27169 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55537)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55537 (_ BitVec 32)) Bool)

(assert (=> b!927101 (= res!624379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!624377 () Bool)

(assert (=> start!79206 (=> (not res!624377) (not e!520459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79206 (= res!624377 (validMask!0 mask!1881))))

(assert (=> start!79206 e!520459))

(assert (=> start!79206 true))

(declare-fun tp_is_empty!19759 () Bool)

(assert (=> start!79206 tp_is_empty!19759))

(declare-fun array_inv!20898 (array!55535) Bool)

(assert (=> start!79206 (and (array_inv!20898 _values!1231) e!520471)))

(assert (=> start!79206 tp!60195))

(declare-fun array_inv!20899 (array!55537) Bool)

(assert (=> start!79206 (array_inv!20899 _keys!1487)))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31311)

(declare-fun b!927102 () Bool)

(declare-datatypes ((tuple2!12942 0))(
  ( (tuple2!12943 (_1!6482 (_ BitVec 64)) (_2!6482 V!31311)) )
))
(declare-datatypes ((List!18753 0))(
  ( (Nil!18750) (Cons!18749 (h!19901 tuple2!12942) (t!26726 List!18753)) )
))
(declare-datatypes ((ListLongMap!11641 0))(
  ( (ListLongMap!11642 (toList!5836 List!18753)) )
))
(declare-fun lt!417410 () ListLongMap!11641)

(declare-fun e!520460 () Bool)

(declare-fun apply!687 (ListLongMap!11641 (_ BitVec 64)) V!31311)

(assert (=> b!927102 (= e!520460 (= (apply!687 lt!417410 k0!1099) v!791))))

(declare-fun b!927103 () Bool)

(declare-datatypes ((Unit!31300 0))(
  ( (Unit!31301) )
))
(declare-fun e!520461 () Unit!31300)

(declare-fun Unit!31302 () Unit!31300)

(assert (=> b!927103 (= e!520461 Unit!31302)))

(declare-fun b!927104 () Bool)

(declare-fun e!520465 () Bool)

(assert (=> b!927104 (= e!520465 tp_is_empty!19759)))

(declare-fun b!927105 () Bool)

(declare-fun e!520466 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927105 (= e!520466 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31395 () Bool)

(assert (=> mapIsEmpty!31395 mapRes!31395))

(declare-fun b!927106 () Bool)

(declare-fun e!520464 () Bool)

(declare-fun e!520462 () Bool)

(assert (=> b!927106 (= e!520464 e!520462)))

(declare-fun res!624382 () Bool)

(assert (=> b!927106 (=> (not res!624382) (not e!520462))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!927106 (= res!624382 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27169 _keys!1487)))))

(declare-fun lt!417423 () Unit!31300)

(assert (=> b!927106 (= lt!417423 e!520461)))

(declare-fun c!96972 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927106 (= c!96972 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31395 () Bool)

(declare-fun tp!60194 () Bool)

(assert (=> mapNonEmpty!31395 (= mapRes!31395 (and tp!60194 e!520465))))

(declare-fun mapRest!31395 () (Array (_ BitVec 32) ValueCell!9398))

(declare-fun mapValue!31395 () ValueCell!9398)

(declare-fun mapKey!31395 () (_ BitVec 32))

(assert (=> mapNonEmpty!31395 (= (arr!26708 _values!1231) (store mapRest!31395 mapKey!31395 mapValue!31395))))

(declare-fun b!927107 () Bool)

(declare-fun e!520463 () Unit!31300)

(declare-fun Unit!31303 () Unit!31300)

(assert (=> b!927107 (= e!520463 Unit!31303)))

(declare-fun b!927108 () Bool)

(declare-fun res!624374 () Bool)

(assert (=> b!927108 (=> (not res!624374) (not e!520459))))

(assert (=> b!927108 (= res!624374 (and (= (size!27168 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27169 _keys!1487) (size!27168 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927109 () Bool)

(assert (=> b!927109 (= e!520468 tp_is_empty!19759)))

(declare-fun b!927110 () Bool)

(declare-fun res!624378 () Bool)

(declare-fun e!520469 () Bool)

(assert (=> b!927110 (=> (not res!624378) (not e!520469))))

(declare-fun lt!417415 () ListLongMap!11641)

(assert (=> b!927110 (= res!624378 (= (apply!687 lt!417415 k0!1099) v!791))))

(declare-fun b!927111 () Bool)

(declare-fun res!624375 () Bool)

(assert (=> b!927111 (=> (not res!624375) (not e!520459))))

(assert (=> b!927111 (= res!624375 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27169 _keys!1487))))))

(declare-fun b!927112 () Bool)

(assert (=> b!927112 (= e!520469 (not true))))

(assert (=> b!927112 e!520460))

(declare-fun res!624384 () Bool)

(assert (=> b!927112 (=> (not res!624384) (not e!520460))))

(declare-fun contains!4908 (ListLongMap!11641 (_ BitVec 64)) Bool)

(assert (=> b!927112 (= res!624384 (contains!4908 lt!417410 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31311)

(declare-fun minValue!1173 () V!31311)

(declare-fun getCurrentListMap!3086 (array!55537 array!55535 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 32) Int) ListLongMap!11641)

(assert (=> b!927112 (= lt!417410 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417421 () Unit!31300)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!80 (array!55537 array!55535 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 64) V!31311 (_ BitVec 32) Int) Unit!31300)

(assert (=> b!927112 (= lt!417421 (lemmaListMapApplyFromThenApplyFromZero!80 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927113 () Bool)

(declare-fun arrayContainsKey!0 (array!55537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927113 (= e!520466 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927114 () Bool)

(assert (=> b!927114 (= e!520462 e!520469)))

(declare-fun res!624381 () Bool)

(assert (=> b!927114 (=> (not res!624381) (not e!520469))))

(assert (=> b!927114 (= res!624381 (contains!4908 lt!417415 k0!1099))))

(assert (=> b!927114 (= lt!417415 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927115 () Bool)

(declare-fun e!520467 () Bool)

(assert (=> b!927115 (= e!520459 e!520467)))

(declare-fun res!624380 () Bool)

(assert (=> b!927115 (=> (not res!624380) (not e!520467))))

(declare-fun lt!417416 () ListLongMap!11641)

(assert (=> b!927115 (= res!624380 (contains!4908 lt!417416 k0!1099))))

(assert (=> b!927115 (= lt!417416 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927116 () Bool)

(declare-fun res!624376 () Bool)

(assert (=> b!927116 (=> (not res!624376) (not e!520459))))

(declare-datatypes ((List!18754 0))(
  ( (Nil!18751) (Cons!18750 (h!19902 (_ BitVec 64)) (t!26727 List!18754)) )
))
(declare-fun arrayNoDuplicates!0 (array!55537 (_ BitVec 32) List!18754) Bool)

(assert (=> b!927116 (= res!624376 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18751))))

(declare-fun b!927117 () Bool)

(assert (=> b!927117 (= e!520461 e!520463)))

(declare-fun lt!417413 () (_ BitVec 64))

(assert (=> b!927117 (= lt!417413 (select (arr!26709 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96971 () Bool)

(assert (=> b!927117 (= c!96971 (validKeyInArray!0 lt!417413))))

(declare-fun b!927118 () Bool)

(assert (=> b!927118 (= e!520467 e!520464)))

(declare-fun res!624383 () Bool)

(assert (=> b!927118 (=> (not res!624383) (not e!520464))))

(declare-fun lt!417414 () V!31311)

(assert (=> b!927118 (= res!624383 (and (= lt!417414 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927118 (= lt!417414 (apply!687 lt!417416 k0!1099))))

(declare-fun b!927119 () Bool)

(declare-fun lt!417417 () ListLongMap!11641)

(assert (=> b!927119 (= (apply!687 lt!417417 k0!1099) lt!417414)))

(declare-fun lt!417420 () Unit!31300)

(declare-fun lt!417424 () V!31311)

(declare-fun addApplyDifferent!386 (ListLongMap!11641 (_ BitVec 64) V!31311 (_ BitVec 64)) Unit!31300)

(assert (=> b!927119 (= lt!417420 (addApplyDifferent!386 lt!417416 lt!417413 lt!417424 k0!1099))))

(assert (=> b!927119 (not (= lt!417413 k0!1099))))

(declare-fun lt!417419 () Unit!31300)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55537 (_ BitVec 64) (_ BitVec 32) List!18754) Unit!31300)

(assert (=> b!927119 (= lt!417419 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18751))))

(assert (=> b!927119 e!520466))

(declare-fun c!96970 () Bool)

(assert (=> b!927119 (= c!96970 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417422 () Unit!31300)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!241 (array!55537 array!55535 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 64) (_ BitVec 32) Int) Unit!31300)

(assert (=> b!927119 (= lt!417422 (lemmaListMapContainsThenArrayContainsFrom!241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927119 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18751)))

(declare-fun lt!417418 () Unit!31300)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55537 (_ BitVec 32) (_ BitVec 32)) Unit!31300)

(assert (=> b!927119 (= lt!417418 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927119 (contains!4908 lt!417417 k0!1099)))

(declare-fun lt!417412 () tuple2!12942)

(declare-fun +!2750 (ListLongMap!11641 tuple2!12942) ListLongMap!11641)

(assert (=> b!927119 (= lt!417417 (+!2750 lt!417416 lt!417412))))

(declare-fun lt!417411 () Unit!31300)

(declare-fun addStillContains!459 (ListLongMap!11641 (_ BitVec 64) V!31311 (_ BitVec 64)) Unit!31300)

(assert (=> b!927119 (= lt!417411 (addStillContains!459 lt!417416 lt!417413 lt!417424 k0!1099))))

(assert (=> b!927119 (= (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2750 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417412))))

(assert (=> b!927119 (= lt!417412 (tuple2!12943 lt!417413 lt!417424))))

(declare-fun get!14069 (ValueCell!9398 V!31311) V!31311)

(declare-fun dynLambda!1547 (Int (_ BitVec 64)) V!31311)

(assert (=> b!927119 (= lt!417424 (get!14069 (select (arr!26708 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1547 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417425 () Unit!31300)

(declare-fun lemmaListMapRecursiveValidKeyArray!130 (array!55537 array!55535 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 32) Int) Unit!31300)

(assert (=> b!927119 (= lt!417425 (lemmaListMapRecursiveValidKeyArray!130 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927119 (= e!520463 lt!417420)))

(assert (= (and start!79206 res!624377) b!927108))

(assert (= (and b!927108 res!624374) b!927101))

(assert (= (and b!927101 res!624379) b!927116))

(assert (= (and b!927116 res!624376) b!927111))

(assert (= (and b!927111 res!624375) b!927115))

(assert (= (and b!927115 res!624380) b!927118))

(assert (= (and b!927118 res!624383) b!927106))

(assert (= (and b!927106 c!96972) b!927117))

(assert (= (and b!927106 (not c!96972)) b!927103))

(assert (= (and b!927117 c!96971) b!927119))

(assert (= (and b!927117 (not c!96971)) b!927107))

(assert (= (and b!927119 c!96970) b!927113))

(assert (= (and b!927119 (not c!96970)) b!927105))

(assert (= (and b!927106 res!624382) b!927114))

(assert (= (and b!927114 res!624381) b!927110))

(assert (= (and b!927110 res!624378) b!927112))

(assert (= (and b!927112 res!624384) b!927102))

(assert (= (and b!927100 condMapEmpty!31395) mapIsEmpty!31395))

(assert (= (and b!927100 (not condMapEmpty!31395)) mapNonEmpty!31395))

(get-info :version)

(assert (= (and mapNonEmpty!31395 ((_ is ValueCellFull!9398) mapValue!31395)) b!927104))

(assert (= (and b!927100 ((_ is ValueCellFull!9398) mapDefault!31395)) b!927109))

(assert (= start!79206 b!927100))

(declare-fun b_lambda!13767 () Bool)

(assert (=> (not b_lambda!13767) (not b!927119)))

(declare-fun t!26725 () Bool)

(declare-fun tb!5823 () Bool)

(assert (=> (and start!79206 (= defaultEntry!1235 defaultEntry!1235) t!26725) tb!5823))

(declare-fun result!11477 () Bool)

(assert (=> tb!5823 (= result!11477 tp_is_empty!19759)))

(assert (=> b!927119 t!26725))

(declare-fun b_and!28251 () Bool)

(assert (= b_and!28249 (and (=> t!26725 result!11477) b_and!28251)))

(declare-fun m!862009 () Bool)

(assert (=> b!927110 m!862009))

(declare-fun m!862011 () Bool)

(assert (=> mapNonEmpty!31395 m!862011))

(declare-fun m!862013 () Bool)

(assert (=> b!927102 m!862013))

(declare-fun m!862015 () Bool)

(assert (=> b!927101 m!862015))

(declare-fun m!862017 () Bool)

(assert (=> b!927117 m!862017))

(declare-fun m!862019 () Bool)

(assert (=> b!927117 m!862019))

(declare-fun m!862021 () Bool)

(assert (=> b!927116 m!862021))

(declare-fun m!862023 () Bool)

(assert (=> b!927113 m!862023))

(declare-fun m!862025 () Bool)

(assert (=> b!927112 m!862025))

(declare-fun m!862027 () Bool)

(assert (=> b!927112 m!862027))

(declare-fun m!862029 () Bool)

(assert (=> b!927112 m!862029))

(declare-fun m!862031 () Bool)

(assert (=> b!927114 m!862031))

(declare-fun m!862033 () Bool)

(assert (=> b!927114 m!862033))

(declare-fun m!862035 () Bool)

(assert (=> b!927119 m!862035))

(declare-fun m!862037 () Bool)

(assert (=> b!927119 m!862037))

(declare-fun m!862039 () Bool)

(assert (=> b!927119 m!862039))

(declare-fun m!862041 () Bool)

(assert (=> b!927119 m!862041))

(declare-fun m!862043 () Bool)

(assert (=> b!927119 m!862043))

(declare-fun m!862045 () Bool)

(assert (=> b!927119 m!862045))

(declare-fun m!862047 () Bool)

(assert (=> b!927119 m!862047))

(assert (=> b!927119 m!862043))

(assert (=> b!927119 m!862045))

(declare-fun m!862049 () Bool)

(assert (=> b!927119 m!862049))

(assert (=> b!927119 m!862033))

(declare-fun m!862051 () Bool)

(assert (=> b!927119 m!862051))

(declare-fun m!862053 () Bool)

(assert (=> b!927119 m!862053))

(declare-fun m!862055 () Bool)

(assert (=> b!927119 m!862055))

(declare-fun m!862057 () Bool)

(assert (=> b!927119 m!862057))

(assert (=> b!927119 m!862039))

(declare-fun m!862059 () Bool)

(assert (=> b!927119 m!862059))

(declare-fun m!862061 () Bool)

(assert (=> b!927119 m!862061))

(declare-fun m!862063 () Bool)

(assert (=> b!927119 m!862063))

(declare-fun m!862065 () Bool)

(assert (=> start!79206 m!862065))

(declare-fun m!862067 () Bool)

(assert (=> start!79206 m!862067))

(declare-fun m!862069 () Bool)

(assert (=> start!79206 m!862069))

(declare-fun m!862071 () Bool)

(assert (=> b!927106 m!862071))

(declare-fun m!862073 () Bool)

(assert (=> b!927118 m!862073))

(declare-fun m!862075 () Bool)

(assert (=> b!927115 m!862075))

(declare-fun m!862077 () Bool)

(assert (=> b!927115 m!862077))

(check-sat (not start!79206) (not b!927116) (not b!927102) (not mapNonEmpty!31395) (not b!927101) (not b!927119) (not b!927106) (not b!927118) tp_is_empty!19759 (not b_lambda!13767) (not b!927117) (not b!927110) (not b!927115) (not b_next!17251) (not b!927112) (not b!927113) (not b!927114) b_and!28251)
(check-sat b_and!28251 (not b_next!17251))

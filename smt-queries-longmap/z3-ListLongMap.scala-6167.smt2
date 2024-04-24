; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79278 () Bool)

(assert start!79278)

(declare-fun b_free!17323 () Bool)

(declare-fun b_next!17323 () Bool)

(assert (=> start!79278 (= b_free!17323 (not b_next!17323))))

(declare-fun tp!60410 () Bool)

(declare-fun b_and!28393 () Bool)

(assert (=> start!79278 (= tp!60410 b_and!28393)))

(declare-fun b!929332 () Bool)

(declare-fun res!625567 () Bool)

(declare-fun e!521866 () Bool)

(assert (=> b!929332 (=> (not res!625567) (not e!521866))))

(declare-datatypes ((array!55675 0))(
  ( (array!55676 (arr!26778 (Array (_ BitVec 32) (_ BitVec 64))) (size!27238 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55675)

(declare-datatypes ((List!18814 0))(
  ( (Nil!18811) (Cons!18810 (h!19962 (_ BitVec 64)) (t!26859 List!18814)) )
))
(declare-fun arrayNoDuplicates!0 (array!55675 (_ BitVec 32) List!18814) Bool)

(assert (=> b!929332 (= res!625567 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18811))))

(declare-fun res!625562 () Bool)

(assert (=> start!79278 (=> (not res!625562) (not e!521866))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79278 (= res!625562 (validMask!0 mask!1881))))

(assert (=> start!79278 e!521866))

(assert (=> start!79278 true))

(declare-fun tp_is_empty!19831 () Bool)

(assert (=> start!79278 tp_is_empty!19831))

(declare-datatypes ((V!31407 0))(
  ( (V!31408 (val!9966 Int)) )
))
(declare-datatypes ((ValueCell!9434 0))(
  ( (ValueCellFull!9434 (v!12481 V!31407)) (EmptyCell!9434) )
))
(declare-datatypes ((array!55677 0))(
  ( (array!55678 (arr!26779 (Array (_ BitVec 32) ValueCell!9434)) (size!27239 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55677)

(declare-fun e!521872 () Bool)

(declare-fun array_inv!20954 (array!55677) Bool)

(assert (=> start!79278 (and (array_inv!20954 _values!1231) e!521872)))

(assert (=> start!79278 tp!60410))

(declare-fun array_inv!20955 (array!55675) Bool)

(assert (=> start!79278 (array_inv!20955 _keys!1487)))

(declare-fun b!929333 () Bool)

(declare-fun e!521873 () Bool)

(declare-fun e!521865 () Bool)

(assert (=> b!929333 (= e!521873 e!521865)))

(declare-fun res!625568 () Bool)

(assert (=> b!929333 (=> (not res!625568) (not e!521865))))

(declare-datatypes ((tuple2!13008 0))(
  ( (tuple2!13009 (_1!6515 (_ BitVec 64)) (_2!6515 V!31407)) )
))
(declare-datatypes ((List!18815 0))(
  ( (Nil!18812) (Cons!18811 (h!19963 tuple2!13008) (t!26860 List!18815)) )
))
(declare-datatypes ((ListLongMap!11707 0))(
  ( (ListLongMap!11708 (toList!5869 List!18815)) )
))
(declare-fun lt!419142 () ListLongMap!11707)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4941 (ListLongMap!11707 (_ BitVec 64)) Bool)

(assert (=> b!929333 (= res!625568 (contains!4941 lt!419142 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31407)

(declare-fun minValue!1173 () V!31407)

(declare-fun getCurrentListMap!3119 (array!55675 array!55677 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 32) Int) ListLongMap!11707)

(assert (=> b!929333 (= lt!419142 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!929334 () Bool)

(declare-fun e!521869 () Bool)

(assert (=> b!929334 (= e!521869 tp_is_empty!19831)))

(declare-fun b!929335 () Bool)

(declare-fun res!625565 () Bool)

(assert (=> b!929335 (=> (not res!625565) (not e!521865))))

(declare-fun v!791 () V!31407)

(declare-fun apply!719 (ListLongMap!11707 (_ BitVec 64)) V!31407)

(assert (=> b!929335 (= res!625565 (= (apply!719 lt!419142 k0!1099) v!791))))

(declare-fun b!929336 () Bool)

(assert (=> b!929336 (= e!521865 (not true))))

(declare-fun e!521875 () Bool)

(assert (=> b!929336 e!521875))

(declare-fun res!625566 () Bool)

(assert (=> b!929336 (=> (not res!625566) (not e!521875))))

(declare-fun lt!419148 () ListLongMap!11707)

(assert (=> b!929336 (= res!625566 (contains!4941 lt!419148 k0!1099))))

(assert (=> b!929336 (= lt!419148 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31415 0))(
  ( (Unit!31416) )
))
(declare-fun lt!419141 () Unit!31415)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!107 (array!55675 array!55677 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 64) V!31407 (_ BitVec 32) Int) Unit!31415)

(assert (=> b!929336 (= lt!419141 (lemmaListMapApplyFromThenApplyFromZero!107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!929337 () Bool)

(declare-fun e!521863 () Unit!31415)

(declare-fun Unit!31417 () Unit!31415)

(assert (=> b!929337 (= e!521863 Unit!31417)))

(declare-fun e!521864 () Bool)

(declare-fun b!929338 () Bool)

(declare-fun arrayContainsKey!0 (array!55675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!929338 (= e!521864 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!929339 () Bool)

(assert (=> b!929339 (= e!521875 (= (apply!719 lt!419148 k0!1099) v!791))))

(declare-fun b!929340 () Bool)

(declare-fun e!521868 () Unit!31415)

(assert (=> b!929340 (= e!521868 e!521863)))

(declare-fun lt!419144 () (_ BitVec 64))

(assert (=> b!929340 (= lt!419144 (select (arr!26778 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97296 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!929340 (= c!97296 (validKeyInArray!0 lt!419144))))

(declare-fun b!929341 () Bool)

(declare-fun e!521874 () Bool)

(assert (=> b!929341 (= e!521866 e!521874)))

(declare-fun res!625563 () Bool)

(assert (=> b!929341 (=> (not res!625563) (not e!521874))))

(declare-fun lt!419151 () ListLongMap!11707)

(assert (=> b!929341 (= res!625563 (contains!4941 lt!419151 k0!1099))))

(assert (=> b!929341 (= lt!419151 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929342 () Bool)

(declare-fun e!521870 () Bool)

(assert (=> b!929342 (= e!521870 e!521873)))

(declare-fun res!625564 () Bool)

(assert (=> b!929342 (=> (not res!625564) (not e!521873))))

(assert (=> b!929342 (= res!625564 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27238 _keys!1487)))))

(declare-fun lt!419143 () Unit!31415)

(assert (=> b!929342 (= lt!419143 e!521868)))

(declare-fun c!97295 () Bool)

(assert (=> b!929342 (= c!97295 (validKeyInArray!0 k0!1099))))

(declare-fun b!929343 () Bool)

(declare-fun e!521871 () Bool)

(assert (=> b!929343 (= e!521871 tp_is_empty!19831)))

(declare-fun b!929344 () Bool)

(assert (=> b!929344 (= e!521874 e!521870)))

(declare-fun res!625570 () Bool)

(assert (=> b!929344 (=> (not res!625570) (not e!521870))))

(declare-fun lt!419138 () V!31407)

(assert (=> b!929344 (= res!625570 (and (= lt!419138 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!929344 (= lt!419138 (apply!719 lt!419151 k0!1099))))

(declare-fun b!929345 () Bool)

(declare-fun res!625572 () Bool)

(assert (=> b!929345 (=> (not res!625572) (not e!521866))))

(assert (=> b!929345 (= res!625572 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27238 _keys!1487))))))

(declare-fun b!929346 () Bool)

(declare-fun mapRes!31503 () Bool)

(assert (=> b!929346 (= e!521872 (and e!521869 mapRes!31503))))

(declare-fun condMapEmpty!31503 () Bool)

(declare-fun mapDefault!31503 () ValueCell!9434)

(assert (=> b!929346 (= condMapEmpty!31503 (= (arr!26779 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9434)) mapDefault!31503)))))

(declare-fun b!929347 () Bool)

(declare-fun res!625571 () Bool)

(assert (=> b!929347 (=> (not res!625571) (not e!521866))))

(assert (=> b!929347 (= res!625571 (and (= (size!27239 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27238 _keys!1487) (size!27239 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31503 () Bool)

(declare-fun tp!60411 () Bool)

(assert (=> mapNonEmpty!31503 (= mapRes!31503 (and tp!60411 e!521871))))

(declare-fun mapValue!31503 () ValueCell!9434)

(declare-fun mapRest!31503 () (Array (_ BitVec 32) ValueCell!9434))

(declare-fun mapKey!31503 () (_ BitVec 32))

(assert (=> mapNonEmpty!31503 (= (arr!26779 _values!1231) (store mapRest!31503 mapKey!31503 mapValue!31503))))

(declare-fun b!929348 () Bool)

(declare-fun lt!419153 () ListLongMap!11707)

(assert (=> b!929348 (= (apply!719 lt!419153 k0!1099) lt!419138)))

(declare-fun lt!419152 () V!31407)

(declare-fun lt!419150 () Unit!31415)

(declare-fun addApplyDifferent!413 (ListLongMap!11707 (_ BitVec 64) V!31407 (_ BitVec 64)) Unit!31415)

(assert (=> b!929348 (= lt!419150 (addApplyDifferent!413 lt!419151 lt!419144 lt!419152 k0!1099))))

(assert (=> b!929348 (not (= lt!419144 k0!1099))))

(declare-fun lt!419146 () Unit!31415)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55675 (_ BitVec 64) (_ BitVec 32) List!18814) Unit!31415)

(assert (=> b!929348 (= lt!419146 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18811))))

(assert (=> b!929348 e!521864))

(declare-fun c!97294 () Bool)

(assert (=> b!929348 (= c!97294 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!419145 () Unit!31415)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!268 (array!55675 array!55677 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 64) (_ BitVec 32) Int) Unit!31415)

(assert (=> b!929348 (= lt!419145 (lemmaListMapContainsThenArrayContainsFrom!268 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!929348 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18811)))

(declare-fun lt!419149 () Unit!31415)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55675 (_ BitVec 32) (_ BitVec 32)) Unit!31415)

(assert (=> b!929348 (= lt!419149 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!929348 (contains!4941 lt!419153 k0!1099)))

(declare-fun lt!419147 () tuple2!13008)

(declare-fun +!2777 (ListLongMap!11707 tuple2!13008) ListLongMap!11707)

(assert (=> b!929348 (= lt!419153 (+!2777 lt!419151 lt!419147))))

(declare-fun lt!419140 () Unit!31415)

(declare-fun addStillContains!486 (ListLongMap!11707 (_ BitVec 64) V!31407 (_ BitVec 64)) Unit!31415)

(assert (=> b!929348 (= lt!419140 (addStillContains!486 lt!419151 lt!419144 lt!419152 k0!1099))))

(assert (=> b!929348 (= (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2777 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419147))))

(assert (=> b!929348 (= lt!419147 (tuple2!13009 lt!419144 lt!419152))))

(declare-fun get!14120 (ValueCell!9434 V!31407) V!31407)

(declare-fun dynLambda!1574 (Int (_ BitVec 64)) V!31407)

(assert (=> b!929348 (= lt!419152 (get!14120 (select (arr!26779 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1574 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419139 () Unit!31415)

(declare-fun lemmaListMapRecursiveValidKeyArray!157 (array!55675 array!55677 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 32) Int) Unit!31415)

(assert (=> b!929348 (= lt!419139 (lemmaListMapRecursiveValidKeyArray!157 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!929348 (= e!521863 lt!419150)))

(declare-fun b!929349 () Bool)

(declare-fun Unit!31418 () Unit!31415)

(assert (=> b!929349 (= e!521868 Unit!31418)))

(declare-fun mapIsEmpty!31503 () Bool)

(assert (=> mapIsEmpty!31503 mapRes!31503))

(declare-fun b!929350 () Bool)

(assert (=> b!929350 (= e!521864 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!929351 () Bool)

(declare-fun res!625569 () Bool)

(assert (=> b!929351 (=> (not res!625569) (not e!521866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55675 (_ BitVec 32)) Bool)

(assert (=> b!929351 (= res!625569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79278 res!625562) b!929347))

(assert (= (and b!929347 res!625571) b!929351))

(assert (= (and b!929351 res!625569) b!929332))

(assert (= (and b!929332 res!625567) b!929345))

(assert (= (and b!929345 res!625572) b!929341))

(assert (= (and b!929341 res!625563) b!929344))

(assert (= (and b!929344 res!625570) b!929342))

(assert (= (and b!929342 c!97295) b!929340))

(assert (= (and b!929342 (not c!97295)) b!929349))

(assert (= (and b!929340 c!97296) b!929348))

(assert (= (and b!929340 (not c!97296)) b!929337))

(assert (= (and b!929348 c!97294) b!929338))

(assert (= (and b!929348 (not c!97294)) b!929350))

(assert (= (and b!929342 res!625564) b!929333))

(assert (= (and b!929333 res!625568) b!929335))

(assert (= (and b!929335 res!625565) b!929336))

(assert (= (and b!929336 res!625566) b!929339))

(assert (= (and b!929346 condMapEmpty!31503) mapIsEmpty!31503))

(assert (= (and b!929346 (not condMapEmpty!31503)) mapNonEmpty!31503))

(get-info :version)

(assert (= (and mapNonEmpty!31503 ((_ is ValueCellFull!9434) mapValue!31503)) b!929343))

(assert (= (and b!929346 ((_ is ValueCellFull!9434) mapDefault!31503)) b!929334))

(assert (= start!79278 b!929346))

(declare-fun b_lambda!13839 () Bool)

(assert (=> (not b_lambda!13839) (not b!929348)))

(declare-fun t!26858 () Bool)

(declare-fun tb!5895 () Bool)

(assert (=> (and start!79278 (= defaultEntry!1235 defaultEntry!1235) t!26858) tb!5895))

(declare-fun result!11621 () Bool)

(assert (=> tb!5895 (= result!11621 tp_is_empty!19831)))

(assert (=> b!929348 t!26858))

(declare-fun b_and!28395 () Bool)

(assert (= b_and!28393 (and (=> t!26858 result!11621) b_and!28395)))

(declare-fun m!864529 () Bool)

(assert (=> b!929339 m!864529))

(declare-fun m!864531 () Bool)

(assert (=> start!79278 m!864531))

(declare-fun m!864533 () Bool)

(assert (=> start!79278 m!864533))

(declare-fun m!864535 () Bool)

(assert (=> start!79278 m!864535))

(declare-fun m!864537 () Bool)

(assert (=> b!929335 m!864537))

(declare-fun m!864539 () Bool)

(assert (=> b!929341 m!864539))

(declare-fun m!864541 () Bool)

(assert (=> b!929341 m!864541))

(declare-fun m!864543 () Bool)

(assert (=> mapNonEmpty!31503 m!864543))

(declare-fun m!864545 () Bool)

(assert (=> b!929333 m!864545))

(declare-fun m!864547 () Bool)

(assert (=> b!929333 m!864547))

(declare-fun m!864549 () Bool)

(assert (=> b!929344 m!864549))

(declare-fun m!864551 () Bool)

(assert (=> b!929332 m!864551))

(declare-fun m!864553 () Bool)

(assert (=> b!929336 m!864553))

(declare-fun m!864555 () Bool)

(assert (=> b!929336 m!864555))

(declare-fun m!864557 () Bool)

(assert (=> b!929336 m!864557))

(declare-fun m!864559 () Bool)

(assert (=> b!929351 m!864559))

(declare-fun m!864561 () Bool)

(assert (=> b!929338 m!864561))

(declare-fun m!864563 () Bool)

(assert (=> b!929348 m!864563))

(declare-fun m!864565 () Bool)

(assert (=> b!929348 m!864565))

(declare-fun m!864567 () Bool)

(assert (=> b!929348 m!864567))

(declare-fun m!864569 () Bool)

(assert (=> b!929348 m!864569))

(declare-fun m!864571 () Bool)

(assert (=> b!929348 m!864571))

(declare-fun m!864573 () Bool)

(assert (=> b!929348 m!864573))

(declare-fun m!864575 () Bool)

(assert (=> b!929348 m!864575))

(assert (=> b!929348 m!864569))

(assert (=> b!929348 m!864571))

(declare-fun m!864577 () Bool)

(assert (=> b!929348 m!864577))

(assert (=> b!929348 m!864547))

(declare-fun m!864579 () Bool)

(assert (=> b!929348 m!864579))

(declare-fun m!864581 () Bool)

(assert (=> b!929348 m!864581))

(declare-fun m!864583 () Bool)

(assert (=> b!929348 m!864583))

(declare-fun m!864585 () Bool)

(assert (=> b!929348 m!864585))

(assert (=> b!929348 m!864583))

(declare-fun m!864587 () Bool)

(assert (=> b!929348 m!864587))

(declare-fun m!864589 () Bool)

(assert (=> b!929348 m!864589))

(declare-fun m!864591 () Bool)

(assert (=> b!929348 m!864591))

(declare-fun m!864593 () Bool)

(assert (=> b!929340 m!864593))

(declare-fun m!864595 () Bool)

(assert (=> b!929340 m!864595))

(declare-fun m!864597 () Bool)

(assert (=> b!929342 m!864597))

(check-sat (not b!929340) (not b!929351) (not start!79278) (not b_next!17323) (not b!929333) (not b!929344) (not b!929336) (not b!929342) (not b_lambda!13839) (not b!929348) (not b!929339) (not b!929332) (not b!929335) (not b!929338) (not b!929341) (not mapNonEmpty!31503) tp_is_empty!19831 b_and!28395)
(check-sat b_and!28395 (not b_next!17323))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79032 () Bool)

(assert start!79032)

(declare-fun b_free!17263 () Bool)

(declare-fun b_next!17263 () Bool)

(assert (=> start!79032 (= b_free!17263 (not b_next!17263))))

(declare-fun tp!60231 () Bool)

(declare-fun b_and!28237 () Bool)

(assert (=> start!79032 (= tp!60231 b_and!28237)))

(declare-fun b!926330 () Bool)

(declare-fun res!624124 () Bool)

(declare-fun e!519974 () Bool)

(assert (=> b!926330 (=> (not res!624124) (not e!519974))))

(declare-datatypes ((array!55481 0))(
  ( (array!55482 (arr!26686 (Array (_ BitVec 32) (_ BitVec 64))) (size!27147 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55481)

(declare-datatypes ((List!18794 0))(
  ( (Nil!18791) (Cons!18790 (h!19936 (_ BitVec 64)) (t!26778 List!18794)) )
))
(declare-fun arrayNoDuplicates!0 (array!55481 (_ BitVec 32) List!18794) Bool)

(assert (=> b!926330 (= res!624124 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18791))))

(declare-fun b!926331 () Bool)

(declare-datatypes ((Unit!31230 0))(
  ( (Unit!31231) )
))
(declare-fun e!519975 () Unit!31230)

(declare-fun Unit!31232 () Unit!31230)

(assert (=> b!926331 (= e!519975 Unit!31232)))

(declare-fun b!926332 () Bool)

(declare-fun e!519963 () Bool)

(assert (=> b!926332 (= e!519963 (not (bvsle #b00000000000000000000000000000000 (size!27147 _keys!1487))))))

(declare-fun e!519968 () Bool)

(assert (=> b!926332 e!519968))

(declare-fun res!624126 () Bool)

(assert (=> b!926332 (=> (not res!624126) (not e!519968))))

(declare-datatypes ((V!31327 0))(
  ( (V!31328 (val!9936 Int)) )
))
(declare-datatypes ((tuple2!13022 0))(
  ( (tuple2!13023 (_1!6522 (_ BitVec 64)) (_2!6522 V!31327)) )
))
(declare-datatypes ((List!18795 0))(
  ( (Nil!18792) (Cons!18791 (h!19937 tuple2!13022) (t!26779 List!18795)) )
))
(declare-datatypes ((ListLongMap!11709 0))(
  ( (ListLongMap!11710 (toList!5870 List!18795)) )
))
(declare-fun lt!417108 () ListLongMap!11709)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4882 (ListLongMap!11709 (_ BitVec 64)) Bool)

(assert (=> b!926332 (= res!624126 (contains!4882 lt!417108 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9404 0))(
  ( (ValueCellFull!9404 (v!12453 V!31327)) (EmptyCell!9404) )
))
(declare-datatypes ((array!55483 0))(
  ( (array!55484 (arr!26687 (Array (_ BitVec 32) ValueCell!9404)) (size!27148 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55483)

(declare-fun zeroValue!1173 () V!31327)

(declare-fun minValue!1173 () V!31327)

(declare-fun getCurrentListMap!3056 (array!55481 array!55483 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 32) Int) ListLongMap!11709)

(assert (=> b!926332 (= lt!417108 (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31327)

(declare-fun lt!417101 () Unit!31230)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!86 (array!55481 array!55483 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 64) V!31327 (_ BitVec 32) Int) Unit!31230)

(assert (=> b!926332 (= lt!417101 (lemmaListMapApplyFromThenApplyFromZero!86 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926333 () Bool)

(declare-fun apply!681 (ListLongMap!11709 (_ BitVec 64)) V!31327)

(assert (=> b!926333 (= e!519968 (= (apply!681 lt!417108 k0!1099) v!791))))

(declare-fun b!926334 () Bool)

(declare-fun res!624119 () Bool)

(assert (=> b!926334 (=> (not res!624119) (not e!519974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55481 (_ BitVec 32)) Bool)

(assert (=> b!926334 (= res!624119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926335 () Bool)

(declare-fun e!519971 () Bool)

(declare-fun tp_is_empty!19771 () Bool)

(assert (=> b!926335 (= e!519971 tp_is_empty!19771)))

(declare-fun b!926336 () Bool)

(declare-fun e!519965 () Unit!31230)

(declare-fun Unit!31233 () Unit!31230)

(assert (=> b!926336 (= e!519965 Unit!31233)))

(declare-fun b!926337 () Bool)

(declare-fun e!519973 () Bool)

(assert (=> b!926337 (= e!519973 e!519963)))

(declare-fun res!624120 () Bool)

(assert (=> b!926337 (=> (not res!624120) (not e!519963))))

(declare-fun lt!417115 () ListLongMap!11709)

(assert (=> b!926337 (= res!624120 (contains!4882 lt!417115 k0!1099))))

(assert (=> b!926337 (= lt!417115 (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926338 () Bool)

(assert (=> b!926338 (= e!519965 e!519975)))

(declare-fun lt!417113 () (_ BitVec 64))

(assert (=> b!926338 (= lt!417113 (select (arr!26686 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96678 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926338 (= c!96678 (validKeyInArray!0 lt!417113))))

(declare-fun b!926339 () Bool)

(declare-fun e!519967 () Bool)

(assert (=> b!926339 (= e!519967 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!624122 () Bool)

(assert (=> start!79032 (=> (not res!624122) (not e!519974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79032 (= res!624122 (validMask!0 mask!1881))))

(assert (=> start!79032 e!519974))

(assert (=> start!79032 true))

(assert (=> start!79032 tp_is_empty!19771))

(declare-fun e!519970 () Bool)

(declare-fun array_inv!20866 (array!55483) Bool)

(assert (=> start!79032 (and (array_inv!20866 _values!1231) e!519970)))

(assert (=> start!79032 tp!60231))

(declare-fun array_inv!20867 (array!55481) Bool)

(assert (=> start!79032 (array_inv!20867 _keys!1487)))

(declare-fun b!926340 () Bool)

(declare-fun arrayContainsKey!0 (array!55481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926340 (= e!519967 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31413 () Bool)

(declare-fun mapRes!31413 () Bool)

(assert (=> mapIsEmpty!31413 mapRes!31413))

(declare-fun b!926341 () Bool)

(declare-fun res!624128 () Bool)

(assert (=> b!926341 (=> (not res!624128) (not e!519974))))

(assert (=> b!926341 (= res!624128 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27147 _keys!1487))))))

(declare-fun b!926342 () Bool)

(declare-fun res!624118 () Bool)

(assert (=> b!926342 (=> (not res!624118) (not e!519963))))

(assert (=> b!926342 (= res!624118 (= (apply!681 lt!417115 k0!1099) v!791))))

(declare-fun b!926343 () Bool)

(declare-fun e!519969 () Bool)

(assert (=> b!926343 (= e!519974 e!519969)))

(declare-fun res!624121 () Bool)

(assert (=> b!926343 (=> (not res!624121) (not e!519969))))

(declare-fun lt!417105 () ListLongMap!11709)

(assert (=> b!926343 (= res!624121 (contains!4882 lt!417105 k0!1099))))

(assert (=> b!926343 (= lt!417105 (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926344 () Bool)

(declare-fun e!519972 () Bool)

(assert (=> b!926344 (= e!519972 e!519973)))

(declare-fun res!624127 () Bool)

(assert (=> b!926344 (=> (not res!624127) (not e!519973))))

(assert (=> b!926344 (= res!624127 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27147 _keys!1487)))))

(declare-fun lt!417112 () Unit!31230)

(assert (=> b!926344 (= lt!417112 e!519965)))

(declare-fun c!96679 () Bool)

(assert (=> b!926344 (= c!96679 (validKeyInArray!0 k0!1099))))

(declare-fun b!926345 () Bool)

(assert (=> b!926345 (= e!519969 e!519972)))

(declare-fun res!624123 () Bool)

(assert (=> b!926345 (=> (not res!624123) (not e!519972))))

(declare-fun lt!417111 () V!31327)

(assert (=> b!926345 (= res!624123 (and (= lt!417111 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926345 (= lt!417111 (apply!681 lt!417105 k0!1099))))

(declare-fun b!926346 () Bool)

(declare-fun e!519966 () Bool)

(assert (=> b!926346 (= e!519966 tp_is_empty!19771)))

(declare-fun b!926347 () Bool)

(declare-fun res!624125 () Bool)

(assert (=> b!926347 (=> (not res!624125) (not e!519974))))

(assert (=> b!926347 (= res!624125 (and (= (size!27148 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27147 _keys!1487) (size!27148 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31413 () Bool)

(declare-fun tp!60230 () Bool)

(assert (=> mapNonEmpty!31413 (= mapRes!31413 (and tp!60230 e!519966))))

(declare-fun mapKey!31413 () (_ BitVec 32))

(declare-fun mapValue!31413 () ValueCell!9404)

(declare-fun mapRest!31413 () (Array (_ BitVec 32) ValueCell!9404))

(assert (=> mapNonEmpty!31413 (= (arr!26687 _values!1231) (store mapRest!31413 mapKey!31413 mapValue!31413))))

(declare-fun b!926348 () Bool)

(declare-fun lt!417109 () ListLongMap!11709)

(assert (=> b!926348 (= (apply!681 lt!417109 k0!1099) lt!417111)))

(declare-fun lt!417103 () Unit!31230)

(declare-fun lt!417116 () V!31327)

(declare-fun addApplyDifferent!389 (ListLongMap!11709 (_ BitVec 64) V!31327 (_ BitVec 64)) Unit!31230)

(assert (=> b!926348 (= lt!417103 (addApplyDifferent!389 lt!417105 lt!417113 lt!417116 k0!1099))))

(assert (=> b!926348 (not (= lt!417113 k0!1099))))

(declare-fun lt!417114 () Unit!31230)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55481 (_ BitVec 64) (_ BitVec 32) List!18794) Unit!31230)

(assert (=> b!926348 (= lt!417114 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18791))))

(assert (=> b!926348 e!519967))

(declare-fun c!96677 () Bool)

(assert (=> b!926348 (= c!96677 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417104 () Unit!31230)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!249 (array!55481 array!55483 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 64) (_ BitVec 32) Int) Unit!31230)

(assert (=> b!926348 (= lt!417104 (lemmaListMapContainsThenArrayContainsFrom!249 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926348 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18791)))

(declare-fun lt!417110 () Unit!31230)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55481 (_ BitVec 32) (_ BitVec 32)) Unit!31230)

(assert (=> b!926348 (= lt!417110 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926348 (contains!4882 lt!417109 k0!1099)))

(declare-fun lt!417107 () tuple2!13022)

(declare-fun +!2761 (ListLongMap!11709 tuple2!13022) ListLongMap!11709)

(assert (=> b!926348 (= lt!417109 (+!2761 lt!417105 lt!417107))))

(declare-fun lt!417106 () Unit!31230)

(declare-fun addStillContains!458 (ListLongMap!11709 (_ BitVec 64) V!31327 (_ BitVec 64)) Unit!31230)

(assert (=> b!926348 (= lt!417106 (addStillContains!458 lt!417105 lt!417113 lt!417116 k0!1099))))

(assert (=> b!926348 (= (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2761 (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417107))))

(assert (=> b!926348 (= lt!417107 (tuple2!13023 lt!417113 lt!417116))))

(declare-fun get!14044 (ValueCell!9404 V!31327) V!31327)

(declare-fun dynLambda!1517 (Int (_ BitVec 64)) V!31327)

(assert (=> b!926348 (= lt!417116 (get!14044 (select (arr!26687 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1517 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417102 () Unit!31230)

(declare-fun lemmaListMapRecursiveValidKeyArray!125 (array!55481 array!55483 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 32) Int) Unit!31230)

(assert (=> b!926348 (= lt!417102 (lemmaListMapRecursiveValidKeyArray!125 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926348 (= e!519975 lt!417103)))

(declare-fun b!926349 () Bool)

(assert (=> b!926349 (= e!519970 (and e!519971 mapRes!31413))))

(declare-fun condMapEmpty!31413 () Bool)

(declare-fun mapDefault!31413 () ValueCell!9404)

(assert (=> b!926349 (= condMapEmpty!31413 (= (arr!26687 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9404)) mapDefault!31413)))))

(assert (= (and start!79032 res!624122) b!926347))

(assert (= (and b!926347 res!624125) b!926334))

(assert (= (and b!926334 res!624119) b!926330))

(assert (= (and b!926330 res!624124) b!926341))

(assert (= (and b!926341 res!624128) b!926343))

(assert (= (and b!926343 res!624121) b!926345))

(assert (= (and b!926345 res!624123) b!926344))

(assert (= (and b!926344 c!96679) b!926338))

(assert (= (and b!926344 (not c!96679)) b!926336))

(assert (= (and b!926338 c!96678) b!926348))

(assert (= (and b!926338 (not c!96678)) b!926331))

(assert (= (and b!926348 c!96677) b!926340))

(assert (= (and b!926348 (not c!96677)) b!926339))

(assert (= (and b!926344 res!624127) b!926337))

(assert (= (and b!926337 res!624120) b!926342))

(assert (= (and b!926342 res!624118) b!926332))

(assert (= (and b!926332 res!624126) b!926333))

(assert (= (and b!926349 condMapEmpty!31413) mapIsEmpty!31413))

(assert (= (and b!926349 (not condMapEmpty!31413)) mapNonEmpty!31413))

(get-info :version)

(assert (= (and mapNonEmpty!31413 ((_ is ValueCellFull!9404) mapValue!31413)) b!926346))

(assert (= (and b!926349 ((_ is ValueCellFull!9404) mapDefault!31413)) b!926335))

(assert (= start!79032 b!926349))

(declare-fun b_lambda!13747 () Bool)

(assert (=> (not b_lambda!13747) (not b!926348)))

(declare-fun t!26777 () Bool)

(declare-fun tb!5835 () Bool)

(assert (=> (and start!79032 (= defaultEntry!1235 defaultEntry!1235) t!26777) tb!5835))

(declare-fun result!11501 () Bool)

(assert (=> tb!5835 (= result!11501 tp_is_empty!19771)))

(assert (=> b!926348 t!26777))

(declare-fun b_and!28239 () Bool)

(assert (= b_and!28237 (and (=> t!26777 result!11501) b_and!28239)))

(declare-fun m!860377 () Bool)

(assert (=> b!926332 m!860377))

(declare-fun m!860379 () Bool)

(assert (=> b!926332 m!860379))

(declare-fun m!860381 () Bool)

(assert (=> b!926332 m!860381))

(declare-fun m!860383 () Bool)

(assert (=> b!926333 m!860383))

(declare-fun m!860385 () Bool)

(assert (=> start!79032 m!860385))

(declare-fun m!860387 () Bool)

(assert (=> start!79032 m!860387))

(declare-fun m!860389 () Bool)

(assert (=> start!79032 m!860389))

(declare-fun m!860391 () Bool)

(assert (=> b!926330 m!860391))

(declare-fun m!860393 () Bool)

(assert (=> b!926348 m!860393))

(declare-fun m!860395 () Bool)

(assert (=> b!926348 m!860395))

(declare-fun m!860397 () Bool)

(assert (=> b!926348 m!860397))

(declare-fun m!860399 () Bool)

(assert (=> b!926348 m!860399))

(declare-fun m!860401 () Bool)

(assert (=> b!926348 m!860401))

(declare-fun m!860403 () Bool)

(assert (=> b!926348 m!860403))

(assert (=> b!926348 m!860399))

(assert (=> b!926348 m!860403))

(declare-fun m!860405 () Bool)

(assert (=> b!926348 m!860405))

(declare-fun m!860407 () Bool)

(assert (=> b!926348 m!860407))

(declare-fun m!860409 () Bool)

(assert (=> b!926348 m!860409))

(declare-fun m!860411 () Bool)

(assert (=> b!926348 m!860411))

(declare-fun m!860413 () Bool)

(assert (=> b!926348 m!860413))

(declare-fun m!860415 () Bool)

(assert (=> b!926348 m!860415))

(declare-fun m!860417 () Bool)

(assert (=> b!926348 m!860417))

(declare-fun m!860419 () Bool)

(assert (=> b!926348 m!860419))

(declare-fun m!860421 () Bool)

(assert (=> b!926348 m!860421))

(assert (=> b!926348 m!860413))

(declare-fun m!860423 () Bool)

(assert (=> b!926348 m!860423))

(declare-fun m!860425 () Bool)

(assert (=> mapNonEmpty!31413 m!860425))

(declare-fun m!860427 () Bool)

(assert (=> b!926334 m!860427))

(declare-fun m!860429 () Bool)

(assert (=> b!926343 m!860429))

(declare-fun m!860431 () Bool)

(assert (=> b!926343 m!860431))

(declare-fun m!860433 () Bool)

(assert (=> b!926345 m!860433))

(declare-fun m!860435 () Bool)

(assert (=> b!926340 m!860435))

(declare-fun m!860437 () Bool)

(assert (=> b!926338 m!860437))

(declare-fun m!860439 () Bool)

(assert (=> b!926338 m!860439))

(declare-fun m!860441 () Bool)

(assert (=> b!926337 m!860441))

(assert (=> b!926337 m!860407))

(declare-fun m!860443 () Bool)

(assert (=> b!926344 m!860443))

(declare-fun m!860445 () Bool)

(assert (=> b!926342 m!860445))

(check-sat (not b!926342) (not b!926333) (not b!926344) (not b!926334) (not b!926330) (not b!926345) (not b!926338) (not b!926348) b_and!28239 tp_is_empty!19771 (not b_lambda!13747) (not mapNonEmpty!31413) (not b!926340) (not b!926337) (not b!926343) (not start!79032) (not b_next!17263) (not b!926332))
(check-sat b_and!28239 (not b_next!17263))

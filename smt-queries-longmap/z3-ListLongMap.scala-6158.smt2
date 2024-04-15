; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79038 () Bool)

(assert start!79038)

(declare-fun b_free!17269 () Bool)

(declare-fun b_next!17269 () Bool)

(assert (=> start!79038 (= b_free!17269 (not b_next!17269))))

(declare-fun tp!60249 () Bool)

(declare-fun b_and!28249 () Bool)

(assert (=> start!79038 (= tp!60249 b_and!28249)))

(declare-fun b!926516 () Bool)

(declare-fun e!520084 () Bool)

(declare-fun tp_is_empty!19777 () Bool)

(assert (=> b!926516 (= e!520084 tp_is_empty!19777)))

(declare-fun res!624220 () Bool)

(declare-fun e!520080 () Bool)

(assert (=> start!79038 (=> (not res!624220) (not e!520080))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79038 (= res!624220 (validMask!0 mask!1881))))

(assert (=> start!79038 e!520080))

(assert (=> start!79038 true))

(assert (=> start!79038 tp_is_empty!19777))

(declare-datatypes ((V!31335 0))(
  ( (V!31336 (val!9939 Int)) )
))
(declare-datatypes ((ValueCell!9407 0))(
  ( (ValueCellFull!9407 (v!12456 V!31335)) (EmptyCell!9407) )
))
(declare-datatypes ((array!55493 0))(
  ( (array!55494 (arr!26692 (Array (_ BitVec 32) ValueCell!9407)) (size!27153 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55493)

(declare-fun e!520087 () Bool)

(declare-fun array_inv!20872 (array!55493) Bool)

(assert (=> start!79038 (and (array_inv!20872 _values!1231) e!520087)))

(assert (=> start!79038 tp!60249))

(declare-datatypes ((array!55495 0))(
  ( (array!55496 (arr!26693 (Array (_ BitVec 32) (_ BitVec 64))) (size!27154 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55495)

(declare-fun array_inv!20873 (array!55495) Bool)

(assert (=> start!79038 (array_inv!20873 _keys!1487)))

(declare-fun b!926517 () Bool)

(declare-fun e!520086 () Bool)

(assert (=> b!926517 (= e!520080 e!520086)))

(declare-fun res!624222 () Bool)

(assert (=> b!926517 (=> (not res!624222) (not e!520086))))

(declare-datatypes ((tuple2!13028 0))(
  ( (tuple2!13029 (_1!6525 (_ BitVec 64)) (_2!6525 V!31335)) )
))
(declare-datatypes ((List!18800 0))(
  ( (Nil!18797) (Cons!18796 (h!19942 tuple2!13028) (t!26790 List!18800)) )
))
(declare-datatypes ((ListLongMap!11715 0))(
  ( (ListLongMap!11716 (toList!5873 List!18800)) )
))
(declare-fun lt!417254 () ListLongMap!11715)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4884 (ListLongMap!11715 (_ BitVec 64)) Bool)

(assert (=> b!926517 (= res!624222 (contains!4884 lt!417254 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31335)

(declare-fun minValue!1173 () V!31335)

(declare-fun getCurrentListMap!3058 (array!55495 array!55493 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 32) Int) ListLongMap!11715)

(assert (=> b!926517 (= lt!417254 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926518 () Bool)

(declare-fun res!624226 () Bool)

(assert (=> b!926518 (=> (not res!624226) (not e!520080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55495 (_ BitVec 32)) Bool)

(assert (=> b!926518 (= res!624226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926519 () Bool)

(declare-fun e!520082 () Bool)

(declare-fun e!520088 () Bool)

(assert (=> b!926519 (= e!520082 e!520088)))

(declare-fun res!624223 () Bool)

(assert (=> b!926519 (=> (not res!624223) (not e!520088))))

(assert (=> b!926519 (= res!624223 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27154 _keys!1487)))))

(declare-datatypes ((Unit!31240 0))(
  ( (Unit!31241) )
))
(declare-fun lt!417256 () Unit!31240)

(declare-fun e!520081 () Unit!31240)

(assert (=> b!926519 (= lt!417256 e!520081)))

(declare-fun c!96704 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926519 (= c!96704 (validKeyInArray!0 k0!1099))))

(declare-fun b!926520 () Bool)

(assert (=> b!926520 (= e!520086 e!520082)))

(declare-fun res!624221 () Bool)

(assert (=> b!926520 (=> (not res!624221) (not e!520082))))

(declare-fun v!791 () V!31335)

(declare-fun lt!417247 () V!31335)

(assert (=> b!926520 (= res!624221 (and (= lt!417247 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!684 (ListLongMap!11715 (_ BitVec 64)) V!31335)

(assert (=> b!926520 (= lt!417247 (apply!684 lt!417254 k0!1099))))

(declare-fun b!926521 () Bool)

(declare-fun res!624225 () Bool)

(assert (=> b!926521 (=> (not res!624225) (not e!520080))))

(assert (=> b!926521 (= res!624225 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27154 _keys!1487))))))

(declare-fun b!926522 () Bool)

(declare-fun res!624219 () Bool)

(assert (=> b!926522 (=> (not res!624219) (not e!520080))))

(declare-datatypes ((List!18801 0))(
  ( (Nil!18798) (Cons!18797 (h!19943 (_ BitVec 64)) (t!26791 List!18801)) )
))
(declare-fun arrayNoDuplicates!0 (array!55495 (_ BitVec 32) List!18801) Bool)

(assert (=> b!926522 (= res!624219 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18798))))

(declare-fun b!926523 () Bool)

(declare-fun e!520091 () Bool)

(assert (=> b!926523 (= e!520088 e!520091)))

(declare-fun res!624217 () Bool)

(assert (=> b!926523 (=> (not res!624217) (not e!520091))))

(declare-fun lt!417255 () ListLongMap!11715)

(assert (=> b!926523 (= res!624217 (contains!4884 lt!417255 k0!1099))))

(assert (=> b!926523 (= lt!417255 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926524 () Bool)

(assert (=> b!926524 (= e!520091 (not true))))

(declare-fun e!520089 () Bool)

(assert (=> b!926524 e!520089))

(declare-fun res!624224 () Bool)

(assert (=> b!926524 (=> (not res!624224) (not e!520089))))

(declare-fun lt!417260 () ListLongMap!11715)

(assert (=> b!926524 (= res!624224 (contains!4884 lt!417260 k0!1099))))

(assert (=> b!926524 (= lt!417260 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417245 () Unit!31240)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!87 (array!55495 array!55493 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 64) V!31335 (_ BitVec 32) Int) Unit!31240)

(assert (=> b!926524 (= lt!417245 (lemmaListMapApplyFromThenApplyFromZero!87 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926525 () Bool)

(declare-fun Unit!31242 () Unit!31240)

(assert (=> b!926525 (= e!520081 Unit!31242)))

(declare-fun b!926526 () Bool)

(declare-fun mapRes!31422 () Bool)

(assert (=> b!926526 (= e!520087 (and e!520084 mapRes!31422))))

(declare-fun condMapEmpty!31422 () Bool)

(declare-fun mapDefault!31422 () ValueCell!9407)

(assert (=> b!926526 (= condMapEmpty!31422 (= (arr!26692 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9407)) mapDefault!31422)))))

(declare-fun b!926527 () Bool)

(assert (=> b!926527 (= e!520089 (= (apply!684 lt!417260 k0!1099) v!791))))

(declare-fun b!926528 () Bool)

(declare-fun res!624227 () Bool)

(assert (=> b!926528 (=> (not res!624227) (not e!520091))))

(assert (=> b!926528 (= res!624227 (= (apply!684 lt!417255 k0!1099) v!791))))

(declare-fun b!926529 () Bool)

(declare-fun e!520090 () Bool)

(assert (=> b!926529 (= e!520090 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926530 () Bool)

(declare-fun lt!417250 () ListLongMap!11715)

(assert (=> b!926530 (= (apply!684 lt!417250 k0!1099) lt!417247)))

(declare-fun lt!417251 () V!31335)

(declare-fun lt!417253 () (_ BitVec 64))

(declare-fun lt!417259 () Unit!31240)

(declare-fun addApplyDifferent!391 (ListLongMap!11715 (_ BitVec 64) V!31335 (_ BitVec 64)) Unit!31240)

(assert (=> b!926530 (= lt!417259 (addApplyDifferent!391 lt!417254 lt!417253 lt!417251 k0!1099))))

(assert (=> b!926530 (not (= lt!417253 k0!1099))))

(declare-fun lt!417252 () Unit!31240)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55495 (_ BitVec 64) (_ BitVec 32) List!18801) Unit!31240)

(assert (=> b!926530 (= lt!417252 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18798))))

(assert (=> b!926530 e!520090))

(declare-fun c!96706 () Bool)

(assert (=> b!926530 (= c!96706 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417248 () Unit!31240)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!251 (array!55495 array!55493 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 64) (_ BitVec 32) Int) Unit!31240)

(assert (=> b!926530 (= lt!417248 (lemmaListMapContainsThenArrayContainsFrom!251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926530 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18798)))

(declare-fun lt!417249 () Unit!31240)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55495 (_ BitVec 32) (_ BitVec 32)) Unit!31240)

(assert (=> b!926530 (= lt!417249 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926530 (contains!4884 lt!417250 k0!1099)))

(declare-fun lt!417257 () tuple2!13028)

(declare-fun +!2763 (ListLongMap!11715 tuple2!13028) ListLongMap!11715)

(assert (=> b!926530 (= lt!417250 (+!2763 lt!417254 lt!417257))))

(declare-fun lt!417246 () Unit!31240)

(declare-fun addStillContains!460 (ListLongMap!11715 (_ BitVec 64) V!31335 (_ BitVec 64)) Unit!31240)

(assert (=> b!926530 (= lt!417246 (addStillContains!460 lt!417254 lt!417253 lt!417251 k0!1099))))

(assert (=> b!926530 (= (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2763 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417257))))

(assert (=> b!926530 (= lt!417257 (tuple2!13029 lt!417253 lt!417251))))

(declare-fun get!14048 (ValueCell!9407 V!31335) V!31335)

(declare-fun dynLambda!1519 (Int (_ BitVec 64)) V!31335)

(assert (=> b!926530 (= lt!417251 (get!14048 (select (arr!26692 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1519 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417258 () Unit!31240)

(declare-fun lemmaListMapRecursiveValidKeyArray!127 (array!55495 array!55493 (_ BitVec 32) (_ BitVec 32) V!31335 V!31335 (_ BitVec 32) Int) Unit!31240)

(assert (=> b!926530 (= lt!417258 (lemmaListMapRecursiveValidKeyArray!127 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520092 () Unit!31240)

(assert (=> b!926530 (= e!520092 lt!417259)))

(declare-fun b!926531 () Bool)

(declare-fun arrayContainsKey!0 (array!55495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926531 (= e!520090 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!31422 () Bool)

(declare-fun tp!60248 () Bool)

(declare-fun e!520085 () Bool)

(assert (=> mapNonEmpty!31422 (= mapRes!31422 (and tp!60248 e!520085))))

(declare-fun mapValue!31422 () ValueCell!9407)

(declare-fun mapKey!31422 () (_ BitVec 32))

(declare-fun mapRest!31422 () (Array (_ BitVec 32) ValueCell!9407))

(assert (=> mapNonEmpty!31422 (= (arr!26692 _values!1231) (store mapRest!31422 mapKey!31422 mapValue!31422))))

(declare-fun b!926532 () Bool)

(assert (=> b!926532 (= e!520081 e!520092)))

(assert (=> b!926532 (= lt!417253 (select (arr!26693 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96705 () Bool)

(assert (=> b!926532 (= c!96705 (validKeyInArray!0 lt!417253))))

(declare-fun b!926533 () Bool)

(assert (=> b!926533 (= e!520085 tp_is_empty!19777)))

(declare-fun b!926534 () Bool)

(declare-fun res!624218 () Bool)

(assert (=> b!926534 (=> (not res!624218) (not e!520080))))

(assert (=> b!926534 (= res!624218 (and (= (size!27153 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27154 _keys!1487) (size!27153 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31422 () Bool)

(assert (=> mapIsEmpty!31422 mapRes!31422))

(declare-fun b!926535 () Bool)

(declare-fun Unit!31243 () Unit!31240)

(assert (=> b!926535 (= e!520092 Unit!31243)))

(assert (= (and start!79038 res!624220) b!926534))

(assert (= (and b!926534 res!624218) b!926518))

(assert (= (and b!926518 res!624226) b!926522))

(assert (= (and b!926522 res!624219) b!926521))

(assert (= (and b!926521 res!624225) b!926517))

(assert (= (and b!926517 res!624222) b!926520))

(assert (= (and b!926520 res!624221) b!926519))

(assert (= (and b!926519 c!96704) b!926532))

(assert (= (and b!926519 (not c!96704)) b!926525))

(assert (= (and b!926532 c!96705) b!926530))

(assert (= (and b!926532 (not c!96705)) b!926535))

(assert (= (and b!926530 c!96706) b!926531))

(assert (= (and b!926530 (not c!96706)) b!926529))

(assert (= (and b!926519 res!624223) b!926523))

(assert (= (and b!926523 res!624217) b!926528))

(assert (= (and b!926528 res!624227) b!926524))

(assert (= (and b!926524 res!624224) b!926527))

(assert (= (and b!926526 condMapEmpty!31422) mapIsEmpty!31422))

(assert (= (and b!926526 (not condMapEmpty!31422)) mapNonEmpty!31422))

(get-info :version)

(assert (= (and mapNonEmpty!31422 ((_ is ValueCellFull!9407) mapValue!31422)) b!926533))

(assert (= (and b!926526 ((_ is ValueCellFull!9407) mapDefault!31422)) b!926516))

(assert (= start!79038 b!926526))

(declare-fun b_lambda!13753 () Bool)

(assert (=> (not b_lambda!13753) (not b!926530)))

(declare-fun t!26789 () Bool)

(declare-fun tb!5841 () Bool)

(assert (=> (and start!79038 (= defaultEntry!1235 defaultEntry!1235) t!26789) tb!5841))

(declare-fun result!11513 () Bool)

(assert (=> tb!5841 (= result!11513 tp_is_empty!19777)))

(assert (=> b!926530 t!26789))

(declare-fun b_and!28251 () Bool)

(assert (= b_and!28249 (and (=> t!26789 result!11513) b_and!28251)))

(declare-fun m!860587 () Bool)

(assert (=> b!926523 m!860587))

(declare-fun m!860589 () Bool)

(assert (=> b!926523 m!860589))

(declare-fun m!860591 () Bool)

(assert (=> b!926522 m!860591))

(declare-fun m!860593 () Bool)

(assert (=> b!926531 m!860593))

(declare-fun m!860595 () Bool)

(assert (=> b!926517 m!860595))

(declare-fun m!860597 () Bool)

(assert (=> b!926517 m!860597))

(declare-fun m!860599 () Bool)

(assert (=> b!926528 m!860599))

(declare-fun m!860601 () Bool)

(assert (=> b!926530 m!860601))

(declare-fun m!860603 () Bool)

(assert (=> b!926530 m!860603))

(declare-fun m!860605 () Bool)

(assert (=> b!926530 m!860605))

(declare-fun m!860607 () Bool)

(assert (=> b!926530 m!860607))

(assert (=> b!926530 m!860603))

(assert (=> b!926530 m!860605))

(declare-fun m!860609 () Bool)

(assert (=> b!926530 m!860609))

(assert (=> b!926530 m!860589))

(declare-fun m!860611 () Bool)

(assert (=> b!926530 m!860611))

(declare-fun m!860613 () Bool)

(assert (=> b!926530 m!860613))

(declare-fun m!860615 () Bool)

(assert (=> b!926530 m!860615))

(declare-fun m!860617 () Bool)

(assert (=> b!926530 m!860617))

(assert (=> b!926530 m!860613))

(declare-fun m!860619 () Bool)

(assert (=> b!926530 m!860619))

(declare-fun m!860621 () Bool)

(assert (=> b!926530 m!860621))

(declare-fun m!860623 () Bool)

(assert (=> b!926530 m!860623))

(declare-fun m!860625 () Bool)

(assert (=> b!926530 m!860625))

(declare-fun m!860627 () Bool)

(assert (=> b!926530 m!860627))

(declare-fun m!860629 () Bool)

(assert (=> b!926530 m!860629))

(declare-fun m!860631 () Bool)

(assert (=> b!926524 m!860631))

(declare-fun m!860633 () Bool)

(assert (=> b!926524 m!860633))

(declare-fun m!860635 () Bool)

(assert (=> b!926524 m!860635))

(declare-fun m!860637 () Bool)

(assert (=> mapNonEmpty!31422 m!860637))

(declare-fun m!860639 () Bool)

(assert (=> start!79038 m!860639))

(declare-fun m!860641 () Bool)

(assert (=> start!79038 m!860641))

(declare-fun m!860643 () Bool)

(assert (=> start!79038 m!860643))

(declare-fun m!860645 () Bool)

(assert (=> b!926519 m!860645))

(declare-fun m!860647 () Bool)

(assert (=> b!926527 m!860647))

(declare-fun m!860649 () Bool)

(assert (=> b!926518 m!860649))

(declare-fun m!860651 () Bool)

(assert (=> b!926520 m!860651))

(declare-fun m!860653 () Bool)

(assert (=> b!926532 m!860653))

(declare-fun m!860655 () Bool)

(assert (=> b!926532 m!860655))

(check-sat (not b!926530) (not b!926519) (not b_lambda!13753) (not b!926523) (not b!926522) (not b!926517) (not b!926524) (not b_next!17269) tp_is_empty!19777 (not mapNonEmpty!31422) (not b!926531) (not b!926532) (not b!926518) (not b!926527) (not b!926528) b_and!28251 (not b!926520) (not start!79038))
(check-sat b_and!28251 (not b_next!17269))

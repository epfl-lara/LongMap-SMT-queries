; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79116 () Bool)

(assert start!79116)

(declare-fun b_free!17161 () Bool)

(declare-fun b_next!17161 () Bool)

(assert (=> start!79116 (= b_free!17161 (not b_next!17161))))

(declare-fun tp!59925 () Bool)

(declare-fun b_and!28069 () Bool)

(assert (=> start!79116 (= tp!59925 b_and!28069)))

(declare-fun b!924468 () Bool)

(declare-fun e!518791 () Bool)

(declare-fun e!518787 () Bool)

(assert (=> b!924468 (= e!518791 e!518787)))

(declare-fun res!623052 () Bool)

(assert (=> b!924468 (=> (not res!623052) (not e!518787))))

(declare-datatypes ((V!31191 0))(
  ( (V!31192 (val!9885 Int)) )
))
(declare-datatypes ((tuple2!12866 0))(
  ( (tuple2!12867 (_1!6444 (_ BitVec 64)) (_2!6444 V!31191)) )
))
(declare-datatypes ((List!18681 0))(
  ( (Nil!18678) (Cons!18677 (h!19829 tuple2!12866) (t!26564 List!18681)) )
))
(declare-datatypes ((ListLongMap!11565 0))(
  ( (ListLongMap!11566 (toList!5798 List!18681)) )
))
(declare-fun lt!415336 () ListLongMap!11565)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4871 (ListLongMap!11565 (_ BitVec 64)) Bool)

(assert (=> b!924468 (= res!623052 (contains!4871 lt!415336 k0!1099))))

(declare-datatypes ((array!55361 0))(
  ( (array!55362 (arr!26621 (Array (_ BitVec 32) (_ BitVec 64))) (size!27081 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55361)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9353 0))(
  ( (ValueCellFull!9353 (v!12400 V!31191)) (EmptyCell!9353) )
))
(declare-datatypes ((array!55363 0))(
  ( (array!55364 (arr!26622 (Array (_ BitVec 32) ValueCell!9353)) (size!27082 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55363)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31191)

(declare-fun minValue!1173 () V!31191)

(declare-fun getCurrentListMap!3049 (array!55361 array!55363 (_ BitVec 32) (_ BitVec 32) V!31191 V!31191 (_ BitVec 32) Int) ListLongMap!11565)

(assert (=> b!924468 (= lt!415336 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31260 () Bool)

(declare-fun mapRes!31260 () Bool)

(assert (=> mapIsEmpty!31260 mapRes!31260))

(declare-fun b!924469 () Bool)

(declare-fun res!623055 () Bool)

(assert (=> b!924469 (=> (not res!623055) (not e!518791))))

(assert (=> b!924469 (= res!623055 (and (= (size!27082 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27081 _keys!1487) (size!27082 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924470 () Bool)

(declare-datatypes ((Unit!31166 0))(
  ( (Unit!31167) )
))
(declare-fun e!518786 () Unit!31166)

(declare-fun e!518794 () Unit!31166)

(assert (=> b!924470 (= e!518786 e!518794)))

(declare-fun lt!415338 () (_ BitVec 64))

(assert (=> b!924470 (= lt!415338 (select (arr!26621 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96565 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924470 (= c!96565 (validKeyInArray!0 lt!415338))))

(declare-fun b!924471 () Bool)

(declare-fun e!518785 () Bool)

(assert (=> b!924471 (= e!518785 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924472 () Bool)

(declare-fun e!518793 () Bool)

(declare-fun e!518792 () Bool)

(assert (=> b!924472 (= e!518793 (and e!518792 mapRes!31260))))

(declare-fun condMapEmpty!31260 () Bool)

(declare-fun mapDefault!31260 () ValueCell!9353)

(assert (=> b!924472 (= condMapEmpty!31260 (= (arr!26622 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9353)) mapDefault!31260)))))

(declare-fun mapNonEmpty!31260 () Bool)

(declare-fun tp!59924 () Bool)

(declare-fun e!518788 () Bool)

(assert (=> mapNonEmpty!31260 (= mapRes!31260 (and tp!59924 e!518788))))

(declare-fun mapKey!31260 () (_ BitVec 32))

(declare-fun mapRest!31260 () (Array (_ BitVec 32) ValueCell!9353))

(declare-fun mapValue!31260 () ValueCell!9353)

(assert (=> mapNonEmpty!31260 (= (arr!26622 _values!1231) (store mapRest!31260 mapKey!31260 mapValue!31260))))

(declare-fun b!924474 () Bool)

(declare-fun Unit!31168 () Unit!31166)

(assert (=> b!924474 (= e!518786 Unit!31168)))

(declare-fun b!924475 () Bool)

(declare-fun e!518790 () Bool)

(declare-fun e!518783 () Bool)

(assert (=> b!924475 (= e!518790 e!518783)))

(declare-fun res!623054 () Bool)

(assert (=> b!924475 (=> (not res!623054) (not e!518783))))

(declare-fun lt!415341 () ListLongMap!11565)

(assert (=> b!924475 (= res!623054 (contains!4871 lt!415341 k0!1099))))

(assert (=> b!924475 (= lt!415341 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924476 () Bool)

(assert (=> b!924476 (= e!518783 false)))

(declare-fun lt!415330 () V!31191)

(declare-fun apply!651 (ListLongMap!11565 (_ BitVec 64)) V!31191)

(assert (=> b!924476 (= lt!415330 (apply!651 lt!415341 k0!1099))))

(declare-fun b!924477 () Bool)

(declare-fun lt!415340 () ListLongMap!11565)

(declare-fun lt!415334 () V!31191)

(assert (=> b!924477 (= (apply!651 lt!415340 k0!1099) lt!415334)))

(declare-fun lt!415339 () V!31191)

(declare-fun lt!415332 () Unit!31166)

(declare-fun addApplyDifferent!357 (ListLongMap!11565 (_ BitVec 64) V!31191 (_ BitVec 64)) Unit!31166)

(assert (=> b!924477 (= lt!415332 (addApplyDifferent!357 lt!415336 lt!415338 lt!415339 k0!1099))))

(assert (=> b!924477 (not (= lt!415338 k0!1099))))

(declare-fun lt!415337 () Unit!31166)

(declare-datatypes ((List!18682 0))(
  ( (Nil!18679) (Cons!18678 (h!19830 (_ BitVec 64)) (t!26565 List!18682)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55361 (_ BitVec 64) (_ BitVec 32) List!18682) Unit!31166)

(assert (=> b!924477 (= lt!415337 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18679))))

(assert (=> b!924477 e!518785))

(declare-fun c!96566 () Bool)

(assert (=> b!924477 (= c!96566 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415331 () Unit!31166)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!212 (array!55361 array!55363 (_ BitVec 32) (_ BitVec 32) V!31191 V!31191 (_ BitVec 64) (_ BitVec 32) Int) Unit!31166)

(assert (=> b!924477 (= lt!415331 (lemmaListMapContainsThenArrayContainsFrom!212 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55361 (_ BitVec 32) List!18682) Bool)

(assert (=> b!924477 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18679)))

(declare-fun lt!415333 () Unit!31166)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55361 (_ BitVec 32) (_ BitVec 32)) Unit!31166)

(assert (=> b!924477 (= lt!415333 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924477 (contains!4871 lt!415340 k0!1099)))

(declare-fun lt!415335 () tuple2!12866)

(declare-fun +!2721 (ListLongMap!11565 tuple2!12866) ListLongMap!11565)

(assert (=> b!924477 (= lt!415340 (+!2721 lt!415336 lt!415335))))

(declare-fun lt!415342 () Unit!31166)

(declare-fun addStillContains!430 (ListLongMap!11565 (_ BitVec 64) V!31191 (_ BitVec 64)) Unit!31166)

(assert (=> b!924477 (= lt!415342 (addStillContains!430 lt!415336 lt!415338 lt!415339 k0!1099))))

(assert (=> b!924477 (= (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2721 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415335))))

(assert (=> b!924477 (= lt!415335 (tuple2!12867 lt!415338 lt!415339))))

(declare-fun get!14010 (ValueCell!9353 V!31191) V!31191)

(declare-fun dynLambda!1518 (Int (_ BitVec 64)) V!31191)

(assert (=> b!924477 (= lt!415339 (get!14010 (select (arr!26622 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1518 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415343 () Unit!31166)

(declare-fun lemmaListMapRecursiveValidKeyArray!101 (array!55361 array!55363 (_ BitVec 32) (_ BitVec 32) V!31191 V!31191 (_ BitVec 32) Int) Unit!31166)

(assert (=> b!924477 (= lt!415343 (lemmaListMapRecursiveValidKeyArray!101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924477 (= e!518794 lt!415332)))

(declare-fun b!924478 () Bool)

(declare-fun res!623048 () Bool)

(assert (=> b!924478 (=> (not res!623048) (not e!518791))))

(assert (=> b!924478 (= res!623048 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27081 _keys!1487))))))

(declare-fun b!924479 () Bool)

(declare-fun Unit!31169 () Unit!31166)

(assert (=> b!924479 (= e!518794 Unit!31169)))

(declare-fun b!924480 () Bool)

(declare-fun e!518789 () Bool)

(assert (=> b!924480 (= e!518789 e!518790)))

(declare-fun res!623047 () Bool)

(assert (=> b!924480 (=> (not res!623047) (not e!518790))))

(assert (=> b!924480 (= res!623047 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27081 _keys!1487)))))

(declare-fun lt!415329 () Unit!31166)

(assert (=> b!924480 (= lt!415329 e!518786)))

(declare-fun c!96567 () Bool)

(assert (=> b!924480 (= c!96567 (validKeyInArray!0 k0!1099))))

(declare-fun b!924481 () Bool)

(assert (=> b!924481 (= e!518787 e!518789)))

(declare-fun res!623049 () Bool)

(assert (=> b!924481 (=> (not res!623049) (not e!518789))))

(declare-fun v!791 () V!31191)

(assert (=> b!924481 (= res!623049 (and (= lt!415334 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924481 (= lt!415334 (apply!651 lt!415336 k0!1099))))

(declare-fun b!924482 () Bool)

(declare-fun res!623051 () Bool)

(assert (=> b!924482 (=> (not res!623051) (not e!518791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55361 (_ BitVec 32)) Bool)

(assert (=> b!924482 (= res!623051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924483 () Bool)

(declare-fun arrayContainsKey!0 (array!55361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924483 (= e!518785 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924484 () Bool)

(declare-fun res!623050 () Bool)

(assert (=> b!924484 (=> (not res!623050) (not e!518791))))

(assert (=> b!924484 (= res!623050 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18679))))

(declare-fun b!924485 () Bool)

(declare-fun tp_is_empty!19669 () Bool)

(assert (=> b!924485 (= e!518788 tp_is_empty!19669)))

(declare-fun res!623053 () Bool)

(assert (=> start!79116 (=> (not res!623053) (not e!518791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79116 (= res!623053 (validMask!0 mask!1881))))

(assert (=> start!79116 e!518791))

(assert (=> start!79116 true))

(assert (=> start!79116 tp_is_empty!19669))

(declare-fun array_inv!20836 (array!55363) Bool)

(assert (=> start!79116 (and (array_inv!20836 _values!1231) e!518793)))

(assert (=> start!79116 tp!59925))

(declare-fun array_inv!20837 (array!55361) Bool)

(assert (=> start!79116 (array_inv!20837 _keys!1487)))

(declare-fun b!924473 () Bool)

(assert (=> b!924473 (= e!518792 tp_is_empty!19669)))

(assert (= (and start!79116 res!623053) b!924469))

(assert (= (and b!924469 res!623055) b!924482))

(assert (= (and b!924482 res!623051) b!924484))

(assert (= (and b!924484 res!623050) b!924478))

(assert (= (and b!924478 res!623048) b!924468))

(assert (= (and b!924468 res!623052) b!924481))

(assert (= (and b!924481 res!623049) b!924480))

(assert (= (and b!924480 c!96567) b!924470))

(assert (= (and b!924480 (not c!96567)) b!924474))

(assert (= (and b!924470 c!96565) b!924477))

(assert (= (and b!924470 (not c!96565)) b!924479))

(assert (= (and b!924477 c!96566) b!924483))

(assert (= (and b!924477 (not c!96566)) b!924471))

(assert (= (and b!924480 res!623047) b!924475))

(assert (= (and b!924475 res!623054) b!924476))

(assert (= (and b!924472 condMapEmpty!31260) mapIsEmpty!31260))

(assert (= (and b!924472 (not condMapEmpty!31260)) mapNonEmpty!31260))

(get-info :version)

(assert (= (and mapNonEmpty!31260 ((_ is ValueCellFull!9353) mapValue!31260)) b!924485))

(assert (= (and b!924472 ((_ is ValueCellFull!9353) mapDefault!31260)) b!924473))

(assert (= start!79116 b!924472))

(declare-fun b_lambda!13677 () Bool)

(assert (=> (not b_lambda!13677) (not b!924477)))

(declare-fun t!26563 () Bool)

(declare-fun tb!5733 () Bool)

(assert (=> (and start!79116 (= defaultEntry!1235 defaultEntry!1235) t!26563) tb!5733))

(declare-fun result!11297 () Bool)

(assert (=> tb!5733 (= result!11297 tp_is_empty!19669)))

(assert (=> b!924477 t!26563))

(declare-fun b_and!28071 () Bool)

(assert (= b_and!28069 (and (=> t!26563 result!11297) b_and!28071)))

(declare-fun m!859075 () Bool)

(assert (=> b!924477 m!859075))

(declare-fun m!859077 () Bool)

(assert (=> b!924477 m!859077))

(declare-fun m!859079 () Bool)

(assert (=> b!924477 m!859079))

(declare-fun m!859081 () Bool)

(assert (=> b!924477 m!859081))

(declare-fun m!859083 () Bool)

(assert (=> b!924477 m!859083))

(declare-fun m!859085 () Bool)

(assert (=> b!924477 m!859085))

(declare-fun m!859087 () Bool)

(assert (=> b!924477 m!859087))

(declare-fun m!859089 () Bool)

(assert (=> b!924477 m!859089))

(declare-fun m!859091 () Bool)

(assert (=> b!924477 m!859091))

(assert (=> b!924477 m!859085))

(assert (=> b!924477 m!859087))

(declare-fun m!859093 () Bool)

(assert (=> b!924477 m!859093))

(declare-fun m!859095 () Bool)

(assert (=> b!924477 m!859095))

(declare-fun m!859097 () Bool)

(assert (=> b!924477 m!859097))

(declare-fun m!859099 () Bool)

(assert (=> b!924477 m!859099))

(declare-fun m!859101 () Bool)

(assert (=> b!924477 m!859101))

(declare-fun m!859103 () Bool)

(assert (=> b!924477 m!859103))

(assert (=> b!924477 m!859075))

(declare-fun m!859105 () Bool)

(assert (=> b!924477 m!859105))

(declare-fun m!859107 () Bool)

(assert (=> b!924480 m!859107))

(declare-fun m!859109 () Bool)

(assert (=> b!924470 m!859109))

(declare-fun m!859111 () Bool)

(assert (=> b!924470 m!859111))

(declare-fun m!859113 () Bool)

(assert (=> b!924475 m!859113))

(assert (=> b!924475 m!859095))

(declare-fun m!859115 () Bool)

(assert (=> b!924484 m!859115))

(declare-fun m!859117 () Bool)

(assert (=> b!924482 m!859117))

(declare-fun m!859119 () Bool)

(assert (=> b!924468 m!859119))

(declare-fun m!859121 () Bool)

(assert (=> b!924468 m!859121))

(declare-fun m!859123 () Bool)

(assert (=> start!79116 m!859123))

(declare-fun m!859125 () Bool)

(assert (=> start!79116 m!859125))

(declare-fun m!859127 () Bool)

(assert (=> start!79116 m!859127))

(declare-fun m!859129 () Bool)

(assert (=> mapNonEmpty!31260 m!859129))

(declare-fun m!859131 () Bool)

(assert (=> b!924476 m!859131))

(declare-fun m!859133 () Bool)

(assert (=> b!924483 m!859133))

(declare-fun m!859135 () Bool)

(assert (=> b!924481 m!859135))

(check-sat (not b!924484) tp_is_empty!19669 b_and!28071 (not b!924476) (not b!924480) (not b!924470) (not b!924477) (not b_lambda!13677) (not b!924481) (not b!924475) (not mapNonEmpty!31260) (not b!924482) (not b!924483) (not start!79116) (not b!924468) (not b_next!17161))
(check-sat b_and!28071 (not b_next!17161))

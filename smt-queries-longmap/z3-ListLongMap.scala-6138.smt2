; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78938 () Bool)

(assert start!78938)

(declare-fun b_free!17151 () Bool)

(declare-fun b_next!17151 () Bool)

(assert (=> start!78938 (= b_free!17151 (not b_next!17151))))

(declare-fun tp!59893 () Bool)

(declare-fun b_and!28039 () Bool)

(assert (=> start!78938 (= tp!59893 b_and!28039)))

(declare-fun b!923285 () Bool)

(declare-fun e!518024 () Bool)

(declare-fun e!518026 () Bool)

(assert (=> b!923285 (= e!518024 e!518026)))

(declare-fun res!622571 () Bool)

(assert (=> b!923285 (=> (not res!622571) (not e!518026))))

(declare-datatypes ((V!31177 0))(
  ( (V!31178 (val!9880 Int)) )
))
(declare-datatypes ((tuple2!12860 0))(
  ( (tuple2!12861 (_1!6441 (_ BitVec 64)) (_2!6441 V!31177)) )
))
(declare-datatypes ((List!18664 0))(
  ( (Nil!18661) (Cons!18660 (h!19806 tuple2!12860) (t!26545 List!18664)) )
))
(declare-datatypes ((ListLongMap!11557 0))(
  ( (ListLongMap!11558 (toList!5794 List!18664)) )
))
(declare-fun lt!414752 () ListLongMap!11557)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4856 (ListLongMap!11557 (_ BitVec 64)) Bool)

(assert (=> b!923285 (= res!622571 (contains!4856 lt!414752 k0!1099))))

(declare-datatypes ((array!55292 0))(
  ( (array!55293 (arr!26591 (Array (_ BitVec 32) (_ BitVec 64))) (size!27050 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55292)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9348 0))(
  ( (ValueCellFull!9348 (v!12398 V!31177)) (EmptyCell!9348) )
))
(declare-datatypes ((array!55294 0))(
  ( (array!55295 (arr!26592 (Array (_ BitVec 32) ValueCell!9348)) (size!27051 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55294)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31177)

(declare-fun minValue!1173 () V!31177)

(declare-fun getCurrentListMap!3047 (array!55292 array!55294 (_ BitVec 32) (_ BitVec 32) V!31177 V!31177 (_ BitVec 32) Int) ListLongMap!11557)

(assert (=> b!923285 (= lt!414752 (getCurrentListMap!3047 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!622576 () Bool)

(assert (=> start!78938 (=> (not res!622576) (not e!518024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78938 (= res!622576 (validMask!0 mask!1881))))

(assert (=> start!78938 e!518024))

(assert (=> start!78938 true))

(declare-fun tp_is_empty!19659 () Bool)

(assert (=> start!78938 tp_is_empty!19659))

(declare-fun e!518027 () Bool)

(declare-fun array_inv!20708 (array!55294) Bool)

(assert (=> start!78938 (and (array_inv!20708 _values!1231) e!518027)))

(assert (=> start!78938 tp!59893))

(declare-fun array_inv!20709 (array!55292) Bool)

(assert (=> start!78938 (array_inv!20709 _keys!1487)))

(declare-fun mapNonEmpty!31245 () Bool)

(declare-fun mapRes!31245 () Bool)

(declare-fun tp!59894 () Bool)

(declare-fun e!518032 () Bool)

(assert (=> mapNonEmpty!31245 (= mapRes!31245 (and tp!59894 e!518032))))

(declare-fun mapKey!31245 () (_ BitVec 32))

(declare-fun mapRest!31245 () (Array (_ BitVec 32) ValueCell!9348))

(declare-fun mapValue!31245 () ValueCell!9348)

(assert (=> mapNonEmpty!31245 (= (arr!26592 _values!1231) (store mapRest!31245 mapKey!31245 mapValue!31245))))

(declare-fun b!923286 () Bool)

(declare-fun e!518023 () Bool)

(assert (=> b!923286 (= e!518027 (and e!518023 mapRes!31245))))

(declare-fun condMapEmpty!31245 () Bool)

(declare-fun mapDefault!31245 () ValueCell!9348)

(assert (=> b!923286 (= condMapEmpty!31245 (= (arr!26592 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9348)) mapDefault!31245)))))

(declare-fun b!923287 () Bool)

(assert (=> b!923287 (= e!518032 tp_is_empty!19659)))

(declare-fun b!923288 () Bool)

(declare-fun res!622570 () Bool)

(assert (=> b!923288 (=> (not res!622570) (not e!518024))))

(declare-datatypes ((List!18665 0))(
  ( (Nil!18662) (Cons!18661 (h!19807 (_ BitVec 64)) (t!26546 List!18665)) )
))
(declare-fun arrayNoDuplicates!0 (array!55292 (_ BitVec 32) List!18665) Bool)

(assert (=> b!923288 (= res!622570 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18662))))

(declare-fun b!923289 () Bool)

(declare-fun e!518022 () Bool)

(declare-fun arrayContainsKey!0 (array!55292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923289 (= e!518022 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923290 () Bool)

(declare-datatypes ((Unit!31144 0))(
  ( (Unit!31145) )
))
(declare-fun e!518028 () Unit!31144)

(declare-fun Unit!31146 () Unit!31144)

(assert (=> b!923290 (= e!518028 Unit!31146)))

(declare-fun b!923291 () Bool)

(declare-fun e!518025 () Bool)

(assert (=> b!923291 (= e!518025 false)))

(declare-fun lt!414745 () V!31177)

(declare-fun lt!414754 () ListLongMap!11557)

(declare-fun apply!624 (ListLongMap!11557 (_ BitVec 64)) V!31177)

(assert (=> b!923291 (= lt!414745 (apply!624 lt!414754 k0!1099))))

(declare-fun b!923292 () Bool)

(declare-fun e!518021 () Unit!31144)

(assert (=> b!923292 (= e!518028 e!518021)))

(declare-fun lt!414755 () (_ BitVec 64))

(assert (=> b!923292 (= lt!414755 (select (arr!26591 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96240 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923292 (= c!96240 (validKeyInArray!0 lt!414755))))

(declare-fun b!923293 () Bool)

(declare-fun e!518031 () Bool)

(declare-fun e!518029 () Bool)

(assert (=> b!923293 (= e!518031 e!518029)))

(declare-fun res!622569 () Bool)

(assert (=> b!923293 (=> (not res!622569) (not e!518029))))

(assert (=> b!923293 (= res!622569 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27050 _keys!1487)))))

(declare-fun lt!414744 () Unit!31144)

(assert (=> b!923293 (= lt!414744 e!518028)))

(declare-fun c!96238 () Bool)

(assert (=> b!923293 (= c!96238 (validKeyInArray!0 k0!1099))))

(declare-fun b!923294 () Bool)

(assert (=> b!923294 (= e!518023 tp_is_empty!19659)))

(declare-fun b!923295 () Bool)

(assert (=> b!923295 (= e!518026 e!518031)))

(declare-fun res!622574 () Bool)

(assert (=> b!923295 (=> (not res!622574) (not e!518031))))

(declare-fun v!791 () V!31177)

(declare-fun lt!414757 () V!31177)

(assert (=> b!923295 (= res!622574 (and (= lt!414757 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923295 (= lt!414757 (apply!624 lt!414752 k0!1099))))

(declare-fun b!923296 () Bool)

(declare-fun Unit!31147 () Unit!31144)

(assert (=> b!923296 (= e!518021 Unit!31147)))

(declare-fun b!923297 () Bool)

(declare-fun lt!414748 () ListLongMap!11557)

(assert (=> b!923297 (= (apply!624 lt!414748 k0!1099) lt!414757)))

(declare-fun lt!414749 () Unit!31144)

(declare-fun lt!414743 () V!31177)

(declare-fun addApplyDifferent!352 (ListLongMap!11557 (_ BitVec 64) V!31177 (_ BitVec 64)) Unit!31144)

(assert (=> b!923297 (= lt!414749 (addApplyDifferent!352 lt!414752 lt!414755 lt!414743 k0!1099))))

(assert (=> b!923297 (not (= lt!414755 k0!1099))))

(declare-fun lt!414746 () Unit!31144)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55292 (_ BitVec 64) (_ BitVec 32) List!18665) Unit!31144)

(assert (=> b!923297 (= lt!414746 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18662))))

(assert (=> b!923297 e!518022))

(declare-fun c!96239 () Bool)

(assert (=> b!923297 (= c!96239 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414756 () Unit!31144)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!203 (array!55292 array!55294 (_ BitVec 32) (_ BitVec 32) V!31177 V!31177 (_ BitVec 64) (_ BitVec 32) Int) Unit!31144)

(assert (=> b!923297 (= lt!414756 (lemmaListMapContainsThenArrayContainsFrom!203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923297 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18662)))

(declare-fun lt!414751 () Unit!31144)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55292 (_ BitVec 32) (_ BitVec 32)) Unit!31144)

(assert (=> b!923297 (= lt!414751 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923297 (contains!4856 lt!414748 k0!1099)))

(declare-fun lt!414747 () tuple2!12860)

(declare-fun +!2696 (ListLongMap!11557 tuple2!12860) ListLongMap!11557)

(assert (=> b!923297 (= lt!414748 (+!2696 lt!414752 lt!414747))))

(declare-fun lt!414753 () Unit!31144)

(declare-fun addStillContains!420 (ListLongMap!11557 (_ BitVec 64) V!31177 (_ BitVec 64)) Unit!31144)

(assert (=> b!923297 (= lt!414753 (addStillContains!420 lt!414752 lt!414755 lt!414743 k0!1099))))

(assert (=> b!923297 (= (getCurrentListMap!3047 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2696 (getCurrentListMap!3047 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414747))))

(assert (=> b!923297 (= lt!414747 (tuple2!12861 lt!414755 lt!414743))))

(declare-fun get!13969 (ValueCell!9348 V!31177) V!31177)

(declare-fun dynLambda!1485 (Int (_ BitVec 64)) V!31177)

(assert (=> b!923297 (= lt!414743 (get!13969 (select (arr!26592 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1485 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414750 () Unit!31144)

(declare-fun lemmaListMapRecursiveValidKeyArray!86 (array!55292 array!55294 (_ BitVec 32) (_ BitVec 32) V!31177 V!31177 (_ BitVec 32) Int) Unit!31144)

(assert (=> b!923297 (= lt!414750 (lemmaListMapRecursiveValidKeyArray!86 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923297 (= e!518021 lt!414749)))

(declare-fun b!923298 () Bool)

(assert (=> b!923298 (= e!518029 e!518025)))

(declare-fun res!622568 () Bool)

(assert (=> b!923298 (=> (not res!622568) (not e!518025))))

(assert (=> b!923298 (= res!622568 (contains!4856 lt!414754 k0!1099))))

(assert (=> b!923298 (= lt!414754 (getCurrentListMap!3047 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923299 () Bool)

(assert (=> b!923299 (= e!518022 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31245 () Bool)

(assert (=> mapIsEmpty!31245 mapRes!31245))

(declare-fun b!923300 () Bool)

(declare-fun res!622575 () Bool)

(assert (=> b!923300 (=> (not res!622575) (not e!518024))))

(assert (=> b!923300 (= res!622575 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27050 _keys!1487))))))

(declare-fun b!923301 () Bool)

(declare-fun res!622572 () Bool)

(assert (=> b!923301 (=> (not res!622572) (not e!518024))))

(assert (=> b!923301 (= res!622572 (and (= (size!27051 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27050 _keys!1487) (size!27051 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923302 () Bool)

(declare-fun res!622573 () Bool)

(assert (=> b!923302 (=> (not res!622573) (not e!518024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55292 (_ BitVec 32)) Bool)

(assert (=> b!923302 (= res!622573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78938 res!622576) b!923301))

(assert (= (and b!923301 res!622572) b!923302))

(assert (= (and b!923302 res!622573) b!923288))

(assert (= (and b!923288 res!622570) b!923300))

(assert (= (and b!923300 res!622575) b!923285))

(assert (= (and b!923285 res!622571) b!923295))

(assert (= (and b!923295 res!622574) b!923293))

(assert (= (and b!923293 c!96238) b!923292))

(assert (= (and b!923293 (not c!96238)) b!923290))

(assert (= (and b!923292 c!96240) b!923297))

(assert (= (and b!923292 (not c!96240)) b!923296))

(assert (= (and b!923297 c!96239) b!923289))

(assert (= (and b!923297 (not c!96239)) b!923299))

(assert (= (and b!923293 res!622569) b!923298))

(assert (= (and b!923298 res!622568) b!923291))

(assert (= (and b!923286 condMapEmpty!31245) mapIsEmpty!31245))

(assert (= (and b!923286 (not condMapEmpty!31245)) mapNonEmpty!31245))

(get-info :version)

(assert (= (and mapNonEmpty!31245 ((_ is ValueCellFull!9348) mapValue!31245)) b!923287))

(assert (= (and b!923286 ((_ is ValueCellFull!9348) mapDefault!31245)) b!923294))

(assert (= start!78938 b!923286))

(declare-fun b_lambda!13653 () Bool)

(assert (=> (not b_lambda!13653) (not b!923297)))

(declare-fun t!26544 () Bool)

(declare-fun tb!5731 () Bool)

(assert (=> (and start!78938 (= defaultEntry!1235 defaultEntry!1235) t!26544) tb!5731))

(declare-fun result!11285 () Bool)

(assert (=> tb!5731 (= result!11285 tp_is_empty!19659)))

(assert (=> b!923297 t!26544))

(declare-fun b_and!28041 () Bool)

(assert (= b_and!28039 (and (=> t!26544 result!11285) b_and!28041)))

(declare-fun m!857471 () Bool)

(assert (=> mapNonEmpty!31245 m!857471))

(declare-fun m!857473 () Bool)

(assert (=> b!923298 m!857473))

(declare-fun m!857475 () Bool)

(assert (=> b!923298 m!857475))

(declare-fun m!857477 () Bool)

(assert (=> b!923295 m!857477))

(declare-fun m!857479 () Bool)

(assert (=> b!923289 m!857479))

(declare-fun m!857481 () Bool)

(assert (=> start!78938 m!857481))

(declare-fun m!857483 () Bool)

(assert (=> start!78938 m!857483))

(declare-fun m!857485 () Bool)

(assert (=> start!78938 m!857485))

(declare-fun m!857487 () Bool)

(assert (=> b!923297 m!857487))

(declare-fun m!857489 () Bool)

(assert (=> b!923297 m!857489))

(declare-fun m!857491 () Bool)

(assert (=> b!923297 m!857491))

(declare-fun m!857493 () Bool)

(assert (=> b!923297 m!857493))

(declare-fun m!857495 () Bool)

(assert (=> b!923297 m!857495))

(declare-fun m!857497 () Bool)

(assert (=> b!923297 m!857497))

(declare-fun m!857499 () Bool)

(assert (=> b!923297 m!857499))

(declare-fun m!857501 () Bool)

(assert (=> b!923297 m!857501))

(declare-fun m!857503 () Bool)

(assert (=> b!923297 m!857503))

(declare-fun m!857505 () Bool)

(assert (=> b!923297 m!857505))

(declare-fun m!857507 () Bool)

(assert (=> b!923297 m!857507))

(assert (=> b!923297 m!857489))

(assert (=> b!923297 m!857491))

(declare-fun m!857509 () Bool)

(assert (=> b!923297 m!857509))

(declare-fun m!857511 () Bool)

(assert (=> b!923297 m!857511))

(declare-fun m!857513 () Bool)

(assert (=> b!923297 m!857513))

(assert (=> b!923297 m!857475))

(assert (=> b!923297 m!857505))

(declare-fun m!857515 () Bool)

(assert (=> b!923297 m!857515))

(declare-fun m!857517 () Bool)

(assert (=> b!923285 m!857517))

(declare-fun m!857519 () Bool)

(assert (=> b!923285 m!857519))

(declare-fun m!857521 () Bool)

(assert (=> b!923302 m!857521))

(declare-fun m!857523 () Bool)

(assert (=> b!923291 m!857523))

(declare-fun m!857525 () Bool)

(assert (=> b!923292 m!857525))

(declare-fun m!857527 () Bool)

(assert (=> b!923292 m!857527))

(declare-fun m!857529 () Bool)

(assert (=> b!923288 m!857529))

(declare-fun m!857531 () Bool)

(assert (=> b!923293 m!857531))

(check-sat (not start!78938) (not b_next!17151) (not b!923295) (not b!923292) (not b!923298) (not b_lambda!13653) (not mapNonEmpty!31245) (not b!923297) tp_is_empty!19659 (not b!923288) (not b!923302) (not b!923289) (not b!923293) b_and!28041 (not b!923291) (not b!923285))
(check-sat b_and!28041 (not b_next!17151))

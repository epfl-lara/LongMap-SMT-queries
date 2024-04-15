; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78936 () Bool)

(assert start!78936)

(declare-fun b_free!17167 () Bool)

(declare-fun b_next!17167 () Bool)

(assert (=> start!78936 (= b_free!17167 (not b_next!17167))))

(declare-fun tp!59943 () Bool)

(declare-fun b_and!28045 () Bool)

(assert (=> start!78936 (= tp!59943 b_and!28045)))

(declare-fun b!923494 () Bool)

(declare-fun res!622678 () Bool)

(declare-fun e!518163 () Bool)

(assert (=> b!923494 (=> (not res!622678) (not e!518163))))

(declare-datatypes ((array!55295 0))(
  ( (array!55296 (arr!26593 (Array (_ BitVec 32) (_ BitVec 64))) (size!27054 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55295)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31199 0))(
  ( (V!31200 (val!9888 Int)) )
))
(declare-datatypes ((ValueCell!9356 0))(
  ( (ValueCellFull!9356 (v!12405 V!31199)) (EmptyCell!9356) )
))
(declare-datatypes ((array!55297 0))(
  ( (array!55298 (arr!26594 (Array (_ BitVec 32) ValueCell!9356)) (size!27055 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55297)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!923494 (= res!622678 (and (= (size!27055 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27054 _keys!1487) (size!27055 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!622674 () Bool)

(assert (=> start!78936 (=> (not res!622674) (not e!518163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78936 (= res!622674 (validMask!0 mask!1881))))

(assert (=> start!78936 e!518163))

(assert (=> start!78936 true))

(declare-fun tp_is_empty!19675 () Bool)

(assert (=> start!78936 tp_is_empty!19675))

(declare-fun e!518166 () Bool)

(declare-fun array_inv!20798 (array!55297) Bool)

(assert (=> start!78936 (and (array_inv!20798 _values!1231) e!518166)))

(assert (=> start!78936 tp!59943))

(declare-fun array_inv!20799 (array!55295) Bool)

(assert (=> start!78936 (array_inv!20799 _keys!1487)))

(declare-fun b!923495 () Bool)

(declare-fun e!518172 () Bool)

(declare-fun e!518165 () Bool)

(assert (=> b!923495 (= e!518172 e!518165)))

(declare-fun res!622677 () Bool)

(assert (=> b!923495 (=> (not res!622677) (not e!518165))))

(declare-datatypes ((tuple2!12938 0))(
  ( (tuple2!12939 (_1!6480 (_ BitVec 64)) (_2!6480 V!31199)) )
))
(declare-datatypes ((List!18719 0))(
  ( (Nil!18716) (Cons!18715 (h!19861 tuple2!12938) (t!26607 List!18719)) )
))
(declare-datatypes ((ListLongMap!11625 0))(
  ( (ListLongMap!11626 (toList!5828 List!18719)) )
))
(declare-fun lt!414880 () ListLongMap!11625)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4841 (ListLongMap!11625 (_ BitVec 64)) Bool)

(assert (=> b!923495 (= res!622677 (contains!4841 lt!414880 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31199)

(declare-fun minValue!1173 () V!31199)

(declare-fun getCurrentListMap!3015 (array!55295 array!55297 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 32) Int) ListLongMap!11625)

(assert (=> b!923495 (= lt!414880 (getCurrentListMap!3015 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923496 () Bool)

(declare-datatypes ((Unit!31083 0))(
  ( (Unit!31084) )
))
(declare-fun e!518162 () Unit!31083)

(declare-fun e!518169 () Unit!31083)

(assert (=> b!923496 (= e!518162 e!518169)))

(declare-fun lt!414877 () (_ BitVec 64))

(assert (=> b!923496 (= lt!414877 (select (arr!26593 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96246 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923496 (= c!96246 (validKeyInArray!0 lt!414877))))

(declare-fun b!923497 () Bool)

(declare-fun e!518171 () Bool)

(assert (=> b!923497 (= e!518171 tp_is_empty!19675)))

(declare-fun b!923498 () Bool)

(declare-fun e!518170 () Bool)

(declare-fun mapRes!31269 () Bool)

(assert (=> b!923498 (= e!518166 (and e!518170 mapRes!31269))))

(declare-fun condMapEmpty!31269 () Bool)

(declare-fun mapDefault!31269 () ValueCell!9356)

(assert (=> b!923498 (= condMapEmpty!31269 (= (arr!26594 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9356)) mapDefault!31269)))))

(declare-fun b!923499 () Bool)

(declare-fun lt!414870 () ListLongMap!11625)

(declare-fun lt!414868 () V!31199)

(declare-fun apply!641 (ListLongMap!11625 (_ BitVec 64)) V!31199)

(assert (=> b!923499 (= (apply!641 lt!414870 k0!1099) lt!414868)))

(declare-fun lt!414881 () Unit!31083)

(declare-fun lt!414876 () V!31199)

(declare-fun lt!414872 () ListLongMap!11625)

(declare-fun addApplyDifferent!358 (ListLongMap!11625 (_ BitVec 64) V!31199 (_ BitVec 64)) Unit!31083)

(assert (=> b!923499 (= lt!414881 (addApplyDifferent!358 lt!414872 lt!414877 lt!414876 k0!1099))))

(assert (=> b!923499 (not (= lt!414877 k0!1099))))

(declare-fun lt!414869 () Unit!31083)

(declare-datatypes ((List!18720 0))(
  ( (Nil!18717) (Cons!18716 (h!19862 (_ BitVec 64)) (t!26608 List!18720)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55295 (_ BitVec 64) (_ BitVec 32) List!18720) Unit!31083)

(assert (=> b!923499 (= lt!414869 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18717))))

(declare-fun e!518167 () Bool)

(assert (=> b!923499 e!518167))

(declare-fun c!96247 () Bool)

(assert (=> b!923499 (= c!96247 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414873 () Unit!31083)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!218 (array!55295 array!55297 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 64) (_ BitVec 32) Int) Unit!31083)

(assert (=> b!923499 (= lt!414873 (lemmaListMapContainsThenArrayContainsFrom!218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55295 (_ BitVec 32) List!18720) Bool)

(assert (=> b!923499 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18717)))

(declare-fun lt!414867 () Unit!31083)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55295 (_ BitVec 32) (_ BitVec 32)) Unit!31083)

(assert (=> b!923499 (= lt!414867 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923499 (contains!4841 lt!414870 k0!1099)))

(declare-fun lt!414879 () tuple2!12938)

(declare-fun +!2730 (ListLongMap!11625 tuple2!12938) ListLongMap!11625)

(assert (=> b!923499 (= lt!414870 (+!2730 lt!414872 lt!414879))))

(declare-fun lt!414878 () Unit!31083)

(declare-fun addStillContains!427 (ListLongMap!11625 (_ BitVec 64) V!31199 (_ BitVec 64)) Unit!31083)

(assert (=> b!923499 (= lt!414878 (addStillContains!427 lt!414872 lt!414877 lt!414876 k0!1099))))

(assert (=> b!923499 (= (getCurrentListMap!3015 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2730 (getCurrentListMap!3015 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414879))))

(assert (=> b!923499 (= lt!414879 (tuple2!12939 lt!414877 lt!414876))))

(declare-fun get!13981 (ValueCell!9356 V!31199) V!31199)

(declare-fun dynLambda!1486 (Int (_ BitVec 64)) V!31199)

(assert (=> b!923499 (= lt!414876 (get!13981 (select (arr!26594 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1486 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414875 () Unit!31083)

(declare-fun lemmaListMapRecursiveValidKeyArray!94 (array!55295 array!55297 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 32) Int) Unit!31083)

(assert (=> b!923499 (= lt!414875 (lemmaListMapRecursiveValidKeyArray!94 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923499 (= e!518169 lt!414881)))

(declare-fun b!923500 () Bool)

(assert (=> b!923500 (= e!518167 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923501 () Bool)

(declare-fun arrayContainsKey!0 (array!55295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923501 (= e!518167 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!31269 () Bool)

(declare-fun tp!59942 () Bool)

(assert (=> mapNonEmpty!31269 (= mapRes!31269 (and tp!59942 e!518171))))

(declare-fun mapRest!31269 () (Array (_ BitVec 32) ValueCell!9356))

(declare-fun mapValue!31269 () ValueCell!9356)

(declare-fun mapKey!31269 () (_ BitVec 32))

(assert (=> mapNonEmpty!31269 (= (arr!26594 _values!1231) (store mapRest!31269 mapKey!31269 mapValue!31269))))

(declare-fun mapIsEmpty!31269 () Bool)

(assert (=> mapIsEmpty!31269 mapRes!31269))

(declare-fun b!923502 () Bool)

(declare-fun e!518164 () Bool)

(assert (=> b!923502 (= e!518164 e!518172)))

(declare-fun res!622679 () Bool)

(assert (=> b!923502 (=> (not res!622679) (not e!518172))))

(assert (=> b!923502 (= res!622679 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27054 _keys!1487)))))

(declare-fun lt!414871 () Unit!31083)

(assert (=> b!923502 (= lt!414871 e!518162)))

(declare-fun c!96245 () Bool)

(assert (=> b!923502 (= c!96245 (validKeyInArray!0 k0!1099))))

(declare-fun b!923503 () Bool)

(declare-fun res!622675 () Bool)

(assert (=> b!923503 (=> (not res!622675) (not e!518163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55295 (_ BitVec 32)) Bool)

(assert (=> b!923503 (= res!622675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923504 () Bool)

(declare-fun e!518168 () Bool)

(assert (=> b!923504 (= e!518168 e!518164)))

(declare-fun res!622676 () Bool)

(assert (=> b!923504 (=> (not res!622676) (not e!518164))))

(declare-fun v!791 () V!31199)

(assert (=> b!923504 (= res!622676 (and (= lt!414868 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923504 (= lt!414868 (apply!641 lt!414872 k0!1099))))

(declare-fun b!923505 () Bool)

(assert (=> b!923505 (= e!518163 e!518168)))

(declare-fun res!622681 () Bool)

(assert (=> b!923505 (=> (not res!622681) (not e!518168))))

(assert (=> b!923505 (= res!622681 (contains!4841 lt!414872 k0!1099))))

(assert (=> b!923505 (= lt!414872 (getCurrentListMap!3015 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923506 () Bool)

(declare-fun res!622680 () Bool)

(assert (=> b!923506 (=> (not res!622680) (not e!518163))))

(assert (=> b!923506 (= res!622680 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27054 _keys!1487))))))

(declare-fun b!923507 () Bool)

(declare-fun Unit!31085 () Unit!31083)

(assert (=> b!923507 (= e!518162 Unit!31085)))

(declare-fun b!923508 () Bool)

(assert (=> b!923508 (= e!518170 tp_is_empty!19675)))

(declare-fun b!923509 () Bool)

(declare-fun res!622682 () Bool)

(assert (=> b!923509 (=> (not res!622682) (not e!518163))))

(assert (=> b!923509 (= res!622682 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18717))))

(declare-fun b!923510 () Bool)

(declare-fun Unit!31086 () Unit!31083)

(assert (=> b!923510 (= e!518169 Unit!31086)))

(declare-fun b!923511 () Bool)

(assert (=> b!923511 (= e!518165 false)))

(declare-fun lt!414874 () V!31199)

(assert (=> b!923511 (= lt!414874 (apply!641 lt!414880 k0!1099))))

(assert (= (and start!78936 res!622674) b!923494))

(assert (= (and b!923494 res!622678) b!923503))

(assert (= (and b!923503 res!622675) b!923509))

(assert (= (and b!923509 res!622682) b!923506))

(assert (= (and b!923506 res!622680) b!923505))

(assert (= (and b!923505 res!622681) b!923504))

(assert (= (and b!923504 res!622676) b!923502))

(assert (= (and b!923502 c!96245) b!923496))

(assert (= (and b!923502 (not c!96245)) b!923507))

(assert (= (and b!923496 c!96246) b!923499))

(assert (= (and b!923496 (not c!96246)) b!923510))

(assert (= (and b!923499 c!96247) b!923501))

(assert (= (and b!923499 (not c!96247)) b!923500))

(assert (= (and b!923502 res!622679) b!923495))

(assert (= (and b!923495 res!622677) b!923511))

(assert (= (and b!923498 condMapEmpty!31269) mapIsEmpty!31269))

(assert (= (and b!923498 (not condMapEmpty!31269)) mapNonEmpty!31269))

(get-info :version)

(assert (= (and mapNonEmpty!31269 ((_ is ValueCellFull!9356) mapValue!31269)) b!923497))

(assert (= (and b!923498 ((_ is ValueCellFull!9356) mapDefault!31269)) b!923508))

(assert (= start!78936 b!923498))

(declare-fun b_lambda!13651 () Bool)

(assert (=> (not b_lambda!13651) (not b!923499)))

(declare-fun t!26606 () Bool)

(declare-fun tb!5739 () Bool)

(assert (=> (and start!78936 (= defaultEntry!1235 defaultEntry!1235) t!26606) tb!5739))

(declare-fun result!11309 () Bool)

(assert (=> tb!5739 (= result!11309 tp_is_empty!19675)))

(assert (=> b!923499 t!26606))

(declare-fun b_and!28047 () Bool)

(assert (= b_and!28045 (and (=> t!26606 result!11309) b_and!28047)))

(declare-fun m!857209 () Bool)

(assert (=> mapNonEmpty!31269 m!857209))

(declare-fun m!857211 () Bool)

(assert (=> b!923496 m!857211))

(declare-fun m!857213 () Bool)

(assert (=> b!923496 m!857213))

(declare-fun m!857215 () Bool)

(assert (=> b!923504 m!857215))

(declare-fun m!857217 () Bool)

(assert (=> b!923503 m!857217))

(declare-fun m!857219 () Bool)

(assert (=> b!923509 m!857219))

(declare-fun m!857221 () Bool)

(assert (=> b!923499 m!857221))

(declare-fun m!857223 () Bool)

(assert (=> b!923499 m!857223))

(declare-fun m!857225 () Bool)

(assert (=> b!923499 m!857225))

(declare-fun m!857227 () Bool)

(assert (=> b!923499 m!857227))

(declare-fun m!857229 () Bool)

(assert (=> b!923499 m!857229))

(declare-fun m!857231 () Bool)

(assert (=> b!923499 m!857231))

(declare-fun m!857233 () Bool)

(assert (=> b!923499 m!857233))

(assert (=> b!923499 m!857227))

(assert (=> b!923499 m!857229))

(declare-fun m!857235 () Bool)

(assert (=> b!923499 m!857235))

(declare-fun m!857237 () Bool)

(assert (=> b!923499 m!857237))

(declare-fun m!857239 () Bool)

(assert (=> b!923499 m!857239))

(declare-fun m!857241 () Bool)

(assert (=> b!923499 m!857241))

(declare-fun m!857243 () Bool)

(assert (=> b!923499 m!857243))

(declare-fun m!857245 () Bool)

(assert (=> b!923499 m!857245))

(declare-fun m!857247 () Bool)

(assert (=> b!923499 m!857247))

(declare-fun m!857249 () Bool)

(assert (=> b!923499 m!857249))

(assert (=> b!923499 m!857247))

(declare-fun m!857251 () Bool)

(assert (=> b!923499 m!857251))

(declare-fun m!857253 () Bool)

(assert (=> start!78936 m!857253))

(declare-fun m!857255 () Bool)

(assert (=> start!78936 m!857255))

(declare-fun m!857257 () Bool)

(assert (=> start!78936 m!857257))

(declare-fun m!857259 () Bool)

(assert (=> b!923495 m!857259))

(assert (=> b!923495 m!857237))

(declare-fun m!857261 () Bool)

(assert (=> b!923502 m!857261))

(declare-fun m!857263 () Bool)

(assert (=> b!923505 m!857263))

(declare-fun m!857265 () Bool)

(assert (=> b!923505 m!857265))

(declare-fun m!857267 () Bool)

(assert (=> b!923501 m!857267))

(declare-fun m!857269 () Bool)

(assert (=> b!923511 m!857269))

(check-sat (not b!923502) (not mapNonEmpty!31269) b_and!28047 (not b!923505) tp_is_empty!19675 (not b!923501) (not b_lambda!13651) (not b!923511) (not b!923496) (not start!78936) (not b!923503) (not b_next!17167) (not b!923509) (not b!923495) (not b!923504) (not b!923499))
(check-sat b_and!28047 (not b_next!17167))

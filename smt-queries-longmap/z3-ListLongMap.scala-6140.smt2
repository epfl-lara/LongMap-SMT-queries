; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78950 () Bool)

(assert start!78950)

(declare-fun b_free!17163 () Bool)

(declare-fun b_next!17163 () Bool)

(assert (=> start!78950 (= b_free!17163 (not b_next!17163))))

(declare-fun tp!59929 () Bool)

(declare-fun b_and!28063 () Bool)

(assert (=> start!78950 (= tp!59929 b_and!28063)))

(declare-fun b!923621 () Bool)

(declare-fun res!622730 () Bool)

(declare-fun e!518242 () Bool)

(assert (=> b!923621 (=> (not res!622730) (not e!518242))))

(declare-datatypes ((array!55316 0))(
  ( (array!55317 (arr!26603 (Array (_ BitVec 32) (_ BitVec 64))) (size!27062 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55316)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31193 0))(
  ( (V!31194 (val!9886 Int)) )
))
(declare-datatypes ((ValueCell!9354 0))(
  ( (ValueCellFull!9354 (v!12404 V!31193)) (EmptyCell!9354) )
))
(declare-datatypes ((array!55318 0))(
  ( (array!55319 (arr!26604 (Array (_ BitVec 32) ValueCell!9354)) (size!27063 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55318)

(assert (=> b!923621 (= res!622730 (and (= (size!27063 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27062 _keys!1487) (size!27063 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923622 () Bool)

(declare-datatypes ((Unit!31165 0))(
  ( (Unit!31166) )
))
(declare-fun e!518246 () Unit!31165)

(declare-fun e!518238 () Unit!31165)

(assert (=> b!923622 (= e!518246 e!518238)))

(declare-fun lt!415024 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923622 (= lt!415024 (select (arr!26603 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96294 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923622 (= c!96294 (validKeyInArray!0 lt!415024))))

(declare-fun b!923623 () Bool)

(declare-fun e!518241 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!55316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923623 (= e!518241 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923624 () Bool)

(declare-fun Unit!31167 () Unit!31165)

(assert (=> b!923624 (= e!518246 Unit!31167)))

(declare-fun b!923625 () Bool)

(declare-fun e!518237 () Bool)

(declare-fun e!518247 () Bool)

(assert (=> b!923625 (= e!518237 e!518247)))

(declare-fun res!622733 () Bool)

(assert (=> b!923625 (=> (not res!622733) (not e!518247))))

(assert (=> b!923625 (= res!622733 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27062 _keys!1487)))))

(declare-fun lt!415014 () Unit!31165)

(assert (=> b!923625 (= lt!415014 e!518246)))

(declare-fun c!96292 () Bool)

(assert (=> b!923625 (= c!96292 (validKeyInArray!0 k0!1099))))

(declare-fun b!923626 () Bool)

(declare-fun e!518244 () Bool)

(assert (=> b!923626 (= e!518244 false)))

(declare-fun lt!415026 () V!31193)

(declare-datatypes ((tuple2!12872 0))(
  ( (tuple2!12873 (_1!6447 (_ BitVec 64)) (_2!6447 V!31193)) )
))
(declare-datatypes ((List!18676 0))(
  ( (Nil!18673) (Cons!18672 (h!19818 tuple2!12872) (t!26569 List!18676)) )
))
(declare-datatypes ((ListLongMap!11569 0))(
  ( (ListLongMap!11570 (toList!5800 List!18676)) )
))
(declare-fun lt!415019 () ListLongMap!11569)

(declare-fun apply!630 (ListLongMap!11569 (_ BitVec 64)) V!31193)

(assert (=> b!923626 (= lt!415026 (apply!630 lt!415019 k0!1099))))

(declare-fun b!923627 () Bool)

(declare-fun e!518248 () Bool)

(declare-fun tp_is_empty!19671 () Bool)

(assert (=> b!923627 (= e!518248 tp_is_empty!19671)))

(declare-fun mapNonEmpty!31263 () Bool)

(declare-fun mapRes!31263 () Bool)

(declare-fun tp!59930 () Bool)

(assert (=> mapNonEmpty!31263 (= mapRes!31263 (and tp!59930 e!518248))))

(declare-fun mapRest!31263 () (Array (_ BitVec 32) ValueCell!9354))

(declare-fun mapValue!31263 () ValueCell!9354)

(declare-fun mapKey!31263 () (_ BitVec 32))

(assert (=> mapNonEmpty!31263 (= (arr!26604 _values!1231) (store mapRest!31263 mapKey!31263 mapValue!31263))))

(declare-fun b!923629 () Bool)

(assert (=> b!923629 (= e!518247 e!518244)))

(declare-fun res!622735 () Bool)

(assert (=> b!923629 (=> (not res!622735) (not e!518244))))

(declare-fun contains!4862 (ListLongMap!11569 (_ BitVec 64)) Bool)

(assert (=> b!923629 (= res!622735 (contains!4862 lt!415019 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31193)

(declare-fun minValue!1173 () V!31193)

(declare-fun getCurrentListMap!3053 (array!55316 array!55318 (_ BitVec 32) (_ BitVec 32) V!31193 V!31193 (_ BitVec 32) Int) ListLongMap!11569)

(assert (=> b!923629 (= lt!415019 (getCurrentListMap!3053 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923630 () Bool)

(declare-fun res!622737 () Bool)

(assert (=> b!923630 (=> (not res!622737) (not e!518242))))

(assert (=> b!923630 (= res!622737 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27062 _keys!1487))))))

(declare-fun b!923631 () Bool)

(declare-fun e!518243 () Bool)

(declare-fun e!518239 () Bool)

(assert (=> b!923631 (= e!518243 (and e!518239 mapRes!31263))))

(declare-fun condMapEmpty!31263 () Bool)

(declare-fun mapDefault!31263 () ValueCell!9354)

(assert (=> b!923631 (= condMapEmpty!31263 (= (arr!26604 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9354)) mapDefault!31263)))))

(declare-fun mapIsEmpty!31263 () Bool)

(assert (=> mapIsEmpty!31263 mapRes!31263))

(declare-fun b!923632 () Bool)

(declare-fun e!518240 () Bool)

(assert (=> b!923632 (= e!518240 e!518237)))

(declare-fun res!622736 () Bool)

(assert (=> b!923632 (=> (not res!622736) (not e!518237))))

(declare-fun v!791 () V!31193)

(declare-fun lt!415013 () V!31193)

(assert (=> b!923632 (= res!622736 (and (= lt!415013 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415015 () ListLongMap!11569)

(assert (=> b!923632 (= lt!415013 (apply!630 lt!415015 k0!1099))))

(declare-fun b!923633 () Bool)

(declare-fun res!622732 () Bool)

(assert (=> b!923633 (=> (not res!622732) (not e!518242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55316 (_ BitVec 32)) Bool)

(assert (=> b!923633 (= res!622732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923634 () Bool)

(declare-fun res!622738 () Bool)

(assert (=> b!923634 (=> (not res!622738) (not e!518242))))

(declare-datatypes ((List!18677 0))(
  ( (Nil!18674) (Cons!18673 (h!19819 (_ BitVec 64)) (t!26570 List!18677)) )
))
(declare-fun arrayNoDuplicates!0 (array!55316 (_ BitVec 32) List!18677) Bool)

(assert (=> b!923634 (= res!622738 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18674))))

(declare-fun b!923635 () Bool)

(assert (=> b!923635 (= e!518241 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923636 () Bool)

(declare-fun Unit!31168 () Unit!31165)

(assert (=> b!923636 (= e!518238 Unit!31168)))

(declare-fun res!622734 () Bool)

(assert (=> start!78950 (=> (not res!622734) (not e!518242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78950 (= res!622734 (validMask!0 mask!1881))))

(assert (=> start!78950 e!518242))

(assert (=> start!78950 true))

(assert (=> start!78950 tp_is_empty!19671))

(declare-fun array_inv!20718 (array!55318) Bool)

(assert (=> start!78950 (and (array_inv!20718 _values!1231) e!518243)))

(assert (=> start!78950 tp!59929))

(declare-fun array_inv!20719 (array!55316) Bool)

(assert (=> start!78950 (array_inv!20719 _keys!1487)))

(declare-fun b!923628 () Bool)

(declare-fun lt!415022 () ListLongMap!11569)

(assert (=> b!923628 (= (apply!630 lt!415022 k0!1099) lt!415013)))

(declare-fun lt!415021 () V!31193)

(declare-fun lt!415023 () Unit!31165)

(declare-fun addApplyDifferent!357 (ListLongMap!11569 (_ BitVec 64) V!31193 (_ BitVec 64)) Unit!31165)

(assert (=> b!923628 (= lt!415023 (addApplyDifferent!357 lt!415015 lt!415024 lt!415021 k0!1099))))

(assert (=> b!923628 (not (= lt!415024 k0!1099))))

(declare-fun lt!415027 () Unit!31165)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55316 (_ BitVec 64) (_ BitVec 32) List!18677) Unit!31165)

(assert (=> b!923628 (= lt!415027 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18674))))

(assert (=> b!923628 e!518241))

(declare-fun c!96293 () Bool)

(assert (=> b!923628 (= c!96293 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415017 () Unit!31165)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!208 (array!55316 array!55318 (_ BitVec 32) (_ BitVec 32) V!31193 V!31193 (_ BitVec 64) (_ BitVec 32) Int) Unit!31165)

(assert (=> b!923628 (= lt!415017 (lemmaListMapContainsThenArrayContainsFrom!208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923628 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18674)))

(declare-fun lt!415016 () Unit!31165)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55316 (_ BitVec 32) (_ BitVec 32)) Unit!31165)

(assert (=> b!923628 (= lt!415016 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923628 (contains!4862 lt!415022 k0!1099)))

(declare-fun lt!415025 () tuple2!12872)

(declare-fun +!2701 (ListLongMap!11569 tuple2!12872) ListLongMap!11569)

(assert (=> b!923628 (= lt!415022 (+!2701 lt!415015 lt!415025))))

(declare-fun lt!415018 () Unit!31165)

(declare-fun addStillContains!425 (ListLongMap!11569 (_ BitVec 64) V!31193 (_ BitVec 64)) Unit!31165)

(assert (=> b!923628 (= lt!415018 (addStillContains!425 lt!415015 lt!415024 lt!415021 k0!1099))))

(assert (=> b!923628 (= (getCurrentListMap!3053 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2701 (getCurrentListMap!3053 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415025))))

(assert (=> b!923628 (= lt!415025 (tuple2!12873 lt!415024 lt!415021))))

(declare-fun get!13978 (ValueCell!9354 V!31193) V!31193)

(declare-fun dynLambda!1490 (Int (_ BitVec 64)) V!31193)

(assert (=> b!923628 (= lt!415021 (get!13978 (select (arr!26604 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1490 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415020 () Unit!31165)

(declare-fun lemmaListMapRecursiveValidKeyArray!91 (array!55316 array!55318 (_ BitVec 32) (_ BitVec 32) V!31193 V!31193 (_ BitVec 32) Int) Unit!31165)

(assert (=> b!923628 (= lt!415020 (lemmaListMapRecursiveValidKeyArray!91 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923628 (= e!518238 lt!415023)))

(declare-fun b!923637 () Bool)

(assert (=> b!923637 (= e!518239 tp_is_empty!19671)))

(declare-fun b!923638 () Bool)

(assert (=> b!923638 (= e!518242 e!518240)))

(declare-fun res!622731 () Bool)

(assert (=> b!923638 (=> (not res!622731) (not e!518240))))

(assert (=> b!923638 (= res!622731 (contains!4862 lt!415015 k0!1099))))

(assert (=> b!923638 (= lt!415015 (getCurrentListMap!3053 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78950 res!622734) b!923621))

(assert (= (and b!923621 res!622730) b!923633))

(assert (= (and b!923633 res!622732) b!923634))

(assert (= (and b!923634 res!622738) b!923630))

(assert (= (and b!923630 res!622737) b!923638))

(assert (= (and b!923638 res!622731) b!923632))

(assert (= (and b!923632 res!622736) b!923625))

(assert (= (and b!923625 c!96292) b!923622))

(assert (= (and b!923625 (not c!96292)) b!923624))

(assert (= (and b!923622 c!96294) b!923628))

(assert (= (and b!923622 (not c!96294)) b!923636))

(assert (= (and b!923628 c!96293) b!923623))

(assert (= (and b!923628 (not c!96293)) b!923635))

(assert (= (and b!923625 res!622733) b!923629))

(assert (= (and b!923629 res!622735) b!923626))

(assert (= (and b!923631 condMapEmpty!31263) mapIsEmpty!31263))

(assert (= (and b!923631 (not condMapEmpty!31263)) mapNonEmpty!31263))

(get-info :version)

(assert (= (and mapNonEmpty!31263 ((_ is ValueCellFull!9354) mapValue!31263)) b!923627))

(assert (= (and b!923631 ((_ is ValueCellFull!9354) mapDefault!31263)) b!923637))

(assert (= start!78950 b!923631))

(declare-fun b_lambda!13665 () Bool)

(assert (=> (not b_lambda!13665) (not b!923628)))

(declare-fun t!26568 () Bool)

(declare-fun tb!5743 () Bool)

(assert (=> (and start!78950 (= defaultEntry!1235 defaultEntry!1235) t!26568) tb!5743))

(declare-fun result!11309 () Bool)

(assert (=> tb!5743 (= result!11309 tp_is_empty!19671)))

(assert (=> b!923628 t!26568))

(declare-fun b_and!28065 () Bool)

(assert (= b_and!28063 (and (=> t!26568 result!11309) b_and!28065)))

(declare-fun m!857843 () Bool)

(assert (=> b!923632 m!857843))

(declare-fun m!857845 () Bool)

(assert (=> b!923623 m!857845))

(declare-fun m!857847 () Bool)

(assert (=> b!923626 m!857847))

(declare-fun m!857849 () Bool)

(assert (=> b!923628 m!857849))

(declare-fun m!857851 () Bool)

(assert (=> b!923628 m!857851))

(declare-fun m!857853 () Bool)

(assert (=> b!923628 m!857853))

(declare-fun m!857855 () Bool)

(assert (=> b!923628 m!857855))

(declare-fun m!857857 () Bool)

(assert (=> b!923628 m!857857))

(declare-fun m!857859 () Bool)

(assert (=> b!923628 m!857859))

(assert (=> b!923628 m!857857))

(declare-fun m!857861 () Bool)

(assert (=> b!923628 m!857861))

(declare-fun m!857863 () Bool)

(assert (=> b!923628 m!857863))

(declare-fun m!857865 () Bool)

(assert (=> b!923628 m!857865))

(declare-fun m!857867 () Bool)

(assert (=> b!923628 m!857867))

(declare-fun m!857869 () Bool)

(assert (=> b!923628 m!857869))

(declare-fun m!857871 () Bool)

(assert (=> b!923628 m!857871))

(declare-fun m!857873 () Bool)

(assert (=> b!923628 m!857873))

(declare-fun m!857875 () Bool)

(assert (=> b!923628 m!857875))

(assert (=> b!923628 m!857861))

(declare-fun m!857877 () Bool)

(assert (=> b!923628 m!857877))

(assert (=> b!923628 m!857851))

(declare-fun m!857879 () Bool)

(assert (=> b!923628 m!857879))

(declare-fun m!857881 () Bool)

(assert (=> b!923634 m!857881))

(declare-fun m!857883 () Bool)

(assert (=> b!923629 m!857883))

(assert (=> b!923629 m!857865))

(declare-fun m!857885 () Bool)

(assert (=> b!923622 m!857885))

(declare-fun m!857887 () Bool)

(assert (=> b!923622 m!857887))

(declare-fun m!857889 () Bool)

(assert (=> start!78950 m!857889))

(declare-fun m!857891 () Bool)

(assert (=> start!78950 m!857891))

(declare-fun m!857893 () Bool)

(assert (=> start!78950 m!857893))

(declare-fun m!857895 () Bool)

(assert (=> mapNonEmpty!31263 m!857895))

(declare-fun m!857897 () Bool)

(assert (=> b!923638 m!857897))

(declare-fun m!857899 () Bool)

(assert (=> b!923638 m!857899))

(declare-fun m!857901 () Bool)

(assert (=> b!923625 m!857901))

(declare-fun m!857903 () Bool)

(assert (=> b!923633 m!857903))

(check-sat (not b!923634) (not b!923638) (not b_next!17163) (not b!923626) (not b!923633) (not b!923632) tp_is_empty!19671 (not b!923623) b_and!28065 (not b!923629) (not b!923625) (not mapNonEmpty!31263) (not b_lambda!13665) (not start!78950) (not b!923628) (not b!923622))
(check-sat b_and!28065 (not b_next!17163))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79110 () Bool)

(assert start!79110)

(declare-fun b_free!17155 () Bool)

(declare-fun b_next!17155 () Bool)

(assert (=> start!79110 (= b_free!17155 (not b_next!17155))))

(declare-fun tp!59907 () Bool)

(declare-fun b_and!28057 () Bool)

(assert (=> start!79110 (= tp!59907 b_and!28057)))

(declare-fun b!924300 () Bool)

(declare-datatypes ((Unit!31155 0))(
  ( (Unit!31156) )
))
(declare-fun e!518675 () Unit!31155)

(declare-fun e!518684 () Unit!31155)

(assert (=> b!924300 (= e!518675 e!518684)))

(declare-fun lt!415205 () (_ BitVec 64))

(declare-datatypes ((array!55349 0))(
  ( (array!55350 (arr!26615 (Array (_ BitVec 32) (_ BitVec 64))) (size!27075 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55349)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!924300 (= lt!415205 (select (arr!26615 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96539 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924300 (= c!96539 (validKeyInArray!0 lt!415205))))

(declare-fun b!924301 () Bool)

(declare-fun res!622972 () Bool)

(declare-fun e!518686 () Bool)

(assert (=> b!924301 (=> (not res!622972) (not e!518686))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55349 (_ BitVec 32)) Bool)

(assert (=> b!924301 (= res!622972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924302 () Bool)

(declare-fun e!518678 () Bool)

(declare-fun e!518677 () Bool)

(assert (=> b!924302 (= e!518678 e!518677)))

(declare-fun res!622974 () Bool)

(assert (=> b!924302 (=> (not res!622974) (not e!518677))))

(declare-datatypes ((V!31183 0))(
  ( (V!31184 (val!9882 Int)) )
))
(declare-datatypes ((tuple2!12860 0))(
  ( (tuple2!12861 (_1!6441 (_ BitVec 64)) (_2!6441 V!31183)) )
))
(declare-datatypes ((List!18675 0))(
  ( (Nil!18672) (Cons!18671 (h!19823 tuple2!12860) (t!26552 List!18675)) )
))
(declare-datatypes ((ListLongMap!11559 0))(
  ( (ListLongMap!11560 (toList!5795 List!18675)) )
))
(declare-fun lt!415198 () ListLongMap!11559)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4868 (ListLongMap!11559 (_ BitVec 64)) Bool)

(assert (=> b!924302 (= res!622974 (contains!4868 lt!415198 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9350 0))(
  ( (ValueCellFull!9350 (v!12397 V!31183)) (EmptyCell!9350) )
))
(declare-datatypes ((array!55351 0))(
  ( (array!55352 (arr!26616 (Array (_ BitVec 32) ValueCell!9350)) (size!27076 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55351)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31183)

(declare-fun minValue!1173 () V!31183)

(declare-fun getCurrentListMap!3046 (array!55349 array!55351 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 32) Int) ListLongMap!11559)

(assert (=> b!924302 (= lt!415198 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31251 () Bool)

(declare-fun mapRes!31251 () Bool)

(declare-fun tp!59906 () Bool)

(declare-fun e!518682 () Bool)

(assert (=> mapNonEmpty!31251 (= mapRes!31251 (and tp!59906 e!518682))))

(declare-fun mapKey!31251 () (_ BitVec 32))

(declare-fun mapRest!31251 () (Array (_ BitVec 32) ValueCell!9350))

(declare-fun mapValue!31251 () ValueCell!9350)

(assert (=> mapNonEmpty!31251 (= (arr!26616 _values!1231) (store mapRest!31251 mapKey!31251 mapValue!31251))))

(declare-fun b!924303 () Bool)

(declare-fun res!622966 () Bool)

(assert (=> b!924303 (=> (not res!622966) (not e!518686))))

(declare-datatypes ((List!18676 0))(
  ( (Nil!18673) (Cons!18672 (h!19824 (_ BitVec 64)) (t!26553 List!18676)) )
))
(declare-fun arrayNoDuplicates!0 (array!55349 (_ BitVec 32) List!18676) Bool)

(assert (=> b!924303 (= res!622966 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18673))))

(declare-fun b!924304 () Bool)

(declare-fun Unit!31157 () Unit!31155)

(assert (=> b!924304 (= e!518684 Unit!31157)))

(declare-fun b!924305 () Bool)

(declare-fun e!518685 () Bool)

(assert (=> b!924305 (= e!518685 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924306 () Bool)

(declare-fun Unit!31158 () Unit!31155)

(assert (=> b!924306 (= e!518675 Unit!31158)))

(declare-fun mapIsEmpty!31251 () Bool)

(assert (=> mapIsEmpty!31251 mapRes!31251))

(declare-fun b!924307 () Bool)

(declare-fun e!518676 () Bool)

(declare-fun e!518680 () Bool)

(assert (=> b!924307 (= e!518676 e!518680)))

(declare-fun res!622967 () Bool)

(assert (=> b!924307 (=> (not res!622967) (not e!518680))))

(declare-fun v!791 () V!31183)

(declare-fun lt!415206 () V!31183)

(assert (=> b!924307 (= res!622967 (and (= lt!415206 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415207 () ListLongMap!11559)

(declare-fun apply!648 (ListLongMap!11559 (_ BitVec 64)) V!31183)

(assert (=> b!924307 (= lt!415206 (apply!648 lt!415207 k0!1099))))

(declare-fun b!924308 () Bool)

(assert (=> b!924308 (= e!518677 false)))

(declare-fun lt!415194 () V!31183)

(assert (=> b!924308 (= lt!415194 (apply!648 lt!415198 k0!1099))))

(declare-fun b!924309 () Bool)

(declare-fun lt!415200 () ListLongMap!11559)

(assert (=> b!924309 (= (apply!648 lt!415200 k0!1099) lt!415206)))

(declare-fun lt!415204 () V!31183)

(declare-fun lt!415201 () Unit!31155)

(declare-fun addApplyDifferent!354 (ListLongMap!11559 (_ BitVec 64) V!31183 (_ BitVec 64)) Unit!31155)

(assert (=> b!924309 (= lt!415201 (addApplyDifferent!354 lt!415207 lt!415205 lt!415204 k0!1099))))

(assert (=> b!924309 (not (= lt!415205 k0!1099))))

(declare-fun lt!415195 () Unit!31155)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55349 (_ BitVec 64) (_ BitVec 32) List!18676) Unit!31155)

(assert (=> b!924309 (= lt!415195 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18673))))

(assert (=> b!924309 e!518685))

(declare-fun c!96538 () Bool)

(assert (=> b!924309 (= c!96538 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415199 () Unit!31155)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!209 (array!55349 array!55351 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 64) (_ BitVec 32) Int) Unit!31155)

(assert (=> b!924309 (= lt!415199 (lemmaListMapContainsThenArrayContainsFrom!209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924309 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18673)))

(declare-fun lt!415196 () Unit!31155)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55349 (_ BitVec 32) (_ BitVec 32)) Unit!31155)

(assert (=> b!924309 (= lt!415196 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924309 (contains!4868 lt!415200 k0!1099)))

(declare-fun lt!415208 () tuple2!12860)

(declare-fun +!2718 (ListLongMap!11559 tuple2!12860) ListLongMap!11559)

(assert (=> b!924309 (= lt!415200 (+!2718 lt!415207 lt!415208))))

(declare-fun lt!415202 () Unit!31155)

(declare-fun addStillContains!427 (ListLongMap!11559 (_ BitVec 64) V!31183 (_ BitVec 64)) Unit!31155)

(assert (=> b!924309 (= lt!415202 (addStillContains!427 lt!415207 lt!415205 lt!415204 k0!1099))))

(assert (=> b!924309 (= (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2718 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415208))))

(assert (=> b!924309 (= lt!415208 (tuple2!12861 lt!415205 lt!415204))))

(declare-fun get!14005 (ValueCell!9350 V!31183) V!31183)

(declare-fun dynLambda!1515 (Int (_ BitVec 64)) V!31183)

(assert (=> b!924309 (= lt!415204 (get!14005 (select (arr!26616 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1515 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415203 () Unit!31155)

(declare-fun lemmaListMapRecursiveValidKeyArray!98 (array!55349 array!55351 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 32) Int) Unit!31155)

(assert (=> b!924309 (= lt!415203 (lemmaListMapRecursiveValidKeyArray!98 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924309 (= e!518684 lt!415201)))

(declare-fun res!622969 () Bool)

(assert (=> start!79110 (=> (not res!622969) (not e!518686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79110 (= res!622969 (validMask!0 mask!1881))))

(assert (=> start!79110 e!518686))

(assert (=> start!79110 true))

(declare-fun tp_is_empty!19663 () Bool)

(assert (=> start!79110 tp_is_empty!19663))

(declare-fun e!518679 () Bool)

(declare-fun array_inv!20832 (array!55351) Bool)

(assert (=> start!79110 (and (array_inv!20832 _values!1231) e!518679)))

(assert (=> start!79110 tp!59907))

(declare-fun array_inv!20833 (array!55349) Bool)

(assert (=> start!79110 (array_inv!20833 _keys!1487)))

(declare-fun b!924310 () Bool)

(assert (=> b!924310 (= e!518682 tp_is_empty!19663)))

(declare-fun b!924311 () Bool)

(declare-fun arrayContainsKey!0 (array!55349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924311 (= e!518685 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924312 () Bool)

(assert (=> b!924312 (= e!518686 e!518676)))

(declare-fun res!622971 () Bool)

(assert (=> b!924312 (=> (not res!622971) (not e!518676))))

(assert (=> b!924312 (= res!622971 (contains!4868 lt!415207 k0!1099))))

(assert (=> b!924312 (= lt!415207 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924313 () Bool)

(declare-fun e!518681 () Bool)

(assert (=> b!924313 (= e!518679 (and e!518681 mapRes!31251))))

(declare-fun condMapEmpty!31251 () Bool)

(declare-fun mapDefault!31251 () ValueCell!9350)

(assert (=> b!924313 (= condMapEmpty!31251 (= (arr!26616 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9350)) mapDefault!31251)))))

(declare-fun b!924314 () Bool)

(assert (=> b!924314 (= e!518680 e!518678)))

(declare-fun res!622970 () Bool)

(assert (=> b!924314 (=> (not res!622970) (not e!518678))))

(assert (=> b!924314 (= res!622970 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27075 _keys!1487)))))

(declare-fun lt!415197 () Unit!31155)

(assert (=> b!924314 (= lt!415197 e!518675)))

(declare-fun c!96540 () Bool)

(assert (=> b!924314 (= c!96540 (validKeyInArray!0 k0!1099))))

(declare-fun b!924315 () Bool)

(assert (=> b!924315 (= e!518681 tp_is_empty!19663)))

(declare-fun b!924316 () Bool)

(declare-fun res!622973 () Bool)

(assert (=> b!924316 (=> (not res!622973) (not e!518686))))

(assert (=> b!924316 (= res!622973 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27075 _keys!1487))))))

(declare-fun b!924317 () Bool)

(declare-fun res!622968 () Bool)

(assert (=> b!924317 (=> (not res!622968) (not e!518686))))

(assert (=> b!924317 (= res!622968 (and (= (size!27076 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27075 _keys!1487) (size!27076 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79110 res!622969) b!924317))

(assert (= (and b!924317 res!622968) b!924301))

(assert (= (and b!924301 res!622972) b!924303))

(assert (= (and b!924303 res!622966) b!924316))

(assert (= (and b!924316 res!622973) b!924312))

(assert (= (and b!924312 res!622971) b!924307))

(assert (= (and b!924307 res!622967) b!924314))

(assert (= (and b!924314 c!96540) b!924300))

(assert (= (and b!924314 (not c!96540)) b!924306))

(assert (= (and b!924300 c!96539) b!924309))

(assert (= (and b!924300 (not c!96539)) b!924304))

(assert (= (and b!924309 c!96538) b!924311))

(assert (= (and b!924309 (not c!96538)) b!924305))

(assert (= (and b!924314 res!622970) b!924302))

(assert (= (and b!924302 res!622974) b!924308))

(assert (= (and b!924313 condMapEmpty!31251) mapIsEmpty!31251))

(assert (= (and b!924313 (not condMapEmpty!31251)) mapNonEmpty!31251))

(get-info :version)

(assert (= (and mapNonEmpty!31251 ((_ is ValueCellFull!9350) mapValue!31251)) b!924310))

(assert (= (and b!924313 ((_ is ValueCellFull!9350) mapDefault!31251)) b!924315))

(assert (= start!79110 b!924313))

(declare-fun b_lambda!13671 () Bool)

(assert (=> (not b_lambda!13671) (not b!924309)))

(declare-fun t!26551 () Bool)

(declare-fun tb!5727 () Bool)

(assert (=> (and start!79110 (= defaultEntry!1235 defaultEntry!1235) t!26551) tb!5727))

(declare-fun result!11285 () Bool)

(assert (=> tb!5727 (= result!11285 tp_is_empty!19663)))

(assert (=> b!924309 t!26551))

(declare-fun b_and!28059 () Bool)

(assert (= b_and!28057 (and (=> t!26551 result!11285) b_and!28059)))

(declare-fun m!858889 () Bool)

(assert (=> b!924302 m!858889))

(declare-fun m!858891 () Bool)

(assert (=> b!924302 m!858891))

(declare-fun m!858893 () Bool)

(assert (=> b!924303 m!858893))

(declare-fun m!858895 () Bool)

(assert (=> mapNonEmpty!31251 m!858895))

(declare-fun m!858897 () Bool)

(assert (=> b!924300 m!858897))

(declare-fun m!858899 () Bool)

(assert (=> b!924300 m!858899))

(declare-fun m!858901 () Bool)

(assert (=> b!924314 m!858901))

(declare-fun m!858903 () Bool)

(assert (=> b!924307 m!858903))

(declare-fun m!858905 () Bool)

(assert (=> b!924312 m!858905))

(declare-fun m!858907 () Bool)

(assert (=> b!924312 m!858907))

(declare-fun m!858909 () Bool)

(assert (=> start!79110 m!858909))

(declare-fun m!858911 () Bool)

(assert (=> start!79110 m!858911))

(declare-fun m!858913 () Bool)

(assert (=> start!79110 m!858913))

(declare-fun m!858915 () Bool)

(assert (=> b!924309 m!858915))

(declare-fun m!858917 () Bool)

(assert (=> b!924309 m!858917))

(declare-fun m!858919 () Bool)

(assert (=> b!924309 m!858919))

(declare-fun m!858921 () Bool)

(assert (=> b!924309 m!858921))

(declare-fun m!858923 () Bool)

(assert (=> b!924309 m!858923))

(declare-fun m!858925 () Bool)

(assert (=> b!924309 m!858925))

(assert (=> b!924309 m!858925))

(declare-fun m!858927 () Bool)

(assert (=> b!924309 m!858927))

(declare-fun m!858929 () Bool)

(assert (=> b!924309 m!858929))

(assert (=> b!924309 m!858891))

(declare-fun m!858931 () Bool)

(assert (=> b!924309 m!858931))

(declare-fun m!858933 () Bool)

(assert (=> b!924309 m!858933))

(declare-fun m!858935 () Bool)

(assert (=> b!924309 m!858935))

(declare-fun m!858937 () Bool)

(assert (=> b!924309 m!858937))

(declare-fun m!858939 () Bool)

(assert (=> b!924309 m!858939))

(assert (=> b!924309 m!858927))

(declare-fun m!858941 () Bool)

(assert (=> b!924309 m!858941))

(assert (=> b!924309 m!858915))

(declare-fun m!858943 () Bool)

(assert (=> b!924309 m!858943))

(declare-fun m!858945 () Bool)

(assert (=> b!924308 m!858945))

(declare-fun m!858947 () Bool)

(assert (=> b!924301 m!858947))

(declare-fun m!858949 () Bool)

(assert (=> b!924311 m!858949))

(check-sat (not start!79110) (not b!924303) (not b!924311) (not b_next!17155) (not b!924312) (not b!924308) (not mapNonEmpty!31251) (not b!924302) (not b!924314) (not b!924300) tp_is_empty!19663 (not b_lambda!13671) (not b!924301) (not b!924309) b_and!28059 (not b!924307))
(check-sat b_and!28059 (not b_next!17155))

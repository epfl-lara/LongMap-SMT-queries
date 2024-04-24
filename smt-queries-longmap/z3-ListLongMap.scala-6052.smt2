; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78400 () Bool)

(assert start!78400)

(declare-fun b_free!16723 () Bool)

(declare-fun b_next!16723 () Bool)

(assert (=> start!78400 (= b_free!16723 (not b_next!16723))))

(declare-fun tp!58447 () Bool)

(declare-fun b_and!27309 () Bool)

(assert (=> start!78400 (= tp!58447 b_and!27309)))

(declare-fun b!914006 () Bool)

(declare-fun res!616311 () Bool)

(declare-fun e!512744 () Bool)

(assert (=> b!914006 (=> (not res!616311) (not e!512744))))

(declare-datatypes ((array!54329 0))(
  ( (array!54330 (arr!26114 (Array (_ BitVec 32) (_ BitVec 64))) (size!26574 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54329)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54329 (_ BitVec 32)) Bool)

(assert (=> b!914006 (= res!616311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30439 () Bool)

(declare-fun mapRes!30439 () Bool)

(declare-fun tp!58446 () Bool)

(declare-fun e!512741 () Bool)

(assert (=> mapNonEmpty!30439 (= mapRes!30439 (and tp!58446 e!512741))))

(declare-datatypes ((V!30487 0))(
  ( (V!30488 (val!9621 Int)) )
))
(declare-datatypes ((ValueCell!9089 0))(
  ( (ValueCellFull!9089 (v!12129 V!30487)) (EmptyCell!9089) )
))
(declare-datatypes ((array!54331 0))(
  ( (array!54332 (arr!26115 (Array (_ BitVec 32) ValueCell!9089)) (size!26575 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54331)

(declare-fun mapRest!30439 () (Array (_ BitVec 32) ValueCell!9089))

(declare-fun mapKey!30439 () (_ BitVec 32))

(declare-fun mapValue!30439 () ValueCell!9089)

(assert (=> mapNonEmpty!30439 (= (arr!26115 _values!1152) (store mapRest!30439 mapKey!30439 mapValue!30439))))

(declare-fun b!914007 () Bool)

(declare-fun res!616307 () Bool)

(assert (=> b!914007 (=> (not res!616307) (not e!512744))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!914007 (= res!616307 (and (= (select (arr!26114 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914008 () Bool)

(declare-fun res!616312 () Bool)

(assert (=> b!914008 (=> (not res!616312) (not e!512744))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914008 (= res!616312 (inRange!0 i!717 mask!1756))))

(declare-fun res!616313 () Bool)

(assert (=> start!78400 (=> (not res!616313) (not e!512744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78400 (= res!616313 (validMask!0 mask!1756))))

(assert (=> start!78400 e!512744))

(declare-fun e!512742 () Bool)

(declare-fun array_inv!20486 (array!54331) Bool)

(assert (=> start!78400 (and (array_inv!20486 _values!1152) e!512742)))

(assert (=> start!78400 tp!58447))

(assert (=> start!78400 true))

(declare-fun tp_is_empty!19141 () Bool)

(assert (=> start!78400 tp_is_empty!19141))

(declare-fun array_inv!20487 (array!54329) Bool)

(assert (=> start!78400 (array_inv!20487 _keys!1386)))

(declare-fun mapIsEmpty!30439 () Bool)

(assert (=> mapIsEmpty!30439 mapRes!30439))

(declare-fun b!914009 () Bool)

(declare-fun res!616308 () Bool)

(assert (=> b!914009 (=> (not res!616308) (not e!512744))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30487)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30487)

(declare-datatypes ((tuple2!12492 0))(
  ( (tuple2!12493 (_1!6257 (_ BitVec 64)) (_2!6257 V!30487)) )
))
(declare-datatypes ((List!18310 0))(
  ( (Nil!18307) (Cons!18306 (h!19458 tuple2!12492) (t!25891 List!18310)) )
))
(declare-datatypes ((ListLongMap!11191 0))(
  ( (ListLongMap!11192 (toList!5611 List!18310)) )
))
(declare-fun contains!4666 (ListLongMap!11191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2872 (array!54329 array!54331 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 32) Int) ListLongMap!11191)

(assert (=> b!914009 (= res!616308 (contains!4666 (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!914010 () Bool)

(assert (=> b!914010 (= e!512741 tp_is_empty!19141)))

(declare-fun b!914011 () Bool)

(assert (=> b!914011 (= e!512744 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26574 _keys!1386)))))))

(declare-fun arrayContainsKey!0 (array!54329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914011 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30890 0))(
  ( (Unit!30891) )
))
(declare-fun lt!411096 () Unit!30890)

(declare-fun lemmaKeyInListMapIsInArray!276 (array!54329 array!54331 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 64) Int) Unit!30890)

(assert (=> b!914011 (= lt!411096 (lemmaKeyInListMapIsInArray!276 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!914012 () Bool)

(declare-fun res!616310 () Bool)

(assert (=> b!914012 (=> (not res!616310) (not e!512744))))

(assert (=> b!914012 (= res!616310 (and (= (size!26575 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26574 _keys!1386) (size!26575 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914013 () Bool)

(declare-fun e!512743 () Bool)

(assert (=> b!914013 (= e!512742 (and e!512743 mapRes!30439))))

(declare-fun condMapEmpty!30439 () Bool)

(declare-fun mapDefault!30439 () ValueCell!9089)

(assert (=> b!914013 (= condMapEmpty!30439 (= (arr!26115 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9089)) mapDefault!30439)))))

(declare-fun b!914014 () Bool)

(declare-fun res!616309 () Bool)

(assert (=> b!914014 (=> (not res!616309) (not e!512744))))

(declare-datatypes ((List!18311 0))(
  ( (Nil!18308) (Cons!18307 (h!19459 (_ BitVec 64)) (t!25892 List!18311)) )
))
(declare-fun arrayNoDuplicates!0 (array!54329 (_ BitVec 32) List!18311) Bool)

(assert (=> b!914014 (= res!616309 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18308))))

(declare-fun b!914015 () Bool)

(assert (=> b!914015 (= e!512743 tp_is_empty!19141)))

(assert (= (and start!78400 res!616313) b!914012))

(assert (= (and b!914012 res!616310) b!914006))

(assert (= (and b!914006 res!616311) b!914014))

(assert (= (and b!914014 res!616309) b!914009))

(assert (= (and b!914009 res!616308) b!914008))

(assert (= (and b!914008 res!616312) b!914007))

(assert (= (and b!914007 res!616307) b!914011))

(assert (= (and b!914013 condMapEmpty!30439) mapIsEmpty!30439))

(assert (= (and b!914013 (not condMapEmpty!30439)) mapNonEmpty!30439))

(get-info :version)

(assert (= (and mapNonEmpty!30439 ((_ is ValueCellFull!9089) mapValue!30439)) b!914010))

(assert (= (and b!914013 ((_ is ValueCellFull!9089) mapDefault!30439)) b!914015))

(assert (= start!78400 b!914013))

(declare-fun m!848769 () Bool)

(assert (=> b!914006 m!848769))

(declare-fun m!848771 () Bool)

(assert (=> start!78400 m!848771))

(declare-fun m!848773 () Bool)

(assert (=> start!78400 m!848773))

(declare-fun m!848775 () Bool)

(assert (=> start!78400 m!848775))

(declare-fun m!848777 () Bool)

(assert (=> b!914011 m!848777))

(declare-fun m!848779 () Bool)

(assert (=> b!914011 m!848779))

(declare-fun m!848781 () Bool)

(assert (=> b!914008 m!848781))

(declare-fun m!848783 () Bool)

(assert (=> mapNonEmpty!30439 m!848783))

(declare-fun m!848785 () Bool)

(assert (=> b!914007 m!848785))

(declare-fun m!848787 () Bool)

(assert (=> b!914014 m!848787))

(declare-fun m!848789 () Bool)

(assert (=> b!914009 m!848789))

(assert (=> b!914009 m!848789))

(declare-fun m!848791 () Bool)

(assert (=> b!914009 m!848791))

(check-sat tp_is_empty!19141 (not b!914006) (not mapNonEmpty!30439) (not b!914011) (not b!914014) b_and!27309 (not start!78400) (not b_next!16723) (not b!914009) (not b!914008))
(check-sat b_and!27309 (not b_next!16723))
(get-model)

(declare-fun b!914086 () Bool)

(declare-fun e!512787 () Bool)

(declare-fun contains!4669 (List!18311 (_ BitVec 64)) Bool)

(assert (=> b!914086 (= e!512787 (contains!4669 Nil!18308 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914087 () Bool)

(declare-fun e!512786 () Bool)

(declare-fun e!512785 () Bool)

(assert (=> b!914087 (= e!512786 e!512785)))

(declare-fun c!96084 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914087 (= c!96084 (validKeyInArray!0 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40439 () Bool)

(declare-fun call!40442 () Bool)

(assert (=> bm!40439 (= call!40442 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96084 (Cons!18307 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000) Nil!18308) Nil!18308)))))

(declare-fun d!112637 () Bool)

(declare-fun res!616364 () Bool)

(declare-fun e!512784 () Bool)

(assert (=> d!112637 (=> res!616364 e!512784)))

(assert (=> d!112637 (= res!616364 (bvsge #b00000000000000000000000000000000 (size!26574 _keys!1386)))))

(assert (=> d!112637 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18308) e!512784)))

(declare-fun b!914088 () Bool)

(assert (=> b!914088 (= e!512785 call!40442)))

(declare-fun b!914089 () Bool)

(assert (=> b!914089 (= e!512784 e!512786)))

(declare-fun res!616363 () Bool)

(assert (=> b!914089 (=> (not res!616363) (not e!512786))))

(assert (=> b!914089 (= res!616363 (not e!512787))))

(declare-fun res!616362 () Bool)

(assert (=> b!914089 (=> (not res!616362) (not e!512787))))

(assert (=> b!914089 (= res!616362 (validKeyInArray!0 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914090 () Bool)

(assert (=> b!914090 (= e!512785 call!40442)))

(assert (= (and d!112637 (not res!616364)) b!914089))

(assert (= (and b!914089 res!616362) b!914086))

(assert (= (and b!914089 res!616363) b!914087))

(assert (= (and b!914087 c!96084) b!914088))

(assert (= (and b!914087 (not c!96084)) b!914090))

(assert (= (or b!914088 b!914090) bm!40439))

(declare-fun m!848841 () Bool)

(assert (=> b!914086 m!848841))

(assert (=> b!914086 m!848841))

(declare-fun m!848843 () Bool)

(assert (=> b!914086 m!848843))

(assert (=> b!914087 m!848841))

(assert (=> b!914087 m!848841))

(declare-fun m!848845 () Bool)

(assert (=> b!914087 m!848845))

(assert (=> bm!40439 m!848841))

(declare-fun m!848847 () Bool)

(assert (=> bm!40439 m!848847))

(assert (=> b!914089 m!848841))

(assert (=> b!914089 m!848841))

(assert (=> b!914089 m!848845))

(assert (=> b!914014 d!112637))

(declare-fun d!112639 () Bool)

(declare-fun e!512792 () Bool)

(assert (=> d!112639 e!512792))

(declare-fun res!616367 () Bool)

(assert (=> d!112639 (=> res!616367 e!512792)))

(declare-fun lt!411114 () Bool)

(assert (=> d!112639 (= res!616367 (not lt!411114))))

(declare-fun lt!411112 () Bool)

(assert (=> d!112639 (= lt!411114 lt!411112)))

(declare-fun lt!411113 () Unit!30890)

(declare-fun e!512793 () Unit!30890)

(assert (=> d!112639 (= lt!411113 e!512793)))

(declare-fun c!96087 () Bool)

(assert (=> d!112639 (= c!96087 lt!411112)))

(declare-fun containsKey!443 (List!18310 (_ BitVec 64)) Bool)

(assert (=> d!112639 (= lt!411112 (containsKey!443 (toList!5611 (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112639 (= (contains!4666 (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!411114)))

(declare-fun b!914097 () Bool)

(declare-fun lt!411111 () Unit!30890)

(assert (=> b!914097 (= e!512793 lt!411111)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!337 (List!18310 (_ BitVec 64)) Unit!30890)

(assert (=> b!914097 (= lt!411111 (lemmaContainsKeyImpliesGetValueByKeyDefined!337 (toList!5611 (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!478 0))(
  ( (Some!477 (v!12132 V!30487)) (None!476) )
))
(declare-fun isDefined!345 (Option!478) Bool)

(declare-fun getValueByKey!472 (List!18310 (_ BitVec 64)) Option!478)

(assert (=> b!914097 (isDefined!345 (getValueByKey!472 (toList!5611 (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!914098 () Bool)

(declare-fun Unit!30894 () Unit!30890)

(assert (=> b!914098 (= e!512793 Unit!30894)))

(declare-fun b!914099 () Bool)

(assert (=> b!914099 (= e!512792 (isDefined!345 (getValueByKey!472 (toList!5611 (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112639 c!96087) b!914097))

(assert (= (and d!112639 (not c!96087)) b!914098))

(assert (= (and d!112639 (not res!616367)) b!914099))

(declare-fun m!848849 () Bool)

(assert (=> d!112639 m!848849))

(declare-fun m!848851 () Bool)

(assert (=> b!914097 m!848851))

(declare-fun m!848853 () Bool)

(assert (=> b!914097 m!848853))

(assert (=> b!914097 m!848853))

(declare-fun m!848855 () Bool)

(assert (=> b!914097 m!848855))

(assert (=> b!914099 m!848853))

(assert (=> b!914099 m!848853))

(assert (=> b!914099 m!848855))

(assert (=> b!914009 d!112639))

(declare-fun b!914142 () Bool)

(declare-fun e!512823 () Bool)

(declare-fun lt!411175 () ListLongMap!11191)

(declare-fun apply!526 (ListLongMap!11191 (_ BitVec 64)) V!30487)

(assert (=> b!914142 (= e!512823 (= (apply!526 lt!411175 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!914143 () Bool)

(declare-fun e!512827 () Bool)

(assert (=> b!914143 (= e!512827 (= (apply!526 lt!411175 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun c!96105 () Bool)

(declare-fun bm!40454 () Bool)

(declare-fun call!40463 () ListLongMap!11191)

(declare-fun call!40458 () ListLongMap!11191)

(declare-fun call!40461 () ListLongMap!11191)

(declare-fun c!96102 () Bool)

(declare-fun call!40459 () ListLongMap!11191)

(declare-fun +!2617 (ListLongMap!11191 tuple2!12492) ListLongMap!11191)

(assert (=> bm!40454 (= call!40461 (+!2617 (ite c!96102 call!40459 (ite c!96105 call!40458 call!40463)) (ite (or c!96102 c!96105) (tuple2!12493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!914144 () Bool)

(declare-fun e!512831 () ListLongMap!11191)

(assert (=> b!914144 (= e!512831 call!40463)))

(declare-fun b!914145 () Bool)

(declare-fun e!512830 () Bool)

(declare-fun e!512832 () Bool)

(assert (=> b!914145 (= e!512830 e!512832)))

(declare-fun c!96104 () Bool)

(assert (=> b!914145 (= c!96104 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!112641 () Bool)

(assert (=> d!112641 e!512830))

(declare-fun res!616390 () Bool)

(assert (=> d!112641 (=> (not res!616390) (not e!512830))))

(assert (=> d!112641 (= res!616390 (or (bvsge #b00000000000000000000000000000000 (size!26574 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26574 _keys!1386)))))))

(declare-fun lt!411161 () ListLongMap!11191)

(assert (=> d!112641 (= lt!411175 lt!411161)))

(declare-fun lt!411176 () Unit!30890)

(declare-fun e!512824 () Unit!30890)

(assert (=> d!112641 (= lt!411176 e!512824)))

(declare-fun c!96101 () Bool)

(declare-fun e!512820 () Bool)

(assert (=> d!112641 (= c!96101 e!512820)))

(declare-fun res!616394 () Bool)

(assert (=> d!112641 (=> (not res!616394) (not e!512820))))

(assert (=> d!112641 (= res!616394 (bvslt #b00000000000000000000000000000000 (size!26574 _keys!1386)))))

(declare-fun e!512826 () ListLongMap!11191)

(assert (=> d!112641 (= lt!411161 e!512826)))

(assert (=> d!112641 (= c!96102 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112641 (validMask!0 mask!1756)))

(assert (=> d!112641 (= (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411175)))

(declare-fun b!914146 () Bool)

(declare-fun e!512828 () Bool)

(assert (=> b!914146 (= e!512828 (validKeyInArray!0 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914147 () Bool)

(declare-fun call!40460 () ListLongMap!11191)

(assert (=> b!914147 (= e!512831 call!40460)))

(declare-fun b!914148 () Bool)

(declare-fun e!512829 () ListLongMap!11191)

(assert (=> b!914148 (= e!512826 e!512829)))

(assert (=> b!914148 (= c!96105 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!914149 () Bool)

(assert (=> b!914149 (= e!512820 (validKeyInArray!0 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914150 () Bool)

(declare-fun lt!411171 () Unit!30890)

(assert (=> b!914150 (= e!512824 lt!411171)))

(declare-fun lt!411167 () ListLongMap!11191)

(declare-fun getCurrentListMapNoExtraKeys!3338 (array!54329 array!54331 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 32) Int) ListLongMap!11191)

(assert (=> b!914150 (= lt!411167 (getCurrentListMapNoExtraKeys!3338 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411172 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411162 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411162 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411159 () Unit!30890)

(declare-fun addStillContains!348 (ListLongMap!11191 (_ BitVec 64) V!30487 (_ BitVec 64)) Unit!30890)

(assert (=> b!914150 (= lt!411159 (addStillContains!348 lt!411167 lt!411172 zeroValue!1094 lt!411162))))

(assert (=> b!914150 (contains!4666 (+!2617 lt!411167 (tuple2!12493 lt!411172 zeroValue!1094)) lt!411162)))

(declare-fun lt!411168 () Unit!30890)

(assert (=> b!914150 (= lt!411168 lt!411159)))

(declare-fun lt!411173 () ListLongMap!11191)

(assert (=> b!914150 (= lt!411173 (getCurrentListMapNoExtraKeys!3338 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411160 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411160 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411180 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411180 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411165 () Unit!30890)

(declare-fun addApplyDifferent!348 (ListLongMap!11191 (_ BitVec 64) V!30487 (_ BitVec 64)) Unit!30890)

(assert (=> b!914150 (= lt!411165 (addApplyDifferent!348 lt!411173 lt!411160 minValue!1094 lt!411180))))

(assert (=> b!914150 (= (apply!526 (+!2617 lt!411173 (tuple2!12493 lt!411160 minValue!1094)) lt!411180) (apply!526 lt!411173 lt!411180))))

(declare-fun lt!411163 () Unit!30890)

(assert (=> b!914150 (= lt!411163 lt!411165)))

(declare-fun lt!411174 () ListLongMap!11191)

(assert (=> b!914150 (= lt!411174 (getCurrentListMapNoExtraKeys!3338 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411179 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411166 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411166 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411170 () Unit!30890)

(assert (=> b!914150 (= lt!411170 (addApplyDifferent!348 lt!411174 lt!411179 zeroValue!1094 lt!411166))))

(assert (=> b!914150 (= (apply!526 (+!2617 lt!411174 (tuple2!12493 lt!411179 zeroValue!1094)) lt!411166) (apply!526 lt!411174 lt!411166))))

(declare-fun lt!411178 () Unit!30890)

(assert (=> b!914150 (= lt!411178 lt!411170)))

(declare-fun lt!411177 () ListLongMap!11191)

(assert (=> b!914150 (= lt!411177 (getCurrentListMapNoExtraKeys!3338 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411169 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411169 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411164 () (_ BitVec 64))

(assert (=> b!914150 (= lt!411164 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!914150 (= lt!411171 (addApplyDifferent!348 lt!411177 lt!411169 minValue!1094 lt!411164))))

(assert (=> b!914150 (= (apply!526 (+!2617 lt!411177 (tuple2!12493 lt!411169 minValue!1094)) lt!411164) (apply!526 lt!411177 lt!411164))))

(declare-fun bm!40455 () Bool)

(assert (=> bm!40455 (= call!40459 (getCurrentListMapNoExtraKeys!3338 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914151 () Bool)

(declare-fun Unit!30895 () Unit!30890)

(assert (=> b!914151 (= e!512824 Unit!30895)))

(declare-fun b!914152 () Bool)

(declare-fun res!616388 () Bool)

(assert (=> b!914152 (=> (not res!616388) (not e!512830))))

(declare-fun e!512822 () Bool)

(assert (=> b!914152 (= res!616388 e!512822)))

(declare-fun res!616393 () Bool)

(assert (=> b!914152 (=> res!616393 e!512822)))

(assert (=> b!914152 (= res!616393 (not e!512828))))

(declare-fun res!616391 () Bool)

(assert (=> b!914152 (=> (not res!616391) (not e!512828))))

(assert (=> b!914152 (= res!616391 (bvslt #b00000000000000000000000000000000 (size!26574 _keys!1386)))))

(declare-fun b!914153 () Bool)

(assert (=> b!914153 (= e!512829 call!40460)))

(declare-fun bm!40456 () Bool)

(assert (=> bm!40456 (= call!40458 call!40459)))

(declare-fun b!914154 () Bool)

(assert (=> b!914154 (= e!512826 (+!2617 call!40461 (tuple2!12493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!914155 () Bool)

(declare-fun e!512825 () Bool)

(declare-fun call!40457 () Bool)

(assert (=> b!914155 (= e!512825 (not call!40457))))

(declare-fun b!914156 () Bool)

(declare-fun c!96100 () Bool)

(assert (=> b!914156 (= c!96100 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!914156 (= e!512829 e!512831)))

(declare-fun b!914157 () Bool)

(declare-fun res!616389 () Bool)

(assert (=> b!914157 (=> (not res!616389) (not e!512830))))

(assert (=> b!914157 (= res!616389 e!512825)))

(declare-fun c!96103 () Bool)

(assert (=> b!914157 (= c!96103 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40457 () Bool)

(assert (=> bm!40457 (= call!40457 (contains!4666 lt!411175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40458 () Bool)

(declare-fun call!40462 () Bool)

(assert (=> bm!40458 (= call!40462 (contains!4666 lt!411175 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40459 () Bool)

(assert (=> bm!40459 (= call!40463 call!40458)))

(declare-fun bm!40460 () Bool)

(assert (=> bm!40460 (= call!40460 call!40461)))

(declare-fun b!914158 () Bool)

(declare-fun e!512821 () Bool)

(assert (=> b!914158 (= e!512822 e!512821)))

(declare-fun res!616386 () Bool)

(assert (=> b!914158 (=> (not res!616386) (not e!512821))))

(assert (=> b!914158 (= res!616386 (contains!4666 lt!411175 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26574 _keys!1386)))))

(declare-fun b!914159 () Bool)

(assert (=> b!914159 (= e!512825 e!512827)))

(declare-fun res!616387 () Bool)

(assert (=> b!914159 (= res!616387 call!40457)))

(assert (=> b!914159 (=> (not res!616387) (not e!512827))))

(declare-fun b!914160 () Bool)

(assert (=> b!914160 (= e!512832 (not call!40462))))

(declare-fun b!914161 () Bool)

(declare-fun get!13716 (ValueCell!9089 V!30487) V!30487)

(declare-fun dynLambda!1407 (Int (_ BitVec 64)) V!30487)

(assert (=> b!914161 (= e!512821 (= (apply!526 lt!411175 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)) (get!13716 (select (arr!26115 _values!1152) #b00000000000000000000000000000000) (dynLambda!1407 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26575 _values!1152)))))

(assert (=> b!914161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26574 _keys!1386)))))

(declare-fun b!914162 () Bool)

(assert (=> b!914162 (= e!512832 e!512823)))

(declare-fun res!616392 () Bool)

(assert (=> b!914162 (= res!616392 call!40462)))

(assert (=> b!914162 (=> (not res!616392) (not e!512823))))

(assert (= (and d!112641 c!96102) b!914154))

(assert (= (and d!112641 (not c!96102)) b!914148))

(assert (= (and b!914148 c!96105) b!914153))

(assert (= (and b!914148 (not c!96105)) b!914156))

(assert (= (and b!914156 c!96100) b!914147))

(assert (= (and b!914156 (not c!96100)) b!914144))

(assert (= (or b!914147 b!914144) bm!40459))

(assert (= (or b!914153 bm!40459) bm!40456))

(assert (= (or b!914153 b!914147) bm!40460))

(assert (= (or b!914154 bm!40456) bm!40455))

(assert (= (or b!914154 bm!40460) bm!40454))

(assert (= (and d!112641 res!616394) b!914149))

(assert (= (and d!112641 c!96101) b!914150))

(assert (= (and d!112641 (not c!96101)) b!914151))

(assert (= (and d!112641 res!616390) b!914152))

(assert (= (and b!914152 res!616391) b!914146))

(assert (= (and b!914152 (not res!616393)) b!914158))

(assert (= (and b!914158 res!616386) b!914161))

(assert (= (and b!914152 res!616388) b!914157))

(assert (= (and b!914157 c!96103) b!914159))

(assert (= (and b!914157 (not c!96103)) b!914155))

(assert (= (and b!914159 res!616387) b!914143))

(assert (= (or b!914159 b!914155) bm!40457))

(assert (= (and b!914157 res!616389) b!914145))

(assert (= (and b!914145 c!96104) b!914162))

(assert (= (and b!914145 (not c!96104)) b!914160))

(assert (= (and b!914162 res!616392) b!914142))

(assert (= (or b!914162 b!914160) bm!40458))

(declare-fun b_lambda!13325 () Bool)

(assert (=> (not b_lambda!13325) (not b!914161)))

(declare-fun t!25897 () Bool)

(declare-fun tb!5433 () Bool)

(assert (=> (and start!78400 (= defaultEntry!1160 defaultEntry!1160) t!25897) tb!5433))

(declare-fun result!10679 () Bool)

(assert (=> tb!5433 (= result!10679 tp_is_empty!19141)))

(assert (=> b!914161 t!25897))

(declare-fun b_and!27315 () Bool)

(assert (= b_and!27309 (and (=> t!25897 result!10679) b_and!27315)))

(declare-fun m!848857 () Bool)

(assert (=> b!914143 m!848857))

(declare-fun m!848859 () Bool)

(assert (=> b!914142 m!848859))

(declare-fun m!848861 () Bool)

(assert (=> bm!40454 m!848861))

(assert (=> b!914158 m!848841))

(assert (=> b!914158 m!848841))

(declare-fun m!848863 () Bool)

(assert (=> b!914158 m!848863))

(declare-fun m!848865 () Bool)

(assert (=> b!914150 m!848865))

(declare-fun m!848867 () Bool)

(assert (=> b!914150 m!848867))

(assert (=> b!914150 m!848841))

(declare-fun m!848869 () Bool)

(assert (=> b!914150 m!848869))

(declare-fun m!848871 () Bool)

(assert (=> b!914150 m!848871))

(assert (=> b!914150 m!848865))

(declare-fun m!848873 () Bool)

(assert (=> b!914150 m!848873))

(declare-fun m!848875 () Bool)

(assert (=> b!914150 m!848875))

(declare-fun m!848877 () Bool)

(assert (=> b!914150 m!848877))

(assert (=> b!914150 m!848869))

(declare-fun m!848879 () Bool)

(assert (=> b!914150 m!848879))

(declare-fun m!848881 () Bool)

(assert (=> b!914150 m!848881))

(declare-fun m!848883 () Bool)

(assert (=> b!914150 m!848883))

(declare-fun m!848885 () Bool)

(assert (=> b!914150 m!848885))

(assert (=> b!914150 m!848883))

(declare-fun m!848887 () Bool)

(assert (=> b!914150 m!848887))

(assert (=> b!914150 m!848879))

(declare-fun m!848889 () Bool)

(assert (=> b!914150 m!848889))

(declare-fun m!848891 () Bool)

(assert (=> b!914150 m!848891))

(declare-fun m!848893 () Bool)

(assert (=> b!914150 m!848893))

(declare-fun m!848895 () Bool)

(assert (=> b!914150 m!848895))

(assert (=> d!112641 m!848771))

(declare-fun m!848897 () Bool)

(assert (=> b!914161 m!848897))

(declare-fun m!848899 () Bool)

(assert (=> b!914161 m!848899))

(declare-fun m!848901 () Bool)

(assert (=> b!914161 m!848901))

(assert (=> b!914161 m!848841))

(assert (=> b!914161 m!848841))

(declare-fun m!848903 () Bool)

(assert (=> b!914161 m!848903))

(assert (=> b!914161 m!848897))

(assert (=> b!914161 m!848899))

(declare-fun m!848905 () Bool)

(assert (=> bm!40457 m!848905))

(assert (=> bm!40455 m!848895))

(assert (=> b!914146 m!848841))

(assert (=> b!914146 m!848841))

(assert (=> b!914146 m!848845))

(assert (=> b!914149 m!848841))

(assert (=> b!914149 m!848841))

(assert (=> b!914149 m!848845))

(declare-fun m!848907 () Bool)

(assert (=> bm!40458 m!848907))

(declare-fun m!848909 () Bool)

(assert (=> b!914154 m!848909))

(assert (=> b!914009 d!112641))

(declare-fun d!112643 () Bool)

(assert (=> d!112643 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!914008 d!112643))

(declare-fun d!112645 () Bool)

(declare-fun res!616399 () Bool)

(declare-fun e!512837 () Bool)

(assert (=> d!112645 (=> res!616399 e!512837)))

(assert (=> d!112645 (= res!616399 (= (select (arr!26114 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112645 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512837)))

(declare-fun b!914169 () Bool)

(declare-fun e!512838 () Bool)

(assert (=> b!914169 (= e!512837 e!512838)))

(declare-fun res!616400 () Bool)

(assert (=> b!914169 (=> (not res!616400) (not e!512838))))

(assert (=> b!914169 (= res!616400 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26574 _keys!1386)))))

(declare-fun b!914170 () Bool)

(assert (=> b!914170 (= e!512838 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112645 (not res!616399)) b!914169))

(assert (= (and b!914169 res!616400) b!914170))

(assert (=> d!112645 m!848841))

(declare-fun m!848911 () Bool)

(assert (=> b!914170 m!848911))

(assert (=> b!914011 d!112645))

(declare-fun d!112647 () Bool)

(declare-fun e!512841 () Bool)

(assert (=> d!112647 e!512841))

(declare-fun c!96108 () Bool)

(assert (=> d!112647 (= c!96108 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!411183 () Unit!30890)

(declare-fun choose!1536 (array!54329 array!54331 (_ BitVec 32) (_ BitVec 32) V!30487 V!30487 (_ BitVec 64) Int) Unit!30890)

(assert (=> d!112647 (= lt!411183 (choose!1536 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112647 (validMask!0 mask!1756)))

(assert (=> d!112647 (= (lemmaKeyInListMapIsInArray!276 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!411183)))

(declare-fun b!914175 () Bool)

(assert (=> b!914175 (= e!512841 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!914176 () Bool)

(assert (=> b!914176 (= e!512841 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112647 c!96108) b!914175))

(assert (= (and d!112647 (not c!96108)) b!914176))

(declare-fun m!848913 () Bool)

(assert (=> d!112647 m!848913))

(assert (=> d!112647 m!848771))

(assert (=> b!914175 m!848777))

(assert (=> b!914011 d!112647))

(declare-fun b!914185 () Bool)

(declare-fun e!512848 () Bool)

(declare-fun e!512849 () Bool)

(assert (=> b!914185 (= e!512848 e!512849)))

(declare-fun c!96111 () Bool)

(assert (=> b!914185 (= c!96111 (validKeyInArray!0 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914186 () Bool)

(declare-fun e!512850 () Bool)

(assert (=> b!914186 (= e!512849 e!512850)))

(declare-fun lt!411192 () (_ BitVec 64))

(assert (=> b!914186 (= lt!411192 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411191 () Unit!30890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54329 (_ BitVec 64) (_ BitVec 32)) Unit!30890)

(assert (=> b!914186 (= lt!411191 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411192 #b00000000000000000000000000000000))))

(assert (=> b!914186 (arrayContainsKey!0 _keys!1386 lt!411192 #b00000000000000000000000000000000)))

(declare-fun lt!411190 () Unit!30890)

(assert (=> b!914186 (= lt!411190 lt!411191)))

(declare-fun res!616405 () Bool)

(declare-datatypes ((SeekEntryResult!8922 0))(
  ( (MissingZero!8922 (index!38059 (_ BitVec 32))) (Found!8922 (index!38060 (_ BitVec 32))) (Intermediate!8922 (undefined!9734 Bool) (index!38061 (_ BitVec 32)) (x!78087 (_ BitVec 32))) (Undefined!8922) (MissingVacant!8922 (index!38062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54329 (_ BitVec 32)) SeekEntryResult!8922)

(assert (=> b!914186 (= res!616405 (= (seekEntryOrOpen!0 (select (arr!26114 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8922 #b00000000000000000000000000000000)))))

(assert (=> b!914186 (=> (not res!616405) (not e!512850))))

(declare-fun bm!40463 () Bool)

(declare-fun call!40466 () Bool)

(assert (=> bm!40463 (= call!40466 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!914187 () Bool)

(assert (=> b!914187 (= e!512849 call!40466)))

(declare-fun d!112649 () Bool)

(declare-fun res!616406 () Bool)

(assert (=> d!112649 (=> res!616406 e!512848)))

(assert (=> d!112649 (= res!616406 (bvsge #b00000000000000000000000000000000 (size!26574 _keys!1386)))))

(assert (=> d!112649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512848)))

(declare-fun b!914188 () Bool)

(assert (=> b!914188 (= e!512850 call!40466)))

(assert (= (and d!112649 (not res!616406)) b!914185))

(assert (= (and b!914185 c!96111) b!914186))

(assert (= (and b!914185 (not c!96111)) b!914187))

(assert (= (and b!914186 res!616405) b!914188))

(assert (= (or b!914188 b!914187) bm!40463))

(assert (=> b!914185 m!848841))

(assert (=> b!914185 m!848841))

(assert (=> b!914185 m!848845))

(assert (=> b!914186 m!848841))

(declare-fun m!848915 () Bool)

(assert (=> b!914186 m!848915))

(declare-fun m!848917 () Bool)

(assert (=> b!914186 m!848917))

(assert (=> b!914186 m!848841))

(declare-fun m!848919 () Bool)

(assert (=> b!914186 m!848919))

(declare-fun m!848921 () Bool)

(assert (=> bm!40463 m!848921))

(assert (=> b!914006 d!112649))

(declare-fun d!112651 () Bool)

(assert (=> d!112651 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78400 d!112651))

(declare-fun d!112653 () Bool)

(assert (=> d!112653 (= (array_inv!20486 _values!1152) (bvsge (size!26575 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78400 d!112653))

(declare-fun d!112655 () Bool)

(assert (=> d!112655 (= (array_inv!20487 _keys!1386) (bvsge (size!26574 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78400 d!112655))

(declare-fun b!914196 () Bool)

(declare-fun e!512856 () Bool)

(assert (=> b!914196 (= e!512856 tp_is_empty!19141)))

(declare-fun b!914195 () Bool)

(declare-fun e!512855 () Bool)

(assert (=> b!914195 (= e!512855 tp_is_empty!19141)))

(declare-fun condMapEmpty!30448 () Bool)

(declare-fun mapDefault!30448 () ValueCell!9089)

(assert (=> mapNonEmpty!30439 (= condMapEmpty!30448 (= mapRest!30439 ((as const (Array (_ BitVec 32) ValueCell!9089)) mapDefault!30448)))))

(declare-fun mapRes!30448 () Bool)

(assert (=> mapNonEmpty!30439 (= tp!58446 (and e!512856 mapRes!30448))))

(declare-fun mapIsEmpty!30448 () Bool)

(assert (=> mapIsEmpty!30448 mapRes!30448))

(declare-fun mapNonEmpty!30448 () Bool)

(declare-fun tp!58462 () Bool)

(assert (=> mapNonEmpty!30448 (= mapRes!30448 (and tp!58462 e!512855))))

(declare-fun mapKey!30448 () (_ BitVec 32))

(declare-fun mapValue!30448 () ValueCell!9089)

(declare-fun mapRest!30448 () (Array (_ BitVec 32) ValueCell!9089))

(assert (=> mapNonEmpty!30448 (= mapRest!30439 (store mapRest!30448 mapKey!30448 mapValue!30448))))

(assert (= (and mapNonEmpty!30439 condMapEmpty!30448) mapIsEmpty!30448))

(assert (= (and mapNonEmpty!30439 (not condMapEmpty!30448)) mapNonEmpty!30448))

(assert (= (and mapNonEmpty!30448 ((_ is ValueCellFull!9089) mapValue!30448)) b!914195))

(assert (= (and mapNonEmpty!30439 ((_ is ValueCellFull!9089) mapDefault!30448)) b!914196))

(declare-fun m!848923 () Bool)

(assert (=> mapNonEmpty!30448 m!848923))

(declare-fun b_lambda!13327 () Bool)

(assert (= b_lambda!13325 (or (and start!78400 b_free!16723) b_lambda!13327)))

(check-sat (not bm!40457) (not bm!40463) (not b!914150) (not b_lambda!13327) (not bm!40458) (not d!112647) (not b!914087) (not b!914161) (not b_next!16723) (not b!914170) (not b!914158) (not bm!40455) (not b!914089) (not b!914186) (not bm!40439) (not b!914142) (not b!914086) tp_is_empty!19141 (not d!112639) (not b!914154) (not b!914149) (not d!112641) b_and!27315 (not bm!40454) (not b!914175) (not b!914185) (not b!914143) (not b!914146) (not b!914099) (not b!914097) (not mapNonEmpty!30448))
(check-sat b_and!27315 (not b_next!16723))

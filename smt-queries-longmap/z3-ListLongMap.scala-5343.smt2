; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71382 () Bool)

(assert start!71382)

(declare-fun b_free!13465 () Bool)

(declare-fun b_next!13465 () Bool)

(assert (=> start!71382 (= b_free!13465 (not b_next!13465))))

(declare-fun tp!47172 () Bool)

(declare-fun b_and!22433 () Bool)

(assert (=> start!71382 (= tp!47172 b_and!22433)))

(declare-fun res!564819 () Bool)

(declare-fun e!462039 () Bool)

(assert (=> start!71382 (=> (not res!564819) (not e!462039))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71382 (= res!564819 (validMask!0 mask!1312))))

(assert (=> start!71382 e!462039))

(declare-fun tp_is_empty!15175 () Bool)

(assert (=> start!71382 tp_is_empty!15175))

(declare-datatypes ((array!46489 0))(
  ( (array!46490 (arr!22284 (Array (_ BitVec 32) (_ BitVec 64))) (size!22705 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46489)

(declare-fun array_inv!17815 (array!46489) Bool)

(assert (=> start!71382 (array_inv!17815 _keys!976)))

(assert (=> start!71382 true))

(declare-datatypes ((V!25235 0))(
  ( (V!25236 (val!7635 Int)) )
))
(declare-datatypes ((ValueCell!7172 0))(
  ( (ValueCellFull!7172 (v!10068 V!25235)) (EmptyCell!7172) )
))
(declare-datatypes ((array!46491 0))(
  ( (array!46492 (arr!22285 (Array (_ BitVec 32) ValueCell!7172)) (size!22706 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46491)

(declare-fun e!462036 () Bool)

(declare-fun array_inv!17816 (array!46491) Bool)

(assert (=> start!71382 (and (array_inv!17816 _values!788) e!462036)))

(assert (=> start!71382 tp!47172))

(declare-fun zeroValueAfter!34 () V!25235)

(declare-fun minValue!754 () V!25235)

(declare-fun b!828986 () Bool)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun e!462038 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10136 0))(
  ( (tuple2!10137 (_1!5079 (_ BitVec 64)) (_2!5079 V!25235)) )
))
(declare-datatypes ((List!15922 0))(
  ( (Nil!15919) (Cons!15918 (h!17047 tuple2!10136) (t!22272 List!15922)) )
))
(declare-datatypes ((ListLongMap!8949 0))(
  ( (ListLongMap!8950 (toList!4490 List!15922)) )
))
(declare-fun lt!375727 () ListLongMap!8949)

(declare-fun getCurrentListMap!2543 (array!46489 array!46491 (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 (_ BitVec 32) Int) ListLongMap!8949)

(declare-fun +!2000 (ListLongMap!8949 tuple2!10136) ListLongMap!8949)

(assert (=> b!828986 (= e!462038 (= (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!2000 (+!2000 lt!375727 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun mapNonEmpty!24406 () Bool)

(declare-fun mapRes!24406 () Bool)

(declare-fun tp!47173 () Bool)

(declare-fun e!462041 () Bool)

(assert (=> mapNonEmpty!24406 (= mapRes!24406 (and tp!47173 e!462041))))

(declare-fun mapValue!24406 () ValueCell!7172)

(declare-fun mapKey!24406 () (_ BitVec 32))

(declare-fun mapRest!24406 () (Array (_ BitVec 32) ValueCell!7172))

(assert (=> mapNonEmpty!24406 (= (arr!22285 _values!788) (store mapRest!24406 mapKey!24406 mapValue!24406))))

(declare-fun b!828987 () Bool)

(assert (=> b!828987 (= e!462039 (not e!462038))))

(declare-fun res!564820 () Bool)

(assert (=> b!828987 (=> res!564820 e!462038)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828987 (= res!564820 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun e!462040 () Bool)

(assert (=> b!828987 e!462040))

(declare-fun res!564824 () Bool)

(assert (=> b!828987 (=> (not res!564824) (not e!462040))))

(declare-fun lt!375728 () ListLongMap!8949)

(assert (=> b!828987 (= res!564824 (= lt!375727 lt!375728))))

(declare-fun zeroValueBefore!34 () V!25235)

(declare-datatypes ((Unit!28353 0))(
  ( (Unit!28354) )
))
(declare-fun lt!375729 () Unit!28353)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!589 (array!46489 array!46491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 V!25235 V!25235 (_ BitVec 32) Int) Unit!28353)

(assert (=> b!828987 (= lt!375729 (lemmaNoChangeToArrayThenSameMapNoExtras!589 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2519 (array!46489 array!46491 (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 (_ BitVec 32) Int) ListLongMap!8949)

(assert (=> b!828987 (= lt!375728 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828987 (= lt!375727 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24406 () Bool)

(assert (=> mapIsEmpty!24406 mapRes!24406))

(declare-fun b!828988 () Bool)

(declare-fun res!564822 () Bool)

(assert (=> b!828988 (=> (not res!564822) (not e!462039))))

(declare-datatypes ((List!15923 0))(
  ( (Nil!15920) (Cons!15919 (h!17048 (_ BitVec 64)) (t!22273 List!15923)) )
))
(declare-fun arrayNoDuplicates!0 (array!46489 (_ BitVec 32) List!15923) Bool)

(assert (=> b!828988 (= res!564822 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15920))))

(declare-fun b!828989 () Bool)

(declare-fun res!564821 () Bool)

(assert (=> b!828989 (=> (not res!564821) (not e!462039))))

(assert (=> b!828989 (= res!564821 (and (= (size!22706 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22705 _keys!976) (size!22706 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828990 () Bool)

(assert (=> b!828990 (= e!462041 tp_is_empty!15175)))

(declare-fun b!828991 () Bool)

(declare-fun e!462035 () Bool)

(assert (=> b!828991 (= e!462035 tp_is_empty!15175)))

(declare-fun b!828992 () Bool)

(assert (=> b!828992 (= e!462036 (and e!462035 mapRes!24406))))

(declare-fun condMapEmpty!24406 () Bool)

(declare-fun mapDefault!24406 () ValueCell!7172)

(assert (=> b!828992 (= condMapEmpty!24406 (= (arr!22285 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7172)) mapDefault!24406)))))

(declare-fun b!828993 () Bool)

(declare-fun e!462042 () Bool)

(assert (=> b!828993 (= e!462040 e!462042)))

(declare-fun res!564818 () Bool)

(assert (=> b!828993 (=> res!564818 e!462042)))

(assert (=> b!828993 (= res!564818 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828994 () Bool)

(assert (=> b!828994 (= e!462042 (= (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!2000 lt!375727 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!828995 () Bool)

(declare-fun res!564823 () Bool)

(assert (=> b!828995 (=> (not res!564823) (not e!462039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46489 (_ BitVec 32)) Bool)

(assert (=> b!828995 (= res!564823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71382 res!564819) b!828989))

(assert (= (and b!828989 res!564821) b!828995))

(assert (= (and b!828995 res!564823) b!828988))

(assert (= (and b!828988 res!564822) b!828987))

(assert (= (and b!828987 res!564824) b!828993))

(assert (= (and b!828993 (not res!564818)) b!828994))

(assert (= (and b!828987 (not res!564820)) b!828986))

(assert (= (and b!828992 condMapEmpty!24406) mapIsEmpty!24406))

(assert (= (and b!828992 (not condMapEmpty!24406)) mapNonEmpty!24406))

(get-info :version)

(assert (= (and mapNonEmpty!24406 ((_ is ValueCellFull!7172) mapValue!24406)) b!828990))

(assert (= (and b!828992 ((_ is ValueCellFull!7172) mapDefault!24406)) b!828991))

(assert (= start!71382 b!828992))

(declare-fun m!771455 () Bool)

(assert (=> b!828986 m!771455))

(declare-fun m!771457 () Bool)

(assert (=> b!828986 m!771457))

(assert (=> b!828986 m!771457))

(declare-fun m!771459 () Bool)

(assert (=> b!828986 m!771459))

(declare-fun m!771461 () Bool)

(assert (=> mapNonEmpty!24406 m!771461))

(declare-fun m!771463 () Bool)

(assert (=> b!828988 m!771463))

(declare-fun m!771465 () Bool)

(assert (=> b!828995 m!771465))

(declare-fun m!771467 () Bool)

(assert (=> b!828994 m!771467))

(declare-fun m!771469 () Bool)

(assert (=> b!828994 m!771469))

(declare-fun m!771471 () Bool)

(assert (=> start!71382 m!771471))

(declare-fun m!771473 () Bool)

(assert (=> start!71382 m!771473))

(declare-fun m!771475 () Bool)

(assert (=> start!71382 m!771475))

(declare-fun m!771477 () Bool)

(assert (=> b!828987 m!771477))

(declare-fun m!771479 () Bool)

(assert (=> b!828987 m!771479))

(declare-fun m!771481 () Bool)

(assert (=> b!828987 m!771481))

(check-sat b_and!22433 (not b_next!13465) (not b!828995) (not b!828994) (not mapNonEmpty!24406) (not b!828987) tp_is_empty!15175 (not b!828986) (not start!71382) (not b!828988))
(check-sat b_and!22433 (not b_next!13465))
(get-model)

(declare-fun b!829098 () Bool)

(declare-fun e!462122 () ListLongMap!8949)

(declare-fun call!36100 () ListLongMap!8949)

(assert (=> b!829098 (= e!462122 call!36100)))

(declare-fun b!829099 () Bool)

(declare-fun e!462117 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829099 (= e!462117 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829100 () Bool)

(declare-fun e!462126 () Bool)

(declare-fun lt!375807 () ListLongMap!8949)

(declare-fun apply!369 (ListLongMap!8949 (_ BitVec 64)) V!25235)

(assert (=> b!829100 (= e!462126 (= (apply!369 lt!375807 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!36094 () Bool)

(declare-fun call!36099 () ListLongMap!8949)

(assert (=> bm!36094 (= call!36099 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829101 () Bool)

(declare-fun call!36097 () ListLongMap!8949)

(assert (=> b!829101 (= e!462122 call!36097)))

(declare-fun b!829102 () Bool)

(declare-fun e!462121 () Unit!28353)

(declare-fun lt!375802 () Unit!28353)

(assert (=> b!829102 (= e!462121 lt!375802)))

(declare-fun lt!375808 () ListLongMap!8949)

(assert (=> b!829102 (= lt!375808 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375797 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375800 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375800 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375796 () Unit!28353)

(declare-fun addStillContains!320 (ListLongMap!8949 (_ BitVec 64) V!25235 (_ BitVec 64)) Unit!28353)

(assert (=> b!829102 (= lt!375796 (addStillContains!320 lt!375808 lt!375797 zeroValueBefore!34 lt!375800))))

(declare-fun contains!4178 (ListLongMap!8949 (_ BitVec 64)) Bool)

(assert (=> b!829102 (contains!4178 (+!2000 lt!375808 (tuple2!10137 lt!375797 zeroValueBefore!34)) lt!375800)))

(declare-fun lt!375794 () Unit!28353)

(assert (=> b!829102 (= lt!375794 lt!375796)))

(declare-fun lt!375805 () ListLongMap!8949)

(assert (=> b!829102 (= lt!375805 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375792 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375792 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375810 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375810 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375803 () Unit!28353)

(declare-fun addApplyDifferent!320 (ListLongMap!8949 (_ BitVec 64) V!25235 (_ BitVec 64)) Unit!28353)

(assert (=> b!829102 (= lt!375803 (addApplyDifferent!320 lt!375805 lt!375792 minValue!754 lt!375810))))

(assert (=> b!829102 (= (apply!369 (+!2000 lt!375805 (tuple2!10137 lt!375792 minValue!754)) lt!375810) (apply!369 lt!375805 lt!375810))))

(declare-fun lt!375812 () Unit!28353)

(assert (=> b!829102 (= lt!375812 lt!375803)))

(declare-fun lt!375798 () ListLongMap!8949)

(assert (=> b!829102 (= lt!375798 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375799 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375806 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375806 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375793 () Unit!28353)

(assert (=> b!829102 (= lt!375793 (addApplyDifferent!320 lt!375798 lt!375799 zeroValueBefore!34 lt!375806))))

(assert (=> b!829102 (= (apply!369 (+!2000 lt!375798 (tuple2!10137 lt!375799 zeroValueBefore!34)) lt!375806) (apply!369 lt!375798 lt!375806))))

(declare-fun lt!375804 () Unit!28353)

(assert (=> b!829102 (= lt!375804 lt!375793)))

(declare-fun lt!375795 () ListLongMap!8949)

(assert (=> b!829102 (= lt!375795 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375809 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375813 () (_ BitVec 64))

(assert (=> b!829102 (= lt!375813 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829102 (= lt!375802 (addApplyDifferent!320 lt!375795 lt!375809 minValue!754 lt!375813))))

(assert (=> b!829102 (= (apply!369 (+!2000 lt!375795 (tuple2!10137 lt!375809 minValue!754)) lt!375813) (apply!369 lt!375795 lt!375813))))

(declare-fun d!105053 () Bool)

(declare-fun e!462129 () Bool)

(assert (=> d!105053 e!462129))

(declare-fun res!564890 () Bool)

(assert (=> d!105053 (=> (not res!564890) (not e!462129))))

(assert (=> d!105053 (= res!564890 (or (bvsge #b00000000000000000000000000000000 (size!22705 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))))

(declare-fun lt!375801 () ListLongMap!8949)

(assert (=> d!105053 (= lt!375807 lt!375801)))

(declare-fun lt!375811 () Unit!28353)

(assert (=> d!105053 (= lt!375811 e!462121)))

(declare-fun c!89676 () Bool)

(assert (=> d!105053 (= c!89676 e!462117)))

(declare-fun res!564893 () Bool)

(assert (=> d!105053 (=> (not res!564893) (not e!462117))))

(assert (=> d!105053 (= res!564893 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun e!462128 () ListLongMap!8949)

(assert (=> d!105053 (= lt!375801 e!462128)))

(declare-fun c!89671 () Bool)

(assert (=> d!105053 (= c!89671 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105053 (validMask!0 mask!1312)))

(assert (=> d!105053 (= (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375807)))

(declare-fun bm!36095 () Bool)

(declare-fun call!36103 () ListLongMap!8949)

(assert (=> bm!36095 (= call!36097 call!36103)))

(declare-fun b!829103 () Bool)

(declare-fun e!462124 () Bool)

(assert (=> b!829103 (= e!462124 (= (apply!369 lt!375807 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829104 () Bool)

(declare-fun res!564889 () Bool)

(assert (=> b!829104 (=> (not res!564889) (not e!462129))))

(declare-fun e!462119 () Bool)

(assert (=> b!829104 (= res!564889 e!462119)))

(declare-fun res!564891 () Bool)

(assert (=> b!829104 (=> res!564891 e!462119)))

(declare-fun e!462123 () Bool)

(assert (=> b!829104 (= res!564891 (not e!462123))))

(declare-fun res!564888 () Bool)

(assert (=> b!829104 (=> (not res!564888) (not e!462123))))

(assert (=> b!829104 (= res!564888 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun b!829105 () Bool)

(declare-fun e!462125 () Bool)

(assert (=> b!829105 (= e!462125 e!462126)))

(declare-fun res!564886 () Bool)

(declare-fun call!36098 () Bool)

(assert (=> b!829105 (= res!564886 call!36098)))

(assert (=> b!829105 (=> (not res!564886) (not e!462126))))

(declare-fun b!829106 () Bool)

(assert (=> b!829106 (= e!462128 (+!2000 call!36103 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829107 () Bool)

(declare-fun c!89673 () Bool)

(assert (=> b!829107 (= c!89673 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462118 () ListLongMap!8949)

(assert (=> b!829107 (= e!462118 e!462122)))

(declare-fun bm!36096 () Bool)

(declare-fun call!36102 () ListLongMap!8949)

(assert (=> bm!36096 (= call!36100 call!36102)))

(declare-fun b!829108 () Bool)

(assert (=> b!829108 (= e!462123 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36097 () Bool)

(assert (=> bm!36097 (= call!36098 (contains!4178 lt!375807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829109 () Bool)

(declare-fun res!564887 () Bool)

(assert (=> b!829109 (=> (not res!564887) (not e!462129))))

(assert (=> b!829109 (= res!564887 e!462125)))

(declare-fun c!89675 () Bool)

(assert (=> b!829109 (= c!89675 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829110 () Bool)

(declare-fun e!462127 () Bool)

(assert (=> b!829110 (= e!462129 e!462127)))

(declare-fun c!89674 () Bool)

(assert (=> b!829110 (= c!89674 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829111 () Bool)

(declare-fun e!462120 () Bool)

(declare-fun get!11810 (ValueCell!7172 V!25235) V!25235)

(declare-fun dynLambda!983 (Int (_ BitVec 64)) V!25235)

(assert (=> b!829111 (= e!462120 (= (apply!369 lt!375807 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)) (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829111 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22706 _values!788)))))

(assert (=> b!829111 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun bm!36098 () Bool)

(declare-fun call!36101 () Bool)

(assert (=> bm!36098 (= call!36101 (contains!4178 lt!375807 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!89672 () Bool)

(declare-fun bm!36099 () Bool)

(assert (=> bm!36099 (= call!36103 (+!2000 (ite c!89671 call!36099 (ite c!89672 call!36102 call!36100)) (ite (or c!89671 c!89672) (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829112 () Bool)

(assert (=> b!829112 (= e!462119 e!462120)))

(declare-fun res!564892 () Bool)

(assert (=> b!829112 (=> (not res!564892) (not e!462120))))

(assert (=> b!829112 (= res!564892 (contains!4178 lt!375807 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun bm!36100 () Bool)

(assert (=> bm!36100 (= call!36102 call!36099)))

(declare-fun b!829113 () Bool)

(declare-fun Unit!28359 () Unit!28353)

(assert (=> b!829113 (= e!462121 Unit!28359)))

(declare-fun b!829114 () Bool)

(assert (=> b!829114 (= e!462128 e!462118)))

(assert (=> b!829114 (= c!89672 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829115 () Bool)

(assert (=> b!829115 (= e!462118 call!36097)))

(declare-fun b!829116 () Bool)

(assert (=> b!829116 (= e!462125 (not call!36098))))

(declare-fun b!829117 () Bool)

(assert (=> b!829117 (= e!462127 e!462124)))

(declare-fun res!564885 () Bool)

(assert (=> b!829117 (= res!564885 call!36101)))

(assert (=> b!829117 (=> (not res!564885) (not e!462124))))

(declare-fun b!829118 () Bool)

(assert (=> b!829118 (= e!462127 (not call!36101))))

(assert (= (and d!105053 c!89671) b!829106))

(assert (= (and d!105053 (not c!89671)) b!829114))

(assert (= (and b!829114 c!89672) b!829115))

(assert (= (and b!829114 (not c!89672)) b!829107))

(assert (= (and b!829107 c!89673) b!829101))

(assert (= (and b!829107 (not c!89673)) b!829098))

(assert (= (or b!829101 b!829098) bm!36096))

(assert (= (or b!829115 bm!36096) bm!36100))

(assert (= (or b!829115 b!829101) bm!36095))

(assert (= (or b!829106 bm!36100) bm!36094))

(assert (= (or b!829106 bm!36095) bm!36099))

(assert (= (and d!105053 res!564893) b!829099))

(assert (= (and d!105053 c!89676) b!829102))

(assert (= (and d!105053 (not c!89676)) b!829113))

(assert (= (and d!105053 res!564890) b!829104))

(assert (= (and b!829104 res!564888) b!829108))

(assert (= (and b!829104 (not res!564891)) b!829112))

(assert (= (and b!829112 res!564892) b!829111))

(assert (= (and b!829104 res!564889) b!829109))

(assert (= (and b!829109 c!89675) b!829105))

(assert (= (and b!829109 (not c!89675)) b!829116))

(assert (= (and b!829105 res!564886) b!829100))

(assert (= (or b!829105 b!829116) bm!36097))

(assert (= (and b!829109 res!564887) b!829110))

(assert (= (and b!829110 c!89674) b!829117))

(assert (= (and b!829110 (not c!89674)) b!829118))

(assert (= (and b!829117 res!564885) b!829103))

(assert (= (or b!829117 b!829118) bm!36098))

(declare-fun b_lambda!11257 () Bool)

(assert (=> (not b_lambda!11257) (not b!829111)))

(declare-fun t!22279 () Bool)

(declare-fun tb!4211 () Bool)

(assert (=> (and start!71382 (= defaultEntry!796 defaultEntry!796) t!22279) tb!4211))

(declare-fun result!7989 () Bool)

(assert (=> tb!4211 (= result!7989 tp_is_empty!15175)))

(assert (=> b!829111 t!22279))

(declare-fun b_and!22439 () Bool)

(assert (= b_and!22433 (and (=> t!22279 result!7989) b_and!22439)))

(declare-fun m!771539 () Bool)

(assert (=> b!829100 m!771539))

(declare-fun m!771541 () Bool)

(assert (=> b!829099 m!771541))

(assert (=> b!829099 m!771541))

(declare-fun m!771543 () Bool)

(assert (=> b!829099 m!771543))

(declare-fun m!771545 () Bool)

(assert (=> b!829102 m!771545))

(declare-fun m!771547 () Bool)

(assert (=> b!829102 m!771547))

(assert (=> b!829102 m!771545))

(declare-fun m!771549 () Bool)

(assert (=> b!829102 m!771549))

(declare-fun m!771551 () Bool)

(assert (=> b!829102 m!771551))

(declare-fun m!771553 () Bool)

(assert (=> b!829102 m!771553))

(assert (=> b!829102 m!771541))

(declare-fun m!771555 () Bool)

(assert (=> b!829102 m!771555))

(declare-fun m!771557 () Bool)

(assert (=> b!829102 m!771557))

(declare-fun m!771559 () Bool)

(assert (=> b!829102 m!771559))

(declare-fun m!771561 () Bool)

(assert (=> b!829102 m!771561))

(assert (=> b!829102 m!771559))

(assert (=> b!829102 m!771481))

(declare-fun m!771563 () Bool)

(assert (=> b!829102 m!771563))

(declare-fun m!771565 () Bool)

(assert (=> b!829102 m!771565))

(declare-fun m!771567 () Bool)

(assert (=> b!829102 m!771567))

(declare-fun m!771569 () Bool)

(assert (=> b!829102 m!771569))

(assert (=> b!829102 m!771553))

(declare-fun m!771571 () Bool)

(assert (=> b!829102 m!771571))

(assert (=> b!829102 m!771555))

(declare-fun m!771573 () Bool)

(assert (=> b!829102 m!771573))

(assert (=> b!829108 m!771541))

(assert (=> b!829108 m!771541))

(assert (=> b!829108 m!771543))

(declare-fun m!771575 () Bool)

(assert (=> bm!36097 m!771575))

(assert (=> b!829111 m!771541))

(declare-fun m!771577 () Bool)

(assert (=> b!829111 m!771577))

(assert (=> b!829111 m!771541))

(declare-fun m!771579 () Bool)

(assert (=> b!829111 m!771579))

(declare-fun m!771581 () Bool)

(assert (=> b!829111 m!771581))

(declare-fun m!771583 () Bool)

(assert (=> b!829111 m!771583))

(assert (=> b!829111 m!771581))

(assert (=> b!829111 m!771579))

(assert (=> d!105053 m!771471))

(declare-fun m!771585 () Bool)

(assert (=> bm!36099 m!771585))

(declare-fun m!771587 () Bool)

(assert (=> b!829103 m!771587))

(assert (=> bm!36094 m!771481))

(assert (=> b!829112 m!771541))

(assert (=> b!829112 m!771541))

(declare-fun m!771589 () Bool)

(assert (=> b!829112 m!771589))

(declare-fun m!771591 () Bool)

(assert (=> bm!36098 m!771591))

(declare-fun m!771593 () Bool)

(assert (=> b!829106 m!771593))

(assert (=> b!828994 d!105053))

(declare-fun d!105055 () Bool)

(declare-fun e!462132 () Bool)

(assert (=> d!105055 e!462132))

(declare-fun res!564899 () Bool)

(assert (=> d!105055 (=> (not res!564899) (not e!462132))))

(declare-fun lt!375822 () ListLongMap!8949)

(assert (=> d!105055 (= res!564899 (contains!4178 lt!375822 (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!375825 () List!15922)

(assert (=> d!105055 (= lt!375822 (ListLongMap!8950 lt!375825))))

(declare-fun lt!375824 () Unit!28353)

(declare-fun lt!375823 () Unit!28353)

(assert (=> d!105055 (= lt!375824 lt!375823)))

(declare-datatypes ((Option!416 0))(
  ( (Some!415 (v!10071 V!25235)) (None!414) )
))
(declare-fun getValueByKey!410 (List!15922 (_ BitVec 64)) Option!416)

(assert (=> d!105055 (= (getValueByKey!410 lt!375825 (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!415 (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!227 (List!15922 (_ BitVec 64) V!25235) Unit!28353)

(assert (=> d!105055 (= lt!375823 (lemmaContainsTupThenGetReturnValue!227 lt!375825 (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!266 (List!15922 (_ BitVec 64) V!25235) List!15922)

(assert (=> d!105055 (= lt!375825 (insertStrictlySorted!266 (toList!4490 lt!375727) (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105055 (= (+!2000 lt!375727 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!375822)))

(declare-fun b!829125 () Bool)

(declare-fun res!564898 () Bool)

(assert (=> b!829125 (=> (not res!564898) (not e!462132))))

(assert (=> b!829125 (= res!564898 (= (getValueByKey!410 (toList!4490 lt!375822) (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!415 (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829126 () Bool)

(declare-fun contains!4179 (List!15922 tuple2!10136) Bool)

(assert (=> b!829126 (= e!462132 (contains!4179 (toList!4490 lt!375822) (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105055 res!564899) b!829125))

(assert (= (and b!829125 res!564898) b!829126))

(declare-fun m!771595 () Bool)

(assert (=> d!105055 m!771595))

(declare-fun m!771597 () Bool)

(assert (=> d!105055 m!771597))

(declare-fun m!771599 () Bool)

(assert (=> d!105055 m!771599))

(declare-fun m!771601 () Bool)

(assert (=> d!105055 m!771601))

(declare-fun m!771603 () Bool)

(assert (=> b!829125 m!771603))

(declare-fun m!771605 () Bool)

(assert (=> b!829126 m!771605))

(assert (=> b!828994 d!105055))

(declare-fun b!829137 () Bool)

(declare-fun e!462144 () Bool)

(declare-fun contains!4180 (List!15923 (_ BitVec 64)) Bool)

(assert (=> b!829137 (= e!462144 (contains!4180 Nil!15920 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36103 () Bool)

(declare-fun call!36106 () Bool)

(declare-fun c!89679 () Bool)

(assert (=> bm!36103 (= call!36106 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89679 (Cons!15919 (select (arr!22284 _keys!976) #b00000000000000000000000000000000) Nil!15920) Nil!15920)))))

(declare-fun b!829138 () Bool)

(declare-fun e!462142 () Bool)

(assert (=> b!829138 (= e!462142 call!36106)))

(declare-fun b!829139 () Bool)

(declare-fun e!462141 () Bool)

(declare-fun e!462143 () Bool)

(assert (=> b!829139 (= e!462141 e!462143)))

(declare-fun res!564906 () Bool)

(assert (=> b!829139 (=> (not res!564906) (not e!462143))))

(assert (=> b!829139 (= res!564906 (not e!462144))))

(declare-fun res!564908 () Bool)

(assert (=> b!829139 (=> (not res!564908) (not e!462144))))

(assert (=> b!829139 (= res!564908 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105057 () Bool)

(declare-fun res!564907 () Bool)

(assert (=> d!105057 (=> res!564907 e!462141)))

(assert (=> d!105057 (= res!564907 (bvsge #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(assert (=> d!105057 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15920) e!462141)))

(declare-fun b!829140 () Bool)

(assert (=> b!829140 (= e!462142 call!36106)))

(declare-fun b!829141 () Bool)

(assert (=> b!829141 (= e!462143 e!462142)))

(assert (=> b!829141 (= c!89679 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105057 (not res!564907)) b!829139))

(assert (= (and b!829139 res!564908) b!829137))

(assert (= (and b!829139 res!564906) b!829141))

(assert (= (and b!829141 c!89679) b!829138))

(assert (= (and b!829141 (not c!89679)) b!829140))

(assert (= (or b!829138 b!829140) bm!36103))

(assert (=> b!829137 m!771541))

(assert (=> b!829137 m!771541))

(declare-fun m!771607 () Bool)

(assert (=> b!829137 m!771607))

(assert (=> bm!36103 m!771541))

(declare-fun m!771609 () Bool)

(assert (=> bm!36103 m!771609))

(assert (=> b!829139 m!771541))

(assert (=> b!829139 m!771541))

(assert (=> b!829139 m!771543))

(assert (=> b!829141 m!771541))

(assert (=> b!829141 m!771541))

(assert (=> b!829141 m!771543))

(assert (=> b!828988 d!105057))

(declare-fun d!105059 () Bool)

(assert (=> d!105059 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71382 d!105059))

(declare-fun d!105061 () Bool)

(assert (=> d!105061 (= (array_inv!17815 _keys!976) (bvsge (size!22705 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71382 d!105061))

(declare-fun d!105063 () Bool)

(assert (=> d!105063 (= (array_inv!17816 _values!788) (bvsge (size!22706 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71382 d!105063))

(declare-fun b!829150 () Bool)

(declare-fun e!462152 () Bool)

(declare-fun call!36109 () Bool)

(assert (=> b!829150 (= e!462152 call!36109)))

(declare-fun b!829151 () Bool)

(declare-fun e!462153 () Bool)

(assert (=> b!829151 (= e!462152 e!462153)))

(declare-fun lt!375832 () (_ BitVec 64))

(assert (=> b!829151 (= lt!375832 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375834 () Unit!28353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46489 (_ BitVec 64) (_ BitVec 32)) Unit!28353)

(assert (=> b!829151 (= lt!375834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375832 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829151 (arrayContainsKey!0 _keys!976 lt!375832 #b00000000000000000000000000000000)))

(declare-fun lt!375833 () Unit!28353)

(assert (=> b!829151 (= lt!375833 lt!375834)))

(declare-fun res!564913 () Bool)

(declare-datatypes ((SeekEntryResult!8737 0))(
  ( (MissingZero!8737 (index!37319 (_ BitVec 32))) (Found!8737 (index!37320 (_ BitVec 32))) (Intermediate!8737 (undefined!9549 Bool) (index!37321 (_ BitVec 32)) (x!70024 (_ BitVec 32))) (Undefined!8737) (MissingVacant!8737 (index!37322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46489 (_ BitVec 32)) SeekEntryResult!8737)

(assert (=> b!829151 (= res!564913 (= (seekEntryOrOpen!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8737 #b00000000000000000000000000000000)))))

(assert (=> b!829151 (=> (not res!564913) (not e!462153))))

(declare-fun b!829152 () Bool)

(assert (=> b!829152 (= e!462153 call!36109)))

(declare-fun d!105065 () Bool)

(declare-fun res!564914 () Bool)

(declare-fun e!462151 () Bool)

(assert (=> d!105065 (=> res!564914 e!462151)))

(assert (=> d!105065 (= res!564914 (bvsge #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(assert (=> d!105065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462151)))

(declare-fun b!829153 () Bool)

(assert (=> b!829153 (= e!462151 e!462152)))

(declare-fun c!89682 () Bool)

(assert (=> b!829153 (= c!89682 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36106 () Bool)

(assert (=> bm!36106 (= call!36109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!105065 (not res!564914)) b!829153))

(assert (= (and b!829153 c!89682) b!829151))

(assert (= (and b!829153 (not c!89682)) b!829150))

(assert (= (and b!829151 res!564913) b!829152))

(assert (= (or b!829152 b!829150) bm!36106))

(assert (=> b!829151 m!771541))

(declare-fun m!771611 () Bool)

(assert (=> b!829151 m!771611))

(declare-fun m!771613 () Bool)

(assert (=> b!829151 m!771613))

(assert (=> b!829151 m!771541))

(declare-fun m!771615 () Bool)

(assert (=> b!829151 m!771615))

(assert (=> b!829153 m!771541))

(assert (=> b!829153 m!771541))

(assert (=> b!829153 m!771543))

(declare-fun m!771617 () Bool)

(assert (=> bm!36106 m!771617))

(assert (=> b!828995 d!105065))

(declare-fun b!829154 () Bool)

(declare-fun e!462159 () ListLongMap!8949)

(declare-fun call!36113 () ListLongMap!8949)

(assert (=> b!829154 (= e!462159 call!36113)))

(declare-fun b!829155 () Bool)

(declare-fun e!462154 () Bool)

(assert (=> b!829155 (= e!462154 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829156 () Bool)

(declare-fun e!462163 () Bool)

(declare-fun lt!375850 () ListLongMap!8949)

(assert (=> b!829156 (= e!462163 (= (apply!369 lt!375850 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!36107 () Bool)

(declare-fun call!36112 () ListLongMap!8949)

(assert (=> bm!36107 (= call!36112 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829157 () Bool)

(declare-fun call!36110 () ListLongMap!8949)

(assert (=> b!829157 (= e!462159 call!36110)))

(declare-fun b!829158 () Bool)

(declare-fun e!462158 () Unit!28353)

(declare-fun lt!375845 () Unit!28353)

(assert (=> b!829158 (= e!462158 lt!375845)))

(declare-fun lt!375851 () ListLongMap!8949)

(assert (=> b!829158 (= lt!375851 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375840 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375843 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375843 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375839 () Unit!28353)

(assert (=> b!829158 (= lt!375839 (addStillContains!320 lt!375851 lt!375840 zeroValueAfter!34 lt!375843))))

(assert (=> b!829158 (contains!4178 (+!2000 lt!375851 (tuple2!10137 lt!375840 zeroValueAfter!34)) lt!375843)))

(declare-fun lt!375837 () Unit!28353)

(assert (=> b!829158 (= lt!375837 lt!375839)))

(declare-fun lt!375848 () ListLongMap!8949)

(assert (=> b!829158 (= lt!375848 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375835 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375853 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375853 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375846 () Unit!28353)

(assert (=> b!829158 (= lt!375846 (addApplyDifferent!320 lt!375848 lt!375835 minValue!754 lt!375853))))

(assert (=> b!829158 (= (apply!369 (+!2000 lt!375848 (tuple2!10137 lt!375835 minValue!754)) lt!375853) (apply!369 lt!375848 lt!375853))))

(declare-fun lt!375855 () Unit!28353)

(assert (=> b!829158 (= lt!375855 lt!375846)))

(declare-fun lt!375841 () ListLongMap!8949)

(assert (=> b!829158 (= lt!375841 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375842 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375849 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375849 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375836 () Unit!28353)

(assert (=> b!829158 (= lt!375836 (addApplyDifferent!320 lt!375841 lt!375842 zeroValueAfter!34 lt!375849))))

(assert (=> b!829158 (= (apply!369 (+!2000 lt!375841 (tuple2!10137 lt!375842 zeroValueAfter!34)) lt!375849) (apply!369 lt!375841 lt!375849))))

(declare-fun lt!375847 () Unit!28353)

(assert (=> b!829158 (= lt!375847 lt!375836)))

(declare-fun lt!375838 () ListLongMap!8949)

(assert (=> b!829158 (= lt!375838 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375852 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375856 () (_ BitVec 64))

(assert (=> b!829158 (= lt!375856 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829158 (= lt!375845 (addApplyDifferent!320 lt!375838 lt!375852 minValue!754 lt!375856))))

(assert (=> b!829158 (= (apply!369 (+!2000 lt!375838 (tuple2!10137 lt!375852 minValue!754)) lt!375856) (apply!369 lt!375838 lt!375856))))

(declare-fun d!105067 () Bool)

(declare-fun e!462166 () Bool)

(assert (=> d!105067 e!462166))

(declare-fun res!564920 () Bool)

(assert (=> d!105067 (=> (not res!564920) (not e!462166))))

(assert (=> d!105067 (= res!564920 (or (bvsge #b00000000000000000000000000000000 (size!22705 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))))

(declare-fun lt!375844 () ListLongMap!8949)

(assert (=> d!105067 (= lt!375850 lt!375844)))

(declare-fun lt!375854 () Unit!28353)

(assert (=> d!105067 (= lt!375854 e!462158)))

(declare-fun c!89688 () Bool)

(assert (=> d!105067 (= c!89688 e!462154)))

(declare-fun res!564923 () Bool)

(assert (=> d!105067 (=> (not res!564923) (not e!462154))))

(assert (=> d!105067 (= res!564923 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun e!462165 () ListLongMap!8949)

(assert (=> d!105067 (= lt!375844 e!462165)))

(declare-fun c!89683 () Bool)

(assert (=> d!105067 (= c!89683 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105067 (validMask!0 mask!1312)))

(assert (=> d!105067 (= (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375850)))

(declare-fun bm!36108 () Bool)

(declare-fun call!36116 () ListLongMap!8949)

(assert (=> bm!36108 (= call!36110 call!36116)))

(declare-fun b!829159 () Bool)

(declare-fun e!462161 () Bool)

(assert (=> b!829159 (= e!462161 (= (apply!369 lt!375850 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829160 () Bool)

(declare-fun res!564919 () Bool)

(assert (=> b!829160 (=> (not res!564919) (not e!462166))))

(declare-fun e!462156 () Bool)

(assert (=> b!829160 (= res!564919 e!462156)))

(declare-fun res!564921 () Bool)

(assert (=> b!829160 (=> res!564921 e!462156)))

(declare-fun e!462160 () Bool)

(assert (=> b!829160 (= res!564921 (not e!462160))))

(declare-fun res!564918 () Bool)

(assert (=> b!829160 (=> (not res!564918) (not e!462160))))

(assert (=> b!829160 (= res!564918 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun b!829161 () Bool)

(declare-fun e!462162 () Bool)

(assert (=> b!829161 (= e!462162 e!462163)))

(declare-fun res!564916 () Bool)

(declare-fun call!36111 () Bool)

(assert (=> b!829161 (= res!564916 call!36111)))

(assert (=> b!829161 (=> (not res!564916) (not e!462163))))

(declare-fun b!829162 () Bool)

(assert (=> b!829162 (= e!462165 (+!2000 call!36116 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829163 () Bool)

(declare-fun c!89685 () Bool)

(assert (=> b!829163 (= c!89685 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462155 () ListLongMap!8949)

(assert (=> b!829163 (= e!462155 e!462159)))

(declare-fun bm!36109 () Bool)

(declare-fun call!36115 () ListLongMap!8949)

(assert (=> bm!36109 (= call!36113 call!36115)))

(declare-fun b!829164 () Bool)

(assert (=> b!829164 (= e!462160 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36110 () Bool)

(assert (=> bm!36110 (= call!36111 (contains!4178 lt!375850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829165 () Bool)

(declare-fun res!564917 () Bool)

(assert (=> b!829165 (=> (not res!564917) (not e!462166))))

(assert (=> b!829165 (= res!564917 e!462162)))

(declare-fun c!89687 () Bool)

(assert (=> b!829165 (= c!89687 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829166 () Bool)

(declare-fun e!462164 () Bool)

(assert (=> b!829166 (= e!462166 e!462164)))

(declare-fun c!89686 () Bool)

(assert (=> b!829166 (= c!89686 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!462157 () Bool)

(declare-fun b!829167 () Bool)

(assert (=> b!829167 (= e!462157 (= (apply!369 lt!375850 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)) (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829167 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22706 _values!788)))))

(assert (=> b!829167 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun bm!36111 () Bool)

(declare-fun call!36114 () Bool)

(assert (=> bm!36111 (= call!36114 (contains!4178 lt!375850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!89684 () Bool)

(declare-fun bm!36112 () Bool)

(assert (=> bm!36112 (= call!36116 (+!2000 (ite c!89683 call!36112 (ite c!89684 call!36115 call!36113)) (ite (or c!89683 c!89684) (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829168 () Bool)

(assert (=> b!829168 (= e!462156 e!462157)))

(declare-fun res!564922 () Bool)

(assert (=> b!829168 (=> (not res!564922) (not e!462157))))

(assert (=> b!829168 (= res!564922 (contains!4178 lt!375850 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun bm!36113 () Bool)

(assert (=> bm!36113 (= call!36115 call!36112)))

(declare-fun b!829169 () Bool)

(declare-fun Unit!28360 () Unit!28353)

(assert (=> b!829169 (= e!462158 Unit!28360)))

(declare-fun b!829170 () Bool)

(assert (=> b!829170 (= e!462165 e!462155)))

(assert (=> b!829170 (= c!89684 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829171 () Bool)

(assert (=> b!829171 (= e!462155 call!36110)))

(declare-fun b!829172 () Bool)

(assert (=> b!829172 (= e!462162 (not call!36111))))

(declare-fun b!829173 () Bool)

(assert (=> b!829173 (= e!462164 e!462161)))

(declare-fun res!564915 () Bool)

(assert (=> b!829173 (= res!564915 call!36114)))

(assert (=> b!829173 (=> (not res!564915) (not e!462161))))

(declare-fun b!829174 () Bool)

(assert (=> b!829174 (= e!462164 (not call!36114))))

(assert (= (and d!105067 c!89683) b!829162))

(assert (= (and d!105067 (not c!89683)) b!829170))

(assert (= (and b!829170 c!89684) b!829171))

(assert (= (and b!829170 (not c!89684)) b!829163))

(assert (= (and b!829163 c!89685) b!829157))

(assert (= (and b!829163 (not c!89685)) b!829154))

(assert (= (or b!829157 b!829154) bm!36109))

(assert (= (or b!829171 bm!36109) bm!36113))

(assert (= (or b!829171 b!829157) bm!36108))

(assert (= (or b!829162 bm!36113) bm!36107))

(assert (= (or b!829162 bm!36108) bm!36112))

(assert (= (and d!105067 res!564923) b!829155))

(assert (= (and d!105067 c!89688) b!829158))

(assert (= (and d!105067 (not c!89688)) b!829169))

(assert (= (and d!105067 res!564920) b!829160))

(assert (= (and b!829160 res!564918) b!829164))

(assert (= (and b!829160 (not res!564921)) b!829168))

(assert (= (and b!829168 res!564922) b!829167))

(assert (= (and b!829160 res!564919) b!829165))

(assert (= (and b!829165 c!89687) b!829161))

(assert (= (and b!829165 (not c!89687)) b!829172))

(assert (= (and b!829161 res!564916) b!829156))

(assert (= (or b!829161 b!829172) bm!36110))

(assert (= (and b!829165 res!564917) b!829166))

(assert (= (and b!829166 c!89686) b!829173))

(assert (= (and b!829166 (not c!89686)) b!829174))

(assert (= (and b!829173 res!564915) b!829159))

(assert (= (or b!829173 b!829174) bm!36111))

(declare-fun b_lambda!11259 () Bool)

(assert (=> (not b_lambda!11259) (not b!829167)))

(assert (=> b!829167 t!22279))

(declare-fun b_and!22441 () Bool)

(assert (= b_and!22439 (and (=> t!22279 result!7989) b_and!22441)))

(declare-fun m!771619 () Bool)

(assert (=> b!829156 m!771619))

(assert (=> b!829155 m!771541))

(assert (=> b!829155 m!771541))

(assert (=> b!829155 m!771543))

(declare-fun m!771621 () Bool)

(assert (=> b!829158 m!771621))

(declare-fun m!771623 () Bool)

(assert (=> b!829158 m!771623))

(assert (=> b!829158 m!771621))

(declare-fun m!771625 () Bool)

(assert (=> b!829158 m!771625))

(declare-fun m!771627 () Bool)

(assert (=> b!829158 m!771627))

(declare-fun m!771629 () Bool)

(assert (=> b!829158 m!771629))

(assert (=> b!829158 m!771541))

(declare-fun m!771631 () Bool)

(assert (=> b!829158 m!771631))

(declare-fun m!771633 () Bool)

(assert (=> b!829158 m!771633))

(declare-fun m!771635 () Bool)

(assert (=> b!829158 m!771635))

(declare-fun m!771637 () Bool)

(assert (=> b!829158 m!771637))

(assert (=> b!829158 m!771635))

(assert (=> b!829158 m!771479))

(declare-fun m!771639 () Bool)

(assert (=> b!829158 m!771639))

(declare-fun m!771641 () Bool)

(assert (=> b!829158 m!771641))

(declare-fun m!771643 () Bool)

(assert (=> b!829158 m!771643))

(declare-fun m!771645 () Bool)

(assert (=> b!829158 m!771645))

(assert (=> b!829158 m!771629))

(declare-fun m!771647 () Bool)

(assert (=> b!829158 m!771647))

(assert (=> b!829158 m!771631))

(declare-fun m!771649 () Bool)

(assert (=> b!829158 m!771649))

(assert (=> b!829164 m!771541))

(assert (=> b!829164 m!771541))

(assert (=> b!829164 m!771543))

(declare-fun m!771651 () Bool)

(assert (=> bm!36110 m!771651))

(assert (=> b!829167 m!771541))

(declare-fun m!771653 () Bool)

(assert (=> b!829167 m!771653))

(assert (=> b!829167 m!771541))

(assert (=> b!829167 m!771579))

(assert (=> b!829167 m!771581))

(assert (=> b!829167 m!771583))

(assert (=> b!829167 m!771581))

(assert (=> b!829167 m!771579))

(assert (=> d!105067 m!771471))

(declare-fun m!771655 () Bool)

(assert (=> bm!36112 m!771655))

(declare-fun m!771657 () Bool)

(assert (=> b!829159 m!771657))

(assert (=> bm!36107 m!771479))

(assert (=> b!829168 m!771541))

(assert (=> b!829168 m!771541))

(declare-fun m!771659 () Bool)

(assert (=> b!829168 m!771659))

(declare-fun m!771661 () Bool)

(assert (=> bm!36111 m!771661))

(declare-fun m!771663 () Bool)

(assert (=> b!829162 m!771663))

(assert (=> b!828986 d!105067))

(declare-fun d!105069 () Bool)

(declare-fun e!462167 () Bool)

(assert (=> d!105069 e!462167))

(declare-fun res!564925 () Bool)

(assert (=> d!105069 (=> (not res!564925) (not e!462167))))

(declare-fun lt!375857 () ListLongMap!8949)

(assert (=> d!105069 (= res!564925 (contains!4178 lt!375857 (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!375860 () List!15922)

(assert (=> d!105069 (= lt!375857 (ListLongMap!8950 lt!375860))))

(declare-fun lt!375859 () Unit!28353)

(declare-fun lt!375858 () Unit!28353)

(assert (=> d!105069 (= lt!375859 lt!375858)))

(assert (=> d!105069 (= (getValueByKey!410 lt!375860 (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!415 (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105069 (= lt!375858 (lemmaContainsTupThenGetReturnValue!227 lt!375860 (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105069 (= lt!375860 (insertStrictlySorted!266 (toList!4490 (+!2000 lt!375727 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105069 (= (+!2000 (+!2000 lt!375727 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!375857)))

(declare-fun b!829175 () Bool)

(declare-fun res!564924 () Bool)

(assert (=> b!829175 (=> (not res!564924) (not e!462167))))

(assert (=> b!829175 (= res!564924 (= (getValueByKey!410 (toList!4490 lt!375857) (_1!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!415 (_2!5079 (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829176 () Bool)

(assert (=> b!829176 (= e!462167 (contains!4179 (toList!4490 lt!375857) (tuple2!10137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105069 res!564925) b!829175))

(assert (= (and b!829175 res!564924) b!829176))

(declare-fun m!771665 () Bool)

(assert (=> d!105069 m!771665))

(declare-fun m!771667 () Bool)

(assert (=> d!105069 m!771667))

(declare-fun m!771669 () Bool)

(assert (=> d!105069 m!771669))

(declare-fun m!771671 () Bool)

(assert (=> d!105069 m!771671))

(declare-fun m!771673 () Bool)

(assert (=> b!829175 m!771673))

(declare-fun m!771675 () Bool)

(assert (=> b!829176 m!771675))

(assert (=> b!828986 d!105069))

(declare-fun d!105071 () Bool)

(declare-fun e!462168 () Bool)

(assert (=> d!105071 e!462168))

(declare-fun res!564927 () Bool)

(assert (=> d!105071 (=> (not res!564927) (not e!462168))))

(declare-fun lt!375861 () ListLongMap!8949)

(assert (=> d!105071 (= res!564927 (contains!4178 lt!375861 (_1!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!375864 () List!15922)

(assert (=> d!105071 (= lt!375861 (ListLongMap!8950 lt!375864))))

(declare-fun lt!375863 () Unit!28353)

(declare-fun lt!375862 () Unit!28353)

(assert (=> d!105071 (= lt!375863 lt!375862)))

(assert (=> d!105071 (= (getValueByKey!410 lt!375864 (_1!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!415 (_2!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105071 (= lt!375862 (lemmaContainsTupThenGetReturnValue!227 lt!375864 (_1!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105071 (= lt!375864 (insertStrictlySorted!266 (toList!4490 lt!375727) (_1!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105071 (= (+!2000 lt!375727 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375861)))

(declare-fun b!829177 () Bool)

(declare-fun res!564926 () Bool)

(assert (=> b!829177 (=> (not res!564926) (not e!462168))))

(assert (=> b!829177 (= res!564926 (= (getValueByKey!410 (toList!4490 lt!375861) (_1!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!415 (_2!5079 (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!829178 () Bool)

(assert (=> b!829178 (= e!462168 (contains!4179 (toList!4490 lt!375861) (tuple2!10137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105071 res!564927) b!829177))

(assert (= (and b!829177 res!564926) b!829178))

(declare-fun m!771677 () Bool)

(assert (=> d!105071 m!771677))

(declare-fun m!771679 () Bool)

(assert (=> d!105071 m!771679))

(declare-fun m!771681 () Bool)

(assert (=> d!105071 m!771681))

(declare-fun m!771683 () Bool)

(assert (=> d!105071 m!771683))

(declare-fun m!771685 () Bool)

(assert (=> b!829177 m!771685))

(declare-fun m!771687 () Bool)

(assert (=> b!829178 m!771687))

(assert (=> b!828986 d!105071))

(declare-fun d!105073 () Bool)

(assert (=> d!105073 (= (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375867 () Unit!28353)

(declare-fun choose!1422 (array!46489 array!46491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 V!25235 V!25235 (_ BitVec 32) Int) Unit!28353)

(assert (=> d!105073 (= lt!375867 (choose!1422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105073 (validMask!0 mask!1312)))

(assert (=> d!105073 (= (lemmaNoChangeToArrayThenSameMapNoExtras!589 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375867)))

(declare-fun bs!23134 () Bool)

(assert (= bs!23134 d!105073))

(assert (=> bs!23134 m!771481))

(assert (=> bs!23134 m!771479))

(declare-fun m!771689 () Bool)

(assert (=> bs!23134 m!771689))

(assert (=> bs!23134 m!771471))

(assert (=> b!828987 d!105073))

(declare-fun bm!36116 () Bool)

(declare-fun call!36119 () ListLongMap!8949)

(assert (=> bm!36116 (= call!36119 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829203 () Bool)

(declare-fun e!462189 () ListLongMap!8949)

(declare-fun e!462187 () ListLongMap!8949)

(assert (=> b!829203 (= e!462189 e!462187)))

(declare-fun c!89697 () Bool)

(assert (=> b!829203 (= c!89697 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!375887 () ListLongMap!8949)

(declare-fun e!462184 () Bool)

(declare-fun b!829204 () Bool)

(assert (=> b!829204 (= e!462184 (= lt!375887 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829205 () Bool)

(declare-fun isEmpty!656 (ListLongMap!8949) Bool)

(assert (=> b!829205 (= e!462184 (isEmpty!656 lt!375887))))

(declare-fun b!829206 () Bool)

(declare-fun e!462186 () Bool)

(assert (=> b!829206 (= e!462186 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829206 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829207 () Bool)

(declare-fun e!462185 () Bool)

(declare-fun e!462183 () Bool)

(assert (=> b!829207 (= e!462185 e!462183)))

(assert (=> b!829207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun res!564937 () Bool)

(assert (=> b!829207 (= res!564937 (contains!4178 lt!375887 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829207 (=> (not res!564937) (not e!462183))))

(declare-fun b!829208 () Bool)

(declare-fun res!564938 () Bool)

(declare-fun e!462188 () Bool)

(assert (=> b!829208 (=> (not res!564938) (not e!462188))))

(assert (=> b!829208 (= res!564938 (not (contains!4178 lt!375887 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829209 () Bool)

(assert (=> b!829209 (= e!462185 e!462184)))

(declare-fun c!89698 () Bool)

(assert (=> b!829209 (= c!89698 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun b!829211 () Bool)

(assert (=> b!829211 (= e!462188 e!462185)))

(declare-fun c!89699 () Bool)

(assert (=> b!829211 (= c!89699 e!462186)))

(declare-fun res!564936 () Bool)

(assert (=> b!829211 (=> (not res!564936) (not e!462186))))

(assert (=> b!829211 (= res!564936 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun b!829212 () Bool)

(assert (=> b!829212 (= e!462189 (ListLongMap!8950 Nil!15919))))

(declare-fun b!829213 () Bool)

(declare-fun lt!375888 () Unit!28353)

(declare-fun lt!375886 () Unit!28353)

(assert (=> b!829213 (= lt!375888 lt!375886)))

(declare-fun lt!375885 () V!25235)

(declare-fun lt!375882 () (_ BitVec 64))

(declare-fun lt!375884 () ListLongMap!8949)

(declare-fun lt!375883 () (_ BitVec 64))

(assert (=> b!829213 (not (contains!4178 (+!2000 lt!375884 (tuple2!10137 lt!375883 lt!375885)) lt!375882))))

(declare-fun addStillNotContains!195 (ListLongMap!8949 (_ BitVec 64) V!25235 (_ BitVec 64)) Unit!28353)

(assert (=> b!829213 (= lt!375886 (addStillNotContains!195 lt!375884 lt!375883 lt!375885 lt!375882))))

(assert (=> b!829213 (= lt!375882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829213 (= lt!375885 (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829213 (= lt!375883 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829213 (= lt!375884 call!36119)))

(assert (=> b!829213 (= e!462187 (+!2000 call!36119 (tuple2!10137 (select (arr!22284 _keys!976) #b00000000000000000000000000000000) (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829214 () Bool)

(assert (=> b!829214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(assert (=> b!829214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22706 _values!788)))))

(assert (=> b!829214 (= e!462183 (= (apply!369 lt!375887 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)) (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829210 () Bool)

(assert (=> b!829210 (= e!462187 call!36119)))

(declare-fun d!105075 () Bool)

(assert (=> d!105075 e!462188))

(declare-fun res!564939 () Bool)

(assert (=> d!105075 (=> (not res!564939) (not e!462188))))

(assert (=> d!105075 (= res!564939 (not (contains!4178 lt!375887 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105075 (= lt!375887 e!462189)))

(declare-fun c!89700 () Bool)

(assert (=> d!105075 (= c!89700 (bvsge #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(assert (=> d!105075 (validMask!0 mask!1312)))

(assert (=> d!105075 (= (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375887)))

(assert (= (and d!105075 c!89700) b!829212))

(assert (= (and d!105075 (not c!89700)) b!829203))

(assert (= (and b!829203 c!89697) b!829213))

(assert (= (and b!829203 (not c!89697)) b!829210))

(assert (= (or b!829213 b!829210) bm!36116))

(assert (= (and d!105075 res!564939) b!829208))

(assert (= (and b!829208 res!564938) b!829211))

(assert (= (and b!829211 res!564936) b!829206))

(assert (= (and b!829211 c!89699) b!829207))

(assert (= (and b!829211 (not c!89699)) b!829209))

(assert (= (and b!829207 res!564937) b!829214))

(assert (= (and b!829209 c!89698) b!829204))

(assert (= (and b!829209 (not c!89698)) b!829205))

(declare-fun b_lambda!11261 () Bool)

(assert (=> (not b_lambda!11261) (not b!829213)))

(assert (=> b!829213 t!22279))

(declare-fun b_and!22443 () Bool)

(assert (= b_and!22441 (and (=> t!22279 result!7989) b_and!22443)))

(declare-fun b_lambda!11263 () Bool)

(assert (=> (not b_lambda!11263) (not b!829214)))

(assert (=> b!829214 t!22279))

(declare-fun b_and!22445 () Bool)

(assert (= b_and!22443 (and (=> t!22279 result!7989) b_and!22445)))

(declare-fun m!771691 () Bool)

(assert (=> d!105075 m!771691))

(assert (=> d!105075 m!771471))

(declare-fun m!771693 () Bool)

(assert (=> b!829205 m!771693))

(assert (=> b!829207 m!771541))

(assert (=> b!829207 m!771541))

(declare-fun m!771695 () Bool)

(assert (=> b!829207 m!771695))

(declare-fun m!771697 () Bool)

(assert (=> b!829208 m!771697))

(assert (=> b!829206 m!771541))

(assert (=> b!829206 m!771541))

(assert (=> b!829206 m!771543))

(declare-fun m!771699 () Bool)

(assert (=> bm!36116 m!771699))

(assert (=> b!829204 m!771699))

(assert (=> b!829214 m!771579))

(assert (=> b!829214 m!771541))

(assert (=> b!829214 m!771541))

(declare-fun m!771701 () Bool)

(assert (=> b!829214 m!771701))

(assert (=> b!829214 m!771581))

(assert (=> b!829214 m!771579))

(assert (=> b!829214 m!771581))

(assert (=> b!829214 m!771583))

(assert (=> b!829203 m!771541))

(assert (=> b!829203 m!771541))

(assert (=> b!829203 m!771543))

(assert (=> b!829213 m!771541))

(assert (=> b!829213 m!771581))

(assert (=> b!829213 m!771579))

(assert (=> b!829213 m!771581))

(assert (=> b!829213 m!771583))

(declare-fun m!771703 () Bool)

(assert (=> b!829213 m!771703))

(declare-fun m!771705 () Bool)

(assert (=> b!829213 m!771705))

(assert (=> b!829213 m!771579))

(declare-fun m!771707 () Bool)

(assert (=> b!829213 m!771707))

(assert (=> b!829213 m!771703))

(declare-fun m!771709 () Bool)

(assert (=> b!829213 m!771709))

(assert (=> b!828987 d!105075))

(declare-fun call!36120 () ListLongMap!8949)

(declare-fun bm!36117 () Bool)

(assert (=> bm!36117 (= call!36120 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829215 () Bool)

(declare-fun e!462196 () ListLongMap!8949)

(declare-fun e!462194 () ListLongMap!8949)

(assert (=> b!829215 (= e!462196 e!462194)))

(declare-fun c!89701 () Bool)

(assert (=> b!829215 (= c!89701 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829216 () Bool)

(declare-fun e!462191 () Bool)

(declare-fun lt!375894 () ListLongMap!8949)

(assert (=> b!829216 (= e!462191 (= lt!375894 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829217 () Bool)

(assert (=> b!829217 (= e!462191 (isEmpty!656 lt!375894))))

(declare-fun b!829218 () Bool)

(declare-fun e!462193 () Bool)

(assert (=> b!829218 (= e!462193 (validKeyInArray!0 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829218 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829219 () Bool)

(declare-fun e!462192 () Bool)

(declare-fun e!462190 () Bool)

(assert (=> b!829219 (= e!462192 e!462190)))

(assert (=> b!829219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun res!564941 () Bool)

(assert (=> b!829219 (= res!564941 (contains!4178 lt!375894 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829219 (=> (not res!564941) (not e!462190))))

(declare-fun b!829220 () Bool)

(declare-fun res!564942 () Bool)

(declare-fun e!462195 () Bool)

(assert (=> b!829220 (=> (not res!564942) (not e!462195))))

(assert (=> b!829220 (= res!564942 (not (contains!4178 lt!375894 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829221 () Bool)

(assert (=> b!829221 (= e!462192 e!462191)))

(declare-fun c!89702 () Bool)

(assert (=> b!829221 (= c!89702 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun b!829223 () Bool)

(assert (=> b!829223 (= e!462195 e!462192)))

(declare-fun c!89703 () Bool)

(assert (=> b!829223 (= c!89703 e!462193)))

(declare-fun res!564940 () Bool)

(assert (=> b!829223 (=> (not res!564940) (not e!462193))))

(assert (=> b!829223 (= res!564940 (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(declare-fun b!829224 () Bool)

(assert (=> b!829224 (= e!462196 (ListLongMap!8950 Nil!15919))))

(declare-fun b!829225 () Bool)

(declare-fun lt!375895 () Unit!28353)

(declare-fun lt!375893 () Unit!28353)

(assert (=> b!829225 (= lt!375895 lt!375893)))

(declare-fun lt!375890 () (_ BitVec 64))

(declare-fun lt!375892 () V!25235)

(declare-fun lt!375889 () (_ BitVec 64))

(declare-fun lt!375891 () ListLongMap!8949)

(assert (=> b!829225 (not (contains!4178 (+!2000 lt!375891 (tuple2!10137 lt!375890 lt!375892)) lt!375889))))

(assert (=> b!829225 (= lt!375893 (addStillNotContains!195 lt!375891 lt!375890 lt!375892 lt!375889))))

(assert (=> b!829225 (= lt!375889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829225 (= lt!375892 (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829225 (= lt!375890 (select (arr!22284 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829225 (= lt!375891 call!36120)))

(assert (=> b!829225 (= e!462194 (+!2000 call!36120 (tuple2!10137 (select (arr!22284 _keys!976) #b00000000000000000000000000000000) (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829226 () Bool)

(assert (=> b!829226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(assert (=> b!829226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22706 _values!788)))))

(assert (=> b!829226 (= e!462190 (= (apply!369 lt!375894 (select (arr!22284 _keys!976) #b00000000000000000000000000000000)) (get!11810 (select (arr!22285 _values!788) #b00000000000000000000000000000000) (dynLambda!983 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829222 () Bool)

(assert (=> b!829222 (= e!462194 call!36120)))

(declare-fun d!105077 () Bool)

(assert (=> d!105077 e!462195))

(declare-fun res!564943 () Bool)

(assert (=> d!105077 (=> (not res!564943) (not e!462195))))

(assert (=> d!105077 (= res!564943 (not (contains!4178 lt!375894 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105077 (= lt!375894 e!462196)))

(declare-fun c!89704 () Bool)

(assert (=> d!105077 (= c!89704 (bvsge #b00000000000000000000000000000000 (size!22705 _keys!976)))))

(assert (=> d!105077 (validMask!0 mask!1312)))

(assert (=> d!105077 (= (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375894)))

(assert (= (and d!105077 c!89704) b!829224))

(assert (= (and d!105077 (not c!89704)) b!829215))

(assert (= (and b!829215 c!89701) b!829225))

(assert (= (and b!829215 (not c!89701)) b!829222))

(assert (= (or b!829225 b!829222) bm!36117))

(assert (= (and d!105077 res!564943) b!829220))

(assert (= (and b!829220 res!564942) b!829223))

(assert (= (and b!829223 res!564940) b!829218))

(assert (= (and b!829223 c!89703) b!829219))

(assert (= (and b!829223 (not c!89703)) b!829221))

(assert (= (and b!829219 res!564941) b!829226))

(assert (= (and b!829221 c!89702) b!829216))

(assert (= (and b!829221 (not c!89702)) b!829217))

(declare-fun b_lambda!11265 () Bool)

(assert (=> (not b_lambda!11265) (not b!829225)))

(assert (=> b!829225 t!22279))

(declare-fun b_and!22447 () Bool)

(assert (= b_and!22445 (and (=> t!22279 result!7989) b_and!22447)))

(declare-fun b_lambda!11267 () Bool)

(assert (=> (not b_lambda!11267) (not b!829226)))

(assert (=> b!829226 t!22279))

(declare-fun b_and!22449 () Bool)

(assert (= b_and!22447 (and (=> t!22279 result!7989) b_and!22449)))

(declare-fun m!771711 () Bool)

(assert (=> d!105077 m!771711))

(assert (=> d!105077 m!771471))

(declare-fun m!771713 () Bool)

(assert (=> b!829217 m!771713))

(assert (=> b!829219 m!771541))

(assert (=> b!829219 m!771541))

(declare-fun m!771715 () Bool)

(assert (=> b!829219 m!771715))

(declare-fun m!771717 () Bool)

(assert (=> b!829220 m!771717))

(assert (=> b!829218 m!771541))

(assert (=> b!829218 m!771541))

(assert (=> b!829218 m!771543))

(declare-fun m!771719 () Bool)

(assert (=> bm!36117 m!771719))

(assert (=> b!829216 m!771719))

(assert (=> b!829226 m!771579))

(assert (=> b!829226 m!771541))

(assert (=> b!829226 m!771541))

(declare-fun m!771721 () Bool)

(assert (=> b!829226 m!771721))

(assert (=> b!829226 m!771581))

(assert (=> b!829226 m!771579))

(assert (=> b!829226 m!771581))

(assert (=> b!829226 m!771583))

(assert (=> b!829215 m!771541))

(assert (=> b!829215 m!771541))

(assert (=> b!829215 m!771543))

(assert (=> b!829225 m!771541))

(assert (=> b!829225 m!771581))

(assert (=> b!829225 m!771579))

(assert (=> b!829225 m!771581))

(assert (=> b!829225 m!771583))

(declare-fun m!771723 () Bool)

(assert (=> b!829225 m!771723))

(declare-fun m!771725 () Bool)

(assert (=> b!829225 m!771725))

(assert (=> b!829225 m!771579))

(declare-fun m!771727 () Bool)

(assert (=> b!829225 m!771727))

(assert (=> b!829225 m!771723))

(declare-fun m!771729 () Bool)

(assert (=> b!829225 m!771729))

(assert (=> b!828987 d!105077))

(declare-fun mapIsEmpty!24415 () Bool)

(declare-fun mapRes!24415 () Bool)

(assert (=> mapIsEmpty!24415 mapRes!24415))

(declare-fun b!829233 () Bool)

(declare-fun e!462202 () Bool)

(assert (=> b!829233 (= e!462202 tp_is_empty!15175)))

(declare-fun condMapEmpty!24415 () Bool)

(declare-fun mapDefault!24415 () ValueCell!7172)

(assert (=> mapNonEmpty!24406 (= condMapEmpty!24415 (= mapRest!24406 ((as const (Array (_ BitVec 32) ValueCell!7172)) mapDefault!24415)))))

(declare-fun e!462201 () Bool)

(assert (=> mapNonEmpty!24406 (= tp!47173 (and e!462201 mapRes!24415))))

(declare-fun b!829234 () Bool)

(assert (=> b!829234 (= e!462201 tp_is_empty!15175)))

(declare-fun mapNonEmpty!24415 () Bool)

(declare-fun tp!47188 () Bool)

(assert (=> mapNonEmpty!24415 (= mapRes!24415 (and tp!47188 e!462202))))

(declare-fun mapRest!24415 () (Array (_ BitVec 32) ValueCell!7172))

(declare-fun mapKey!24415 () (_ BitVec 32))

(declare-fun mapValue!24415 () ValueCell!7172)

(assert (=> mapNonEmpty!24415 (= mapRest!24406 (store mapRest!24415 mapKey!24415 mapValue!24415))))

(assert (= (and mapNonEmpty!24406 condMapEmpty!24415) mapIsEmpty!24415))

(assert (= (and mapNonEmpty!24406 (not condMapEmpty!24415)) mapNonEmpty!24415))

(assert (= (and mapNonEmpty!24415 ((_ is ValueCellFull!7172) mapValue!24415)) b!829233))

(assert (= (and mapNonEmpty!24406 ((_ is ValueCellFull!7172) mapDefault!24415)) b!829234))

(declare-fun m!771731 () Bool)

(assert (=> mapNonEmpty!24415 m!771731))

(declare-fun b_lambda!11269 () Bool)

(assert (= b_lambda!11267 (or (and start!71382 b_free!13465) b_lambda!11269)))

(declare-fun b_lambda!11271 () Bool)

(assert (= b_lambda!11259 (or (and start!71382 b_free!13465) b_lambda!11271)))

(declare-fun b_lambda!11273 () Bool)

(assert (= b_lambda!11265 (or (and start!71382 b_free!13465) b_lambda!11273)))

(declare-fun b_lambda!11275 () Bool)

(assert (= b_lambda!11261 (or (and start!71382 b_free!13465) b_lambda!11275)))

(declare-fun b_lambda!11277 () Bool)

(assert (= b_lambda!11257 (or (and start!71382 b_free!13465) b_lambda!11277)))

(declare-fun b_lambda!11279 () Bool)

(assert (= b_lambda!11263 (or (and start!71382 b_free!13465) b_lambda!11279)))

(check-sat (not d!105067) (not b!829214) (not bm!36106) (not bm!36111) (not b!829106) (not b!829219) (not b!829213) (not b!829226) (not b_next!13465) (not b!829167) (not b!829158) (not d!105075) (not b!829153) (not bm!36116) (not b!829204) (not b!829177) (not b!829220) (not b!829218) (not b!829164) (not bm!36103) (not bm!36112) (not bm!36107) (not b!829125) (not b!829151) (not b!829203) (not b!829216) (not d!105077) (not b!829111) (not mapNonEmpty!24415) (not b!829208) (not b!829141) (not b!829207) (not b!829206) (not b_lambda!11271) (not d!105055) (not bm!36117) (not b!829102) (not bm!36099) (not b!829225) (not b!829215) (not b!829156) (not bm!36097) (not d!105069) (not b!829176) (not b!829155) (not b!829108) (not bm!36094) (not b!829100) (not b!829139) b_and!22449 (not b!829205) tp_is_empty!15175 (not b_lambda!11279) (not b!829159) (not b_lambda!11275) (not b!829137) (not b!829103) (not d!105073) (not b!829099) (not b!829126) (not b!829178) (not bm!36110) (not b!829112) (not d!105071) (not b!829162) (not b_lambda!11269) (not b_lambda!11277) (not b_lambda!11273) (not bm!36098) (not b!829217) (not b!829175) (not d!105053) (not b!829168))
(check-sat b_and!22449 (not b_next!13465))

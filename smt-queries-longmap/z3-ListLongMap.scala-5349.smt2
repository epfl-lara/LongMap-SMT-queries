; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71582 () Bool)

(assert start!71582)

(declare-fun b_free!13503 () Bool)

(declare-fun b_next!13503 () Bool)

(assert (=> start!71582 (= b_free!13503 (not b_next!13503))))

(declare-fun tp!47301 () Bool)

(declare-fun b_and!22561 () Bool)

(assert (=> start!71582 (= tp!47301 b_and!22561)))

(declare-fun b!831795 () Bool)

(declare-fun res!566080 () Bool)

(declare-fun e!463859 () Bool)

(assert (=> b!831795 (=> (not res!566080) (not e!463859))))

(declare-datatypes ((V!25285 0))(
  ( (V!25286 (val!7654 Int)) )
))
(declare-datatypes ((tuple2!10156 0))(
  ( (tuple2!10157 (_1!5089 (_ BitVec 64)) (_2!5089 V!25285)) )
))
(declare-fun lt!377428 () tuple2!10156)

(declare-datatypes ((List!15949 0))(
  ( (Nil!15946) (Cons!15945 (h!17075 tuple2!10156) (t!22317 List!15949)) )
))
(declare-datatypes ((ListLongMap!8979 0))(
  ( (ListLongMap!8980 (toList!4505 List!15949)) )
))
(declare-fun lt!377426 () ListLongMap!8979)

(declare-fun zeroValueAfter!34 () V!25285)

(declare-fun lt!377423 () ListLongMap!8979)

(declare-fun +!1983 (ListLongMap!8979 tuple2!10156) ListLongMap!8979)

(assert (=> b!831795 (= res!566080 (= lt!377426 (+!1983 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377428)))))

(declare-fun b!831796 () Bool)

(declare-fun res!566078 () Bool)

(declare-fun e!463865 () Bool)

(assert (=> b!831796 (=> (not res!566078) (not e!463865))))

(declare-datatypes ((array!46598 0))(
  ( (array!46599 (arr!22334 (Array (_ BitVec 32) (_ BitVec 64))) (size!22755 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46598)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46598 (_ BitVec 32)) Bool)

(assert (=> b!831796 (= res!566078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!831797 () Bool)

(declare-fun e!463861 () Bool)

(declare-fun e!463862 () Bool)

(declare-fun mapRes!24477 () Bool)

(assert (=> b!831797 (= e!463861 (and e!463862 mapRes!24477))))

(declare-fun condMapEmpty!24477 () Bool)

(declare-datatypes ((ValueCell!7191 0))(
  ( (ValueCellFull!7191 (v!10099 V!25285)) (EmptyCell!7191) )
))
(declare-datatypes ((array!46600 0))(
  ( (array!46601 (arr!22335 (Array (_ BitVec 32) ValueCell!7191)) (size!22756 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46600)

(declare-fun mapDefault!24477 () ValueCell!7191)

(assert (=> b!831797 (= condMapEmpty!24477 (= (arr!22335 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7191)) mapDefault!24477)))))

(declare-fun b!831798 () Bool)

(declare-fun e!463864 () Bool)

(assert (=> b!831798 (= e!463864 (= lt!377426 (+!1983 (+!1983 lt!377423 lt!377428) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!831798 e!463859))

(declare-fun res!566079 () Bool)

(assert (=> b!831798 (=> (not res!566079) (not e!463859))))

(declare-fun lt!377424 () ListLongMap!8979)

(declare-fun lt!377422 () ListLongMap!8979)

(declare-fun lt!377425 () tuple2!10156)

(assert (=> b!831798 (= res!566079 (= lt!377424 (+!1983 (+!1983 lt!377422 lt!377425) lt!377428)))))

(declare-fun minValue!754 () V!25285)

(assert (=> b!831798 (= lt!377428 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun zeroValueBefore!34 () V!25285)

(assert (=> b!831798 (= lt!377425 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2601 (array!46598 array!46600 (_ BitVec 32) (_ BitVec 32) V!25285 V!25285 (_ BitVec 32) Int) ListLongMap!8979)

(assert (=> b!831798 (= lt!377426 (getCurrentListMap!2601 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!831798 (= lt!377424 (getCurrentListMap!2601 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!566081 () Bool)

(assert (=> start!71582 (=> (not res!566081) (not e!463865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71582 (= res!566081 (validMask!0 mask!1312))))

(assert (=> start!71582 e!463865))

(declare-fun tp_is_empty!15213 () Bool)

(assert (=> start!71582 tp_is_empty!15213))

(declare-fun array_inv!17787 (array!46598) Bool)

(assert (=> start!71582 (array_inv!17787 _keys!976)))

(assert (=> start!71582 true))

(declare-fun array_inv!17788 (array!46600) Bool)

(assert (=> start!71582 (and (array_inv!17788 _values!788) e!463861)))

(assert (=> start!71582 tp!47301))

(declare-fun b!831799 () Bool)

(declare-fun res!566077 () Bool)

(assert (=> b!831799 (=> (not res!566077) (not e!463865))))

(assert (=> b!831799 (= res!566077 (and (= (size!22756 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22755 _keys!976) (size!22756 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!831800 () Bool)

(assert (=> b!831800 (= e!463862 tp_is_empty!15213)))

(declare-fun b!831801 () Bool)

(assert (=> b!831801 (= e!463865 (not e!463864))))

(declare-fun res!566076 () Bool)

(assert (=> b!831801 (=> res!566076 e!463864)))

(assert (=> b!831801 (= res!566076 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831801 (= lt!377422 lt!377423)))

(declare-datatypes ((Unit!28493 0))(
  ( (Unit!28494) )
))
(declare-fun lt!377427 () Unit!28493)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!592 (array!46598 array!46600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25285 V!25285 V!25285 V!25285 (_ BitVec 32) Int) Unit!28493)

(assert (=> b!831801 (= lt!377427 (lemmaNoChangeToArrayThenSameMapNoExtras!592 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2504 (array!46598 array!46600 (_ BitVec 32) (_ BitVec 32) V!25285 V!25285 (_ BitVec 32) Int) ListLongMap!8979)

(assert (=> b!831801 (= lt!377423 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831801 (= lt!377422 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831802 () Bool)

(assert (=> b!831802 (= e!463859 (= lt!377424 (+!1983 (+!1983 lt!377422 lt!377428) lt!377425)))))

(declare-fun b!831803 () Bool)

(declare-fun e!463860 () Bool)

(assert (=> b!831803 (= e!463860 tp_is_empty!15213)))

(declare-fun mapIsEmpty!24477 () Bool)

(assert (=> mapIsEmpty!24477 mapRes!24477))

(declare-fun mapNonEmpty!24477 () Bool)

(declare-fun tp!47300 () Bool)

(assert (=> mapNonEmpty!24477 (= mapRes!24477 (and tp!47300 e!463860))))

(declare-fun mapValue!24477 () ValueCell!7191)

(declare-fun mapKey!24477 () (_ BitVec 32))

(declare-fun mapRest!24477 () (Array (_ BitVec 32) ValueCell!7191))

(assert (=> mapNonEmpty!24477 (= (arr!22335 _values!788) (store mapRest!24477 mapKey!24477 mapValue!24477))))

(declare-fun b!831804 () Bool)

(declare-fun res!566075 () Bool)

(assert (=> b!831804 (=> (not res!566075) (not e!463865))))

(declare-datatypes ((List!15950 0))(
  ( (Nil!15947) (Cons!15946 (h!17076 (_ BitVec 64)) (t!22318 List!15950)) )
))
(declare-fun arrayNoDuplicates!0 (array!46598 (_ BitVec 32) List!15950) Bool)

(assert (=> b!831804 (= res!566075 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15947))))

(assert (= (and start!71582 res!566081) b!831799))

(assert (= (and b!831799 res!566077) b!831796))

(assert (= (and b!831796 res!566078) b!831804))

(assert (= (and b!831804 res!566075) b!831801))

(assert (= (and b!831801 (not res!566076)) b!831798))

(assert (= (and b!831798 res!566079) b!831795))

(assert (= (and b!831795 res!566080) b!831802))

(assert (= (and b!831797 condMapEmpty!24477) mapIsEmpty!24477))

(assert (= (and b!831797 (not condMapEmpty!24477)) mapNonEmpty!24477))

(get-info :version)

(assert (= (and mapNonEmpty!24477 ((_ is ValueCellFull!7191) mapValue!24477)) b!831803))

(assert (= (and b!831797 ((_ is ValueCellFull!7191) mapDefault!24477)) b!831800))

(assert (= start!71582 b!831797))

(declare-fun m!775687 () Bool)

(assert (=> b!831801 m!775687))

(declare-fun m!775689 () Bool)

(assert (=> b!831801 m!775689))

(declare-fun m!775691 () Bool)

(assert (=> b!831801 m!775691))

(declare-fun m!775693 () Bool)

(assert (=> mapNonEmpty!24477 m!775693))

(declare-fun m!775695 () Bool)

(assert (=> b!831804 m!775695))

(declare-fun m!775697 () Bool)

(assert (=> b!831802 m!775697))

(assert (=> b!831802 m!775697))

(declare-fun m!775699 () Bool)

(assert (=> b!831802 m!775699))

(declare-fun m!775701 () Bool)

(assert (=> b!831796 m!775701))

(declare-fun m!775703 () Bool)

(assert (=> b!831798 m!775703))

(declare-fun m!775705 () Bool)

(assert (=> b!831798 m!775705))

(assert (=> b!831798 m!775703))

(declare-fun m!775707 () Bool)

(assert (=> b!831798 m!775707))

(declare-fun m!775709 () Bool)

(assert (=> b!831798 m!775709))

(declare-fun m!775711 () Bool)

(assert (=> b!831798 m!775711))

(assert (=> b!831798 m!775709))

(declare-fun m!775713 () Bool)

(assert (=> b!831798 m!775713))

(declare-fun m!775715 () Bool)

(assert (=> start!71582 m!775715))

(declare-fun m!775717 () Bool)

(assert (=> start!71582 m!775717))

(declare-fun m!775719 () Bool)

(assert (=> start!71582 m!775719))

(declare-fun m!775721 () Bool)

(assert (=> b!831795 m!775721))

(assert (=> b!831795 m!775721))

(declare-fun m!775723 () Bool)

(assert (=> b!831795 m!775723))

(check-sat tp_is_empty!15213 (not b!831804) (not b!831801) (not b!831796) (not b!831795) (not b_next!13503) (not start!71582) b_and!22561 (not b!831798) (not mapNonEmpty!24477) (not b!831802))
(check-sat b_and!22561 (not b_next!13503))
(get-model)

(declare-fun d!106297 () Bool)

(declare-fun e!463889 () Bool)

(assert (=> d!106297 e!463889))

(declare-fun res!566107 () Bool)

(assert (=> d!106297 (=> (not res!566107) (not e!463889))))

(declare-fun lt!377461 () ListLongMap!8979)

(declare-fun contains!4211 (ListLongMap!8979 (_ BitVec 64)) Bool)

(assert (=> d!106297 (= res!566107 (contains!4211 lt!377461 (_1!5089 lt!377425)))))

(declare-fun lt!377460 () List!15949)

(assert (=> d!106297 (= lt!377461 (ListLongMap!8980 lt!377460))))

(declare-fun lt!377458 () Unit!28493)

(declare-fun lt!377459 () Unit!28493)

(assert (=> d!106297 (= lt!377458 lt!377459)))

(declare-datatypes ((Option!422 0))(
  ( (Some!421 (v!10101 V!25285)) (None!420) )
))
(declare-fun getValueByKey!416 (List!15949 (_ BitVec 64)) Option!422)

(assert (=> d!106297 (= (getValueByKey!416 lt!377460 (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425)))))

(declare-fun lemmaContainsTupThenGetReturnValue!230 (List!15949 (_ BitVec 64) V!25285) Unit!28493)

(assert (=> d!106297 (= lt!377459 (lemmaContainsTupThenGetReturnValue!230 lt!377460 (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(declare-fun insertStrictlySorted!269 (List!15949 (_ BitVec 64) V!25285) List!15949)

(assert (=> d!106297 (= lt!377460 (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377422 lt!377428)) (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(assert (=> d!106297 (= (+!1983 (+!1983 lt!377422 lt!377428) lt!377425) lt!377461)))

(declare-fun b!831839 () Bool)

(declare-fun res!566108 () Bool)

(assert (=> b!831839 (=> (not res!566108) (not e!463889))))

(assert (=> b!831839 (= res!566108 (= (getValueByKey!416 (toList!4505 lt!377461) (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425))))))

(declare-fun b!831840 () Bool)

(declare-fun contains!4212 (List!15949 tuple2!10156) Bool)

(assert (=> b!831840 (= e!463889 (contains!4212 (toList!4505 lt!377461) lt!377425))))

(assert (= (and d!106297 res!566107) b!831839))

(assert (= (and b!831839 res!566108) b!831840))

(declare-fun m!775763 () Bool)

(assert (=> d!106297 m!775763))

(declare-fun m!775765 () Bool)

(assert (=> d!106297 m!775765))

(declare-fun m!775767 () Bool)

(assert (=> d!106297 m!775767))

(declare-fun m!775769 () Bool)

(assert (=> d!106297 m!775769))

(declare-fun m!775771 () Bool)

(assert (=> b!831839 m!775771))

(declare-fun m!775773 () Bool)

(assert (=> b!831840 m!775773))

(assert (=> b!831802 d!106297))

(declare-fun d!106299 () Bool)

(declare-fun e!463890 () Bool)

(assert (=> d!106299 e!463890))

(declare-fun res!566109 () Bool)

(assert (=> d!106299 (=> (not res!566109) (not e!463890))))

(declare-fun lt!377465 () ListLongMap!8979)

(assert (=> d!106299 (= res!566109 (contains!4211 lt!377465 (_1!5089 lt!377428)))))

(declare-fun lt!377464 () List!15949)

(assert (=> d!106299 (= lt!377465 (ListLongMap!8980 lt!377464))))

(declare-fun lt!377462 () Unit!28493)

(declare-fun lt!377463 () Unit!28493)

(assert (=> d!106299 (= lt!377462 lt!377463)))

(assert (=> d!106299 (= (getValueByKey!416 lt!377464 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!106299 (= lt!377463 (lemmaContainsTupThenGetReturnValue!230 lt!377464 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106299 (= lt!377464 (insertStrictlySorted!269 (toList!4505 lt!377422) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106299 (= (+!1983 lt!377422 lt!377428) lt!377465)))

(declare-fun b!831841 () Bool)

(declare-fun res!566110 () Bool)

(assert (=> b!831841 (=> (not res!566110) (not e!463890))))

(assert (=> b!831841 (= res!566110 (= (getValueByKey!416 (toList!4505 lt!377465) (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428))))))

(declare-fun b!831842 () Bool)

(assert (=> b!831842 (= e!463890 (contains!4212 (toList!4505 lt!377465) lt!377428))))

(assert (= (and d!106299 res!566109) b!831841))

(assert (= (and b!831841 res!566110) b!831842))

(declare-fun m!775775 () Bool)

(assert (=> d!106299 m!775775))

(declare-fun m!775777 () Bool)

(assert (=> d!106299 m!775777))

(declare-fun m!775779 () Bool)

(assert (=> d!106299 m!775779))

(declare-fun m!775781 () Bool)

(assert (=> d!106299 m!775781))

(declare-fun m!775783 () Bool)

(assert (=> b!831841 m!775783))

(declare-fun m!775785 () Bool)

(assert (=> b!831842 m!775785))

(assert (=> b!831802 d!106299))

(declare-fun d!106301 () Bool)

(assert (=> d!106301 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377468 () Unit!28493)

(declare-fun choose!1422 (array!46598 array!46600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25285 V!25285 V!25285 V!25285 (_ BitVec 32) Int) Unit!28493)

(assert (=> d!106301 (= lt!377468 (choose!1422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!106301 (validMask!0 mask!1312)))

(assert (=> d!106301 (= (lemmaNoChangeToArrayThenSameMapNoExtras!592 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377468)))

(declare-fun bs!23258 () Bool)

(assert (= bs!23258 d!106301))

(assert (=> bs!23258 m!775691))

(assert (=> bs!23258 m!775689))

(declare-fun m!775787 () Bool)

(assert (=> bs!23258 m!775787))

(assert (=> bs!23258 m!775715))

(assert (=> b!831801 d!106301))

(declare-fun b!831867 () Bool)

(declare-fun e!463907 () ListLongMap!8979)

(assert (=> b!831867 (= e!463907 (ListLongMap!8980 Nil!15946))))

(declare-fun b!831868 () Bool)

(declare-fun lt!377489 () Unit!28493)

(declare-fun lt!377485 () Unit!28493)

(assert (=> b!831868 (= lt!377489 lt!377485)))

(declare-fun lt!377483 () V!25285)

(declare-fun lt!377488 () ListLongMap!8979)

(declare-fun lt!377484 () (_ BitVec 64))

(declare-fun lt!377486 () (_ BitVec 64))

(assert (=> b!831868 (not (contains!4211 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)) lt!377486))))

(declare-fun addStillNotContains!198 (ListLongMap!8979 (_ BitVec 64) V!25285 (_ BitVec 64)) Unit!28493)

(assert (=> b!831868 (= lt!377485 (addStillNotContains!198 lt!377488 lt!377484 lt!377483 lt!377486))))

(assert (=> b!831868 (= lt!377486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11823 (ValueCell!7191 V!25285) V!25285)

(declare-fun dynLambda!984 (Int (_ BitVec 64)) V!25285)

(assert (=> b!831868 (= lt!377483 (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831868 (= lt!377484 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36361 () ListLongMap!8979)

(assert (=> b!831868 (= lt!377488 call!36361)))

(declare-fun e!463910 () ListLongMap!8979)

(assert (=> b!831868 (= e!463910 (+!1983 call!36361 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36358 () Bool)

(assert (=> bm!36358 (= call!36361 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun lt!377487 () ListLongMap!8979)

(declare-fun b!831869 () Bool)

(declare-fun e!463911 () Bool)

(assert (=> b!831869 (= e!463911 (= lt!377487 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!106303 () Bool)

(declare-fun e!463908 () Bool)

(assert (=> d!106303 e!463908))

(declare-fun res!566119 () Bool)

(assert (=> d!106303 (=> (not res!566119) (not e!463908))))

(assert (=> d!106303 (= res!566119 (not (contains!4211 lt!377487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106303 (= lt!377487 e!463907)))

(declare-fun c!90333 () Bool)

(assert (=> d!106303 (= c!90333 (bvsge #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> d!106303 (validMask!0 mask!1312)))

(assert (=> d!106303 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377487)))

(declare-fun b!831870 () Bool)

(assert (=> b!831870 (= e!463910 call!36361)))

(declare-fun b!831871 () Bool)

(declare-fun e!463909 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!831871 (= e!463909 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831871 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!831872 () Bool)

(declare-fun e!463906 () Bool)

(assert (=> b!831872 (= e!463906 e!463911)))

(declare-fun c!90334 () Bool)

(assert (=> b!831872 (= c!90334 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831873 () Bool)

(assert (=> b!831873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> b!831873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22756 _values!788)))))

(declare-fun e!463905 () Bool)

(declare-fun apply!373 (ListLongMap!8979 (_ BitVec 64)) V!25285)

(assert (=> b!831873 (= e!463905 (= (apply!373 lt!377487 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831874 () Bool)

(assert (=> b!831874 (= e!463908 e!463906)))

(declare-fun c!90336 () Bool)

(assert (=> b!831874 (= c!90336 e!463909)))

(declare-fun res!566121 () Bool)

(assert (=> b!831874 (=> (not res!566121) (not e!463909))))

(assert (=> b!831874 (= res!566121 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831875 () Bool)

(declare-fun isEmpty!657 (ListLongMap!8979) Bool)

(assert (=> b!831875 (= e!463911 (isEmpty!657 lt!377487))))

(declare-fun b!831876 () Bool)

(assert (=> b!831876 (= e!463907 e!463910)))

(declare-fun c!90335 () Bool)

(assert (=> b!831876 (= c!90335 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831877 () Bool)

(assert (=> b!831877 (= e!463906 e!463905)))

(assert (=> b!831877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun res!566122 () Bool)

(assert (=> b!831877 (= res!566122 (contains!4211 lt!377487 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831877 (=> (not res!566122) (not e!463905))))

(declare-fun b!831878 () Bool)

(declare-fun res!566120 () Bool)

(assert (=> b!831878 (=> (not res!566120) (not e!463908))))

(assert (=> b!831878 (= res!566120 (not (contains!4211 lt!377487 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106303 c!90333) b!831867))

(assert (= (and d!106303 (not c!90333)) b!831876))

(assert (= (and b!831876 c!90335) b!831868))

(assert (= (and b!831876 (not c!90335)) b!831870))

(assert (= (or b!831868 b!831870) bm!36358))

(assert (= (and d!106303 res!566119) b!831878))

(assert (= (and b!831878 res!566120) b!831874))

(assert (= (and b!831874 res!566121) b!831871))

(assert (= (and b!831874 c!90336) b!831877))

(assert (= (and b!831874 (not c!90336)) b!831872))

(assert (= (and b!831877 res!566122) b!831873))

(assert (= (and b!831872 c!90334) b!831869))

(assert (= (and b!831872 (not c!90334)) b!831875))

(declare-fun b_lambda!11403 () Bool)

(assert (=> (not b_lambda!11403) (not b!831868)))

(declare-fun t!22322 () Bool)

(declare-fun tb!4227 () Bool)

(assert (=> (and start!71582 (= defaultEntry!796 defaultEntry!796) t!22322) tb!4227))

(declare-fun result!8021 () Bool)

(assert (=> tb!4227 (= result!8021 tp_is_empty!15213)))

(assert (=> b!831868 t!22322))

(declare-fun b_and!22565 () Bool)

(assert (= b_and!22561 (and (=> t!22322 result!8021) b_and!22565)))

(declare-fun b_lambda!11405 () Bool)

(assert (=> (not b_lambda!11405) (not b!831873)))

(assert (=> b!831873 t!22322))

(declare-fun b_and!22567 () Bool)

(assert (= b_and!22565 (and (=> t!22322 result!8021) b_and!22567)))

(declare-fun m!775789 () Bool)

(assert (=> b!831878 m!775789))

(declare-fun m!775791 () Bool)

(assert (=> b!831871 m!775791))

(assert (=> b!831871 m!775791))

(declare-fun m!775793 () Bool)

(assert (=> b!831871 m!775793))

(assert (=> b!831876 m!775791))

(assert (=> b!831876 m!775791))

(assert (=> b!831876 m!775793))

(declare-fun m!775795 () Bool)

(assert (=> b!831869 m!775795))

(declare-fun m!775797 () Bool)

(assert (=> b!831875 m!775797))

(declare-fun m!775799 () Bool)

(assert (=> b!831868 m!775799))

(declare-fun m!775801 () Bool)

(assert (=> b!831868 m!775801))

(declare-fun m!775803 () Bool)

(assert (=> b!831868 m!775803))

(assert (=> b!831868 m!775791))

(assert (=> b!831868 m!775803))

(assert (=> b!831868 m!775801))

(declare-fun m!775805 () Bool)

(assert (=> b!831868 m!775805))

(declare-fun m!775807 () Bool)

(assert (=> b!831868 m!775807))

(declare-fun m!775809 () Bool)

(assert (=> b!831868 m!775809))

(assert (=> b!831868 m!775807))

(declare-fun m!775811 () Bool)

(assert (=> b!831868 m!775811))

(assert (=> bm!36358 m!775795))

(assert (=> b!831873 m!775791))

(declare-fun m!775813 () Bool)

(assert (=> b!831873 m!775813))

(assert (=> b!831873 m!775801))

(assert (=> b!831873 m!775803))

(assert (=> b!831873 m!775791))

(assert (=> b!831873 m!775803))

(assert (=> b!831873 m!775801))

(assert (=> b!831873 m!775805))

(assert (=> b!831877 m!775791))

(assert (=> b!831877 m!775791))

(declare-fun m!775815 () Bool)

(assert (=> b!831877 m!775815))

(declare-fun m!775817 () Bool)

(assert (=> d!106303 m!775817))

(assert (=> d!106303 m!775715))

(assert (=> b!831801 d!106303))

(declare-fun b!831881 () Bool)

(declare-fun e!463914 () ListLongMap!8979)

(assert (=> b!831881 (= e!463914 (ListLongMap!8980 Nil!15946))))

(declare-fun b!831882 () Bool)

(declare-fun lt!377496 () Unit!28493)

(declare-fun lt!377492 () Unit!28493)

(assert (=> b!831882 (= lt!377496 lt!377492)))

(declare-fun lt!377491 () (_ BitVec 64))

(declare-fun lt!377495 () ListLongMap!8979)

(declare-fun lt!377493 () (_ BitVec 64))

(declare-fun lt!377490 () V!25285)

(assert (=> b!831882 (not (contains!4211 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)) lt!377493))))

(assert (=> b!831882 (= lt!377492 (addStillNotContains!198 lt!377495 lt!377491 lt!377490 lt!377493))))

(assert (=> b!831882 (= lt!377493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831882 (= lt!377490 (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831882 (= lt!377491 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36362 () ListLongMap!8979)

(assert (=> b!831882 (= lt!377495 call!36362)))

(declare-fun e!463917 () ListLongMap!8979)

(assert (=> b!831882 (= e!463917 (+!1983 call!36362 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36359 () Bool)

(assert (=> bm!36359 (= call!36362 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831883 () Bool)

(declare-fun e!463918 () Bool)

(declare-fun lt!377494 () ListLongMap!8979)

(assert (=> b!831883 (= e!463918 (= lt!377494 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!106305 () Bool)

(declare-fun e!463915 () Bool)

(assert (=> d!106305 e!463915))

(declare-fun res!566123 () Bool)

(assert (=> d!106305 (=> (not res!566123) (not e!463915))))

(assert (=> d!106305 (= res!566123 (not (contains!4211 lt!377494 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106305 (= lt!377494 e!463914)))

(declare-fun c!90337 () Bool)

(assert (=> d!106305 (= c!90337 (bvsge #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> d!106305 (validMask!0 mask!1312)))

(assert (=> d!106305 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377494)))

(declare-fun b!831884 () Bool)

(assert (=> b!831884 (= e!463917 call!36362)))

(declare-fun b!831885 () Bool)

(declare-fun e!463916 () Bool)

(assert (=> b!831885 (= e!463916 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831885 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!831886 () Bool)

(declare-fun e!463913 () Bool)

(assert (=> b!831886 (= e!463913 e!463918)))

(declare-fun c!90338 () Bool)

(assert (=> b!831886 (= c!90338 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831887 () Bool)

(assert (=> b!831887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> b!831887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22756 _values!788)))))

(declare-fun e!463912 () Bool)

(assert (=> b!831887 (= e!463912 (= (apply!373 lt!377494 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831888 () Bool)

(assert (=> b!831888 (= e!463915 e!463913)))

(declare-fun c!90340 () Bool)

(assert (=> b!831888 (= c!90340 e!463916)))

(declare-fun res!566125 () Bool)

(assert (=> b!831888 (=> (not res!566125) (not e!463916))))

(assert (=> b!831888 (= res!566125 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831889 () Bool)

(assert (=> b!831889 (= e!463918 (isEmpty!657 lt!377494))))

(declare-fun b!831890 () Bool)

(assert (=> b!831890 (= e!463914 e!463917)))

(declare-fun c!90339 () Bool)

(assert (=> b!831890 (= c!90339 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831891 () Bool)

(assert (=> b!831891 (= e!463913 e!463912)))

(assert (=> b!831891 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun res!566126 () Bool)

(assert (=> b!831891 (= res!566126 (contains!4211 lt!377494 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831891 (=> (not res!566126) (not e!463912))))

(declare-fun b!831892 () Bool)

(declare-fun res!566124 () Bool)

(assert (=> b!831892 (=> (not res!566124) (not e!463915))))

(assert (=> b!831892 (= res!566124 (not (contains!4211 lt!377494 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106305 c!90337) b!831881))

(assert (= (and d!106305 (not c!90337)) b!831890))

(assert (= (and b!831890 c!90339) b!831882))

(assert (= (and b!831890 (not c!90339)) b!831884))

(assert (= (or b!831882 b!831884) bm!36359))

(assert (= (and d!106305 res!566123) b!831892))

(assert (= (and b!831892 res!566124) b!831888))

(assert (= (and b!831888 res!566125) b!831885))

(assert (= (and b!831888 c!90340) b!831891))

(assert (= (and b!831888 (not c!90340)) b!831886))

(assert (= (and b!831891 res!566126) b!831887))

(assert (= (and b!831886 c!90338) b!831883))

(assert (= (and b!831886 (not c!90338)) b!831889))

(declare-fun b_lambda!11407 () Bool)

(assert (=> (not b_lambda!11407) (not b!831882)))

(assert (=> b!831882 t!22322))

(declare-fun b_and!22569 () Bool)

(assert (= b_and!22567 (and (=> t!22322 result!8021) b_and!22569)))

(declare-fun b_lambda!11409 () Bool)

(assert (=> (not b_lambda!11409) (not b!831887)))

(assert (=> b!831887 t!22322))

(declare-fun b_and!22571 () Bool)

(assert (= b_and!22569 (and (=> t!22322 result!8021) b_and!22571)))

(declare-fun m!775819 () Bool)

(assert (=> b!831892 m!775819))

(assert (=> b!831885 m!775791))

(assert (=> b!831885 m!775791))

(assert (=> b!831885 m!775793))

(assert (=> b!831890 m!775791))

(assert (=> b!831890 m!775791))

(assert (=> b!831890 m!775793))

(declare-fun m!775821 () Bool)

(assert (=> b!831883 m!775821))

(declare-fun m!775823 () Bool)

(assert (=> b!831889 m!775823))

(declare-fun m!775825 () Bool)

(assert (=> b!831882 m!775825))

(assert (=> b!831882 m!775801))

(assert (=> b!831882 m!775803))

(assert (=> b!831882 m!775791))

(assert (=> b!831882 m!775803))

(assert (=> b!831882 m!775801))

(assert (=> b!831882 m!775805))

(declare-fun m!775827 () Bool)

(assert (=> b!831882 m!775827))

(declare-fun m!775829 () Bool)

(assert (=> b!831882 m!775829))

(assert (=> b!831882 m!775827))

(declare-fun m!775831 () Bool)

(assert (=> b!831882 m!775831))

(assert (=> bm!36359 m!775821))

(assert (=> b!831887 m!775791))

(declare-fun m!775833 () Bool)

(assert (=> b!831887 m!775833))

(assert (=> b!831887 m!775801))

(assert (=> b!831887 m!775803))

(assert (=> b!831887 m!775791))

(assert (=> b!831887 m!775803))

(assert (=> b!831887 m!775801))

(assert (=> b!831887 m!775805))

(assert (=> b!831891 m!775791))

(assert (=> b!831891 m!775791))

(declare-fun m!775835 () Bool)

(assert (=> b!831891 m!775835))

(declare-fun m!775837 () Bool)

(assert (=> d!106305 m!775837))

(assert (=> d!106305 m!775715))

(assert (=> b!831801 d!106305))

(declare-fun b!831901 () Bool)

(declare-fun e!463926 () Bool)

(declare-fun call!36365 () Bool)

(assert (=> b!831901 (= e!463926 call!36365)))

(declare-fun b!831902 () Bool)

(declare-fun e!463927 () Bool)

(assert (=> b!831902 (= e!463927 call!36365)))

(declare-fun d!106307 () Bool)

(declare-fun res!566131 () Bool)

(declare-fun e!463925 () Bool)

(assert (=> d!106307 (=> res!566131 e!463925)))

(assert (=> d!106307 (= res!566131 (bvsge #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> d!106307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!463925)))

(declare-fun bm!36362 () Bool)

(assert (=> bm!36362 (= call!36365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!831903 () Bool)

(assert (=> b!831903 (= e!463927 e!463926)))

(declare-fun lt!377505 () (_ BitVec 64))

(assert (=> b!831903 (= lt!377505 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377503 () Unit!28493)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46598 (_ BitVec 64) (_ BitVec 32)) Unit!28493)

(assert (=> b!831903 (= lt!377503 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377505 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!831903 (arrayContainsKey!0 _keys!976 lt!377505 #b00000000000000000000000000000000)))

(declare-fun lt!377504 () Unit!28493)

(assert (=> b!831903 (= lt!377504 lt!377503)))

(declare-fun res!566132 () Bool)

(declare-datatypes ((SeekEntryResult!8745 0))(
  ( (MissingZero!8745 (index!37351 (_ BitVec 32))) (Found!8745 (index!37352 (_ BitVec 32))) (Intermediate!8745 (undefined!9557 Bool) (index!37353 (_ BitVec 32)) (x!70140 (_ BitVec 32))) (Undefined!8745) (MissingVacant!8745 (index!37354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46598 (_ BitVec 32)) SeekEntryResult!8745)

(assert (=> b!831903 (= res!566132 (= (seekEntryOrOpen!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8745 #b00000000000000000000000000000000)))))

(assert (=> b!831903 (=> (not res!566132) (not e!463926))))

(declare-fun b!831904 () Bool)

(assert (=> b!831904 (= e!463925 e!463927)))

(declare-fun c!90343 () Bool)

(assert (=> b!831904 (= c!90343 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106307 (not res!566131)) b!831904))

(assert (= (and b!831904 c!90343) b!831903))

(assert (= (and b!831904 (not c!90343)) b!831902))

(assert (= (and b!831903 res!566132) b!831901))

(assert (= (or b!831901 b!831902) bm!36362))

(declare-fun m!775839 () Bool)

(assert (=> bm!36362 m!775839))

(assert (=> b!831903 m!775791))

(declare-fun m!775841 () Bool)

(assert (=> b!831903 m!775841))

(declare-fun m!775843 () Bool)

(assert (=> b!831903 m!775843))

(assert (=> b!831903 m!775791))

(declare-fun m!775845 () Bool)

(assert (=> b!831903 m!775845))

(assert (=> b!831904 m!775791))

(assert (=> b!831904 m!775791))

(assert (=> b!831904 m!775793))

(assert (=> b!831796 d!106307))

(declare-fun d!106309 () Bool)

(declare-fun e!463928 () Bool)

(assert (=> d!106309 e!463928))

(declare-fun res!566133 () Bool)

(assert (=> d!106309 (=> (not res!566133) (not e!463928))))

(declare-fun lt!377509 () ListLongMap!8979)

(assert (=> d!106309 (= res!566133 (contains!4211 lt!377509 (_1!5089 lt!377428)))))

(declare-fun lt!377508 () List!15949)

(assert (=> d!106309 (= lt!377509 (ListLongMap!8980 lt!377508))))

(declare-fun lt!377506 () Unit!28493)

(declare-fun lt!377507 () Unit!28493)

(assert (=> d!106309 (= lt!377506 lt!377507)))

(assert (=> d!106309 (= (getValueByKey!416 lt!377508 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!106309 (= lt!377507 (lemmaContainsTupThenGetReturnValue!230 lt!377508 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106309 (= lt!377508 (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377422 lt!377425)) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106309 (= (+!1983 (+!1983 lt!377422 lt!377425) lt!377428) lt!377509)))

(declare-fun b!831905 () Bool)

(declare-fun res!566134 () Bool)

(assert (=> b!831905 (=> (not res!566134) (not e!463928))))

(assert (=> b!831905 (= res!566134 (= (getValueByKey!416 (toList!4505 lt!377509) (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428))))))

(declare-fun b!831906 () Bool)

(assert (=> b!831906 (= e!463928 (contains!4212 (toList!4505 lt!377509) lt!377428))))

(assert (= (and d!106309 res!566133) b!831905))

(assert (= (and b!831905 res!566134) b!831906))

(declare-fun m!775847 () Bool)

(assert (=> d!106309 m!775847))

(declare-fun m!775849 () Bool)

(assert (=> d!106309 m!775849))

(declare-fun m!775851 () Bool)

(assert (=> d!106309 m!775851))

(declare-fun m!775853 () Bool)

(assert (=> d!106309 m!775853))

(declare-fun m!775855 () Bool)

(assert (=> b!831905 m!775855))

(declare-fun m!775857 () Bool)

(assert (=> b!831906 m!775857))

(assert (=> b!831798 d!106309))

(declare-fun b!831949 () Bool)

(declare-fun e!463955 () ListLongMap!8979)

(declare-fun call!36382 () ListLongMap!8979)

(assert (=> b!831949 (= e!463955 call!36382)))

(declare-fun b!831950 () Bool)

(declare-fun c!90361 () Bool)

(assert (=> b!831950 (= c!90361 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!463959 () ListLongMap!8979)

(assert (=> b!831950 (= e!463955 e!463959)))

(declare-fun call!36380 () ListLongMap!8979)

(declare-fun call!36381 () ListLongMap!8979)

(declare-fun c!90360 () Bool)

(declare-fun call!36385 () ListLongMap!8979)

(declare-fun call!36383 () ListLongMap!8979)

(declare-fun c!90359 () Bool)

(declare-fun bm!36377 () Bool)

(assert (=> bm!36377 (= call!36380 (+!1983 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)) (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831951 () Bool)

(assert (=> b!831951 (= e!463959 call!36382)))

(declare-fun b!831952 () Bool)

(declare-fun e!463964 () ListLongMap!8979)

(assert (=> b!831952 (= e!463964 e!463955)))

(assert (=> b!831952 (= c!90360 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!463956 () Bool)

(declare-fun b!831953 () Bool)

(declare-fun lt!377554 () ListLongMap!8979)

(assert (=> b!831953 (= e!463956 (= (apply!373 lt!377554 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831953 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22756 _values!788)))))

(assert (=> b!831953 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun bm!36378 () Bool)

(assert (=> bm!36378 (= call!36385 call!36381)))

(declare-fun bm!36379 () Bool)

(assert (=> bm!36379 (= call!36383 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun d!106311 () Bool)

(declare-fun e!463958 () Bool)

(assert (=> d!106311 e!463958))

(declare-fun res!566156 () Bool)

(assert (=> d!106311 (=> (not res!566156) (not e!463958))))

(assert (=> d!106311 (= res!566156 (or (bvsge #b00000000000000000000000000000000 (size!22755 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))))

(declare-fun lt!377570 () ListLongMap!8979)

(assert (=> d!106311 (= lt!377554 lt!377570)))

(declare-fun lt!377575 () Unit!28493)

(declare-fun e!463960 () Unit!28493)

(assert (=> d!106311 (= lt!377575 e!463960)))

(declare-fun c!90357 () Bool)

(declare-fun e!463963 () Bool)

(assert (=> d!106311 (= c!90357 e!463963)))

(declare-fun res!566155 () Bool)

(assert (=> d!106311 (=> (not res!566155) (not e!463963))))

(assert (=> d!106311 (= res!566155 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> d!106311 (= lt!377570 e!463964)))

(assert (=> d!106311 (= c!90359 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!106311 (validMask!0 mask!1312)))

(assert (=> d!106311 (= (getCurrentListMap!2601 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377554)))

(declare-fun bm!36380 () Bool)

(declare-fun call!36384 () Bool)

(assert (=> bm!36380 (= call!36384 (contains!4211 lt!377554 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831954 () Bool)

(declare-fun e!463957 () Bool)

(assert (=> b!831954 (= e!463957 (not call!36384))))

(declare-fun b!831955 () Bool)

(declare-fun e!463962 () Bool)

(assert (=> b!831955 (= e!463962 e!463956)))

(declare-fun res!566154 () Bool)

(assert (=> b!831955 (=> (not res!566154) (not e!463956))))

(assert (=> b!831955 (= res!566154 (contains!4211 lt!377554 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831956 () Bool)

(declare-fun e!463961 () Bool)

(assert (=> b!831956 (= e!463957 e!463961)))

(declare-fun res!566157 () Bool)

(assert (=> b!831956 (= res!566157 call!36384)))

(assert (=> b!831956 (=> (not res!566157) (not e!463961))))

(declare-fun b!831957 () Bool)

(declare-fun Unit!28497 () Unit!28493)

(assert (=> b!831957 (= e!463960 Unit!28497)))

(declare-fun bm!36381 () Bool)

(assert (=> bm!36381 (= call!36382 call!36380)))

(declare-fun b!831958 () Bool)

(declare-fun lt!377565 () Unit!28493)

(assert (=> b!831958 (= e!463960 lt!377565)))

(declare-fun lt!377557 () ListLongMap!8979)

(assert (=> b!831958 (= lt!377557 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377564 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377564 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377566 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377566 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377555 () Unit!28493)

(declare-fun addStillContains!324 (ListLongMap!8979 (_ BitVec 64) V!25285 (_ BitVec 64)) Unit!28493)

(assert (=> b!831958 (= lt!377555 (addStillContains!324 lt!377557 lt!377564 zeroValueBefore!34 lt!377566))))

(assert (=> b!831958 (contains!4211 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)) lt!377566)))

(declare-fun lt!377556 () Unit!28493)

(assert (=> b!831958 (= lt!377556 lt!377555)))

(declare-fun lt!377567 () ListLongMap!8979)

(assert (=> b!831958 (= lt!377567 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377568 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377568 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377569 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377569 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377573 () Unit!28493)

(declare-fun addApplyDifferent!324 (ListLongMap!8979 (_ BitVec 64) V!25285 (_ BitVec 64)) Unit!28493)

(assert (=> b!831958 (= lt!377573 (addApplyDifferent!324 lt!377567 lt!377568 minValue!754 lt!377569))))

(assert (=> b!831958 (= (apply!373 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)) lt!377569) (apply!373 lt!377567 lt!377569))))

(declare-fun lt!377558 () Unit!28493)

(assert (=> b!831958 (= lt!377558 lt!377573)))

(declare-fun lt!377561 () ListLongMap!8979)

(assert (=> b!831958 (= lt!377561 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377560 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377560 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377574 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377574 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377562 () Unit!28493)

(assert (=> b!831958 (= lt!377562 (addApplyDifferent!324 lt!377561 lt!377560 zeroValueBefore!34 lt!377574))))

(assert (=> b!831958 (= (apply!373 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)) lt!377574) (apply!373 lt!377561 lt!377574))))

(declare-fun lt!377571 () Unit!28493)

(assert (=> b!831958 (= lt!377571 lt!377562)))

(declare-fun lt!377572 () ListLongMap!8979)

(assert (=> b!831958 (= lt!377572 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377559 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377559 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377563 () (_ BitVec 64))

(assert (=> b!831958 (= lt!377563 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831958 (= lt!377565 (addApplyDifferent!324 lt!377572 lt!377559 minValue!754 lt!377563))))

(assert (=> b!831958 (= (apply!373 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)) lt!377563) (apply!373 lt!377572 lt!377563))))

(declare-fun b!831959 () Bool)

(declare-fun e!463967 () Bool)

(declare-fun call!36386 () Bool)

(assert (=> b!831959 (= e!463967 (not call!36386))))

(declare-fun b!831960 () Bool)

(assert (=> b!831960 (= e!463959 call!36385)))

(declare-fun bm!36382 () Bool)

(assert (=> bm!36382 (= call!36386 (contains!4211 lt!377554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831961 () Bool)

(assert (=> b!831961 (= e!463961 (= (apply!373 lt!377554 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!831962 () Bool)

(assert (=> b!831962 (= e!463963 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831963 () Bool)

(declare-fun res!566158 () Bool)

(assert (=> b!831963 (=> (not res!566158) (not e!463958))))

(assert (=> b!831963 (= res!566158 e!463962)))

(declare-fun res!566161 () Bool)

(assert (=> b!831963 (=> res!566161 e!463962)))

(declare-fun e!463965 () Bool)

(assert (=> b!831963 (= res!566161 (not e!463965))))

(declare-fun res!566153 () Bool)

(assert (=> b!831963 (=> (not res!566153) (not e!463965))))

(assert (=> b!831963 (= res!566153 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831964 () Bool)

(assert (=> b!831964 (= e!463958 e!463957)))

(declare-fun c!90358 () Bool)

(assert (=> b!831964 (= c!90358 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831965 () Bool)

(declare-fun e!463966 () Bool)

(assert (=> b!831965 (= e!463967 e!463966)))

(declare-fun res!566159 () Bool)

(assert (=> b!831965 (= res!566159 call!36386)))

(assert (=> b!831965 (=> (not res!566159) (not e!463966))))

(declare-fun bm!36383 () Bool)

(assert (=> bm!36383 (= call!36381 call!36383)))

(declare-fun b!831966 () Bool)

(assert (=> b!831966 (= e!463966 (= (apply!373 lt!377554 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!831967 () Bool)

(assert (=> b!831967 (= e!463965 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831968 () Bool)

(declare-fun res!566160 () Bool)

(assert (=> b!831968 (=> (not res!566160) (not e!463958))))

(assert (=> b!831968 (= res!566160 e!463967)))

(declare-fun c!90356 () Bool)

(assert (=> b!831968 (= c!90356 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!831969 () Bool)

(assert (=> b!831969 (= e!463964 (+!1983 call!36380 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106311 c!90359) b!831969))

(assert (= (and d!106311 (not c!90359)) b!831952))

(assert (= (and b!831952 c!90360) b!831949))

(assert (= (and b!831952 (not c!90360)) b!831950))

(assert (= (and b!831950 c!90361) b!831951))

(assert (= (and b!831950 (not c!90361)) b!831960))

(assert (= (or b!831951 b!831960) bm!36378))

(assert (= (or b!831949 bm!36378) bm!36383))

(assert (= (or b!831949 b!831951) bm!36381))

(assert (= (or b!831969 bm!36383) bm!36379))

(assert (= (or b!831969 bm!36381) bm!36377))

(assert (= (and d!106311 res!566155) b!831962))

(assert (= (and d!106311 c!90357) b!831958))

(assert (= (and d!106311 (not c!90357)) b!831957))

(assert (= (and d!106311 res!566156) b!831963))

(assert (= (and b!831963 res!566153) b!831967))

(assert (= (and b!831963 (not res!566161)) b!831955))

(assert (= (and b!831955 res!566154) b!831953))

(assert (= (and b!831963 res!566158) b!831968))

(assert (= (and b!831968 c!90356) b!831965))

(assert (= (and b!831968 (not c!90356)) b!831959))

(assert (= (and b!831965 res!566159) b!831966))

(assert (= (or b!831965 b!831959) bm!36382))

(assert (= (and b!831968 res!566160) b!831964))

(assert (= (and b!831964 c!90358) b!831956))

(assert (= (and b!831964 (not c!90358)) b!831954))

(assert (= (and b!831956 res!566157) b!831961))

(assert (= (or b!831956 b!831954) bm!36380))

(declare-fun b_lambda!11411 () Bool)

(assert (=> (not b_lambda!11411) (not b!831953)))

(assert (=> b!831953 t!22322))

(declare-fun b_and!22573 () Bool)

(assert (= b_and!22571 (and (=> t!22322 result!8021) b_and!22573)))

(assert (=> bm!36379 m!775691))

(assert (=> b!831955 m!775791))

(assert (=> b!831955 m!775791))

(declare-fun m!775859 () Bool)

(assert (=> b!831955 m!775859))

(assert (=> b!831953 m!775791))

(declare-fun m!775861 () Bool)

(assert (=> b!831953 m!775861))

(assert (=> b!831953 m!775803))

(assert (=> b!831953 m!775791))

(assert (=> b!831953 m!775803))

(assert (=> b!831953 m!775801))

(assert (=> b!831953 m!775805))

(assert (=> b!831953 m!775801))

(declare-fun m!775863 () Bool)

(assert (=> b!831969 m!775863))

(declare-fun m!775865 () Bool)

(assert (=> b!831958 m!775865))

(declare-fun m!775867 () Bool)

(assert (=> b!831958 m!775867))

(assert (=> b!831958 m!775865))

(assert (=> b!831958 m!775791))

(declare-fun m!775869 () Bool)

(assert (=> b!831958 m!775869))

(declare-fun m!775871 () Bool)

(assert (=> b!831958 m!775871))

(declare-fun m!775873 () Bool)

(assert (=> b!831958 m!775873))

(declare-fun m!775875 () Bool)

(assert (=> b!831958 m!775875))

(declare-fun m!775877 () Bool)

(assert (=> b!831958 m!775877))

(declare-fun m!775879 () Bool)

(assert (=> b!831958 m!775879))

(declare-fun m!775881 () Bool)

(assert (=> b!831958 m!775881))

(assert (=> b!831958 m!775691))

(declare-fun m!775883 () Bool)

(assert (=> b!831958 m!775883))

(declare-fun m!775885 () Bool)

(assert (=> b!831958 m!775885))

(assert (=> b!831958 m!775873))

(declare-fun m!775887 () Bool)

(assert (=> b!831958 m!775887))

(declare-fun m!775889 () Bool)

(assert (=> b!831958 m!775889))

(declare-fun m!775891 () Bool)

(assert (=> b!831958 m!775891))

(assert (=> b!831958 m!775875))

(declare-fun m!775893 () Bool)

(assert (=> b!831958 m!775893))

(assert (=> b!831958 m!775889))

(assert (=> b!831962 m!775791))

(assert (=> b!831962 m!775791))

(assert (=> b!831962 m!775793))

(declare-fun m!775895 () Bool)

(assert (=> bm!36377 m!775895))

(assert (=> d!106311 m!775715))

(assert (=> b!831967 m!775791))

(assert (=> b!831967 m!775791))

(assert (=> b!831967 m!775793))

(declare-fun m!775897 () Bool)

(assert (=> b!831966 m!775897))

(declare-fun m!775899 () Bool)

(assert (=> bm!36380 m!775899))

(declare-fun m!775901 () Bool)

(assert (=> bm!36382 m!775901))

(declare-fun m!775903 () Bool)

(assert (=> b!831961 m!775903))

(assert (=> b!831798 d!106311))

(declare-fun d!106313 () Bool)

(declare-fun e!463968 () Bool)

(assert (=> d!106313 e!463968))

(declare-fun res!566162 () Bool)

(assert (=> d!106313 (=> (not res!566162) (not e!463968))))

(declare-fun lt!377579 () ListLongMap!8979)

(assert (=> d!106313 (= res!566162 (contains!4211 lt!377579 (_1!5089 lt!377425)))))

(declare-fun lt!377578 () List!15949)

(assert (=> d!106313 (= lt!377579 (ListLongMap!8980 lt!377578))))

(declare-fun lt!377576 () Unit!28493)

(declare-fun lt!377577 () Unit!28493)

(assert (=> d!106313 (= lt!377576 lt!377577)))

(assert (=> d!106313 (= (getValueByKey!416 lt!377578 (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425)))))

(assert (=> d!106313 (= lt!377577 (lemmaContainsTupThenGetReturnValue!230 lt!377578 (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(assert (=> d!106313 (= lt!377578 (insertStrictlySorted!269 (toList!4505 lt!377422) (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(assert (=> d!106313 (= (+!1983 lt!377422 lt!377425) lt!377579)))

(declare-fun b!831970 () Bool)

(declare-fun res!566163 () Bool)

(assert (=> b!831970 (=> (not res!566163) (not e!463968))))

(assert (=> b!831970 (= res!566163 (= (getValueByKey!416 (toList!4505 lt!377579) (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425))))))

(declare-fun b!831971 () Bool)

(assert (=> b!831971 (= e!463968 (contains!4212 (toList!4505 lt!377579) lt!377425))))

(assert (= (and d!106313 res!566162) b!831970))

(assert (= (and b!831970 res!566163) b!831971))

(declare-fun m!775905 () Bool)

(assert (=> d!106313 m!775905))

(declare-fun m!775907 () Bool)

(assert (=> d!106313 m!775907))

(declare-fun m!775909 () Bool)

(assert (=> d!106313 m!775909))

(declare-fun m!775911 () Bool)

(assert (=> d!106313 m!775911))

(declare-fun m!775913 () Bool)

(assert (=> b!831970 m!775913))

(declare-fun m!775915 () Bool)

(assert (=> b!831971 m!775915))

(assert (=> b!831798 d!106313))

(declare-fun b!831972 () Bool)

(declare-fun e!463969 () ListLongMap!8979)

(declare-fun call!36389 () ListLongMap!8979)

(assert (=> b!831972 (= e!463969 call!36389)))

(declare-fun b!831973 () Bool)

(declare-fun c!90367 () Bool)

(assert (=> b!831973 (= c!90367 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!463973 () ListLongMap!8979)

(assert (=> b!831973 (= e!463969 e!463973)))

(declare-fun call!36390 () ListLongMap!8979)

(declare-fun c!90365 () Bool)

(declare-fun call!36388 () ListLongMap!8979)

(declare-fun call!36392 () ListLongMap!8979)

(declare-fun c!90366 () Bool)

(declare-fun bm!36384 () Bool)

(declare-fun call!36387 () ListLongMap!8979)

(assert (=> bm!36384 (= call!36387 (+!1983 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)) (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831974 () Bool)

(assert (=> b!831974 (= e!463973 call!36389)))

(declare-fun b!831975 () Bool)

(declare-fun e!463978 () ListLongMap!8979)

(assert (=> b!831975 (= e!463978 e!463969)))

(assert (=> b!831975 (= c!90366 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831976 () Bool)

(declare-fun e!463970 () Bool)

(declare-fun lt!377580 () ListLongMap!8979)

(assert (=> b!831976 (= e!463970 (= (apply!373 lt!377580 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22756 _values!788)))))

(assert (=> b!831976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun bm!36385 () Bool)

(assert (=> bm!36385 (= call!36392 call!36388)))

(declare-fun bm!36386 () Bool)

(assert (=> bm!36386 (= call!36390 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun d!106315 () Bool)

(declare-fun e!463972 () Bool)

(assert (=> d!106315 e!463972))

(declare-fun res!566167 () Bool)

(assert (=> d!106315 (=> (not res!566167) (not e!463972))))

(assert (=> d!106315 (= res!566167 (or (bvsge #b00000000000000000000000000000000 (size!22755 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))))

(declare-fun lt!377596 () ListLongMap!8979)

(assert (=> d!106315 (= lt!377580 lt!377596)))

(declare-fun lt!377601 () Unit!28493)

(declare-fun e!463974 () Unit!28493)

(assert (=> d!106315 (= lt!377601 e!463974)))

(declare-fun c!90363 () Bool)

(declare-fun e!463977 () Bool)

(assert (=> d!106315 (= c!90363 e!463977)))

(declare-fun res!566166 () Bool)

(assert (=> d!106315 (=> (not res!566166) (not e!463977))))

(assert (=> d!106315 (= res!566166 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> d!106315 (= lt!377596 e!463978)))

(assert (=> d!106315 (= c!90365 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!106315 (validMask!0 mask!1312)))

(assert (=> d!106315 (= (getCurrentListMap!2601 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377580)))

(declare-fun bm!36387 () Bool)

(declare-fun call!36391 () Bool)

(assert (=> bm!36387 (= call!36391 (contains!4211 lt!377580 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831977 () Bool)

(declare-fun e!463971 () Bool)

(assert (=> b!831977 (= e!463971 (not call!36391))))

(declare-fun b!831978 () Bool)

(declare-fun e!463976 () Bool)

(assert (=> b!831978 (= e!463976 e!463970)))

(declare-fun res!566165 () Bool)

(assert (=> b!831978 (=> (not res!566165) (not e!463970))))

(assert (=> b!831978 (= res!566165 (contains!4211 lt!377580 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831979 () Bool)

(declare-fun e!463975 () Bool)

(assert (=> b!831979 (= e!463971 e!463975)))

(declare-fun res!566168 () Bool)

(assert (=> b!831979 (= res!566168 call!36391)))

(assert (=> b!831979 (=> (not res!566168) (not e!463975))))

(declare-fun b!831980 () Bool)

(declare-fun Unit!28498 () Unit!28493)

(assert (=> b!831980 (= e!463974 Unit!28498)))

(declare-fun bm!36388 () Bool)

(assert (=> bm!36388 (= call!36389 call!36387)))

(declare-fun b!831981 () Bool)

(declare-fun lt!377591 () Unit!28493)

(assert (=> b!831981 (= e!463974 lt!377591)))

(declare-fun lt!377583 () ListLongMap!8979)

(assert (=> b!831981 (= lt!377583 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377590 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377590 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377592 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377592 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377581 () Unit!28493)

(assert (=> b!831981 (= lt!377581 (addStillContains!324 lt!377583 lt!377590 zeroValueAfter!34 lt!377592))))

(assert (=> b!831981 (contains!4211 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)) lt!377592)))

(declare-fun lt!377582 () Unit!28493)

(assert (=> b!831981 (= lt!377582 lt!377581)))

(declare-fun lt!377593 () ListLongMap!8979)

(assert (=> b!831981 (= lt!377593 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377594 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377594 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377595 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377595 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377599 () Unit!28493)

(assert (=> b!831981 (= lt!377599 (addApplyDifferent!324 lt!377593 lt!377594 minValue!754 lt!377595))))

(assert (=> b!831981 (= (apply!373 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)) lt!377595) (apply!373 lt!377593 lt!377595))))

(declare-fun lt!377584 () Unit!28493)

(assert (=> b!831981 (= lt!377584 lt!377599)))

(declare-fun lt!377587 () ListLongMap!8979)

(assert (=> b!831981 (= lt!377587 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377586 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377600 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377600 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377588 () Unit!28493)

(assert (=> b!831981 (= lt!377588 (addApplyDifferent!324 lt!377587 lt!377586 zeroValueAfter!34 lt!377600))))

(assert (=> b!831981 (= (apply!373 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)) lt!377600) (apply!373 lt!377587 lt!377600))))

(declare-fun lt!377597 () Unit!28493)

(assert (=> b!831981 (= lt!377597 lt!377588)))

(declare-fun lt!377598 () ListLongMap!8979)

(assert (=> b!831981 (= lt!377598 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377585 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377589 () (_ BitVec 64))

(assert (=> b!831981 (= lt!377589 (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831981 (= lt!377591 (addApplyDifferent!324 lt!377598 lt!377585 minValue!754 lt!377589))))

(assert (=> b!831981 (= (apply!373 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)) lt!377589) (apply!373 lt!377598 lt!377589))))

(declare-fun b!831982 () Bool)

(declare-fun e!463981 () Bool)

(declare-fun call!36393 () Bool)

(assert (=> b!831982 (= e!463981 (not call!36393))))

(declare-fun b!831983 () Bool)

(assert (=> b!831983 (= e!463973 call!36392)))

(declare-fun bm!36389 () Bool)

(assert (=> bm!36389 (= call!36393 (contains!4211 lt!377580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831984 () Bool)

(assert (=> b!831984 (= e!463975 (= (apply!373 lt!377580 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!831985 () Bool)

(assert (=> b!831985 (= e!463977 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831986 () Bool)

(declare-fun res!566169 () Bool)

(assert (=> b!831986 (=> (not res!566169) (not e!463972))))

(assert (=> b!831986 (= res!566169 e!463976)))

(declare-fun res!566172 () Bool)

(assert (=> b!831986 (=> res!566172 e!463976)))

(declare-fun e!463979 () Bool)

(assert (=> b!831986 (= res!566172 (not e!463979))))

(declare-fun res!566164 () Bool)

(assert (=> b!831986 (=> (not res!566164) (not e!463979))))

(assert (=> b!831986 (= res!566164 (bvslt #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(declare-fun b!831987 () Bool)

(assert (=> b!831987 (= e!463972 e!463971)))

(declare-fun c!90364 () Bool)

(assert (=> b!831987 (= c!90364 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831988 () Bool)

(declare-fun e!463980 () Bool)

(assert (=> b!831988 (= e!463981 e!463980)))

(declare-fun res!566170 () Bool)

(assert (=> b!831988 (= res!566170 call!36393)))

(assert (=> b!831988 (=> (not res!566170) (not e!463980))))

(declare-fun bm!36390 () Bool)

(assert (=> bm!36390 (= call!36388 call!36390)))

(declare-fun b!831989 () Bool)

(assert (=> b!831989 (= e!463980 (= (apply!373 lt!377580 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!831990 () Bool)

(assert (=> b!831990 (= e!463979 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831991 () Bool)

(declare-fun res!566171 () Bool)

(assert (=> b!831991 (=> (not res!566171) (not e!463972))))

(assert (=> b!831991 (= res!566171 e!463981)))

(declare-fun c!90362 () Bool)

(assert (=> b!831991 (= c!90362 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!831992 () Bool)

(assert (=> b!831992 (= e!463978 (+!1983 call!36387 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106315 c!90365) b!831992))

(assert (= (and d!106315 (not c!90365)) b!831975))

(assert (= (and b!831975 c!90366) b!831972))

(assert (= (and b!831975 (not c!90366)) b!831973))

(assert (= (and b!831973 c!90367) b!831974))

(assert (= (and b!831973 (not c!90367)) b!831983))

(assert (= (or b!831974 b!831983) bm!36385))

(assert (= (or b!831972 bm!36385) bm!36390))

(assert (= (or b!831972 b!831974) bm!36388))

(assert (= (or b!831992 bm!36390) bm!36386))

(assert (= (or b!831992 bm!36388) bm!36384))

(assert (= (and d!106315 res!566166) b!831985))

(assert (= (and d!106315 c!90363) b!831981))

(assert (= (and d!106315 (not c!90363)) b!831980))

(assert (= (and d!106315 res!566167) b!831986))

(assert (= (and b!831986 res!566164) b!831990))

(assert (= (and b!831986 (not res!566172)) b!831978))

(assert (= (and b!831978 res!566165) b!831976))

(assert (= (and b!831986 res!566169) b!831991))

(assert (= (and b!831991 c!90362) b!831988))

(assert (= (and b!831991 (not c!90362)) b!831982))

(assert (= (and b!831988 res!566170) b!831989))

(assert (= (or b!831988 b!831982) bm!36389))

(assert (= (and b!831991 res!566171) b!831987))

(assert (= (and b!831987 c!90364) b!831979))

(assert (= (and b!831987 (not c!90364)) b!831977))

(assert (= (and b!831979 res!566168) b!831984))

(assert (= (or b!831979 b!831977) bm!36387))

(declare-fun b_lambda!11413 () Bool)

(assert (=> (not b_lambda!11413) (not b!831976)))

(assert (=> b!831976 t!22322))

(declare-fun b_and!22575 () Bool)

(assert (= b_and!22573 (and (=> t!22322 result!8021) b_and!22575)))

(assert (=> bm!36386 m!775689))

(assert (=> b!831978 m!775791))

(assert (=> b!831978 m!775791))

(declare-fun m!775917 () Bool)

(assert (=> b!831978 m!775917))

(assert (=> b!831976 m!775791))

(declare-fun m!775919 () Bool)

(assert (=> b!831976 m!775919))

(assert (=> b!831976 m!775803))

(assert (=> b!831976 m!775791))

(assert (=> b!831976 m!775803))

(assert (=> b!831976 m!775801))

(assert (=> b!831976 m!775805))

(assert (=> b!831976 m!775801))

(declare-fun m!775921 () Bool)

(assert (=> b!831992 m!775921))

(declare-fun m!775923 () Bool)

(assert (=> b!831981 m!775923))

(declare-fun m!775925 () Bool)

(assert (=> b!831981 m!775925))

(assert (=> b!831981 m!775923))

(assert (=> b!831981 m!775791))

(declare-fun m!775927 () Bool)

(assert (=> b!831981 m!775927))

(declare-fun m!775929 () Bool)

(assert (=> b!831981 m!775929))

(declare-fun m!775931 () Bool)

(assert (=> b!831981 m!775931))

(declare-fun m!775933 () Bool)

(assert (=> b!831981 m!775933))

(declare-fun m!775935 () Bool)

(assert (=> b!831981 m!775935))

(declare-fun m!775937 () Bool)

(assert (=> b!831981 m!775937))

(declare-fun m!775939 () Bool)

(assert (=> b!831981 m!775939))

(assert (=> b!831981 m!775689))

(declare-fun m!775941 () Bool)

(assert (=> b!831981 m!775941))

(declare-fun m!775943 () Bool)

(assert (=> b!831981 m!775943))

(assert (=> b!831981 m!775931))

(declare-fun m!775945 () Bool)

(assert (=> b!831981 m!775945))

(declare-fun m!775947 () Bool)

(assert (=> b!831981 m!775947))

(declare-fun m!775949 () Bool)

(assert (=> b!831981 m!775949))

(assert (=> b!831981 m!775933))

(declare-fun m!775951 () Bool)

(assert (=> b!831981 m!775951))

(assert (=> b!831981 m!775947))

(assert (=> b!831985 m!775791))

(assert (=> b!831985 m!775791))

(assert (=> b!831985 m!775793))

(declare-fun m!775953 () Bool)

(assert (=> bm!36384 m!775953))

(assert (=> d!106315 m!775715))

(assert (=> b!831990 m!775791))

(assert (=> b!831990 m!775791))

(assert (=> b!831990 m!775793))

(declare-fun m!775955 () Bool)

(assert (=> b!831989 m!775955))

(declare-fun m!775957 () Bool)

(assert (=> bm!36387 m!775957))

(declare-fun m!775959 () Bool)

(assert (=> bm!36389 m!775959))

(declare-fun m!775961 () Bool)

(assert (=> b!831984 m!775961))

(assert (=> b!831798 d!106315))

(declare-fun d!106317 () Bool)

(declare-fun e!463982 () Bool)

(assert (=> d!106317 e!463982))

(declare-fun res!566173 () Bool)

(assert (=> d!106317 (=> (not res!566173) (not e!463982))))

(declare-fun lt!377605 () ListLongMap!8979)

(assert (=> d!106317 (= res!566173 (contains!4211 lt!377605 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377604 () List!15949)

(assert (=> d!106317 (= lt!377605 (ListLongMap!8980 lt!377604))))

(declare-fun lt!377602 () Unit!28493)

(declare-fun lt!377603 () Unit!28493)

(assert (=> d!106317 (= lt!377602 lt!377603)))

(assert (=> d!106317 (= (getValueByKey!416 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106317 (= lt!377603 (lemmaContainsTupThenGetReturnValue!230 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106317 (= lt!377604 (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377423 lt!377428)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106317 (= (+!1983 (+!1983 lt!377423 lt!377428) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377605)))

(declare-fun b!831993 () Bool)

(declare-fun res!566174 () Bool)

(assert (=> b!831993 (=> (not res!566174) (not e!463982))))

(assert (=> b!831993 (= res!566174 (= (getValueByKey!416 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831994 () Bool)

(assert (=> b!831994 (= e!463982 (contains!4212 (toList!4505 lt!377605) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106317 res!566173) b!831993))

(assert (= (and b!831993 res!566174) b!831994))

(declare-fun m!775963 () Bool)

(assert (=> d!106317 m!775963))

(declare-fun m!775965 () Bool)

(assert (=> d!106317 m!775965))

(declare-fun m!775967 () Bool)

(assert (=> d!106317 m!775967))

(declare-fun m!775969 () Bool)

(assert (=> d!106317 m!775969))

(declare-fun m!775971 () Bool)

(assert (=> b!831993 m!775971))

(declare-fun m!775973 () Bool)

(assert (=> b!831994 m!775973))

(assert (=> b!831798 d!106317))

(declare-fun d!106319 () Bool)

(declare-fun e!463983 () Bool)

(assert (=> d!106319 e!463983))

(declare-fun res!566175 () Bool)

(assert (=> d!106319 (=> (not res!566175) (not e!463983))))

(declare-fun lt!377609 () ListLongMap!8979)

(assert (=> d!106319 (= res!566175 (contains!4211 lt!377609 (_1!5089 lt!377428)))))

(declare-fun lt!377608 () List!15949)

(assert (=> d!106319 (= lt!377609 (ListLongMap!8980 lt!377608))))

(declare-fun lt!377606 () Unit!28493)

(declare-fun lt!377607 () Unit!28493)

(assert (=> d!106319 (= lt!377606 lt!377607)))

(assert (=> d!106319 (= (getValueByKey!416 lt!377608 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!106319 (= lt!377607 (lemmaContainsTupThenGetReturnValue!230 lt!377608 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106319 (= lt!377608 (insertStrictlySorted!269 (toList!4505 lt!377423) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106319 (= (+!1983 lt!377423 lt!377428) lt!377609)))

(declare-fun b!831995 () Bool)

(declare-fun res!566176 () Bool)

(assert (=> b!831995 (=> (not res!566176) (not e!463983))))

(assert (=> b!831995 (= res!566176 (= (getValueByKey!416 (toList!4505 lt!377609) (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428))))))

(declare-fun b!831996 () Bool)

(assert (=> b!831996 (= e!463983 (contains!4212 (toList!4505 lt!377609) lt!377428))))

(assert (= (and d!106319 res!566175) b!831995))

(assert (= (and b!831995 res!566176) b!831996))

(declare-fun m!775975 () Bool)

(assert (=> d!106319 m!775975))

(declare-fun m!775977 () Bool)

(assert (=> d!106319 m!775977))

(declare-fun m!775979 () Bool)

(assert (=> d!106319 m!775979))

(declare-fun m!775981 () Bool)

(assert (=> d!106319 m!775981))

(declare-fun m!775983 () Bool)

(assert (=> b!831995 m!775983))

(declare-fun m!775985 () Bool)

(assert (=> b!831996 m!775985))

(assert (=> b!831798 d!106319))

(declare-fun d!106321 () Bool)

(assert (=> d!106321 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71582 d!106321))

(declare-fun d!106323 () Bool)

(assert (=> d!106323 (= (array_inv!17787 _keys!976) (bvsge (size!22755 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71582 d!106323))

(declare-fun d!106325 () Bool)

(assert (=> d!106325 (= (array_inv!17788 _values!788) (bvsge (size!22756 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71582 d!106325))

(declare-fun d!106327 () Bool)

(declare-fun e!463984 () Bool)

(assert (=> d!106327 e!463984))

(declare-fun res!566177 () Bool)

(assert (=> d!106327 (=> (not res!566177) (not e!463984))))

(declare-fun lt!377613 () ListLongMap!8979)

(assert (=> d!106327 (= res!566177 (contains!4211 lt!377613 (_1!5089 lt!377428)))))

(declare-fun lt!377612 () List!15949)

(assert (=> d!106327 (= lt!377613 (ListLongMap!8980 lt!377612))))

(declare-fun lt!377610 () Unit!28493)

(declare-fun lt!377611 () Unit!28493)

(assert (=> d!106327 (= lt!377610 lt!377611)))

(assert (=> d!106327 (= (getValueByKey!416 lt!377612 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!106327 (= lt!377611 (lemmaContainsTupThenGetReturnValue!230 lt!377612 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106327 (= lt!377612 (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(assert (=> d!106327 (= (+!1983 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377428) lt!377613)))

(declare-fun b!831997 () Bool)

(declare-fun res!566178 () Bool)

(assert (=> b!831997 (=> (not res!566178) (not e!463984))))

(assert (=> b!831997 (= res!566178 (= (getValueByKey!416 (toList!4505 lt!377613) (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428))))))

(declare-fun b!831998 () Bool)

(assert (=> b!831998 (= e!463984 (contains!4212 (toList!4505 lt!377613) lt!377428))))

(assert (= (and d!106327 res!566177) b!831997))

(assert (= (and b!831997 res!566178) b!831998))

(declare-fun m!775987 () Bool)

(assert (=> d!106327 m!775987))

(declare-fun m!775989 () Bool)

(assert (=> d!106327 m!775989))

(declare-fun m!775991 () Bool)

(assert (=> d!106327 m!775991))

(declare-fun m!775993 () Bool)

(assert (=> d!106327 m!775993))

(declare-fun m!775995 () Bool)

(assert (=> b!831997 m!775995))

(declare-fun m!775997 () Bool)

(assert (=> b!831998 m!775997))

(assert (=> b!831795 d!106327))

(declare-fun d!106329 () Bool)

(declare-fun e!463985 () Bool)

(assert (=> d!106329 e!463985))

(declare-fun res!566179 () Bool)

(assert (=> d!106329 (=> (not res!566179) (not e!463985))))

(declare-fun lt!377617 () ListLongMap!8979)

(assert (=> d!106329 (= res!566179 (contains!4211 lt!377617 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377616 () List!15949)

(assert (=> d!106329 (= lt!377617 (ListLongMap!8980 lt!377616))))

(declare-fun lt!377614 () Unit!28493)

(declare-fun lt!377615 () Unit!28493)

(assert (=> d!106329 (= lt!377614 lt!377615)))

(assert (=> d!106329 (= (getValueByKey!416 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106329 (= lt!377615 (lemmaContainsTupThenGetReturnValue!230 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106329 (= lt!377616 (insertStrictlySorted!269 (toList!4505 lt!377423) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106329 (= (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377617)))

(declare-fun b!831999 () Bool)

(declare-fun res!566180 () Bool)

(assert (=> b!831999 (=> (not res!566180) (not e!463985))))

(assert (=> b!831999 (= res!566180 (= (getValueByKey!416 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832000 () Bool)

(assert (=> b!832000 (= e!463985 (contains!4212 (toList!4505 lt!377617) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106329 res!566179) b!831999))

(assert (= (and b!831999 res!566180) b!832000))

(declare-fun m!775999 () Bool)

(assert (=> d!106329 m!775999))

(declare-fun m!776001 () Bool)

(assert (=> d!106329 m!776001))

(declare-fun m!776003 () Bool)

(assert (=> d!106329 m!776003))

(declare-fun m!776005 () Bool)

(assert (=> d!106329 m!776005))

(declare-fun m!776007 () Bool)

(assert (=> b!831999 m!776007))

(declare-fun m!776009 () Bool)

(assert (=> b!832000 m!776009))

(assert (=> b!831795 d!106329))

(declare-fun b!832011 () Bool)

(declare-fun e!463995 () Bool)

(declare-fun e!463996 () Bool)

(assert (=> b!832011 (= e!463995 e!463996)))

(declare-fun c!90370 () Bool)

(assert (=> b!832011 (= c!90370 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832012 () Bool)

(declare-fun e!463997 () Bool)

(declare-fun contains!4213 (List!15950 (_ BitVec 64)) Bool)

(assert (=> b!832012 (= e!463997 (contains!4213 Nil!15947 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832013 () Bool)

(declare-fun call!36396 () Bool)

(assert (=> b!832013 (= e!463996 call!36396)))

(declare-fun d!106331 () Bool)

(declare-fun res!566187 () Bool)

(declare-fun e!463994 () Bool)

(assert (=> d!106331 (=> res!566187 e!463994)))

(assert (=> d!106331 (= res!566187 (bvsge #b00000000000000000000000000000000 (size!22755 _keys!976)))))

(assert (=> d!106331 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15947) e!463994)))

(declare-fun b!832014 () Bool)

(assert (=> b!832014 (= e!463996 call!36396)))

(declare-fun bm!36393 () Bool)

(assert (=> bm!36393 (= call!36396 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)))))

(declare-fun b!832015 () Bool)

(assert (=> b!832015 (= e!463994 e!463995)))

(declare-fun res!566189 () Bool)

(assert (=> b!832015 (=> (not res!566189) (not e!463995))))

(assert (=> b!832015 (= res!566189 (not e!463997))))

(declare-fun res!566188 () Bool)

(assert (=> b!832015 (=> (not res!566188) (not e!463997))))

(assert (=> b!832015 (= res!566188 (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106331 (not res!566187)) b!832015))

(assert (= (and b!832015 res!566188) b!832012))

(assert (= (and b!832015 res!566189) b!832011))

(assert (= (and b!832011 c!90370) b!832013))

(assert (= (and b!832011 (not c!90370)) b!832014))

(assert (= (or b!832013 b!832014) bm!36393))

(assert (=> b!832011 m!775791))

(assert (=> b!832011 m!775791))

(assert (=> b!832011 m!775793))

(assert (=> b!832012 m!775791))

(assert (=> b!832012 m!775791))

(declare-fun m!776011 () Bool)

(assert (=> b!832012 m!776011))

(assert (=> bm!36393 m!775791))

(declare-fun m!776013 () Bool)

(assert (=> bm!36393 m!776013))

(assert (=> b!832015 m!775791))

(assert (=> b!832015 m!775791))

(assert (=> b!832015 m!775793))

(assert (=> b!831804 d!106331))

(declare-fun mapIsEmpty!24483 () Bool)

(declare-fun mapRes!24483 () Bool)

(assert (=> mapIsEmpty!24483 mapRes!24483))

(declare-fun condMapEmpty!24483 () Bool)

(declare-fun mapDefault!24483 () ValueCell!7191)

(assert (=> mapNonEmpty!24477 (= condMapEmpty!24483 (= mapRest!24477 ((as const (Array (_ BitVec 32) ValueCell!7191)) mapDefault!24483)))))

(declare-fun e!464002 () Bool)

(assert (=> mapNonEmpty!24477 (= tp!47300 (and e!464002 mapRes!24483))))

(declare-fun b!832022 () Bool)

(declare-fun e!464003 () Bool)

(assert (=> b!832022 (= e!464003 tp_is_empty!15213)))

(declare-fun mapNonEmpty!24483 () Bool)

(declare-fun tp!47310 () Bool)

(assert (=> mapNonEmpty!24483 (= mapRes!24483 (and tp!47310 e!464003))))

(declare-fun mapKey!24483 () (_ BitVec 32))

(declare-fun mapValue!24483 () ValueCell!7191)

(declare-fun mapRest!24483 () (Array (_ BitVec 32) ValueCell!7191))

(assert (=> mapNonEmpty!24483 (= mapRest!24477 (store mapRest!24483 mapKey!24483 mapValue!24483))))

(declare-fun b!832023 () Bool)

(assert (=> b!832023 (= e!464002 tp_is_empty!15213)))

(assert (= (and mapNonEmpty!24477 condMapEmpty!24483) mapIsEmpty!24483))

(assert (= (and mapNonEmpty!24477 (not condMapEmpty!24483)) mapNonEmpty!24483))

(assert (= (and mapNonEmpty!24483 ((_ is ValueCellFull!7191) mapValue!24483)) b!832022))

(assert (= (and mapNonEmpty!24477 ((_ is ValueCellFull!7191) mapDefault!24483)) b!832023))

(declare-fun m!776015 () Bool)

(assert (=> mapNonEmpty!24483 m!776015))

(declare-fun b_lambda!11415 () Bool)

(assert (= b_lambda!11409 (or (and start!71582 b_free!13503) b_lambda!11415)))

(declare-fun b_lambda!11417 () Bool)

(assert (= b_lambda!11407 (or (and start!71582 b_free!13503) b_lambda!11417)))

(declare-fun b_lambda!11419 () Bool)

(assert (= b_lambda!11403 (or (and start!71582 b_free!13503) b_lambda!11419)))

(declare-fun b_lambda!11421 () Bool)

(assert (= b_lambda!11411 (or (and start!71582 b_free!13503) b_lambda!11421)))

(declare-fun b_lambda!11423 () Bool)

(assert (= b_lambda!11405 (or (and start!71582 b_free!13503) b_lambda!11423)))

(declare-fun b_lambda!11425 () Bool)

(assert (= b_lambda!11413 (or (and start!71582 b_free!13503) b_lambda!11425)))

(check-sat (not b!831971) (not d!106303) (not b!832015) (not b!831903) (not bm!36362) (not b_next!13503) (not b_lambda!11423) (not b!831978) (not b!831999) (not d!106315) (not b!831997) (not b!831906) (not d!106327) (not b!831877) (not b!831970) (not b!831904) (not bm!36384) (not b!831905) (not b_lambda!11421) (not b!831871) (not b!831878) (not b!831869) (not b!831955) (not d!106301) (not mapNonEmpty!24483) (not b!831969) (not b!831981) (not d!106329) tp_is_empty!15213 (not bm!36389) (not bm!36359) (not b!831994) (not b!831953) (not b!831993) (not b!831958) (not d!106299) (not b!831990) (not b!832000) (not b!831839) (not bm!36393) (not b!831868) (not b!831992) (not b!831873) (not b!831998) (not b!832011) (not bm!36380) (not b!831887) (not b!831989) (not d!106311) (not b_lambda!11425) (not b_lambda!11417) (not bm!36377) (not d!106305) (not b!832012) (not d!106309) (not d!106313) (not b!831875) (not b!831882) (not bm!36382) (not b!831966) (not b!831996) (not b!831976) (not d!106297) (not b!831876) b_and!22575 (not b!831967) (not bm!36379) (not bm!36386) (not b!831962) (not b!831883) (not b!831995) (not bm!36358) (not b!831840) (not b!831892) (not b_lambda!11419) (not bm!36387) (not d!106317) (not b_lambda!11415) (not b!831891) (not b!831841) (not b!831889) (not b!831984) (not b!831890) (not b!831885) (not b!831961) (not b!831985) (not d!106319) (not b!831842))
(check-sat b_and!22575 (not b_next!13503))
(get-model)

(declare-fun d!106333 () Bool)

(declare-fun e!464008 () Bool)

(assert (=> d!106333 e!464008))

(declare-fun res!566192 () Bool)

(assert (=> d!106333 (=> res!566192 e!464008)))

(declare-fun lt!377629 () Bool)

(assert (=> d!106333 (= res!566192 (not lt!377629))))

(declare-fun lt!377628 () Bool)

(assert (=> d!106333 (= lt!377629 lt!377628)))

(declare-fun lt!377627 () Unit!28493)

(declare-fun e!464009 () Unit!28493)

(assert (=> d!106333 (= lt!377627 e!464009)))

(declare-fun c!90373 () Bool)

(assert (=> d!106333 (= c!90373 lt!377628)))

(declare-fun containsKey!402 (List!15949 (_ BitVec 64)) Bool)

(assert (=> d!106333 (= lt!377628 (containsKey!402 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106333 (= (contains!4211 lt!377487 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!377629)))

(declare-fun b!832030 () Bool)

(declare-fun lt!377626 () Unit!28493)

(assert (=> b!832030 (= e!464009 lt!377626)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!311 (List!15949 (_ BitVec 64)) Unit!28493)

(assert (=> b!832030 (= lt!377626 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun isDefined!312 (Option!422) Bool)

(assert (=> b!832030 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832031 () Bool)

(declare-fun Unit!28499 () Unit!28493)

(assert (=> b!832031 (= e!464009 Unit!28499)))

(declare-fun b!832032 () Bool)

(assert (=> b!832032 (= e!464008 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106333 c!90373) b!832030))

(assert (= (and d!106333 (not c!90373)) b!832031))

(assert (= (and d!106333 (not res!566192)) b!832032))

(assert (=> d!106333 m!775791))

(declare-fun m!776017 () Bool)

(assert (=> d!106333 m!776017))

(assert (=> b!832030 m!775791))

(declare-fun m!776019 () Bool)

(assert (=> b!832030 m!776019))

(assert (=> b!832030 m!775791))

(declare-fun m!776021 () Bool)

(assert (=> b!832030 m!776021))

(assert (=> b!832030 m!776021))

(declare-fun m!776023 () Bool)

(assert (=> b!832030 m!776023))

(assert (=> b!832032 m!775791))

(assert (=> b!832032 m!776021))

(assert (=> b!832032 m!776021))

(assert (=> b!832032 m!776023))

(assert (=> b!831877 d!106333))

(declare-fun d!106335 () Bool)

(assert (=> d!106335 (= (validKeyInArray!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (and (not (= (select (arr!22334 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22334 _keys!976) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831985 d!106335))

(declare-fun d!106337 () Bool)

(declare-fun isEmpty!658 (List!15949) Bool)

(assert (=> d!106337 (= (isEmpty!657 lt!377494) (isEmpty!658 (toList!4505 lt!377494)))))

(declare-fun bs!23259 () Bool)

(assert (= bs!23259 d!106337))

(declare-fun m!776025 () Bool)

(assert (=> bs!23259 m!776025))

(assert (=> b!831889 d!106337))

(declare-fun d!106339 () Bool)

(assert (=> d!106339 (arrayContainsKey!0 _keys!976 lt!377505 #b00000000000000000000000000000000)))

(declare-fun lt!377632 () Unit!28493)

(declare-fun choose!13 (array!46598 (_ BitVec 64) (_ BitVec 32)) Unit!28493)

(assert (=> d!106339 (= lt!377632 (choose!13 _keys!976 lt!377505 #b00000000000000000000000000000000))))

(assert (=> d!106339 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!106339 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377505 #b00000000000000000000000000000000) lt!377632)))

(declare-fun bs!23260 () Bool)

(assert (= bs!23260 d!106339))

(assert (=> bs!23260 m!775843))

(declare-fun m!776027 () Bool)

(assert (=> bs!23260 m!776027))

(assert (=> b!831903 d!106339))

(declare-fun d!106341 () Bool)

(declare-fun res!566197 () Bool)

(declare-fun e!464014 () Bool)

(assert (=> d!106341 (=> res!566197 e!464014)))

(assert (=> d!106341 (= res!566197 (= (select (arr!22334 _keys!976) #b00000000000000000000000000000000) lt!377505))))

(assert (=> d!106341 (= (arrayContainsKey!0 _keys!976 lt!377505 #b00000000000000000000000000000000) e!464014)))

(declare-fun b!832037 () Bool)

(declare-fun e!464015 () Bool)

(assert (=> b!832037 (= e!464014 e!464015)))

(declare-fun res!566198 () Bool)

(assert (=> b!832037 (=> (not res!566198) (not e!464015))))

(assert (=> b!832037 (= res!566198 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!832038 () Bool)

(assert (=> b!832038 (= e!464015 (arrayContainsKey!0 _keys!976 lt!377505 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!106341 (not res!566197)) b!832037))

(assert (= (and b!832037 res!566198) b!832038))

(assert (=> d!106341 m!775791))

(declare-fun m!776029 () Bool)

(assert (=> b!832038 m!776029))

(assert (=> b!831903 d!106341))

(declare-fun b!832051 () Bool)

(declare-fun e!464023 () SeekEntryResult!8745)

(declare-fun lt!377640 () SeekEntryResult!8745)

(assert (=> b!832051 (= e!464023 (Found!8745 (index!37353 lt!377640)))))

(declare-fun b!832052 () Bool)

(declare-fun c!90380 () Bool)

(declare-fun lt!377641 () (_ BitVec 64))

(assert (=> b!832052 (= c!90380 (= lt!377641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464022 () SeekEntryResult!8745)

(assert (=> b!832052 (= e!464023 e!464022)))

(declare-fun b!832053 () Bool)

(declare-fun e!464024 () SeekEntryResult!8745)

(assert (=> b!832053 (= e!464024 Undefined!8745)))

(declare-fun b!832054 () Bool)

(assert (=> b!832054 (= e!464022 (MissingZero!8745 (index!37353 lt!377640)))))

(declare-fun b!832055 () Bool)

(assert (=> b!832055 (= e!464024 e!464023)))

(assert (=> b!832055 (= lt!377641 (select (arr!22334 _keys!976) (index!37353 lt!377640)))))

(declare-fun c!90381 () Bool)

(assert (=> b!832055 (= c!90381 (= lt!377641 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!106343 () Bool)

(declare-fun lt!377639 () SeekEntryResult!8745)

(assert (=> d!106343 (and (or ((_ is Undefined!8745) lt!377639) (not ((_ is Found!8745) lt!377639)) (and (bvsge (index!37352 lt!377639) #b00000000000000000000000000000000) (bvslt (index!37352 lt!377639) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377639) ((_ is Found!8745) lt!377639) (not ((_ is MissingZero!8745) lt!377639)) (and (bvsge (index!37351 lt!377639) #b00000000000000000000000000000000) (bvslt (index!37351 lt!377639) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377639) ((_ is Found!8745) lt!377639) ((_ is MissingZero!8745) lt!377639) (not ((_ is MissingVacant!8745) lt!377639)) (and (bvsge (index!37354 lt!377639) #b00000000000000000000000000000000) (bvslt (index!37354 lt!377639) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377639) (ite ((_ is Found!8745) lt!377639) (= (select (arr!22334 _keys!976) (index!37352 lt!377639)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8745) lt!377639) (= (select (arr!22334 _keys!976) (index!37351 lt!377639)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8745) lt!377639) (= (select (arr!22334 _keys!976) (index!37354 lt!377639)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106343 (= lt!377639 e!464024)))

(declare-fun c!90382 () Bool)

(assert (=> d!106343 (= c!90382 (and ((_ is Intermediate!8745) lt!377640) (undefined!9557 lt!377640)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46598 (_ BitVec 32)) SeekEntryResult!8745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!106343 (= lt!377640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (=> d!106343 (validMask!0 mask!1312)))

(assert (=> d!106343 (= (seekEntryOrOpen!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377639)))

(declare-fun b!832056 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46598 (_ BitVec 32)) SeekEntryResult!8745)

(assert (=> b!832056 (= e!464022 (seekKeyOrZeroReturnVacant!0 (x!70140 lt!377640) (index!37353 lt!377640) (index!37353 lt!377640) (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (= (and d!106343 c!90382) b!832053))

(assert (= (and d!106343 (not c!90382)) b!832055))

(assert (= (and b!832055 c!90381) b!832051))

(assert (= (and b!832055 (not c!90381)) b!832052))

(assert (= (and b!832052 c!90380) b!832054))

(assert (= (and b!832052 (not c!90380)) b!832056))

(declare-fun m!776031 () Bool)

(assert (=> b!832055 m!776031))

(declare-fun m!776033 () Bool)

(assert (=> d!106343 m!776033))

(declare-fun m!776035 () Bool)

(assert (=> d!106343 m!776035))

(assert (=> d!106343 m!775715))

(assert (=> d!106343 m!775791))

(declare-fun m!776037 () Bool)

(assert (=> d!106343 m!776037))

(assert (=> d!106343 m!776037))

(assert (=> d!106343 m!775791))

(declare-fun m!776039 () Bool)

(assert (=> d!106343 m!776039))

(declare-fun m!776041 () Bool)

(assert (=> d!106343 m!776041))

(assert (=> b!832056 m!775791))

(declare-fun m!776043 () Bool)

(assert (=> b!832056 m!776043))

(assert (=> b!831903 d!106343))

(assert (=> b!831885 d!106335))

(declare-fun d!106345 () Bool)

(declare-fun get!11824 (Option!422) V!25285)

(assert (=> d!106345 (= (apply!373 lt!377554 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23261 () Bool)

(assert (= bs!23261 d!106345))

(assert (=> bs!23261 m!775791))

(declare-fun m!776045 () Bool)

(assert (=> bs!23261 m!776045))

(assert (=> bs!23261 m!776045))

(declare-fun m!776047 () Bool)

(assert (=> bs!23261 m!776047))

(assert (=> b!831953 d!106345))

(declare-fun d!106347 () Bool)

(declare-fun c!90385 () Bool)

(assert (=> d!106347 (= c!90385 ((_ is ValueCellFull!7191) (select (arr!22335 _values!788) #b00000000000000000000000000000000)))))

(declare-fun e!464027 () V!25285)

(assert (=> d!106347 (= (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!464027)))

(declare-fun b!832061 () Bool)

(declare-fun get!11825 (ValueCell!7191 V!25285) V!25285)

(assert (=> b!832061 (= e!464027 (get!11825 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832062 () Bool)

(declare-fun get!11826 (ValueCell!7191 V!25285) V!25285)

(assert (=> b!832062 (= e!464027 (get!11826 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106347 c!90385) b!832061))

(assert (= (and d!106347 (not c!90385)) b!832062))

(assert (=> b!832061 m!775803))

(assert (=> b!832061 m!775801))

(declare-fun m!776049 () Bool)

(assert (=> b!832061 m!776049))

(assert (=> b!832062 m!775803))

(assert (=> b!832062 m!775801))

(declare-fun m!776051 () Bool)

(assert (=> b!832062 m!776051))

(assert (=> b!831953 d!106347))

(declare-fun d!106349 () Bool)

(assert (=> d!106349 (= (apply!373 lt!377494 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23262 () Bool)

(assert (= bs!23262 d!106349))

(assert (=> bs!23262 m!775791))

(declare-fun m!776053 () Bool)

(assert (=> bs!23262 m!776053))

(assert (=> bs!23262 m!776053))

(declare-fun m!776055 () Bool)

(assert (=> bs!23262 m!776055))

(assert (=> b!831887 d!106349))

(assert (=> b!831887 d!106347))

(declare-fun d!106351 () Bool)

(declare-fun e!464028 () Bool)

(assert (=> d!106351 e!464028))

(declare-fun res!566199 () Bool)

(assert (=> d!106351 (=> res!566199 e!464028)))

(declare-fun lt!377645 () Bool)

(assert (=> d!106351 (= res!566199 (not lt!377645))))

(declare-fun lt!377644 () Bool)

(assert (=> d!106351 (= lt!377645 lt!377644)))

(declare-fun lt!377643 () Unit!28493)

(declare-fun e!464029 () Unit!28493)

(assert (=> d!106351 (= lt!377643 e!464029)))

(declare-fun c!90386 () Bool)

(assert (=> d!106351 (= c!90386 lt!377644)))

(assert (=> d!106351 (= lt!377644 (containsKey!402 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106351 (= (contains!4211 lt!377580 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377645)))

(declare-fun b!832063 () Bool)

(declare-fun lt!377642 () Unit!28493)

(assert (=> b!832063 (= e!464029 lt!377642)))

(assert (=> b!832063 (= lt!377642 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832063 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832064 () Bool)

(declare-fun Unit!28500 () Unit!28493)

(assert (=> b!832064 (= e!464029 Unit!28500)))

(declare-fun b!832065 () Bool)

(assert (=> b!832065 (= e!464028 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106351 c!90386) b!832063))

(assert (= (and d!106351 (not c!90386)) b!832064))

(assert (= (and d!106351 (not res!566199)) b!832065))

(declare-fun m!776057 () Bool)

(assert (=> d!106351 m!776057))

(declare-fun m!776059 () Bool)

(assert (=> b!832063 m!776059))

(declare-fun m!776061 () Bool)

(assert (=> b!832063 m!776061))

(assert (=> b!832063 m!776061))

(declare-fun m!776063 () Bool)

(assert (=> b!832063 m!776063))

(assert (=> b!832065 m!776061))

(assert (=> b!832065 m!776061))

(assert (=> b!832065 m!776063))

(assert (=> bm!36389 d!106351))

(assert (=> bm!36379 d!106305))

(declare-fun d!106353 () Bool)

(assert (=> d!106353 (= (isEmpty!657 lt!377487) (isEmpty!658 (toList!4505 lt!377487)))))

(declare-fun bs!23263 () Bool)

(assert (= bs!23263 d!106353))

(declare-fun m!776065 () Bool)

(assert (=> bs!23263 m!776065))

(assert (=> b!831875 d!106353))

(assert (=> b!832011 d!106335))

(declare-fun d!106355 () Bool)

(declare-fun e!464030 () Bool)

(assert (=> d!106355 e!464030))

(declare-fun res!566200 () Bool)

(assert (=> d!106355 (=> (not res!566200) (not e!464030))))

(declare-fun lt!377649 () ListLongMap!8979)

(assert (=> d!106355 (= res!566200 (contains!4211 lt!377649 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377648 () List!15949)

(assert (=> d!106355 (= lt!377649 (ListLongMap!8980 lt!377648))))

(declare-fun lt!377646 () Unit!28493)

(declare-fun lt!377647 () Unit!28493)

(assert (=> d!106355 (= lt!377646 lt!377647)))

(assert (=> d!106355 (= (getValueByKey!416 lt!377648 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106355 (= lt!377647 (lemmaContainsTupThenGetReturnValue!230 lt!377648 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106355 (= lt!377648 (insertStrictlySorted!269 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106355 (= (+!1983 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)) (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377649)))

(declare-fun b!832066 () Bool)

(declare-fun res!566201 () Bool)

(assert (=> b!832066 (=> (not res!566201) (not e!464030))))

(assert (=> b!832066 (= res!566201 (= (getValueByKey!416 (toList!4505 lt!377649) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832067 () Bool)

(assert (=> b!832067 (= e!464030 (contains!4212 (toList!4505 lt!377649) (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106355 res!566200) b!832066))

(assert (= (and b!832066 res!566201) b!832067))

(declare-fun m!776067 () Bool)

(assert (=> d!106355 m!776067))

(declare-fun m!776069 () Bool)

(assert (=> d!106355 m!776069))

(declare-fun m!776071 () Bool)

(assert (=> d!106355 m!776071))

(declare-fun m!776073 () Bool)

(assert (=> d!106355 m!776073))

(declare-fun m!776075 () Bool)

(assert (=> b!832066 m!776075))

(declare-fun m!776077 () Bool)

(assert (=> b!832067 m!776077))

(assert (=> bm!36384 d!106355))

(declare-fun d!106357 () Bool)

(declare-fun lt!377652 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!388 (List!15949) (InoxSet tuple2!10156))

(assert (=> d!106357 (= lt!377652 (select (content!388 (toList!4505 lt!377605)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464036 () Bool)

(assert (=> d!106357 (= lt!377652 e!464036)))

(declare-fun res!566207 () Bool)

(assert (=> d!106357 (=> (not res!566207) (not e!464036))))

(assert (=> d!106357 (= res!566207 ((_ is Cons!15945) (toList!4505 lt!377605)))))

(assert (=> d!106357 (= (contains!4212 (toList!4505 lt!377605) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377652)))

(declare-fun b!832072 () Bool)

(declare-fun e!464035 () Bool)

(assert (=> b!832072 (= e!464036 e!464035)))

(declare-fun res!566206 () Bool)

(assert (=> b!832072 (=> res!566206 e!464035)))

(assert (=> b!832072 (= res!566206 (= (h!17075 (toList!4505 lt!377605)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!832073 () Bool)

(assert (=> b!832073 (= e!464035 (contains!4212 (t!22317 (toList!4505 lt!377605)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106357 res!566207) b!832072))

(assert (= (and b!832072 (not res!566206)) b!832073))

(declare-fun m!776079 () Bool)

(assert (=> d!106357 m!776079))

(declare-fun m!776081 () Bool)

(assert (=> d!106357 m!776081))

(declare-fun m!776083 () Bool)

(assert (=> b!832073 m!776083))

(assert (=> b!831994 d!106357))

(assert (=> b!831990 d!106335))

(declare-fun d!106359 () Bool)

(declare-fun lt!377653 () Bool)

(assert (=> d!106359 (= lt!377653 (select (content!388 (toList!4505 lt!377609)) lt!377428))))

(declare-fun e!464038 () Bool)

(assert (=> d!106359 (= lt!377653 e!464038)))

(declare-fun res!566209 () Bool)

(assert (=> d!106359 (=> (not res!566209) (not e!464038))))

(assert (=> d!106359 (= res!566209 ((_ is Cons!15945) (toList!4505 lt!377609)))))

(assert (=> d!106359 (= (contains!4212 (toList!4505 lt!377609) lt!377428) lt!377653)))

(declare-fun b!832074 () Bool)

(declare-fun e!464037 () Bool)

(assert (=> b!832074 (= e!464038 e!464037)))

(declare-fun res!566208 () Bool)

(assert (=> b!832074 (=> res!566208 e!464037)))

(assert (=> b!832074 (= res!566208 (= (h!17075 (toList!4505 lt!377609)) lt!377428))))

(declare-fun b!832075 () Bool)

(assert (=> b!832075 (= e!464037 (contains!4212 (t!22317 (toList!4505 lt!377609)) lt!377428))))

(assert (= (and d!106359 res!566209) b!832074))

(assert (= (and b!832074 (not res!566208)) b!832075))

(declare-fun m!776085 () Bool)

(assert (=> d!106359 m!776085))

(declare-fun m!776087 () Bool)

(assert (=> d!106359 m!776087))

(declare-fun m!776089 () Bool)

(assert (=> b!832075 m!776089))

(assert (=> b!831996 d!106359))

(declare-fun d!106361 () Bool)

(declare-fun e!464039 () Bool)

(assert (=> d!106361 e!464039))

(declare-fun res!566210 () Bool)

(assert (=> d!106361 (=> res!566210 e!464039)))

(declare-fun lt!377657 () Bool)

(assert (=> d!106361 (= res!566210 (not lt!377657))))

(declare-fun lt!377656 () Bool)

(assert (=> d!106361 (= lt!377657 lt!377656)))

(declare-fun lt!377655 () Unit!28493)

(declare-fun e!464040 () Unit!28493)

(assert (=> d!106361 (= lt!377655 e!464040)))

(declare-fun c!90387 () Bool)

(assert (=> d!106361 (= c!90387 lt!377656)))

(assert (=> d!106361 (= lt!377656 (containsKey!402 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106361 (= (contains!4211 lt!377494 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!377657)))

(declare-fun b!832076 () Bool)

(declare-fun lt!377654 () Unit!28493)

(assert (=> b!832076 (= e!464040 lt!377654)))

(assert (=> b!832076 (= lt!377654 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832076 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832077 () Bool)

(declare-fun Unit!28501 () Unit!28493)

(assert (=> b!832077 (= e!464040 Unit!28501)))

(declare-fun b!832078 () Bool)

(assert (=> b!832078 (= e!464039 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106361 c!90387) b!832076))

(assert (= (and d!106361 (not c!90387)) b!832077))

(assert (= (and d!106361 (not res!566210)) b!832078))

(assert (=> d!106361 m!775791))

(declare-fun m!776091 () Bool)

(assert (=> d!106361 m!776091))

(assert (=> b!832076 m!775791))

(declare-fun m!776093 () Bool)

(assert (=> b!832076 m!776093))

(assert (=> b!832076 m!775791))

(assert (=> b!832076 m!776053))

(assert (=> b!832076 m!776053))

(declare-fun m!776095 () Bool)

(assert (=> b!832076 m!776095))

(assert (=> b!832078 m!775791))

(assert (=> b!832078 m!776053))

(assert (=> b!832078 m!776053))

(assert (=> b!832078 m!776095))

(assert (=> b!831891 d!106361))

(declare-fun d!106363 () Bool)

(declare-fun lt!377658 () Bool)

(assert (=> d!106363 (= lt!377658 (select (content!388 (toList!4505 lt!377613)) lt!377428))))

(declare-fun e!464042 () Bool)

(assert (=> d!106363 (= lt!377658 e!464042)))

(declare-fun res!566212 () Bool)

(assert (=> d!106363 (=> (not res!566212) (not e!464042))))

(assert (=> d!106363 (= res!566212 ((_ is Cons!15945) (toList!4505 lt!377613)))))

(assert (=> d!106363 (= (contains!4212 (toList!4505 lt!377613) lt!377428) lt!377658)))

(declare-fun b!832079 () Bool)

(declare-fun e!464041 () Bool)

(assert (=> b!832079 (= e!464042 e!464041)))

(declare-fun res!566211 () Bool)

(assert (=> b!832079 (=> res!566211 e!464041)))

(assert (=> b!832079 (= res!566211 (= (h!17075 (toList!4505 lt!377613)) lt!377428))))

(declare-fun b!832080 () Bool)

(assert (=> b!832080 (= e!464041 (contains!4212 (t!22317 (toList!4505 lt!377613)) lt!377428))))

(assert (= (and d!106363 res!566212) b!832079))

(assert (= (and b!832079 (not res!566211)) b!832080))

(declare-fun m!776097 () Bool)

(assert (=> d!106363 m!776097))

(declare-fun m!776099 () Bool)

(assert (=> d!106363 m!776099))

(declare-fun m!776101 () Bool)

(assert (=> b!832080 m!776101))

(assert (=> b!831998 d!106363))

(declare-fun b!832081 () Bool)

(declare-fun e!464044 () Bool)

(declare-fun e!464045 () Bool)

(assert (=> b!832081 (= e!464044 e!464045)))

(declare-fun c!90388 () Bool)

(assert (=> b!832081 (= c!90388 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832082 () Bool)

(declare-fun e!464046 () Bool)

(assert (=> b!832082 (= e!464046 (contains!4213 (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832083 () Bool)

(declare-fun call!36397 () Bool)

(assert (=> b!832083 (= e!464045 call!36397)))

(declare-fun d!106365 () Bool)

(declare-fun res!566213 () Bool)

(declare-fun e!464043 () Bool)

(assert (=> d!106365 (=> res!566213 e!464043)))

(assert (=> d!106365 (= res!566213 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!106365 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) e!464043)))

(declare-fun b!832084 () Bool)

(assert (=> b!832084 (= e!464045 call!36397)))

(declare-fun bm!36394 () Bool)

(assert (=> bm!36394 (= call!36397 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90388 (Cons!15946 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947))))))

(declare-fun b!832085 () Bool)

(assert (=> b!832085 (= e!464043 e!464044)))

(declare-fun res!566215 () Bool)

(assert (=> b!832085 (=> (not res!566215) (not e!464044))))

(assert (=> b!832085 (= res!566215 (not e!464046))))

(declare-fun res!566214 () Bool)

(assert (=> b!832085 (=> (not res!566214) (not e!464046))))

(assert (=> b!832085 (= res!566214 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106365 (not res!566213)) b!832085))

(assert (= (and b!832085 res!566214) b!832082))

(assert (= (and b!832085 res!566215) b!832081))

(assert (= (and b!832081 c!90388) b!832083))

(assert (= (and b!832081 (not c!90388)) b!832084))

(assert (= (or b!832083 b!832084) bm!36394))

(declare-fun m!776103 () Bool)

(assert (=> b!832081 m!776103))

(assert (=> b!832081 m!776103))

(declare-fun m!776105 () Bool)

(assert (=> b!832081 m!776105))

(assert (=> b!832082 m!776103))

(assert (=> b!832082 m!776103))

(declare-fun m!776107 () Bool)

(assert (=> b!832082 m!776107))

(assert (=> bm!36394 m!776103))

(declare-fun m!776109 () Bool)

(assert (=> bm!36394 m!776109))

(assert (=> b!832085 m!776103))

(assert (=> b!832085 m!776103))

(assert (=> b!832085 m!776105))

(assert (=> bm!36393 d!106365))

(declare-fun d!106367 () Bool)

(declare-fun lt!377659 () Bool)

(assert (=> d!106367 (= lt!377659 (select (content!388 (toList!4505 lt!377617)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464048 () Bool)

(assert (=> d!106367 (= lt!377659 e!464048)))

(declare-fun res!566217 () Bool)

(assert (=> d!106367 (=> (not res!566217) (not e!464048))))

(assert (=> d!106367 (= res!566217 ((_ is Cons!15945) (toList!4505 lt!377617)))))

(assert (=> d!106367 (= (contains!4212 (toList!4505 lt!377617) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377659)))

(declare-fun b!832086 () Bool)

(declare-fun e!464047 () Bool)

(assert (=> b!832086 (= e!464048 e!464047)))

(declare-fun res!566216 () Bool)

(assert (=> b!832086 (=> res!566216 e!464047)))

(assert (=> b!832086 (= res!566216 (= (h!17075 (toList!4505 lt!377617)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!832087 () Bool)

(assert (=> b!832087 (= e!464047 (contains!4212 (t!22317 (toList!4505 lt!377617)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106367 res!566217) b!832086))

(assert (= (and b!832086 (not res!566216)) b!832087))

(declare-fun m!776111 () Bool)

(assert (=> d!106367 m!776111))

(declare-fun m!776113 () Bool)

(assert (=> d!106367 m!776113))

(declare-fun m!776115 () Bool)

(assert (=> b!832087 m!776115))

(assert (=> b!832000 d!106367))

(assert (=> b!831962 d!106335))

(declare-fun d!106369 () Bool)

(declare-fun e!464049 () Bool)

(assert (=> d!106369 e!464049))

(declare-fun res!566218 () Bool)

(assert (=> d!106369 (=> res!566218 e!464049)))

(declare-fun lt!377663 () Bool)

(assert (=> d!106369 (= res!566218 (not lt!377663))))

(declare-fun lt!377662 () Bool)

(assert (=> d!106369 (= lt!377663 lt!377662)))

(declare-fun lt!377661 () Unit!28493)

(declare-fun e!464050 () Unit!28493)

(assert (=> d!106369 (= lt!377661 e!464050)))

(declare-fun c!90389 () Bool)

(assert (=> d!106369 (= c!90389 lt!377662)))

(assert (=> d!106369 (= lt!377662 (containsKey!402 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106369 (= (contains!4211 lt!377487 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377663)))

(declare-fun b!832088 () Bool)

(declare-fun lt!377660 () Unit!28493)

(assert (=> b!832088 (= e!464050 lt!377660)))

(assert (=> b!832088 (= lt!377660 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832088 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832089 () Bool)

(declare-fun Unit!28502 () Unit!28493)

(assert (=> b!832089 (= e!464050 Unit!28502)))

(declare-fun b!832090 () Bool)

(assert (=> b!832090 (= e!464049 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106369 c!90389) b!832088))

(assert (= (and d!106369 (not c!90389)) b!832089))

(assert (= (and d!106369 (not res!566218)) b!832090))

(declare-fun m!776117 () Bool)

(assert (=> d!106369 m!776117))

(declare-fun m!776119 () Bool)

(assert (=> b!832088 m!776119))

(declare-fun m!776121 () Bool)

(assert (=> b!832088 m!776121))

(assert (=> b!832088 m!776121))

(declare-fun m!776123 () Bool)

(assert (=> b!832088 m!776123))

(assert (=> b!832090 m!776121))

(assert (=> b!832090 m!776121))

(assert (=> b!832090 m!776123))

(assert (=> d!106303 d!106369))

(assert (=> d!106303 d!106321))

(assert (=> d!106301 d!106305))

(assert (=> d!106301 d!106303))

(declare-fun d!106371 () Bool)

(assert (=> d!106371 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!106371 true))

(declare-fun _$13!49 () Unit!28493)

(assert (=> d!106371 (= (choose!1422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) _$13!49)))

(declare-fun bs!23264 () Bool)

(assert (= bs!23264 d!106371))

(assert (=> bs!23264 m!775691))

(assert (=> bs!23264 m!775689))

(assert (=> d!106301 d!106371))

(assert (=> d!106301 d!106321))

(declare-fun d!106373 () Bool)

(declare-fun e!464051 () Bool)

(assert (=> d!106373 e!464051))

(declare-fun res!566219 () Bool)

(assert (=> d!106373 (=> res!566219 e!464051)))

(declare-fun lt!377667 () Bool)

(assert (=> d!106373 (= res!566219 (not lt!377667))))

(declare-fun lt!377666 () Bool)

(assert (=> d!106373 (= lt!377667 lt!377666)))

(declare-fun lt!377665 () Unit!28493)

(declare-fun e!464052 () Unit!28493)

(assert (=> d!106373 (= lt!377665 e!464052)))

(declare-fun c!90390 () Bool)

(assert (=> d!106373 (= c!90390 lt!377666)))

(assert (=> d!106373 (= lt!377666 (containsKey!402 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106373 (= (contains!4211 lt!377580 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377667)))

(declare-fun b!832091 () Bool)

(declare-fun lt!377664 () Unit!28493)

(assert (=> b!832091 (= e!464052 lt!377664)))

(assert (=> b!832091 (= lt!377664 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832091 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832092 () Bool)

(declare-fun Unit!28503 () Unit!28493)

(assert (=> b!832092 (= e!464052 Unit!28503)))

(declare-fun b!832093 () Bool)

(assert (=> b!832093 (= e!464051 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106373 c!90390) b!832091))

(assert (= (and d!106373 (not c!90390)) b!832092))

(assert (= (and d!106373 (not res!566219)) b!832093))

(declare-fun m!776125 () Bool)

(assert (=> d!106373 m!776125))

(declare-fun m!776127 () Bool)

(assert (=> b!832091 m!776127))

(declare-fun m!776129 () Bool)

(assert (=> b!832091 m!776129))

(assert (=> b!832091 m!776129))

(declare-fun m!776131 () Bool)

(assert (=> b!832091 m!776131))

(assert (=> b!832093 m!776129))

(assert (=> b!832093 m!776129))

(assert (=> b!832093 m!776131))

(assert (=> bm!36387 d!106373))

(declare-fun b!832094 () Bool)

(declare-fun e!464055 () ListLongMap!8979)

(assert (=> b!832094 (= e!464055 (ListLongMap!8980 Nil!15946))))

(declare-fun b!832095 () Bool)

(declare-fun lt!377674 () Unit!28493)

(declare-fun lt!377670 () Unit!28493)

(assert (=> b!832095 (= lt!377674 lt!377670)))

(declare-fun lt!377669 () (_ BitVec 64))

(declare-fun lt!377668 () V!25285)

(declare-fun lt!377673 () ListLongMap!8979)

(declare-fun lt!377671 () (_ BitVec 64))

(assert (=> b!832095 (not (contains!4211 (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668)) lt!377671))))

(assert (=> b!832095 (= lt!377670 (addStillNotContains!198 lt!377673 lt!377669 lt!377668 lt!377671))))

(assert (=> b!832095 (= lt!377671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!832095 (= lt!377668 (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!832095 (= lt!377669 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!36398 () ListLongMap!8979)

(assert (=> b!832095 (= lt!377673 call!36398)))

(declare-fun e!464058 () ListLongMap!8979)

(assert (=> b!832095 (= e!464058 (+!1983 call!36398 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36395 () Bool)

(assert (=> bm!36395 (= call!36398 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun lt!377672 () ListLongMap!8979)

(declare-fun b!832096 () Bool)

(declare-fun e!464059 () Bool)

(assert (=> b!832096 (= e!464059 (= lt!377672 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!106375 () Bool)

(declare-fun e!464056 () Bool)

(assert (=> d!106375 e!464056))

(declare-fun res!566220 () Bool)

(assert (=> d!106375 (=> (not res!566220) (not e!464056))))

(assert (=> d!106375 (= res!566220 (not (contains!4211 lt!377672 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106375 (= lt!377672 e!464055)))

(declare-fun c!90391 () Bool)

(assert (=> d!106375 (= c!90391 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!106375 (validMask!0 mask!1312)))

(assert (=> d!106375 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!377672)))

(declare-fun b!832097 () Bool)

(assert (=> b!832097 (= e!464058 call!36398)))

(declare-fun b!832098 () Bool)

(declare-fun e!464057 () Bool)

(assert (=> b!832098 (= e!464057 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832098 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!832099 () Bool)

(declare-fun e!464054 () Bool)

(assert (=> b!832099 (= e!464054 e!464059)))

(declare-fun c!90392 () Bool)

(assert (=> b!832099 (= c!90392 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!832100 () Bool)

(assert (=> b!832100 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> b!832100 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22756 _values!788)))))

(declare-fun e!464053 () Bool)

(assert (=> b!832100 (= e!464053 (= (apply!373 lt!377672 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832101 () Bool)

(assert (=> b!832101 (= e!464056 e!464054)))

(declare-fun c!90394 () Bool)

(assert (=> b!832101 (= c!90394 e!464057)))

(declare-fun res!566222 () Bool)

(assert (=> b!832101 (=> (not res!566222) (not e!464057))))

(assert (=> b!832101 (= res!566222 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!832102 () Bool)

(assert (=> b!832102 (= e!464059 (isEmpty!657 lt!377672))))

(declare-fun b!832103 () Bool)

(assert (=> b!832103 (= e!464055 e!464058)))

(declare-fun c!90393 () Bool)

(assert (=> b!832103 (= c!90393 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832104 () Bool)

(assert (=> b!832104 (= e!464054 e!464053)))

(assert (=> b!832104 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun res!566223 () Bool)

(assert (=> b!832104 (= res!566223 (contains!4211 lt!377672 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832104 (=> (not res!566223) (not e!464053))))

(declare-fun b!832105 () Bool)

(declare-fun res!566221 () Bool)

(assert (=> b!832105 (=> (not res!566221) (not e!464056))))

(assert (=> b!832105 (= res!566221 (not (contains!4211 lt!377672 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106375 c!90391) b!832094))

(assert (= (and d!106375 (not c!90391)) b!832103))

(assert (= (and b!832103 c!90393) b!832095))

(assert (= (and b!832103 (not c!90393)) b!832097))

(assert (= (or b!832095 b!832097) bm!36395))

(assert (= (and d!106375 res!566220) b!832105))

(assert (= (and b!832105 res!566221) b!832101))

(assert (= (and b!832101 res!566222) b!832098))

(assert (= (and b!832101 c!90394) b!832104))

(assert (= (and b!832101 (not c!90394)) b!832099))

(assert (= (and b!832104 res!566223) b!832100))

(assert (= (and b!832099 c!90392) b!832096))

(assert (= (and b!832099 (not c!90392)) b!832102))

(declare-fun b_lambda!11427 () Bool)

(assert (=> (not b_lambda!11427) (not b!832095)))

(assert (=> b!832095 t!22322))

(declare-fun b_and!22577 () Bool)

(assert (= b_and!22575 (and (=> t!22322 result!8021) b_and!22577)))

(declare-fun b_lambda!11429 () Bool)

(assert (=> (not b_lambda!11429) (not b!832100)))

(assert (=> b!832100 t!22322))

(declare-fun b_and!22579 () Bool)

(assert (= b_and!22577 (and (=> t!22322 result!8021) b_and!22579)))

(declare-fun m!776133 () Bool)

(assert (=> b!832105 m!776133))

(assert (=> b!832098 m!776103))

(assert (=> b!832098 m!776103))

(assert (=> b!832098 m!776105))

(assert (=> b!832103 m!776103))

(assert (=> b!832103 m!776103))

(assert (=> b!832103 m!776105))

(declare-fun m!776135 () Bool)

(assert (=> b!832096 m!776135))

(declare-fun m!776137 () Bool)

(assert (=> b!832102 m!776137))

(declare-fun m!776139 () Bool)

(assert (=> b!832095 m!776139))

(assert (=> b!832095 m!775801))

(declare-fun m!776141 () Bool)

(assert (=> b!832095 m!776141))

(assert (=> b!832095 m!776103))

(assert (=> b!832095 m!776141))

(assert (=> b!832095 m!775801))

(declare-fun m!776143 () Bool)

(assert (=> b!832095 m!776143))

(declare-fun m!776145 () Bool)

(assert (=> b!832095 m!776145))

(declare-fun m!776147 () Bool)

(assert (=> b!832095 m!776147))

(assert (=> b!832095 m!776145))

(declare-fun m!776149 () Bool)

(assert (=> b!832095 m!776149))

(assert (=> bm!36395 m!776135))

(assert (=> b!832100 m!776103))

(declare-fun m!776151 () Bool)

(assert (=> b!832100 m!776151))

(assert (=> b!832100 m!775801))

(assert (=> b!832100 m!776141))

(assert (=> b!832100 m!776103))

(assert (=> b!832100 m!776141))

(assert (=> b!832100 m!775801))

(assert (=> b!832100 m!776143))

(assert (=> b!832104 m!776103))

(assert (=> b!832104 m!776103))

(declare-fun m!776153 () Bool)

(assert (=> b!832104 m!776153))

(declare-fun m!776155 () Bool)

(assert (=> d!106375 m!776155))

(assert (=> d!106375 m!775715))

(assert (=> bm!36358 d!106375))

(declare-fun d!106377 () Bool)

(declare-fun e!464060 () Bool)

(assert (=> d!106377 e!464060))

(declare-fun res!566224 () Bool)

(assert (=> d!106377 (=> (not res!566224) (not e!464060))))

(declare-fun lt!377678 () ListLongMap!8979)

(assert (=> d!106377 (= res!566224 (contains!4211 lt!377678 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377677 () List!15949)

(assert (=> d!106377 (= lt!377678 (ListLongMap!8980 lt!377677))))

(declare-fun lt!377675 () Unit!28493)

(declare-fun lt!377676 () Unit!28493)

(assert (=> d!106377 (= lt!377675 lt!377676)))

(assert (=> d!106377 (= (getValueByKey!416 lt!377677 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106377 (= lt!377676 (lemmaContainsTupThenGetReturnValue!230 lt!377677 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106377 (= lt!377677 (insertStrictlySorted!269 (toList!4505 call!36387) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106377 (= (+!1983 call!36387 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377678)))

(declare-fun b!832106 () Bool)

(declare-fun res!566225 () Bool)

(assert (=> b!832106 (=> (not res!566225) (not e!464060))))

(assert (=> b!832106 (= res!566225 (= (getValueByKey!416 (toList!4505 lt!377678) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832107 () Bool)

(assert (=> b!832107 (= e!464060 (contains!4212 (toList!4505 lt!377678) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106377 res!566224) b!832106))

(assert (= (and b!832106 res!566225) b!832107))

(declare-fun m!776157 () Bool)

(assert (=> d!106377 m!776157))

(declare-fun m!776159 () Bool)

(assert (=> d!106377 m!776159))

(declare-fun m!776161 () Bool)

(assert (=> d!106377 m!776161))

(declare-fun m!776163 () Bool)

(assert (=> d!106377 m!776163))

(declare-fun m!776165 () Bool)

(assert (=> b!832106 m!776165))

(declare-fun m!776167 () Bool)

(assert (=> b!832107 m!776167))

(assert (=> b!831992 d!106377))

(declare-fun d!106379 () Bool)

(declare-fun e!464061 () Bool)

(assert (=> d!106379 e!464061))

(declare-fun res!566226 () Bool)

(assert (=> d!106379 (=> res!566226 e!464061)))

(declare-fun lt!377682 () Bool)

(assert (=> d!106379 (= res!566226 (not lt!377682))))

(declare-fun lt!377681 () Bool)

(assert (=> d!106379 (= lt!377682 lt!377681)))

(declare-fun lt!377680 () Unit!28493)

(declare-fun e!464062 () Unit!28493)

(assert (=> d!106379 (= lt!377680 e!464062)))

(declare-fun c!90395 () Bool)

(assert (=> d!106379 (= c!90395 lt!377681)))

(assert (=> d!106379 (= lt!377681 (containsKey!402 (toList!4505 lt!377465) (_1!5089 lt!377428)))))

(assert (=> d!106379 (= (contains!4211 lt!377465 (_1!5089 lt!377428)) lt!377682)))

(declare-fun b!832108 () Bool)

(declare-fun lt!377679 () Unit!28493)

(assert (=> b!832108 (= e!464062 lt!377679)))

(assert (=> b!832108 (= lt!377679 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377465) (_1!5089 lt!377428)))))

(assert (=> b!832108 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377465) (_1!5089 lt!377428)))))

(declare-fun b!832109 () Bool)

(declare-fun Unit!28504 () Unit!28493)

(assert (=> b!832109 (= e!464062 Unit!28504)))

(declare-fun b!832110 () Bool)

(assert (=> b!832110 (= e!464061 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377465) (_1!5089 lt!377428))))))

(assert (= (and d!106379 c!90395) b!832108))

(assert (= (and d!106379 (not c!90395)) b!832109))

(assert (= (and d!106379 (not res!566226)) b!832110))

(declare-fun m!776169 () Bool)

(assert (=> d!106379 m!776169))

(declare-fun m!776171 () Bool)

(assert (=> b!832108 m!776171))

(assert (=> b!832108 m!775783))

(assert (=> b!832108 m!775783))

(declare-fun m!776173 () Bool)

(assert (=> b!832108 m!776173))

(assert (=> b!832110 m!775783))

(assert (=> b!832110 m!775783))

(assert (=> b!832110 m!776173))

(assert (=> d!106299 d!106379))

(declare-fun b!832121 () Bool)

(declare-fun e!464068 () Option!422)

(assert (=> b!832121 (= e!464068 (getValueByKey!416 (t!22317 lt!377464) (_1!5089 lt!377428)))))

(declare-fun b!832120 () Bool)

(declare-fun e!464067 () Option!422)

(assert (=> b!832120 (= e!464067 e!464068)))

(declare-fun c!90401 () Bool)

(assert (=> b!832120 (= c!90401 (and ((_ is Cons!15945) lt!377464) (not (= (_1!5089 (h!17075 lt!377464)) (_1!5089 lt!377428)))))))

(declare-fun b!832122 () Bool)

(assert (=> b!832122 (= e!464068 None!420)))

(declare-fun b!832119 () Bool)

(assert (=> b!832119 (= e!464067 (Some!421 (_2!5089 (h!17075 lt!377464))))))

(declare-fun d!106381 () Bool)

(declare-fun c!90400 () Bool)

(assert (=> d!106381 (= c!90400 (and ((_ is Cons!15945) lt!377464) (= (_1!5089 (h!17075 lt!377464)) (_1!5089 lt!377428))))))

(assert (=> d!106381 (= (getValueByKey!416 lt!377464 (_1!5089 lt!377428)) e!464067)))

(assert (= (and d!106381 c!90400) b!832119))

(assert (= (and d!106381 (not c!90400)) b!832120))

(assert (= (and b!832120 c!90401) b!832121))

(assert (= (and b!832120 (not c!90401)) b!832122))

(declare-fun m!776175 () Bool)

(assert (=> b!832121 m!776175))

(assert (=> d!106299 d!106381))

(declare-fun d!106383 () Bool)

(assert (=> d!106383 (= (getValueByKey!416 lt!377464 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(declare-fun lt!377685 () Unit!28493)

(declare-fun choose!1423 (List!15949 (_ BitVec 64) V!25285) Unit!28493)

(assert (=> d!106383 (= lt!377685 (choose!1423 lt!377464 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun e!464071 () Bool)

(assert (=> d!106383 e!464071))

(declare-fun res!566231 () Bool)

(assert (=> d!106383 (=> (not res!566231) (not e!464071))))

(declare-fun isStrictlySorted!442 (List!15949) Bool)

(assert (=> d!106383 (= res!566231 (isStrictlySorted!442 lt!377464))))

(assert (=> d!106383 (= (lemmaContainsTupThenGetReturnValue!230 lt!377464 (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377685)))

(declare-fun b!832127 () Bool)

(declare-fun res!566232 () Bool)

(assert (=> b!832127 (=> (not res!566232) (not e!464071))))

(assert (=> b!832127 (= res!566232 (containsKey!402 lt!377464 (_1!5089 lt!377428)))))

(declare-fun b!832128 () Bool)

(assert (=> b!832128 (= e!464071 (contains!4212 lt!377464 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106383 res!566231) b!832127))

(assert (= (and b!832127 res!566232) b!832128))

(assert (=> d!106383 m!775777))

(declare-fun m!776177 () Bool)

(assert (=> d!106383 m!776177))

(declare-fun m!776179 () Bool)

(assert (=> d!106383 m!776179))

(declare-fun m!776181 () Bool)

(assert (=> b!832127 m!776181))

(declare-fun m!776183 () Bool)

(assert (=> b!832128 m!776183))

(assert (=> d!106299 d!106383))

(declare-fun b!832149 () Bool)

(declare-fun e!464083 () List!15949)

(declare-fun call!36406 () List!15949)

(assert (=> b!832149 (= e!464083 call!36406)))

(declare-fun b!832150 () Bool)

(declare-fun e!464082 () List!15949)

(assert (=> b!832150 (= e!464082 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377422)) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36402 () Bool)

(declare-fun call!36405 () List!15949)

(assert (=> bm!36402 (= call!36406 call!36405)))

(declare-fun b!832151 () Bool)

(assert (=> b!832151 (= e!464083 call!36406)))

(declare-fun b!832152 () Bool)

(declare-fun c!90412 () Bool)

(declare-fun c!90410 () Bool)

(assert (=> b!832152 (= e!464082 (ite c!90412 (t!22317 (toList!4505 lt!377422)) (ite c!90410 (Cons!15945 (h!17075 (toList!4505 lt!377422)) (t!22317 (toList!4505 lt!377422))) Nil!15946)))))

(declare-fun bm!36403 () Bool)

(declare-fun call!36407 () List!15949)

(declare-fun c!90413 () Bool)

(declare-fun $colon$colon!537 (List!15949 tuple2!10156) List!15949)

(assert (=> bm!36403 (= call!36407 ($colon$colon!537 e!464082 (ite c!90413 (h!17075 (toList!4505 lt!377422)) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90411 () Bool)

(assert (=> bm!36403 (= c!90411 c!90413)))

(declare-fun b!832153 () Bool)

(declare-fun res!566238 () Bool)

(declare-fun e!464085 () Bool)

(assert (=> b!832153 (=> (not res!566238) (not e!464085))))

(declare-fun lt!377688 () List!15949)

(assert (=> b!832153 (= res!566238 (containsKey!402 lt!377688 (_1!5089 lt!377428)))))

(declare-fun b!832154 () Bool)

(declare-fun e!464086 () List!15949)

(assert (=> b!832154 (= e!464086 call!36407)))

(declare-fun b!832155 () Bool)

(assert (=> b!832155 (= c!90410 (and ((_ is Cons!15945) (toList!4505 lt!377422)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377422))) (_1!5089 lt!377428))))))

(declare-fun e!464084 () List!15949)

(assert (=> b!832155 (= e!464084 e!464083)))

(declare-fun d!106385 () Bool)

(assert (=> d!106385 e!464085))

(declare-fun res!566237 () Bool)

(assert (=> d!106385 (=> (not res!566237) (not e!464085))))

(assert (=> d!106385 (= res!566237 (isStrictlySorted!442 lt!377688))))

(assert (=> d!106385 (= lt!377688 e!464086)))

(assert (=> d!106385 (= c!90413 (and ((_ is Cons!15945) (toList!4505 lt!377422)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377422))) (_1!5089 lt!377428))))))

(assert (=> d!106385 (isStrictlySorted!442 (toList!4505 lt!377422))))

(assert (=> d!106385 (= (insertStrictlySorted!269 (toList!4505 lt!377422) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377688)))

(declare-fun b!832156 () Bool)

(assert (=> b!832156 (= e!464084 call!36405)))

(declare-fun bm!36404 () Bool)

(assert (=> bm!36404 (= call!36405 call!36407)))

(declare-fun b!832157 () Bool)

(assert (=> b!832157 (= e!464085 (contains!4212 lt!377688 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832158 () Bool)

(assert (=> b!832158 (= e!464086 e!464084)))

(assert (=> b!832158 (= c!90412 (and ((_ is Cons!15945) (toList!4505 lt!377422)) (= (_1!5089 (h!17075 (toList!4505 lt!377422))) (_1!5089 lt!377428))))))

(assert (= (and d!106385 c!90413) b!832154))

(assert (= (and d!106385 (not c!90413)) b!832158))

(assert (= (and b!832158 c!90412) b!832156))

(assert (= (and b!832158 (not c!90412)) b!832155))

(assert (= (and b!832155 c!90410) b!832149))

(assert (= (and b!832155 (not c!90410)) b!832151))

(assert (= (or b!832149 b!832151) bm!36402))

(assert (= (or b!832156 bm!36402) bm!36404))

(assert (= (or b!832154 bm!36404) bm!36403))

(assert (= (and bm!36403 c!90411) b!832150))

(assert (= (and bm!36403 (not c!90411)) b!832152))

(assert (= (and d!106385 res!566237) b!832153))

(assert (= (and b!832153 res!566238) b!832157))

(declare-fun m!776185 () Bool)

(assert (=> d!106385 m!776185))

(declare-fun m!776187 () Bool)

(assert (=> d!106385 m!776187))

(declare-fun m!776189 () Bool)

(assert (=> b!832153 m!776189))

(declare-fun m!776191 () Bool)

(assert (=> b!832157 m!776191))

(declare-fun m!776193 () Bool)

(assert (=> bm!36403 m!776193))

(declare-fun m!776195 () Bool)

(assert (=> b!832150 m!776195))

(assert (=> d!106299 d!106385))

(declare-fun d!106387 () Bool)

(declare-fun e!464087 () Bool)

(assert (=> d!106387 e!464087))

(declare-fun res!566239 () Bool)

(assert (=> d!106387 (=> res!566239 e!464087)))

(declare-fun lt!377692 () Bool)

(assert (=> d!106387 (= res!566239 (not lt!377692))))

(declare-fun lt!377691 () Bool)

(assert (=> d!106387 (= lt!377692 lt!377691)))

(declare-fun lt!377690 () Unit!28493)

(declare-fun e!464088 () Unit!28493)

(assert (=> d!106387 (= lt!377690 e!464088)))

(declare-fun c!90414 () Bool)

(assert (=> d!106387 (= c!90414 lt!377691)))

(assert (=> d!106387 (= lt!377691 (containsKey!402 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106387 (= (contains!4211 lt!377554 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377692)))

(declare-fun b!832159 () Bool)

(declare-fun lt!377689 () Unit!28493)

(assert (=> b!832159 (= e!464088 lt!377689)))

(assert (=> b!832159 (= lt!377689 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832159 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832160 () Bool)

(declare-fun Unit!28505 () Unit!28493)

(assert (=> b!832160 (= e!464088 Unit!28505)))

(declare-fun b!832161 () Bool)

(assert (=> b!832161 (= e!464087 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106387 c!90414) b!832159))

(assert (= (and d!106387 (not c!90414)) b!832160))

(assert (= (and d!106387 (not res!566239)) b!832161))

(declare-fun m!776197 () Bool)

(assert (=> d!106387 m!776197))

(declare-fun m!776199 () Bool)

(assert (=> b!832159 m!776199))

(declare-fun m!776201 () Bool)

(assert (=> b!832159 m!776201))

(assert (=> b!832159 m!776201))

(declare-fun m!776203 () Bool)

(assert (=> b!832159 m!776203))

(assert (=> b!832161 m!776201))

(assert (=> b!832161 m!776201))

(assert (=> b!832161 m!776203))

(assert (=> bm!36382 d!106387))

(declare-fun d!106389 () Bool)

(declare-fun lt!377693 () Bool)

(assert (=> d!106389 (= lt!377693 (select (content!388 (toList!4505 lt!377579)) lt!377425))))

(declare-fun e!464090 () Bool)

(assert (=> d!106389 (= lt!377693 e!464090)))

(declare-fun res!566241 () Bool)

(assert (=> d!106389 (=> (not res!566241) (not e!464090))))

(assert (=> d!106389 (= res!566241 ((_ is Cons!15945) (toList!4505 lt!377579)))))

(assert (=> d!106389 (= (contains!4212 (toList!4505 lt!377579) lt!377425) lt!377693)))

(declare-fun b!832162 () Bool)

(declare-fun e!464089 () Bool)

(assert (=> b!832162 (= e!464090 e!464089)))

(declare-fun res!566240 () Bool)

(assert (=> b!832162 (=> res!566240 e!464089)))

(assert (=> b!832162 (= res!566240 (= (h!17075 (toList!4505 lt!377579)) lt!377425))))

(declare-fun b!832163 () Bool)

(assert (=> b!832163 (= e!464089 (contains!4212 (t!22317 (toList!4505 lt!377579)) lt!377425))))

(assert (= (and d!106389 res!566241) b!832162))

(assert (= (and b!832162 (not res!566240)) b!832163))

(declare-fun m!776205 () Bool)

(assert (=> d!106389 m!776205))

(declare-fun m!776207 () Bool)

(assert (=> d!106389 m!776207))

(declare-fun m!776209 () Bool)

(assert (=> b!832163 m!776209))

(assert (=> b!831971 d!106389))

(declare-fun d!106391 () Bool)

(declare-fun e!464091 () Bool)

(assert (=> d!106391 e!464091))

(declare-fun res!566242 () Bool)

(assert (=> d!106391 (=> (not res!566242) (not e!464091))))

(declare-fun lt!377697 () ListLongMap!8979)

(assert (=> d!106391 (= res!566242 (contains!4211 lt!377697 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377696 () List!15949)

(assert (=> d!106391 (= lt!377697 (ListLongMap!8980 lt!377696))))

(declare-fun lt!377694 () Unit!28493)

(declare-fun lt!377695 () Unit!28493)

(assert (=> d!106391 (= lt!377694 lt!377695)))

(assert (=> d!106391 (= (getValueByKey!416 lt!377696 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106391 (= lt!377695 (lemmaContainsTupThenGetReturnValue!230 lt!377696 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106391 (= lt!377696 (insertStrictlySorted!269 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106391 (= (+!1983 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)) (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377697)))

(declare-fun b!832164 () Bool)

(declare-fun res!566243 () Bool)

(assert (=> b!832164 (=> (not res!566243) (not e!464091))))

(assert (=> b!832164 (= res!566243 (= (getValueByKey!416 (toList!4505 lt!377697) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832165 () Bool)

(assert (=> b!832165 (= e!464091 (contains!4212 (toList!4505 lt!377697) (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106391 res!566242) b!832164))

(assert (= (and b!832164 res!566243) b!832165))

(declare-fun m!776211 () Bool)

(assert (=> d!106391 m!776211))

(declare-fun m!776213 () Bool)

(assert (=> d!106391 m!776213))

(declare-fun m!776215 () Bool)

(assert (=> d!106391 m!776215))

(declare-fun m!776217 () Bool)

(assert (=> d!106391 m!776217))

(declare-fun m!776219 () Bool)

(assert (=> b!832164 m!776219))

(declare-fun m!776221 () Bool)

(assert (=> b!832165 m!776221))

(assert (=> bm!36377 d!106391))

(declare-fun d!106393 () Bool)

(declare-fun e!464092 () Bool)

(assert (=> d!106393 e!464092))

(declare-fun res!566244 () Bool)

(assert (=> d!106393 (=> res!566244 e!464092)))

(declare-fun lt!377701 () Bool)

(assert (=> d!106393 (= res!566244 (not lt!377701))))

(declare-fun lt!377700 () Bool)

(assert (=> d!106393 (= lt!377701 lt!377700)))

(declare-fun lt!377699 () Unit!28493)

(declare-fun e!464093 () Unit!28493)

(assert (=> d!106393 (= lt!377699 e!464093)))

(declare-fun c!90415 () Bool)

(assert (=> d!106393 (= c!90415 lt!377700)))

(assert (=> d!106393 (= lt!377700 (containsKey!402 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106393 (= (contains!4211 lt!377617 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377701)))

(declare-fun b!832166 () Bool)

(declare-fun lt!377698 () Unit!28493)

(assert (=> b!832166 (= e!464093 lt!377698)))

(assert (=> b!832166 (= lt!377698 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!832166 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832167 () Bool)

(declare-fun Unit!28506 () Unit!28493)

(assert (=> b!832167 (= e!464093 Unit!28506)))

(declare-fun b!832168 () Bool)

(assert (=> b!832168 (= e!464092 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106393 c!90415) b!832166))

(assert (= (and d!106393 (not c!90415)) b!832167))

(assert (= (and d!106393 (not res!566244)) b!832168))

(declare-fun m!776223 () Bool)

(assert (=> d!106393 m!776223))

(declare-fun m!776225 () Bool)

(assert (=> b!832166 m!776225))

(assert (=> b!832166 m!776007))

(assert (=> b!832166 m!776007))

(declare-fun m!776227 () Bool)

(assert (=> b!832166 m!776227))

(assert (=> b!832168 m!776007))

(assert (=> b!832168 m!776007))

(assert (=> b!832168 m!776227))

(assert (=> d!106329 d!106393))

(declare-fun b!832171 () Bool)

(declare-fun e!464095 () Option!422)

(assert (=> b!832171 (= e!464095 (getValueByKey!416 (t!22317 lt!377616) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832170 () Bool)

(declare-fun e!464094 () Option!422)

(assert (=> b!832170 (= e!464094 e!464095)))

(declare-fun c!90417 () Bool)

(assert (=> b!832170 (= c!90417 (and ((_ is Cons!15945) lt!377616) (not (= (_1!5089 (h!17075 lt!377616)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832172 () Bool)

(assert (=> b!832172 (= e!464095 None!420)))

(declare-fun b!832169 () Bool)

(assert (=> b!832169 (= e!464094 (Some!421 (_2!5089 (h!17075 lt!377616))))))

(declare-fun d!106395 () Bool)

(declare-fun c!90416 () Bool)

(assert (=> d!106395 (= c!90416 (and ((_ is Cons!15945) lt!377616) (= (_1!5089 (h!17075 lt!377616)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106395 (= (getValueByKey!416 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464094)))

(assert (= (and d!106395 c!90416) b!832169))

(assert (= (and d!106395 (not c!90416)) b!832170))

(assert (= (and b!832170 c!90417) b!832171))

(assert (= (and b!832170 (not c!90417)) b!832172))

(declare-fun m!776229 () Bool)

(assert (=> b!832171 m!776229))

(assert (=> d!106329 d!106395))

(declare-fun d!106397 () Bool)

(assert (=> d!106397 (= (getValueByKey!416 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377702 () Unit!28493)

(assert (=> d!106397 (= lt!377702 (choose!1423 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464096 () Bool)

(assert (=> d!106397 e!464096))

(declare-fun res!566245 () Bool)

(assert (=> d!106397 (=> (not res!566245) (not e!464096))))

(assert (=> d!106397 (= res!566245 (isStrictlySorted!442 lt!377616))))

(assert (=> d!106397 (= (lemmaContainsTupThenGetReturnValue!230 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377702)))

(declare-fun b!832173 () Bool)

(declare-fun res!566246 () Bool)

(assert (=> b!832173 (=> (not res!566246) (not e!464096))))

(assert (=> b!832173 (= res!566246 (containsKey!402 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832174 () Bool)

(assert (=> b!832174 (= e!464096 (contains!4212 lt!377616 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106397 res!566245) b!832173))

(assert (= (and b!832173 res!566246) b!832174))

(assert (=> d!106397 m!776001))

(declare-fun m!776231 () Bool)

(assert (=> d!106397 m!776231))

(declare-fun m!776233 () Bool)

(assert (=> d!106397 m!776233))

(declare-fun m!776235 () Bool)

(assert (=> b!832173 m!776235))

(declare-fun m!776237 () Bool)

(assert (=> b!832174 m!776237))

(assert (=> d!106329 d!106397))

(declare-fun b!832175 () Bool)

(declare-fun e!464098 () List!15949)

(declare-fun call!36409 () List!15949)

(assert (=> b!832175 (= e!464098 call!36409)))

(declare-fun b!832176 () Bool)

(declare-fun e!464097 () List!15949)

(assert (=> b!832176 (= e!464097 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377423)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun bm!36405 () Bool)

(declare-fun call!36408 () List!15949)

(assert (=> bm!36405 (= call!36409 call!36408)))

(declare-fun b!832177 () Bool)

(assert (=> b!832177 (= e!464098 call!36409)))

(declare-fun b!832178 () Bool)

(declare-fun c!90420 () Bool)

(declare-fun c!90418 () Bool)

(assert (=> b!832178 (= e!464097 (ite c!90420 (t!22317 (toList!4505 lt!377423)) (ite c!90418 (Cons!15945 (h!17075 (toList!4505 lt!377423)) (t!22317 (toList!4505 lt!377423))) Nil!15946)))))

(declare-fun call!36410 () List!15949)

(declare-fun bm!36406 () Bool)

(declare-fun c!90421 () Bool)

(assert (=> bm!36406 (= call!36410 ($colon$colon!537 e!464097 (ite c!90421 (h!17075 (toList!4505 lt!377423)) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90419 () Bool)

(assert (=> bm!36406 (= c!90419 c!90421)))

(declare-fun b!832179 () Bool)

(declare-fun res!566248 () Bool)

(declare-fun e!464100 () Bool)

(assert (=> b!832179 (=> (not res!566248) (not e!464100))))

(declare-fun lt!377703 () List!15949)

(assert (=> b!832179 (= res!566248 (containsKey!402 lt!377703 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832180 () Bool)

(declare-fun e!464101 () List!15949)

(assert (=> b!832180 (= e!464101 call!36410)))

(declare-fun b!832181 () Bool)

(assert (=> b!832181 (= c!90418 (and ((_ is Cons!15945) (toList!4505 lt!377423)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377423))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464099 () List!15949)

(assert (=> b!832181 (= e!464099 e!464098)))

(declare-fun d!106399 () Bool)

(assert (=> d!106399 e!464100))

(declare-fun res!566247 () Bool)

(assert (=> d!106399 (=> (not res!566247) (not e!464100))))

(assert (=> d!106399 (= res!566247 (isStrictlySorted!442 lt!377703))))

(assert (=> d!106399 (= lt!377703 e!464101)))

(assert (=> d!106399 (= c!90421 (and ((_ is Cons!15945) (toList!4505 lt!377423)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377423))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106399 (isStrictlySorted!442 (toList!4505 lt!377423))))

(assert (=> d!106399 (= (insertStrictlySorted!269 (toList!4505 lt!377423) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377703)))

(declare-fun b!832182 () Bool)

(assert (=> b!832182 (= e!464099 call!36408)))

(declare-fun bm!36407 () Bool)

(assert (=> bm!36407 (= call!36408 call!36410)))

(declare-fun b!832183 () Bool)

(assert (=> b!832183 (= e!464100 (contains!4212 lt!377703 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832184 () Bool)

(assert (=> b!832184 (= e!464101 e!464099)))

(assert (=> b!832184 (= c!90420 (and ((_ is Cons!15945) (toList!4505 lt!377423)) (= (_1!5089 (h!17075 (toList!4505 lt!377423))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106399 c!90421) b!832180))

(assert (= (and d!106399 (not c!90421)) b!832184))

(assert (= (and b!832184 c!90420) b!832182))

(assert (= (and b!832184 (not c!90420)) b!832181))

(assert (= (and b!832181 c!90418) b!832175))

(assert (= (and b!832181 (not c!90418)) b!832177))

(assert (= (or b!832175 b!832177) bm!36405))

(assert (= (or b!832182 bm!36405) bm!36407))

(assert (= (or b!832180 bm!36407) bm!36406))

(assert (= (and bm!36406 c!90419) b!832176))

(assert (= (and bm!36406 (not c!90419)) b!832178))

(assert (= (and d!106399 res!566247) b!832179))

(assert (= (and b!832179 res!566248) b!832183))

(declare-fun m!776239 () Bool)

(assert (=> d!106399 m!776239))

(declare-fun m!776241 () Bool)

(assert (=> d!106399 m!776241))

(declare-fun m!776243 () Bool)

(assert (=> b!832179 m!776243))

(declare-fun m!776245 () Bool)

(assert (=> b!832183 m!776245))

(declare-fun m!776247 () Bool)

(assert (=> bm!36406 m!776247))

(declare-fun m!776249 () Bool)

(assert (=> b!832176 m!776249))

(assert (=> d!106329 d!106399))

(declare-fun d!106401 () Bool)

(declare-fun lt!377704 () Bool)

(assert (=> d!106401 (= lt!377704 (select (content!388 (toList!4505 lt!377509)) lt!377428))))

(declare-fun e!464103 () Bool)

(assert (=> d!106401 (= lt!377704 e!464103)))

(declare-fun res!566250 () Bool)

(assert (=> d!106401 (=> (not res!566250) (not e!464103))))

(assert (=> d!106401 (= res!566250 ((_ is Cons!15945) (toList!4505 lt!377509)))))

(assert (=> d!106401 (= (contains!4212 (toList!4505 lt!377509) lt!377428) lt!377704)))

(declare-fun b!832185 () Bool)

(declare-fun e!464102 () Bool)

(assert (=> b!832185 (= e!464103 e!464102)))

(declare-fun res!566249 () Bool)

(assert (=> b!832185 (=> res!566249 e!464102)))

(assert (=> b!832185 (= res!566249 (= (h!17075 (toList!4505 lt!377509)) lt!377428))))

(declare-fun b!832186 () Bool)

(assert (=> b!832186 (= e!464102 (contains!4212 (t!22317 (toList!4505 lt!377509)) lt!377428))))

(assert (= (and d!106401 res!566250) b!832185))

(assert (= (and b!832185 (not res!566249)) b!832186))

(declare-fun m!776251 () Bool)

(assert (=> d!106401 m!776251))

(declare-fun m!776253 () Bool)

(assert (=> d!106401 m!776253))

(declare-fun m!776255 () Bool)

(assert (=> b!832186 m!776255))

(assert (=> b!831906 d!106401))

(declare-fun b!832187 () Bool)

(declare-fun e!464105 () Bool)

(declare-fun call!36411 () Bool)

(assert (=> b!832187 (= e!464105 call!36411)))

(declare-fun b!832188 () Bool)

(declare-fun e!464106 () Bool)

(assert (=> b!832188 (= e!464106 call!36411)))

(declare-fun d!106403 () Bool)

(declare-fun res!566251 () Bool)

(declare-fun e!464104 () Bool)

(assert (=> d!106403 (=> res!566251 e!464104)))

(assert (=> d!106403 (= res!566251 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!106403 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312) e!464104)))

(declare-fun bm!36408 () Bool)

(assert (=> bm!36408 (= call!36411 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!832189 () Bool)

(assert (=> b!832189 (= e!464106 e!464105)))

(declare-fun lt!377707 () (_ BitVec 64))

(assert (=> b!832189 (= lt!377707 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!377705 () Unit!28493)

(assert (=> b!832189 (= lt!377705 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377707 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!832189 (arrayContainsKey!0 _keys!976 lt!377707 #b00000000000000000000000000000000)))

(declare-fun lt!377706 () Unit!28493)

(assert (=> b!832189 (= lt!377706 lt!377705)))

(declare-fun res!566252 () Bool)

(assert (=> b!832189 (= res!566252 (= (seekEntryOrOpen!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8745 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832189 (=> (not res!566252) (not e!464105))))

(declare-fun b!832190 () Bool)

(assert (=> b!832190 (= e!464104 e!464106)))

(declare-fun c!90422 () Bool)

(assert (=> b!832190 (= c!90422 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106403 (not res!566251)) b!832190))

(assert (= (and b!832190 c!90422) b!832189))

(assert (= (and b!832190 (not c!90422)) b!832188))

(assert (= (and b!832189 res!566252) b!832187))

(assert (= (or b!832187 b!832188) bm!36408))

(declare-fun m!776257 () Bool)

(assert (=> bm!36408 m!776257))

(assert (=> b!832189 m!776103))

(declare-fun m!776259 () Bool)

(assert (=> b!832189 m!776259))

(declare-fun m!776261 () Bool)

(assert (=> b!832189 m!776261))

(assert (=> b!832189 m!776103))

(declare-fun m!776263 () Bool)

(assert (=> b!832189 m!776263))

(assert (=> b!832190 m!776103))

(assert (=> b!832190 m!776103))

(assert (=> b!832190 m!776105))

(assert (=> bm!36362 d!106403))

(declare-fun d!106405 () Bool)

(declare-fun e!464107 () Bool)

(assert (=> d!106405 e!464107))

(declare-fun res!566253 () Bool)

(assert (=> d!106405 (=> (not res!566253) (not e!464107))))

(declare-fun lt!377711 () ListLongMap!8979)

(assert (=> d!106405 (= res!566253 (contains!4211 lt!377711 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun lt!377710 () List!15949)

(assert (=> d!106405 (= lt!377711 (ListLongMap!8980 lt!377710))))

(declare-fun lt!377708 () Unit!28493)

(declare-fun lt!377709 () Unit!28493)

(assert (=> d!106405 (= lt!377708 lt!377709)))

(assert (=> d!106405 (= (getValueByKey!416 lt!377710 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(assert (=> d!106405 (= lt!377709 (lemmaContainsTupThenGetReturnValue!230 lt!377710 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(assert (=> d!106405 (= lt!377710 (insertStrictlySorted!269 (toList!4505 lt!377587) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(assert (=> d!106405 (= (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)) lt!377711)))

(declare-fun b!832191 () Bool)

(declare-fun res!566254 () Bool)

(assert (=> b!832191 (=> (not res!566254) (not e!464107))))

(assert (=> b!832191 (= res!566254 (= (getValueByKey!416 (toList!4505 lt!377711) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(declare-fun b!832192 () Bool)

(assert (=> b!832192 (= e!464107 (contains!4212 (toList!4505 lt!377711) (tuple2!10157 lt!377586 zeroValueAfter!34)))))

(assert (= (and d!106405 res!566253) b!832191))

(assert (= (and b!832191 res!566254) b!832192))

(declare-fun m!776265 () Bool)

(assert (=> d!106405 m!776265))

(declare-fun m!776267 () Bool)

(assert (=> d!106405 m!776267))

(declare-fun m!776269 () Bool)

(assert (=> d!106405 m!776269))

(declare-fun m!776271 () Bool)

(assert (=> d!106405 m!776271))

(declare-fun m!776273 () Bool)

(assert (=> b!832191 m!776273))

(declare-fun m!776275 () Bool)

(assert (=> b!832192 m!776275))

(assert (=> b!831981 d!106405))

(declare-fun d!106407 () Bool)

(declare-fun e!464108 () Bool)

(assert (=> d!106407 e!464108))

(declare-fun res!566255 () Bool)

(assert (=> d!106407 (=> res!566255 e!464108)))

(declare-fun lt!377715 () Bool)

(assert (=> d!106407 (= res!566255 (not lt!377715))))

(declare-fun lt!377714 () Bool)

(assert (=> d!106407 (= lt!377715 lt!377714)))

(declare-fun lt!377713 () Unit!28493)

(declare-fun e!464109 () Unit!28493)

(assert (=> d!106407 (= lt!377713 e!464109)))

(declare-fun c!90423 () Bool)

(assert (=> d!106407 (= c!90423 lt!377714)))

(assert (=> d!106407 (= lt!377714 (containsKey!402 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592))))

(assert (=> d!106407 (= (contains!4211 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)) lt!377592) lt!377715)))

(declare-fun b!832193 () Bool)

(declare-fun lt!377712 () Unit!28493)

(assert (=> b!832193 (= e!464109 lt!377712)))

(assert (=> b!832193 (= lt!377712 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592))))

(assert (=> b!832193 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592))))

(declare-fun b!832194 () Bool)

(declare-fun Unit!28507 () Unit!28493)

(assert (=> b!832194 (= e!464109 Unit!28507)))

(declare-fun b!832195 () Bool)

(assert (=> b!832195 (= e!464108 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592)))))

(assert (= (and d!106407 c!90423) b!832193))

(assert (= (and d!106407 (not c!90423)) b!832194))

(assert (= (and d!106407 (not res!566255)) b!832195))

(declare-fun m!776277 () Bool)

(assert (=> d!106407 m!776277))

(declare-fun m!776279 () Bool)

(assert (=> b!832193 m!776279))

(declare-fun m!776281 () Bool)

(assert (=> b!832193 m!776281))

(assert (=> b!832193 m!776281))

(declare-fun m!776283 () Bool)

(assert (=> b!832193 m!776283))

(assert (=> b!832195 m!776281))

(assert (=> b!832195 m!776281))

(assert (=> b!832195 m!776283))

(assert (=> b!831981 d!106407))

(declare-fun d!106409 () Bool)

(assert (=> d!106409 (= (apply!373 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)) lt!377595) (apply!373 lt!377593 lt!377595))))

(declare-fun lt!377718 () Unit!28493)

(declare-fun choose!1424 (ListLongMap!8979 (_ BitVec 64) V!25285 (_ BitVec 64)) Unit!28493)

(assert (=> d!106409 (= lt!377718 (choose!1424 lt!377593 lt!377594 minValue!754 lt!377595))))

(declare-fun e!464112 () Bool)

(assert (=> d!106409 e!464112))

(declare-fun res!566258 () Bool)

(assert (=> d!106409 (=> (not res!566258) (not e!464112))))

(assert (=> d!106409 (= res!566258 (contains!4211 lt!377593 lt!377595))))

(assert (=> d!106409 (= (addApplyDifferent!324 lt!377593 lt!377594 minValue!754 lt!377595) lt!377718)))

(declare-fun b!832199 () Bool)

(assert (=> b!832199 (= e!464112 (not (= lt!377595 lt!377594)))))

(assert (= (and d!106409 res!566258) b!832199))

(declare-fun m!776285 () Bool)

(assert (=> d!106409 m!776285))

(assert (=> d!106409 m!775933))

(assert (=> d!106409 m!775929))

(assert (=> d!106409 m!775933))

(assert (=> d!106409 m!775951))

(declare-fun m!776287 () Bool)

(assert (=> d!106409 m!776287))

(assert (=> b!831981 d!106409))

(declare-fun d!106411 () Bool)

(assert (=> d!106411 (contains!4211 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)) lt!377592)))

(declare-fun lt!377721 () Unit!28493)

(declare-fun choose!1425 (ListLongMap!8979 (_ BitVec 64) V!25285 (_ BitVec 64)) Unit!28493)

(assert (=> d!106411 (= lt!377721 (choose!1425 lt!377583 lt!377590 zeroValueAfter!34 lt!377592))))

(assert (=> d!106411 (contains!4211 lt!377583 lt!377592)))

(assert (=> d!106411 (= (addStillContains!324 lt!377583 lt!377590 zeroValueAfter!34 lt!377592) lt!377721)))

(declare-fun bs!23265 () Bool)

(assert (= bs!23265 d!106411))

(assert (=> bs!23265 m!775923))

(assert (=> bs!23265 m!775923))

(assert (=> bs!23265 m!775925))

(declare-fun m!776289 () Bool)

(assert (=> bs!23265 m!776289))

(declare-fun m!776291 () Bool)

(assert (=> bs!23265 m!776291))

(assert (=> b!831981 d!106411))

(assert (=> b!831981 d!106303))

(declare-fun d!106413 () Bool)

(declare-fun e!464113 () Bool)

(assert (=> d!106413 e!464113))

(declare-fun res!566259 () Bool)

(assert (=> d!106413 (=> (not res!566259) (not e!464113))))

(declare-fun lt!377725 () ListLongMap!8979)

(assert (=> d!106413 (= res!566259 (contains!4211 lt!377725 (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun lt!377724 () List!15949)

(assert (=> d!106413 (= lt!377725 (ListLongMap!8980 lt!377724))))

(declare-fun lt!377722 () Unit!28493)

(declare-fun lt!377723 () Unit!28493)

(assert (=> d!106413 (= lt!377722 lt!377723)))

(assert (=> d!106413 (= (getValueByKey!416 lt!377724 (_1!5089 (tuple2!10157 lt!377585 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377585 minValue!754))))))

(assert (=> d!106413 (= lt!377723 (lemmaContainsTupThenGetReturnValue!230 lt!377724 (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754))))))

(assert (=> d!106413 (= lt!377724 (insertStrictlySorted!269 (toList!4505 lt!377598) (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754))))))

(assert (=> d!106413 (= (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)) lt!377725)))

(declare-fun b!832201 () Bool)

(declare-fun res!566260 () Bool)

(assert (=> b!832201 (=> (not res!566260) (not e!464113))))

(assert (=> b!832201 (= res!566260 (= (getValueByKey!416 (toList!4505 lt!377725) (_1!5089 (tuple2!10157 lt!377585 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(declare-fun b!832202 () Bool)

(assert (=> b!832202 (= e!464113 (contains!4212 (toList!4505 lt!377725) (tuple2!10157 lt!377585 minValue!754)))))

(assert (= (and d!106413 res!566259) b!832201))

(assert (= (and b!832201 res!566260) b!832202))

(declare-fun m!776293 () Bool)

(assert (=> d!106413 m!776293))

(declare-fun m!776295 () Bool)

(assert (=> d!106413 m!776295))

(declare-fun m!776297 () Bool)

(assert (=> d!106413 m!776297))

(declare-fun m!776299 () Bool)

(assert (=> d!106413 m!776299))

(declare-fun m!776301 () Bool)

(assert (=> b!832201 m!776301))

(declare-fun m!776303 () Bool)

(assert (=> b!832202 m!776303))

(assert (=> b!831981 d!106413))

(declare-fun d!106415 () Bool)

(assert (=> d!106415 (= (apply!373 lt!377587 lt!377600) (get!11824 (getValueByKey!416 (toList!4505 lt!377587) lt!377600)))))

(declare-fun bs!23266 () Bool)

(assert (= bs!23266 d!106415))

(declare-fun m!776305 () Bool)

(assert (=> bs!23266 m!776305))

(assert (=> bs!23266 m!776305))

(declare-fun m!776307 () Bool)

(assert (=> bs!23266 m!776307))

(assert (=> b!831981 d!106415))

(declare-fun d!106417 () Bool)

(assert (=> d!106417 (= (apply!373 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)) lt!377600) (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34))) lt!377600)))))

(declare-fun bs!23267 () Bool)

(assert (= bs!23267 d!106417))

(declare-fun m!776309 () Bool)

(assert (=> bs!23267 m!776309))

(assert (=> bs!23267 m!776309))

(declare-fun m!776311 () Bool)

(assert (=> bs!23267 m!776311))

(assert (=> b!831981 d!106417))

(declare-fun d!106419 () Bool)

(assert (=> d!106419 (= (apply!373 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)) lt!377595) (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754))) lt!377595)))))

(declare-fun bs!23268 () Bool)

(assert (= bs!23268 d!106419))

(declare-fun m!776313 () Bool)

(assert (=> bs!23268 m!776313))

(assert (=> bs!23268 m!776313))

(declare-fun m!776315 () Bool)

(assert (=> bs!23268 m!776315))

(assert (=> b!831981 d!106419))

(declare-fun d!106421 () Bool)

(declare-fun e!464114 () Bool)

(assert (=> d!106421 e!464114))

(declare-fun res!566261 () Bool)

(assert (=> d!106421 (=> (not res!566261) (not e!464114))))

(declare-fun lt!377729 () ListLongMap!8979)

(assert (=> d!106421 (= res!566261 (contains!4211 lt!377729 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun lt!377728 () List!15949)

(assert (=> d!106421 (= lt!377729 (ListLongMap!8980 lt!377728))))

(declare-fun lt!377726 () Unit!28493)

(declare-fun lt!377727 () Unit!28493)

(assert (=> d!106421 (= lt!377726 lt!377727)))

(assert (=> d!106421 (= (getValueByKey!416 lt!377728 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(assert (=> d!106421 (= lt!377727 (lemmaContainsTupThenGetReturnValue!230 lt!377728 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(assert (=> d!106421 (= lt!377728 (insertStrictlySorted!269 (toList!4505 lt!377583) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(assert (=> d!106421 (= (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)) lt!377729)))

(declare-fun b!832203 () Bool)

(declare-fun res!566262 () Bool)

(assert (=> b!832203 (=> (not res!566262) (not e!464114))))

(assert (=> b!832203 (= res!566262 (= (getValueByKey!416 (toList!4505 lt!377729) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(declare-fun b!832204 () Bool)

(assert (=> b!832204 (= e!464114 (contains!4212 (toList!4505 lt!377729) (tuple2!10157 lt!377590 zeroValueAfter!34)))))

(assert (= (and d!106421 res!566261) b!832203))

(assert (= (and b!832203 res!566262) b!832204))

(declare-fun m!776317 () Bool)

(assert (=> d!106421 m!776317))

(declare-fun m!776319 () Bool)

(assert (=> d!106421 m!776319))

(declare-fun m!776321 () Bool)

(assert (=> d!106421 m!776321))

(declare-fun m!776323 () Bool)

(assert (=> d!106421 m!776323))

(declare-fun m!776325 () Bool)

(assert (=> b!832203 m!776325))

(declare-fun m!776327 () Bool)

(assert (=> b!832204 m!776327))

(assert (=> b!831981 d!106421))

(declare-fun d!106423 () Bool)

(assert (=> d!106423 (= (apply!373 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)) lt!377589) (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754))) lt!377589)))))

(declare-fun bs!23269 () Bool)

(assert (= bs!23269 d!106423))

(declare-fun m!776329 () Bool)

(assert (=> bs!23269 m!776329))

(assert (=> bs!23269 m!776329))

(declare-fun m!776331 () Bool)

(assert (=> bs!23269 m!776331))

(assert (=> b!831981 d!106423))

(declare-fun d!106425 () Bool)

(assert (=> d!106425 (= (apply!373 lt!377593 lt!377595) (get!11824 (getValueByKey!416 (toList!4505 lt!377593) lt!377595)))))

(declare-fun bs!23270 () Bool)

(assert (= bs!23270 d!106425))

(declare-fun m!776333 () Bool)

(assert (=> bs!23270 m!776333))

(assert (=> bs!23270 m!776333))

(declare-fun m!776335 () Bool)

(assert (=> bs!23270 m!776335))

(assert (=> b!831981 d!106425))

(declare-fun d!106427 () Bool)

(assert (=> d!106427 (= (apply!373 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)) lt!377589) (apply!373 lt!377598 lt!377589))))

(declare-fun lt!377730 () Unit!28493)

(assert (=> d!106427 (= lt!377730 (choose!1424 lt!377598 lt!377585 minValue!754 lt!377589))))

(declare-fun e!464115 () Bool)

(assert (=> d!106427 e!464115))

(declare-fun res!566263 () Bool)

(assert (=> d!106427 (=> (not res!566263) (not e!464115))))

(assert (=> d!106427 (= res!566263 (contains!4211 lt!377598 lt!377589))))

(assert (=> d!106427 (= (addApplyDifferent!324 lt!377598 lt!377585 minValue!754 lt!377589) lt!377730)))

(declare-fun b!832205 () Bool)

(assert (=> b!832205 (= e!464115 (not (= lt!377589 lt!377585)))))

(assert (= (and d!106427 res!566263) b!832205))

(declare-fun m!776337 () Bool)

(assert (=> d!106427 m!776337))

(assert (=> d!106427 m!775947))

(assert (=> d!106427 m!775941))

(assert (=> d!106427 m!775947))

(assert (=> d!106427 m!775949))

(declare-fun m!776339 () Bool)

(assert (=> d!106427 m!776339))

(assert (=> b!831981 d!106427))

(declare-fun d!106429 () Bool)

(assert (=> d!106429 (= (apply!373 lt!377598 lt!377589) (get!11824 (getValueByKey!416 (toList!4505 lt!377598) lt!377589)))))

(declare-fun bs!23271 () Bool)

(assert (= bs!23271 d!106429))

(declare-fun m!776341 () Bool)

(assert (=> bs!23271 m!776341))

(assert (=> bs!23271 m!776341))

(declare-fun m!776343 () Bool)

(assert (=> bs!23271 m!776343))

(assert (=> b!831981 d!106429))

(declare-fun d!106431 () Bool)

(assert (=> d!106431 (= (apply!373 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)) lt!377600) (apply!373 lt!377587 lt!377600))))

(declare-fun lt!377731 () Unit!28493)

(assert (=> d!106431 (= lt!377731 (choose!1424 lt!377587 lt!377586 zeroValueAfter!34 lt!377600))))

(declare-fun e!464116 () Bool)

(assert (=> d!106431 e!464116))

(declare-fun res!566264 () Bool)

(assert (=> d!106431 (=> (not res!566264) (not e!464116))))

(assert (=> d!106431 (= res!566264 (contains!4211 lt!377587 lt!377600))))

(assert (=> d!106431 (= (addApplyDifferent!324 lt!377587 lt!377586 zeroValueAfter!34 lt!377600) lt!377731)))

(declare-fun b!832206 () Bool)

(assert (=> b!832206 (= e!464116 (not (= lt!377600 lt!377586)))))

(assert (= (and d!106431 res!566264) b!832206))

(declare-fun m!776345 () Bool)

(assert (=> d!106431 m!776345))

(assert (=> d!106431 m!775931))

(assert (=> d!106431 m!775937))

(assert (=> d!106431 m!775931))

(assert (=> d!106431 m!775945))

(declare-fun m!776347 () Bool)

(assert (=> d!106431 m!776347))

(assert (=> b!831981 d!106431))

(declare-fun d!106433 () Bool)

(declare-fun e!464117 () Bool)

(assert (=> d!106433 e!464117))

(declare-fun res!566265 () Bool)

(assert (=> d!106433 (=> (not res!566265) (not e!464117))))

(declare-fun lt!377735 () ListLongMap!8979)

(assert (=> d!106433 (= res!566265 (contains!4211 lt!377735 (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun lt!377734 () List!15949)

(assert (=> d!106433 (= lt!377735 (ListLongMap!8980 lt!377734))))

(declare-fun lt!377732 () Unit!28493)

(declare-fun lt!377733 () Unit!28493)

(assert (=> d!106433 (= lt!377732 lt!377733)))

(assert (=> d!106433 (= (getValueByKey!416 lt!377734 (_1!5089 (tuple2!10157 lt!377594 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377594 minValue!754))))))

(assert (=> d!106433 (= lt!377733 (lemmaContainsTupThenGetReturnValue!230 lt!377734 (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754))))))

(assert (=> d!106433 (= lt!377734 (insertStrictlySorted!269 (toList!4505 lt!377593) (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754))))))

(assert (=> d!106433 (= (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)) lt!377735)))

(declare-fun b!832207 () Bool)

(declare-fun res!566266 () Bool)

(assert (=> b!832207 (=> (not res!566266) (not e!464117))))

(assert (=> b!832207 (= res!566266 (= (getValueByKey!416 (toList!4505 lt!377735) (_1!5089 (tuple2!10157 lt!377594 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(declare-fun b!832208 () Bool)

(assert (=> b!832208 (= e!464117 (contains!4212 (toList!4505 lt!377735) (tuple2!10157 lt!377594 minValue!754)))))

(assert (= (and d!106433 res!566265) b!832207))

(assert (= (and b!832207 res!566266) b!832208))

(declare-fun m!776349 () Bool)

(assert (=> d!106433 m!776349))

(declare-fun m!776351 () Bool)

(assert (=> d!106433 m!776351))

(declare-fun m!776353 () Bool)

(assert (=> d!106433 m!776353))

(declare-fun m!776355 () Bool)

(assert (=> d!106433 m!776355))

(declare-fun m!776357 () Bool)

(assert (=> b!832207 m!776357))

(declare-fun m!776359 () Bool)

(assert (=> b!832208 m!776359))

(assert (=> b!831981 d!106433))

(declare-fun b!832211 () Bool)

(declare-fun e!464119 () Option!422)

(assert (=> b!832211 (= e!464119 (getValueByKey!416 (t!22317 (toList!4505 lt!377465)) (_1!5089 lt!377428)))))

(declare-fun b!832210 () Bool)

(declare-fun e!464118 () Option!422)

(assert (=> b!832210 (= e!464118 e!464119)))

(declare-fun c!90425 () Bool)

(assert (=> b!832210 (= c!90425 (and ((_ is Cons!15945) (toList!4505 lt!377465)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377465))) (_1!5089 lt!377428)))))))

(declare-fun b!832212 () Bool)

(assert (=> b!832212 (= e!464119 None!420)))

(declare-fun b!832209 () Bool)

(assert (=> b!832209 (= e!464118 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377465)))))))

(declare-fun d!106435 () Bool)

(declare-fun c!90424 () Bool)

(assert (=> d!106435 (= c!90424 (and ((_ is Cons!15945) (toList!4505 lt!377465)) (= (_1!5089 (h!17075 (toList!4505 lt!377465))) (_1!5089 lt!377428))))))

(assert (=> d!106435 (= (getValueByKey!416 (toList!4505 lt!377465) (_1!5089 lt!377428)) e!464118)))

(assert (= (and d!106435 c!90424) b!832209))

(assert (= (and d!106435 (not c!90424)) b!832210))

(assert (= (and b!832210 c!90425) b!832211))

(assert (= (and b!832210 (not c!90425)) b!832212))

(declare-fun m!776361 () Bool)

(assert (=> b!832211 m!776361))

(assert (=> b!831841 d!106435))

(declare-fun d!106437 () Bool)

(declare-fun e!464120 () Bool)

(assert (=> d!106437 e!464120))

(declare-fun res!566267 () Bool)

(assert (=> d!106437 (=> res!566267 e!464120)))

(declare-fun lt!377739 () Bool)

(assert (=> d!106437 (= res!566267 (not lt!377739))))

(declare-fun lt!377738 () Bool)

(assert (=> d!106437 (= lt!377739 lt!377738)))

(declare-fun lt!377737 () Unit!28493)

(declare-fun e!464121 () Unit!28493)

(assert (=> d!106437 (= lt!377737 e!464121)))

(declare-fun c!90426 () Bool)

(assert (=> d!106437 (= c!90426 lt!377738)))

(assert (=> d!106437 (= lt!377738 (containsKey!402 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106437 (= (contains!4211 lt!377605 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377739)))

(declare-fun b!832213 () Bool)

(declare-fun lt!377736 () Unit!28493)

(assert (=> b!832213 (= e!464121 lt!377736)))

(assert (=> b!832213 (= lt!377736 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!832213 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832214 () Bool)

(declare-fun Unit!28508 () Unit!28493)

(assert (=> b!832214 (= e!464121 Unit!28508)))

(declare-fun b!832215 () Bool)

(assert (=> b!832215 (= e!464120 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106437 c!90426) b!832213))

(assert (= (and d!106437 (not c!90426)) b!832214))

(assert (= (and d!106437 (not res!566267)) b!832215))

(declare-fun m!776363 () Bool)

(assert (=> d!106437 m!776363))

(declare-fun m!776365 () Bool)

(assert (=> b!832213 m!776365))

(assert (=> b!832213 m!775971))

(assert (=> b!832213 m!775971))

(declare-fun m!776367 () Bool)

(assert (=> b!832213 m!776367))

(assert (=> b!832215 m!775971))

(assert (=> b!832215 m!775971))

(assert (=> b!832215 m!776367))

(assert (=> d!106317 d!106437))

(declare-fun b!832218 () Bool)

(declare-fun e!464123 () Option!422)

(assert (=> b!832218 (= e!464123 (getValueByKey!416 (t!22317 lt!377604) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832217 () Bool)

(declare-fun e!464122 () Option!422)

(assert (=> b!832217 (= e!464122 e!464123)))

(declare-fun c!90428 () Bool)

(assert (=> b!832217 (= c!90428 (and ((_ is Cons!15945) lt!377604) (not (= (_1!5089 (h!17075 lt!377604)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832219 () Bool)

(assert (=> b!832219 (= e!464123 None!420)))

(declare-fun b!832216 () Bool)

(assert (=> b!832216 (= e!464122 (Some!421 (_2!5089 (h!17075 lt!377604))))))

(declare-fun d!106439 () Bool)

(declare-fun c!90427 () Bool)

(assert (=> d!106439 (= c!90427 (and ((_ is Cons!15945) lt!377604) (= (_1!5089 (h!17075 lt!377604)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106439 (= (getValueByKey!416 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464122)))

(assert (= (and d!106439 c!90427) b!832216))

(assert (= (and d!106439 (not c!90427)) b!832217))

(assert (= (and b!832217 c!90428) b!832218))

(assert (= (and b!832217 (not c!90428)) b!832219))

(declare-fun m!776369 () Bool)

(assert (=> b!832218 m!776369))

(assert (=> d!106317 d!106439))

(declare-fun d!106441 () Bool)

(assert (=> d!106441 (= (getValueByKey!416 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377740 () Unit!28493)

(assert (=> d!106441 (= lt!377740 (choose!1423 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464124 () Bool)

(assert (=> d!106441 e!464124))

(declare-fun res!566268 () Bool)

(assert (=> d!106441 (=> (not res!566268) (not e!464124))))

(assert (=> d!106441 (= res!566268 (isStrictlySorted!442 lt!377604))))

(assert (=> d!106441 (= (lemmaContainsTupThenGetReturnValue!230 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377740)))

(declare-fun b!832220 () Bool)

(declare-fun res!566269 () Bool)

(assert (=> b!832220 (=> (not res!566269) (not e!464124))))

(assert (=> b!832220 (= res!566269 (containsKey!402 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832221 () Bool)

(assert (=> b!832221 (= e!464124 (contains!4212 lt!377604 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106441 res!566268) b!832220))

(assert (= (and b!832220 res!566269) b!832221))

(assert (=> d!106441 m!775965))

(declare-fun m!776371 () Bool)

(assert (=> d!106441 m!776371))

(declare-fun m!776373 () Bool)

(assert (=> d!106441 m!776373))

(declare-fun m!776375 () Bool)

(assert (=> b!832220 m!776375))

(declare-fun m!776377 () Bool)

(assert (=> b!832221 m!776377))

(assert (=> d!106317 d!106441))

(declare-fun b!832222 () Bool)

(declare-fun e!464126 () List!15949)

(declare-fun call!36413 () List!15949)

(assert (=> b!832222 (= e!464126 call!36413)))

(declare-fun b!832223 () Bool)

(declare-fun e!464125 () List!15949)

(assert (=> b!832223 (= e!464125 (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun bm!36409 () Bool)

(declare-fun call!36412 () List!15949)

(assert (=> bm!36409 (= call!36413 call!36412)))

(declare-fun b!832224 () Bool)

(assert (=> b!832224 (= e!464126 call!36413)))

(declare-fun c!90431 () Bool)

(declare-fun b!832225 () Bool)

(declare-fun c!90429 () Bool)

(assert (=> b!832225 (= e!464125 (ite c!90431 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))) (ite c!90429 (Cons!15945 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428))) (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) Nil!15946)))))

(declare-fun bm!36410 () Bool)

(declare-fun c!90432 () Bool)

(declare-fun call!36414 () List!15949)

(assert (=> bm!36410 (= call!36414 ($colon$colon!537 e!464125 (ite c!90432 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428))) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90430 () Bool)

(assert (=> bm!36410 (= c!90430 c!90432)))

(declare-fun b!832226 () Bool)

(declare-fun res!566271 () Bool)

(declare-fun e!464128 () Bool)

(assert (=> b!832226 (=> (not res!566271) (not e!464128))))

(declare-fun lt!377741 () List!15949)

(assert (=> b!832226 (= res!566271 (containsKey!402 lt!377741 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832227 () Bool)

(declare-fun e!464129 () List!15949)

(assert (=> b!832227 (= e!464129 call!36414)))

(declare-fun b!832228 () Bool)

(assert (=> b!832228 (= c!90429 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377423 lt!377428))) (bvsgt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464127 () List!15949)

(assert (=> b!832228 (= e!464127 e!464126)))

(declare-fun d!106443 () Bool)

(assert (=> d!106443 e!464128))

(declare-fun res!566270 () Bool)

(assert (=> d!106443 (=> (not res!566270) (not e!464128))))

(assert (=> d!106443 (= res!566270 (isStrictlySorted!442 lt!377741))))

(assert (=> d!106443 (= lt!377741 e!464129)))

(assert (=> d!106443 (= c!90432 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377423 lt!377428))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106443 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377423 lt!377428)))))

(assert (=> d!106443 (= (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377423 lt!377428)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377741)))

(declare-fun b!832229 () Bool)

(assert (=> b!832229 (= e!464127 call!36412)))

(declare-fun bm!36411 () Bool)

(assert (=> bm!36411 (= call!36412 call!36414)))

(declare-fun b!832230 () Bool)

(assert (=> b!832230 (= e!464128 (contains!4212 lt!377741 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832231 () Bool)

(assert (=> b!832231 (= e!464129 e!464127)))

(assert (=> b!832231 (= c!90431 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377423 lt!377428))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106443 c!90432) b!832227))

(assert (= (and d!106443 (not c!90432)) b!832231))

(assert (= (and b!832231 c!90431) b!832229))

(assert (= (and b!832231 (not c!90431)) b!832228))

(assert (= (and b!832228 c!90429) b!832222))

(assert (= (and b!832228 (not c!90429)) b!832224))

(assert (= (or b!832222 b!832224) bm!36409))

(assert (= (or b!832229 bm!36409) bm!36411))

(assert (= (or b!832227 bm!36411) bm!36410))

(assert (= (and bm!36410 c!90430) b!832223))

(assert (= (and bm!36410 (not c!90430)) b!832225))

(assert (= (and d!106443 res!566270) b!832226))

(assert (= (and b!832226 res!566271) b!832230))

(declare-fun m!776379 () Bool)

(assert (=> d!106443 m!776379))

(declare-fun m!776381 () Bool)

(assert (=> d!106443 m!776381))

(declare-fun m!776383 () Bool)

(assert (=> b!832226 m!776383))

(declare-fun m!776385 () Bool)

(assert (=> b!832230 m!776385))

(declare-fun m!776387 () Bool)

(assert (=> bm!36410 m!776387))

(declare-fun m!776389 () Bool)

(assert (=> b!832223 m!776389))

(assert (=> d!106317 d!106443))

(assert (=> b!831967 d!106335))

(declare-fun d!106445 () Bool)

(declare-fun e!464130 () Bool)

(assert (=> d!106445 e!464130))

(declare-fun res!566272 () Bool)

(assert (=> d!106445 (=> res!566272 e!464130)))

(declare-fun lt!377745 () Bool)

(assert (=> d!106445 (= res!566272 (not lt!377745))))

(declare-fun lt!377744 () Bool)

(assert (=> d!106445 (= lt!377745 lt!377744)))

(declare-fun lt!377743 () Unit!28493)

(declare-fun e!464131 () Unit!28493)

(assert (=> d!106445 (= lt!377743 e!464131)))

(declare-fun c!90433 () Bool)

(assert (=> d!106445 (= c!90433 lt!377744)))

(assert (=> d!106445 (= lt!377744 (containsKey!402 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106445 (= (contains!4211 lt!377580 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!377745)))

(declare-fun b!832232 () Bool)

(declare-fun lt!377742 () Unit!28493)

(assert (=> b!832232 (= e!464131 lt!377742)))

(assert (=> b!832232 (= lt!377742 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832232 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832233 () Bool)

(declare-fun Unit!28509 () Unit!28493)

(assert (=> b!832233 (= e!464131 Unit!28509)))

(declare-fun b!832234 () Bool)

(assert (=> b!832234 (= e!464130 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106445 c!90433) b!832232))

(assert (= (and d!106445 (not c!90433)) b!832233))

(assert (= (and d!106445 (not res!566272)) b!832234))

(assert (=> d!106445 m!775791))

(declare-fun m!776391 () Bool)

(assert (=> d!106445 m!776391))

(assert (=> b!832232 m!775791))

(declare-fun m!776393 () Bool)

(assert (=> b!832232 m!776393))

(assert (=> b!832232 m!775791))

(declare-fun m!776395 () Bool)

(assert (=> b!832232 m!776395))

(assert (=> b!832232 m!776395))

(declare-fun m!776397 () Bool)

(assert (=> b!832232 m!776397))

(assert (=> b!832234 m!775791))

(assert (=> b!832234 m!776395))

(assert (=> b!832234 m!776395))

(assert (=> b!832234 m!776397))

(assert (=> b!831978 d!106445))

(declare-fun b!832235 () Bool)

(declare-fun e!464134 () ListLongMap!8979)

(assert (=> b!832235 (= e!464134 (ListLongMap!8980 Nil!15946))))

(declare-fun b!832236 () Bool)

(declare-fun lt!377752 () Unit!28493)

(declare-fun lt!377748 () Unit!28493)

(assert (=> b!832236 (= lt!377752 lt!377748)))

(declare-fun lt!377749 () (_ BitVec 64))

(declare-fun lt!377746 () V!25285)

(declare-fun lt!377751 () ListLongMap!8979)

(declare-fun lt!377747 () (_ BitVec 64))

(assert (=> b!832236 (not (contains!4211 (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746)) lt!377749))))

(assert (=> b!832236 (= lt!377748 (addStillNotContains!198 lt!377751 lt!377747 lt!377746 lt!377749))))

(assert (=> b!832236 (= lt!377749 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!832236 (= lt!377746 (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!832236 (= lt!377747 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!36415 () ListLongMap!8979)

(assert (=> b!832236 (= lt!377751 call!36415)))

(declare-fun e!464137 () ListLongMap!8979)

(assert (=> b!832236 (= e!464137 (+!1983 call!36415 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36412 () Bool)

(assert (=> bm!36412 (= call!36415 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!832237 () Bool)

(declare-fun lt!377750 () ListLongMap!8979)

(declare-fun e!464138 () Bool)

(assert (=> b!832237 (= e!464138 (= lt!377750 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!106447 () Bool)

(declare-fun e!464135 () Bool)

(assert (=> d!106447 e!464135))

(declare-fun res!566273 () Bool)

(assert (=> d!106447 (=> (not res!566273) (not e!464135))))

(assert (=> d!106447 (= res!566273 (not (contains!4211 lt!377750 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106447 (= lt!377750 e!464134)))

(declare-fun c!90434 () Bool)

(assert (=> d!106447 (= c!90434 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!106447 (validMask!0 mask!1312)))

(assert (=> d!106447 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!377750)))

(declare-fun b!832238 () Bool)

(assert (=> b!832238 (= e!464137 call!36415)))

(declare-fun b!832239 () Bool)

(declare-fun e!464136 () Bool)

(assert (=> b!832239 (= e!464136 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832239 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!832240 () Bool)

(declare-fun e!464133 () Bool)

(assert (=> b!832240 (= e!464133 e!464138)))

(declare-fun c!90435 () Bool)

(assert (=> b!832240 (= c!90435 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!832241 () Bool)

(assert (=> b!832241 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> b!832241 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22756 _values!788)))))

(declare-fun e!464132 () Bool)

(assert (=> b!832241 (= e!464132 (= (apply!373 lt!377750 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832242 () Bool)

(assert (=> b!832242 (= e!464135 e!464133)))

(declare-fun c!90437 () Bool)

(assert (=> b!832242 (= c!90437 e!464136)))

(declare-fun res!566275 () Bool)

(assert (=> b!832242 (=> (not res!566275) (not e!464136))))

(assert (=> b!832242 (= res!566275 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!832243 () Bool)

(assert (=> b!832243 (= e!464138 (isEmpty!657 lt!377750))))

(declare-fun b!832244 () Bool)

(assert (=> b!832244 (= e!464134 e!464137)))

(declare-fun c!90436 () Bool)

(assert (=> b!832244 (= c!90436 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832245 () Bool)

(assert (=> b!832245 (= e!464133 e!464132)))

(assert (=> b!832245 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun res!566276 () Bool)

(assert (=> b!832245 (= res!566276 (contains!4211 lt!377750 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832245 (=> (not res!566276) (not e!464132))))

(declare-fun b!832246 () Bool)

(declare-fun res!566274 () Bool)

(assert (=> b!832246 (=> (not res!566274) (not e!464135))))

(assert (=> b!832246 (= res!566274 (not (contains!4211 lt!377750 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106447 c!90434) b!832235))

(assert (= (and d!106447 (not c!90434)) b!832244))

(assert (= (and b!832244 c!90436) b!832236))

(assert (= (and b!832244 (not c!90436)) b!832238))

(assert (= (or b!832236 b!832238) bm!36412))

(assert (= (and d!106447 res!566273) b!832246))

(assert (= (and b!832246 res!566274) b!832242))

(assert (= (and b!832242 res!566275) b!832239))

(assert (= (and b!832242 c!90437) b!832245))

(assert (= (and b!832242 (not c!90437)) b!832240))

(assert (= (and b!832245 res!566276) b!832241))

(assert (= (and b!832240 c!90435) b!832237))

(assert (= (and b!832240 (not c!90435)) b!832243))

(declare-fun b_lambda!11431 () Bool)

(assert (=> (not b_lambda!11431) (not b!832236)))

(assert (=> b!832236 t!22322))

(declare-fun b_and!22581 () Bool)

(assert (= b_and!22579 (and (=> t!22322 result!8021) b_and!22581)))

(declare-fun b_lambda!11433 () Bool)

(assert (=> (not b_lambda!11433) (not b!832241)))

(assert (=> b!832241 t!22322))

(declare-fun b_and!22583 () Bool)

(assert (= b_and!22581 (and (=> t!22322 result!8021) b_and!22583)))

(declare-fun m!776399 () Bool)

(assert (=> b!832246 m!776399))

(assert (=> b!832239 m!776103))

(assert (=> b!832239 m!776103))

(assert (=> b!832239 m!776105))

(assert (=> b!832244 m!776103))

(assert (=> b!832244 m!776103))

(assert (=> b!832244 m!776105))

(declare-fun m!776401 () Bool)

(assert (=> b!832237 m!776401))

(declare-fun m!776403 () Bool)

(assert (=> b!832243 m!776403))

(declare-fun m!776405 () Bool)

(assert (=> b!832236 m!776405))

(assert (=> b!832236 m!775801))

(assert (=> b!832236 m!776141))

(assert (=> b!832236 m!776103))

(assert (=> b!832236 m!776141))

(assert (=> b!832236 m!775801))

(assert (=> b!832236 m!776143))

(declare-fun m!776407 () Bool)

(assert (=> b!832236 m!776407))

(declare-fun m!776409 () Bool)

(assert (=> b!832236 m!776409))

(assert (=> b!832236 m!776407))

(declare-fun m!776411 () Bool)

(assert (=> b!832236 m!776411))

(assert (=> bm!36412 m!776401))

(assert (=> b!832241 m!776103))

(declare-fun m!776413 () Bool)

(assert (=> b!832241 m!776413))

(assert (=> b!832241 m!775801))

(assert (=> b!832241 m!776141))

(assert (=> b!832241 m!776103))

(assert (=> b!832241 m!776141))

(assert (=> b!832241 m!775801))

(assert (=> b!832241 m!776143))

(assert (=> b!832245 m!776103))

(assert (=> b!832245 m!776103))

(declare-fun m!776415 () Bool)

(assert (=> b!832245 m!776415))

(declare-fun m!776417 () Bool)

(assert (=> d!106447 m!776417))

(assert (=> d!106447 m!775715))

(assert (=> bm!36359 d!106447))

(declare-fun b!832249 () Bool)

(declare-fun e!464140 () Option!422)

(assert (=> b!832249 (= e!464140 (getValueByKey!416 (t!22317 (toList!4505 lt!377461)) (_1!5089 lt!377425)))))

(declare-fun b!832248 () Bool)

(declare-fun e!464139 () Option!422)

(assert (=> b!832248 (= e!464139 e!464140)))

(declare-fun c!90439 () Bool)

(assert (=> b!832248 (= c!90439 (and ((_ is Cons!15945) (toList!4505 lt!377461)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377461))) (_1!5089 lt!377425)))))))

(declare-fun b!832250 () Bool)

(assert (=> b!832250 (= e!464140 None!420)))

(declare-fun b!832247 () Bool)

(assert (=> b!832247 (= e!464139 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377461)))))))

(declare-fun d!106449 () Bool)

(declare-fun c!90438 () Bool)

(assert (=> d!106449 (= c!90438 (and ((_ is Cons!15945) (toList!4505 lt!377461)) (= (_1!5089 (h!17075 (toList!4505 lt!377461))) (_1!5089 lt!377425))))))

(assert (=> d!106449 (= (getValueByKey!416 (toList!4505 lt!377461) (_1!5089 lt!377425)) e!464139)))

(assert (= (and d!106449 c!90438) b!832247))

(assert (= (and d!106449 (not c!90438)) b!832248))

(assert (= (and b!832248 c!90439) b!832249))

(assert (= (and b!832248 (not c!90439)) b!832250))

(declare-fun m!776419 () Bool)

(assert (=> b!832249 m!776419))

(assert (=> b!831839 d!106449))

(declare-fun d!106451 () Bool)

(declare-fun e!464141 () Bool)

(assert (=> d!106451 e!464141))

(declare-fun res!566277 () Bool)

(assert (=> d!106451 (=> res!566277 e!464141)))

(declare-fun lt!377756 () Bool)

(assert (=> d!106451 (= res!566277 (not lt!377756))))

(declare-fun lt!377755 () Bool)

(assert (=> d!106451 (= lt!377756 lt!377755)))

(declare-fun lt!377754 () Unit!28493)

(declare-fun e!464142 () Unit!28493)

(assert (=> d!106451 (= lt!377754 e!464142)))

(declare-fun c!90440 () Bool)

(assert (=> d!106451 (= c!90440 lt!377755)))

(assert (=> d!106451 (= lt!377755 (containsKey!402 (toList!4505 lt!377613) (_1!5089 lt!377428)))))

(assert (=> d!106451 (= (contains!4211 lt!377613 (_1!5089 lt!377428)) lt!377756)))

(declare-fun b!832251 () Bool)

(declare-fun lt!377753 () Unit!28493)

(assert (=> b!832251 (= e!464142 lt!377753)))

(assert (=> b!832251 (= lt!377753 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377613) (_1!5089 lt!377428)))))

(assert (=> b!832251 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377613) (_1!5089 lt!377428)))))

(declare-fun b!832252 () Bool)

(declare-fun Unit!28510 () Unit!28493)

(assert (=> b!832252 (= e!464142 Unit!28510)))

(declare-fun b!832253 () Bool)

(assert (=> b!832253 (= e!464141 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377613) (_1!5089 lt!377428))))))

(assert (= (and d!106451 c!90440) b!832251))

(assert (= (and d!106451 (not c!90440)) b!832252))

(assert (= (and d!106451 (not res!566277)) b!832253))

(declare-fun m!776421 () Bool)

(assert (=> d!106451 m!776421))

(declare-fun m!776423 () Bool)

(assert (=> b!832251 m!776423))

(assert (=> b!832251 m!775995))

(assert (=> b!832251 m!775995))

(declare-fun m!776425 () Bool)

(assert (=> b!832251 m!776425))

(assert (=> b!832253 m!775995))

(assert (=> b!832253 m!775995))

(assert (=> b!832253 m!776425))

(assert (=> d!106327 d!106451))

(declare-fun b!832256 () Bool)

(declare-fun e!464144 () Option!422)

(assert (=> b!832256 (= e!464144 (getValueByKey!416 (t!22317 lt!377612) (_1!5089 lt!377428)))))

(declare-fun b!832255 () Bool)

(declare-fun e!464143 () Option!422)

(assert (=> b!832255 (= e!464143 e!464144)))

(declare-fun c!90442 () Bool)

(assert (=> b!832255 (= c!90442 (and ((_ is Cons!15945) lt!377612) (not (= (_1!5089 (h!17075 lt!377612)) (_1!5089 lt!377428)))))))

(declare-fun b!832257 () Bool)

(assert (=> b!832257 (= e!464144 None!420)))

(declare-fun b!832254 () Bool)

(assert (=> b!832254 (= e!464143 (Some!421 (_2!5089 (h!17075 lt!377612))))))

(declare-fun d!106453 () Bool)

(declare-fun c!90441 () Bool)

(assert (=> d!106453 (= c!90441 (and ((_ is Cons!15945) lt!377612) (= (_1!5089 (h!17075 lt!377612)) (_1!5089 lt!377428))))))

(assert (=> d!106453 (= (getValueByKey!416 lt!377612 (_1!5089 lt!377428)) e!464143)))

(assert (= (and d!106453 c!90441) b!832254))

(assert (= (and d!106453 (not c!90441)) b!832255))

(assert (= (and b!832255 c!90442) b!832256))

(assert (= (and b!832255 (not c!90442)) b!832257))

(declare-fun m!776427 () Bool)

(assert (=> b!832256 m!776427))

(assert (=> d!106327 d!106453))

(declare-fun d!106455 () Bool)

(assert (=> d!106455 (= (getValueByKey!416 lt!377612 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(declare-fun lt!377757 () Unit!28493)

(assert (=> d!106455 (= lt!377757 (choose!1423 lt!377612 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun e!464145 () Bool)

(assert (=> d!106455 e!464145))

(declare-fun res!566278 () Bool)

(assert (=> d!106455 (=> (not res!566278) (not e!464145))))

(assert (=> d!106455 (= res!566278 (isStrictlySorted!442 lt!377612))))

(assert (=> d!106455 (= (lemmaContainsTupThenGetReturnValue!230 lt!377612 (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377757)))

(declare-fun b!832258 () Bool)

(declare-fun res!566279 () Bool)

(assert (=> b!832258 (=> (not res!566279) (not e!464145))))

(assert (=> b!832258 (= res!566279 (containsKey!402 lt!377612 (_1!5089 lt!377428)))))

(declare-fun b!832259 () Bool)

(assert (=> b!832259 (= e!464145 (contains!4212 lt!377612 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106455 res!566278) b!832258))

(assert (= (and b!832258 res!566279) b!832259))

(assert (=> d!106455 m!775989))

(declare-fun m!776429 () Bool)

(assert (=> d!106455 m!776429))

(declare-fun m!776431 () Bool)

(assert (=> d!106455 m!776431))

(declare-fun m!776433 () Bool)

(assert (=> b!832258 m!776433))

(declare-fun m!776435 () Bool)

(assert (=> b!832259 m!776435))

(assert (=> d!106327 d!106455))

(declare-fun b!832260 () Bool)

(declare-fun e!464147 () List!15949)

(declare-fun call!36417 () List!15949)

(assert (=> b!832260 (= e!464147 call!36417)))

(declare-fun e!464146 () List!15949)

(declare-fun b!832261 () Bool)

(assert (=> b!832261 (= e!464146 (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36413 () Bool)

(declare-fun call!36416 () List!15949)

(assert (=> bm!36413 (= call!36417 call!36416)))

(declare-fun b!832262 () Bool)

(assert (=> b!832262 (= e!464147 call!36417)))

(declare-fun b!832263 () Bool)

(declare-fun c!90443 () Bool)

(declare-fun c!90445 () Bool)

(assert (=> b!832263 (= e!464146 (ite c!90445 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (ite c!90443 (Cons!15945 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) Nil!15946)))))

(declare-fun call!36418 () List!15949)

(declare-fun c!90446 () Bool)

(declare-fun bm!36414 () Bool)

(assert (=> bm!36414 (= call!36418 ($colon$colon!537 e!464146 (ite c!90446 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90444 () Bool)

(assert (=> bm!36414 (= c!90444 c!90446)))

(declare-fun b!832264 () Bool)

(declare-fun res!566281 () Bool)

(declare-fun e!464149 () Bool)

(assert (=> b!832264 (=> (not res!566281) (not e!464149))))

(declare-fun lt!377758 () List!15949)

(assert (=> b!832264 (= res!566281 (containsKey!402 lt!377758 (_1!5089 lt!377428)))))

(declare-fun b!832265 () Bool)

(declare-fun e!464150 () List!15949)

(assert (=> b!832265 (= e!464150 call!36418)))

(declare-fun b!832266 () Bool)

(assert (=> b!832266 (= c!90443 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvsgt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5089 lt!377428))))))

(declare-fun e!464148 () List!15949)

(assert (=> b!832266 (= e!464148 e!464147)))

(declare-fun d!106457 () Bool)

(assert (=> d!106457 e!464149))

(declare-fun res!566280 () Bool)

(assert (=> d!106457 (=> (not res!566280) (not e!464149))))

(assert (=> d!106457 (= res!566280 (isStrictlySorted!442 lt!377758))))

(assert (=> d!106457 (= lt!377758 e!464150)))

(assert (=> d!106457 (= c!90446 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5089 lt!377428))))))

(assert (=> d!106457 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106457 (= (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377758)))

(declare-fun b!832267 () Bool)

(assert (=> b!832267 (= e!464148 call!36416)))

(declare-fun bm!36415 () Bool)

(assert (=> bm!36415 (= call!36416 call!36418)))

(declare-fun b!832268 () Bool)

(assert (=> b!832268 (= e!464149 (contains!4212 lt!377758 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832269 () Bool)

(assert (=> b!832269 (= e!464150 e!464148)))

(assert (=> b!832269 (= c!90445 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5089 lt!377428))))))

(assert (= (and d!106457 c!90446) b!832265))

(assert (= (and d!106457 (not c!90446)) b!832269))

(assert (= (and b!832269 c!90445) b!832267))

(assert (= (and b!832269 (not c!90445)) b!832266))

(assert (= (and b!832266 c!90443) b!832260))

(assert (= (and b!832266 (not c!90443)) b!832262))

(assert (= (or b!832260 b!832262) bm!36413))

(assert (= (or b!832267 bm!36413) bm!36415))

(assert (= (or b!832265 bm!36415) bm!36414))

(assert (= (and bm!36414 c!90444) b!832261))

(assert (= (and bm!36414 (not c!90444)) b!832263))

(assert (= (and d!106457 res!566280) b!832264))

(assert (= (and b!832264 res!566281) b!832268))

(declare-fun m!776437 () Bool)

(assert (=> d!106457 m!776437))

(declare-fun m!776439 () Bool)

(assert (=> d!106457 m!776439))

(declare-fun m!776441 () Bool)

(assert (=> b!832264 m!776441))

(declare-fun m!776443 () Bool)

(assert (=> b!832268 m!776443))

(declare-fun m!776445 () Bool)

(assert (=> bm!36414 m!776445))

(declare-fun m!776447 () Bool)

(assert (=> b!832261 m!776447))

(assert (=> d!106327 d!106457))

(declare-fun d!106459 () Bool)

(declare-fun e!464151 () Bool)

(assert (=> d!106459 e!464151))

(declare-fun res!566282 () Bool)

(assert (=> d!106459 (=> res!566282 e!464151)))

(declare-fun lt!377762 () Bool)

(assert (=> d!106459 (= res!566282 (not lt!377762))))

(declare-fun lt!377761 () Bool)

(assert (=> d!106459 (= lt!377762 lt!377761)))

(declare-fun lt!377760 () Unit!28493)

(declare-fun e!464152 () Unit!28493)

(assert (=> d!106459 (= lt!377760 e!464152)))

(declare-fun c!90447 () Bool)

(assert (=> d!106459 (= c!90447 lt!377761)))

(assert (=> d!106459 (= lt!377761 (containsKey!402 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106459 (= (contains!4211 lt!377554 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377762)))

(declare-fun b!832270 () Bool)

(declare-fun lt!377759 () Unit!28493)

(assert (=> b!832270 (= e!464152 lt!377759)))

(assert (=> b!832270 (= lt!377759 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832270 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832271 () Bool)

(declare-fun Unit!28511 () Unit!28493)

(assert (=> b!832271 (= e!464152 Unit!28511)))

(declare-fun b!832272 () Bool)

(assert (=> b!832272 (= e!464151 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106459 c!90447) b!832270))

(assert (= (and d!106459 (not c!90447)) b!832271))

(assert (= (and d!106459 (not res!566282)) b!832272))

(declare-fun m!776449 () Bool)

(assert (=> d!106459 m!776449))

(declare-fun m!776451 () Bool)

(assert (=> b!832270 m!776451))

(declare-fun m!776453 () Bool)

(assert (=> b!832270 m!776453))

(assert (=> b!832270 m!776453))

(declare-fun m!776455 () Bool)

(assert (=> b!832270 m!776455))

(assert (=> b!832272 m!776453))

(assert (=> b!832272 m!776453))

(assert (=> b!832272 m!776455))

(assert (=> bm!36380 d!106459))

(declare-fun d!106461 () Bool)

(assert (=> d!106461 (= (apply!373 lt!377580 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23272 () Bool)

(assert (= bs!23272 d!106461))

(assert (=> bs!23272 m!776129))

(assert (=> bs!23272 m!776129))

(declare-fun m!776457 () Bool)

(assert (=> bs!23272 m!776457))

(assert (=> b!831984 d!106461))

(declare-fun d!106463 () Bool)

(declare-fun lt!377765 () Bool)

(declare-fun content!389 (List!15950) (InoxSet (_ BitVec 64)))

(assert (=> d!106463 (= lt!377765 (select (content!389 Nil!15947) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464158 () Bool)

(assert (=> d!106463 (= lt!377765 e!464158)))

(declare-fun res!566288 () Bool)

(assert (=> d!106463 (=> (not res!566288) (not e!464158))))

(assert (=> d!106463 (= res!566288 ((_ is Cons!15946) Nil!15947))))

(assert (=> d!106463 (= (contains!4213 Nil!15947 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!377765)))

(declare-fun b!832277 () Bool)

(declare-fun e!464157 () Bool)

(assert (=> b!832277 (= e!464158 e!464157)))

(declare-fun res!566287 () Bool)

(assert (=> b!832277 (=> res!566287 e!464157)))

(assert (=> b!832277 (= res!566287 (= (h!17076 Nil!15947) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832278 () Bool)

(assert (=> b!832278 (= e!464157 (contains!4213 (t!22318 Nil!15947) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106463 res!566288) b!832277))

(assert (= (and b!832277 (not res!566287)) b!832278))

(declare-fun m!776459 () Bool)

(assert (=> d!106463 m!776459))

(assert (=> d!106463 m!775791))

(declare-fun m!776461 () Bool)

(assert (=> d!106463 m!776461))

(assert (=> b!832278 m!775791))

(declare-fun m!776463 () Bool)

(assert (=> b!832278 m!776463))

(assert (=> b!832012 d!106463))

(assert (=> b!831890 d!106335))

(declare-fun d!106465 () Bool)

(declare-fun e!464159 () Bool)

(assert (=> d!106465 e!464159))

(declare-fun res!566289 () Bool)

(assert (=> d!106465 (=> res!566289 e!464159)))

(declare-fun lt!377769 () Bool)

(assert (=> d!106465 (= res!566289 (not lt!377769))))

(declare-fun lt!377768 () Bool)

(assert (=> d!106465 (= lt!377769 lt!377768)))

(declare-fun lt!377767 () Unit!28493)

(declare-fun e!464160 () Unit!28493)

(assert (=> d!106465 (= lt!377767 e!464160)))

(declare-fun c!90448 () Bool)

(assert (=> d!106465 (= c!90448 lt!377768)))

(assert (=> d!106465 (= lt!377768 (containsKey!402 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106465 (= (contains!4211 lt!377487 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377769)))

(declare-fun b!832279 () Bool)

(declare-fun lt!377766 () Unit!28493)

(assert (=> b!832279 (= e!464160 lt!377766)))

(assert (=> b!832279 (= lt!377766 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832279 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832280 () Bool)

(declare-fun Unit!28512 () Unit!28493)

(assert (=> b!832280 (= e!464160 Unit!28512)))

(declare-fun b!832281 () Bool)

(assert (=> b!832281 (= e!464159 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106465 c!90448) b!832279))

(assert (= (and d!106465 (not c!90448)) b!832280))

(assert (= (and d!106465 (not res!566289)) b!832281))

(declare-fun m!776465 () Bool)

(assert (=> d!106465 m!776465))

(declare-fun m!776467 () Bool)

(assert (=> b!832279 m!776467))

(declare-fun m!776469 () Bool)

(assert (=> b!832279 m!776469))

(assert (=> b!832279 m!776469))

(declare-fun m!776471 () Bool)

(assert (=> b!832279 m!776471))

(assert (=> b!832281 m!776469))

(assert (=> b!832281 m!776469))

(assert (=> b!832281 m!776471))

(assert (=> b!831878 d!106465))

(declare-fun b!832284 () Bool)

(declare-fun e!464162 () Option!422)

(assert (=> b!832284 (= e!464162 (getValueByKey!416 (t!22317 (toList!4505 lt!377613)) (_1!5089 lt!377428)))))

(declare-fun b!832283 () Bool)

(declare-fun e!464161 () Option!422)

(assert (=> b!832283 (= e!464161 e!464162)))

(declare-fun c!90450 () Bool)

(assert (=> b!832283 (= c!90450 (and ((_ is Cons!15945) (toList!4505 lt!377613)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377613))) (_1!5089 lt!377428)))))))

(declare-fun b!832285 () Bool)

(assert (=> b!832285 (= e!464162 None!420)))

(declare-fun b!832282 () Bool)

(assert (=> b!832282 (= e!464161 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377613)))))))

(declare-fun d!106467 () Bool)

(declare-fun c!90449 () Bool)

(assert (=> d!106467 (= c!90449 (and ((_ is Cons!15945) (toList!4505 lt!377613)) (= (_1!5089 (h!17075 (toList!4505 lt!377613))) (_1!5089 lt!377428))))))

(assert (=> d!106467 (= (getValueByKey!416 (toList!4505 lt!377613) (_1!5089 lt!377428)) e!464161)))

(assert (= (and d!106467 c!90449) b!832282))

(assert (= (and d!106467 (not c!90449)) b!832283))

(assert (= (and b!832283 c!90450) b!832284))

(assert (= (and b!832283 (not c!90450)) b!832285))

(declare-fun m!776473 () Bool)

(assert (=> b!832284 m!776473))

(assert (=> b!831997 d!106467))

(declare-fun d!106469 () Bool)

(declare-fun e!464163 () Bool)

(assert (=> d!106469 e!464163))

(declare-fun res!566290 () Bool)

(assert (=> d!106469 (=> (not res!566290) (not e!464163))))

(declare-fun lt!377773 () ListLongMap!8979)

(assert (=> d!106469 (= res!566290 (contains!4211 lt!377773 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377772 () List!15949)

(assert (=> d!106469 (= lt!377773 (ListLongMap!8980 lt!377772))))

(declare-fun lt!377770 () Unit!28493)

(declare-fun lt!377771 () Unit!28493)

(assert (=> d!106469 (= lt!377770 lt!377771)))

(assert (=> d!106469 (= (getValueByKey!416 lt!377772 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106469 (= lt!377771 (lemmaContainsTupThenGetReturnValue!230 lt!377772 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106469 (= lt!377772 (insertStrictlySorted!269 (toList!4505 call!36380) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106469 (= (+!1983 call!36380 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377773)))

(declare-fun b!832286 () Bool)

(declare-fun res!566291 () Bool)

(assert (=> b!832286 (=> (not res!566291) (not e!464163))))

(assert (=> b!832286 (= res!566291 (= (getValueByKey!416 (toList!4505 lt!377773) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832287 () Bool)

(assert (=> b!832287 (= e!464163 (contains!4212 (toList!4505 lt!377773) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106469 res!566290) b!832286))

(assert (= (and b!832286 res!566291) b!832287))

(declare-fun m!776475 () Bool)

(assert (=> d!106469 m!776475))

(declare-fun m!776477 () Bool)

(assert (=> d!106469 m!776477))

(declare-fun m!776479 () Bool)

(assert (=> d!106469 m!776479))

(declare-fun m!776481 () Bool)

(assert (=> d!106469 m!776481))

(declare-fun m!776483 () Bool)

(assert (=> b!832286 m!776483))

(declare-fun m!776485 () Bool)

(assert (=> b!832287 m!776485))

(assert (=> b!831969 d!106469))

(assert (=> b!831876 d!106335))

(declare-fun d!106471 () Bool)

(declare-fun e!464164 () Bool)

(assert (=> d!106471 e!464164))

(declare-fun res!566292 () Bool)

(assert (=> d!106471 (=> res!566292 e!464164)))

(declare-fun lt!377777 () Bool)

(assert (=> d!106471 (= res!566292 (not lt!377777))))

(declare-fun lt!377776 () Bool)

(assert (=> d!106471 (= lt!377777 lt!377776)))

(declare-fun lt!377775 () Unit!28493)

(declare-fun e!464165 () Unit!28493)

(assert (=> d!106471 (= lt!377775 e!464165)))

(declare-fun c!90451 () Bool)

(assert (=> d!106471 (= c!90451 lt!377776)))

(assert (=> d!106471 (= lt!377776 (containsKey!402 (toList!4505 lt!377609) (_1!5089 lt!377428)))))

(assert (=> d!106471 (= (contains!4211 lt!377609 (_1!5089 lt!377428)) lt!377777)))

(declare-fun b!832288 () Bool)

(declare-fun lt!377774 () Unit!28493)

(assert (=> b!832288 (= e!464165 lt!377774)))

(assert (=> b!832288 (= lt!377774 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377609) (_1!5089 lt!377428)))))

(assert (=> b!832288 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377609) (_1!5089 lt!377428)))))

(declare-fun b!832289 () Bool)

(declare-fun Unit!28513 () Unit!28493)

(assert (=> b!832289 (= e!464165 Unit!28513)))

(declare-fun b!832290 () Bool)

(assert (=> b!832290 (= e!464164 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377609) (_1!5089 lt!377428))))))

(assert (= (and d!106471 c!90451) b!832288))

(assert (= (and d!106471 (not c!90451)) b!832289))

(assert (= (and d!106471 (not res!566292)) b!832290))

(declare-fun m!776487 () Bool)

(assert (=> d!106471 m!776487))

(declare-fun m!776489 () Bool)

(assert (=> b!832288 m!776489))

(assert (=> b!832288 m!775983))

(assert (=> b!832288 m!775983))

(declare-fun m!776491 () Bool)

(assert (=> b!832288 m!776491))

(assert (=> b!832290 m!775983))

(assert (=> b!832290 m!775983))

(assert (=> b!832290 m!776491))

(assert (=> d!106319 d!106471))

(declare-fun b!832293 () Bool)

(declare-fun e!464167 () Option!422)

(assert (=> b!832293 (= e!464167 (getValueByKey!416 (t!22317 lt!377608) (_1!5089 lt!377428)))))

(declare-fun b!832292 () Bool)

(declare-fun e!464166 () Option!422)

(assert (=> b!832292 (= e!464166 e!464167)))

(declare-fun c!90453 () Bool)

(assert (=> b!832292 (= c!90453 (and ((_ is Cons!15945) lt!377608) (not (= (_1!5089 (h!17075 lt!377608)) (_1!5089 lt!377428)))))))

(declare-fun b!832294 () Bool)

(assert (=> b!832294 (= e!464167 None!420)))

(declare-fun b!832291 () Bool)

(assert (=> b!832291 (= e!464166 (Some!421 (_2!5089 (h!17075 lt!377608))))))

(declare-fun d!106473 () Bool)

(declare-fun c!90452 () Bool)

(assert (=> d!106473 (= c!90452 (and ((_ is Cons!15945) lt!377608) (= (_1!5089 (h!17075 lt!377608)) (_1!5089 lt!377428))))))

(assert (=> d!106473 (= (getValueByKey!416 lt!377608 (_1!5089 lt!377428)) e!464166)))

(assert (= (and d!106473 c!90452) b!832291))

(assert (= (and d!106473 (not c!90452)) b!832292))

(assert (= (and b!832292 c!90453) b!832293))

(assert (= (and b!832292 (not c!90453)) b!832294))

(declare-fun m!776493 () Bool)

(assert (=> b!832293 m!776493))

(assert (=> d!106319 d!106473))

(declare-fun d!106475 () Bool)

(assert (=> d!106475 (= (getValueByKey!416 lt!377608 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(declare-fun lt!377778 () Unit!28493)

(assert (=> d!106475 (= lt!377778 (choose!1423 lt!377608 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun e!464168 () Bool)

(assert (=> d!106475 e!464168))

(declare-fun res!566293 () Bool)

(assert (=> d!106475 (=> (not res!566293) (not e!464168))))

(assert (=> d!106475 (= res!566293 (isStrictlySorted!442 lt!377608))))

(assert (=> d!106475 (= (lemmaContainsTupThenGetReturnValue!230 lt!377608 (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377778)))

(declare-fun b!832295 () Bool)

(declare-fun res!566294 () Bool)

(assert (=> b!832295 (=> (not res!566294) (not e!464168))))

(assert (=> b!832295 (= res!566294 (containsKey!402 lt!377608 (_1!5089 lt!377428)))))

(declare-fun b!832296 () Bool)

(assert (=> b!832296 (= e!464168 (contains!4212 lt!377608 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106475 res!566293) b!832295))

(assert (= (and b!832295 res!566294) b!832296))

(assert (=> d!106475 m!775977))

(declare-fun m!776495 () Bool)

(assert (=> d!106475 m!776495))

(declare-fun m!776497 () Bool)

(assert (=> d!106475 m!776497))

(declare-fun m!776499 () Bool)

(assert (=> b!832295 m!776499))

(declare-fun m!776501 () Bool)

(assert (=> b!832296 m!776501))

(assert (=> d!106319 d!106475))

(declare-fun b!832297 () Bool)

(declare-fun e!464170 () List!15949)

(declare-fun call!36420 () List!15949)

(assert (=> b!832297 (= e!464170 call!36420)))

(declare-fun b!832298 () Bool)

(declare-fun e!464169 () List!15949)

(assert (=> b!832298 (= e!464169 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377423)) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36416 () Bool)

(declare-fun call!36419 () List!15949)

(assert (=> bm!36416 (= call!36420 call!36419)))

(declare-fun b!832299 () Bool)

(assert (=> b!832299 (= e!464170 call!36420)))

(declare-fun c!90454 () Bool)

(declare-fun c!90456 () Bool)

(declare-fun b!832300 () Bool)

(assert (=> b!832300 (= e!464169 (ite c!90456 (t!22317 (toList!4505 lt!377423)) (ite c!90454 (Cons!15945 (h!17075 (toList!4505 lt!377423)) (t!22317 (toList!4505 lt!377423))) Nil!15946)))))

(declare-fun c!90457 () Bool)

(declare-fun bm!36417 () Bool)

(declare-fun call!36421 () List!15949)

(assert (=> bm!36417 (= call!36421 ($colon$colon!537 e!464169 (ite c!90457 (h!17075 (toList!4505 lt!377423)) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90455 () Bool)

(assert (=> bm!36417 (= c!90455 c!90457)))

(declare-fun b!832301 () Bool)

(declare-fun res!566296 () Bool)

(declare-fun e!464172 () Bool)

(assert (=> b!832301 (=> (not res!566296) (not e!464172))))

(declare-fun lt!377779 () List!15949)

(assert (=> b!832301 (= res!566296 (containsKey!402 lt!377779 (_1!5089 lt!377428)))))

(declare-fun b!832302 () Bool)

(declare-fun e!464173 () List!15949)

(assert (=> b!832302 (= e!464173 call!36421)))

(declare-fun b!832303 () Bool)

(assert (=> b!832303 (= c!90454 (and ((_ is Cons!15945) (toList!4505 lt!377423)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377423))) (_1!5089 lt!377428))))))

(declare-fun e!464171 () List!15949)

(assert (=> b!832303 (= e!464171 e!464170)))

(declare-fun d!106477 () Bool)

(assert (=> d!106477 e!464172))

(declare-fun res!566295 () Bool)

(assert (=> d!106477 (=> (not res!566295) (not e!464172))))

(assert (=> d!106477 (= res!566295 (isStrictlySorted!442 lt!377779))))

(assert (=> d!106477 (= lt!377779 e!464173)))

(assert (=> d!106477 (= c!90457 (and ((_ is Cons!15945) (toList!4505 lt!377423)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377423))) (_1!5089 lt!377428))))))

(assert (=> d!106477 (isStrictlySorted!442 (toList!4505 lt!377423))))

(assert (=> d!106477 (= (insertStrictlySorted!269 (toList!4505 lt!377423) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377779)))

(declare-fun b!832304 () Bool)

(assert (=> b!832304 (= e!464171 call!36419)))

(declare-fun bm!36418 () Bool)

(assert (=> bm!36418 (= call!36419 call!36421)))

(declare-fun b!832305 () Bool)

(assert (=> b!832305 (= e!464172 (contains!4212 lt!377779 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832306 () Bool)

(assert (=> b!832306 (= e!464173 e!464171)))

(assert (=> b!832306 (= c!90456 (and ((_ is Cons!15945) (toList!4505 lt!377423)) (= (_1!5089 (h!17075 (toList!4505 lt!377423))) (_1!5089 lt!377428))))))

(assert (= (and d!106477 c!90457) b!832302))

(assert (= (and d!106477 (not c!90457)) b!832306))

(assert (= (and b!832306 c!90456) b!832304))

(assert (= (and b!832306 (not c!90456)) b!832303))

(assert (= (and b!832303 c!90454) b!832297))

(assert (= (and b!832303 (not c!90454)) b!832299))

(assert (= (or b!832297 b!832299) bm!36416))

(assert (= (or b!832304 bm!36416) bm!36418))

(assert (= (or b!832302 bm!36418) bm!36417))

(assert (= (and bm!36417 c!90455) b!832298))

(assert (= (and bm!36417 (not c!90455)) b!832300))

(assert (= (and d!106477 res!566295) b!832301))

(assert (= (and b!832301 res!566296) b!832305))

(declare-fun m!776503 () Bool)

(assert (=> d!106477 m!776503))

(assert (=> d!106477 m!776241))

(declare-fun m!776505 () Bool)

(assert (=> b!832301 m!776505))

(declare-fun m!776507 () Bool)

(assert (=> b!832305 m!776507))

(declare-fun m!776509 () Bool)

(assert (=> bm!36417 m!776509))

(declare-fun m!776511 () Bool)

(assert (=> b!832298 m!776511))

(assert (=> d!106319 d!106477))

(assert (=> b!831904 d!106335))

(declare-fun d!106479 () Bool)

(assert (=> d!106479 (= (apply!373 lt!377580 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23273 () Bool)

(assert (= bs!23273 d!106479))

(assert (=> bs!23273 m!776061))

(assert (=> bs!23273 m!776061))

(declare-fun m!776513 () Bool)

(assert (=> bs!23273 m!776513))

(assert (=> b!831989 d!106479))

(declare-fun d!106481 () Bool)

(declare-fun e!464174 () Bool)

(assert (=> d!106481 e!464174))

(declare-fun res!566297 () Bool)

(assert (=> d!106481 (=> res!566297 e!464174)))

(declare-fun lt!377783 () Bool)

(assert (=> d!106481 (= res!566297 (not lt!377783))))

(declare-fun lt!377782 () Bool)

(assert (=> d!106481 (= lt!377783 lt!377782)))

(declare-fun lt!377781 () Unit!28493)

(declare-fun e!464175 () Unit!28493)

(assert (=> d!106481 (= lt!377781 e!464175)))

(declare-fun c!90458 () Bool)

(assert (=> d!106481 (= c!90458 lt!377782)))

(assert (=> d!106481 (= lt!377782 (containsKey!402 (toList!4505 lt!377579) (_1!5089 lt!377425)))))

(assert (=> d!106481 (= (contains!4211 lt!377579 (_1!5089 lt!377425)) lt!377783)))

(declare-fun b!832307 () Bool)

(declare-fun lt!377780 () Unit!28493)

(assert (=> b!832307 (= e!464175 lt!377780)))

(assert (=> b!832307 (= lt!377780 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377579) (_1!5089 lt!377425)))))

(assert (=> b!832307 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377579) (_1!5089 lt!377425)))))

(declare-fun b!832308 () Bool)

(declare-fun Unit!28514 () Unit!28493)

(assert (=> b!832308 (= e!464175 Unit!28514)))

(declare-fun b!832309 () Bool)

(assert (=> b!832309 (= e!464174 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377579) (_1!5089 lt!377425))))))

(assert (= (and d!106481 c!90458) b!832307))

(assert (= (and d!106481 (not c!90458)) b!832308))

(assert (= (and d!106481 (not res!566297)) b!832309))

(declare-fun m!776515 () Bool)

(assert (=> d!106481 m!776515))

(declare-fun m!776517 () Bool)

(assert (=> b!832307 m!776517))

(assert (=> b!832307 m!775913))

(assert (=> b!832307 m!775913))

(declare-fun m!776519 () Bool)

(assert (=> b!832307 m!776519))

(assert (=> b!832309 m!775913))

(assert (=> b!832309 m!775913))

(assert (=> b!832309 m!776519))

(assert (=> d!106313 d!106481))

(declare-fun b!832312 () Bool)

(declare-fun e!464177 () Option!422)

(assert (=> b!832312 (= e!464177 (getValueByKey!416 (t!22317 lt!377578) (_1!5089 lt!377425)))))

(declare-fun b!832311 () Bool)

(declare-fun e!464176 () Option!422)

(assert (=> b!832311 (= e!464176 e!464177)))

(declare-fun c!90460 () Bool)

(assert (=> b!832311 (= c!90460 (and ((_ is Cons!15945) lt!377578) (not (= (_1!5089 (h!17075 lt!377578)) (_1!5089 lt!377425)))))))

(declare-fun b!832313 () Bool)

(assert (=> b!832313 (= e!464177 None!420)))

(declare-fun b!832310 () Bool)

(assert (=> b!832310 (= e!464176 (Some!421 (_2!5089 (h!17075 lt!377578))))))

(declare-fun d!106483 () Bool)

(declare-fun c!90459 () Bool)

(assert (=> d!106483 (= c!90459 (and ((_ is Cons!15945) lt!377578) (= (_1!5089 (h!17075 lt!377578)) (_1!5089 lt!377425))))))

(assert (=> d!106483 (= (getValueByKey!416 lt!377578 (_1!5089 lt!377425)) e!464176)))

(assert (= (and d!106483 c!90459) b!832310))

(assert (= (and d!106483 (not c!90459)) b!832311))

(assert (= (and b!832311 c!90460) b!832312))

(assert (= (and b!832311 (not c!90460)) b!832313))

(declare-fun m!776521 () Bool)

(assert (=> b!832312 m!776521))

(assert (=> d!106313 d!106483))

(declare-fun d!106485 () Bool)

(assert (=> d!106485 (= (getValueByKey!416 lt!377578 (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425)))))

(declare-fun lt!377784 () Unit!28493)

(assert (=> d!106485 (= lt!377784 (choose!1423 lt!377578 (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(declare-fun e!464178 () Bool)

(assert (=> d!106485 e!464178))

(declare-fun res!566298 () Bool)

(assert (=> d!106485 (=> (not res!566298) (not e!464178))))

(assert (=> d!106485 (= res!566298 (isStrictlySorted!442 lt!377578))))

(assert (=> d!106485 (= (lemmaContainsTupThenGetReturnValue!230 lt!377578 (_1!5089 lt!377425) (_2!5089 lt!377425)) lt!377784)))

(declare-fun b!832314 () Bool)

(declare-fun res!566299 () Bool)

(assert (=> b!832314 (=> (not res!566299) (not e!464178))))

(assert (=> b!832314 (= res!566299 (containsKey!402 lt!377578 (_1!5089 lt!377425)))))

(declare-fun b!832315 () Bool)

(assert (=> b!832315 (= e!464178 (contains!4212 lt!377578 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(assert (= (and d!106485 res!566298) b!832314))

(assert (= (and b!832314 res!566299) b!832315))

(assert (=> d!106485 m!775907))

(declare-fun m!776523 () Bool)

(assert (=> d!106485 m!776523))

(declare-fun m!776525 () Bool)

(assert (=> d!106485 m!776525))

(declare-fun m!776527 () Bool)

(assert (=> b!832314 m!776527))

(declare-fun m!776529 () Bool)

(assert (=> b!832315 m!776529))

(assert (=> d!106313 d!106485))

(declare-fun b!832316 () Bool)

(declare-fun e!464180 () List!15949)

(declare-fun call!36423 () List!15949)

(assert (=> b!832316 (= e!464180 call!36423)))

(declare-fun b!832317 () Bool)

(declare-fun e!464179 () List!15949)

(assert (=> b!832317 (= e!464179 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377422)) (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(declare-fun bm!36419 () Bool)

(declare-fun call!36422 () List!15949)

(assert (=> bm!36419 (= call!36423 call!36422)))

(declare-fun b!832318 () Bool)

(assert (=> b!832318 (= e!464180 call!36423)))

(declare-fun c!90461 () Bool)

(declare-fun c!90463 () Bool)

(declare-fun b!832319 () Bool)

(assert (=> b!832319 (= e!464179 (ite c!90463 (t!22317 (toList!4505 lt!377422)) (ite c!90461 (Cons!15945 (h!17075 (toList!4505 lt!377422)) (t!22317 (toList!4505 lt!377422))) Nil!15946)))))

(declare-fun c!90464 () Bool)

(declare-fun call!36424 () List!15949)

(declare-fun bm!36420 () Bool)

(assert (=> bm!36420 (= call!36424 ($colon$colon!537 e!464179 (ite c!90464 (h!17075 (toList!4505 lt!377422)) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425)))))))

(declare-fun c!90462 () Bool)

(assert (=> bm!36420 (= c!90462 c!90464)))

(declare-fun b!832320 () Bool)

(declare-fun res!566301 () Bool)

(declare-fun e!464182 () Bool)

(assert (=> b!832320 (=> (not res!566301) (not e!464182))))

(declare-fun lt!377785 () List!15949)

(assert (=> b!832320 (= res!566301 (containsKey!402 lt!377785 (_1!5089 lt!377425)))))

(declare-fun b!832321 () Bool)

(declare-fun e!464183 () List!15949)

(assert (=> b!832321 (= e!464183 call!36424)))

(declare-fun b!832322 () Bool)

(assert (=> b!832322 (= c!90461 (and ((_ is Cons!15945) (toList!4505 lt!377422)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377422))) (_1!5089 lt!377425))))))

(declare-fun e!464181 () List!15949)

(assert (=> b!832322 (= e!464181 e!464180)))

(declare-fun d!106487 () Bool)

(assert (=> d!106487 e!464182))

(declare-fun res!566300 () Bool)

(assert (=> d!106487 (=> (not res!566300) (not e!464182))))

(assert (=> d!106487 (= res!566300 (isStrictlySorted!442 lt!377785))))

(assert (=> d!106487 (= lt!377785 e!464183)))

(assert (=> d!106487 (= c!90464 (and ((_ is Cons!15945) (toList!4505 lt!377422)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377422))) (_1!5089 lt!377425))))))

(assert (=> d!106487 (isStrictlySorted!442 (toList!4505 lt!377422))))

(assert (=> d!106487 (= (insertStrictlySorted!269 (toList!4505 lt!377422) (_1!5089 lt!377425) (_2!5089 lt!377425)) lt!377785)))

(declare-fun b!832323 () Bool)

(assert (=> b!832323 (= e!464181 call!36422)))

(declare-fun bm!36421 () Bool)

(assert (=> bm!36421 (= call!36422 call!36424)))

(declare-fun b!832324 () Bool)

(assert (=> b!832324 (= e!464182 (contains!4212 lt!377785 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!832325 () Bool)

(assert (=> b!832325 (= e!464183 e!464181)))

(assert (=> b!832325 (= c!90463 (and ((_ is Cons!15945) (toList!4505 lt!377422)) (= (_1!5089 (h!17075 (toList!4505 lt!377422))) (_1!5089 lt!377425))))))

(assert (= (and d!106487 c!90464) b!832321))

(assert (= (and d!106487 (not c!90464)) b!832325))

(assert (= (and b!832325 c!90463) b!832323))

(assert (= (and b!832325 (not c!90463)) b!832322))

(assert (= (and b!832322 c!90461) b!832316))

(assert (= (and b!832322 (not c!90461)) b!832318))

(assert (= (or b!832316 b!832318) bm!36419))

(assert (= (or b!832323 bm!36419) bm!36421))

(assert (= (or b!832321 bm!36421) bm!36420))

(assert (= (and bm!36420 c!90462) b!832317))

(assert (= (and bm!36420 (not c!90462)) b!832319))

(assert (= (and d!106487 res!566300) b!832320))

(assert (= (and b!832320 res!566301) b!832324))

(declare-fun m!776531 () Bool)

(assert (=> d!106487 m!776531))

(assert (=> d!106487 m!776187))

(declare-fun m!776533 () Bool)

(assert (=> b!832320 m!776533))

(declare-fun m!776535 () Bool)

(assert (=> b!832324 m!776535))

(declare-fun m!776537 () Bool)

(assert (=> bm!36420 m!776537))

(declare-fun m!776539 () Bool)

(assert (=> b!832317 m!776539))

(assert (=> d!106313 d!106487))

(declare-fun b!832328 () Bool)

(declare-fun e!464185 () Option!422)

(assert (=> b!832328 (= e!464185 (getValueByKey!416 (t!22317 (toList!4505 lt!377609)) (_1!5089 lt!377428)))))

(declare-fun b!832327 () Bool)

(declare-fun e!464184 () Option!422)

(assert (=> b!832327 (= e!464184 e!464185)))

(declare-fun c!90466 () Bool)

(assert (=> b!832327 (= c!90466 (and ((_ is Cons!15945) (toList!4505 lt!377609)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377609))) (_1!5089 lt!377428)))))))

(declare-fun b!832329 () Bool)

(assert (=> b!832329 (= e!464185 None!420)))

(declare-fun b!832326 () Bool)

(assert (=> b!832326 (= e!464184 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377609)))))))

(declare-fun d!106489 () Bool)

(declare-fun c!90465 () Bool)

(assert (=> d!106489 (= c!90465 (and ((_ is Cons!15945) (toList!4505 lt!377609)) (= (_1!5089 (h!17075 (toList!4505 lt!377609))) (_1!5089 lt!377428))))))

(assert (=> d!106489 (= (getValueByKey!416 (toList!4505 lt!377609) (_1!5089 lt!377428)) e!464184)))

(assert (= (and d!106489 c!90465) b!832326))

(assert (= (and d!106489 (not c!90465)) b!832327))

(assert (= (and b!832327 c!90466) b!832328))

(assert (= (and b!832327 (not c!90466)) b!832329))

(declare-fun m!776541 () Bool)

(assert (=> b!832328 m!776541))

(assert (=> b!831995 d!106489))

(declare-fun d!106491 () Bool)

(assert (=> d!106491 (= (apply!373 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)) lt!377574) (apply!373 lt!377561 lt!377574))))

(declare-fun lt!377786 () Unit!28493)

(assert (=> d!106491 (= lt!377786 (choose!1424 lt!377561 lt!377560 zeroValueBefore!34 lt!377574))))

(declare-fun e!464186 () Bool)

(assert (=> d!106491 e!464186))

(declare-fun res!566302 () Bool)

(assert (=> d!106491 (=> (not res!566302) (not e!464186))))

(assert (=> d!106491 (= res!566302 (contains!4211 lt!377561 lt!377574))))

(assert (=> d!106491 (= (addApplyDifferent!324 lt!377561 lt!377560 zeroValueBefore!34 lt!377574) lt!377786)))

(declare-fun b!832330 () Bool)

(assert (=> b!832330 (= e!464186 (not (= lt!377574 lt!377560)))))

(assert (= (and d!106491 res!566302) b!832330))

(declare-fun m!776543 () Bool)

(assert (=> d!106491 m!776543))

(assert (=> d!106491 m!775873))

(assert (=> d!106491 m!775879))

(assert (=> d!106491 m!775873))

(assert (=> d!106491 m!775887))

(declare-fun m!776545 () Bool)

(assert (=> d!106491 m!776545))

(assert (=> b!831958 d!106491))

(declare-fun d!106493 () Bool)

(declare-fun e!464187 () Bool)

(assert (=> d!106493 e!464187))

(declare-fun res!566303 () Bool)

(assert (=> d!106493 (=> (not res!566303) (not e!464187))))

(declare-fun lt!377790 () ListLongMap!8979)

(assert (=> d!106493 (= res!566303 (contains!4211 lt!377790 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun lt!377789 () List!15949)

(assert (=> d!106493 (= lt!377790 (ListLongMap!8980 lt!377789))))

(declare-fun lt!377787 () Unit!28493)

(declare-fun lt!377788 () Unit!28493)

(assert (=> d!106493 (= lt!377787 lt!377788)))

(assert (=> d!106493 (= (getValueByKey!416 lt!377789 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(assert (=> d!106493 (= lt!377788 (lemmaContainsTupThenGetReturnValue!230 lt!377789 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(assert (=> d!106493 (= lt!377789 (insertStrictlySorted!269 (toList!4505 lt!377561) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(assert (=> d!106493 (= (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)) lt!377790)))

(declare-fun b!832331 () Bool)

(declare-fun res!566304 () Bool)

(assert (=> b!832331 (=> (not res!566304) (not e!464187))))

(assert (=> b!832331 (= res!566304 (= (getValueByKey!416 (toList!4505 lt!377790) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(declare-fun b!832332 () Bool)

(assert (=> b!832332 (= e!464187 (contains!4212 (toList!4505 lt!377790) (tuple2!10157 lt!377560 zeroValueBefore!34)))))

(assert (= (and d!106493 res!566303) b!832331))

(assert (= (and b!832331 res!566304) b!832332))

(declare-fun m!776547 () Bool)

(assert (=> d!106493 m!776547))

(declare-fun m!776549 () Bool)

(assert (=> d!106493 m!776549))

(declare-fun m!776551 () Bool)

(assert (=> d!106493 m!776551))

(declare-fun m!776553 () Bool)

(assert (=> d!106493 m!776553))

(declare-fun m!776555 () Bool)

(assert (=> b!832331 m!776555))

(declare-fun m!776557 () Bool)

(assert (=> b!832332 m!776557))

(assert (=> b!831958 d!106493))

(declare-fun d!106495 () Bool)

(assert (=> d!106495 (contains!4211 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)) lt!377566)))

(declare-fun lt!377791 () Unit!28493)

(assert (=> d!106495 (= lt!377791 (choose!1425 lt!377557 lt!377564 zeroValueBefore!34 lt!377566))))

(assert (=> d!106495 (contains!4211 lt!377557 lt!377566)))

(assert (=> d!106495 (= (addStillContains!324 lt!377557 lt!377564 zeroValueBefore!34 lt!377566) lt!377791)))

(declare-fun bs!23274 () Bool)

(assert (= bs!23274 d!106495))

(assert (=> bs!23274 m!775865))

(assert (=> bs!23274 m!775865))

(assert (=> bs!23274 m!775867))

(declare-fun m!776559 () Bool)

(assert (=> bs!23274 m!776559))

(declare-fun m!776561 () Bool)

(assert (=> bs!23274 m!776561))

(assert (=> b!831958 d!106495))

(declare-fun d!106497 () Bool)

(assert (=> d!106497 (= (apply!373 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)) lt!377563) (apply!373 lt!377572 lt!377563))))

(declare-fun lt!377792 () Unit!28493)

(assert (=> d!106497 (= lt!377792 (choose!1424 lt!377572 lt!377559 minValue!754 lt!377563))))

(declare-fun e!464188 () Bool)

(assert (=> d!106497 e!464188))

(declare-fun res!566305 () Bool)

(assert (=> d!106497 (=> (not res!566305) (not e!464188))))

(assert (=> d!106497 (= res!566305 (contains!4211 lt!377572 lt!377563))))

(assert (=> d!106497 (= (addApplyDifferent!324 lt!377572 lt!377559 minValue!754 lt!377563) lt!377792)))

(declare-fun b!832333 () Bool)

(assert (=> b!832333 (= e!464188 (not (= lt!377563 lt!377559)))))

(assert (= (and d!106497 res!566305) b!832333))

(declare-fun m!776563 () Bool)

(assert (=> d!106497 m!776563))

(assert (=> d!106497 m!775889))

(assert (=> d!106497 m!775883))

(assert (=> d!106497 m!775889))

(assert (=> d!106497 m!775891))

(declare-fun m!776565 () Bool)

(assert (=> d!106497 m!776565))

(assert (=> b!831958 d!106497))

(declare-fun d!106499 () Bool)

(assert (=> d!106499 (= (apply!373 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)) lt!377574) (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34))) lt!377574)))))

(declare-fun bs!23275 () Bool)

(assert (= bs!23275 d!106499))

(declare-fun m!776567 () Bool)

(assert (=> bs!23275 m!776567))

(assert (=> bs!23275 m!776567))

(declare-fun m!776569 () Bool)

(assert (=> bs!23275 m!776569))

(assert (=> b!831958 d!106499))

(declare-fun d!106501 () Bool)

(assert (=> d!106501 (= (apply!373 lt!377567 lt!377569) (get!11824 (getValueByKey!416 (toList!4505 lt!377567) lt!377569)))))

(declare-fun bs!23276 () Bool)

(assert (= bs!23276 d!106501))

(declare-fun m!776571 () Bool)

(assert (=> bs!23276 m!776571))

(assert (=> bs!23276 m!776571))

(declare-fun m!776573 () Bool)

(assert (=> bs!23276 m!776573))

(assert (=> b!831958 d!106501))

(declare-fun d!106503 () Bool)

(declare-fun e!464189 () Bool)

(assert (=> d!106503 e!464189))

(declare-fun res!566306 () Bool)

(assert (=> d!106503 (=> (not res!566306) (not e!464189))))

(declare-fun lt!377796 () ListLongMap!8979)

(assert (=> d!106503 (= res!566306 (contains!4211 lt!377796 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun lt!377795 () List!15949)

(assert (=> d!106503 (= lt!377796 (ListLongMap!8980 lt!377795))))

(declare-fun lt!377793 () Unit!28493)

(declare-fun lt!377794 () Unit!28493)

(assert (=> d!106503 (= lt!377793 lt!377794)))

(assert (=> d!106503 (= (getValueByKey!416 lt!377795 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(assert (=> d!106503 (= lt!377794 (lemmaContainsTupThenGetReturnValue!230 lt!377795 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(assert (=> d!106503 (= lt!377795 (insertStrictlySorted!269 (toList!4505 lt!377557) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(assert (=> d!106503 (= (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)) lt!377796)))

(declare-fun b!832334 () Bool)

(declare-fun res!566307 () Bool)

(assert (=> b!832334 (=> (not res!566307) (not e!464189))))

(assert (=> b!832334 (= res!566307 (= (getValueByKey!416 (toList!4505 lt!377796) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(declare-fun b!832335 () Bool)

(assert (=> b!832335 (= e!464189 (contains!4212 (toList!4505 lt!377796) (tuple2!10157 lt!377564 zeroValueBefore!34)))))

(assert (= (and d!106503 res!566306) b!832334))

(assert (= (and b!832334 res!566307) b!832335))

(declare-fun m!776575 () Bool)

(assert (=> d!106503 m!776575))

(declare-fun m!776577 () Bool)

(assert (=> d!106503 m!776577))

(declare-fun m!776579 () Bool)

(assert (=> d!106503 m!776579))

(declare-fun m!776581 () Bool)

(assert (=> d!106503 m!776581))

(declare-fun m!776583 () Bool)

(assert (=> b!832334 m!776583))

(declare-fun m!776585 () Bool)

(assert (=> b!832335 m!776585))

(assert (=> b!831958 d!106503))

(declare-fun d!106505 () Bool)

(assert (=> d!106505 (= (apply!373 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)) lt!377569) (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754))) lt!377569)))))

(declare-fun bs!23277 () Bool)

(assert (= bs!23277 d!106505))

(declare-fun m!776587 () Bool)

(assert (=> bs!23277 m!776587))

(assert (=> bs!23277 m!776587))

(declare-fun m!776589 () Bool)

(assert (=> bs!23277 m!776589))

(assert (=> b!831958 d!106505))

(declare-fun d!106507 () Bool)

(declare-fun e!464190 () Bool)

(assert (=> d!106507 e!464190))

(declare-fun res!566308 () Bool)

(assert (=> d!106507 (=> res!566308 e!464190)))

(declare-fun lt!377800 () Bool)

(assert (=> d!106507 (= res!566308 (not lt!377800))))

(declare-fun lt!377799 () Bool)

(assert (=> d!106507 (= lt!377800 lt!377799)))

(declare-fun lt!377798 () Unit!28493)

(declare-fun e!464191 () Unit!28493)

(assert (=> d!106507 (= lt!377798 e!464191)))

(declare-fun c!90467 () Bool)

(assert (=> d!106507 (= c!90467 lt!377799)))

(assert (=> d!106507 (= lt!377799 (containsKey!402 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566))))

(assert (=> d!106507 (= (contains!4211 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)) lt!377566) lt!377800)))

(declare-fun b!832336 () Bool)

(declare-fun lt!377797 () Unit!28493)

(assert (=> b!832336 (= e!464191 lt!377797)))

(assert (=> b!832336 (= lt!377797 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566))))

(assert (=> b!832336 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566))))

(declare-fun b!832337 () Bool)

(declare-fun Unit!28515 () Unit!28493)

(assert (=> b!832337 (= e!464191 Unit!28515)))

(declare-fun b!832338 () Bool)

(assert (=> b!832338 (= e!464190 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566)))))

(assert (= (and d!106507 c!90467) b!832336))

(assert (= (and d!106507 (not c!90467)) b!832337))

(assert (= (and d!106507 (not res!566308)) b!832338))

(declare-fun m!776591 () Bool)

(assert (=> d!106507 m!776591))

(declare-fun m!776593 () Bool)

(assert (=> b!832336 m!776593))

(declare-fun m!776595 () Bool)

(assert (=> b!832336 m!776595))

(assert (=> b!832336 m!776595))

(declare-fun m!776597 () Bool)

(assert (=> b!832336 m!776597))

(assert (=> b!832338 m!776595))

(assert (=> b!832338 m!776595))

(assert (=> b!832338 m!776597))

(assert (=> b!831958 d!106507))

(assert (=> b!831958 d!106305))

(declare-fun d!106509 () Bool)

(assert (=> d!106509 (= (apply!373 lt!377561 lt!377574) (get!11824 (getValueByKey!416 (toList!4505 lt!377561) lt!377574)))))

(declare-fun bs!23278 () Bool)

(assert (= bs!23278 d!106509))

(declare-fun m!776599 () Bool)

(assert (=> bs!23278 m!776599))

(assert (=> bs!23278 m!776599))

(declare-fun m!776601 () Bool)

(assert (=> bs!23278 m!776601))

(assert (=> b!831958 d!106509))

(declare-fun d!106511 () Bool)

(assert (=> d!106511 (= (apply!373 lt!377572 lt!377563) (get!11824 (getValueByKey!416 (toList!4505 lt!377572) lt!377563)))))

(declare-fun bs!23279 () Bool)

(assert (= bs!23279 d!106511))

(declare-fun m!776603 () Bool)

(assert (=> bs!23279 m!776603))

(assert (=> bs!23279 m!776603))

(declare-fun m!776605 () Bool)

(assert (=> bs!23279 m!776605))

(assert (=> b!831958 d!106511))

(declare-fun d!106513 () Bool)

(declare-fun e!464192 () Bool)

(assert (=> d!106513 e!464192))

(declare-fun res!566309 () Bool)

(assert (=> d!106513 (=> (not res!566309) (not e!464192))))

(declare-fun lt!377804 () ListLongMap!8979)

(assert (=> d!106513 (= res!566309 (contains!4211 lt!377804 (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun lt!377803 () List!15949)

(assert (=> d!106513 (= lt!377804 (ListLongMap!8980 lt!377803))))

(declare-fun lt!377801 () Unit!28493)

(declare-fun lt!377802 () Unit!28493)

(assert (=> d!106513 (= lt!377801 lt!377802)))

(assert (=> d!106513 (= (getValueByKey!416 lt!377803 (_1!5089 (tuple2!10157 lt!377559 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377559 minValue!754))))))

(assert (=> d!106513 (= lt!377802 (lemmaContainsTupThenGetReturnValue!230 lt!377803 (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754))))))

(assert (=> d!106513 (= lt!377803 (insertStrictlySorted!269 (toList!4505 lt!377572) (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754))))))

(assert (=> d!106513 (= (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)) lt!377804)))

(declare-fun b!832339 () Bool)

(declare-fun res!566310 () Bool)

(assert (=> b!832339 (=> (not res!566310) (not e!464192))))

(assert (=> b!832339 (= res!566310 (= (getValueByKey!416 (toList!4505 lt!377804) (_1!5089 (tuple2!10157 lt!377559 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(declare-fun b!832340 () Bool)

(assert (=> b!832340 (= e!464192 (contains!4212 (toList!4505 lt!377804) (tuple2!10157 lt!377559 minValue!754)))))

(assert (= (and d!106513 res!566309) b!832339))

(assert (= (and b!832339 res!566310) b!832340))

(declare-fun m!776607 () Bool)

(assert (=> d!106513 m!776607))

(declare-fun m!776609 () Bool)

(assert (=> d!106513 m!776609))

(declare-fun m!776611 () Bool)

(assert (=> d!106513 m!776611))

(declare-fun m!776613 () Bool)

(assert (=> d!106513 m!776613))

(declare-fun m!776615 () Bool)

(assert (=> b!832339 m!776615))

(declare-fun m!776617 () Bool)

(assert (=> b!832340 m!776617))

(assert (=> b!831958 d!106513))

(declare-fun d!106515 () Bool)

(declare-fun e!464193 () Bool)

(assert (=> d!106515 e!464193))

(declare-fun res!566311 () Bool)

(assert (=> d!106515 (=> (not res!566311) (not e!464193))))

(declare-fun lt!377808 () ListLongMap!8979)

(assert (=> d!106515 (= res!566311 (contains!4211 lt!377808 (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun lt!377807 () List!15949)

(assert (=> d!106515 (= lt!377808 (ListLongMap!8980 lt!377807))))

(declare-fun lt!377805 () Unit!28493)

(declare-fun lt!377806 () Unit!28493)

(assert (=> d!106515 (= lt!377805 lt!377806)))

(assert (=> d!106515 (= (getValueByKey!416 lt!377807 (_1!5089 (tuple2!10157 lt!377568 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377568 minValue!754))))))

(assert (=> d!106515 (= lt!377806 (lemmaContainsTupThenGetReturnValue!230 lt!377807 (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754))))))

(assert (=> d!106515 (= lt!377807 (insertStrictlySorted!269 (toList!4505 lt!377567) (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754))))))

(assert (=> d!106515 (= (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)) lt!377808)))

(declare-fun b!832341 () Bool)

(declare-fun res!566312 () Bool)

(assert (=> b!832341 (=> (not res!566312) (not e!464193))))

(assert (=> b!832341 (= res!566312 (= (getValueByKey!416 (toList!4505 lt!377808) (_1!5089 (tuple2!10157 lt!377568 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(declare-fun b!832342 () Bool)

(assert (=> b!832342 (= e!464193 (contains!4212 (toList!4505 lt!377808) (tuple2!10157 lt!377568 minValue!754)))))

(assert (= (and d!106515 res!566311) b!832341))

(assert (= (and b!832341 res!566312) b!832342))

(declare-fun m!776619 () Bool)

(assert (=> d!106515 m!776619))

(declare-fun m!776621 () Bool)

(assert (=> d!106515 m!776621))

(declare-fun m!776623 () Bool)

(assert (=> d!106515 m!776623))

(declare-fun m!776625 () Bool)

(assert (=> d!106515 m!776625))

(declare-fun m!776627 () Bool)

(assert (=> b!832341 m!776627))

(declare-fun m!776629 () Bool)

(assert (=> b!832342 m!776629))

(assert (=> b!831958 d!106515))

(declare-fun d!106517 () Bool)

(assert (=> d!106517 (= (apply!373 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)) lt!377569) (apply!373 lt!377567 lt!377569))))

(declare-fun lt!377809 () Unit!28493)

(assert (=> d!106517 (= lt!377809 (choose!1424 lt!377567 lt!377568 minValue!754 lt!377569))))

(declare-fun e!464194 () Bool)

(assert (=> d!106517 e!464194))

(declare-fun res!566313 () Bool)

(assert (=> d!106517 (=> (not res!566313) (not e!464194))))

(assert (=> d!106517 (= res!566313 (contains!4211 lt!377567 lt!377569))))

(assert (=> d!106517 (= (addApplyDifferent!324 lt!377567 lt!377568 minValue!754 lt!377569) lt!377809)))

(declare-fun b!832343 () Bool)

(assert (=> b!832343 (= e!464194 (not (= lt!377569 lt!377568)))))

(assert (= (and d!106517 res!566313) b!832343))

(declare-fun m!776631 () Bool)

(assert (=> d!106517 m!776631))

(assert (=> d!106517 m!775875))

(assert (=> d!106517 m!775871))

(assert (=> d!106517 m!775875))

(assert (=> d!106517 m!775893))

(declare-fun m!776633 () Bool)

(assert (=> d!106517 m!776633))

(assert (=> b!831958 d!106517))

(declare-fun d!106519 () Bool)

(assert (=> d!106519 (= (apply!373 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)) lt!377563) (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754))) lt!377563)))))

(declare-fun bs!23280 () Bool)

(assert (= bs!23280 d!106519))

(declare-fun m!776635 () Bool)

(assert (=> bs!23280 m!776635))

(assert (=> bs!23280 m!776635))

(declare-fun m!776637 () Bool)

(assert (=> bs!23280 m!776637))

(assert (=> b!831958 d!106519))

(declare-fun d!106521 () Bool)

(declare-fun e!464195 () Bool)

(assert (=> d!106521 e!464195))

(declare-fun res!566314 () Bool)

(assert (=> d!106521 (=> res!566314 e!464195)))

(declare-fun lt!377813 () Bool)

(assert (=> d!106521 (= res!566314 (not lt!377813))))

(declare-fun lt!377812 () Bool)

(assert (=> d!106521 (= lt!377813 lt!377812)))

(declare-fun lt!377811 () Unit!28493)

(declare-fun e!464196 () Unit!28493)

(assert (=> d!106521 (= lt!377811 e!464196)))

(declare-fun c!90468 () Bool)

(assert (=> d!106521 (= c!90468 lt!377812)))

(assert (=> d!106521 (= lt!377812 (containsKey!402 (toList!4505 lt!377461) (_1!5089 lt!377425)))))

(assert (=> d!106521 (= (contains!4211 lt!377461 (_1!5089 lt!377425)) lt!377813)))

(declare-fun b!832344 () Bool)

(declare-fun lt!377810 () Unit!28493)

(assert (=> b!832344 (= e!464196 lt!377810)))

(assert (=> b!832344 (= lt!377810 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377461) (_1!5089 lt!377425)))))

(assert (=> b!832344 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377461) (_1!5089 lt!377425)))))

(declare-fun b!832345 () Bool)

(declare-fun Unit!28516 () Unit!28493)

(assert (=> b!832345 (= e!464196 Unit!28516)))

(declare-fun b!832346 () Bool)

(assert (=> b!832346 (= e!464195 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377461) (_1!5089 lt!377425))))))

(assert (= (and d!106521 c!90468) b!832344))

(assert (= (and d!106521 (not c!90468)) b!832345))

(assert (= (and d!106521 (not res!566314)) b!832346))

(declare-fun m!776639 () Bool)

(assert (=> d!106521 m!776639))

(declare-fun m!776641 () Bool)

(assert (=> b!832344 m!776641))

(assert (=> b!832344 m!775771))

(assert (=> b!832344 m!775771))

(declare-fun m!776643 () Bool)

(assert (=> b!832344 m!776643))

(assert (=> b!832346 m!775771))

(assert (=> b!832346 m!775771))

(assert (=> b!832346 m!776643))

(assert (=> d!106297 d!106521))

(declare-fun b!832349 () Bool)

(declare-fun e!464198 () Option!422)

(assert (=> b!832349 (= e!464198 (getValueByKey!416 (t!22317 lt!377460) (_1!5089 lt!377425)))))

(declare-fun b!832348 () Bool)

(declare-fun e!464197 () Option!422)

(assert (=> b!832348 (= e!464197 e!464198)))

(declare-fun c!90470 () Bool)

(assert (=> b!832348 (= c!90470 (and ((_ is Cons!15945) lt!377460) (not (= (_1!5089 (h!17075 lt!377460)) (_1!5089 lt!377425)))))))

(declare-fun b!832350 () Bool)

(assert (=> b!832350 (= e!464198 None!420)))

(declare-fun b!832347 () Bool)

(assert (=> b!832347 (= e!464197 (Some!421 (_2!5089 (h!17075 lt!377460))))))

(declare-fun d!106523 () Bool)

(declare-fun c!90469 () Bool)

(assert (=> d!106523 (= c!90469 (and ((_ is Cons!15945) lt!377460) (= (_1!5089 (h!17075 lt!377460)) (_1!5089 lt!377425))))))

(assert (=> d!106523 (= (getValueByKey!416 lt!377460 (_1!5089 lt!377425)) e!464197)))

(assert (= (and d!106523 c!90469) b!832347))

(assert (= (and d!106523 (not c!90469)) b!832348))

(assert (= (and b!832348 c!90470) b!832349))

(assert (= (and b!832348 (not c!90470)) b!832350))

(declare-fun m!776645 () Bool)

(assert (=> b!832349 m!776645))

(assert (=> d!106297 d!106523))

(declare-fun d!106525 () Bool)

(assert (=> d!106525 (= (getValueByKey!416 lt!377460 (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425)))))

(declare-fun lt!377814 () Unit!28493)

(assert (=> d!106525 (= lt!377814 (choose!1423 lt!377460 (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(declare-fun e!464199 () Bool)

(assert (=> d!106525 e!464199))

(declare-fun res!566315 () Bool)

(assert (=> d!106525 (=> (not res!566315) (not e!464199))))

(assert (=> d!106525 (= res!566315 (isStrictlySorted!442 lt!377460))))

(assert (=> d!106525 (= (lemmaContainsTupThenGetReturnValue!230 lt!377460 (_1!5089 lt!377425) (_2!5089 lt!377425)) lt!377814)))

(declare-fun b!832351 () Bool)

(declare-fun res!566316 () Bool)

(assert (=> b!832351 (=> (not res!566316) (not e!464199))))

(assert (=> b!832351 (= res!566316 (containsKey!402 lt!377460 (_1!5089 lt!377425)))))

(declare-fun b!832352 () Bool)

(assert (=> b!832352 (= e!464199 (contains!4212 lt!377460 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(assert (= (and d!106525 res!566315) b!832351))

(assert (= (and b!832351 res!566316) b!832352))

(assert (=> d!106525 m!775765))

(declare-fun m!776647 () Bool)

(assert (=> d!106525 m!776647))

(declare-fun m!776649 () Bool)

(assert (=> d!106525 m!776649))

(declare-fun m!776651 () Bool)

(assert (=> b!832351 m!776651))

(declare-fun m!776653 () Bool)

(assert (=> b!832352 m!776653))

(assert (=> d!106297 d!106525))

(declare-fun b!832353 () Bool)

(declare-fun e!464201 () List!15949)

(declare-fun call!36426 () List!15949)

(assert (=> b!832353 (= e!464201 call!36426)))

(declare-fun e!464200 () List!15949)

(declare-fun b!832354 () Bool)

(assert (=> b!832354 (= e!464200 (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))) (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(declare-fun bm!36422 () Bool)

(declare-fun call!36425 () List!15949)

(assert (=> bm!36422 (= call!36426 call!36425)))

(declare-fun b!832355 () Bool)

(assert (=> b!832355 (= e!464201 call!36426)))

(declare-fun b!832356 () Bool)

(declare-fun c!90471 () Bool)

(declare-fun c!90473 () Bool)

(assert (=> b!832356 (= e!464200 (ite c!90473 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))) (ite c!90471 (Cons!15945 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428))) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) Nil!15946)))))

(declare-fun bm!36423 () Bool)

(declare-fun call!36427 () List!15949)

(declare-fun c!90474 () Bool)

(assert (=> bm!36423 (= call!36427 ($colon$colon!537 e!464200 (ite c!90474 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428))) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425)))))))

(declare-fun c!90472 () Bool)

(assert (=> bm!36423 (= c!90472 c!90474)))

(declare-fun b!832357 () Bool)

(declare-fun res!566318 () Bool)

(declare-fun e!464203 () Bool)

(assert (=> b!832357 (=> (not res!566318) (not e!464203))))

(declare-fun lt!377815 () List!15949)

(assert (=> b!832357 (= res!566318 (containsKey!402 lt!377815 (_1!5089 lt!377425)))))

(declare-fun b!832358 () Bool)

(declare-fun e!464204 () List!15949)

(assert (=> b!832358 (= e!464204 call!36427)))

(declare-fun b!832359 () Bool)

(assert (=> b!832359 (= c!90471 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377422 lt!377428))) (bvsgt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428)))) (_1!5089 lt!377425))))))

(declare-fun e!464202 () List!15949)

(assert (=> b!832359 (= e!464202 e!464201)))

(declare-fun d!106527 () Bool)

(assert (=> d!106527 e!464203))

(declare-fun res!566317 () Bool)

(assert (=> d!106527 (=> (not res!566317) (not e!464203))))

(assert (=> d!106527 (= res!566317 (isStrictlySorted!442 lt!377815))))

(assert (=> d!106527 (= lt!377815 e!464204)))

(assert (=> d!106527 (= c!90474 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377422 lt!377428))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428)))) (_1!5089 lt!377425))))))

(assert (=> d!106527 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377422 lt!377428)))))

(assert (=> d!106527 (= (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377422 lt!377428)) (_1!5089 lt!377425) (_2!5089 lt!377425)) lt!377815)))

(declare-fun b!832360 () Bool)

(assert (=> b!832360 (= e!464202 call!36425)))

(declare-fun bm!36424 () Bool)

(assert (=> bm!36424 (= call!36425 call!36427)))

(declare-fun b!832361 () Bool)

(assert (=> b!832361 (= e!464203 (contains!4212 lt!377815 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!832362 () Bool)

(assert (=> b!832362 (= e!464204 e!464202)))

(assert (=> b!832362 (= c!90473 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377422 lt!377428))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428)))) (_1!5089 lt!377425))))))

(assert (= (and d!106527 c!90474) b!832358))

(assert (= (and d!106527 (not c!90474)) b!832362))

(assert (= (and b!832362 c!90473) b!832360))

(assert (= (and b!832362 (not c!90473)) b!832359))

(assert (= (and b!832359 c!90471) b!832353))

(assert (= (and b!832359 (not c!90471)) b!832355))

(assert (= (or b!832353 b!832355) bm!36422))

(assert (= (or b!832360 bm!36422) bm!36424))

(assert (= (or b!832358 bm!36424) bm!36423))

(assert (= (and bm!36423 c!90472) b!832354))

(assert (= (and bm!36423 (not c!90472)) b!832356))

(assert (= (and d!106527 res!566317) b!832357))

(assert (= (and b!832357 res!566318) b!832361))

(declare-fun m!776655 () Bool)

(assert (=> d!106527 m!776655))

(declare-fun m!776657 () Bool)

(assert (=> d!106527 m!776657))

(declare-fun m!776659 () Bool)

(assert (=> b!832357 m!776659))

(declare-fun m!776661 () Bool)

(assert (=> b!832361 m!776661))

(declare-fun m!776663 () Bool)

(assert (=> bm!36423 m!776663))

(declare-fun m!776665 () Bool)

(assert (=> b!832354 m!776665))

(assert (=> d!106297 d!106527))

(declare-fun d!106529 () Bool)

(declare-fun e!464205 () Bool)

(assert (=> d!106529 e!464205))

(declare-fun res!566319 () Bool)

(assert (=> d!106529 (=> res!566319 e!464205)))

(declare-fun lt!377819 () Bool)

(assert (=> d!106529 (= res!566319 (not lt!377819))))

(declare-fun lt!377818 () Bool)

(assert (=> d!106529 (= lt!377819 lt!377818)))

(declare-fun lt!377817 () Unit!28493)

(declare-fun e!464206 () Unit!28493)

(assert (=> d!106529 (= lt!377817 e!464206)))

(declare-fun c!90475 () Bool)

(assert (=> d!106529 (= c!90475 lt!377818)))

(assert (=> d!106529 (= lt!377818 (containsKey!402 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!106529 (= (contains!4211 lt!377554 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!377819)))

(declare-fun b!832363 () Bool)

(declare-fun lt!377816 () Unit!28493)

(assert (=> b!832363 (= e!464206 lt!377816)))

(assert (=> b!832363 (= lt!377816 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832363 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832364 () Bool)

(declare-fun Unit!28517 () Unit!28493)

(assert (=> b!832364 (= e!464206 Unit!28517)))

(declare-fun b!832365 () Bool)

(assert (=> b!832365 (= e!464205 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!106529 c!90475) b!832363))

(assert (= (and d!106529 (not c!90475)) b!832364))

(assert (= (and d!106529 (not res!566319)) b!832365))

(assert (=> d!106529 m!775791))

(declare-fun m!776667 () Bool)

(assert (=> d!106529 m!776667))

(assert (=> b!832363 m!775791))

(declare-fun m!776669 () Bool)

(assert (=> b!832363 m!776669))

(assert (=> b!832363 m!775791))

(assert (=> b!832363 m!776045))

(assert (=> b!832363 m!776045))

(declare-fun m!776671 () Bool)

(assert (=> b!832363 m!776671))

(assert (=> b!832365 m!775791))

(assert (=> b!832365 m!776045))

(assert (=> b!832365 m!776045))

(assert (=> b!832365 m!776671))

(assert (=> b!831955 d!106529))

(declare-fun b!832368 () Bool)

(declare-fun e!464208 () Option!422)

(assert (=> b!832368 (= e!464208 (getValueByKey!416 (t!22317 (toList!4505 lt!377617)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832367 () Bool)

(declare-fun e!464207 () Option!422)

(assert (=> b!832367 (= e!464207 e!464208)))

(declare-fun c!90477 () Bool)

(assert (=> b!832367 (= c!90477 (and ((_ is Cons!15945) (toList!4505 lt!377617)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377617))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832369 () Bool)

(assert (=> b!832369 (= e!464208 None!420)))

(declare-fun b!832366 () Bool)

(assert (=> b!832366 (= e!464207 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377617)))))))

(declare-fun d!106531 () Bool)

(declare-fun c!90476 () Bool)

(assert (=> d!106531 (= c!90476 (and ((_ is Cons!15945) (toList!4505 lt!377617)) (= (_1!5089 (h!17075 (toList!4505 lt!377617))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106531 (= (getValueByKey!416 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464207)))

(assert (= (and d!106531 c!90476) b!832366))

(assert (= (and d!106531 (not c!90476)) b!832367))

(assert (= (and b!832367 c!90477) b!832368))

(assert (= (and b!832367 (not c!90477)) b!832369))

(declare-fun m!776673 () Bool)

(assert (=> b!832368 m!776673))

(assert (=> b!831999 d!106531))

(declare-fun b!832372 () Bool)

(declare-fun e!464210 () Option!422)

(assert (=> b!832372 (= e!464210 (getValueByKey!416 (t!22317 (toList!4505 lt!377605)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832371 () Bool)

(declare-fun e!464209 () Option!422)

(assert (=> b!832371 (= e!464209 e!464210)))

(declare-fun c!90479 () Bool)

(assert (=> b!832371 (= c!90479 (and ((_ is Cons!15945) (toList!4505 lt!377605)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377605))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832373 () Bool)

(assert (=> b!832373 (= e!464210 None!420)))

(declare-fun b!832370 () Bool)

(assert (=> b!832370 (= e!464209 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377605)))))))

(declare-fun d!106533 () Bool)

(declare-fun c!90478 () Bool)

(assert (=> d!106533 (= c!90478 (and ((_ is Cons!15945) (toList!4505 lt!377605)) (= (_1!5089 (h!17075 (toList!4505 lt!377605))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106533 (= (getValueByKey!416 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464209)))

(assert (= (and d!106533 c!90478) b!832370))

(assert (= (and d!106533 (not c!90478)) b!832371))

(assert (= (and b!832371 c!90479) b!832372))

(assert (= (and b!832371 (not c!90479)) b!832373))

(declare-fun m!776675 () Bool)

(assert (=> b!832372 m!776675))

(assert (=> b!831993 d!106533))

(declare-fun d!106535 () Bool)

(declare-fun e!464211 () Bool)

(assert (=> d!106535 e!464211))

(declare-fun res!566320 () Bool)

(assert (=> d!106535 (=> res!566320 e!464211)))

(declare-fun lt!377823 () Bool)

(assert (=> d!106535 (= res!566320 (not lt!377823))))

(declare-fun lt!377822 () Bool)

(assert (=> d!106535 (= lt!377823 lt!377822)))

(declare-fun lt!377821 () Unit!28493)

(declare-fun e!464212 () Unit!28493)

(assert (=> d!106535 (= lt!377821 e!464212)))

(declare-fun c!90480 () Bool)

(assert (=> d!106535 (= c!90480 lt!377822)))

(assert (=> d!106535 (= lt!377822 (containsKey!402 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106535 (= (contains!4211 lt!377494 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377823)))

(declare-fun b!832374 () Bool)

(declare-fun lt!377820 () Unit!28493)

(assert (=> b!832374 (= e!464212 lt!377820)))

(assert (=> b!832374 (= lt!377820 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832374 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832375 () Bool)

(declare-fun Unit!28518 () Unit!28493)

(assert (=> b!832375 (= e!464212 Unit!28518)))

(declare-fun b!832376 () Bool)

(assert (=> b!832376 (= e!464211 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106535 c!90480) b!832374))

(assert (= (and d!106535 (not c!90480)) b!832375))

(assert (= (and d!106535 (not res!566320)) b!832376))

(declare-fun m!776677 () Bool)

(assert (=> d!106535 m!776677))

(declare-fun m!776679 () Bool)

(assert (=> b!832374 m!776679))

(declare-fun m!776681 () Bool)

(assert (=> b!832374 m!776681))

(assert (=> b!832374 m!776681))

(declare-fun m!776683 () Bool)

(assert (=> b!832374 m!776683))

(assert (=> b!832376 m!776681))

(assert (=> b!832376 m!776681))

(assert (=> b!832376 m!776683))

(assert (=> b!831892 d!106535))

(assert (=> b!832015 d!106335))

(declare-fun d!106537 () Bool)

(assert (=> d!106537 (= (apply!373 lt!377554 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23281 () Bool)

(assert (= bs!23281 d!106537))

(assert (=> bs!23281 m!776453))

(assert (=> bs!23281 m!776453))

(declare-fun m!776685 () Bool)

(assert (=> bs!23281 m!776685))

(assert (=> b!831961 d!106537))

(assert (=> d!106311 d!106321))

(declare-fun d!106539 () Bool)

(declare-fun e!464213 () Bool)

(assert (=> d!106539 e!464213))

(declare-fun res!566321 () Bool)

(assert (=> d!106539 (=> res!566321 e!464213)))

(declare-fun lt!377827 () Bool)

(assert (=> d!106539 (= res!566321 (not lt!377827))))

(declare-fun lt!377826 () Bool)

(assert (=> d!106539 (= lt!377827 lt!377826)))

(declare-fun lt!377825 () Unit!28493)

(declare-fun e!464214 () Unit!28493)

(assert (=> d!106539 (= lt!377825 e!464214)))

(declare-fun c!90481 () Bool)

(assert (=> d!106539 (= c!90481 lt!377826)))

(assert (=> d!106539 (= lt!377826 (containsKey!402 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106539 (= (contains!4211 lt!377494 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377827)))

(declare-fun b!832377 () Bool)

(declare-fun lt!377824 () Unit!28493)

(assert (=> b!832377 (= e!464214 lt!377824)))

(assert (=> b!832377 (= lt!377824 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832377 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832378 () Bool)

(declare-fun Unit!28519 () Unit!28493)

(assert (=> b!832378 (= e!464214 Unit!28519)))

(declare-fun b!832379 () Bool)

(assert (=> b!832379 (= e!464213 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106539 c!90481) b!832377))

(assert (= (and d!106539 (not c!90481)) b!832378))

(assert (= (and d!106539 (not res!566321)) b!832379))

(declare-fun m!776687 () Bool)

(assert (=> d!106539 m!776687))

(declare-fun m!776689 () Bool)

(assert (=> b!832377 m!776689))

(declare-fun m!776691 () Bool)

(assert (=> b!832377 m!776691))

(assert (=> b!832377 m!776691))

(declare-fun m!776693 () Bool)

(assert (=> b!832377 m!776693))

(assert (=> b!832379 m!776691))

(assert (=> b!832379 m!776691))

(assert (=> b!832379 m!776693))

(assert (=> d!106305 d!106539))

(assert (=> d!106305 d!106321))

(declare-fun d!106541 () Bool)

(assert (=> d!106541 (not (contains!4211 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)) lt!377486))))

(declare-fun lt!377830 () Unit!28493)

(declare-fun choose!1426 (ListLongMap!8979 (_ BitVec 64) V!25285 (_ BitVec 64)) Unit!28493)

(assert (=> d!106541 (= lt!377830 (choose!1426 lt!377488 lt!377484 lt!377483 lt!377486))))

(declare-fun e!464217 () Bool)

(assert (=> d!106541 e!464217))

(declare-fun res!566324 () Bool)

(assert (=> d!106541 (=> (not res!566324) (not e!464217))))

(assert (=> d!106541 (= res!566324 (not (contains!4211 lt!377488 lt!377486)))))

(assert (=> d!106541 (= (addStillNotContains!198 lt!377488 lt!377484 lt!377483 lt!377486) lt!377830)))

(declare-fun b!832383 () Bool)

(assert (=> b!832383 (= e!464217 (not (= lt!377484 lt!377486)))))

(assert (= (and d!106541 res!566324) b!832383))

(assert (=> d!106541 m!775807))

(assert (=> d!106541 m!775807))

(assert (=> d!106541 m!775811))

(declare-fun m!776695 () Bool)

(assert (=> d!106541 m!776695))

(declare-fun m!776697 () Bool)

(assert (=> d!106541 m!776697))

(assert (=> b!831868 d!106541))

(assert (=> b!831868 d!106347))

(declare-fun d!106543 () Bool)

(declare-fun e!464218 () Bool)

(assert (=> d!106543 e!464218))

(declare-fun res!566325 () Bool)

(assert (=> d!106543 (=> res!566325 e!464218)))

(declare-fun lt!377834 () Bool)

(assert (=> d!106543 (= res!566325 (not lt!377834))))

(declare-fun lt!377833 () Bool)

(assert (=> d!106543 (= lt!377834 lt!377833)))

(declare-fun lt!377832 () Unit!28493)

(declare-fun e!464219 () Unit!28493)

(assert (=> d!106543 (= lt!377832 e!464219)))

(declare-fun c!90482 () Bool)

(assert (=> d!106543 (= c!90482 lt!377833)))

(assert (=> d!106543 (= lt!377833 (containsKey!402 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486))))

(assert (=> d!106543 (= (contains!4211 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)) lt!377486) lt!377834)))

(declare-fun b!832384 () Bool)

(declare-fun lt!377831 () Unit!28493)

(assert (=> b!832384 (= e!464219 lt!377831)))

(assert (=> b!832384 (= lt!377831 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486))))

(assert (=> b!832384 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486))))

(declare-fun b!832385 () Bool)

(declare-fun Unit!28520 () Unit!28493)

(assert (=> b!832385 (= e!464219 Unit!28520)))

(declare-fun b!832386 () Bool)

(assert (=> b!832386 (= e!464218 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486)))))

(assert (= (and d!106543 c!90482) b!832384))

(assert (= (and d!106543 (not c!90482)) b!832385))

(assert (= (and d!106543 (not res!566325)) b!832386))

(declare-fun m!776699 () Bool)

(assert (=> d!106543 m!776699))

(declare-fun m!776701 () Bool)

(assert (=> b!832384 m!776701))

(declare-fun m!776703 () Bool)

(assert (=> b!832384 m!776703))

(assert (=> b!832384 m!776703))

(declare-fun m!776705 () Bool)

(assert (=> b!832384 m!776705))

(assert (=> b!832386 m!776703))

(assert (=> b!832386 m!776703))

(assert (=> b!832386 m!776705))

(assert (=> b!831868 d!106543))

(declare-fun d!106545 () Bool)

(declare-fun e!464220 () Bool)

(assert (=> d!106545 e!464220))

(declare-fun res!566326 () Bool)

(assert (=> d!106545 (=> (not res!566326) (not e!464220))))

(declare-fun lt!377838 () ListLongMap!8979)

(assert (=> d!106545 (= res!566326 (contains!4211 lt!377838 (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun lt!377837 () List!15949)

(assert (=> d!106545 (= lt!377838 (ListLongMap!8980 lt!377837))))

(declare-fun lt!377835 () Unit!28493)

(declare-fun lt!377836 () Unit!28493)

(assert (=> d!106545 (= lt!377835 lt!377836)))

(assert (=> d!106545 (= (getValueByKey!416 lt!377837 (_1!5089 (tuple2!10157 lt!377484 lt!377483))) (Some!421 (_2!5089 (tuple2!10157 lt!377484 lt!377483))))))

(assert (=> d!106545 (= lt!377836 (lemmaContainsTupThenGetReturnValue!230 lt!377837 (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483))))))

(assert (=> d!106545 (= lt!377837 (insertStrictlySorted!269 (toList!4505 lt!377488) (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483))))))

(assert (=> d!106545 (= (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)) lt!377838)))

(declare-fun b!832387 () Bool)

(declare-fun res!566327 () Bool)

(assert (=> b!832387 (=> (not res!566327) (not e!464220))))

(assert (=> b!832387 (= res!566327 (= (getValueByKey!416 (toList!4505 lt!377838) (_1!5089 (tuple2!10157 lt!377484 lt!377483))) (Some!421 (_2!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(declare-fun b!832388 () Bool)

(assert (=> b!832388 (= e!464220 (contains!4212 (toList!4505 lt!377838) (tuple2!10157 lt!377484 lt!377483)))))

(assert (= (and d!106545 res!566326) b!832387))

(assert (= (and b!832387 res!566327) b!832388))

(declare-fun m!776707 () Bool)

(assert (=> d!106545 m!776707))

(declare-fun m!776709 () Bool)

(assert (=> d!106545 m!776709))

(declare-fun m!776711 () Bool)

(assert (=> d!106545 m!776711))

(declare-fun m!776713 () Bool)

(assert (=> d!106545 m!776713))

(declare-fun m!776715 () Bool)

(assert (=> b!832387 m!776715))

(declare-fun m!776717 () Bool)

(assert (=> b!832388 m!776717))

(assert (=> b!831868 d!106545))

(declare-fun d!106547 () Bool)

(declare-fun e!464221 () Bool)

(assert (=> d!106547 e!464221))

(declare-fun res!566328 () Bool)

(assert (=> d!106547 (=> (not res!566328) (not e!464221))))

(declare-fun lt!377842 () ListLongMap!8979)

(assert (=> d!106547 (= res!566328 (contains!4211 lt!377842 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377841 () List!15949)

(assert (=> d!106547 (= lt!377842 (ListLongMap!8980 lt!377841))))

(declare-fun lt!377839 () Unit!28493)

(declare-fun lt!377840 () Unit!28493)

(assert (=> d!106547 (= lt!377839 lt!377840)))

(assert (=> d!106547 (= (getValueByKey!416 lt!377841 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106547 (= lt!377840 (lemmaContainsTupThenGetReturnValue!230 lt!377841 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106547 (= lt!377841 (insertStrictlySorted!269 (toList!4505 call!36361) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106547 (= (+!1983 call!36361 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377842)))

(declare-fun b!832389 () Bool)

(declare-fun res!566329 () Bool)

(assert (=> b!832389 (=> (not res!566329) (not e!464221))))

(assert (=> b!832389 (= res!566329 (= (getValueByKey!416 (toList!4505 lt!377842) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832390 () Bool)

(assert (=> b!832390 (= e!464221 (contains!4212 (toList!4505 lt!377842) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106547 res!566328) b!832389))

(assert (= (and b!832389 res!566329) b!832390))

(declare-fun m!776719 () Bool)

(assert (=> d!106547 m!776719))

(declare-fun m!776721 () Bool)

(assert (=> d!106547 m!776721))

(declare-fun m!776723 () Bool)

(assert (=> d!106547 m!776723))

(declare-fun m!776725 () Bool)

(assert (=> d!106547 m!776725))

(declare-fun m!776727 () Bool)

(assert (=> b!832389 m!776727))

(declare-fun m!776729 () Bool)

(assert (=> b!832390 m!776729))

(assert (=> b!831868 d!106547))

(declare-fun d!106549 () Bool)

(assert (=> d!106549 (= (apply!373 lt!377580 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23282 () Bool)

(assert (= bs!23282 d!106549))

(assert (=> bs!23282 m!775791))

(assert (=> bs!23282 m!776395))

(assert (=> bs!23282 m!776395))

(declare-fun m!776731 () Bool)

(assert (=> bs!23282 m!776731))

(assert (=> b!831976 d!106549))

(assert (=> b!831976 d!106347))

(declare-fun d!106551 () Bool)

(declare-fun e!464222 () Bool)

(assert (=> d!106551 e!464222))

(declare-fun res!566330 () Bool)

(assert (=> d!106551 (=> res!566330 e!464222)))

(declare-fun lt!377846 () Bool)

(assert (=> d!106551 (= res!566330 (not lt!377846))))

(declare-fun lt!377845 () Bool)

(assert (=> d!106551 (= lt!377846 lt!377845)))

(declare-fun lt!377844 () Unit!28493)

(declare-fun e!464223 () Unit!28493)

(assert (=> d!106551 (= lt!377844 e!464223)))

(declare-fun c!90483 () Bool)

(assert (=> d!106551 (= c!90483 lt!377845)))

(assert (=> d!106551 (= lt!377845 (containsKey!402 (toList!4505 lt!377509) (_1!5089 lt!377428)))))

(assert (=> d!106551 (= (contains!4211 lt!377509 (_1!5089 lt!377428)) lt!377846)))

(declare-fun b!832391 () Bool)

(declare-fun lt!377843 () Unit!28493)

(assert (=> b!832391 (= e!464223 lt!377843)))

(assert (=> b!832391 (= lt!377843 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377509) (_1!5089 lt!377428)))))

(assert (=> b!832391 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377509) (_1!5089 lt!377428)))))

(declare-fun b!832392 () Bool)

(declare-fun Unit!28521 () Unit!28493)

(assert (=> b!832392 (= e!464223 Unit!28521)))

(declare-fun b!832393 () Bool)

(assert (=> b!832393 (= e!464222 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377509) (_1!5089 lt!377428))))))

(assert (= (and d!106551 c!90483) b!832391))

(assert (= (and d!106551 (not c!90483)) b!832392))

(assert (= (and d!106551 (not res!566330)) b!832393))

(declare-fun m!776733 () Bool)

(assert (=> d!106551 m!776733))

(declare-fun m!776735 () Bool)

(assert (=> b!832391 m!776735))

(assert (=> b!832391 m!775855))

(assert (=> b!832391 m!775855))

(declare-fun m!776737 () Bool)

(assert (=> b!832391 m!776737))

(assert (=> b!832393 m!775855))

(assert (=> b!832393 m!775855))

(assert (=> b!832393 m!776737))

(assert (=> d!106309 d!106551))

(declare-fun b!832396 () Bool)

(declare-fun e!464225 () Option!422)

(assert (=> b!832396 (= e!464225 (getValueByKey!416 (t!22317 lt!377508) (_1!5089 lt!377428)))))

(declare-fun b!832395 () Bool)

(declare-fun e!464224 () Option!422)

(assert (=> b!832395 (= e!464224 e!464225)))

(declare-fun c!90485 () Bool)

(assert (=> b!832395 (= c!90485 (and ((_ is Cons!15945) lt!377508) (not (= (_1!5089 (h!17075 lt!377508)) (_1!5089 lt!377428)))))))

(declare-fun b!832397 () Bool)

(assert (=> b!832397 (= e!464225 None!420)))

(declare-fun b!832394 () Bool)

(assert (=> b!832394 (= e!464224 (Some!421 (_2!5089 (h!17075 lt!377508))))))

(declare-fun d!106553 () Bool)

(declare-fun c!90484 () Bool)

(assert (=> d!106553 (= c!90484 (and ((_ is Cons!15945) lt!377508) (= (_1!5089 (h!17075 lt!377508)) (_1!5089 lt!377428))))))

(assert (=> d!106553 (= (getValueByKey!416 lt!377508 (_1!5089 lt!377428)) e!464224)))

(assert (= (and d!106553 c!90484) b!832394))

(assert (= (and d!106553 (not c!90484)) b!832395))

(assert (= (and b!832395 c!90485) b!832396))

(assert (= (and b!832395 (not c!90485)) b!832397))

(declare-fun m!776739 () Bool)

(assert (=> b!832396 m!776739))

(assert (=> d!106309 d!106553))

(declare-fun d!106555 () Bool)

(assert (=> d!106555 (= (getValueByKey!416 lt!377508 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(declare-fun lt!377847 () Unit!28493)

(assert (=> d!106555 (= lt!377847 (choose!1423 lt!377508 (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun e!464226 () Bool)

(assert (=> d!106555 e!464226))

(declare-fun res!566331 () Bool)

(assert (=> d!106555 (=> (not res!566331) (not e!464226))))

(assert (=> d!106555 (= res!566331 (isStrictlySorted!442 lt!377508))))

(assert (=> d!106555 (= (lemmaContainsTupThenGetReturnValue!230 lt!377508 (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377847)))

(declare-fun b!832398 () Bool)

(declare-fun res!566332 () Bool)

(assert (=> b!832398 (=> (not res!566332) (not e!464226))))

(assert (=> b!832398 (= res!566332 (containsKey!402 lt!377508 (_1!5089 lt!377428)))))

(declare-fun b!832399 () Bool)

(assert (=> b!832399 (= e!464226 (contains!4212 lt!377508 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106555 res!566331) b!832398))

(assert (= (and b!832398 res!566332) b!832399))

(assert (=> d!106555 m!775849))

(declare-fun m!776741 () Bool)

(assert (=> d!106555 m!776741))

(declare-fun m!776743 () Bool)

(assert (=> d!106555 m!776743))

(declare-fun m!776745 () Bool)

(assert (=> b!832398 m!776745))

(declare-fun m!776747 () Bool)

(assert (=> b!832399 m!776747))

(assert (=> d!106309 d!106555))

(declare-fun b!832400 () Bool)

(declare-fun e!464228 () List!15949)

(declare-fun call!36429 () List!15949)

(assert (=> b!832400 (= e!464228 call!36429)))

(declare-fun b!832401 () Bool)

(declare-fun e!464227 () List!15949)

(assert (=> b!832401 (= e!464227 (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36425 () Bool)

(declare-fun call!36428 () List!15949)

(assert (=> bm!36425 (= call!36429 call!36428)))

(declare-fun b!832402 () Bool)

(assert (=> b!832402 (= e!464228 call!36429)))

(declare-fun c!90486 () Bool)

(declare-fun c!90488 () Bool)

(declare-fun b!832403 () Bool)

(assert (=> b!832403 (= e!464227 (ite c!90488 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))) (ite c!90486 (Cons!15945 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425))) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) Nil!15946)))))

(declare-fun c!90489 () Bool)

(declare-fun call!36430 () List!15949)

(declare-fun bm!36426 () Bool)

(assert (=> bm!36426 (= call!36430 ($colon$colon!537 e!464227 (ite c!90489 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90487 () Bool)

(assert (=> bm!36426 (= c!90487 c!90489)))

(declare-fun b!832404 () Bool)

(declare-fun res!566334 () Bool)

(declare-fun e!464230 () Bool)

(assert (=> b!832404 (=> (not res!566334) (not e!464230))))

(declare-fun lt!377848 () List!15949)

(assert (=> b!832404 (= res!566334 (containsKey!402 lt!377848 (_1!5089 lt!377428)))))

(declare-fun b!832405 () Bool)

(declare-fun e!464231 () List!15949)

(assert (=> b!832405 (= e!464231 call!36430)))

(declare-fun b!832406 () Bool)

(assert (=> b!832406 (= c!90486 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377422 lt!377425))) (bvsgt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425)))) (_1!5089 lt!377428))))))

(declare-fun e!464229 () List!15949)

(assert (=> b!832406 (= e!464229 e!464228)))

(declare-fun d!106557 () Bool)

(assert (=> d!106557 e!464230))

(declare-fun res!566333 () Bool)

(assert (=> d!106557 (=> (not res!566333) (not e!464230))))

(assert (=> d!106557 (= res!566333 (isStrictlySorted!442 lt!377848))))

(assert (=> d!106557 (= lt!377848 e!464231)))

(assert (=> d!106557 (= c!90489 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377422 lt!377425))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425)))) (_1!5089 lt!377428))))))

(assert (=> d!106557 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377422 lt!377425)))))

(assert (=> d!106557 (= (insertStrictlySorted!269 (toList!4505 (+!1983 lt!377422 lt!377425)) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377848)))

(declare-fun b!832407 () Bool)

(assert (=> b!832407 (= e!464229 call!36428)))

(declare-fun bm!36427 () Bool)

(assert (=> bm!36427 (= call!36428 call!36430)))

(declare-fun b!832408 () Bool)

(assert (=> b!832408 (= e!464230 (contains!4212 lt!377848 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832409 () Bool)

(assert (=> b!832409 (= e!464231 e!464229)))

(assert (=> b!832409 (= c!90488 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377422 lt!377425))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425)))) (_1!5089 lt!377428))))))

(assert (= (and d!106557 c!90489) b!832405))

(assert (= (and d!106557 (not c!90489)) b!832409))

(assert (= (and b!832409 c!90488) b!832407))

(assert (= (and b!832409 (not c!90488)) b!832406))

(assert (= (and b!832406 c!90486) b!832400))

(assert (= (and b!832406 (not c!90486)) b!832402))

(assert (= (or b!832400 b!832402) bm!36425))

(assert (= (or b!832407 bm!36425) bm!36427))

(assert (= (or b!832405 bm!36427) bm!36426))

(assert (= (and bm!36426 c!90487) b!832401))

(assert (= (and bm!36426 (not c!90487)) b!832403))

(assert (= (and d!106557 res!566333) b!832404))

(assert (= (and b!832404 res!566334) b!832408))

(declare-fun m!776749 () Bool)

(assert (=> d!106557 m!776749))

(declare-fun m!776751 () Bool)

(assert (=> d!106557 m!776751))

(declare-fun m!776753 () Bool)

(assert (=> b!832404 m!776753))

(declare-fun m!776755 () Bool)

(assert (=> b!832408 m!776755))

(declare-fun m!776757 () Bool)

(assert (=> bm!36426 m!776757))

(declare-fun m!776759 () Bool)

(assert (=> b!832401 m!776759))

(assert (=> d!106309 d!106557))

(assert (=> d!106315 d!106321))

(assert (=> bm!36386 d!106303))

(declare-fun d!106559 () Bool)

(assert (=> d!106559 (= (apply!373 lt!377554 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23283 () Bool)

(assert (= bs!23283 d!106559))

(assert (=> bs!23283 m!776201))

(assert (=> bs!23283 m!776201))

(declare-fun m!776761 () Bool)

(assert (=> bs!23283 m!776761))

(assert (=> b!831966 d!106559))

(assert (=> b!831883 d!106447))

(declare-fun d!106561 () Bool)

(declare-fun lt!377849 () Bool)

(assert (=> d!106561 (= lt!377849 (select (content!388 (toList!4505 lt!377461)) lt!377425))))

(declare-fun e!464233 () Bool)

(assert (=> d!106561 (= lt!377849 e!464233)))

(declare-fun res!566336 () Bool)

(assert (=> d!106561 (=> (not res!566336) (not e!464233))))

(assert (=> d!106561 (= res!566336 ((_ is Cons!15945) (toList!4505 lt!377461)))))

(assert (=> d!106561 (= (contains!4212 (toList!4505 lt!377461) lt!377425) lt!377849)))

(declare-fun b!832410 () Bool)

(declare-fun e!464232 () Bool)

(assert (=> b!832410 (= e!464233 e!464232)))

(declare-fun res!566335 () Bool)

(assert (=> b!832410 (=> res!566335 e!464232)))

(assert (=> b!832410 (= res!566335 (= (h!17075 (toList!4505 lt!377461)) lt!377425))))

(declare-fun b!832411 () Bool)

(assert (=> b!832411 (= e!464232 (contains!4212 (t!22317 (toList!4505 lt!377461)) lt!377425))))

(assert (= (and d!106561 res!566336) b!832410))

(assert (= (and b!832410 (not res!566335)) b!832411))

(declare-fun m!776763 () Bool)

(assert (=> d!106561 m!776763))

(declare-fun m!776765 () Bool)

(assert (=> d!106561 m!776765))

(declare-fun m!776767 () Bool)

(assert (=> b!832411 m!776767))

(assert (=> b!831840 d!106561))

(declare-fun b!832414 () Bool)

(declare-fun e!464235 () Option!422)

(assert (=> b!832414 (= e!464235 (getValueByKey!416 (t!22317 (toList!4505 lt!377509)) (_1!5089 lt!377428)))))

(declare-fun b!832413 () Bool)

(declare-fun e!464234 () Option!422)

(assert (=> b!832413 (= e!464234 e!464235)))

(declare-fun c!90491 () Bool)

(assert (=> b!832413 (= c!90491 (and ((_ is Cons!15945) (toList!4505 lt!377509)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377509))) (_1!5089 lt!377428)))))))

(declare-fun b!832415 () Bool)

(assert (=> b!832415 (= e!464235 None!420)))

(declare-fun b!832412 () Bool)

(assert (=> b!832412 (= e!464234 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377509)))))))

(declare-fun d!106563 () Bool)

(declare-fun c!90490 () Bool)

(assert (=> d!106563 (= c!90490 (and ((_ is Cons!15945) (toList!4505 lt!377509)) (= (_1!5089 (h!17075 (toList!4505 lt!377509))) (_1!5089 lt!377428))))))

(assert (=> d!106563 (= (getValueByKey!416 (toList!4505 lt!377509) (_1!5089 lt!377428)) e!464234)))

(assert (= (and d!106563 c!90490) b!832412))

(assert (= (and d!106563 (not c!90490)) b!832413))

(assert (= (and b!832413 c!90491) b!832414))

(assert (= (and b!832413 (not c!90491)) b!832415))

(declare-fun m!776769 () Bool)

(assert (=> b!832414 m!776769))

(assert (=> b!831905 d!106563))

(assert (=> b!831871 d!106335))

(declare-fun d!106565 () Bool)

(assert (=> d!106565 (= (apply!373 lt!377487 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23284 () Bool)

(assert (= bs!23284 d!106565))

(assert (=> bs!23284 m!775791))

(assert (=> bs!23284 m!776021))

(assert (=> bs!23284 m!776021))

(declare-fun m!776771 () Bool)

(assert (=> bs!23284 m!776771))

(assert (=> b!831873 d!106565))

(assert (=> b!831873 d!106347))

(declare-fun d!106567 () Bool)

(declare-fun lt!377850 () Bool)

(assert (=> d!106567 (= lt!377850 (select (content!388 (toList!4505 lt!377465)) lt!377428))))

(declare-fun e!464237 () Bool)

(assert (=> d!106567 (= lt!377850 e!464237)))

(declare-fun res!566338 () Bool)

(assert (=> d!106567 (=> (not res!566338) (not e!464237))))

(assert (=> d!106567 (= res!566338 ((_ is Cons!15945) (toList!4505 lt!377465)))))

(assert (=> d!106567 (= (contains!4212 (toList!4505 lt!377465) lt!377428) lt!377850)))

(declare-fun b!832416 () Bool)

(declare-fun e!464236 () Bool)

(assert (=> b!832416 (= e!464237 e!464236)))

(declare-fun res!566337 () Bool)

(assert (=> b!832416 (=> res!566337 e!464236)))

(assert (=> b!832416 (= res!566337 (= (h!17075 (toList!4505 lt!377465)) lt!377428))))

(declare-fun b!832417 () Bool)

(assert (=> b!832417 (= e!464236 (contains!4212 (t!22317 (toList!4505 lt!377465)) lt!377428))))

(assert (= (and d!106567 res!566338) b!832416))

(assert (= (and b!832416 (not res!566337)) b!832417))

(declare-fun m!776773 () Bool)

(assert (=> d!106567 m!776773))

(declare-fun m!776775 () Bool)

(assert (=> d!106567 m!776775))

(declare-fun m!776777 () Bool)

(assert (=> b!832417 m!776777))

(assert (=> b!831842 d!106567))

(assert (=> b!831869 d!106375))

(declare-fun b!832420 () Bool)

(declare-fun e!464239 () Option!422)

(assert (=> b!832420 (= e!464239 (getValueByKey!416 (t!22317 (toList!4505 lt!377579)) (_1!5089 lt!377425)))))

(declare-fun b!832419 () Bool)

(declare-fun e!464238 () Option!422)

(assert (=> b!832419 (= e!464238 e!464239)))

(declare-fun c!90493 () Bool)

(assert (=> b!832419 (= c!90493 (and ((_ is Cons!15945) (toList!4505 lt!377579)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377579))) (_1!5089 lt!377425)))))))

(declare-fun b!832421 () Bool)

(assert (=> b!832421 (= e!464239 None!420)))

(declare-fun b!832418 () Bool)

(assert (=> b!832418 (= e!464238 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377579)))))))

(declare-fun d!106569 () Bool)

(declare-fun c!90492 () Bool)

(assert (=> d!106569 (= c!90492 (and ((_ is Cons!15945) (toList!4505 lt!377579)) (= (_1!5089 (h!17075 (toList!4505 lt!377579))) (_1!5089 lt!377425))))))

(assert (=> d!106569 (= (getValueByKey!416 (toList!4505 lt!377579) (_1!5089 lt!377425)) e!464238)))

(assert (= (and d!106569 c!90492) b!832418))

(assert (= (and d!106569 (not c!90492)) b!832419))

(assert (= (and b!832419 c!90493) b!832420))

(assert (= (and b!832419 (not c!90493)) b!832421))

(declare-fun m!776779 () Bool)

(assert (=> b!832420 m!776779))

(assert (=> b!831970 d!106569))

(declare-fun d!106571 () Bool)

(declare-fun e!464240 () Bool)

(assert (=> d!106571 e!464240))

(declare-fun res!566339 () Bool)

(assert (=> d!106571 (=> (not res!566339) (not e!464240))))

(declare-fun lt!377854 () ListLongMap!8979)

(assert (=> d!106571 (= res!566339 (contains!4211 lt!377854 (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun lt!377853 () List!15949)

(assert (=> d!106571 (= lt!377854 (ListLongMap!8980 lt!377853))))

(declare-fun lt!377851 () Unit!28493)

(declare-fun lt!377852 () Unit!28493)

(assert (=> d!106571 (= lt!377851 lt!377852)))

(assert (=> d!106571 (= (getValueByKey!416 lt!377853 (_1!5089 (tuple2!10157 lt!377491 lt!377490))) (Some!421 (_2!5089 (tuple2!10157 lt!377491 lt!377490))))))

(assert (=> d!106571 (= lt!377852 (lemmaContainsTupThenGetReturnValue!230 lt!377853 (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490))))))

(assert (=> d!106571 (= lt!377853 (insertStrictlySorted!269 (toList!4505 lt!377495) (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490))))))

(assert (=> d!106571 (= (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)) lt!377854)))

(declare-fun b!832422 () Bool)

(declare-fun res!566340 () Bool)

(assert (=> b!832422 (=> (not res!566340) (not e!464240))))

(assert (=> b!832422 (= res!566340 (= (getValueByKey!416 (toList!4505 lt!377854) (_1!5089 (tuple2!10157 lt!377491 lt!377490))) (Some!421 (_2!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(declare-fun b!832423 () Bool)

(assert (=> b!832423 (= e!464240 (contains!4212 (toList!4505 lt!377854) (tuple2!10157 lt!377491 lt!377490)))))

(assert (= (and d!106571 res!566339) b!832422))

(assert (= (and b!832422 res!566340) b!832423))

(declare-fun m!776781 () Bool)

(assert (=> d!106571 m!776781))

(declare-fun m!776783 () Bool)

(assert (=> d!106571 m!776783))

(declare-fun m!776785 () Bool)

(assert (=> d!106571 m!776785))

(declare-fun m!776787 () Bool)

(assert (=> d!106571 m!776787))

(declare-fun m!776789 () Bool)

(assert (=> b!832422 m!776789))

(declare-fun m!776791 () Bool)

(assert (=> b!832423 m!776791))

(assert (=> b!831882 d!106571))

(declare-fun d!106573 () Bool)

(assert (=> d!106573 (not (contains!4211 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)) lt!377493))))

(declare-fun lt!377855 () Unit!28493)

(assert (=> d!106573 (= lt!377855 (choose!1426 lt!377495 lt!377491 lt!377490 lt!377493))))

(declare-fun e!464241 () Bool)

(assert (=> d!106573 e!464241))

(declare-fun res!566341 () Bool)

(assert (=> d!106573 (=> (not res!566341) (not e!464241))))

(assert (=> d!106573 (= res!566341 (not (contains!4211 lt!377495 lt!377493)))))

(assert (=> d!106573 (= (addStillNotContains!198 lt!377495 lt!377491 lt!377490 lt!377493) lt!377855)))

(declare-fun b!832424 () Bool)

(assert (=> b!832424 (= e!464241 (not (= lt!377491 lt!377493)))))

(assert (= (and d!106573 res!566341) b!832424))

(assert (=> d!106573 m!775827))

(assert (=> d!106573 m!775827))

(assert (=> d!106573 m!775831))

(declare-fun m!776793 () Bool)

(assert (=> d!106573 m!776793))

(declare-fun m!776795 () Bool)

(assert (=> d!106573 m!776795))

(assert (=> b!831882 d!106573))

(assert (=> b!831882 d!106347))

(declare-fun d!106575 () Bool)

(declare-fun e!464242 () Bool)

(assert (=> d!106575 e!464242))

(declare-fun res!566342 () Bool)

(assert (=> d!106575 (=> res!566342 e!464242)))

(declare-fun lt!377859 () Bool)

(assert (=> d!106575 (= res!566342 (not lt!377859))))

(declare-fun lt!377858 () Bool)

(assert (=> d!106575 (= lt!377859 lt!377858)))

(declare-fun lt!377857 () Unit!28493)

(declare-fun e!464243 () Unit!28493)

(assert (=> d!106575 (= lt!377857 e!464243)))

(declare-fun c!90494 () Bool)

(assert (=> d!106575 (= c!90494 lt!377858)))

(assert (=> d!106575 (= lt!377858 (containsKey!402 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493))))

(assert (=> d!106575 (= (contains!4211 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)) lt!377493) lt!377859)))

(declare-fun b!832425 () Bool)

(declare-fun lt!377856 () Unit!28493)

(assert (=> b!832425 (= e!464243 lt!377856)))

(assert (=> b!832425 (= lt!377856 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493))))

(assert (=> b!832425 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493))))

(declare-fun b!832426 () Bool)

(declare-fun Unit!28522 () Unit!28493)

(assert (=> b!832426 (= e!464243 Unit!28522)))

(declare-fun b!832427 () Bool)

(assert (=> b!832427 (= e!464242 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493)))))

(assert (= (and d!106575 c!90494) b!832425))

(assert (= (and d!106575 (not c!90494)) b!832426))

(assert (= (and d!106575 (not res!566342)) b!832427))

(declare-fun m!776797 () Bool)

(assert (=> d!106575 m!776797))

(declare-fun m!776799 () Bool)

(assert (=> b!832425 m!776799))

(declare-fun m!776801 () Bool)

(assert (=> b!832425 m!776801))

(assert (=> b!832425 m!776801))

(declare-fun m!776803 () Bool)

(assert (=> b!832425 m!776803))

(assert (=> b!832427 m!776801))

(assert (=> b!832427 m!776801))

(assert (=> b!832427 m!776803))

(assert (=> b!831882 d!106575))

(declare-fun d!106577 () Bool)

(declare-fun e!464244 () Bool)

(assert (=> d!106577 e!464244))

(declare-fun res!566343 () Bool)

(assert (=> d!106577 (=> (not res!566343) (not e!464244))))

(declare-fun lt!377863 () ListLongMap!8979)

(assert (=> d!106577 (= res!566343 (contains!4211 lt!377863 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377862 () List!15949)

(assert (=> d!106577 (= lt!377863 (ListLongMap!8980 lt!377862))))

(declare-fun lt!377860 () Unit!28493)

(declare-fun lt!377861 () Unit!28493)

(assert (=> d!106577 (= lt!377860 lt!377861)))

(assert (=> d!106577 (= (getValueByKey!416 lt!377862 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106577 (= lt!377861 (lemmaContainsTupThenGetReturnValue!230 lt!377862 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106577 (= lt!377862 (insertStrictlySorted!269 (toList!4505 call!36362) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106577 (= (+!1983 call!36362 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377863)))

(declare-fun b!832428 () Bool)

(declare-fun res!566344 () Bool)

(assert (=> b!832428 (=> (not res!566344) (not e!464244))))

(assert (=> b!832428 (= res!566344 (= (getValueByKey!416 (toList!4505 lt!377863) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832429 () Bool)

(assert (=> b!832429 (= e!464244 (contains!4212 (toList!4505 lt!377863) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106577 res!566343) b!832428))

(assert (= (and b!832428 res!566344) b!832429))

(declare-fun m!776805 () Bool)

(assert (=> d!106577 m!776805))

(declare-fun m!776807 () Bool)

(assert (=> d!106577 m!776807))

(declare-fun m!776809 () Bool)

(assert (=> d!106577 m!776809))

(declare-fun m!776811 () Bool)

(assert (=> d!106577 m!776811))

(declare-fun m!776813 () Bool)

(assert (=> b!832428 m!776813))

(declare-fun m!776815 () Bool)

(assert (=> b!832429 m!776815))

(assert (=> b!831882 d!106577))

(declare-fun mapIsEmpty!24484 () Bool)

(declare-fun mapRes!24484 () Bool)

(assert (=> mapIsEmpty!24484 mapRes!24484))

(declare-fun condMapEmpty!24484 () Bool)

(declare-fun mapDefault!24484 () ValueCell!7191)

(assert (=> mapNonEmpty!24483 (= condMapEmpty!24484 (= mapRest!24483 ((as const (Array (_ BitVec 32) ValueCell!7191)) mapDefault!24484)))))

(declare-fun e!464245 () Bool)

(assert (=> mapNonEmpty!24483 (= tp!47310 (and e!464245 mapRes!24484))))

(declare-fun b!832430 () Bool)

(declare-fun e!464246 () Bool)

(assert (=> b!832430 (= e!464246 tp_is_empty!15213)))

(declare-fun mapNonEmpty!24484 () Bool)

(declare-fun tp!47311 () Bool)

(assert (=> mapNonEmpty!24484 (= mapRes!24484 (and tp!47311 e!464246))))

(declare-fun mapRest!24484 () (Array (_ BitVec 32) ValueCell!7191))

(declare-fun mapValue!24484 () ValueCell!7191)

(declare-fun mapKey!24484 () (_ BitVec 32))

(assert (=> mapNonEmpty!24484 (= mapRest!24483 (store mapRest!24484 mapKey!24484 mapValue!24484))))

(declare-fun b!832431 () Bool)

(assert (=> b!832431 (= e!464245 tp_is_empty!15213)))

(assert (= (and mapNonEmpty!24483 condMapEmpty!24484) mapIsEmpty!24484))

(assert (= (and mapNonEmpty!24483 (not condMapEmpty!24484)) mapNonEmpty!24484))

(assert (= (and mapNonEmpty!24484 ((_ is ValueCellFull!7191) mapValue!24484)) b!832430))

(assert (= (and mapNonEmpty!24483 ((_ is ValueCellFull!7191) mapDefault!24484)) b!832431))

(declare-fun m!776817 () Bool)

(assert (=> mapNonEmpty!24484 m!776817))

(declare-fun b_lambda!11435 () Bool)

(assert (= b_lambda!11429 (or (and start!71582 b_free!13503) b_lambda!11435)))

(declare-fun b_lambda!11437 () Bool)

(assert (= b_lambda!11431 (or (and start!71582 b_free!13503) b_lambda!11437)))

(declare-fun b_lambda!11439 () Bool)

(assert (= b_lambda!11433 (or (and start!71582 b_free!13503) b_lambda!11439)))

(declare-fun b_lambda!11441 () Bool)

(assert (= b_lambda!11427 (or (and start!71582 b_free!13503) b_lambda!11441)))

(check-sat (not b!832357) (not b!832165) (not b!832390) (not b!832270) (not d!106361) (not b!832423) (not b!832067) (not b!832305) (not d!106393) (not b!832128) (not b!832176) (not b!832189) (not d!106441) (not d!106509) (not b_lambda!11435) (not b!832401) (not b!832186) (not b!832076) (not b!832075) (not b!832174) (not b!832208) (not d!106571) (not b!832121) (not b!832080) (not b!832341) (not b_lambda!11441) (not b!832264) (not d!106511) (not d!106411) (not d!106333) (not b!832096) (not d!106445) (not d!106535) (not b!832372) (not b!832388) (not d!106541) (not d!106429) (not b_lambda!11421) (not b!832259) (not b!832093) (not b!832063) (not d!106419) (not bm!36408) (not b!832334) (not bm!36414) (not b!832082) (not b!832106) (not d!106385) (not d!106415) (not b!832157) (not b!832320) (not b!832363) (not b!832203) (not b!832221) (not b!832065) (not d!106475) (not d!106461) (not b!832339) (not b!832192) (not d!106519) (not d!106391) (not b!832191) (not d!106565) (not b!832379) (not b!832220) (not b!832230) (not b!832398) (not b!832107) (not d!106497) (not b!832211) (not b!832386) (not b!832428) (not d!106551) (not b!832105) (not b!832309) (not d!106343) (not b!832232) (not b!832207) (not d!106433) (not d!106363) (not d!106413) (not d!106559) (not b!832408) (not d!106491) (not d!106349) (not d!106463) (not d!106479) (not d!106417) tp_is_empty!15213 (not d!106549) (not d!106471) (not b!832183) (not b!832376) (not b!832237) (not d!106455) (not d!106399) (not b!832218) (not b!832173) (not d!106547) (not d!106545) (not d!106401) (not b!832422) (not b!832281) (not b!832061) (not b!832095) (not d!106405) (not b!832153) (not b!832420) (not b!832241) (not b!832346) (not b_lambda!11439) (not b!832295) (not d!106451) (not b!832030) (not d!106487) (not b!832244) (not b!832226) (not d!106431) (not d!106577) (not b!832344) (not b!832056) (not d!106345) (not b!832127) (not b!832245) (not b!832161) (not b!832087) (not b!832066) (not b!832164) (not d!106379) (not b!832287) (not d!106447) (not b!832251) (not b!832202) (not b!832417) (not b!832354) (not d!106555) (not b!832215) (not b_lambda!11437) (not b!832286) (not b!832293) (not b!832338) (not d!106421) (not b!832098) (not d!106437) (not b!832391) (not b!832307) (not b!832193) (not bm!36412) (not b!832163) (not b!832103) (not b!832190) (not b_lambda!11425) (not b!832159) (not b_lambda!11417) (not d!106495) (not d!106409) (not d!106507) (not b!832427) (not b!832204) (not d!106443) (not b!832213) (not b!832246) (not b!832331) (not b!832261) (not b!832278) (not b!832298) (not d!106369) (not b!832272) (not bm!36394) (not b!832328) (not b!832258) (not b!832253) (not b!832110) (not d!106357) (not b!832387) (not b!832249) (not d!106459) (not b!832234) (not b!832342) b_and!22583 (not d!106469) (not b!832296) (not b!832411) (not b!832201) (not b!832108) (not d!106539) (not b!832102) (not b!832166) (not d!106465) (not b!832081) (not b!832365) (not d!106371) (not d!106525) (not d!106515) (not b!832239) (not d!106351) (not b!832377) (not bm!36406) (not b!832091) (not b!832368) (not d!106373) (not d!106501) (not b!832393) (not b!832352) (not b!832301) (not b!832396) (not d!106389) (not d!106397) (not d!106407) (not b!832179) (not b!832290) (not d!106359) (not b!832223) (not b!832414) (not d!106367) (not d!106423) (not d!106521) (not b_lambda!11419) (not d!106485) (not b!832150) (not d!106375) (not b!832314) (not bm!36417) (not b_lambda!11415) (not d!106529) (not b!832349) (not b!832168) (not d!106477) (not b!832100) (not d!106427) (not b!832317) (not b!832073) (not b!832085) (not b!832078) (not b!832195) (not b!832351) (not b!832315) (not b_next!13503) (not b!832312) (not d!106561) (not d!106517) (not b!832332) (not d!106383) (not d!106481) (not bm!36410) (not bm!36423) (not d!106337) (not b!832429) (not b!832088) (not b!832425) (not b!832090) (not b!832062) (not b_lambda!11423) (not b!832324) (not mapNonEmpty!24484) (not b!832038) (not b!832404) (not bm!36403) (not d!106339) (not d!106493) (not d!106425) (not b!832032) (not b!832268) (not b!832384) (not bm!36426) (not d!106575) (not b!832336) (not d!106503) (not b!832389) (not b!832340) (not d!106499) (not d!106543) (not d!106377) (not b!832236) (not b!832399) (not d!106353) (not bm!36395) (not b!832256) (not b!832335) (not b!832374) (not d!106355) (not d!106557) (not b!832361) (not b!832104) (not d!106573) (not d!106567) (not d!106457) (not d!106387) (not bm!36420) (not d!106505) (not d!106527) (not b!832243) (not b!832279) (not d!106513) (not b!832171) (not b!832288) (not d!106537) (not b!832284))
(check-sat b_and!22583 (not b_next!13503))
(get-model)

(declare-fun d!106579 () Bool)

(assert (=> d!106579 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106537 d!106579))

(declare-fun b!832434 () Bool)

(declare-fun e!464248 () Option!422)

(assert (=> b!832434 (= e!464248 (getValueByKey!416 (t!22317 (toList!4505 lt!377554)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832433 () Bool)

(declare-fun e!464247 () Option!422)

(assert (=> b!832433 (= e!464247 e!464248)))

(declare-fun c!90496 () Bool)

(assert (=> b!832433 (= c!90496 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377554))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832435 () Bool)

(assert (=> b!832435 (= e!464248 None!420)))

(declare-fun b!832432 () Bool)

(assert (=> b!832432 (= e!464247 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377554)))))))

(declare-fun d!106581 () Bool)

(declare-fun c!90495 () Bool)

(assert (=> d!106581 (= c!90495 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (= (_1!5089 (h!17075 (toList!4505 lt!377554))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106581 (= (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000) e!464247)))

(assert (= (and d!106581 c!90495) b!832432))

(assert (= (and d!106581 (not c!90495)) b!832433))

(assert (= (and b!832433 c!90496) b!832434))

(assert (= (and b!832433 (not c!90496)) b!832435))

(declare-fun m!776819 () Bool)

(assert (=> b!832434 m!776819))

(assert (=> d!106537 d!106581))

(declare-fun d!106583 () Bool)

(assert (=> d!106583 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377866 () Unit!28493)

(declare-fun choose!1427 (List!15949 (_ BitVec 64)) Unit!28493)

(assert (=> d!106583 (= lt!377866 (choose!1427 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464251 () Bool)

(assert (=> d!106583 e!464251))

(declare-fun res!566347 () Bool)

(assert (=> d!106583 (=> (not res!566347) (not e!464251))))

(assert (=> d!106583 (= res!566347 (isStrictlySorted!442 (toList!4505 lt!377580)))))

(assert (=> d!106583 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!377866)))

(declare-fun b!832438 () Bool)

(assert (=> b!832438 (= e!464251 (containsKey!402 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106583 res!566347) b!832438))

(assert (=> d!106583 m!775791))

(assert (=> d!106583 m!776395))

(assert (=> d!106583 m!776395))

(assert (=> d!106583 m!776397))

(assert (=> d!106583 m!775791))

(declare-fun m!776821 () Bool)

(assert (=> d!106583 m!776821))

(declare-fun m!776823 () Bool)

(assert (=> d!106583 m!776823))

(assert (=> b!832438 m!775791))

(assert (=> b!832438 m!776391))

(assert (=> b!832232 d!106583))

(declare-fun d!106585 () Bool)

(declare-fun isEmpty!659 (Option!422) Bool)

(assert (=> d!106585 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23285 () Bool)

(assert (= bs!23285 d!106585))

(assert (=> bs!23285 m!776395))

(declare-fun m!776825 () Bool)

(assert (=> bs!23285 m!776825))

(assert (=> b!832232 d!106585))

(declare-fun b!832441 () Bool)

(declare-fun e!464253 () Option!422)

(assert (=> b!832441 (= e!464253 (getValueByKey!416 (t!22317 (toList!4505 lt!377580)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832440 () Bool)

(declare-fun e!464252 () Option!422)

(assert (=> b!832440 (= e!464252 e!464253)))

(declare-fun c!90498 () Bool)

(assert (=> b!832440 (= c!90498 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377580))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832442 () Bool)

(assert (=> b!832442 (= e!464253 None!420)))

(declare-fun b!832439 () Bool)

(assert (=> b!832439 (= e!464252 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377580)))))))

(declare-fun d!106587 () Bool)

(declare-fun c!90497 () Bool)

(assert (=> d!106587 (= c!90497 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (= (_1!5089 (h!17075 (toList!4505 lt!377580))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106587 (= (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464252)))

(assert (= (and d!106587 c!90497) b!832439))

(assert (= (and d!106587 (not c!90497)) b!832440))

(assert (= (and b!832440 c!90498) b!832441))

(assert (= (and b!832440 (not c!90498)) b!832442))

(assert (=> b!832441 m!775791))

(declare-fun m!776827 () Bool)

(assert (=> b!832441 m!776827))

(assert (=> b!832232 d!106587))

(declare-fun d!106589 () Bool)

(assert (=> d!106589 (= (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493))))))

(declare-fun bs!23286 () Bool)

(assert (= bs!23286 d!106589))

(assert (=> bs!23286 m!776801))

(declare-fun m!776829 () Bool)

(assert (=> bs!23286 m!776829))

(assert (=> b!832427 d!106589))

(declare-fun e!464255 () Option!422)

(declare-fun b!832445 () Bool)

(assert (=> b!832445 (= e!464255 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))) lt!377493))))

(declare-fun b!832444 () Bool)

(declare-fun e!464254 () Option!422)

(assert (=> b!832444 (= e!464254 e!464255)))

(declare-fun c!90500 () Bool)

(assert (=> b!832444 (= c!90500 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))))) lt!377493))))))

(declare-fun b!832446 () Bool)

(assert (=> b!832446 (= e!464255 None!420)))

(declare-fun b!832443 () Bool)

(assert (=> b!832443 (= e!464254 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))))))))

(declare-fun c!90499 () Bool)

(declare-fun d!106591 () Bool)

(assert (=> d!106591 (= c!90499 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))))) lt!377493)))))

(assert (=> d!106591 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493) e!464254)))

(assert (= (and d!106591 c!90499) b!832443))

(assert (= (and d!106591 (not c!90499)) b!832444))

(assert (= (and b!832444 c!90500) b!832445))

(assert (= (and b!832444 (not c!90500)) b!832446))

(declare-fun m!776831 () Bool)

(assert (=> b!832445 m!776831))

(assert (=> b!832427 d!106591))

(declare-fun d!106593 () Bool)

(declare-fun e!464256 () Bool)

(assert (=> d!106593 e!464256))

(declare-fun res!566348 () Bool)

(assert (=> d!106593 (=> res!566348 e!464256)))

(declare-fun lt!377870 () Bool)

(assert (=> d!106593 (= res!566348 (not lt!377870))))

(declare-fun lt!377869 () Bool)

(assert (=> d!106593 (= lt!377870 lt!377869)))

(declare-fun lt!377868 () Unit!28493)

(declare-fun e!464257 () Unit!28493)

(assert (=> d!106593 (= lt!377868 e!464257)))

(declare-fun c!90501 () Bool)

(assert (=> d!106593 (= c!90501 lt!377869)))

(assert (=> d!106593 (= lt!377869 (containsKey!402 (toList!4505 lt!377808) (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(assert (=> d!106593 (= (contains!4211 lt!377808 (_1!5089 (tuple2!10157 lt!377568 minValue!754))) lt!377870)))

(declare-fun b!832447 () Bool)

(declare-fun lt!377867 () Unit!28493)

(assert (=> b!832447 (= e!464257 lt!377867)))

(assert (=> b!832447 (= lt!377867 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377808) (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(assert (=> b!832447 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377808) (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun b!832448 () Bool)

(declare-fun Unit!28523 () Unit!28493)

(assert (=> b!832448 (= e!464257 Unit!28523)))

(declare-fun b!832449 () Bool)

(assert (=> b!832449 (= e!464256 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377808) (_1!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(assert (= (and d!106593 c!90501) b!832447))

(assert (= (and d!106593 (not c!90501)) b!832448))

(assert (= (and d!106593 (not res!566348)) b!832449))

(declare-fun m!776833 () Bool)

(assert (=> d!106593 m!776833))

(declare-fun m!776835 () Bool)

(assert (=> b!832447 m!776835))

(assert (=> b!832447 m!776627))

(assert (=> b!832447 m!776627))

(declare-fun m!776837 () Bool)

(assert (=> b!832447 m!776837))

(assert (=> b!832449 m!776627))

(assert (=> b!832449 m!776627))

(assert (=> b!832449 m!776837))

(assert (=> d!106515 d!106593))

(declare-fun e!464259 () Option!422)

(declare-fun b!832452 () Bool)

(assert (=> b!832452 (= e!464259 (getValueByKey!416 (t!22317 lt!377807) (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun b!832451 () Bool)

(declare-fun e!464258 () Option!422)

(assert (=> b!832451 (= e!464258 e!464259)))

(declare-fun c!90503 () Bool)

(assert (=> b!832451 (= c!90503 (and ((_ is Cons!15945) lt!377807) (not (= (_1!5089 (h!17075 lt!377807)) (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))))

(declare-fun b!832453 () Bool)

(assert (=> b!832453 (= e!464259 None!420)))

(declare-fun b!832450 () Bool)

(assert (=> b!832450 (= e!464258 (Some!421 (_2!5089 (h!17075 lt!377807))))))

(declare-fun d!106595 () Bool)

(declare-fun c!90502 () Bool)

(assert (=> d!106595 (= c!90502 (and ((_ is Cons!15945) lt!377807) (= (_1!5089 (h!17075 lt!377807)) (_1!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(assert (=> d!106595 (= (getValueByKey!416 lt!377807 (_1!5089 (tuple2!10157 lt!377568 minValue!754))) e!464258)))

(assert (= (and d!106595 c!90502) b!832450))

(assert (= (and d!106595 (not c!90502)) b!832451))

(assert (= (and b!832451 c!90503) b!832452))

(assert (= (and b!832451 (not c!90503)) b!832453))

(declare-fun m!776839 () Bool)

(assert (=> b!832452 m!776839))

(assert (=> d!106515 d!106595))

(declare-fun d!106597 () Bool)

(assert (=> d!106597 (= (getValueByKey!416 lt!377807 (_1!5089 (tuple2!10157 lt!377568 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun lt!377871 () Unit!28493)

(assert (=> d!106597 (= lt!377871 (choose!1423 lt!377807 (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun e!464260 () Bool)

(assert (=> d!106597 e!464260))

(declare-fun res!566349 () Bool)

(assert (=> d!106597 (=> (not res!566349) (not e!464260))))

(assert (=> d!106597 (= res!566349 (isStrictlySorted!442 lt!377807))))

(assert (=> d!106597 (= (lemmaContainsTupThenGetReturnValue!230 lt!377807 (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754))) lt!377871)))

(declare-fun b!832454 () Bool)

(declare-fun res!566350 () Bool)

(assert (=> b!832454 (=> (not res!566350) (not e!464260))))

(assert (=> b!832454 (= res!566350 (containsKey!402 lt!377807 (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun b!832455 () Bool)

(assert (=> b!832455 (= e!464260 (contains!4212 lt!377807 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(assert (= (and d!106597 res!566349) b!832454))

(assert (= (and b!832454 res!566350) b!832455))

(assert (=> d!106597 m!776621))

(declare-fun m!776841 () Bool)

(assert (=> d!106597 m!776841))

(declare-fun m!776843 () Bool)

(assert (=> d!106597 m!776843))

(declare-fun m!776845 () Bool)

(assert (=> b!832454 m!776845))

(declare-fun m!776847 () Bool)

(assert (=> b!832455 m!776847))

(assert (=> d!106515 d!106597))

(declare-fun b!832456 () Bool)

(declare-fun e!464262 () List!15949)

(declare-fun call!36432 () List!15949)

(assert (=> b!832456 (= e!464262 call!36432)))

(declare-fun b!832457 () Bool)

(declare-fun e!464261 () List!15949)

(assert (=> b!832457 (= e!464261 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377567)) (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun bm!36428 () Bool)

(declare-fun call!36431 () List!15949)

(assert (=> bm!36428 (= call!36432 call!36431)))

(declare-fun b!832458 () Bool)

(assert (=> b!832458 (= e!464262 call!36432)))

(declare-fun b!832459 () Bool)

(declare-fun c!90504 () Bool)

(declare-fun c!90506 () Bool)

(assert (=> b!832459 (= e!464261 (ite c!90506 (t!22317 (toList!4505 lt!377567)) (ite c!90504 (Cons!15945 (h!17075 (toList!4505 lt!377567)) (t!22317 (toList!4505 lt!377567))) Nil!15946)))))

(declare-fun call!36433 () List!15949)

(declare-fun bm!36429 () Bool)

(declare-fun c!90507 () Bool)

(assert (=> bm!36429 (= call!36433 ($colon$colon!537 e!464261 (ite c!90507 (h!17075 (toList!4505 lt!377567)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754))))))))

(declare-fun c!90505 () Bool)

(assert (=> bm!36429 (= c!90505 c!90507)))

(declare-fun b!832460 () Bool)

(declare-fun res!566352 () Bool)

(declare-fun e!464264 () Bool)

(assert (=> b!832460 (=> (not res!566352) (not e!464264))))

(declare-fun lt!377872 () List!15949)

(assert (=> b!832460 (= res!566352 (containsKey!402 lt!377872 (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun b!832461 () Bool)

(declare-fun e!464265 () List!15949)

(assert (=> b!832461 (= e!464265 call!36433)))

(declare-fun b!832462 () Bool)

(assert (=> b!832462 (= c!90504 (and ((_ is Cons!15945) (toList!4505 lt!377567)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377567))) (_1!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(declare-fun e!464263 () List!15949)

(assert (=> b!832462 (= e!464263 e!464262)))

(declare-fun d!106599 () Bool)

(assert (=> d!106599 e!464264))

(declare-fun res!566351 () Bool)

(assert (=> d!106599 (=> (not res!566351) (not e!464264))))

(assert (=> d!106599 (= res!566351 (isStrictlySorted!442 lt!377872))))

(assert (=> d!106599 (= lt!377872 e!464265)))

(assert (=> d!106599 (= c!90507 (and ((_ is Cons!15945) (toList!4505 lt!377567)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377567))) (_1!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(assert (=> d!106599 (isStrictlySorted!442 (toList!4505 lt!377567))))

(assert (=> d!106599 (= (insertStrictlySorted!269 (toList!4505 lt!377567) (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754))) lt!377872)))

(declare-fun b!832463 () Bool)

(assert (=> b!832463 (= e!464263 call!36431)))

(declare-fun bm!36430 () Bool)

(assert (=> bm!36430 (= call!36431 call!36433)))

(declare-fun b!832464 () Bool)

(assert (=> b!832464 (= e!464264 (contains!4212 lt!377872 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377568 minValue!754)) (_2!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(declare-fun b!832465 () Bool)

(assert (=> b!832465 (= e!464265 e!464263)))

(assert (=> b!832465 (= c!90506 (and ((_ is Cons!15945) (toList!4505 lt!377567)) (= (_1!5089 (h!17075 (toList!4505 lt!377567))) (_1!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(assert (= (and d!106599 c!90507) b!832461))

(assert (= (and d!106599 (not c!90507)) b!832465))

(assert (= (and b!832465 c!90506) b!832463))

(assert (= (and b!832465 (not c!90506)) b!832462))

(assert (= (and b!832462 c!90504) b!832456))

(assert (= (and b!832462 (not c!90504)) b!832458))

(assert (= (or b!832456 b!832458) bm!36428))

(assert (= (or b!832463 bm!36428) bm!36430))

(assert (= (or b!832461 bm!36430) bm!36429))

(assert (= (and bm!36429 c!90505) b!832457))

(assert (= (and bm!36429 (not c!90505)) b!832459))

(assert (= (and d!106599 res!566351) b!832460))

(assert (= (and b!832460 res!566352) b!832464))

(declare-fun m!776849 () Bool)

(assert (=> d!106599 m!776849))

(declare-fun m!776851 () Bool)

(assert (=> d!106599 m!776851))

(declare-fun m!776853 () Bool)

(assert (=> b!832460 m!776853))

(declare-fun m!776855 () Bool)

(assert (=> b!832464 m!776855))

(declare-fun m!776857 () Bool)

(assert (=> bm!36429 m!776857))

(declare-fun m!776859 () Bool)

(assert (=> b!832457 m!776859))

(assert (=> d!106515 d!106599))

(declare-fun d!106601 () Bool)

(declare-fun res!566357 () Bool)

(declare-fun e!464270 () Bool)

(assert (=> d!106601 (=> res!566357 e!464270)))

(assert (=> d!106601 (= res!566357 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))))) lt!377592)))))

(assert (=> d!106601 (= (containsKey!402 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592) e!464270)))

(declare-fun b!832470 () Bool)

(declare-fun e!464271 () Bool)

(assert (=> b!832470 (= e!464270 e!464271)))

(declare-fun res!566358 () Bool)

(assert (=> b!832470 (=> (not res!566358) (not e!464271))))

(assert (=> b!832470 (= res!566358 (and (or (not ((_ is Cons!15945) (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))))) (bvsle (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))))) lt!377592)) ((_ is Cons!15945) (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))))) lt!377592)))))

(declare-fun b!832471 () Bool)

(assert (=> b!832471 (= e!464271 (containsKey!402 (t!22317 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))) lt!377592))))

(assert (= (and d!106601 (not res!566357)) b!832470))

(assert (= (and b!832470 res!566358) b!832471))

(declare-fun m!776861 () Bool)

(assert (=> b!832471 m!776861))

(assert (=> d!106407 d!106601))

(declare-fun d!106603 () Bool)

(declare-fun res!566359 () Bool)

(declare-fun e!464272 () Bool)

(assert (=> d!106603 (=> res!566359 e!464272)))

(assert (=> d!106603 (= res!566359 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (= (_1!5089 (h!17075 (toList!4505 lt!377580))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106603 (= (containsKey!402 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000) e!464272)))

(declare-fun b!832472 () Bool)

(declare-fun e!464273 () Bool)

(assert (=> b!832472 (= e!464272 e!464273)))

(declare-fun res!566360 () Bool)

(assert (=> b!832472 (=> (not res!566360) (not e!464273))))

(assert (=> b!832472 (= res!566360 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377580))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377580))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377580)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377580))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832473 () Bool)

(assert (=> b!832473 (= e!464273 (containsKey!402 (t!22317 (toList!4505 lt!377580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106603 (not res!566359)) b!832472))

(assert (= (and b!832472 res!566360) b!832473))

(declare-fun m!776863 () Bool)

(assert (=> b!832473 m!776863))

(assert (=> d!106373 d!106603))

(assert (=> d!106441 d!106439))

(declare-fun d!106605 () Bool)

(assert (=> d!106605 (= (getValueByKey!416 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106605 true))

(declare-fun _$22!576 () Unit!28493)

(assert (=> d!106605 (= (choose!1423 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!576)))

(declare-fun bs!23287 () Bool)

(assert (= bs!23287 d!106605))

(assert (=> bs!23287 m!775965))

(assert (=> d!106441 d!106605))

(declare-fun d!106607 () Bool)

(declare-fun res!566365 () Bool)

(declare-fun e!464278 () Bool)

(assert (=> d!106607 (=> res!566365 e!464278)))

(assert (=> d!106607 (= res!566365 (or ((_ is Nil!15946) lt!377604) ((_ is Nil!15946) (t!22317 lt!377604))))))

(assert (=> d!106607 (= (isStrictlySorted!442 lt!377604) e!464278)))

(declare-fun b!832478 () Bool)

(declare-fun e!464279 () Bool)

(assert (=> b!832478 (= e!464278 e!464279)))

(declare-fun res!566366 () Bool)

(assert (=> b!832478 (=> (not res!566366) (not e!464279))))

(assert (=> b!832478 (= res!566366 (bvslt (_1!5089 (h!17075 lt!377604)) (_1!5089 (h!17075 (t!22317 lt!377604)))))))

(declare-fun b!832479 () Bool)

(assert (=> b!832479 (= e!464279 (isStrictlySorted!442 (t!22317 lt!377604)))))

(assert (= (and d!106607 (not res!566365)) b!832478))

(assert (= (and b!832478 res!566366) b!832479))

(declare-fun m!776865 () Bool)

(assert (=> b!832479 m!776865))

(assert (=> d!106441 d!106607))

(declare-fun d!106609 () Bool)

(declare-fun res!566367 () Bool)

(declare-fun e!464280 () Bool)

(assert (=> d!106609 (=> res!566367 e!464280)))

(assert (=> d!106609 (= res!566367 (and ((_ is Cons!15945) lt!377612) (= (_1!5089 (h!17075 lt!377612)) (_1!5089 lt!377428))))))

(assert (=> d!106609 (= (containsKey!402 lt!377612 (_1!5089 lt!377428)) e!464280)))

(declare-fun b!832480 () Bool)

(declare-fun e!464281 () Bool)

(assert (=> b!832480 (= e!464280 e!464281)))

(declare-fun res!566368 () Bool)

(assert (=> b!832480 (=> (not res!566368) (not e!464281))))

(assert (=> b!832480 (= res!566368 (and (or (not ((_ is Cons!15945) lt!377612)) (bvsle (_1!5089 (h!17075 lt!377612)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377612) (bvslt (_1!5089 (h!17075 lt!377612)) (_1!5089 lt!377428))))))

(declare-fun b!832481 () Bool)

(assert (=> b!832481 (= e!464281 (containsKey!402 (t!22317 lt!377612) (_1!5089 lt!377428)))))

(assert (= (and d!106609 (not res!566367)) b!832480))

(assert (= (and b!832480 res!566368) b!832481))

(declare-fun m!776867 () Bool)

(assert (=> b!832481 m!776867))

(assert (=> b!832258 d!106609))

(declare-fun d!106611 () Bool)

(assert (=> d!106611 (= ($colon$colon!537 e!464097 (ite c!90421 (h!17075 (toList!4505 lt!377423)) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15945 (ite c!90421 (h!17075 (toList!4505 lt!377423)) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464097))))

(assert (=> bm!36406 d!106611))

(declare-fun d!106613 () Bool)

(declare-fun res!566369 () Bool)

(declare-fun e!464282 () Bool)

(assert (=> d!106613 (=> res!566369 e!464282)))

(assert (=> d!106613 (= res!566369 (and ((_ is Cons!15945) lt!377815) (= (_1!5089 (h!17075 lt!377815)) (_1!5089 lt!377425))))))

(assert (=> d!106613 (= (containsKey!402 lt!377815 (_1!5089 lt!377425)) e!464282)))

(declare-fun b!832482 () Bool)

(declare-fun e!464283 () Bool)

(assert (=> b!832482 (= e!464282 e!464283)))

(declare-fun res!566370 () Bool)

(assert (=> b!832482 (=> (not res!566370) (not e!464283))))

(assert (=> b!832482 (= res!566370 (and (or (not ((_ is Cons!15945) lt!377815)) (bvsle (_1!5089 (h!17075 lt!377815)) (_1!5089 lt!377425))) ((_ is Cons!15945) lt!377815) (bvslt (_1!5089 (h!17075 lt!377815)) (_1!5089 lt!377425))))))

(declare-fun b!832483 () Bool)

(assert (=> b!832483 (= e!464283 (containsKey!402 (t!22317 lt!377815) (_1!5089 lt!377425)))))

(assert (= (and d!106613 (not res!566369)) b!832482))

(assert (= (and b!832482 res!566370) b!832483))

(declare-fun m!776869 () Bool)

(assert (=> b!832483 m!776869))

(assert (=> b!832357 d!106613))

(declare-fun b!832486 () Bool)

(declare-fun e!464285 () Option!422)

(assert (=> b!832486 (= e!464285 (getValueByKey!416 (t!22317 (t!22317 lt!377616)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832485 () Bool)

(declare-fun e!464284 () Option!422)

(assert (=> b!832485 (= e!464284 e!464285)))

(declare-fun c!90509 () Bool)

(assert (=> b!832485 (= c!90509 (and ((_ is Cons!15945) (t!22317 lt!377616)) (not (= (_1!5089 (h!17075 (t!22317 lt!377616))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832487 () Bool)

(assert (=> b!832487 (= e!464285 None!420)))

(declare-fun b!832484 () Bool)

(assert (=> b!832484 (= e!464284 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377616)))))))

(declare-fun d!106615 () Bool)

(declare-fun c!90508 () Bool)

(assert (=> d!106615 (= c!90508 (and ((_ is Cons!15945) (t!22317 lt!377616)) (= (_1!5089 (h!17075 (t!22317 lt!377616))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106615 (= (getValueByKey!416 (t!22317 lt!377616) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464284)))

(assert (= (and d!106615 c!90508) b!832484))

(assert (= (and d!106615 (not c!90508)) b!832485))

(assert (= (and b!832485 c!90509) b!832486))

(assert (= (and b!832485 (not c!90509)) b!832487))

(declare-fun m!776871 () Bool)

(assert (=> b!832486 m!776871))

(assert (=> b!832171 d!106615))

(declare-fun d!106617 () Bool)

(assert (=> d!106617 (arrayContainsKey!0 _keys!976 lt!377707 #b00000000000000000000000000000000)))

(declare-fun lt!377873 () Unit!28493)

(assert (=> d!106617 (= lt!377873 (choose!13 _keys!976 lt!377707 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!106617 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!106617 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377707 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377873)))

(declare-fun bs!23288 () Bool)

(assert (= bs!23288 d!106617))

(assert (=> bs!23288 m!776261))

(declare-fun m!776873 () Bool)

(assert (=> bs!23288 m!776873))

(assert (=> b!832189 d!106617))

(declare-fun d!106619 () Bool)

(declare-fun res!566371 () Bool)

(declare-fun e!464286 () Bool)

(assert (=> d!106619 (=> res!566371 e!464286)))

(assert (=> d!106619 (= res!566371 (= (select (arr!22334 _keys!976) #b00000000000000000000000000000000) lt!377707))))

(assert (=> d!106619 (= (arrayContainsKey!0 _keys!976 lt!377707 #b00000000000000000000000000000000) e!464286)))

(declare-fun b!832488 () Bool)

(declare-fun e!464287 () Bool)

(assert (=> b!832488 (= e!464286 e!464287)))

(declare-fun res!566372 () Bool)

(assert (=> b!832488 (=> (not res!566372) (not e!464287))))

(assert (=> b!832488 (= res!566372 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!832489 () Bool)

(assert (=> b!832489 (= e!464287 (arrayContainsKey!0 _keys!976 lt!377707 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!106619 (not res!566371)) b!832488))

(assert (= (and b!832488 res!566372) b!832489))

(assert (=> d!106619 m!775791))

(declare-fun m!776875 () Bool)

(assert (=> b!832489 m!776875))

(assert (=> b!832189 d!106619))

(declare-fun b!832490 () Bool)

(declare-fun e!464289 () SeekEntryResult!8745)

(declare-fun lt!377875 () SeekEntryResult!8745)

(assert (=> b!832490 (= e!464289 (Found!8745 (index!37353 lt!377875)))))

(declare-fun b!832491 () Bool)

(declare-fun c!90510 () Bool)

(declare-fun lt!377876 () (_ BitVec 64))

(assert (=> b!832491 (= c!90510 (= lt!377876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464288 () SeekEntryResult!8745)

(assert (=> b!832491 (= e!464289 e!464288)))

(declare-fun b!832492 () Bool)

(declare-fun e!464290 () SeekEntryResult!8745)

(assert (=> b!832492 (= e!464290 Undefined!8745)))

(declare-fun b!832493 () Bool)

(assert (=> b!832493 (= e!464288 (MissingZero!8745 (index!37353 lt!377875)))))

(declare-fun b!832494 () Bool)

(assert (=> b!832494 (= e!464290 e!464289)))

(assert (=> b!832494 (= lt!377876 (select (arr!22334 _keys!976) (index!37353 lt!377875)))))

(declare-fun c!90511 () Bool)

(assert (=> b!832494 (= c!90511 (= lt!377876 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!106621 () Bool)

(declare-fun lt!377874 () SeekEntryResult!8745)

(assert (=> d!106621 (and (or ((_ is Undefined!8745) lt!377874) (not ((_ is Found!8745) lt!377874)) (and (bvsge (index!37352 lt!377874) #b00000000000000000000000000000000) (bvslt (index!37352 lt!377874) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377874) ((_ is Found!8745) lt!377874) (not ((_ is MissingZero!8745) lt!377874)) (and (bvsge (index!37351 lt!377874) #b00000000000000000000000000000000) (bvslt (index!37351 lt!377874) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377874) ((_ is Found!8745) lt!377874) ((_ is MissingZero!8745) lt!377874) (not ((_ is MissingVacant!8745) lt!377874)) (and (bvsge (index!37354 lt!377874) #b00000000000000000000000000000000) (bvslt (index!37354 lt!377874) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377874) (ite ((_ is Found!8745) lt!377874) (= (select (arr!22334 _keys!976) (index!37352 lt!377874)) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!8745) lt!377874) (= (select (arr!22334 _keys!976) (index!37351 lt!377874)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8745) lt!377874) (= (select (arr!22334 _keys!976) (index!37354 lt!377874)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106621 (= lt!377874 e!464290)))

(declare-fun c!90512 () Bool)

(assert (=> d!106621 (= c!90512 (and ((_ is Intermediate!8745) lt!377875) (undefined!9557 lt!377875)))))

(assert (=> d!106621 (= lt!377875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!1312) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(assert (=> d!106621 (validMask!0 mask!1312)))

(assert (=> d!106621 (= (seekEntryOrOpen!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) lt!377874)))

(declare-fun b!832495 () Bool)

(assert (=> b!832495 (= e!464288 (seekKeyOrZeroReturnVacant!0 (x!70140 lt!377875) (index!37353 lt!377875) (index!37353 lt!377875) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(assert (= (and d!106621 c!90512) b!832492))

(assert (= (and d!106621 (not c!90512)) b!832494))

(assert (= (and b!832494 c!90511) b!832490))

(assert (= (and b!832494 (not c!90511)) b!832491))

(assert (= (and b!832491 c!90510) b!832493))

(assert (= (and b!832491 (not c!90510)) b!832495))

(declare-fun m!776877 () Bool)

(assert (=> b!832494 m!776877))

(declare-fun m!776879 () Bool)

(assert (=> d!106621 m!776879))

(declare-fun m!776881 () Bool)

(assert (=> d!106621 m!776881))

(assert (=> d!106621 m!775715))

(assert (=> d!106621 m!776103))

(declare-fun m!776883 () Bool)

(assert (=> d!106621 m!776883))

(assert (=> d!106621 m!776883))

(assert (=> d!106621 m!776103))

(declare-fun m!776885 () Bool)

(assert (=> d!106621 m!776885))

(declare-fun m!776887 () Bool)

(assert (=> d!106621 m!776887))

(assert (=> b!832495 m!776103))

(declare-fun m!776889 () Bool)

(assert (=> b!832495 m!776889))

(assert (=> b!832189 d!106621))

(assert (=> d!106431 d!106405))

(declare-fun d!106623 () Bool)

(declare-fun e!464291 () Bool)

(assert (=> d!106623 e!464291))

(declare-fun res!566373 () Bool)

(assert (=> d!106623 (=> res!566373 e!464291)))

(declare-fun lt!377880 () Bool)

(assert (=> d!106623 (= res!566373 (not lt!377880))))

(declare-fun lt!377879 () Bool)

(assert (=> d!106623 (= lt!377880 lt!377879)))

(declare-fun lt!377878 () Unit!28493)

(declare-fun e!464292 () Unit!28493)

(assert (=> d!106623 (= lt!377878 e!464292)))

(declare-fun c!90513 () Bool)

(assert (=> d!106623 (= c!90513 lt!377879)))

(assert (=> d!106623 (= lt!377879 (containsKey!402 (toList!4505 lt!377587) lt!377600))))

(assert (=> d!106623 (= (contains!4211 lt!377587 lt!377600) lt!377880)))

(declare-fun b!832496 () Bool)

(declare-fun lt!377877 () Unit!28493)

(assert (=> b!832496 (= e!464292 lt!377877)))

(assert (=> b!832496 (= lt!377877 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377587) lt!377600))))

(assert (=> b!832496 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377587) lt!377600))))

(declare-fun b!832497 () Bool)

(declare-fun Unit!28524 () Unit!28493)

(assert (=> b!832497 (= e!464292 Unit!28524)))

(declare-fun b!832498 () Bool)

(assert (=> b!832498 (= e!464291 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377587) lt!377600)))))

(assert (= (and d!106623 c!90513) b!832496))

(assert (= (and d!106623 (not c!90513)) b!832497))

(assert (= (and d!106623 (not res!566373)) b!832498))

(declare-fun m!776891 () Bool)

(assert (=> d!106623 m!776891))

(declare-fun m!776893 () Bool)

(assert (=> b!832496 m!776893))

(assert (=> b!832496 m!776305))

(assert (=> b!832496 m!776305))

(declare-fun m!776895 () Bool)

(assert (=> b!832496 m!776895))

(assert (=> b!832498 m!776305))

(assert (=> b!832498 m!776305))

(assert (=> b!832498 m!776895))

(assert (=> d!106431 d!106623))

(declare-fun d!106625 () Bool)

(assert (=> d!106625 (= (apply!373 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)) lt!377600) (apply!373 lt!377587 lt!377600))))

(assert (=> d!106625 true))

(declare-fun _$34!1150 () Unit!28493)

(assert (=> d!106625 (= (choose!1424 lt!377587 lt!377586 zeroValueAfter!34 lt!377600) _$34!1150)))

(declare-fun bs!23289 () Bool)

(assert (= bs!23289 d!106625))

(assert (=> bs!23289 m!775931))

(assert (=> bs!23289 m!775931))

(assert (=> bs!23289 m!775945))

(assert (=> bs!23289 m!775937))

(assert (=> d!106431 d!106625))

(assert (=> d!106431 d!106415))

(assert (=> d!106431 d!106417))

(declare-fun d!106627 () Bool)

(declare-fun res!566374 () Bool)

(declare-fun e!464293 () Bool)

(assert (=> d!106627 (=> res!566374 e!464293)))

(assert (=> d!106627 (= res!566374 (and ((_ is Cons!15945) (toList!4505 lt!377579)) (= (_1!5089 (h!17075 (toList!4505 lt!377579))) (_1!5089 lt!377425))))))

(assert (=> d!106627 (= (containsKey!402 (toList!4505 lt!377579) (_1!5089 lt!377425)) e!464293)))

(declare-fun b!832500 () Bool)

(declare-fun e!464294 () Bool)

(assert (=> b!832500 (= e!464293 e!464294)))

(declare-fun res!566375 () Bool)

(assert (=> b!832500 (=> (not res!566375) (not e!464294))))

(assert (=> b!832500 (= res!566375 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377579))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377579))) (_1!5089 lt!377425))) ((_ is Cons!15945) (toList!4505 lt!377579)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377579))) (_1!5089 lt!377425))))))

(declare-fun b!832501 () Bool)

(assert (=> b!832501 (= e!464294 (containsKey!402 (t!22317 (toList!4505 lt!377579)) (_1!5089 lt!377425)))))

(assert (= (and d!106627 (not res!566374)) b!832500))

(assert (= (and b!832500 res!566375) b!832501))

(declare-fun m!776897 () Bool)

(assert (=> b!832501 m!776897))

(assert (=> d!106481 d!106627))

(declare-fun d!106629 () Bool)

(declare-fun res!566376 () Bool)

(declare-fun e!464295 () Bool)

(assert (=> d!106629 (=> res!566376 e!464295)))

(assert (=> d!106629 (= res!566376 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))))) lt!377486)))))

(assert (=> d!106629 (= (containsKey!402 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486) e!464295)))

(declare-fun b!832502 () Bool)

(declare-fun e!464296 () Bool)

(assert (=> b!832502 (= e!464295 e!464296)))

(declare-fun res!566377 () Bool)

(assert (=> b!832502 (=> (not res!566377) (not e!464296))))

(assert (=> b!832502 (= res!566377 (and (or (not ((_ is Cons!15945) (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))))) (bvsle (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))))) lt!377486)) ((_ is Cons!15945) (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))))) lt!377486)))))

(declare-fun b!832503 () Bool)

(assert (=> b!832503 (= e!464296 (containsKey!402 (t!22317 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))) lt!377486))))

(assert (= (and d!106629 (not res!566376)) b!832502))

(assert (= (and b!832502 res!566377) b!832503))

(declare-fun m!776899 () Bool)

(assert (=> b!832503 m!776899))

(assert (=> d!106543 d!106629))

(declare-fun d!106631 () Bool)

(assert (=> d!106631 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377881 () Unit!28493)

(assert (=> d!106631 (= lt!377881 (choose!1427 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464297 () Bool)

(assert (=> d!106631 e!464297))

(declare-fun res!566378 () Bool)

(assert (=> d!106631 (=> (not res!566378) (not e!464297))))

(assert (=> d!106631 (= res!566378 (isStrictlySorted!442 (toList!4505 lt!377617)))))

(assert (=> d!106631 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377881)))

(declare-fun b!832504 () Bool)

(assert (=> b!832504 (= e!464297 (containsKey!402 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106631 res!566378) b!832504))

(assert (=> d!106631 m!776007))

(assert (=> d!106631 m!776007))

(assert (=> d!106631 m!776227))

(declare-fun m!776901 () Bool)

(assert (=> d!106631 m!776901))

(declare-fun m!776903 () Bool)

(assert (=> d!106631 m!776903))

(assert (=> b!832504 m!776223))

(assert (=> b!832166 d!106631))

(declare-fun d!106633 () Bool)

(assert (=> d!106633 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23290 () Bool)

(assert (= bs!23290 d!106633))

(assert (=> bs!23290 m!776007))

(declare-fun m!776905 () Bool)

(assert (=> bs!23290 m!776905))

(assert (=> b!832166 d!106633))

(assert (=> b!832166 d!106531))

(declare-fun b!832507 () Bool)

(declare-fun e!464299 () Option!422)

(assert (=> b!832507 (= e!464299 (getValueByKey!416 (t!22317 (toList!4505 lt!377808)) (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))

(declare-fun b!832506 () Bool)

(declare-fun e!464298 () Option!422)

(assert (=> b!832506 (= e!464298 e!464299)))

(declare-fun c!90515 () Bool)

(assert (=> b!832506 (= c!90515 (and ((_ is Cons!15945) (toList!4505 lt!377808)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377808))) (_1!5089 (tuple2!10157 lt!377568 minValue!754))))))))

(declare-fun b!832508 () Bool)

(assert (=> b!832508 (= e!464299 None!420)))

(declare-fun b!832505 () Bool)

(assert (=> b!832505 (= e!464298 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377808)))))))

(declare-fun c!90514 () Bool)

(declare-fun d!106635 () Bool)

(assert (=> d!106635 (= c!90514 (and ((_ is Cons!15945) (toList!4505 lt!377808)) (= (_1!5089 (h!17075 (toList!4505 lt!377808))) (_1!5089 (tuple2!10157 lt!377568 minValue!754)))))))

(assert (=> d!106635 (= (getValueByKey!416 (toList!4505 lt!377808) (_1!5089 (tuple2!10157 lt!377568 minValue!754))) e!464298)))

(assert (= (and d!106635 c!90514) b!832505))

(assert (= (and d!106635 (not c!90514)) b!832506))

(assert (= (and b!832506 c!90515) b!832507))

(assert (= (and b!832506 (not c!90515)) b!832508))

(declare-fun m!776907 () Bool)

(assert (=> b!832507 m!776907))

(assert (=> b!832341 d!106635))

(declare-fun d!106637 () Bool)

(declare-fun e!464300 () Bool)

(assert (=> d!106637 e!464300))

(declare-fun res!566379 () Bool)

(assert (=> d!106637 (=> res!566379 e!464300)))

(declare-fun lt!377885 () Bool)

(assert (=> d!106637 (= res!566379 (not lt!377885))))

(declare-fun lt!377884 () Bool)

(assert (=> d!106637 (= lt!377885 lt!377884)))

(declare-fun lt!377883 () Unit!28493)

(declare-fun e!464301 () Unit!28493)

(assert (=> d!106637 (= lt!377883 e!464301)))

(declare-fun c!90516 () Bool)

(assert (=> d!106637 (= c!90516 lt!377884)))

(assert (=> d!106637 (= lt!377884 (containsKey!402 (toList!4505 lt!377649) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106637 (= (contains!4211 lt!377649 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377885)))

(declare-fun b!832509 () Bool)

(declare-fun lt!377882 () Unit!28493)

(assert (=> b!832509 (= e!464301 lt!377882)))

(assert (=> b!832509 (= lt!377882 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377649) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832509 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377649) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832510 () Bool)

(declare-fun Unit!28525 () Unit!28493)

(assert (=> b!832510 (= e!464301 Unit!28525)))

(declare-fun b!832511 () Bool)

(assert (=> b!832511 (= e!464300 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377649) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106637 c!90516) b!832509))

(assert (= (and d!106637 (not c!90516)) b!832510))

(assert (= (and d!106637 (not res!566379)) b!832511))

(declare-fun m!776909 () Bool)

(assert (=> d!106637 m!776909))

(declare-fun m!776911 () Bool)

(assert (=> b!832509 m!776911))

(assert (=> b!832509 m!776075))

(assert (=> b!832509 m!776075))

(declare-fun m!776913 () Bool)

(assert (=> b!832509 m!776913))

(assert (=> b!832511 m!776075))

(assert (=> b!832511 m!776075))

(assert (=> b!832511 m!776913))

(assert (=> d!106355 d!106637))

(declare-fun b!832514 () Bool)

(declare-fun e!464303 () Option!422)

(assert (=> b!832514 (= e!464303 (getValueByKey!416 (t!22317 lt!377648) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832513 () Bool)

(declare-fun e!464302 () Option!422)

(assert (=> b!832513 (= e!464302 e!464303)))

(declare-fun c!90518 () Bool)

(assert (=> b!832513 (= c!90518 (and ((_ is Cons!15945) lt!377648) (not (= (_1!5089 (h!17075 lt!377648)) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832515 () Bool)

(assert (=> b!832515 (= e!464303 None!420)))

(declare-fun b!832512 () Bool)

(assert (=> b!832512 (= e!464302 (Some!421 (_2!5089 (h!17075 lt!377648))))))

(declare-fun c!90517 () Bool)

(declare-fun d!106639 () Bool)

(assert (=> d!106639 (= c!90517 (and ((_ is Cons!15945) lt!377648) (= (_1!5089 (h!17075 lt!377648)) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106639 (= (getValueByKey!416 lt!377648 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464302)))

(assert (= (and d!106639 c!90517) b!832512))

(assert (= (and d!106639 (not c!90517)) b!832513))

(assert (= (and b!832513 c!90518) b!832514))

(assert (= (and b!832513 (not c!90518)) b!832515))

(declare-fun m!776915 () Bool)

(assert (=> b!832514 m!776915))

(assert (=> d!106355 d!106639))

(declare-fun d!106641 () Bool)

(assert (=> d!106641 (= (getValueByKey!416 lt!377648 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377886 () Unit!28493)

(assert (=> d!106641 (= lt!377886 (choose!1423 lt!377648 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464304 () Bool)

(assert (=> d!106641 e!464304))

(declare-fun res!566380 () Bool)

(assert (=> d!106641 (=> (not res!566380) (not e!464304))))

(assert (=> d!106641 (= res!566380 (isStrictlySorted!442 lt!377648))))

(assert (=> d!106641 (= (lemmaContainsTupThenGetReturnValue!230 lt!377648 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377886)))

(declare-fun b!832516 () Bool)

(declare-fun res!566381 () Bool)

(assert (=> b!832516 (=> (not res!566381) (not e!464304))))

(assert (=> b!832516 (= res!566381 (containsKey!402 lt!377648 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832517 () Bool)

(assert (=> b!832517 (= e!464304 (contains!4212 lt!377648 (tuple2!10157 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106641 res!566380) b!832516))

(assert (= (and b!832516 res!566381) b!832517))

(assert (=> d!106641 m!776069))

(declare-fun m!776917 () Bool)

(assert (=> d!106641 m!776917))

(declare-fun m!776919 () Bool)

(assert (=> d!106641 m!776919))

(declare-fun m!776921 () Bool)

(assert (=> b!832516 m!776921))

(declare-fun m!776923 () Bool)

(assert (=> b!832517 m!776923))

(assert (=> d!106355 d!106641))

(declare-fun b!832518 () Bool)

(declare-fun e!464306 () List!15949)

(declare-fun call!36435 () List!15949)

(assert (=> b!832518 (= e!464306 call!36435)))

(declare-fun e!464305 () List!15949)

(declare-fun b!832519 () Bool)

(assert (=> b!832519 (= e!464305 (insertStrictlySorted!269 (t!22317 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun bm!36431 () Bool)

(declare-fun call!36434 () List!15949)

(assert (=> bm!36431 (= call!36435 call!36434)))

(declare-fun b!832520 () Bool)

(assert (=> b!832520 (= e!464306 call!36435)))

(declare-fun c!90519 () Bool)

(declare-fun c!90521 () Bool)

(declare-fun b!832521 () Bool)

(assert (=> b!832521 (= e!464305 (ite c!90521 (t!22317 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)))) (ite c!90519 (Cons!15945 (h!17075 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)))) (t!22317 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392))))) Nil!15946)))))

(declare-fun bm!36432 () Bool)

(declare-fun c!90522 () Bool)

(declare-fun call!36436 () List!15949)

(assert (=> bm!36432 (= call!36436 ($colon$colon!537 e!464305 (ite c!90522 (h!17075 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)))) (tuple2!10157 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90520 () Bool)

(assert (=> bm!36432 (= c!90520 c!90522)))

(declare-fun b!832522 () Bool)

(declare-fun res!566383 () Bool)

(declare-fun e!464308 () Bool)

(assert (=> b!832522 (=> (not res!566383) (not e!464308))))

(declare-fun lt!377887 () List!15949)

(assert (=> b!832522 (= res!566383 (containsKey!402 lt!377887 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832523 () Bool)

(declare-fun e!464309 () List!15949)

(assert (=> b!832523 (= e!464309 call!36436)))

(declare-fun b!832524 () Bool)

(assert (=> b!832524 (= c!90519 (and ((_ is Cons!15945) (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)))) (bvsgt (_1!5089 (h!17075 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392))))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!464307 () List!15949)

(assert (=> b!832524 (= e!464307 e!464306)))

(declare-fun d!106643 () Bool)

(assert (=> d!106643 e!464308))

(declare-fun res!566382 () Bool)

(assert (=> d!106643 (=> (not res!566382) (not e!464308))))

(assert (=> d!106643 (= res!566382 (isStrictlySorted!442 lt!377887))))

(assert (=> d!106643 (= lt!377887 e!464309)))

(assert (=> d!106643 (= c!90522 (and ((_ is Cons!15945) (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)))) (bvslt (_1!5089 (h!17075 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392))))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106643 (isStrictlySorted!442 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392))))))

(assert (=> d!106643 (= (insertStrictlySorted!269 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377887)))

(declare-fun b!832525 () Bool)

(assert (=> b!832525 (= e!464307 call!36434)))

(declare-fun bm!36433 () Bool)

(assert (=> bm!36433 (= call!36434 call!36436)))

(declare-fun b!832526 () Bool)

(assert (=> b!832526 (= e!464308 (contains!4212 lt!377887 (tuple2!10157 (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832527 () Bool)

(assert (=> b!832527 (= e!464309 e!464307)))

(assert (=> b!832527 (= c!90521 (and ((_ is Cons!15945) (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392)))) (= (_1!5089 (h!17075 (toList!4505 (ite c!90365 call!36390 (ite c!90366 call!36388 call!36392))))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106643 c!90522) b!832523))

(assert (= (and d!106643 (not c!90522)) b!832527))

(assert (= (and b!832527 c!90521) b!832525))

(assert (= (and b!832527 (not c!90521)) b!832524))

(assert (= (and b!832524 c!90519) b!832518))

(assert (= (and b!832524 (not c!90519)) b!832520))

(assert (= (or b!832518 b!832520) bm!36431))

(assert (= (or b!832525 bm!36431) bm!36433))

(assert (= (or b!832523 bm!36433) bm!36432))

(assert (= (and bm!36432 c!90520) b!832519))

(assert (= (and bm!36432 (not c!90520)) b!832521))

(assert (= (and d!106643 res!566382) b!832522))

(assert (= (and b!832522 res!566383) b!832526))

(declare-fun m!776925 () Bool)

(assert (=> d!106643 m!776925))

(declare-fun m!776927 () Bool)

(assert (=> d!106643 m!776927))

(declare-fun m!776929 () Bool)

(assert (=> b!832522 m!776929))

(declare-fun m!776931 () Bool)

(assert (=> b!832526 m!776931))

(declare-fun m!776933 () Bool)

(assert (=> bm!36432 m!776933))

(declare-fun m!776935 () Bool)

(assert (=> b!832519 m!776935))

(assert (=> d!106355 d!106643))

(declare-fun d!106645 () Bool)

(declare-fun res!566384 () Bool)

(declare-fun e!464310 () Bool)

(assert (=> d!106645 (=> res!566384 e!464310)))

(assert (=> d!106645 (= res!566384 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (= (_1!5089 (h!17075 (toList!4505 lt!377487))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106645 (= (containsKey!402 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464310)))

(declare-fun b!832528 () Bool)

(declare-fun e!464311 () Bool)

(assert (=> b!832528 (= e!464310 e!464311)))

(declare-fun res!566385 () Bool)

(assert (=> b!832528 (=> (not res!566385) (not e!464311))))

(assert (=> b!832528 (= res!566385 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377487))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377487))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377487)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377487))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!832529 () Bool)

(assert (=> b!832529 (= e!464311 (containsKey!402 (t!22317 (toList!4505 lt!377487)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106645 (not res!566384)) b!832528))

(assert (= (and b!832528 res!566385) b!832529))

(assert (=> b!832529 m!775791))

(declare-fun m!776937 () Bool)

(assert (=> b!832529 m!776937))

(assert (=> d!106333 d!106645))

(declare-fun d!106647 () Bool)

(assert (=> d!106647 (= (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!832098 d!106647))

(declare-fun d!106649 () Bool)

(declare-fun e!464312 () Bool)

(assert (=> d!106649 e!464312))

(declare-fun res!566386 () Bool)

(assert (=> d!106649 (=> res!566386 e!464312)))

(declare-fun lt!377891 () Bool)

(assert (=> d!106649 (= res!566386 (not lt!377891))))

(declare-fun lt!377890 () Bool)

(assert (=> d!106649 (= lt!377891 lt!377890)))

(declare-fun lt!377889 () Unit!28493)

(declare-fun e!464313 () Unit!28493)

(assert (=> d!106649 (= lt!377889 e!464313)))

(declare-fun c!90523 () Bool)

(assert (=> d!106649 (= c!90523 lt!377890)))

(assert (=> d!106649 (= lt!377890 (containsKey!402 (toList!4505 lt!377790) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(assert (=> d!106649 (= (contains!4211 lt!377790 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) lt!377891)))

(declare-fun b!832530 () Bool)

(declare-fun lt!377888 () Unit!28493)

(assert (=> b!832530 (= e!464313 lt!377888)))

(assert (=> b!832530 (= lt!377888 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377790) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(assert (=> b!832530 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377790) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun b!832531 () Bool)

(declare-fun Unit!28526 () Unit!28493)

(assert (=> b!832531 (= e!464313 Unit!28526)))

(declare-fun b!832532 () Bool)

(assert (=> b!832532 (= e!464312 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377790) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(assert (= (and d!106649 c!90523) b!832530))

(assert (= (and d!106649 (not c!90523)) b!832531))

(assert (= (and d!106649 (not res!566386)) b!832532))

(declare-fun m!776939 () Bool)

(assert (=> d!106649 m!776939))

(declare-fun m!776941 () Bool)

(assert (=> b!832530 m!776941))

(assert (=> b!832530 m!776555))

(assert (=> b!832530 m!776555))

(declare-fun m!776943 () Bool)

(assert (=> b!832530 m!776943))

(assert (=> b!832532 m!776555))

(assert (=> b!832532 m!776555))

(assert (=> b!832532 m!776943))

(assert (=> d!106493 d!106649))

(declare-fun b!832535 () Bool)

(declare-fun e!464315 () Option!422)

(assert (=> b!832535 (= e!464315 (getValueByKey!416 (t!22317 lt!377789) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun b!832534 () Bool)

(declare-fun e!464314 () Option!422)

(assert (=> b!832534 (= e!464314 e!464315)))

(declare-fun c!90525 () Bool)

(assert (=> b!832534 (= c!90525 (and ((_ is Cons!15945) lt!377789) (not (= (_1!5089 (h!17075 lt!377789)) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))))

(declare-fun b!832536 () Bool)

(assert (=> b!832536 (= e!464315 None!420)))

(declare-fun b!832533 () Bool)

(assert (=> b!832533 (= e!464314 (Some!421 (_2!5089 (h!17075 lt!377789))))))

(declare-fun d!106651 () Bool)

(declare-fun c!90524 () Bool)

(assert (=> d!106651 (= c!90524 (and ((_ is Cons!15945) lt!377789) (= (_1!5089 (h!17075 lt!377789)) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(assert (=> d!106651 (= (getValueByKey!416 lt!377789 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) e!464314)))

(assert (= (and d!106651 c!90524) b!832533))

(assert (= (and d!106651 (not c!90524)) b!832534))

(assert (= (and b!832534 c!90525) b!832535))

(assert (= (and b!832534 (not c!90525)) b!832536))

(declare-fun m!776945 () Bool)

(assert (=> b!832535 m!776945))

(assert (=> d!106493 d!106651))

(declare-fun d!106653 () Bool)

(assert (=> d!106653 (= (getValueByKey!416 lt!377789 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun lt!377892 () Unit!28493)

(assert (=> d!106653 (= lt!377892 (choose!1423 lt!377789 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun e!464316 () Bool)

(assert (=> d!106653 e!464316))

(declare-fun res!566387 () Bool)

(assert (=> d!106653 (=> (not res!566387) (not e!464316))))

(assert (=> d!106653 (= res!566387 (isStrictlySorted!442 lt!377789))))

(assert (=> d!106653 (= (lemmaContainsTupThenGetReturnValue!230 lt!377789 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) lt!377892)))

(declare-fun b!832537 () Bool)

(declare-fun res!566388 () Bool)

(assert (=> b!832537 (=> (not res!566388) (not e!464316))))

(assert (=> b!832537 (= res!566388 (containsKey!402 lt!377789 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun b!832538 () Bool)

(assert (=> b!832538 (= e!464316 (contains!4212 lt!377789 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(assert (= (and d!106653 res!566387) b!832537))

(assert (= (and b!832537 res!566388) b!832538))

(assert (=> d!106653 m!776549))

(declare-fun m!776947 () Bool)

(assert (=> d!106653 m!776947))

(declare-fun m!776949 () Bool)

(assert (=> d!106653 m!776949))

(declare-fun m!776951 () Bool)

(assert (=> b!832537 m!776951))

(declare-fun m!776953 () Bool)

(assert (=> b!832538 m!776953))

(assert (=> d!106493 d!106653))

(declare-fun b!832539 () Bool)

(declare-fun e!464318 () List!15949)

(declare-fun call!36438 () List!15949)

(assert (=> b!832539 (= e!464318 call!36438)))

(declare-fun e!464317 () List!15949)

(declare-fun b!832540 () Bool)

(assert (=> b!832540 (= e!464317 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377561)) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun bm!36434 () Bool)

(declare-fun call!36437 () List!15949)

(assert (=> bm!36434 (= call!36438 call!36437)))

(declare-fun b!832541 () Bool)

(assert (=> b!832541 (= e!464318 call!36438)))

(declare-fun b!832542 () Bool)

(declare-fun c!90526 () Bool)

(declare-fun c!90528 () Bool)

(assert (=> b!832542 (= e!464317 (ite c!90528 (t!22317 (toList!4505 lt!377561)) (ite c!90526 (Cons!15945 (h!17075 (toList!4505 lt!377561)) (t!22317 (toList!4505 lt!377561))) Nil!15946)))))

(declare-fun call!36439 () List!15949)

(declare-fun bm!36435 () Bool)

(declare-fun c!90529 () Bool)

(assert (=> bm!36435 (= call!36439 ($colon$colon!537 e!464317 (ite c!90529 (h!17075 (toList!4505 lt!377561)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))))

(declare-fun c!90527 () Bool)

(assert (=> bm!36435 (= c!90527 c!90529)))

(declare-fun b!832543 () Bool)

(declare-fun res!566390 () Bool)

(declare-fun e!464320 () Bool)

(assert (=> b!832543 (=> (not res!566390) (not e!464320))))

(declare-fun lt!377893 () List!15949)

(assert (=> b!832543 (= res!566390 (containsKey!402 lt!377893 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun b!832544 () Bool)

(declare-fun e!464321 () List!15949)

(assert (=> b!832544 (= e!464321 call!36439)))

(declare-fun b!832545 () Bool)

(assert (=> b!832545 (= c!90526 (and ((_ is Cons!15945) (toList!4505 lt!377561)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377561))) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(declare-fun e!464319 () List!15949)

(assert (=> b!832545 (= e!464319 e!464318)))

(declare-fun d!106655 () Bool)

(assert (=> d!106655 e!464320))

(declare-fun res!566389 () Bool)

(assert (=> d!106655 (=> (not res!566389) (not e!464320))))

(assert (=> d!106655 (= res!566389 (isStrictlySorted!442 lt!377893))))

(assert (=> d!106655 (= lt!377893 e!464321)))

(assert (=> d!106655 (= c!90529 (and ((_ is Cons!15945) (toList!4505 lt!377561)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377561))) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(assert (=> d!106655 (isStrictlySorted!442 (toList!4505 lt!377561))))

(assert (=> d!106655 (= (insertStrictlySorted!269 (toList!4505 lt!377561) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) lt!377893)))

(declare-fun b!832546 () Bool)

(assert (=> b!832546 (= e!464319 call!36437)))

(declare-fun bm!36436 () Bool)

(assert (=> bm!36436 (= call!36437 call!36439)))

(declare-fun b!832547 () Bool)

(assert (=> b!832547 (= e!464320 (contains!4212 lt!377893 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(declare-fun b!832548 () Bool)

(assert (=> b!832548 (= e!464321 e!464319)))

(assert (=> b!832548 (= c!90528 (and ((_ is Cons!15945) (toList!4505 lt!377561)) (= (_1!5089 (h!17075 (toList!4505 lt!377561))) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(assert (= (and d!106655 c!90529) b!832544))

(assert (= (and d!106655 (not c!90529)) b!832548))

(assert (= (and b!832548 c!90528) b!832546))

(assert (= (and b!832548 (not c!90528)) b!832545))

(assert (= (and b!832545 c!90526) b!832539))

(assert (= (and b!832545 (not c!90526)) b!832541))

(assert (= (or b!832539 b!832541) bm!36434))

(assert (= (or b!832546 bm!36434) bm!36436))

(assert (= (or b!832544 bm!36436) bm!36435))

(assert (= (and bm!36435 c!90527) b!832540))

(assert (= (and bm!36435 (not c!90527)) b!832542))

(assert (= (and d!106655 res!566389) b!832543))

(assert (= (and b!832543 res!566390) b!832547))

(declare-fun m!776955 () Bool)

(assert (=> d!106655 m!776955))

(declare-fun m!776957 () Bool)

(assert (=> d!106655 m!776957))

(declare-fun m!776959 () Bool)

(assert (=> b!832543 m!776959))

(declare-fun m!776961 () Bool)

(assert (=> b!832547 m!776961))

(declare-fun m!776963 () Bool)

(assert (=> bm!36435 m!776963))

(declare-fun m!776965 () Bool)

(assert (=> b!832540 m!776965))

(assert (=> d!106493 d!106655))

(declare-fun d!106657 () Bool)

(assert (=> d!106657 (= (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754))) lt!377563)) (v!10101 (getValueByKey!416 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754))) lt!377563)))))

(assert (=> d!106519 d!106657))

(declare-fun b!832551 () Bool)

(declare-fun e!464323 () Option!422)

(assert (=> b!832551 (= e!464323 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)))) lt!377563))))

(declare-fun b!832550 () Bool)

(declare-fun e!464322 () Option!422)

(assert (=> b!832550 (= e!464322 e!464323)))

(declare-fun c!90531 () Bool)

(assert (=> b!832550 (= c!90531 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754))))) lt!377563))))))

(declare-fun b!832552 () Bool)

(assert (=> b!832552 (= e!464323 None!420)))

(declare-fun b!832549 () Bool)

(assert (=> b!832549 (= e!464322 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)))))))))

(declare-fun d!106659 () Bool)

(declare-fun c!90530 () Bool)

(assert (=> d!106659 (= c!90530 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754))))) lt!377563)))))

(assert (=> d!106659 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754))) lt!377563) e!464322)))

(assert (= (and d!106659 c!90530) b!832549))

(assert (= (and d!106659 (not c!90530)) b!832550))

(assert (= (and b!832550 c!90531) b!832551))

(assert (= (and b!832550 (not c!90531)) b!832552))

(declare-fun m!776967 () Bool)

(assert (=> b!832551 m!776967))

(assert (=> d!106519 d!106659))

(declare-fun d!106661 () Bool)

(assert (=> d!106661 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!416 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106549 d!106661))

(assert (=> d!106549 d!106587))

(declare-fun d!106663 () Bool)

(assert (=> d!106663 (= (apply!373 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)) lt!377589) (apply!373 lt!377598 lt!377589))))

(assert (=> d!106663 true))

(declare-fun _$34!1151 () Unit!28493)

(assert (=> d!106663 (= (choose!1424 lt!377598 lt!377585 minValue!754 lt!377589) _$34!1151)))

(declare-fun bs!23291 () Bool)

(assert (= bs!23291 d!106663))

(assert (=> bs!23291 m!775947))

(assert (=> bs!23291 m!775947))

(assert (=> bs!23291 m!775949))

(assert (=> bs!23291 m!775941))

(assert (=> d!106427 d!106663))

(assert (=> d!106427 d!106413))

(assert (=> d!106427 d!106429))

(declare-fun d!106665 () Bool)

(declare-fun e!464324 () Bool)

(assert (=> d!106665 e!464324))

(declare-fun res!566391 () Bool)

(assert (=> d!106665 (=> res!566391 e!464324)))

(declare-fun lt!377897 () Bool)

(assert (=> d!106665 (= res!566391 (not lt!377897))))

(declare-fun lt!377896 () Bool)

(assert (=> d!106665 (= lt!377897 lt!377896)))

(declare-fun lt!377895 () Unit!28493)

(declare-fun e!464325 () Unit!28493)

(assert (=> d!106665 (= lt!377895 e!464325)))

(declare-fun c!90532 () Bool)

(assert (=> d!106665 (= c!90532 lt!377896)))

(assert (=> d!106665 (= lt!377896 (containsKey!402 (toList!4505 lt!377598) lt!377589))))

(assert (=> d!106665 (= (contains!4211 lt!377598 lt!377589) lt!377897)))

(declare-fun b!832553 () Bool)

(declare-fun lt!377894 () Unit!28493)

(assert (=> b!832553 (= e!464325 lt!377894)))

(assert (=> b!832553 (= lt!377894 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377598) lt!377589))))

(assert (=> b!832553 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377598) lt!377589))))

(declare-fun b!832554 () Bool)

(declare-fun Unit!28527 () Unit!28493)

(assert (=> b!832554 (= e!464325 Unit!28527)))

(declare-fun b!832555 () Bool)

(assert (=> b!832555 (= e!464324 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377598) lt!377589)))))

(assert (= (and d!106665 c!90532) b!832553))

(assert (= (and d!106665 (not c!90532)) b!832554))

(assert (= (and d!106665 (not res!566391)) b!832555))

(declare-fun m!776969 () Bool)

(assert (=> d!106665 m!776969))

(declare-fun m!776971 () Bool)

(assert (=> b!832553 m!776971))

(assert (=> b!832553 m!776341))

(assert (=> b!832553 m!776341))

(declare-fun m!776973 () Bool)

(assert (=> b!832553 m!776973))

(assert (=> b!832555 m!776341))

(assert (=> b!832555 m!776341))

(assert (=> b!832555 m!776973))

(assert (=> d!106427 d!106665))

(assert (=> d!106427 d!106423))

(declare-fun d!106667 () Bool)

(declare-fun lt!377898 () Bool)

(assert (=> d!106667 (= lt!377898 (select (content!388 lt!377508) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464327 () Bool)

(assert (=> d!106667 (= lt!377898 e!464327)))

(declare-fun res!566393 () Bool)

(assert (=> d!106667 (=> (not res!566393) (not e!464327))))

(assert (=> d!106667 (= res!566393 ((_ is Cons!15945) lt!377508))))

(assert (=> d!106667 (= (contains!4212 lt!377508 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!377898)))

(declare-fun b!832556 () Bool)

(declare-fun e!464326 () Bool)

(assert (=> b!832556 (= e!464327 e!464326)))

(declare-fun res!566392 () Bool)

(assert (=> b!832556 (=> res!566392 e!464326)))

(assert (=> b!832556 (= res!566392 (= (h!17075 lt!377508) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832557 () Bool)

(assert (=> b!832557 (= e!464326 (contains!4212 (t!22317 lt!377508) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106667 res!566393) b!832556))

(assert (= (and b!832556 (not res!566392)) b!832557))

(declare-fun m!776975 () Bool)

(assert (=> d!106667 m!776975))

(declare-fun m!776977 () Bool)

(assert (=> d!106667 m!776977))

(declare-fun m!776979 () Bool)

(assert (=> b!832557 m!776979))

(assert (=> b!832399 d!106667))

(declare-fun b!832560 () Bool)

(declare-fun e!464329 () Option!422)

(assert (=> b!832560 (= e!464329 (getValueByKey!416 (t!22317 (toList!4505 lt!377649)) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832559 () Bool)

(declare-fun e!464328 () Option!422)

(assert (=> b!832559 (= e!464328 e!464329)))

(declare-fun c!90534 () Bool)

(assert (=> b!832559 (= c!90534 (and ((_ is Cons!15945) (toList!4505 lt!377649)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377649))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832561 () Bool)

(assert (=> b!832561 (= e!464329 None!420)))

(declare-fun b!832558 () Bool)

(assert (=> b!832558 (= e!464328 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377649)))))))

(declare-fun d!106669 () Bool)

(declare-fun c!90533 () Bool)

(assert (=> d!106669 (= c!90533 (and ((_ is Cons!15945) (toList!4505 lt!377649)) (= (_1!5089 (h!17075 (toList!4505 lt!377649))) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106669 (= (getValueByKey!416 (toList!4505 lt!377649) (_1!5089 (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464328)))

(assert (= (and d!106669 c!90533) b!832558))

(assert (= (and d!106669 (not c!90533)) b!832559))

(assert (= (and b!832559 c!90534) b!832560))

(assert (= (and b!832559 (not c!90534)) b!832561))

(declare-fun m!776981 () Bool)

(assert (=> b!832560 m!776981))

(assert (=> b!832066 d!106669))

(declare-fun d!106671 () Bool)

(declare-fun lt!377899 () Bool)

(assert (=> d!106671 (= lt!377899 (select (content!388 (toList!4505 lt!377678)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!464331 () Bool)

(assert (=> d!106671 (= lt!377899 e!464331)))

(declare-fun res!566395 () Bool)

(assert (=> d!106671 (=> (not res!566395) (not e!464331))))

(assert (=> d!106671 (= res!566395 ((_ is Cons!15945) (toList!4505 lt!377678)))))

(assert (=> d!106671 (= (contains!4212 (toList!4505 lt!377678) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377899)))

(declare-fun b!832562 () Bool)

(declare-fun e!464330 () Bool)

(assert (=> b!832562 (= e!464331 e!464330)))

(declare-fun res!566394 () Bool)

(assert (=> b!832562 (=> res!566394 e!464330)))

(assert (=> b!832562 (= res!566394 (= (h!17075 (toList!4505 lt!377678)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!832563 () Bool)

(assert (=> b!832563 (= e!464330 (contains!4212 (t!22317 (toList!4505 lt!377678)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106671 res!566395) b!832562))

(assert (= (and b!832562 (not res!566394)) b!832563))

(declare-fun m!776983 () Bool)

(assert (=> d!106671 m!776983))

(declare-fun m!776985 () Bool)

(assert (=> d!106671 m!776985))

(declare-fun m!776987 () Bool)

(assert (=> b!832563 m!776987))

(assert (=> b!832107 d!106671))

(declare-fun e!464333 () Option!422)

(declare-fun b!832566 () Bool)

(assert (=> b!832566 (= e!464333 (getValueByKey!416 (t!22317 (toList!4505 lt!377790)) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))

(declare-fun b!832565 () Bool)

(declare-fun e!464332 () Option!422)

(assert (=> b!832565 (= e!464332 e!464333)))

(declare-fun c!90536 () Bool)

(assert (=> b!832565 (= c!90536 (and ((_ is Cons!15945) (toList!4505 lt!377790)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377790))) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))))))))

(declare-fun b!832567 () Bool)

(assert (=> b!832567 (= e!464333 None!420)))

(declare-fun b!832564 () Bool)

(assert (=> b!832564 (= e!464332 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377790)))))))

(declare-fun d!106673 () Bool)

(declare-fun c!90535 () Bool)

(assert (=> d!106673 (= c!90535 (and ((_ is Cons!15945) (toList!4505 lt!377790)) (= (_1!5089 (h!17075 (toList!4505 lt!377790))) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))

(assert (=> d!106673 (= (getValueByKey!416 (toList!4505 lt!377790) (_1!5089 (tuple2!10157 lt!377560 zeroValueBefore!34))) e!464332)))

(assert (= (and d!106673 c!90535) b!832564))

(assert (= (and d!106673 (not c!90535)) b!832565))

(assert (= (and b!832565 c!90536) b!832566))

(assert (= (and b!832565 (not c!90536)) b!832567))

(declare-fun m!776989 () Bool)

(assert (=> b!832566 m!776989))

(assert (=> b!832331 d!106673))

(declare-fun d!106675 () Bool)

(declare-fun res!566396 () Bool)

(declare-fun e!464334 () Bool)

(assert (=> d!106675 (=> res!566396 e!464334)))

(assert (=> d!106675 (= res!566396 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (= (_1!5089 (h!17075 (toList!4505 lt!377580))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106675 (= (containsKey!402 (toList!4505 lt!377580) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464334)))

(declare-fun b!832568 () Bool)

(declare-fun e!464335 () Bool)

(assert (=> b!832568 (= e!464334 e!464335)))

(declare-fun res!566397 () Bool)

(assert (=> b!832568 (=> (not res!566397) (not e!464335))))

(assert (=> b!832568 (= res!566397 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377580))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377580))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377580)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377580))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!832569 () Bool)

(assert (=> b!832569 (= e!464335 (containsKey!402 (t!22317 (toList!4505 lt!377580)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106675 (not res!566396)) b!832568))

(assert (= (and b!832568 res!566397) b!832569))

(assert (=> b!832569 m!775791))

(declare-fun m!776991 () Bool)

(assert (=> b!832569 m!776991))

(assert (=> d!106445 d!106675))

(declare-fun d!106677 () Bool)

(assert (=> d!106677 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106565 d!106677))

(declare-fun b!832572 () Bool)

(declare-fun e!464337 () Option!422)

(assert (=> b!832572 (= e!464337 (getValueByKey!416 (t!22317 (toList!4505 lt!377487)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832571 () Bool)

(declare-fun e!464336 () Option!422)

(assert (=> b!832571 (= e!464336 e!464337)))

(declare-fun c!90538 () Bool)

(assert (=> b!832571 (= c!90538 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377487))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832573 () Bool)

(assert (=> b!832573 (= e!464337 None!420)))

(declare-fun b!832570 () Bool)

(assert (=> b!832570 (= e!464336 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377487)))))))

(declare-fun d!106679 () Bool)

(declare-fun c!90537 () Bool)

(assert (=> d!106679 (= c!90537 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (= (_1!5089 (h!17075 (toList!4505 lt!377487))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106679 (= (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464336)))

(assert (= (and d!106679 c!90537) b!832570))

(assert (= (and d!106679 (not c!90537)) b!832571))

(assert (= (and b!832571 c!90538) b!832572))

(assert (= (and b!832571 (not c!90538)) b!832573))

(assert (=> b!832572 m!775791))

(declare-fun m!776993 () Bool)

(assert (=> b!832572 m!776993))

(assert (=> d!106565 d!106679))

(declare-fun d!106681 () Bool)

(assert (=> d!106681 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377900 () Unit!28493)

(assert (=> d!106681 (= lt!377900 (choose!1427 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464338 () Bool)

(assert (=> d!106681 e!464338))

(declare-fun res!566398 () Bool)

(assert (=> d!106681 (=> (not res!566398) (not e!464338))))

(assert (=> d!106681 (= res!566398 (isStrictlySorted!442 (toList!4505 lt!377554)))))

(assert (=> d!106681 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377900)))

(declare-fun b!832574 () Bool)

(assert (=> b!832574 (= e!464338 (containsKey!402 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106681 res!566398) b!832574))

(assert (=> d!106681 m!776201))

(assert (=> d!106681 m!776201))

(assert (=> d!106681 m!776203))

(declare-fun m!776995 () Bool)

(assert (=> d!106681 m!776995))

(declare-fun m!776997 () Bool)

(assert (=> d!106681 m!776997))

(assert (=> b!832574 m!776197))

(assert (=> b!832159 d!106681))

(declare-fun d!106683 () Bool)

(assert (=> d!106683 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23292 () Bool)

(assert (= bs!23292 d!106683))

(assert (=> bs!23292 m!776201))

(declare-fun m!776999 () Bool)

(assert (=> bs!23292 m!776999))

(assert (=> b!832159 d!106683))

(declare-fun b!832577 () Bool)

(declare-fun e!464340 () Option!422)

(assert (=> b!832577 (= e!464340 (getValueByKey!416 (t!22317 (toList!4505 lt!377554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832576 () Bool)

(declare-fun e!464339 () Option!422)

(assert (=> b!832576 (= e!464339 e!464340)))

(declare-fun c!90540 () Bool)

(assert (=> b!832576 (= c!90540 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377554))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832578 () Bool)

(assert (=> b!832578 (= e!464340 None!420)))

(declare-fun b!832575 () Bool)

(assert (=> b!832575 (= e!464339 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377554)))))))

(declare-fun d!106685 () Bool)

(declare-fun c!90539 () Bool)

(assert (=> d!106685 (= c!90539 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (= (_1!5089 (h!17075 (toList!4505 lt!377554))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106685 (= (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000) e!464339)))

(assert (= (and d!106685 c!90539) b!832575))

(assert (= (and d!106685 (not c!90539)) b!832576))

(assert (= (and b!832576 c!90540) b!832577))

(assert (= (and b!832576 (not c!90540)) b!832578))

(declare-fun m!777001 () Bool)

(assert (=> b!832577 m!777001))

(assert (=> b!832159 d!106685))

(declare-fun d!106687 () Bool)

(assert (=> d!106687 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377901 () Unit!28493)

(assert (=> d!106687 (= lt!377901 (choose!1427 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464341 () Bool)

(assert (=> d!106687 e!464341))

(declare-fun res!566399 () Bool)

(assert (=> d!106687 (=> (not res!566399) (not e!464341))))

(assert (=> d!106687 (= res!566399 (isStrictlySorted!442 (toList!4505 lt!377580)))))

(assert (=> d!106687 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377901)))

(declare-fun b!832579 () Bool)

(assert (=> b!832579 (= e!464341 (containsKey!402 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106687 res!566399) b!832579))

(assert (=> d!106687 m!776061))

(assert (=> d!106687 m!776061))

(assert (=> d!106687 m!776063))

(declare-fun m!777003 () Bool)

(assert (=> d!106687 m!777003))

(assert (=> d!106687 m!776823))

(assert (=> b!832579 m!776057))

(assert (=> b!832063 d!106687))

(declare-fun d!106689 () Bool)

(assert (=> d!106689 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23293 () Bool)

(assert (= bs!23293 d!106689))

(assert (=> bs!23293 m!776061))

(declare-fun m!777005 () Bool)

(assert (=> bs!23293 m!777005))

(assert (=> b!832063 d!106689))

(declare-fun b!832582 () Bool)

(declare-fun e!464343 () Option!422)

(assert (=> b!832582 (= e!464343 (getValueByKey!416 (t!22317 (toList!4505 lt!377580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832581 () Bool)

(declare-fun e!464342 () Option!422)

(assert (=> b!832581 (= e!464342 e!464343)))

(declare-fun c!90542 () Bool)

(assert (=> b!832581 (= c!90542 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377580))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832583 () Bool)

(assert (=> b!832583 (= e!464343 None!420)))

(declare-fun b!832580 () Bool)

(assert (=> b!832580 (= e!464342 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377580)))))))

(declare-fun d!106691 () Bool)

(declare-fun c!90541 () Bool)

(assert (=> d!106691 (= c!90541 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (= (_1!5089 (h!17075 (toList!4505 lt!377580))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106691 (= (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000) e!464342)))

(assert (= (and d!106691 c!90541) b!832580))

(assert (= (and d!106691 (not c!90541)) b!832581))

(assert (= (and b!832581 c!90542) b!832582))

(assert (= (and b!832581 (not c!90542)) b!832583))

(declare-fun m!777007 () Bool)

(assert (=> b!832582 m!777007))

(assert (=> b!832063 d!106691))

(declare-fun b!832584 () Bool)

(declare-fun e!464345 () List!15949)

(declare-fun call!36441 () List!15949)

(assert (=> b!832584 (= e!464345 call!36441)))

(declare-fun e!464344 () List!15949)

(declare-fun b!832585 () Bool)

(assert (=> b!832585 (= e!464344 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun bm!36437 () Bool)

(declare-fun call!36440 () List!15949)

(assert (=> bm!36437 (= call!36441 call!36440)))

(declare-fun b!832586 () Bool)

(assert (=> b!832586 (= e!464345 call!36441)))

(declare-fun c!90545 () Bool)

(declare-fun c!90543 () Bool)

(declare-fun b!832587 () Bool)

(assert (=> b!832587 (= e!464344 (ite c!90545 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) (ite c!90543 (Cons!15945 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) (t!22317 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))))) Nil!15946)))))

(declare-fun bm!36438 () Bool)

(declare-fun c!90546 () Bool)

(declare-fun call!36442 () List!15949)

(assert (=> bm!36438 (= call!36442 ($colon$colon!537 e!464344 (ite c!90546 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90544 () Bool)

(assert (=> bm!36438 (= c!90544 c!90546)))

(declare-fun b!832588 () Bool)

(declare-fun res!566401 () Bool)

(declare-fun e!464347 () Bool)

(assert (=> b!832588 (=> (not res!566401) (not e!464347))))

(declare-fun lt!377902 () List!15949)

(assert (=> b!832588 (= res!566401 (containsKey!402 lt!377902 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832589 () Bool)

(declare-fun e!464348 () List!15949)

(assert (=> b!832589 (= e!464348 call!36442)))

(declare-fun b!832590 () Bool)

(assert (=> b!832590 (= c!90543 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464346 () List!15949)

(assert (=> b!832590 (= e!464346 e!464345)))

(declare-fun d!106693 () Bool)

(assert (=> d!106693 e!464347))

(declare-fun res!566400 () Bool)

(assert (=> d!106693 (=> (not res!566400) (not e!464347))))

(assert (=> d!106693 (= res!566400 (isStrictlySorted!442 lt!377902))))

(assert (=> d!106693 (= lt!377902 e!464348)))

(assert (=> d!106693 (= c!90546 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106693 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))))))

(assert (=> d!106693 (= (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377902)))

(declare-fun b!832591 () Bool)

(assert (=> b!832591 (= e!464346 call!36440)))

(declare-fun bm!36439 () Bool)

(assert (=> bm!36439 (= call!36440 call!36442)))

(declare-fun b!832592 () Bool)

(assert (=> b!832592 (= e!464347 (contains!4212 lt!377902 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832593 () Bool)

(assert (=> b!832593 (= e!464348 e!464346)))

(assert (=> b!832593 (= c!90545 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106693 c!90546) b!832589))

(assert (= (and d!106693 (not c!90546)) b!832593))

(assert (= (and b!832593 c!90545) b!832591))

(assert (= (and b!832593 (not c!90545)) b!832590))

(assert (= (and b!832590 c!90543) b!832584))

(assert (= (and b!832590 (not c!90543)) b!832586))

(assert (= (or b!832584 b!832586) bm!36437))

(assert (= (or b!832591 bm!36437) bm!36439))

(assert (= (or b!832589 bm!36439) bm!36438))

(assert (= (and bm!36438 c!90544) b!832585))

(assert (= (and bm!36438 (not c!90544)) b!832587))

(assert (= (and d!106693 res!566400) b!832588))

(assert (= (and b!832588 res!566401) b!832592))

(declare-fun m!777009 () Bool)

(assert (=> d!106693 m!777009))

(declare-fun m!777011 () Bool)

(assert (=> d!106693 m!777011))

(declare-fun m!777013 () Bool)

(assert (=> b!832588 m!777013))

(declare-fun m!777015 () Bool)

(assert (=> b!832592 m!777015))

(declare-fun m!777017 () Bool)

(assert (=> bm!36438 m!777017))

(declare-fun m!777019 () Bool)

(assert (=> b!832585 m!777019))

(assert (=> b!832223 d!106693))

(declare-fun d!106695 () Bool)

(declare-fun res!566402 () Bool)

(declare-fun e!464349 () Bool)

(assert (=> d!106695 (=> res!566402 e!464349)))

(assert (=> d!106695 (= res!566402 (and ((_ is Cons!15945) lt!377758) (= (_1!5089 (h!17075 lt!377758)) (_1!5089 lt!377428))))))

(assert (=> d!106695 (= (containsKey!402 lt!377758 (_1!5089 lt!377428)) e!464349)))

(declare-fun b!832594 () Bool)

(declare-fun e!464350 () Bool)

(assert (=> b!832594 (= e!464349 e!464350)))

(declare-fun res!566403 () Bool)

(assert (=> b!832594 (=> (not res!566403) (not e!464350))))

(assert (=> b!832594 (= res!566403 (and (or (not ((_ is Cons!15945) lt!377758)) (bvsle (_1!5089 (h!17075 lt!377758)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377758) (bvslt (_1!5089 (h!17075 lt!377758)) (_1!5089 lt!377428))))))

(declare-fun b!832595 () Bool)

(assert (=> b!832595 (= e!464350 (containsKey!402 (t!22317 lt!377758) (_1!5089 lt!377428)))))

(assert (= (and d!106695 (not res!566402)) b!832594))

(assert (= (and b!832594 res!566403) b!832595))

(declare-fun m!777021 () Bool)

(assert (=> b!832595 m!777021))

(assert (=> b!832264 d!106695))

(declare-fun d!106697 () Bool)

(declare-fun res!566404 () Bool)

(declare-fun e!464351 () Bool)

(assert (=> d!106697 (=> res!566404 e!464351)))

(assert (=> d!106697 (= res!566404 (and ((_ is Cons!15945) (toList!4505 lt!377617)) (= (_1!5089 (h!17075 (toList!4505 lt!377617))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106697 (= (containsKey!402 (toList!4505 lt!377617) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464351)))

(declare-fun b!832596 () Bool)

(declare-fun e!464352 () Bool)

(assert (=> b!832596 (= e!464351 e!464352)))

(declare-fun res!566405 () Bool)

(assert (=> b!832596 (=> (not res!566405) (not e!464352))))

(assert (=> b!832596 (= res!566405 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377617))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377617))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) (toList!4505 lt!377617)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377617))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832597 () Bool)

(assert (=> b!832597 (= e!464352 (containsKey!402 (t!22317 (toList!4505 lt!377617)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106697 (not res!566404)) b!832596))

(assert (= (and b!832596 res!566405) b!832597))

(declare-fun m!777023 () Bool)

(assert (=> b!832597 m!777023))

(assert (=> d!106393 d!106697))

(declare-fun d!106699 () Bool)

(assert (=> d!106699 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23294 () Bool)

(assert (= bs!23294 d!106699))

(assert (=> bs!23294 m!776691))

(declare-fun m!777025 () Bool)

(assert (=> bs!23294 m!777025))

(assert (=> b!832379 d!106699))

(declare-fun b!832600 () Bool)

(declare-fun e!464354 () Option!422)

(assert (=> b!832600 (= e!464354 (getValueByKey!416 (t!22317 (toList!4505 lt!377494)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832599 () Bool)

(declare-fun e!464353 () Option!422)

(assert (=> b!832599 (= e!464353 e!464354)))

(declare-fun c!90548 () Bool)

(assert (=> b!832599 (= c!90548 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377494))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832601 () Bool)

(assert (=> b!832601 (= e!464354 None!420)))

(declare-fun b!832598 () Bool)

(assert (=> b!832598 (= e!464353 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377494)))))))

(declare-fun d!106701 () Bool)

(declare-fun c!90547 () Bool)

(assert (=> d!106701 (= c!90547 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (= (_1!5089 (h!17075 (toList!4505 lt!377494))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106701 (= (getValueByKey!416 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000) e!464353)))

(assert (= (and d!106701 c!90547) b!832598))

(assert (= (and d!106701 (not c!90547)) b!832599))

(assert (= (and b!832599 c!90548) b!832600))

(assert (= (and b!832599 (not c!90548)) b!832601))

(declare-fun m!777027 () Bool)

(assert (=> b!832600 m!777027))

(assert (=> b!832379 d!106701))

(declare-fun b!832602 () Bool)

(declare-fun e!464356 () List!15949)

(declare-fun call!36444 () List!15949)

(assert (=> b!832602 (= e!464356 call!36444)))

(declare-fun b!832603 () Bool)

(declare-fun e!464355 () List!15949)

(assert (=> b!832603 (= e!464355 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 lt!377422))) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36440 () Bool)

(declare-fun call!36443 () List!15949)

(assert (=> bm!36440 (= call!36444 call!36443)))

(declare-fun b!832604 () Bool)

(assert (=> b!832604 (= e!464356 call!36444)))

(declare-fun c!90549 () Bool)

(declare-fun c!90551 () Bool)

(declare-fun b!832605 () Bool)

(assert (=> b!832605 (= e!464355 (ite c!90551 (t!22317 (t!22317 (toList!4505 lt!377422))) (ite c!90549 (Cons!15945 (h!17075 (t!22317 (toList!4505 lt!377422))) (t!22317 (t!22317 (toList!4505 lt!377422)))) Nil!15946)))))

(declare-fun c!90552 () Bool)

(declare-fun call!36445 () List!15949)

(declare-fun bm!36441 () Bool)

(assert (=> bm!36441 (= call!36445 ($colon$colon!537 e!464355 (ite c!90552 (h!17075 (t!22317 (toList!4505 lt!377422))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90550 () Bool)

(assert (=> bm!36441 (= c!90550 c!90552)))

(declare-fun b!832606 () Bool)

(declare-fun res!566407 () Bool)

(declare-fun e!464358 () Bool)

(assert (=> b!832606 (=> (not res!566407) (not e!464358))))

(declare-fun lt!377903 () List!15949)

(assert (=> b!832606 (= res!566407 (containsKey!402 lt!377903 (_1!5089 lt!377428)))))

(declare-fun b!832607 () Bool)

(declare-fun e!464359 () List!15949)

(assert (=> b!832607 (= e!464359 call!36445)))

(declare-fun b!832608 () Bool)

(assert (=> b!832608 (= c!90549 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377422))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377422)))) (_1!5089 lt!377428))))))

(declare-fun e!464357 () List!15949)

(assert (=> b!832608 (= e!464357 e!464356)))

(declare-fun d!106703 () Bool)

(assert (=> d!106703 e!464358))

(declare-fun res!566406 () Bool)

(assert (=> d!106703 (=> (not res!566406) (not e!464358))))

(assert (=> d!106703 (= res!566406 (isStrictlySorted!442 lt!377903))))

(assert (=> d!106703 (= lt!377903 e!464359)))

(assert (=> d!106703 (= c!90552 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377422))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377422)))) (_1!5089 lt!377428))))))

(assert (=> d!106703 (isStrictlySorted!442 (t!22317 (toList!4505 lt!377422)))))

(assert (=> d!106703 (= (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377422)) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377903)))

(declare-fun b!832609 () Bool)

(assert (=> b!832609 (= e!464357 call!36443)))

(declare-fun bm!36442 () Bool)

(assert (=> bm!36442 (= call!36443 call!36445)))

(declare-fun b!832610 () Bool)

(assert (=> b!832610 (= e!464358 (contains!4212 lt!377903 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832611 () Bool)

(assert (=> b!832611 (= e!464359 e!464357)))

(assert (=> b!832611 (= c!90551 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377422))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377422)))) (_1!5089 lt!377428))))))

(assert (= (and d!106703 c!90552) b!832607))

(assert (= (and d!106703 (not c!90552)) b!832611))

(assert (= (and b!832611 c!90551) b!832609))

(assert (= (and b!832611 (not c!90551)) b!832608))

(assert (= (and b!832608 c!90549) b!832602))

(assert (= (and b!832608 (not c!90549)) b!832604))

(assert (= (or b!832602 b!832604) bm!36440))

(assert (= (or b!832609 bm!36440) bm!36442))

(assert (= (or b!832607 bm!36442) bm!36441))

(assert (= (and bm!36441 c!90550) b!832603))

(assert (= (and bm!36441 (not c!90550)) b!832605))

(assert (= (and d!106703 res!566406) b!832606))

(assert (= (and b!832606 res!566407) b!832610))

(declare-fun m!777029 () Bool)

(assert (=> d!106703 m!777029))

(declare-fun m!777031 () Bool)

(assert (=> d!106703 m!777031))

(declare-fun m!777033 () Bool)

(assert (=> b!832606 m!777033))

(declare-fun m!777035 () Bool)

(assert (=> b!832610 m!777035))

(declare-fun m!777037 () Bool)

(assert (=> bm!36441 m!777037))

(declare-fun m!777039 () Bool)

(assert (=> b!832603 m!777039))

(assert (=> b!832150 d!106703))

(declare-fun d!106705 () Bool)

(declare-fun res!566408 () Bool)

(declare-fun e!464360 () Bool)

(assert (=> d!106705 (=> res!566408 e!464360)))

(assert (=> d!106705 (= res!566408 (or ((_ is Nil!15946) lt!377741) ((_ is Nil!15946) (t!22317 lt!377741))))))

(assert (=> d!106705 (= (isStrictlySorted!442 lt!377741) e!464360)))

(declare-fun b!832612 () Bool)

(declare-fun e!464361 () Bool)

(assert (=> b!832612 (= e!464360 e!464361)))

(declare-fun res!566409 () Bool)

(assert (=> b!832612 (=> (not res!566409) (not e!464361))))

(assert (=> b!832612 (= res!566409 (bvslt (_1!5089 (h!17075 lt!377741)) (_1!5089 (h!17075 (t!22317 lt!377741)))))))

(declare-fun b!832613 () Bool)

(assert (=> b!832613 (= e!464361 (isStrictlySorted!442 (t!22317 lt!377741)))))

(assert (= (and d!106705 (not res!566408)) b!832612))

(assert (= (and b!832612 res!566409) b!832613))

(declare-fun m!777041 () Bool)

(assert (=> b!832613 m!777041))

(assert (=> d!106443 d!106705))

(declare-fun d!106707 () Bool)

(declare-fun res!566410 () Bool)

(declare-fun e!464362 () Bool)

(assert (=> d!106707 (=> res!566410 e!464362)))

(assert (=> d!106707 (= res!566410 (or ((_ is Nil!15946) (toList!4505 (+!1983 lt!377423 lt!377428))) ((_ is Nil!15946) (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428))))))))

(assert (=> d!106707 (= (isStrictlySorted!442 (toList!4505 (+!1983 lt!377423 lt!377428))) e!464362)))

(declare-fun b!832614 () Bool)

(declare-fun e!464363 () Bool)

(assert (=> b!832614 (= e!464362 e!464363)))

(declare-fun res!566411 () Bool)

(assert (=> b!832614 (=> (not res!566411) (not e!464363))))

(assert (=> b!832614 (= res!566411 (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428)))) (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))))))))

(declare-fun b!832615 () Bool)

(assert (=> b!832615 (= e!464363 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377423 lt!377428)))))))

(assert (= (and d!106707 (not res!566410)) b!832614))

(assert (= (and b!832614 res!566411) b!832615))

(assert (=> b!832615 m!777011))

(assert (=> d!106443 d!106707))

(declare-fun d!106709 () Bool)

(assert (=> d!106709 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377465) (_1!5089 lt!377428))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377465) (_1!5089 lt!377428)))))))

(declare-fun bs!23295 () Bool)

(assert (= bs!23295 d!106709))

(assert (=> bs!23295 m!775783))

(declare-fun m!777043 () Bool)

(assert (=> bs!23295 m!777043))

(assert (=> b!832110 d!106709))

(assert (=> b!832110 d!106435))

(declare-fun b!832618 () Bool)

(declare-fun e!464365 () Option!422)

(assert (=> b!832618 (= e!464365 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377605))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!832617 () Bool)

(declare-fun e!464364 () Option!422)

(assert (=> b!832617 (= e!464364 e!464365)))

(declare-fun c!90554 () Bool)

(assert (=> b!832617 (= c!90554 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377605))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377605)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832619 () Bool)

(assert (=> b!832619 (= e!464365 None!420)))

(declare-fun b!832616 () Bool)

(assert (=> b!832616 (= e!464364 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377605))))))))

(declare-fun d!106711 () Bool)

(declare-fun c!90553 () Bool)

(assert (=> d!106711 (= c!90553 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377605))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377605)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106711 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377605)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464364)))

(assert (= (and d!106711 c!90553) b!832616))

(assert (= (and d!106711 (not c!90553)) b!832617))

(assert (= (and b!832617 c!90554) b!832618))

(assert (= (and b!832617 (not c!90554)) b!832619))

(declare-fun m!777045 () Bool)

(assert (=> b!832618 m!777045))

(assert (=> b!832372 d!106711))

(declare-fun b!832638 () Bool)

(declare-fun e!464380 () SeekEntryResult!8745)

(assert (=> b!832638 (= e!464380 (Intermediate!8745 false (toIndex!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!832639 () Bool)

(declare-fun lt!377908 () SeekEntryResult!8745)

(assert (=> b!832639 (and (bvsge (index!37353 lt!377908) #b00000000000000000000000000000000) (bvslt (index!37353 lt!377908) (size!22755 _keys!976)))))

(declare-fun res!566419 () Bool)

(assert (=> b!832639 (= res!566419 (= (select (arr!22334 _keys!976) (index!37353 lt!377908)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464378 () Bool)

(assert (=> b!832639 (=> res!566419 e!464378)))

(declare-fun b!832640 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!832640 (= e!464380 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000 mask!1312) (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!832641 () Bool)

(declare-fun e!464377 () Bool)

(assert (=> b!832641 (= e!464377 (bvsge (x!70140 lt!377908) #b01111111111111111111111111111110))))

(declare-fun b!832642 () Bool)

(declare-fun e!464376 () SeekEntryResult!8745)

(assert (=> b!832642 (= e!464376 (Intermediate!8745 true (toIndex!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!832643 () Bool)

(assert (=> b!832643 (and (bvsge (index!37353 lt!377908) #b00000000000000000000000000000000) (bvslt (index!37353 lt!377908) (size!22755 _keys!976)))))

(assert (=> b!832643 (= e!464378 (= (select (arr!22334 _keys!976) (index!37353 lt!377908)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832644 () Bool)

(assert (=> b!832644 (and (bvsge (index!37353 lt!377908) #b00000000000000000000000000000000) (bvslt (index!37353 lt!377908) (size!22755 _keys!976)))))

(declare-fun res!566418 () Bool)

(assert (=> b!832644 (= res!566418 (= (select (arr!22334 _keys!976) (index!37353 lt!377908)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!832644 (=> res!566418 e!464378)))

(declare-fun e!464379 () Bool)

(assert (=> b!832644 (= e!464379 e!464378)))

(declare-fun b!832645 () Bool)

(assert (=> b!832645 (= e!464376 e!464380)))

(declare-fun c!90563 () Bool)

(declare-fun lt!377909 () (_ BitVec 64))

(assert (=> b!832645 (= c!90563 (or (= lt!377909 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (= (bvadd lt!377909 lt!377909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!106713 () Bool)

(assert (=> d!106713 e!464377))

(declare-fun c!90562 () Bool)

(assert (=> d!106713 (= c!90562 (and ((_ is Intermediate!8745) lt!377908) (undefined!9557 lt!377908)))))

(assert (=> d!106713 (= lt!377908 e!464376)))

(declare-fun c!90561 () Bool)

(assert (=> d!106713 (= c!90561 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!106713 (= lt!377909 (select (arr!22334 _keys!976) (toIndex!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) mask!1312)))))

(assert (=> d!106713 (validMask!0 mask!1312)))

(assert (=> d!106713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377908)))

(declare-fun b!832646 () Bool)

(assert (=> b!832646 (= e!464377 e!464379)))

(declare-fun res!566420 () Bool)

(assert (=> b!832646 (= res!566420 (and ((_ is Intermediate!8745) lt!377908) (not (undefined!9557 lt!377908)) (bvslt (x!70140 lt!377908) #b01111111111111111111111111111110) (bvsge (x!70140 lt!377908) #b00000000000000000000000000000000) (bvsge (x!70140 lt!377908) #b00000000000000000000000000000000)))))

(assert (=> b!832646 (=> (not res!566420) (not e!464379))))

(assert (= (and d!106713 c!90561) b!832642))

(assert (= (and d!106713 (not c!90561)) b!832645))

(assert (= (and b!832645 c!90563) b!832638))

(assert (= (and b!832645 (not c!90563)) b!832640))

(assert (= (and d!106713 c!90562) b!832641))

(assert (= (and d!106713 (not c!90562)) b!832646))

(assert (= (and b!832646 res!566420) b!832644))

(assert (= (and b!832644 (not res!566418)) b!832639))

(assert (= (and b!832639 (not res!566419)) b!832643))

(declare-fun m!777047 () Bool)

(assert (=> b!832643 m!777047))

(assert (=> b!832644 m!777047))

(assert (=> d!106713 m!776037))

(declare-fun m!777049 () Bool)

(assert (=> d!106713 m!777049))

(assert (=> d!106713 m!775715))

(assert (=> b!832639 m!777047))

(assert (=> b!832640 m!776037))

(declare-fun m!777051 () Bool)

(assert (=> b!832640 m!777051))

(assert (=> b!832640 m!777051))

(assert (=> b!832640 m!775791))

(declare-fun m!777053 () Bool)

(assert (=> b!832640 m!777053))

(assert (=> d!106343 d!106713))

(declare-fun d!106715 () Bool)

(declare-fun lt!377915 () (_ BitVec 32))

(declare-fun lt!377914 () (_ BitVec 32))

(assert (=> d!106715 (= lt!377915 (bvmul (bvxor lt!377914 (bvlshr lt!377914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!106715 (= lt!377914 ((_ extract 31 0) (bvand (bvxor (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22334 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!106715 (and (bvsge mask!1312 #b00000000000000000000000000000000) (let ((res!566421 (let ((h!17079 ((_ extract 31 0) (bvand (bvxor (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22334 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!70150 (bvmul (bvxor h!17079 (bvlshr h!17079 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!70150 (bvlshr x!70150 #b00000000000000000000000000001101)) mask!1312))))) (and (bvslt res!566421 (bvadd mask!1312 #b00000000000000000000000000000001)) (bvsge res!566421 #b00000000000000000000000000000000))))))

(assert (=> d!106715 (= (toIndex!0 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvand (bvxor lt!377915 (bvlshr lt!377915 #b00000000000000000000000000001101)) mask!1312))))

(assert (=> d!106343 d!106715))

(assert (=> d!106343 d!106321))

(assert (=> b!832239 d!106647))

(declare-fun b!832649 () Bool)

(declare-fun e!464382 () Option!422)

(assert (=> b!832649 (= e!464382 (getValueByKey!416 (t!22317 (t!22317 lt!377460)) (_1!5089 lt!377425)))))

(declare-fun b!832648 () Bool)

(declare-fun e!464381 () Option!422)

(assert (=> b!832648 (= e!464381 e!464382)))

(declare-fun c!90565 () Bool)

(assert (=> b!832648 (= c!90565 (and ((_ is Cons!15945) (t!22317 lt!377460)) (not (= (_1!5089 (h!17075 (t!22317 lt!377460))) (_1!5089 lt!377425)))))))

(declare-fun b!832650 () Bool)

(assert (=> b!832650 (= e!464382 None!420)))

(declare-fun b!832647 () Bool)

(assert (=> b!832647 (= e!464381 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377460)))))))

(declare-fun d!106717 () Bool)

(declare-fun c!90564 () Bool)

(assert (=> d!106717 (= c!90564 (and ((_ is Cons!15945) (t!22317 lt!377460)) (= (_1!5089 (h!17075 (t!22317 lt!377460))) (_1!5089 lt!377425))))))

(assert (=> d!106717 (= (getValueByKey!416 (t!22317 lt!377460) (_1!5089 lt!377425)) e!464381)))

(assert (= (and d!106717 c!90564) b!832647))

(assert (= (and d!106717 (not c!90564)) b!832648))

(assert (= (and b!832648 c!90565) b!832649))

(assert (= (and b!832648 (not c!90565)) b!832650))

(declare-fun m!777055 () Bool)

(assert (=> b!832649 m!777055))

(assert (=> b!832349 d!106717))

(declare-fun d!106719 () Bool)

(declare-fun res!566422 () Bool)

(declare-fun e!464383 () Bool)

(assert (=> d!106719 (=> res!566422 e!464383)))

(assert (=> d!106719 (= res!566422 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (= (_1!5089 (h!17075 (toList!4505 lt!377580))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106719 (= (containsKey!402 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000) e!464383)))

(declare-fun b!832651 () Bool)

(declare-fun e!464384 () Bool)

(assert (=> b!832651 (= e!464383 e!464384)))

(declare-fun res!566423 () Bool)

(assert (=> b!832651 (=> (not res!566423) (not e!464384))))

(assert (=> b!832651 (= res!566423 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377580))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377580))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377580)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377580))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832652 () Bool)

(assert (=> b!832652 (= e!464384 (containsKey!402 (t!22317 (toList!4505 lt!377580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106719 (not res!566422)) b!832651))

(assert (= (and b!832651 res!566423) b!832652))

(declare-fun m!777057 () Bool)

(assert (=> b!832652 m!777057))

(assert (=> d!106351 d!106719))

(declare-fun d!106721 () Bool)

(declare-fun res!566424 () Bool)

(declare-fun e!464385 () Bool)

(assert (=> d!106721 (=> res!566424 e!464385)))

(assert (=> d!106721 (= res!566424 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (= (_1!5089 (h!17075 (toList!4505 lt!377554))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106721 (= (containsKey!402 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000) e!464385)))

(declare-fun b!832653 () Bool)

(declare-fun e!464386 () Bool)

(assert (=> b!832653 (= e!464385 e!464386)))

(declare-fun res!566425 () Bool)

(assert (=> b!832653 (=> (not res!566425) (not e!464386))))

(assert (=> b!832653 (= res!566425 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377554))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377554))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377554)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377554))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832654 () Bool)

(assert (=> b!832654 (= e!464386 (containsKey!402 (t!22317 (toList!4505 lt!377554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106721 (not res!566424)) b!832653))

(assert (= (and b!832653 res!566425) b!832654))

(declare-fun m!777059 () Bool)

(assert (=> b!832654 m!777059))

(assert (=> d!106387 d!106721))

(declare-fun d!106723 () Bool)

(assert (=> d!106723 (= ($colon$colon!537 e!464200 (ite c!90474 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428))) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425)))) (Cons!15945 (ite c!90474 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428))) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))) e!464200))))

(assert (=> bm!36423 d!106723))

(declare-fun d!106725 () Bool)

(assert (=> d!106725 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377461) (_1!5089 lt!377425)))))

(declare-fun lt!377916 () Unit!28493)

(assert (=> d!106725 (= lt!377916 (choose!1427 (toList!4505 lt!377461) (_1!5089 lt!377425)))))

(declare-fun e!464387 () Bool)

(assert (=> d!106725 e!464387))

(declare-fun res!566426 () Bool)

(assert (=> d!106725 (=> (not res!566426) (not e!464387))))

(assert (=> d!106725 (= res!566426 (isStrictlySorted!442 (toList!4505 lt!377461)))))

(assert (=> d!106725 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377461) (_1!5089 lt!377425)) lt!377916)))

(declare-fun b!832655 () Bool)

(assert (=> b!832655 (= e!464387 (containsKey!402 (toList!4505 lt!377461) (_1!5089 lt!377425)))))

(assert (= (and d!106725 res!566426) b!832655))

(assert (=> d!106725 m!775771))

(assert (=> d!106725 m!775771))

(assert (=> d!106725 m!776643))

(declare-fun m!777061 () Bool)

(assert (=> d!106725 m!777061))

(declare-fun m!777063 () Bool)

(assert (=> d!106725 m!777063))

(assert (=> b!832655 m!776639))

(assert (=> b!832344 d!106725))

(declare-fun d!106727 () Bool)

(assert (=> d!106727 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377461) (_1!5089 lt!377425))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377461) (_1!5089 lt!377425)))))))

(declare-fun bs!23296 () Bool)

(assert (= bs!23296 d!106727))

(assert (=> bs!23296 m!775771))

(declare-fun m!777065 () Bool)

(assert (=> bs!23296 m!777065))

(assert (=> b!832344 d!106727))

(assert (=> b!832344 d!106449))

(declare-fun d!106729 () Bool)

(assert (=> d!106729 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377509) (_1!5089 lt!377428))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377509) (_1!5089 lt!377428)))))))

(declare-fun bs!23297 () Bool)

(assert (= bs!23297 d!106729))

(assert (=> bs!23297 m!775855))

(declare-fun m!777067 () Bool)

(assert (=> bs!23297 m!777067))

(assert (=> b!832393 d!106729))

(assert (=> b!832393 d!106563))

(declare-fun d!106731 () Bool)

(declare-fun lt!377917 () Bool)

(assert (=> d!106731 (= lt!377917 (select (content!388 lt!377779) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464389 () Bool)

(assert (=> d!106731 (= lt!377917 e!464389)))

(declare-fun res!566428 () Bool)

(assert (=> d!106731 (=> (not res!566428) (not e!464389))))

(assert (=> d!106731 (= res!566428 ((_ is Cons!15945) lt!377779))))

(assert (=> d!106731 (= (contains!4212 lt!377779 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!377917)))

(declare-fun b!832656 () Bool)

(declare-fun e!464388 () Bool)

(assert (=> b!832656 (= e!464389 e!464388)))

(declare-fun res!566427 () Bool)

(assert (=> b!832656 (=> res!566427 e!464388)))

(assert (=> b!832656 (= res!566427 (= (h!17075 lt!377779) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832657 () Bool)

(assert (=> b!832657 (= e!464388 (contains!4212 (t!22317 lt!377779) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106731 res!566428) b!832656))

(assert (= (and b!832656 (not res!566427)) b!832657))

(declare-fun m!777069 () Bool)

(assert (=> d!106731 m!777069))

(declare-fun m!777071 () Bool)

(assert (=> d!106731 m!777071))

(declare-fun m!777073 () Bool)

(assert (=> b!832657 m!777073))

(assert (=> b!832305 d!106731))

(declare-fun d!106733 () Bool)

(assert (=> d!106733 (= (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34))) lt!377574)) (v!10101 (getValueByKey!416 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34))) lt!377574)))))

(assert (=> d!106499 d!106733))

(declare-fun e!464391 () Option!422)

(declare-fun b!832660 () Bool)

(assert (=> b!832660 (= e!464391 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)))) lt!377574))))

(declare-fun b!832659 () Bool)

(declare-fun e!464390 () Option!422)

(assert (=> b!832659 (= e!464390 e!464391)))

(declare-fun c!90567 () Bool)

(assert (=> b!832659 (= c!90567 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34))))) lt!377574))))))

(declare-fun b!832661 () Bool)

(assert (=> b!832661 (= e!464391 None!420)))

(declare-fun b!832658 () Bool)

(assert (=> b!832658 (= e!464390 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)))))))))

(declare-fun d!106735 () Bool)

(declare-fun c!90566 () Bool)

(assert (=> d!106735 (= c!90566 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34))))) lt!377574)))))

(assert (=> d!106735 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34))) lt!377574) e!464390)))

(assert (= (and d!106735 c!90566) b!832658))

(assert (= (and d!106735 (not c!90566)) b!832659))

(assert (= (and b!832659 c!90567) b!832660))

(assert (= (and b!832659 (not c!90567)) b!832661))

(declare-fun m!777075 () Bool)

(assert (=> b!832660 m!777075))

(assert (=> d!106499 d!106735))

(declare-fun d!106737 () Bool)

(declare-fun e!464392 () Bool)

(assert (=> d!106737 e!464392))

(declare-fun res!566429 () Bool)

(assert (=> d!106737 (=> res!566429 e!464392)))

(declare-fun lt!377921 () Bool)

(assert (=> d!106737 (= res!566429 (not lt!377921))))

(declare-fun lt!377920 () Bool)

(assert (=> d!106737 (= lt!377921 lt!377920)))

(declare-fun lt!377919 () Unit!28493)

(declare-fun e!464393 () Unit!28493)

(assert (=> d!106737 (= lt!377919 e!464393)))

(declare-fun c!90568 () Bool)

(assert (=> d!106737 (= c!90568 lt!377920)))

(assert (=> d!106737 (= lt!377920 (containsKey!402 (toList!4505 lt!377678) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106737 (= (contains!4211 lt!377678 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377921)))

(declare-fun b!832662 () Bool)

(declare-fun lt!377918 () Unit!28493)

(assert (=> b!832662 (= e!464393 lt!377918)))

(assert (=> b!832662 (= lt!377918 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377678) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!832662 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377678) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832663 () Bool)

(declare-fun Unit!28528 () Unit!28493)

(assert (=> b!832663 (= e!464393 Unit!28528)))

(declare-fun b!832664 () Bool)

(assert (=> b!832664 (= e!464392 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377678) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106737 c!90568) b!832662))

(assert (= (and d!106737 (not c!90568)) b!832663))

(assert (= (and d!106737 (not res!566429)) b!832664))

(declare-fun m!777077 () Bool)

(assert (=> d!106737 m!777077))

(declare-fun m!777079 () Bool)

(assert (=> b!832662 m!777079))

(assert (=> b!832662 m!776165))

(assert (=> b!832662 m!776165))

(declare-fun m!777081 () Bool)

(assert (=> b!832662 m!777081))

(assert (=> b!832664 m!776165))

(assert (=> b!832664 m!776165))

(assert (=> b!832664 m!777081))

(assert (=> d!106377 d!106737))

(declare-fun b!832667 () Bool)

(declare-fun e!464395 () Option!422)

(assert (=> b!832667 (= e!464395 (getValueByKey!416 (t!22317 lt!377677) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832666 () Bool)

(declare-fun e!464394 () Option!422)

(assert (=> b!832666 (= e!464394 e!464395)))

(declare-fun c!90570 () Bool)

(assert (=> b!832666 (= c!90570 (and ((_ is Cons!15945) lt!377677) (not (= (_1!5089 (h!17075 lt!377677)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832668 () Bool)

(assert (=> b!832668 (= e!464395 None!420)))

(declare-fun b!832665 () Bool)

(assert (=> b!832665 (= e!464394 (Some!421 (_2!5089 (h!17075 lt!377677))))))

(declare-fun d!106739 () Bool)

(declare-fun c!90569 () Bool)

(assert (=> d!106739 (= c!90569 (and ((_ is Cons!15945) lt!377677) (= (_1!5089 (h!17075 lt!377677)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106739 (= (getValueByKey!416 lt!377677 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464394)))

(assert (= (and d!106739 c!90569) b!832665))

(assert (= (and d!106739 (not c!90569)) b!832666))

(assert (= (and b!832666 c!90570) b!832667))

(assert (= (and b!832666 (not c!90570)) b!832668))

(declare-fun m!777083 () Bool)

(assert (=> b!832667 m!777083))

(assert (=> d!106377 d!106739))

(declare-fun d!106741 () Bool)

(assert (=> d!106741 (= (getValueByKey!416 lt!377677 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377922 () Unit!28493)

(assert (=> d!106741 (= lt!377922 (choose!1423 lt!377677 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464396 () Bool)

(assert (=> d!106741 e!464396))

(declare-fun res!566430 () Bool)

(assert (=> d!106741 (=> (not res!566430) (not e!464396))))

(assert (=> d!106741 (= res!566430 (isStrictlySorted!442 lt!377677))))

(assert (=> d!106741 (= (lemmaContainsTupThenGetReturnValue!230 lt!377677 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377922)))

(declare-fun b!832669 () Bool)

(declare-fun res!566431 () Bool)

(assert (=> b!832669 (=> (not res!566431) (not e!464396))))

(assert (=> b!832669 (= res!566431 (containsKey!402 lt!377677 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832670 () Bool)

(assert (=> b!832670 (= e!464396 (contains!4212 lt!377677 (tuple2!10157 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106741 res!566430) b!832669))

(assert (= (and b!832669 res!566431) b!832670))

(assert (=> d!106741 m!776159))

(declare-fun m!777085 () Bool)

(assert (=> d!106741 m!777085))

(declare-fun m!777087 () Bool)

(assert (=> d!106741 m!777087))

(declare-fun m!777089 () Bool)

(assert (=> b!832669 m!777089))

(declare-fun m!777091 () Bool)

(assert (=> b!832670 m!777091))

(assert (=> d!106377 d!106741))

(declare-fun b!832671 () Bool)

(declare-fun e!464398 () List!15949)

(declare-fun call!36447 () List!15949)

(assert (=> b!832671 (= e!464398 call!36447)))

(declare-fun b!832672 () Bool)

(declare-fun e!464397 () List!15949)

(assert (=> b!832672 (= e!464397 (insertStrictlySorted!269 (t!22317 (toList!4505 call!36387)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36443 () Bool)

(declare-fun call!36446 () List!15949)

(assert (=> bm!36443 (= call!36447 call!36446)))

(declare-fun b!832673 () Bool)

(assert (=> b!832673 (= e!464398 call!36447)))

(declare-fun b!832674 () Bool)

(declare-fun c!90571 () Bool)

(declare-fun c!90573 () Bool)

(assert (=> b!832674 (= e!464397 (ite c!90573 (t!22317 (toList!4505 call!36387)) (ite c!90571 (Cons!15945 (h!17075 (toList!4505 call!36387)) (t!22317 (toList!4505 call!36387))) Nil!15946)))))

(declare-fun bm!36444 () Bool)

(declare-fun c!90574 () Bool)

(declare-fun call!36448 () List!15949)

(assert (=> bm!36444 (= call!36448 ($colon$colon!537 e!464397 (ite c!90574 (h!17075 (toList!4505 call!36387)) (tuple2!10157 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90572 () Bool)

(assert (=> bm!36444 (= c!90572 c!90574)))

(declare-fun b!832675 () Bool)

(declare-fun res!566433 () Bool)

(declare-fun e!464400 () Bool)

(assert (=> b!832675 (=> (not res!566433) (not e!464400))))

(declare-fun lt!377923 () List!15949)

(assert (=> b!832675 (= res!566433 (containsKey!402 lt!377923 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832676 () Bool)

(declare-fun e!464401 () List!15949)

(assert (=> b!832676 (= e!464401 call!36448)))

(declare-fun b!832677 () Bool)

(assert (=> b!832677 (= c!90571 (and ((_ is Cons!15945) (toList!4505 call!36387)) (bvsgt (_1!5089 (h!17075 (toList!4505 call!36387))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464399 () List!15949)

(assert (=> b!832677 (= e!464399 e!464398)))

(declare-fun d!106743 () Bool)

(assert (=> d!106743 e!464400))

(declare-fun res!566432 () Bool)

(assert (=> d!106743 (=> (not res!566432) (not e!464400))))

(assert (=> d!106743 (= res!566432 (isStrictlySorted!442 lt!377923))))

(assert (=> d!106743 (= lt!377923 e!464401)))

(assert (=> d!106743 (= c!90574 (and ((_ is Cons!15945) (toList!4505 call!36387)) (bvslt (_1!5089 (h!17075 (toList!4505 call!36387))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106743 (isStrictlySorted!442 (toList!4505 call!36387))))

(assert (=> d!106743 (= (insertStrictlySorted!269 (toList!4505 call!36387) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377923)))

(declare-fun b!832678 () Bool)

(assert (=> b!832678 (= e!464399 call!36446)))

(declare-fun bm!36445 () Bool)

(assert (=> bm!36445 (= call!36446 call!36448)))

(declare-fun b!832679 () Bool)

(assert (=> b!832679 (= e!464400 (contains!4212 lt!377923 (tuple2!10157 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832680 () Bool)

(assert (=> b!832680 (= e!464401 e!464399)))

(assert (=> b!832680 (= c!90573 (and ((_ is Cons!15945) (toList!4505 call!36387)) (= (_1!5089 (h!17075 (toList!4505 call!36387))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106743 c!90574) b!832676))

(assert (= (and d!106743 (not c!90574)) b!832680))

(assert (= (and b!832680 c!90573) b!832678))

(assert (= (and b!832680 (not c!90573)) b!832677))

(assert (= (and b!832677 c!90571) b!832671))

(assert (= (and b!832677 (not c!90571)) b!832673))

(assert (= (or b!832671 b!832673) bm!36443))

(assert (= (or b!832678 bm!36443) bm!36445))

(assert (= (or b!832676 bm!36445) bm!36444))

(assert (= (and bm!36444 c!90572) b!832672))

(assert (= (and bm!36444 (not c!90572)) b!832674))

(assert (= (and d!106743 res!566432) b!832675))

(assert (= (and b!832675 res!566433) b!832679))

(declare-fun m!777093 () Bool)

(assert (=> d!106743 m!777093))

(declare-fun m!777095 () Bool)

(assert (=> d!106743 m!777095))

(declare-fun m!777097 () Bool)

(assert (=> b!832675 m!777097))

(declare-fun m!777099 () Bool)

(assert (=> b!832679 m!777099))

(declare-fun m!777101 () Bool)

(assert (=> bm!36444 m!777101))

(declare-fun m!777103 () Bool)

(assert (=> b!832672 m!777103))

(assert (=> d!106377 d!106743))

(declare-fun d!106745 () Bool)

(assert (=> d!106745 (= (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34))) lt!377600)) (v!10101 (getValueByKey!416 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34))) lt!377600)))))

(assert (=> d!106417 d!106745))

(declare-fun e!464403 () Option!422)

(declare-fun b!832683 () Bool)

(assert (=> b!832683 (= e!464403 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)))) lt!377600))))

(declare-fun b!832682 () Bool)

(declare-fun e!464402 () Option!422)

(assert (=> b!832682 (= e!464402 e!464403)))

(declare-fun c!90576 () Bool)

(assert (=> b!832682 (= c!90576 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34))))) lt!377600))))))

(declare-fun b!832684 () Bool)

(assert (=> b!832684 (= e!464403 None!420)))

(declare-fun b!832681 () Bool)

(assert (=> b!832681 (= e!464402 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))))

(declare-fun c!90575 () Bool)

(declare-fun d!106747 () Bool)

(assert (=> d!106747 (= c!90575 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34))))) lt!377600)))))

(assert (=> d!106747 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377587 (tuple2!10157 lt!377586 zeroValueAfter!34))) lt!377600) e!464402)))

(assert (= (and d!106747 c!90575) b!832681))

(assert (= (and d!106747 (not c!90575)) b!832682))

(assert (= (and b!832682 c!90576) b!832683))

(assert (= (and b!832682 (not c!90576)) b!832684))

(declare-fun m!777105 () Bool)

(assert (=> b!832683 m!777105))

(assert (=> d!106417 d!106747))

(declare-fun lt!377924 () Bool)

(declare-fun d!106749 () Bool)

(assert (=> d!106749 (= lt!377924 (select (content!388 (toList!4505 lt!377854)) (tuple2!10157 lt!377491 lt!377490)))))

(declare-fun e!464405 () Bool)

(assert (=> d!106749 (= lt!377924 e!464405)))

(declare-fun res!566435 () Bool)

(assert (=> d!106749 (=> (not res!566435) (not e!464405))))

(assert (=> d!106749 (= res!566435 ((_ is Cons!15945) (toList!4505 lt!377854)))))

(assert (=> d!106749 (= (contains!4212 (toList!4505 lt!377854) (tuple2!10157 lt!377491 lt!377490)) lt!377924)))

(declare-fun b!832685 () Bool)

(declare-fun e!464404 () Bool)

(assert (=> b!832685 (= e!464405 e!464404)))

(declare-fun res!566434 () Bool)

(assert (=> b!832685 (=> res!566434 e!464404)))

(assert (=> b!832685 (= res!566434 (= (h!17075 (toList!4505 lt!377854)) (tuple2!10157 lt!377491 lt!377490)))))

(declare-fun b!832686 () Bool)

(assert (=> b!832686 (= e!464404 (contains!4212 (t!22317 (toList!4505 lt!377854)) (tuple2!10157 lt!377491 lt!377490)))))

(assert (= (and d!106749 res!566435) b!832685))

(assert (= (and b!832685 (not res!566434)) b!832686))

(declare-fun m!777107 () Bool)

(assert (=> d!106749 m!777107))

(declare-fun m!777109 () Bool)

(assert (=> d!106749 m!777109))

(declare-fun m!777111 () Bool)

(assert (=> b!832686 m!777111))

(assert (=> b!832423 d!106749))

(declare-fun b!832687 () Bool)

(declare-fun e!464407 () Bool)

(declare-fun call!36449 () Bool)

(assert (=> b!832687 (= e!464407 call!36449)))

(declare-fun b!832688 () Bool)

(declare-fun e!464408 () Bool)

(assert (=> b!832688 (= e!464408 call!36449)))

(declare-fun d!106751 () Bool)

(declare-fun res!566436 () Bool)

(declare-fun e!464406 () Bool)

(assert (=> d!106751 (=> res!566436 e!464406)))

(assert (=> d!106751 (= res!566436 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!106751 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312) e!464406)))

(declare-fun bm!36446 () Bool)

(assert (=> bm!36446 (= call!36449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!832689 () Bool)

(assert (=> b!832689 (= e!464408 e!464407)))

(declare-fun lt!377927 () (_ BitVec 64))

(assert (=> b!832689 (= lt!377927 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!377925 () Unit!28493)

(assert (=> b!832689 (= lt!377925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377927 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!832689 (arrayContainsKey!0 _keys!976 lt!377927 #b00000000000000000000000000000000)))

(declare-fun lt!377926 () Unit!28493)

(assert (=> b!832689 (= lt!377926 lt!377925)))

(declare-fun res!566437 () Bool)

(assert (=> b!832689 (= res!566437 (= (seekEntryOrOpen!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8745 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!832689 (=> (not res!566437) (not e!464407))))

(declare-fun b!832690 () Bool)

(assert (=> b!832690 (= e!464406 e!464408)))

(declare-fun c!90577 () Bool)

(assert (=> b!832690 (= c!90577 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!106751 (not res!566436)) b!832690))

(assert (= (and b!832690 c!90577) b!832689))

(assert (= (and b!832690 (not c!90577)) b!832688))

(assert (= (and b!832689 res!566437) b!832687))

(assert (= (or b!832687 b!832688) bm!36446))

(declare-fun m!777113 () Bool)

(assert (=> bm!36446 m!777113))

(declare-fun m!777115 () Bool)

(assert (=> b!832689 m!777115))

(declare-fun m!777117 () Bool)

(assert (=> b!832689 m!777117))

(declare-fun m!777119 () Bool)

(assert (=> b!832689 m!777119))

(assert (=> b!832689 m!777115))

(declare-fun m!777121 () Bool)

(assert (=> b!832689 m!777121))

(assert (=> b!832690 m!777115))

(assert (=> b!832690 m!777115))

(declare-fun m!777123 () Bool)

(assert (=> b!832690 m!777123))

(assert (=> bm!36408 d!106751))

(declare-fun b!832693 () Bool)

(declare-fun e!464410 () Option!422)

(assert (=> b!832693 (= e!464410 (getValueByKey!416 (t!22317 (toList!4505 lt!377678)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832692 () Bool)

(declare-fun e!464409 () Option!422)

(assert (=> b!832692 (= e!464409 e!464410)))

(declare-fun c!90579 () Bool)

(assert (=> b!832692 (= c!90579 (and ((_ is Cons!15945) (toList!4505 lt!377678)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377678))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832694 () Bool)

(assert (=> b!832694 (= e!464410 None!420)))

(declare-fun b!832691 () Bool)

(assert (=> b!832691 (= e!464409 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377678)))))))

(declare-fun d!106753 () Bool)

(declare-fun c!90578 () Bool)

(assert (=> d!106753 (= c!90578 (and ((_ is Cons!15945) (toList!4505 lt!377678)) (= (_1!5089 (h!17075 (toList!4505 lt!377678))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106753 (= (getValueByKey!416 (toList!4505 lt!377678) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464409)))

(assert (= (and d!106753 c!90578) b!832691))

(assert (= (and d!106753 (not c!90578)) b!832692))

(assert (= (and b!832692 c!90579) b!832693))

(assert (= (and b!832692 (not c!90579)) b!832694))

(declare-fun m!777125 () Bool)

(assert (=> b!832693 m!777125))

(assert (=> b!832106 d!106753))

(declare-fun d!106755 () Bool)

(declare-fun e!464411 () Bool)

(assert (=> d!106755 e!464411))

(declare-fun res!566438 () Bool)

(assert (=> d!106755 (=> res!566438 e!464411)))

(declare-fun lt!377931 () Bool)

(assert (=> d!106755 (= res!566438 (not lt!377931))))

(declare-fun lt!377930 () Bool)

(assert (=> d!106755 (= lt!377931 lt!377930)))

(declare-fun lt!377929 () Unit!28493)

(declare-fun e!464412 () Unit!28493)

(assert (=> d!106755 (= lt!377929 e!464412)))

(declare-fun c!90580 () Bool)

(assert (=> d!106755 (= c!90580 lt!377930)))

(assert (=> d!106755 (= lt!377930 (containsKey!402 (toList!4505 lt!377672) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106755 (= (contains!4211 lt!377672 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377931)))

(declare-fun b!832695 () Bool)

(declare-fun lt!377928 () Unit!28493)

(assert (=> b!832695 (= e!464412 lt!377928)))

(assert (=> b!832695 (= lt!377928 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377672) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832695 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377672) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832696 () Bool)

(declare-fun Unit!28529 () Unit!28493)

(assert (=> b!832696 (= e!464412 Unit!28529)))

(declare-fun b!832697 () Bool)

(assert (=> b!832697 (= e!464411 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377672) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106755 c!90580) b!832695))

(assert (= (and d!106755 (not c!90580)) b!832696))

(assert (= (and d!106755 (not res!566438)) b!832697))

(declare-fun m!777127 () Bool)

(assert (=> d!106755 m!777127))

(declare-fun m!777129 () Bool)

(assert (=> b!832695 m!777129))

(declare-fun m!777131 () Bool)

(assert (=> b!832695 m!777131))

(assert (=> b!832695 m!777131))

(declare-fun m!777133 () Bool)

(assert (=> b!832695 m!777133))

(assert (=> b!832697 m!777131))

(assert (=> b!832697 m!777131))

(assert (=> b!832697 m!777133))

(assert (=> b!832105 d!106755))

(declare-fun d!106757 () Bool)

(declare-fun lt!377932 () Bool)

(assert (=> d!106757 (= lt!377932 (select (content!388 lt!377785) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun e!464414 () Bool)

(assert (=> d!106757 (= lt!377932 e!464414)))

(declare-fun res!566440 () Bool)

(assert (=> d!106757 (=> (not res!566440) (not e!464414))))

(assert (=> d!106757 (= res!566440 ((_ is Cons!15945) lt!377785))))

(assert (=> d!106757 (= (contains!4212 lt!377785 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))) lt!377932)))

(declare-fun b!832698 () Bool)

(declare-fun e!464413 () Bool)

(assert (=> b!832698 (= e!464414 e!464413)))

(declare-fun res!566439 () Bool)

(assert (=> b!832698 (=> res!566439 e!464413)))

(assert (=> b!832698 (= res!566439 (= (h!17075 lt!377785) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!832699 () Bool)

(assert (=> b!832699 (= e!464413 (contains!4212 (t!22317 lt!377785) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(assert (= (and d!106757 res!566440) b!832698))

(assert (= (and b!832698 (not res!566439)) b!832699))

(declare-fun m!777135 () Bool)

(assert (=> d!106757 m!777135))

(declare-fun m!777137 () Bool)

(assert (=> d!106757 m!777137))

(declare-fun m!777139 () Bool)

(assert (=> b!832699 m!777139))

(assert (=> b!832324 d!106757))

(declare-fun d!106759 () Bool)

(declare-fun res!566441 () Bool)

(declare-fun e!464415 () Bool)

(assert (=> d!106759 (=> res!566441 e!464415)))

(assert (=> d!106759 (= res!566441 (and ((_ is Cons!15945) lt!377508) (= (_1!5089 (h!17075 lt!377508)) (_1!5089 lt!377428))))))

(assert (=> d!106759 (= (containsKey!402 lt!377508 (_1!5089 lt!377428)) e!464415)))

(declare-fun b!832700 () Bool)

(declare-fun e!464416 () Bool)

(assert (=> b!832700 (= e!464415 e!464416)))

(declare-fun res!566442 () Bool)

(assert (=> b!832700 (=> (not res!566442) (not e!464416))))

(assert (=> b!832700 (= res!566442 (and (or (not ((_ is Cons!15945) lt!377508)) (bvsle (_1!5089 (h!17075 lt!377508)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377508) (bvslt (_1!5089 (h!17075 lt!377508)) (_1!5089 lt!377428))))))

(declare-fun b!832701 () Bool)

(assert (=> b!832701 (= e!464416 (containsKey!402 (t!22317 lt!377508) (_1!5089 lt!377428)))))

(assert (= (and d!106759 (not res!566441)) b!832700))

(assert (= (and b!832700 res!566442) b!832701))

(declare-fun m!777141 () Bool)

(assert (=> b!832701 m!777141))

(assert (=> b!832398 d!106759))

(declare-fun d!106761 () Bool)

(assert (=> d!106761 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106461 d!106761))

(declare-fun b!832704 () Bool)

(declare-fun e!464418 () Option!422)

(assert (=> b!832704 (= e!464418 (getValueByKey!416 (t!22317 (toList!4505 lt!377580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832703 () Bool)

(declare-fun e!464417 () Option!422)

(assert (=> b!832703 (= e!464417 e!464418)))

(declare-fun c!90582 () Bool)

(assert (=> b!832703 (= c!90582 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377580))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832705 () Bool)

(assert (=> b!832705 (= e!464418 None!420)))

(declare-fun b!832702 () Bool)

(assert (=> b!832702 (= e!464417 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377580)))))))

(declare-fun d!106763 () Bool)

(declare-fun c!90581 () Bool)

(assert (=> d!106763 (= c!90581 (and ((_ is Cons!15945) (toList!4505 lt!377580)) (= (_1!5089 (h!17075 (toList!4505 lt!377580))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106763 (= (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000) e!464417)))

(assert (= (and d!106763 c!90581) b!832702))

(assert (= (and d!106763 (not c!90581)) b!832703))

(assert (= (and b!832703 c!90582) b!832704))

(assert (= (and b!832703 (not c!90582)) b!832705))

(declare-fun m!777143 () Bool)

(assert (=> b!832704 m!777143))

(assert (=> d!106461 d!106763))

(declare-fun d!106765 () Bool)

(assert (=> d!106765 (= ($colon$colon!537 e!464146 (ite c!90446 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))) (Cons!15945 (ite c!90446 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) e!464146))))

(assert (=> bm!36414 d!106765))

(declare-fun b!832708 () Bool)

(declare-fun e!464420 () Option!422)

(assert (=> b!832708 (= e!464420 (getValueByKey!416 (t!22317 (t!22317 lt!377612)) (_1!5089 lt!377428)))))

(declare-fun b!832707 () Bool)

(declare-fun e!464419 () Option!422)

(assert (=> b!832707 (= e!464419 e!464420)))

(declare-fun c!90584 () Bool)

(assert (=> b!832707 (= c!90584 (and ((_ is Cons!15945) (t!22317 lt!377612)) (not (= (_1!5089 (h!17075 (t!22317 lt!377612))) (_1!5089 lt!377428)))))))

(declare-fun b!832709 () Bool)

(assert (=> b!832709 (= e!464420 None!420)))

(declare-fun b!832706 () Bool)

(assert (=> b!832706 (= e!464419 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377612)))))))

(declare-fun d!106767 () Bool)

(declare-fun c!90583 () Bool)

(assert (=> d!106767 (= c!90583 (and ((_ is Cons!15945) (t!22317 lt!377612)) (= (_1!5089 (h!17075 (t!22317 lt!377612))) (_1!5089 lt!377428))))))

(assert (=> d!106767 (= (getValueByKey!416 (t!22317 lt!377612) (_1!5089 lt!377428)) e!464419)))

(assert (= (and d!106767 c!90583) b!832706))

(assert (= (and d!106767 (not c!90583)) b!832707))

(assert (= (and b!832707 c!90584) b!832708))

(assert (= (and b!832707 (not c!90584)) b!832709))

(declare-fun m!777145 () Bool)

(assert (=> b!832708 m!777145))

(assert (=> b!832256 d!106767))

(declare-fun d!106769 () Bool)

(assert (=> d!106769 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23298 () Bool)

(assert (= bs!23298 d!106769))

(assert (=> bs!23298 m!776681))

(declare-fun m!777147 () Bool)

(assert (=> bs!23298 m!777147))

(assert (=> b!832376 d!106769))

(declare-fun b!832712 () Bool)

(declare-fun e!464422 () Option!422)

(assert (=> b!832712 (= e!464422 (getValueByKey!416 (t!22317 (toList!4505 lt!377494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832711 () Bool)

(declare-fun e!464421 () Option!422)

(assert (=> b!832711 (= e!464421 e!464422)))

(declare-fun c!90586 () Bool)

(assert (=> b!832711 (= c!90586 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377494))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832713 () Bool)

(assert (=> b!832713 (= e!464422 None!420)))

(declare-fun b!832710 () Bool)

(assert (=> b!832710 (= e!464421 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377494)))))))

(declare-fun d!106771 () Bool)

(declare-fun c!90585 () Bool)

(assert (=> d!106771 (= c!90585 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (= (_1!5089 (h!17075 (toList!4505 lt!377494))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106771 (= (getValueByKey!416 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000) e!464421)))

(assert (= (and d!106771 c!90585) b!832710))

(assert (= (and d!106771 (not c!90585)) b!832711))

(assert (= (and b!832711 c!90586) b!832712))

(assert (= (and b!832711 (not c!90586)) b!832713))

(declare-fun m!777149 () Bool)

(assert (=> b!832712 m!777149))

(assert (=> b!832376 d!106771))

(assert (=> d!106491 d!106509))

(declare-fun d!106773 () Bool)

(declare-fun e!464423 () Bool)

(assert (=> d!106773 e!464423))

(declare-fun res!566443 () Bool)

(assert (=> d!106773 (=> res!566443 e!464423)))

(declare-fun lt!377936 () Bool)

(assert (=> d!106773 (= res!566443 (not lt!377936))))

(declare-fun lt!377935 () Bool)

(assert (=> d!106773 (= lt!377936 lt!377935)))

(declare-fun lt!377934 () Unit!28493)

(declare-fun e!464424 () Unit!28493)

(assert (=> d!106773 (= lt!377934 e!464424)))

(declare-fun c!90587 () Bool)

(assert (=> d!106773 (= c!90587 lt!377935)))

(assert (=> d!106773 (= lt!377935 (containsKey!402 (toList!4505 lt!377561) lt!377574))))

(assert (=> d!106773 (= (contains!4211 lt!377561 lt!377574) lt!377936)))

(declare-fun b!832714 () Bool)

(declare-fun lt!377933 () Unit!28493)

(assert (=> b!832714 (= e!464424 lt!377933)))

(assert (=> b!832714 (= lt!377933 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377561) lt!377574))))

(assert (=> b!832714 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377561) lt!377574))))

(declare-fun b!832715 () Bool)

(declare-fun Unit!28530 () Unit!28493)

(assert (=> b!832715 (= e!464424 Unit!28530)))

(declare-fun b!832716 () Bool)

(assert (=> b!832716 (= e!464423 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377561) lt!377574)))))

(assert (= (and d!106773 c!90587) b!832714))

(assert (= (and d!106773 (not c!90587)) b!832715))

(assert (= (and d!106773 (not res!566443)) b!832716))

(declare-fun m!777151 () Bool)

(assert (=> d!106773 m!777151))

(declare-fun m!777153 () Bool)

(assert (=> b!832714 m!777153))

(assert (=> b!832714 m!776599))

(assert (=> b!832714 m!776599))

(declare-fun m!777155 () Bool)

(assert (=> b!832714 m!777155))

(assert (=> b!832716 m!776599))

(assert (=> b!832716 m!776599))

(assert (=> b!832716 m!777155))

(assert (=> d!106491 d!106773))

(assert (=> d!106491 d!106499))

(assert (=> d!106491 d!106493))

(declare-fun d!106775 () Bool)

(assert (=> d!106775 (= (apply!373 (+!1983 lt!377561 (tuple2!10157 lt!377560 zeroValueBefore!34)) lt!377574) (apply!373 lt!377561 lt!377574))))

(assert (=> d!106775 true))

(declare-fun _$34!1152 () Unit!28493)

(assert (=> d!106775 (= (choose!1424 lt!377561 lt!377560 zeroValueBefore!34 lt!377574) _$34!1152)))

(declare-fun bs!23299 () Bool)

(assert (= bs!23299 d!106775))

(assert (=> bs!23299 m!775873))

(assert (=> bs!23299 m!775873))

(assert (=> bs!23299 m!775887))

(assert (=> bs!23299 m!775879))

(assert (=> d!106491 d!106775))

(declare-fun d!106777 () Bool)

(declare-fun lt!377937 () Bool)

(assert (=> d!106777 (= lt!377937 (select (content!389 (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!464426 () Bool)

(assert (=> d!106777 (= lt!377937 e!464426)))

(declare-fun res!566445 () Bool)

(assert (=> d!106777 (=> (not res!566445) (not e!464426))))

(assert (=> d!106777 (= res!566445 ((_ is Cons!15946) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)))))

(assert (=> d!106777 (= (contains!4213 (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377937)))

(declare-fun b!832717 () Bool)

(declare-fun e!464425 () Bool)

(assert (=> b!832717 (= e!464426 e!464425)))

(declare-fun res!566444 () Bool)

(assert (=> b!832717 (=> res!566444 e!464425)))

(assert (=> b!832717 (= res!566444 (= (h!17076 (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832718 () Bool)

(assert (=> b!832718 (= e!464425 (contains!4213 (t!22318 (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106777 res!566445) b!832717))

(assert (= (and b!832717 (not res!566444)) b!832718))

(declare-fun m!777157 () Bool)

(assert (=> d!106777 m!777157))

(assert (=> d!106777 m!776103))

(declare-fun m!777159 () Bool)

(assert (=> d!106777 m!777159))

(assert (=> b!832718 m!776103))

(declare-fun m!777161 () Bool)

(assert (=> b!832718 m!777161))

(assert (=> b!832082 d!106777))

(declare-fun d!106779 () Bool)

(assert (=> d!106779 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493))))

(declare-fun lt!377938 () Unit!28493)

(assert (=> d!106779 (= lt!377938 (choose!1427 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493))))

(declare-fun e!464427 () Bool)

(assert (=> d!106779 e!464427))

(declare-fun res!566446 () Bool)

(assert (=> d!106779 (=> (not res!566446) (not e!464427))))

(assert (=> d!106779 (= res!566446 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))))))

(assert (=> d!106779 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493) lt!377938)))

(declare-fun b!832719 () Bool)

(assert (=> b!832719 (= e!464427 (containsKey!402 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493))))

(assert (= (and d!106779 res!566446) b!832719))

(assert (=> d!106779 m!776801))

(assert (=> d!106779 m!776801))

(assert (=> d!106779 m!776803))

(declare-fun m!777163 () Bool)

(assert (=> d!106779 m!777163))

(declare-fun m!777165 () Bool)

(assert (=> d!106779 m!777165))

(assert (=> b!832719 m!776797))

(assert (=> b!832425 d!106779))

(assert (=> b!832425 d!106589))

(assert (=> b!832425 d!106591))

(declare-fun d!106781 () Bool)

(assert (=> d!106781 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377613) (_1!5089 lt!377428)))))

(declare-fun lt!377939 () Unit!28493)

(assert (=> d!106781 (= lt!377939 (choose!1427 (toList!4505 lt!377613) (_1!5089 lt!377428)))))

(declare-fun e!464428 () Bool)

(assert (=> d!106781 e!464428))

(declare-fun res!566447 () Bool)

(assert (=> d!106781 (=> (not res!566447) (not e!464428))))

(assert (=> d!106781 (= res!566447 (isStrictlySorted!442 (toList!4505 lt!377613)))))

(assert (=> d!106781 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377613) (_1!5089 lt!377428)) lt!377939)))

(declare-fun b!832720 () Bool)

(assert (=> b!832720 (= e!464428 (containsKey!402 (toList!4505 lt!377613) (_1!5089 lt!377428)))))

(assert (= (and d!106781 res!566447) b!832720))

(assert (=> d!106781 m!775995))

(assert (=> d!106781 m!775995))

(assert (=> d!106781 m!776425))

(declare-fun m!777167 () Bool)

(assert (=> d!106781 m!777167))

(declare-fun m!777169 () Bool)

(assert (=> d!106781 m!777169))

(assert (=> b!832720 m!776421))

(assert (=> b!832251 d!106781))

(declare-fun d!106783 () Bool)

(assert (=> d!106783 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377613) (_1!5089 lt!377428))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377613) (_1!5089 lt!377428)))))))

(declare-fun bs!23300 () Bool)

(assert (= bs!23300 d!106783))

(assert (=> bs!23300 m!775995))

(declare-fun m!777171 () Bool)

(assert (=> bs!23300 m!777171))

(assert (=> b!832251 d!106783))

(assert (=> b!832251 d!106467))

(declare-fun d!106785 () Bool)

(declare-fun res!566448 () Bool)

(declare-fun e!464429 () Bool)

(assert (=> d!106785 (=> res!566448 e!464429)))

(assert (=> d!106785 (= res!566448 (and ((_ is Cons!15945) (toList!4505 lt!377461)) (= (_1!5089 (h!17075 (toList!4505 lt!377461))) (_1!5089 lt!377425))))))

(assert (=> d!106785 (= (containsKey!402 (toList!4505 lt!377461) (_1!5089 lt!377425)) e!464429)))

(declare-fun b!832721 () Bool)

(declare-fun e!464430 () Bool)

(assert (=> b!832721 (= e!464429 e!464430)))

(declare-fun res!566449 () Bool)

(assert (=> b!832721 (=> (not res!566449) (not e!464430))))

(assert (=> b!832721 (= res!566449 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377461))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377461))) (_1!5089 lt!377425))) ((_ is Cons!15945) (toList!4505 lt!377461)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377461))) (_1!5089 lt!377425))))))

(declare-fun b!832722 () Bool)

(assert (=> b!832722 (= e!464430 (containsKey!402 (t!22317 (toList!4505 lt!377461)) (_1!5089 lt!377425)))))

(assert (= (and d!106785 (not res!566448)) b!832721))

(assert (= (and b!832721 res!566449) b!832722))

(declare-fun m!777173 () Bool)

(assert (=> b!832722 m!777173))

(assert (=> d!106521 d!106785))

(declare-fun d!106787 () Bool)

(declare-fun res!566450 () Bool)

(declare-fun e!464431 () Bool)

(assert (=> d!106787 (=> res!566450 e!464431)))

(assert (=> d!106787 (= res!566450 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (= (_1!5089 (h!17075 (toList!4505 lt!377487))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106787 (= (containsKey!402 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000) e!464431)))

(declare-fun b!832723 () Bool)

(declare-fun e!464432 () Bool)

(assert (=> b!832723 (= e!464431 e!464432)))

(declare-fun res!566451 () Bool)

(assert (=> b!832723 (=> (not res!566451) (not e!464432))))

(assert (=> b!832723 (= res!566451 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377487))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377487))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377487)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377487))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832724 () Bool)

(assert (=> b!832724 (= e!464432 (containsKey!402 (t!22317 (toList!4505 lt!377487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106787 (not res!566450)) b!832723))

(assert (= (and b!832723 res!566451) b!832724))

(declare-fun m!777175 () Bool)

(assert (=> b!832724 m!777175))

(assert (=> d!106369 d!106787))

(declare-fun d!106789 () Bool)

(declare-fun res!566452 () Bool)

(declare-fun e!464433 () Bool)

(assert (=> d!106789 (=> res!566452 e!464433)))

(assert (=> d!106789 (= res!566452 (and ((_ is Cons!15945) lt!377779) (= (_1!5089 (h!17075 lt!377779)) (_1!5089 lt!377428))))))

(assert (=> d!106789 (= (containsKey!402 lt!377779 (_1!5089 lt!377428)) e!464433)))

(declare-fun b!832725 () Bool)

(declare-fun e!464434 () Bool)

(assert (=> b!832725 (= e!464433 e!464434)))

(declare-fun res!566453 () Bool)

(assert (=> b!832725 (=> (not res!566453) (not e!464434))))

(assert (=> b!832725 (= res!566453 (and (or (not ((_ is Cons!15945) lt!377779)) (bvsle (_1!5089 (h!17075 lt!377779)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377779) (bvslt (_1!5089 (h!17075 lt!377779)) (_1!5089 lt!377428))))))

(declare-fun b!832726 () Bool)

(assert (=> b!832726 (= e!464434 (containsKey!402 (t!22317 lt!377779) (_1!5089 lt!377428)))))

(assert (= (and d!106789 (not res!566452)) b!832725))

(assert (= (and b!832725 res!566453) b!832726))

(declare-fun m!777177 () Bool)

(assert (=> b!832726 m!777177))

(assert (=> b!832301 d!106789))

(declare-fun d!106791 () Bool)

(declare-fun lt!377940 () Bool)

(assert (=> d!106791 (= lt!377940 (select (content!388 (toList!4505 lt!377697)) (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464436 () Bool)

(assert (=> d!106791 (= lt!377940 e!464436)))

(declare-fun res!566455 () Bool)

(assert (=> d!106791 (=> (not res!566455) (not e!464436))))

(assert (=> d!106791 (= res!566455 ((_ is Cons!15945) (toList!4505 lt!377697)))))

(assert (=> d!106791 (= (contains!4212 (toList!4505 lt!377697) (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377940)))

(declare-fun b!832727 () Bool)

(declare-fun e!464435 () Bool)

(assert (=> b!832727 (= e!464436 e!464435)))

(declare-fun res!566454 () Bool)

(assert (=> b!832727 (=> res!566454 e!464435)))

(assert (=> b!832727 (= res!566454 (= (h!17075 (toList!4505 lt!377697)) (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832728 () Bool)

(assert (=> b!832728 (= e!464435 (contains!4212 (t!22317 (toList!4505 lt!377697)) (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106791 res!566455) b!832727))

(assert (= (and b!832727 (not res!566454)) b!832728))

(declare-fun m!777179 () Bool)

(assert (=> d!106791 m!777179))

(declare-fun m!777181 () Bool)

(assert (=> d!106791 m!777181))

(declare-fun m!777183 () Bool)

(assert (=> b!832728 m!777183))

(assert (=> b!832165 d!106791))

(declare-fun d!106793 () Bool)

(assert (=> d!106793 (= (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754))) lt!377569)) (v!10101 (getValueByKey!416 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754))) lt!377569)))))

(assert (=> d!106505 d!106793))

(declare-fun e!464438 () Option!422)

(declare-fun b!832731 () Bool)

(assert (=> b!832731 (= e!464438 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)))) lt!377569))))

(declare-fun b!832730 () Bool)

(declare-fun e!464437 () Option!422)

(assert (=> b!832730 (= e!464437 e!464438)))

(declare-fun c!90589 () Bool)

(assert (=> b!832730 (= c!90589 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754))))) lt!377569))))))

(declare-fun b!832732 () Bool)

(assert (=> b!832732 (= e!464438 None!420)))

(declare-fun b!832729 () Bool)

(assert (=> b!832729 (= e!464437 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)))))))))

(declare-fun d!106795 () Bool)

(declare-fun c!90588 () Bool)

(assert (=> d!106795 (= c!90588 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754))))) lt!377569)))))

(assert (=> d!106795 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754))) lt!377569) e!464437)))

(assert (= (and d!106795 c!90588) b!832729))

(assert (= (and d!106795 (not c!90588)) b!832730))

(assert (= (and b!832730 c!90589) b!832731))

(assert (= (and b!832730 (not c!90589)) b!832732))

(declare-fun m!777185 () Bool)

(assert (=> b!832731 m!777185))

(assert (=> d!106505 d!106795))

(declare-fun b!832735 () Bool)

(declare-fun e!464440 () Option!422)

(assert (=> b!832735 (= e!464440 (getValueByKey!416 (t!22317 (toList!4505 lt!377773)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832734 () Bool)

(declare-fun e!464439 () Option!422)

(assert (=> b!832734 (= e!464439 e!464440)))

(declare-fun c!90591 () Bool)

(assert (=> b!832734 (= c!90591 (and ((_ is Cons!15945) (toList!4505 lt!377773)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377773))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832736 () Bool)

(assert (=> b!832736 (= e!464440 None!420)))

(declare-fun b!832733 () Bool)

(assert (=> b!832733 (= e!464439 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377773)))))))

(declare-fun d!106797 () Bool)

(declare-fun c!90590 () Bool)

(assert (=> d!106797 (= c!90590 (and ((_ is Cons!15945) (toList!4505 lt!377773)) (= (_1!5089 (h!17075 (toList!4505 lt!377773))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106797 (= (getValueByKey!416 (toList!4505 lt!377773) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464439)))

(assert (= (and d!106797 c!90590) b!832733))

(assert (= (and d!106797 (not c!90590)) b!832734))

(assert (= (and b!832734 c!90591) b!832735))

(assert (= (and b!832734 (not c!90591)) b!832736))

(declare-fun m!777187 () Bool)

(assert (=> b!832735 m!777187))

(assert (=> b!832286 d!106797))

(declare-fun b!832739 () Bool)

(declare-fun e!464442 () Option!422)

(assert (=> b!832739 (= e!464442 (getValueByKey!416 (t!22317 (toList!4505 lt!377725)) (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun b!832738 () Bool)

(declare-fun e!464441 () Option!422)

(assert (=> b!832738 (= e!464441 e!464442)))

(declare-fun c!90593 () Bool)

(assert (=> b!832738 (= c!90593 (and ((_ is Cons!15945) (toList!4505 lt!377725)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377725))) (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))))

(declare-fun b!832740 () Bool)

(assert (=> b!832740 (= e!464442 None!420)))

(declare-fun b!832737 () Bool)

(assert (=> b!832737 (= e!464441 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377725)))))))

(declare-fun c!90592 () Bool)

(declare-fun d!106799 () Bool)

(assert (=> d!106799 (= c!90592 (and ((_ is Cons!15945) (toList!4505 lt!377725)) (= (_1!5089 (h!17075 (toList!4505 lt!377725))) (_1!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(assert (=> d!106799 (= (getValueByKey!416 (toList!4505 lt!377725) (_1!5089 (tuple2!10157 lt!377585 minValue!754))) e!464441)))

(assert (= (and d!106799 c!90592) b!832737))

(assert (= (and d!106799 (not c!90592)) b!832738))

(assert (= (and b!832738 c!90593) b!832739))

(assert (= (and b!832738 (not c!90593)) b!832740))

(declare-fun m!777189 () Bool)

(assert (=> b!832739 m!777189))

(assert (=> b!832201 d!106799))

(declare-fun d!106801 () Bool)

(assert (=> d!106801 (= (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754))) lt!377589)) (v!10101 (getValueByKey!416 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754))) lt!377589)))))

(assert (=> d!106423 d!106801))

(declare-fun b!832743 () Bool)

(declare-fun e!464444 () Option!422)

(assert (=> b!832743 (= e!464444 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)))) lt!377589))))

(declare-fun b!832742 () Bool)

(declare-fun e!464443 () Option!422)

(assert (=> b!832742 (= e!464443 e!464444)))

(declare-fun c!90595 () Bool)

(assert (=> b!832742 (= c!90595 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754))))) lt!377589))))))

(declare-fun b!832744 () Bool)

(assert (=> b!832744 (= e!464444 None!420)))

(declare-fun b!832741 () Bool)

(assert (=> b!832741 (= e!464443 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)))))))))

(declare-fun c!90594 () Bool)

(declare-fun d!106803 () Bool)

(assert (=> d!106803 (= c!90594 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754))))) lt!377589)))))

(assert (=> d!106803 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377598 (tuple2!10157 lt!377585 minValue!754))) lt!377589) e!464443)))

(assert (= (and d!106803 c!90594) b!832741))

(assert (= (and d!106803 (not c!90594)) b!832742))

(assert (= (and b!832742 c!90595) b!832743))

(assert (= (and b!832742 (not c!90595)) b!832744))

(declare-fun m!777191 () Bool)

(assert (=> b!832743 m!777191))

(assert (=> d!106423 d!106803))

(declare-fun e!464446 () Option!422)

(declare-fun b!832747 () Bool)

(assert (=> b!832747 (= e!464446 (getValueByKey!416 (t!22317 (toList!4505 lt!377804)) (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun b!832746 () Bool)

(declare-fun e!464445 () Option!422)

(assert (=> b!832746 (= e!464445 e!464446)))

(declare-fun c!90597 () Bool)

(assert (=> b!832746 (= c!90597 (and ((_ is Cons!15945) (toList!4505 lt!377804)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377804))) (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))))

(declare-fun b!832748 () Bool)

(assert (=> b!832748 (= e!464446 None!420)))

(declare-fun b!832745 () Bool)

(assert (=> b!832745 (= e!464445 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377804)))))))

(declare-fun c!90596 () Bool)

(declare-fun d!106805 () Bool)

(assert (=> d!106805 (= c!90596 (and ((_ is Cons!15945) (toList!4505 lt!377804)) (= (_1!5089 (h!17075 (toList!4505 lt!377804))) (_1!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(assert (=> d!106805 (= (getValueByKey!416 (toList!4505 lt!377804) (_1!5089 (tuple2!10157 lt!377559 minValue!754))) e!464445)))

(assert (= (and d!106805 c!90596) b!832745))

(assert (= (and d!106805 (not c!90596)) b!832746))

(assert (= (and b!832746 c!90597) b!832747))

(assert (= (and b!832746 (not c!90597)) b!832748))

(declare-fun m!777193 () Bool)

(assert (=> b!832747 m!777193))

(assert (=> b!832339 d!106805))

(assert (=> b!832168 d!106633))

(assert (=> b!832168 d!106531))

(declare-fun d!106807 () Bool)

(declare-fun lt!377941 () Bool)

(assert (=> d!106807 (= lt!377941 (select (content!388 (t!22317 (toList!4505 lt!377579))) lt!377425))))

(declare-fun e!464448 () Bool)

(assert (=> d!106807 (= lt!377941 e!464448)))

(declare-fun res!566457 () Bool)

(assert (=> d!106807 (=> (not res!566457) (not e!464448))))

(assert (=> d!106807 (= res!566457 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377579))))))

(assert (=> d!106807 (= (contains!4212 (t!22317 (toList!4505 lt!377579)) lt!377425) lt!377941)))

(declare-fun b!832749 () Bool)

(declare-fun e!464447 () Bool)

(assert (=> b!832749 (= e!464448 e!464447)))

(declare-fun res!566456 () Bool)

(assert (=> b!832749 (=> res!566456 e!464447)))

(assert (=> b!832749 (= res!566456 (= (h!17075 (t!22317 (toList!4505 lt!377579))) lt!377425))))

(declare-fun b!832750 () Bool)

(assert (=> b!832750 (= e!464447 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377579))) lt!377425))))

(assert (= (and d!106807 res!566457) b!832749))

(assert (= (and b!832749 (not res!566456)) b!832750))

(declare-fun m!777195 () Bool)

(assert (=> d!106807 m!777195))

(declare-fun m!777197 () Bool)

(assert (=> d!106807 m!777197))

(declare-fun m!777199 () Bool)

(assert (=> b!832750 m!777199))

(assert (=> b!832163 d!106807))

(declare-fun d!106809 () Bool)

(assert (=> d!106809 (= (get!11825 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10099 (select (arr!22335 _values!788) #b00000000000000000000000000000000)))))

(assert (=> b!832061 d!106809))

(declare-fun d!106811 () Bool)

(assert (=> d!106811 (= (apply!373 lt!377672 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11824 (getValueByKey!416 (toList!4505 lt!377672) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23301 () Bool)

(assert (= bs!23301 d!106811))

(assert (=> bs!23301 m!776103))

(declare-fun m!777201 () Bool)

(assert (=> bs!23301 m!777201))

(assert (=> bs!23301 m!777201))

(declare-fun m!777203 () Bool)

(assert (=> bs!23301 m!777203))

(assert (=> b!832100 d!106811))

(declare-fun d!106813 () Bool)

(declare-fun c!90598 () Bool)

(assert (=> d!106813 (= c!90598 ((_ is ValueCellFull!7191) (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!464449 () V!25285)

(assert (=> d!106813 (= (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!464449)))

(declare-fun b!832751 () Bool)

(assert (=> b!832751 (= e!464449 (get!11825 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832752 () Bool)

(assert (=> b!832752 (= e!464449 (get!11826 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106813 c!90598) b!832751))

(assert (= (and d!106813 (not c!90598)) b!832752))

(assert (=> b!832751 m!776141))

(assert (=> b!832751 m!775801))

(declare-fun m!777205 () Bool)

(assert (=> b!832751 m!777205))

(assert (=> b!832752 m!776141))

(assert (=> b!832752 m!775801))

(declare-fun m!777207 () Bool)

(assert (=> b!832752 m!777207))

(assert (=> b!832100 d!106813))

(assert (=> d!106555 d!106553))

(declare-fun d!106815 () Bool)

(assert (=> d!106815 (= (getValueByKey!416 lt!377508 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!106815 true))

(declare-fun _$22!577 () Unit!28493)

(assert (=> d!106815 (= (choose!1423 lt!377508 (_1!5089 lt!377428) (_2!5089 lt!377428)) _$22!577)))

(declare-fun bs!23302 () Bool)

(assert (= bs!23302 d!106815))

(assert (=> bs!23302 m!775849))

(assert (=> d!106555 d!106815))

(declare-fun d!106817 () Bool)

(declare-fun res!566458 () Bool)

(declare-fun e!464450 () Bool)

(assert (=> d!106817 (=> res!566458 e!464450)))

(assert (=> d!106817 (= res!566458 (or ((_ is Nil!15946) lt!377508) ((_ is Nil!15946) (t!22317 lt!377508))))))

(assert (=> d!106817 (= (isStrictlySorted!442 lt!377508) e!464450)))

(declare-fun b!832753 () Bool)

(declare-fun e!464451 () Bool)

(assert (=> b!832753 (= e!464450 e!464451)))

(declare-fun res!566459 () Bool)

(assert (=> b!832753 (=> (not res!566459) (not e!464451))))

(assert (=> b!832753 (= res!566459 (bvslt (_1!5089 (h!17075 lt!377508)) (_1!5089 (h!17075 (t!22317 lt!377508)))))))

(declare-fun b!832754 () Bool)

(assert (=> b!832754 (= e!464451 (isStrictlySorted!442 (t!22317 lt!377508)))))

(assert (= (and d!106817 (not res!566458)) b!832753))

(assert (= (and b!832753 res!566459) b!832754))

(declare-fun m!777209 () Bool)

(assert (=> b!832754 m!777209))

(assert (=> d!106555 d!106817))

(declare-fun b!832767 () Bool)

(declare-fun e!464460 () SeekEntryResult!8745)

(assert (=> b!832767 (= e!464460 (Found!8745 (index!37353 lt!377640)))))

(declare-fun d!106819 () Bool)

(declare-fun lt!377947 () SeekEntryResult!8745)

(assert (=> d!106819 (and (or ((_ is Undefined!8745) lt!377947) (not ((_ is Found!8745) lt!377947)) (and (bvsge (index!37352 lt!377947) #b00000000000000000000000000000000) (bvslt (index!37352 lt!377947) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377947) ((_ is Found!8745) lt!377947) (not ((_ is MissingVacant!8745) lt!377947)) (not (= (index!37354 lt!377947) (index!37353 lt!377640))) (and (bvsge (index!37354 lt!377947) #b00000000000000000000000000000000) (bvslt (index!37354 lt!377947) (size!22755 _keys!976)))) (or ((_ is Undefined!8745) lt!377947) (ite ((_ is Found!8745) lt!377947) (= (select (arr!22334 _keys!976) (index!37352 lt!377947)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!8745) lt!377947) (= (index!37354 lt!377947) (index!37353 lt!377640)) (= (select (arr!22334 _keys!976) (index!37354 lt!377947)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!464458 () SeekEntryResult!8745)

(assert (=> d!106819 (= lt!377947 e!464458)))

(declare-fun c!90606 () Bool)

(assert (=> d!106819 (= c!90606 (bvsge (x!70140 lt!377640) #b01111111111111111111111111111110))))

(declare-fun lt!377946 () (_ BitVec 64))

(assert (=> d!106819 (= lt!377946 (select (arr!22334 _keys!976) (index!37353 lt!377640)))))

(assert (=> d!106819 (validMask!0 mask!1312)))

(assert (=> d!106819 (= (seekKeyOrZeroReturnVacant!0 (x!70140 lt!377640) (index!37353 lt!377640) (index!37353 lt!377640) (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377947)))

(declare-fun b!832768 () Bool)

(declare-fun e!464459 () SeekEntryResult!8745)

(assert (=> b!832768 (= e!464459 (MissingVacant!8745 (index!37353 lt!377640)))))

(declare-fun b!832769 () Bool)

(assert (=> b!832769 (= e!464458 e!464460)))

(declare-fun c!90607 () Bool)

(assert (=> b!832769 (= c!90607 (= lt!377946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832770 () Bool)

(assert (=> b!832770 (= e!464458 Undefined!8745)))

(declare-fun b!832771 () Bool)

(declare-fun c!90605 () Bool)

(assert (=> b!832771 (= c!90605 (= lt!377946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832771 (= e!464460 e!464459)))

(declare-fun b!832772 () Bool)

(assert (=> b!832772 (= e!464459 (seekKeyOrZeroReturnVacant!0 (bvadd (x!70140 lt!377640) #b00000000000000000000000000000001) (nextIndex!0 (index!37353 lt!377640) (x!70140 lt!377640) mask!1312) (index!37353 lt!377640) (select (arr!22334 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (= (and d!106819 c!90606) b!832770))

(assert (= (and d!106819 (not c!90606)) b!832769))

(assert (= (and b!832769 c!90607) b!832767))

(assert (= (and b!832769 (not c!90607)) b!832771))

(assert (= (and b!832771 c!90605) b!832768))

(assert (= (and b!832771 (not c!90605)) b!832772))

(declare-fun m!777211 () Bool)

(assert (=> d!106819 m!777211))

(declare-fun m!777213 () Bool)

(assert (=> d!106819 m!777213))

(assert (=> d!106819 m!776031))

(assert (=> d!106819 m!775715))

(declare-fun m!777215 () Bool)

(assert (=> b!832772 m!777215))

(assert (=> b!832772 m!777215))

(assert (=> b!832772 m!775791))

(declare-fun m!777217 () Bool)

(assert (=> b!832772 m!777217))

(assert (=> b!832056 d!106819))

(declare-fun d!106821 () Bool)

(declare-fun res!566460 () Bool)

(declare-fun e!464461 () Bool)

(assert (=> d!106821 (=> res!566460 e!464461)))

(assert (=> d!106821 (= res!566460 (and ((_ is Cons!15945) lt!377785) (= (_1!5089 (h!17075 lt!377785)) (_1!5089 lt!377425))))))

(assert (=> d!106821 (= (containsKey!402 lt!377785 (_1!5089 lt!377425)) e!464461)))

(declare-fun b!832773 () Bool)

(declare-fun e!464462 () Bool)

(assert (=> b!832773 (= e!464461 e!464462)))

(declare-fun res!566461 () Bool)

(assert (=> b!832773 (=> (not res!566461) (not e!464462))))

(assert (=> b!832773 (= res!566461 (and (or (not ((_ is Cons!15945) lt!377785)) (bvsle (_1!5089 (h!17075 lt!377785)) (_1!5089 lt!377425))) ((_ is Cons!15945) lt!377785) (bvslt (_1!5089 (h!17075 lt!377785)) (_1!5089 lt!377425))))))

(declare-fun b!832774 () Bool)

(assert (=> b!832774 (= e!464462 (containsKey!402 (t!22317 lt!377785) (_1!5089 lt!377425)))))

(assert (= (and d!106821 (not res!566460)) b!832773))

(assert (= (and b!832773 res!566461) b!832774))

(declare-fun m!777219 () Bool)

(assert (=> b!832774 m!777219))

(assert (=> b!832320 d!106821))

(assert (=> b!832234 d!106585))

(assert (=> b!832234 d!106587))

(declare-fun b!832777 () Bool)

(declare-fun e!464464 () Option!422)

(assert (=> b!832777 (= e!464464 (getValueByKey!416 (t!22317 (toList!4505 lt!377711)) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun b!832776 () Bool)

(declare-fun e!464463 () Option!422)

(assert (=> b!832776 (= e!464463 e!464464)))

(declare-fun c!90609 () Bool)

(assert (=> b!832776 (= c!90609 (and ((_ is Cons!15945) (toList!4505 lt!377711)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377711))) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))))

(declare-fun b!832778 () Bool)

(assert (=> b!832778 (= e!464464 None!420)))

(declare-fun b!832775 () Bool)

(assert (=> b!832775 (= e!464463 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377711)))))))

(declare-fun c!90608 () Bool)

(declare-fun d!106823 () Bool)

(assert (=> d!106823 (= c!90608 (and ((_ is Cons!15945) (toList!4505 lt!377711)) (= (_1!5089 (h!17075 (toList!4505 lt!377711))) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(assert (=> d!106823 (= (getValueByKey!416 (toList!4505 lt!377711) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) e!464463)))

(assert (= (and d!106823 c!90608) b!832775))

(assert (= (and d!106823 (not c!90608)) b!832776))

(assert (= (and b!832776 c!90609) b!832777))

(assert (= (and b!832776 (not c!90609)) b!832778))

(declare-fun m!777221 () Bool)

(assert (=> b!832777 m!777221))

(assert (=> b!832191 d!106823))

(declare-fun d!106825 () Bool)

(declare-fun lt!377948 () Bool)

(assert (=> d!106825 (= lt!377948 (select (content!388 (toList!4505 lt!377735)) (tuple2!10157 lt!377594 minValue!754)))))

(declare-fun e!464466 () Bool)

(assert (=> d!106825 (= lt!377948 e!464466)))

(declare-fun res!566463 () Bool)

(assert (=> d!106825 (=> (not res!566463) (not e!464466))))

(assert (=> d!106825 (= res!566463 ((_ is Cons!15945) (toList!4505 lt!377735)))))

(assert (=> d!106825 (= (contains!4212 (toList!4505 lt!377735) (tuple2!10157 lt!377594 minValue!754)) lt!377948)))

(declare-fun b!832779 () Bool)

(declare-fun e!464465 () Bool)

(assert (=> b!832779 (= e!464466 e!464465)))

(declare-fun res!566462 () Bool)

(assert (=> b!832779 (=> res!566462 e!464465)))

(assert (=> b!832779 (= res!566462 (= (h!17075 (toList!4505 lt!377735)) (tuple2!10157 lt!377594 minValue!754)))))

(declare-fun b!832780 () Bool)

(assert (=> b!832780 (= e!464465 (contains!4212 (t!22317 (toList!4505 lt!377735)) (tuple2!10157 lt!377594 minValue!754)))))

(assert (= (and d!106825 res!566463) b!832779))

(assert (= (and b!832779 (not res!566462)) b!832780))

(declare-fun m!777223 () Bool)

(assert (=> d!106825 m!777223))

(declare-fun m!777225 () Bool)

(assert (=> d!106825 m!777225))

(declare-fun m!777227 () Bool)

(assert (=> b!832780 m!777227))

(assert (=> b!832208 d!106825))

(assert (=> b!832161 d!106683))

(assert (=> b!832161 d!106685))

(assert (=> b!832065 d!106689))

(assert (=> b!832065 d!106691))

(declare-fun b!832783 () Bool)

(declare-fun e!464468 () Option!422)

(assert (=> b!832783 (= e!464468 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377609))) (_1!5089 lt!377428)))))

(declare-fun b!832782 () Bool)

(declare-fun e!464467 () Option!422)

(assert (=> b!832782 (= e!464467 e!464468)))

(declare-fun c!90611 () Bool)

(assert (=> b!832782 (= c!90611 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377609))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377609)))) (_1!5089 lt!377428)))))))

(declare-fun b!832784 () Bool)

(assert (=> b!832784 (= e!464468 None!420)))

(declare-fun b!832781 () Bool)

(assert (=> b!832781 (= e!464467 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377609))))))))

(declare-fun d!106827 () Bool)

(declare-fun c!90610 () Bool)

(assert (=> d!106827 (= c!90610 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377609))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377609)))) (_1!5089 lt!377428))))))

(assert (=> d!106827 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377609)) (_1!5089 lt!377428)) e!464467)))

(assert (= (and d!106827 c!90610) b!832781))

(assert (= (and d!106827 (not c!90610)) b!832782))

(assert (= (and b!832782 c!90611) b!832783))

(assert (= (and b!832782 (not c!90611)) b!832784))

(declare-fun m!777229 () Bool)

(assert (=> b!832783 m!777229))

(assert (=> b!832328 d!106827))

(declare-fun d!106829 () Bool)

(declare-fun e!464469 () Bool)

(assert (=> d!106829 e!464469))

(declare-fun res!566464 () Bool)

(assert (=> d!106829 (=> res!566464 e!464469)))

(declare-fun lt!377952 () Bool)

(assert (=> d!106829 (= res!566464 (not lt!377952))))

(declare-fun lt!377951 () Bool)

(assert (=> d!106829 (= lt!377952 lt!377951)))

(declare-fun lt!377950 () Unit!28493)

(declare-fun e!464470 () Unit!28493)

(assert (=> d!106829 (= lt!377950 e!464470)))

(declare-fun c!90612 () Bool)

(assert (=> d!106829 (= c!90612 lt!377951)))

(assert (=> d!106829 (= lt!377951 (containsKey!402 (toList!4505 lt!377863) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106829 (= (contains!4211 lt!377863 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377952)))

(declare-fun b!832785 () Bool)

(declare-fun lt!377949 () Unit!28493)

(assert (=> b!832785 (= e!464470 lt!377949)))

(assert (=> b!832785 (= lt!377949 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377863) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!832785 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377863) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832786 () Bool)

(declare-fun Unit!28531 () Unit!28493)

(assert (=> b!832786 (= e!464470 Unit!28531)))

(declare-fun b!832787 () Bool)

(assert (=> b!832787 (= e!464469 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377863) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106829 c!90612) b!832785))

(assert (= (and d!106829 (not c!90612)) b!832786))

(assert (= (and d!106829 (not res!566464)) b!832787))

(declare-fun m!777231 () Bool)

(assert (=> d!106829 m!777231))

(declare-fun m!777233 () Bool)

(assert (=> b!832785 m!777233))

(assert (=> b!832785 m!776813))

(assert (=> b!832785 m!776813))

(declare-fun m!777235 () Bool)

(assert (=> b!832785 m!777235))

(assert (=> b!832787 m!776813))

(assert (=> b!832787 m!776813))

(assert (=> b!832787 m!777235))

(assert (=> d!106577 d!106829))

(declare-fun b!832790 () Bool)

(declare-fun e!464472 () Option!422)

(assert (=> b!832790 (= e!464472 (getValueByKey!416 (t!22317 lt!377862) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832789 () Bool)

(declare-fun e!464471 () Option!422)

(assert (=> b!832789 (= e!464471 e!464472)))

(declare-fun c!90614 () Bool)

(assert (=> b!832789 (= c!90614 (and ((_ is Cons!15945) lt!377862) (not (= (_1!5089 (h!17075 lt!377862)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832791 () Bool)

(assert (=> b!832791 (= e!464472 None!420)))

(declare-fun b!832788 () Bool)

(assert (=> b!832788 (= e!464471 (Some!421 (_2!5089 (h!17075 lt!377862))))))

(declare-fun c!90613 () Bool)

(declare-fun d!106831 () Bool)

(assert (=> d!106831 (= c!90613 (and ((_ is Cons!15945) lt!377862) (= (_1!5089 (h!17075 lt!377862)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106831 (= (getValueByKey!416 lt!377862 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464471)))

(assert (= (and d!106831 c!90613) b!832788))

(assert (= (and d!106831 (not c!90613)) b!832789))

(assert (= (and b!832789 c!90614) b!832790))

(assert (= (and b!832789 (not c!90614)) b!832791))

(declare-fun m!777237 () Bool)

(assert (=> b!832790 m!777237))

(assert (=> d!106577 d!106831))

(declare-fun d!106833 () Bool)

(assert (=> d!106833 (= (getValueByKey!416 lt!377862 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377953 () Unit!28493)

(assert (=> d!106833 (= lt!377953 (choose!1423 lt!377862 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!464473 () Bool)

(assert (=> d!106833 e!464473))

(declare-fun res!566465 () Bool)

(assert (=> d!106833 (=> (not res!566465) (not e!464473))))

(assert (=> d!106833 (= res!566465 (isStrictlySorted!442 lt!377862))))

(assert (=> d!106833 (= (lemmaContainsTupThenGetReturnValue!230 lt!377862 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377953)))

(declare-fun b!832792 () Bool)

(declare-fun res!566466 () Bool)

(assert (=> b!832792 (=> (not res!566466) (not e!464473))))

(assert (=> b!832792 (= res!566466 (containsKey!402 lt!377862 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832793 () Bool)

(assert (=> b!832793 (= e!464473 (contains!4212 lt!377862 (tuple2!10157 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106833 res!566465) b!832792))

(assert (= (and b!832792 res!566466) b!832793))

(assert (=> d!106833 m!776807))

(declare-fun m!777239 () Bool)

(assert (=> d!106833 m!777239))

(declare-fun m!777241 () Bool)

(assert (=> d!106833 m!777241))

(declare-fun m!777243 () Bool)

(assert (=> b!832792 m!777243))

(declare-fun m!777245 () Bool)

(assert (=> b!832793 m!777245))

(assert (=> d!106577 d!106833))

(declare-fun b!832794 () Bool)

(declare-fun e!464475 () List!15949)

(declare-fun call!36451 () List!15949)

(assert (=> b!832794 (= e!464475 call!36451)))

(declare-fun e!464474 () List!15949)

(declare-fun b!832795 () Bool)

(assert (=> b!832795 (= e!464474 (insertStrictlySorted!269 (t!22317 (toList!4505 call!36362)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!36447 () Bool)

(declare-fun call!36450 () List!15949)

(assert (=> bm!36447 (= call!36451 call!36450)))

(declare-fun b!832796 () Bool)

(assert (=> b!832796 (= e!464475 call!36451)))

(declare-fun c!90615 () Bool)

(declare-fun b!832797 () Bool)

(declare-fun c!90617 () Bool)

(assert (=> b!832797 (= e!464474 (ite c!90617 (t!22317 (toList!4505 call!36362)) (ite c!90615 (Cons!15945 (h!17075 (toList!4505 call!36362)) (t!22317 (toList!4505 call!36362))) Nil!15946)))))

(declare-fun c!90618 () Bool)

(declare-fun call!36452 () List!15949)

(declare-fun bm!36448 () Bool)

(assert (=> bm!36448 (= call!36452 ($colon$colon!537 e!464474 (ite c!90618 (h!17075 (toList!4505 call!36362)) (tuple2!10157 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90616 () Bool)

(assert (=> bm!36448 (= c!90616 c!90618)))

(declare-fun b!832798 () Bool)

(declare-fun res!566468 () Bool)

(declare-fun e!464477 () Bool)

(assert (=> b!832798 (=> (not res!566468) (not e!464477))))

(declare-fun lt!377954 () List!15949)

(assert (=> b!832798 (= res!566468 (containsKey!402 lt!377954 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832799 () Bool)

(declare-fun e!464478 () List!15949)

(assert (=> b!832799 (= e!464478 call!36452)))

(declare-fun b!832800 () Bool)

(assert (=> b!832800 (= c!90615 (and ((_ is Cons!15945) (toList!4505 call!36362)) (bvsgt (_1!5089 (h!17075 (toList!4505 call!36362))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!464476 () List!15949)

(assert (=> b!832800 (= e!464476 e!464475)))

(declare-fun d!106835 () Bool)

(assert (=> d!106835 e!464477))

(declare-fun res!566467 () Bool)

(assert (=> d!106835 (=> (not res!566467) (not e!464477))))

(assert (=> d!106835 (= res!566467 (isStrictlySorted!442 lt!377954))))

(assert (=> d!106835 (= lt!377954 e!464478)))

(assert (=> d!106835 (= c!90618 (and ((_ is Cons!15945) (toList!4505 call!36362)) (bvslt (_1!5089 (h!17075 (toList!4505 call!36362))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106835 (isStrictlySorted!442 (toList!4505 call!36362))))

(assert (=> d!106835 (= (insertStrictlySorted!269 (toList!4505 call!36362) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377954)))

(declare-fun b!832801 () Bool)

(assert (=> b!832801 (= e!464476 call!36450)))

(declare-fun bm!36449 () Bool)

(assert (=> bm!36449 (= call!36450 call!36452)))

(declare-fun b!832802 () Bool)

(assert (=> b!832802 (= e!464477 (contains!4212 lt!377954 (tuple2!10157 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832803 () Bool)

(assert (=> b!832803 (= e!464478 e!464476)))

(assert (=> b!832803 (= c!90617 (and ((_ is Cons!15945) (toList!4505 call!36362)) (= (_1!5089 (h!17075 (toList!4505 call!36362))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106835 c!90618) b!832799))

(assert (= (and d!106835 (not c!90618)) b!832803))

(assert (= (and b!832803 c!90617) b!832801))

(assert (= (and b!832803 (not c!90617)) b!832800))

(assert (= (and b!832800 c!90615) b!832794))

(assert (= (and b!832800 (not c!90615)) b!832796))

(assert (= (or b!832794 b!832796) bm!36447))

(assert (= (or b!832801 bm!36447) bm!36449))

(assert (= (or b!832799 bm!36449) bm!36448))

(assert (= (and bm!36448 c!90616) b!832795))

(assert (= (and bm!36448 (not c!90616)) b!832797))

(assert (= (and d!106835 res!566467) b!832798))

(assert (= (and b!832798 res!566468) b!832802))

(declare-fun m!777247 () Bool)

(assert (=> d!106835 m!777247))

(declare-fun m!777249 () Bool)

(assert (=> d!106835 m!777249))

(declare-fun m!777251 () Bool)

(assert (=> b!832798 m!777251))

(declare-fun m!777253 () Bool)

(assert (=> b!832802 m!777253))

(declare-fun m!777255 () Bool)

(assert (=> bm!36448 m!777255))

(declare-fun m!777257 () Bool)

(assert (=> b!832795 m!777257))

(assert (=> d!106577 d!106835))

(declare-fun d!106837 () Bool)

(declare-fun e!464479 () Bool)

(assert (=> d!106837 e!464479))

(declare-fun res!566469 () Bool)

(assert (=> d!106837 (=> res!566469 e!464479)))

(declare-fun lt!377958 () Bool)

(assert (=> d!106837 (= res!566469 (not lt!377958))))

(declare-fun lt!377957 () Bool)

(assert (=> d!106837 (= lt!377958 lt!377957)))

(declare-fun lt!377956 () Unit!28493)

(declare-fun e!464480 () Unit!28493)

(assert (=> d!106837 (= lt!377956 e!464480)))

(declare-fun c!90619 () Bool)

(assert (=> d!106837 (= c!90619 lt!377957)))

(assert (=> d!106837 (= lt!377957 (containsKey!402 (toList!4505 lt!377842) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106837 (= (contains!4211 lt!377842 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377958)))

(declare-fun b!832804 () Bool)

(declare-fun lt!377955 () Unit!28493)

(assert (=> b!832804 (= e!464480 lt!377955)))

(assert (=> b!832804 (= lt!377955 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377842) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!832804 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377842) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832805 () Bool)

(declare-fun Unit!28532 () Unit!28493)

(assert (=> b!832805 (= e!464480 Unit!28532)))

(declare-fun b!832806 () Bool)

(assert (=> b!832806 (= e!464479 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377842) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106837 c!90619) b!832804))

(assert (= (and d!106837 (not c!90619)) b!832805))

(assert (= (and d!106837 (not res!566469)) b!832806))

(declare-fun m!777259 () Bool)

(assert (=> d!106837 m!777259))

(declare-fun m!777261 () Bool)

(assert (=> b!832804 m!777261))

(assert (=> b!832804 m!776727))

(assert (=> b!832804 m!776727))

(declare-fun m!777263 () Bool)

(assert (=> b!832804 m!777263))

(assert (=> b!832806 m!776727))

(assert (=> b!832806 m!776727))

(assert (=> b!832806 m!777263))

(assert (=> d!106547 d!106837))

(declare-fun b!832809 () Bool)

(declare-fun e!464482 () Option!422)

(assert (=> b!832809 (= e!464482 (getValueByKey!416 (t!22317 lt!377841) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832808 () Bool)

(declare-fun e!464481 () Option!422)

(assert (=> b!832808 (= e!464481 e!464482)))

(declare-fun c!90621 () Bool)

(assert (=> b!832808 (= c!90621 (and ((_ is Cons!15945) lt!377841) (not (= (_1!5089 (h!17075 lt!377841)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832810 () Bool)

(assert (=> b!832810 (= e!464482 None!420)))

(declare-fun b!832807 () Bool)

(assert (=> b!832807 (= e!464481 (Some!421 (_2!5089 (h!17075 lt!377841))))))

(declare-fun c!90620 () Bool)

(declare-fun d!106839 () Bool)

(assert (=> d!106839 (= c!90620 (and ((_ is Cons!15945) lt!377841) (= (_1!5089 (h!17075 lt!377841)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106839 (= (getValueByKey!416 lt!377841 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464481)))

(assert (= (and d!106839 c!90620) b!832807))

(assert (= (and d!106839 (not c!90620)) b!832808))

(assert (= (and b!832808 c!90621) b!832809))

(assert (= (and b!832808 (not c!90621)) b!832810))

(declare-fun m!777265 () Bool)

(assert (=> b!832809 m!777265))

(assert (=> d!106547 d!106839))

(declare-fun d!106841 () Bool)

(assert (=> d!106841 (= (getValueByKey!416 lt!377841 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377959 () Unit!28493)

(assert (=> d!106841 (= lt!377959 (choose!1423 lt!377841 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!464483 () Bool)

(assert (=> d!106841 e!464483))

(declare-fun res!566470 () Bool)

(assert (=> d!106841 (=> (not res!566470) (not e!464483))))

(assert (=> d!106841 (= res!566470 (isStrictlySorted!442 lt!377841))))

(assert (=> d!106841 (= (lemmaContainsTupThenGetReturnValue!230 lt!377841 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377959)))

(declare-fun b!832811 () Bool)

(declare-fun res!566471 () Bool)

(assert (=> b!832811 (=> (not res!566471) (not e!464483))))

(assert (=> b!832811 (= res!566471 (containsKey!402 lt!377841 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832812 () Bool)

(assert (=> b!832812 (= e!464483 (contains!4212 lt!377841 (tuple2!10157 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106841 res!566470) b!832811))

(assert (= (and b!832811 res!566471) b!832812))

(assert (=> d!106841 m!776721))

(declare-fun m!777267 () Bool)

(assert (=> d!106841 m!777267))

(declare-fun m!777269 () Bool)

(assert (=> d!106841 m!777269))

(declare-fun m!777271 () Bool)

(assert (=> b!832811 m!777271))

(declare-fun m!777273 () Bool)

(assert (=> b!832812 m!777273))

(assert (=> d!106547 d!106841))

(declare-fun b!832813 () Bool)

(declare-fun e!464485 () List!15949)

(declare-fun call!36454 () List!15949)

(assert (=> b!832813 (= e!464485 call!36454)))

(declare-fun b!832814 () Bool)

(declare-fun e!464484 () List!15949)

(assert (=> b!832814 (= e!464484 (insertStrictlySorted!269 (t!22317 (toList!4505 call!36361)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!36450 () Bool)

(declare-fun call!36453 () List!15949)

(assert (=> bm!36450 (= call!36454 call!36453)))

(declare-fun b!832815 () Bool)

(assert (=> b!832815 (= e!464485 call!36454)))

(declare-fun c!90624 () Bool)

(declare-fun c!90622 () Bool)

(declare-fun b!832816 () Bool)

(assert (=> b!832816 (= e!464484 (ite c!90624 (t!22317 (toList!4505 call!36361)) (ite c!90622 (Cons!15945 (h!17075 (toList!4505 call!36361)) (t!22317 (toList!4505 call!36361))) Nil!15946)))))

(declare-fun call!36455 () List!15949)

(declare-fun bm!36451 () Bool)

(declare-fun c!90625 () Bool)

(assert (=> bm!36451 (= call!36455 ($colon$colon!537 e!464484 (ite c!90625 (h!17075 (toList!4505 call!36361)) (tuple2!10157 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90623 () Bool)

(assert (=> bm!36451 (= c!90623 c!90625)))

(declare-fun b!832817 () Bool)

(declare-fun res!566473 () Bool)

(declare-fun e!464487 () Bool)

(assert (=> b!832817 (=> (not res!566473) (not e!464487))))

(declare-fun lt!377960 () List!15949)

(assert (=> b!832817 (= res!566473 (containsKey!402 lt!377960 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832818 () Bool)

(declare-fun e!464488 () List!15949)

(assert (=> b!832818 (= e!464488 call!36455)))

(declare-fun b!832819 () Bool)

(assert (=> b!832819 (= c!90622 (and ((_ is Cons!15945) (toList!4505 call!36361)) (bvsgt (_1!5089 (h!17075 (toList!4505 call!36361))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!464486 () List!15949)

(assert (=> b!832819 (= e!464486 e!464485)))

(declare-fun d!106843 () Bool)

(assert (=> d!106843 e!464487))

(declare-fun res!566472 () Bool)

(assert (=> d!106843 (=> (not res!566472) (not e!464487))))

(assert (=> d!106843 (= res!566472 (isStrictlySorted!442 lt!377960))))

(assert (=> d!106843 (= lt!377960 e!464488)))

(assert (=> d!106843 (= c!90625 (and ((_ is Cons!15945) (toList!4505 call!36361)) (bvslt (_1!5089 (h!17075 (toList!4505 call!36361))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106843 (isStrictlySorted!442 (toList!4505 call!36361))))

(assert (=> d!106843 (= (insertStrictlySorted!269 (toList!4505 call!36361) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377960)))

(declare-fun b!832820 () Bool)

(assert (=> b!832820 (= e!464486 call!36453)))

(declare-fun bm!36452 () Bool)

(assert (=> bm!36452 (= call!36453 call!36455)))

(declare-fun b!832821 () Bool)

(assert (=> b!832821 (= e!464487 (contains!4212 lt!377960 (tuple2!10157 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832822 () Bool)

(assert (=> b!832822 (= e!464488 e!464486)))

(assert (=> b!832822 (= c!90624 (and ((_ is Cons!15945) (toList!4505 call!36361)) (= (_1!5089 (h!17075 (toList!4505 call!36361))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106843 c!90625) b!832818))

(assert (= (and d!106843 (not c!90625)) b!832822))

(assert (= (and b!832822 c!90624) b!832820))

(assert (= (and b!832822 (not c!90624)) b!832819))

(assert (= (and b!832819 c!90622) b!832813))

(assert (= (and b!832819 (not c!90622)) b!832815))

(assert (= (or b!832813 b!832815) bm!36450))

(assert (= (or b!832820 bm!36450) bm!36452))

(assert (= (or b!832818 bm!36452) bm!36451))

(assert (= (and bm!36451 c!90623) b!832814))

(assert (= (and bm!36451 (not c!90623)) b!832816))

(assert (= (and d!106843 res!566472) b!832817))

(assert (= (and b!832817 res!566473) b!832821))

(declare-fun m!777275 () Bool)

(assert (=> d!106843 m!777275))

(declare-fun m!777277 () Bool)

(assert (=> d!106843 m!777277))

(declare-fun m!777279 () Bool)

(assert (=> b!832817 m!777279))

(declare-fun m!777281 () Bool)

(assert (=> b!832821 m!777281))

(declare-fun m!777283 () Bool)

(assert (=> bm!36451 m!777283))

(declare-fun m!777285 () Bool)

(assert (=> b!832814 m!777285))

(assert (=> d!106547 d!106843))

(declare-fun d!106845 () Bool)

(declare-fun res!566474 () Bool)

(declare-fun e!464489 () Bool)

(assert (=> d!106845 (=> res!566474 e!464489)))

(assert (=> d!106845 (= res!566474 (and ((_ is Cons!15945) lt!377616) (= (_1!5089 (h!17075 lt!377616)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106845 (= (containsKey!402 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464489)))

(declare-fun b!832823 () Bool)

(declare-fun e!464490 () Bool)

(assert (=> b!832823 (= e!464489 e!464490)))

(declare-fun res!566475 () Bool)

(assert (=> b!832823 (=> (not res!566475) (not e!464490))))

(assert (=> b!832823 (= res!566475 (and (or (not ((_ is Cons!15945) lt!377616)) (bvsle (_1!5089 (h!17075 lt!377616)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377616) (bvslt (_1!5089 (h!17075 lt!377616)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832824 () Bool)

(assert (=> b!832824 (= e!464490 (containsKey!402 (t!22317 lt!377616) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106845 (not res!566474)) b!832823))

(assert (= (and b!832823 res!566475) b!832824))

(declare-fun m!777287 () Bool)

(assert (=> b!832824 m!777287))

(assert (=> b!832173 d!106845))

(declare-fun d!106847 () Bool)

(declare-fun lt!377961 () Bool)

(assert (=> d!106847 (= lt!377961 (select (content!388 lt!377460) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun e!464492 () Bool)

(assert (=> d!106847 (= lt!377961 e!464492)))

(declare-fun res!566477 () Bool)

(assert (=> d!106847 (=> (not res!566477) (not e!464492))))

(assert (=> d!106847 (= res!566477 ((_ is Cons!15945) lt!377460))))

(assert (=> d!106847 (= (contains!4212 lt!377460 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))) lt!377961)))

(declare-fun b!832825 () Bool)

(declare-fun e!464491 () Bool)

(assert (=> b!832825 (= e!464492 e!464491)))

(declare-fun res!566476 () Bool)

(assert (=> b!832825 (=> res!566476 e!464491)))

(assert (=> b!832825 (= res!566476 (= (h!17075 lt!377460) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!832826 () Bool)

(assert (=> b!832826 (= e!464491 (contains!4212 (t!22317 lt!377460) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(assert (= (and d!106847 res!566477) b!832825))

(assert (= (and b!832825 (not res!566476)) b!832826))

(declare-fun m!777289 () Bool)

(assert (=> d!106847 m!777289))

(declare-fun m!777291 () Bool)

(assert (=> d!106847 m!777291))

(declare-fun m!777293 () Bool)

(assert (=> b!832826 m!777293))

(assert (=> b!832352 d!106847))

(declare-fun b!832827 () Bool)

(declare-fun e!464494 () List!15949)

(declare-fun call!36457 () List!15949)

(assert (=> b!832827 (= e!464494 call!36457)))

(declare-fun b!832828 () Bool)

(declare-fun e!464493 () List!15949)

(assert (=> b!832828 (= e!464493 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36453 () Bool)

(declare-fun call!36456 () List!15949)

(assert (=> bm!36453 (= call!36457 call!36456)))

(declare-fun b!832829 () Bool)

(assert (=> b!832829 (= e!464494 call!36457)))

(declare-fun c!90626 () Bool)

(declare-fun b!832830 () Bool)

(declare-fun c!90628 () Bool)

(assert (=> b!832830 (= e!464493 (ite c!90628 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) (ite c!90626 (Cons!15945 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) (t!22317 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))))) Nil!15946)))))

(declare-fun c!90629 () Bool)

(declare-fun bm!36454 () Bool)

(declare-fun call!36458 () List!15949)

(assert (=> bm!36454 (= call!36458 ($colon$colon!537 e!464493 (ite c!90629 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90627 () Bool)

(assert (=> bm!36454 (= c!90627 c!90629)))

(declare-fun b!832831 () Bool)

(declare-fun res!566479 () Bool)

(declare-fun e!464496 () Bool)

(assert (=> b!832831 (=> (not res!566479) (not e!464496))))

(declare-fun lt!377962 () List!15949)

(assert (=> b!832831 (= res!566479 (containsKey!402 lt!377962 (_1!5089 lt!377428)))))

(declare-fun b!832832 () Bool)

(declare-fun e!464497 () List!15949)

(assert (=> b!832832 (= e!464497 call!36458)))

(declare-fun b!832833 () Bool)

(assert (=> b!832833 (= c!90626 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))))) (_1!5089 lt!377428))))))

(declare-fun e!464495 () List!15949)

(assert (=> b!832833 (= e!464495 e!464494)))

(declare-fun d!106849 () Bool)

(assert (=> d!106849 e!464496))

(declare-fun res!566478 () Bool)

(assert (=> d!106849 (=> (not res!566478) (not e!464496))))

(assert (=> d!106849 (= res!566478 (isStrictlySorted!442 lt!377962))))

(assert (=> d!106849 (= lt!377962 e!464497)))

(assert (=> d!106849 (= c!90629 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))))) (_1!5089 lt!377428))))))

(assert (=> d!106849 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))))))

(assert (=> d!106849 (= (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!377962)))

(declare-fun b!832834 () Bool)

(assert (=> b!832834 (= e!464495 call!36456)))

(declare-fun bm!36455 () Bool)

(assert (=> bm!36455 (= call!36456 call!36458)))

(declare-fun b!832835 () Bool)

(assert (=> b!832835 (= e!464496 (contains!4212 lt!377962 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832836 () Bool)

(assert (=> b!832836 (= e!464497 e!464495)))

(assert (=> b!832836 (= c!90628 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))))) (_1!5089 lt!377428))))))

(assert (= (and d!106849 c!90629) b!832832))

(assert (= (and d!106849 (not c!90629)) b!832836))

(assert (= (and b!832836 c!90628) b!832834))

(assert (= (and b!832836 (not c!90628)) b!832833))

(assert (= (and b!832833 c!90626) b!832827))

(assert (= (and b!832833 (not c!90626)) b!832829))

(assert (= (or b!832827 b!832829) bm!36453))

(assert (= (or b!832834 bm!36453) bm!36455))

(assert (= (or b!832832 bm!36455) bm!36454))

(assert (= (and bm!36454 c!90627) b!832828))

(assert (= (and bm!36454 (not c!90627)) b!832830))

(assert (= (and d!106849 res!566478) b!832831))

(assert (= (and b!832831 res!566479) b!832835))

(declare-fun m!777295 () Bool)

(assert (=> d!106849 m!777295))

(declare-fun m!777297 () Bool)

(assert (=> d!106849 m!777297))

(declare-fun m!777299 () Bool)

(assert (=> b!832831 m!777299))

(declare-fun m!777301 () Bool)

(assert (=> b!832835 m!777301))

(declare-fun m!777303 () Bool)

(assert (=> bm!36454 m!777303))

(declare-fun m!777305 () Bool)

(assert (=> b!832828 m!777305))

(assert (=> b!832401 d!106849))

(declare-fun b!832837 () Bool)

(declare-fun e!464499 () Bool)

(declare-fun e!464500 () Bool)

(assert (=> b!832837 (= e!464499 e!464500)))

(declare-fun c!90630 () Bool)

(assert (=> b!832837 (= c!90630 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!832838 () Bool)

(declare-fun e!464501 () Bool)

(assert (=> b!832838 (= e!464501 (contains!4213 (ite c!90388 (Cons!15946 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!832839 () Bool)

(declare-fun call!36459 () Bool)

(assert (=> b!832839 (= e!464500 call!36459)))

(declare-fun d!106851 () Bool)

(declare-fun res!566480 () Bool)

(declare-fun e!464498 () Bool)

(assert (=> d!106851 (=> res!566480 e!464498)))

(assert (=> d!106851 (= res!566480 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!106851 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90388 (Cons!15946 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947))) e!464498)))

(declare-fun b!832840 () Bool)

(assert (=> b!832840 (= e!464500 call!36459)))

(declare-fun bm!36456 () Bool)

(assert (=> bm!36456 (= call!36459 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90630 (Cons!15946 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!90388 (Cons!15946 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947))) (ite c!90388 (Cons!15946 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)) (ite c!90370 (Cons!15946 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) Nil!15947) Nil!15947)))))))

(declare-fun b!832841 () Bool)

(assert (=> b!832841 (= e!464498 e!464499)))

(declare-fun res!566482 () Bool)

(assert (=> b!832841 (=> (not res!566482) (not e!464499))))

(assert (=> b!832841 (= res!566482 (not e!464501))))

(declare-fun res!566481 () Bool)

(assert (=> b!832841 (=> (not res!566481) (not e!464501))))

(assert (=> b!832841 (= res!566481 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!106851 (not res!566480)) b!832841))

(assert (= (and b!832841 res!566481) b!832838))

(assert (= (and b!832841 res!566482) b!832837))

(assert (= (and b!832837 c!90630) b!832839))

(assert (= (and b!832837 (not c!90630)) b!832840))

(assert (= (or b!832839 b!832840) bm!36456))

(assert (=> b!832837 m!777115))

(assert (=> b!832837 m!777115))

(assert (=> b!832837 m!777123))

(assert (=> b!832838 m!777115))

(assert (=> b!832838 m!777115))

(declare-fun m!777307 () Bool)

(assert (=> b!832838 m!777307))

(assert (=> bm!36456 m!777115))

(declare-fun m!777309 () Bool)

(assert (=> bm!36456 m!777309))

(assert (=> b!832841 m!777115))

(assert (=> b!832841 m!777115))

(assert (=> b!832841 m!777123))

(assert (=> bm!36394 d!106851))

(declare-fun d!106853 () Bool)

(declare-fun e!464502 () Bool)

(assert (=> d!106853 e!464502))

(declare-fun res!566483 () Bool)

(assert (=> d!106853 (=> res!566483 e!464502)))

(declare-fun lt!377966 () Bool)

(assert (=> d!106853 (= res!566483 (not lt!377966))))

(declare-fun lt!377965 () Bool)

(assert (=> d!106853 (= lt!377966 lt!377965)))

(declare-fun lt!377964 () Unit!28493)

(declare-fun e!464503 () Unit!28493)

(assert (=> d!106853 (= lt!377964 e!464503)))

(declare-fun c!90631 () Bool)

(assert (=> d!106853 (= c!90631 lt!377965)))

(assert (=> d!106853 (= lt!377965 (containsKey!402 (toList!4505 lt!377735) (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(assert (=> d!106853 (= (contains!4211 lt!377735 (_1!5089 (tuple2!10157 lt!377594 minValue!754))) lt!377966)))

(declare-fun b!832842 () Bool)

(declare-fun lt!377963 () Unit!28493)

(assert (=> b!832842 (= e!464503 lt!377963)))

(assert (=> b!832842 (= lt!377963 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377735) (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(assert (=> b!832842 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377735) (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun b!832843 () Bool)

(declare-fun Unit!28533 () Unit!28493)

(assert (=> b!832843 (= e!464503 Unit!28533)))

(declare-fun b!832844 () Bool)

(assert (=> b!832844 (= e!464502 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377735) (_1!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(assert (= (and d!106853 c!90631) b!832842))

(assert (= (and d!106853 (not c!90631)) b!832843))

(assert (= (and d!106853 (not res!566483)) b!832844))

(declare-fun m!777311 () Bool)

(assert (=> d!106853 m!777311))

(declare-fun m!777313 () Bool)

(assert (=> b!832842 m!777313))

(assert (=> b!832842 m!776357))

(assert (=> b!832842 m!776357))

(declare-fun m!777315 () Bool)

(assert (=> b!832842 m!777315))

(assert (=> b!832844 m!776357))

(assert (=> b!832844 m!776357))

(assert (=> b!832844 m!777315))

(assert (=> d!106433 d!106853))

(declare-fun b!832847 () Bool)

(declare-fun e!464505 () Option!422)

(assert (=> b!832847 (= e!464505 (getValueByKey!416 (t!22317 lt!377734) (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun b!832846 () Bool)

(declare-fun e!464504 () Option!422)

(assert (=> b!832846 (= e!464504 e!464505)))

(declare-fun c!90633 () Bool)

(assert (=> b!832846 (= c!90633 (and ((_ is Cons!15945) lt!377734) (not (= (_1!5089 (h!17075 lt!377734)) (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))))

(declare-fun b!832848 () Bool)

(assert (=> b!832848 (= e!464505 None!420)))

(declare-fun b!832845 () Bool)

(assert (=> b!832845 (= e!464504 (Some!421 (_2!5089 (h!17075 lt!377734))))))

(declare-fun d!106855 () Bool)

(declare-fun c!90632 () Bool)

(assert (=> d!106855 (= c!90632 (and ((_ is Cons!15945) lt!377734) (= (_1!5089 (h!17075 lt!377734)) (_1!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(assert (=> d!106855 (= (getValueByKey!416 lt!377734 (_1!5089 (tuple2!10157 lt!377594 minValue!754))) e!464504)))

(assert (= (and d!106855 c!90632) b!832845))

(assert (= (and d!106855 (not c!90632)) b!832846))

(assert (= (and b!832846 c!90633) b!832847))

(assert (= (and b!832846 (not c!90633)) b!832848))

(declare-fun m!777317 () Bool)

(assert (=> b!832847 m!777317))

(assert (=> d!106433 d!106855))

(declare-fun d!106857 () Bool)

(assert (=> d!106857 (= (getValueByKey!416 lt!377734 (_1!5089 (tuple2!10157 lt!377594 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun lt!377967 () Unit!28493)

(assert (=> d!106857 (= lt!377967 (choose!1423 lt!377734 (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun e!464506 () Bool)

(assert (=> d!106857 e!464506))

(declare-fun res!566484 () Bool)

(assert (=> d!106857 (=> (not res!566484) (not e!464506))))

(assert (=> d!106857 (= res!566484 (isStrictlySorted!442 lt!377734))))

(assert (=> d!106857 (= (lemmaContainsTupThenGetReturnValue!230 lt!377734 (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754))) lt!377967)))

(declare-fun b!832849 () Bool)

(declare-fun res!566485 () Bool)

(assert (=> b!832849 (=> (not res!566485) (not e!464506))))

(assert (=> b!832849 (= res!566485 (containsKey!402 lt!377734 (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun b!832850 () Bool)

(assert (=> b!832850 (= e!464506 (contains!4212 lt!377734 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(assert (= (and d!106857 res!566484) b!832849))

(assert (= (and b!832849 res!566485) b!832850))

(assert (=> d!106857 m!776351))

(declare-fun m!777319 () Bool)

(assert (=> d!106857 m!777319))

(declare-fun m!777321 () Bool)

(assert (=> d!106857 m!777321))

(declare-fun m!777323 () Bool)

(assert (=> b!832849 m!777323))

(declare-fun m!777325 () Bool)

(assert (=> b!832850 m!777325))

(assert (=> d!106433 d!106857))

(declare-fun b!832851 () Bool)

(declare-fun e!464508 () List!15949)

(declare-fun call!36461 () List!15949)

(assert (=> b!832851 (= e!464508 call!36461)))

(declare-fun e!464507 () List!15949)

(declare-fun b!832852 () Bool)

(assert (=> b!832852 (= e!464507 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377593)) (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun bm!36457 () Bool)

(declare-fun call!36460 () List!15949)

(assert (=> bm!36457 (= call!36461 call!36460)))

(declare-fun b!832853 () Bool)

(assert (=> b!832853 (= e!464508 call!36461)))

(declare-fun c!90634 () Bool)

(declare-fun c!90636 () Bool)

(declare-fun b!832854 () Bool)

(assert (=> b!832854 (= e!464507 (ite c!90636 (t!22317 (toList!4505 lt!377593)) (ite c!90634 (Cons!15945 (h!17075 (toList!4505 lt!377593)) (t!22317 (toList!4505 lt!377593))) Nil!15946)))))

(declare-fun bm!36458 () Bool)

(declare-fun c!90637 () Bool)

(declare-fun call!36462 () List!15949)

(assert (=> bm!36458 (= call!36462 ($colon$colon!537 e!464507 (ite c!90637 (h!17075 (toList!4505 lt!377593)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754))))))))

(declare-fun c!90635 () Bool)

(assert (=> bm!36458 (= c!90635 c!90637)))

(declare-fun b!832855 () Bool)

(declare-fun res!566487 () Bool)

(declare-fun e!464510 () Bool)

(assert (=> b!832855 (=> (not res!566487) (not e!464510))))

(declare-fun lt!377968 () List!15949)

(assert (=> b!832855 (= res!566487 (containsKey!402 lt!377968 (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun b!832856 () Bool)

(declare-fun e!464511 () List!15949)

(assert (=> b!832856 (= e!464511 call!36462)))

(declare-fun b!832857 () Bool)

(assert (=> b!832857 (= c!90634 (and ((_ is Cons!15945) (toList!4505 lt!377593)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377593))) (_1!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(declare-fun e!464509 () List!15949)

(assert (=> b!832857 (= e!464509 e!464508)))

(declare-fun d!106859 () Bool)

(assert (=> d!106859 e!464510))

(declare-fun res!566486 () Bool)

(assert (=> d!106859 (=> (not res!566486) (not e!464510))))

(assert (=> d!106859 (= res!566486 (isStrictlySorted!442 lt!377968))))

(assert (=> d!106859 (= lt!377968 e!464511)))

(assert (=> d!106859 (= c!90637 (and ((_ is Cons!15945) (toList!4505 lt!377593)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377593))) (_1!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(assert (=> d!106859 (isStrictlySorted!442 (toList!4505 lt!377593))))

(assert (=> d!106859 (= (insertStrictlySorted!269 (toList!4505 lt!377593) (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754))) lt!377968)))

(declare-fun b!832858 () Bool)

(assert (=> b!832858 (= e!464509 call!36460)))

(declare-fun bm!36459 () Bool)

(assert (=> bm!36459 (= call!36460 call!36462)))

(declare-fun b!832859 () Bool)

(assert (=> b!832859 (= e!464510 (contains!4212 lt!377968 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377594 minValue!754)) (_2!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(declare-fun b!832860 () Bool)

(assert (=> b!832860 (= e!464511 e!464509)))

(assert (=> b!832860 (= c!90636 (and ((_ is Cons!15945) (toList!4505 lt!377593)) (= (_1!5089 (h!17075 (toList!4505 lt!377593))) (_1!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(assert (= (and d!106859 c!90637) b!832856))

(assert (= (and d!106859 (not c!90637)) b!832860))

(assert (= (and b!832860 c!90636) b!832858))

(assert (= (and b!832860 (not c!90636)) b!832857))

(assert (= (and b!832857 c!90634) b!832851))

(assert (= (and b!832857 (not c!90634)) b!832853))

(assert (= (or b!832851 b!832853) bm!36457))

(assert (= (or b!832858 bm!36457) bm!36459))

(assert (= (or b!832856 bm!36459) bm!36458))

(assert (= (and bm!36458 c!90635) b!832852))

(assert (= (and bm!36458 (not c!90635)) b!832854))

(assert (= (and d!106859 res!566486) b!832855))

(assert (= (and b!832855 res!566487) b!832859))

(declare-fun m!777327 () Bool)

(assert (=> d!106859 m!777327))

(declare-fun m!777329 () Bool)

(assert (=> d!106859 m!777329))

(declare-fun m!777331 () Bool)

(assert (=> b!832855 m!777331))

(declare-fun m!777333 () Bool)

(assert (=> b!832859 m!777333))

(declare-fun m!777335 () Bool)

(assert (=> bm!36458 m!777335))

(declare-fun m!777337 () Bool)

(assert (=> b!832852 m!777337))

(assert (=> d!106433 d!106859))

(declare-fun d!106861 () Bool)

(assert (=> d!106861 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377969 () Unit!28493)

(assert (=> d!106861 (= lt!377969 (choose!1427 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464512 () Bool)

(assert (=> d!106861 e!464512))

(declare-fun res!566488 () Bool)

(assert (=> d!106861 (=> (not res!566488) (not e!464512))))

(assert (=> d!106861 (= res!566488 (isStrictlySorted!442 (toList!4505 lt!377487)))))

(assert (=> d!106861 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!377969)))

(declare-fun b!832861 () Bool)

(assert (=> b!832861 (= e!464512 (containsKey!402 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106861 res!566488) b!832861))

(assert (=> d!106861 m!775791))

(assert (=> d!106861 m!776021))

(assert (=> d!106861 m!776021))

(assert (=> d!106861 m!776023))

(assert (=> d!106861 m!775791))

(declare-fun m!777339 () Bool)

(assert (=> d!106861 m!777339))

(declare-fun m!777341 () Bool)

(assert (=> d!106861 m!777341))

(assert (=> b!832861 m!775791))

(assert (=> b!832861 m!776017))

(assert (=> b!832030 d!106861))

(declare-fun d!106863 () Bool)

(assert (=> d!106863 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377487) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23303 () Bool)

(assert (= bs!23303 d!106863))

(assert (=> bs!23303 m!776021))

(declare-fun m!777343 () Bool)

(assert (=> bs!23303 m!777343))

(assert (=> b!832030 d!106863))

(assert (=> b!832030 d!106679))

(declare-fun b!832864 () Bool)

(declare-fun e!464514 () Option!422)

(assert (=> b!832864 (= e!464514 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377579))) (_1!5089 lt!377425)))))

(declare-fun b!832863 () Bool)

(declare-fun e!464513 () Option!422)

(assert (=> b!832863 (= e!464513 e!464514)))

(declare-fun c!90639 () Bool)

(assert (=> b!832863 (= c!90639 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377579))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377579)))) (_1!5089 lt!377425)))))))

(declare-fun b!832865 () Bool)

(assert (=> b!832865 (= e!464514 None!420)))

(declare-fun b!832862 () Bool)

(assert (=> b!832862 (= e!464513 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377579))))))))

(declare-fun d!106865 () Bool)

(declare-fun c!90638 () Bool)

(assert (=> d!106865 (= c!90638 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377579))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377579)))) (_1!5089 lt!377425))))))

(assert (=> d!106865 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377579)) (_1!5089 lt!377425)) e!464513)))

(assert (= (and d!106865 c!90638) b!832862))

(assert (= (and d!106865 (not c!90638)) b!832863))

(assert (= (and b!832863 c!90639) b!832864))

(assert (= (and b!832863 (not c!90639)) b!832865))

(declare-fun m!777345 () Bool)

(assert (=> b!832864 m!777345))

(assert (=> b!832420 d!106865))

(declare-fun d!106867 () Bool)

(assert (=> d!106867 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566))))

(declare-fun lt!377970 () Unit!28493)

(assert (=> d!106867 (= lt!377970 (choose!1427 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566))))

(declare-fun e!464515 () Bool)

(assert (=> d!106867 e!464515))

(declare-fun res!566489 () Bool)

(assert (=> d!106867 (=> (not res!566489) (not e!464515))))

(assert (=> d!106867 (= res!566489 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(assert (=> d!106867 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566) lt!377970)))

(declare-fun b!832866 () Bool)

(assert (=> b!832866 (= e!464515 (containsKey!402 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566))))

(assert (= (and d!106867 res!566489) b!832866))

(assert (=> d!106867 m!776595))

(assert (=> d!106867 m!776595))

(assert (=> d!106867 m!776597))

(declare-fun m!777347 () Bool)

(assert (=> d!106867 m!777347))

(declare-fun m!777349 () Bool)

(assert (=> d!106867 m!777349))

(assert (=> b!832866 m!776591))

(assert (=> b!832336 d!106867))

(declare-fun d!106869 () Bool)

(assert (=> d!106869 (= (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566))))))

(declare-fun bs!23304 () Bool)

(assert (= bs!23304 d!106869))

(assert (=> bs!23304 m!776595))

(declare-fun m!777351 () Bool)

(assert (=> bs!23304 m!777351))

(assert (=> b!832336 d!106869))

(declare-fun e!464517 () Option!422)

(declare-fun b!832869 () Bool)

(assert (=> b!832869 (= e!464517 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))) lt!377566))))

(declare-fun b!832868 () Bool)

(declare-fun e!464516 () Option!422)

(assert (=> b!832868 (= e!464516 e!464517)))

(declare-fun c!90641 () Bool)

(assert (=> b!832868 (= c!90641 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))))) lt!377566))))))

(declare-fun b!832870 () Bool)

(assert (=> b!832870 (= e!464517 None!420)))

(declare-fun b!832867 () Bool)

(assert (=> b!832867 (= e!464516 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))))

(declare-fun c!90640 () Bool)

(declare-fun d!106871 () Bool)

(assert (=> d!106871 (= c!90640 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))))) lt!377566)))))

(assert (=> d!106871 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566) e!464516)))

(assert (= (and d!106871 c!90640) b!832867))

(assert (= (and d!106871 (not c!90640)) b!832868))

(assert (= (and b!832868 c!90641) b!832869))

(assert (= (and b!832868 (not c!90641)) b!832870))

(declare-fun m!777353 () Bool)

(assert (=> b!832869 m!777353))

(assert (=> b!832336 d!106871))

(declare-fun d!106873 () Bool)

(assert (=> d!106873 (= (isEmpty!658 (toList!4505 lt!377494)) ((_ is Nil!15946) (toList!4505 lt!377494)))))

(assert (=> d!106337 d!106873))

(declare-fun d!106875 () Bool)

(declare-fun e!464518 () Bool)

(assert (=> d!106875 e!464518))

(declare-fun res!566490 () Bool)

(assert (=> d!106875 (=> res!566490 e!464518)))

(declare-fun lt!377974 () Bool)

(assert (=> d!106875 (= res!566490 (not lt!377974))))

(declare-fun lt!377973 () Bool)

(assert (=> d!106875 (= lt!377974 lt!377973)))

(declare-fun lt!377972 () Unit!28493)

(declare-fun e!464519 () Unit!28493)

(assert (=> d!106875 (= lt!377972 e!464519)))

(declare-fun c!90642 () Bool)

(assert (=> d!106875 (= c!90642 lt!377973)))

(assert (=> d!106875 (= lt!377973 (containsKey!402 (toList!4505 lt!377697) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106875 (= (contains!4211 lt!377697 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377974)))

(declare-fun b!832871 () Bool)

(declare-fun lt!377971 () Unit!28493)

(assert (=> b!832871 (= e!464519 lt!377971)))

(assert (=> b!832871 (= lt!377971 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377697) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832871 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377697) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832872 () Bool)

(declare-fun Unit!28534 () Unit!28493)

(assert (=> b!832872 (= e!464519 Unit!28534)))

(declare-fun b!832873 () Bool)

(assert (=> b!832873 (= e!464518 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377697) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106875 c!90642) b!832871))

(assert (= (and d!106875 (not c!90642)) b!832872))

(assert (= (and d!106875 (not res!566490)) b!832873))

(declare-fun m!777355 () Bool)

(assert (=> d!106875 m!777355))

(declare-fun m!777357 () Bool)

(assert (=> b!832871 m!777357))

(assert (=> b!832871 m!776219))

(assert (=> b!832871 m!776219))

(declare-fun m!777359 () Bool)

(assert (=> b!832871 m!777359))

(assert (=> b!832873 m!776219))

(assert (=> b!832873 m!776219))

(assert (=> b!832873 m!777359))

(assert (=> d!106391 d!106875))

(declare-fun b!832876 () Bool)

(declare-fun e!464521 () Option!422)

(assert (=> b!832876 (= e!464521 (getValueByKey!416 (t!22317 lt!377696) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832875 () Bool)

(declare-fun e!464520 () Option!422)

(assert (=> b!832875 (= e!464520 e!464521)))

(declare-fun c!90644 () Bool)

(assert (=> b!832875 (= c!90644 (and ((_ is Cons!15945) lt!377696) (not (= (_1!5089 (h!17075 lt!377696)) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832877 () Bool)

(assert (=> b!832877 (= e!464521 None!420)))

(declare-fun b!832874 () Bool)

(assert (=> b!832874 (= e!464520 (Some!421 (_2!5089 (h!17075 lt!377696))))))

(declare-fun d!106877 () Bool)

(declare-fun c!90643 () Bool)

(assert (=> d!106877 (= c!90643 (and ((_ is Cons!15945) lt!377696) (= (_1!5089 (h!17075 lt!377696)) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106877 (= (getValueByKey!416 lt!377696 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464520)))

(assert (= (and d!106877 c!90643) b!832874))

(assert (= (and d!106877 (not c!90643)) b!832875))

(assert (= (and b!832875 c!90644) b!832876))

(assert (= (and b!832875 (not c!90644)) b!832877))

(declare-fun m!777361 () Bool)

(assert (=> b!832876 m!777361))

(assert (=> d!106391 d!106877))

(declare-fun d!106879 () Bool)

(assert (=> d!106879 (= (getValueByKey!416 lt!377696 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377975 () Unit!28493)

(assert (=> d!106879 (= lt!377975 (choose!1423 lt!377696 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464522 () Bool)

(assert (=> d!106879 e!464522))

(declare-fun res!566491 () Bool)

(assert (=> d!106879 (=> (not res!566491) (not e!464522))))

(assert (=> d!106879 (= res!566491 (isStrictlySorted!442 lt!377696))))

(assert (=> d!106879 (= (lemmaContainsTupThenGetReturnValue!230 lt!377696 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377975)))

(declare-fun b!832878 () Bool)

(declare-fun res!566492 () Bool)

(assert (=> b!832878 (=> (not res!566492) (not e!464522))))

(assert (=> b!832878 (= res!566492 (containsKey!402 lt!377696 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832879 () Bool)

(assert (=> b!832879 (= e!464522 (contains!4212 lt!377696 (tuple2!10157 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106879 res!566491) b!832878))

(assert (= (and b!832878 res!566492) b!832879))

(assert (=> d!106879 m!776213))

(declare-fun m!777363 () Bool)

(assert (=> d!106879 m!777363))

(declare-fun m!777365 () Bool)

(assert (=> d!106879 m!777365))

(declare-fun m!777367 () Bool)

(assert (=> b!832878 m!777367))

(declare-fun m!777369 () Bool)

(assert (=> b!832879 m!777369))

(assert (=> d!106391 d!106879))

(declare-fun b!832880 () Bool)

(declare-fun e!464524 () List!15949)

(declare-fun call!36464 () List!15949)

(assert (=> b!832880 (= e!464524 call!36464)))

(declare-fun e!464523 () List!15949)

(declare-fun b!832881 () Bool)

(assert (=> b!832881 (= e!464523 (insertStrictlySorted!269 (t!22317 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun bm!36460 () Bool)

(declare-fun call!36463 () List!15949)

(assert (=> bm!36460 (= call!36464 call!36463)))

(declare-fun b!832882 () Bool)

(assert (=> b!832882 (= e!464524 call!36464)))

(declare-fun b!832883 () Bool)

(declare-fun c!90645 () Bool)

(declare-fun c!90647 () Bool)

(assert (=> b!832883 (= e!464523 (ite c!90647 (t!22317 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)))) (ite c!90645 (Cons!15945 (h!17075 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)))) (t!22317 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385))))) Nil!15946)))))

(declare-fun bm!36461 () Bool)

(declare-fun call!36465 () List!15949)

(declare-fun c!90648 () Bool)

(assert (=> bm!36461 (= call!36465 ($colon$colon!537 e!464523 (ite c!90648 (h!17075 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)))) (tuple2!10157 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90646 () Bool)

(assert (=> bm!36461 (= c!90646 c!90648)))

(declare-fun b!832884 () Bool)

(declare-fun res!566494 () Bool)

(declare-fun e!464526 () Bool)

(assert (=> b!832884 (=> (not res!566494) (not e!464526))))

(declare-fun lt!377976 () List!15949)

(assert (=> b!832884 (= res!566494 (containsKey!402 lt!377976 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832885 () Bool)

(declare-fun e!464527 () List!15949)

(assert (=> b!832885 (= e!464527 call!36465)))

(declare-fun b!832886 () Bool)

(assert (=> b!832886 (= c!90645 (and ((_ is Cons!15945) (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)))) (bvsgt (_1!5089 (h!17075 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385))))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!464525 () List!15949)

(assert (=> b!832886 (= e!464525 e!464524)))

(declare-fun d!106881 () Bool)

(assert (=> d!106881 e!464526))

(declare-fun res!566493 () Bool)

(assert (=> d!106881 (=> (not res!566493) (not e!464526))))

(assert (=> d!106881 (= res!566493 (isStrictlySorted!442 lt!377976))))

(assert (=> d!106881 (= lt!377976 e!464527)))

(assert (=> d!106881 (= c!90648 (and ((_ is Cons!15945) (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)))) (bvslt (_1!5089 (h!17075 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385))))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106881 (isStrictlySorted!442 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385))))))

(assert (=> d!106881 (= (insertStrictlySorted!269 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377976)))

(declare-fun b!832887 () Bool)

(assert (=> b!832887 (= e!464525 call!36463)))

(declare-fun bm!36462 () Bool)

(assert (=> bm!36462 (= call!36463 call!36465)))

(declare-fun b!832888 () Bool)

(assert (=> b!832888 (= e!464526 (contains!4212 lt!377976 (tuple2!10157 (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832889 () Bool)

(assert (=> b!832889 (= e!464527 e!464525)))

(assert (=> b!832889 (= c!90647 (and ((_ is Cons!15945) (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385)))) (= (_1!5089 (h!17075 (toList!4505 (ite c!90359 call!36383 (ite c!90360 call!36381 call!36385))))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106881 c!90648) b!832885))

(assert (= (and d!106881 (not c!90648)) b!832889))

(assert (= (and b!832889 c!90647) b!832887))

(assert (= (and b!832889 (not c!90647)) b!832886))

(assert (= (and b!832886 c!90645) b!832880))

(assert (= (and b!832886 (not c!90645)) b!832882))

(assert (= (or b!832880 b!832882) bm!36460))

(assert (= (or b!832887 bm!36460) bm!36462))

(assert (= (or b!832885 bm!36462) bm!36461))

(assert (= (and bm!36461 c!90646) b!832881))

(assert (= (and bm!36461 (not c!90646)) b!832883))

(assert (= (and d!106881 res!566493) b!832884))

(assert (= (and b!832884 res!566494) b!832888))

(declare-fun m!777371 () Bool)

(assert (=> d!106881 m!777371))

(declare-fun m!777373 () Bool)

(assert (=> d!106881 m!777373))

(declare-fun m!777375 () Bool)

(assert (=> b!832884 m!777375))

(declare-fun m!777377 () Bool)

(assert (=> b!832888 m!777377))

(declare-fun m!777379 () Bool)

(assert (=> bm!36461 m!777379))

(declare-fun m!777381 () Bool)

(assert (=> b!832881 m!777381))

(assert (=> d!106391 d!106881))

(declare-fun b!832892 () Bool)

(declare-fun e!464529 () Option!422)

(assert (=> b!832892 (= e!464529 (getValueByKey!416 (t!22317 (toList!4505 lt!377863)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832891 () Bool)

(declare-fun e!464528 () Option!422)

(assert (=> b!832891 (= e!464528 e!464529)))

(declare-fun c!90650 () Bool)

(assert (=> b!832891 (= c!90650 (and ((_ is Cons!15945) (toList!4505 lt!377863)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377863))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832893 () Bool)

(assert (=> b!832893 (= e!464529 None!420)))

(declare-fun b!832890 () Bool)

(assert (=> b!832890 (= e!464528 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377863)))))))

(declare-fun d!106883 () Bool)

(declare-fun c!90649 () Bool)

(assert (=> d!106883 (= c!90649 (and ((_ is Cons!15945) (toList!4505 lt!377863)) (= (_1!5089 (h!17075 (toList!4505 lt!377863))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106883 (= (getValueByKey!416 (toList!4505 lt!377863) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464528)))

(assert (= (and d!106883 c!90649) b!832890))

(assert (= (and d!106883 (not c!90649)) b!832891))

(assert (= (and b!832891 c!90650) b!832892))

(assert (= (and b!832891 (not c!90650)) b!832893))

(declare-fun m!777383 () Bool)

(assert (=> b!832892 m!777383))

(assert (=> b!832428 d!106883))

(declare-fun b!832896 () Bool)

(declare-fun e!464531 () Option!422)

(assert (=> b!832896 (= e!464531 (getValueByKey!416 (t!22317 (toList!4505 lt!377842)) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832895 () Bool)

(declare-fun e!464530 () Option!422)

(assert (=> b!832895 (= e!464530 e!464531)))

(declare-fun c!90652 () Bool)

(assert (=> b!832895 (= c!90652 (and ((_ is Cons!15945) (toList!4505 lt!377842)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377842))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832897 () Bool)

(assert (=> b!832897 (= e!464531 None!420)))

(declare-fun b!832894 () Bool)

(assert (=> b!832894 (= e!464530 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377842)))))))

(declare-fun d!106885 () Bool)

(declare-fun c!90651 () Bool)

(assert (=> d!106885 (= c!90651 (and ((_ is Cons!15945) (toList!4505 lt!377842)) (= (_1!5089 (h!17075 (toList!4505 lt!377842))) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106885 (= (getValueByKey!416 (toList!4505 lt!377842) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464530)))

(assert (= (and d!106885 c!90651) b!832894))

(assert (= (and d!106885 (not c!90651)) b!832895))

(assert (= (and b!832895 c!90652) b!832896))

(assert (= (and b!832895 (not c!90652)) b!832897))

(declare-fun m!777385 () Bool)

(assert (=> b!832896 m!777385))

(assert (=> b!832389 d!106885))

(declare-fun d!106887 () Bool)

(assert (=> d!106887 (= ($colon$colon!537 e!464169 (ite c!90457 (h!17075 (toList!4505 lt!377423)) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))) (Cons!15945 (ite c!90457 (h!17075 (toList!4505 lt!377423)) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) e!464169))))

(assert (=> bm!36417 d!106887))

(declare-fun d!106889 () Bool)

(assert (=> d!106889 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377598) lt!377589)) (v!10101 (getValueByKey!416 (toList!4505 lt!377598) lt!377589)))))

(assert (=> d!106429 d!106889))

(declare-fun b!832900 () Bool)

(declare-fun e!464533 () Option!422)

(assert (=> b!832900 (= e!464533 (getValueByKey!416 (t!22317 (toList!4505 lt!377598)) lt!377589))))

(declare-fun b!832899 () Bool)

(declare-fun e!464532 () Option!422)

(assert (=> b!832899 (= e!464532 e!464533)))

(declare-fun c!90654 () Bool)

(assert (=> b!832899 (= c!90654 (and ((_ is Cons!15945) (toList!4505 lt!377598)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377598))) lt!377589))))))

(declare-fun b!832901 () Bool)

(assert (=> b!832901 (= e!464533 None!420)))

(declare-fun b!832898 () Bool)

(assert (=> b!832898 (= e!464532 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377598)))))))

(declare-fun d!106891 () Bool)

(declare-fun c!90653 () Bool)

(assert (=> d!106891 (= c!90653 (and ((_ is Cons!15945) (toList!4505 lt!377598)) (= (_1!5089 (h!17075 (toList!4505 lt!377598))) lt!377589)))))

(assert (=> d!106891 (= (getValueByKey!416 (toList!4505 lt!377598) lt!377589) e!464532)))

(assert (= (and d!106891 c!90653) b!832898))

(assert (= (and d!106891 (not c!90653)) b!832899))

(assert (= (and b!832899 c!90654) b!832900))

(assert (= (and b!832899 (not c!90654)) b!832901))

(declare-fun m!777387 () Bool)

(assert (=> b!832900 m!777387))

(assert (=> d!106429 d!106891))

(assert (=> d!106339 d!106341))

(declare-fun d!106893 () Bool)

(assert (=> d!106893 (arrayContainsKey!0 _keys!976 lt!377505 #b00000000000000000000000000000000)))

(assert (=> d!106893 true))

(declare-fun _$60!397 () Unit!28493)

(assert (=> d!106893 (= (choose!13 _keys!976 lt!377505 #b00000000000000000000000000000000) _$60!397)))

(declare-fun bs!23305 () Bool)

(assert (= bs!23305 d!106893))

(assert (=> bs!23305 m!775843))

(assert (=> d!106339 d!106893))

(declare-fun b!832904 () Bool)

(declare-fun e!464535 () Option!422)

(assert (=> b!832904 (= e!464535 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377461))) (_1!5089 lt!377425)))))

(declare-fun b!832903 () Bool)

(declare-fun e!464534 () Option!422)

(assert (=> b!832903 (= e!464534 e!464535)))

(declare-fun c!90656 () Bool)

(assert (=> b!832903 (= c!90656 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377461))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377461)))) (_1!5089 lt!377425)))))))

(declare-fun b!832905 () Bool)

(assert (=> b!832905 (= e!464535 None!420)))

(declare-fun b!832902 () Bool)

(assert (=> b!832902 (= e!464534 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377461))))))))

(declare-fun d!106895 () Bool)

(declare-fun c!90655 () Bool)

(assert (=> d!106895 (= c!90655 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377461))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377461)))) (_1!5089 lt!377425))))))

(assert (=> d!106895 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377461)) (_1!5089 lt!377425)) e!464534)))

(assert (= (and d!106895 c!90655) b!832902))

(assert (= (and d!106895 (not c!90655)) b!832903))

(assert (= (and b!832903 c!90656) b!832904))

(assert (= (and b!832903 (not c!90656)) b!832905))

(declare-fun m!777389 () Bool)

(assert (=> b!832904 m!777389))

(assert (=> b!832249 d!106895))

(declare-fun b!832908 () Bool)

(declare-fun e!464537 () Option!422)

(assert (=> b!832908 (= e!464537 (getValueByKey!416 (t!22317 (t!22317 lt!377608)) (_1!5089 lt!377428)))))

(declare-fun b!832907 () Bool)

(declare-fun e!464536 () Option!422)

(assert (=> b!832907 (= e!464536 e!464537)))

(declare-fun c!90658 () Bool)

(assert (=> b!832907 (= c!90658 (and ((_ is Cons!15945) (t!22317 lt!377608)) (not (= (_1!5089 (h!17075 (t!22317 lt!377608))) (_1!5089 lt!377428)))))))

(declare-fun b!832909 () Bool)

(assert (=> b!832909 (= e!464537 None!420)))

(declare-fun b!832906 () Bool)

(assert (=> b!832906 (= e!464536 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377608)))))))

(declare-fun d!106897 () Bool)

(declare-fun c!90657 () Bool)

(assert (=> d!106897 (= c!90657 (and ((_ is Cons!15945) (t!22317 lt!377608)) (= (_1!5089 (h!17075 (t!22317 lt!377608))) (_1!5089 lt!377428))))))

(assert (=> d!106897 (= (getValueByKey!416 (t!22317 lt!377608) (_1!5089 lt!377428)) e!464536)))

(assert (= (and d!106897 c!90657) b!832906))

(assert (= (and d!106897 (not c!90657)) b!832907))

(assert (= (and b!832907 c!90658) b!832908))

(assert (= (and b!832907 (not c!90658)) b!832909))

(declare-fun m!777391 () Bool)

(assert (=> b!832908 m!777391))

(assert (=> b!832293 d!106897))

(declare-fun d!106899 () Bool)

(assert (=> d!106899 (= (apply!373 lt!377750 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11824 (getValueByKey!416 (toList!4505 lt!377750) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23306 () Bool)

(assert (= bs!23306 d!106899))

(assert (=> bs!23306 m!776103))

(declare-fun m!777393 () Bool)

(assert (=> bs!23306 m!777393))

(assert (=> bs!23306 m!777393))

(declare-fun m!777395 () Bool)

(assert (=> bs!23306 m!777395))

(assert (=> b!832241 d!106899))

(assert (=> b!832241 d!106813))

(declare-fun e!464539 () Option!422)

(declare-fun b!832912 () Bool)

(assert (=> b!832912 (= e!464539 (getValueByKey!416 (t!22317 (toList!4505 lt!377697)) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832911 () Bool)

(declare-fun e!464538 () Option!422)

(assert (=> b!832911 (= e!464538 e!464539)))

(declare-fun c!90660 () Bool)

(assert (=> b!832911 (= c!90660 (and ((_ is Cons!15945) (toList!4505 lt!377697)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377697))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832913 () Bool)

(assert (=> b!832913 (= e!464539 None!420)))

(declare-fun b!832910 () Bool)

(assert (=> b!832910 (= e!464538 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377697)))))))

(declare-fun c!90659 () Bool)

(declare-fun d!106901 () Bool)

(assert (=> d!106901 (= c!90659 (and ((_ is Cons!15945) (toList!4505 lt!377697)) (= (_1!5089 (h!17075 (toList!4505 lt!377697))) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106901 (= (getValueByKey!416 (toList!4505 lt!377697) (_1!5089 (ite (or c!90359 c!90360) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464538)))

(assert (= (and d!106901 c!90659) b!832910))

(assert (= (and d!106901 (not c!90659)) b!832911))

(assert (= (and b!832911 c!90660) b!832912))

(assert (= (and b!832911 (not c!90660)) b!832913))

(declare-fun m!777397 () Bool)

(assert (=> b!832912 m!777397))

(assert (=> b!832164 d!106901))

(declare-fun d!106903 () Bool)

(declare-fun res!566495 () Bool)

(declare-fun e!464540 () Bool)

(assert (=> d!106903 (=> res!566495 e!464540)))

(assert (=> d!106903 (= res!566495 (or ((_ is Nil!15946) lt!377848) ((_ is Nil!15946) (t!22317 lt!377848))))))

(assert (=> d!106903 (= (isStrictlySorted!442 lt!377848) e!464540)))

(declare-fun b!832914 () Bool)

(declare-fun e!464541 () Bool)

(assert (=> b!832914 (= e!464540 e!464541)))

(declare-fun res!566496 () Bool)

(assert (=> b!832914 (=> (not res!566496) (not e!464541))))

(assert (=> b!832914 (= res!566496 (bvslt (_1!5089 (h!17075 lt!377848)) (_1!5089 (h!17075 (t!22317 lt!377848)))))))

(declare-fun b!832915 () Bool)

(assert (=> b!832915 (= e!464541 (isStrictlySorted!442 (t!22317 lt!377848)))))

(assert (= (and d!106903 (not res!566495)) b!832914))

(assert (= (and b!832914 res!566496) b!832915))

(declare-fun m!777399 () Bool)

(assert (=> b!832915 m!777399))

(assert (=> d!106557 d!106903))

(declare-fun d!106905 () Bool)

(declare-fun res!566497 () Bool)

(declare-fun e!464542 () Bool)

(assert (=> d!106905 (=> res!566497 e!464542)))

(assert (=> d!106905 (= res!566497 (or ((_ is Nil!15946) (toList!4505 (+!1983 lt!377422 lt!377425))) ((_ is Nil!15946) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425))))))))

(assert (=> d!106905 (= (isStrictlySorted!442 (toList!4505 (+!1983 lt!377422 lt!377425))) e!464542)))

(declare-fun b!832916 () Bool)

(declare-fun e!464543 () Bool)

(assert (=> b!832916 (= e!464542 e!464543)))

(declare-fun res!566498 () Bool)

(assert (=> b!832916 (=> (not res!566498) (not e!464543))))

(assert (=> b!832916 (= res!566498 (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425)))) (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))))))))

(declare-fun b!832917 () Bool)

(assert (=> b!832917 (= e!464543 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377425)))))))

(assert (= (and d!106905 (not res!566497)) b!832916))

(assert (= (and b!832916 res!566498) b!832917))

(assert (=> b!832917 m!777297))

(assert (=> d!106557 d!106905))

(declare-fun d!106907 () Bool)

(assert (=> d!106907 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106345 d!106907))

(declare-fun b!832920 () Bool)

(declare-fun e!464545 () Option!422)

(assert (=> b!832920 (= e!464545 (getValueByKey!416 (t!22317 (toList!4505 lt!377554)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832919 () Bool)

(declare-fun e!464544 () Option!422)

(assert (=> b!832919 (= e!464544 e!464545)))

(declare-fun c!90662 () Bool)

(assert (=> b!832919 (= c!90662 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377554))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832921 () Bool)

(assert (=> b!832921 (= e!464545 None!420)))

(declare-fun b!832918 () Bool)

(assert (=> b!832918 (= e!464544 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377554)))))))

(declare-fun d!106909 () Bool)

(declare-fun c!90661 () Bool)

(assert (=> d!106909 (= c!90661 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (= (_1!5089 (h!17075 (toList!4505 lt!377554))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106909 (= (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464544)))

(assert (= (and d!106909 c!90661) b!832918))

(assert (= (and d!106909 (not c!90661)) b!832919))

(assert (= (and b!832919 c!90662) b!832920))

(assert (= (and b!832919 (not c!90662)) b!832921))

(assert (=> b!832920 m!775791))

(declare-fun m!777401 () Bool)

(assert (=> b!832920 m!777401))

(assert (=> d!106345 d!106909))

(declare-fun d!106911 () Bool)

(assert (=> d!106911 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!416 (toList!4505 lt!377554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106559 d!106911))

(assert (=> d!106559 d!106685))

(declare-fun d!106913 () Bool)

(declare-fun lt!377977 () Bool)

(assert (=> d!106913 (= lt!377977 (select (content!388 lt!377741) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464547 () Bool)

(assert (=> d!106913 (= lt!377977 e!464547)))

(declare-fun res!566500 () Bool)

(assert (=> d!106913 (=> (not res!566500) (not e!464547))))

(assert (=> d!106913 (= res!566500 ((_ is Cons!15945) lt!377741))))

(assert (=> d!106913 (= (contains!4212 lt!377741 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377977)))

(declare-fun b!832922 () Bool)

(declare-fun e!464546 () Bool)

(assert (=> b!832922 (= e!464547 e!464546)))

(declare-fun res!566499 () Bool)

(assert (=> b!832922 (=> res!566499 e!464546)))

(assert (=> b!832922 (= res!566499 (= (h!17075 lt!377741) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832923 () Bool)

(assert (=> b!832923 (= e!464546 (contains!4212 (t!22317 lt!377741) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106913 res!566500) b!832922))

(assert (= (and b!832922 (not res!566499)) b!832923))

(declare-fun m!777403 () Bool)

(assert (=> d!106913 m!777403))

(declare-fun m!777405 () Bool)

(assert (=> d!106913 m!777405))

(declare-fun m!777407 () Bool)

(assert (=> b!832923 m!777407))

(assert (=> b!832230 d!106913))

(declare-fun d!106915 () Bool)

(declare-fun lt!377978 () Bool)

(assert (=> d!106915 (= lt!377978 (select (content!388 lt!377612) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464549 () Bool)

(assert (=> d!106915 (= lt!377978 e!464549)))

(declare-fun res!566502 () Bool)

(assert (=> d!106915 (=> (not res!566502) (not e!464549))))

(assert (=> d!106915 (= res!566502 ((_ is Cons!15945) lt!377612))))

(assert (=> d!106915 (= (contains!4212 lt!377612 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!377978)))

(declare-fun b!832924 () Bool)

(declare-fun e!464548 () Bool)

(assert (=> b!832924 (= e!464549 e!464548)))

(declare-fun res!566501 () Bool)

(assert (=> b!832924 (=> res!566501 e!464548)))

(assert (=> b!832924 (= res!566501 (= (h!17075 lt!377612) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832925 () Bool)

(assert (=> b!832925 (= e!464548 (contains!4212 (t!22317 lt!377612) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106915 res!566502) b!832924))

(assert (= (and b!832924 (not res!566501)) b!832925))

(declare-fun m!777409 () Bool)

(assert (=> d!106915 m!777409))

(declare-fun m!777411 () Bool)

(assert (=> d!106915 m!777411))

(declare-fun m!777413 () Bool)

(assert (=> b!832925 m!777413))

(assert (=> b!832259 d!106915))

(declare-fun d!106917 () Bool)

(declare-fun res!566503 () Bool)

(declare-fun e!464550 () Bool)

(assert (=> d!106917 (=> res!566503 e!464550)))

(assert (=> d!106917 (= res!566503 (and ((_ is Cons!15945) lt!377703) (= (_1!5089 (h!17075 lt!377703)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106917 (= (containsKey!402 lt!377703 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464550)))

(declare-fun b!832926 () Bool)

(declare-fun e!464551 () Bool)

(assert (=> b!832926 (= e!464550 e!464551)))

(declare-fun res!566504 () Bool)

(assert (=> b!832926 (=> (not res!566504) (not e!464551))))

(assert (=> b!832926 (= res!566504 (and (or (not ((_ is Cons!15945) lt!377703)) (bvsle (_1!5089 (h!17075 lt!377703)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377703) (bvslt (_1!5089 (h!17075 lt!377703)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832927 () Bool)

(assert (=> b!832927 (= e!464551 (containsKey!402 (t!22317 lt!377703) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106917 (not res!566503)) b!832926))

(assert (= (and b!832926 res!566504) b!832927))

(declare-fun m!777415 () Bool)

(assert (=> b!832927 m!777415))

(assert (=> b!832179 d!106917))

(declare-fun d!106919 () Bool)

(declare-fun res!566505 () Bool)

(declare-fun e!464552 () Bool)

(assert (=> d!106919 (=> res!566505 e!464552)))

(assert (=> d!106919 (= res!566505 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))))) lt!377566)))))

(assert (=> d!106919 (= (containsKey!402 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!377566) e!464552)))

(declare-fun b!832928 () Bool)

(declare-fun e!464553 () Bool)

(assert (=> b!832928 (= e!464552 e!464553)))

(declare-fun res!566506 () Bool)

(assert (=> b!832928 (=> (not res!566506) (not e!464553))))

(assert (=> b!832928 (= res!566506 (and (or (not ((_ is Cons!15945) (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))))) (bvsle (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))))) lt!377566)) ((_ is Cons!15945) (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34))))) lt!377566)))))

(declare-fun b!832929 () Bool)

(assert (=> b!832929 (= e!464553 (containsKey!402 (t!22317 (toList!4505 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)))) lt!377566))))

(assert (= (and d!106919 (not res!566505)) b!832928))

(assert (= (and b!832928 res!566506) b!832929))

(declare-fun m!777417 () Bool)

(assert (=> b!832929 m!777417))

(assert (=> d!106507 d!106919))

(declare-fun d!106921 () Bool)

(assert (=> d!106921 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377979 () Unit!28493)

(assert (=> d!106921 (= lt!377979 (choose!1427 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464554 () Bool)

(assert (=> d!106921 e!464554))

(declare-fun res!566507 () Bool)

(assert (=> d!106921 (=> (not res!566507) (not e!464554))))

(assert (=> d!106921 (= res!566507 (isStrictlySorted!442 (toList!4505 lt!377580)))))

(assert (=> d!106921 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377979)))

(declare-fun b!832930 () Bool)

(assert (=> b!832930 (= e!464554 (containsKey!402 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106921 res!566507) b!832930))

(assert (=> d!106921 m!776129))

(assert (=> d!106921 m!776129))

(assert (=> d!106921 m!776131))

(declare-fun m!777419 () Bool)

(assert (=> d!106921 m!777419))

(assert (=> d!106921 m!776823))

(assert (=> b!832930 m!776125))

(assert (=> b!832091 d!106921))

(declare-fun d!106923 () Bool)

(assert (=> d!106923 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377580) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23307 () Bool)

(assert (= bs!23307 d!106923))

(assert (=> bs!23307 m!776129))

(declare-fun m!777421 () Bool)

(assert (=> bs!23307 m!777421))

(assert (=> b!832091 d!106923))

(assert (=> b!832091 d!106763))

(declare-fun d!106925 () Bool)

(declare-fun lt!377980 () Bool)

(assert (=> d!106925 (= lt!377980 (select (content!388 lt!377688) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464556 () Bool)

(assert (=> d!106925 (= lt!377980 e!464556)))

(declare-fun res!566509 () Bool)

(assert (=> d!106925 (=> (not res!566509) (not e!464556))))

(assert (=> d!106925 (= res!566509 ((_ is Cons!15945) lt!377688))))

(assert (=> d!106925 (= (contains!4212 lt!377688 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!377980)))

(declare-fun b!832931 () Bool)

(declare-fun e!464555 () Bool)

(assert (=> b!832931 (= e!464556 e!464555)))

(declare-fun res!566508 () Bool)

(assert (=> b!832931 (=> res!566508 e!464555)))

(assert (=> b!832931 (= res!566508 (= (h!17075 lt!377688) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!832932 () Bool)

(assert (=> b!832932 (= e!464555 (contains!4212 (t!22317 lt!377688) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!106925 res!566509) b!832931))

(assert (= (and b!832931 (not res!566508)) b!832932))

(declare-fun m!777423 () Bool)

(assert (=> d!106925 m!777423))

(declare-fun m!777425 () Bool)

(assert (=> d!106925 m!777425))

(declare-fun m!777427 () Bool)

(assert (=> b!832932 m!777427))

(assert (=> b!832157 d!106925))

(assert (=> d!106541 d!106543))

(assert (=> d!106541 d!106545))

(declare-fun d!106927 () Bool)

(assert (=> d!106927 (not (contains!4211 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)) lt!377486))))

(assert (=> d!106927 true))

(declare-fun _$36!347 () Unit!28493)

(assert (=> d!106927 (= (choose!1426 lt!377488 lt!377484 lt!377483 lt!377486) _$36!347)))

(declare-fun bs!23308 () Bool)

(assert (= bs!23308 d!106927))

(assert (=> bs!23308 m!775807))

(assert (=> bs!23308 m!775807))

(assert (=> bs!23308 m!775811))

(assert (=> d!106541 d!106927))

(declare-fun d!106929 () Bool)

(declare-fun e!464557 () Bool)

(assert (=> d!106929 e!464557))

(declare-fun res!566510 () Bool)

(assert (=> d!106929 (=> res!566510 e!464557)))

(declare-fun lt!377984 () Bool)

(assert (=> d!106929 (= res!566510 (not lt!377984))))

(declare-fun lt!377983 () Bool)

(assert (=> d!106929 (= lt!377984 lt!377983)))

(declare-fun lt!377982 () Unit!28493)

(declare-fun e!464558 () Unit!28493)

(assert (=> d!106929 (= lt!377982 e!464558)))

(declare-fun c!90663 () Bool)

(assert (=> d!106929 (= c!90663 lt!377983)))

(assert (=> d!106929 (= lt!377983 (containsKey!402 (toList!4505 lt!377488) lt!377486))))

(assert (=> d!106929 (= (contains!4211 lt!377488 lt!377486) lt!377984)))

(declare-fun b!832934 () Bool)

(declare-fun lt!377981 () Unit!28493)

(assert (=> b!832934 (= e!464558 lt!377981)))

(assert (=> b!832934 (= lt!377981 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377488) lt!377486))))

(assert (=> b!832934 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377488) lt!377486))))

(declare-fun b!832935 () Bool)

(declare-fun Unit!28535 () Unit!28493)

(assert (=> b!832935 (= e!464558 Unit!28535)))

(declare-fun b!832936 () Bool)

(assert (=> b!832936 (= e!464557 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377488) lt!377486)))))

(assert (= (and d!106929 c!90663) b!832934))

(assert (= (and d!106929 (not c!90663)) b!832935))

(assert (= (and d!106929 (not res!566510)) b!832936))

(declare-fun m!777429 () Bool)

(assert (=> d!106929 m!777429))

(declare-fun m!777431 () Bool)

(assert (=> b!832934 m!777431))

(declare-fun m!777433 () Bool)

(assert (=> b!832934 m!777433))

(assert (=> b!832934 m!777433))

(declare-fun m!777435 () Bool)

(assert (=> b!832934 m!777435))

(assert (=> b!832936 m!777433))

(assert (=> b!832936 m!777433))

(assert (=> b!832936 m!777435))

(assert (=> d!106541 d!106929))

(declare-fun d!106931 () Bool)

(assert (=> d!106931 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592))))

(declare-fun lt!377985 () Unit!28493)

(assert (=> d!106931 (= lt!377985 (choose!1427 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592))))

(declare-fun e!464559 () Bool)

(assert (=> d!106931 e!464559))

(declare-fun res!566511 () Bool)

(assert (=> d!106931 (=> (not res!566511) (not e!464559))))

(assert (=> d!106931 (= res!566511 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(assert (=> d!106931 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592) lt!377985)))

(declare-fun b!832937 () Bool)

(assert (=> b!832937 (= e!464559 (containsKey!402 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592))))

(assert (= (and d!106931 res!566511) b!832937))

(assert (=> d!106931 m!776281))

(assert (=> d!106931 m!776281))

(assert (=> d!106931 m!776283))

(declare-fun m!777437 () Bool)

(assert (=> d!106931 m!777437))

(declare-fun m!777439 () Bool)

(assert (=> d!106931 m!777439))

(assert (=> b!832937 m!776277))

(assert (=> b!832193 d!106931))

(declare-fun d!106933 () Bool)

(assert (=> d!106933 (= (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592))))))

(declare-fun bs!23309 () Bool)

(assert (= bs!23309 d!106933))

(assert (=> bs!23309 m!776281))

(declare-fun m!777441 () Bool)

(assert (=> bs!23309 m!777441))

(assert (=> b!832193 d!106933))

(declare-fun e!464561 () Option!422)

(declare-fun b!832940 () Bool)

(assert (=> b!832940 (= e!464561 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))) lt!377592))))

(declare-fun b!832939 () Bool)

(declare-fun e!464560 () Option!422)

(assert (=> b!832939 (= e!464560 e!464561)))

(declare-fun c!90665 () Bool)

(assert (=> b!832939 (= c!90665 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))))) lt!377592))))))

(declare-fun b!832941 () Bool)

(assert (=> b!832941 (= e!464561 None!420)))

(declare-fun b!832938 () Bool)

(assert (=> b!832938 (= e!464560 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))))

(declare-fun d!106935 () Bool)

(declare-fun c!90664 () Bool)

(assert (=> d!106935 (= c!90664 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))))) lt!377592)))))

(assert (=> d!106935 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!377592) e!464560)))

(assert (= (and d!106935 c!90664) b!832938))

(assert (= (and d!106935 (not c!90664)) b!832939))

(assert (= (and b!832939 c!90665) b!832940))

(assert (= (and b!832939 (not c!90665)) b!832941))

(declare-fun m!777443 () Bool)

(assert (=> b!832940 m!777443))

(assert (=> b!832193 d!106935))

(declare-fun d!106937 () Bool)

(assert (=> d!106937 (= ($colon$colon!537 e!464179 (ite c!90464 (h!17075 (toList!4505 lt!377422)) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425)))) (Cons!15945 (ite c!90464 (h!17075 (toList!4505 lt!377422)) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))) e!464179))))

(assert (=> bm!36420 d!106937))

(assert (=> b!832190 d!106647))

(declare-fun b!832944 () Bool)

(declare-fun e!464563 () Option!422)

(assert (=> b!832944 (= e!464563 (getValueByKey!416 (t!22317 (t!22317 lt!377578)) (_1!5089 lt!377425)))))

(declare-fun b!832943 () Bool)

(declare-fun e!464562 () Option!422)

(assert (=> b!832943 (= e!464562 e!464563)))

(declare-fun c!90667 () Bool)

(assert (=> b!832943 (= c!90667 (and ((_ is Cons!15945) (t!22317 lt!377578)) (not (= (_1!5089 (h!17075 (t!22317 lt!377578))) (_1!5089 lt!377425)))))))

(declare-fun b!832945 () Bool)

(assert (=> b!832945 (= e!464563 None!420)))

(declare-fun b!832942 () Bool)

(assert (=> b!832942 (= e!464562 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377578)))))))

(declare-fun d!106939 () Bool)

(declare-fun c!90666 () Bool)

(assert (=> d!106939 (= c!90666 (and ((_ is Cons!15945) (t!22317 lt!377578)) (= (_1!5089 (h!17075 (t!22317 lt!377578))) (_1!5089 lt!377425))))))

(assert (=> d!106939 (= (getValueByKey!416 (t!22317 lt!377578) (_1!5089 lt!377425)) e!464562)))

(assert (= (and d!106939 c!90666) b!832942))

(assert (= (and d!106939 (not c!90666)) b!832943))

(assert (= (and b!832943 c!90667) b!832944))

(assert (= (and b!832943 (not c!90667)) b!832945))

(declare-fun m!777445 () Bool)

(assert (=> b!832944 m!777445))

(assert (=> b!832312 d!106939))

(declare-fun lt!377986 () Bool)

(declare-fun d!106941 () Bool)

(assert (=> d!106941 (= lt!377986 (select (content!388 (toList!4505 lt!377808)) (tuple2!10157 lt!377568 minValue!754)))))

(declare-fun e!464565 () Bool)

(assert (=> d!106941 (= lt!377986 e!464565)))

(declare-fun res!566513 () Bool)

(assert (=> d!106941 (=> (not res!566513) (not e!464565))))

(assert (=> d!106941 (= res!566513 ((_ is Cons!15945) (toList!4505 lt!377808)))))

(assert (=> d!106941 (= (contains!4212 (toList!4505 lt!377808) (tuple2!10157 lt!377568 minValue!754)) lt!377986)))

(declare-fun b!832946 () Bool)

(declare-fun e!464564 () Bool)

(assert (=> b!832946 (= e!464565 e!464564)))

(declare-fun res!566512 () Bool)

(assert (=> b!832946 (=> res!566512 e!464564)))

(assert (=> b!832946 (= res!566512 (= (h!17075 (toList!4505 lt!377808)) (tuple2!10157 lt!377568 minValue!754)))))

(declare-fun b!832947 () Bool)

(assert (=> b!832947 (= e!464564 (contains!4212 (t!22317 (toList!4505 lt!377808)) (tuple2!10157 lt!377568 minValue!754)))))

(assert (= (and d!106941 res!566513) b!832946))

(assert (= (and b!832946 (not res!566512)) b!832947))

(declare-fun m!777447 () Bool)

(assert (=> d!106941 m!777447))

(declare-fun m!777449 () Bool)

(assert (=> d!106941 m!777449))

(declare-fun m!777451 () Bool)

(assert (=> b!832947 m!777451))

(assert (=> b!832342 d!106941))

(assert (=> b!832346 d!106727))

(assert (=> b!832346 d!106449))

(declare-fun e!464567 () Option!422)

(declare-fun b!832950 () Bool)

(assert (=> b!832950 (= e!464567 (getValueByKey!416 (t!22317 (toList!4505 lt!377735)) (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))

(declare-fun b!832949 () Bool)

(declare-fun e!464566 () Option!422)

(assert (=> b!832949 (= e!464566 e!464567)))

(declare-fun c!90669 () Bool)

(assert (=> b!832949 (= c!90669 (and ((_ is Cons!15945) (toList!4505 lt!377735)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377735))) (_1!5089 (tuple2!10157 lt!377594 minValue!754))))))))

(declare-fun b!832951 () Bool)

(assert (=> b!832951 (= e!464567 None!420)))

(declare-fun b!832948 () Bool)

(assert (=> b!832948 (= e!464566 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377735)))))))

(declare-fun c!90668 () Bool)

(declare-fun d!106943 () Bool)

(assert (=> d!106943 (= c!90668 (and ((_ is Cons!15945) (toList!4505 lt!377735)) (= (_1!5089 (h!17075 (toList!4505 lt!377735))) (_1!5089 (tuple2!10157 lt!377594 minValue!754)))))))

(assert (=> d!106943 (= (getValueByKey!416 (toList!4505 lt!377735) (_1!5089 (tuple2!10157 lt!377594 minValue!754))) e!464566)))

(assert (= (and d!106943 c!90668) b!832948))

(assert (= (and d!106943 (not c!90668)) b!832949))

(assert (= (and b!832949 c!90669) b!832950))

(assert (= (and b!832949 (not c!90669)) b!832951))

(declare-fun m!777453 () Bool)

(assert (=> b!832950 m!777453))

(assert (=> b!832207 d!106943))

(declare-fun d!106945 () Bool)

(assert (=> d!106945 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377593) lt!377595)) (v!10101 (getValueByKey!416 (toList!4505 lt!377593) lt!377595)))))

(assert (=> d!106425 d!106945))

(declare-fun b!832954 () Bool)

(declare-fun e!464569 () Option!422)

(assert (=> b!832954 (= e!464569 (getValueByKey!416 (t!22317 (toList!4505 lt!377593)) lt!377595))))

(declare-fun b!832953 () Bool)

(declare-fun e!464568 () Option!422)

(assert (=> b!832953 (= e!464568 e!464569)))

(declare-fun c!90671 () Bool)

(assert (=> b!832953 (= c!90671 (and ((_ is Cons!15945) (toList!4505 lt!377593)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377593))) lt!377595))))))

(declare-fun b!832955 () Bool)

(assert (=> b!832955 (= e!464569 None!420)))

(declare-fun b!832952 () Bool)

(assert (=> b!832952 (= e!464568 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377593)))))))

(declare-fun d!106947 () Bool)

(declare-fun c!90670 () Bool)

(assert (=> d!106947 (= c!90670 (and ((_ is Cons!15945) (toList!4505 lt!377593)) (= (_1!5089 (h!17075 (toList!4505 lt!377593))) lt!377595)))))

(assert (=> d!106947 (= (getValueByKey!416 (toList!4505 lt!377593) lt!377595) e!464568)))

(assert (= (and d!106947 c!90670) b!832952))

(assert (= (and d!106947 (not c!90670)) b!832953))

(assert (= (and b!832953 c!90671) b!832954))

(assert (= (and b!832953 (not c!90671)) b!832955))

(declare-fun m!777455 () Bool)

(assert (=> b!832954 m!777455))

(assert (=> d!106425 d!106947))

(declare-fun d!106949 () Bool)

(assert (=> d!106949 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377609) (_1!5089 lt!377428)))))

(declare-fun lt!377987 () Unit!28493)

(assert (=> d!106949 (= lt!377987 (choose!1427 (toList!4505 lt!377609) (_1!5089 lt!377428)))))

(declare-fun e!464570 () Bool)

(assert (=> d!106949 e!464570))

(declare-fun res!566514 () Bool)

(assert (=> d!106949 (=> (not res!566514) (not e!464570))))

(assert (=> d!106949 (= res!566514 (isStrictlySorted!442 (toList!4505 lt!377609)))))

(assert (=> d!106949 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377609) (_1!5089 lt!377428)) lt!377987)))

(declare-fun b!832956 () Bool)

(assert (=> b!832956 (= e!464570 (containsKey!402 (toList!4505 lt!377609) (_1!5089 lt!377428)))))

(assert (= (and d!106949 res!566514) b!832956))

(assert (=> d!106949 m!775983))

(assert (=> d!106949 m!775983))

(assert (=> d!106949 m!776491))

(declare-fun m!777457 () Bool)

(assert (=> d!106949 m!777457))

(declare-fun m!777459 () Bool)

(assert (=> d!106949 m!777459))

(assert (=> b!832956 m!776487))

(assert (=> b!832288 d!106949))

(declare-fun d!106951 () Bool)

(assert (=> d!106951 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377609) (_1!5089 lt!377428))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377609) (_1!5089 lt!377428)))))))

(declare-fun bs!23310 () Bool)

(assert (= bs!23310 d!106951))

(assert (=> bs!23310 m!775983))

(declare-fun m!777461 () Bool)

(assert (=> bs!23310 m!777461))

(assert (=> b!832288 d!106951))

(assert (=> b!832288 d!106489))

(declare-fun d!106953 () Bool)

(assert (=> d!106953 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377579) (_1!5089 lt!377425)))))

(declare-fun lt!377988 () Unit!28493)

(assert (=> d!106953 (= lt!377988 (choose!1427 (toList!4505 lt!377579) (_1!5089 lt!377425)))))

(declare-fun e!464571 () Bool)

(assert (=> d!106953 e!464571))

(declare-fun res!566515 () Bool)

(assert (=> d!106953 (=> (not res!566515) (not e!464571))))

(assert (=> d!106953 (= res!566515 (isStrictlySorted!442 (toList!4505 lt!377579)))))

(assert (=> d!106953 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377579) (_1!5089 lt!377425)) lt!377988)))

(declare-fun b!832957 () Bool)

(assert (=> b!832957 (= e!464571 (containsKey!402 (toList!4505 lt!377579) (_1!5089 lt!377425)))))

(assert (= (and d!106953 res!566515) b!832957))

(assert (=> d!106953 m!775913))

(assert (=> d!106953 m!775913))

(assert (=> d!106953 m!776519))

(declare-fun m!777463 () Bool)

(assert (=> d!106953 m!777463))

(declare-fun m!777465 () Bool)

(assert (=> d!106953 m!777465))

(assert (=> b!832957 m!776515))

(assert (=> b!832307 d!106953))

(declare-fun d!106955 () Bool)

(assert (=> d!106955 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377579) (_1!5089 lt!377425))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377579) (_1!5089 lt!377425)))))))

(declare-fun bs!23311 () Bool)

(assert (= bs!23311 d!106955))

(assert (=> bs!23311 m!775913))

(declare-fun m!777467 () Bool)

(assert (=> bs!23311 m!777467))

(assert (=> b!832307 d!106955))

(assert (=> b!832307 d!106569))

(declare-fun b!832960 () Bool)

(declare-fun e!464573 () Option!422)

(assert (=> b!832960 (= e!464573 (getValueByKey!416 (t!22317 (t!22317 lt!377464)) (_1!5089 lt!377428)))))

(declare-fun b!832959 () Bool)

(declare-fun e!464572 () Option!422)

(assert (=> b!832959 (= e!464572 e!464573)))

(declare-fun c!90673 () Bool)

(assert (=> b!832959 (= c!90673 (and ((_ is Cons!15945) (t!22317 lt!377464)) (not (= (_1!5089 (h!17075 (t!22317 lt!377464))) (_1!5089 lt!377428)))))))

(declare-fun b!832961 () Bool)

(assert (=> b!832961 (= e!464573 None!420)))

(declare-fun b!832958 () Bool)

(assert (=> b!832958 (= e!464572 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377464)))))))

(declare-fun d!106957 () Bool)

(declare-fun c!90672 () Bool)

(assert (=> d!106957 (= c!90672 (and ((_ is Cons!15945) (t!22317 lt!377464)) (= (_1!5089 (h!17075 (t!22317 lt!377464))) (_1!5089 lt!377428))))))

(assert (=> d!106957 (= (getValueByKey!416 (t!22317 lt!377464) (_1!5089 lt!377428)) e!464572)))

(assert (= (and d!106957 c!90672) b!832958))

(assert (= (and d!106957 (not c!90672)) b!832959))

(assert (= (and b!832959 c!90673) b!832960))

(assert (= (and b!832959 (not c!90673)) b!832961))

(declare-fun m!777469 () Bool)

(assert (=> b!832960 m!777469))

(assert (=> b!832121 d!106957))

(declare-fun d!106959 () Bool)

(declare-fun res!566516 () Bool)

(declare-fun e!464574 () Bool)

(assert (=> d!106959 (=> res!566516 e!464574)))

(assert (=> d!106959 (= res!566516 (and ((_ is Cons!15945) lt!377460) (= (_1!5089 (h!17075 lt!377460)) (_1!5089 lt!377425))))))

(assert (=> d!106959 (= (containsKey!402 lt!377460 (_1!5089 lt!377425)) e!464574)))

(declare-fun b!832962 () Bool)

(declare-fun e!464575 () Bool)

(assert (=> b!832962 (= e!464574 e!464575)))

(declare-fun res!566517 () Bool)

(assert (=> b!832962 (=> (not res!566517) (not e!464575))))

(assert (=> b!832962 (= res!566517 (and (or (not ((_ is Cons!15945) lt!377460)) (bvsle (_1!5089 (h!17075 lt!377460)) (_1!5089 lt!377425))) ((_ is Cons!15945) lt!377460) (bvslt (_1!5089 (h!17075 lt!377460)) (_1!5089 lt!377425))))))

(declare-fun b!832963 () Bool)

(assert (=> b!832963 (= e!464575 (containsKey!402 (t!22317 lt!377460) (_1!5089 lt!377425)))))

(assert (= (and d!106959 (not res!566516)) b!832962))

(assert (= (and b!832962 res!566517) b!832963))

(declare-fun m!777471 () Bool)

(assert (=> b!832963 m!777471))

(assert (=> b!832351 d!106959))

(assert (=> b!832253 d!106783))

(assert (=> b!832253 d!106467))

(declare-fun d!106961 () Bool)

(declare-fun res!566518 () Bool)

(declare-fun e!464576 () Bool)

(assert (=> d!106961 (=> res!566518 e!464576)))

(assert (=> d!106961 (= res!566518 (and ((_ is Cons!15945) (toList!4505 lt!377609)) (= (_1!5089 (h!17075 (toList!4505 lt!377609))) (_1!5089 lt!377428))))))

(assert (=> d!106961 (= (containsKey!402 (toList!4505 lt!377609) (_1!5089 lt!377428)) e!464576)))

(declare-fun b!832964 () Bool)

(declare-fun e!464577 () Bool)

(assert (=> b!832964 (= e!464576 e!464577)))

(declare-fun res!566519 () Bool)

(assert (=> b!832964 (=> (not res!566519) (not e!464577))))

(assert (=> b!832964 (= res!566519 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377609))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377609))) (_1!5089 lt!377428))) ((_ is Cons!15945) (toList!4505 lt!377609)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377609))) (_1!5089 lt!377428))))))

(declare-fun b!832965 () Bool)

(assert (=> b!832965 (= e!464577 (containsKey!402 (t!22317 (toList!4505 lt!377609)) (_1!5089 lt!377428)))))

(assert (= (and d!106961 (not res!566518)) b!832964))

(assert (= (and b!832964 res!566519) b!832965))

(declare-fun m!777473 () Bool)

(assert (=> b!832965 m!777473))

(assert (=> d!106471 d!106961))

(declare-fun d!106963 () Bool)

(assert (=> d!106963 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377587) lt!377600)) (v!10101 (getValueByKey!416 (toList!4505 lt!377587) lt!377600)))))

(assert (=> d!106415 d!106963))

(declare-fun b!832968 () Bool)

(declare-fun e!464579 () Option!422)

(assert (=> b!832968 (= e!464579 (getValueByKey!416 (t!22317 (toList!4505 lt!377587)) lt!377600))))

(declare-fun b!832967 () Bool)

(declare-fun e!464578 () Option!422)

(assert (=> b!832967 (= e!464578 e!464579)))

(declare-fun c!90675 () Bool)

(assert (=> b!832967 (= c!90675 (and ((_ is Cons!15945) (toList!4505 lt!377587)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377587))) lt!377600))))))

(declare-fun b!832969 () Bool)

(assert (=> b!832969 (= e!464579 None!420)))

(declare-fun b!832966 () Bool)

(assert (=> b!832966 (= e!464578 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377587)))))))

(declare-fun d!106965 () Bool)

(declare-fun c!90674 () Bool)

(assert (=> d!106965 (= c!90674 (and ((_ is Cons!15945) (toList!4505 lt!377587)) (= (_1!5089 (h!17075 (toList!4505 lt!377587))) lt!377600)))))

(assert (=> d!106965 (= (getValueByKey!416 (toList!4505 lt!377587) lt!377600) e!464578)))

(assert (= (and d!106965 c!90674) b!832966))

(assert (= (and d!106965 (not c!90674)) b!832967))

(assert (= (and b!832967 c!90675) b!832968))

(assert (= (and b!832967 (not c!90675)) b!832969))

(declare-fun m!777475 () Bool)

(assert (=> b!832968 m!777475))

(assert (=> d!106415 d!106965))

(declare-fun lt!377989 () Bool)

(declare-fun d!106967 () Bool)

(assert (=> d!106967 (= lt!377989 (select (content!388 (toList!4505 lt!377649)) (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464581 () Bool)

(assert (=> d!106967 (= lt!377989 e!464581)))

(declare-fun res!566521 () Bool)

(assert (=> d!106967 (=> (not res!566521) (not e!464581))))

(assert (=> d!106967 (= res!566521 ((_ is Cons!15945) (toList!4505 lt!377649)))))

(assert (=> d!106967 (= (contains!4212 (toList!4505 lt!377649) (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377989)))

(declare-fun b!832970 () Bool)

(declare-fun e!464580 () Bool)

(assert (=> b!832970 (= e!464581 e!464580)))

(declare-fun res!566520 () Bool)

(assert (=> b!832970 (=> res!566520 e!464580)))

(assert (=> b!832970 (= res!566520 (= (h!17075 (toList!4505 lt!377649)) (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832971 () Bool)

(assert (=> b!832971 (= e!464580 (contains!4212 (t!22317 (toList!4505 lt!377649)) (ite (or c!90365 c!90366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106967 res!566521) b!832970))

(assert (= (and b!832970 (not res!566520)) b!832971))

(declare-fun m!777477 () Bool)

(assert (=> d!106967 m!777477))

(declare-fun m!777479 () Bool)

(assert (=> d!106967 m!777479))

(declare-fun m!777481 () Bool)

(assert (=> b!832971 m!777481))

(assert (=> b!832067 d!106967))

(declare-fun lt!377990 () Bool)

(declare-fun d!106969 () Bool)

(assert (=> d!106969 (= lt!377990 (select (content!388 (toList!4505 lt!377790)) (tuple2!10157 lt!377560 zeroValueBefore!34)))))

(declare-fun e!464583 () Bool)

(assert (=> d!106969 (= lt!377990 e!464583)))

(declare-fun res!566523 () Bool)

(assert (=> d!106969 (=> (not res!566523) (not e!464583))))

(assert (=> d!106969 (= res!566523 ((_ is Cons!15945) (toList!4505 lt!377790)))))

(assert (=> d!106969 (= (contains!4212 (toList!4505 lt!377790) (tuple2!10157 lt!377560 zeroValueBefore!34)) lt!377990)))

(declare-fun b!832972 () Bool)

(declare-fun e!464582 () Bool)

(assert (=> b!832972 (= e!464583 e!464582)))

(declare-fun res!566522 () Bool)

(assert (=> b!832972 (=> res!566522 e!464582)))

(assert (=> b!832972 (= res!566522 (= (h!17075 (toList!4505 lt!377790)) (tuple2!10157 lt!377560 zeroValueBefore!34)))))

(declare-fun b!832973 () Bool)

(assert (=> b!832973 (= e!464582 (contains!4212 (t!22317 (toList!4505 lt!377790)) (tuple2!10157 lt!377560 zeroValueBefore!34)))))

(assert (= (and d!106969 res!566523) b!832972))

(assert (= (and b!832972 (not res!566522)) b!832973))

(declare-fun m!777483 () Bool)

(assert (=> d!106969 m!777483))

(declare-fun m!777485 () Bool)

(assert (=> d!106969 m!777485))

(declare-fun m!777487 () Bool)

(assert (=> b!832973 m!777487))

(assert (=> b!832332 d!106969))

(declare-fun d!106971 () Bool)

(assert (=> d!106971 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (v!10101 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106349 d!106971))

(declare-fun b!832976 () Bool)

(declare-fun e!464585 () Option!422)

(assert (=> b!832976 (= e!464585 (getValueByKey!416 (t!22317 (toList!4505 lt!377494)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!832975 () Bool)

(declare-fun e!464584 () Option!422)

(assert (=> b!832975 (= e!464584 e!464585)))

(declare-fun c!90677 () Bool)

(assert (=> b!832975 (= c!90677 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377494))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832977 () Bool)

(assert (=> b!832977 (= e!464585 None!420)))

(declare-fun b!832974 () Bool)

(assert (=> b!832974 (= e!464584 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377494)))))))

(declare-fun d!106973 () Bool)

(declare-fun c!90676 () Bool)

(assert (=> d!106973 (= c!90676 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (= (_1!5089 (h!17075 (toList!4505 lt!377494))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106973 (= (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464584)))

(assert (= (and d!106973 c!90676) b!832974))

(assert (= (and d!106973 (not c!90676)) b!832975))

(assert (= (and b!832975 c!90677) b!832976))

(assert (= (and b!832975 (not c!90677)) b!832977))

(assert (=> b!832976 m!775791))

(declare-fun m!777489 () Bool)

(assert (=> b!832976 m!777489))

(assert (=> d!106349 d!106973))

(declare-fun d!106975 () Bool)

(assert (=> d!106975 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486))))

(declare-fun lt!377991 () Unit!28493)

(assert (=> d!106975 (= lt!377991 (choose!1427 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486))))

(declare-fun e!464586 () Bool)

(assert (=> d!106975 e!464586))

(declare-fun res!566524 () Bool)

(assert (=> d!106975 (=> (not res!566524) (not e!464586))))

(assert (=> d!106975 (= res!566524 (isStrictlySorted!442 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))))))

(assert (=> d!106975 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486) lt!377991)))

(declare-fun b!832978 () Bool)

(assert (=> b!832978 (= e!464586 (containsKey!402 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486))))

(assert (= (and d!106975 res!566524) b!832978))

(assert (=> d!106975 m!776703))

(assert (=> d!106975 m!776703))

(assert (=> d!106975 m!776705))

(declare-fun m!777491 () Bool)

(assert (=> d!106975 m!777491))

(declare-fun m!777493 () Bool)

(assert (=> d!106975 m!777493))

(assert (=> b!832978 m!776699))

(assert (=> b!832384 d!106975))

(declare-fun d!106977 () Bool)

(assert (=> d!106977 (= (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486))))))

(declare-fun bs!23312 () Bool)

(assert (= bs!23312 d!106977))

(assert (=> bs!23312 m!776703))

(declare-fun m!777495 () Bool)

(assert (=> bs!23312 m!777495))

(assert (=> b!832384 d!106977))

(declare-fun b!832981 () Bool)

(declare-fun e!464588 () Option!422)

(assert (=> b!832981 (= e!464588 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))) lt!377486))))

(declare-fun b!832980 () Bool)

(declare-fun e!464587 () Option!422)

(assert (=> b!832980 (= e!464587 e!464588)))

(declare-fun c!90679 () Bool)

(assert (=> b!832980 (= c!90679 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))))) lt!377486))))))

(declare-fun b!832982 () Bool)

(assert (=> b!832982 (= e!464588 None!420)))

(declare-fun b!832979 () Bool)

(assert (=> b!832979 (= e!464587 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))))))))

(declare-fun d!106979 () Bool)

(declare-fun c!90678 () Bool)

(assert (=> d!106979 (= c!90678 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))))) lt!377486)))))

(assert (=> d!106979 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377488 (tuple2!10157 lt!377484 lt!377483))) lt!377486) e!464587)))

(assert (= (and d!106979 c!90678) b!832979))

(assert (= (and d!106979 (not c!90678)) b!832980))

(assert (= (and b!832980 c!90679) b!832981))

(assert (= (and b!832980 (not c!90679)) b!832982))

(declare-fun m!777497 () Bool)

(assert (=> b!832981 m!777497))

(assert (=> b!832384 d!106979))

(assert (=> d!106573 d!106575))

(assert (=> d!106573 d!106571))

(declare-fun d!106981 () Bool)

(assert (=> d!106981 (not (contains!4211 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)) lt!377493))))

(assert (=> d!106981 true))

(declare-fun _$36!348 () Unit!28493)

(assert (=> d!106981 (= (choose!1426 lt!377495 lt!377491 lt!377490 lt!377493) _$36!348)))

(declare-fun bs!23313 () Bool)

(assert (= bs!23313 d!106981))

(assert (=> bs!23313 m!775827))

(assert (=> bs!23313 m!775827))

(assert (=> bs!23313 m!775831))

(assert (=> d!106573 d!106981))

(declare-fun d!106983 () Bool)

(declare-fun e!464589 () Bool)

(assert (=> d!106983 e!464589))

(declare-fun res!566525 () Bool)

(assert (=> d!106983 (=> res!566525 e!464589)))

(declare-fun lt!377995 () Bool)

(assert (=> d!106983 (= res!566525 (not lt!377995))))

(declare-fun lt!377994 () Bool)

(assert (=> d!106983 (= lt!377995 lt!377994)))

(declare-fun lt!377993 () Unit!28493)

(declare-fun e!464590 () Unit!28493)

(assert (=> d!106983 (= lt!377993 e!464590)))

(declare-fun c!90680 () Bool)

(assert (=> d!106983 (= c!90680 lt!377994)))

(assert (=> d!106983 (= lt!377994 (containsKey!402 (toList!4505 lt!377495) lt!377493))))

(assert (=> d!106983 (= (contains!4211 lt!377495 lt!377493) lt!377995)))

(declare-fun b!832983 () Bool)

(declare-fun lt!377992 () Unit!28493)

(assert (=> b!832983 (= e!464590 lt!377992)))

(assert (=> b!832983 (= lt!377992 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377495) lt!377493))))

(assert (=> b!832983 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377495) lt!377493))))

(declare-fun b!832984 () Bool)

(declare-fun Unit!28536 () Unit!28493)

(assert (=> b!832984 (= e!464590 Unit!28536)))

(declare-fun b!832985 () Bool)

(assert (=> b!832985 (= e!464589 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377495) lt!377493)))))

(assert (= (and d!106983 c!90680) b!832983))

(assert (= (and d!106983 (not c!90680)) b!832984))

(assert (= (and d!106983 (not res!566525)) b!832985))

(declare-fun m!777499 () Bool)

(assert (=> d!106983 m!777499))

(declare-fun m!777501 () Bool)

(assert (=> b!832983 m!777501))

(declare-fun m!777503 () Bool)

(assert (=> b!832983 m!777503))

(assert (=> b!832983 m!777503))

(declare-fun m!777505 () Bool)

(assert (=> b!832983 m!777505))

(assert (=> b!832985 m!777503))

(assert (=> b!832985 m!777503))

(assert (=> b!832985 m!777505))

(assert (=> d!106573 d!106983))

(declare-fun d!106985 () Bool)

(declare-fun e!464591 () Bool)

(assert (=> d!106985 e!464591))

(declare-fun res!566526 () Bool)

(assert (=> d!106985 (=> (not res!566526) (not e!464591))))

(declare-fun lt!377999 () ListLongMap!8979)

(assert (=> d!106985 (= res!566526 (contains!4211 lt!377999 (_1!5089 (tuple2!10157 lt!377669 lt!377668))))))

(declare-fun lt!377998 () List!15949)

(assert (=> d!106985 (= lt!377999 (ListLongMap!8980 lt!377998))))

(declare-fun lt!377996 () Unit!28493)

(declare-fun lt!377997 () Unit!28493)

(assert (=> d!106985 (= lt!377996 lt!377997)))

(assert (=> d!106985 (= (getValueByKey!416 lt!377998 (_1!5089 (tuple2!10157 lt!377669 lt!377668))) (Some!421 (_2!5089 (tuple2!10157 lt!377669 lt!377668))))))

(assert (=> d!106985 (= lt!377997 (lemmaContainsTupThenGetReturnValue!230 lt!377998 (_1!5089 (tuple2!10157 lt!377669 lt!377668)) (_2!5089 (tuple2!10157 lt!377669 lt!377668))))))

(assert (=> d!106985 (= lt!377998 (insertStrictlySorted!269 (toList!4505 lt!377673) (_1!5089 (tuple2!10157 lt!377669 lt!377668)) (_2!5089 (tuple2!10157 lt!377669 lt!377668))))))

(assert (=> d!106985 (= (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668)) lt!377999)))

(declare-fun b!832986 () Bool)

(declare-fun res!566527 () Bool)

(assert (=> b!832986 (=> (not res!566527) (not e!464591))))

(assert (=> b!832986 (= res!566527 (= (getValueByKey!416 (toList!4505 lt!377999) (_1!5089 (tuple2!10157 lt!377669 lt!377668))) (Some!421 (_2!5089 (tuple2!10157 lt!377669 lt!377668)))))))

(declare-fun b!832987 () Bool)

(assert (=> b!832987 (= e!464591 (contains!4212 (toList!4505 lt!377999) (tuple2!10157 lt!377669 lt!377668)))))

(assert (= (and d!106985 res!566526) b!832986))

(assert (= (and b!832986 res!566527) b!832987))

(declare-fun m!777507 () Bool)

(assert (=> d!106985 m!777507))

(declare-fun m!777509 () Bool)

(assert (=> d!106985 m!777509))

(declare-fun m!777511 () Bool)

(assert (=> d!106985 m!777511))

(declare-fun m!777513 () Bool)

(assert (=> d!106985 m!777513))

(declare-fun m!777515 () Bool)

(assert (=> b!832986 m!777515))

(declare-fun m!777517 () Bool)

(assert (=> b!832987 m!777517))

(assert (=> b!832095 d!106985))

(declare-fun d!106987 () Bool)

(assert (=> d!106987 (not (contains!4211 (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668)) lt!377671))))

(declare-fun lt!378000 () Unit!28493)

(assert (=> d!106987 (= lt!378000 (choose!1426 lt!377673 lt!377669 lt!377668 lt!377671))))

(declare-fun e!464592 () Bool)

(assert (=> d!106987 e!464592))

(declare-fun res!566528 () Bool)

(assert (=> d!106987 (=> (not res!566528) (not e!464592))))

(assert (=> d!106987 (= res!566528 (not (contains!4211 lt!377673 lt!377671)))))

(assert (=> d!106987 (= (addStillNotContains!198 lt!377673 lt!377669 lt!377668 lt!377671) lt!378000)))

(declare-fun b!832988 () Bool)

(assert (=> b!832988 (= e!464592 (not (= lt!377669 lt!377671)))))

(assert (= (and d!106987 res!566528) b!832988))

(assert (=> d!106987 m!776145))

(assert (=> d!106987 m!776145))

(assert (=> d!106987 m!776149))

(declare-fun m!777519 () Bool)

(assert (=> d!106987 m!777519))

(declare-fun m!777521 () Bool)

(assert (=> d!106987 m!777521))

(assert (=> b!832095 d!106987))

(assert (=> b!832095 d!106813))

(declare-fun d!106989 () Bool)

(declare-fun e!464593 () Bool)

(assert (=> d!106989 e!464593))

(declare-fun res!566529 () Bool)

(assert (=> d!106989 (=> res!566529 e!464593)))

(declare-fun lt!378004 () Bool)

(assert (=> d!106989 (= res!566529 (not lt!378004))))

(declare-fun lt!378003 () Bool)

(assert (=> d!106989 (= lt!378004 lt!378003)))

(declare-fun lt!378002 () Unit!28493)

(declare-fun e!464594 () Unit!28493)

(assert (=> d!106989 (= lt!378002 e!464594)))

(declare-fun c!90681 () Bool)

(assert (=> d!106989 (= c!90681 lt!378003)))

(assert (=> d!106989 (= lt!378003 (containsKey!402 (toList!4505 (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668))) lt!377671))))

(assert (=> d!106989 (= (contains!4211 (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668)) lt!377671) lt!378004)))

(declare-fun b!832989 () Bool)

(declare-fun lt!378001 () Unit!28493)

(assert (=> b!832989 (= e!464594 lt!378001)))

(assert (=> b!832989 (= lt!378001 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668))) lt!377671))))

(assert (=> b!832989 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668))) lt!377671))))

(declare-fun b!832990 () Bool)

(declare-fun Unit!28537 () Unit!28493)

(assert (=> b!832990 (= e!464594 Unit!28537)))

(declare-fun b!832991 () Bool)

(assert (=> b!832991 (= e!464593 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377673 (tuple2!10157 lt!377669 lt!377668))) lt!377671)))))

(assert (= (and d!106989 c!90681) b!832989))

(assert (= (and d!106989 (not c!90681)) b!832990))

(assert (= (and d!106989 (not res!566529)) b!832991))

(declare-fun m!777523 () Bool)

(assert (=> d!106989 m!777523))

(declare-fun m!777525 () Bool)

(assert (=> b!832989 m!777525))

(declare-fun m!777527 () Bool)

(assert (=> b!832989 m!777527))

(assert (=> b!832989 m!777527))

(declare-fun m!777529 () Bool)

(assert (=> b!832989 m!777529))

(assert (=> b!832991 m!777527))

(assert (=> b!832991 m!777527))

(assert (=> b!832991 m!777529))

(assert (=> b!832095 d!106989))

(declare-fun d!106991 () Bool)

(declare-fun e!464595 () Bool)

(assert (=> d!106991 e!464595))

(declare-fun res!566530 () Bool)

(assert (=> d!106991 (=> (not res!566530) (not e!464595))))

(declare-fun lt!378008 () ListLongMap!8979)

(assert (=> d!106991 (= res!566530 (contains!4211 lt!378008 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378007 () List!15949)

(assert (=> d!106991 (= lt!378008 (ListLongMap!8980 lt!378007))))

(declare-fun lt!378005 () Unit!28493)

(declare-fun lt!378006 () Unit!28493)

(assert (=> d!106991 (= lt!378005 lt!378006)))

(assert (=> d!106991 (= (getValueByKey!416 lt!378007 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106991 (= lt!378006 (lemmaContainsTupThenGetReturnValue!230 lt!378007 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106991 (= lt!378007 (insertStrictlySorted!269 (toList!4505 call!36398) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106991 (= (+!1983 call!36398 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378008)))

(declare-fun b!832992 () Bool)

(declare-fun res!566531 () Bool)

(assert (=> b!832992 (=> (not res!566531) (not e!464595))))

(assert (=> b!832992 (= res!566531 (= (getValueByKey!416 (toList!4505 lt!378008) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832993 () Bool)

(assert (=> b!832993 (= e!464595 (contains!4212 (toList!4505 lt!378008) (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106991 res!566530) b!832992))

(assert (= (and b!832992 res!566531) b!832993))

(declare-fun m!777531 () Bool)

(assert (=> d!106991 m!777531))

(declare-fun m!777533 () Bool)

(assert (=> d!106991 m!777533))

(declare-fun m!777535 () Bool)

(assert (=> d!106991 m!777535))

(declare-fun m!777537 () Bool)

(assert (=> d!106991 m!777537))

(declare-fun m!777539 () Bool)

(assert (=> b!832992 m!777539))

(declare-fun m!777541 () Bool)

(assert (=> b!832993 m!777541))

(assert (=> b!832095 d!106991))

(declare-fun d!106993 () Bool)

(declare-fun res!566532 () Bool)

(declare-fun e!464596 () Bool)

(assert (=> d!106993 (=> res!566532 e!464596)))

(assert (=> d!106993 (= res!566532 (and ((_ is Cons!15945) lt!377688) (= (_1!5089 (h!17075 lt!377688)) (_1!5089 lt!377428))))))

(assert (=> d!106993 (= (containsKey!402 lt!377688 (_1!5089 lt!377428)) e!464596)))

(declare-fun b!832994 () Bool)

(declare-fun e!464597 () Bool)

(assert (=> b!832994 (= e!464596 e!464597)))

(declare-fun res!566533 () Bool)

(assert (=> b!832994 (=> (not res!566533) (not e!464597))))

(assert (=> b!832994 (= res!566533 (and (or (not ((_ is Cons!15945) lt!377688)) (bvsle (_1!5089 (h!17075 lt!377688)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377688) (bvslt (_1!5089 (h!17075 lt!377688)) (_1!5089 lt!377428))))))

(declare-fun b!832995 () Bool)

(assert (=> b!832995 (= e!464597 (containsKey!402 (t!22317 lt!377688) (_1!5089 lt!377428)))))

(assert (= (and d!106993 (not res!566532)) b!832994))

(assert (= (and b!832994 res!566533) b!832995))

(declare-fun m!777543 () Bool)

(assert (=> b!832995 m!777543))

(assert (=> b!832153 d!106993))

(declare-fun d!106995 () Bool)

(declare-fun c!90684 () Bool)

(assert (=> d!106995 (= c!90684 ((_ is Nil!15946) (toList!4505 lt!377509)))))

(declare-fun e!464600 () (InoxSet tuple2!10156))

(assert (=> d!106995 (= (content!388 (toList!4505 lt!377509)) e!464600)))

(declare-fun b!833000 () Bool)

(assert (=> b!833000 (= e!464600 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833001 () Bool)

(assert (=> b!833001 (= e!464600 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377509)) true) (content!388 (t!22317 (toList!4505 lt!377509)))))))

(assert (= (and d!106995 c!90684) b!833000))

(assert (= (and d!106995 (not c!90684)) b!833001))

(declare-fun m!777545 () Bool)

(assert (=> b!833001 m!777545))

(declare-fun m!777547 () Bool)

(assert (=> b!833001 m!777547))

(assert (=> d!106401 d!106995))

(declare-fun d!106997 () Bool)

(assert (=> d!106997 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!378009 () Unit!28493)

(assert (=> d!106997 (= lt!378009 (choose!1427 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464601 () Bool)

(assert (=> d!106997 e!464601))

(declare-fun res!566534 () Bool)

(assert (=> d!106997 (=> (not res!566534) (not e!464601))))

(assert (=> d!106997 (= res!566534 (isStrictlySorted!442 (toList!4505 lt!377494)))))

(assert (=> d!106997 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!378009)))

(declare-fun b!833002 () Bool)

(assert (=> b!833002 (= e!464601 (containsKey!402 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106997 res!566534) b!833002))

(assert (=> d!106997 m!775791))

(assert (=> d!106997 m!776053))

(assert (=> d!106997 m!776053))

(assert (=> d!106997 m!776095))

(assert (=> d!106997 m!775791))

(declare-fun m!777549 () Bool)

(assert (=> d!106997 m!777549))

(declare-fun m!777551 () Bool)

(assert (=> d!106997 m!777551))

(assert (=> b!833002 m!775791))

(assert (=> b!833002 m!776091))

(assert (=> b!832076 d!106997))

(declare-fun d!106999 () Bool)

(assert (=> d!106999 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23314 () Bool)

(assert (= bs!23314 d!106999))

(assert (=> bs!23314 m!776053))

(declare-fun m!777553 () Bool)

(assert (=> bs!23314 m!777553))

(assert (=> b!832076 d!106999))

(assert (=> b!832076 d!106973))

(declare-fun d!107001 () Bool)

(declare-fun res!566535 () Bool)

(declare-fun e!464602 () Bool)

(assert (=> d!107001 (=> res!566535 e!464602)))

(assert (=> d!107001 (= res!566535 (or ((_ is Nil!15946) lt!377703) ((_ is Nil!15946) (t!22317 lt!377703))))))

(assert (=> d!107001 (= (isStrictlySorted!442 lt!377703) e!464602)))

(declare-fun b!833003 () Bool)

(declare-fun e!464603 () Bool)

(assert (=> b!833003 (= e!464602 e!464603)))

(declare-fun res!566536 () Bool)

(assert (=> b!833003 (=> (not res!566536) (not e!464603))))

(assert (=> b!833003 (= res!566536 (bvslt (_1!5089 (h!17075 lt!377703)) (_1!5089 (h!17075 (t!22317 lt!377703)))))))

(declare-fun b!833004 () Bool)

(assert (=> b!833004 (= e!464603 (isStrictlySorted!442 (t!22317 lt!377703)))))

(assert (= (and d!107001 (not res!566535)) b!833003))

(assert (= (and b!833003 res!566536) b!833004))

(declare-fun m!777555 () Bool)

(assert (=> b!833004 m!777555))

(assert (=> d!106399 d!107001))

(declare-fun d!107003 () Bool)

(declare-fun res!566537 () Bool)

(declare-fun e!464604 () Bool)

(assert (=> d!107003 (=> res!566537 e!464604)))

(assert (=> d!107003 (= res!566537 (or ((_ is Nil!15946) (toList!4505 lt!377423)) ((_ is Nil!15946) (t!22317 (toList!4505 lt!377423)))))))

(assert (=> d!107003 (= (isStrictlySorted!442 (toList!4505 lt!377423)) e!464604)))

(declare-fun b!833005 () Bool)

(declare-fun e!464605 () Bool)

(assert (=> b!833005 (= e!464604 e!464605)))

(declare-fun res!566538 () Bool)

(assert (=> b!833005 (=> (not res!566538) (not e!464605))))

(assert (=> b!833005 (= res!566538 (bvslt (_1!5089 (h!17075 (toList!4505 lt!377423))) (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377423))))))))

(declare-fun b!833006 () Bool)

(assert (=> b!833006 (= e!464605 (isStrictlySorted!442 (t!22317 (toList!4505 lt!377423))))))

(assert (= (and d!107003 (not res!566537)) b!833005))

(assert (= (and b!833005 res!566538) b!833006))

(declare-fun m!777557 () Bool)

(assert (=> b!833006 m!777557))

(assert (=> d!106399 d!107003))

(declare-fun d!107005 () Bool)

(declare-fun res!566539 () Bool)

(declare-fun e!464606 () Bool)

(assert (=> d!107005 (=> res!566539 e!464606)))

(assert (=> d!107005 (= res!566539 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (= (_1!5089 (h!17075 (toList!4505 lt!377494))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107005 (= (containsKey!402 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000) e!464606)))

(declare-fun b!833007 () Bool)

(declare-fun e!464607 () Bool)

(assert (=> b!833007 (= e!464606 e!464607)))

(declare-fun res!566540 () Bool)

(assert (=> b!833007 (=> (not res!566540) (not e!464607))))

(assert (=> b!833007 (= res!566540 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377494))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377494))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377494)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377494))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833008 () Bool)

(assert (=> b!833008 (= e!464607 (containsKey!402 (t!22317 (toList!4505 lt!377494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107005 (not res!566539)) b!833007))

(assert (= (and b!833007 res!566540) b!833008))

(declare-fun m!777559 () Bool)

(assert (=> b!833008 m!777559))

(assert (=> d!106535 d!107005))

(declare-fun d!107007 () Bool)

(declare-fun c!90685 () Bool)

(assert (=> d!107007 (= c!90685 ((_ is Nil!15946) (toList!4505 lt!377617)))))

(declare-fun e!464608 () (InoxSet tuple2!10156))

(assert (=> d!107007 (= (content!388 (toList!4505 lt!377617)) e!464608)))

(declare-fun b!833009 () Bool)

(assert (=> b!833009 (= e!464608 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833010 () Bool)

(assert (=> b!833010 (= e!464608 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377617)) true) (content!388 (t!22317 (toList!4505 lt!377617)))))))

(assert (= (and d!107007 c!90685) b!833009))

(assert (= (and d!107007 (not c!90685)) b!833010))

(declare-fun m!777561 () Bool)

(assert (=> b!833010 m!777561))

(declare-fun m!777563 () Bool)

(assert (=> b!833010 m!777563))

(assert (=> d!106367 d!107007))

(declare-fun b!833013 () Bool)

(declare-fun e!464610 () Option!422)

(assert (=> b!833013 (= e!464610 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377617))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833012 () Bool)

(declare-fun e!464609 () Option!422)

(assert (=> b!833012 (= e!464609 e!464610)))

(declare-fun c!90687 () Bool)

(assert (=> b!833012 (= c!90687 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377617))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377617)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!833014 () Bool)

(assert (=> b!833014 (= e!464610 None!420)))

(declare-fun b!833011 () Bool)

(assert (=> b!833011 (= e!464609 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377617))))))))

(declare-fun d!107009 () Bool)

(declare-fun c!90686 () Bool)

(assert (=> d!107009 (= c!90686 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377617))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377617)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107009 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377617)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464609)))

(assert (= (and d!107009 c!90686) b!833011))

(assert (= (and d!107009 (not c!90686)) b!833012))

(assert (= (and b!833012 c!90687) b!833013))

(assert (= (and b!833012 (not c!90687)) b!833014))

(declare-fun m!777565 () Bool)

(assert (=> b!833013 m!777565))

(assert (=> b!832368 d!107009))

(declare-fun e!464612 () Option!422)

(declare-fun b!833017 () Bool)

(assert (=> b!833017 (= e!464612 (getValueByKey!416 (t!22317 (toList!4505 lt!377796)) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun b!833016 () Bool)

(declare-fun e!464611 () Option!422)

(assert (=> b!833016 (= e!464611 e!464612)))

(declare-fun c!90689 () Bool)

(assert (=> b!833016 (= c!90689 (and ((_ is Cons!15945) (toList!4505 lt!377796)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377796))) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))))

(declare-fun b!833018 () Bool)

(assert (=> b!833018 (= e!464612 None!420)))

(declare-fun b!833015 () Bool)

(assert (=> b!833015 (= e!464611 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377796)))))))

(declare-fun d!107011 () Bool)

(declare-fun c!90688 () Bool)

(assert (=> d!107011 (= c!90688 (and ((_ is Cons!15945) (toList!4505 lt!377796)) (= (_1!5089 (h!17075 (toList!4505 lt!377796))) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(assert (=> d!107011 (= (getValueByKey!416 (toList!4505 lt!377796) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) e!464611)))

(assert (= (and d!107011 c!90688) b!833015))

(assert (= (and d!107011 (not c!90688)) b!833016))

(assert (= (and b!833016 c!90689) b!833017))

(assert (= (and b!833016 (not c!90689)) b!833018))

(declare-fun m!777567 () Bool)

(assert (=> b!833017 m!777567))

(assert (=> b!832334 d!107011))

(declare-fun d!107013 () Bool)

(declare-fun lt!378010 () Bool)

(assert (=> d!107013 (= lt!378010 (select (content!388 (t!22317 (toList!4505 lt!377609))) lt!377428))))

(declare-fun e!464614 () Bool)

(assert (=> d!107013 (= lt!378010 e!464614)))

(declare-fun res!566542 () Bool)

(assert (=> d!107013 (=> (not res!566542) (not e!464614))))

(assert (=> d!107013 (= res!566542 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377609))))))

(assert (=> d!107013 (= (contains!4212 (t!22317 (toList!4505 lt!377609)) lt!377428) lt!378010)))

(declare-fun b!833019 () Bool)

(declare-fun e!464613 () Bool)

(assert (=> b!833019 (= e!464614 e!464613)))

(declare-fun res!566541 () Bool)

(assert (=> b!833019 (=> res!566541 e!464613)))

(assert (=> b!833019 (= res!566541 (= (h!17075 (t!22317 (toList!4505 lt!377609))) lt!377428))))

(declare-fun b!833020 () Bool)

(assert (=> b!833020 (= e!464613 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377609))) lt!377428))))

(assert (= (and d!107013 res!566542) b!833019))

(assert (= (and b!833019 (not res!566541)) b!833020))

(declare-fun m!777569 () Bool)

(assert (=> d!107013 m!777569))

(declare-fun m!777571 () Bool)

(assert (=> d!107013 m!777571))

(declare-fun m!777573 () Bool)

(assert (=> b!833020 m!777573))

(assert (=> b!832075 d!107013))

(declare-fun e!464616 () Option!422)

(declare-fun b!833023 () Bool)

(assert (=> b!833023 (= e!464616 (getValueByKey!416 (t!22317 (toList!4505 lt!377729)) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun b!833022 () Bool)

(declare-fun e!464615 () Option!422)

(assert (=> b!833022 (= e!464615 e!464616)))

(declare-fun c!90691 () Bool)

(assert (=> b!833022 (= c!90691 (and ((_ is Cons!15945) (toList!4505 lt!377729)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377729))) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))))

(declare-fun b!833024 () Bool)

(assert (=> b!833024 (= e!464616 None!420)))

(declare-fun b!833021 () Bool)

(assert (=> b!833021 (= e!464615 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377729)))))))

(declare-fun c!90690 () Bool)

(declare-fun d!107015 () Bool)

(assert (=> d!107015 (= c!90690 (and ((_ is Cons!15945) (toList!4505 lt!377729)) (= (_1!5089 (h!17075 (toList!4505 lt!377729))) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(assert (=> d!107015 (= (getValueByKey!416 (toList!4505 lt!377729) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) e!464615)))

(assert (= (and d!107015 c!90690) b!833021))

(assert (= (and d!107015 (not c!90690)) b!833022))

(assert (= (and b!833022 c!90691) b!833023))

(assert (= (and b!833022 (not c!90691)) b!833024))

(declare-fun m!777575 () Bool)

(assert (=> b!833023 m!777575))

(assert (=> b!832203 d!107015))

(declare-fun d!107017 () Bool)

(declare-fun e!464617 () Bool)

(assert (=> d!107017 e!464617))

(declare-fun res!566543 () Bool)

(assert (=> d!107017 (=> res!566543 e!464617)))

(declare-fun lt!378014 () Bool)

(assert (=> d!107017 (= res!566543 (not lt!378014))))

(declare-fun lt!378013 () Bool)

(assert (=> d!107017 (= lt!378014 lt!378013)))

(declare-fun lt!378012 () Unit!28493)

(declare-fun e!464618 () Unit!28493)

(assert (=> d!107017 (= lt!378012 e!464618)))

(declare-fun c!90692 () Bool)

(assert (=> d!107017 (= c!90692 lt!378013)))

(assert (=> d!107017 (= lt!378013 (containsKey!402 (toList!4505 lt!377838) (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(assert (=> d!107017 (= (contains!4211 lt!377838 (_1!5089 (tuple2!10157 lt!377484 lt!377483))) lt!378014)))

(declare-fun b!833025 () Bool)

(declare-fun lt!378011 () Unit!28493)

(assert (=> b!833025 (= e!464618 lt!378011)))

(assert (=> b!833025 (= lt!378011 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377838) (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(assert (=> b!833025 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377838) (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun b!833026 () Bool)

(declare-fun Unit!28538 () Unit!28493)

(assert (=> b!833026 (= e!464618 Unit!28538)))

(declare-fun b!833027 () Bool)

(assert (=> b!833027 (= e!464617 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377838) (_1!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(assert (= (and d!107017 c!90692) b!833025))

(assert (= (and d!107017 (not c!90692)) b!833026))

(assert (= (and d!107017 (not res!566543)) b!833027))

(declare-fun m!777577 () Bool)

(assert (=> d!107017 m!777577))

(declare-fun m!777579 () Bool)

(assert (=> b!833025 m!777579))

(assert (=> b!833025 m!776715))

(assert (=> b!833025 m!776715))

(declare-fun m!777581 () Bool)

(assert (=> b!833025 m!777581))

(assert (=> b!833027 m!776715))

(assert (=> b!833027 m!776715))

(assert (=> b!833027 m!777581))

(assert (=> d!106545 d!107017))

(declare-fun b!833030 () Bool)

(declare-fun e!464620 () Option!422)

(assert (=> b!833030 (= e!464620 (getValueByKey!416 (t!22317 lt!377837) (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun b!833029 () Bool)

(declare-fun e!464619 () Option!422)

(assert (=> b!833029 (= e!464619 e!464620)))

(declare-fun c!90694 () Bool)

(assert (=> b!833029 (= c!90694 (and ((_ is Cons!15945) lt!377837) (not (= (_1!5089 (h!17075 lt!377837)) (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))))

(declare-fun b!833031 () Bool)

(assert (=> b!833031 (= e!464620 None!420)))

(declare-fun b!833028 () Bool)

(assert (=> b!833028 (= e!464619 (Some!421 (_2!5089 (h!17075 lt!377837))))))

(declare-fun c!90693 () Bool)

(declare-fun d!107019 () Bool)

(assert (=> d!107019 (= c!90693 (and ((_ is Cons!15945) lt!377837) (= (_1!5089 (h!17075 lt!377837)) (_1!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(assert (=> d!107019 (= (getValueByKey!416 lt!377837 (_1!5089 (tuple2!10157 lt!377484 lt!377483))) e!464619)))

(assert (= (and d!107019 c!90693) b!833028))

(assert (= (and d!107019 (not c!90693)) b!833029))

(assert (= (and b!833029 c!90694) b!833030))

(assert (= (and b!833029 (not c!90694)) b!833031))

(declare-fun m!777583 () Bool)

(assert (=> b!833030 m!777583))

(assert (=> d!106545 d!107019))

(declare-fun d!107021 () Bool)

(assert (=> d!107021 (= (getValueByKey!416 lt!377837 (_1!5089 (tuple2!10157 lt!377484 lt!377483))) (Some!421 (_2!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun lt!378015 () Unit!28493)

(assert (=> d!107021 (= lt!378015 (choose!1423 lt!377837 (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun e!464621 () Bool)

(assert (=> d!107021 e!464621))

(declare-fun res!566544 () Bool)

(assert (=> d!107021 (=> (not res!566544) (not e!464621))))

(assert (=> d!107021 (= res!566544 (isStrictlySorted!442 lt!377837))))

(assert (=> d!107021 (= (lemmaContainsTupThenGetReturnValue!230 lt!377837 (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483))) lt!378015)))

(declare-fun b!833032 () Bool)

(declare-fun res!566545 () Bool)

(assert (=> b!833032 (=> (not res!566545) (not e!464621))))

(assert (=> b!833032 (= res!566545 (containsKey!402 lt!377837 (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun b!833033 () Bool)

(assert (=> b!833033 (= e!464621 (contains!4212 lt!377837 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(assert (= (and d!107021 res!566544) b!833032))

(assert (= (and b!833032 res!566545) b!833033))

(assert (=> d!107021 m!776709))

(declare-fun m!777585 () Bool)

(assert (=> d!107021 m!777585))

(declare-fun m!777587 () Bool)

(assert (=> d!107021 m!777587))

(declare-fun m!777589 () Bool)

(assert (=> b!833032 m!777589))

(declare-fun m!777591 () Bool)

(assert (=> b!833033 m!777591))

(assert (=> d!106545 d!107021))

(declare-fun b!833034 () Bool)

(declare-fun e!464623 () List!15949)

(declare-fun call!36467 () List!15949)

(assert (=> b!833034 (= e!464623 call!36467)))

(declare-fun b!833035 () Bool)

(declare-fun e!464622 () List!15949)

(assert (=> b!833035 (= e!464622 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377488)) (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun bm!36463 () Bool)

(declare-fun call!36466 () List!15949)

(assert (=> bm!36463 (= call!36467 call!36466)))

(declare-fun b!833036 () Bool)

(assert (=> b!833036 (= e!464623 call!36467)))

(declare-fun c!90695 () Bool)

(declare-fun b!833037 () Bool)

(declare-fun c!90697 () Bool)

(assert (=> b!833037 (= e!464622 (ite c!90697 (t!22317 (toList!4505 lt!377488)) (ite c!90695 (Cons!15945 (h!17075 (toList!4505 lt!377488)) (t!22317 (toList!4505 lt!377488))) Nil!15946)))))

(declare-fun bm!36464 () Bool)

(declare-fun call!36468 () List!15949)

(declare-fun c!90698 () Bool)

(assert (=> bm!36464 (= call!36468 ($colon$colon!537 e!464622 (ite c!90698 (h!17075 (toList!4505 lt!377488)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483))))))))

(declare-fun c!90696 () Bool)

(assert (=> bm!36464 (= c!90696 c!90698)))

(declare-fun b!833038 () Bool)

(declare-fun res!566547 () Bool)

(declare-fun e!464625 () Bool)

(assert (=> b!833038 (=> (not res!566547) (not e!464625))))

(declare-fun lt!378016 () List!15949)

(assert (=> b!833038 (= res!566547 (containsKey!402 lt!378016 (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun b!833039 () Bool)

(declare-fun e!464626 () List!15949)

(assert (=> b!833039 (= e!464626 call!36468)))

(declare-fun b!833040 () Bool)

(assert (=> b!833040 (= c!90695 (and ((_ is Cons!15945) (toList!4505 lt!377488)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377488))) (_1!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(declare-fun e!464624 () List!15949)

(assert (=> b!833040 (= e!464624 e!464623)))

(declare-fun d!107023 () Bool)

(assert (=> d!107023 e!464625))

(declare-fun res!566546 () Bool)

(assert (=> d!107023 (=> (not res!566546) (not e!464625))))

(assert (=> d!107023 (= res!566546 (isStrictlySorted!442 lt!378016))))

(assert (=> d!107023 (= lt!378016 e!464626)))

(assert (=> d!107023 (= c!90698 (and ((_ is Cons!15945) (toList!4505 lt!377488)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377488))) (_1!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(assert (=> d!107023 (isStrictlySorted!442 (toList!4505 lt!377488))))

(assert (=> d!107023 (= (insertStrictlySorted!269 (toList!4505 lt!377488) (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483))) lt!378016)))

(declare-fun b!833041 () Bool)

(assert (=> b!833041 (= e!464624 call!36466)))

(declare-fun bm!36465 () Bool)

(assert (=> bm!36465 (= call!36466 call!36468)))

(declare-fun b!833042 () Bool)

(assert (=> b!833042 (= e!464625 (contains!4212 lt!378016 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377484 lt!377483)) (_2!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(declare-fun b!833043 () Bool)

(assert (=> b!833043 (= e!464626 e!464624)))

(assert (=> b!833043 (= c!90697 (and ((_ is Cons!15945) (toList!4505 lt!377488)) (= (_1!5089 (h!17075 (toList!4505 lt!377488))) (_1!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(assert (= (and d!107023 c!90698) b!833039))

(assert (= (and d!107023 (not c!90698)) b!833043))

(assert (= (and b!833043 c!90697) b!833041))

(assert (= (and b!833043 (not c!90697)) b!833040))

(assert (= (and b!833040 c!90695) b!833034))

(assert (= (and b!833040 (not c!90695)) b!833036))

(assert (= (or b!833034 b!833036) bm!36463))

(assert (= (or b!833041 bm!36463) bm!36465))

(assert (= (or b!833039 bm!36465) bm!36464))

(assert (= (and bm!36464 c!90696) b!833035))

(assert (= (and bm!36464 (not c!90696)) b!833037))

(assert (= (and d!107023 res!566546) b!833038))

(assert (= (and b!833038 res!566547) b!833042))

(declare-fun m!777593 () Bool)

(assert (=> d!107023 m!777593))

(declare-fun m!777595 () Bool)

(assert (=> d!107023 m!777595))

(declare-fun m!777597 () Bool)

(assert (=> b!833038 m!777597))

(declare-fun m!777599 () Bool)

(assert (=> b!833042 m!777599))

(declare-fun m!777601 () Bool)

(assert (=> bm!36464 m!777601))

(declare-fun m!777603 () Bool)

(assert (=> b!833035 m!777603))

(assert (=> d!106545 d!107023))

(assert (=> b!832244 d!106647))

(assert (=> d!106525 d!106523))

(declare-fun d!107025 () Bool)

(assert (=> d!107025 (= (getValueByKey!416 lt!377460 (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425)))))

(assert (=> d!107025 true))

(declare-fun _$22!578 () Unit!28493)

(assert (=> d!107025 (= (choose!1423 lt!377460 (_1!5089 lt!377425) (_2!5089 lt!377425)) _$22!578)))

(declare-fun bs!23315 () Bool)

(assert (= bs!23315 d!107025))

(assert (=> bs!23315 m!775765))

(assert (=> d!106525 d!107025))

(declare-fun d!107027 () Bool)

(declare-fun res!566548 () Bool)

(declare-fun e!464627 () Bool)

(assert (=> d!107027 (=> res!566548 e!464627)))

(assert (=> d!107027 (= res!566548 (or ((_ is Nil!15946) lt!377460) ((_ is Nil!15946) (t!22317 lt!377460))))))

(assert (=> d!107027 (= (isStrictlySorted!442 lt!377460) e!464627)))

(declare-fun b!833044 () Bool)

(declare-fun e!464628 () Bool)

(assert (=> b!833044 (= e!464627 e!464628)))

(declare-fun res!566549 () Bool)

(assert (=> b!833044 (=> (not res!566549) (not e!464628))))

(assert (=> b!833044 (= res!566549 (bvslt (_1!5089 (h!17075 lt!377460)) (_1!5089 (h!17075 (t!22317 lt!377460)))))))

(declare-fun b!833045 () Bool)

(assert (=> b!833045 (= e!464628 (isStrictlySorted!442 (t!22317 lt!377460)))))

(assert (= (and d!107027 (not res!566548)) b!833044))

(assert (= (and b!833044 res!566549) b!833045))

(declare-fun m!777605 () Bool)

(assert (=> b!833045 m!777605))

(assert (=> d!106525 d!107027))

(declare-fun d!107029 () Bool)

(declare-fun res!566550 () Bool)

(declare-fun e!464629 () Bool)

(assert (=> d!107029 (=> res!566550 e!464629)))

(assert (=> d!107029 (= res!566550 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (= (_1!5089 (h!17075 (toList!4505 lt!377494))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!107029 (= (containsKey!402 (toList!4505 lt!377494) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464629)))

(declare-fun b!833046 () Bool)

(declare-fun e!464630 () Bool)

(assert (=> b!833046 (= e!464629 e!464630)))

(declare-fun res!566551 () Bool)

(assert (=> b!833046 (=> (not res!566551) (not e!464630))))

(assert (=> b!833046 (= res!566551 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377494))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377494))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377494)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377494))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!833047 () Bool)

(assert (=> b!833047 (= e!464630 (containsKey!402 (t!22317 (toList!4505 lt!377494)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107029 (not res!566550)) b!833046))

(assert (= (and b!833046 res!566551) b!833047))

(assert (=> b!833047 m!775791))

(declare-fun m!777607 () Bool)

(assert (=> b!833047 m!777607))

(assert (=> d!106361 d!107029))

(declare-fun d!107031 () Bool)

(declare-fun lt!378017 () Bool)

(assert (=> d!107031 (= lt!378017 (select (content!388 lt!377608) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464632 () Bool)

(assert (=> d!107031 (= lt!378017 e!464632)))

(declare-fun res!566553 () Bool)

(assert (=> d!107031 (=> (not res!566553) (not e!464632))))

(assert (=> d!107031 (= res!566553 ((_ is Cons!15945) lt!377608))))

(assert (=> d!107031 (= (contains!4212 lt!377608 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!378017)))

(declare-fun b!833048 () Bool)

(declare-fun e!464631 () Bool)

(assert (=> b!833048 (= e!464632 e!464631)))

(declare-fun res!566552 () Bool)

(assert (=> b!833048 (=> res!566552 e!464631)))

(assert (=> b!833048 (= res!566552 (= (h!17075 lt!377608) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!833049 () Bool)

(assert (=> b!833049 (= e!464631 (contains!4212 (t!22317 lt!377608) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!107031 res!566553) b!833048))

(assert (= (and b!833048 (not res!566552)) b!833049))

(declare-fun m!777609 () Bool)

(assert (=> d!107031 m!777609))

(declare-fun m!777611 () Bool)

(assert (=> d!107031 m!777611))

(declare-fun m!777613 () Bool)

(assert (=> b!833049 m!777613))

(assert (=> b!832296 d!107031))

(declare-fun d!107033 () Bool)

(assert (=> d!107033 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!378018 () Unit!28493)

(assert (=> d!107033 (= lt!378018 (choose!1427 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464633 () Bool)

(assert (=> d!107033 e!464633))

(declare-fun res!566554 () Bool)

(assert (=> d!107033 (=> (not res!566554) (not e!464633))))

(assert (=> d!107033 (= res!566554 (isStrictlySorted!442 (toList!4505 lt!377554)))))

(assert (=> d!107033 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) lt!378018)))

(declare-fun b!833050 () Bool)

(assert (=> b!833050 (= e!464633 (containsKey!402 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107033 res!566554) b!833050))

(assert (=> d!107033 m!775791))

(assert (=> d!107033 m!776045))

(assert (=> d!107033 m!776045))

(assert (=> d!107033 m!776671))

(assert (=> d!107033 m!775791))

(declare-fun m!777615 () Bool)

(assert (=> d!107033 m!777615))

(assert (=> d!107033 m!776997))

(assert (=> b!833050 m!775791))

(assert (=> b!833050 m!776667))

(assert (=> b!832363 d!107033))

(declare-fun d!107035 () Bool)

(assert (=> d!107035 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23316 () Bool)

(assert (= bs!23316 d!107035))

(assert (=> bs!23316 m!776045))

(declare-fun m!777617 () Bool)

(assert (=> bs!23316 m!777617))

(assert (=> b!832363 d!107035))

(assert (=> b!832363 d!106909))

(declare-fun d!107037 () Bool)

(declare-fun e!464634 () Bool)

(assert (=> d!107037 e!464634))

(declare-fun res!566555 () Bool)

(assert (=> d!107037 (=> res!566555 e!464634)))

(declare-fun lt!378022 () Bool)

(assert (=> d!107037 (= res!566555 (not lt!378022))))

(declare-fun lt!378021 () Bool)

(assert (=> d!107037 (= lt!378022 lt!378021)))

(declare-fun lt!378020 () Unit!28493)

(declare-fun e!464635 () Unit!28493)

(assert (=> d!107037 (= lt!378020 e!464635)))

(declare-fun c!90699 () Bool)

(assert (=> d!107037 (= c!90699 lt!378021)))

(assert (=> d!107037 (= lt!378021 (containsKey!402 (toList!4505 lt!377750) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!107037 (= (contains!4211 lt!377750 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378022)))

(declare-fun b!833051 () Bool)

(declare-fun lt!378019 () Unit!28493)

(assert (=> b!833051 (= e!464635 lt!378019)))

(assert (=> b!833051 (= lt!378019 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377750) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833051 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377750) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833052 () Bool)

(declare-fun Unit!28539 () Unit!28493)

(assert (=> b!833052 (= e!464635 Unit!28539)))

(declare-fun b!833053 () Bool)

(assert (=> b!833053 (= e!464634 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107037 c!90699) b!833051))

(assert (= (and d!107037 (not c!90699)) b!833052))

(assert (= (and d!107037 (not res!566555)) b!833053))

(declare-fun m!777619 () Bool)

(assert (=> d!107037 m!777619))

(declare-fun m!777621 () Bool)

(assert (=> b!833051 m!777621))

(declare-fun m!777623 () Bool)

(assert (=> b!833051 m!777623))

(assert (=> b!833051 m!777623))

(declare-fun m!777625 () Bool)

(assert (=> b!833051 m!777625))

(assert (=> b!833053 m!777623))

(assert (=> b!833053 m!777623))

(assert (=> b!833053 m!777625))

(assert (=> d!106447 d!107037))

(assert (=> d!106447 d!106321))

(declare-fun d!107039 () Bool)

(assert (=> d!107039 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378023 () Unit!28493)

(assert (=> d!107039 (= lt!378023 (choose!1427 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464636 () Bool)

(assert (=> d!107039 e!464636))

(declare-fun res!566556 () Bool)

(assert (=> d!107039 (=> (not res!566556) (not e!464636))))

(assert (=> d!107039 (= res!566556 (isStrictlySorted!442 (toList!4505 lt!377487)))))

(assert (=> d!107039 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000) lt!378023)))

(declare-fun b!833054 () Bool)

(assert (=> b!833054 (= e!464636 (containsKey!402 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107039 res!566556) b!833054))

(assert (=> d!107039 m!776469))

(assert (=> d!107039 m!776469))

(assert (=> d!107039 m!776471))

(declare-fun m!777627 () Bool)

(assert (=> d!107039 m!777627))

(assert (=> d!107039 m!777341))

(assert (=> b!833054 m!776465))

(assert (=> b!832279 d!107039))

(declare-fun d!107041 () Bool)

(assert (=> d!107041 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23317 () Bool)

(assert (= bs!23317 d!107041))

(assert (=> bs!23317 m!776469))

(declare-fun m!777629 () Bool)

(assert (=> bs!23317 m!777629))

(assert (=> b!832279 d!107041))

(declare-fun b!833057 () Bool)

(declare-fun e!464638 () Option!422)

(assert (=> b!833057 (= e!464638 (getValueByKey!416 (t!22317 (toList!4505 lt!377487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833056 () Bool)

(declare-fun e!464637 () Option!422)

(assert (=> b!833056 (= e!464637 e!464638)))

(declare-fun c!90701 () Bool)

(assert (=> b!833056 (= c!90701 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377487))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833058 () Bool)

(assert (=> b!833058 (= e!464638 None!420)))

(declare-fun b!833055 () Bool)

(assert (=> b!833055 (= e!464637 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377487)))))))

(declare-fun d!107043 () Bool)

(declare-fun c!90700 () Bool)

(assert (=> d!107043 (= c!90700 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (= (_1!5089 (h!17075 (toList!4505 lt!377487))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107043 (= (getValueByKey!416 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000) e!464637)))

(assert (= (and d!107043 c!90700) b!833055))

(assert (= (and d!107043 (not c!90700)) b!833056))

(assert (= (and b!833056 c!90701) b!833057))

(assert (= (and b!833056 (not c!90701)) b!833058))

(declare-fun m!777631 () Bool)

(assert (=> b!833057 m!777631))

(assert (=> b!832279 d!107043))

(declare-fun d!107045 () Bool)

(assert (=> d!107045 (= (isEmpty!657 lt!377672) (isEmpty!658 (toList!4505 lt!377672)))))

(declare-fun bs!23318 () Bool)

(assert (= bs!23318 d!107045))

(declare-fun m!777633 () Bool)

(assert (=> bs!23318 m!777633))

(assert (=> b!832102 d!107045))

(declare-fun d!107047 () Bool)

(assert (=> d!107047 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377572) lt!377563)) (v!10101 (getValueByKey!416 (toList!4505 lt!377572) lt!377563)))))

(assert (=> d!106511 d!107047))

(declare-fun b!833061 () Bool)

(declare-fun e!464640 () Option!422)

(assert (=> b!833061 (= e!464640 (getValueByKey!416 (t!22317 (toList!4505 lt!377572)) lt!377563))))

(declare-fun b!833060 () Bool)

(declare-fun e!464639 () Option!422)

(assert (=> b!833060 (= e!464639 e!464640)))

(declare-fun c!90703 () Bool)

(assert (=> b!833060 (= c!90703 (and ((_ is Cons!15945) (toList!4505 lt!377572)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377572))) lt!377563))))))

(declare-fun b!833062 () Bool)

(assert (=> b!833062 (= e!464640 None!420)))

(declare-fun b!833059 () Bool)

(assert (=> b!833059 (= e!464639 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377572)))))))

(declare-fun d!107049 () Bool)

(declare-fun c!90702 () Bool)

(assert (=> d!107049 (= c!90702 (and ((_ is Cons!15945) (toList!4505 lt!377572)) (= (_1!5089 (h!17075 (toList!4505 lt!377572))) lt!377563)))))

(assert (=> d!107049 (= (getValueByKey!416 (toList!4505 lt!377572) lt!377563) e!464639)))

(assert (= (and d!107049 c!90702) b!833059))

(assert (= (and d!107049 (not c!90702)) b!833060))

(assert (= (and b!833060 c!90703) b!833061))

(assert (= (and b!833060 (not c!90703)) b!833062))

(declare-fun m!777635 () Bool)

(assert (=> b!833061 m!777635))

(assert (=> d!106511 d!107049))

(assert (=> b!832338 d!106869))

(assert (=> b!832338 d!106871))

(declare-fun d!107051 () Bool)

(declare-fun e!464641 () Bool)

(assert (=> d!107051 e!464641))

(declare-fun res!566557 () Bool)

(assert (=> d!107051 (=> (not res!566557) (not e!464641))))

(declare-fun lt!378027 () ListLongMap!8979)

(assert (=> d!107051 (= res!566557 (contains!4211 lt!378027 (_1!5089 (tuple2!10157 lt!377747 lt!377746))))))

(declare-fun lt!378026 () List!15949)

(assert (=> d!107051 (= lt!378027 (ListLongMap!8980 lt!378026))))

(declare-fun lt!378024 () Unit!28493)

(declare-fun lt!378025 () Unit!28493)

(assert (=> d!107051 (= lt!378024 lt!378025)))

(assert (=> d!107051 (= (getValueByKey!416 lt!378026 (_1!5089 (tuple2!10157 lt!377747 lt!377746))) (Some!421 (_2!5089 (tuple2!10157 lt!377747 lt!377746))))))

(assert (=> d!107051 (= lt!378025 (lemmaContainsTupThenGetReturnValue!230 lt!378026 (_1!5089 (tuple2!10157 lt!377747 lt!377746)) (_2!5089 (tuple2!10157 lt!377747 lt!377746))))))

(assert (=> d!107051 (= lt!378026 (insertStrictlySorted!269 (toList!4505 lt!377751) (_1!5089 (tuple2!10157 lt!377747 lt!377746)) (_2!5089 (tuple2!10157 lt!377747 lt!377746))))))

(assert (=> d!107051 (= (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746)) lt!378027)))

(declare-fun b!833063 () Bool)

(declare-fun res!566558 () Bool)

(assert (=> b!833063 (=> (not res!566558) (not e!464641))))

(assert (=> b!833063 (= res!566558 (= (getValueByKey!416 (toList!4505 lt!378027) (_1!5089 (tuple2!10157 lt!377747 lt!377746))) (Some!421 (_2!5089 (tuple2!10157 lt!377747 lt!377746)))))))

(declare-fun b!833064 () Bool)

(assert (=> b!833064 (= e!464641 (contains!4212 (toList!4505 lt!378027) (tuple2!10157 lt!377747 lt!377746)))))

(assert (= (and d!107051 res!566557) b!833063))

(assert (= (and b!833063 res!566558) b!833064))

(declare-fun m!777637 () Bool)

(assert (=> d!107051 m!777637))

(declare-fun m!777639 () Bool)

(assert (=> d!107051 m!777639))

(declare-fun m!777641 () Bool)

(assert (=> d!107051 m!777641))

(declare-fun m!777643 () Bool)

(assert (=> d!107051 m!777643))

(declare-fun m!777645 () Bool)

(assert (=> b!833063 m!777645))

(declare-fun m!777647 () Bool)

(assert (=> b!833064 m!777647))

(assert (=> b!832236 d!107051))

(declare-fun d!107053 () Bool)

(assert (=> d!107053 (not (contains!4211 (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746)) lt!377749))))

(declare-fun lt!378028 () Unit!28493)

(assert (=> d!107053 (= lt!378028 (choose!1426 lt!377751 lt!377747 lt!377746 lt!377749))))

(declare-fun e!464642 () Bool)

(assert (=> d!107053 e!464642))

(declare-fun res!566559 () Bool)

(assert (=> d!107053 (=> (not res!566559) (not e!464642))))

(assert (=> d!107053 (= res!566559 (not (contains!4211 lt!377751 lt!377749)))))

(assert (=> d!107053 (= (addStillNotContains!198 lt!377751 lt!377747 lt!377746 lt!377749) lt!378028)))

(declare-fun b!833065 () Bool)

(assert (=> b!833065 (= e!464642 (not (= lt!377747 lt!377749)))))

(assert (= (and d!107053 res!566559) b!833065))

(assert (=> d!107053 m!776407))

(assert (=> d!107053 m!776407))

(assert (=> d!107053 m!776411))

(declare-fun m!777649 () Bool)

(assert (=> d!107053 m!777649))

(declare-fun m!777651 () Bool)

(assert (=> d!107053 m!777651))

(assert (=> b!832236 d!107053))

(assert (=> b!832236 d!106813))

(declare-fun d!107055 () Bool)

(declare-fun e!464643 () Bool)

(assert (=> d!107055 e!464643))

(declare-fun res!566560 () Bool)

(assert (=> d!107055 (=> (not res!566560) (not e!464643))))

(declare-fun lt!378032 () ListLongMap!8979)

(assert (=> d!107055 (= res!566560 (contains!4211 lt!378032 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!378031 () List!15949)

(assert (=> d!107055 (= lt!378032 (ListLongMap!8980 lt!378031))))

(declare-fun lt!378029 () Unit!28493)

(declare-fun lt!378030 () Unit!28493)

(assert (=> d!107055 (= lt!378029 lt!378030)))

(assert (=> d!107055 (= (getValueByKey!416 lt!378031 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107055 (= lt!378030 (lemmaContainsTupThenGetReturnValue!230 lt!378031 (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107055 (= lt!378031 (insertStrictlySorted!269 (toList!4505 call!36415) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!107055 (= (+!1983 call!36415 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378032)))

(declare-fun b!833066 () Bool)

(declare-fun res!566561 () Bool)

(assert (=> b!833066 (=> (not res!566561) (not e!464643))))

(assert (=> b!833066 (= res!566561 (= (getValueByKey!416 (toList!4505 lt!378032) (_1!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5089 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!833067 () Bool)

(assert (=> b!833067 (= e!464643 (contains!4212 (toList!4505 lt!378032) (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107055 res!566560) b!833066))

(assert (= (and b!833066 res!566561) b!833067))

(declare-fun m!777653 () Bool)

(assert (=> d!107055 m!777653))

(declare-fun m!777655 () Bool)

(assert (=> d!107055 m!777655))

(declare-fun m!777657 () Bool)

(assert (=> d!107055 m!777657))

(declare-fun m!777659 () Bool)

(assert (=> d!107055 m!777659))

(declare-fun m!777661 () Bool)

(assert (=> b!833066 m!777661))

(declare-fun m!777663 () Bool)

(assert (=> b!833067 m!777663))

(assert (=> b!832236 d!107055))

(declare-fun d!107057 () Bool)

(declare-fun e!464644 () Bool)

(assert (=> d!107057 e!464644))

(declare-fun res!566562 () Bool)

(assert (=> d!107057 (=> res!566562 e!464644)))

(declare-fun lt!378036 () Bool)

(assert (=> d!107057 (= res!566562 (not lt!378036))))

(declare-fun lt!378035 () Bool)

(assert (=> d!107057 (= lt!378036 lt!378035)))

(declare-fun lt!378034 () Unit!28493)

(declare-fun e!464645 () Unit!28493)

(assert (=> d!107057 (= lt!378034 e!464645)))

(declare-fun c!90704 () Bool)

(assert (=> d!107057 (= c!90704 lt!378035)))

(assert (=> d!107057 (= lt!378035 (containsKey!402 (toList!4505 (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746))) lt!377749))))

(assert (=> d!107057 (= (contains!4211 (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746)) lt!377749) lt!378036)))

(declare-fun b!833068 () Bool)

(declare-fun lt!378033 () Unit!28493)

(assert (=> b!833068 (= e!464645 lt!378033)))

(assert (=> b!833068 (= lt!378033 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746))) lt!377749))))

(assert (=> b!833068 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746))) lt!377749))))

(declare-fun b!833069 () Bool)

(declare-fun Unit!28540 () Unit!28493)

(assert (=> b!833069 (= e!464645 Unit!28540)))

(declare-fun b!833070 () Bool)

(assert (=> b!833070 (= e!464644 (isDefined!312 (getValueByKey!416 (toList!4505 (+!1983 lt!377751 (tuple2!10157 lt!377747 lt!377746))) lt!377749)))))

(assert (= (and d!107057 c!90704) b!833068))

(assert (= (and d!107057 (not c!90704)) b!833069))

(assert (= (and d!107057 (not res!566562)) b!833070))

(declare-fun m!777665 () Bool)

(assert (=> d!107057 m!777665))

(declare-fun m!777667 () Bool)

(assert (=> b!833068 m!777667))

(declare-fun m!777669 () Bool)

(assert (=> b!833068 m!777669))

(assert (=> b!833068 m!777669))

(declare-fun m!777671 () Bool)

(assert (=> b!833068 m!777671))

(assert (=> b!833070 m!777669))

(assert (=> b!833070 m!777669))

(assert (=> b!833070 m!777671))

(assert (=> b!832236 d!107057))

(declare-fun e!464647 () Option!422)

(declare-fun b!833073 () Bool)

(assert (=> b!833073 (= e!464647 (getValueByKey!416 (t!22317 (toList!4505 lt!377838)) (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))

(declare-fun b!833072 () Bool)

(declare-fun e!464646 () Option!422)

(assert (=> b!833072 (= e!464646 e!464647)))

(declare-fun c!90706 () Bool)

(assert (=> b!833072 (= c!90706 (and ((_ is Cons!15945) (toList!4505 lt!377838)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377838))) (_1!5089 (tuple2!10157 lt!377484 lt!377483))))))))

(declare-fun b!833074 () Bool)

(assert (=> b!833074 (= e!464647 None!420)))

(declare-fun b!833071 () Bool)

(assert (=> b!833071 (= e!464646 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377838)))))))

(declare-fun c!90705 () Bool)

(declare-fun d!107059 () Bool)

(assert (=> d!107059 (= c!90705 (and ((_ is Cons!15945) (toList!4505 lt!377838)) (= (_1!5089 (h!17075 (toList!4505 lt!377838))) (_1!5089 (tuple2!10157 lt!377484 lt!377483)))))))

(assert (=> d!107059 (= (getValueByKey!416 (toList!4505 lt!377838) (_1!5089 (tuple2!10157 lt!377484 lt!377483))) e!464646)))

(assert (= (and d!107059 c!90705) b!833071))

(assert (= (and d!107059 (not c!90705)) b!833072))

(assert (= (and b!833072 c!90706) b!833073))

(assert (= (and b!833072 (not c!90706)) b!833074))

(declare-fun m!777673 () Bool)

(assert (=> b!833073 m!777673))

(assert (=> b!832387 d!107059))

(declare-fun d!107061 () Bool)

(assert (not d!107061))

(assert (=> b!832278 d!107061))

(declare-fun d!107063 () Bool)

(assert (=> d!107063 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378037 () Unit!28493)

(assert (=> d!107063 (= lt!378037 (choose!1427 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464648 () Bool)

(assert (=> d!107063 e!464648))

(declare-fun res!566563 () Bool)

(assert (=> d!107063 (=> (not res!566563) (not e!464648))))

(assert (=> d!107063 (= res!566563 (isStrictlySorted!442 (toList!4505 lt!377554)))))

(assert (=> d!107063 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000) lt!378037)))

(declare-fun b!833075 () Bool)

(assert (=> b!833075 (= e!464648 (containsKey!402 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107063 res!566563) b!833075))

(assert (=> d!107063 m!776453))

(assert (=> d!107063 m!776453))

(assert (=> d!107063 m!776455))

(declare-fun m!777675 () Bool)

(assert (=> d!107063 m!777675))

(assert (=> d!107063 m!776997))

(assert (=> b!833075 m!776449))

(assert (=> b!832270 d!107063))

(declare-fun d!107065 () Bool)

(assert (=> d!107065 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23319 () Bool)

(assert (= bs!23319 d!107065))

(assert (=> bs!23319 m!776453))

(declare-fun m!777677 () Bool)

(assert (=> bs!23319 m!777677))

(assert (=> b!832270 d!107065))

(assert (=> b!832270 d!106581))

(declare-fun d!107067 () Bool)

(declare-fun lt!378038 () Bool)

(assert (=> d!107067 (= lt!378038 (select (content!388 lt!377578) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun e!464650 () Bool)

(assert (=> d!107067 (= lt!378038 e!464650)))

(declare-fun res!566565 () Bool)

(assert (=> d!107067 (=> (not res!566565) (not e!464650))))

(assert (=> d!107067 (= res!566565 ((_ is Cons!15945) lt!377578))))

(assert (=> d!107067 (= (contains!4212 lt!377578 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))) lt!378038)))

(declare-fun b!833076 () Bool)

(declare-fun e!464649 () Bool)

(assert (=> b!833076 (= e!464650 e!464649)))

(declare-fun res!566564 () Bool)

(assert (=> b!833076 (=> res!566564 e!464649)))

(assert (=> b!833076 (= res!566564 (= (h!17075 lt!377578) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!833077 () Bool)

(assert (=> b!833077 (= e!464649 (contains!4212 (t!22317 lt!377578) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(assert (= (and d!107067 res!566565) b!833076))

(assert (= (and b!833076 (not res!566564)) b!833077))

(declare-fun m!777679 () Bool)

(assert (=> d!107067 m!777679))

(declare-fun m!777681 () Bool)

(assert (=> d!107067 m!777681))

(declare-fun m!777683 () Bool)

(assert (=> b!833077 m!777683))

(assert (=> b!832315 d!107067))

(declare-fun d!107069 () Bool)

(assert (=> d!107069 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!378039 () Unit!28493)

(assert (=> d!107069 (= lt!378039 (choose!1427 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464651 () Bool)

(assert (=> d!107069 e!464651))

(declare-fun res!566566 () Bool)

(assert (=> d!107069 (=> (not res!566566) (not e!464651))))

(assert (=> d!107069 (= res!566566 (isStrictlySorted!442 (toList!4505 lt!377605)))))

(assert (=> d!107069 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378039)))

(declare-fun b!833078 () Bool)

(assert (=> b!833078 (= e!464651 (containsKey!402 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107069 res!566566) b!833078))

(assert (=> d!107069 m!775971))

(assert (=> d!107069 m!775971))

(assert (=> d!107069 m!776367))

(declare-fun m!777685 () Bool)

(assert (=> d!107069 m!777685))

(declare-fun m!777687 () Bool)

(assert (=> d!107069 m!777687))

(assert (=> b!833078 m!776363))

(assert (=> b!832213 d!107069))

(declare-fun d!107071 () Bool)

(assert (=> d!107071 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23320 () Bool)

(assert (= bs!23320 d!107071))

(assert (=> bs!23320 m!775971))

(declare-fun m!777689 () Bool)

(assert (=> bs!23320 m!777689))

(assert (=> b!832213 d!107071))

(assert (=> b!832213 d!106533))

(declare-fun d!107073 () Bool)

(assert (=> d!107073 (= ($colon$colon!537 e!464125 (ite c!90432 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428))) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15945 (ite c!90432 (h!17075 (toList!4505 (+!1983 lt!377423 lt!377428))) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464125))))

(assert (=> bm!36410 d!107073))

(declare-fun d!107075 () Bool)

(assert (=> d!107075 (= (content!389 Nil!15947) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!106463 d!107075))

(declare-fun b!833081 () Bool)

(declare-fun e!464653 () Option!422)

(assert (=> b!833081 (= e!464653 (getValueByKey!416 (t!22317 (t!22317 lt!377604)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833080 () Bool)

(declare-fun e!464652 () Option!422)

(assert (=> b!833080 (= e!464652 e!464653)))

(declare-fun c!90708 () Bool)

(assert (=> b!833080 (= c!90708 (and ((_ is Cons!15945) (t!22317 lt!377604)) (not (= (_1!5089 (h!17075 (t!22317 lt!377604))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!833082 () Bool)

(assert (=> b!833082 (= e!464653 None!420)))

(declare-fun b!833079 () Bool)

(assert (=> b!833079 (= e!464652 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377604)))))))

(declare-fun d!107077 () Bool)

(declare-fun c!90707 () Bool)

(assert (=> d!107077 (= c!90707 (and ((_ is Cons!15945) (t!22317 lt!377604)) (= (_1!5089 (h!17075 (t!22317 lt!377604))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107077 (= (getValueByKey!416 (t!22317 lt!377604) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464652)))

(assert (= (and d!107077 c!90707) b!833079))

(assert (= (and d!107077 (not c!90707)) b!833080))

(assert (= (and b!833080 c!90708) b!833081))

(assert (= (and b!833080 (not c!90708)) b!833082))

(declare-fun m!777691 () Bool)

(assert (=> b!833081 m!777691))

(assert (=> b!832218 d!107077))

(declare-fun b!833083 () Bool)

(declare-fun e!464655 () List!15949)

(declare-fun call!36470 () List!15949)

(assert (=> b!833083 (= e!464655 call!36470)))

(declare-fun e!464654 () List!15949)

(declare-fun b!833084 () Bool)

(assert (=> b!833084 (= e!464654 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(declare-fun bm!36466 () Bool)

(declare-fun call!36469 () List!15949)

(assert (=> bm!36466 (= call!36470 call!36469)))

(declare-fun b!833085 () Bool)

(assert (=> b!833085 (= e!464655 call!36470)))

(declare-fun c!90711 () Bool)

(declare-fun c!90709 () Bool)

(declare-fun b!833086 () Bool)

(assert (=> b!833086 (= e!464654 (ite c!90711 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) (ite c!90709 (Cons!15945 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) (t!22317 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))))) Nil!15946)))))

(declare-fun c!90712 () Bool)

(declare-fun bm!36467 () Bool)

(declare-fun call!36471 () List!15949)

(assert (=> bm!36467 (= call!36471 ($colon$colon!537 e!464654 (ite c!90712 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425)))))))

(declare-fun c!90710 () Bool)

(assert (=> bm!36467 (= c!90710 c!90712)))

(declare-fun b!833087 () Bool)

(declare-fun res!566568 () Bool)

(declare-fun e!464657 () Bool)

(assert (=> b!833087 (=> (not res!566568) (not e!464657))))

(declare-fun lt!378040 () List!15949)

(assert (=> b!833087 (= res!566568 (containsKey!402 lt!378040 (_1!5089 lt!377425)))))

(declare-fun b!833088 () Bool)

(declare-fun e!464658 () List!15949)

(assert (=> b!833088 (= e!464658 call!36471)))

(declare-fun b!833089 () Bool)

(assert (=> b!833089 (= c!90709 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))))) (_1!5089 lt!377425))))))

(declare-fun e!464656 () List!15949)

(assert (=> b!833089 (= e!464656 e!464655)))

(declare-fun d!107079 () Bool)

(assert (=> d!107079 e!464657))

(declare-fun res!566567 () Bool)

(assert (=> d!107079 (=> (not res!566567) (not e!464657))))

(assert (=> d!107079 (= res!566567 (isStrictlySorted!442 lt!378040))))

(assert (=> d!107079 (= lt!378040 e!464658)))

(assert (=> d!107079 (= c!90712 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))))) (_1!5089 lt!377425))))))

(assert (=> d!107079 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))))))

(assert (=> d!107079 (= (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))) (_1!5089 lt!377425) (_2!5089 lt!377425)) lt!378040)))

(declare-fun b!833090 () Bool)

(assert (=> b!833090 (= e!464656 call!36469)))

(declare-fun bm!36468 () Bool)

(assert (=> bm!36468 (= call!36469 call!36471)))

(declare-fun b!833091 () Bool)

(assert (=> b!833091 (= e!464657 (contains!4212 lt!378040 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!833092 () Bool)

(assert (=> b!833092 (= e!464658 e!464656)))

(assert (=> b!833092 (= c!90711 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))))) (_1!5089 lt!377425))))))

(assert (= (and d!107079 c!90712) b!833088))

(assert (= (and d!107079 (not c!90712)) b!833092))

(assert (= (and b!833092 c!90711) b!833090))

(assert (= (and b!833092 (not c!90711)) b!833089))

(assert (= (and b!833089 c!90709) b!833083))

(assert (= (and b!833089 (not c!90709)) b!833085))

(assert (= (or b!833083 b!833085) bm!36466))

(assert (= (or b!833090 bm!36466) bm!36468))

(assert (= (or b!833088 bm!36468) bm!36467))

(assert (= (and bm!36467 c!90710) b!833084))

(assert (= (and bm!36467 (not c!90710)) b!833086))

(assert (= (and d!107079 res!566567) b!833087))

(assert (= (and b!833087 res!566568) b!833091))

(declare-fun m!777693 () Bool)

(assert (=> d!107079 m!777693))

(declare-fun m!777695 () Bool)

(assert (=> d!107079 m!777695))

(declare-fun m!777697 () Bool)

(assert (=> b!833087 m!777697))

(declare-fun m!777699 () Bool)

(assert (=> b!833091 m!777699))

(declare-fun m!777701 () Bool)

(assert (=> bm!36467 m!777701))

(declare-fun m!777703 () Bool)

(assert (=> b!833084 m!777703))

(assert (=> b!832354 d!107079))

(declare-fun d!107081 () Bool)

(declare-fun lt!378041 () Bool)

(assert (=> d!107081 (= lt!378041 (select (content!388 lt!377464) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464660 () Bool)

(assert (=> d!107081 (= lt!378041 e!464660)))

(declare-fun res!566570 () Bool)

(assert (=> d!107081 (=> (not res!566570) (not e!464660))))

(assert (=> d!107081 (= res!566570 ((_ is Cons!15945) lt!377464))))

(assert (=> d!107081 (= (contains!4212 lt!377464 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!378041)))

(declare-fun b!833093 () Bool)

(declare-fun e!464659 () Bool)

(assert (=> b!833093 (= e!464660 e!464659)))

(declare-fun res!566569 () Bool)

(assert (=> b!833093 (=> res!566569 e!464659)))

(assert (=> b!833093 (= res!566569 (= (h!17075 lt!377464) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!833094 () Bool)

(assert (=> b!833094 (= e!464659 (contains!4212 (t!22317 lt!377464) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!107081 res!566570) b!833093))

(assert (= (and b!833093 (not res!566569)) b!833094))

(declare-fun m!777705 () Bool)

(assert (=> d!107081 m!777705))

(declare-fun m!777707 () Bool)

(assert (=> d!107081 m!777707))

(declare-fun m!777709 () Bool)

(assert (=> b!833094 m!777709))

(assert (=> b!832128 d!107081))

(declare-fun d!107083 () Bool)

(declare-fun res!566571 () Bool)

(declare-fun e!464661 () Bool)

(assert (=> d!107083 (=> res!566571 e!464661)))

(assert (=> d!107083 (= res!566571 (= (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377505))))

(assert (=> d!107083 (= (arrayContainsKey!0 _keys!976 lt!377505 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!464661)))

(declare-fun b!833095 () Bool)

(declare-fun e!464662 () Bool)

(assert (=> b!833095 (= e!464661 e!464662)))

(declare-fun res!566572 () Bool)

(assert (=> b!833095 (=> (not res!566572) (not e!464662))))

(assert (=> b!833095 (= res!566572 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!833096 () Bool)

(assert (=> b!833096 (= e!464662 (arrayContainsKey!0 _keys!976 lt!377505 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!107083 (not res!566571)) b!833095))

(assert (= (and b!833095 res!566572) b!833096))

(assert (=> d!107083 m!776103))

(declare-fun m!777711 () Bool)

(assert (=> b!833096 m!777711))

(assert (=> b!832038 d!107083))

(assert (=> d!106455 d!106453))

(declare-fun d!107085 () Bool)

(assert (=> d!107085 (= (getValueByKey!416 lt!377612 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!107085 true))

(declare-fun _$22!579 () Unit!28493)

(assert (=> d!107085 (= (choose!1423 lt!377612 (_1!5089 lt!377428) (_2!5089 lt!377428)) _$22!579)))

(declare-fun bs!23321 () Bool)

(assert (= bs!23321 d!107085))

(assert (=> bs!23321 m!775989))

(assert (=> d!106455 d!107085))

(declare-fun d!107087 () Bool)

(declare-fun res!566573 () Bool)

(declare-fun e!464663 () Bool)

(assert (=> d!107087 (=> res!566573 e!464663)))

(assert (=> d!107087 (= res!566573 (or ((_ is Nil!15946) lt!377612) ((_ is Nil!15946) (t!22317 lt!377612))))))

(assert (=> d!107087 (= (isStrictlySorted!442 lt!377612) e!464663)))

(declare-fun b!833097 () Bool)

(declare-fun e!464664 () Bool)

(assert (=> b!833097 (= e!464663 e!464664)))

(declare-fun res!566574 () Bool)

(assert (=> b!833097 (=> (not res!566574) (not e!464664))))

(assert (=> b!833097 (= res!566574 (bvslt (_1!5089 (h!17075 lt!377612)) (_1!5089 (h!17075 (t!22317 lt!377612)))))))

(declare-fun b!833098 () Bool)

(assert (=> b!833098 (= e!464664 (isStrictlySorted!442 (t!22317 lt!377612)))))

(assert (= (and d!107087 (not res!566573)) b!833097))

(assert (= (and b!833097 res!566574) b!833098))

(declare-fun m!777713 () Bool)

(assert (=> b!833098 m!777713))

(assert (=> d!106455 d!107087))

(declare-fun d!107089 () Bool)

(assert (=> d!107089 (= ($colon$colon!537 e!464082 (ite c!90413 (h!17075 (toList!4505 lt!377422)) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))) (Cons!15945 (ite c!90413 (h!17075 (toList!4505 lt!377422)) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) e!464082))))

(assert (=> bm!36403 d!107089))

(declare-fun d!107091 () Bool)

(declare-fun res!566575 () Bool)

(declare-fun e!464665 () Bool)

(assert (=> d!107091 (=> res!566575 e!464665)))

(assert (=> d!107091 (= res!566575 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (= (_1!5089 (h!17075 (toList!4505 lt!377554))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!107091 (= (containsKey!402 (toList!4505 lt!377554) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)) e!464665)))

(declare-fun b!833099 () Bool)

(declare-fun e!464666 () Bool)

(assert (=> b!833099 (= e!464665 e!464666)))

(declare-fun res!566576 () Bool)

(assert (=> b!833099 (=> (not res!566576) (not e!464666))))

(assert (=> b!833099 (= res!566576 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377554))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377554))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15945) (toList!4505 lt!377554)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377554))) (select (arr!22334 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!833100 () Bool)

(assert (=> b!833100 (= e!464666 (containsKey!402 (t!22317 (toList!4505 lt!377554)) (select (arr!22334 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!107091 (not res!566575)) b!833099))

(assert (= (and b!833099 res!566576) b!833100))

(assert (=> b!833100 m!775791))

(declare-fun m!777715 () Bool)

(assert (=> b!833100 m!777715))

(assert (=> d!106529 d!107091))

(declare-fun d!107093 () Bool)

(declare-fun lt!378042 () Bool)

(assert (=> d!107093 (= lt!378042 (select (content!388 (t!22317 (toList!4505 lt!377465))) lt!377428))))

(declare-fun e!464668 () Bool)

(assert (=> d!107093 (= lt!378042 e!464668)))

(declare-fun res!566578 () Bool)

(assert (=> d!107093 (=> (not res!566578) (not e!464668))))

(assert (=> d!107093 (= res!566578 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377465))))))

(assert (=> d!107093 (= (contains!4212 (t!22317 (toList!4505 lt!377465)) lt!377428) lt!378042)))

(declare-fun b!833101 () Bool)

(declare-fun e!464667 () Bool)

(assert (=> b!833101 (= e!464668 e!464667)))

(declare-fun res!566577 () Bool)

(assert (=> b!833101 (=> res!566577 e!464667)))

(assert (=> b!833101 (= res!566577 (= (h!17075 (t!22317 (toList!4505 lt!377465))) lt!377428))))

(declare-fun b!833102 () Bool)

(assert (=> b!833102 (= e!464667 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377465))) lt!377428))))

(assert (= (and d!107093 res!566578) b!833101))

(assert (= (and b!833101 (not res!566577)) b!833102))

(declare-fun m!777717 () Bool)

(assert (=> d!107093 m!777717))

(declare-fun m!777719 () Bool)

(assert (=> d!107093 m!777719))

(declare-fun m!777721 () Bool)

(assert (=> b!833102 m!777721))

(assert (=> b!832417 d!107093))

(declare-fun d!107095 () Bool)

(assert (=> d!107095 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10101 (getValueByKey!416 (toList!4505 lt!377580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106479 d!107095))

(assert (=> d!106479 d!106691))

(assert (=> b!832032 d!106863))

(assert (=> b!832032 d!106679))

(declare-fun d!107097 () Bool)

(declare-fun c!90713 () Bool)

(assert (=> d!107097 (= c!90713 ((_ is Nil!15946) (toList!4505 lt!377579)))))

(declare-fun e!464669 () (InoxSet tuple2!10156))

(assert (=> d!107097 (= (content!388 (toList!4505 lt!377579)) e!464669)))

(declare-fun b!833103 () Bool)

(assert (=> b!833103 (= e!464669 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833104 () Bool)

(assert (=> b!833104 (= e!464669 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377579)) true) (content!388 (t!22317 (toList!4505 lt!377579)))))))

(assert (= (and d!107097 c!90713) b!833103))

(assert (= (and d!107097 (not c!90713)) b!833104))

(declare-fun m!777723 () Bool)

(assert (=> b!833104 m!777723))

(assert (=> b!833104 m!777195))

(assert (=> d!106389 d!107097))

(declare-fun d!107099 () Bool)

(declare-fun res!566579 () Bool)

(declare-fun e!464670 () Bool)

(assert (=> d!107099 (=> res!566579 e!464670)))

(assert (=> d!107099 (= res!566579 (or ((_ is Nil!15946) lt!377815) ((_ is Nil!15946) (t!22317 lt!377815))))))

(assert (=> d!107099 (= (isStrictlySorted!442 lt!377815) e!464670)))

(declare-fun b!833105 () Bool)

(declare-fun e!464671 () Bool)

(assert (=> b!833105 (= e!464670 e!464671)))

(declare-fun res!566580 () Bool)

(assert (=> b!833105 (=> (not res!566580) (not e!464671))))

(assert (=> b!833105 (= res!566580 (bvslt (_1!5089 (h!17075 lt!377815)) (_1!5089 (h!17075 (t!22317 lt!377815)))))))

(declare-fun b!833106 () Bool)

(assert (=> b!833106 (= e!464671 (isStrictlySorted!442 (t!22317 lt!377815)))))

(assert (= (and d!107099 (not res!566579)) b!833105))

(assert (= (and b!833105 res!566580) b!833106))

(declare-fun m!777725 () Bool)

(assert (=> b!833106 m!777725))

(assert (=> d!106527 d!107099))

(declare-fun d!107101 () Bool)

(declare-fun res!566581 () Bool)

(declare-fun e!464672 () Bool)

(assert (=> d!107101 (=> res!566581 e!464672)))

(assert (=> d!107101 (= res!566581 (or ((_ is Nil!15946) (toList!4505 (+!1983 lt!377422 lt!377428))) ((_ is Nil!15946) (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428))))))))

(assert (=> d!107101 (= (isStrictlySorted!442 (toList!4505 (+!1983 lt!377422 lt!377428))) e!464672)))

(declare-fun b!833107 () Bool)

(declare-fun e!464673 () Bool)

(assert (=> b!833107 (= e!464672 e!464673)))

(declare-fun res!566582 () Bool)

(assert (=> b!833107 (=> (not res!566582) (not e!464673))))

(assert (=> b!833107 (= res!566582 (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377428)))) (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))))))))

(declare-fun b!833108 () Bool)

(assert (=> b!833108 (= e!464673 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377422 lt!377428)))))))

(assert (= (and d!107101 (not res!566581)) b!833107))

(assert (= (and b!833107 res!566582) b!833108))

(assert (=> b!833108 m!777695))

(assert (=> d!106527 d!107101))

(declare-fun d!107103 () Bool)

(assert (=> d!107103 (= (isEmpty!658 (toList!4505 lt!377487)) ((_ is Nil!15946) (toList!4505 lt!377487)))))

(assert (=> d!106353 d!107103))

(assert (=> d!106411 d!106407))

(assert (=> d!106411 d!106421))

(declare-fun d!107105 () Bool)

(assert (=> d!107105 (contains!4211 (+!1983 lt!377583 (tuple2!10157 lt!377590 zeroValueAfter!34)) lt!377592)))

(assert (=> d!107105 true))

(declare-fun _$35!428 () Unit!28493)

(assert (=> d!107105 (= (choose!1425 lt!377583 lt!377590 zeroValueAfter!34 lt!377592) _$35!428)))

(declare-fun bs!23322 () Bool)

(assert (= bs!23322 d!107105))

(assert (=> bs!23322 m!775923))

(assert (=> bs!23322 m!775923))

(assert (=> bs!23322 m!775925))

(assert (=> d!106411 d!107105))

(declare-fun d!107107 () Bool)

(declare-fun e!464674 () Bool)

(assert (=> d!107107 e!464674))

(declare-fun res!566583 () Bool)

(assert (=> d!107107 (=> res!566583 e!464674)))

(declare-fun lt!378046 () Bool)

(assert (=> d!107107 (= res!566583 (not lt!378046))))

(declare-fun lt!378045 () Bool)

(assert (=> d!107107 (= lt!378046 lt!378045)))

(declare-fun lt!378044 () Unit!28493)

(declare-fun e!464675 () Unit!28493)

(assert (=> d!107107 (= lt!378044 e!464675)))

(declare-fun c!90714 () Bool)

(assert (=> d!107107 (= c!90714 lt!378045)))

(assert (=> d!107107 (= lt!378045 (containsKey!402 (toList!4505 lt!377583) lt!377592))))

(assert (=> d!107107 (= (contains!4211 lt!377583 lt!377592) lt!378046)))

(declare-fun b!833110 () Bool)

(declare-fun lt!378043 () Unit!28493)

(assert (=> b!833110 (= e!464675 lt!378043)))

(assert (=> b!833110 (= lt!378043 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377583) lt!377592))))

(assert (=> b!833110 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377583) lt!377592))))

(declare-fun b!833111 () Bool)

(declare-fun Unit!28541 () Unit!28493)

(assert (=> b!833111 (= e!464675 Unit!28541)))

(declare-fun b!833112 () Bool)

(assert (=> b!833112 (= e!464674 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377583) lt!377592)))))

(assert (= (and d!107107 c!90714) b!833110))

(assert (= (and d!107107 (not c!90714)) b!833111))

(assert (= (and d!107107 (not res!566583)) b!833112))

(declare-fun m!777727 () Bool)

(assert (=> d!107107 m!777727))

(declare-fun m!777729 () Bool)

(assert (=> b!833110 m!777729))

(declare-fun m!777731 () Bool)

(assert (=> b!833110 m!777731))

(assert (=> b!833110 m!777731))

(declare-fun m!777733 () Bool)

(assert (=> b!833110 m!777733))

(assert (=> b!833112 m!777731))

(assert (=> b!833112 m!777731))

(assert (=> b!833112 m!777733))

(assert (=> d!106411 d!107107))

(declare-fun b!833113 () Bool)

(declare-fun e!464677 () List!15949)

(declare-fun call!36473 () List!15949)

(assert (=> b!833113 (= e!464677 call!36473)))

(declare-fun e!464676 () List!15949)

(declare-fun b!833114 () Bool)

(assert (=> b!833114 (= e!464676 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36469 () Bool)

(declare-fun call!36472 () List!15949)

(assert (=> bm!36469 (= call!36473 call!36472)))

(declare-fun b!833115 () Bool)

(assert (=> b!833115 (= e!464677 call!36473)))

(declare-fun c!90715 () Bool)

(declare-fun c!90717 () Bool)

(declare-fun b!833116 () Bool)

(assert (=> b!833116 (= e!464676 (ite c!90717 (t!22317 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (ite c!90715 (Cons!15945 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (t!22317 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) Nil!15946)))))

(declare-fun c!90718 () Bool)

(declare-fun call!36474 () List!15949)

(declare-fun bm!36470 () Bool)

(assert (=> bm!36470 (= call!36474 ($colon$colon!537 e!464676 (ite c!90718 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90716 () Bool)

(assert (=> bm!36470 (= c!90716 c!90718)))

(declare-fun b!833117 () Bool)

(declare-fun res!566585 () Bool)

(declare-fun e!464679 () Bool)

(assert (=> b!833117 (=> (not res!566585) (not e!464679))))

(declare-fun lt!378047 () List!15949)

(assert (=> b!833117 (= res!566585 (containsKey!402 lt!378047 (_1!5089 lt!377428)))))

(declare-fun b!833118 () Bool)

(declare-fun e!464680 () List!15949)

(assert (=> b!833118 (= e!464680 call!36474)))

(declare-fun b!833119 () Bool)

(assert (=> b!833119 (= c!90715 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5089 lt!377428))))))

(declare-fun e!464678 () List!15949)

(assert (=> b!833119 (= e!464678 e!464677)))

(declare-fun d!107109 () Bool)

(assert (=> d!107109 e!464679))

(declare-fun res!566584 () Bool)

(assert (=> d!107109 (=> (not res!566584) (not e!464679))))

(assert (=> d!107109 (= res!566584 (isStrictlySorted!442 lt!378047))))

(assert (=> d!107109 (= lt!378047 e!464680)))

(assert (=> d!107109 (= c!90718 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5089 lt!377428))))))

(assert (=> d!107109 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107109 (= (insertStrictlySorted!269 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!378047)))

(declare-fun b!833120 () Bool)

(assert (=> b!833120 (= e!464678 call!36472)))

(declare-fun bm!36471 () Bool)

(assert (=> bm!36471 (= call!36472 call!36474)))

(declare-fun b!833121 () Bool)

(assert (=> b!833121 (= e!464679 (contains!4212 lt!378047 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!833122 () Bool)

(assert (=> b!833122 (= e!464680 e!464678)))

(assert (=> b!833122 (= c!90717 (and ((_ is Cons!15945) (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5089 lt!377428))))))

(assert (= (and d!107109 c!90718) b!833118))

(assert (= (and d!107109 (not c!90718)) b!833122))

(assert (= (and b!833122 c!90717) b!833120))

(assert (= (and b!833122 (not c!90717)) b!833119))

(assert (= (and b!833119 c!90715) b!833113))

(assert (= (and b!833119 (not c!90715)) b!833115))

(assert (= (or b!833113 b!833115) bm!36469))

(assert (= (or b!833120 bm!36469) bm!36471))

(assert (= (or b!833118 bm!36471) bm!36470))

(assert (= (and bm!36470 c!90716) b!833114))

(assert (= (and bm!36470 (not c!90716)) b!833116))

(assert (= (and d!107109 res!566584) b!833117))

(assert (= (and b!833117 res!566585) b!833121))

(declare-fun m!777735 () Bool)

(assert (=> d!107109 m!777735))

(declare-fun m!777737 () Bool)

(assert (=> d!107109 m!777737))

(declare-fun m!777739 () Bool)

(assert (=> b!833117 m!777739))

(declare-fun m!777741 () Bool)

(assert (=> b!833121 m!777741))

(declare-fun m!777743 () Bool)

(assert (=> bm!36470 m!777743))

(declare-fun m!777745 () Bool)

(assert (=> b!833114 m!777745))

(assert (=> b!832261 d!107109))

(declare-fun d!107111 () Bool)

(declare-fun lt!378048 () Bool)

(assert (=> d!107111 (= lt!378048 (select (content!388 (t!22317 (toList!4505 lt!377509))) lt!377428))))

(declare-fun e!464682 () Bool)

(assert (=> d!107111 (= lt!378048 e!464682)))

(declare-fun res!566587 () Bool)

(assert (=> d!107111 (=> (not res!566587) (not e!464682))))

(assert (=> d!107111 (= res!566587 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377509))))))

(assert (=> d!107111 (= (contains!4212 (t!22317 (toList!4505 lt!377509)) lt!377428) lt!378048)))

(declare-fun b!833123 () Bool)

(declare-fun e!464681 () Bool)

(assert (=> b!833123 (= e!464682 e!464681)))

(declare-fun res!566586 () Bool)

(assert (=> b!833123 (=> res!566586 e!464681)))

(assert (=> b!833123 (= res!566586 (= (h!17075 (t!22317 (toList!4505 lt!377509))) lt!377428))))

(declare-fun b!833124 () Bool)

(assert (=> b!833124 (= e!464681 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377509))) lt!377428))))

(assert (= (and d!107111 res!566587) b!833123))

(assert (= (and b!833123 (not res!566586)) b!833124))

(assert (=> d!107111 m!777547))

(declare-fun m!777747 () Bool)

(assert (=> d!107111 m!777747))

(declare-fun m!777749 () Bool)

(assert (=> b!833124 m!777749))

(assert (=> b!832186 d!107111))

(declare-fun d!107113 () Bool)

(declare-fun lt!378049 () Bool)

(assert (=> d!107113 (= lt!378049 (select (content!388 lt!377848) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464684 () Bool)

(assert (=> d!107113 (= lt!378049 e!464684)))

(declare-fun res!566589 () Bool)

(assert (=> d!107113 (=> (not res!566589) (not e!464684))))

(assert (=> d!107113 (= res!566589 ((_ is Cons!15945) lt!377848))))

(assert (=> d!107113 (= (contains!4212 lt!377848 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!378049)))

(declare-fun b!833125 () Bool)

(declare-fun e!464683 () Bool)

(assert (=> b!833125 (= e!464684 e!464683)))

(declare-fun res!566588 () Bool)

(assert (=> b!833125 (=> res!566588 e!464683)))

(assert (=> b!833125 (= res!566588 (= (h!17075 lt!377848) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!833126 () Bool)

(assert (=> b!833126 (= e!464683 (contains!4212 (t!22317 lt!377848) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!107113 res!566589) b!833125))

(assert (= (and b!833125 (not res!566588)) b!833126))

(declare-fun m!777751 () Bool)

(assert (=> d!107113 m!777751))

(declare-fun m!777753 () Bool)

(assert (=> d!107113 m!777753))

(declare-fun m!777755 () Bool)

(assert (=> b!833126 m!777755))

(assert (=> b!832408 d!107113))

(assert (=> b!832290 d!106951))

(assert (=> b!832290 d!106489))

(declare-fun b!833129 () Bool)

(declare-fun e!464686 () Option!422)

(assert (=> b!833129 (= e!464686 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377509))) (_1!5089 lt!377428)))))

(declare-fun b!833128 () Bool)

(declare-fun e!464685 () Option!422)

(assert (=> b!833128 (= e!464685 e!464686)))

(declare-fun c!90720 () Bool)

(assert (=> b!833128 (= c!90720 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377509))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377509)))) (_1!5089 lt!377428)))))))

(declare-fun b!833130 () Bool)

(assert (=> b!833130 (= e!464686 None!420)))

(declare-fun b!833127 () Bool)

(assert (=> b!833127 (= e!464685 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377509))))))))

(declare-fun d!107115 () Bool)

(declare-fun c!90719 () Bool)

(assert (=> d!107115 (= c!90719 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377509))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377509)))) (_1!5089 lt!377428))))))

(assert (=> d!107115 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377509)) (_1!5089 lt!377428)) e!464685)))

(assert (= (and d!107115 c!90719) b!833127))

(assert (= (and d!107115 (not c!90719)) b!833128))

(assert (= (and b!833128 c!90720) b!833129))

(assert (= (and b!833128 (not c!90720)) b!833130))

(declare-fun m!777757 () Bool)

(assert (=> b!833129 m!777757))

(assert (=> b!832414 d!107115))

(declare-fun d!107117 () Bool)

(assert (=> d!107117 (= (isEmpty!657 lt!377750) (isEmpty!658 (toList!4505 lt!377750)))))

(declare-fun bs!23323 () Bool)

(assert (= bs!23323 d!107117))

(declare-fun m!777759 () Bool)

(assert (=> bs!23323 m!777759))

(assert (=> b!832243 d!107117))

(declare-fun d!107119 () Bool)

(declare-fun lt!378050 () Bool)

(assert (=> d!107119 (= lt!378050 (select (content!388 (toList!4505 lt!377773)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!464688 () Bool)

(assert (=> d!107119 (= lt!378050 e!464688)))

(declare-fun res!566591 () Bool)

(assert (=> d!107119 (=> (not res!566591) (not e!464688))))

(assert (=> d!107119 (= res!566591 ((_ is Cons!15945) (toList!4505 lt!377773)))))

(assert (=> d!107119 (= (contains!4212 (toList!4505 lt!377773) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!378050)))

(declare-fun b!833131 () Bool)

(declare-fun e!464687 () Bool)

(assert (=> b!833131 (= e!464688 e!464687)))

(declare-fun res!566590 () Bool)

(assert (=> b!833131 (=> res!566590 e!464687)))

(assert (=> b!833131 (= res!566590 (= (h!17075 (toList!4505 lt!377773)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!833132 () Bool)

(assert (=> b!833132 (= e!464687 (contains!4212 (t!22317 (toList!4505 lt!377773)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!107119 res!566591) b!833131))

(assert (= (and b!833131 (not res!566590)) b!833132))

(declare-fun m!777761 () Bool)

(assert (=> d!107119 m!777761))

(declare-fun m!777763 () Bool)

(assert (=> d!107119 m!777763))

(declare-fun m!777765 () Bool)

(assert (=> b!833132 m!777765))

(assert (=> b!832287 d!107119))

(declare-fun d!107121 () Bool)

(declare-fun lt!378051 () Bool)

(assert (=> d!107121 (= lt!378051 (select (content!388 (toList!4505 lt!377725)) (tuple2!10157 lt!377585 minValue!754)))))

(declare-fun e!464690 () Bool)

(assert (=> d!107121 (= lt!378051 e!464690)))

(declare-fun res!566593 () Bool)

(assert (=> d!107121 (=> (not res!566593) (not e!464690))))

(assert (=> d!107121 (= res!566593 ((_ is Cons!15945) (toList!4505 lt!377725)))))

(assert (=> d!107121 (= (contains!4212 (toList!4505 lt!377725) (tuple2!10157 lt!377585 minValue!754)) lt!378051)))

(declare-fun b!833133 () Bool)

(declare-fun e!464689 () Bool)

(assert (=> b!833133 (= e!464690 e!464689)))

(declare-fun res!566592 () Bool)

(assert (=> b!833133 (=> res!566592 e!464689)))

(assert (=> b!833133 (= res!566592 (= (h!17075 (toList!4505 lt!377725)) (tuple2!10157 lt!377585 minValue!754)))))

(declare-fun b!833134 () Bool)

(assert (=> b!833134 (= e!464689 (contains!4212 (t!22317 (toList!4505 lt!377725)) (tuple2!10157 lt!377585 minValue!754)))))

(assert (= (and d!107121 res!566593) b!833133))

(assert (= (and b!833133 (not res!566592)) b!833134))

(declare-fun m!777767 () Bool)

(assert (=> d!107121 m!777767))

(declare-fun m!777769 () Bool)

(assert (=> d!107121 m!777769))

(declare-fun m!777771 () Bool)

(assert (=> b!833134 m!777771))

(assert (=> b!832202 d!107121))

(declare-fun d!107123 () Bool)

(declare-fun res!566594 () Bool)

(declare-fun e!464691 () Bool)

(assert (=> d!107123 (=> res!566594 e!464691)))

(assert (=> d!107123 (= res!566594 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (= (_1!5089 (h!17075 (toList!4505 lt!377487))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107123 (= (containsKey!402 (toList!4505 lt!377487) #b1000000000000000000000000000000000000000000000000000000000000000) e!464691)))

(declare-fun b!833135 () Bool)

(declare-fun e!464692 () Bool)

(assert (=> b!833135 (= e!464691 e!464692)))

(declare-fun res!566595 () Bool)

(assert (=> b!833135 (=> (not res!566595) (not e!464692))))

(assert (=> b!833135 (= res!566595 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377487))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377487))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377487)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377487))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833136 () Bool)

(assert (=> b!833136 (= e!464692 (containsKey!402 (t!22317 (toList!4505 lt!377487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107123 (not res!566594)) b!833135))

(assert (= (and b!833135 res!566595) b!833136))

(declare-fun m!777773 () Bool)

(assert (=> b!833136 m!777773))

(assert (=> d!106465 d!107123))

(declare-fun lt!378052 () Bool)

(declare-fun d!107125 () Bool)

(assert (=> d!107125 (= lt!378052 (select (content!388 (toList!4505 lt!377804)) (tuple2!10157 lt!377559 minValue!754)))))

(declare-fun e!464694 () Bool)

(assert (=> d!107125 (= lt!378052 e!464694)))

(declare-fun res!566597 () Bool)

(assert (=> d!107125 (=> (not res!566597) (not e!464694))))

(assert (=> d!107125 (= res!566597 ((_ is Cons!15945) (toList!4505 lt!377804)))))

(assert (=> d!107125 (= (contains!4212 (toList!4505 lt!377804) (tuple2!10157 lt!377559 minValue!754)) lt!378052)))

(declare-fun b!833137 () Bool)

(declare-fun e!464693 () Bool)

(assert (=> b!833137 (= e!464694 e!464693)))

(declare-fun res!566596 () Bool)

(assert (=> b!833137 (=> res!566596 e!464693)))

(assert (=> b!833137 (= res!566596 (= (h!17075 (toList!4505 lt!377804)) (tuple2!10157 lt!377559 minValue!754)))))

(declare-fun b!833138 () Bool)

(assert (=> b!833138 (= e!464693 (contains!4212 (t!22317 (toList!4505 lt!377804)) (tuple2!10157 lt!377559 minValue!754)))))

(assert (= (and d!107125 res!566597) b!833137))

(assert (= (and b!833137 (not res!566596)) b!833138))

(declare-fun m!777775 () Bool)

(assert (=> d!107125 m!777775))

(declare-fun m!777777 () Bool)

(assert (=> d!107125 m!777777))

(declare-fun m!777779 () Bool)

(assert (=> b!833138 m!777779))

(assert (=> b!832340 d!107125))

(declare-fun d!107127 () Bool)

(declare-fun lt!378053 () Bool)

(assert (=> d!107127 (= lt!378053 (select (content!388 (toList!4505 lt!377711)) (tuple2!10157 lt!377586 zeroValueAfter!34)))))

(declare-fun e!464696 () Bool)

(assert (=> d!107127 (= lt!378053 e!464696)))

(declare-fun res!566599 () Bool)

(assert (=> d!107127 (=> (not res!566599) (not e!464696))))

(assert (=> d!107127 (= res!566599 ((_ is Cons!15945) (toList!4505 lt!377711)))))

(assert (=> d!107127 (= (contains!4212 (toList!4505 lt!377711) (tuple2!10157 lt!377586 zeroValueAfter!34)) lt!378053)))

(declare-fun b!833139 () Bool)

(declare-fun e!464695 () Bool)

(assert (=> b!833139 (= e!464696 e!464695)))

(declare-fun res!566598 () Bool)

(assert (=> b!833139 (=> res!566598 e!464695)))

(assert (=> b!833139 (= res!566598 (= (h!17075 (toList!4505 lt!377711)) (tuple2!10157 lt!377586 zeroValueAfter!34)))))

(declare-fun b!833140 () Bool)

(assert (=> b!833140 (= e!464695 (contains!4212 (t!22317 (toList!4505 lt!377711)) (tuple2!10157 lt!377586 zeroValueAfter!34)))))

(assert (= (and d!107127 res!566599) b!833139))

(assert (= (and b!833139 (not res!566598)) b!833140))

(declare-fun m!777781 () Bool)

(assert (=> d!107127 m!777781))

(declare-fun m!777783 () Bool)

(assert (=> d!107127 m!777783))

(declare-fun m!777785 () Bool)

(assert (=> b!833140 m!777785))

(assert (=> b!832192 d!107127))

(declare-fun d!107129 () Bool)

(declare-fun res!566600 () Bool)

(declare-fun e!464697 () Bool)

(assert (=> d!107129 (=> res!566600 e!464697)))

(assert (=> d!107129 (= res!566600 (and ((_ is Cons!15945) lt!377608) (= (_1!5089 (h!17075 lt!377608)) (_1!5089 lt!377428))))))

(assert (=> d!107129 (= (containsKey!402 lt!377608 (_1!5089 lt!377428)) e!464697)))

(declare-fun b!833141 () Bool)

(declare-fun e!464698 () Bool)

(assert (=> b!833141 (= e!464697 e!464698)))

(declare-fun res!566601 () Bool)

(assert (=> b!833141 (=> (not res!566601) (not e!464698))))

(assert (=> b!833141 (= res!566601 (and (or (not ((_ is Cons!15945) lt!377608)) (bvsle (_1!5089 (h!17075 lt!377608)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377608) (bvslt (_1!5089 (h!17075 lt!377608)) (_1!5089 lt!377428))))))

(declare-fun b!833142 () Bool)

(assert (=> b!833142 (= e!464698 (containsKey!402 (t!22317 lt!377608) (_1!5089 lt!377428)))))

(assert (= (and d!107129 (not res!566600)) b!833141))

(assert (= (and b!833141 res!566601) b!833142))

(declare-fun m!777787 () Bool)

(assert (=> b!833142 m!777787))

(assert (=> b!832295 d!107129))

(assert (=> b!832093 d!106923))

(assert (=> b!832093 d!106763))

(declare-fun d!107131 () Bool)

(assert (=> d!107131 (= (get!11826 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832062 d!107131))

(assert (=> b!832195 d!106933))

(assert (=> b!832195 d!106935))

(declare-fun d!107133 () Bool)

(assert (=> d!107133 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378054 () Unit!28493)

(assert (=> d!107133 (= lt!378054 (choose!1427 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464699 () Bool)

(assert (=> d!107133 e!464699))

(declare-fun res!566602 () Bool)

(assert (=> d!107133 (=> (not res!566602) (not e!464699))))

(assert (=> d!107133 (= res!566602 (isStrictlySorted!442 (toList!4505 lt!377487)))))

(assert (=> d!107133 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000) lt!378054)))

(declare-fun b!833143 () Bool)

(assert (=> b!833143 (= e!464699 (containsKey!402 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107133 res!566602) b!833143))

(assert (=> d!107133 m!776121))

(assert (=> d!107133 m!776121))

(assert (=> d!107133 m!776123))

(declare-fun m!777789 () Bool)

(assert (=> d!107133 m!777789))

(assert (=> d!107133 m!777341))

(assert (=> b!833143 m!776117))

(assert (=> b!832088 d!107133))

(declare-fun d!107135 () Bool)

(assert (=> d!107135 (= (isDefined!312 (getValueByKey!416 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!659 (getValueByKey!416 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23324 () Bool)

(assert (= bs!23324 d!107135))

(assert (=> bs!23324 m!776121))

(declare-fun m!777791 () Bool)

(assert (=> bs!23324 m!777791))

(assert (=> b!832088 d!107135))

(declare-fun b!833146 () Bool)

(declare-fun e!464701 () Option!422)

(assert (=> b!833146 (= e!464701 (getValueByKey!416 (t!22317 (toList!4505 lt!377487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833145 () Bool)

(declare-fun e!464700 () Option!422)

(assert (=> b!833145 (= e!464700 e!464701)))

(declare-fun c!90722 () Bool)

(assert (=> b!833145 (= c!90722 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377487))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833147 () Bool)

(assert (=> b!833147 (= e!464701 None!420)))

(declare-fun b!833144 () Bool)

(assert (=> b!833144 (= e!464700 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377487)))))))

(declare-fun d!107137 () Bool)

(declare-fun c!90721 () Bool)

(assert (=> d!107137 (= c!90721 (and ((_ is Cons!15945) (toList!4505 lt!377487)) (= (_1!5089 (h!17075 (toList!4505 lt!377487))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107137 (= (getValueByKey!416 (toList!4505 lt!377487) #b0000000000000000000000000000000000000000000000000000000000000000) e!464700)))

(assert (= (and d!107137 c!90721) b!833144))

(assert (= (and d!107137 (not c!90721)) b!833145))

(assert (= (and b!833145 c!90722) b!833146))

(assert (= (and b!833145 (not c!90722)) b!833147))

(declare-fun m!777793 () Bool)

(assert (=> b!833146 m!777793))

(assert (=> b!832088 d!107137))

(declare-fun d!107139 () Bool)

(declare-fun res!566603 () Bool)

(declare-fun e!464702 () Bool)

(assert (=> d!107139 (=> res!566603 e!464702)))

(assert (=> d!107139 (= res!566603 (and ((_ is Cons!15945) (toList!4505 lt!377554)) (= (_1!5089 (h!17075 (toList!4505 lt!377554))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107139 (= (containsKey!402 (toList!4505 lt!377554) #b1000000000000000000000000000000000000000000000000000000000000000) e!464702)))

(declare-fun b!833148 () Bool)

(declare-fun e!464703 () Bool)

(assert (=> b!833148 (= e!464702 e!464703)))

(declare-fun res!566604 () Bool)

(assert (=> b!833148 (=> (not res!566604) (not e!464703))))

(assert (=> b!833148 (= res!566604 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377554))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377554))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377554)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377554))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833149 () Bool)

(assert (=> b!833149 (= e!464703 (containsKey!402 (t!22317 (toList!4505 lt!377554)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107139 (not res!566603)) b!833148))

(assert (= (and b!833148 res!566604) b!833149))

(declare-fun m!777795 () Bool)

(assert (=> b!833149 m!777795))

(assert (=> d!106459 d!107139))

(declare-fun d!107141 () Bool)

(declare-fun res!566605 () Bool)

(declare-fun e!464704 () Bool)

(assert (=> d!107141 (=> res!566605 e!464704)))

(assert (=> d!107141 (= res!566605 (and ((_ is Cons!15945) (toList!4505 lt!377605)) (= (_1!5089 (h!17075 (toList!4505 lt!377605))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107141 (= (containsKey!402 (toList!4505 lt!377605) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464704)))

(declare-fun b!833150 () Bool)

(declare-fun e!464705 () Bool)

(assert (=> b!833150 (= e!464704 e!464705)))

(declare-fun res!566606 () Bool)

(assert (=> b!833150 (=> (not res!566606) (not e!464705))))

(assert (=> b!833150 (= res!566606 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377605))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377605))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) (toList!4505 lt!377605)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377605))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833151 () Bool)

(assert (=> b!833151 (= e!464705 (containsKey!402 (t!22317 (toList!4505 lt!377605)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107141 (not res!566605)) b!833150))

(assert (= (and b!833150 res!566606) b!833151))

(declare-fun m!777797 () Bool)

(assert (=> b!833151 m!777797))

(assert (=> d!106437 d!107141))

(declare-fun d!107143 () Bool)

(declare-fun res!566607 () Bool)

(declare-fun e!464706 () Bool)

(assert (=> d!107143 (=> res!566607 e!464706)))

(assert (=> d!107143 (= res!566607 (or ((_ is Nil!15946) lt!377758) ((_ is Nil!15946) (t!22317 lt!377758))))))

(assert (=> d!107143 (= (isStrictlySorted!442 lt!377758) e!464706)))

(declare-fun b!833152 () Bool)

(declare-fun e!464707 () Bool)

(assert (=> b!833152 (= e!464706 e!464707)))

(declare-fun res!566608 () Bool)

(assert (=> b!833152 (=> (not res!566608) (not e!464707))))

(assert (=> b!833152 (= res!566608 (bvslt (_1!5089 (h!17075 lt!377758)) (_1!5089 (h!17075 (t!22317 lt!377758)))))))

(declare-fun b!833153 () Bool)

(assert (=> b!833153 (= e!464707 (isStrictlySorted!442 (t!22317 lt!377758)))))

(assert (= (and d!107143 (not res!566607)) b!833152))

(assert (= (and b!833152 res!566608) b!833153))

(declare-fun m!777799 () Bool)

(assert (=> b!833153 m!777799))

(assert (=> d!106457 d!107143))

(declare-fun d!107145 () Bool)

(declare-fun res!566609 () Bool)

(declare-fun e!464708 () Bool)

(assert (=> d!107145 (=> res!566609 e!464708)))

(assert (=> d!107145 (= res!566609 (or ((_ is Nil!15946) (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Nil!15946) (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))))

(assert (=> d!107145 (= (isStrictlySorted!442 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464708)))

(declare-fun b!833154 () Bool)

(declare-fun e!464709 () Bool)

(assert (=> b!833154 (= e!464708 e!464709)))

(declare-fun res!566610 () Bool)

(assert (=> b!833154 (=> (not res!566610) (not e!464709))))

(assert (=> b!833154 (= res!566610 (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5089 (h!17075 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))))

(declare-fun b!833155 () Bool)

(assert (=> b!833155 (= e!464709 (isStrictlySorted!442 (t!22317 (toList!4505 (+!1983 lt!377423 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(assert (= (and d!107145 (not res!566609)) b!833154))

(assert (= (and b!833154 res!566610) b!833155))

(assert (=> b!833155 m!777737))

(assert (=> d!106457 d!107145))

(declare-fun d!107147 () Bool)

(declare-fun lt!378055 () Bool)

(assert (=> d!107147 (= lt!378055 (select (content!388 lt!377616) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464711 () Bool)

(assert (=> d!107147 (= lt!378055 e!464711)))

(declare-fun res!566612 () Bool)

(assert (=> d!107147 (=> (not res!566612) (not e!464711))))

(assert (=> d!107147 (= res!566612 ((_ is Cons!15945) lt!377616))))

(assert (=> d!107147 (= (contains!4212 lt!377616 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!378055)))

(declare-fun b!833156 () Bool)

(declare-fun e!464710 () Bool)

(assert (=> b!833156 (= e!464711 e!464710)))

(declare-fun res!566611 () Bool)

(assert (=> b!833156 (=> res!566611 e!464710)))

(assert (=> b!833156 (= res!566611 (= (h!17075 lt!377616) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833157 () Bool)

(assert (=> b!833157 (= e!464710 (contains!4212 (t!22317 lt!377616) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!107147 res!566612) b!833156))

(assert (= (and b!833156 (not res!566611)) b!833157))

(declare-fun m!777801 () Bool)

(assert (=> d!107147 m!777801))

(declare-fun m!777803 () Bool)

(assert (=> d!107147 m!777803))

(declare-fun m!777805 () Bool)

(assert (=> b!833157 m!777805))

(assert (=> b!832174 d!107147))

(declare-fun d!107149 () Bool)

(declare-fun e!464712 () Bool)

(assert (=> d!107149 e!464712))

(declare-fun res!566613 () Bool)

(assert (=> d!107149 (=> res!566613 e!464712)))

(declare-fun lt!378059 () Bool)

(assert (=> d!107149 (= res!566613 (not lt!378059))))

(declare-fun lt!378058 () Bool)

(assert (=> d!107149 (= lt!378059 lt!378058)))

(declare-fun lt!378057 () Unit!28493)

(declare-fun e!464713 () Unit!28493)

(assert (=> d!107149 (= lt!378057 e!464713)))

(declare-fun c!90723 () Bool)

(assert (=> d!107149 (= c!90723 lt!378058)))

(assert (=> d!107149 (= lt!378058 (containsKey!402 (toList!4505 lt!377711) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(assert (=> d!107149 (= (contains!4211 lt!377711 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) lt!378059)))

(declare-fun b!833158 () Bool)

(declare-fun lt!378056 () Unit!28493)

(assert (=> b!833158 (= e!464713 lt!378056)))

(assert (=> b!833158 (= lt!378056 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377711) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(assert (=> b!833158 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377711) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun b!833159 () Bool)

(declare-fun Unit!28542 () Unit!28493)

(assert (=> b!833159 (= e!464713 Unit!28542)))

(declare-fun b!833160 () Bool)

(assert (=> b!833160 (= e!464712 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377711) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(assert (= (and d!107149 c!90723) b!833158))

(assert (= (and d!107149 (not c!90723)) b!833159))

(assert (= (and d!107149 (not res!566613)) b!833160))

(declare-fun m!777807 () Bool)

(assert (=> d!107149 m!777807))

(declare-fun m!777809 () Bool)

(assert (=> b!833158 m!777809))

(assert (=> b!833158 m!776273))

(assert (=> b!833158 m!776273))

(declare-fun m!777811 () Bool)

(assert (=> b!833158 m!777811))

(assert (=> b!833160 m!776273))

(assert (=> b!833160 m!776273))

(assert (=> b!833160 m!777811))

(assert (=> d!106405 d!107149))

(declare-fun b!833163 () Bool)

(declare-fun e!464715 () Option!422)

(assert (=> b!833163 (= e!464715 (getValueByKey!416 (t!22317 lt!377710) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun b!833162 () Bool)

(declare-fun e!464714 () Option!422)

(assert (=> b!833162 (= e!464714 e!464715)))

(declare-fun c!90725 () Bool)

(assert (=> b!833162 (= c!90725 (and ((_ is Cons!15945) lt!377710) (not (= (_1!5089 (h!17075 lt!377710)) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))))

(declare-fun b!833164 () Bool)

(assert (=> b!833164 (= e!464715 None!420)))

(declare-fun b!833161 () Bool)

(assert (=> b!833161 (= e!464714 (Some!421 (_2!5089 (h!17075 lt!377710))))))

(declare-fun c!90724 () Bool)

(declare-fun d!107151 () Bool)

(assert (=> d!107151 (= c!90724 (and ((_ is Cons!15945) lt!377710) (= (_1!5089 (h!17075 lt!377710)) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(assert (=> d!107151 (= (getValueByKey!416 lt!377710 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) e!464714)))

(assert (= (and d!107151 c!90724) b!833161))

(assert (= (and d!107151 (not c!90724)) b!833162))

(assert (= (and b!833162 c!90725) b!833163))

(assert (= (and b!833162 (not c!90725)) b!833164))

(declare-fun m!777813 () Bool)

(assert (=> b!833163 m!777813))

(assert (=> d!106405 d!107151))

(declare-fun d!107153 () Bool)

(assert (=> d!107153 (= (getValueByKey!416 lt!377710 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun lt!378060 () Unit!28493)

(assert (=> d!107153 (= lt!378060 (choose!1423 lt!377710 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun e!464716 () Bool)

(assert (=> d!107153 e!464716))

(declare-fun res!566614 () Bool)

(assert (=> d!107153 (=> (not res!566614) (not e!464716))))

(assert (=> d!107153 (= res!566614 (isStrictlySorted!442 lt!377710))))

(assert (=> d!107153 (= (lemmaContainsTupThenGetReturnValue!230 lt!377710 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) lt!378060)))

(declare-fun b!833165 () Bool)

(declare-fun res!566615 () Bool)

(assert (=> b!833165 (=> (not res!566615) (not e!464716))))

(assert (=> b!833165 (= res!566615 (containsKey!402 lt!377710 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun b!833166 () Bool)

(assert (=> b!833166 (= e!464716 (contains!4212 lt!377710 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(assert (= (and d!107153 res!566614) b!833165))

(assert (= (and b!833165 res!566615) b!833166))

(assert (=> d!107153 m!776267))

(declare-fun m!777815 () Bool)

(assert (=> d!107153 m!777815))

(declare-fun m!777817 () Bool)

(assert (=> d!107153 m!777817))

(declare-fun m!777819 () Bool)

(assert (=> b!833165 m!777819))

(declare-fun m!777821 () Bool)

(assert (=> b!833166 m!777821))

(assert (=> d!106405 d!107153))

(declare-fun b!833167 () Bool)

(declare-fun e!464718 () List!15949)

(declare-fun call!36476 () List!15949)

(assert (=> b!833167 (= e!464718 call!36476)))

(declare-fun e!464717 () List!15949)

(declare-fun b!833168 () Bool)

(assert (=> b!833168 (= e!464717 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377587)) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun bm!36472 () Bool)

(declare-fun call!36475 () List!15949)

(assert (=> bm!36472 (= call!36476 call!36475)))

(declare-fun b!833169 () Bool)

(assert (=> b!833169 (= e!464718 call!36476)))

(declare-fun c!90728 () Bool)

(declare-fun b!833170 () Bool)

(declare-fun c!90726 () Bool)

(assert (=> b!833170 (= e!464717 (ite c!90728 (t!22317 (toList!4505 lt!377587)) (ite c!90726 (Cons!15945 (h!17075 (toList!4505 lt!377587)) (t!22317 (toList!4505 lt!377587))) Nil!15946)))))

(declare-fun c!90729 () Bool)

(declare-fun bm!36473 () Bool)

(declare-fun call!36477 () List!15949)

(assert (=> bm!36473 (= call!36477 ($colon$colon!537 e!464717 (ite c!90729 (h!17075 (toList!4505 lt!377587)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))))

(declare-fun c!90727 () Bool)

(assert (=> bm!36473 (= c!90727 c!90729)))

(declare-fun b!833171 () Bool)

(declare-fun res!566617 () Bool)

(declare-fun e!464720 () Bool)

(assert (=> b!833171 (=> (not res!566617) (not e!464720))))

(declare-fun lt!378061 () List!15949)

(assert (=> b!833171 (= res!566617 (containsKey!402 lt!378061 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))))))

(declare-fun b!833172 () Bool)

(declare-fun e!464721 () List!15949)

(assert (=> b!833172 (= e!464721 call!36477)))

(declare-fun b!833173 () Bool)

(assert (=> b!833173 (= c!90726 (and ((_ is Cons!15945) (toList!4505 lt!377587)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377587))) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(declare-fun e!464719 () List!15949)

(assert (=> b!833173 (= e!464719 e!464718)))

(declare-fun d!107155 () Bool)

(assert (=> d!107155 e!464720))

(declare-fun res!566616 () Bool)

(assert (=> d!107155 (=> (not res!566616) (not e!464720))))

(assert (=> d!107155 (= res!566616 (isStrictlySorted!442 lt!378061))))

(assert (=> d!107155 (= lt!378061 e!464721)))

(assert (=> d!107155 (= c!90729 (and ((_ is Cons!15945) (toList!4505 lt!377587)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377587))) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(assert (=> d!107155 (isStrictlySorted!442 (toList!4505 lt!377587))))

(assert (=> d!107155 (= (insertStrictlySorted!269 (toList!4505 lt!377587) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34))) lt!378061)))

(declare-fun b!833174 () Bool)

(assert (=> b!833174 (= e!464719 call!36475)))

(declare-fun bm!36474 () Bool)

(assert (=> bm!36474 (= call!36475 call!36477)))

(declare-fun b!833175 () Bool)

(assert (=> b!833175 (= e!464720 (contains!4212 lt!378061 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(declare-fun b!833176 () Bool)

(assert (=> b!833176 (= e!464721 e!464719)))

(assert (=> b!833176 (= c!90728 (and ((_ is Cons!15945) (toList!4505 lt!377587)) (= (_1!5089 (h!17075 (toList!4505 lt!377587))) (_1!5089 (tuple2!10157 lt!377586 zeroValueAfter!34)))))))

(assert (= (and d!107155 c!90729) b!833172))

(assert (= (and d!107155 (not c!90729)) b!833176))

(assert (= (and b!833176 c!90728) b!833174))

(assert (= (and b!833176 (not c!90728)) b!833173))

(assert (= (and b!833173 c!90726) b!833167))

(assert (= (and b!833173 (not c!90726)) b!833169))

(assert (= (or b!833167 b!833169) bm!36472))

(assert (= (or b!833174 bm!36472) bm!36474))

(assert (= (or b!833172 bm!36474) bm!36473))

(assert (= (and bm!36473 c!90727) b!833168))

(assert (= (and bm!36473 (not c!90727)) b!833170))

(assert (= (and d!107155 res!566616) b!833171))

(assert (= (and b!833171 res!566617) b!833175))

(declare-fun m!777823 () Bool)

(assert (=> d!107155 m!777823))

(declare-fun m!777825 () Bool)

(assert (=> d!107155 m!777825))

(declare-fun m!777827 () Bool)

(assert (=> b!833171 m!777827))

(declare-fun m!777829 () Bool)

(assert (=> b!833175 m!777829))

(declare-fun m!777831 () Bool)

(assert (=> bm!36473 m!777831))

(declare-fun m!777833 () Bool)

(assert (=> b!833168 m!777833))

(assert (=> d!106405 d!107155))

(assert (=> b!832085 d!106647))

(declare-fun d!107157 () Bool)

(declare-fun res!566618 () Bool)

(declare-fun e!464722 () Bool)

(assert (=> d!107157 (=> res!566618 e!464722)))

(assert (=> d!107157 (= res!566618 (and ((_ is Cons!15945) lt!377578) (= (_1!5089 (h!17075 lt!377578)) (_1!5089 lt!377425))))))

(assert (=> d!107157 (= (containsKey!402 lt!377578 (_1!5089 lt!377425)) e!464722)))

(declare-fun b!833177 () Bool)

(declare-fun e!464723 () Bool)

(assert (=> b!833177 (= e!464722 e!464723)))

(declare-fun res!566619 () Bool)

(assert (=> b!833177 (=> (not res!566619) (not e!464723))))

(assert (=> b!833177 (= res!566619 (and (or (not ((_ is Cons!15945) lt!377578)) (bvsle (_1!5089 (h!17075 lt!377578)) (_1!5089 lt!377425))) ((_ is Cons!15945) lt!377578) (bvslt (_1!5089 (h!17075 lt!377578)) (_1!5089 lt!377425))))))

(declare-fun b!833178 () Bool)

(assert (=> b!833178 (= e!464723 (containsKey!402 (t!22317 lt!377578) (_1!5089 lt!377425)))))

(assert (= (and d!107157 (not res!566618)) b!833177))

(assert (= (and b!833177 res!566619) b!833178))

(declare-fun m!777835 () Bool)

(assert (=> b!833178 m!777835))

(assert (=> b!832314 d!107157))

(declare-fun d!107159 () Bool)

(declare-fun res!566620 () Bool)

(declare-fun e!464724 () Bool)

(assert (=> d!107159 (=> res!566620 e!464724)))

(assert (=> d!107159 (= res!566620 (and ((_ is Cons!15945) lt!377464) (= (_1!5089 (h!17075 lt!377464)) (_1!5089 lt!377428))))))

(assert (=> d!107159 (= (containsKey!402 lt!377464 (_1!5089 lt!377428)) e!464724)))

(declare-fun b!833179 () Bool)

(declare-fun e!464725 () Bool)

(assert (=> b!833179 (= e!464724 e!464725)))

(declare-fun res!566621 () Bool)

(assert (=> b!833179 (=> (not res!566621) (not e!464725))))

(assert (=> b!833179 (= res!566621 (and (or (not ((_ is Cons!15945) lt!377464)) (bvsle (_1!5089 (h!17075 lt!377464)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377464) (bvslt (_1!5089 (h!17075 lt!377464)) (_1!5089 lt!377428))))))

(declare-fun b!833180 () Bool)

(assert (=> b!833180 (= e!464725 (containsKey!402 (t!22317 lt!377464) (_1!5089 lt!377428)))))

(assert (= (and d!107159 (not res!566620)) b!833179))

(assert (= (and b!833179 res!566621) b!833180))

(declare-fun m!777837 () Bool)

(assert (=> b!833180 m!777837))

(assert (=> b!832127 d!107159))

(declare-fun d!107161 () Bool)

(declare-fun e!464726 () Bool)

(assert (=> d!107161 e!464726))

(declare-fun res!566622 () Bool)

(assert (=> d!107161 (=> res!566622 e!464726)))

(declare-fun lt!378065 () Bool)

(assert (=> d!107161 (= res!566622 (not lt!378065))))

(declare-fun lt!378064 () Bool)

(assert (=> d!107161 (= lt!378065 lt!378064)))

(declare-fun lt!378063 () Unit!28493)

(declare-fun e!464727 () Unit!28493)

(assert (=> d!107161 (= lt!378063 e!464727)))

(declare-fun c!90730 () Bool)

(assert (=> d!107161 (= c!90730 lt!378064)))

(assert (=> d!107161 (= lt!378064 (containsKey!402 (toList!4505 lt!377804) (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(assert (=> d!107161 (= (contains!4211 lt!377804 (_1!5089 (tuple2!10157 lt!377559 minValue!754))) lt!378065)))

(declare-fun b!833181 () Bool)

(declare-fun lt!378062 () Unit!28493)

(assert (=> b!833181 (= e!464727 lt!378062)))

(assert (=> b!833181 (= lt!378062 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377804) (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(assert (=> b!833181 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377804) (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun b!833182 () Bool)

(declare-fun Unit!28543 () Unit!28493)

(assert (=> b!833182 (= e!464727 Unit!28543)))

(declare-fun b!833183 () Bool)

(assert (=> b!833183 (= e!464726 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377804) (_1!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(assert (= (and d!107161 c!90730) b!833181))

(assert (= (and d!107161 (not c!90730)) b!833182))

(assert (= (and d!107161 (not res!566622)) b!833183))

(declare-fun m!777839 () Bool)

(assert (=> d!107161 m!777839))

(declare-fun m!777841 () Bool)

(assert (=> b!833181 m!777841))

(assert (=> b!833181 m!776615))

(assert (=> b!833181 m!776615))

(declare-fun m!777843 () Bool)

(assert (=> b!833181 m!777843))

(assert (=> b!833183 m!776615))

(assert (=> b!833183 m!776615))

(assert (=> b!833183 m!777843))

(assert (=> d!106513 d!107161))

(declare-fun b!833186 () Bool)

(declare-fun e!464729 () Option!422)

(assert (=> b!833186 (= e!464729 (getValueByKey!416 (t!22317 lt!377803) (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun b!833185 () Bool)

(declare-fun e!464728 () Option!422)

(assert (=> b!833185 (= e!464728 e!464729)))

(declare-fun c!90732 () Bool)

(assert (=> b!833185 (= c!90732 (and ((_ is Cons!15945) lt!377803) (not (= (_1!5089 (h!17075 lt!377803)) (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))))

(declare-fun b!833187 () Bool)

(assert (=> b!833187 (= e!464729 None!420)))

(declare-fun b!833184 () Bool)

(assert (=> b!833184 (= e!464728 (Some!421 (_2!5089 (h!17075 lt!377803))))))

(declare-fun d!107163 () Bool)

(declare-fun c!90731 () Bool)

(assert (=> d!107163 (= c!90731 (and ((_ is Cons!15945) lt!377803) (= (_1!5089 (h!17075 lt!377803)) (_1!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(assert (=> d!107163 (= (getValueByKey!416 lt!377803 (_1!5089 (tuple2!10157 lt!377559 minValue!754))) e!464728)))

(assert (= (and d!107163 c!90731) b!833184))

(assert (= (and d!107163 (not c!90731)) b!833185))

(assert (= (and b!833185 c!90732) b!833186))

(assert (= (and b!833185 (not c!90732)) b!833187))

(declare-fun m!777845 () Bool)

(assert (=> b!833186 m!777845))

(assert (=> d!106513 d!107163))

(declare-fun d!107165 () Bool)

(assert (=> d!107165 (= (getValueByKey!416 lt!377803 (_1!5089 (tuple2!10157 lt!377559 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun lt!378066 () Unit!28493)

(assert (=> d!107165 (= lt!378066 (choose!1423 lt!377803 (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun e!464730 () Bool)

(assert (=> d!107165 e!464730))

(declare-fun res!566623 () Bool)

(assert (=> d!107165 (=> (not res!566623) (not e!464730))))

(assert (=> d!107165 (= res!566623 (isStrictlySorted!442 lt!377803))))

(assert (=> d!107165 (= (lemmaContainsTupThenGetReturnValue!230 lt!377803 (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754))) lt!378066)))

(declare-fun b!833188 () Bool)

(declare-fun res!566624 () Bool)

(assert (=> b!833188 (=> (not res!566624) (not e!464730))))

(assert (=> b!833188 (= res!566624 (containsKey!402 lt!377803 (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun b!833189 () Bool)

(assert (=> b!833189 (= e!464730 (contains!4212 lt!377803 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(assert (= (and d!107165 res!566623) b!833188))

(assert (= (and b!833188 res!566624) b!833189))

(assert (=> d!107165 m!776609))

(declare-fun m!777847 () Bool)

(assert (=> d!107165 m!777847))

(declare-fun m!777849 () Bool)

(assert (=> d!107165 m!777849))

(declare-fun m!777851 () Bool)

(assert (=> b!833188 m!777851))

(declare-fun m!777853 () Bool)

(assert (=> b!833189 m!777853))

(assert (=> d!106513 d!107165))

(declare-fun b!833190 () Bool)

(declare-fun e!464732 () List!15949)

(declare-fun call!36479 () List!15949)

(assert (=> b!833190 (= e!464732 call!36479)))

(declare-fun b!833191 () Bool)

(declare-fun e!464731 () List!15949)

(assert (=> b!833191 (= e!464731 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377572)) (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun bm!36475 () Bool)

(declare-fun call!36478 () List!15949)

(assert (=> bm!36475 (= call!36479 call!36478)))

(declare-fun b!833192 () Bool)

(assert (=> b!833192 (= e!464732 call!36479)))

(declare-fun b!833193 () Bool)

(declare-fun c!90733 () Bool)

(declare-fun c!90735 () Bool)

(assert (=> b!833193 (= e!464731 (ite c!90735 (t!22317 (toList!4505 lt!377572)) (ite c!90733 (Cons!15945 (h!17075 (toList!4505 lt!377572)) (t!22317 (toList!4505 lt!377572))) Nil!15946)))))

(declare-fun c!90736 () Bool)

(declare-fun bm!36476 () Bool)

(declare-fun call!36480 () List!15949)

(assert (=> bm!36476 (= call!36480 ($colon$colon!537 e!464731 (ite c!90736 (h!17075 (toList!4505 lt!377572)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754))))))))

(declare-fun c!90734 () Bool)

(assert (=> bm!36476 (= c!90734 c!90736)))

(declare-fun b!833194 () Bool)

(declare-fun res!566626 () Bool)

(declare-fun e!464734 () Bool)

(assert (=> b!833194 (=> (not res!566626) (not e!464734))))

(declare-fun lt!378067 () List!15949)

(assert (=> b!833194 (= res!566626 (containsKey!402 lt!378067 (_1!5089 (tuple2!10157 lt!377559 minValue!754))))))

(declare-fun b!833195 () Bool)

(declare-fun e!464735 () List!15949)

(assert (=> b!833195 (= e!464735 call!36480)))

(declare-fun b!833196 () Bool)

(assert (=> b!833196 (= c!90733 (and ((_ is Cons!15945) (toList!4505 lt!377572)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377572))) (_1!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(declare-fun e!464733 () List!15949)

(assert (=> b!833196 (= e!464733 e!464732)))

(declare-fun d!107167 () Bool)

(assert (=> d!107167 e!464734))

(declare-fun res!566625 () Bool)

(assert (=> d!107167 (=> (not res!566625) (not e!464734))))

(assert (=> d!107167 (= res!566625 (isStrictlySorted!442 lt!378067))))

(assert (=> d!107167 (= lt!378067 e!464735)))

(assert (=> d!107167 (= c!90736 (and ((_ is Cons!15945) (toList!4505 lt!377572)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377572))) (_1!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(assert (=> d!107167 (isStrictlySorted!442 (toList!4505 lt!377572))))

(assert (=> d!107167 (= (insertStrictlySorted!269 (toList!4505 lt!377572) (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754))) lt!378067)))

(declare-fun b!833197 () Bool)

(assert (=> b!833197 (= e!464733 call!36478)))

(declare-fun bm!36477 () Bool)

(assert (=> bm!36477 (= call!36478 call!36480)))

(declare-fun b!833198 () Bool)

(assert (=> b!833198 (= e!464734 (contains!4212 lt!378067 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377559 minValue!754)) (_2!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(declare-fun b!833199 () Bool)

(assert (=> b!833199 (= e!464735 e!464733)))

(assert (=> b!833199 (= c!90735 (and ((_ is Cons!15945) (toList!4505 lt!377572)) (= (_1!5089 (h!17075 (toList!4505 lt!377572))) (_1!5089 (tuple2!10157 lt!377559 minValue!754)))))))

(assert (= (and d!107167 c!90736) b!833195))

(assert (= (and d!107167 (not c!90736)) b!833199))

(assert (= (and b!833199 c!90735) b!833197))

(assert (= (and b!833199 (not c!90735)) b!833196))

(assert (= (and b!833196 c!90733) b!833190))

(assert (= (and b!833196 (not c!90733)) b!833192))

(assert (= (or b!833190 b!833192) bm!36475))

(assert (= (or b!833197 bm!36475) bm!36477))

(assert (= (or b!833195 bm!36477) bm!36476))

(assert (= (and bm!36476 c!90734) b!833191))

(assert (= (and bm!36476 (not c!90734)) b!833193))

(assert (= (and d!107167 res!566625) b!833194))

(assert (= (and b!833194 res!566626) b!833198))

(declare-fun m!777855 () Bool)

(assert (=> d!107167 m!777855))

(declare-fun m!777857 () Bool)

(assert (=> d!107167 m!777857))

(declare-fun m!777859 () Bool)

(assert (=> b!833194 m!777859))

(declare-fun m!777861 () Bool)

(assert (=> b!833198 m!777861))

(declare-fun m!777863 () Bool)

(assert (=> bm!36476 m!777863))

(declare-fun m!777865 () Bool)

(assert (=> b!833191 m!777865))

(assert (=> d!106513 d!107167))

(declare-fun d!107169 () Bool)

(declare-fun lt!378068 () Bool)

(assert (=> d!107169 (= lt!378068 (select (content!388 (t!22317 (toList!4505 lt!377617))) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464737 () Bool)

(assert (=> d!107169 (= lt!378068 e!464737)))

(declare-fun res!566628 () Bool)

(assert (=> d!107169 (=> (not res!566628) (not e!464737))))

(assert (=> d!107169 (= res!566628 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377617))))))

(assert (=> d!107169 (= (contains!4212 (t!22317 (toList!4505 lt!377617)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378068)))

(declare-fun b!833200 () Bool)

(declare-fun e!464736 () Bool)

(assert (=> b!833200 (= e!464737 e!464736)))

(declare-fun res!566627 () Bool)

(assert (=> b!833200 (=> res!566627 e!464736)))

(assert (=> b!833200 (= res!566627 (= (h!17075 (t!22317 (toList!4505 lt!377617))) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!833201 () Bool)

(assert (=> b!833201 (= e!464736 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377617))) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!107169 res!566628) b!833200))

(assert (= (and b!833200 (not res!566627)) b!833201))

(assert (=> d!107169 m!777563))

(declare-fun m!777867 () Bool)

(assert (=> d!107169 m!777867))

(declare-fun m!777869 () Bool)

(assert (=> b!833201 m!777869))

(assert (=> b!832087 d!107169))

(assert (=> b!832309 d!106955))

(assert (=> b!832309 d!106569))

(assert (=> b!832386 d!106977))

(assert (=> b!832386 d!106979))

(declare-fun lt!378069 () Bool)

(declare-fun d!107171 () Bool)

(assert (=> d!107171 (= lt!378069 (select (content!388 (toList!4505 lt!377863)) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!464739 () Bool)

(assert (=> d!107171 (= lt!378069 e!464739)))

(declare-fun res!566630 () Bool)

(assert (=> d!107171 (=> (not res!566630) (not e!464739))))

(assert (=> d!107171 (= res!566630 ((_ is Cons!15945) (toList!4505 lt!377863)))))

(assert (=> d!107171 (= (contains!4212 (toList!4505 lt!377863) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378069)))

(declare-fun b!833202 () Bool)

(declare-fun e!464738 () Bool)

(assert (=> b!833202 (= e!464739 e!464738)))

(declare-fun res!566629 () Bool)

(assert (=> b!833202 (=> res!566629 e!464738)))

(assert (=> b!833202 (= res!566629 (= (h!17075 (toList!4505 lt!377863)) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833203 () Bool)

(assert (=> b!833203 (= e!464738 (contains!4212 (t!22317 (toList!4505 lt!377863)) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107171 res!566630) b!833202))

(assert (= (and b!833202 (not res!566629)) b!833203))

(declare-fun m!777871 () Bool)

(assert (=> d!107171 m!777871))

(declare-fun m!777873 () Bool)

(assert (=> d!107171 m!777873))

(declare-fun m!777875 () Bool)

(assert (=> b!833203 m!777875))

(assert (=> b!832429 d!107171))

(declare-fun lt!378070 () Bool)

(declare-fun d!107173 () Bool)

(assert (=> d!107173 (= lt!378070 (select (content!388 (toList!4505 lt!377842)) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!464741 () Bool)

(assert (=> d!107173 (= lt!378070 e!464741)))

(declare-fun res!566632 () Bool)

(assert (=> d!107173 (=> (not res!566632) (not e!464741))))

(assert (=> d!107173 (= res!566632 ((_ is Cons!15945) (toList!4505 lt!377842)))))

(assert (=> d!107173 (= (contains!4212 (toList!4505 lt!377842) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!378070)))

(declare-fun b!833204 () Bool)

(declare-fun e!464740 () Bool)

(assert (=> b!833204 (= e!464741 e!464740)))

(declare-fun res!566631 () Bool)

(assert (=> b!833204 (=> res!566631 e!464740)))

(assert (=> b!833204 (= res!566631 (= (h!17075 (toList!4505 lt!377842)) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!833205 () Bool)

(assert (=> b!833205 (= e!464740 (contains!4212 (t!22317 (toList!4505 lt!377842)) (tuple2!10157 (select (arr!22334 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22335 _values!788) #b00000000000000000000000000000000) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!107173 res!566632) b!833204))

(assert (= (and b!833204 (not res!566631)) b!833205))

(declare-fun m!777877 () Bool)

(assert (=> d!107173 m!777877))

(declare-fun m!777879 () Bool)

(assert (=> d!107173 m!777879))

(declare-fun m!777881 () Bool)

(assert (=> b!833205 m!777881))

(assert (=> b!832390 d!107173))

(declare-fun d!107175 () Bool)

(declare-fun e!464742 () Bool)

(assert (=> d!107175 e!464742))

(declare-fun res!566633 () Bool)

(assert (=> d!107175 (=> res!566633 e!464742)))

(declare-fun lt!378074 () Bool)

(assert (=> d!107175 (= res!566633 (not lt!378074))))

(declare-fun lt!378073 () Bool)

(assert (=> d!107175 (= lt!378074 lt!378073)))

(declare-fun lt!378072 () Unit!28493)

(declare-fun e!464743 () Unit!28493)

(assert (=> d!107175 (= lt!378072 e!464743)))

(declare-fun c!90737 () Bool)

(assert (=> d!107175 (= c!90737 lt!378073)))

(assert (=> d!107175 (= lt!378073 (containsKey!402 (toList!4505 lt!377773) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!107175 (= (contains!4211 lt!377773 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378074)))

(declare-fun b!833206 () Bool)

(declare-fun lt!378071 () Unit!28493)

(assert (=> b!833206 (= e!464743 lt!378071)))

(assert (=> b!833206 (= lt!378071 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377773) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!833206 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377773) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833207 () Bool)

(declare-fun Unit!28544 () Unit!28493)

(assert (=> b!833207 (= e!464743 Unit!28544)))

(declare-fun b!833208 () Bool)

(assert (=> b!833208 (= e!464742 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377773) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107175 c!90737) b!833206))

(assert (= (and d!107175 (not c!90737)) b!833207))

(assert (= (and d!107175 (not res!566633)) b!833208))

(declare-fun m!777883 () Bool)

(assert (=> d!107175 m!777883))

(declare-fun m!777885 () Bool)

(assert (=> b!833206 m!777885))

(assert (=> b!833206 m!776483))

(assert (=> b!833206 m!776483))

(declare-fun m!777887 () Bool)

(assert (=> b!833206 m!777887))

(assert (=> b!833208 m!776483))

(assert (=> b!833208 m!776483))

(assert (=> b!833208 m!777887))

(assert (=> d!106469 d!107175))

(declare-fun b!833211 () Bool)

(declare-fun e!464745 () Option!422)

(assert (=> b!833211 (= e!464745 (getValueByKey!416 (t!22317 lt!377772) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833210 () Bool)

(declare-fun e!464744 () Option!422)

(assert (=> b!833210 (= e!464744 e!464745)))

(declare-fun c!90739 () Bool)

(assert (=> b!833210 (= c!90739 (and ((_ is Cons!15945) lt!377772) (not (= (_1!5089 (h!17075 lt!377772)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!833212 () Bool)

(assert (=> b!833212 (= e!464745 None!420)))

(declare-fun b!833209 () Bool)

(assert (=> b!833209 (= e!464744 (Some!421 (_2!5089 (h!17075 lt!377772))))))

(declare-fun d!107177 () Bool)

(declare-fun c!90738 () Bool)

(assert (=> d!107177 (= c!90738 (and ((_ is Cons!15945) lt!377772) (= (_1!5089 (h!17075 lt!377772)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!107177 (= (getValueByKey!416 lt!377772 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464744)))

(assert (= (and d!107177 c!90738) b!833209))

(assert (= (and d!107177 (not c!90738)) b!833210))

(assert (= (and b!833210 c!90739) b!833211))

(assert (= (and b!833210 (not c!90739)) b!833212))

(declare-fun m!777889 () Bool)

(assert (=> b!833211 m!777889))

(assert (=> d!106469 d!107177))

(declare-fun d!107179 () Bool)

(assert (=> d!107179 (= (getValueByKey!416 lt!377772 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!378075 () Unit!28493)

(assert (=> d!107179 (= lt!378075 (choose!1423 lt!377772 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464746 () Bool)

(assert (=> d!107179 e!464746))

(declare-fun res!566634 () Bool)

(assert (=> d!107179 (=> (not res!566634) (not e!464746))))

(assert (=> d!107179 (= res!566634 (isStrictlySorted!442 lt!377772))))

(assert (=> d!107179 (= (lemmaContainsTupThenGetReturnValue!230 lt!377772 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378075)))

(declare-fun b!833213 () Bool)

(declare-fun res!566635 () Bool)

(assert (=> b!833213 (=> (not res!566635) (not e!464746))))

(assert (=> b!833213 (= res!566635 (containsKey!402 lt!377772 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833214 () Bool)

(assert (=> b!833214 (= e!464746 (contains!4212 lt!377772 (tuple2!10157 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107179 res!566634) b!833213))

(assert (= (and b!833213 res!566635) b!833214))

(assert (=> d!107179 m!776477))

(declare-fun m!777891 () Bool)

(assert (=> d!107179 m!777891))

(declare-fun m!777893 () Bool)

(assert (=> d!107179 m!777893))

(declare-fun m!777895 () Bool)

(assert (=> b!833213 m!777895))

(declare-fun m!777897 () Bool)

(assert (=> b!833214 m!777897))

(assert (=> d!106469 d!107179))

(declare-fun b!833215 () Bool)

(declare-fun e!464748 () List!15949)

(declare-fun call!36482 () List!15949)

(assert (=> b!833215 (= e!464748 call!36482)))

(declare-fun b!833216 () Bool)

(declare-fun e!464747 () List!15949)

(assert (=> b!833216 (= e!464747 (insertStrictlySorted!269 (t!22317 (toList!4505 call!36380)) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36478 () Bool)

(declare-fun call!36481 () List!15949)

(assert (=> bm!36478 (= call!36482 call!36481)))

(declare-fun b!833217 () Bool)

(assert (=> b!833217 (= e!464748 call!36482)))

(declare-fun c!90740 () Bool)

(declare-fun b!833218 () Bool)

(declare-fun c!90742 () Bool)

(assert (=> b!833218 (= e!464747 (ite c!90742 (t!22317 (toList!4505 call!36380)) (ite c!90740 (Cons!15945 (h!17075 (toList!4505 call!36380)) (t!22317 (toList!4505 call!36380))) Nil!15946)))))

(declare-fun bm!36479 () Bool)

(declare-fun c!90743 () Bool)

(declare-fun call!36483 () List!15949)

(assert (=> bm!36479 (= call!36483 ($colon$colon!537 e!464747 (ite c!90743 (h!17075 (toList!4505 call!36380)) (tuple2!10157 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90741 () Bool)

(assert (=> bm!36479 (= c!90741 c!90743)))

(declare-fun b!833219 () Bool)

(declare-fun res!566637 () Bool)

(declare-fun e!464750 () Bool)

(assert (=> b!833219 (=> (not res!566637) (not e!464750))))

(declare-fun lt!378076 () List!15949)

(assert (=> b!833219 (= res!566637 (containsKey!402 lt!378076 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!833220 () Bool)

(declare-fun e!464751 () List!15949)

(assert (=> b!833220 (= e!464751 call!36483)))

(declare-fun b!833221 () Bool)

(assert (=> b!833221 (= c!90740 (and ((_ is Cons!15945) (toList!4505 call!36380)) (bvsgt (_1!5089 (h!17075 (toList!4505 call!36380))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464749 () List!15949)

(assert (=> b!833221 (= e!464749 e!464748)))

(declare-fun d!107181 () Bool)

(assert (=> d!107181 e!464750))

(declare-fun res!566636 () Bool)

(assert (=> d!107181 (=> (not res!566636) (not e!464750))))

(assert (=> d!107181 (= res!566636 (isStrictlySorted!442 lt!378076))))

(assert (=> d!107181 (= lt!378076 e!464751)))

(assert (=> d!107181 (= c!90743 (and ((_ is Cons!15945) (toList!4505 call!36380)) (bvslt (_1!5089 (h!17075 (toList!4505 call!36380))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!107181 (isStrictlySorted!442 (toList!4505 call!36380))))

(assert (=> d!107181 (= (insertStrictlySorted!269 (toList!4505 call!36380) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!378076)))

(declare-fun b!833222 () Bool)

(assert (=> b!833222 (= e!464749 call!36481)))

(declare-fun bm!36480 () Bool)

(assert (=> bm!36480 (= call!36481 call!36483)))

(declare-fun b!833223 () Bool)

(assert (=> b!833223 (= e!464750 (contains!4212 lt!378076 (tuple2!10157 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!833224 () Bool)

(assert (=> b!833224 (= e!464751 e!464749)))

(assert (=> b!833224 (= c!90742 (and ((_ is Cons!15945) (toList!4505 call!36380)) (= (_1!5089 (h!17075 (toList!4505 call!36380))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!107181 c!90743) b!833220))

(assert (= (and d!107181 (not c!90743)) b!833224))

(assert (= (and b!833224 c!90742) b!833222))

(assert (= (and b!833224 (not c!90742)) b!833221))

(assert (= (and b!833221 c!90740) b!833215))

(assert (= (and b!833221 (not c!90740)) b!833217))

(assert (= (or b!833215 b!833217) bm!36478))

(assert (= (or b!833222 bm!36478) bm!36480))

(assert (= (or b!833220 bm!36480) bm!36479))

(assert (= (and bm!36479 c!90741) b!833216))

(assert (= (and bm!36479 (not c!90741)) b!833218))

(assert (= (and d!107181 res!566636) b!833219))

(assert (= (and b!833219 res!566637) b!833223))

(declare-fun m!777899 () Bool)

(assert (=> d!107181 m!777899))

(declare-fun m!777901 () Bool)

(assert (=> d!107181 m!777901))

(declare-fun m!777903 () Bool)

(assert (=> b!833219 m!777903))

(declare-fun m!777905 () Bool)

(assert (=> b!833223 m!777905))

(declare-fun m!777907 () Bool)

(assert (=> bm!36479 m!777907))

(declare-fun m!777909 () Bool)

(assert (=> b!833216 m!777909))

(assert (=> d!106469 d!107181))

(declare-fun d!107183 () Bool)

(declare-fun e!464752 () Bool)

(assert (=> d!107183 e!464752))

(declare-fun res!566638 () Bool)

(assert (=> d!107183 (=> res!566638 e!464752)))

(declare-fun lt!378080 () Bool)

(assert (=> d!107183 (= res!566638 (not lt!378080))))

(declare-fun lt!378079 () Bool)

(assert (=> d!107183 (= lt!378080 lt!378079)))

(declare-fun lt!378078 () Unit!28493)

(declare-fun e!464753 () Unit!28493)

(assert (=> d!107183 (= lt!378078 e!464753)))

(declare-fun c!90744 () Bool)

(assert (=> d!107183 (= c!90744 lt!378079)))

(assert (=> d!107183 (= lt!378079 (containsKey!402 (toList!4505 lt!377725) (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(assert (=> d!107183 (= (contains!4211 lt!377725 (_1!5089 (tuple2!10157 lt!377585 minValue!754))) lt!378080)))

(declare-fun b!833225 () Bool)

(declare-fun lt!378077 () Unit!28493)

(assert (=> b!833225 (= e!464753 lt!378077)))

(assert (=> b!833225 (= lt!378077 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377725) (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(assert (=> b!833225 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377725) (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun b!833226 () Bool)

(declare-fun Unit!28545 () Unit!28493)

(assert (=> b!833226 (= e!464753 Unit!28545)))

(declare-fun b!833227 () Bool)

(assert (=> b!833227 (= e!464752 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377725) (_1!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(assert (= (and d!107183 c!90744) b!833225))

(assert (= (and d!107183 (not c!90744)) b!833226))

(assert (= (and d!107183 (not res!566638)) b!833227))

(declare-fun m!777911 () Bool)

(assert (=> d!107183 m!777911))

(declare-fun m!777913 () Bool)

(assert (=> b!833225 m!777913))

(assert (=> b!833225 m!776301))

(assert (=> b!833225 m!776301))

(declare-fun m!777915 () Bool)

(assert (=> b!833225 m!777915))

(assert (=> b!833227 m!776301))

(assert (=> b!833227 m!776301))

(assert (=> b!833227 m!777915))

(assert (=> d!106413 d!107183))

(declare-fun e!464755 () Option!422)

(declare-fun b!833230 () Bool)

(assert (=> b!833230 (= e!464755 (getValueByKey!416 (t!22317 lt!377724) (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun b!833229 () Bool)

(declare-fun e!464754 () Option!422)

(assert (=> b!833229 (= e!464754 e!464755)))

(declare-fun c!90746 () Bool)

(assert (=> b!833229 (= c!90746 (and ((_ is Cons!15945) lt!377724) (not (= (_1!5089 (h!17075 lt!377724)) (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))))

(declare-fun b!833231 () Bool)

(assert (=> b!833231 (= e!464755 None!420)))

(declare-fun b!833228 () Bool)

(assert (=> b!833228 (= e!464754 (Some!421 (_2!5089 (h!17075 lt!377724))))))

(declare-fun c!90745 () Bool)

(declare-fun d!107185 () Bool)

(assert (=> d!107185 (= c!90745 (and ((_ is Cons!15945) lt!377724) (= (_1!5089 (h!17075 lt!377724)) (_1!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(assert (=> d!107185 (= (getValueByKey!416 lt!377724 (_1!5089 (tuple2!10157 lt!377585 minValue!754))) e!464754)))

(assert (= (and d!107185 c!90745) b!833228))

(assert (= (and d!107185 (not c!90745)) b!833229))

(assert (= (and b!833229 c!90746) b!833230))

(assert (= (and b!833229 (not c!90746)) b!833231))

(declare-fun m!777917 () Bool)

(assert (=> b!833230 m!777917))

(assert (=> d!106413 d!107185))

(declare-fun d!107187 () Bool)

(assert (=> d!107187 (= (getValueByKey!416 lt!377724 (_1!5089 (tuple2!10157 lt!377585 minValue!754))) (Some!421 (_2!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun lt!378081 () Unit!28493)

(assert (=> d!107187 (= lt!378081 (choose!1423 lt!377724 (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun e!464756 () Bool)

(assert (=> d!107187 e!464756))

(declare-fun res!566639 () Bool)

(assert (=> d!107187 (=> (not res!566639) (not e!464756))))

(assert (=> d!107187 (= res!566639 (isStrictlySorted!442 lt!377724))))

(assert (=> d!107187 (= (lemmaContainsTupThenGetReturnValue!230 lt!377724 (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754))) lt!378081)))

(declare-fun b!833232 () Bool)

(declare-fun res!566640 () Bool)

(assert (=> b!833232 (=> (not res!566640) (not e!464756))))

(assert (=> b!833232 (= res!566640 (containsKey!402 lt!377724 (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun b!833233 () Bool)

(assert (=> b!833233 (= e!464756 (contains!4212 lt!377724 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(assert (= (and d!107187 res!566639) b!833232))

(assert (= (and b!833232 res!566640) b!833233))

(assert (=> d!107187 m!776295))

(declare-fun m!777919 () Bool)

(assert (=> d!107187 m!777919))

(declare-fun m!777921 () Bool)

(assert (=> d!107187 m!777921))

(declare-fun m!777923 () Bool)

(assert (=> b!833232 m!777923))

(declare-fun m!777925 () Bool)

(assert (=> b!833233 m!777925))

(assert (=> d!106413 d!107187))

(declare-fun b!833234 () Bool)

(declare-fun e!464758 () List!15949)

(declare-fun call!36485 () List!15949)

(assert (=> b!833234 (= e!464758 call!36485)))

(declare-fun e!464757 () List!15949)

(declare-fun b!833235 () Bool)

(assert (=> b!833235 (= e!464757 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377598)) (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun bm!36481 () Bool)

(declare-fun call!36484 () List!15949)

(assert (=> bm!36481 (= call!36485 call!36484)))

(declare-fun b!833236 () Bool)

(assert (=> b!833236 (= e!464758 call!36485)))

(declare-fun c!90749 () Bool)

(declare-fun b!833237 () Bool)

(declare-fun c!90747 () Bool)

(assert (=> b!833237 (= e!464757 (ite c!90749 (t!22317 (toList!4505 lt!377598)) (ite c!90747 (Cons!15945 (h!17075 (toList!4505 lt!377598)) (t!22317 (toList!4505 lt!377598))) Nil!15946)))))

(declare-fun c!90750 () Bool)

(declare-fun bm!36482 () Bool)

(declare-fun call!36486 () List!15949)

(assert (=> bm!36482 (= call!36486 ($colon$colon!537 e!464757 (ite c!90750 (h!17075 (toList!4505 lt!377598)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754))))))))

(declare-fun c!90748 () Bool)

(assert (=> bm!36482 (= c!90748 c!90750)))

(declare-fun b!833238 () Bool)

(declare-fun res!566642 () Bool)

(declare-fun e!464760 () Bool)

(assert (=> b!833238 (=> (not res!566642) (not e!464760))))

(declare-fun lt!378082 () List!15949)

(assert (=> b!833238 (= res!566642 (containsKey!402 lt!378082 (_1!5089 (tuple2!10157 lt!377585 minValue!754))))))

(declare-fun b!833239 () Bool)

(declare-fun e!464761 () List!15949)

(assert (=> b!833239 (= e!464761 call!36486)))

(declare-fun b!833240 () Bool)

(assert (=> b!833240 (= c!90747 (and ((_ is Cons!15945) (toList!4505 lt!377598)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377598))) (_1!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(declare-fun e!464759 () List!15949)

(assert (=> b!833240 (= e!464759 e!464758)))

(declare-fun d!107189 () Bool)

(assert (=> d!107189 e!464760))

(declare-fun res!566641 () Bool)

(assert (=> d!107189 (=> (not res!566641) (not e!464760))))

(assert (=> d!107189 (= res!566641 (isStrictlySorted!442 lt!378082))))

(assert (=> d!107189 (= lt!378082 e!464761)))

(assert (=> d!107189 (= c!90750 (and ((_ is Cons!15945) (toList!4505 lt!377598)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377598))) (_1!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(assert (=> d!107189 (isStrictlySorted!442 (toList!4505 lt!377598))))

(assert (=> d!107189 (= (insertStrictlySorted!269 (toList!4505 lt!377598) (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754))) lt!378082)))

(declare-fun b!833241 () Bool)

(assert (=> b!833241 (= e!464759 call!36484)))

(declare-fun bm!36483 () Bool)

(assert (=> bm!36483 (= call!36484 call!36486)))

(declare-fun b!833242 () Bool)

(assert (=> b!833242 (= e!464760 (contains!4212 lt!378082 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377585 minValue!754)) (_2!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(declare-fun b!833243 () Bool)

(assert (=> b!833243 (= e!464761 e!464759)))

(assert (=> b!833243 (= c!90749 (and ((_ is Cons!15945) (toList!4505 lt!377598)) (= (_1!5089 (h!17075 (toList!4505 lt!377598))) (_1!5089 (tuple2!10157 lt!377585 minValue!754)))))))

(assert (= (and d!107189 c!90750) b!833239))

(assert (= (and d!107189 (not c!90750)) b!833243))

(assert (= (and b!833243 c!90749) b!833241))

(assert (= (and b!833243 (not c!90749)) b!833240))

(assert (= (and b!833240 c!90747) b!833234))

(assert (= (and b!833240 (not c!90747)) b!833236))

(assert (= (or b!833234 b!833236) bm!36481))

(assert (= (or b!833241 bm!36481) bm!36483))

(assert (= (or b!833239 bm!36483) bm!36482))

(assert (= (and bm!36482 c!90748) b!833235))

(assert (= (and bm!36482 (not c!90748)) b!833237))

(assert (= (and d!107189 res!566641) b!833238))

(assert (= (and b!833238 res!566642) b!833242))

(declare-fun m!777927 () Bool)

(assert (=> d!107189 m!777927))

(declare-fun m!777929 () Bool)

(assert (=> d!107189 m!777929))

(declare-fun m!777931 () Bool)

(assert (=> b!833238 m!777931))

(declare-fun m!777933 () Bool)

(assert (=> b!833242 m!777933))

(declare-fun m!777935 () Bool)

(assert (=> bm!36482 m!777935))

(declare-fun m!777937 () Bool)

(assert (=> b!833235 m!777937))

(assert (=> d!106413 d!107189))

(assert (=> b!832078 d!106999))

(assert (=> b!832078 d!106973))

(declare-fun d!107191 () Bool)

(declare-fun res!566643 () Bool)

(declare-fun e!464762 () Bool)

(assert (=> d!107191 (=> res!566643 e!464762)))

(assert (=> d!107191 (= res!566643 (and ((_ is Cons!15945) lt!377848) (= (_1!5089 (h!17075 lt!377848)) (_1!5089 lt!377428))))))

(assert (=> d!107191 (= (containsKey!402 lt!377848 (_1!5089 lt!377428)) e!464762)))

(declare-fun b!833244 () Bool)

(declare-fun e!464763 () Bool)

(assert (=> b!833244 (= e!464762 e!464763)))

(declare-fun res!566644 () Bool)

(assert (=> b!833244 (=> (not res!566644) (not e!464763))))

(assert (=> b!833244 (= res!566644 (and (or (not ((_ is Cons!15945) lt!377848)) (bvsle (_1!5089 (h!17075 lt!377848)) (_1!5089 lt!377428))) ((_ is Cons!15945) lt!377848) (bvslt (_1!5089 (h!17075 lt!377848)) (_1!5089 lt!377428))))))

(declare-fun b!833245 () Bool)

(assert (=> b!833245 (= e!464763 (containsKey!402 (t!22317 lt!377848) (_1!5089 lt!377428)))))

(assert (= (and d!107191 (not res!566643)) b!833244))

(assert (= (and b!833244 res!566644) b!833245))

(declare-fun m!777939 () Bool)

(assert (=> b!833245 m!777939))

(assert (=> b!832404 d!107191))

(declare-fun d!107193 () Bool)

(declare-fun e!464764 () Bool)

(assert (=> d!107193 e!464764))

(declare-fun res!566645 () Bool)

(assert (=> d!107193 (=> res!566645 e!464764)))

(declare-fun lt!378086 () Bool)

(assert (=> d!107193 (= res!566645 (not lt!378086))))

(declare-fun lt!378085 () Bool)

(assert (=> d!107193 (= lt!378086 lt!378085)))

(declare-fun lt!378084 () Unit!28493)

(declare-fun e!464765 () Unit!28493)

(assert (=> d!107193 (= lt!378084 e!464765)))

(declare-fun c!90751 () Bool)

(assert (=> d!107193 (= c!90751 lt!378085)))

(assert (=> d!107193 (= lt!378085 (containsKey!402 (toList!4505 lt!377854) (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(assert (=> d!107193 (= (contains!4211 lt!377854 (_1!5089 (tuple2!10157 lt!377491 lt!377490))) lt!378086)))

(declare-fun b!833246 () Bool)

(declare-fun lt!378083 () Unit!28493)

(assert (=> b!833246 (= e!464765 lt!378083)))

(assert (=> b!833246 (= lt!378083 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377854) (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(assert (=> b!833246 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377854) (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun b!833247 () Bool)

(declare-fun Unit!28546 () Unit!28493)

(assert (=> b!833247 (= e!464765 Unit!28546)))

(declare-fun b!833248 () Bool)

(assert (=> b!833248 (= e!464764 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377854) (_1!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(assert (= (and d!107193 c!90751) b!833246))

(assert (= (and d!107193 (not c!90751)) b!833247))

(assert (= (and d!107193 (not res!566645)) b!833248))

(declare-fun m!777941 () Bool)

(assert (=> d!107193 m!777941))

(declare-fun m!777943 () Bool)

(assert (=> b!833246 m!777943))

(assert (=> b!833246 m!776789))

(assert (=> b!833246 m!776789))

(declare-fun m!777945 () Bool)

(assert (=> b!833246 m!777945))

(assert (=> b!833248 m!776789))

(assert (=> b!833248 m!776789))

(assert (=> b!833248 m!777945))

(assert (=> d!106571 d!107193))

(declare-fun b!833251 () Bool)

(declare-fun e!464767 () Option!422)

(assert (=> b!833251 (= e!464767 (getValueByKey!416 (t!22317 lt!377853) (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun b!833250 () Bool)

(declare-fun e!464766 () Option!422)

(assert (=> b!833250 (= e!464766 e!464767)))

(declare-fun c!90753 () Bool)

(assert (=> b!833250 (= c!90753 (and ((_ is Cons!15945) lt!377853) (not (= (_1!5089 (h!17075 lt!377853)) (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))))

(declare-fun b!833252 () Bool)

(assert (=> b!833252 (= e!464767 None!420)))

(declare-fun b!833249 () Bool)

(assert (=> b!833249 (= e!464766 (Some!421 (_2!5089 (h!17075 lt!377853))))))

(declare-fun d!107195 () Bool)

(declare-fun c!90752 () Bool)

(assert (=> d!107195 (= c!90752 (and ((_ is Cons!15945) lt!377853) (= (_1!5089 (h!17075 lt!377853)) (_1!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(assert (=> d!107195 (= (getValueByKey!416 lt!377853 (_1!5089 (tuple2!10157 lt!377491 lt!377490))) e!464766)))

(assert (= (and d!107195 c!90752) b!833249))

(assert (= (and d!107195 (not c!90752)) b!833250))

(assert (= (and b!833250 c!90753) b!833251))

(assert (= (and b!833250 (not c!90753)) b!833252))

(declare-fun m!777947 () Bool)

(assert (=> b!833251 m!777947))

(assert (=> d!106571 d!107195))

(declare-fun d!107197 () Bool)

(assert (=> d!107197 (= (getValueByKey!416 lt!377853 (_1!5089 (tuple2!10157 lt!377491 lt!377490))) (Some!421 (_2!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun lt!378087 () Unit!28493)

(assert (=> d!107197 (= lt!378087 (choose!1423 lt!377853 (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun e!464768 () Bool)

(assert (=> d!107197 e!464768))

(declare-fun res!566646 () Bool)

(assert (=> d!107197 (=> (not res!566646) (not e!464768))))

(assert (=> d!107197 (= res!566646 (isStrictlySorted!442 lt!377853))))

(assert (=> d!107197 (= (lemmaContainsTupThenGetReturnValue!230 lt!377853 (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490))) lt!378087)))

(declare-fun b!833253 () Bool)

(declare-fun res!566647 () Bool)

(assert (=> b!833253 (=> (not res!566647) (not e!464768))))

(assert (=> b!833253 (= res!566647 (containsKey!402 lt!377853 (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun b!833254 () Bool)

(assert (=> b!833254 (= e!464768 (contains!4212 lt!377853 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(assert (= (and d!107197 res!566646) b!833253))

(assert (= (and b!833253 res!566647) b!833254))

(assert (=> d!107197 m!776783))

(declare-fun m!777949 () Bool)

(assert (=> d!107197 m!777949))

(declare-fun m!777951 () Bool)

(assert (=> d!107197 m!777951))

(declare-fun m!777953 () Bool)

(assert (=> b!833253 m!777953))

(declare-fun m!777955 () Bool)

(assert (=> b!833254 m!777955))

(assert (=> d!106571 d!107197))

(declare-fun b!833255 () Bool)

(declare-fun e!464770 () List!15949)

(declare-fun call!36488 () List!15949)

(assert (=> b!833255 (= e!464770 call!36488)))

(declare-fun e!464769 () List!15949)

(declare-fun b!833256 () Bool)

(assert (=> b!833256 (= e!464769 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377495)) (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun bm!36484 () Bool)

(declare-fun call!36487 () List!15949)

(assert (=> bm!36484 (= call!36488 call!36487)))

(declare-fun b!833257 () Bool)

(assert (=> b!833257 (= e!464770 call!36488)))

(declare-fun c!90756 () Bool)

(declare-fun c!90754 () Bool)

(declare-fun b!833258 () Bool)

(assert (=> b!833258 (= e!464769 (ite c!90756 (t!22317 (toList!4505 lt!377495)) (ite c!90754 (Cons!15945 (h!17075 (toList!4505 lt!377495)) (t!22317 (toList!4505 lt!377495))) Nil!15946)))))

(declare-fun call!36489 () List!15949)

(declare-fun c!90757 () Bool)

(declare-fun bm!36485 () Bool)

(assert (=> bm!36485 (= call!36489 ($colon$colon!537 e!464769 (ite c!90757 (h!17075 (toList!4505 lt!377495)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490))))))))

(declare-fun c!90755 () Bool)

(assert (=> bm!36485 (= c!90755 c!90757)))

(declare-fun b!833259 () Bool)

(declare-fun res!566649 () Bool)

(declare-fun e!464772 () Bool)

(assert (=> b!833259 (=> (not res!566649) (not e!464772))))

(declare-fun lt!378088 () List!15949)

(assert (=> b!833259 (= res!566649 (containsKey!402 lt!378088 (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun b!833260 () Bool)

(declare-fun e!464773 () List!15949)

(assert (=> b!833260 (= e!464773 call!36489)))

(declare-fun b!833261 () Bool)

(assert (=> b!833261 (= c!90754 (and ((_ is Cons!15945) (toList!4505 lt!377495)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377495))) (_1!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(declare-fun e!464771 () List!15949)

(assert (=> b!833261 (= e!464771 e!464770)))

(declare-fun d!107199 () Bool)

(assert (=> d!107199 e!464772))

(declare-fun res!566648 () Bool)

(assert (=> d!107199 (=> (not res!566648) (not e!464772))))

(assert (=> d!107199 (= res!566648 (isStrictlySorted!442 lt!378088))))

(assert (=> d!107199 (= lt!378088 e!464773)))

(assert (=> d!107199 (= c!90757 (and ((_ is Cons!15945) (toList!4505 lt!377495)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377495))) (_1!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(assert (=> d!107199 (isStrictlySorted!442 (toList!4505 lt!377495))))

(assert (=> d!107199 (= (insertStrictlySorted!269 (toList!4505 lt!377495) (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490))) lt!378088)))

(declare-fun b!833262 () Bool)

(assert (=> b!833262 (= e!464771 call!36487)))

(declare-fun bm!36486 () Bool)

(assert (=> bm!36486 (= call!36487 call!36489)))

(declare-fun b!833263 () Bool)

(assert (=> b!833263 (= e!464772 (contains!4212 lt!378088 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377491 lt!377490)) (_2!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(declare-fun b!833264 () Bool)

(assert (=> b!833264 (= e!464773 e!464771)))

(assert (=> b!833264 (= c!90756 (and ((_ is Cons!15945) (toList!4505 lt!377495)) (= (_1!5089 (h!17075 (toList!4505 lt!377495))) (_1!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(assert (= (and d!107199 c!90757) b!833260))

(assert (= (and d!107199 (not c!90757)) b!833264))

(assert (= (and b!833264 c!90756) b!833262))

(assert (= (and b!833264 (not c!90756)) b!833261))

(assert (= (and b!833261 c!90754) b!833255))

(assert (= (and b!833261 (not c!90754)) b!833257))

(assert (= (or b!833255 b!833257) bm!36484))

(assert (= (or b!833262 bm!36484) bm!36486))

(assert (= (or b!833260 bm!36486) bm!36485))

(assert (= (and bm!36485 c!90755) b!833256))

(assert (= (and bm!36485 (not c!90755)) b!833258))

(assert (= (and d!107199 res!566648) b!833259))

(assert (= (and b!833259 res!566649) b!833263))

(declare-fun m!777957 () Bool)

(assert (=> d!107199 m!777957))

(declare-fun m!777959 () Bool)

(assert (=> d!107199 m!777959))

(declare-fun m!777961 () Bool)

(assert (=> b!833259 m!777961))

(declare-fun m!777963 () Bool)

(assert (=> b!833263 m!777963))

(declare-fun m!777965 () Bool)

(assert (=> bm!36485 m!777965))

(declare-fun m!777967 () Bool)

(assert (=> b!833256 m!777967))

(assert (=> d!106571 d!107199))

(declare-fun d!107201 () Bool)

(declare-fun c!90758 () Bool)

(assert (=> d!107201 (= c!90758 ((_ is Nil!15946) (toList!4505 lt!377461)))))

(declare-fun e!464774 () (InoxSet tuple2!10156))

(assert (=> d!107201 (= (content!388 (toList!4505 lt!377461)) e!464774)))

(declare-fun b!833265 () Bool)

(assert (=> b!833265 (= e!464774 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833266 () Bool)

(assert (=> b!833266 (= e!464774 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377461)) true) (content!388 (t!22317 (toList!4505 lt!377461)))))))

(assert (= (and d!107201 c!90758) b!833265))

(assert (= (and d!107201 (not c!90758)) b!833266))

(declare-fun m!777969 () Bool)

(assert (=> b!833266 m!777969))

(declare-fun m!777971 () Bool)

(assert (=> b!833266 m!777971))

(assert (=> d!106561 d!107201))

(assert (=> d!106371 d!106305))

(assert (=> d!106371 d!106303))

(declare-fun d!107203 () Bool)

(assert (=> d!107203 (= (apply!373 (+!1983 lt!377567 (tuple2!10157 lt!377568 minValue!754)) lt!377569) (apply!373 lt!377567 lt!377569))))

(assert (=> d!107203 true))

(declare-fun _$34!1153 () Unit!28493)

(assert (=> d!107203 (= (choose!1424 lt!377567 lt!377568 minValue!754 lt!377569) _$34!1153)))

(declare-fun bs!23325 () Bool)

(assert (= bs!23325 d!107203))

(assert (=> bs!23325 m!775875))

(assert (=> bs!23325 m!775875))

(assert (=> bs!23325 m!775893))

(assert (=> bs!23325 m!775871))

(assert (=> d!106517 d!107203))

(assert (=> d!106517 d!106501))

(assert (=> d!106517 d!106515))

(declare-fun d!107205 () Bool)

(declare-fun e!464775 () Bool)

(assert (=> d!107205 e!464775))

(declare-fun res!566650 () Bool)

(assert (=> d!107205 (=> res!566650 e!464775)))

(declare-fun lt!378092 () Bool)

(assert (=> d!107205 (= res!566650 (not lt!378092))))

(declare-fun lt!378091 () Bool)

(assert (=> d!107205 (= lt!378092 lt!378091)))

(declare-fun lt!378090 () Unit!28493)

(declare-fun e!464776 () Unit!28493)

(assert (=> d!107205 (= lt!378090 e!464776)))

(declare-fun c!90759 () Bool)

(assert (=> d!107205 (= c!90759 lt!378091)))

(assert (=> d!107205 (= lt!378091 (containsKey!402 (toList!4505 lt!377567) lt!377569))))

(assert (=> d!107205 (= (contains!4211 lt!377567 lt!377569) lt!378092)))

(declare-fun b!833267 () Bool)

(declare-fun lt!378089 () Unit!28493)

(assert (=> b!833267 (= e!464776 lt!378089)))

(assert (=> b!833267 (= lt!378089 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377567) lt!377569))))

(assert (=> b!833267 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377567) lt!377569))))

(declare-fun b!833268 () Bool)

(declare-fun Unit!28547 () Unit!28493)

(assert (=> b!833268 (= e!464776 Unit!28547)))

(declare-fun b!833269 () Bool)

(assert (=> b!833269 (= e!464775 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377567) lt!377569)))))

(assert (= (and d!107205 c!90759) b!833267))

(assert (= (and d!107205 (not c!90759)) b!833268))

(assert (= (and d!107205 (not res!566650)) b!833269))

(declare-fun m!777973 () Bool)

(assert (=> d!107205 m!777973))

(declare-fun m!777975 () Bool)

(assert (=> b!833267 m!777975))

(assert (=> b!833267 m!776571))

(assert (=> b!833267 m!776571))

(declare-fun m!777977 () Bool)

(assert (=> b!833267 m!777977))

(assert (=> b!833269 m!776571))

(assert (=> b!833269 m!776571))

(assert (=> b!833269 m!777977))

(assert (=> d!106517 d!107205))

(assert (=> d!106517 d!106505))

(declare-fun d!107207 () Bool)

(declare-fun res!566651 () Bool)

(declare-fun e!464777 () Bool)

(assert (=> d!107207 (=> res!566651 e!464777)))

(assert (=> d!107207 (= res!566651 (and ((_ is Cons!15945) (toList!4505 lt!377613)) (= (_1!5089 (h!17075 (toList!4505 lt!377613))) (_1!5089 lt!377428))))))

(assert (=> d!107207 (= (containsKey!402 (toList!4505 lt!377613) (_1!5089 lt!377428)) e!464777)))

(declare-fun b!833270 () Bool)

(declare-fun e!464778 () Bool)

(assert (=> b!833270 (= e!464777 e!464778)))

(declare-fun res!566652 () Bool)

(assert (=> b!833270 (=> (not res!566652) (not e!464778))))

(assert (=> b!833270 (= res!566652 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377613))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377613))) (_1!5089 lt!377428))) ((_ is Cons!15945) (toList!4505 lt!377613)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377613))) (_1!5089 lt!377428))))))

(declare-fun b!833271 () Bool)

(assert (=> b!833271 (= e!464778 (containsKey!402 (t!22317 (toList!4505 lt!377613)) (_1!5089 lt!377428)))))

(assert (= (and d!107207 (not res!566651)) b!833270))

(assert (= (and b!833270 res!566652) b!833271))

(declare-fun m!777979 () Bool)

(assert (=> b!833271 m!777979))

(assert (=> d!106451 d!107207))

(assert (=> d!106475 d!106473))

(declare-fun d!107209 () Bool)

(assert (=> d!107209 (= (getValueByKey!416 lt!377608 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!107209 true))

(declare-fun _$22!580 () Unit!28493)

(assert (=> d!107209 (= (choose!1423 lt!377608 (_1!5089 lt!377428) (_2!5089 lt!377428)) _$22!580)))

(declare-fun bs!23326 () Bool)

(assert (= bs!23326 d!107209))

(assert (=> bs!23326 m!775977))

(assert (=> d!106475 d!107209))

(declare-fun d!107211 () Bool)

(declare-fun res!566653 () Bool)

(declare-fun e!464779 () Bool)

(assert (=> d!107211 (=> res!566653 e!464779)))

(assert (=> d!107211 (= res!566653 (or ((_ is Nil!15946) lt!377608) ((_ is Nil!15946) (t!22317 lt!377608))))))

(assert (=> d!107211 (= (isStrictlySorted!442 lt!377608) e!464779)))

(declare-fun b!833272 () Bool)

(declare-fun e!464780 () Bool)

(assert (=> b!833272 (= e!464779 e!464780)))

(declare-fun res!566654 () Bool)

(assert (=> b!833272 (=> (not res!566654) (not e!464780))))

(assert (=> b!833272 (= res!566654 (bvslt (_1!5089 (h!17075 lt!377608)) (_1!5089 (h!17075 (t!22317 lt!377608)))))))

(declare-fun b!833273 () Bool)

(assert (=> b!833273 (= e!464780 (isStrictlySorted!442 (t!22317 lt!377608)))))

(assert (= (and d!107211 (not res!566653)) b!833272))

(assert (= (and b!833272 res!566654) b!833273))

(declare-fun m!777981 () Bool)

(assert (=> b!833273 m!777981))

(assert (=> d!106475 d!107211))

(declare-fun d!107213 () Bool)

(declare-fun e!464781 () Bool)

(assert (=> d!107213 e!464781))

(declare-fun res!566655 () Bool)

(assert (=> d!107213 (=> res!566655 e!464781)))

(declare-fun lt!378096 () Bool)

(assert (=> d!107213 (= res!566655 (not lt!378096))))

(declare-fun lt!378095 () Bool)

(assert (=> d!107213 (= lt!378096 lt!378095)))

(declare-fun lt!378094 () Unit!28493)

(declare-fun e!464782 () Unit!28493)

(assert (=> d!107213 (= lt!378094 e!464782)))

(declare-fun c!90760 () Bool)

(assert (=> d!107213 (= c!90760 lt!378095)))

(assert (=> d!107213 (= lt!378095 (containsKey!402 (toList!4505 lt!377750) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!107213 (= (contains!4211 lt!377750 #b1000000000000000000000000000000000000000000000000000000000000000) lt!378096)))

(declare-fun b!833274 () Bool)

(declare-fun lt!378093 () Unit!28493)

(assert (=> b!833274 (= e!464782 lt!378093)))

(assert (=> b!833274 (= lt!378093 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377750) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833274 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377750) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833275 () Bool)

(declare-fun Unit!28548 () Unit!28493)

(assert (=> b!833275 (= e!464782 Unit!28548)))

(declare-fun b!833276 () Bool)

(assert (=> b!833276 (= e!464781 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107213 c!90760) b!833274))

(assert (= (and d!107213 (not c!90760)) b!833275))

(assert (= (and d!107213 (not res!566655)) b!833276))

(declare-fun m!777983 () Bool)

(assert (=> d!107213 m!777983))

(declare-fun m!777985 () Bool)

(assert (=> b!833274 m!777985))

(declare-fun m!777987 () Bool)

(assert (=> b!833274 m!777987))

(assert (=> b!833274 m!777987))

(declare-fun m!777989 () Bool)

(assert (=> b!833274 m!777989))

(assert (=> b!833276 m!777987))

(assert (=> b!833276 m!777987))

(assert (=> b!833276 m!777989))

(assert (=> b!832246 d!107213))

(declare-fun d!107215 () Bool)

(declare-fun c!90761 () Bool)

(assert (=> d!107215 (= c!90761 ((_ is Nil!15946) (toList!4505 lt!377605)))))

(declare-fun e!464783 () (InoxSet tuple2!10156))

(assert (=> d!107215 (= (content!388 (toList!4505 lt!377605)) e!464783)))

(declare-fun b!833277 () Bool)

(assert (=> b!833277 (= e!464783 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833278 () Bool)

(assert (=> b!833278 (= e!464783 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377605)) true) (content!388 (t!22317 (toList!4505 lt!377605)))))))

(assert (= (and d!107215 c!90761) b!833277))

(assert (= (and d!107215 (not c!90761)) b!833278))

(declare-fun m!777991 () Bool)

(assert (=> b!833278 m!777991))

(declare-fun m!777993 () Bool)

(assert (=> b!833278 m!777993))

(assert (=> d!106357 d!107215))

(assert (=> d!106495 d!106507))

(assert (=> d!106495 d!106503))

(declare-fun d!107217 () Bool)

(assert (=> d!107217 (contains!4211 (+!1983 lt!377557 (tuple2!10157 lt!377564 zeroValueBefore!34)) lt!377566)))

(assert (=> d!107217 true))

(declare-fun _$35!429 () Unit!28493)

(assert (=> d!107217 (= (choose!1425 lt!377557 lt!377564 zeroValueBefore!34 lt!377566) _$35!429)))

(declare-fun bs!23327 () Bool)

(assert (= bs!23327 d!107217))

(assert (=> bs!23327 m!775865))

(assert (=> bs!23327 m!775865))

(assert (=> bs!23327 m!775867))

(assert (=> d!106495 d!107217))

(declare-fun d!107219 () Bool)

(declare-fun e!464784 () Bool)

(assert (=> d!107219 e!464784))

(declare-fun res!566656 () Bool)

(assert (=> d!107219 (=> res!566656 e!464784)))

(declare-fun lt!378100 () Bool)

(assert (=> d!107219 (= res!566656 (not lt!378100))))

(declare-fun lt!378099 () Bool)

(assert (=> d!107219 (= lt!378100 lt!378099)))

(declare-fun lt!378098 () Unit!28493)

(declare-fun e!464785 () Unit!28493)

(assert (=> d!107219 (= lt!378098 e!464785)))

(declare-fun c!90762 () Bool)

(assert (=> d!107219 (= c!90762 lt!378099)))

(assert (=> d!107219 (= lt!378099 (containsKey!402 (toList!4505 lt!377557) lt!377566))))

(assert (=> d!107219 (= (contains!4211 lt!377557 lt!377566) lt!378100)))

(declare-fun b!833279 () Bool)

(declare-fun lt!378097 () Unit!28493)

(assert (=> b!833279 (= e!464785 lt!378097)))

(assert (=> b!833279 (= lt!378097 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377557) lt!377566))))

(assert (=> b!833279 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377557) lt!377566))))

(declare-fun b!833280 () Bool)

(declare-fun Unit!28549 () Unit!28493)

(assert (=> b!833280 (= e!464785 Unit!28549)))

(declare-fun b!833281 () Bool)

(assert (=> b!833281 (= e!464784 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377557) lt!377566)))))

(assert (= (and d!107219 c!90762) b!833279))

(assert (= (and d!107219 (not c!90762)) b!833280))

(assert (= (and d!107219 (not res!566656)) b!833281))

(declare-fun m!777995 () Bool)

(assert (=> d!107219 m!777995))

(declare-fun m!777997 () Bool)

(assert (=> b!833279 m!777997))

(declare-fun m!777999 () Bool)

(assert (=> b!833279 m!777999))

(assert (=> b!833279 m!777999))

(declare-fun m!778001 () Bool)

(assert (=> b!833279 m!778001))

(assert (=> b!833281 m!777999))

(assert (=> b!833281 m!777999))

(assert (=> b!833281 m!778001))

(assert (=> d!106495 d!107219))

(declare-fun b!833282 () Bool)

(declare-fun e!464788 () ListLongMap!8979)

(assert (=> b!833282 (= e!464788 (ListLongMap!8980 Nil!15946))))

(declare-fun b!833283 () Bool)

(declare-fun lt!378107 () Unit!28493)

(declare-fun lt!378103 () Unit!28493)

(assert (=> b!833283 (= lt!378107 lt!378103)))

(declare-fun lt!378106 () ListLongMap!8979)

(declare-fun lt!378104 () (_ BitVec 64))

(declare-fun lt!378101 () V!25285)

(declare-fun lt!378102 () (_ BitVec 64))

(assert (=> b!833283 (not (contains!4211 (+!1983 lt!378106 (tuple2!10157 lt!378102 lt!378101)) lt!378104))))

(assert (=> b!833283 (= lt!378103 (addStillNotContains!198 lt!378106 lt!378102 lt!378101 lt!378104))))

(assert (=> b!833283 (= lt!378104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!833283 (= lt!378101 (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!833283 (= lt!378102 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun call!36490 () ListLongMap!8979)

(assert (=> b!833283 (= lt!378106 call!36490)))

(declare-fun e!464791 () ListLongMap!8979)

(assert (=> b!833283 (= e!464791 (+!1983 call!36490 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36487 () Bool)

(assert (=> bm!36487 (= call!36490 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!833284 () Bool)

(declare-fun e!464792 () Bool)

(declare-fun lt!378105 () ListLongMap!8979)

(assert (=> b!833284 (= e!464792 (= lt!378105 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!107221 () Bool)

(declare-fun e!464789 () Bool)

(assert (=> d!107221 e!464789))

(declare-fun res!566657 () Bool)

(assert (=> d!107221 (=> (not res!566657) (not e!464789))))

(assert (=> d!107221 (= res!566657 (not (contains!4211 lt!378105 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107221 (= lt!378105 e!464788)))

(declare-fun c!90763 () Bool)

(assert (=> d!107221 (= c!90763 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!107221 (validMask!0 mask!1312)))

(assert (=> d!107221 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!378105)))

(declare-fun b!833285 () Bool)

(assert (=> b!833285 (= e!464791 call!36490)))

(declare-fun b!833286 () Bool)

(declare-fun e!464790 () Bool)

(assert (=> b!833286 (= e!464790 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833286 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!833287 () Bool)

(declare-fun e!464787 () Bool)

(assert (=> b!833287 (= e!464787 e!464792)))

(declare-fun c!90764 () Bool)

(assert (=> b!833287 (= c!90764 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!833288 () Bool)

(assert (=> b!833288 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> b!833288 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22756 _values!788)))))

(declare-fun e!464786 () Bool)

(assert (=> b!833288 (= e!464786 (= (apply!373 lt!378105 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833289 () Bool)

(assert (=> b!833289 (= e!464789 e!464787)))

(declare-fun c!90766 () Bool)

(assert (=> b!833289 (= c!90766 e!464790)))

(declare-fun res!566659 () Bool)

(assert (=> b!833289 (=> (not res!566659) (not e!464790))))

(assert (=> b!833289 (= res!566659 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!833290 () Bool)

(assert (=> b!833290 (= e!464792 (isEmpty!657 lt!378105))))

(declare-fun b!833291 () Bool)

(assert (=> b!833291 (= e!464788 e!464791)))

(declare-fun c!90765 () Bool)

(assert (=> b!833291 (= c!90765 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833292 () Bool)

(assert (=> b!833292 (= e!464787 e!464786)))

(assert (=> b!833292 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun res!566660 () Bool)

(assert (=> b!833292 (= res!566660 (contains!4211 lt!378105 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833292 (=> (not res!566660) (not e!464786))))

(declare-fun b!833293 () Bool)

(declare-fun res!566658 () Bool)

(assert (=> b!833293 (=> (not res!566658) (not e!464789))))

(assert (=> b!833293 (= res!566658 (not (contains!4211 lt!378105 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107221 c!90763) b!833282))

(assert (= (and d!107221 (not c!90763)) b!833291))

(assert (= (and b!833291 c!90765) b!833283))

(assert (= (and b!833291 (not c!90765)) b!833285))

(assert (= (or b!833283 b!833285) bm!36487))

(assert (= (and d!107221 res!566657) b!833293))

(assert (= (and b!833293 res!566658) b!833289))

(assert (= (and b!833289 res!566659) b!833286))

(assert (= (and b!833289 c!90766) b!833292))

(assert (= (and b!833289 (not c!90766)) b!833287))

(assert (= (and b!833292 res!566660) b!833288))

(assert (= (and b!833287 c!90764) b!833284))

(assert (= (and b!833287 (not c!90764)) b!833290))

(declare-fun b_lambda!11443 () Bool)

(assert (=> (not b_lambda!11443) (not b!833283)))

(assert (=> b!833283 t!22322))

(declare-fun b_and!22585 () Bool)

(assert (= b_and!22583 (and (=> t!22322 result!8021) b_and!22585)))

(declare-fun b_lambda!11445 () Bool)

(assert (=> (not b_lambda!11445) (not b!833288)))

(assert (=> b!833288 t!22322))

(declare-fun b_and!22587 () Bool)

(assert (= b_and!22585 (and (=> t!22322 result!8021) b_and!22587)))

(declare-fun m!778003 () Bool)

(assert (=> b!833293 m!778003))

(assert (=> b!833286 m!777115))

(assert (=> b!833286 m!777115))

(assert (=> b!833286 m!777123))

(assert (=> b!833291 m!777115))

(assert (=> b!833291 m!777115))

(assert (=> b!833291 m!777123))

(declare-fun m!778005 () Bool)

(assert (=> b!833284 m!778005))

(declare-fun m!778007 () Bool)

(assert (=> b!833290 m!778007))

(declare-fun m!778009 () Bool)

(assert (=> b!833283 m!778009))

(assert (=> b!833283 m!775801))

(declare-fun m!778011 () Bool)

(assert (=> b!833283 m!778011))

(assert (=> b!833283 m!777115))

(assert (=> b!833283 m!778011))

(assert (=> b!833283 m!775801))

(declare-fun m!778013 () Bool)

(assert (=> b!833283 m!778013))

(declare-fun m!778015 () Bool)

(assert (=> b!833283 m!778015))

(declare-fun m!778017 () Bool)

(assert (=> b!833283 m!778017))

(assert (=> b!833283 m!778015))

(declare-fun m!778019 () Bool)

(assert (=> b!833283 m!778019))

(assert (=> bm!36487 m!778005))

(assert (=> b!833288 m!777115))

(declare-fun m!778021 () Bool)

(assert (=> b!833288 m!778021))

(assert (=> b!833288 m!775801))

(assert (=> b!833288 m!778011))

(assert (=> b!833288 m!777115))

(assert (=> b!833288 m!778011))

(assert (=> b!833288 m!775801))

(assert (=> b!833288 m!778013))

(assert (=> b!833292 m!777115))

(assert (=> b!833292 m!777115))

(declare-fun m!778023 () Bool)

(assert (=> b!833292 m!778023))

(declare-fun m!778025 () Bool)

(assert (=> d!107221 m!778025))

(assert (=> d!107221 m!775715))

(assert (=> b!832096 d!107221))

(declare-fun d!107223 () Bool)

(declare-fun lt!378108 () Bool)

(assert (=> d!107223 (= lt!378108 (select (content!388 lt!377604) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464794 () Bool)

(assert (=> d!107223 (= lt!378108 e!464794)))

(declare-fun res!566662 () Bool)

(assert (=> d!107223 (=> (not res!566662) (not e!464794))))

(assert (=> d!107223 (= res!566662 ((_ is Cons!15945) lt!377604))))

(assert (=> d!107223 (= (contains!4212 lt!377604 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!378108)))

(declare-fun b!833294 () Bool)

(declare-fun e!464793 () Bool)

(assert (=> b!833294 (= e!464794 e!464793)))

(declare-fun res!566661 () Bool)

(assert (=> b!833294 (=> res!566661 e!464793)))

(assert (=> b!833294 (= res!566661 (= (h!17075 lt!377604) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833295 () Bool)

(assert (=> b!833295 (= e!464793 (contains!4212 (t!22317 lt!377604) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!107223 res!566662) b!833294))

(assert (= (and b!833294 (not res!566661)) b!833295))

(declare-fun m!778027 () Bool)

(assert (=> d!107223 m!778027))

(declare-fun m!778029 () Bool)

(assert (=> d!107223 m!778029))

(declare-fun m!778031 () Bool)

(assert (=> b!833295 m!778031))

(assert (=> b!832221 d!107223))

(declare-fun b!833298 () Bool)

(declare-fun e!464796 () Option!422)

(assert (=> b!833298 (= e!464796 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377465))) (_1!5089 lt!377428)))))

(declare-fun b!833297 () Bool)

(declare-fun e!464795 () Option!422)

(assert (=> b!833297 (= e!464795 e!464796)))

(declare-fun c!90768 () Bool)

(assert (=> b!833297 (= c!90768 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377465))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377465)))) (_1!5089 lt!377428)))))))

(declare-fun b!833299 () Bool)

(assert (=> b!833299 (= e!464796 None!420)))

(declare-fun b!833296 () Bool)

(assert (=> b!833296 (= e!464795 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377465))))))))

(declare-fun d!107225 () Bool)

(declare-fun c!90767 () Bool)

(assert (=> d!107225 (= c!90767 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377465))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377465)))) (_1!5089 lt!377428))))))

(assert (=> d!107225 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377465)) (_1!5089 lt!377428)) e!464795)))

(assert (= (and d!107225 c!90767) b!833296))

(assert (= (and d!107225 (not c!90767)) b!833297))

(assert (= (and b!833297 c!90768) b!833298))

(assert (= (and b!833297 (not c!90768)) b!833299))

(declare-fun m!778033 () Bool)

(assert (=> b!833298 m!778033))

(assert (=> b!832211 d!107225))

(declare-fun d!107227 () Bool)

(declare-fun lt!378109 () Bool)

(assert (=> d!107227 (= lt!378109 (select (content!388 lt!377703) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464798 () Bool)

(assert (=> d!107227 (= lt!378109 e!464798)))

(declare-fun res!566664 () Bool)

(assert (=> d!107227 (=> (not res!566664) (not e!464798))))

(assert (=> d!107227 (= res!566664 ((_ is Cons!15945) lt!377703))))

(assert (=> d!107227 (= (contains!4212 lt!377703 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!378109)))

(declare-fun b!833300 () Bool)

(declare-fun e!464797 () Bool)

(assert (=> b!833300 (= e!464798 e!464797)))

(declare-fun res!566663 () Bool)

(assert (=> b!833300 (=> res!566663 e!464797)))

(assert (=> b!833300 (= res!566663 (= (h!17075 lt!377703) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833301 () Bool)

(assert (=> b!833301 (= e!464797 (contains!4212 (t!22317 lt!377703) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!107227 res!566664) b!833300))

(assert (= (and b!833300 (not res!566663)) b!833301))

(declare-fun m!778035 () Bool)

(assert (=> d!107227 m!778035))

(declare-fun m!778037 () Bool)

(assert (=> d!107227 m!778037))

(declare-fun m!778039 () Bool)

(assert (=> b!833301 m!778039))

(assert (=> b!832183 d!107227))

(declare-fun b!833304 () Bool)

(declare-fun e!464800 () Option!422)

(assert (=> b!833304 (= e!464800 (getValueByKey!416 (t!22317 (toList!4505 lt!377854)) (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))

(declare-fun b!833303 () Bool)

(declare-fun e!464799 () Option!422)

(assert (=> b!833303 (= e!464799 e!464800)))

(declare-fun c!90770 () Bool)

(assert (=> b!833303 (= c!90770 (and ((_ is Cons!15945) (toList!4505 lt!377854)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377854))) (_1!5089 (tuple2!10157 lt!377491 lt!377490))))))))

(declare-fun b!833305 () Bool)

(assert (=> b!833305 (= e!464800 None!420)))

(declare-fun b!833302 () Bool)

(assert (=> b!833302 (= e!464799 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377854)))))))

(declare-fun c!90769 () Bool)

(declare-fun d!107229 () Bool)

(assert (=> d!107229 (= c!90769 (and ((_ is Cons!15945) (toList!4505 lt!377854)) (= (_1!5089 (h!17075 (toList!4505 lt!377854))) (_1!5089 (tuple2!10157 lt!377491 lt!377490)))))))

(assert (=> d!107229 (= (getValueByKey!416 (toList!4505 lt!377854) (_1!5089 (tuple2!10157 lt!377491 lt!377490))) e!464799)))

(assert (= (and d!107229 c!90769) b!833302))

(assert (= (and d!107229 (not c!90769)) b!833303))

(assert (= (and b!833303 c!90770) b!833304))

(assert (= (and b!833303 (not c!90770)) b!833305))

(declare-fun m!778041 () Bool)

(assert (=> b!833304 m!778041))

(assert (=> b!832422 d!107229))

(declare-fun b!833308 () Bool)

(declare-fun e!464802 () Option!422)

(assert (=> b!833308 (= e!464802 (getValueByKey!416 (t!22317 (t!22317 (toList!4505 lt!377613))) (_1!5089 lt!377428)))))

(declare-fun b!833307 () Bool)

(declare-fun e!464801 () Option!422)

(assert (=> b!833307 (= e!464801 e!464802)))

(declare-fun c!90772 () Bool)

(assert (=> b!833307 (= c!90772 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377613))) (not (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377613)))) (_1!5089 lt!377428)))))))

(declare-fun b!833309 () Bool)

(assert (=> b!833309 (= e!464802 None!420)))

(declare-fun b!833306 () Bool)

(assert (=> b!833306 (= e!464801 (Some!421 (_2!5089 (h!17075 (t!22317 (toList!4505 lt!377613))))))))

(declare-fun d!107231 () Bool)

(declare-fun c!90771 () Bool)

(assert (=> d!107231 (= c!90771 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377613))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377613)))) (_1!5089 lt!377428))))))

(assert (=> d!107231 (= (getValueByKey!416 (t!22317 (toList!4505 lt!377613)) (_1!5089 lt!377428)) e!464801)))

(assert (= (and d!107231 c!90771) b!833306))

(assert (= (and d!107231 (not c!90771)) b!833307))

(assert (= (and b!833307 c!90772) b!833308))

(assert (= (and b!833307 (not c!90772)) b!833309))

(declare-fun m!778043 () Bool)

(assert (=> b!833308 m!778043))

(assert (=> b!832284 d!107231))

(declare-fun d!107233 () Bool)

(assert (=> d!107233 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377567) lt!377569)) (v!10101 (getValueByKey!416 (toList!4505 lt!377567) lt!377569)))))

(assert (=> d!106501 d!107233))

(declare-fun b!833312 () Bool)

(declare-fun e!464804 () Option!422)

(assert (=> b!833312 (= e!464804 (getValueByKey!416 (t!22317 (toList!4505 lt!377567)) lt!377569))))

(declare-fun b!833311 () Bool)

(declare-fun e!464803 () Option!422)

(assert (=> b!833311 (= e!464803 e!464804)))

(declare-fun c!90774 () Bool)

(assert (=> b!833311 (= c!90774 (and ((_ is Cons!15945) (toList!4505 lt!377567)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377567))) lt!377569))))))

(declare-fun b!833313 () Bool)

(assert (=> b!833313 (= e!464804 None!420)))

(declare-fun b!833310 () Bool)

(assert (=> b!833310 (= e!464803 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377567)))))))

(declare-fun d!107235 () Bool)

(declare-fun c!90773 () Bool)

(assert (=> d!107235 (= c!90773 (and ((_ is Cons!15945) (toList!4505 lt!377567)) (= (_1!5089 (h!17075 (toList!4505 lt!377567))) lt!377569)))))

(assert (=> d!107235 (= (getValueByKey!416 (toList!4505 lt!377567) lt!377569) e!464803)))

(assert (= (and d!107235 c!90773) b!833310))

(assert (= (and d!107235 (not c!90773)) b!833311))

(assert (= (and b!833311 c!90774) b!833312))

(assert (= (and b!833311 (not c!90774)) b!833313))

(declare-fun m!778045 () Bool)

(assert (=> b!833312 m!778045))

(assert (=> d!106501 d!107235))

(declare-fun d!107237 () Bool)

(declare-fun e!464805 () Bool)

(assert (=> d!107237 e!464805))

(declare-fun res!566665 () Bool)

(assert (=> d!107237 (=> res!566665 e!464805)))

(declare-fun lt!378113 () Bool)

(assert (=> d!107237 (= res!566665 (not lt!378113))))

(declare-fun lt!378112 () Bool)

(assert (=> d!107237 (= lt!378113 lt!378112)))

(declare-fun lt!378111 () Unit!28493)

(declare-fun e!464806 () Unit!28493)

(assert (=> d!107237 (= lt!378111 e!464806)))

(declare-fun c!90775 () Bool)

(assert (=> d!107237 (= c!90775 lt!378112)))

(assert (=> d!107237 (= lt!378112 (containsKey!402 (toList!4505 lt!377672) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!107237 (= (contains!4211 lt!377672 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!378113)))

(declare-fun b!833314 () Bool)

(declare-fun lt!378110 () Unit!28493)

(assert (=> b!833314 (= e!464806 lt!378110)))

(assert (=> b!833314 (= lt!378110 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377672) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833314 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377672) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833315 () Bool)

(declare-fun Unit!28550 () Unit!28493)

(assert (=> b!833315 (= e!464806 Unit!28550)))

(declare-fun b!833316 () Bool)

(assert (=> b!833316 (= e!464805 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377672) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!107237 c!90775) b!833314))

(assert (= (and d!107237 (not c!90775)) b!833315))

(assert (= (and d!107237 (not res!566665)) b!833316))

(assert (=> d!107237 m!776103))

(declare-fun m!778047 () Bool)

(assert (=> d!107237 m!778047))

(assert (=> b!833314 m!776103))

(declare-fun m!778049 () Bool)

(assert (=> b!833314 m!778049))

(assert (=> b!833314 m!776103))

(assert (=> b!833314 m!777201))

(assert (=> b!833314 m!777201))

(declare-fun m!778051 () Bool)

(assert (=> b!833314 m!778051))

(assert (=> b!833316 m!776103))

(assert (=> b!833316 m!777201))

(assert (=> b!833316 m!777201))

(assert (=> b!833316 m!778051))

(assert (=> b!832104 d!107237))

(declare-fun d!107239 () Bool)

(declare-fun res!566666 () Bool)

(declare-fun e!464807 () Bool)

(assert (=> d!107239 (=> res!566666 e!464807)))

(assert (=> d!107239 (= res!566666 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))))) lt!377493)))))

(assert (=> d!107239 (= (containsKey!402 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))) lt!377493) e!464807)))

(declare-fun b!833317 () Bool)

(declare-fun e!464808 () Bool)

(assert (=> b!833317 (= e!464807 e!464808)))

(declare-fun res!566667 () Bool)

(assert (=> b!833317 (=> (not res!566667) (not e!464808))))

(assert (=> b!833317 (= res!566667 (and (or (not ((_ is Cons!15945) (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))))) (bvsle (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))))) lt!377493)) ((_ is Cons!15945) (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))) (bvslt (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490))))) lt!377493)))))

(declare-fun b!833318 () Bool)

(assert (=> b!833318 (= e!464808 (containsKey!402 (t!22317 (toList!4505 (+!1983 lt!377495 (tuple2!10157 lt!377491 lt!377490)))) lt!377493))))

(assert (= (and d!107239 (not res!566666)) b!833317))

(assert (= (and b!833317 res!566667) b!833318))

(declare-fun m!778053 () Bool)

(assert (=> b!833318 m!778053))

(assert (=> d!106575 d!107239))

(assert (=> d!106485 d!106483))

(declare-fun d!107241 () Bool)

(assert (=> d!107241 (= (getValueByKey!416 lt!377578 (_1!5089 lt!377425)) (Some!421 (_2!5089 lt!377425)))))

(assert (=> d!107241 true))

(declare-fun _$22!581 () Unit!28493)

(assert (=> d!107241 (= (choose!1423 lt!377578 (_1!5089 lt!377425) (_2!5089 lt!377425)) _$22!581)))

(declare-fun bs!23328 () Bool)

(assert (= bs!23328 d!107241))

(assert (=> bs!23328 m!775907))

(assert (=> d!106485 d!107241))

(declare-fun d!107243 () Bool)

(declare-fun res!566668 () Bool)

(declare-fun e!464809 () Bool)

(assert (=> d!107243 (=> res!566668 e!464809)))

(assert (=> d!107243 (= res!566668 (or ((_ is Nil!15946) lt!377578) ((_ is Nil!15946) (t!22317 lt!377578))))))

(assert (=> d!107243 (= (isStrictlySorted!442 lt!377578) e!464809)))

(declare-fun b!833319 () Bool)

(declare-fun e!464810 () Bool)

(assert (=> b!833319 (= e!464809 e!464810)))

(declare-fun res!566669 () Bool)

(assert (=> b!833319 (=> (not res!566669) (not e!464810))))

(assert (=> b!833319 (= res!566669 (bvslt (_1!5089 (h!17075 lt!377578)) (_1!5089 (h!17075 (t!22317 lt!377578)))))))

(declare-fun b!833320 () Bool)

(assert (=> b!833320 (= e!464810 (isStrictlySorted!442 (t!22317 lt!377578)))))

(assert (= (and d!107243 (not res!566668)) b!833319))

(assert (= (and b!833319 res!566669) b!833320))

(declare-fun m!778055 () Bool)

(assert (=> b!833320 m!778055))

(assert (=> d!106485 d!107243))

(assert (=> d!106383 d!106381))

(declare-fun d!107245 () Bool)

(assert (=> d!107245 (= (getValueByKey!416 lt!377464 (_1!5089 lt!377428)) (Some!421 (_2!5089 lt!377428)))))

(assert (=> d!107245 true))

(declare-fun _$22!582 () Unit!28493)

(assert (=> d!107245 (= (choose!1423 lt!377464 (_1!5089 lt!377428) (_2!5089 lt!377428)) _$22!582)))

(declare-fun bs!23329 () Bool)

(assert (= bs!23329 d!107245))

(assert (=> bs!23329 m!775777))

(assert (=> d!106383 d!107245))

(declare-fun d!107247 () Bool)

(declare-fun res!566670 () Bool)

(declare-fun e!464811 () Bool)

(assert (=> d!107247 (=> res!566670 e!464811)))

(assert (=> d!107247 (= res!566670 (or ((_ is Nil!15946) lt!377464) ((_ is Nil!15946) (t!22317 lt!377464))))))

(assert (=> d!107247 (= (isStrictlySorted!442 lt!377464) e!464811)))

(declare-fun b!833321 () Bool)

(declare-fun e!464812 () Bool)

(assert (=> b!833321 (= e!464811 e!464812)))

(declare-fun res!566671 () Bool)

(assert (=> b!833321 (=> (not res!566671) (not e!464812))))

(assert (=> b!833321 (= res!566671 (bvslt (_1!5089 (h!17075 lt!377464)) (_1!5089 (h!17075 (t!22317 lt!377464)))))))

(declare-fun b!833322 () Bool)

(assert (=> b!833322 (= e!464812 (isStrictlySorted!442 (t!22317 lt!377464)))))

(assert (= (and d!107247 (not res!566670)) b!833321))

(assert (= (and b!833321 res!566671) b!833322))

(declare-fun m!778057 () Bool)

(assert (=> b!833322 m!778057))

(assert (=> d!106383 d!107247))

(assert (=> b!832081 d!106647))

(declare-fun d!107249 () Bool)

(declare-fun c!90776 () Bool)

(assert (=> d!107249 (= c!90776 ((_ is Nil!15946) (toList!4505 lt!377613)))))

(declare-fun e!464813 () (InoxSet tuple2!10156))

(assert (=> d!107249 (= (content!388 (toList!4505 lt!377613)) e!464813)))

(declare-fun b!833323 () Bool)

(assert (=> b!833323 (= e!464813 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833324 () Bool)

(assert (=> b!833324 (= e!464813 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377613)) true) (content!388 (t!22317 (toList!4505 lt!377613)))))))

(assert (= (and d!107249 c!90776) b!833323))

(assert (= (and d!107249 (not c!90776)) b!833324))

(declare-fun m!778059 () Bool)

(assert (=> b!833324 m!778059))

(declare-fun m!778061 () Bool)

(assert (=> b!833324 m!778061))

(assert (=> d!106363 d!107249))

(declare-fun d!107251 () Bool)

(declare-fun lt!378114 () Bool)

(assert (=> d!107251 (= lt!378114 (select (content!388 (t!22317 (toList!4505 lt!377605))) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!464815 () Bool)

(assert (=> d!107251 (= lt!378114 e!464815)))

(declare-fun res!566673 () Bool)

(assert (=> d!107251 (=> (not res!566673) (not e!464815))))

(assert (=> d!107251 (= res!566673 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377605))))))

(assert (=> d!107251 (= (contains!4212 (t!22317 (toList!4505 lt!377605)) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378114)))

(declare-fun b!833325 () Bool)

(declare-fun e!464814 () Bool)

(assert (=> b!833325 (= e!464815 e!464814)))

(declare-fun res!566672 () Bool)

(assert (=> b!833325 (=> res!566672 e!464814)))

(assert (=> b!833325 (= res!566672 (= (h!17075 (t!22317 (toList!4505 lt!377605))) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!833326 () Bool)

(assert (=> b!833326 (= e!464814 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377605))) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!107251 res!566673) b!833325))

(assert (= (and b!833325 (not res!566672)) b!833326))

(assert (=> d!107251 m!777993))

(declare-fun m!778063 () Bool)

(assert (=> d!107251 m!778063))

(declare-fun m!778065 () Bool)

(assert (=> b!833326 m!778065))

(assert (=> b!832073 d!107251))

(declare-fun d!107253 () Bool)

(assert (=> d!107253 (= (get!11824 (getValueByKey!416 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754))) lt!377595)) (v!10101 (getValueByKey!416 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754))) lt!377595)))))

(assert (=> d!106419 d!107253))

(declare-fun b!833329 () Bool)

(declare-fun e!464817 () Option!422)

(assert (=> b!833329 (= e!464817 (getValueByKey!416 (t!22317 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)))) lt!377595))))

(declare-fun b!833328 () Bool)

(declare-fun e!464816 () Option!422)

(assert (=> b!833328 (= e!464816 e!464817)))

(declare-fun c!90778 () Bool)

(assert (=> b!833328 (= c!90778 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)))) (not (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754))))) lt!377595))))))

(declare-fun b!833330 () Bool)

(assert (=> b!833330 (= e!464817 None!420)))

(declare-fun b!833327 () Bool)

(assert (=> b!833327 (= e!464816 (Some!421 (_2!5089 (h!17075 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)))))))))

(declare-fun d!107255 () Bool)

(declare-fun c!90777 () Bool)

(assert (=> d!107255 (= c!90777 (and ((_ is Cons!15945) (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)))) (= (_1!5089 (h!17075 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754))))) lt!377595)))))

(assert (=> d!107255 (= (getValueByKey!416 (toList!4505 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754))) lt!377595) e!464816)))

(assert (= (and d!107255 c!90777) b!833327))

(assert (= (and d!107255 (not c!90777)) b!833328))

(assert (= (and b!833328 c!90778) b!833329))

(assert (= (and b!833328 (not c!90778)) b!833330))

(declare-fun m!778067 () Bool)

(assert (=> b!833329 m!778067))

(assert (=> d!106419 d!107255))

(assert (=> b!832365 d!107035))

(assert (=> b!832365 d!106909))

(assert (=> d!106497 d!106511))

(declare-fun d!107257 () Bool)

(declare-fun e!464818 () Bool)

(assert (=> d!107257 e!464818))

(declare-fun res!566674 () Bool)

(assert (=> d!107257 (=> res!566674 e!464818)))

(declare-fun lt!378118 () Bool)

(assert (=> d!107257 (= res!566674 (not lt!378118))))

(declare-fun lt!378117 () Bool)

(assert (=> d!107257 (= lt!378118 lt!378117)))

(declare-fun lt!378116 () Unit!28493)

(declare-fun e!464819 () Unit!28493)

(assert (=> d!107257 (= lt!378116 e!464819)))

(declare-fun c!90779 () Bool)

(assert (=> d!107257 (= c!90779 lt!378117)))

(assert (=> d!107257 (= lt!378117 (containsKey!402 (toList!4505 lt!377572) lt!377563))))

(assert (=> d!107257 (= (contains!4211 lt!377572 lt!377563) lt!378118)))

(declare-fun b!833331 () Bool)

(declare-fun lt!378115 () Unit!28493)

(assert (=> b!833331 (= e!464819 lt!378115)))

(assert (=> b!833331 (= lt!378115 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377572) lt!377563))))

(assert (=> b!833331 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377572) lt!377563))))

(declare-fun b!833332 () Bool)

(declare-fun Unit!28551 () Unit!28493)

(assert (=> b!833332 (= e!464819 Unit!28551)))

(declare-fun b!833333 () Bool)

(assert (=> b!833333 (= e!464818 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377572) lt!377563)))))

(assert (= (and d!107257 c!90779) b!833331))

(assert (= (and d!107257 (not c!90779)) b!833332))

(assert (= (and d!107257 (not res!566674)) b!833333))

(declare-fun m!778069 () Bool)

(assert (=> d!107257 m!778069))

(declare-fun m!778071 () Bool)

(assert (=> b!833331 m!778071))

(assert (=> b!833331 m!776603))

(assert (=> b!833331 m!776603))

(declare-fun m!778073 () Bool)

(assert (=> b!833331 m!778073))

(assert (=> b!833333 m!776603))

(assert (=> b!833333 m!776603))

(assert (=> b!833333 m!778073))

(assert (=> d!106497 d!107257))

(declare-fun d!107259 () Bool)

(assert (=> d!107259 (= (apply!373 (+!1983 lt!377572 (tuple2!10157 lt!377559 minValue!754)) lt!377563) (apply!373 lt!377572 lt!377563))))

(assert (=> d!107259 true))

(declare-fun _$34!1154 () Unit!28493)

(assert (=> d!107259 (= (choose!1424 lt!377572 lt!377559 minValue!754 lt!377563) _$34!1154)))

(declare-fun bs!23330 () Bool)

(assert (= bs!23330 d!107259))

(assert (=> bs!23330 m!775889))

(assert (=> bs!23330 m!775889))

(assert (=> bs!23330 m!775891))

(assert (=> bs!23330 m!775883))

(assert (=> d!106497 d!107259))

(assert (=> d!106497 d!106513))

(assert (=> d!106497 d!106519))

(declare-fun d!107261 () Bool)

(declare-fun c!90780 () Bool)

(assert (=> d!107261 (= c!90780 ((_ is Nil!15946) (toList!4505 lt!377609)))))

(declare-fun e!464820 () (InoxSet tuple2!10156))

(assert (=> d!107261 (= (content!388 (toList!4505 lt!377609)) e!464820)))

(declare-fun b!833334 () Bool)

(assert (=> b!833334 (= e!464820 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833335 () Bool)

(assert (=> b!833335 (= e!464820 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377609)) true) (content!388 (t!22317 (toList!4505 lt!377609)))))))

(assert (= (and d!107261 c!90780) b!833334))

(assert (= (and d!107261 (not c!90780)) b!833335))

(declare-fun m!778075 () Bool)

(assert (=> b!833335 m!778075))

(assert (=> b!833335 m!777569))

(assert (=> d!106359 d!107261))

(declare-fun b!833336 () Bool)

(declare-fun e!464822 () List!15949)

(declare-fun call!36492 () List!15949)

(assert (=> b!833336 (= e!464822 call!36492)))

(declare-fun b!833337 () Bool)

(declare-fun e!464821 () List!15949)

(assert (=> b!833337 (= e!464821 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 lt!377423))) (_1!5089 lt!377428) (_2!5089 lt!377428)))))

(declare-fun bm!36488 () Bool)

(declare-fun call!36491 () List!15949)

(assert (=> bm!36488 (= call!36492 call!36491)))

(declare-fun b!833338 () Bool)

(assert (=> b!833338 (= e!464822 call!36492)))

(declare-fun b!833339 () Bool)

(declare-fun c!90781 () Bool)

(declare-fun c!90783 () Bool)

(assert (=> b!833339 (= e!464821 (ite c!90783 (t!22317 (t!22317 (toList!4505 lt!377423))) (ite c!90781 (Cons!15945 (h!17075 (t!22317 (toList!4505 lt!377423))) (t!22317 (t!22317 (toList!4505 lt!377423)))) Nil!15946)))))

(declare-fun bm!36489 () Bool)

(declare-fun call!36493 () List!15949)

(declare-fun c!90784 () Bool)

(assert (=> bm!36489 (= call!36493 ($colon$colon!537 e!464821 (ite c!90784 (h!17075 (t!22317 (toList!4505 lt!377423))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))))))

(declare-fun c!90782 () Bool)

(assert (=> bm!36489 (= c!90782 c!90784)))

(declare-fun b!833340 () Bool)

(declare-fun res!566676 () Bool)

(declare-fun e!464824 () Bool)

(assert (=> b!833340 (=> (not res!566676) (not e!464824))))

(declare-fun lt!378119 () List!15949)

(assert (=> b!833340 (= res!566676 (containsKey!402 lt!378119 (_1!5089 lt!377428)))))

(declare-fun b!833341 () Bool)

(declare-fun e!464825 () List!15949)

(assert (=> b!833341 (= e!464825 call!36493)))

(declare-fun b!833342 () Bool)

(assert (=> b!833342 (= c!90781 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377423))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377423)))) (_1!5089 lt!377428))))))

(declare-fun e!464823 () List!15949)

(assert (=> b!833342 (= e!464823 e!464822)))

(declare-fun d!107263 () Bool)

(assert (=> d!107263 e!464824))

(declare-fun res!566675 () Bool)

(assert (=> d!107263 (=> (not res!566675) (not e!464824))))

(assert (=> d!107263 (= res!566675 (isStrictlySorted!442 lt!378119))))

(assert (=> d!107263 (= lt!378119 e!464825)))

(assert (=> d!107263 (= c!90784 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377423))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377423)))) (_1!5089 lt!377428))))))

(assert (=> d!107263 (isStrictlySorted!442 (t!22317 (toList!4505 lt!377423)))))

(assert (=> d!107263 (= (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377423)) (_1!5089 lt!377428) (_2!5089 lt!377428)) lt!378119)))

(declare-fun b!833343 () Bool)

(assert (=> b!833343 (= e!464823 call!36491)))

(declare-fun bm!36490 () Bool)

(assert (=> bm!36490 (= call!36491 call!36493)))

(declare-fun b!833344 () Bool)

(assert (=> b!833344 (= e!464824 (contains!4212 lt!378119 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!833345 () Bool)

(assert (=> b!833345 (= e!464825 e!464823)))

(assert (=> b!833345 (= c!90783 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377423))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377423)))) (_1!5089 lt!377428))))))

(assert (= (and d!107263 c!90784) b!833341))

(assert (= (and d!107263 (not c!90784)) b!833345))

(assert (= (and b!833345 c!90783) b!833343))

(assert (= (and b!833345 (not c!90783)) b!833342))

(assert (= (and b!833342 c!90781) b!833336))

(assert (= (and b!833342 (not c!90781)) b!833338))

(assert (= (or b!833336 b!833338) bm!36488))

(assert (= (or b!833343 bm!36488) bm!36490))

(assert (= (or b!833341 bm!36490) bm!36489))

(assert (= (and bm!36489 c!90782) b!833337))

(assert (= (and bm!36489 (not c!90782)) b!833339))

(assert (= (and d!107263 res!566675) b!833340))

(assert (= (and b!833340 res!566676) b!833344))

(declare-fun m!778077 () Bool)

(assert (=> d!107263 m!778077))

(assert (=> d!107263 m!777557))

(declare-fun m!778079 () Bool)

(assert (=> b!833340 m!778079))

(declare-fun m!778081 () Bool)

(assert (=> b!833344 m!778081))

(declare-fun m!778083 () Bool)

(assert (=> bm!36489 m!778083))

(declare-fun m!778085 () Bool)

(assert (=> b!833337 m!778085))

(assert (=> b!832298 d!107263))

(declare-fun d!107265 () Bool)

(assert (=> d!107265 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378120 () Unit!28493)

(assert (=> d!107265 (= lt!378120 (choose!1427 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464826 () Bool)

(assert (=> d!107265 e!464826))

(declare-fun res!566677 () Bool)

(assert (=> d!107265 (=> (not res!566677) (not e!464826))))

(assert (=> d!107265 (= res!566677 (isStrictlySorted!442 (toList!4505 lt!377494)))))

(assert (=> d!107265 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000) lt!378120)))

(declare-fun b!833346 () Bool)

(assert (=> b!833346 (= e!464826 (containsKey!402 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107265 res!566677) b!833346))

(assert (=> d!107265 m!776691))

(assert (=> d!107265 m!776691))

(assert (=> d!107265 m!776693))

(declare-fun m!778087 () Bool)

(assert (=> d!107265 m!778087))

(assert (=> d!107265 m!777551))

(assert (=> b!833346 m!776687))

(assert (=> b!832377 d!107265))

(assert (=> b!832377 d!106699))

(assert (=> b!832377 d!106701))

(declare-fun b!833347 () Bool)

(declare-fun e!464829 () ListLongMap!8979)

(assert (=> b!833347 (= e!464829 (ListLongMap!8980 Nil!15946))))

(declare-fun b!833348 () Bool)

(declare-fun lt!378127 () Unit!28493)

(declare-fun lt!378123 () Unit!28493)

(assert (=> b!833348 (= lt!378127 lt!378123)))

(declare-fun lt!378121 () V!25285)

(declare-fun lt!378122 () (_ BitVec 64))

(declare-fun lt!378124 () (_ BitVec 64))

(declare-fun lt!378126 () ListLongMap!8979)

(assert (=> b!833348 (not (contains!4211 (+!1983 lt!378126 (tuple2!10157 lt!378122 lt!378121)) lt!378124))))

(assert (=> b!833348 (= lt!378123 (addStillNotContains!198 lt!378126 lt!378122 lt!378121 lt!378124))))

(assert (=> b!833348 (= lt!378124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!833348 (= lt!378121 (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!833348 (= lt!378122 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun call!36494 () ListLongMap!8979)

(assert (=> b!833348 (= lt!378126 call!36494)))

(declare-fun e!464832 () ListLongMap!8979)

(assert (=> b!833348 (= e!464832 (+!1983 call!36494 (tuple2!10157 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!36491 () Bool)

(assert (=> bm!36491 (= call!36494 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun e!464833 () Bool)

(declare-fun lt!378125 () ListLongMap!8979)

(declare-fun b!833349 () Bool)

(assert (=> b!833349 (= e!464833 (= lt!378125 (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!107267 () Bool)

(declare-fun e!464830 () Bool)

(assert (=> d!107267 e!464830))

(declare-fun res!566678 () Bool)

(assert (=> d!107267 (=> (not res!566678) (not e!464830))))

(assert (=> d!107267 (= res!566678 (not (contains!4211 lt!378125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107267 (= lt!378125 e!464829)))

(declare-fun c!90785 () Bool)

(assert (=> d!107267 (= c!90785 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> d!107267 (validMask!0 mask!1312)))

(assert (=> d!107267 (= (getCurrentListMapNoExtraKeys!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!378125)))

(declare-fun b!833350 () Bool)

(assert (=> b!833350 (= e!464832 call!36494)))

(declare-fun b!833351 () Bool)

(declare-fun e!464831 () Bool)

(assert (=> b!833351 (= e!464831 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833351 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!833352 () Bool)

(declare-fun e!464828 () Bool)

(assert (=> b!833352 (= e!464828 e!464833)))

(declare-fun c!90786 () Bool)

(assert (=> b!833352 (= c!90786 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!833353 () Bool)

(assert (=> b!833353 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(assert (=> b!833353 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22756 _values!788)))))

(declare-fun e!464827 () Bool)

(assert (=> b!833353 (= e!464827 (= (apply!373 lt!378125 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11823 (select (arr!22335 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!984 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!833354 () Bool)

(assert (=> b!833354 (= e!464830 e!464828)))

(declare-fun c!90788 () Bool)

(assert (=> b!833354 (= c!90788 e!464831)))

(declare-fun res!566680 () Bool)

(assert (=> b!833354 (=> (not res!566680) (not e!464831))))

(assert (=> b!833354 (= res!566680 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun b!833355 () Bool)

(assert (=> b!833355 (= e!464833 (isEmpty!657 lt!378125))))

(declare-fun b!833356 () Bool)

(assert (=> b!833356 (= e!464829 e!464832)))

(declare-fun c!90787 () Bool)

(assert (=> b!833356 (= c!90787 (validKeyInArray!0 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!833357 () Bool)

(assert (=> b!833357 (= e!464828 e!464827)))

(assert (=> b!833357 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22755 _keys!976)))))

(declare-fun res!566681 () Bool)

(assert (=> b!833357 (= res!566681 (contains!4211 lt!378125 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!833357 (=> (not res!566681) (not e!464827))))

(declare-fun b!833358 () Bool)

(declare-fun res!566679 () Bool)

(assert (=> b!833358 (=> (not res!566679) (not e!464830))))

(assert (=> b!833358 (= res!566679 (not (contains!4211 lt!378125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107267 c!90785) b!833347))

(assert (= (and d!107267 (not c!90785)) b!833356))

(assert (= (and b!833356 c!90787) b!833348))

(assert (= (and b!833356 (not c!90787)) b!833350))

(assert (= (or b!833348 b!833350) bm!36491))

(assert (= (and d!107267 res!566678) b!833358))

(assert (= (and b!833358 res!566679) b!833354))

(assert (= (and b!833354 res!566680) b!833351))

(assert (= (and b!833354 c!90788) b!833357))

(assert (= (and b!833354 (not c!90788)) b!833352))

(assert (= (and b!833357 res!566681) b!833353))

(assert (= (and b!833352 c!90786) b!833349))

(assert (= (and b!833352 (not c!90786)) b!833355))

(declare-fun b_lambda!11447 () Bool)

(assert (=> (not b_lambda!11447) (not b!833348)))

(assert (=> b!833348 t!22322))

(declare-fun b_and!22589 () Bool)

(assert (= b_and!22587 (and (=> t!22322 result!8021) b_and!22589)))

(declare-fun b_lambda!11449 () Bool)

(assert (=> (not b_lambda!11449) (not b!833353)))

(assert (=> b!833353 t!22322))

(declare-fun b_and!22591 () Bool)

(assert (= b_and!22589 (and (=> t!22322 result!8021) b_and!22591)))

(declare-fun m!778089 () Bool)

(assert (=> b!833358 m!778089))

(assert (=> b!833351 m!777115))

(assert (=> b!833351 m!777115))

(assert (=> b!833351 m!777123))

(assert (=> b!833356 m!777115))

(assert (=> b!833356 m!777115))

(assert (=> b!833356 m!777123))

(declare-fun m!778091 () Bool)

(assert (=> b!833349 m!778091))

(declare-fun m!778093 () Bool)

(assert (=> b!833355 m!778093))

(declare-fun m!778095 () Bool)

(assert (=> b!833348 m!778095))

(assert (=> b!833348 m!775801))

(assert (=> b!833348 m!778011))

(assert (=> b!833348 m!777115))

(assert (=> b!833348 m!778011))

(assert (=> b!833348 m!775801))

(assert (=> b!833348 m!778013))

(declare-fun m!778097 () Bool)

(assert (=> b!833348 m!778097))

(declare-fun m!778099 () Bool)

(assert (=> b!833348 m!778099))

(assert (=> b!833348 m!778097))

(declare-fun m!778101 () Bool)

(assert (=> b!833348 m!778101))

(assert (=> bm!36491 m!778091))

(assert (=> b!833353 m!777115))

(declare-fun m!778103 () Bool)

(assert (=> b!833353 m!778103))

(assert (=> b!833353 m!775801))

(assert (=> b!833353 m!778011))

(assert (=> b!833353 m!777115))

(assert (=> b!833353 m!778011))

(assert (=> b!833353 m!775801))

(assert (=> b!833353 m!778013))

(assert (=> b!833357 m!777115))

(assert (=> b!833357 m!777115))

(declare-fun m!778105 () Bool)

(assert (=> b!833357 m!778105))

(declare-fun m!778107 () Bool)

(assert (=> d!107267 m!778107))

(assert (=> d!107267 m!775715))

(assert (=> b!832237 d!107267))

(declare-fun d!107269 () Bool)

(assert (=> d!107269 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377465) (_1!5089 lt!377428)))))

(declare-fun lt!378128 () Unit!28493)

(assert (=> d!107269 (= lt!378128 (choose!1427 (toList!4505 lt!377465) (_1!5089 lt!377428)))))

(declare-fun e!464834 () Bool)

(assert (=> d!107269 e!464834))

(declare-fun res!566682 () Bool)

(assert (=> d!107269 (=> (not res!566682) (not e!464834))))

(assert (=> d!107269 (= res!566682 (isStrictlySorted!442 (toList!4505 lt!377465)))))

(assert (=> d!107269 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377465) (_1!5089 lt!377428)) lt!378128)))

(declare-fun b!833359 () Bool)

(assert (=> b!833359 (= e!464834 (containsKey!402 (toList!4505 lt!377465) (_1!5089 lt!377428)))))

(assert (= (and d!107269 res!566682) b!833359))

(assert (=> d!107269 m!775783))

(assert (=> d!107269 m!775783))

(assert (=> d!107269 m!776173))

(declare-fun m!778109 () Bool)

(assert (=> d!107269 m!778109))

(declare-fun m!778111 () Bool)

(assert (=> d!107269 m!778111))

(assert (=> b!833359 m!776169))

(assert (=> b!832108 d!107269))

(assert (=> b!832108 d!106709))

(assert (=> b!832108 d!106435))

(assert (=> b!832281 d!107041))

(assert (=> b!832281 d!107043))

(declare-fun d!107271 () Bool)

(declare-fun res!566683 () Bool)

(declare-fun e!464835 () Bool)

(assert (=> d!107271 (=> res!566683 e!464835)))

(assert (=> d!107271 (= res!566683 (or ((_ is Nil!15946) lt!377779) ((_ is Nil!15946) (t!22317 lt!377779))))))

(assert (=> d!107271 (= (isStrictlySorted!442 lt!377779) e!464835)))

(declare-fun b!833360 () Bool)

(declare-fun e!464836 () Bool)

(assert (=> b!833360 (= e!464835 e!464836)))

(declare-fun res!566684 () Bool)

(assert (=> b!833360 (=> (not res!566684) (not e!464836))))

(assert (=> b!833360 (= res!566684 (bvslt (_1!5089 (h!17075 lt!377779)) (_1!5089 (h!17075 (t!22317 lt!377779)))))))

(declare-fun b!833361 () Bool)

(assert (=> b!833361 (= e!464836 (isStrictlySorted!442 (t!22317 lt!377779)))))

(assert (= (and d!107271 (not res!566683)) b!833360))

(assert (= (and b!833360 res!566684) b!833361))

(declare-fun m!778113 () Bool)

(assert (=> b!833361 m!778113))

(assert (=> d!106477 d!107271))

(assert (=> d!106477 d!107003))

(assert (=> bm!36395 d!107221))

(declare-fun b!833364 () Bool)

(declare-fun e!464838 () Option!422)

(assert (=> b!833364 (= e!464838 (getValueByKey!416 (t!22317 (t!22317 lt!377508)) (_1!5089 lt!377428)))))

(declare-fun b!833363 () Bool)

(declare-fun e!464837 () Option!422)

(assert (=> b!833363 (= e!464837 e!464838)))

(declare-fun c!90790 () Bool)

(assert (=> b!833363 (= c!90790 (and ((_ is Cons!15945) (t!22317 lt!377508)) (not (= (_1!5089 (h!17075 (t!22317 lt!377508))) (_1!5089 lt!377428)))))))

(declare-fun b!833365 () Bool)

(assert (=> b!833365 (= e!464838 None!420)))

(declare-fun b!833362 () Bool)

(assert (=> b!833362 (= e!464837 (Some!421 (_2!5089 (h!17075 (t!22317 lt!377508)))))))

(declare-fun d!107273 () Bool)

(declare-fun c!90789 () Bool)

(assert (=> d!107273 (= c!90789 (and ((_ is Cons!15945) (t!22317 lt!377508)) (= (_1!5089 (h!17075 (t!22317 lt!377508))) (_1!5089 lt!377428))))))

(assert (=> d!107273 (= (getValueByKey!416 (t!22317 lt!377508) (_1!5089 lt!377428)) e!464837)))

(assert (= (and d!107273 c!90789) b!833362))

(assert (= (and d!107273 (not c!90789)) b!833363))

(assert (= (and b!833363 c!90790) b!833364))

(assert (= (and b!833363 (not c!90790)) b!833365))

(declare-fun m!778115 () Bool)

(assert (=> b!833364 m!778115))

(assert (=> b!832396 d!107273))

(declare-fun d!107275 () Bool)

(assert (=> d!107275 (= ($colon$colon!537 e!464227 (ite c!90489 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428)))) (Cons!15945 (ite c!90489 (h!17075 (toList!4505 (+!1983 lt!377422 lt!377425))) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) e!464227))))

(assert (=> bm!36426 d!107275))

(assert (=> b!832272 d!107065))

(assert (=> b!832272 d!106581))

(assert (=> b!832215 d!107071))

(assert (=> b!832215 d!106533))

(declare-fun lt!378129 () Bool)

(declare-fun d!107277 () Bool)

(assert (=> d!107277 (= lt!378129 (select (content!388 (toList!4505 lt!377796)) (tuple2!10157 lt!377564 zeroValueBefore!34)))))

(declare-fun e!464840 () Bool)

(assert (=> d!107277 (= lt!378129 e!464840)))

(declare-fun res!566686 () Bool)

(assert (=> d!107277 (=> (not res!566686) (not e!464840))))

(assert (=> d!107277 (= res!566686 ((_ is Cons!15945) (toList!4505 lt!377796)))))

(assert (=> d!107277 (= (contains!4212 (toList!4505 lt!377796) (tuple2!10157 lt!377564 zeroValueBefore!34)) lt!378129)))

(declare-fun b!833366 () Bool)

(declare-fun e!464839 () Bool)

(assert (=> b!833366 (= e!464840 e!464839)))

(declare-fun res!566685 () Bool)

(assert (=> b!833366 (=> res!566685 e!464839)))

(assert (=> b!833366 (= res!566685 (= (h!17075 (toList!4505 lt!377796)) (tuple2!10157 lt!377564 zeroValueBefore!34)))))

(declare-fun b!833367 () Bool)

(assert (=> b!833367 (= e!464839 (contains!4212 (t!22317 (toList!4505 lt!377796)) (tuple2!10157 lt!377564 zeroValueBefore!34)))))

(assert (= (and d!107277 res!566686) b!833366))

(assert (= (and b!833366 (not res!566685)) b!833367))

(declare-fun m!778117 () Bool)

(assert (=> d!107277 m!778117))

(declare-fun m!778119 () Bool)

(assert (=> d!107277 m!778119))

(declare-fun m!778121 () Bool)

(assert (=> b!833367 m!778121))

(assert (=> b!832335 d!107277))

(declare-fun d!107279 () Bool)

(declare-fun res!566687 () Bool)

(declare-fun e!464841 () Bool)

(assert (=> d!107279 (=> res!566687 e!464841)))

(assert (=> d!107279 (= res!566687 (and ((_ is Cons!15945) (toList!4505 lt!377494)) (= (_1!5089 (h!17075 (toList!4505 lt!377494))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107279 (= (containsKey!402 (toList!4505 lt!377494) #b0000000000000000000000000000000000000000000000000000000000000000) e!464841)))

(declare-fun b!833368 () Bool)

(declare-fun e!464842 () Bool)

(assert (=> b!833368 (= e!464841 e!464842)))

(declare-fun res!566688 () Bool)

(assert (=> b!833368 (=> (not res!566688) (not e!464842))))

(assert (=> b!833368 (= res!566688 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377494))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377494))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15945) (toList!4505 lt!377494)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377494))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!833369 () Bool)

(assert (=> b!833369 (= e!464842 (containsKey!402 (t!22317 (toList!4505 lt!377494)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107279 (not res!566687)) b!833368))

(assert (= (and b!833368 res!566688) b!833369))

(declare-fun m!778123 () Bool)

(assert (=> b!833369 m!778123))

(assert (=> d!106539 d!107279))

(declare-fun d!107281 () Bool)

(assert (=> d!107281 (= (get!11824 (getValueByKey!416 (toList!4505 lt!377561) lt!377574)) (v!10101 (getValueByKey!416 (toList!4505 lt!377561) lt!377574)))))

(assert (=> d!106509 d!107281))

(declare-fun b!833372 () Bool)

(declare-fun e!464844 () Option!422)

(assert (=> b!833372 (= e!464844 (getValueByKey!416 (t!22317 (toList!4505 lt!377561)) lt!377574))))

(declare-fun b!833371 () Bool)

(declare-fun e!464843 () Option!422)

(assert (=> b!833371 (= e!464843 e!464844)))

(declare-fun c!90792 () Bool)

(assert (=> b!833371 (= c!90792 (and ((_ is Cons!15945) (toList!4505 lt!377561)) (not (= (_1!5089 (h!17075 (toList!4505 lt!377561))) lt!377574))))))

(declare-fun b!833373 () Bool)

(assert (=> b!833373 (= e!464844 None!420)))

(declare-fun b!833370 () Bool)

(assert (=> b!833370 (= e!464843 (Some!421 (_2!5089 (h!17075 (toList!4505 lt!377561)))))))

(declare-fun d!107283 () Bool)

(declare-fun c!90791 () Bool)

(assert (=> d!107283 (= c!90791 (and ((_ is Cons!15945) (toList!4505 lt!377561)) (= (_1!5089 (h!17075 (toList!4505 lt!377561))) lt!377574)))))

(assert (=> d!107283 (= (getValueByKey!416 (toList!4505 lt!377561) lt!377574) e!464843)))

(assert (= (and d!107283 c!90791) b!833370))

(assert (= (and d!107283 (not c!90791)) b!833371))

(assert (= (and b!833371 c!90792) b!833372))

(assert (= (and b!833371 (not c!90792)) b!833373))

(declare-fun m!778125 () Bool)

(assert (=> b!833372 m!778125))

(assert (=> d!106509 d!107283))

(declare-fun d!107285 () Bool)

(declare-fun res!566689 () Bool)

(declare-fun e!464845 () Bool)

(assert (=> d!107285 (=> res!566689 e!464845)))

(assert (=> d!107285 (= res!566689 (or ((_ is Nil!15946) lt!377785) ((_ is Nil!15946) (t!22317 lt!377785))))))

(assert (=> d!107285 (= (isStrictlySorted!442 lt!377785) e!464845)))

(declare-fun b!833374 () Bool)

(declare-fun e!464846 () Bool)

(assert (=> b!833374 (= e!464845 e!464846)))

(declare-fun res!566690 () Bool)

(assert (=> b!833374 (=> (not res!566690) (not e!464846))))

(assert (=> b!833374 (= res!566690 (bvslt (_1!5089 (h!17075 lt!377785)) (_1!5089 (h!17075 (t!22317 lt!377785)))))))

(declare-fun b!833375 () Bool)

(assert (=> b!833375 (= e!464846 (isStrictlySorted!442 (t!22317 lt!377785)))))

(assert (= (and d!107285 (not res!566689)) b!833374))

(assert (= (and b!833374 res!566690) b!833375))

(declare-fun m!778127 () Bool)

(assert (=> b!833375 m!778127))

(assert (=> d!106487 d!107285))

(declare-fun d!107287 () Bool)

(declare-fun res!566691 () Bool)

(declare-fun e!464847 () Bool)

(assert (=> d!107287 (=> res!566691 e!464847)))

(assert (=> d!107287 (= res!566691 (or ((_ is Nil!15946) (toList!4505 lt!377422)) ((_ is Nil!15946) (t!22317 (toList!4505 lt!377422)))))))

(assert (=> d!107287 (= (isStrictlySorted!442 (toList!4505 lt!377422)) e!464847)))

(declare-fun b!833376 () Bool)

(declare-fun e!464848 () Bool)

(assert (=> b!833376 (= e!464847 e!464848)))

(declare-fun res!566692 () Bool)

(assert (=> b!833376 (=> (not res!566692) (not e!464848))))

(assert (=> b!833376 (= res!566692 (bvslt (_1!5089 (h!17075 (toList!4505 lt!377422))) (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377422))))))))

(declare-fun b!833377 () Bool)

(assert (=> b!833377 (= e!464848 (isStrictlySorted!442 (t!22317 (toList!4505 lt!377422))))))

(assert (= (and d!107287 (not res!566691)) b!833376))

(assert (= (and b!833376 res!566692) b!833377))

(assert (=> b!833377 m!777031))

(assert (=> d!106487 d!107287))

(declare-fun d!107289 () Bool)

(assert (=> d!107289 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377509) (_1!5089 lt!377428)))))

(declare-fun lt!378130 () Unit!28493)

(assert (=> d!107289 (= lt!378130 (choose!1427 (toList!4505 lt!377509) (_1!5089 lt!377428)))))

(declare-fun e!464849 () Bool)

(assert (=> d!107289 e!464849))

(declare-fun res!566693 () Bool)

(assert (=> d!107289 (=> (not res!566693) (not e!464849))))

(assert (=> d!107289 (= res!566693 (isStrictlySorted!442 (toList!4505 lt!377509)))))

(assert (=> d!107289 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377509) (_1!5089 lt!377428)) lt!378130)))

(declare-fun b!833378 () Bool)

(assert (=> b!833378 (= e!464849 (containsKey!402 (toList!4505 lt!377509) (_1!5089 lt!377428)))))

(assert (= (and d!107289 res!566693) b!833378))

(assert (=> d!107289 m!775855))

(assert (=> d!107289 m!775855))

(assert (=> d!107289 m!776737))

(declare-fun m!778129 () Bool)

(assert (=> d!107289 m!778129))

(declare-fun m!778131 () Bool)

(assert (=> d!107289 m!778131))

(assert (=> b!833378 m!776733))

(assert (=> b!832391 d!107289))

(assert (=> b!832391 d!106729))

(assert (=> b!832391 d!106563))

(declare-fun b!833379 () Bool)

(declare-fun e!464851 () List!15949)

(declare-fun call!36496 () List!15949)

(assert (=> b!833379 (= e!464851 call!36496)))

(declare-fun b!833380 () Bool)

(declare-fun e!464850 () List!15949)

(assert (=> b!833380 (= e!464850 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 lt!377422))) (_1!5089 lt!377425) (_2!5089 lt!377425)))))

(declare-fun bm!36492 () Bool)

(declare-fun call!36495 () List!15949)

(assert (=> bm!36492 (= call!36496 call!36495)))

(declare-fun b!833381 () Bool)

(assert (=> b!833381 (= e!464851 call!36496)))

(declare-fun b!833382 () Bool)

(declare-fun c!90793 () Bool)

(declare-fun c!90795 () Bool)

(assert (=> b!833382 (= e!464850 (ite c!90795 (t!22317 (t!22317 (toList!4505 lt!377422))) (ite c!90793 (Cons!15945 (h!17075 (t!22317 (toList!4505 lt!377422))) (t!22317 (t!22317 (toList!4505 lt!377422)))) Nil!15946)))))

(declare-fun call!36497 () List!15949)

(declare-fun bm!36493 () Bool)

(declare-fun c!90796 () Bool)

(assert (=> bm!36493 (= call!36497 ($colon$colon!537 e!464850 (ite c!90796 (h!17075 (t!22317 (toList!4505 lt!377422))) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425)))))))

(declare-fun c!90794 () Bool)

(assert (=> bm!36493 (= c!90794 c!90796)))

(declare-fun b!833383 () Bool)

(declare-fun res!566695 () Bool)

(declare-fun e!464853 () Bool)

(assert (=> b!833383 (=> (not res!566695) (not e!464853))))

(declare-fun lt!378131 () List!15949)

(assert (=> b!833383 (= res!566695 (containsKey!402 lt!378131 (_1!5089 lt!377425)))))

(declare-fun b!833384 () Bool)

(declare-fun e!464854 () List!15949)

(assert (=> b!833384 (= e!464854 call!36497)))

(declare-fun b!833385 () Bool)

(assert (=> b!833385 (= c!90793 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377422))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377422)))) (_1!5089 lt!377425))))))

(declare-fun e!464852 () List!15949)

(assert (=> b!833385 (= e!464852 e!464851)))

(declare-fun d!107291 () Bool)

(assert (=> d!107291 e!464853))

(declare-fun res!566694 () Bool)

(assert (=> d!107291 (=> (not res!566694) (not e!464853))))

(assert (=> d!107291 (= res!566694 (isStrictlySorted!442 lt!378131))))

(assert (=> d!107291 (= lt!378131 e!464854)))

(assert (=> d!107291 (= c!90796 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377422))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377422)))) (_1!5089 lt!377425))))))

(assert (=> d!107291 (isStrictlySorted!442 (t!22317 (toList!4505 lt!377422)))))

(assert (=> d!107291 (= (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377422)) (_1!5089 lt!377425) (_2!5089 lt!377425)) lt!378131)))

(declare-fun b!833386 () Bool)

(assert (=> b!833386 (= e!464852 call!36495)))

(declare-fun bm!36494 () Bool)

(assert (=> bm!36494 (= call!36495 call!36497)))

(declare-fun b!833387 () Bool)

(assert (=> b!833387 (= e!464853 (contains!4212 lt!378131 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!833388 () Bool)

(assert (=> b!833388 (= e!464854 e!464852)))

(assert (=> b!833388 (= c!90795 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377422))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377422)))) (_1!5089 lt!377425))))))

(assert (= (and d!107291 c!90796) b!833384))

(assert (= (and d!107291 (not c!90796)) b!833388))

(assert (= (and b!833388 c!90795) b!833386))

(assert (= (and b!833388 (not c!90795)) b!833385))

(assert (= (and b!833385 c!90793) b!833379))

(assert (= (and b!833385 (not c!90793)) b!833381))

(assert (= (or b!833379 b!833381) bm!36492))

(assert (= (or b!833386 bm!36492) bm!36494))

(assert (= (or b!833384 bm!36494) bm!36493))

(assert (= (and bm!36493 c!90794) b!833380))

(assert (= (and bm!36493 (not c!90794)) b!833382))

(assert (= (and d!107291 res!566694) b!833383))

(assert (= (and b!833383 res!566695) b!833387))

(declare-fun m!778133 () Bool)

(assert (=> d!107291 m!778133))

(assert (=> d!107291 m!777031))

(declare-fun m!778135 () Bool)

(assert (=> b!833383 m!778135))

(declare-fun m!778137 () Bool)

(assert (=> b!833387 m!778137))

(declare-fun m!778139 () Bool)

(assert (=> bm!36493 m!778139))

(declare-fun m!778141 () Bool)

(assert (=> b!833380 m!778141))

(assert (=> b!832317 d!107291))

(declare-fun d!107293 () Bool)

(declare-fun res!566696 () Bool)

(declare-fun e!464855 () Bool)

(assert (=> d!107293 (=> res!566696 e!464855)))

(assert (=> d!107293 (= res!566696 (and ((_ is Cons!15945) lt!377604) (= (_1!5089 (h!17075 lt!377604)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107293 (= (containsKey!402 lt!377604 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464855)))

(declare-fun b!833389 () Bool)

(declare-fun e!464856 () Bool)

(assert (=> b!833389 (= e!464855 e!464856)))

(declare-fun res!566697 () Bool)

(assert (=> b!833389 (=> (not res!566697) (not e!464856))))

(assert (=> b!833389 (= res!566697 (and (or (not ((_ is Cons!15945) lt!377604)) (bvsle (_1!5089 (h!17075 lt!377604)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377604) (bvslt (_1!5089 (h!17075 lt!377604)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833390 () Bool)

(assert (=> b!833390 (= e!464856 (containsKey!402 (t!22317 lt!377604) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107293 (not res!566696)) b!833389))

(assert (= (and b!833389 res!566697) b!833390))

(declare-fun m!778143 () Bool)

(assert (=> b!833390 m!778143))

(assert (=> b!832220 d!107293))

(declare-fun d!107295 () Bool)

(declare-fun res!566698 () Bool)

(declare-fun e!464857 () Bool)

(assert (=> d!107295 (=> res!566698 e!464857)))

(assert (=> d!107295 (= res!566698 (or ((_ is Nil!15946) lt!377688) ((_ is Nil!15946) (t!22317 lt!377688))))))

(assert (=> d!107295 (= (isStrictlySorted!442 lt!377688) e!464857)))

(declare-fun b!833391 () Bool)

(declare-fun e!464858 () Bool)

(assert (=> b!833391 (= e!464857 e!464858)))

(declare-fun res!566699 () Bool)

(assert (=> b!833391 (=> (not res!566699) (not e!464858))))

(assert (=> b!833391 (= res!566699 (bvslt (_1!5089 (h!17075 lt!377688)) (_1!5089 (h!17075 (t!22317 lt!377688)))))))

(declare-fun b!833392 () Bool)

(assert (=> b!833392 (= e!464858 (isStrictlySorted!442 (t!22317 lt!377688)))))

(assert (= (and d!107295 (not res!566698)) b!833391))

(assert (= (and b!833391 res!566699) b!833392))

(declare-fun m!778145 () Bool)

(assert (=> b!833392 m!778145))

(assert (=> d!106385 d!107295))

(assert (=> d!106385 d!107287))

(assert (=> d!106397 d!106395))

(declare-fun d!107297 () Bool)

(assert (=> d!107297 (= (getValueByKey!416 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!107297 true))

(declare-fun _$22!583 () Unit!28493)

(assert (=> d!107297 (= (choose!1423 lt!377616 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!583)))

(declare-fun bs!23331 () Bool)

(assert (= bs!23331 d!107297))

(assert (=> bs!23331 m!776001))

(assert (=> d!106397 d!107297))

(declare-fun d!107299 () Bool)

(declare-fun res!566700 () Bool)

(declare-fun e!464859 () Bool)

(assert (=> d!107299 (=> res!566700 e!464859)))

(assert (=> d!107299 (= res!566700 (or ((_ is Nil!15946) lt!377616) ((_ is Nil!15946) (t!22317 lt!377616))))))

(assert (=> d!107299 (= (isStrictlySorted!442 lt!377616) e!464859)))

(declare-fun b!833393 () Bool)

(declare-fun e!464860 () Bool)

(assert (=> b!833393 (= e!464859 e!464860)))

(declare-fun res!566701 () Bool)

(assert (=> b!833393 (=> (not res!566701) (not e!464860))))

(assert (=> b!833393 (= res!566701 (bvslt (_1!5089 (h!17075 lt!377616)) (_1!5089 (h!17075 (t!22317 lt!377616)))))))

(declare-fun b!833394 () Bool)

(assert (=> b!833394 (= e!464860 (isStrictlySorted!442 (t!22317 lt!377616)))))

(assert (= (and d!107299 (not res!566700)) b!833393))

(assert (= (and b!833393 res!566701) b!833394))

(declare-fun m!778147 () Bool)

(assert (=> b!833394 m!778147))

(assert (=> d!106397 d!107299))

(declare-fun d!107301 () Bool)

(declare-fun lt!378132 () Bool)

(assert (=> d!107301 (= lt!378132 (select (content!388 lt!377815) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun e!464862 () Bool)

(assert (=> d!107301 (= lt!378132 e!464862)))

(declare-fun res!566703 () Bool)

(assert (=> d!107301 (=> (not res!566703) (not e!464862))))

(assert (=> d!107301 (= res!566703 ((_ is Cons!15945) lt!377815))))

(assert (=> d!107301 (= (contains!4212 lt!377815 (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))) lt!378132)))

(declare-fun b!833395 () Bool)

(declare-fun e!464861 () Bool)

(assert (=> b!833395 (= e!464862 e!464861)))

(declare-fun res!566702 () Bool)

(assert (=> b!833395 (=> res!566702 e!464861)))

(assert (=> b!833395 (= res!566702 (= (h!17075 lt!377815) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(declare-fun b!833396 () Bool)

(assert (=> b!833396 (= e!464861 (contains!4212 (t!22317 lt!377815) (tuple2!10157 (_1!5089 lt!377425) (_2!5089 lt!377425))))))

(assert (= (and d!107301 res!566703) b!833395))

(assert (= (and b!833395 (not res!566702)) b!833396))

(declare-fun m!778149 () Bool)

(assert (=> d!107301 m!778149))

(declare-fun m!778151 () Bool)

(assert (=> d!107301 m!778151))

(declare-fun m!778153 () Bool)

(assert (=> b!833396 m!778153))

(assert (=> b!832361 d!107301))

(declare-fun d!107303 () Bool)

(declare-fun lt!378133 () Bool)

(assert (=> d!107303 (= lt!378133 (select (content!388 (toList!4505 lt!377729)) (tuple2!10157 lt!377590 zeroValueAfter!34)))))

(declare-fun e!464864 () Bool)

(assert (=> d!107303 (= lt!378133 e!464864)))

(declare-fun res!566705 () Bool)

(assert (=> d!107303 (=> (not res!566705) (not e!464864))))

(assert (=> d!107303 (= res!566705 ((_ is Cons!15945) (toList!4505 lt!377729)))))

(assert (=> d!107303 (= (contains!4212 (toList!4505 lt!377729) (tuple2!10157 lt!377590 zeroValueAfter!34)) lt!378133)))

(declare-fun b!833397 () Bool)

(declare-fun e!464863 () Bool)

(assert (=> b!833397 (= e!464864 e!464863)))

(declare-fun res!566704 () Bool)

(assert (=> b!833397 (=> res!566704 e!464863)))

(assert (=> b!833397 (= res!566704 (= (h!17075 (toList!4505 lt!377729)) (tuple2!10157 lt!377590 zeroValueAfter!34)))))

(declare-fun b!833398 () Bool)

(assert (=> b!833398 (= e!464863 (contains!4212 (t!22317 (toList!4505 lt!377729)) (tuple2!10157 lt!377590 zeroValueAfter!34)))))

(assert (= (and d!107303 res!566705) b!833397))

(assert (= (and b!833397 (not res!566704)) b!833398))

(declare-fun m!778155 () Bool)

(assert (=> d!107303 m!778155))

(declare-fun m!778157 () Bool)

(assert (=> d!107303 m!778157))

(declare-fun m!778159 () Bool)

(assert (=> b!833398 m!778159))

(assert (=> b!832204 d!107303))

(declare-fun d!107305 () Bool)

(declare-fun res!566706 () Bool)

(declare-fun e!464865 () Bool)

(assert (=> d!107305 (=> res!566706 e!464865)))

(assert (=> d!107305 (= res!566706 (and ((_ is Cons!15945) (toList!4505 lt!377465)) (= (_1!5089 (h!17075 (toList!4505 lt!377465))) (_1!5089 lt!377428))))))

(assert (=> d!107305 (= (containsKey!402 (toList!4505 lt!377465) (_1!5089 lt!377428)) e!464865)))

(declare-fun b!833399 () Bool)

(declare-fun e!464866 () Bool)

(assert (=> b!833399 (= e!464865 e!464866)))

(declare-fun res!566707 () Bool)

(assert (=> b!833399 (=> (not res!566707) (not e!464866))))

(assert (=> b!833399 (= res!566707 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377465))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377465))) (_1!5089 lt!377428))) ((_ is Cons!15945) (toList!4505 lt!377465)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377465))) (_1!5089 lt!377428))))))

(declare-fun b!833400 () Bool)

(assert (=> b!833400 (= e!464866 (containsKey!402 (t!22317 (toList!4505 lt!377465)) (_1!5089 lt!377428)))))

(assert (= (and d!107305 (not res!566706)) b!833399))

(assert (= (and b!833399 res!566707) b!833400))

(declare-fun m!778161 () Bool)

(assert (=> b!833400 m!778161))

(assert (=> d!106379 d!107305))

(declare-fun d!107307 () Bool)

(declare-fun e!464867 () Bool)

(assert (=> d!107307 e!464867))

(declare-fun res!566708 () Bool)

(assert (=> d!107307 (=> res!566708 e!464867)))

(declare-fun lt!378137 () Bool)

(assert (=> d!107307 (= res!566708 (not lt!378137))))

(declare-fun lt!378136 () Bool)

(assert (=> d!107307 (= lt!378137 lt!378136)))

(declare-fun lt!378135 () Unit!28493)

(declare-fun e!464868 () Unit!28493)

(assert (=> d!107307 (= lt!378135 e!464868)))

(declare-fun c!90797 () Bool)

(assert (=> d!107307 (= c!90797 lt!378136)))

(assert (=> d!107307 (= lt!378136 (containsKey!402 (toList!4505 lt!377750) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!107307 (= (contains!4211 lt!377750 (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!378137)))

(declare-fun b!833401 () Bool)

(declare-fun lt!378134 () Unit!28493)

(assert (=> b!833401 (= e!464868 lt!378134)))

(assert (=> b!833401 (= lt!378134 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377750) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!833401 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377750) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!833402 () Bool)

(declare-fun Unit!28552 () Unit!28493)

(assert (=> b!833402 (= e!464868 Unit!28552)))

(declare-fun b!833403 () Bool)

(assert (=> b!833403 (= e!464867 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377750) (select (arr!22334 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!107307 c!90797) b!833401))

(assert (= (and d!107307 (not c!90797)) b!833402))

(assert (= (and d!107307 (not res!566708)) b!833403))

(assert (=> d!107307 m!776103))

(declare-fun m!778163 () Bool)

(assert (=> d!107307 m!778163))

(assert (=> b!833401 m!776103))

(declare-fun m!778165 () Bool)

(assert (=> b!833401 m!778165))

(assert (=> b!833401 m!776103))

(assert (=> b!833401 m!777393))

(assert (=> b!833401 m!777393))

(declare-fun m!778167 () Bool)

(assert (=> b!833401 m!778167))

(assert (=> b!833403 m!776103))

(assert (=> b!833403 m!777393))

(assert (=> b!833403 m!777393))

(assert (=> b!833403 m!778167))

(assert (=> b!832245 d!107307))

(assert (=> b!832090 d!107135))

(assert (=> b!832090 d!107137))

(declare-fun d!107309 () Bool)

(declare-fun lt!378138 () Bool)

(assert (=> d!107309 (= lt!378138 (select (content!388 (t!22317 (toList!4505 lt!377461))) lt!377425))))

(declare-fun e!464870 () Bool)

(assert (=> d!107309 (= lt!378138 e!464870)))

(declare-fun res!566710 () Bool)

(assert (=> d!107309 (=> (not res!566710) (not e!464870))))

(assert (=> d!107309 (= res!566710 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377461))))))

(assert (=> d!107309 (= (contains!4212 (t!22317 (toList!4505 lt!377461)) lt!377425) lt!378138)))

(declare-fun b!833404 () Bool)

(declare-fun e!464869 () Bool)

(assert (=> b!833404 (= e!464870 e!464869)))

(declare-fun res!566709 () Bool)

(assert (=> b!833404 (=> res!566709 e!464869)))

(assert (=> b!833404 (= res!566709 (= (h!17075 (t!22317 (toList!4505 lt!377461))) lt!377425))))

(declare-fun b!833405 () Bool)

(assert (=> b!833405 (= e!464869 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377461))) lt!377425))))

(assert (= (and d!107309 res!566710) b!833404))

(assert (= (and b!833404 (not res!566709)) b!833405))

(assert (=> d!107309 m!777971))

(declare-fun m!778169 () Bool)

(assert (=> d!107309 m!778169))

(declare-fun m!778171 () Bool)

(assert (=> b!833405 m!778171))

(assert (=> b!832411 d!107309))

(declare-fun d!107311 () Bool)

(assert (=> d!107311 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!378139 () Unit!28493)

(assert (=> d!107311 (= lt!378139 (choose!1427 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464871 () Bool)

(assert (=> d!107311 e!464871))

(declare-fun res!566711 () Bool)

(assert (=> d!107311 (=> (not res!566711) (not e!464871))))

(assert (=> d!107311 (= res!566711 (isStrictlySorted!442 (toList!4505 lt!377494)))))

(assert (=> d!107311 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000) lt!378139)))

(declare-fun b!833406 () Bool)

(assert (=> b!833406 (= e!464871 (containsKey!402 (toList!4505 lt!377494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107311 res!566711) b!833406))

(assert (=> d!107311 m!776681))

(assert (=> d!107311 m!776681))

(assert (=> d!107311 m!776683))

(declare-fun m!778173 () Bool)

(assert (=> d!107311 m!778173))

(assert (=> d!107311 m!777551))

(assert (=> b!833406 m!776677))

(assert (=> b!832374 d!107311))

(assert (=> b!832374 d!106769))

(assert (=> b!832374 d!106771))

(declare-fun d!107313 () Bool)

(declare-fun c!90798 () Bool)

(assert (=> d!107313 (= c!90798 ((_ is Nil!15946) (toList!4505 lt!377465)))))

(declare-fun e!464872 () (InoxSet tuple2!10156))

(assert (=> d!107313 (= (content!388 (toList!4505 lt!377465)) e!464872)))

(declare-fun b!833407 () Bool)

(assert (=> b!833407 (= e!464872 ((as const (Array tuple2!10156 Bool)) false))))

(declare-fun b!833408 () Bool)

(assert (=> b!833408 (= e!464872 ((_ map or) (store ((as const (Array tuple2!10156 Bool)) false) (h!17075 (toList!4505 lt!377465)) true) (content!388 (t!22317 (toList!4505 lt!377465)))))))

(assert (= (and d!107313 c!90798) b!833407))

(assert (= (and d!107313 (not c!90798)) b!833408))

(declare-fun m!778175 () Bool)

(assert (=> b!833408 m!778175))

(assert (=> b!833408 m!777717))

(assert (=> d!106567 d!107313))

(assert (=> b!832103 d!106647))

(declare-fun b!833409 () Bool)

(declare-fun e!464874 () List!15949)

(declare-fun call!36499 () List!15949)

(assert (=> b!833409 (= e!464874 call!36499)))

(declare-fun b!833410 () Bool)

(declare-fun e!464873 () List!15949)

(assert (=> b!833410 (= e!464873 (insertStrictlySorted!269 (t!22317 (t!22317 (toList!4505 lt!377423))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun bm!36495 () Bool)

(declare-fun call!36498 () List!15949)

(assert (=> bm!36495 (= call!36499 call!36498)))

(declare-fun b!833411 () Bool)

(assert (=> b!833411 (= e!464874 call!36499)))

(declare-fun c!90799 () Bool)

(declare-fun b!833412 () Bool)

(declare-fun c!90801 () Bool)

(assert (=> b!833412 (= e!464873 (ite c!90801 (t!22317 (t!22317 (toList!4505 lt!377423))) (ite c!90799 (Cons!15945 (h!17075 (t!22317 (toList!4505 lt!377423))) (t!22317 (t!22317 (toList!4505 lt!377423)))) Nil!15946)))))

(declare-fun call!36500 () List!15949)

(declare-fun c!90802 () Bool)

(declare-fun bm!36496 () Bool)

(assert (=> bm!36496 (= call!36500 ($colon$colon!537 e!464873 (ite c!90802 (h!17075 (t!22317 (toList!4505 lt!377423))) (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90800 () Bool)

(assert (=> bm!36496 (= c!90800 c!90802)))

(declare-fun b!833413 () Bool)

(declare-fun res!566713 () Bool)

(declare-fun e!464876 () Bool)

(assert (=> b!833413 (=> (not res!566713) (not e!464876))))

(declare-fun lt!378140 () List!15949)

(assert (=> b!833413 (= res!566713 (containsKey!402 lt!378140 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!833414 () Bool)

(declare-fun e!464877 () List!15949)

(assert (=> b!833414 (= e!464877 call!36500)))

(declare-fun b!833415 () Bool)

(assert (=> b!833415 (= c!90799 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377423))) (bvsgt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377423)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464875 () List!15949)

(assert (=> b!833415 (= e!464875 e!464874)))

(declare-fun d!107315 () Bool)

(assert (=> d!107315 e!464876))

(declare-fun res!566712 () Bool)

(assert (=> d!107315 (=> (not res!566712) (not e!464876))))

(assert (=> d!107315 (= res!566712 (isStrictlySorted!442 lt!378140))))

(assert (=> d!107315 (= lt!378140 e!464877)))

(assert (=> d!107315 (= c!90802 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377423))) (bvslt (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377423)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107315 (isStrictlySorted!442 (t!22317 (toList!4505 lt!377423)))))

(assert (=> d!107315 (= (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377423)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!378140)))

(declare-fun b!833416 () Bool)

(assert (=> b!833416 (= e!464875 call!36498)))

(declare-fun bm!36497 () Bool)

(assert (=> bm!36497 (= call!36498 call!36500)))

(declare-fun b!833417 () Bool)

(assert (=> b!833417 (= e!464876 (contains!4212 lt!378140 (tuple2!10157 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833418 () Bool)

(assert (=> b!833418 (= e!464877 e!464875)))

(assert (=> b!833418 (= c!90801 (and ((_ is Cons!15945) (t!22317 (toList!4505 lt!377423))) (= (_1!5089 (h!17075 (t!22317 (toList!4505 lt!377423)))) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!107315 c!90802) b!833414))

(assert (= (and d!107315 (not c!90802)) b!833418))

(assert (= (and b!833418 c!90801) b!833416))

(assert (= (and b!833418 (not c!90801)) b!833415))

(assert (= (and b!833415 c!90799) b!833409))

(assert (= (and b!833415 (not c!90799)) b!833411))

(assert (= (or b!833409 b!833411) bm!36495))

(assert (= (or b!833416 bm!36495) bm!36497))

(assert (= (or b!833414 bm!36497) bm!36496))

(assert (= (and bm!36496 c!90800) b!833410))

(assert (= (and bm!36496 (not c!90800)) b!833412))

(assert (= (and d!107315 res!566712) b!833413))

(assert (= (and b!833413 res!566713) b!833417))

(declare-fun m!778177 () Bool)

(assert (=> d!107315 m!778177))

(assert (=> d!107315 m!777557))

(declare-fun m!778179 () Bool)

(assert (=> b!833413 m!778179))

(declare-fun m!778181 () Bool)

(assert (=> b!833417 m!778181))

(declare-fun m!778183 () Bool)

(assert (=> bm!36496 m!778183))

(declare-fun m!778185 () Bool)

(assert (=> b!833410 m!778185))

(assert (=> b!832176 d!107315))

(declare-fun d!107317 () Bool)

(declare-fun lt!378141 () Bool)

(assert (=> d!107317 (= lt!378141 (select (content!388 (toList!4505 lt!377838)) (tuple2!10157 lt!377484 lt!377483)))))

(declare-fun e!464879 () Bool)

(assert (=> d!107317 (= lt!378141 e!464879)))

(declare-fun res!566715 () Bool)

(assert (=> d!107317 (=> (not res!566715) (not e!464879))))

(assert (=> d!107317 (= res!566715 ((_ is Cons!15945) (toList!4505 lt!377838)))))

(assert (=> d!107317 (= (contains!4212 (toList!4505 lt!377838) (tuple2!10157 lt!377484 lt!377483)) lt!378141)))

(declare-fun b!833419 () Bool)

(declare-fun e!464878 () Bool)

(assert (=> b!833419 (= e!464879 e!464878)))

(declare-fun res!566714 () Bool)

(assert (=> b!833419 (=> res!566714 e!464878)))

(assert (=> b!833419 (= res!566714 (= (h!17075 (toList!4505 lt!377838)) (tuple2!10157 lt!377484 lt!377483)))))

(declare-fun b!833420 () Bool)

(assert (=> b!833420 (= e!464878 (contains!4212 (t!22317 (toList!4505 lt!377838)) (tuple2!10157 lt!377484 lt!377483)))))

(assert (= (and d!107317 res!566715) b!833419))

(assert (= (and b!833419 (not res!566714)) b!833420))

(declare-fun m!778187 () Bool)

(assert (=> d!107317 m!778187))

(declare-fun m!778189 () Bool)

(assert (=> d!107317 m!778189))

(declare-fun m!778191 () Bool)

(assert (=> b!833420 m!778191))

(assert (=> b!832388 d!107317))

(declare-fun d!107319 () Bool)

(declare-fun lt!378142 () Bool)

(assert (=> d!107319 (= lt!378142 (select (content!388 (t!22317 (toList!4505 lt!377613))) lt!377428))))

(declare-fun e!464881 () Bool)

(assert (=> d!107319 (= lt!378142 e!464881)))

(declare-fun res!566717 () Bool)

(assert (=> d!107319 (=> (not res!566717) (not e!464881))))

(assert (=> d!107319 (= res!566717 ((_ is Cons!15945) (t!22317 (toList!4505 lt!377613))))))

(assert (=> d!107319 (= (contains!4212 (t!22317 (toList!4505 lt!377613)) lt!377428) lt!378142)))

(declare-fun b!833421 () Bool)

(declare-fun e!464880 () Bool)

(assert (=> b!833421 (= e!464881 e!464880)))

(declare-fun res!566716 () Bool)

(assert (=> b!833421 (=> res!566716 e!464880)))

(assert (=> b!833421 (= res!566716 (= (h!17075 (t!22317 (toList!4505 lt!377613))) lt!377428))))

(declare-fun b!833422 () Bool)

(assert (=> b!833422 (= e!464880 (contains!4212 (t!22317 (t!22317 (toList!4505 lt!377613))) lt!377428))))

(assert (= (and d!107319 res!566717) b!833421))

(assert (= (and b!833421 (not res!566716)) b!833422))

(assert (=> d!107319 m!778061))

(declare-fun m!778193 () Bool)

(assert (=> d!107319 m!778193))

(declare-fun m!778195 () Bool)

(assert (=> b!833422 m!778195))

(assert (=> b!832080 d!107319))

(declare-fun d!107321 () Bool)

(declare-fun res!566718 () Bool)

(declare-fun e!464882 () Bool)

(assert (=> d!107321 (=> res!566718 e!464882)))

(assert (=> d!107321 (= res!566718 (and ((_ is Cons!15945) (toList!4505 lt!377509)) (= (_1!5089 (h!17075 (toList!4505 lt!377509))) (_1!5089 lt!377428))))))

(assert (=> d!107321 (= (containsKey!402 (toList!4505 lt!377509) (_1!5089 lt!377428)) e!464882)))

(declare-fun b!833423 () Bool)

(declare-fun e!464883 () Bool)

(assert (=> b!833423 (= e!464882 e!464883)))

(declare-fun res!566719 () Bool)

(assert (=> b!833423 (=> (not res!566719) (not e!464883))))

(assert (=> b!833423 (= res!566719 (and (or (not ((_ is Cons!15945) (toList!4505 lt!377509))) (bvsle (_1!5089 (h!17075 (toList!4505 lt!377509))) (_1!5089 lt!377428))) ((_ is Cons!15945) (toList!4505 lt!377509)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377509))) (_1!5089 lt!377428))))))

(declare-fun b!833424 () Bool)

(assert (=> b!833424 (= e!464883 (containsKey!402 (t!22317 (toList!4505 lt!377509)) (_1!5089 lt!377428)))))

(assert (= (and d!107321 (not res!566718)) b!833423))

(assert (= (and b!833423 res!566719) b!833424))

(declare-fun m!778197 () Bool)

(assert (=> b!833424 m!778197))

(assert (=> d!106551 d!107321))

(declare-fun d!107323 () Bool)

(declare-fun e!464884 () Bool)

(assert (=> d!107323 e!464884))

(declare-fun res!566720 () Bool)

(assert (=> d!107323 (=> res!566720 e!464884)))

(declare-fun lt!378146 () Bool)

(assert (=> d!107323 (= res!566720 (not lt!378146))))

(declare-fun lt!378145 () Bool)

(assert (=> d!107323 (= lt!378146 lt!378145)))

(declare-fun lt!378144 () Unit!28493)

(declare-fun e!464885 () Unit!28493)

(assert (=> d!107323 (= lt!378144 e!464885)))

(declare-fun c!90803 () Bool)

(assert (=> d!107323 (= c!90803 lt!378145)))

(assert (=> d!107323 (= lt!378145 (containsKey!402 (toList!4505 lt!377729) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(assert (=> d!107323 (= (contains!4211 lt!377729 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!378146)))

(declare-fun b!833425 () Bool)

(declare-fun lt!378143 () Unit!28493)

(assert (=> b!833425 (= e!464885 lt!378143)))

(assert (=> b!833425 (= lt!378143 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377729) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(assert (=> b!833425 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377729) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun b!833426 () Bool)

(declare-fun Unit!28553 () Unit!28493)

(assert (=> b!833426 (= e!464885 Unit!28553)))

(declare-fun b!833427 () Bool)

(assert (=> b!833427 (= e!464884 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377729) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(assert (= (and d!107323 c!90803) b!833425))

(assert (= (and d!107323 (not c!90803)) b!833426))

(assert (= (and d!107323 (not res!566720)) b!833427))

(declare-fun m!778199 () Bool)

(assert (=> d!107323 m!778199))

(declare-fun m!778201 () Bool)

(assert (=> b!833425 m!778201))

(assert (=> b!833425 m!776325))

(assert (=> b!833425 m!776325))

(declare-fun m!778203 () Bool)

(assert (=> b!833425 m!778203))

(assert (=> b!833427 m!776325))

(assert (=> b!833427 m!776325))

(assert (=> b!833427 m!778203))

(assert (=> d!106421 d!107323))

(declare-fun e!464887 () Option!422)

(declare-fun b!833430 () Bool)

(assert (=> b!833430 (= e!464887 (getValueByKey!416 (t!22317 lt!377728) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun b!833429 () Bool)

(declare-fun e!464886 () Option!422)

(assert (=> b!833429 (= e!464886 e!464887)))

(declare-fun c!90805 () Bool)

(assert (=> b!833429 (= c!90805 (and ((_ is Cons!15945) lt!377728) (not (= (_1!5089 (h!17075 lt!377728)) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))))

(declare-fun b!833431 () Bool)

(assert (=> b!833431 (= e!464887 None!420)))

(declare-fun b!833428 () Bool)

(assert (=> b!833428 (= e!464886 (Some!421 (_2!5089 (h!17075 lt!377728))))))

(declare-fun c!90804 () Bool)

(declare-fun d!107325 () Bool)

(assert (=> d!107325 (= c!90804 (and ((_ is Cons!15945) lt!377728) (= (_1!5089 (h!17075 lt!377728)) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(assert (=> d!107325 (= (getValueByKey!416 lt!377728 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) e!464886)))

(assert (= (and d!107325 c!90804) b!833428))

(assert (= (and d!107325 (not c!90804)) b!833429))

(assert (= (and b!833429 c!90805) b!833430))

(assert (= (and b!833429 (not c!90805)) b!833431))

(declare-fun m!778205 () Bool)

(assert (=> b!833430 m!778205))

(assert (=> d!106421 d!107325))

(declare-fun d!107327 () Bool)

(assert (=> d!107327 (= (getValueByKey!416 lt!377728 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun lt!378147 () Unit!28493)

(assert (=> d!107327 (= lt!378147 (choose!1423 lt!377728 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun e!464888 () Bool)

(assert (=> d!107327 e!464888))

(declare-fun res!566721 () Bool)

(assert (=> d!107327 (=> (not res!566721) (not e!464888))))

(assert (=> d!107327 (= res!566721 (isStrictlySorted!442 lt!377728))))

(assert (=> d!107327 (= (lemmaContainsTupThenGetReturnValue!230 lt!377728 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!378147)))

(declare-fun b!833432 () Bool)

(declare-fun res!566722 () Bool)

(assert (=> b!833432 (=> (not res!566722) (not e!464888))))

(assert (=> b!833432 (= res!566722 (containsKey!402 lt!377728 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun b!833433 () Bool)

(assert (=> b!833433 (= e!464888 (contains!4212 lt!377728 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(assert (= (and d!107327 res!566721) b!833432))

(assert (= (and b!833432 res!566722) b!833433))

(assert (=> d!107327 m!776319))

(declare-fun m!778207 () Bool)

(assert (=> d!107327 m!778207))

(declare-fun m!778209 () Bool)

(assert (=> d!107327 m!778209))

(declare-fun m!778211 () Bool)

(assert (=> b!833432 m!778211))

(declare-fun m!778213 () Bool)

(assert (=> b!833433 m!778213))

(assert (=> d!106421 d!107327))

(declare-fun b!833434 () Bool)

(declare-fun e!464890 () List!15949)

(declare-fun call!36502 () List!15949)

(assert (=> b!833434 (= e!464890 call!36502)))

(declare-fun e!464889 () List!15949)

(declare-fun b!833435 () Bool)

(assert (=> b!833435 (= e!464889 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377583)) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun bm!36498 () Bool)

(declare-fun call!36501 () List!15949)

(assert (=> bm!36498 (= call!36502 call!36501)))

(declare-fun b!833436 () Bool)

(assert (=> b!833436 (= e!464890 call!36502)))

(declare-fun b!833437 () Bool)

(declare-fun c!90806 () Bool)

(declare-fun c!90808 () Bool)

(assert (=> b!833437 (= e!464889 (ite c!90808 (t!22317 (toList!4505 lt!377583)) (ite c!90806 (Cons!15945 (h!17075 (toList!4505 lt!377583)) (t!22317 (toList!4505 lt!377583))) Nil!15946)))))

(declare-fun call!36503 () List!15949)

(declare-fun c!90809 () Bool)

(declare-fun bm!36499 () Bool)

(assert (=> bm!36499 (= call!36503 ($colon$colon!537 e!464889 (ite c!90809 (h!17075 (toList!4505 lt!377583)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))))

(declare-fun c!90807 () Bool)

(assert (=> bm!36499 (= c!90807 c!90809)))

(declare-fun b!833438 () Bool)

(declare-fun res!566724 () Bool)

(declare-fun e!464892 () Bool)

(assert (=> b!833438 (=> (not res!566724) (not e!464892))))

(declare-fun lt!378148 () List!15949)

(assert (=> b!833438 (= res!566724 (containsKey!402 lt!378148 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))))))

(declare-fun b!833439 () Bool)

(declare-fun e!464893 () List!15949)

(assert (=> b!833439 (= e!464893 call!36503)))

(declare-fun b!833440 () Bool)

(assert (=> b!833440 (= c!90806 (and ((_ is Cons!15945) (toList!4505 lt!377583)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377583))) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(declare-fun e!464891 () List!15949)

(assert (=> b!833440 (= e!464891 e!464890)))

(declare-fun d!107329 () Bool)

(assert (=> d!107329 e!464892))

(declare-fun res!566723 () Bool)

(assert (=> d!107329 (=> (not res!566723) (not e!464892))))

(assert (=> d!107329 (= res!566723 (isStrictlySorted!442 lt!378148))))

(assert (=> d!107329 (= lt!378148 e!464893)))

(assert (=> d!107329 (= c!90809 (and ((_ is Cons!15945) (toList!4505 lt!377583)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377583))) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(assert (=> d!107329 (isStrictlySorted!442 (toList!4505 lt!377583))))

(assert (=> d!107329 (= (insertStrictlySorted!269 (toList!4505 lt!377583) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34))) lt!378148)))

(declare-fun b!833441 () Bool)

(assert (=> b!833441 (= e!464891 call!36501)))

(declare-fun bm!36500 () Bool)

(assert (=> bm!36500 (= call!36501 call!36503)))

(declare-fun b!833442 () Bool)

(assert (=> b!833442 (= e!464892 (contains!4212 lt!378148 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)) (_2!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(declare-fun b!833443 () Bool)

(assert (=> b!833443 (= e!464893 e!464891)))

(assert (=> b!833443 (= c!90808 (and ((_ is Cons!15945) (toList!4505 lt!377583)) (= (_1!5089 (h!17075 (toList!4505 lt!377583))) (_1!5089 (tuple2!10157 lt!377590 zeroValueAfter!34)))))))

(assert (= (and d!107329 c!90809) b!833439))

(assert (= (and d!107329 (not c!90809)) b!833443))

(assert (= (and b!833443 c!90808) b!833441))

(assert (= (and b!833443 (not c!90808)) b!833440))

(assert (= (and b!833440 c!90806) b!833434))

(assert (= (and b!833440 (not c!90806)) b!833436))

(assert (= (or b!833434 b!833436) bm!36498))

(assert (= (or b!833441 bm!36498) bm!36500))

(assert (= (or b!833439 bm!36500) bm!36499))

(assert (= (and bm!36499 c!90807) b!833435))

(assert (= (and bm!36499 (not c!90807)) b!833437))

(assert (= (and d!107329 res!566723) b!833438))

(assert (= (and b!833438 res!566724) b!833442))

(declare-fun m!778215 () Bool)

(assert (=> d!107329 m!778215))

(declare-fun m!778217 () Bool)

(assert (=> d!107329 m!778217))

(declare-fun m!778219 () Bool)

(assert (=> b!833438 m!778219))

(declare-fun m!778221 () Bool)

(assert (=> b!833442 m!778221))

(declare-fun m!778223 () Bool)

(assert (=> bm!36499 m!778223))

(declare-fun m!778225 () Bool)

(assert (=> b!833435 m!778225))

(assert (=> d!106421 d!107329))

(assert (=> bm!36412 d!107267))

(declare-fun d!107331 () Bool)

(declare-fun e!464894 () Bool)

(assert (=> d!107331 e!464894))

(declare-fun res!566725 () Bool)

(assert (=> d!107331 (=> res!566725 e!464894)))

(declare-fun lt!378152 () Bool)

(assert (=> d!107331 (= res!566725 (not lt!378152))))

(declare-fun lt!378151 () Bool)

(assert (=> d!107331 (= lt!378152 lt!378151)))

(declare-fun lt!378150 () Unit!28493)

(declare-fun e!464895 () Unit!28493)

(assert (=> d!107331 (= lt!378150 e!464895)))

(declare-fun c!90810 () Bool)

(assert (=> d!107331 (= c!90810 lt!378151)))

(assert (=> d!107331 (= lt!378151 (containsKey!402 (toList!4505 lt!377672) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!107331 (= (contains!4211 lt!377672 #b0000000000000000000000000000000000000000000000000000000000000000) lt!378152)))

(declare-fun b!833444 () Bool)

(declare-fun lt!378149 () Unit!28493)

(assert (=> b!833444 (= e!464895 lt!378149)))

(assert (=> b!833444 (= lt!378149 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377672) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!833444 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377672) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!833445 () Bool)

(declare-fun Unit!28554 () Unit!28493)

(assert (=> b!833445 (= e!464895 Unit!28554)))

(declare-fun b!833446 () Bool)

(assert (=> b!833446 (= e!464894 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377672) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!107331 c!90810) b!833444))

(assert (= (and d!107331 (not c!90810)) b!833445))

(assert (= (and d!107331 (not res!566725)) b!833446))

(declare-fun m!778227 () Bool)

(assert (=> d!107331 m!778227))

(declare-fun m!778229 () Bool)

(assert (=> b!833444 m!778229))

(declare-fun m!778231 () Bool)

(assert (=> b!833444 m!778231))

(assert (=> b!833444 m!778231))

(declare-fun m!778233 () Bool)

(assert (=> b!833444 m!778233))

(assert (=> b!833446 m!778231))

(assert (=> b!833446 m!778231))

(assert (=> b!833446 m!778233))

(assert (=> d!106375 d!107331))

(assert (=> d!106375 d!106321))

(declare-fun d!107333 () Bool)

(declare-fun e!464896 () Bool)

(assert (=> d!107333 e!464896))

(declare-fun res!566726 () Bool)

(assert (=> d!107333 (=> res!566726 e!464896)))

(declare-fun lt!378156 () Bool)

(assert (=> d!107333 (= res!566726 (not lt!378156))))

(declare-fun lt!378155 () Bool)

(assert (=> d!107333 (= lt!378156 lt!378155)))

(declare-fun lt!378154 () Unit!28493)

(declare-fun e!464897 () Unit!28493)

(assert (=> d!107333 (= lt!378154 e!464897)))

(declare-fun c!90811 () Bool)

(assert (=> d!107333 (= c!90811 lt!378155)))

(assert (=> d!107333 (= lt!378155 (containsKey!402 (toList!4505 lt!377593) lt!377595))))

(assert (=> d!107333 (= (contains!4211 lt!377593 lt!377595) lt!378156)))

(declare-fun b!833447 () Bool)

(declare-fun lt!378153 () Unit!28493)

(assert (=> b!833447 (= e!464897 lt!378153)))

(assert (=> b!833447 (= lt!378153 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377593) lt!377595))))

(assert (=> b!833447 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377593) lt!377595))))

(declare-fun b!833448 () Bool)

(declare-fun Unit!28555 () Unit!28493)

(assert (=> b!833448 (= e!464897 Unit!28555)))

(declare-fun b!833449 () Bool)

(assert (=> b!833449 (= e!464896 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377593) lt!377595)))))

(assert (= (and d!107333 c!90811) b!833447))

(assert (= (and d!107333 (not c!90811)) b!833448))

(assert (= (and d!107333 (not res!566726)) b!833449))

(declare-fun m!778235 () Bool)

(assert (=> d!107333 m!778235))

(declare-fun m!778237 () Bool)

(assert (=> b!833447 m!778237))

(assert (=> b!833447 m!776333))

(assert (=> b!833447 m!776333))

(declare-fun m!778239 () Bool)

(assert (=> b!833447 m!778239))

(assert (=> b!833449 m!776333))

(assert (=> b!833449 m!776333))

(assert (=> b!833449 m!778239))

(assert (=> d!106409 d!107333))

(declare-fun d!107335 () Bool)

(assert (=> d!107335 (= (apply!373 (+!1983 lt!377593 (tuple2!10157 lt!377594 minValue!754)) lt!377595) (apply!373 lt!377593 lt!377595))))

(assert (=> d!107335 true))

(declare-fun _$34!1155 () Unit!28493)

(assert (=> d!107335 (= (choose!1424 lt!377593 lt!377594 minValue!754 lt!377595) _$34!1155)))

(declare-fun bs!23332 () Bool)

(assert (= bs!23332 d!107335))

(assert (=> bs!23332 m!775933))

(assert (=> bs!23332 m!775933))

(assert (=> bs!23332 m!775951))

(assert (=> bs!23332 m!775929))

(assert (=> d!106409 d!107335))

(assert (=> d!106409 d!106425))

(assert (=> d!106409 d!106433))

(assert (=> d!106409 d!106419))

(declare-fun d!107337 () Bool)

(declare-fun res!566727 () Bool)

(declare-fun e!464898 () Bool)

(assert (=> d!107337 (=> res!566727 e!464898)))

(assert (=> d!107337 (= res!566727 (and ((_ is Cons!15945) lt!377741) (= (_1!5089 (h!17075 lt!377741)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!107337 (= (containsKey!402 lt!377741 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464898)))

(declare-fun b!833450 () Bool)

(declare-fun e!464899 () Bool)

(assert (=> b!833450 (= e!464898 e!464899)))

(declare-fun res!566728 () Bool)

(assert (=> b!833450 (=> (not res!566728) (not e!464899))))

(assert (=> b!833450 (= res!566728 (and (or (not ((_ is Cons!15945) lt!377741)) (bvsle (_1!5089 (h!17075 lt!377741)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15945) lt!377741) (bvslt (_1!5089 (h!17075 lt!377741)) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!833451 () Bool)

(assert (=> b!833451 (= e!464899 (containsKey!402 (t!22317 lt!377741) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!107337 (not res!566727)) b!833450))

(assert (= (and b!833450 res!566728) b!833451))

(declare-fun m!778241 () Bool)

(assert (=> b!833451 m!778241))

(assert (=> b!832226 d!107337))

(declare-fun d!107339 () Bool)

(declare-fun e!464900 () Bool)

(assert (=> d!107339 e!464900))

(declare-fun res!566729 () Bool)

(assert (=> d!107339 (=> res!566729 e!464900)))

(declare-fun lt!378160 () Bool)

(assert (=> d!107339 (= res!566729 (not lt!378160))))

(declare-fun lt!378159 () Bool)

(assert (=> d!107339 (= lt!378160 lt!378159)))

(declare-fun lt!378158 () Unit!28493)

(declare-fun e!464901 () Unit!28493)

(assert (=> d!107339 (= lt!378158 e!464901)))

(declare-fun c!90812 () Bool)

(assert (=> d!107339 (= c!90812 lt!378159)))

(assert (=> d!107339 (= lt!378159 (containsKey!402 (toList!4505 lt!377796) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(assert (=> d!107339 (= (contains!4211 lt!377796 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!378160)))

(declare-fun b!833452 () Bool)

(declare-fun lt!378157 () Unit!28493)

(assert (=> b!833452 (= e!464901 lt!378157)))

(assert (=> b!833452 (= lt!378157 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!4505 lt!377796) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(assert (=> b!833452 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377796) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun b!833453 () Bool)

(declare-fun Unit!28556 () Unit!28493)

(assert (=> b!833453 (= e!464901 Unit!28556)))

(declare-fun b!833454 () Bool)

(assert (=> b!833454 (= e!464900 (isDefined!312 (getValueByKey!416 (toList!4505 lt!377796) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(assert (= (and d!107339 c!90812) b!833452))

(assert (= (and d!107339 (not c!90812)) b!833453))

(assert (= (and d!107339 (not res!566729)) b!833454))

(declare-fun m!778243 () Bool)

(assert (=> d!107339 m!778243))

(declare-fun m!778245 () Bool)

(assert (=> b!833452 m!778245))

(assert (=> b!833452 m!776583))

(assert (=> b!833452 m!776583))

(declare-fun m!778247 () Bool)

(assert (=> b!833452 m!778247))

(assert (=> b!833454 m!776583))

(assert (=> b!833454 m!776583))

(assert (=> b!833454 m!778247))

(assert (=> d!106503 d!107339))

(declare-fun e!464903 () Option!422)

(declare-fun b!833457 () Bool)

(assert (=> b!833457 (= e!464903 (getValueByKey!416 (t!22317 lt!377795) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun b!833456 () Bool)

(declare-fun e!464902 () Option!422)

(assert (=> b!833456 (= e!464902 e!464903)))

(declare-fun c!90814 () Bool)

(assert (=> b!833456 (= c!90814 (and ((_ is Cons!15945) lt!377795) (not (= (_1!5089 (h!17075 lt!377795)) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))))

(declare-fun b!833458 () Bool)

(assert (=> b!833458 (= e!464903 None!420)))

(declare-fun b!833455 () Bool)

(assert (=> b!833455 (= e!464902 (Some!421 (_2!5089 (h!17075 lt!377795))))))

(declare-fun c!90813 () Bool)

(declare-fun d!107341 () Bool)

(assert (=> d!107341 (= c!90813 (and ((_ is Cons!15945) lt!377795) (= (_1!5089 (h!17075 lt!377795)) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(assert (=> d!107341 (= (getValueByKey!416 lt!377795 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) e!464902)))

(assert (= (and d!107341 c!90813) b!833455))

(assert (= (and d!107341 (not c!90813)) b!833456))

(assert (= (and b!833456 c!90814) b!833457))

(assert (= (and b!833456 (not c!90814)) b!833458))

(declare-fun m!778249 () Bool)

(assert (=> b!833457 m!778249))

(assert (=> d!106503 d!107341))

(declare-fun d!107343 () Bool)

(assert (=> d!107343 (= (getValueByKey!416 lt!377795 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) (Some!421 (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun lt!378161 () Unit!28493)

(assert (=> d!107343 (= lt!378161 (choose!1423 lt!377795 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun e!464904 () Bool)

(assert (=> d!107343 e!464904))

(declare-fun res!566730 () Bool)

(assert (=> d!107343 (=> (not res!566730) (not e!464904))))

(assert (=> d!107343 (= res!566730 (isStrictlySorted!442 lt!377795))))

(assert (=> d!107343 (= (lemmaContainsTupThenGetReturnValue!230 lt!377795 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!378161)))

(declare-fun b!833459 () Bool)

(declare-fun res!566731 () Bool)

(assert (=> b!833459 (=> (not res!566731) (not e!464904))))

(assert (=> b!833459 (= res!566731 (containsKey!402 lt!377795 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun b!833460 () Bool)

(assert (=> b!833460 (= e!464904 (contains!4212 lt!377795 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(assert (= (and d!107343 res!566730) b!833459))

(assert (= (and b!833459 res!566731) b!833460))

(assert (=> d!107343 m!776577))

(declare-fun m!778251 () Bool)

(assert (=> d!107343 m!778251))

(declare-fun m!778253 () Bool)

(assert (=> d!107343 m!778253))

(declare-fun m!778255 () Bool)

(assert (=> b!833459 m!778255))

(declare-fun m!778257 () Bool)

(assert (=> b!833460 m!778257))

(assert (=> d!106503 d!107343))

(declare-fun b!833461 () Bool)

(declare-fun e!464906 () List!15949)

(declare-fun call!36505 () List!15949)

(assert (=> b!833461 (= e!464906 call!36505)))

(declare-fun b!833462 () Bool)

(declare-fun e!464905 () List!15949)

(assert (=> b!833462 (= e!464905 (insertStrictlySorted!269 (t!22317 (toList!4505 lt!377557)) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun bm!36501 () Bool)

(declare-fun call!36504 () List!15949)

(assert (=> bm!36501 (= call!36505 call!36504)))

(declare-fun b!833463 () Bool)

(assert (=> b!833463 (= e!464906 call!36505)))

(declare-fun c!90817 () Bool)

(declare-fun b!833464 () Bool)

(declare-fun c!90815 () Bool)

(assert (=> b!833464 (= e!464905 (ite c!90817 (t!22317 (toList!4505 lt!377557)) (ite c!90815 (Cons!15945 (h!17075 (toList!4505 lt!377557)) (t!22317 (toList!4505 lt!377557))) Nil!15946)))))

(declare-fun bm!36502 () Bool)

(declare-fun c!90818 () Bool)

(declare-fun call!36506 () List!15949)

(assert (=> bm!36502 (= call!36506 ($colon$colon!537 e!464905 (ite c!90818 (h!17075 (toList!4505 lt!377557)) (tuple2!10157 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))))

(declare-fun c!90816 () Bool)

(assert (=> bm!36502 (= c!90816 c!90818)))

(declare-fun b!833465 () Bool)

(declare-fun res!566733 () Bool)

(declare-fun e!464908 () Bool)

(assert (=> b!833465 (=> (not res!566733) (not e!464908))))

(declare-fun lt!378162 () List!15949)

(assert (=> b!833465 (= res!566733 (containsKey!402 lt!378162 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))))))

(declare-fun b!833466 () Bool)

(declare-fun e!464909 () List!15949)

(assert (=> b!833466 (= e!464909 call!36506)))

(declare-fun b!833467 () Bool)

(assert (=> b!833467 (= c!90815 (and ((_ is Cons!15945) (toList!4505 lt!377557)) (bvsgt (_1!5089 (h!17075 (toList!4505 lt!377557))) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(declare-fun e!464907 () List!15949)

(assert (=> b!833467 (= e!464907 e!464906)))

(declare-fun d!107345 () Bool)

(assert (=> d!107345 e!464908))

(declare-fun res!566732 () Bool)

(assert (=> d!107345 (=> (not res!566732) (not e!464908))))

(assert (=> d!107345 (= res!566732 (isStrictlySorted!442 lt!378162))))

(assert (=> d!107345 (= lt!378162 e!464909)))

(assert (=> d!107345 (= c!90818 (and ((_ is Cons!15945) (toList!4505 lt!377557)) (bvslt (_1!5089 (h!17075 (toList!4505 lt!377557))) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(assert (=> d!107345 (isStrictlySorted!442 (toList!4505 lt!377557))))

(assert (=> d!107345 (= (insertStrictlySorted!269 (toList!4505 lt!377557) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34))) lt!378162)))

(declare-fun b!833468 () Bool)

(assert (=> b!833468 (= e!464907 call!36504)))

(declare-fun bm!36503 () Bool)

(assert (=> bm!36503 (= call!36504 call!36506)))

(declare-fun b!833469 () Bool)

(assert (=> b!833469 (= e!464908 (contains!4212 lt!378162 (tuple2!10157 (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)) (_2!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(declare-fun b!833470 () Bool)

(assert (=> b!833470 (= e!464909 e!464907)))

(assert (=> b!833470 (= c!90817 (and ((_ is Cons!15945) (toList!4505 lt!377557)) (= (_1!5089 (h!17075 (toList!4505 lt!377557))) (_1!5089 (tuple2!10157 lt!377564 zeroValueBefore!34)))))))

(assert (= (and d!107345 c!90818) b!833466))

(assert (= (and d!107345 (not c!90818)) b!833470))

(assert (= (and b!833470 c!90817) b!833468))

(assert (= (and b!833470 (not c!90817)) b!833467))

(assert (= (and b!833467 c!90815) b!833461))

(assert (= (and b!833467 (not c!90815)) b!833463))

(assert (= (or b!833461 b!833463) bm!36501))

(assert (= (or b!833468 bm!36501) bm!36503))

(assert (= (or b!833466 bm!36503) bm!36502))

(assert (= (and bm!36502 c!90816) b!833462))

(assert (= (and bm!36502 (not c!90816)) b!833464))

(assert (= (and d!107345 res!566732) b!833465))

(assert (= (and b!833465 res!566733) b!833469))

(declare-fun m!778259 () Bool)

(assert (=> d!107345 m!778259))

(declare-fun m!778261 () Bool)

(assert (=> d!107345 m!778261))

(declare-fun m!778263 () Bool)

(assert (=> b!833465 m!778263))

(declare-fun m!778265 () Bool)

(assert (=> b!833469 m!778265))

(declare-fun m!778267 () Bool)

(assert (=> bm!36502 m!778267))

(declare-fun m!778269 () Bool)

(assert (=> b!833462 m!778269))

(assert (=> d!106503 d!107345))

(declare-fun d!107347 () Bool)

(declare-fun lt!378163 () Bool)

(assert (=> d!107347 (= lt!378163 (select (content!388 lt!377758) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun e!464911 () Bool)

(assert (=> d!107347 (= lt!378163 e!464911)))

(declare-fun res!566735 () Bool)

(assert (=> d!107347 (=> (not res!566735) (not e!464911))))

(assert (=> d!107347 (= res!566735 ((_ is Cons!15945) lt!377758))))

(assert (=> d!107347 (= (contains!4212 lt!377758 (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))) lt!378163)))

(declare-fun b!833471 () Bool)

(declare-fun e!464910 () Bool)

(assert (=> b!833471 (= e!464911 e!464910)))

(declare-fun res!566734 () Bool)

(assert (=> b!833471 (=> res!566734 e!464910)))

(assert (=> b!833471 (= res!566734 (= (h!17075 lt!377758) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(declare-fun b!833472 () Bool)

(assert (=> b!833472 (= e!464910 (contains!4212 (t!22317 lt!377758) (tuple2!10157 (_1!5089 lt!377428) (_2!5089 lt!377428))))))

(assert (= (and d!107347 res!566735) b!833471))

(assert (= (and b!833471 (not res!566734)) b!833472))

(declare-fun m!778271 () Bool)

(assert (=> d!107347 m!778271))

(declare-fun m!778273 () Bool)

(assert (=> d!107347 m!778273))

(declare-fun m!778275 () Bool)

(assert (=> b!833472 m!778275))

(assert (=> b!832268 d!107347))

(declare-fun mapIsEmpty!24485 () Bool)

(declare-fun mapRes!24485 () Bool)

(assert (=> mapIsEmpty!24485 mapRes!24485))

(declare-fun condMapEmpty!24485 () Bool)

(declare-fun mapDefault!24485 () ValueCell!7191)

(assert (=> mapNonEmpty!24484 (= condMapEmpty!24485 (= mapRest!24484 ((as const (Array (_ BitVec 32) ValueCell!7191)) mapDefault!24485)))))

(declare-fun e!464912 () Bool)

(assert (=> mapNonEmpty!24484 (= tp!47311 (and e!464912 mapRes!24485))))

(declare-fun b!833473 () Bool)

(declare-fun e!464913 () Bool)

(assert (=> b!833473 (= e!464913 tp_is_empty!15213)))

(declare-fun mapNonEmpty!24485 () Bool)

(declare-fun tp!47312 () Bool)

(assert (=> mapNonEmpty!24485 (= mapRes!24485 (and tp!47312 e!464913))))

(declare-fun mapRest!24485 () (Array (_ BitVec 32) ValueCell!7191))

(declare-fun mapValue!24485 () ValueCell!7191)

(declare-fun mapKey!24485 () (_ BitVec 32))

(assert (=> mapNonEmpty!24485 (= mapRest!24484 (store mapRest!24485 mapKey!24485 mapValue!24485))))

(declare-fun b!833474 () Bool)

(assert (=> b!833474 (= e!464912 tp_is_empty!15213)))

(assert (= (and mapNonEmpty!24484 condMapEmpty!24485) mapIsEmpty!24485))

(assert (= (and mapNonEmpty!24484 (not condMapEmpty!24485)) mapNonEmpty!24485))

(assert (= (and mapNonEmpty!24485 ((_ is ValueCellFull!7191) mapValue!24485)) b!833473))

(assert (= (and mapNonEmpty!24484 ((_ is ValueCellFull!7191) mapDefault!24485)) b!833474))

(declare-fun m!778277 () Bool)

(assert (=> mapNonEmpty!24485 m!778277))

(declare-fun b_lambda!11451 () Bool)

(assert (= b_lambda!11445 (or (and start!71582 b_free!13503) b_lambda!11451)))

(declare-fun b_lambda!11453 () Bool)

(assert (= b_lambda!11449 (or (and start!71582 b_free!13503) b_lambda!11453)))

(declare-fun b_lambda!11455 () Bool)

(assert (= b_lambda!11443 (or (and start!71582 b_free!13503) b_lambda!11455)))

(declare-fun b_lambda!11457 () Bool)

(assert (= b_lambda!11447 (or (and start!71582 b_free!13503) b_lambda!11457)))

(check-sat (not b!832869) (not b!832731) (not b!832917) (not d!106749) (not d!106915) (not b!833129) (not b!832579) (not b!832735) (not b!832777) (not b!833420) (not d!107181) (not b!832652) (not b!832835) (not b!833340) (not d!106929) (not b!833146) (not d!106825) (not b!832657) (not d!107045) (not b!833180) (not b!832449) (not b_lambda!11435) (not d!107347) (not b!833422) (not b!833002) (not b!833403) (not d!106951) (not d!107237) (not b!832577) (not bm!36493) (not b!833216) (not b!832866) (not b!832447) (not d!107203) (not d!107071) (not b_lambda!11441) (not b!833451) (not b!832481) (not b!833160) (not b!833459) (not b!832804) (not b!833314) (not b!832983) (not b!833126) (not b!832718) (not d!107183) (not d!107315) (not d!107175) (not bm!36473) (not d!106637) (not b!832615) (not b!833465) (not d!106599) (not b!832993) (not b!832798) (not b!832873) (not b!832537) (not b!832496) (not d!107171) (not d!106983) (not d!107197) (not b!832802) (not d!107331) (not b!833427) (not bm!36470) (not b!833447) (not b!833304) (not b!832956) (not b!833271) (not d!106589) (not b!832976) (not b_lambda!11421) (not b!833136) (not d!106681) (not d!106815) (not b!833143) (not b!832929) (not b!832503) (not b!833351) (not b!833235) (not bm!36456) (not d!106881) (not d!106791) (not d!106879) (not d!107213) (not b!833067) (not d!106593) (not b!832522) (not b!832667) (not b!832669) (not b!833435) (not b!832751) (not b!832538) (not b!833377) (not d!106743) (not d!107161) (not bm!36499) (not b!832728) (not b!833149) (not b!833253) (not b!833214) (not b!832837) (not b!833051) (not d!106617) (not d!107135) (not b!832923) (not d!107069) (not b!833298) (not b!833132) (not bm!36446) (not b!832787) (not d!107307) (not b!832987) (not d!106585) (not b!833032) (not b!833361) (not b!833383) (not d!106605) (not b!833203) (not b!832780) (not d!106703) (not d!107055) (not b!833158) (not b!832689) (not b!832519) (not b!832454) (not d!107345) (not b!832847) (not b!833408) (not b!833438) (not b!832934) (not d!106727) (not d!107189) (not b!832985) (not b!832438) (not bm!36464) (not b_lambda!11455) (not b!832754) (not b!833329) (not b!832878) (not b!832812) (not b!832501) (not d!106921) (not b!832968) (not b!833288) (not bm!36461) (not b!832795) (not b!832675) (not d!107039) (not d!106731) (not bm!36458) (not d!107219) (not b!833293) (not b!833013) (not d!107113) (not d!106981) (not d!107259) (not b!832965) (not b!833432) (not b!833108) (not bm!36496) (not d!106699) (not b!832504) (not b!832563) (not b!832471) (not d!106643) (not b!833472) (not b!832859) (not b!832495) (not b!833333) (not b!832957) (not b!833380) (not b!833401) (not d!107037) (not d!107309) (not bm!36451) (not b!832884) (not b!833091) (not b!832981) (not b!833444) (not b!833054) (not b!833186) (not b!832712) (not d!106665) (not d!107033) (not b!833166) tp_is_empty!15213 (not b!832572) (not d!106841) (not b!832852) (not d!106633) (not b!832547) (not d!107169) (not b!833114) (not b!832930) (not bm!36435) (not b!833398) (not b!832783) (not d!106923) (not b!832603) (not b!833324) (not b!832747) (not b!833094) (not b!832844) (not bm!36454) (not b!833394) (not d!106843) (not b!833178) (not d!107153) (not d!106773) (not d!106977) (not b!832750) (not b!832978) (not d!106837) (not b!833194) (not b!832793) (not b!833284) (not b!832701) (not d!107149) (not b!833163) (not b!832947) (not b!832927) (not b!833238) (not b!833201) (not d!107013) (not d!106687) (not b!833335) (not d!107173) (not b_lambda!11439) (not b!833355) (not d!106927) (not d!107265) (not b!832719) (not b!833219) (not b!832739) (not b!832714) (not d!107053) (not b!833030) (not b!832526) (not b!832772) (not d!106689) (not b!833312) (not d!107093) (not b!833356) (not b!832486) (not d!107319) (not b!833446) (not b!832613) (not b!832574) (not d!107323) (not b!832950) (not b!832695) (not d!107291) (not b!833283) (not b!832841) (not d!106625) (not b!833104) (not b!833157) (not b!832618) (not b!832517) (not d!107081) (not b!832944) (not d!107031) (not b!833189) (not d!107333) (not d!106623) (not bm!36502) (not b!832842) (not d!106829) (not b!833291) (not d!106933) (not b!833387) (not b!832806) (not bm!36489) (not b!832912) (not d!107117) (not b!832936) (not b!833033) (not b!833020) (not b!832973) (not b!832452) (not b!833281) (not b!832932) (not b!833259) (not d!107267) (not b!832464) (not d!107107) (not b!832555) (not d!106899) (not b!833213) (not d!106869) (not b!832683) (not d!106863) (not b!832660) (not d!107257) (not b!833375) (not b!832693) (not d!106999) (not d!107329) (not b!833061) (not b!833424) (not b!832479) (not d!106583) (not b!833396) (not b!832640) (not d!106853) (not d!107179) (not b!833087) (not b!833075) (not b_lambda!11437) (not bm!36429) (not d!107111) (not b!833349) (not d!107209) (not d!106967) (not b!832724) (not d!106769) (not d!106955) (not d!106989) (not b!832849) (not d!107119) (not b!833233) (not b!833181) (not d!107155) (not b!832445) (not b_lambda!11453) (not b!832509) (not b!833462) (not b!833430) (not b!832811) (not d!107127) (not b!833331) (not d!107251) (not b!832838) (not d!106997) (not d!107327) (not b!832585) (not d!106783) (not b!832704) (not d!106913) (not d!106875) (not b!832850) (not d!106857) (not b!832489) (not d!107165) (not b_lambda!11425) (not d!107277) (not b!832553) (not d!107035) (not b_lambda!11417) (not bm!36487) (not d!106713) (not d!107217) (not d!106779) (not b!833274) (not d!107301) (not b!833050) (not d!106833) (not b!833266) (not b!832600) (not d!106755) (not b!832888) (not d!107167) (not b!832879) (not d!107065) (not d!106975) (not b!833006) (not b!833242) (not b!833010) (not b!832716) (not b!833369) (not b!832511) (not b!832595) (not b!832588) (not b!832507) (not b!833070) (not d!106737) (not b!833359) (not b!833175) (not b!832662) (not d!107057) (not b!832655) (not b!832896) (not b!833049) (not b!832455) (not b!833027) (not d!106725) (not b!833276) (not b!833165) (not d!107051) (not b!832989) (not b!833153) (not b!832774) (not b!832925) (not d!106861) (not b!833134) (not b!833292) (not d!106653) (not d!107343) (not b!833001) (not d!106941) b_and!22591 (not b!832535) (not b!832699) (not b_lambda!11451) (not b!832995) (not b!833269) (not d!107063) (not d!107021) (not b!832560) (not b!833124) (not b!832790) (not b!832664) (not d!107079) (not d!106925) (not b!832828) (not b!833064) (not b!833068) (not b!833322) (not b!832881) (not b!832441) (not d!106893) (not d!106757) (not b!833042) (not b!832460) (not d!106663) (not b!833457) (not b!833413) (not b!833045) (not d!106621) (not d!107017) (not b!832543) (not b!832514) (not b!833023) (not d!106991) (not b!833290) (not b!833102) (not b!833452) (not b!832532) (not d!107303) (not b!833155) (not d!107125) (not b!833225) (not b!833279) (not b!832606) (not d!107041) (not b!833316) (not b!832679) (not b!832483) (not d!106777) (not d!107297) (not d!106819) (not b!832992) (not d!106949) (not d!106641) (not b!833211) (not b!833263) (not b!832720) (not b!833248) (not b!832708) (not b!833286) (not b!833077) (not b!832672) (not mapNonEmpty!24485) (not b!832722) (not b!833117) (not b!833206) (not b!833390) (not b!832752) (not b!833405) (not b!833392) (not d!107067) (not b!832908) (not b!832670) (not b!833449) (not b!832904) (not b!833433) (not b!833168) (not b!832530) (not b!833318) (not b!833230) (not d!107269) (not b!832610) (not d!106693) (not b!833151) (not d!107023) (not b!832792) (not b!833057) (not b!833208) (not b!833469) (not d!107335) (not b!833337) (not b!832498) (not b!832892) (not b!833017) (not b!832871) (not b!833410) (not b!833183) (not d!107317) (not d!107133) (not b_lambda!11419) (not b!832900) (not b!832826) (not b!833320) (not b!832814) (not b!833078) (not b!833047) (not b!832831) (not b!832986) (not b_lambda!11415) (not b!833191) (not bm!36438) (not d!106781) (not b!832960) (not b!833308) (not d!106969) (not d!106741) (not b!833110) (not bm!36441) (not d!106847) (not b!832566) (not b!833066) (not b!832864) (not d!107241) (not b!833223) (not b_next!13503) (not b!833256) (not b!833063) (not d!107339) (not b!833417) (not b!832809) (not b!833232) (not d!106683) (not b!832971) (not b!832686) (not b!832855) (not d!107025) (not d!107221) (not b!832457) (not b!833098) (not bm!36432) (not b!833454) (not b!833171) (not b!832824) (not b!833295) (not b!832557) (not d!106931) (not b!833081) (not b!832516) (not b!833188) (not b!833035) (not d!107085) (not b!833053) (not b!833357) (not d!107289) (not b!833364) (not d!106631) (not bm!36485) (not b!833346) (not b!833227) (not b!832569) (not b!833267) (not b_lambda!11457) (not b_lambda!11423) (not b!833358) (not b!833140) (not b!833406) (not b!833112) (not b!832937) (not b!832434) (not b!832817) (not bm!36491) (not b!833121) (not b!833106) (not b!832551) (not d!107199) (not b!833004) (not bm!36448) (not b!832785) (not b!832920) (not d!106985) (not d!106729) (not b!833142) (not b!833073) (not b!832821) (not b!833245) (not d!107193) (not b!832597) (not b!833096) (not b!833372) (not d!107223) (not b!833400) (not b!833198) (not b!832540) (not b!832726) (not d!106597) (not b!832592) (not b!832582) (not d!107187) (not b!833273) (not d!106987) (not d!106859) (not d!106667) (not d!106807) (not b!832690) (not b!832876) (not bm!36479) (not bm!36467) (not b!832654) (not b!832915) (not b!833254) (not b!833100) (not b!832861) (not d!106811) (not b!832743) (not bm!36476) (not b!833353) (not b!832940) (not b!833084) (not b!833344) (not d!107105) (not b!833460) (not b!832649) (not b!832991) (not d!107121) (not b!833442) (not d!106655) (not b!832529) (not d!106709) (not d!106775) (not b!833008) (not b!833025) (not b!833205) (not b!833278) (not b!833301) (not d!107311) (not bm!36482) (not d!107227) (not d!106671) (not d!106849) (not d!106835) (not d!106953) (not d!106867) (not b!832697) (not d!106649) (not b!833138) (not bm!36444) (not b!832954) (not d!107109) (not b!833378) (not b!833367) (not d!107205) (not b!833348) (not d!107147) (not b!833038) (not b!833251) (not b!833246) (not b!832473) (not b!833326) (not b!833425) (not d!107245) (not d!107263) (not b!832963))
(check-sat b_and!22591 (not b_next!13503))

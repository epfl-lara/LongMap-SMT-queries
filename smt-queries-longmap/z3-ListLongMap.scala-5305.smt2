; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71014 () Bool)

(assert start!71014)

(declare-fun b_free!13237 () Bool)

(declare-fun b_next!13237 () Bool)

(assert (=> start!71014 (= b_free!13237 (not b_next!13237))))

(declare-fun tp!46464 () Bool)

(declare-fun b_and!22115 () Bool)

(assert (=> start!71014 (= tp!46464 b_and!22115)))

(declare-fun b!824638 () Bool)

(declare-fun e!458873 () Bool)

(declare-fun tp_is_empty!14947 () Bool)

(assert (=> b!824638 (= e!458873 tp_is_empty!14947)))

(declare-fun res!562253 () Bool)

(declare-fun e!458872 () Bool)

(assert (=> start!71014 (=> (not res!562253) (not e!458872))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71014 (= res!562253 (validMask!0 mask!1312))))

(assert (=> start!71014 e!458872))

(assert (=> start!71014 tp_is_empty!14947))

(declare-datatypes ((array!46049 0))(
  ( (array!46050 (arr!22072 (Array (_ BitVec 32) (_ BitVec 64))) (size!22493 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46049)

(declare-fun array_inv!17673 (array!46049) Bool)

(assert (=> start!71014 (array_inv!17673 _keys!976)))

(assert (=> start!71014 true))

(declare-datatypes ((V!24931 0))(
  ( (V!24932 (val!7521 Int)) )
))
(declare-datatypes ((ValueCell!7058 0))(
  ( (ValueCellFull!7058 (v!9948 V!24931)) (EmptyCell!7058) )
))
(declare-datatypes ((array!46051 0))(
  ( (array!46052 (arr!22073 (Array (_ BitVec 32) ValueCell!7058)) (size!22494 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46051)

(declare-fun e!458871 () Bool)

(declare-fun array_inv!17674 (array!46051) Bool)

(assert (=> start!71014 (and (array_inv!17674 _values!788) e!458871)))

(assert (=> start!71014 tp!46464))

(declare-fun b!824639 () Bool)

(declare-fun e!458868 () Bool)

(declare-fun mapRes!24040 () Bool)

(assert (=> b!824639 (= e!458871 (and e!458868 mapRes!24040))))

(declare-fun condMapEmpty!24040 () Bool)

(declare-fun mapDefault!24040 () ValueCell!7058)

(assert (=> b!824639 (= condMapEmpty!24040 (= (arr!22073 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7058)) mapDefault!24040)))))

(declare-fun b!824640 () Bool)

(declare-fun res!562255 () Bool)

(assert (=> b!824640 (=> (not res!562255) (not e!458872))))

(declare-datatypes ((List!15757 0))(
  ( (Nil!15754) (Cons!15753 (h!16882 (_ BitVec 64)) (t!22091 List!15757)) )
))
(declare-fun arrayNoDuplicates!0 (array!46049 (_ BitVec 32) List!15757) Bool)

(assert (=> b!824640 (= res!562255 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15754))))

(declare-fun b!824641 () Bool)

(declare-fun e!458869 () Bool)

(assert (=> b!824641 (= e!458869 (bvsle #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-datatypes ((tuple2!9956 0))(
  ( (tuple2!9957 (_1!4989 (_ BitVec 64)) (_2!4989 V!24931)) )
))
(declare-datatypes ((List!15758 0))(
  ( (Nil!15755) (Cons!15754 (h!16883 tuple2!9956) (t!22092 List!15758)) )
))
(declare-datatypes ((ListLongMap!8769 0))(
  ( (ListLongMap!8770 (toList!4400 List!15758)) )
))
(declare-fun lt!371807 () ListLongMap!8769)

(declare-fun zeroValueBefore!34 () V!24931)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24931)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2494 (array!46049 array!46051 (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 (_ BitVec 32) Int) ListLongMap!8769)

(assert (=> b!824641 (= lt!371807 (getCurrentListMap!2494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824642 () Bool)

(declare-fun res!562254 () Bool)

(assert (=> b!824642 (=> (not res!562254) (not e!458872))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824642 (= res!562254 (and (= (size!22494 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22493 _keys!976) (size!22494 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824643 () Bool)

(assert (=> b!824643 (= e!458872 (not e!458869))))

(declare-fun res!562252 () Bool)

(assert (=> b!824643 (=> res!562252 e!458869)))

(assert (=> b!824643 (= res!562252 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371804 () ListLongMap!8769)

(declare-fun lt!371805 () ListLongMap!8769)

(assert (=> b!824643 (= lt!371804 lt!371805)))

(declare-datatypes ((Unit!28224 0))(
  ( (Unit!28225) )
))
(declare-fun lt!371806 () Unit!28224)

(declare-fun zeroValueAfter!34 () V!24931)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!537 (array!46049 array!46051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 V!24931 V!24931 (_ BitVec 32) Int) Unit!28224)

(assert (=> b!824643 (= lt!371806 (lemmaNoChangeToArrayThenSameMapNoExtras!537 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2444 (array!46049 array!46051 (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 (_ BitVec 32) Int) ListLongMap!8769)

(assert (=> b!824643 (= lt!371805 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824643 (= lt!371804 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824644 () Bool)

(assert (=> b!824644 (= e!458868 tp_is_empty!14947)))

(declare-fun b!824645 () Bool)

(declare-fun res!562256 () Bool)

(assert (=> b!824645 (=> (not res!562256) (not e!458872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46049 (_ BitVec 32)) Bool)

(assert (=> b!824645 (= res!562256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24040 () Bool)

(declare-fun tp!46465 () Bool)

(assert (=> mapNonEmpty!24040 (= mapRes!24040 (and tp!46465 e!458873))))

(declare-fun mapValue!24040 () ValueCell!7058)

(declare-fun mapRest!24040 () (Array (_ BitVec 32) ValueCell!7058))

(declare-fun mapKey!24040 () (_ BitVec 32))

(assert (=> mapNonEmpty!24040 (= (arr!22073 _values!788) (store mapRest!24040 mapKey!24040 mapValue!24040))))

(declare-fun mapIsEmpty!24040 () Bool)

(assert (=> mapIsEmpty!24040 mapRes!24040))

(assert (= (and start!71014 res!562253) b!824642))

(assert (= (and b!824642 res!562254) b!824645))

(assert (= (and b!824645 res!562256) b!824640))

(assert (= (and b!824640 res!562255) b!824643))

(assert (= (and b!824643 (not res!562252)) b!824641))

(assert (= (and b!824639 condMapEmpty!24040) mapIsEmpty!24040))

(assert (= (and b!824639 (not condMapEmpty!24040)) mapNonEmpty!24040))

(get-info :version)

(assert (= (and mapNonEmpty!24040 ((_ is ValueCellFull!7058) mapValue!24040)) b!824638))

(assert (= (and b!824639 ((_ is ValueCellFull!7058) mapDefault!24040)) b!824644))

(assert (= start!71014 b!824639))

(declare-fun m!766145 () Bool)

(assert (=> start!71014 m!766145))

(declare-fun m!766147 () Bool)

(assert (=> start!71014 m!766147))

(declare-fun m!766149 () Bool)

(assert (=> start!71014 m!766149))

(declare-fun m!766151 () Bool)

(assert (=> b!824640 m!766151))

(declare-fun m!766153 () Bool)

(assert (=> b!824641 m!766153))

(declare-fun m!766155 () Bool)

(assert (=> b!824643 m!766155))

(declare-fun m!766157 () Bool)

(assert (=> b!824643 m!766157))

(declare-fun m!766159 () Bool)

(assert (=> b!824643 m!766159))

(declare-fun m!766161 () Bool)

(assert (=> mapNonEmpty!24040 m!766161))

(declare-fun m!766163 () Bool)

(assert (=> b!824645 m!766163))

(check-sat (not mapNonEmpty!24040) tp_is_empty!14947 (not b!824645) (not b!824640) (not b!824643) (not b!824641) (not b_next!13237) (not start!71014) b_and!22115)
(check-sat b_and!22115 (not b_next!13237))
(get-model)

(declare-fun b!824705 () Bool)

(declare-fun e!458921 () Bool)

(declare-fun call!35816 () Bool)

(assert (=> b!824705 (= e!458921 call!35816)))

(declare-fun b!824706 () Bool)

(declare-fun e!458918 () Bool)

(declare-fun e!458919 () Bool)

(assert (=> b!824706 (= e!458918 e!458919)))

(declare-fun res!562293 () Bool)

(assert (=> b!824706 (=> (not res!562293) (not e!458919))))

(declare-fun e!458920 () Bool)

(assert (=> b!824706 (= res!562293 (not e!458920))))

(declare-fun res!562295 () Bool)

(assert (=> b!824706 (=> (not res!562295) (not e!458920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!824706 (= res!562295 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824707 () Bool)

(assert (=> b!824707 (= e!458921 call!35816)))

(declare-fun b!824708 () Bool)

(declare-fun contains!4156 (List!15757 (_ BitVec 64)) Bool)

(assert (=> b!824708 (= e!458920 (contains!4156 Nil!15754 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35813 () Bool)

(declare-fun c!89323 () Bool)

(assert (=> bm!35813 (= call!35816 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89323 (Cons!15753 (select (arr!22072 _keys!976) #b00000000000000000000000000000000) Nil!15754) Nil!15754)))))

(declare-fun d!104763 () Bool)

(declare-fun res!562294 () Bool)

(assert (=> d!104763 (=> res!562294 e!458918)))

(assert (=> d!104763 (= res!562294 (bvsge #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(assert (=> d!104763 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15754) e!458918)))

(declare-fun b!824704 () Bool)

(assert (=> b!824704 (= e!458919 e!458921)))

(assert (=> b!824704 (= c!89323 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104763 (not res!562294)) b!824706))

(assert (= (and b!824706 res!562295) b!824708))

(assert (= (and b!824706 res!562293) b!824704))

(assert (= (and b!824704 c!89323) b!824707))

(assert (= (and b!824704 (not c!89323)) b!824705))

(assert (= (or b!824707 b!824705) bm!35813))

(declare-fun m!766205 () Bool)

(assert (=> b!824706 m!766205))

(assert (=> b!824706 m!766205))

(declare-fun m!766207 () Bool)

(assert (=> b!824706 m!766207))

(assert (=> b!824708 m!766205))

(assert (=> b!824708 m!766205))

(declare-fun m!766209 () Bool)

(assert (=> b!824708 m!766209))

(assert (=> bm!35813 m!766205))

(declare-fun m!766211 () Bool)

(assert (=> bm!35813 m!766211))

(assert (=> b!824704 m!766205))

(assert (=> b!824704 m!766205))

(assert (=> b!824704 m!766207))

(assert (=> b!824640 d!104763))

(declare-fun b!824751 () Bool)

(declare-fun e!458954 () ListLongMap!8769)

(declare-fun call!35836 () ListLongMap!8769)

(assert (=> b!824751 (= e!458954 call!35836)))

(declare-fun b!824752 () Bool)

(declare-fun e!458959 () ListLongMap!8769)

(declare-fun call!35831 () ListLongMap!8769)

(assert (=> b!824752 (= e!458959 call!35831)))

(declare-fun b!824753 () Bool)

(declare-fun e!458948 () ListLongMap!8769)

(assert (=> b!824753 (= e!458948 e!458959)))

(declare-fun c!89338 () Bool)

(assert (=> b!824753 (= c!89338 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!824754 () Bool)

(declare-fun e!458957 () Bool)

(declare-fun e!458950 () Bool)

(assert (=> b!824754 (= e!458957 e!458950)))

(declare-fun c!89339 () Bool)

(assert (=> b!824754 (= c!89339 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!824755 () Bool)

(declare-fun e!458956 () Bool)

(declare-fun e!458960 () Bool)

(assert (=> b!824755 (= e!458956 e!458960)))

(declare-fun res!562320 () Bool)

(declare-fun call!35835 () Bool)

(assert (=> b!824755 (= res!562320 call!35835)))

(assert (=> b!824755 (=> (not res!562320) (not e!458960))))

(declare-fun bm!35828 () Bool)

(declare-fun call!35834 () Bool)

(declare-fun lt!371889 () ListLongMap!8769)

(declare-fun contains!4157 (ListLongMap!8769 (_ BitVec 64)) Bool)

(assert (=> bm!35828 (= call!35834 (contains!4157 lt!371889 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!458951 () Bool)

(declare-fun b!824756 () Bool)

(declare-fun apply!361 (ListLongMap!8769 (_ BitVec 64)) V!24931)

(declare-fun get!11726 (ValueCell!7058 V!24931) V!24931)

(declare-fun dynLambda!975 (Int (_ BitVec 64)) V!24931)

(assert (=> b!824756 (= e!458951 (= (apply!361 lt!371889 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)) (get!11726 (select (arr!22073 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!824756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22494 _values!788)))))

(assert (=> b!824756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun b!824757 () Bool)

(declare-fun e!458955 () Unit!28224)

(declare-fun Unit!28226 () Unit!28224)

(assert (=> b!824757 (= e!458955 Unit!28226)))

(declare-fun b!824758 () Bool)

(assert (=> b!824758 (= e!458950 (not call!35834))))

(declare-fun b!824759 () Bool)

(declare-fun e!458952 () Bool)

(assert (=> b!824759 (= e!458952 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824760 () Bool)

(assert (=> b!824760 (= e!458956 (not call!35835))))

(declare-fun b!824761 () Bool)

(declare-fun call!35832 () ListLongMap!8769)

(declare-fun +!1938 (ListLongMap!8769 tuple2!9956) ListLongMap!8769)

(assert (=> b!824761 (= e!458948 (+!1938 call!35832 (tuple2!9957 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun call!35833 () ListLongMap!8769)

(declare-fun call!35837 () ListLongMap!8769)

(declare-fun c!89340 () Bool)

(declare-fun bm!35829 () Bool)

(assert (=> bm!35829 (= call!35832 (+!1938 (ite c!89340 call!35837 (ite c!89338 call!35833 call!35836)) (ite (or c!89340 c!89338) (tuple2!9957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9957 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!824762 () Bool)

(declare-fun e!458953 () Bool)

(assert (=> b!824762 (= e!458953 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35830 () Bool)

(assert (=> bm!35830 (= call!35833 call!35837)))

(declare-fun b!824763 () Bool)

(declare-fun lt!371894 () Unit!28224)

(assert (=> b!824763 (= e!458955 lt!371894)))

(declare-fun lt!371880 () ListLongMap!8769)

(assert (=> b!824763 (= lt!371880 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371895 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371879 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371879 (select (arr!22072 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371896 () Unit!28224)

(declare-fun addStillContains!313 (ListLongMap!8769 (_ BitVec 64) V!24931 (_ BitVec 64)) Unit!28224)

(assert (=> b!824763 (= lt!371896 (addStillContains!313 lt!371880 lt!371895 zeroValueBefore!34 lt!371879))))

(assert (=> b!824763 (contains!4157 (+!1938 lt!371880 (tuple2!9957 lt!371895 zeroValueBefore!34)) lt!371879)))

(declare-fun lt!371892 () Unit!28224)

(assert (=> b!824763 (= lt!371892 lt!371896)))

(declare-fun lt!371886 () ListLongMap!8769)

(assert (=> b!824763 (= lt!371886 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371881 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371881 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371878 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371878 (select (arr!22072 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371883 () Unit!28224)

(declare-fun addApplyDifferent!313 (ListLongMap!8769 (_ BitVec 64) V!24931 (_ BitVec 64)) Unit!28224)

(assert (=> b!824763 (= lt!371883 (addApplyDifferent!313 lt!371886 lt!371881 minValue!754 lt!371878))))

(assert (=> b!824763 (= (apply!361 (+!1938 lt!371886 (tuple2!9957 lt!371881 minValue!754)) lt!371878) (apply!361 lt!371886 lt!371878))))

(declare-fun lt!371891 () Unit!28224)

(assert (=> b!824763 (= lt!371891 lt!371883)))

(declare-fun lt!371887 () ListLongMap!8769)

(assert (=> b!824763 (= lt!371887 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371885 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371885 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371897 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371897 (select (arr!22072 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371877 () Unit!28224)

(assert (=> b!824763 (= lt!371877 (addApplyDifferent!313 lt!371887 lt!371885 zeroValueBefore!34 lt!371897))))

(assert (=> b!824763 (= (apply!361 (+!1938 lt!371887 (tuple2!9957 lt!371885 zeroValueBefore!34)) lt!371897) (apply!361 lt!371887 lt!371897))))

(declare-fun lt!371876 () Unit!28224)

(assert (=> b!824763 (= lt!371876 lt!371877)))

(declare-fun lt!371888 () ListLongMap!8769)

(assert (=> b!824763 (= lt!371888 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371893 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371893 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371884 () (_ BitVec 64))

(assert (=> b!824763 (= lt!371884 (select (arr!22072 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824763 (= lt!371894 (addApplyDifferent!313 lt!371888 lt!371893 minValue!754 lt!371884))))

(assert (=> b!824763 (= (apply!361 (+!1938 lt!371888 (tuple2!9957 lt!371893 minValue!754)) lt!371884) (apply!361 lt!371888 lt!371884))))

(declare-fun bm!35831 () Bool)

(assert (=> bm!35831 (= call!35835 (contains!4157 lt!371889 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!824764 () Bool)

(declare-fun res!562322 () Bool)

(assert (=> b!824764 (=> (not res!562322) (not e!458957))))

(declare-fun e!458958 () Bool)

(assert (=> b!824764 (= res!562322 e!458958)))

(declare-fun res!562321 () Bool)

(assert (=> b!824764 (=> res!562321 e!458958)))

(assert (=> b!824764 (= res!562321 (not e!458952))))

(declare-fun res!562317 () Bool)

(assert (=> b!824764 (=> (not res!562317) (not e!458952))))

(assert (=> b!824764 (= res!562317 (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun b!824765 () Bool)

(declare-fun c!89341 () Bool)

(assert (=> b!824765 (= c!89341 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!824765 (= e!458959 e!458954)))

(declare-fun b!824766 () Bool)

(assert (=> b!824766 (= e!458960 (= (apply!361 lt!371889 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!824767 () Bool)

(assert (=> b!824767 (= e!458954 call!35831)))

(declare-fun bm!35832 () Bool)

(assert (=> bm!35832 (= call!35836 call!35833)))

(declare-fun bm!35833 () Bool)

(assert (=> bm!35833 (= call!35837 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824768 () Bool)

(assert (=> b!824768 (= e!458958 e!458951)))

(declare-fun res!562319 () Bool)

(assert (=> b!824768 (=> (not res!562319) (not e!458951))))

(assert (=> b!824768 (= res!562319 (contains!4157 lt!371889 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824768 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun b!824769 () Bool)

(declare-fun e!458949 () Bool)

(assert (=> b!824769 (= e!458950 e!458949)))

(declare-fun res!562314 () Bool)

(assert (=> b!824769 (= res!562314 call!35834)))

(assert (=> b!824769 (=> (not res!562314) (not e!458949))))

(declare-fun b!824770 () Bool)

(assert (=> b!824770 (= e!458949 (= (apply!361 lt!371889 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun d!104765 () Bool)

(assert (=> d!104765 e!458957))

(declare-fun res!562315 () Bool)

(assert (=> d!104765 (=> (not res!562315) (not e!458957))))

(assert (=> d!104765 (= res!562315 (or (bvsge #b00000000000000000000000000000000 (size!22493 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))))

(declare-fun lt!371882 () ListLongMap!8769)

(assert (=> d!104765 (= lt!371889 lt!371882)))

(declare-fun lt!371890 () Unit!28224)

(assert (=> d!104765 (= lt!371890 e!458955)))

(declare-fun c!89337 () Bool)

(assert (=> d!104765 (= c!89337 e!458953)))

(declare-fun res!562316 () Bool)

(assert (=> d!104765 (=> (not res!562316) (not e!458953))))

(assert (=> d!104765 (= res!562316 (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(assert (=> d!104765 (= lt!371882 e!458948)))

(assert (=> d!104765 (= c!89340 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104765 (validMask!0 mask!1312)))

(assert (=> d!104765 (= (getCurrentListMap!2494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371889)))

(declare-fun b!824771 () Bool)

(declare-fun res!562318 () Bool)

(assert (=> b!824771 (=> (not res!562318) (not e!458957))))

(assert (=> b!824771 (= res!562318 e!458956)))

(declare-fun c!89336 () Bool)

(assert (=> b!824771 (= c!89336 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35834 () Bool)

(assert (=> bm!35834 (= call!35831 call!35832)))

(assert (= (and d!104765 c!89340) b!824761))

(assert (= (and d!104765 (not c!89340)) b!824753))

(assert (= (and b!824753 c!89338) b!824752))

(assert (= (and b!824753 (not c!89338)) b!824765))

(assert (= (and b!824765 c!89341) b!824767))

(assert (= (and b!824765 (not c!89341)) b!824751))

(assert (= (or b!824767 b!824751) bm!35832))

(assert (= (or b!824752 bm!35832) bm!35830))

(assert (= (or b!824752 b!824767) bm!35834))

(assert (= (or b!824761 bm!35830) bm!35833))

(assert (= (or b!824761 bm!35834) bm!35829))

(assert (= (and d!104765 res!562316) b!824762))

(assert (= (and d!104765 c!89337) b!824763))

(assert (= (and d!104765 (not c!89337)) b!824757))

(assert (= (and d!104765 res!562315) b!824764))

(assert (= (and b!824764 res!562317) b!824759))

(assert (= (and b!824764 (not res!562321)) b!824768))

(assert (= (and b!824768 res!562319) b!824756))

(assert (= (and b!824764 res!562322) b!824771))

(assert (= (and b!824771 c!89336) b!824755))

(assert (= (and b!824771 (not c!89336)) b!824760))

(assert (= (and b!824755 res!562320) b!824766))

(assert (= (or b!824755 b!824760) bm!35831))

(assert (= (and b!824771 res!562318) b!824754))

(assert (= (and b!824754 c!89339) b!824769))

(assert (= (and b!824754 (not c!89339)) b!824758))

(assert (= (and b!824769 res!562314) b!824770))

(assert (= (or b!824769 b!824758) bm!35828))

(declare-fun b_lambda!11077 () Bool)

(assert (=> (not b_lambda!11077) (not b!824756)))

(declare-fun t!22095 () Bool)

(declare-fun tb!4195 () Bool)

(assert (=> (and start!71014 (= defaultEntry!796 defaultEntry!796) t!22095) tb!4195))

(declare-fun result!7941 () Bool)

(assert (=> tb!4195 (= result!7941 tp_is_empty!14947)))

(assert (=> b!824756 t!22095))

(declare-fun b_and!22121 () Bool)

(assert (= b_and!22115 (and (=> t!22095 result!7941) b_and!22121)))

(assert (=> b!824756 m!766205))

(declare-fun m!766213 () Bool)

(assert (=> b!824756 m!766213))

(assert (=> b!824756 m!766205))

(declare-fun m!766215 () Bool)

(assert (=> b!824756 m!766215))

(declare-fun m!766217 () Bool)

(assert (=> b!824756 m!766217))

(assert (=> b!824756 m!766217))

(assert (=> b!824756 m!766213))

(declare-fun m!766219 () Bool)

(assert (=> b!824756 m!766219))

(assert (=> d!104765 m!766145))

(declare-fun m!766221 () Bool)

(assert (=> b!824761 m!766221))

(declare-fun m!766223 () Bool)

(assert (=> b!824770 m!766223))

(declare-fun m!766225 () Bool)

(assert (=> b!824766 m!766225))

(assert (=> bm!35833 m!766159))

(declare-fun m!766227 () Bool)

(assert (=> bm!35831 m!766227))

(assert (=> b!824768 m!766205))

(assert (=> b!824768 m!766205))

(declare-fun m!766229 () Bool)

(assert (=> b!824768 m!766229))

(assert (=> b!824759 m!766205))

(assert (=> b!824759 m!766205))

(assert (=> b!824759 m!766207))

(assert (=> b!824762 m!766205))

(assert (=> b!824762 m!766205))

(assert (=> b!824762 m!766207))

(declare-fun m!766231 () Bool)

(assert (=> bm!35829 m!766231))

(declare-fun m!766233 () Bool)

(assert (=> bm!35828 m!766233))

(assert (=> b!824763 m!766205))

(declare-fun m!766235 () Bool)

(assert (=> b!824763 m!766235))

(assert (=> b!824763 m!766159))

(declare-fun m!766237 () Bool)

(assert (=> b!824763 m!766237))

(declare-fun m!766239 () Bool)

(assert (=> b!824763 m!766239))

(declare-fun m!766241 () Bool)

(assert (=> b!824763 m!766241))

(declare-fun m!766243 () Bool)

(assert (=> b!824763 m!766243))

(declare-fun m!766245 () Bool)

(assert (=> b!824763 m!766245))

(declare-fun m!766247 () Bool)

(assert (=> b!824763 m!766247))

(declare-fun m!766249 () Bool)

(assert (=> b!824763 m!766249))

(assert (=> b!824763 m!766237))

(assert (=> b!824763 m!766243))

(declare-fun m!766251 () Bool)

(assert (=> b!824763 m!766251))

(declare-fun m!766253 () Bool)

(assert (=> b!824763 m!766253))

(declare-fun m!766255 () Bool)

(assert (=> b!824763 m!766255))

(declare-fun m!766257 () Bool)

(assert (=> b!824763 m!766257))

(declare-fun m!766259 () Bool)

(assert (=> b!824763 m!766259))

(assert (=> b!824763 m!766249))

(declare-fun m!766261 () Bool)

(assert (=> b!824763 m!766261))

(declare-fun m!766263 () Bool)

(assert (=> b!824763 m!766263))

(assert (=> b!824763 m!766253))

(assert (=> b!824641 d!104765))

(declare-fun d!104767 () Bool)

(declare-fun res!562327 () Bool)

(declare-fun e!458967 () Bool)

(assert (=> d!104767 (=> res!562327 e!458967)))

(assert (=> d!104767 (= res!562327 (bvsge #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(assert (=> d!104767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!458967)))

(declare-fun b!824782 () Bool)

(declare-fun e!458969 () Bool)

(assert (=> b!824782 (= e!458967 e!458969)))

(declare-fun c!89344 () Bool)

(assert (=> b!824782 (= c!89344 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824783 () Bool)

(declare-fun e!458968 () Bool)

(declare-fun call!35840 () Bool)

(assert (=> b!824783 (= e!458968 call!35840)))

(declare-fun bm!35837 () Bool)

(assert (=> bm!35837 (= call!35840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!824784 () Bool)

(assert (=> b!824784 (= e!458969 call!35840)))

(declare-fun b!824785 () Bool)

(assert (=> b!824785 (= e!458969 e!458968)))

(declare-fun lt!371905 () (_ BitVec 64))

(assert (=> b!824785 (= lt!371905 (select (arr!22072 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371906 () Unit!28224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46049 (_ BitVec 64) (_ BitVec 32)) Unit!28224)

(assert (=> b!824785 (= lt!371906 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!371905 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!824785 (arrayContainsKey!0 _keys!976 lt!371905 #b00000000000000000000000000000000)))

(declare-fun lt!371904 () Unit!28224)

(assert (=> b!824785 (= lt!371904 lt!371906)))

(declare-fun res!562328 () Bool)

(declare-datatypes ((SeekEntryResult!8729 0))(
  ( (MissingZero!8729 (index!37287 (_ BitVec 32))) (Found!8729 (index!37288 (_ BitVec 32))) (Intermediate!8729 (undefined!9541 Bool) (index!37289 (_ BitVec 32)) (x!69624 (_ BitVec 32))) (Undefined!8729) (MissingVacant!8729 (index!37290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46049 (_ BitVec 32)) SeekEntryResult!8729)

(assert (=> b!824785 (= res!562328 (= (seekEntryOrOpen!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8729 #b00000000000000000000000000000000)))))

(assert (=> b!824785 (=> (not res!562328) (not e!458968))))

(assert (= (and d!104767 (not res!562327)) b!824782))

(assert (= (and b!824782 c!89344) b!824785))

(assert (= (and b!824782 (not c!89344)) b!824784))

(assert (= (and b!824785 res!562328) b!824783))

(assert (= (or b!824783 b!824784) bm!35837))

(assert (=> b!824782 m!766205))

(assert (=> b!824782 m!766205))

(assert (=> b!824782 m!766207))

(declare-fun m!766265 () Bool)

(assert (=> bm!35837 m!766265))

(assert (=> b!824785 m!766205))

(declare-fun m!766267 () Bool)

(assert (=> b!824785 m!766267))

(declare-fun m!766269 () Bool)

(assert (=> b!824785 m!766269))

(assert (=> b!824785 m!766205))

(declare-fun m!766271 () Bool)

(assert (=> b!824785 m!766271))

(assert (=> b!824645 d!104767))

(declare-fun d!104769 () Bool)

(assert (=> d!104769 (= (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371909 () Unit!28224)

(declare-fun choose!1413 (array!46049 array!46051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 V!24931 V!24931 (_ BitVec 32) Int) Unit!28224)

(assert (=> d!104769 (= lt!371909 (choose!1413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104769 (validMask!0 mask!1312)))

(assert (=> d!104769 (= (lemmaNoChangeToArrayThenSameMapNoExtras!537 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371909)))

(declare-fun bs!23011 () Bool)

(assert (= bs!23011 d!104769))

(assert (=> bs!23011 m!766159))

(assert (=> bs!23011 m!766157))

(declare-fun m!766273 () Bool)

(assert (=> bs!23011 m!766273))

(assert (=> bs!23011 m!766145))

(assert (=> b!824643 d!104769))

(declare-fun b!824810 () Bool)

(declare-fun lt!371929 () Unit!28224)

(declare-fun lt!371927 () Unit!28224)

(assert (=> b!824810 (= lt!371929 lt!371927)))

(declare-fun lt!371925 () ListLongMap!8769)

(declare-fun lt!371926 () V!24931)

(declare-fun lt!371930 () (_ BitVec 64))

(declare-fun lt!371924 () (_ BitVec 64))

(assert (=> b!824810 (not (contains!4157 (+!1938 lt!371925 (tuple2!9957 lt!371930 lt!371926)) lt!371924))))

(declare-fun addStillNotContains!187 (ListLongMap!8769 (_ BitVec 64) V!24931 (_ BitVec 64)) Unit!28224)

(assert (=> b!824810 (= lt!371927 (addStillNotContains!187 lt!371925 lt!371930 lt!371926 lt!371924))))

(assert (=> b!824810 (= lt!371924 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!824810 (= lt!371926 (get!11726 (select (arr!22073 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824810 (= lt!371930 (select (arr!22072 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35843 () ListLongMap!8769)

(assert (=> b!824810 (= lt!371925 call!35843)))

(declare-fun e!458990 () ListLongMap!8769)

(assert (=> b!824810 (= e!458990 (+!1938 call!35843 (tuple2!9957 (select (arr!22072 _keys!976) #b00000000000000000000000000000000) (get!11726 (select (arr!22073 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824811 () Bool)

(declare-fun e!458984 () Bool)

(declare-fun lt!371928 () ListLongMap!8769)

(declare-fun isEmpty!648 (ListLongMap!8769) Bool)

(assert (=> b!824811 (= e!458984 (isEmpty!648 lt!371928))))

(declare-fun b!824812 () Bool)

(declare-fun e!458985 () Bool)

(declare-fun e!458988 () Bool)

(assert (=> b!824812 (= e!458985 e!458988)))

(assert (=> b!824812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun res!562340 () Bool)

(assert (=> b!824812 (= res!562340 (contains!4157 lt!371928 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824812 (=> (not res!562340) (not e!458988))))

(declare-fun b!824813 () Bool)

(declare-fun e!458989 () ListLongMap!8769)

(assert (=> b!824813 (= e!458989 e!458990)))

(declare-fun c!89353 () Bool)

(assert (=> b!824813 (= c!89353 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824814 () Bool)

(declare-fun e!458987 () Bool)

(assert (=> b!824814 (= e!458987 e!458985)))

(declare-fun c!89354 () Bool)

(declare-fun e!458986 () Bool)

(assert (=> b!824814 (= c!89354 e!458986)))

(declare-fun res!562337 () Bool)

(assert (=> b!824814 (=> (not res!562337) (not e!458986))))

(assert (=> b!824814 (= res!562337 (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun b!824815 () Bool)

(assert (=> b!824815 (= e!458984 (= lt!371928 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35840 () Bool)

(assert (=> bm!35840 (= call!35843 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!824816 () Bool)

(assert (=> b!824816 (= e!458990 call!35843)))

(declare-fun b!824817 () Bool)

(assert (=> b!824817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(assert (=> b!824817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22494 _values!788)))))

(assert (=> b!824817 (= e!458988 (= (apply!361 lt!371928 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)) (get!11726 (select (arr!22073 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104771 () Bool)

(assert (=> d!104771 e!458987))

(declare-fun res!562339 () Bool)

(assert (=> d!104771 (=> (not res!562339) (not e!458987))))

(assert (=> d!104771 (= res!562339 (not (contains!4157 lt!371928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104771 (= lt!371928 e!458989)))

(declare-fun c!89355 () Bool)

(assert (=> d!104771 (= c!89355 (bvsge #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(assert (=> d!104771 (validMask!0 mask!1312)))

(assert (=> d!104771 (= (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371928)))

(declare-fun b!824818 () Bool)

(assert (=> b!824818 (= e!458986 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824818 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824819 () Bool)

(assert (=> b!824819 (= e!458985 e!458984)))

(declare-fun c!89356 () Bool)

(assert (=> b!824819 (= c!89356 (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun b!824820 () Bool)

(declare-fun res!562338 () Bool)

(assert (=> b!824820 (=> (not res!562338) (not e!458987))))

(assert (=> b!824820 (= res!562338 (not (contains!4157 lt!371928 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!824821 () Bool)

(assert (=> b!824821 (= e!458989 (ListLongMap!8770 Nil!15755))))

(assert (= (and d!104771 c!89355) b!824821))

(assert (= (and d!104771 (not c!89355)) b!824813))

(assert (= (and b!824813 c!89353) b!824810))

(assert (= (and b!824813 (not c!89353)) b!824816))

(assert (= (or b!824810 b!824816) bm!35840))

(assert (= (and d!104771 res!562339) b!824820))

(assert (= (and b!824820 res!562338) b!824814))

(assert (= (and b!824814 res!562337) b!824818))

(assert (= (and b!824814 c!89354) b!824812))

(assert (= (and b!824814 (not c!89354)) b!824819))

(assert (= (and b!824812 res!562340) b!824817))

(assert (= (and b!824819 c!89356) b!824815))

(assert (= (and b!824819 (not c!89356)) b!824811))

(declare-fun b_lambda!11079 () Bool)

(assert (=> (not b_lambda!11079) (not b!824810)))

(assert (=> b!824810 t!22095))

(declare-fun b_and!22123 () Bool)

(assert (= b_and!22121 (and (=> t!22095 result!7941) b_and!22123)))

(declare-fun b_lambda!11081 () Bool)

(assert (=> (not b_lambda!11081) (not b!824817)))

(assert (=> b!824817 t!22095))

(declare-fun b_and!22125 () Bool)

(assert (= b_and!22123 (and (=> t!22095 result!7941) b_and!22125)))

(declare-fun m!766275 () Bool)

(assert (=> b!824820 m!766275))

(assert (=> b!824810 m!766217))

(assert (=> b!824810 m!766213))

(assert (=> b!824810 m!766219))

(declare-fun m!766277 () Bool)

(assert (=> b!824810 m!766277))

(assert (=> b!824810 m!766205))

(assert (=> b!824810 m!766213))

(declare-fun m!766279 () Bool)

(assert (=> b!824810 m!766279))

(declare-fun m!766281 () Bool)

(assert (=> b!824810 m!766281))

(declare-fun m!766283 () Bool)

(assert (=> b!824810 m!766283))

(assert (=> b!824810 m!766217))

(assert (=> b!824810 m!766281))

(declare-fun m!766285 () Bool)

(assert (=> d!104771 m!766285))

(assert (=> d!104771 m!766145))

(declare-fun m!766287 () Bool)

(assert (=> b!824815 m!766287))

(assert (=> b!824817 m!766205))

(assert (=> b!824817 m!766217))

(assert (=> b!824817 m!766213))

(assert (=> b!824817 m!766205))

(declare-fun m!766289 () Bool)

(assert (=> b!824817 m!766289))

(assert (=> b!824817 m!766217))

(assert (=> b!824817 m!766213))

(assert (=> b!824817 m!766219))

(assert (=> b!824818 m!766205))

(assert (=> b!824818 m!766205))

(assert (=> b!824818 m!766207))

(assert (=> b!824813 m!766205))

(assert (=> b!824813 m!766205))

(assert (=> b!824813 m!766207))

(declare-fun m!766291 () Bool)

(assert (=> b!824811 m!766291))

(assert (=> b!824812 m!766205))

(assert (=> b!824812 m!766205))

(declare-fun m!766293 () Bool)

(assert (=> b!824812 m!766293))

(assert (=> bm!35840 m!766287))

(assert (=> b!824643 d!104771))

(declare-fun b!824822 () Bool)

(declare-fun lt!371936 () Unit!28224)

(declare-fun lt!371934 () Unit!28224)

(assert (=> b!824822 (= lt!371936 lt!371934)))

(declare-fun lt!371932 () ListLongMap!8769)

(declare-fun lt!371937 () (_ BitVec 64))

(declare-fun lt!371931 () (_ BitVec 64))

(declare-fun lt!371933 () V!24931)

(assert (=> b!824822 (not (contains!4157 (+!1938 lt!371932 (tuple2!9957 lt!371937 lt!371933)) lt!371931))))

(assert (=> b!824822 (= lt!371934 (addStillNotContains!187 lt!371932 lt!371937 lt!371933 lt!371931))))

(assert (=> b!824822 (= lt!371931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!824822 (= lt!371933 (get!11726 (select (arr!22073 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824822 (= lt!371937 (select (arr!22072 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35844 () ListLongMap!8769)

(assert (=> b!824822 (= lt!371932 call!35844)))

(declare-fun e!458997 () ListLongMap!8769)

(assert (=> b!824822 (= e!458997 (+!1938 call!35844 (tuple2!9957 (select (arr!22072 _keys!976) #b00000000000000000000000000000000) (get!11726 (select (arr!22073 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824823 () Bool)

(declare-fun e!458991 () Bool)

(declare-fun lt!371935 () ListLongMap!8769)

(assert (=> b!824823 (= e!458991 (isEmpty!648 lt!371935))))

(declare-fun b!824824 () Bool)

(declare-fun e!458992 () Bool)

(declare-fun e!458995 () Bool)

(assert (=> b!824824 (= e!458992 e!458995)))

(assert (=> b!824824 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun res!562344 () Bool)

(assert (=> b!824824 (= res!562344 (contains!4157 lt!371935 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824824 (=> (not res!562344) (not e!458995))))

(declare-fun b!824825 () Bool)

(declare-fun e!458996 () ListLongMap!8769)

(assert (=> b!824825 (= e!458996 e!458997)))

(declare-fun c!89357 () Bool)

(assert (=> b!824825 (= c!89357 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824826 () Bool)

(declare-fun e!458994 () Bool)

(assert (=> b!824826 (= e!458994 e!458992)))

(declare-fun c!89358 () Bool)

(declare-fun e!458993 () Bool)

(assert (=> b!824826 (= c!89358 e!458993)))

(declare-fun res!562341 () Bool)

(assert (=> b!824826 (=> (not res!562341) (not e!458993))))

(assert (=> b!824826 (= res!562341 (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun b!824827 () Bool)

(assert (=> b!824827 (= e!458991 (= lt!371935 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35841 () Bool)

(assert (=> bm!35841 (= call!35844 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!824828 () Bool)

(assert (=> b!824828 (= e!458997 call!35844)))

(declare-fun b!824829 () Bool)

(assert (=> b!824829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(assert (=> b!824829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22494 _values!788)))))

(assert (=> b!824829 (= e!458995 (= (apply!361 lt!371935 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)) (get!11726 (select (arr!22073 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104773 () Bool)

(assert (=> d!104773 e!458994))

(declare-fun res!562343 () Bool)

(assert (=> d!104773 (=> (not res!562343) (not e!458994))))

(assert (=> d!104773 (= res!562343 (not (contains!4157 lt!371935 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104773 (= lt!371935 e!458996)))

(declare-fun c!89359 () Bool)

(assert (=> d!104773 (= c!89359 (bvsge #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(assert (=> d!104773 (validMask!0 mask!1312)))

(assert (=> d!104773 (= (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371935)))

(declare-fun b!824830 () Bool)

(assert (=> b!824830 (= e!458993 (validKeyInArray!0 (select (arr!22072 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824830 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824831 () Bool)

(assert (=> b!824831 (= e!458992 e!458991)))

(declare-fun c!89360 () Bool)

(assert (=> b!824831 (= c!89360 (bvslt #b00000000000000000000000000000000 (size!22493 _keys!976)))))

(declare-fun b!824832 () Bool)

(declare-fun res!562342 () Bool)

(assert (=> b!824832 (=> (not res!562342) (not e!458994))))

(assert (=> b!824832 (= res!562342 (not (contains!4157 lt!371935 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!824833 () Bool)

(assert (=> b!824833 (= e!458996 (ListLongMap!8770 Nil!15755))))

(assert (= (and d!104773 c!89359) b!824833))

(assert (= (and d!104773 (not c!89359)) b!824825))

(assert (= (and b!824825 c!89357) b!824822))

(assert (= (and b!824825 (not c!89357)) b!824828))

(assert (= (or b!824822 b!824828) bm!35841))

(assert (= (and d!104773 res!562343) b!824832))

(assert (= (and b!824832 res!562342) b!824826))

(assert (= (and b!824826 res!562341) b!824830))

(assert (= (and b!824826 c!89358) b!824824))

(assert (= (and b!824826 (not c!89358)) b!824831))

(assert (= (and b!824824 res!562344) b!824829))

(assert (= (and b!824831 c!89360) b!824827))

(assert (= (and b!824831 (not c!89360)) b!824823))

(declare-fun b_lambda!11083 () Bool)

(assert (=> (not b_lambda!11083) (not b!824822)))

(assert (=> b!824822 t!22095))

(declare-fun b_and!22127 () Bool)

(assert (= b_and!22125 (and (=> t!22095 result!7941) b_and!22127)))

(declare-fun b_lambda!11085 () Bool)

(assert (=> (not b_lambda!11085) (not b!824829)))

(assert (=> b!824829 t!22095))

(declare-fun b_and!22129 () Bool)

(assert (= b_and!22127 (and (=> t!22095 result!7941) b_and!22129)))

(declare-fun m!766295 () Bool)

(assert (=> b!824832 m!766295))

(assert (=> b!824822 m!766217))

(assert (=> b!824822 m!766213))

(assert (=> b!824822 m!766219))

(declare-fun m!766297 () Bool)

(assert (=> b!824822 m!766297))

(assert (=> b!824822 m!766205))

(assert (=> b!824822 m!766213))

(declare-fun m!766299 () Bool)

(assert (=> b!824822 m!766299))

(declare-fun m!766301 () Bool)

(assert (=> b!824822 m!766301))

(declare-fun m!766303 () Bool)

(assert (=> b!824822 m!766303))

(assert (=> b!824822 m!766217))

(assert (=> b!824822 m!766301))

(declare-fun m!766305 () Bool)

(assert (=> d!104773 m!766305))

(assert (=> d!104773 m!766145))

(declare-fun m!766307 () Bool)

(assert (=> b!824827 m!766307))

(assert (=> b!824829 m!766205))

(assert (=> b!824829 m!766217))

(assert (=> b!824829 m!766213))

(assert (=> b!824829 m!766205))

(declare-fun m!766309 () Bool)

(assert (=> b!824829 m!766309))

(assert (=> b!824829 m!766217))

(assert (=> b!824829 m!766213))

(assert (=> b!824829 m!766219))

(assert (=> b!824830 m!766205))

(assert (=> b!824830 m!766205))

(assert (=> b!824830 m!766207))

(assert (=> b!824825 m!766205))

(assert (=> b!824825 m!766205))

(assert (=> b!824825 m!766207))

(declare-fun m!766311 () Bool)

(assert (=> b!824823 m!766311))

(assert (=> b!824824 m!766205))

(assert (=> b!824824 m!766205))

(declare-fun m!766313 () Bool)

(assert (=> b!824824 m!766313))

(assert (=> bm!35841 m!766307))

(assert (=> b!824643 d!104773))

(declare-fun d!104775 () Bool)

(assert (=> d!104775 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71014 d!104775))

(declare-fun d!104777 () Bool)

(assert (=> d!104777 (= (array_inv!17673 _keys!976) (bvsge (size!22493 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71014 d!104777))

(declare-fun d!104779 () Bool)

(assert (=> d!104779 (= (array_inv!17674 _values!788) (bvsge (size!22494 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71014 d!104779))

(declare-fun mapNonEmpty!24049 () Bool)

(declare-fun mapRes!24049 () Bool)

(declare-fun tp!46480 () Bool)

(declare-fun e!459002 () Bool)

(assert (=> mapNonEmpty!24049 (= mapRes!24049 (and tp!46480 e!459002))))

(declare-fun mapRest!24049 () (Array (_ BitVec 32) ValueCell!7058))

(declare-fun mapValue!24049 () ValueCell!7058)

(declare-fun mapKey!24049 () (_ BitVec 32))

(assert (=> mapNonEmpty!24049 (= mapRest!24040 (store mapRest!24049 mapKey!24049 mapValue!24049))))

(declare-fun b!824840 () Bool)

(assert (=> b!824840 (= e!459002 tp_is_empty!14947)))

(declare-fun b!824841 () Bool)

(declare-fun e!459003 () Bool)

(assert (=> b!824841 (= e!459003 tp_is_empty!14947)))

(declare-fun condMapEmpty!24049 () Bool)

(declare-fun mapDefault!24049 () ValueCell!7058)

(assert (=> mapNonEmpty!24040 (= condMapEmpty!24049 (= mapRest!24040 ((as const (Array (_ BitVec 32) ValueCell!7058)) mapDefault!24049)))))

(assert (=> mapNonEmpty!24040 (= tp!46465 (and e!459003 mapRes!24049))))

(declare-fun mapIsEmpty!24049 () Bool)

(assert (=> mapIsEmpty!24049 mapRes!24049))

(assert (= (and mapNonEmpty!24040 condMapEmpty!24049) mapIsEmpty!24049))

(assert (= (and mapNonEmpty!24040 (not condMapEmpty!24049)) mapNonEmpty!24049))

(assert (= (and mapNonEmpty!24049 ((_ is ValueCellFull!7058) mapValue!24049)) b!824840))

(assert (= (and mapNonEmpty!24040 ((_ is ValueCellFull!7058) mapDefault!24049)) b!824841))

(declare-fun m!766315 () Bool)

(assert (=> mapNonEmpty!24049 m!766315))

(declare-fun b_lambda!11087 () Bool)

(assert (= b_lambda!11085 (or (and start!71014 b_free!13237) b_lambda!11087)))

(declare-fun b_lambda!11089 () Bool)

(assert (= b_lambda!11079 (or (and start!71014 b_free!13237) b_lambda!11089)))

(declare-fun b_lambda!11091 () Bool)

(assert (= b_lambda!11083 (or (and start!71014 b_free!13237) b_lambda!11091)))

(declare-fun b_lambda!11093 () Bool)

(assert (= b_lambda!11077 (or (and start!71014 b_free!13237) b_lambda!11093)))

(declare-fun b_lambda!11095 () Bool)

(assert (= b_lambda!11081 (or (and start!71014 b_free!13237) b_lambda!11095)))

(check-sat (not b_lambda!11087) (not b!824815) (not b!824810) (not d!104769) (not b!824768) (not b!824785) (not b!824813) (not b_lambda!11095) (not b!824825) (not bm!35829) (not b!824829) (not b!824770) (not b_lambda!11093) (not b!824830) (not b!824818) (not b!824822) (not b!824811) (not b!824759) (not b!824782) (not bm!35831) (not d!104773) (not b!824820) (not b!824823) (not b!824817) (not mapNonEmpty!24049) (not b!824766) (not bm!35833) tp_is_empty!14947 (not b_lambda!11091) (not b!824827) (not d!104765) (not b_lambda!11089) (not b!824708) (not bm!35828) (not bm!35837) (not d!104771) (not b!824812) (not b!824704) (not bm!35840) (not b!824763) (not b!824706) (not bm!35841) (not b!824824) (not b!824756) (not b!824832) (not bm!35813) b_and!22129 (not b!824761) (not b!824762) (not b_next!13237))
(check-sat b_and!22129 (not b_next!13237))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71200 () Bool)

(assert start!71200)

(declare-fun b_free!13237 () Bool)

(declare-fun b_next!13237 () Bool)

(assert (=> start!71200 (= b_free!13237 (not b_next!13237))))

(declare-fun tp!46465 () Bool)

(declare-fun b_and!22151 () Bool)

(assert (=> start!71200 (= tp!46465 b_and!22151)))

(declare-fun b!825778 () Bool)

(declare-fun res!562707 () Bool)

(declare-fun e!459598 () Bool)

(assert (=> b!825778 (=> (not res!562707) (not e!459598))))

(declare-datatypes ((array!46081 0))(
  ( (array!46082 (arr!22083 (Array (_ BitVec 32) (_ BitVec 64))) (size!22503 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46081)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24931 0))(
  ( (V!24932 (val!7521 Int)) )
))
(declare-datatypes ((ValueCell!7058 0))(
  ( (ValueCellFull!7058 (v!9954 V!24931)) (EmptyCell!7058) )
))
(declare-datatypes ((array!46083 0))(
  ( (array!46084 (arr!22084 (Array (_ BitVec 32) ValueCell!7058)) (size!22504 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46083)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825778 (= res!562707 (and (= (size!22504 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22503 _keys!976) (size!22504 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825779 () Bool)

(declare-fun res!562705 () Bool)

(assert (=> b!825779 (=> (not res!562705) (not e!459598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46081 (_ BitVec 32)) Bool)

(assert (=> b!825779 (= res!562705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825780 () Bool)

(declare-fun res!562706 () Bool)

(assert (=> b!825780 (=> (not res!562706) (not e!459598))))

(declare-datatypes ((List!15659 0))(
  ( (Nil!15656) (Cons!15655 (h!16790 (_ BitVec 64)) (t!21994 List!15659)) )
))
(declare-fun arrayNoDuplicates!0 (array!46081 (_ BitVec 32) List!15659) Bool)

(assert (=> b!825780 (= res!562706 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15656))))

(declare-fun b!825781 () Bool)

(declare-fun e!459599 () Bool)

(assert (=> b!825781 (= e!459599 (bvsle #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun zeroValueBefore!34 () V!24931)

(declare-fun minValue!754 () V!24931)

(declare-datatypes ((tuple2!9874 0))(
  ( (tuple2!9875 (_1!4948 (_ BitVec 64)) (_2!4948 V!24931)) )
))
(declare-datatypes ((List!15660 0))(
  ( (Nil!15657) (Cons!15656 (h!16791 tuple2!9874) (t!21995 List!15660)) )
))
(declare-datatypes ((ListLongMap!8699 0))(
  ( (ListLongMap!8700 (toList!4365 List!15660)) )
))
(declare-fun lt!372404 () ListLongMap!8699)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2492 (array!46081 array!46083 (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 (_ BitVec 32) Int) ListLongMap!8699)

(assert (=> b!825781 (= lt!372404 (getCurrentListMap!2492 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825782 () Bool)

(declare-fun e!459601 () Bool)

(declare-fun tp_is_empty!14947 () Bool)

(assert (=> b!825782 (= e!459601 tp_is_empty!14947)))

(declare-fun b!825783 () Bool)

(declare-fun e!459597 () Bool)

(assert (=> b!825783 (= e!459597 tp_is_empty!14947)))

(declare-fun b!825784 () Bool)

(declare-fun e!459600 () Bool)

(declare-fun mapRes!24040 () Bool)

(assert (=> b!825784 (= e!459600 (and e!459597 mapRes!24040))))

(declare-fun condMapEmpty!24040 () Bool)

(declare-fun mapDefault!24040 () ValueCell!7058)

(assert (=> b!825784 (= condMapEmpty!24040 (= (arr!22084 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7058)) mapDefault!24040)))))

(declare-fun mapIsEmpty!24040 () Bool)

(assert (=> mapIsEmpty!24040 mapRes!24040))

(declare-fun res!562704 () Bool)

(assert (=> start!71200 (=> (not res!562704) (not e!459598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71200 (= res!562704 (validMask!0 mask!1312))))

(assert (=> start!71200 e!459598))

(assert (=> start!71200 tp_is_empty!14947))

(declare-fun array_inv!17651 (array!46081) Bool)

(assert (=> start!71200 (array_inv!17651 _keys!976)))

(assert (=> start!71200 true))

(declare-fun array_inv!17652 (array!46083) Bool)

(assert (=> start!71200 (and (array_inv!17652 _values!788) e!459600)))

(assert (=> start!71200 tp!46465))

(declare-fun b!825785 () Bool)

(assert (=> b!825785 (= e!459598 (not e!459599))))

(declare-fun res!562708 () Bool)

(assert (=> b!825785 (=> res!562708 e!459599)))

(assert (=> b!825785 (= res!562708 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372403 () ListLongMap!8699)

(declare-fun lt!372401 () ListLongMap!8699)

(assert (=> b!825785 (= lt!372403 lt!372401)))

(declare-datatypes ((Unit!28281 0))(
  ( (Unit!28282) )
))
(declare-fun lt!372402 () Unit!28281)

(declare-fun zeroValueAfter!34 () V!24931)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!535 (array!46081 array!46083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 V!24931 V!24931 (_ BitVec 32) Int) Unit!28281)

(assert (=> b!825785 (= lt!372402 (lemmaNoChangeToArrayThenSameMapNoExtras!535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2447 (array!46081 array!46083 (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 (_ BitVec 32) Int) ListLongMap!8699)

(assert (=> b!825785 (= lt!372401 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825785 (= lt!372403 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24040 () Bool)

(declare-fun tp!46464 () Bool)

(assert (=> mapNonEmpty!24040 (= mapRes!24040 (and tp!46464 e!459601))))

(declare-fun mapValue!24040 () ValueCell!7058)

(declare-fun mapRest!24040 () (Array (_ BitVec 32) ValueCell!7058))

(declare-fun mapKey!24040 () (_ BitVec 32))

(assert (=> mapNonEmpty!24040 (= (arr!22084 _values!788) (store mapRest!24040 mapKey!24040 mapValue!24040))))

(assert (= (and start!71200 res!562704) b!825778))

(assert (= (and b!825778 res!562707) b!825779))

(assert (= (and b!825779 res!562705) b!825780))

(assert (= (and b!825780 res!562706) b!825785))

(assert (= (and b!825785 (not res!562708)) b!825781))

(assert (= (and b!825784 condMapEmpty!24040) mapIsEmpty!24040))

(assert (= (and b!825784 (not condMapEmpty!24040)) mapNonEmpty!24040))

(get-info :version)

(assert (= (and mapNonEmpty!24040 ((_ is ValueCellFull!7058) mapValue!24040)) b!825782))

(assert (= (and b!825784 ((_ is ValueCellFull!7058) mapDefault!24040)) b!825783))

(assert (= start!71200 b!825784))

(declare-fun m!768179 () Bool)

(assert (=> b!825779 m!768179))

(declare-fun m!768181 () Bool)

(assert (=> b!825781 m!768181))

(declare-fun m!768183 () Bool)

(assert (=> start!71200 m!768183))

(declare-fun m!768185 () Bool)

(assert (=> start!71200 m!768185))

(declare-fun m!768187 () Bool)

(assert (=> start!71200 m!768187))

(declare-fun m!768189 () Bool)

(assert (=> b!825785 m!768189))

(declare-fun m!768191 () Bool)

(assert (=> b!825785 m!768191))

(declare-fun m!768193 () Bool)

(assert (=> b!825785 m!768193))

(declare-fun m!768195 () Bool)

(assert (=> mapNonEmpty!24040 m!768195))

(declare-fun m!768197 () Bool)

(assert (=> b!825780 m!768197))

(check-sat (not start!71200) (not mapNonEmpty!24040) (not b!825780) (not b!825781) (not b!825785) (not b_next!13237) b_and!22151 tp_is_empty!14947 (not b!825779))
(check-sat b_and!22151 (not b_next!13237))
(get-model)

(declare-fun d!105279 () Bool)

(assert (=> d!105279 (= (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372431 () Unit!28281)

(declare-fun choose!1410 (array!46081 array!46083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24931 V!24931 V!24931 V!24931 (_ BitVec 32) Int) Unit!28281)

(assert (=> d!105279 (= lt!372431 (choose!1410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105279 (validMask!0 mask!1312)))

(assert (=> d!105279 (= (lemmaNoChangeToArrayThenSameMapNoExtras!535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372431)))

(declare-fun bs!23057 () Bool)

(assert (= bs!23057 d!105279))

(assert (=> bs!23057 m!768193))

(assert (=> bs!23057 m!768191))

(declare-fun m!768239 () Bool)

(assert (=> bs!23057 m!768239))

(assert (=> bs!23057 m!768183))

(assert (=> b!825785 d!105279))

(declare-fun call!35887 () ListLongMap!8699)

(declare-fun bm!35884 () Bool)

(assert (=> bm!35884 (= call!35887 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!825859 () Bool)

(declare-fun e!459653 () Bool)

(declare-fun e!459652 () Bool)

(assert (=> b!825859 (= e!459653 e!459652)))

(assert (=> b!825859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun res!562750 () Bool)

(declare-fun lt!372447 () ListLongMap!8699)

(declare-fun contains!4155 (ListLongMap!8699 (_ BitVec 64)) Bool)

(assert (=> b!825859 (= res!562750 (contains!4155 lt!372447 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825859 (=> (not res!562750) (not e!459652))))

(declare-fun b!825860 () Bool)

(declare-fun e!459657 () Bool)

(assert (=> b!825860 (= e!459653 e!459657)))

(declare-fun c!89676 () Bool)

(assert (=> b!825860 (= c!89676 (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun b!825861 () Bool)

(assert (=> b!825861 (= e!459657 (= lt!372447 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!825862 () Bool)

(declare-fun res!562749 () Bool)

(declare-fun e!459654 () Bool)

(assert (=> b!825862 (=> (not res!562749) (not e!459654))))

(assert (=> b!825862 (= res!562749 (not (contains!4155 lt!372447 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!825863 () Bool)

(declare-fun isEmpty!649 (ListLongMap!8699) Bool)

(assert (=> b!825863 (= e!459657 (isEmpty!649 lt!372447))))

(declare-fun b!825864 () Bool)

(declare-fun e!459655 () ListLongMap!8699)

(assert (=> b!825864 (= e!459655 call!35887)))

(declare-fun b!825865 () Bool)

(assert (=> b!825865 (= e!459654 e!459653)))

(declare-fun c!89678 () Bool)

(declare-fun e!459658 () Bool)

(assert (=> b!825865 (= c!89678 e!459658)))

(declare-fun res!562747 () Bool)

(assert (=> b!825865 (=> (not res!562747) (not e!459658))))

(assert (=> b!825865 (= res!562747 (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun b!825866 () Bool)

(assert (=> b!825866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(assert (=> b!825866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22504 _values!788)))))

(declare-fun apply!361 (ListLongMap!8699 (_ BitVec 64)) V!24931)

(declare-fun get!11723 (ValueCell!7058 V!24931) V!24931)

(declare-fun dynLambda!969 (Int (_ BitVec 64)) V!24931)

(assert (=> b!825866 (= e!459652 (= (apply!361 lt!372447 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)) (get!11723 (select (arr!22084 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825858 () Bool)

(declare-fun e!459656 () ListLongMap!8699)

(assert (=> b!825858 (= e!459656 (ListLongMap!8700 Nil!15657))))

(declare-fun d!105281 () Bool)

(assert (=> d!105281 e!459654))

(declare-fun res!562748 () Bool)

(assert (=> d!105281 (=> (not res!562748) (not e!459654))))

(assert (=> d!105281 (= res!562748 (not (contains!4155 lt!372447 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105281 (= lt!372447 e!459656)))

(declare-fun c!89679 () Bool)

(assert (=> d!105281 (= c!89679 (bvsge #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(assert (=> d!105281 (validMask!0 mask!1312)))

(assert (=> d!105281 (= (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372447)))

(declare-fun b!825867 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!825867 (= e!459658 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825867 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!825868 () Bool)

(declare-fun lt!372452 () Unit!28281)

(declare-fun lt!372451 () Unit!28281)

(assert (=> b!825868 (= lt!372452 lt!372451)))

(declare-fun lt!372448 () ListLongMap!8699)

(declare-fun lt!372446 () (_ BitVec 64))

(declare-fun lt!372449 () (_ BitVec 64))

(declare-fun lt!372450 () V!24931)

(declare-fun +!1914 (ListLongMap!8699 tuple2!9874) ListLongMap!8699)

(assert (=> b!825868 (not (contains!4155 (+!1914 lt!372448 (tuple2!9875 lt!372446 lt!372450)) lt!372449))))

(declare-fun addStillNotContains!188 (ListLongMap!8699 (_ BitVec 64) V!24931 (_ BitVec 64)) Unit!28281)

(assert (=> b!825868 (= lt!372451 (addStillNotContains!188 lt!372448 lt!372446 lt!372450 lt!372449))))

(assert (=> b!825868 (= lt!372449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!825868 (= lt!372450 (get!11723 (select (arr!22084 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!825868 (= lt!372446 (select (arr!22083 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825868 (= lt!372448 call!35887)))

(assert (=> b!825868 (= e!459655 (+!1914 call!35887 (tuple2!9875 (select (arr!22083 _keys!976) #b00000000000000000000000000000000) (get!11723 (select (arr!22084 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!825869 () Bool)

(assert (=> b!825869 (= e!459656 e!459655)))

(declare-fun c!89677 () Bool)

(assert (=> b!825869 (= c!89677 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105281 c!89679) b!825858))

(assert (= (and d!105281 (not c!89679)) b!825869))

(assert (= (and b!825869 c!89677) b!825868))

(assert (= (and b!825869 (not c!89677)) b!825864))

(assert (= (or b!825868 b!825864) bm!35884))

(assert (= (and d!105281 res!562748) b!825862))

(assert (= (and b!825862 res!562749) b!825865))

(assert (= (and b!825865 res!562747) b!825867))

(assert (= (and b!825865 c!89678) b!825859))

(assert (= (and b!825865 (not c!89678)) b!825860))

(assert (= (and b!825859 res!562750) b!825866))

(assert (= (and b!825860 c!89676) b!825861))

(assert (= (and b!825860 (not c!89676)) b!825863))

(declare-fun b_lambda!11109 () Bool)

(assert (=> (not b_lambda!11109) (not b!825866)))

(declare-fun t!22001 () Bool)

(declare-fun tb!4195 () Bool)

(assert (=> (and start!71200 (= defaultEntry!796 defaultEntry!796) t!22001) tb!4195))

(declare-fun result!7941 () Bool)

(assert (=> tb!4195 (= result!7941 tp_is_empty!14947)))

(assert (=> b!825866 t!22001))

(declare-fun b_and!22157 () Bool)

(assert (= b_and!22151 (and (=> t!22001 result!7941) b_and!22157)))

(declare-fun b_lambda!11111 () Bool)

(assert (=> (not b_lambda!11111) (not b!825868)))

(assert (=> b!825868 t!22001))

(declare-fun b_and!22159 () Bool)

(assert (= b_and!22157 (and (=> t!22001 result!7941) b_and!22159)))

(declare-fun m!768241 () Bool)

(assert (=> b!825862 m!768241))

(declare-fun m!768243 () Bool)

(assert (=> b!825866 m!768243))

(declare-fun m!768245 () Bool)

(assert (=> b!825866 m!768245))

(declare-fun m!768247 () Bool)

(assert (=> b!825866 m!768247))

(declare-fun m!768249 () Bool)

(assert (=> b!825866 m!768249))

(assert (=> b!825866 m!768247))

(assert (=> b!825866 m!768243))

(declare-fun m!768251 () Bool)

(assert (=> b!825866 m!768251))

(assert (=> b!825866 m!768245))

(declare-fun m!768253 () Bool)

(assert (=> d!105281 m!768253))

(assert (=> d!105281 m!768183))

(assert (=> b!825869 m!768243))

(assert (=> b!825869 m!768243))

(declare-fun m!768255 () Bool)

(assert (=> b!825869 m!768255))

(assert (=> b!825867 m!768243))

(assert (=> b!825867 m!768243))

(assert (=> b!825867 m!768255))

(assert (=> b!825859 m!768243))

(assert (=> b!825859 m!768243))

(declare-fun m!768257 () Bool)

(assert (=> b!825859 m!768257))

(declare-fun m!768259 () Bool)

(assert (=> b!825861 m!768259))

(assert (=> bm!35884 m!768259))

(declare-fun m!768261 () Bool)

(assert (=> b!825863 m!768261))

(declare-fun m!768263 () Bool)

(assert (=> b!825868 m!768263))

(assert (=> b!825868 m!768243))

(assert (=> b!825868 m!768245))

(assert (=> b!825868 m!768247))

(assert (=> b!825868 m!768249))

(declare-fun m!768265 () Bool)

(assert (=> b!825868 m!768265))

(assert (=> b!825868 m!768247))

(assert (=> b!825868 m!768245))

(declare-fun m!768267 () Bool)

(assert (=> b!825868 m!768267))

(assert (=> b!825868 m!768265))

(declare-fun m!768269 () Bool)

(assert (=> b!825868 m!768269))

(assert (=> b!825785 d!105281))

(declare-fun bm!35885 () Bool)

(declare-fun call!35888 () ListLongMap!8699)

(assert (=> bm!35885 (= call!35888 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!825873 () Bool)

(declare-fun e!459660 () Bool)

(declare-fun e!459659 () Bool)

(assert (=> b!825873 (= e!459660 e!459659)))

(assert (=> b!825873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun res!562754 () Bool)

(declare-fun lt!372454 () ListLongMap!8699)

(assert (=> b!825873 (= res!562754 (contains!4155 lt!372454 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825873 (=> (not res!562754) (not e!459659))))

(declare-fun b!825874 () Bool)

(declare-fun e!459664 () Bool)

(assert (=> b!825874 (= e!459660 e!459664)))

(declare-fun c!89680 () Bool)

(assert (=> b!825874 (= c!89680 (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun b!825875 () Bool)

(assert (=> b!825875 (= e!459664 (= lt!372454 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!825876 () Bool)

(declare-fun res!562753 () Bool)

(declare-fun e!459661 () Bool)

(assert (=> b!825876 (=> (not res!562753) (not e!459661))))

(assert (=> b!825876 (= res!562753 (not (contains!4155 lt!372454 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!825877 () Bool)

(assert (=> b!825877 (= e!459664 (isEmpty!649 lt!372454))))

(declare-fun b!825878 () Bool)

(declare-fun e!459662 () ListLongMap!8699)

(assert (=> b!825878 (= e!459662 call!35888)))

(declare-fun b!825879 () Bool)

(assert (=> b!825879 (= e!459661 e!459660)))

(declare-fun c!89682 () Bool)

(declare-fun e!459665 () Bool)

(assert (=> b!825879 (= c!89682 e!459665)))

(declare-fun res!562751 () Bool)

(assert (=> b!825879 (=> (not res!562751) (not e!459665))))

(assert (=> b!825879 (= res!562751 (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun b!825880 () Bool)

(assert (=> b!825880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(assert (=> b!825880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22504 _values!788)))))

(assert (=> b!825880 (= e!459659 (= (apply!361 lt!372454 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)) (get!11723 (select (arr!22084 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825872 () Bool)

(declare-fun e!459663 () ListLongMap!8699)

(assert (=> b!825872 (= e!459663 (ListLongMap!8700 Nil!15657))))

(declare-fun d!105283 () Bool)

(assert (=> d!105283 e!459661))

(declare-fun res!562752 () Bool)

(assert (=> d!105283 (=> (not res!562752) (not e!459661))))

(assert (=> d!105283 (= res!562752 (not (contains!4155 lt!372454 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105283 (= lt!372454 e!459663)))

(declare-fun c!89683 () Bool)

(assert (=> d!105283 (= c!89683 (bvsge #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(assert (=> d!105283 (validMask!0 mask!1312)))

(assert (=> d!105283 (= (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372454)))

(declare-fun b!825881 () Bool)

(assert (=> b!825881 (= e!459665 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825881 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!825882 () Bool)

(declare-fun lt!372459 () Unit!28281)

(declare-fun lt!372458 () Unit!28281)

(assert (=> b!825882 (= lt!372459 lt!372458)))

(declare-fun lt!372453 () (_ BitVec 64))

(declare-fun lt!372455 () ListLongMap!8699)

(declare-fun lt!372457 () V!24931)

(declare-fun lt!372456 () (_ BitVec 64))

(assert (=> b!825882 (not (contains!4155 (+!1914 lt!372455 (tuple2!9875 lt!372453 lt!372457)) lt!372456))))

(assert (=> b!825882 (= lt!372458 (addStillNotContains!188 lt!372455 lt!372453 lt!372457 lt!372456))))

(assert (=> b!825882 (= lt!372456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!825882 (= lt!372457 (get!11723 (select (arr!22084 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!825882 (= lt!372453 (select (arr!22083 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825882 (= lt!372455 call!35888)))

(assert (=> b!825882 (= e!459662 (+!1914 call!35888 (tuple2!9875 (select (arr!22083 _keys!976) #b00000000000000000000000000000000) (get!11723 (select (arr!22084 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!825883 () Bool)

(assert (=> b!825883 (= e!459663 e!459662)))

(declare-fun c!89681 () Bool)

(assert (=> b!825883 (= c!89681 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105283 c!89683) b!825872))

(assert (= (and d!105283 (not c!89683)) b!825883))

(assert (= (and b!825883 c!89681) b!825882))

(assert (= (and b!825883 (not c!89681)) b!825878))

(assert (= (or b!825882 b!825878) bm!35885))

(assert (= (and d!105283 res!562752) b!825876))

(assert (= (and b!825876 res!562753) b!825879))

(assert (= (and b!825879 res!562751) b!825881))

(assert (= (and b!825879 c!89682) b!825873))

(assert (= (and b!825879 (not c!89682)) b!825874))

(assert (= (and b!825873 res!562754) b!825880))

(assert (= (and b!825874 c!89680) b!825875))

(assert (= (and b!825874 (not c!89680)) b!825877))

(declare-fun b_lambda!11113 () Bool)

(assert (=> (not b_lambda!11113) (not b!825880)))

(assert (=> b!825880 t!22001))

(declare-fun b_and!22161 () Bool)

(assert (= b_and!22159 (and (=> t!22001 result!7941) b_and!22161)))

(declare-fun b_lambda!11115 () Bool)

(assert (=> (not b_lambda!11115) (not b!825882)))

(assert (=> b!825882 t!22001))

(declare-fun b_and!22163 () Bool)

(assert (= b_and!22161 (and (=> t!22001 result!7941) b_and!22163)))

(declare-fun m!768271 () Bool)

(assert (=> b!825876 m!768271))

(assert (=> b!825880 m!768243))

(assert (=> b!825880 m!768245))

(assert (=> b!825880 m!768247))

(assert (=> b!825880 m!768249))

(assert (=> b!825880 m!768247))

(assert (=> b!825880 m!768243))

(declare-fun m!768273 () Bool)

(assert (=> b!825880 m!768273))

(assert (=> b!825880 m!768245))

(declare-fun m!768275 () Bool)

(assert (=> d!105283 m!768275))

(assert (=> d!105283 m!768183))

(assert (=> b!825883 m!768243))

(assert (=> b!825883 m!768243))

(assert (=> b!825883 m!768255))

(assert (=> b!825881 m!768243))

(assert (=> b!825881 m!768243))

(assert (=> b!825881 m!768255))

(assert (=> b!825873 m!768243))

(assert (=> b!825873 m!768243))

(declare-fun m!768277 () Bool)

(assert (=> b!825873 m!768277))

(declare-fun m!768279 () Bool)

(assert (=> b!825875 m!768279))

(assert (=> bm!35885 m!768279))

(declare-fun m!768281 () Bool)

(assert (=> b!825877 m!768281))

(declare-fun m!768283 () Bool)

(assert (=> b!825882 m!768283))

(assert (=> b!825882 m!768243))

(assert (=> b!825882 m!768245))

(assert (=> b!825882 m!768247))

(assert (=> b!825882 m!768249))

(declare-fun m!768285 () Bool)

(assert (=> b!825882 m!768285))

(assert (=> b!825882 m!768247))

(assert (=> b!825882 m!768245))

(declare-fun m!768287 () Bool)

(assert (=> b!825882 m!768287))

(assert (=> b!825882 m!768285))

(declare-fun m!768289 () Bool)

(assert (=> b!825882 m!768289))

(assert (=> b!825785 d!105283))

(declare-fun d!105285 () Bool)

(declare-fun res!562763 () Bool)

(declare-fun e!459674 () Bool)

(assert (=> d!105285 (=> res!562763 e!459674)))

(assert (=> d!105285 (= res!562763 (bvsge #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(assert (=> d!105285 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15656) e!459674)))

(declare-fun bm!35888 () Bool)

(declare-fun call!35891 () Bool)

(declare-fun c!89686 () Bool)

(assert (=> bm!35888 (= call!35891 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89686 (Cons!15655 (select (arr!22083 _keys!976) #b00000000000000000000000000000000) Nil!15656) Nil!15656)))))

(declare-fun b!825894 () Bool)

(declare-fun e!459676 () Bool)

(declare-fun e!459675 () Bool)

(assert (=> b!825894 (= e!459676 e!459675)))

(assert (=> b!825894 (= c!89686 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825895 () Bool)

(declare-fun e!459677 () Bool)

(declare-fun contains!4156 (List!15659 (_ BitVec 64)) Bool)

(assert (=> b!825895 (= e!459677 (contains!4156 Nil!15656 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825896 () Bool)

(assert (=> b!825896 (= e!459675 call!35891)))

(declare-fun b!825897 () Bool)

(assert (=> b!825897 (= e!459674 e!459676)))

(declare-fun res!562762 () Bool)

(assert (=> b!825897 (=> (not res!562762) (not e!459676))))

(assert (=> b!825897 (= res!562762 (not e!459677))))

(declare-fun res!562761 () Bool)

(assert (=> b!825897 (=> (not res!562761) (not e!459677))))

(assert (=> b!825897 (= res!562761 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825898 () Bool)

(assert (=> b!825898 (= e!459675 call!35891)))

(assert (= (and d!105285 (not res!562763)) b!825897))

(assert (= (and b!825897 res!562761) b!825895))

(assert (= (and b!825897 res!562762) b!825894))

(assert (= (and b!825894 c!89686) b!825898))

(assert (= (and b!825894 (not c!89686)) b!825896))

(assert (= (or b!825898 b!825896) bm!35888))

(assert (=> bm!35888 m!768243))

(declare-fun m!768291 () Bool)

(assert (=> bm!35888 m!768291))

(assert (=> b!825894 m!768243))

(assert (=> b!825894 m!768243))

(assert (=> b!825894 m!768255))

(assert (=> b!825895 m!768243))

(assert (=> b!825895 m!768243))

(declare-fun m!768293 () Bool)

(assert (=> b!825895 m!768293))

(assert (=> b!825897 m!768243))

(assert (=> b!825897 m!768243))

(assert (=> b!825897 m!768255))

(assert (=> b!825780 d!105285))

(declare-fun b!825907 () Bool)

(declare-fun e!459686 () Bool)

(declare-fun e!459684 () Bool)

(assert (=> b!825907 (= e!459686 e!459684)))

(declare-fun c!89689 () Bool)

(assert (=> b!825907 (= c!89689 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35891 () Bool)

(declare-fun call!35894 () Bool)

(assert (=> bm!35891 (= call!35894 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!825908 () Bool)

(declare-fun e!459685 () Bool)

(assert (=> b!825908 (= e!459684 e!459685)))

(declare-fun lt!372466 () (_ BitVec 64))

(assert (=> b!825908 (= lt!372466 (select (arr!22083 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372468 () Unit!28281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46081 (_ BitVec 64) (_ BitVec 32)) Unit!28281)

(assert (=> b!825908 (= lt!372468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!372466 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!825908 (arrayContainsKey!0 _keys!976 lt!372466 #b00000000000000000000000000000000)))

(declare-fun lt!372467 () Unit!28281)

(assert (=> b!825908 (= lt!372467 lt!372468)))

(declare-fun res!562768 () Bool)

(declare-datatypes ((SeekEntryResult!8684 0))(
  ( (MissingZero!8684 (index!37107 (_ BitVec 32))) (Found!8684 (index!37108 (_ BitVec 32))) (Intermediate!8684 (undefined!9496 Bool) (index!37109 (_ BitVec 32)) (x!69598 (_ BitVec 32))) (Undefined!8684) (MissingVacant!8684 (index!37110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46081 (_ BitVec 32)) SeekEntryResult!8684)

(assert (=> b!825908 (= res!562768 (= (seekEntryOrOpen!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8684 #b00000000000000000000000000000000)))))

(assert (=> b!825908 (=> (not res!562768) (not e!459685))))

(declare-fun d!105287 () Bool)

(declare-fun res!562769 () Bool)

(assert (=> d!105287 (=> res!562769 e!459686)))

(assert (=> d!105287 (= res!562769 (bvsge #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(assert (=> d!105287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!459686)))

(declare-fun b!825909 () Bool)

(assert (=> b!825909 (= e!459684 call!35894)))

(declare-fun b!825910 () Bool)

(assert (=> b!825910 (= e!459685 call!35894)))

(assert (= (and d!105287 (not res!562769)) b!825907))

(assert (= (and b!825907 c!89689) b!825908))

(assert (= (and b!825907 (not c!89689)) b!825909))

(assert (= (and b!825908 res!562768) b!825910))

(assert (= (or b!825910 b!825909) bm!35891))

(assert (=> b!825907 m!768243))

(assert (=> b!825907 m!768243))

(assert (=> b!825907 m!768255))

(declare-fun m!768295 () Bool)

(assert (=> bm!35891 m!768295))

(assert (=> b!825908 m!768243))

(declare-fun m!768297 () Bool)

(assert (=> b!825908 m!768297))

(declare-fun m!768299 () Bool)

(assert (=> b!825908 m!768299))

(assert (=> b!825908 m!768243))

(declare-fun m!768301 () Bool)

(assert (=> b!825908 m!768301))

(assert (=> b!825779 d!105287))

(declare-fun d!105289 () Bool)

(assert (=> d!105289 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71200 d!105289))

(declare-fun d!105291 () Bool)

(assert (=> d!105291 (= (array_inv!17651 _keys!976) (bvsge (size!22503 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71200 d!105291))

(declare-fun d!105293 () Bool)

(assert (=> d!105293 (= (array_inv!17652 _values!788) (bvsge (size!22504 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71200 d!105293))

(declare-fun b!825953 () Bool)

(declare-fun e!459720 () Bool)

(declare-fun e!459723 () Bool)

(assert (=> b!825953 (= e!459720 e!459723)))

(declare-fun c!89705 () Bool)

(assert (=> b!825953 (= c!89705 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!825954 () Bool)

(declare-fun e!459722 () Bool)

(declare-fun lt!372513 () ListLongMap!8699)

(assert (=> b!825954 (= e!459722 (= (apply!361 lt!372513 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!825955 () Bool)

(declare-fun c!89706 () Bool)

(assert (=> b!825955 (= c!89706 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!459725 () ListLongMap!8699)

(declare-fun e!459717 () ListLongMap!8699)

(assert (=> b!825955 (= e!459725 e!459717)))

(declare-fun b!825956 () Bool)

(declare-fun call!35910 () ListLongMap!8699)

(assert (=> b!825956 (= e!459725 call!35910)))

(declare-fun b!825957 () Bool)

(declare-fun e!459721 () Bool)

(assert (=> b!825957 (= e!459721 (= (apply!361 lt!372513 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!825958 () Bool)

(declare-fun e!459714 () ListLongMap!8699)

(declare-fun call!35913 () ListLongMap!8699)

(assert (=> b!825958 (= e!459714 (+!1914 call!35913 (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!825959 () Bool)

(declare-fun e!459716 () Bool)

(declare-fun call!35911 () Bool)

(assert (=> b!825959 (= e!459716 (not call!35911))))

(declare-fun b!825960 () Bool)

(assert (=> b!825960 (= e!459716 e!459722)))

(declare-fun res!562790 () Bool)

(assert (=> b!825960 (= res!562790 call!35911)))

(assert (=> b!825960 (=> (not res!562790) (not e!459722))))

(declare-fun bm!35906 () Bool)

(declare-fun call!35914 () Bool)

(assert (=> bm!35906 (= call!35914 (contains!4155 lt!372513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825961 () Bool)

(declare-fun e!459715 () Unit!28281)

(declare-fun Unit!28287 () Unit!28281)

(assert (=> b!825961 (= e!459715 Unit!28287)))

(declare-fun bm!35907 () Bool)

(assert (=> bm!35907 (= call!35910 call!35913)))

(declare-fun d!105295 () Bool)

(assert (=> d!105295 e!459720))

(declare-fun res!562796 () Bool)

(assert (=> d!105295 (=> (not res!562796) (not e!459720))))

(assert (=> d!105295 (= res!562796 (or (bvsge #b00000000000000000000000000000000 (size!22503 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))))

(declare-fun lt!372526 () ListLongMap!8699)

(assert (=> d!105295 (= lt!372513 lt!372526)))

(declare-fun lt!372521 () Unit!28281)

(assert (=> d!105295 (= lt!372521 e!459715)))

(declare-fun c!89707 () Bool)

(declare-fun e!459719 () Bool)

(assert (=> d!105295 (= c!89707 e!459719)))

(declare-fun res!562795 () Bool)

(assert (=> d!105295 (=> (not res!562795) (not e!459719))))

(assert (=> d!105295 (= res!562795 (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(assert (=> d!105295 (= lt!372526 e!459714)))

(declare-fun c!89703 () Bool)

(assert (=> d!105295 (= c!89703 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105295 (validMask!0 mask!1312)))

(assert (=> d!105295 (= (getCurrentListMap!2492 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372513)))

(declare-fun e!459713 () Bool)

(declare-fun b!825962 () Bool)

(assert (=> b!825962 (= e!459713 (= (apply!361 lt!372513 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)) (get!11723 (select (arr!22084 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!825962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22504 _values!788)))))

(assert (=> b!825962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun b!825963 () Bool)

(assert (=> b!825963 (= e!459714 e!459725)))

(declare-fun c!89702 () Bool)

(assert (=> b!825963 (= c!89702 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!825964 () Bool)

(declare-fun lt!372515 () Unit!28281)

(assert (=> b!825964 (= e!459715 lt!372515)))

(declare-fun lt!372534 () ListLongMap!8699)

(assert (=> b!825964 (= lt!372534 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372522 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372519 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372519 (select (arr!22083 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372532 () Unit!28281)

(declare-fun addStillContains!313 (ListLongMap!8699 (_ BitVec 64) V!24931 (_ BitVec 64)) Unit!28281)

(assert (=> b!825964 (= lt!372532 (addStillContains!313 lt!372534 lt!372522 zeroValueBefore!34 lt!372519))))

(assert (=> b!825964 (contains!4155 (+!1914 lt!372534 (tuple2!9875 lt!372522 zeroValueBefore!34)) lt!372519)))

(declare-fun lt!372516 () Unit!28281)

(assert (=> b!825964 (= lt!372516 lt!372532)))

(declare-fun lt!372518 () ListLongMap!8699)

(assert (=> b!825964 (= lt!372518 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372524 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372524 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372523 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372523 (select (arr!22083 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372514 () Unit!28281)

(declare-fun addApplyDifferent!313 (ListLongMap!8699 (_ BitVec 64) V!24931 (_ BitVec 64)) Unit!28281)

(assert (=> b!825964 (= lt!372514 (addApplyDifferent!313 lt!372518 lt!372524 minValue!754 lt!372523))))

(assert (=> b!825964 (= (apply!361 (+!1914 lt!372518 (tuple2!9875 lt!372524 minValue!754)) lt!372523) (apply!361 lt!372518 lt!372523))))

(declare-fun lt!372531 () Unit!28281)

(assert (=> b!825964 (= lt!372531 lt!372514)))

(declare-fun lt!372520 () ListLongMap!8699)

(assert (=> b!825964 (= lt!372520 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372530 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372527 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372527 (select (arr!22083 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372525 () Unit!28281)

(assert (=> b!825964 (= lt!372525 (addApplyDifferent!313 lt!372520 lt!372530 zeroValueBefore!34 lt!372527))))

(assert (=> b!825964 (= (apply!361 (+!1914 lt!372520 (tuple2!9875 lt!372530 zeroValueBefore!34)) lt!372527) (apply!361 lt!372520 lt!372527))))

(declare-fun lt!372533 () Unit!28281)

(assert (=> b!825964 (= lt!372533 lt!372525)))

(declare-fun lt!372517 () ListLongMap!8699)

(assert (=> b!825964 (= lt!372517 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372529 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372529 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372528 () (_ BitVec 64))

(assert (=> b!825964 (= lt!372528 (select (arr!22083 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825964 (= lt!372515 (addApplyDifferent!313 lt!372517 lt!372529 minValue!754 lt!372528))))

(assert (=> b!825964 (= (apply!361 (+!1914 lt!372517 (tuple2!9875 lt!372529 minValue!754)) lt!372528) (apply!361 lt!372517 lt!372528))))

(declare-fun b!825965 () Bool)

(assert (=> b!825965 (= e!459717 call!35910)))

(declare-fun b!825966 () Bool)

(declare-fun e!459718 () Bool)

(assert (=> b!825966 (= e!459718 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun call!35915 () ListLongMap!8699)

(declare-fun bm!35908 () Bool)

(assert (=> bm!35908 (= call!35915 (getCurrentListMapNoExtraKeys!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825967 () Bool)

(declare-fun call!35912 () ListLongMap!8699)

(assert (=> b!825967 (= e!459717 call!35912)))

(declare-fun b!825968 () Bool)

(assert (=> b!825968 (= e!459723 (not call!35914))))

(declare-fun b!825969 () Bool)

(declare-fun res!562789 () Bool)

(assert (=> b!825969 (=> (not res!562789) (not e!459720))))

(declare-fun e!459724 () Bool)

(assert (=> b!825969 (= res!562789 e!459724)))

(declare-fun res!562792 () Bool)

(assert (=> b!825969 (=> res!562792 e!459724)))

(assert (=> b!825969 (= res!562792 (not e!459718))))

(declare-fun res!562791 () Bool)

(assert (=> b!825969 (=> (not res!562791) (not e!459718))))

(assert (=> b!825969 (= res!562791 (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun bm!35909 () Bool)

(assert (=> bm!35909 (= call!35911 (contains!4155 lt!372513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825970 () Bool)

(assert (=> b!825970 (= e!459719 (validKeyInArray!0 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35910 () Bool)

(declare-fun call!35909 () ListLongMap!8699)

(assert (=> bm!35910 (= call!35912 call!35909)))

(declare-fun b!825971 () Bool)

(declare-fun res!562793 () Bool)

(assert (=> b!825971 (=> (not res!562793) (not e!459720))))

(assert (=> b!825971 (= res!562793 e!459716)))

(declare-fun c!89704 () Bool)

(assert (=> b!825971 (= c!89704 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!825972 () Bool)

(assert (=> b!825972 (= e!459724 e!459713)))

(declare-fun res!562794 () Bool)

(assert (=> b!825972 (=> (not res!562794) (not e!459713))))

(assert (=> b!825972 (= res!562794 (contains!4155 lt!372513 (select (arr!22083 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825972 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22503 _keys!976)))))

(declare-fun bm!35911 () Bool)

(assert (=> bm!35911 (= call!35913 (+!1914 (ite c!89703 call!35915 (ite c!89702 call!35909 call!35912)) (ite (or c!89703 c!89702) (tuple2!9875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!825973 () Bool)

(assert (=> b!825973 (= e!459723 e!459721)))

(declare-fun res!562788 () Bool)

(assert (=> b!825973 (= res!562788 call!35914)))

(assert (=> b!825973 (=> (not res!562788) (not e!459721))))

(declare-fun bm!35912 () Bool)

(assert (=> bm!35912 (= call!35909 call!35915)))

(assert (= (and d!105295 c!89703) b!825958))

(assert (= (and d!105295 (not c!89703)) b!825963))

(assert (= (and b!825963 c!89702) b!825956))

(assert (= (and b!825963 (not c!89702)) b!825955))

(assert (= (and b!825955 c!89706) b!825965))

(assert (= (and b!825955 (not c!89706)) b!825967))

(assert (= (or b!825965 b!825967) bm!35910))

(assert (= (or b!825956 bm!35910) bm!35912))

(assert (= (or b!825956 b!825965) bm!35907))

(assert (= (or b!825958 bm!35912) bm!35908))

(assert (= (or b!825958 bm!35907) bm!35911))

(assert (= (and d!105295 res!562795) b!825970))

(assert (= (and d!105295 c!89707) b!825964))

(assert (= (and d!105295 (not c!89707)) b!825961))

(assert (= (and d!105295 res!562796) b!825969))

(assert (= (and b!825969 res!562791) b!825966))

(assert (= (and b!825969 (not res!562792)) b!825972))

(assert (= (and b!825972 res!562794) b!825962))

(assert (= (and b!825969 res!562789) b!825971))

(assert (= (and b!825971 c!89704) b!825960))

(assert (= (and b!825971 (not c!89704)) b!825959))

(assert (= (and b!825960 res!562790) b!825954))

(assert (= (or b!825960 b!825959) bm!35909))

(assert (= (and b!825971 res!562793) b!825953))

(assert (= (and b!825953 c!89705) b!825973))

(assert (= (and b!825953 (not c!89705)) b!825968))

(assert (= (and b!825973 res!562788) b!825957))

(assert (= (or b!825973 b!825968) bm!35906))

(declare-fun b_lambda!11117 () Bool)

(assert (=> (not b_lambda!11117) (not b!825962)))

(assert (=> b!825962 t!22001))

(declare-fun b_and!22165 () Bool)

(assert (= b_and!22163 (and (=> t!22001 result!7941) b_and!22165)))

(declare-fun m!768303 () Bool)

(assert (=> bm!35906 m!768303))

(assert (=> d!105295 m!768183))

(assert (=> bm!35908 m!768193))

(assert (=> b!825966 m!768243))

(assert (=> b!825966 m!768243))

(assert (=> b!825966 m!768255))

(assert (=> b!825962 m!768243))

(declare-fun m!768305 () Bool)

(assert (=> b!825962 m!768305))

(assert (=> b!825962 m!768243))

(assert (=> b!825962 m!768247))

(assert (=> b!825962 m!768245))

(assert (=> b!825962 m!768247))

(assert (=> b!825962 m!768249))

(assert (=> b!825962 m!768245))

(assert (=> b!825972 m!768243))

(assert (=> b!825972 m!768243))

(declare-fun m!768307 () Bool)

(assert (=> b!825972 m!768307))

(declare-fun m!768309 () Bool)

(assert (=> b!825964 m!768309))

(declare-fun m!768311 () Bool)

(assert (=> b!825964 m!768311))

(declare-fun m!768313 () Bool)

(assert (=> b!825964 m!768313))

(declare-fun m!768315 () Bool)

(assert (=> b!825964 m!768315))

(assert (=> b!825964 m!768243))

(declare-fun m!768317 () Bool)

(assert (=> b!825964 m!768317))

(declare-fun m!768319 () Bool)

(assert (=> b!825964 m!768319))

(assert (=> b!825964 m!768193))

(declare-fun m!768321 () Bool)

(assert (=> b!825964 m!768321))

(declare-fun m!768323 () Bool)

(assert (=> b!825964 m!768323))

(declare-fun m!768325 () Bool)

(assert (=> b!825964 m!768325))

(declare-fun m!768327 () Bool)

(assert (=> b!825964 m!768327))

(declare-fun m!768329 () Bool)

(assert (=> b!825964 m!768329))

(assert (=> b!825964 m!768317))

(declare-fun m!768331 () Bool)

(assert (=> b!825964 m!768331))

(assert (=> b!825964 m!768327))

(declare-fun m!768333 () Bool)

(assert (=> b!825964 m!768333))

(assert (=> b!825964 m!768313))

(declare-fun m!768335 () Bool)

(assert (=> b!825964 m!768335))

(assert (=> b!825964 m!768335))

(declare-fun m!768337 () Bool)

(assert (=> b!825964 m!768337))

(declare-fun m!768339 () Bool)

(assert (=> b!825957 m!768339))

(declare-fun m!768341 () Bool)

(assert (=> b!825954 m!768341))

(declare-fun m!768343 () Bool)

(assert (=> bm!35911 m!768343))

(declare-fun m!768345 () Bool)

(assert (=> bm!35909 m!768345))

(assert (=> b!825970 m!768243))

(assert (=> b!825970 m!768243))

(assert (=> b!825970 m!768255))

(declare-fun m!768347 () Bool)

(assert (=> b!825958 m!768347))

(assert (=> b!825781 d!105295))

(declare-fun mapNonEmpty!24049 () Bool)

(declare-fun mapRes!24049 () Bool)

(declare-fun tp!46480 () Bool)

(declare-fun e!459730 () Bool)

(assert (=> mapNonEmpty!24049 (= mapRes!24049 (and tp!46480 e!459730))))

(declare-fun mapValue!24049 () ValueCell!7058)

(declare-fun mapRest!24049 () (Array (_ BitVec 32) ValueCell!7058))

(declare-fun mapKey!24049 () (_ BitVec 32))

(assert (=> mapNonEmpty!24049 (= mapRest!24040 (store mapRest!24049 mapKey!24049 mapValue!24049))))

(declare-fun condMapEmpty!24049 () Bool)

(declare-fun mapDefault!24049 () ValueCell!7058)

(assert (=> mapNonEmpty!24040 (= condMapEmpty!24049 (= mapRest!24040 ((as const (Array (_ BitVec 32) ValueCell!7058)) mapDefault!24049)))))

(declare-fun e!459731 () Bool)

(assert (=> mapNonEmpty!24040 (= tp!46464 (and e!459731 mapRes!24049))))

(declare-fun b!825980 () Bool)

(assert (=> b!825980 (= e!459730 tp_is_empty!14947)))

(declare-fun mapIsEmpty!24049 () Bool)

(assert (=> mapIsEmpty!24049 mapRes!24049))

(declare-fun b!825981 () Bool)

(assert (=> b!825981 (= e!459731 tp_is_empty!14947)))

(assert (= (and mapNonEmpty!24040 condMapEmpty!24049) mapIsEmpty!24049))

(assert (= (and mapNonEmpty!24040 (not condMapEmpty!24049)) mapNonEmpty!24049))

(assert (= (and mapNonEmpty!24049 ((_ is ValueCellFull!7058) mapValue!24049)) b!825980))

(assert (= (and mapNonEmpty!24040 ((_ is ValueCellFull!7058) mapDefault!24049)) b!825981))

(declare-fun m!768349 () Bool)

(assert (=> mapNonEmpty!24049 m!768349))

(declare-fun b_lambda!11119 () Bool)

(assert (= b_lambda!11109 (or (and start!71200 b_free!13237) b_lambda!11119)))

(declare-fun b_lambda!11121 () Bool)

(assert (= b_lambda!11117 (or (and start!71200 b_free!13237) b_lambda!11121)))

(declare-fun b_lambda!11123 () Bool)

(assert (= b_lambda!11111 (or (and start!71200 b_free!13237) b_lambda!11123)))

(declare-fun b_lambda!11125 () Bool)

(assert (= b_lambda!11113 (or (and start!71200 b_free!13237) b_lambda!11125)))

(declare-fun b_lambda!11127 () Bool)

(assert (= b_lambda!11115 (or (and start!71200 b_free!13237) b_lambda!11127)))

(check-sat (not b!825873) (not b!825862) (not b_lambda!11121) (not b!825863) (not b!825970) (not b_lambda!11123) (not b!825907) (not d!105281) (not b!825861) (not bm!35909) (not b!825972) (not d!105283) (not b!825894) (not bm!35888) (not b!825866) (not b!825882) (not bm!35885) (not bm!35908) (not bm!35906) (not bm!35911) (not b_lambda!11119) (not b_lambda!11127) (not b!825962) (not b!825954) (not b!825880) (not b!825895) (not b_lambda!11125) (not d!105279) (not b!825881) (not b!825964) (not bm!35891) tp_is_empty!14947 (not d!105295) (not b!825883) (not b!825877) (not mapNonEmpty!24049) (not b!825868) (not b!825875) (not b_next!13237) (not b!825897) (not b!825876) (not b!825859) (not b!825869) (not b!825958) (not b!825908) (not b!825966) (not bm!35884) (not b!825867) (not b!825957) b_and!22165)
(check-sat b_and!22165 (not b_next!13237))

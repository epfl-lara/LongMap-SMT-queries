; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70410 () Bool)

(assert start!70410)

(declare-fun b_free!12637 () Bool)

(declare-fun b_next!12637 () Bool)

(assert (=> start!70410 (= b_free!12637 (not b_next!12637))))

(declare-fun tp!44632 () Bool)

(declare-fun b_and!21435 () Bool)

(assert (=> start!70410 (= tp!44632 b_and!21435)))

(declare-fun b!816983 () Bool)

(declare-fun e!453223 () Bool)

(declare-fun e!453226 () Bool)

(assert (=> b!816983 (= e!453223 (not e!453226))))

(declare-fun res!557565 () Bool)

(assert (=> b!816983 (=> res!557565 e!453226)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816983 (= res!557565 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24131 0))(
  ( (V!24132 (val!7221 Int)) )
))
(declare-datatypes ((tuple2!9396 0))(
  ( (tuple2!9397 (_1!4709 (_ BitVec 64)) (_2!4709 V!24131)) )
))
(declare-datatypes ((List!15208 0))(
  ( (Nil!15205) (Cons!15204 (h!16339 tuple2!9396) (t!21521 List!15208)) )
))
(declare-datatypes ((ListLongMap!8221 0))(
  ( (ListLongMap!8222 (toList!4126 List!15208)) )
))
(declare-fun lt!365797 () ListLongMap!8221)

(declare-fun lt!365798 () ListLongMap!8221)

(assert (=> b!816983 (= lt!365797 lt!365798)))

(declare-fun zeroValueBefore!34 () V!24131)

(declare-datatypes ((array!44895 0))(
  ( (array!44896 (arr!21501 (Array (_ BitVec 32) (_ BitVec 64))) (size!21921 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44895)

(declare-datatypes ((Unit!27813 0))(
  ( (Unit!27814) )
))
(declare-fun lt!365796 () Unit!27813)

(declare-fun zeroValueAfter!34 () V!24131)

(declare-fun minValue!754 () V!24131)

(declare-datatypes ((ValueCell!6758 0))(
  ( (ValueCellFull!6758 (v!9648 V!24131)) (EmptyCell!6758) )
))
(declare-datatypes ((array!44897 0))(
  ( (array!44898 (arr!21502 (Array (_ BitVec 32) ValueCell!6758)) (size!21922 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44897)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!318 (array!44895 array!44897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 V!24131 V!24131 (_ BitVec 32) Int) Unit!27813)

(assert (=> b!816983 (= lt!365796 (lemmaNoChangeToArrayThenSameMapNoExtras!318 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2230 (array!44895 array!44897 (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 (_ BitVec 32) Int) ListLongMap!8221)

(assert (=> b!816983 (= lt!365798 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816983 (= lt!365797 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816984 () Bool)

(declare-fun res!557566 () Bool)

(assert (=> b!816984 (=> (not res!557566) (not e!453223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44895 (_ BitVec 32)) Bool)

(assert (=> b!816984 (= res!557566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816985 () Bool)

(declare-fun e!453221 () Bool)

(declare-fun tp_is_empty!14347 () Bool)

(assert (=> b!816985 (= e!453221 tp_is_empty!14347)))

(declare-fun res!557568 () Bool)

(assert (=> start!70410 (=> (not res!557568) (not e!453223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70410 (= res!557568 (validMask!0 mask!1312))))

(assert (=> start!70410 e!453223))

(assert (=> start!70410 tp_is_empty!14347))

(declare-fun array_inv!17241 (array!44895) Bool)

(assert (=> start!70410 (array_inv!17241 _keys!976)))

(assert (=> start!70410 true))

(declare-fun e!453222 () Bool)

(declare-fun array_inv!17242 (array!44897) Bool)

(assert (=> start!70410 (and (array_inv!17242 _values!788) e!453222)))

(assert (=> start!70410 tp!44632))

(declare-fun b!816986 () Bool)

(declare-fun res!557563 () Bool)

(assert (=> b!816986 (=> (not res!557563) (not e!453223))))

(declare-datatypes ((List!15209 0))(
  ( (Nil!15206) (Cons!15205 (h!16340 (_ BitVec 64)) (t!21522 List!15209)) )
))
(declare-fun arrayNoDuplicates!0 (array!44895 (_ BitVec 32) List!15209) Bool)

(assert (=> b!816986 (= res!557563 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15206))))

(declare-fun b!816987 () Bool)

(declare-fun res!557564 () Bool)

(assert (=> b!816987 (=> (not res!557564) (not e!453223))))

(assert (=> b!816987 (= res!557564 (and (= (size!21922 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21921 _keys!976) (size!21922 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816988 () Bool)

(assert (=> b!816988 (= e!453226 (bvsle #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun mapNonEmpty!23107 () Bool)

(declare-fun mapRes!23107 () Bool)

(declare-fun tp!44631 () Bool)

(assert (=> mapNonEmpty!23107 (= mapRes!23107 (and tp!44631 e!453221))))

(declare-fun mapKey!23107 () (_ BitVec 32))

(declare-fun mapValue!23107 () ValueCell!6758)

(declare-fun mapRest!23107 () (Array (_ BitVec 32) ValueCell!6758))

(assert (=> mapNonEmpty!23107 (= (arr!21502 _values!788) (store mapRest!23107 mapKey!23107 mapValue!23107))))

(declare-fun b!816989 () Bool)

(declare-fun res!557567 () Bool)

(assert (=> b!816989 (=> res!557567 e!453226)))

(declare-fun +!1805 (ListLongMap!8221 tuple2!9396) ListLongMap!8221)

(declare-fun getCurrentListMap!2345 (array!44895 array!44897 (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 (_ BitVec 32) Int) ListLongMap!8221)

(assert (=> b!816989 (= res!557567 (not (= (+!1805 (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(declare-fun mapIsEmpty!23107 () Bool)

(assert (=> mapIsEmpty!23107 mapRes!23107))

(declare-fun b!816990 () Bool)

(declare-fun e!453224 () Bool)

(assert (=> b!816990 (= e!453222 (and e!453224 mapRes!23107))))

(declare-fun condMapEmpty!23107 () Bool)

(declare-fun mapDefault!23107 () ValueCell!6758)

(assert (=> b!816990 (= condMapEmpty!23107 (= (arr!21502 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6758)) mapDefault!23107)))))

(declare-fun b!816991 () Bool)

(assert (=> b!816991 (= e!453224 tp_is_empty!14347)))

(assert (= (and start!70410 res!557568) b!816987))

(assert (= (and b!816987 res!557564) b!816984))

(assert (= (and b!816984 res!557566) b!816986))

(assert (= (and b!816986 res!557563) b!816983))

(assert (= (and b!816983 (not res!557565)) b!816989))

(assert (= (and b!816989 (not res!557567)) b!816988))

(assert (= (and b!816990 condMapEmpty!23107) mapIsEmpty!23107))

(assert (= (and b!816990 (not condMapEmpty!23107)) mapNonEmpty!23107))

(get-info :version)

(assert (= (and mapNonEmpty!23107 ((_ is ValueCellFull!6758) mapValue!23107)) b!816985))

(assert (= (and b!816990 ((_ is ValueCellFull!6758) mapDefault!23107)) b!816991))

(assert (= start!70410 b!816990))

(declare-fun m!759015 () Bool)

(assert (=> b!816983 m!759015))

(declare-fun m!759017 () Bool)

(assert (=> b!816983 m!759017))

(declare-fun m!759019 () Bool)

(assert (=> b!816983 m!759019))

(declare-fun m!759021 () Bool)

(assert (=> start!70410 m!759021))

(declare-fun m!759023 () Bool)

(assert (=> start!70410 m!759023))

(declare-fun m!759025 () Bool)

(assert (=> start!70410 m!759025))

(declare-fun m!759027 () Bool)

(assert (=> b!816986 m!759027))

(declare-fun m!759029 () Bool)

(assert (=> mapNonEmpty!23107 m!759029))

(declare-fun m!759031 () Bool)

(assert (=> b!816984 m!759031))

(declare-fun m!759033 () Bool)

(assert (=> b!816989 m!759033))

(assert (=> b!816989 m!759033))

(declare-fun m!759035 () Bool)

(assert (=> b!816989 m!759035))

(declare-fun m!759037 () Bool)

(assert (=> b!816989 m!759037))

(check-sat tp_is_empty!14347 (not b_next!12637) (not b!816989) (not b!816984) (not start!70410) b_and!21435 (not b!816986) (not mapNonEmpty!23107) (not b!816983))
(check-sat b_and!21435 (not b_next!12637))
(get-model)

(declare-fun b!817056 () Bool)

(declare-fun e!453274 () Bool)

(declare-fun e!453272 () Bool)

(assert (=> b!817056 (= e!453274 e!453272)))

(declare-fun c!89248 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!817056 (= c!89248 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35564 () Bool)

(declare-fun call!35567 () Bool)

(assert (=> bm!35564 (= call!35567 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89248 (Cons!15205 (select (arr!21501 _keys!976) #b00000000000000000000000000000000) Nil!15206) Nil!15206)))))

(declare-fun b!817057 () Bool)

(declare-fun e!453273 () Bool)

(declare-fun contains!4127 (List!15209 (_ BitVec 64)) Bool)

(assert (=> b!817057 (= e!453273 (contains!4127 Nil!15206 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817058 () Bool)

(assert (=> b!817058 (= e!453272 call!35567)))

(declare-fun d!104823 () Bool)

(declare-fun res!557612 () Bool)

(declare-fun e!453271 () Bool)

(assert (=> d!104823 (=> res!557612 e!453271)))

(assert (=> d!104823 (= res!557612 (bvsge #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> d!104823 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15206) e!453271)))

(declare-fun b!817059 () Bool)

(assert (=> b!817059 (= e!453271 e!453274)))

(declare-fun res!557611 () Bool)

(assert (=> b!817059 (=> (not res!557611) (not e!453274))))

(assert (=> b!817059 (= res!557611 (not e!453273))))

(declare-fun res!557613 () Bool)

(assert (=> b!817059 (=> (not res!557613) (not e!453273))))

(assert (=> b!817059 (= res!557613 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817060 () Bool)

(assert (=> b!817060 (= e!453272 call!35567)))

(assert (= (and d!104823 (not res!557612)) b!817059))

(assert (= (and b!817059 res!557613) b!817057))

(assert (= (and b!817059 res!557611) b!817056))

(assert (= (and b!817056 c!89248) b!817060))

(assert (= (and b!817056 (not c!89248)) b!817058))

(assert (= (or b!817060 b!817058) bm!35564))

(declare-fun m!759087 () Bool)

(assert (=> b!817056 m!759087))

(assert (=> b!817056 m!759087))

(declare-fun m!759089 () Bool)

(assert (=> b!817056 m!759089))

(assert (=> bm!35564 m!759087))

(declare-fun m!759091 () Bool)

(assert (=> bm!35564 m!759091))

(assert (=> b!817057 m!759087))

(assert (=> b!817057 m!759087))

(declare-fun m!759093 () Bool)

(assert (=> b!817057 m!759093))

(assert (=> b!817059 m!759087))

(assert (=> b!817059 m!759087))

(assert (=> b!817059 m!759089))

(assert (=> b!816986 d!104823))

(declare-fun d!104825 () Bool)

(declare-fun e!453277 () Bool)

(assert (=> d!104825 e!453277))

(declare-fun res!557619 () Bool)

(assert (=> d!104825 (=> (not res!557619) (not e!453277))))

(declare-fun lt!365826 () ListLongMap!8221)

(declare-fun contains!4128 (ListLongMap!8221 (_ BitVec 64)) Bool)

(assert (=> d!104825 (= res!557619 (contains!4128 lt!365826 (_1!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!365828 () List!15208)

(assert (=> d!104825 (= lt!365826 (ListLongMap!8222 lt!365828))))

(declare-fun lt!365827 () Unit!27813)

(declare-fun lt!365825 () Unit!27813)

(assert (=> d!104825 (= lt!365827 lt!365825)))

(declare-datatypes ((Option!407 0))(
  ( (Some!406 (v!9651 V!24131)) (None!405) )
))
(declare-fun getValueByKey!401 (List!15208 (_ BitVec 64)) Option!407)

(assert (=> d!104825 (= (getValueByKey!401 lt!365828 (_1!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!406 (_2!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!215 (List!15208 (_ BitVec 64) V!24131) Unit!27813)

(assert (=> d!104825 (= lt!365825 (lemmaContainsTupThenGetReturnValue!215 lt!365828 (_1!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!254 (List!15208 (_ BitVec 64) V!24131) List!15208)

(assert (=> d!104825 (= lt!365828 (insertStrictlySorted!254 (toList!4126 (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104825 (= (+!1805 (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!365826)))

(declare-fun b!817065 () Bool)

(declare-fun res!557618 () Bool)

(assert (=> b!817065 (=> (not res!557618) (not e!453277))))

(assert (=> b!817065 (= res!557618 (= (getValueByKey!401 (toList!4126 lt!365826) (_1!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!406 (_2!4709 (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!817066 () Bool)

(declare-fun contains!4129 (List!15208 tuple2!9396) Bool)

(assert (=> b!817066 (= e!453277 (contains!4129 (toList!4126 lt!365826) (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104825 res!557619) b!817065))

(assert (= (and b!817065 res!557618) b!817066))

(declare-fun m!759095 () Bool)

(assert (=> d!104825 m!759095))

(declare-fun m!759097 () Bool)

(assert (=> d!104825 m!759097))

(declare-fun m!759099 () Bool)

(assert (=> d!104825 m!759099))

(declare-fun m!759101 () Bool)

(assert (=> d!104825 m!759101))

(declare-fun m!759103 () Bool)

(assert (=> b!817065 m!759103))

(declare-fun m!759105 () Bool)

(assert (=> b!817066 m!759105))

(assert (=> b!816989 d!104825))

(declare-fun b!817109 () Bool)

(declare-fun res!557639 () Bool)

(declare-fun e!453306 () Bool)

(assert (=> b!817109 (=> (not res!557639) (not e!453306))))

(declare-fun e!453312 () Bool)

(assert (=> b!817109 (= res!557639 e!453312)))

(declare-fun res!557641 () Bool)

(assert (=> b!817109 (=> res!557641 e!453312)))

(declare-fun e!453313 () Bool)

(assert (=> b!817109 (= res!557641 (not e!453313))))

(declare-fun res!557638 () Bool)

(assert (=> b!817109 (=> (not res!557638) (not e!453313))))

(assert (=> b!817109 (= res!557638 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun bm!35579 () Bool)

(declare-fun call!35583 () Bool)

(declare-fun lt!365886 () ListLongMap!8221)

(assert (=> bm!35579 (= call!35583 (contains!4128 lt!365886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35580 () Bool)

(declare-fun call!35584 () ListLongMap!8221)

(declare-fun call!35586 () ListLongMap!8221)

(assert (=> bm!35580 (= call!35584 call!35586)))

(declare-fun b!817110 () Bool)

(declare-fun e!453308 () ListLongMap!8221)

(assert (=> b!817110 (= e!453308 call!35584)))

(declare-fun b!817111 () Bool)

(declare-fun e!453311 () ListLongMap!8221)

(declare-fun e!453309 () ListLongMap!8221)

(assert (=> b!817111 (= e!453311 e!453309)))

(declare-fun c!89263 () Bool)

(assert (=> b!817111 (= c!89263 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!89264 () Bool)

(declare-fun call!35582 () ListLongMap!8221)

(declare-fun bm!35581 () Bool)

(declare-fun call!35588 () ListLongMap!8221)

(declare-fun call!35587 () ListLongMap!8221)

(assert (=> bm!35581 (= call!35586 (+!1805 (ite c!89264 call!35582 (ite c!89263 call!35588 call!35587)) (ite (or c!89264 c!89263) (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35582 () Bool)

(assert (=> bm!35582 (= call!35588 call!35582)))

(declare-fun b!817112 () Bool)

(declare-fun e!453316 () Bool)

(declare-fun apply!350 (ListLongMap!8221 (_ BitVec 64)) V!24131)

(assert (=> b!817112 (= e!453316 (= (apply!350 lt!365886 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!817113 () Bool)

(declare-fun e!453304 () Unit!27813)

(declare-fun lt!365880 () Unit!27813)

(assert (=> b!817113 (= e!453304 lt!365880)))

(declare-fun lt!365881 () ListLongMap!8221)

(assert (=> b!817113 (= lt!365881 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365887 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365878 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365878 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365885 () Unit!27813)

(declare-fun addStillContains!305 (ListLongMap!8221 (_ BitVec 64) V!24131 (_ BitVec 64)) Unit!27813)

(assert (=> b!817113 (= lt!365885 (addStillContains!305 lt!365881 lt!365887 zeroValueBefore!34 lt!365878))))

(assert (=> b!817113 (contains!4128 (+!1805 lt!365881 (tuple2!9397 lt!365887 zeroValueBefore!34)) lt!365878)))

(declare-fun lt!365874 () Unit!27813)

(assert (=> b!817113 (= lt!365874 lt!365885)))

(declare-fun lt!365892 () ListLongMap!8221)

(assert (=> b!817113 (= lt!365892 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365875 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365882 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365882 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365890 () Unit!27813)

(declare-fun addApplyDifferent!305 (ListLongMap!8221 (_ BitVec 64) V!24131 (_ BitVec 64)) Unit!27813)

(assert (=> b!817113 (= lt!365890 (addApplyDifferent!305 lt!365892 lt!365875 minValue!754 lt!365882))))

(assert (=> b!817113 (= (apply!350 (+!1805 lt!365892 (tuple2!9397 lt!365875 minValue!754)) lt!365882) (apply!350 lt!365892 lt!365882))))

(declare-fun lt!365879 () Unit!27813)

(assert (=> b!817113 (= lt!365879 lt!365890)))

(declare-fun lt!365876 () ListLongMap!8221)

(assert (=> b!817113 (= lt!365876 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365873 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365877 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365877 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365894 () Unit!27813)

(assert (=> b!817113 (= lt!365894 (addApplyDifferent!305 lt!365876 lt!365873 zeroValueBefore!34 lt!365877))))

(assert (=> b!817113 (= (apply!350 (+!1805 lt!365876 (tuple2!9397 lt!365873 zeroValueBefore!34)) lt!365877) (apply!350 lt!365876 lt!365877))))

(declare-fun lt!365889 () Unit!27813)

(assert (=> b!817113 (= lt!365889 lt!365894)))

(declare-fun lt!365883 () ListLongMap!8221)

(assert (=> b!817113 (= lt!365883 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365888 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365888 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365893 () (_ BitVec 64))

(assert (=> b!817113 (= lt!365893 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817113 (= lt!365880 (addApplyDifferent!305 lt!365883 lt!365888 minValue!754 lt!365893))))

(assert (=> b!817113 (= (apply!350 (+!1805 lt!365883 (tuple2!9397 lt!365888 minValue!754)) lt!365893) (apply!350 lt!365883 lt!365893))))

(declare-fun b!817115 () Bool)

(declare-fun Unit!27815 () Unit!27813)

(assert (=> b!817115 (= e!453304 Unit!27815)))

(declare-fun b!817116 () Bool)

(assert (=> b!817116 (= e!453311 (+!1805 call!35586 (tuple2!9397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!817117 () Bool)

(declare-fun c!89262 () Bool)

(assert (=> b!817117 (= c!89262 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!817117 (= e!453309 e!453308)))

(declare-fun b!817118 () Bool)

(declare-fun e!453314 () Bool)

(assert (=> b!817118 (= e!453314 (not call!35583))))

(declare-fun b!817119 () Bool)

(declare-fun e!453305 () Bool)

(assert (=> b!817119 (= e!453305 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35583 () Bool)

(declare-fun call!35585 () Bool)

(assert (=> bm!35583 (= call!35585 (contains!4128 lt!365886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817120 () Bool)

(declare-fun res!557643 () Bool)

(assert (=> b!817120 (=> (not res!557643) (not e!453306))))

(declare-fun e!453315 () Bool)

(assert (=> b!817120 (= res!557643 e!453315)))

(declare-fun c!89266 () Bool)

(assert (=> b!817120 (= c!89266 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!817121 () Bool)

(declare-fun e!453310 () Bool)

(assert (=> b!817121 (= e!453315 e!453310)))

(declare-fun res!557640 () Bool)

(assert (=> b!817121 (= res!557640 call!35585)))

(assert (=> b!817121 (=> (not res!557640) (not e!453310))))

(declare-fun e!453307 () Bool)

(declare-fun b!817122 () Bool)

(declare-fun get!11512 (ValueCell!6758 V!24131) V!24131)

(declare-fun dynLambda!958 (Int (_ BitVec 64)) V!24131)

(assert (=> b!817122 (= e!453307 (= (apply!350 lt!365886 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)) (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!817122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21922 _values!788)))))

(assert (=> b!817122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun bm!35584 () Bool)

(assert (=> bm!35584 (= call!35587 call!35588)))

(declare-fun b!817123 () Bool)

(assert (=> b!817123 (= e!453312 e!453307)))

(declare-fun res!557642 () Bool)

(assert (=> b!817123 (=> (not res!557642) (not e!453307))))

(assert (=> b!817123 (= res!557642 (contains!4128 lt!365886 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun d!104827 () Bool)

(assert (=> d!104827 e!453306))

(declare-fun res!557644 () Bool)

(assert (=> d!104827 (=> (not res!557644) (not e!453306))))

(assert (=> d!104827 (= res!557644 (or (bvsge #b00000000000000000000000000000000 (size!21921 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))))

(declare-fun lt!365884 () ListLongMap!8221)

(assert (=> d!104827 (= lt!365886 lt!365884)))

(declare-fun lt!365891 () Unit!27813)

(assert (=> d!104827 (= lt!365891 e!453304)))

(declare-fun c!89265 () Bool)

(assert (=> d!104827 (= c!89265 e!453305)))

(declare-fun res!557645 () Bool)

(assert (=> d!104827 (=> (not res!557645) (not e!453305))))

(assert (=> d!104827 (= res!557645 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> d!104827 (= lt!365884 e!453311)))

(assert (=> d!104827 (= c!89264 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104827 (validMask!0 mask!1312)))

(assert (=> d!104827 (= (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365886)))

(declare-fun b!817114 () Bool)

(assert (=> b!817114 (= e!453314 e!453316)))

(declare-fun res!557646 () Bool)

(assert (=> b!817114 (= res!557646 call!35583)))

(assert (=> b!817114 (=> (not res!557646) (not e!453316))))

(declare-fun b!817124 () Bool)

(assert (=> b!817124 (= e!453308 call!35587)))

(declare-fun b!817125 () Bool)

(assert (=> b!817125 (= e!453313 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817126 () Bool)

(assert (=> b!817126 (= e!453309 call!35584)))

(declare-fun bm!35585 () Bool)

(assert (=> bm!35585 (= call!35582 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817127 () Bool)

(assert (=> b!817127 (= e!453315 (not call!35585))))

(declare-fun b!817128 () Bool)

(assert (=> b!817128 (= e!453306 e!453314)))

(declare-fun c!89261 () Bool)

(assert (=> b!817128 (= c!89261 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!817129 () Bool)

(assert (=> b!817129 (= e!453310 (= (apply!350 lt!365886 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(assert (= (and d!104827 c!89264) b!817116))

(assert (= (and d!104827 (not c!89264)) b!817111))

(assert (= (and b!817111 c!89263) b!817126))

(assert (= (and b!817111 (not c!89263)) b!817117))

(assert (= (and b!817117 c!89262) b!817110))

(assert (= (and b!817117 (not c!89262)) b!817124))

(assert (= (or b!817110 b!817124) bm!35584))

(assert (= (or b!817126 bm!35584) bm!35582))

(assert (= (or b!817126 b!817110) bm!35580))

(assert (= (or b!817116 bm!35582) bm!35585))

(assert (= (or b!817116 bm!35580) bm!35581))

(assert (= (and d!104827 res!557645) b!817119))

(assert (= (and d!104827 c!89265) b!817113))

(assert (= (and d!104827 (not c!89265)) b!817115))

(assert (= (and d!104827 res!557644) b!817109))

(assert (= (and b!817109 res!557638) b!817125))

(assert (= (and b!817109 (not res!557641)) b!817123))

(assert (= (and b!817123 res!557642) b!817122))

(assert (= (and b!817109 res!557639) b!817120))

(assert (= (and b!817120 c!89266) b!817121))

(assert (= (and b!817120 (not c!89266)) b!817127))

(assert (= (and b!817121 res!557640) b!817129))

(assert (= (or b!817121 b!817127) bm!35583))

(assert (= (and b!817120 res!557643) b!817128))

(assert (= (and b!817128 c!89261) b!817114))

(assert (= (and b!817128 (not c!89261)) b!817118))

(assert (= (and b!817114 res!557646) b!817112))

(assert (= (or b!817114 b!817118) bm!35579))

(declare-fun b_lambda!10877 () Bool)

(assert (=> (not b_lambda!10877) (not b!817122)))

(declare-fun t!21527 () Bool)

(declare-fun tb!4173 () Bool)

(assert (=> (and start!70410 (= defaultEntry!796 defaultEntry!796) t!21527) tb!4173))

(declare-fun result!7875 () Bool)

(assert (=> tb!4173 (= result!7875 tp_is_empty!14347)))

(assert (=> b!817122 t!21527))

(declare-fun b_and!21441 () Bool)

(assert (= b_and!21435 (and (=> t!21527 result!7875) b_and!21441)))

(declare-fun m!759107 () Bool)

(assert (=> b!817116 m!759107))

(declare-fun m!759109 () Bool)

(assert (=> bm!35581 m!759109))

(declare-fun m!759111 () Bool)

(assert (=> bm!35579 m!759111))

(declare-fun m!759113 () Bool)

(assert (=> b!817113 m!759113))

(declare-fun m!759115 () Bool)

(assert (=> b!817113 m!759115))

(declare-fun m!759117 () Bool)

(assert (=> b!817113 m!759117))

(declare-fun m!759119 () Bool)

(assert (=> b!817113 m!759119))

(declare-fun m!759121 () Bool)

(assert (=> b!817113 m!759121))

(assert (=> b!817113 m!759117))

(declare-fun m!759123 () Bool)

(assert (=> b!817113 m!759123))

(declare-fun m!759125 () Bool)

(assert (=> b!817113 m!759125))

(declare-fun m!759127 () Bool)

(assert (=> b!817113 m!759127))

(assert (=> b!817113 m!759087))

(declare-fun m!759129 () Bool)

(assert (=> b!817113 m!759129))

(declare-fun m!759131 () Bool)

(assert (=> b!817113 m!759131))

(declare-fun m!759133 () Bool)

(assert (=> b!817113 m!759133))

(assert (=> b!817113 m!759129))

(declare-fun m!759135 () Bool)

(assert (=> b!817113 m!759135))

(declare-fun m!759137 () Bool)

(assert (=> b!817113 m!759137))

(assert (=> b!817113 m!759019))

(assert (=> b!817113 m!759125))

(declare-fun m!759139 () Bool)

(assert (=> b!817113 m!759139))

(declare-fun m!759141 () Bool)

(assert (=> b!817113 m!759141))

(assert (=> b!817113 m!759131))

(assert (=> d!104827 m!759021))

(assert (=> b!817123 m!759087))

(assert (=> b!817123 m!759087))

(declare-fun m!759143 () Bool)

(assert (=> b!817123 m!759143))

(assert (=> b!817122 m!759087))

(declare-fun m!759145 () Bool)

(assert (=> b!817122 m!759145))

(declare-fun m!759147 () Bool)

(assert (=> b!817122 m!759147))

(declare-fun m!759149 () Bool)

(assert (=> b!817122 m!759149))

(assert (=> b!817122 m!759147))

(declare-fun m!759151 () Bool)

(assert (=> b!817122 m!759151))

(assert (=> b!817122 m!759087))

(assert (=> b!817122 m!759149))

(assert (=> bm!35585 m!759019))

(declare-fun m!759153 () Bool)

(assert (=> b!817112 m!759153))

(declare-fun m!759155 () Bool)

(assert (=> bm!35583 m!759155))

(assert (=> b!817125 m!759087))

(assert (=> b!817125 m!759087))

(assert (=> b!817125 m!759089))

(declare-fun m!759157 () Bool)

(assert (=> b!817129 m!759157))

(assert (=> b!817119 m!759087))

(assert (=> b!817119 m!759087))

(assert (=> b!817119 m!759089))

(assert (=> b!816989 d!104827))

(declare-fun b!817132 () Bool)

(declare-fun res!557648 () Bool)

(declare-fun e!453319 () Bool)

(assert (=> b!817132 (=> (not res!557648) (not e!453319))))

(declare-fun e!453325 () Bool)

(assert (=> b!817132 (= res!557648 e!453325)))

(declare-fun res!557650 () Bool)

(assert (=> b!817132 (=> res!557650 e!453325)))

(declare-fun e!453326 () Bool)

(assert (=> b!817132 (= res!557650 (not e!453326))))

(declare-fun res!557647 () Bool)

(assert (=> b!817132 (=> (not res!557647) (not e!453326))))

(assert (=> b!817132 (= res!557647 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun bm!35586 () Bool)

(declare-fun call!35590 () Bool)

(declare-fun lt!365908 () ListLongMap!8221)

(assert (=> bm!35586 (= call!35590 (contains!4128 lt!365908 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35587 () Bool)

(declare-fun call!35591 () ListLongMap!8221)

(declare-fun call!35593 () ListLongMap!8221)

(assert (=> bm!35587 (= call!35591 call!35593)))

(declare-fun b!817133 () Bool)

(declare-fun e!453321 () ListLongMap!8221)

(assert (=> b!817133 (= e!453321 call!35591)))

(declare-fun b!817134 () Bool)

(declare-fun e!453324 () ListLongMap!8221)

(declare-fun e!453322 () ListLongMap!8221)

(assert (=> b!817134 (= e!453324 e!453322)))

(declare-fun c!89269 () Bool)

(assert (=> b!817134 (= c!89269 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35588 () Bool)

(declare-fun c!89270 () Bool)

(declare-fun call!35594 () ListLongMap!8221)

(declare-fun call!35595 () ListLongMap!8221)

(declare-fun call!35589 () ListLongMap!8221)

(assert (=> bm!35588 (= call!35593 (+!1805 (ite c!89270 call!35589 (ite c!89269 call!35595 call!35594)) (ite (or c!89270 c!89269) (tuple2!9397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35589 () Bool)

(assert (=> bm!35589 (= call!35595 call!35589)))

(declare-fun b!817135 () Bool)

(declare-fun e!453329 () Bool)

(assert (=> b!817135 (= e!453329 (= (apply!350 lt!365908 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!817136 () Bool)

(declare-fun e!453317 () Unit!27813)

(declare-fun lt!365902 () Unit!27813)

(assert (=> b!817136 (= e!453317 lt!365902)))

(declare-fun lt!365903 () ListLongMap!8221)

(assert (=> b!817136 (= lt!365903 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365909 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365900 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365900 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365907 () Unit!27813)

(assert (=> b!817136 (= lt!365907 (addStillContains!305 lt!365903 lt!365909 zeroValueAfter!34 lt!365900))))

(assert (=> b!817136 (contains!4128 (+!1805 lt!365903 (tuple2!9397 lt!365909 zeroValueAfter!34)) lt!365900)))

(declare-fun lt!365896 () Unit!27813)

(assert (=> b!817136 (= lt!365896 lt!365907)))

(declare-fun lt!365914 () ListLongMap!8221)

(assert (=> b!817136 (= lt!365914 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365897 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365897 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365904 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365904 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365912 () Unit!27813)

(assert (=> b!817136 (= lt!365912 (addApplyDifferent!305 lt!365914 lt!365897 minValue!754 lt!365904))))

(assert (=> b!817136 (= (apply!350 (+!1805 lt!365914 (tuple2!9397 lt!365897 minValue!754)) lt!365904) (apply!350 lt!365914 lt!365904))))

(declare-fun lt!365901 () Unit!27813)

(assert (=> b!817136 (= lt!365901 lt!365912)))

(declare-fun lt!365898 () ListLongMap!8221)

(assert (=> b!817136 (= lt!365898 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365895 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365899 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365899 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365916 () Unit!27813)

(assert (=> b!817136 (= lt!365916 (addApplyDifferent!305 lt!365898 lt!365895 zeroValueAfter!34 lt!365899))))

(assert (=> b!817136 (= (apply!350 (+!1805 lt!365898 (tuple2!9397 lt!365895 zeroValueAfter!34)) lt!365899) (apply!350 lt!365898 lt!365899))))

(declare-fun lt!365911 () Unit!27813)

(assert (=> b!817136 (= lt!365911 lt!365916)))

(declare-fun lt!365905 () ListLongMap!8221)

(assert (=> b!817136 (= lt!365905 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365910 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365910 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365915 () (_ BitVec 64))

(assert (=> b!817136 (= lt!365915 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817136 (= lt!365902 (addApplyDifferent!305 lt!365905 lt!365910 minValue!754 lt!365915))))

(assert (=> b!817136 (= (apply!350 (+!1805 lt!365905 (tuple2!9397 lt!365910 minValue!754)) lt!365915) (apply!350 lt!365905 lt!365915))))

(declare-fun b!817138 () Bool)

(declare-fun Unit!27816 () Unit!27813)

(assert (=> b!817138 (= e!453317 Unit!27816)))

(declare-fun b!817139 () Bool)

(assert (=> b!817139 (= e!453324 (+!1805 call!35593 (tuple2!9397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!817140 () Bool)

(declare-fun c!89268 () Bool)

(assert (=> b!817140 (= c!89268 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!817140 (= e!453322 e!453321)))

(declare-fun b!817141 () Bool)

(declare-fun e!453327 () Bool)

(assert (=> b!817141 (= e!453327 (not call!35590))))

(declare-fun b!817142 () Bool)

(declare-fun e!453318 () Bool)

(assert (=> b!817142 (= e!453318 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35590 () Bool)

(declare-fun call!35592 () Bool)

(assert (=> bm!35590 (= call!35592 (contains!4128 lt!365908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817143 () Bool)

(declare-fun res!557652 () Bool)

(assert (=> b!817143 (=> (not res!557652) (not e!453319))))

(declare-fun e!453328 () Bool)

(assert (=> b!817143 (= res!557652 e!453328)))

(declare-fun c!89272 () Bool)

(assert (=> b!817143 (= c!89272 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!817144 () Bool)

(declare-fun e!453323 () Bool)

(assert (=> b!817144 (= e!453328 e!453323)))

(declare-fun res!557649 () Bool)

(assert (=> b!817144 (= res!557649 call!35592)))

(assert (=> b!817144 (=> (not res!557649) (not e!453323))))

(declare-fun e!453320 () Bool)

(declare-fun b!817145 () Bool)

(assert (=> b!817145 (= e!453320 (= (apply!350 lt!365908 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)) (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!817145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21922 _values!788)))))

(assert (=> b!817145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun bm!35591 () Bool)

(assert (=> bm!35591 (= call!35594 call!35595)))

(declare-fun b!817146 () Bool)

(assert (=> b!817146 (= e!453325 e!453320)))

(declare-fun res!557651 () Bool)

(assert (=> b!817146 (=> (not res!557651) (not e!453320))))

(assert (=> b!817146 (= res!557651 (contains!4128 lt!365908 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun d!104829 () Bool)

(assert (=> d!104829 e!453319))

(declare-fun res!557653 () Bool)

(assert (=> d!104829 (=> (not res!557653) (not e!453319))))

(assert (=> d!104829 (= res!557653 (or (bvsge #b00000000000000000000000000000000 (size!21921 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))))

(declare-fun lt!365906 () ListLongMap!8221)

(assert (=> d!104829 (= lt!365908 lt!365906)))

(declare-fun lt!365913 () Unit!27813)

(assert (=> d!104829 (= lt!365913 e!453317)))

(declare-fun c!89271 () Bool)

(assert (=> d!104829 (= c!89271 e!453318)))

(declare-fun res!557654 () Bool)

(assert (=> d!104829 (=> (not res!557654) (not e!453318))))

(assert (=> d!104829 (= res!557654 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> d!104829 (= lt!365906 e!453324)))

(assert (=> d!104829 (= c!89270 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104829 (validMask!0 mask!1312)))

(assert (=> d!104829 (= (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365908)))

(declare-fun b!817137 () Bool)

(assert (=> b!817137 (= e!453327 e!453329)))

(declare-fun res!557655 () Bool)

(assert (=> b!817137 (= res!557655 call!35590)))

(assert (=> b!817137 (=> (not res!557655) (not e!453329))))

(declare-fun b!817147 () Bool)

(assert (=> b!817147 (= e!453321 call!35594)))

(declare-fun b!817148 () Bool)

(assert (=> b!817148 (= e!453326 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817149 () Bool)

(assert (=> b!817149 (= e!453322 call!35591)))

(declare-fun bm!35592 () Bool)

(assert (=> bm!35592 (= call!35589 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817150 () Bool)

(assert (=> b!817150 (= e!453328 (not call!35592))))

(declare-fun b!817151 () Bool)

(assert (=> b!817151 (= e!453319 e!453327)))

(declare-fun c!89267 () Bool)

(assert (=> b!817151 (= c!89267 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!817152 () Bool)

(assert (=> b!817152 (= e!453323 (= (apply!350 lt!365908 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(assert (= (and d!104829 c!89270) b!817139))

(assert (= (and d!104829 (not c!89270)) b!817134))

(assert (= (and b!817134 c!89269) b!817149))

(assert (= (and b!817134 (not c!89269)) b!817140))

(assert (= (and b!817140 c!89268) b!817133))

(assert (= (and b!817140 (not c!89268)) b!817147))

(assert (= (or b!817133 b!817147) bm!35591))

(assert (= (or b!817149 bm!35591) bm!35589))

(assert (= (or b!817149 b!817133) bm!35587))

(assert (= (or b!817139 bm!35589) bm!35592))

(assert (= (or b!817139 bm!35587) bm!35588))

(assert (= (and d!104829 res!557654) b!817142))

(assert (= (and d!104829 c!89271) b!817136))

(assert (= (and d!104829 (not c!89271)) b!817138))

(assert (= (and d!104829 res!557653) b!817132))

(assert (= (and b!817132 res!557647) b!817148))

(assert (= (and b!817132 (not res!557650)) b!817146))

(assert (= (and b!817146 res!557651) b!817145))

(assert (= (and b!817132 res!557648) b!817143))

(assert (= (and b!817143 c!89272) b!817144))

(assert (= (and b!817143 (not c!89272)) b!817150))

(assert (= (and b!817144 res!557649) b!817152))

(assert (= (or b!817144 b!817150) bm!35590))

(assert (= (and b!817143 res!557652) b!817151))

(assert (= (and b!817151 c!89267) b!817137))

(assert (= (and b!817151 (not c!89267)) b!817141))

(assert (= (and b!817137 res!557655) b!817135))

(assert (= (or b!817137 b!817141) bm!35586))

(declare-fun b_lambda!10879 () Bool)

(assert (=> (not b_lambda!10879) (not b!817145)))

(assert (=> b!817145 t!21527))

(declare-fun b_and!21443 () Bool)

(assert (= b_and!21441 (and (=> t!21527 result!7875) b_and!21443)))

(declare-fun m!759159 () Bool)

(assert (=> b!817139 m!759159))

(declare-fun m!759161 () Bool)

(assert (=> bm!35588 m!759161))

(declare-fun m!759163 () Bool)

(assert (=> bm!35586 m!759163))

(declare-fun m!759165 () Bool)

(assert (=> b!817136 m!759165))

(declare-fun m!759167 () Bool)

(assert (=> b!817136 m!759167))

(declare-fun m!759169 () Bool)

(assert (=> b!817136 m!759169))

(declare-fun m!759171 () Bool)

(assert (=> b!817136 m!759171))

(declare-fun m!759173 () Bool)

(assert (=> b!817136 m!759173))

(assert (=> b!817136 m!759169))

(declare-fun m!759175 () Bool)

(assert (=> b!817136 m!759175))

(declare-fun m!759177 () Bool)

(assert (=> b!817136 m!759177))

(declare-fun m!759179 () Bool)

(assert (=> b!817136 m!759179))

(assert (=> b!817136 m!759087))

(declare-fun m!759181 () Bool)

(assert (=> b!817136 m!759181))

(declare-fun m!759183 () Bool)

(assert (=> b!817136 m!759183))

(declare-fun m!759185 () Bool)

(assert (=> b!817136 m!759185))

(assert (=> b!817136 m!759181))

(declare-fun m!759187 () Bool)

(assert (=> b!817136 m!759187))

(declare-fun m!759189 () Bool)

(assert (=> b!817136 m!759189))

(assert (=> b!817136 m!759017))

(assert (=> b!817136 m!759177))

(declare-fun m!759191 () Bool)

(assert (=> b!817136 m!759191))

(declare-fun m!759193 () Bool)

(assert (=> b!817136 m!759193))

(assert (=> b!817136 m!759183))

(assert (=> d!104829 m!759021))

(assert (=> b!817146 m!759087))

(assert (=> b!817146 m!759087))

(declare-fun m!759195 () Bool)

(assert (=> b!817146 m!759195))

(assert (=> b!817145 m!759087))

(declare-fun m!759197 () Bool)

(assert (=> b!817145 m!759197))

(assert (=> b!817145 m!759147))

(assert (=> b!817145 m!759149))

(assert (=> b!817145 m!759147))

(assert (=> b!817145 m!759151))

(assert (=> b!817145 m!759087))

(assert (=> b!817145 m!759149))

(assert (=> bm!35592 m!759017))

(declare-fun m!759199 () Bool)

(assert (=> b!817135 m!759199))

(declare-fun m!759201 () Bool)

(assert (=> bm!35590 m!759201))

(assert (=> b!817148 m!759087))

(assert (=> b!817148 m!759087))

(assert (=> b!817148 m!759089))

(declare-fun m!759203 () Bool)

(assert (=> b!817152 m!759203))

(assert (=> b!817142 m!759087))

(assert (=> b!817142 m!759087))

(assert (=> b!817142 m!759089))

(assert (=> b!816989 d!104829))

(declare-fun d!104831 () Bool)

(assert (=> d!104831 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70410 d!104831))

(declare-fun d!104833 () Bool)

(assert (=> d!104833 (= (array_inv!17241 _keys!976) (bvsge (size!21921 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70410 d!104833))

(declare-fun d!104835 () Bool)

(assert (=> d!104835 (= (array_inv!17242 _values!788) (bvsge (size!21922 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70410 d!104835))

(declare-fun b!817161 () Bool)

(declare-fun e!453337 () Bool)

(declare-fun e!453338 () Bool)

(assert (=> b!817161 (= e!453337 e!453338)))

(declare-fun c!89275 () Bool)

(assert (=> b!817161 (= c!89275 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104837 () Bool)

(declare-fun res!557661 () Bool)

(assert (=> d!104837 (=> res!557661 e!453337)))

(assert (=> d!104837 (= res!557661 (bvsge #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> d!104837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!453337)))

(declare-fun b!817162 () Bool)

(declare-fun e!453336 () Bool)

(declare-fun call!35598 () Bool)

(assert (=> b!817162 (= e!453336 call!35598)))

(declare-fun bm!35595 () Bool)

(assert (=> bm!35595 (= call!35598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!817163 () Bool)

(assert (=> b!817163 (= e!453338 e!453336)))

(declare-fun lt!365923 () (_ BitVec 64))

(assert (=> b!817163 (= lt!365923 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365925 () Unit!27813)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44895 (_ BitVec 64) (_ BitVec 32)) Unit!27813)

(assert (=> b!817163 (= lt!365925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!365923 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!817163 (arrayContainsKey!0 _keys!976 lt!365923 #b00000000000000000000000000000000)))

(declare-fun lt!365924 () Unit!27813)

(assert (=> b!817163 (= lt!365924 lt!365925)))

(declare-fun res!557660 () Bool)

(declare-datatypes ((SeekEntryResult!8673 0))(
  ( (MissingZero!8673 (index!37063 (_ BitVec 32))) (Found!8673 (index!37064 (_ BitVec 32))) (Intermediate!8673 (undefined!9485 Bool) (index!37065 (_ BitVec 32)) (x!68666 (_ BitVec 32))) (Undefined!8673) (MissingVacant!8673 (index!37066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44895 (_ BitVec 32)) SeekEntryResult!8673)

(assert (=> b!817163 (= res!557660 (= (seekEntryOrOpen!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8673 #b00000000000000000000000000000000)))))

(assert (=> b!817163 (=> (not res!557660) (not e!453336))))

(declare-fun b!817164 () Bool)

(assert (=> b!817164 (= e!453338 call!35598)))

(assert (= (and d!104837 (not res!557661)) b!817161))

(assert (= (and b!817161 c!89275) b!817163))

(assert (= (and b!817161 (not c!89275)) b!817164))

(assert (= (and b!817163 res!557660) b!817162))

(assert (= (or b!817162 b!817164) bm!35595))

(assert (=> b!817161 m!759087))

(assert (=> b!817161 m!759087))

(assert (=> b!817161 m!759089))

(declare-fun m!759205 () Bool)

(assert (=> bm!35595 m!759205))

(assert (=> b!817163 m!759087))

(declare-fun m!759207 () Bool)

(assert (=> b!817163 m!759207))

(declare-fun m!759209 () Bool)

(assert (=> b!817163 m!759209))

(assert (=> b!817163 m!759087))

(declare-fun m!759211 () Bool)

(assert (=> b!817163 m!759211))

(assert (=> b!816984 d!104837))

(declare-fun d!104839 () Bool)

(assert (=> d!104839 (= (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365928 () Unit!27813)

(declare-fun choose!1395 (array!44895 array!44897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 V!24131 V!24131 (_ BitVec 32) Int) Unit!27813)

(assert (=> d!104839 (= lt!365928 (choose!1395 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104839 (validMask!0 mask!1312)))

(assert (=> d!104839 (= (lemmaNoChangeToArrayThenSameMapNoExtras!318 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365928)))

(declare-fun bs!22742 () Bool)

(assert (= bs!22742 d!104839))

(assert (=> bs!22742 m!759019))

(assert (=> bs!22742 m!759017))

(declare-fun m!759213 () Bool)

(assert (=> bs!22742 m!759213))

(assert (=> bs!22742 m!759021))

(assert (=> b!816983 d!104839))

(declare-fun call!35601 () ListLongMap!8221)

(declare-fun bm!35598 () Bool)

(assert (=> bm!35598 (= call!35601 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817189 () Bool)

(declare-fun e!453355 () Bool)

(declare-fun e!453357 () Bool)

(assert (=> b!817189 (= e!453355 e!453357)))

(assert (=> b!817189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun res!557673 () Bool)

(declare-fun lt!365949 () ListLongMap!8221)

(assert (=> b!817189 (= res!557673 (contains!4128 lt!365949 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817189 (=> (not res!557673) (not e!453357))))

(declare-fun e!453356 () Bool)

(declare-fun b!817190 () Bool)

(assert (=> b!817190 (= e!453356 (= lt!365949 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817191 () Bool)

(declare-fun lt!365946 () Unit!27813)

(declare-fun lt!365943 () Unit!27813)

(assert (=> b!817191 (= lt!365946 lt!365943)))

(declare-fun lt!365944 () ListLongMap!8221)

(declare-fun lt!365945 () (_ BitVec 64))

(declare-fun lt!365947 () (_ BitVec 64))

(declare-fun lt!365948 () V!24131)

(assert (=> b!817191 (not (contains!4128 (+!1805 lt!365944 (tuple2!9397 lt!365947 lt!365948)) lt!365945))))

(declare-fun addStillNotContains!177 (ListLongMap!8221 (_ BitVec 64) V!24131 (_ BitVec 64)) Unit!27813)

(assert (=> b!817191 (= lt!365943 (addStillNotContains!177 lt!365944 lt!365947 lt!365948 lt!365945))))

(assert (=> b!817191 (= lt!365945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817191 (= lt!365948 (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817191 (= lt!365947 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817191 (= lt!365944 call!35601)))

(declare-fun e!453358 () ListLongMap!8221)

(assert (=> b!817191 (= e!453358 (+!1805 call!35601 (tuple2!9397 (select (arr!21501 _keys!976) #b00000000000000000000000000000000) (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!817192 () Bool)

(declare-fun e!453353 () Bool)

(assert (=> b!817192 (= e!453353 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817192 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!104841 () Bool)

(declare-fun e!453359 () Bool)

(assert (=> d!104841 e!453359))

(declare-fun res!557670 () Bool)

(assert (=> d!104841 (=> (not res!557670) (not e!453359))))

(assert (=> d!104841 (= res!557670 (not (contains!4128 lt!365949 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!453354 () ListLongMap!8221)

(assert (=> d!104841 (= lt!365949 e!453354)))

(declare-fun c!89286 () Bool)

(assert (=> d!104841 (= c!89286 (bvsge #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> d!104841 (validMask!0 mask!1312)))

(assert (=> d!104841 (= (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365949)))

(declare-fun b!817193 () Bool)

(assert (=> b!817193 (= e!453354 e!453358)))

(declare-fun c!89284 () Bool)

(assert (=> b!817193 (= c!89284 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817194 () Bool)

(declare-fun isEmpty!638 (ListLongMap!8221) Bool)

(assert (=> b!817194 (= e!453356 (isEmpty!638 lt!365949))))

(declare-fun b!817195 () Bool)

(assert (=> b!817195 (= e!453359 e!453355)))

(declare-fun c!89285 () Bool)

(assert (=> b!817195 (= c!89285 e!453353)))

(declare-fun res!557671 () Bool)

(assert (=> b!817195 (=> (not res!557671) (not e!453353))))

(assert (=> b!817195 (= res!557671 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun b!817196 () Bool)

(assert (=> b!817196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> b!817196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21922 _values!788)))))

(assert (=> b!817196 (= e!453357 (= (apply!350 lt!365949 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)) (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817197 () Bool)

(assert (=> b!817197 (= e!453355 e!453356)))

(declare-fun c!89287 () Bool)

(assert (=> b!817197 (= c!89287 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun b!817198 () Bool)

(declare-fun res!557672 () Bool)

(assert (=> b!817198 (=> (not res!557672) (not e!453359))))

(assert (=> b!817198 (= res!557672 (not (contains!4128 lt!365949 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!817199 () Bool)

(assert (=> b!817199 (= e!453358 call!35601)))

(declare-fun b!817200 () Bool)

(assert (=> b!817200 (= e!453354 (ListLongMap!8222 Nil!15205))))

(assert (= (and d!104841 c!89286) b!817200))

(assert (= (and d!104841 (not c!89286)) b!817193))

(assert (= (and b!817193 c!89284) b!817191))

(assert (= (and b!817193 (not c!89284)) b!817199))

(assert (= (or b!817191 b!817199) bm!35598))

(assert (= (and d!104841 res!557670) b!817198))

(assert (= (and b!817198 res!557672) b!817195))

(assert (= (and b!817195 res!557671) b!817192))

(assert (= (and b!817195 c!89285) b!817189))

(assert (= (and b!817195 (not c!89285)) b!817197))

(assert (= (and b!817189 res!557673) b!817196))

(assert (= (and b!817197 c!89287) b!817190))

(assert (= (and b!817197 (not c!89287)) b!817194))

(declare-fun b_lambda!10881 () Bool)

(assert (=> (not b_lambda!10881) (not b!817191)))

(assert (=> b!817191 t!21527))

(declare-fun b_and!21445 () Bool)

(assert (= b_and!21443 (and (=> t!21527 result!7875) b_and!21445)))

(declare-fun b_lambda!10883 () Bool)

(assert (=> (not b_lambda!10883) (not b!817196)))

(assert (=> b!817196 t!21527))

(declare-fun b_and!21447 () Bool)

(assert (= b_and!21445 (and (=> t!21527 result!7875) b_and!21447)))

(declare-fun m!759215 () Bool)

(assert (=> bm!35598 m!759215))

(assert (=> b!817193 m!759087))

(assert (=> b!817193 m!759087))

(assert (=> b!817193 m!759089))

(assert (=> b!817190 m!759215))

(assert (=> b!817189 m!759087))

(assert (=> b!817189 m!759087))

(declare-fun m!759217 () Bool)

(assert (=> b!817189 m!759217))

(assert (=> b!817196 m!759147))

(assert (=> b!817196 m!759087))

(declare-fun m!759219 () Bool)

(assert (=> b!817196 m!759219))

(assert (=> b!817196 m!759149))

(assert (=> b!817196 m!759087))

(assert (=> b!817196 m!759149))

(assert (=> b!817196 m!759147))

(assert (=> b!817196 m!759151))

(declare-fun m!759221 () Bool)

(assert (=> b!817198 m!759221))

(declare-fun m!759223 () Bool)

(assert (=> b!817194 m!759223))

(declare-fun m!759225 () Bool)

(assert (=> d!104841 m!759225))

(assert (=> d!104841 m!759021))

(assert (=> b!817192 m!759087))

(assert (=> b!817192 m!759087))

(assert (=> b!817192 m!759089))

(assert (=> b!817191 m!759147))

(declare-fun m!759227 () Bool)

(assert (=> b!817191 m!759227))

(assert (=> b!817191 m!759227))

(declare-fun m!759229 () Bool)

(assert (=> b!817191 m!759229))

(assert (=> b!817191 m!759149))

(declare-fun m!759231 () Bool)

(assert (=> b!817191 m!759231))

(declare-fun m!759233 () Bool)

(assert (=> b!817191 m!759233))

(assert (=> b!817191 m!759087))

(assert (=> b!817191 m!759149))

(assert (=> b!817191 m!759147))

(assert (=> b!817191 m!759151))

(assert (=> b!816983 d!104841))

(declare-fun call!35602 () ListLongMap!8221)

(declare-fun bm!35599 () Bool)

(assert (=> bm!35599 (= call!35602 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817201 () Bool)

(declare-fun e!453362 () Bool)

(declare-fun e!453364 () Bool)

(assert (=> b!817201 (= e!453362 e!453364)))

(assert (=> b!817201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun res!557677 () Bool)

(declare-fun lt!365956 () ListLongMap!8221)

(assert (=> b!817201 (= res!557677 (contains!4128 lt!365956 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817201 (=> (not res!557677) (not e!453364))))

(declare-fun b!817202 () Bool)

(declare-fun e!453363 () Bool)

(assert (=> b!817202 (= e!453363 (= lt!365956 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817203 () Bool)

(declare-fun lt!365953 () Unit!27813)

(declare-fun lt!365950 () Unit!27813)

(assert (=> b!817203 (= lt!365953 lt!365950)))

(declare-fun lt!365954 () (_ BitVec 64))

(declare-fun lt!365952 () (_ BitVec 64))

(declare-fun lt!365955 () V!24131)

(declare-fun lt!365951 () ListLongMap!8221)

(assert (=> b!817203 (not (contains!4128 (+!1805 lt!365951 (tuple2!9397 lt!365954 lt!365955)) lt!365952))))

(assert (=> b!817203 (= lt!365950 (addStillNotContains!177 lt!365951 lt!365954 lt!365955 lt!365952))))

(assert (=> b!817203 (= lt!365952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817203 (= lt!365955 (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817203 (= lt!365954 (select (arr!21501 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817203 (= lt!365951 call!35602)))

(declare-fun e!453365 () ListLongMap!8221)

(assert (=> b!817203 (= e!453365 (+!1805 call!35602 (tuple2!9397 (select (arr!21501 _keys!976) #b00000000000000000000000000000000) (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!817204 () Bool)

(declare-fun e!453360 () Bool)

(assert (=> b!817204 (= e!453360 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817204 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!104843 () Bool)

(declare-fun e!453366 () Bool)

(assert (=> d!104843 e!453366))

(declare-fun res!557674 () Bool)

(assert (=> d!104843 (=> (not res!557674) (not e!453366))))

(assert (=> d!104843 (= res!557674 (not (contains!4128 lt!365956 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!453361 () ListLongMap!8221)

(assert (=> d!104843 (= lt!365956 e!453361)))

(declare-fun c!89290 () Bool)

(assert (=> d!104843 (= c!89290 (bvsge #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> d!104843 (validMask!0 mask!1312)))

(assert (=> d!104843 (= (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365956)))

(declare-fun b!817205 () Bool)

(assert (=> b!817205 (= e!453361 e!453365)))

(declare-fun c!89288 () Bool)

(assert (=> b!817205 (= c!89288 (validKeyInArray!0 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817206 () Bool)

(assert (=> b!817206 (= e!453363 (isEmpty!638 lt!365956))))

(declare-fun b!817207 () Bool)

(assert (=> b!817207 (= e!453366 e!453362)))

(declare-fun c!89289 () Bool)

(assert (=> b!817207 (= c!89289 e!453360)))

(declare-fun res!557675 () Bool)

(assert (=> b!817207 (=> (not res!557675) (not e!453360))))

(assert (=> b!817207 (= res!557675 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun b!817208 () Bool)

(assert (=> b!817208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(assert (=> b!817208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21922 _values!788)))))

(assert (=> b!817208 (= e!453364 (= (apply!350 lt!365956 (select (arr!21501 _keys!976) #b00000000000000000000000000000000)) (get!11512 (select (arr!21502 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817209 () Bool)

(assert (=> b!817209 (= e!453362 e!453363)))

(declare-fun c!89291 () Bool)

(assert (=> b!817209 (= c!89291 (bvslt #b00000000000000000000000000000000 (size!21921 _keys!976)))))

(declare-fun b!817210 () Bool)

(declare-fun res!557676 () Bool)

(assert (=> b!817210 (=> (not res!557676) (not e!453366))))

(assert (=> b!817210 (= res!557676 (not (contains!4128 lt!365956 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!817211 () Bool)

(assert (=> b!817211 (= e!453365 call!35602)))

(declare-fun b!817212 () Bool)

(assert (=> b!817212 (= e!453361 (ListLongMap!8222 Nil!15205))))

(assert (= (and d!104843 c!89290) b!817212))

(assert (= (and d!104843 (not c!89290)) b!817205))

(assert (= (and b!817205 c!89288) b!817203))

(assert (= (and b!817205 (not c!89288)) b!817211))

(assert (= (or b!817203 b!817211) bm!35599))

(assert (= (and d!104843 res!557674) b!817210))

(assert (= (and b!817210 res!557676) b!817207))

(assert (= (and b!817207 res!557675) b!817204))

(assert (= (and b!817207 c!89289) b!817201))

(assert (= (and b!817207 (not c!89289)) b!817209))

(assert (= (and b!817201 res!557677) b!817208))

(assert (= (and b!817209 c!89291) b!817202))

(assert (= (and b!817209 (not c!89291)) b!817206))

(declare-fun b_lambda!10885 () Bool)

(assert (=> (not b_lambda!10885) (not b!817203)))

(assert (=> b!817203 t!21527))

(declare-fun b_and!21449 () Bool)

(assert (= b_and!21447 (and (=> t!21527 result!7875) b_and!21449)))

(declare-fun b_lambda!10887 () Bool)

(assert (=> (not b_lambda!10887) (not b!817208)))

(assert (=> b!817208 t!21527))

(declare-fun b_and!21451 () Bool)

(assert (= b_and!21449 (and (=> t!21527 result!7875) b_and!21451)))

(declare-fun m!759235 () Bool)

(assert (=> bm!35599 m!759235))

(assert (=> b!817205 m!759087))

(assert (=> b!817205 m!759087))

(assert (=> b!817205 m!759089))

(assert (=> b!817202 m!759235))

(assert (=> b!817201 m!759087))

(assert (=> b!817201 m!759087))

(declare-fun m!759237 () Bool)

(assert (=> b!817201 m!759237))

(assert (=> b!817208 m!759147))

(assert (=> b!817208 m!759087))

(declare-fun m!759239 () Bool)

(assert (=> b!817208 m!759239))

(assert (=> b!817208 m!759149))

(assert (=> b!817208 m!759087))

(assert (=> b!817208 m!759149))

(assert (=> b!817208 m!759147))

(assert (=> b!817208 m!759151))

(declare-fun m!759241 () Bool)

(assert (=> b!817210 m!759241))

(declare-fun m!759243 () Bool)

(assert (=> b!817206 m!759243))

(declare-fun m!759245 () Bool)

(assert (=> d!104843 m!759245))

(assert (=> d!104843 m!759021))

(assert (=> b!817204 m!759087))

(assert (=> b!817204 m!759087))

(assert (=> b!817204 m!759089))

(assert (=> b!817203 m!759147))

(declare-fun m!759247 () Bool)

(assert (=> b!817203 m!759247))

(assert (=> b!817203 m!759247))

(declare-fun m!759249 () Bool)

(assert (=> b!817203 m!759249))

(assert (=> b!817203 m!759149))

(declare-fun m!759251 () Bool)

(assert (=> b!817203 m!759251))

(declare-fun m!759253 () Bool)

(assert (=> b!817203 m!759253))

(assert (=> b!817203 m!759087))

(assert (=> b!817203 m!759149))

(assert (=> b!817203 m!759147))

(assert (=> b!817203 m!759151))

(assert (=> b!816983 d!104843))

(declare-fun b!817220 () Bool)

(declare-fun e!453372 () Bool)

(assert (=> b!817220 (= e!453372 tp_is_empty!14347)))

(declare-fun mapIsEmpty!23116 () Bool)

(declare-fun mapRes!23116 () Bool)

(assert (=> mapIsEmpty!23116 mapRes!23116))

(declare-fun b!817219 () Bool)

(declare-fun e!453371 () Bool)

(assert (=> b!817219 (= e!453371 tp_is_empty!14347)))

(declare-fun condMapEmpty!23116 () Bool)

(declare-fun mapDefault!23116 () ValueCell!6758)

(assert (=> mapNonEmpty!23107 (= condMapEmpty!23116 (= mapRest!23107 ((as const (Array (_ BitVec 32) ValueCell!6758)) mapDefault!23116)))))

(assert (=> mapNonEmpty!23107 (= tp!44631 (and e!453372 mapRes!23116))))

(declare-fun mapNonEmpty!23116 () Bool)

(declare-fun tp!44647 () Bool)

(assert (=> mapNonEmpty!23116 (= mapRes!23116 (and tp!44647 e!453371))))

(declare-fun mapValue!23116 () ValueCell!6758)

(declare-fun mapKey!23116 () (_ BitVec 32))

(declare-fun mapRest!23116 () (Array (_ BitVec 32) ValueCell!6758))

(assert (=> mapNonEmpty!23116 (= mapRest!23107 (store mapRest!23116 mapKey!23116 mapValue!23116))))

(assert (= (and mapNonEmpty!23107 condMapEmpty!23116) mapIsEmpty!23116))

(assert (= (and mapNonEmpty!23107 (not condMapEmpty!23116)) mapNonEmpty!23116))

(assert (= (and mapNonEmpty!23116 ((_ is ValueCellFull!6758) mapValue!23116)) b!817219))

(assert (= (and mapNonEmpty!23107 ((_ is ValueCellFull!6758) mapDefault!23116)) b!817220))

(declare-fun m!759255 () Bool)

(assert (=> mapNonEmpty!23116 m!759255))

(declare-fun b_lambda!10889 () Bool)

(assert (= b_lambda!10885 (or (and start!70410 b_free!12637) b_lambda!10889)))

(declare-fun b_lambda!10891 () Bool)

(assert (= b_lambda!10883 (or (and start!70410 b_free!12637) b_lambda!10891)))

(declare-fun b_lambda!10893 () Bool)

(assert (= b_lambda!10879 (or (and start!70410 b_free!12637) b_lambda!10893)))

(declare-fun b_lambda!10895 () Bool)

(assert (= b_lambda!10881 (or (and start!70410 b_free!12637) b_lambda!10895)))

(declare-fun b_lambda!10897 () Bool)

(assert (= b_lambda!10887 (or (and start!70410 b_free!12637) b_lambda!10897)))

(declare-fun b_lambda!10899 () Bool)

(assert (= b_lambda!10877 (or (and start!70410 b_free!12637) b_lambda!10899)))

(check-sat (not b_lambda!10897) (not bm!35581) (not bm!35598) (not b!817201) (not mapNonEmpty!23116) (not b!817122) (not b!817139) (not b!817210) (not b!817145) (not bm!35585) (not b_lambda!10893) (not bm!35590) (not b!817191) (not b!817208) (not bm!35595) (not b!817146) (not b!817056) tp_is_empty!14347 (not b!817123) (not b!817113) (not d!104825) (not b!817198) (not b_lambda!10899) (not b!817189) (not b!817129) (not b!817192) (not b!817206) (not b!817135) (not b!817057) (not b!817066) (not d!104839) (not b_next!12637) (not b!817161) (not b!817148) (not b!817163) (not b!817202) (not b!817204) (not b!817116) (not b!817203) (not b!817125) (not b!817112) (not bm!35599) (not b!817142) (not b!817194) (not b!817196) (not bm!35579) b_and!21451 (not d!104829) (not bm!35586) (not b!817119) (not b!817205) (not d!104841) (not b!817193) (not b!817136) (not bm!35583) (not d!104827) (not b_lambda!10895) (not b!817190) (not b!817152) (not d!104843) (not bm!35592) (not b_lambda!10891) (not bm!35564) (not b!817059) (not b!817065) (not b_lambda!10889) (not bm!35588))
(check-sat b_and!21451 (not b_next!12637))

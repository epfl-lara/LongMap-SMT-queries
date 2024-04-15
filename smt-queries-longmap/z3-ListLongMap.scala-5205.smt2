; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70224 () Bool)

(assert start!70224)

(declare-fun b_free!12637 () Bool)

(declare-fun b_next!12637 () Bool)

(assert (=> start!70224 (= b_free!12637 (not b_next!12637))))

(declare-fun tp!44632 () Bool)

(declare-fun b_and!21399 () Bool)

(assert (=> start!70224 (= tp!44632 b_and!21399)))

(declare-fun mapIsEmpty!23107 () Bool)

(declare-fun mapRes!23107 () Bool)

(assert (=> mapIsEmpty!23107 mapRes!23107))

(declare-fun b!815843 () Bool)

(declare-fun res!557111 () Bool)

(declare-fun e!452493 () Bool)

(assert (=> b!815843 (=> (not res!557111) (not e!452493))))

(declare-datatypes ((array!44879 0))(
  ( (array!44880 (arr!21498 (Array (_ BitVec 32) (_ BitVec 64))) (size!21919 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44879)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44879 (_ BitVec 32)) Bool)

(assert (=> b!815843 (= res!557111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815844 () Bool)

(declare-fun res!557114 () Bool)

(declare-fun e!452497 () Bool)

(assert (=> b!815844 (=> res!557114 e!452497)))

(declare-datatypes ((V!24131 0))(
  ( (V!24132 (val!7221 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24131)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24131)

(declare-fun minValue!754 () V!24131)

(declare-datatypes ((ValueCell!6758 0))(
  ( (ValueCellFull!6758 (v!9642 V!24131)) (EmptyCell!6758) )
))
(declare-datatypes ((array!44881 0))(
  ( (array!44882 (arr!21499 (Array (_ BitVec 32) ValueCell!6758)) (size!21920 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44881)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9502 0))(
  ( (tuple2!9503 (_1!4762 (_ BitVec 64)) (_2!4762 V!24131)) )
))
(declare-datatypes ((List!15327 0))(
  ( (Nil!15324) (Cons!15323 (h!16452 tuple2!9502) (t!21639 List!15327)) )
))
(declare-datatypes ((ListLongMap!8315 0))(
  ( (ListLongMap!8316 (toList!4173 List!15327)) )
))
(declare-fun +!1836 (ListLongMap!8315 tuple2!9502) ListLongMap!8315)

(declare-fun getCurrentListMap!2348 (array!44879 array!44881 (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 (_ BitVec 32) Int) ListLongMap!8315)

(assert (=> b!815844 (= res!557114 (not (= (+!1836 (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(declare-fun mapNonEmpty!23107 () Bool)

(declare-fun tp!44631 () Bool)

(declare-fun e!452498 () Bool)

(assert (=> mapNonEmpty!23107 (= mapRes!23107 (and tp!44631 e!452498))))

(declare-fun mapValue!23107 () ValueCell!6758)

(declare-fun mapKey!23107 () (_ BitVec 32))

(declare-fun mapRest!23107 () (Array (_ BitVec 32) ValueCell!6758))

(assert (=> mapNonEmpty!23107 (= (arr!21499 _values!788) (store mapRest!23107 mapKey!23107 mapValue!23107))))

(declare-fun b!815845 () Bool)

(assert (=> b!815845 (= e!452493 (not e!452497))))

(declare-fun res!557113 () Bool)

(assert (=> b!815845 (=> res!557113 e!452497)))

(assert (=> b!815845 (= res!557113 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365200 () ListLongMap!8315)

(declare-fun lt!365199 () ListLongMap!8315)

(assert (=> b!815845 (= lt!365200 lt!365199)))

(declare-datatypes ((Unit!27774 0))(
  ( (Unit!27775) )
))
(declare-fun lt!365201 () Unit!27774)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!328 (array!44879 array!44881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 V!24131 V!24131 (_ BitVec 32) Int) Unit!27774)

(assert (=> b!815845 (= lt!365201 (lemmaNoChangeToArrayThenSameMapNoExtras!328 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2235 (array!44879 array!44881 (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 (_ BitVec 32) Int) ListLongMap!8315)

(assert (=> b!815845 (= lt!365199 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815845 (= lt!365200 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815846 () Bool)

(declare-fun e!452495 () Bool)

(declare-fun tp_is_empty!14347 () Bool)

(assert (=> b!815846 (= e!452495 tp_is_empty!14347)))

(declare-fun b!815847 () Bool)

(assert (=> b!815847 (= e!452498 tp_is_empty!14347)))

(declare-fun b!815848 () Bool)

(assert (=> b!815848 (= e!452497 (bvsle #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun res!557115 () Bool)

(assert (=> start!70224 (=> (not res!557115) (not e!452493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70224 (= res!557115 (validMask!0 mask!1312))))

(assert (=> start!70224 e!452493))

(assert (=> start!70224 tp_is_empty!14347))

(declare-fun array_inv!17281 (array!44879) Bool)

(assert (=> start!70224 (array_inv!17281 _keys!976)))

(assert (=> start!70224 true))

(declare-fun e!452494 () Bool)

(declare-fun array_inv!17282 (array!44881) Bool)

(assert (=> start!70224 (and (array_inv!17282 _values!788) e!452494)))

(assert (=> start!70224 tp!44632))

(declare-fun b!815849 () Bool)

(declare-fun res!557112 () Bool)

(assert (=> b!815849 (=> (not res!557112) (not e!452493))))

(assert (=> b!815849 (= res!557112 (and (= (size!21920 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21919 _keys!976) (size!21920 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815850 () Bool)

(assert (=> b!815850 (= e!452494 (and e!452495 mapRes!23107))))

(declare-fun condMapEmpty!23107 () Bool)

(declare-fun mapDefault!23107 () ValueCell!6758)

(assert (=> b!815850 (= condMapEmpty!23107 (= (arr!21499 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6758)) mapDefault!23107)))))

(declare-fun b!815851 () Bool)

(declare-fun res!557116 () Bool)

(assert (=> b!815851 (=> (not res!557116) (not e!452493))))

(declare-datatypes ((List!15328 0))(
  ( (Nil!15325) (Cons!15324 (h!16453 (_ BitVec 64)) (t!21640 List!15328)) )
))
(declare-fun arrayNoDuplicates!0 (array!44879 (_ BitVec 32) List!15328) Bool)

(assert (=> b!815851 (= res!557116 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15325))))

(assert (= (and start!70224 res!557115) b!815849))

(assert (= (and b!815849 res!557112) b!815843))

(assert (= (and b!815843 res!557111) b!815851))

(assert (= (and b!815851 res!557116) b!815845))

(assert (= (and b!815845 (not res!557113)) b!815844))

(assert (= (and b!815844 (not res!557114)) b!815848))

(assert (= (and b!815850 condMapEmpty!23107) mapIsEmpty!23107))

(assert (= (and b!815850 (not condMapEmpty!23107)) mapNonEmpty!23107))

(get-info :version)

(assert (= (and mapNonEmpty!23107 ((_ is ValueCellFull!6758) mapValue!23107)) b!815847))

(assert (= (and b!815850 ((_ is ValueCellFull!6758) mapDefault!23107)) b!815846))

(assert (= start!70224 b!815850))

(declare-fun m!756981 () Bool)

(assert (=> b!815843 m!756981))

(declare-fun m!756983 () Bool)

(assert (=> b!815844 m!756983))

(assert (=> b!815844 m!756983))

(declare-fun m!756985 () Bool)

(assert (=> b!815844 m!756985))

(declare-fun m!756987 () Bool)

(assert (=> b!815844 m!756987))

(declare-fun m!756989 () Bool)

(assert (=> b!815845 m!756989))

(declare-fun m!756991 () Bool)

(assert (=> b!815845 m!756991))

(declare-fun m!756993 () Bool)

(assert (=> b!815845 m!756993))

(declare-fun m!756995 () Bool)

(assert (=> b!815851 m!756995))

(declare-fun m!756997 () Bool)

(assert (=> start!70224 m!756997))

(declare-fun m!756999 () Bool)

(assert (=> start!70224 m!756999))

(declare-fun m!757001 () Bool)

(assert (=> start!70224 m!757001))

(declare-fun m!757003 () Bool)

(assert (=> mapNonEmpty!23107 m!757003))

(check-sat (not mapNonEmpty!23107) (not b!815844) b_and!21399 (not start!70224) tp_is_empty!14347 (not b!815845) (not b_next!12637) (not b!815851) (not b!815843))
(check-sat b_and!21399 (not b_next!12637))
(get-model)

(declare-fun d!104307 () Bool)

(assert (=> d!104307 (= (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365222 () Unit!27774)

(declare-fun choose!1398 (array!44879 array!44881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 V!24131 V!24131 (_ BitVec 32) Int) Unit!27774)

(assert (=> d!104307 (= lt!365222 (choose!1398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104307 (validMask!0 mask!1312)))

(assert (=> d!104307 (= (lemmaNoChangeToArrayThenSameMapNoExtras!328 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365222)))

(declare-fun bs!22696 () Bool)

(assert (= bs!22696 d!104307))

(assert (=> bs!22696 m!756993))

(assert (=> bs!22696 m!756991))

(declare-fun m!757053 () Bool)

(assert (=> bs!22696 m!757053))

(assert (=> bs!22696 m!756997))

(assert (=> b!815845 d!104307))

(declare-fun b!815930 () Bool)

(declare-fun e!452554 () ListLongMap!8315)

(declare-fun call!35496 () ListLongMap!8315)

(assert (=> b!815930 (= e!452554 call!35496)))

(declare-fun b!815931 () Bool)

(assert (=> b!815931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> b!815931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21920 _values!788)))))

(declare-fun lt!365240 () ListLongMap!8315)

(declare-fun e!452549 () Bool)

(declare-fun apply!350 (ListLongMap!8315 (_ BitVec 64)) V!24131)

(declare-fun get!11515 (ValueCell!6758 V!24131) V!24131)

(declare-fun dynLambda!964 (Int (_ BitVec 64)) V!24131)

(assert (=> b!815931 (= e!452549 (= (apply!350 lt!365240 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)) (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!35493 () Bool)

(assert (=> bm!35493 (= call!35496 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!815932 () Bool)

(declare-fun e!452550 () Bool)

(assert (=> b!815932 (= e!452550 e!452549)))

(assert (=> b!815932 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun res!557162 () Bool)

(declare-fun contains!4128 (ListLongMap!8315 (_ BitVec 64)) Bool)

(assert (=> b!815932 (= res!557162 (contains!4128 lt!365240 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815932 (=> (not res!557162) (not e!452549))))

(declare-fun b!815933 () Bool)

(declare-fun e!452553 () Bool)

(assert (=> b!815933 (= e!452553 (= lt!365240 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!815934 () Bool)

(declare-fun e!452551 () ListLongMap!8315)

(assert (=> b!815934 (= e!452551 e!452554)))

(declare-fun c!88909 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!815934 (= c!88909 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815935 () Bool)

(declare-fun e!452555 () Bool)

(assert (=> b!815935 (= e!452555 e!452550)))

(declare-fun c!88908 () Bool)

(declare-fun e!452552 () Bool)

(assert (=> b!815935 (= c!88908 e!452552)))

(declare-fun res!557161 () Bool)

(assert (=> b!815935 (=> (not res!557161) (not e!452552))))

(assert (=> b!815935 (= res!557161 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!815937 () Bool)

(assert (=> b!815937 (= e!452551 (ListLongMap!8316 Nil!15324))))

(declare-fun b!815938 () Bool)

(declare-fun res!557163 () Bool)

(assert (=> b!815938 (=> (not res!557163) (not e!452555))))

(assert (=> b!815938 (= res!557163 (not (contains!4128 lt!365240 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815939 () Bool)

(assert (=> b!815939 (= e!452550 e!452553)))

(declare-fun c!88910 () Bool)

(assert (=> b!815939 (= c!88910 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!815940 () Bool)

(declare-fun isEmpty!637 (ListLongMap!8315) Bool)

(assert (=> b!815940 (= e!452553 (isEmpty!637 lt!365240))))

(declare-fun b!815941 () Bool)

(assert (=> b!815941 (= e!452552 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815941 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!104309 () Bool)

(assert (=> d!104309 e!452555))

(declare-fun res!557164 () Bool)

(assert (=> d!104309 (=> (not res!557164) (not e!452555))))

(assert (=> d!104309 (= res!557164 (not (contains!4128 lt!365240 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104309 (= lt!365240 e!452551)))

(declare-fun c!88907 () Bool)

(assert (=> d!104309 (= c!88907 (bvsge #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> d!104309 (validMask!0 mask!1312)))

(assert (=> d!104309 (= (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365240)))

(declare-fun b!815936 () Bool)

(declare-fun lt!365242 () Unit!27774)

(declare-fun lt!365237 () Unit!27774)

(assert (=> b!815936 (= lt!365242 lt!365237)))

(declare-fun lt!365243 () ListLongMap!8315)

(declare-fun lt!365238 () V!24131)

(declare-fun lt!365241 () (_ BitVec 64))

(declare-fun lt!365239 () (_ BitVec 64))

(assert (=> b!815936 (not (contains!4128 (+!1836 lt!365243 (tuple2!9503 lt!365241 lt!365238)) lt!365239))))

(declare-fun addStillNotContains!176 (ListLongMap!8315 (_ BitVec 64) V!24131 (_ BitVec 64)) Unit!27774)

(assert (=> b!815936 (= lt!365237 (addStillNotContains!176 lt!365243 lt!365241 lt!365238 lt!365239))))

(assert (=> b!815936 (= lt!365239 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!815936 (= lt!365238 (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815936 (= lt!365241 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!815936 (= lt!365243 call!35496)))

(assert (=> b!815936 (= e!452554 (+!1836 call!35496 (tuple2!9503 (select (arr!21498 _keys!976) #b00000000000000000000000000000000) (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!104309 c!88907) b!815937))

(assert (= (and d!104309 (not c!88907)) b!815934))

(assert (= (and b!815934 c!88909) b!815936))

(assert (= (and b!815934 (not c!88909)) b!815930))

(assert (= (or b!815936 b!815930) bm!35493))

(assert (= (and d!104309 res!557164) b!815938))

(assert (= (and b!815938 res!557163) b!815935))

(assert (= (and b!815935 res!557161) b!815941))

(assert (= (and b!815935 c!88908) b!815932))

(assert (= (and b!815935 (not c!88908)) b!815939))

(assert (= (and b!815932 res!557162) b!815931))

(assert (= (and b!815939 c!88910) b!815933))

(assert (= (and b!815939 (not c!88910)) b!815940))

(declare-fun b_lambda!10845 () Bool)

(assert (=> (not b_lambda!10845) (not b!815931)))

(declare-fun t!21644 () Bool)

(declare-fun tb!4173 () Bool)

(assert (=> (and start!70224 (= defaultEntry!796 defaultEntry!796) t!21644) tb!4173))

(declare-fun result!7875 () Bool)

(assert (=> tb!4173 (= result!7875 tp_is_empty!14347)))

(assert (=> b!815931 t!21644))

(declare-fun b_and!21405 () Bool)

(assert (= b_and!21399 (and (=> t!21644 result!7875) b_and!21405)))

(declare-fun b_lambda!10847 () Bool)

(assert (=> (not b_lambda!10847) (not b!815936)))

(assert (=> b!815936 t!21644))

(declare-fun b_and!21407 () Bool)

(assert (= b_and!21405 (and (=> t!21644 result!7875) b_and!21407)))

(declare-fun m!757055 () Bool)

(assert (=> b!815938 m!757055))

(declare-fun m!757057 () Bool)

(assert (=> b!815931 m!757057))

(declare-fun m!757059 () Bool)

(assert (=> b!815931 m!757059))

(declare-fun m!757061 () Bool)

(assert (=> b!815931 m!757061))

(assert (=> b!815931 m!757057))

(assert (=> b!815931 m!757061))

(declare-fun m!757063 () Bool)

(assert (=> b!815931 m!757063))

(assert (=> b!815931 m!757059))

(declare-fun m!757065 () Bool)

(assert (=> b!815931 m!757065))

(assert (=> b!815936 m!757057))

(assert (=> b!815936 m!757061))

(assert (=> b!815936 m!757057))

(assert (=> b!815936 m!757061))

(assert (=> b!815936 m!757063))

(declare-fun m!757067 () Bool)

(assert (=> b!815936 m!757067))

(declare-fun m!757069 () Bool)

(assert (=> b!815936 m!757069))

(declare-fun m!757071 () Bool)

(assert (=> b!815936 m!757071))

(assert (=> b!815936 m!757059))

(assert (=> b!815936 m!757069))

(declare-fun m!757073 () Bool)

(assert (=> b!815936 m!757073))

(assert (=> b!815941 m!757059))

(assert (=> b!815941 m!757059))

(declare-fun m!757075 () Bool)

(assert (=> b!815941 m!757075))

(declare-fun m!757077 () Bool)

(assert (=> b!815940 m!757077))

(assert (=> b!815932 m!757059))

(assert (=> b!815932 m!757059))

(declare-fun m!757079 () Bool)

(assert (=> b!815932 m!757079))

(declare-fun m!757081 () Bool)

(assert (=> bm!35493 m!757081))

(declare-fun m!757083 () Bool)

(assert (=> d!104309 m!757083))

(assert (=> d!104309 m!756997))

(assert (=> b!815933 m!757081))

(assert (=> b!815934 m!757059))

(assert (=> b!815934 m!757059))

(assert (=> b!815934 m!757075))

(assert (=> b!815845 d!104309))

(declare-fun b!815944 () Bool)

(declare-fun e!452561 () ListLongMap!8315)

(declare-fun call!35497 () ListLongMap!8315)

(assert (=> b!815944 (= e!452561 call!35497)))

(declare-fun b!815945 () Bool)

(assert (=> b!815945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> b!815945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21920 _values!788)))))

(declare-fun e!452556 () Bool)

(declare-fun lt!365247 () ListLongMap!8315)

(assert (=> b!815945 (= e!452556 (= (apply!350 lt!365247 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)) (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!35494 () Bool)

(assert (=> bm!35494 (= call!35497 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!815946 () Bool)

(declare-fun e!452557 () Bool)

(assert (=> b!815946 (= e!452557 e!452556)))

(assert (=> b!815946 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun res!557166 () Bool)

(assert (=> b!815946 (= res!557166 (contains!4128 lt!365247 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815946 (=> (not res!557166) (not e!452556))))

(declare-fun b!815947 () Bool)

(declare-fun e!452560 () Bool)

(assert (=> b!815947 (= e!452560 (= lt!365247 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!815948 () Bool)

(declare-fun e!452558 () ListLongMap!8315)

(assert (=> b!815948 (= e!452558 e!452561)))

(declare-fun c!88913 () Bool)

(assert (=> b!815948 (= c!88913 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815949 () Bool)

(declare-fun e!452562 () Bool)

(assert (=> b!815949 (= e!452562 e!452557)))

(declare-fun c!88912 () Bool)

(declare-fun e!452559 () Bool)

(assert (=> b!815949 (= c!88912 e!452559)))

(declare-fun res!557165 () Bool)

(assert (=> b!815949 (=> (not res!557165) (not e!452559))))

(assert (=> b!815949 (= res!557165 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!815951 () Bool)

(assert (=> b!815951 (= e!452558 (ListLongMap!8316 Nil!15324))))

(declare-fun b!815952 () Bool)

(declare-fun res!557167 () Bool)

(assert (=> b!815952 (=> (not res!557167) (not e!452562))))

(assert (=> b!815952 (= res!557167 (not (contains!4128 lt!365247 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815953 () Bool)

(assert (=> b!815953 (= e!452557 e!452560)))

(declare-fun c!88914 () Bool)

(assert (=> b!815953 (= c!88914 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!815954 () Bool)

(assert (=> b!815954 (= e!452560 (isEmpty!637 lt!365247))))

(declare-fun b!815955 () Bool)

(assert (=> b!815955 (= e!452559 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815955 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!104311 () Bool)

(assert (=> d!104311 e!452562))

(declare-fun res!557168 () Bool)

(assert (=> d!104311 (=> (not res!557168) (not e!452562))))

(assert (=> d!104311 (= res!557168 (not (contains!4128 lt!365247 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104311 (= lt!365247 e!452558)))

(declare-fun c!88911 () Bool)

(assert (=> d!104311 (= c!88911 (bvsge #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> d!104311 (validMask!0 mask!1312)))

(assert (=> d!104311 (= (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365247)))

(declare-fun b!815950 () Bool)

(declare-fun lt!365249 () Unit!27774)

(declare-fun lt!365244 () Unit!27774)

(assert (=> b!815950 (= lt!365249 lt!365244)))

(declare-fun lt!365246 () (_ BitVec 64))

(declare-fun lt!365248 () (_ BitVec 64))

(declare-fun lt!365245 () V!24131)

(declare-fun lt!365250 () ListLongMap!8315)

(assert (=> b!815950 (not (contains!4128 (+!1836 lt!365250 (tuple2!9503 lt!365248 lt!365245)) lt!365246))))

(assert (=> b!815950 (= lt!365244 (addStillNotContains!176 lt!365250 lt!365248 lt!365245 lt!365246))))

(assert (=> b!815950 (= lt!365246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!815950 (= lt!365245 (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815950 (= lt!365248 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!815950 (= lt!365250 call!35497)))

(assert (=> b!815950 (= e!452561 (+!1836 call!35497 (tuple2!9503 (select (arr!21498 _keys!976) #b00000000000000000000000000000000) (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!104311 c!88911) b!815951))

(assert (= (and d!104311 (not c!88911)) b!815948))

(assert (= (and b!815948 c!88913) b!815950))

(assert (= (and b!815948 (not c!88913)) b!815944))

(assert (= (or b!815950 b!815944) bm!35494))

(assert (= (and d!104311 res!557168) b!815952))

(assert (= (and b!815952 res!557167) b!815949))

(assert (= (and b!815949 res!557165) b!815955))

(assert (= (and b!815949 c!88912) b!815946))

(assert (= (and b!815949 (not c!88912)) b!815953))

(assert (= (and b!815946 res!557166) b!815945))

(assert (= (and b!815953 c!88914) b!815947))

(assert (= (and b!815953 (not c!88914)) b!815954))

(declare-fun b_lambda!10849 () Bool)

(assert (=> (not b_lambda!10849) (not b!815945)))

(assert (=> b!815945 t!21644))

(declare-fun b_and!21409 () Bool)

(assert (= b_and!21407 (and (=> t!21644 result!7875) b_and!21409)))

(declare-fun b_lambda!10851 () Bool)

(assert (=> (not b_lambda!10851) (not b!815950)))

(assert (=> b!815950 t!21644))

(declare-fun b_and!21411 () Bool)

(assert (= b_and!21409 (and (=> t!21644 result!7875) b_and!21411)))

(declare-fun m!757085 () Bool)

(assert (=> b!815952 m!757085))

(assert (=> b!815945 m!757057))

(assert (=> b!815945 m!757059))

(assert (=> b!815945 m!757061))

(assert (=> b!815945 m!757057))

(assert (=> b!815945 m!757061))

(assert (=> b!815945 m!757063))

(assert (=> b!815945 m!757059))

(declare-fun m!757087 () Bool)

(assert (=> b!815945 m!757087))

(assert (=> b!815950 m!757057))

(assert (=> b!815950 m!757061))

(assert (=> b!815950 m!757057))

(assert (=> b!815950 m!757061))

(assert (=> b!815950 m!757063))

(declare-fun m!757089 () Bool)

(assert (=> b!815950 m!757089))

(declare-fun m!757091 () Bool)

(assert (=> b!815950 m!757091))

(declare-fun m!757093 () Bool)

(assert (=> b!815950 m!757093))

(assert (=> b!815950 m!757059))

(assert (=> b!815950 m!757091))

(declare-fun m!757095 () Bool)

(assert (=> b!815950 m!757095))

(assert (=> b!815955 m!757059))

(assert (=> b!815955 m!757059))

(assert (=> b!815955 m!757075))

(declare-fun m!757097 () Bool)

(assert (=> b!815954 m!757097))

(assert (=> b!815946 m!757059))

(assert (=> b!815946 m!757059))

(declare-fun m!757099 () Bool)

(assert (=> b!815946 m!757099))

(declare-fun m!757101 () Bool)

(assert (=> bm!35494 m!757101))

(declare-fun m!757103 () Bool)

(assert (=> d!104311 m!757103))

(assert (=> d!104311 m!756997))

(assert (=> b!815947 m!757101))

(assert (=> b!815948 m!757059))

(assert (=> b!815948 m!757059))

(assert (=> b!815948 m!757075))

(assert (=> b!815845 d!104311))

(declare-fun b!815966 () Bool)

(declare-fun e!452571 () Bool)

(declare-fun contains!4129 (List!15328 (_ BitVec 64)) Bool)

(assert (=> b!815966 (= e!452571 (contains!4129 Nil!15325 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815967 () Bool)

(declare-fun e!452574 () Bool)

(declare-fun call!35500 () Bool)

(assert (=> b!815967 (= e!452574 call!35500)))

(declare-fun b!815968 () Bool)

(declare-fun e!452573 () Bool)

(assert (=> b!815968 (= e!452573 e!452574)))

(declare-fun c!88917 () Bool)

(assert (=> b!815968 (= c!88917 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815969 () Bool)

(declare-fun e!452572 () Bool)

(assert (=> b!815969 (= e!452572 e!452573)))

(declare-fun res!557177 () Bool)

(assert (=> b!815969 (=> (not res!557177) (not e!452573))))

(assert (=> b!815969 (= res!557177 (not e!452571))))

(declare-fun res!557175 () Bool)

(assert (=> b!815969 (=> (not res!557175) (not e!452571))))

(assert (=> b!815969 (= res!557175 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35497 () Bool)

(assert (=> bm!35497 (= call!35500 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88917 (Cons!15324 (select (arr!21498 _keys!976) #b00000000000000000000000000000000) Nil!15325) Nil!15325)))))

(declare-fun b!815970 () Bool)

(assert (=> b!815970 (= e!452574 call!35500)))

(declare-fun d!104313 () Bool)

(declare-fun res!557176 () Bool)

(assert (=> d!104313 (=> res!557176 e!452572)))

(assert (=> d!104313 (= res!557176 (bvsge #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> d!104313 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15325) e!452572)))

(assert (= (and d!104313 (not res!557176)) b!815969))

(assert (= (and b!815969 res!557175) b!815966))

(assert (= (and b!815969 res!557177) b!815968))

(assert (= (and b!815968 c!88917) b!815967))

(assert (= (and b!815968 (not c!88917)) b!815970))

(assert (= (or b!815967 b!815970) bm!35497))

(assert (=> b!815966 m!757059))

(assert (=> b!815966 m!757059))

(declare-fun m!757105 () Bool)

(assert (=> b!815966 m!757105))

(assert (=> b!815968 m!757059))

(assert (=> b!815968 m!757059))

(assert (=> b!815968 m!757075))

(assert (=> b!815969 m!757059))

(assert (=> b!815969 m!757059))

(assert (=> b!815969 m!757075))

(assert (=> bm!35497 m!757059))

(declare-fun m!757107 () Bool)

(assert (=> bm!35497 m!757107))

(assert (=> b!815851 d!104313))

(declare-fun d!104315 () Bool)

(declare-fun res!557182 () Bool)

(declare-fun e!452583 () Bool)

(assert (=> d!104315 (=> res!557182 e!452583)))

(assert (=> d!104315 (= res!557182 (bvsge #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> d!104315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!452583)))

(declare-fun b!815979 () Bool)

(declare-fun e!452582 () Bool)

(assert (=> b!815979 (= e!452583 e!452582)))

(declare-fun c!88920 () Bool)

(assert (=> b!815979 (= c!88920 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815980 () Bool)

(declare-fun e!452581 () Bool)

(declare-fun call!35503 () Bool)

(assert (=> b!815980 (= e!452581 call!35503)))

(declare-fun bm!35500 () Bool)

(assert (=> bm!35500 (= call!35503 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!815981 () Bool)

(assert (=> b!815981 (= e!452582 e!452581)))

(declare-fun lt!365259 () (_ BitVec 64))

(assert (=> b!815981 (= lt!365259 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365258 () Unit!27774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44879 (_ BitVec 64) (_ BitVec 32)) Unit!27774)

(assert (=> b!815981 (= lt!365258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!365259 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!815981 (arrayContainsKey!0 _keys!976 lt!365259 #b00000000000000000000000000000000)))

(declare-fun lt!365257 () Unit!27774)

(assert (=> b!815981 (= lt!365257 lt!365258)))

(declare-fun res!557183 () Bool)

(declare-datatypes ((SeekEntryResult!8718 0))(
  ( (MissingZero!8718 (index!37243 (_ BitVec 32))) (Found!8718 (index!37244 (_ BitVec 32))) (Intermediate!8718 (undefined!9530 Bool) (index!37245 (_ BitVec 32)) (x!68692 (_ BitVec 32))) (Undefined!8718) (MissingVacant!8718 (index!37246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44879 (_ BitVec 32)) SeekEntryResult!8718)

(assert (=> b!815981 (= res!557183 (= (seekEntryOrOpen!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8718 #b00000000000000000000000000000000)))))

(assert (=> b!815981 (=> (not res!557183) (not e!452581))))

(declare-fun b!815982 () Bool)

(assert (=> b!815982 (= e!452582 call!35503)))

(assert (= (and d!104315 (not res!557182)) b!815979))

(assert (= (and b!815979 c!88920) b!815981))

(assert (= (and b!815979 (not c!88920)) b!815982))

(assert (= (and b!815981 res!557183) b!815980))

(assert (= (or b!815980 b!815982) bm!35500))

(assert (=> b!815979 m!757059))

(assert (=> b!815979 m!757059))

(assert (=> b!815979 m!757075))

(declare-fun m!757109 () Bool)

(assert (=> bm!35500 m!757109))

(assert (=> b!815981 m!757059))

(declare-fun m!757111 () Bool)

(assert (=> b!815981 m!757111))

(declare-fun m!757113 () Bool)

(assert (=> b!815981 m!757113))

(assert (=> b!815981 m!757059))

(declare-fun m!757115 () Bool)

(assert (=> b!815981 m!757115))

(assert (=> b!815843 d!104315))

(declare-fun d!104317 () Bool)

(declare-fun e!452586 () Bool)

(assert (=> d!104317 e!452586))

(declare-fun res!557189 () Bool)

(assert (=> d!104317 (=> (not res!557189) (not e!452586))))

(declare-fun lt!365269 () ListLongMap!8315)

(assert (=> d!104317 (= res!557189 (contains!4128 lt!365269 (_1!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!365268 () List!15327)

(assert (=> d!104317 (= lt!365269 (ListLongMap!8316 lt!365268))))

(declare-fun lt!365271 () Unit!27774)

(declare-fun lt!365270 () Unit!27774)

(assert (=> d!104317 (= lt!365271 lt!365270)))

(declare-datatypes ((Option!404 0))(
  ( (Some!403 (v!9645 V!24131)) (None!402) )
))
(declare-fun getValueByKey!398 (List!15327 (_ BitVec 64)) Option!404)

(assert (=> d!104317 (= (getValueByKey!398 lt!365268 (_1!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!403 (_2!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!215 (List!15327 (_ BitVec 64) V!24131) Unit!27774)

(assert (=> d!104317 (= lt!365270 (lemmaContainsTupThenGetReturnValue!215 lt!365268 (_1!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!254 (List!15327 (_ BitVec 64) V!24131) List!15327)

(assert (=> d!104317 (= lt!365268 (insertStrictlySorted!254 (toList!4173 (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104317 (= (+!1836 (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!365269)))

(declare-fun b!815987 () Bool)

(declare-fun res!557188 () Bool)

(assert (=> b!815987 (=> (not res!557188) (not e!452586))))

(assert (=> b!815987 (= res!557188 (= (getValueByKey!398 (toList!4173 lt!365269) (_1!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!403 (_2!4762 (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!815988 () Bool)

(declare-fun contains!4130 (List!15327 tuple2!9502) Bool)

(assert (=> b!815988 (= e!452586 (contains!4130 (toList!4173 lt!365269) (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104317 res!557189) b!815987))

(assert (= (and b!815987 res!557188) b!815988))

(declare-fun m!757117 () Bool)

(assert (=> d!104317 m!757117))

(declare-fun m!757119 () Bool)

(assert (=> d!104317 m!757119))

(declare-fun m!757121 () Bool)

(assert (=> d!104317 m!757121))

(declare-fun m!757123 () Bool)

(assert (=> d!104317 m!757123))

(declare-fun m!757125 () Bool)

(assert (=> b!815987 m!757125))

(declare-fun m!757127 () Bool)

(assert (=> b!815988 m!757127))

(assert (=> b!815844 d!104317))

(declare-fun b!816031 () Bool)

(declare-fun e!452624 () Bool)

(assert (=> b!816031 (= e!452624 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816032 () Bool)

(declare-fun e!452615 () Bool)

(declare-fun e!452623 () Bool)

(assert (=> b!816032 (= e!452615 e!452623)))

(declare-fun c!88934 () Bool)

(assert (=> b!816032 (= c!88934 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35515 () Bool)

(declare-fun call!35523 () ListLongMap!8315)

(assert (=> bm!35515 (= call!35523 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35516 () Bool)

(declare-fun call!35522 () Bool)

(declare-fun lt!365324 () ListLongMap!8315)

(assert (=> bm!35516 (= call!35522 (contains!4128 lt!365324 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!88936 () Bool)

(declare-fun call!35524 () ListLongMap!8315)

(declare-fun bm!35517 () Bool)

(declare-fun call!35518 () ListLongMap!8315)

(declare-fun c!88935 () Bool)

(declare-fun call!35520 () ListLongMap!8315)

(assert (=> bm!35517 (= call!35524 (+!1836 (ite c!88936 call!35523 (ite c!88935 call!35518 call!35520)) (ite (or c!88936 c!88935) (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!816033 () Bool)

(declare-fun res!557215 () Bool)

(assert (=> b!816033 (=> (not res!557215) (not e!452615))))

(declare-fun e!452614 () Bool)

(assert (=> b!816033 (= res!557215 e!452614)))

(declare-fun res!557213 () Bool)

(assert (=> b!816033 (=> res!557213 e!452614)))

(assert (=> b!816033 (= res!557213 (not e!452624))))

(declare-fun res!557216 () Bool)

(assert (=> b!816033 (=> (not res!557216) (not e!452624))))

(assert (=> b!816033 (= res!557216 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!816034 () Bool)

(declare-fun e!452613 () Unit!27774)

(declare-fun Unit!27778 () Unit!27774)

(assert (=> b!816034 (= e!452613 Unit!27778)))

(declare-fun b!816035 () Bool)

(declare-fun e!452620 () ListLongMap!8315)

(declare-fun e!452616 () ListLongMap!8315)

(assert (=> b!816035 (= e!452620 e!452616)))

(assert (=> b!816035 (= c!88935 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35518 () Bool)

(declare-fun call!35521 () ListLongMap!8315)

(assert (=> bm!35518 (= call!35521 call!35524)))

(declare-fun b!816036 () Bool)

(declare-fun c!88937 () Bool)

(assert (=> b!816036 (= c!88937 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!452622 () ListLongMap!8315)

(assert (=> b!816036 (= e!452616 e!452622)))

(declare-fun b!816037 () Bool)

(declare-fun e!452619 () Bool)

(assert (=> b!816037 (= e!452619 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35519 () Bool)

(assert (=> bm!35519 (= call!35520 call!35518)))

(declare-fun b!816038 () Bool)

(declare-fun e!452617 () Bool)

(declare-fun e!452621 () Bool)

(assert (=> b!816038 (= e!452617 e!452621)))

(declare-fun res!557211 () Bool)

(declare-fun call!35519 () Bool)

(assert (=> b!816038 (= res!557211 call!35519)))

(assert (=> b!816038 (=> (not res!557211) (not e!452621))))

(declare-fun b!816039 () Bool)

(declare-fun res!557209 () Bool)

(assert (=> b!816039 (=> (not res!557209) (not e!452615))))

(assert (=> b!816039 (= res!557209 e!452617)))

(declare-fun c!88933 () Bool)

(assert (=> b!816039 (= c!88933 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!104319 () Bool)

(assert (=> d!104319 e!452615))

(declare-fun res!557212 () Bool)

(assert (=> d!104319 (=> (not res!557212) (not e!452615))))

(assert (=> d!104319 (= res!557212 (or (bvsge #b00000000000000000000000000000000 (size!21919 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))))

(declare-fun lt!365329 () ListLongMap!8315)

(assert (=> d!104319 (= lt!365324 lt!365329)))

(declare-fun lt!365325 () Unit!27774)

(assert (=> d!104319 (= lt!365325 e!452613)))

(declare-fun c!88938 () Bool)

(assert (=> d!104319 (= c!88938 e!452619)))

(declare-fun res!557210 () Bool)

(assert (=> d!104319 (=> (not res!557210) (not e!452619))))

(assert (=> d!104319 (= res!557210 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> d!104319 (= lt!365329 e!452620)))

(assert (=> d!104319 (= c!88936 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104319 (validMask!0 mask!1312)))

(assert (=> d!104319 (= (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365324)))

(declare-fun b!816040 () Bool)

(assert (=> b!816040 (= e!452616 call!35521)))

(declare-fun b!816041 () Bool)

(declare-fun e!452625 () Bool)

(assert (=> b!816041 (= e!452614 e!452625)))

(declare-fun res!557208 () Bool)

(assert (=> b!816041 (=> (not res!557208) (not e!452625))))

(assert (=> b!816041 (= res!557208 (contains!4128 lt!365324 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!816042 () Bool)

(declare-fun e!452618 () Bool)

(assert (=> b!816042 (= e!452618 (= (apply!350 lt!365324 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!816043 () Bool)

(assert (=> b!816043 (= e!452625 (= (apply!350 lt!365324 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)) (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!816043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21920 _values!788)))))

(assert (=> b!816043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!816044 () Bool)

(assert (=> b!816044 (= e!452623 e!452618)))

(declare-fun res!557214 () Bool)

(assert (=> b!816044 (= res!557214 call!35522)))

(assert (=> b!816044 (=> (not res!557214) (not e!452618))))

(declare-fun b!816045 () Bool)

(assert (=> b!816045 (= e!452620 (+!1836 call!35524 (tuple2!9503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!816046 () Bool)

(assert (=> b!816046 (= e!452617 (not call!35519))))

(declare-fun bm!35520 () Bool)

(assert (=> bm!35520 (= call!35518 call!35523)))

(declare-fun b!816047 () Bool)

(assert (=> b!816047 (= e!452622 call!35520)))

(declare-fun b!816048 () Bool)

(assert (=> b!816048 (= e!452623 (not call!35522))))

(declare-fun bm!35521 () Bool)

(assert (=> bm!35521 (= call!35519 (contains!4128 lt!365324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816049 () Bool)

(assert (=> b!816049 (= e!452621 (= (apply!350 lt!365324 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!816050 () Bool)

(declare-fun lt!365332 () Unit!27774)

(assert (=> b!816050 (= e!452613 lt!365332)))

(declare-fun lt!365321 () ListLongMap!8315)

(assert (=> b!816050 (= lt!365321 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365316 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365316 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365319 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365319 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365323 () Unit!27774)

(declare-fun addStillContains!305 (ListLongMap!8315 (_ BitVec 64) V!24131 (_ BitVec 64)) Unit!27774)

(assert (=> b!816050 (= lt!365323 (addStillContains!305 lt!365321 lt!365316 zeroValueBefore!34 lt!365319))))

(assert (=> b!816050 (contains!4128 (+!1836 lt!365321 (tuple2!9503 lt!365316 zeroValueBefore!34)) lt!365319)))

(declare-fun lt!365318 () Unit!27774)

(assert (=> b!816050 (= lt!365318 lt!365323)))

(declare-fun lt!365333 () ListLongMap!8315)

(assert (=> b!816050 (= lt!365333 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365320 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365320 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365322 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365322 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365334 () Unit!27774)

(declare-fun addApplyDifferent!305 (ListLongMap!8315 (_ BitVec 64) V!24131 (_ BitVec 64)) Unit!27774)

(assert (=> b!816050 (= lt!365334 (addApplyDifferent!305 lt!365333 lt!365320 minValue!754 lt!365322))))

(assert (=> b!816050 (= (apply!350 (+!1836 lt!365333 (tuple2!9503 lt!365320 minValue!754)) lt!365322) (apply!350 lt!365333 lt!365322))))

(declare-fun lt!365331 () Unit!27774)

(assert (=> b!816050 (= lt!365331 lt!365334)))

(declare-fun lt!365327 () ListLongMap!8315)

(assert (=> b!816050 (= lt!365327 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365328 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365330 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365330 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365337 () Unit!27774)

(assert (=> b!816050 (= lt!365337 (addApplyDifferent!305 lt!365327 lt!365328 zeroValueBefore!34 lt!365330))))

(assert (=> b!816050 (= (apply!350 (+!1836 lt!365327 (tuple2!9503 lt!365328 zeroValueBefore!34)) lt!365330) (apply!350 lt!365327 lt!365330))))

(declare-fun lt!365335 () Unit!27774)

(assert (=> b!816050 (= lt!365335 lt!365337)))

(declare-fun lt!365336 () ListLongMap!8315)

(assert (=> b!816050 (= lt!365336 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365326 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365326 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365317 () (_ BitVec 64))

(assert (=> b!816050 (= lt!365317 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816050 (= lt!365332 (addApplyDifferent!305 lt!365336 lt!365326 minValue!754 lt!365317))))

(assert (=> b!816050 (= (apply!350 (+!1836 lt!365336 (tuple2!9503 lt!365326 minValue!754)) lt!365317) (apply!350 lt!365336 lt!365317))))

(declare-fun b!816051 () Bool)

(assert (=> b!816051 (= e!452622 call!35521)))

(assert (= (and d!104319 c!88936) b!816045))

(assert (= (and d!104319 (not c!88936)) b!816035))

(assert (= (and b!816035 c!88935) b!816040))

(assert (= (and b!816035 (not c!88935)) b!816036))

(assert (= (and b!816036 c!88937) b!816051))

(assert (= (and b!816036 (not c!88937)) b!816047))

(assert (= (or b!816051 b!816047) bm!35519))

(assert (= (or b!816040 bm!35519) bm!35520))

(assert (= (or b!816040 b!816051) bm!35518))

(assert (= (or b!816045 bm!35520) bm!35515))

(assert (= (or b!816045 bm!35518) bm!35517))

(assert (= (and d!104319 res!557210) b!816037))

(assert (= (and d!104319 c!88938) b!816050))

(assert (= (and d!104319 (not c!88938)) b!816034))

(assert (= (and d!104319 res!557212) b!816033))

(assert (= (and b!816033 res!557216) b!816031))

(assert (= (and b!816033 (not res!557213)) b!816041))

(assert (= (and b!816041 res!557208) b!816043))

(assert (= (and b!816033 res!557215) b!816039))

(assert (= (and b!816039 c!88933) b!816038))

(assert (= (and b!816039 (not c!88933)) b!816046))

(assert (= (and b!816038 res!557211) b!816049))

(assert (= (or b!816038 b!816046) bm!35521))

(assert (= (and b!816039 res!557209) b!816032))

(assert (= (and b!816032 c!88934) b!816044))

(assert (= (and b!816032 (not c!88934)) b!816048))

(assert (= (and b!816044 res!557214) b!816042))

(assert (= (or b!816044 b!816048) bm!35516))

(declare-fun b_lambda!10853 () Bool)

(assert (=> (not b_lambda!10853) (not b!816043)))

(assert (=> b!816043 t!21644))

(declare-fun b_and!21413 () Bool)

(assert (= b_and!21411 (and (=> t!21644 result!7875) b_and!21413)))

(declare-fun m!757129 () Bool)

(assert (=> b!816042 m!757129))

(assert (=> b!816041 m!757059))

(assert (=> b!816041 m!757059))

(declare-fun m!757131 () Bool)

(assert (=> b!816041 m!757131))

(assert (=> b!816043 m!757059))

(assert (=> b!816043 m!757061))

(assert (=> b!816043 m!757057))

(assert (=> b!816043 m!757061))

(assert (=> b!816043 m!757063))

(assert (=> b!816043 m!757059))

(declare-fun m!757133 () Bool)

(assert (=> b!816043 m!757133))

(assert (=> b!816043 m!757057))

(declare-fun m!757135 () Bool)

(assert (=> bm!35516 m!757135))

(assert (=> bm!35515 m!756993))

(assert (=> d!104319 m!756997))

(declare-fun m!757137 () Bool)

(assert (=> bm!35517 m!757137))

(assert (=> b!816037 m!757059))

(assert (=> b!816037 m!757059))

(assert (=> b!816037 m!757075))

(declare-fun m!757139 () Bool)

(assert (=> b!816050 m!757139))

(declare-fun m!757141 () Bool)

(assert (=> b!816050 m!757141))

(declare-fun m!757143 () Bool)

(assert (=> b!816050 m!757143))

(assert (=> b!816050 m!757059))

(declare-fun m!757145 () Bool)

(assert (=> b!816050 m!757145))

(declare-fun m!757147 () Bool)

(assert (=> b!816050 m!757147))

(assert (=> b!816050 m!757145))

(assert (=> b!816050 m!757143))

(declare-fun m!757149 () Bool)

(assert (=> b!816050 m!757149))

(assert (=> b!816050 m!756993))

(declare-fun m!757151 () Bool)

(assert (=> b!816050 m!757151))

(declare-fun m!757153 () Bool)

(assert (=> b!816050 m!757153))

(declare-fun m!757155 () Bool)

(assert (=> b!816050 m!757155))

(declare-fun m!757157 () Bool)

(assert (=> b!816050 m!757157))

(declare-fun m!757159 () Bool)

(assert (=> b!816050 m!757159))

(declare-fun m!757161 () Bool)

(assert (=> b!816050 m!757161))

(assert (=> b!816050 m!757157))

(declare-fun m!757163 () Bool)

(assert (=> b!816050 m!757163))

(declare-fun m!757165 () Bool)

(assert (=> b!816050 m!757165))

(declare-fun m!757167 () Bool)

(assert (=> b!816050 m!757167))

(assert (=> b!816050 m!757139))

(assert (=> b!816031 m!757059))

(assert (=> b!816031 m!757059))

(assert (=> b!816031 m!757075))

(declare-fun m!757169 () Bool)

(assert (=> b!816049 m!757169))

(declare-fun m!757171 () Bool)

(assert (=> b!816045 m!757171))

(declare-fun m!757173 () Bool)

(assert (=> bm!35521 m!757173))

(assert (=> b!815844 d!104319))

(declare-fun b!816052 () Bool)

(declare-fun e!452637 () Bool)

(assert (=> b!816052 (= e!452637 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816053 () Bool)

(declare-fun e!452628 () Bool)

(declare-fun e!452636 () Bool)

(assert (=> b!816053 (= e!452628 e!452636)))

(declare-fun c!88940 () Bool)

(assert (=> b!816053 (= c!88940 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!35530 () ListLongMap!8315)

(declare-fun bm!35522 () Bool)

(assert (=> bm!35522 (= call!35530 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35523 () Bool)

(declare-fun call!35529 () Bool)

(declare-fun lt!365346 () ListLongMap!8315)

(assert (=> bm!35523 (= call!35529 (contains!4128 lt!365346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!35525 () ListLongMap!8315)

(declare-fun c!88941 () Bool)

(declare-fun bm!35524 () Bool)

(declare-fun call!35527 () ListLongMap!8315)

(declare-fun call!35531 () ListLongMap!8315)

(declare-fun c!88942 () Bool)

(assert (=> bm!35524 (= call!35531 (+!1836 (ite c!88942 call!35530 (ite c!88941 call!35525 call!35527)) (ite (or c!88942 c!88941) (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!816054 () Bool)

(declare-fun res!557224 () Bool)

(assert (=> b!816054 (=> (not res!557224) (not e!452628))))

(declare-fun e!452627 () Bool)

(assert (=> b!816054 (= res!557224 e!452627)))

(declare-fun res!557222 () Bool)

(assert (=> b!816054 (=> res!557222 e!452627)))

(assert (=> b!816054 (= res!557222 (not e!452637))))

(declare-fun res!557225 () Bool)

(assert (=> b!816054 (=> (not res!557225) (not e!452637))))

(assert (=> b!816054 (= res!557225 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!816055 () Bool)

(declare-fun e!452626 () Unit!27774)

(declare-fun Unit!27779 () Unit!27774)

(assert (=> b!816055 (= e!452626 Unit!27779)))

(declare-fun b!816056 () Bool)

(declare-fun e!452633 () ListLongMap!8315)

(declare-fun e!452629 () ListLongMap!8315)

(assert (=> b!816056 (= e!452633 e!452629)))

(assert (=> b!816056 (= c!88941 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35525 () Bool)

(declare-fun call!35528 () ListLongMap!8315)

(assert (=> bm!35525 (= call!35528 call!35531)))

(declare-fun b!816057 () Bool)

(declare-fun c!88943 () Bool)

(assert (=> b!816057 (= c!88943 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!452635 () ListLongMap!8315)

(assert (=> b!816057 (= e!452629 e!452635)))

(declare-fun b!816058 () Bool)

(declare-fun e!452632 () Bool)

(assert (=> b!816058 (= e!452632 (validKeyInArray!0 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35526 () Bool)

(assert (=> bm!35526 (= call!35527 call!35525)))

(declare-fun b!816059 () Bool)

(declare-fun e!452630 () Bool)

(declare-fun e!452634 () Bool)

(assert (=> b!816059 (= e!452630 e!452634)))

(declare-fun res!557220 () Bool)

(declare-fun call!35526 () Bool)

(assert (=> b!816059 (= res!557220 call!35526)))

(assert (=> b!816059 (=> (not res!557220) (not e!452634))))

(declare-fun b!816060 () Bool)

(declare-fun res!557218 () Bool)

(assert (=> b!816060 (=> (not res!557218) (not e!452628))))

(assert (=> b!816060 (= res!557218 e!452630)))

(declare-fun c!88939 () Bool)

(assert (=> b!816060 (= c!88939 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!104321 () Bool)

(assert (=> d!104321 e!452628))

(declare-fun res!557221 () Bool)

(assert (=> d!104321 (=> (not res!557221) (not e!452628))))

(assert (=> d!104321 (= res!557221 (or (bvsge #b00000000000000000000000000000000 (size!21919 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))))

(declare-fun lt!365351 () ListLongMap!8315)

(assert (=> d!104321 (= lt!365346 lt!365351)))

(declare-fun lt!365347 () Unit!27774)

(assert (=> d!104321 (= lt!365347 e!452626)))

(declare-fun c!88944 () Bool)

(assert (=> d!104321 (= c!88944 e!452632)))

(declare-fun res!557219 () Bool)

(assert (=> d!104321 (=> (not res!557219) (not e!452632))))

(assert (=> d!104321 (= res!557219 (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(assert (=> d!104321 (= lt!365351 e!452633)))

(assert (=> d!104321 (= c!88942 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104321 (validMask!0 mask!1312)))

(assert (=> d!104321 (= (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365346)))

(declare-fun b!816061 () Bool)

(assert (=> b!816061 (= e!452629 call!35528)))

(declare-fun b!816062 () Bool)

(declare-fun e!452638 () Bool)

(assert (=> b!816062 (= e!452627 e!452638)))

(declare-fun res!557217 () Bool)

(assert (=> b!816062 (=> (not res!557217) (not e!452638))))

(assert (=> b!816062 (= res!557217 (contains!4128 lt!365346 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!816063 () Bool)

(declare-fun e!452631 () Bool)

(assert (=> b!816063 (= e!452631 (= (apply!350 lt!365346 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!816064 () Bool)

(assert (=> b!816064 (= e!452638 (= (apply!350 lt!365346 (select (arr!21498 _keys!976) #b00000000000000000000000000000000)) (get!11515 (select (arr!21499 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!816064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21920 _values!788)))))

(assert (=> b!816064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21919 _keys!976)))))

(declare-fun b!816065 () Bool)

(assert (=> b!816065 (= e!452636 e!452631)))

(declare-fun res!557223 () Bool)

(assert (=> b!816065 (= res!557223 call!35529)))

(assert (=> b!816065 (=> (not res!557223) (not e!452631))))

(declare-fun b!816066 () Bool)

(assert (=> b!816066 (= e!452633 (+!1836 call!35531 (tuple2!9503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!816067 () Bool)

(assert (=> b!816067 (= e!452630 (not call!35526))))

(declare-fun bm!35527 () Bool)

(assert (=> bm!35527 (= call!35525 call!35530)))

(declare-fun b!816068 () Bool)

(assert (=> b!816068 (= e!452635 call!35527)))

(declare-fun b!816069 () Bool)

(assert (=> b!816069 (= e!452636 (not call!35529))))

(declare-fun bm!35528 () Bool)

(assert (=> bm!35528 (= call!35526 (contains!4128 lt!365346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816070 () Bool)

(assert (=> b!816070 (= e!452634 (= (apply!350 lt!365346 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!816071 () Bool)

(declare-fun lt!365354 () Unit!27774)

(assert (=> b!816071 (= e!452626 lt!365354)))

(declare-fun lt!365343 () ListLongMap!8315)

(assert (=> b!816071 (= lt!365343 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365338 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365338 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365341 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365341 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365345 () Unit!27774)

(assert (=> b!816071 (= lt!365345 (addStillContains!305 lt!365343 lt!365338 zeroValueAfter!34 lt!365341))))

(assert (=> b!816071 (contains!4128 (+!1836 lt!365343 (tuple2!9503 lt!365338 zeroValueAfter!34)) lt!365341)))

(declare-fun lt!365340 () Unit!27774)

(assert (=> b!816071 (= lt!365340 lt!365345)))

(declare-fun lt!365355 () ListLongMap!8315)

(assert (=> b!816071 (= lt!365355 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365342 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365342 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365344 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365344 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365356 () Unit!27774)

(assert (=> b!816071 (= lt!365356 (addApplyDifferent!305 lt!365355 lt!365342 minValue!754 lt!365344))))

(assert (=> b!816071 (= (apply!350 (+!1836 lt!365355 (tuple2!9503 lt!365342 minValue!754)) lt!365344) (apply!350 lt!365355 lt!365344))))

(declare-fun lt!365353 () Unit!27774)

(assert (=> b!816071 (= lt!365353 lt!365356)))

(declare-fun lt!365349 () ListLongMap!8315)

(assert (=> b!816071 (= lt!365349 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365350 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365352 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365352 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365359 () Unit!27774)

(assert (=> b!816071 (= lt!365359 (addApplyDifferent!305 lt!365349 lt!365350 zeroValueAfter!34 lt!365352))))

(assert (=> b!816071 (= (apply!350 (+!1836 lt!365349 (tuple2!9503 lt!365350 zeroValueAfter!34)) lt!365352) (apply!350 lt!365349 lt!365352))))

(declare-fun lt!365357 () Unit!27774)

(assert (=> b!816071 (= lt!365357 lt!365359)))

(declare-fun lt!365358 () ListLongMap!8315)

(assert (=> b!816071 (= lt!365358 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365348 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365348 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365339 () (_ BitVec 64))

(assert (=> b!816071 (= lt!365339 (select (arr!21498 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816071 (= lt!365354 (addApplyDifferent!305 lt!365358 lt!365348 minValue!754 lt!365339))))

(assert (=> b!816071 (= (apply!350 (+!1836 lt!365358 (tuple2!9503 lt!365348 minValue!754)) lt!365339) (apply!350 lt!365358 lt!365339))))

(declare-fun b!816072 () Bool)

(assert (=> b!816072 (= e!452635 call!35528)))

(assert (= (and d!104321 c!88942) b!816066))

(assert (= (and d!104321 (not c!88942)) b!816056))

(assert (= (and b!816056 c!88941) b!816061))

(assert (= (and b!816056 (not c!88941)) b!816057))

(assert (= (and b!816057 c!88943) b!816072))

(assert (= (and b!816057 (not c!88943)) b!816068))

(assert (= (or b!816072 b!816068) bm!35526))

(assert (= (or b!816061 bm!35526) bm!35527))

(assert (= (or b!816061 b!816072) bm!35525))

(assert (= (or b!816066 bm!35527) bm!35522))

(assert (= (or b!816066 bm!35525) bm!35524))

(assert (= (and d!104321 res!557219) b!816058))

(assert (= (and d!104321 c!88944) b!816071))

(assert (= (and d!104321 (not c!88944)) b!816055))

(assert (= (and d!104321 res!557221) b!816054))

(assert (= (and b!816054 res!557225) b!816052))

(assert (= (and b!816054 (not res!557222)) b!816062))

(assert (= (and b!816062 res!557217) b!816064))

(assert (= (and b!816054 res!557224) b!816060))

(assert (= (and b!816060 c!88939) b!816059))

(assert (= (and b!816060 (not c!88939)) b!816067))

(assert (= (and b!816059 res!557220) b!816070))

(assert (= (or b!816059 b!816067) bm!35528))

(assert (= (and b!816060 res!557218) b!816053))

(assert (= (and b!816053 c!88940) b!816065))

(assert (= (and b!816053 (not c!88940)) b!816069))

(assert (= (and b!816065 res!557223) b!816063))

(assert (= (or b!816065 b!816069) bm!35523))

(declare-fun b_lambda!10855 () Bool)

(assert (=> (not b_lambda!10855) (not b!816064)))

(assert (=> b!816064 t!21644))

(declare-fun b_and!21415 () Bool)

(assert (= b_and!21413 (and (=> t!21644 result!7875) b_and!21415)))

(declare-fun m!757175 () Bool)

(assert (=> b!816063 m!757175))

(assert (=> b!816062 m!757059))

(assert (=> b!816062 m!757059))

(declare-fun m!757177 () Bool)

(assert (=> b!816062 m!757177))

(assert (=> b!816064 m!757059))

(assert (=> b!816064 m!757061))

(assert (=> b!816064 m!757057))

(assert (=> b!816064 m!757061))

(assert (=> b!816064 m!757063))

(assert (=> b!816064 m!757059))

(declare-fun m!757179 () Bool)

(assert (=> b!816064 m!757179))

(assert (=> b!816064 m!757057))

(declare-fun m!757181 () Bool)

(assert (=> bm!35523 m!757181))

(assert (=> bm!35522 m!756991))

(assert (=> d!104321 m!756997))

(declare-fun m!757183 () Bool)

(assert (=> bm!35524 m!757183))

(assert (=> b!816058 m!757059))

(assert (=> b!816058 m!757059))

(assert (=> b!816058 m!757075))

(declare-fun m!757185 () Bool)

(assert (=> b!816071 m!757185))

(declare-fun m!757187 () Bool)

(assert (=> b!816071 m!757187))

(declare-fun m!757189 () Bool)

(assert (=> b!816071 m!757189))

(assert (=> b!816071 m!757059))

(declare-fun m!757191 () Bool)

(assert (=> b!816071 m!757191))

(declare-fun m!757193 () Bool)

(assert (=> b!816071 m!757193))

(assert (=> b!816071 m!757191))

(assert (=> b!816071 m!757189))

(declare-fun m!757195 () Bool)

(assert (=> b!816071 m!757195))

(assert (=> b!816071 m!756991))

(declare-fun m!757197 () Bool)

(assert (=> b!816071 m!757197))

(declare-fun m!757199 () Bool)

(assert (=> b!816071 m!757199))

(declare-fun m!757201 () Bool)

(assert (=> b!816071 m!757201))

(declare-fun m!757203 () Bool)

(assert (=> b!816071 m!757203))

(declare-fun m!757205 () Bool)

(assert (=> b!816071 m!757205))

(declare-fun m!757207 () Bool)

(assert (=> b!816071 m!757207))

(assert (=> b!816071 m!757203))

(declare-fun m!757209 () Bool)

(assert (=> b!816071 m!757209))

(declare-fun m!757211 () Bool)

(assert (=> b!816071 m!757211))

(declare-fun m!757213 () Bool)

(assert (=> b!816071 m!757213))

(assert (=> b!816071 m!757185))

(assert (=> b!816052 m!757059))

(assert (=> b!816052 m!757059))

(assert (=> b!816052 m!757075))

(declare-fun m!757215 () Bool)

(assert (=> b!816070 m!757215))

(declare-fun m!757217 () Bool)

(assert (=> b!816066 m!757217))

(declare-fun m!757219 () Bool)

(assert (=> bm!35528 m!757219))

(assert (=> b!815844 d!104321))

(declare-fun d!104323 () Bool)

(assert (=> d!104323 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70224 d!104323))

(declare-fun d!104325 () Bool)

(assert (=> d!104325 (= (array_inv!17281 _keys!976) (bvsge (size!21919 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70224 d!104325))

(declare-fun d!104327 () Bool)

(assert (=> d!104327 (= (array_inv!17282 _values!788) (bvsge (size!21920 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70224 d!104327))

(declare-fun mapNonEmpty!23116 () Bool)

(declare-fun mapRes!23116 () Bool)

(declare-fun tp!44647 () Bool)

(declare-fun e!452644 () Bool)

(assert (=> mapNonEmpty!23116 (= mapRes!23116 (and tp!44647 e!452644))))

(declare-fun mapKey!23116 () (_ BitVec 32))

(declare-fun mapValue!23116 () ValueCell!6758)

(declare-fun mapRest!23116 () (Array (_ BitVec 32) ValueCell!6758))

(assert (=> mapNonEmpty!23116 (= mapRest!23107 (store mapRest!23116 mapKey!23116 mapValue!23116))))

(declare-fun b!816080 () Bool)

(declare-fun e!452643 () Bool)

(assert (=> b!816080 (= e!452643 tp_is_empty!14347)))

(declare-fun b!816079 () Bool)

(assert (=> b!816079 (= e!452644 tp_is_empty!14347)))

(declare-fun mapIsEmpty!23116 () Bool)

(assert (=> mapIsEmpty!23116 mapRes!23116))

(declare-fun condMapEmpty!23116 () Bool)

(declare-fun mapDefault!23116 () ValueCell!6758)

(assert (=> mapNonEmpty!23107 (= condMapEmpty!23116 (= mapRest!23107 ((as const (Array (_ BitVec 32) ValueCell!6758)) mapDefault!23116)))))

(assert (=> mapNonEmpty!23107 (= tp!44631 (and e!452643 mapRes!23116))))

(assert (= (and mapNonEmpty!23107 condMapEmpty!23116) mapIsEmpty!23116))

(assert (= (and mapNonEmpty!23107 (not condMapEmpty!23116)) mapNonEmpty!23116))

(assert (= (and mapNonEmpty!23116 ((_ is ValueCellFull!6758) mapValue!23116)) b!816079))

(assert (= (and mapNonEmpty!23107 ((_ is ValueCellFull!6758) mapDefault!23116)) b!816080))

(declare-fun m!757221 () Bool)

(assert (=> mapNonEmpty!23116 m!757221))

(declare-fun b_lambda!10857 () Bool)

(assert (= b_lambda!10853 (or (and start!70224 b_free!12637) b_lambda!10857)))

(declare-fun b_lambda!10859 () Bool)

(assert (= b_lambda!10851 (or (and start!70224 b_free!12637) b_lambda!10859)))

(declare-fun b_lambda!10861 () Bool)

(assert (= b_lambda!10847 (or (and start!70224 b_free!12637) b_lambda!10861)))

(declare-fun b_lambda!10863 () Bool)

(assert (= b_lambda!10849 (or (and start!70224 b_free!12637) b_lambda!10863)))

(declare-fun b_lambda!10865 () Bool)

(assert (= b_lambda!10845 (or (and start!70224 b_free!12637) b_lambda!10865)))

(declare-fun b_lambda!10867 () Bool)

(assert (= b_lambda!10855 (or (and start!70224 b_free!12637) b_lambda!10867)))

(check-sat (not b!815952) (not bm!35516) (not b!816042) (not b!816052) (not b_lambda!10861) (not b!815987) (not b!815950) (not b!815947) (not b!816050) (not d!104307) (not mapNonEmpty!23116) (not b!815946) (not b_lambda!10859) (not b!815968) (not b!816031) (not b!815945) (not d!104311) (not b!815955) (not d!104321) (not bm!35524) (not b!816064) (not b!816037) (not b!815966) (not b!815933) (not bm!35494) (not b!815981) (not bm!35522) (not b_lambda!10863) (not bm!35521) (not d!104319) (not b!816062) (not b!816041) (not b!815941) tp_is_empty!14347 (not b_lambda!10867) (not b_lambda!10857) (not b_lambda!10865) (not b!816058) (not b!815954) (not b!816071) (not b!816063) (not bm!35497) (not bm!35500) (not b!815940) (not b!815988) (not b!816066) (not bm!35528) (not d!104309) (not b!815931) (not b!815932) (not b!815979) b_and!21415 (not b!816045) (not b_next!12637) (not b!815938) (not d!104317) (not b!815948) (not bm!35523) (not bm!35493) (not b!815969) (not bm!35517) (not b!815934) (not b!815936) (not b!816043) (not bm!35515) (not b!816049) (not b!816070))
(check-sat b_and!21415 (not b_next!12637))

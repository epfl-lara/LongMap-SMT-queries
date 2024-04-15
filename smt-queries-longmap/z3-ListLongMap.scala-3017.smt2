; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42422 () Bool)

(assert start!42422)

(declare-fun b_free!11911 () Bool)

(declare-fun b_next!11911 () Bool)

(assert (=> start!42422 (= b_free!11911 (not b_next!11911))))

(declare-fun tp!41766 () Bool)

(declare-fun b_and!20341 () Bool)

(assert (=> start!42422 (= tp!41766 b_and!20341)))

(declare-fun b!473233 () Bool)

(declare-fun res!282710 () Bool)

(declare-fun e!277626 () Bool)

(assert (=> b!473233 (=> (not res!282710) (not e!277626))))

(declare-datatypes ((array!30415 0))(
  ( (array!30416 (arr!14627 (Array (_ BitVec 32) (_ BitVec 64))) (size!14980 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30415)

(declare-datatypes ((List!8963 0))(
  ( (Nil!8960) (Cons!8959 (h!9815 (_ BitVec 64)) (t!14924 List!8963)) )
))
(declare-fun arrayNoDuplicates!0 (array!30415 (_ BitVec 32) List!8963) Bool)

(assert (=> b!473233 (= res!282710 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8960))))

(declare-fun mapIsEmpty!21721 () Bool)

(declare-fun mapRes!21721 () Bool)

(assert (=> mapIsEmpty!21721 mapRes!21721))

(declare-fun b!473234 () Bool)

(declare-fun e!277630 () Bool)

(declare-fun tp_is_empty!13339 () Bool)

(assert (=> b!473234 (= e!277630 tp_is_empty!13339)))

(declare-fun b!473235 () Bool)

(declare-fun e!277631 () Bool)

(assert (=> b!473235 (= e!277631 tp_is_empty!13339)))

(declare-fun mapNonEmpty!21721 () Bool)

(declare-fun tp!41767 () Bool)

(assert (=> mapNonEmpty!21721 (= mapRes!21721 (and tp!41767 e!277630))))

(declare-datatypes ((V!18891 0))(
  ( (V!18892 (val!6714 Int)) )
))
(declare-datatypes ((ValueCell!6326 0))(
  ( (ValueCellFull!6326 (v!8999 V!18891)) (EmptyCell!6326) )
))
(declare-fun mapValue!21721 () ValueCell!6326)

(declare-datatypes ((array!30417 0))(
  ( (array!30418 (arr!14628 (Array (_ BitVec 32) ValueCell!6326)) (size!14981 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30417)

(declare-fun mapRest!21721 () (Array (_ BitVec 32) ValueCell!6326))

(declare-fun mapKey!21721 () (_ BitVec 32))

(assert (=> mapNonEmpty!21721 (= (arr!14628 _values!833) (store mapRest!21721 mapKey!21721 mapValue!21721))))

(declare-fun b!473236 () Bool)

(declare-fun e!277627 () Bool)

(assert (=> b!473236 (= e!277627 (bvsle #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-datatypes ((tuple2!8896 0))(
  ( (tuple2!8897 (_1!4459 (_ BitVec 64)) (_2!4459 V!18891)) )
))
(declare-datatypes ((List!8964 0))(
  ( (Nil!8961) (Cons!8960 (h!9816 tuple2!8896) (t!14925 List!8964)) )
))
(declare-datatypes ((ListLongMap!7799 0))(
  ( (ListLongMap!7800 (toList!3915 List!8964)) )
))
(declare-fun lt!214974 () ListLongMap!7799)

(declare-fun lt!214977 () tuple2!8896)

(declare-fun minValueBefore!38 () V!18891)

(declare-fun +!1767 (ListLongMap!7799 tuple2!8896) ListLongMap!7799)

(assert (=> b!473236 (= (+!1767 lt!214974 lt!214977) (+!1767 (+!1767 lt!214974 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214977))))

(declare-fun minValueAfter!38 () V!18891)

(assert (=> b!473236 (= lt!214977 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13924 0))(
  ( (Unit!13925) )
))
(declare-fun lt!214976 () Unit!13924)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!146 (ListLongMap!7799 (_ BitVec 64) V!18891 V!18891) Unit!13924)

(assert (=> b!473236 (= lt!214976 (addSameAsAddTwiceSameKeyDiffValues!146 lt!214974 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214978 () ListLongMap!7799)

(declare-fun zeroValue!794 () V!18891)

(assert (=> b!473236 (= lt!214974 (+!1767 lt!214978 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lt!214975 () ListLongMap!7799)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2219 (array!30415 array!30417 (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 (_ BitVec 32) Int) ListLongMap!7799)

(assert (=> b!473236 (= lt!214975 (getCurrentListMap!2219 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!214971 () ListLongMap!7799)

(assert (=> b!473236 (= lt!214971 (getCurrentListMap!2219 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473237 () Bool)

(declare-fun res!282708 () Bool)

(assert (=> b!473237 (=> (not res!282708) (not e!277626))))

(assert (=> b!473237 (= res!282708 (and (= (size!14981 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14980 _keys!1025) (size!14981 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!282711 () Bool)

(assert (=> start!42422 (=> (not res!282711) (not e!277626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42422 (= res!282711 (validMask!0 mask!1365))))

(assert (=> start!42422 e!277626))

(assert (=> start!42422 tp_is_empty!13339))

(assert (=> start!42422 tp!41766))

(assert (=> start!42422 true))

(declare-fun array_inv!10640 (array!30415) Bool)

(assert (=> start!42422 (array_inv!10640 _keys!1025)))

(declare-fun e!277628 () Bool)

(declare-fun array_inv!10641 (array!30417) Bool)

(assert (=> start!42422 (and (array_inv!10641 _values!833) e!277628)))

(declare-fun b!473238 () Bool)

(assert (=> b!473238 (= e!277626 (not e!277627))))

(declare-fun res!282709 () Bool)

(assert (=> b!473238 (=> res!282709 e!277627)))

(assert (=> b!473238 (= res!282709 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214973 () ListLongMap!7799)

(assert (=> b!473238 (= lt!214978 lt!214973)))

(declare-fun lt!214972 () Unit!13924)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!241 (array!30415 array!30417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 V!18891 V!18891 (_ BitVec 32) Int) Unit!13924)

(assert (=> b!473238 (= lt!214972 (lemmaNoChangeToArrayThenSameMapNoExtras!241 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2084 (array!30415 array!30417 (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 (_ BitVec 32) Int) ListLongMap!7799)

(assert (=> b!473238 (= lt!214973 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473238 (= lt!214978 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473239 () Bool)

(declare-fun res!282712 () Bool)

(assert (=> b!473239 (=> (not res!282712) (not e!277626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30415 (_ BitVec 32)) Bool)

(assert (=> b!473239 (= res!282712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473240 () Bool)

(assert (=> b!473240 (= e!277628 (and e!277631 mapRes!21721))))

(declare-fun condMapEmpty!21721 () Bool)

(declare-fun mapDefault!21721 () ValueCell!6326)

(assert (=> b!473240 (= condMapEmpty!21721 (= (arr!14628 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6326)) mapDefault!21721)))))

(assert (= (and start!42422 res!282711) b!473237))

(assert (= (and b!473237 res!282708) b!473239))

(assert (= (and b!473239 res!282712) b!473233))

(assert (= (and b!473233 res!282710) b!473238))

(assert (= (and b!473238 (not res!282709)) b!473236))

(assert (= (and b!473240 condMapEmpty!21721) mapIsEmpty!21721))

(assert (= (and b!473240 (not condMapEmpty!21721)) mapNonEmpty!21721))

(get-info :version)

(assert (= (and mapNonEmpty!21721 ((_ is ValueCellFull!6326) mapValue!21721)) b!473234))

(assert (= (and b!473240 ((_ is ValueCellFull!6326) mapDefault!21721)) b!473235))

(assert (= start!42422 b!473240))

(declare-fun m!454843 () Bool)

(assert (=> mapNonEmpty!21721 m!454843))

(declare-fun m!454845 () Bool)

(assert (=> b!473233 m!454845))

(declare-fun m!454847 () Bool)

(assert (=> b!473236 m!454847))

(declare-fun m!454849 () Bool)

(assert (=> b!473236 m!454849))

(declare-fun m!454851 () Bool)

(assert (=> b!473236 m!454851))

(declare-fun m!454853 () Bool)

(assert (=> b!473236 m!454853))

(declare-fun m!454855 () Bool)

(assert (=> b!473236 m!454855))

(declare-fun m!454857 () Bool)

(assert (=> b!473236 m!454857))

(assert (=> b!473236 m!454857))

(declare-fun m!454859 () Bool)

(assert (=> b!473236 m!454859))

(declare-fun m!454861 () Bool)

(assert (=> b!473239 m!454861))

(declare-fun m!454863 () Bool)

(assert (=> start!42422 m!454863))

(declare-fun m!454865 () Bool)

(assert (=> start!42422 m!454865))

(declare-fun m!454867 () Bool)

(assert (=> start!42422 m!454867))

(declare-fun m!454869 () Bool)

(assert (=> b!473238 m!454869))

(declare-fun m!454871 () Bool)

(assert (=> b!473238 m!454871))

(declare-fun m!454873 () Bool)

(assert (=> b!473238 m!454873))

(check-sat (not start!42422) (not b!473236) (not b!473238) (not b!473239) (not mapNonEmpty!21721) (not b!473233) tp_is_empty!13339 b_and!20341 (not b_next!11911))
(check-sat b_and!20341 (not b_next!11911))
(get-model)

(declare-fun d!75299 () Bool)

(assert (=> d!75299 (= (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215029 () Unit!13924)

(declare-fun choose!1358 (array!30415 array!30417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 V!18891 V!18891 (_ BitVec 32) Int) Unit!13924)

(assert (=> d!75299 (= lt!215029 (choose!1358 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75299 (validMask!0 mask!1365)))

(assert (=> d!75299 (= (lemmaNoChangeToArrayThenSameMapNoExtras!241 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215029)))

(declare-fun bs!15002 () Bool)

(assert (= bs!15002 d!75299))

(assert (=> bs!15002 m!454873))

(assert (=> bs!15002 m!454871))

(declare-fun m!454939 () Bool)

(assert (=> bs!15002 m!454939))

(assert (=> bs!15002 m!454863))

(assert (=> b!473238 d!75299))

(declare-fun b!473313 () Bool)

(assert (=> b!473313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(assert (=> b!473313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14981 _values!833)))))

(declare-fun lt!215049 () ListLongMap!7799)

(declare-fun e!277687 () Bool)

(declare-fun apply!332 (ListLongMap!7799 (_ BitVec 64)) V!18891)

(declare-fun get!7121 (ValueCell!6326 V!18891) V!18891)

(declare-fun dynLambda!928 (Int (_ BitVec 64)) V!18891)

(assert (=> b!473313 (= e!277687 (= (apply!332 lt!215049 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)) (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!473314 () Bool)

(declare-fun lt!215045 () Unit!13924)

(declare-fun lt!215046 () Unit!13924)

(assert (=> b!473314 (= lt!215045 lt!215046)))

(declare-fun lt!215048 () (_ BitVec 64))

(declare-fun lt!215047 () (_ BitVec 64))

(declare-fun lt!215044 () V!18891)

(declare-fun lt!215050 () ListLongMap!7799)

(declare-fun contains!2539 (ListLongMap!7799 (_ BitVec 64)) Bool)

(assert (=> b!473314 (not (contains!2539 (+!1767 lt!215050 (tuple2!8897 lt!215048 lt!215044)) lt!215047))))

(declare-fun addStillNotContains!166 (ListLongMap!7799 (_ BitVec 64) V!18891 (_ BitVec 64)) Unit!13924)

(assert (=> b!473314 (= lt!215046 (addStillNotContains!166 lt!215050 lt!215048 lt!215044 lt!215047))))

(assert (=> b!473314 (= lt!215047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!473314 (= lt!215044 (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!473314 (= lt!215048 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30470 () ListLongMap!7799)

(assert (=> b!473314 (= lt!215050 call!30470)))

(declare-fun e!277682 () ListLongMap!7799)

(assert (=> b!473314 (= e!277682 (+!1767 call!30470 (tuple2!8897 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000) (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!473315 () Bool)

(declare-fun e!277684 () Bool)

(declare-fun isEmpty!583 (ListLongMap!7799) Bool)

(assert (=> b!473315 (= e!277684 (isEmpty!583 lt!215049))))

(declare-fun b!473316 () Bool)

(declare-fun e!277683 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!473316 (= e!277683 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473316 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75301 () Bool)

(declare-fun e!277685 () Bool)

(assert (=> d!75301 e!277685))

(declare-fun res!282753 () Bool)

(assert (=> d!75301 (=> (not res!282753) (not e!277685))))

(assert (=> d!75301 (= res!282753 (not (contains!2539 lt!215049 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!277686 () ListLongMap!7799)

(assert (=> d!75301 (= lt!215049 e!277686)))

(declare-fun c!56988 () Bool)

(assert (=> d!75301 (= c!56988 (bvsge #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(assert (=> d!75301 (validMask!0 mask!1365)))

(assert (=> d!75301 (= (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215049)))

(declare-fun b!473317 () Bool)

(assert (=> b!473317 (= e!277684 (= lt!215049 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!473318 () Bool)

(declare-fun e!277688 () Bool)

(assert (=> b!473318 (= e!277685 e!277688)))

(declare-fun c!56986 () Bool)

(assert (=> b!473318 (= c!56986 e!277683)))

(declare-fun res!282751 () Bool)

(assert (=> b!473318 (=> (not res!282751) (not e!277683))))

(assert (=> b!473318 (= res!282751 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473319 () Bool)

(assert (=> b!473319 (= e!277688 e!277684)))

(declare-fun c!56987 () Bool)

(assert (=> b!473319 (= c!56987 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473320 () Bool)

(assert (=> b!473320 (= e!277686 e!277682)))

(declare-fun c!56989 () Bool)

(assert (=> b!473320 (= c!56989 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473321 () Bool)

(declare-fun res!282752 () Bool)

(assert (=> b!473321 (=> (not res!282752) (not e!277685))))

(assert (=> b!473321 (= res!282752 (not (contains!2539 lt!215049 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!473322 () Bool)

(assert (=> b!473322 (= e!277688 e!277687)))

(assert (=> b!473322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun res!282754 () Bool)

(assert (=> b!473322 (= res!282754 (contains!2539 lt!215049 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473322 (=> (not res!282754) (not e!277687))))

(declare-fun b!473323 () Bool)

(assert (=> b!473323 (= e!277682 call!30470)))

(declare-fun bm!30467 () Bool)

(assert (=> bm!30467 (= call!30470 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!473324 () Bool)

(assert (=> b!473324 (= e!277686 (ListLongMap!7800 Nil!8961))))

(assert (= (and d!75301 c!56988) b!473324))

(assert (= (and d!75301 (not c!56988)) b!473320))

(assert (= (and b!473320 c!56989) b!473314))

(assert (= (and b!473320 (not c!56989)) b!473323))

(assert (= (or b!473314 b!473323) bm!30467))

(assert (= (and d!75301 res!282753) b!473321))

(assert (= (and b!473321 res!282752) b!473318))

(assert (= (and b!473318 res!282751) b!473316))

(assert (= (and b!473318 c!56986) b!473322))

(assert (= (and b!473318 (not c!56986)) b!473319))

(assert (= (and b!473322 res!282754) b!473313))

(assert (= (and b!473319 c!56987) b!473317))

(assert (= (and b!473319 (not c!56987)) b!473315))

(declare-fun b_lambda!10187 () Bool)

(assert (=> (not b_lambda!10187) (not b!473313)))

(declare-fun t!14931 () Bool)

(declare-fun tb!3921 () Bool)

(assert (=> (and start!42422 (= defaultEntry!841 defaultEntry!841) t!14931) tb!3921))

(declare-fun result!7437 () Bool)

(assert (=> tb!3921 (= result!7437 tp_is_empty!13339)))

(assert (=> b!473313 t!14931))

(declare-fun b_and!20347 () Bool)

(assert (= b_and!20341 (and (=> t!14931 result!7437) b_and!20347)))

(declare-fun b_lambda!10189 () Bool)

(assert (=> (not b_lambda!10189) (not b!473314)))

(assert (=> b!473314 t!14931))

(declare-fun b_and!20349 () Bool)

(assert (= b_and!20347 (and (=> t!14931 result!7437) b_and!20349)))

(declare-fun m!454941 () Bool)

(assert (=> b!473317 m!454941))

(assert (=> bm!30467 m!454941))

(declare-fun m!454943 () Bool)

(assert (=> b!473321 m!454943))

(declare-fun m!454945 () Bool)

(assert (=> b!473316 m!454945))

(assert (=> b!473316 m!454945))

(declare-fun m!454947 () Bool)

(assert (=> b!473316 m!454947))

(assert (=> b!473322 m!454945))

(assert (=> b!473322 m!454945))

(declare-fun m!454949 () Bool)

(assert (=> b!473322 m!454949))

(declare-fun m!454951 () Bool)

(assert (=> b!473315 m!454951))

(declare-fun m!454953 () Bool)

(assert (=> b!473314 m!454953))

(declare-fun m!454955 () Bool)

(assert (=> b!473314 m!454955))

(assert (=> b!473314 m!454955))

(declare-fun m!454957 () Bool)

(assert (=> b!473314 m!454957))

(assert (=> b!473314 m!454945))

(declare-fun m!454959 () Bool)

(assert (=> b!473314 m!454959))

(assert (=> b!473314 m!454959))

(declare-fun m!454961 () Bool)

(assert (=> b!473314 m!454961))

(declare-fun m!454963 () Bool)

(assert (=> b!473314 m!454963))

(assert (=> b!473314 m!454961))

(declare-fun m!454965 () Bool)

(assert (=> b!473314 m!454965))

(assert (=> b!473313 m!454945))

(declare-fun m!454967 () Bool)

(assert (=> b!473313 m!454967))

(assert (=> b!473313 m!454961))

(assert (=> b!473313 m!454945))

(assert (=> b!473313 m!454959))

(assert (=> b!473313 m!454959))

(assert (=> b!473313 m!454961))

(assert (=> b!473313 m!454963))

(declare-fun m!454969 () Bool)

(assert (=> d!75301 m!454969))

(assert (=> d!75301 m!454863))

(assert (=> b!473320 m!454945))

(assert (=> b!473320 m!454945))

(assert (=> b!473320 m!454947))

(assert (=> b!473238 d!75301))

(declare-fun b!473327 () Bool)

(assert (=> b!473327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(assert (=> b!473327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14981 _values!833)))))

(declare-fun lt!215056 () ListLongMap!7799)

(declare-fun e!277694 () Bool)

(assert (=> b!473327 (= e!277694 (= (apply!332 lt!215056 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)) (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!473328 () Bool)

(declare-fun lt!215052 () Unit!13924)

(declare-fun lt!215053 () Unit!13924)

(assert (=> b!473328 (= lt!215052 lt!215053)))

(declare-fun lt!215054 () (_ BitVec 64))

(declare-fun lt!215055 () (_ BitVec 64))

(declare-fun lt!215057 () ListLongMap!7799)

(declare-fun lt!215051 () V!18891)

(assert (=> b!473328 (not (contains!2539 (+!1767 lt!215057 (tuple2!8897 lt!215055 lt!215051)) lt!215054))))

(assert (=> b!473328 (= lt!215053 (addStillNotContains!166 lt!215057 lt!215055 lt!215051 lt!215054))))

(assert (=> b!473328 (= lt!215054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!473328 (= lt!215051 (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!473328 (= lt!215055 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30471 () ListLongMap!7799)

(assert (=> b!473328 (= lt!215057 call!30471)))

(declare-fun e!277689 () ListLongMap!7799)

(assert (=> b!473328 (= e!277689 (+!1767 call!30471 (tuple2!8897 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000) (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!473329 () Bool)

(declare-fun e!277691 () Bool)

(assert (=> b!473329 (= e!277691 (isEmpty!583 lt!215056))))

(declare-fun b!473330 () Bool)

(declare-fun e!277690 () Bool)

(assert (=> b!473330 (= e!277690 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473330 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75303 () Bool)

(declare-fun e!277692 () Bool)

(assert (=> d!75303 e!277692))

(declare-fun res!282757 () Bool)

(assert (=> d!75303 (=> (not res!282757) (not e!277692))))

(assert (=> d!75303 (= res!282757 (not (contains!2539 lt!215056 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!277693 () ListLongMap!7799)

(assert (=> d!75303 (= lt!215056 e!277693)))

(declare-fun c!56992 () Bool)

(assert (=> d!75303 (= c!56992 (bvsge #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(assert (=> d!75303 (validMask!0 mask!1365)))

(assert (=> d!75303 (= (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215056)))

(declare-fun b!473331 () Bool)

(assert (=> b!473331 (= e!277691 (= lt!215056 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!473332 () Bool)

(declare-fun e!277695 () Bool)

(assert (=> b!473332 (= e!277692 e!277695)))

(declare-fun c!56990 () Bool)

(assert (=> b!473332 (= c!56990 e!277690)))

(declare-fun res!282755 () Bool)

(assert (=> b!473332 (=> (not res!282755) (not e!277690))))

(assert (=> b!473332 (= res!282755 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473333 () Bool)

(assert (=> b!473333 (= e!277695 e!277691)))

(declare-fun c!56991 () Bool)

(assert (=> b!473333 (= c!56991 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473334 () Bool)

(assert (=> b!473334 (= e!277693 e!277689)))

(declare-fun c!56993 () Bool)

(assert (=> b!473334 (= c!56993 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473335 () Bool)

(declare-fun res!282756 () Bool)

(assert (=> b!473335 (=> (not res!282756) (not e!277692))))

(assert (=> b!473335 (= res!282756 (not (contains!2539 lt!215056 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!473336 () Bool)

(assert (=> b!473336 (= e!277695 e!277694)))

(assert (=> b!473336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun res!282758 () Bool)

(assert (=> b!473336 (= res!282758 (contains!2539 lt!215056 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473336 (=> (not res!282758) (not e!277694))))

(declare-fun b!473337 () Bool)

(assert (=> b!473337 (= e!277689 call!30471)))

(declare-fun bm!30468 () Bool)

(assert (=> bm!30468 (= call!30471 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!473338 () Bool)

(assert (=> b!473338 (= e!277693 (ListLongMap!7800 Nil!8961))))

(assert (= (and d!75303 c!56992) b!473338))

(assert (= (and d!75303 (not c!56992)) b!473334))

(assert (= (and b!473334 c!56993) b!473328))

(assert (= (and b!473334 (not c!56993)) b!473337))

(assert (= (or b!473328 b!473337) bm!30468))

(assert (= (and d!75303 res!282757) b!473335))

(assert (= (and b!473335 res!282756) b!473332))

(assert (= (and b!473332 res!282755) b!473330))

(assert (= (and b!473332 c!56990) b!473336))

(assert (= (and b!473332 (not c!56990)) b!473333))

(assert (= (and b!473336 res!282758) b!473327))

(assert (= (and b!473333 c!56991) b!473331))

(assert (= (and b!473333 (not c!56991)) b!473329))

(declare-fun b_lambda!10191 () Bool)

(assert (=> (not b_lambda!10191) (not b!473327)))

(assert (=> b!473327 t!14931))

(declare-fun b_and!20351 () Bool)

(assert (= b_and!20349 (and (=> t!14931 result!7437) b_and!20351)))

(declare-fun b_lambda!10193 () Bool)

(assert (=> (not b_lambda!10193) (not b!473328)))

(assert (=> b!473328 t!14931))

(declare-fun b_and!20353 () Bool)

(assert (= b_and!20351 (and (=> t!14931 result!7437) b_and!20353)))

(declare-fun m!454971 () Bool)

(assert (=> b!473331 m!454971))

(assert (=> bm!30468 m!454971))

(declare-fun m!454973 () Bool)

(assert (=> b!473335 m!454973))

(assert (=> b!473330 m!454945))

(assert (=> b!473330 m!454945))

(assert (=> b!473330 m!454947))

(assert (=> b!473336 m!454945))

(assert (=> b!473336 m!454945))

(declare-fun m!454975 () Bool)

(assert (=> b!473336 m!454975))

(declare-fun m!454977 () Bool)

(assert (=> b!473329 m!454977))

(declare-fun m!454979 () Bool)

(assert (=> b!473328 m!454979))

(declare-fun m!454981 () Bool)

(assert (=> b!473328 m!454981))

(assert (=> b!473328 m!454981))

(declare-fun m!454983 () Bool)

(assert (=> b!473328 m!454983))

(assert (=> b!473328 m!454945))

(assert (=> b!473328 m!454959))

(assert (=> b!473328 m!454959))

(assert (=> b!473328 m!454961))

(assert (=> b!473328 m!454963))

(assert (=> b!473328 m!454961))

(declare-fun m!454985 () Bool)

(assert (=> b!473328 m!454985))

(assert (=> b!473327 m!454945))

(declare-fun m!454987 () Bool)

(assert (=> b!473327 m!454987))

(assert (=> b!473327 m!454961))

(assert (=> b!473327 m!454945))

(assert (=> b!473327 m!454959))

(assert (=> b!473327 m!454959))

(assert (=> b!473327 m!454961))

(assert (=> b!473327 m!454963))

(declare-fun m!454989 () Bool)

(assert (=> d!75303 m!454989))

(assert (=> d!75303 m!454863))

(assert (=> b!473334 m!454945))

(assert (=> b!473334 m!454945))

(assert (=> b!473334 m!454947))

(assert (=> b!473238 d!75303))

(declare-fun b!473349 () Bool)

(declare-fun e!277707 () Bool)

(declare-fun e!277704 () Bool)

(assert (=> b!473349 (= e!277707 e!277704)))

(declare-fun c!56996 () Bool)

(assert (=> b!473349 (= c!56996 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473350 () Bool)

(declare-fun call!30474 () Bool)

(assert (=> b!473350 (= e!277704 call!30474)))

(declare-fun b!473351 () Bool)

(declare-fun e!277705 () Bool)

(assert (=> b!473351 (= e!277705 e!277707)))

(declare-fun res!282767 () Bool)

(assert (=> b!473351 (=> (not res!282767) (not e!277707))))

(declare-fun e!277706 () Bool)

(assert (=> b!473351 (= res!282767 (not e!277706))))

(declare-fun res!282766 () Bool)

(assert (=> b!473351 (=> (not res!282766) (not e!277706))))

(assert (=> b!473351 (= res!282766 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75305 () Bool)

(declare-fun res!282765 () Bool)

(assert (=> d!75305 (=> res!282765 e!277705)))

(assert (=> d!75305 (= res!282765 (bvsge #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(assert (=> d!75305 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8960) e!277705)))

(declare-fun bm!30471 () Bool)

(assert (=> bm!30471 (= call!30474 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56996 (Cons!8959 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000) Nil!8960) Nil!8960)))))

(declare-fun b!473352 () Bool)

(declare-fun contains!2540 (List!8963 (_ BitVec 64)) Bool)

(assert (=> b!473352 (= e!277706 (contains!2540 Nil!8960 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473353 () Bool)

(assert (=> b!473353 (= e!277704 call!30474)))

(assert (= (and d!75305 (not res!282765)) b!473351))

(assert (= (and b!473351 res!282766) b!473352))

(assert (= (and b!473351 res!282767) b!473349))

(assert (= (and b!473349 c!56996) b!473350))

(assert (= (and b!473349 (not c!56996)) b!473353))

(assert (= (or b!473350 b!473353) bm!30471))

(assert (=> b!473349 m!454945))

(assert (=> b!473349 m!454945))

(assert (=> b!473349 m!454947))

(assert (=> b!473351 m!454945))

(assert (=> b!473351 m!454945))

(assert (=> b!473351 m!454947))

(assert (=> bm!30471 m!454945))

(declare-fun m!454991 () Bool)

(assert (=> bm!30471 m!454991))

(assert (=> b!473352 m!454945))

(assert (=> b!473352 m!454945))

(declare-fun m!454993 () Bool)

(assert (=> b!473352 m!454993))

(assert (=> b!473233 d!75305))

(declare-fun d!75307 () Bool)

(declare-fun e!277710 () Bool)

(assert (=> d!75307 e!277710))

(declare-fun res!282772 () Bool)

(assert (=> d!75307 (=> (not res!282772) (not e!277710))))

(declare-fun lt!215066 () ListLongMap!7799)

(assert (=> d!75307 (= res!282772 (contains!2539 lt!215066 (_1!4459 lt!214977)))))

(declare-fun lt!215067 () List!8964)

(assert (=> d!75307 (= lt!215066 (ListLongMap!7800 lt!215067))))

(declare-fun lt!215068 () Unit!13924)

(declare-fun lt!215069 () Unit!13924)

(assert (=> d!75307 (= lt!215068 lt!215069)))

(declare-datatypes ((Option!384 0))(
  ( (Some!383 (v!9002 V!18891)) (None!382) )
))
(declare-fun getValueByKey!378 (List!8964 (_ BitVec 64)) Option!384)

(assert (=> d!75307 (= (getValueByKey!378 lt!215067 (_1!4459 lt!214977)) (Some!383 (_2!4459 lt!214977)))))

(declare-fun lemmaContainsTupThenGetReturnValue!203 (List!8964 (_ BitVec 64) V!18891) Unit!13924)

(assert (=> d!75307 (= lt!215069 (lemmaContainsTupThenGetReturnValue!203 lt!215067 (_1!4459 lt!214977) (_2!4459 lt!214977)))))

(declare-fun insertStrictlySorted!206 (List!8964 (_ BitVec 64) V!18891) List!8964)

(assert (=> d!75307 (= lt!215067 (insertStrictlySorted!206 (toList!3915 lt!214974) (_1!4459 lt!214977) (_2!4459 lt!214977)))))

(assert (=> d!75307 (= (+!1767 lt!214974 lt!214977) lt!215066)))

(declare-fun b!473358 () Bool)

(declare-fun res!282773 () Bool)

(assert (=> b!473358 (=> (not res!282773) (not e!277710))))

(assert (=> b!473358 (= res!282773 (= (getValueByKey!378 (toList!3915 lt!215066) (_1!4459 lt!214977)) (Some!383 (_2!4459 lt!214977))))))

(declare-fun b!473359 () Bool)

(declare-fun contains!2541 (List!8964 tuple2!8896) Bool)

(assert (=> b!473359 (= e!277710 (contains!2541 (toList!3915 lt!215066) lt!214977))))

(assert (= (and d!75307 res!282772) b!473358))

(assert (= (and b!473358 res!282773) b!473359))

(declare-fun m!454995 () Bool)

(assert (=> d!75307 m!454995))

(declare-fun m!454997 () Bool)

(assert (=> d!75307 m!454997))

(declare-fun m!454999 () Bool)

(assert (=> d!75307 m!454999))

(declare-fun m!455001 () Bool)

(assert (=> d!75307 m!455001))

(declare-fun m!455003 () Bool)

(assert (=> b!473358 m!455003))

(declare-fun m!455005 () Bool)

(assert (=> b!473359 m!455005))

(assert (=> b!473236 d!75307))

(declare-fun d!75309 () Bool)

(declare-fun e!277711 () Bool)

(assert (=> d!75309 e!277711))

(declare-fun res!282774 () Bool)

(assert (=> d!75309 (=> (not res!282774) (not e!277711))))

(declare-fun lt!215070 () ListLongMap!7799)

(assert (=> d!75309 (= res!282774 (contains!2539 lt!215070 (_1!4459 lt!214977)))))

(declare-fun lt!215071 () List!8964)

(assert (=> d!75309 (= lt!215070 (ListLongMap!7800 lt!215071))))

(declare-fun lt!215072 () Unit!13924)

(declare-fun lt!215073 () Unit!13924)

(assert (=> d!75309 (= lt!215072 lt!215073)))

(assert (=> d!75309 (= (getValueByKey!378 lt!215071 (_1!4459 lt!214977)) (Some!383 (_2!4459 lt!214977)))))

(assert (=> d!75309 (= lt!215073 (lemmaContainsTupThenGetReturnValue!203 lt!215071 (_1!4459 lt!214977) (_2!4459 lt!214977)))))

(assert (=> d!75309 (= lt!215071 (insertStrictlySorted!206 (toList!3915 (+!1767 lt!214974 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4459 lt!214977) (_2!4459 lt!214977)))))

(assert (=> d!75309 (= (+!1767 (+!1767 lt!214974 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214977) lt!215070)))

(declare-fun b!473360 () Bool)

(declare-fun res!282775 () Bool)

(assert (=> b!473360 (=> (not res!282775) (not e!277711))))

(assert (=> b!473360 (= res!282775 (= (getValueByKey!378 (toList!3915 lt!215070) (_1!4459 lt!214977)) (Some!383 (_2!4459 lt!214977))))))

(declare-fun b!473361 () Bool)

(assert (=> b!473361 (= e!277711 (contains!2541 (toList!3915 lt!215070) lt!214977))))

(assert (= (and d!75309 res!282774) b!473360))

(assert (= (and b!473360 res!282775) b!473361))

(declare-fun m!455007 () Bool)

(assert (=> d!75309 m!455007))

(declare-fun m!455009 () Bool)

(assert (=> d!75309 m!455009))

(declare-fun m!455011 () Bool)

(assert (=> d!75309 m!455011))

(declare-fun m!455013 () Bool)

(assert (=> d!75309 m!455013))

(declare-fun m!455015 () Bool)

(assert (=> b!473360 m!455015))

(declare-fun m!455017 () Bool)

(assert (=> b!473361 m!455017))

(assert (=> b!473236 d!75309))

(declare-fun b!473404 () Bool)

(declare-fun e!277742 () Bool)

(declare-fun e!277743 () Bool)

(assert (=> b!473404 (= e!277742 e!277743)))

(declare-fun res!282800 () Bool)

(declare-fun call!30490 () Bool)

(assert (=> b!473404 (= res!282800 call!30490)))

(assert (=> b!473404 (=> (not res!282800) (not e!277743))))

(declare-fun b!473405 () Bool)

(declare-fun e!277738 () ListLongMap!7799)

(declare-fun call!30492 () ListLongMap!7799)

(assert (=> b!473405 (= e!277738 call!30492)))

(declare-fun b!473406 () Bool)

(declare-fun res!282799 () Bool)

(declare-fun e!277746 () Bool)

(assert (=> b!473406 (=> (not res!282799) (not e!277746))))

(declare-fun e!277750 () Bool)

(assert (=> b!473406 (= res!282799 e!277750)))

(declare-fun res!282794 () Bool)

(assert (=> b!473406 (=> res!282794 e!277750)))

(declare-fun e!277741 () Bool)

(assert (=> b!473406 (= res!282794 (not e!277741))))

(declare-fun res!282801 () Bool)

(assert (=> b!473406 (=> (not res!282801) (not e!277741))))

(assert (=> b!473406 (= res!282801 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473407 () Bool)

(declare-fun call!30494 () ListLongMap!7799)

(assert (=> b!473407 (= e!277738 call!30494)))

(declare-fun b!473408 () Bool)

(declare-fun c!57012 () Bool)

(assert (=> b!473408 (= c!57012 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!277744 () ListLongMap!7799)

(assert (=> b!473408 (= e!277744 e!277738)))

(declare-fun b!473409 () Bool)

(declare-fun e!277747 () Bool)

(declare-fun lt!215127 () ListLongMap!7799)

(assert (=> b!473409 (= e!277747 (= (apply!332 lt!215127 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!473410 () Bool)

(assert (=> b!473410 (= e!277741 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473411 () Bool)

(declare-fun e!277748 () Bool)

(declare-fun call!30491 () Bool)

(assert (=> b!473411 (= e!277748 (not call!30491))))

(declare-fun b!473412 () Bool)

(assert (=> b!473412 (= e!277743 (= (apply!332 lt!215127 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun d!75311 () Bool)

(assert (=> d!75311 e!277746))

(declare-fun res!282795 () Bool)

(assert (=> d!75311 (=> (not res!282795) (not e!277746))))

(assert (=> d!75311 (= res!282795 (or (bvsge #b00000000000000000000000000000000 (size!14980 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))))

(declare-fun lt!215136 () ListLongMap!7799)

(assert (=> d!75311 (= lt!215127 lt!215136)))

(declare-fun lt!215118 () Unit!13924)

(declare-fun e!277739 () Unit!13924)

(assert (=> d!75311 (= lt!215118 e!277739)))

(declare-fun c!57013 () Bool)

(declare-fun e!277745 () Bool)

(assert (=> d!75311 (= c!57013 e!277745)))

(declare-fun res!282796 () Bool)

(assert (=> d!75311 (=> (not res!282796) (not e!277745))))

(assert (=> d!75311 (= res!282796 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun e!277749 () ListLongMap!7799)

(assert (=> d!75311 (= lt!215136 e!277749)))

(declare-fun c!57014 () Bool)

(assert (=> d!75311 (= c!57014 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75311 (validMask!0 mask!1365)))

(assert (=> d!75311 (= (getCurrentListMap!2219 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215127)))

(declare-fun b!473413 () Bool)

(assert (=> b!473413 (= e!277745 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473414 () Bool)

(declare-fun call!30495 () ListLongMap!7799)

(assert (=> b!473414 (= e!277749 (+!1767 call!30495 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!473415 () Bool)

(declare-fun lt!215123 () Unit!13924)

(assert (=> b!473415 (= e!277739 lt!215123)))

(declare-fun lt!215130 () ListLongMap!7799)

(assert (=> b!473415 (= lt!215130 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215120 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215138 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215138 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215139 () Unit!13924)

(declare-fun addStillContains!291 (ListLongMap!7799 (_ BitVec 64) V!18891 (_ BitVec 64)) Unit!13924)

(assert (=> b!473415 (= lt!215139 (addStillContains!291 lt!215130 lt!215120 zeroValue!794 lt!215138))))

(assert (=> b!473415 (contains!2539 (+!1767 lt!215130 (tuple2!8897 lt!215120 zeroValue!794)) lt!215138)))

(declare-fun lt!215126 () Unit!13924)

(assert (=> b!473415 (= lt!215126 lt!215139)))

(declare-fun lt!215124 () ListLongMap!7799)

(assert (=> b!473415 (= lt!215124 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215128 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215128 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215134 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215134 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215131 () Unit!13924)

(declare-fun addApplyDifferent!291 (ListLongMap!7799 (_ BitVec 64) V!18891 (_ BitVec 64)) Unit!13924)

(assert (=> b!473415 (= lt!215131 (addApplyDifferent!291 lt!215124 lt!215128 minValueBefore!38 lt!215134))))

(assert (=> b!473415 (= (apply!332 (+!1767 lt!215124 (tuple2!8897 lt!215128 minValueBefore!38)) lt!215134) (apply!332 lt!215124 lt!215134))))

(declare-fun lt!215132 () Unit!13924)

(assert (=> b!473415 (= lt!215132 lt!215131)))

(declare-fun lt!215133 () ListLongMap!7799)

(assert (=> b!473415 (= lt!215133 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215129 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215119 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215119 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215125 () Unit!13924)

(assert (=> b!473415 (= lt!215125 (addApplyDifferent!291 lt!215133 lt!215129 zeroValue!794 lt!215119))))

(assert (=> b!473415 (= (apply!332 (+!1767 lt!215133 (tuple2!8897 lt!215129 zeroValue!794)) lt!215119) (apply!332 lt!215133 lt!215119))))

(declare-fun lt!215135 () Unit!13924)

(assert (=> b!473415 (= lt!215135 lt!215125)))

(declare-fun lt!215121 () ListLongMap!7799)

(assert (=> b!473415 (= lt!215121 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215122 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215122 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215137 () (_ BitVec 64))

(assert (=> b!473415 (= lt!215137 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473415 (= lt!215123 (addApplyDifferent!291 lt!215121 lt!215122 minValueBefore!38 lt!215137))))

(assert (=> b!473415 (= (apply!332 (+!1767 lt!215121 (tuple2!8897 lt!215122 minValueBefore!38)) lt!215137) (apply!332 lt!215121 lt!215137))))

(declare-fun bm!30486 () Bool)

(declare-fun call!30489 () ListLongMap!7799)

(assert (=> bm!30486 (= call!30492 call!30489)))

(declare-fun bm!30487 () Bool)

(assert (=> bm!30487 (= call!30494 call!30495)))

(declare-fun e!277740 () Bool)

(declare-fun b!473416 () Bool)

(assert (=> b!473416 (= e!277740 (= (apply!332 lt!215127 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)) (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!473416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14981 _values!833)))))

(assert (=> b!473416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun bm!30488 () Bool)

(assert (=> bm!30488 (= call!30490 (contains!2539 lt!215127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473417 () Bool)

(assert (=> b!473417 (= e!277746 e!277742)))

(declare-fun c!57009 () Bool)

(assert (=> b!473417 (= c!57009 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30489 () Bool)

(assert (=> bm!30489 (= call!30491 (contains!2539 lt!215127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473418 () Bool)

(assert (=> b!473418 (= e!277749 e!277744)))

(declare-fun c!57011 () Bool)

(assert (=> b!473418 (= c!57011 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473419 () Bool)

(assert (=> b!473419 (= e!277748 e!277747)))

(declare-fun res!282802 () Bool)

(assert (=> b!473419 (= res!282802 call!30491)))

(assert (=> b!473419 (=> (not res!282802) (not e!277747))))

(declare-fun b!473420 () Bool)

(assert (=> b!473420 (= e!277742 (not call!30490))))

(declare-fun b!473421 () Bool)

(declare-fun Unit!13930 () Unit!13924)

(assert (=> b!473421 (= e!277739 Unit!13930)))

(declare-fun b!473422 () Bool)

(declare-fun res!282798 () Bool)

(assert (=> b!473422 (=> (not res!282798) (not e!277746))))

(assert (=> b!473422 (= res!282798 e!277748)))

(declare-fun c!57010 () Bool)

(assert (=> b!473422 (= c!57010 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!30493 () ListLongMap!7799)

(declare-fun bm!30490 () Bool)

(assert (=> bm!30490 (= call!30493 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30491 () Bool)

(assert (=> bm!30491 (= call!30489 call!30493)))

(declare-fun bm!30492 () Bool)

(assert (=> bm!30492 (= call!30495 (+!1767 (ite c!57014 call!30493 (ite c!57011 call!30489 call!30492)) (ite (or c!57014 c!57011) (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!473423 () Bool)

(assert (=> b!473423 (= e!277750 e!277740)))

(declare-fun res!282797 () Bool)

(assert (=> b!473423 (=> (not res!282797) (not e!277740))))

(assert (=> b!473423 (= res!282797 (contains!2539 lt!215127 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473423 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473424 () Bool)

(assert (=> b!473424 (= e!277744 call!30494)))

(assert (= (and d!75311 c!57014) b!473414))

(assert (= (and d!75311 (not c!57014)) b!473418))

(assert (= (and b!473418 c!57011) b!473424))

(assert (= (and b!473418 (not c!57011)) b!473408))

(assert (= (and b!473408 c!57012) b!473407))

(assert (= (and b!473408 (not c!57012)) b!473405))

(assert (= (or b!473407 b!473405) bm!30486))

(assert (= (or b!473424 bm!30486) bm!30491))

(assert (= (or b!473424 b!473407) bm!30487))

(assert (= (or b!473414 bm!30491) bm!30490))

(assert (= (or b!473414 bm!30487) bm!30492))

(assert (= (and d!75311 res!282796) b!473413))

(assert (= (and d!75311 c!57013) b!473415))

(assert (= (and d!75311 (not c!57013)) b!473421))

(assert (= (and d!75311 res!282795) b!473406))

(assert (= (and b!473406 res!282801) b!473410))

(assert (= (and b!473406 (not res!282794)) b!473423))

(assert (= (and b!473423 res!282797) b!473416))

(assert (= (and b!473406 res!282799) b!473422))

(assert (= (and b!473422 c!57010) b!473419))

(assert (= (and b!473422 (not c!57010)) b!473411))

(assert (= (and b!473419 res!282802) b!473409))

(assert (= (or b!473419 b!473411) bm!30489))

(assert (= (and b!473422 res!282798) b!473417))

(assert (= (and b!473417 c!57009) b!473404))

(assert (= (and b!473417 (not c!57009)) b!473420))

(assert (= (and b!473404 res!282800) b!473412))

(assert (= (or b!473404 b!473420) bm!30488))

(declare-fun b_lambda!10195 () Bool)

(assert (=> (not b_lambda!10195) (not b!473416)))

(assert (=> b!473416 t!14931))

(declare-fun b_and!20355 () Bool)

(assert (= b_and!20353 (and (=> t!14931 result!7437) b_and!20355)))

(declare-fun m!455019 () Bool)

(assert (=> b!473409 m!455019))

(assert (=> bm!30490 m!454873))

(declare-fun m!455021 () Bool)

(assert (=> b!473415 m!455021))

(declare-fun m!455023 () Bool)

(assert (=> b!473415 m!455023))

(declare-fun m!455025 () Bool)

(assert (=> b!473415 m!455025))

(declare-fun m!455027 () Bool)

(assert (=> b!473415 m!455027))

(declare-fun m!455029 () Bool)

(assert (=> b!473415 m!455029))

(declare-fun m!455031 () Bool)

(assert (=> b!473415 m!455031))

(declare-fun m!455033 () Bool)

(assert (=> b!473415 m!455033))

(assert (=> b!473415 m!455027))

(declare-fun m!455035 () Bool)

(assert (=> b!473415 m!455035))

(declare-fun m!455037 () Bool)

(assert (=> b!473415 m!455037))

(declare-fun m!455039 () Bool)

(assert (=> b!473415 m!455039))

(declare-fun m!455041 () Bool)

(assert (=> b!473415 m!455041))

(assert (=> b!473415 m!455025))

(declare-fun m!455043 () Bool)

(assert (=> b!473415 m!455043))

(declare-fun m!455045 () Bool)

(assert (=> b!473415 m!455045))

(declare-fun m!455047 () Bool)

(assert (=> b!473415 m!455047))

(declare-fun m!455049 () Bool)

(assert (=> b!473415 m!455049))

(assert (=> b!473415 m!455045))

(assert (=> b!473415 m!454945))

(assert (=> b!473415 m!454873))

(assert (=> b!473415 m!455037))

(assert (=> b!473413 m!454945))

(assert (=> b!473413 m!454945))

(assert (=> b!473413 m!454947))

(declare-fun m!455051 () Bool)

(assert (=> bm!30488 m!455051))

(declare-fun m!455053 () Bool)

(assert (=> bm!30489 m!455053))

(declare-fun m!455055 () Bool)

(assert (=> b!473412 m!455055))

(declare-fun m!455057 () Bool)

(assert (=> bm!30492 m!455057))

(assert (=> b!473416 m!454959))

(assert (=> b!473416 m!454961))

(assert (=> b!473416 m!454945))

(assert (=> b!473416 m!454945))

(declare-fun m!455059 () Bool)

(assert (=> b!473416 m!455059))

(assert (=> b!473416 m!454959))

(assert (=> b!473416 m!454961))

(assert (=> b!473416 m!454963))

(assert (=> b!473423 m!454945))

(assert (=> b!473423 m!454945))

(declare-fun m!455061 () Bool)

(assert (=> b!473423 m!455061))

(declare-fun m!455063 () Bool)

(assert (=> b!473414 m!455063))

(assert (=> d!75311 m!454863))

(assert (=> b!473410 m!454945))

(assert (=> b!473410 m!454945))

(assert (=> b!473410 m!454947))

(assert (=> b!473236 d!75311))

(declare-fun b!473425 () Bool)

(declare-fun e!277755 () Bool)

(declare-fun e!277756 () Bool)

(assert (=> b!473425 (= e!277755 e!277756)))

(declare-fun res!282809 () Bool)

(declare-fun call!30497 () Bool)

(assert (=> b!473425 (= res!282809 call!30497)))

(assert (=> b!473425 (=> (not res!282809) (not e!277756))))

(declare-fun b!473426 () Bool)

(declare-fun e!277751 () ListLongMap!7799)

(declare-fun call!30499 () ListLongMap!7799)

(assert (=> b!473426 (= e!277751 call!30499)))

(declare-fun b!473427 () Bool)

(declare-fun res!282808 () Bool)

(declare-fun e!277759 () Bool)

(assert (=> b!473427 (=> (not res!282808) (not e!277759))))

(declare-fun e!277763 () Bool)

(assert (=> b!473427 (= res!282808 e!277763)))

(declare-fun res!282803 () Bool)

(assert (=> b!473427 (=> res!282803 e!277763)))

(declare-fun e!277754 () Bool)

(assert (=> b!473427 (= res!282803 (not e!277754))))

(declare-fun res!282810 () Bool)

(assert (=> b!473427 (=> (not res!282810) (not e!277754))))

(assert (=> b!473427 (= res!282810 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473428 () Bool)

(declare-fun call!30501 () ListLongMap!7799)

(assert (=> b!473428 (= e!277751 call!30501)))

(declare-fun b!473429 () Bool)

(declare-fun c!57018 () Bool)

(assert (=> b!473429 (= c!57018 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!277757 () ListLongMap!7799)

(assert (=> b!473429 (= e!277757 e!277751)))

(declare-fun b!473430 () Bool)

(declare-fun e!277760 () Bool)

(declare-fun lt!215149 () ListLongMap!7799)

(assert (=> b!473430 (= e!277760 (= (apply!332 lt!215149 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!473431 () Bool)

(assert (=> b!473431 (= e!277754 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473432 () Bool)

(declare-fun e!277761 () Bool)

(declare-fun call!30498 () Bool)

(assert (=> b!473432 (= e!277761 (not call!30498))))

(declare-fun b!473433 () Bool)

(assert (=> b!473433 (= e!277756 (= (apply!332 lt!215149 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun d!75313 () Bool)

(assert (=> d!75313 e!277759))

(declare-fun res!282804 () Bool)

(assert (=> d!75313 (=> (not res!282804) (not e!277759))))

(assert (=> d!75313 (= res!282804 (or (bvsge #b00000000000000000000000000000000 (size!14980 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))))

(declare-fun lt!215158 () ListLongMap!7799)

(assert (=> d!75313 (= lt!215149 lt!215158)))

(declare-fun lt!215140 () Unit!13924)

(declare-fun e!277752 () Unit!13924)

(assert (=> d!75313 (= lt!215140 e!277752)))

(declare-fun c!57019 () Bool)

(declare-fun e!277758 () Bool)

(assert (=> d!75313 (= c!57019 e!277758)))

(declare-fun res!282805 () Bool)

(assert (=> d!75313 (=> (not res!282805) (not e!277758))))

(assert (=> d!75313 (= res!282805 (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun e!277762 () ListLongMap!7799)

(assert (=> d!75313 (= lt!215158 e!277762)))

(declare-fun c!57020 () Bool)

(assert (=> d!75313 (= c!57020 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75313 (validMask!0 mask!1365)))

(assert (=> d!75313 (= (getCurrentListMap!2219 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215149)))

(declare-fun b!473434 () Bool)

(assert (=> b!473434 (= e!277758 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473435 () Bool)

(declare-fun call!30502 () ListLongMap!7799)

(assert (=> b!473435 (= e!277762 (+!1767 call!30502 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!473436 () Bool)

(declare-fun lt!215145 () Unit!13924)

(assert (=> b!473436 (= e!277752 lt!215145)))

(declare-fun lt!215152 () ListLongMap!7799)

(assert (=> b!473436 (= lt!215152 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215142 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215142 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215160 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215160 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215161 () Unit!13924)

(assert (=> b!473436 (= lt!215161 (addStillContains!291 lt!215152 lt!215142 zeroValue!794 lt!215160))))

(assert (=> b!473436 (contains!2539 (+!1767 lt!215152 (tuple2!8897 lt!215142 zeroValue!794)) lt!215160)))

(declare-fun lt!215148 () Unit!13924)

(assert (=> b!473436 (= lt!215148 lt!215161)))

(declare-fun lt!215146 () ListLongMap!7799)

(assert (=> b!473436 (= lt!215146 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215150 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215150 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215156 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215156 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215153 () Unit!13924)

(assert (=> b!473436 (= lt!215153 (addApplyDifferent!291 lt!215146 lt!215150 minValueAfter!38 lt!215156))))

(assert (=> b!473436 (= (apply!332 (+!1767 lt!215146 (tuple2!8897 lt!215150 minValueAfter!38)) lt!215156) (apply!332 lt!215146 lt!215156))))

(declare-fun lt!215154 () Unit!13924)

(assert (=> b!473436 (= lt!215154 lt!215153)))

(declare-fun lt!215155 () ListLongMap!7799)

(assert (=> b!473436 (= lt!215155 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215151 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215141 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215141 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215147 () Unit!13924)

(assert (=> b!473436 (= lt!215147 (addApplyDifferent!291 lt!215155 lt!215151 zeroValue!794 lt!215141))))

(assert (=> b!473436 (= (apply!332 (+!1767 lt!215155 (tuple2!8897 lt!215151 zeroValue!794)) lt!215141) (apply!332 lt!215155 lt!215141))))

(declare-fun lt!215157 () Unit!13924)

(assert (=> b!473436 (= lt!215157 lt!215147)))

(declare-fun lt!215143 () ListLongMap!7799)

(assert (=> b!473436 (= lt!215143 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215144 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215144 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215159 () (_ BitVec 64))

(assert (=> b!473436 (= lt!215159 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473436 (= lt!215145 (addApplyDifferent!291 lt!215143 lt!215144 minValueAfter!38 lt!215159))))

(assert (=> b!473436 (= (apply!332 (+!1767 lt!215143 (tuple2!8897 lt!215144 minValueAfter!38)) lt!215159) (apply!332 lt!215143 lt!215159))))

(declare-fun bm!30493 () Bool)

(declare-fun call!30496 () ListLongMap!7799)

(assert (=> bm!30493 (= call!30499 call!30496)))

(declare-fun bm!30494 () Bool)

(assert (=> bm!30494 (= call!30501 call!30502)))

(declare-fun e!277753 () Bool)

(declare-fun b!473437 () Bool)

(assert (=> b!473437 (= e!277753 (= (apply!332 lt!215149 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)) (get!7121 (select (arr!14628 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!473437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14981 _values!833)))))

(assert (=> b!473437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun bm!30495 () Bool)

(assert (=> bm!30495 (= call!30497 (contains!2539 lt!215149 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473438 () Bool)

(assert (=> b!473438 (= e!277759 e!277755)))

(declare-fun c!57015 () Bool)

(assert (=> b!473438 (= c!57015 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30496 () Bool)

(assert (=> bm!30496 (= call!30498 (contains!2539 lt!215149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473439 () Bool)

(assert (=> b!473439 (= e!277762 e!277757)))

(declare-fun c!57017 () Bool)

(assert (=> b!473439 (= c!57017 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473440 () Bool)

(assert (=> b!473440 (= e!277761 e!277760)))

(declare-fun res!282811 () Bool)

(assert (=> b!473440 (= res!282811 call!30498)))

(assert (=> b!473440 (=> (not res!282811) (not e!277760))))

(declare-fun b!473441 () Bool)

(assert (=> b!473441 (= e!277755 (not call!30497))))

(declare-fun b!473442 () Bool)

(declare-fun Unit!13931 () Unit!13924)

(assert (=> b!473442 (= e!277752 Unit!13931)))

(declare-fun b!473443 () Bool)

(declare-fun res!282807 () Bool)

(assert (=> b!473443 (=> (not res!282807) (not e!277759))))

(assert (=> b!473443 (= res!282807 e!277761)))

(declare-fun c!57016 () Bool)

(assert (=> b!473443 (= c!57016 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30497 () Bool)

(declare-fun call!30500 () ListLongMap!7799)

(assert (=> bm!30497 (= call!30500 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30498 () Bool)

(assert (=> bm!30498 (= call!30496 call!30500)))

(declare-fun bm!30499 () Bool)

(assert (=> bm!30499 (= call!30502 (+!1767 (ite c!57020 call!30500 (ite c!57017 call!30496 call!30499)) (ite (or c!57020 c!57017) (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!473444 () Bool)

(assert (=> b!473444 (= e!277763 e!277753)))

(declare-fun res!282806 () Bool)

(assert (=> b!473444 (=> (not res!282806) (not e!277753))))

(assert (=> b!473444 (= res!282806 (contains!2539 lt!215149 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(declare-fun b!473445 () Bool)

(assert (=> b!473445 (= e!277757 call!30501)))

(assert (= (and d!75313 c!57020) b!473435))

(assert (= (and d!75313 (not c!57020)) b!473439))

(assert (= (and b!473439 c!57017) b!473445))

(assert (= (and b!473439 (not c!57017)) b!473429))

(assert (= (and b!473429 c!57018) b!473428))

(assert (= (and b!473429 (not c!57018)) b!473426))

(assert (= (or b!473428 b!473426) bm!30493))

(assert (= (or b!473445 bm!30493) bm!30498))

(assert (= (or b!473445 b!473428) bm!30494))

(assert (= (or b!473435 bm!30498) bm!30497))

(assert (= (or b!473435 bm!30494) bm!30499))

(assert (= (and d!75313 res!282805) b!473434))

(assert (= (and d!75313 c!57019) b!473436))

(assert (= (and d!75313 (not c!57019)) b!473442))

(assert (= (and d!75313 res!282804) b!473427))

(assert (= (and b!473427 res!282810) b!473431))

(assert (= (and b!473427 (not res!282803)) b!473444))

(assert (= (and b!473444 res!282806) b!473437))

(assert (= (and b!473427 res!282808) b!473443))

(assert (= (and b!473443 c!57016) b!473440))

(assert (= (and b!473443 (not c!57016)) b!473432))

(assert (= (and b!473440 res!282811) b!473430))

(assert (= (or b!473440 b!473432) bm!30496))

(assert (= (and b!473443 res!282807) b!473438))

(assert (= (and b!473438 c!57015) b!473425))

(assert (= (and b!473438 (not c!57015)) b!473441))

(assert (= (and b!473425 res!282809) b!473433))

(assert (= (or b!473425 b!473441) bm!30495))

(declare-fun b_lambda!10197 () Bool)

(assert (=> (not b_lambda!10197) (not b!473437)))

(assert (=> b!473437 t!14931))

(declare-fun b_and!20357 () Bool)

(assert (= b_and!20355 (and (=> t!14931 result!7437) b_and!20357)))

(declare-fun m!455065 () Bool)

(assert (=> b!473430 m!455065))

(assert (=> bm!30497 m!454871))

(declare-fun m!455067 () Bool)

(assert (=> b!473436 m!455067))

(declare-fun m!455069 () Bool)

(assert (=> b!473436 m!455069))

(declare-fun m!455071 () Bool)

(assert (=> b!473436 m!455071))

(declare-fun m!455073 () Bool)

(assert (=> b!473436 m!455073))

(declare-fun m!455075 () Bool)

(assert (=> b!473436 m!455075))

(declare-fun m!455077 () Bool)

(assert (=> b!473436 m!455077))

(declare-fun m!455079 () Bool)

(assert (=> b!473436 m!455079))

(assert (=> b!473436 m!455073))

(declare-fun m!455081 () Bool)

(assert (=> b!473436 m!455081))

(declare-fun m!455083 () Bool)

(assert (=> b!473436 m!455083))

(declare-fun m!455085 () Bool)

(assert (=> b!473436 m!455085))

(declare-fun m!455087 () Bool)

(assert (=> b!473436 m!455087))

(assert (=> b!473436 m!455071))

(declare-fun m!455089 () Bool)

(assert (=> b!473436 m!455089))

(declare-fun m!455091 () Bool)

(assert (=> b!473436 m!455091))

(declare-fun m!455093 () Bool)

(assert (=> b!473436 m!455093))

(declare-fun m!455095 () Bool)

(assert (=> b!473436 m!455095))

(assert (=> b!473436 m!455091))

(assert (=> b!473436 m!454945))

(assert (=> b!473436 m!454871))

(assert (=> b!473436 m!455083))

(assert (=> b!473434 m!454945))

(assert (=> b!473434 m!454945))

(assert (=> b!473434 m!454947))

(declare-fun m!455097 () Bool)

(assert (=> bm!30495 m!455097))

(declare-fun m!455099 () Bool)

(assert (=> bm!30496 m!455099))

(declare-fun m!455101 () Bool)

(assert (=> b!473433 m!455101))

(declare-fun m!455103 () Bool)

(assert (=> bm!30499 m!455103))

(assert (=> b!473437 m!454959))

(assert (=> b!473437 m!454961))

(assert (=> b!473437 m!454945))

(assert (=> b!473437 m!454945))

(declare-fun m!455105 () Bool)

(assert (=> b!473437 m!455105))

(assert (=> b!473437 m!454959))

(assert (=> b!473437 m!454961))

(assert (=> b!473437 m!454963))

(assert (=> b!473444 m!454945))

(assert (=> b!473444 m!454945))

(declare-fun m!455107 () Bool)

(assert (=> b!473444 m!455107))

(declare-fun m!455109 () Bool)

(assert (=> b!473435 m!455109))

(assert (=> d!75313 m!454863))

(assert (=> b!473431 m!454945))

(assert (=> b!473431 m!454945))

(assert (=> b!473431 m!454947))

(assert (=> b!473236 d!75313))

(declare-fun d!75315 () Bool)

(assert (=> d!75315 (= (+!1767 lt!214974 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1767 (+!1767 lt!214974 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!215164 () Unit!13924)

(declare-fun choose!1359 (ListLongMap!7799 (_ BitVec 64) V!18891 V!18891) Unit!13924)

(assert (=> d!75315 (= lt!215164 (choose!1359 lt!214974 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75315 (= (addSameAsAddTwiceSameKeyDiffValues!146 lt!214974 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!215164)))

(declare-fun bs!15003 () Bool)

(assert (= bs!15003 d!75315))

(declare-fun m!455111 () Bool)

(assert (=> bs!15003 m!455111))

(assert (=> bs!15003 m!454857))

(assert (=> bs!15003 m!454857))

(declare-fun m!455113 () Bool)

(assert (=> bs!15003 m!455113))

(declare-fun m!455115 () Bool)

(assert (=> bs!15003 m!455115))

(assert (=> b!473236 d!75315))

(declare-fun d!75317 () Bool)

(declare-fun e!277764 () Bool)

(assert (=> d!75317 e!277764))

(declare-fun res!282812 () Bool)

(assert (=> d!75317 (=> (not res!282812) (not e!277764))))

(declare-fun lt!215165 () ListLongMap!7799)

(assert (=> d!75317 (= res!282812 (contains!2539 lt!215165 (_1!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!215166 () List!8964)

(assert (=> d!75317 (= lt!215165 (ListLongMap!7800 lt!215166))))

(declare-fun lt!215167 () Unit!13924)

(declare-fun lt!215168 () Unit!13924)

(assert (=> d!75317 (= lt!215167 lt!215168)))

(assert (=> d!75317 (= (getValueByKey!378 lt!215166 (_1!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!383 (_2!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75317 (= lt!215168 (lemmaContainsTupThenGetReturnValue!203 lt!215166 (_1!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75317 (= lt!215166 (insertStrictlySorted!206 (toList!3915 lt!214978) (_1!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75317 (= (+!1767 lt!214978 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!215165)))

(declare-fun b!473446 () Bool)

(declare-fun res!282813 () Bool)

(assert (=> b!473446 (=> (not res!282813) (not e!277764))))

(assert (=> b!473446 (= res!282813 (= (getValueByKey!378 (toList!3915 lt!215165) (_1!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!383 (_2!4459 (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!473447 () Bool)

(assert (=> b!473447 (= e!277764 (contains!2541 (toList!3915 lt!215165) (tuple2!8897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75317 res!282812) b!473446))

(assert (= (and b!473446 res!282813) b!473447))

(declare-fun m!455117 () Bool)

(assert (=> d!75317 m!455117))

(declare-fun m!455119 () Bool)

(assert (=> d!75317 m!455119))

(declare-fun m!455121 () Bool)

(assert (=> d!75317 m!455121))

(declare-fun m!455123 () Bool)

(assert (=> d!75317 m!455123))

(declare-fun m!455125 () Bool)

(assert (=> b!473446 m!455125))

(declare-fun m!455127 () Bool)

(assert (=> b!473447 m!455127))

(assert (=> b!473236 d!75317))

(declare-fun d!75319 () Bool)

(declare-fun e!277765 () Bool)

(assert (=> d!75319 e!277765))

(declare-fun res!282814 () Bool)

(assert (=> d!75319 (=> (not res!282814) (not e!277765))))

(declare-fun lt!215169 () ListLongMap!7799)

(assert (=> d!75319 (= res!282814 (contains!2539 lt!215169 (_1!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!215170 () List!8964)

(assert (=> d!75319 (= lt!215169 (ListLongMap!7800 lt!215170))))

(declare-fun lt!215171 () Unit!13924)

(declare-fun lt!215172 () Unit!13924)

(assert (=> d!75319 (= lt!215171 lt!215172)))

(assert (=> d!75319 (= (getValueByKey!378 lt!215170 (_1!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!383 (_2!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75319 (= lt!215172 (lemmaContainsTupThenGetReturnValue!203 lt!215170 (_1!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75319 (= lt!215170 (insertStrictlySorted!206 (toList!3915 lt!214974) (_1!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75319 (= (+!1767 lt!214974 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215169)))

(declare-fun b!473448 () Bool)

(declare-fun res!282815 () Bool)

(assert (=> b!473448 (=> (not res!282815) (not e!277765))))

(assert (=> b!473448 (= res!282815 (= (getValueByKey!378 (toList!3915 lt!215169) (_1!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!383 (_2!4459 (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!473449 () Bool)

(assert (=> b!473449 (= e!277765 (contains!2541 (toList!3915 lt!215169) (tuple2!8897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75319 res!282814) b!473448))

(assert (= (and b!473448 res!282815) b!473449))

(declare-fun m!455129 () Bool)

(assert (=> d!75319 m!455129))

(declare-fun m!455131 () Bool)

(assert (=> d!75319 m!455131))

(declare-fun m!455133 () Bool)

(assert (=> d!75319 m!455133))

(declare-fun m!455135 () Bool)

(assert (=> d!75319 m!455135))

(declare-fun m!455137 () Bool)

(assert (=> b!473448 m!455137))

(declare-fun m!455139 () Bool)

(assert (=> b!473449 m!455139))

(assert (=> b!473236 d!75319))

(declare-fun b!473458 () Bool)

(declare-fun e!277772 () Bool)

(declare-fun call!30505 () Bool)

(assert (=> b!473458 (= e!277772 call!30505)))

(declare-fun bm!30502 () Bool)

(assert (=> bm!30502 (= call!30505 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!473459 () Bool)

(declare-fun e!277773 () Bool)

(assert (=> b!473459 (= e!277773 call!30505)))

(declare-fun b!473460 () Bool)

(declare-fun e!277774 () Bool)

(assert (=> b!473460 (= e!277774 e!277773)))

(declare-fun c!57023 () Bool)

(assert (=> b!473460 (= c!57023 (validKeyInArray!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75321 () Bool)

(declare-fun res!282821 () Bool)

(assert (=> d!75321 (=> res!282821 e!277774)))

(assert (=> d!75321 (= res!282821 (bvsge #b00000000000000000000000000000000 (size!14980 _keys!1025)))))

(assert (=> d!75321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!277774)))

(declare-fun b!473461 () Bool)

(assert (=> b!473461 (= e!277773 e!277772)))

(declare-fun lt!215180 () (_ BitVec 64))

(assert (=> b!473461 (= lt!215180 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215181 () Unit!13924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30415 (_ BitVec 64) (_ BitVec 32)) Unit!13924)

(assert (=> b!473461 (= lt!215181 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!215180 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!473461 (arrayContainsKey!0 _keys!1025 lt!215180 #b00000000000000000000000000000000)))

(declare-fun lt!215179 () Unit!13924)

(assert (=> b!473461 (= lt!215179 lt!215181)))

(declare-fun res!282820 () Bool)

(declare-datatypes ((SeekEntryResult!3551 0))(
  ( (MissingZero!3551 (index!16383 (_ BitVec 32))) (Found!3551 (index!16384 (_ BitVec 32))) (Intermediate!3551 (undefined!4363 Bool) (index!16385 (_ BitVec 32)) (x!44414 (_ BitVec 32))) (Undefined!3551) (MissingVacant!3551 (index!16386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30415 (_ BitVec 32)) SeekEntryResult!3551)

(assert (=> b!473461 (= res!282820 (= (seekEntryOrOpen!0 (select (arr!14627 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3551 #b00000000000000000000000000000000)))))

(assert (=> b!473461 (=> (not res!282820) (not e!277772))))

(assert (= (and d!75321 (not res!282821)) b!473460))

(assert (= (and b!473460 c!57023) b!473461))

(assert (= (and b!473460 (not c!57023)) b!473459))

(assert (= (and b!473461 res!282820) b!473458))

(assert (= (or b!473458 b!473459) bm!30502))

(declare-fun m!455141 () Bool)

(assert (=> bm!30502 m!455141))

(assert (=> b!473460 m!454945))

(assert (=> b!473460 m!454945))

(assert (=> b!473460 m!454947))

(assert (=> b!473461 m!454945))

(declare-fun m!455143 () Bool)

(assert (=> b!473461 m!455143))

(declare-fun m!455145 () Bool)

(assert (=> b!473461 m!455145))

(assert (=> b!473461 m!454945))

(declare-fun m!455147 () Bool)

(assert (=> b!473461 m!455147))

(assert (=> b!473239 d!75321))

(declare-fun d!75323 () Bool)

(assert (=> d!75323 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42422 d!75323))

(declare-fun d!75325 () Bool)

(assert (=> d!75325 (= (array_inv!10640 _keys!1025) (bvsge (size!14980 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42422 d!75325))

(declare-fun d!75327 () Bool)

(assert (=> d!75327 (= (array_inv!10641 _values!833) (bvsge (size!14981 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42422 d!75327))

(declare-fun mapNonEmpty!21730 () Bool)

(declare-fun mapRes!21730 () Bool)

(declare-fun tp!41782 () Bool)

(declare-fun e!277780 () Bool)

(assert (=> mapNonEmpty!21730 (= mapRes!21730 (and tp!41782 e!277780))))

(declare-fun mapKey!21730 () (_ BitVec 32))

(declare-fun mapValue!21730 () ValueCell!6326)

(declare-fun mapRest!21730 () (Array (_ BitVec 32) ValueCell!6326))

(assert (=> mapNonEmpty!21730 (= mapRest!21721 (store mapRest!21730 mapKey!21730 mapValue!21730))))

(declare-fun mapIsEmpty!21730 () Bool)

(assert (=> mapIsEmpty!21730 mapRes!21730))

(declare-fun b!473468 () Bool)

(assert (=> b!473468 (= e!277780 tp_is_empty!13339)))

(declare-fun condMapEmpty!21730 () Bool)

(declare-fun mapDefault!21730 () ValueCell!6326)

(assert (=> mapNonEmpty!21721 (= condMapEmpty!21730 (= mapRest!21721 ((as const (Array (_ BitVec 32) ValueCell!6326)) mapDefault!21730)))))

(declare-fun e!277779 () Bool)

(assert (=> mapNonEmpty!21721 (= tp!41767 (and e!277779 mapRes!21730))))

(declare-fun b!473469 () Bool)

(assert (=> b!473469 (= e!277779 tp_is_empty!13339)))

(assert (= (and mapNonEmpty!21721 condMapEmpty!21730) mapIsEmpty!21730))

(assert (= (and mapNonEmpty!21721 (not condMapEmpty!21730)) mapNonEmpty!21730))

(assert (= (and mapNonEmpty!21730 ((_ is ValueCellFull!6326) mapValue!21730)) b!473468))

(assert (= (and mapNonEmpty!21721 ((_ is ValueCellFull!6326) mapDefault!21730)) b!473469))

(declare-fun m!455149 () Bool)

(assert (=> mapNonEmpty!21730 m!455149))

(declare-fun b_lambda!10199 () Bool)

(assert (= b_lambda!10189 (or (and start!42422 b_free!11911) b_lambda!10199)))

(declare-fun b_lambda!10201 () Bool)

(assert (= b_lambda!10197 (or (and start!42422 b_free!11911) b_lambda!10201)))

(declare-fun b_lambda!10203 () Bool)

(assert (= b_lambda!10193 (or (and start!42422 b_free!11911) b_lambda!10203)))

(declare-fun b_lambda!10205 () Bool)

(assert (= b_lambda!10191 (or (and start!42422 b_free!11911) b_lambda!10205)))

(declare-fun b_lambda!10207 () Bool)

(assert (= b_lambda!10187 (or (and start!42422 b_free!11911) b_lambda!10207)))

(declare-fun b_lambda!10209 () Bool)

(assert (= b_lambda!10195 (or (and start!42422 b_free!11911) b_lambda!10209)))

(check-sat (not bm!30489) (not b!473358) (not bm!30499) (not bm!30496) tp_is_empty!13339 (not b!473313) (not bm!30468) (not bm!30497) (not b_lambda!10209) (not b!473412) (not bm!30488) (not b!473444) (not d!75311) (not b!473316) (not b!473461) (not d!75317) (not b!473328) (not b!473449) (not b!473329) (not b!473315) (not d!75315) (not b!473352) (not b_next!11911) (not b!473321) (not b!473330) (not b!473360) (not b!473322) (not bm!30492) (not b_lambda!10199) (not b!473415) (not b!473431) (not b!473335) (not b!473349) (not b!473361) (not mapNonEmpty!21730) (not b!473437) (not b!473410) (not b!473436) (not b!473331) (not b!473314) (not b!473336) (not bm!30495) (not d!75309) (not b!473414) (not b!473413) (not b!473317) (not b!473416) (not d!75307) b_and!20357 (not bm!30471) (not b!473434) (not b!473435) (not b_lambda!10205) (not d!75313) (not b!473448) (not d!75319) (not b!473460) (not bm!30467) (not b!473327) (not b!473320) (not b!473433) (not b!473423) (not bm!30490) (not b_lambda!10201) (not b!473351) (not bm!30502) (not b!473446) (not d!75303) (not b_lambda!10207) (not b!473334) (not b!473430) (not b_lambda!10203) (not d!75301) (not d!75299) (not b!473409) (not b!473447) (not b!473359))
(check-sat b_and!20357 (not b_next!11911))

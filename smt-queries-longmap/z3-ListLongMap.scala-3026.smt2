; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42496 () Bool)

(assert start!42496)

(declare-fun b_free!11965 () Bool)

(declare-fun b_next!11965 () Bool)

(assert (=> start!42496 (= b_free!11965 (not b_next!11965))))

(declare-fun tp!41931 () Bool)

(declare-fun b_and!20407 () Bool)

(assert (=> start!42496 (= tp!41931 b_and!20407)))

(declare-fun b!474063 () Bool)

(declare-fun e!278225 () Bool)

(declare-datatypes ((array!30521 0))(
  ( (array!30522 (arr!14679 (Array (_ BitVec 32) (_ BitVec 64))) (size!15032 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30521)

(assert (=> b!474063 (= e!278225 (bvsle #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-datatypes ((V!18963 0))(
  ( (V!18964 (val!6741 Int)) )
))
(declare-datatypes ((tuple2!8944 0))(
  ( (tuple2!8945 (_1!4483 (_ BitVec 64)) (_2!4483 V!18963)) )
))
(declare-datatypes ((List!9005 0))(
  ( (Nil!9002) (Cons!9001 (h!9857 tuple2!8944) (t!14968 List!9005)) )
))
(declare-datatypes ((ListLongMap!7847 0))(
  ( (ListLongMap!7848 (toList!3939 List!9005)) )
))
(declare-fun lt!215781 () ListLongMap!7847)

(declare-fun lt!215777 () tuple2!8944)

(declare-fun minValueBefore!38 () V!18963)

(declare-fun +!1785 (ListLongMap!7847 tuple2!8944) ListLongMap!7847)

(assert (=> b!474063 (= (+!1785 lt!215781 lt!215777) (+!1785 (+!1785 lt!215781 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215777))))

(declare-fun minValueAfter!38 () V!18963)

(assert (=> b!474063 (= lt!215777 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13974 0))(
  ( (Unit!13975) )
))
(declare-fun lt!215776 () Unit!13974)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!164 (ListLongMap!7847 (_ BitVec 64) V!18963 V!18963) Unit!13974)

(assert (=> b!474063 (= lt!215776 (addSameAsAddTwiceSameKeyDiffValues!164 lt!215781 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215778 () ListLongMap!7847)

(declare-fun zeroValue!794 () V!18963)

(assert (=> b!474063 (= lt!215781 (+!1785 lt!215778 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215779 () ListLongMap!7847)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6353 0))(
  ( (ValueCellFull!6353 (v!9027 V!18963)) (EmptyCell!6353) )
))
(declare-datatypes ((array!30523 0))(
  ( (array!30524 (arr!14680 (Array (_ BitVec 32) ValueCell!6353)) (size!15033 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30523)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2237 (array!30521 array!30523 (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 (_ BitVec 32) Int) ListLongMap!7847)

(assert (=> b!474063 (= lt!215779 (getCurrentListMap!2237 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215774 () ListLongMap!7847)

(assert (=> b!474063 (= lt!215774 (getCurrentListMap!2237 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283192 () Bool)

(declare-fun e!278227 () Bool)

(assert (=> start!42496 (=> (not res!283192) (not e!278227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42496 (= res!283192 (validMask!0 mask!1365))))

(assert (=> start!42496 e!278227))

(declare-fun tp_is_empty!13393 () Bool)

(assert (=> start!42496 tp_is_empty!13393))

(assert (=> start!42496 tp!41931))

(assert (=> start!42496 true))

(declare-fun array_inv!10674 (array!30521) Bool)

(assert (=> start!42496 (array_inv!10674 _keys!1025)))

(declare-fun e!278226 () Bool)

(declare-fun array_inv!10675 (array!30523) Bool)

(assert (=> start!42496 (and (array_inv!10675 _values!833) e!278226)))

(declare-fun b!474062 () Bool)

(declare-fun res!283195 () Bool)

(assert (=> b!474062 (=> (not res!283195) (not e!278227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30521 (_ BitVec 32)) Bool)

(assert (=> b!474062 (= res!283195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474064 () Bool)

(declare-fun e!278228 () Bool)

(declare-fun mapRes!21805 () Bool)

(assert (=> b!474064 (= e!278226 (and e!278228 mapRes!21805))))

(declare-fun condMapEmpty!21805 () Bool)

(declare-fun mapDefault!21805 () ValueCell!6353)

(assert (=> b!474064 (= condMapEmpty!21805 (= (arr!14680 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6353)) mapDefault!21805)))))

(declare-fun mapIsEmpty!21805 () Bool)

(assert (=> mapIsEmpty!21805 mapRes!21805))

(declare-fun b!474065 () Bool)

(declare-fun res!283194 () Bool)

(assert (=> b!474065 (=> (not res!283194) (not e!278227))))

(declare-datatypes ((List!9006 0))(
  ( (Nil!9003) (Cons!9002 (h!9858 (_ BitVec 64)) (t!14969 List!9006)) )
))
(declare-fun arrayNoDuplicates!0 (array!30521 (_ BitVec 32) List!9006) Bool)

(assert (=> b!474065 (= res!283194 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9003))))

(declare-fun b!474066 () Bool)

(declare-fun res!283193 () Bool)

(assert (=> b!474066 (=> (not res!283193) (not e!278227))))

(assert (=> b!474066 (= res!283193 (and (= (size!15033 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15032 _keys!1025) (size!15033 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21805 () Bool)

(declare-fun tp!41932 () Bool)

(declare-fun e!278230 () Bool)

(assert (=> mapNonEmpty!21805 (= mapRes!21805 (and tp!41932 e!278230))))

(declare-fun mapValue!21805 () ValueCell!6353)

(declare-fun mapKey!21805 () (_ BitVec 32))

(declare-fun mapRest!21805 () (Array (_ BitVec 32) ValueCell!6353))

(assert (=> mapNonEmpty!21805 (= (arr!14680 _values!833) (store mapRest!21805 mapKey!21805 mapValue!21805))))

(declare-fun b!474067 () Bool)

(assert (=> b!474067 (= e!278227 (not e!278225))))

(declare-fun res!283196 () Bool)

(assert (=> b!474067 (=> res!283196 e!278225)))

(assert (=> b!474067 (= res!283196 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215775 () ListLongMap!7847)

(assert (=> b!474067 (= lt!215778 lt!215775)))

(declare-fun lt!215780 () Unit!13974)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!263 (array!30521 array!30523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 V!18963 V!18963 (_ BitVec 32) Int) Unit!13974)

(assert (=> b!474067 (= lt!215780 (lemmaNoChangeToArrayThenSameMapNoExtras!263 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2106 (array!30521 array!30523 (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 (_ BitVec 32) Int) ListLongMap!7847)

(assert (=> b!474067 (= lt!215775 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474067 (= lt!215778 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474068 () Bool)

(assert (=> b!474068 (= e!278230 tp_is_empty!13393)))

(declare-fun b!474069 () Bool)

(assert (=> b!474069 (= e!278228 tp_is_empty!13393)))

(assert (= (and start!42496 res!283192) b!474066))

(assert (= (and b!474066 res!283193) b!474062))

(assert (= (and b!474062 res!283195) b!474065))

(assert (= (and b!474065 res!283194) b!474067))

(assert (= (and b!474067 (not res!283196)) b!474063))

(assert (= (and b!474064 condMapEmpty!21805) mapIsEmpty!21805))

(assert (= (and b!474064 (not condMapEmpty!21805)) mapNonEmpty!21805))

(get-info :version)

(assert (= (and mapNonEmpty!21805 ((_ is ValueCellFull!6353) mapValue!21805)) b!474068))

(assert (= (and b!474064 ((_ is ValueCellFull!6353) mapDefault!21805)) b!474069))

(assert (= start!42496 b!474064))

(declare-fun m!455919 () Bool)

(assert (=> mapNonEmpty!21805 m!455919))

(declare-fun m!455921 () Bool)

(assert (=> b!474067 m!455921))

(declare-fun m!455923 () Bool)

(assert (=> b!474067 m!455923))

(declare-fun m!455925 () Bool)

(assert (=> b!474067 m!455925))

(declare-fun m!455927 () Bool)

(assert (=> b!474065 m!455927))

(declare-fun m!455929 () Bool)

(assert (=> b!474063 m!455929))

(declare-fun m!455931 () Bool)

(assert (=> b!474063 m!455931))

(declare-fun m!455933 () Bool)

(assert (=> b!474063 m!455933))

(declare-fun m!455935 () Bool)

(assert (=> b!474063 m!455935))

(assert (=> b!474063 m!455931))

(declare-fun m!455937 () Bool)

(assert (=> b!474063 m!455937))

(declare-fun m!455939 () Bool)

(assert (=> b!474063 m!455939))

(declare-fun m!455941 () Bool)

(assert (=> b!474063 m!455941))

(declare-fun m!455943 () Bool)

(assert (=> start!42496 m!455943))

(declare-fun m!455945 () Bool)

(assert (=> start!42496 m!455945))

(declare-fun m!455947 () Bool)

(assert (=> start!42496 m!455947))

(declare-fun m!455949 () Bool)

(assert (=> b!474062 m!455949))

(check-sat (not b!474063) (not b_next!11965) (not b!474062) b_and!20407 (not mapNonEmpty!21805) (not start!42496) (not b!474067) (not b!474065) tp_is_empty!13393)
(check-sat b_and!20407 (not b_next!11965))
(get-model)

(declare-fun d!75347 () Bool)

(assert (=> d!75347 (= (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215832 () Unit!13974)

(declare-fun choose!1360 (array!30521 array!30523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18963 V!18963 V!18963 V!18963 (_ BitVec 32) Int) Unit!13974)

(assert (=> d!75347 (= lt!215832 (choose!1360 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75347 (validMask!0 mask!1365)))

(assert (=> d!75347 (= (lemmaNoChangeToArrayThenSameMapNoExtras!263 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215832)))

(declare-fun bs!15031 () Bool)

(assert (= bs!15031 d!75347))

(assert (=> bs!15031 m!455925))

(assert (=> bs!15031 m!455923))

(declare-fun m!456015 () Bool)

(assert (=> bs!15031 m!456015))

(assert (=> bs!15031 m!455943))

(assert (=> b!474067 d!75347))

(declare-fun bm!30505 () Bool)

(declare-fun call!30508 () ListLongMap!7847)

(assert (=> bm!30505 (= call!30508 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!474142 () Bool)

(declare-fun e!278284 () Bool)

(declare-fun e!278282 () Bool)

(assert (=> b!474142 (= e!278284 e!278282)))

(declare-fun c!57034 () Bool)

(declare-fun e!278286 () Bool)

(assert (=> b!474142 (= c!57034 e!278286)))

(declare-fun res!283238 () Bool)

(assert (=> b!474142 (=> (not res!283238) (not e!278286))))

(assert (=> b!474142 (= res!283238 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474143 () Bool)

(declare-fun e!278283 () Bool)

(declare-fun lt!215851 () ListLongMap!7847)

(declare-fun isEmpty!584 (ListLongMap!7847) Bool)

(assert (=> b!474143 (= e!278283 (isEmpty!584 lt!215851))))

(declare-fun b!474144 () Bool)

(assert (=> b!474144 (= e!278282 e!278283)))

(declare-fun c!57035 () Bool)

(assert (=> b!474144 (= c!57035 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474145 () Bool)

(declare-fun e!278287 () Bool)

(assert (=> b!474145 (= e!278282 e!278287)))

(assert (=> b!474145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun res!283237 () Bool)

(declare-fun contains!2542 (ListLongMap!7847 (_ BitVec 64)) Bool)

(assert (=> b!474145 (= res!283237 (contains!2542 lt!215851 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474145 (=> (not res!283237) (not e!278287))))

(declare-fun b!474147 () Bool)

(declare-fun e!278281 () ListLongMap!7847)

(assert (=> b!474147 (= e!278281 call!30508)))

(declare-fun b!474148 () Bool)

(declare-fun e!278285 () ListLongMap!7847)

(assert (=> b!474148 (= e!278285 e!278281)))

(declare-fun c!57032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!474148 (= c!57032 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474149 () Bool)

(assert (=> b!474149 (= e!278285 (ListLongMap!7848 Nil!9002))))

(declare-fun b!474150 () Bool)

(assert (=> b!474150 (= e!278286 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474150 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!474151 () Bool)

(declare-fun lt!215850 () Unit!13974)

(declare-fun lt!215848 () Unit!13974)

(assert (=> b!474151 (= lt!215850 lt!215848)))

(declare-fun lt!215852 () V!18963)

(declare-fun lt!215847 () (_ BitVec 64))

(declare-fun lt!215853 () ListLongMap!7847)

(declare-fun lt!215849 () (_ BitVec 64))

(assert (=> b!474151 (not (contains!2542 (+!1785 lt!215853 (tuple2!8945 lt!215849 lt!215852)) lt!215847))))

(declare-fun addStillNotContains!167 (ListLongMap!7847 (_ BitVec 64) V!18963 (_ BitVec 64)) Unit!13974)

(assert (=> b!474151 (= lt!215848 (addStillNotContains!167 lt!215853 lt!215849 lt!215852 lt!215847))))

(assert (=> b!474151 (= lt!215847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7140 (ValueCell!6353 V!18963) V!18963)

(declare-fun dynLambda!929 (Int (_ BitVec 64)) V!18963)

(assert (=> b!474151 (= lt!215852 (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!474151 (= lt!215849 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474151 (= lt!215853 call!30508)))

(assert (=> b!474151 (= e!278281 (+!1785 call!30508 (tuple2!8945 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000) (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!474152 () Bool)

(assert (=> b!474152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> b!474152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15033 _values!833)))))

(declare-fun apply!333 (ListLongMap!7847 (_ BitVec 64)) V!18963)

(assert (=> b!474152 (= e!278287 (= (apply!333 lt!215851 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)) (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!474153 () Bool)

(assert (=> b!474153 (= e!278283 (= lt!215851 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!474146 () Bool)

(declare-fun res!283235 () Bool)

(assert (=> b!474146 (=> (not res!283235) (not e!278284))))

(assert (=> b!474146 (= res!283235 (not (contains!2542 lt!215851 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75349 () Bool)

(assert (=> d!75349 e!278284))

(declare-fun res!283236 () Bool)

(assert (=> d!75349 (=> (not res!283236) (not e!278284))))

(assert (=> d!75349 (= res!283236 (not (contains!2542 lt!215851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75349 (= lt!215851 e!278285)))

(declare-fun c!57033 () Bool)

(assert (=> d!75349 (= c!57033 (bvsge #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> d!75349 (validMask!0 mask!1365)))

(assert (=> d!75349 (= (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215851)))

(assert (= (and d!75349 c!57033) b!474149))

(assert (= (and d!75349 (not c!57033)) b!474148))

(assert (= (and b!474148 c!57032) b!474151))

(assert (= (and b!474148 (not c!57032)) b!474147))

(assert (= (or b!474151 b!474147) bm!30505))

(assert (= (and d!75349 res!283236) b!474146))

(assert (= (and b!474146 res!283235) b!474142))

(assert (= (and b!474142 res!283238) b!474150))

(assert (= (and b!474142 c!57034) b!474145))

(assert (= (and b!474142 (not c!57034)) b!474144))

(assert (= (and b!474145 res!283237) b!474152))

(assert (= (and b!474144 c!57035) b!474153))

(assert (= (and b!474144 (not c!57035)) b!474143))

(declare-fun b_lambda!10211 () Bool)

(assert (=> (not b_lambda!10211) (not b!474151)))

(declare-fun t!14975 () Bool)

(declare-fun tb!3923 () Bool)

(assert (=> (and start!42496 (= defaultEntry!841 defaultEntry!841) t!14975) tb!3923))

(declare-fun result!7443 () Bool)

(assert (=> tb!3923 (= result!7443 tp_is_empty!13393)))

(assert (=> b!474151 t!14975))

(declare-fun b_and!20413 () Bool)

(assert (= b_and!20407 (and (=> t!14975 result!7443) b_and!20413)))

(declare-fun b_lambda!10213 () Bool)

(assert (=> (not b_lambda!10213) (not b!474152)))

(assert (=> b!474152 t!14975))

(declare-fun b_and!20415 () Bool)

(assert (= b_and!20413 (and (=> t!14975 result!7443) b_and!20415)))

(declare-fun m!456017 () Bool)

(assert (=> b!474148 m!456017))

(assert (=> b!474148 m!456017))

(declare-fun m!456019 () Bool)

(assert (=> b!474148 m!456019))

(declare-fun m!456021 () Bool)

(assert (=> b!474143 m!456021))

(assert (=> b!474152 m!456017))

(declare-fun m!456023 () Bool)

(assert (=> b!474152 m!456023))

(declare-fun m!456025 () Bool)

(assert (=> b!474152 m!456025))

(assert (=> b!474152 m!456017))

(declare-fun m!456027 () Bool)

(assert (=> b!474152 m!456027))

(assert (=> b!474152 m!456023))

(assert (=> b!474152 m!456025))

(declare-fun m!456029 () Bool)

(assert (=> b!474152 m!456029))

(assert (=> b!474145 m!456017))

(assert (=> b!474145 m!456017))

(declare-fun m!456031 () Bool)

(assert (=> b!474145 m!456031))

(declare-fun m!456033 () Bool)

(assert (=> bm!30505 m!456033))

(declare-fun m!456035 () Bool)

(assert (=> b!474146 m!456035))

(assert (=> b!474150 m!456017))

(assert (=> b!474150 m!456017))

(assert (=> b!474150 m!456019))

(declare-fun m!456037 () Bool)

(assert (=> d!75349 m!456037))

(assert (=> d!75349 m!455943))

(assert (=> b!474153 m!456033))

(declare-fun m!456039 () Bool)

(assert (=> b!474151 m!456039))

(declare-fun m!456041 () Bool)

(assert (=> b!474151 m!456041))

(assert (=> b!474151 m!456039))

(assert (=> b!474151 m!456017))

(declare-fun m!456043 () Bool)

(assert (=> b!474151 m!456043))

(declare-fun m!456045 () Bool)

(assert (=> b!474151 m!456045))

(assert (=> b!474151 m!456023))

(assert (=> b!474151 m!456025))

(assert (=> b!474151 m!456023))

(assert (=> b!474151 m!456025))

(assert (=> b!474151 m!456029))

(assert (=> b!474067 d!75349))

(declare-fun call!30509 () ListLongMap!7847)

(declare-fun bm!30506 () Bool)

(assert (=> bm!30506 (= call!30509 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!474156 () Bool)

(declare-fun e!278291 () Bool)

(declare-fun e!278289 () Bool)

(assert (=> b!474156 (= e!278291 e!278289)))

(declare-fun c!57038 () Bool)

(declare-fun e!278293 () Bool)

(assert (=> b!474156 (= c!57038 e!278293)))

(declare-fun res!283242 () Bool)

(assert (=> b!474156 (=> (not res!283242) (not e!278293))))

(assert (=> b!474156 (= res!283242 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474157 () Bool)

(declare-fun e!278290 () Bool)

(declare-fun lt!215858 () ListLongMap!7847)

(assert (=> b!474157 (= e!278290 (isEmpty!584 lt!215858))))

(declare-fun b!474158 () Bool)

(assert (=> b!474158 (= e!278289 e!278290)))

(declare-fun c!57039 () Bool)

(assert (=> b!474158 (= c!57039 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474159 () Bool)

(declare-fun e!278294 () Bool)

(assert (=> b!474159 (= e!278289 e!278294)))

(assert (=> b!474159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun res!283241 () Bool)

(assert (=> b!474159 (= res!283241 (contains!2542 lt!215858 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474159 (=> (not res!283241) (not e!278294))))

(declare-fun b!474161 () Bool)

(declare-fun e!278288 () ListLongMap!7847)

(assert (=> b!474161 (= e!278288 call!30509)))

(declare-fun b!474162 () Bool)

(declare-fun e!278292 () ListLongMap!7847)

(assert (=> b!474162 (= e!278292 e!278288)))

(declare-fun c!57036 () Bool)

(assert (=> b!474162 (= c!57036 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474163 () Bool)

(assert (=> b!474163 (= e!278292 (ListLongMap!7848 Nil!9002))))

(declare-fun b!474164 () Bool)

(assert (=> b!474164 (= e!278293 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474164 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!474165 () Bool)

(declare-fun lt!215857 () Unit!13974)

(declare-fun lt!215855 () Unit!13974)

(assert (=> b!474165 (= lt!215857 lt!215855)))

(declare-fun lt!215854 () (_ BitVec 64))

(declare-fun lt!215859 () V!18963)

(declare-fun lt!215860 () ListLongMap!7847)

(declare-fun lt!215856 () (_ BitVec 64))

(assert (=> b!474165 (not (contains!2542 (+!1785 lt!215860 (tuple2!8945 lt!215856 lt!215859)) lt!215854))))

(assert (=> b!474165 (= lt!215855 (addStillNotContains!167 lt!215860 lt!215856 lt!215859 lt!215854))))

(assert (=> b!474165 (= lt!215854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!474165 (= lt!215859 (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!474165 (= lt!215856 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474165 (= lt!215860 call!30509)))

(assert (=> b!474165 (= e!278288 (+!1785 call!30509 (tuple2!8945 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000) (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!474166 () Bool)

(assert (=> b!474166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> b!474166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15033 _values!833)))))

(assert (=> b!474166 (= e!278294 (= (apply!333 lt!215858 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)) (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!474167 () Bool)

(assert (=> b!474167 (= e!278290 (= lt!215858 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!474160 () Bool)

(declare-fun res!283239 () Bool)

(assert (=> b!474160 (=> (not res!283239) (not e!278291))))

(assert (=> b!474160 (= res!283239 (not (contains!2542 lt!215858 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75351 () Bool)

(assert (=> d!75351 e!278291))

(declare-fun res!283240 () Bool)

(assert (=> d!75351 (=> (not res!283240) (not e!278291))))

(assert (=> d!75351 (= res!283240 (not (contains!2542 lt!215858 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75351 (= lt!215858 e!278292)))

(declare-fun c!57037 () Bool)

(assert (=> d!75351 (= c!57037 (bvsge #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> d!75351 (validMask!0 mask!1365)))

(assert (=> d!75351 (= (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215858)))

(assert (= (and d!75351 c!57037) b!474163))

(assert (= (and d!75351 (not c!57037)) b!474162))

(assert (= (and b!474162 c!57036) b!474165))

(assert (= (and b!474162 (not c!57036)) b!474161))

(assert (= (or b!474165 b!474161) bm!30506))

(assert (= (and d!75351 res!283240) b!474160))

(assert (= (and b!474160 res!283239) b!474156))

(assert (= (and b!474156 res!283242) b!474164))

(assert (= (and b!474156 c!57038) b!474159))

(assert (= (and b!474156 (not c!57038)) b!474158))

(assert (= (and b!474159 res!283241) b!474166))

(assert (= (and b!474158 c!57039) b!474167))

(assert (= (and b!474158 (not c!57039)) b!474157))

(declare-fun b_lambda!10215 () Bool)

(assert (=> (not b_lambda!10215) (not b!474165)))

(assert (=> b!474165 t!14975))

(declare-fun b_and!20417 () Bool)

(assert (= b_and!20415 (and (=> t!14975 result!7443) b_and!20417)))

(declare-fun b_lambda!10217 () Bool)

(assert (=> (not b_lambda!10217) (not b!474166)))

(assert (=> b!474166 t!14975))

(declare-fun b_and!20419 () Bool)

(assert (= b_and!20417 (and (=> t!14975 result!7443) b_and!20419)))

(assert (=> b!474162 m!456017))

(assert (=> b!474162 m!456017))

(assert (=> b!474162 m!456019))

(declare-fun m!456047 () Bool)

(assert (=> b!474157 m!456047))

(assert (=> b!474166 m!456017))

(assert (=> b!474166 m!456023))

(assert (=> b!474166 m!456025))

(assert (=> b!474166 m!456017))

(declare-fun m!456049 () Bool)

(assert (=> b!474166 m!456049))

(assert (=> b!474166 m!456023))

(assert (=> b!474166 m!456025))

(assert (=> b!474166 m!456029))

(assert (=> b!474159 m!456017))

(assert (=> b!474159 m!456017))

(declare-fun m!456051 () Bool)

(assert (=> b!474159 m!456051))

(declare-fun m!456053 () Bool)

(assert (=> bm!30506 m!456053))

(declare-fun m!456055 () Bool)

(assert (=> b!474160 m!456055))

(assert (=> b!474164 m!456017))

(assert (=> b!474164 m!456017))

(assert (=> b!474164 m!456019))

(declare-fun m!456057 () Bool)

(assert (=> d!75351 m!456057))

(assert (=> d!75351 m!455943))

(assert (=> b!474167 m!456053))

(declare-fun m!456059 () Bool)

(assert (=> b!474165 m!456059))

(declare-fun m!456061 () Bool)

(assert (=> b!474165 m!456061))

(assert (=> b!474165 m!456059))

(assert (=> b!474165 m!456017))

(declare-fun m!456063 () Bool)

(assert (=> b!474165 m!456063))

(declare-fun m!456065 () Bool)

(assert (=> b!474165 m!456065))

(assert (=> b!474165 m!456023))

(assert (=> b!474165 m!456025))

(assert (=> b!474165 m!456023))

(assert (=> b!474165 m!456025))

(assert (=> b!474165 m!456029))

(assert (=> b!474067 d!75351))

(declare-fun d!75353 () Bool)

(assert (=> d!75353 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42496 d!75353))

(declare-fun d!75355 () Bool)

(assert (=> d!75355 (= (array_inv!10674 _keys!1025) (bvsge (size!15032 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42496 d!75355))

(declare-fun d!75357 () Bool)

(assert (=> d!75357 (= (array_inv!10675 _values!833) (bvsge (size!15033 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42496 d!75357))

(declare-fun b!474178 () Bool)

(declare-fun e!278304 () Bool)

(declare-fun call!30512 () Bool)

(assert (=> b!474178 (= e!278304 call!30512)))

(declare-fun b!474179 () Bool)

(declare-fun e!278305 () Bool)

(assert (=> b!474179 (= e!278305 e!278304)))

(declare-fun c!57042 () Bool)

(assert (=> b!474179 (= c!57042 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474180 () Bool)

(assert (=> b!474180 (= e!278304 call!30512)))

(declare-fun bm!30509 () Bool)

(assert (=> bm!30509 (= call!30512 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57042 (Cons!9002 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000) Nil!9003) Nil!9003)))))

(declare-fun b!474181 () Bool)

(declare-fun e!278306 () Bool)

(declare-fun contains!2543 (List!9006 (_ BitVec 64)) Bool)

(assert (=> b!474181 (= e!278306 (contains!2543 Nil!9003 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474182 () Bool)

(declare-fun e!278303 () Bool)

(assert (=> b!474182 (= e!278303 e!278305)))

(declare-fun res!283250 () Bool)

(assert (=> b!474182 (=> (not res!283250) (not e!278305))))

(assert (=> b!474182 (= res!283250 (not e!278306))))

(declare-fun res!283249 () Bool)

(assert (=> b!474182 (=> (not res!283249) (not e!278306))))

(assert (=> b!474182 (= res!283249 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75359 () Bool)

(declare-fun res!283251 () Bool)

(assert (=> d!75359 (=> res!283251 e!278303)))

(assert (=> d!75359 (= res!283251 (bvsge #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> d!75359 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9003) e!278303)))

(assert (= (and d!75359 (not res!283251)) b!474182))

(assert (= (and b!474182 res!283249) b!474181))

(assert (= (and b!474182 res!283250) b!474179))

(assert (= (and b!474179 c!57042) b!474180))

(assert (= (and b!474179 (not c!57042)) b!474178))

(assert (= (or b!474180 b!474178) bm!30509))

(assert (=> b!474179 m!456017))

(assert (=> b!474179 m!456017))

(assert (=> b!474179 m!456019))

(assert (=> bm!30509 m!456017))

(declare-fun m!456067 () Bool)

(assert (=> bm!30509 m!456067))

(assert (=> b!474181 m!456017))

(assert (=> b!474181 m!456017))

(declare-fun m!456069 () Bool)

(assert (=> b!474181 m!456069))

(assert (=> b!474182 m!456017))

(assert (=> b!474182 m!456017))

(assert (=> b!474182 m!456019))

(assert (=> b!474065 d!75359))

(declare-fun b!474191 () Bool)

(declare-fun e!278314 () Bool)

(declare-fun call!30515 () Bool)

(assert (=> b!474191 (= e!278314 call!30515)))

(declare-fun b!474192 () Bool)

(declare-fun e!278315 () Bool)

(assert (=> b!474192 (= e!278314 e!278315)))

(declare-fun lt!215868 () (_ BitVec 64))

(assert (=> b!474192 (= lt!215868 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215869 () Unit!13974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30521 (_ BitVec 64) (_ BitVec 32)) Unit!13974)

(assert (=> b!474192 (= lt!215869 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!215868 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!474192 (arrayContainsKey!0 _keys!1025 lt!215868 #b00000000000000000000000000000000)))

(declare-fun lt!215867 () Unit!13974)

(assert (=> b!474192 (= lt!215867 lt!215869)))

(declare-fun res!283257 () Bool)

(declare-datatypes ((SeekEntryResult!3552 0))(
  ( (MissingZero!3552 (index!16387 (_ BitVec 32))) (Found!3552 (index!16388 (_ BitVec 32))) (Intermediate!3552 (undefined!4364 Bool) (index!16389 (_ BitVec 32)) (x!44498 (_ BitVec 32))) (Undefined!3552) (MissingVacant!3552 (index!16390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30521 (_ BitVec 32)) SeekEntryResult!3552)

(assert (=> b!474192 (= res!283257 (= (seekEntryOrOpen!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3552 #b00000000000000000000000000000000)))))

(assert (=> b!474192 (=> (not res!283257) (not e!278315))))

(declare-fun bm!30512 () Bool)

(assert (=> bm!30512 (= call!30515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!474193 () Bool)

(declare-fun e!278313 () Bool)

(assert (=> b!474193 (= e!278313 e!278314)))

(declare-fun c!57045 () Bool)

(assert (=> b!474193 (= c!57045 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474194 () Bool)

(assert (=> b!474194 (= e!278315 call!30515)))

(declare-fun d!75361 () Bool)

(declare-fun res!283256 () Bool)

(assert (=> d!75361 (=> res!283256 e!278313)))

(assert (=> d!75361 (= res!283256 (bvsge #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> d!75361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!278313)))

(assert (= (and d!75361 (not res!283256)) b!474193))

(assert (= (and b!474193 c!57045) b!474192))

(assert (= (and b!474193 (not c!57045)) b!474191))

(assert (= (and b!474192 res!283257) b!474194))

(assert (= (or b!474194 b!474191) bm!30512))

(assert (=> b!474192 m!456017))

(declare-fun m!456071 () Bool)

(assert (=> b!474192 m!456071))

(declare-fun m!456073 () Bool)

(assert (=> b!474192 m!456073))

(assert (=> b!474192 m!456017))

(declare-fun m!456075 () Bool)

(assert (=> b!474192 m!456075))

(declare-fun m!456077 () Bool)

(assert (=> bm!30512 m!456077))

(assert (=> b!474193 m!456017))

(assert (=> b!474193 m!456017))

(assert (=> b!474193 m!456019))

(assert (=> b!474062 d!75361))

(declare-fun b!474237 () Bool)

(declare-fun e!278351 () Bool)

(declare-fun e!278354 () Bool)

(assert (=> b!474237 (= e!278351 e!278354)))

(declare-fun c!57063 () Bool)

(assert (=> b!474237 (= c!57063 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474238 () Bool)

(declare-fun e!278348 () ListLongMap!7847)

(declare-fun e!278350 () ListLongMap!7847)

(assert (=> b!474238 (= e!278348 e!278350)))

(declare-fun c!57061 () Bool)

(assert (=> b!474238 (= c!57061 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474239 () Bool)

(declare-fun e!278349 () Bool)

(declare-fun e!278344 () Bool)

(assert (=> b!474239 (= e!278349 e!278344)))

(declare-fun res!283282 () Bool)

(declare-fun call!30531 () Bool)

(assert (=> b!474239 (= res!283282 call!30531)))

(assert (=> b!474239 (=> (not res!283282) (not e!278344))))

(declare-fun bm!30527 () Bool)

(declare-fun call!30533 () Bool)

(declare-fun lt!215916 () ListLongMap!7847)

(assert (=> bm!30527 (= call!30533 (contains!2542 lt!215916 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!75363 () Bool)

(assert (=> d!75363 e!278351))

(declare-fun res!283278 () Bool)

(assert (=> d!75363 (=> (not res!283278) (not e!278351))))

(assert (=> d!75363 (= res!283278 (or (bvsge #b00000000000000000000000000000000 (size!15032 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))))

(declare-fun lt!215931 () ListLongMap!7847)

(assert (=> d!75363 (= lt!215916 lt!215931)))

(declare-fun lt!215929 () Unit!13974)

(declare-fun e!278345 () Unit!13974)

(assert (=> d!75363 (= lt!215929 e!278345)))

(declare-fun c!57058 () Bool)

(declare-fun e!278347 () Bool)

(assert (=> d!75363 (= c!57058 e!278347)))

(declare-fun res!283280 () Bool)

(assert (=> d!75363 (=> (not res!283280) (not e!278347))))

(assert (=> d!75363 (= res!283280 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> d!75363 (= lt!215931 e!278348)))

(declare-fun c!57059 () Bool)

(assert (=> d!75363 (= c!57059 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75363 (validMask!0 mask!1365)))

(assert (=> d!75363 (= (getCurrentListMap!2237 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215916)))

(declare-fun b!474240 () Bool)

(declare-fun lt!215914 () Unit!13974)

(assert (=> b!474240 (= e!278345 lt!215914)))

(declare-fun lt!215934 () ListLongMap!7847)

(assert (=> b!474240 (= lt!215934 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215918 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215918 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215924 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215924 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215919 () Unit!13974)

(declare-fun addStillContains!292 (ListLongMap!7847 (_ BitVec 64) V!18963 (_ BitVec 64)) Unit!13974)

(assert (=> b!474240 (= lt!215919 (addStillContains!292 lt!215934 lt!215918 zeroValue!794 lt!215924))))

(assert (=> b!474240 (contains!2542 (+!1785 lt!215934 (tuple2!8945 lt!215918 zeroValue!794)) lt!215924)))

(declare-fun lt!215930 () Unit!13974)

(assert (=> b!474240 (= lt!215930 lt!215919)))

(declare-fun lt!215928 () ListLongMap!7847)

(assert (=> b!474240 (= lt!215928 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215920 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215920 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215932 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215932 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215933 () Unit!13974)

(declare-fun addApplyDifferent!292 (ListLongMap!7847 (_ BitVec 64) V!18963 (_ BitVec 64)) Unit!13974)

(assert (=> b!474240 (= lt!215933 (addApplyDifferent!292 lt!215928 lt!215920 minValueAfter!38 lt!215932))))

(assert (=> b!474240 (= (apply!333 (+!1785 lt!215928 (tuple2!8945 lt!215920 minValueAfter!38)) lt!215932) (apply!333 lt!215928 lt!215932))))

(declare-fun lt!215921 () Unit!13974)

(assert (=> b!474240 (= lt!215921 lt!215933)))

(declare-fun lt!215935 () ListLongMap!7847)

(assert (=> b!474240 (= lt!215935 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215927 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215927 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215922 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215922 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215923 () Unit!13974)

(assert (=> b!474240 (= lt!215923 (addApplyDifferent!292 lt!215935 lt!215927 zeroValue!794 lt!215922))))

(assert (=> b!474240 (= (apply!333 (+!1785 lt!215935 (tuple2!8945 lt!215927 zeroValue!794)) lt!215922) (apply!333 lt!215935 lt!215922))))

(declare-fun lt!215917 () Unit!13974)

(assert (=> b!474240 (= lt!215917 lt!215923)))

(declare-fun lt!215925 () ListLongMap!7847)

(assert (=> b!474240 (= lt!215925 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215926 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215926 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215915 () (_ BitVec 64))

(assert (=> b!474240 (= lt!215915 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474240 (= lt!215914 (addApplyDifferent!292 lt!215925 lt!215926 minValueAfter!38 lt!215915))))

(assert (=> b!474240 (= (apply!333 (+!1785 lt!215925 (tuple2!8945 lt!215926 minValueAfter!38)) lt!215915) (apply!333 lt!215925 lt!215915))))

(declare-fun b!474241 () Bool)

(declare-fun res!283279 () Bool)

(assert (=> b!474241 (=> (not res!283279) (not e!278351))))

(assert (=> b!474241 (= res!283279 e!278349)))

(declare-fun c!57060 () Bool)

(assert (=> b!474241 (= c!57060 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30528 () Bool)

(declare-fun call!30534 () ListLongMap!7847)

(declare-fun call!30535 () ListLongMap!7847)

(assert (=> bm!30528 (= call!30534 call!30535)))

(declare-fun b!474242 () Bool)

(declare-fun e!278346 () Bool)

(declare-fun e!278343 () Bool)

(assert (=> b!474242 (= e!278346 e!278343)))

(declare-fun res!283276 () Bool)

(assert (=> b!474242 (=> (not res!283276) (not e!278343))))

(assert (=> b!474242 (= res!283276 (contains!2542 lt!215916 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474243 () Bool)

(assert (=> b!474243 (= e!278347 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30529 () Bool)

(declare-fun call!30532 () ListLongMap!7847)

(assert (=> bm!30529 (= call!30532 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474244 () Bool)

(assert (=> b!474244 (= e!278348 (+!1785 call!30535 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun bm!30530 () Bool)

(declare-fun call!30530 () ListLongMap!7847)

(declare-fun call!30536 () ListLongMap!7847)

(assert (=> bm!30530 (= call!30535 (+!1785 (ite c!57059 call!30532 (ite c!57061 call!30530 call!30536)) (ite (or c!57059 c!57061) (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!474245 () Bool)

(declare-fun Unit!13980 () Unit!13974)

(assert (=> b!474245 (= e!278345 Unit!13980)))

(declare-fun b!474246 () Bool)

(declare-fun e!278342 () Bool)

(assert (=> b!474246 (= e!278354 e!278342)))

(declare-fun res!283283 () Bool)

(assert (=> b!474246 (= res!283283 call!30533)))

(assert (=> b!474246 (=> (not res!283283) (not e!278342))))

(declare-fun bm!30531 () Bool)

(assert (=> bm!30531 (= call!30531 (contains!2542 lt!215916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474247 () Bool)

(assert (=> b!474247 (= e!278349 (not call!30531))))

(declare-fun bm!30532 () Bool)

(assert (=> bm!30532 (= call!30530 call!30532)))

(declare-fun b!474248 () Bool)

(assert (=> b!474248 (= e!278343 (= (apply!333 lt!215916 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)) (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!474248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15033 _values!833)))))

(assert (=> b!474248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474249 () Bool)

(declare-fun e!278353 () ListLongMap!7847)

(assert (=> b!474249 (= e!278353 call!30534)))

(declare-fun b!474250 () Bool)

(assert (=> b!474250 (= e!278342 (= (apply!333 lt!215916 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun bm!30533 () Bool)

(assert (=> bm!30533 (= call!30536 call!30530)))

(declare-fun b!474251 () Bool)

(declare-fun c!57062 () Bool)

(assert (=> b!474251 (= c!57062 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!474251 (= e!278350 e!278353)))

(declare-fun b!474252 () Bool)

(declare-fun res!283284 () Bool)

(assert (=> b!474252 (=> (not res!283284) (not e!278351))))

(assert (=> b!474252 (= res!283284 e!278346)))

(declare-fun res!283277 () Bool)

(assert (=> b!474252 (=> res!283277 e!278346)))

(declare-fun e!278352 () Bool)

(assert (=> b!474252 (= res!283277 (not e!278352))))

(declare-fun res!283281 () Bool)

(assert (=> b!474252 (=> (not res!283281) (not e!278352))))

(assert (=> b!474252 (= res!283281 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474253 () Bool)

(assert (=> b!474253 (= e!278350 call!30534)))

(declare-fun b!474254 () Bool)

(assert (=> b!474254 (= e!278353 call!30536)))

(declare-fun b!474255 () Bool)

(assert (=> b!474255 (= e!278344 (= (apply!333 lt!215916 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!474256 () Bool)

(assert (=> b!474256 (= e!278352 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474257 () Bool)

(assert (=> b!474257 (= e!278354 (not call!30533))))

(assert (= (and d!75363 c!57059) b!474244))

(assert (= (and d!75363 (not c!57059)) b!474238))

(assert (= (and b!474238 c!57061) b!474253))

(assert (= (and b!474238 (not c!57061)) b!474251))

(assert (= (and b!474251 c!57062) b!474249))

(assert (= (and b!474251 (not c!57062)) b!474254))

(assert (= (or b!474249 b!474254) bm!30533))

(assert (= (or b!474253 bm!30533) bm!30532))

(assert (= (or b!474253 b!474249) bm!30528))

(assert (= (or b!474244 bm!30532) bm!30529))

(assert (= (or b!474244 bm!30528) bm!30530))

(assert (= (and d!75363 res!283280) b!474243))

(assert (= (and d!75363 c!57058) b!474240))

(assert (= (and d!75363 (not c!57058)) b!474245))

(assert (= (and d!75363 res!283278) b!474252))

(assert (= (and b!474252 res!283281) b!474256))

(assert (= (and b!474252 (not res!283277)) b!474242))

(assert (= (and b!474242 res!283276) b!474248))

(assert (= (and b!474252 res!283284) b!474241))

(assert (= (and b!474241 c!57060) b!474239))

(assert (= (and b!474241 (not c!57060)) b!474247))

(assert (= (and b!474239 res!283282) b!474255))

(assert (= (or b!474239 b!474247) bm!30531))

(assert (= (and b!474241 res!283279) b!474237))

(assert (= (and b!474237 c!57063) b!474246))

(assert (= (and b!474237 (not c!57063)) b!474257))

(assert (= (and b!474246 res!283283) b!474250))

(assert (= (or b!474246 b!474257) bm!30527))

(declare-fun b_lambda!10219 () Bool)

(assert (=> (not b_lambda!10219) (not b!474248)))

(assert (=> b!474248 t!14975))

(declare-fun b_and!20421 () Bool)

(assert (= b_and!20419 (and (=> t!14975 result!7443) b_and!20421)))

(declare-fun m!456079 () Bool)

(assert (=> b!474250 m!456079))

(declare-fun m!456081 () Bool)

(assert (=> b!474244 m!456081))

(declare-fun m!456083 () Bool)

(assert (=> bm!30530 m!456083))

(declare-fun m!456085 () Bool)

(assert (=> bm!30527 m!456085))

(assert (=> d!75363 m!455943))

(assert (=> b!474242 m!456017))

(assert (=> b!474242 m!456017))

(declare-fun m!456087 () Bool)

(assert (=> b!474242 m!456087))

(assert (=> b!474248 m!456023))

(assert (=> b!474248 m!456025))

(assert (=> b!474248 m!456023))

(assert (=> b!474248 m!456025))

(assert (=> b!474248 m!456029))

(assert (=> b!474248 m!456017))

(declare-fun m!456089 () Bool)

(assert (=> b!474248 m!456089))

(assert (=> b!474248 m!456017))

(assert (=> b!474256 m!456017))

(assert (=> b!474256 m!456017))

(assert (=> b!474256 m!456019))

(declare-fun m!456091 () Bool)

(assert (=> bm!30531 m!456091))

(assert (=> b!474243 m!456017))

(assert (=> b!474243 m!456017))

(assert (=> b!474243 m!456019))

(assert (=> bm!30529 m!455923))

(declare-fun m!456093 () Bool)

(assert (=> b!474240 m!456093))

(declare-fun m!456095 () Bool)

(assert (=> b!474240 m!456095))

(declare-fun m!456097 () Bool)

(assert (=> b!474240 m!456097))

(declare-fun m!456099 () Bool)

(assert (=> b!474240 m!456099))

(declare-fun m!456101 () Bool)

(assert (=> b!474240 m!456101))

(assert (=> b!474240 m!456101))

(declare-fun m!456103 () Bool)

(assert (=> b!474240 m!456103))

(assert (=> b!474240 m!455923))

(declare-fun m!456105 () Bool)

(assert (=> b!474240 m!456105))

(assert (=> b!474240 m!456105))

(declare-fun m!456107 () Bool)

(assert (=> b!474240 m!456107))

(declare-fun m!456109 () Bool)

(assert (=> b!474240 m!456109))

(assert (=> b!474240 m!456017))

(declare-fun m!456111 () Bool)

(assert (=> b!474240 m!456111))

(assert (=> b!474240 m!456111))

(declare-fun m!456113 () Bool)

(assert (=> b!474240 m!456113))

(declare-fun m!456115 () Bool)

(assert (=> b!474240 m!456115))

(assert (=> b!474240 m!456097))

(declare-fun m!456117 () Bool)

(assert (=> b!474240 m!456117))

(declare-fun m!456119 () Bool)

(assert (=> b!474240 m!456119))

(declare-fun m!456121 () Bool)

(assert (=> b!474240 m!456121))

(declare-fun m!456123 () Bool)

(assert (=> b!474255 m!456123))

(assert (=> b!474063 d!75363))

(declare-fun d!75365 () Bool)

(declare-fun e!278357 () Bool)

(assert (=> d!75365 e!278357))

(declare-fun res!283290 () Bool)

(assert (=> d!75365 (=> (not res!283290) (not e!278357))))

(declare-fun lt!215945 () ListLongMap!7847)

(assert (=> d!75365 (= res!283290 (contains!2542 lt!215945 (_1!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!215947 () List!9005)

(assert (=> d!75365 (= lt!215945 (ListLongMap!7848 lt!215947))))

(declare-fun lt!215944 () Unit!13974)

(declare-fun lt!215946 () Unit!13974)

(assert (=> d!75365 (= lt!215944 lt!215946)))

(declare-datatypes ((Option!385 0))(
  ( (Some!384 (v!9030 V!18963)) (None!383) )
))
(declare-fun getValueByKey!379 (List!9005 (_ BitVec 64)) Option!385)

(assert (=> d!75365 (= (getValueByKey!379 lt!215947 (_1!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!384 (_2!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!204 (List!9005 (_ BitVec 64) V!18963) Unit!13974)

(assert (=> d!75365 (= lt!215946 (lemmaContainsTupThenGetReturnValue!204 lt!215947 (_1!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!207 (List!9005 (_ BitVec 64) V!18963) List!9005)

(assert (=> d!75365 (= lt!215947 (insertStrictlySorted!207 (toList!3939 lt!215781) (_1!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75365 (= (+!1785 lt!215781 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215945)))

(declare-fun b!474262 () Bool)

(declare-fun res!283289 () Bool)

(assert (=> b!474262 (=> (not res!283289) (not e!278357))))

(assert (=> b!474262 (= res!283289 (= (getValueByKey!379 (toList!3939 lt!215945) (_1!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!384 (_2!4483 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!474263 () Bool)

(declare-fun contains!2544 (List!9005 tuple2!8944) Bool)

(assert (=> b!474263 (= e!278357 (contains!2544 (toList!3939 lt!215945) (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75365 res!283290) b!474262))

(assert (= (and b!474262 res!283289) b!474263))

(declare-fun m!456125 () Bool)

(assert (=> d!75365 m!456125))

(declare-fun m!456127 () Bool)

(assert (=> d!75365 m!456127))

(declare-fun m!456129 () Bool)

(assert (=> d!75365 m!456129))

(declare-fun m!456131 () Bool)

(assert (=> d!75365 m!456131))

(declare-fun m!456133 () Bool)

(assert (=> b!474262 m!456133))

(declare-fun m!456135 () Bool)

(assert (=> b!474263 m!456135))

(assert (=> b!474063 d!75365))

(declare-fun d!75367 () Bool)

(declare-fun e!278358 () Bool)

(assert (=> d!75367 e!278358))

(declare-fun res!283292 () Bool)

(assert (=> d!75367 (=> (not res!283292) (not e!278358))))

(declare-fun lt!215949 () ListLongMap!7847)

(assert (=> d!75367 (= res!283292 (contains!2542 lt!215949 (_1!4483 lt!215777)))))

(declare-fun lt!215951 () List!9005)

(assert (=> d!75367 (= lt!215949 (ListLongMap!7848 lt!215951))))

(declare-fun lt!215948 () Unit!13974)

(declare-fun lt!215950 () Unit!13974)

(assert (=> d!75367 (= lt!215948 lt!215950)))

(assert (=> d!75367 (= (getValueByKey!379 lt!215951 (_1!4483 lt!215777)) (Some!384 (_2!4483 lt!215777)))))

(assert (=> d!75367 (= lt!215950 (lemmaContainsTupThenGetReturnValue!204 lt!215951 (_1!4483 lt!215777) (_2!4483 lt!215777)))))

(assert (=> d!75367 (= lt!215951 (insertStrictlySorted!207 (toList!3939 lt!215781) (_1!4483 lt!215777) (_2!4483 lt!215777)))))

(assert (=> d!75367 (= (+!1785 lt!215781 lt!215777) lt!215949)))

(declare-fun b!474264 () Bool)

(declare-fun res!283291 () Bool)

(assert (=> b!474264 (=> (not res!283291) (not e!278358))))

(assert (=> b!474264 (= res!283291 (= (getValueByKey!379 (toList!3939 lt!215949) (_1!4483 lt!215777)) (Some!384 (_2!4483 lt!215777))))))

(declare-fun b!474265 () Bool)

(assert (=> b!474265 (= e!278358 (contains!2544 (toList!3939 lt!215949) lt!215777))))

(assert (= (and d!75367 res!283292) b!474264))

(assert (= (and b!474264 res!283291) b!474265))

(declare-fun m!456137 () Bool)

(assert (=> d!75367 m!456137))

(declare-fun m!456139 () Bool)

(assert (=> d!75367 m!456139))

(declare-fun m!456141 () Bool)

(assert (=> d!75367 m!456141))

(declare-fun m!456143 () Bool)

(assert (=> d!75367 m!456143))

(declare-fun m!456145 () Bool)

(assert (=> b!474264 m!456145))

(declare-fun m!456147 () Bool)

(assert (=> b!474265 m!456147))

(assert (=> b!474063 d!75367))

(declare-fun d!75369 () Bool)

(declare-fun e!278359 () Bool)

(assert (=> d!75369 e!278359))

(declare-fun res!283294 () Bool)

(assert (=> d!75369 (=> (not res!283294) (not e!278359))))

(declare-fun lt!215953 () ListLongMap!7847)

(assert (=> d!75369 (= res!283294 (contains!2542 lt!215953 (_1!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!215955 () List!9005)

(assert (=> d!75369 (= lt!215953 (ListLongMap!7848 lt!215955))))

(declare-fun lt!215952 () Unit!13974)

(declare-fun lt!215954 () Unit!13974)

(assert (=> d!75369 (= lt!215952 lt!215954)))

(assert (=> d!75369 (= (getValueByKey!379 lt!215955 (_1!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!384 (_2!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75369 (= lt!215954 (lemmaContainsTupThenGetReturnValue!204 lt!215955 (_1!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75369 (= lt!215955 (insertStrictlySorted!207 (toList!3939 lt!215778) (_1!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75369 (= (+!1785 lt!215778 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!215953)))

(declare-fun b!474266 () Bool)

(declare-fun res!283293 () Bool)

(assert (=> b!474266 (=> (not res!283293) (not e!278359))))

(assert (=> b!474266 (= res!283293 (= (getValueByKey!379 (toList!3939 lt!215953) (_1!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!384 (_2!4483 (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!474267 () Bool)

(assert (=> b!474267 (= e!278359 (contains!2544 (toList!3939 lt!215953) (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75369 res!283294) b!474266))

(assert (= (and b!474266 res!283293) b!474267))

(declare-fun m!456149 () Bool)

(assert (=> d!75369 m!456149))

(declare-fun m!456151 () Bool)

(assert (=> d!75369 m!456151))

(declare-fun m!456153 () Bool)

(assert (=> d!75369 m!456153))

(declare-fun m!456155 () Bool)

(assert (=> d!75369 m!456155))

(declare-fun m!456157 () Bool)

(assert (=> b!474266 m!456157))

(declare-fun m!456159 () Bool)

(assert (=> b!474267 m!456159))

(assert (=> b!474063 d!75369))

(declare-fun d!75371 () Bool)

(assert (=> d!75371 (= (+!1785 lt!215781 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1785 (+!1785 lt!215781 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!215958 () Unit!13974)

(declare-fun choose!1361 (ListLongMap!7847 (_ BitVec 64) V!18963 V!18963) Unit!13974)

(assert (=> d!75371 (= lt!215958 (choose!1361 lt!215781 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75371 (= (addSameAsAddTwiceSameKeyDiffValues!164 lt!215781 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!215958)))

(declare-fun bs!15032 () Bool)

(assert (= bs!15032 d!75371))

(declare-fun m!456161 () Bool)

(assert (=> bs!15032 m!456161))

(assert (=> bs!15032 m!455931))

(assert (=> bs!15032 m!455931))

(declare-fun m!456163 () Bool)

(assert (=> bs!15032 m!456163))

(declare-fun m!456165 () Bool)

(assert (=> bs!15032 m!456165))

(assert (=> b!474063 d!75371))

(declare-fun b!474268 () Bool)

(declare-fun e!278369 () Bool)

(declare-fun e!278372 () Bool)

(assert (=> b!474268 (= e!278369 e!278372)))

(declare-fun c!57069 () Bool)

(assert (=> b!474268 (= c!57069 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474269 () Bool)

(declare-fun e!278366 () ListLongMap!7847)

(declare-fun e!278368 () ListLongMap!7847)

(assert (=> b!474269 (= e!278366 e!278368)))

(declare-fun c!57067 () Bool)

(assert (=> b!474269 (= c!57067 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!474270 () Bool)

(declare-fun e!278367 () Bool)

(declare-fun e!278362 () Bool)

(assert (=> b!474270 (= e!278367 e!278362)))

(declare-fun res!283301 () Bool)

(declare-fun call!30538 () Bool)

(assert (=> b!474270 (= res!283301 call!30538)))

(assert (=> b!474270 (=> (not res!283301) (not e!278362))))

(declare-fun bm!30534 () Bool)

(declare-fun call!30540 () Bool)

(declare-fun lt!215961 () ListLongMap!7847)

(assert (=> bm!30534 (= call!30540 (contains!2542 lt!215961 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!75373 () Bool)

(assert (=> d!75373 e!278369))

(declare-fun res!283297 () Bool)

(assert (=> d!75373 (=> (not res!283297) (not e!278369))))

(assert (=> d!75373 (= res!283297 (or (bvsge #b00000000000000000000000000000000 (size!15032 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))))

(declare-fun lt!215976 () ListLongMap!7847)

(assert (=> d!75373 (= lt!215961 lt!215976)))

(declare-fun lt!215974 () Unit!13974)

(declare-fun e!278363 () Unit!13974)

(assert (=> d!75373 (= lt!215974 e!278363)))

(declare-fun c!57064 () Bool)

(declare-fun e!278365 () Bool)

(assert (=> d!75373 (= c!57064 e!278365)))

(declare-fun res!283299 () Bool)

(assert (=> d!75373 (=> (not res!283299) (not e!278365))))

(assert (=> d!75373 (= res!283299 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(assert (=> d!75373 (= lt!215976 e!278366)))

(declare-fun c!57065 () Bool)

(assert (=> d!75373 (= c!57065 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75373 (validMask!0 mask!1365)))

(assert (=> d!75373 (= (getCurrentListMap!2237 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215961)))

(declare-fun b!474271 () Bool)

(declare-fun lt!215959 () Unit!13974)

(assert (=> b!474271 (= e!278363 lt!215959)))

(declare-fun lt!215979 () ListLongMap!7847)

(assert (=> b!474271 (= lt!215979 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215963 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215969 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215969 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215964 () Unit!13974)

(assert (=> b!474271 (= lt!215964 (addStillContains!292 lt!215979 lt!215963 zeroValue!794 lt!215969))))

(assert (=> b!474271 (contains!2542 (+!1785 lt!215979 (tuple2!8945 lt!215963 zeroValue!794)) lt!215969)))

(declare-fun lt!215975 () Unit!13974)

(assert (=> b!474271 (= lt!215975 lt!215964)))

(declare-fun lt!215973 () ListLongMap!7847)

(assert (=> b!474271 (= lt!215973 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215965 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215965 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215977 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215977 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215978 () Unit!13974)

(assert (=> b!474271 (= lt!215978 (addApplyDifferent!292 lt!215973 lt!215965 minValueBefore!38 lt!215977))))

(assert (=> b!474271 (= (apply!333 (+!1785 lt!215973 (tuple2!8945 lt!215965 minValueBefore!38)) lt!215977) (apply!333 lt!215973 lt!215977))))

(declare-fun lt!215966 () Unit!13974)

(assert (=> b!474271 (= lt!215966 lt!215978)))

(declare-fun lt!215980 () ListLongMap!7847)

(assert (=> b!474271 (= lt!215980 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215972 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215967 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215967 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215968 () Unit!13974)

(assert (=> b!474271 (= lt!215968 (addApplyDifferent!292 lt!215980 lt!215972 zeroValue!794 lt!215967))))

(assert (=> b!474271 (= (apply!333 (+!1785 lt!215980 (tuple2!8945 lt!215972 zeroValue!794)) lt!215967) (apply!333 lt!215980 lt!215967))))

(declare-fun lt!215962 () Unit!13974)

(assert (=> b!474271 (= lt!215962 lt!215968)))

(declare-fun lt!215970 () ListLongMap!7847)

(assert (=> b!474271 (= lt!215970 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215971 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215960 () (_ BitVec 64))

(assert (=> b!474271 (= lt!215960 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!474271 (= lt!215959 (addApplyDifferent!292 lt!215970 lt!215971 minValueBefore!38 lt!215960))))

(assert (=> b!474271 (= (apply!333 (+!1785 lt!215970 (tuple2!8945 lt!215971 minValueBefore!38)) lt!215960) (apply!333 lt!215970 lt!215960))))

(declare-fun b!474272 () Bool)

(declare-fun res!283298 () Bool)

(assert (=> b!474272 (=> (not res!283298) (not e!278369))))

(assert (=> b!474272 (= res!283298 e!278367)))

(declare-fun c!57066 () Bool)

(assert (=> b!474272 (= c!57066 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30535 () Bool)

(declare-fun call!30541 () ListLongMap!7847)

(declare-fun call!30542 () ListLongMap!7847)

(assert (=> bm!30535 (= call!30541 call!30542)))

(declare-fun b!474273 () Bool)

(declare-fun e!278364 () Bool)

(declare-fun e!278361 () Bool)

(assert (=> b!474273 (= e!278364 e!278361)))

(declare-fun res!283295 () Bool)

(assert (=> b!474273 (=> (not res!283295) (not e!278361))))

(assert (=> b!474273 (= res!283295 (contains!2542 lt!215961 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!474273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474274 () Bool)

(assert (=> b!474274 (= e!278365 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30536 () Bool)

(declare-fun call!30539 () ListLongMap!7847)

(assert (=> bm!30536 (= call!30539 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474275 () Bool)

(assert (=> b!474275 (= e!278366 (+!1785 call!30542 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun call!30543 () ListLongMap!7847)

(declare-fun call!30537 () ListLongMap!7847)

(declare-fun bm!30537 () Bool)

(assert (=> bm!30537 (= call!30542 (+!1785 (ite c!57065 call!30539 (ite c!57067 call!30537 call!30543)) (ite (or c!57065 c!57067) (tuple2!8945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!474276 () Bool)

(declare-fun Unit!13981 () Unit!13974)

(assert (=> b!474276 (= e!278363 Unit!13981)))

(declare-fun b!474277 () Bool)

(declare-fun e!278360 () Bool)

(assert (=> b!474277 (= e!278372 e!278360)))

(declare-fun res!283302 () Bool)

(assert (=> b!474277 (= res!283302 call!30540)))

(assert (=> b!474277 (=> (not res!283302) (not e!278360))))

(declare-fun bm!30538 () Bool)

(assert (=> bm!30538 (= call!30538 (contains!2542 lt!215961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!474278 () Bool)

(assert (=> b!474278 (= e!278367 (not call!30538))))

(declare-fun bm!30539 () Bool)

(assert (=> bm!30539 (= call!30537 call!30539)))

(declare-fun b!474279 () Bool)

(assert (=> b!474279 (= e!278361 (= (apply!333 lt!215961 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)) (get!7140 (select (arr!14680 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!474279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15033 _values!833)))))

(assert (=> b!474279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474280 () Bool)

(declare-fun e!278371 () ListLongMap!7847)

(assert (=> b!474280 (= e!278371 call!30541)))

(declare-fun b!474281 () Bool)

(assert (=> b!474281 (= e!278360 (= (apply!333 lt!215961 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun bm!30540 () Bool)

(assert (=> bm!30540 (= call!30543 call!30537)))

(declare-fun b!474282 () Bool)

(declare-fun c!57068 () Bool)

(assert (=> b!474282 (= c!57068 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!474282 (= e!278368 e!278371)))

(declare-fun b!474283 () Bool)

(declare-fun res!283303 () Bool)

(assert (=> b!474283 (=> (not res!283303) (not e!278369))))

(assert (=> b!474283 (= res!283303 e!278364)))

(declare-fun res!283296 () Bool)

(assert (=> b!474283 (=> res!283296 e!278364)))

(declare-fun e!278370 () Bool)

(assert (=> b!474283 (= res!283296 (not e!278370))))

(declare-fun res!283300 () Bool)

(assert (=> b!474283 (=> (not res!283300) (not e!278370))))

(assert (=> b!474283 (= res!283300 (bvslt #b00000000000000000000000000000000 (size!15032 _keys!1025)))))

(declare-fun b!474284 () Bool)

(assert (=> b!474284 (= e!278368 call!30541)))

(declare-fun b!474285 () Bool)

(assert (=> b!474285 (= e!278371 call!30543)))

(declare-fun b!474286 () Bool)

(assert (=> b!474286 (= e!278362 (= (apply!333 lt!215961 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!474287 () Bool)

(assert (=> b!474287 (= e!278370 (validKeyInArray!0 (select (arr!14679 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!474288 () Bool)

(assert (=> b!474288 (= e!278372 (not call!30540))))

(assert (= (and d!75373 c!57065) b!474275))

(assert (= (and d!75373 (not c!57065)) b!474269))

(assert (= (and b!474269 c!57067) b!474284))

(assert (= (and b!474269 (not c!57067)) b!474282))

(assert (= (and b!474282 c!57068) b!474280))

(assert (= (and b!474282 (not c!57068)) b!474285))

(assert (= (or b!474280 b!474285) bm!30540))

(assert (= (or b!474284 bm!30540) bm!30539))

(assert (= (or b!474284 b!474280) bm!30535))

(assert (= (or b!474275 bm!30539) bm!30536))

(assert (= (or b!474275 bm!30535) bm!30537))

(assert (= (and d!75373 res!283299) b!474274))

(assert (= (and d!75373 c!57064) b!474271))

(assert (= (and d!75373 (not c!57064)) b!474276))

(assert (= (and d!75373 res!283297) b!474283))

(assert (= (and b!474283 res!283300) b!474287))

(assert (= (and b!474283 (not res!283296)) b!474273))

(assert (= (and b!474273 res!283295) b!474279))

(assert (= (and b!474283 res!283303) b!474272))

(assert (= (and b!474272 c!57066) b!474270))

(assert (= (and b!474272 (not c!57066)) b!474278))

(assert (= (and b!474270 res!283301) b!474286))

(assert (= (or b!474270 b!474278) bm!30538))

(assert (= (and b!474272 res!283298) b!474268))

(assert (= (and b!474268 c!57069) b!474277))

(assert (= (and b!474268 (not c!57069)) b!474288))

(assert (= (and b!474277 res!283302) b!474281))

(assert (= (or b!474277 b!474288) bm!30534))

(declare-fun b_lambda!10221 () Bool)

(assert (=> (not b_lambda!10221) (not b!474279)))

(assert (=> b!474279 t!14975))

(declare-fun b_and!20423 () Bool)

(assert (= b_and!20421 (and (=> t!14975 result!7443) b_and!20423)))

(declare-fun m!456167 () Bool)

(assert (=> b!474281 m!456167))

(declare-fun m!456169 () Bool)

(assert (=> b!474275 m!456169))

(declare-fun m!456171 () Bool)

(assert (=> bm!30537 m!456171))

(declare-fun m!456173 () Bool)

(assert (=> bm!30534 m!456173))

(assert (=> d!75373 m!455943))

(assert (=> b!474273 m!456017))

(assert (=> b!474273 m!456017))

(declare-fun m!456175 () Bool)

(assert (=> b!474273 m!456175))

(assert (=> b!474279 m!456023))

(assert (=> b!474279 m!456025))

(assert (=> b!474279 m!456023))

(assert (=> b!474279 m!456025))

(assert (=> b!474279 m!456029))

(assert (=> b!474279 m!456017))

(declare-fun m!456177 () Bool)

(assert (=> b!474279 m!456177))

(assert (=> b!474279 m!456017))

(assert (=> b!474287 m!456017))

(assert (=> b!474287 m!456017))

(assert (=> b!474287 m!456019))

(declare-fun m!456179 () Bool)

(assert (=> bm!30538 m!456179))

(assert (=> b!474274 m!456017))

(assert (=> b!474274 m!456017))

(assert (=> b!474274 m!456019))

(assert (=> bm!30536 m!455925))

(declare-fun m!456181 () Bool)

(assert (=> b!474271 m!456181))

(declare-fun m!456183 () Bool)

(assert (=> b!474271 m!456183))

(declare-fun m!456185 () Bool)

(assert (=> b!474271 m!456185))

(declare-fun m!456187 () Bool)

(assert (=> b!474271 m!456187))

(declare-fun m!456189 () Bool)

(assert (=> b!474271 m!456189))

(assert (=> b!474271 m!456189))

(declare-fun m!456191 () Bool)

(assert (=> b!474271 m!456191))

(assert (=> b!474271 m!455925))

(declare-fun m!456193 () Bool)

(assert (=> b!474271 m!456193))

(assert (=> b!474271 m!456193))

(declare-fun m!456195 () Bool)

(assert (=> b!474271 m!456195))

(declare-fun m!456197 () Bool)

(assert (=> b!474271 m!456197))

(assert (=> b!474271 m!456017))

(declare-fun m!456199 () Bool)

(assert (=> b!474271 m!456199))

(assert (=> b!474271 m!456199))

(declare-fun m!456201 () Bool)

(assert (=> b!474271 m!456201))

(declare-fun m!456203 () Bool)

(assert (=> b!474271 m!456203))

(assert (=> b!474271 m!456185))

(declare-fun m!456205 () Bool)

(assert (=> b!474271 m!456205))

(declare-fun m!456207 () Bool)

(assert (=> b!474271 m!456207))

(declare-fun m!456209 () Bool)

(assert (=> b!474271 m!456209))

(declare-fun m!456211 () Bool)

(assert (=> b!474286 m!456211))

(assert (=> b!474063 d!75373))

(declare-fun d!75375 () Bool)

(declare-fun e!278373 () Bool)

(assert (=> d!75375 e!278373))

(declare-fun res!283305 () Bool)

(assert (=> d!75375 (=> (not res!283305) (not e!278373))))

(declare-fun lt!215982 () ListLongMap!7847)

(assert (=> d!75375 (= res!283305 (contains!2542 lt!215982 (_1!4483 lt!215777)))))

(declare-fun lt!215984 () List!9005)

(assert (=> d!75375 (= lt!215982 (ListLongMap!7848 lt!215984))))

(declare-fun lt!215981 () Unit!13974)

(declare-fun lt!215983 () Unit!13974)

(assert (=> d!75375 (= lt!215981 lt!215983)))

(assert (=> d!75375 (= (getValueByKey!379 lt!215984 (_1!4483 lt!215777)) (Some!384 (_2!4483 lt!215777)))))

(assert (=> d!75375 (= lt!215983 (lemmaContainsTupThenGetReturnValue!204 lt!215984 (_1!4483 lt!215777) (_2!4483 lt!215777)))))

(assert (=> d!75375 (= lt!215984 (insertStrictlySorted!207 (toList!3939 (+!1785 lt!215781 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4483 lt!215777) (_2!4483 lt!215777)))))

(assert (=> d!75375 (= (+!1785 (+!1785 lt!215781 (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215777) lt!215982)))

(declare-fun b!474289 () Bool)

(declare-fun res!283304 () Bool)

(assert (=> b!474289 (=> (not res!283304) (not e!278373))))

(assert (=> b!474289 (= res!283304 (= (getValueByKey!379 (toList!3939 lt!215982) (_1!4483 lt!215777)) (Some!384 (_2!4483 lt!215777))))))

(declare-fun b!474290 () Bool)

(assert (=> b!474290 (= e!278373 (contains!2544 (toList!3939 lt!215982) lt!215777))))

(assert (= (and d!75375 res!283305) b!474289))

(assert (= (and b!474289 res!283304) b!474290))

(declare-fun m!456213 () Bool)

(assert (=> d!75375 m!456213))

(declare-fun m!456215 () Bool)

(assert (=> d!75375 m!456215))

(declare-fun m!456217 () Bool)

(assert (=> d!75375 m!456217))

(declare-fun m!456219 () Bool)

(assert (=> d!75375 m!456219))

(declare-fun m!456221 () Bool)

(assert (=> b!474289 m!456221))

(declare-fun m!456223 () Bool)

(assert (=> b!474290 m!456223))

(assert (=> b!474063 d!75375))

(declare-fun mapIsEmpty!21814 () Bool)

(declare-fun mapRes!21814 () Bool)

(assert (=> mapIsEmpty!21814 mapRes!21814))

(declare-fun mapNonEmpty!21814 () Bool)

(declare-fun tp!41947 () Bool)

(declare-fun e!278379 () Bool)

(assert (=> mapNonEmpty!21814 (= mapRes!21814 (and tp!41947 e!278379))))

(declare-fun mapKey!21814 () (_ BitVec 32))

(declare-fun mapValue!21814 () ValueCell!6353)

(declare-fun mapRest!21814 () (Array (_ BitVec 32) ValueCell!6353))

(assert (=> mapNonEmpty!21814 (= mapRest!21805 (store mapRest!21814 mapKey!21814 mapValue!21814))))

(declare-fun condMapEmpty!21814 () Bool)

(declare-fun mapDefault!21814 () ValueCell!6353)

(assert (=> mapNonEmpty!21805 (= condMapEmpty!21814 (= mapRest!21805 ((as const (Array (_ BitVec 32) ValueCell!6353)) mapDefault!21814)))))

(declare-fun e!278378 () Bool)

(assert (=> mapNonEmpty!21805 (= tp!41932 (and e!278378 mapRes!21814))))

(declare-fun b!474298 () Bool)

(assert (=> b!474298 (= e!278378 tp_is_empty!13393)))

(declare-fun b!474297 () Bool)

(assert (=> b!474297 (= e!278379 tp_is_empty!13393)))

(assert (= (and mapNonEmpty!21805 condMapEmpty!21814) mapIsEmpty!21814))

(assert (= (and mapNonEmpty!21805 (not condMapEmpty!21814)) mapNonEmpty!21814))

(assert (= (and mapNonEmpty!21814 ((_ is ValueCellFull!6353) mapValue!21814)) b!474297))

(assert (= (and mapNonEmpty!21805 ((_ is ValueCellFull!6353) mapDefault!21814)) b!474298))

(declare-fun m!456225 () Bool)

(assert (=> mapNonEmpty!21814 m!456225))

(declare-fun b_lambda!10223 () Bool)

(assert (= b_lambda!10217 (or (and start!42496 b_free!11965) b_lambda!10223)))

(declare-fun b_lambda!10225 () Bool)

(assert (= b_lambda!10211 (or (and start!42496 b_free!11965) b_lambda!10225)))

(declare-fun b_lambda!10227 () Bool)

(assert (= b_lambda!10219 (or (and start!42496 b_free!11965) b_lambda!10227)))

(declare-fun b_lambda!10229 () Bool)

(assert (= b_lambda!10213 (or (and start!42496 b_free!11965) b_lambda!10229)))

(declare-fun b_lambda!10231 () Bool)

(assert (= b_lambda!10215 (or (and start!42496 b_free!11965) b_lambda!10231)))

(declare-fun b_lambda!10233 () Bool)

(assert (= b_lambda!10221 (or (and start!42496 b_free!11965) b_lambda!10233)))

(check-sat (not b!474162) (not b_lambda!10231) (not b_lambda!10233) (not b_lambda!10229) (not b!474289) (not d!75375) (not b!474263) (not b!474157) (not b!474290) (not bm!30529) (not bm!30509) (not b!474181) (not b!474250) (not b!474179) b_and!20423 (not b_next!11965) (not b!474148) (not b!474273) (not b!474275) (not b!474146) (not bm!30506) (not b!474248) (not b!474287) (not d!75365) (not bm!30512) (not b!474255) (not d!75371) (not b_lambda!10225) (not b!474167) (not b!474279) (not b!474264) (not b!474160) (not b!474150) (not b!474182) (not b!474192) (not b!474262) (not b!474265) (not b_lambda!10227) (not b!474267) (not d!75373) (not d!75351) (not b!474151) (not bm!30527) (not bm!30537) (not b!474242) (not bm!30505) (not b!474166) (not bm!30536) (not b!474145) (not b!474281) (not b!474153) (not bm!30534) (not b!474193) (not d!75349) (not b!474165) (not d!75363) (not b!474271) (not mapNonEmpty!21814) (not bm!30530) (not b!474274) (not b!474266) (not bm!30531) (not d!75347) (not b!474256) (not b!474159) (not b_lambda!10223) (not b!474244) (not b!474152) (not b!474286) (not bm!30538) (not b!474240) (not b!474243) (not b!474164) tp_is_empty!13393 (not d!75367) (not b!474143) (not d!75369))
(check-sat b_and!20423 (not b_next!11965))

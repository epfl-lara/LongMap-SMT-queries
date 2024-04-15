; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42000 () Bool)

(assert start!42000)

(declare-fun b_free!11587 () Bool)

(declare-fun b_next!11587 () Bool)

(assert (=> start!42000 (= b_free!11587 (not b_next!11587))))

(declare-fun tp!40777 () Bool)

(declare-fun b_and!19959 () Bool)

(assert (=> start!42000 (= tp!40777 b_and!19959)))

(declare-fun res!280220 () Bool)

(declare-fun e!274470 () Bool)

(assert (=> start!42000 (=> (not res!280220) (not e!274470))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42000 (= res!280220 (validMask!0 mask!1365))))

(assert (=> start!42000 e!274470))

(declare-fun tp_is_empty!13015 () Bool)

(assert (=> start!42000 tp_is_empty!13015))

(assert (=> start!42000 tp!40777))

(assert (=> start!42000 true))

(declare-datatypes ((array!29785 0))(
  ( (array!29786 (arr!14318 (Array (_ BitVec 32) (_ BitVec 64))) (size!14671 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29785)

(declare-fun array_inv!10414 (array!29785) Bool)

(assert (=> start!42000 (array_inv!10414 _keys!1025)))

(declare-datatypes ((V!18459 0))(
  ( (V!18460 (val!6552 Int)) )
))
(declare-datatypes ((ValueCell!6164 0))(
  ( (ValueCellFull!6164 (v!8835 V!18459)) (EmptyCell!6164) )
))
(declare-datatypes ((array!29787 0))(
  ( (array!29788 (arr!14319 (Array (_ BitVec 32) ValueCell!6164)) (size!14672 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29787)

(declare-fun e!274471 () Bool)

(declare-fun array_inv!10415 (array!29787) Bool)

(assert (=> start!42000 (and (array_inv!10415 _values!833) e!274471)))

(declare-fun b!468827 () Bool)

(declare-fun e!274475 () Bool)

(assert (=> b!468827 (= e!274475 (bvsle #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-datatypes ((tuple2!8656 0))(
  ( (tuple2!8657 (_1!4339 (_ BitVec 64)) (_2!4339 V!18459)) )
))
(declare-datatypes ((List!8728 0))(
  ( (Nil!8725) (Cons!8724 (h!9580 tuple2!8656) (t!14677 List!8728)) )
))
(declare-datatypes ((ListLongMap!7559 0))(
  ( (ListLongMap!7560 (toList!3795 List!8728)) )
))
(declare-fun lt!212188 () ListLongMap!7559)

(declare-fun lt!212183 () tuple2!8656)

(declare-fun minValueBefore!38 () V!18459)

(declare-fun +!1725 (ListLongMap!7559 tuple2!8656) ListLongMap!7559)

(assert (=> b!468827 (= (+!1725 lt!212188 lt!212183) (+!1725 (+!1725 lt!212188 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212183))))

(declare-fun minValueAfter!38 () V!18459)

(assert (=> b!468827 (= lt!212183 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13687 0))(
  ( (Unit!13688) )
))
(declare-fun lt!212182 () Unit!13687)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!108 (ListLongMap!7559 (_ BitVec 64) V!18459 V!18459) Unit!13687)

(assert (=> b!468827 (= lt!212182 (addSameAsAddTwiceSameKeyDiffValues!108 lt!212188 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18459)

(declare-fun lt!212187 () ListLongMap!7559)

(declare-fun getCurrentListMap!2161 (array!29785 array!29787 (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 (_ BitVec 32) Int) ListLongMap!7559)

(assert (=> b!468827 (= lt!212187 (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212186 () ListLongMap!7559)

(assert (=> b!468827 (= lt!212186 (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21217 () Bool)

(declare-fun mapRes!21217 () Bool)

(declare-fun tp!40776 () Bool)

(declare-fun e!274474 () Bool)

(assert (=> mapNonEmpty!21217 (= mapRes!21217 (and tp!40776 e!274474))))

(declare-fun mapKey!21217 () (_ BitVec 32))

(declare-fun mapValue!21217 () ValueCell!6164)

(declare-fun mapRest!21217 () (Array (_ BitVec 32) ValueCell!6164))

(assert (=> mapNonEmpty!21217 (= (arr!14319 _values!833) (store mapRest!21217 mapKey!21217 mapValue!21217))))

(declare-fun b!468828 () Bool)

(declare-fun e!274472 () Bool)

(assert (=> b!468828 (= e!274471 (and e!274472 mapRes!21217))))

(declare-fun condMapEmpty!21217 () Bool)

(declare-fun mapDefault!21217 () ValueCell!6164)

(assert (=> b!468828 (= condMapEmpty!21217 (= (arr!14319 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6164)) mapDefault!21217)))))

(declare-fun b!468829 () Bool)

(declare-fun res!280219 () Bool)

(assert (=> b!468829 (=> (not res!280219) (not e!274470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29785 (_ BitVec 32)) Bool)

(assert (=> b!468829 (= res!280219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468830 () Bool)

(declare-fun res!280217 () Bool)

(assert (=> b!468830 (=> (not res!280217) (not e!274470))))

(declare-datatypes ((List!8729 0))(
  ( (Nil!8726) (Cons!8725 (h!9581 (_ BitVec 64)) (t!14678 List!8729)) )
))
(declare-fun arrayNoDuplicates!0 (array!29785 (_ BitVec 32) List!8729) Bool)

(assert (=> b!468830 (= res!280217 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8726))))

(declare-fun b!468831 () Bool)

(assert (=> b!468831 (= e!274472 tp_is_empty!13015)))

(declare-fun b!468832 () Bool)

(assert (=> b!468832 (= e!274474 tp_is_empty!13015)))

(declare-fun b!468833 () Bool)

(declare-fun res!280216 () Bool)

(assert (=> b!468833 (=> (not res!280216) (not e!274470))))

(assert (=> b!468833 (= res!280216 (and (= (size!14672 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14671 _keys!1025) (size!14672 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21217 () Bool)

(assert (=> mapIsEmpty!21217 mapRes!21217))

(declare-fun b!468834 () Bool)

(assert (=> b!468834 (= e!274470 (not e!274475))))

(declare-fun res!280218 () Bool)

(assert (=> b!468834 (=> res!280218 e!274475)))

(assert (=> b!468834 (= res!280218 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212184 () ListLongMap!7559)

(assert (=> b!468834 (= lt!212188 lt!212184)))

(declare-fun lt!212185 () Unit!13687)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!130 (array!29785 array!29787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 V!18459 V!18459 (_ BitVec 32) Int) Unit!13687)

(assert (=> b!468834 (= lt!212185 (lemmaNoChangeToArrayThenSameMapNoExtras!130 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1973 (array!29785 array!29787 (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 (_ BitVec 32) Int) ListLongMap!7559)

(assert (=> b!468834 (= lt!212184 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468834 (= lt!212188 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42000 res!280220) b!468833))

(assert (= (and b!468833 res!280216) b!468829))

(assert (= (and b!468829 res!280219) b!468830))

(assert (= (and b!468830 res!280217) b!468834))

(assert (= (and b!468834 (not res!280218)) b!468827))

(assert (= (and b!468828 condMapEmpty!21217) mapIsEmpty!21217))

(assert (= (and b!468828 (not condMapEmpty!21217)) mapNonEmpty!21217))

(get-info :version)

(assert (= (and mapNonEmpty!21217 ((_ is ValueCellFull!6164) mapValue!21217)) b!468832))

(assert (= (and b!468828 ((_ is ValueCellFull!6164) mapDefault!21217)) b!468831))

(assert (= start!42000 b!468828))

(declare-fun m!450467 () Bool)

(assert (=> b!468830 m!450467))

(declare-fun m!450469 () Bool)

(assert (=> b!468834 m!450469))

(declare-fun m!450471 () Bool)

(assert (=> b!468834 m!450471))

(declare-fun m!450473 () Bool)

(assert (=> b!468834 m!450473))

(declare-fun m!450475 () Bool)

(assert (=> b!468829 m!450475))

(declare-fun m!450477 () Bool)

(assert (=> mapNonEmpty!21217 m!450477))

(declare-fun m!450479 () Bool)

(assert (=> b!468827 m!450479))

(declare-fun m!450481 () Bool)

(assert (=> b!468827 m!450481))

(declare-fun m!450483 () Bool)

(assert (=> b!468827 m!450483))

(declare-fun m!450485 () Bool)

(assert (=> b!468827 m!450485))

(declare-fun m!450487 () Bool)

(assert (=> b!468827 m!450487))

(assert (=> b!468827 m!450481))

(declare-fun m!450489 () Bool)

(assert (=> b!468827 m!450489))

(declare-fun m!450491 () Bool)

(assert (=> start!42000 m!450491))

(declare-fun m!450493 () Bool)

(assert (=> start!42000 m!450493))

(declare-fun m!450495 () Bool)

(assert (=> start!42000 m!450495))

(check-sat (not start!42000) (not b!468829) b_and!19959 (not b!468827) tp_is_empty!13015 (not b!468830) (not mapNonEmpty!21217) (not b_next!11587) (not b!468834))
(check-sat b_and!19959 (not b_next!11587))
(get-model)

(declare-fun d!75069 () Bool)

(assert (=> d!75069 (= (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212233 () Unit!13687)

(declare-fun choose!1350 (array!29785 array!29787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 V!18459 V!18459 (_ BitVec 32) Int) Unit!13687)

(assert (=> d!75069 (= lt!212233 (choose!1350 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75069 (validMask!0 mask!1365)))

(assert (=> d!75069 (= (lemmaNoChangeToArrayThenSameMapNoExtras!130 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212233)))

(declare-fun bs!14832 () Bool)

(assert (= bs!14832 d!75069))

(assert (=> bs!14832 m!450473))

(assert (=> bs!14832 m!450471))

(declare-fun m!450557 () Bool)

(assert (=> bs!14832 m!450557))

(assert (=> bs!14832 m!450491))

(assert (=> b!468834 d!75069))

(declare-fun lt!212250 () ListLongMap!7559)

(declare-fun b!468907 () Bool)

(declare-fun e!274527 () Bool)

(assert (=> b!468907 (= e!274527 (= lt!212250 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468908 () Bool)

(declare-fun e!274529 () ListLongMap!7559)

(declare-fun e!274532 () ListLongMap!7559)

(assert (=> b!468908 (= e!274529 e!274532)))

(declare-fun c!56788 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!468908 (= c!56788 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30330 () Bool)

(declare-fun call!30333 () ListLongMap!7559)

(assert (=> bm!30330 (= call!30333 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468909 () Bool)

(declare-fun isEmpty!577 (ListLongMap!7559) Bool)

(assert (=> b!468909 (= e!274527 (isEmpty!577 lt!212250))))

(declare-fun b!468910 () Bool)

(declare-fun e!274526 () Bool)

(assert (=> b!468910 (= e!274526 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468910 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!468911 () Bool)

(declare-fun e!274530 () Bool)

(assert (=> b!468911 (= e!274530 e!274527)))

(declare-fun c!56790 () Bool)

(assert (=> b!468911 (= c!56790 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!468912 () Bool)

(declare-fun e!274528 () Bool)

(assert (=> b!468912 (= e!274528 e!274530)))

(declare-fun c!56789 () Bool)

(assert (=> b!468912 (= c!56789 e!274526)))

(declare-fun res!280261 () Bool)

(assert (=> b!468912 (=> (not res!280261) (not e!274526))))

(assert (=> b!468912 (= res!280261 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!468913 () Bool)

(assert (=> b!468913 (= e!274529 (ListLongMap!7560 Nil!8725))))

(declare-fun d!75071 () Bool)

(assert (=> d!75071 e!274528))

(declare-fun res!280259 () Bool)

(assert (=> d!75071 (=> (not res!280259) (not e!274528))))

(declare-fun contains!2525 (ListLongMap!7559 (_ BitVec 64)) Bool)

(assert (=> d!75071 (= res!280259 (not (contains!2525 lt!212250 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75071 (= lt!212250 e!274529)))

(declare-fun c!56791 () Bool)

(assert (=> d!75071 (= c!56791 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75071 (validMask!0 mask!1365)))

(assert (=> d!75071 (= (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212250)))

(declare-fun b!468914 () Bool)

(assert (=> b!468914 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> b!468914 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(declare-fun e!274531 () Bool)

(declare-fun apply!326 (ListLongMap!7559 (_ BitVec 64)) V!18459)

(declare-fun get!7007 (ValueCell!6164 V!18459) V!18459)

(declare-fun dynLambda!922 (Int (_ BitVec 64)) V!18459)

(assert (=> b!468914 (= e!274531 (= (apply!326 lt!212250 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)) (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468915 () Bool)

(assert (=> b!468915 (= e!274530 e!274531)))

(assert (=> b!468915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun res!280262 () Bool)

(assert (=> b!468915 (= res!280262 (contains!2525 lt!212250 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468915 (=> (not res!280262) (not e!274531))))

(declare-fun b!468916 () Bool)

(assert (=> b!468916 (= e!274532 call!30333)))

(declare-fun b!468917 () Bool)

(declare-fun res!280260 () Bool)

(assert (=> b!468917 (=> (not res!280260) (not e!274528))))

(assert (=> b!468917 (= res!280260 (not (contains!2525 lt!212250 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468918 () Bool)

(declare-fun lt!212253 () Unit!13687)

(declare-fun lt!212249 () Unit!13687)

(assert (=> b!468918 (= lt!212253 lt!212249)))

(declare-fun lt!212251 () (_ BitVec 64))

(declare-fun lt!212248 () (_ BitVec 64))

(declare-fun lt!212254 () V!18459)

(declare-fun lt!212252 () ListLongMap!7559)

(assert (=> b!468918 (not (contains!2525 (+!1725 lt!212252 (tuple2!8657 lt!212251 lt!212254)) lt!212248))))

(declare-fun addStillNotContains!160 (ListLongMap!7559 (_ BitVec 64) V!18459 (_ BitVec 64)) Unit!13687)

(assert (=> b!468918 (= lt!212249 (addStillNotContains!160 lt!212252 lt!212251 lt!212254 lt!212248))))

(assert (=> b!468918 (= lt!212248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!468918 (= lt!212254 (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468918 (= lt!212251 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468918 (= lt!212252 call!30333)))

(assert (=> b!468918 (= e!274532 (+!1725 call!30333 (tuple2!8657 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000) (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75071 c!56791) b!468913))

(assert (= (and d!75071 (not c!56791)) b!468908))

(assert (= (and b!468908 c!56788) b!468918))

(assert (= (and b!468908 (not c!56788)) b!468916))

(assert (= (or b!468918 b!468916) bm!30330))

(assert (= (and d!75071 res!280259) b!468917))

(assert (= (and b!468917 res!280260) b!468912))

(assert (= (and b!468912 res!280261) b!468910))

(assert (= (and b!468912 c!56789) b!468915))

(assert (= (and b!468912 (not c!56789)) b!468911))

(assert (= (and b!468915 res!280262) b!468914))

(assert (= (and b!468911 c!56790) b!468907))

(assert (= (and b!468911 (not c!56790)) b!468909))

(declare-fun b_lambda!10071 () Bool)

(assert (=> (not b_lambda!10071) (not b!468914)))

(declare-fun t!14684 () Bool)

(declare-fun tb!3909 () Bool)

(assert (=> (and start!42000 (= defaultEntry!841 defaultEntry!841) t!14684) tb!3909))

(declare-fun result!7401 () Bool)

(assert (=> tb!3909 (= result!7401 tp_is_empty!13015)))

(assert (=> b!468914 t!14684))

(declare-fun b_and!19965 () Bool)

(assert (= b_and!19959 (and (=> t!14684 result!7401) b_and!19965)))

(declare-fun b_lambda!10073 () Bool)

(assert (=> (not b_lambda!10073) (not b!468918)))

(assert (=> b!468918 t!14684))

(declare-fun b_and!19967 () Bool)

(assert (= b_and!19965 (and (=> t!14684 result!7401) b_and!19967)))

(declare-fun m!450559 () Bool)

(assert (=> b!468914 m!450559))

(declare-fun m!450561 () Bool)

(assert (=> b!468914 m!450561))

(declare-fun m!450563 () Bool)

(assert (=> b!468914 m!450563))

(declare-fun m!450565 () Bool)

(assert (=> b!468914 m!450565))

(assert (=> b!468914 m!450559))

(assert (=> b!468914 m!450561))

(assert (=> b!468914 m!450565))

(declare-fun m!450567 () Bool)

(assert (=> b!468914 m!450567))

(assert (=> b!468918 m!450559))

(assert (=> b!468918 m!450561))

(assert (=> b!468918 m!450563))

(assert (=> b!468918 m!450565))

(assert (=> b!468918 m!450559))

(assert (=> b!468918 m!450561))

(declare-fun m!450569 () Bool)

(assert (=> b!468918 m!450569))

(declare-fun m!450571 () Bool)

(assert (=> b!468918 m!450571))

(assert (=> b!468918 m!450571))

(declare-fun m!450573 () Bool)

(assert (=> b!468918 m!450573))

(declare-fun m!450575 () Bool)

(assert (=> b!468918 m!450575))

(declare-fun m!450577 () Bool)

(assert (=> d!75071 m!450577))

(assert (=> d!75071 m!450491))

(declare-fun m!450579 () Bool)

(assert (=> b!468909 m!450579))

(declare-fun m!450581 () Bool)

(assert (=> b!468907 m!450581))

(assert (=> b!468908 m!450565))

(assert (=> b!468908 m!450565))

(declare-fun m!450583 () Bool)

(assert (=> b!468908 m!450583))

(assert (=> b!468910 m!450565))

(assert (=> b!468910 m!450565))

(assert (=> b!468910 m!450583))

(assert (=> bm!30330 m!450581))

(assert (=> b!468915 m!450565))

(assert (=> b!468915 m!450565))

(declare-fun m!450585 () Bool)

(assert (=> b!468915 m!450585))

(declare-fun m!450587 () Bool)

(assert (=> b!468917 m!450587))

(assert (=> b!468834 d!75071))

(declare-fun e!274534 () Bool)

(declare-fun lt!212257 () ListLongMap!7559)

(declare-fun b!468921 () Bool)

(assert (=> b!468921 (= e!274534 (= lt!212257 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468922 () Bool)

(declare-fun e!274536 () ListLongMap!7559)

(declare-fun e!274539 () ListLongMap!7559)

(assert (=> b!468922 (= e!274536 e!274539)))

(declare-fun c!56792 () Bool)

(assert (=> b!468922 (= c!56792 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30331 () Bool)

(declare-fun call!30334 () ListLongMap!7559)

(assert (=> bm!30331 (= call!30334 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468923 () Bool)

(assert (=> b!468923 (= e!274534 (isEmpty!577 lt!212257))))

(declare-fun b!468924 () Bool)

(declare-fun e!274533 () Bool)

(assert (=> b!468924 (= e!274533 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468924 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!468925 () Bool)

(declare-fun e!274537 () Bool)

(assert (=> b!468925 (= e!274537 e!274534)))

(declare-fun c!56794 () Bool)

(assert (=> b!468925 (= c!56794 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!468926 () Bool)

(declare-fun e!274535 () Bool)

(assert (=> b!468926 (= e!274535 e!274537)))

(declare-fun c!56793 () Bool)

(assert (=> b!468926 (= c!56793 e!274533)))

(declare-fun res!280265 () Bool)

(assert (=> b!468926 (=> (not res!280265) (not e!274533))))

(assert (=> b!468926 (= res!280265 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!468927 () Bool)

(assert (=> b!468927 (= e!274536 (ListLongMap!7560 Nil!8725))))

(declare-fun d!75073 () Bool)

(assert (=> d!75073 e!274535))

(declare-fun res!280263 () Bool)

(assert (=> d!75073 (=> (not res!280263) (not e!274535))))

(assert (=> d!75073 (= res!280263 (not (contains!2525 lt!212257 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75073 (= lt!212257 e!274536)))

(declare-fun c!56795 () Bool)

(assert (=> d!75073 (= c!56795 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75073 (validMask!0 mask!1365)))

(assert (=> d!75073 (= (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212257)))

(declare-fun b!468928 () Bool)

(assert (=> b!468928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> b!468928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(declare-fun e!274538 () Bool)

(assert (=> b!468928 (= e!274538 (= (apply!326 lt!212257 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)) (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468929 () Bool)

(assert (=> b!468929 (= e!274537 e!274538)))

(assert (=> b!468929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun res!280266 () Bool)

(assert (=> b!468929 (= res!280266 (contains!2525 lt!212257 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468929 (=> (not res!280266) (not e!274538))))

(declare-fun b!468930 () Bool)

(assert (=> b!468930 (= e!274539 call!30334)))

(declare-fun b!468931 () Bool)

(declare-fun res!280264 () Bool)

(assert (=> b!468931 (=> (not res!280264) (not e!274535))))

(assert (=> b!468931 (= res!280264 (not (contains!2525 lt!212257 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468932 () Bool)

(declare-fun lt!212260 () Unit!13687)

(declare-fun lt!212256 () Unit!13687)

(assert (=> b!468932 (= lt!212260 lt!212256)))

(declare-fun lt!212259 () ListLongMap!7559)

(declare-fun lt!212258 () (_ BitVec 64))

(declare-fun lt!212255 () (_ BitVec 64))

(declare-fun lt!212261 () V!18459)

(assert (=> b!468932 (not (contains!2525 (+!1725 lt!212259 (tuple2!8657 lt!212258 lt!212261)) lt!212255))))

(assert (=> b!468932 (= lt!212256 (addStillNotContains!160 lt!212259 lt!212258 lt!212261 lt!212255))))

(assert (=> b!468932 (= lt!212255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!468932 (= lt!212261 (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468932 (= lt!212258 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468932 (= lt!212259 call!30334)))

(assert (=> b!468932 (= e!274539 (+!1725 call!30334 (tuple2!8657 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000) (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75073 c!56795) b!468927))

(assert (= (and d!75073 (not c!56795)) b!468922))

(assert (= (and b!468922 c!56792) b!468932))

(assert (= (and b!468922 (not c!56792)) b!468930))

(assert (= (or b!468932 b!468930) bm!30331))

(assert (= (and d!75073 res!280263) b!468931))

(assert (= (and b!468931 res!280264) b!468926))

(assert (= (and b!468926 res!280265) b!468924))

(assert (= (and b!468926 c!56793) b!468929))

(assert (= (and b!468926 (not c!56793)) b!468925))

(assert (= (and b!468929 res!280266) b!468928))

(assert (= (and b!468925 c!56794) b!468921))

(assert (= (and b!468925 (not c!56794)) b!468923))

(declare-fun b_lambda!10075 () Bool)

(assert (=> (not b_lambda!10075) (not b!468928)))

(assert (=> b!468928 t!14684))

(declare-fun b_and!19969 () Bool)

(assert (= b_and!19967 (and (=> t!14684 result!7401) b_and!19969)))

(declare-fun b_lambda!10077 () Bool)

(assert (=> (not b_lambda!10077) (not b!468932)))

(assert (=> b!468932 t!14684))

(declare-fun b_and!19971 () Bool)

(assert (= b_and!19969 (and (=> t!14684 result!7401) b_and!19971)))

(assert (=> b!468928 m!450559))

(assert (=> b!468928 m!450561))

(assert (=> b!468928 m!450563))

(assert (=> b!468928 m!450565))

(assert (=> b!468928 m!450559))

(assert (=> b!468928 m!450561))

(assert (=> b!468928 m!450565))

(declare-fun m!450589 () Bool)

(assert (=> b!468928 m!450589))

(assert (=> b!468932 m!450559))

(assert (=> b!468932 m!450561))

(assert (=> b!468932 m!450563))

(assert (=> b!468932 m!450565))

(assert (=> b!468932 m!450559))

(assert (=> b!468932 m!450561))

(declare-fun m!450591 () Bool)

(assert (=> b!468932 m!450591))

(declare-fun m!450593 () Bool)

(assert (=> b!468932 m!450593))

(assert (=> b!468932 m!450593))

(declare-fun m!450595 () Bool)

(assert (=> b!468932 m!450595))

(declare-fun m!450597 () Bool)

(assert (=> b!468932 m!450597))

(declare-fun m!450599 () Bool)

(assert (=> d!75073 m!450599))

(assert (=> d!75073 m!450491))

(declare-fun m!450601 () Bool)

(assert (=> b!468923 m!450601))

(declare-fun m!450603 () Bool)

(assert (=> b!468921 m!450603))

(assert (=> b!468922 m!450565))

(assert (=> b!468922 m!450565))

(assert (=> b!468922 m!450583))

(assert (=> b!468924 m!450565))

(assert (=> b!468924 m!450565))

(assert (=> b!468924 m!450583))

(assert (=> bm!30331 m!450603))

(assert (=> b!468929 m!450565))

(assert (=> b!468929 m!450565))

(declare-fun m!450605 () Bool)

(assert (=> b!468929 m!450605))

(declare-fun m!450607 () Bool)

(assert (=> b!468931 m!450607))

(assert (=> b!468834 d!75073))

(declare-fun b!468941 () Bool)

(declare-fun e!274546 () Bool)

(declare-fun call!30337 () Bool)

(assert (=> b!468941 (= e!274546 call!30337)))

(declare-fun bm!30334 () Bool)

(assert (=> bm!30334 (= call!30337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!468942 () Bool)

(declare-fun e!274547 () Bool)

(assert (=> b!468942 (= e!274547 call!30337)))

(declare-fun b!468943 () Bool)

(declare-fun e!274548 () Bool)

(assert (=> b!468943 (= e!274548 e!274547)))

(declare-fun c!56798 () Bool)

(assert (=> b!468943 (= c!56798 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75075 () Bool)

(declare-fun res!280271 () Bool)

(assert (=> d!75075 (=> res!280271 e!274548)))

(assert (=> d!75075 (= res!280271 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!274548)))

(declare-fun b!468944 () Bool)

(assert (=> b!468944 (= e!274547 e!274546)))

(declare-fun lt!212269 () (_ BitVec 64))

(assert (=> b!468944 (= lt!212269 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212268 () Unit!13687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29785 (_ BitVec 64) (_ BitVec 32)) Unit!13687)

(assert (=> b!468944 (= lt!212268 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!212269 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!468944 (arrayContainsKey!0 _keys!1025 lt!212269 #b00000000000000000000000000000000)))

(declare-fun lt!212270 () Unit!13687)

(assert (=> b!468944 (= lt!212270 lt!212268)))

(declare-fun res!280272 () Bool)

(declare-datatypes ((SeekEntryResult!3545 0))(
  ( (MissingZero!3545 (index!16359 (_ BitVec 32))) (Found!3545 (index!16360 (_ BitVec 32))) (Intermediate!3545 (undefined!4357 Bool) (index!16361 (_ BitVec 32)) (x!43910 (_ BitVec 32))) (Undefined!3545) (MissingVacant!3545 (index!16362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29785 (_ BitVec 32)) SeekEntryResult!3545)

(assert (=> b!468944 (= res!280272 (= (seekEntryOrOpen!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3545 #b00000000000000000000000000000000)))))

(assert (=> b!468944 (=> (not res!280272) (not e!274546))))

(assert (= (and d!75075 (not res!280271)) b!468943))

(assert (= (and b!468943 c!56798) b!468944))

(assert (= (and b!468943 (not c!56798)) b!468942))

(assert (= (and b!468944 res!280272) b!468941))

(assert (= (or b!468941 b!468942) bm!30334))

(declare-fun m!450609 () Bool)

(assert (=> bm!30334 m!450609))

(assert (=> b!468943 m!450565))

(assert (=> b!468943 m!450565))

(assert (=> b!468943 m!450583))

(assert (=> b!468944 m!450565))

(declare-fun m!450611 () Bool)

(assert (=> b!468944 m!450611))

(declare-fun m!450613 () Bool)

(assert (=> b!468944 m!450613))

(assert (=> b!468944 m!450565))

(declare-fun m!450615 () Bool)

(assert (=> b!468944 m!450615))

(assert (=> b!468829 d!75075))

(declare-fun b!468955 () Bool)

(declare-fun e!274558 () Bool)

(declare-fun call!30340 () Bool)

(assert (=> b!468955 (= e!274558 call!30340)))

(declare-fun b!468956 () Bool)

(assert (=> b!468956 (= e!274558 call!30340)))

(declare-fun d!75077 () Bool)

(declare-fun res!280281 () Bool)

(declare-fun e!274560 () Bool)

(assert (=> d!75077 (=> res!280281 e!274560)))

(assert (=> d!75077 (= res!280281 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75077 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8726) e!274560)))

(declare-fun b!468957 () Bool)

(declare-fun e!274557 () Bool)

(assert (=> b!468957 (= e!274557 e!274558)))

(declare-fun c!56801 () Bool)

(assert (=> b!468957 (= c!56801 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30337 () Bool)

(assert (=> bm!30337 (= call!30340 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56801 (Cons!8725 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000) Nil!8726) Nil!8726)))))

(declare-fun b!468958 () Bool)

(declare-fun e!274559 () Bool)

(declare-fun contains!2526 (List!8729 (_ BitVec 64)) Bool)

(assert (=> b!468958 (= e!274559 (contains!2526 Nil!8726 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468959 () Bool)

(assert (=> b!468959 (= e!274560 e!274557)))

(declare-fun res!280280 () Bool)

(assert (=> b!468959 (=> (not res!280280) (not e!274557))))

(assert (=> b!468959 (= res!280280 (not e!274559))))

(declare-fun res!280279 () Bool)

(assert (=> b!468959 (=> (not res!280279) (not e!274559))))

(assert (=> b!468959 (= res!280279 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75077 (not res!280281)) b!468959))

(assert (= (and b!468959 res!280279) b!468958))

(assert (= (and b!468959 res!280280) b!468957))

(assert (= (and b!468957 c!56801) b!468955))

(assert (= (and b!468957 (not c!56801)) b!468956))

(assert (= (or b!468955 b!468956) bm!30337))

(assert (=> b!468957 m!450565))

(assert (=> b!468957 m!450565))

(assert (=> b!468957 m!450583))

(assert (=> bm!30337 m!450565))

(declare-fun m!450617 () Bool)

(assert (=> bm!30337 m!450617))

(assert (=> b!468958 m!450565))

(assert (=> b!468958 m!450565))

(declare-fun m!450619 () Bool)

(assert (=> b!468958 m!450619))

(assert (=> b!468959 m!450565))

(assert (=> b!468959 m!450565))

(assert (=> b!468959 m!450583))

(assert (=> b!468830 d!75077))

(declare-fun bm!30352 () Bool)

(declare-fun call!30360 () ListLongMap!7559)

(declare-fun call!30358 () ListLongMap!7559)

(assert (=> bm!30352 (= call!30360 call!30358)))

(declare-fun b!469002 () Bool)

(declare-fun e!274599 () Bool)

(declare-fun e!274595 () Bool)

(assert (=> b!469002 (= e!274599 e!274595)))

(declare-fun res!280302 () Bool)

(declare-fun call!30356 () Bool)

(assert (=> b!469002 (= res!280302 call!30356)))

(assert (=> b!469002 (=> (not res!280302) (not e!274595))))

(declare-fun b!469003 () Bool)

(declare-fun res!280305 () Bool)

(declare-fun e!274594 () Bool)

(assert (=> b!469003 (=> (not res!280305) (not e!274594))))

(declare-fun e!274598 () Bool)

(assert (=> b!469003 (= res!280305 e!274598)))

(declare-fun res!280306 () Bool)

(assert (=> b!469003 (=> res!280306 e!274598)))

(declare-fun e!274597 () Bool)

(assert (=> b!469003 (= res!280306 (not e!274597))))

(declare-fun res!280303 () Bool)

(assert (=> b!469003 (=> (not res!280303) (not e!274597))))

(assert (=> b!469003 (= res!280303 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469004 () Bool)

(declare-fun e!274588 () ListLongMap!7559)

(declare-fun call!30361 () ListLongMap!7559)

(assert (=> b!469004 (= e!274588 call!30361)))

(declare-fun b!469005 () Bool)

(assert (=> b!469005 (= e!274594 e!274599)))

(declare-fun c!56817 () Bool)

(assert (=> b!469005 (= c!56817 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469006 () Bool)

(assert (=> b!469006 (= e!274599 (not call!30356))))

(declare-fun b!469007 () Bool)

(declare-fun e!274591 () Bool)

(assert (=> b!469007 (= e!274598 e!274591)))

(declare-fun res!280304 () Bool)

(assert (=> b!469007 (=> (not res!280304) (not e!274591))))

(declare-fun lt!212327 () ListLongMap!7559)

(assert (=> b!469007 (= res!280304 (contains!2525 lt!212327 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun bm!30353 () Bool)

(assert (=> bm!30353 (= call!30356 (contains!2525 lt!212327 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469009 () Bool)

(declare-fun e!274596 () Unit!13687)

(declare-fun Unit!13693 () Unit!13687)

(assert (=> b!469009 (= e!274596 Unit!13693)))

(declare-fun b!469010 () Bool)

(declare-fun e!274592 () Bool)

(declare-fun call!30355 () Bool)

(assert (=> b!469010 (= e!274592 (not call!30355))))

(declare-fun c!56819 () Bool)

(declare-fun c!56814 () Bool)

(declare-fun call!30359 () ListLongMap!7559)

(declare-fun bm!30354 () Bool)

(declare-fun call!30357 () ListLongMap!7559)

(assert (=> bm!30354 (= call!30359 (+!1725 (ite c!56814 call!30357 (ite c!56819 call!30358 call!30360)) (ite (or c!56814 c!56819) (tuple2!8657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!469011 () Bool)

(declare-fun lt!212322 () Unit!13687)

(assert (=> b!469011 (= e!274596 lt!212322)))

(declare-fun lt!212324 () ListLongMap!7559)

(assert (=> b!469011 (= lt!212324 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212321 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212321 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212331 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212331 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212328 () Unit!13687)

(declare-fun addStillContains!288 (ListLongMap!7559 (_ BitVec 64) V!18459 (_ BitVec 64)) Unit!13687)

(assert (=> b!469011 (= lt!212328 (addStillContains!288 lt!212324 lt!212321 zeroValue!794 lt!212331))))

(assert (=> b!469011 (contains!2525 (+!1725 lt!212324 (tuple2!8657 lt!212321 zeroValue!794)) lt!212331)))

(declare-fun lt!212325 () Unit!13687)

(assert (=> b!469011 (= lt!212325 lt!212328)))

(declare-fun lt!212333 () ListLongMap!7559)

(assert (=> b!469011 (= lt!212333 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212326 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212326 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212332 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212332 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212315 () Unit!13687)

(declare-fun addApplyDifferent!288 (ListLongMap!7559 (_ BitVec 64) V!18459 (_ BitVec 64)) Unit!13687)

(assert (=> b!469011 (= lt!212315 (addApplyDifferent!288 lt!212333 lt!212326 minValueAfter!38 lt!212332))))

(assert (=> b!469011 (= (apply!326 (+!1725 lt!212333 (tuple2!8657 lt!212326 minValueAfter!38)) lt!212332) (apply!326 lt!212333 lt!212332))))

(declare-fun lt!212336 () Unit!13687)

(assert (=> b!469011 (= lt!212336 lt!212315)))

(declare-fun lt!212329 () ListLongMap!7559)

(assert (=> b!469011 (= lt!212329 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212318 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212323 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212323 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212320 () Unit!13687)

(assert (=> b!469011 (= lt!212320 (addApplyDifferent!288 lt!212329 lt!212318 zeroValue!794 lt!212323))))

(assert (=> b!469011 (= (apply!326 (+!1725 lt!212329 (tuple2!8657 lt!212318 zeroValue!794)) lt!212323) (apply!326 lt!212329 lt!212323))))

(declare-fun lt!212319 () Unit!13687)

(assert (=> b!469011 (= lt!212319 lt!212320)))

(declare-fun lt!212335 () ListLongMap!7559)

(assert (=> b!469011 (= lt!212335 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212316 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212317 () (_ BitVec 64))

(assert (=> b!469011 (= lt!212317 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469011 (= lt!212322 (addApplyDifferent!288 lt!212335 lt!212316 minValueAfter!38 lt!212317))))

(assert (=> b!469011 (= (apply!326 (+!1725 lt!212335 (tuple2!8657 lt!212316 minValueAfter!38)) lt!212317) (apply!326 lt!212335 lt!212317))))

(declare-fun b!469012 () Bool)

(declare-fun e!274587 () ListLongMap!7559)

(assert (=> b!469012 (= e!274587 e!274588)))

(assert (=> b!469012 (= c!56819 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469013 () Bool)

(declare-fun res!280307 () Bool)

(assert (=> b!469013 (=> (not res!280307) (not e!274594))))

(assert (=> b!469013 (= res!280307 e!274592)))

(declare-fun c!56818 () Bool)

(assert (=> b!469013 (= c!56818 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469014 () Bool)

(assert (=> b!469014 (= e!274595 (= (apply!326 lt!212327 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun bm!30355 () Bool)

(assert (=> bm!30355 (= call!30357 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469015 () Bool)

(declare-fun e!274593 () Bool)

(assert (=> b!469015 (= e!274593 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469016 () Bool)

(declare-fun e!274589 () Bool)

(assert (=> b!469016 (= e!274589 (= (apply!326 lt!212327 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30356 () Bool)

(assert (=> bm!30356 (= call!30361 call!30359)))

(declare-fun b!469017 () Bool)

(declare-fun e!274590 () ListLongMap!7559)

(assert (=> b!469017 (= e!274590 call!30360)))

(declare-fun bm!30357 () Bool)

(assert (=> bm!30357 (= call!30358 call!30357)))

(declare-fun bm!30358 () Bool)

(assert (=> bm!30358 (= call!30355 (contains!2525 lt!212327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469008 () Bool)

(assert (=> b!469008 (= e!274597 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75079 () Bool)

(assert (=> d!75079 e!274594))

(declare-fun res!280300 () Bool)

(assert (=> d!75079 (=> (not res!280300) (not e!274594))))

(assert (=> d!75079 (= res!280300 (or (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))))

(declare-fun lt!212330 () ListLongMap!7559)

(assert (=> d!75079 (= lt!212327 lt!212330)))

(declare-fun lt!212334 () Unit!13687)

(assert (=> d!75079 (= lt!212334 e!274596)))

(declare-fun c!56816 () Bool)

(assert (=> d!75079 (= c!56816 e!274593)))

(declare-fun res!280308 () Bool)

(assert (=> d!75079 (=> (not res!280308) (not e!274593))))

(assert (=> d!75079 (= res!280308 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75079 (= lt!212330 e!274587)))

(assert (=> d!75079 (= c!56814 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75079 (validMask!0 mask!1365)))

(assert (=> d!75079 (= (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212327)))

(declare-fun b!469018 () Bool)

(assert (=> b!469018 (= e!274591 (= (apply!326 lt!212327 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)) (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(assert (=> b!469018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469019 () Bool)

(assert (=> b!469019 (= e!274592 e!274589)))

(declare-fun res!280301 () Bool)

(assert (=> b!469019 (= res!280301 call!30355)))

(assert (=> b!469019 (=> (not res!280301) (not e!274589))))

(declare-fun b!469020 () Bool)

(assert (=> b!469020 (= e!274587 (+!1725 call!30359 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!469021 () Bool)

(declare-fun c!56815 () Bool)

(assert (=> b!469021 (= c!56815 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!469021 (= e!274588 e!274590)))

(declare-fun b!469022 () Bool)

(assert (=> b!469022 (= e!274590 call!30361)))

(assert (= (and d!75079 c!56814) b!469020))

(assert (= (and d!75079 (not c!56814)) b!469012))

(assert (= (and b!469012 c!56819) b!469004))

(assert (= (and b!469012 (not c!56819)) b!469021))

(assert (= (and b!469021 c!56815) b!469022))

(assert (= (and b!469021 (not c!56815)) b!469017))

(assert (= (or b!469022 b!469017) bm!30352))

(assert (= (or b!469004 bm!30352) bm!30357))

(assert (= (or b!469004 b!469022) bm!30356))

(assert (= (or b!469020 bm!30357) bm!30355))

(assert (= (or b!469020 bm!30356) bm!30354))

(assert (= (and d!75079 res!280308) b!469015))

(assert (= (and d!75079 c!56816) b!469011))

(assert (= (and d!75079 (not c!56816)) b!469009))

(assert (= (and d!75079 res!280300) b!469003))

(assert (= (and b!469003 res!280303) b!469008))

(assert (= (and b!469003 (not res!280306)) b!469007))

(assert (= (and b!469007 res!280304) b!469018))

(assert (= (and b!469003 res!280305) b!469013))

(assert (= (and b!469013 c!56818) b!469019))

(assert (= (and b!469013 (not c!56818)) b!469010))

(assert (= (and b!469019 res!280301) b!469016))

(assert (= (or b!469019 b!469010) bm!30358))

(assert (= (and b!469013 res!280307) b!469005))

(assert (= (and b!469005 c!56817) b!469002))

(assert (= (and b!469005 (not c!56817)) b!469006))

(assert (= (and b!469002 res!280302) b!469014))

(assert (= (or b!469002 b!469006) bm!30353))

(declare-fun b_lambda!10079 () Bool)

(assert (=> (not b_lambda!10079) (not b!469018)))

(assert (=> b!469018 t!14684))

(declare-fun b_and!19973 () Bool)

(assert (= b_and!19971 (and (=> t!14684 result!7401) b_and!19973)))

(assert (=> b!469015 m!450565))

(assert (=> b!469015 m!450565))

(assert (=> b!469015 m!450583))

(declare-fun m!450621 () Bool)

(assert (=> bm!30358 m!450621))

(declare-fun m!450623 () Bool)

(assert (=> b!469011 m!450623))

(declare-fun m!450625 () Bool)

(assert (=> b!469011 m!450625))

(declare-fun m!450627 () Bool)

(assert (=> b!469011 m!450627))

(declare-fun m!450629 () Bool)

(assert (=> b!469011 m!450629))

(assert (=> b!469011 m!450623))

(declare-fun m!450631 () Bool)

(assert (=> b!469011 m!450631))

(assert (=> b!469011 m!450627))

(declare-fun m!450633 () Bool)

(assert (=> b!469011 m!450633))

(declare-fun m!450635 () Bool)

(assert (=> b!469011 m!450635))

(assert (=> b!469011 m!450565))

(declare-fun m!450637 () Bool)

(assert (=> b!469011 m!450637))

(declare-fun m!450639 () Bool)

(assert (=> b!469011 m!450639))

(assert (=> b!469011 m!450637))

(declare-fun m!450641 () Bool)

(assert (=> b!469011 m!450641))

(declare-fun m!450643 () Bool)

(assert (=> b!469011 m!450643))

(declare-fun m!450645 () Bool)

(assert (=> b!469011 m!450645))

(declare-fun m!450647 () Bool)

(assert (=> b!469011 m!450647))

(assert (=> b!469011 m!450471))

(declare-fun m!450649 () Bool)

(assert (=> b!469011 m!450649))

(assert (=> b!469011 m!450641))

(declare-fun m!450651 () Bool)

(assert (=> b!469011 m!450651))

(declare-fun m!450653 () Bool)

(assert (=> b!469016 m!450653))

(assert (=> bm!30355 m!450471))

(assert (=> d!75079 m!450491))

(declare-fun m!450655 () Bool)

(assert (=> b!469020 m!450655))

(declare-fun m!450657 () Bool)

(assert (=> bm!30353 m!450657))

(assert (=> b!469008 m!450565))

(assert (=> b!469008 m!450565))

(assert (=> b!469008 m!450583))

(assert (=> b!469018 m!450561))

(assert (=> b!469018 m!450565))

(declare-fun m!450659 () Bool)

(assert (=> b!469018 m!450659))

(assert (=> b!469018 m!450565))

(assert (=> b!469018 m!450559))

(assert (=> b!469018 m!450559))

(assert (=> b!469018 m!450561))

(assert (=> b!469018 m!450563))

(declare-fun m!450661 () Bool)

(assert (=> b!469014 m!450661))

(assert (=> b!469007 m!450565))

(assert (=> b!469007 m!450565))

(declare-fun m!450663 () Bool)

(assert (=> b!469007 m!450663))

(declare-fun m!450665 () Bool)

(assert (=> bm!30354 m!450665))

(assert (=> b!468827 d!75079))

(declare-fun d!75081 () Bool)

(declare-fun e!274602 () Bool)

(assert (=> d!75081 e!274602))

(declare-fun res!280313 () Bool)

(assert (=> d!75081 (=> (not res!280313) (not e!274602))))

(declare-fun lt!212345 () ListLongMap!7559)

(assert (=> d!75081 (= res!280313 (contains!2525 lt!212345 (_1!4339 lt!212183)))))

(declare-fun lt!212348 () List!8728)

(assert (=> d!75081 (= lt!212345 (ListLongMap!7560 lt!212348))))

(declare-fun lt!212346 () Unit!13687)

(declare-fun lt!212347 () Unit!13687)

(assert (=> d!75081 (= lt!212346 lt!212347)))

(declare-datatypes ((Option!382 0))(
  ( (Some!381 (v!8838 V!18459)) (None!380) )
))
(declare-fun getValueByKey!376 (List!8728 (_ BitVec 64)) Option!382)

(assert (=> d!75081 (= (getValueByKey!376 lt!212348 (_1!4339 lt!212183)) (Some!381 (_2!4339 lt!212183)))))

(declare-fun lemmaContainsTupThenGetReturnValue!201 (List!8728 (_ BitVec 64) V!18459) Unit!13687)

(assert (=> d!75081 (= lt!212347 (lemmaContainsTupThenGetReturnValue!201 lt!212348 (_1!4339 lt!212183) (_2!4339 lt!212183)))))

(declare-fun insertStrictlySorted!204 (List!8728 (_ BitVec 64) V!18459) List!8728)

(assert (=> d!75081 (= lt!212348 (insertStrictlySorted!204 (toList!3795 (+!1725 lt!212188 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4339 lt!212183) (_2!4339 lt!212183)))))

(assert (=> d!75081 (= (+!1725 (+!1725 lt!212188 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212183) lt!212345)))

(declare-fun b!469027 () Bool)

(declare-fun res!280314 () Bool)

(assert (=> b!469027 (=> (not res!280314) (not e!274602))))

(assert (=> b!469027 (= res!280314 (= (getValueByKey!376 (toList!3795 lt!212345) (_1!4339 lt!212183)) (Some!381 (_2!4339 lt!212183))))))

(declare-fun b!469028 () Bool)

(declare-fun contains!2527 (List!8728 tuple2!8656) Bool)

(assert (=> b!469028 (= e!274602 (contains!2527 (toList!3795 lt!212345) lt!212183))))

(assert (= (and d!75081 res!280313) b!469027))

(assert (= (and b!469027 res!280314) b!469028))

(declare-fun m!450667 () Bool)

(assert (=> d!75081 m!450667))

(declare-fun m!450669 () Bool)

(assert (=> d!75081 m!450669))

(declare-fun m!450671 () Bool)

(assert (=> d!75081 m!450671))

(declare-fun m!450673 () Bool)

(assert (=> d!75081 m!450673))

(declare-fun m!450675 () Bool)

(assert (=> b!469027 m!450675))

(declare-fun m!450677 () Bool)

(assert (=> b!469028 m!450677))

(assert (=> b!468827 d!75081))

(declare-fun d!75083 () Bool)

(declare-fun e!274603 () Bool)

(assert (=> d!75083 e!274603))

(declare-fun res!280315 () Bool)

(assert (=> d!75083 (=> (not res!280315) (not e!274603))))

(declare-fun lt!212349 () ListLongMap!7559)

(assert (=> d!75083 (= res!280315 (contains!2525 lt!212349 (_1!4339 lt!212183)))))

(declare-fun lt!212352 () List!8728)

(assert (=> d!75083 (= lt!212349 (ListLongMap!7560 lt!212352))))

(declare-fun lt!212350 () Unit!13687)

(declare-fun lt!212351 () Unit!13687)

(assert (=> d!75083 (= lt!212350 lt!212351)))

(assert (=> d!75083 (= (getValueByKey!376 lt!212352 (_1!4339 lt!212183)) (Some!381 (_2!4339 lt!212183)))))

(assert (=> d!75083 (= lt!212351 (lemmaContainsTupThenGetReturnValue!201 lt!212352 (_1!4339 lt!212183) (_2!4339 lt!212183)))))

(assert (=> d!75083 (= lt!212352 (insertStrictlySorted!204 (toList!3795 lt!212188) (_1!4339 lt!212183) (_2!4339 lt!212183)))))

(assert (=> d!75083 (= (+!1725 lt!212188 lt!212183) lt!212349)))

(declare-fun b!469029 () Bool)

(declare-fun res!280316 () Bool)

(assert (=> b!469029 (=> (not res!280316) (not e!274603))))

(assert (=> b!469029 (= res!280316 (= (getValueByKey!376 (toList!3795 lt!212349) (_1!4339 lt!212183)) (Some!381 (_2!4339 lt!212183))))))

(declare-fun b!469030 () Bool)

(assert (=> b!469030 (= e!274603 (contains!2527 (toList!3795 lt!212349) lt!212183))))

(assert (= (and d!75083 res!280315) b!469029))

(assert (= (and b!469029 res!280316) b!469030))

(declare-fun m!450679 () Bool)

(assert (=> d!75083 m!450679))

(declare-fun m!450681 () Bool)

(assert (=> d!75083 m!450681))

(declare-fun m!450683 () Bool)

(assert (=> d!75083 m!450683))

(declare-fun m!450685 () Bool)

(assert (=> d!75083 m!450685))

(declare-fun m!450687 () Bool)

(assert (=> b!469029 m!450687))

(declare-fun m!450689 () Bool)

(assert (=> b!469030 m!450689))

(assert (=> b!468827 d!75083))

(declare-fun d!75085 () Bool)

(declare-fun e!274604 () Bool)

(assert (=> d!75085 e!274604))

(declare-fun res!280317 () Bool)

(assert (=> d!75085 (=> (not res!280317) (not e!274604))))

(declare-fun lt!212353 () ListLongMap!7559)

(assert (=> d!75085 (= res!280317 (contains!2525 lt!212353 (_1!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!212356 () List!8728)

(assert (=> d!75085 (= lt!212353 (ListLongMap!7560 lt!212356))))

(declare-fun lt!212354 () Unit!13687)

(declare-fun lt!212355 () Unit!13687)

(assert (=> d!75085 (= lt!212354 lt!212355)))

(assert (=> d!75085 (= (getValueByKey!376 lt!212356 (_1!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!381 (_2!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75085 (= lt!212355 (lemmaContainsTupThenGetReturnValue!201 lt!212356 (_1!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75085 (= lt!212356 (insertStrictlySorted!204 (toList!3795 lt!212188) (_1!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75085 (= (+!1725 lt!212188 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212353)))

(declare-fun b!469031 () Bool)

(declare-fun res!280318 () Bool)

(assert (=> b!469031 (=> (not res!280318) (not e!274604))))

(assert (=> b!469031 (= res!280318 (= (getValueByKey!376 (toList!3795 lt!212353) (_1!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!381 (_2!4339 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!469032 () Bool)

(assert (=> b!469032 (= e!274604 (contains!2527 (toList!3795 lt!212353) (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75085 res!280317) b!469031))

(assert (= (and b!469031 res!280318) b!469032))

(declare-fun m!450691 () Bool)

(assert (=> d!75085 m!450691))

(declare-fun m!450693 () Bool)

(assert (=> d!75085 m!450693))

(declare-fun m!450695 () Bool)

(assert (=> d!75085 m!450695))

(declare-fun m!450697 () Bool)

(assert (=> d!75085 m!450697))

(declare-fun m!450699 () Bool)

(assert (=> b!469031 m!450699))

(declare-fun m!450701 () Bool)

(assert (=> b!469032 m!450701))

(assert (=> b!468827 d!75085))

(declare-fun d!75087 () Bool)

(assert (=> d!75087 (= (+!1725 lt!212188 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1725 (+!1725 lt!212188 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!212359 () Unit!13687)

(declare-fun choose!1351 (ListLongMap!7559 (_ BitVec 64) V!18459 V!18459) Unit!13687)

(assert (=> d!75087 (= lt!212359 (choose!1351 lt!212188 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75087 (= (addSameAsAddTwiceSameKeyDiffValues!108 lt!212188 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!212359)))

(declare-fun bs!14833 () Bool)

(assert (= bs!14833 d!75087))

(declare-fun m!450703 () Bool)

(assert (=> bs!14833 m!450703))

(assert (=> bs!14833 m!450481))

(assert (=> bs!14833 m!450481))

(declare-fun m!450705 () Bool)

(assert (=> bs!14833 m!450705))

(declare-fun m!450707 () Bool)

(assert (=> bs!14833 m!450707))

(assert (=> b!468827 d!75087))

(declare-fun bm!30359 () Bool)

(declare-fun call!30367 () ListLongMap!7559)

(declare-fun call!30365 () ListLongMap!7559)

(assert (=> bm!30359 (= call!30367 call!30365)))

(declare-fun b!469033 () Bool)

(declare-fun e!274617 () Bool)

(declare-fun e!274613 () Bool)

(assert (=> b!469033 (= e!274617 e!274613)))

(declare-fun res!280321 () Bool)

(declare-fun call!30363 () Bool)

(assert (=> b!469033 (= res!280321 call!30363)))

(assert (=> b!469033 (=> (not res!280321) (not e!274613))))

(declare-fun b!469034 () Bool)

(declare-fun res!280324 () Bool)

(declare-fun e!274612 () Bool)

(assert (=> b!469034 (=> (not res!280324) (not e!274612))))

(declare-fun e!274616 () Bool)

(assert (=> b!469034 (= res!280324 e!274616)))

(declare-fun res!280325 () Bool)

(assert (=> b!469034 (=> res!280325 e!274616)))

(declare-fun e!274615 () Bool)

(assert (=> b!469034 (= res!280325 (not e!274615))))

(declare-fun res!280322 () Bool)

(assert (=> b!469034 (=> (not res!280322) (not e!274615))))

(assert (=> b!469034 (= res!280322 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469035 () Bool)

(declare-fun e!274606 () ListLongMap!7559)

(declare-fun call!30368 () ListLongMap!7559)

(assert (=> b!469035 (= e!274606 call!30368)))

(declare-fun b!469036 () Bool)

(assert (=> b!469036 (= e!274612 e!274617)))

(declare-fun c!56823 () Bool)

(assert (=> b!469036 (= c!56823 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469037 () Bool)

(assert (=> b!469037 (= e!274617 (not call!30363))))

(declare-fun b!469038 () Bool)

(declare-fun e!274609 () Bool)

(assert (=> b!469038 (= e!274616 e!274609)))

(declare-fun res!280323 () Bool)

(assert (=> b!469038 (=> (not res!280323) (not e!274609))))

(declare-fun lt!212372 () ListLongMap!7559)

(assert (=> b!469038 (= res!280323 (contains!2525 lt!212372 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469038 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun bm!30360 () Bool)

(assert (=> bm!30360 (= call!30363 (contains!2525 lt!212372 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469040 () Bool)

(declare-fun e!274614 () Unit!13687)

(declare-fun Unit!13694 () Unit!13687)

(assert (=> b!469040 (= e!274614 Unit!13694)))

(declare-fun b!469041 () Bool)

(declare-fun e!274610 () Bool)

(declare-fun call!30362 () Bool)

(assert (=> b!469041 (= e!274610 (not call!30362))))

(declare-fun c!56820 () Bool)

(declare-fun bm!30361 () Bool)

(declare-fun call!30364 () ListLongMap!7559)

(declare-fun call!30366 () ListLongMap!7559)

(declare-fun c!56825 () Bool)

(assert (=> bm!30361 (= call!30366 (+!1725 (ite c!56820 call!30364 (ite c!56825 call!30365 call!30367)) (ite (or c!56820 c!56825) (tuple2!8657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!469042 () Bool)

(declare-fun lt!212367 () Unit!13687)

(assert (=> b!469042 (= e!274614 lt!212367)))

(declare-fun lt!212369 () ListLongMap!7559)

(assert (=> b!469042 (= lt!212369 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212366 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212366 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212376 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212376 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212373 () Unit!13687)

(assert (=> b!469042 (= lt!212373 (addStillContains!288 lt!212369 lt!212366 zeroValue!794 lt!212376))))

(assert (=> b!469042 (contains!2525 (+!1725 lt!212369 (tuple2!8657 lt!212366 zeroValue!794)) lt!212376)))

(declare-fun lt!212370 () Unit!13687)

(assert (=> b!469042 (= lt!212370 lt!212373)))

(declare-fun lt!212378 () ListLongMap!7559)

(assert (=> b!469042 (= lt!212378 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212371 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212377 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212377 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212360 () Unit!13687)

(assert (=> b!469042 (= lt!212360 (addApplyDifferent!288 lt!212378 lt!212371 minValueBefore!38 lt!212377))))

(assert (=> b!469042 (= (apply!326 (+!1725 lt!212378 (tuple2!8657 lt!212371 minValueBefore!38)) lt!212377) (apply!326 lt!212378 lt!212377))))

(declare-fun lt!212381 () Unit!13687)

(assert (=> b!469042 (= lt!212381 lt!212360)))

(declare-fun lt!212374 () ListLongMap!7559)

(assert (=> b!469042 (= lt!212374 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212363 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212363 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212368 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212368 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212365 () Unit!13687)

(assert (=> b!469042 (= lt!212365 (addApplyDifferent!288 lt!212374 lt!212363 zeroValue!794 lt!212368))))

(assert (=> b!469042 (= (apply!326 (+!1725 lt!212374 (tuple2!8657 lt!212363 zeroValue!794)) lt!212368) (apply!326 lt!212374 lt!212368))))

(declare-fun lt!212364 () Unit!13687)

(assert (=> b!469042 (= lt!212364 lt!212365)))

(declare-fun lt!212380 () ListLongMap!7559)

(assert (=> b!469042 (= lt!212380 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212361 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212361 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212362 () (_ BitVec 64))

(assert (=> b!469042 (= lt!212362 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469042 (= lt!212367 (addApplyDifferent!288 lt!212380 lt!212361 minValueBefore!38 lt!212362))))

(assert (=> b!469042 (= (apply!326 (+!1725 lt!212380 (tuple2!8657 lt!212361 minValueBefore!38)) lt!212362) (apply!326 lt!212380 lt!212362))))

(declare-fun b!469043 () Bool)

(declare-fun e!274605 () ListLongMap!7559)

(assert (=> b!469043 (= e!274605 e!274606)))

(assert (=> b!469043 (= c!56825 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469044 () Bool)

(declare-fun res!280326 () Bool)

(assert (=> b!469044 (=> (not res!280326) (not e!274612))))

(assert (=> b!469044 (= res!280326 e!274610)))

(declare-fun c!56824 () Bool)

(assert (=> b!469044 (= c!56824 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469045 () Bool)

(assert (=> b!469045 (= e!274613 (= (apply!326 lt!212372 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun bm!30362 () Bool)

(assert (=> bm!30362 (= call!30364 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469046 () Bool)

(declare-fun e!274611 () Bool)

(assert (=> b!469046 (= e!274611 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469047 () Bool)

(declare-fun e!274607 () Bool)

(assert (=> b!469047 (= e!274607 (= (apply!326 lt!212372 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30363 () Bool)

(assert (=> bm!30363 (= call!30368 call!30366)))

(declare-fun b!469048 () Bool)

(declare-fun e!274608 () ListLongMap!7559)

(assert (=> b!469048 (= e!274608 call!30367)))

(declare-fun bm!30364 () Bool)

(assert (=> bm!30364 (= call!30365 call!30364)))

(declare-fun bm!30365 () Bool)

(assert (=> bm!30365 (= call!30362 (contains!2525 lt!212372 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469039 () Bool)

(assert (=> b!469039 (= e!274615 (validKeyInArray!0 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75089 () Bool)

(assert (=> d!75089 e!274612))

(declare-fun res!280319 () Bool)

(assert (=> d!75089 (=> (not res!280319) (not e!274612))))

(assert (=> d!75089 (= res!280319 (or (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))))

(declare-fun lt!212375 () ListLongMap!7559)

(assert (=> d!75089 (= lt!212372 lt!212375)))

(declare-fun lt!212379 () Unit!13687)

(assert (=> d!75089 (= lt!212379 e!274614)))

(declare-fun c!56822 () Bool)

(assert (=> d!75089 (= c!56822 e!274611)))

(declare-fun res!280327 () Bool)

(assert (=> d!75089 (=> (not res!280327) (not e!274611))))

(assert (=> d!75089 (= res!280327 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75089 (= lt!212375 e!274605)))

(assert (=> d!75089 (= c!56820 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75089 (validMask!0 mask!1365)))

(assert (=> d!75089 (= (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212372)))

(declare-fun b!469049 () Bool)

(assert (=> b!469049 (= e!274609 (= (apply!326 lt!212372 (select (arr!14318 _keys!1025) #b00000000000000000000000000000000)) (get!7007 (select (arr!14319 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(assert (=> b!469049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469050 () Bool)

(assert (=> b!469050 (= e!274610 e!274607)))

(declare-fun res!280320 () Bool)

(assert (=> b!469050 (= res!280320 call!30362)))

(assert (=> b!469050 (=> (not res!280320) (not e!274607))))

(declare-fun b!469051 () Bool)

(assert (=> b!469051 (= e!274605 (+!1725 call!30366 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!469052 () Bool)

(declare-fun c!56821 () Bool)

(assert (=> b!469052 (= c!56821 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!469052 (= e!274606 e!274608)))

(declare-fun b!469053 () Bool)

(assert (=> b!469053 (= e!274608 call!30368)))

(assert (= (and d!75089 c!56820) b!469051))

(assert (= (and d!75089 (not c!56820)) b!469043))

(assert (= (and b!469043 c!56825) b!469035))

(assert (= (and b!469043 (not c!56825)) b!469052))

(assert (= (and b!469052 c!56821) b!469053))

(assert (= (and b!469052 (not c!56821)) b!469048))

(assert (= (or b!469053 b!469048) bm!30359))

(assert (= (or b!469035 bm!30359) bm!30364))

(assert (= (or b!469035 b!469053) bm!30363))

(assert (= (or b!469051 bm!30364) bm!30362))

(assert (= (or b!469051 bm!30363) bm!30361))

(assert (= (and d!75089 res!280327) b!469046))

(assert (= (and d!75089 c!56822) b!469042))

(assert (= (and d!75089 (not c!56822)) b!469040))

(assert (= (and d!75089 res!280319) b!469034))

(assert (= (and b!469034 res!280322) b!469039))

(assert (= (and b!469034 (not res!280325)) b!469038))

(assert (= (and b!469038 res!280323) b!469049))

(assert (= (and b!469034 res!280324) b!469044))

(assert (= (and b!469044 c!56824) b!469050))

(assert (= (and b!469044 (not c!56824)) b!469041))

(assert (= (and b!469050 res!280320) b!469047))

(assert (= (or b!469050 b!469041) bm!30365))

(assert (= (and b!469044 res!280326) b!469036))

(assert (= (and b!469036 c!56823) b!469033))

(assert (= (and b!469036 (not c!56823)) b!469037))

(assert (= (and b!469033 res!280321) b!469045))

(assert (= (or b!469033 b!469037) bm!30360))

(declare-fun b_lambda!10081 () Bool)

(assert (=> (not b_lambda!10081) (not b!469049)))

(assert (=> b!469049 t!14684))

(declare-fun b_and!19975 () Bool)

(assert (= b_and!19973 (and (=> t!14684 result!7401) b_and!19975)))

(assert (=> b!469046 m!450565))

(assert (=> b!469046 m!450565))

(assert (=> b!469046 m!450583))

(declare-fun m!450709 () Bool)

(assert (=> bm!30365 m!450709))

(declare-fun m!450711 () Bool)

(assert (=> b!469042 m!450711))

(declare-fun m!450713 () Bool)

(assert (=> b!469042 m!450713))

(declare-fun m!450715 () Bool)

(assert (=> b!469042 m!450715))

(declare-fun m!450717 () Bool)

(assert (=> b!469042 m!450717))

(assert (=> b!469042 m!450711))

(declare-fun m!450719 () Bool)

(assert (=> b!469042 m!450719))

(assert (=> b!469042 m!450715))

(declare-fun m!450721 () Bool)

(assert (=> b!469042 m!450721))

(declare-fun m!450723 () Bool)

(assert (=> b!469042 m!450723))

(assert (=> b!469042 m!450565))

(declare-fun m!450725 () Bool)

(assert (=> b!469042 m!450725))

(declare-fun m!450727 () Bool)

(assert (=> b!469042 m!450727))

(assert (=> b!469042 m!450725))

(declare-fun m!450729 () Bool)

(assert (=> b!469042 m!450729))

(declare-fun m!450731 () Bool)

(assert (=> b!469042 m!450731))

(declare-fun m!450733 () Bool)

(assert (=> b!469042 m!450733))

(declare-fun m!450735 () Bool)

(assert (=> b!469042 m!450735))

(assert (=> b!469042 m!450473))

(declare-fun m!450737 () Bool)

(assert (=> b!469042 m!450737))

(assert (=> b!469042 m!450729))

(declare-fun m!450739 () Bool)

(assert (=> b!469042 m!450739))

(declare-fun m!450741 () Bool)

(assert (=> b!469047 m!450741))

(assert (=> bm!30362 m!450473))

(assert (=> d!75089 m!450491))

(declare-fun m!450743 () Bool)

(assert (=> b!469051 m!450743))

(declare-fun m!450745 () Bool)

(assert (=> bm!30360 m!450745))

(assert (=> b!469039 m!450565))

(assert (=> b!469039 m!450565))

(assert (=> b!469039 m!450583))

(assert (=> b!469049 m!450561))

(assert (=> b!469049 m!450565))

(declare-fun m!450747 () Bool)

(assert (=> b!469049 m!450747))

(assert (=> b!469049 m!450565))

(assert (=> b!469049 m!450559))

(assert (=> b!469049 m!450559))

(assert (=> b!469049 m!450561))

(assert (=> b!469049 m!450563))

(declare-fun m!450749 () Bool)

(assert (=> b!469045 m!450749))

(assert (=> b!469038 m!450565))

(assert (=> b!469038 m!450565))

(declare-fun m!450751 () Bool)

(assert (=> b!469038 m!450751))

(declare-fun m!450753 () Bool)

(assert (=> bm!30361 m!450753))

(assert (=> b!468827 d!75089))

(declare-fun d!75091 () Bool)

(assert (=> d!75091 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42000 d!75091))

(declare-fun d!75093 () Bool)

(assert (=> d!75093 (= (array_inv!10414 _keys!1025) (bvsge (size!14671 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42000 d!75093))

(declare-fun d!75095 () Bool)

(assert (=> d!75095 (= (array_inv!10415 _values!833) (bvsge (size!14672 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42000 d!75095))

(declare-fun condMapEmpty!21226 () Bool)

(declare-fun mapDefault!21226 () ValueCell!6164)

(assert (=> mapNonEmpty!21217 (= condMapEmpty!21226 (= mapRest!21217 ((as const (Array (_ BitVec 32) ValueCell!6164)) mapDefault!21226)))))

(declare-fun e!274623 () Bool)

(declare-fun mapRes!21226 () Bool)

(assert (=> mapNonEmpty!21217 (= tp!40776 (and e!274623 mapRes!21226))))

(declare-fun b!469061 () Bool)

(assert (=> b!469061 (= e!274623 tp_is_empty!13015)))

(declare-fun mapIsEmpty!21226 () Bool)

(assert (=> mapIsEmpty!21226 mapRes!21226))

(declare-fun b!469060 () Bool)

(declare-fun e!274622 () Bool)

(assert (=> b!469060 (= e!274622 tp_is_empty!13015)))

(declare-fun mapNonEmpty!21226 () Bool)

(declare-fun tp!40792 () Bool)

(assert (=> mapNonEmpty!21226 (= mapRes!21226 (and tp!40792 e!274622))))

(declare-fun mapKey!21226 () (_ BitVec 32))

(declare-fun mapRest!21226 () (Array (_ BitVec 32) ValueCell!6164))

(declare-fun mapValue!21226 () ValueCell!6164)

(assert (=> mapNonEmpty!21226 (= mapRest!21217 (store mapRest!21226 mapKey!21226 mapValue!21226))))

(assert (= (and mapNonEmpty!21217 condMapEmpty!21226) mapIsEmpty!21226))

(assert (= (and mapNonEmpty!21217 (not condMapEmpty!21226)) mapNonEmpty!21226))

(assert (= (and mapNonEmpty!21226 ((_ is ValueCellFull!6164) mapValue!21226)) b!469060))

(assert (= (and mapNonEmpty!21217 ((_ is ValueCellFull!6164) mapDefault!21226)) b!469061))

(declare-fun m!450755 () Bool)

(assert (=> mapNonEmpty!21226 m!450755))

(declare-fun b_lambda!10083 () Bool)

(assert (= b_lambda!10071 (or (and start!42000 b_free!11587) b_lambda!10083)))

(declare-fun b_lambda!10085 () Bool)

(assert (= b_lambda!10073 (or (and start!42000 b_free!11587) b_lambda!10085)))

(declare-fun b_lambda!10087 () Bool)

(assert (= b_lambda!10075 (or (and start!42000 b_free!11587) b_lambda!10087)))

(declare-fun b_lambda!10089 () Bool)

(assert (= b_lambda!10081 (or (and start!42000 b_free!11587) b_lambda!10089)))

(declare-fun b_lambda!10091 () Bool)

(assert (= b_lambda!10077 (or (and start!42000 b_free!11587) b_lambda!10091)))

(declare-fun b_lambda!10093 () Bool)

(assert (= b_lambda!10079 (or (and start!42000 b_free!11587) b_lambda!10093)))

(check-sat (not b!469042) (not b!468908) (not b!469018) (not d!75079) (not bm!30337) (not bm!30358) (not b!469031) (not d!75085) (not b!468915) (not b!469007) (not b!469016) (not b!468924) (not b!468943) (not b!468929) (not b!469020) (not b!468909) (not d!75069) (not d!75083) tp_is_empty!13015 (not b!468959) (not b!469029) (not b!468907) (not b!469051) (not d!75081) (not d!75071) (not b!468918) (not b!468958) (not b!468932) (not b!469045) (not b!469030) (not b!468917) (not b_lambda!10093) (not b!469038) (not b!468914) (not b!468957) (not bm!30334) (not bm!30330) (not b!469049) (not b_lambda!10087) (not bm!30353) (not b_lambda!10085) (not b!469008) b_and!19975 (not b_lambda!10091) (not mapNonEmpty!21226) (not bm!30354) (not b!469028) (not b!469032) (not b!468921) (not d!75087) (not b!468922) (not bm!30365) (not b!468944) (not b!468910) (not d!75073) (not b!469027) (not b!469039) (not b!469047) (not b!469011) (not b!469015) (not b!468931) (not b!469014) (not bm!30355) (not b!468928) (not b_lambda!10083) (not d!75089) (not b!469046) (not bm!30362) (not b_next!11587) (not bm!30331) (not b_lambda!10089) (not bm!30361) (not bm!30360) (not b!468923))
(check-sat b_and!19975 (not b_next!11587))

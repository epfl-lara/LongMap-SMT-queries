; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42702 () Bool)

(assert start!42702)

(declare-fun b_free!12069 () Bool)

(declare-fun b_next!12069 () Bool)

(assert (=> start!42702 (= b_free!12069 (not b_next!12069))))

(declare-fun tp!42258 () Bool)

(declare-fun b_and!20593 () Bool)

(assert (=> start!42702 (= tp!42258 b_and!20593)))

(declare-fun b!476270 () Bool)

(declare-fun res!284329 () Bool)

(declare-fun e!279729 () Bool)

(assert (=> b!476270 (=> (not res!284329) (not e!279729))))

(declare-datatypes ((array!30735 0))(
  ( (array!30736 (arr!14781 (Array (_ BitVec 32) (_ BitVec 64))) (size!15133 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30735)

(declare-datatypes ((List!9035 0))(
  ( (Nil!9032) (Cons!9031 (h!9887 (_ BitVec 64)) (t!15017 List!9035)) )
))
(declare-fun arrayNoDuplicates!0 (array!30735 (_ BitVec 32) List!9035) Bool)

(assert (=> b!476270 (= res!284329 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9032))))

(declare-fun b!476272 () Bool)

(declare-fun e!279728 () Bool)

(declare-fun e!279730 () Bool)

(declare-fun mapRes!21976 () Bool)

(assert (=> b!476272 (= e!279728 (and e!279730 mapRes!21976))))

(declare-fun condMapEmpty!21976 () Bool)

(declare-datatypes ((V!19101 0))(
  ( (V!19102 (val!6793 Int)) )
))
(declare-datatypes ((ValueCell!6405 0))(
  ( (ValueCellFull!6405 (v!9089 V!19101)) (EmptyCell!6405) )
))
(declare-datatypes ((array!30737 0))(
  ( (array!30738 (arr!14782 (Array (_ BitVec 32) ValueCell!6405)) (size!15134 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30737)

(declare-fun mapDefault!21976 () ValueCell!6405)

(assert (=> b!476272 (= condMapEmpty!21976 (= (arr!14782 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6405)) mapDefault!21976)))))

(declare-fun zeroValue!794 () V!19101)

(declare-fun b!476273 () Bool)

(declare-datatypes ((tuple2!8958 0))(
  ( (tuple2!8959 (_1!4490 (_ BitVec 64)) (_2!4490 V!19101)) )
))
(declare-datatypes ((List!9036 0))(
  ( (Nil!9033) (Cons!9032 (h!9888 tuple2!8958) (t!15018 List!9036)) )
))
(declare-datatypes ((ListLongMap!7871 0))(
  ( (ListLongMap!7872 (toList!3951 List!9036)) )
))
(declare-fun lt!217104 () ListLongMap!7871)

(declare-fun lt!217105 () tuple2!8958)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun defaultEntry!841 () Int)

(declare-fun e!279732 () Bool)

(declare-fun minValueAfter!38 () V!19101)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun +!1763 (ListLongMap!7871 tuple2!8958) ListLongMap!7871)

(declare-fun getCurrentListMap!2291 (array!30735 array!30737 (_ BitVec 32) (_ BitVec 32) V!19101 V!19101 (_ BitVec 32) Int) ListLongMap!7871)

(assert (=> b!476273 (= e!279732 (= (+!1763 lt!217104 lt!217105) (getCurrentListMap!2291 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun lt!217110 () ListLongMap!7871)

(declare-fun minValueBefore!38 () V!19101)

(assert (=> b!476273 (= (+!1763 lt!217110 lt!217105) (+!1763 (+!1763 lt!217110 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217105))))

(assert (=> b!476273 (= lt!217105 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!14028 0))(
  ( (Unit!14029) )
))
(declare-fun lt!217106 () Unit!14028)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!164 (ListLongMap!7871 (_ BitVec 64) V!19101 V!19101) Unit!14028)

(assert (=> b!476273 (= lt!217106 (addSameAsAddTwiceSameKeyDiffValues!164 lt!217110 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!217107 () ListLongMap!7871)

(assert (=> b!476273 (= lt!217110 (+!1763 lt!217107 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!476273 (= lt!217104 (getCurrentListMap!2291 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476274 () Bool)

(declare-fun res!284331 () Bool)

(assert (=> b!476274 (=> (not res!284331) (not e!279729))))

(assert (=> b!476274 (= res!284331 (and (= (size!15134 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15133 _keys!1025) (size!15134 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21976 () Bool)

(declare-fun tp!42259 () Bool)

(declare-fun e!279733 () Bool)

(assert (=> mapNonEmpty!21976 (= mapRes!21976 (and tp!42259 e!279733))))

(declare-fun mapValue!21976 () ValueCell!6405)

(declare-fun mapRest!21976 () (Array (_ BitVec 32) ValueCell!6405))

(declare-fun mapKey!21976 () (_ BitVec 32))

(assert (=> mapNonEmpty!21976 (= (arr!14782 _values!833) (store mapRest!21976 mapKey!21976 mapValue!21976))))

(declare-fun b!476275 () Bool)

(assert (=> b!476275 (= e!279729 (not e!279732))))

(declare-fun res!284328 () Bool)

(assert (=> b!476275 (=> res!284328 e!279732)))

(assert (=> b!476275 (= res!284328 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!217109 () ListLongMap!7871)

(assert (=> b!476275 (= lt!217107 lt!217109)))

(declare-fun lt!217108 () Unit!14028)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!267 (array!30735 array!30737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19101 V!19101 V!19101 V!19101 (_ BitVec 32) Int) Unit!14028)

(assert (=> b!476275 (= lt!217108 (lemmaNoChangeToArrayThenSameMapNoExtras!267 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2107 (array!30735 array!30737 (_ BitVec 32) (_ BitVec 32) V!19101 V!19101 (_ BitVec 32) Int) ListLongMap!7871)

(assert (=> b!476275 (= lt!217109 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!476275 (= lt!217107 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476276 () Bool)

(declare-fun tp_is_empty!13497 () Bool)

(assert (=> b!476276 (= e!279733 tp_is_empty!13497)))

(declare-fun mapIsEmpty!21976 () Bool)

(assert (=> mapIsEmpty!21976 mapRes!21976))

(declare-fun b!476277 () Bool)

(declare-fun res!284330 () Bool)

(assert (=> b!476277 (=> (not res!284330) (not e!279729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30735 (_ BitVec 32)) Bool)

(assert (=> b!476277 (= res!284330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!284332 () Bool)

(assert (=> start!42702 (=> (not res!284332) (not e!279729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42702 (= res!284332 (validMask!0 mask!1365))))

(assert (=> start!42702 e!279729))

(assert (=> start!42702 tp_is_empty!13497))

(assert (=> start!42702 tp!42258))

(assert (=> start!42702 true))

(declare-fun array_inv!10666 (array!30735) Bool)

(assert (=> start!42702 (array_inv!10666 _keys!1025)))

(declare-fun array_inv!10667 (array!30737) Bool)

(assert (=> start!42702 (and (array_inv!10667 _values!833) e!279728)))

(declare-fun b!476271 () Bool)

(assert (=> b!476271 (= e!279730 tp_is_empty!13497)))

(assert (= (and start!42702 res!284332) b!476274))

(assert (= (and b!476274 res!284331) b!476277))

(assert (= (and b!476277 res!284330) b!476270))

(assert (= (and b!476270 res!284329) b!476275))

(assert (= (and b!476275 (not res!284328)) b!476273))

(assert (= (and b!476272 condMapEmpty!21976) mapIsEmpty!21976))

(assert (= (and b!476272 (not condMapEmpty!21976)) mapNonEmpty!21976))

(get-info :version)

(assert (= (and mapNonEmpty!21976 ((_ is ValueCellFull!6405) mapValue!21976)) b!476276))

(assert (= (and b!476272 ((_ is ValueCellFull!6405) mapDefault!21976)) b!476271))

(assert (= start!42702 b!476272))

(declare-fun m!458505 () Bool)

(assert (=> b!476273 m!458505))

(declare-fun m!458507 () Bool)

(assert (=> b!476273 m!458507))

(declare-fun m!458509 () Bool)

(assert (=> b!476273 m!458509))

(assert (=> b!476273 m!458509))

(declare-fun m!458511 () Bool)

(assert (=> b!476273 m!458511))

(declare-fun m!458513 () Bool)

(assert (=> b!476273 m!458513))

(declare-fun m!458515 () Bool)

(assert (=> b!476273 m!458515))

(declare-fun m!458517 () Bool)

(assert (=> b!476273 m!458517))

(declare-fun m!458519 () Bool)

(assert (=> b!476273 m!458519))

(declare-fun m!458521 () Bool)

(assert (=> b!476270 m!458521))

(declare-fun m!458523 () Bool)

(assert (=> mapNonEmpty!21976 m!458523))

(declare-fun m!458525 () Bool)

(assert (=> b!476277 m!458525))

(declare-fun m!458527 () Bool)

(assert (=> start!42702 m!458527))

(declare-fun m!458529 () Bool)

(assert (=> start!42702 m!458529))

(declare-fun m!458531 () Bool)

(assert (=> start!42702 m!458531))

(declare-fun m!458533 () Bool)

(assert (=> b!476275 m!458533))

(declare-fun m!458535 () Bool)

(assert (=> b!476275 m!458535))

(declare-fun m!458537 () Bool)

(assert (=> b!476275 m!458537))

(check-sat b_and!20593 (not b!476277) tp_is_empty!13497 (not mapNonEmpty!21976) (not b!476273) (not b!476275) (not b_next!12069) (not b!476270) (not start!42702))
(check-sat b_and!20593 (not b_next!12069))
(get-model)

(declare-fun d!75703 () Bool)

(assert (=> d!75703 (= (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217134 () Unit!14028)

(declare-fun choose!1359 (array!30735 array!30737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19101 V!19101 V!19101 V!19101 (_ BitVec 32) Int) Unit!14028)

(assert (=> d!75703 (= lt!217134 (choose!1359 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75703 (validMask!0 mask!1365)))

(assert (=> d!75703 (= (lemmaNoChangeToArrayThenSameMapNoExtras!267 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217134)))

(declare-fun bs!15118 () Bool)

(assert (= bs!15118 d!75703))

(assert (=> bs!15118 m!458537))

(assert (=> bs!15118 m!458535))

(declare-fun m!458573 () Bool)

(assert (=> bs!15118 m!458573))

(assert (=> bs!15118 m!458527))

(assert (=> b!476275 d!75703))

(declare-fun b!476326 () Bool)

(declare-fun lt!217152 () ListLongMap!7871)

(declare-fun e!279772 () Bool)

(assert (=> b!476326 (= e!279772 (= lt!217152 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun call!30695 () ListLongMap!7871)

(declare-fun bm!30692 () Bool)

(assert (=> bm!30692 (= call!30695 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476327 () Bool)

(declare-fun e!279768 () Bool)

(assert (=> b!476327 (= e!279768 e!279772)))

(declare-fun c!57311 () Bool)

(assert (=> b!476327 (= c!57311 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476328 () Bool)

(declare-fun e!279766 () Bool)

(assert (=> b!476328 (= e!279768 e!279766)))

(assert (=> b!476328 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun res!284358 () Bool)

(declare-fun contains!2565 (ListLongMap!7871 (_ BitVec 64)) Bool)

(assert (=> b!476328 (= res!284358 (contains!2565 lt!217152 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476328 (=> (not res!284358) (not e!279766))))

(declare-fun d!75705 () Bool)

(declare-fun e!279769 () Bool)

(assert (=> d!75705 e!279769))

(declare-fun res!284359 () Bool)

(assert (=> d!75705 (=> (not res!284359) (not e!279769))))

(assert (=> d!75705 (= res!284359 (not (contains!2565 lt!217152 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279771 () ListLongMap!7871)

(assert (=> d!75705 (= lt!217152 e!279771)))

(declare-fun c!57309 () Bool)

(assert (=> d!75705 (= c!57309 (bvsge #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> d!75705 (validMask!0 mask!1365)))

(assert (=> d!75705 (= (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217152)))

(declare-fun b!476329 () Bool)

(assert (=> b!476329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> b!476329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15134 _values!833)))))

(declare-fun apply!338 (ListLongMap!7871 (_ BitVec 64)) V!19101)

(declare-fun get!7173 (ValueCell!6405 V!19101) V!19101)

(declare-fun dynLambda!931 (Int (_ BitVec 64)) V!19101)

(assert (=> b!476329 (= e!279766 (= (apply!338 lt!217152 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476330 () Bool)

(declare-fun e!279770 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!476330 (= e!279770 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476330 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!476331 () Bool)

(declare-fun isEmpty!585 (ListLongMap!7871) Bool)

(assert (=> b!476331 (= e!279772 (isEmpty!585 lt!217152))))

(declare-fun b!476332 () Bool)

(declare-fun res!284356 () Bool)

(assert (=> b!476332 (=> (not res!284356) (not e!279769))))

(assert (=> b!476332 (= res!284356 (not (contains!2565 lt!217152 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476333 () Bool)

(declare-fun e!279767 () ListLongMap!7871)

(assert (=> b!476333 (= e!279767 call!30695)))

(declare-fun b!476334 () Bool)

(assert (=> b!476334 (= e!279769 e!279768)))

(declare-fun c!57312 () Bool)

(assert (=> b!476334 (= c!57312 e!279770)))

(declare-fun res!284357 () Bool)

(assert (=> b!476334 (=> (not res!284357) (not e!279770))))

(assert (=> b!476334 (= res!284357 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476335 () Bool)

(assert (=> b!476335 (= e!279771 (ListLongMap!7872 Nil!9033))))

(declare-fun b!476336 () Bool)

(declare-fun lt!217153 () Unit!14028)

(declare-fun lt!217150 () Unit!14028)

(assert (=> b!476336 (= lt!217153 lt!217150)))

(declare-fun lt!217151 () (_ BitVec 64))

(declare-fun lt!217154 () V!19101)

(declare-fun lt!217155 () (_ BitVec 64))

(declare-fun lt!217149 () ListLongMap!7871)

(assert (=> b!476336 (not (contains!2565 (+!1763 lt!217149 (tuple2!8959 lt!217155 lt!217154)) lt!217151))))

(declare-fun addStillNotContains!171 (ListLongMap!7871 (_ BitVec 64) V!19101 (_ BitVec 64)) Unit!14028)

(assert (=> b!476336 (= lt!217150 (addStillNotContains!171 lt!217149 lt!217155 lt!217154 lt!217151))))

(assert (=> b!476336 (= lt!217151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476336 (= lt!217154 (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476336 (= lt!217155 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476336 (= lt!217149 call!30695)))

(assert (=> b!476336 (= e!279767 (+!1763 call!30695 (tuple2!8959 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000) (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476337 () Bool)

(assert (=> b!476337 (= e!279771 e!279767)))

(declare-fun c!57310 () Bool)

(assert (=> b!476337 (= c!57310 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75705 c!57309) b!476335))

(assert (= (and d!75705 (not c!57309)) b!476337))

(assert (= (and b!476337 c!57310) b!476336))

(assert (= (and b!476337 (not c!57310)) b!476333))

(assert (= (or b!476336 b!476333) bm!30692))

(assert (= (and d!75705 res!284359) b!476332))

(assert (= (and b!476332 res!284356) b!476334))

(assert (= (and b!476334 res!284357) b!476330))

(assert (= (and b!476334 c!57312) b!476328))

(assert (= (and b!476334 (not c!57312)) b!476327))

(assert (= (and b!476328 res!284358) b!476329))

(assert (= (and b!476327 c!57311) b!476326))

(assert (= (and b!476327 (not c!57311)) b!476331))

(declare-fun b_lambda!10341 () Bool)

(assert (=> (not b_lambda!10341) (not b!476329)))

(declare-fun t!15021 () Bool)

(declare-fun tb!3941 () Bool)

(assert (=> (and start!42702 (= defaultEntry!841 defaultEntry!841) t!15021) tb!3941))

(declare-fun result!7481 () Bool)

(assert (=> tb!3941 (= result!7481 tp_is_empty!13497)))

(assert (=> b!476329 t!15021))

(declare-fun b_and!20597 () Bool)

(assert (= b_and!20593 (and (=> t!15021 result!7481) b_and!20597)))

(declare-fun b_lambda!10343 () Bool)

(assert (=> (not b_lambda!10343) (not b!476336)))

(assert (=> b!476336 t!15021))

(declare-fun b_and!20599 () Bool)

(assert (= b_and!20597 (and (=> t!15021 result!7481) b_and!20599)))

(declare-fun m!458575 () Bool)

(assert (=> b!476330 m!458575))

(assert (=> b!476330 m!458575))

(declare-fun m!458577 () Bool)

(assert (=> b!476330 m!458577))

(declare-fun m!458579 () Bool)

(assert (=> b!476329 m!458579))

(declare-fun m!458581 () Bool)

(assert (=> b!476329 m!458581))

(declare-fun m!458583 () Bool)

(assert (=> b!476329 m!458583))

(assert (=> b!476329 m!458575))

(assert (=> b!476329 m!458575))

(declare-fun m!458585 () Bool)

(assert (=> b!476329 m!458585))

(assert (=> b!476329 m!458579))

(assert (=> b!476329 m!458581))

(declare-fun m!458587 () Bool)

(assert (=> b!476332 m!458587))

(assert (=> b!476337 m!458575))

(assert (=> b!476337 m!458575))

(assert (=> b!476337 m!458577))

(assert (=> b!476336 m!458579))

(assert (=> b!476336 m!458581))

(assert (=> b!476336 m!458583))

(assert (=> b!476336 m!458575))

(declare-fun m!458589 () Bool)

(assert (=> b!476336 m!458589))

(declare-fun m!458591 () Bool)

(assert (=> b!476336 m!458591))

(assert (=> b!476336 m!458579))

(declare-fun m!458593 () Bool)

(assert (=> b!476336 m!458593))

(declare-fun m!458595 () Bool)

(assert (=> b!476336 m!458595))

(assert (=> b!476336 m!458581))

(assert (=> b!476336 m!458593))

(declare-fun m!458597 () Bool)

(assert (=> d!75705 m!458597))

(assert (=> d!75705 m!458527))

(declare-fun m!458599 () Bool)

(assert (=> b!476326 m!458599))

(assert (=> b!476328 m!458575))

(assert (=> b!476328 m!458575))

(declare-fun m!458601 () Bool)

(assert (=> b!476328 m!458601))

(declare-fun m!458603 () Bool)

(assert (=> b!476331 m!458603))

(assert (=> bm!30692 m!458599))

(assert (=> b!476275 d!75705))

(declare-fun lt!217159 () ListLongMap!7871)

(declare-fun e!279779 () Bool)

(declare-fun b!476340 () Bool)

(assert (=> b!476340 (= e!279779 (= lt!217159 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30693 () Bool)

(declare-fun call!30696 () ListLongMap!7871)

(assert (=> bm!30693 (= call!30696 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476341 () Bool)

(declare-fun e!279775 () Bool)

(assert (=> b!476341 (= e!279775 e!279779)))

(declare-fun c!57315 () Bool)

(assert (=> b!476341 (= c!57315 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476342 () Bool)

(declare-fun e!279773 () Bool)

(assert (=> b!476342 (= e!279775 e!279773)))

(assert (=> b!476342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun res!284362 () Bool)

(assert (=> b!476342 (= res!284362 (contains!2565 lt!217159 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476342 (=> (not res!284362) (not e!279773))))

(declare-fun d!75707 () Bool)

(declare-fun e!279776 () Bool)

(assert (=> d!75707 e!279776))

(declare-fun res!284363 () Bool)

(assert (=> d!75707 (=> (not res!284363) (not e!279776))))

(assert (=> d!75707 (= res!284363 (not (contains!2565 lt!217159 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279778 () ListLongMap!7871)

(assert (=> d!75707 (= lt!217159 e!279778)))

(declare-fun c!57313 () Bool)

(assert (=> d!75707 (= c!57313 (bvsge #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> d!75707 (validMask!0 mask!1365)))

(assert (=> d!75707 (= (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217159)))

(declare-fun b!476343 () Bool)

(assert (=> b!476343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> b!476343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15134 _values!833)))))

(assert (=> b!476343 (= e!279773 (= (apply!338 lt!217159 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476344 () Bool)

(declare-fun e!279777 () Bool)

(assert (=> b!476344 (= e!279777 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476344 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!476345 () Bool)

(assert (=> b!476345 (= e!279779 (isEmpty!585 lt!217159))))

(declare-fun b!476346 () Bool)

(declare-fun res!284360 () Bool)

(assert (=> b!476346 (=> (not res!284360) (not e!279776))))

(assert (=> b!476346 (= res!284360 (not (contains!2565 lt!217159 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476347 () Bool)

(declare-fun e!279774 () ListLongMap!7871)

(assert (=> b!476347 (= e!279774 call!30696)))

(declare-fun b!476348 () Bool)

(assert (=> b!476348 (= e!279776 e!279775)))

(declare-fun c!57316 () Bool)

(assert (=> b!476348 (= c!57316 e!279777)))

(declare-fun res!284361 () Bool)

(assert (=> b!476348 (=> (not res!284361) (not e!279777))))

(assert (=> b!476348 (= res!284361 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476349 () Bool)

(assert (=> b!476349 (= e!279778 (ListLongMap!7872 Nil!9033))))

(declare-fun b!476350 () Bool)

(declare-fun lt!217160 () Unit!14028)

(declare-fun lt!217157 () Unit!14028)

(assert (=> b!476350 (= lt!217160 lt!217157)))

(declare-fun lt!217156 () ListLongMap!7871)

(declare-fun lt!217158 () (_ BitVec 64))

(declare-fun lt!217161 () V!19101)

(declare-fun lt!217162 () (_ BitVec 64))

(assert (=> b!476350 (not (contains!2565 (+!1763 lt!217156 (tuple2!8959 lt!217162 lt!217161)) lt!217158))))

(assert (=> b!476350 (= lt!217157 (addStillNotContains!171 lt!217156 lt!217162 lt!217161 lt!217158))))

(assert (=> b!476350 (= lt!217158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476350 (= lt!217161 (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476350 (= lt!217162 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476350 (= lt!217156 call!30696)))

(assert (=> b!476350 (= e!279774 (+!1763 call!30696 (tuple2!8959 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000) (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476351 () Bool)

(assert (=> b!476351 (= e!279778 e!279774)))

(declare-fun c!57314 () Bool)

(assert (=> b!476351 (= c!57314 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75707 c!57313) b!476349))

(assert (= (and d!75707 (not c!57313)) b!476351))

(assert (= (and b!476351 c!57314) b!476350))

(assert (= (and b!476351 (not c!57314)) b!476347))

(assert (= (or b!476350 b!476347) bm!30693))

(assert (= (and d!75707 res!284363) b!476346))

(assert (= (and b!476346 res!284360) b!476348))

(assert (= (and b!476348 res!284361) b!476344))

(assert (= (and b!476348 c!57316) b!476342))

(assert (= (and b!476348 (not c!57316)) b!476341))

(assert (= (and b!476342 res!284362) b!476343))

(assert (= (and b!476341 c!57315) b!476340))

(assert (= (and b!476341 (not c!57315)) b!476345))

(declare-fun b_lambda!10345 () Bool)

(assert (=> (not b_lambda!10345) (not b!476343)))

(assert (=> b!476343 t!15021))

(declare-fun b_and!20601 () Bool)

(assert (= b_and!20599 (and (=> t!15021 result!7481) b_and!20601)))

(declare-fun b_lambda!10347 () Bool)

(assert (=> (not b_lambda!10347) (not b!476350)))

(assert (=> b!476350 t!15021))

(declare-fun b_and!20603 () Bool)

(assert (= b_and!20601 (and (=> t!15021 result!7481) b_and!20603)))

(assert (=> b!476344 m!458575))

(assert (=> b!476344 m!458575))

(assert (=> b!476344 m!458577))

(assert (=> b!476343 m!458579))

(assert (=> b!476343 m!458581))

(assert (=> b!476343 m!458583))

(assert (=> b!476343 m!458575))

(assert (=> b!476343 m!458575))

(declare-fun m!458605 () Bool)

(assert (=> b!476343 m!458605))

(assert (=> b!476343 m!458579))

(assert (=> b!476343 m!458581))

(declare-fun m!458607 () Bool)

(assert (=> b!476346 m!458607))

(assert (=> b!476351 m!458575))

(assert (=> b!476351 m!458575))

(assert (=> b!476351 m!458577))

(assert (=> b!476350 m!458579))

(assert (=> b!476350 m!458581))

(assert (=> b!476350 m!458583))

(assert (=> b!476350 m!458575))

(declare-fun m!458609 () Bool)

(assert (=> b!476350 m!458609))

(declare-fun m!458611 () Bool)

(assert (=> b!476350 m!458611))

(assert (=> b!476350 m!458579))

(declare-fun m!458613 () Bool)

(assert (=> b!476350 m!458613))

(declare-fun m!458615 () Bool)

(assert (=> b!476350 m!458615))

(assert (=> b!476350 m!458581))

(assert (=> b!476350 m!458613))

(declare-fun m!458617 () Bool)

(assert (=> d!75707 m!458617))

(assert (=> d!75707 m!458527))

(declare-fun m!458619 () Bool)

(assert (=> b!476340 m!458619))

(assert (=> b!476342 m!458575))

(assert (=> b!476342 m!458575))

(declare-fun m!458621 () Bool)

(assert (=> b!476342 m!458621))

(declare-fun m!458623 () Bool)

(assert (=> b!476345 m!458623))

(assert (=> bm!30693 m!458619))

(assert (=> b!476275 d!75707))

(declare-fun bm!30708 () Bool)

(declare-fun call!30714 () ListLongMap!7871)

(declare-fun call!30717 () ListLongMap!7871)

(assert (=> bm!30708 (= call!30714 call!30717)))

(declare-fun bm!30709 () Bool)

(declare-fun call!30715 () ListLongMap!7871)

(declare-fun call!30711 () ListLongMap!7871)

(assert (=> bm!30709 (= call!30715 call!30711)))

(declare-fun b!476394 () Bool)

(declare-fun e!279815 () Unit!14028)

(declare-fun Unit!14032 () Unit!14028)

(assert (=> b!476394 (= e!279815 Unit!14032)))

(declare-fun bm!30710 () Bool)

(declare-fun call!30716 () Bool)

(declare-fun lt!217208 () ListLongMap!7871)

(assert (=> bm!30710 (= call!30716 (contains!2565 lt!217208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476395 () Bool)

(declare-fun e!279818 () Bool)

(assert (=> b!476395 (= e!279818 (= (apply!338 lt!217208 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!476396 () Bool)

(declare-fun e!279811 () ListLongMap!7871)

(assert (=> b!476396 (= e!279811 call!30714)))

(declare-fun b!476397 () Bool)

(declare-fun e!279809 () Bool)

(assert (=> b!476397 (= e!279809 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476398 () Bool)

(declare-fun e!279810 () Bool)

(assert (=> b!476398 (= e!279810 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30711 () Bool)

(declare-fun call!30713 () ListLongMap!7871)

(assert (=> bm!30711 (= call!30713 call!30715)))

(declare-fun b!476399 () Bool)

(declare-fun e!279806 () Bool)

(declare-fun e!279814 () Bool)

(assert (=> b!476399 (= e!279806 e!279814)))

(declare-fun c!57332 () Bool)

(assert (=> b!476399 (= c!57332 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476400 () Bool)

(declare-fun e!279817 () Bool)

(declare-fun e!279808 () Bool)

(assert (=> b!476400 (= e!279817 e!279808)))

(declare-fun res!284387 () Bool)

(assert (=> b!476400 (= res!284387 call!30716)))

(assert (=> b!476400 (=> (not res!284387) (not e!279808))))

(declare-fun b!476401 () Bool)

(assert (=> b!476401 (= e!279814 e!279818)))

(declare-fun res!284382 () Bool)

(declare-fun call!30712 () Bool)

(assert (=> b!476401 (= res!284382 call!30712)))

(assert (=> b!476401 (=> (not res!284382) (not e!279818))))

(declare-fun bm!30713 () Bool)

(assert (=> bm!30713 (= call!30711 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476402 () Bool)

(declare-fun e!279816 () ListLongMap!7871)

(assert (=> b!476402 (= e!279816 (+!1763 call!30717 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!476403 () Bool)

(declare-fun res!284388 () Bool)

(assert (=> b!476403 (=> (not res!284388) (not e!279806))))

(declare-fun e!279812 () Bool)

(assert (=> b!476403 (= res!284388 e!279812)))

(declare-fun res!284384 () Bool)

(assert (=> b!476403 (=> res!284384 e!279812)))

(assert (=> b!476403 (= res!284384 (not e!279809))))

(declare-fun res!284386 () Bool)

(assert (=> b!476403 (=> (not res!284386) (not e!279809))))

(assert (=> b!476403 (= res!284386 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476404 () Bool)

(declare-fun e!279813 () ListLongMap!7871)

(assert (=> b!476404 (= e!279813 call!30714)))

(declare-fun b!476405 () Bool)

(assert (=> b!476405 (= e!279808 (= (apply!338 lt!217208 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun e!279807 () Bool)

(declare-fun b!476406 () Bool)

(assert (=> b!476406 (= e!279807 (= (apply!338 lt!217208 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15134 _values!833)))))

(assert (=> b!476406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476407 () Bool)

(declare-fun lt!217213 () Unit!14028)

(assert (=> b!476407 (= e!279815 lt!217213)))

(declare-fun lt!217207 () ListLongMap!7871)

(assert (=> b!476407 (= lt!217207 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217224 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217228 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217228 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217217 () Unit!14028)

(declare-fun addStillContains!296 (ListLongMap!7871 (_ BitVec 64) V!19101 (_ BitVec 64)) Unit!14028)

(assert (=> b!476407 (= lt!217217 (addStillContains!296 lt!217207 lt!217224 zeroValue!794 lt!217228))))

(assert (=> b!476407 (contains!2565 (+!1763 lt!217207 (tuple2!8959 lt!217224 zeroValue!794)) lt!217228)))

(declare-fun lt!217220 () Unit!14028)

(assert (=> b!476407 (= lt!217220 lt!217217)))

(declare-fun lt!217223 () ListLongMap!7871)

(assert (=> b!476407 (= lt!217223 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217218 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217218 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217219 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217219 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217221 () Unit!14028)

(declare-fun addApplyDifferent!296 (ListLongMap!7871 (_ BitVec 64) V!19101 (_ BitVec 64)) Unit!14028)

(assert (=> b!476407 (= lt!217221 (addApplyDifferent!296 lt!217223 lt!217218 minValueAfter!38 lt!217219))))

(assert (=> b!476407 (= (apply!338 (+!1763 lt!217223 (tuple2!8959 lt!217218 minValueAfter!38)) lt!217219) (apply!338 lt!217223 lt!217219))))

(declare-fun lt!217214 () Unit!14028)

(assert (=> b!476407 (= lt!217214 lt!217221)))

(declare-fun lt!217216 () ListLongMap!7871)

(assert (=> b!476407 (= lt!217216 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217215 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217227 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217227 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217210 () Unit!14028)

(assert (=> b!476407 (= lt!217210 (addApplyDifferent!296 lt!217216 lt!217215 zeroValue!794 lt!217227))))

(assert (=> b!476407 (= (apply!338 (+!1763 lt!217216 (tuple2!8959 lt!217215 zeroValue!794)) lt!217227) (apply!338 lt!217216 lt!217227))))

(declare-fun lt!217226 () Unit!14028)

(assert (=> b!476407 (= lt!217226 lt!217210)))

(declare-fun lt!217209 () ListLongMap!7871)

(assert (=> b!476407 (= lt!217209 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217212 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217212 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217222 () (_ BitVec 64))

(assert (=> b!476407 (= lt!217222 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476407 (= lt!217213 (addApplyDifferent!296 lt!217209 lt!217212 minValueAfter!38 lt!217222))))

(assert (=> b!476407 (= (apply!338 (+!1763 lt!217209 (tuple2!8959 lt!217212 minValueAfter!38)) lt!217222) (apply!338 lt!217209 lt!217222))))

(declare-fun b!476408 () Bool)

(declare-fun res!284385 () Bool)

(assert (=> b!476408 (=> (not res!284385) (not e!279806))))

(assert (=> b!476408 (= res!284385 e!279817)))

(declare-fun c!57331 () Bool)

(assert (=> b!476408 (= c!57331 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!75709 () Bool)

(assert (=> d!75709 e!279806))

(declare-fun res!284383 () Bool)

(assert (=> d!75709 (=> (not res!284383) (not e!279806))))

(assert (=> d!75709 (= res!284383 (or (bvsge #b00000000000000000000000000000000 (size!15133 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))))

(declare-fun lt!217211 () ListLongMap!7871)

(assert (=> d!75709 (= lt!217208 lt!217211)))

(declare-fun lt!217225 () Unit!14028)

(assert (=> d!75709 (= lt!217225 e!279815)))

(declare-fun c!57330 () Bool)

(assert (=> d!75709 (= c!57330 e!279810)))

(declare-fun res!284389 () Bool)

(assert (=> d!75709 (=> (not res!284389) (not e!279810))))

(assert (=> d!75709 (= res!284389 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> d!75709 (= lt!217211 e!279816)))

(declare-fun c!57333 () Bool)

(assert (=> d!75709 (= c!57333 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75709 (validMask!0 mask!1365)))

(assert (=> d!75709 (= (getCurrentListMap!2291 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217208)))

(declare-fun c!57334 () Bool)

(declare-fun bm!30712 () Bool)

(assert (=> bm!30712 (= call!30717 (+!1763 (ite c!57333 call!30711 (ite c!57334 call!30715 call!30713)) (ite (or c!57333 c!57334) (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!476409 () Bool)

(assert (=> b!476409 (= e!279811 call!30713)))

(declare-fun b!476410 () Bool)

(assert (=> b!476410 (= e!279816 e!279813)))

(assert (=> b!476410 (= c!57334 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30714 () Bool)

(assert (=> bm!30714 (= call!30712 (contains!2565 lt!217208 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476411 () Bool)

(assert (=> b!476411 (= e!279814 (not call!30712))))

(declare-fun b!476412 () Bool)

(declare-fun c!57329 () Bool)

(assert (=> b!476412 (= c!57329 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!476412 (= e!279813 e!279811)))

(declare-fun b!476413 () Bool)

(assert (=> b!476413 (= e!279812 e!279807)))

(declare-fun res!284390 () Bool)

(assert (=> b!476413 (=> (not res!284390) (not e!279807))))

(assert (=> b!476413 (= res!284390 (contains!2565 lt!217208 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476414 () Bool)

(assert (=> b!476414 (= e!279817 (not call!30716))))

(assert (= (and d!75709 c!57333) b!476402))

(assert (= (and d!75709 (not c!57333)) b!476410))

(assert (= (and b!476410 c!57334) b!476404))

(assert (= (and b!476410 (not c!57334)) b!476412))

(assert (= (and b!476412 c!57329) b!476396))

(assert (= (and b!476412 (not c!57329)) b!476409))

(assert (= (or b!476396 b!476409) bm!30711))

(assert (= (or b!476404 bm!30711) bm!30709))

(assert (= (or b!476404 b!476396) bm!30708))

(assert (= (or b!476402 bm!30709) bm!30713))

(assert (= (or b!476402 bm!30708) bm!30712))

(assert (= (and d!75709 res!284389) b!476398))

(assert (= (and d!75709 c!57330) b!476407))

(assert (= (and d!75709 (not c!57330)) b!476394))

(assert (= (and d!75709 res!284383) b!476403))

(assert (= (and b!476403 res!284386) b!476397))

(assert (= (and b!476403 (not res!284384)) b!476413))

(assert (= (and b!476413 res!284390) b!476406))

(assert (= (and b!476403 res!284388) b!476408))

(assert (= (and b!476408 c!57331) b!476400))

(assert (= (and b!476408 (not c!57331)) b!476414))

(assert (= (and b!476400 res!284387) b!476405))

(assert (= (or b!476400 b!476414) bm!30710))

(assert (= (and b!476408 res!284385) b!476399))

(assert (= (and b!476399 c!57332) b!476401))

(assert (= (and b!476399 (not c!57332)) b!476411))

(assert (= (and b!476401 res!284382) b!476395))

(assert (= (or b!476401 b!476411) bm!30714))

(declare-fun b_lambda!10349 () Bool)

(assert (=> (not b_lambda!10349) (not b!476406)))

(assert (=> b!476406 t!15021))

(declare-fun b_and!20605 () Bool)

(assert (= b_and!20603 (and (=> t!15021 result!7481) b_and!20605)))

(assert (=> b!476398 m!458575))

(assert (=> b!476398 m!458575))

(assert (=> b!476398 m!458577))

(declare-fun m!458625 () Bool)

(assert (=> bm!30712 m!458625))

(assert (=> b!476406 m!458579))

(assert (=> b!476406 m!458581))

(assert (=> b!476406 m!458583))

(assert (=> b!476406 m!458579))

(assert (=> b!476406 m!458581))

(assert (=> b!476406 m!458575))

(declare-fun m!458627 () Bool)

(assert (=> b!476406 m!458627))

(assert (=> b!476406 m!458575))

(declare-fun m!458629 () Bool)

(assert (=> b!476407 m!458629))

(declare-fun m!458631 () Bool)

(assert (=> b!476407 m!458631))

(declare-fun m!458633 () Bool)

(assert (=> b!476407 m!458633))

(declare-fun m!458635 () Bool)

(assert (=> b!476407 m!458635))

(declare-fun m!458637 () Bool)

(assert (=> b!476407 m!458637))

(declare-fun m!458639 () Bool)

(assert (=> b!476407 m!458639))

(declare-fun m!458641 () Bool)

(assert (=> b!476407 m!458641))

(declare-fun m!458643 () Bool)

(assert (=> b!476407 m!458643))

(declare-fun m!458645 () Bool)

(assert (=> b!476407 m!458645))

(declare-fun m!458647 () Bool)

(assert (=> b!476407 m!458647))

(declare-fun m!458649 () Bool)

(assert (=> b!476407 m!458649))

(assert (=> b!476407 m!458575))

(assert (=> b!476407 m!458637))

(declare-fun m!458651 () Bool)

(assert (=> b!476407 m!458651))

(assert (=> b!476407 m!458643))

(assert (=> b!476407 m!458633))

(declare-fun m!458653 () Bool)

(assert (=> b!476407 m!458653))

(assert (=> b!476407 m!458535))

(declare-fun m!458655 () Bool)

(assert (=> b!476407 m!458655))

(assert (=> b!476407 m!458635))

(declare-fun m!458657 () Bool)

(assert (=> b!476407 m!458657))

(declare-fun m!458659 () Bool)

(assert (=> bm!30710 m!458659))

(assert (=> d!75709 m!458527))

(declare-fun m!458661 () Bool)

(assert (=> b!476395 m!458661))

(declare-fun m!458663 () Bool)

(assert (=> b!476402 m!458663))

(declare-fun m!458665 () Bool)

(assert (=> bm!30714 m!458665))

(declare-fun m!458667 () Bool)

(assert (=> b!476405 m!458667))

(assert (=> b!476397 m!458575))

(assert (=> b!476397 m!458575))

(assert (=> b!476397 m!458577))

(assert (=> bm!30713 m!458535))

(assert (=> b!476413 m!458575))

(assert (=> b!476413 m!458575))

(declare-fun m!458669 () Bool)

(assert (=> b!476413 m!458669))

(assert (=> b!476273 d!75709))

(declare-fun d!75711 () Bool)

(declare-fun e!279821 () Bool)

(assert (=> d!75711 e!279821))

(declare-fun res!284395 () Bool)

(assert (=> d!75711 (=> (not res!284395) (not e!279821))))

(declare-fun lt!217237 () ListLongMap!7871)

(assert (=> d!75711 (= res!284395 (contains!2565 lt!217237 (_1!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!217240 () List!9036)

(assert (=> d!75711 (= lt!217237 (ListLongMap!7872 lt!217240))))

(declare-fun lt!217238 () Unit!14028)

(declare-fun lt!217239 () Unit!14028)

(assert (=> d!75711 (= lt!217238 lt!217239)))

(declare-datatypes ((Option!391 0))(
  ( (Some!390 (v!9091 V!19101)) (None!389) )
))
(declare-fun getValueByKey!385 (List!9036 (_ BitVec 64)) Option!391)

(assert (=> d!75711 (= (getValueByKey!385 lt!217240 (_1!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!390 (_2!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!207 (List!9036 (_ BitVec 64) V!19101) Unit!14028)

(assert (=> d!75711 (= lt!217239 (lemmaContainsTupThenGetReturnValue!207 lt!217240 (_1!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!210 (List!9036 (_ BitVec 64) V!19101) List!9036)

(assert (=> d!75711 (= lt!217240 (insertStrictlySorted!210 (toList!3951 lt!217110) (_1!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75711 (= (+!1763 lt!217110 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217237)))

(declare-fun b!476419 () Bool)

(declare-fun res!284396 () Bool)

(assert (=> b!476419 (=> (not res!284396) (not e!279821))))

(assert (=> b!476419 (= res!284396 (= (getValueByKey!385 (toList!3951 lt!217237) (_1!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!390 (_2!4490 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!476420 () Bool)

(declare-fun contains!2566 (List!9036 tuple2!8958) Bool)

(assert (=> b!476420 (= e!279821 (contains!2566 (toList!3951 lt!217237) (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75711 res!284395) b!476419))

(assert (= (and b!476419 res!284396) b!476420))

(declare-fun m!458671 () Bool)

(assert (=> d!75711 m!458671))

(declare-fun m!458673 () Bool)

(assert (=> d!75711 m!458673))

(declare-fun m!458675 () Bool)

(assert (=> d!75711 m!458675))

(declare-fun m!458677 () Bool)

(assert (=> d!75711 m!458677))

(declare-fun m!458679 () Bool)

(assert (=> b!476419 m!458679))

(declare-fun m!458681 () Bool)

(assert (=> b!476420 m!458681))

(assert (=> b!476273 d!75711))

(declare-fun d!75713 () Bool)

(declare-fun e!279822 () Bool)

(assert (=> d!75713 e!279822))

(declare-fun res!284397 () Bool)

(assert (=> d!75713 (=> (not res!284397) (not e!279822))))

(declare-fun lt!217241 () ListLongMap!7871)

(assert (=> d!75713 (= res!284397 (contains!2565 lt!217241 (_1!4490 lt!217105)))))

(declare-fun lt!217244 () List!9036)

(assert (=> d!75713 (= lt!217241 (ListLongMap!7872 lt!217244))))

(declare-fun lt!217242 () Unit!14028)

(declare-fun lt!217243 () Unit!14028)

(assert (=> d!75713 (= lt!217242 lt!217243)))

(assert (=> d!75713 (= (getValueByKey!385 lt!217244 (_1!4490 lt!217105)) (Some!390 (_2!4490 lt!217105)))))

(assert (=> d!75713 (= lt!217243 (lemmaContainsTupThenGetReturnValue!207 lt!217244 (_1!4490 lt!217105) (_2!4490 lt!217105)))))

(assert (=> d!75713 (= lt!217244 (insertStrictlySorted!210 (toList!3951 lt!217104) (_1!4490 lt!217105) (_2!4490 lt!217105)))))

(assert (=> d!75713 (= (+!1763 lt!217104 lt!217105) lt!217241)))

(declare-fun b!476421 () Bool)

(declare-fun res!284398 () Bool)

(assert (=> b!476421 (=> (not res!284398) (not e!279822))))

(assert (=> b!476421 (= res!284398 (= (getValueByKey!385 (toList!3951 lt!217241) (_1!4490 lt!217105)) (Some!390 (_2!4490 lt!217105))))))

(declare-fun b!476422 () Bool)

(assert (=> b!476422 (= e!279822 (contains!2566 (toList!3951 lt!217241) lt!217105))))

(assert (= (and d!75713 res!284397) b!476421))

(assert (= (and b!476421 res!284398) b!476422))

(declare-fun m!458683 () Bool)

(assert (=> d!75713 m!458683))

(declare-fun m!458685 () Bool)

(assert (=> d!75713 m!458685))

(declare-fun m!458687 () Bool)

(assert (=> d!75713 m!458687))

(declare-fun m!458689 () Bool)

(assert (=> d!75713 m!458689))

(declare-fun m!458691 () Bool)

(assert (=> b!476421 m!458691))

(declare-fun m!458693 () Bool)

(assert (=> b!476422 m!458693))

(assert (=> b!476273 d!75713))

(declare-fun d!75715 () Bool)

(declare-fun e!279823 () Bool)

(assert (=> d!75715 e!279823))

(declare-fun res!284399 () Bool)

(assert (=> d!75715 (=> (not res!284399) (not e!279823))))

(declare-fun lt!217245 () ListLongMap!7871)

(assert (=> d!75715 (= res!284399 (contains!2565 lt!217245 (_1!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!217248 () List!9036)

(assert (=> d!75715 (= lt!217245 (ListLongMap!7872 lt!217248))))

(declare-fun lt!217246 () Unit!14028)

(declare-fun lt!217247 () Unit!14028)

(assert (=> d!75715 (= lt!217246 lt!217247)))

(assert (=> d!75715 (= (getValueByKey!385 lt!217248 (_1!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!390 (_2!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75715 (= lt!217247 (lemmaContainsTupThenGetReturnValue!207 lt!217248 (_1!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75715 (= lt!217248 (insertStrictlySorted!210 (toList!3951 lt!217107) (_1!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75715 (= (+!1763 lt!217107 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!217245)))

(declare-fun b!476423 () Bool)

(declare-fun res!284400 () Bool)

(assert (=> b!476423 (=> (not res!284400) (not e!279823))))

(assert (=> b!476423 (= res!284400 (= (getValueByKey!385 (toList!3951 lt!217245) (_1!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!390 (_2!4490 (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!476424 () Bool)

(assert (=> b!476424 (= e!279823 (contains!2566 (toList!3951 lt!217245) (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75715 res!284399) b!476423))

(assert (= (and b!476423 res!284400) b!476424))

(declare-fun m!458695 () Bool)

(assert (=> d!75715 m!458695))

(declare-fun m!458697 () Bool)

(assert (=> d!75715 m!458697))

(declare-fun m!458699 () Bool)

(assert (=> d!75715 m!458699))

(declare-fun m!458701 () Bool)

(assert (=> d!75715 m!458701))

(declare-fun m!458703 () Bool)

(assert (=> b!476423 m!458703))

(declare-fun m!458705 () Bool)

(assert (=> b!476424 m!458705))

(assert (=> b!476273 d!75715))

(declare-fun bm!30715 () Bool)

(declare-fun call!30721 () ListLongMap!7871)

(declare-fun call!30724 () ListLongMap!7871)

(assert (=> bm!30715 (= call!30721 call!30724)))

(declare-fun bm!30716 () Bool)

(declare-fun call!30722 () ListLongMap!7871)

(declare-fun call!30718 () ListLongMap!7871)

(assert (=> bm!30716 (= call!30722 call!30718)))

(declare-fun b!476425 () Bool)

(declare-fun e!279833 () Unit!14028)

(declare-fun Unit!14033 () Unit!14028)

(assert (=> b!476425 (= e!279833 Unit!14033)))

(declare-fun bm!30717 () Bool)

(declare-fun call!30723 () Bool)

(declare-fun lt!217250 () ListLongMap!7871)

(assert (=> bm!30717 (= call!30723 (contains!2565 lt!217250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476426 () Bool)

(declare-fun e!279836 () Bool)

(assert (=> b!476426 (= e!279836 (= (apply!338 lt!217250 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!476427 () Bool)

(declare-fun e!279829 () ListLongMap!7871)

(assert (=> b!476427 (= e!279829 call!30721)))

(declare-fun b!476428 () Bool)

(declare-fun e!279827 () Bool)

(assert (=> b!476428 (= e!279827 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476429 () Bool)

(declare-fun e!279828 () Bool)

(assert (=> b!476429 (= e!279828 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30718 () Bool)

(declare-fun call!30720 () ListLongMap!7871)

(assert (=> bm!30718 (= call!30720 call!30722)))

(declare-fun b!476430 () Bool)

(declare-fun e!279824 () Bool)

(declare-fun e!279832 () Bool)

(assert (=> b!476430 (= e!279824 e!279832)))

(declare-fun c!57338 () Bool)

(assert (=> b!476430 (= c!57338 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476431 () Bool)

(declare-fun e!279835 () Bool)

(declare-fun e!279826 () Bool)

(assert (=> b!476431 (= e!279835 e!279826)))

(declare-fun res!284406 () Bool)

(assert (=> b!476431 (= res!284406 call!30723)))

(assert (=> b!476431 (=> (not res!284406) (not e!279826))))

(declare-fun b!476432 () Bool)

(assert (=> b!476432 (= e!279832 e!279836)))

(declare-fun res!284401 () Bool)

(declare-fun call!30719 () Bool)

(assert (=> b!476432 (= res!284401 call!30719)))

(assert (=> b!476432 (=> (not res!284401) (not e!279836))))

(declare-fun bm!30720 () Bool)

(assert (=> bm!30720 (= call!30718 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476433 () Bool)

(declare-fun e!279834 () ListLongMap!7871)

(assert (=> b!476433 (= e!279834 (+!1763 call!30724 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!476434 () Bool)

(declare-fun res!284407 () Bool)

(assert (=> b!476434 (=> (not res!284407) (not e!279824))))

(declare-fun e!279830 () Bool)

(assert (=> b!476434 (= res!284407 e!279830)))

(declare-fun res!284403 () Bool)

(assert (=> b!476434 (=> res!284403 e!279830)))

(assert (=> b!476434 (= res!284403 (not e!279827))))

(declare-fun res!284405 () Bool)

(assert (=> b!476434 (=> (not res!284405) (not e!279827))))

(assert (=> b!476434 (= res!284405 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476435 () Bool)

(declare-fun e!279831 () ListLongMap!7871)

(assert (=> b!476435 (= e!279831 call!30721)))

(declare-fun b!476436 () Bool)

(assert (=> b!476436 (= e!279826 (= (apply!338 lt!217250 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!476437 () Bool)

(declare-fun e!279825 () Bool)

(assert (=> b!476437 (= e!279825 (= (apply!338 lt!217250 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14782 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15134 _values!833)))))

(assert (=> b!476437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476438 () Bool)

(declare-fun lt!217255 () Unit!14028)

(assert (=> b!476438 (= e!279833 lt!217255)))

(declare-fun lt!217249 () ListLongMap!7871)

(assert (=> b!476438 (= lt!217249 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217266 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217266 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217270 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217270 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217259 () Unit!14028)

(assert (=> b!476438 (= lt!217259 (addStillContains!296 lt!217249 lt!217266 zeroValue!794 lt!217270))))

(assert (=> b!476438 (contains!2565 (+!1763 lt!217249 (tuple2!8959 lt!217266 zeroValue!794)) lt!217270)))

(declare-fun lt!217262 () Unit!14028)

(assert (=> b!476438 (= lt!217262 lt!217259)))

(declare-fun lt!217265 () ListLongMap!7871)

(assert (=> b!476438 (= lt!217265 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217260 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217260 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217261 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217261 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217263 () Unit!14028)

(assert (=> b!476438 (= lt!217263 (addApplyDifferent!296 lt!217265 lt!217260 minValueBefore!38 lt!217261))))

(assert (=> b!476438 (= (apply!338 (+!1763 lt!217265 (tuple2!8959 lt!217260 minValueBefore!38)) lt!217261) (apply!338 lt!217265 lt!217261))))

(declare-fun lt!217256 () Unit!14028)

(assert (=> b!476438 (= lt!217256 lt!217263)))

(declare-fun lt!217258 () ListLongMap!7871)

(assert (=> b!476438 (= lt!217258 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217257 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217269 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217269 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217252 () Unit!14028)

(assert (=> b!476438 (= lt!217252 (addApplyDifferent!296 lt!217258 lt!217257 zeroValue!794 lt!217269))))

(assert (=> b!476438 (= (apply!338 (+!1763 lt!217258 (tuple2!8959 lt!217257 zeroValue!794)) lt!217269) (apply!338 lt!217258 lt!217269))))

(declare-fun lt!217268 () Unit!14028)

(assert (=> b!476438 (= lt!217268 lt!217252)))

(declare-fun lt!217251 () ListLongMap!7871)

(assert (=> b!476438 (= lt!217251 (getCurrentListMapNoExtraKeys!2107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217254 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217264 () (_ BitVec 64))

(assert (=> b!476438 (= lt!217264 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476438 (= lt!217255 (addApplyDifferent!296 lt!217251 lt!217254 minValueBefore!38 lt!217264))))

(assert (=> b!476438 (= (apply!338 (+!1763 lt!217251 (tuple2!8959 lt!217254 minValueBefore!38)) lt!217264) (apply!338 lt!217251 lt!217264))))

(declare-fun b!476439 () Bool)

(declare-fun res!284404 () Bool)

(assert (=> b!476439 (=> (not res!284404) (not e!279824))))

(assert (=> b!476439 (= res!284404 e!279835)))

(declare-fun c!57337 () Bool)

(assert (=> b!476439 (= c!57337 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!75717 () Bool)

(assert (=> d!75717 e!279824))

(declare-fun res!284402 () Bool)

(assert (=> d!75717 (=> (not res!284402) (not e!279824))))

(assert (=> d!75717 (= res!284402 (or (bvsge #b00000000000000000000000000000000 (size!15133 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))))

(declare-fun lt!217253 () ListLongMap!7871)

(assert (=> d!75717 (= lt!217250 lt!217253)))

(declare-fun lt!217267 () Unit!14028)

(assert (=> d!75717 (= lt!217267 e!279833)))

(declare-fun c!57336 () Bool)

(assert (=> d!75717 (= c!57336 e!279828)))

(declare-fun res!284408 () Bool)

(assert (=> d!75717 (=> (not res!284408) (not e!279828))))

(assert (=> d!75717 (= res!284408 (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> d!75717 (= lt!217253 e!279834)))

(declare-fun c!57339 () Bool)

(assert (=> d!75717 (= c!57339 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75717 (validMask!0 mask!1365)))

(assert (=> d!75717 (= (getCurrentListMap!2291 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217250)))

(declare-fun c!57340 () Bool)

(declare-fun bm!30719 () Bool)

(assert (=> bm!30719 (= call!30724 (+!1763 (ite c!57339 call!30718 (ite c!57340 call!30722 call!30720)) (ite (or c!57339 c!57340) (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!476440 () Bool)

(assert (=> b!476440 (= e!279829 call!30720)))

(declare-fun b!476441 () Bool)

(assert (=> b!476441 (= e!279834 e!279831)))

(assert (=> b!476441 (= c!57340 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30721 () Bool)

(assert (=> bm!30721 (= call!30719 (contains!2565 lt!217250 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476442 () Bool)

(assert (=> b!476442 (= e!279832 (not call!30719))))

(declare-fun b!476443 () Bool)

(declare-fun c!57335 () Bool)

(assert (=> b!476443 (= c!57335 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!476443 (= e!279831 e!279829)))

(declare-fun b!476444 () Bool)

(assert (=> b!476444 (= e!279830 e!279825)))

(declare-fun res!284409 () Bool)

(assert (=> b!476444 (=> (not res!284409) (not e!279825))))

(assert (=> b!476444 (= res!284409 (contains!2565 lt!217250 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(declare-fun b!476445 () Bool)

(assert (=> b!476445 (= e!279835 (not call!30723))))

(assert (= (and d!75717 c!57339) b!476433))

(assert (= (and d!75717 (not c!57339)) b!476441))

(assert (= (and b!476441 c!57340) b!476435))

(assert (= (and b!476441 (not c!57340)) b!476443))

(assert (= (and b!476443 c!57335) b!476427))

(assert (= (and b!476443 (not c!57335)) b!476440))

(assert (= (or b!476427 b!476440) bm!30718))

(assert (= (or b!476435 bm!30718) bm!30716))

(assert (= (or b!476435 b!476427) bm!30715))

(assert (= (or b!476433 bm!30716) bm!30720))

(assert (= (or b!476433 bm!30715) bm!30719))

(assert (= (and d!75717 res!284408) b!476429))

(assert (= (and d!75717 c!57336) b!476438))

(assert (= (and d!75717 (not c!57336)) b!476425))

(assert (= (and d!75717 res!284402) b!476434))

(assert (= (and b!476434 res!284405) b!476428))

(assert (= (and b!476434 (not res!284403)) b!476444))

(assert (= (and b!476444 res!284409) b!476437))

(assert (= (and b!476434 res!284407) b!476439))

(assert (= (and b!476439 c!57337) b!476431))

(assert (= (and b!476439 (not c!57337)) b!476445))

(assert (= (and b!476431 res!284406) b!476436))

(assert (= (or b!476431 b!476445) bm!30717))

(assert (= (and b!476439 res!284404) b!476430))

(assert (= (and b!476430 c!57338) b!476432))

(assert (= (and b!476430 (not c!57338)) b!476442))

(assert (= (and b!476432 res!284401) b!476426))

(assert (= (or b!476432 b!476442) bm!30721))

(declare-fun b_lambda!10351 () Bool)

(assert (=> (not b_lambda!10351) (not b!476437)))

(assert (=> b!476437 t!15021))

(declare-fun b_and!20607 () Bool)

(assert (= b_and!20605 (and (=> t!15021 result!7481) b_and!20607)))

(assert (=> b!476429 m!458575))

(assert (=> b!476429 m!458575))

(assert (=> b!476429 m!458577))

(declare-fun m!458707 () Bool)

(assert (=> bm!30719 m!458707))

(assert (=> b!476437 m!458579))

(assert (=> b!476437 m!458581))

(assert (=> b!476437 m!458583))

(assert (=> b!476437 m!458579))

(assert (=> b!476437 m!458581))

(assert (=> b!476437 m!458575))

(declare-fun m!458709 () Bool)

(assert (=> b!476437 m!458709))

(assert (=> b!476437 m!458575))

(declare-fun m!458711 () Bool)

(assert (=> b!476438 m!458711))

(declare-fun m!458713 () Bool)

(assert (=> b!476438 m!458713))

(declare-fun m!458715 () Bool)

(assert (=> b!476438 m!458715))

(declare-fun m!458717 () Bool)

(assert (=> b!476438 m!458717))

(declare-fun m!458719 () Bool)

(assert (=> b!476438 m!458719))

(declare-fun m!458721 () Bool)

(assert (=> b!476438 m!458721))

(declare-fun m!458723 () Bool)

(assert (=> b!476438 m!458723))

(declare-fun m!458725 () Bool)

(assert (=> b!476438 m!458725))

(declare-fun m!458727 () Bool)

(assert (=> b!476438 m!458727))

(declare-fun m!458729 () Bool)

(assert (=> b!476438 m!458729))

(declare-fun m!458731 () Bool)

(assert (=> b!476438 m!458731))

(assert (=> b!476438 m!458575))

(assert (=> b!476438 m!458719))

(declare-fun m!458733 () Bool)

(assert (=> b!476438 m!458733))

(assert (=> b!476438 m!458725))

(assert (=> b!476438 m!458715))

(declare-fun m!458735 () Bool)

(assert (=> b!476438 m!458735))

(assert (=> b!476438 m!458537))

(declare-fun m!458737 () Bool)

(assert (=> b!476438 m!458737))

(assert (=> b!476438 m!458717))

(declare-fun m!458739 () Bool)

(assert (=> b!476438 m!458739))

(declare-fun m!458741 () Bool)

(assert (=> bm!30717 m!458741))

(assert (=> d!75717 m!458527))

(declare-fun m!458743 () Bool)

(assert (=> b!476426 m!458743))

(declare-fun m!458745 () Bool)

(assert (=> b!476433 m!458745))

(declare-fun m!458747 () Bool)

(assert (=> bm!30721 m!458747))

(declare-fun m!458749 () Bool)

(assert (=> b!476436 m!458749))

(assert (=> b!476428 m!458575))

(assert (=> b!476428 m!458575))

(assert (=> b!476428 m!458577))

(assert (=> bm!30720 m!458537))

(assert (=> b!476444 m!458575))

(assert (=> b!476444 m!458575))

(declare-fun m!458751 () Bool)

(assert (=> b!476444 m!458751))

(assert (=> b!476273 d!75717))

(declare-fun d!75719 () Bool)

(declare-fun e!279837 () Bool)

(assert (=> d!75719 e!279837))

(declare-fun res!284410 () Bool)

(assert (=> d!75719 (=> (not res!284410) (not e!279837))))

(declare-fun lt!217271 () ListLongMap!7871)

(assert (=> d!75719 (= res!284410 (contains!2565 lt!217271 (_1!4490 lt!217105)))))

(declare-fun lt!217274 () List!9036)

(assert (=> d!75719 (= lt!217271 (ListLongMap!7872 lt!217274))))

(declare-fun lt!217272 () Unit!14028)

(declare-fun lt!217273 () Unit!14028)

(assert (=> d!75719 (= lt!217272 lt!217273)))

(assert (=> d!75719 (= (getValueByKey!385 lt!217274 (_1!4490 lt!217105)) (Some!390 (_2!4490 lt!217105)))))

(assert (=> d!75719 (= lt!217273 (lemmaContainsTupThenGetReturnValue!207 lt!217274 (_1!4490 lt!217105) (_2!4490 lt!217105)))))

(assert (=> d!75719 (= lt!217274 (insertStrictlySorted!210 (toList!3951 (+!1763 lt!217110 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4490 lt!217105) (_2!4490 lt!217105)))))

(assert (=> d!75719 (= (+!1763 (+!1763 lt!217110 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217105) lt!217271)))

(declare-fun b!476446 () Bool)

(declare-fun res!284411 () Bool)

(assert (=> b!476446 (=> (not res!284411) (not e!279837))))

(assert (=> b!476446 (= res!284411 (= (getValueByKey!385 (toList!3951 lt!217271) (_1!4490 lt!217105)) (Some!390 (_2!4490 lt!217105))))))

(declare-fun b!476447 () Bool)

(assert (=> b!476447 (= e!279837 (contains!2566 (toList!3951 lt!217271) lt!217105))))

(assert (= (and d!75719 res!284410) b!476446))

(assert (= (and b!476446 res!284411) b!476447))

(declare-fun m!458753 () Bool)

(assert (=> d!75719 m!458753))

(declare-fun m!458755 () Bool)

(assert (=> d!75719 m!458755))

(declare-fun m!458757 () Bool)

(assert (=> d!75719 m!458757))

(declare-fun m!458759 () Bool)

(assert (=> d!75719 m!458759))

(declare-fun m!458761 () Bool)

(assert (=> b!476446 m!458761))

(declare-fun m!458763 () Bool)

(assert (=> b!476447 m!458763))

(assert (=> b!476273 d!75719))

(declare-fun d!75721 () Bool)

(assert (=> d!75721 (= (+!1763 lt!217110 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1763 (+!1763 lt!217110 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!217277 () Unit!14028)

(declare-fun choose!1360 (ListLongMap!7871 (_ BitVec 64) V!19101 V!19101) Unit!14028)

(assert (=> d!75721 (= lt!217277 (choose!1360 lt!217110 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75721 (= (addSameAsAddTwiceSameKeyDiffValues!164 lt!217110 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!217277)))

(declare-fun bs!15119 () Bool)

(assert (= bs!15119 d!75721))

(declare-fun m!458765 () Bool)

(assert (=> bs!15119 m!458765))

(assert (=> bs!15119 m!458509))

(assert (=> bs!15119 m!458509))

(declare-fun m!458767 () Bool)

(assert (=> bs!15119 m!458767))

(declare-fun m!458769 () Bool)

(assert (=> bs!15119 m!458769))

(assert (=> b!476273 d!75721))

(declare-fun d!75723 () Bool)

(declare-fun e!279838 () Bool)

(assert (=> d!75723 e!279838))

(declare-fun res!284412 () Bool)

(assert (=> d!75723 (=> (not res!284412) (not e!279838))))

(declare-fun lt!217278 () ListLongMap!7871)

(assert (=> d!75723 (= res!284412 (contains!2565 lt!217278 (_1!4490 lt!217105)))))

(declare-fun lt!217281 () List!9036)

(assert (=> d!75723 (= lt!217278 (ListLongMap!7872 lt!217281))))

(declare-fun lt!217279 () Unit!14028)

(declare-fun lt!217280 () Unit!14028)

(assert (=> d!75723 (= lt!217279 lt!217280)))

(assert (=> d!75723 (= (getValueByKey!385 lt!217281 (_1!4490 lt!217105)) (Some!390 (_2!4490 lt!217105)))))

(assert (=> d!75723 (= lt!217280 (lemmaContainsTupThenGetReturnValue!207 lt!217281 (_1!4490 lt!217105) (_2!4490 lt!217105)))))

(assert (=> d!75723 (= lt!217281 (insertStrictlySorted!210 (toList!3951 lt!217110) (_1!4490 lt!217105) (_2!4490 lt!217105)))))

(assert (=> d!75723 (= (+!1763 lt!217110 lt!217105) lt!217278)))

(declare-fun b!476448 () Bool)

(declare-fun res!284413 () Bool)

(assert (=> b!476448 (=> (not res!284413) (not e!279838))))

(assert (=> b!476448 (= res!284413 (= (getValueByKey!385 (toList!3951 lt!217278) (_1!4490 lt!217105)) (Some!390 (_2!4490 lt!217105))))))

(declare-fun b!476449 () Bool)

(assert (=> b!476449 (= e!279838 (contains!2566 (toList!3951 lt!217278) lt!217105))))

(assert (= (and d!75723 res!284412) b!476448))

(assert (= (and b!476448 res!284413) b!476449))

(declare-fun m!458771 () Bool)

(assert (=> d!75723 m!458771))

(declare-fun m!458773 () Bool)

(assert (=> d!75723 m!458773))

(declare-fun m!458775 () Bool)

(assert (=> d!75723 m!458775))

(declare-fun m!458777 () Bool)

(assert (=> d!75723 m!458777))

(declare-fun m!458779 () Bool)

(assert (=> b!476448 m!458779))

(declare-fun m!458781 () Bool)

(assert (=> b!476449 m!458781))

(assert (=> b!476273 d!75723))

(declare-fun bm!30724 () Bool)

(declare-fun call!30727 () Bool)

(assert (=> bm!30724 (= call!30727 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!476459 () Bool)

(declare-fun e!279846 () Bool)

(assert (=> b!476459 (= e!279846 call!30727)))

(declare-fun b!476460 () Bool)

(declare-fun e!279847 () Bool)

(assert (=> b!476460 (= e!279847 call!30727)))

(declare-fun b!476461 () Bool)

(declare-fun e!279845 () Bool)

(assert (=> b!476461 (= e!279845 e!279846)))

(declare-fun c!57343 () Bool)

(assert (=> b!476461 (= c!57343 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476458 () Bool)

(assert (=> b!476458 (= e!279846 e!279847)))

(declare-fun lt!217290 () (_ BitVec 64))

(assert (=> b!476458 (= lt!217290 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217288 () Unit!14028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30735 (_ BitVec 64) (_ BitVec 32)) Unit!14028)

(assert (=> b!476458 (= lt!217288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!217290 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!476458 (arrayContainsKey!0 _keys!1025 lt!217290 #b00000000000000000000000000000000)))

(declare-fun lt!217289 () Unit!14028)

(assert (=> b!476458 (= lt!217289 lt!217288)))

(declare-fun res!284419 () Bool)

(declare-datatypes ((SeekEntryResult!3562 0))(
  ( (MissingZero!3562 (index!16427 (_ BitVec 32))) (Found!3562 (index!16428 (_ BitVec 32))) (Intermediate!3562 (undefined!4374 Bool) (index!16429 (_ BitVec 32)) (x!44704 (_ BitVec 32))) (Undefined!3562) (MissingVacant!3562 (index!16430 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30735 (_ BitVec 32)) SeekEntryResult!3562)

(assert (=> b!476458 (= res!284419 (= (seekEntryOrOpen!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3562 #b00000000000000000000000000000000)))))

(assert (=> b!476458 (=> (not res!284419) (not e!279847))))

(declare-fun d!75725 () Bool)

(declare-fun res!284418 () Bool)

(assert (=> d!75725 (=> res!284418 e!279845)))

(assert (=> d!75725 (= res!284418 (bvsge #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> d!75725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279845)))

(assert (= (and d!75725 (not res!284418)) b!476461))

(assert (= (and b!476461 c!57343) b!476458))

(assert (= (and b!476461 (not c!57343)) b!476459))

(assert (= (and b!476458 res!284419) b!476460))

(assert (= (or b!476460 b!476459) bm!30724))

(declare-fun m!458783 () Bool)

(assert (=> bm!30724 m!458783))

(assert (=> b!476461 m!458575))

(assert (=> b!476461 m!458575))

(assert (=> b!476461 m!458577))

(assert (=> b!476458 m!458575))

(declare-fun m!458785 () Bool)

(assert (=> b!476458 m!458785))

(declare-fun m!458787 () Bool)

(assert (=> b!476458 m!458787))

(assert (=> b!476458 m!458575))

(declare-fun m!458789 () Bool)

(assert (=> b!476458 m!458789))

(assert (=> b!476277 d!75725))

(declare-fun d!75727 () Bool)

(assert (=> d!75727 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42702 d!75727))

(declare-fun d!75729 () Bool)

(assert (=> d!75729 (= (array_inv!10666 _keys!1025) (bvsge (size!15133 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42702 d!75729))

(declare-fun d!75731 () Bool)

(assert (=> d!75731 (= (array_inv!10667 _values!833) (bvsge (size!15134 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42702 d!75731))

(declare-fun b!476472 () Bool)

(declare-fun e!279858 () Bool)

(declare-fun call!30730 () Bool)

(assert (=> b!476472 (= e!279858 call!30730)))

(declare-fun b!476473 () Bool)

(declare-fun e!279856 () Bool)

(declare-fun e!279857 () Bool)

(assert (=> b!476473 (= e!279856 e!279857)))

(declare-fun res!284428 () Bool)

(assert (=> b!476473 (=> (not res!284428) (not e!279857))))

(declare-fun e!279859 () Bool)

(assert (=> b!476473 (= res!284428 (not e!279859))))

(declare-fun res!284427 () Bool)

(assert (=> b!476473 (=> (not res!284427) (not e!279859))))

(assert (=> b!476473 (= res!284427 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476474 () Bool)

(assert (=> b!476474 (= e!279857 e!279858)))

(declare-fun c!57346 () Bool)

(assert (=> b!476474 (= c!57346 (validKeyInArray!0 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476475 () Bool)

(assert (=> b!476475 (= e!279858 call!30730)))

(declare-fun b!476476 () Bool)

(declare-fun contains!2567 (List!9035 (_ BitVec 64)) Bool)

(assert (=> b!476476 (= e!279859 (contains!2567 Nil!9032 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30727 () Bool)

(assert (=> bm!30727 (= call!30730 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57346 (Cons!9031 (select (arr!14781 _keys!1025) #b00000000000000000000000000000000) Nil!9032) Nil!9032)))))

(declare-fun d!75733 () Bool)

(declare-fun res!284426 () Bool)

(assert (=> d!75733 (=> res!284426 e!279856)))

(assert (=> d!75733 (= res!284426 (bvsge #b00000000000000000000000000000000 (size!15133 _keys!1025)))))

(assert (=> d!75733 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9032) e!279856)))

(assert (= (and d!75733 (not res!284426)) b!476473))

(assert (= (and b!476473 res!284427) b!476476))

(assert (= (and b!476473 res!284428) b!476474))

(assert (= (and b!476474 c!57346) b!476475))

(assert (= (and b!476474 (not c!57346)) b!476472))

(assert (= (or b!476475 b!476472) bm!30727))

(assert (=> b!476473 m!458575))

(assert (=> b!476473 m!458575))

(assert (=> b!476473 m!458577))

(assert (=> b!476474 m!458575))

(assert (=> b!476474 m!458575))

(assert (=> b!476474 m!458577))

(assert (=> b!476476 m!458575))

(assert (=> b!476476 m!458575))

(declare-fun m!458791 () Bool)

(assert (=> b!476476 m!458791))

(assert (=> bm!30727 m!458575))

(declare-fun m!458793 () Bool)

(assert (=> bm!30727 m!458793))

(assert (=> b!476270 d!75733))

(declare-fun b!476484 () Bool)

(declare-fun e!279864 () Bool)

(assert (=> b!476484 (= e!279864 tp_is_empty!13497)))

(declare-fun condMapEmpty!21982 () Bool)

(declare-fun mapDefault!21982 () ValueCell!6405)

(assert (=> mapNonEmpty!21976 (= condMapEmpty!21982 (= mapRest!21976 ((as const (Array (_ BitVec 32) ValueCell!6405)) mapDefault!21982)))))

(declare-fun mapRes!21982 () Bool)

(assert (=> mapNonEmpty!21976 (= tp!42259 (and e!279864 mapRes!21982))))

(declare-fun mapNonEmpty!21982 () Bool)

(declare-fun tp!42268 () Bool)

(declare-fun e!279865 () Bool)

(assert (=> mapNonEmpty!21982 (= mapRes!21982 (and tp!42268 e!279865))))

(declare-fun mapKey!21982 () (_ BitVec 32))

(declare-fun mapRest!21982 () (Array (_ BitVec 32) ValueCell!6405))

(declare-fun mapValue!21982 () ValueCell!6405)

(assert (=> mapNonEmpty!21982 (= mapRest!21976 (store mapRest!21982 mapKey!21982 mapValue!21982))))

(declare-fun b!476483 () Bool)

(assert (=> b!476483 (= e!279865 tp_is_empty!13497)))

(declare-fun mapIsEmpty!21982 () Bool)

(assert (=> mapIsEmpty!21982 mapRes!21982))

(assert (= (and mapNonEmpty!21976 condMapEmpty!21982) mapIsEmpty!21982))

(assert (= (and mapNonEmpty!21976 (not condMapEmpty!21982)) mapNonEmpty!21982))

(assert (= (and mapNonEmpty!21982 ((_ is ValueCellFull!6405) mapValue!21982)) b!476483))

(assert (= (and mapNonEmpty!21976 ((_ is ValueCellFull!6405) mapDefault!21982)) b!476484))

(declare-fun m!458795 () Bool)

(assert (=> mapNonEmpty!21982 m!458795))

(declare-fun b_lambda!10353 () Bool)

(assert (= b_lambda!10347 (or (and start!42702 b_free!12069) b_lambda!10353)))

(declare-fun b_lambda!10355 () Bool)

(assert (= b_lambda!10349 (or (and start!42702 b_free!12069) b_lambda!10355)))

(declare-fun b_lambda!10357 () Bool)

(assert (= b_lambda!10341 (or (and start!42702 b_free!12069) b_lambda!10357)))

(declare-fun b_lambda!10359 () Bool)

(assert (= b_lambda!10343 (or (and start!42702 b_free!12069) b_lambda!10359)))

(declare-fun b_lambda!10361 () Bool)

(assert (= b_lambda!10351 (or (and start!42702 b_free!12069) b_lambda!10361)))

(declare-fun b_lambda!10363 () Bool)

(assert (= b_lambda!10345 (or (and start!42702 b_free!12069) b_lambda!10363)))

(check-sat (not b!476419) (not bm!30693) (not b!476446) (not b!476424) (not b!476429) (not b!476395) (not b!476336) (not b!476329) (not d!75713) (not b_next!12069) (not d!75707) (not b!476328) (not b!476343) (not b!476405) (not b!476458) (not d!75709) (not b!476350) (not b!476422) (not b!476332) (not b!476351) (not d!75717) (not b_lambda!10353) (not bm!30720) (not b!476340) (not b_lambda!10357) (not b!476461) (not b!476330) (not b!476437) (not b!476423) (not b!476337) (not bm!30721) tp_is_empty!13497 (not b!476331) (not b!476344) (not d!75715) (not b!476436) (not b!476476) (not b_lambda!10361) (not b!476438) (not bm!30724) (not bm!30712) (not b!476426) (not b!476345) (not bm!30692) (not b!476406) (not b!476420) (not b!476346) (not b!476473) (not b!476447) (not b!476326) (not bm!30727) b_and!20607 (not b!476449) (not bm!30717) (not b!476402) (not d!75705) (not d!75719) (not b!476398) (not b!476342) (not b_lambda!10359) (not mapNonEmpty!21982) (not b!476428) (not b!476433) (not b!476407) (not b_lambda!10355) (not bm!30714) (not d!75723) (not b_lambda!10363) (not b!476413) (not b!476448) (not d!75711) (not b!476421) (not bm!30713) (not b!476444) (not d!75703) (not b!476397) (not bm!30719) (not bm!30710) (not d!75721) (not b!476474))
(check-sat b_and!20607 (not b_next!12069))

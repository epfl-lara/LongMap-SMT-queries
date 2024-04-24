; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42686 () Bool)

(assert start!42686)

(declare-fun b_free!12067 () Bool)

(declare-fun b_next!12067 () Bool)

(assert (=> start!42686 (= b_free!12067 (not b_next!12067))))

(declare-fun tp!42252 () Bool)

(declare-fun b_and!20601 () Bool)

(assert (=> start!42686 (= tp!42252 b_and!20601)))

(declare-fun b!476185 () Bool)

(declare-fun e!279671 () Bool)

(declare-fun tp_is_empty!13495 () Bool)

(assert (=> b!476185 (= e!279671 tp_is_empty!13495)))

(declare-fun mapNonEmpty!21973 () Bool)

(declare-fun mapRes!21973 () Bool)

(declare-fun tp!42253 () Bool)

(declare-fun e!279672 () Bool)

(assert (=> mapNonEmpty!21973 (= mapRes!21973 (and tp!42253 e!279672))))

(declare-datatypes ((V!19099 0))(
  ( (V!19100 (val!6792 Int)) )
))
(declare-datatypes ((ValueCell!6404 0))(
  ( (ValueCellFull!6404 (v!9089 V!19099)) (EmptyCell!6404) )
))
(declare-fun mapRest!21973 () (Array (_ BitVec 32) ValueCell!6404))

(declare-datatypes ((array!30722 0))(
  ( (array!30723 (arr!14774 (Array (_ BitVec 32) ValueCell!6404)) (size!15126 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30722)

(declare-fun mapKey!21973 () (_ BitVec 32))

(declare-fun mapValue!21973 () ValueCell!6404)

(assert (=> mapNonEmpty!21973 (= (arr!14774 _values!833) (store mapRest!21973 mapKey!21973 mapValue!21973))))

(declare-fun b!476186 () Bool)

(assert (=> b!476186 (= e!279672 tp_is_empty!13495)))

(declare-fun b!476187 () Bool)

(declare-fun res!284308 () Bool)

(declare-fun e!279674 () Bool)

(assert (=> b!476187 (=> (not res!284308) (not e!279674))))

(declare-datatypes ((array!30724 0))(
  ( (array!30725 (arr!14775 (Array (_ BitVec 32) (_ BitVec 64))) (size!15127 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30724)

(declare-datatypes ((List!8943 0))(
  ( (Nil!8940) (Cons!8939 (h!9795 (_ BitVec 64)) (t!14917 List!8943)) )
))
(declare-fun arrayNoDuplicates!0 (array!30724 (_ BitVec 32) List!8943) Bool)

(assert (=> b!476187 (= res!284308 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8940))))

(declare-fun mapIsEmpty!21973 () Bool)

(assert (=> mapIsEmpty!21973 mapRes!21973))

(declare-fun b!476188 () Bool)

(declare-fun e!279675 () Bool)

(assert (=> b!476188 (= e!279674 (not e!279675))))

(declare-fun res!284306 () Bool)

(assert (=> b!476188 (=> res!284306 e!279675)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!476188 (= res!284306 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8882 0))(
  ( (tuple2!8883 (_1!4452 (_ BitVec 64)) (_2!4452 V!19099)) )
))
(declare-datatypes ((List!8944 0))(
  ( (Nil!8941) (Cons!8940 (h!9796 tuple2!8882) (t!14918 List!8944)) )
))
(declare-datatypes ((ListLongMap!7797 0))(
  ( (ListLongMap!7798 (toList!3914 List!8944)) )
))
(declare-fun lt!217101 () ListLongMap!7797)

(declare-fun lt!217097 () ListLongMap!7797)

(assert (=> b!476188 (= lt!217101 lt!217097)))

(declare-fun minValueBefore!38 () V!19099)

(declare-datatypes ((Unit!14000 0))(
  ( (Unit!14001) )
))
(declare-fun lt!217098 () Unit!14000)

(declare-fun zeroValue!794 () V!19099)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19099)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!259 (array!30724 array!30722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 V!19099 V!19099 (_ BitVec 32) Int) Unit!14000)

(assert (=> b!476188 (= lt!217098 (lemmaNoChangeToArrayThenSameMapNoExtras!259 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2121 (array!30724 array!30722 (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 (_ BitVec 32) Int) ListLongMap!7797)

(assert (=> b!476188 (= lt!217097 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!476188 (= lt!217101 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217095 () tuple2!8882)

(declare-fun lt!217096 () ListLongMap!7797)

(declare-fun b!476189 () Bool)

(declare-fun +!1771 (ListLongMap!7797 tuple2!8882) ListLongMap!7797)

(declare-fun getCurrentListMap!2250 (array!30724 array!30722 (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 (_ BitVec 32) Int) ListLongMap!7797)

(assert (=> b!476189 (= e!279675 (= (+!1771 lt!217096 lt!217095) (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun lt!217100 () ListLongMap!7797)

(assert (=> b!476189 (= (+!1771 lt!217100 lt!217095) (+!1771 (+!1771 lt!217100 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217095))))

(assert (=> b!476189 (= lt!217095 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!217099 () Unit!14000)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!166 (ListLongMap!7797 (_ BitVec 64) V!19099 V!19099) Unit!14000)

(assert (=> b!476189 (= lt!217099 (addSameAsAddTwiceSameKeyDiffValues!166 lt!217100 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!476189 (= lt!217100 (+!1771 lt!217101 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (=> b!476189 (= lt!217096 (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476190 () Bool)

(declare-fun res!284307 () Bool)

(assert (=> b!476190 (=> (not res!284307) (not e!279674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30724 (_ BitVec 32)) Bool)

(assert (=> b!476190 (= res!284307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!476192 () Bool)

(declare-fun e!279673 () Bool)

(assert (=> b!476192 (= e!279673 (and e!279671 mapRes!21973))))

(declare-fun condMapEmpty!21973 () Bool)

(declare-fun mapDefault!21973 () ValueCell!6404)

(assert (=> b!476192 (= condMapEmpty!21973 (= (arr!14774 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6404)) mapDefault!21973)))))

(declare-fun res!284309 () Bool)

(assert (=> start!42686 (=> (not res!284309) (not e!279674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42686 (= res!284309 (validMask!0 mask!1365))))

(assert (=> start!42686 e!279674))

(assert (=> start!42686 tp_is_empty!13495))

(assert (=> start!42686 tp!42252))

(assert (=> start!42686 true))

(declare-fun array_inv!10740 (array!30724) Bool)

(assert (=> start!42686 (array_inv!10740 _keys!1025)))

(declare-fun array_inv!10741 (array!30722) Bool)

(assert (=> start!42686 (and (array_inv!10741 _values!833) e!279673)))

(declare-fun b!476191 () Bool)

(declare-fun res!284310 () Bool)

(assert (=> b!476191 (=> (not res!284310) (not e!279674))))

(assert (=> b!476191 (= res!284310 (and (= (size!15126 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15127 _keys!1025) (size!15126 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42686 res!284309) b!476191))

(assert (= (and b!476191 res!284310) b!476190))

(assert (= (and b!476190 res!284307) b!476187))

(assert (= (and b!476187 res!284308) b!476188))

(assert (= (and b!476188 (not res!284306)) b!476189))

(assert (= (and b!476192 condMapEmpty!21973) mapIsEmpty!21973))

(assert (= (and b!476192 (not condMapEmpty!21973)) mapNonEmpty!21973))

(get-info :version)

(assert (= (and mapNonEmpty!21973 ((_ is ValueCellFull!6404) mapValue!21973)) b!476186))

(assert (= (and b!476192 ((_ is ValueCellFull!6404) mapDefault!21973)) b!476185))

(assert (= start!42686 b!476192))

(declare-fun m!458653 () Bool)

(assert (=> b!476187 m!458653))

(declare-fun m!458655 () Bool)

(assert (=> b!476189 m!458655))

(declare-fun m!458657 () Bool)

(assert (=> b!476189 m!458657))

(declare-fun m!458659 () Bool)

(assert (=> b!476189 m!458659))

(declare-fun m!458661 () Bool)

(assert (=> b!476189 m!458661))

(declare-fun m!458663 () Bool)

(assert (=> b!476189 m!458663))

(assert (=> b!476189 m!458661))

(declare-fun m!458665 () Bool)

(assert (=> b!476189 m!458665))

(declare-fun m!458667 () Bool)

(assert (=> b!476189 m!458667))

(declare-fun m!458669 () Bool)

(assert (=> b!476189 m!458669))

(declare-fun m!458671 () Bool)

(assert (=> b!476188 m!458671))

(declare-fun m!458673 () Bool)

(assert (=> b!476188 m!458673))

(declare-fun m!458675 () Bool)

(assert (=> b!476188 m!458675))

(declare-fun m!458677 () Bool)

(assert (=> b!476190 m!458677))

(declare-fun m!458679 () Bool)

(assert (=> start!42686 m!458679))

(declare-fun m!458681 () Bool)

(assert (=> start!42686 m!458681))

(declare-fun m!458683 () Bool)

(assert (=> start!42686 m!458683))

(declare-fun m!458685 () Bool)

(assert (=> mapNonEmpty!21973 m!458685))

(check-sat tp_is_empty!13495 (not b!476188) (not b!476190) (not b!476189) b_and!20601 (not mapNonEmpty!21973) (not b!476187) (not b_next!12067) (not start!42686))
(check-sat b_and!20601 (not b_next!12067))
(get-model)

(declare-fun b!476251 () Bool)

(declare-fun e!279721 () Bool)

(declare-fun e!279722 () Bool)

(assert (=> b!476251 (= e!279721 e!279722)))

(declare-fun c!57276 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!476251 (= c!57276 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75731 () Bool)

(declare-fun res!284347 () Bool)

(declare-fun e!279723 () Bool)

(assert (=> d!75731 (=> res!284347 e!279723)))

(assert (=> d!75731 (= res!284347 (bvsge #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> d!75731 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8940) e!279723)))

(declare-fun b!476252 () Bool)

(declare-fun e!279724 () Bool)

(declare-fun contains!2546 (List!8943 (_ BitVec 64)) Bool)

(assert (=> b!476252 (= e!279724 (contains!2546 Nil!8940 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476253 () Bool)

(assert (=> b!476253 (= e!279723 e!279721)))

(declare-fun res!284349 () Bool)

(assert (=> b!476253 (=> (not res!284349) (not e!279721))))

(assert (=> b!476253 (= res!284349 (not e!279724))))

(declare-fun res!284348 () Bool)

(assert (=> b!476253 (=> (not res!284348) (not e!279724))))

(assert (=> b!476253 (= res!284348 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30678 () Bool)

(declare-fun call!30681 () Bool)

(assert (=> bm!30678 (= call!30681 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57276 (Cons!8939 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) Nil!8940) Nil!8940)))))

(declare-fun b!476254 () Bool)

(assert (=> b!476254 (= e!279722 call!30681)))

(declare-fun b!476255 () Bool)

(assert (=> b!476255 (= e!279722 call!30681)))

(assert (= (and d!75731 (not res!284347)) b!476253))

(assert (= (and b!476253 res!284348) b!476252))

(assert (= (and b!476253 res!284349) b!476251))

(assert (= (and b!476251 c!57276) b!476254))

(assert (= (and b!476251 (not c!57276)) b!476255))

(assert (= (or b!476254 b!476255) bm!30678))

(declare-fun m!458755 () Bool)

(assert (=> b!476251 m!458755))

(assert (=> b!476251 m!458755))

(declare-fun m!458757 () Bool)

(assert (=> b!476251 m!458757))

(assert (=> b!476252 m!458755))

(assert (=> b!476252 m!458755))

(declare-fun m!458759 () Bool)

(assert (=> b!476252 m!458759))

(assert (=> b!476253 m!458755))

(assert (=> b!476253 m!458755))

(assert (=> b!476253 m!458757))

(assert (=> bm!30678 m!458755))

(declare-fun m!458761 () Bool)

(assert (=> bm!30678 m!458761))

(assert (=> b!476187 d!75731))

(declare-fun d!75733 () Bool)

(assert (=> d!75733 (= (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217146 () Unit!14000)

(declare-fun choose!1366 (array!30724 array!30722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19099 V!19099 V!19099 V!19099 (_ BitVec 32) Int) Unit!14000)

(assert (=> d!75733 (= lt!217146 (choose!1366 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75733 (validMask!0 mask!1365)))

(assert (=> d!75733 (= (lemmaNoChangeToArrayThenSameMapNoExtras!259 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217146)))

(declare-fun bs!15134 () Bool)

(assert (= bs!15134 d!75733))

(assert (=> bs!15134 m!458675))

(assert (=> bs!15134 m!458673))

(declare-fun m!458763 () Bool)

(assert (=> bs!15134 m!458763))

(assert (=> bs!15134 m!458679))

(assert (=> b!476188 d!75733))

(declare-fun b!476280 () Bool)

(declare-fun res!284359 () Bool)

(declare-fun e!279744 () Bool)

(assert (=> b!476280 (=> (not res!284359) (not e!279744))))

(declare-fun lt!217162 () ListLongMap!7797)

(declare-fun contains!2547 (ListLongMap!7797 (_ BitVec 64)) Bool)

(assert (=> b!476280 (= res!284359 (not (contains!2547 lt!217162 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476281 () Bool)

(declare-fun e!279743 () Bool)

(assert (=> b!476281 (= e!279743 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476281 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75735 () Bool)

(assert (=> d!75735 e!279744))

(declare-fun res!284358 () Bool)

(assert (=> d!75735 (=> (not res!284358) (not e!279744))))

(assert (=> d!75735 (= res!284358 (not (contains!2547 lt!217162 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279741 () ListLongMap!7797)

(assert (=> d!75735 (= lt!217162 e!279741)))

(declare-fun c!57287 () Bool)

(assert (=> d!75735 (= c!57287 (bvsge #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> d!75735 (validMask!0 mask!1365)))

(assert (=> d!75735 (= (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217162)))

(declare-fun b!476282 () Bool)

(declare-fun e!279740 () Bool)

(assert (=> b!476282 (= e!279744 e!279740)))

(declare-fun c!57285 () Bool)

(assert (=> b!476282 (= c!57285 e!279743)))

(declare-fun res!284361 () Bool)

(assert (=> b!476282 (=> (not res!284361) (not e!279743))))

(assert (=> b!476282 (= res!284361 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476283 () Bool)

(assert (=> b!476283 (= e!279741 (ListLongMap!7798 Nil!8941))))

(declare-fun b!476284 () Bool)

(assert (=> b!476284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> b!476284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15126 _values!833)))))

(declare-fun e!279742 () Bool)

(declare-fun apply!338 (ListLongMap!7797 (_ BitVec 64)) V!19099)

(declare-fun get!7176 (ValueCell!6404 V!19099) V!19099)

(declare-fun dynLambda!928 (Int (_ BitVec 64)) V!19099)

(assert (=> b!476284 (= e!279742 (= (apply!338 lt!217162 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476285 () Bool)

(declare-fun e!279739 () Bool)

(assert (=> b!476285 (= e!279740 e!279739)))

(declare-fun c!57288 () Bool)

(assert (=> b!476285 (= c!57288 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476286 () Bool)

(declare-fun e!279745 () ListLongMap!7797)

(declare-fun call!30684 () ListLongMap!7797)

(assert (=> b!476286 (= e!279745 call!30684)))

(declare-fun b!476287 () Bool)

(declare-fun isEmpty!591 (ListLongMap!7797) Bool)

(assert (=> b!476287 (= e!279739 (isEmpty!591 lt!217162))))

(declare-fun b!476288 () Bool)

(assert (=> b!476288 (= e!279740 e!279742)))

(assert (=> b!476288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun res!284360 () Bool)

(assert (=> b!476288 (= res!284360 (contains!2547 lt!217162 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476288 (=> (not res!284360) (not e!279742))))

(declare-fun b!476289 () Bool)

(declare-fun lt!217163 () Unit!14000)

(declare-fun lt!217165 () Unit!14000)

(assert (=> b!476289 (= lt!217163 lt!217165)))

(declare-fun lt!217161 () ListLongMap!7797)

(declare-fun lt!217167 () V!19099)

(declare-fun lt!217166 () (_ BitVec 64))

(declare-fun lt!217164 () (_ BitVec 64))

(assert (=> b!476289 (not (contains!2547 (+!1771 lt!217161 (tuple2!8883 lt!217164 lt!217167)) lt!217166))))

(declare-fun addStillNotContains!173 (ListLongMap!7797 (_ BitVec 64) V!19099 (_ BitVec 64)) Unit!14000)

(assert (=> b!476289 (= lt!217165 (addStillNotContains!173 lt!217161 lt!217164 lt!217167 lt!217166))))

(assert (=> b!476289 (= lt!217166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476289 (= lt!217167 (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476289 (= lt!217164 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476289 (= lt!217161 call!30684)))

(assert (=> b!476289 (= e!279745 (+!1771 call!30684 (tuple2!8883 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476290 () Bool)

(assert (=> b!476290 (= e!279739 (= lt!217162 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30681 () Bool)

(assert (=> bm!30681 (= call!30684 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476291 () Bool)

(assert (=> b!476291 (= e!279741 e!279745)))

(declare-fun c!57286 () Bool)

(assert (=> b!476291 (= c!57286 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75735 c!57287) b!476283))

(assert (= (and d!75735 (not c!57287)) b!476291))

(assert (= (and b!476291 c!57286) b!476289))

(assert (= (and b!476291 (not c!57286)) b!476286))

(assert (= (or b!476289 b!476286) bm!30681))

(assert (= (and d!75735 res!284358) b!476280))

(assert (= (and b!476280 res!284359) b!476282))

(assert (= (and b!476282 res!284361) b!476281))

(assert (= (and b!476282 c!57285) b!476288))

(assert (= (and b!476282 (not c!57285)) b!476285))

(assert (= (and b!476288 res!284360) b!476284))

(assert (= (and b!476285 c!57288) b!476290))

(assert (= (and b!476285 (not c!57288)) b!476287))

(declare-fun b_lambda!10355 () Bool)

(assert (=> (not b_lambda!10355) (not b!476284)))

(declare-fun t!14922 () Bool)

(declare-fun tb!3933 () Bool)

(assert (=> (and start!42686 (= defaultEntry!841 defaultEntry!841) t!14922) tb!3933))

(declare-fun result!7473 () Bool)

(assert (=> tb!3933 (= result!7473 tp_is_empty!13495)))

(assert (=> b!476284 t!14922))

(declare-fun b_and!20607 () Bool)

(assert (= b_and!20601 (and (=> t!14922 result!7473) b_and!20607)))

(declare-fun b_lambda!10357 () Bool)

(assert (=> (not b_lambda!10357) (not b!476289)))

(assert (=> b!476289 t!14922))

(declare-fun b_and!20609 () Bool)

(assert (= b_and!20607 (and (=> t!14922 result!7473) b_and!20609)))

(declare-fun m!458765 () Bool)

(assert (=> b!476289 m!458765))

(assert (=> b!476289 m!458755))

(declare-fun m!458767 () Bool)

(assert (=> b!476289 m!458767))

(declare-fun m!458769 () Bool)

(assert (=> b!476289 m!458769))

(assert (=> b!476289 m!458769))

(assert (=> b!476289 m!458765))

(declare-fun m!458771 () Bool)

(assert (=> b!476289 m!458771))

(declare-fun m!458773 () Bool)

(assert (=> b!476289 m!458773))

(declare-fun m!458775 () Bool)

(assert (=> b!476289 m!458775))

(assert (=> b!476289 m!458775))

(declare-fun m!458777 () Bool)

(assert (=> b!476289 m!458777))

(declare-fun m!458779 () Bool)

(assert (=> bm!30681 m!458779))

(declare-fun m!458781 () Bool)

(assert (=> b!476287 m!458781))

(assert (=> b!476284 m!458765))

(assert (=> b!476284 m!458755))

(declare-fun m!458783 () Bool)

(assert (=> b!476284 m!458783))

(assert (=> b!476284 m!458755))

(assert (=> b!476284 m!458769))

(assert (=> b!476284 m!458769))

(assert (=> b!476284 m!458765))

(assert (=> b!476284 m!458771))

(declare-fun m!458785 () Bool)

(assert (=> b!476280 m!458785))

(assert (=> b!476291 m!458755))

(assert (=> b!476291 m!458755))

(assert (=> b!476291 m!458757))

(declare-fun m!458787 () Bool)

(assert (=> d!75735 m!458787))

(assert (=> d!75735 m!458679))

(assert (=> b!476288 m!458755))

(assert (=> b!476288 m!458755))

(declare-fun m!458789 () Bool)

(assert (=> b!476288 m!458789))

(assert (=> b!476290 m!458779))

(assert (=> b!476281 m!458755))

(assert (=> b!476281 m!458755))

(assert (=> b!476281 m!458757))

(assert (=> b!476188 d!75735))

(declare-fun b!476294 () Bool)

(declare-fun res!284363 () Bool)

(declare-fun e!279751 () Bool)

(assert (=> b!476294 (=> (not res!284363) (not e!279751))))

(declare-fun lt!217169 () ListLongMap!7797)

(assert (=> b!476294 (= res!284363 (not (contains!2547 lt!217169 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476295 () Bool)

(declare-fun e!279750 () Bool)

(assert (=> b!476295 (= e!279750 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476295 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75737 () Bool)

(assert (=> d!75737 e!279751))

(declare-fun res!284362 () Bool)

(assert (=> d!75737 (=> (not res!284362) (not e!279751))))

(assert (=> d!75737 (= res!284362 (not (contains!2547 lt!217169 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279748 () ListLongMap!7797)

(assert (=> d!75737 (= lt!217169 e!279748)))

(declare-fun c!57291 () Bool)

(assert (=> d!75737 (= c!57291 (bvsge #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> d!75737 (validMask!0 mask!1365)))

(assert (=> d!75737 (= (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217169)))

(declare-fun b!476296 () Bool)

(declare-fun e!279747 () Bool)

(assert (=> b!476296 (= e!279751 e!279747)))

(declare-fun c!57289 () Bool)

(assert (=> b!476296 (= c!57289 e!279750)))

(declare-fun res!284365 () Bool)

(assert (=> b!476296 (=> (not res!284365) (not e!279750))))

(assert (=> b!476296 (= res!284365 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476297 () Bool)

(assert (=> b!476297 (= e!279748 (ListLongMap!7798 Nil!8941))))

(declare-fun b!476298 () Bool)

(assert (=> b!476298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> b!476298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15126 _values!833)))))

(declare-fun e!279749 () Bool)

(assert (=> b!476298 (= e!279749 (= (apply!338 lt!217169 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476299 () Bool)

(declare-fun e!279746 () Bool)

(assert (=> b!476299 (= e!279747 e!279746)))

(declare-fun c!57292 () Bool)

(assert (=> b!476299 (= c!57292 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476300 () Bool)

(declare-fun e!279752 () ListLongMap!7797)

(declare-fun call!30685 () ListLongMap!7797)

(assert (=> b!476300 (= e!279752 call!30685)))

(declare-fun b!476301 () Bool)

(assert (=> b!476301 (= e!279746 (isEmpty!591 lt!217169))))

(declare-fun b!476302 () Bool)

(assert (=> b!476302 (= e!279747 e!279749)))

(assert (=> b!476302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun res!284364 () Bool)

(assert (=> b!476302 (= res!284364 (contains!2547 lt!217169 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476302 (=> (not res!284364) (not e!279749))))

(declare-fun b!476303 () Bool)

(declare-fun lt!217170 () Unit!14000)

(declare-fun lt!217172 () Unit!14000)

(assert (=> b!476303 (= lt!217170 lt!217172)))

(declare-fun lt!217171 () (_ BitVec 64))

(declare-fun lt!217168 () ListLongMap!7797)

(declare-fun lt!217174 () V!19099)

(declare-fun lt!217173 () (_ BitVec 64))

(assert (=> b!476303 (not (contains!2547 (+!1771 lt!217168 (tuple2!8883 lt!217171 lt!217174)) lt!217173))))

(assert (=> b!476303 (= lt!217172 (addStillNotContains!173 lt!217168 lt!217171 lt!217174 lt!217173))))

(assert (=> b!476303 (= lt!217173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476303 (= lt!217174 (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476303 (= lt!217171 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476303 (= lt!217168 call!30685)))

(assert (=> b!476303 (= e!279752 (+!1771 call!30685 (tuple2!8883 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476304 () Bool)

(assert (=> b!476304 (= e!279746 (= lt!217169 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30682 () Bool)

(assert (=> bm!30682 (= call!30685 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476305 () Bool)

(assert (=> b!476305 (= e!279748 e!279752)))

(declare-fun c!57290 () Bool)

(assert (=> b!476305 (= c!57290 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75737 c!57291) b!476297))

(assert (= (and d!75737 (not c!57291)) b!476305))

(assert (= (and b!476305 c!57290) b!476303))

(assert (= (and b!476305 (not c!57290)) b!476300))

(assert (= (or b!476303 b!476300) bm!30682))

(assert (= (and d!75737 res!284362) b!476294))

(assert (= (and b!476294 res!284363) b!476296))

(assert (= (and b!476296 res!284365) b!476295))

(assert (= (and b!476296 c!57289) b!476302))

(assert (= (and b!476296 (not c!57289)) b!476299))

(assert (= (and b!476302 res!284364) b!476298))

(assert (= (and b!476299 c!57292) b!476304))

(assert (= (and b!476299 (not c!57292)) b!476301))

(declare-fun b_lambda!10359 () Bool)

(assert (=> (not b_lambda!10359) (not b!476298)))

(assert (=> b!476298 t!14922))

(declare-fun b_and!20611 () Bool)

(assert (= b_and!20609 (and (=> t!14922 result!7473) b_and!20611)))

(declare-fun b_lambda!10361 () Bool)

(assert (=> (not b_lambda!10361) (not b!476303)))

(assert (=> b!476303 t!14922))

(declare-fun b_and!20613 () Bool)

(assert (= b_and!20611 (and (=> t!14922 result!7473) b_and!20613)))

(assert (=> b!476303 m!458765))

(assert (=> b!476303 m!458755))

(declare-fun m!458791 () Bool)

(assert (=> b!476303 m!458791))

(assert (=> b!476303 m!458769))

(assert (=> b!476303 m!458769))

(assert (=> b!476303 m!458765))

(assert (=> b!476303 m!458771))

(declare-fun m!458793 () Bool)

(assert (=> b!476303 m!458793))

(declare-fun m!458795 () Bool)

(assert (=> b!476303 m!458795))

(assert (=> b!476303 m!458795))

(declare-fun m!458797 () Bool)

(assert (=> b!476303 m!458797))

(declare-fun m!458799 () Bool)

(assert (=> bm!30682 m!458799))

(declare-fun m!458801 () Bool)

(assert (=> b!476301 m!458801))

(assert (=> b!476298 m!458765))

(assert (=> b!476298 m!458755))

(declare-fun m!458803 () Bool)

(assert (=> b!476298 m!458803))

(assert (=> b!476298 m!458755))

(assert (=> b!476298 m!458769))

(assert (=> b!476298 m!458769))

(assert (=> b!476298 m!458765))

(assert (=> b!476298 m!458771))

(declare-fun m!458805 () Bool)

(assert (=> b!476294 m!458805))

(assert (=> b!476305 m!458755))

(assert (=> b!476305 m!458755))

(assert (=> b!476305 m!458757))

(declare-fun m!458807 () Bool)

(assert (=> d!75737 m!458807))

(assert (=> d!75737 m!458679))

(assert (=> b!476302 m!458755))

(assert (=> b!476302 m!458755))

(declare-fun m!458809 () Bool)

(assert (=> b!476302 m!458809))

(assert (=> b!476304 m!458799))

(assert (=> b!476295 m!458755))

(assert (=> b!476295 m!458755))

(assert (=> b!476295 m!458757))

(assert (=> b!476188 d!75737))

(declare-fun d!75739 () Bool)

(assert (=> d!75739 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42686 d!75739))

(declare-fun d!75741 () Bool)

(assert (=> d!75741 (= (array_inv!10740 _keys!1025) (bvsge (size!15127 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42686 d!75741))

(declare-fun d!75743 () Bool)

(assert (=> d!75743 (= (array_inv!10741 _values!833) (bvsge (size!15126 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42686 d!75743))

(declare-fun b!476348 () Bool)

(declare-fun e!279786 () ListLongMap!7797)

(declare-fun call!30706 () ListLongMap!7797)

(assert (=> b!476348 (= e!279786 call!30706)))

(declare-fun b!476349 () Bool)

(declare-fun e!279788 () ListLongMap!7797)

(declare-fun call!30701 () ListLongMap!7797)

(assert (=> b!476349 (= e!279788 call!30701)))

(declare-fun bm!30697 () Bool)

(declare-fun call!30704 () Bool)

(declare-fun lt!217224 () ListLongMap!7797)

(assert (=> bm!30697 (= call!30704 (contains!2547 lt!217224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476350 () Bool)

(declare-fun e!279783 () Bool)

(assert (=> b!476350 (= e!279783 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476351 () Bool)

(declare-fun e!279785 () Bool)

(assert (=> b!476351 (= e!279785 (= (apply!338 lt!217224 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!476352 () Bool)

(assert (=> b!476352 (= e!279786 call!30701)))

(declare-fun bm!30698 () Bool)

(declare-fun call!30705 () ListLongMap!7797)

(declare-fun call!30700 () ListLongMap!7797)

(declare-fun call!30702 () ListLongMap!7797)

(declare-fun c!57310 () Bool)

(declare-fun c!57307 () Bool)

(assert (=> bm!30698 (= call!30705 (+!1771 (ite c!57310 call!30702 (ite c!57307 call!30700 call!30706)) (ite (or c!57310 c!57307) (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!476354 () Bool)

(declare-fun e!279789 () ListLongMap!7797)

(assert (=> b!476354 (= e!279789 e!279788)))

(assert (=> b!476354 (= c!57307 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476355 () Bool)

(declare-fun e!279781 () Bool)

(assert (=> b!476355 (= e!279781 (= (apply!338 lt!217224 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15126 _values!833)))))

(assert (=> b!476355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476356 () Bool)

(declare-fun e!279779 () Unit!14000)

(declare-fun Unit!14004 () Unit!14000)

(assert (=> b!476356 (= e!279779 Unit!14004)))

(declare-fun b!476357 () Bool)

(declare-fun e!279782 () Bool)

(assert (=> b!476357 (= e!279782 (not call!30704))))

(declare-fun b!476358 () Bool)

(declare-fun e!279787 () Bool)

(assert (=> b!476358 (= e!279787 (= (apply!338 lt!217224 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!476359 () Bool)

(declare-fun res!284389 () Bool)

(declare-fun e!279784 () Bool)

(assert (=> b!476359 (=> (not res!284389) (not e!279784))))

(assert (=> b!476359 (= res!284389 e!279782)))

(declare-fun c!57306 () Bool)

(assert (=> b!476359 (= c!57306 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!476360 () Bool)

(declare-fun lt!217220 () Unit!14000)

(assert (=> b!476360 (= e!279779 lt!217220)))

(declare-fun lt!217238 () ListLongMap!7797)

(assert (=> b!476360 (= lt!217238 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217226 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217226 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217232 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217232 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217235 () Unit!14000)

(declare-fun addStillContains!296 (ListLongMap!7797 (_ BitVec 64) V!19099 (_ BitVec 64)) Unit!14000)

(assert (=> b!476360 (= lt!217235 (addStillContains!296 lt!217238 lt!217226 zeroValue!794 lt!217232))))

(assert (=> b!476360 (contains!2547 (+!1771 lt!217238 (tuple2!8883 lt!217226 zeroValue!794)) lt!217232)))

(declare-fun lt!217228 () Unit!14000)

(assert (=> b!476360 (= lt!217228 lt!217235)))

(declare-fun lt!217219 () ListLongMap!7797)

(assert (=> b!476360 (= lt!217219 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217237 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217240 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217240 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217233 () Unit!14000)

(declare-fun addApplyDifferent!296 (ListLongMap!7797 (_ BitVec 64) V!19099 (_ BitVec 64)) Unit!14000)

(assert (=> b!476360 (= lt!217233 (addApplyDifferent!296 lt!217219 lt!217237 minValueAfter!38 lt!217240))))

(assert (=> b!476360 (= (apply!338 (+!1771 lt!217219 (tuple2!8883 lt!217237 minValueAfter!38)) lt!217240) (apply!338 lt!217219 lt!217240))))

(declare-fun lt!217230 () Unit!14000)

(assert (=> b!476360 (= lt!217230 lt!217233)))

(declare-fun lt!217225 () ListLongMap!7797)

(assert (=> b!476360 (= lt!217225 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217239 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217239 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217229 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217229 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217221 () Unit!14000)

(assert (=> b!476360 (= lt!217221 (addApplyDifferent!296 lt!217225 lt!217239 zeroValue!794 lt!217229))))

(assert (=> b!476360 (= (apply!338 (+!1771 lt!217225 (tuple2!8883 lt!217239 zeroValue!794)) lt!217229) (apply!338 lt!217225 lt!217229))))

(declare-fun lt!217231 () Unit!14000)

(assert (=> b!476360 (= lt!217231 lt!217221)))

(declare-fun lt!217234 () ListLongMap!7797)

(assert (=> b!476360 (= lt!217234 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217223 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217223 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217236 () (_ BitVec 64))

(assert (=> b!476360 (= lt!217236 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476360 (= lt!217220 (addApplyDifferent!296 lt!217234 lt!217223 minValueAfter!38 lt!217236))))

(assert (=> b!476360 (= (apply!338 (+!1771 lt!217234 (tuple2!8883 lt!217223 minValueAfter!38)) lt!217236) (apply!338 lt!217234 lt!217236))))

(declare-fun bm!30699 () Bool)

(assert (=> bm!30699 (= call!30700 call!30702)))

(declare-fun b!476361 () Bool)

(declare-fun e!279780 () Bool)

(assert (=> b!476361 (= e!279780 e!279787)))

(declare-fun res!284391 () Bool)

(declare-fun call!30703 () Bool)

(assert (=> b!476361 (= res!284391 call!30703)))

(assert (=> b!476361 (=> (not res!284391) (not e!279787))))

(declare-fun b!476362 () Bool)

(declare-fun e!279790 () Bool)

(assert (=> b!476362 (= e!279790 e!279781)))

(declare-fun res!284388 () Bool)

(assert (=> b!476362 (=> (not res!284388) (not e!279781))))

(assert (=> b!476362 (= res!284388 (contains!2547 lt!217224 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476363 () Bool)

(declare-fun res!284386 () Bool)

(assert (=> b!476363 (=> (not res!284386) (not e!279784))))

(assert (=> b!476363 (= res!284386 e!279790)))

(declare-fun res!284385 () Bool)

(assert (=> b!476363 (=> res!284385 e!279790)))

(declare-fun e!279791 () Bool)

(assert (=> b!476363 (= res!284385 (not e!279791))))

(declare-fun res!284384 () Bool)

(assert (=> b!476363 (=> (not res!284384) (not e!279791))))

(assert (=> b!476363 (= res!284384 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476364 () Bool)

(declare-fun c!57309 () Bool)

(assert (=> b!476364 (= c!57309 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!476364 (= e!279788 e!279786)))

(declare-fun bm!30700 () Bool)

(assert (=> bm!30700 (= call!30702 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30701 () Bool)

(assert (=> bm!30701 (= call!30706 call!30700)))

(declare-fun d!75745 () Bool)

(assert (=> d!75745 e!279784))

(declare-fun res!284390 () Bool)

(assert (=> d!75745 (=> (not res!284390) (not e!279784))))

(assert (=> d!75745 (= res!284390 (or (bvsge #b00000000000000000000000000000000 (size!15127 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))))

(declare-fun lt!217227 () ListLongMap!7797)

(assert (=> d!75745 (= lt!217224 lt!217227)))

(declare-fun lt!217222 () Unit!14000)

(assert (=> d!75745 (= lt!217222 e!279779)))

(declare-fun c!57308 () Bool)

(assert (=> d!75745 (= c!57308 e!279783)))

(declare-fun res!284387 () Bool)

(assert (=> d!75745 (=> (not res!284387) (not e!279783))))

(assert (=> d!75745 (= res!284387 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> d!75745 (= lt!217227 e!279789)))

(assert (=> d!75745 (= c!57310 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75745 (validMask!0 mask!1365)))

(assert (=> d!75745 (= (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217224)))

(declare-fun b!476353 () Bool)

(assert (=> b!476353 (= e!279780 (not call!30703))))

(declare-fun b!476365 () Bool)

(assert (=> b!476365 (= e!279782 e!279785)))

(declare-fun res!284392 () Bool)

(assert (=> b!476365 (= res!284392 call!30704)))

(assert (=> b!476365 (=> (not res!284392) (not e!279785))))

(declare-fun b!476366 () Bool)

(assert (=> b!476366 (= e!279784 e!279780)))

(declare-fun c!57305 () Bool)

(assert (=> b!476366 (= c!57305 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30702 () Bool)

(assert (=> bm!30702 (= call!30703 (contains!2547 lt!217224 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30703 () Bool)

(assert (=> bm!30703 (= call!30701 call!30705)))

(declare-fun b!476367 () Bool)

(assert (=> b!476367 (= e!279789 (+!1771 call!30705 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!476368 () Bool)

(assert (=> b!476368 (= e!279791 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75745 c!57310) b!476367))

(assert (= (and d!75745 (not c!57310)) b!476354))

(assert (= (and b!476354 c!57307) b!476349))

(assert (= (and b!476354 (not c!57307)) b!476364))

(assert (= (and b!476364 c!57309) b!476352))

(assert (= (and b!476364 (not c!57309)) b!476348))

(assert (= (or b!476352 b!476348) bm!30701))

(assert (= (or b!476349 bm!30701) bm!30699))

(assert (= (or b!476349 b!476352) bm!30703))

(assert (= (or b!476367 bm!30699) bm!30700))

(assert (= (or b!476367 bm!30703) bm!30698))

(assert (= (and d!75745 res!284387) b!476350))

(assert (= (and d!75745 c!57308) b!476360))

(assert (= (and d!75745 (not c!57308)) b!476356))

(assert (= (and d!75745 res!284390) b!476363))

(assert (= (and b!476363 res!284384) b!476368))

(assert (= (and b!476363 (not res!284385)) b!476362))

(assert (= (and b!476362 res!284388) b!476355))

(assert (= (and b!476363 res!284386) b!476359))

(assert (= (and b!476359 c!57306) b!476365))

(assert (= (and b!476359 (not c!57306)) b!476357))

(assert (= (and b!476365 res!284392) b!476351))

(assert (= (or b!476365 b!476357) bm!30697))

(assert (= (and b!476359 res!284389) b!476366))

(assert (= (and b!476366 c!57305) b!476361))

(assert (= (and b!476366 (not c!57305)) b!476353))

(assert (= (and b!476361 res!284391) b!476358))

(assert (= (or b!476361 b!476353) bm!30702))

(declare-fun b_lambda!10363 () Bool)

(assert (=> (not b_lambda!10363) (not b!476355)))

(assert (=> b!476355 t!14922))

(declare-fun b_and!20615 () Bool)

(assert (= b_and!20613 (and (=> t!14922 result!7473) b_and!20615)))

(declare-fun m!458811 () Bool)

(assert (=> bm!30702 m!458811))

(declare-fun m!458813 () Bool)

(assert (=> bm!30698 m!458813))

(assert (=> bm!30700 m!458673))

(declare-fun m!458815 () Bool)

(assert (=> b!476360 m!458815))

(declare-fun m!458817 () Bool)

(assert (=> b!476360 m!458817))

(declare-fun m!458819 () Bool)

(assert (=> b!476360 m!458819))

(assert (=> b!476360 m!458673))

(declare-fun m!458821 () Bool)

(assert (=> b!476360 m!458821))

(declare-fun m!458823 () Bool)

(assert (=> b!476360 m!458823))

(declare-fun m!458825 () Bool)

(assert (=> b!476360 m!458825))

(declare-fun m!458827 () Bool)

(assert (=> b!476360 m!458827))

(declare-fun m!458829 () Bool)

(assert (=> b!476360 m!458829))

(assert (=> b!476360 m!458827))

(assert (=> b!476360 m!458755))

(declare-fun m!458831 () Bool)

(assert (=> b!476360 m!458831))

(assert (=> b!476360 m!458823))

(declare-fun m!458833 () Bool)

(assert (=> b!476360 m!458833))

(declare-fun m!458835 () Bool)

(assert (=> b!476360 m!458835))

(declare-fun m!458837 () Bool)

(assert (=> b!476360 m!458837))

(declare-fun m!458839 () Bool)

(assert (=> b!476360 m!458839))

(assert (=> b!476360 m!458835))

(declare-fun m!458841 () Bool)

(assert (=> b!476360 m!458841))

(assert (=> b!476360 m!458821))

(declare-fun m!458843 () Bool)

(assert (=> b!476360 m!458843))

(declare-fun m!458845 () Bool)

(assert (=> b!476351 m!458845))

(assert (=> b!476355 m!458769))

(assert (=> b!476355 m!458755))

(assert (=> b!476355 m!458769))

(assert (=> b!476355 m!458765))

(assert (=> b!476355 m!458771))

(assert (=> b!476355 m!458765))

(assert (=> b!476355 m!458755))

(declare-fun m!458847 () Bool)

(assert (=> b!476355 m!458847))

(assert (=> d!75745 m!458679))

(assert (=> b!476350 m!458755))

(assert (=> b!476350 m!458755))

(assert (=> b!476350 m!458757))

(declare-fun m!458849 () Bool)

(assert (=> b!476367 m!458849))

(assert (=> b!476362 m!458755))

(assert (=> b!476362 m!458755))

(declare-fun m!458851 () Bool)

(assert (=> b!476362 m!458851))

(declare-fun m!458853 () Bool)

(assert (=> b!476358 m!458853))

(assert (=> b!476368 m!458755))

(assert (=> b!476368 m!458755))

(assert (=> b!476368 m!458757))

(declare-fun m!458855 () Bool)

(assert (=> bm!30697 m!458855))

(assert (=> b!476189 d!75745))

(declare-fun d!75747 () Bool)

(declare-fun e!279794 () Bool)

(assert (=> d!75747 e!279794))

(declare-fun res!284397 () Bool)

(assert (=> d!75747 (=> (not res!284397) (not e!279794))))

(declare-fun lt!217251 () ListLongMap!7797)

(assert (=> d!75747 (= res!284397 (contains!2547 lt!217251 (_1!4452 lt!217095)))))

(declare-fun lt!217249 () List!8944)

(assert (=> d!75747 (= lt!217251 (ListLongMap!7798 lt!217249))))

(declare-fun lt!217250 () Unit!14000)

(declare-fun lt!217252 () Unit!14000)

(assert (=> d!75747 (= lt!217250 lt!217252)))

(declare-datatypes ((Option!392 0))(
  ( (Some!391 (v!9092 V!19099)) (None!390) )
))
(declare-fun getValueByKey!386 (List!8944 (_ BitVec 64)) Option!392)

(assert (=> d!75747 (= (getValueByKey!386 lt!217249 (_1!4452 lt!217095)) (Some!391 (_2!4452 lt!217095)))))

(declare-fun lemmaContainsTupThenGetReturnValue!208 (List!8944 (_ BitVec 64) V!19099) Unit!14000)

(assert (=> d!75747 (= lt!217252 (lemmaContainsTupThenGetReturnValue!208 lt!217249 (_1!4452 lt!217095) (_2!4452 lt!217095)))))

(declare-fun insertStrictlySorted!211 (List!8944 (_ BitVec 64) V!19099) List!8944)

(assert (=> d!75747 (= lt!217249 (insertStrictlySorted!211 (toList!3914 lt!217100) (_1!4452 lt!217095) (_2!4452 lt!217095)))))

(assert (=> d!75747 (= (+!1771 lt!217100 lt!217095) lt!217251)))

(declare-fun b!476373 () Bool)

(declare-fun res!284398 () Bool)

(assert (=> b!476373 (=> (not res!284398) (not e!279794))))

(assert (=> b!476373 (= res!284398 (= (getValueByKey!386 (toList!3914 lt!217251) (_1!4452 lt!217095)) (Some!391 (_2!4452 lt!217095))))))

(declare-fun b!476374 () Bool)

(declare-fun contains!2548 (List!8944 tuple2!8882) Bool)

(assert (=> b!476374 (= e!279794 (contains!2548 (toList!3914 lt!217251) lt!217095))))

(assert (= (and d!75747 res!284397) b!476373))

(assert (= (and b!476373 res!284398) b!476374))

(declare-fun m!458857 () Bool)

(assert (=> d!75747 m!458857))

(declare-fun m!458859 () Bool)

(assert (=> d!75747 m!458859))

(declare-fun m!458861 () Bool)

(assert (=> d!75747 m!458861))

(declare-fun m!458863 () Bool)

(assert (=> d!75747 m!458863))

(declare-fun m!458865 () Bool)

(assert (=> b!476373 m!458865))

(declare-fun m!458867 () Bool)

(assert (=> b!476374 m!458867))

(assert (=> b!476189 d!75747))

(declare-fun d!75749 () Bool)

(declare-fun e!279795 () Bool)

(assert (=> d!75749 e!279795))

(declare-fun res!284399 () Bool)

(assert (=> d!75749 (=> (not res!284399) (not e!279795))))

(declare-fun lt!217255 () ListLongMap!7797)

(assert (=> d!75749 (= res!284399 (contains!2547 lt!217255 (_1!4452 lt!217095)))))

(declare-fun lt!217253 () List!8944)

(assert (=> d!75749 (= lt!217255 (ListLongMap!7798 lt!217253))))

(declare-fun lt!217254 () Unit!14000)

(declare-fun lt!217256 () Unit!14000)

(assert (=> d!75749 (= lt!217254 lt!217256)))

(assert (=> d!75749 (= (getValueByKey!386 lt!217253 (_1!4452 lt!217095)) (Some!391 (_2!4452 lt!217095)))))

(assert (=> d!75749 (= lt!217256 (lemmaContainsTupThenGetReturnValue!208 lt!217253 (_1!4452 lt!217095) (_2!4452 lt!217095)))))

(assert (=> d!75749 (= lt!217253 (insertStrictlySorted!211 (toList!3914 (+!1771 lt!217100 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4452 lt!217095) (_2!4452 lt!217095)))))

(assert (=> d!75749 (= (+!1771 (+!1771 lt!217100 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217095) lt!217255)))

(declare-fun b!476375 () Bool)

(declare-fun res!284400 () Bool)

(assert (=> b!476375 (=> (not res!284400) (not e!279795))))

(assert (=> b!476375 (= res!284400 (= (getValueByKey!386 (toList!3914 lt!217255) (_1!4452 lt!217095)) (Some!391 (_2!4452 lt!217095))))))

(declare-fun b!476376 () Bool)

(assert (=> b!476376 (= e!279795 (contains!2548 (toList!3914 lt!217255) lt!217095))))

(assert (= (and d!75749 res!284399) b!476375))

(assert (= (and b!476375 res!284400) b!476376))

(declare-fun m!458869 () Bool)

(assert (=> d!75749 m!458869))

(declare-fun m!458871 () Bool)

(assert (=> d!75749 m!458871))

(declare-fun m!458873 () Bool)

(assert (=> d!75749 m!458873))

(declare-fun m!458875 () Bool)

(assert (=> d!75749 m!458875))

(declare-fun m!458877 () Bool)

(assert (=> b!476375 m!458877))

(declare-fun m!458879 () Bool)

(assert (=> b!476376 m!458879))

(assert (=> b!476189 d!75749))

(declare-fun b!476377 () Bool)

(declare-fun e!279803 () ListLongMap!7797)

(declare-fun call!30713 () ListLongMap!7797)

(assert (=> b!476377 (= e!279803 call!30713)))

(declare-fun b!476378 () Bool)

(declare-fun e!279805 () ListLongMap!7797)

(declare-fun call!30708 () ListLongMap!7797)

(assert (=> b!476378 (= e!279805 call!30708)))

(declare-fun bm!30704 () Bool)

(declare-fun call!30711 () Bool)

(declare-fun lt!217262 () ListLongMap!7797)

(assert (=> bm!30704 (= call!30711 (contains!2547 lt!217262 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476379 () Bool)

(declare-fun e!279800 () Bool)

(assert (=> b!476379 (= e!279800 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476380 () Bool)

(declare-fun e!279802 () Bool)

(assert (=> b!476380 (= e!279802 (= (apply!338 lt!217262 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!476381 () Bool)

(assert (=> b!476381 (= e!279803 call!30708)))

(declare-fun c!57313 () Bool)

(declare-fun bm!30705 () Bool)

(declare-fun c!57316 () Bool)

(declare-fun call!30709 () ListLongMap!7797)

(declare-fun call!30707 () ListLongMap!7797)

(declare-fun call!30712 () ListLongMap!7797)

(assert (=> bm!30705 (= call!30712 (+!1771 (ite c!57316 call!30709 (ite c!57313 call!30707 call!30713)) (ite (or c!57316 c!57313) (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!476383 () Bool)

(declare-fun e!279806 () ListLongMap!7797)

(assert (=> b!476383 (= e!279806 e!279805)))

(assert (=> b!476383 (= c!57313 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476384 () Bool)

(declare-fun e!279798 () Bool)

(assert (=> b!476384 (= e!279798 (= (apply!338 lt!217262 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14774 _values!833) #b00000000000000000000000000000000) (dynLambda!928 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15126 _values!833)))))

(assert (=> b!476384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476385 () Bool)

(declare-fun e!279796 () Unit!14000)

(declare-fun Unit!14005 () Unit!14000)

(assert (=> b!476385 (= e!279796 Unit!14005)))

(declare-fun b!476386 () Bool)

(declare-fun e!279799 () Bool)

(assert (=> b!476386 (= e!279799 (not call!30711))))

(declare-fun b!476387 () Bool)

(declare-fun e!279804 () Bool)

(assert (=> b!476387 (= e!279804 (= (apply!338 lt!217262 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!476388 () Bool)

(declare-fun res!284406 () Bool)

(declare-fun e!279801 () Bool)

(assert (=> b!476388 (=> (not res!284406) (not e!279801))))

(assert (=> b!476388 (= res!284406 e!279799)))

(declare-fun c!57312 () Bool)

(assert (=> b!476388 (= c!57312 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!476389 () Bool)

(declare-fun lt!217258 () Unit!14000)

(assert (=> b!476389 (= e!279796 lt!217258)))

(declare-fun lt!217276 () ListLongMap!7797)

(assert (=> b!476389 (= lt!217276 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217264 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217270 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217270 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217273 () Unit!14000)

(assert (=> b!476389 (= lt!217273 (addStillContains!296 lt!217276 lt!217264 zeroValue!794 lt!217270))))

(assert (=> b!476389 (contains!2547 (+!1771 lt!217276 (tuple2!8883 lt!217264 zeroValue!794)) lt!217270)))

(declare-fun lt!217266 () Unit!14000)

(assert (=> b!476389 (= lt!217266 lt!217273)))

(declare-fun lt!217257 () ListLongMap!7797)

(assert (=> b!476389 (= lt!217257 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217275 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217275 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217278 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217278 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217271 () Unit!14000)

(assert (=> b!476389 (= lt!217271 (addApplyDifferent!296 lt!217257 lt!217275 minValueBefore!38 lt!217278))))

(assert (=> b!476389 (= (apply!338 (+!1771 lt!217257 (tuple2!8883 lt!217275 minValueBefore!38)) lt!217278) (apply!338 lt!217257 lt!217278))))

(declare-fun lt!217268 () Unit!14000)

(assert (=> b!476389 (= lt!217268 lt!217271)))

(declare-fun lt!217263 () ListLongMap!7797)

(assert (=> b!476389 (= lt!217263 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217277 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217267 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217267 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217259 () Unit!14000)

(assert (=> b!476389 (= lt!217259 (addApplyDifferent!296 lt!217263 lt!217277 zeroValue!794 lt!217267))))

(assert (=> b!476389 (= (apply!338 (+!1771 lt!217263 (tuple2!8883 lt!217277 zeroValue!794)) lt!217267) (apply!338 lt!217263 lt!217267))))

(declare-fun lt!217269 () Unit!14000)

(assert (=> b!476389 (= lt!217269 lt!217259)))

(declare-fun lt!217272 () ListLongMap!7797)

(assert (=> b!476389 (= lt!217272 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217261 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217261 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217274 () (_ BitVec 64))

(assert (=> b!476389 (= lt!217274 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476389 (= lt!217258 (addApplyDifferent!296 lt!217272 lt!217261 minValueBefore!38 lt!217274))))

(assert (=> b!476389 (= (apply!338 (+!1771 lt!217272 (tuple2!8883 lt!217261 minValueBefore!38)) lt!217274) (apply!338 lt!217272 lt!217274))))

(declare-fun bm!30706 () Bool)

(assert (=> bm!30706 (= call!30707 call!30709)))

(declare-fun b!476390 () Bool)

(declare-fun e!279797 () Bool)

(assert (=> b!476390 (= e!279797 e!279804)))

(declare-fun res!284408 () Bool)

(declare-fun call!30710 () Bool)

(assert (=> b!476390 (= res!284408 call!30710)))

(assert (=> b!476390 (=> (not res!284408) (not e!279804))))

(declare-fun b!476391 () Bool)

(declare-fun e!279807 () Bool)

(assert (=> b!476391 (= e!279807 e!279798)))

(declare-fun res!284405 () Bool)

(assert (=> b!476391 (=> (not res!284405) (not e!279798))))

(assert (=> b!476391 (= res!284405 (contains!2547 lt!217262 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476392 () Bool)

(declare-fun res!284403 () Bool)

(assert (=> b!476392 (=> (not res!284403) (not e!279801))))

(assert (=> b!476392 (= res!284403 e!279807)))

(declare-fun res!284402 () Bool)

(assert (=> b!476392 (=> res!284402 e!279807)))

(declare-fun e!279808 () Bool)

(assert (=> b!476392 (= res!284402 (not e!279808))))

(declare-fun res!284401 () Bool)

(assert (=> b!476392 (=> (not res!284401) (not e!279808))))

(assert (=> b!476392 (= res!284401 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(declare-fun b!476393 () Bool)

(declare-fun c!57315 () Bool)

(assert (=> b!476393 (= c!57315 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!476393 (= e!279805 e!279803)))

(declare-fun bm!30707 () Bool)

(assert (=> bm!30707 (= call!30709 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30708 () Bool)

(assert (=> bm!30708 (= call!30713 call!30707)))

(declare-fun d!75751 () Bool)

(assert (=> d!75751 e!279801))

(declare-fun res!284407 () Bool)

(assert (=> d!75751 (=> (not res!284407) (not e!279801))))

(assert (=> d!75751 (= res!284407 (or (bvsge #b00000000000000000000000000000000 (size!15127 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))))

(declare-fun lt!217265 () ListLongMap!7797)

(assert (=> d!75751 (= lt!217262 lt!217265)))

(declare-fun lt!217260 () Unit!14000)

(assert (=> d!75751 (= lt!217260 e!279796)))

(declare-fun c!57314 () Bool)

(assert (=> d!75751 (= c!57314 e!279800)))

(declare-fun res!284404 () Bool)

(assert (=> d!75751 (=> (not res!284404) (not e!279800))))

(assert (=> d!75751 (= res!284404 (bvslt #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> d!75751 (= lt!217265 e!279806)))

(assert (=> d!75751 (= c!57316 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75751 (validMask!0 mask!1365)))

(assert (=> d!75751 (= (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217262)))

(declare-fun b!476382 () Bool)

(assert (=> b!476382 (= e!279797 (not call!30710))))

(declare-fun b!476394 () Bool)

(assert (=> b!476394 (= e!279799 e!279802)))

(declare-fun res!284409 () Bool)

(assert (=> b!476394 (= res!284409 call!30711)))

(assert (=> b!476394 (=> (not res!284409) (not e!279802))))

(declare-fun b!476395 () Bool)

(assert (=> b!476395 (= e!279801 e!279797)))

(declare-fun c!57311 () Bool)

(assert (=> b!476395 (= c!57311 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30709 () Bool)

(assert (=> bm!30709 (= call!30710 (contains!2547 lt!217262 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30710 () Bool)

(assert (=> bm!30710 (= call!30708 call!30712)))

(declare-fun b!476396 () Bool)

(assert (=> b!476396 (= e!279806 (+!1771 call!30712 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!476397 () Bool)

(assert (=> b!476397 (= e!279808 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75751 c!57316) b!476396))

(assert (= (and d!75751 (not c!57316)) b!476383))

(assert (= (and b!476383 c!57313) b!476378))

(assert (= (and b!476383 (not c!57313)) b!476393))

(assert (= (and b!476393 c!57315) b!476381))

(assert (= (and b!476393 (not c!57315)) b!476377))

(assert (= (or b!476381 b!476377) bm!30708))

(assert (= (or b!476378 bm!30708) bm!30706))

(assert (= (or b!476378 b!476381) bm!30710))

(assert (= (or b!476396 bm!30706) bm!30707))

(assert (= (or b!476396 bm!30710) bm!30705))

(assert (= (and d!75751 res!284404) b!476379))

(assert (= (and d!75751 c!57314) b!476389))

(assert (= (and d!75751 (not c!57314)) b!476385))

(assert (= (and d!75751 res!284407) b!476392))

(assert (= (and b!476392 res!284401) b!476397))

(assert (= (and b!476392 (not res!284402)) b!476391))

(assert (= (and b!476391 res!284405) b!476384))

(assert (= (and b!476392 res!284403) b!476388))

(assert (= (and b!476388 c!57312) b!476394))

(assert (= (and b!476388 (not c!57312)) b!476386))

(assert (= (and b!476394 res!284409) b!476380))

(assert (= (or b!476394 b!476386) bm!30704))

(assert (= (and b!476388 res!284406) b!476395))

(assert (= (and b!476395 c!57311) b!476390))

(assert (= (and b!476395 (not c!57311)) b!476382))

(assert (= (and b!476390 res!284408) b!476387))

(assert (= (or b!476390 b!476382) bm!30709))

(declare-fun b_lambda!10365 () Bool)

(assert (=> (not b_lambda!10365) (not b!476384)))

(assert (=> b!476384 t!14922))

(declare-fun b_and!20617 () Bool)

(assert (= b_and!20615 (and (=> t!14922 result!7473) b_and!20617)))

(declare-fun m!458881 () Bool)

(assert (=> bm!30709 m!458881))

(declare-fun m!458883 () Bool)

(assert (=> bm!30705 m!458883))

(assert (=> bm!30707 m!458675))

(declare-fun m!458885 () Bool)

(assert (=> b!476389 m!458885))

(declare-fun m!458887 () Bool)

(assert (=> b!476389 m!458887))

(declare-fun m!458889 () Bool)

(assert (=> b!476389 m!458889))

(assert (=> b!476389 m!458675))

(declare-fun m!458891 () Bool)

(assert (=> b!476389 m!458891))

(declare-fun m!458893 () Bool)

(assert (=> b!476389 m!458893))

(declare-fun m!458895 () Bool)

(assert (=> b!476389 m!458895))

(declare-fun m!458897 () Bool)

(assert (=> b!476389 m!458897))

(declare-fun m!458899 () Bool)

(assert (=> b!476389 m!458899))

(assert (=> b!476389 m!458897))

(assert (=> b!476389 m!458755))

(declare-fun m!458901 () Bool)

(assert (=> b!476389 m!458901))

(assert (=> b!476389 m!458893))

(declare-fun m!458903 () Bool)

(assert (=> b!476389 m!458903))

(declare-fun m!458905 () Bool)

(assert (=> b!476389 m!458905))

(declare-fun m!458907 () Bool)

(assert (=> b!476389 m!458907))

(declare-fun m!458909 () Bool)

(assert (=> b!476389 m!458909))

(assert (=> b!476389 m!458905))

(declare-fun m!458911 () Bool)

(assert (=> b!476389 m!458911))

(assert (=> b!476389 m!458891))

(declare-fun m!458913 () Bool)

(assert (=> b!476389 m!458913))

(declare-fun m!458915 () Bool)

(assert (=> b!476380 m!458915))

(assert (=> b!476384 m!458769))

(assert (=> b!476384 m!458755))

(assert (=> b!476384 m!458769))

(assert (=> b!476384 m!458765))

(assert (=> b!476384 m!458771))

(assert (=> b!476384 m!458765))

(assert (=> b!476384 m!458755))

(declare-fun m!458917 () Bool)

(assert (=> b!476384 m!458917))

(assert (=> d!75751 m!458679))

(assert (=> b!476379 m!458755))

(assert (=> b!476379 m!458755))

(assert (=> b!476379 m!458757))

(declare-fun m!458919 () Bool)

(assert (=> b!476396 m!458919))

(assert (=> b!476391 m!458755))

(assert (=> b!476391 m!458755))

(declare-fun m!458921 () Bool)

(assert (=> b!476391 m!458921))

(declare-fun m!458923 () Bool)

(assert (=> b!476387 m!458923))

(assert (=> b!476397 m!458755))

(assert (=> b!476397 m!458755))

(assert (=> b!476397 m!458757))

(declare-fun m!458925 () Bool)

(assert (=> bm!30704 m!458925))

(assert (=> b!476189 d!75751))

(declare-fun d!75753 () Bool)

(declare-fun e!279809 () Bool)

(assert (=> d!75753 e!279809))

(declare-fun res!284410 () Bool)

(assert (=> d!75753 (=> (not res!284410) (not e!279809))))

(declare-fun lt!217281 () ListLongMap!7797)

(assert (=> d!75753 (= res!284410 (contains!2547 lt!217281 (_1!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!217279 () List!8944)

(assert (=> d!75753 (= lt!217281 (ListLongMap!7798 lt!217279))))

(declare-fun lt!217280 () Unit!14000)

(declare-fun lt!217282 () Unit!14000)

(assert (=> d!75753 (= lt!217280 lt!217282)))

(assert (=> d!75753 (= (getValueByKey!386 lt!217279 (_1!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!391 (_2!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75753 (= lt!217282 (lemmaContainsTupThenGetReturnValue!208 lt!217279 (_1!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75753 (= lt!217279 (insertStrictlySorted!211 (toList!3914 lt!217101) (_1!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75753 (= (+!1771 lt!217101 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!217281)))

(declare-fun b!476398 () Bool)

(declare-fun res!284411 () Bool)

(assert (=> b!476398 (=> (not res!284411) (not e!279809))))

(assert (=> b!476398 (= res!284411 (= (getValueByKey!386 (toList!3914 lt!217281) (_1!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!391 (_2!4452 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!476399 () Bool)

(assert (=> b!476399 (= e!279809 (contains!2548 (toList!3914 lt!217281) (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75753 res!284410) b!476398))

(assert (= (and b!476398 res!284411) b!476399))

(declare-fun m!458927 () Bool)

(assert (=> d!75753 m!458927))

(declare-fun m!458929 () Bool)

(assert (=> d!75753 m!458929))

(declare-fun m!458931 () Bool)

(assert (=> d!75753 m!458931))

(declare-fun m!458933 () Bool)

(assert (=> d!75753 m!458933))

(declare-fun m!458935 () Bool)

(assert (=> b!476398 m!458935))

(declare-fun m!458937 () Bool)

(assert (=> b!476399 m!458937))

(assert (=> b!476189 d!75753))

(declare-fun d!75755 () Bool)

(declare-fun e!279810 () Bool)

(assert (=> d!75755 e!279810))

(declare-fun res!284412 () Bool)

(assert (=> d!75755 (=> (not res!284412) (not e!279810))))

(declare-fun lt!217285 () ListLongMap!7797)

(assert (=> d!75755 (= res!284412 (contains!2547 lt!217285 (_1!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!217283 () List!8944)

(assert (=> d!75755 (= lt!217285 (ListLongMap!7798 lt!217283))))

(declare-fun lt!217284 () Unit!14000)

(declare-fun lt!217286 () Unit!14000)

(assert (=> d!75755 (= lt!217284 lt!217286)))

(assert (=> d!75755 (= (getValueByKey!386 lt!217283 (_1!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!391 (_2!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75755 (= lt!217286 (lemmaContainsTupThenGetReturnValue!208 lt!217283 (_1!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75755 (= lt!217283 (insertStrictlySorted!211 (toList!3914 lt!217100) (_1!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75755 (= (+!1771 lt!217100 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217285)))

(declare-fun b!476400 () Bool)

(declare-fun res!284413 () Bool)

(assert (=> b!476400 (=> (not res!284413) (not e!279810))))

(assert (=> b!476400 (= res!284413 (= (getValueByKey!386 (toList!3914 lt!217285) (_1!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!391 (_2!4452 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!476401 () Bool)

(assert (=> b!476401 (= e!279810 (contains!2548 (toList!3914 lt!217285) (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75755 res!284412) b!476400))

(assert (= (and b!476400 res!284413) b!476401))

(declare-fun m!458939 () Bool)

(assert (=> d!75755 m!458939))

(declare-fun m!458941 () Bool)

(assert (=> d!75755 m!458941))

(declare-fun m!458943 () Bool)

(assert (=> d!75755 m!458943))

(declare-fun m!458945 () Bool)

(assert (=> d!75755 m!458945))

(declare-fun m!458947 () Bool)

(assert (=> b!476400 m!458947))

(declare-fun m!458949 () Bool)

(assert (=> b!476401 m!458949))

(assert (=> b!476189 d!75755))

(declare-fun d!75757 () Bool)

(declare-fun e!279811 () Bool)

(assert (=> d!75757 e!279811))

(declare-fun res!284414 () Bool)

(assert (=> d!75757 (=> (not res!284414) (not e!279811))))

(declare-fun lt!217289 () ListLongMap!7797)

(assert (=> d!75757 (= res!284414 (contains!2547 lt!217289 (_1!4452 lt!217095)))))

(declare-fun lt!217287 () List!8944)

(assert (=> d!75757 (= lt!217289 (ListLongMap!7798 lt!217287))))

(declare-fun lt!217288 () Unit!14000)

(declare-fun lt!217290 () Unit!14000)

(assert (=> d!75757 (= lt!217288 lt!217290)))

(assert (=> d!75757 (= (getValueByKey!386 lt!217287 (_1!4452 lt!217095)) (Some!391 (_2!4452 lt!217095)))))

(assert (=> d!75757 (= lt!217290 (lemmaContainsTupThenGetReturnValue!208 lt!217287 (_1!4452 lt!217095) (_2!4452 lt!217095)))))

(assert (=> d!75757 (= lt!217287 (insertStrictlySorted!211 (toList!3914 lt!217096) (_1!4452 lt!217095) (_2!4452 lt!217095)))))

(assert (=> d!75757 (= (+!1771 lt!217096 lt!217095) lt!217289)))

(declare-fun b!476402 () Bool)

(declare-fun res!284415 () Bool)

(assert (=> b!476402 (=> (not res!284415) (not e!279811))))

(assert (=> b!476402 (= res!284415 (= (getValueByKey!386 (toList!3914 lt!217289) (_1!4452 lt!217095)) (Some!391 (_2!4452 lt!217095))))))

(declare-fun b!476403 () Bool)

(assert (=> b!476403 (= e!279811 (contains!2548 (toList!3914 lt!217289) lt!217095))))

(assert (= (and d!75757 res!284414) b!476402))

(assert (= (and b!476402 res!284415) b!476403))

(declare-fun m!458951 () Bool)

(assert (=> d!75757 m!458951))

(declare-fun m!458953 () Bool)

(assert (=> d!75757 m!458953))

(declare-fun m!458955 () Bool)

(assert (=> d!75757 m!458955))

(declare-fun m!458957 () Bool)

(assert (=> d!75757 m!458957))

(declare-fun m!458959 () Bool)

(assert (=> b!476402 m!458959))

(declare-fun m!458961 () Bool)

(assert (=> b!476403 m!458961))

(assert (=> b!476189 d!75757))

(declare-fun d!75759 () Bool)

(assert (=> d!75759 (= (+!1771 lt!217100 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1771 (+!1771 lt!217100 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!217293 () Unit!14000)

(declare-fun choose!1367 (ListLongMap!7797 (_ BitVec 64) V!19099 V!19099) Unit!14000)

(assert (=> d!75759 (= lt!217293 (choose!1367 lt!217100 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75759 (= (addSameAsAddTwiceSameKeyDiffValues!166 lt!217100 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!217293)))

(declare-fun bs!15135 () Bool)

(assert (= bs!15135 d!75759))

(declare-fun m!458963 () Bool)

(assert (=> bs!15135 m!458963))

(assert (=> bs!15135 m!458661))

(assert (=> bs!15135 m!458661))

(declare-fun m!458965 () Bool)

(assert (=> bs!15135 m!458965))

(declare-fun m!458967 () Bool)

(assert (=> bs!15135 m!458967))

(assert (=> b!476189 d!75759))

(declare-fun b!476412 () Bool)

(declare-fun e!279818 () Bool)

(declare-fun call!30716 () Bool)

(assert (=> b!476412 (= e!279818 call!30716)))

(declare-fun b!476413 () Bool)

(declare-fun e!279820 () Bool)

(declare-fun e!279819 () Bool)

(assert (=> b!476413 (= e!279820 e!279819)))

(declare-fun c!57319 () Bool)

(assert (=> b!476413 (= c!57319 (validKeyInArray!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30713 () Bool)

(assert (=> bm!30713 (= call!30716 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!476415 () Bool)

(assert (=> b!476415 (= e!279819 e!279818)))

(declare-fun lt!217302 () (_ BitVec 64))

(assert (=> b!476415 (= lt!217302 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217300 () Unit!14000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30724 (_ BitVec 64) (_ BitVec 32)) Unit!14000)

(assert (=> b!476415 (= lt!217300 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!217302 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!476415 (arrayContainsKey!0 _keys!1025 lt!217302 #b00000000000000000000000000000000)))

(declare-fun lt!217301 () Unit!14000)

(assert (=> b!476415 (= lt!217301 lt!217300)))

(declare-fun res!284420 () Bool)

(declare-datatypes ((SeekEntryResult!3511 0))(
  ( (MissingZero!3511 (index!16223 (_ BitVec 32))) (Found!3511 (index!16224 (_ BitVec 32))) (Intermediate!3511 (undefined!4323 Bool) (index!16225 (_ BitVec 32)) (x!44650 (_ BitVec 32))) (Undefined!3511) (MissingVacant!3511 (index!16226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30724 (_ BitVec 32)) SeekEntryResult!3511)

(assert (=> b!476415 (= res!284420 (= (seekEntryOrOpen!0 (select (arr!14775 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3511 #b00000000000000000000000000000000)))))

(assert (=> b!476415 (=> (not res!284420) (not e!279818))))

(declare-fun b!476414 () Bool)

(assert (=> b!476414 (= e!279819 call!30716)))

(declare-fun d!75761 () Bool)

(declare-fun res!284421 () Bool)

(assert (=> d!75761 (=> res!284421 e!279820)))

(assert (=> d!75761 (= res!284421 (bvsge #b00000000000000000000000000000000 (size!15127 _keys!1025)))))

(assert (=> d!75761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279820)))

(assert (= (and d!75761 (not res!284421)) b!476413))

(assert (= (and b!476413 c!57319) b!476415))

(assert (= (and b!476413 (not c!57319)) b!476414))

(assert (= (and b!476415 res!284420) b!476412))

(assert (= (or b!476412 b!476414) bm!30713))

(assert (=> b!476413 m!458755))

(assert (=> b!476413 m!458755))

(assert (=> b!476413 m!458757))

(declare-fun m!458969 () Bool)

(assert (=> bm!30713 m!458969))

(assert (=> b!476415 m!458755))

(declare-fun m!458971 () Bool)

(assert (=> b!476415 m!458971))

(declare-fun m!458973 () Bool)

(assert (=> b!476415 m!458973))

(assert (=> b!476415 m!458755))

(declare-fun m!458975 () Bool)

(assert (=> b!476415 m!458975))

(assert (=> b!476190 d!75761))

(declare-fun mapIsEmpty!21982 () Bool)

(declare-fun mapRes!21982 () Bool)

(assert (=> mapIsEmpty!21982 mapRes!21982))

(declare-fun mapNonEmpty!21982 () Bool)

(declare-fun tp!42268 () Bool)

(declare-fun e!279826 () Bool)

(assert (=> mapNonEmpty!21982 (= mapRes!21982 (and tp!42268 e!279826))))

(declare-fun mapValue!21982 () ValueCell!6404)

(declare-fun mapRest!21982 () (Array (_ BitVec 32) ValueCell!6404))

(declare-fun mapKey!21982 () (_ BitVec 32))

(assert (=> mapNonEmpty!21982 (= mapRest!21973 (store mapRest!21982 mapKey!21982 mapValue!21982))))

(declare-fun b!476423 () Bool)

(declare-fun e!279825 () Bool)

(assert (=> b!476423 (= e!279825 tp_is_empty!13495)))

(declare-fun condMapEmpty!21982 () Bool)

(declare-fun mapDefault!21982 () ValueCell!6404)

(assert (=> mapNonEmpty!21973 (= condMapEmpty!21982 (= mapRest!21973 ((as const (Array (_ BitVec 32) ValueCell!6404)) mapDefault!21982)))))

(assert (=> mapNonEmpty!21973 (= tp!42253 (and e!279825 mapRes!21982))))

(declare-fun b!476422 () Bool)

(assert (=> b!476422 (= e!279826 tp_is_empty!13495)))

(assert (= (and mapNonEmpty!21973 condMapEmpty!21982) mapIsEmpty!21982))

(assert (= (and mapNonEmpty!21973 (not condMapEmpty!21982)) mapNonEmpty!21982))

(assert (= (and mapNonEmpty!21982 ((_ is ValueCellFull!6404) mapValue!21982)) b!476422))

(assert (= (and mapNonEmpty!21973 ((_ is ValueCellFull!6404) mapDefault!21982)) b!476423))

(declare-fun m!458977 () Bool)

(assert (=> mapNonEmpty!21982 m!458977))

(declare-fun b_lambda!10367 () Bool)

(assert (= b_lambda!10355 (or (and start!42686 b_free!12067) b_lambda!10367)))

(declare-fun b_lambda!10369 () Bool)

(assert (= b_lambda!10357 (or (and start!42686 b_free!12067) b_lambda!10369)))

(declare-fun b_lambda!10371 () Bool)

(assert (= b_lambda!10363 (or (and start!42686 b_free!12067) b_lambda!10371)))

(declare-fun b_lambda!10373 () Bool)

(assert (= b_lambda!10361 (or (and start!42686 b_free!12067) b_lambda!10373)))

(declare-fun b_lambda!10375 () Bool)

(assert (= b_lambda!10365 (or (and start!42686 b_free!12067) b_lambda!10375)))

(declare-fun b_lambda!10377 () Bool)

(assert (= b_lambda!10359 (or (and start!42686 b_free!12067) b_lambda!10377)))

(check-sat (not mapNonEmpty!21982) (not bm!30678) (not b!476251) (not b!476280) (not bm!30704) (not d!75747) (not bm!30707) (not b!476252) (not b_next!12067) (not d!75733) (not b!476380) (not b!476291) (not b!476253) tp_is_empty!13495 (not b!476398) (not b!476302) (not bm!30702) (not b!476375) (not b_lambda!10367) (not b!476379) (not b!476373) (not d!75751) (not b!476303) (not b!476367) (not b!476358) (not b!476391) (not d!75735) (not b!476384) (not b!476295) (not b!476290) (not b!476305) (not b!476281) (not b!476401) (not d!75759) (not d!75753) (not bm!30682) (not b!476298) (not b!476350) (not bm!30697) (not d!75745) (not b!476399) (not bm!30705) (not b!476301) (not b!476415) (not b_lambda!10377) (not bm!30698) (not b!476403) (not b!476287) (not b!476289) (not b!476376) (not b!476402) (not b!476362) (not d!75749) (not bm!30713) b_and!20617 (not b!476284) (not b!476360) (not d!75755) (not bm!30681) (not b_lambda!10371) (not b!476351) (not b!476413) (not b!476389) (not b!476294) (not d!75757) (not b!476397) (not b!476387) (not b_lambda!10373) (not b!476355) (not b!476368) (not d!75737) (not b!476304) (not bm!30700) (not b!476396) (not b_lambda!10375) (not b!476400) (not b_lambda!10369) (not b!476374) (not bm!30709) (not b!476288))
(check-sat b_and!20617 (not b_next!12067))

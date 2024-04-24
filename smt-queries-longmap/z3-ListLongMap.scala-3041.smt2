; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42636 () Bool)

(assert start!42636)

(declare-fun b_free!12055 () Bool)

(declare-fun b_next!12055 () Bool)

(assert (=> start!42636 (= b_free!12055 (not b_next!12055))))

(declare-fun tp!42211 () Bool)

(declare-fun b_and!20565 () Bool)

(assert (=> start!42636 (= tp!42211 b_and!20565)))

(declare-fun mapNonEmpty!21949 () Bool)

(declare-fun mapRes!21949 () Bool)

(declare-fun tp!42210 () Bool)

(declare-fun e!279341 () Bool)

(assert (=> mapNonEmpty!21949 (= mapRes!21949 (and tp!42210 e!279341))))

(declare-datatypes ((V!19083 0))(
  ( (V!19084 (val!6786 Int)) )
))
(declare-datatypes ((ValueCell!6398 0))(
  ( (ValueCellFull!6398 (v!9081 V!19083)) (EmptyCell!6398) )
))
(declare-datatypes ((array!30694 0))(
  ( (array!30695 (arr!14762 (Array (_ BitVec 32) ValueCell!6398)) (size!15114 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30694)

(declare-fun mapKey!21949 () (_ BitVec 32))

(declare-fun mapValue!21949 () ValueCell!6398)

(declare-fun mapRest!21949 () (Array (_ BitVec 32) ValueCell!6398))

(assert (=> mapNonEmpty!21949 (= (arr!14762 _values!833) (store mapRest!21949 mapKey!21949 mapValue!21949))))

(declare-fun res!284068 () Bool)

(declare-fun e!279345 () Bool)

(assert (=> start!42636 (=> (not res!284068) (not e!279345))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42636 (= res!284068 (validMask!0 mask!1365))))

(assert (=> start!42636 e!279345))

(declare-fun tp_is_empty!13483 () Bool)

(assert (=> start!42636 tp_is_empty!13483))

(assert (=> start!42636 tp!42211))

(assert (=> start!42636 true))

(declare-datatypes ((array!30696 0))(
  ( (array!30697 (arr!14763 (Array (_ BitVec 32) (_ BitVec 64))) (size!15115 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30696)

(declare-fun array_inv!10730 (array!30696) Bool)

(assert (=> start!42636 (array_inv!10730 _keys!1025)))

(declare-fun e!279342 () Bool)

(declare-fun array_inv!10731 (array!30694) Bool)

(assert (=> start!42636 (and (array_inv!10731 _values!833) e!279342)))

(declare-fun b!475685 () Bool)

(declare-fun res!284064 () Bool)

(assert (=> b!475685 (=> (not res!284064) (not e!279345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30696 (_ BitVec 32)) Bool)

(assert (=> b!475685 (= res!284064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475686 () Bool)

(declare-fun e!279340 () Bool)

(assert (=> b!475686 (= e!279340 tp_is_empty!13483)))

(declare-fun b!475687 () Bool)

(assert (=> b!475687 (= e!279341 tp_is_empty!13483)))

(declare-fun b!475688 () Bool)

(declare-fun res!284065 () Bool)

(assert (=> b!475688 (=> (not res!284065) (not e!279345))))

(declare-datatypes ((List!8933 0))(
  ( (Nil!8930) (Cons!8929 (h!9785 (_ BitVec 64)) (t!14903 List!8933)) )
))
(declare-fun arrayNoDuplicates!0 (array!30696 (_ BitVec 32) List!8933) Bool)

(assert (=> b!475688 (= res!284065 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8930))))

(declare-fun b!475689 () Bool)

(assert (=> b!475689 (= e!279342 (and e!279340 mapRes!21949))))

(declare-fun condMapEmpty!21949 () Bool)

(declare-fun mapDefault!21949 () ValueCell!6398)

(assert (=> b!475689 (= condMapEmpty!21949 (= (arr!14762 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6398)) mapDefault!21949)))))

(declare-fun mapIsEmpty!21949 () Bool)

(assert (=> mapIsEmpty!21949 mapRes!21949))

(declare-fun b!475690 () Bool)

(declare-fun res!284067 () Bool)

(assert (=> b!475690 (=> (not res!284067) (not e!279345))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!475690 (= res!284067 (and (= (size!15114 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15115 _keys!1025) (size!15114 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475691 () Bool)

(declare-fun e!279344 () Bool)

(assert (=> b!475691 (= e!279345 (not e!279344))))

(declare-fun res!284066 () Bool)

(assert (=> b!475691 (=> res!284066 e!279344)))

(assert (=> b!475691 (= res!284066 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8872 0))(
  ( (tuple2!8873 (_1!4447 (_ BitVec 64)) (_2!4447 V!19083)) )
))
(declare-datatypes ((List!8934 0))(
  ( (Nil!8931) (Cons!8930 (h!9786 tuple2!8872) (t!14904 List!8934)) )
))
(declare-datatypes ((ListLongMap!7787 0))(
  ( (ListLongMap!7788 (toList!3909 List!8934)) )
))
(declare-fun lt!216719 () ListLongMap!7787)

(declare-fun lt!216718 () ListLongMap!7787)

(assert (=> b!475691 (= lt!216719 lt!216718)))

(declare-fun minValueBefore!38 () V!19083)

(declare-fun zeroValue!794 () V!19083)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13986 0))(
  ( (Unit!13987) )
))
(declare-fun lt!216721 () Unit!13986)

(declare-fun minValueAfter!38 () V!19083)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!254 (array!30696 array!30694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 V!19083 V!19083 (_ BitVec 32) Int) Unit!13986)

(assert (=> b!475691 (= lt!216721 (lemmaNoChangeToArrayThenSameMapNoExtras!254 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2116 (array!30696 array!30694 (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 (_ BitVec 32) Int) ListLongMap!7787)

(assert (=> b!475691 (= lt!216718 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475691 (= lt!216719 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216717 () tuple2!8872)

(declare-fun b!475692 () Bool)

(declare-fun lt!216722 () ListLongMap!7787)

(declare-fun +!1767 (ListLongMap!7787 tuple2!8872) ListLongMap!7787)

(declare-fun getCurrentListMap!2246 (array!30696 array!30694 (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 (_ BitVec 32) Int) ListLongMap!7787)

(assert (=> b!475692 (= e!279344 (= (+!1767 lt!216722 lt!216717) (getCurrentListMap!2246 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(assert (=> b!475692 (= (+!1767 lt!216719 lt!216717) (+!1767 (+!1767 lt!216719 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216717))))

(assert (=> b!475692 (= lt!216717 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!216720 () Unit!13986)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!164 (ListLongMap!7787 (_ BitVec 64) V!19083 V!19083) Unit!13986)

(assert (=> b!475692 (= lt!216720 (addSameAsAddTwiceSameKeyDiffValues!164 lt!216719 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!475692 (= lt!216722 (getCurrentListMap!2246 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42636 res!284068) b!475690))

(assert (= (and b!475690 res!284067) b!475685))

(assert (= (and b!475685 res!284064) b!475688))

(assert (= (and b!475688 res!284065) b!475691))

(assert (= (and b!475691 (not res!284066)) b!475692))

(assert (= (and b!475689 condMapEmpty!21949) mapIsEmpty!21949))

(assert (= (and b!475689 (not condMapEmpty!21949)) mapNonEmpty!21949))

(get-info :version)

(assert (= (and mapNonEmpty!21949 ((_ is ValueCellFull!6398) mapValue!21949)) b!475687))

(assert (= (and b!475689 ((_ is ValueCellFull!6398) mapDefault!21949)) b!475686))

(assert (= start!42636 b!475689))

(declare-fun m!458103 () Bool)

(assert (=> mapNonEmpty!21949 m!458103))

(declare-fun m!458105 () Bool)

(assert (=> start!42636 m!458105))

(declare-fun m!458107 () Bool)

(assert (=> start!42636 m!458107))

(declare-fun m!458109 () Bool)

(assert (=> start!42636 m!458109))

(declare-fun m!458111 () Bool)

(assert (=> b!475692 m!458111))

(assert (=> b!475692 m!458111))

(declare-fun m!458113 () Bool)

(assert (=> b!475692 m!458113))

(declare-fun m!458115 () Bool)

(assert (=> b!475692 m!458115))

(declare-fun m!458117 () Bool)

(assert (=> b!475692 m!458117))

(declare-fun m!458119 () Bool)

(assert (=> b!475692 m!458119))

(declare-fun m!458121 () Bool)

(assert (=> b!475692 m!458121))

(declare-fun m!458123 () Bool)

(assert (=> b!475692 m!458123))

(declare-fun m!458125 () Bool)

(assert (=> b!475691 m!458125))

(declare-fun m!458127 () Bool)

(assert (=> b!475691 m!458127))

(declare-fun m!458129 () Bool)

(assert (=> b!475691 m!458129))

(declare-fun m!458131 () Bool)

(assert (=> b!475688 m!458131))

(declare-fun m!458133 () Bool)

(assert (=> b!475685 m!458133))

(check-sat tp_is_empty!13483 (not b!475692) b_and!20565 (not b!475688) (not b!475685) (not b!475691) (not mapNonEmpty!21949) (not b_next!12055) (not start!42636))
(check-sat b_and!20565 (not b_next!12055))
(get-model)

(declare-fun bm!30602 () Bool)

(declare-fun call!30605 () Bool)

(declare-fun c!57184 () Bool)

(assert (=> bm!30602 (= call!30605 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57184 (Cons!8929 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) Nil!8930) Nil!8930)))))

(declare-fun d!75675 () Bool)

(declare-fun res!284105 () Bool)

(declare-fun e!279391 () Bool)

(assert (=> d!75675 (=> res!284105 e!279391)))

(assert (=> d!75675 (= res!284105 (bvsge #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> d!75675 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8930) e!279391)))

(declare-fun b!475751 () Bool)

(declare-fun e!279390 () Bool)

(assert (=> b!475751 (= e!279390 call!30605)))

(declare-fun b!475752 () Bool)

(declare-fun e!279393 () Bool)

(declare-fun contains!2540 (List!8933 (_ BitVec 64)) Bool)

(assert (=> b!475752 (= e!279393 (contains!2540 Nil!8930 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475753 () Bool)

(declare-fun e!279392 () Bool)

(assert (=> b!475753 (= e!279391 e!279392)))

(declare-fun res!284106 () Bool)

(assert (=> b!475753 (=> (not res!284106) (not e!279392))))

(assert (=> b!475753 (= res!284106 (not e!279393))))

(declare-fun res!284107 () Bool)

(assert (=> b!475753 (=> (not res!284107) (not e!279393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475753 (= res!284107 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475754 () Bool)

(assert (=> b!475754 (= e!279392 e!279390)))

(assert (=> b!475754 (= c!57184 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475755 () Bool)

(assert (=> b!475755 (= e!279390 call!30605)))

(assert (= (and d!75675 (not res!284105)) b!475753))

(assert (= (and b!475753 res!284107) b!475752))

(assert (= (and b!475753 res!284106) b!475754))

(assert (= (and b!475754 c!57184) b!475755))

(assert (= (and b!475754 (not c!57184)) b!475751))

(assert (= (or b!475755 b!475751) bm!30602))

(declare-fun m!458199 () Bool)

(assert (=> bm!30602 m!458199))

(declare-fun m!458201 () Bool)

(assert (=> bm!30602 m!458201))

(assert (=> b!475752 m!458199))

(assert (=> b!475752 m!458199))

(declare-fun m!458203 () Bool)

(assert (=> b!475752 m!458203))

(assert (=> b!475753 m!458199))

(assert (=> b!475753 m!458199))

(declare-fun m!458205 () Bool)

(assert (=> b!475753 m!458205))

(assert (=> b!475754 m!458199))

(assert (=> b!475754 m!458199))

(assert (=> b!475754 m!458205))

(assert (=> b!475688 d!75675))

(declare-fun d!75677 () Bool)

(assert (=> d!75677 (= (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216761 () Unit!13986)

(declare-fun choose!1363 (array!30696 array!30694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 V!19083 V!19083 (_ BitVec 32) Int) Unit!13986)

(assert (=> d!75677 (= lt!216761 (choose!1363 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75677 (validMask!0 mask!1365)))

(assert (=> d!75677 (= (lemmaNoChangeToArrayThenSameMapNoExtras!254 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216761)))

(declare-fun bs!15125 () Bool)

(assert (= bs!15125 d!75677))

(assert (=> bs!15125 m!458129))

(assert (=> bs!15125 m!458127))

(declare-fun m!458207 () Bool)

(assert (=> bs!15125 m!458207))

(assert (=> bs!15125 m!458105))

(assert (=> b!475691 d!75677))

(declare-fun b!475780 () Bool)

(declare-fun e!279408 () Bool)

(declare-fun lt!216779 () ListLongMap!7787)

(declare-fun isEmpty!589 (ListLongMap!7787) Bool)

(assert (=> b!475780 (= e!279408 (isEmpty!589 lt!216779))))

(declare-fun b!475781 () Bool)

(declare-fun e!279412 () ListLongMap!7787)

(declare-fun e!279410 () ListLongMap!7787)

(assert (=> b!475781 (= e!279412 e!279410)))

(declare-fun c!57194 () Bool)

(assert (=> b!475781 (= c!57194 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75679 () Bool)

(declare-fun e!279414 () Bool)

(assert (=> d!75679 e!279414))

(declare-fun res!284118 () Bool)

(assert (=> d!75679 (=> (not res!284118) (not e!279414))))

(declare-fun contains!2541 (ListLongMap!7787 (_ BitVec 64)) Bool)

(assert (=> d!75679 (= res!284118 (not (contains!2541 lt!216779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75679 (= lt!216779 e!279412)))

(declare-fun c!57196 () Bool)

(assert (=> d!75679 (= c!57196 (bvsge #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> d!75679 (validMask!0 mask!1365)))

(assert (=> d!75679 (= (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216779)))

(declare-fun b!475782 () Bool)

(assert (=> b!475782 (= e!279408 (= lt!216779 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475783 () Bool)

(assert (=> b!475783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> b!475783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15114 _values!833)))))

(declare-fun e!279413 () Bool)

(declare-fun apply!336 (ListLongMap!7787 (_ BitVec 64)) V!19083)

(declare-fun get!7170 (ValueCell!6398 V!19083) V!19083)

(declare-fun dynLambda!926 (Int (_ BitVec 64)) V!19083)

(assert (=> b!475783 (= e!279413 (= (apply!336 lt!216779 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475784 () Bool)

(declare-fun e!279411 () Bool)

(assert (=> b!475784 (= e!279411 e!279413)))

(assert (=> b!475784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun res!284117 () Bool)

(assert (=> b!475784 (= res!284117 (contains!2541 lt!216779 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475784 (=> (not res!284117) (not e!279413))))

(declare-fun b!475785 () Bool)

(assert (=> b!475785 (= e!279414 e!279411)))

(declare-fun c!57195 () Bool)

(declare-fun e!279409 () Bool)

(assert (=> b!475785 (= c!57195 e!279409)))

(declare-fun res!284116 () Bool)

(assert (=> b!475785 (=> (not res!284116) (not e!279409))))

(assert (=> b!475785 (= res!284116 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun b!475786 () Bool)

(declare-fun lt!216780 () Unit!13986)

(declare-fun lt!216781 () Unit!13986)

(assert (=> b!475786 (= lt!216780 lt!216781)))

(declare-fun lt!216776 () (_ BitVec 64))

(declare-fun lt!216778 () (_ BitVec 64))

(declare-fun lt!216777 () V!19083)

(declare-fun lt!216782 () ListLongMap!7787)

(assert (=> b!475786 (not (contains!2541 (+!1767 lt!216782 (tuple2!8873 lt!216776 lt!216777)) lt!216778))))

(declare-fun addStillNotContains!171 (ListLongMap!7787 (_ BitVec 64) V!19083 (_ BitVec 64)) Unit!13986)

(assert (=> b!475786 (= lt!216781 (addStillNotContains!171 lt!216782 lt!216776 lt!216777 lt!216778))))

(assert (=> b!475786 (= lt!216778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475786 (= lt!216777 (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475786 (= lt!216776 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30608 () ListLongMap!7787)

(assert (=> b!475786 (= lt!216782 call!30608)))

(assert (=> b!475786 (= e!279410 (+!1767 call!30608 (tuple2!8873 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475787 () Bool)

(assert (=> b!475787 (= e!279409 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475787 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475788 () Bool)

(declare-fun res!284119 () Bool)

(assert (=> b!475788 (=> (not res!284119) (not e!279414))))

(assert (=> b!475788 (= res!284119 (not (contains!2541 lt!216779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475789 () Bool)

(assert (=> b!475789 (= e!279412 (ListLongMap!7788 Nil!8931))))

(declare-fun b!475790 () Bool)

(assert (=> b!475790 (= e!279410 call!30608)))

(declare-fun b!475791 () Bool)

(assert (=> b!475791 (= e!279411 e!279408)))

(declare-fun c!57193 () Bool)

(assert (=> b!475791 (= c!57193 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun bm!30605 () Bool)

(assert (=> bm!30605 (= call!30608 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!75679 c!57196) b!475789))

(assert (= (and d!75679 (not c!57196)) b!475781))

(assert (= (and b!475781 c!57194) b!475786))

(assert (= (and b!475781 (not c!57194)) b!475790))

(assert (= (or b!475786 b!475790) bm!30605))

(assert (= (and d!75679 res!284118) b!475788))

(assert (= (and b!475788 res!284119) b!475785))

(assert (= (and b!475785 res!284116) b!475787))

(assert (= (and b!475785 c!57195) b!475784))

(assert (= (and b!475785 (not c!57195)) b!475791))

(assert (= (and b!475784 res!284117) b!475783))

(assert (= (and b!475791 c!57193) b!475782))

(assert (= (and b!475791 (not c!57193)) b!475780))

(declare-fun b_lambda!10307 () Bool)

(assert (=> (not b_lambda!10307) (not b!475783)))

(declare-fun t!14908 () Bool)

(declare-fun tb!3929 () Bool)

(assert (=> (and start!42636 (= defaultEntry!841 defaultEntry!841) t!14908) tb!3929))

(declare-fun result!7461 () Bool)

(assert (=> tb!3929 (= result!7461 tp_is_empty!13483)))

(assert (=> b!475783 t!14908))

(declare-fun b_and!20571 () Bool)

(assert (= b_and!20565 (and (=> t!14908 result!7461) b_and!20571)))

(declare-fun b_lambda!10309 () Bool)

(assert (=> (not b_lambda!10309) (not b!475786)))

(assert (=> b!475786 t!14908))

(declare-fun b_and!20573 () Bool)

(assert (= b_and!20571 (and (=> t!14908 result!7461) b_and!20573)))

(assert (=> b!475781 m!458199))

(assert (=> b!475781 m!458199))

(assert (=> b!475781 m!458205))

(declare-fun m!458209 () Bool)

(assert (=> b!475782 m!458209))

(declare-fun m!458211 () Bool)

(assert (=> d!75679 m!458211))

(assert (=> d!75679 m!458105))

(declare-fun m!458213 () Bool)

(assert (=> b!475780 m!458213))

(assert (=> b!475786 m!458199))

(declare-fun m!458215 () Bool)

(assert (=> b!475786 m!458215))

(declare-fun m!458217 () Bool)

(assert (=> b!475786 m!458217))

(declare-fun m!458219 () Bool)

(assert (=> b!475786 m!458219))

(assert (=> b!475786 m!458215))

(declare-fun m!458221 () Bool)

(assert (=> b!475786 m!458221))

(declare-fun m!458223 () Bool)

(assert (=> b!475786 m!458223))

(declare-fun m!458225 () Bool)

(assert (=> b!475786 m!458225))

(assert (=> b!475786 m!458223))

(assert (=> b!475786 m!458219))

(declare-fun m!458227 () Bool)

(assert (=> b!475786 m!458227))

(assert (=> b!475783 m!458199))

(assert (=> b!475783 m!458223))

(assert (=> b!475783 m!458219))

(assert (=> b!475783 m!458227))

(assert (=> b!475783 m!458199))

(declare-fun m!458229 () Bool)

(assert (=> b!475783 m!458229))

(assert (=> b!475783 m!458219))

(assert (=> b!475783 m!458223))

(assert (=> b!475784 m!458199))

(assert (=> b!475784 m!458199))

(declare-fun m!458231 () Bool)

(assert (=> b!475784 m!458231))

(declare-fun m!458233 () Bool)

(assert (=> b!475788 m!458233))

(assert (=> b!475787 m!458199))

(assert (=> b!475787 m!458199))

(assert (=> b!475787 m!458205))

(assert (=> bm!30605 m!458209))

(assert (=> b!475691 d!75679))

(declare-fun b!475794 () Bool)

(declare-fun e!279415 () Bool)

(declare-fun lt!216786 () ListLongMap!7787)

(assert (=> b!475794 (= e!279415 (isEmpty!589 lt!216786))))

(declare-fun b!475795 () Bool)

(declare-fun e!279419 () ListLongMap!7787)

(declare-fun e!279417 () ListLongMap!7787)

(assert (=> b!475795 (= e!279419 e!279417)))

(declare-fun c!57198 () Bool)

(assert (=> b!475795 (= c!57198 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75681 () Bool)

(declare-fun e!279421 () Bool)

(assert (=> d!75681 e!279421))

(declare-fun res!284122 () Bool)

(assert (=> d!75681 (=> (not res!284122) (not e!279421))))

(assert (=> d!75681 (= res!284122 (not (contains!2541 lt!216786 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75681 (= lt!216786 e!279419)))

(declare-fun c!57200 () Bool)

(assert (=> d!75681 (= c!57200 (bvsge #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> d!75681 (validMask!0 mask!1365)))

(assert (=> d!75681 (= (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216786)))

(declare-fun b!475796 () Bool)

(assert (=> b!475796 (= e!279415 (= lt!216786 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475797 () Bool)

(assert (=> b!475797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> b!475797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15114 _values!833)))))

(declare-fun e!279420 () Bool)

(assert (=> b!475797 (= e!279420 (= (apply!336 lt!216786 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475798 () Bool)

(declare-fun e!279418 () Bool)

(assert (=> b!475798 (= e!279418 e!279420)))

(assert (=> b!475798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun res!284121 () Bool)

(assert (=> b!475798 (= res!284121 (contains!2541 lt!216786 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475798 (=> (not res!284121) (not e!279420))))

(declare-fun b!475799 () Bool)

(assert (=> b!475799 (= e!279421 e!279418)))

(declare-fun c!57199 () Bool)

(declare-fun e!279416 () Bool)

(assert (=> b!475799 (= c!57199 e!279416)))

(declare-fun res!284120 () Bool)

(assert (=> b!475799 (=> (not res!284120) (not e!279416))))

(assert (=> b!475799 (= res!284120 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun b!475800 () Bool)

(declare-fun lt!216787 () Unit!13986)

(declare-fun lt!216788 () Unit!13986)

(assert (=> b!475800 (= lt!216787 lt!216788)))

(declare-fun lt!216789 () ListLongMap!7787)

(declare-fun lt!216783 () (_ BitVec 64))

(declare-fun lt!216784 () V!19083)

(declare-fun lt!216785 () (_ BitVec 64))

(assert (=> b!475800 (not (contains!2541 (+!1767 lt!216789 (tuple2!8873 lt!216783 lt!216784)) lt!216785))))

(assert (=> b!475800 (= lt!216788 (addStillNotContains!171 lt!216789 lt!216783 lt!216784 lt!216785))))

(assert (=> b!475800 (= lt!216785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475800 (= lt!216784 (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475800 (= lt!216783 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30609 () ListLongMap!7787)

(assert (=> b!475800 (= lt!216789 call!30609)))

(assert (=> b!475800 (= e!279417 (+!1767 call!30609 (tuple2!8873 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475801 () Bool)

(assert (=> b!475801 (= e!279416 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475801 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475802 () Bool)

(declare-fun res!284123 () Bool)

(assert (=> b!475802 (=> (not res!284123) (not e!279421))))

(assert (=> b!475802 (= res!284123 (not (contains!2541 lt!216786 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475803 () Bool)

(assert (=> b!475803 (= e!279419 (ListLongMap!7788 Nil!8931))))

(declare-fun b!475804 () Bool)

(assert (=> b!475804 (= e!279417 call!30609)))

(declare-fun b!475805 () Bool)

(assert (=> b!475805 (= e!279418 e!279415)))

(declare-fun c!57197 () Bool)

(assert (=> b!475805 (= c!57197 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun bm!30606 () Bool)

(assert (=> bm!30606 (= call!30609 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!75681 c!57200) b!475803))

(assert (= (and d!75681 (not c!57200)) b!475795))

(assert (= (and b!475795 c!57198) b!475800))

(assert (= (and b!475795 (not c!57198)) b!475804))

(assert (= (or b!475800 b!475804) bm!30606))

(assert (= (and d!75681 res!284122) b!475802))

(assert (= (and b!475802 res!284123) b!475799))

(assert (= (and b!475799 res!284120) b!475801))

(assert (= (and b!475799 c!57199) b!475798))

(assert (= (and b!475799 (not c!57199)) b!475805))

(assert (= (and b!475798 res!284121) b!475797))

(assert (= (and b!475805 c!57197) b!475796))

(assert (= (and b!475805 (not c!57197)) b!475794))

(declare-fun b_lambda!10311 () Bool)

(assert (=> (not b_lambda!10311) (not b!475797)))

(assert (=> b!475797 t!14908))

(declare-fun b_and!20575 () Bool)

(assert (= b_and!20573 (and (=> t!14908 result!7461) b_and!20575)))

(declare-fun b_lambda!10313 () Bool)

(assert (=> (not b_lambda!10313) (not b!475800)))

(assert (=> b!475800 t!14908))

(declare-fun b_and!20577 () Bool)

(assert (= b_and!20575 (and (=> t!14908 result!7461) b_and!20577)))

(assert (=> b!475795 m!458199))

(assert (=> b!475795 m!458199))

(assert (=> b!475795 m!458205))

(declare-fun m!458235 () Bool)

(assert (=> b!475796 m!458235))

(declare-fun m!458237 () Bool)

(assert (=> d!75681 m!458237))

(assert (=> d!75681 m!458105))

(declare-fun m!458239 () Bool)

(assert (=> b!475794 m!458239))

(assert (=> b!475800 m!458199))

(declare-fun m!458241 () Bool)

(assert (=> b!475800 m!458241))

(declare-fun m!458243 () Bool)

(assert (=> b!475800 m!458243))

(assert (=> b!475800 m!458219))

(assert (=> b!475800 m!458241))

(declare-fun m!458245 () Bool)

(assert (=> b!475800 m!458245))

(assert (=> b!475800 m!458223))

(declare-fun m!458247 () Bool)

(assert (=> b!475800 m!458247))

(assert (=> b!475800 m!458223))

(assert (=> b!475800 m!458219))

(assert (=> b!475800 m!458227))

(assert (=> b!475797 m!458199))

(assert (=> b!475797 m!458223))

(assert (=> b!475797 m!458219))

(assert (=> b!475797 m!458227))

(assert (=> b!475797 m!458199))

(declare-fun m!458249 () Bool)

(assert (=> b!475797 m!458249))

(assert (=> b!475797 m!458219))

(assert (=> b!475797 m!458223))

(assert (=> b!475798 m!458199))

(assert (=> b!475798 m!458199))

(declare-fun m!458251 () Bool)

(assert (=> b!475798 m!458251))

(declare-fun m!458253 () Bool)

(assert (=> b!475802 m!458253))

(assert (=> b!475801 m!458199))

(assert (=> b!475801 m!458199))

(assert (=> b!475801 m!458205))

(assert (=> bm!30606 m!458235))

(assert (=> b!475691 d!75681))

(declare-fun b!475848 () Bool)

(declare-fun e!279460 () ListLongMap!7787)

(declare-fun call!30627 () ListLongMap!7787)

(assert (=> b!475848 (= e!279460 (+!1767 call!30627 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475849 () Bool)

(declare-fun e!279448 () Bool)

(assert (=> b!475849 (= e!279448 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun e!279454 () Bool)

(declare-fun lt!216849 () ListLongMap!7787)

(declare-fun b!475850 () Bool)

(assert (=> b!475850 (= e!279454 (= (apply!336 lt!216849 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15114 _values!833)))))

(assert (=> b!475850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun b!475851 () Bool)

(declare-fun e!279459 () Unit!13986)

(declare-fun Unit!13990 () Unit!13986)

(assert (=> b!475851 (= e!279459 Unit!13990)))

(declare-fun b!475852 () Bool)

(declare-fun e!279451 () ListLongMap!7787)

(assert (=> b!475852 (= e!279460 e!279451)))

(declare-fun c!57217 () Bool)

(assert (=> b!475852 (= c!57217 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475853 () Bool)

(declare-fun res!284146 () Bool)

(declare-fun e!279455 () Bool)

(assert (=> b!475853 (=> (not res!284146) (not e!279455))))

(declare-fun e!279453 () Bool)

(assert (=> b!475853 (= res!284146 e!279453)))

(declare-fun c!57218 () Bool)

(assert (=> b!475853 (= c!57218 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475854 () Bool)

(declare-fun e!279452 () Bool)

(declare-fun call!30630 () Bool)

(assert (=> b!475854 (= e!279452 (not call!30630))))

(declare-fun b!475855 () Bool)

(declare-fun res!284147 () Bool)

(assert (=> b!475855 (=> (not res!284147) (not e!279455))))

(declare-fun e!279449 () Bool)

(assert (=> b!475855 (= res!284147 e!279449)))

(declare-fun res!284150 () Bool)

(assert (=> b!475855 (=> res!284150 e!279449)))

(assert (=> b!475855 (= res!284150 (not e!279448))))

(declare-fun res!284143 () Bool)

(assert (=> b!475855 (=> (not res!284143) (not e!279448))))

(assert (=> b!475855 (= res!284143 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun bm!30621 () Bool)

(declare-fun call!30624 () Bool)

(assert (=> bm!30621 (= call!30624 (contains!2541 lt!216849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!30628 () ListLongMap!7787)

(declare-fun bm!30622 () Bool)

(assert (=> bm!30622 (= call!30628 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30623 () Bool)

(declare-fun call!30625 () ListLongMap!7787)

(declare-fun call!30629 () ListLongMap!7787)

(assert (=> bm!30623 (= call!30625 call!30629)))

(declare-fun bm!30624 () Bool)

(declare-fun call!30626 () ListLongMap!7787)

(assert (=> bm!30624 (= call!30626 call!30627)))

(declare-fun b!475856 () Bool)

(declare-fun e!279450 () Bool)

(assert (=> b!475856 (= e!279453 e!279450)))

(declare-fun res!284142 () Bool)

(assert (=> b!475856 (= res!284142 call!30624)))

(assert (=> b!475856 (=> (not res!284142) (not e!279450))))

(declare-fun b!475857 () Bool)

(assert (=> b!475857 (= e!279453 (not call!30624))))

(declare-fun b!475858 () Bool)

(declare-fun c!57213 () Bool)

(assert (=> b!475858 (= c!57213 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279456 () ListLongMap!7787)

(assert (=> b!475858 (= e!279451 e!279456)))

(declare-fun b!475859 () Bool)

(assert (=> b!475859 (= e!279455 e!279452)))

(declare-fun c!57216 () Bool)

(assert (=> b!475859 (= c!57216 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475860 () Bool)

(assert (=> b!475860 (= e!279456 call!30626)))

(declare-fun b!475861 () Bool)

(assert (=> b!475861 (= e!279451 call!30626)))

(declare-fun b!475862 () Bool)

(assert (=> b!475862 (= e!279450 (= (apply!336 lt!216849 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475863 () Bool)

(declare-fun e!279458 () Bool)

(assert (=> b!475863 (= e!279458 (= (apply!336 lt!216849 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun bm!30625 () Bool)

(declare-fun c!57214 () Bool)

(assert (=> bm!30625 (= call!30627 (+!1767 (ite c!57214 call!30628 (ite c!57217 call!30629 call!30625)) (ite (or c!57214 c!57217) (tuple2!8873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!475864 () Bool)

(assert (=> b!475864 (= e!279449 e!279454)))

(declare-fun res!284149 () Bool)

(assert (=> b!475864 (=> (not res!284149) (not e!279454))))

(assert (=> b!475864 (= res!284149 (contains!2541 lt!216849 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475864 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun b!475865 () Bool)

(assert (=> b!475865 (= e!279452 e!279458)))

(declare-fun res!284145 () Bool)

(assert (=> b!475865 (= res!284145 call!30630)))

(assert (=> b!475865 (=> (not res!284145) (not e!279458))))

(declare-fun d!75683 () Bool)

(assert (=> d!75683 e!279455))

(declare-fun res!284148 () Bool)

(assert (=> d!75683 (=> (not res!284148) (not e!279455))))

(assert (=> d!75683 (= res!284148 (or (bvsge #b00000000000000000000000000000000 (size!15115 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))))

(declare-fun lt!216836 () ListLongMap!7787)

(assert (=> d!75683 (= lt!216849 lt!216836)))

(declare-fun lt!216850 () Unit!13986)

(assert (=> d!75683 (= lt!216850 e!279459)))

(declare-fun c!57215 () Bool)

(declare-fun e!279457 () Bool)

(assert (=> d!75683 (= c!57215 e!279457)))

(declare-fun res!284144 () Bool)

(assert (=> d!75683 (=> (not res!284144) (not e!279457))))

(assert (=> d!75683 (= res!284144 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> d!75683 (= lt!216836 e!279460)))

(assert (=> d!75683 (= c!57214 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75683 (validMask!0 mask!1365)))

(assert (=> d!75683 (= (getCurrentListMap!2246 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216849)))

(declare-fun bm!30626 () Bool)

(assert (=> bm!30626 (= call!30629 call!30628)))

(declare-fun b!475866 () Bool)

(assert (=> b!475866 (= e!279457 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475867 () Bool)

(assert (=> b!475867 (= e!279456 call!30625)))

(declare-fun b!475868 () Bool)

(declare-fun lt!216839 () Unit!13986)

(assert (=> b!475868 (= e!279459 lt!216839)))

(declare-fun lt!216852 () ListLongMap!7787)

(assert (=> b!475868 (= lt!216852 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216844 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216842 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216842 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216843 () Unit!13986)

(declare-fun addStillContains!294 (ListLongMap!7787 (_ BitVec 64) V!19083 (_ BitVec 64)) Unit!13986)

(assert (=> b!475868 (= lt!216843 (addStillContains!294 lt!216852 lt!216844 zeroValue!794 lt!216842))))

(assert (=> b!475868 (contains!2541 (+!1767 lt!216852 (tuple2!8873 lt!216844 zeroValue!794)) lt!216842)))

(declare-fun lt!216845 () Unit!13986)

(assert (=> b!475868 (= lt!216845 lt!216843)))

(declare-fun lt!216834 () ListLongMap!7787)

(assert (=> b!475868 (= lt!216834 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216847 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216847 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216838 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216838 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216835 () Unit!13986)

(declare-fun addApplyDifferent!294 (ListLongMap!7787 (_ BitVec 64) V!19083 (_ BitVec 64)) Unit!13986)

(assert (=> b!475868 (= lt!216835 (addApplyDifferent!294 lt!216834 lt!216847 minValueAfter!38 lt!216838))))

(assert (=> b!475868 (= (apply!336 (+!1767 lt!216834 (tuple2!8873 lt!216847 minValueAfter!38)) lt!216838) (apply!336 lt!216834 lt!216838))))

(declare-fun lt!216851 () Unit!13986)

(assert (=> b!475868 (= lt!216851 lt!216835)))

(declare-fun lt!216840 () ListLongMap!7787)

(assert (=> b!475868 (= lt!216840 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216837 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216855 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216855 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216854 () Unit!13986)

(assert (=> b!475868 (= lt!216854 (addApplyDifferent!294 lt!216840 lt!216837 zeroValue!794 lt!216855))))

(assert (=> b!475868 (= (apply!336 (+!1767 lt!216840 (tuple2!8873 lt!216837 zeroValue!794)) lt!216855) (apply!336 lt!216840 lt!216855))))

(declare-fun lt!216841 () Unit!13986)

(assert (=> b!475868 (= lt!216841 lt!216854)))

(declare-fun lt!216848 () ListLongMap!7787)

(assert (=> b!475868 (= lt!216848 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216846 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216846 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216853 () (_ BitVec 64))

(assert (=> b!475868 (= lt!216853 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475868 (= lt!216839 (addApplyDifferent!294 lt!216848 lt!216846 minValueAfter!38 lt!216853))))

(assert (=> b!475868 (= (apply!336 (+!1767 lt!216848 (tuple2!8873 lt!216846 minValueAfter!38)) lt!216853) (apply!336 lt!216848 lt!216853))))

(declare-fun bm!30627 () Bool)

(assert (=> bm!30627 (= call!30630 (contains!2541 lt!216849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!75683 c!57214) b!475848))

(assert (= (and d!75683 (not c!57214)) b!475852))

(assert (= (and b!475852 c!57217) b!475861))

(assert (= (and b!475852 (not c!57217)) b!475858))

(assert (= (and b!475858 c!57213) b!475860))

(assert (= (and b!475858 (not c!57213)) b!475867))

(assert (= (or b!475860 b!475867) bm!30623))

(assert (= (or b!475861 bm!30623) bm!30626))

(assert (= (or b!475861 b!475860) bm!30624))

(assert (= (or b!475848 bm!30626) bm!30622))

(assert (= (or b!475848 bm!30624) bm!30625))

(assert (= (and d!75683 res!284144) b!475866))

(assert (= (and d!75683 c!57215) b!475868))

(assert (= (and d!75683 (not c!57215)) b!475851))

(assert (= (and d!75683 res!284148) b!475855))

(assert (= (and b!475855 res!284143) b!475849))

(assert (= (and b!475855 (not res!284150)) b!475864))

(assert (= (and b!475864 res!284149) b!475850))

(assert (= (and b!475855 res!284147) b!475853))

(assert (= (and b!475853 c!57218) b!475856))

(assert (= (and b!475853 (not c!57218)) b!475857))

(assert (= (and b!475856 res!284142) b!475862))

(assert (= (or b!475856 b!475857) bm!30621))

(assert (= (and b!475853 res!284146) b!475859))

(assert (= (and b!475859 c!57216) b!475865))

(assert (= (and b!475859 (not c!57216)) b!475854))

(assert (= (and b!475865 res!284145) b!475863))

(assert (= (or b!475865 b!475854) bm!30627))

(declare-fun b_lambda!10315 () Bool)

(assert (=> (not b_lambda!10315) (not b!475850)))

(assert (=> b!475850 t!14908))

(declare-fun b_and!20579 () Bool)

(assert (= b_and!20577 (and (=> t!14908 result!7461) b_and!20579)))

(assert (=> b!475849 m!458199))

(assert (=> b!475849 m!458199))

(assert (=> b!475849 m!458205))

(declare-fun m!458255 () Bool)

(assert (=> bm!30627 m!458255))

(declare-fun m!458257 () Bool)

(assert (=> b!475868 m!458257))

(declare-fun m!458259 () Bool)

(assert (=> b!475868 m!458259))

(declare-fun m!458261 () Bool)

(assert (=> b!475868 m!458261))

(declare-fun m!458263 () Bool)

(assert (=> b!475868 m!458263))

(assert (=> b!475868 m!458127))

(declare-fun m!458265 () Bool)

(assert (=> b!475868 m!458265))

(declare-fun m!458267 () Bool)

(assert (=> b!475868 m!458267))

(declare-fun m!458269 () Bool)

(assert (=> b!475868 m!458269))

(declare-fun m!458271 () Bool)

(assert (=> b!475868 m!458271))

(declare-fun m!458273 () Bool)

(assert (=> b!475868 m!458273))

(assert (=> b!475868 m!458269))

(declare-fun m!458275 () Bool)

(assert (=> b!475868 m!458275))

(declare-fun m!458277 () Bool)

(assert (=> b!475868 m!458277))

(assert (=> b!475868 m!458273))

(declare-fun m!458279 () Bool)

(assert (=> b!475868 m!458279))

(assert (=> b!475868 m!458277))

(declare-fun m!458281 () Bool)

(assert (=> b!475868 m!458281))

(declare-fun m!458283 () Bool)

(assert (=> b!475868 m!458283))

(declare-fun m!458285 () Bool)

(assert (=> b!475868 m!458285))

(assert (=> b!475868 m!458259))

(assert (=> b!475868 m!458199))

(assert (=> d!75683 m!458105))

(assert (=> bm!30622 m!458127))

(assert (=> b!475864 m!458199))

(assert (=> b!475864 m!458199))

(declare-fun m!458287 () Bool)

(assert (=> b!475864 m!458287))

(declare-fun m!458289 () Bool)

(assert (=> b!475863 m!458289))

(declare-fun m!458291 () Bool)

(assert (=> bm!30621 m!458291))

(declare-fun m!458293 () Bool)

(assert (=> b!475848 m!458293))

(declare-fun m!458295 () Bool)

(assert (=> bm!30625 m!458295))

(assert (=> b!475850 m!458223))

(assert (=> b!475850 m!458199))

(assert (=> b!475850 m!458199))

(declare-fun m!458297 () Bool)

(assert (=> b!475850 m!458297))

(assert (=> b!475850 m!458223))

(assert (=> b!475850 m!458219))

(assert (=> b!475850 m!458227))

(assert (=> b!475850 m!458219))

(assert (=> b!475866 m!458199))

(assert (=> b!475866 m!458199))

(assert (=> b!475866 m!458205))

(declare-fun m!458299 () Bool)

(assert (=> b!475862 m!458299))

(assert (=> b!475692 d!75683))

(declare-fun d!75685 () Bool)

(declare-fun e!279463 () Bool)

(assert (=> d!75685 e!279463))

(declare-fun res!284155 () Bool)

(assert (=> d!75685 (=> (not res!284155) (not e!279463))))

(declare-fun lt!216867 () ListLongMap!7787)

(assert (=> d!75685 (= res!284155 (contains!2541 lt!216867 (_1!4447 lt!216717)))))

(declare-fun lt!216866 () List!8934)

(assert (=> d!75685 (= lt!216867 (ListLongMap!7788 lt!216866))))

(declare-fun lt!216864 () Unit!13986)

(declare-fun lt!216865 () Unit!13986)

(assert (=> d!75685 (= lt!216864 lt!216865)))

(declare-datatypes ((Option!390 0))(
  ( (Some!389 (v!9084 V!19083)) (None!388) )
))
(declare-fun getValueByKey!384 (List!8934 (_ BitVec 64)) Option!390)

(assert (=> d!75685 (= (getValueByKey!384 lt!216866 (_1!4447 lt!216717)) (Some!389 (_2!4447 lt!216717)))))

(declare-fun lemmaContainsTupThenGetReturnValue!206 (List!8934 (_ BitVec 64) V!19083) Unit!13986)

(assert (=> d!75685 (= lt!216865 (lemmaContainsTupThenGetReturnValue!206 lt!216866 (_1!4447 lt!216717) (_2!4447 lt!216717)))))

(declare-fun insertStrictlySorted!209 (List!8934 (_ BitVec 64) V!19083) List!8934)

(assert (=> d!75685 (= lt!216866 (insertStrictlySorted!209 (toList!3909 (+!1767 lt!216719 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4447 lt!216717) (_2!4447 lt!216717)))))

(assert (=> d!75685 (= (+!1767 (+!1767 lt!216719 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216717) lt!216867)))

(declare-fun b!475873 () Bool)

(declare-fun res!284156 () Bool)

(assert (=> b!475873 (=> (not res!284156) (not e!279463))))

(assert (=> b!475873 (= res!284156 (= (getValueByKey!384 (toList!3909 lt!216867) (_1!4447 lt!216717)) (Some!389 (_2!4447 lt!216717))))))

(declare-fun b!475874 () Bool)

(declare-fun contains!2542 (List!8934 tuple2!8872) Bool)

(assert (=> b!475874 (= e!279463 (contains!2542 (toList!3909 lt!216867) lt!216717))))

(assert (= (and d!75685 res!284155) b!475873))

(assert (= (and b!475873 res!284156) b!475874))

(declare-fun m!458301 () Bool)

(assert (=> d!75685 m!458301))

(declare-fun m!458303 () Bool)

(assert (=> d!75685 m!458303))

(declare-fun m!458305 () Bool)

(assert (=> d!75685 m!458305))

(declare-fun m!458307 () Bool)

(assert (=> d!75685 m!458307))

(declare-fun m!458309 () Bool)

(assert (=> b!475873 m!458309))

(declare-fun m!458311 () Bool)

(assert (=> b!475874 m!458311))

(assert (=> b!475692 d!75685))

(declare-fun d!75687 () Bool)

(declare-fun e!279464 () Bool)

(assert (=> d!75687 e!279464))

(declare-fun res!284157 () Bool)

(assert (=> d!75687 (=> (not res!284157) (not e!279464))))

(declare-fun lt!216871 () ListLongMap!7787)

(assert (=> d!75687 (= res!284157 (contains!2541 lt!216871 (_1!4447 lt!216717)))))

(declare-fun lt!216870 () List!8934)

(assert (=> d!75687 (= lt!216871 (ListLongMap!7788 lt!216870))))

(declare-fun lt!216868 () Unit!13986)

(declare-fun lt!216869 () Unit!13986)

(assert (=> d!75687 (= lt!216868 lt!216869)))

(assert (=> d!75687 (= (getValueByKey!384 lt!216870 (_1!4447 lt!216717)) (Some!389 (_2!4447 lt!216717)))))

(assert (=> d!75687 (= lt!216869 (lemmaContainsTupThenGetReturnValue!206 lt!216870 (_1!4447 lt!216717) (_2!4447 lt!216717)))))

(assert (=> d!75687 (= lt!216870 (insertStrictlySorted!209 (toList!3909 lt!216719) (_1!4447 lt!216717) (_2!4447 lt!216717)))))

(assert (=> d!75687 (= (+!1767 lt!216719 lt!216717) lt!216871)))

(declare-fun b!475875 () Bool)

(declare-fun res!284158 () Bool)

(assert (=> b!475875 (=> (not res!284158) (not e!279464))))

(assert (=> b!475875 (= res!284158 (= (getValueByKey!384 (toList!3909 lt!216871) (_1!4447 lt!216717)) (Some!389 (_2!4447 lt!216717))))))

(declare-fun b!475876 () Bool)

(assert (=> b!475876 (= e!279464 (contains!2542 (toList!3909 lt!216871) lt!216717))))

(assert (= (and d!75687 res!284157) b!475875))

(assert (= (and b!475875 res!284158) b!475876))

(declare-fun m!458313 () Bool)

(assert (=> d!75687 m!458313))

(declare-fun m!458315 () Bool)

(assert (=> d!75687 m!458315))

(declare-fun m!458317 () Bool)

(assert (=> d!75687 m!458317))

(declare-fun m!458319 () Bool)

(assert (=> d!75687 m!458319))

(declare-fun m!458321 () Bool)

(assert (=> b!475875 m!458321))

(declare-fun m!458323 () Bool)

(assert (=> b!475876 m!458323))

(assert (=> b!475692 d!75687))

(declare-fun d!75689 () Bool)

(declare-fun e!279465 () Bool)

(assert (=> d!75689 e!279465))

(declare-fun res!284159 () Bool)

(assert (=> d!75689 (=> (not res!284159) (not e!279465))))

(declare-fun lt!216875 () ListLongMap!7787)

(assert (=> d!75689 (= res!284159 (contains!2541 lt!216875 (_1!4447 lt!216717)))))

(declare-fun lt!216874 () List!8934)

(assert (=> d!75689 (= lt!216875 (ListLongMap!7788 lt!216874))))

(declare-fun lt!216872 () Unit!13986)

(declare-fun lt!216873 () Unit!13986)

(assert (=> d!75689 (= lt!216872 lt!216873)))

(assert (=> d!75689 (= (getValueByKey!384 lt!216874 (_1!4447 lt!216717)) (Some!389 (_2!4447 lt!216717)))))

(assert (=> d!75689 (= lt!216873 (lemmaContainsTupThenGetReturnValue!206 lt!216874 (_1!4447 lt!216717) (_2!4447 lt!216717)))))

(assert (=> d!75689 (= lt!216874 (insertStrictlySorted!209 (toList!3909 lt!216722) (_1!4447 lt!216717) (_2!4447 lt!216717)))))

(assert (=> d!75689 (= (+!1767 lt!216722 lt!216717) lt!216875)))

(declare-fun b!475877 () Bool)

(declare-fun res!284160 () Bool)

(assert (=> b!475877 (=> (not res!284160) (not e!279465))))

(assert (=> b!475877 (= res!284160 (= (getValueByKey!384 (toList!3909 lt!216875) (_1!4447 lt!216717)) (Some!389 (_2!4447 lt!216717))))))

(declare-fun b!475878 () Bool)

(assert (=> b!475878 (= e!279465 (contains!2542 (toList!3909 lt!216875) lt!216717))))

(assert (= (and d!75689 res!284159) b!475877))

(assert (= (and b!475877 res!284160) b!475878))

(declare-fun m!458325 () Bool)

(assert (=> d!75689 m!458325))

(declare-fun m!458327 () Bool)

(assert (=> d!75689 m!458327))

(declare-fun m!458329 () Bool)

(assert (=> d!75689 m!458329))

(declare-fun m!458331 () Bool)

(assert (=> d!75689 m!458331))

(declare-fun m!458333 () Bool)

(assert (=> b!475877 m!458333))

(declare-fun m!458335 () Bool)

(assert (=> b!475878 m!458335))

(assert (=> b!475692 d!75689))

(declare-fun b!475879 () Bool)

(declare-fun e!279478 () ListLongMap!7787)

(declare-fun call!30634 () ListLongMap!7787)

(assert (=> b!475879 (= e!279478 (+!1767 call!30634 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!475880 () Bool)

(declare-fun e!279466 () Bool)

(assert (=> b!475880 (= e!279466 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun e!279472 () Bool)

(declare-fun b!475881 () Bool)

(declare-fun lt!216891 () ListLongMap!7787)

(assert (=> b!475881 (= e!279472 (= (apply!336 lt!216891 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14762 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15114 _values!833)))))

(assert (=> b!475881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun b!475882 () Bool)

(declare-fun e!279477 () Unit!13986)

(declare-fun Unit!13991 () Unit!13986)

(assert (=> b!475882 (= e!279477 Unit!13991)))

(declare-fun b!475883 () Bool)

(declare-fun e!279469 () ListLongMap!7787)

(assert (=> b!475883 (= e!279478 e!279469)))

(declare-fun c!57223 () Bool)

(assert (=> b!475883 (= c!57223 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475884 () Bool)

(declare-fun res!284165 () Bool)

(declare-fun e!279473 () Bool)

(assert (=> b!475884 (=> (not res!284165) (not e!279473))))

(declare-fun e!279471 () Bool)

(assert (=> b!475884 (= res!284165 e!279471)))

(declare-fun c!57224 () Bool)

(assert (=> b!475884 (= c!57224 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475885 () Bool)

(declare-fun e!279470 () Bool)

(declare-fun call!30637 () Bool)

(assert (=> b!475885 (= e!279470 (not call!30637))))

(declare-fun b!475886 () Bool)

(declare-fun res!284166 () Bool)

(assert (=> b!475886 (=> (not res!284166) (not e!279473))))

(declare-fun e!279467 () Bool)

(assert (=> b!475886 (= res!284166 e!279467)))

(declare-fun res!284169 () Bool)

(assert (=> b!475886 (=> res!284169 e!279467)))

(assert (=> b!475886 (= res!284169 (not e!279466))))

(declare-fun res!284162 () Bool)

(assert (=> b!475886 (=> (not res!284162) (not e!279466))))

(assert (=> b!475886 (= res!284162 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun bm!30628 () Bool)

(declare-fun call!30631 () Bool)

(assert (=> bm!30628 (= call!30631 (contains!2541 lt!216891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30629 () Bool)

(declare-fun call!30635 () ListLongMap!7787)

(assert (=> bm!30629 (= call!30635 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30630 () Bool)

(declare-fun call!30632 () ListLongMap!7787)

(declare-fun call!30636 () ListLongMap!7787)

(assert (=> bm!30630 (= call!30632 call!30636)))

(declare-fun bm!30631 () Bool)

(declare-fun call!30633 () ListLongMap!7787)

(assert (=> bm!30631 (= call!30633 call!30634)))

(declare-fun b!475887 () Bool)

(declare-fun e!279468 () Bool)

(assert (=> b!475887 (= e!279471 e!279468)))

(declare-fun res!284161 () Bool)

(assert (=> b!475887 (= res!284161 call!30631)))

(assert (=> b!475887 (=> (not res!284161) (not e!279468))))

(declare-fun b!475888 () Bool)

(assert (=> b!475888 (= e!279471 (not call!30631))))

(declare-fun b!475889 () Bool)

(declare-fun c!57219 () Bool)

(assert (=> b!475889 (= c!57219 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279474 () ListLongMap!7787)

(assert (=> b!475889 (= e!279469 e!279474)))

(declare-fun b!475890 () Bool)

(assert (=> b!475890 (= e!279473 e!279470)))

(declare-fun c!57222 () Bool)

(assert (=> b!475890 (= c!57222 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475891 () Bool)

(assert (=> b!475891 (= e!279474 call!30633)))

(declare-fun b!475892 () Bool)

(assert (=> b!475892 (= e!279469 call!30633)))

(declare-fun b!475893 () Bool)

(assert (=> b!475893 (= e!279468 (= (apply!336 lt!216891 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475894 () Bool)

(declare-fun e!279476 () Bool)

(assert (=> b!475894 (= e!279476 (= (apply!336 lt!216891 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun c!57220 () Bool)

(declare-fun bm!30632 () Bool)

(assert (=> bm!30632 (= call!30634 (+!1767 (ite c!57220 call!30635 (ite c!57223 call!30636 call!30632)) (ite (or c!57220 c!57223) (tuple2!8873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!475895 () Bool)

(assert (=> b!475895 (= e!279467 e!279472)))

(declare-fun res!284168 () Bool)

(assert (=> b!475895 (=> (not res!284168) (not e!279472))))

(assert (=> b!475895 (= res!284168 (contains!2541 lt!216891 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(declare-fun b!475896 () Bool)

(assert (=> b!475896 (= e!279470 e!279476)))

(declare-fun res!284164 () Bool)

(assert (=> b!475896 (= res!284164 call!30637)))

(assert (=> b!475896 (=> (not res!284164) (not e!279476))))

(declare-fun d!75691 () Bool)

(assert (=> d!75691 e!279473))

(declare-fun res!284167 () Bool)

(assert (=> d!75691 (=> (not res!284167) (not e!279473))))

(assert (=> d!75691 (= res!284167 (or (bvsge #b00000000000000000000000000000000 (size!15115 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))))

(declare-fun lt!216878 () ListLongMap!7787)

(assert (=> d!75691 (= lt!216891 lt!216878)))

(declare-fun lt!216892 () Unit!13986)

(assert (=> d!75691 (= lt!216892 e!279477)))

(declare-fun c!57221 () Bool)

(declare-fun e!279475 () Bool)

(assert (=> d!75691 (= c!57221 e!279475)))

(declare-fun res!284163 () Bool)

(assert (=> d!75691 (=> (not res!284163) (not e!279475))))

(assert (=> d!75691 (= res!284163 (bvslt #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> d!75691 (= lt!216878 e!279478)))

(assert (=> d!75691 (= c!57220 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75691 (validMask!0 mask!1365)))

(assert (=> d!75691 (= (getCurrentListMap!2246 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216891)))

(declare-fun bm!30633 () Bool)

(assert (=> bm!30633 (= call!30636 call!30635)))

(declare-fun b!475897 () Bool)

(assert (=> b!475897 (= e!279475 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475898 () Bool)

(assert (=> b!475898 (= e!279474 call!30632)))

(declare-fun b!475899 () Bool)

(declare-fun lt!216881 () Unit!13986)

(assert (=> b!475899 (= e!279477 lt!216881)))

(declare-fun lt!216894 () ListLongMap!7787)

(assert (=> b!475899 (= lt!216894 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216886 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216884 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216884 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216885 () Unit!13986)

(assert (=> b!475899 (= lt!216885 (addStillContains!294 lt!216894 lt!216886 zeroValue!794 lt!216884))))

(assert (=> b!475899 (contains!2541 (+!1767 lt!216894 (tuple2!8873 lt!216886 zeroValue!794)) lt!216884)))

(declare-fun lt!216887 () Unit!13986)

(assert (=> b!475899 (= lt!216887 lt!216885)))

(declare-fun lt!216876 () ListLongMap!7787)

(assert (=> b!475899 (= lt!216876 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216889 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216889 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216880 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216880 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216877 () Unit!13986)

(assert (=> b!475899 (= lt!216877 (addApplyDifferent!294 lt!216876 lt!216889 minValueBefore!38 lt!216880))))

(assert (=> b!475899 (= (apply!336 (+!1767 lt!216876 (tuple2!8873 lt!216889 minValueBefore!38)) lt!216880) (apply!336 lt!216876 lt!216880))))

(declare-fun lt!216893 () Unit!13986)

(assert (=> b!475899 (= lt!216893 lt!216877)))

(declare-fun lt!216882 () ListLongMap!7787)

(assert (=> b!475899 (= lt!216882 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216879 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216879 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216897 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216897 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216896 () Unit!13986)

(assert (=> b!475899 (= lt!216896 (addApplyDifferent!294 lt!216882 lt!216879 zeroValue!794 lt!216897))))

(assert (=> b!475899 (= (apply!336 (+!1767 lt!216882 (tuple2!8873 lt!216879 zeroValue!794)) lt!216897) (apply!336 lt!216882 lt!216897))))

(declare-fun lt!216883 () Unit!13986)

(assert (=> b!475899 (= lt!216883 lt!216896)))

(declare-fun lt!216890 () ListLongMap!7787)

(assert (=> b!475899 (= lt!216890 (getCurrentListMapNoExtraKeys!2116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216888 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216888 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216895 () (_ BitVec 64))

(assert (=> b!475899 (= lt!216895 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475899 (= lt!216881 (addApplyDifferent!294 lt!216890 lt!216888 minValueBefore!38 lt!216895))))

(assert (=> b!475899 (= (apply!336 (+!1767 lt!216890 (tuple2!8873 lt!216888 minValueBefore!38)) lt!216895) (apply!336 lt!216890 lt!216895))))

(declare-fun bm!30634 () Bool)

(assert (=> bm!30634 (= call!30637 (contains!2541 lt!216891 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!75691 c!57220) b!475879))

(assert (= (and d!75691 (not c!57220)) b!475883))

(assert (= (and b!475883 c!57223) b!475892))

(assert (= (and b!475883 (not c!57223)) b!475889))

(assert (= (and b!475889 c!57219) b!475891))

(assert (= (and b!475889 (not c!57219)) b!475898))

(assert (= (or b!475891 b!475898) bm!30630))

(assert (= (or b!475892 bm!30630) bm!30633))

(assert (= (or b!475892 b!475891) bm!30631))

(assert (= (or b!475879 bm!30633) bm!30629))

(assert (= (or b!475879 bm!30631) bm!30632))

(assert (= (and d!75691 res!284163) b!475897))

(assert (= (and d!75691 c!57221) b!475899))

(assert (= (and d!75691 (not c!57221)) b!475882))

(assert (= (and d!75691 res!284167) b!475886))

(assert (= (and b!475886 res!284162) b!475880))

(assert (= (and b!475886 (not res!284169)) b!475895))

(assert (= (and b!475895 res!284168) b!475881))

(assert (= (and b!475886 res!284166) b!475884))

(assert (= (and b!475884 c!57224) b!475887))

(assert (= (and b!475884 (not c!57224)) b!475888))

(assert (= (and b!475887 res!284161) b!475893))

(assert (= (or b!475887 b!475888) bm!30628))

(assert (= (and b!475884 res!284165) b!475890))

(assert (= (and b!475890 c!57222) b!475896))

(assert (= (and b!475890 (not c!57222)) b!475885))

(assert (= (and b!475896 res!284164) b!475894))

(assert (= (or b!475896 b!475885) bm!30634))

(declare-fun b_lambda!10317 () Bool)

(assert (=> (not b_lambda!10317) (not b!475881)))

(assert (=> b!475881 t!14908))

(declare-fun b_and!20581 () Bool)

(assert (= b_and!20579 (and (=> t!14908 result!7461) b_and!20581)))

(assert (=> b!475880 m!458199))

(assert (=> b!475880 m!458199))

(assert (=> b!475880 m!458205))

(declare-fun m!458337 () Bool)

(assert (=> bm!30634 m!458337))

(declare-fun m!458339 () Bool)

(assert (=> b!475899 m!458339))

(declare-fun m!458341 () Bool)

(assert (=> b!475899 m!458341))

(declare-fun m!458343 () Bool)

(assert (=> b!475899 m!458343))

(declare-fun m!458345 () Bool)

(assert (=> b!475899 m!458345))

(assert (=> b!475899 m!458129))

(declare-fun m!458347 () Bool)

(assert (=> b!475899 m!458347))

(declare-fun m!458349 () Bool)

(assert (=> b!475899 m!458349))

(declare-fun m!458351 () Bool)

(assert (=> b!475899 m!458351))

(declare-fun m!458353 () Bool)

(assert (=> b!475899 m!458353))

(declare-fun m!458355 () Bool)

(assert (=> b!475899 m!458355))

(assert (=> b!475899 m!458351))

(declare-fun m!458357 () Bool)

(assert (=> b!475899 m!458357))

(declare-fun m!458359 () Bool)

(assert (=> b!475899 m!458359))

(assert (=> b!475899 m!458355))

(declare-fun m!458361 () Bool)

(assert (=> b!475899 m!458361))

(assert (=> b!475899 m!458359))

(declare-fun m!458363 () Bool)

(assert (=> b!475899 m!458363))

(declare-fun m!458365 () Bool)

(assert (=> b!475899 m!458365))

(declare-fun m!458367 () Bool)

(assert (=> b!475899 m!458367))

(assert (=> b!475899 m!458341))

(assert (=> b!475899 m!458199))

(assert (=> d!75691 m!458105))

(assert (=> bm!30629 m!458129))

(assert (=> b!475895 m!458199))

(assert (=> b!475895 m!458199))

(declare-fun m!458369 () Bool)

(assert (=> b!475895 m!458369))

(declare-fun m!458371 () Bool)

(assert (=> b!475894 m!458371))

(declare-fun m!458373 () Bool)

(assert (=> bm!30628 m!458373))

(declare-fun m!458375 () Bool)

(assert (=> b!475879 m!458375))

(declare-fun m!458377 () Bool)

(assert (=> bm!30632 m!458377))

(assert (=> b!475881 m!458223))

(assert (=> b!475881 m!458199))

(assert (=> b!475881 m!458199))

(declare-fun m!458379 () Bool)

(assert (=> b!475881 m!458379))

(assert (=> b!475881 m!458223))

(assert (=> b!475881 m!458219))

(assert (=> b!475881 m!458227))

(assert (=> b!475881 m!458219))

(assert (=> b!475897 m!458199))

(assert (=> b!475897 m!458199))

(assert (=> b!475897 m!458205))

(declare-fun m!458381 () Bool)

(assert (=> b!475893 m!458381))

(assert (=> b!475692 d!75691))

(declare-fun d!75693 () Bool)

(declare-fun e!279479 () Bool)

(assert (=> d!75693 e!279479))

(declare-fun res!284170 () Bool)

(assert (=> d!75693 (=> (not res!284170) (not e!279479))))

(declare-fun lt!216901 () ListLongMap!7787)

(assert (=> d!75693 (= res!284170 (contains!2541 lt!216901 (_1!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!216900 () List!8934)

(assert (=> d!75693 (= lt!216901 (ListLongMap!7788 lt!216900))))

(declare-fun lt!216898 () Unit!13986)

(declare-fun lt!216899 () Unit!13986)

(assert (=> d!75693 (= lt!216898 lt!216899)))

(assert (=> d!75693 (= (getValueByKey!384 lt!216900 (_1!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!389 (_2!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75693 (= lt!216899 (lemmaContainsTupThenGetReturnValue!206 lt!216900 (_1!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75693 (= lt!216900 (insertStrictlySorted!209 (toList!3909 lt!216719) (_1!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75693 (= (+!1767 lt!216719 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216901)))

(declare-fun b!475900 () Bool)

(declare-fun res!284171 () Bool)

(assert (=> b!475900 (=> (not res!284171) (not e!279479))))

(assert (=> b!475900 (= res!284171 (= (getValueByKey!384 (toList!3909 lt!216901) (_1!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!389 (_2!4447 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!475901 () Bool)

(assert (=> b!475901 (= e!279479 (contains!2542 (toList!3909 lt!216901) (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75693 res!284170) b!475900))

(assert (= (and b!475900 res!284171) b!475901))

(declare-fun m!458383 () Bool)

(assert (=> d!75693 m!458383))

(declare-fun m!458385 () Bool)

(assert (=> d!75693 m!458385))

(declare-fun m!458387 () Bool)

(assert (=> d!75693 m!458387))

(declare-fun m!458389 () Bool)

(assert (=> d!75693 m!458389))

(declare-fun m!458391 () Bool)

(assert (=> b!475900 m!458391))

(declare-fun m!458393 () Bool)

(assert (=> b!475901 m!458393))

(assert (=> b!475692 d!75693))

(declare-fun d!75695 () Bool)

(assert (=> d!75695 (= (+!1767 lt!216719 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1767 (+!1767 lt!216719 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!216904 () Unit!13986)

(declare-fun choose!1364 (ListLongMap!7787 (_ BitVec 64) V!19083 V!19083) Unit!13986)

(assert (=> d!75695 (= lt!216904 (choose!1364 lt!216719 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75695 (= (addSameAsAddTwiceSameKeyDiffValues!164 lt!216719 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!216904)))

(declare-fun bs!15126 () Bool)

(assert (= bs!15126 d!75695))

(declare-fun m!458395 () Bool)

(assert (=> bs!15126 m!458395))

(assert (=> bs!15126 m!458111))

(assert (=> bs!15126 m!458111))

(declare-fun m!458397 () Bool)

(assert (=> bs!15126 m!458397))

(declare-fun m!458399 () Bool)

(assert (=> bs!15126 m!458399))

(assert (=> b!475692 d!75695))

(declare-fun d!75697 () Bool)

(assert (=> d!75697 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42636 d!75697))

(declare-fun d!75699 () Bool)

(assert (=> d!75699 (= (array_inv!10730 _keys!1025) (bvsge (size!15115 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42636 d!75699))

(declare-fun d!75701 () Bool)

(assert (=> d!75701 (= (array_inv!10731 _values!833) (bvsge (size!15114 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42636 d!75701))

(declare-fun b!475910 () Bool)

(declare-fun e!279486 () Bool)

(declare-fun e!279487 () Bool)

(assert (=> b!475910 (= e!279486 e!279487)))

(declare-fun c!57227 () Bool)

(assert (=> b!475910 (= c!57227 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475911 () Bool)

(declare-fun e!279488 () Bool)

(declare-fun call!30640 () Bool)

(assert (=> b!475911 (= e!279488 call!30640)))

(declare-fun b!475912 () Bool)

(assert (=> b!475912 (= e!279487 e!279488)))

(declare-fun lt!216911 () (_ BitVec 64))

(assert (=> b!475912 (= lt!216911 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216913 () Unit!13986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30696 (_ BitVec 64) (_ BitVec 32)) Unit!13986)

(assert (=> b!475912 (= lt!216913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216911 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475912 (arrayContainsKey!0 _keys!1025 lt!216911 #b00000000000000000000000000000000)))

(declare-fun lt!216912 () Unit!13986)

(assert (=> b!475912 (= lt!216912 lt!216913)))

(declare-fun res!284176 () Bool)

(declare-datatypes ((SeekEntryResult!3509 0))(
  ( (MissingZero!3509 (index!16215 (_ BitVec 32))) (Found!3509 (index!16216 (_ BitVec 32))) (Intermediate!3509 (undefined!4321 Bool) (index!16217 (_ BitVec 32)) (x!44610 (_ BitVec 32))) (Undefined!3509) (MissingVacant!3509 (index!16218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30696 (_ BitVec 32)) SeekEntryResult!3509)

(assert (=> b!475912 (= res!284176 (= (seekEntryOrOpen!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3509 #b00000000000000000000000000000000)))))

(assert (=> b!475912 (=> (not res!284176) (not e!279488))))

(declare-fun b!475913 () Bool)

(assert (=> b!475913 (= e!279487 call!30640)))

(declare-fun bm!30637 () Bool)

(assert (=> bm!30637 (= call!30640 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75703 () Bool)

(declare-fun res!284177 () Bool)

(assert (=> d!75703 (=> res!284177 e!279486)))

(assert (=> d!75703 (= res!284177 (bvsge #b00000000000000000000000000000000 (size!15115 _keys!1025)))))

(assert (=> d!75703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279486)))

(assert (= (and d!75703 (not res!284177)) b!475910))

(assert (= (and b!475910 c!57227) b!475912))

(assert (= (and b!475910 (not c!57227)) b!475913))

(assert (= (and b!475912 res!284176) b!475911))

(assert (= (or b!475911 b!475913) bm!30637))

(assert (=> b!475910 m!458199))

(assert (=> b!475910 m!458199))

(assert (=> b!475910 m!458205))

(assert (=> b!475912 m!458199))

(declare-fun m!458401 () Bool)

(assert (=> b!475912 m!458401))

(declare-fun m!458403 () Bool)

(assert (=> b!475912 m!458403))

(assert (=> b!475912 m!458199))

(declare-fun m!458405 () Bool)

(assert (=> b!475912 m!458405))

(declare-fun m!458407 () Bool)

(assert (=> bm!30637 m!458407))

(assert (=> b!475685 d!75703))

(declare-fun mapIsEmpty!21958 () Bool)

(declare-fun mapRes!21958 () Bool)

(assert (=> mapIsEmpty!21958 mapRes!21958))

(declare-fun b!475921 () Bool)

(declare-fun e!279493 () Bool)

(assert (=> b!475921 (= e!279493 tp_is_empty!13483)))

(declare-fun condMapEmpty!21958 () Bool)

(declare-fun mapDefault!21958 () ValueCell!6398)

(assert (=> mapNonEmpty!21949 (= condMapEmpty!21958 (= mapRest!21949 ((as const (Array (_ BitVec 32) ValueCell!6398)) mapDefault!21958)))))

(assert (=> mapNonEmpty!21949 (= tp!42210 (and e!279493 mapRes!21958))))

(declare-fun mapNonEmpty!21958 () Bool)

(declare-fun tp!42226 () Bool)

(declare-fun e!279494 () Bool)

(assert (=> mapNonEmpty!21958 (= mapRes!21958 (and tp!42226 e!279494))))

(declare-fun mapValue!21958 () ValueCell!6398)

(declare-fun mapKey!21958 () (_ BitVec 32))

(declare-fun mapRest!21958 () (Array (_ BitVec 32) ValueCell!6398))

(assert (=> mapNonEmpty!21958 (= mapRest!21949 (store mapRest!21958 mapKey!21958 mapValue!21958))))

(declare-fun b!475920 () Bool)

(assert (=> b!475920 (= e!279494 tp_is_empty!13483)))

(assert (= (and mapNonEmpty!21949 condMapEmpty!21958) mapIsEmpty!21958))

(assert (= (and mapNonEmpty!21949 (not condMapEmpty!21958)) mapNonEmpty!21958))

(assert (= (and mapNonEmpty!21958 ((_ is ValueCellFull!6398) mapValue!21958)) b!475920))

(assert (= (and mapNonEmpty!21949 ((_ is ValueCellFull!6398) mapDefault!21958)) b!475921))

(declare-fun m!458409 () Bool)

(assert (=> mapNonEmpty!21958 m!458409))

(declare-fun b_lambda!10319 () Bool)

(assert (= b_lambda!10309 (or (and start!42636 b_free!12055) b_lambda!10319)))

(declare-fun b_lambda!10321 () Bool)

(assert (= b_lambda!10317 (or (and start!42636 b_free!12055) b_lambda!10321)))

(declare-fun b_lambda!10323 () Bool)

(assert (= b_lambda!10315 (or (and start!42636 b_free!12055) b_lambda!10323)))

(declare-fun b_lambda!10325 () Bool)

(assert (= b_lambda!10307 (or (and start!42636 b_free!12055) b_lambda!10325)))

(declare-fun b_lambda!10327 () Bool)

(assert (= b_lambda!10313 (or (and start!42636 b_free!12055) b_lambda!10327)))

(declare-fun b_lambda!10329 () Bool)

(assert (= b_lambda!10311 (or (and start!42636 b_free!12055) b_lambda!10329)))

(check-sat tp_is_empty!13483 (not b!475848) (not bm!30628) (not d!75691) (not d!75679) (not bm!30622) (not b!475783) (not b!475781) (not bm!30637) (not b!475780) (not b!475850) (not b!475874) (not b!475801) (not b!475862) b_and!20581 (not b!475864) (not b!475784) (not b_lambda!10319) (not b!475879) (not b!475910) (not d!75685) (not b!475753) (not b!475795) (not b!475894) (not b!475800) (not b!475798) (not b!475880) (not d!75695) (not bm!30629) (not b!475863) (not b!475754) (not b!475782) (not bm!30606) (not b!475752) (not bm!30632) (not b!475900) (not b!475877) (not b!475895) (not b!475873) (not bm!30602) (not b!475866) (not bm!30621) (not bm!30625) (not d!75683) (not d!75689) (not b!475878) (not bm!30605) (not b_lambda!10321) (not b!475899) (not b!475912) (not b_lambda!10323) (not b!475875) (not b!475876) (not b!475787) (not b!475868) (not b!475788) (not mapNonEmpty!21958) (not d!75677) (not d!75693) (not b!475786) (not b!475881) (not d!75681) (not bm!30627) (not b_lambda!10329) (not b!475802) (not b!475797) (not b_lambda!10325) (not b!475849) (not b!475897) (not b!475796) (not b_lambda!10327) (not b!475794) (not b_next!12055) (not bm!30634) (not b!475901) (not b!475893) (not d!75687))
(check-sat b_and!20581 (not b_next!12055))

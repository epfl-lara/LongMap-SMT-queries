; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42604 () Bool)

(assert start!42604)

(declare-fun b_free!12039 () Bool)

(declare-fun b_next!12039 () Bool)

(assert (=> start!42604 (= b_free!12039 (not b_next!12039))))

(declare-fun tp!42157 () Bool)

(declare-fun b_and!20519 () Bool)

(assert (=> start!42604 (= tp!42157 b_and!20519)))

(declare-fun b!475298 () Bool)

(declare-fun e!279075 () Bool)

(declare-datatypes ((array!30669 0))(
  ( (array!30670 (arr!14752 (Array (_ BitVec 32) (_ BitVec 64))) (size!15104 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30669)

(assert (=> b!475298 (= e!279075 (bvsgt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(declare-datatypes ((V!19061 0))(
  ( (V!19062 (val!6778 Int)) )
))
(declare-fun zeroValue!794 () V!19061)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8936 0))(
  ( (tuple2!8937 (_1!4479 (_ BitVec 64)) (_2!4479 V!19061)) )
))
(declare-datatypes ((List!9015 0))(
  ( (Nil!9012) (Cons!9011 (h!9867 tuple2!8936) (t!14989 List!9015)) )
))
(declare-datatypes ((ListLongMap!7849 0))(
  ( (ListLongMap!7850 (toList!3940 List!9015)) )
))
(declare-fun lt!216436 () ListLongMap!7849)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6390 0))(
  ( (ValueCellFull!6390 (v!9071 V!19061)) (EmptyCell!6390) )
))
(declare-datatypes ((array!30671 0))(
  ( (array!30672 (arr!14753 (Array (_ BitVec 32) ValueCell!6390)) (size!15105 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30671)

(declare-fun minValueAfter!38 () V!19061)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2097 (array!30669 array!30671 (_ BitVec 32) (_ BitVec 32) V!19061 V!19061 (_ BitVec 32) Int) ListLongMap!7849)

(assert (=> b!475298 (= lt!216436 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19061)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216437 () ListLongMap!7849)

(assert (=> b!475298 (= lt!216437 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283854 () Bool)

(assert (=> start!42604 (=> (not res!283854) (not e!279075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42604 (= res!283854 (validMask!0 mask!1365))))

(assert (=> start!42604 e!279075))

(declare-fun tp_is_empty!13467 () Bool)

(assert (=> start!42604 tp_is_empty!13467))

(assert (=> start!42604 tp!42157))

(assert (=> start!42604 true))

(declare-fun array_inv!10646 (array!30669) Bool)

(assert (=> start!42604 (array_inv!10646 _keys!1025)))

(declare-fun e!279074 () Bool)

(declare-fun array_inv!10647 (array!30671) Bool)

(assert (=> start!42604 (and (array_inv!10647 _values!833) e!279074)))

(declare-fun b!475299 () Bool)

(declare-fun res!283852 () Bool)

(assert (=> b!475299 (=> (not res!283852) (not e!279075))))

(declare-datatypes ((List!9016 0))(
  ( (Nil!9013) (Cons!9012 (h!9868 (_ BitVec 64)) (t!14990 List!9016)) )
))
(declare-fun arrayNoDuplicates!0 (array!30669 (_ BitVec 32) List!9016) Bool)

(assert (=> b!475299 (= res!283852 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9013))))

(declare-fun b!475300 () Bool)

(declare-fun res!283853 () Bool)

(assert (=> b!475300 (=> (not res!283853) (not e!279075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30669 (_ BitVec 32)) Bool)

(assert (=> b!475300 (= res!283853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21919 () Bool)

(declare-fun mapRes!21919 () Bool)

(declare-fun tp!42156 () Bool)

(declare-fun e!279078 () Bool)

(assert (=> mapNonEmpty!21919 (= mapRes!21919 (and tp!42156 e!279078))))

(declare-fun mapRest!21919 () (Array (_ BitVec 32) ValueCell!6390))

(declare-fun mapKey!21919 () (_ BitVec 32))

(declare-fun mapValue!21919 () ValueCell!6390)

(assert (=> mapNonEmpty!21919 (= (arr!14753 _values!833) (store mapRest!21919 mapKey!21919 mapValue!21919))))

(declare-fun mapIsEmpty!21919 () Bool)

(assert (=> mapIsEmpty!21919 mapRes!21919))

(declare-fun b!475301 () Bool)

(declare-fun e!279076 () Bool)

(assert (=> b!475301 (= e!279076 tp_is_empty!13467)))

(declare-fun b!475302 () Bool)

(assert (=> b!475302 (= e!279074 (and e!279076 mapRes!21919))))

(declare-fun condMapEmpty!21919 () Bool)

(declare-fun mapDefault!21919 () ValueCell!6390)

(assert (=> b!475302 (= condMapEmpty!21919 (= (arr!14753 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6390)) mapDefault!21919)))))

(declare-fun b!475303 () Bool)

(declare-fun res!283851 () Bool)

(assert (=> b!475303 (=> (not res!283851) (not e!279075))))

(assert (=> b!475303 (= res!283851 (and (= (size!15105 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15104 _keys!1025) (size!15105 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475304 () Bool)

(assert (=> b!475304 (= e!279078 tp_is_empty!13467)))

(assert (= (and start!42604 res!283854) b!475303))

(assert (= (and b!475303 res!283851) b!475300))

(assert (= (and b!475300 res!283853) b!475299))

(assert (= (and b!475299 res!283852) b!475298))

(assert (= (and b!475302 condMapEmpty!21919) mapIsEmpty!21919))

(assert (= (and b!475302 (not condMapEmpty!21919)) mapNonEmpty!21919))

(get-info :version)

(assert (= (and mapNonEmpty!21919 ((_ is ValueCellFull!6390) mapValue!21919)) b!475304))

(assert (= (and b!475302 ((_ is ValueCellFull!6390) mapDefault!21919)) b!475301))

(assert (= start!42604 b!475302))

(declare-fun m!457511 () Bool)

(assert (=> b!475298 m!457511))

(declare-fun m!457513 () Bool)

(assert (=> b!475298 m!457513))

(declare-fun m!457515 () Bool)

(assert (=> mapNonEmpty!21919 m!457515))

(declare-fun m!457517 () Bool)

(assert (=> start!42604 m!457517))

(declare-fun m!457519 () Bool)

(assert (=> start!42604 m!457519))

(declare-fun m!457521 () Bool)

(assert (=> start!42604 m!457521))

(declare-fun m!457523 () Bool)

(assert (=> b!475300 m!457523))

(declare-fun m!457525 () Bool)

(assert (=> b!475299 m!457525))

(check-sat (not start!42604) (not b!475300) (not b!475299) (not b_next!12039) tp_is_empty!13467 (not mapNonEmpty!21919) (not b!475298) b_and!20519)
(check-sat b_and!20519 (not b_next!12039))
(get-model)

(declare-fun b!475350 () Bool)

(declare-fun e!279114 () ListLongMap!7849)

(assert (=> b!475350 (= e!279114 (ListLongMap!7850 Nil!9012))))

(declare-fun bm!30568 () Bool)

(declare-fun call!30571 () ListLongMap!7849)

(assert (=> bm!30568 (= call!30571 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475352 () Bool)

(declare-fun e!279112 () Bool)

(declare-fun e!279113 () Bool)

(assert (=> b!475352 (= e!279112 e!279113)))

(assert (=> b!475352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(declare-fun res!283878 () Bool)

(declare-fun lt!216461 () ListLongMap!7849)

(declare-fun contains!2554 (ListLongMap!7849 (_ BitVec 64)) Bool)

(assert (=> b!475352 (= res!283878 (contains!2554 lt!216461 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475352 (=> (not res!283878) (not e!279113))))

(declare-fun b!475353 () Bool)

(declare-fun e!279111 () Bool)

(assert (=> b!475353 (= e!279111 e!279112)))

(declare-fun c!57151 () Bool)

(declare-fun e!279109 () Bool)

(assert (=> b!475353 (= c!57151 e!279109)))

(declare-fun res!283875 () Bool)

(assert (=> b!475353 (=> (not res!283875) (not e!279109))))

(assert (=> b!475353 (= res!283875 (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(declare-fun b!475354 () Bool)

(declare-fun e!279110 () Bool)

(assert (=> b!475354 (= e!279112 e!279110)))

(declare-fun c!57152 () Bool)

(assert (=> b!475354 (= c!57152 (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(declare-fun b!475355 () Bool)

(assert (=> b!475355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(assert (=> b!475355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15105 _values!833)))))

(declare-fun apply!334 (ListLongMap!7849 (_ BitVec 64)) V!19061)

(declare-fun get!7159 (ValueCell!6390 V!19061) V!19061)

(declare-fun dynLambda!927 (Int (_ BitVec 64)) V!19061)

(assert (=> b!475355 (= e!279113 (= (apply!334 lt!216461 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)) (get!7159 (select (arr!14753 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475356 () Bool)

(declare-fun isEmpty!581 (ListLongMap!7849) Bool)

(assert (=> b!475356 (= e!279110 (isEmpty!581 lt!216461))))

(declare-fun b!475357 () Bool)

(assert (=> b!475357 (= e!279110 (= lt!216461 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475358 () Bool)

(declare-fun e!279108 () ListLongMap!7849)

(assert (=> b!475358 (= e!279114 e!279108)))

(declare-fun c!57149 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475358 (= c!57149 (validKeyInArray!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475359 () Bool)

(assert (=> b!475359 (= e!279109 (validKeyInArray!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475359 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475360 () Bool)

(declare-datatypes ((Unit!14002 0))(
  ( (Unit!14003) )
))
(declare-fun lt!216463 () Unit!14002)

(declare-fun lt!216458 () Unit!14002)

(assert (=> b!475360 (= lt!216463 lt!216458)))

(declare-fun lt!216459 () (_ BitVec 64))

(declare-fun lt!216464 () (_ BitVec 64))

(declare-fun lt!216462 () V!19061)

(declare-fun lt!216460 () ListLongMap!7849)

(declare-fun +!1754 (ListLongMap!7849 tuple2!8936) ListLongMap!7849)

(assert (=> b!475360 (not (contains!2554 (+!1754 lt!216460 (tuple2!8937 lt!216464 lt!216462)) lt!216459))))

(declare-fun addStillNotContains!167 (ListLongMap!7849 (_ BitVec 64) V!19061 (_ BitVec 64)) Unit!14002)

(assert (=> b!475360 (= lt!216458 (addStillNotContains!167 lt!216460 lt!216464 lt!216462 lt!216459))))

(assert (=> b!475360 (= lt!216459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475360 (= lt!216462 (get!7159 (select (arr!14753 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475360 (= lt!216464 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475360 (= lt!216460 call!30571)))

(assert (=> b!475360 (= e!279108 (+!1754 call!30571 (tuple2!8937 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000) (get!7159 (select (arr!14753 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475361 () Bool)

(declare-fun res!283877 () Bool)

(assert (=> b!475361 (=> (not res!283877) (not e!279111))))

(assert (=> b!475361 (= res!283877 (not (contains!2554 lt!216461 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75605 () Bool)

(assert (=> d!75605 e!279111))

(declare-fun res!283876 () Bool)

(assert (=> d!75605 (=> (not res!283876) (not e!279111))))

(assert (=> d!75605 (= res!283876 (not (contains!2554 lt!216461 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75605 (= lt!216461 e!279114)))

(declare-fun c!57150 () Bool)

(assert (=> d!75605 (= c!57150 (bvsge #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(assert (=> d!75605 (validMask!0 mask!1365)))

(assert (=> d!75605 (= (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216461)))

(declare-fun b!475351 () Bool)

(assert (=> b!475351 (= e!279108 call!30571)))

(assert (= (and d!75605 c!57150) b!475350))

(assert (= (and d!75605 (not c!57150)) b!475358))

(assert (= (and b!475358 c!57149) b!475360))

(assert (= (and b!475358 (not c!57149)) b!475351))

(assert (= (or b!475360 b!475351) bm!30568))

(assert (= (and d!75605 res!283876) b!475361))

(assert (= (and b!475361 res!283877) b!475353))

(assert (= (and b!475353 res!283875) b!475359))

(assert (= (and b!475353 c!57151) b!475352))

(assert (= (and b!475353 (not c!57151)) b!475354))

(assert (= (and b!475352 res!283878) b!475355))

(assert (= (and b!475354 c!57152) b!475357))

(assert (= (and b!475354 (not c!57152)) b!475356))

(declare-fun b_lambda!10253 () Bool)

(assert (=> (not b_lambda!10253) (not b!475355)))

(declare-fun t!14993 () Bool)

(declare-fun tb!3933 () Bool)

(assert (=> (and start!42604 (= defaultEntry!841 defaultEntry!841) t!14993) tb!3933))

(declare-fun result!7457 () Bool)

(assert (=> tb!3933 (= result!7457 tp_is_empty!13467)))

(assert (=> b!475355 t!14993))

(declare-fun b_and!20523 () Bool)

(assert (= b_and!20519 (and (=> t!14993 result!7457) b_and!20523)))

(declare-fun b_lambda!10255 () Bool)

(assert (=> (not b_lambda!10255) (not b!475360)))

(assert (=> b!475360 t!14993))

(declare-fun b_and!20525 () Bool)

(assert (= b_and!20523 (and (=> t!14993 result!7457) b_and!20525)))

(declare-fun m!457543 () Bool)

(assert (=> b!475356 m!457543))

(declare-fun m!457545 () Bool)

(assert (=> b!475357 m!457545))

(declare-fun m!457547 () Bool)

(assert (=> b!475352 m!457547))

(assert (=> b!475352 m!457547))

(declare-fun m!457549 () Bool)

(assert (=> b!475352 m!457549))

(assert (=> b!475359 m!457547))

(assert (=> b!475359 m!457547))

(declare-fun m!457551 () Bool)

(assert (=> b!475359 m!457551))

(assert (=> bm!30568 m!457545))

(declare-fun m!457553 () Bool)

(assert (=> b!475361 m!457553))

(declare-fun m!457555 () Bool)

(assert (=> b!475355 m!457555))

(declare-fun m!457557 () Bool)

(assert (=> b!475355 m!457557))

(assert (=> b!475355 m!457555))

(declare-fun m!457559 () Bool)

(assert (=> b!475355 m!457559))

(assert (=> b!475355 m!457547))

(declare-fun m!457561 () Bool)

(assert (=> b!475355 m!457561))

(assert (=> b!475355 m!457557))

(assert (=> b!475355 m!457547))

(declare-fun m!457563 () Bool)

(assert (=> d!75605 m!457563))

(assert (=> d!75605 m!457517))

(declare-fun m!457565 () Bool)

(assert (=> b!475360 m!457565))

(assert (=> b!475360 m!457555))

(declare-fun m!457567 () Bool)

(assert (=> b!475360 m!457567))

(declare-fun m!457569 () Bool)

(assert (=> b!475360 m!457569))

(declare-fun m!457571 () Bool)

(assert (=> b!475360 m!457571))

(assert (=> b!475360 m!457557))

(assert (=> b!475360 m!457555))

(assert (=> b!475360 m!457559))

(assert (=> b!475360 m!457569))

(assert (=> b!475360 m!457557))

(assert (=> b!475360 m!457547))

(assert (=> b!475358 m!457547))

(assert (=> b!475358 m!457547))

(assert (=> b!475358 m!457551))

(assert (=> b!475298 d!75605))

(declare-fun b!475364 () Bool)

(declare-fun e!279121 () ListLongMap!7849)

(assert (=> b!475364 (= e!279121 (ListLongMap!7850 Nil!9012))))

(declare-fun call!30572 () ListLongMap!7849)

(declare-fun bm!30569 () Bool)

(assert (=> bm!30569 (= call!30572 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475366 () Bool)

(declare-fun e!279119 () Bool)

(declare-fun e!279120 () Bool)

(assert (=> b!475366 (= e!279119 e!279120)))

(assert (=> b!475366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(declare-fun res!283882 () Bool)

(declare-fun lt!216468 () ListLongMap!7849)

(assert (=> b!475366 (= res!283882 (contains!2554 lt!216468 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475366 (=> (not res!283882) (not e!279120))))

(declare-fun b!475367 () Bool)

(declare-fun e!279118 () Bool)

(assert (=> b!475367 (= e!279118 e!279119)))

(declare-fun c!57155 () Bool)

(declare-fun e!279116 () Bool)

(assert (=> b!475367 (= c!57155 e!279116)))

(declare-fun res!283879 () Bool)

(assert (=> b!475367 (=> (not res!283879) (not e!279116))))

(assert (=> b!475367 (= res!283879 (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(declare-fun b!475368 () Bool)

(declare-fun e!279117 () Bool)

(assert (=> b!475368 (= e!279119 e!279117)))

(declare-fun c!57156 () Bool)

(assert (=> b!475368 (= c!57156 (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(declare-fun b!475369 () Bool)

(assert (=> b!475369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(assert (=> b!475369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15105 _values!833)))))

(assert (=> b!475369 (= e!279120 (= (apply!334 lt!216468 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)) (get!7159 (select (arr!14753 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475370 () Bool)

(assert (=> b!475370 (= e!279117 (isEmpty!581 lt!216468))))

(declare-fun b!475371 () Bool)

(assert (=> b!475371 (= e!279117 (= lt!216468 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475372 () Bool)

(declare-fun e!279115 () ListLongMap!7849)

(assert (=> b!475372 (= e!279121 e!279115)))

(declare-fun c!57153 () Bool)

(assert (=> b!475372 (= c!57153 (validKeyInArray!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475373 () Bool)

(assert (=> b!475373 (= e!279116 (validKeyInArray!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475373 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475374 () Bool)

(declare-fun lt!216470 () Unit!14002)

(declare-fun lt!216465 () Unit!14002)

(assert (=> b!475374 (= lt!216470 lt!216465)))

(declare-fun lt!216466 () (_ BitVec 64))

(declare-fun lt!216471 () (_ BitVec 64))

(declare-fun lt!216467 () ListLongMap!7849)

(declare-fun lt!216469 () V!19061)

(assert (=> b!475374 (not (contains!2554 (+!1754 lt!216467 (tuple2!8937 lt!216471 lt!216469)) lt!216466))))

(assert (=> b!475374 (= lt!216465 (addStillNotContains!167 lt!216467 lt!216471 lt!216469 lt!216466))))

(assert (=> b!475374 (= lt!216466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475374 (= lt!216469 (get!7159 (select (arr!14753 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475374 (= lt!216471 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475374 (= lt!216467 call!30572)))

(assert (=> b!475374 (= e!279115 (+!1754 call!30572 (tuple2!8937 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000) (get!7159 (select (arr!14753 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475375 () Bool)

(declare-fun res!283881 () Bool)

(assert (=> b!475375 (=> (not res!283881) (not e!279118))))

(assert (=> b!475375 (= res!283881 (not (contains!2554 lt!216468 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75607 () Bool)

(assert (=> d!75607 e!279118))

(declare-fun res!283880 () Bool)

(assert (=> d!75607 (=> (not res!283880) (not e!279118))))

(assert (=> d!75607 (= res!283880 (not (contains!2554 lt!216468 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75607 (= lt!216468 e!279121)))

(declare-fun c!57154 () Bool)

(assert (=> d!75607 (= c!57154 (bvsge #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(assert (=> d!75607 (validMask!0 mask!1365)))

(assert (=> d!75607 (= (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216468)))

(declare-fun b!475365 () Bool)

(assert (=> b!475365 (= e!279115 call!30572)))

(assert (= (and d!75607 c!57154) b!475364))

(assert (= (and d!75607 (not c!57154)) b!475372))

(assert (= (and b!475372 c!57153) b!475374))

(assert (= (and b!475372 (not c!57153)) b!475365))

(assert (= (or b!475374 b!475365) bm!30569))

(assert (= (and d!75607 res!283880) b!475375))

(assert (= (and b!475375 res!283881) b!475367))

(assert (= (and b!475367 res!283879) b!475373))

(assert (= (and b!475367 c!57155) b!475366))

(assert (= (and b!475367 (not c!57155)) b!475368))

(assert (= (and b!475366 res!283882) b!475369))

(assert (= (and b!475368 c!57156) b!475371))

(assert (= (and b!475368 (not c!57156)) b!475370))

(declare-fun b_lambda!10257 () Bool)

(assert (=> (not b_lambda!10257) (not b!475369)))

(assert (=> b!475369 t!14993))

(declare-fun b_and!20527 () Bool)

(assert (= b_and!20525 (and (=> t!14993 result!7457) b_and!20527)))

(declare-fun b_lambda!10259 () Bool)

(assert (=> (not b_lambda!10259) (not b!475374)))

(assert (=> b!475374 t!14993))

(declare-fun b_and!20529 () Bool)

(assert (= b_and!20527 (and (=> t!14993 result!7457) b_and!20529)))

(declare-fun m!457573 () Bool)

(assert (=> b!475370 m!457573))

(declare-fun m!457575 () Bool)

(assert (=> b!475371 m!457575))

(assert (=> b!475366 m!457547))

(assert (=> b!475366 m!457547))

(declare-fun m!457577 () Bool)

(assert (=> b!475366 m!457577))

(assert (=> b!475373 m!457547))

(assert (=> b!475373 m!457547))

(assert (=> b!475373 m!457551))

(assert (=> bm!30569 m!457575))

(declare-fun m!457579 () Bool)

(assert (=> b!475375 m!457579))

(assert (=> b!475369 m!457555))

(assert (=> b!475369 m!457557))

(assert (=> b!475369 m!457555))

(assert (=> b!475369 m!457559))

(assert (=> b!475369 m!457547))

(declare-fun m!457581 () Bool)

(assert (=> b!475369 m!457581))

(assert (=> b!475369 m!457557))

(assert (=> b!475369 m!457547))

(declare-fun m!457583 () Bool)

(assert (=> d!75607 m!457583))

(assert (=> d!75607 m!457517))

(declare-fun m!457585 () Bool)

(assert (=> b!475374 m!457585))

(assert (=> b!475374 m!457555))

(declare-fun m!457587 () Bool)

(assert (=> b!475374 m!457587))

(declare-fun m!457589 () Bool)

(assert (=> b!475374 m!457589))

(declare-fun m!457591 () Bool)

(assert (=> b!475374 m!457591))

(assert (=> b!475374 m!457557))

(assert (=> b!475374 m!457555))

(assert (=> b!475374 m!457559))

(assert (=> b!475374 m!457589))

(assert (=> b!475374 m!457557))

(assert (=> b!475374 m!457547))

(assert (=> b!475372 m!457547))

(assert (=> b!475372 m!457547))

(assert (=> b!475372 m!457551))

(assert (=> b!475298 d!75607))

(declare-fun b!475384 () Bool)

(declare-fun e!279129 () Bool)

(declare-fun call!30575 () Bool)

(assert (=> b!475384 (= e!279129 call!30575)))

(declare-fun b!475385 () Bool)

(declare-fun e!279130 () Bool)

(assert (=> b!475385 (= e!279130 call!30575)))

(declare-fun bm!30572 () Bool)

(assert (=> bm!30572 (= call!30575 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475386 () Bool)

(declare-fun e!279128 () Bool)

(assert (=> b!475386 (= e!279128 e!279129)))

(declare-fun c!57159 () Bool)

(assert (=> b!475386 (= c!57159 (validKeyInArray!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75609 () Bool)

(declare-fun res!283888 () Bool)

(assert (=> d!75609 (=> res!283888 e!279128)))

(assert (=> d!75609 (= res!283888 (bvsge #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(assert (=> d!75609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279128)))

(declare-fun b!475387 () Bool)

(assert (=> b!475387 (= e!279129 e!279130)))

(declare-fun lt!216479 () (_ BitVec 64))

(assert (=> b!475387 (= lt!216479 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216478 () Unit!14002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30669 (_ BitVec 64) (_ BitVec 32)) Unit!14002)

(assert (=> b!475387 (= lt!216478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216479 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475387 (arrayContainsKey!0 _keys!1025 lt!216479 #b00000000000000000000000000000000)))

(declare-fun lt!216480 () Unit!14002)

(assert (=> b!475387 (= lt!216480 lt!216478)))

(declare-fun res!283887 () Bool)

(declare-datatypes ((SeekEntryResult!3558 0))(
  ( (MissingZero!3558 (index!16411 (_ BitVec 32))) (Found!3558 (index!16412 (_ BitVec 32))) (Intermediate!3558 (undefined!4370 Bool) (index!16413 (_ BitVec 32)) (x!44616 (_ BitVec 32))) (Undefined!3558) (MissingVacant!3558 (index!16414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30669 (_ BitVec 32)) SeekEntryResult!3558)

(assert (=> b!475387 (= res!283887 (= (seekEntryOrOpen!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3558 #b00000000000000000000000000000000)))))

(assert (=> b!475387 (=> (not res!283887) (not e!279130))))

(assert (= (and d!75609 (not res!283888)) b!475386))

(assert (= (and b!475386 c!57159) b!475387))

(assert (= (and b!475386 (not c!57159)) b!475384))

(assert (= (and b!475387 res!283887) b!475385))

(assert (= (or b!475385 b!475384) bm!30572))

(declare-fun m!457593 () Bool)

(assert (=> bm!30572 m!457593))

(assert (=> b!475386 m!457547))

(assert (=> b!475386 m!457547))

(assert (=> b!475386 m!457551))

(assert (=> b!475387 m!457547))

(declare-fun m!457595 () Bool)

(assert (=> b!475387 m!457595))

(declare-fun m!457597 () Bool)

(assert (=> b!475387 m!457597))

(assert (=> b!475387 m!457547))

(declare-fun m!457599 () Bool)

(assert (=> b!475387 m!457599))

(assert (=> b!475300 d!75609))

(declare-fun d!75611 () Bool)

(assert (=> d!75611 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42604 d!75611))

(declare-fun d!75613 () Bool)

(assert (=> d!75613 (= (array_inv!10646 _keys!1025) (bvsge (size!15104 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42604 d!75613))

(declare-fun d!75615 () Bool)

(assert (=> d!75615 (= (array_inv!10647 _values!833) (bvsge (size!15105 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42604 d!75615))

(declare-fun b!475398 () Bool)

(declare-fun e!279139 () Bool)

(declare-fun call!30578 () Bool)

(assert (=> b!475398 (= e!279139 call!30578)))

(declare-fun d!75617 () Bool)

(declare-fun res!283895 () Bool)

(declare-fun e!279142 () Bool)

(assert (=> d!75617 (=> res!283895 e!279142)))

(assert (=> d!75617 (= res!283895 (bvsge #b00000000000000000000000000000000 (size!15104 _keys!1025)))))

(assert (=> d!75617 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9013) e!279142)))

(declare-fun b!475399 () Bool)

(declare-fun e!279140 () Bool)

(assert (=> b!475399 (= e!279142 e!279140)))

(declare-fun res!283896 () Bool)

(assert (=> b!475399 (=> (not res!283896) (not e!279140))))

(declare-fun e!279141 () Bool)

(assert (=> b!475399 (= res!283896 (not e!279141))))

(declare-fun res!283897 () Bool)

(assert (=> b!475399 (=> (not res!283897) (not e!279141))))

(assert (=> b!475399 (= res!283897 (validKeyInArray!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475400 () Bool)

(assert (=> b!475400 (= e!279140 e!279139)))

(declare-fun c!57162 () Bool)

(assert (=> b!475400 (= c!57162 (validKeyInArray!0 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475401 () Bool)

(assert (=> b!475401 (= e!279139 call!30578)))

(declare-fun b!475402 () Bool)

(declare-fun contains!2555 (List!9016 (_ BitVec 64)) Bool)

(assert (=> b!475402 (= e!279141 (contains!2555 Nil!9013 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30575 () Bool)

(assert (=> bm!30575 (= call!30578 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57162 (Cons!9012 (select (arr!14752 _keys!1025) #b00000000000000000000000000000000) Nil!9013) Nil!9013)))))

(assert (= (and d!75617 (not res!283895)) b!475399))

(assert (= (and b!475399 res!283897) b!475402))

(assert (= (and b!475399 res!283896) b!475400))

(assert (= (and b!475400 c!57162) b!475398))

(assert (= (and b!475400 (not c!57162)) b!475401))

(assert (= (or b!475398 b!475401) bm!30575))

(assert (=> b!475399 m!457547))

(assert (=> b!475399 m!457547))

(assert (=> b!475399 m!457551))

(assert (=> b!475400 m!457547))

(assert (=> b!475400 m!457547))

(assert (=> b!475400 m!457551))

(assert (=> b!475402 m!457547))

(assert (=> b!475402 m!457547))

(declare-fun m!457601 () Bool)

(assert (=> b!475402 m!457601))

(assert (=> bm!30575 m!457547))

(declare-fun m!457603 () Bool)

(assert (=> bm!30575 m!457603))

(assert (=> b!475299 d!75617))

(declare-fun mapIsEmpty!21925 () Bool)

(declare-fun mapRes!21925 () Bool)

(assert (=> mapIsEmpty!21925 mapRes!21925))

(declare-fun b!475410 () Bool)

(declare-fun e!279147 () Bool)

(assert (=> b!475410 (= e!279147 tp_is_empty!13467)))

(declare-fun b!475409 () Bool)

(declare-fun e!279148 () Bool)

(assert (=> b!475409 (= e!279148 tp_is_empty!13467)))

(declare-fun condMapEmpty!21925 () Bool)

(declare-fun mapDefault!21925 () ValueCell!6390)

(assert (=> mapNonEmpty!21919 (= condMapEmpty!21925 (= mapRest!21919 ((as const (Array (_ BitVec 32) ValueCell!6390)) mapDefault!21925)))))

(assert (=> mapNonEmpty!21919 (= tp!42156 (and e!279147 mapRes!21925))))

(declare-fun mapNonEmpty!21925 () Bool)

(declare-fun tp!42166 () Bool)

(assert (=> mapNonEmpty!21925 (= mapRes!21925 (and tp!42166 e!279148))))

(declare-fun mapValue!21925 () ValueCell!6390)

(declare-fun mapKey!21925 () (_ BitVec 32))

(declare-fun mapRest!21925 () (Array (_ BitVec 32) ValueCell!6390))

(assert (=> mapNonEmpty!21925 (= mapRest!21919 (store mapRest!21925 mapKey!21925 mapValue!21925))))

(assert (= (and mapNonEmpty!21919 condMapEmpty!21925) mapIsEmpty!21925))

(assert (= (and mapNonEmpty!21919 (not condMapEmpty!21925)) mapNonEmpty!21925))

(assert (= (and mapNonEmpty!21925 ((_ is ValueCellFull!6390) mapValue!21925)) b!475409))

(assert (= (and mapNonEmpty!21919 ((_ is ValueCellFull!6390) mapDefault!21925)) b!475410))

(declare-fun m!457605 () Bool)

(assert (=> mapNonEmpty!21925 m!457605))

(declare-fun b_lambda!10261 () Bool)

(assert (= b_lambda!10257 (or (and start!42604 b_free!12039) b_lambda!10261)))

(declare-fun b_lambda!10263 () Bool)

(assert (= b_lambda!10255 (or (and start!42604 b_free!12039) b_lambda!10263)))

(declare-fun b_lambda!10265 () Bool)

(assert (= b_lambda!10253 (or (and start!42604 b_free!12039) b_lambda!10265)))

(declare-fun b_lambda!10267 () Bool)

(assert (= b_lambda!10259 (or (and start!42604 b_free!12039) b_lambda!10267)))

(check-sat (not mapNonEmpty!21925) (not b!475375) (not b!475356) (not d!75607) b_and!20529 (not bm!30568) (not b!475360) (not b_next!12039) (not b!475387) (not d!75605) tp_is_empty!13467 (not b!475359) (not b!475374) (not b!475357) (not b!475402) (not b_lambda!10263) (not b!475400) (not b!475355) (not b_lambda!10265) (not bm!30569) (not b!475373) (not b!475370) (not bm!30572) (not bm!30575) (not b!475372) (not b!475371) (not b_lambda!10261) (not b!475399) (not b!475352) (not b!475361) (not b_lambda!10267) (not b!475358) (not b!475369) (not b!475386) (not b!475366))
(check-sat b_and!20529 (not b_next!12039))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42216 () Bool)

(assert start!42216)

(declare-fun b_free!11749 () Bool)

(declare-fun b_next!11749 () Bool)

(assert (=> start!42216 (= b_free!11749 (not b_next!11749))))

(declare-fun tp!41271 () Bool)

(declare-fun b_and!20189 () Bool)

(assert (=> start!42216 (= tp!41271 b_and!20189)))

(declare-fun b!471269 () Bool)

(declare-fun res!281586 () Bool)

(declare-fun e!276188 () Bool)

(assert (=> b!471269 (=> (not res!281586) (not e!276188))))

(declare-datatypes ((array!30104 0))(
  ( (array!30105 (arr!14474 (Array (_ BitVec 32) (_ BitVec 64))) (size!14826 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30104)

(declare-datatypes ((List!8728 0))(
  ( (Nil!8725) (Cons!8724 (h!9580 (_ BitVec 64)) (t!14684 List!8728)) )
))
(declare-fun arrayNoDuplicates!0 (array!30104 (_ BitVec 32) List!8728) Bool)

(assert (=> b!471269 (= res!281586 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8725))))

(declare-fun b!471270 () Bool)

(declare-fun res!281583 () Bool)

(assert (=> b!471270 (=> (not res!281583) (not e!276188))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30104 (_ BitVec 32)) Bool)

(assert (=> b!471270 (= res!281583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471271 () Bool)

(declare-fun res!281585 () Bool)

(assert (=> b!471271 (=> (not res!281585) (not e!276188))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18675 0))(
  ( (V!18676 (val!6633 Int)) )
))
(declare-datatypes ((ValueCell!6245 0))(
  ( (ValueCellFull!6245 (v!8925 V!18675)) (EmptyCell!6245) )
))
(declare-datatypes ((array!30106 0))(
  ( (array!30107 (arr!14475 (Array (_ BitVec 32) ValueCell!6245)) (size!14827 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30106)

(assert (=> b!471271 (= res!281585 (and (= (size!14827 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14826 _keys!1025) (size!14827 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21469 () Bool)

(declare-fun mapRes!21469 () Bool)

(declare-fun tp!41272 () Bool)

(declare-fun e!276187 () Bool)

(assert (=> mapNonEmpty!21469 (= mapRes!21469 (and tp!41272 e!276187))))

(declare-fun mapKey!21469 () (_ BitVec 32))

(declare-fun mapRest!21469 () (Array (_ BitVec 32) ValueCell!6245))

(declare-fun mapValue!21469 () ValueCell!6245)

(assert (=> mapNonEmpty!21469 (= (arr!14475 _values!833) (store mapRest!21469 mapKey!21469 mapValue!21469))))

(declare-fun b!471272 () Bool)

(declare-fun e!276191 () Bool)

(declare-fun e!276190 () Bool)

(assert (=> b!471272 (= e!276191 (and e!276190 mapRes!21469))))

(declare-fun condMapEmpty!21469 () Bool)

(declare-fun mapDefault!21469 () ValueCell!6245)

(assert (=> b!471272 (= condMapEmpty!21469 (= (arr!14475 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6245)) mapDefault!21469)))))

(declare-fun b!471273 () Bool)

(assert (=> b!471273 (= e!276188 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14826 _keys!1025)))))))

(declare-datatypes ((tuple2!8658 0))(
  ( (tuple2!8659 (_1!4340 (_ BitVec 64)) (_2!4340 V!18675)) )
))
(declare-datatypes ((List!8729 0))(
  ( (Nil!8726) (Cons!8725 (h!9581 tuple2!8658) (t!14685 List!8729)) )
))
(declare-datatypes ((ListLongMap!7573 0))(
  ( (ListLongMap!7574 (toList!3802 List!8729)) )
))
(declare-fun lt!213852 () ListLongMap!7573)

(declare-fun lt!213853 () ListLongMap!7573)

(assert (=> b!471273 (= lt!213852 lt!213853)))

(declare-fun minValueBefore!38 () V!18675)

(declare-fun zeroValue!794 () V!18675)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13817 0))(
  ( (Unit!13818) )
))
(declare-fun lt!213851 () Unit!13817)

(declare-fun minValueAfter!38 () V!18675)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!177 (array!30104 array!30106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18675 V!18675 V!18675 V!18675 (_ BitVec 32) Int) Unit!13817)

(assert (=> b!471273 (= lt!213851 (lemmaNoChangeToArrayThenSameMapNoExtras!177 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2017 (array!30104 array!30106 (_ BitVec 32) (_ BitVec 32) V!18675 V!18675 (_ BitVec 32) Int) ListLongMap!7573)

(assert (=> b!471273 (= lt!213853 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471273 (= lt!213852 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21469 () Bool)

(assert (=> mapIsEmpty!21469 mapRes!21469))

(declare-fun b!471274 () Bool)

(declare-fun tp_is_empty!13177 () Bool)

(assert (=> b!471274 (= e!276187 tp_is_empty!13177)))

(declare-fun res!281584 () Bool)

(assert (=> start!42216 (=> (not res!281584) (not e!276188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42216 (= res!281584 (validMask!0 mask!1365))))

(assert (=> start!42216 e!276188))

(assert (=> start!42216 tp_is_empty!13177))

(assert (=> start!42216 tp!41271))

(assert (=> start!42216 true))

(declare-fun array_inv!10534 (array!30104) Bool)

(assert (=> start!42216 (array_inv!10534 _keys!1025)))

(declare-fun array_inv!10535 (array!30106) Bool)

(assert (=> start!42216 (and (array_inv!10535 _values!833) e!276191)))

(declare-fun b!471275 () Bool)

(assert (=> b!471275 (= e!276190 tp_is_empty!13177)))

(assert (= (and start!42216 res!281584) b!471271))

(assert (= (and b!471271 res!281585) b!471270))

(assert (= (and b!471270 res!281583) b!471269))

(assert (= (and b!471269 res!281586) b!471273))

(assert (= (and b!471272 condMapEmpty!21469) mapIsEmpty!21469))

(assert (= (and b!471272 (not condMapEmpty!21469)) mapNonEmpty!21469))

(get-info :version)

(assert (= (and mapNonEmpty!21469 ((_ is ValueCellFull!6245) mapValue!21469)) b!471274))

(assert (= (and b!471272 ((_ is ValueCellFull!6245) mapDefault!21469)) b!471275))

(assert (= start!42216 b!471272))

(declare-fun m!453667 () Bool)

(assert (=> b!471269 m!453667))

(declare-fun m!453669 () Bool)

(assert (=> b!471270 m!453669))

(declare-fun m!453671 () Bool)

(assert (=> mapNonEmpty!21469 m!453671))

(declare-fun m!453673 () Bool)

(assert (=> b!471273 m!453673))

(declare-fun m!453675 () Bool)

(assert (=> b!471273 m!453675))

(declare-fun m!453677 () Bool)

(assert (=> b!471273 m!453677))

(declare-fun m!453679 () Bool)

(assert (=> start!42216 m!453679))

(declare-fun m!453681 () Bool)

(assert (=> start!42216 m!453681))

(declare-fun m!453683 () Bool)

(assert (=> start!42216 m!453683))

(check-sat (not b!471273) tp_is_empty!13177 (not start!42216) (not b!471270) (not b_next!11749) b_and!20189 (not mapNonEmpty!21469) (not b!471269))
(check-sat b_and!20189 (not b_next!11749))
(get-model)

(declare-fun d!75427 () Bool)

(declare-fun res!281616 () Bool)

(declare-fun e!276230 () Bool)

(assert (=> d!75427 (=> res!281616 e!276230)))

(assert (=> d!75427 (= res!281616 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75427 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!276230)))

(declare-fun b!471326 () Bool)

(declare-fun e!276228 () Bool)

(declare-fun call!30430 () Bool)

(assert (=> b!471326 (= e!276228 call!30430)))

(declare-fun b!471327 () Bool)

(declare-fun e!276229 () Bool)

(assert (=> b!471327 (= e!276229 call!30430)))

(declare-fun b!471328 () Bool)

(assert (=> b!471328 (= e!276230 e!276229)))

(declare-fun c!56940 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!471328 (= c!56940 (validKeyInArray!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30427 () Bool)

(assert (=> bm!30427 (= call!30430 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!471329 () Bool)

(assert (=> b!471329 (= e!276229 e!276228)))

(declare-fun lt!213878 () (_ BitVec 64))

(assert (=> b!471329 (= lt!213878 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213879 () Unit!13817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30104 (_ BitVec 64) (_ BitVec 32)) Unit!13817)

(assert (=> b!471329 (= lt!213879 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213878 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!471329 (arrayContainsKey!0 _keys!1025 lt!213878 #b00000000000000000000000000000000)))

(declare-fun lt!213880 () Unit!13817)

(assert (=> b!471329 (= lt!213880 lt!213879)))

(declare-fun res!281615 () Bool)

(declare-datatypes ((SeekEntryResult!3502 0))(
  ( (MissingZero!3502 (index!16187 (_ BitVec 32))) (Found!3502 (index!16188 (_ BitVec 32))) (Intermediate!3502 (undefined!4314 Bool) (index!16189 (_ BitVec 32)) (x!44118 (_ BitVec 32))) (Undefined!3502) (MissingVacant!3502 (index!16190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30104 (_ BitVec 32)) SeekEntryResult!3502)

(assert (=> b!471329 (= res!281615 (= (seekEntryOrOpen!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3502 #b00000000000000000000000000000000)))))

(assert (=> b!471329 (=> (not res!281615) (not e!276228))))

(assert (= (and d!75427 (not res!281616)) b!471328))

(assert (= (and b!471328 c!56940) b!471329))

(assert (= (and b!471328 (not c!56940)) b!471327))

(assert (= (and b!471329 res!281615) b!471326))

(assert (= (or b!471326 b!471327) bm!30427))

(declare-fun m!453721 () Bool)

(assert (=> b!471328 m!453721))

(assert (=> b!471328 m!453721))

(declare-fun m!453723 () Bool)

(assert (=> b!471328 m!453723))

(declare-fun m!453725 () Bool)

(assert (=> bm!30427 m!453725))

(assert (=> b!471329 m!453721))

(declare-fun m!453727 () Bool)

(assert (=> b!471329 m!453727))

(declare-fun m!453729 () Bool)

(assert (=> b!471329 m!453729))

(assert (=> b!471329 m!453721))

(declare-fun m!453731 () Bool)

(assert (=> b!471329 m!453731))

(assert (=> b!471270 d!75427))

(declare-fun d!75429 () Bool)

(assert (=> d!75429 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42216 d!75429))

(declare-fun d!75431 () Bool)

(assert (=> d!75431 (= (array_inv!10534 _keys!1025) (bvsge (size!14826 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42216 d!75431))

(declare-fun d!75433 () Bool)

(assert (=> d!75433 (= (array_inv!10535 _values!833) (bvsge (size!14827 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42216 d!75433))

(declare-fun d!75435 () Bool)

(assert (=> d!75435 (= (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213883 () Unit!13817)

(declare-fun choose!1355 (array!30104 array!30106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18675 V!18675 V!18675 V!18675 (_ BitVec 32) Int) Unit!13817)

(assert (=> d!75435 (= lt!213883 (choose!1355 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75435 (validMask!0 mask!1365)))

(assert (=> d!75435 (= (lemmaNoChangeToArrayThenSameMapNoExtras!177 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213883)))

(declare-fun bs!14964 () Bool)

(assert (= bs!14964 d!75435))

(assert (=> bs!14964 m!453677))

(assert (=> bs!14964 m!453675))

(declare-fun m!453733 () Bool)

(assert (=> bs!14964 m!453733))

(assert (=> bs!14964 m!453679))

(assert (=> b!471273 d!75435))

(declare-fun b!471354 () Bool)

(declare-fun e!276249 () ListLongMap!7573)

(assert (=> b!471354 (= e!276249 (ListLongMap!7574 Nil!8726))))

(declare-fun b!471355 () Bool)

(declare-fun e!276250 () ListLongMap!7573)

(declare-fun call!30433 () ListLongMap!7573)

(assert (=> b!471355 (= e!276250 call!30433)))

(declare-fun b!471356 () Bool)

(declare-fun e!276246 () Bool)

(assert (=> b!471356 (= e!276246 (validKeyInArray!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471356 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471357 () Bool)

(declare-fun e!276245 () Bool)

(declare-fun e!276247 () Bool)

(assert (=> b!471357 (= e!276245 e!276247)))

(assert (=> b!471357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun res!281627 () Bool)

(declare-fun lt!213898 () ListLongMap!7573)

(declare-fun contains!2523 (ListLongMap!7573 (_ BitVec 64)) Bool)

(assert (=> b!471357 (= res!281627 (contains!2523 lt!213898 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471357 (=> (not res!281627) (not e!276247))))

(declare-fun d!75437 () Bool)

(declare-fun e!276248 () Bool)

(assert (=> d!75437 e!276248))

(declare-fun res!281628 () Bool)

(assert (=> d!75437 (=> (not res!281628) (not e!276248))))

(assert (=> d!75437 (= res!281628 (not (contains!2523 lt!213898 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75437 (= lt!213898 e!276249)))

(declare-fun c!56950 () Bool)

(assert (=> d!75437 (= c!56950 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75437 (validMask!0 mask!1365)))

(assert (=> d!75437 (= (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213898)))

(declare-fun b!471358 () Bool)

(declare-fun res!281625 () Bool)

(assert (=> b!471358 (=> (not res!281625) (not e!276248))))

(assert (=> b!471358 (= res!281625 (not (contains!2523 lt!213898 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!471359 () Bool)

(assert (=> b!471359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> b!471359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14827 _values!833)))))

(declare-fun apply!329 (ListLongMap!7573 (_ BitVec 64)) V!18675)

(declare-fun get!7061 (ValueCell!6245 V!18675) V!18675)

(declare-fun dynLambda!919 (Int (_ BitVec 64)) V!18675)

(assert (=> b!471359 (= e!276247 (= (apply!329 lt!213898 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)) (get!7061 (select (arr!14475 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30430 () Bool)

(assert (=> bm!30430 (= call!30433 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!471360 () Bool)

(declare-fun lt!213901 () Unit!13817)

(declare-fun lt!213900 () Unit!13817)

(assert (=> b!471360 (= lt!213901 lt!213900)))

(declare-fun lt!213903 () (_ BitVec 64))

(declare-fun lt!213899 () (_ BitVec 64))

(declare-fun lt!213902 () V!18675)

(declare-fun lt!213904 () ListLongMap!7573)

(declare-fun +!1726 (ListLongMap!7573 tuple2!8658) ListLongMap!7573)

(assert (=> b!471360 (not (contains!2523 (+!1726 lt!213904 (tuple2!8659 lt!213903 lt!213902)) lt!213899))))

(declare-fun addStillNotContains!164 (ListLongMap!7573 (_ BitVec 64) V!18675 (_ BitVec 64)) Unit!13817)

(assert (=> b!471360 (= lt!213900 (addStillNotContains!164 lt!213904 lt!213903 lt!213902 lt!213899))))

(assert (=> b!471360 (= lt!213899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!471360 (= lt!213902 (get!7061 (select (arr!14475 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471360 (= lt!213903 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!471360 (= lt!213904 call!30433)))

(assert (=> b!471360 (= e!276250 (+!1726 call!30433 (tuple2!8659 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000) (get!7061 (select (arr!14475 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471361 () Bool)

(assert (=> b!471361 (= e!276249 e!276250)))

(declare-fun c!56951 () Bool)

(assert (=> b!471361 (= c!56951 (validKeyInArray!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471362 () Bool)

(declare-fun e!276251 () Bool)

(assert (=> b!471362 (= e!276251 (= lt!213898 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!471363 () Bool)

(assert (=> b!471363 (= e!276245 e!276251)))

(declare-fun c!56949 () Bool)

(assert (=> b!471363 (= c!56949 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun b!471364 () Bool)

(assert (=> b!471364 (= e!276248 e!276245)))

(declare-fun c!56952 () Bool)

(assert (=> b!471364 (= c!56952 e!276246)))

(declare-fun res!281626 () Bool)

(assert (=> b!471364 (=> (not res!281626) (not e!276246))))

(assert (=> b!471364 (= res!281626 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun b!471365 () Bool)

(declare-fun isEmpty!582 (ListLongMap!7573) Bool)

(assert (=> b!471365 (= e!276251 (isEmpty!582 lt!213898))))

(assert (= (and d!75437 c!56950) b!471354))

(assert (= (and d!75437 (not c!56950)) b!471361))

(assert (= (and b!471361 c!56951) b!471360))

(assert (= (and b!471361 (not c!56951)) b!471355))

(assert (= (or b!471360 b!471355) bm!30430))

(assert (= (and d!75437 res!281628) b!471358))

(assert (= (and b!471358 res!281625) b!471364))

(assert (= (and b!471364 res!281626) b!471356))

(assert (= (and b!471364 c!56952) b!471357))

(assert (= (and b!471364 (not c!56952)) b!471363))

(assert (= (and b!471357 res!281627) b!471359))

(assert (= (and b!471363 c!56949) b!471362))

(assert (= (and b!471363 (not c!56949)) b!471365))

(declare-fun b_lambda!10167 () Bool)

(assert (=> (not b_lambda!10167) (not b!471359)))

(declare-fun t!14687 () Bool)

(declare-fun tb!3915 () Bool)

(assert (=> (and start!42216 (= defaultEntry!841 defaultEntry!841) t!14687) tb!3915))

(declare-fun result!7419 () Bool)

(assert (=> tb!3915 (= result!7419 tp_is_empty!13177)))

(assert (=> b!471359 t!14687))

(declare-fun b_and!20195 () Bool)

(assert (= b_and!20189 (and (=> t!14687 result!7419) b_and!20195)))

(declare-fun b_lambda!10169 () Bool)

(assert (=> (not b_lambda!10169) (not b!471360)))

(assert (=> b!471360 t!14687))

(declare-fun b_and!20197 () Bool)

(assert (= b_and!20195 (and (=> t!14687 result!7419) b_and!20197)))

(assert (=> b!471361 m!453721))

(assert (=> b!471361 m!453721))

(assert (=> b!471361 m!453723))

(declare-fun m!453735 () Bool)

(assert (=> bm!30430 m!453735))

(assert (=> b!471356 m!453721))

(assert (=> b!471356 m!453721))

(assert (=> b!471356 m!453723))

(declare-fun m!453737 () Bool)

(assert (=> b!471360 m!453737))

(declare-fun m!453739 () Bool)

(assert (=> b!471360 m!453739))

(assert (=> b!471360 m!453721))

(declare-fun m!453741 () Bool)

(assert (=> b!471360 m!453741))

(declare-fun m!453743 () Bool)

(assert (=> b!471360 m!453743))

(assert (=> b!471360 m!453741))

(declare-fun m!453745 () Bool)

(assert (=> b!471360 m!453745))

(declare-fun m!453747 () Bool)

(assert (=> b!471360 m!453747))

(assert (=> b!471360 m!453739))

(assert (=> b!471360 m!453747))

(declare-fun m!453749 () Bool)

(assert (=> b!471360 m!453749))

(assert (=> b!471357 m!453721))

(assert (=> b!471357 m!453721))

(declare-fun m!453751 () Bool)

(assert (=> b!471357 m!453751))

(assert (=> b!471359 m!453739))

(assert (=> b!471359 m!453721))

(assert (=> b!471359 m!453747))

(assert (=> b!471359 m!453721))

(declare-fun m!453753 () Bool)

(assert (=> b!471359 m!453753))

(assert (=> b!471359 m!453739))

(assert (=> b!471359 m!453747))

(assert (=> b!471359 m!453749))

(assert (=> b!471362 m!453735))

(declare-fun m!453755 () Bool)

(assert (=> b!471365 m!453755))

(declare-fun m!453757 () Bool)

(assert (=> d!75437 m!453757))

(assert (=> d!75437 m!453679))

(declare-fun m!453759 () Bool)

(assert (=> b!471358 m!453759))

(assert (=> b!471273 d!75437))

(declare-fun b!471368 () Bool)

(declare-fun e!276256 () ListLongMap!7573)

(assert (=> b!471368 (= e!276256 (ListLongMap!7574 Nil!8726))))

(declare-fun b!471369 () Bool)

(declare-fun e!276257 () ListLongMap!7573)

(declare-fun call!30434 () ListLongMap!7573)

(assert (=> b!471369 (= e!276257 call!30434)))

(declare-fun b!471370 () Bool)

(declare-fun e!276253 () Bool)

(assert (=> b!471370 (= e!276253 (validKeyInArray!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471370 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471371 () Bool)

(declare-fun e!276252 () Bool)

(declare-fun e!276254 () Bool)

(assert (=> b!471371 (= e!276252 e!276254)))

(assert (=> b!471371 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun res!281631 () Bool)

(declare-fun lt!213905 () ListLongMap!7573)

(assert (=> b!471371 (= res!281631 (contains!2523 lt!213905 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471371 (=> (not res!281631) (not e!276254))))

(declare-fun d!75439 () Bool)

(declare-fun e!276255 () Bool)

(assert (=> d!75439 e!276255))

(declare-fun res!281632 () Bool)

(assert (=> d!75439 (=> (not res!281632) (not e!276255))))

(assert (=> d!75439 (= res!281632 (not (contains!2523 lt!213905 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75439 (= lt!213905 e!276256)))

(declare-fun c!56954 () Bool)

(assert (=> d!75439 (= c!56954 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75439 (validMask!0 mask!1365)))

(assert (=> d!75439 (= (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213905)))

(declare-fun b!471372 () Bool)

(declare-fun res!281629 () Bool)

(assert (=> b!471372 (=> (not res!281629) (not e!276255))))

(assert (=> b!471372 (= res!281629 (not (contains!2523 lt!213905 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!471373 () Bool)

(assert (=> b!471373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> b!471373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14827 _values!833)))))

(assert (=> b!471373 (= e!276254 (= (apply!329 lt!213905 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)) (get!7061 (select (arr!14475 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30431 () Bool)

(assert (=> bm!30431 (= call!30434 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!471374 () Bool)

(declare-fun lt!213908 () Unit!13817)

(declare-fun lt!213907 () Unit!13817)

(assert (=> b!471374 (= lt!213908 lt!213907)))

(declare-fun lt!213911 () ListLongMap!7573)

(declare-fun lt!213906 () (_ BitVec 64))

(declare-fun lt!213909 () V!18675)

(declare-fun lt!213910 () (_ BitVec 64))

(assert (=> b!471374 (not (contains!2523 (+!1726 lt!213911 (tuple2!8659 lt!213910 lt!213909)) lt!213906))))

(assert (=> b!471374 (= lt!213907 (addStillNotContains!164 lt!213911 lt!213910 lt!213909 lt!213906))))

(assert (=> b!471374 (= lt!213906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!471374 (= lt!213909 (get!7061 (select (arr!14475 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471374 (= lt!213910 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!471374 (= lt!213911 call!30434)))

(assert (=> b!471374 (= e!276257 (+!1726 call!30434 (tuple2!8659 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000) (get!7061 (select (arr!14475 _values!833) #b00000000000000000000000000000000) (dynLambda!919 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471375 () Bool)

(assert (=> b!471375 (= e!276256 e!276257)))

(declare-fun c!56955 () Bool)

(assert (=> b!471375 (= c!56955 (validKeyInArray!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun e!276258 () Bool)

(declare-fun b!471376 () Bool)

(assert (=> b!471376 (= e!276258 (= lt!213905 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!471377 () Bool)

(assert (=> b!471377 (= e!276252 e!276258)))

(declare-fun c!56953 () Bool)

(assert (=> b!471377 (= c!56953 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun b!471378 () Bool)

(assert (=> b!471378 (= e!276255 e!276252)))

(declare-fun c!56956 () Bool)

(assert (=> b!471378 (= c!56956 e!276253)))

(declare-fun res!281630 () Bool)

(assert (=> b!471378 (=> (not res!281630) (not e!276253))))

(assert (=> b!471378 (= res!281630 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun b!471379 () Bool)

(assert (=> b!471379 (= e!276258 (isEmpty!582 lt!213905))))

(assert (= (and d!75439 c!56954) b!471368))

(assert (= (and d!75439 (not c!56954)) b!471375))

(assert (= (and b!471375 c!56955) b!471374))

(assert (= (and b!471375 (not c!56955)) b!471369))

(assert (= (or b!471374 b!471369) bm!30431))

(assert (= (and d!75439 res!281632) b!471372))

(assert (= (and b!471372 res!281629) b!471378))

(assert (= (and b!471378 res!281630) b!471370))

(assert (= (and b!471378 c!56956) b!471371))

(assert (= (and b!471378 (not c!56956)) b!471377))

(assert (= (and b!471371 res!281631) b!471373))

(assert (= (and b!471377 c!56953) b!471376))

(assert (= (and b!471377 (not c!56953)) b!471379))

(declare-fun b_lambda!10171 () Bool)

(assert (=> (not b_lambda!10171) (not b!471373)))

(assert (=> b!471373 t!14687))

(declare-fun b_and!20199 () Bool)

(assert (= b_and!20197 (and (=> t!14687 result!7419) b_and!20199)))

(declare-fun b_lambda!10173 () Bool)

(assert (=> (not b_lambda!10173) (not b!471374)))

(assert (=> b!471374 t!14687))

(declare-fun b_and!20201 () Bool)

(assert (= b_and!20199 (and (=> t!14687 result!7419) b_and!20201)))

(assert (=> b!471375 m!453721))

(assert (=> b!471375 m!453721))

(assert (=> b!471375 m!453723))

(declare-fun m!453761 () Bool)

(assert (=> bm!30431 m!453761))

(assert (=> b!471370 m!453721))

(assert (=> b!471370 m!453721))

(assert (=> b!471370 m!453723))

(declare-fun m!453763 () Bool)

(assert (=> b!471374 m!453763))

(assert (=> b!471374 m!453739))

(assert (=> b!471374 m!453721))

(declare-fun m!453765 () Bool)

(assert (=> b!471374 m!453765))

(declare-fun m!453767 () Bool)

(assert (=> b!471374 m!453767))

(assert (=> b!471374 m!453765))

(declare-fun m!453769 () Bool)

(assert (=> b!471374 m!453769))

(assert (=> b!471374 m!453747))

(assert (=> b!471374 m!453739))

(assert (=> b!471374 m!453747))

(assert (=> b!471374 m!453749))

(assert (=> b!471371 m!453721))

(assert (=> b!471371 m!453721))

(declare-fun m!453771 () Bool)

(assert (=> b!471371 m!453771))

(assert (=> b!471373 m!453739))

(assert (=> b!471373 m!453721))

(assert (=> b!471373 m!453747))

(assert (=> b!471373 m!453721))

(declare-fun m!453773 () Bool)

(assert (=> b!471373 m!453773))

(assert (=> b!471373 m!453739))

(assert (=> b!471373 m!453747))

(assert (=> b!471373 m!453749))

(assert (=> b!471376 m!453761))

(declare-fun m!453775 () Bool)

(assert (=> b!471379 m!453775))

(declare-fun m!453777 () Bool)

(assert (=> d!75439 m!453777))

(assert (=> d!75439 m!453679))

(declare-fun m!453779 () Bool)

(assert (=> b!471372 m!453779))

(assert (=> b!471273 d!75439))

(declare-fun b!471390 () Bool)

(declare-fun e!276269 () Bool)

(declare-fun contains!2524 (List!8728 (_ BitVec 64)) Bool)

(assert (=> b!471390 (= e!276269 (contains!2524 Nil!8725 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75441 () Bool)

(declare-fun res!281641 () Bool)

(declare-fun e!276268 () Bool)

(assert (=> d!75441 (=> res!281641 e!276268)))

(assert (=> d!75441 (= res!281641 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75441 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8725) e!276268)))

(declare-fun b!471391 () Bool)

(declare-fun e!276270 () Bool)

(assert (=> b!471391 (= e!276268 e!276270)))

(declare-fun res!281640 () Bool)

(assert (=> b!471391 (=> (not res!281640) (not e!276270))))

(assert (=> b!471391 (= res!281640 (not e!276269))))

(declare-fun res!281639 () Bool)

(assert (=> b!471391 (=> (not res!281639) (not e!276269))))

(assert (=> b!471391 (= res!281639 (validKeyInArray!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30434 () Bool)

(declare-fun call!30437 () Bool)

(declare-fun c!56959 () Bool)

(assert (=> bm!30434 (= call!30437 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56959 (Cons!8724 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000) Nil!8725) Nil!8725)))))

(declare-fun b!471392 () Bool)

(declare-fun e!276267 () Bool)

(assert (=> b!471392 (= e!276267 call!30437)))

(declare-fun b!471393 () Bool)

(assert (=> b!471393 (= e!276267 call!30437)))

(declare-fun b!471394 () Bool)

(assert (=> b!471394 (= e!276270 e!276267)))

(assert (=> b!471394 (= c!56959 (validKeyInArray!0 (select (arr!14474 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75441 (not res!281641)) b!471391))

(assert (= (and b!471391 res!281639) b!471390))

(assert (= (and b!471391 res!281640) b!471394))

(assert (= (and b!471394 c!56959) b!471392))

(assert (= (and b!471394 (not c!56959)) b!471393))

(assert (= (or b!471392 b!471393) bm!30434))

(assert (=> b!471390 m!453721))

(assert (=> b!471390 m!453721))

(declare-fun m!453781 () Bool)

(assert (=> b!471390 m!453781))

(assert (=> b!471391 m!453721))

(assert (=> b!471391 m!453721))

(assert (=> b!471391 m!453723))

(assert (=> bm!30434 m!453721))

(declare-fun m!453783 () Bool)

(assert (=> bm!30434 m!453783))

(assert (=> b!471394 m!453721))

(assert (=> b!471394 m!453721))

(assert (=> b!471394 m!453723))

(assert (=> b!471269 d!75441))

(declare-fun b!471401 () Bool)

(declare-fun e!276275 () Bool)

(assert (=> b!471401 (= e!276275 tp_is_empty!13177)))

(declare-fun mapIsEmpty!21478 () Bool)

(declare-fun mapRes!21478 () Bool)

(assert (=> mapIsEmpty!21478 mapRes!21478))

(declare-fun mapNonEmpty!21478 () Bool)

(declare-fun tp!41287 () Bool)

(assert (=> mapNonEmpty!21478 (= mapRes!21478 (and tp!41287 e!276275))))

(declare-fun mapValue!21478 () ValueCell!6245)

(declare-fun mapKey!21478 () (_ BitVec 32))

(declare-fun mapRest!21478 () (Array (_ BitVec 32) ValueCell!6245))

(assert (=> mapNonEmpty!21478 (= mapRest!21469 (store mapRest!21478 mapKey!21478 mapValue!21478))))

(declare-fun b!471402 () Bool)

(declare-fun e!276276 () Bool)

(assert (=> b!471402 (= e!276276 tp_is_empty!13177)))

(declare-fun condMapEmpty!21478 () Bool)

(declare-fun mapDefault!21478 () ValueCell!6245)

(assert (=> mapNonEmpty!21469 (= condMapEmpty!21478 (= mapRest!21469 ((as const (Array (_ BitVec 32) ValueCell!6245)) mapDefault!21478)))))

(assert (=> mapNonEmpty!21469 (= tp!41272 (and e!276276 mapRes!21478))))

(assert (= (and mapNonEmpty!21469 condMapEmpty!21478) mapIsEmpty!21478))

(assert (= (and mapNonEmpty!21469 (not condMapEmpty!21478)) mapNonEmpty!21478))

(assert (= (and mapNonEmpty!21478 ((_ is ValueCellFull!6245) mapValue!21478)) b!471401))

(assert (= (and mapNonEmpty!21469 ((_ is ValueCellFull!6245) mapDefault!21478)) b!471402))

(declare-fun m!453785 () Bool)

(assert (=> mapNonEmpty!21478 m!453785))

(declare-fun b_lambda!10175 () Bool)

(assert (= b_lambda!10171 (or (and start!42216 b_free!11749) b_lambda!10175)))

(declare-fun b_lambda!10177 () Bool)

(assert (= b_lambda!10169 (or (and start!42216 b_free!11749) b_lambda!10177)))

(declare-fun b_lambda!10179 () Bool)

(assert (= b_lambda!10173 (or (and start!42216 b_free!11749) b_lambda!10179)))

(declare-fun b_lambda!10181 () Bool)

(assert (= b_lambda!10167 (or (and start!42216 b_free!11749) b_lambda!10181)))

(check-sat (not b_lambda!10179) (not b!471394) (not b_lambda!10175) (not d!75437) (not b!471361) (not b!471358) (not b!471373) (not b!471357) (not b!471374) (not b!471371) (not b!471391) (not bm!30430) (not bm!30434) (not b_next!11749) (not b!471365) (not b!471360) tp_is_empty!13177 (not b!471362) (not bm!30427) (not b_lambda!10177) (not b!471375) (not d!75439) b_and!20201 (not b!471359) (not b_lambda!10181) (not mapNonEmpty!21478) (not b!471390) (not b!471379) (not b!471370) (not b!471372) (not b!471356) (not b!471328) (not d!75435) (not bm!30431) (not b!471329) (not b!471376))
(check-sat b_and!20201 (not b_next!11749))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41878 () Bool)

(assert start!41878)

(declare-fun b_free!11481 () Bool)

(declare-fun b_next!11481 () Bool)

(assert (=> start!41878 (= b_free!11481 (not b_next!11481))))

(declare-fun tp!40453 () Bool)

(declare-fun b_and!19861 () Bool)

(assert (=> start!41878 (= tp!40453 b_and!19861)))

(declare-fun b!467597 () Bool)

(declare-fun res!279467 () Bool)

(declare-fun e!273548 () Bool)

(assert (=> b!467597 (=> (not res!279467) (not e!273548))))

(declare-datatypes ((array!29593 0))(
  ( (array!29594 (arr!14224 (Array (_ BitVec 32) (_ BitVec 64))) (size!14576 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29593)

(declare-datatypes ((List!8615 0))(
  ( (Nil!8612) (Cons!8611 (h!9467 (_ BitVec 64)) (t!14569 List!8615)) )
))
(declare-fun arrayNoDuplicates!0 (array!29593 (_ BitVec 32) List!8615) Bool)

(assert (=> b!467597 (= res!279467 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8612))))

(declare-fun mapIsEmpty!21052 () Bool)

(declare-fun mapRes!21052 () Bool)

(assert (=> mapIsEmpty!21052 mapRes!21052))

(declare-fun b!467598 () Bool)

(declare-fun e!273545 () Bool)

(declare-fun tp_is_empty!12909 () Bool)

(assert (=> b!467598 (= e!273545 tp_is_empty!12909)))

(declare-fun b!467599 () Bool)

(declare-fun res!279468 () Bool)

(assert (=> b!467599 (=> (not res!279468) (not e!273548))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((V!18317 0))(
  ( (V!18318 (val!6499 Int)) )
))
(declare-datatypes ((ValueCell!6111 0))(
  ( (ValueCellFull!6111 (v!8788 V!18317)) (EmptyCell!6111) )
))
(declare-datatypes ((array!29595 0))(
  ( (array!29596 (arr!14225 (Array (_ BitVec 32) ValueCell!6111)) (size!14577 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29595)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467599 (= res!279468 (and (= (size!14577 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14576 _keys!1025) (size!14577 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467601 () Bool)

(declare-fun e!273546 () Bool)

(assert (=> b!467601 (= e!273546 tp_is_empty!12909)))

(declare-fun b!467602 () Bool)

(declare-fun e!273549 () Bool)

(assert (=> b!467602 (= e!273549 (and e!273546 mapRes!21052))))

(declare-fun condMapEmpty!21052 () Bool)

(declare-fun mapDefault!21052 () ValueCell!6111)

(assert (=> b!467602 (= condMapEmpty!21052 (= (arr!14225 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6111)) mapDefault!21052)))))

(declare-fun b!467603 () Bool)

(assert (=> b!467603 (= e!273548 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14576 _keys!1025)))))))

(declare-datatypes ((tuple2!8528 0))(
  ( (tuple2!8529 (_1!4275 (_ BitVec 64)) (_2!4275 V!18317)) )
))
(declare-datatypes ((List!8616 0))(
  ( (Nil!8613) (Cons!8612 (h!9468 tuple2!8528) (t!14570 List!8616)) )
))
(declare-datatypes ((ListLongMap!7441 0))(
  ( (ListLongMap!7442 (toList!3736 List!8616)) )
))
(declare-fun lt!211418 () ListLongMap!7441)

(declare-fun lt!211416 () ListLongMap!7441)

(assert (=> b!467603 (= lt!211418 lt!211416)))

(declare-fun minValueBefore!38 () V!18317)

(declare-fun zeroValue!794 () V!18317)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13632 0))(
  ( (Unit!13633) )
))
(declare-fun lt!211417 () Unit!13632)

(declare-fun minValueAfter!38 () V!18317)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!90 (array!29593 array!29595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18317 V!18317 V!18317 V!18317 (_ BitVec 32) Int) Unit!13632)

(assert (=> b!467603 (= lt!211417 (lemmaNoChangeToArrayThenSameMapNoExtras!90 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1910 (array!29593 array!29595 (_ BitVec 32) (_ BitVec 32) V!18317 V!18317 (_ BitVec 32) Int) ListLongMap!7441)

(assert (=> b!467603 (= lt!211416 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467603 (= lt!211418 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21052 () Bool)

(declare-fun tp!40452 () Bool)

(assert (=> mapNonEmpty!21052 (= mapRes!21052 (and tp!40452 e!273545))))

(declare-fun mapRest!21052 () (Array (_ BitVec 32) ValueCell!6111))

(declare-fun mapKey!21052 () (_ BitVec 32))

(declare-fun mapValue!21052 () ValueCell!6111)

(assert (=> mapNonEmpty!21052 (= (arr!14225 _values!833) (store mapRest!21052 mapKey!21052 mapValue!21052))))

(declare-fun b!467600 () Bool)

(declare-fun res!279465 () Bool)

(assert (=> b!467600 (=> (not res!279465) (not e!273548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29593 (_ BitVec 32)) Bool)

(assert (=> b!467600 (= res!279465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!279466 () Bool)

(assert (=> start!41878 (=> (not res!279466) (not e!273548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41878 (= res!279466 (validMask!0 mask!1365))))

(assert (=> start!41878 e!273548))

(assert (=> start!41878 tp_is_empty!12909))

(assert (=> start!41878 tp!40453))

(assert (=> start!41878 true))

(declare-fun array_inv!10266 (array!29593) Bool)

(assert (=> start!41878 (array_inv!10266 _keys!1025)))

(declare-fun array_inv!10267 (array!29595) Bool)

(assert (=> start!41878 (and (array_inv!10267 _values!833) e!273549)))

(assert (= (and start!41878 res!279466) b!467599))

(assert (= (and b!467599 res!279468) b!467600))

(assert (= (and b!467600 res!279465) b!467597))

(assert (= (and b!467597 res!279467) b!467603))

(assert (= (and b!467602 condMapEmpty!21052) mapIsEmpty!21052))

(assert (= (and b!467602 (not condMapEmpty!21052)) mapNonEmpty!21052))

(get-info :version)

(assert (= (and mapNonEmpty!21052 ((_ is ValueCellFull!6111) mapValue!21052)) b!467598))

(assert (= (and b!467602 ((_ is ValueCellFull!6111) mapDefault!21052)) b!467601))

(assert (= start!41878 b!467602))

(declare-fun m!449727 () Bool)

(assert (=> b!467597 m!449727))

(declare-fun m!449729 () Bool)

(assert (=> b!467603 m!449729))

(declare-fun m!449731 () Bool)

(assert (=> b!467603 m!449731))

(declare-fun m!449733 () Bool)

(assert (=> b!467603 m!449733))

(declare-fun m!449735 () Bool)

(assert (=> b!467600 m!449735))

(declare-fun m!449737 () Bool)

(assert (=> mapNonEmpty!21052 m!449737))

(declare-fun m!449739 () Bool)

(assert (=> start!41878 m!449739))

(declare-fun m!449741 () Bool)

(assert (=> start!41878 m!449741))

(declare-fun m!449743 () Bool)

(assert (=> start!41878 m!449743))

(check-sat tp_is_empty!12909 (not start!41878) (not b_next!11481) b_and!19861 (not b!467600) (not b!467597) (not mapNonEmpty!21052) (not b!467603))
(check-sat b_and!19861 (not b_next!11481))
(get-model)

(declare-fun d!75203 () Bool)

(assert (=> d!75203 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41878 d!75203))

(declare-fun d!75205 () Bool)

(assert (=> d!75205 (= (array_inv!10266 _keys!1025) (bvsge (size!14576 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41878 d!75205))

(declare-fun d!75207 () Bool)

(assert (=> d!75207 (= (array_inv!10267 _values!833) (bvsge (size!14577 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41878 d!75207))

(declare-fun b!467635 () Bool)

(declare-fun e!273576 () Bool)

(declare-fun call!30317 () Bool)

(assert (=> b!467635 (= e!273576 call!30317)))

(declare-fun bm!30314 () Bool)

(declare-fun c!56791 () Bool)

(assert (=> bm!30314 (= call!30317 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56791 (Cons!8611 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000) Nil!8612) Nil!8612)))))

(declare-fun d!75209 () Bool)

(declare-fun res!279487 () Bool)

(declare-fun e!273575 () Bool)

(assert (=> d!75209 (=> res!279487 e!273575)))

(assert (=> d!75209 (= res!279487 (bvsge #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(assert (=> d!75209 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8612) e!273575)))

(declare-fun b!467636 () Bool)

(assert (=> b!467636 (= e!273576 call!30317)))

(declare-fun b!467637 () Bool)

(declare-fun e!273574 () Bool)

(declare-fun contains!2530 (List!8615 (_ BitVec 64)) Bool)

(assert (=> b!467637 (= e!273574 (contains!2530 Nil!8612 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467638 () Bool)

(declare-fun e!273573 () Bool)

(assert (=> b!467638 (= e!273573 e!273576)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!467638 (= c!56791 (validKeyInArray!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467639 () Bool)

(assert (=> b!467639 (= e!273575 e!273573)))

(declare-fun res!279488 () Bool)

(assert (=> b!467639 (=> (not res!279488) (not e!273573))))

(assert (=> b!467639 (= res!279488 (not e!273574))))

(declare-fun res!279489 () Bool)

(assert (=> b!467639 (=> (not res!279489) (not e!273574))))

(assert (=> b!467639 (= res!279489 (validKeyInArray!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75209 (not res!279487)) b!467639))

(assert (= (and b!467639 res!279489) b!467637))

(assert (= (and b!467639 res!279488) b!467638))

(assert (= (and b!467638 c!56791) b!467636))

(assert (= (and b!467638 (not c!56791)) b!467635))

(assert (= (or b!467636 b!467635) bm!30314))

(declare-fun m!449763 () Bool)

(assert (=> bm!30314 m!449763))

(declare-fun m!449765 () Bool)

(assert (=> bm!30314 m!449765))

(assert (=> b!467637 m!449763))

(assert (=> b!467637 m!449763))

(declare-fun m!449767 () Bool)

(assert (=> b!467637 m!449767))

(assert (=> b!467638 m!449763))

(assert (=> b!467638 m!449763))

(declare-fun m!449769 () Bool)

(assert (=> b!467638 m!449769))

(assert (=> b!467639 m!449763))

(assert (=> b!467639 m!449763))

(assert (=> b!467639 m!449769))

(assert (=> b!467597 d!75209))

(declare-fun b!467648 () Bool)

(declare-fun e!273584 () Bool)

(declare-fun e!273585 () Bool)

(assert (=> b!467648 (= e!273584 e!273585)))

(declare-fun c!56794 () Bool)

(assert (=> b!467648 (= c!56794 (validKeyInArray!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75211 () Bool)

(declare-fun res!279495 () Bool)

(assert (=> d!75211 (=> res!279495 e!273584)))

(assert (=> d!75211 (= res!279495 (bvsge #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(assert (=> d!75211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!273584)))

(declare-fun b!467649 () Bool)

(declare-fun e!273583 () Bool)

(assert (=> b!467649 (= e!273585 e!273583)))

(declare-fun lt!211436 () (_ BitVec 64))

(assert (=> b!467649 (= lt!211436 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211434 () Unit!13632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29593 (_ BitVec 64) (_ BitVec 32)) Unit!13632)

(assert (=> b!467649 (= lt!211434 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211436 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!467649 (arrayContainsKey!0 _keys!1025 lt!211436 #b00000000000000000000000000000000)))

(declare-fun lt!211435 () Unit!13632)

(assert (=> b!467649 (= lt!211435 lt!211434)))

(declare-fun res!279494 () Bool)

(declare-datatypes ((SeekEntryResult!3548 0))(
  ( (MissingZero!3548 (index!16371 (_ BitVec 32))) (Found!3548 (index!16372 (_ BitVec 32))) (Intermediate!3548 (undefined!4360 Bool) (index!16373 (_ BitVec 32)) (x!43752 (_ BitVec 32))) (Undefined!3548) (MissingVacant!3548 (index!16374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29593 (_ BitVec 32)) SeekEntryResult!3548)

(assert (=> b!467649 (= res!279494 (= (seekEntryOrOpen!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3548 #b00000000000000000000000000000000)))))

(assert (=> b!467649 (=> (not res!279494) (not e!273583))))

(declare-fun b!467650 () Bool)

(declare-fun call!30320 () Bool)

(assert (=> b!467650 (= e!273583 call!30320)))

(declare-fun bm!30317 () Bool)

(assert (=> bm!30317 (= call!30320 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!467651 () Bool)

(assert (=> b!467651 (= e!273585 call!30320)))

(assert (= (and d!75211 (not res!279495)) b!467648))

(assert (= (and b!467648 c!56794) b!467649))

(assert (= (and b!467648 (not c!56794)) b!467651))

(assert (= (and b!467649 res!279494) b!467650))

(assert (= (or b!467650 b!467651) bm!30317))

(assert (=> b!467648 m!449763))

(assert (=> b!467648 m!449763))

(assert (=> b!467648 m!449769))

(assert (=> b!467649 m!449763))

(declare-fun m!449771 () Bool)

(assert (=> b!467649 m!449771))

(declare-fun m!449773 () Bool)

(assert (=> b!467649 m!449773))

(assert (=> b!467649 m!449763))

(declare-fun m!449775 () Bool)

(assert (=> b!467649 m!449775))

(declare-fun m!449777 () Bool)

(assert (=> bm!30317 m!449777))

(assert (=> b!467600 d!75211))

(declare-fun d!75213 () Bool)

(assert (=> d!75213 (= (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211439 () Unit!13632)

(declare-fun choose!1341 (array!29593 array!29595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18317 V!18317 V!18317 V!18317 (_ BitVec 32) Int) Unit!13632)

(assert (=> d!75213 (= lt!211439 (choose!1341 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75213 (validMask!0 mask!1365)))

(assert (=> d!75213 (= (lemmaNoChangeToArrayThenSameMapNoExtras!90 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211439)))

(declare-fun bs!14806 () Bool)

(assert (= bs!14806 d!75213))

(assert (=> bs!14806 m!449733))

(assert (=> bs!14806 m!449731))

(declare-fun m!449779 () Bool)

(assert (=> bs!14806 m!449779))

(assert (=> bs!14806 m!449739))

(assert (=> b!467603 d!75213))

(declare-fun b!467676 () Bool)

(declare-fun e!273605 () ListLongMap!7441)

(declare-fun e!273603 () ListLongMap!7441)

(assert (=> b!467676 (= e!273605 e!273603)))

(declare-fun c!56803 () Bool)

(assert (=> b!467676 (= c!56803 (validKeyInArray!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467677 () Bool)

(declare-fun res!279505 () Bool)

(declare-fun e!273601 () Bool)

(assert (=> b!467677 (=> (not res!279505) (not e!273601))))

(declare-fun lt!211454 () ListLongMap!7441)

(declare-fun contains!2531 (ListLongMap!7441 (_ BitVec 64)) Bool)

(assert (=> b!467677 (= res!279505 (not (contains!2531 lt!211454 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!467678 () Bool)

(declare-fun e!273604 () Bool)

(declare-fun isEmpty!571 (ListLongMap!7441) Bool)

(assert (=> b!467678 (= e!273604 (isEmpty!571 lt!211454))))

(declare-fun b!467679 () Bool)

(declare-fun call!30323 () ListLongMap!7441)

(assert (=> b!467679 (= e!273603 call!30323)))

(declare-fun b!467680 () Bool)

(declare-fun e!273602 () Bool)

(assert (=> b!467680 (= e!273601 e!273602)))

(declare-fun c!56805 () Bool)

(declare-fun e!273600 () Bool)

(assert (=> b!467680 (= c!56805 e!273600)))

(declare-fun res!279507 () Bool)

(assert (=> b!467680 (=> (not res!279507) (not e!273600))))

(assert (=> b!467680 (= res!279507 (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(declare-fun b!467681 () Bool)

(assert (=> b!467681 (= e!273600 (validKeyInArray!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467681 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!467683 () Bool)

(assert (=> b!467683 (= e!273605 (ListLongMap!7442 Nil!8613))))

(declare-fun b!467684 () Bool)

(assert (=> b!467684 (= e!273602 e!273604)))

(declare-fun c!56804 () Bool)

(assert (=> b!467684 (= c!56804 (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(declare-fun b!467685 () Bool)

(assert (=> b!467685 (= e!273604 (= lt!211454 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30320 () Bool)

(assert (=> bm!30320 (= call!30323 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!467682 () Bool)

(declare-fun lt!211459 () Unit!13632)

(declare-fun lt!211457 () Unit!13632)

(assert (=> b!467682 (= lt!211459 lt!211457)))

(declare-fun lt!211458 () V!18317)

(declare-fun lt!211460 () (_ BitVec 64))

(declare-fun lt!211455 () ListLongMap!7441)

(declare-fun lt!211456 () (_ BitVec 64))

(declare-fun +!1673 (ListLongMap!7441 tuple2!8528) ListLongMap!7441)

(assert (=> b!467682 (not (contains!2531 (+!1673 lt!211455 (tuple2!8529 lt!211456 lt!211458)) lt!211460))))

(declare-fun addStillNotContains!157 (ListLongMap!7441 (_ BitVec 64) V!18317 (_ BitVec 64)) Unit!13632)

(assert (=> b!467682 (= lt!211457 (addStillNotContains!157 lt!211455 lt!211456 lt!211458 lt!211460))))

(assert (=> b!467682 (= lt!211460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6963 (ValueCell!6111 V!18317) V!18317)

(declare-fun dynLambda!917 (Int (_ BitVec 64)) V!18317)

(assert (=> b!467682 (= lt!211458 (get!6963 (select (arr!14225 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!467682 (= lt!211456 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!467682 (= lt!211455 call!30323)))

(assert (=> b!467682 (= e!273603 (+!1673 call!30323 (tuple2!8529 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000) (get!6963 (select (arr!14225 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!75215 () Bool)

(assert (=> d!75215 e!273601))

(declare-fun res!279504 () Bool)

(assert (=> d!75215 (=> (not res!279504) (not e!273601))))

(assert (=> d!75215 (= res!279504 (not (contains!2531 lt!211454 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75215 (= lt!211454 e!273605)))

(declare-fun c!56806 () Bool)

(assert (=> d!75215 (= c!56806 (bvsge #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(assert (=> d!75215 (validMask!0 mask!1365)))

(assert (=> d!75215 (= (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211454)))

(declare-fun b!467686 () Bool)

(declare-fun e!273606 () Bool)

(assert (=> b!467686 (= e!273602 e!273606)))

(assert (=> b!467686 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(declare-fun res!279506 () Bool)

(assert (=> b!467686 (= res!279506 (contains!2531 lt!211454 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467686 (=> (not res!279506) (not e!273606))))

(declare-fun b!467687 () Bool)

(assert (=> b!467687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(assert (=> b!467687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14577 _values!833)))))

(declare-fun apply!324 (ListLongMap!7441 (_ BitVec 64)) V!18317)

(assert (=> b!467687 (= e!273606 (= (apply!324 lt!211454 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)) (get!6963 (select (arr!14225 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75215 c!56806) b!467683))

(assert (= (and d!75215 (not c!56806)) b!467676))

(assert (= (and b!467676 c!56803) b!467682))

(assert (= (and b!467676 (not c!56803)) b!467679))

(assert (= (or b!467682 b!467679) bm!30320))

(assert (= (and d!75215 res!279504) b!467677))

(assert (= (and b!467677 res!279505) b!467680))

(assert (= (and b!467680 res!279507) b!467681))

(assert (= (and b!467680 c!56805) b!467686))

(assert (= (and b!467680 (not c!56805)) b!467684))

(assert (= (and b!467686 res!279506) b!467687))

(assert (= (and b!467684 c!56804) b!467685))

(assert (= (and b!467684 (not c!56804)) b!467678))

(declare-fun b_lambda!10053 () Bool)

(assert (=> (not b_lambda!10053) (not b!467682)))

(declare-fun t!14574 () Bool)

(declare-fun tb!3913 () Bool)

(assert (=> (and start!41878 (= defaultEntry!841 defaultEntry!841) t!14574) tb!3913))

(declare-fun result!7397 () Bool)

(assert (=> tb!3913 (= result!7397 tp_is_empty!12909)))

(assert (=> b!467682 t!14574))

(declare-fun b_and!19865 () Bool)

(assert (= b_and!19861 (and (=> t!14574 result!7397) b_and!19865)))

(declare-fun b_lambda!10055 () Bool)

(assert (=> (not b_lambda!10055) (not b!467687)))

(assert (=> b!467687 t!14574))

(declare-fun b_and!19867 () Bool)

(assert (= b_and!19865 (and (=> t!14574 result!7397) b_and!19867)))

(assert (=> b!467681 m!449763))

(assert (=> b!467681 m!449763))

(assert (=> b!467681 m!449769))

(assert (=> b!467686 m!449763))

(assert (=> b!467686 m!449763))

(declare-fun m!449781 () Bool)

(assert (=> b!467686 m!449781))

(assert (=> b!467682 m!449763))

(declare-fun m!449783 () Bool)

(assert (=> b!467682 m!449783))

(declare-fun m!449785 () Bool)

(assert (=> b!467682 m!449785))

(assert (=> b!467682 m!449785))

(declare-fun m!449787 () Bool)

(assert (=> b!467682 m!449787))

(declare-fun m!449789 () Bool)

(assert (=> b!467682 m!449789))

(declare-fun m!449791 () Bool)

(assert (=> b!467682 m!449791))

(assert (=> b!467682 m!449791))

(declare-fun m!449793 () Bool)

(assert (=> b!467682 m!449793))

(declare-fun m!449795 () Bool)

(assert (=> b!467682 m!449795))

(assert (=> b!467682 m!449787))

(declare-fun m!449797 () Bool)

(assert (=> b!467685 m!449797))

(declare-fun m!449799 () Bool)

(assert (=> d!75215 m!449799))

(assert (=> d!75215 m!449739))

(assert (=> b!467676 m!449763))

(assert (=> b!467676 m!449763))

(assert (=> b!467676 m!449769))

(assert (=> b!467687 m!449763))

(assert (=> b!467687 m!449785))

(assert (=> b!467687 m!449763))

(declare-fun m!449801 () Bool)

(assert (=> b!467687 m!449801))

(assert (=> b!467687 m!449785))

(assert (=> b!467687 m!449787))

(assert (=> b!467687 m!449789))

(assert (=> b!467687 m!449787))

(declare-fun m!449803 () Bool)

(assert (=> b!467677 m!449803))

(assert (=> bm!30320 m!449797))

(declare-fun m!449805 () Bool)

(assert (=> b!467678 m!449805))

(assert (=> b!467603 d!75215))

(declare-fun b!467690 () Bool)

(declare-fun e!273612 () ListLongMap!7441)

(declare-fun e!273610 () ListLongMap!7441)

(assert (=> b!467690 (= e!273612 e!273610)))

(declare-fun c!56807 () Bool)

(assert (=> b!467690 (= c!56807 (validKeyInArray!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467691 () Bool)

(declare-fun res!279509 () Bool)

(declare-fun e!273608 () Bool)

(assert (=> b!467691 (=> (not res!279509) (not e!273608))))

(declare-fun lt!211461 () ListLongMap!7441)

(assert (=> b!467691 (= res!279509 (not (contains!2531 lt!211461 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!467692 () Bool)

(declare-fun e!273611 () Bool)

(assert (=> b!467692 (= e!273611 (isEmpty!571 lt!211461))))

(declare-fun b!467693 () Bool)

(declare-fun call!30324 () ListLongMap!7441)

(assert (=> b!467693 (= e!273610 call!30324)))

(declare-fun b!467694 () Bool)

(declare-fun e!273609 () Bool)

(assert (=> b!467694 (= e!273608 e!273609)))

(declare-fun c!56809 () Bool)

(declare-fun e!273607 () Bool)

(assert (=> b!467694 (= c!56809 e!273607)))

(declare-fun res!279511 () Bool)

(assert (=> b!467694 (=> (not res!279511) (not e!273607))))

(assert (=> b!467694 (= res!279511 (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(declare-fun b!467695 () Bool)

(assert (=> b!467695 (= e!273607 (validKeyInArray!0 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467695 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!467697 () Bool)

(assert (=> b!467697 (= e!273612 (ListLongMap!7442 Nil!8613))))

(declare-fun b!467698 () Bool)

(assert (=> b!467698 (= e!273609 e!273611)))

(declare-fun c!56808 () Bool)

(assert (=> b!467698 (= c!56808 (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(declare-fun b!467699 () Bool)

(assert (=> b!467699 (= e!273611 (= lt!211461 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30321 () Bool)

(assert (=> bm!30321 (= call!30324 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!467696 () Bool)

(declare-fun lt!211466 () Unit!13632)

(declare-fun lt!211464 () Unit!13632)

(assert (=> b!467696 (= lt!211466 lt!211464)))

(declare-fun lt!211467 () (_ BitVec 64))

(declare-fun lt!211462 () ListLongMap!7441)

(declare-fun lt!211463 () (_ BitVec 64))

(declare-fun lt!211465 () V!18317)

(assert (=> b!467696 (not (contains!2531 (+!1673 lt!211462 (tuple2!8529 lt!211463 lt!211465)) lt!211467))))

(assert (=> b!467696 (= lt!211464 (addStillNotContains!157 lt!211462 lt!211463 lt!211465 lt!211467))))

(assert (=> b!467696 (= lt!211467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!467696 (= lt!211465 (get!6963 (select (arr!14225 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!467696 (= lt!211463 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!467696 (= lt!211462 call!30324)))

(assert (=> b!467696 (= e!273610 (+!1673 call!30324 (tuple2!8529 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000) (get!6963 (select (arr!14225 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!75217 () Bool)

(assert (=> d!75217 e!273608))

(declare-fun res!279508 () Bool)

(assert (=> d!75217 (=> (not res!279508) (not e!273608))))

(assert (=> d!75217 (= res!279508 (not (contains!2531 lt!211461 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75217 (= lt!211461 e!273612)))

(declare-fun c!56810 () Bool)

(assert (=> d!75217 (= c!56810 (bvsge #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(assert (=> d!75217 (validMask!0 mask!1365)))

(assert (=> d!75217 (= (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211461)))

(declare-fun b!467700 () Bool)

(declare-fun e!273613 () Bool)

(assert (=> b!467700 (= e!273609 e!273613)))

(assert (=> b!467700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(declare-fun res!279510 () Bool)

(assert (=> b!467700 (= res!279510 (contains!2531 lt!211461 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467700 (=> (not res!279510) (not e!273613))))

(declare-fun b!467701 () Bool)

(assert (=> b!467701 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14576 _keys!1025)))))

(assert (=> b!467701 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14577 _values!833)))))

(assert (=> b!467701 (= e!273613 (= (apply!324 lt!211461 (select (arr!14224 _keys!1025) #b00000000000000000000000000000000)) (get!6963 (select (arr!14225 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75217 c!56810) b!467697))

(assert (= (and d!75217 (not c!56810)) b!467690))

(assert (= (and b!467690 c!56807) b!467696))

(assert (= (and b!467690 (not c!56807)) b!467693))

(assert (= (or b!467696 b!467693) bm!30321))

(assert (= (and d!75217 res!279508) b!467691))

(assert (= (and b!467691 res!279509) b!467694))

(assert (= (and b!467694 res!279511) b!467695))

(assert (= (and b!467694 c!56809) b!467700))

(assert (= (and b!467694 (not c!56809)) b!467698))

(assert (= (and b!467700 res!279510) b!467701))

(assert (= (and b!467698 c!56808) b!467699))

(assert (= (and b!467698 (not c!56808)) b!467692))

(declare-fun b_lambda!10057 () Bool)

(assert (=> (not b_lambda!10057) (not b!467696)))

(assert (=> b!467696 t!14574))

(declare-fun b_and!19869 () Bool)

(assert (= b_and!19867 (and (=> t!14574 result!7397) b_and!19869)))

(declare-fun b_lambda!10059 () Bool)

(assert (=> (not b_lambda!10059) (not b!467701)))

(assert (=> b!467701 t!14574))

(declare-fun b_and!19871 () Bool)

(assert (= b_and!19869 (and (=> t!14574 result!7397) b_and!19871)))

(assert (=> b!467695 m!449763))

(assert (=> b!467695 m!449763))

(assert (=> b!467695 m!449769))

(assert (=> b!467700 m!449763))

(assert (=> b!467700 m!449763))

(declare-fun m!449807 () Bool)

(assert (=> b!467700 m!449807))

(assert (=> b!467696 m!449763))

(declare-fun m!449809 () Bool)

(assert (=> b!467696 m!449809))

(assert (=> b!467696 m!449785))

(assert (=> b!467696 m!449785))

(assert (=> b!467696 m!449787))

(assert (=> b!467696 m!449789))

(declare-fun m!449811 () Bool)

(assert (=> b!467696 m!449811))

(assert (=> b!467696 m!449811))

(declare-fun m!449813 () Bool)

(assert (=> b!467696 m!449813))

(declare-fun m!449815 () Bool)

(assert (=> b!467696 m!449815))

(assert (=> b!467696 m!449787))

(declare-fun m!449817 () Bool)

(assert (=> b!467699 m!449817))

(declare-fun m!449819 () Bool)

(assert (=> d!75217 m!449819))

(assert (=> d!75217 m!449739))

(assert (=> b!467690 m!449763))

(assert (=> b!467690 m!449763))

(assert (=> b!467690 m!449769))

(assert (=> b!467701 m!449763))

(assert (=> b!467701 m!449785))

(assert (=> b!467701 m!449763))

(declare-fun m!449821 () Bool)

(assert (=> b!467701 m!449821))

(assert (=> b!467701 m!449785))

(assert (=> b!467701 m!449787))

(assert (=> b!467701 m!449789))

(assert (=> b!467701 m!449787))

(declare-fun m!449823 () Bool)

(assert (=> b!467691 m!449823))

(assert (=> bm!30321 m!449817))

(declare-fun m!449825 () Bool)

(assert (=> b!467692 m!449825))

(assert (=> b!467603 d!75217))

(declare-fun b!467708 () Bool)

(declare-fun e!273619 () Bool)

(assert (=> b!467708 (= e!273619 tp_is_empty!12909)))

(declare-fun condMapEmpty!21058 () Bool)

(declare-fun mapDefault!21058 () ValueCell!6111)

(assert (=> mapNonEmpty!21052 (= condMapEmpty!21058 (= mapRest!21052 ((as const (Array (_ BitVec 32) ValueCell!6111)) mapDefault!21058)))))

(declare-fun e!273618 () Bool)

(declare-fun mapRes!21058 () Bool)

(assert (=> mapNonEmpty!21052 (= tp!40452 (and e!273618 mapRes!21058))))

(declare-fun mapIsEmpty!21058 () Bool)

(assert (=> mapIsEmpty!21058 mapRes!21058))

(declare-fun b!467709 () Bool)

(assert (=> b!467709 (= e!273618 tp_is_empty!12909)))

(declare-fun mapNonEmpty!21058 () Bool)

(declare-fun tp!40462 () Bool)

(assert (=> mapNonEmpty!21058 (= mapRes!21058 (and tp!40462 e!273619))))

(declare-fun mapKey!21058 () (_ BitVec 32))

(declare-fun mapRest!21058 () (Array (_ BitVec 32) ValueCell!6111))

(declare-fun mapValue!21058 () ValueCell!6111)

(assert (=> mapNonEmpty!21058 (= mapRest!21052 (store mapRest!21058 mapKey!21058 mapValue!21058))))

(assert (= (and mapNonEmpty!21052 condMapEmpty!21058) mapIsEmpty!21058))

(assert (= (and mapNonEmpty!21052 (not condMapEmpty!21058)) mapNonEmpty!21058))

(assert (= (and mapNonEmpty!21058 ((_ is ValueCellFull!6111) mapValue!21058)) b!467708))

(assert (= (and mapNonEmpty!21052 ((_ is ValueCellFull!6111) mapDefault!21058)) b!467709))

(declare-fun m!449827 () Bool)

(assert (=> mapNonEmpty!21058 m!449827))

(declare-fun b_lambda!10061 () Bool)

(assert (= b_lambda!10057 (or (and start!41878 b_free!11481) b_lambda!10061)))

(declare-fun b_lambda!10063 () Bool)

(assert (= b_lambda!10059 (or (and start!41878 b_free!11481) b_lambda!10063)))

(declare-fun b_lambda!10065 () Bool)

(assert (= b_lambda!10053 (or (and start!41878 b_free!11481) b_lambda!10065)))

(declare-fun b_lambda!10067 () Bool)

(assert (= b_lambda!10055 (or (and start!41878 b_free!11481) b_lambda!10067)))

(check-sat (not b_lambda!10067) (not b_next!11481) (not b!467685) (not b!467691) (not b!467695) (not bm!30321) (not b_lambda!10061) (not b_lambda!10063) (not d!75217) (not mapNonEmpty!21058) (not d!75215) tp_is_empty!12909 (not b!467682) (not b!467692) (not bm!30314) (not bm!30317) (not d!75213) (not b!467649) (not b!467681) (not b!467696) (not b!467639) (not b!467687) (not b!467677) (not b!467676) (not b!467701) (not b_lambda!10065) (not b!467637) (not b!467638) (not b!467699) (not b!467648) (not bm!30320) (not b!467686) (not b!467678) (not b!467700) (not b!467690) b_and!19871)
(check-sat b_and!19871 (not b_next!11481))

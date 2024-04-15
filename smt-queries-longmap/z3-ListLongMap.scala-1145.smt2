; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23794 () Bool)

(assert start!23794)

(declare-fun b!249534 () Bool)

(declare-fun b_free!6619 () Bool)

(declare-fun b_next!6619 () Bool)

(assert (=> b!249534 (= b_free!6619 (not b_next!6619))))

(declare-fun tp!23118 () Bool)

(declare-fun b_and!13607 () Bool)

(assert (=> b!249534 (= tp!23118 b_and!13607)))

(declare-fun bm!23418 () Bool)

(declare-fun call!23421 () Bool)

(declare-datatypes ((SeekEntryResult!1116 0))(
  ( (MissingZero!1116 (index!6634 (_ BitVec 32))) (Found!1116 (index!6635 (_ BitVec 32))) (Intermediate!1116 (undefined!1928 Bool) (index!6636 (_ BitVec 32)) (x!24639 (_ BitVec 32))) (Undefined!1116) (MissingVacant!1116 (index!6637 (_ BitVec 32))) )
))
(declare-fun lt!124889 () SeekEntryResult!1116)

(declare-datatypes ((V!8289 0))(
  ( (V!8290 (val!3285 Int)) )
))
(declare-datatypes ((ValueCell!2897 0))(
  ( (ValueCellFull!2897 (v!5342 V!8289)) (EmptyCell!2897) )
))
(declare-datatypes ((array!12269 0))(
  ( (array!12270 (arr!5817 (Array (_ BitVec 32) ValueCell!2897)) (size!6162 (_ BitVec 32))) )
))
(declare-datatypes ((array!12271 0))(
  ( (array!12272 (arr!5818 (Array (_ BitVec 32) (_ BitVec 64))) (size!6163 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3694 0))(
  ( (LongMapFixedSize!3695 (defaultEntry!4616 Int) (mask!10787 (_ BitVec 32)) (extraKeys!4353 (_ BitVec 32)) (zeroValue!4457 V!8289) (minValue!4457 V!8289) (_size!1896 (_ BitVec 32)) (_keys!6747 array!12271) (_values!4599 array!12269) (_vacant!1896 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3694)

(declare-fun c!41879 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23418 (= call!23421 (inRange!0 (ite c!41879 (index!6634 lt!124889) (index!6637 lt!124889)) (mask!10787 thiss!1504)))))

(declare-fun b!249530 () Bool)

(declare-fun e!161843 () Bool)

(declare-fun tp_is_empty!6481 () Bool)

(assert (=> b!249530 (= e!161843 tp_is_empty!6481)))

(declare-fun mapIsEmpty!11010 () Bool)

(declare-fun mapRes!11010 () Bool)

(assert (=> mapIsEmpty!11010 mapRes!11010))

(declare-fun b!249531 () Bool)

(declare-datatypes ((Unit!7710 0))(
  ( (Unit!7711) )
))
(declare-fun e!161841 () Unit!7710)

(declare-fun Unit!7712 () Unit!7710)

(assert (=> b!249531 (= e!161841 Unit!7712)))

(declare-fun lt!124886 () Unit!7710)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!205 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) (_ BitVec 32) Int) Unit!7710)

(assert (=> b!249531 (= lt!124886 (lemmaArrayContainsKeyThenInListMap!205 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(assert (=> b!249531 false))

(declare-fun b!249532 () Bool)

(declare-fun e!161832 () Bool)

(declare-fun e!161839 () Bool)

(assert (=> b!249532 (= e!161832 (not e!161839))))

(declare-fun res!122225 () Bool)

(assert (=> b!249532 (=> res!122225 e!161839)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249532 (= res!122225 (not (validMask!0 (mask!10787 thiss!1504))))))

(declare-fun lt!124892 () array!12271)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12271 (_ BitVec 32)) Bool)

(assert (=> b!249532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124892 (mask!10787 thiss!1504))))

(declare-fun lt!124891 () Unit!7710)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12271 (_ BitVec 32) (_ BitVec 32)) Unit!7710)

(assert (=> b!249532 (= lt!124891 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) index!297 (mask!10787 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249532 (= (arrayCountValidKeys!0 lt!124892 #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6747 thiss!1504) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504)))))))

(declare-fun lt!124895 () Unit!7710)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12271 (_ BitVec 32) (_ BitVec 64)) Unit!7710)

(assert (=> b!249532 (= lt!124895 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6747 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3701 0))(
  ( (Nil!3698) (Cons!3697 (h!4356 (_ BitVec 64)) (t!8723 List!3701)) )
))
(declare-fun arrayNoDuplicates!0 (array!12271 (_ BitVec 32) List!3701) Bool)

(assert (=> b!249532 (arrayNoDuplicates!0 lt!124892 #b00000000000000000000000000000000 Nil!3698)))

(assert (=> b!249532 (= lt!124892 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun lt!124890 () Unit!7710)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3701) Unit!7710)

(assert (=> b!249532 (= lt!124890 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6747 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3698))))

(declare-fun lt!124887 () Unit!7710)

(assert (=> b!249532 (= lt!124887 e!161841)))

(declare-fun c!41880 () Bool)

(declare-fun arrayContainsKey!0 (array!12271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!249532 (= c!41880 (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249533 () Bool)

(declare-fun e!161845 () Bool)

(assert (=> b!249533 (= e!161845 (and e!161843 mapRes!11010))))

(declare-fun condMapEmpty!11010 () Bool)

(declare-fun mapDefault!11010 () ValueCell!2897)

(assert (=> b!249533 (= condMapEmpty!11010 (= (arr!5817 (_values!4599 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2897)) mapDefault!11010)))))

(declare-fun e!161837 () Bool)

(declare-fun array_inv!3835 (array!12271) Bool)

(declare-fun array_inv!3836 (array!12269) Bool)

(assert (=> b!249534 (= e!161837 (and tp!23118 tp_is_empty!6481 (array_inv!3835 (_keys!6747 thiss!1504)) (array_inv!3836 (_values!4599 thiss!1504)) e!161845))))

(declare-fun b!249535 () Bool)

(declare-fun res!122224 () Bool)

(declare-fun e!161834 () Bool)

(assert (=> b!249535 (=> (not res!122224) (not e!161834))))

(assert (=> b!249535 (= res!122224 call!23421)))

(declare-fun e!161842 () Bool)

(assert (=> b!249535 (= e!161842 e!161834)))

(declare-fun b!249536 () Bool)

(declare-fun e!161833 () Bool)

(declare-fun call!23422 () Bool)

(assert (=> b!249536 (= e!161833 (not call!23422))))

(declare-fun b!249537 () Bool)

(declare-fun res!122217 () Bool)

(declare-fun e!161844 () Bool)

(assert (=> b!249537 (=> (not res!122217) (not e!161844))))

(assert (=> b!249537 (= res!122217 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249538 () Bool)

(declare-fun e!161831 () Bool)

(assert (=> b!249538 (= e!161831 e!161832)))

(declare-fun res!122222 () Bool)

(assert (=> b!249538 (=> (not res!122222) (not e!161832))))

(assert (=> b!249538 (= res!122222 (inRange!0 index!297 (mask!10787 thiss!1504)))))

(declare-fun lt!124888 () Unit!7710)

(declare-fun e!161840 () Unit!7710)

(assert (=> b!249538 (= lt!124888 e!161840)))

(declare-fun c!41878 () Bool)

(declare-datatypes ((tuple2!4802 0))(
  ( (tuple2!4803 (_1!2412 (_ BitVec 64)) (_2!2412 V!8289)) )
))
(declare-datatypes ((List!3702 0))(
  ( (Nil!3699) (Cons!3698 (h!4357 tuple2!4802) (t!8724 List!3702)) )
))
(declare-datatypes ((ListLongMap!3705 0))(
  ( (ListLongMap!3706 (toList!1868 List!3702)) )
))
(declare-fun contains!1792 (ListLongMap!3705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1377 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 32) Int) ListLongMap!3705)

(assert (=> b!249538 (= c!41878 (contains!1792 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932))))

(declare-fun b!249539 () Bool)

(declare-fun c!41881 () Bool)

(get-info :version)

(assert (=> b!249539 (= c!41881 ((_ is MissingVacant!1116) lt!124889))))

(declare-fun e!161836 () Bool)

(assert (=> b!249539 (= e!161842 e!161836)))

(declare-fun b!249540 () Bool)

(assert (=> b!249540 (= e!161844 e!161831)))

(declare-fun res!122218 () Bool)

(assert (=> b!249540 (=> (not res!122218) (not e!161831))))

(assert (=> b!249540 (= res!122218 (or (= lt!124889 (MissingZero!1116 index!297)) (= lt!124889 (MissingVacant!1116 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12271 (_ BitVec 32)) SeekEntryResult!1116)

(assert (=> b!249540 (= lt!124889 (seekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun b!249541 () Bool)

(assert (=> b!249541 (= e!161836 ((_ is Undefined!1116) lt!124889))))

(declare-fun res!122220 () Bool)

(assert (=> start!23794 (=> (not res!122220) (not e!161844))))

(declare-fun valid!1450 (LongMapFixedSize!3694) Bool)

(assert (=> start!23794 (= res!122220 (valid!1450 thiss!1504))))

(assert (=> start!23794 e!161844))

(assert (=> start!23794 e!161837))

(assert (=> start!23794 true))

(declare-fun b!249542 () Bool)

(declare-fun Unit!7713 () Unit!7710)

(assert (=> b!249542 (= e!161840 Unit!7713)))

(declare-fun lt!124893 () Unit!7710)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!397 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7710)

(assert (=> b!249542 (= lt!124893 (lemmaInListMapThenSeekEntryOrOpenFindsIt!397 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> b!249542 false))

(declare-fun bm!23419 () Bool)

(assert (=> bm!23419 (= call!23422 (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249543 () Bool)

(declare-fun res!122223 () Bool)

(assert (=> b!249543 (=> (not res!122223) (not e!161834))))

(assert (=> b!249543 (= res!122223 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6634 lt!124889)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249544 () Bool)

(declare-fun e!161835 () Bool)

(assert (=> b!249544 (= e!161835 tp_is_empty!6481)))

(declare-fun mapNonEmpty!11010 () Bool)

(declare-fun tp!23117 () Bool)

(assert (=> mapNonEmpty!11010 (= mapRes!11010 (and tp!23117 e!161835))))

(declare-fun mapValue!11010 () ValueCell!2897)

(declare-fun mapKey!11010 () (_ BitVec 32))

(declare-fun mapRest!11010 () (Array (_ BitVec 32) ValueCell!2897))

(assert (=> mapNonEmpty!11010 (= (arr!5817 (_values!4599 thiss!1504)) (store mapRest!11010 mapKey!11010 mapValue!11010))))

(declare-fun b!249545 () Bool)

(assert (=> b!249545 (= e!161834 (not call!23422))))

(declare-fun b!249546 () Bool)

(declare-fun res!122221 () Bool)

(assert (=> b!249546 (= res!122221 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6637 lt!124889)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249546 (=> (not res!122221) (not e!161833))))

(declare-fun b!249547 () Bool)

(assert (=> b!249547 (= e!161839 (or (not (= (size!6162 (_values!4599 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10787 thiss!1504)))) (= (size!6163 (_keys!6747 thiss!1504)) (size!6162 (_values!4599 thiss!1504)))))))

(declare-fun b!249548 () Bool)

(declare-fun lt!124894 () Unit!7710)

(assert (=> b!249548 (= e!161840 lt!124894)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7710)

(assert (=> b!249548 (= lt!124894 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> b!249548 (= c!41879 ((_ is MissingZero!1116) lt!124889))))

(assert (=> b!249548 e!161842))

(declare-fun b!249549 () Bool)

(assert (=> b!249549 (= e!161836 e!161833)))

(declare-fun res!122219 () Bool)

(assert (=> b!249549 (= res!122219 call!23421)))

(assert (=> b!249549 (=> (not res!122219) (not e!161833))))

(declare-fun b!249550 () Bool)

(declare-fun Unit!7714 () Unit!7710)

(assert (=> b!249550 (= e!161841 Unit!7714)))

(assert (= (and start!23794 res!122220) b!249537))

(assert (= (and b!249537 res!122217) b!249540))

(assert (= (and b!249540 res!122218) b!249538))

(assert (= (and b!249538 c!41878) b!249542))

(assert (= (and b!249538 (not c!41878)) b!249548))

(assert (= (and b!249548 c!41879) b!249535))

(assert (= (and b!249548 (not c!41879)) b!249539))

(assert (= (and b!249535 res!122224) b!249543))

(assert (= (and b!249543 res!122223) b!249545))

(assert (= (and b!249539 c!41881) b!249549))

(assert (= (and b!249539 (not c!41881)) b!249541))

(assert (= (and b!249549 res!122219) b!249546))

(assert (= (and b!249546 res!122221) b!249536))

(assert (= (or b!249535 b!249549) bm!23418))

(assert (= (or b!249545 b!249536) bm!23419))

(assert (= (and b!249538 res!122222) b!249532))

(assert (= (and b!249532 c!41880) b!249531))

(assert (= (and b!249532 (not c!41880)) b!249550))

(assert (= (and b!249532 (not res!122225)) b!249547))

(assert (= (and b!249533 condMapEmpty!11010) mapIsEmpty!11010))

(assert (= (and b!249533 (not condMapEmpty!11010)) mapNonEmpty!11010))

(assert (= (and mapNonEmpty!11010 ((_ is ValueCellFull!2897) mapValue!11010)) b!249544))

(assert (= (and b!249533 ((_ is ValueCellFull!2897) mapDefault!11010)) b!249530))

(assert (= b!249534 b!249533))

(assert (= start!23794 b!249534))

(declare-fun m!265579 () Bool)

(assert (=> b!249532 m!265579))

(declare-fun m!265581 () Bool)

(assert (=> b!249532 m!265581))

(declare-fun m!265583 () Bool)

(assert (=> b!249532 m!265583))

(declare-fun m!265585 () Bool)

(assert (=> b!249532 m!265585))

(declare-fun m!265587 () Bool)

(assert (=> b!249532 m!265587))

(declare-fun m!265589 () Bool)

(assert (=> b!249532 m!265589))

(declare-fun m!265591 () Bool)

(assert (=> b!249532 m!265591))

(declare-fun m!265593 () Bool)

(assert (=> b!249532 m!265593))

(declare-fun m!265595 () Bool)

(assert (=> b!249532 m!265595))

(declare-fun m!265597 () Bool)

(assert (=> b!249532 m!265597))

(declare-fun m!265599 () Bool)

(assert (=> b!249542 m!265599))

(assert (=> bm!23419 m!265581))

(declare-fun m!265601 () Bool)

(assert (=> mapNonEmpty!11010 m!265601))

(declare-fun m!265603 () Bool)

(assert (=> b!249531 m!265603))

(declare-fun m!265605 () Bool)

(assert (=> b!249534 m!265605))

(declare-fun m!265607 () Bool)

(assert (=> b!249534 m!265607))

(declare-fun m!265609 () Bool)

(assert (=> start!23794 m!265609))

(declare-fun m!265611 () Bool)

(assert (=> b!249543 m!265611))

(declare-fun m!265613 () Bool)

(assert (=> b!249538 m!265613))

(declare-fun m!265615 () Bool)

(assert (=> b!249538 m!265615))

(assert (=> b!249538 m!265615))

(declare-fun m!265617 () Bool)

(assert (=> b!249538 m!265617))

(declare-fun m!265619 () Bool)

(assert (=> bm!23418 m!265619))

(declare-fun m!265621 () Bool)

(assert (=> b!249546 m!265621))

(declare-fun m!265623 () Bool)

(assert (=> b!249548 m!265623))

(declare-fun m!265625 () Bool)

(assert (=> b!249540 m!265625))

(check-sat tp_is_empty!6481 (not b!249542) (not b!249534) b_and!13607 (not mapNonEmpty!11010) (not b!249540) (not b!249532) (not b!249531) (not b_next!6619) (not bm!23419) (not b!249538) (not bm!23418) (not start!23794) (not b!249548))
(check-sat b_and!13607 (not b_next!6619))
(get-model)

(declare-fun d!60623 () Bool)

(declare-fun res!122286 () Bool)

(declare-fun e!161938 () Bool)

(assert (=> d!60623 (=> (not res!122286) (not e!161938))))

(declare-fun simpleValid!262 (LongMapFixedSize!3694) Bool)

(assert (=> d!60623 (= res!122286 (simpleValid!262 thiss!1504))))

(assert (=> d!60623 (= (valid!1450 thiss!1504) e!161938)))

(declare-fun b!249683 () Bool)

(declare-fun res!122287 () Bool)

(assert (=> b!249683 (=> (not res!122287) (not e!161938))))

(assert (=> b!249683 (= res!122287 (= (arrayCountValidKeys!0 (_keys!6747 thiss!1504) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (_size!1896 thiss!1504)))))

(declare-fun b!249684 () Bool)

(declare-fun res!122288 () Bool)

(assert (=> b!249684 (=> (not res!122288) (not e!161938))))

(assert (=> b!249684 (= res!122288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun b!249685 () Bool)

(assert (=> b!249685 (= e!161938 (arrayNoDuplicates!0 (_keys!6747 thiss!1504) #b00000000000000000000000000000000 Nil!3698))))

(assert (= (and d!60623 res!122286) b!249683))

(assert (= (and b!249683 res!122287) b!249684))

(assert (= (and b!249684 res!122288) b!249685))

(declare-fun m!265723 () Bool)

(assert (=> d!60623 m!265723))

(assert (=> b!249683 m!265591))

(declare-fun m!265725 () Bool)

(assert (=> b!249684 m!265725))

(declare-fun m!265727 () Bool)

(assert (=> b!249685 m!265727))

(assert (=> start!23794 d!60623))

(declare-fun d!60625 () Bool)

(assert (=> d!60625 (= (inRange!0 (ite c!41879 (index!6634 lt!124889) (index!6637 lt!124889)) (mask!10787 thiss!1504)) (and (bvsge (ite c!41879 (index!6634 lt!124889) (index!6637 lt!124889)) #b00000000000000000000000000000000) (bvslt (ite c!41879 (index!6634 lt!124889) (index!6637 lt!124889)) (bvadd (mask!10787 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23418 d!60625))

(declare-fun d!60627 () Bool)

(assert (=> d!60627 (= (inRange!0 index!297 (mask!10787 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10787 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249538 d!60627))

(declare-fun d!60629 () Bool)

(declare-fun e!161943 () Bool)

(assert (=> d!60629 e!161943))

(declare-fun res!122291 () Bool)

(assert (=> d!60629 (=> res!122291 e!161943)))

(declare-fun lt!124966 () Bool)

(assert (=> d!60629 (= res!122291 (not lt!124966))))

(declare-fun lt!124964 () Bool)

(assert (=> d!60629 (= lt!124966 lt!124964)))

(declare-fun lt!124965 () Unit!7710)

(declare-fun e!161944 () Unit!7710)

(assert (=> d!60629 (= lt!124965 e!161944)))

(declare-fun c!41908 () Bool)

(assert (=> d!60629 (= c!41908 lt!124964)))

(declare-fun containsKey!287 (List!3702 (_ BitVec 64)) Bool)

(assert (=> d!60629 (= lt!124964 (containsKey!287 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(assert (=> d!60629 (= (contains!1792 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932) lt!124966)))

(declare-fun b!249692 () Bool)

(declare-fun lt!124967 () Unit!7710)

(assert (=> b!249692 (= e!161944 lt!124967)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!236 (List!3702 (_ BitVec 64)) Unit!7710)

(assert (=> b!249692 (= lt!124967 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-datatypes ((Option!301 0))(
  ( (Some!300 (v!5345 V!8289)) (None!299) )
))
(declare-fun isDefined!237 (Option!301) Bool)

(declare-fun getValueByKey!295 (List!3702 (_ BitVec 64)) Option!301)

(assert (=> b!249692 (isDefined!237 (getValueByKey!295 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-fun b!249693 () Bool)

(declare-fun Unit!7717 () Unit!7710)

(assert (=> b!249693 (= e!161944 Unit!7717)))

(declare-fun b!249694 () Bool)

(assert (=> b!249694 (= e!161943 (isDefined!237 (getValueByKey!295 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932)))))

(assert (= (and d!60629 c!41908) b!249692))

(assert (= (and d!60629 (not c!41908)) b!249693))

(assert (= (and d!60629 (not res!122291)) b!249694))

(declare-fun m!265729 () Bool)

(assert (=> d!60629 m!265729))

(declare-fun m!265731 () Bool)

(assert (=> b!249692 m!265731))

(declare-fun m!265733 () Bool)

(assert (=> b!249692 m!265733))

(assert (=> b!249692 m!265733))

(declare-fun m!265735 () Bool)

(assert (=> b!249692 m!265735))

(assert (=> b!249694 m!265733))

(assert (=> b!249694 m!265733))

(assert (=> b!249694 m!265735))

(assert (=> b!249538 d!60629))

(declare-fun b!249737 () Bool)

(declare-fun e!161972 () Bool)

(declare-fun lt!125029 () ListLongMap!3705)

(declare-fun apply!239 (ListLongMap!3705 (_ BitVec 64)) V!8289)

(assert (=> b!249737 (= e!161972 (= (apply!239 lt!125029 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4457 thiss!1504)))))

(declare-fun b!249738 () Bool)

(declare-fun e!161977 () ListLongMap!3705)

(declare-fun call!23455 () ListLongMap!3705)

(assert (=> b!249738 (= e!161977 call!23455)))

(declare-fun b!249739 () Bool)

(declare-fun e!161981 () Bool)

(assert (=> b!249739 (= e!161981 e!161972)))

(declare-fun res!122315 () Bool)

(declare-fun call!23454 () Bool)

(assert (=> b!249739 (= res!122315 call!23454)))

(assert (=> b!249739 (=> (not res!122315) (not e!161972))))

(declare-fun b!249740 () Bool)

(declare-fun c!41925 () Bool)

(assert (=> b!249740 (= c!41925 (and (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!161978 () ListLongMap!3705)

(assert (=> b!249740 (= e!161978 e!161977)))

(declare-fun bm!23446 () Bool)

(assert (=> bm!23446 (= call!23454 (contains!1792 lt!125029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249741 () Bool)

(declare-fun e!161974 () Bool)

(declare-fun get!2985 (ValueCell!2897 V!8289) V!8289)

(declare-fun dynLambda!573 (Int (_ BitVec 64)) V!8289)

(assert (=> b!249741 (= e!161974 (= (apply!239 lt!125029 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)) (get!2985 (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6162 (_values!4599 thiss!1504))))))

(assert (=> b!249741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun b!249742 () Bool)

(declare-fun e!161976 () Bool)

(assert (=> b!249742 (= e!161976 e!161974)))

(declare-fun res!122310 () Bool)

(assert (=> b!249742 (=> (not res!122310) (not e!161974))))

(assert (=> b!249742 (= res!122310 (contains!1792 lt!125029 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249742 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun b!249743 () Bool)

(declare-fun e!161979 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!249743 (= e!161979 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249744 () Bool)

(declare-fun e!161975 () Bool)

(assert (=> b!249744 (= e!161975 e!161981)))

(declare-fun c!41926 () Bool)

(assert (=> b!249744 (= c!41926 (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!23452 () ListLongMap!3705)

(declare-fun c!41922 () Bool)

(declare-fun bm!23447 () Bool)

(declare-fun c!41924 () Bool)

(declare-fun call!23450 () ListLongMap!3705)

(declare-fun call!23453 () ListLongMap!3705)

(declare-fun call!23449 () ListLongMap!3705)

(declare-fun +!672 (ListLongMap!3705 tuple2!4802) ListLongMap!3705)

(assert (=> bm!23447 (= call!23453 (+!672 (ite c!41922 call!23449 (ite c!41924 call!23450 call!23452)) (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(declare-fun b!249745 () Bool)

(declare-fun e!161980 () Unit!7710)

(declare-fun lt!125023 () Unit!7710)

(assert (=> b!249745 (= e!161980 lt!125023)))

(declare-fun lt!125013 () ListLongMap!3705)

(declare-fun getCurrentListMapNoExtraKeys!555 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 32) Int) ListLongMap!3705)

(assert (=> b!249745 (= lt!125013 (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125031 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125027 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125027 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125019 () Unit!7710)

(declare-fun addStillContains!215 (ListLongMap!3705 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7710)

(assert (=> b!249745 (= lt!125019 (addStillContains!215 lt!125013 lt!125031 (zeroValue!4457 thiss!1504) lt!125027))))

(assert (=> b!249745 (contains!1792 (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))) lt!125027)))

(declare-fun lt!125028 () Unit!7710)

(assert (=> b!249745 (= lt!125028 lt!125019)))

(declare-fun lt!125017 () ListLongMap!3705)

(assert (=> b!249745 (= lt!125017 (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125033 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125033 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125020 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125020 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125024 () Unit!7710)

(declare-fun addApplyDifferent!215 (ListLongMap!3705 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7710)

(assert (=> b!249745 (= lt!125024 (addApplyDifferent!215 lt!125017 lt!125033 (minValue!4457 thiss!1504) lt!125020))))

(assert (=> b!249745 (= (apply!239 (+!672 lt!125017 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))) lt!125020) (apply!239 lt!125017 lt!125020))))

(declare-fun lt!125014 () Unit!7710)

(assert (=> b!249745 (= lt!125014 lt!125024)))

(declare-fun lt!125030 () ListLongMap!3705)

(assert (=> b!249745 (= lt!125030 (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125026 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125015 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125015 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125022 () Unit!7710)

(assert (=> b!249745 (= lt!125022 (addApplyDifferent!215 lt!125030 lt!125026 (zeroValue!4457 thiss!1504) lt!125015))))

(assert (=> b!249745 (= (apply!239 (+!672 lt!125030 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))) lt!125015) (apply!239 lt!125030 lt!125015))))

(declare-fun lt!125012 () Unit!7710)

(assert (=> b!249745 (= lt!125012 lt!125022)))

(declare-fun lt!125025 () ListLongMap!3705)

(assert (=> b!249745 (= lt!125025 (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125016 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125016 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125021 () (_ BitVec 64))

(assert (=> b!249745 (= lt!125021 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249745 (= lt!125023 (addApplyDifferent!215 lt!125025 lt!125016 (minValue!4457 thiss!1504) lt!125021))))

(assert (=> b!249745 (= (apply!239 (+!672 lt!125025 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))) lt!125021) (apply!239 lt!125025 lt!125021))))

(declare-fun b!249746 () Bool)

(declare-fun e!161983 () Bool)

(declare-fun call!23451 () Bool)

(assert (=> b!249746 (= e!161983 (not call!23451))))

(declare-fun b!249747 () Bool)

(declare-fun res!122314 () Bool)

(assert (=> b!249747 (=> (not res!122314) (not e!161975))))

(assert (=> b!249747 (= res!122314 e!161976)))

(declare-fun res!122313 () Bool)

(assert (=> b!249747 (=> res!122313 e!161976)))

(declare-fun e!161982 () Bool)

(assert (=> b!249747 (= res!122313 (not e!161982))))

(declare-fun res!122312 () Bool)

(assert (=> b!249747 (=> (not res!122312) (not e!161982))))

(assert (=> b!249747 (= res!122312 (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun b!249748 () Bool)

(assert (=> b!249748 (= e!161981 (not call!23454))))

(declare-fun b!249749 () Bool)

(assert (=> b!249749 (= e!161982 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249750 () Bool)

(declare-fun res!122311 () Bool)

(assert (=> b!249750 (=> (not res!122311) (not e!161975))))

(assert (=> b!249750 (= res!122311 e!161983)))

(declare-fun c!41921 () Bool)

(assert (=> b!249750 (= c!41921 (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!249751 () Bool)

(declare-fun e!161973 () Bool)

(assert (=> b!249751 (= e!161973 (= (apply!239 lt!125029 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4457 thiss!1504)))))

(declare-fun b!249752 () Bool)

(declare-fun e!161971 () ListLongMap!3705)

(assert (=> b!249752 (= e!161971 (+!672 call!23453 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))

(declare-fun d!60631 () Bool)

(assert (=> d!60631 e!161975))

(declare-fun res!122316 () Bool)

(assert (=> d!60631 (=> (not res!122316) (not e!161975))))

(assert (=> d!60631 (= res!122316 (or (bvsge #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))))

(declare-fun lt!125018 () ListLongMap!3705)

(assert (=> d!60631 (= lt!125029 lt!125018)))

(declare-fun lt!125032 () Unit!7710)

(assert (=> d!60631 (= lt!125032 e!161980)))

(declare-fun c!41923 () Bool)

(assert (=> d!60631 (= c!41923 e!161979)))

(declare-fun res!122318 () Bool)

(assert (=> d!60631 (=> (not res!122318) (not e!161979))))

(assert (=> d!60631 (= res!122318 (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60631 (= lt!125018 e!161971)))

(assert (=> d!60631 (= c!41922 (and (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60631 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60631 (= (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) lt!125029)))

(declare-fun bm!23448 () Bool)

(assert (=> bm!23448 (= call!23449 (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun bm!23449 () Bool)

(assert (=> bm!23449 (= call!23452 call!23450)))

(declare-fun bm!23450 () Bool)

(assert (=> bm!23450 (= call!23450 call!23449)))

(declare-fun b!249753 () Bool)

(assert (=> b!249753 (= e!161978 call!23455)))

(declare-fun b!249754 () Bool)

(assert (=> b!249754 (= e!161971 e!161978)))

(assert (=> b!249754 (= c!41924 (and (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23451 () Bool)

(assert (=> bm!23451 (= call!23455 call!23453)))

(declare-fun b!249755 () Bool)

(assert (=> b!249755 (= e!161977 call!23452)))

(declare-fun bm!23452 () Bool)

(assert (=> bm!23452 (= call!23451 (contains!1792 lt!125029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249756 () Bool)

(declare-fun Unit!7718 () Unit!7710)

(assert (=> b!249756 (= e!161980 Unit!7718)))

(declare-fun b!249757 () Bool)

(assert (=> b!249757 (= e!161983 e!161973)))

(declare-fun res!122317 () Bool)

(assert (=> b!249757 (= res!122317 call!23451)))

(assert (=> b!249757 (=> (not res!122317) (not e!161973))))

(assert (= (and d!60631 c!41922) b!249752))

(assert (= (and d!60631 (not c!41922)) b!249754))

(assert (= (and b!249754 c!41924) b!249753))

(assert (= (and b!249754 (not c!41924)) b!249740))

(assert (= (and b!249740 c!41925) b!249738))

(assert (= (and b!249740 (not c!41925)) b!249755))

(assert (= (or b!249738 b!249755) bm!23449))

(assert (= (or b!249753 bm!23449) bm!23450))

(assert (= (or b!249753 b!249738) bm!23451))

(assert (= (or b!249752 bm!23450) bm!23448))

(assert (= (or b!249752 bm!23451) bm!23447))

(assert (= (and d!60631 res!122318) b!249743))

(assert (= (and d!60631 c!41923) b!249745))

(assert (= (and d!60631 (not c!41923)) b!249756))

(assert (= (and d!60631 res!122316) b!249747))

(assert (= (and b!249747 res!122312) b!249749))

(assert (= (and b!249747 (not res!122313)) b!249742))

(assert (= (and b!249742 res!122310) b!249741))

(assert (= (and b!249747 res!122314) b!249750))

(assert (= (and b!249750 c!41921) b!249757))

(assert (= (and b!249750 (not c!41921)) b!249746))

(assert (= (and b!249757 res!122317) b!249751))

(assert (= (or b!249757 b!249746) bm!23452))

(assert (= (and b!249750 res!122311) b!249744))

(assert (= (and b!249744 c!41926) b!249739))

(assert (= (and b!249744 (not c!41926)) b!249748))

(assert (= (and b!249739 res!122315) b!249737))

(assert (= (or b!249739 b!249748) bm!23446))

(declare-fun b_lambda!8057 () Bool)

(assert (=> (not b_lambda!8057) (not b!249741)))

(declare-fun t!8726 () Bool)

(declare-fun tb!2983 () Bool)

(assert (=> (and b!249534 (= (defaultEntry!4616 thiss!1504) (defaultEntry!4616 thiss!1504)) t!8726) tb!2983))

(declare-fun result!5287 () Bool)

(assert (=> tb!2983 (= result!5287 tp_is_empty!6481)))

(assert (=> b!249741 t!8726))

(declare-fun b_and!13613 () Bool)

(assert (= b_and!13607 (and (=> t!8726 result!5287) b_and!13613)))

(declare-fun m!265737 () Bool)

(assert (=> b!249742 m!265737))

(assert (=> b!249742 m!265737))

(declare-fun m!265739 () Bool)

(assert (=> b!249742 m!265739))

(declare-fun m!265741 () Bool)

(assert (=> b!249751 m!265741))

(declare-fun m!265743 () Bool)

(assert (=> bm!23446 m!265743))

(declare-fun m!265745 () Bool)

(assert (=> b!249745 m!265745))

(declare-fun m!265747 () Bool)

(assert (=> b!249745 m!265747))

(declare-fun m!265749 () Bool)

(assert (=> b!249745 m!265749))

(declare-fun m!265751 () Bool)

(assert (=> b!249745 m!265751))

(declare-fun m!265753 () Bool)

(assert (=> b!249745 m!265753))

(declare-fun m!265755 () Bool)

(assert (=> b!249745 m!265755))

(declare-fun m!265757 () Bool)

(assert (=> b!249745 m!265757))

(declare-fun m!265759 () Bool)

(assert (=> b!249745 m!265759))

(declare-fun m!265761 () Bool)

(assert (=> b!249745 m!265761))

(declare-fun m!265763 () Bool)

(assert (=> b!249745 m!265763))

(declare-fun m!265765 () Bool)

(assert (=> b!249745 m!265765))

(assert (=> b!249745 m!265751))

(declare-fun m!265767 () Bool)

(assert (=> b!249745 m!265767))

(declare-fun m!265769 () Bool)

(assert (=> b!249745 m!265769))

(declare-fun m!265771 () Bool)

(assert (=> b!249745 m!265771))

(assert (=> b!249745 m!265763))

(declare-fun m!265773 () Bool)

(assert (=> b!249745 m!265773))

(declare-fun m!265775 () Bool)

(assert (=> b!249745 m!265775))

(assert (=> b!249745 m!265747))

(assert (=> b!249745 m!265737))

(assert (=> b!249745 m!265755))

(assert (=> d!60631 m!265579))

(declare-fun m!265777 () Bool)

(assert (=> b!249737 m!265777))

(declare-fun m!265779 () Bool)

(assert (=> b!249752 m!265779))

(assert (=> bm!23448 m!265773))

(declare-fun m!265781 () Bool)

(assert (=> b!249741 m!265781))

(assert (=> b!249741 m!265781))

(declare-fun m!265783 () Bool)

(assert (=> b!249741 m!265783))

(declare-fun m!265785 () Bool)

(assert (=> b!249741 m!265785))

(assert (=> b!249741 m!265783))

(assert (=> b!249741 m!265737))

(assert (=> b!249741 m!265737))

(declare-fun m!265787 () Bool)

(assert (=> b!249741 m!265787))

(assert (=> b!249743 m!265737))

(assert (=> b!249743 m!265737))

(declare-fun m!265789 () Bool)

(assert (=> b!249743 m!265789))

(declare-fun m!265791 () Bool)

(assert (=> bm!23452 m!265791))

(declare-fun m!265793 () Bool)

(assert (=> bm!23447 m!265793))

(assert (=> b!249749 m!265737))

(assert (=> b!249749 m!265737))

(assert (=> b!249749 m!265789))

(assert (=> b!249538 d!60631))

(declare-fun b!249772 () Bool)

(declare-fun c!41935 () Bool)

(declare-fun lt!125041 () (_ BitVec 64))

(assert (=> b!249772 (= c!41935 (= lt!125041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161991 () SeekEntryResult!1116)

(declare-fun e!161990 () SeekEntryResult!1116)

(assert (=> b!249772 (= e!161991 e!161990)))

(declare-fun b!249773 () Bool)

(declare-fun e!161992 () SeekEntryResult!1116)

(assert (=> b!249773 (= e!161992 e!161991)))

(declare-fun lt!125040 () SeekEntryResult!1116)

(assert (=> b!249773 (= lt!125041 (select (arr!5818 (_keys!6747 thiss!1504)) (index!6636 lt!125040)))))

(declare-fun c!41934 () Bool)

(assert (=> b!249773 (= c!41934 (= lt!125041 key!932))))

(declare-fun d!60633 () Bool)

(declare-fun lt!125042 () SeekEntryResult!1116)

(assert (=> d!60633 (and (or ((_ is Undefined!1116) lt!125042) (not ((_ is Found!1116) lt!125042)) (and (bvsge (index!6635 lt!125042) #b00000000000000000000000000000000) (bvslt (index!6635 lt!125042) (size!6163 (_keys!6747 thiss!1504))))) (or ((_ is Undefined!1116) lt!125042) ((_ is Found!1116) lt!125042) (not ((_ is MissingZero!1116) lt!125042)) (and (bvsge (index!6634 lt!125042) #b00000000000000000000000000000000) (bvslt (index!6634 lt!125042) (size!6163 (_keys!6747 thiss!1504))))) (or ((_ is Undefined!1116) lt!125042) ((_ is Found!1116) lt!125042) ((_ is MissingZero!1116) lt!125042) (not ((_ is MissingVacant!1116) lt!125042)) (and (bvsge (index!6637 lt!125042) #b00000000000000000000000000000000) (bvslt (index!6637 lt!125042) (size!6163 (_keys!6747 thiss!1504))))) (or ((_ is Undefined!1116) lt!125042) (ite ((_ is Found!1116) lt!125042) (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6635 lt!125042)) key!932) (ite ((_ is MissingZero!1116) lt!125042) (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6634 lt!125042)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1116) lt!125042) (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6637 lt!125042)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60633 (= lt!125042 e!161992)))

(declare-fun c!41933 () Bool)

(assert (=> d!60633 (= c!41933 (and ((_ is Intermediate!1116) lt!125040) (undefined!1928 lt!125040)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12271 (_ BitVec 32)) SeekEntryResult!1116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60633 (= lt!125040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10787 thiss!1504)) key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(assert (=> d!60633 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60633 (= (seekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)) lt!125042)))

(declare-fun b!249774 () Bool)

(assert (=> b!249774 (= e!161991 (Found!1116 (index!6636 lt!125040)))))

(declare-fun b!249775 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12271 (_ BitVec 32)) SeekEntryResult!1116)

(assert (=> b!249775 (= e!161990 (seekKeyOrZeroReturnVacant!0 (x!24639 lt!125040) (index!6636 lt!125040) (index!6636 lt!125040) key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun b!249776 () Bool)

(assert (=> b!249776 (= e!161992 Undefined!1116)))

(declare-fun b!249777 () Bool)

(assert (=> b!249777 (= e!161990 (MissingZero!1116 (index!6636 lt!125040)))))

(assert (= (and d!60633 c!41933) b!249776))

(assert (= (and d!60633 (not c!41933)) b!249773))

(assert (= (and b!249773 c!41934) b!249774))

(assert (= (and b!249773 (not c!41934)) b!249772))

(assert (= (and b!249772 c!41935) b!249777))

(assert (= (and b!249772 (not c!41935)) b!249775))

(declare-fun m!265795 () Bool)

(assert (=> b!249773 m!265795))

(declare-fun m!265797 () Bool)

(assert (=> d!60633 m!265797))

(declare-fun m!265799 () Bool)

(assert (=> d!60633 m!265799))

(declare-fun m!265801 () Bool)

(assert (=> d!60633 m!265801))

(declare-fun m!265803 () Bool)

(assert (=> d!60633 m!265803))

(assert (=> d!60633 m!265797))

(assert (=> d!60633 m!265579))

(declare-fun m!265805 () Bool)

(assert (=> d!60633 m!265805))

(declare-fun m!265807 () Bool)

(assert (=> b!249775 m!265807))

(assert (=> b!249540 d!60633))

(declare-fun b!249794 () Bool)

(declare-fun e!162002 () Bool)

(declare-fun call!23460 () Bool)

(assert (=> b!249794 (= e!162002 (not call!23460))))

(declare-fun b!249795 () Bool)

(declare-fun res!122330 () Bool)

(declare-fun e!162004 () Bool)

(assert (=> b!249795 (=> (not res!122330) (not e!162004))))

(declare-fun lt!125048 () SeekEntryResult!1116)

(assert (=> b!249795 (= res!122330 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6637 lt!125048)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249795 (and (bvsge (index!6637 lt!125048) #b00000000000000000000000000000000) (bvslt (index!6637 lt!125048) (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun b!249796 () Bool)

(declare-fun res!122329 () Bool)

(assert (=> b!249796 (=> (not res!122329) (not e!162004))))

(declare-fun call!23461 () Bool)

(assert (=> b!249796 (= res!122329 call!23461)))

(declare-fun e!162001 () Bool)

(assert (=> b!249796 (= e!162001 e!162004)))

(declare-fun b!249797 () Bool)

(assert (=> b!249797 (= e!162004 (not call!23460))))

(declare-fun b!249798 () Bool)

(assert (=> b!249798 (= e!162001 ((_ is Undefined!1116) lt!125048))))

(declare-fun d!60635 () Bool)

(declare-fun e!162003 () Bool)

(assert (=> d!60635 e!162003))

(declare-fun c!41941 () Bool)

(assert (=> d!60635 (= c!41941 ((_ is MissingZero!1116) lt!125048))))

(assert (=> d!60635 (= lt!125048 (seekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun lt!125047 () Unit!7710)

(declare-fun choose!1186 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7710)

(assert (=> d!60635 (= lt!125047 (choose!1186 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> d!60635 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60635 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) lt!125047)))

(declare-fun b!249799 () Bool)

(assert (=> b!249799 (= e!162003 e!162001)))

(declare-fun c!41940 () Bool)

(assert (=> b!249799 (= c!41940 ((_ is MissingVacant!1116) lt!125048))))

(declare-fun b!249800 () Bool)

(assert (=> b!249800 (and (bvsge (index!6634 lt!125048) #b00000000000000000000000000000000) (bvslt (index!6634 lt!125048) (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun res!122328 () Bool)

(assert (=> b!249800 (= res!122328 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6634 lt!125048)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249800 (=> (not res!122328) (not e!162002))))

(declare-fun bm!23457 () Bool)

(assert (=> bm!23457 (= call!23460 (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249801 () Bool)

(assert (=> b!249801 (= e!162003 e!162002)))

(declare-fun res!122327 () Bool)

(assert (=> b!249801 (= res!122327 call!23461)))

(assert (=> b!249801 (=> (not res!122327) (not e!162002))))

(declare-fun bm!23458 () Bool)

(assert (=> bm!23458 (= call!23461 (inRange!0 (ite c!41941 (index!6634 lt!125048) (index!6637 lt!125048)) (mask!10787 thiss!1504)))))

(assert (= (and d!60635 c!41941) b!249801))

(assert (= (and d!60635 (not c!41941)) b!249799))

(assert (= (and b!249801 res!122327) b!249800))

(assert (= (and b!249800 res!122328) b!249794))

(assert (= (and b!249799 c!41940) b!249796))

(assert (= (and b!249799 (not c!41940)) b!249798))

(assert (= (and b!249796 res!122329) b!249795))

(assert (= (and b!249795 res!122330) b!249797))

(assert (= (or b!249801 b!249796) bm!23458))

(assert (= (or b!249794 b!249797) bm!23457))

(declare-fun m!265809 () Bool)

(assert (=> b!249800 m!265809))

(assert (=> bm!23457 m!265581))

(declare-fun m!265811 () Bool)

(assert (=> bm!23458 m!265811))

(assert (=> d!60635 m!265625))

(declare-fun m!265813 () Bool)

(assert (=> d!60635 m!265813))

(assert (=> d!60635 m!265579))

(declare-fun m!265815 () Bool)

(assert (=> b!249795 m!265815))

(assert (=> b!249548 d!60635))

(declare-fun d!60637 () Bool)

(assert (=> d!60637 (= (array_inv!3835 (_keys!6747 thiss!1504)) (bvsge (size!6163 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249534 d!60637))

(declare-fun d!60639 () Bool)

(assert (=> d!60639 (= (array_inv!3836 (_values!4599 thiss!1504)) (bvsge (size!6162 (_values!4599 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249534 d!60639))

(declare-fun d!60641 () Bool)

(assert (=> d!60641 (contains!1792 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932)))

(declare-fun lt!125051 () Unit!7710)

(declare-fun choose!1187 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) (_ BitVec 32) Int) Unit!7710)

(assert (=> d!60641 (= lt!125051 (choose!1187 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(assert (=> d!60641 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60641 (= (lemmaArrayContainsKeyThenInListMap!205 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) lt!125051)))

(declare-fun bs!8938 () Bool)

(assert (= bs!8938 d!60641))

(assert (=> bs!8938 m!265615))

(assert (=> bs!8938 m!265615))

(assert (=> bs!8938 m!265617))

(declare-fun m!265817 () Bool)

(assert (=> bs!8938 m!265817))

(assert (=> bs!8938 m!265579))

(assert (=> b!249531 d!60641))

(declare-fun d!60643 () Bool)

(declare-fun res!122335 () Bool)

(declare-fun e!162009 () Bool)

(assert (=> d!60643 (=> res!122335 e!162009)))

(assert (=> d!60643 (= res!122335 (= (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60643 (= (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 #b00000000000000000000000000000000) e!162009)))

(declare-fun b!249806 () Bool)

(declare-fun e!162010 () Bool)

(assert (=> b!249806 (= e!162009 e!162010)))

(declare-fun res!122336 () Bool)

(assert (=> b!249806 (=> (not res!122336) (not e!162010))))

(assert (=> b!249806 (= res!122336 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun b!249807 () Bool)

(assert (=> b!249807 (= e!162010 (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60643 (not res!122335)) b!249806))

(assert (= (and b!249806 res!122336) b!249807))

(assert (=> d!60643 m!265737))

(declare-fun m!265819 () Bool)

(assert (=> b!249807 m!265819))

(assert (=> bm!23419 d!60643))

(declare-fun b!249818 () Bool)

(declare-fun e!162016 () Bool)

(assert (=> b!249818 (= e!162016 (bvslt (size!6163 (_keys!6747 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun e!162015 () Bool)

(declare-fun b!249819 () Bool)

(assert (=> b!249819 (= e!162015 (= (arrayCountValidKeys!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6747 thiss!1504) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!249816 () Bool)

(declare-fun res!122347 () Bool)

(assert (=> b!249816 (=> (not res!122347) (not e!162016))))

(assert (=> b!249816 (= res!122347 (not (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) index!297))))))

(declare-fun d!60645 () Bool)

(assert (=> d!60645 e!162015))

(declare-fun res!122348 () Bool)

(assert (=> d!60645 (=> (not res!122348) (not e!162015))))

(assert (=> d!60645 (= res!122348 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6163 (_keys!6747 thiss!1504)))))))

(declare-fun lt!125054 () Unit!7710)

(declare-fun choose!1 (array!12271 (_ BitVec 32) (_ BitVec 64)) Unit!7710)

(assert (=> d!60645 (= lt!125054 (choose!1 (_keys!6747 thiss!1504) index!297 key!932))))

(assert (=> d!60645 e!162016))

(declare-fun res!122346 () Bool)

(assert (=> d!60645 (=> (not res!122346) (not e!162016))))

(assert (=> d!60645 (= res!122346 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6163 (_keys!6747 thiss!1504)))))))

(assert (=> d!60645 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6747 thiss!1504) index!297 key!932) lt!125054)))

(declare-fun b!249817 () Bool)

(declare-fun res!122345 () Bool)

(assert (=> b!249817 (=> (not res!122345) (not e!162016))))

(assert (=> b!249817 (= res!122345 (validKeyInArray!0 key!932))))

(assert (= (and d!60645 res!122346) b!249816))

(assert (= (and b!249816 res!122347) b!249817))

(assert (= (and b!249817 res!122345) b!249818))

(assert (= (and d!60645 res!122348) b!249819))

(assert (=> b!249819 m!265595))

(declare-fun m!265821 () Bool)

(assert (=> b!249819 m!265821))

(assert (=> b!249819 m!265591))

(declare-fun m!265823 () Bool)

(assert (=> b!249816 m!265823))

(assert (=> b!249816 m!265823))

(declare-fun m!265825 () Bool)

(assert (=> b!249816 m!265825))

(declare-fun m!265827 () Bool)

(assert (=> d!60645 m!265827))

(declare-fun m!265829 () Bool)

(assert (=> b!249817 m!265829))

(assert (=> b!249532 d!60645))

(declare-fun bm!23461 () Bool)

(declare-fun call!23464 () Bool)

(assert (=> bm!23461 (= call!23464 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124892 (mask!10787 thiss!1504)))))

(declare-fun b!249828 () Bool)

(declare-fun e!162023 () Bool)

(assert (=> b!249828 (= e!162023 call!23464)))

(declare-fun b!249829 () Bool)

(declare-fun e!162025 () Bool)

(assert (=> b!249829 (= e!162023 e!162025)))

(declare-fun lt!125062 () (_ BitVec 64))

(assert (=> b!249829 (= lt!125062 (select (arr!5818 lt!124892) #b00000000000000000000000000000000))))

(declare-fun lt!125061 () Unit!7710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12271 (_ BitVec 64) (_ BitVec 32)) Unit!7710)

(assert (=> b!249829 (= lt!125061 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124892 lt!125062 #b00000000000000000000000000000000))))

(assert (=> b!249829 (arrayContainsKey!0 lt!124892 lt!125062 #b00000000000000000000000000000000)))

(declare-fun lt!125063 () Unit!7710)

(assert (=> b!249829 (= lt!125063 lt!125061)))

(declare-fun res!122354 () Bool)

(assert (=> b!249829 (= res!122354 (= (seekEntryOrOpen!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) lt!124892 (mask!10787 thiss!1504)) (Found!1116 #b00000000000000000000000000000000)))))

(assert (=> b!249829 (=> (not res!122354) (not e!162025))))

(declare-fun b!249830 () Bool)

(assert (=> b!249830 (= e!162025 call!23464)))

(declare-fun d!60647 () Bool)

(declare-fun res!122353 () Bool)

(declare-fun e!162024 () Bool)

(assert (=> d!60647 (=> res!122353 e!162024)))

(assert (=> d!60647 (= res!122353 (bvsge #b00000000000000000000000000000000 (size!6163 lt!124892)))))

(assert (=> d!60647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124892 (mask!10787 thiss!1504)) e!162024)))

(declare-fun b!249831 () Bool)

(assert (=> b!249831 (= e!162024 e!162023)))

(declare-fun c!41944 () Bool)

(assert (=> b!249831 (= c!41944 (validKeyInArray!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(assert (= (and d!60647 (not res!122353)) b!249831))

(assert (= (and b!249831 c!41944) b!249829))

(assert (= (and b!249831 (not c!41944)) b!249828))

(assert (= (and b!249829 res!122354) b!249830))

(assert (= (or b!249830 b!249828) bm!23461))

(declare-fun m!265831 () Bool)

(assert (=> bm!23461 m!265831))

(declare-fun m!265833 () Bool)

(assert (=> b!249829 m!265833))

(declare-fun m!265835 () Bool)

(assert (=> b!249829 m!265835))

(declare-fun m!265837 () Bool)

(assert (=> b!249829 m!265837))

(assert (=> b!249829 m!265833))

(declare-fun m!265839 () Bool)

(assert (=> b!249829 m!265839))

(assert (=> b!249831 m!265833))

(assert (=> b!249831 m!265833))

(declare-fun m!265841 () Bool)

(assert (=> b!249831 m!265841))

(assert (=> b!249532 d!60647))

(declare-fun d!60649 () Bool)

(assert (=> d!60649 (= (validMask!0 (mask!10787 thiss!1504)) (and (or (= (mask!10787 thiss!1504) #b00000000000000000000000000000111) (= (mask!10787 thiss!1504) #b00000000000000000000000000001111) (= (mask!10787 thiss!1504) #b00000000000000000000000000011111) (= (mask!10787 thiss!1504) #b00000000000000000000000000111111) (= (mask!10787 thiss!1504) #b00000000000000000000000001111111) (= (mask!10787 thiss!1504) #b00000000000000000000000011111111) (= (mask!10787 thiss!1504) #b00000000000000000000000111111111) (= (mask!10787 thiss!1504) #b00000000000000000000001111111111) (= (mask!10787 thiss!1504) #b00000000000000000000011111111111) (= (mask!10787 thiss!1504) #b00000000000000000000111111111111) (= (mask!10787 thiss!1504) #b00000000000000000001111111111111) (= (mask!10787 thiss!1504) #b00000000000000000011111111111111) (= (mask!10787 thiss!1504) #b00000000000000000111111111111111) (= (mask!10787 thiss!1504) #b00000000000000001111111111111111) (= (mask!10787 thiss!1504) #b00000000000000011111111111111111) (= (mask!10787 thiss!1504) #b00000000000000111111111111111111) (= (mask!10787 thiss!1504) #b00000000000001111111111111111111) (= (mask!10787 thiss!1504) #b00000000000011111111111111111111) (= (mask!10787 thiss!1504) #b00000000000111111111111111111111) (= (mask!10787 thiss!1504) #b00000000001111111111111111111111) (= (mask!10787 thiss!1504) #b00000000011111111111111111111111) (= (mask!10787 thiss!1504) #b00000000111111111111111111111111) (= (mask!10787 thiss!1504) #b00000001111111111111111111111111) (= (mask!10787 thiss!1504) #b00000011111111111111111111111111) (= (mask!10787 thiss!1504) #b00000111111111111111111111111111) (= (mask!10787 thiss!1504) #b00001111111111111111111111111111) (= (mask!10787 thiss!1504) #b00011111111111111111111111111111) (= (mask!10787 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10787 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!249532 d!60649))

(declare-fun b!249840 () Bool)

(declare-fun e!162030 () (_ BitVec 32))

(assert (=> b!249840 (= e!162030 #b00000000000000000000000000000000)))

(declare-fun b!249841 () Bool)

(declare-fun e!162031 () (_ BitVec 32))

(assert (=> b!249841 (= e!162030 e!162031)))

(declare-fun c!41950 () Bool)

(assert (=> b!249841 (= c!41950 (validKeyInArray!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(declare-fun b!249842 () Bool)

(declare-fun call!23467 () (_ BitVec 32))

(assert (=> b!249842 (= e!162031 (bvadd #b00000000000000000000000000000001 call!23467))))

(declare-fun b!249843 () Bool)

(assert (=> b!249843 (= e!162031 call!23467)))

(declare-fun d!60651 () Bool)

(declare-fun lt!125066 () (_ BitVec 32))

(assert (=> d!60651 (and (bvsge lt!125066 #b00000000000000000000000000000000) (bvsle lt!125066 (bvsub (size!6163 lt!124892) #b00000000000000000000000000000000)))))

(assert (=> d!60651 (= lt!125066 e!162030)))

(declare-fun c!41949 () Bool)

(assert (=> d!60651 (= c!41949 (bvsge #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60651 (and (bvsle #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6163 (_keys!6747 thiss!1504)) (size!6163 lt!124892)))))

(assert (=> d!60651 (= (arrayCountValidKeys!0 lt!124892 #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) lt!125066)))

(declare-fun bm!23464 () Bool)

(assert (=> bm!23464 (= call!23467 (arrayCountValidKeys!0 lt!124892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(assert (= (and d!60651 c!41949) b!249840))

(assert (= (and d!60651 (not c!41949)) b!249841))

(assert (= (and b!249841 c!41950) b!249842))

(assert (= (and b!249841 (not c!41950)) b!249843))

(assert (= (or b!249842 b!249843) bm!23464))

(assert (=> b!249841 m!265833))

(assert (=> b!249841 m!265833))

(assert (=> b!249841 m!265841))

(declare-fun m!265843 () Bool)

(assert (=> bm!23464 m!265843))

(assert (=> b!249532 d!60651))

(declare-fun d!60653 () Bool)

(declare-fun e!162034 () Bool)

(assert (=> d!60653 e!162034))

(declare-fun res!122357 () Bool)

(assert (=> d!60653 (=> (not res!122357) (not e!162034))))

(assert (=> d!60653 (= res!122357 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6163 (_keys!6747 thiss!1504)))))))

(declare-fun lt!125069 () Unit!7710)

(declare-fun choose!41 (array!12271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3701) Unit!7710)

(assert (=> d!60653 (= lt!125069 (choose!41 (_keys!6747 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3698))))

(assert (=> d!60653 (bvslt (size!6163 (_keys!6747 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60653 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6747 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3698) lt!125069)))

(declare-fun b!249846 () Bool)

(assert (=> b!249846 (= e!162034 (arrayNoDuplicates!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000000 Nil!3698))))

(assert (= (and d!60653 res!122357) b!249846))

(declare-fun m!265845 () Bool)

(assert (=> d!60653 m!265845))

(assert (=> b!249846 m!265595))

(declare-fun m!265847 () Bool)

(assert (=> b!249846 m!265847))

(assert (=> b!249532 d!60653))

(assert (=> b!249532 d!60643))

(declare-fun d!60655 () Bool)

(declare-fun e!162037 () Bool)

(assert (=> d!60655 e!162037))

(declare-fun res!122360 () Bool)

(assert (=> d!60655 (=> (not res!122360) (not e!162037))))

(assert (=> d!60655 (= res!122360 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6163 (_keys!6747 thiss!1504)))))))

(declare-fun lt!125072 () Unit!7710)

(declare-fun choose!102 ((_ BitVec 64) array!12271 (_ BitVec 32) (_ BitVec 32)) Unit!7710)

(assert (=> d!60655 (= lt!125072 (choose!102 key!932 (_keys!6747 thiss!1504) index!297 (mask!10787 thiss!1504)))))

(assert (=> d!60655 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60655 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) index!297 (mask!10787 thiss!1504)) lt!125072)))

(declare-fun b!249849 () Bool)

(assert (=> b!249849 (= e!162037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) (mask!10787 thiss!1504)))))

(assert (= (and d!60655 res!122360) b!249849))

(declare-fun m!265849 () Bool)

(assert (=> d!60655 m!265849))

(assert (=> d!60655 m!265579))

(assert (=> b!249849 m!265595))

(declare-fun m!265851 () Bool)

(assert (=> b!249849 m!265851))

(assert (=> b!249532 d!60655))

(declare-fun b!249850 () Bool)

(declare-fun e!162038 () (_ BitVec 32))

(assert (=> b!249850 (= e!162038 #b00000000000000000000000000000000)))

(declare-fun b!249851 () Bool)

(declare-fun e!162039 () (_ BitVec 32))

(assert (=> b!249851 (= e!162038 e!162039)))

(declare-fun c!41952 () Bool)

(assert (=> b!249851 (= c!41952 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249852 () Bool)

(declare-fun call!23468 () (_ BitVec 32))

(assert (=> b!249852 (= e!162039 (bvadd #b00000000000000000000000000000001 call!23468))))

(declare-fun b!249853 () Bool)

(assert (=> b!249853 (= e!162039 call!23468)))

(declare-fun d!60657 () Bool)

(declare-fun lt!125073 () (_ BitVec 32))

(assert (=> d!60657 (and (bvsge lt!125073 #b00000000000000000000000000000000) (bvsle lt!125073 (bvsub (size!6163 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60657 (= lt!125073 e!162038)))

(declare-fun c!41951 () Bool)

(assert (=> d!60657 (= c!41951 (bvsge #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60657 (and (bvsle #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6163 (_keys!6747 thiss!1504)) (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60657 (= (arrayCountValidKeys!0 (_keys!6747 thiss!1504) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) lt!125073)))

(declare-fun bm!23465 () Bool)

(assert (=> bm!23465 (= call!23468 (arrayCountValidKeys!0 (_keys!6747 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(assert (= (and d!60657 c!41951) b!249850))

(assert (= (and d!60657 (not c!41951)) b!249851))

(assert (= (and b!249851 c!41952) b!249852))

(assert (= (and b!249851 (not c!41952)) b!249853))

(assert (= (or b!249852 b!249853) bm!23465))

(assert (=> b!249851 m!265737))

(assert (=> b!249851 m!265737))

(assert (=> b!249851 m!265789))

(declare-fun m!265853 () Bool)

(assert (=> bm!23465 m!265853))

(assert (=> b!249532 d!60657))

(declare-fun b!249864 () Bool)

(declare-fun e!162051 () Bool)

(declare-fun contains!1793 (List!3701 (_ BitVec 64)) Bool)

(assert (=> b!249864 (= e!162051 (contains!1793 Nil!3698 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(declare-fun b!249865 () Bool)

(declare-fun e!162048 () Bool)

(declare-fun call!23471 () Bool)

(assert (=> b!249865 (= e!162048 call!23471)))

(declare-fun b!249866 () Bool)

(declare-fun e!162050 () Bool)

(declare-fun e!162049 () Bool)

(assert (=> b!249866 (= e!162050 e!162049)))

(declare-fun res!122368 () Bool)

(assert (=> b!249866 (=> (not res!122368) (not e!162049))))

(assert (=> b!249866 (= res!122368 (not e!162051))))

(declare-fun res!122369 () Bool)

(assert (=> b!249866 (=> (not res!122369) (not e!162051))))

(assert (=> b!249866 (= res!122369 (validKeyInArray!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(declare-fun b!249867 () Bool)

(assert (=> b!249867 (= e!162048 call!23471)))

(declare-fun d!60659 () Bool)

(declare-fun res!122367 () Bool)

(assert (=> d!60659 (=> res!122367 e!162050)))

(assert (=> d!60659 (= res!122367 (bvsge #b00000000000000000000000000000000 (size!6163 lt!124892)))))

(assert (=> d!60659 (= (arrayNoDuplicates!0 lt!124892 #b00000000000000000000000000000000 Nil!3698) e!162050)))

(declare-fun bm!23468 () Bool)

(declare-fun c!41955 () Bool)

(assert (=> bm!23468 (= call!23471 (arrayNoDuplicates!0 lt!124892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41955 (Cons!3697 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) Nil!3698) Nil!3698)))))

(declare-fun b!249868 () Bool)

(assert (=> b!249868 (= e!162049 e!162048)))

(assert (=> b!249868 (= c!41955 (validKeyInArray!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(assert (= (and d!60659 (not res!122367)) b!249866))

(assert (= (and b!249866 res!122369) b!249864))

(assert (= (and b!249866 res!122368) b!249868))

(assert (= (and b!249868 c!41955) b!249865))

(assert (= (and b!249868 (not c!41955)) b!249867))

(assert (= (or b!249865 b!249867) bm!23468))

(assert (=> b!249864 m!265833))

(assert (=> b!249864 m!265833))

(declare-fun m!265855 () Bool)

(assert (=> b!249864 m!265855))

(assert (=> b!249866 m!265833))

(assert (=> b!249866 m!265833))

(assert (=> b!249866 m!265841))

(assert (=> bm!23468 m!265833))

(declare-fun m!265857 () Bool)

(assert (=> bm!23468 m!265857))

(assert (=> b!249868 m!265833))

(assert (=> b!249868 m!265833))

(assert (=> b!249868 m!265841))

(assert (=> b!249532 d!60659))

(declare-fun d!60661 () Bool)

(declare-fun e!162054 () Bool)

(assert (=> d!60661 e!162054))

(declare-fun res!122375 () Bool)

(assert (=> d!60661 (=> (not res!122375) (not e!162054))))

(declare-fun lt!125078 () SeekEntryResult!1116)

(assert (=> d!60661 (= res!122375 ((_ is Found!1116) lt!125078))))

(assert (=> d!60661 (= lt!125078 (seekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun lt!125079 () Unit!7710)

(declare-fun choose!1188 (array!12271 array!12269 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7710)

(assert (=> d!60661 (= lt!125079 (choose!1188 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> d!60661 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60661 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!397 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) lt!125079)))

(declare-fun b!249873 () Bool)

(declare-fun res!122374 () Bool)

(assert (=> b!249873 (=> (not res!122374) (not e!162054))))

(assert (=> b!249873 (= res!122374 (inRange!0 (index!6635 lt!125078) (mask!10787 thiss!1504)))))

(declare-fun b!249874 () Bool)

(assert (=> b!249874 (= e!162054 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6635 lt!125078)) key!932))))

(assert (=> b!249874 (and (bvsge (index!6635 lt!125078) #b00000000000000000000000000000000) (bvslt (index!6635 lt!125078) (size!6163 (_keys!6747 thiss!1504))))))

(assert (= (and d!60661 res!122375) b!249873))

(assert (= (and b!249873 res!122374) b!249874))

(assert (=> d!60661 m!265625))

(declare-fun m!265859 () Bool)

(assert (=> d!60661 m!265859))

(assert (=> d!60661 m!265579))

(declare-fun m!265861 () Bool)

(assert (=> b!249873 m!265861))

(declare-fun m!265863 () Bool)

(assert (=> b!249874 m!265863))

(assert (=> b!249542 d!60661))

(declare-fun mapNonEmpty!11019 () Bool)

(declare-fun mapRes!11019 () Bool)

(declare-fun tp!23133 () Bool)

(declare-fun e!162060 () Bool)

(assert (=> mapNonEmpty!11019 (= mapRes!11019 (and tp!23133 e!162060))))

(declare-fun mapRest!11019 () (Array (_ BitVec 32) ValueCell!2897))

(declare-fun mapKey!11019 () (_ BitVec 32))

(declare-fun mapValue!11019 () ValueCell!2897)

(assert (=> mapNonEmpty!11019 (= mapRest!11010 (store mapRest!11019 mapKey!11019 mapValue!11019))))

(declare-fun mapIsEmpty!11019 () Bool)

(assert (=> mapIsEmpty!11019 mapRes!11019))

(declare-fun condMapEmpty!11019 () Bool)

(declare-fun mapDefault!11019 () ValueCell!2897)

(assert (=> mapNonEmpty!11010 (= condMapEmpty!11019 (= mapRest!11010 ((as const (Array (_ BitVec 32) ValueCell!2897)) mapDefault!11019)))))

(declare-fun e!162059 () Bool)

(assert (=> mapNonEmpty!11010 (= tp!23117 (and e!162059 mapRes!11019))))

(declare-fun b!249881 () Bool)

(assert (=> b!249881 (= e!162060 tp_is_empty!6481)))

(declare-fun b!249882 () Bool)

(assert (=> b!249882 (= e!162059 tp_is_empty!6481)))

(assert (= (and mapNonEmpty!11010 condMapEmpty!11019) mapIsEmpty!11019))

(assert (= (and mapNonEmpty!11010 (not condMapEmpty!11019)) mapNonEmpty!11019))

(assert (= (and mapNonEmpty!11019 ((_ is ValueCellFull!2897) mapValue!11019)) b!249881))

(assert (= (and mapNonEmpty!11010 ((_ is ValueCellFull!2897) mapDefault!11019)) b!249882))

(declare-fun m!265865 () Bool)

(assert (=> mapNonEmpty!11019 m!265865))

(declare-fun b_lambda!8059 () Bool)

(assert (= b_lambda!8057 (or (and b!249534 b_free!6619) b_lambda!8059)))

(check-sat tp_is_empty!6481 (not bm!23464) (not bm!23468) (not bm!23452) (not bm!23457) (not d!60653) (not b!249683) (not b!249737) (not b!249749) (not bm!23461) (not b!249873) (not b!249864) (not b!249742) (not b_lambda!8059) (not b!249775) (not b!249866) (not d!60645) (not d!60629) (not b!249816) (not bm!23458) (not b!249692) (not b!249846) (not b!249684) (not b!249849) (not b!249743) (not b!249851) (not b!249751) (not bm!23448) (not b!249817) (not b!249685) (not b!249841) (not b!249745) (not d!60631) (not b!249694) (not bm!23446) (not b!249829) (not d!60641) (not mapNonEmpty!11019) (not d!60633) (not d!60623) (not bm!23465) (not bm!23447) (not b!249752) b_and!13613 (not b!249831) (not d!60655) (not b!249807) (not b!249819) (not d!60635) (not d!60661) (not b_next!6619) (not b!249868) (not b!249741))
(check-sat b_and!13613 (not b_next!6619))
(get-model)

(declare-fun d!60663 () Bool)

(assert (=> d!60663 (= (arrayCountValidKeys!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6747 thiss!1504) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60663 true))

(declare-fun _$84!27 () Unit!7710)

(assert (=> d!60663 (= (choose!1 (_keys!6747 thiss!1504) index!297 key!932) _$84!27)))

(declare-fun bs!8939 () Bool)

(assert (= bs!8939 d!60663))

(assert (=> bs!8939 m!265595))

(assert (=> bs!8939 m!265821))

(assert (=> bs!8939 m!265591))

(assert (=> d!60645 d!60663))

(declare-fun d!60665 () Bool)

(assert (=> d!60665 (= (validKeyInArray!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)) (and (not (= (select (arr!5818 lt!124892) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5818 lt!124892) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249868 d!60665))

(declare-fun b!249883 () Bool)

(declare-fun e!162064 () Bool)

(assert (=> b!249883 (= e!162064 (contains!1793 Nil!3698 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249884 () Bool)

(declare-fun e!162061 () Bool)

(declare-fun call!23472 () Bool)

(assert (=> b!249884 (= e!162061 call!23472)))

(declare-fun b!249885 () Bool)

(declare-fun e!162063 () Bool)

(declare-fun e!162062 () Bool)

(assert (=> b!249885 (= e!162063 e!162062)))

(declare-fun res!122377 () Bool)

(assert (=> b!249885 (=> (not res!122377) (not e!162062))))

(assert (=> b!249885 (= res!122377 (not e!162064))))

(declare-fun res!122378 () Bool)

(assert (=> b!249885 (=> (not res!122378) (not e!162064))))

(assert (=> b!249885 (= res!122378 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249886 () Bool)

(assert (=> b!249886 (= e!162061 call!23472)))

(declare-fun d!60667 () Bool)

(declare-fun res!122376 () Bool)

(assert (=> d!60667 (=> res!122376 e!162063)))

(assert (=> d!60667 (= res!122376 (bvsge #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60667 (= (arrayNoDuplicates!0 (_keys!6747 thiss!1504) #b00000000000000000000000000000000 Nil!3698) e!162063)))

(declare-fun bm!23469 () Bool)

(declare-fun c!41956 () Bool)

(assert (=> bm!23469 (= call!23472 (arrayNoDuplicates!0 (_keys!6747 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41956 (Cons!3697 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000) Nil!3698) Nil!3698)))))

(declare-fun b!249887 () Bool)

(assert (=> b!249887 (= e!162062 e!162061)))

(assert (=> b!249887 (= c!41956 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60667 (not res!122376)) b!249885))

(assert (= (and b!249885 res!122378) b!249883))

(assert (= (and b!249885 res!122377) b!249887))

(assert (= (and b!249887 c!41956) b!249884))

(assert (= (and b!249887 (not c!41956)) b!249886))

(assert (= (or b!249884 b!249886) bm!23469))

(assert (=> b!249883 m!265737))

(assert (=> b!249883 m!265737))

(declare-fun m!265867 () Bool)

(assert (=> b!249883 m!265867))

(assert (=> b!249885 m!265737))

(assert (=> b!249885 m!265737))

(assert (=> b!249885 m!265789))

(assert (=> bm!23469 m!265737))

(declare-fun m!265869 () Bool)

(assert (=> bm!23469 m!265869))

(assert (=> b!249887 m!265737))

(assert (=> b!249887 m!265737))

(assert (=> b!249887 m!265789))

(assert (=> b!249685 d!60667))

(assert (=> d!60641 d!60629))

(assert (=> d!60641 d!60631))

(declare-fun d!60669 () Bool)

(assert (=> d!60669 (contains!1792 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932)))

(assert (=> d!60669 true))

(declare-fun _$17!74 () Unit!7710)

(assert (=> d!60669 (= (choose!1187 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) _$17!74)))

(declare-fun bs!8940 () Bool)

(assert (= bs!8940 d!60669))

(assert (=> bs!8940 m!265615))

(assert (=> bs!8940 m!265615))

(assert (=> bs!8940 m!265617))

(assert (=> d!60641 d!60669))

(assert (=> d!60641 d!60649))

(declare-fun b!249912 () Bool)

(declare-fun e!162079 () ListLongMap!3705)

(declare-fun e!162080 () ListLongMap!3705)

(assert (=> b!249912 (= e!162079 e!162080)))

(declare-fun c!41968 () Bool)

(assert (=> b!249912 (= c!41968 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249913 () Bool)

(assert (=> b!249913 (= e!162079 (ListLongMap!3706 Nil!3699))))

(declare-fun b!249914 () Bool)

(declare-fun e!162082 () Bool)

(declare-fun e!162084 () Bool)

(assert (=> b!249914 (= e!162082 e!162084)))

(assert (=> b!249914 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun res!122387 () Bool)

(declare-fun lt!125098 () ListLongMap!3705)

(assert (=> b!249914 (= res!122387 (contains!1792 lt!125098 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249914 (=> (not res!122387) (not e!162084))))

(declare-fun b!249915 () Bool)

(declare-fun lt!125096 () Unit!7710)

(declare-fun lt!125099 () Unit!7710)

(assert (=> b!249915 (= lt!125096 lt!125099)))

(declare-fun lt!125095 () (_ BitVec 64))

(declare-fun lt!125094 () V!8289)

(declare-fun lt!125100 () ListLongMap!3705)

(declare-fun lt!125097 () (_ BitVec 64))

(assert (=> b!249915 (not (contains!1792 (+!672 lt!125100 (tuple2!4803 lt!125095 lt!125094)) lt!125097))))

(declare-fun addStillNotContains!123 (ListLongMap!3705 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7710)

(assert (=> b!249915 (= lt!125099 (addStillNotContains!123 lt!125100 lt!125095 lt!125094 lt!125097))))

(assert (=> b!249915 (= lt!125097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!249915 (= lt!125094 (get!2985 (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!249915 (= lt!125095 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!23475 () ListLongMap!3705)

(assert (=> b!249915 (= lt!125100 call!23475)))

(assert (=> b!249915 (= e!162080 (+!672 call!23475 (tuple2!4803 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000) (get!2985 (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!249916 () Bool)

(declare-fun res!122388 () Bool)

(declare-fun e!162083 () Bool)

(assert (=> b!249916 (=> (not res!122388) (not e!162083))))

(assert (=> b!249916 (= res!122388 (not (contains!1792 lt!125098 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249917 () Bool)

(declare-fun e!162085 () Bool)

(assert (=> b!249917 (= e!162082 e!162085)))

(declare-fun c!41967 () Bool)

(assert (=> b!249917 (= c!41967 (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun b!249918 () Bool)

(assert (=> b!249918 (= e!162085 (= lt!125098 (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4616 thiss!1504))))))

(declare-fun b!249919 () Bool)

(declare-fun isEmpty!530 (ListLongMap!3705) Bool)

(assert (=> b!249919 (= e!162085 (isEmpty!530 lt!125098))))

(declare-fun b!249920 () Bool)

(assert (=> b!249920 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> b!249920 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6162 (_values!4599 thiss!1504))))))

(assert (=> b!249920 (= e!162084 (= (apply!239 lt!125098 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)) (get!2985 (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249921 () Bool)

(declare-fun e!162081 () Bool)

(assert (=> b!249921 (= e!162081 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249921 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!249922 () Bool)

(assert (=> b!249922 (= e!162080 call!23475)))

(declare-fun bm!23472 () Bool)

(assert (=> bm!23472 (= call!23475 (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4616 thiss!1504)))))

(declare-fun d!60671 () Bool)

(assert (=> d!60671 e!162083))

(declare-fun res!122389 () Bool)

(assert (=> d!60671 (=> (not res!122389) (not e!162083))))

(assert (=> d!60671 (= res!122389 (not (contains!1792 lt!125098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60671 (= lt!125098 e!162079)))

(declare-fun c!41966 () Bool)

(assert (=> d!60671 (= c!41966 (bvsge #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60671 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60671 (= (getCurrentListMapNoExtraKeys!555 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) lt!125098)))

(declare-fun b!249923 () Bool)

(assert (=> b!249923 (= e!162083 e!162082)))

(declare-fun c!41965 () Bool)

(assert (=> b!249923 (= c!41965 e!162081)))

(declare-fun res!122390 () Bool)

(assert (=> b!249923 (=> (not res!122390) (not e!162081))))

(assert (=> b!249923 (= res!122390 (bvslt #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (= (and d!60671 c!41966) b!249913))

(assert (= (and d!60671 (not c!41966)) b!249912))

(assert (= (and b!249912 c!41968) b!249915))

(assert (= (and b!249912 (not c!41968)) b!249922))

(assert (= (or b!249915 b!249922) bm!23472))

(assert (= (and d!60671 res!122389) b!249916))

(assert (= (and b!249916 res!122388) b!249923))

(assert (= (and b!249923 res!122390) b!249921))

(assert (= (and b!249923 c!41965) b!249914))

(assert (= (and b!249923 (not c!41965)) b!249917))

(assert (= (and b!249914 res!122387) b!249920))

(assert (= (and b!249917 c!41967) b!249918))

(assert (= (and b!249917 (not c!41967)) b!249919))

(declare-fun b_lambda!8061 () Bool)

(assert (=> (not b_lambda!8061) (not b!249915)))

(assert (=> b!249915 t!8726))

(declare-fun b_and!13615 () Bool)

(assert (= b_and!13613 (and (=> t!8726 result!5287) b_and!13615)))

(declare-fun b_lambda!8063 () Bool)

(assert (=> (not b_lambda!8063) (not b!249920)))

(assert (=> b!249920 t!8726))

(declare-fun b_and!13617 () Bool)

(assert (= b_and!13615 (and (=> t!8726 result!5287) b_and!13617)))

(assert (=> b!249920 m!265737))

(assert (=> b!249920 m!265781))

(assert (=> b!249920 m!265783))

(assert (=> b!249920 m!265785))

(assert (=> b!249920 m!265781))

(assert (=> b!249920 m!265783))

(assert (=> b!249920 m!265737))

(declare-fun m!265871 () Bool)

(assert (=> b!249920 m!265871))

(declare-fun m!265873 () Bool)

(assert (=> b!249918 m!265873))

(assert (=> b!249912 m!265737))

(assert (=> b!249912 m!265737))

(assert (=> b!249912 m!265789))

(declare-fun m!265875 () Bool)

(assert (=> b!249916 m!265875))

(assert (=> b!249914 m!265737))

(assert (=> b!249914 m!265737))

(declare-fun m!265877 () Bool)

(assert (=> b!249914 m!265877))

(declare-fun m!265879 () Bool)

(assert (=> b!249915 m!265879))

(assert (=> b!249915 m!265737))

(declare-fun m!265881 () Bool)

(assert (=> b!249915 m!265881))

(assert (=> b!249915 m!265783))

(declare-fun m!265883 () Bool)

(assert (=> b!249915 m!265883))

(assert (=> b!249915 m!265883))

(declare-fun m!265885 () Bool)

(assert (=> b!249915 m!265885))

(assert (=> b!249915 m!265781))

(assert (=> b!249915 m!265783))

(assert (=> b!249915 m!265785))

(assert (=> b!249915 m!265781))

(assert (=> bm!23472 m!265873))

(assert (=> b!249921 m!265737))

(assert (=> b!249921 m!265737))

(assert (=> b!249921 m!265789))

(declare-fun m!265887 () Bool)

(assert (=> d!60671 m!265887))

(assert (=> d!60671 m!265579))

(declare-fun m!265889 () Bool)

(assert (=> b!249919 m!265889))

(assert (=> bm!23448 d!60671))

(assert (=> d!60631 d!60649))

(declare-fun d!60673 () Bool)

(declare-fun get!2986 (Option!301) V!8289)

(assert (=> d!60673 (= (apply!239 lt!125029 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2986 (getValueByKey!295 (toList!1868 lt!125029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8941 () Bool)

(assert (= bs!8941 d!60673))

(declare-fun m!265891 () Bool)

(assert (=> bs!8941 m!265891))

(assert (=> bs!8941 m!265891))

(declare-fun m!265893 () Bool)

(assert (=> bs!8941 m!265893))

(assert (=> b!249751 d!60673))

(declare-fun d!60675 () Bool)

(declare-fun res!122391 () Bool)

(declare-fun e!162086 () Bool)

(assert (=> d!60675 (=> res!122391 e!162086)))

(assert (=> d!60675 (= res!122391 (= (select (arr!5818 (_keys!6747 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60675 (= (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!162086)))

(declare-fun b!249924 () Bool)

(declare-fun e!162087 () Bool)

(assert (=> b!249924 (= e!162086 e!162087)))

(declare-fun res!122392 () Bool)

(assert (=> b!249924 (=> (not res!122392) (not e!162087))))

(assert (=> b!249924 (= res!122392 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun b!249925 () Bool)

(assert (=> b!249925 (= e!162087 (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60675 (not res!122391)) b!249924))

(assert (= (and b!249924 res!122392) b!249925))

(declare-fun m!265895 () Bool)

(assert (=> d!60675 m!265895))

(declare-fun m!265897 () Bool)

(assert (=> b!249925 m!265897))

(assert (=> b!249807 d!60675))

(declare-fun b!249926 () Bool)

(declare-fun e!162088 () (_ BitVec 32))

(assert (=> b!249926 (= e!162088 #b00000000000000000000000000000000)))

(declare-fun b!249927 () Bool)

(declare-fun e!162089 () (_ BitVec 32))

(assert (=> b!249927 (= e!162088 e!162089)))

(declare-fun c!41970 () Bool)

(assert (=> b!249927 (= c!41970 (validKeyInArray!0 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249928 () Bool)

(declare-fun call!23476 () (_ BitVec 32))

(assert (=> b!249928 (= e!162089 (bvadd #b00000000000000000000000000000001 call!23476))))

(declare-fun b!249929 () Bool)

(assert (=> b!249929 (= e!162089 call!23476)))

(declare-fun lt!125101 () (_ BitVec 32))

(declare-fun d!60677 () Bool)

(assert (=> d!60677 (and (bvsge lt!125101 #b00000000000000000000000000000000) (bvsle lt!125101 (bvsub (size!6163 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!60677 (= lt!125101 e!162088)))

(declare-fun c!41969 () Bool)

(assert (=> d!60677 (= c!41969 (bvsge #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60677 (and (bvsle #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6163 (_keys!6747 thiss!1504)) (size!6163 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))))))))

(assert (=> d!60677 (= (arrayCountValidKeys!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))) lt!125101)))

(declare-fun bm!23473 () Bool)

(assert (=> bm!23473 (= call!23476 (arrayCountValidKeys!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(assert (= (and d!60677 c!41969) b!249926))

(assert (= (and d!60677 (not c!41969)) b!249927))

(assert (= (and b!249927 c!41970) b!249928))

(assert (= (and b!249927 (not c!41970)) b!249929))

(assert (= (or b!249928 b!249929) bm!23473))

(declare-fun m!265899 () Bool)

(assert (=> b!249927 m!265899))

(assert (=> b!249927 m!265899))

(declare-fun m!265901 () Bool)

(assert (=> b!249927 m!265901))

(declare-fun m!265903 () Bool)

(assert (=> bm!23473 m!265903))

(assert (=> b!249819 d!60677))

(assert (=> b!249819 d!60657))

(assert (=> b!249683 d!60657))

(declare-fun d!60679 () Bool)

(assert (=> d!60679 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249817 d!60679))

(declare-fun d!60681 () Bool)

(assert (=> d!60681 (= (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249749 d!60681))

(declare-fun bm!23474 () Bool)

(declare-fun call!23477 () Bool)

(assert (=> bm!23474 (= call!23477 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!124892 (mask!10787 thiss!1504)))))

(declare-fun b!249930 () Bool)

(declare-fun e!162090 () Bool)

(assert (=> b!249930 (= e!162090 call!23477)))

(declare-fun b!249931 () Bool)

(declare-fun e!162092 () Bool)

(assert (=> b!249931 (= e!162090 e!162092)))

(declare-fun lt!125103 () (_ BitVec 64))

(assert (=> b!249931 (= lt!125103 (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125102 () Unit!7710)

(assert (=> b!249931 (= lt!125102 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124892 lt!125103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!249931 (arrayContainsKey!0 lt!124892 lt!125103 #b00000000000000000000000000000000)))

(declare-fun lt!125104 () Unit!7710)

(assert (=> b!249931 (= lt!125104 lt!125102)))

(declare-fun res!122394 () Bool)

(assert (=> b!249931 (= res!122394 (= (seekEntryOrOpen!0 (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!124892 (mask!10787 thiss!1504)) (Found!1116 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!249931 (=> (not res!122394) (not e!162092))))

(declare-fun b!249932 () Bool)

(assert (=> b!249932 (= e!162092 call!23477)))

(declare-fun d!60683 () Bool)

(declare-fun res!122393 () Bool)

(declare-fun e!162091 () Bool)

(assert (=> d!60683 (=> res!122393 e!162091)))

(assert (=> d!60683 (= res!122393 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 lt!124892)))))

(assert (=> d!60683 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124892 (mask!10787 thiss!1504)) e!162091)))

(declare-fun b!249933 () Bool)

(assert (=> b!249933 (= e!162091 e!162090)))

(declare-fun c!41971 () Bool)

(assert (=> b!249933 (= c!41971 (validKeyInArray!0 (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60683 (not res!122393)) b!249933))

(assert (= (and b!249933 c!41971) b!249931))

(assert (= (and b!249933 (not c!41971)) b!249930))

(assert (= (and b!249931 res!122394) b!249932))

(assert (= (or b!249932 b!249930) bm!23474))

(declare-fun m!265905 () Bool)

(assert (=> bm!23474 m!265905))

(declare-fun m!265907 () Bool)

(assert (=> b!249931 m!265907))

(declare-fun m!265909 () Bool)

(assert (=> b!249931 m!265909))

(declare-fun m!265911 () Bool)

(assert (=> b!249931 m!265911))

(assert (=> b!249931 m!265907))

(declare-fun m!265913 () Bool)

(assert (=> b!249931 m!265913))

(assert (=> b!249933 m!265907))

(assert (=> b!249933 m!265907))

(declare-fun m!265915 () Bool)

(assert (=> b!249933 m!265915))

(assert (=> bm!23461 d!60683))

(declare-fun d!60685 () Bool)

(assert (=> d!60685 (arrayNoDuplicates!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000000 Nil!3698)))

(assert (=> d!60685 true))

(declare-fun _$65!77 () Unit!7710)

(assert (=> d!60685 (= (choose!41 (_keys!6747 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3698) _$65!77)))

(declare-fun bs!8942 () Bool)

(assert (= bs!8942 d!60685))

(assert (=> bs!8942 m!265595))

(assert (=> bs!8942 m!265847))

(assert (=> d!60653 d!60685))

(declare-fun b!249934 () Bool)

(declare-fun e!162093 () (_ BitVec 32))

(assert (=> b!249934 (= e!162093 #b00000000000000000000000000000000)))

(declare-fun b!249935 () Bool)

(declare-fun e!162094 () (_ BitVec 32))

(assert (=> b!249935 (= e!162093 e!162094)))

(declare-fun c!41973 () Bool)

(assert (=> b!249935 (= c!41973 (validKeyInArray!0 (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249936 () Bool)

(declare-fun call!23478 () (_ BitVec 32))

(assert (=> b!249936 (= e!162094 (bvadd #b00000000000000000000000000000001 call!23478))))

(declare-fun b!249937 () Bool)

(assert (=> b!249937 (= e!162094 call!23478)))

(declare-fun d!60687 () Bool)

(declare-fun lt!125105 () (_ BitVec 32))

(assert (=> d!60687 (and (bvsge lt!125105 #b00000000000000000000000000000000) (bvsle lt!125105 (bvsub (size!6163 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60687 (= lt!125105 e!162093)))

(declare-fun c!41972 () Bool)

(assert (=> d!60687 (= c!41972 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60687 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6163 (_keys!6747 thiss!1504)) (size!6163 lt!124892)))))

(assert (=> d!60687 (= (arrayCountValidKeys!0 lt!124892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))) lt!125105)))

(declare-fun bm!23475 () Bool)

(assert (=> bm!23475 (= call!23478 (arrayCountValidKeys!0 lt!124892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(assert (= (and d!60687 c!41972) b!249934))

(assert (= (and d!60687 (not c!41972)) b!249935))

(assert (= (and b!249935 c!41973) b!249936))

(assert (= (and b!249935 (not c!41973)) b!249937))

(assert (= (or b!249936 b!249937) bm!23475))

(assert (=> b!249935 m!265907))

(assert (=> b!249935 m!265907))

(assert (=> b!249935 m!265915))

(declare-fun m!265917 () Bool)

(assert (=> bm!23475 m!265917))

(assert (=> bm!23464 d!60687))

(declare-fun e!162098 () Bool)

(declare-fun b!249938 () Bool)

(assert (=> b!249938 (= e!162098 (contains!1793 Nil!3698 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249939 () Bool)

(declare-fun e!162095 () Bool)

(declare-fun call!23479 () Bool)

(assert (=> b!249939 (= e!162095 call!23479)))

(declare-fun b!249940 () Bool)

(declare-fun e!162097 () Bool)

(declare-fun e!162096 () Bool)

(assert (=> b!249940 (= e!162097 e!162096)))

(declare-fun res!122396 () Bool)

(assert (=> b!249940 (=> (not res!122396) (not e!162096))))

(assert (=> b!249940 (= res!122396 (not e!162098))))

(declare-fun res!122397 () Bool)

(assert (=> b!249940 (=> (not res!122397) (not e!162098))))

(assert (=> b!249940 (= res!122397 (validKeyInArray!0 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249941 () Bool)

(assert (=> b!249941 (= e!162095 call!23479)))

(declare-fun d!60689 () Bool)

(declare-fun res!122395 () Bool)

(assert (=> d!60689 (=> res!122395 e!162097)))

(assert (=> d!60689 (= res!122395 (bvsge #b00000000000000000000000000000000 (size!6163 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))))))))

(assert (=> d!60689 (= (arrayNoDuplicates!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) #b00000000000000000000000000000000 Nil!3698) e!162097)))

(declare-fun bm!23476 () Bool)

(declare-fun c!41974 () Bool)

(assert (=> bm!23476 (= call!23479 (arrayNoDuplicates!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41974 (Cons!3697 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000) Nil!3698) Nil!3698)))))

(declare-fun b!249942 () Bool)

(assert (=> b!249942 (= e!162096 e!162095)))

(assert (=> b!249942 (= c!41974 (validKeyInArray!0 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60689 (not res!122395)) b!249940))

(assert (= (and b!249940 res!122397) b!249938))

(assert (= (and b!249940 res!122396) b!249942))

(assert (= (and b!249942 c!41974) b!249939))

(assert (= (and b!249942 (not c!41974)) b!249941))

(assert (= (or b!249939 b!249941) bm!23476))

(assert (=> b!249938 m!265899))

(assert (=> b!249938 m!265899))

(declare-fun m!265919 () Bool)

(assert (=> b!249938 m!265919))

(assert (=> b!249940 m!265899))

(assert (=> b!249940 m!265899))

(assert (=> b!249940 m!265901))

(assert (=> bm!23476 m!265899))

(declare-fun m!265921 () Bool)

(assert (=> bm!23476 m!265921))

(assert (=> b!249942 m!265899))

(assert (=> b!249942 m!265899))

(assert (=> b!249942 m!265901))

(assert (=> b!249846 d!60689))

(declare-fun d!60691 () Bool)

(declare-fun e!162101 () Bool)

(assert (=> d!60691 e!162101))

(declare-fun res!122402 () Bool)

(assert (=> d!60691 (=> (not res!122402) (not e!162101))))

(declare-fun lt!125117 () ListLongMap!3705)

(assert (=> d!60691 (= res!122402 (contains!1792 lt!125117 (_1!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun lt!125115 () List!3702)

(assert (=> d!60691 (= lt!125117 (ListLongMap!3706 lt!125115))))

(declare-fun lt!125114 () Unit!7710)

(declare-fun lt!125116 () Unit!7710)

(assert (=> d!60691 (= lt!125114 lt!125116)))

(assert (=> d!60691 (= (getValueByKey!295 lt!125115 (_1!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))) (Some!300 (_2!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!159 (List!3702 (_ BitVec 64) V!8289) Unit!7710)

(assert (=> d!60691 (= lt!125116 (lemmaContainsTupThenGetReturnValue!159 lt!125115 (_1!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (_2!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun insertStrictlySorted!162 (List!3702 (_ BitVec 64) V!8289) List!3702)

(assert (=> d!60691 (= lt!125115 (insertStrictlySorted!162 (toList!1868 (ite c!41922 call!23449 (ite c!41924 call!23450 call!23452))) (_1!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (_2!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(assert (=> d!60691 (= (+!672 (ite c!41922 call!23449 (ite c!41924 call!23450 call!23452)) (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) lt!125117)))

(declare-fun b!249947 () Bool)

(declare-fun res!122403 () Bool)

(assert (=> b!249947 (=> (not res!122403) (not e!162101))))

(assert (=> b!249947 (= res!122403 (= (getValueByKey!295 (toList!1868 lt!125117) (_1!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))) (Some!300 (_2!2412 (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))))

(declare-fun b!249948 () Bool)

(declare-fun contains!1794 (List!3702 tuple2!4802) Bool)

(assert (=> b!249948 (= e!162101 (contains!1794 (toList!1868 lt!125117) (ite (or c!41922 c!41924) (tuple2!4803 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (= (and d!60691 res!122402) b!249947))

(assert (= (and b!249947 res!122403) b!249948))

(declare-fun m!265923 () Bool)

(assert (=> d!60691 m!265923))

(declare-fun m!265925 () Bool)

(assert (=> d!60691 m!265925))

(declare-fun m!265927 () Bool)

(assert (=> d!60691 m!265927))

(declare-fun m!265929 () Bool)

(assert (=> d!60691 m!265929))

(declare-fun m!265931 () Bool)

(assert (=> b!249947 m!265931))

(declare-fun m!265933 () Bool)

(assert (=> b!249948 m!265933))

(assert (=> bm!23447 d!60691))

(assert (=> b!249851 d!60681))

(declare-fun b!249961 () Bool)

(declare-fun e!162109 () SeekEntryResult!1116)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249961 (= e!162109 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24639 lt!125040) #b00000000000000000000000000000001) (nextIndex!0 (index!6636 lt!125040) (x!24639 lt!125040) (mask!10787 thiss!1504)) (index!6636 lt!125040) key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun b!249962 () Bool)

(declare-fun e!162108 () SeekEntryResult!1116)

(assert (=> b!249962 (= e!162108 (Found!1116 (index!6636 lt!125040)))))

(declare-fun b!249963 () Bool)

(assert (=> b!249963 (= e!162109 (MissingVacant!1116 (index!6636 lt!125040)))))

(declare-fun b!249964 () Bool)

(declare-fun e!162110 () SeekEntryResult!1116)

(assert (=> b!249964 (= e!162110 e!162108)))

(declare-fun c!41981 () Bool)

(declare-fun lt!125123 () (_ BitVec 64))

(assert (=> b!249964 (= c!41981 (= lt!125123 key!932))))

(declare-fun b!249965 () Bool)

(declare-fun c!41983 () Bool)

(assert (=> b!249965 (= c!41983 (= lt!125123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249965 (= e!162108 e!162109)))

(declare-fun b!249966 () Bool)

(assert (=> b!249966 (= e!162110 Undefined!1116)))

(declare-fun d!60693 () Bool)

(declare-fun lt!125122 () SeekEntryResult!1116)

(assert (=> d!60693 (and (or ((_ is Undefined!1116) lt!125122) (not ((_ is Found!1116) lt!125122)) (and (bvsge (index!6635 lt!125122) #b00000000000000000000000000000000) (bvslt (index!6635 lt!125122) (size!6163 (_keys!6747 thiss!1504))))) (or ((_ is Undefined!1116) lt!125122) ((_ is Found!1116) lt!125122) (not ((_ is MissingVacant!1116) lt!125122)) (not (= (index!6637 lt!125122) (index!6636 lt!125040))) (and (bvsge (index!6637 lt!125122) #b00000000000000000000000000000000) (bvslt (index!6637 lt!125122) (size!6163 (_keys!6747 thiss!1504))))) (or ((_ is Undefined!1116) lt!125122) (ite ((_ is Found!1116) lt!125122) (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6635 lt!125122)) key!932) (and ((_ is MissingVacant!1116) lt!125122) (= (index!6637 lt!125122) (index!6636 lt!125040)) (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6637 lt!125122)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!60693 (= lt!125122 e!162110)))

(declare-fun c!41982 () Bool)

(assert (=> d!60693 (= c!41982 (bvsge (x!24639 lt!125040) #b01111111111111111111111111111110))))

(assert (=> d!60693 (= lt!125123 (select (arr!5818 (_keys!6747 thiss!1504)) (index!6636 lt!125040)))))

(assert (=> d!60693 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60693 (= (seekKeyOrZeroReturnVacant!0 (x!24639 lt!125040) (index!6636 lt!125040) (index!6636 lt!125040) key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)) lt!125122)))

(assert (= (and d!60693 c!41982) b!249966))

(assert (= (and d!60693 (not c!41982)) b!249964))

(assert (= (and b!249964 c!41981) b!249962))

(assert (= (and b!249964 (not c!41981)) b!249965))

(assert (= (and b!249965 c!41983) b!249963))

(assert (= (and b!249965 (not c!41983)) b!249961))

(declare-fun m!265935 () Bool)

(assert (=> b!249961 m!265935))

(assert (=> b!249961 m!265935))

(declare-fun m!265937 () Bool)

(assert (=> b!249961 m!265937))

(declare-fun m!265939 () Bool)

(assert (=> d!60693 m!265939))

(declare-fun m!265941 () Bool)

(assert (=> d!60693 m!265941))

(assert (=> d!60693 m!265795))

(assert (=> d!60693 m!265579))

(assert (=> b!249775 d!60693))

(declare-fun d!60695 () Bool)

(assert (=> d!60695 (= (apply!239 lt!125029 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)) (get!2986 (getValueByKey!295 (toList!1868 lt!125029) (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8943 () Bool)

(assert (= bs!8943 d!60695))

(assert (=> bs!8943 m!265737))

(declare-fun m!265943 () Bool)

(assert (=> bs!8943 m!265943))

(assert (=> bs!8943 m!265943))

(declare-fun m!265945 () Bool)

(assert (=> bs!8943 m!265945))

(assert (=> b!249741 d!60695))

(declare-fun d!60697 () Bool)

(declare-fun c!41986 () Bool)

(assert (=> d!60697 (= c!41986 ((_ is ValueCellFull!2897) (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162113 () V!8289)

(assert (=> d!60697 (= (get!2985 (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!162113)))

(declare-fun b!249971 () Bool)

(declare-fun get!2987 (ValueCell!2897 V!8289) V!8289)

(assert (=> b!249971 (= e!162113 (get!2987 (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249972 () Bool)

(declare-fun get!2988 (ValueCell!2897 V!8289) V!8289)

(assert (=> b!249972 (= e!162113 (get!2988 (select (arr!5817 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60697 c!41986) b!249971))

(assert (= (and d!60697 (not c!41986)) b!249972))

(assert (=> b!249971 m!265781))

(assert (=> b!249971 m!265783))

(declare-fun m!265947 () Bool)

(assert (=> b!249971 m!265947))

(assert (=> b!249972 m!265781))

(assert (=> b!249972 m!265783))

(declare-fun m!265949 () Bool)

(assert (=> b!249972 m!265949))

(assert (=> b!249741 d!60697))

(assert (=> b!249743 d!60681))

(assert (=> d!60661 d!60633))

(declare-fun d!60699 () Bool)

(declare-fun e!162116 () Bool)

(assert (=> d!60699 e!162116))

(declare-fun res!122409 () Bool)

(assert (=> d!60699 (=> (not res!122409) (not e!162116))))

(declare-fun lt!125126 () SeekEntryResult!1116)

(assert (=> d!60699 (= res!122409 ((_ is Found!1116) lt!125126))))

(assert (=> d!60699 (= lt!125126 (seekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(assert (=> d!60699 true))

(declare-fun _$33!165 () Unit!7710)

(assert (=> d!60699 (= (choose!1188 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) _$33!165)))

(declare-fun b!249977 () Bool)

(declare-fun res!122408 () Bool)

(assert (=> b!249977 (=> (not res!122408) (not e!162116))))

(assert (=> b!249977 (= res!122408 (inRange!0 (index!6635 lt!125126) (mask!10787 thiss!1504)))))

(declare-fun b!249978 () Bool)

(assert (=> b!249978 (= e!162116 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6635 lt!125126)) key!932))))

(assert (= (and d!60699 res!122409) b!249977))

(assert (= (and b!249977 res!122408) b!249978))

(assert (=> d!60699 m!265625))

(declare-fun m!265951 () Bool)

(assert (=> b!249977 m!265951))

(declare-fun m!265953 () Bool)

(assert (=> b!249978 m!265953))

(assert (=> d!60661 d!60699))

(assert (=> d!60661 d!60649))

(declare-fun d!60701 () Bool)

(assert (=> d!60701 (= (apply!239 lt!125029 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2986 (getValueByKey!295 (toList!1868 lt!125029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8944 () Bool)

(assert (= bs!8944 d!60701))

(declare-fun m!265955 () Bool)

(assert (=> bs!8944 m!265955))

(assert (=> bs!8944 m!265955))

(declare-fun m!265957 () Bool)

(assert (=> bs!8944 m!265957))

(assert (=> b!249737 d!60701))

(assert (=> d!60635 d!60633))

(declare-fun b!249995 () Bool)

(declare-fun e!162128 () Bool)

(declare-fun e!162125 () Bool)

(assert (=> b!249995 (= e!162128 e!162125)))

(declare-fun c!41992 () Bool)

(declare-fun lt!125129 () SeekEntryResult!1116)

(assert (=> b!249995 (= c!41992 ((_ is MissingVacant!1116) lt!125129))))

(declare-fun bm!23481 () Bool)

(declare-fun call!23484 () Bool)

(assert (=> bm!23481 (= call!23484 (arrayContainsKey!0 (_keys!6747 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249996 () Bool)

(declare-fun res!122420 () Bool)

(declare-fun e!162126 () Bool)

(assert (=> b!249996 (=> (not res!122420) (not e!162126))))

(assert (=> b!249996 (= res!122420 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6637 lt!125129)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249997 () Bool)

(declare-fun e!162127 () Bool)

(assert (=> b!249997 (= e!162127 (not call!23484))))

(declare-fun b!249998 () Bool)

(assert (=> b!249998 (= e!162125 ((_ is Undefined!1116) lt!125129))))

(declare-fun b!249999 () Bool)

(declare-fun res!122418 () Bool)

(assert (=> b!249999 (=> (not res!122418) (not e!162126))))

(declare-fun call!23485 () Bool)

(assert (=> b!249999 (= res!122418 call!23485)))

(assert (=> b!249999 (= e!162125 e!162126)))

(declare-fun b!250000 () Bool)

(assert (=> b!250000 (= e!162126 (not call!23484))))

(declare-fun bm!23482 () Bool)

(declare-fun c!41991 () Bool)

(assert (=> bm!23482 (= call!23485 (inRange!0 (ite c!41991 (index!6634 lt!125129) (index!6637 lt!125129)) (mask!10787 thiss!1504)))))

(declare-fun b!250002 () Bool)

(declare-fun res!122421 () Bool)

(assert (=> b!250002 (= res!122421 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6634 lt!125129)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250002 (=> (not res!122421) (not e!162127))))

(declare-fun d!60703 () Bool)

(assert (=> d!60703 e!162128))

(assert (=> d!60703 (= c!41991 ((_ is MissingZero!1116) lt!125129))))

(assert (=> d!60703 (= lt!125129 (seekEntryOrOpen!0 key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(assert (=> d!60703 true))

(declare-fun _$34!1110 () Unit!7710)

(assert (=> d!60703 (= (choose!1186 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) _$34!1110)))

(declare-fun b!250001 () Bool)

(assert (=> b!250001 (= e!162128 e!162127)))

(declare-fun res!122419 () Bool)

(assert (=> b!250001 (= res!122419 call!23485)))

(assert (=> b!250001 (=> (not res!122419) (not e!162127))))

(assert (= (and d!60703 c!41991) b!250001))

(assert (= (and d!60703 (not c!41991)) b!249995))

(assert (= (and b!250001 res!122419) b!250002))

(assert (= (and b!250002 res!122421) b!249997))

(assert (= (and b!249995 c!41992) b!249999))

(assert (= (and b!249995 (not c!41992)) b!249998))

(assert (= (and b!249999 res!122418) b!249996))

(assert (= (and b!249996 res!122420) b!250000))

(assert (= (or b!250001 b!249999) bm!23482))

(assert (= (or b!249997 b!250000) bm!23481))

(declare-fun m!265959 () Bool)

(assert (=> b!249996 m!265959))

(assert (=> d!60703 m!265625))

(declare-fun m!265961 () Bool)

(assert (=> b!250002 m!265961))

(declare-fun m!265963 () Bool)

(assert (=> bm!23482 m!265963))

(assert (=> bm!23481 m!265581))

(assert (=> d!60635 d!60703))

(assert (=> d!60635 d!60649))

(declare-fun b!250003 () Bool)

(declare-fun e!162132 () Bool)

(assert (=> b!250003 (= e!162132 (contains!1793 (ite c!41955 (Cons!3697 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) Nil!3698) Nil!3698) (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250004 () Bool)

(declare-fun e!162129 () Bool)

(declare-fun call!23486 () Bool)

(assert (=> b!250004 (= e!162129 call!23486)))

(declare-fun b!250005 () Bool)

(declare-fun e!162131 () Bool)

(declare-fun e!162130 () Bool)

(assert (=> b!250005 (= e!162131 e!162130)))

(declare-fun res!122423 () Bool)

(assert (=> b!250005 (=> (not res!122423) (not e!162130))))

(assert (=> b!250005 (= res!122423 (not e!162132))))

(declare-fun res!122424 () Bool)

(assert (=> b!250005 (=> (not res!122424) (not e!162132))))

(assert (=> b!250005 (= res!122424 (validKeyInArray!0 (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250006 () Bool)

(assert (=> b!250006 (= e!162129 call!23486)))

(declare-fun d!60705 () Bool)

(declare-fun res!122422 () Bool)

(assert (=> d!60705 (=> res!122422 e!162131)))

(assert (=> d!60705 (= res!122422 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 lt!124892)))))

(assert (=> d!60705 (= (arrayNoDuplicates!0 lt!124892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41955 (Cons!3697 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) Nil!3698) Nil!3698)) e!162131)))

(declare-fun c!41993 () Bool)

(declare-fun bm!23483 () Bool)

(assert (=> bm!23483 (= call!23486 (arrayNoDuplicates!0 lt!124892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!41993 (Cons!3697 (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41955 (Cons!3697 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) Nil!3698) Nil!3698)) (ite c!41955 (Cons!3697 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) Nil!3698) Nil!3698))))))

(declare-fun b!250007 () Bool)

(assert (=> b!250007 (= e!162130 e!162129)))

(assert (=> b!250007 (= c!41993 (validKeyInArray!0 (select (arr!5818 lt!124892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60705 (not res!122422)) b!250005))

(assert (= (and b!250005 res!122424) b!250003))

(assert (= (and b!250005 res!122423) b!250007))

(assert (= (and b!250007 c!41993) b!250004))

(assert (= (and b!250007 (not c!41993)) b!250006))

(assert (= (or b!250004 b!250006) bm!23483))

(assert (=> b!250003 m!265907))

(assert (=> b!250003 m!265907))

(declare-fun m!265965 () Bool)

(assert (=> b!250003 m!265965))

(assert (=> b!250005 m!265907))

(assert (=> b!250005 m!265907))

(assert (=> b!250005 m!265915))

(assert (=> bm!23483 m!265907))

(declare-fun m!265967 () Bool)

(assert (=> bm!23483 m!265967))

(assert (=> b!250007 m!265907))

(assert (=> b!250007 m!265907))

(assert (=> b!250007 m!265915))

(assert (=> bm!23468 d!60705))

(declare-fun bm!23484 () Bool)

(declare-fun call!23487 () Bool)

(assert (=> bm!23484 (= call!23487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun b!250008 () Bool)

(declare-fun e!162133 () Bool)

(assert (=> b!250008 (= e!162133 call!23487)))

(declare-fun b!250009 () Bool)

(declare-fun e!162135 () Bool)

(assert (=> b!250009 (= e!162133 e!162135)))

(declare-fun lt!125131 () (_ BitVec 64))

(assert (=> b!250009 (= lt!125131 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125130 () Unit!7710)

(assert (=> b!250009 (= lt!125130 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6747 thiss!1504) lt!125131 #b00000000000000000000000000000000))))

(assert (=> b!250009 (arrayContainsKey!0 (_keys!6747 thiss!1504) lt!125131 #b00000000000000000000000000000000)))

(declare-fun lt!125132 () Unit!7710)

(assert (=> b!250009 (= lt!125132 lt!125130)))

(declare-fun res!122426 () Bool)

(assert (=> b!250009 (= res!122426 (= (seekEntryOrOpen!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000) (_keys!6747 thiss!1504) (mask!10787 thiss!1504)) (Found!1116 #b00000000000000000000000000000000)))))

(assert (=> b!250009 (=> (not res!122426) (not e!162135))))

(declare-fun b!250010 () Bool)

(assert (=> b!250010 (= e!162135 call!23487)))

(declare-fun d!60707 () Bool)

(declare-fun res!122425 () Bool)

(declare-fun e!162134 () Bool)

(assert (=> d!60707 (=> res!122425 e!162134)))

(assert (=> d!60707 (= res!122425 (bvsge #b00000000000000000000000000000000 (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)) e!162134)))

(declare-fun b!250011 () Bool)

(assert (=> b!250011 (= e!162134 e!162133)))

(declare-fun c!41994 () Bool)

(assert (=> b!250011 (= c!41994 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60707 (not res!122425)) b!250011))

(assert (= (and b!250011 c!41994) b!250009))

(assert (= (and b!250011 (not c!41994)) b!250008))

(assert (= (and b!250009 res!122426) b!250010))

(assert (= (or b!250010 b!250008) bm!23484))

(declare-fun m!265969 () Bool)

(assert (=> bm!23484 m!265969))

(assert (=> b!250009 m!265737))

(declare-fun m!265971 () Bool)

(assert (=> b!250009 m!265971))

(declare-fun m!265973 () Bool)

(assert (=> b!250009 m!265973))

(assert (=> b!250009 m!265737))

(declare-fun m!265975 () Bool)

(assert (=> b!250009 m!265975))

(assert (=> b!250011 m!265737))

(assert (=> b!250011 m!265737))

(assert (=> b!250011 m!265789))

(assert (=> b!249684 d!60707))

(declare-fun d!60709 () Bool)

(assert (=> d!60709 (= (inRange!0 (ite c!41941 (index!6634 lt!125048) (index!6637 lt!125048)) (mask!10787 thiss!1504)) (and (bvsge (ite c!41941 (index!6634 lt!125048) (index!6637 lt!125048)) #b00000000000000000000000000000000) (bvslt (ite c!41941 (index!6634 lt!125048) (index!6637 lt!125048)) (bvadd (mask!10787 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23458 d!60709))

(assert (=> b!249866 d!60665))

(declare-fun b!250021 () Bool)

(declare-fun res!122435 () Bool)

(declare-fun e!162138 () Bool)

(assert (=> b!250021 (=> (not res!122435) (not e!162138))))

(declare-fun size!6168 (LongMapFixedSize!3694) (_ BitVec 32))

(assert (=> b!250021 (= res!122435 (bvsge (size!6168 thiss!1504) (_size!1896 thiss!1504)))))

(declare-fun b!250023 () Bool)

(assert (=> b!250023 (= e!162138 (and (bvsge (extraKeys!4353 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4353 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1896 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!250022 () Bool)

(declare-fun res!122438 () Bool)

(assert (=> b!250022 (=> (not res!122438) (not e!162138))))

(assert (=> b!250022 (= res!122438 (= (size!6168 thiss!1504) (bvadd (_size!1896 thiss!1504) (bvsdiv (bvadd (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!250020 () Bool)

(declare-fun res!122437 () Bool)

(assert (=> b!250020 (=> (not res!122437) (not e!162138))))

(assert (=> b!250020 (= res!122437 (and (= (size!6162 (_values!4599 thiss!1504)) (bvadd (mask!10787 thiss!1504) #b00000000000000000000000000000001)) (= (size!6163 (_keys!6747 thiss!1504)) (size!6162 (_values!4599 thiss!1504))) (bvsge (_size!1896 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1896 thiss!1504) (bvadd (mask!10787 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!60711 () Bool)

(declare-fun res!122436 () Bool)

(assert (=> d!60711 (=> (not res!122436) (not e!162138))))

(assert (=> d!60711 (= res!122436 (validMask!0 (mask!10787 thiss!1504)))))

(assert (=> d!60711 (= (simpleValid!262 thiss!1504) e!162138)))

(assert (= (and d!60711 res!122436) b!250020))

(assert (= (and b!250020 res!122437) b!250021))

(assert (= (and b!250021 res!122435) b!250022))

(assert (= (and b!250022 res!122438) b!250023))

(declare-fun m!265977 () Bool)

(assert (=> b!250021 m!265977))

(assert (=> b!250022 m!265977))

(assert (=> d!60711 m!265579))

(assert (=> d!60623 d!60711))

(declare-fun d!60713 () Bool)

(assert (=> d!60713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) (mask!10787 thiss!1504))))

(assert (=> d!60713 true))

(declare-fun _$56!24 () Unit!7710)

(assert (=> d!60713 (= (choose!102 key!932 (_keys!6747 thiss!1504) index!297 (mask!10787 thiss!1504)) _$56!24)))

(declare-fun bs!8945 () Bool)

(assert (= bs!8945 d!60713))

(assert (=> bs!8945 m!265595))

(assert (=> bs!8945 m!265851))

(assert (=> d!60655 d!60713))

(assert (=> d!60655 d!60649))

(assert (=> bm!23457 d!60643))

(declare-fun d!60715 () Bool)

(declare-fun e!162150 () Bool)

(assert (=> d!60715 e!162150))

(declare-fun c!42002 () Bool)

(declare-fun lt!125138 () SeekEntryResult!1116)

(assert (=> d!60715 (= c!42002 (and ((_ is Intermediate!1116) lt!125138) (undefined!1928 lt!125138)))))

(declare-fun e!162153 () SeekEntryResult!1116)

(assert (=> d!60715 (= lt!125138 e!162153)))

(declare-fun c!42001 () Bool)

(assert (=> d!60715 (= c!42001 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!125137 () (_ BitVec 64))

(assert (=> d!60715 (= lt!125137 (select (arr!5818 (_keys!6747 thiss!1504)) (toIndex!0 key!932 (mask!10787 thiss!1504))))))

(assert (=> d!60715 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10787 thiss!1504)) key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)) lt!125138)))

(declare-fun b!250042 () Bool)

(assert (=> b!250042 (and (bvsge (index!6636 lt!125138) #b00000000000000000000000000000000) (bvslt (index!6636 lt!125138) (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun res!122447 () Bool)

(assert (=> b!250042 (= res!122447 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6636 lt!125138)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162151 () Bool)

(assert (=> b!250042 (=> res!122447 e!162151)))

(declare-fun b!250043 () Bool)

(declare-fun e!162152 () SeekEntryResult!1116)

(assert (=> b!250043 (= e!162153 e!162152)))

(declare-fun c!42003 () Bool)

(assert (=> b!250043 (= c!42003 (or (= lt!125137 key!932) (= (bvadd lt!125137 lt!125137) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!250044 () Bool)

(assert (=> b!250044 (= e!162153 (Intermediate!1116 true (toIndex!0 key!932 (mask!10787 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!250045 () Bool)

(declare-fun e!162149 () Bool)

(assert (=> b!250045 (= e!162150 e!162149)))

(declare-fun res!122446 () Bool)

(assert (=> b!250045 (= res!122446 (and ((_ is Intermediate!1116) lt!125138) (not (undefined!1928 lt!125138)) (bvslt (x!24639 lt!125138) #b01111111111111111111111111111110) (bvsge (x!24639 lt!125138) #b00000000000000000000000000000000) (bvsge (x!24639 lt!125138) #b00000000000000000000000000000000)))))

(assert (=> b!250045 (=> (not res!122446) (not e!162149))))

(declare-fun b!250046 () Bool)

(assert (=> b!250046 (= e!162152 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10787 thiss!1504)) #b00000000000000000000000000000000 (mask!10787 thiss!1504)) key!932 (_keys!6747 thiss!1504) (mask!10787 thiss!1504)))))

(declare-fun b!250047 () Bool)

(assert (=> b!250047 (= e!162150 (bvsge (x!24639 lt!125138) #b01111111111111111111111111111110))))

(declare-fun b!250048 () Bool)

(assert (=> b!250048 (= e!162152 (Intermediate!1116 false (toIndex!0 key!932 (mask!10787 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!250049 () Bool)

(assert (=> b!250049 (and (bvsge (index!6636 lt!125138) #b00000000000000000000000000000000) (bvslt (index!6636 lt!125138) (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> b!250049 (= e!162151 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6636 lt!125138)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250050 () Bool)

(assert (=> b!250050 (and (bvsge (index!6636 lt!125138) #b00000000000000000000000000000000) (bvslt (index!6636 lt!125138) (size!6163 (_keys!6747 thiss!1504))))))

(declare-fun res!122445 () Bool)

(assert (=> b!250050 (= res!122445 (= (select (arr!5818 (_keys!6747 thiss!1504)) (index!6636 lt!125138)) key!932))))

(assert (=> b!250050 (=> res!122445 e!162151)))

(assert (=> b!250050 (= e!162149 e!162151)))

(assert (= (and d!60715 c!42001) b!250044))

(assert (= (and d!60715 (not c!42001)) b!250043))

(assert (= (and b!250043 c!42003) b!250048))

(assert (= (and b!250043 (not c!42003)) b!250046))

(assert (= (and d!60715 c!42002) b!250047))

(assert (= (and d!60715 (not c!42002)) b!250045))

(assert (= (and b!250045 res!122446) b!250050))

(assert (= (and b!250050 (not res!122445)) b!250042))

(assert (= (and b!250042 (not res!122447)) b!250049))

(assert (=> d!60715 m!265797))

(declare-fun m!265979 () Bool)

(assert (=> d!60715 m!265979))

(assert (=> d!60715 m!265579))

(assert (=> b!250046 m!265797))

(declare-fun m!265981 () Bool)

(assert (=> b!250046 m!265981))

(assert (=> b!250046 m!265981))

(declare-fun m!265983 () Bool)

(assert (=> b!250046 m!265983))

(declare-fun m!265985 () Bool)

(assert (=> b!250049 m!265985))

(assert (=> b!250050 m!265985))

(assert (=> b!250042 m!265985))

(assert (=> d!60633 d!60715))

(declare-fun d!60717 () Bool)

(declare-fun lt!125144 () (_ BitVec 32))

(declare-fun lt!125143 () (_ BitVec 32))

(assert (=> d!60717 (= lt!125144 (bvmul (bvxor lt!125143 (bvlshr lt!125143 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60717 (= lt!125143 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60717 (and (bvsge (mask!10787 thiss!1504) #b00000000000000000000000000000000) (let ((res!122448 (let ((h!4358 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24659 (bvmul (bvxor h!4358 (bvlshr h!4358 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24659 (bvlshr x!24659 #b00000000000000000000000000001101)) (mask!10787 thiss!1504)))))) (and (bvslt res!122448 (bvadd (mask!10787 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!122448 #b00000000000000000000000000000000))))))

(assert (=> d!60717 (= (toIndex!0 key!932 (mask!10787 thiss!1504)) (bvand (bvxor lt!125144 (bvlshr lt!125144 #b00000000000000000000000000001101)) (mask!10787 thiss!1504)))))

(assert (=> d!60633 d!60717))

(assert (=> d!60633 d!60649))

(declare-fun d!60719 () Bool)

(declare-fun e!162154 () Bool)

(assert (=> d!60719 e!162154))

(declare-fun res!122449 () Bool)

(assert (=> d!60719 (=> (not res!122449) (not e!162154))))

(declare-fun lt!125148 () ListLongMap!3705)

(assert (=> d!60719 (= res!122449 (contains!1792 lt!125148 (_1!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(declare-fun lt!125146 () List!3702)

(assert (=> d!60719 (= lt!125148 (ListLongMap!3706 lt!125146))))

(declare-fun lt!125145 () Unit!7710)

(declare-fun lt!125147 () Unit!7710)

(assert (=> d!60719 (= lt!125145 lt!125147)))

(assert (=> d!60719 (= (getValueByKey!295 lt!125146 (_1!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (=> d!60719 (= lt!125147 (lemmaContainsTupThenGetReturnValue!159 lt!125146 (_1!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (=> d!60719 (= lt!125146 (insertStrictlySorted!162 (toList!1868 call!23453) (_1!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (=> d!60719 (= (+!672 call!23453 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))) lt!125148)))

(declare-fun b!250051 () Bool)

(declare-fun res!122450 () Bool)

(assert (=> b!250051 (=> (not res!122450) (not e!162154))))

(assert (=> b!250051 (= res!122450 (= (getValueByKey!295 (toList!1868 lt!125148) (_1!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun b!250052 () Bool)

(assert (=> b!250052 (= e!162154 (contains!1794 (toList!1868 lt!125148) (tuple2!4803 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))

(assert (= (and d!60719 res!122449) b!250051))

(assert (= (and b!250051 res!122450) b!250052))

(declare-fun m!265987 () Bool)

(assert (=> d!60719 m!265987))

(declare-fun m!265989 () Bool)

(assert (=> d!60719 m!265989))

(declare-fun m!265991 () Bool)

(assert (=> d!60719 m!265991))

(declare-fun m!265993 () Bool)

(assert (=> d!60719 m!265993))

(declare-fun m!265995 () Bool)

(assert (=> b!250051 m!265995))

(declare-fun m!265997 () Bool)

(assert (=> b!250052 m!265997))

(assert (=> b!249752 d!60719))

(declare-fun d!60721 () Bool)

(assert (=> d!60721 (= (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) index!297)) (and (not (= (select (arr!5818 (_keys!6747 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5818 (_keys!6747 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249816 d!60721))

(declare-fun d!60723 () Bool)

(declare-fun res!122455 () Bool)

(declare-fun e!162159 () Bool)

(assert (=> d!60723 (=> res!122455 e!162159)))

(assert (=> d!60723 (= res!122455 (and ((_ is Cons!3698) (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (= (_1!2412 (h!4357 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)))))

(assert (=> d!60723 (= (containsKey!287 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932) e!162159)))

(declare-fun b!250057 () Bool)

(declare-fun e!162160 () Bool)

(assert (=> b!250057 (= e!162159 e!162160)))

(declare-fun res!122456 () Bool)

(assert (=> b!250057 (=> (not res!122456) (not e!162160))))

(assert (=> b!250057 (= res!122456 (and (or (not ((_ is Cons!3698) (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) (bvsle (_1!2412 (h!4357 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)) ((_ is Cons!3698) (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (bvslt (_1!2412 (h!4357 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)))))

(declare-fun b!250058 () Bool)

(assert (=> b!250058 (= e!162160 (containsKey!287 (t!8724 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) key!932))))

(assert (= (and d!60723 (not res!122455)) b!250057))

(assert (= (and b!250057 res!122456) b!250058))

(declare-fun m!265999 () Bool)

(assert (=> b!250058 m!265999))

(assert (=> d!60629 d!60723))

(declare-fun d!60725 () Bool)

(assert (=> d!60725 (arrayContainsKey!0 lt!124892 lt!125062 #b00000000000000000000000000000000)))

(declare-fun lt!125151 () Unit!7710)

(declare-fun choose!13 (array!12271 (_ BitVec 64) (_ BitVec 32)) Unit!7710)

(assert (=> d!60725 (= lt!125151 (choose!13 lt!124892 lt!125062 #b00000000000000000000000000000000))))

(assert (=> d!60725 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!60725 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124892 lt!125062 #b00000000000000000000000000000000) lt!125151)))

(declare-fun bs!8946 () Bool)

(assert (= bs!8946 d!60725))

(assert (=> bs!8946 m!265837))

(declare-fun m!266001 () Bool)

(assert (=> bs!8946 m!266001))

(assert (=> b!249829 d!60725))

(declare-fun d!60727 () Bool)

(declare-fun res!122457 () Bool)

(declare-fun e!162161 () Bool)

(assert (=> d!60727 (=> res!122457 e!162161)))

(assert (=> d!60727 (= res!122457 (= (select (arr!5818 lt!124892) #b00000000000000000000000000000000) lt!125062))))

(assert (=> d!60727 (= (arrayContainsKey!0 lt!124892 lt!125062 #b00000000000000000000000000000000) e!162161)))

(declare-fun b!250059 () Bool)

(declare-fun e!162162 () Bool)

(assert (=> b!250059 (= e!162161 e!162162)))

(declare-fun res!122458 () Bool)

(assert (=> b!250059 (=> (not res!122458) (not e!162162))))

(assert (=> b!250059 (= res!122458 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 lt!124892)))))

(declare-fun b!250060 () Bool)

(assert (=> b!250060 (= e!162162 (arrayContainsKey!0 lt!124892 lt!125062 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60727 (not res!122457)) b!250059))

(assert (= (and b!250059 res!122458) b!250060))

(assert (=> d!60727 m!265833))

(declare-fun m!266003 () Bool)

(assert (=> b!250060 m!266003))

(assert (=> b!249829 d!60727))

(declare-fun b!250061 () Bool)

(declare-fun c!42006 () Bool)

(declare-fun lt!125153 () (_ BitVec 64))

(assert (=> b!250061 (= c!42006 (= lt!125153 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162164 () SeekEntryResult!1116)

(declare-fun e!162163 () SeekEntryResult!1116)

(assert (=> b!250061 (= e!162164 e!162163)))

(declare-fun b!250062 () Bool)

(declare-fun e!162165 () SeekEntryResult!1116)

(assert (=> b!250062 (= e!162165 e!162164)))

(declare-fun lt!125152 () SeekEntryResult!1116)

(assert (=> b!250062 (= lt!125153 (select (arr!5818 lt!124892) (index!6636 lt!125152)))))

(declare-fun c!42005 () Bool)

(assert (=> b!250062 (= c!42005 (= lt!125153 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(declare-fun d!60729 () Bool)

(declare-fun lt!125154 () SeekEntryResult!1116)

(assert (=> d!60729 (and (or ((_ is Undefined!1116) lt!125154) (not ((_ is Found!1116) lt!125154)) (and (bvsge (index!6635 lt!125154) #b00000000000000000000000000000000) (bvslt (index!6635 lt!125154) (size!6163 lt!124892)))) (or ((_ is Undefined!1116) lt!125154) ((_ is Found!1116) lt!125154) (not ((_ is MissingZero!1116) lt!125154)) (and (bvsge (index!6634 lt!125154) #b00000000000000000000000000000000) (bvslt (index!6634 lt!125154) (size!6163 lt!124892)))) (or ((_ is Undefined!1116) lt!125154) ((_ is Found!1116) lt!125154) ((_ is MissingZero!1116) lt!125154) (not ((_ is MissingVacant!1116) lt!125154)) (and (bvsge (index!6637 lt!125154) #b00000000000000000000000000000000) (bvslt (index!6637 lt!125154) (size!6163 lt!124892)))) (or ((_ is Undefined!1116) lt!125154) (ite ((_ is Found!1116) lt!125154) (= (select (arr!5818 lt!124892) (index!6635 lt!125154)) (select (arr!5818 lt!124892) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1116) lt!125154) (= (select (arr!5818 lt!124892) (index!6634 lt!125154)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1116) lt!125154) (= (select (arr!5818 lt!124892) (index!6637 lt!125154)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60729 (= lt!125154 e!162165)))

(declare-fun c!42004 () Bool)

(assert (=> d!60729 (= c!42004 (and ((_ is Intermediate!1116) lt!125152) (undefined!1928 lt!125152)))))

(assert (=> d!60729 (= lt!125152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) (mask!10787 thiss!1504)) (select (arr!5818 lt!124892) #b00000000000000000000000000000000) lt!124892 (mask!10787 thiss!1504)))))

(assert (=> d!60729 (validMask!0 (mask!10787 thiss!1504))))

(assert (=> d!60729 (= (seekEntryOrOpen!0 (select (arr!5818 lt!124892) #b00000000000000000000000000000000) lt!124892 (mask!10787 thiss!1504)) lt!125154)))

(declare-fun b!250063 () Bool)

(assert (=> b!250063 (= e!162164 (Found!1116 (index!6636 lt!125152)))))

(declare-fun b!250064 () Bool)

(assert (=> b!250064 (= e!162163 (seekKeyOrZeroReturnVacant!0 (x!24639 lt!125152) (index!6636 lt!125152) (index!6636 lt!125152) (select (arr!5818 lt!124892) #b00000000000000000000000000000000) lt!124892 (mask!10787 thiss!1504)))))

(declare-fun b!250065 () Bool)

(assert (=> b!250065 (= e!162165 Undefined!1116)))

(declare-fun b!250066 () Bool)

(assert (=> b!250066 (= e!162163 (MissingZero!1116 (index!6636 lt!125152)))))

(assert (= (and d!60729 c!42004) b!250065))

(assert (= (and d!60729 (not c!42004)) b!250062))

(assert (= (and b!250062 c!42005) b!250063))

(assert (= (and b!250062 (not c!42005)) b!250061))

(assert (= (and b!250061 c!42006) b!250066))

(assert (= (and b!250061 (not c!42006)) b!250064))

(declare-fun m!266005 () Bool)

(assert (=> b!250062 m!266005))

(declare-fun m!266007 () Bool)

(assert (=> d!60729 m!266007))

(assert (=> d!60729 m!265833))

(declare-fun m!266009 () Bool)

(assert (=> d!60729 m!266009))

(declare-fun m!266011 () Bool)

(assert (=> d!60729 m!266011))

(declare-fun m!266013 () Bool)

(assert (=> d!60729 m!266013))

(assert (=> d!60729 m!265833))

(assert (=> d!60729 m!266007))

(assert (=> d!60729 m!265579))

(declare-fun m!266015 () Bool)

(assert (=> d!60729 m!266015))

(assert (=> b!250064 m!265833))

(declare-fun m!266017 () Bool)

(assert (=> b!250064 m!266017))

(assert (=> b!249829 d!60729))

(assert (=> b!249831 d!60665))

(declare-fun d!60731 () Bool)

(declare-fun lt!125157 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!165 (List!3701) (InoxSet (_ BitVec 64)))

(assert (=> d!60731 (= lt!125157 (select (content!165 Nil!3698) (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(declare-fun e!162170 () Bool)

(assert (=> d!60731 (= lt!125157 e!162170)))

(declare-fun res!122463 () Bool)

(assert (=> d!60731 (=> (not res!122463) (not e!162170))))

(assert (=> d!60731 (= res!122463 ((_ is Cons!3697) Nil!3698))))

(assert (=> d!60731 (= (contains!1793 Nil!3698 (select (arr!5818 lt!124892) #b00000000000000000000000000000000)) lt!125157)))

(declare-fun b!250071 () Bool)

(declare-fun e!162171 () Bool)

(assert (=> b!250071 (= e!162170 e!162171)))

(declare-fun res!122464 () Bool)

(assert (=> b!250071 (=> res!122464 e!162171)))

(assert (=> b!250071 (= res!122464 (= (h!4356 Nil!3698) (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(declare-fun b!250072 () Bool)

(assert (=> b!250072 (= e!162171 (contains!1793 (t!8723 Nil!3698) (select (arr!5818 lt!124892) #b00000000000000000000000000000000)))))

(assert (= (and d!60731 res!122463) b!250071))

(assert (= (and b!250071 (not res!122464)) b!250072))

(declare-fun m!266019 () Bool)

(assert (=> d!60731 m!266019))

(assert (=> d!60731 m!265833))

(declare-fun m!266021 () Bool)

(assert (=> d!60731 m!266021))

(assert (=> b!250072 m!265833))

(declare-fun m!266023 () Bool)

(assert (=> b!250072 m!266023))

(assert (=> b!249864 d!60731))

(declare-fun d!60733 () Bool)

(assert (=> d!60733 (contains!1792 (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))) lt!125027)))

(declare-fun lt!125160 () Unit!7710)

(declare-fun choose!1189 (ListLongMap!3705 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7710)

(assert (=> d!60733 (= lt!125160 (choose!1189 lt!125013 lt!125031 (zeroValue!4457 thiss!1504) lt!125027))))

(assert (=> d!60733 (contains!1792 lt!125013 lt!125027)))

(assert (=> d!60733 (= (addStillContains!215 lt!125013 lt!125031 (zeroValue!4457 thiss!1504) lt!125027) lt!125160)))

(declare-fun bs!8947 () Bool)

(assert (= bs!8947 d!60733))

(assert (=> bs!8947 m!265763))

(assert (=> bs!8947 m!265763))

(assert (=> bs!8947 m!265765))

(declare-fun m!266025 () Bool)

(assert (=> bs!8947 m!266025))

(declare-fun m!266027 () Bool)

(assert (=> bs!8947 m!266027))

(assert (=> b!249745 d!60733))

(declare-fun d!60735 () Bool)

(declare-fun e!162172 () Bool)

(assert (=> d!60735 e!162172))

(declare-fun res!122465 () Bool)

(assert (=> d!60735 (=> (not res!122465) (not e!162172))))

(declare-fun lt!125164 () ListLongMap!3705)

(assert (=> d!60735 (= res!122465 (contains!1792 lt!125164 (_1!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))))))

(declare-fun lt!125162 () List!3702)

(assert (=> d!60735 (= lt!125164 (ListLongMap!3706 lt!125162))))

(declare-fun lt!125161 () Unit!7710)

(declare-fun lt!125163 () Unit!7710)

(assert (=> d!60735 (= lt!125161 lt!125163)))

(assert (=> d!60735 (= (getValueByKey!295 lt!125162 (_1!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60735 (= lt!125163 (lemmaContainsTupThenGetReturnValue!159 lt!125162 (_1!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60735 (= lt!125162 (insertStrictlySorted!162 (toList!1868 lt!125013) (_1!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60735 (= (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))) lt!125164)))

(declare-fun b!250074 () Bool)

(declare-fun res!122466 () Bool)

(assert (=> b!250074 (=> (not res!122466) (not e!162172))))

(assert (=> b!250074 (= res!122466 (= (getValueByKey!295 (toList!1868 lt!125164) (_1!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))))))))

(declare-fun b!250075 () Bool)

(assert (=> b!250075 (= e!162172 (contains!1794 (toList!1868 lt!125164) (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))))))

(assert (= (and d!60735 res!122465) b!250074))

(assert (= (and b!250074 res!122466) b!250075))

(declare-fun m!266029 () Bool)

(assert (=> d!60735 m!266029))

(declare-fun m!266031 () Bool)

(assert (=> d!60735 m!266031))

(declare-fun m!266033 () Bool)

(assert (=> d!60735 m!266033))

(declare-fun m!266035 () Bool)

(assert (=> d!60735 m!266035))

(declare-fun m!266037 () Bool)

(assert (=> b!250074 m!266037))

(declare-fun m!266039 () Bool)

(assert (=> b!250075 m!266039))

(assert (=> b!249745 d!60735))

(declare-fun d!60737 () Bool)

(declare-fun e!162173 () Bool)

(assert (=> d!60737 e!162173))

(declare-fun res!122467 () Bool)

(assert (=> d!60737 (=> (not res!122467) (not e!162173))))

(declare-fun lt!125168 () ListLongMap!3705)

(assert (=> d!60737 (= res!122467 (contains!1792 lt!125168 (_1!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504)))))))

(declare-fun lt!125166 () List!3702)

(assert (=> d!60737 (= lt!125168 (ListLongMap!3706 lt!125166))))

(declare-fun lt!125165 () Unit!7710)

(declare-fun lt!125167 () Unit!7710)

(assert (=> d!60737 (= lt!125165 lt!125167)))

(assert (=> d!60737 (= (getValueByKey!295 lt!125166 (_1!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504)))))))

(assert (=> d!60737 (= lt!125167 (lemmaContainsTupThenGetReturnValue!159 lt!125166 (_1!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504)))))))

(assert (=> d!60737 (= lt!125166 (insertStrictlySorted!162 (toList!1868 lt!125025) (_1!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504)))))))

(assert (=> d!60737 (= (+!672 lt!125025 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))) lt!125168)))

(declare-fun b!250076 () Bool)

(declare-fun res!122468 () Bool)

(assert (=> b!250076 (=> (not res!122468) (not e!162173))))

(assert (=> b!250076 (= res!122468 (= (getValueByKey!295 (toList!1868 lt!125168) (_1!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))))))))

(declare-fun b!250077 () Bool)

(assert (=> b!250077 (= e!162173 (contains!1794 (toList!1868 lt!125168) (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))))))

(assert (= (and d!60737 res!122467) b!250076))

(assert (= (and b!250076 res!122468) b!250077))

(declare-fun m!266041 () Bool)

(assert (=> d!60737 m!266041))

(declare-fun m!266043 () Bool)

(assert (=> d!60737 m!266043))

(declare-fun m!266045 () Bool)

(assert (=> d!60737 m!266045))

(declare-fun m!266047 () Bool)

(assert (=> d!60737 m!266047))

(declare-fun m!266049 () Bool)

(assert (=> b!250076 m!266049))

(declare-fun m!266051 () Bool)

(assert (=> b!250077 m!266051))

(assert (=> b!249745 d!60737))

(declare-fun d!60739 () Bool)

(assert (=> d!60739 (= (apply!239 lt!125017 lt!125020) (get!2986 (getValueByKey!295 (toList!1868 lt!125017) lt!125020)))))

(declare-fun bs!8948 () Bool)

(assert (= bs!8948 d!60739))

(declare-fun m!266053 () Bool)

(assert (=> bs!8948 m!266053))

(assert (=> bs!8948 m!266053))

(declare-fun m!266055 () Bool)

(assert (=> bs!8948 m!266055))

(assert (=> b!249745 d!60739))

(declare-fun d!60741 () Bool)

(declare-fun e!162174 () Bool)

(assert (=> d!60741 e!162174))

(declare-fun res!122469 () Bool)

(assert (=> d!60741 (=> (not res!122469) (not e!162174))))

(declare-fun lt!125172 () ListLongMap!3705)

(assert (=> d!60741 (= res!122469 (contains!1792 lt!125172 (_1!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504)))))))

(declare-fun lt!125170 () List!3702)

(assert (=> d!60741 (= lt!125172 (ListLongMap!3706 lt!125170))))

(declare-fun lt!125169 () Unit!7710)

(declare-fun lt!125171 () Unit!7710)

(assert (=> d!60741 (= lt!125169 lt!125171)))

(assert (=> d!60741 (= (getValueByKey!295 lt!125170 (_1!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504)))))))

(assert (=> d!60741 (= lt!125171 (lemmaContainsTupThenGetReturnValue!159 lt!125170 (_1!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504)))))))

(assert (=> d!60741 (= lt!125170 (insertStrictlySorted!162 (toList!1868 lt!125017) (_1!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504)))))))

(assert (=> d!60741 (= (+!672 lt!125017 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))) lt!125172)))

(declare-fun b!250078 () Bool)

(declare-fun res!122470 () Bool)

(assert (=> b!250078 (=> (not res!122470) (not e!162174))))

(assert (=> b!250078 (= res!122470 (= (getValueByKey!295 (toList!1868 lt!125172) (_1!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))))))))

(declare-fun b!250079 () Bool)

(assert (=> b!250079 (= e!162174 (contains!1794 (toList!1868 lt!125172) (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))))))

(assert (= (and d!60741 res!122469) b!250078))

(assert (= (and b!250078 res!122470) b!250079))

(declare-fun m!266057 () Bool)

(assert (=> d!60741 m!266057))

(declare-fun m!266059 () Bool)

(assert (=> d!60741 m!266059))

(declare-fun m!266061 () Bool)

(assert (=> d!60741 m!266061))

(declare-fun m!266063 () Bool)

(assert (=> d!60741 m!266063))

(declare-fun m!266065 () Bool)

(assert (=> b!250078 m!266065))

(declare-fun m!266067 () Bool)

(assert (=> b!250079 m!266067))

(assert (=> b!249745 d!60741))

(declare-fun d!60743 () Bool)

(assert (=> d!60743 (= (apply!239 (+!672 lt!125030 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))) lt!125015) (apply!239 lt!125030 lt!125015))))

(declare-fun lt!125175 () Unit!7710)

(declare-fun choose!1190 (ListLongMap!3705 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7710)

(assert (=> d!60743 (= lt!125175 (choose!1190 lt!125030 lt!125026 (zeroValue!4457 thiss!1504) lt!125015))))

(declare-fun e!162177 () Bool)

(assert (=> d!60743 e!162177))

(declare-fun res!122473 () Bool)

(assert (=> d!60743 (=> (not res!122473) (not e!162177))))

(assert (=> d!60743 (= res!122473 (contains!1792 lt!125030 lt!125015))))

(assert (=> d!60743 (= (addApplyDifferent!215 lt!125030 lt!125026 (zeroValue!4457 thiss!1504) lt!125015) lt!125175)))

(declare-fun b!250083 () Bool)

(assert (=> b!250083 (= e!162177 (not (= lt!125015 lt!125026)))))

(assert (= (and d!60743 res!122473) b!250083))

(declare-fun m!266069 () Bool)

(assert (=> d!60743 m!266069))

(declare-fun m!266071 () Bool)

(assert (=> d!60743 m!266071))

(assert (=> d!60743 m!265761))

(assert (=> d!60743 m!265751))

(assert (=> d!60743 m!265751))

(assert (=> d!60743 m!265753))

(assert (=> b!249745 d!60743))

(declare-fun d!60745 () Bool)

(assert (=> d!60745 (= (apply!239 (+!672 lt!125030 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))) lt!125015) (get!2986 (getValueByKey!295 (toList!1868 (+!672 lt!125030 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504)))) lt!125015)))))

(declare-fun bs!8949 () Bool)

(assert (= bs!8949 d!60745))

(declare-fun m!266073 () Bool)

(assert (=> bs!8949 m!266073))

(assert (=> bs!8949 m!266073))

(declare-fun m!266075 () Bool)

(assert (=> bs!8949 m!266075))

(assert (=> b!249745 d!60745))

(declare-fun d!60747 () Bool)

(declare-fun e!162178 () Bool)

(assert (=> d!60747 e!162178))

(declare-fun res!122474 () Bool)

(assert (=> d!60747 (=> (not res!122474) (not e!162178))))

(declare-fun lt!125179 () ListLongMap!3705)

(assert (=> d!60747 (= res!122474 (contains!1792 lt!125179 (_1!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504)))))))

(declare-fun lt!125177 () List!3702)

(assert (=> d!60747 (= lt!125179 (ListLongMap!3706 lt!125177))))

(declare-fun lt!125176 () Unit!7710)

(declare-fun lt!125178 () Unit!7710)

(assert (=> d!60747 (= lt!125176 lt!125178)))

(assert (=> d!60747 (= (getValueByKey!295 lt!125177 (_1!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60747 (= lt!125178 (lemmaContainsTupThenGetReturnValue!159 lt!125177 (_1!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60747 (= lt!125177 (insertStrictlySorted!162 (toList!1868 lt!125030) (_1!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))) (_2!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60747 (= (+!672 lt!125030 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))) lt!125179)))

(declare-fun b!250084 () Bool)

(declare-fun res!122475 () Bool)

(assert (=> b!250084 (=> (not res!122475) (not e!162178))))

(assert (=> b!250084 (= res!122475 (= (getValueByKey!295 (toList!1868 lt!125179) (_1!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504)))) (Some!300 (_2!2412 (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))))))))

(declare-fun b!250085 () Bool)

(assert (=> b!250085 (= e!162178 (contains!1794 (toList!1868 lt!125179) (tuple2!4803 lt!125026 (zeroValue!4457 thiss!1504))))))

(assert (= (and d!60747 res!122474) b!250084))

(assert (= (and b!250084 res!122475) b!250085))

(declare-fun m!266077 () Bool)

(assert (=> d!60747 m!266077))

(declare-fun m!266079 () Bool)

(assert (=> d!60747 m!266079))

(declare-fun m!266081 () Bool)

(assert (=> d!60747 m!266081))

(declare-fun m!266083 () Bool)

(assert (=> d!60747 m!266083))

(declare-fun m!266085 () Bool)

(assert (=> b!250084 m!266085))

(declare-fun m!266087 () Bool)

(assert (=> b!250085 m!266087))

(assert (=> b!249745 d!60747))

(declare-fun d!60749 () Bool)

(assert (=> d!60749 (= (apply!239 (+!672 lt!125025 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))) lt!125021) (get!2986 (getValueByKey!295 (toList!1868 (+!672 lt!125025 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504)))) lt!125021)))))

(declare-fun bs!8950 () Bool)

(assert (= bs!8950 d!60749))

(declare-fun m!266089 () Bool)

(assert (=> bs!8950 m!266089))

(assert (=> bs!8950 m!266089))

(declare-fun m!266091 () Bool)

(assert (=> bs!8950 m!266091))

(assert (=> b!249745 d!60749))

(declare-fun d!60751 () Bool)

(declare-fun e!162179 () Bool)

(assert (=> d!60751 e!162179))

(declare-fun res!122476 () Bool)

(assert (=> d!60751 (=> res!122476 e!162179)))

(declare-fun lt!125182 () Bool)

(assert (=> d!60751 (= res!122476 (not lt!125182))))

(declare-fun lt!125180 () Bool)

(assert (=> d!60751 (= lt!125182 lt!125180)))

(declare-fun lt!125181 () Unit!7710)

(declare-fun e!162180 () Unit!7710)

(assert (=> d!60751 (= lt!125181 e!162180)))

(declare-fun c!42007 () Bool)

(assert (=> d!60751 (= c!42007 lt!125180)))

(assert (=> d!60751 (= lt!125180 (containsKey!287 (toList!1868 (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))) lt!125027))))

(assert (=> d!60751 (= (contains!1792 (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504))) lt!125027) lt!125182)))

(declare-fun b!250086 () Bool)

(declare-fun lt!125183 () Unit!7710)

(assert (=> b!250086 (= e!162180 lt!125183)))

(assert (=> b!250086 (= lt!125183 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1868 (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))) lt!125027))))

(assert (=> b!250086 (isDefined!237 (getValueByKey!295 (toList!1868 (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))) lt!125027))))

(declare-fun b!250087 () Bool)

(declare-fun Unit!7719 () Unit!7710)

(assert (=> b!250087 (= e!162180 Unit!7719)))

(declare-fun b!250088 () Bool)

(assert (=> b!250088 (= e!162179 (isDefined!237 (getValueByKey!295 (toList!1868 (+!672 lt!125013 (tuple2!4803 lt!125031 (zeroValue!4457 thiss!1504)))) lt!125027)))))

(assert (= (and d!60751 c!42007) b!250086))

(assert (= (and d!60751 (not c!42007)) b!250087))

(assert (= (and d!60751 (not res!122476)) b!250088))

(declare-fun m!266093 () Bool)

(assert (=> d!60751 m!266093))

(declare-fun m!266095 () Bool)

(assert (=> b!250086 m!266095))

(declare-fun m!266097 () Bool)

(assert (=> b!250086 m!266097))

(assert (=> b!250086 m!266097))

(declare-fun m!266099 () Bool)

(assert (=> b!250086 m!266099))

(assert (=> b!250088 m!266097))

(assert (=> b!250088 m!266097))

(assert (=> b!250088 m!266099))

(assert (=> b!249745 d!60751))

(declare-fun d!60753 () Bool)

(assert (=> d!60753 (= (apply!239 (+!672 lt!125025 (tuple2!4803 lt!125016 (minValue!4457 thiss!1504))) lt!125021) (apply!239 lt!125025 lt!125021))))

(declare-fun lt!125184 () Unit!7710)

(assert (=> d!60753 (= lt!125184 (choose!1190 lt!125025 lt!125016 (minValue!4457 thiss!1504) lt!125021))))

(declare-fun e!162181 () Bool)

(assert (=> d!60753 e!162181))

(declare-fun res!122477 () Bool)

(assert (=> d!60753 (=> (not res!122477) (not e!162181))))

(assert (=> d!60753 (= res!122477 (contains!1792 lt!125025 lt!125021))))

(assert (=> d!60753 (= (addApplyDifferent!215 lt!125025 lt!125016 (minValue!4457 thiss!1504) lt!125021) lt!125184)))

(declare-fun b!250089 () Bool)

(assert (=> b!250089 (= e!162181 (not (= lt!125021 lt!125016)))))

(assert (= (and d!60753 res!122477) b!250089))

(declare-fun m!266101 () Bool)

(assert (=> d!60753 m!266101))

(declare-fun m!266103 () Bool)

(assert (=> d!60753 m!266103))

(assert (=> d!60753 m!265771))

(assert (=> d!60753 m!265755))

(assert (=> d!60753 m!265755))

(assert (=> d!60753 m!265757))

(assert (=> b!249745 d!60753))

(declare-fun d!60755 () Bool)

(assert (=> d!60755 (= (apply!239 lt!125025 lt!125021) (get!2986 (getValueByKey!295 (toList!1868 lt!125025) lt!125021)))))

(declare-fun bs!8951 () Bool)

(assert (= bs!8951 d!60755))

(declare-fun m!266105 () Bool)

(assert (=> bs!8951 m!266105))

(assert (=> bs!8951 m!266105))

(declare-fun m!266107 () Bool)

(assert (=> bs!8951 m!266107))

(assert (=> b!249745 d!60755))

(declare-fun d!60757 () Bool)

(assert (=> d!60757 (= (apply!239 lt!125030 lt!125015) (get!2986 (getValueByKey!295 (toList!1868 lt!125030) lt!125015)))))

(declare-fun bs!8952 () Bool)

(assert (= bs!8952 d!60757))

(declare-fun m!266109 () Bool)

(assert (=> bs!8952 m!266109))

(assert (=> bs!8952 m!266109))

(declare-fun m!266111 () Bool)

(assert (=> bs!8952 m!266111))

(assert (=> b!249745 d!60757))

(declare-fun d!60759 () Bool)

(assert (=> d!60759 (= (apply!239 (+!672 lt!125017 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))) lt!125020) (apply!239 lt!125017 lt!125020))))

(declare-fun lt!125185 () Unit!7710)

(assert (=> d!60759 (= lt!125185 (choose!1190 lt!125017 lt!125033 (minValue!4457 thiss!1504) lt!125020))))

(declare-fun e!162182 () Bool)

(assert (=> d!60759 e!162182))

(declare-fun res!122478 () Bool)

(assert (=> d!60759 (=> (not res!122478) (not e!162182))))

(assert (=> d!60759 (= res!122478 (contains!1792 lt!125017 lt!125020))))

(assert (=> d!60759 (= (addApplyDifferent!215 lt!125017 lt!125033 (minValue!4457 thiss!1504) lt!125020) lt!125185)))

(declare-fun b!250090 () Bool)

(assert (=> b!250090 (= e!162182 (not (= lt!125020 lt!125033)))))

(assert (= (and d!60759 res!122478) b!250090))

(declare-fun m!266113 () Bool)

(assert (=> d!60759 m!266113))

(declare-fun m!266115 () Bool)

(assert (=> d!60759 m!266115))

(assert (=> d!60759 m!265767))

(assert (=> d!60759 m!265747))

(assert (=> d!60759 m!265747))

(assert (=> d!60759 m!265749))

(assert (=> b!249745 d!60759))

(declare-fun d!60761 () Bool)

(assert (=> d!60761 (= (apply!239 (+!672 lt!125017 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504))) lt!125020) (get!2986 (getValueByKey!295 (toList!1868 (+!672 lt!125017 (tuple2!4803 lt!125033 (minValue!4457 thiss!1504)))) lt!125020)))))

(declare-fun bs!8953 () Bool)

(assert (= bs!8953 d!60761))

(declare-fun m!266117 () Bool)

(assert (=> bs!8953 m!266117))

(assert (=> bs!8953 m!266117))

(declare-fun m!266119 () Bool)

(assert (=> bs!8953 m!266119))

(assert (=> b!249745 d!60761))

(assert (=> b!249745 d!60671))

(declare-fun bm!23485 () Bool)

(declare-fun call!23488 () Bool)

(assert (=> bm!23485 (= call!23488 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) (mask!10787 thiss!1504)))))

(declare-fun b!250091 () Bool)

(declare-fun e!162183 () Bool)

(assert (=> b!250091 (= e!162183 call!23488)))

(declare-fun b!250092 () Bool)

(declare-fun e!162185 () Bool)

(assert (=> b!250092 (= e!162183 e!162185)))

(declare-fun lt!125187 () (_ BitVec 64))

(assert (=> b!250092 (= lt!125187 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125186 () Unit!7710)

(assert (=> b!250092 (= lt!125186 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) lt!125187 #b00000000000000000000000000000000))))

(assert (=> b!250092 (arrayContainsKey!0 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) lt!125187 #b00000000000000000000000000000000)))

(declare-fun lt!125188 () Unit!7710)

(assert (=> b!250092 (= lt!125188 lt!125186)))

(declare-fun res!122480 () Bool)

(assert (=> b!250092 (= res!122480 (= (seekEntryOrOpen!0 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000) (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) (mask!10787 thiss!1504)) (Found!1116 #b00000000000000000000000000000000)))))

(assert (=> b!250092 (=> (not res!122480) (not e!162185))))

(declare-fun b!250093 () Bool)

(assert (=> b!250093 (= e!162185 call!23488)))

(declare-fun d!60763 () Bool)

(declare-fun res!122479 () Bool)

(declare-fun e!162184 () Bool)

(assert (=> d!60763 (=> res!122479 e!162184)))

(assert (=> d!60763 (= res!122479 (bvsge #b00000000000000000000000000000000 (size!6163 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))))))))

(assert (=> d!60763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504))) (mask!10787 thiss!1504)) e!162184)))

(declare-fun b!250094 () Bool)

(assert (=> b!250094 (= e!162184 e!162183)))

(declare-fun c!42008 () Bool)

(assert (=> b!250094 (= c!42008 (validKeyInArray!0 (select (arr!5818 (array!12272 (store (arr!5818 (_keys!6747 thiss!1504)) index!297 key!932) (size!6163 (_keys!6747 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60763 (not res!122479)) b!250094))

(assert (= (and b!250094 c!42008) b!250092))

(assert (= (and b!250094 (not c!42008)) b!250091))

(assert (= (and b!250092 res!122480) b!250093))

(assert (= (or b!250093 b!250091) bm!23485))

(declare-fun m!266121 () Bool)

(assert (=> bm!23485 m!266121))

(assert (=> b!250092 m!265899))

(declare-fun m!266123 () Bool)

(assert (=> b!250092 m!266123))

(declare-fun m!266125 () Bool)

(assert (=> b!250092 m!266125))

(assert (=> b!250092 m!265899))

(declare-fun m!266127 () Bool)

(assert (=> b!250092 m!266127))

(assert (=> b!250094 m!265899))

(assert (=> b!250094 m!265899))

(assert (=> b!250094 m!265901))

(assert (=> b!249849 d!60763))

(declare-fun d!60765 () Bool)

(assert (=> d!60765 (= (inRange!0 (index!6635 lt!125078) (mask!10787 thiss!1504)) (and (bvsge (index!6635 lt!125078) #b00000000000000000000000000000000) (bvslt (index!6635 lt!125078) (bvadd (mask!10787 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249873 d!60765))

(declare-fun d!60767 () Bool)

(declare-fun isEmpty!531 (Option!301) Bool)

(assert (=> d!60767 (= (isDefined!237 (getValueByKey!295 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932)) (not (isEmpty!531 (getValueByKey!295 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))))

(declare-fun bs!8954 () Bool)

(assert (= bs!8954 d!60767))

(assert (=> bs!8954 m!265733))

(declare-fun m!266129 () Bool)

(assert (=> bs!8954 m!266129))

(assert (=> b!249694 d!60767))

(declare-fun b!250106 () Bool)

(declare-fun e!162191 () Option!301)

(assert (=> b!250106 (= e!162191 None!299)))

(declare-fun b!250103 () Bool)

(declare-fun e!162190 () Option!301)

(assert (=> b!250103 (= e!162190 (Some!300 (_2!2412 (h!4357 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))))))

(declare-fun d!60769 () Bool)

(declare-fun c!42013 () Bool)

(assert (=> d!60769 (= c!42013 (and ((_ is Cons!3698) (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (= (_1!2412 (h!4357 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)))))

(assert (=> d!60769 (= (getValueByKey!295 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932) e!162190)))

(declare-fun b!250104 () Bool)

(assert (=> b!250104 (= e!162190 e!162191)))

(declare-fun c!42014 () Bool)

(assert (=> b!250104 (= c!42014 (and ((_ is Cons!3698) (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (not (= (_1!2412 (h!4357 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932))))))

(declare-fun b!250105 () Bool)

(assert (=> b!250105 (= e!162191 (getValueByKey!295 (t!8724 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) key!932))))

(assert (= (and d!60769 c!42013) b!250103))

(assert (= (and d!60769 (not c!42013)) b!250104))

(assert (= (and b!250104 c!42014) b!250105))

(assert (= (and b!250104 (not c!42014)) b!250106))

(declare-fun m!266131 () Bool)

(assert (=> b!250105 m!266131))

(assert (=> b!249694 d!60769))

(declare-fun b!250107 () Bool)

(declare-fun e!162192 () (_ BitVec 32))

(assert (=> b!250107 (= e!162192 #b00000000000000000000000000000000)))

(declare-fun b!250108 () Bool)

(declare-fun e!162193 () (_ BitVec 32))

(assert (=> b!250108 (= e!162192 e!162193)))

(declare-fun c!42016 () Bool)

(assert (=> b!250108 (= c!42016 (validKeyInArray!0 (select (arr!5818 (_keys!6747 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250109 () Bool)

(declare-fun call!23489 () (_ BitVec 32))

(assert (=> b!250109 (= e!162193 (bvadd #b00000000000000000000000000000001 call!23489))))

(declare-fun b!250110 () Bool)

(assert (=> b!250110 (= e!162193 call!23489)))

(declare-fun d!60771 () Bool)

(declare-fun lt!125189 () (_ BitVec 32))

(assert (=> d!60771 (and (bvsge lt!125189 #b00000000000000000000000000000000) (bvsle lt!125189 (bvsub (size!6163 (_keys!6747 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60771 (= lt!125189 e!162192)))

(declare-fun c!42015 () Bool)

(assert (=> d!60771 (= c!42015 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60771 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6163 (_keys!6747 thiss!1504)) (size!6163 (_keys!6747 thiss!1504))))))

(assert (=> d!60771 (= (arrayCountValidKeys!0 (_keys!6747 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))) lt!125189)))

(declare-fun bm!23486 () Bool)

(assert (=> bm!23486 (= call!23489 (arrayCountValidKeys!0 (_keys!6747 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6163 (_keys!6747 thiss!1504))))))

(assert (= (and d!60771 c!42015) b!250107))

(assert (= (and d!60771 (not c!42015)) b!250108))

(assert (= (and b!250108 c!42016) b!250109))

(assert (= (and b!250108 (not c!42016)) b!250110))

(assert (= (or b!250109 b!250110) bm!23486))

(assert (=> b!250108 m!265895))

(assert (=> b!250108 m!265895))

(declare-fun m!266133 () Bool)

(assert (=> b!250108 m!266133))

(declare-fun m!266135 () Bool)

(assert (=> bm!23486 m!266135))

(assert (=> bm!23465 d!60771))

(assert (=> b!249841 d!60665))

(declare-fun d!60773 () Bool)

(declare-fun e!162194 () Bool)

(assert (=> d!60773 e!162194))

(declare-fun res!122481 () Bool)

(assert (=> d!60773 (=> res!122481 e!162194)))

(declare-fun lt!125192 () Bool)

(assert (=> d!60773 (= res!122481 (not lt!125192))))

(declare-fun lt!125190 () Bool)

(assert (=> d!60773 (= lt!125192 lt!125190)))

(declare-fun lt!125191 () Unit!7710)

(declare-fun e!162195 () Unit!7710)

(assert (=> d!60773 (= lt!125191 e!162195)))

(declare-fun c!42017 () Bool)

(assert (=> d!60773 (= c!42017 lt!125190)))

(assert (=> d!60773 (= lt!125190 (containsKey!287 (toList!1868 lt!125029) (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60773 (= (contains!1792 lt!125029 (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)) lt!125192)))

(declare-fun b!250111 () Bool)

(declare-fun lt!125193 () Unit!7710)

(assert (=> b!250111 (= e!162195 lt!125193)))

(assert (=> b!250111 (= lt!125193 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1868 lt!125029) (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250111 (isDefined!237 (getValueByKey!295 (toList!1868 lt!125029) (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250112 () Bool)

(declare-fun Unit!7720 () Unit!7710)

(assert (=> b!250112 (= e!162195 Unit!7720)))

(declare-fun b!250113 () Bool)

(assert (=> b!250113 (= e!162194 (isDefined!237 (getValueByKey!295 (toList!1868 lt!125029) (select (arr!5818 (_keys!6747 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60773 c!42017) b!250111))

(assert (= (and d!60773 (not c!42017)) b!250112))

(assert (= (and d!60773 (not res!122481)) b!250113))

(assert (=> d!60773 m!265737))

(declare-fun m!266137 () Bool)

(assert (=> d!60773 m!266137))

(assert (=> b!250111 m!265737))

(declare-fun m!266139 () Bool)

(assert (=> b!250111 m!266139))

(assert (=> b!250111 m!265737))

(assert (=> b!250111 m!265943))

(assert (=> b!250111 m!265943))

(declare-fun m!266141 () Bool)

(assert (=> b!250111 m!266141))

(assert (=> b!250113 m!265737))

(assert (=> b!250113 m!265943))

(assert (=> b!250113 m!265943))

(assert (=> b!250113 m!266141))

(assert (=> b!249742 d!60773))

(declare-fun d!60775 () Bool)

(assert (=> d!60775 (isDefined!237 (getValueByKey!295 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-fun lt!125196 () Unit!7710)

(declare-fun choose!1191 (List!3702 (_ BitVec 64)) Unit!7710)

(assert (=> d!60775 (= lt!125196 (choose!1191 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-fun e!162198 () Bool)

(assert (=> d!60775 e!162198))

(declare-fun res!122484 () Bool)

(assert (=> d!60775 (=> (not res!122484) (not e!162198))))

(declare-fun isStrictlySorted!365 (List!3702) Bool)

(assert (=> d!60775 (= res!122484 (isStrictlySorted!365 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))))

(assert (=> d!60775 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932) lt!125196)))

(declare-fun b!250116 () Bool)

(assert (=> b!250116 (= e!162198 (containsKey!287 (toList!1868 (getCurrentListMap!1377 (_keys!6747 thiss!1504) (_values!4599 thiss!1504) (mask!10787 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(assert (= (and d!60775 res!122484) b!250116))

(assert (=> d!60775 m!265733))

(assert (=> d!60775 m!265733))

(assert (=> d!60775 m!265735))

(declare-fun m!266143 () Bool)

(assert (=> d!60775 m!266143))

(declare-fun m!266145 () Bool)

(assert (=> d!60775 m!266145))

(assert (=> b!250116 m!265729))

(assert (=> b!249692 d!60775))

(assert (=> b!249692 d!60767))

(assert (=> b!249692 d!60769))

(declare-fun d!60777 () Bool)

(declare-fun e!162199 () Bool)

(assert (=> d!60777 e!162199))

(declare-fun res!122485 () Bool)

(assert (=> d!60777 (=> res!122485 e!162199)))

(declare-fun lt!125199 () Bool)

(assert (=> d!60777 (= res!122485 (not lt!125199))))

(declare-fun lt!125197 () Bool)

(assert (=> d!60777 (= lt!125199 lt!125197)))

(declare-fun lt!125198 () Unit!7710)

(declare-fun e!162200 () Unit!7710)

(assert (=> d!60777 (= lt!125198 e!162200)))

(declare-fun c!42018 () Bool)

(assert (=> d!60777 (= c!42018 lt!125197)))

(assert (=> d!60777 (= lt!125197 (containsKey!287 (toList!1868 lt!125029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60777 (= (contains!1792 lt!125029 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125199)))

(declare-fun b!250117 () Bool)

(declare-fun lt!125200 () Unit!7710)

(assert (=> b!250117 (= e!162200 lt!125200)))

(assert (=> b!250117 (= lt!125200 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1868 lt!125029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250117 (isDefined!237 (getValueByKey!295 (toList!1868 lt!125029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250118 () Bool)

(declare-fun Unit!7721 () Unit!7710)

(assert (=> b!250118 (= e!162200 Unit!7721)))

(declare-fun b!250119 () Bool)

(assert (=> b!250119 (= e!162199 (isDefined!237 (getValueByKey!295 (toList!1868 lt!125029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60777 c!42018) b!250117))

(assert (= (and d!60777 (not c!42018)) b!250118))

(assert (= (and d!60777 (not res!122485)) b!250119))

(declare-fun m!266147 () Bool)

(assert (=> d!60777 m!266147))

(declare-fun m!266149 () Bool)

(assert (=> b!250117 m!266149))

(assert (=> b!250117 m!265955))

(assert (=> b!250117 m!265955))

(declare-fun m!266151 () Bool)

(assert (=> b!250117 m!266151))

(assert (=> b!250119 m!265955))

(assert (=> b!250119 m!265955))

(assert (=> b!250119 m!266151))

(assert (=> bm!23446 d!60777))

(declare-fun d!60779 () Bool)

(declare-fun e!162201 () Bool)

(assert (=> d!60779 e!162201))

(declare-fun res!122486 () Bool)

(assert (=> d!60779 (=> res!122486 e!162201)))

(declare-fun lt!125203 () Bool)

(assert (=> d!60779 (= res!122486 (not lt!125203))))

(declare-fun lt!125201 () Bool)

(assert (=> d!60779 (= lt!125203 lt!125201)))

(declare-fun lt!125202 () Unit!7710)

(declare-fun e!162202 () Unit!7710)

(assert (=> d!60779 (= lt!125202 e!162202)))

(declare-fun c!42019 () Bool)

(assert (=> d!60779 (= c!42019 lt!125201)))

(assert (=> d!60779 (= lt!125201 (containsKey!287 (toList!1868 lt!125029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60779 (= (contains!1792 lt!125029 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125203)))

(declare-fun b!250120 () Bool)

(declare-fun lt!125204 () Unit!7710)

(assert (=> b!250120 (= e!162202 lt!125204)))

(assert (=> b!250120 (= lt!125204 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1868 lt!125029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250120 (isDefined!237 (getValueByKey!295 (toList!1868 lt!125029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250121 () Bool)

(declare-fun Unit!7722 () Unit!7710)

(assert (=> b!250121 (= e!162202 Unit!7722)))

(declare-fun b!250122 () Bool)

(assert (=> b!250122 (= e!162201 (isDefined!237 (getValueByKey!295 (toList!1868 lt!125029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60779 c!42019) b!250120))

(assert (= (and d!60779 (not c!42019)) b!250121))

(assert (= (and d!60779 (not res!122486)) b!250122))

(declare-fun m!266153 () Bool)

(assert (=> d!60779 m!266153))

(declare-fun m!266155 () Bool)

(assert (=> b!250120 m!266155))

(assert (=> b!250120 m!265891))

(assert (=> b!250120 m!265891))

(declare-fun m!266157 () Bool)

(assert (=> b!250120 m!266157))

(assert (=> b!250122 m!265891))

(assert (=> b!250122 m!265891))

(assert (=> b!250122 m!266157))

(assert (=> bm!23452 d!60779))

(declare-fun mapNonEmpty!11020 () Bool)

(declare-fun mapRes!11020 () Bool)

(declare-fun tp!23134 () Bool)

(declare-fun e!162204 () Bool)

(assert (=> mapNonEmpty!11020 (= mapRes!11020 (and tp!23134 e!162204))))

(declare-fun mapRest!11020 () (Array (_ BitVec 32) ValueCell!2897))

(declare-fun mapValue!11020 () ValueCell!2897)

(declare-fun mapKey!11020 () (_ BitVec 32))

(assert (=> mapNonEmpty!11020 (= mapRest!11019 (store mapRest!11020 mapKey!11020 mapValue!11020))))

(declare-fun mapIsEmpty!11020 () Bool)

(assert (=> mapIsEmpty!11020 mapRes!11020))

(declare-fun condMapEmpty!11020 () Bool)

(declare-fun mapDefault!11020 () ValueCell!2897)

(assert (=> mapNonEmpty!11019 (= condMapEmpty!11020 (= mapRest!11019 ((as const (Array (_ BitVec 32) ValueCell!2897)) mapDefault!11020)))))

(declare-fun e!162203 () Bool)

(assert (=> mapNonEmpty!11019 (= tp!23133 (and e!162203 mapRes!11020))))

(declare-fun b!250123 () Bool)

(assert (=> b!250123 (= e!162204 tp_is_empty!6481)))

(declare-fun b!250124 () Bool)

(assert (=> b!250124 (= e!162203 tp_is_empty!6481)))

(assert (= (and mapNonEmpty!11019 condMapEmpty!11020) mapIsEmpty!11020))

(assert (= (and mapNonEmpty!11019 (not condMapEmpty!11020)) mapNonEmpty!11020))

(assert (= (and mapNonEmpty!11020 ((_ is ValueCellFull!2897) mapValue!11020)) b!250123))

(assert (= (and mapNonEmpty!11019 ((_ is ValueCellFull!2897) mapDefault!11020)) b!250124))

(declare-fun m!266159 () Bool)

(assert (=> mapNonEmpty!11020 m!266159))

(declare-fun b_lambda!8065 () Bool)

(assert (= b_lambda!8063 (or (and b!249534 b_free!6619) b_lambda!8065)))

(declare-fun b_lambda!8067 () Bool)

(assert (= b_lambda!8061 (or (and b!249534 b_free!6619) b_lambda!8067)))

(check-sat (not b!250074) (not d!60663) (not d!60669) (not b!250007) (not b!250009) tp_is_empty!6481 (not b!249887) (not b!250064) (not b_lambda!8059) (not d!60745) (not b!250021) (not b!250076) (not b!250088) (not bm!23481) (not b!249931) (not bm!23482) (not bm!23475) (not b!249947) (not b!249972) (not d!60685) (not d!60703) (not d!60739) (not b!250003) (not d!60695) (not b!250111) (not b!249961) (not d!60743) (not d!60673) (not d!60713) (not b!250092) (not b!249938) (not b!250084) (not b!249916) (not d!60755) (not d!60741) (not d!60759) (not d!60749) (not b!250120) (not bm!23472) (not bm!23483) (not d!60753) (not b!250086) (not b!249925) (not b!250060) (not b!249921) (not d!60729) (not b!249914) (not d!60751) (not d!60671) (not b!250046) (not d!60775) (not b!249883) (not d!60773) (not b!250011) (not b_lambda!8065) (not b!249920) (not b!249918) (not b!249977) (not d!60701) (not b!250108) (not d!60737) (not b!250005) (not b!250085) (not b!250122) (not bm!23486) (not b!249915) (not mapNonEmpty!11020) (not bm!23473) (not b!250022) (not b!250113) (not d!60777) (not d!60767) (not d!60747) (not d!60693) (not b!250051) (not b!250117) (not d!60779) (not bm!23474) (not b!249940) (not d!60725) (not bm!23476) (not b!249912) (not d!60711) (not d!60731) (not b!250078) (not b!249971) (not bm!23469) (not b!250075) (not b!250052) (not b!249919) (not b!249933) (not b!250105) (not bm!23485) (not b!250094) (not b_lambda!8067) (not d!60691) b_and!13617 (not b!249935) (not bm!23484) (not d!60719) (not b!250072) (not b!250079) (not b!249942) (not b_next!6619) (not b!249948) (not d!60715) (not d!60733) (not b!249927) (not d!60761) (not b!250116) (not b!250077) (not d!60699) (not d!60735) (not b!250119) (not b!249885) (not d!60757) (not b!250058))
(check-sat b_and!13617 (not b_next!6619))

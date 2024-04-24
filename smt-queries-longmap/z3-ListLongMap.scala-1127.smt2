; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23150 () Bool)

(assert start!23150)

(declare-fun b!242729 () Bool)

(declare-fun b_free!6511 () Bool)

(declare-fun b_next!6511 () Bool)

(assert (=> b!242729 (= b_free!6511 (not b_next!6511))))

(declare-fun tp!22749 () Bool)

(declare-fun b_and!13503 () Bool)

(assert (=> b!242729 (= tp!22749 b_and!13503)))

(declare-fun b!242725 () Bool)

(declare-fun res!118940 () Bool)

(declare-fun e!157524 () Bool)

(assert (=> b!242725 (=> (not res!118940) (not e!157524))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!242725 (= res!118940 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242726 () Bool)

(declare-fun e!157532 () Bool)

(declare-datatypes ((List!3559 0))(
  ( (Nil!3556) (Cons!3555 (h!4212 (_ BitVec 64)) (t!8554 List!3559)) )
))
(declare-fun contains!1725 (List!3559 (_ BitVec 64)) Bool)

(assert (=> b!242726 (= e!157532 (contains!1725 Nil!3556 key!932))))

(declare-fun b!242727 () Bool)

(declare-fun e!157538 () Bool)

(declare-fun call!22607 () Bool)

(assert (=> b!242727 (= e!157538 (not call!22607))))

(declare-fun b!242728 () Bool)

(declare-fun e!157529 () Bool)

(assert (=> b!242728 (= e!157529 (not (contains!1725 Nil!3556 key!932)))))

(declare-fun e!157526 () Bool)

(declare-fun e!157539 () Bool)

(declare-datatypes ((V!8145 0))(
  ( (V!8146 (val!3231 Int)) )
))
(declare-datatypes ((ValueCell!2843 0))(
  ( (ValueCellFull!2843 (v!5275 V!8145)) (EmptyCell!2843) )
))
(declare-datatypes ((array!12031 0))(
  ( (array!12032 (arr!5713 (Array (_ BitVec 32) ValueCell!2843)) (size!6055 (_ BitVec 32))) )
))
(declare-datatypes ((array!12033 0))(
  ( (array!12034 (arr!5714 (Array (_ BitVec 32) (_ BitVec 64))) (size!6056 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3586 0))(
  ( (LongMapFixedSize!3587 (defaultEntry!4498 Int) (mask!10583 (_ BitVec 32)) (extraKeys!4235 (_ BitVec 32)) (zeroValue!4339 V!8145) (minValue!4339 V!8145) (_size!1842 (_ BitVec 32)) (_keys!6607 array!12033) (_values!4481 array!12031) (_vacant!1842 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3586)

(declare-fun tp_is_empty!6373 () Bool)

(declare-fun array_inv!3755 (array!12033) Bool)

(declare-fun array_inv!3756 (array!12031) Bool)

(assert (=> b!242729 (= e!157539 (and tp!22749 tp_is_empty!6373 (array_inv!3755 (_keys!6607 thiss!1504)) (array_inv!3756 (_values!4481 thiss!1504)) e!157526))))

(declare-fun b!242730 () Bool)

(declare-datatypes ((Unit!7462 0))(
  ( (Unit!7463) )
))
(declare-fun e!157527 () Unit!7462)

(declare-fun lt!121954 () Unit!7462)

(assert (=> b!242730 (= e!157527 lt!121954)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!348 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7462)

(assert (=> b!242730 (= lt!121954 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!348 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(declare-fun c!40518 () Bool)

(declare-datatypes ((SeekEntryResult!1034 0))(
  ( (MissingZero!1034 (index!6306 (_ BitVec 32))) (Found!1034 (index!6307 (_ BitVec 32))) (Intermediate!1034 (undefined!1846 Bool) (index!6308 (_ BitVec 32)) (x!24258 (_ BitVec 32))) (Undefined!1034) (MissingVacant!1034 (index!6309 (_ BitVec 32))) )
))
(declare-fun lt!121952 () SeekEntryResult!1034)

(get-info :version)

(assert (=> b!242730 (= c!40518 ((_ is MissingZero!1034) lt!121952))))

(declare-fun e!157533 () Bool)

(assert (=> b!242730 e!157533))

(declare-fun b!242731 () Bool)

(declare-fun res!118942 () Bool)

(declare-fun e!157523 () Bool)

(assert (=> b!242731 (=> (not res!118942) (not e!157523))))

(assert (=> b!242731 (= res!118942 (not (contains!1725 Nil!3556 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242732 () Bool)

(declare-fun res!118937 () Bool)

(assert (=> b!242732 (=> (not res!118937) (not e!157523))))

(assert (=> b!242732 (= res!118937 e!157529)))

(declare-fun res!118943 () Bool)

(assert (=> b!242732 (=> res!118943 e!157529)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242732 (= res!118943 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!242733 () Bool)

(declare-fun e!157525 () Bool)

(assert (=> b!242733 (= e!157525 ((_ is Undefined!1034) lt!121952))))

(declare-fun b!242724 () Bool)

(declare-fun res!118931 () Bool)

(declare-fun e!157531 () Bool)

(assert (=> b!242724 (=> (not res!118931) (not e!157531))))

(declare-fun call!22608 () Bool)

(assert (=> b!242724 (= res!118931 call!22608)))

(assert (=> b!242724 (= e!157533 e!157531)))

(declare-fun res!118938 () Bool)

(assert (=> start!23150 (=> (not res!118938) (not e!157524))))

(declare-fun valid!1419 (LongMapFixedSize!3586) Bool)

(assert (=> start!23150 (= res!118938 (valid!1419 thiss!1504))))

(assert (=> start!23150 e!157524))

(assert (=> start!23150 e!157539))

(assert (=> start!23150 true))

(declare-fun b!242734 () Bool)

(declare-fun Unit!7464 () Unit!7462)

(assert (=> b!242734 (= e!157527 Unit!7464)))

(declare-fun lt!121953 () Unit!7462)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7462)

(assert (=> b!242734 (= lt!121953 (lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(assert (=> b!242734 false))

(declare-fun bm!22604 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22604 (= call!22608 (inRange!0 (ite c!40518 (index!6306 lt!121952) (index!6309 lt!121952)) (mask!10583 thiss!1504)))))

(declare-fun b!242735 () Bool)

(declare-fun e!157534 () Bool)

(assert (=> b!242735 (= e!157524 e!157534)))

(declare-fun res!118941 () Bool)

(assert (=> b!242735 (=> (not res!118941) (not e!157534))))

(assert (=> b!242735 (= res!118941 (or (= lt!121952 (MissingZero!1034 index!297)) (= lt!121952 (MissingVacant!1034 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12033 (_ BitVec 32)) SeekEntryResult!1034)

(assert (=> b!242735 (= lt!121952 (seekEntryOrOpen!0 key!932 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)))))

(declare-fun b!242736 () Bool)

(declare-fun e!157536 () Unit!7462)

(declare-fun Unit!7465 () Unit!7462)

(assert (=> b!242736 (= e!157536 Unit!7465)))

(declare-fun lt!121950 () Unit!7462)

(declare-fun lemmaArrayContainsKeyThenInListMap!172 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) (_ BitVec 32) Int) Unit!7462)

(assert (=> b!242736 (= lt!121950 (lemmaArrayContainsKeyThenInListMap!172 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(assert (=> b!242736 false))

(declare-fun b!242737 () Bool)

(declare-fun e!157537 () Bool)

(declare-fun mapRes!10804 () Bool)

(assert (=> b!242737 (= e!157526 (and e!157537 mapRes!10804))))

(declare-fun condMapEmpty!10804 () Bool)

(declare-fun mapDefault!10804 () ValueCell!2843)

(assert (=> b!242737 (= condMapEmpty!10804 (= (arr!5713 (_values!4481 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2843)) mapDefault!10804)))))

(declare-fun b!242738 () Bool)

(declare-fun Unit!7466 () Unit!7462)

(assert (=> b!242738 (= e!157536 Unit!7466)))

(declare-fun b!242739 () Bool)

(declare-fun e!157528 () Bool)

(assert (=> b!242739 (= e!157528 tp_is_empty!6373)))

(declare-fun mapIsEmpty!10804 () Bool)

(assert (=> mapIsEmpty!10804 mapRes!10804))

(declare-fun b!242740 () Bool)

(declare-fun e!157530 () Bool)

(assert (=> b!242740 (= e!157530 e!157523)))

(declare-fun res!118934 () Bool)

(assert (=> b!242740 (=> (not res!118934) (not e!157523))))

(assert (=> b!242740 (= res!118934 (and (bvslt (size!6056 (_keys!6607 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504)))))))

(declare-fun lt!121955 () Unit!7462)

(assert (=> b!242740 (= lt!121955 e!157536)))

(declare-fun c!40516 () Bool)

(declare-fun arrayContainsKey!0 (array!12033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!242740 (= c!40516 (arrayContainsKey!0 (_keys!6607 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242741 () Bool)

(assert (=> b!242741 (= e!157531 (not call!22607))))

(declare-fun b!242742 () Bool)

(assert (=> b!242742 (= e!157534 e!157530)))

(declare-fun res!118936 () Bool)

(assert (=> b!242742 (=> (not res!118936) (not e!157530))))

(assert (=> b!242742 (= res!118936 (inRange!0 index!297 (mask!10583 thiss!1504)))))

(declare-fun lt!121951 () Unit!7462)

(assert (=> b!242742 (= lt!121951 e!157527)))

(declare-fun c!40517 () Bool)

(declare-datatypes ((tuple2!4690 0))(
  ( (tuple2!4691 (_1!2356 (_ BitVec 64)) (_2!2356 V!8145)) )
))
(declare-datatypes ((List!3560 0))(
  ( (Nil!3557) (Cons!3556 (h!4213 tuple2!4690) (t!8555 List!3560)) )
))
(declare-datatypes ((ListLongMap!3605 0))(
  ( (ListLongMap!3606 (toList!1818 List!3560)) )
))
(declare-fun contains!1726 (ListLongMap!3605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1350 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 32) Int) ListLongMap!3605)

(assert (=> b!242742 (= c!40517 (contains!1726 (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) key!932))))

(declare-fun b!242743 () Bool)

(declare-fun res!118929 () Bool)

(assert (=> b!242743 (=> (not res!118929) (not e!157523))))

(declare-fun noDuplicate!90 (List!3559) Bool)

(assert (=> b!242743 (= res!118929 (noDuplicate!90 Nil!3556))))

(declare-fun b!242744 () Bool)

(assert (=> b!242744 (= e!157525 e!157538)))

(declare-fun res!118932 () Bool)

(assert (=> b!242744 (= res!118932 call!22608)))

(assert (=> b!242744 (=> (not res!118932) (not e!157538))))

(declare-fun b!242745 () Bool)

(declare-fun res!118933 () Bool)

(assert (=> b!242745 (=> (not res!118933) (not e!157531))))

(assert (=> b!242745 (= res!118933 (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6306 lt!121952)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242746 () Bool)

(declare-fun c!40519 () Bool)

(assert (=> b!242746 (= c!40519 ((_ is MissingVacant!1034) lt!121952))))

(assert (=> b!242746 (= e!157533 e!157525)))

(declare-fun mapNonEmpty!10804 () Bool)

(declare-fun tp!22750 () Bool)

(assert (=> mapNonEmpty!10804 (= mapRes!10804 (and tp!22750 e!157528))))

(declare-fun mapRest!10804 () (Array (_ BitVec 32) ValueCell!2843))

(declare-fun mapValue!10804 () ValueCell!2843)

(declare-fun mapKey!10804 () (_ BitVec 32))

(assert (=> mapNonEmpty!10804 (= (arr!5713 (_values!4481 thiss!1504)) (store mapRest!10804 mapKey!10804 mapValue!10804))))

(declare-fun bm!22605 () Bool)

(assert (=> bm!22605 (= call!22607 (arrayContainsKey!0 (_keys!6607 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242747 () Bool)

(declare-fun res!118930 () Bool)

(assert (=> b!242747 (= res!118930 (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6309 lt!121952)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242747 (=> (not res!118930) (not e!157538))))

(declare-fun b!242748 () Bool)

(assert (=> b!242748 (= e!157537 tp_is_empty!6373)))

(declare-fun b!242749 () Bool)

(declare-fun res!118939 () Bool)

(assert (=> b!242749 (=> (not res!118939) (not e!157523))))

(assert (=> b!242749 (= res!118939 (not (contains!1725 Nil!3556 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242750 () Bool)

(assert (=> b!242750 (= e!157523 e!157532)))

(declare-fun res!118935 () Bool)

(assert (=> b!242750 (=> res!118935 e!157532)))

(assert (=> b!242750 (= res!118935 (bvsgt #b00000000000000000000000000000000 index!297))))

(assert (= (and start!23150 res!118938) b!242725))

(assert (= (and b!242725 res!118940) b!242735))

(assert (= (and b!242735 res!118941) b!242742))

(assert (= (and b!242742 c!40517) b!242734))

(assert (= (and b!242742 (not c!40517)) b!242730))

(assert (= (and b!242730 c!40518) b!242724))

(assert (= (and b!242730 (not c!40518)) b!242746))

(assert (= (and b!242724 res!118931) b!242745))

(assert (= (and b!242745 res!118933) b!242741))

(assert (= (and b!242746 c!40519) b!242744))

(assert (= (and b!242746 (not c!40519)) b!242733))

(assert (= (and b!242744 res!118932) b!242747))

(assert (= (and b!242747 res!118930) b!242727))

(assert (= (or b!242724 b!242744) bm!22604))

(assert (= (or b!242741 b!242727) bm!22605))

(assert (= (and b!242742 res!118936) b!242740))

(assert (= (and b!242740 c!40516) b!242736))

(assert (= (and b!242740 (not c!40516)) b!242738))

(assert (= (and b!242740 res!118934) b!242743))

(assert (= (and b!242743 res!118929) b!242749))

(assert (= (and b!242749 res!118939) b!242731))

(assert (= (and b!242731 res!118942) b!242732))

(assert (= (and b!242732 (not res!118943)) b!242728))

(assert (= (and b!242732 res!118937) b!242750))

(assert (= (and b!242750 (not res!118935)) b!242726))

(assert (= (and b!242737 condMapEmpty!10804) mapIsEmpty!10804))

(assert (= (and b!242737 (not condMapEmpty!10804)) mapNonEmpty!10804))

(assert (= (and mapNonEmpty!10804 ((_ is ValueCellFull!2843) mapValue!10804)) b!242739))

(assert (= (and b!242737 ((_ is ValueCellFull!2843) mapDefault!10804)) b!242748))

(assert (= b!242729 b!242737))

(assert (= start!23150 b!242729))

(declare-fun m!261601 () Bool)

(assert (=> b!242747 m!261601))

(declare-fun m!261603 () Bool)

(assert (=> b!242726 m!261603))

(declare-fun m!261605 () Bool)

(assert (=> b!242745 m!261605))

(declare-fun m!261607 () Bool)

(assert (=> b!242742 m!261607))

(declare-fun m!261609 () Bool)

(assert (=> b!242742 m!261609))

(assert (=> b!242742 m!261609))

(declare-fun m!261611 () Bool)

(assert (=> b!242742 m!261611))

(declare-fun m!261613 () Bool)

(assert (=> b!242736 m!261613))

(declare-fun m!261615 () Bool)

(assert (=> b!242731 m!261615))

(declare-fun m!261617 () Bool)

(assert (=> b!242735 m!261617))

(assert (=> b!242728 m!261603))

(declare-fun m!261619 () Bool)

(assert (=> mapNonEmpty!10804 m!261619))

(declare-fun m!261621 () Bool)

(assert (=> b!242743 m!261621))

(declare-fun m!261623 () Bool)

(assert (=> b!242734 m!261623))

(declare-fun m!261625 () Bool)

(assert (=> b!242730 m!261625))

(declare-fun m!261627 () Bool)

(assert (=> bm!22605 m!261627))

(declare-fun m!261629 () Bool)

(assert (=> b!242749 m!261629))

(declare-fun m!261631 () Bool)

(assert (=> bm!22604 m!261631))

(declare-fun m!261633 () Bool)

(assert (=> b!242729 m!261633))

(declare-fun m!261635 () Bool)

(assert (=> b!242729 m!261635))

(assert (=> b!242740 m!261627))

(declare-fun m!261637 () Bool)

(assert (=> start!23150 m!261637))

(check-sat (not b!242726) (not b!242735) (not bm!22604) (not start!23150) (not b!242742) (not b!242730) (not b!242734) (not b!242743) (not b_next!6511) (not b!242736) b_and!13503 tp_is_empty!6373 (not b!242749) (not b!242728) (not b!242729) (not b!242731) (not b!242740) (not bm!22605) (not mapNonEmpty!10804))
(check-sat b_and!13503 (not b_next!6511))
(get-model)

(declare-fun d!60073 () Bool)

(declare-fun res!119038 () Bool)

(declare-fun e!157646 () Bool)

(assert (=> d!60073 (=> res!119038 e!157646)))

(assert (=> d!60073 (= res!119038 ((_ is Nil!3556) Nil!3556))))

(assert (=> d!60073 (= (noDuplicate!90 Nil!3556) e!157646)))

(declare-fun b!242917 () Bool)

(declare-fun e!157647 () Bool)

(assert (=> b!242917 (= e!157646 e!157647)))

(declare-fun res!119039 () Bool)

(assert (=> b!242917 (=> (not res!119039) (not e!157647))))

(assert (=> b!242917 (= res!119039 (not (contains!1725 (t!8554 Nil!3556) (h!4212 Nil!3556))))))

(declare-fun b!242918 () Bool)

(assert (=> b!242918 (= e!157647 (noDuplicate!90 (t!8554 Nil!3556)))))

(assert (= (and d!60073 (not res!119038)) b!242917))

(assert (= (and b!242917 res!119039) b!242918))

(declare-fun m!261715 () Bool)

(assert (=> b!242917 m!261715))

(declare-fun m!261717 () Bool)

(assert (=> b!242918 m!261717))

(assert (=> b!242743 d!60073))

(declare-fun d!60075 () Bool)

(assert (=> d!60075 (= (inRange!0 (ite c!40518 (index!6306 lt!121952) (index!6309 lt!121952)) (mask!10583 thiss!1504)) (and (bvsge (ite c!40518 (index!6306 lt!121952) (index!6309 lt!121952)) #b00000000000000000000000000000000) (bvslt (ite c!40518 (index!6306 lt!121952) (index!6309 lt!121952)) (bvadd (mask!10583 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22604 d!60075))

(declare-fun d!60077 () Bool)

(assert (=> d!60077 (= (inRange!0 index!297 (mask!10583 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10583 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242742 d!60077))

(declare-fun d!60079 () Bool)

(declare-fun e!157652 () Bool)

(assert (=> d!60079 e!157652))

(declare-fun res!119042 () Bool)

(assert (=> d!60079 (=> res!119042 e!157652)))

(declare-fun lt!122001 () Bool)

(assert (=> d!60079 (= res!119042 (not lt!122001))))

(declare-fun lt!122002 () Bool)

(assert (=> d!60079 (= lt!122001 lt!122002)))

(declare-fun lt!122000 () Unit!7462)

(declare-fun e!157653 () Unit!7462)

(assert (=> d!60079 (= lt!122000 e!157653)))

(declare-fun c!40546 () Bool)

(assert (=> d!60079 (= c!40546 lt!122002)))

(declare-fun containsKey!275 (List!3560 (_ BitVec 64)) Bool)

(assert (=> d!60079 (= lt!122002 (containsKey!275 (toList!1818 (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932))))

(assert (=> d!60079 (= (contains!1726 (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) key!932) lt!122001)))

(declare-fun b!242925 () Bool)

(declare-fun lt!122003 () Unit!7462)

(assert (=> b!242925 (= e!157653 lt!122003)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!223 (List!3560 (_ BitVec 64)) Unit!7462)

(assert (=> b!242925 (= lt!122003 (lemmaContainsKeyImpliesGetValueByKeyDefined!223 (toList!1818 (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932))))

(declare-datatypes ((Option!290 0))(
  ( (Some!289 (v!5279 V!8145)) (None!288) )
))
(declare-fun isDefined!224 (Option!290) Bool)

(declare-fun getValueByKey!284 (List!3560 (_ BitVec 64)) Option!290)

(assert (=> b!242925 (isDefined!224 (getValueByKey!284 (toList!1818 (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932))))

(declare-fun b!242926 () Bool)

(declare-fun Unit!7475 () Unit!7462)

(assert (=> b!242926 (= e!157653 Unit!7475)))

(declare-fun b!242927 () Bool)

(assert (=> b!242927 (= e!157652 (isDefined!224 (getValueByKey!284 (toList!1818 (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504))) key!932)))))

(assert (= (and d!60079 c!40546) b!242925))

(assert (= (and d!60079 (not c!40546)) b!242926))

(assert (= (and d!60079 (not res!119042)) b!242927))

(declare-fun m!261719 () Bool)

(assert (=> d!60079 m!261719))

(declare-fun m!261721 () Bool)

(assert (=> b!242925 m!261721))

(declare-fun m!261723 () Bool)

(assert (=> b!242925 m!261723))

(assert (=> b!242925 m!261723))

(declare-fun m!261725 () Bool)

(assert (=> b!242925 m!261725))

(assert (=> b!242927 m!261723))

(assert (=> b!242927 m!261723))

(assert (=> b!242927 m!261725))

(assert (=> b!242742 d!60079))

(declare-fun b!242970 () Bool)

(declare-fun e!157691 () Bool)

(declare-fun call!22637 () Bool)

(assert (=> b!242970 (= e!157691 (not call!22637))))

(declare-fun b!242971 () Bool)

(declare-fun e!157692 () Bool)

(declare-fun lt!122064 () ListLongMap!3605)

(declare-fun apply!225 (ListLongMap!3605 (_ BitVec 64)) V!8145)

(assert (=> b!242971 (= e!157692 (= (apply!225 lt!122064 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4339 thiss!1504)))))

(declare-fun b!242972 () Bool)

(declare-fun e!157686 () Bool)

(assert (=> b!242972 (= e!157691 e!157686)))

(declare-fun res!119063 () Bool)

(assert (=> b!242972 (= res!119063 call!22637)))

(assert (=> b!242972 (=> (not res!119063) (not e!157686))))

(declare-fun b!242973 () Bool)

(declare-fun e!157681 () ListLongMap!3605)

(declare-fun call!22639 () ListLongMap!3605)

(assert (=> b!242973 (= e!157681 call!22639)))

(declare-fun b!242974 () Bool)

(assert (=> b!242974 (= e!157686 (= (apply!225 lt!122064 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4339 thiss!1504)))))

(declare-fun b!242975 () Bool)

(declare-fun e!157685 () ListLongMap!3605)

(assert (=> b!242975 (= e!157685 e!157681)))

(declare-fun c!40563 () Bool)

(assert (=> b!242975 (= c!40563 (and (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22632 () Bool)

(declare-fun call!22636 () Bool)

(assert (=> bm!22632 (= call!22636 (contains!1726 lt!122064 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242976 () Bool)

(declare-fun res!119067 () Bool)

(declare-fun e!157689 () Bool)

(assert (=> b!242976 (=> (not res!119067) (not e!157689))))

(assert (=> b!242976 (= res!119067 e!157691)))

(declare-fun c!40562 () Bool)

(assert (=> b!242976 (= c!40562 (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!242977 () Bool)

(declare-fun e!157687 () Bool)

(assert (=> b!242977 (= e!157687 (not call!22636))))

(declare-fun bm!22633 () Bool)

(assert (=> bm!22633 (= call!22637 (contains!1726 lt!122064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242978 () Bool)

(declare-fun e!157690 () Bool)

(declare-fun get!2941 (ValueCell!2843 V!8145) V!8145)

(declare-fun dynLambda!568 (Int (_ BitVec 64)) V!8145)

(assert (=> b!242978 (= e!157690 (= (apply!225 lt!122064 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000)) (get!2941 (select (arr!5713 (_values!4481 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!568 (defaultEntry!4498 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6055 (_values!4481 thiss!1504))))))

(assert (=> b!242978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504))))))

(declare-fun b!242979 () Bool)

(declare-fun e!157680 () ListLongMap!3605)

(assert (=> b!242979 (= e!157680 call!22639)))

(declare-fun b!242980 () Bool)

(declare-fun res!119069 () Bool)

(assert (=> b!242980 (=> (not res!119069) (not e!157689))))

(declare-fun e!157684 () Bool)

(assert (=> b!242980 (= res!119069 e!157684)))

(declare-fun res!119068 () Bool)

(assert (=> b!242980 (=> res!119068 e!157684)))

(declare-fun e!157682 () Bool)

(assert (=> b!242980 (= res!119068 (not e!157682))))

(declare-fun res!119064 () Bool)

(assert (=> b!242980 (=> (not res!119064) (not e!157682))))

(assert (=> b!242980 (= res!119064 (bvslt #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504))))))

(declare-fun b!242981 () Bool)

(declare-fun call!22640 () ListLongMap!3605)

(assert (=> b!242981 (= e!157680 call!22640)))

(declare-fun bm!22634 () Bool)

(declare-fun call!22641 () ListLongMap!3605)

(declare-fun call!22635 () ListLongMap!3605)

(assert (=> bm!22634 (= call!22641 call!22635)))

(declare-fun b!242982 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242982 (= e!157682 (validKeyInArray!0 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242983 () Bool)

(declare-fun e!157688 () Unit!7462)

(declare-fun Unit!7476 () Unit!7462)

(assert (=> b!242983 (= e!157688 Unit!7476)))

(declare-fun b!242984 () Bool)

(declare-fun e!157683 () Bool)

(assert (=> b!242984 (= e!157683 (validKeyInArray!0 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242985 () Bool)

(declare-fun call!22638 () ListLongMap!3605)

(declare-fun +!652 (ListLongMap!3605 tuple2!4690) ListLongMap!3605)

(assert (=> b!242985 (= e!157685 (+!652 call!22638 (tuple2!4691 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4339 thiss!1504))))))

(declare-fun bm!22635 () Bool)

(assert (=> bm!22635 (= call!22640 call!22641)))

(declare-fun b!242986 () Bool)

(assert (=> b!242986 (= e!157684 e!157690)))

(declare-fun res!119065 () Bool)

(assert (=> b!242986 (=> (not res!119065) (not e!157690))))

(assert (=> b!242986 (= res!119065 (contains!1726 lt!122064 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504))))))

(declare-fun b!242987 () Bool)

(declare-fun c!40561 () Bool)

(assert (=> b!242987 (= c!40561 (and (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!242987 (= e!157681 e!157680)))

(declare-fun d!60081 () Bool)

(assert (=> d!60081 e!157689))

(declare-fun res!119062 () Bool)

(assert (=> d!60081 (=> (not res!119062) (not e!157689))))

(assert (=> d!60081 (= res!119062 (or (bvsge #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504))))))))

(declare-fun lt!122048 () ListLongMap!3605)

(assert (=> d!60081 (= lt!122064 lt!122048)))

(declare-fun lt!122049 () Unit!7462)

(assert (=> d!60081 (= lt!122049 e!157688)))

(declare-fun c!40559 () Bool)

(assert (=> d!60081 (= c!40559 e!157683)))

(declare-fun res!119066 () Bool)

(assert (=> d!60081 (=> (not res!119066) (not e!157683))))

(assert (=> d!60081 (= res!119066 (bvslt #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504))))))

(assert (=> d!60081 (= lt!122048 e!157685)))

(declare-fun c!40560 () Bool)

(assert (=> d!60081 (= c!40560 (and (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60081 (validMask!0 (mask!10583 thiss!1504))))

(assert (=> d!60081 (= (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) lt!122064)))

(declare-fun bm!22636 () Bool)

(assert (=> bm!22636 (= call!22638 (+!652 (ite c!40560 call!22635 (ite c!40563 call!22641 call!22640)) (ite (or c!40560 c!40563) (tuple2!4691 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4339 thiss!1504)) (tuple2!4691 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4339 thiss!1504)))))))

(declare-fun b!242988 () Bool)

(declare-fun lt!122055 () Unit!7462)

(assert (=> b!242988 (= e!157688 lt!122055)))

(declare-fun lt!122063 () ListLongMap!3605)

(declare-fun getCurrentListMapNoExtraKeys!541 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 32) Int) ListLongMap!3605)

(assert (=> b!242988 (= lt!122063 (getCurrentListMapNoExtraKeys!541 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!122054 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122068 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122068 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122060 () Unit!7462)

(declare-fun addStillContains!201 (ListLongMap!3605 (_ BitVec 64) V!8145 (_ BitVec 64)) Unit!7462)

(assert (=> b!242988 (= lt!122060 (addStillContains!201 lt!122063 lt!122054 (zeroValue!4339 thiss!1504) lt!122068))))

(assert (=> b!242988 (contains!1726 (+!652 lt!122063 (tuple2!4691 lt!122054 (zeroValue!4339 thiss!1504))) lt!122068)))

(declare-fun lt!122056 () Unit!7462)

(assert (=> b!242988 (= lt!122056 lt!122060)))

(declare-fun lt!122057 () ListLongMap!3605)

(assert (=> b!242988 (= lt!122057 (getCurrentListMapNoExtraKeys!541 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!122061 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122061 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122062 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122062 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122058 () Unit!7462)

(declare-fun addApplyDifferent!201 (ListLongMap!3605 (_ BitVec 64) V!8145 (_ BitVec 64)) Unit!7462)

(assert (=> b!242988 (= lt!122058 (addApplyDifferent!201 lt!122057 lt!122061 (minValue!4339 thiss!1504) lt!122062))))

(assert (=> b!242988 (= (apply!225 (+!652 lt!122057 (tuple2!4691 lt!122061 (minValue!4339 thiss!1504))) lt!122062) (apply!225 lt!122057 lt!122062))))

(declare-fun lt!122069 () Unit!7462)

(assert (=> b!242988 (= lt!122069 lt!122058)))

(declare-fun lt!122053 () ListLongMap!3605)

(assert (=> b!242988 (= lt!122053 (getCurrentListMapNoExtraKeys!541 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!122052 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122050 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122050 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122051 () Unit!7462)

(assert (=> b!242988 (= lt!122051 (addApplyDifferent!201 lt!122053 lt!122052 (zeroValue!4339 thiss!1504) lt!122050))))

(assert (=> b!242988 (= (apply!225 (+!652 lt!122053 (tuple2!4691 lt!122052 (zeroValue!4339 thiss!1504))) lt!122050) (apply!225 lt!122053 lt!122050))))

(declare-fun lt!122067 () Unit!7462)

(assert (=> b!242988 (= lt!122067 lt!122051)))

(declare-fun lt!122065 () ListLongMap!3605)

(assert (=> b!242988 (= lt!122065 (getCurrentListMapNoExtraKeys!541 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun lt!122059 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122059 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122066 () (_ BitVec 64))

(assert (=> b!242988 (= lt!122066 (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242988 (= lt!122055 (addApplyDifferent!201 lt!122065 lt!122059 (minValue!4339 thiss!1504) lt!122066))))

(assert (=> b!242988 (= (apply!225 (+!652 lt!122065 (tuple2!4691 lt!122059 (minValue!4339 thiss!1504))) lt!122066) (apply!225 lt!122065 lt!122066))))

(declare-fun bm!22637 () Bool)

(assert (=> bm!22637 (= call!22635 (getCurrentListMapNoExtraKeys!541 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(declare-fun b!242989 () Bool)

(assert (=> b!242989 (= e!157689 e!157687)))

(declare-fun c!40564 () Bool)

(assert (=> b!242989 (= c!40564 (not (= (bvand (extraKeys!4235 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22638 () Bool)

(assert (=> bm!22638 (= call!22639 call!22638)))

(declare-fun b!242990 () Bool)

(assert (=> b!242990 (= e!157687 e!157692)))

(declare-fun res!119061 () Bool)

(assert (=> b!242990 (= res!119061 call!22636)))

(assert (=> b!242990 (=> (not res!119061) (not e!157692))))

(assert (= (and d!60081 c!40560) b!242985))

(assert (= (and d!60081 (not c!40560)) b!242975))

(assert (= (and b!242975 c!40563) b!242973))

(assert (= (and b!242975 (not c!40563)) b!242987))

(assert (= (and b!242987 c!40561) b!242979))

(assert (= (and b!242987 (not c!40561)) b!242981))

(assert (= (or b!242979 b!242981) bm!22635))

(assert (= (or b!242973 bm!22635) bm!22634))

(assert (= (or b!242973 b!242979) bm!22638))

(assert (= (or b!242985 bm!22634) bm!22637))

(assert (= (or b!242985 bm!22638) bm!22636))

(assert (= (and d!60081 res!119066) b!242984))

(assert (= (and d!60081 c!40559) b!242988))

(assert (= (and d!60081 (not c!40559)) b!242983))

(assert (= (and d!60081 res!119062) b!242980))

(assert (= (and b!242980 res!119064) b!242982))

(assert (= (and b!242980 (not res!119068)) b!242986))

(assert (= (and b!242986 res!119065) b!242978))

(assert (= (and b!242980 res!119069) b!242976))

(assert (= (and b!242976 c!40562) b!242972))

(assert (= (and b!242976 (not c!40562)) b!242970))

(assert (= (and b!242972 res!119063) b!242974))

(assert (= (or b!242972 b!242970) bm!22633))

(assert (= (and b!242976 res!119067) b!242989))

(assert (= (and b!242989 c!40564) b!242990))

(assert (= (and b!242989 (not c!40564)) b!242977))

(assert (= (and b!242990 res!119061) b!242971))

(assert (= (or b!242990 b!242977) bm!22632))

(declare-fun b_lambda!8025 () Bool)

(assert (=> (not b_lambda!8025) (not b!242978)))

(declare-fun t!8560 () Bool)

(declare-fun tb!2955 () Bool)

(assert (=> (and b!242729 (= (defaultEntry!4498 thiss!1504) (defaultEntry!4498 thiss!1504)) t!8560) tb!2955))

(declare-fun result!5203 () Bool)

(assert (=> tb!2955 (= result!5203 tp_is_empty!6373)))

(assert (=> b!242978 t!8560))

(declare-fun b_and!13509 () Bool)

(assert (= b_and!13503 (and (=> t!8560 result!5203) b_and!13509)))

(declare-fun m!261727 () Bool)

(assert (=> bm!22637 m!261727))

(declare-fun m!261729 () Bool)

(assert (=> b!242985 m!261729))

(declare-fun m!261731 () Bool)

(assert (=> b!242988 m!261731))

(declare-fun m!261733 () Bool)

(assert (=> b!242988 m!261733))

(declare-fun m!261735 () Bool)

(assert (=> b!242988 m!261735))

(declare-fun m!261737 () Bool)

(assert (=> b!242988 m!261737))

(declare-fun m!261739 () Bool)

(assert (=> b!242988 m!261739))

(declare-fun m!261741 () Bool)

(assert (=> b!242988 m!261741))

(declare-fun m!261743 () Bool)

(assert (=> b!242988 m!261743))

(declare-fun m!261745 () Bool)

(assert (=> b!242988 m!261745))

(assert (=> b!242988 m!261745))

(declare-fun m!261747 () Bool)

(assert (=> b!242988 m!261747))

(declare-fun m!261749 () Bool)

(assert (=> b!242988 m!261749))

(declare-fun m!261751 () Bool)

(assert (=> b!242988 m!261751))

(assert (=> b!242988 m!261731))

(declare-fun m!261753 () Bool)

(assert (=> b!242988 m!261753))

(declare-fun m!261755 () Bool)

(assert (=> b!242988 m!261755))

(assert (=> b!242988 m!261749))

(declare-fun m!261757 () Bool)

(assert (=> b!242988 m!261757))

(declare-fun m!261759 () Bool)

(assert (=> b!242988 m!261759))

(assert (=> b!242988 m!261727))

(assert (=> b!242988 m!261751))

(declare-fun m!261761 () Bool)

(assert (=> b!242988 m!261761))

(declare-fun m!261763 () Bool)

(assert (=> bm!22636 m!261763))

(assert (=> b!242982 m!261743))

(assert (=> b!242982 m!261743))

(declare-fun m!261765 () Bool)

(assert (=> b!242982 m!261765))

(declare-fun m!261767 () Bool)

(assert (=> b!242974 m!261767))

(declare-fun m!261769 () Bool)

(assert (=> b!242971 m!261769))

(assert (=> b!242984 m!261743))

(assert (=> b!242984 m!261743))

(assert (=> b!242984 m!261765))

(declare-fun m!261771 () Bool)

(assert (=> b!242978 m!261771))

(assert (=> b!242978 m!261743))

(declare-fun m!261773 () Bool)

(assert (=> b!242978 m!261773))

(declare-fun m!261775 () Bool)

(assert (=> b!242978 m!261775))

(assert (=> b!242978 m!261771))

(declare-fun m!261777 () Bool)

(assert (=> b!242978 m!261777))

(assert (=> b!242978 m!261775))

(assert (=> b!242978 m!261743))

(declare-fun m!261779 () Bool)

(assert (=> bm!22633 m!261779))

(assert (=> b!242986 m!261743))

(assert (=> b!242986 m!261743))

(declare-fun m!261781 () Bool)

(assert (=> b!242986 m!261781))

(declare-fun m!261783 () Bool)

(assert (=> d!60081 m!261783))

(declare-fun m!261785 () Bool)

(assert (=> bm!22632 m!261785))

(assert (=> b!242742 d!60081))

(declare-fun d!60083 () Bool)

(declare-fun e!157695 () Bool)

(assert (=> d!60083 e!157695))

(declare-fun res!119074 () Bool)

(assert (=> d!60083 (=> (not res!119074) (not e!157695))))

(declare-fun lt!122075 () SeekEntryResult!1034)

(assert (=> d!60083 (= res!119074 ((_ is Found!1034) lt!122075))))

(assert (=> d!60083 (= lt!122075 (seekEntryOrOpen!0 key!932 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)))))

(declare-fun lt!122074 () Unit!7462)

(declare-fun choose!1138 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7462)

(assert (=> d!60083 (= lt!122074 (choose!1138 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(assert (=> d!60083 (validMask!0 (mask!10583 thiss!1504))))

(assert (=> d!60083 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)) lt!122074)))

(declare-fun b!242997 () Bool)

(declare-fun res!119075 () Bool)

(assert (=> b!242997 (=> (not res!119075) (not e!157695))))

(assert (=> b!242997 (= res!119075 (inRange!0 (index!6307 lt!122075) (mask!10583 thiss!1504)))))

(declare-fun b!242998 () Bool)

(assert (=> b!242998 (= e!157695 (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6307 lt!122075)) key!932))))

(assert (=> b!242998 (and (bvsge (index!6307 lt!122075) #b00000000000000000000000000000000) (bvslt (index!6307 lt!122075) (size!6056 (_keys!6607 thiss!1504))))))

(assert (= (and d!60083 res!119074) b!242997))

(assert (= (and b!242997 res!119075) b!242998))

(assert (=> d!60083 m!261617))

(declare-fun m!261787 () Bool)

(assert (=> d!60083 m!261787))

(assert (=> d!60083 m!261783))

(declare-fun m!261789 () Bool)

(assert (=> b!242997 m!261789))

(declare-fun m!261791 () Bool)

(assert (=> b!242998 m!261791))

(assert (=> b!242734 d!60083))

(declare-fun d!60085 () Bool)

(declare-fun lt!122078 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!160 (List!3559) (InoxSet (_ BitVec 64)))

(assert (=> d!60085 (= lt!122078 (select (content!160 Nil!3556) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157700 () Bool)

(assert (=> d!60085 (= lt!122078 e!157700)))

(declare-fun res!119080 () Bool)

(assert (=> d!60085 (=> (not res!119080) (not e!157700))))

(assert (=> d!60085 (= res!119080 ((_ is Cons!3555) Nil!3556))))

(assert (=> d!60085 (= (contains!1725 Nil!3556 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122078)))

(declare-fun b!243003 () Bool)

(declare-fun e!157701 () Bool)

(assert (=> b!243003 (= e!157700 e!157701)))

(declare-fun res!119081 () Bool)

(assert (=> b!243003 (=> res!119081 e!157701)))

(assert (=> b!243003 (= res!119081 (= (h!4212 Nil!3556) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243004 () Bool)

(assert (=> b!243004 (= e!157701 (contains!1725 (t!8554 Nil!3556) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60085 res!119080) b!243003))

(assert (= (and b!243003 (not res!119081)) b!243004))

(declare-fun m!261793 () Bool)

(assert (=> d!60085 m!261793))

(declare-fun m!261795 () Bool)

(assert (=> d!60085 m!261795))

(declare-fun m!261797 () Bool)

(assert (=> b!243004 m!261797))

(assert (=> b!242749 d!60085))

(declare-fun d!60087 () Bool)

(declare-fun res!119086 () Bool)

(declare-fun e!157706 () Bool)

(assert (=> d!60087 (=> res!119086 e!157706)))

(assert (=> d!60087 (= res!119086 (= (select (arr!5714 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60087 (= (arrayContainsKey!0 (_keys!6607 thiss!1504) key!932 #b00000000000000000000000000000000) e!157706)))

(declare-fun b!243009 () Bool)

(declare-fun e!157707 () Bool)

(assert (=> b!243009 (= e!157706 e!157707)))

(declare-fun res!119087 () Bool)

(assert (=> b!243009 (=> (not res!119087) (not e!157707))))

(assert (=> b!243009 (= res!119087 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6056 (_keys!6607 thiss!1504))))))

(declare-fun b!243010 () Bool)

(assert (=> b!243010 (= e!157707 (arrayContainsKey!0 (_keys!6607 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60087 (not res!119086)) b!243009))

(assert (= (and b!243009 res!119087) b!243010))

(assert (=> d!60087 m!261743))

(declare-fun m!261799 () Bool)

(assert (=> b!243010 m!261799))

(assert (=> b!242740 d!60087))

(declare-fun d!60089 () Bool)

(declare-fun lt!122079 () Bool)

(assert (=> d!60089 (= lt!122079 (select (content!160 Nil!3556) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157708 () Bool)

(assert (=> d!60089 (= lt!122079 e!157708)))

(declare-fun res!119088 () Bool)

(assert (=> d!60089 (=> (not res!119088) (not e!157708))))

(assert (=> d!60089 (= res!119088 ((_ is Cons!3555) Nil!3556))))

(assert (=> d!60089 (= (contains!1725 Nil!3556 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122079)))

(declare-fun b!243011 () Bool)

(declare-fun e!157709 () Bool)

(assert (=> b!243011 (= e!157708 e!157709)))

(declare-fun res!119089 () Bool)

(assert (=> b!243011 (=> res!119089 e!157709)))

(assert (=> b!243011 (= res!119089 (= (h!4212 Nil!3556) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243012 () Bool)

(assert (=> b!243012 (= e!157709 (contains!1725 (t!8554 Nil!3556) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60089 res!119088) b!243011))

(assert (= (and b!243011 (not res!119089)) b!243012))

(assert (=> d!60089 m!261793))

(declare-fun m!261801 () Bool)

(assert (=> d!60089 m!261801))

(declare-fun m!261803 () Bool)

(assert (=> b!243012 m!261803))

(assert (=> b!242731 d!60089))

(declare-fun d!60091 () Bool)

(assert (=> d!60091 (= (array_inv!3755 (_keys!6607 thiss!1504)) (bvsge (size!6056 (_keys!6607 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242729 d!60091))

(declare-fun d!60093 () Bool)

(assert (=> d!60093 (= (array_inv!3756 (_values!4481 thiss!1504)) (bvsge (size!6055 (_values!4481 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242729 d!60093))

(declare-fun b!243029 () Bool)

(declare-fun e!157720 () Bool)

(declare-fun call!22646 () Bool)

(assert (=> b!243029 (= e!157720 (not call!22646))))

(declare-fun bm!22643 () Bool)

(assert (=> bm!22643 (= call!22646 (arrayContainsKey!0 (_keys!6607 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243030 () Bool)

(declare-fun res!119098 () Bool)

(declare-fun e!157721 () Bool)

(assert (=> b!243030 (=> (not res!119098) (not e!157721))))

(declare-fun call!22647 () Bool)

(assert (=> b!243030 (= res!119098 call!22647)))

(declare-fun e!157719 () Bool)

(assert (=> b!243030 (= e!157719 e!157721)))

(declare-fun d!60095 () Bool)

(declare-fun e!157718 () Bool)

(assert (=> d!60095 e!157718))

(declare-fun c!40569 () Bool)

(declare-fun lt!122084 () SeekEntryResult!1034)

(assert (=> d!60095 (= c!40569 ((_ is MissingZero!1034) lt!122084))))

(assert (=> d!60095 (= lt!122084 (seekEntryOrOpen!0 key!932 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)))))

(declare-fun lt!122085 () Unit!7462)

(declare-fun choose!1139 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7462)

(assert (=> d!60095 (= lt!122085 (choose!1139 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(assert (=> d!60095 (validMask!0 (mask!10583 thiss!1504))))

(assert (=> d!60095 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!348 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)) lt!122085)))

(declare-fun b!243031 () Bool)

(assert (=> b!243031 (= e!157721 (not call!22646))))

(declare-fun bm!22644 () Bool)

(assert (=> bm!22644 (= call!22647 (inRange!0 (ite c!40569 (index!6306 lt!122084) (index!6309 lt!122084)) (mask!10583 thiss!1504)))))

(declare-fun b!243032 () Bool)

(assert (=> b!243032 (= e!157719 ((_ is Undefined!1034) lt!122084))))

(declare-fun b!243033 () Bool)

(assert (=> b!243033 (and (bvsge (index!6306 lt!122084) #b00000000000000000000000000000000) (bvslt (index!6306 lt!122084) (size!6056 (_keys!6607 thiss!1504))))))

(declare-fun res!119100 () Bool)

(assert (=> b!243033 (= res!119100 (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6306 lt!122084)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243033 (=> (not res!119100) (not e!157720))))

(declare-fun b!243034 () Bool)

(assert (=> b!243034 (= e!157718 e!157720)))

(declare-fun res!119101 () Bool)

(assert (=> b!243034 (= res!119101 call!22647)))

(assert (=> b!243034 (=> (not res!119101) (not e!157720))))

(declare-fun b!243035 () Bool)

(assert (=> b!243035 (= e!157718 e!157719)))

(declare-fun c!40570 () Bool)

(assert (=> b!243035 (= c!40570 ((_ is MissingVacant!1034) lt!122084))))

(declare-fun b!243036 () Bool)

(declare-fun res!119099 () Bool)

(assert (=> b!243036 (=> (not res!119099) (not e!157721))))

(assert (=> b!243036 (= res!119099 (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6309 lt!122084)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243036 (and (bvsge (index!6309 lt!122084) #b00000000000000000000000000000000) (bvslt (index!6309 lt!122084) (size!6056 (_keys!6607 thiss!1504))))))

(assert (= (and d!60095 c!40569) b!243034))

(assert (= (and d!60095 (not c!40569)) b!243035))

(assert (= (and b!243034 res!119101) b!243033))

(assert (= (and b!243033 res!119100) b!243029))

(assert (= (and b!243035 c!40570) b!243030))

(assert (= (and b!243035 (not c!40570)) b!243032))

(assert (= (and b!243030 res!119098) b!243036))

(assert (= (and b!243036 res!119099) b!243031))

(assert (= (or b!243034 b!243030) bm!22644))

(assert (= (or b!243029 b!243031) bm!22643))

(assert (=> bm!22643 m!261627))

(declare-fun m!261805 () Bool)

(assert (=> b!243033 m!261805))

(declare-fun m!261807 () Bool)

(assert (=> bm!22644 m!261807))

(declare-fun m!261809 () Bool)

(assert (=> b!243036 m!261809))

(assert (=> d!60095 m!261617))

(declare-fun m!261811 () Bool)

(assert (=> d!60095 m!261811))

(assert (=> d!60095 m!261783))

(assert (=> b!242730 d!60095))

(declare-fun d!60097 () Bool)

(declare-fun lt!122086 () Bool)

(assert (=> d!60097 (= lt!122086 (select (content!160 Nil!3556) key!932))))

(declare-fun e!157722 () Bool)

(assert (=> d!60097 (= lt!122086 e!157722)))

(declare-fun res!119102 () Bool)

(assert (=> d!60097 (=> (not res!119102) (not e!157722))))

(assert (=> d!60097 (= res!119102 ((_ is Cons!3555) Nil!3556))))

(assert (=> d!60097 (= (contains!1725 Nil!3556 key!932) lt!122086)))

(declare-fun b!243037 () Bool)

(declare-fun e!157723 () Bool)

(assert (=> b!243037 (= e!157722 e!157723)))

(declare-fun res!119103 () Bool)

(assert (=> b!243037 (=> res!119103 e!157723)))

(assert (=> b!243037 (= res!119103 (= (h!4212 Nil!3556) key!932))))

(declare-fun b!243038 () Bool)

(assert (=> b!243038 (= e!157723 (contains!1725 (t!8554 Nil!3556) key!932))))

(assert (= (and d!60097 res!119102) b!243037))

(assert (= (and b!243037 (not res!119103)) b!243038))

(assert (=> d!60097 m!261793))

(declare-fun m!261813 () Bool)

(assert (=> d!60097 m!261813))

(declare-fun m!261815 () Bool)

(assert (=> b!243038 m!261815))

(assert (=> b!242728 d!60097))

(assert (=> bm!22605 d!60087))

(declare-fun d!60099 () Bool)

(assert (=> d!60099 (contains!1726 (getCurrentListMap!1350 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) key!932)))

(declare-fun lt!122089 () Unit!7462)

(declare-fun choose!1140 (array!12033 array!12031 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) (_ BitVec 32) Int) Unit!7462)

(assert (=> d!60099 (= lt!122089 (choose!1140 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(assert (=> d!60099 (validMask!0 (mask!10583 thiss!1504))))

(assert (=> d!60099 (= (lemmaArrayContainsKeyThenInListMap!172 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)) lt!122089)))

(declare-fun bs!8884 () Bool)

(assert (= bs!8884 d!60099))

(assert (=> bs!8884 m!261609))

(assert (=> bs!8884 m!261609))

(assert (=> bs!8884 m!261611))

(declare-fun m!261817 () Bool)

(assert (=> bs!8884 m!261817))

(assert (=> bs!8884 m!261783))

(assert (=> b!242736 d!60099))

(declare-fun d!60101 () Bool)

(declare-fun res!119110 () Bool)

(declare-fun e!157726 () Bool)

(assert (=> d!60101 (=> (not res!119110) (not e!157726))))

(declare-fun simpleValid!248 (LongMapFixedSize!3586) Bool)

(assert (=> d!60101 (= res!119110 (simpleValid!248 thiss!1504))))

(assert (=> d!60101 (= (valid!1419 thiss!1504) e!157726)))

(declare-fun b!243045 () Bool)

(declare-fun res!119111 () Bool)

(assert (=> b!243045 (=> (not res!119111) (not e!157726))))

(declare-fun arrayCountValidKeys!0 (array!12033 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!243045 (= res!119111 (= (arrayCountValidKeys!0 (_keys!6607 thiss!1504) #b00000000000000000000000000000000 (size!6056 (_keys!6607 thiss!1504))) (_size!1842 thiss!1504)))))

(declare-fun b!243046 () Bool)

(declare-fun res!119112 () Bool)

(assert (=> b!243046 (=> (not res!119112) (not e!157726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12033 (_ BitVec 32)) Bool)

(assert (=> b!243046 (= res!119112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)))))

(declare-fun b!243047 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12033 (_ BitVec 32) List!3559) Bool)

(assert (=> b!243047 (= e!157726 (arrayNoDuplicates!0 (_keys!6607 thiss!1504) #b00000000000000000000000000000000 Nil!3556))))

(assert (= (and d!60101 res!119110) b!243045))

(assert (= (and b!243045 res!119111) b!243046))

(assert (= (and b!243046 res!119112) b!243047))

(declare-fun m!261819 () Bool)

(assert (=> d!60101 m!261819))

(declare-fun m!261821 () Bool)

(assert (=> b!243045 m!261821))

(declare-fun m!261823 () Bool)

(assert (=> b!243046 m!261823))

(declare-fun m!261825 () Bool)

(assert (=> b!243047 m!261825))

(assert (=> start!23150 d!60101))

(declare-fun b!243060 () Bool)

(declare-fun e!157733 () SeekEntryResult!1034)

(declare-fun lt!122096 () SeekEntryResult!1034)

(assert (=> b!243060 (= e!157733 (Found!1034 (index!6308 lt!122096)))))

(declare-fun b!243061 () Bool)

(declare-fun e!157735 () SeekEntryResult!1034)

(assert (=> b!243061 (= e!157735 Undefined!1034)))

(declare-fun b!243062 () Bool)

(declare-fun e!157734 () SeekEntryResult!1034)

(assert (=> b!243062 (= e!157734 (MissingZero!1034 (index!6308 lt!122096)))))

(declare-fun b!243063 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12033 (_ BitVec 32)) SeekEntryResult!1034)

(assert (=> b!243063 (= e!157734 (seekKeyOrZeroReturnVacant!0 (x!24258 lt!122096) (index!6308 lt!122096) (index!6308 lt!122096) key!932 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)))))

(declare-fun b!243065 () Bool)

(assert (=> b!243065 (= e!157735 e!157733)))

(declare-fun lt!122097 () (_ BitVec 64))

(assert (=> b!243065 (= lt!122097 (select (arr!5714 (_keys!6607 thiss!1504)) (index!6308 lt!122096)))))

(declare-fun c!40579 () Bool)

(assert (=> b!243065 (= c!40579 (= lt!122097 key!932))))

(declare-fun d!60103 () Bool)

(declare-fun lt!122098 () SeekEntryResult!1034)

(assert (=> d!60103 (and (or ((_ is Undefined!1034) lt!122098) (not ((_ is Found!1034) lt!122098)) (and (bvsge (index!6307 lt!122098) #b00000000000000000000000000000000) (bvslt (index!6307 lt!122098) (size!6056 (_keys!6607 thiss!1504))))) (or ((_ is Undefined!1034) lt!122098) ((_ is Found!1034) lt!122098) (not ((_ is MissingZero!1034) lt!122098)) (and (bvsge (index!6306 lt!122098) #b00000000000000000000000000000000) (bvslt (index!6306 lt!122098) (size!6056 (_keys!6607 thiss!1504))))) (or ((_ is Undefined!1034) lt!122098) ((_ is Found!1034) lt!122098) ((_ is MissingZero!1034) lt!122098) (not ((_ is MissingVacant!1034) lt!122098)) (and (bvsge (index!6309 lt!122098) #b00000000000000000000000000000000) (bvslt (index!6309 lt!122098) (size!6056 (_keys!6607 thiss!1504))))) (or ((_ is Undefined!1034) lt!122098) (ite ((_ is Found!1034) lt!122098) (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6307 lt!122098)) key!932) (ite ((_ is MissingZero!1034) lt!122098) (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6306 lt!122098)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1034) lt!122098) (= (select (arr!5714 (_keys!6607 thiss!1504)) (index!6309 lt!122098)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60103 (= lt!122098 e!157735)))

(declare-fun c!40577 () Bool)

(assert (=> d!60103 (= c!40577 (and ((_ is Intermediate!1034) lt!122096) (undefined!1846 lt!122096)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12033 (_ BitVec 32)) SeekEntryResult!1034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60103 (= lt!122096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10583 thiss!1504)) key!932 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)))))

(assert (=> d!60103 (validMask!0 (mask!10583 thiss!1504))))

(assert (=> d!60103 (= (seekEntryOrOpen!0 key!932 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)) lt!122098)))

(declare-fun b!243064 () Bool)

(declare-fun c!40578 () Bool)

(assert (=> b!243064 (= c!40578 (= lt!122097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243064 (= e!157733 e!157734)))

(assert (= (and d!60103 c!40577) b!243061))

(assert (= (and d!60103 (not c!40577)) b!243065))

(assert (= (and b!243065 c!40579) b!243060))

(assert (= (and b!243065 (not c!40579)) b!243064))

(assert (= (and b!243064 c!40578) b!243062))

(assert (= (and b!243064 (not c!40578)) b!243063))

(declare-fun m!261827 () Bool)

(assert (=> b!243063 m!261827))

(declare-fun m!261829 () Bool)

(assert (=> b!243065 m!261829))

(declare-fun m!261831 () Bool)

(assert (=> d!60103 m!261831))

(declare-fun m!261833 () Bool)

(assert (=> d!60103 m!261833))

(declare-fun m!261835 () Bool)

(assert (=> d!60103 m!261835))

(declare-fun m!261837 () Bool)

(assert (=> d!60103 m!261837))

(assert (=> d!60103 m!261835))

(declare-fun m!261839 () Bool)

(assert (=> d!60103 m!261839))

(assert (=> d!60103 m!261783))

(assert (=> b!242735 d!60103))

(assert (=> b!242726 d!60097))

(declare-fun condMapEmpty!10813 () Bool)

(declare-fun mapDefault!10813 () ValueCell!2843)

(assert (=> mapNonEmpty!10804 (= condMapEmpty!10813 (= mapRest!10804 ((as const (Array (_ BitVec 32) ValueCell!2843)) mapDefault!10813)))))

(declare-fun e!157740 () Bool)

(declare-fun mapRes!10813 () Bool)

(assert (=> mapNonEmpty!10804 (= tp!22750 (and e!157740 mapRes!10813))))

(declare-fun b!243072 () Bool)

(declare-fun e!157741 () Bool)

(assert (=> b!243072 (= e!157741 tp_is_empty!6373)))

(declare-fun mapIsEmpty!10813 () Bool)

(assert (=> mapIsEmpty!10813 mapRes!10813))

(declare-fun mapNonEmpty!10813 () Bool)

(declare-fun tp!22765 () Bool)

(assert (=> mapNonEmpty!10813 (= mapRes!10813 (and tp!22765 e!157741))))

(declare-fun mapRest!10813 () (Array (_ BitVec 32) ValueCell!2843))

(declare-fun mapKey!10813 () (_ BitVec 32))

(declare-fun mapValue!10813 () ValueCell!2843)

(assert (=> mapNonEmpty!10813 (= mapRest!10804 (store mapRest!10813 mapKey!10813 mapValue!10813))))

(declare-fun b!243073 () Bool)

(assert (=> b!243073 (= e!157740 tp_is_empty!6373)))

(assert (= (and mapNonEmpty!10804 condMapEmpty!10813) mapIsEmpty!10813))

(assert (= (and mapNonEmpty!10804 (not condMapEmpty!10813)) mapNonEmpty!10813))

(assert (= (and mapNonEmpty!10813 ((_ is ValueCellFull!2843) mapValue!10813)) b!243072))

(assert (= (and mapNonEmpty!10804 ((_ is ValueCellFull!2843) mapDefault!10813)) b!243073))

(declare-fun m!261841 () Bool)

(assert (=> mapNonEmpty!10813 m!261841))

(declare-fun b_lambda!8027 () Bool)

(assert (= b_lambda!8025 (or (and b!242729 b_free!6511) b_lambda!8027)))

(check-sat (not b!242986) (not b!243047) (not b!242917) (not b!243010) (not d!60089) (not d!60081) (not bm!22636) (not d!60099) (not b!243063) (not d!60085) (not b!243038) (not d!60095) (not b!243012) b_and!13509 (not b!242974) (not d!60079) (not b!242982) (not b!243004) (not b!242997) (not bm!22632) (not b!242927) (not bm!22633) (not d!60083) (not b!242925) (not b!242918) (not bm!22644) (not b!242971) (not b!242985) (not d!60103) (not b!242984) (not b!243045) (not b!242978) (not b_next!6511) (not mapNonEmpty!10813) (not b!242988) (not bm!22637) (not d!60097) (not b!243046) tp_is_empty!6373 (not d!60101) (not b_lambda!8027) (not bm!22643))
(check-sat b_and!13509 (not b_next!6511))

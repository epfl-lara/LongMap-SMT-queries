; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23924 () Bool)

(assert start!23924)

(declare-fun b!250757 () Bool)

(declare-fun b_free!6631 () Bool)

(declare-fun b_next!6631 () Bool)

(assert (=> b!250757 (= b_free!6631 (not b_next!6631))))

(declare-fun tp!23160 () Bool)

(declare-fun b_and!13667 () Bool)

(assert (=> b!250757 (= tp!23160 b_and!13667)))

(declare-fun b!250756 () Bool)

(declare-fun e!162621 () Bool)

(declare-fun e!162624 () Bool)

(assert (=> b!250756 (= e!162621 e!162624)))

(declare-fun res!122799 () Bool)

(assert (=> b!250756 (=> (not res!122799) (not e!162624))))

(declare-datatypes ((SeekEntryResult!1088 0))(
  ( (MissingZero!1088 (index!6522 (_ BitVec 32))) (Found!1088 (index!6523 (_ BitVec 32))) (Intermediate!1088 (undefined!1900 Bool) (index!6524 (_ BitVec 32)) (x!24656 (_ BitVec 32))) (Undefined!1088) (MissingVacant!1088 (index!6525 (_ BitVec 32))) )
))
(declare-fun lt!125688 () SeekEntryResult!1088)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!250756 (= res!122799 (or (= lt!125688 (MissingZero!1088 index!297)) (= lt!125688 (MissingVacant!1088 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8305 0))(
  ( (V!8306 (val!3291 Int)) )
))
(declare-datatypes ((ValueCell!2903 0))(
  ( (ValueCellFull!2903 (v!5358 V!8305)) (EmptyCell!2903) )
))
(declare-datatypes ((array!12303 0))(
  ( (array!12304 (arr!5833 (Array (_ BitVec 32) ValueCell!2903)) (size!6178 (_ BitVec 32))) )
))
(declare-datatypes ((array!12305 0))(
  ( (array!12306 (arr!5834 (Array (_ BitVec 32) (_ BitVec 64))) (size!6179 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3706 0))(
  ( (LongMapFixedSize!3707 (defaultEntry!4634 Int) (mask!10824 (_ BitVec 32)) (extraKeys!4371 (_ BitVec 32)) (zeroValue!4475 V!8305) (minValue!4475 V!8305) (_size!1902 (_ BitVec 32)) (_keys!6772 array!12305) (_values!4617 array!12303) (_vacant!1902 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3706)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12305 (_ BitVec 32)) SeekEntryResult!1088)

(assert (=> b!250756 (= lt!125688 (seekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun bm!23558 () Bool)

(declare-fun call!23561 () Bool)

(declare-fun arrayContainsKey!0 (array!12305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23558 (= call!23561 (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23559 () Bool)

(declare-fun call!23562 () Bool)

(declare-fun c!42153 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23559 (= call!23562 (inRange!0 (ite c!42153 (index!6522 lt!125688) (index!6525 lt!125688)) (mask!10824 thiss!1504)))))

(declare-fun b!250758 () Bool)

(declare-fun e!162632 () Bool)

(declare-fun tp_is_empty!6493 () Bool)

(assert (=> b!250758 (= e!162632 tp_is_empty!6493)))

(declare-fun b!250759 () Bool)

(declare-fun res!122800 () Bool)

(assert (=> b!250759 (=> (not res!122800) (not e!162621))))

(assert (=> b!250759 (= res!122800 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!250760 () Bool)

(declare-fun e!162633 () Bool)

(assert (=> b!250760 (= e!162624 e!162633)))

(declare-fun res!122806 () Bool)

(assert (=> b!250760 (=> (not res!122806) (not e!162633))))

(assert (=> b!250760 (= res!122806 (inRange!0 index!297 (mask!10824 thiss!1504)))))

(declare-datatypes ((Unit!7734 0))(
  ( (Unit!7735) )
))
(declare-fun lt!125687 () Unit!7734)

(declare-fun e!162634 () Unit!7734)

(assert (=> b!250760 (= lt!125687 e!162634)))

(declare-fun c!42155 () Bool)

(declare-datatypes ((tuple2!4768 0))(
  ( (tuple2!4769 (_1!2395 (_ BitVec 64)) (_2!2395 V!8305)) )
))
(declare-datatypes ((List!3644 0))(
  ( (Nil!3641) (Cons!3640 (h!4300 tuple2!4768) (t!8671 List!3644)) )
))
(declare-datatypes ((ListLongMap!3683 0))(
  ( (ListLongMap!3684 (toList!1857 List!3644)) )
))
(declare-fun contains!1795 (ListLongMap!3683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1389 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 32) Int) ListLongMap!3683)

(assert (=> b!250760 (= c!42155 (contains!1795 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932))))

(declare-fun b!250761 () Bool)

(declare-fun c!42154 () Bool)

(get-info :version)

(assert (=> b!250761 (= c!42154 ((_ is MissingVacant!1088) lt!125688))))

(declare-fun e!162629 () Bool)

(declare-fun e!162623 () Bool)

(assert (=> b!250761 (= e!162629 e!162623)))

(declare-fun mapIsEmpty!11035 () Bool)

(declare-fun mapRes!11035 () Bool)

(assert (=> mapIsEmpty!11035 mapRes!11035))

(declare-fun b!250762 () Bool)

(declare-fun e!162626 () Bool)

(assert (=> b!250762 (= e!162626 tp_is_empty!6493)))

(declare-fun b!250763 () Bool)

(declare-fun e!162627 () Bool)

(assert (=> b!250763 (= e!162633 (not e!162627))))

(declare-fun res!122798 () Bool)

(assert (=> b!250763 (=> res!122798 e!162627)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250763 (= res!122798 (not (validMask!0 (mask!10824 thiss!1504))))))

(declare-fun lt!125684 () array!12305)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12305 (_ BitVec 32)) Bool)

(assert (=> b!250763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125684 (mask!10824 thiss!1504))))

(declare-fun lt!125686 () Unit!7734)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12305 (_ BitVec 32) (_ BitVec 32)) Unit!7734)

(assert (=> b!250763 (= lt!125686 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) index!297 (mask!10824 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250763 (= (arrayCountValidKeys!0 lt!125684 #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6772 thiss!1504) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504)))))))

(declare-fun lt!125680 () Unit!7734)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12305 (_ BitVec 32) (_ BitVec 64)) Unit!7734)

(assert (=> b!250763 (= lt!125680 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6772 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3645 0))(
  ( (Nil!3642) (Cons!3641 (h!4301 (_ BitVec 64)) (t!8672 List!3645)) )
))
(declare-fun arrayNoDuplicates!0 (array!12305 (_ BitVec 32) List!3645) Bool)

(assert (=> b!250763 (arrayNoDuplicates!0 lt!125684 #b00000000000000000000000000000000 Nil!3642)))

(assert (=> b!250763 (= lt!125684 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun lt!125679 () Unit!7734)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3645) Unit!7734)

(assert (=> b!250763 (= lt!125679 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6772 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3642))))

(declare-fun lt!125683 () Unit!7734)

(declare-fun e!162628 () Unit!7734)

(assert (=> b!250763 (= lt!125683 e!162628)))

(declare-fun c!42156 () Bool)

(assert (=> b!250763 (= c!42156 (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250764 () Bool)

(declare-fun res!122803 () Bool)

(assert (=> b!250764 (= res!122803 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6525 lt!125688)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162630 () Bool)

(assert (=> b!250764 (=> (not res!122803) (not e!162630))))

(declare-fun b!250765 () Bool)

(declare-fun e!162622 () Bool)

(assert (=> b!250765 (= e!162622 (and e!162632 mapRes!11035))))

(declare-fun condMapEmpty!11035 () Bool)

(declare-fun mapDefault!11035 () ValueCell!2903)

(assert (=> b!250765 (= condMapEmpty!11035 (= (arr!5833 (_values!4617 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2903)) mapDefault!11035)))))

(declare-fun b!250766 () Bool)

(declare-fun Unit!7736 () Unit!7734)

(assert (=> b!250766 (= e!162628 Unit!7736)))

(declare-fun lt!125681 () Unit!7734)

(declare-fun lemmaArrayContainsKeyThenInListMap!214 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) (_ BitVec 32) Int) Unit!7734)

(assert (=> b!250766 (= lt!125681 (lemmaArrayContainsKeyThenInListMap!214 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(assert (=> b!250766 false))

(declare-fun b!250767 () Bool)

(assert (=> b!250767 (= e!162623 e!162630)))

(declare-fun res!122804 () Bool)

(assert (=> b!250767 (= res!122804 call!23562)))

(assert (=> b!250767 (=> (not res!122804) (not e!162630))))

(declare-fun b!250768 () Bool)

(assert (=> b!250768 (= e!162630 (not call!23561))))

(declare-fun mapNonEmpty!11035 () Bool)

(declare-fun tp!23161 () Bool)

(assert (=> mapNonEmpty!11035 (= mapRes!11035 (and tp!23161 e!162626))))

(declare-fun mapRest!11035 () (Array (_ BitVec 32) ValueCell!2903))

(declare-fun mapKey!11035 () (_ BitVec 32))

(declare-fun mapValue!11035 () ValueCell!2903)

(assert (=> mapNonEmpty!11035 (= (arr!5833 (_values!4617 thiss!1504)) (store mapRest!11035 mapKey!11035 mapValue!11035))))

(declare-fun b!250769 () Bool)

(declare-fun res!122801 () Bool)

(declare-fun e!162625 () Bool)

(assert (=> b!250769 (=> (not res!122801) (not e!162625))))

(assert (=> b!250769 (= res!122801 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6522 lt!125688)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162631 () Bool)

(declare-fun array_inv!3837 (array!12305) Bool)

(declare-fun array_inv!3838 (array!12303) Bool)

(assert (=> b!250757 (= e!162631 (and tp!23160 tp_is_empty!6493 (array_inv!3837 (_keys!6772 thiss!1504)) (array_inv!3838 (_values!4617 thiss!1504)) e!162622))))

(declare-fun res!122802 () Bool)

(assert (=> start!23924 (=> (not res!122802) (not e!162621))))

(declare-fun valid!1458 (LongMapFixedSize!3706) Bool)

(assert (=> start!23924 (= res!122802 (valid!1458 thiss!1504))))

(assert (=> start!23924 e!162621))

(assert (=> start!23924 e!162631))

(assert (=> start!23924 true))

(declare-fun b!250770 () Bool)

(assert (=> b!250770 (= e!162623 ((_ is Undefined!1088) lt!125688))))

(declare-fun b!250771 () Bool)

(declare-fun res!122805 () Bool)

(assert (=> b!250771 (=> (not res!122805) (not e!162625))))

(assert (=> b!250771 (= res!122805 call!23562)))

(assert (=> b!250771 (= e!162629 e!162625)))

(declare-fun b!250772 () Bool)

(assert (=> b!250772 (= e!162627 (or (not (= (size!6178 (_values!4617 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10824 thiss!1504)))) (not (= (size!6179 (_keys!6772 thiss!1504)) (size!6178 (_values!4617 thiss!1504)))) (bvslt (mask!10824 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4371 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!250773 () Bool)

(declare-fun lt!125685 () Unit!7734)

(assert (=> b!250773 (= e!162634 lt!125685)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7734)

(assert (=> b!250773 (= lt!125685 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> b!250773 (= c!42153 ((_ is MissingZero!1088) lt!125688))))

(assert (=> b!250773 e!162629))

(declare-fun b!250774 () Bool)

(declare-fun Unit!7737 () Unit!7734)

(assert (=> b!250774 (= e!162628 Unit!7737)))

(declare-fun b!250775 () Bool)

(assert (=> b!250775 (= e!162625 (not call!23561))))

(declare-fun b!250776 () Bool)

(declare-fun Unit!7738 () Unit!7734)

(assert (=> b!250776 (= e!162634 Unit!7738)))

(declare-fun lt!125682 () Unit!7734)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!394 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7734)

(assert (=> b!250776 (= lt!125682 (lemmaInListMapThenSeekEntryOrOpenFindsIt!394 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> b!250776 false))

(assert (= (and start!23924 res!122802) b!250759))

(assert (= (and b!250759 res!122800) b!250756))

(assert (= (and b!250756 res!122799) b!250760))

(assert (= (and b!250760 c!42155) b!250776))

(assert (= (and b!250760 (not c!42155)) b!250773))

(assert (= (and b!250773 c!42153) b!250771))

(assert (= (and b!250773 (not c!42153)) b!250761))

(assert (= (and b!250771 res!122805) b!250769))

(assert (= (and b!250769 res!122801) b!250775))

(assert (= (and b!250761 c!42154) b!250767))

(assert (= (and b!250761 (not c!42154)) b!250770))

(assert (= (and b!250767 res!122804) b!250764))

(assert (= (and b!250764 res!122803) b!250768))

(assert (= (or b!250771 b!250767) bm!23559))

(assert (= (or b!250775 b!250768) bm!23558))

(assert (= (and b!250760 res!122806) b!250763))

(assert (= (and b!250763 c!42156) b!250766))

(assert (= (and b!250763 (not c!42156)) b!250774))

(assert (= (and b!250763 (not res!122798)) b!250772))

(assert (= (and b!250765 condMapEmpty!11035) mapIsEmpty!11035))

(assert (= (and b!250765 (not condMapEmpty!11035)) mapNonEmpty!11035))

(assert (= (and mapNonEmpty!11035 ((_ is ValueCellFull!2903) mapValue!11035)) b!250762))

(assert (= (and b!250765 ((_ is ValueCellFull!2903) mapDefault!11035)) b!250758))

(assert (= b!250757 b!250765))

(assert (= start!23924 b!250757))

(declare-fun m!267247 () Bool)

(assert (=> start!23924 m!267247))

(declare-fun m!267249 () Bool)

(assert (=> b!250764 m!267249))

(declare-fun m!267251 () Bool)

(assert (=> b!250773 m!267251))

(declare-fun m!267253 () Bool)

(assert (=> b!250763 m!267253))

(declare-fun m!267255 () Bool)

(assert (=> b!250763 m!267255))

(declare-fun m!267257 () Bool)

(assert (=> b!250763 m!267257))

(declare-fun m!267259 () Bool)

(assert (=> b!250763 m!267259))

(declare-fun m!267261 () Bool)

(assert (=> b!250763 m!267261))

(declare-fun m!267263 () Bool)

(assert (=> b!250763 m!267263))

(declare-fun m!267265 () Bool)

(assert (=> b!250763 m!267265))

(declare-fun m!267267 () Bool)

(assert (=> b!250763 m!267267))

(declare-fun m!267269 () Bool)

(assert (=> b!250763 m!267269))

(declare-fun m!267271 () Bool)

(assert (=> b!250763 m!267271))

(declare-fun m!267273 () Bool)

(assert (=> bm!23559 m!267273))

(declare-fun m!267275 () Bool)

(assert (=> b!250776 m!267275))

(declare-fun m!267277 () Bool)

(assert (=> b!250757 m!267277))

(declare-fun m!267279 () Bool)

(assert (=> b!250757 m!267279))

(declare-fun m!267281 () Bool)

(assert (=> mapNonEmpty!11035 m!267281))

(declare-fun m!267283 () Bool)

(assert (=> b!250769 m!267283))

(declare-fun m!267285 () Bool)

(assert (=> b!250760 m!267285))

(declare-fun m!267287 () Bool)

(assert (=> b!250760 m!267287))

(assert (=> b!250760 m!267287))

(declare-fun m!267289 () Bool)

(assert (=> b!250760 m!267289))

(declare-fun m!267291 () Bool)

(assert (=> b!250756 m!267291))

(declare-fun m!267293 () Bool)

(assert (=> b!250766 m!267293))

(assert (=> bm!23558 m!267255))

(check-sat (not bm!23558) (not mapNonEmpty!11035) (not start!23924) (not b!250756) (not b!250757) (not b!250773) (not b!250763) (not b!250766) (not b_next!6631) tp_is_empty!6493 (not b!250760) (not b!250776) (not bm!23559) b_and!13667)
(check-sat b_and!13667 (not b_next!6631))
(get-model)

(declare-fun b!250912 () Bool)

(declare-fun res!122871 () Bool)

(declare-fun e!162729 () Bool)

(assert (=> b!250912 (=> (not res!122871) (not e!162729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!250912 (= res!122871 (validKeyInArray!0 key!932))))

(declare-fun b!250914 () Bool)

(declare-fun e!162730 () Bool)

(assert (=> b!250914 (= e!162730 (= (arrayCountValidKeys!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6772 thiss!1504) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!250913 () Bool)

(assert (=> b!250913 (= e!162729 (bvslt (size!6179 (_keys!6772 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!250911 () Bool)

(declare-fun res!122869 () Bool)

(assert (=> b!250911 (=> (not res!122869) (not e!162729))))

(assert (=> b!250911 (= res!122869 (not (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) index!297))))))

(declare-fun d!61047 () Bool)

(assert (=> d!61047 e!162730))

(declare-fun res!122872 () Bool)

(assert (=> d!61047 (=> (not res!122872) (not e!162730))))

(assert (=> d!61047 (= res!122872 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6179 (_keys!6772 thiss!1504)))))))

(declare-fun lt!125751 () Unit!7734)

(declare-fun choose!1 (array!12305 (_ BitVec 32) (_ BitVec 64)) Unit!7734)

(assert (=> d!61047 (= lt!125751 (choose!1 (_keys!6772 thiss!1504) index!297 key!932))))

(assert (=> d!61047 e!162729))

(declare-fun res!122870 () Bool)

(assert (=> d!61047 (=> (not res!122870) (not e!162729))))

(assert (=> d!61047 (= res!122870 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6179 (_keys!6772 thiss!1504)))))))

(assert (=> d!61047 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6772 thiss!1504) index!297 key!932) lt!125751)))

(assert (= (and d!61047 res!122870) b!250911))

(assert (= (and b!250911 res!122869) b!250912))

(assert (= (and b!250912 res!122871) b!250913))

(assert (= (and d!61047 res!122872) b!250914))

(declare-fun m!267391 () Bool)

(assert (=> b!250912 m!267391))

(assert (=> b!250914 m!267271))

(declare-fun m!267393 () Bool)

(assert (=> b!250914 m!267393))

(assert (=> b!250914 m!267265))

(declare-fun m!267395 () Bool)

(assert (=> b!250911 m!267395))

(assert (=> b!250911 m!267395))

(declare-fun m!267397 () Bool)

(assert (=> b!250911 m!267397))

(declare-fun m!267399 () Bool)

(assert (=> d!61047 m!267399))

(assert (=> b!250763 d!61047))

(declare-fun d!61049 () Bool)

(assert (=> d!61049 (= (validMask!0 (mask!10824 thiss!1504)) (and (or (= (mask!10824 thiss!1504) #b00000000000000000000000000000111) (= (mask!10824 thiss!1504) #b00000000000000000000000000001111) (= (mask!10824 thiss!1504) #b00000000000000000000000000011111) (= (mask!10824 thiss!1504) #b00000000000000000000000000111111) (= (mask!10824 thiss!1504) #b00000000000000000000000001111111) (= (mask!10824 thiss!1504) #b00000000000000000000000011111111) (= (mask!10824 thiss!1504) #b00000000000000000000000111111111) (= (mask!10824 thiss!1504) #b00000000000000000000001111111111) (= (mask!10824 thiss!1504) #b00000000000000000000011111111111) (= (mask!10824 thiss!1504) #b00000000000000000000111111111111) (= (mask!10824 thiss!1504) #b00000000000000000001111111111111) (= (mask!10824 thiss!1504) #b00000000000000000011111111111111) (= (mask!10824 thiss!1504) #b00000000000000000111111111111111) (= (mask!10824 thiss!1504) #b00000000000000001111111111111111) (= (mask!10824 thiss!1504) #b00000000000000011111111111111111) (= (mask!10824 thiss!1504) #b00000000000000111111111111111111) (= (mask!10824 thiss!1504) #b00000000000001111111111111111111) (= (mask!10824 thiss!1504) #b00000000000011111111111111111111) (= (mask!10824 thiss!1504) #b00000000000111111111111111111111) (= (mask!10824 thiss!1504) #b00000000001111111111111111111111) (= (mask!10824 thiss!1504) #b00000000011111111111111111111111) (= (mask!10824 thiss!1504) #b00000000111111111111111111111111) (= (mask!10824 thiss!1504) #b00000001111111111111111111111111) (= (mask!10824 thiss!1504) #b00000011111111111111111111111111) (= (mask!10824 thiss!1504) #b00000111111111111111111111111111) (= (mask!10824 thiss!1504) #b00001111111111111111111111111111) (= (mask!10824 thiss!1504) #b00011111111111111111111111111111) (= (mask!10824 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10824 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!250763 d!61049))

(declare-fun bm!23574 () Bool)

(declare-fun call!23577 () (_ BitVec 32))

(assert (=> bm!23574 (= call!23577 (arrayCountValidKeys!0 lt!125684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!250923 () Bool)

(declare-fun e!162735 () (_ BitVec 32))

(assert (=> b!250923 (= e!162735 call!23577)))

(declare-fun b!250924 () Bool)

(declare-fun e!162736 () (_ BitVec 32))

(assert (=> b!250924 (= e!162736 e!162735)))

(declare-fun c!42185 () Bool)

(assert (=> b!250924 (= c!42185 (validKeyInArray!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun b!250925 () Bool)

(assert (=> b!250925 (= e!162736 #b00000000000000000000000000000000)))

(declare-fun b!250926 () Bool)

(assert (=> b!250926 (= e!162735 (bvadd #b00000000000000000000000000000001 call!23577))))

(declare-fun d!61051 () Bool)

(declare-fun lt!125754 () (_ BitVec 32))

(assert (=> d!61051 (and (bvsge lt!125754 #b00000000000000000000000000000000) (bvsle lt!125754 (bvsub (size!6179 lt!125684) #b00000000000000000000000000000000)))))

(assert (=> d!61051 (= lt!125754 e!162736)))

(declare-fun c!42186 () Bool)

(assert (=> d!61051 (= c!42186 (bvsge #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61051 (and (bvsle #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6179 (_keys!6772 thiss!1504)) (size!6179 lt!125684)))))

(assert (=> d!61051 (= (arrayCountValidKeys!0 lt!125684 #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) lt!125754)))

(assert (= (and d!61051 c!42186) b!250925))

(assert (= (and d!61051 (not c!42186)) b!250924))

(assert (= (and b!250924 c!42185) b!250926))

(assert (= (and b!250924 (not c!42185)) b!250923))

(assert (= (or b!250926 b!250923) bm!23574))

(declare-fun m!267401 () Bool)

(assert (=> bm!23574 m!267401))

(declare-fun m!267403 () Bool)

(assert (=> b!250924 m!267403))

(assert (=> b!250924 m!267403))

(declare-fun m!267405 () Bool)

(assert (=> b!250924 m!267405))

(assert (=> b!250763 d!61051))

(declare-fun b!250937 () Bool)

(declare-fun e!162748 () Bool)

(declare-fun e!162746 () Bool)

(assert (=> b!250937 (= e!162748 e!162746)))

(declare-fun res!122880 () Bool)

(assert (=> b!250937 (=> (not res!122880) (not e!162746))))

(declare-fun e!162747 () Bool)

(assert (=> b!250937 (= res!122880 (not e!162747))))

(declare-fun res!122881 () Bool)

(assert (=> b!250937 (=> (not res!122881) (not e!162747))))

(assert (=> b!250937 (= res!122881 (validKeyInArray!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun bm!23577 () Bool)

(declare-fun call!23580 () Bool)

(declare-fun c!42189 () Bool)

(assert (=> bm!23577 (= call!23580 (arrayNoDuplicates!0 lt!125684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42189 (Cons!3641 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) Nil!3642) Nil!3642)))))

(declare-fun b!250938 () Bool)

(declare-fun e!162745 () Bool)

(assert (=> b!250938 (= e!162746 e!162745)))

(assert (=> b!250938 (= c!42189 (validKeyInArray!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun b!250939 () Bool)

(assert (=> b!250939 (= e!162745 call!23580)))

(declare-fun b!250940 () Bool)

(declare-fun contains!1796 (List!3645 (_ BitVec 64)) Bool)

(assert (=> b!250940 (= e!162747 (contains!1796 Nil!3642 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun d!61053 () Bool)

(declare-fun res!122879 () Bool)

(assert (=> d!61053 (=> res!122879 e!162748)))

(assert (=> d!61053 (= res!122879 (bvsge #b00000000000000000000000000000000 (size!6179 lt!125684)))))

(assert (=> d!61053 (= (arrayNoDuplicates!0 lt!125684 #b00000000000000000000000000000000 Nil!3642) e!162748)))

(declare-fun b!250941 () Bool)

(assert (=> b!250941 (= e!162745 call!23580)))

(assert (= (and d!61053 (not res!122879)) b!250937))

(assert (= (and b!250937 res!122881) b!250940))

(assert (= (and b!250937 res!122880) b!250938))

(assert (= (and b!250938 c!42189) b!250941))

(assert (= (and b!250938 (not c!42189)) b!250939))

(assert (= (or b!250941 b!250939) bm!23577))

(assert (=> b!250937 m!267403))

(assert (=> b!250937 m!267403))

(assert (=> b!250937 m!267405))

(assert (=> bm!23577 m!267403))

(declare-fun m!267407 () Bool)

(assert (=> bm!23577 m!267407))

(assert (=> b!250938 m!267403))

(assert (=> b!250938 m!267403))

(assert (=> b!250938 m!267405))

(assert (=> b!250940 m!267403))

(assert (=> b!250940 m!267403))

(declare-fun m!267409 () Bool)

(assert (=> b!250940 m!267409))

(assert (=> b!250763 d!61053))

(declare-fun d!61055 () Bool)

(declare-fun e!162751 () Bool)

(assert (=> d!61055 e!162751))

(declare-fun res!122884 () Bool)

(assert (=> d!61055 (=> (not res!122884) (not e!162751))))

(assert (=> d!61055 (= res!122884 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6179 (_keys!6772 thiss!1504)))))))

(declare-fun lt!125757 () Unit!7734)

(declare-fun choose!41 (array!12305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3645) Unit!7734)

(assert (=> d!61055 (= lt!125757 (choose!41 (_keys!6772 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3642))))

(assert (=> d!61055 (bvslt (size!6179 (_keys!6772 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61055 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6772 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3642) lt!125757)))

(declare-fun b!250944 () Bool)

(assert (=> b!250944 (= e!162751 (arrayNoDuplicates!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000000 Nil!3642))))

(assert (= (and d!61055 res!122884) b!250944))

(declare-fun m!267411 () Bool)

(assert (=> d!61055 m!267411))

(assert (=> b!250944 m!267271))

(declare-fun m!267413 () Bool)

(assert (=> b!250944 m!267413))

(assert (=> b!250763 d!61055))

(declare-fun d!61057 () Bool)

(declare-fun res!122889 () Bool)

(declare-fun e!162756 () Bool)

(assert (=> d!61057 (=> res!122889 e!162756)))

(assert (=> d!61057 (= res!122889 (= (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61057 (= (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 #b00000000000000000000000000000000) e!162756)))

(declare-fun b!250949 () Bool)

(declare-fun e!162757 () Bool)

(assert (=> b!250949 (= e!162756 e!162757)))

(declare-fun res!122890 () Bool)

(assert (=> b!250949 (=> (not res!122890) (not e!162757))))

(assert (=> b!250949 (= res!122890 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!250950 () Bool)

(assert (=> b!250950 (= e!162757 (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61057 (not res!122889)) b!250949))

(assert (= (and b!250949 res!122890) b!250950))

(declare-fun m!267415 () Bool)

(assert (=> d!61057 m!267415))

(declare-fun m!267417 () Bool)

(assert (=> b!250950 m!267417))

(assert (=> b!250763 d!61057))

(declare-fun d!61059 () Bool)

(declare-fun e!162760 () Bool)

(assert (=> d!61059 e!162760))

(declare-fun res!122893 () Bool)

(assert (=> d!61059 (=> (not res!122893) (not e!162760))))

(assert (=> d!61059 (= res!122893 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6179 (_keys!6772 thiss!1504)))))))

(declare-fun lt!125760 () Unit!7734)

(declare-fun choose!102 ((_ BitVec 64) array!12305 (_ BitVec 32) (_ BitVec 32)) Unit!7734)

(assert (=> d!61059 (= lt!125760 (choose!102 key!932 (_keys!6772 thiss!1504) index!297 (mask!10824 thiss!1504)))))

(assert (=> d!61059 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61059 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) index!297 (mask!10824 thiss!1504)) lt!125760)))

(declare-fun b!250953 () Bool)

(assert (=> b!250953 (= e!162760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) (mask!10824 thiss!1504)))))

(assert (= (and d!61059 res!122893) b!250953))

(declare-fun m!267419 () Bool)

(assert (=> d!61059 m!267419))

(assert (=> d!61059 m!267253))

(assert (=> b!250953 m!267271))

(declare-fun m!267421 () Bool)

(assert (=> b!250953 m!267421))

(assert (=> b!250763 d!61059))

(declare-fun bm!23578 () Bool)

(declare-fun call!23581 () (_ BitVec 32))

(assert (=> bm!23578 (= call!23581 (arrayCountValidKeys!0 (_keys!6772 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!250954 () Bool)

(declare-fun e!162761 () (_ BitVec 32))

(assert (=> b!250954 (= e!162761 call!23581)))

(declare-fun b!250955 () Bool)

(declare-fun e!162762 () (_ BitVec 32))

(assert (=> b!250955 (= e!162762 e!162761)))

(declare-fun c!42190 () Bool)

(assert (=> b!250955 (= c!42190 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250956 () Bool)

(assert (=> b!250956 (= e!162762 #b00000000000000000000000000000000)))

(declare-fun b!250957 () Bool)

(assert (=> b!250957 (= e!162761 (bvadd #b00000000000000000000000000000001 call!23581))))

(declare-fun d!61061 () Bool)

(declare-fun lt!125761 () (_ BitVec 32))

(assert (=> d!61061 (and (bvsge lt!125761 #b00000000000000000000000000000000) (bvsle lt!125761 (bvsub (size!6179 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61061 (= lt!125761 e!162762)))

(declare-fun c!42191 () Bool)

(assert (=> d!61061 (= c!42191 (bvsge #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61061 (and (bvsle #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6179 (_keys!6772 thiss!1504)) (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61061 (= (arrayCountValidKeys!0 (_keys!6772 thiss!1504) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) lt!125761)))

(assert (= (and d!61061 c!42191) b!250956))

(assert (= (and d!61061 (not c!42191)) b!250955))

(assert (= (and b!250955 c!42190) b!250957))

(assert (= (and b!250955 (not c!42190)) b!250954))

(assert (= (or b!250957 b!250954) bm!23578))

(declare-fun m!267423 () Bool)

(assert (=> bm!23578 m!267423))

(assert (=> b!250955 m!267415))

(assert (=> b!250955 m!267415))

(declare-fun m!267425 () Bool)

(assert (=> b!250955 m!267425))

(assert (=> b!250763 d!61061))

(declare-fun b!250966 () Bool)

(declare-fun e!162771 () Bool)

(declare-fun call!23584 () Bool)

(assert (=> b!250966 (= e!162771 call!23584)))

(declare-fun b!250967 () Bool)

(declare-fun e!162769 () Bool)

(assert (=> b!250967 (= e!162769 call!23584)))

(declare-fun d!61063 () Bool)

(declare-fun res!122899 () Bool)

(declare-fun e!162770 () Bool)

(assert (=> d!61063 (=> res!122899 e!162770)))

(assert (=> d!61063 (= res!122899 (bvsge #b00000000000000000000000000000000 (size!6179 lt!125684)))))

(assert (=> d!61063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125684 (mask!10824 thiss!1504)) e!162770)))

(declare-fun b!250968 () Bool)

(assert (=> b!250968 (= e!162770 e!162771)))

(declare-fun c!42194 () Bool)

(assert (=> b!250968 (= c!42194 (validKeyInArray!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun bm!23581 () Bool)

(assert (=> bm!23581 (= call!23584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125684 (mask!10824 thiss!1504)))))

(declare-fun b!250969 () Bool)

(assert (=> b!250969 (= e!162771 e!162769)))

(declare-fun lt!125768 () (_ BitVec 64))

(assert (=> b!250969 (= lt!125768 (select (arr!5834 lt!125684) #b00000000000000000000000000000000))))

(declare-fun lt!125769 () Unit!7734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12305 (_ BitVec 64) (_ BitVec 32)) Unit!7734)

(assert (=> b!250969 (= lt!125769 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125684 lt!125768 #b00000000000000000000000000000000))))

(assert (=> b!250969 (arrayContainsKey!0 lt!125684 lt!125768 #b00000000000000000000000000000000)))

(declare-fun lt!125770 () Unit!7734)

(assert (=> b!250969 (= lt!125770 lt!125769)))

(declare-fun res!122898 () Bool)

(assert (=> b!250969 (= res!122898 (= (seekEntryOrOpen!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) lt!125684 (mask!10824 thiss!1504)) (Found!1088 #b00000000000000000000000000000000)))))

(assert (=> b!250969 (=> (not res!122898) (not e!162769))))

(assert (= (and d!61063 (not res!122899)) b!250968))

(assert (= (and b!250968 c!42194) b!250969))

(assert (= (and b!250968 (not c!42194)) b!250966))

(assert (= (and b!250969 res!122898) b!250967))

(assert (= (or b!250967 b!250966) bm!23581))

(assert (=> b!250968 m!267403))

(assert (=> b!250968 m!267403))

(assert (=> b!250968 m!267405))

(declare-fun m!267427 () Bool)

(assert (=> bm!23581 m!267427))

(assert (=> b!250969 m!267403))

(declare-fun m!267429 () Bool)

(assert (=> b!250969 m!267429))

(declare-fun m!267431 () Bool)

(assert (=> b!250969 m!267431))

(assert (=> b!250969 m!267403))

(declare-fun m!267433 () Bool)

(assert (=> b!250969 m!267433))

(assert (=> b!250763 d!61063))

(declare-fun b!250982 () Bool)

(declare-fun c!42203 () Bool)

(declare-fun lt!125778 () (_ BitVec 64))

(assert (=> b!250982 (= c!42203 (= lt!125778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162780 () SeekEntryResult!1088)

(declare-fun e!162778 () SeekEntryResult!1088)

(assert (=> b!250982 (= e!162780 e!162778)))

(declare-fun b!250983 () Bool)

(declare-fun lt!125779 () SeekEntryResult!1088)

(assert (=> b!250983 (= e!162778 (MissingZero!1088 (index!6524 lt!125779)))))

(declare-fun b!250984 () Bool)

(declare-fun e!162779 () SeekEntryResult!1088)

(assert (=> b!250984 (= e!162779 Undefined!1088)))

(declare-fun d!61065 () Bool)

(declare-fun lt!125777 () SeekEntryResult!1088)

(assert (=> d!61065 (and (or ((_ is Undefined!1088) lt!125777) (not ((_ is Found!1088) lt!125777)) (and (bvsge (index!6523 lt!125777) #b00000000000000000000000000000000) (bvslt (index!6523 lt!125777) (size!6179 (_keys!6772 thiss!1504))))) (or ((_ is Undefined!1088) lt!125777) ((_ is Found!1088) lt!125777) (not ((_ is MissingZero!1088) lt!125777)) (and (bvsge (index!6522 lt!125777) #b00000000000000000000000000000000) (bvslt (index!6522 lt!125777) (size!6179 (_keys!6772 thiss!1504))))) (or ((_ is Undefined!1088) lt!125777) ((_ is Found!1088) lt!125777) ((_ is MissingZero!1088) lt!125777) (not ((_ is MissingVacant!1088) lt!125777)) (and (bvsge (index!6525 lt!125777) #b00000000000000000000000000000000) (bvslt (index!6525 lt!125777) (size!6179 (_keys!6772 thiss!1504))))) (or ((_ is Undefined!1088) lt!125777) (ite ((_ is Found!1088) lt!125777) (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6523 lt!125777)) key!932) (ite ((_ is MissingZero!1088) lt!125777) (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6522 lt!125777)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1088) lt!125777) (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6525 lt!125777)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61065 (= lt!125777 e!162779)))

(declare-fun c!42201 () Bool)

(assert (=> d!61065 (= c!42201 (and ((_ is Intermediate!1088) lt!125779) (undefined!1900 lt!125779)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12305 (_ BitVec 32)) SeekEntryResult!1088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61065 (= lt!125779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10824 thiss!1504)) key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(assert (=> d!61065 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61065 (= (seekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)) lt!125777)))

(declare-fun b!250985 () Bool)

(assert (=> b!250985 (= e!162779 e!162780)))

(assert (=> b!250985 (= lt!125778 (select (arr!5834 (_keys!6772 thiss!1504)) (index!6524 lt!125779)))))

(declare-fun c!42202 () Bool)

(assert (=> b!250985 (= c!42202 (= lt!125778 key!932))))

(declare-fun b!250986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12305 (_ BitVec 32)) SeekEntryResult!1088)

(assert (=> b!250986 (= e!162778 (seekKeyOrZeroReturnVacant!0 (x!24656 lt!125779) (index!6524 lt!125779) (index!6524 lt!125779) key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun b!250987 () Bool)

(assert (=> b!250987 (= e!162780 (Found!1088 (index!6524 lt!125779)))))

(assert (= (and d!61065 c!42201) b!250984))

(assert (= (and d!61065 (not c!42201)) b!250985))

(assert (= (and b!250985 c!42202) b!250987))

(assert (= (and b!250985 (not c!42202)) b!250982))

(assert (= (and b!250982 c!42203) b!250983))

(assert (= (and b!250982 (not c!42203)) b!250986))

(declare-fun m!267435 () Bool)

(assert (=> d!61065 m!267435))

(declare-fun m!267437 () Bool)

(assert (=> d!61065 m!267437))

(declare-fun m!267439 () Bool)

(assert (=> d!61065 m!267439))

(assert (=> d!61065 m!267253))

(declare-fun m!267441 () Bool)

(assert (=> d!61065 m!267441))

(assert (=> d!61065 m!267437))

(declare-fun m!267443 () Bool)

(assert (=> d!61065 m!267443))

(declare-fun m!267445 () Bool)

(assert (=> b!250985 m!267445))

(declare-fun m!267447 () Bool)

(assert (=> b!250986 m!267447))

(assert (=> b!250756 d!61065))

(declare-fun lt!125784 () SeekEntryResult!1088)

(declare-fun bm!23586 () Bool)

(declare-fun c!42208 () Bool)

(declare-fun call!23590 () Bool)

(assert (=> bm!23586 (= call!23590 (inRange!0 (ite c!42208 (index!6522 lt!125784) (index!6525 lt!125784)) (mask!10824 thiss!1504)))))

(declare-fun b!251004 () Bool)

(declare-fun e!162792 () Bool)

(declare-fun call!23589 () Bool)

(assert (=> b!251004 (= e!162792 (not call!23589))))

(declare-fun b!251005 () Bool)

(declare-fun e!162789 () Bool)

(assert (=> b!251005 (= e!162789 (not call!23589))))

(declare-fun b!251006 () Bool)

(declare-fun e!162790 () Bool)

(assert (=> b!251006 (= e!162790 ((_ is Undefined!1088) lt!125784))))

(declare-fun b!251008 () Bool)

(declare-fun res!122911 () Bool)

(assert (=> b!251008 (=> (not res!122911) (not e!162789))))

(assert (=> b!251008 (= res!122911 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6525 lt!125784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251008 (and (bvsge (index!6525 lt!125784) #b00000000000000000000000000000000) (bvslt (index!6525 lt!125784) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun bm!23587 () Bool)

(assert (=> bm!23587 (= call!23589 (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251009 () Bool)

(assert (=> b!251009 (and (bvsge (index!6522 lt!125784) #b00000000000000000000000000000000) (bvslt (index!6522 lt!125784) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun res!122908 () Bool)

(assert (=> b!251009 (= res!122908 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6522 lt!125784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251009 (=> (not res!122908) (not e!162792))))

(declare-fun b!251007 () Bool)

(declare-fun e!162791 () Bool)

(assert (=> b!251007 (= e!162791 e!162790)))

(declare-fun c!42209 () Bool)

(assert (=> b!251007 (= c!42209 ((_ is MissingVacant!1088) lt!125784))))

(declare-fun d!61067 () Bool)

(assert (=> d!61067 e!162791))

(assert (=> d!61067 (= c!42208 ((_ is MissingZero!1088) lt!125784))))

(assert (=> d!61067 (= lt!125784 (seekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun lt!125785 () Unit!7734)

(declare-fun choose!1195 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7734)

(assert (=> d!61067 (= lt!125785 (choose!1195 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> d!61067 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61067 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) lt!125785)))

(declare-fun b!251010 () Bool)

(declare-fun res!122910 () Bool)

(assert (=> b!251010 (=> (not res!122910) (not e!162789))))

(assert (=> b!251010 (= res!122910 call!23590)))

(assert (=> b!251010 (= e!162790 e!162789)))

(declare-fun b!251011 () Bool)

(assert (=> b!251011 (= e!162791 e!162792)))

(declare-fun res!122909 () Bool)

(assert (=> b!251011 (= res!122909 call!23590)))

(assert (=> b!251011 (=> (not res!122909) (not e!162792))))

(assert (= (and d!61067 c!42208) b!251011))

(assert (= (and d!61067 (not c!42208)) b!251007))

(assert (= (and b!251011 res!122909) b!251009))

(assert (= (and b!251009 res!122908) b!251004))

(assert (= (and b!251007 c!42209) b!251010))

(assert (= (and b!251007 (not c!42209)) b!251006))

(assert (= (and b!251010 res!122910) b!251008))

(assert (= (and b!251008 res!122911) b!251005))

(assert (= (or b!251011 b!251010) bm!23586))

(assert (= (or b!251004 b!251005) bm!23587))

(declare-fun m!267449 () Bool)

(assert (=> bm!23586 m!267449))

(declare-fun m!267451 () Bool)

(assert (=> b!251008 m!267451))

(assert (=> bm!23587 m!267255))

(declare-fun m!267453 () Bool)

(assert (=> b!251009 m!267453))

(assert (=> d!61067 m!267291))

(declare-fun m!267455 () Bool)

(assert (=> d!61067 m!267455))

(assert (=> d!61067 m!267253))

(assert (=> b!250773 d!61067))

(declare-fun d!61069 () Bool)

(assert (=> d!61069 (= (array_inv!3837 (_keys!6772 thiss!1504)) (bvsge (size!6179 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250757 d!61069))

(declare-fun d!61071 () Bool)

(assert (=> d!61071 (= (array_inv!3838 (_values!4617 thiss!1504)) (bvsge (size!6178 (_values!4617 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250757 d!61071))

(declare-fun d!61073 () Bool)

(assert (=> d!61073 (= (inRange!0 (ite c!42153 (index!6522 lt!125688) (index!6525 lt!125688)) (mask!10824 thiss!1504)) (and (bvsge (ite c!42153 (index!6522 lt!125688) (index!6525 lt!125688)) #b00000000000000000000000000000000) (bvslt (ite c!42153 (index!6522 lt!125688) (index!6525 lt!125688)) (bvadd (mask!10824 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23559 d!61073))

(declare-fun d!61075 () Bool)

(declare-fun e!162795 () Bool)

(assert (=> d!61075 e!162795))

(declare-fun res!122916 () Bool)

(assert (=> d!61075 (=> (not res!122916) (not e!162795))))

(declare-fun lt!125790 () SeekEntryResult!1088)

(assert (=> d!61075 (= res!122916 ((_ is Found!1088) lt!125790))))

(assert (=> d!61075 (= lt!125790 (seekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun lt!125791 () Unit!7734)

(declare-fun choose!1196 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7734)

(assert (=> d!61075 (= lt!125791 (choose!1196 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(assert (=> d!61075 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61075 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!394 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) lt!125791)))

(declare-fun b!251016 () Bool)

(declare-fun res!122917 () Bool)

(assert (=> b!251016 (=> (not res!122917) (not e!162795))))

(assert (=> b!251016 (= res!122917 (inRange!0 (index!6523 lt!125790) (mask!10824 thiss!1504)))))

(declare-fun b!251017 () Bool)

(assert (=> b!251017 (= e!162795 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6523 lt!125790)) key!932))))

(assert (=> b!251017 (and (bvsge (index!6523 lt!125790) #b00000000000000000000000000000000) (bvslt (index!6523 lt!125790) (size!6179 (_keys!6772 thiss!1504))))))

(assert (= (and d!61075 res!122916) b!251016))

(assert (= (and b!251016 res!122917) b!251017))

(assert (=> d!61075 m!267291))

(declare-fun m!267457 () Bool)

(assert (=> d!61075 m!267457))

(assert (=> d!61075 m!267253))

(declare-fun m!267459 () Bool)

(assert (=> b!251016 m!267459))

(declare-fun m!267461 () Bool)

(assert (=> b!251017 m!267461))

(assert (=> b!250776 d!61075))

(declare-fun d!61077 () Bool)

(assert (=> d!61077 (contains!1795 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932)))

(declare-fun lt!125794 () Unit!7734)

(declare-fun choose!1197 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) (_ BitVec 32) Int) Unit!7734)

(assert (=> d!61077 (= lt!125794 (choose!1197 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(assert (=> d!61077 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61077 (= (lemmaArrayContainsKeyThenInListMap!214 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) lt!125794)))

(declare-fun bs!9006 () Bool)

(assert (= bs!9006 d!61077))

(assert (=> bs!9006 m!267287))

(assert (=> bs!9006 m!267287))

(assert (=> bs!9006 m!267289))

(declare-fun m!267463 () Bool)

(assert (=> bs!9006 m!267463))

(assert (=> bs!9006 m!267253))

(assert (=> b!250766 d!61077))

(declare-fun d!61079 () Bool)

(assert (=> d!61079 (= (inRange!0 index!297 (mask!10824 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10824 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250760 d!61079))

(declare-fun d!61081 () Bool)

(declare-fun e!162800 () Bool)

(assert (=> d!61081 e!162800))

(declare-fun res!122920 () Bool)

(assert (=> d!61081 (=> res!122920 e!162800)))

(declare-fun lt!125805 () Bool)

(assert (=> d!61081 (= res!122920 (not lt!125805))))

(declare-fun lt!125804 () Bool)

(assert (=> d!61081 (= lt!125805 lt!125804)))

(declare-fun lt!125806 () Unit!7734)

(declare-fun e!162801 () Unit!7734)

(assert (=> d!61081 (= lt!125806 e!162801)))

(declare-fun c!42212 () Bool)

(assert (=> d!61081 (= c!42212 lt!125804)))

(declare-fun containsKey!291 (List!3644 (_ BitVec 64)) Bool)

(assert (=> d!61081 (= lt!125804 (containsKey!291 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(assert (=> d!61081 (= (contains!1795 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932) lt!125805)))

(declare-fun b!251024 () Bool)

(declare-fun lt!125803 () Unit!7734)

(assert (=> b!251024 (= e!162801 lt!125803)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!239 (List!3644 (_ BitVec 64)) Unit!7734)

(assert (=> b!251024 (= lt!125803 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-datatypes ((Option!306 0))(
  ( (Some!305 (v!5361 V!8305)) (None!304) )
))
(declare-fun isDefined!240 (Option!306) Bool)

(declare-fun getValueByKey!300 (List!3644 (_ BitVec 64)) Option!306)

(assert (=> b!251024 (isDefined!240 (getValueByKey!300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-fun b!251025 () Bool)

(declare-fun Unit!7744 () Unit!7734)

(assert (=> b!251025 (= e!162801 Unit!7744)))

(declare-fun b!251026 () Bool)

(assert (=> b!251026 (= e!162800 (isDefined!240 (getValueByKey!300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932)))))

(assert (= (and d!61081 c!42212) b!251024))

(assert (= (and d!61081 (not c!42212)) b!251025))

(assert (= (and d!61081 (not res!122920)) b!251026))

(declare-fun m!267465 () Bool)

(assert (=> d!61081 m!267465))

(declare-fun m!267467 () Bool)

(assert (=> b!251024 m!267467))

(declare-fun m!267469 () Bool)

(assert (=> b!251024 m!267469))

(assert (=> b!251024 m!267469))

(declare-fun m!267471 () Bool)

(assert (=> b!251024 m!267471))

(assert (=> b!251026 m!267469))

(assert (=> b!251026 m!267469))

(assert (=> b!251026 m!267471))

(assert (=> b!250760 d!61081))

(declare-fun b!251069 () Bool)

(declare-fun e!162830 () Bool)

(assert (=> b!251069 (= e!162830 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251070 () Bool)

(declare-fun e!162835 () Bool)

(declare-fun e!162839 () Bool)

(assert (=> b!251070 (= e!162835 e!162839)))

(declare-fun res!122940 () Bool)

(declare-fun call!23611 () Bool)

(assert (=> b!251070 (= res!122940 call!23611)))

(assert (=> b!251070 (=> (not res!122940) (not e!162839))))

(declare-fun bm!23602 () Bool)

(declare-fun call!23606 () ListLongMap!3683)

(declare-fun getCurrentListMapNoExtraKeys!557 (array!12305 array!12303 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 32) Int) ListLongMap!3683)

(assert (=> bm!23602 (= call!23606 (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun b!251071 () Bool)

(declare-fun e!162831 () Bool)

(declare-fun call!23610 () Bool)

(assert (=> b!251071 (= e!162831 (not call!23610))))

(declare-fun b!251072 () Bool)

(declare-fun e!162832 () Unit!7734)

(declare-fun Unit!7745 () Unit!7734)

(assert (=> b!251072 (= e!162832 Unit!7745)))

(declare-fun bm!23603 () Bool)

(declare-fun call!23605 () ListLongMap!3683)

(assert (=> bm!23603 (= call!23605 call!23606)))

(declare-fun bm!23604 () Bool)

(declare-fun lt!125871 () ListLongMap!3683)

(assert (=> bm!23604 (= call!23611 (contains!1795 lt!125871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251073 () Bool)

(assert (=> b!251073 (= e!162835 (not call!23611))))

(declare-fun b!251074 () Bool)

(declare-fun e!162838 () Bool)

(declare-fun e!162829 () Bool)

(assert (=> b!251074 (= e!162838 e!162829)))

(declare-fun res!122946 () Bool)

(assert (=> b!251074 (=> (not res!122946) (not e!162829))))

(assert (=> b!251074 (= res!122946 (contains!1795 lt!125871 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!251075 () Bool)

(declare-fun c!42226 () Bool)

(assert (=> b!251075 (= c!42226 (and (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!162834 () ListLongMap!3683)

(declare-fun e!162837 () ListLongMap!3683)

(assert (=> b!251075 (= e!162834 e!162837)))

(declare-fun b!251076 () Bool)

(declare-fun e!162828 () Bool)

(assert (=> b!251076 (= e!162828 e!162831)))

(declare-fun c!42230 () Bool)

(assert (=> b!251076 (= c!42230 (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!23607 () ListLongMap!3683)

(declare-fun call!23608 () ListLongMap!3683)

(declare-fun c!42227 () Bool)

(declare-fun bm!23605 () Bool)

(declare-fun c!42229 () Bool)

(declare-fun +!668 (ListLongMap!3683 tuple2!4768) ListLongMap!3683)

(assert (=> bm!23605 (= call!23607 (+!668 (ite c!42227 call!23606 (ite c!42229 call!23605 call!23608)) (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(declare-fun b!251077 () Bool)

(declare-fun e!162836 () Bool)

(declare-fun apply!241 (ListLongMap!3683 (_ BitVec 64)) V!8305)

(assert (=> b!251077 (= e!162836 (= (apply!241 lt!125871 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4475 thiss!1504)))))

(declare-fun b!251079 () Bool)

(assert (=> b!251079 (= e!162837 call!23608)))

(declare-fun b!251080 () Bool)

(declare-fun res!122947 () Bool)

(assert (=> b!251080 (=> (not res!122947) (not e!162828))))

(assert (=> b!251080 (= res!122947 e!162838)))

(declare-fun res!122939 () Bool)

(assert (=> b!251080 (=> res!122939 e!162838)))

(declare-fun e!162840 () Bool)

(assert (=> b!251080 (= res!122939 (not e!162840))))

(declare-fun res!122941 () Bool)

(assert (=> b!251080 (=> (not res!122941) (not e!162840))))

(assert (=> b!251080 (= res!122941 (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!251081 () Bool)

(declare-fun e!162833 () ListLongMap!3683)

(assert (=> b!251081 (= e!162833 (+!668 call!23607 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))

(declare-fun b!251082 () Bool)

(declare-fun res!122944 () Bool)

(assert (=> b!251082 (=> (not res!122944) (not e!162828))))

(assert (=> b!251082 (= res!122944 e!162835)))

(declare-fun c!42225 () Bool)

(assert (=> b!251082 (= c!42225 (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!23606 () Bool)

(assert (=> bm!23606 (= call!23608 call!23605)))

(declare-fun b!251083 () Bool)

(assert (=> b!251083 (= e!162833 e!162834)))

(assert (=> b!251083 (= c!42229 (and (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!251084 () Bool)

(declare-fun call!23609 () ListLongMap!3683)

(assert (=> b!251084 (= e!162837 call!23609)))

(declare-fun b!251085 () Bool)

(declare-fun lt!125862 () Unit!7734)

(assert (=> b!251085 (= e!162832 lt!125862)))

(declare-fun lt!125867 () ListLongMap!3683)

(assert (=> b!251085 (= lt!125867 (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125865 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125853 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125853 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125870 () Unit!7734)

(declare-fun addStillContains!217 (ListLongMap!3683 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7734)

(assert (=> b!251085 (= lt!125870 (addStillContains!217 lt!125867 lt!125865 (zeroValue!4475 thiss!1504) lt!125853))))

(assert (=> b!251085 (contains!1795 (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))) lt!125853)))

(declare-fun lt!125859 () Unit!7734)

(assert (=> b!251085 (= lt!125859 lt!125870)))

(declare-fun lt!125868 () ListLongMap!3683)

(assert (=> b!251085 (= lt!125868 (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125864 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125864 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125860 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125860 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125863 () Unit!7734)

(declare-fun addApplyDifferent!217 (ListLongMap!3683 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7734)

(assert (=> b!251085 (= lt!125863 (addApplyDifferent!217 lt!125868 lt!125864 (minValue!4475 thiss!1504) lt!125860))))

(assert (=> b!251085 (= (apply!241 (+!668 lt!125868 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))) lt!125860) (apply!241 lt!125868 lt!125860))))

(declare-fun lt!125854 () Unit!7734)

(assert (=> b!251085 (= lt!125854 lt!125863)))

(declare-fun lt!125852 () ListLongMap!3683)

(assert (=> b!251085 (= lt!125852 (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125869 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125866 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125866 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125872 () Unit!7734)

(assert (=> b!251085 (= lt!125872 (addApplyDifferent!217 lt!125852 lt!125869 (zeroValue!4475 thiss!1504) lt!125866))))

(assert (=> b!251085 (= (apply!241 (+!668 lt!125852 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))) lt!125866) (apply!241 lt!125852 lt!125866))))

(declare-fun lt!125856 () Unit!7734)

(assert (=> b!251085 (= lt!125856 lt!125872)))

(declare-fun lt!125861 () ListLongMap!3683)

(assert (=> b!251085 (= lt!125861 (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(declare-fun lt!125855 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125855 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125851 () (_ BitVec 64))

(assert (=> b!251085 (= lt!125851 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251085 (= lt!125862 (addApplyDifferent!217 lt!125861 lt!125855 (minValue!4475 thiss!1504) lt!125851))))

(assert (=> b!251085 (= (apply!241 (+!668 lt!125861 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))) lt!125851) (apply!241 lt!125861 lt!125851))))

(declare-fun bm!23607 () Bool)

(assert (=> bm!23607 (= call!23610 (contains!1795 lt!125871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251086 () Bool)

(assert (=> b!251086 (= e!162834 call!23609)))

(declare-fun b!251087 () Bool)

(assert (=> b!251087 (= e!162839 (= (apply!241 lt!125871 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4475 thiss!1504)))))

(declare-fun b!251088 () Bool)

(assert (=> b!251088 (= e!162840 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251089 () Bool)

(declare-fun get!3006 (ValueCell!2903 V!8305) V!8305)

(declare-fun dynLambda!584 (Int (_ BitVec 64)) V!8305)

(assert (=> b!251089 (= e!162829 (= (apply!241 lt!125871 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)) (get!3006 (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251089 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6178 (_values!4617 thiss!1504))))))

(assert (=> b!251089 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun bm!23608 () Bool)

(assert (=> bm!23608 (= call!23609 call!23607)))

(declare-fun b!251078 () Bool)

(assert (=> b!251078 (= e!162831 e!162836)))

(declare-fun res!122943 () Bool)

(assert (=> b!251078 (= res!122943 call!23610)))

(assert (=> b!251078 (=> (not res!122943) (not e!162836))))

(declare-fun d!61083 () Bool)

(assert (=> d!61083 e!162828))

(declare-fun res!122942 () Bool)

(assert (=> d!61083 (=> (not res!122942) (not e!162828))))

(assert (=> d!61083 (= res!122942 (or (bvsge #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))))

(declare-fun lt!125858 () ListLongMap!3683)

(assert (=> d!61083 (= lt!125871 lt!125858)))

(declare-fun lt!125857 () Unit!7734)

(assert (=> d!61083 (= lt!125857 e!162832)))

(declare-fun c!42228 () Bool)

(assert (=> d!61083 (= c!42228 e!162830)))

(declare-fun res!122945 () Bool)

(assert (=> d!61083 (=> (not res!122945) (not e!162830))))

(assert (=> d!61083 (= res!122945 (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61083 (= lt!125858 e!162833)))

(assert (=> d!61083 (= c!42227 (and (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4371 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61083 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61083 (= (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) lt!125871)))

(assert (= (and d!61083 c!42227) b!251081))

(assert (= (and d!61083 (not c!42227)) b!251083))

(assert (= (and b!251083 c!42229) b!251086))

(assert (= (and b!251083 (not c!42229)) b!251075))

(assert (= (and b!251075 c!42226) b!251084))

(assert (= (and b!251075 (not c!42226)) b!251079))

(assert (= (or b!251084 b!251079) bm!23606))

(assert (= (or b!251086 bm!23606) bm!23603))

(assert (= (or b!251086 b!251084) bm!23608))

(assert (= (or b!251081 bm!23603) bm!23602))

(assert (= (or b!251081 bm!23608) bm!23605))

(assert (= (and d!61083 res!122945) b!251069))

(assert (= (and d!61083 c!42228) b!251085))

(assert (= (and d!61083 (not c!42228)) b!251072))

(assert (= (and d!61083 res!122942) b!251080))

(assert (= (and b!251080 res!122941) b!251088))

(assert (= (and b!251080 (not res!122939)) b!251074))

(assert (= (and b!251074 res!122946) b!251089))

(assert (= (and b!251080 res!122947) b!251082))

(assert (= (and b!251082 c!42225) b!251070))

(assert (= (and b!251082 (not c!42225)) b!251073))

(assert (= (and b!251070 res!122940) b!251087))

(assert (= (or b!251070 b!251073) bm!23604))

(assert (= (and b!251082 res!122944) b!251076))

(assert (= (and b!251076 c!42230) b!251078))

(assert (= (and b!251076 (not c!42230)) b!251071))

(assert (= (and b!251078 res!122943) b!251077))

(assert (= (or b!251078 b!251071) bm!23607))

(declare-fun b_lambda!8113 () Bool)

(assert (=> (not b_lambda!8113) (not b!251089)))

(declare-fun t!8675 () Bool)

(declare-fun tb!2987 () Bool)

(assert (=> (and b!250757 (= (defaultEntry!4634 thiss!1504) (defaultEntry!4634 thiss!1504)) t!8675) tb!2987))

(declare-fun result!5299 () Bool)

(assert (=> tb!2987 (= result!5299 tp_is_empty!6493)))

(assert (=> b!251089 t!8675))

(declare-fun b_and!13673 () Bool)

(assert (= b_and!13667 (and (=> t!8675 result!5299) b_and!13673)))

(declare-fun m!267473 () Bool)

(assert (=> bm!23604 m!267473))

(declare-fun m!267475 () Bool)

(assert (=> b!251089 m!267475))

(declare-fun m!267477 () Bool)

(assert (=> b!251089 m!267477))

(declare-fun m!267479 () Bool)

(assert (=> b!251089 m!267479))

(assert (=> b!251089 m!267477))

(assert (=> b!251089 m!267415))

(assert (=> b!251089 m!267415))

(declare-fun m!267481 () Bool)

(assert (=> b!251089 m!267481))

(assert (=> b!251089 m!267475))

(declare-fun m!267483 () Bool)

(assert (=> b!251087 m!267483))

(assert (=> d!61083 m!267253))

(declare-fun m!267485 () Bool)

(assert (=> bm!23605 m!267485))

(declare-fun m!267487 () Bool)

(assert (=> bm!23602 m!267487))

(declare-fun m!267489 () Bool)

(assert (=> b!251085 m!267489))

(declare-fun m!267491 () Bool)

(assert (=> b!251085 m!267491))

(declare-fun m!267493 () Bool)

(assert (=> b!251085 m!267493))

(declare-fun m!267495 () Bool)

(assert (=> b!251085 m!267495))

(declare-fun m!267497 () Bool)

(assert (=> b!251085 m!267497))

(declare-fun m!267499 () Bool)

(assert (=> b!251085 m!267499))

(assert (=> b!251085 m!267487))

(assert (=> b!251085 m!267415))

(declare-fun m!267501 () Bool)

(assert (=> b!251085 m!267501))

(declare-fun m!267503 () Bool)

(assert (=> b!251085 m!267503))

(declare-fun m!267505 () Bool)

(assert (=> b!251085 m!267505))

(assert (=> b!251085 m!267497))

(declare-fun m!267507 () Bool)

(assert (=> b!251085 m!267507))

(assert (=> b!251085 m!267491))

(declare-fun m!267509 () Bool)

(assert (=> b!251085 m!267509))

(assert (=> b!251085 m!267493))

(declare-fun m!267511 () Bool)

(assert (=> b!251085 m!267511))

(declare-fun m!267513 () Bool)

(assert (=> b!251085 m!267513))

(declare-fun m!267515 () Bool)

(assert (=> b!251085 m!267515))

(declare-fun m!267517 () Bool)

(assert (=> b!251085 m!267517))

(assert (=> b!251085 m!267513))

(assert (=> b!251069 m!267415))

(assert (=> b!251069 m!267415))

(assert (=> b!251069 m!267425))

(assert (=> b!251088 m!267415))

(assert (=> b!251088 m!267415))

(assert (=> b!251088 m!267425))

(assert (=> b!251074 m!267415))

(assert (=> b!251074 m!267415))

(declare-fun m!267519 () Bool)

(assert (=> b!251074 m!267519))

(declare-fun m!267521 () Bool)

(assert (=> b!251081 m!267521))

(declare-fun m!267523 () Bool)

(assert (=> bm!23607 m!267523))

(declare-fun m!267525 () Bool)

(assert (=> b!251077 m!267525))

(assert (=> b!250760 d!61083))

(declare-fun d!61085 () Bool)

(declare-fun res!122954 () Bool)

(declare-fun e!162843 () Bool)

(assert (=> d!61085 (=> (not res!122954) (not e!162843))))

(declare-fun simpleValid!264 (LongMapFixedSize!3706) Bool)

(assert (=> d!61085 (= res!122954 (simpleValid!264 thiss!1504))))

(assert (=> d!61085 (= (valid!1458 thiss!1504) e!162843)))

(declare-fun b!251098 () Bool)

(declare-fun res!122955 () Bool)

(assert (=> b!251098 (=> (not res!122955) (not e!162843))))

(assert (=> b!251098 (= res!122955 (= (arrayCountValidKeys!0 (_keys!6772 thiss!1504) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (_size!1902 thiss!1504)))))

(declare-fun b!251099 () Bool)

(declare-fun res!122956 () Bool)

(assert (=> b!251099 (=> (not res!122956) (not e!162843))))

(assert (=> b!251099 (= res!122956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun b!251100 () Bool)

(assert (=> b!251100 (= e!162843 (arrayNoDuplicates!0 (_keys!6772 thiss!1504) #b00000000000000000000000000000000 Nil!3642))))

(assert (= (and d!61085 res!122954) b!251098))

(assert (= (and b!251098 res!122955) b!251099))

(assert (= (and b!251099 res!122956) b!251100))

(declare-fun m!267527 () Bool)

(assert (=> d!61085 m!267527))

(assert (=> b!251098 m!267265))

(declare-fun m!267529 () Bool)

(assert (=> b!251099 m!267529))

(declare-fun m!267531 () Bool)

(assert (=> b!251100 m!267531))

(assert (=> start!23924 d!61085))

(assert (=> bm!23558 d!61057))

(declare-fun condMapEmpty!11044 () Bool)

(declare-fun mapDefault!11044 () ValueCell!2903)

(assert (=> mapNonEmpty!11035 (= condMapEmpty!11044 (= mapRest!11035 ((as const (Array (_ BitVec 32) ValueCell!2903)) mapDefault!11044)))))

(declare-fun e!162849 () Bool)

(declare-fun mapRes!11044 () Bool)

(assert (=> mapNonEmpty!11035 (= tp!23161 (and e!162849 mapRes!11044))))

(declare-fun b!251107 () Bool)

(declare-fun e!162848 () Bool)

(assert (=> b!251107 (= e!162848 tp_is_empty!6493)))

(declare-fun mapNonEmpty!11044 () Bool)

(declare-fun tp!23176 () Bool)

(assert (=> mapNonEmpty!11044 (= mapRes!11044 (and tp!23176 e!162848))))

(declare-fun mapRest!11044 () (Array (_ BitVec 32) ValueCell!2903))

(declare-fun mapKey!11044 () (_ BitVec 32))

(declare-fun mapValue!11044 () ValueCell!2903)

(assert (=> mapNonEmpty!11044 (= mapRest!11035 (store mapRest!11044 mapKey!11044 mapValue!11044))))

(declare-fun mapIsEmpty!11044 () Bool)

(assert (=> mapIsEmpty!11044 mapRes!11044))

(declare-fun b!251108 () Bool)

(assert (=> b!251108 (= e!162849 tp_is_empty!6493)))

(assert (= (and mapNonEmpty!11035 condMapEmpty!11044) mapIsEmpty!11044))

(assert (= (and mapNonEmpty!11035 (not condMapEmpty!11044)) mapNonEmpty!11044))

(assert (= (and mapNonEmpty!11044 ((_ is ValueCellFull!2903) mapValue!11044)) b!251107))

(assert (= (and mapNonEmpty!11035 ((_ is ValueCellFull!2903) mapDefault!11044)) b!251108))

(declare-fun m!267533 () Bool)

(assert (=> mapNonEmpty!11044 m!267533))

(declare-fun b_lambda!8115 () Bool)

(assert (= b_lambda!8113 (or (and b!250757 b_free!6631) b_lambda!8115)))

(check-sat (not b_lambda!8115) (not b!250950) (not b!250944) (not bm!23605) (not d!61075) (not b!250937) (not d!61081) (not bm!23577) (not b!250911) (not b!251098) (not b!251026) (not bm!23581) (not b!250955) (not b!250938) (not d!61085) (not b!251088) (not b!251099) (not b!251081) (not mapNonEmpty!11044) (not d!61065) (not b!251016) (not b!251085) (not bm!23607) (not b!251074) (not d!61059) (not b!251069) (not d!61067) (not bm!23587) (not b!250914) (not d!61083) (not b!250953) (not bm!23604) (not bm!23586) (not d!61077) (not b!251087) b_and!13673 (not d!61055) (not bm!23578) (not d!61047) (not bm!23574) (not b!251100) (not b_next!6631) (not b!250986) (not b!251089) (not b!250969) tp_is_empty!6493 (not b!250968) (not b!251024) (not b!250924) (not b!251077) (not bm!23602) (not b!250912) (not b!250940))
(check-sat b_and!13673 (not b_next!6631))
(get-model)

(declare-fun d!61087 () Bool)

(assert (=> d!61087 (arrayNoDuplicates!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000000 Nil!3642)))

(assert (=> d!61087 true))

(declare-fun _$65!80 () Unit!7734)

(assert (=> d!61087 (= (choose!41 (_keys!6772 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3642) _$65!80)))

(declare-fun bs!9007 () Bool)

(assert (= bs!9007 d!61087))

(assert (=> bs!9007 m!267271))

(assert (=> bs!9007 m!267413))

(assert (=> d!61055 d!61087))

(declare-fun d!61089 () Bool)

(assert (=> d!61089 (arrayContainsKey!0 lt!125684 lt!125768 #b00000000000000000000000000000000)))

(declare-fun lt!125875 () Unit!7734)

(declare-fun choose!13 (array!12305 (_ BitVec 64) (_ BitVec 32)) Unit!7734)

(assert (=> d!61089 (= lt!125875 (choose!13 lt!125684 lt!125768 #b00000000000000000000000000000000))))

(assert (=> d!61089 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!61089 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125684 lt!125768 #b00000000000000000000000000000000) lt!125875)))

(declare-fun bs!9008 () Bool)

(assert (= bs!9008 d!61089))

(assert (=> bs!9008 m!267431))

(declare-fun m!267535 () Bool)

(assert (=> bs!9008 m!267535))

(assert (=> b!250969 d!61089))

(declare-fun d!61091 () Bool)

(declare-fun res!122957 () Bool)

(declare-fun e!162850 () Bool)

(assert (=> d!61091 (=> res!122957 e!162850)))

(assert (=> d!61091 (= res!122957 (= (select (arr!5834 lt!125684) #b00000000000000000000000000000000) lt!125768))))

(assert (=> d!61091 (= (arrayContainsKey!0 lt!125684 lt!125768 #b00000000000000000000000000000000) e!162850)))

(declare-fun b!251109 () Bool)

(declare-fun e!162851 () Bool)

(assert (=> b!251109 (= e!162850 e!162851)))

(declare-fun res!122958 () Bool)

(assert (=> b!251109 (=> (not res!122958) (not e!162851))))

(assert (=> b!251109 (= res!122958 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 lt!125684)))))

(declare-fun b!251110 () Bool)

(assert (=> b!251110 (= e!162851 (arrayContainsKey!0 lt!125684 lt!125768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61091 (not res!122957)) b!251109))

(assert (= (and b!251109 res!122958) b!251110))

(assert (=> d!61091 m!267403))

(declare-fun m!267537 () Bool)

(assert (=> b!251110 m!267537))

(assert (=> b!250969 d!61091))

(declare-fun b!251111 () Bool)

(declare-fun c!42233 () Bool)

(declare-fun lt!125877 () (_ BitVec 64))

(assert (=> b!251111 (= c!42233 (= lt!125877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162854 () SeekEntryResult!1088)

(declare-fun e!162852 () SeekEntryResult!1088)

(assert (=> b!251111 (= e!162854 e!162852)))

(declare-fun b!251112 () Bool)

(declare-fun lt!125878 () SeekEntryResult!1088)

(assert (=> b!251112 (= e!162852 (MissingZero!1088 (index!6524 lt!125878)))))

(declare-fun b!251113 () Bool)

(declare-fun e!162853 () SeekEntryResult!1088)

(assert (=> b!251113 (= e!162853 Undefined!1088)))

(declare-fun d!61093 () Bool)

(declare-fun lt!125876 () SeekEntryResult!1088)

(assert (=> d!61093 (and (or ((_ is Undefined!1088) lt!125876) (not ((_ is Found!1088) lt!125876)) (and (bvsge (index!6523 lt!125876) #b00000000000000000000000000000000) (bvslt (index!6523 lt!125876) (size!6179 lt!125684)))) (or ((_ is Undefined!1088) lt!125876) ((_ is Found!1088) lt!125876) (not ((_ is MissingZero!1088) lt!125876)) (and (bvsge (index!6522 lt!125876) #b00000000000000000000000000000000) (bvslt (index!6522 lt!125876) (size!6179 lt!125684)))) (or ((_ is Undefined!1088) lt!125876) ((_ is Found!1088) lt!125876) ((_ is MissingZero!1088) lt!125876) (not ((_ is MissingVacant!1088) lt!125876)) (and (bvsge (index!6525 lt!125876) #b00000000000000000000000000000000) (bvslt (index!6525 lt!125876) (size!6179 lt!125684)))) (or ((_ is Undefined!1088) lt!125876) (ite ((_ is Found!1088) lt!125876) (= (select (arr!5834 lt!125684) (index!6523 lt!125876)) (select (arr!5834 lt!125684) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1088) lt!125876) (= (select (arr!5834 lt!125684) (index!6522 lt!125876)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1088) lt!125876) (= (select (arr!5834 lt!125684) (index!6525 lt!125876)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61093 (= lt!125876 e!162853)))

(declare-fun c!42231 () Bool)

(assert (=> d!61093 (= c!42231 (and ((_ is Intermediate!1088) lt!125878) (undefined!1900 lt!125878)))))

(assert (=> d!61093 (= lt!125878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) (mask!10824 thiss!1504)) (select (arr!5834 lt!125684) #b00000000000000000000000000000000) lt!125684 (mask!10824 thiss!1504)))))

(assert (=> d!61093 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61093 (= (seekEntryOrOpen!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) lt!125684 (mask!10824 thiss!1504)) lt!125876)))

(declare-fun b!251114 () Bool)

(assert (=> b!251114 (= e!162853 e!162854)))

(assert (=> b!251114 (= lt!125877 (select (arr!5834 lt!125684) (index!6524 lt!125878)))))

(declare-fun c!42232 () Bool)

(assert (=> b!251114 (= c!42232 (= lt!125877 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun b!251115 () Bool)

(assert (=> b!251115 (= e!162852 (seekKeyOrZeroReturnVacant!0 (x!24656 lt!125878) (index!6524 lt!125878) (index!6524 lt!125878) (select (arr!5834 lt!125684) #b00000000000000000000000000000000) lt!125684 (mask!10824 thiss!1504)))))

(declare-fun b!251116 () Bool)

(assert (=> b!251116 (= e!162854 (Found!1088 (index!6524 lt!125878)))))

(assert (= (and d!61093 c!42231) b!251113))

(assert (= (and d!61093 (not c!42231)) b!251114))

(assert (= (and b!251114 c!42232) b!251116))

(assert (= (and b!251114 (not c!42232)) b!251111))

(assert (= (and b!251111 c!42233) b!251112))

(assert (= (and b!251111 (not c!42233)) b!251115))

(declare-fun m!267539 () Bool)

(assert (=> d!61093 m!267539))

(declare-fun m!267541 () Bool)

(assert (=> d!61093 m!267541))

(assert (=> d!61093 m!267403))

(declare-fun m!267543 () Bool)

(assert (=> d!61093 m!267543))

(assert (=> d!61093 m!267253))

(declare-fun m!267545 () Bool)

(assert (=> d!61093 m!267545))

(assert (=> d!61093 m!267403))

(assert (=> d!61093 m!267541))

(declare-fun m!267547 () Bool)

(assert (=> d!61093 m!267547))

(declare-fun m!267549 () Bool)

(assert (=> b!251114 m!267549))

(assert (=> b!251115 m!267403))

(declare-fun m!267551 () Bool)

(assert (=> b!251115 m!267551))

(assert (=> b!250969 d!61093))

(declare-fun d!61095 () Bool)

(declare-fun e!162855 () Bool)

(assert (=> d!61095 e!162855))

(declare-fun res!122959 () Bool)

(assert (=> d!61095 (=> res!122959 e!162855)))

(declare-fun lt!125881 () Bool)

(assert (=> d!61095 (= res!122959 (not lt!125881))))

(declare-fun lt!125880 () Bool)

(assert (=> d!61095 (= lt!125881 lt!125880)))

(declare-fun lt!125882 () Unit!7734)

(declare-fun e!162856 () Unit!7734)

(assert (=> d!61095 (= lt!125882 e!162856)))

(declare-fun c!42234 () Bool)

(assert (=> d!61095 (= c!42234 lt!125880)))

(assert (=> d!61095 (= lt!125880 (containsKey!291 (toList!1857 lt!125871) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61095 (= (contains!1795 lt!125871 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125881)))

(declare-fun b!251117 () Bool)

(declare-fun lt!125879 () Unit!7734)

(assert (=> b!251117 (= e!162856 lt!125879)))

(assert (=> b!251117 (= lt!125879 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1857 lt!125871) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251117 (isDefined!240 (getValueByKey!300 (toList!1857 lt!125871) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251118 () Bool)

(declare-fun Unit!7746 () Unit!7734)

(assert (=> b!251118 (= e!162856 Unit!7746)))

(declare-fun b!251119 () Bool)

(assert (=> b!251119 (= e!162855 (isDefined!240 (getValueByKey!300 (toList!1857 lt!125871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61095 c!42234) b!251117))

(assert (= (and d!61095 (not c!42234)) b!251118))

(assert (= (and d!61095 (not res!122959)) b!251119))

(declare-fun m!267553 () Bool)

(assert (=> d!61095 m!267553))

(declare-fun m!267555 () Bool)

(assert (=> b!251117 m!267555))

(declare-fun m!267557 () Bool)

(assert (=> b!251117 m!267557))

(assert (=> b!251117 m!267557))

(declare-fun m!267559 () Bool)

(assert (=> b!251117 m!267559))

(assert (=> b!251119 m!267557))

(assert (=> b!251119 m!267557))

(assert (=> b!251119 m!267559))

(assert (=> bm!23607 d!61095))

(declare-fun d!61097 () Bool)

(declare-fun get!3007 (Option!306) V!8305)

(assert (=> d!61097 (= (apply!241 lt!125871 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3007 (getValueByKey!300 (toList!1857 lt!125871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9009 () Bool)

(assert (= bs!9009 d!61097))

(declare-fun m!267561 () Bool)

(assert (=> bs!9009 m!267561))

(assert (=> bs!9009 m!267561))

(declare-fun m!267563 () Bool)

(assert (=> bs!9009 m!267563))

(assert (=> b!251087 d!61097))

(declare-fun d!61099 () Bool)

(assert (=> d!61099 (= (apply!241 lt!125871 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)) (get!3007 (getValueByKey!300 (toList!1857 lt!125871) (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9010 () Bool)

(assert (= bs!9010 d!61099))

(assert (=> bs!9010 m!267415))

(declare-fun m!267565 () Bool)

(assert (=> bs!9010 m!267565))

(assert (=> bs!9010 m!267565))

(declare-fun m!267567 () Bool)

(assert (=> bs!9010 m!267567))

(assert (=> b!251089 d!61099))

(declare-fun d!61101 () Bool)

(declare-fun c!42237 () Bool)

(assert (=> d!61101 (= c!42237 ((_ is ValueCellFull!2903) (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162859 () V!8305)

(assert (=> d!61101 (= (get!3006 (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!162859)))

(declare-fun b!251124 () Bool)

(declare-fun get!3008 (ValueCell!2903 V!8305) V!8305)

(assert (=> b!251124 (= e!162859 (get!3008 (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251125 () Bool)

(declare-fun get!3009 (ValueCell!2903 V!8305) V!8305)

(assert (=> b!251125 (= e!162859 (get!3009 (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61101 c!42237) b!251124))

(assert (= (and d!61101 (not c!42237)) b!251125))

(assert (=> b!251124 m!267475))

(assert (=> b!251124 m!267477))

(declare-fun m!267569 () Bool)

(assert (=> b!251124 m!267569))

(assert (=> b!251125 m!267475))

(assert (=> b!251125 m!267477))

(declare-fun m!267571 () Bool)

(assert (=> b!251125 m!267571))

(assert (=> b!251089 d!61101))

(declare-fun b!251126 () Bool)

(declare-fun e!162863 () Bool)

(declare-fun e!162861 () Bool)

(assert (=> b!251126 (= e!162863 e!162861)))

(declare-fun res!122961 () Bool)

(assert (=> b!251126 (=> (not res!122961) (not e!162861))))

(declare-fun e!162862 () Bool)

(assert (=> b!251126 (= res!122961 (not e!162862))))

(declare-fun res!122962 () Bool)

(assert (=> b!251126 (=> (not res!122962) (not e!162862))))

(assert (=> b!251126 (= res!122962 (validKeyInArray!0 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun c!42238 () Bool)

(declare-fun bm!23609 () Bool)

(declare-fun call!23612 () Bool)

(assert (=> bm!23609 (= call!23612 (arrayNoDuplicates!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42238 (Cons!3641 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000) Nil!3642) Nil!3642)))))

(declare-fun b!251127 () Bool)

(declare-fun e!162860 () Bool)

(assert (=> b!251127 (= e!162861 e!162860)))

(assert (=> b!251127 (= c!42238 (validKeyInArray!0 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251128 () Bool)

(assert (=> b!251128 (= e!162860 call!23612)))

(declare-fun b!251129 () Bool)

(assert (=> b!251129 (= e!162862 (contains!1796 Nil!3642 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!61103 () Bool)

(declare-fun res!122960 () Bool)

(assert (=> d!61103 (=> res!122960 e!162863)))

(assert (=> d!61103 (= res!122960 (bvsge #b00000000000000000000000000000000 (size!6179 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))))))))

(assert (=> d!61103 (= (arrayNoDuplicates!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000000 Nil!3642) e!162863)))

(declare-fun b!251130 () Bool)

(assert (=> b!251130 (= e!162860 call!23612)))

(assert (= (and d!61103 (not res!122960)) b!251126))

(assert (= (and b!251126 res!122962) b!251129))

(assert (= (and b!251126 res!122961) b!251127))

(assert (= (and b!251127 c!42238) b!251130))

(assert (= (and b!251127 (not c!42238)) b!251128))

(assert (= (or b!251130 b!251128) bm!23609))

(declare-fun m!267573 () Bool)

(assert (=> b!251126 m!267573))

(assert (=> b!251126 m!267573))

(declare-fun m!267575 () Bool)

(assert (=> b!251126 m!267575))

(assert (=> bm!23609 m!267573))

(declare-fun m!267577 () Bool)

(assert (=> bm!23609 m!267577))

(assert (=> b!251127 m!267573))

(assert (=> b!251127 m!267573))

(assert (=> b!251127 m!267575))

(assert (=> b!251129 m!267573))

(assert (=> b!251129 m!267573))

(declare-fun m!267579 () Bool)

(assert (=> b!251129 m!267579))

(assert (=> b!250944 d!61103))

(declare-fun d!61105 () Bool)

(assert (=> d!61105 (= (validKeyInArray!0 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)) (and (not (= (select (arr!5834 lt!125684) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5834 lt!125684) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250938 d!61105))

(assert (=> b!250937 d!61105))

(assert (=> d!61067 d!61065))

(declare-fun d!61107 () Bool)

(declare-fun e!162874 () Bool)

(assert (=> d!61107 e!162874))

(declare-fun c!42244 () Bool)

(declare-fun lt!125885 () SeekEntryResult!1088)

(assert (=> d!61107 (= c!42244 ((_ is MissingZero!1088) lt!125885))))

(assert (=> d!61107 (= lt!125885 (seekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(assert (=> d!61107 true))

(declare-fun _$34!1113 () Unit!7734)

(assert (=> d!61107 (= (choose!1195 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) _$34!1113)))

(declare-fun b!251147 () Bool)

(declare-fun e!162875 () Bool)

(assert (=> b!251147 (= e!162874 e!162875)))

(declare-fun res!122974 () Bool)

(declare-fun call!23617 () Bool)

(assert (=> b!251147 (= res!122974 call!23617)))

(assert (=> b!251147 (=> (not res!122974) (not e!162875))))

(declare-fun b!251148 () Bool)

(declare-fun res!122973 () Bool)

(assert (=> b!251148 (= res!122973 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6522 lt!125885)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251148 (=> (not res!122973) (not e!162875))))

(declare-fun b!251149 () Bool)

(declare-fun e!162872 () Bool)

(declare-fun call!23618 () Bool)

(assert (=> b!251149 (= e!162872 (not call!23618))))

(declare-fun b!251150 () Bool)

(declare-fun res!122972 () Bool)

(assert (=> b!251150 (=> (not res!122972) (not e!162872))))

(assert (=> b!251150 (= res!122972 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6525 lt!125885)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251151 () Bool)

(declare-fun res!122971 () Bool)

(assert (=> b!251151 (=> (not res!122971) (not e!162872))))

(assert (=> b!251151 (= res!122971 call!23617)))

(declare-fun e!162873 () Bool)

(assert (=> b!251151 (= e!162873 e!162872)))

(declare-fun bm!23614 () Bool)

(assert (=> bm!23614 (= call!23617 (inRange!0 (ite c!42244 (index!6522 lt!125885) (index!6525 lt!125885)) (mask!10824 thiss!1504)))))

(declare-fun b!251152 () Bool)

(assert (=> b!251152 (= e!162873 ((_ is Undefined!1088) lt!125885))))

(declare-fun b!251153 () Bool)

(assert (=> b!251153 (= e!162874 e!162873)))

(declare-fun c!42243 () Bool)

(assert (=> b!251153 (= c!42243 ((_ is MissingVacant!1088) lt!125885))))

(declare-fun bm!23615 () Bool)

(assert (=> bm!23615 (= call!23618 (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251154 () Bool)

(assert (=> b!251154 (= e!162875 (not call!23618))))

(assert (= (and d!61107 c!42244) b!251147))

(assert (= (and d!61107 (not c!42244)) b!251153))

(assert (= (and b!251147 res!122974) b!251148))

(assert (= (and b!251148 res!122973) b!251154))

(assert (= (and b!251153 c!42243) b!251151))

(assert (= (and b!251153 (not c!42243)) b!251152))

(assert (= (and b!251151 res!122971) b!251150))

(assert (= (and b!251150 res!122972) b!251149))

(assert (= (or b!251147 b!251151) bm!23614))

(assert (= (or b!251154 b!251149) bm!23615))

(declare-fun m!267581 () Bool)

(assert (=> b!251150 m!267581))

(declare-fun m!267583 () Bool)

(assert (=> bm!23614 m!267583))

(declare-fun m!267585 () Bool)

(assert (=> b!251148 m!267585))

(assert (=> d!61107 m!267291))

(assert (=> bm!23615 m!267255))

(assert (=> d!61067 d!61107))

(assert (=> d!61067 d!61049))

(declare-fun d!61109 () Bool)

(assert (=> d!61109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) (mask!10824 thiss!1504))))

(assert (=> d!61109 true))

(declare-fun _$56!27 () Unit!7734)

(assert (=> d!61109 (= (choose!102 key!932 (_keys!6772 thiss!1504) index!297 (mask!10824 thiss!1504)) _$56!27)))

(declare-fun bs!9011 () Bool)

(assert (= bs!9011 d!61109))

(assert (=> bs!9011 m!267271))

(assert (=> bs!9011 m!267421))

(assert (=> d!61059 d!61109))

(assert (=> d!61059 d!61049))

(declare-fun d!61111 () Bool)

(declare-fun lt!125888 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!167 (List!3645) (InoxSet (_ BitVec 64)))

(assert (=> d!61111 (= lt!125888 (select (content!167 Nil!3642) (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun e!162881 () Bool)

(assert (=> d!61111 (= lt!125888 e!162881)))

(declare-fun res!122979 () Bool)

(assert (=> d!61111 (=> (not res!122979) (not e!162881))))

(assert (=> d!61111 (= res!122979 ((_ is Cons!3641) Nil!3642))))

(assert (=> d!61111 (= (contains!1796 Nil!3642 (select (arr!5834 lt!125684) #b00000000000000000000000000000000)) lt!125888)))

(declare-fun b!251159 () Bool)

(declare-fun e!162880 () Bool)

(assert (=> b!251159 (= e!162881 e!162880)))

(declare-fun res!122980 () Bool)

(assert (=> b!251159 (=> res!122980 e!162880)))

(assert (=> b!251159 (= res!122980 (= (h!4301 Nil!3642) (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(declare-fun b!251160 () Bool)

(assert (=> b!251160 (= e!162880 (contains!1796 (t!8672 Nil!3642) (select (arr!5834 lt!125684) #b00000000000000000000000000000000)))))

(assert (= (and d!61111 res!122979) b!251159))

(assert (= (and b!251159 (not res!122980)) b!251160))

(declare-fun m!267587 () Bool)

(assert (=> d!61111 m!267587))

(assert (=> d!61111 m!267403))

(declare-fun m!267589 () Bool)

(assert (=> d!61111 m!267589))

(assert (=> b!251160 m!267403))

(declare-fun m!267591 () Bool)

(assert (=> b!251160 m!267591))

(assert (=> b!250940 d!61111))

(declare-fun b!251173 () Bool)

(declare-fun e!162888 () SeekEntryResult!1088)

(assert (=> b!251173 (= e!162888 (MissingVacant!1088 (index!6524 lt!125779)))))

(declare-fun b!251174 () Bool)

(declare-fun e!162889 () SeekEntryResult!1088)

(declare-fun e!162890 () SeekEntryResult!1088)

(assert (=> b!251174 (= e!162889 e!162890)))

(declare-fun c!42251 () Bool)

(declare-fun lt!125893 () (_ BitVec 64))

(assert (=> b!251174 (= c!42251 (= lt!125893 key!932))))

(declare-fun d!61113 () Bool)

(declare-fun lt!125894 () SeekEntryResult!1088)

(assert (=> d!61113 (and (or ((_ is Undefined!1088) lt!125894) (not ((_ is Found!1088) lt!125894)) (and (bvsge (index!6523 lt!125894) #b00000000000000000000000000000000) (bvslt (index!6523 lt!125894) (size!6179 (_keys!6772 thiss!1504))))) (or ((_ is Undefined!1088) lt!125894) ((_ is Found!1088) lt!125894) (not ((_ is MissingVacant!1088) lt!125894)) (not (= (index!6525 lt!125894) (index!6524 lt!125779))) (and (bvsge (index!6525 lt!125894) #b00000000000000000000000000000000) (bvslt (index!6525 lt!125894) (size!6179 (_keys!6772 thiss!1504))))) (or ((_ is Undefined!1088) lt!125894) (ite ((_ is Found!1088) lt!125894) (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6523 lt!125894)) key!932) (and ((_ is MissingVacant!1088) lt!125894) (= (index!6525 lt!125894) (index!6524 lt!125779)) (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6525 lt!125894)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!61113 (= lt!125894 e!162889)))

(declare-fun c!42252 () Bool)

(assert (=> d!61113 (= c!42252 (bvsge (x!24656 lt!125779) #b01111111111111111111111111111110))))

(assert (=> d!61113 (= lt!125893 (select (arr!5834 (_keys!6772 thiss!1504)) (index!6524 lt!125779)))))

(assert (=> d!61113 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61113 (= (seekKeyOrZeroReturnVacant!0 (x!24656 lt!125779) (index!6524 lt!125779) (index!6524 lt!125779) key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)) lt!125894)))

(declare-fun b!251175 () Bool)

(assert (=> b!251175 (= e!162890 (Found!1088 (index!6524 lt!125779)))))

(declare-fun b!251176 () Bool)

(declare-fun c!42253 () Bool)

(assert (=> b!251176 (= c!42253 (= lt!125893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251176 (= e!162890 e!162888)))

(declare-fun b!251177 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251177 (= e!162888 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24656 lt!125779) #b00000000000000000000000000000001) (nextIndex!0 (index!6524 lt!125779) (bvadd (x!24656 lt!125779) #b00000000000000000000000000000001) (mask!10824 thiss!1504)) (index!6524 lt!125779) key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun b!251178 () Bool)

(assert (=> b!251178 (= e!162889 Undefined!1088)))

(assert (= (and d!61113 c!42252) b!251178))

(assert (= (and d!61113 (not c!42252)) b!251174))

(assert (= (and b!251174 c!42251) b!251175))

(assert (= (and b!251174 (not c!42251)) b!251176))

(assert (= (and b!251176 c!42253) b!251173))

(assert (= (and b!251176 (not c!42253)) b!251177))

(declare-fun m!267593 () Bool)

(assert (=> d!61113 m!267593))

(declare-fun m!267595 () Bool)

(assert (=> d!61113 m!267595))

(assert (=> d!61113 m!267445))

(assert (=> d!61113 m!267253))

(declare-fun m!267597 () Bool)

(assert (=> b!251177 m!267597))

(assert (=> b!251177 m!267597))

(declare-fun m!267599 () Bool)

(assert (=> b!251177 m!267599))

(assert (=> b!250986 d!61113))

(declare-fun d!61115 () Bool)

(declare-fun e!162893 () Bool)

(assert (=> d!61115 e!162893))

(declare-fun res!122986 () Bool)

(assert (=> d!61115 (=> (not res!122986) (not e!162893))))

(declare-fun lt!125903 () ListLongMap!3683)

(assert (=> d!61115 (= res!122986 (contains!1795 lt!125903 (_1!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))))))

(declare-fun lt!125904 () List!3644)

(assert (=> d!61115 (= lt!125903 (ListLongMap!3684 lt!125904))))

(declare-fun lt!125905 () Unit!7734)

(declare-fun lt!125906 () Unit!7734)

(assert (=> d!61115 (= lt!125905 lt!125906)))

(assert (=> d!61115 (= (getValueByKey!300 lt!125904 (_1!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!160 (List!3644 (_ BitVec 64) V!8305) Unit!7734)

(assert (=> d!61115 (= lt!125906 (lemmaContainsTupThenGetReturnValue!160 lt!125904 (_1!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))))))

(declare-fun insertStrictlySorted!163 (List!3644 (_ BitVec 64) V!8305) List!3644)

(assert (=> d!61115 (= lt!125904 (insertStrictlySorted!163 (toList!1857 lt!125867) (_1!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!61115 (= (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))) lt!125903)))

(declare-fun b!251183 () Bool)

(declare-fun res!122985 () Bool)

(assert (=> b!251183 (=> (not res!122985) (not e!162893))))

(assert (=> b!251183 (= res!122985 (= (getValueByKey!300 (toList!1857 lt!125903) (_1!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))))))))

(declare-fun b!251184 () Bool)

(declare-fun contains!1797 (List!3644 tuple2!4768) Bool)

(assert (=> b!251184 (= e!162893 (contains!1797 (toList!1857 lt!125903) (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))))))

(assert (= (and d!61115 res!122986) b!251183))

(assert (= (and b!251183 res!122985) b!251184))

(declare-fun m!267601 () Bool)

(assert (=> d!61115 m!267601))

(declare-fun m!267603 () Bool)

(assert (=> d!61115 m!267603))

(declare-fun m!267605 () Bool)

(assert (=> d!61115 m!267605))

(declare-fun m!267607 () Bool)

(assert (=> d!61115 m!267607))

(declare-fun m!267609 () Bool)

(assert (=> b!251183 m!267609))

(declare-fun m!267611 () Bool)

(assert (=> b!251184 m!267611))

(assert (=> b!251085 d!61115))

(declare-fun d!61117 () Bool)

(assert (=> d!61117 (= (apply!241 lt!125852 lt!125866) (get!3007 (getValueByKey!300 (toList!1857 lt!125852) lt!125866)))))

(declare-fun bs!9012 () Bool)

(assert (= bs!9012 d!61117))

(declare-fun m!267613 () Bool)

(assert (=> bs!9012 m!267613))

(assert (=> bs!9012 m!267613))

(declare-fun m!267615 () Bool)

(assert (=> bs!9012 m!267615))

(assert (=> b!251085 d!61117))

(declare-fun d!61119 () Bool)

(assert (=> d!61119 (= (apply!241 lt!125868 lt!125860) (get!3007 (getValueByKey!300 (toList!1857 lt!125868) lt!125860)))))

(declare-fun bs!9013 () Bool)

(assert (= bs!9013 d!61119))

(declare-fun m!267617 () Bool)

(assert (=> bs!9013 m!267617))

(assert (=> bs!9013 m!267617))

(declare-fun m!267619 () Bool)

(assert (=> bs!9013 m!267619))

(assert (=> b!251085 d!61119))

(declare-fun d!61121 () Bool)

(declare-fun e!162894 () Bool)

(assert (=> d!61121 e!162894))

(declare-fun res!122988 () Bool)

(assert (=> d!61121 (=> (not res!122988) (not e!162894))))

(declare-fun lt!125907 () ListLongMap!3683)

(assert (=> d!61121 (= res!122988 (contains!1795 lt!125907 (_1!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504)))))))

(declare-fun lt!125908 () List!3644)

(assert (=> d!61121 (= lt!125907 (ListLongMap!3684 lt!125908))))

(declare-fun lt!125909 () Unit!7734)

(declare-fun lt!125910 () Unit!7734)

(assert (=> d!61121 (= lt!125909 lt!125910)))

(assert (=> d!61121 (= (getValueByKey!300 lt!125908 (_1!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!61121 (= lt!125910 (lemmaContainsTupThenGetReturnValue!160 lt!125908 (_1!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!61121 (= lt!125908 (insertStrictlySorted!163 (toList!1857 lt!125852) (_1!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504)))))))

(assert (=> d!61121 (= (+!668 lt!125852 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))) lt!125907)))

(declare-fun b!251185 () Bool)

(declare-fun res!122987 () Bool)

(assert (=> b!251185 (=> (not res!122987) (not e!162894))))

(assert (=> b!251185 (= res!122987 (= (getValueByKey!300 (toList!1857 lt!125907) (_1!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))))))))

(declare-fun b!251186 () Bool)

(assert (=> b!251186 (= e!162894 (contains!1797 (toList!1857 lt!125907) (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))))))

(assert (= (and d!61121 res!122988) b!251185))

(assert (= (and b!251185 res!122987) b!251186))

(declare-fun m!267621 () Bool)

(assert (=> d!61121 m!267621))

(declare-fun m!267623 () Bool)

(assert (=> d!61121 m!267623))

(declare-fun m!267625 () Bool)

(assert (=> d!61121 m!267625))

(declare-fun m!267627 () Bool)

(assert (=> d!61121 m!267627))

(declare-fun m!267629 () Bool)

(assert (=> b!251185 m!267629))

(declare-fun m!267631 () Bool)

(assert (=> b!251186 m!267631))

(assert (=> b!251085 d!61121))

(declare-fun d!61123 () Bool)

(assert (=> d!61123 (= (apply!241 (+!668 lt!125861 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))) lt!125851) (apply!241 lt!125861 lt!125851))))

(declare-fun lt!125913 () Unit!7734)

(declare-fun choose!1198 (ListLongMap!3683 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7734)

(assert (=> d!61123 (= lt!125913 (choose!1198 lt!125861 lt!125855 (minValue!4475 thiss!1504) lt!125851))))

(declare-fun e!162897 () Bool)

(assert (=> d!61123 e!162897))

(declare-fun res!122991 () Bool)

(assert (=> d!61123 (=> (not res!122991) (not e!162897))))

(assert (=> d!61123 (= res!122991 (contains!1795 lt!125861 lt!125851))))

(assert (=> d!61123 (= (addApplyDifferent!217 lt!125861 lt!125855 (minValue!4475 thiss!1504) lt!125851) lt!125913)))

(declare-fun b!251190 () Bool)

(assert (=> b!251190 (= e!162897 (not (= lt!125851 lt!125855)))))

(assert (= (and d!61123 res!122991) b!251190))

(assert (=> d!61123 m!267491))

(assert (=> d!61123 m!267509))

(assert (=> d!61123 m!267491))

(declare-fun m!267633 () Bool)

(assert (=> d!61123 m!267633))

(declare-fun m!267635 () Bool)

(assert (=> d!61123 m!267635))

(assert (=> d!61123 m!267499))

(assert (=> b!251085 d!61123))

(declare-fun d!61125 () Bool)

(declare-fun e!162898 () Bool)

(assert (=> d!61125 e!162898))

(declare-fun res!122992 () Bool)

(assert (=> d!61125 (=> res!122992 e!162898)))

(declare-fun lt!125916 () Bool)

(assert (=> d!61125 (= res!122992 (not lt!125916))))

(declare-fun lt!125915 () Bool)

(assert (=> d!61125 (= lt!125916 lt!125915)))

(declare-fun lt!125917 () Unit!7734)

(declare-fun e!162899 () Unit!7734)

(assert (=> d!61125 (= lt!125917 e!162899)))

(declare-fun c!42254 () Bool)

(assert (=> d!61125 (= c!42254 lt!125915)))

(assert (=> d!61125 (= lt!125915 (containsKey!291 (toList!1857 (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))) lt!125853))))

(assert (=> d!61125 (= (contains!1795 (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))) lt!125853) lt!125916)))

(declare-fun b!251191 () Bool)

(declare-fun lt!125914 () Unit!7734)

(assert (=> b!251191 (= e!162899 lt!125914)))

(assert (=> b!251191 (= lt!125914 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1857 (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))) lt!125853))))

(assert (=> b!251191 (isDefined!240 (getValueByKey!300 (toList!1857 (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))) lt!125853))))

(declare-fun b!251192 () Bool)

(declare-fun Unit!7747 () Unit!7734)

(assert (=> b!251192 (= e!162899 Unit!7747)))

(declare-fun b!251193 () Bool)

(assert (=> b!251193 (= e!162898 (isDefined!240 (getValueByKey!300 (toList!1857 (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504)))) lt!125853)))))

(assert (= (and d!61125 c!42254) b!251191))

(assert (= (and d!61125 (not c!42254)) b!251192))

(assert (= (and d!61125 (not res!122992)) b!251193))

(declare-fun m!267637 () Bool)

(assert (=> d!61125 m!267637))

(declare-fun m!267639 () Bool)

(assert (=> b!251191 m!267639))

(declare-fun m!267641 () Bool)

(assert (=> b!251191 m!267641))

(assert (=> b!251191 m!267641))

(declare-fun m!267643 () Bool)

(assert (=> b!251191 m!267643))

(assert (=> b!251193 m!267641))

(assert (=> b!251193 m!267641))

(assert (=> b!251193 m!267643))

(assert (=> b!251085 d!61125))

(declare-fun d!61127 () Bool)

(assert (=> d!61127 (contains!1795 (+!668 lt!125867 (tuple2!4769 lt!125865 (zeroValue!4475 thiss!1504))) lt!125853)))

(declare-fun lt!125920 () Unit!7734)

(declare-fun choose!1199 (ListLongMap!3683 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7734)

(assert (=> d!61127 (= lt!125920 (choose!1199 lt!125867 lt!125865 (zeroValue!4475 thiss!1504) lt!125853))))

(assert (=> d!61127 (contains!1795 lt!125867 lt!125853)))

(assert (=> d!61127 (= (addStillContains!217 lt!125867 lt!125865 (zeroValue!4475 thiss!1504) lt!125853) lt!125920)))

(declare-fun bs!9014 () Bool)

(assert (= bs!9014 d!61127))

(assert (=> bs!9014 m!267497))

(assert (=> bs!9014 m!267497))

(assert (=> bs!9014 m!267507))

(declare-fun m!267645 () Bool)

(assert (=> bs!9014 m!267645))

(declare-fun m!267647 () Bool)

(assert (=> bs!9014 m!267647))

(assert (=> b!251085 d!61127))

(declare-fun b!251219 () Bool)

(declare-fun lt!125940 () Unit!7734)

(declare-fun lt!125941 () Unit!7734)

(assert (=> b!251219 (= lt!125940 lt!125941)))

(declare-fun lt!125937 () ListLongMap!3683)

(declare-fun lt!125938 () (_ BitVec 64))

(declare-fun lt!125939 () (_ BitVec 64))

(declare-fun lt!125936 () V!8305)

(assert (=> b!251219 (not (contains!1795 (+!668 lt!125937 (tuple2!4769 lt!125938 lt!125936)) lt!125939))))

(declare-fun addStillNotContains!125 (ListLongMap!3683 (_ BitVec 64) V!8305 (_ BitVec 64)) Unit!7734)

(assert (=> b!251219 (= lt!125941 (addStillNotContains!125 lt!125937 lt!125938 lt!125936 lt!125939))))

(assert (=> b!251219 (= lt!125939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!251219 (= lt!125936 (get!3006 (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251219 (= lt!125938 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!23621 () ListLongMap!3683)

(assert (=> b!251219 (= lt!125937 call!23621)))

(declare-fun e!162918 () ListLongMap!3683)

(assert (=> b!251219 (= e!162918 (+!668 call!23621 (tuple2!4769 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000) (get!3006 (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!251220 () Bool)

(declare-fun e!162919 () Bool)

(declare-fun lt!125935 () ListLongMap!3683)

(declare-fun isEmpty!534 (ListLongMap!3683) Bool)

(assert (=> b!251220 (= e!162919 (isEmpty!534 lt!125935))))

(declare-fun b!251221 () Bool)

(declare-fun e!162917 () Bool)

(declare-fun e!162914 () Bool)

(assert (=> b!251221 (= e!162917 e!162914)))

(assert (=> b!251221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun res!123003 () Bool)

(assert (=> b!251221 (= res!123003 (contains!1795 lt!125935 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251221 (=> (not res!123003) (not e!162914))))

(declare-fun b!251222 () Bool)

(declare-fun e!162920 () Bool)

(assert (=> b!251222 (= e!162920 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251222 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!251223 () Bool)

(assert (=> b!251223 (= e!162919 (= lt!125935 (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4634 thiss!1504))))))

(declare-fun b!251224 () Bool)

(declare-fun e!162916 () ListLongMap!3683)

(assert (=> b!251224 (= e!162916 e!162918)))

(declare-fun c!42266 () Bool)

(assert (=> b!251224 (= c!42266 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61129 () Bool)

(declare-fun e!162915 () Bool)

(assert (=> d!61129 e!162915))

(declare-fun res!123002 () Bool)

(assert (=> d!61129 (=> (not res!123002) (not e!162915))))

(assert (=> d!61129 (= res!123002 (not (contains!1795 lt!125935 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61129 (= lt!125935 e!162916)))

(declare-fun c!42263 () Bool)

(assert (=> d!61129 (= c!42263 (bvsge #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61129 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61129 (= (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) lt!125935)))

(declare-fun b!251225 () Bool)

(assert (=> b!251225 (= e!162916 (ListLongMap!3684 Nil!3641))))

(declare-fun b!251226 () Bool)

(declare-fun res!123001 () Bool)

(assert (=> b!251226 (=> (not res!123001) (not e!162915))))

(assert (=> b!251226 (= res!123001 (not (contains!1795 lt!125935 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251227 () Bool)

(assert (=> b!251227 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> b!251227 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6178 (_values!4617 thiss!1504))))))

(assert (=> b!251227 (= e!162914 (= (apply!241 lt!125935 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)) (get!3006 (select (arr!5833 (_values!4617 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4634 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251228 () Bool)

(assert (=> b!251228 (= e!162917 e!162919)))

(declare-fun c!42264 () Bool)

(assert (=> b!251228 (= c!42264 (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!251229 () Bool)

(assert (=> b!251229 (= e!162918 call!23621)))

(declare-fun bm!23618 () Bool)

(assert (=> bm!23618 (= call!23621 (getCurrentListMapNoExtraKeys!557 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4634 thiss!1504)))))

(declare-fun b!251230 () Bool)

(assert (=> b!251230 (= e!162915 e!162917)))

(declare-fun c!42265 () Bool)

(assert (=> b!251230 (= c!42265 e!162920)))

(declare-fun res!123004 () Bool)

(assert (=> b!251230 (=> (not res!123004) (not e!162920))))

(assert (=> b!251230 (= res!123004 (bvslt #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (= (and d!61129 c!42263) b!251225))

(assert (= (and d!61129 (not c!42263)) b!251224))

(assert (= (and b!251224 c!42266) b!251219))

(assert (= (and b!251224 (not c!42266)) b!251229))

(assert (= (or b!251219 b!251229) bm!23618))

(assert (= (and d!61129 res!123002) b!251226))

(assert (= (and b!251226 res!123001) b!251230))

(assert (= (and b!251230 res!123004) b!251222))

(assert (= (and b!251230 c!42265) b!251221))

(assert (= (and b!251230 (not c!42265)) b!251228))

(assert (= (and b!251221 res!123003) b!251227))

(assert (= (and b!251228 c!42264) b!251223))

(assert (= (and b!251228 (not c!42264)) b!251220))

(declare-fun b_lambda!8117 () Bool)

(assert (=> (not b_lambda!8117) (not b!251219)))

(assert (=> b!251219 t!8675))

(declare-fun b_and!13675 () Bool)

(assert (= b_and!13673 (and (=> t!8675 result!5299) b_and!13675)))

(declare-fun b_lambda!8119 () Bool)

(assert (=> (not b_lambda!8119) (not b!251227)))

(assert (=> b!251227 t!8675))

(declare-fun b_and!13677 () Bool)

(assert (= b_and!13675 (and (=> t!8675 result!5299) b_and!13677)))

(assert (=> b!251222 m!267415))

(assert (=> b!251222 m!267415))

(assert (=> b!251222 m!267425))

(assert (=> b!251224 m!267415))

(assert (=> b!251224 m!267415))

(assert (=> b!251224 m!267425))

(declare-fun m!267649 () Bool)

(assert (=> b!251223 m!267649))

(declare-fun m!267651 () Bool)

(assert (=> b!251220 m!267651))

(assert (=> b!251219 m!267475))

(assert (=> b!251219 m!267475))

(assert (=> b!251219 m!267477))

(assert (=> b!251219 m!267479))

(assert (=> b!251219 m!267477))

(assert (=> b!251219 m!267415))

(declare-fun m!267653 () Bool)

(assert (=> b!251219 m!267653))

(declare-fun m!267655 () Bool)

(assert (=> b!251219 m!267655))

(declare-fun m!267657 () Bool)

(assert (=> b!251219 m!267657))

(assert (=> b!251219 m!267655))

(declare-fun m!267659 () Bool)

(assert (=> b!251219 m!267659))

(assert (=> b!251227 m!267415))

(declare-fun m!267661 () Bool)

(assert (=> b!251227 m!267661))

(assert (=> b!251227 m!267475))

(assert (=> b!251227 m!267475))

(assert (=> b!251227 m!267477))

(assert (=> b!251227 m!267479))

(assert (=> b!251227 m!267477))

(assert (=> b!251227 m!267415))

(assert (=> bm!23618 m!267649))

(assert (=> b!251221 m!267415))

(assert (=> b!251221 m!267415))

(declare-fun m!267663 () Bool)

(assert (=> b!251221 m!267663))

(declare-fun m!267665 () Bool)

(assert (=> d!61129 m!267665))

(assert (=> d!61129 m!267253))

(declare-fun m!267667 () Bool)

(assert (=> b!251226 m!267667))

(assert (=> b!251085 d!61129))

(declare-fun d!61131 () Bool)

(assert (=> d!61131 (= (apply!241 (+!668 lt!125852 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))) lt!125866) (apply!241 lt!125852 lt!125866))))

(declare-fun lt!125942 () Unit!7734)

(assert (=> d!61131 (= lt!125942 (choose!1198 lt!125852 lt!125869 (zeroValue!4475 thiss!1504) lt!125866))))

(declare-fun e!162921 () Bool)

(assert (=> d!61131 e!162921))

(declare-fun res!123005 () Bool)

(assert (=> d!61131 (=> (not res!123005) (not e!162921))))

(assert (=> d!61131 (= res!123005 (contains!1795 lt!125852 lt!125866))))

(assert (=> d!61131 (= (addApplyDifferent!217 lt!125852 lt!125869 (zeroValue!4475 thiss!1504) lt!125866) lt!125942)))

(declare-fun b!251231 () Bool)

(assert (=> b!251231 (= e!162921 (not (= lt!125866 lt!125869)))))

(assert (= (and d!61131 res!123005) b!251231))

(assert (=> d!61131 m!267513))

(assert (=> d!61131 m!267515))

(assert (=> d!61131 m!267513))

(declare-fun m!267669 () Bool)

(assert (=> d!61131 m!267669))

(declare-fun m!267671 () Bool)

(assert (=> d!61131 m!267671))

(assert (=> d!61131 m!267511))

(assert (=> b!251085 d!61131))

(declare-fun d!61133 () Bool)

(declare-fun e!162922 () Bool)

(assert (=> d!61133 e!162922))

(declare-fun res!123007 () Bool)

(assert (=> d!61133 (=> (not res!123007) (not e!162922))))

(declare-fun lt!125943 () ListLongMap!3683)

(assert (=> d!61133 (= res!123007 (contains!1795 lt!125943 (_1!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504)))))))

(declare-fun lt!125944 () List!3644)

(assert (=> d!61133 (= lt!125943 (ListLongMap!3684 lt!125944))))

(declare-fun lt!125945 () Unit!7734)

(declare-fun lt!125946 () Unit!7734)

(assert (=> d!61133 (= lt!125945 lt!125946)))

(assert (=> d!61133 (= (getValueByKey!300 lt!125944 (_1!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504)))))))

(assert (=> d!61133 (= lt!125946 (lemmaContainsTupThenGetReturnValue!160 lt!125944 (_1!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504)))))))

(assert (=> d!61133 (= lt!125944 (insertStrictlySorted!163 (toList!1857 lt!125868) (_1!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504)))))))

(assert (=> d!61133 (= (+!668 lt!125868 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))) lt!125943)))

(declare-fun b!251232 () Bool)

(declare-fun res!123006 () Bool)

(assert (=> b!251232 (=> (not res!123006) (not e!162922))))

(assert (=> b!251232 (= res!123006 (= (getValueByKey!300 (toList!1857 lt!125943) (_1!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))))))))

(declare-fun b!251233 () Bool)

(assert (=> b!251233 (= e!162922 (contains!1797 (toList!1857 lt!125943) (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))))))

(assert (= (and d!61133 res!123007) b!251232))

(assert (= (and b!251232 res!123006) b!251233))

(declare-fun m!267673 () Bool)

(assert (=> d!61133 m!267673))

(declare-fun m!267675 () Bool)

(assert (=> d!61133 m!267675))

(declare-fun m!267677 () Bool)

(assert (=> d!61133 m!267677))

(declare-fun m!267679 () Bool)

(assert (=> d!61133 m!267679))

(declare-fun m!267681 () Bool)

(assert (=> b!251232 m!267681))

(declare-fun m!267683 () Bool)

(assert (=> b!251233 m!267683))

(assert (=> b!251085 d!61133))

(declare-fun d!61135 () Bool)

(assert (=> d!61135 (= (apply!241 (+!668 lt!125852 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504))) lt!125866) (get!3007 (getValueByKey!300 (toList!1857 (+!668 lt!125852 (tuple2!4769 lt!125869 (zeroValue!4475 thiss!1504)))) lt!125866)))))

(declare-fun bs!9015 () Bool)

(assert (= bs!9015 d!61135))

(declare-fun m!267685 () Bool)

(assert (=> bs!9015 m!267685))

(assert (=> bs!9015 m!267685))

(declare-fun m!267687 () Bool)

(assert (=> bs!9015 m!267687))

(assert (=> b!251085 d!61135))

(declare-fun d!61137 () Bool)

(assert (=> d!61137 (= (apply!241 (+!668 lt!125868 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))) lt!125860) (get!3007 (getValueByKey!300 (toList!1857 (+!668 lt!125868 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504)))) lt!125860)))))

(declare-fun bs!9016 () Bool)

(assert (= bs!9016 d!61137))

(declare-fun m!267689 () Bool)

(assert (=> bs!9016 m!267689))

(assert (=> bs!9016 m!267689))

(declare-fun m!267691 () Bool)

(assert (=> bs!9016 m!267691))

(assert (=> b!251085 d!61137))

(declare-fun d!61139 () Bool)

(assert (=> d!61139 (= (apply!241 (+!668 lt!125868 (tuple2!4769 lt!125864 (minValue!4475 thiss!1504))) lt!125860) (apply!241 lt!125868 lt!125860))))

(declare-fun lt!125947 () Unit!7734)

(assert (=> d!61139 (= lt!125947 (choose!1198 lt!125868 lt!125864 (minValue!4475 thiss!1504) lt!125860))))

(declare-fun e!162923 () Bool)

(assert (=> d!61139 e!162923))

(declare-fun res!123008 () Bool)

(assert (=> d!61139 (=> (not res!123008) (not e!162923))))

(assert (=> d!61139 (= res!123008 (contains!1795 lt!125868 lt!125860))))

(assert (=> d!61139 (= (addApplyDifferent!217 lt!125868 lt!125864 (minValue!4475 thiss!1504) lt!125860) lt!125947)))

(declare-fun b!251234 () Bool)

(assert (=> b!251234 (= e!162923 (not (= lt!125860 lt!125864)))))

(assert (= (and d!61139 res!123008) b!251234))

(assert (=> d!61139 m!267493))

(assert (=> d!61139 m!267495))

(assert (=> d!61139 m!267493))

(declare-fun m!267693 () Bool)

(assert (=> d!61139 m!267693))

(declare-fun m!267695 () Bool)

(assert (=> d!61139 m!267695))

(assert (=> d!61139 m!267503))

(assert (=> b!251085 d!61139))

(declare-fun d!61141 () Bool)

(assert (=> d!61141 (= (apply!241 lt!125861 lt!125851) (get!3007 (getValueByKey!300 (toList!1857 lt!125861) lt!125851)))))

(declare-fun bs!9017 () Bool)

(assert (= bs!9017 d!61141))

(declare-fun m!267697 () Bool)

(assert (=> bs!9017 m!267697))

(assert (=> bs!9017 m!267697))

(declare-fun m!267699 () Bool)

(assert (=> bs!9017 m!267699))

(assert (=> b!251085 d!61141))

(declare-fun d!61143 () Bool)

(declare-fun e!162924 () Bool)

(assert (=> d!61143 e!162924))

(declare-fun res!123010 () Bool)

(assert (=> d!61143 (=> (not res!123010) (not e!162924))))

(declare-fun lt!125948 () ListLongMap!3683)

(assert (=> d!61143 (= res!123010 (contains!1795 lt!125948 (_1!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504)))))))

(declare-fun lt!125949 () List!3644)

(assert (=> d!61143 (= lt!125948 (ListLongMap!3684 lt!125949))))

(declare-fun lt!125950 () Unit!7734)

(declare-fun lt!125951 () Unit!7734)

(assert (=> d!61143 (= lt!125950 lt!125951)))

(assert (=> d!61143 (= (getValueByKey!300 lt!125949 (_1!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504)))))))

(assert (=> d!61143 (= lt!125951 (lemmaContainsTupThenGetReturnValue!160 lt!125949 (_1!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504)))))))

(assert (=> d!61143 (= lt!125949 (insertStrictlySorted!163 (toList!1857 lt!125861) (_1!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504)))))))

(assert (=> d!61143 (= (+!668 lt!125861 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))) lt!125948)))

(declare-fun b!251235 () Bool)

(declare-fun res!123009 () Bool)

(assert (=> b!251235 (=> (not res!123009) (not e!162924))))

(assert (=> b!251235 (= res!123009 (= (getValueByKey!300 (toList!1857 lt!125948) (_1!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))))))))

(declare-fun b!251236 () Bool)

(assert (=> b!251236 (= e!162924 (contains!1797 (toList!1857 lt!125948) (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))))))

(assert (= (and d!61143 res!123010) b!251235))

(assert (= (and b!251235 res!123009) b!251236))

(declare-fun m!267701 () Bool)

(assert (=> d!61143 m!267701))

(declare-fun m!267703 () Bool)

(assert (=> d!61143 m!267703))

(declare-fun m!267705 () Bool)

(assert (=> d!61143 m!267705))

(declare-fun m!267707 () Bool)

(assert (=> d!61143 m!267707))

(declare-fun m!267709 () Bool)

(assert (=> b!251235 m!267709))

(declare-fun m!267711 () Bool)

(assert (=> b!251236 m!267711))

(assert (=> b!251085 d!61143))

(declare-fun d!61145 () Bool)

(assert (=> d!61145 (= (apply!241 (+!668 lt!125861 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504))) lt!125851) (get!3007 (getValueByKey!300 (toList!1857 (+!668 lt!125861 (tuple2!4769 lt!125855 (minValue!4475 thiss!1504)))) lt!125851)))))

(declare-fun bs!9018 () Bool)

(assert (= bs!9018 d!61145))

(declare-fun m!267713 () Bool)

(assert (=> bs!9018 m!267713))

(assert (=> bs!9018 m!267713))

(declare-fun m!267715 () Bool)

(assert (=> bs!9018 m!267715))

(assert (=> b!251085 d!61145))

(declare-fun d!61147 () Bool)

(declare-fun e!162925 () Bool)

(assert (=> d!61147 e!162925))

(declare-fun res!123012 () Bool)

(assert (=> d!61147 (=> (not res!123012) (not e!162925))))

(declare-fun lt!125952 () ListLongMap!3683)

(assert (=> d!61147 (= res!123012 (contains!1795 lt!125952 (_1!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(declare-fun lt!125953 () List!3644)

(assert (=> d!61147 (= lt!125952 (ListLongMap!3684 lt!125953))))

(declare-fun lt!125954 () Unit!7734)

(declare-fun lt!125955 () Unit!7734)

(assert (=> d!61147 (= lt!125954 lt!125955)))

(assert (=> d!61147 (= (getValueByKey!300 lt!125953 (_1!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))) (Some!305 (_2!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(assert (=> d!61147 (= lt!125955 (lemmaContainsTupThenGetReturnValue!160 lt!125953 (_1!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (_2!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(assert (=> d!61147 (= lt!125953 (insertStrictlySorted!163 (toList!1857 (ite c!42227 call!23606 (ite c!42229 call!23605 call!23608))) (_1!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (_2!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(assert (=> d!61147 (= (+!668 (ite c!42227 call!23606 (ite c!42229 call!23605 call!23608)) (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) lt!125952)))

(declare-fun b!251237 () Bool)

(declare-fun res!123011 () Bool)

(assert (=> b!251237 (=> (not res!123011) (not e!162925))))

(assert (=> b!251237 (= res!123011 (= (getValueByKey!300 (toList!1857 lt!125952) (_1!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))) (Some!305 (_2!2395 (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))))

(declare-fun b!251238 () Bool)

(assert (=> b!251238 (= e!162925 (contains!1797 (toList!1857 lt!125952) (ite (or c!42227 c!42229) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4475 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (= (and d!61147 res!123012) b!251237))

(assert (= (and b!251237 res!123011) b!251238))

(declare-fun m!267717 () Bool)

(assert (=> d!61147 m!267717))

(declare-fun m!267719 () Bool)

(assert (=> d!61147 m!267719))

(declare-fun m!267721 () Bool)

(assert (=> d!61147 m!267721))

(declare-fun m!267723 () Bool)

(assert (=> d!61147 m!267723))

(declare-fun m!267725 () Bool)

(assert (=> b!251237 m!267725))

(declare-fun m!267727 () Bool)

(assert (=> b!251238 m!267727))

(assert (=> bm!23605 d!61147))

(declare-fun d!61149 () Bool)

(declare-fun res!123013 () Bool)

(declare-fun e!162926 () Bool)

(assert (=> d!61149 (=> res!123013 e!162926)))

(assert (=> d!61149 (= res!123013 (= (select (arr!5834 (_keys!6772 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61149 (= (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!162926)))

(declare-fun b!251239 () Bool)

(declare-fun e!162927 () Bool)

(assert (=> b!251239 (= e!162926 e!162927)))

(declare-fun res!123014 () Bool)

(assert (=> b!251239 (=> (not res!123014) (not e!162927))))

(assert (=> b!251239 (= res!123014 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!251240 () Bool)

(assert (=> b!251240 (= e!162927 (arrayContainsKey!0 (_keys!6772 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61149 (not res!123013)) b!251239))

(assert (= (and b!251239 res!123014) b!251240))

(declare-fun m!267729 () Bool)

(assert (=> d!61149 m!267729))

(declare-fun m!267731 () Bool)

(assert (=> b!251240 m!267731))

(assert (=> b!250950 d!61149))

(declare-fun b!251259 () Bool)

(declare-fun e!162938 () SeekEntryResult!1088)

(assert (=> b!251259 (= e!162938 (Intermediate!1088 false (toIndex!0 key!932 (mask!10824 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251260 () Bool)

(declare-fun e!162941 () Bool)

(declare-fun e!162939 () Bool)

(assert (=> b!251260 (= e!162941 e!162939)))

(declare-fun res!123021 () Bool)

(declare-fun lt!125960 () SeekEntryResult!1088)

(assert (=> b!251260 (= res!123021 (and ((_ is Intermediate!1088) lt!125960) (not (undefined!1900 lt!125960)) (bvslt (x!24656 lt!125960) #b01111111111111111111111111111110) (bvsge (x!24656 lt!125960) #b00000000000000000000000000000000) (bvsge (x!24656 lt!125960) #b00000000000000000000000000000000)))))

(assert (=> b!251260 (=> (not res!123021) (not e!162939))))

(declare-fun b!251261 () Bool)

(assert (=> b!251261 (and (bvsge (index!6524 lt!125960) #b00000000000000000000000000000000) (bvslt (index!6524 lt!125960) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun res!123023 () Bool)

(assert (=> b!251261 (= res!123023 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6524 lt!125960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162942 () Bool)

(assert (=> b!251261 (=> res!123023 e!162942)))

(declare-fun b!251262 () Bool)

(declare-fun e!162940 () SeekEntryResult!1088)

(assert (=> b!251262 (= e!162940 e!162938)))

(declare-fun c!42273 () Bool)

(declare-fun lt!125961 () (_ BitVec 64))

(assert (=> b!251262 (= c!42273 (or (= lt!125961 key!932) (= (bvadd lt!125961 lt!125961) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!61151 () Bool)

(assert (=> d!61151 e!162941))

(declare-fun c!42275 () Bool)

(assert (=> d!61151 (= c!42275 (and ((_ is Intermediate!1088) lt!125960) (undefined!1900 lt!125960)))))

(assert (=> d!61151 (= lt!125960 e!162940)))

(declare-fun c!42274 () Bool)

(assert (=> d!61151 (= c!42274 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!61151 (= lt!125961 (select (arr!5834 (_keys!6772 thiss!1504)) (toIndex!0 key!932 (mask!10824 thiss!1504))))))

(assert (=> d!61151 (validMask!0 (mask!10824 thiss!1504))))

(assert (=> d!61151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10824 thiss!1504)) key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)) lt!125960)))

(declare-fun b!251263 () Bool)

(assert (=> b!251263 (and (bvsge (index!6524 lt!125960) #b00000000000000000000000000000000) (bvslt (index!6524 lt!125960) (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> b!251263 (= e!162942 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6524 lt!125960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251264 () Bool)

(assert (=> b!251264 (and (bvsge (index!6524 lt!125960) #b00000000000000000000000000000000) (bvslt (index!6524 lt!125960) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun res!123022 () Bool)

(assert (=> b!251264 (= res!123022 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6524 lt!125960)) key!932))))

(assert (=> b!251264 (=> res!123022 e!162942)))

(assert (=> b!251264 (= e!162939 e!162942)))

(declare-fun b!251265 () Bool)

(assert (=> b!251265 (= e!162938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10824 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10824 thiss!1504)) key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun b!251266 () Bool)

(assert (=> b!251266 (= e!162941 (bvsge (x!24656 lt!125960) #b01111111111111111111111111111110))))

(declare-fun b!251267 () Bool)

(assert (=> b!251267 (= e!162940 (Intermediate!1088 true (toIndex!0 key!932 (mask!10824 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!61151 c!42274) b!251267))

(assert (= (and d!61151 (not c!42274)) b!251262))

(assert (= (and b!251262 c!42273) b!251259))

(assert (= (and b!251262 (not c!42273)) b!251265))

(assert (= (and d!61151 c!42275) b!251266))

(assert (= (and d!61151 (not c!42275)) b!251260))

(assert (= (and b!251260 res!123021) b!251264))

(assert (= (and b!251264 (not res!123022)) b!251261))

(assert (= (and b!251261 (not res!123023)) b!251263))

(declare-fun m!267733 () Bool)

(assert (=> b!251264 m!267733))

(assert (=> b!251263 m!267733))

(assert (=> d!61151 m!267437))

(declare-fun m!267735 () Bool)

(assert (=> d!61151 m!267735))

(assert (=> d!61151 m!267253))

(assert (=> b!251265 m!267437))

(declare-fun m!267737 () Bool)

(assert (=> b!251265 m!267737))

(assert (=> b!251265 m!267737))

(declare-fun m!267739 () Bool)

(assert (=> b!251265 m!267739))

(assert (=> b!251261 m!267733))

(assert (=> d!61065 d!61151))

(declare-fun d!61153 () Bool)

(declare-fun lt!125967 () (_ BitVec 32))

(declare-fun lt!125966 () (_ BitVec 32))

(assert (=> d!61153 (= lt!125967 (bvmul (bvxor lt!125966 (bvlshr lt!125966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!61153 (= lt!125966 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!61153 (and (bvsge (mask!10824 thiss!1504) #b00000000000000000000000000000000) (let ((res!123024 (let ((h!4303 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24676 (bvmul (bvxor h!4303 (bvlshr h!4303 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24676 (bvlshr x!24676 #b00000000000000000000000000001101)) (mask!10824 thiss!1504)))))) (and (bvslt res!123024 (bvadd (mask!10824 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!123024 #b00000000000000000000000000000000))))))

(assert (=> d!61153 (= (toIndex!0 key!932 (mask!10824 thiss!1504)) (bvand (bvxor lt!125967 (bvlshr lt!125967 #b00000000000000000000000000001101)) (mask!10824 thiss!1504)))))

(assert (=> d!61065 d!61153))

(assert (=> d!61065 d!61049))

(declare-fun d!61155 () Bool)

(assert (=> d!61155 (= (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) index!297)) (and (not (= (select (arr!5834 (_keys!6772 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5834 (_keys!6772 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250911 d!61155))

(declare-fun d!61157 () Bool)

(declare-fun res!123034 () Bool)

(declare-fun e!162945 () Bool)

(assert (=> d!61157 (=> (not res!123034) (not e!162945))))

(assert (=> d!61157 (= res!123034 (validMask!0 (mask!10824 thiss!1504)))))

(assert (=> d!61157 (= (simpleValid!264 thiss!1504) e!162945)))

(declare-fun b!251276 () Bool)

(declare-fun res!123036 () Bool)

(assert (=> b!251276 (=> (not res!123036) (not e!162945))))

(assert (=> b!251276 (= res!123036 (and (= (size!6178 (_values!4617 thiss!1504)) (bvadd (mask!10824 thiss!1504) #b00000000000000000000000000000001)) (= (size!6179 (_keys!6772 thiss!1504)) (size!6178 (_values!4617 thiss!1504))) (bvsge (_size!1902 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1902 thiss!1504) (bvadd (mask!10824 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!251277 () Bool)

(declare-fun res!123035 () Bool)

(assert (=> b!251277 (=> (not res!123035) (not e!162945))))

(declare-fun size!6184 (LongMapFixedSize!3706) (_ BitVec 32))

(assert (=> b!251277 (= res!123035 (bvsge (size!6184 thiss!1504) (_size!1902 thiss!1504)))))

(declare-fun b!251279 () Bool)

(assert (=> b!251279 (= e!162945 (and (bvsge (extraKeys!4371 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4371 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1902 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!251278 () Bool)

(declare-fun res!123033 () Bool)

(assert (=> b!251278 (=> (not res!123033) (not e!162945))))

(assert (=> b!251278 (= res!123033 (= (size!6184 thiss!1504) (bvadd (_size!1902 thiss!1504) (bvsdiv (bvadd (extraKeys!4371 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!61157 res!123034) b!251276))

(assert (= (and b!251276 res!123036) b!251277))

(assert (= (and b!251277 res!123035) b!251278))

(assert (= (and b!251278 res!123033) b!251279))

(assert (=> d!61157 m!267253))

(declare-fun m!267741 () Bool)

(assert (=> b!251277 m!267741))

(assert (=> b!251278 m!267741))

(assert (=> d!61085 d!61157))

(declare-fun d!61159 () Bool)

(declare-fun res!123041 () Bool)

(declare-fun e!162950 () Bool)

(assert (=> d!61159 (=> res!123041 e!162950)))

(assert (=> d!61159 (= res!123041 (and ((_ is Cons!3640) (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (= (_1!2395 (h!4300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)))))

(assert (=> d!61159 (= (containsKey!291 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932) e!162950)))

(declare-fun b!251284 () Bool)

(declare-fun e!162951 () Bool)

(assert (=> b!251284 (= e!162950 e!162951)))

(declare-fun res!123042 () Bool)

(assert (=> b!251284 (=> (not res!123042) (not e!162951))))

(assert (=> b!251284 (= res!123042 (and (or (not ((_ is Cons!3640) (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) (bvsle (_1!2395 (h!4300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)) ((_ is Cons!3640) (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (bvslt (_1!2395 (h!4300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)))))

(declare-fun b!251285 () Bool)

(assert (=> b!251285 (= e!162951 (containsKey!291 (t!8671 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) key!932))))

(assert (= (and d!61159 (not res!123041)) b!251284))

(assert (= (and b!251284 res!123042) b!251285))

(declare-fun m!267743 () Bool)

(assert (=> b!251285 m!267743))

(assert (=> d!61081 d!61159))

(declare-fun b!251286 () Bool)

(declare-fun e!162954 () Bool)

(declare-fun call!23622 () Bool)

(assert (=> b!251286 (= e!162954 call!23622)))

(declare-fun b!251287 () Bool)

(declare-fun e!162952 () Bool)

(assert (=> b!251287 (= e!162952 call!23622)))

(declare-fun d!61161 () Bool)

(declare-fun res!123044 () Bool)

(declare-fun e!162953 () Bool)

(assert (=> d!61161 (=> res!123044 e!162953)))

(assert (=> d!61161 (= res!123044 (bvsge #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)) e!162953)))

(declare-fun b!251288 () Bool)

(assert (=> b!251288 (= e!162953 e!162954)))

(declare-fun c!42276 () Bool)

(assert (=> b!251288 (= c!42276 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23619 () Bool)

(assert (=> bm!23619 (= call!23622 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun b!251289 () Bool)

(assert (=> b!251289 (= e!162954 e!162952)))

(declare-fun lt!125968 () (_ BitVec 64))

(assert (=> b!251289 (= lt!125968 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125969 () Unit!7734)

(assert (=> b!251289 (= lt!125969 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6772 thiss!1504) lt!125968 #b00000000000000000000000000000000))))

(assert (=> b!251289 (arrayContainsKey!0 (_keys!6772 thiss!1504) lt!125968 #b00000000000000000000000000000000)))

(declare-fun lt!125970 () Unit!7734)

(assert (=> b!251289 (= lt!125970 lt!125969)))

(declare-fun res!123043 () Bool)

(assert (=> b!251289 (= res!123043 (= (seekEntryOrOpen!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000) (_keys!6772 thiss!1504) (mask!10824 thiss!1504)) (Found!1088 #b00000000000000000000000000000000)))))

(assert (=> b!251289 (=> (not res!123043) (not e!162952))))

(assert (= (and d!61161 (not res!123044)) b!251288))

(assert (= (and b!251288 c!42276) b!251289))

(assert (= (and b!251288 (not c!42276)) b!251286))

(assert (= (and b!251289 res!123043) b!251287))

(assert (= (or b!251287 b!251286) bm!23619))

(assert (=> b!251288 m!267415))

(assert (=> b!251288 m!267415))

(assert (=> b!251288 m!267425))

(declare-fun m!267745 () Bool)

(assert (=> bm!23619 m!267745))

(assert (=> b!251289 m!267415))

(declare-fun m!267747 () Bool)

(assert (=> b!251289 m!267747))

(declare-fun m!267749 () Bool)

(assert (=> b!251289 m!267749))

(assert (=> b!251289 m!267415))

(declare-fun m!267751 () Bool)

(assert (=> b!251289 m!267751))

(assert (=> b!251099 d!61161))

(assert (=> d!61077 d!61081))

(assert (=> d!61077 d!61083))

(declare-fun d!61163 () Bool)

(assert (=> d!61163 (contains!1795 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932)))

(assert (=> d!61163 true))

(declare-fun _$17!77 () Unit!7734)

(assert (=> d!61163 (= (choose!1197 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) _$17!77)))

(declare-fun bs!9019 () Bool)

(assert (= bs!9019 d!61163))

(assert (=> bs!9019 m!267287))

(assert (=> bs!9019 m!267287))

(assert (=> bs!9019 m!267289))

(assert (=> d!61077 d!61163))

(assert (=> d!61077 d!61049))

(declare-fun d!61165 () Bool)

(declare-fun e!162955 () Bool)

(assert (=> d!61165 e!162955))

(declare-fun res!123045 () Bool)

(assert (=> d!61165 (=> res!123045 e!162955)))

(declare-fun lt!125973 () Bool)

(assert (=> d!61165 (= res!123045 (not lt!125973))))

(declare-fun lt!125972 () Bool)

(assert (=> d!61165 (= lt!125973 lt!125972)))

(declare-fun lt!125974 () Unit!7734)

(declare-fun e!162956 () Unit!7734)

(assert (=> d!61165 (= lt!125974 e!162956)))

(declare-fun c!42277 () Bool)

(assert (=> d!61165 (= c!42277 lt!125972)))

(assert (=> d!61165 (= lt!125972 (containsKey!291 (toList!1857 lt!125871) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61165 (= (contains!1795 lt!125871 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125973)))

(declare-fun b!251290 () Bool)

(declare-fun lt!125971 () Unit!7734)

(assert (=> b!251290 (= e!162956 lt!125971)))

(assert (=> b!251290 (= lt!125971 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1857 lt!125871) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251290 (isDefined!240 (getValueByKey!300 (toList!1857 lt!125871) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251291 () Bool)

(declare-fun Unit!7748 () Unit!7734)

(assert (=> b!251291 (= e!162956 Unit!7748)))

(declare-fun b!251292 () Bool)

(assert (=> b!251292 (= e!162955 (isDefined!240 (getValueByKey!300 (toList!1857 lt!125871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61165 c!42277) b!251290))

(assert (= (and d!61165 (not c!42277)) b!251291))

(assert (= (and d!61165 (not res!123045)) b!251292))

(declare-fun m!267753 () Bool)

(assert (=> d!61165 m!267753))

(declare-fun m!267755 () Bool)

(assert (=> b!251290 m!267755))

(assert (=> b!251290 m!267561))

(assert (=> b!251290 m!267561))

(declare-fun m!267757 () Bool)

(assert (=> b!251290 m!267757))

(assert (=> b!251292 m!267561))

(assert (=> b!251292 m!267561))

(assert (=> b!251292 m!267757))

(assert (=> bm!23604 d!61165))

(declare-fun d!61167 () Bool)

(assert (=> d!61167 (= (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250955 d!61167))

(declare-fun bm!23620 () Bool)

(declare-fun call!23623 () (_ BitVec 32))

(assert (=> bm!23620 (= call!23623 (arrayCountValidKeys!0 (_keys!6772 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!251293 () Bool)

(declare-fun e!162957 () (_ BitVec 32))

(assert (=> b!251293 (= e!162957 call!23623)))

(declare-fun b!251294 () Bool)

(declare-fun e!162958 () (_ BitVec 32))

(assert (=> b!251294 (= e!162958 e!162957)))

(declare-fun c!42278 () Bool)

(assert (=> b!251294 (= c!42278 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251295 () Bool)

(assert (=> b!251295 (= e!162958 #b00000000000000000000000000000000)))

(declare-fun b!251296 () Bool)

(assert (=> b!251296 (= e!162957 (bvadd #b00000000000000000000000000000001 call!23623))))

(declare-fun d!61169 () Bool)

(declare-fun lt!125975 () (_ BitVec 32))

(assert (=> d!61169 (and (bvsge lt!125975 #b00000000000000000000000000000000) (bvsle lt!125975 (bvsub (size!6179 (_keys!6772 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!61169 (= lt!125975 e!162958)))

(declare-fun c!42279 () Bool)

(assert (=> d!61169 (= c!42279 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61169 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6179 (_keys!6772 thiss!1504)) (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61169 (= (arrayCountValidKeys!0 (_keys!6772 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))) lt!125975)))

(assert (= (and d!61169 c!42279) b!251295))

(assert (= (and d!61169 (not c!42279)) b!251294))

(assert (= (and b!251294 c!42278) b!251296))

(assert (= (and b!251294 (not c!42278)) b!251293))

(assert (= (or b!251296 b!251293) bm!23620))

(declare-fun m!267759 () Bool)

(assert (=> bm!23620 m!267759))

(assert (=> b!251294 m!267729))

(assert (=> b!251294 m!267729))

(declare-fun m!267761 () Bool)

(assert (=> b!251294 m!267761))

(assert (=> bm!23578 d!61169))

(declare-fun d!61171 () Bool)

(assert (=> d!61171 (isDefined!240 (getValueByKey!300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-fun lt!125978 () Unit!7734)

(declare-fun choose!1200 (List!3644 (_ BitVec 64)) Unit!7734)

(assert (=> d!61171 (= lt!125978 (choose!1200 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(declare-fun e!162961 () Bool)

(assert (=> d!61171 e!162961))

(declare-fun res!123048 () Bool)

(assert (=> d!61171 (=> (not res!123048) (not e!162961))))

(declare-fun isStrictlySorted!358 (List!3644) Bool)

(assert (=> d!61171 (= res!123048 (isStrictlySorted!358 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))))

(assert (=> d!61171 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932) lt!125978)))

(declare-fun b!251299 () Bool)

(assert (=> b!251299 (= e!162961 (containsKey!291 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))

(assert (= (and d!61171 res!123048) b!251299))

(assert (=> d!61171 m!267469))

(assert (=> d!61171 m!267469))

(assert (=> d!61171 m!267471))

(declare-fun m!267763 () Bool)

(assert (=> d!61171 m!267763))

(declare-fun m!267765 () Bool)

(assert (=> d!61171 m!267765))

(assert (=> b!251299 m!267465))

(assert (=> b!251024 d!61171))

(declare-fun d!61173 () Bool)

(declare-fun isEmpty!535 (Option!306) Bool)

(assert (=> d!61173 (= (isDefined!240 (getValueByKey!300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932)) (not (isEmpty!535 (getValueByKey!300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932))))))

(declare-fun bs!9020 () Bool)

(assert (= bs!9020 d!61173))

(assert (=> bs!9020 m!267469))

(declare-fun m!267767 () Bool)

(assert (=> bs!9020 m!267767))

(assert (=> b!251024 d!61173))

(declare-fun d!61175 () Bool)

(declare-fun c!42284 () Bool)

(assert (=> d!61175 (= c!42284 (and ((_ is Cons!3640) (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (= (_1!2395 (h!4300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932)))))

(declare-fun e!162966 () Option!306)

(assert (=> d!61175 (= (getValueByKey!300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))) key!932) e!162966)))

(declare-fun b!251309 () Bool)

(declare-fun e!162967 () Option!306)

(assert (=> b!251309 (= e!162966 e!162967)))

(declare-fun c!42285 () Bool)

(assert (=> b!251309 (= c!42285 (and ((_ is Cons!3640) (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) (not (= (_1!2395 (h!4300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504))))) key!932))))))

(declare-fun b!251310 () Bool)

(assert (=> b!251310 (= e!162967 (getValueByKey!300 (t!8671 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))) key!932))))

(declare-fun b!251308 () Bool)

(assert (=> b!251308 (= e!162966 (Some!305 (_2!2395 (h!4300 (toList!1857 (getCurrentListMap!1389 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))))))

(declare-fun b!251311 () Bool)

(assert (=> b!251311 (= e!162967 None!304)))

(assert (= (and d!61175 c!42284) b!251308))

(assert (= (and d!61175 (not c!42284)) b!251309))

(assert (= (and b!251309 c!42285) b!251310))

(assert (= (and b!251309 (not c!42285)) b!251311))

(declare-fun m!267769 () Bool)

(assert (=> b!251310 m!267769))

(assert (=> b!251024 d!61175))

(assert (=> bm!23587 d!61057))

(declare-fun d!61177 () Bool)

(declare-fun e!162968 () Bool)

(assert (=> d!61177 e!162968))

(declare-fun res!123049 () Bool)

(assert (=> d!61177 (=> res!123049 e!162968)))

(declare-fun lt!125981 () Bool)

(assert (=> d!61177 (= res!123049 (not lt!125981))))

(declare-fun lt!125980 () Bool)

(assert (=> d!61177 (= lt!125981 lt!125980)))

(declare-fun lt!125982 () Unit!7734)

(declare-fun e!162969 () Unit!7734)

(assert (=> d!61177 (= lt!125982 e!162969)))

(declare-fun c!42286 () Bool)

(assert (=> d!61177 (= c!42286 lt!125980)))

(assert (=> d!61177 (= lt!125980 (containsKey!291 (toList!1857 lt!125871) (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61177 (= (contains!1795 lt!125871 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)) lt!125981)))

(declare-fun b!251312 () Bool)

(declare-fun lt!125979 () Unit!7734)

(assert (=> b!251312 (= e!162969 lt!125979)))

(assert (=> b!251312 (= lt!125979 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1857 lt!125871) (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251312 (isDefined!240 (getValueByKey!300 (toList!1857 lt!125871) (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251313 () Bool)

(declare-fun Unit!7749 () Unit!7734)

(assert (=> b!251313 (= e!162969 Unit!7749)))

(declare-fun b!251314 () Bool)

(assert (=> b!251314 (= e!162968 (isDefined!240 (getValueByKey!300 (toList!1857 lt!125871) (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!61177 c!42286) b!251312))

(assert (= (and d!61177 (not c!42286)) b!251313))

(assert (= (and d!61177 (not res!123049)) b!251314))

(assert (=> d!61177 m!267415))

(declare-fun m!267771 () Bool)

(assert (=> d!61177 m!267771))

(assert (=> b!251312 m!267415))

(declare-fun m!267773 () Bool)

(assert (=> b!251312 m!267773))

(assert (=> b!251312 m!267415))

(assert (=> b!251312 m!267565))

(assert (=> b!251312 m!267565))

(declare-fun m!267775 () Bool)

(assert (=> b!251312 m!267775))

(assert (=> b!251314 m!267415))

(assert (=> b!251314 m!267565))

(assert (=> b!251314 m!267565))

(assert (=> b!251314 m!267775))

(assert (=> b!251074 d!61177))

(assert (=> b!251026 d!61173))

(assert (=> b!251026 d!61175))

(declare-fun bm!23621 () Bool)

(declare-fun call!23624 () (_ BitVec 32))

(assert (=> bm!23621 (= call!23624 (arrayCountValidKeys!0 lt!125684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!251315 () Bool)

(declare-fun e!162970 () (_ BitVec 32))

(assert (=> b!251315 (= e!162970 call!23624)))

(declare-fun b!251316 () Bool)

(declare-fun e!162971 () (_ BitVec 32))

(assert (=> b!251316 (= e!162971 e!162970)))

(declare-fun c!42287 () Bool)

(assert (=> b!251316 (= c!42287 (validKeyInArray!0 (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251317 () Bool)

(assert (=> b!251317 (= e!162971 #b00000000000000000000000000000000)))

(declare-fun b!251318 () Bool)

(assert (=> b!251318 (= e!162970 (bvadd #b00000000000000000000000000000001 call!23624))))

(declare-fun d!61179 () Bool)

(declare-fun lt!125983 () (_ BitVec 32))

(assert (=> d!61179 (and (bvsge lt!125983 #b00000000000000000000000000000000) (bvsle lt!125983 (bvsub (size!6179 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!61179 (= lt!125983 e!162971)))

(declare-fun c!42288 () Bool)

(assert (=> d!61179 (= c!42288 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61179 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6179 (_keys!6772 thiss!1504)) (size!6179 lt!125684)))))

(assert (=> d!61179 (= (arrayCountValidKeys!0 lt!125684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))) lt!125983)))

(assert (= (and d!61179 c!42288) b!251317))

(assert (= (and d!61179 (not c!42288)) b!251316))

(assert (= (and b!251316 c!42287) b!251318))

(assert (= (and b!251316 (not c!42287)) b!251315))

(assert (= (or b!251318 b!251315) bm!23621))

(declare-fun m!267777 () Bool)

(assert (=> bm!23621 m!267777))

(declare-fun m!267779 () Bool)

(assert (=> b!251316 m!267779))

(assert (=> b!251316 m!267779))

(declare-fun m!267781 () Bool)

(assert (=> b!251316 m!267781))

(assert (=> bm!23574 d!61179))

(assert (=> b!251069 d!61167))

(declare-fun b!251319 () Bool)

(declare-fun e!162974 () Bool)

(declare-fun call!23625 () Bool)

(assert (=> b!251319 (= e!162974 call!23625)))

(declare-fun b!251320 () Bool)

(declare-fun e!162972 () Bool)

(assert (=> b!251320 (= e!162972 call!23625)))

(declare-fun d!61181 () Bool)

(declare-fun res!123051 () Bool)

(declare-fun e!162973 () Bool)

(assert (=> d!61181 (=> res!123051 e!162973)))

(assert (=> d!61181 (= res!123051 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 lt!125684)))))

(assert (=> d!61181 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125684 (mask!10824 thiss!1504)) e!162973)))

(declare-fun b!251321 () Bool)

(assert (=> b!251321 (= e!162973 e!162974)))

(declare-fun c!42289 () Bool)

(assert (=> b!251321 (= c!42289 (validKeyInArray!0 (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!23622 () Bool)

(assert (=> bm!23622 (= call!23625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!125684 (mask!10824 thiss!1504)))))

(declare-fun b!251322 () Bool)

(assert (=> b!251322 (= e!162974 e!162972)))

(declare-fun lt!125984 () (_ BitVec 64))

(assert (=> b!251322 (= lt!125984 (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125985 () Unit!7734)

(assert (=> b!251322 (= lt!125985 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125684 lt!125984 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!251322 (arrayContainsKey!0 lt!125684 lt!125984 #b00000000000000000000000000000000)))

(declare-fun lt!125986 () Unit!7734)

(assert (=> b!251322 (= lt!125986 lt!125985)))

(declare-fun res!123050 () Bool)

(assert (=> b!251322 (= res!123050 (= (seekEntryOrOpen!0 (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!125684 (mask!10824 thiss!1504)) (Found!1088 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!251322 (=> (not res!123050) (not e!162972))))

(assert (= (and d!61181 (not res!123051)) b!251321))

(assert (= (and b!251321 c!42289) b!251322))

(assert (= (and b!251321 (not c!42289)) b!251319))

(assert (= (and b!251322 res!123050) b!251320))

(assert (= (or b!251320 b!251319) bm!23622))

(assert (=> b!251321 m!267779))

(assert (=> b!251321 m!267779))

(assert (=> b!251321 m!267781))

(declare-fun m!267783 () Bool)

(assert (=> bm!23622 m!267783))

(assert (=> b!251322 m!267779))

(declare-fun m!267785 () Bool)

(assert (=> b!251322 m!267785))

(declare-fun m!267787 () Bool)

(assert (=> b!251322 m!267787))

(assert (=> b!251322 m!267779))

(declare-fun m!267789 () Bool)

(assert (=> b!251322 m!267789))

(assert (=> bm!23581 d!61181))

(assert (=> bm!23602 d!61129))

(declare-fun d!61183 () Bool)

(assert (=> d!61183 (= (inRange!0 (ite c!42208 (index!6522 lt!125784) (index!6525 lt!125784)) (mask!10824 thiss!1504)) (and (bvsge (ite c!42208 (index!6522 lt!125784) (index!6525 lt!125784)) #b00000000000000000000000000000000) (bvslt (ite c!42208 (index!6522 lt!125784) (index!6525 lt!125784)) (bvadd (mask!10824 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23586 d!61183))

(assert (=> b!251088 d!61167))

(declare-fun d!61185 () Bool)

(assert (=> d!61185 (= (inRange!0 (index!6523 lt!125790) (mask!10824 thiss!1504)) (and (bvsge (index!6523 lt!125790) #b00000000000000000000000000000000) (bvslt (index!6523 lt!125790) (bvadd (mask!10824 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251016 d!61185))

(assert (=> b!250924 d!61105))

(assert (=> d!61075 d!61065))

(declare-fun d!61187 () Bool)

(declare-fun e!162977 () Bool)

(assert (=> d!61187 e!162977))

(declare-fun res!123056 () Bool)

(assert (=> d!61187 (=> (not res!123056) (not e!162977))))

(declare-fun lt!125989 () SeekEntryResult!1088)

(assert (=> d!61187 (= res!123056 ((_ is Found!1088) lt!125989))))

(assert (=> d!61187 (= lt!125989 (seekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(assert (=> d!61187 true))

(declare-fun _$33!168 () Unit!7734)

(assert (=> d!61187 (= (choose!1196 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)) _$33!168)))

(declare-fun b!251327 () Bool)

(declare-fun res!123057 () Bool)

(assert (=> b!251327 (=> (not res!123057) (not e!162977))))

(assert (=> b!251327 (= res!123057 (inRange!0 (index!6523 lt!125989) (mask!10824 thiss!1504)))))

(declare-fun b!251328 () Bool)

(assert (=> b!251328 (= e!162977 (= (select (arr!5834 (_keys!6772 thiss!1504)) (index!6523 lt!125989)) key!932))))

(assert (= (and d!61187 res!123056) b!251327))

(assert (= (and b!251327 res!123057) b!251328))

(assert (=> d!61187 m!267291))

(declare-fun m!267791 () Bool)

(assert (=> b!251327 m!267791))

(declare-fun m!267793 () Bool)

(assert (=> b!251328 m!267793))

(assert (=> d!61075 d!61187))

(assert (=> d!61075 d!61049))

(assert (=> d!61083 d!61049))

(declare-fun b!251329 () Bool)

(declare-fun e!162981 () Bool)

(declare-fun e!162979 () Bool)

(assert (=> b!251329 (= e!162981 e!162979)))

(declare-fun res!123059 () Bool)

(assert (=> b!251329 (=> (not res!123059) (not e!162979))))

(declare-fun e!162980 () Bool)

(assert (=> b!251329 (= res!123059 (not e!162980))))

(declare-fun res!123060 () Bool)

(assert (=> b!251329 (=> (not res!123060) (not e!162980))))

(assert (=> b!251329 (= res!123060 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23623 () Bool)

(declare-fun call!23626 () Bool)

(declare-fun c!42290 () Bool)

(assert (=> bm!23623 (= call!23626 (arrayNoDuplicates!0 (_keys!6772 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42290 (Cons!3641 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000) Nil!3642) Nil!3642)))))

(declare-fun b!251330 () Bool)

(declare-fun e!162978 () Bool)

(assert (=> b!251330 (= e!162979 e!162978)))

(assert (=> b!251330 (= c!42290 (validKeyInArray!0 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251331 () Bool)

(assert (=> b!251331 (= e!162978 call!23626)))

(declare-fun b!251332 () Bool)

(assert (=> b!251332 (= e!162980 (contains!1796 Nil!3642 (select (arr!5834 (_keys!6772 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61189 () Bool)

(declare-fun res!123058 () Bool)

(assert (=> d!61189 (=> res!123058 e!162981)))

(assert (=> d!61189 (= res!123058 (bvsge #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61189 (= (arrayNoDuplicates!0 (_keys!6772 thiss!1504) #b00000000000000000000000000000000 Nil!3642) e!162981)))

(declare-fun b!251333 () Bool)

(assert (=> b!251333 (= e!162978 call!23626)))

(assert (= (and d!61189 (not res!123058)) b!251329))

(assert (= (and b!251329 res!123060) b!251332))

(assert (= (and b!251329 res!123059) b!251330))

(assert (= (and b!251330 c!42290) b!251333))

(assert (= (and b!251330 (not c!42290)) b!251331))

(assert (= (or b!251333 b!251331) bm!23623))

(assert (=> b!251329 m!267415))

(assert (=> b!251329 m!267415))

(assert (=> b!251329 m!267425))

(assert (=> bm!23623 m!267415))

(declare-fun m!267795 () Bool)

(assert (=> bm!23623 m!267795))

(assert (=> b!251330 m!267415))

(assert (=> b!251330 m!267415))

(assert (=> b!251330 m!267425))

(assert (=> b!251332 m!267415))

(assert (=> b!251332 m!267415))

(declare-fun m!267797 () Bool)

(assert (=> b!251332 m!267797))

(assert (=> b!251100 d!61189))

(declare-fun d!61191 () Bool)

(declare-fun e!162982 () Bool)

(assert (=> d!61191 e!162982))

(declare-fun res!123062 () Bool)

(assert (=> d!61191 (=> (not res!123062) (not e!162982))))

(declare-fun lt!125990 () ListLongMap!3683)

(assert (=> d!61191 (= res!123062 (contains!1795 lt!125990 (_1!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(declare-fun lt!125991 () List!3644)

(assert (=> d!61191 (= lt!125990 (ListLongMap!3684 lt!125991))))

(declare-fun lt!125992 () Unit!7734)

(declare-fun lt!125993 () Unit!7734)

(assert (=> d!61191 (= lt!125992 lt!125993)))

(assert (=> d!61191 (= (getValueByKey!300 lt!125991 (_1!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (=> d!61191 (= lt!125993 (lemmaContainsTupThenGetReturnValue!160 lt!125991 (_1!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (=> d!61191 (= lt!125991 (insertStrictlySorted!163 (toList!1857 call!23607) (_1!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))) (_2!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))))))

(assert (=> d!61191 (= (+!668 call!23607 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))) lt!125990)))

(declare-fun b!251334 () Bool)

(declare-fun res!123061 () Bool)

(assert (=> b!251334 (=> (not res!123061) (not e!162982))))

(assert (=> b!251334 (= res!123061 (= (getValueByKey!300 (toList!1857 lt!125990) (_1!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504)))) (Some!305 (_2!2395 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))))

(declare-fun b!251335 () Bool)

(assert (=> b!251335 (= e!162982 (contains!1797 (toList!1857 lt!125990) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4475 thiss!1504))))))

(assert (= (and d!61191 res!123062) b!251334))

(assert (= (and b!251334 res!123061) b!251335))

(declare-fun m!267799 () Bool)

(assert (=> d!61191 m!267799))

(declare-fun m!267801 () Bool)

(assert (=> d!61191 m!267801))

(declare-fun m!267803 () Bool)

(assert (=> d!61191 m!267803))

(declare-fun m!267805 () Bool)

(assert (=> d!61191 m!267805))

(declare-fun m!267807 () Bool)

(assert (=> b!251334 m!267807))

(declare-fun m!267809 () Bool)

(assert (=> b!251335 m!267809))

(assert (=> b!251081 d!61191))

(declare-fun b!251336 () Bool)

(declare-fun e!162986 () Bool)

(declare-fun e!162984 () Bool)

(assert (=> b!251336 (= e!162986 e!162984)))

(declare-fun res!123064 () Bool)

(assert (=> b!251336 (=> (not res!123064) (not e!162984))))

(declare-fun e!162985 () Bool)

(assert (=> b!251336 (= res!123064 (not e!162985))))

(declare-fun res!123065 () Bool)

(assert (=> b!251336 (=> (not res!123065) (not e!162985))))

(assert (=> b!251336 (= res!123065 (validKeyInArray!0 (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!42291 () Bool)

(declare-fun call!23627 () Bool)

(declare-fun bm!23624 () Bool)

(assert (=> bm!23624 (= call!23627 (arrayNoDuplicates!0 lt!125684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42291 (Cons!3641 (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!42189 (Cons!3641 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) Nil!3642) Nil!3642)) (ite c!42189 (Cons!3641 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) Nil!3642) Nil!3642))))))

(declare-fun b!251337 () Bool)

(declare-fun e!162983 () Bool)

(assert (=> b!251337 (= e!162984 e!162983)))

(assert (=> b!251337 (= c!42291 (validKeyInArray!0 (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251338 () Bool)

(assert (=> b!251338 (= e!162983 call!23627)))

(declare-fun b!251339 () Bool)

(assert (=> b!251339 (= e!162985 (contains!1796 (ite c!42189 (Cons!3641 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) Nil!3642) Nil!3642) (select (arr!5834 lt!125684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!61193 () Bool)

(declare-fun res!123063 () Bool)

(assert (=> d!61193 (=> res!123063 e!162986)))

(assert (=> d!61193 (= res!123063 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 lt!125684)))))

(assert (=> d!61193 (= (arrayNoDuplicates!0 lt!125684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42189 (Cons!3641 (select (arr!5834 lt!125684) #b00000000000000000000000000000000) Nil!3642) Nil!3642)) e!162986)))

(declare-fun b!251340 () Bool)

(assert (=> b!251340 (= e!162983 call!23627)))

(assert (= (and d!61193 (not res!123063)) b!251336))

(assert (= (and b!251336 res!123065) b!251339))

(assert (= (and b!251336 res!123064) b!251337))

(assert (= (and b!251337 c!42291) b!251340))

(assert (= (and b!251337 (not c!42291)) b!251338))

(assert (= (or b!251340 b!251338) bm!23624))

(assert (=> b!251336 m!267779))

(assert (=> b!251336 m!267779))

(assert (=> b!251336 m!267781))

(assert (=> bm!23624 m!267779))

(declare-fun m!267811 () Bool)

(assert (=> bm!23624 m!267811))

(assert (=> b!251337 m!267779))

(assert (=> b!251337 m!267779))

(assert (=> b!251337 m!267781))

(assert (=> b!251339 m!267779))

(assert (=> b!251339 m!267779))

(declare-fun m!267813 () Bool)

(assert (=> b!251339 m!267813))

(assert (=> bm!23577 d!61193))

(assert (=> b!250968 d!61105))

(declare-fun d!61195 () Bool)

(assert (=> d!61195 (= (arrayCountValidKeys!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6772 thiss!1504) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!61195 true))

(declare-fun _$84!30 () Unit!7734)

(assert (=> d!61195 (= (choose!1 (_keys!6772 thiss!1504) index!297 key!932) _$84!30)))

(declare-fun bs!9021 () Bool)

(assert (= bs!9021 d!61195))

(assert (=> bs!9021 m!267271))

(assert (=> bs!9021 m!267393))

(assert (=> bs!9021 m!267265))

(assert (=> d!61047 d!61195))

(declare-fun d!61197 () Bool)

(assert (=> d!61197 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250912 d!61197))

(declare-fun d!61199 () Bool)

(assert (=> d!61199 (= (apply!241 lt!125871 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3007 (getValueByKey!300 (toList!1857 lt!125871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9022 () Bool)

(assert (= bs!9022 d!61199))

(assert (=> bs!9022 m!267557))

(assert (=> bs!9022 m!267557))

(declare-fun m!267815 () Bool)

(assert (=> bs!9022 m!267815))

(assert (=> b!251077 d!61199))

(declare-fun bm!23625 () Bool)

(declare-fun call!23628 () (_ BitVec 32))

(assert (=> bm!23625 (= call!23628 (arrayCountValidKeys!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6179 (_keys!6772 thiss!1504))))))

(declare-fun b!251341 () Bool)

(declare-fun e!162987 () (_ BitVec 32))

(assert (=> b!251341 (= e!162987 call!23628)))

(declare-fun b!251342 () Bool)

(declare-fun e!162988 () (_ BitVec 32))

(assert (=> b!251342 (= e!162988 e!162987)))

(declare-fun c!42292 () Bool)

(assert (=> b!251342 (= c!42292 (validKeyInArray!0 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251343 () Bool)

(assert (=> b!251343 (= e!162988 #b00000000000000000000000000000000)))

(declare-fun b!251344 () Bool)

(assert (=> b!251344 (= e!162987 (bvadd #b00000000000000000000000000000001 call!23628))))

(declare-fun d!61201 () Bool)

(declare-fun lt!125994 () (_ BitVec 32))

(assert (=> d!61201 (and (bvsge lt!125994 #b00000000000000000000000000000000) (bvsle lt!125994 (bvsub (size!6179 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!61201 (= lt!125994 e!162988)))

(declare-fun c!42293 () Bool)

(assert (=> d!61201 (= c!42293 (bvsge #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))))))

(assert (=> d!61201 (and (bvsle #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6179 (_keys!6772 thiss!1504)) (size!6179 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))))))))

(assert (=> d!61201 (= (arrayCountValidKeys!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) #b00000000000000000000000000000000 (size!6179 (_keys!6772 thiss!1504))) lt!125994)))

(assert (= (and d!61201 c!42293) b!251343))

(assert (= (and d!61201 (not c!42293)) b!251342))

(assert (= (and b!251342 c!42292) b!251344))

(assert (= (and b!251342 (not c!42292)) b!251341))

(assert (= (or b!251344 b!251341) bm!23625))

(declare-fun m!267817 () Bool)

(assert (=> bm!23625 m!267817))

(assert (=> b!251342 m!267573))

(assert (=> b!251342 m!267573))

(assert (=> b!251342 m!267575))

(assert (=> b!250914 d!61201))

(assert (=> b!250914 d!61061))

(assert (=> b!251098 d!61061))

(declare-fun b!251345 () Bool)

(declare-fun e!162991 () Bool)

(declare-fun call!23629 () Bool)

(assert (=> b!251345 (= e!162991 call!23629)))

(declare-fun b!251346 () Bool)

(declare-fun e!162989 () Bool)

(assert (=> b!251346 (= e!162989 call!23629)))

(declare-fun d!61203 () Bool)

(declare-fun res!123067 () Bool)

(declare-fun e!162990 () Bool)

(assert (=> d!61203 (=> res!123067 e!162990)))

(assert (=> d!61203 (= res!123067 (bvsge #b00000000000000000000000000000000 (size!6179 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))))))))

(assert (=> d!61203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) (mask!10824 thiss!1504)) e!162990)))

(declare-fun b!251347 () Bool)

(assert (=> b!251347 (= e!162990 e!162991)))

(declare-fun c!42294 () Bool)

(assert (=> b!251347 (= c!42294 (validKeyInArray!0 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!23626 () Bool)

(assert (=> bm!23626 (= call!23629 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) (mask!10824 thiss!1504)))))

(declare-fun b!251348 () Bool)

(assert (=> b!251348 (= e!162991 e!162989)))

(declare-fun lt!125995 () (_ BitVec 64))

(assert (=> b!251348 (= lt!125995 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125996 () Unit!7734)

(assert (=> b!251348 (= lt!125996 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) lt!125995 #b00000000000000000000000000000000))))

(assert (=> b!251348 (arrayContainsKey!0 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) lt!125995 #b00000000000000000000000000000000)))

(declare-fun lt!125997 () Unit!7734)

(assert (=> b!251348 (= lt!125997 lt!125996)))

(declare-fun res!123066 () Bool)

(assert (=> b!251348 (= res!123066 (= (seekEntryOrOpen!0 (select (arr!5834 (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504)))) #b00000000000000000000000000000000) (array!12306 (store (arr!5834 (_keys!6772 thiss!1504)) index!297 key!932) (size!6179 (_keys!6772 thiss!1504))) (mask!10824 thiss!1504)) (Found!1088 #b00000000000000000000000000000000)))))

(assert (=> b!251348 (=> (not res!123066) (not e!162989))))

(assert (= (and d!61203 (not res!123067)) b!251347))

(assert (= (and b!251347 c!42294) b!251348))

(assert (= (and b!251347 (not c!42294)) b!251345))

(assert (= (and b!251348 res!123066) b!251346))

(assert (= (or b!251346 b!251345) bm!23626))

(assert (=> b!251347 m!267573))

(assert (=> b!251347 m!267573))

(assert (=> b!251347 m!267575))

(declare-fun m!267819 () Bool)

(assert (=> bm!23626 m!267819))

(assert (=> b!251348 m!267573))

(declare-fun m!267821 () Bool)

(assert (=> b!251348 m!267821))

(declare-fun m!267823 () Bool)

(assert (=> b!251348 m!267823))

(assert (=> b!251348 m!267573))

(declare-fun m!267825 () Bool)

(assert (=> b!251348 m!267825))

(assert (=> b!250953 d!61203))

(declare-fun condMapEmpty!11045 () Bool)

(declare-fun mapDefault!11045 () ValueCell!2903)

(assert (=> mapNonEmpty!11044 (= condMapEmpty!11045 (= mapRest!11044 ((as const (Array (_ BitVec 32) ValueCell!2903)) mapDefault!11045)))))

(declare-fun e!162993 () Bool)

(declare-fun mapRes!11045 () Bool)

(assert (=> mapNonEmpty!11044 (= tp!23176 (and e!162993 mapRes!11045))))

(declare-fun b!251349 () Bool)

(declare-fun e!162992 () Bool)

(assert (=> b!251349 (= e!162992 tp_is_empty!6493)))

(declare-fun mapNonEmpty!11045 () Bool)

(declare-fun tp!23177 () Bool)

(assert (=> mapNonEmpty!11045 (= mapRes!11045 (and tp!23177 e!162992))))

(declare-fun mapValue!11045 () ValueCell!2903)

(declare-fun mapKey!11045 () (_ BitVec 32))

(declare-fun mapRest!11045 () (Array (_ BitVec 32) ValueCell!2903))

(assert (=> mapNonEmpty!11045 (= mapRest!11044 (store mapRest!11045 mapKey!11045 mapValue!11045))))

(declare-fun mapIsEmpty!11045 () Bool)

(assert (=> mapIsEmpty!11045 mapRes!11045))

(declare-fun b!251350 () Bool)

(assert (=> b!251350 (= e!162993 tp_is_empty!6493)))

(assert (= (and mapNonEmpty!11044 condMapEmpty!11045) mapIsEmpty!11045))

(assert (= (and mapNonEmpty!11044 (not condMapEmpty!11045)) mapNonEmpty!11045))

(assert (= (and mapNonEmpty!11045 ((_ is ValueCellFull!2903) mapValue!11045)) b!251349))

(assert (= (and mapNonEmpty!11044 ((_ is ValueCellFull!2903) mapDefault!11045)) b!251350))

(declare-fun m!267827 () Bool)

(assert (=> mapNonEmpty!11045 m!267827))

(declare-fun b_lambda!8121 () Bool)

(assert (= b_lambda!8119 (or (and b!250757 b_free!6631) b_lambda!8121)))

(declare-fun b_lambda!8123 () Bool)

(assert (= b_lambda!8117 (or (and b!250757 b_free!6631) b_lambda!8123)))

(check-sat (not b!251124) (not b!251288) (not b!251222) (not d!61173) (not d!61123) (not b!251327) (not b!251336) (not b!251235) (not b_lambda!8115) (not b!251321) (not bm!23621) (not d!61089) (not d!61099) (not d!61129) (not b!251299) (not d!61121) (not b!251191) (not b!251330) (not d!61191) (not b!251185) (not b!251221) (not b!251314) (not bm!23623) (not bm!23624) (not b!251119) (not b!251278) (not d!61135) (not d!61109) (not d!61117) (not d!61139) (not b!251329) (not b!251129) (not b!251238) (not b!251117) (not bm!23626) (not b!251227) (not d!61157) (not b!251160) (not b!251342) (not d!61199) (not b!251334) (not b!251240) (not b!251292) (not bm!23614) (not b_lambda!8123) (not bm!23625) (not d!61151) (not mapNonEmpty!11045) (not b!251186) (not b!251233) (not b!251193) (not d!61145) (not d!61131) (not b!251232) (not d!61137) (not b!251220) (not b!251348) (not d!61125) (not d!61107) (not b!251335) (not bm!23620) (not d!61111) (not bm!23622) (not b!251236) (not b!251290) (not d!61115) (not d!61187) (not b!251294) (not d!61113) (not b!251127) (not b!251115) (not b!251223) (not b!251219) (not b!251332) (not bm!23609) (not d!61195) (not b!251322) (not d!61171) (not d!61177) (not d!61143) (not b!251289) (not bm!23619) (not b!251177) (not b!251337) (not b!251126) (not b!251310) (not d!61095) (not bm!23615) (not b!251183) (not b!251125) (not d!61119) (not b!251184) (not b!251237) (not d!61133) (not b_lambda!8121) (not b!251224) b_and!13677 (not b!251265) (not d!61163) (not b!251110) (not b_next!6631) (not d!61087) (not b!251339) (not b!251347) (not d!61093) (not d!61127) (not bm!23618) (not d!61165) (not b!251316) tp_is_empty!6493 (not d!61097) (not d!61147) (not b!251285) (not b!251277) (not b!251312) (not b!251226) (not d!61141))
(check-sat b_and!13677 (not b_next!6631))

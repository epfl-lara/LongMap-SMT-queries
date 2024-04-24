; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22046 () Bool)

(assert start!22046)

(declare-fun b!227744 () Bool)

(declare-fun b_free!6109 () Bool)

(declare-fun b_next!6109 () Bool)

(assert (=> b!227744 (= b_free!6109 (not b_next!6109))))

(declare-fun tp!21469 () Bool)

(declare-fun b_and!13021 () Bool)

(assert (=> b!227744 (= tp!21469 b_and!13021)))

(declare-fun b!227723 () Bool)

(declare-fun e!147732 () Bool)

(declare-fun e!147740 () Bool)

(assert (=> b!227723 (= e!147732 e!147740)))

(declare-fun res!112103 () Bool)

(assert (=> b!227723 (=> (not res!112103) (not e!147740))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7609 0))(
  ( (V!7610 (val!3030 Int)) )
))
(declare-datatypes ((ValueCell!2642 0))(
  ( (ValueCellFull!2642 (v!5051 V!7609)) (EmptyCell!2642) )
))
(declare-datatypes ((array!11183 0))(
  ( (array!11184 (arr!5311 (Array (_ BitVec 32) ValueCell!2642)) (size!5644 (_ BitVec 32))) )
))
(declare-datatypes ((array!11185 0))(
  ( (array!11186 (arr!5312 (Array (_ BitVec 32) (_ BitVec 64))) (size!5645 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3184 0))(
  ( (LongMapFixedSize!3185 (defaultEntry!4251 Int) (mask!10115 (_ BitVec 32)) (extraKeys!3988 (_ BitVec 32)) (zeroValue!4092 V!7609) (minValue!4092 V!7609) (_size!1641 (_ BitVec 32)) (_keys!6305 array!11185) (_values!4234 array!11183) (_vacant!1641 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3184)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227723 (= res!112103 (inRange!0 index!297 (mask!10115 thiss!1504)))))

(declare-datatypes ((Unit!6887 0))(
  ( (Unit!6888) )
))
(declare-fun lt!114629 () Unit!6887)

(declare-fun e!147735 () Unit!6887)

(assert (=> b!227723 (= lt!114629 e!147735)))

(declare-fun c!37763 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4400 0))(
  ( (tuple2!4401 (_1!2211 (_ BitVec 64)) (_2!2211 V!7609)) )
))
(declare-datatypes ((List!3312 0))(
  ( (Nil!3309) (Cons!3308 (h!3956 tuple2!4400) (t!8263 List!3312)) )
))
(declare-datatypes ((ListLongMap!3315 0))(
  ( (ListLongMap!3316 (toList!1673 List!3312)) )
))
(declare-fun contains!1562 (ListLongMap!3315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1205 (array!11185 array!11183 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 32) Int) ListLongMap!3315)

(assert (=> b!227723 (= c!37763 (contains!1562 (getCurrentListMap!1205 (_keys!6305 thiss!1504) (_values!4234 thiss!1504) (mask!10115 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4251 thiss!1504)) key!932))))

(declare-fun b!227724 () Bool)

(declare-fun res!112099 () Bool)

(declare-fun e!147742 () Bool)

(assert (=> b!227724 (=> (not res!112099) (not e!147742))))

(declare-fun call!21150 () Bool)

(assert (=> b!227724 (= res!112099 call!21150)))

(declare-fun e!147733 () Bool)

(assert (=> b!227724 (= e!147733 e!147742)))

(declare-fun b!227725 () Bool)

(declare-fun e!147738 () Bool)

(assert (=> b!227725 (= e!147740 (not e!147738))))

(declare-fun res!112104 () Bool)

(assert (=> b!227725 (=> res!112104 e!147738)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227725 (= res!112104 (not (validMask!0 (mask!10115 thiss!1504))))))

(declare-fun lt!114628 () array!11185)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11185 (_ BitVec 32)) Bool)

(assert (=> b!227725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114628 (mask!10115 thiss!1504))))

(declare-fun lt!114631 () Unit!6887)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11185 (_ BitVec 32) (_ BitVec 32)) Unit!6887)

(assert (=> b!227725 (= lt!114631 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6305 thiss!1504) index!297 (mask!10115 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11185 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227725 (= (arrayCountValidKeys!0 lt!114628 #b00000000000000000000000000000000 (size!5645 (_keys!6305 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6305 thiss!1504) #b00000000000000000000000000000000 (size!5645 (_keys!6305 thiss!1504)))))))

(declare-fun lt!114626 () Unit!6887)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11185 (_ BitVec 32) (_ BitVec 64)) Unit!6887)

(assert (=> b!227725 (= lt!114626 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6305 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3313 0))(
  ( (Nil!3310) (Cons!3309 (h!3957 (_ BitVec 64)) (t!8264 List!3313)) )
))
(declare-fun arrayNoDuplicates!0 (array!11185 (_ BitVec 32) List!3313) Bool)

(assert (=> b!227725 (arrayNoDuplicates!0 lt!114628 #b00000000000000000000000000000000 Nil!3310)))

(assert (=> b!227725 (= lt!114628 (array!11186 (store (arr!5312 (_keys!6305 thiss!1504)) index!297 key!932) (size!5645 (_keys!6305 thiss!1504))))))

(declare-fun lt!114624 () Unit!6887)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3313) Unit!6887)

(assert (=> b!227725 (= lt!114624 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6305 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3310))))

(declare-fun lt!114630 () Unit!6887)

(declare-fun e!147739 () Unit!6887)

(assert (=> b!227725 (= lt!114630 e!147739)))

(declare-fun c!37764 () Bool)

(declare-fun arrayContainsKey!0 (array!11185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227725 (= c!37764 (arrayContainsKey!0 (_keys!6305 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227726 () Bool)

(declare-fun lt!114623 () Unit!6887)

(assert (=> b!227726 (= e!147735 lt!114623)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!259 (array!11185 array!11183 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 64) Int) Unit!6887)

(assert (=> b!227726 (= lt!114623 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!259 (_keys!6305 thiss!1504) (_values!4234 thiss!1504) (mask!10115 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) key!932 (defaultEntry!4251 thiss!1504)))))

(declare-fun c!37765 () Bool)

(declare-datatypes ((SeekEntryResult!868 0))(
  ( (MissingZero!868 (index!5642 (_ BitVec 32))) (Found!868 (index!5643 (_ BitVec 32))) (Intermediate!868 (undefined!1680 Bool) (index!5644 (_ BitVec 32)) (x!23264 (_ BitVec 32))) (Undefined!868) (MissingVacant!868 (index!5645 (_ BitVec 32))) )
))
(declare-fun lt!114627 () SeekEntryResult!868)

(get-info :version)

(assert (=> b!227726 (= c!37765 ((_ is MissingZero!868) lt!114627))))

(assert (=> b!227726 e!147733))

(declare-fun bm!21146 () Bool)

(assert (=> bm!21146 (= call!21150 (inRange!0 (ite c!37765 (index!5642 lt!114627) (index!5645 lt!114627)) (mask!10115 thiss!1504)))))

(declare-fun mapIsEmpty!10126 () Bool)

(declare-fun mapRes!10126 () Bool)

(assert (=> mapIsEmpty!10126 mapRes!10126))

(declare-fun b!227727 () Bool)

(declare-fun Unit!6889 () Unit!6887)

(assert (=> b!227727 (= e!147739 Unit!6889)))

(declare-fun lt!114621 () Unit!6887)

(declare-fun lemmaArrayContainsKeyThenInListMap!107 (array!11185 array!11183 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 64) (_ BitVec 32) Int) Unit!6887)

(assert (=> b!227727 (= lt!114621 (lemmaArrayContainsKeyThenInListMap!107 (_keys!6305 thiss!1504) (_values!4234 thiss!1504) (mask!10115 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4251 thiss!1504)))))

(assert (=> b!227727 false))

(declare-fun b!227728 () Bool)

(declare-fun e!147734 () Bool)

(declare-fun tp_is_empty!5971 () Bool)

(assert (=> b!227728 (= e!147734 tp_is_empty!5971)))

(declare-fun b!227729 () Bool)

(declare-fun Unit!6890 () Unit!6887)

(assert (=> b!227729 (= e!147735 Unit!6890)))

(declare-fun lt!114625 () Unit!6887)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!267 (array!11185 array!11183 (_ BitVec 32) (_ BitVec 32) V!7609 V!7609 (_ BitVec 64) Int) Unit!6887)

(assert (=> b!227729 (= lt!114625 (lemmaInListMapThenSeekEntryOrOpenFindsIt!267 (_keys!6305 thiss!1504) (_values!4234 thiss!1504) (mask!10115 thiss!1504) (extraKeys!3988 thiss!1504) (zeroValue!4092 thiss!1504) (minValue!4092 thiss!1504) key!932 (defaultEntry!4251 thiss!1504)))))

(assert (=> b!227729 false))

(declare-fun b!227730 () Bool)

(assert (=> b!227730 (= e!147738 true)))

(declare-fun lt!114622 () Bool)

(assert (=> b!227730 (= lt!114622 (arrayNoDuplicates!0 (_keys!6305 thiss!1504) #b00000000000000000000000000000000 Nil!3310))))

(declare-fun b!227731 () Bool)

(declare-fun res!112105 () Bool)

(assert (=> b!227731 (=> res!112105 e!147738)))

(assert (=> b!227731 (= res!112105 (or (not (= (size!5644 (_values!4234 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10115 thiss!1504)))) (not (= (size!5645 (_keys!6305 thiss!1504)) (size!5644 (_values!4234 thiss!1504)))) (bvslt (mask!10115 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3988 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3988 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227732 () Bool)

(declare-fun res!112102 () Bool)

(assert (=> b!227732 (= res!112102 (= (select (arr!5312 (_keys!6305 thiss!1504)) (index!5645 lt!114627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147736 () Bool)

(assert (=> b!227732 (=> (not res!112102) (not e!147736))))

(declare-fun b!227733 () Bool)

(declare-fun c!37762 () Bool)

(assert (=> b!227733 (= c!37762 ((_ is MissingVacant!868) lt!114627))))

(declare-fun e!147741 () Bool)

(assert (=> b!227733 (= e!147733 e!147741)))

(declare-fun b!227734 () Bool)

(declare-fun res!112098 () Bool)

(assert (=> b!227734 (=> (not res!112098) (not e!147742))))

(assert (=> b!227734 (= res!112098 (= (select (arr!5312 (_keys!6305 thiss!1504)) (index!5642 lt!114627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227735 () Bool)

(declare-fun res!112096 () Bool)

(declare-fun e!147743 () Bool)

(assert (=> b!227735 (=> (not res!112096) (not e!147743))))

(assert (=> b!227735 (= res!112096 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21147 () Bool)

(declare-fun call!21149 () Bool)

(assert (=> bm!21147 (= call!21149 (arrayContainsKey!0 (_keys!6305 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227736 () Bool)

(assert (=> b!227736 (= e!147741 e!147736)))

(declare-fun res!112100 () Bool)

(assert (=> b!227736 (= res!112100 call!21150)))

(assert (=> b!227736 (=> (not res!112100) (not e!147736))))

(declare-fun b!227737 () Bool)

(assert (=> b!227737 (= e!147742 (not call!21149))))

(declare-fun b!227738 () Bool)

(declare-fun e!147730 () Bool)

(declare-fun e!147729 () Bool)

(assert (=> b!227738 (= e!147730 (and e!147729 mapRes!10126))))

(declare-fun condMapEmpty!10126 () Bool)

(declare-fun mapDefault!10126 () ValueCell!2642)

(assert (=> b!227738 (= condMapEmpty!10126 (= (arr!5311 (_values!4234 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2642)) mapDefault!10126)))))

(declare-fun b!227739 () Bool)

(assert (=> b!227739 (= e!147741 ((_ is Undefined!868) lt!114627))))

(declare-fun res!112095 () Bool)

(assert (=> start!22046 (=> (not res!112095) (not e!147743))))

(declare-fun valid!1283 (LongMapFixedSize!3184) Bool)

(assert (=> start!22046 (= res!112095 (valid!1283 thiss!1504))))

(assert (=> start!22046 e!147743))

(declare-fun e!147731 () Bool)

(assert (=> start!22046 e!147731))

(assert (=> start!22046 true))

(declare-fun b!227740 () Bool)

(assert (=> b!227740 (= e!147736 (not call!21149))))

(declare-fun b!227741 () Bool)

(declare-fun Unit!6891 () Unit!6887)

(assert (=> b!227741 (= e!147739 Unit!6891)))

(declare-fun mapNonEmpty!10126 () Bool)

(declare-fun tp!21468 () Bool)

(assert (=> mapNonEmpty!10126 (= mapRes!10126 (and tp!21468 e!147734))))

(declare-fun mapKey!10126 () (_ BitVec 32))

(declare-fun mapRest!10126 () (Array (_ BitVec 32) ValueCell!2642))

(declare-fun mapValue!10126 () ValueCell!2642)

(assert (=> mapNonEmpty!10126 (= (arr!5311 (_values!4234 thiss!1504)) (store mapRest!10126 mapKey!10126 mapValue!10126))))

(declare-fun b!227742 () Bool)

(assert (=> b!227742 (= e!147743 e!147732)))

(declare-fun res!112097 () Bool)

(assert (=> b!227742 (=> (not res!112097) (not e!147732))))

(assert (=> b!227742 (= res!112097 (or (= lt!114627 (MissingZero!868 index!297)) (= lt!114627 (MissingVacant!868 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11185 (_ BitVec 32)) SeekEntryResult!868)

(assert (=> b!227742 (= lt!114627 (seekEntryOrOpen!0 key!932 (_keys!6305 thiss!1504) (mask!10115 thiss!1504)))))

(declare-fun b!227743 () Bool)

(declare-fun res!112101 () Bool)

(assert (=> b!227743 (=> res!112101 e!147738)))

(assert (=> b!227743 (= res!112101 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6305 thiss!1504) (mask!10115 thiss!1504))))))

(declare-fun array_inv!3489 (array!11185) Bool)

(declare-fun array_inv!3490 (array!11183) Bool)

(assert (=> b!227744 (= e!147731 (and tp!21469 tp_is_empty!5971 (array_inv!3489 (_keys!6305 thiss!1504)) (array_inv!3490 (_values!4234 thiss!1504)) e!147730))))

(declare-fun b!227745 () Bool)

(assert (=> b!227745 (= e!147729 tp_is_empty!5971)))

(assert (= (and start!22046 res!112095) b!227735))

(assert (= (and b!227735 res!112096) b!227742))

(assert (= (and b!227742 res!112097) b!227723))

(assert (= (and b!227723 c!37763) b!227729))

(assert (= (and b!227723 (not c!37763)) b!227726))

(assert (= (and b!227726 c!37765) b!227724))

(assert (= (and b!227726 (not c!37765)) b!227733))

(assert (= (and b!227724 res!112099) b!227734))

(assert (= (and b!227734 res!112098) b!227737))

(assert (= (and b!227733 c!37762) b!227736))

(assert (= (and b!227733 (not c!37762)) b!227739))

(assert (= (and b!227736 res!112100) b!227732))

(assert (= (and b!227732 res!112102) b!227740))

(assert (= (or b!227724 b!227736) bm!21146))

(assert (= (or b!227737 b!227740) bm!21147))

(assert (= (and b!227723 res!112103) b!227725))

(assert (= (and b!227725 c!37764) b!227727))

(assert (= (and b!227725 (not c!37764)) b!227741))

(assert (= (and b!227725 (not res!112104)) b!227731))

(assert (= (and b!227731 (not res!112105)) b!227743))

(assert (= (and b!227743 (not res!112101)) b!227730))

(assert (= (and b!227738 condMapEmpty!10126) mapIsEmpty!10126))

(assert (= (and b!227738 (not condMapEmpty!10126)) mapNonEmpty!10126))

(assert (= (and mapNonEmpty!10126 ((_ is ValueCellFull!2642) mapValue!10126)) b!227728))

(assert (= (and b!227738 ((_ is ValueCellFull!2642) mapDefault!10126)) b!227745))

(assert (= b!227744 b!227738))

(assert (= start!22046 b!227744))

(declare-fun m!249805 () Bool)

(assert (=> b!227726 m!249805))

(declare-fun m!249807 () Bool)

(assert (=> b!227723 m!249807))

(declare-fun m!249809 () Bool)

(assert (=> b!227723 m!249809))

(assert (=> b!227723 m!249809))

(declare-fun m!249811 () Bool)

(assert (=> b!227723 m!249811))

(declare-fun m!249813 () Bool)

(assert (=> bm!21147 m!249813))

(declare-fun m!249815 () Bool)

(assert (=> b!227729 m!249815))

(declare-fun m!249817 () Bool)

(assert (=> b!227734 m!249817))

(declare-fun m!249819 () Bool)

(assert (=> bm!21146 m!249819))

(declare-fun m!249821 () Bool)

(assert (=> b!227732 m!249821))

(declare-fun m!249823 () Bool)

(assert (=> b!227725 m!249823))

(assert (=> b!227725 m!249813))

(declare-fun m!249825 () Bool)

(assert (=> b!227725 m!249825))

(declare-fun m!249827 () Bool)

(assert (=> b!227725 m!249827))

(declare-fun m!249829 () Bool)

(assert (=> b!227725 m!249829))

(declare-fun m!249831 () Bool)

(assert (=> b!227725 m!249831))

(declare-fun m!249833 () Bool)

(assert (=> b!227725 m!249833))

(declare-fun m!249835 () Bool)

(assert (=> b!227725 m!249835))

(declare-fun m!249837 () Bool)

(assert (=> b!227725 m!249837))

(declare-fun m!249839 () Bool)

(assert (=> b!227725 m!249839))

(declare-fun m!249841 () Bool)

(assert (=> b!227743 m!249841))

(declare-fun m!249843 () Bool)

(assert (=> b!227730 m!249843))

(declare-fun m!249845 () Bool)

(assert (=> b!227744 m!249845))

(declare-fun m!249847 () Bool)

(assert (=> b!227744 m!249847))

(declare-fun m!249849 () Bool)

(assert (=> start!22046 m!249849))

(declare-fun m!249851 () Bool)

(assert (=> b!227727 m!249851))

(declare-fun m!249853 () Bool)

(assert (=> mapNonEmpty!10126 m!249853))

(declare-fun m!249855 () Bool)

(assert (=> b!227742 m!249855))

(check-sat (not b!227742) (not b!227726) (not b!227727) tp_is_empty!5971 (not b!227723) (not bm!21147) (not b!227743) (not b!227744) (not b!227729) (not b_next!6109) (not bm!21146) (not start!22046) (not b!227730) (not b!227725) (not mapNonEmpty!10126) b_and!13021)
(check-sat b_and!13021 (not b_next!6109))

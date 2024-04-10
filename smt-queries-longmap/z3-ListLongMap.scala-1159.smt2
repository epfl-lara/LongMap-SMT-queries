; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24380 () Bool)

(assert start!24380)

(declare-fun b!255467 () Bool)

(declare-fun b_free!6705 () Bool)

(declare-fun b_next!6705 () Bool)

(assert (=> b!255467 (= b_free!6705 (not b_next!6705))))

(declare-fun tp!23408 () Bool)

(declare-fun b_and!13755 () Bool)

(assert (=> b!255467 (= tp!23408 b_and!13755)))

(declare-fun b!255456 () Bool)

(declare-datatypes ((Unit!7928 0))(
  ( (Unit!7929) )
))
(declare-fun e!165598 () Unit!7928)

(declare-fun Unit!7930 () Unit!7928)

(assert (=> b!255456 (= e!165598 Unit!7930)))

(declare-fun lt!128135 () Unit!7928)

(declare-datatypes ((V!8403 0))(
  ( (V!8404 (val!3328 Int)) )
))
(declare-datatypes ((ValueCell!2940 0))(
  ( (ValueCellFull!2940 (v!5408 V!8403)) (EmptyCell!2940) )
))
(declare-datatypes ((array!12469 0))(
  ( (array!12470 (arr!5908 (Array (_ BitVec 32) ValueCell!2940)) (size!6255 (_ BitVec 32))) )
))
(declare-datatypes ((array!12471 0))(
  ( (array!12472 (arr!5909 (Array (_ BitVec 32) (_ BitVec 64))) (size!6256 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3780 0))(
  ( (LongMapFixedSize!3781 (defaultEntry!4713 Int) (mask!10973 (_ BitVec 32)) (extraKeys!4450 (_ BitVec 32)) (zeroValue!4554 V!8403) (minValue!4554 V!8403) (_size!1939 (_ BitVec 32)) (_keys!6871 array!12471) (_values!4696 array!12469) (_vacant!1939 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3780)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!230 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 64) (_ BitVec 32) Int) Unit!7928)

(assert (=> b!255456 (= lt!128135 (lemmaArrayContainsKeyThenInListMap!230 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(assert (=> b!255456 false))

(declare-fun b!255457 () Bool)

(declare-fun e!165592 () Unit!7928)

(declare-fun Unit!7931 () Unit!7928)

(assert (=> b!255457 (= e!165592 Unit!7931)))

(declare-fun lt!128131 () Unit!7928)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!423 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 64) Int) Unit!7928)

(assert (=> b!255457 (= lt!128131 (lemmaInListMapThenSeekEntryOrOpenFindsIt!423 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 (defaultEntry!4713 thiss!1504)))))

(assert (=> b!255457 false))

(declare-fun b!255458 () Bool)

(declare-fun e!165597 () Bool)

(declare-fun tp_is_empty!6567 () Bool)

(assert (=> b!255458 (= e!165597 tp_is_empty!6567)))

(declare-fun b!255459 () Bool)

(declare-fun e!165588 () Bool)

(declare-datatypes ((SeekEntryResult!1158 0))(
  ( (MissingZero!1158 (index!6802 (_ BitVec 32))) (Found!1158 (index!6803 (_ BitVec 32))) (Intermediate!1158 (undefined!1970 Bool) (index!6804 (_ BitVec 32)) (x!24918 (_ BitVec 32))) (Undefined!1158) (MissingVacant!1158 (index!6805 (_ BitVec 32))) )
))
(declare-fun lt!128137 () SeekEntryResult!1158)

(get-info :version)

(assert (=> b!255459 (= e!165588 ((_ is Undefined!1158) lt!128137))))

(declare-fun b!255460 () Bool)

(declare-fun res!125018 () Bool)

(declare-fun e!165599 () Bool)

(assert (=> b!255460 (=> (not res!125018) (not e!165599))))

(assert (=> b!255460 (= res!125018 (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6802 lt!128137)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255461 () Bool)

(declare-fun call!24149 () Bool)

(assert (=> b!255461 (= e!165599 (not call!24149))))

(declare-fun b!255462 () Bool)

(declare-fun e!165595 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255462 (= e!165595 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6871 thiss!1504))))))))

(declare-fun v!346 () V!8403)

(declare-fun lt!128142 () array!12471)

(declare-datatypes ((tuple2!4902 0))(
  ( (tuple2!4903 (_1!2462 (_ BitVec 64)) (_2!2462 V!8403)) )
))
(declare-datatypes ((List!3782 0))(
  ( (Nil!3779) (Cons!3778 (h!4440 tuple2!4902) (t!8833 List!3782)) )
))
(declare-datatypes ((ListLongMap!3815 0))(
  ( (ListLongMap!3816 (toList!1923 List!3782)) )
))
(declare-fun lt!128139 () ListLongMap!3815)

(declare-fun +!678 (ListLongMap!3815 tuple2!4902) ListLongMap!3815)

(declare-fun getCurrentListMap!1451 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 32) Int) ListLongMap!3815)

(assert (=> b!255462 (= (+!678 lt!128139 (tuple2!4903 key!932 v!346)) (getCurrentListMap!1451 lt!128142 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128138 () Unit!7928)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!88 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 32) (_ BitVec 64) V!8403 Int) Unit!7928)

(assert (=> b!255462 (= lt!128138 (lemmaAddValidKeyToArrayThenAddPairToListMap!88 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) index!297 key!932 v!346 (defaultEntry!4713 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12471 (_ BitVec 32)) Bool)

(assert (=> b!255462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128142 (mask!10973 thiss!1504))))

(declare-fun lt!128132 () Unit!7928)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12471 (_ BitVec 32) (_ BitVec 32)) Unit!7928)

(assert (=> b!255462 (= lt!128132 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6871 thiss!1504) index!297 (mask!10973 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12471 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255462 (= (arrayCountValidKeys!0 lt!128142 #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6871 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504)))))))

(declare-fun lt!128141 () Unit!7928)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12471 (_ BitVec 32) (_ BitVec 64)) Unit!7928)

(assert (=> b!255462 (= lt!128141 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6871 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3783 0))(
  ( (Nil!3780) (Cons!3779 (h!4441 (_ BitVec 64)) (t!8834 List!3783)) )
))
(declare-fun arrayNoDuplicates!0 (array!12471 (_ BitVec 32) List!3783) Bool)

(assert (=> b!255462 (arrayNoDuplicates!0 lt!128142 #b00000000000000000000000000000000 Nil!3780)))

(assert (=> b!255462 (= lt!128142 (array!12472 (store (arr!5909 (_keys!6871 thiss!1504)) index!297 key!932) (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun lt!128140 () Unit!7928)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3783) Unit!7928)

(assert (=> b!255462 (= lt!128140 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6871 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3780))))

(declare-fun lt!128133 () Unit!7928)

(assert (=> b!255462 (= lt!128133 e!165598)))

(declare-fun c!43134 () Bool)

(declare-fun arrayContainsKey!0 (array!12471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!255462 (= c!43134 (arrayContainsKey!0 (_keys!6871 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255463 () Bool)

(declare-fun e!165593 () Bool)

(assert (=> b!255463 (= e!165593 tp_is_empty!6567)))

(declare-fun mapNonEmpty!11172 () Bool)

(declare-fun mapRes!11172 () Bool)

(declare-fun tp!23409 () Bool)

(assert (=> mapNonEmpty!11172 (= mapRes!11172 (and tp!23409 e!165597))))

(declare-fun mapKey!11172 () (_ BitVec 32))

(declare-fun mapValue!11172 () ValueCell!2940)

(declare-fun mapRest!11172 () (Array (_ BitVec 32) ValueCell!2940))

(assert (=> mapNonEmpty!11172 (= (arr!5908 (_values!4696 thiss!1504)) (store mapRest!11172 mapKey!11172 mapValue!11172))))

(declare-fun b!255464 () Bool)

(declare-fun e!165596 () Bool)

(assert (=> b!255464 (= e!165588 e!165596)))

(declare-fun res!125015 () Bool)

(declare-fun call!24148 () Bool)

(assert (=> b!255464 (= res!125015 call!24148)))

(assert (=> b!255464 (=> (not res!125015) (not e!165596))))

(declare-fun b!255465 () Bool)

(declare-fun e!165601 () Bool)

(assert (=> b!255465 (= e!165601 (and e!165593 mapRes!11172))))

(declare-fun condMapEmpty!11172 () Bool)

(declare-fun mapDefault!11172 () ValueCell!2940)

(assert (=> b!255465 (= condMapEmpty!11172 (= (arr!5908 (_values!4696 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2940)) mapDefault!11172)))))

(declare-fun mapIsEmpty!11172 () Bool)

(assert (=> mapIsEmpty!11172 mapRes!11172))

(declare-fun b!255466 () Bool)

(declare-fun res!125012 () Bool)

(assert (=> b!255466 (= res!125012 (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6805 lt!128137)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255466 (=> (not res!125012) (not e!165596))))

(declare-fun c!43132 () Bool)

(declare-fun bm!24145 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24145 (= call!24148 (inRange!0 (ite c!43132 (index!6802 lt!128137) (index!6805 lt!128137)) (mask!10973 thiss!1504)))))

(declare-fun res!125016 () Bool)

(declare-fun e!165591 () Bool)

(assert (=> start!24380 (=> (not res!125016) (not e!165591))))

(declare-fun valid!1478 (LongMapFixedSize!3780) Bool)

(assert (=> start!24380 (= res!125016 (valid!1478 thiss!1504))))

(assert (=> start!24380 e!165591))

(declare-fun e!165590 () Bool)

(assert (=> start!24380 e!165590))

(assert (=> start!24380 true))

(assert (=> start!24380 tp_is_empty!6567))

(declare-fun array_inv!3907 (array!12471) Bool)

(declare-fun array_inv!3908 (array!12469) Bool)

(assert (=> b!255467 (= e!165590 (and tp!23408 tp_is_empty!6567 (array_inv!3907 (_keys!6871 thiss!1504)) (array_inv!3908 (_values!4696 thiss!1504)) e!165601))))

(declare-fun b!255468 () Bool)

(declare-fun Unit!7932 () Unit!7928)

(assert (=> b!255468 (= e!165598 Unit!7932)))

(declare-fun b!255469 () Bool)

(declare-fun lt!128136 () Unit!7928)

(assert (=> b!255469 (= e!165592 lt!128136)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!427 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 64) Int) Unit!7928)

(assert (=> b!255469 (= lt!128136 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!427 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 (defaultEntry!4713 thiss!1504)))))

(assert (=> b!255469 (= c!43132 ((_ is MissingZero!1158) lt!128137))))

(declare-fun e!165600 () Bool)

(assert (=> b!255469 e!165600))

(declare-fun b!255470 () Bool)

(assert (=> b!255470 (= e!165596 (not call!24149))))

(declare-fun b!255471 () Bool)

(declare-fun e!165589 () Bool)

(assert (=> b!255471 (= e!165591 e!165589)))

(declare-fun res!125017 () Bool)

(assert (=> b!255471 (=> (not res!125017) (not e!165589))))

(assert (=> b!255471 (= res!125017 (or (= lt!128137 (MissingZero!1158 index!297)) (= lt!128137 (MissingVacant!1158 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12471 (_ BitVec 32)) SeekEntryResult!1158)

(assert (=> b!255471 (= lt!128137 (seekEntryOrOpen!0 key!932 (_keys!6871 thiss!1504) (mask!10973 thiss!1504)))))

(declare-fun b!255472 () Bool)

(declare-fun res!125019 () Bool)

(assert (=> b!255472 (=> (not res!125019) (not e!165599))))

(assert (=> b!255472 (= res!125019 call!24148)))

(assert (=> b!255472 (= e!165600 e!165599)))

(declare-fun b!255473 () Bool)

(assert (=> b!255473 (= e!165589 e!165595)))

(declare-fun res!125013 () Bool)

(assert (=> b!255473 (=> (not res!125013) (not e!165595))))

(assert (=> b!255473 (= res!125013 (inRange!0 index!297 (mask!10973 thiss!1504)))))

(declare-fun lt!128134 () Unit!7928)

(assert (=> b!255473 (= lt!128134 e!165592)))

(declare-fun c!43133 () Bool)

(declare-fun contains!1857 (ListLongMap!3815 (_ BitVec 64)) Bool)

(assert (=> b!255473 (= c!43133 (contains!1857 lt!128139 key!932))))

(assert (=> b!255473 (= lt!128139 (getCurrentListMap!1451 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun bm!24146 () Bool)

(assert (=> bm!24146 (= call!24149 (arrayContainsKey!0 (_keys!6871 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255474 () Bool)

(declare-fun c!43131 () Bool)

(assert (=> b!255474 (= c!43131 ((_ is MissingVacant!1158) lt!128137))))

(assert (=> b!255474 (= e!165600 e!165588)))

(declare-fun b!255475 () Bool)

(declare-fun res!125014 () Bool)

(assert (=> b!255475 (=> (not res!125014) (not e!165591))))

(assert (=> b!255475 (= res!125014 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!24380 res!125016) b!255475))

(assert (= (and b!255475 res!125014) b!255471))

(assert (= (and b!255471 res!125017) b!255473))

(assert (= (and b!255473 c!43133) b!255457))

(assert (= (and b!255473 (not c!43133)) b!255469))

(assert (= (and b!255469 c!43132) b!255472))

(assert (= (and b!255469 (not c!43132)) b!255474))

(assert (= (and b!255472 res!125019) b!255460))

(assert (= (and b!255460 res!125018) b!255461))

(assert (= (and b!255474 c!43131) b!255464))

(assert (= (and b!255474 (not c!43131)) b!255459))

(assert (= (and b!255464 res!125015) b!255466))

(assert (= (and b!255466 res!125012) b!255470))

(assert (= (or b!255472 b!255464) bm!24145))

(assert (= (or b!255461 b!255470) bm!24146))

(assert (= (and b!255473 res!125013) b!255462))

(assert (= (and b!255462 c!43134) b!255456))

(assert (= (and b!255462 (not c!43134)) b!255468))

(assert (= (and b!255465 condMapEmpty!11172) mapIsEmpty!11172))

(assert (= (and b!255465 (not condMapEmpty!11172)) mapNonEmpty!11172))

(assert (= (and mapNonEmpty!11172 ((_ is ValueCellFull!2940) mapValue!11172)) b!255458))

(assert (= (and b!255465 ((_ is ValueCellFull!2940) mapDefault!11172)) b!255463))

(assert (= b!255467 b!255465))

(assert (= start!24380 b!255467))

(declare-fun m!270919 () Bool)

(assert (=> b!255460 m!270919))

(declare-fun m!270921 () Bool)

(assert (=> mapNonEmpty!11172 m!270921))

(declare-fun m!270923 () Bool)

(assert (=> b!255456 m!270923))

(declare-fun m!270925 () Bool)

(assert (=> b!255469 m!270925))

(declare-fun m!270927 () Bool)

(assert (=> b!255462 m!270927))

(declare-fun m!270929 () Bool)

(assert (=> b!255462 m!270929))

(declare-fun m!270931 () Bool)

(assert (=> b!255462 m!270931))

(declare-fun m!270933 () Bool)

(assert (=> b!255462 m!270933))

(declare-fun m!270935 () Bool)

(assert (=> b!255462 m!270935))

(declare-fun m!270937 () Bool)

(assert (=> b!255462 m!270937))

(declare-fun m!270939 () Bool)

(assert (=> b!255462 m!270939))

(declare-fun m!270941 () Bool)

(assert (=> b!255462 m!270941))

(declare-fun m!270943 () Bool)

(assert (=> b!255462 m!270943))

(declare-fun m!270945 () Bool)

(assert (=> b!255462 m!270945))

(declare-fun m!270947 () Bool)

(assert (=> b!255462 m!270947))

(declare-fun m!270949 () Bool)

(assert (=> b!255462 m!270949))

(declare-fun m!270951 () Bool)

(assert (=> b!255462 m!270951))

(assert (=> bm!24146 m!270927))

(declare-fun m!270953 () Bool)

(assert (=> b!255466 m!270953))

(declare-fun m!270955 () Bool)

(assert (=> b!255457 m!270955))

(declare-fun m!270957 () Bool)

(assert (=> b!255473 m!270957))

(declare-fun m!270959 () Bool)

(assert (=> b!255473 m!270959))

(declare-fun m!270961 () Bool)

(assert (=> b!255473 m!270961))

(declare-fun m!270963 () Bool)

(assert (=> start!24380 m!270963))

(declare-fun m!270965 () Bool)

(assert (=> bm!24145 m!270965))

(declare-fun m!270967 () Bool)

(assert (=> b!255467 m!270967))

(declare-fun m!270969 () Bool)

(assert (=> b!255467 m!270969))

(declare-fun m!270971 () Bool)

(assert (=> b!255471 m!270971))

(check-sat (not start!24380) (not b!255471) (not mapNonEmpty!11172) (not b_next!6705) (not b!255469) (not b!255462) (not b!255467) tp_is_empty!6567 (not b!255456) (not b!255473) b_and!13755 (not b!255457) (not bm!24146) (not bm!24145))
(check-sat b_and!13755 (not b_next!6705))
(get-model)

(declare-fun b!255552 () Bool)

(declare-fun res!125052 () Bool)

(declare-fun e!165655 () Bool)

(assert (=> b!255552 (=> (not res!125052) (not e!165655))))

(declare-fun call!24160 () Bool)

(assert (=> b!255552 (= res!125052 call!24160)))

(declare-fun e!165654 () Bool)

(assert (=> b!255552 (= e!165654 e!165655)))

(declare-fun d!61577 () Bool)

(declare-fun e!165652 () Bool)

(assert (=> d!61577 e!165652))

(declare-fun c!43152 () Bool)

(declare-fun lt!128183 () SeekEntryResult!1158)

(assert (=> d!61577 (= c!43152 ((_ is MissingZero!1158) lt!128183))))

(assert (=> d!61577 (= lt!128183 (seekEntryOrOpen!0 key!932 (_keys!6871 thiss!1504) (mask!10973 thiss!1504)))))

(declare-fun lt!128184 () Unit!7928)

(declare-fun choose!1220 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 64) Int) Unit!7928)

(assert (=> d!61577 (= lt!128184 (choose!1220 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 (defaultEntry!4713 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61577 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61577 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!427 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 (defaultEntry!4713 thiss!1504)) lt!128184)))

(declare-fun b!255553 () Bool)

(declare-fun call!24161 () Bool)

(assert (=> b!255553 (= e!165655 (not call!24161))))

(declare-fun bm!24157 () Bool)

(assert (=> bm!24157 (= call!24161 (arrayContainsKey!0 (_keys!6871 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255554 () Bool)

(declare-fun e!165653 () Bool)

(assert (=> b!255554 (= e!165653 (not call!24161))))

(declare-fun b!255555 () Bool)

(assert (=> b!255555 (= e!165652 e!165653)))

(declare-fun res!125054 () Bool)

(assert (=> b!255555 (= res!125054 call!24160)))

(assert (=> b!255555 (=> (not res!125054) (not e!165653))))

(declare-fun bm!24158 () Bool)

(assert (=> bm!24158 (= call!24160 (inRange!0 (ite c!43152 (index!6802 lt!128183) (index!6805 lt!128183)) (mask!10973 thiss!1504)))))

(declare-fun b!255556 () Bool)

(declare-fun res!125055 () Bool)

(assert (=> b!255556 (=> (not res!125055) (not e!165655))))

(assert (=> b!255556 (= res!125055 (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6805 lt!128183)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255556 (and (bvsge (index!6805 lt!128183) #b00000000000000000000000000000000) (bvslt (index!6805 lt!128183) (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun b!255557 () Bool)

(assert (=> b!255557 (= e!165652 e!165654)))

(declare-fun c!43151 () Bool)

(assert (=> b!255557 (= c!43151 ((_ is MissingVacant!1158) lt!128183))))

(declare-fun b!255558 () Bool)

(assert (=> b!255558 (and (bvsge (index!6802 lt!128183) #b00000000000000000000000000000000) (bvslt (index!6802 lt!128183) (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun res!125053 () Bool)

(assert (=> b!255558 (= res!125053 (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6802 lt!128183)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255558 (=> (not res!125053) (not e!165653))))

(declare-fun b!255559 () Bool)

(assert (=> b!255559 (= e!165654 ((_ is Undefined!1158) lt!128183))))

(assert (= (and d!61577 c!43152) b!255555))

(assert (= (and d!61577 (not c!43152)) b!255557))

(assert (= (and b!255555 res!125054) b!255558))

(assert (= (and b!255558 res!125053) b!255554))

(assert (= (and b!255557 c!43151) b!255552))

(assert (= (and b!255557 (not c!43151)) b!255559))

(assert (= (and b!255552 res!125052) b!255556))

(assert (= (and b!255556 res!125055) b!255553))

(assert (= (or b!255555 b!255552) bm!24158))

(assert (= (or b!255554 b!255553) bm!24157))

(assert (=> d!61577 m!270971))

(declare-fun m!271027 () Bool)

(assert (=> d!61577 m!271027))

(declare-fun m!271029 () Bool)

(assert (=> d!61577 m!271029))

(assert (=> bm!24157 m!270927))

(declare-fun m!271031 () Bool)

(assert (=> b!255558 m!271031))

(declare-fun m!271033 () Bool)

(assert (=> b!255556 m!271033))

(declare-fun m!271035 () Bool)

(assert (=> bm!24158 m!271035))

(assert (=> b!255469 d!61577))

(declare-fun d!61579 () Bool)

(assert (=> d!61579 (= (inRange!0 (ite c!43132 (index!6802 lt!128137) (index!6805 lt!128137)) (mask!10973 thiss!1504)) (and (bvsge (ite c!43132 (index!6802 lt!128137) (index!6805 lt!128137)) #b00000000000000000000000000000000) (bvslt (ite c!43132 (index!6802 lt!128137) (index!6805 lt!128137)) (bvadd (mask!10973 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24145 d!61579))

(declare-fun d!61581 () Bool)

(declare-fun res!125060 () Bool)

(declare-fun e!165660 () Bool)

(assert (=> d!61581 (=> res!125060 e!165660)))

(assert (=> d!61581 (= res!125060 (= (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61581 (= (arrayContainsKey!0 (_keys!6871 thiss!1504) key!932 #b00000000000000000000000000000000) e!165660)))

(declare-fun b!255564 () Bool)

(declare-fun e!165661 () Bool)

(assert (=> b!255564 (= e!165660 e!165661)))

(declare-fun res!125061 () Bool)

(assert (=> b!255564 (=> (not res!125061) (not e!165661))))

(assert (=> b!255564 (= res!125061 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun b!255565 () Bool)

(assert (=> b!255565 (= e!165661 (arrayContainsKey!0 (_keys!6871 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61581 (not res!125060)) b!255564))

(assert (= (and b!255564 res!125061) b!255565))

(declare-fun m!271037 () Bool)

(assert (=> d!61581 m!271037))

(declare-fun m!271039 () Bool)

(assert (=> b!255565 m!271039))

(assert (=> bm!24146 d!61581))

(declare-fun d!61583 () Bool)

(assert (=> d!61583 (contains!1857 (getCurrentListMap!1451 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)) key!932)))

(declare-fun lt!128187 () Unit!7928)

(declare-fun choose!1221 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 64) (_ BitVec 32) Int) Unit!7928)

(assert (=> d!61583 (= lt!128187 (choose!1221 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(assert (=> d!61583 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61583 (= (lemmaArrayContainsKeyThenInListMap!230 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)) lt!128187)))

(declare-fun bs!9063 () Bool)

(assert (= bs!9063 d!61583))

(assert (=> bs!9063 m!270961))

(assert (=> bs!9063 m!270961))

(declare-fun m!271041 () Bool)

(assert (=> bs!9063 m!271041))

(declare-fun m!271043 () Bool)

(assert (=> bs!9063 m!271043))

(assert (=> bs!9063 m!271029))

(assert (=> b!255456 d!61583))

(declare-fun d!61585 () Bool)

(declare-fun lt!128196 () SeekEntryResult!1158)

(assert (=> d!61585 (and (or ((_ is Undefined!1158) lt!128196) (not ((_ is Found!1158) lt!128196)) (and (bvsge (index!6803 lt!128196) #b00000000000000000000000000000000) (bvslt (index!6803 lt!128196) (size!6256 (_keys!6871 thiss!1504))))) (or ((_ is Undefined!1158) lt!128196) ((_ is Found!1158) lt!128196) (not ((_ is MissingZero!1158) lt!128196)) (and (bvsge (index!6802 lt!128196) #b00000000000000000000000000000000) (bvslt (index!6802 lt!128196) (size!6256 (_keys!6871 thiss!1504))))) (or ((_ is Undefined!1158) lt!128196) ((_ is Found!1158) lt!128196) ((_ is MissingZero!1158) lt!128196) (not ((_ is MissingVacant!1158) lt!128196)) (and (bvsge (index!6805 lt!128196) #b00000000000000000000000000000000) (bvslt (index!6805 lt!128196) (size!6256 (_keys!6871 thiss!1504))))) (or ((_ is Undefined!1158) lt!128196) (ite ((_ is Found!1158) lt!128196) (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6803 lt!128196)) key!932) (ite ((_ is MissingZero!1158) lt!128196) (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6802 lt!128196)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1158) lt!128196) (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6805 lt!128196)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!165669 () SeekEntryResult!1158)

(assert (=> d!61585 (= lt!128196 e!165669)))

(declare-fun c!43161 () Bool)

(declare-fun lt!128195 () SeekEntryResult!1158)

(assert (=> d!61585 (= c!43161 (and ((_ is Intermediate!1158) lt!128195) (undefined!1970 lt!128195)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12471 (_ BitVec 32)) SeekEntryResult!1158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61585 (= lt!128195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10973 thiss!1504)) key!932 (_keys!6871 thiss!1504) (mask!10973 thiss!1504)))))

(assert (=> d!61585 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61585 (= (seekEntryOrOpen!0 key!932 (_keys!6871 thiss!1504) (mask!10973 thiss!1504)) lt!128196)))

(declare-fun b!255578 () Bool)

(assert (=> b!255578 (= e!165669 Undefined!1158)))

(declare-fun b!255579 () Bool)

(declare-fun e!165670 () SeekEntryResult!1158)

(assert (=> b!255579 (= e!165670 (Found!1158 (index!6804 lt!128195)))))

(declare-fun b!255580 () Bool)

(declare-fun c!43159 () Bool)

(declare-fun lt!128194 () (_ BitVec 64))

(assert (=> b!255580 (= c!43159 (= lt!128194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165668 () SeekEntryResult!1158)

(assert (=> b!255580 (= e!165670 e!165668)))

(declare-fun b!255581 () Bool)

(assert (=> b!255581 (= e!165668 (MissingZero!1158 (index!6804 lt!128195)))))

(declare-fun b!255582 () Bool)

(assert (=> b!255582 (= e!165669 e!165670)))

(assert (=> b!255582 (= lt!128194 (select (arr!5909 (_keys!6871 thiss!1504)) (index!6804 lt!128195)))))

(declare-fun c!43160 () Bool)

(assert (=> b!255582 (= c!43160 (= lt!128194 key!932))))

(declare-fun b!255583 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12471 (_ BitVec 32)) SeekEntryResult!1158)

(assert (=> b!255583 (= e!165668 (seekKeyOrZeroReturnVacant!0 (x!24918 lt!128195) (index!6804 lt!128195) (index!6804 lt!128195) key!932 (_keys!6871 thiss!1504) (mask!10973 thiss!1504)))))

(assert (= (and d!61585 c!43161) b!255578))

(assert (= (and d!61585 (not c!43161)) b!255582))

(assert (= (and b!255582 c!43160) b!255579))

(assert (= (and b!255582 (not c!43160)) b!255580))

(assert (= (and b!255580 c!43159) b!255581))

(assert (= (and b!255580 (not c!43159)) b!255583))

(assert (=> d!61585 m!271029))

(declare-fun m!271045 () Bool)

(assert (=> d!61585 m!271045))

(declare-fun m!271047 () Bool)

(assert (=> d!61585 m!271047))

(declare-fun m!271049 () Bool)

(assert (=> d!61585 m!271049))

(declare-fun m!271051 () Bool)

(assert (=> d!61585 m!271051))

(assert (=> d!61585 m!271045))

(declare-fun m!271053 () Bool)

(assert (=> d!61585 m!271053))

(declare-fun m!271055 () Bool)

(assert (=> b!255582 m!271055))

(declare-fun m!271057 () Bool)

(assert (=> b!255583 m!271057))

(assert (=> b!255471 d!61585))

(declare-fun d!61587 () Bool)

(declare-fun e!165673 () Bool)

(assert (=> d!61587 e!165673))

(declare-fun res!125067 () Bool)

(assert (=> d!61587 (=> (not res!125067) (not e!165673))))

(declare-fun lt!128202 () SeekEntryResult!1158)

(assert (=> d!61587 (= res!125067 ((_ is Found!1158) lt!128202))))

(assert (=> d!61587 (= lt!128202 (seekEntryOrOpen!0 key!932 (_keys!6871 thiss!1504) (mask!10973 thiss!1504)))))

(declare-fun lt!128201 () Unit!7928)

(declare-fun choose!1222 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 64) Int) Unit!7928)

(assert (=> d!61587 (= lt!128201 (choose!1222 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 (defaultEntry!4713 thiss!1504)))))

(assert (=> d!61587 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61587 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!423 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) key!932 (defaultEntry!4713 thiss!1504)) lt!128201)))

(declare-fun b!255588 () Bool)

(declare-fun res!125066 () Bool)

(assert (=> b!255588 (=> (not res!125066) (not e!165673))))

(assert (=> b!255588 (= res!125066 (inRange!0 (index!6803 lt!128202) (mask!10973 thiss!1504)))))

(declare-fun b!255589 () Bool)

(assert (=> b!255589 (= e!165673 (= (select (arr!5909 (_keys!6871 thiss!1504)) (index!6803 lt!128202)) key!932))))

(assert (=> b!255589 (and (bvsge (index!6803 lt!128202) #b00000000000000000000000000000000) (bvslt (index!6803 lt!128202) (size!6256 (_keys!6871 thiss!1504))))))

(assert (= (and d!61587 res!125067) b!255588))

(assert (= (and b!255588 res!125066) b!255589))

(assert (=> d!61587 m!270971))

(declare-fun m!271059 () Bool)

(assert (=> d!61587 m!271059))

(assert (=> d!61587 m!271029))

(declare-fun m!271061 () Bool)

(assert (=> b!255588 m!271061))

(declare-fun m!271063 () Bool)

(assert (=> b!255589 m!271063))

(assert (=> b!255457 d!61587))

(declare-fun b!255601 () Bool)

(declare-fun e!165678 () Bool)

(assert (=> b!255601 (= e!165678 (= (arrayCountValidKeys!0 (array!12472 (store (arr!5909 (_keys!6871 thiss!1504)) index!297 key!932) (size!6256 (_keys!6871 thiss!1504))) #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6871 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!255600 () Bool)

(declare-fun e!165679 () Bool)

(assert (=> b!255600 (= e!165679 (bvslt (size!6256 (_keys!6871 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!255599 () Bool)

(declare-fun res!125078 () Bool)

(assert (=> b!255599 (=> (not res!125078) (not e!165679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!255599 (= res!125078 (validKeyInArray!0 key!932))))

(declare-fun d!61589 () Bool)

(assert (=> d!61589 e!165678))

(declare-fun res!125076 () Bool)

(assert (=> d!61589 (=> (not res!125076) (not e!165678))))

(assert (=> d!61589 (= res!125076 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6871 thiss!1504)))))))

(declare-fun lt!128205 () Unit!7928)

(declare-fun choose!1 (array!12471 (_ BitVec 32) (_ BitVec 64)) Unit!7928)

(assert (=> d!61589 (= lt!128205 (choose!1 (_keys!6871 thiss!1504) index!297 key!932))))

(assert (=> d!61589 e!165679))

(declare-fun res!125079 () Bool)

(assert (=> d!61589 (=> (not res!125079) (not e!165679))))

(assert (=> d!61589 (= res!125079 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6871 thiss!1504)))))))

(assert (=> d!61589 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6871 thiss!1504) index!297 key!932) lt!128205)))

(declare-fun b!255598 () Bool)

(declare-fun res!125077 () Bool)

(assert (=> b!255598 (=> (not res!125077) (not e!165679))))

(assert (=> b!255598 (= res!125077 (not (validKeyInArray!0 (select (arr!5909 (_keys!6871 thiss!1504)) index!297))))))

(assert (= (and d!61589 res!125079) b!255598))

(assert (= (and b!255598 res!125077) b!255599))

(assert (= (and b!255599 res!125078) b!255600))

(assert (= (and d!61589 res!125076) b!255601))

(assert (=> b!255601 m!270943))

(declare-fun m!271065 () Bool)

(assert (=> b!255601 m!271065))

(assert (=> b!255601 m!270949))

(declare-fun m!271067 () Bool)

(assert (=> b!255599 m!271067))

(declare-fun m!271069 () Bool)

(assert (=> d!61589 m!271069))

(declare-fun m!271071 () Bool)

(assert (=> b!255598 m!271071))

(assert (=> b!255598 m!271071))

(declare-fun m!271073 () Bool)

(assert (=> b!255598 m!271073))

(assert (=> b!255462 d!61589))

(declare-fun b!255610 () Bool)

(declare-fun e!165688 () Bool)

(declare-fun call!24164 () Bool)

(assert (=> b!255610 (= e!165688 call!24164)))

(declare-fun b!255611 () Bool)

(declare-fun e!165686 () Bool)

(assert (=> b!255611 (= e!165686 e!165688)))

(declare-fun lt!128213 () (_ BitVec 64))

(assert (=> b!255611 (= lt!128213 (select (arr!5909 lt!128142) #b00000000000000000000000000000000))))

(declare-fun lt!128214 () Unit!7928)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12471 (_ BitVec 64) (_ BitVec 32)) Unit!7928)

(assert (=> b!255611 (= lt!128214 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128142 lt!128213 #b00000000000000000000000000000000))))

(assert (=> b!255611 (arrayContainsKey!0 lt!128142 lt!128213 #b00000000000000000000000000000000)))

(declare-fun lt!128212 () Unit!7928)

(assert (=> b!255611 (= lt!128212 lt!128214)))

(declare-fun res!125085 () Bool)

(assert (=> b!255611 (= res!125085 (= (seekEntryOrOpen!0 (select (arr!5909 lt!128142) #b00000000000000000000000000000000) lt!128142 (mask!10973 thiss!1504)) (Found!1158 #b00000000000000000000000000000000)))))

(assert (=> b!255611 (=> (not res!125085) (not e!165688))))

(declare-fun b!255612 () Bool)

(declare-fun e!165687 () Bool)

(assert (=> b!255612 (= e!165687 e!165686)))

(declare-fun c!43164 () Bool)

(assert (=> b!255612 (= c!43164 (validKeyInArray!0 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(declare-fun bm!24161 () Bool)

(assert (=> bm!24161 (= call!24164 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128142 (mask!10973 thiss!1504)))))

(declare-fun b!255613 () Bool)

(assert (=> b!255613 (= e!165686 call!24164)))

(declare-fun d!61591 () Bool)

(declare-fun res!125084 () Bool)

(assert (=> d!61591 (=> res!125084 e!165687)))

(assert (=> d!61591 (= res!125084 (bvsge #b00000000000000000000000000000000 (size!6256 lt!128142)))))

(assert (=> d!61591 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128142 (mask!10973 thiss!1504)) e!165687)))

(assert (= (and d!61591 (not res!125084)) b!255612))

(assert (= (and b!255612 c!43164) b!255611))

(assert (= (and b!255612 (not c!43164)) b!255613))

(assert (= (and b!255611 res!125085) b!255610))

(assert (= (or b!255610 b!255613) bm!24161))

(declare-fun m!271075 () Bool)

(assert (=> b!255611 m!271075))

(declare-fun m!271077 () Bool)

(assert (=> b!255611 m!271077))

(declare-fun m!271079 () Bool)

(assert (=> b!255611 m!271079))

(assert (=> b!255611 m!271075))

(declare-fun m!271081 () Bool)

(assert (=> b!255611 m!271081))

(assert (=> b!255612 m!271075))

(assert (=> b!255612 m!271075))

(declare-fun m!271083 () Bool)

(assert (=> b!255612 m!271083))

(declare-fun m!271085 () Bool)

(assert (=> bm!24161 m!271085))

(assert (=> b!255462 d!61591))

(declare-fun b!255622 () Bool)

(declare-fun e!165694 () (_ BitVec 32))

(declare-fun e!165693 () (_ BitVec 32))

(assert (=> b!255622 (= e!165694 e!165693)))

(declare-fun c!43169 () Bool)

(assert (=> b!255622 (= c!43169 (validKeyInArray!0 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61593 () Bool)

(declare-fun lt!128217 () (_ BitVec 32))

(assert (=> d!61593 (and (bvsge lt!128217 #b00000000000000000000000000000000) (bvsle lt!128217 (bvsub (size!6256 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61593 (= lt!128217 e!165694)))

(declare-fun c!43170 () Bool)

(assert (=> d!61593 (= c!43170 (bvsge #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))))))

(assert (=> d!61593 (and (bvsle #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6256 (_keys!6871 thiss!1504)) (size!6256 (_keys!6871 thiss!1504))))))

(assert (=> d!61593 (= (arrayCountValidKeys!0 (_keys!6871 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) lt!128217)))

(declare-fun bm!24164 () Bool)

(declare-fun call!24167 () (_ BitVec 32))

(assert (=> bm!24164 (= call!24167 (arrayCountValidKeys!0 (_keys!6871 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun b!255623 () Bool)

(assert (=> b!255623 (= e!165693 call!24167)))

(declare-fun b!255624 () Bool)

(assert (=> b!255624 (= e!165693 (bvadd #b00000000000000000000000000000001 call!24167))))

(declare-fun b!255625 () Bool)

(assert (=> b!255625 (= e!165694 #b00000000000000000000000000000000)))

(assert (= (and d!61593 c!43170) b!255625))

(assert (= (and d!61593 (not c!43170)) b!255622))

(assert (= (and b!255622 c!43169) b!255624))

(assert (= (and b!255622 (not c!43169)) b!255623))

(assert (= (or b!255624 b!255623) bm!24164))

(assert (=> b!255622 m!271037))

(assert (=> b!255622 m!271037))

(declare-fun m!271087 () Bool)

(assert (=> b!255622 m!271087))

(declare-fun m!271089 () Bool)

(assert (=> bm!24164 m!271089))

(assert (=> b!255462 d!61593))

(declare-fun d!61595 () Bool)

(declare-fun e!165697 () Bool)

(assert (=> d!61595 e!165697))

(declare-fun res!125088 () Bool)

(assert (=> d!61595 (=> (not res!125088) (not e!165697))))

(assert (=> d!61595 (= res!125088 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6871 thiss!1504))) (bvslt index!297 (size!6255 (_values!4696 thiss!1504)))))))

(declare-fun lt!128220 () Unit!7928)

(declare-fun choose!1223 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 32) (_ BitVec 64) V!8403 Int) Unit!7928)

(assert (=> d!61595 (= lt!128220 (choose!1223 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) index!297 key!932 v!346 (defaultEntry!4713 thiss!1504)))))

(assert (=> d!61595 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61595 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!88 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) index!297 key!932 v!346 (defaultEntry!4713 thiss!1504)) lt!128220)))

(declare-fun b!255628 () Bool)

(assert (=> b!255628 (= e!165697 (= (+!678 (getCurrentListMap!1451 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)) (tuple2!4903 key!932 v!346)) (getCurrentListMap!1451 (array!12472 (store (arr!5909 (_keys!6871 thiss!1504)) index!297 key!932) (size!6256 (_keys!6871 thiss!1504))) (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504))))))

(assert (= (and d!61595 res!125088) b!255628))

(declare-fun m!271091 () Bool)

(assert (=> d!61595 m!271091))

(assert (=> d!61595 m!271029))

(assert (=> b!255628 m!270961))

(declare-fun m!271093 () Bool)

(assert (=> b!255628 m!271093))

(declare-fun m!271095 () Bool)

(assert (=> b!255628 m!271095))

(assert (=> b!255628 m!270961))

(assert (=> b!255628 m!270943))

(assert (=> b!255628 m!270933))

(assert (=> b!255462 d!61595))

(declare-fun b!255629 () Bool)

(declare-fun e!165699 () (_ BitVec 32))

(declare-fun e!165698 () (_ BitVec 32))

(assert (=> b!255629 (= e!165699 e!165698)))

(declare-fun c!43171 () Bool)

(assert (=> b!255629 (= c!43171 (validKeyInArray!0 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(declare-fun d!61597 () Bool)

(declare-fun lt!128221 () (_ BitVec 32))

(assert (=> d!61597 (and (bvsge lt!128221 #b00000000000000000000000000000000) (bvsle lt!128221 (bvsub (size!6256 lt!128142) #b00000000000000000000000000000000)))))

(assert (=> d!61597 (= lt!128221 e!165699)))

(declare-fun c!43172 () Bool)

(assert (=> d!61597 (= c!43172 (bvsge #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))))))

(assert (=> d!61597 (and (bvsle #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6256 (_keys!6871 thiss!1504)) (size!6256 lt!128142)))))

(assert (=> d!61597 (= (arrayCountValidKeys!0 lt!128142 #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) lt!128221)))

(declare-fun bm!24165 () Bool)

(declare-fun call!24168 () (_ BitVec 32))

(assert (=> bm!24165 (= call!24168 (arrayCountValidKeys!0 lt!128142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun b!255630 () Bool)

(assert (=> b!255630 (= e!165698 call!24168)))

(declare-fun b!255631 () Bool)

(assert (=> b!255631 (= e!165698 (bvadd #b00000000000000000000000000000001 call!24168))))

(declare-fun b!255632 () Bool)

(assert (=> b!255632 (= e!165699 #b00000000000000000000000000000000)))

(assert (= (and d!61597 c!43172) b!255632))

(assert (= (and d!61597 (not c!43172)) b!255629))

(assert (= (and b!255629 c!43171) b!255631))

(assert (= (and b!255629 (not c!43171)) b!255630))

(assert (= (or b!255631 b!255630) bm!24165))

(assert (=> b!255629 m!271075))

(assert (=> b!255629 m!271075))

(assert (=> b!255629 m!271083))

(declare-fun m!271097 () Bool)

(assert (=> bm!24165 m!271097))

(assert (=> b!255462 d!61597))

(declare-fun d!61599 () Bool)

(declare-fun e!165702 () Bool)

(assert (=> d!61599 e!165702))

(declare-fun res!125094 () Bool)

(assert (=> d!61599 (=> (not res!125094) (not e!165702))))

(declare-fun lt!128230 () ListLongMap!3815)

(assert (=> d!61599 (= res!125094 (contains!1857 lt!128230 (_1!2462 (tuple2!4903 key!932 v!346))))))

(declare-fun lt!128232 () List!3782)

(assert (=> d!61599 (= lt!128230 (ListLongMap!3816 lt!128232))))

(declare-fun lt!128233 () Unit!7928)

(declare-fun lt!128231 () Unit!7928)

(assert (=> d!61599 (= lt!128233 lt!128231)))

(declare-datatypes ((Option!313 0))(
  ( (Some!312 (v!5412 V!8403)) (None!311) )
))
(declare-fun getValueByKey!307 (List!3782 (_ BitVec 64)) Option!313)

(assert (=> d!61599 (= (getValueByKey!307 lt!128232 (_1!2462 (tuple2!4903 key!932 v!346))) (Some!312 (_2!2462 (tuple2!4903 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!163 (List!3782 (_ BitVec 64) V!8403) Unit!7928)

(assert (=> d!61599 (= lt!128231 (lemmaContainsTupThenGetReturnValue!163 lt!128232 (_1!2462 (tuple2!4903 key!932 v!346)) (_2!2462 (tuple2!4903 key!932 v!346))))))

(declare-fun insertStrictlySorted!166 (List!3782 (_ BitVec 64) V!8403) List!3782)

(assert (=> d!61599 (= lt!128232 (insertStrictlySorted!166 (toList!1923 lt!128139) (_1!2462 (tuple2!4903 key!932 v!346)) (_2!2462 (tuple2!4903 key!932 v!346))))))

(assert (=> d!61599 (= (+!678 lt!128139 (tuple2!4903 key!932 v!346)) lt!128230)))

(declare-fun b!255637 () Bool)

(declare-fun res!125093 () Bool)

(assert (=> b!255637 (=> (not res!125093) (not e!165702))))

(assert (=> b!255637 (= res!125093 (= (getValueByKey!307 (toList!1923 lt!128230) (_1!2462 (tuple2!4903 key!932 v!346))) (Some!312 (_2!2462 (tuple2!4903 key!932 v!346)))))))

(declare-fun b!255638 () Bool)

(declare-fun contains!1858 (List!3782 tuple2!4902) Bool)

(assert (=> b!255638 (= e!165702 (contains!1858 (toList!1923 lt!128230) (tuple2!4903 key!932 v!346)))))

(assert (= (and d!61599 res!125094) b!255637))

(assert (= (and b!255637 res!125093) b!255638))

(declare-fun m!271099 () Bool)

(assert (=> d!61599 m!271099))

(declare-fun m!271101 () Bool)

(assert (=> d!61599 m!271101))

(declare-fun m!271103 () Bool)

(assert (=> d!61599 m!271103))

(declare-fun m!271105 () Bool)

(assert (=> d!61599 m!271105))

(declare-fun m!271107 () Bool)

(assert (=> b!255637 m!271107))

(declare-fun m!271109 () Bool)

(assert (=> b!255638 m!271109))

(assert (=> b!255462 d!61599))

(declare-fun b!255649 () Bool)

(declare-fun e!165713 () Bool)

(declare-fun e!165711 () Bool)

(assert (=> b!255649 (= e!165713 e!165711)))

(declare-fun c!43175 () Bool)

(assert (=> b!255649 (= c!43175 (validKeyInArray!0 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(declare-fun bm!24168 () Bool)

(declare-fun call!24171 () Bool)

(assert (=> bm!24168 (= call!24171 (arrayNoDuplicates!0 lt!128142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43175 (Cons!3779 (select (arr!5909 lt!128142) #b00000000000000000000000000000000) Nil!3780) Nil!3780)))))

(declare-fun b!255650 () Bool)

(declare-fun e!165712 () Bool)

(declare-fun contains!1859 (List!3783 (_ BitVec 64)) Bool)

(assert (=> b!255650 (= e!165712 (contains!1859 Nil!3780 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(declare-fun b!255651 () Bool)

(assert (=> b!255651 (= e!165711 call!24171)))

(declare-fun d!61601 () Bool)

(declare-fun res!125102 () Bool)

(declare-fun e!165714 () Bool)

(assert (=> d!61601 (=> res!125102 e!165714)))

(assert (=> d!61601 (= res!125102 (bvsge #b00000000000000000000000000000000 (size!6256 lt!128142)))))

(assert (=> d!61601 (= (arrayNoDuplicates!0 lt!128142 #b00000000000000000000000000000000 Nil!3780) e!165714)))

(declare-fun b!255652 () Bool)

(assert (=> b!255652 (= e!165714 e!165713)))

(declare-fun res!125103 () Bool)

(assert (=> b!255652 (=> (not res!125103) (not e!165713))))

(assert (=> b!255652 (= res!125103 (not e!165712))))

(declare-fun res!125101 () Bool)

(assert (=> b!255652 (=> (not res!125101) (not e!165712))))

(assert (=> b!255652 (= res!125101 (validKeyInArray!0 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(declare-fun b!255653 () Bool)

(assert (=> b!255653 (= e!165711 call!24171)))

(assert (= (and d!61601 (not res!125102)) b!255652))

(assert (= (and b!255652 res!125101) b!255650))

(assert (= (and b!255652 res!125103) b!255649))

(assert (= (and b!255649 c!43175) b!255651))

(assert (= (and b!255649 (not c!43175)) b!255653))

(assert (= (or b!255651 b!255653) bm!24168))

(assert (=> b!255649 m!271075))

(assert (=> b!255649 m!271075))

(assert (=> b!255649 m!271083))

(assert (=> bm!24168 m!271075))

(declare-fun m!271111 () Bool)

(assert (=> bm!24168 m!271111))

(assert (=> b!255650 m!271075))

(assert (=> b!255650 m!271075))

(declare-fun m!271113 () Bool)

(assert (=> b!255650 m!271113))

(assert (=> b!255652 m!271075))

(assert (=> b!255652 m!271075))

(assert (=> b!255652 m!271083))

(assert (=> b!255462 d!61601))

(declare-fun d!61603 () Bool)

(declare-fun e!165717 () Bool)

(assert (=> d!61603 e!165717))

(declare-fun res!125106 () Bool)

(assert (=> d!61603 (=> (not res!125106) (not e!165717))))

(assert (=> d!61603 (= res!125106 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6871 thiss!1504)))))))

(declare-fun lt!128236 () Unit!7928)

(declare-fun choose!41 (array!12471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3783) Unit!7928)

(assert (=> d!61603 (= lt!128236 (choose!41 (_keys!6871 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3780))))

(assert (=> d!61603 (bvslt (size!6256 (_keys!6871 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61603 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6871 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3780) lt!128236)))

(declare-fun b!255656 () Bool)

(assert (=> b!255656 (= e!165717 (arrayNoDuplicates!0 (array!12472 (store (arr!5909 (_keys!6871 thiss!1504)) index!297 key!932) (size!6256 (_keys!6871 thiss!1504))) #b00000000000000000000000000000000 Nil!3780))))

(assert (= (and d!61603 res!125106) b!255656))

(declare-fun m!271115 () Bool)

(assert (=> d!61603 m!271115))

(assert (=> b!255656 m!270943))

(declare-fun m!271117 () Bool)

(assert (=> b!255656 m!271117))

(assert (=> b!255462 d!61603))

(declare-fun b!255699 () Bool)

(declare-fun e!165749 () Bool)

(declare-fun e!165750 () Bool)

(assert (=> b!255699 (= e!165749 e!165750)))

(declare-fun res!125126 () Bool)

(declare-fun call!24192 () Bool)

(assert (=> b!255699 (= res!125126 call!24192)))

(assert (=> b!255699 (=> (not res!125126) (not e!165750))))

(declare-fun b!255700 () Bool)

(declare-fun e!165754 () Unit!7928)

(declare-fun lt!128300 () Unit!7928)

(assert (=> b!255700 (= e!165754 lt!128300)))

(declare-fun lt!128297 () ListLongMap!3815)

(declare-fun getCurrentListMapNoExtraKeys!571 (array!12471 array!12469 (_ BitVec 32) (_ BitVec 32) V!8403 V!8403 (_ BitVec 32) Int) ListLongMap!3815)

(assert (=> b!255700 (= lt!128297 (getCurrentListMapNoExtraKeys!571 lt!128142 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128289 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128281 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128281 (select (arr!5909 lt!128142) #b00000000000000000000000000000000))))

(declare-fun lt!128299 () Unit!7928)

(declare-fun addStillContains!225 (ListLongMap!3815 (_ BitVec 64) V!8403 (_ BitVec 64)) Unit!7928)

(assert (=> b!255700 (= lt!128299 (addStillContains!225 lt!128297 lt!128289 (zeroValue!4554 thiss!1504) lt!128281))))

(assert (=> b!255700 (contains!1857 (+!678 lt!128297 (tuple2!4903 lt!128289 (zeroValue!4554 thiss!1504))) lt!128281)))

(declare-fun lt!128301 () Unit!7928)

(assert (=> b!255700 (= lt!128301 lt!128299)))

(declare-fun lt!128284 () ListLongMap!3815)

(assert (=> b!255700 (= lt!128284 (getCurrentListMapNoExtraKeys!571 lt!128142 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128287 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128296 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128296 (select (arr!5909 lt!128142) #b00000000000000000000000000000000))))

(declare-fun lt!128282 () Unit!7928)

(declare-fun addApplyDifferent!225 (ListLongMap!3815 (_ BitVec 64) V!8403 (_ BitVec 64)) Unit!7928)

(assert (=> b!255700 (= lt!128282 (addApplyDifferent!225 lt!128284 lt!128287 (minValue!4554 thiss!1504) lt!128296))))

(declare-fun apply!249 (ListLongMap!3815 (_ BitVec 64)) V!8403)

(assert (=> b!255700 (= (apply!249 (+!678 lt!128284 (tuple2!4903 lt!128287 (minValue!4554 thiss!1504))) lt!128296) (apply!249 lt!128284 lt!128296))))

(declare-fun lt!128302 () Unit!7928)

(assert (=> b!255700 (= lt!128302 lt!128282)))

(declare-fun lt!128286 () ListLongMap!3815)

(assert (=> b!255700 (= lt!128286 (getCurrentListMapNoExtraKeys!571 lt!128142 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128285 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128294 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128294 (select (arr!5909 lt!128142) #b00000000000000000000000000000000))))

(declare-fun lt!128288 () Unit!7928)

(assert (=> b!255700 (= lt!128288 (addApplyDifferent!225 lt!128286 lt!128285 (zeroValue!4554 thiss!1504) lt!128294))))

(assert (=> b!255700 (= (apply!249 (+!678 lt!128286 (tuple2!4903 lt!128285 (zeroValue!4554 thiss!1504))) lt!128294) (apply!249 lt!128286 lt!128294))))

(declare-fun lt!128298 () Unit!7928)

(assert (=> b!255700 (= lt!128298 lt!128288)))

(declare-fun lt!128290 () ListLongMap!3815)

(assert (=> b!255700 (= lt!128290 (getCurrentListMapNoExtraKeys!571 lt!128142 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128295 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128293 () (_ BitVec 64))

(assert (=> b!255700 (= lt!128293 (select (arr!5909 lt!128142) #b00000000000000000000000000000000))))

(assert (=> b!255700 (= lt!128300 (addApplyDifferent!225 lt!128290 lt!128295 (minValue!4554 thiss!1504) lt!128293))))

(assert (=> b!255700 (= (apply!249 (+!678 lt!128290 (tuple2!4903 lt!128295 (minValue!4554 thiss!1504))) lt!128293) (apply!249 lt!128290 lt!128293))))

(declare-fun b!255701 () Bool)

(declare-fun e!165753 () ListLongMap!3815)

(declare-fun e!165748 () ListLongMap!3815)

(assert (=> b!255701 (= e!165753 e!165748)))

(declare-fun c!43193 () Bool)

(assert (=> b!255701 (= c!43193 (and (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255702 () Bool)

(declare-fun e!165752 () ListLongMap!3815)

(declare-fun call!24190 () ListLongMap!3815)

(assert (=> b!255702 (= e!165752 call!24190)))

(declare-fun b!255703 () Bool)

(declare-fun e!165751 () Bool)

(declare-fun e!165745 () Bool)

(assert (=> b!255703 (= e!165751 e!165745)))

(declare-fun c!43188 () Bool)

(assert (=> b!255703 (= c!43188 (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!24187 () ListLongMap!3815)

(declare-fun c!43192 () Bool)

(declare-fun call!24191 () ListLongMap!3815)

(declare-fun bm!24183 () Bool)

(declare-fun call!24186 () ListLongMap!3815)

(declare-fun call!24189 () ListLongMap!3815)

(assert (=> bm!24183 (= call!24189 (+!678 (ite c!43192 call!24187 (ite c!43193 call!24191 call!24186)) (ite (or c!43192 c!43193) (tuple2!4903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4554 thiss!1504)) (tuple2!4903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4554 thiss!1504)))))))

(declare-fun b!255704 () Bool)

(declare-fun e!165755 () Bool)

(declare-fun lt!128283 () ListLongMap!3815)

(assert (=> b!255704 (= e!165755 (= (apply!249 lt!128283 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4554 thiss!1504)))))

(declare-fun bm!24184 () Bool)

(assert (=> bm!24184 (= call!24187 (getCurrentListMapNoExtraKeys!571 lt!128142 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun bm!24185 () Bool)

(assert (=> bm!24185 (= call!24186 call!24191)))

(declare-fun b!255705 () Bool)

(declare-fun res!125128 () Bool)

(assert (=> b!255705 (=> (not res!125128) (not e!165751))))

(declare-fun e!165747 () Bool)

(assert (=> b!255705 (= res!125128 e!165747)))

(declare-fun res!125129 () Bool)

(assert (=> b!255705 (=> res!125129 e!165747)))

(declare-fun e!165756 () Bool)

(assert (=> b!255705 (= res!125129 (not e!165756))))

(declare-fun res!125132 () Bool)

(assert (=> b!255705 (=> (not res!125132) (not e!165756))))

(assert (=> b!255705 (= res!125132 (bvslt #b00000000000000000000000000000000 (size!6256 lt!128142)))))

(declare-fun d!61605 () Bool)

(assert (=> d!61605 e!165751))

(declare-fun res!125133 () Bool)

(assert (=> d!61605 (=> (not res!125133) (not e!165751))))

(assert (=> d!61605 (= res!125133 (or (bvsge #b00000000000000000000000000000000 (size!6256 lt!128142)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 lt!128142)))))))

(declare-fun lt!128292 () ListLongMap!3815)

(assert (=> d!61605 (= lt!128283 lt!128292)))

(declare-fun lt!128291 () Unit!7928)

(assert (=> d!61605 (= lt!128291 e!165754)))

(declare-fun c!43191 () Bool)

(declare-fun e!165746 () Bool)

(assert (=> d!61605 (= c!43191 e!165746)))

(declare-fun res!125125 () Bool)

(assert (=> d!61605 (=> (not res!125125) (not e!165746))))

(assert (=> d!61605 (= res!125125 (bvslt #b00000000000000000000000000000000 (size!6256 lt!128142)))))

(assert (=> d!61605 (= lt!128292 e!165753)))

(assert (=> d!61605 (= c!43192 (and (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61605 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61605 (= (getCurrentListMap!1451 lt!128142 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)) lt!128283)))

(declare-fun b!255706 () Bool)

(assert (=> b!255706 (= e!165752 call!24186)))

(declare-fun b!255707 () Bool)

(assert (=> b!255707 (= e!165748 call!24190)))

(declare-fun b!255708 () Bool)

(declare-fun Unit!7933 () Unit!7928)

(assert (=> b!255708 (= e!165754 Unit!7933)))

(declare-fun b!255709 () Bool)

(declare-fun res!125130 () Bool)

(assert (=> b!255709 (=> (not res!125130) (not e!165751))))

(assert (=> b!255709 (= res!125130 e!165749)))

(declare-fun c!43189 () Bool)

(assert (=> b!255709 (= c!43189 (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255710 () Bool)

(assert (=> b!255710 (= e!165746 (validKeyInArray!0 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(declare-fun b!255711 () Bool)

(assert (=> b!255711 (= e!165750 (= (apply!249 lt!128283 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4554 thiss!1504)))))

(declare-fun b!255712 () Bool)

(declare-fun c!43190 () Bool)

(assert (=> b!255712 (= c!43190 (and (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255712 (= e!165748 e!165752)))

(declare-fun b!255713 () Bool)

(declare-fun call!24188 () Bool)

(assert (=> b!255713 (= e!165745 (not call!24188))))

(declare-fun b!255714 () Bool)

(assert (=> b!255714 (= e!165756 (validKeyInArray!0 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(declare-fun bm!24186 () Bool)

(assert (=> bm!24186 (= call!24192 (contains!1857 lt!128283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255715 () Bool)

(assert (=> b!255715 (= e!165745 e!165755)))

(declare-fun res!125131 () Bool)

(assert (=> b!255715 (= res!125131 call!24188)))

(assert (=> b!255715 (=> (not res!125131) (not e!165755))))

(declare-fun b!255716 () Bool)

(assert (=> b!255716 (= e!165749 (not call!24192))))

(declare-fun b!255717 () Bool)

(declare-fun e!165744 () Bool)

(assert (=> b!255717 (= e!165747 e!165744)))

(declare-fun res!125127 () Bool)

(assert (=> b!255717 (=> (not res!125127) (not e!165744))))

(assert (=> b!255717 (= res!125127 (contains!1857 lt!128283 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)))))

(assert (=> b!255717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 lt!128142)))))

(declare-fun bm!24187 () Bool)

(assert (=> bm!24187 (= call!24190 call!24189)))

(declare-fun bm!24188 () Bool)

(assert (=> bm!24188 (= call!24188 (contains!1857 lt!128283 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24189 () Bool)

(assert (=> bm!24189 (= call!24191 call!24187)))

(declare-fun b!255718 () Bool)

(declare-fun get!3038 (ValueCell!2940 V!8403) V!8403)

(declare-fun dynLambda!592 (Int (_ BitVec 64)) V!8403)

(assert (=> b!255718 (= e!165744 (= (apply!249 lt!128283 (select (arr!5909 lt!128142) #b00000000000000000000000000000000)) (get!3038 (select (arr!5908 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4713 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6255 (array!12470 (store (arr!5908 (_values!4696 thiss!1504)) index!297 (ValueCellFull!2940 v!346)) (size!6255 (_values!4696 thiss!1504))))))))

(assert (=> b!255718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 lt!128142)))))

(declare-fun b!255719 () Bool)

(assert (=> b!255719 (= e!165753 (+!678 call!24189 (tuple2!4903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4554 thiss!1504))))))

(assert (= (and d!61605 c!43192) b!255719))

(assert (= (and d!61605 (not c!43192)) b!255701))

(assert (= (and b!255701 c!43193) b!255707))

(assert (= (and b!255701 (not c!43193)) b!255712))

(assert (= (and b!255712 c!43190) b!255702))

(assert (= (and b!255712 (not c!43190)) b!255706))

(assert (= (or b!255702 b!255706) bm!24185))

(assert (= (or b!255707 bm!24185) bm!24189))

(assert (= (or b!255707 b!255702) bm!24187))

(assert (= (or b!255719 bm!24189) bm!24184))

(assert (= (or b!255719 bm!24187) bm!24183))

(assert (= (and d!61605 res!125125) b!255710))

(assert (= (and d!61605 c!43191) b!255700))

(assert (= (and d!61605 (not c!43191)) b!255708))

(assert (= (and d!61605 res!125133) b!255705))

(assert (= (and b!255705 res!125132) b!255714))

(assert (= (and b!255705 (not res!125129)) b!255717))

(assert (= (and b!255717 res!125127) b!255718))

(assert (= (and b!255705 res!125128) b!255709))

(assert (= (and b!255709 c!43189) b!255699))

(assert (= (and b!255709 (not c!43189)) b!255716))

(assert (= (and b!255699 res!125126) b!255711))

(assert (= (or b!255699 b!255716) bm!24186))

(assert (= (and b!255709 res!125130) b!255703))

(assert (= (and b!255703 c!43188) b!255715))

(assert (= (and b!255703 (not c!43188)) b!255713))

(assert (= (and b!255715 res!125131) b!255704))

(assert (= (or b!255715 b!255713) bm!24188))

(declare-fun b_lambda!8147 () Bool)

(assert (=> (not b_lambda!8147) (not b!255718)))

(declare-fun t!8836 () Bool)

(declare-fun tb!3011 () Bool)

(assert (=> (and b!255467 (= (defaultEntry!4713 thiss!1504) (defaultEntry!4713 thiss!1504)) t!8836) tb!3011))

(declare-fun result!5355 () Bool)

(assert (=> tb!3011 (= result!5355 tp_is_empty!6567)))

(assert (=> b!255718 t!8836))

(declare-fun b_and!13759 () Bool)

(assert (= b_and!13755 (and (=> t!8836 result!5355) b_and!13759)))

(declare-fun m!271119 () Bool)

(assert (=> b!255711 m!271119))

(declare-fun m!271121 () Bool)

(assert (=> b!255718 m!271121))

(assert (=> b!255718 m!271075))

(declare-fun m!271123 () Bool)

(assert (=> b!255718 m!271123))

(assert (=> b!255718 m!271123))

(assert (=> b!255718 m!271121))

(declare-fun m!271125 () Bool)

(assert (=> b!255718 m!271125))

(assert (=> b!255718 m!271075))

(declare-fun m!271127 () Bool)

(assert (=> b!255718 m!271127))

(assert (=> d!61605 m!271029))

(assert (=> b!255717 m!271075))

(assert (=> b!255717 m!271075))

(declare-fun m!271129 () Bool)

(assert (=> b!255717 m!271129))

(declare-fun m!271131 () Bool)

(assert (=> b!255700 m!271131))

(declare-fun m!271133 () Bool)

(assert (=> b!255700 m!271133))

(declare-fun m!271135 () Bool)

(assert (=> b!255700 m!271135))

(assert (=> b!255700 m!271075))

(declare-fun m!271137 () Bool)

(assert (=> b!255700 m!271137))

(declare-fun m!271139 () Bool)

(assert (=> b!255700 m!271139))

(declare-fun m!271141 () Bool)

(assert (=> b!255700 m!271141))

(declare-fun m!271143 () Bool)

(assert (=> b!255700 m!271143))

(declare-fun m!271145 () Bool)

(assert (=> b!255700 m!271145))

(assert (=> b!255700 m!271131))

(declare-fun m!271147 () Bool)

(assert (=> b!255700 m!271147))

(assert (=> b!255700 m!271133))

(declare-fun m!271149 () Bool)

(assert (=> b!255700 m!271149))

(declare-fun m!271151 () Bool)

(assert (=> b!255700 m!271151))

(declare-fun m!271153 () Bool)

(assert (=> b!255700 m!271153))

(declare-fun m!271155 () Bool)

(assert (=> b!255700 m!271155))

(declare-fun m!271157 () Bool)

(assert (=> b!255700 m!271157))

(assert (=> b!255700 m!271137))

(declare-fun m!271159 () Bool)

(assert (=> b!255700 m!271159))

(assert (=> b!255700 m!271143))

(declare-fun m!271161 () Bool)

(assert (=> b!255700 m!271161))

(declare-fun m!271163 () Bool)

(assert (=> b!255719 m!271163))

(declare-fun m!271165 () Bool)

(assert (=> bm!24186 m!271165))

(assert (=> bm!24184 m!271153))

(declare-fun m!271167 () Bool)

(assert (=> b!255704 m!271167))

(assert (=> b!255714 m!271075))

(assert (=> b!255714 m!271075))

(assert (=> b!255714 m!271083))

(assert (=> b!255710 m!271075))

(assert (=> b!255710 m!271075))

(assert (=> b!255710 m!271083))

(declare-fun m!271169 () Bool)

(assert (=> bm!24183 m!271169))

(declare-fun m!271171 () Bool)

(assert (=> bm!24188 m!271171))

(assert (=> b!255462 d!61605))

(assert (=> b!255462 d!61581))

(declare-fun d!61607 () Bool)

(declare-fun e!165759 () Bool)

(assert (=> d!61607 e!165759))

(declare-fun res!125136 () Bool)

(assert (=> d!61607 (=> (not res!125136) (not e!165759))))

(assert (=> d!61607 (= res!125136 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6871 thiss!1504)))))))

(declare-fun lt!128305 () Unit!7928)

(declare-fun choose!102 ((_ BitVec 64) array!12471 (_ BitVec 32) (_ BitVec 32)) Unit!7928)

(assert (=> d!61607 (= lt!128305 (choose!102 key!932 (_keys!6871 thiss!1504) index!297 (mask!10973 thiss!1504)))))

(assert (=> d!61607 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61607 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6871 thiss!1504) index!297 (mask!10973 thiss!1504)) lt!128305)))

(declare-fun b!255724 () Bool)

(assert (=> b!255724 (= e!165759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12472 (store (arr!5909 (_keys!6871 thiss!1504)) index!297 key!932) (size!6256 (_keys!6871 thiss!1504))) (mask!10973 thiss!1504)))))

(assert (= (and d!61607 res!125136) b!255724))

(declare-fun m!271173 () Bool)

(assert (=> d!61607 m!271173))

(assert (=> d!61607 m!271029))

(assert (=> b!255724 m!270943))

(declare-fun m!271175 () Bool)

(assert (=> b!255724 m!271175))

(assert (=> b!255462 d!61607))

(declare-fun d!61609 () Bool)

(assert (=> d!61609 (= (inRange!0 index!297 (mask!10973 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10973 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255473 d!61609))

(declare-fun d!61611 () Bool)

(declare-fun e!165765 () Bool)

(assert (=> d!61611 e!165765))

(declare-fun res!125139 () Bool)

(assert (=> d!61611 (=> res!125139 e!165765)))

(declare-fun lt!128315 () Bool)

(assert (=> d!61611 (= res!125139 (not lt!128315))))

(declare-fun lt!128317 () Bool)

(assert (=> d!61611 (= lt!128315 lt!128317)))

(declare-fun lt!128316 () Unit!7928)

(declare-fun e!165764 () Unit!7928)

(assert (=> d!61611 (= lt!128316 e!165764)))

(declare-fun c!43196 () Bool)

(assert (=> d!61611 (= c!43196 lt!128317)))

(declare-fun containsKey!299 (List!3782 (_ BitVec 64)) Bool)

(assert (=> d!61611 (= lt!128317 (containsKey!299 (toList!1923 lt!128139) key!932))))

(assert (=> d!61611 (= (contains!1857 lt!128139 key!932) lt!128315)))

(declare-fun b!255731 () Bool)

(declare-fun lt!128314 () Unit!7928)

(assert (=> b!255731 (= e!165764 lt!128314)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!247 (List!3782 (_ BitVec 64)) Unit!7928)

(assert (=> b!255731 (= lt!128314 (lemmaContainsKeyImpliesGetValueByKeyDefined!247 (toList!1923 lt!128139) key!932))))

(declare-fun isDefined!248 (Option!313) Bool)

(assert (=> b!255731 (isDefined!248 (getValueByKey!307 (toList!1923 lt!128139) key!932))))

(declare-fun b!255732 () Bool)

(declare-fun Unit!7934 () Unit!7928)

(assert (=> b!255732 (= e!165764 Unit!7934)))

(declare-fun b!255733 () Bool)

(assert (=> b!255733 (= e!165765 (isDefined!248 (getValueByKey!307 (toList!1923 lt!128139) key!932)))))

(assert (= (and d!61611 c!43196) b!255731))

(assert (= (and d!61611 (not c!43196)) b!255732))

(assert (= (and d!61611 (not res!125139)) b!255733))

(declare-fun m!271177 () Bool)

(assert (=> d!61611 m!271177))

(declare-fun m!271179 () Bool)

(assert (=> b!255731 m!271179))

(declare-fun m!271181 () Bool)

(assert (=> b!255731 m!271181))

(assert (=> b!255731 m!271181))

(declare-fun m!271183 () Bool)

(assert (=> b!255731 m!271183))

(assert (=> b!255733 m!271181))

(assert (=> b!255733 m!271181))

(assert (=> b!255733 m!271183))

(assert (=> b!255473 d!61611))

(declare-fun b!255734 () Bool)

(declare-fun e!165771 () Bool)

(declare-fun e!165772 () Bool)

(assert (=> b!255734 (= e!165771 e!165772)))

(declare-fun res!125141 () Bool)

(declare-fun call!24199 () Bool)

(assert (=> b!255734 (= res!125141 call!24199)))

(assert (=> b!255734 (=> (not res!125141) (not e!165772))))

(declare-fun b!255735 () Bool)

(declare-fun e!165776 () Unit!7928)

(declare-fun lt!128337 () Unit!7928)

(assert (=> b!255735 (= e!165776 lt!128337)))

(declare-fun lt!128334 () ListLongMap!3815)

(assert (=> b!255735 (= lt!128334 (getCurrentListMapNoExtraKeys!571 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128326 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128318 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128318 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128336 () Unit!7928)

(assert (=> b!255735 (= lt!128336 (addStillContains!225 lt!128334 lt!128326 (zeroValue!4554 thiss!1504) lt!128318))))

(assert (=> b!255735 (contains!1857 (+!678 lt!128334 (tuple2!4903 lt!128326 (zeroValue!4554 thiss!1504))) lt!128318)))

(declare-fun lt!128338 () Unit!7928)

(assert (=> b!255735 (= lt!128338 lt!128336)))

(declare-fun lt!128321 () ListLongMap!3815)

(assert (=> b!255735 (= lt!128321 (getCurrentListMapNoExtraKeys!571 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128324 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128324 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128333 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128333 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128319 () Unit!7928)

(assert (=> b!255735 (= lt!128319 (addApplyDifferent!225 lt!128321 lt!128324 (minValue!4554 thiss!1504) lt!128333))))

(assert (=> b!255735 (= (apply!249 (+!678 lt!128321 (tuple2!4903 lt!128324 (minValue!4554 thiss!1504))) lt!128333) (apply!249 lt!128321 lt!128333))))

(declare-fun lt!128339 () Unit!7928)

(assert (=> b!255735 (= lt!128339 lt!128319)))

(declare-fun lt!128323 () ListLongMap!3815)

(assert (=> b!255735 (= lt!128323 (getCurrentListMapNoExtraKeys!571 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128322 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128331 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128331 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128325 () Unit!7928)

(assert (=> b!255735 (= lt!128325 (addApplyDifferent!225 lt!128323 lt!128322 (zeroValue!4554 thiss!1504) lt!128331))))

(assert (=> b!255735 (= (apply!249 (+!678 lt!128323 (tuple2!4903 lt!128322 (zeroValue!4554 thiss!1504))) lt!128331) (apply!249 lt!128323 lt!128331))))

(declare-fun lt!128335 () Unit!7928)

(assert (=> b!255735 (= lt!128335 lt!128325)))

(declare-fun lt!128327 () ListLongMap!3815)

(assert (=> b!255735 (= lt!128327 (getCurrentListMapNoExtraKeys!571 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun lt!128332 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128330 () (_ BitVec 64))

(assert (=> b!255735 (= lt!128330 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255735 (= lt!128337 (addApplyDifferent!225 lt!128327 lt!128332 (minValue!4554 thiss!1504) lt!128330))))

(assert (=> b!255735 (= (apply!249 (+!678 lt!128327 (tuple2!4903 lt!128332 (minValue!4554 thiss!1504))) lt!128330) (apply!249 lt!128327 lt!128330))))

(declare-fun b!255736 () Bool)

(declare-fun e!165775 () ListLongMap!3815)

(declare-fun e!165770 () ListLongMap!3815)

(assert (=> b!255736 (= e!165775 e!165770)))

(declare-fun c!43202 () Bool)

(assert (=> b!255736 (= c!43202 (and (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255737 () Bool)

(declare-fun e!165774 () ListLongMap!3815)

(declare-fun call!24197 () ListLongMap!3815)

(assert (=> b!255737 (= e!165774 call!24197)))

(declare-fun b!255738 () Bool)

(declare-fun e!165773 () Bool)

(declare-fun e!165767 () Bool)

(assert (=> b!255738 (= e!165773 e!165767)))

(declare-fun c!43197 () Bool)

(assert (=> b!255738 (= c!43197 (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!24196 () ListLongMap!3815)

(declare-fun call!24193 () ListLongMap!3815)

(declare-fun call!24198 () ListLongMap!3815)

(declare-fun bm!24190 () Bool)

(declare-fun c!43201 () Bool)

(declare-fun call!24194 () ListLongMap!3815)

(assert (=> bm!24190 (= call!24196 (+!678 (ite c!43201 call!24194 (ite c!43202 call!24198 call!24193)) (ite (or c!43201 c!43202) (tuple2!4903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4554 thiss!1504)) (tuple2!4903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4554 thiss!1504)))))))

(declare-fun b!255739 () Bool)

(declare-fun e!165777 () Bool)

(declare-fun lt!128320 () ListLongMap!3815)

(assert (=> b!255739 (= e!165777 (= (apply!249 lt!128320 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4554 thiss!1504)))))

(declare-fun bm!24191 () Bool)

(assert (=> bm!24191 (= call!24194 (getCurrentListMapNoExtraKeys!571 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)))))

(declare-fun bm!24192 () Bool)

(assert (=> bm!24192 (= call!24193 call!24198)))

(declare-fun b!255740 () Bool)

(declare-fun res!125143 () Bool)

(assert (=> b!255740 (=> (not res!125143) (not e!165773))))

(declare-fun e!165769 () Bool)

(assert (=> b!255740 (= res!125143 e!165769)))

(declare-fun res!125144 () Bool)

(assert (=> b!255740 (=> res!125144 e!165769)))

(declare-fun e!165778 () Bool)

(assert (=> b!255740 (= res!125144 (not e!165778))))

(declare-fun res!125147 () Bool)

(assert (=> b!255740 (=> (not res!125147) (not e!165778))))

(assert (=> b!255740 (= res!125147 (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun d!61613 () Bool)

(assert (=> d!61613 e!165773))

(declare-fun res!125148 () Bool)

(assert (=> d!61613 (=> (not res!125148) (not e!165773))))

(assert (=> d!61613 (= res!125148 (or (bvsge #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))))))))

(declare-fun lt!128329 () ListLongMap!3815)

(assert (=> d!61613 (= lt!128320 lt!128329)))

(declare-fun lt!128328 () Unit!7928)

(assert (=> d!61613 (= lt!128328 e!165776)))

(declare-fun c!43200 () Bool)

(declare-fun e!165768 () Bool)

(assert (=> d!61613 (= c!43200 e!165768)))

(declare-fun res!125140 () Bool)

(assert (=> d!61613 (=> (not res!125140) (not e!165768))))

(assert (=> d!61613 (= res!125140 (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))))))

(assert (=> d!61613 (= lt!128329 e!165775)))

(assert (=> d!61613 (= c!43201 (and (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61613 (validMask!0 (mask!10973 thiss!1504))))

(assert (=> d!61613 (= (getCurrentListMap!1451 (_keys!6871 thiss!1504) (_values!4696 thiss!1504) (mask!10973 thiss!1504) (extraKeys!4450 thiss!1504) (zeroValue!4554 thiss!1504) (minValue!4554 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4713 thiss!1504)) lt!128320)))

(declare-fun b!255741 () Bool)

(assert (=> b!255741 (= e!165774 call!24193)))

(declare-fun b!255742 () Bool)

(assert (=> b!255742 (= e!165770 call!24197)))

(declare-fun b!255743 () Bool)

(declare-fun Unit!7935 () Unit!7928)

(assert (=> b!255743 (= e!165776 Unit!7935)))

(declare-fun b!255744 () Bool)

(declare-fun res!125145 () Bool)

(assert (=> b!255744 (=> (not res!125145) (not e!165773))))

(assert (=> b!255744 (= res!125145 e!165771)))

(declare-fun c!43198 () Bool)

(assert (=> b!255744 (= c!43198 (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255745 () Bool)

(assert (=> b!255745 (= e!165768 (validKeyInArray!0 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255746 () Bool)

(assert (=> b!255746 (= e!165772 (= (apply!249 lt!128320 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4554 thiss!1504)))))

(declare-fun b!255747 () Bool)

(declare-fun c!43199 () Bool)

(assert (=> b!255747 (= c!43199 (and (not (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4450 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255747 (= e!165770 e!165774)))

(declare-fun b!255748 () Bool)

(declare-fun call!24195 () Bool)

(assert (=> b!255748 (= e!165767 (not call!24195))))

(declare-fun b!255749 () Bool)

(assert (=> b!255749 (= e!165778 (validKeyInArray!0 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24193 () Bool)

(assert (=> bm!24193 (= call!24199 (contains!1857 lt!128320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255750 () Bool)

(assert (=> b!255750 (= e!165767 e!165777)))

(declare-fun res!125146 () Bool)

(assert (=> b!255750 (= res!125146 call!24195)))

(assert (=> b!255750 (=> (not res!125146) (not e!165777))))

(declare-fun b!255751 () Bool)

(assert (=> b!255751 (= e!165771 (not call!24199))))

(declare-fun b!255752 () Bool)

(declare-fun e!165766 () Bool)

(assert (=> b!255752 (= e!165769 e!165766)))

(declare-fun res!125142 () Bool)

(assert (=> b!255752 (=> (not res!125142) (not e!165766))))

(assert (=> b!255752 (= res!125142 (contains!1857 lt!128320 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!255752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun bm!24194 () Bool)

(assert (=> bm!24194 (= call!24197 call!24196)))

(declare-fun bm!24195 () Bool)

(assert (=> bm!24195 (= call!24195 (contains!1857 lt!128320 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24196 () Bool)

(assert (=> bm!24196 (= call!24198 call!24194)))

(declare-fun b!255753 () Bool)

(assert (=> b!255753 (= e!165766 (= (apply!249 lt!128320 (select (arr!5909 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000)) (get!3038 (select (arr!5908 (_values!4696 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4713 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6255 (_values!4696 thiss!1504))))))

(assert (=> b!255753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))))))

(declare-fun b!255754 () Bool)

(assert (=> b!255754 (= e!165775 (+!678 call!24196 (tuple2!4903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4554 thiss!1504))))))

(assert (= (and d!61613 c!43201) b!255754))

(assert (= (and d!61613 (not c!43201)) b!255736))

(assert (= (and b!255736 c!43202) b!255742))

(assert (= (and b!255736 (not c!43202)) b!255747))

(assert (= (and b!255747 c!43199) b!255737))

(assert (= (and b!255747 (not c!43199)) b!255741))

(assert (= (or b!255737 b!255741) bm!24192))

(assert (= (or b!255742 bm!24192) bm!24196))

(assert (= (or b!255742 b!255737) bm!24194))

(assert (= (or b!255754 bm!24196) bm!24191))

(assert (= (or b!255754 bm!24194) bm!24190))

(assert (= (and d!61613 res!125140) b!255745))

(assert (= (and d!61613 c!43200) b!255735))

(assert (= (and d!61613 (not c!43200)) b!255743))

(assert (= (and d!61613 res!125148) b!255740))

(assert (= (and b!255740 res!125147) b!255749))

(assert (= (and b!255740 (not res!125144)) b!255752))

(assert (= (and b!255752 res!125142) b!255753))

(assert (= (and b!255740 res!125143) b!255744))

(assert (= (and b!255744 c!43198) b!255734))

(assert (= (and b!255744 (not c!43198)) b!255751))

(assert (= (and b!255734 res!125141) b!255746))

(assert (= (or b!255734 b!255751) bm!24193))

(assert (= (and b!255744 res!125145) b!255738))

(assert (= (and b!255738 c!43197) b!255750))

(assert (= (and b!255738 (not c!43197)) b!255748))

(assert (= (and b!255750 res!125146) b!255739))

(assert (= (or b!255750 b!255748) bm!24195))

(declare-fun b_lambda!8149 () Bool)

(assert (=> (not b_lambda!8149) (not b!255753)))

(assert (=> b!255753 t!8836))

(declare-fun b_and!13761 () Bool)

(assert (= b_and!13759 (and (=> t!8836 result!5355) b_and!13761)))

(declare-fun m!271185 () Bool)

(assert (=> b!255746 m!271185))

(assert (=> b!255753 m!271121))

(assert (=> b!255753 m!271037))

(declare-fun m!271187 () Bool)

(assert (=> b!255753 m!271187))

(assert (=> b!255753 m!271187))

(assert (=> b!255753 m!271121))

(declare-fun m!271189 () Bool)

(assert (=> b!255753 m!271189))

(assert (=> b!255753 m!271037))

(declare-fun m!271191 () Bool)

(assert (=> b!255753 m!271191))

(assert (=> d!61613 m!271029))

(assert (=> b!255752 m!271037))

(assert (=> b!255752 m!271037))

(declare-fun m!271193 () Bool)

(assert (=> b!255752 m!271193))

(declare-fun m!271195 () Bool)

(assert (=> b!255735 m!271195))

(declare-fun m!271197 () Bool)

(assert (=> b!255735 m!271197))

(declare-fun m!271199 () Bool)

(assert (=> b!255735 m!271199))

(assert (=> b!255735 m!271037))

(declare-fun m!271201 () Bool)

(assert (=> b!255735 m!271201))

(declare-fun m!271203 () Bool)

(assert (=> b!255735 m!271203))

(declare-fun m!271205 () Bool)

(assert (=> b!255735 m!271205))

(declare-fun m!271207 () Bool)

(assert (=> b!255735 m!271207))

(declare-fun m!271209 () Bool)

(assert (=> b!255735 m!271209))

(assert (=> b!255735 m!271195))

(declare-fun m!271211 () Bool)

(assert (=> b!255735 m!271211))

(assert (=> b!255735 m!271197))

(declare-fun m!271213 () Bool)

(assert (=> b!255735 m!271213))

(declare-fun m!271215 () Bool)

(assert (=> b!255735 m!271215))

(declare-fun m!271217 () Bool)

(assert (=> b!255735 m!271217))

(declare-fun m!271219 () Bool)

(assert (=> b!255735 m!271219))

(declare-fun m!271221 () Bool)

(assert (=> b!255735 m!271221))

(assert (=> b!255735 m!271201))

(declare-fun m!271223 () Bool)

(assert (=> b!255735 m!271223))

(assert (=> b!255735 m!271207))

(declare-fun m!271225 () Bool)

(assert (=> b!255735 m!271225))

(declare-fun m!271227 () Bool)

(assert (=> b!255754 m!271227))

(declare-fun m!271229 () Bool)

(assert (=> bm!24193 m!271229))

(assert (=> bm!24191 m!271217))

(declare-fun m!271231 () Bool)

(assert (=> b!255739 m!271231))

(assert (=> b!255749 m!271037))

(assert (=> b!255749 m!271037))

(assert (=> b!255749 m!271087))

(assert (=> b!255745 m!271037))

(assert (=> b!255745 m!271037))

(assert (=> b!255745 m!271087))

(declare-fun m!271233 () Bool)

(assert (=> bm!24190 m!271233))

(declare-fun m!271235 () Bool)

(assert (=> bm!24195 m!271235))

(assert (=> b!255473 d!61613))

(declare-fun d!61615 () Bool)

(declare-fun res!125155 () Bool)

(declare-fun e!165781 () Bool)

(assert (=> d!61615 (=> (not res!125155) (not e!165781))))

(declare-fun simpleValid!272 (LongMapFixedSize!3780) Bool)

(assert (=> d!61615 (= res!125155 (simpleValid!272 thiss!1504))))

(assert (=> d!61615 (= (valid!1478 thiss!1504) e!165781)))

(declare-fun b!255761 () Bool)

(declare-fun res!125156 () Bool)

(assert (=> b!255761 (=> (not res!125156) (not e!165781))))

(assert (=> b!255761 (= res!125156 (= (arrayCountValidKeys!0 (_keys!6871 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6871 thiss!1504))) (_size!1939 thiss!1504)))))

(declare-fun b!255762 () Bool)

(declare-fun res!125157 () Bool)

(assert (=> b!255762 (=> (not res!125157) (not e!165781))))

(assert (=> b!255762 (= res!125157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6871 thiss!1504) (mask!10973 thiss!1504)))))

(declare-fun b!255763 () Bool)

(assert (=> b!255763 (= e!165781 (arrayNoDuplicates!0 (_keys!6871 thiss!1504) #b00000000000000000000000000000000 Nil!3780))))

(assert (= (and d!61615 res!125155) b!255761))

(assert (= (and b!255761 res!125156) b!255762))

(assert (= (and b!255762 res!125157) b!255763))

(declare-fun m!271237 () Bool)

(assert (=> d!61615 m!271237))

(assert (=> b!255761 m!270949))

(declare-fun m!271239 () Bool)

(assert (=> b!255762 m!271239))

(declare-fun m!271241 () Bool)

(assert (=> b!255763 m!271241))

(assert (=> start!24380 d!61615))

(declare-fun d!61617 () Bool)

(assert (=> d!61617 (= (array_inv!3907 (_keys!6871 thiss!1504)) (bvsge (size!6256 (_keys!6871 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255467 d!61617))

(declare-fun d!61619 () Bool)

(assert (=> d!61619 (= (array_inv!3908 (_values!4696 thiss!1504)) (bvsge (size!6255 (_values!4696 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255467 d!61619))

(declare-fun b!255770 () Bool)

(declare-fun e!165787 () Bool)

(assert (=> b!255770 (= e!165787 tp_is_empty!6567)))

(declare-fun condMapEmpty!11178 () Bool)

(declare-fun mapDefault!11178 () ValueCell!2940)

(assert (=> mapNonEmpty!11172 (= condMapEmpty!11178 (= mapRest!11172 ((as const (Array (_ BitVec 32) ValueCell!2940)) mapDefault!11178)))))

(declare-fun e!165786 () Bool)

(declare-fun mapRes!11178 () Bool)

(assert (=> mapNonEmpty!11172 (= tp!23409 (and e!165786 mapRes!11178))))

(declare-fun b!255771 () Bool)

(assert (=> b!255771 (= e!165786 tp_is_empty!6567)))

(declare-fun mapIsEmpty!11178 () Bool)

(assert (=> mapIsEmpty!11178 mapRes!11178))

(declare-fun mapNonEmpty!11178 () Bool)

(declare-fun tp!23418 () Bool)

(assert (=> mapNonEmpty!11178 (= mapRes!11178 (and tp!23418 e!165787))))

(declare-fun mapValue!11178 () ValueCell!2940)

(declare-fun mapKey!11178 () (_ BitVec 32))

(declare-fun mapRest!11178 () (Array (_ BitVec 32) ValueCell!2940))

(assert (=> mapNonEmpty!11178 (= mapRest!11172 (store mapRest!11178 mapKey!11178 mapValue!11178))))

(assert (= (and mapNonEmpty!11172 condMapEmpty!11178) mapIsEmpty!11178))

(assert (= (and mapNonEmpty!11172 (not condMapEmpty!11178)) mapNonEmpty!11178))

(assert (= (and mapNonEmpty!11178 ((_ is ValueCellFull!2940) mapValue!11178)) b!255770))

(assert (= (and mapNonEmpty!11172 ((_ is ValueCellFull!2940) mapDefault!11178)) b!255771))

(declare-fun m!271243 () Bool)

(assert (=> mapNonEmpty!11178 m!271243))

(declare-fun b_lambda!8151 () Bool)

(assert (= b_lambda!8147 (or (and b!255467 b_free!6705) b_lambda!8151)))

(declare-fun b_lambda!8153 () Bool)

(assert (= b_lambda!8149 (or (and b!255467 b_free!6705) b_lambda!8153)))

(check-sat (not b!255598) (not b!255629) (not b!255719) (not b!255746) (not b!255656) (not bm!24193) (not b!255763) (not bm!24188) (not b!255752) (not b!255565) (not d!61577) (not bm!24190) (not bm!24168) (not bm!24157) (not b!255718) (not b_lambda!8153) (not b!255622) (not b!255762) (not d!61607) (not d!61585) (not mapNonEmpty!11178) (not b!255749) (not b!255714) (not d!61605) (not bm!24186) (not b!255649) (not b_next!6705) (not b_lambda!8151) (not b!255717) (not bm!24191) (not bm!24195) (not b!255638) (not d!61589) (not b!255739) (not b!255583) (not d!61611) (not b!255753) (not b!255710) (not b!255754) (not b!255637) (not bm!24183) (not d!61613) (not b!255733) b_and!13761 (not b!255650) (not b!255588) (not bm!24158) (not b!255628) (not d!61587) (not d!61599) (not b!255652) (not b!255611) (not d!61603) (not d!61595) (not d!61615) (not b!255731) (not b!255612) (not bm!24165) (not bm!24161) (not d!61583) (not b!255735) (not b!255724) (not b!255761) (not b!255700) (not b!255599) (not b!255601) (not bm!24184) (not b!255745) (not b!255704) tp_is_empty!6567 (not bm!24164) (not b!255711))
(check-sat b_and!13761 (not b_next!6705))

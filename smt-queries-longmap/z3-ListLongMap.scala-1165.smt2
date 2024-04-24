; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24660 () Bool)

(assert start!24660)

(declare-fun b!257999 () Bool)

(declare-fun b_free!6739 () Bool)

(declare-fun b_next!6739 () Bool)

(assert (=> b!257999 (= b_free!6739 (not b_next!6739))))

(declare-fun tp!23529 () Bool)

(declare-fun b_and!13827 () Bool)

(assert (=> b!257999 (= tp!23529 b_and!13827)))

(declare-fun b!257996 () Bool)

(declare-fun e!167229 () Bool)

(declare-datatypes ((V!8449 0))(
  ( (V!8450 (val!3345 Int)) )
))
(declare-datatypes ((ValueCell!2957 0))(
  ( (ValueCellFull!2957 (v!5444 V!8449)) (EmptyCell!2957) )
))
(declare-datatypes ((array!12547 0))(
  ( (array!12548 (arr!5941 (Array (_ BitVec 32) ValueCell!2957)) (size!6288 (_ BitVec 32))) )
))
(declare-datatypes ((array!12549 0))(
  ( (array!12550 (arr!5942 (Array (_ BitVec 32) (_ BitVec 64))) (size!6289 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3814 0))(
  ( (LongMapFixedSize!3815 (defaultEntry!4760 Int) (mask!11057 (_ BitVec 32)) (extraKeys!4497 (_ BitVec 32)) (zeroValue!4601 V!8449) (minValue!4601 V!8449) (_size!1956 (_ BitVec 32)) (_keys!6930 array!12549) (_values!4743 array!12547) (_vacant!1956 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3814)

(assert (=> b!257996 (= e!167229 (= (size!6288 (_values!4743 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11057 thiss!1504))))))

(declare-fun b!257997 () Bool)

(declare-fun e!167228 () Bool)

(declare-fun e!167238 () Bool)

(assert (=> b!257997 (= e!167228 e!167238)))

(declare-fun res!126182 () Bool)

(assert (=> b!257997 (=> (not res!126182) (not e!167238))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257997 (= res!126182 (inRange!0 index!297 (mask!11057 thiss!1504)))))

(declare-datatypes ((Unit!7989 0))(
  ( (Unit!7990) )
))
(declare-fun lt!129843 () Unit!7989)

(declare-fun e!167233 () Unit!7989)

(assert (=> b!257997 (= lt!129843 e!167233)))

(declare-fun c!43688 () Bool)

(declare-datatypes ((tuple2!4842 0))(
  ( (tuple2!4843 (_1!2432 (_ BitVec 64)) (_2!2432 V!8449)) )
))
(declare-datatypes ((List!3720 0))(
  ( (Nil!3717) (Cons!3716 (h!4378 tuple2!4842) (t!8775 List!3720)) )
))
(declare-datatypes ((ListLongMap!3757 0))(
  ( (ListLongMap!3758 (toList!1894 List!3720)) )
))
(declare-fun lt!129839 () ListLongMap!3757)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1854 (ListLongMap!3757 (_ BitVec 64)) Bool)

(assert (=> b!257997 (= c!43688 (contains!1854 lt!129839 key!932))))

(declare-fun getCurrentListMap!1426 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) Int) ListLongMap!3757)

(assert (=> b!257997 (= lt!129839 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun res!126174 () Bool)

(declare-fun e!167236 () Bool)

(assert (=> start!24660 (=> (not res!126174) (not e!167236))))

(declare-fun valid!1497 (LongMapFixedSize!3814) Bool)

(assert (=> start!24660 (= res!126174 (valid!1497 thiss!1504))))

(assert (=> start!24660 e!167236))

(declare-fun e!167240 () Bool)

(assert (=> start!24660 e!167240))

(assert (=> start!24660 true))

(declare-fun tp_is_empty!6601 () Bool)

(assert (=> start!24660 tp_is_empty!6601))

(declare-fun b!257998 () Bool)

(declare-fun e!167237 () Unit!7989)

(declare-fun Unit!7991 () Unit!7989)

(assert (=> b!257998 (= e!167237 Unit!7991)))

(declare-fun lt!129846 () Unit!7989)

(declare-fun lemmaArrayContainsKeyThenInListMap!249 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) (_ BitVec 32) Int) Unit!7989)

(assert (=> b!257998 (= lt!129846 (lemmaArrayContainsKeyThenInListMap!249 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(assert (=> b!257998 false))

(declare-fun bm!24501 () Bool)

(declare-datatypes ((SeekEntryResult!1141 0))(
  ( (MissingZero!1141 (index!6734 (_ BitVec 32))) (Found!1141 (index!6735 (_ BitVec 32))) (Intermediate!1141 (undefined!1953 Bool) (index!6736 (_ BitVec 32)) (x!25009 (_ BitVec 32))) (Undefined!1141) (MissingVacant!1141 (index!6737 (_ BitVec 32))) )
))
(declare-fun lt!129845 () SeekEntryResult!1141)

(declare-fun c!43691 () Bool)

(declare-fun call!24505 () Bool)

(assert (=> bm!24501 (= call!24505 (inRange!0 (ite c!43691 (index!6734 lt!129845) (index!6737 lt!129845)) (mask!11057 thiss!1504)))))

(declare-fun bm!24502 () Bool)

(declare-fun call!24504 () Bool)

(declare-fun arrayContainsKey!0 (array!12549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24502 (= call!24504 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!167231 () Bool)

(declare-fun array_inv!3911 (array!12549) Bool)

(declare-fun array_inv!3912 (array!12547) Bool)

(assert (=> b!257999 (= e!167240 (and tp!23529 tp_is_empty!6601 (array_inv!3911 (_keys!6930 thiss!1504)) (array_inv!3912 (_values!4743 thiss!1504)) e!167231))))

(declare-fun b!258000 () Bool)

(declare-fun e!167230 () Bool)

(get-info :version)

(assert (=> b!258000 (= e!167230 ((_ is Undefined!1141) lt!129845))))

(declare-fun b!258001 () Bool)

(assert (=> b!258001 (= e!167238 (not e!167229))))

(declare-fun res!126178 () Bool)

(assert (=> b!258001 (=> res!126178 e!167229)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!258001 (= res!126178 (not (validMask!0 (mask!11057 thiss!1504))))))

(declare-fun lt!129838 () array!12549)

(declare-fun arrayCountValidKeys!0 (array!12549 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258001 (= (arrayCountValidKeys!0 lt!129838 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129837 () Unit!7989)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12549 (_ BitVec 32)) Unit!7989)

(assert (=> b!258001 (= lt!129837 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129838 index!297))))

(assert (=> b!258001 (arrayContainsKey!0 lt!129838 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129840 () Unit!7989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12549 (_ BitVec 64) (_ BitVec 32)) Unit!7989)

(assert (=> b!258001 (= lt!129840 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129838 key!932 index!297))))

(declare-fun v!346 () V!8449)

(declare-fun +!691 (ListLongMap!3757 tuple2!4842) ListLongMap!3757)

(assert (=> b!258001 (= (+!691 lt!129839 (tuple2!4843 key!932 v!346)) (getCurrentListMap!1426 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129847 () Unit!7989)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!106 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) (_ BitVec 64) V!8449 Int) Unit!7989)

(assert (=> b!258001 (= lt!129847 (lemmaAddValidKeyToArrayThenAddPairToListMap!106 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12549 (_ BitVec 32)) Bool)

(assert (=> b!258001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129838 (mask!11057 thiss!1504))))

(declare-fun lt!129836 () Unit!7989)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12549 (_ BitVec 32) (_ BitVec 32)) Unit!7989)

(assert (=> b!258001 (= lt!129836 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) index!297 (mask!11057 thiss!1504)))))

(assert (=> b!258001 (= (arrayCountValidKeys!0 lt!129838 #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504)))))))

(declare-fun lt!129841 () Unit!7989)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12549 (_ BitVec 32) (_ BitVec 64)) Unit!7989)

(assert (=> b!258001 (= lt!129841 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6930 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3721 0))(
  ( (Nil!3718) (Cons!3717 (h!4379 (_ BitVec 64)) (t!8776 List!3721)) )
))
(declare-fun arrayNoDuplicates!0 (array!12549 (_ BitVec 32) List!3721) Bool)

(assert (=> b!258001 (arrayNoDuplicates!0 lt!129838 #b00000000000000000000000000000000 Nil!3718)))

(assert (=> b!258001 (= lt!129838 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun lt!129844 () Unit!7989)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3721) Unit!7989)

(assert (=> b!258001 (= lt!129844 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6930 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3718))))

(declare-fun lt!129835 () Unit!7989)

(assert (=> b!258001 (= lt!129835 e!167237)))

(declare-fun c!43690 () Bool)

(assert (=> b!258001 (= c!43690 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258002 () Bool)

(declare-fun e!167239 () Bool)

(declare-fun mapRes!11241 () Bool)

(assert (=> b!258002 (= e!167231 (and e!167239 mapRes!11241))))

(declare-fun condMapEmpty!11241 () Bool)

(declare-fun mapDefault!11241 () ValueCell!2957)

(assert (=> b!258002 (= condMapEmpty!11241 (= (arr!5941 (_values!4743 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2957)) mapDefault!11241)))))

(declare-fun b!258003 () Bool)

(declare-fun res!126175 () Bool)

(assert (=> b!258003 (=> (not res!126175) (not e!167236))))

(assert (=> b!258003 (= res!126175 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258004 () Bool)

(declare-fun e!167242 () Bool)

(assert (=> b!258004 (= e!167242 (not call!24504))))

(declare-fun b!258005 () Bool)

(declare-fun c!43689 () Bool)

(assert (=> b!258005 (= c!43689 ((_ is MissingVacant!1141) lt!129845))))

(declare-fun e!167234 () Bool)

(assert (=> b!258005 (= e!167234 e!167230)))

(declare-fun b!258006 () Bool)

(declare-fun e!167241 () Bool)

(assert (=> b!258006 (= e!167241 tp_is_empty!6601)))

(declare-fun b!258007 () Bool)

(declare-fun res!126181 () Bool)

(assert (=> b!258007 (= res!126181 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6737 lt!129845)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258007 (=> (not res!126181) (not e!167242))))

(declare-fun mapIsEmpty!11241 () Bool)

(assert (=> mapIsEmpty!11241 mapRes!11241))

(declare-fun b!258008 () Bool)

(declare-fun Unit!7992 () Unit!7989)

(assert (=> b!258008 (= e!167237 Unit!7992)))

(declare-fun mapNonEmpty!11241 () Bool)

(declare-fun tp!23528 () Bool)

(assert (=> mapNonEmpty!11241 (= mapRes!11241 (and tp!23528 e!167241))))

(declare-fun mapValue!11241 () ValueCell!2957)

(declare-fun mapKey!11241 () (_ BitVec 32))

(declare-fun mapRest!11241 () (Array (_ BitVec 32) ValueCell!2957))

(assert (=> mapNonEmpty!11241 (= (arr!5941 (_values!4743 thiss!1504)) (store mapRest!11241 mapKey!11241 mapValue!11241))))

(declare-fun b!258009 () Bool)

(declare-fun lt!129842 () Unit!7989)

(assert (=> b!258009 (= e!167233 lt!129842)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!424 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7989)

(assert (=> b!258009 (= lt!129842 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!424 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(assert (=> b!258009 (= c!43691 ((_ is MissingZero!1141) lt!129845))))

(assert (=> b!258009 e!167234))

(declare-fun b!258010 () Bool)

(assert (=> b!258010 (= e!167236 e!167228)))

(declare-fun res!126180 () Bool)

(assert (=> b!258010 (=> (not res!126180) (not e!167228))))

(assert (=> b!258010 (= res!126180 (or (= lt!129845 (MissingZero!1141 index!297)) (= lt!129845 (MissingVacant!1141 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12549 (_ BitVec 32)) SeekEntryResult!1141)

(assert (=> b!258010 (= lt!129845 (seekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun b!258011 () Bool)

(assert (=> b!258011 (= e!167230 e!167242)))

(declare-fun res!126177 () Bool)

(assert (=> b!258011 (= res!126177 call!24505)))

(assert (=> b!258011 (=> (not res!126177) (not e!167242))))

(declare-fun b!258012 () Bool)

(declare-fun e!167232 () Bool)

(assert (=> b!258012 (= e!167232 (not call!24504))))

(declare-fun b!258013 () Bool)

(declare-fun Unit!7993 () Unit!7989)

(assert (=> b!258013 (= e!167233 Unit!7993)))

(declare-fun lt!129834 () Unit!7989)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7989)

(assert (=> b!258013 (= lt!129834 (lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(assert (=> b!258013 false))

(declare-fun b!258014 () Bool)

(assert (=> b!258014 (= e!167239 tp_is_empty!6601)))

(declare-fun b!258015 () Bool)

(declare-fun res!126179 () Bool)

(assert (=> b!258015 (=> (not res!126179) (not e!167232))))

(assert (=> b!258015 (= res!126179 call!24505)))

(assert (=> b!258015 (= e!167234 e!167232)))

(declare-fun b!258016 () Bool)

(declare-fun res!126176 () Bool)

(assert (=> b!258016 (=> (not res!126176) (not e!167232))))

(assert (=> b!258016 (= res!126176 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6734 lt!129845)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!24660 res!126174) b!258003))

(assert (= (and b!258003 res!126175) b!258010))

(assert (= (and b!258010 res!126180) b!257997))

(assert (= (and b!257997 c!43688) b!258013))

(assert (= (and b!257997 (not c!43688)) b!258009))

(assert (= (and b!258009 c!43691) b!258015))

(assert (= (and b!258009 (not c!43691)) b!258005))

(assert (= (and b!258015 res!126179) b!258016))

(assert (= (and b!258016 res!126176) b!258012))

(assert (= (and b!258005 c!43689) b!258011))

(assert (= (and b!258005 (not c!43689)) b!258000))

(assert (= (and b!258011 res!126177) b!258007))

(assert (= (and b!258007 res!126181) b!258004))

(assert (= (or b!258015 b!258011) bm!24501))

(assert (= (or b!258012 b!258004) bm!24502))

(assert (= (and b!257997 res!126182) b!258001))

(assert (= (and b!258001 c!43690) b!257998))

(assert (= (and b!258001 (not c!43690)) b!258008))

(assert (= (and b!258001 (not res!126178)) b!257996))

(assert (= (and b!258002 condMapEmpty!11241) mapIsEmpty!11241))

(assert (= (and b!258002 (not condMapEmpty!11241)) mapNonEmpty!11241))

(assert (= (and mapNonEmpty!11241 ((_ is ValueCellFull!2957) mapValue!11241)) b!258006))

(assert (= (and b!258002 ((_ is ValueCellFull!2957) mapDefault!11241)) b!258014))

(assert (= b!257999 b!258002))

(assert (= start!24660 b!257999))

(declare-fun m!273437 () Bool)

(assert (=> b!258010 m!273437))

(declare-fun m!273439 () Bool)

(assert (=> bm!24501 m!273439))

(declare-fun m!273441 () Bool)

(assert (=> start!24660 m!273441))

(declare-fun m!273443 () Bool)

(assert (=> b!257997 m!273443))

(declare-fun m!273445 () Bool)

(assert (=> b!257997 m!273445))

(declare-fun m!273447 () Bool)

(assert (=> b!257997 m!273447))

(declare-fun m!273449 () Bool)

(assert (=> b!257998 m!273449))

(declare-fun m!273451 () Bool)

(assert (=> b!258013 m!273451))

(declare-fun m!273453 () Bool)

(assert (=> b!258007 m!273453))

(declare-fun m!273455 () Bool)

(assert (=> b!257999 m!273455))

(declare-fun m!273457 () Bool)

(assert (=> b!257999 m!273457))

(declare-fun m!273459 () Bool)

(assert (=> b!258001 m!273459))

(declare-fun m!273461 () Bool)

(assert (=> b!258001 m!273461))

(declare-fun m!273463 () Bool)

(assert (=> b!258001 m!273463))

(declare-fun m!273465 () Bool)

(assert (=> b!258001 m!273465))

(declare-fun m!273467 () Bool)

(assert (=> b!258001 m!273467))

(declare-fun m!273469 () Bool)

(assert (=> b!258001 m!273469))

(declare-fun m!273471 () Bool)

(assert (=> b!258001 m!273471))

(declare-fun m!273473 () Bool)

(assert (=> b!258001 m!273473))

(declare-fun m!273475 () Bool)

(assert (=> b!258001 m!273475))

(declare-fun m!273477 () Bool)

(assert (=> b!258001 m!273477))

(declare-fun m!273479 () Bool)

(assert (=> b!258001 m!273479))

(declare-fun m!273481 () Bool)

(assert (=> b!258001 m!273481))

(declare-fun m!273483 () Bool)

(assert (=> b!258001 m!273483))

(declare-fun m!273485 () Bool)

(assert (=> b!258001 m!273485))

(declare-fun m!273487 () Bool)

(assert (=> b!258001 m!273487))

(declare-fun m!273489 () Bool)

(assert (=> b!258001 m!273489))

(declare-fun m!273491 () Bool)

(assert (=> b!258001 m!273491))

(declare-fun m!273493 () Bool)

(assert (=> b!258001 m!273493))

(declare-fun m!273495 () Bool)

(assert (=> b!258016 m!273495))

(assert (=> bm!24502 m!273461))

(declare-fun m!273497 () Bool)

(assert (=> mapNonEmpty!11241 m!273497))

(declare-fun m!273499 () Bool)

(assert (=> b!258009 m!273499))

(check-sat (not b!257999) b_and!13827 (not b!257998) tp_is_empty!6601 (not start!24660) (not b!258009) (not bm!24501) (not b!257997) (not b!258013) (not b!258010) (not b!258001) (not mapNonEmpty!11241) (not bm!24502) (not b_next!6739))
(check-sat b_and!13827 (not b_next!6739))
(get-model)

(declare-fun b!258153 () Bool)

(declare-fun e!167343 () Bool)

(declare-fun call!24520 () Bool)

(assert (=> b!258153 (= e!167343 call!24520)))

(declare-fun bm!24517 () Bool)

(declare-fun c!43718 () Bool)

(assert (=> bm!24517 (= call!24520 (arrayNoDuplicates!0 lt!129838 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43718 (Cons!3717 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) Nil!3718) Nil!3718)))))

(declare-fun b!258154 () Bool)

(assert (=> b!258154 (= e!167343 call!24520)))

(declare-fun b!258155 () Bool)

(declare-fun e!167341 () Bool)

(assert (=> b!258155 (= e!167341 e!167343)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!258155 (= c!43718 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258156 () Bool)

(declare-fun e!167344 () Bool)

(assert (=> b!258156 (= e!167344 e!167341)))

(declare-fun res!126244 () Bool)

(assert (=> b!258156 (=> (not res!126244) (not e!167341))))

(declare-fun e!167342 () Bool)

(assert (=> b!258156 (= res!126244 (not e!167342))))

(declare-fun res!126243 () Bool)

(assert (=> b!258156 (=> (not res!126243) (not e!167342))))

(assert (=> b!258156 (= res!126243 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258157 () Bool)

(declare-fun contains!1856 (List!3721 (_ BitVec 64)) Bool)

(assert (=> b!258157 (= e!167342 (contains!1856 Nil!3718 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun d!61953 () Bool)

(declare-fun res!126245 () Bool)

(assert (=> d!61953 (=> res!126245 e!167344)))

(assert (=> d!61953 (= res!126245 (bvsge #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(assert (=> d!61953 (= (arrayNoDuplicates!0 lt!129838 #b00000000000000000000000000000000 Nil!3718) e!167344)))

(assert (= (and d!61953 (not res!126245)) b!258156))

(assert (= (and b!258156 res!126243) b!258157))

(assert (= (and b!258156 res!126244) b!258155))

(assert (= (and b!258155 c!43718) b!258154))

(assert (= (and b!258155 (not c!43718)) b!258153))

(assert (= (or b!258154 b!258153) bm!24517))

(declare-fun m!273629 () Bool)

(assert (=> bm!24517 m!273629))

(declare-fun m!273631 () Bool)

(assert (=> bm!24517 m!273631))

(assert (=> b!258155 m!273629))

(assert (=> b!258155 m!273629))

(declare-fun m!273633 () Bool)

(assert (=> b!258155 m!273633))

(assert (=> b!258156 m!273629))

(assert (=> b!258156 m!273629))

(assert (=> b!258156 m!273633))

(assert (=> b!258157 m!273629))

(assert (=> b!258157 m!273629))

(declare-fun m!273635 () Bool)

(assert (=> b!258157 m!273635))

(assert (=> b!258001 d!61953))

(declare-fun d!61955 () Bool)

(declare-fun e!167347 () Bool)

(assert (=> d!61955 e!167347))

(declare-fun res!126248 () Bool)

(assert (=> d!61955 (=> (not res!126248) (not e!167347))))

(assert (=> d!61955 (= res!126248 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6289 (_keys!6930 thiss!1504))) (bvslt index!297 (size!6288 (_values!4743 thiss!1504)))))))

(declare-fun lt!129934 () Unit!7989)

(declare-fun choose!1251 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) (_ BitVec 64) V!8449 Int) Unit!7989)

(assert (=> d!61955 (= lt!129934 (choose!1251 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61955 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61955 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!106 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)) lt!129934)))

(declare-fun b!258160 () Bool)

(assert (=> b!258160 (= e!167347 (= (+!691 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) (tuple2!4843 key!932 v!346)) (getCurrentListMap!1426 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))))))

(assert (= (and d!61955 res!126248) b!258160))

(declare-fun m!273637 () Bool)

(assert (=> d!61955 m!273637))

(assert (=> d!61955 m!273459))

(declare-fun m!273639 () Bool)

(assert (=> b!258160 m!273639))

(assert (=> b!258160 m!273447))

(declare-fun m!273641 () Bool)

(assert (=> b!258160 m!273641))

(assert (=> b!258160 m!273447))

(assert (=> b!258160 m!273479))

(assert (=> b!258160 m!273465))

(assert (=> b!258001 d!61955))

(declare-fun b!258169 () Bool)

(declare-fun e!167354 () Bool)

(declare-fun call!24523 () Bool)

(assert (=> b!258169 (= e!167354 call!24523)))

(declare-fun bm!24520 () Bool)

(assert (=> bm!24520 (= call!24523 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129838 (mask!11057 thiss!1504)))))

(declare-fun d!61957 () Bool)

(declare-fun res!126253 () Bool)

(declare-fun e!167356 () Bool)

(assert (=> d!61957 (=> res!126253 e!167356)))

(assert (=> d!61957 (= res!126253 (bvsge #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(assert (=> d!61957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129838 (mask!11057 thiss!1504)) e!167356)))

(declare-fun b!258170 () Bool)

(declare-fun e!167355 () Bool)

(assert (=> b!258170 (= e!167354 e!167355)))

(declare-fun lt!129941 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129941 (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))

(declare-fun lt!129942 () Unit!7989)

(assert (=> b!258170 (= lt!129942 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129838 lt!129941 #b00000000000000000000000000000000))))

(assert (=> b!258170 (arrayContainsKey!0 lt!129838 lt!129941 #b00000000000000000000000000000000)))

(declare-fun lt!129943 () Unit!7989)

(assert (=> b!258170 (= lt!129943 lt!129942)))

(declare-fun res!126254 () Bool)

(assert (=> b!258170 (= res!126254 (= (seekEntryOrOpen!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) lt!129838 (mask!11057 thiss!1504)) (Found!1141 #b00000000000000000000000000000000)))))

(assert (=> b!258170 (=> (not res!126254) (not e!167355))))

(declare-fun b!258171 () Bool)

(assert (=> b!258171 (= e!167356 e!167354)))

(declare-fun c!43721 () Bool)

(assert (=> b!258171 (= c!43721 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258172 () Bool)

(assert (=> b!258172 (= e!167355 call!24523)))

(assert (= (and d!61957 (not res!126253)) b!258171))

(assert (= (and b!258171 c!43721) b!258170))

(assert (= (and b!258171 (not c!43721)) b!258169))

(assert (= (and b!258170 res!126254) b!258172))

(assert (= (or b!258172 b!258169) bm!24520))

(declare-fun m!273643 () Bool)

(assert (=> bm!24520 m!273643))

(assert (=> b!258170 m!273629))

(declare-fun m!273645 () Bool)

(assert (=> b!258170 m!273645))

(declare-fun m!273647 () Bool)

(assert (=> b!258170 m!273647))

(assert (=> b!258170 m!273629))

(declare-fun m!273649 () Bool)

(assert (=> b!258170 m!273649))

(assert (=> b!258171 m!273629))

(assert (=> b!258171 m!273629))

(assert (=> b!258171 m!273633))

(assert (=> b!258001 d!61957))

(declare-fun d!61959 () Bool)

(declare-fun e!167359 () Bool)

(assert (=> d!61959 e!167359))

(declare-fun res!126259 () Bool)

(assert (=> d!61959 (=> (not res!126259) (not e!167359))))

(declare-fun lt!129953 () ListLongMap!3757)

(assert (=> d!61959 (= res!126259 (contains!1854 lt!129953 (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun lt!129955 () List!3720)

(assert (=> d!61959 (= lt!129953 (ListLongMap!3758 lt!129955))))

(declare-fun lt!129954 () Unit!7989)

(declare-fun lt!129952 () Unit!7989)

(assert (=> d!61959 (= lt!129954 lt!129952)))

(declare-datatypes ((Option!320 0))(
  ( (Some!319 (v!5449 V!8449)) (None!318) )
))
(declare-fun getValueByKey!314 (List!3720 (_ BitVec 64)) Option!320)

(assert (=> d!61959 (= (getValueByKey!314 lt!129955 (_1!2432 (tuple2!4843 key!932 v!346))) (Some!319 (_2!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!170 (List!3720 (_ BitVec 64) V!8449) Unit!7989)

(assert (=> d!61959 (= lt!129952 (lemmaContainsTupThenGetReturnValue!170 lt!129955 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun insertStrictlySorted!173 (List!3720 (_ BitVec 64) V!8449) List!3720)

(assert (=> d!61959 (= lt!129955 (insertStrictlySorted!173 (toList!1894 lt!129839) (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(assert (=> d!61959 (= (+!691 lt!129839 (tuple2!4843 key!932 v!346)) lt!129953)))

(declare-fun b!258177 () Bool)

(declare-fun res!126260 () Bool)

(assert (=> b!258177 (=> (not res!126260) (not e!167359))))

(assert (=> b!258177 (= res!126260 (= (getValueByKey!314 (toList!1894 lt!129953) (_1!2432 (tuple2!4843 key!932 v!346))) (Some!319 (_2!2432 (tuple2!4843 key!932 v!346)))))))

(declare-fun b!258178 () Bool)

(declare-fun contains!1857 (List!3720 tuple2!4842) Bool)

(assert (=> b!258178 (= e!167359 (contains!1857 (toList!1894 lt!129953) (tuple2!4843 key!932 v!346)))))

(assert (= (and d!61959 res!126259) b!258177))

(assert (= (and b!258177 res!126260) b!258178))

(declare-fun m!273651 () Bool)

(assert (=> d!61959 m!273651))

(declare-fun m!273653 () Bool)

(assert (=> d!61959 m!273653))

(declare-fun m!273655 () Bool)

(assert (=> d!61959 m!273655))

(declare-fun m!273657 () Bool)

(assert (=> d!61959 m!273657))

(declare-fun m!273659 () Bool)

(assert (=> b!258177 m!273659))

(declare-fun m!273661 () Bool)

(assert (=> b!258178 m!273661))

(assert (=> b!258001 d!61959))

(declare-fun d!61961 () Bool)

(declare-fun res!126265 () Bool)

(declare-fun e!167364 () Bool)

(assert (=> d!61961 (=> res!126265 e!167364)))

(assert (=> d!61961 (= res!126265 (= (select (arr!5942 lt!129838) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61961 (= (arrayContainsKey!0 lt!129838 key!932 #b00000000000000000000000000000000) e!167364)))

(declare-fun b!258183 () Bool)

(declare-fun e!167365 () Bool)

(assert (=> b!258183 (= e!167364 e!167365)))

(declare-fun res!126266 () Bool)

(assert (=> b!258183 (=> (not res!126266) (not e!167365))))

(assert (=> b!258183 (= res!126266 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 lt!129838)))))

(declare-fun b!258184 () Bool)

(assert (=> b!258184 (= e!167365 (arrayContainsKey!0 lt!129838 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61961 (not res!126265)) b!258183))

(assert (= (and b!258183 res!126266) b!258184))

(assert (=> d!61961 m!273629))

(declare-fun m!273663 () Bool)

(assert (=> b!258184 m!273663))

(assert (=> b!258001 d!61961))

(declare-fun d!61963 () Bool)

(declare-fun lt!129958 () (_ BitVec 32))

(assert (=> d!61963 (and (bvsge lt!129958 #b00000000000000000000000000000000) (bvsle lt!129958 (bvsub (size!6289 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun e!167371 () (_ BitVec 32))

(assert (=> d!61963 (= lt!129958 e!167371)))

(declare-fun c!43727 () Bool)

(assert (=> d!61963 (= c!43727 (bvsge #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!61963 (and (bvsle #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6289 (_keys!6930 thiss!1504)) (size!6289 lt!129838)))))

(assert (=> d!61963 (= (arrayCountValidKeys!0 lt!129838 #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) lt!129958)))

(declare-fun bm!24523 () Bool)

(declare-fun call!24526 () (_ BitVec 32))

(assert (=> bm!24523 (= call!24526 (arrayCountValidKeys!0 lt!129838 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258193 () Bool)

(declare-fun e!167370 () (_ BitVec 32))

(assert (=> b!258193 (= e!167371 e!167370)))

(declare-fun c!43726 () Bool)

(assert (=> b!258193 (= c!43726 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258194 () Bool)

(assert (=> b!258194 (= e!167370 call!24526)))

(declare-fun b!258195 () Bool)

(assert (=> b!258195 (= e!167371 #b00000000000000000000000000000000)))

(declare-fun b!258196 () Bool)

(assert (=> b!258196 (= e!167370 (bvadd #b00000000000000000000000000000001 call!24526))))

(assert (= (and d!61963 c!43727) b!258195))

(assert (= (and d!61963 (not c!43727)) b!258193))

(assert (= (and b!258193 c!43726) b!258196))

(assert (= (and b!258193 (not c!43726)) b!258194))

(assert (= (or b!258196 b!258194) bm!24523))

(declare-fun m!273665 () Bool)

(assert (=> bm!24523 m!273665))

(assert (=> b!258193 m!273629))

(assert (=> b!258193 m!273629))

(assert (=> b!258193 m!273633))

(assert (=> b!258001 d!61963))

(declare-fun d!61965 () Bool)

(declare-fun e!167374 () Bool)

(assert (=> d!61965 e!167374))

(declare-fun res!126269 () Bool)

(assert (=> d!61965 (=> (not res!126269) (not e!167374))))

(assert (=> d!61965 (= res!126269 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6289 (_keys!6930 thiss!1504)))))))

(declare-fun lt!129961 () Unit!7989)

(declare-fun choose!41 (array!12549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3721) Unit!7989)

(assert (=> d!61965 (= lt!129961 (choose!41 (_keys!6930 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3718))))

(assert (=> d!61965 (bvslt (size!6289 (_keys!6930 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61965 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6930 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3718) lt!129961)))

(declare-fun b!258199 () Bool)

(assert (=> b!258199 (= e!167374 (arrayNoDuplicates!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000000 Nil!3718))))

(assert (= (and d!61965 res!126269) b!258199))

(declare-fun m!273667 () Bool)

(assert (=> d!61965 m!273667))

(assert (=> b!258199 m!273479))

(declare-fun m!273669 () Bool)

(assert (=> b!258199 m!273669))

(assert (=> b!258001 d!61965))

(declare-fun d!61967 () Bool)

(declare-fun lt!129962 () (_ BitVec 32))

(assert (=> d!61967 (and (bvsge lt!129962 #b00000000000000000000000000000000) (bvsle lt!129962 (bvsub (size!6289 lt!129838) index!297)))))

(declare-fun e!167376 () (_ BitVec 32))

(assert (=> d!61967 (= lt!129962 e!167376)))

(declare-fun c!43729 () Bool)

(assert (=> d!61967 (= c!43729 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61967 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6289 lt!129838)))))

(assert (=> d!61967 (= (arrayCountValidKeys!0 lt!129838 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129962)))

(declare-fun bm!24524 () Bool)

(declare-fun call!24527 () (_ BitVec 32))

(assert (=> bm!24524 (= call!24527 (arrayCountValidKeys!0 lt!129838 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!258200 () Bool)

(declare-fun e!167375 () (_ BitVec 32))

(assert (=> b!258200 (= e!167376 e!167375)))

(declare-fun c!43728 () Bool)

(assert (=> b!258200 (= c!43728 (validKeyInArray!0 (select (arr!5942 lt!129838) index!297)))))

(declare-fun b!258201 () Bool)

(assert (=> b!258201 (= e!167375 call!24527)))

(declare-fun b!258202 () Bool)

(assert (=> b!258202 (= e!167376 #b00000000000000000000000000000000)))

(declare-fun b!258203 () Bool)

(assert (=> b!258203 (= e!167375 (bvadd #b00000000000000000000000000000001 call!24527))))

(assert (= (and d!61967 c!43729) b!258202))

(assert (= (and d!61967 (not c!43729)) b!258200))

(assert (= (and b!258200 c!43728) b!258203))

(assert (= (and b!258200 (not c!43728)) b!258201))

(assert (= (or b!258203 b!258201) bm!24524))

(declare-fun m!273671 () Bool)

(assert (=> bm!24524 m!273671))

(declare-fun m!273673 () Bool)

(assert (=> b!258200 m!273673))

(assert (=> b!258200 m!273673))

(declare-fun m!273675 () Bool)

(assert (=> b!258200 m!273675))

(assert (=> b!258001 d!61967))

(declare-fun b!258213 () Bool)

(declare-fun res!126281 () Bool)

(declare-fun e!167382 () Bool)

(assert (=> b!258213 (=> (not res!126281) (not e!167382))))

(assert (=> b!258213 (= res!126281 (validKeyInArray!0 key!932))))

(declare-fun b!258212 () Bool)

(declare-fun res!126278 () Bool)

(assert (=> b!258212 (=> (not res!126278) (not e!167382))))

(assert (=> b!258212 (= res!126278 (not (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) index!297))))))

(declare-fun e!167381 () Bool)

(declare-fun b!258215 () Bool)

(assert (=> b!258215 (= e!167381 (= (arrayCountValidKeys!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!61969 () Bool)

(assert (=> d!61969 e!167381))

(declare-fun res!126280 () Bool)

(assert (=> d!61969 (=> (not res!126280) (not e!167381))))

(assert (=> d!61969 (= res!126280 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6289 (_keys!6930 thiss!1504)))))))

(declare-fun lt!129965 () Unit!7989)

(declare-fun choose!1 (array!12549 (_ BitVec 32) (_ BitVec 64)) Unit!7989)

(assert (=> d!61969 (= lt!129965 (choose!1 (_keys!6930 thiss!1504) index!297 key!932))))

(assert (=> d!61969 e!167382))

(declare-fun res!126279 () Bool)

(assert (=> d!61969 (=> (not res!126279) (not e!167382))))

(assert (=> d!61969 (= res!126279 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6289 (_keys!6930 thiss!1504)))))))

(assert (=> d!61969 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6930 thiss!1504) index!297 key!932) lt!129965)))

(declare-fun b!258214 () Bool)

(assert (=> b!258214 (= e!167382 (bvslt (size!6289 (_keys!6930 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61969 res!126279) b!258212))

(assert (= (and b!258212 res!126278) b!258213))

(assert (= (and b!258213 res!126281) b!258214))

(assert (= (and d!61969 res!126280) b!258215))

(declare-fun m!273677 () Bool)

(assert (=> b!258213 m!273677))

(declare-fun m!273679 () Bool)

(assert (=> b!258212 m!273679))

(assert (=> b!258212 m!273679))

(declare-fun m!273681 () Bool)

(assert (=> b!258212 m!273681))

(assert (=> b!258215 m!273479))

(declare-fun m!273683 () Bool)

(assert (=> b!258215 m!273683))

(assert (=> b!258215 m!273491))

(declare-fun m!273685 () Bool)

(assert (=> d!61969 m!273685))

(assert (=> b!258001 d!61969))

(declare-fun d!61971 () Bool)

(declare-fun res!126282 () Bool)

(declare-fun e!167383 () Bool)

(assert (=> d!61971 (=> res!126282 e!167383)))

(assert (=> d!61971 (= res!126282 (= (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61971 (= (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 #b00000000000000000000000000000000) e!167383)))

(declare-fun b!258216 () Bool)

(declare-fun e!167384 () Bool)

(assert (=> b!258216 (= e!167383 e!167384)))

(declare-fun res!126283 () Bool)

(assert (=> b!258216 (=> (not res!126283) (not e!167384))))

(assert (=> b!258216 (= res!126283 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258217 () Bool)

(assert (=> b!258217 (= e!167384 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61971 (not res!126282)) b!258216))

(assert (= (and b!258216 res!126283) b!258217))

(declare-fun m!273687 () Bool)

(assert (=> d!61971 m!273687))

(declare-fun m!273689 () Bool)

(assert (=> b!258217 m!273689))

(assert (=> b!258001 d!61971))

(declare-fun d!61973 () Bool)

(declare-fun e!167387 () Bool)

(assert (=> d!61973 e!167387))

(declare-fun res!126286 () Bool)

(assert (=> d!61973 (=> (not res!126286) (not e!167387))))

(assert (=> d!61973 (= res!126286 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6289 (_keys!6930 thiss!1504)))))))

(declare-fun lt!129968 () Unit!7989)

(declare-fun choose!102 ((_ BitVec 64) array!12549 (_ BitVec 32) (_ BitVec 32)) Unit!7989)

(assert (=> d!61973 (= lt!129968 (choose!102 key!932 (_keys!6930 thiss!1504) index!297 (mask!11057 thiss!1504)))))

(assert (=> d!61973 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61973 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) index!297 (mask!11057 thiss!1504)) lt!129968)))

(declare-fun b!258220 () Bool)

(assert (=> b!258220 (= e!167387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (mask!11057 thiss!1504)))))

(assert (= (and d!61973 res!126286) b!258220))

(declare-fun m!273691 () Bool)

(assert (=> d!61973 m!273691))

(assert (=> d!61973 m!273459))

(assert (=> b!258220 m!273479))

(declare-fun m!273693 () Bool)

(assert (=> b!258220 m!273693))

(assert (=> b!258001 d!61973))

(declare-fun d!61975 () Bool)

(declare-fun lt!129969 () (_ BitVec 32))

(assert (=> d!61975 (and (bvsge lt!129969 #b00000000000000000000000000000000) (bvsle lt!129969 (bvsub (size!6289 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167389 () (_ BitVec 32))

(assert (=> d!61975 (= lt!129969 e!167389)))

(declare-fun c!43731 () Bool)

(assert (=> d!61975 (= c!43731 (bvsge #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!61975 (and (bvsle #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6289 (_keys!6930 thiss!1504)) (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!61975 (= (arrayCountValidKeys!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) lt!129969)))

(declare-fun bm!24525 () Bool)

(declare-fun call!24528 () (_ BitVec 32))

(assert (=> bm!24525 (= call!24528 (arrayCountValidKeys!0 (_keys!6930 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258221 () Bool)

(declare-fun e!167388 () (_ BitVec 32))

(assert (=> b!258221 (= e!167389 e!167388)))

(declare-fun c!43730 () Bool)

(assert (=> b!258221 (= c!43730 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258222 () Bool)

(assert (=> b!258222 (= e!167388 call!24528)))

(declare-fun b!258223 () Bool)

(assert (=> b!258223 (= e!167389 #b00000000000000000000000000000000)))

(declare-fun b!258224 () Bool)

(assert (=> b!258224 (= e!167388 (bvadd #b00000000000000000000000000000001 call!24528))))

(assert (= (and d!61975 c!43731) b!258223))

(assert (= (and d!61975 (not c!43731)) b!258221))

(assert (= (and b!258221 c!43730) b!258224))

(assert (= (and b!258221 (not c!43730)) b!258222))

(assert (= (or b!258224 b!258222) bm!24525))

(declare-fun m!273695 () Bool)

(assert (=> bm!24525 m!273695))

(assert (=> b!258221 m!273687))

(assert (=> b!258221 m!273687))

(declare-fun m!273697 () Bool)

(assert (=> b!258221 m!273697))

(assert (=> b!258001 d!61975))

(declare-fun b!258267 () Bool)

(declare-fun e!167420 () Unit!7989)

(declare-fun lt!130026 () Unit!7989)

(assert (=> b!258267 (= e!167420 lt!130026)))

(declare-fun lt!130018 () ListLongMap!3757)

(declare-fun getCurrentListMapNoExtraKeys!571 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) Int) ListLongMap!3757)

(assert (=> b!258267 (= lt!130018 (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130021 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130014 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130014 (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))

(declare-fun lt!130031 () Unit!7989)

(declare-fun addStillContains!231 (ListLongMap!3757 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7989)

(assert (=> b!258267 (= lt!130031 (addStillContains!231 lt!130018 lt!130021 (zeroValue!4601 thiss!1504) lt!130014))))

(assert (=> b!258267 (contains!1854 (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))) lt!130014)))

(declare-fun lt!130017 () Unit!7989)

(assert (=> b!258267 (= lt!130017 lt!130031)))

(declare-fun lt!130032 () ListLongMap!3757)

(assert (=> b!258267 (= lt!130032 (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130022 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130034 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130034 (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))

(declare-fun lt!130028 () Unit!7989)

(declare-fun addApplyDifferent!231 (ListLongMap!3757 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7989)

(assert (=> b!258267 (= lt!130028 (addApplyDifferent!231 lt!130032 lt!130022 (minValue!4601 thiss!1504) lt!130034))))

(declare-fun apply!255 (ListLongMap!3757 (_ BitVec 64)) V!8449)

(assert (=> b!258267 (= (apply!255 (+!691 lt!130032 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))) lt!130034) (apply!255 lt!130032 lt!130034))))

(declare-fun lt!130030 () Unit!7989)

(assert (=> b!258267 (= lt!130030 lt!130028)))

(declare-fun lt!130024 () ListLongMap!3757)

(assert (=> b!258267 (= lt!130024 (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130035 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130016 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130016 (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))

(declare-fun lt!130020 () Unit!7989)

(assert (=> b!258267 (= lt!130020 (addApplyDifferent!231 lt!130024 lt!130035 (zeroValue!4601 thiss!1504) lt!130016))))

(assert (=> b!258267 (= (apply!255 (+!691 lt!130024 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))) lt!130016) (apply!255 lt!130024 lt!130016))))

(declare-fun lt!130033 () Unit!7989)

(assert (=> b!258267 (= lt!130033 lt!130020)))

(declare-fun lt!130029 () ListLongMap!3757)

(assert (=> b!258267 (= lt!130029 (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130023 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130023 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130025 () (_ BitVec 64))

(assert (=> b!258267 (= lt!130025 (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))

(assert (=> b!258267 (= lt!130026 (addApplyDifferent!231 lt!130029 lt!130023 (minValue!4601 thiss!1504) lt!130025))))

(assert (=> b!258267 (= (apply!255 (+!691 lt!130029 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))) lt!130025) (apply!255 lt!130029 lt!130025))))

(declare-fun b!258268 () Bool)

(declare-fun e!167425 () Bool)

(declare-fun lt!130019 () ListLongMap!3757)

(assert (=> b!258268 (= e!167425 (= (apply!255 lt!130019 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4601 thiss!1504)))))

(declare-fun b!258269 () Bool)

(declare-fun e!167424 () Bool)

(assert (=> b!258269 (= e!167424 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258270 () Bool)

(declare-fun e!167423 () Bool)

(declare-fun call!24543 () Bool)

(assert (=> b!258270 (= e!167423 (not call!24543))))

(declare-fun b!258271 () Bool)

(declare-fun c!43746 () Bool)

(assert (=> b!258271 (= c!43746 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167417 () ListLongMap!3757)

(declare-fun e!167426 () ListLongMap!3757)

(assert (=> b!258271 (= e!167417 e!167426)))

(declare-fun b!258272 () Bool)

(declare-fun e!167422 () Bool)

(assert (=> b!258272 (= e!167422 e!167425)))

(declare-fun res!126310 () Bool)

(declare-fun call!24547 () Bool)

(assert (=> b!258272 (= res!126310 call!24547)))

(assert (=> b!258272 (=> (not res!126310) (not e!167425))))

(declare-fun b!258273 () Bool)

(declare-fun e!167421 () Bool)

(assert (=> b!258273 (= e!167421 e!167423)))

(declare-fun c!43745 () Bool)

(assert (=> b!258273 (= c!43745 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258274 () Bool)

(declare-fun e!167427 () ListLongMap!3757)

(assert (=> b!258274 (= e!167427 e!167417)))

(declare-fun c!43749 () Bool)

(assert (=> b!258274 (= c!43749 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258275 () Bool)

(declare-fun res!126305 () Bool)

(assert (=> b!258275 (=> (not res!126305) (not e!167421))))

(declare-fun e!167416 () Bool)

(assert (=> b!258275 (= res!126305 e!167416)))

(declare-fun res!126311 () Bool)

(assert (=> b!258275 (=> res!126311 e!167416)))

(declare-fun e!167418 () Bool)

(assert (=> b!258275 (= res!126311 (not e!167418))))

(declare-fun res!126307 () Bool)

(assert (=> b!258275 (=> (not res!126307) (not e!167418))))

(assert (=> b!258275 (= res!126307 (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(declare-fun b!258276 () Bool)

(declare-fun e!167419 () Bool)

(assert (=> b!258276 (= e!167423 e!167419)))

(declare-fun res!126306 () Bool)

(assert (=> b!258276 (= res!126306 call!24543)))

(assert (=> b!258276 (=> (not res!126306) (not e!167419))))

(declare-fun b!258277 () Bool)

(declare-fun call!24544 () ListLongMap!3757)

(assert (=> b!258277 (= e!167417 call!24544)))

(declare-fun e!167428 () Bool)

(declare-fun b!258278 () Bool)

(declare-fun get!3062 (ValueCell!2957 V!8449) V!8449)

(declare-fun dynLambda!598 (Int (_ BitVec 64)) V!8449)

(assert (=> b!258278 (= e!167428 (= (apply!255 lt!130019 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)) (get!3062 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6288 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))))))))

(assert (=> b!258278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(declare-fun bm!24540 () Bool)

(declare-fun call!24549 () ListLongMap!3757)

(declare-fun call!24546 () ListLongMap!3757)

(assert (=> bm!24540 (= call!24549 call!24546)))

(declare-fun b!258279 () Bool)

(assert (=> b!258279 (= e!167416 e!167428)))

(declare-fun res!126308 () Bool)

(assert (=> b!258279 (=> (not res!126308) (not e!167428))))

(assert (=> b!258279 (= res!126308 (contains!1854 lt!130019 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(assert (=> b!258279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(declare-fun bm!24541 () Bool)

(assert (=> bm!24541 (= call!24543 (contains!1854 lt!130019 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24542 () Bool)

(declare-fun call!24548 () ListLongMap!3757)

(assert (=> bm!24542 (= call!24546 call!24548)))

(declare-fun c!43748 () Bool)

(declare-fun bm!24543 () Bool)

(declare-fun call!24545 () ListLongMap!3757)

(assert (=> bm!24543 (= call!24545 (+!691 (ite c!43748 call!24548 (ite c!43749 call!24546 call!24549)) (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun bm!24544 () Bool)

(assert (=> bm!24544 (= call!24548 (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun b!258280 () Bool)

(assert (=> b!258280 (= e!167419 (= (apply!255 lt!130019 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4601 thiss!1504)))))

(declare-fun d!61977 () Bool)

(assert (=> d!61977 e!167421))

(declare-fun res!126312 () Bool)

(assert (=> d!61977 (=> (not res!126312) (not e!167421))))

(assert (=> d!61977 (= res!126312 (or (bvsge #b00000000000000000000000000000000 (size!6289 lt!129838)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))))

(declare-fun lt!130015 () ListLongMap!3757)

(assert (=> d!61977 (= lt!130019 lt!130015)))

(declare-fun lt!130027 () Unit!7989)

(assert (=> d!61977 (= lt!130027 e!167420)))

(declare-fun c!43744 () Bool)

(assert (=> d!61977 (= c!43744 e!167424)))

(declare-fun res!126313 () Bool)

(assert (=> d!61977 (=> (not res!126313) (not e!167424))))

(assert (=> d!61977 (= res!126313 (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(assert (=> d!61977 (= lt!130015 e!167427)))

(assert (=> d!61977 (= c!43748 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61977 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61977 (= (getCurrentListMap!1426 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!130019)))

(declare-fun b!258281 () Bool)

(assert (=> b!258281 (= e!167427 (+!691 call!24545 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(declare-fun b!258282 () Bool)

(assert (=> b!258282 (= e!167418 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258283 () Bool)

(assert (=> b!258283 (= e!167422 (not call!24547))))

(declare-fun b!258284 () Bool)

(declare-fun res!126309 () Bool)

(assert (=> b!258284 (=> (not res!126309) (not e!167421))))

(assert (=> b!258284 (= res!126309 e!167422)))

(declare-fun c!43747 () Bool)

(assert (=> b!258284 (= c!43747 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24545 () Bool)

(assert (=> bm!24545 (= call!24547 (contains!1854 lt!130019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258285 () Bool)

(assert (=> b!258285 (= e!167426 call!24549)))

(declare-fun bm!24546 () Bool)

(assert (=> bm!24546 (= call!24544 call!24545)))

(declare-fun b!258286 () Bool)

(declare-fun Unit!8003 () Unit!7989)

(assert (=> b!258286 (= e!167420 Unit!8003)))

(declare-fun b!258287 () Bool)

(assert (=> b!258287 (= e!167426 call!24544)))

(assert (= (and d!61977 c!43748) b!258281))

(assert (= (and d!61977 (not c!43748)) b!258274))

(assert (= (and b!258274 c!43749) b!258277))

(assert (= (and b!258274 (not c!43749)) b!258271))

(assert (= (and b!258271 c!43746) b!258287))

(assert (= (and b!258271 (not c!43746)) b!258285))

(assert (= (or b!258287 b!258285) bm!24540))

(assert (= (or b!258277 bm!24540) bm!24542))

(assert (= (or b!258277 b!258287) bm!24546))

(assert (= (or b!258281 bm!24542) bm!24544))

(assert (= (or b!258281 bm!24546) bm!24543))

(assert (= (and d!61977 res!126313) b!258269))

(assert (= (and d!61977 c!43744) b!258267))

(assert (= (and d!61977 (not c!43744)) b!258286))

(assert (= (and d!61977 res!126312) b!258275))

(assert (= (and b!258275 res!126307) b!258282))

(assert (= (and b!258275 (not res!126311)) b!258279))

(assert (= (and b!258279 res!126308) b!258278))

(assert (= (and b!258275 res!126305) b!258284))

(assert (= (and b!258284 c!43747) b!258272))

(assert (= (and b!258284 (not c!43747)) b!258283))

(assert (= (and b!258272 res!126310) b!258268))

(assert (= (or b!258272 b!258283) bm!24545))

(assert (= (and b!258284 res!126309) b!258273))

(assert (= (and b!258273 c!43745) b!258276))

(assert (= (and b!258273 (not c!43745)) b!258270))

(assert (= (and b!258276 res!126306) b!258280))

(assert (= (or b!258276 b!258270) bm!24541))

(declare-fun b_lambda!8217 () Bool)

(assert (=> (not b_lambda!8217) (not b!258278)))

(declare-fun t!8782 () Bool)

(declare-fun tb!3015 () Bool)

(assert (=> (and b!257999 (= (defaultEntry!4760 thiss!1504) (defaultEntry!4760 thiss!1504)) t!8782) tb!3015))

(declare-fun result!5383 () Bool)

(assert (=> tb!3015 (= result!5383 tp_is_empty!6601)))

(assert (=> b!258278 t!8782))

(declare-fun b_and!13833 () Bool)

(assert (= b_and!13827 (and (=> t!8782 result!5383) b_and!13833)))

(assert (=> b!258267 m!273629))

(declare-fun m!273699 () Bool)

(assert (=> b!258267 m!273699))

(declare-fun m!273701 () Bool)

(assert (=> b!258267 m!273701))

(declare-fun m!273703 () Bool)

(assert (=> b!258267 m!273703))

(declare-fun m!273705 () Bool)

(assert (=> b!258267 m!273705))

(declare-fun m!273707 () Bool)

(assert (=> b!258267 m!273707))

(declare-fun m!273709 () Bool)

(assert (=> b!258267 m!273709))

(declare-fun m!273711 () Bool)

(assert (=> b!258267 m!273711))

(declare-fun m!273713 () Bool)

(assert (=> b!258267 m!273713))

(declare-fun m!273715 () Bool)

(assert (=> b!258267 m!273715))

(declare-fun m!273717 () Bool)

(assert (=> b!258267 m!273717))

(assert (=> b!258267 m!273705))

(assert (=> b!258267 m!273713))

(assert (=> b!258267 m!273699))

(declare-fun m!273719 () Bool)

(assert (=> b!258267 m!273719))

(assert (=> b!258267 m!273711))

(declare-fun m!273721 () Bool)

(assert (=> b!258267 m!273721))

(declare-fun m!273723 () Bool)

(assert (=> b!258267 m!273723))

(declare-fun m!273725 () Bool)

(assert (=> b!258267 m!273725))

(declare-fun m!273727 () Bool)

(assert (=> b!258267 m!273727))

(declare-fun m!273729 () Bool)

(assert (=> b!258267 m!273729))

(declare-fun m!273731 () Bool)

(assert (=> bm!24541 m!273731))

(assert (=> b!258269 m!273629))

(assert (=> b!258269 m!273629))

(assert (=> b!258269 m!273633))

(declare-fun m!273733 () Bool)

(assert (=> b!258280 m!273733))

(declare-fun m!273735 () Bool)

(assert (=> b!258268 m!273735))

(assert (=> b!258282 m!273629))

(assert (=> b!258282 m!273629))

(assert (=> b!258282 m!273633))

(assert (=> b!258279 m!273629))

(assert (=> b!258279 m!273629))

(declare-fun m!273737 () Bool)

(assert (=> b!258279 m!273737))

(declare-fun m!273739 () Bool)

(assert (=> b!258281 m!273739))

(assert (=> bm!24544 m!273729))

(declare-fun m!273741 () Bool)

(assert (=> b!258278 m!273741))

(declare-fun m!273743 () Bool)

(assert (=> b!258278 m!273743))

(declare-fun m!273745 () Bool)

(assert (=> b!258278 m!273745))

(assert (=> b!258278 m!273629))

(assert (=> b!258278 m!273743))

(assert (=> b!258278 m!273741))

(assert (=> b!258278 m!273629))

(declare-fun m!273747 () Bool)

(assert (=> b!258278 m!273747))

(declare-fun m!273749 () Bool)

(assert (=> bm!24543 m!273749))

(declare-fun m!273751 () Bool)

(assert (=> bm!24545 m!273751))

(assert (=> d!61977 m!273459))

(assert (=> b!258001 d!61977))

(declare-fun d!61979 () Bool)

(assert (=> d!61979 (arrayContainsKey!0 lt!129838 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130038 () Unit!7989)

(declare-fun choose!13 (array!12549 (_ BitVec 64) (_ BitVec 32)) Unit!7989)

(assert (=> d!61979 (= lt!130038 (choose!13 lt!129838 key!932 index!297))))

(assert (=> d!61979 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61979 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129838 key!932 index!297) lt!130038)))

(declare-fun bs!9109 () Bool)

(assert (= bs!9109 d!61979))

(assert (=> bs!9109 m!273487))

(declare-fun m!273753 () Bool)

(assert (=> bs!9109 m!273753))

(assert (=> b!258001 d!61979))

(declare-fun d!61981 () Bool)

(assert (=> d!61981 (= (validMask!0 (mask!11057 thiss!1504)) (and (or (= (mask!11057 thiss!1504) #b00000000000000000000000000000111) (= (mask!11057 thiss!1504) #b00000000000000000000000000001111) (= (mask!11057 thiss!1504) #b00000000000000000000000000011111) (= (mask!11057 thiss!1504) #b00000000000000000000000000111111) (= (mask!11057 thiss!1504) #b00000000000000000000000001111111) (= (mask!11057 thiss!1504) #b00000000000000000000000011111111) (= (mask!11057 thiss!1504) #b00000000000000000000000111111111) (= (mask!11057 thiss!1504) #b00000000000000000000001111111111) (= (mask!11057 thiss!1504) #b00000000000000000000011111111111) (= (mask!11057 thiss!1504) #b00000000000000000000111111111111) (= (mask!11057 thiss!1504) #b00000000000000000001111111111111) (= (mask!11057 thiss!1504) #b00000000000000000011111111111111) (= (mask!11057 thiss!1504) #b00000000000000000111111111111111) (= (mask!11057 thiss!1504) #b00000000000000001111111111111111) (= (mask!11057 thiss!1504) #b00000000000000011111111111111111) (= (mask!11057 thiss!1504) #b00000000000000111111111111111111) (= (mask!11057 thiss!1504) #b00000000000001111111111111111111) (= (mask!11057 thiss!1504) #b00000000000011111111111111111111) (= (mask!11057 thiss!1504) #b00000000000111111111111111111111) (= (mask!11057 thiss!1504) #b00000000001111111111111111111111) (= (mask!11057 thiss!1504) #b00000000011111111111111111111111) (= (mask!11057 thiss!1504) #b00000000111111111111111111111111) (= (mask!11057 thiss!1504) #b00000001111111111111111111111111) (= (mask!11057 thiss!1504) #b00000011111111111111111111111111) (= (mask!11057 thiss!1504) #b00000111111111111111111111111111) (= (mask!11057 thiss!1504) #b00001111111111111111111111111111) (= (mask!11057 thiss!1504) #b00011111111111111111111111111111) (= (mask!11057 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11057 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!258001 d!61981))

(declare-fun d!61983 () Bool)

(assert (=> d!61983 (= (arrayCountValidKeys!0 lt!129838 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!130041 () Unit!7989)

(declare-fun choose!2 (array!12549 (_ BitVec 32)) Unit!7989)

(assert (=> d!61983 (= lt!130041 (choose!2 lt!129838 index!297))))

(declare-fun e!167431 () Bool)

(assert (=> d!61983 e!167431))

(declare-fun res!126318 () Bool)

(assert (=> d!61983 (=> (not res!126318) (not e!167431))))

(assert (=> d!61983 (= res!126318 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6289 lt!129838))))))

(assert (=> d!61983 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129838 index!297) lt!130041)))

(declare-fun b!258294 () Bool)

(declare-fun res!126319 () Bool)

(assert (=> b!258294 (=> (not res!126319) (not e!167431))))

(assert (=> b!258294 (= res!126319 (validKeyInArray!0 (select (arr!5942 lt!129838) index!297)))))

(declare-fun b!258295 () Bool)

(assert (=> b!258295 (= e!167431 (bvslt (size!6289 lt!129838) #b01111111111111111111111111111111))))

(assert (= (and d!61983 res!126318) b!258294))

(assert (= (and b!258294 res!126319) b!258295))

(declare-fun m!273755 () Bool)

(assert (=> d!61983 m!273755))

(declare-fun m!273757 () Bool)

(assert (=> d!61983 m!273757))

(assert (=> b!258294 m!273673))

(assert (=> b!258294 m!273673))

(assert (=> b!258294 m!273675))

(assert (=> b!258001 d!61983))

(declare-fun b!258308 () Bool)

(declare-fun c!43756 () Bool)

(declare-fun lt!130048 () (_ BitVec 64))

(assert (=> b!258308 (= c!43756 (= lt!130048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167438 () SeekEntryResult!1141)

(declare-fun e!167439 () SeekEntryResult!1141)

(assert (=> b!258308 (= e!167438 e!167439)))

(declare-fun b!258309 () Bool)

(declare-fun e!167440 () SeekEntryResult!1141)

(assert (=> b!258309 (= e!167440 Undefined!1141)))

(declare-fun lt!130050 () SeekEntryResult!1141)

(declare-fun b!258310 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12549 (_ BitVec 32)) SeekEntryResult!1141)

(assert (=> b!258310 (= e!167439 (seekKeyOrZeroReturnVacant!0 (x!25009 lt!130050) (index!6736 lt!130050) (index!6736 lt!130050) key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun d!61985 () Bool)

(declare-fun lt!130049 () SeekEntryResult!1141)

(assert (=> d!61985 (and (or ((_ is Undefined!1141) lt!130049) (not ((_ is Found!1141) lt!130049)) (and (bvsge (index!6735 lt!130049) #b00000000000000000000000000000000) (bvslt (index!6735 lt!130049) (size!6289 (_keys!6930 thiss!1504))))) (or ((_ is Undefined!1141) lt!130049) ((_ is Found!1141) lt!130049) (not ((_ is MissingZero!1141) lt!130049)) (and (bvsge (index!6734 lt!130049) #b00000000000000000000000000000000) (bvslt (index!6734 lt!130049) (size!6289 (_keys!6930 thiss!1504))))) (or ((_ is Undefined!1141) lt!130049) ((_ is Found!1141) lt!130049) ((_ is MissingZero!1141) lt!130049) (not ((_ is MissingVacant!1141) lt!130049)) (and (bvsge (index!6737 lt!130049) #b00000000000000000000000000000000) (bvslt (index!6737 lt!130049) (size!6289 (_keys!6930 thiss!1504))))) (or ((_ is Undefined!1141) lt!130049) (ite ((_ is Found!1141) lt!130049) (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6735 lt!130049)) key!932) (ite ((_ is MissingZero!1141) lt!130049) (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6734 lt!130049)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1141) lt!130049) (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6737 lt!130049)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61985 (= lt!130049 e!167440)))

(declare-fun c!43758 () Bool)

(assert (=> d!61985 (= c!43758 (and ((_ is Intermediate!1141) lt!130050) (undefined!1953 lt!130050)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12549 (_ BitVec 32)) SeekEntryResult!1141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61985 (= lt!130050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11057 thiss!1504)) key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(assert (=> d!61985 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61985 (= (seekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)) lt!130049)))

(declare-fun b!258311 () Bool)

(assert (=> b!258311 (= e!167438 (Found!1141 (index!6736 lt!130050)))))

(declare-fun b!258312 () Bool)

(assert (=> b!258312 (= e!167439 (MissingZero!1141 (index!6736 lt!130050)))))

(declare-fun b!258313 () Bool)

(assert (=> b!258313 (= e!167440 e!167438)))

(assert (=> b!258313 (= lt!130048 (select (arr!5942 (_keys!6930 thiss!1504)) (index!6736 lt!130050)))))

(declare-fun c!43757 () Bool)

(assert (=> b!258313 (= c!43757 (= lt!130048 key!932))))

(assert (= (and d!61985 c!43758) b!258309))

(assert (= (and d!61985 (not c!43758)) b!258313))

(assert (= (and b!258313 c!43757) b!258311))

(assert (= (and b!258313 (not c!43757)) b!258308))

(assert (= (and b!258308 c!43756) b!258312))

(assert (= (and b!258308 (not c!43756)) b!258310))

(declare-fun m!273759 () Bool)

(assert (=> b!258310 m!273759))

(assert (=> d!61985 m!273459))

(declare-fun m!273761 () Bool)

(assert (=> d!61985 m!273761))

(assert (=> d!61985 m!273761))

(declare-fun m!273763 () Bool)

(assert (=> d!61985 m!273763))

(declare-fun m!273765 () Bool)

(assert (=> d!61985 m!273765))

(declare-fun m!273767 () Bool)

(assert (=> d!61985 m!273767))

(declare-fun m!273769 () Bool)

(assert (=> d!61985 m!273769))

(declare-fun m!273771 () Bool)

(assert (=> b!258313 m!273771))

(assert (=> b!258010 d!61985))

(declare-fun d!61987 () Bool)

(assert (=> d!61987 (contains!1854 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) key!932)))

(declare-fun lt!130053 () Unit!7989)

(declare-fun choose!1252 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) (_ BitVec 32) Int) Unit!7989)

(assert (=> d!61987 (= lt!130053 (choose!1252 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61987 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61987 (= (lemmaArrayContainsKeyThenInListMap!249 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!130053)))

(declare-fun bs!9110 () Bool)

(assert (= bs!9110 d!61987))

(assert (=> bs!9110 m!273447))

(assert (=> bs!9110 m!273447))

(declare-fun m!273773 () Bool)

(assert (=> bs!9110 m!273773))

(declare-fun m!273775 () Bool)

(assert (=> bs!9110 m!273775))

(assert (=> bs!9110 m!273459))

(assert (=> b!257998 d!61987))

(declare-fun bm!24551 () Bool)

(declare-fun call!24555 () Bool)

(assert (=> bm!24551 (= call!24555 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258330 () Bool)

(declare-fun e!167451 () Bool)

(declare-fun e!167450 () Bool)

(assert (=> b!258330 (= e!167451 e!167450)))

(declare-fun res!126329 () Bool)

(declare-fun call!24554 () Bool)

(assert (=> b!258330 (= res!126329 call!24554)))

(assert (=> b!258330 (=> (not res!126329) (not e!167450))))

(declare-fun b!258331 () Bool)

(declare-fun e!167449 () Bool)

(assert (=> b!258331 (= e!167451 e!167449)))

(declare-fun c!43763 () Bool)

(declare-fun lt!130058 () SeekEntryResult!1141)

(assert (=> b!258331 (= c!43763 ((_ is MissingVacant!1141) lt!130058))))

(declare-fun b!258332 () Bool)

(assert (=> b!258332 (= e!167449 ((_ is Undefined!1141) lt!130058))))

(declare-fun bm!24552 () Bool)

(declare-fun c!43764 () Bool)

(assert (=> bm!24552 (= call!24554 (inRange!0 (ite c!43764 (index!6734 lt!130058) (index!6737 lt!130058)) (mask!11057 thiss!1504)))))

(declare-fun b!258334 () Bool)

(assert (=> b!258334 (= e!167450 (not call!24555))))

(declare-fun b!258335 () Bool)

(declare-fun res!126330 () Bool)

(declare-fun e!167452 () Bool)

(assert (=> b!258335 (=> (not res!126330) (not e!167452))))

(assert (=> b!258335 (= res!126330 call!24554)))

(assert (=> b!258335 (= e!167449 e!167452)))

(declare-fun b!258336 () Bool)

(declare-fun res!126328 () Bool)

(assert (=> b!258336 (=> (not res!126328) (not e!167452))))

(assert (=> b!258336 (= res!126328 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6737 lt!130058)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258336 (and (bvsge (index!6737 lt!130058) #b00000000000000000000000000000000) (bvslt (index!6737 lt!130058) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258337 () Bool)

(assert (=> b!258337 (and (bvsge (index!6734 lt!130058) #b00000000000000000000000000000000) (bvslt (index!6734 lt!130058) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun res!126331 () Bool)

(assert (=> b!258337 (= res!126331 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6734 lt!130058)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258337 (=> (not res!126331) (not e!167450))))

(declare-fun b!258333 () Bool)

(assert (=> b!258333 (= e!167452 (not call!24555))))

(declare-fun d!61989 () Bool)

(assert (=> d!61989 e!167451))

(assert (=> d!61989 (= c!43764 ((_ is MissingZero!1141) lt!130058))))

(assert (=> d!61989 (= lt!130058 (seekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun lt!130059 () Unit!7989)

(declare-fun choose!1253 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7989)

(assert (=> d!61989 (= lt!130059 (choose!1253 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61989 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61989 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!424 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) lt!130059)))

(assert (= (and d!61989 c!43764) b!258330))

(assert (= (and d!61989 (not c!43764)) b!258331))

(assert (= (and b!258330 res!126329) b!258337))

(assert (= (and b!258337 res!126331) b!258334))

(assert (= (and b!258331 c!43763) b!258335))

(assert (= (and b!258331 (not c!43763)) b!258332))

(assert (= (and b!258335 res!126330) b!258336))

(assert (= (and b!258336 res!126328) b!258333))

(assert (= (or b!258330 b!258335) bm!24552))

(assert (= (or b!258334 b!258333) bm!24551))

(assert (=> bm!24551 m!273461))

(declare-fun m!273777 () Bool)

(assert (=> b!258336 m!273777))

(declare-fun m!273779 () Bool)

(assert (=> bm!24552 m!273779))

(assert (=> d!61989 m!273437))

(declare-fun m!273781 () Bool)

(assert (=> d!61989 m!273781))

(assert (=> d!61989 m!273459))

(declare-fun m!273783 () Bool)

(assert (=> b!258337 m!273783))

(assert (=> b!258009 d!61989))

(declare-fun d!61991 () Bool)

(assert (=> d!61991 (= (inRange!0 index!297 (mask!11057 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11057 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!257997 d!61991))

(declare-fun d!61993 () Bool)

(declare-fun e!167458 () Bool)

(assert (=> d!61993 e!167458))

(declare-fun res!126334 () Bool)

(assert (=> d!61993 (=> res!126334 e!167458)))

(declare-fun lt!130070 () Bool)

(assert (=> d!61993 (= res!126334 (not lt!130070))))

(declare-fun lt!130069 () Bool)

(assert (=> d!61993 (= lt!130070 lt!130069)))

(declare-fun lt!130068 () Unit!7989)

(declare-fun e!167457 () Unit!7989)

(assert (=> d!61993 (= lt!130068 e!167457)))

(declare-fun c!43767 () Bool)

(assert (=> d!61993 (= c!43767 lt!130069)))

(declare-fun containsKey!305 (List!3720 (_ BitVec 64)) Bool)

(assert (=> d!61993 (= lt!130069 (containsKey!305 (toList!1894 lt!129839) key!932))))

(assert (=> d!61993 (= (contains!1854 lt!129839 key!932) lt!130070)))

(declare-fun b!258344 () Bool)

(declare-fun lt!130071 () Unit!7989)

(assert (=> b!258344 (= e!167457 lt!130071)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!253 (List!3720 (_ BitVec 64)) Unit!7989)

(assert (=> b!258344 (= lt!130071 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!129839) key!932))))

(declare-fun isDefined!254 (Option!320) Bool)

(assert (=> b!258344 (isDefined!254 (getValueByKey!314 (toList!1894 lt!129839) key!932))))

(declare-fun b!258345 () Bool)

(declare-fun Unit!8004 () Unit!7989)

(assert (=> b!258345 (= e!167457 Unit!8004)))

(declare-fun b!258346 () Bool)

(assert (=> b!258346 (= e!167458 (isDefined!254 (getValueByKey!314 (toList!1894 lt!129839) key!932)))))

(assert (= (and d!61993 c!43767) b!258344))

(assert (= (and d!61993 (not c!43767)) b!258345))

(assert (= (and d!61993 (not res!126334)) b!258346))

(declare-fun m!273785 () Bool)

(assert (=> d!61993 m!273785))

(declare-fun m!273787 () Bool)

(assert (=> b!258344 m!273787))

(declare-fun m!273789 () Bool)

(assert (=> b!258344 m!273789))

(assert (=> b!258344 m!273789))

(declare-fun m!273791 () Bool)

(assert (=> b!258344 m!273791))

(assert (=> b!258346 m!273789))

(assert (=> b!258346 m!273789))

(assert (=> b!258346 m!273791))

(assert (=> b!257997 d!61993))

(declare-fun b!258347 () Bool)

(declare-fun e!167463 () Unit!7989)

(declare-fun lt!130084 () Unit!7989)

(assert (=> b!258347 (= e!167463 lt!130084)))

(declare-fun lt!130076 () ListLongMap!3757)

(assert (=> b!258347 (= lt!130076 (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130079 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130079 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130072 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130072 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130089 () Unit!7989)

(assert (=> b!258347 (= lt!130089 (addStillContains!231 lt!130076 lt!130079 (zeroValue!4601 thiss!1504) lt!130072))))

(assert (=> b!258347 (contains!1854 (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))) lt!130072)))

(declare-fun lt!130075 () Unit!7989)

(assert (=> b!258347 (= lt!130075 lt!130089)))

(declare-fun lt!130090 () ListLongMap!3757)

(assert (=> b!258347 (= lt!130090 (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130080 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130080 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130092 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130092 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130086 () Unit!7989)

(assert (=> b!258347 (= lt!130086 (addApplyDifferent!231 lt!130090 lt!130080 (minValue!4601 thiss!1504) lt!130092))))

(assert (=> b!258347 (= (apply!255 (+!691 lt!130090 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))) lt!130092) (apply!255 lt!130090 lt!130092))))

(declare-fun lt!130088 () Unit!7989)

(assert (=> b!258347 (= lt!130088 lt!130086)))

(declare-fun lt!130082 () ListLongMap!3757)

(assert (=> b!258347 (= lt!130082 (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130093 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130074 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130074 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130078 () Unit!7989)

(assert (=> b!258347 (= lt!130078 (addApplyDifferent!231 lt!130082 lt!130093 (zeroValue!4601 thiss!1504) lt!130074))))

(assert (=> b!258347 (= (apply!255 (+!691 lt!130082 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))) lt!130074) (apply!255 lt!130082 lt!130074))))

(declare-fun lt!130091 () Unit!7989)

(assert (=> b!258347 (= lt!130091 lt!130078)))

(declare-fun lt!130087 () ListLongMap!3757)

(assert (=> b!258347 (= lt!130087 (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130081 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130081 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130083 () (_ BitVec 64))

(assert (=> b!258347 (= lt!130083 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258347 (= lt!130084 (addApplyDifferent!231 lt!130087 lt!130081 (minValue!4601 thiss!1504) lt!130083))))

(assert (=> b!258347 (= (apply!255 (+!691 lt!130087 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))) lt!130083) (apply!255 lt!130087 lt!130083))))

(declare-fun b!258348 () Bool)

(declare-fun e!167468 () Bool)

(declare-fun lt!130077 () ListLongMap!3757)

(assert (=> b!258348 (= e!167468 (= (apply!255 lt!130077 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4601 thiss!1504)))))

(declare-fun b!258349 () Bool)

(declare-fun e!167467 () Bool)

(assert (=> b!258349 (= e!167467 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258350 () Bool)

(declare-fun e!167466 () Bool)

(declare-fun call!24556 () Bool)

(assert (=> b!258350 (= e!167466 (not call!24556))))

(declare-fun b!258351 () Bool)

(declare-fun c!43770 () Bool)

(assert (=> b!258351 (= c!43770 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167460 () ListLongMap!3757)

(declare-fun e!167469 () ListLongMap!3757)

(assert (=> b!258351 (= e!167460 e!167469)))

(declare-fun b!258352 () Bool)

(declare-fun e!167465 () Bool)

(assert (=> b!258352 (= e!167465 e!167468)))

(declare-fun res!126340 () Bool)

(declare-fun call!24560 () Bool)

(assert (=> b!258352 (= res!126340 call!24560)))

(assert (=> b!258352 (=> (not res!126340) (not e!167468))))

(declare-fun b!258353 () Bool)

(declare-fun e!167464 () Bool)

(assert (=> b!258353 (= e!167464 e!167466)))

(declare-fun c!43769 () Bool)

(assert (=> b!258353 (= c!43769 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258354 () Bool)

(declare-fun e!167470 () ListLongMap!3757)

(assert (=> b!258354 (= e!167470 e!167460)))

(declare-fun c!43773 () Bool)

(assert (=> b!258354 (= c!43773 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258355 () Bool)

(declare-fun res!126335 () Bool)

(assert (=> b!258355 (=> (not res!126335) (not e!167464))))

(declare-fun e!167459 () Bool)

(assert (=> b!258355 (= res!126335 e!167459)))

(declare-fun res!126341 () Bool)

(assert (=> b!258355 (=> res!126341 e!167459)))

(declare-fun e!167461 () Bool)

(assert (=> b!258355 (= res!126341 (not e!167461))))

(declare-fun res!126337 () Bool)

(assert (=> b!258355 (=> (not res!126337) (not e!167461))))

(assert (=> b!258355 (= res!126337 (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258356 () Bool)

(declare-fun e!167462 () Bool)

(assert (=> b!258356 (= e!167466 e!167462)))

(declare-fun res!126336 () Bool)

(assert (=> b!258356 (= res!126336 call!24556)))

(assert (=> b!258356 (=> (not res!126336) (not e!167462))))

(declare-fun b!258357 () Bool)

(declare-fun call!24557 () ListLongMap!3757)

(assert (=> b!258357 (= e!167460 call!24557)))

(declare-fun b!258358 () Bool)

(declare-fun e!167471 () Bool)

(assert (=> b!258358 (= e!167471 (= (apply!255 lt!130077 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)) (get!3062 (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6288 (_values!4743 thiss!1504))))))

(assert (=> b!258358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun bm!24553 () Bool)

(declare-fun call!24562 () ListLongMap!3757)

(declare-fun call!24559 () ListLongMap!3757)

(assert (=> bm!24553 (= call!24562 call!24559)))

(declare-fun b!258359 () Bool)

(assert (=> b!258359 (= e!167459 e!167471)))

(declare-fun res!126338 () Bool)

(assert (=> b!258359 (=> (not res!126338) (not e!167471))))

(assert (=> b!258359 (= res!126338 (contains!1854 lt!130077 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun bm!24554 () Bool)

(assert (=> bm!24554 (= call!24556 (contains!1854 lt!130077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24555 () Bool)

(declare-fun call!24561 () ListLongMap!3757)

(assert (=> bm!24555 (= call!24559 call!24561)))

(declare-fun bm!24556 () Bool)

(declare-fun c!43772 () Bool)

(declare-fun call!24558 () ListLongMap!3757)

(assert (=> bm!24556 (= call!24558 (+!691 (ite c!43772 call!24561 (ite c!43773 call!24559 call!24562)) (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun bm!24557 () Bool)

(assert (=> bm!24557 (= call!24561 (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun b!258360 () Bool)

(assert (=> b!258360 (= e!167462 (= (apply!255 lt!130077 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4601 thiss!1504)))))

(declare-fun d!61995 () Bool)

(assert (=> d!61995 e!167464))

(declare-fun res!126342 () Bool)

(assert (=> d!61995 (=> (not res!126342) (not e!167464))))

(assert (=> d!61995 (= res!126342 (or (bvsge #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))))

(declare-fun lt!130073 () ListLongMap!3757)

(assert (=> d!61995 (= lt!130077 lt!130073)))

(declare-fun lt!130085 () Unit!7989)

(assert (=> d!61995 (= lt!130085 e!167463)))

(declare-fun c!43768 () Bool)

(assert (=> d!61995 (= c!43768 e!167467)))

(declare-fun res!126343 () Bool)

(assert (=> d!61995 (=> (not res!126343) (not e!167467))))

(assert (=> d!61995 (= res!126343 (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!61995 (= lt!130073 e!167470)))

(assert (=> d!61995 (= c!43772 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61995 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61995 (= (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!130077)))

(declare-fun b!258361 () Bool)

(assert (=> b!258361 (= e!167470 (+!691 call!24558 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(declare-fun b!258362 () Bool)

(assert (=> b!258362 (= e!167461 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258363 () Bool)

(assert (=> b!258363 (= e!167465 (not call!24560))))

(declare-fun b!258364 () Bool)

(declare-fun res!126339 () Bool)

(assert (=> b!258364 (=> (not res!126339) (not e!167464))))

(assert (=> b!258364 (= res!126339 e!167465)))

(declare-fun c!43771 () Bool)

(assert (=> b!258364 (= c!43771 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24558 () Bool)

(assert (=> bm!24558 (= call!24560 (contains!1854 lt!130077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258365 () Bool)

(assert (=> b!258365 (= e!167469 call!24562)))

(declare-fun bm!24559 () Bool)

(assert (=> bm!24559 (= call!24557 call!24558)))

(declare-fun b!258366 () Bool)

(declare-fun Unit!8005 () Unit!7989)

(assert (=> b!258366 (= e!167463 Unit!8005)))

(declare-fun b!258367 () Bool)

(assert (=> b!258367 (= e!167469 call!24557)))

(assert (= (and d!61995 c!43772) b!258361))

(assert (= (and d!61995 (not c!43772)) b!258354))

(assert (= (and b!258354 c!43773) b!258357))

(assert (= (and b!258354 (not c!43773)) b!258351))

(assert (= (and b!258351 c!43770) b!258367))

(assert (= (and b!258351 (not c!43770)) b!258365))

(assert (= (or b!258367 b!258365) bm!24553))

(assert (= (or b!258357 bm!24553) bm!24555))

(assert (= (or b!258357 b!258367) bm!24559))

(assert (= (or b!258361 bm!24555) bm!24557))

(assert (= (or b!258361 bm!24559) bm!24556))

(assert (= (and d!61995 res!126343) b!258349))

(assert (= (and d!61995 c!43768) b!258347))

(assert (= (and d!61995 (not c!43768)) b!258366))

(assert (= (and d!61995 res!126342) b!258355))

(assert (= (and b!258355 res!126337) b!258362))

(assert (= (and b!258355 (not res!126341)) b!258359))

(assert (= (and b!258359 res!126338) b!258358))

(assert (= (and b!258355 res!126335) b!258364))

(assert (= (and b!258364 c!43771) b!258352))

(assert (= (and b!258364 (not c!43771)) b!258363))

(assert (= (and b!258352 res!126340) b!258348))

(assert (= (or b!258352 b!258363) bm!24558))

(assert (= (and b!258364 res!126339) b!258353))

(assert (= (and b!258353 c!43769) b!258356))

(assert (= (and b!258353 (not c!43769)) b!258350))

(assert (= (and b!258356 res!126336) b!258360))

(assert (= (or b!258356 b!258350) bm!24554))

(declare-fun b_lambda!8219 () Bool)

(assert (=> (not b_lambda!8219) (not b!258358)))

(assert (=> b!258358 t!8782))

(declare-fun b_and!13835 () Bool)

(assert (= b_and!13833 (and (=> t!8782 result!5383) b_and!13835)))

(assert (=> b!258347 m!273687))

(declare-fun m!273793 () Bool)

(assert (=> b!258347 m!273793))

(declare-fun m!273795 () Bool)

(assert (=> b!258347 m!273795))

(declare-fun m!273797 () Bool)

(assert (=> b!258347 m!273797))

(declare-fun m!273799 () Bool)

(assert (=> b!258347 m!273799))

(declare-fun m!273801 () Bool)

(assert (=> b!258347 m!273801))

(declare-fun m!273803 () Bool)

(assert (=> b!258347 m!273803))

(declare-fun m!273805 () Bool)

(assert (=> b!258347 m!273805))

(declare-fun m!273807 () Bool)

(assert (=> b!258347 m!273807))

(declare-fun m!273809 () Bool)

(assert (=> b!258347 m!273809))

(declare-fun m!273811 () Bool)

(assert (=> b!258347 m!273811))

(assert (=> b!258347 m!273799))

(assert (=> b!258347 m!273807))

(assert (=> b!258347 m!273793))

(declare-fun m!273813 () Bool)

(assert (=> b!258347 m!273813))

(assert (=> b!258347 m!273805))

(declare-fun m!273815 () Bool)

(assert (=> b!258347 m!273815))

(declare-fun m!273817 () Bool)

(assert (=> b!258347 m!273817))

(declare-fun m!273819 () Bool)

(assert (=> b!258347 m!273819))

(declare-fun m!273821 () Bool)

(assert (=> b!258347 m!273821))

(declare-fun m!273823 () Bool)

(assert (=> b!258347 m!273823))

(declare-fun m!273825 () Bool)

(assert (=> bm!24554 m!273825))

(assert (=> b!258349 m!273687))

(assert (=> b!258349 m!273687))

(assert (=> b!258349 m!273697))

(declare-fun m!273827 () Bool)

(assert (=> b!258360 m!273827))

(declare-fun m!273829 () Bool)

(assert (=> b!258348 m!273829))

(assert (=> b!258362 m!273687))

(assert (=> b!258362 m!273687))

(assert (=> b!258362 m!273697))

(assert (=> b!258359 m!273687))

(assert (=> b!258359 m!273687))

(declare-fun m!273831 () Bool)

(assert (=> b!258359 m!273831))

(declare-fun m!273833 () Bool)

(assert (=> b!258361 m!273833))

(assert (=> bm!24557 m!273823))

(declare-fun m!273835 () Bool)

(assert (=> b!258358 m!273835))

(assert (=> b!258358 m!273743))

(declare-fun m!273837 () Bool)

(assert (=> b!258358 m!273837))

(assert (=> b!258358 m!273687))

(assert (=> b!258358 m!273743))

(assert (=> b!258358 m!273835))

(assert (=> b!258358 m!273687))

(declare-fun m!273839 () Bool)

(assert (=> b!258358 m!273839))

(declare-fun m!273841 () Bool)

(assert (=> bm!24556 m!273841))

(declare-fun m!273843 () Bool)

(assert (=> bm!24558 m!273843))

(assert (=> d!61995 m!273459))

(assert (=> b!257997 d!61995))

(declare-fun d!61997 () Bool)

(declare-fun e!167474 () Bool)

(assert (=> d!61997 e!167474))

(declare-fun res!126348 () Bool)

(assert (=> d!61997 (=> (not res!126348) (not e!167474))))

(declare-fun lt!130098 () SeekEntryResult!1141)

(assert (=> d!61997 (= res!126348 ((_ is Found!1141) lt!130098))))

(assert (=> d!61997 (= lt!130098 (seekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun lt!130099 () Unit!7989)

(declare-fun choose!1254 (array!12549 array!12547 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7989)

(assert (=> d!61997 (= lt!130099 (choose!1254 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61997 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!61997 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) lt!130099)))

(declare-fun b!258372 () Bool)

(declare-fun res!126349 () Bool)

(assert (=> b!258372 (=> (not res!126349) (not e!167474))))

(assert (=> b!258372 (= res!126349 (inRange!0 (index!6735 lt!130098) (mask!11057 thiss!1504)))))

(declare-fun b!258373 () Bool)

(assert (=> b!258373 (= e!167474 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6735 lt!130098)) key!932))))

(assert (=> b!258373 (and (bvsge (index!6735 lt!130098) #b00000000000000000000000000000000) (bvslt (index!6735 lt!130098) (size!6289 (_keys!6930 thiss!1504))))))

(assert (= (and d!61997 res!126348) b!258372))

(assert (= (and b!258372 res!126349) b!258373))

(assert (=> d!61997 m!273437))

(declare-fun m!273845 () Bool)

(assert (=> d!61997 m!273845))

(assert (=> d!61997 m!273459))

(declare-fun m!273847 () Bool)

(assert (=> b!258372 m!273847))

(declare-fun m!273849 () Bool)

(assert (=> b!258373 m!273849))

(assert (=> b!258013 d!61997))

(declare-fun d!61999 () Bool)

(assert (=> d!61999 (= (array_inv!3911 (_keys!6930 thiss!1504)) (bvsge (size!6289 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257999 d!61999))

(declare-fun d!62001 () Bool)

(assert (=> d!62001 (= (array_inv!3912 (_values!4743 thiss!1504)) (bvsge (size!6288 (_values!4743 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257999 d!62001))

(declare-fun d!62003 () Bool)

(declare-fun res!126356 () Bool)

(declare-fun e!167477 () Bool)

(assert (=> d!62003 (=> (not res!126356) (not e!167477))))

(declare-fun simpleValid!278 (LongMapFixedSize!3814) Bool)

(assert (=> d!62003 (= res!126356 (simpleValid!278 thiss!1504))))

(assert (=> d!62003 (= (valid!1497 thiss!1504) e!167477)))

(declare-fun b!258380 () Bool)

(declare-fun res!126357 () Bool)

(assert (=> b!258380 (=> (not res!126357) (not e!167477))))

(assert (=> b!258380 (= res!126357 (= (arrayCountValidKeys!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (_size!1956 thiss!1504)))))

(declare-fun b!258381 () Bool)

(declare-fun res!126358 () Bool)

(assert (=> b!258381 (=> (not res!126358) (not e!167477))))

(assert (=> b!258381 (= res!126358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun b!258382 () Bool)

(assert (=> b!258382 (= e!167477 (arrayNoDuplicates!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 Nil!3718))))

(assert (= (and d!62003 res!126356) b!258380))

(assert (= (and b!258380 res!126357) b!258381))

(assert (= (and b!258381 res!126358) b!258382))

(declare-fun m!273851 () Bool)

(assert (=> d!62003 m!273851))

(assert (=> b!258380 m!273491))

(declare-fun m!273853 () Bool)

(assert (=> b!258381 m!273853))

(declare-fun m!273855 () Bool)

(assert (=> b!258382 m!273855))

(assert (=> start!24660 d!62003))

(assert (=> bm!24502 d!61971))

(declare-fun d!62005 () Bool)

(assert (=> d!62005 (= (inRange!0 (ite c!43691 (index!6734 lt!129845) (index!6737 lt!129845)) (mask!11057 thiss!1504)) (and (bvsge (ite c!43691 (index!6734 lt!129845) (index!6737 lt!129845)) #b00000000000000000000000000000000) (bvslt (ite c!43691 (index!6734 lt!129845) (index!6737 lt!129845)) (bvadd (mask!11057 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24501 d!62005))

(declare-fun b!258389 () Bool)

(declare-fun e!167483 () Bool)

(assert (=> b!258389 (= e!167483 tp_is_empty!6601)))

(declare-fun mapIsEmpty!11250 () Bool)

(declare-fun mapRes!11250 () Bool)

(assert (=> mapIsEmpty!11250 mapRes!11250))

(declare-fun condMapEmpty!11250 () Bool)

(declare-fun mapDefault!11250 () ValueCell!2957)

(assert (=> mapNonEmpty!11241 (= condMapEmpty!11250 (= mapRest!11241 ((as const (Array (_ BitVec 32) ValueCell!2957)) mapDefault!11250)))))

(declare-fun e!167482 () Bool)

(assert (=> mapNonEmpty!11241 (= tp!23528 (and e!167482 mapRes!11250))))

(declare-fun mapNonEmpty!11250 () Bool)

(declare-fun tp!23544 () Bool)

(assert (=> mapNonEmpty!11250 (= mapRes!11250 (and tp!23544 e!167483))))

(declare-fun mapKey!11250 () (_ BitVec 32))

(declare-fun mapValue!11250 () ValueCell!2957)

(declare-fun mapRest!11250 () (Array (_ BitVec 32) ValueCell!2957))

(assert (=> mapNonEmpty!11250 (= mapRest!11241 (store mapRest!11250 mapKey!11250 mapValue!11250))))

(declare-fun b!258390 () Bool)

(assert (=> b!258390 (= e!167482 tp_is_empty!6601)))

(assert (= (and mapNonEmpty!11241 condMapEmpty!11250) mapIsEmpty!11250))

(assert (= (and mapNonEmpty!11241 (not condMapEmpty!11250)) mapNonEmpty!11250))

(assert (= (and mapNonEmpty!11250 ((_ is ValueCellFull!2957) mapValue!11250)) b!258389))

(assert (= (and mapNonEmpty!11241 ((_ is ValueCellFull!2957) mapDefault!11250)) b!258390))

(declare-fun m!273857 () Bool)

(assert (=> mapNonEmpty!11250 m!273857))

(declare-fun b_lambda!8221 () Bool)

(assert (= b_lambda!8217 (or (and b!257999 b_free!6739) b_lambda!8221)))

(declare-fun b_lambda!8223 () Bool)

(assert (= b_lambda!8219 (or (and b!257999 b_free!6739) b_lambda!8223)))

(check-sat (not b!258362) (not bm!24554) (not d!61955) (not bm!24545) (not bm!24544) tp_is_empty!6601 (not mapNonEmpty!11250) (not b_lambda!8221) (not b!258381) (not b!258269) (not b!258177) (not b!258360) (not d!62003) (not b!258347) (not d!61965) (not b!258213) (not bm!24556) (not b!258282) (not b!258221) (not d!61997) (not d!61989) (not d!61995) (not d!61985) b_and!13835 (not b!258199) (not b!258160) (not b!258200) (not b!258310) (not b!258215) (not bm!24517) (not b!258372) (not bm!24552) (not bm!24558) (not d!61973) (not b!258346) (not b!258217) (not b!258361) (not d!61977) (not d!61979) (not bm!24557) (not bm!24524) (not b!258220) (not b_next!6739) (not bm!24523) (not b!258184) (not b!258268) (not b!258358) (not b!258359) (not d!61987) (not b!258280) (not b!258170) (not bm!24543) (not b!258380) (not b_lambda!8223) (not b!258157) (not b!258193) (not b!258212) (not b!258382) (not bm!24525) (not d!61983) (not b!258294) (not b!258156) (not b!258344) (not bm!24541) (not b!258155) (not b!258348) (not b!258349) (not bm!24520) (not d!61993) (not bm!24551) (not b!258278) (not d!61959) (not d!61969) (not b!258281) (not b!258178) (not b!258267) (not b!258279) (not b!258171))
(check-sat b_and!13835 (not b_next!6739))
(get-model)

(declare-fun d!62007 () Bool)

(declare-fun lt!130100 () (_ BitVec 32))

(assert (=> d!62007 (and (bvsge lt!130100 #b00000000000000000000000000000000) (bvsle lt!130100 (bvsub (size!6289 lt!129838) index!297)))))

(declare-fun e!167485 () (_ BitVec 32))

(assert (=> d!62007 (= lt!130100 e!167485)))

(declare-fun c!43775 () Bool)

(assert (=> d!62007 (= c!43775 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62007 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6289 lt!129838)))))

(assert (=> d!62007 (= (arrayCountValidKeys!0 lt!129838 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!130100)))

(declare-fun bm!24560 () Bool)

(declare-fun call!24563 () (_ BitVec 32))

(assert (=> bm!24560 (= call!24563 (arrayCountValidKeys!0 lt!129838 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!258391 () Bool)

(declare-fun e!167484 () (_ BitVec 32))

(assert (=> b!258391 (= e!167485 e!167484)))

(declare-fun c!43774 () Bool)

(assert (=> b!258391 (= c!43774 (validKeyInArray!0 (select (arr!5942 lt!129838) index!297)))))

(declare-fun b!258392 () Bool)

(assert (=> b!258392 (= e!167484 call!24563)))

(declare-fun b!258393 () Bool)

(assert (=> b!258393 (= e!167485 #b00000000000000000000000000000000)))

(declare-fun b!258394 () Bool)

(assert (=> b!258394 (= e!167484 (bvadd #b00000000000000000000000000000001 call!24563))))

(assert (= (and d!62007 c!43775) b!258393))

(assert (= (and d!62007 (not c!43775)) b!258391))

(assert (= (and b!258391 c!43774) b!258394))

(assert (= (and b!258391 (not c!43774)) b!258392))

(assert (= (or b!258394 b!258392) bm!24560))

(declare-fun m!273859 () Bool)

(assert (=> bm!24560 m!273859))

(assert (=> b!258391 m!273673))

(assert (=> b!258391 m!273673))

(assert (=> b!258391 m!273675))

(assert (=> d!61983 d!62007))

(declare-fun d!62009 () Bool)

(assert (=> d!62009 (= (arrayCountValidKeys!0 lt!129838 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62009 true))

(declare-fun _$85!21 () Unit!7989)

(assert (=> d!62009 (= (choose!2 lt!129838 index!297) _$85!21)))

(declare-fun bs!9111 () Bool)

(assert (= bs!9111 d!62009))

(assert (=> bs!9111 m!273755))

(assert (=> d!61983 d!62009))

(declare-fun d!62011 () Bool)

(assert (=> d!62011 (= (validKeyInArray!0 (select (arr!5942 lt!129838) index!297)) (and (not (= (select (arr!5942 lt!129838) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5942 lt!129838) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258294 d!62011))

(declare-fun d!62013 () Bool)

(declare-fun e!167486 () Bool)

(assert (=> d!62013 e!167486))

(declare-fun res!126359 () Bool)

(assert (=> d!62013 (=> (not res!126359) (not e!167486))))

(declare-fun lt!130102 () ListLongMap!3757)

(assert (=> d!62013 (= res!126359 (contains!1854 lt!130102 (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun lt!130104 () List!3720)

(assert (=> d!62013 (= lt!130102 (ListLongMap!3758 lt!130104))))

(declare-fun lt!130103 () Unit!7989)

(declare-fun lt!130101 () Unit!7989)

(assert (=> d!62013 (= lt!130103 lt!130101)))

(assert (=> d!62013 (= (getValueByKey!314 lt!130104 (_1!2432 (tuple2!4843 key!932 v!346))) (Some!319 (_2!2432 (tuple2!4843 key!932 v!346))))))

(assert (=> d!62013 (= lt!130101 (lemmaContainsTupThenGetReturnValue!170 lt!130104 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(assert (=> d!62013 (= lt!130104 (insertStrictlySorted!173 (toList!1894 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(assert (=> d!62013 (= (+!691 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) (tuple2!4843 key!932 v!346)) lt!130102)))

(declare-fun b!258395 () Bool)

(declare-fun res!126360 () Bool)

(assert (=> b!258395 (=> (not res!126360) (not e!167486))))

(assert (=> b!258395 (= res!126360 (= (getValueByKey!314 (toList!1894 lt!130102) (_1!2432 (tuple2!4843 key!932 v!346))) (Some!319 (_2!2432 (tuple2!4843 key!932 v!346)))))))

(declare-fun b!258396 () Bool)

(assert (=> b!258396 (= e!167486 (contains!1857 (toList!1894 lt!130102) (tuple2!4843 key!932 v!346)))))

(assert (= (and d!62013 res!126359) b!258395))

(assert (= (and b!258395 res!126360) b!258396))

(declare-fun m!273861 () Bool)

(assert (=> d!62013 m!273861))

(declare-fun m!273863 () Bool)

(assert (=> d!62013 m!273863))

(declare-fun m!273865 () Bool)

(assert (=> d!62013 m!273865))

(declare-fun m!273867 () Bool)

(assert (=> d!62013 m!273867))

(declare-fun m!273869 () Bool)

(assert (=> b!258395 m!273869))

(declare-fun m!273871 () Bool)

(assert (=> b!258396 m!273871))

(assert (=> b!258160 d!62013))

(assert (=> b!258160 d!61995))

(declare-fun b!258397 () Bool)

(declare-fun e!167491 () Unit!7989)

(declare-fun lt!130117 () Unit!7989)

(assert (=> b!258397 (= e!167491 lt!130117)))

(declare-fun lt!130109 () ListLongMap!3757)

(assert (=> b!258397 (= lt!130109 (getCurrentListMapNoExtraKeys!571 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130112 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130105 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130105 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130122 () Unit!7989)

(assert (=> b!258397 (= lt!130122 (addStillContains!231 lt!130109 lt!130112 (zeroValue!4601 thiss!1504) lt!130105))))

(assert (=> b!258397 (contains!1854 (+!691 lt!130109 (tuple2!4843 lt!130112 (zeroValue!4601 thiss!1504))) lt!130105)))

(declare-fun lt!130108 () Unit!7989)

(assert (=> b!258397 (= lt!130108 lt!130122)))

(declare-fun lt!130123 () ListLongMap!3757)

(assert (=> b!258397 (= lt!130123 (getCurrentListMapNoExtraKeys!571 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130113 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130113 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130125 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130125 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130119 () Unit!7989)

(assert (=> b!258397 (= lt!130119 (addApplyDifferent!231 lt!130123 lt!130113 (minValue!4601 thiss!1504) lt!130125))))

(assert (=> b!258397 (= (apply!255 (+!691 lt!130123 (tuple2!4843 lt!130113 (minValue!4601 thiss!1504))) lt!130125) (apply!255 lt!130123 lt!130125))))

(declare-fun lt!130121 () Unit!7989)

(assert (=> b!258397 (= lt!130121 lt!130119)))

(declare-fun lt!130115 () ListLongMap!3757)

(assert (=> b!258397 (= lt!130115 (getCurrentListMapNoExtraKeys!571 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130126 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130126 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130107 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130107 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130111 () Unit!7989)

(assert (=> b!258397 (= lt!130111 (addApplyDifferent!231 lt!130115 lt!130126 (zeroValue!4601 thiss!1504) lt!130107))))

(assert (=> b!258397 (= (apply!255 (+!691 lt!130115 (tuple2!4843 lt!130126 (zeroValue!4601 thiss!1504))) lt!130107) (apply!255 lt!130115 lt!130107))))

(declare-fun lt!130124 () Unit!7989)

(assert (=> b!258397 (= lt!130124 lt!130111)))

(declare-fun lt!130120 () ListLongMap!3757)

(assert (=> b!258397 (= lt!130120 (getCurrentListMapNoExtraKeys!571 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130114 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130114 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130116 () (_ BitVec 64))

(assert (=> b!258397 (= lt!130116 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!258397 (= lt!130117 (addApplyDifferent!231 lt!130120 lt!130114 (minValue!4601 thiss!1504) lt!130116))))

(assert (=> b!258397 (= (apply!255 (+!691 lt!130120 (tuple2!4843 lt!130114 (minValue!4601 thiss!1504))) lt!130116) (apply!255 lt!130120 lt!130116))))

(declare-fun b!258398 () Bool)

(declare-fun e!167496 () Bool)

(declare-fun lt!130110 () ListLongMap!3757)

(assert (=> b!258398 (= e!167496 (= (apply!255 lt!130110 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4601 thiss!1504)))))

(declare-fun b!258399 () Bool)

(declare-fun e!167495 () Bool)

(assert (=> b!258399 (= e!167495 (validKeyInArray!0 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258400 () Bool)

(declare-fun e!167494 () Bool)

(declare-fun call!24564 () Bool)

(assert (=> b!258400 (= e!167494 (not call!24564))))

(declare-fun b!258401 () Bool)

(declare-fun c!43778 () Bool)

(assert (=> b!258401 (= c!43778 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167488 () ListLongMap!3757)

(declare-fun e!167497 () ListLongMap!3757)

(assert (=> b!258401 (= e!167488 e!167497)))

(declare-fun b!258402 () Bool)

(declare-fun e!167493 () Bool)

(assert (=> b!258402 (= e!167493 e!167496)))

(declare-fun res!126366 () Bool)

(declare-fun call!24568 () Bool)

(assert (=> b!258402 (= res!126366 call!24568)))

(assert (=> b!258402 (=> (not res!126366) (not e!167496))))

(declare-fun b!258403 () Bool)

(declare-fun e!167492 () Bool)

(assert (=> b!258403 (= e!167492 e!167494)))

(declare-fun c!43777 () Bool)

(assert (=> b!258403 (= c!43777 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258404 () Bool)

(declare-fun e!167498 () ListLongMap!3757)

(assert (=> b!258404 (= e!167498 e!167488)))

(declare-fun c!43781 () Bool)

(assert (=> b!258404 (= c!43781 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258405 () Bool)

(declare-fun res!126361 () Bool)

(assert (=> b!258405 (=> (not res!126361) (not e!167492))))

(declare-fun e!167487 () Bool)

(assert (=> b!258405 (= res!126361 e!167487)))

(declare-fun res!126367 () Bool)

(assert (=> b!258405 (=> res!126367 e!167487)))

(declare-fun e!167489 () Bool)

(assert (=> b!258405 (= res!126367 (not e!167489))))

(declare-fun res!126363 () Bool)

(assert (=> b!258405 (=> (not res!126363) (not e!167489))))

(assert (=> b!258405 (= res!126363 (bvslt #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))

(declare-fun b!258406 () Bool)

(declare-fun e!167490 () Bool)

(assert (=> b!258406 (= e!167494 e!167490)))

(declare-fun res!126362 () Bool)

(assert (=> b!258406 (= res!126362 call!24564)))

(assert (=> b!258406 (=> (not res!126362) (not e!167490))))

(declare-fun b!258407 () Bool)

(declare-fun call!24565 () ListLongMap!3757)

(assert (=> b!258407 (= e!167488 call!24565)))

(declare-fun e!167499 () Bool)

(declare-fun b!258408 () Bool)

(assert (=> b!258408 (= e!167499 (= (apply!255 lt!130110 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)) (get!3062 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6288 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))))))))

(assert (=> b!258408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))

(declare-fun bm!24561 () Bool)

(declare-fun call!24570 () ListLongMap!3757)

(declare-fun call!24567 () ListLongMap!3757)

(assert (=> bm!24561 (= call!24570 call!24567)))

(declare-fun b!258409 () Bool)

(assert (=> b!258409 (= e!167487 e!167499)))

(declare-fun res!126364 () Bool)

(assert (=> b!258409 (=> (not res!126364) (not e!167499))))

(assert (=> b!258409 (= res!126364 (contains!1854 lt!130110 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!258409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))

(declare-fun bm!24562 () Bool)

(assert (=> bm!24562 (= call!24564 (contains!1854 lt!130110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24563 () Bool)

(declare-fun call!24569 () ListLongMap!3757)

(assert (=> bm!24563 (= call!24567 call!24569)))

(declare-fun bm!24564 () Bool)

(declare-fun call!24566 () ListLongMap!3757)

(declare-fun c!43780 () Bool)

(assert (=> bm!24564 (= call!24566 (+!691 (ite c!43780 call!24569 (ite c!43781 call!24567 call!24570)) (ite (or c!43780 c!43781) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun bm!24565 () Bool)

(assert (=> bm!24565 (= call!24569 (getCurrentListMapNoExtraKeys!571 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun b!258410 () Bool)

(assert (=> b!258410 (= e!167490 (= (apply!255 lt!130110 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4601 thiss!1504)))))

(declare-fun d!62015 () Bool)

(assert (=> d!62015 e!167492))

(declare-fun res!126368 () Bool)

(assert (=> d!62015 (=> (not res!126368) (not e!167492))))

(assert (=> d!62015 (= res!126368 (or (bvsge #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))))

(declare-fun lt!130106 () ListLongMap!3757)

(assert (=> d!62015 (= lt!130110 lt!130106)))

(declare-fun lt!130118 () Unit!7989)

(assert (=> d!62015 (= lt!130118 e!167491)))

(declare-fun c!43776 () Bool)

(assert (=> d!62015 (= c!43776 e!167495)))

(declare-fun res!126369 () Bool)

(assert (=> d!62015 (=> (not res!126369) (not e!167495))))

(assert (=> d!62015 (= res!126369 (bvslt #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))

(assert (=> d!62015 (= lt!130106 e!167498)))

(assert (=> d!62015 (= c!43780 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62015 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!62015 (= (getCurrentListMap!1426 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!130110)))

(declare-fun b!258411 () Bool)

(assert (=> b!258411 (= e!167498 (+!691 call!24566 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(declare-fun b!258412 () Bool)

(assert (=> b!258412 (= e!167489 (validKeyInArray!0 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258413 () Bool)

(assert (=> b!258413 (= e!167493 (not call!24568))))

(declare-fun b!258414 () Bool)

(declare-fun res!126365 () Bool)

(assert (=> b!258414 (=> (not res!126365) (not e!167492))))

(assert (=> b!258414 (= res!126365 e!167493)))

(declare-fun c!43779 () Bool)

(assert (=> b!258414 (= c!43779 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24566 () Bool)

(assert (=> bm!24566 (= call!24568 (contains!1854 lt!130110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258415 () Bool)

(assert (=> b!258415 (= e!167497 call!24570)))

(declare-fun bm!24567 () Bool)

(assert (=> bm!24567 (= call!24565 call!24566)))

(declare-fun b!258416 () Bool)

(declare-fun Unit!8006 () Unit!7989)

(assert (=> b!258416 (= e!167491 Unit!8006)))

(declare-fun b!258417 () Bool)

(assert (=> b!258417 (= e!167497 call!24565)))

(assert (= (and d!62015 c!43780) b!258411))

(assert (= (and d!62015 (not c!43780)) b!258404))

(assert (= (and b!258404 c!43781) b!258407))

(assert (= (and b!258404 (not c!43781)) b!258401))

(assert (= (and b!258401 c!43778) b!258417))

(assert (= (and b!258401 (not c!43778)) b!258415))

(assert (= (or b!258417 b!258415) bm!24561))

(assert (= (or b!258407 bm!24561) bm!24563))

(assert (= (or b!258407 b!258417) bm!24567))

(assert (= (or b!258411 bm!24563) bm!24565))

(assert (= (or b!258411 bm!24567) bm!24564))

(assert (= (and d!62015 res!126369) b!258399))

(assert (= (and d!62015 c!43776) b!258397))

(assert (= (and d!62015 (not c!43776)) b!258416))

(assert (= (and d!62015 res!126368) b!258405))

(assert (= (and b!258405 res!126363) b!258412))

(assert (= (and b!258405 (not res!126367)) b!258409))

(assert (= (and b!258409 res!126364) b!258408))

(assert (= (and b!258405 res!126361) b!258414))

(assert (= (and b!258414 c!43779) b!258402))

(assert (= (and b!258414 (not c!43779)) b!258413))

(assert (= (and b!258402 res!126366) b!258398))

(assert (= (or b!258402 b!258413) bm!24566))

(assert (= (and b!258414 res!126365) b!258403))

(assert (= (and b!258403 c!43777) b!258406))

(assert (= (and b!258403 (not c!43777)) b!258400))

(assert (= (and b!258406 res!126362) b!258410))

(assert (= (or b!258406 b!258400) bm!24562))

(declare-fun b_lambda!8225 () Bool)

(assert (=> (not b_lambda!8225) (not b!258408)))

(assert (=> b!258408 t!8782))

(declare-fun b_and!13837 () Bool)

(assert (= b_and!13835 (and (=> t!8782 result!5383) b_and!13837)))

(declare-fun m!273873 () Bool)

(assert (=> b!258397 m!273873))

(declare-fun m!273875 () Bool)

(assert (=> b!258397 m!273875))

(declare-fun m!273877 () Bool)

(assert (=> b!258397 m!273877))

(declare-fun m!273879 () Bool)

(assert (=> b!258397 m!273879))

(declare-fun m!273881 () Bool)

(assert (=> b!258397 m!273881))

(declare-fun m!273883 () Bool)

(assert (=> b!258397 m!273883))

(declare-fun m!273885 () Bool)

(assert (=> b!258397 m!273885))

(declare-fun m!273887 () Bool)

(assert (=> b!258397 m!273887))

(declare-fun m!273889 () Bool)

(assert (=> b!258397 m!273889))

(declare-fun m!273891 () Bool)

(assert (=> b!258397 m!273891))

(declare-fun m!273893 () Bool)

(assert (=> b!258397 m!273893))

(assert (=> b!258397 m!273881))

(assert (=> b!258397 m!273889))

(assert (=> b!258397 m!273875))

(declare-fun m!273895 () Bool)

(assert (=> b!258397 m!273895))

(assert (=> b!258397 m!273887))

(declare-fun m!273897 () Bool)

(assert (=> b!258397 m!273897))

(declare-fun m!273899 () Bool)

(assert (=> b!258397 m!273899))

(declare-fun m!273901 () Bool)

(assert (=> b!258397 m!273901))

(declare-fun m!273903 () Bool)

(assert (=> b!258397 m!273903))

(declare-fun m!273905 () Bool)

(assert (=> b!258397 m!273905))

(declare-fun m!273907 () Bool)

(assert (=> bm!24562 m!273907))

(assert (=> b!258399 m!273873))

(assert (=> b!258399 m!273873))

(declare-fun m!273909 () Bool)

(assert (=> b!258399 m!273909))

(declare-fun m!273911 () Bool)

(assert (=> b!258410 m!273911))

(declare-fun m!273913 () Bool)

(assert (=> b!258398 m!273913))

(assert (=> b!258412 m!273873))

(assert (=> b!258412 m!273873))

(assert (=> b!258412 m!273909))

(assert (=> b!258409 m!273873))

(assert (=> b!258409 m!273873))

(declare-fun m!273915 () Bool)

(assert (=> b!258409 m!273915))

(declare-fun m!273917 () Bool)

(assert (=> b!258411 m!273917))

(assert (=> bm!24565 m!273905))

(assert (=> b!258408 m!273741))

(assert (=> b!258408 m!273743))

(assert (=> b!258408 m!273745))

(assert (=> b!258408 m!273873))

(assert (=> b!258408 m!273743))

(assert (=> b!258408 m!273741))

(assert (=> b!258408 m!273873))

(declare-fun m!273919 () Bool)

(assert (=> b!258408 m!273919))

(declare-fun m!273921 () Bool)

(assert (=> bm!24564 m!273921))

(declare-fun m!273923 () Bool)

(assert (=> bm!24566 m!273923))

(assert (=> d!62015 m!273459))

(assert (=> b!258160 d!62015))

(declare-fun d!62017 () Bool)

(declare-fun e!167500 () Bool)

(assert (=> d!62017 e!167500))

(declare-fun res!126370 () Bool)

(assert (=> d!62017 (=> (not res!126370) (not e!167500))))

(declare-fun lt!130128 () ListLongMap!3757)

(assert (=> d!62017 (= res!126370 (contains!1854 lt!130128 (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130130 () List!3720)

(assert (=> d!62017 (= lt!130128 (ListLongMap!3758 lt!130130))))

(declare-fun lt!130129 () Unit!7989)

(declare-fun lt!130127 () Unit!7989)

(assert (=> d!62017 (= lt!130129 lt!130127)))

(assert (=> d!62017 (= (getValueByKey!314 lt!130130 (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!62017 (= lt!130127 (lemmaContainsTupThenGetReturnValue!170 lt!130130 (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!62017 (= lt!130130 (insertStrictlySorted!173 (toList!1894 call!24558) (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!62017 (= (+!691 call!24558 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) lt!130128)))

(declare-fun b!258418 () Bool)

(declare-fun res!126371 () Bool)

(assert (=> b!258418 (=> (not res!126371) (not e!167500))))

(assert (=> b!258418 (= res!126371 (= (getValueByKey!314 (toList!1894 lt!130128) (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun b!258419 () Bool)

(assert (=> b!258419 (= e!167500 (contains!1857 (toList!1894 lt!130128) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(assert (= (and d!62017 res!126370) b!258418))

(assert (= (and b!258418 res!126371) b!258419))

(declare-fun m!273925 () Bool)

(assert (=> d!62017 m!273925))

(declare-fun m!273927 () Bool)

(assert (=> d!62017 m!273927))

(declare-fun m!273929 () Bool)

(assert (=> d!62017 m!273929))

(declare-fun m!273931 () Bool)

(assert (=> d!62017 m!273931))

(declare-fun m!273933 () Bool)

(assert (=> b!258418 m!273933))

(declare-fun m!273935 () Bool)

(assert (=> b!258419 m!273935))

(assert (=> b!258361 d!62017))

(declare-fun d!62019 () Bool)

(declare-fun lt!130131 () (_ BitVec 32))

(assert (=> d!62019 (and (bvsge lt!130131 #b00000000000000000000000000000000) (bvsle lt!130131 (bvsub (size!6289 lt!129838) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun e!167502 () (_ BitVec 32))

(assert (=> d!62019 (= lt!130131 e!167502)))

(declare-fun c!43783 () Bool)

(assert (=> d!62019 (= c!43783 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62019 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6289 lt!129838)))))

(assert (=> d!62019 (= (arrayCountValidKeys!0 lt!129838 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!130131)))

(declare-fun bm!24568 () Bool)

(declare-fun call!24571 () (_ BitVec 32))

(assert (=> bm!24568 (= call!24571 (arrayCountValidKeys!0 lt!129838 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!258420 () Bool)

(declare-fun e!167501 () (_ BitVec 32))

(assert (=> b!258420 (= e!167502 e!167501)))

(declare-fun c!43782 () Bool)

(assert (=> b!258420 (= c!43782 (validKeyInArray!0 (select (arr!5942 lt!129838) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun b!258421 () Bool)

(assert (=> b!258421 (= e!167501 call!24571)))

(declare-fun b!258422 () Bool)

(assert (=> b!258422 (= e!167502 #b00000000000000000000000000000000)))

(declare-fun b!258423 () Bool)

(assert (=> b!258423 (= e!167501 (bvadd #b00000000000000000000000000000001 call!24571))))

(assert (= (and d!62019 c!43783) b!258422))

(assert (= (and d!62019 (not c!43783)) b!258420))

(assert (= (and b!258420 c!43782) b!258423))

(assert (= (and b!258420 (not c!43782)) b!258421))

(assert (= (or b!258423 b!258421) bm!24568))

(declare-fun m!273937 () Bool)

(assert (=> bm!24568 m!273937))

(declare-fun m!273939 () Bool)

(assert (=> b!258420 m!273939))

(assert (=> b!258420 m!273939))

(declare-fun m!273941 () Bool)

(assert (=> b!258420 m!273941))

(assert (=> bm!24524 d!62019))

(assert (=> bm!24551 d!61971))

(declare-fun d!62021 () Bool)

(declare-fun lt!130132 () (_ BitVec 32))

(assert (=> d!62021 (and (bvsge lt!130132 #b00000000000000000000000000000000) (bvsle lt!130132 (bvsub (size!6289 (_keys!6930 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!167504 () (_ BitVec 32))

(assert (=> d!62021 (= lt!130132 e!167504)))

(declare-fun c!43785 () Bool)

(assert (=> d!62021 (= c!43785 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!62021 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6289 (_keys!6930 thiss!1504)) (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!62021 (= (arrayCountValidKeys!0 (_keys!6930 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))) lt!130132)))

(declare-fun bm!24569 () Bool)

(declare-fun call!24572 () (_ BitVec 32))

(assert (=> bm!24569 (= call!24572 (arrayCountValidKeys!0 (_keys!6930 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258424 () Bool)

(declare-fun e!167503 () (_ BitVec 32))

(assert (=> b!258424 (= e!167504 e!167503)))

(declare-fun c!43784 () Bool)

(assert (=> b!258424 (= c!43784 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258425 () Bool)

(assert (=> b!258425 (= e!167503 call!24572)))

(declare-fun b!258426 () Bool)

(assert (=> b!258426 (= e!167504 #b00000000000000000000000000000000)))

(declare-fun b!258427 () Bool)

(assert (=> b!258427 (= e!167503 (bvadd #b00000000000000000000000000000001 call!24572))))

(assert (= (and d!62021 c!43785) b!258426))

(assert (= (and d!62021 (not c!43785)) b!258424))

(assert (= (and b!258424 c!43784) b!258427))

(assert (= (and b!258424 (not c!43784)) b!258425))

(assert (= (or b!258427 b!258425) bm!24569))

(declare-fun m!273943 () Bool)

(assert (=> bm!24569 m!273943))

(declare-fun m!273945 () Bool)

(assert (=> b!258424 m!273945))

(assert (=> b!258424 m!273945))

(declare-fun m!273947 () Bool)

(assert (=> b!258424 m!273947))

(assert (=> bm!24525 d!62021))

(declare-fun b!258452 () Bool)

(declare-fun e!167520 () ListLongMap!3757)

(declare-fun call!24575 () ListLongMap!3757)

(assert (=> b!258452 (= e!167520 call!24575)))

(declare-fun b!258453 () Bool)

(declare-fun e!167519 () Bool)

(declare-fun e!167521 () Bool)

(assert (=> b!258453 (= e!167519 e!167521)))

(declare-fun c!43796 () Bool)

(declare-fun e!167525 () Bool)

(assert (=> b!258453 (= c!43796 e!167525)))

(declare-fun res!126383 () Bool)

(assert (=> b!258453 (=> (not res!126383) (not e!167525))))

(assert (=> b!258453 (= res!126383 (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258454 () Bool)

(declare-fun res!126381 () Bool)

(assert (=> b!258454 (=> (not res!126381) (not e!167519))))

(declare-fun lt!130151 () ListLongMap!3757)

(assert (=> b!258454 (= res!126381 (not (contains!1854 lt!130151 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258455 () Bool)

(declare-fun e!167522 () ListLongMap!3757)

(assert (=> b!258455 (= e!167522 e!167520)))

(declare-fun c!43795 () Bool)

(assert (=> b!258455 (= c!43795 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258456 () Bool)

(assert (=> b!258456 (= e!167522 (ListLongMap!3758 Nil!3717))))

(declare-fun b!258457 () Bool)

(declare-fun e!167523 () Bool)

(assert (=> b!258457 (= e!167521 e!167523)))

(declare-fun c!43794 () Bool)

(assert (=> b!258457 (= c!43794 (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258459 () Bool)

(assert (=> b!258459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> b!258459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6288 (_values!4743 thiss!1504))))))

(declare-fun e!167524 () Bool)

(assert (=> b!258459 (= e!167524 (= (apply!255 lt!130151 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)) (get!3062 (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!24572 () Bool)

(assert (=> bm!24572 (= call!24575 (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504)))))

(declare-fun b!258460 () Bool)

(declare-fun isEmpty!538 (ListLongMap!3757) Bool)

(assert (=> b!258460 (= e!167523 (isEmpty!538 lt!130151))))

(declare-fun b!258461 () Bool)

(assert (=> b!258461 (= e!167521 e!167524)))

(assert (=> b!258461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun res!126382 () Bool)

(assert (=> b!258461 (= res!126382 (contains!1854 lt!130151 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258461 (=> (not res!126382) (not e!167524))))

(declare-fun b!258462 () Bool)

(assert (=> b!258462 (= e!167525 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258462 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!258463 () Bool)

(declare-fun lt!130147 () Unit!7989)

(declare-fun lt!130150 () Unit!7989)

(assert (=> b!258463 (= lt!130147 lt!130150)))

(declare-fun lt!130149 () ListLongMap!3757)

(declare-fun lt!130153 () (_ BitVec 64))

(declare-fun lt!130148 () (_ BitVec 64))

(declare-fun lt!130152 () V!8449)

(assert (=> b!258463 (not (contains!1854 (+!691 lt!130149 (tuple2!4843 lt!130153 lt!130152)) lt!130148))))

(declare-fun addStillNotContains!127 (ListLongMap!3757 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7989)

(assert (=> b!258463 (= lt!130150 (addStillNotContains!127 lt!130149 lt!130153 lt!130152 lt!130148))))

(assert (=> b!258463 (= lt!130148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!258463 (= lt!130152 (get!3062 (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258463 (= lt!130153 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258463 (= lt!130149 call!24575)))

(assert (=> b!258463 (= e!167520 (+!691 call!24575 (tuple2!4843 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000) (get!3062 (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258458 () Bool)

(assert (=> b!258458 (= e!167523 (= lt!130151 (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504))))))

(declare-fun d!62023 () Bool)

(assert (=> d!62023 e!167519))

(declare-fun res!126380 () Bool)

(assert (=> d!62023 (=> (not res!126380) (not e!167519))))

(assert (=> d!62023 (= res!126380 (not (contains!1854 lt!130151 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62023 (= lt!130151 e!167522)))

(declare-fun c!43797 () Bool)

(assert (=> d!62023 (= c!43797 (bvsge #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!62023 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!62023 (= (getCurrentListMapNoExtraKeys!571 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!130151)))

(assert (= (and d!62023 c!43797) b!258456))

(assert (= (and d!62023 (not c!43797)) b!258455))

(assert (= (and b!258455 c!43795) b!258463))

(assert (= (and b!258455 (not c!43795)) b!258452))

(assert (= (or b!258463 b!258452) bm!24572))

(assert (= (and d!62023 res!126380) b!258454))

(assert (= (and b!258454 res!126381) b!258453))

(assert (= (and b!258453 res!126383) b!258462))

(assert (= (and b!258453 c!43796) b!258461))

(assert (= (and b!258453 (not c!43796)) b!258457))

(assert (= (and b!258461 res!126382) b!258459))

(assert (= (and b!258457 c!43794) b!258458))

(assert (= (and b!258457 (not c!43794)) b!258460))

(declare-fun b_lambda!8227 () Bool)

(assert (=> (not b_lambda!8227) (not b!258459)))

(assert (=> b!258459 t!8782))

(declare-fun b_and!13839 () Bool)

(assert (= b_and!13837 (and (=> t!8782 result!5383) b_and!13839)))

(declare-fun b_lambda!8229 () Bool)

(assert (=> (not b_lambda!8229) (not b!258463)))

(assert (=> b!258463 t!8782))

(declare-fun b_and!13841 () Bool)

(assert (= b_and!13839 (and (=> t!8782 result!5383) b_and!13841)))

(assert (=> b!258459 m!273743))

(assert (=> b!258459 m!273835))

(assert (=> b!258459 m!273743))

(assert (=> b!258459 m!273837))

(assert (=> b!258459 m!273835))

(assert (=> b!258459 m!273687))

(declare-fun m!273949 () Bool)

(assert (=> b!258459 m!273949))

(assert (=> b!258459 m!273687))

(declare-fun m!273951 () Bool)

(assert (=> b!258460 m!273951))

(declare-fun m!273953 () Bool)

(assert (=> b!258463 m!273953))

(assert (=> b!258463 m!273743))

(assert (=> b!258463 m!273835))

(assert (=> b!258463 m!273743))

(assert (=> b!258463 m!273837))

(assert (=> b!258463 m!273687))

(assert (=> b!258463 m!273835))

(declare-fun m!273955 () Bool)

(assert (=> b!258463 m!273955))

(declare-fun m!273957 () Bool)

(assert (=> b!258463 m!273957))

(assert (=> b!258463 m!273953))

(declare-fun m!273959 () Bool)

(assert (=> b!258463 m!273959))

(declare-fun m!273961 () Bool)

(assert (=> d!62023 m!273961))

(assert (=> d!62023 m!273459))

(assert (=> b!258462 m!273687))

(assert (=> b!258462 m!273687))

(assert (=> b!258462 m!273697))

(assert (=> b!258461 m!273687))

(assert (=> b!258461 m!273687))

(declare-fun m!273963 () Bool)

(assert (=> b!258461 m!273963))

(assert (=> b!258455 m!273687))

(assert (=> b!258455 m!273687))

(assert (=> b!258455 m!273697))

(declare-fun m!273965 () Bool)

(assert (=> bm!24572 m!273965))

(assert (=> b!258458 m!273965))

(declare-fun m!273967 () Bool)

(assert (=> b!258454 m!273967))

(assert (=> bm!24557 d!62023))

(declare-fun d!62025 () Bool)

(assert (=> d!62025 (= (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)) (and (not (= (select (arr!5942 lt!129838) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5942 lt!129838) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258156 d!62025))

(declare-fun b!258464 () Bool)

(declare-fun e!167526 () Bool)

(declare-fun call!24576 () Bool)

(assert (=> b!258464 (= e!167526 call!24576)))

(declare-fun bm!24573 () Bool)

(assert (=> bm!24573 (= call!24576 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (mask!11057 thiss!1504)))))

(declare-fun d!62027 () Bool)

(declare-fun res!126384 () Bool)

(declare-fun e!167528 () Bool)

(assert (=> d!62027 (=> res!126384 e!167528)))

(assert (=> d!62027 (= res!126384 (bvsge #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))

(assert (=> d!62027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (mask!11057 thiss!1504)) e!167528)))

(declare-fun b!258465 () Bool)

(declare-fun e!167527 () Bool)

(assert (=> b!258465 (= e!167526 e!167527)))

(declare-fun lt!130154 () (_ BitVec 64))

(assert (=> b!258465 (= lt!130154 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130155 () Unit!7989)

(assert (=> b!258465 (= lt!130155 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) lt!130154 #b00000000000000000000000000000000))))

(assert (=> b!258465 (arrayContainsKey!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) lt!130154 #b00000000000000000000000000000000)))

(declare-fun lt!130156 () Unit!7989)

(assert (=> b!258465 (= lt!130156 lt!130155)))

(declare-fun res!126385 () Bool)

(assert (=> b!258465 (= res!126385 (= (seekEntryOrOpen!0 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000) (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (mask!11057 thiss!1504)) (Found!1141 #b00000000000000000000000000000000)))))

(assert (=> b!258465 (=> (not res!126385) (not e!167527))))

(declare-fun b!258466 () Bool)

(assert (=> b!258466 (= e!167528 e!167526)))

(declare-fun c!43798 () Bool)

(assert (=> b!258466 (= c!43798 (validKeyInArray!0 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258467 () Bool)

(assert (=> b!258467 (= e!167527 call!24576)))

(assert (= (and d!62027 (not res!126384)) b!258466))

(assert (= (and b!258466 c!43798) b!258465))

(assert (= (and b!258466 (not c!43798)) b!258464))

(assert (= (and b!258465 res!126385) b!258467))

(assert (= (or b!258467 b!258464) bm!24573))

(declare-fun m!273969 () Bool)

(assert (=> bm!24573 m!273969))

(assert (=> b!258465 m!273873))

(declare-fun m!273971 () Bool)

(assert (=> b!258465 m!273971))

(declare-fun m!273973 () Bool)

(assert (=> b!258465 m!273973))

(assert (=> b!258465 m!273873))

(declare-fun m!273975 () Bool)

(assert (=> b!258465 m!273975))

(assert (=> b!258466 m!273873))

(assert (=> b!258466 m!273873))

(assert (=> b!258466 m!273909))

(assert (=> b!258220 d!62027))

(declare-fun d!62029 () Bool)

(declare-fun e!167529 () Bool)

(assert (=> d!62029 e!167529))

(declare-fun res!126386 () Bool)

(assert (=> d!62029 (=> (not res!126386) (not e!167529))))

(declare-fun lt!130158 () ListLongMap!3757)

(assert (=> d!62029 (= res!126386 (contains!1854 lt!130158 (_1!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun lt!130160 () List!3720)

(assert (=> d!62029 (= lt!130158 (ListLongMap!3758 lt!130160))))

(declare-fun lt!130159 () Unit!7989)

(declare-fun lt!130157 () Unit!7989)

(assert (=> d!62029 (= lt!130159 lt!130157)))

(assert (=> d!62029 (= (getValueByKey!314 lt!130160 (_1!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!319 (_2!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!62029 (= lt!130157 (lemmaContainsTupThenGetReturnValue!170 lt!130160 (_1!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!62029 (= lt!130160 (insertStrictlySorted!173 (toList!1894 (ite c!43748 call!24548 (ite c!43749 call!24546 call!24549))) (_1!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!62029 (= (+!691 (ite c!43748 call!24548 (ite c!43749 call!24546 call!24549)) (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) lt!130158)))

(declare-fun b!258468 () Bool)

(declare-fun res!126387 () Bool)

(assert (=> b!258468 (=> (not res!126387) (not e!167529))))

(assert (=> b!258468 (= res!126387 (= (getValueByKey!314 (toList!1894 lt!130158) (_1!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!319 (_2!2432 (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))))

(declare-fun b!258469 () Bool)

(assert (=> b!258469 (= e!167529 (contains!1857 (toList!1894 lt!130158) (ite (or c!43748 c!43749) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (= (and d!62029 res!126386) b!258468))

(assert (= (and b!258468 res!126387) b!258469))

(declare-fun m!273977 () Bool)

(assert (=> d!62029 m!273977))

(declare-fun m!273979 () Bool)

(assert (=> d!62029 m!273979))

(declare-fun m!273981 () Bool)

(assert (=> d!62029 m!273981))

(declare-fun m!273983 () Bool)

(assert (=> d!62029 m!273983))

(declare-fun m!273985 () Bool)

(assert (=> b!258468 m!273985))

(declare-fun m!273987 () Bool)

(assert (=> b!258469 m!273987))

(assert (=> bm!24543 d!62029))

(declare-fun d!62031 () Bool)

(declare-fun e!167531 () Bool)

(assert (=> d!62031 e!167531))

(declare-fun res!126388 () Bool)

(assert (=> d!62031 (=> res!126388 e!167531)))

(declare-fun lt!130163 () Bool)

(assert (=> d!62031 (= res!126388 (not lt!130163))))

(declare-fun lt!130162 () Bool)

(assert (=> d!62031 (= lt!130163 lt!130162)))

(declare-fun lt!130161 () Unit!7989)

(declare-fun e!167530 () Unit!7989)

(assert (=> d!62031 (= lt!130161 e!167530)))

(declare-fun c!43799 () Bool)

(assert (=> d!62031 (= c!43799 lt!130162)))

(assert (=> d!62031 (= lt!130162 (containsKey!305 (toList!1894 lt!130019) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62031 (= (contains!1854 lt!130019 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130163)))

(declare-fun b!258470 () Bool)

(declare-fun lt!130164 () Unit!7989)

(assert (=> b!258470 (= e!167530 lt!130164)))

(assert (=> b!258470 (= lt!130164 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!130019) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258470 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130019) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258471 () Bool)

(declare-fun Unit!8007 () Unit!7989)

(assert (=> b!258471 (= e!167530 Unit!8007)))

(declare-fun b!258472 () Bool)

(assert (=> b!258472 (= e!167531 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62031 c!43799) b!258470))

(assert (= (and d!62031 (not c!43799)) b!258471))

(assert (= (and d!62031 (not res!126388)) b!258472))

(declare-fun m!273989 () Bool)

(assert (=> d!62031 m!273989))

(declare-fun m!273991 () Bool)

(assert (=> b!258470 m!273991))

(declare-fun m!273993 () Bool)

(assert (=> b!258470 m!273993))

(assert (=> b!258470 m!273993))

(declare-fun m!273995 () Bool)

(assert (=> b!258470 m!273995))

(assert (=> b!258472 m!273993))

(assert (=> b!258472 m!273993))

(assert (=> b!258472 m!273995))

(assert (=> bm!24541 d!62031))

(declare-fun d!62033 () Bool)

(assert (=> d!62033 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258213 d!62033))

(declare-fun d!62035 () Bool)

(declare-fun res!126393 () Bool)

(declare-fun e!167536 () Bool)

(assert (=> d!62035 (=> res!126393 e!167536)))

(assert (=> d!62035 (= res!126393 (and ((_ is Cons!3716) (toList!1894 lt!129839)) (= (_1!2432 (h!4378 (toList!1894 lt!129839))) key!932)))))

(assert (=> d!62035 (= (containsKey!305 (toList!1894 lt!129839) key!932) e!167536)))

(declare-fun b!258477 () Bool)

(declare-fun e!167537 () Bool)

(assert (=> b!258477 (= e!167536 e!167537)))

(declare-fun res!126394 () Bool)

(assert (=> b!258477 (=> (not res!126394) (not e!167537))))

(assert (=> b!258477 (= res!126394 (and (or (not ((_ is Cons!3716) (toList!1894 lt!129839))) (bvsle (_1!2432 (h!4378 (toList!1894 lt!129839))) key!932)) ((_ is Cons!3716) (toList!1894 lt!129839)) (bvslt (_1!2432 (h!4378 (toList!1894 lt!129839))) key!932)))))

(declare-fun b!258478 () Bool)

(assert (=> b!258478 (= e!167537 (containsKey!305 (t!8775 (toList!1894 lt!129839)) key!932))))

(assert (= (and d!62035 (not res!126393)) b!258477))

(assert (= (and b!258477 res!126394) b!258478))

(declare-fun m!273997 () Bool)

(assert (=> b!258478 m!273997))

(assert (=> d!61993 d!62035))

(declare-fun d!62037 () Bool)

(declare-fun e!167539 () Bool)

(assert (=> d!62037 e!167539))

(declare-fun res!126395 () Bool)

(assert (=> d!62037 (=> res!126395 e!167539)))

(declare-fun lt!130167 () Bool)

(assert (=> d!62037 (= res!126395 (not lt!130167))))

(declare-fun lt!130166 () Bool)

(assert (=> d!62037 (= lt!130167 lt!130166)))

(declare-fun lt!130165 () Unit!7989)

(declare-fun e!167538 () Unit!7989)

(assert (=> d!62037 (= lt!130165 e!167538)))

(declare-fun c!43800 () Bool)

(assert (=> d!62037 (= c!43800 lt!130166)))

(assert (=> d!62037 (= lt!130166 (containsKey!305 (toList!1894 lt!130077) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62037 (= (contains!1854 lt!130077 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130167)))

(declare-fun b!258479 () Bool)

(declare-fun lt!130168 () Unit!7989)

(assert (=> b!258479 (= e!167538 lt!130168)))

(assert (=> b!258479 (= lt!130168 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!130077) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258479 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130077) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258480 () Bool)

(declare-fun Unit!8008 () Unit!7989)

(assert (=> b!258480 (= e!167538 Unit!8008)))

(declare-fun b!258481 () Bool)

(assert (=> b!258481 (= e!167539 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130077) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62037 c!43800) b!258479))

(assert (= (and d!62037 (not c!43800)) b!258480))

(assert (= (and d!62037 (not res!126395)) b!258481))

(declare-fun m!273999 () Bool)

(assert (=> d!62037 m!273999))

(declare-fun m!274001 () Bool)

(assert (=> b!258479 m!274001))

(declare-fun m!274003 () Bool)

(assert (=> b!258479 m!274003))

(assert (=> b!258479 m!274003))

(declare-fun m!274005 () Bool)

(assert (=> b!258479 m!274005))

(assert (=> b!258481 m!274003))

(assert (=> b!258481 m!274003))

(assert (=> b!258481 m!274005))

(assert (=> bm!24558 d!62037))

(declare-fun d!62039 () Bool)

(assert (=> d!62039 (= (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258349 d!62039))

(declare-fun d!62041 () Bool)

(assert (=> d!62041 (= (inRange!0 (ite c!43764 (index!6734 lt!130058) (index!6737 lt!130058)) (mask!11057 thiss!1504)) (and (bvsge (ite c!43764 (index!6734 lt!130058) (index!6737 lt!130058)) #b00000000000000000000000000000000) (bvslt (ite c!43764 (index!6734 lt!130058) (index!6737 lt!130058)) (bvadd (mask!11057 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24552 d!62041))

(declare-fun d!62043 () Bool)

(declare-fun get!3063 (Option!320) V!8449)

(assert (=> d!62043 (= (apply!255 lt!130087 lt!130083) (get!3063 (getValueByKey!314 (toList!1894 lt!130087) lt!130083)))))

(declare-fun bs!9112 () Bool)

(assert (= bs!9112 d!62043))

(declare-fun m!274007 () Bool)

(assert (=> bs!9112 m!274007))

(assert (=> bs!9112 m!274007))

(declare-fun m!274009 () Bool)

(assert (=> bs!9112 m!274009))

(assert (=> b!258347 d!62043))

(declare-fun d!62045 () Bool)

(declare-fun e!167540 () Bool)

(assert (=> d!62045 e!167540))

(declare-fun res!126396 () Bool)

(assert (=> d!62045 (=> (not res!126396) (not e!167540))))

(declare-fun lt!130170 () ListLongMap!3757)

(assert (=> d!62045 (= res!126396 (contains!1854 lt!130170 (_1!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130172 () List!3720)

(assert (=> d!62045 (= lt!130170 (ListLongMap!3758 lt!130172))))

(declare-fun lt!130171 () Unit!7989)

(declare-fun lt!130169 () Unit!7989)

(assert (=> d!62045 (= lt!130171 lt!130169)))

(assert (=> d!62045 (= (getValueByKey!314 lt!130172 (_1!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504)))))))

(assert (=> d!62045 (= lt!130169 (lemmaContainsTupThenGetReturnValue!170 lt!130172 (_1!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504)))))))

(assert (=> d!62045 (= lt!130172 (insertStrictlySorted!173 (toList!1894 lt!130090) (_1!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504)))))))

(assert (=> d!62045 (= (+!691 lt!130090 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))) lt!130170)))

(declare-fun b!258482 () Bool)

(declare-fun res!126397 () Bool)

(assert (=> b!258482 (=> (not res!126397) (not e!167540))))

(assert (=> b!258482 (= res!126397 (= (getValueByKey!314 (toList!1894 lt!130170) (_1!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))))))))

(declare-fun b!258483 () Bool)

(assert (=> b!258483 (= e!167540 (contains!1857 (toList!1894 lt!130170) (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))))))

(assert (= (and d!62045 res!126396) b!258482))

(assert (= (and b!258482 res!126397) b!258483))

(declare-fun m!274011 () Bool)

(assert (=> d!62045 m!274011))

(declare-fun m!274013 () Bool)

(assert (=> d!62045 m!274013))

(declare-fun m!274015 () Bool)

(assert (=> d!62045 m!274015))

(declare-fun m!274017 () Bool)

(assert (=> d!62045 m!274017))

(declare-fun m!274019 () Bool)

(assert (=> b!258482 m!274019))

(declare-fun m!274021 () Bool)

(assert (=> b!258483 m!274021))

(assert (=> b!258347 d!62045))

(declare-fun d!62047 () Bool)

(assert (=> d!62047 (contains!1854 (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))) lt!130072)))

(declare-fun lt!130175 () Unit!7989)

(declare-fun choose!1255 (ListLongMap!3757 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7989)

(assert (=> d!62047 (= lt!130175 (choose!1255 lt!130076 lt!130079 (zeroValue!4601 thiss!1504) lt!130072))))

(assert (=> d!62047 (contains!1854 lt!130076 lt!130072)))

(assert (=> d!62047 (= (addStillContains!231 lt!130076 lt!130079 (zeroValue!4601 thiss!1504) lt!130072) lt!130175)))

(declare-fun bs!9113 () Bool)

(assert (= bs!9113 d!62047))

(assert (=> bs!9113 m!273805))

(assert (=> bs!9113 m!273805))

(assert (=> bs!9113 m!273815))

(declare-fun m!274023 () Bool)

(assert (=> bs!9113 m!274023))

(declare-fun m!274025 () Bool)

(assert (=> bs!9113 m!274025))

(assert (=> b!258347 d!62047))

(declare-fun d!62049 () Bool)

(assert (=> d!62049 (= (apply!255 lt!130082 lt!130074) (get!3063 (getValueByKey!314 (toList!1894 lt!130082) lt!130074)))))

(declare-fun bs!9114 () Bool)

(assert (= bs!9114 d!62049))

(declare-fun m!274027 () Bool)

(assert (=> bs!9114 m!274027))

(assert (=> bs!9114 m!274027))

(declare-fun m!274029 () Bool)

(assert (=> bs!9114 m!274029))

(assert (=> b!258347 d!62049))

(declare-fun d!62051 () Bool)

(declare-fun e!167541 () Bool)

(assert (=> d!62051 e!167541))

(declare-fun res!126398 () Bool)

(assert (=> d!62051 (=> (not res!126398) (not e!167541))))

(declare-fun lt!130177 () ListLongMap!3757)

(assert (=> d!62051 (= res!126398 (contains!1854 lt!130177 (_1!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!130179 () List!3720)

(assert (=> d!62051 (= lt!130177 (ListLongMap!3758 lt!130179))))

(declare-fun lt!130178 () Unit!7989)

(declare-fun lt!130176 () Unit!7989)

(assert (=> d!62051 (= lt!130178 lt!130176)))

(assert (=> d!62051 (= (getValueByKey!314 lt!130179 (_1!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62051 (= lt!130176 (lemmaContainsTupThenGetReturnValue!170 lt!130179 (_1!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62051 (= lt!130179 (insertStrictlySorted!173 (toList!1894 lt!130082) (_1!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62051 (= (+!691 lt!130082 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))) lt!130177)))

(declare-fun b!258485 () Bool)

(declare-fun res!126399 () Bool)

(assert (=> b!258485 (=> (not res!126399) (not e!167541))))

(assert (=> b!258485 (= res!126399 (= (getValueByKey!314 (toList!1894 lt!130177) (_1!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258486 () Bool)

(assert (=> b!258486 (= e!167541 (contains!1857 (toList!1894 lt!130177) (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!62051 res!126398) b!258485))

(assert (= (and b!258485 res!126399) b!258486))

(declare-fun m!274031 () Bool)

(assert (=> d!62051 m!274031))

(declare-fun m!274033 () Bool)

(assert (=> d!62051 m!274033))

(declare-fun m!274035 () Bool)

(assert (=> d!62051 m!274035))

(declare-fun m!274037 () Bool)

(assert (=> d!62051 m!274037))

(declare-fun m!274039 () Bool)

(assert (=> b!258485 m!274039))

(declare-fun m!274041 () Bool)

(assert (=> b!258486 m!274041))

(assert (=> b!258347 d!62051))

(declare-fun d!62053 () Bool)

(assert (=> d!62053 (= (apply!255 (+!691 lt!130082 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))) lt!130074) (apply!255 lt!130082 lt!130074))))

(declare-fun lt!130182 () Unit!7989)

(declare-fun choose!1256 (ListLongMap!3757 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7989)

(assert (=> d!62053 (= lt!130182 (choose!1256 lt!130082 lt!130093 (zeroValue!4601 thiss!1504) lt!130074))))

(declare-fun e!167544 () Bool)

(assert (=> d!62053 e!167544))

(declare-fun res!126402 () Bool)

(assert (=> d!62053 (=> (not res!126402) (not e!167544))))

(assert (=> d!62053 (= res!126402 (contains!1854 lt!130082 lt!130074))))

(assert (=> d!62053 (= (addApplyDifferent!231 lt!130082 lt!130093 (zeroValue!4601 thiss!1504) lt!130074) lt!130182)))

(declare-fun b!258490 () Bool)

(assert (=> b!258490 (= e!167544 (not (= lt!130074 lt!130093)))))

(assert (= (and d!62053 res!126402) b!258490))

(assert (=> d!62053 m!273795))

(assert (=> d!62053 m!273793))

(assert (=> d!62053 m!273813))

(assert (=> d!62053 m!273793))

(declare-fun m!274043 () Bool)

(assert (=> d!62053 m!274043))

(declare-fun m!274045 () Bool)

(assert (=> d!62053 m!274045))

(assert (=> b!258347 d!62053))

(assert (=> b!258347 d!62023))

(declare-fun d!62055 () Bool)

(assert (=> d!62055 (= (apply!255 (+!691 lt!130087 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))) lt!130083) (get!3063 (getValueByKey!314 (toList!1894 (+!691 lt!130087 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504)))) lt!130083)))))

(declare-fun bs!9115 () Bool)

(assert (= bs!9115 d!62055))

(declare-fun m!274047 () Bool)

(assert (=> bs!9115 m!274047))

(assert (=> bs!9115 m!274047))

(declare-fun m!274049 () Bool)

(assert (=> bs!9115 m!274049))

(assert (=> b!258347 d!62055))

(declare-fun d!62057 () Bool)

(assert (=> d!62057 (= (apply!255 (+!691 lt!130087 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))) lt!130083) (apply!255 lt!130087 lt!130083))))

(declare-fun lt!130183 () Unit!7989)

(assert (=> d!62057 (= lt!130183 (choose!1256 lt!130087 lt!130081 (minValue!4601 thiss!1504) lt!130083))))

(declare-fun e!167545 () Bool)

(assert (=> d!62057 e!167545))

(declare-fun res!126403 () Bool)

(assert (=> d!62057 (=> (not res!126403) (not e!167545))))

(assert (=> d!62057 (= res!126403 (contains!1854 lt!130087 lt!130083))))

(assert (=> d!62057 (= (addApplyDifferent!231 lt!130087 lt!130081 (minValue!4601 thiss!1504) lt!130083) lt!130183)))

(declare-fun b!258491 () Bool)

(assert (=> b!258491 (= e!167545 (not (= lt!130083 lt!130081)))))

(assert (= (and d!62057 res!126403) b!258491))

(assert (=> d!62057 m!273819))

(assert (=> d!62057 m!273807))

(assert (=> d!62057 m!273809))

(assert (=> d!62057 m!273807))

(declare-fun m!274051 () Bool)

(assert (=> d!62057 m!274051))

(declare-fun m!274053 () Bool)

(assert (=> d!62057 m!274053))

(assert (=> b!258347 d!62057))

(declare-fun d!62059 () Bool)

(declare-fun e!167546 () Bool)

(assert (=> d!62059 e!167546))

(declare-fun res!126404 () Bool)

(assert (=> d!62059 (=> (not res!126404) (not e!167546))))

(declare-fun lt!130185 () ListLongMap!3757)

(assert (=> d!62059 (= res!126404 (contains!1854 lt!130185 (_1!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!130187 () List!3720)

(assert (=> d!62059 (= lt!130185 (ListLongMap!3758 lt!130187))))

(declare-fun lt!130186 () Unit!7989)

(declare-fun lt!130184 () Unit!7989)

(assert (=> d!62059 (= lt!130186 lt!130184)))

(assert (=> d!62059 (= (getValueByKey!314 lt!130187 (_1!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62059 (= lt!130184 (lemmaContainsTupThenGetReturnValue!170 lt!130187 (_1!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62059 (= lt!130187 (insertStrictlySorted!173 (toList!1894 lt!130076) (_1!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62059 (= (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))) lt!130185)))

(declare-fun b!258492 () Bool)

(declare-fun res!126405 () Bool)

(assert (=> b!258492 (=> (not res!126405) (not e!167546))))

(assert (=> b!258492 (= res!126405 (= (getValueByKey!314 (toList!1894 lt!130185) (_1!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258493 () Bool)

(assert (=> b!258493 (= e!167546 (contains!1857 (toList!1894 lt!130185) (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!62059 res!126404) b!258492))

(assert (= (and b!258492 res!126405) b!258493))

(declare-fun m!274055 () Bool)

(assert (=> d!62059 m!274055))

(declare-fun m!274057 () Bool)

(assert (=> d!62059 m!274057))

(declare-fun m!274059 () Bool)

(assert (=> d!62059 m!274059))

(declare-fun m!274061 () Bool)

(assert (=> d!62059 m!274061))

(declare-fun m!274063 () Bool)

(assert (=> b!258492 m!274063))

(declare-fun m!274065 () Bool)

(assert (=> b!258493 m!274065))

(assert (=> b!258347 d!62059))

(declare-fun d!62061 () Bool)

(declare-fun e!167547 () Bool)

(assert (=> d!62061 e!167547))

(declare-fun res!126406 () Bool)

(assert (=> d!62061 (=> (not res!126406) (not e!167547))))

(declare-fun lt!130189 () ListLongMap!3757)

(assert (=> d!62061 (= res!126406 (contains!1854 lt!130189 (_1!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130191 () List!3720)

(assert (=> d!62061 (= lt!130189 (ListLongMap!3758 lt!130191))))

(declare-fun lt!130190 () Unit!7989)

(declare-fun lt!130188 () Unit!7989)

(assert (=> d!62061 (= lt!130190 lt!130188)))

(assert (=> d!62061 (= (getValueByKey!314 lt!130191 (_1!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504)))))))

(assert (=> d!62061 (= lt!130188 (lemmaContainsTupThenGetReturnValue!170 lt!130191 (_1!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504)))))))

(assert (=> d!62061 (= lt!130191 (insertStrictlySorted!173 (toList!1894 lt!130087) (_1!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504)))))))

(assert (=> d!62061 (= (+!691 lt!130087 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))) lt!130189)))

(declare-fun b!258494 () Bool)

(declare-fun res!126407 () Bool)

(assert (=> b!258494 (=> (not res!126407) (not e!167547))))

(assert (=> b!258494 (= res!126407 (= (getValueByKey!314 (toList!1894 lt!130189) (_1!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))))))))

(declare-fun b!258495 () Bool)

(assert (=> b!258495 (= e!167547 (contains!1857 (toList!1894 lt!130189) (tuple2!4843 lt!130081 (minValue!4601 thiss!1504))))))

(assert (= (and d!62061 res!126406) b!258494))

(assert (= (and b!258494 res!126407) b!258495))

(declare-fun m!274067 () Bool)

(assert (=> d!62061 m!274067))

(declare-fun m!274069 () Bool)

(assert (=> d!62061 m!274069))

(declare-fun m!274071 () Bool)

(assert (=> d!62061 m!274071))

(declare-fun m!274073 () Bool)

(assert (=> d!62061 m!274073))

(declare-fun m!274075 () Bool)

(assert (=> b!258494 m!274075))

(declare-fun m!274077 () Bool)

(assert (=> b!258495 m!274077))

(assert (=> b!258347 d!62061))

(declare-fun d!62063 () Bool)

(assert (=> d!62063 (= (apply!255 (+!691 lt!130090 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))) lt!130092) (apply!255 lt!130090 lt!130092))))

(declare-fun lt!130192 () Unit!7989)

(assert (=> d!62063 (= lt!130192 (choose!1256 lt!130090 lt!130080 (minValue!4601 thiss!1504) lt!130092))))

(declare-fun e!167548 () Bool)

(assert (=> d!62063 e!167548))

(declare-fun res!126408 () Bool)

(assert (=> d!62063 (=> (not res!126408) (not e!167548))))

(assert (=> d!62063 (= res!126408 (contains!1854 lt!130090 lt!130092))))

(assert (=> d!62063 (= (addApplyDifferent!231 lt!130090 lt!130080 (minValue!4601 thiss!1504) lt!130092) lt!130192)))

(declare-fun b!258496 () Bool)

(assert (=> b!258496 (= e!167548 (not (= lt!130092 lt!130080)))))

(assert (= (and d!62063 res!126408) b!258496))

(assert (=> d!62063 m!273821))

(assert (=> d!62063 m!273799))

(assert (=> d!62063 m!273801))

(assert (=> d!62063 m!273799))

(declare-fun m!274079 () Bool)

(assert (=> d!62063 m!274079))

(declare-fun m!274081 () Bool)

(assert (=> d!62063 m!274081))

(assert (=> b!258347 d!62063))

(declare-fun d!62065 () Bool)

(assert (=> d!62065 (= (apply!255 lt!130090 lt!130092) (get!3063 (getValueByKey!314 (toList!1894 lt!130090) lt!130092)))))

(declare-fun bs!9116 () Bool)

(assert (= bs!9116 d!62065))

(declare-fun m!274083 () Bool)

(assert (=> bs!9116 m!274083))

(assert (=> bs!9116 m!274083))

(declare-fun m!274085 () Bool)

(assert (=> bs!9116 m!274085))

(assert (=> b!258347 d!62065))

(declare-fun d!62067 () Bool)

(declare-fun e!167550 () Bool)

(assert (=> d!62067 e!167550))

(declare-fun res!126409 () Bool)

(assert (=> d!62067 (=> res!126409 e!167550)))

(declare-fun lt!130195 () Bool)

(assert (=> d!62067 (= res!126409 (not lt!130195))))

(declare-fun lt!130194 () Bool)

(assert (=> d!62067 (= lt!130195 lt!130194)))

(declare-fun lt!130193 () Unit!7989)

(declare-fun e!167549 () Unit!7989)

(assert (=> d!62067 (= lt!130193 e!167549)))

(declare-fun c!43801 () Bool)

(assert (=> d!62067 (= c!43801 lt!130194)))

(assert (=> d!62067 (= lt!130194 (containsKey!305 (toList!1894 (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))) lt!130072))))

(assert (=> d!62067 (= (contains!1854 (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504))) lt!130072) lt!130195)))

(declare-fun b!258497 () Bool)

(declare-fun lt!130196 () Unit!7989)

(assert (=> b!258497 (= e!167549 lt!130196)))

(assert (=> b!258497 (= lt!130196 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))) lt!130072))))

(assert (=> b!258497 (isDefined!254 (getValueByKey!314 (toList!1894 (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))) lt!130072))))

(declare-fun b!258498 () Bool)

(declare-fun Unit!8009 () Unit!7989)

(assert (=> b!258498 (= e!167549 Unit!8009)))

(declare-fun b!258499 () Bool)

(assert (=> b!258499 (= e!167550 (isDefined!254 (getValueByKey!314 (toList!1894 (+!691 lt!130076 (tuple2!4843 lt!130079 (zeroValue!4601 thiss!1504)))) lt!130072)))))

(assert (= (and d!62067 c!43801) b!258497))

(assert (= (and d!62067 (not c!43801)) b!258498))

(assert (= (and d!62067 (not res!126409)) b!258499))

(declare-fun m!274087 () Bool)

(assert (=> d!62067 m!274087))

(declare-fun m!274089 () Bool)

(assert (=> b!258497 m!274089))

(declare-fun m!274091 () Bool)

(assert (=> b!258497 m!274091))

(assert (=> b!258497 m!274091))

(declare-fun m!274093 () Bool)

(assert (=> b!258497 m!274093))

(assert (=> b!258499 m!274091))

(assert (=> b!258499 m!274091))

(assert (=> b!258499 m!274093))

(assert (=> b!258347 d!62067))

(declare-fun d!62069 () Bool)

(assert (=> d!62069 (= (apply!255 (+!691 lt!130090 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504))) lt!130092) (get!3063 (getValueByKey!314 (toList!1894 (+!691 lt!130090 (tuple2!4843 lt!130080 (minValue!4601 thiss!1504)))) lt!130092)))))

(declare-fun bs!9117 () Bool)

(assert (= bs!9117 d!62069))

(declare-fun m!274095 () Bool)

(assert (=> bs!9117 m!274095))

(assert (=> bs!9117 m!274095))

(declare-fun m!274097 () Bool)

(assert (=> bs!9117 m!274097))

(assert (=> b!258347 d!62069))

(declare-fun d!62071 () Bool)

(assert (=> d!62071 (= (apply!255 (+!691 lt!130082 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504))) lt!130074) (get!3063 (getValueByKey!314 (toList!1894 (+!691 lt!130082 (tuple2!4843 lt!130093 (zeroValue!4601 thiss!1504)))) lt!130074)))))

(declare-fun bs!9118 () Bool)

(assert (= bs!9118 d!62071))

(declare-fun m!274099 () Bool)

(assert (=> bs!9118 m!274099))

(assert (=> bs!9118 m!274099))

(declare-fun m!274101 () Bool)

(assert (=> bs!9118 m!274101))

(assert (=> b!258347 d!62071))

(declare-fun d!62073 () Bool)

(declare-fun lt!130197 () (_ BitVec 32))

(assert (=> d!62073 (and (bvsge lt!130197 #b00000000000000000000000000000000) (bvsle lt!130197 (bvsub (size!6289 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!167552 () (_ BitVec 32))

(assert (=> d!62073 (= lt!130197 e!167552)))

(declare-fun c!43803 () Bool)

(assert (=> d!62073 (= c!43803 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!62073 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6289 (_keys!6930 thiss!1504)) (size!6289 lt!129838)))))

(assert (=> d!62073 (= (arrayCountValidKeys!0 lt!129838 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))) lt!130197)))

(declare-fun bm!24574 () Bool)

(declare-fun call!24577 () (_ BitVec 32))

(assert (=> bm!24574 (= call!24577 (arrayCountValidKeys!0 lt!129838 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258500 () Bool)

(declare-fun e!167551 () (_ BitVec 32))

(assert (=> b!258500 (= e!167552 e!167551)))

(declare-fun c!43802 () Bool)

(assert (=> b!258500 (= c!43802 (validKeyInArray!0 (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258501 () Bool)

(assert (=> b!258501 (= e!167551 call!24577)))

(declare-fun b!258502 () Bool)

(assert (=> b!258502 (= e!167552 #b00000000000000000000000000000000)))

(declare-fun b!258503 () Bool)

(assert (=> b!258503 (= e!167551 (bvadd #b00000000000000000000000000000001 call!24577))))

(assert (= (and d!62073 c!43803) b!258502))

(assert (= (and d!62073 (not c!43803)) b!258500))

(assert (= (and b!258500 c!43802) b!258503))

(assert (= (and b!258500 (not c!43802)) b!258501))

(assert (= (or b!258503 b!258501) bm!24574))

(declare-fun m!274103 () Bool)

(assert (=> bm!24574 m!274103))

(declare-fun m!274105 () Bool)

(assert (=> b!258500 m!274105))

(assert (=> b!258500 m!274105))

(declare-fun m!274107 () Bool)

(assert (=> b!258500 m!274107))

(assert (=> bm!24523 d!62073))

(assert (=> d!61989 d!61985))

(declare-fun b!258520 () Bool)

(declare-fun e!167562 () Bool)

(declare-fun lt!130200 () SeekEntryResult!1141)

(assert (=> b!258520 (= e!167562 ((_ is Undefined!1141) lt!130200))))

(declare-fun b!258521 () Bool)

(declare-fun res!126421 () Bool)

(declare-fun e!167563 () Bool)

(assert (=> b!258521 (=> (not res!126421) (not e!167563))))

(declare-fun call!24583 () Bool)

(assert (=> b!258521 (= res!126421 call!24583)))

(assert (=> b!258521 (= e!167562 e!167563)))

(declare-fun bm!24579 () Bool)

(declare-fun call!24582 () Bool)

(assert (=> bm!24579 (= call!24582 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258523 () Bool)

(declare-fun e!167564 () Bool)

(declare-fun e!167561 () Bool)

(assert (=> b!258523 (= e!167564 e!167561)))

(declare-fun res!126419 () Bool)

(assert (=> b!258523 (= res!126419 call!24583)))

(assert (=> b!258523 (=> (not res!126419) (not e!167561))))

(declare-fun b!258524 () Bool)

(assert (=> b!258524 (= e!167563 (not call!24582))))

(declare-fun b!258525 () Bool)

(declare-fun res!126420 () Bool)

(assert (=> b!258525 (=> (not res!126420) (not e!167563))))

(assert (=> b!258525 (= res!126420 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6737 lt!130200)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24580 () Bool)

(declare-fun c!43809 () Bool)

(assert (=> bm!24580 (= call!24583 (inRange!0 (ite c!43809 (index!6734 lt!130200) (index!6737 lt!130200)) (mask!11057 thiss!1504)))))

(declare-fun b!258526 () Bool)

(declare-fun res!126418 () Bool)

(assert (=> b!258526 (= res!126418 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6734 lt!130200)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258526 (=> (not res!126418) (not e!167561))))

(declare-fun b!258527 () Bool)

(assert (=> b!258527 (= e!167561 (not call!24582))))

(declare-fun b!258522 () Bool)

(assert (=> b!258522 (= e!167564 e!167562)))

(declare-fun c!43808 () Bool)

(assert (=> b!258522 (= c!43808 ((_ is MissingVacant!1141) lt!130200))))

(declare-fun d!62075 () Bool)

(assert (=> d!62075 e!167564))

(assert (=> d!62075 (= c!43809 ((_ is MissingZero!1141) lt!130200))))

(assert (=> d!62075 (= lt!130200 (seekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(assert (=> d!62075 true))

(declare-fun _$34!1119 () Unit!7989)

(assert (=> d!62075 (= (choose!1253 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) _$34!1119)))

(assert (= (and d!62075 c!43809) b!258523))

(assert (= (and d!62075 (not c!43809)) b!258522))

(assert (= (and b!258523 res!126419) b!258526))

(assert (= (and b!258526 res!126418) b!258527))

(assert (= (and b!258522 c!43808) b!258521))

(assert (= (and b!258522 (not c!43808)) b!258520))

(assert (= (and b!258521 res!126421) b!258525))

(assert (= (and b!258525 res!126420) b!258524))

(assert (= (or b!258523 b!258521) bm!24580))

(assert (= (or b!258527 b!258524) bm!24579))

(declare-fun m!274109 () Bool)

(assert (=> b!258525 m!274109))

(assert (=> bm!24579 m!273461))

(declare-fun m!274111 () Bool)

(assert (=> b!258526 m!274111))

(assert (=> d!62075 m!273437))

(declare-fun m!274113 () Bool)

(assert (=> bm!24580 m!274113))

(assert (=> d!61989 d!62075))

(assert (=> d!61989 d!61981))

(declare-fun d!62077 () Bool)

(assert (=> d!62077 (= (apply!255 (+!691 lt!130024 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))) lt!130016) (get!3063 (getValueByKey!314 (toList!1894 (+!691 lt!130024 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504)))) lt!130016)))))

(declare-fun bs!9119 () Bool)

(assert (= bs!9119 d!62077))

(declare-fun m!274115 () Bool)

(assert (=> bs!9119 m!274115))

(assert (=> bs!9119 m!274115))

(declare-fun m!274117 () Bool)

(assert (=> bs!9119 m!274117))

(assert (=> b!258267 d!62077))

(declare-fun d!62079 () Bool)

(assert (=> d!62079 (= (apply!255 (+!691 lt!130032 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))) lt!130034) (apply!255 lt!130032 lt!130034))))

(declare-fun lt!130201 () Unit!7989)

(assert (=> d!62079 (= lt!130201 (choose!1256 lt!130032 lt!130022 (minValue!4601 thiss!1504) lt!130034))))

(declare-fun e!167565 () Bool)

(assert (=> d!62079 e!167565))

(declare-fun res!126422 () Bool)

(assert (=> d!62079 (=> (not res!126422) (not e!167565))))

(assert (=> d!62079 (= res!126422 (contains!1854 lt!130032 lt!130034))))

(assert (=> d!62079 (= (addApplyDifferent!231 lt!130032 lt!130022 (minValue!4601 thiss!1504) lt!130034) lt!130201)))

(declare-fun b!258528 () Bool)

(assert (=> b!258528 (= e!167565 (not (= lt!130034 lt!130022)))))

(assert (= (and d!62079 res!126422) b!258528))

(assert (=> d!62079 m!273727))

(assert (=> d!62079 m!273705))

(assert (=> d!62079 m!273707))

(assert (=> d!62079 m!273705))

(declare-fun m!274119 () Bool)

(assert (=> d!62079 m!274119))

(declare-fun m!274121 () Bool)

(assert (=> d!62079 m!274121))

(assert (=> b!258267 d!62079))

(declare-fun d!62081 () Bool)

(assert (=> d!62081 (contains!1854 (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))) lt!130014)))

(declare-fun lt!130202 () Unit!7989)

(assert (=> d!62081 (= lt!130202 (choose!1255 lt!130018 lt!130021 (zeroValue!4601 thiss!1504) lt!130014))))

(assert (=> d!62081 (contains!1854 lt!130018 lt!130014)))

(assert (=> d!62081 (= (addStillContains!231 lt!130018 lt!130021 (zeroValue!4601 thiss!1504) lt!130014) lt!130202)))

(declare-fun bs!9120 () Bool)

(assert (= bs!9120 d!62081))

(assert (=> bs!9120 m!273711))

(assert (=> bs!9120 m!273711))

(assert (=> bs!9120 m!273721))

(declare-fun m!274123 () Bool)

(assert (=> bs!9120 m!274123))

(declare-fun m!274125 () Bool)

(assert (=> bs!9120 m!274125))

(assert (=> b!258267 d!62081))

(declare-fun d!62083 () Bool)

(declare-fun e!167566 () Bool)

(assert (=> d!62083 e!167566))

(declare-fun res!126423 () Bool)

(assert (=> d!62083 (=> (not res!126423) (not e!167566))))

(declare-fun lt!130204 () ListLongMap!3757)

(assert (=> d!62083 (= res!126423 (contains!1854 lt!130204 (_1!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130206 () List!3720)

(assert (=> d!62083 (= lt!130204 (ListLongMap!3758 lt!130206))))

(declare-fun lt!130205 () Unit!7989)

(declare-fun lt!130203 () Unit!7989)

(assert (=> d!62083 (= lt!130205 lt!130203)))

(assert (=> d!62083 (= (getValueByKey!314 lt!130206 (_1!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504)))))))

(assert (=> d!62083 (= lt!130203 (lemmaContainsTupThenGetReturnValue!170 lt!130206 (_1!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504)))))))

(assert (=> d!62083 (= lt!130206 (insertStrictlySorted!173 (toList!1894 lt!130029) (_1!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504)))))))

(assert (=> d!62083 (= (+!691 lt!130029 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))) lt!130204)))

(declare-fun b!258529 () Bool)

(declare-fun res!126424 () Bool)

(assert (=> b!258529 (=> (not res!126424) (not e!167566))))

(assert (=> b!258529 (= res!126424 (= (getValueByKey!314 (toList!1894 lt!130204) (_1!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))))))))

(declare-fun b!258530 () Bool)

(assert (=> b!258530 (= e!167566 (contains!1857 (toList!1894 lt!130204) (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))))))

(assert (= (and d!62083 res!126423) b!258529))

(assert (= (and b!258529 res!126424) b!258530))

(declare-fun m!274127 () Bool)

(assert (=> d!62083 m!274127))

(declare-fun m!274129 () Bool)

(assert (=> d!62083 m!274129))

(declare-fun m!274131 () Bool)

(assert (=> d!62083 m!274131))

(declare-fun m!274133 () Bool)

(assert (=> d!62083 m!274133))

(declare-fun m!274135 () Bool)

(assert (=> b!258529 m!274135))

(declare-fun m!274137 () Bool)

(assert (=> b!258530 m!274137))

(assert (=> b!258267 d!62083))

(declare-fun d!62085 () Bool)

(assert (=> d!62085 (= (apply!255 lt!130029 lt!130025) (get!3063 (getValueByKey!314 (toList!1894 lt!130029) lt!130025)))))

(declare-fun bs!9121 () Bool)

(assert (= bs!9121 d!62085))

(declare-fun m!274139 () Bool)

(assert (=> bs!9121 m!274139))

(assert (=> bs!9121 m!274139))

(declare-fun m!274141 () Bool)

(assert (=> bs!9121 m!274141))

(assert (=> b!258267 d!62085))

(declare-fun d!62087 () Bool)

(declare-fun e!167567 () Bool)

(assert (=> d!62087 e!167567))

(declare-fun res!126425 () Bool)

(assert (=> d!62087 (=> (not res!126425) (not e!167567))))

(declare-fun lt!130208 () ListLongMap!3757)

(assert (=> d!62087 (= res!126425 (contains!1854 lt!130208 (_1!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!130210 () List!3720)

(assert (=> d!62087 (= lt!130208 (ListLongMap!3758 lt!130210))))

(declare-fun lt!130209 () Unit!7989)

(declare-fun lt!130207 () Unit!7989)

(assert (=> d!62087 (= lt!130209 lt!130207)))

(assert (=> d!62087 (= (getValueByKey!314 lt!130210 (_1!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62087 (= lt!130207 (lemmaContainsTupThenGetReturnValue!170 lt!130210 (_1!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62087 (= lt!130210 (insertStrictlySorted!173 (toList!1894 lt!130024) (_1!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62087 (= (+!691 lt!130024 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))) lt!130208)))

(declare-fun b!258531 () Bool)

(declare-fun res!126426 () Bool)

(assert (=> b!258531 (=> (not res!126426) (not e!167567))))

(assert (=> b!258531 (= res!126426 (= (getValueByKey!314 (toList!1894 lt!130208) (_1!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258532 () Bool)

(assert (=> b!258532 (= e!167567 (contains!1857 (toList!1894 lt!130208) (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!62087 res!126425) b!258531))

(assert (= (and b!258531 res!126426) b!258532))

(declare-fun m!274143 () Bool)

(assert (=> d!62087 m!274143))

(declare-fun m!274145 () Bool)

(assert (=> d!62087 m!274145))

(declare-fun m!274147 () Bool)

(assert (=> d!62087 m!274147))

(declare-fun m!274149 () Bool)

(assert (=> d!62087 m!274149))

(declare-fun m!274151 () Bool)

(assert (=> b!258531 m!274151))

(declare-fun m!274153 () Bool)

(assert (=> b!258532 m!274153))

(assert (=> b!258267 d!62087))

(declare-fun d!62089 () Bool)

(assert (=> d!62089 (= (apply!255 (+!691 lt!130029 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))) lt!130025) (get!3063 (getValueByKey!314 (toList!1894 (+!691 lt!130029 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504)))) lt!130025)))))

(declare-fun bs!9122 () Bool)

(assert (= bs!9122 d!62089))

(declare-fun m!274155 () Bool)

(assert (=> bs!9122 m!274155))

(assert (=> bs!9122 m!274155))

(declare-fun m!274157 () Bool)

(assert (=> bs!9122 m!274157))

(assert (=> b!258267 d!62089))

(declare-fun d!62091 () Bool)

(declare-fun e!167568 () Bool)

(assert (=> d!62091 e!167568))

(declare-fun res!126427 () Bool)

(assert (=> d!62091 (=> (not res!126427) (not e!167568))))

(declare-fun lt!130212 () ListLongMap!3757)

(assert (=> d!62091 (= res!126427 (contains!1854 lt!130212 (_1!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130214 () List!3720)

(assert (=> d!62091 (= lt!130212 (ListLongMap!3758 lt!130214))))

(declare-fun lt!130213 () Unit!7989)

(declare-fun lt!130211 () Unit!7989)

(assert (=> d!62091 (= lt!130213 lt!130211)))

(assert (=> d!62091 (= (getValueByKey!314 lt!130214 (_1!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504)))))))

(assert (=> d!62091 (= lt!130211 (lemmaContainsTupThenGetReturnValue!170 lt!130214 (_1!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504)))))))

(assert (=> d!62091 (= lt!130214 (insertStrictlySorted!173 (toList!1894 lt!130032) (_1!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504)))))))

(assert (=> d!62091 (= (+!691 lt!130032 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))) lt!130212)))

(declare-fun b!258533 () Bool)

(declare-fun res!126428 () Bool)

(assert (=> b!258533 (=> (not res!126428) (not e!167568))))

(assert (=> b!258533 (= res!126428 (= (getValueByKey!314 (toList!1894 lt!130212) (_1!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))))))))

(declare-fun b!258534 () Bool)

(assert (=> b!258534 (= e!167568 (contains!1857 (toList!1894 lt!130212) (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))))))

(assert (= (and d!62091 res!126427) b!258533))

(assert (= (and b!258533 res!126428) b!258534))

(declare-fun m!274159 () Bool)

(assert (=> d!62091 m!274159))

(declare-fun m!274161 () Bool)

(assert (=> d!62091 m!274161))

(declare-fun m!274163 () Bool)

(assert (=> d!62091 m!274163))

(declare-fun m!274165 () Bool)

(assert (=> d!62091 m!274165))

(declare-fun m!274167 () Bool)

(assert (=> b!258533 m!274167))

(declare-fun m!274169 () Bool)

(assert (=> b!258534 m!274169))

(assert (=> b!258267 d!62091))

(declare-fun d!62093 () Bool)

(assert (=> d!62093 (= (apply!255 (+!691 lt!130032 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504))) lt!130034) (get!3063 (getValueByKey!314 (toList!1894 (+!691 lt!130032 (tuple2!4843 lt!130022 (minValue!4601 thiss!1504)))) lt!130034)))))

(declare-fun bs!9123 () Bool)

(assert (= bs!9123 d!62093))

(declare-fun m!274171 () Bool)

(assert (=> bs!9123 m!274171))

(assert (=> bs!9123 m!274171))

(declare-fun m!274173 () Bool)

(assert (=> bs!9123 m!274173))

(assert (=> b!258267 d!62093))

(declare-fun b!258535 () Bool)

(declare-fun e!167570 () ListLongMap!3757)

(declare-fun call!24584 () ListLongMap!3757)

(assert (=> b!258535 (= e!167570 call!24584)))

(declare-fun b!258536 () Bool)

(declare-fun e!167569 () Bool)

(declare-fun e!167571 () Bool)

(assert (=> b!258536 (= e!167569 e!167571)))

(declare-fun c!43812 () Bool)

(declare-fun e!167575 () Bool)

(assert (=> b!258536 (= c!43812 e!167575)))

(declare-fun res!126432 () Bool)

(assert (=> b!258536 (=> (not res!126432) (not e!167575))))

(assert (=> b!258536 (= res!126432 (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(declare-fun b!258537 () Bool)

(declare-fun res!126430 () Bool)

(assert (=> b!258537 (=> (not res!126430) (not e!167569))))

(declare-fun lt!130219 () ListLongMap!3757)

(assert (=> b!258537 (= res!126430 (not (contains!1854 lt!130219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258538 () Bool)

(declare-fun e!167572 () ListLongMap!3757)

(assert (=> b!258538 (= e!167572 e!167570)))

(declare-fun c!43811 () Bool)

(assert (=> b!258538 (= c!43811 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258539 () Bool)

(assert (=> b!258539 (= e!167572 (ListLongMap!3758 Nil!3717))))

(declare-fun b!258540 () Bool)

(declare-fun e!167573 () Bool)

(assert (=> b!258540 (= e!167571 e!167573)))

(declare-fun c!43810 () Bool)

(assert (=> b!258540 (= c!43810 (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(declare-fun b!258542 () Bool)

(assert (=> b!258542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(assert (=> b!258542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6288 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))))))))

(declare-fun e!167574 () Bool)

(assert (=> b!258542 (= e!167574 (= (apply!255 lt!130219 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)) (get!3062 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!24581 () Bool)

(assert (=> bm!24581 (= call!24584 (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504)))))

(declare-fun b!258543 () Bool)

(assert (=> b!258543 (= e!167573 (isEmpty!538 lt!130219))))

(declare-fun b!258544 () Bool)

(assert (=> b!258544 (= e!167571 e!167574)))

(assert (=> b!258544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(declare-fun res!126431 () Bool)

(assert (=> b!258544 (= res!126431 (contains!1854 lt!130219 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(assert (=> b!258544 (=> (not res!126431) (not e!167574))))

(declare-fun b!258545 () Bool)

(assert (=> b!258545 (= e!167575 (validKeyInArray!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(assert (=> b!258545 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!258546 () Bool)

(declare-fun lt!130215 () Unit!7989)

(declare-fun lt!130218 () Unit!7989)

(assert (=> b!258546 (= lt!130215 lt!130218)))

(declare-fun lt!130217 () ListLongMap!3757)

(declare-fun lt!130221 () (_ BitVec 64))

(declare-fun lt!130216 () (_ BitVec 64))

(declare-fun lt!130220 () V!8449)

(assert (=> b!258546 (not (contains!1854 (+!691 lt!130217 (tuple2!4843 lt!130221 lt!130220)) lt!130216))))

(assert (=> b!258546 (= lt!130218 (addStillNotContains!127 lt!130217 lt!130221 lt!130220 lt!130216))))

(assert (=> b!258546 (= lt!130216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!258546 (= lt!130220 (get!3062 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258546 (= lt!130221 (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))

(assert (=> b!258546 (= lt!130217 call!24584)))

(assert (=> b!258546 (= e!167570 (+!691 call!24584 (tuple2!4843 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) (get!3062 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258541 () Bool)

(assert (=> b!258541 (= e!167573 (= lt!130219 (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504))))))

(declare-fun d!62095 () Bool)

(assert (=> d!62095 e!167569))

(declare-fun res!126429 () Bool)

(assert (=> d!62095 (=> (not res!126429) (not e!167569))))

(assert (=> d!62095 (= res!126429 (not (contains!1854 lt!130219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62095 (= lt!130219 e!167572)))

(declare-fun c!43813 () Bool)

(assert (=> d!62095 (= c!43813 (bvsge #b00000000000000000000000000000000 (size!6289 lt!129838)))))

(assert (=> d!62095 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!62095 (= (getCurrentListMapNoExtraKeys!571 lt!129838 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!130219)))

(assert (= (and d!62095 c!43813) b!258539))

(assert (= (and d!62095 (not c!43813)) b!258538))

(assert (= (and b!258538 c!43811) b!258546))

(assert (= (and b!258538 (not c!43811)) b!258535))

(assert (= (or b!258546 b!258535) bm!24581))

(assert (= (and d!62095 res!126429) b!258537))

(assert (= (and b!258537 res!126430) b!258536))

(assert (= (and b!258536 res!126432) b!258545))

(assert (= (and b!258536 c!43812) b!258544))

(assert (= (and b!258536 (not c!43812)) b!258540))

(assert (= (and b!258544 res!126431) b!258542))

(assert (= (and b!258540 c!43810) b!258541))

(assert (= (and b!258540 (not c!43810)) b!258543))

(declare-fun b_lambda!8231 () Bool)

(assert (=> (not b_lambda!8231) (not b!258542)))

(assert (=> b!258542 t!8782))

(declare-fun b_and!13843 () Bool)

(assert (= b_and!13841 (and (=> t!8782 result!5383) b_and!13843)))

(declare-fun b_lambda!8233 () Bool)

(assert (=> (not b_lambda!8233) (not b!258546)))

(assert (=> b!258546 t!8782))

(declare-fun b_and!13845 () Bool)

(assert (= b_and!13843 (and (=> t!8782 result!5383) b_and!13845)))

(assert (=> b!258542 m!273743))

(assert (=> b!258542 m!273741))

(assert (=> b!258542 m!273743))

(assert (=> b!258542 m!273745))

(assert (=> b!258542 m!273741))

(assert (=> b!258542 m!273629))

(declare-fun m!274175 () Bool)

(assert (=> b!258542 m!274175))

(assert (=> b!258542 m!273629))

(declare-fun m!274177 () Bool)

(assert (=> b!258543 m!274177))

(declare-fun m!274179 () Bool)

(assert (=> b!258546 m!274179))

(assert (=> b!258546 m!273743))

(assert (=> b!258546 m!273741))

(assert (=> b!258546 m!273743))

(assert (=> b!258546 m!273745))

(assert (=> b!258546 m!273629))

(assert (=> b!258546 m!273741))

(declare-fun m!274181 () Bool)

(assert (=> b!258546 m!274181))

(declare-fun m!274183 () Bool)

(assert (=> b!258546 m!274183))

(assert (=> b!258546 m!274179))

(declare-fun m!274185 () Bool)

(assert (=> b!258546 m!274185))

(declare-fun m!274187 () Bool)

(assert (=> d!62095 m!274187))

(assert (=> d!62095 m!273459))

(assert (=> b!258545 m!273629))

(assert (=> b!258545 m!273629))

(assert (=> b!258545 m!273633))

(assert (=> b!258544 m!273629))

(assert (=> b!258544 m!273629))

(declare-fun m!274189 () Bool)

(assert (=> b!258544 m!274189))

(assert (=> b!258538 m!273629))

(assert (=> b!258538 m!273629))

(assert (=> b!258538 m!273633))

(declare-fun m!274191 () Bool)

(assert (=> bm!24581 m!274191))

(assert (=> b!258541 m!274191))

(declare-fun m!274193 () Bool)

(assert (=> b!258537 m!274193))

(assert (=> b!258267 d!62095))

(declare-fun d!62097 () Bool)

(assert (=> d!62097 (= (apply!255 lt!130032 lt!130034) (get!3063 (getValueByKey!314 (toList!1894 lt!130032) lt!130034)))))

(declare-fun bs!9124 () Bool)

(assert (= bs!9124 d!62097))

(declare-fun m!274195 () Bool)

(assert (=> bs!9124 m!274195))

(assert (=> bs!9124 m!274195))

(declare-fun m!274197 () Bool)

(assert (=> bs!9124 m!274197))

(assert (=> b!258267 d!62097))

(declare-fun d!62099 () Bool)

(declare-fun e!167576 () Bool)

(assert (=> d!62099 e!167576))

(declare-fun res!126433 () Bool)

(assert (=> d!62099 (=> (not res!126433) (not e!167576))))

(declare-fun lt!130223 () ListLongMap!3757)

(assert (=> d!62099 (= res!126433 (contains!1854 lt!130223 (_1!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!130225 () List!3720)

(assert (=> d!62099 (= lt!130223 (ListLongMap!3758 lt!130225))))

(declare-fun lt!130224 () Unit!7989)

(declare-fun lt!130222 () Unit!7989)

(assert (=> d!62099 (= lt!130224 lt!130222)))

(assert (=> d!62099 (= (getValueByKey!314 lt!130225 (_1!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62099 (= lt!130222 (lemmaContainsTupThenGetReturnValue!170 lt!130225 (_1!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62099 (= lt!130225 (insertStrictlySorted!173 (toList!1894 lt!130018) (_1!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!62099 (= (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))) lt!130223)))

(declare-fun b!258547 () Bool)

(declare-fun res!126434 () Bool)

(assert (=> b!258547 (=> (not res!126434) (not e!167576))))

(assert (=> b!258547 (= res!126434 (= (getValueByKey!314 (toList!1894 lt!130223) (_1!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258548 () Bool)

(assert (=> b!258548 (= e!167576 (contains!1857 (toList!1894 lt!130223) (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!62099 res!126433) b!258547))

(assert (= (and b!258547 res!126434) b!258548))

(declare-fun m!274199 () Bool)

(assert (=> d!62099 m!274199))

(declare-fun m!274201 () Bool)

(assert (=> d!62099 m!274201))

(declare-fun m!274203 () Bool)

(assert (=> d!62099 m!274203))

(declare-fun m!274205 () Bool)

(assert (=> d!62099 m!274205))

(declare-fun m!274207 () Bool)

(assert (=> b!258547 m!274207))

(declare-fun m!274209 () Bool)

(assert (=> b!258548 m!274209))

(assert (=> b!258267 d!62099))

(declare-fun d!62101 () Bool)

(assert (=> d!62101 (= (apply!255 lt!130024 lt!130016) (get!3063 (getValueByKey!314 (toList!1894 lt!130024) lt!130016)))))

(declare-fun bs!9125 () Bool)

(assert (= bs!9125 d!62101))

(declare-fun m!274211 () Bool)

(assert (=> bs!9125 m!274211))

(assert (=> bs!9125 m!274211))

(declare-fun m!274213 () Bool)

(assert (=> bs!9125 m!274213))

(assert (=> b!258267 d!62101))

(declare-fun d!62103 () Bool)

(assert (=> d!62103 (= (apply!255 (+!691 lt!130024 (tuple2!4843 lt!130035 (zeroValue!4601 thiss!1504))) lt!130016) (apply!255 lt!130024 lt!130016))))

(declare-fun lt!130226 () Unit!7989)

(assert (=> d!62103 (= lt!130226 (choose!1256 lt!130024 lt!130035 (zeroValue!4601 thiss!1504) lt!130016))))

(declare-fun e!167577 () Bool)

(assert (=> d!62103 e!167577))

(declare-fun res!126435 () Bool)

(assert (=> d!62103 (=> (not res!126435) (not e!167577))))

(assert (=> d!62103 (= res!126435 (contains!1854 lt!130024 lt!130016))))

(assert (=> d!62103 (= (addApplyDifferent!231 lt!130024 lt!130035 (zeroValue!4601 thiss!1504) lt!130016) lt!130226)))

(declare-fun b!258549 () Bool)

(assert (=> b!258549 (= e!167577 (not (= lt!130016 lt!130035)))))

(assert (= (and d!62103 res!126435) b!258549))

(assert (=> d!62103 m!273701))

(assert (=> d!62103 m!273699))

(assert (=> d!62103 m!273719))

(assert (=> d!62103 m!273699))

(declare-fun m!274215 () Bool)

(assert (=> d!62103 m!274215))

(declare-fun m!274217 () Bool)

(assert (=> d!62103 m!274217))

(assert (=> b!258267 d!62103))

(declare-fun d!62105 () Bool)

(assert (=> d!62105 (= (apply!255 (+!691 lt!130029 (tuple2!4843 lt!130023 (minValue!4601 thiss!1504))) lt!130025) (apply!255 lt!130029 lt!130025))))

(declare-fun lt!130227 () Unit!7989)

(assert (=> d!62105 (= lt!130227 (choose!1256 lt!130029 lt!130023 (minValue!4601 thiss!1504) lt!130025))))

(declare-fun e!167578 () Bool)

(assert (=> d!62105 e!167578))

(declare-fun res!126436 () Bool)

(assert (=> d!62105 (=> (not res!126436) (not e!167578))))

(assert (=> d!62105 (= res!126436 (contains!1854 lt!130029 lt!130025))))

(assert (=> d!62105 (= (addApplyDifferent!231 lt!130029 lt!130023 (minValue!4601 thiss!1504) lt!130025) lt!130227)))

(declare-fun b!258550 () Bool)

(assert (=> b!258550 (= e!167578 (not (= lt!130025 lt!130023)))))

(assert (= (and d!62105 res!126436) b!258550))

(assert (=> d!62105 m!273725))

(assert (=> d!62105 m!273713))

(assert (=> d!62105 m!273715))

(assert (=> d!62105 m!273713))

(declare-fun m!274219 () Bool)

(assert (=> d!62105 m!274219))

(declare-fun m!274221 () Bool)

(assert (=> d!62105 m!274221))

(assert (=> b!258267 d!62105))

(declare-fun d!62107 () Bool)

(declare-fun e!167580 () Bool)

(assert (=> d!62107 e!167580))

(declare-fun res!126437 () Bool)

(assert (=> d!62107 (=> res!126437 e!167580)))

(declare-fun lt!130230 () Bool)

(assert (=> d!62107 (= res!126437 (not lt!130230))))

(declare-fun lt!130229 () Bool)

(assert (=> d!62107 (= lt!130230 lt!130229)))

(declare-fun lt!130228 () Unit!7989)

(declare-fun e!167579 () Unit!7989)

(assert (=> d!62107 (= lt!130228 e!167579)))

(declare-fun c!43814 () Bool)

(assert (=> d!62107 (= c!43814 lt!130229)))

(assert (=> d!62107 (= lt!130229 (containsKey!305 (toList!1894 (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))) lt!130014))))

(assert (=> d!62107 (= (contains!1854 (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504))) lt!130014) lt!130230)))

(declare-fun b!258551 () Bool)

(declare-fun lt!130231 () Unit!7989)

(assert (=> b!258551 (= e!167579 lt!130231)))

(assert (=> b!258551 (= lt!130231 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))) lt!130014))))

(assert (=> b!258551 (isDefined!254 (getValueByKey!314 (toList!1894 (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))) lt!130014))))

(declare-fun b!258552 () Bool)

(declare-fun Unit!8010 () Unit!7989)

(assert (=> b!258552 (= e!167579 Unit!8010)))

(declare-fun b!258553 () Bool)

(assert (=> b!258553 (= e!167580 (isDefined!254 (getValueByKey!314 (toList!1894 (+!691 lt!130018 (tuple2!4843 lt!130021 (zeroValue!4601 thiss!1504)))) lt!130014)))))

(assert (= (and d!62107 c!43814) b!258551))

(assert (= (and d!62107 (not c!43814)) b!258552))

(assert (= (and d!62107 (not res!126437)) b!258553))

(declare-fun m!274223 () Bool)

(assert (=> d!62107 m!274223))

(declare-fun m!274225 () Bool)

(assert (=> b!258551 m!274225))

(declare-fun m!274227 () Bool)

(assert (=> b!258551 m!274227))

(assert (=> b!258551 m!274227))

(declare-fun m!274229 () Bool)

(assert (=> b!258551 m!274229))

(assert (=> b!258553 m!274227))

(assert (=> b!258553 m!274227))

(assert (=> b!258553 m!274229))

(assert (=> b!258267 d!62107))

(declare-fun b!258554 () Bool)

(declare-fun e!167581 () Bool)

(declare-fun call!24585 () Bool)

(assert (=> b!258554 (= e!167581 call!24585)))

(declare-fun bm!24582 () Bool)

(assert (=> bm!24582 (= call!24585 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!129838 (mask!11057 thiss!1504)))))

(declare-fun d!62109 () Bool)

(declare-fun res!126438 () Bool)

(declare-fun e!167583 () Bool)

(assert (=> d!62109 (=> res!126438 e!167583)))

(assert (=> d!62109 (= res!126438 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 lt!129838)))))

(assert (=> d!62109 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129838 (mask!11057 thiss!1504)) e!167583)))

(declare-fun b!258555 () Bool)

(declare-fun e!167582 () Bool)

(assert (=> b!258555 (= e!167581 e!167582)))

(declare-fun lt!130232 () (_ BitVec 64))

(assert (=> b!258555 (= lt!130232 (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!130233 () Unit!7989)

(assert (=> b!258555 (= lt!130233 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129838 lt!130232 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!258555 (arrayContainsKey!0 lt!129838 lt!130232 #b00000000000000000000000000000000)))

(declare-fun lt!130234 () Unit!7989)

(assert (=> b!258555 (= lt!130234 lt!130233)))

(declare-fun res!126439 () Bool)

(assert (=> b!258555 (= res!126439 (= (seekEntryOrOpen!0 (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!129838 (mask!11057 thiss!1504)) (Found!1141 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!258555 (=> (not res!126439) (not e!167582))))

(declare-fun b!258556 () Bool)

(assert (=> b!258556 (= e!167583 e!167581)))

(declare-fun c!43815 () Bool)

(assert (=> b!258556 (= c!43815 (validKeyInArray!0 (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258557 () Bool)

(assert (=> b!258557 (= e!167582 call!24585)))

(assert (= (and d!62109 (not res!126438)) b!258556))

(assert (= (and b!258556 c!43815) b!258555))

(assert (= (and b!258556 (not c!43815)) b!258554))

(assert (= (and b!258555 res!126439) b!258557))

(assert (= (or b!258557 b!258554) bm!24582))

(declare-fun m!274231 () Bool)

(assert (=> bm!24582 m!274231))

(assert (=> b!258555 m!274105))

(declare-fun m!274233 () Bool)

(assert (=> b!258555 m!274233))

(declare-fun m!274235 () Bool)

(assert (=> b!258555 m!274235))

(assert (=> b!258555 m!274105))

(declare-fun m!274237 () Bool)

(assert (=> b!258555 m!274237))

(assert (=> b!258556 m!274105))

(assert (=> b!258556 m!274105))

(assert (=> b!258556 m!274107))

(assert (=> bm!24520 d!62109))

(declare-fun d!62111 () Bool)

(assert (=> d!62111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (mask!11057 thiss!1504))))

(assert (=> d!62111 true))

(declare-fun _$56!33 () Unit!7989)

(assert (=> d!62111 (= (choose!102 key!932 (_keys!6930 thiss!1504) index!297 (mask!11057 thiss!1504)) _$56!33)))

(declare-fun bs!9126 () Bool)

(assert (= bs!9126 d!62111))

(assert (=> bs!9126 m!273479))

(assert (=> bs!9126 m!273693))

(assert (=> d!61973 d!62111))

(assert (=> d!61973 d!61981))

(declare-fun b!258558 () Bool)

(declare-fun e!167586 () Bool)

(declare-fun call!24586 () Bool)

(assert (=> b!258558 (= e!167586 call!24586)))

(declare-fun bm!24583 () Bool)

(declare-fun c!43816 () Bool)

(assert (=> bm!24583 (= call!24586 (arrayNoDuplicates!0 (_keys!6930 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43816 (Cons!3717 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000) Nil!3718) Nil!3718)))))

(declare-fun b!258559 () Bool)

(assert (=> b!258559 (= e!167586 call!24586)))

(declare-fun b!258560 () Bool)

(declare-fun e!167584 () Bool)

(assert (=> b!258560 (= e!167584 e!167586)))

(assert (=> b!258560 (= c!43816 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258561 () Bool)

(declare-fun e!167587 () Bool)

(assert (=> b!258561 (= e!167587 e!167584)))

(declare-fun res!126441 () Bool)

(assert (=> b!258561 (=> (not res!126441) (not e!167584))))

(declare-fun e!167585 () Bool)

(assert (=> b!258561 (= res!126441 (not e!167585))))

(declare-fun res!126440 () Bool)

(assert (=> b!258561 (=> (not res!126440) (not e!167585))))

(assert (=> b!258561 (= res!126440 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258562 () Bool)

(assert (=> b!258562 (= e!167585 (contains!1856 Nil!3718 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62113 () Bool)

(declare-fun res!126442 () Bool)

(assert (=> d!62113 (=> res!126442 e!167587)))

(assert (=> d!62113 (= res!126442 (bvsge #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!62113 (= (arrayNoDuplicates!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 Nil!3718) e!167587)))

(assert (= (and d!62113 (not res!126442)) b!258561))

(assert (= (and b!258561 res!126440) b!258562))

(assert (= (and b!258561 res!126441) b!258560))

(assert (= (and b!258560 c!43816) b!258559))

(assert (= (and b!258560 (not c!43816)) b!258558))

(assert (= (or b!258559 b!258558) bm!24583))

(assert (=> bm!24583 m!273687))

(declare-fun m!274239 () Bool)

(assert (=> bm!24583 m!274239))

(assert (=> b!258560 m!273687))

(assert (=> b!258560 m!273687))

(assert (=> b!258560 m!273697))

(assert (=> b!258561 m!273687))

(assert (=> b!258561 m!273687))

(assert (=> b!258561 m!273697))

(assert (=> b!258562 m!273687))

(assert (=> b!258562 m!273687))

(declare-fun m!274241 () Bool)

(assert (=> b!258562 m!274241))

(assert (=> b!258382 d!62113))

(assert (=> b!258380 d!61975))

(declare-fun d!62115 () Bool)

(declare-fun e!167588 () Bool)

(assert (=> d!62115 e!167588))

(declare-fun res!126443 () Bool)

(assert (=> d!62115 (=> (not res!126443) (not e!167588))))

(declare-fun lt!130236 () ListLongMap!3757)

(assert (=> d!62115 (= res!126443 (contains!1854 lt!130236 (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130238 () List!3720)

(assert (=> d!62115 (= lt!130236 (ListLongMap!3758 lt!130238))))

(declare-fun lt!130237 () Unit!7989)

(declare-fun lt!130235 () Unit!7989)

(assert (=> d!62115 (= lt!130237 lt!130235)))

(assert (=> d!62115 (= (getValueByKey!314 lt!130238 (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!62115 (= lt!130235 (lemmaContainsTupThenGetReturnValue!170 lt!130238 (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!62115 (= lt!130238 (insertStrictlySorted!173 (toList!1894 call!24545) (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!62115 (= (+!691 call!24545 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) lt!130236)))

(declare-fun b!258563 () Bool)

(declare-fun res!126444 () Bool)

(assert (=> b!258563 (=> (not res!126444) (not e!167588))))

(assert (=> b!258563 (= res!126444 (= (getValueByKey!314 (toList!1894 lt!130236) (_1!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!319 (_2!2432 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun b!258564 () Bool)

(assert (=> b!258564 (= e!167588 (contains!1857 (toList!1894 lt!130236) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(assert (= (and d!62115 res!126443) b!258563))

(assert (= (and b!258563 res!126444) b!258564))

(declare-fun m!274243 () Bool)

(assert (=> d!62115 m!274243))

(declare-fun m!274245 () Bool)

(assert (=> d!62115 m!274245))

(declare-fun m!274247 () Bool)

(assert (=> d!62115 m!274247))

(declare-fun m!274249 () Bool)

(assert (=> d!62115 m!274249))

(declare-fun m!274251 () Bool)

(assert (=> b!258563 m!274251))

(declare-fun m!274253 () Bool)

(assert (=> b!258564 m!274253))

(assert (=> b!258281 d!62115))

(declare-fun d!62117 () Bool)

(declare-fun e!167603 () Bool)

(assert (=> d!62117 e!167603))

(declare-fun c!43825 () Bool)

(declare-fun lt!130243 () SeekEntryResult!1141)

(assert (=> d!62117 (= c!43825 (and ((_ is Intermediate!1141) lt!130243) (undefined!1953 lt!130243)))))

(declare-fun e!167601 () SeekEntryResult!1141)

(assert (=> d!62117 (= lt!130243 e!167601)))

(declare-fun c!43824 () Bool)

(assert (=> d!62117 (= c!43824 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!130244 () (_ BitVec 64))

(assert (=> d!62117 (= lt!130244 (select (arr!5942 (_keys!6930 thiss!1504)) (toIndex!0 key!932 (mask!11057 thiss!1504))))))

(assert (=> d!62117 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!62117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11057 thiss!1504)) key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)) lt!130243)))

(declare-fun b!258583 () Bool)

(assert (=> b!258583 (= e!167601 (Intermediate!1141 true (toIndex!0 key!932 (mask!11057 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!258584 () Bool)

(assert (=> b!258584 (= e!167603 (bvsge (x!25009 lt!130243) #b01111111111111111111111111111110))))

(declare-fun b!258585 () Bool)

(assert (=> b!258585 (and (bvsge (index!6736 lt!130243) #b00000000000000000000000000000000) (bvslt (index!6736 lt!130243) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun res!126452 () Bool)

(assert (=> b!258585 (= res!126452 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6736 lt!130243)) key!932))))

(declare-fun e!167599 () Bool)

(assert (=> b!258585 (=> res!126452 e!167599)))

(declare-fun e!167600 () Bool)

(assert (=> b!258585 (= e!167600 e!167599)))

(declare-fun b!258586 () Bool)

(assert (=> b!258586 (and (bvsge (index!6736 lt!130243) #b00000000000000000000000000000000) (bvslt (index!6736 lt!130243) (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> b!258586 (= e!167599 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6736 lt!130243)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258587 () Bool)

(declare-fun e!167602 () SeekEntryResult!1141)

(assert (=> b!258587 (= e!167602 (Intermediate!1141 false (toIndex!0 key!932 (mask!11057 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!258588 () Bool)

(assert (=> b!258588 (and (bvsge (index!6736 lt!130243) #b00000000000000000000000000000000) (bvslt (index!6736 lt!130243) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun res!126453 () Bool)

(assert (=> b!258588 (= res!126453 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6736 lt!130243)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258588 (=> res!126453 e!167599)))

(declare-fun b!258589 () Bool)

(assert (=> b!258589 (= e!167603 e!167600)))

(declare-fun res!126451 () Bool)

(assert (=> b!258589 (= res!126451 (and ((_ is Intermediate!1141) lt!130243) (not (undefined!1953 lt!130243)) (bvslt (x!25009 lt!130243) #b01111111111111111111111111111110) (bvsge (x!25009 lt!130243) #b00000000000000000000000000000000) (bvsge (x!25009 lt!130243) #b00000000000000000000000000000000)))))

(assert (=> b!258589 (=> (not res!126451) (not e!167600))))

(declare-fun b!258590 () Bool)

(assert (=> b!258590 (= e!167601 e!167602)))

(declare-fun c!43823 () Bool)

(assert (=> b!258590 (= c!43823 (or (= lt!130244 key!932) (= (bvadd lt!130244 lt!130244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258591 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258591 (= e!167602 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11057 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11057 thiss!1504)) key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(assert (= (and d!62117 c!43824) b!258583))

(assert (= (and d!62117 (not c!43824)) b!258590))

(assert (= (and b!258590 c!43823) b!258587))

(assert (= (and b!258590 (not c!43823)) b!258591))

(assert (= (and d!62117 c!43825) b!258584))

(assert (= (and d!62117 (not c!43825)) b!258589))

(assert (= (and b!258589 res!126451) b!258585))

(assert (= (and b!258585 (not res!126452)) b!258588))

(assert (= (and b!258588 (not res!126453)) b!258586))

(declare-fun m!274255 () Bool)

(assert (=> b!258588 m!274255))

(assert (=> d!62117 m!273761))

(declare-fun m!274257 () Bool)

(assert (=> d!62117 m!274257))

(assert (=> d!62117 m!273459))

(assert (=> b!258585 m!274255))

(assert (=> b!258586 m!274255))

(assert (=> b!258591 m!273761))

(declare-fun m!274259 () Bool)

(assert (=> b!258591 m!274259))

(assert (=> b!258591 m!274259))

(declare-fun m!274261 () Bool)

(assert (=> b!258591 m!274261))

(assert (=> d!61985 d!62117))

(declare-fun d!62119 () Bool)

(declare-fun lt!130250 () (_ BitVec 32))

(declare-fun lt!130249 () (_ BitVec 32))

(assert (=> d!62119 (= lt!130250 (bvmul (bvxor lt!130249 (bvlshr lt!130249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62119 (= lt!130249 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62119 (and (bvsge (mask!11057 thiss!1504) #b00000000000000000000000000000000) (let ((res!126454 (let ((h!4384 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25028 (bvmul (bvxor h!4384 (bvlshr h!4384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25028 (bvlshr x!25028 #b00000000000000000000000000001101)) (mask!11057 thiss!1504)))))) (and (bvslt res!126454 (bvadd (mask!11057 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!126454 #b00000000000000000000000000000000))))))

(assert (=> d!62119 (= (toIndex!0 key!932 (mask!11057 thiss!1504)) (bvand (bvxor lt!130250 (bvlshr lt!130250 #b00000000000000000000000000001101)) (mask!11057 thiss!1504)))))

(assert (=> d!61985 d!62119))

(assert (=> d!61985 d!61981))

(assert (=> bm!24544 d!62095))

(declare-fun d!62121 () Bool)

(declare-fun lt!130253 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!169 (List!3721) (InoxSet (_ BitVec 64)))

(assert (=> d!62121 (= lt!130253 (select (content!169 Nil!3718) (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun e!167608 () Bool)

(assert (=> d!62121 (= lt!130253 e!167608)))

(declare-fun res!126460 () Bool)

(assert (=> d!62121 (=> (not res!126460) (not e!167608))))

(assert (=> d!62121 (= res!126460 ((_ is Cons!3717) Nil!3718))))

(assert (=> d!62121 (= (contains!1856 Nil!3718 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)) lt!130253)))

(declare-fun b!258596 () Bool)

(declare-fun e!167609 () Bool)

(assert (=> b!258596 (= e!167608 e!167609)))

(declare-fun res!126459 () Bool)

(assert (=> b!258596 (=> res!126459 e!167609)))

(assert (=> b!258596 (= res!126459 (= (h!4379 Nil!3718) (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258597 () Bool)

(assert (=> b!258597 (= e!167609 (contains!1856 (t!8776 Nil!3718) (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(assert (= (and d!62121 res!126460) b!258596))

(assert (= (and b!258596 (not res!126459)) b!258597))

(declare-fun m!274263 () Bool)

(assert (=> d!62121 m!274263))

(assert (=> d!62121 m!273629))

(declare-fun m!274265 () Bool)

(assert (=> d!62121 m!274265))

(assert (=> b!258597 m!273629))

(declare-fun m!274267 () Bool)

(assert (=> b!258597 m!274267))

(assert (=> b!258157 d!62121))

(assert (=> d!61995 d!61981))

(declare-fun d!62123 () Bool)

(assert (=> d!62123 (= (+!691 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) (tuple2!4843 key!932 v!346)) (getCurrentListMap!1426 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504))) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!62123 true))

(declare-fun _$3!55 () Unit!7989)

(assert (=> d!62123 (= (choose!1251 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)) _$3!55)))

(declare-fun bs!9127 () Bool)

(assert (= bs!9127 d!62123))

(assert (=> bs!9127 m!273479))

(assert (=> bs!9127 m!273639))

(assert (=> bs!9127 m!273447))

(assert (=> bs!9127 m!273641))

(assert (=> bs!9127 m!273447))

(assert (=> bs!9127 m!273465))

(assert (=> d!61955 d!62123))

(assert (=> d!61955 d!61981))

(assert (=> b!258269 d!62025))

(assert (=> b!258171 d!62025))

(declare-fun b!258610 () Bool)

(declare-fun e!167618 () SeekEntryResult!1141)

(assert (=> b!258610 (= e!167618 (MissingVacant!1141 (index!6736 lt!130050)))))

(declare-fun b!258612 () Bool)

(declare-fun c!43834 () Bool)

(declare-fun lt!130258 () (_ BitVec 64))

(assert (=> b!258612 (= c!43834 (= lt!130258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167616 () SeekEntryResult!1141)

(assert (=> b!258612 (= e!167616 e!167618)))

(declare-fun b!258613 () Bool)

(assert (=> b!258613 (= e!167618 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25009 lt!130050) #b00000000000000000000000000000001) (nextIndex!0 (index!6736 lt!130050) (bvadd (x!25009 lt!130050) #b00000000000000000000000000000001) (mask!11057 thiss!1504)) (index!6736 lt!130050) key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun b!258614 () Bool)

(declare-fun e!167617 () SeekEntryResult!1141)

(assert (=> b!258614 (= e!167617 Undefined!1141)))

(declare-fun b!258615 () Bool)

(assert (=> b!258615 (= e!167617 e!167616)))

(declare-fun c!43833 () Bool)

(assert (=> b!258615 (= c!43833 (= lt!130258 key!932))))

(declare-fun b!258611 () Bool)

(assert (=> b!258611 (= e!167616 (Found!1141 (index!6736 lt!130050)))))

(declare-fun d!62125 () Bool)

(declare-fun lt!130259 () SeekEntryResult!1141)

(assert (=> d!62125 (and (or ((_ is Undefined!1141) lt!130259) (not ((_ is Found!1141) lt!130259)) (and (bvsge (index!6735 lt!130259) #b00000000000000000000000000000000) (bvslt (index!6735 lt!130259) (size!6289 (_keys!6930 thiss!1504))))) (or ((_ is Undefined!1141) lt!130259) ((_ is Found!1141) lt!130259) (not ((_ is MissingVacant!1141) lt!130259)) (not (= (index!6737 lt!130259) (index!6736 lt!130050))) (and (bvsge (index!6737 lt!130259) #b00000000000000000000000000000000) (bvslt (index!6737 lt!130259) (size!6289 (_keys!6930 thiss!1504))))) (or ((_ is Undefined!1141) lt!130259) (ite ((_ is Found!1141) lt!130259) (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6735 lt!130259)) key!932) (and ((_ is MissingVacant!1141) lt!130259) (= (index!6737 lt!130259) (index!6736 lt!130050)) (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6737 lt!130259)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62125 (= lt!130259 e!167617)))

(declare-fun c!43832 () Bool)

(assert (=> d!62125 (= c!43832 (bvsge (x!25009 lt!130050) #b01111111111111111111111111111110))))

(assert (=> d!62125 (= lt!130258 (select (arr!5942 (_keys!6930 thiss!1504)) (index!6736 lt!130050)))))

(assert (=> d!62125 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!62125 (= (seekKeyOrZeroReturnVacant!0 (x!25009 lt!130050) (index!6736 lt!130050) (index!6736 lt!130050) key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)) lt!130259)))

(assert (= (and d!62125 c!43832) b!258614))

(assert (= (and d!62125 (not c!43832)) b!258615))

(assert (= (and b!258615 c!43833) b!258611))

(assert (= (and b!258615 (not c!43833)) b!258612))

(assert (= (and b!258612 c!43834) b!258610))

(assert (= (and b!258612 (not c!43834)) b!258613))

(declare-fun m!274269 () Bool)

(assert (=> b!258613 m!274269))

(assert (=> b!258613 m!274269))

(declare-fun m!274271 () Bool)

(assert (=> b!258613 m!274271))

(declare-fun m!274273 () Bool)

(assert (=> d!62125 m!274273))

(declare-fun m!274275 () Bool)

(assert (=> d!62125 m!274275))

(assert (=> d!62125 m!273771))

(assert (=> d!62125 m!273459))

(assert (=> b!258310 d!62125))

(declare-fun d!62127 () Bool)

(declare-fun e!167620 () Bool)

(assert (=> d!62127 e!167620))

(declare-fun res!126461 () Bool)

(assert (=> d!62127 (=> res!126461 e!167620)))

(declare-fun lt!130262 () Bool)

(assert (=> d!62127 (= res!126461 (not lt!130262))))

(declare-fun lt!130261 () Bool)

(assert (=> d!62127 (= lt!130262 lt!130261)))

(declare-fun lt!130260 () Unit!7989)

(declare-fun e!167619 () Unit!7989)

(assert (=> d!62127 (= lt!130260 e!167619)))

(declare-fun c!43835 () Bool)

(assert (=> d!62127 (= c!43835 lt!130261)))

(assert (=> d!62127 (= lt!130261 (containsKey!305 (toList!1894 lt!130077) (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62127 (= (contains!1854 lt!130077 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)) lt!130262)))

(declare-fun b!258616 () Bool)

(declare-fun lt!130263 () Unit!7989)

(assert (=> b!258616 (= e!167619 lt!130263)))

(assert (=> b!258616 (= lt!130263 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!130077) (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258616 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130077) (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258617 () Bool)

(declare-fun Unit!8011 () Unit!7989)

(assert (=> b!258617 (= e!167619 Unit!8011)))

(declare-fun b!258618 () Bool)

(assert (=> b!258618 (= e!167620 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130077) (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62127 c!43835) b!258616))

(assert (= (and d!62127 (not c!43835)) b!258617))

(assert (= (and d!62127 (not res!126461)) b!258618))

(assert (=> d!62127 m!273687))

(declare-fun m!274277 () Bool)

(assert (=> d!62127 m!274277))

(assert (=> b!258616 m!273687))

(declare-fun m!274279 () Bool)

(assert (=> b!258616 m!274279))

(assert (=> b!258616 m!273687))

(declare-fun m!274281 () Bool)

(assert (=> b!258616 m!274281))

(assert (=> b!258616 m!274281))

(declare-fun m!274283 () Bool)

(assert (=> b!258616 m!274283))

(assert (=> b!258618 m!273687))

(assert (=> b!258618 m!274281))

(assert (=> b!258618 m!274281))

(assert (=> b!258618 m!274283))

(assert (=> b!258359 d!62127))

(declare-fun d!62129 () Bool)

(declare-fun e!167622 () Bool)

(assert (=> d!62129 e!167622))

(declare-fun res!126462 () Bool)

(assert (=> d!62129 (=> res!126462 e!167622)))

(declare-fun lt!130266 () Bool)

(assert (=> d!62129 (= res!126462 (not lt!130266))))

(declare-fun lt!130265 () Bool)

(assert (=> d!62129 (= lt!130266 lt!130265)))

(declare-fun lt!130264 () Unit!7989)

(declare-fun e!167621 () Unit!7989)

(assert (=> d!62129 (= lt!130264 e!167621)))

(declare-fun c!43836 () Bool)

(assert (=> d!62129 (= c!43836 lt!130265)))

(assert (=> d!62129 (= lt!130265 (containsKey!305 (toList!1894 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932))))

(assert (=> d!62129 (= (contains!1854 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) key!932) lt!130266)))

(declare-fun b!258619 () Bool)

(declare-fun lt!130267 () Unit!7989)

(assert (=> b!258619 (= e!167621 lt!130267)))

(assert (=> b!258619 (= lt!130267 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932))))

(assert (=> b!258619 (isDefined!254 (getValueByKey!314 (toList!1894 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932))))

(declare-fun b!258620 () Bool)

(declare-fun Unit!8012 () Unit!7989)

(assert (=> b!258620 (= e!167621 Unit!8012)))

(declare-fun b!258621 () Bool)

(assert (=> b!258621 (= e!167622 (isDefined!254 (getValueByKey!314 (toList!1894 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932)))))

(assert (= (and d!62129 c!43836) b!258619))

(assert (= (and d!62129 (not c!43836)) b!258620))

(assert (= (and d!62129 (not res!126462)) b!258621))

(declare-fun m!274285 () Bool)

(assert (=> d!62129 m!274285))

(declare-fun m!274287 () Bool)

(assert (=> b!258619 m!274287))

(declare-fun m!274289 () Bool)

(assert (=> b!258619 m!274289))

(assert (=> b!258619 m!274289))

(declare-fun m!274291 () Bool)

(assert (=> b!258619 m!274291))

(assert (=> b!258621 m!274289))

(assert (=> b!258621 m!274289))

(assert (=> b!258621 m!274291))

(assert (=> d!61987 d!62129))

(assert (=> d!61987 d!61995))

(declare-fun d!62131 () Bool)

(assert (=> d!62131 (contains!1854 (getCurrentListMap!1426 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) key!932)))

(assert (=> d!62131 true))

(declare-fun _$17!83 () Unit!7989)

(assert (=> d!62131 (= (choose!1252 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) _$17!83)))

(declare-fun bs!9128 () Bool)

(assert (= bs!9128 d!62131))

(assert (=> bs!9128 m!273447))

(assert (=> bs!9128 m!273447))

(assert (=> bs!9128 m!273773))

(assert (=> d!61987 d!62131))

(assert (=> d!61987 d!61981))

(declare-fun d!62133 () Bool)

(assert (=> d!62133 (= (apply!255 lt!130077 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)) (get!3063 (getValueByKey!314 (toList!1894 lt!130077) (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9129 () Bool)

(assert (= bs!9129 d!62133))

(assert (=> bs!9129 m!273687))

(assert (=> bs!9129 m!274281))

(assert (=> bs!9129 m!274281))

(declare-fun m!274293 () Bool)

(assert (=> bs!9129 m!274293))

(assert (=> b!258358 d!62133))

(declare-fun d!62135 () Bool)

(declare-fun c!43839 () Bool)

(assert (=> d!62135 (= c!43839 ((_ is ValueCellFull!2957) (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167625 () V!8449)

(assert (=> d!62135 (= (get!3062 (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!167625)))

(declare-fun b!258626 () Bool)

(declare-fun get!3064 (ValueCell!2957 V!8449) V!8449)

(assert (=> b!258626 (= e!167625 (get!3064 (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258627 () Bool)

(declare-fun get!3065 (ValueCell!2957 V!8449) V!8449)

(assert (=> b!258627 (= e!167625 (get!3065 (select (arr!5941 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62135 c!43839) b!258626))

(assert (= (and d!62135 (not c!43839)) b!258627))

(assert (=> b!258626 m!273835))

(assert (=> b!258626 m!273743))

(declare-fun m!274295 () Bool)

(assert (=> b!258626 m!274295))

(assert (=> b!258627 m!273835))

(assert (=> b!258627 m!273743))

(declare-fun m!274297 () Bool)

(assert (=> b!258627 m!274297))

(assert (=> b!258358 d!62135))

(declare-fun d!62137 () Bool)

(declare-fun e!167627 () Bool)

(assert (=> d!62137 e!167627))

(declare-fun res!126463 () Bool)

(assert (=> d!62137 (=> res!126463 e!167627)))

(declare-fun lt!130270 () Bool)

(assert (=> d!62137 (= res!126463 (not lt!130270))))

(declare-fun lt!130269 () Bool)

(assert (=> d!62137 (= lt!130270 lt!130269)))

(declare-fun lt!130268 () Unit!7989)

(declare-fun e!167626 () Unit!7989)

(assert (=> d!62137 (= lt!130268 e!167626)))

(declare-fun c!43840 () Bool)

(assert (=> d!62137 (= c!43840 lt!130269)))

(assert (=> d!62137 (= lt!130269 (containsKey!305 (toList!1894 lt!130019) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62137 (= (contains!1854 lt!130019 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130270)))

(declare-fun b!258628 () Bool)

(declare-fun lt!130271 () Unit!7989)

(assert (=> b!258628 (= e!167626 lt!130271)))

(assert (=> b!258628 (= lt!130271 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!130019) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258628 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130019) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258629 () Bool)

(declare-fun Unit!8013 () Unit!7989)

(assert (=> b!258629 (= e!167626 Unit!8013)))

(declare-fun b!258630 () Bool)

(assert (=> b!258630 (= e!167627 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130019) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62137 c!43840) b!258628))

(assert (= (and d!62137 (not c!43840)) b!258629))

(assert (= (and d!62137 (not res!126463)) b!258630))

(declare-fun m!274299 () Bool)

(assert (=> d!62137 m!274299))

(declare-fun m!274301 () Bool)

(assert (=> b!258628 m!274301))

(declare-fun m!274303 () Bool)

(assert (=> b!258628 m!274303))

(assert (=> b!258628 m!274303))

(declare-fun m!274305 () Bool)

(assert (=> b!258628 m!274305))

(assert (=> b!258630 m!274303))

(assert (=> b!258630 m!274303))

(assert (=> b!258630 m!274305))

(assert (=> bm!24545 d!62137))

(declare-fun lt!130274 () Bool)

(declare-fun d!62139 () Bool)

(declare-fun content!170 (List!3720) (InoxSet tuple2!4842))

(assert (=> d!62139 (= lt!130274 (select (content!170 (toList!1894 lt!129953)) (tuple2!4843 key!932 v!346)))))

(declare-fun e!167632 () Bool)

(assert (=> d!62139 (= lt!130274 e!167632)))

(declare-fun res!126468 () Bool)

(assert (=> d!62139 (=> (not res!126468) (not e!167632))))

(assert (=> d!62139 (= res!126468 ((_ is Cons!3716) (toList!1894 lt!129953)))))

(assert (=> d!62139 (= (contains!1857 (toList!1894 lt!129953) (tuple2!4843 key!932 v!346)) lt!130274)))

(declare-fun b!258635 () Bool)

(declare-fun e!167633 () Bool)

(assert (=> b!258635 (= e!167632 e!167633)))

(declare-fun res!126469 () Bool)

(assert (=> b!258635 (=> res!126469 e!167633)))

(assert (=> b!258635 (= res!126469 (= (h!4378 (toList!1894 lt!129953)) (tuple2!4843 key!932 v!346)))))

(declare-fun b!258636 () Bool)

(assert (=> b!258636 (= e!167633 (contains!1857 (t!8775 (toList!1894 lt!129953)) (tuple2!4843 key!932 v!346)))))

(assert (= (and d!62139 res!126468) b!258635))

(assert (= (and b!258635 (not res!126469)) b!258636))

(declare-fun m!274307 () Bool)

(assert (=> d!62139 m!274307))

(declare-fun m!274309 () Bool)

(assert (=> d!62139 m!274309))

(declare-fun m!274311 () Bool)

(assert (=> b!258636 m!274311))

(assert (=> b!258178 d!62139))

(assert (=> b!258362 d!62039))

(declare-fun d!62141 () Bool)

(assert (=> d!62141 (= (apply!255 lt!130019 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)) (get!3063 (getValueByKey!314 (toList!1894 lt!130019) (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))))

(declare-fun bs!9130 () Bool)

(assert (= bs!9130 d!62141))

(assert (=> bs!9130 m!273629))

(declare-fun m!274313 () Bool)

(assert (=> bs!9130 m!274313))

(assert (=> bs!9130 m!274313))

(declare-fun m!274315 () Bool)

(assert (=> bs!9130 m!274315))

(assert (=> b!258278 d!62141))

(declare-fun c!43841 () Bool)

(declare-fun d!62143 () Bool)

(assert (=> d!62143 (= c!43841 ((_ is ValueCellFull!2957) (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!167634 () V!8449)

(assert (=> d!62143 (= (get!3062 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!167634)))

(declare-fun b!258637 () Bool)

(assert (=> b!258637 (= e!167634 (get!3064 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258638 () Bool)

(assert (=> b!258638 (= e!167634 (get!3065 (select (arr!5941 (array!12548 (store (arr!5941 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6288 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!598 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62143 c!43841) b!258637))

(assert (= (and d!62143 (not c!43841)) b!258638))

(assert (=> b!258637 m!273741))

(assert (=> b!258637 m!273743))

(declare-fun m!274317 () Bool)

(assert (=> b!258637 m!274317))

(assert (=> b!258638 m!273741))

(assert (=> b!258638 m!273743))

(declare-fun m!274319 () Bool)

(assert (=> b!258638 m!274319))

(assert (=> b!258278 d!62143))

(assert (=> b!258200 d!62011))

(assert (=> d!61997 d!61985))

(declare-fun d!62145 () Bool)

(declare-fun e!167637 () Bool)

(assert (=> d!62145 e!167637))

(declare-fun res!126475 () Bool)

(assert (=> d!62145 (=> (not res!126475) (not e!167637))))

(declare-fun lt!130277 () SeekEntryResult!1141)

(assert (=> d!62145 (= res!126475 ((_ is Found!1141) lt!130277))))

(assert (=> d!62145 (= lt!130277 (seekEntryOrOpen!0 key!932 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(assert (=> d!62145 true))

(declare-fun _$33!174 () Unit!7989)

(assert (=> d!62145 (= (choose!1254 (_keys!6930 thiss!1504) (_values!4743 thiss!1504) (mask!11057 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) _$33!174)))

(declare-fun b!258643 () Bool)

(declare-fun res!126474 () Bool)

(assert (=> b!258643 (=> (not res!126474) (not e!167637))))

(assert (=> b!258643 (= res!126474 (inRange!0 (index!6735 lt!130277) (mask!11057 thiss!1504)))))

(declare-fun b!258644 () Bool)

(assert (=> b!258644 (= e!167637 (= (select (arr!5942 (_keys!6930 thiss!1504)) (index!6735 lt!130277)) key!932))))

(assert (= (and d!62145 res!126475) b!258643))

(assert (= (and b!258643 res!126474) b!258644))

(assert (=> d!62145 m!273437))

(declare-fun m!274321 () Bool)

(assert (=> b!258643 m!274321))

(declare-fun m!274323 () Bool)

(assert (=> b!258644 m!274323))

(assert (=> d!61997 d!62145))

(assert (=> d!61997 d!61981))

(assert (=> b!258221 d!62039))

(declare-fun d!62147 () Bool)

(declare-fun isEmpty!539 (Option!320) Bool)

(assert (=> d!62147 (= (isDefined!254 (getValueByKey!314 (toList!1894 lt!129839) key!932)) (not (isEmpty!539 (getValueByKey!314 (toList!1894 lt!129839) key!932))))))

(declare-fun bs!9131 () Bool)

(assert (= bs!9131 d!62147))

(assert (=> bs!9131 m!273789))

(declare-fun m!274325 () Bool)

(assert (=> bs!9131 m!274325))

(assert (=> b!258346 d!62147))

(declare-fun d!62149 () Bool)

(declare-fun c!43846 () Bool)

(assert (=> d!62149 (= c!43846 (and ((_ is Cons!3716) (toList!1894 lt!129839)) (= (_1!2432 (h!4378 (toList!1894 lt!129839))) key!932)))))

(declare-fun e!167642 () Option!320)

(assert (=> d!62149 (= (getValueByKey!314 (toList!1894 lt!129839) key!932) e!167642)))

(declare-fun b!258653 () Bool)

(assert (=> b!258653 (= e!167642 (Some!319 (_2!2432 (h!4378 (toList!1894 lt!129839)))))))

(declare-fun b!258656 () Bool)

(declare-fun e!167643 () Option!320)

(assert (=> b!258656 (= e!167643 None!318)))

(declare-fun b!258655 () Bool)

(assert (=> b!258655 (= e!167643 (getValueByKey!314 (t!8775 (toList!1894 lt!129839)) key!932))))

(declare-fun b!258654 () Bool)

(assert (=> b!258654 (= e!167642 e!167643)))

(declare-fun c!43847 () Bool)

(assert (=> b!258654 (= c!43847 (and ((_ is Cons!3716) (toList!1894 lt!129839)) (not (= (_1!2432 (h!4378 (toList!1894 lt!129839))) key!932))))))

(assert (= (and d!62149 c!43846) b!258653))

(assert (= (and d!62149 (not c!43846)) b!258654))

(assert (= (and b!258654 c!43847) b!258655))

(assert (= (and b!258654 (not c!43847)) b!258656))

(declare-fun m!274327 () Bool)

(assert (=> b!258655 m!274327))

(assert (=> b!258346 d!62149))

(declare-fun d!62151 () Bool)

(assert (=> d!62151 (= (apply!255 lt!130077 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1894 lt!130077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9132 () Bool)

(assert (= bs!9132 d!62151))

(declare-fun m!274329 () Bool)

(assert (=> bs!9132 m!274329))

(assert (=> bs!9132 m!274329))

(declare-fun m!274331 () Bool)

(assert (=> bs!9132 m!274331))

(assert (=> b!258360 d!62151))

(declare-fun d!62153 () Bool)

(declare-fun e!167644 () Bool)

(assert (=> d!62153 e!167644))

(declare-fun res!126476 () Bool)

(assert (=> d!62153 (=> (not res!126476) (not e!167644))))

(declare-fun lt!130279 () ListLongMap!3757)

(assert (=> d!62153 (= res!126476 (contains!1854 lt!130279 (_1!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun lt!130281 () List!3720)

(assert (=> d!62153 (= lt!130279 (ListLongMap!3758 lt!130281))))

(declare-fun lt!130280 () Unit!7989)

(declare-fun lt!130278 () Unit!7989)

(assert (=> d!62153 (= lt!130280 lt!130278)))

(assert (=> d!62153 (= (getValueByKey!314 lt!130281 (_1!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!319 (_2!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!62153 (= lt!130278 (lemmaContainsTupThenGetReturnValue!170 lt!130281 (_1!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!62153 (= lt!130281 (insertStrictlySorted!173 (toList!1894 (ite c!43772 call!24561 (ite c!43773 call!24559 call!24562))) (_1!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!62153 (= (+!691 (ite c!43772 call!24561 (ite c!43773 call!24559 call!24562)) (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) lt!130279)))

(declare-fun b!258657 () Bool)

(declare-fun res!126477 () Bool)

(assert (=> b!258657 (=> (not res!126477) (not e!167644))))

(assert (=> b!258657 (= res!126477 (= (getValueByKey!314 (toList!1894 lt!130279) (_1!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!319 (_2!2432 (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))))

(declare-fun b!258658 () Bool)

(assert (=> b!258658 (= e!167644 (contains!1857 (toList!1894 lt!130279) (ite (or c!43772 c!43773) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (= (and d!62153 res!126476) b!258657))

(assert (= (and b!258657 res!126477) b!258658))

(declare-fun m!274333 () Bool)

(assert (=> d!62153 m!274333))

(declare-fun m!274335 () Bool)

(assert (=> d!62153 m!274335))

(declare-fun m!274337 () Bool)

(assert (=> d!62153 m!274337))

(declare-fun m!274339 () Bool)

(assert (=> d!62153 m!274339))

(declare-fun m!274341 () Bool)

(assert (=> b!258657 m!274341))

(declare-fun m!274343 () Bool)

(assert (=> b!258658 m!274343))

(assert (=> bm!24556 d!62153))

(declare-fun d!62155 () Bool)

(assert (=> d!62155 (= (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) index!297)) (and (not (= (select (arr!5942 (_keys!6930 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5942 (_keys!6930 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258212 d!62155))

(assert (=> b!258155 d!62025))

(declare-fun d!62157 () Bool)

(declare-fun e!167646 () Bool)

(assert (=> d!62157 e!167646))

(declare-fun res!126478 () Bool)

(assert (=> d!62157 (=> res!126478 e!167646)))

(declare-fun lt!130284 () Bool)

(assert (=> d!62157 (= res!126478 (not lt!130284))))

(declare-fun lt!130283 () Bool)

(assert (=> d!62157 (= lt!130284 lt!130283)))

(declare-fun lt!130282 () Unit!7989)

(declare-fun e!167645 () Unit!7989)

(assert (=> d!62157 (= lt!130282 e!167645)))

(declare-fun c!43848 () Bool)

(assert (=> d!62157 (= c!43848 lt!130283)))

(assert (=> d!62157 (= lt!130283 (containsKey!305 (toList!1894 lt!130019) (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(assert (=> d!62157 (= (contains!1854 lt!130019 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)) lt!130284)))

(declare-fun b!258659 () Bool)

(declare-fun lt!130285 () Unit!7989)

(assert (=> b!258659 (= e!167645 lt!130285)))

(assert (=> b!258659 (= lt!130285 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!130019) (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(assert (=> b!258659 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130019) (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(declare-fun b!258660 () Bool)

(declare-fun Unit!8014 () Unit!7989)

(assert (=> b!258660 (= e!167645 Unit!8014)))

(declare-fun b!258661 () Bool)

(assert (=> b!258661 (= e!167646 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130019) (select (arr!5942 lt!129838) #b00000000000000000000000000000000))))))

(assert (= (and d!62157 c!43848) b!258659))

(assert (= (and d!62157 (not c!43848)) b!258660))

(assert (= (and d!62157 (not res!126478)) b!258661))

(assert (=> d!62157 m!273629))

(declare-fun m!274345 () Bool)

(assert (=> d!62157 m!274345))

(assert (=> b!258659 m!273629))

(declare-fun m!274347 () Bool)

(assert (=> b!258659 m!274347))

(assert (=> b!258659 m!273629))

(assert (=> b!258659 m!274313))

(assert (=> b!258659 m!274313))

(declare-fun m!274349 () Bool)

(assert (=> b!258659 m!274349))

(assert (=> b!258661 m!273629))

(assert (=> b!258661 m!274313))

(assert (=> b!258661 m!274313))

(assert (=> b!258661 m!274349))

(assert (=> b!258279 d!62157))

(declare-fun d!62159 () Bool)

(declare-fun e!167648 () Bool)

(assert (=> d!62159 e!167648))

(declare-fun res!126479 () Bool)

(assert (=> d!62159 (=> res!126479 e!167648)))

(declare-fun lt!130288 () Bool)

(assert (=> d!62159 (= res!126479 (not lt!130288))))

(declare-fun lt!130287 () Bool)

(assert (=> d!62159 (= lt!130288 lt!130287)))

(declare-fun lt!130286 () Unit!7989)

(declare-fun e!167647 () Unit!7989)

(assert (=> d!62159 (= lt!130286 e!167647)))

(declare-fun c!43849 () Bool)

(assert (=> d!62159 (= c!43849 lt!130287)))

(assert (=> d!62159 (= lt!130287 (containsKey!305 (toList!1894 lt!129953) (_1!2432 (tuple2!4843 key!932 v!346))))))

(assert (=> d!62159 (= (contains!1854 lt!129953 (_1!2432 (tuple2!4843 key!932 v!346))) lt!130288)))

(declare-fun b!258662 () Bool)

(declare-fun lt!130289 () Unit!7989)

(assert (=> b!258662 (= e!167647 lt!130289)))

(assert (=> b!258662 (= lt!130289 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!129953) (_1!2432 (tuple2!4843 key!932 v!346))))))

(assert (=> b!258662 (isDefined!254 (getValueByKey!314 (toList!1894 lt!129953) (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun b!258663 () Bool)

(declare-fun Unit!8015 () Unit!7989)

(assert (=> b!258663 (= e!167647 Unit!8015)))

(declare-fun b!258664 () Bool)

(assert (=> b!258664 (= e!167648 (isDefined!254 (getValueByKey!314 (toList!1894 lt!129953) (_1!2432 (tuple2!4843 key!932 v!346)))))))

(assert (= (and d!62159 c!43849) b!258662))

(assert (= (and d!62159 (not c!43849)) b!258663))

(assert (= (and d!62159 (not res!126479)) b!258664))

(declare-fun m!274351 () Bool)

(assert (=> d!62159 m!274351))

(declare-fun m!274353 () Bool)

(assert (=> b!258662 m!274353))

(assert (=> b!258662 m!273659))

(assert (=> b!258662 m!273659))

(declare-fun m!274355 () Bool)

(assert (=> b!258662 m!274355))

(assert (=> b!258664 m!273659))

(assert (=> b!258664 m!273659))

(assert (=> b!258664 m!274355))

(assert (=> d!61959 d!62159))

(declare-fun c!43850 () Bool)

(declare-fun d!62161 () Bool)

(assert (=> d!62161 (= c!43850 (and ((_ is Cons!3716) lt!129955) (= (_1!2432 (h!4378 lt!129955)) (_1!2432 (tuple2!4843 key!932 v!346)))))))

(declare-fun e!167649 () Option!320)

(assert (=> d!62161 (= (getValueByKey!314 lt!129955 (_1!2432 (tuple2!4843 key!932 v!346))) e!167649)))

(declare-fun b!258665 () Bool)

(assert (=> b!258665 (= e!167649 (Some!319 (_2!2432 (h!4378 lt!129955))))))

(declare-fun b!258668 () Bool)

(declare-fun e!167650 () Option!320)

(assert (=> b!258668 (= e!167650 None!318)))

(declare-fun b!258667 () Bool)

(assert (=> b!258667 (= e!167650 (getValueByKey!314 (t!8775 lt!129955) (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun b!258666 () Bool)

(assert (=> b!258666 (= e!167649 e!167650)))

(declare-fun c!43851 () Bool)

(assert (=> b!258666 (= c!43851 (and ((_ is Cons!3716) lt!129955) (not (= (_1!2432 (h!4378 lt!129955)) (_1!2432 (tuple2!4843 key!932 v!346))))))))

(assert (= (and d!62161 c!43850) b!258665))

(assert (= (and d!62161 (not c!43850)) b!258666))

(assert (= (and b!258666 c!43851) b!258667))

(assert (= (and b!258666 (not c!43851)) b!258668))

(declare-fun m!274357 () Bool)

(assert (=> b!258667 m!274357))

(assert (=> d!61959 d!62161))

(declare-fun d!62163 () Bool)

(assert (=> d!62163 (= (getValueByKey!314 lt!129955 (_1!2432 (tuple2!4843 key!932 v!346))) (Some!319 (_2!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun lt!130292 () Unit!7989)

(declare-fun choose!1257 (List!3720 (_ BitVec 64) V!8449) Unit!7989)

(assert (=> d!62163 (= lt!130292 (choose!1257 lt!129955 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun e!167653 () Bool)

(assert (=> d!62163 e!167653))

(declare-fun res!126484 () Bool)

(assert (=> d!62163 (=> (not res!126484) (not e!167653))))

(declare-fun isStrictlySorted!360 (List!3720) Bool)

(assert (=> d!62163 (= res!126484 (isStrictlySorted!360 lt!129955))))

(assert (=> d!62163 (= (lemmaContainsTupThenGetReturnValue!170 lt!129955 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))) lt!130292)))

(declare-fun b!258673 () Bool)

(declare-fun res!126485 () Bool)

(assert (=> b!258673 (=> (not res!126485) (not e!167653))))

(assert (=> b!258673 (= res!126485 (containsKey!305 lt!129955 (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun b!258674 () Bool)

(assert (=> b!258674 (= e!167653 (contains!1857 lt!129955 (tuple2!4843 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346)))))))

(assert (= (and d!62163 res!126484) b!258673))

(assert (= (and b!258673 res!126485) b!258674))

(assert (=> d!62163 m!273653))

(declare-fun m!274359 () Bool)

(assert (=> d!62163 m!274359))

(declare-fun m!274361 () Bool)

(assert (=> d!62163 m!274361))

(declare-fun m!274363 () Bool)

(assert (=> b!258673 m!274363))

(declare-fun m!274365 () Bool)

(assert (=> b!258674 m!274365))

(assert (=> d!61959 d!62163))

(declare-fun b!258695 () Bool)

(declare-fun e!167664 () List!3720)

(declare-fun e!167666 () List!3720)

(assert (=> b!258695 (= e!167664 e!167666)))

(declare-fun c!43862 () Bool)

(assert (=> b!258695 (= c!43862 (and ((_ is Cons!3716) (toList!1894 lt!129839)) (= (_1!2432 (h!4378 (toList!1894 lt!129839))) (_1!2432 (tuple2!4843 key!932 v!346)))))))

(declare-fun b!258696 () Bool)

(declare-fun e!167667 () Bool)

(declare-fun lt!130295 () List!3720)

(assert (=> b!258696 (= e!167667 (contains!1857 lt!130295 (tuple2!4843 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346)))))))

(declare-fun b!258697 () Bool)

(declare-fun call!24593 () List!3720)

(assert (=> b!258697 (= e!167664 call!24593)))

(declare-fun e!167665 () List!3720)

(declare-fun c!43860 () Bool)

(declare-fun bm!24590 () Bool)

(declare-fun $colon$colon!103 (List!3720 tuple2!4842) List!3720)

(assert (=> bm!24590 (= call!24593 ($colon$colon!103 e!167665 (ite c!43860 (h!4378 (toList!1894 lt!129839)) (tuple2!4843 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))))

(declare-fun c!43863 () Bool)

(assert (=> bm!24590 (= c!43863 c!43860)))

(declare-fun b!258698 () Bool)

(declare-fun call!24595 () List!3720)

(assert (=> b!258698 (= e!167666 call!24595)))

(declare-fun b!258699 () Bool)

(declare-fun e!167668 () List!3720)

(declare-fun call!24594 () List!3720)

(assert (=> b!258699 (= e!167668 call!24594)))

(declare-fun b!258700 () Bool)

(assert (=> b!258700 (= e!167668 call!24594)))

(declare-fun b!258701 () Bool)

(declare-fun res!126491 () Bool)

(assert (=> b!258701 (=> (not res!126491) (not e!167667))))

(assert (=> b!258701 (= res!126491 (containsKey!305 lt!130295 (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun b!258702 () Bool)

(assert (=> b!258702 (= e!167665 (insertStrictlySorted!173 (t!8775 (toList!1894 lt!129839)) (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun d!62165 () Bool)

(assert (=> d!62165 e!167667))

(declare-fun res!126490 () Bool)

(assert (=> d!62165 (=> (not res!126490) (not e!167667))))

(assert (=> d!62165 (= res!126490 (isStrictlySorted!360 lt!130295))))

(assert (=> d!62165 (= lt!130295 e!167664)))

(assert (=> d!62165 (= c!43860 (and ((_ is Cons!3716) (toList!1894 lt!129839)) (bvslt (_1!2432 (h!4378 (toList!1894 lt!129839))) (_1!2432 (tuple2!4843 key!932 v!346)))))))

(assert (=> d!62165 (isStrictlySorted!360 (toList!1894 lt!129839))))

(assert (=> d!62165 (= (insertStrictlySorted!173 (toList!1894 lt!129839) (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))) lt!130295)))

(declare-fun bm!24591 () Bool)

(assert (=> bm!24591 (= call!24594 call!24595)))

(declare-fun c!43861 () Bool)

(declare-fun b!258703 () Bool)

(assert (=> b!258703 (= c!43861 (and ((_ is Cons!3716) (toList!1894 lt!129839)) (bvsgt (_1!2432 (h!4378 (toList!1894 lt!129839))) (_1!2432 (tuple2!4843 key!932 v!346)))))))

(assert (=> b!258703 (= e!167666 e!167668)))

(declare-fun b!258704 () Bool)

(assert (=> b!258704 (= e!167665 (ite c!43862 (t!8775 (toList!1894 lt!129839)) (ite c!43861 (Cons!3716 (h!4378 (toList!1894 lt!129839)) (t!8775 (toList!1894 lt!129839))) Nil!3717)))))

(declare-fun bm!24592 () Bool)

(assert (=> bm!24592 (= call!24595 call!24593)))

(assert (= (and d!62165 c!43860) b!258697))

(assert (= (and d!62165 (not c!43860)) b!258695))

(assert (= (and b!258695 c!43862) b!258698))

(assert (= (and b!258695 (not c!43862)) b!258703))

(assert (= (and b!258703 c!43861) b!258700))

(assert (= (and b!258703 (not c!43861)) b!258699))

(assert (= (or b!258700 b!258699) bm!24591))

(assert (= (or b!258698 bm!24591) bm!24592))

(assert (= (or b!258697 bm!24592) bm!24590))

(assert (= (and bm!24590 c!43863) b!258702))

(assert (= (and bm!24590 (not c!43863)) b!258704))

(assert (= (and d!62165 res!126490) b!258701))

(assert (= (and b!258701 res!126491) b!258696))

(declare-fun m!274367 () Bool)

(assert (=> b!258701 m!274367))

(declare-fun m!274369 () Bool)

(assert (=> b!258702 m!274369))

(declare-fun m!274371 () Bool)

(assert (=> d!62165 m!274371))

(declare-fun m!274373 () Bool)

(assert (=> d!62165 m!274373))

(declare-fun m!274375 () Bool)

(assert (=> b!258696 m!274375))

(declare-fun m!274377 () Bool)

(assert (=> bm!24590 m!274377))

(assert (=> d!61959 d!62165))

(declare-fun b!258705 () Bool)

(declare-fun e!167671 () Bool)

(declare-fun call!24596 () Bool)

(assert (=> b!258705 (= e!167671 call!24596)))

(declare-fun c!43864 () Bool)

(declare-fun bm!24593 () Bool)

(assert (=> bm!24593 (= call!24596 (arrayNoDuplicates!0 lt!129838 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!43864 (Cons!3717 (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!43718 (Cons!3717 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) Nil!3718) Nil!3718)) (ite c!43718 (Cons!3717 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) Nil!3718) Nil!3718))))))

(declare-fun b!258706 () Bool)

(assert (=> b!258706 (= e!167671 call!24596)))

(declare-fun b!258707 () Bool)

(declare-fun e!167669 () Bool)

(assert (=> b!258707 (= e!167669 e!167671)))

(assert (=> b!258707 (= c!43864 (validKeyInArray!0 (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258708 () Bool)

(declare-fun e!167672 () Bool)

(assert (=> b!258708 (= e!167672 e!167669)))

(declare-fun res!126493 () Bool)

(assert (=> b!258708 (=> (not res!126493) (not e!167669))))

(declare-fun e!167670 () Bool)

(assert (=> b!258708 (= res!126493 (not e!167670))))

(declare-fun res!126492 () Bool)

(assert (=> b!258708 (=> (not res!126492) (not e!167670))))

(assert (=> b!258708 (= res!126492 (validKeyInArray!0 (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258709 () Bool)

(assert (=> b!258709 (= e!167670 (contains!1856 (ite c!43718 (Cons!3717 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) Nil!3718) Nil!3718) (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62167 () Bool)

(declare-fun res!126494 () Bool)

(assert (=> d!62167 (=> res!126494 e!167672)))

(assert (=> d!62167 (= res!126494 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 lt!129838)))))

(assert (=> d!62167 (= (arrayNoDuplicates!0 lt!129838 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43718 (Cons!3717 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) Nil!3718) Nil!3718)) e!167672)))

(assert (= (and d!62167 (not res!126494)) b!258708))

(assert (= (and b!258708 res!126492) b!258709))

(assert (= (and b!258708 res!126493) b!258707))

(assert (= (and b!258707 c!43864) b!258706))

(assert (= (and b!258707 (not c!43864)) b!258705))

(assert (= (or b!258706 b!258705) bm!24593))

(assert (=> bm!24593 m!274105))

(declare-fun m!274379 () Bool)

(assert (=> bm!24593 m!274379))

(assert (=> b!258707 m!274105))

(assert (=> b!258707 m!274105))

(assert (=> b!258707 m!274107))

(assert (=> b!258708 m!274105))

(assert (=> b!258708 m!274105))

(assert (=> b!258708 m!274107))

(assert (=> b!258709 m!274105))

(assert (=> b!258709 m!274105))

(declare-fun m!274381 () Bool)

(assert (=> b!258709 m!274381))

(assert (=> bm!24517 d!62167))

(assert (=> d!61979 d!61961))

(declare-fun d!62169 () Bool)

(assert (=> d!62169 (arrayContainsKey!0 lt!129838 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62169 true))

(declare-fun _$60!378 () Unit!7989)

(assert (=> d!62169 (= (choose!13 lt!129838 key!932 index!297) _$60!378)))

(declare-fun bs!9133 () Bool)

(assert (= bs!9133 d!62169))

(assert (=> bs!9133 m!273487))

(assert (=> d!61979 d!62169))

(declare-fun d!62171 () Bool)

(declare-fun res!126495 () Bool)

(declare-fun e!167673 () Bool)

(assert (=> d!62171 (=> res!126495 e!167673)))

(assert (=> d!62171 (= res!126495 (= (select (arr!5942 (_keys!6930 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62171 (= (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167673)))

(declare-fun b!258710 () Bool)

(declare-fun e!167674 () Bool)

(assert (=> b!258710 (= e!167673 e!167674)))

(declare-fun res!126496 () Bool)

(assert (=> b!258710 (=> (not res!126496) (not e!167674))))

(assert (=> b!258710 (= res!126496 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258711 () Bool)

(assert (=> b!258711 (= e!167674 (arrayContainsKey!0 (_keys!6930 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62171 (not res!126495)) b!258710))

(assert (= (and b!258710 res!126496) b!258711))

(assert (=> d!62171 m!273945))

(declare-fun m!274383 () Bool)

(assert (=> b!258711 m!274383))

(assert (=> b!258217 d!62171))

(assert (=> b!258193 d!62025))

(declare-fun d!62173 () Bool)

(assert (=> d!62173 (= (apply!255 lt!130077 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1894 lt!130077) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9134 () Bool)

(assert (= bs!9134 d!62173))

(assert (=> bs!9134 m!274003))

(assert (=> bs!9134 m!274003))

(declare-fun m!274385 () Bool)

(assert (=> bs!9134 m!274385))

(assert (=> b!258348 d!62173))

(declare-fun d!62175 () Bool)

(assert (=> d!62175 (= (arrayCountValidKeys!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6930 thiss!1504) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62175 true))

(declare-fun _$84!36 () Unit!7989)

(assert (=> d!62175 (= (choose!1 (_keys!6930 thiss!1504) index!297 key!932) _$84!36)))

(declare-fun bs!9135 () Bool)

(assert (= bs!9135 d!62175))

(assert (=> bs!9135 m!273479))

(assert (=> bs!9135 m!273683))

(assert (=> bs!9135 m!273491))

(assert (=> d!61969 d!62175))

(declare-fun c!43865 () Bool)

(declare-fun d!62177 () Bool)

(assert (=> d!62177 (= c!43865 (and ((_ is Cons!3716) (toList!1894 lt!129953)) (= (_1!2432 (h!4378 (toList!1894 lt!129953))) (_1!2432 (tuple2!4843 key!932 v!346)))))))

(declare-fun e!167675 () Option!320)

(assert (=> d!62177 (= (getValueByKey!314 (toList!1894 lt!129953) (_1!2432 (tuple2!4843 key!932 v!346))) e!167675)))

(declare-fun b!258712 () Bool)

(assert (=> b!258712 (= e!167675 (Some!319 (_2!2432 (h!4378 (toList!1894 lt!129953)))))))

(declare-fun b!258715 () Bool)

(declare-fun e!167676 () Option!320)

(assert (=> b!258715 (= e!167676 None!318)))

(declare-fun b!258714 () Bool)

(assert (=> b!258714 (= e!167676 (getValueByKey!314 (t!8775 (toList!1894 lt!129953)) (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun b!258713 () Bool)

(assert (=> b!258713 (= e!167675 e!167676)))

(declare-fun c!43866 () Bool)

(assert (=> b!258713 (= c!43866 (and ((_ is Cons!3716) (toList!1894 lt!129953)) (not (= (_1!2432 (h!4378 (toList!1894 lt!129953))) (_1!2432 (tuple2!4843 key!932 v!346))))))))

(assert (= (and d!62177 c!43865) b!258712))

(assert (= (and d!62177 (not c!43865)) b!258713))

(assert (= (and b!258713 c!43866) b!258714))

(assert (= (and b!258713 (not c!43866)) b!258715))

(declare-fun m!274387 () Bool)

(assert (=> b!258714 m!274387))

(assert (=> b!258177 d!62177))

(declare-fun d!62179 () Bool)

(assert (=> d!62179 (= (inRange!0 (index!6735 lt!130098) (mask!11057 thiss!1504)) (and (bvsge (index!6735 lt!130098) #b00000000000000000000000000000000) (bvslt (index!6735 lt!130098) (bvadd (mask!11057 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258372 d!62179))

(declare-fun d!62181 () Bool)

(assert (=> d!62181 (arrayNoDuplicates!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000000 Nil!3718)))

(assert (=> d!62181 true))

(declare-fun _$65!86 () Unit!7989)

(assert (=> d!62181 (= (choose!41 (_keys!6930 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3718) _$65!86)))

(declare-fun bs!9136 () Bool)

(assert (= bs!9136 d!62181))

(assert (=> bs!9136 m!273479))

(assert (=> bs!9136 m!273669))

(assert (=> d!61965 d!62181))

(assert (=> b!258282 d!62025))

(declare-fun d!62183 () Bool)

(assert (=> d!62183 (= (apply!255 lt!130019 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1894 lt!130019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9137 () Bool)

(assert (= bs!9137 d!62183))

(assert (=> bs!9137 m!273993))

(assert (=> bs!9137 m!273993))

(declare-fun m!274389 () Bool)

(assert (=> bs!9137 m!274389))

(assert (=> b!258280 d!62183))

(assert (=> d!61977 d!61981))

(declare-fun b!258716 () Bool)

(declare-fun e!167679 () Bool)

(declare-fun call!24597 () Bool)

(assert (=> b!258716 (= e!167679 call!24597)))

(declare-fun bm!24594 () Bool)

(declare-fun c!43867 () Bool)

(assert (=> bm!24594 (= call!24597 (arrayNoDuplicates!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43867 (Cons!3717 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000) Nil!3718) Nil!3718)))))

(declare-fun b!258717 () Bool)

(assert (=> b!258717 (= e!167679 call!24597)))

(declare-fun b!258718 () Bool)

(declare-fun e!167677 () Bool)

(assert (=> b!258718 (= e!167677 e!167679)))

(assert (=> b!258718 (= c!43867 (validKeyInArray!0 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258719 () Bool)

(declare-fun e!167680 () Bool)

(assert (=> b!258719 (= e!167680 e!167677)))

(declare-fun res!126498 () Bool)

(assert (=> b!258719 (=> (not res!126498) (not e!167677))))

(declare-fun e!167678 () Bool)

(assert (=> b!258719 (= res!126498 (not e!167678))))

(declare-fun res!126497 () Bool)

(assert (=> b!258719 (=> (not res!126497) (not e!167678))))

(assert (=> b!258719 (= res!126497 (validKeyInArray!0 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258720 () Bool)

(assert (=> b!258720 (= e!167678 (contains!1856 Nil!3718 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62185 () Bool)

(declare-fun res!126499 () Bool)

(assert (=> d!62185 (=> res!126499 e!167680)))

(assert (=> d!62185 (= res!126499 (bvsge #b00000000000000000000000000000000 (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))

(assert (=> d!62185 (= (arrayNoDuplicates!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000000 Nil!3718) e!167680)))

(assert (= (and d!62185 (not res!126499)) b!258719))

(assert (= (and b!258719 res!126497) b!258720))

(assert (= (and b!258719 res!126498) b!258718))

(assert (= (and b!258718 c!43867) b!258717))

(assert (= (and b!258718 (not c!43867)) b!258716))

(assert (= (or b!258717 b!258716) bm!24594))

(assert (=> bm!24594 m!273873))

(declare-fun m!274391 () Bool)

(assert (=> bm!24594 m!274391))

(assert (=> b!258718 m!273873))

(assert (=> b!258718 m!273873))

(assert (=> b!258718 m!273909))

(assert (=> b!258719 m!273873))

(assert (=> b!258719 m!273873))

(assert (=> b!258719 m!273909))

(assert (=> b!258720 m!273873))

(assert (=> b!258720 m!273873))

(declare-fun m!274393 () Bool)

(assert (=> b!258720 m!274393))

(assert (=> b!258199 d!62185))

(declare-fun b!258721 () Bool)

(declare-fun e!167681 () Bool)

(declare-fun call!24598 () Bool)

(assert (=> b!258721 (= e!167681 call!24598)))

(declare-fun bm!24595 () Bool)

(assert (=> bm!24595 (= call!24598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6930 thiss!1504) (mask!11057 thiss!1504)))))

(declare-fun d!62187 () Bool)

(declare-fun res!126500 () Bool)

(declare-fun e!167683 () Bool)

(assert (=> d!62187 (=> res!126500 e!167683)))

(assert (=> d!62187 (= res!126500 (bvsge #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!62187 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6930 thiss!1504) (mask!11057 thiss!1504)) e!167683)))

(declare-fun b!258722 () Bool)

(declare-fun e!167682 () Bool)

(assert (=> b!258722 (= e!167681 e!167682)))

(declare-fun lt!130296 () (_ BitVec 64))

(assert (=> b!258722 (= lt!130296 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130297 () Unit!7989)

(assert (=> b!258722 (= lt!130297 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6930 thiss!1504) lt!130296 #b00000000000000000000000000000000))))

(assert (=> b!258722 (arrayContainsKey!0 (_keys!6930 thiss!1504) lt!130296 #b00000000000000000000000000000000)))

(declare-fun lt!130298 () Unit!7989)

(assert (=> b!258722 (= lt!130298 lt!130297)))

(declare-fun res!126501 () Bool)

(assert (=> b!258722 (= res!126501 (= (seekEntryOrOpen!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000) (_keys!6930 thiss!1504) (mask!11057 thiss!1504)) (Found!1141 #b00000000000000000000000000000000)))))

(assert (=> b!258722 (=> (not res!126501) (not e!167682))))

(declare-fun b!258723 () Bool)

(assert (=> b!258723 (= e!167683 e!167681)))

(declare-fun c!43868 () Bool)

(assert (=> b!258723 (= c!43868 (validKeyInArray!0 (select (arr!5942 (_keys!6930 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258724 () Bool)

(assert (=> b!258724 (= e!167682 call!24598)))

(assert (= (and d!62187 (not res!126500)) b!258723))

(assert (= (and b!258723 c!43868) b!258722))

(assert (= (and b!258723 (not c!43868)) b!258721))

(assert (= (and b!258722 res!126501) b!258724))

(assert (= (or b!258724 b!258721) bm!24595))

(declare-fun m!274395 () Bool)

(assert (=> bm!24595 m!274395))

(assert (=> b!258722 m!273687))

(declare-fun m!274397 () Bool)

(assert (=> b!258722 m!274397))

(declare-fun m!274399 () Bool)

(assert (=> b!258722 m!274399))

(assert (=> b!258722 m!273687))

(declare-fun m!274401 () Bool)

(assert (=> b!258722 m!274401))

(assert (=> b!258723 m!273687))

(assert (=> b!258723 m!273687))

(assert (=> b!258723 m!273697))

(assert (=> b!258381 d!62187))

(declare-fun d!62189 () Bool)

(declare-fun lt!130299 () (_ BitVec 32))

(assert (=> d!62189 (and (bvsge lt!130299 #b00000000000000000000000000000000) (bvsle lt!130299 (bvsub (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!167685 () (_ BitVec 32))

(assert (=> d!62189 (= lt!130299 e!167685)))

(declare-fun c!43870 () Bool)

(assert (=> d!62189 (= c!43870 (bvsge #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))))))

(assert (=> d!62189 (and (bvsle #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6289 (_keys!6930 thiss!1504)) (size!6289 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))))))))

(assert (=> d!62189 (= (arrayCountValidKeys!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) #b00000000000000000000000000000000 (size!6289 (_keys!6930 thiss!1504))) lt!130299)))

(declare-fun bm!24596 () Bool)

(declare-fun call!24599 () (_ BitVec 32))

(assert (=> bm!24596 (= call!24599 (arrayCountValidKeys!0 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 (_keys!6930 thiss!1504))))))

(declare-fun b!258725 () Bool)

(declare-fun e!167684 () (_ BitVec 32))

(assert (=> b!258725 (= e!167685 e!167684)))

(declare-fun c!43869 () Bool)

(assert (=> b!258725 (= c!43869 (validKeyInArray!0 (select (arr!5942 (array!12550 (store (arr!5942 (_keys!6930 thiss!1504)) index!297 key!932) (size!6289 (_keys!6930 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258726 () Bool)

(assert (=> b!258726 (= e!167684 call!24599)))

(declare-fun b!258727 () Bool)

(assert (=> b!258727 (= e!167685 #b00000000000000000000000000000000)))

(declare-fun b!258728 () Bool)

(assert (=> b!258728 (= e!167684 (bvadd #b00000000000000000000000000000001 call!24599))))

(assert (= (and d!62189 c!43870) b!258727))

(assert (= (and d!62189 (not c!43870)) b!258725))

(assert (= (and b!258725 c!43869) b!258728))

(assert (= (and b!258725 (not c!43869)) b!258726))

(assert (= (or b!258728 b!258726) bm!24596))

(declare-fun m!274403 () Bool)

(assert (=> bm!24596 m!274403))

(assert (=> b!258725 m!273873))

(assert (=> b!258725 m!273873))

(assert (=> b!258725 m!273909))

(assert (=> b!258215 d!62189))

(assert (=> b!258215 d!61975))

(declare-fun d!62191 () Bool)

(declare-fun res!126502 () Bool)

(declare-fun e!167686 () Bool)

(assert (=> d!62191 (=> res!126502 e!167686)))

(assert (=> d!62191 (= res!126502 (= (select (arr!5942 lt!129838) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62191 (= (arrayContainsKey!0 lt!129838 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167686)))

(declare-fun b!258729 () Bool)

(declare-fun e!167687 () Bool)

(assert (=> b!258729 (= e!167686 e!167687)))

(declare-fun res!126503 () Bool)

(assert (=> b!258729 (=> (not res!126503) (not e!167687))))

(assert (=> b!258729 (= res!126503 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6289 lt!129838)))))

(declare-fun b!258730 () Bool)

(assert (=> b!258730 (= e!167687 (arrayContainsKey!0 lt!129838 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62191 (not res!126502)) b!258729))

(assert (= (and b!258729 res!126503) b!258730))

(assert (=> d!62191 m!274105))

(declare-fun m!274405 () Bool)

(assert (=> b!258730 m!274405))

(assert (=> b!258184 d!62191))

(declare-fun b!258742 () Bool)

(declare-fun e!167690 () Bool)

(assert (=> b!258742 (= e!167690 (and (bvsge (extraKeys!4497 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4497 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1956 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!258739 () Bool)

(declare-fun res!126515 () Bool)

(assert (=> b!258739 (=> (not res!126515) (not e!167690))))

(assert (=> b!258739 (= res!126515 (and (= (size!6288 (_values!4743 thiss!1504)) (bvadd (mask!11057 thiss!1504) #b00000000000000000000000000000001)) (= (size!6289 (_keys!6930 thiss!1504)) (size!6288 (_values!4743 thiss!1504))) (bvsge (_size!1956 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1956 thiss!1504) (bvadd (mask!11057 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!258740 () Bool)

(declare-fun res!126514 () Bool)

(assert (=> b!258740 (=> (not res!126514) (not e!167690))))

(declare-fun size!6294 (LongMapFixedSize!3814) (_ BitVec 32))

(assert (=> b!258740 (= res!126514 (bvsge (size!6294 thiss!1504) (_size!1956 thiss!1504)))))

(declare-fun d!62193 () Bool)

(declare-fun res!126512 () Bool)

(assert (=> d!62193 (=> (not res!126512) (not e!167690))))

(assert (=> d!62193 (= res!126512 (validMask!0 (mask!11057 thiss!1504)))))

(assert (=> d!62193 (= (simpleValid!278 thiss!1504) e!167690)))

(declare-fun b!258741 () Bool)

(declare-fun res!126513 () Bool)

(assert (=> b!258741 (=> (not res!126513) (not e!167690))))

(assert (=> b!258741 (= res!126513 (= (size!6294 thiss!1504) (bvadd (_size!1956 thiss!1504) (bvsdiv (bvadd (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!62193 res!126512) b!258739))

(assert (= (and b!258739 res!126515) b!258740))

(assert (= (and b!258740 res!126514) b!258741))

(assert (= (and b!258741 res!126513) b!258742))

(declare-fun m!274407 () Bool)

(assert (=> b!258740 m!274407))

(assert (=> d!62193 m!273459))

(assert (=> b!258741 m!274407))

(assert (=> d!62003 d!62193))

(declare-fun d!62195 () Bool)

(assert (=> d!62195 (isDefined!254 (getValueByKey!314 (toList!1894 lt!129839) key!932))))

(declare-fun lt!130302 () Unit!7989)

(declare-fun choose!1258 (List!3720 (_ BitVec 64)) Unit!7989)

(assert (=> d!62195 (= lt!130302 (choose!1258 (toList!1894 lt!129839) key!932))))

(declare-fun e!167693 () Bool)

(assert (=> d!62195 e!167693))

(declare-fun res!126518 () Bool)

(assert (=> d!62195 (=> (not res!126518) (not e!167693))))

(assert (=> d!62195 (= res!126518 (isStrictlySorted!360 (toList!1894 lt!129839)))))

(assert (=> d!62195 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!129839) key!932) lt!130302)))

(declare-fun b!258745 () Bool)

(assert (=> b!258745 (= e!167693 (containsKey!305 (toList!1894 lt!129839) key!932))))

(assert (= (and d!62195 res!126518) b!258745))

(assert (=> d!62195 m!273789))

(assert (=> d!62195 m!273789))

(assert (=> d!62195 m!273791))

(declare-fun m!274409 () Bool)

(assert (=> d!62195 m!274409))

(assert (=> d!62195 m!274373))

(assert (=> b!258745 m!273785))

(assert (=> b!258344 d!62195))

(assert (=> b!258344 d!62147))

(assert (=> b!258344 d!62149))

(declare-fun d!62197 () Bool)

(declare-fun e!167695 () Bool)

(assert (=> d!62197 e!167695))

(declare-fun res!126519 () Bool)

(assert (=> d!62197 (=> res!126519 e!167695)))

(declare-fun lt!130305 () Bool)

(assert (=> d!62197 (= res!126519 (not lt!130305))))

(declare-fun lt!130304 () Bool)

(assert (=> d!62197 (= lt!130305 lt!130304)))

(declare-fun lt!130303 () Unit!7989)

(declare-fun e!167694 () Unit!7989)

(assert (=> d!62197 (= lt!130303 e!167694)))

(declare-fun c!43871 () Bool)

(assert (=> d!62197 (= c!43871 lt!130304)))

(assert (=> d!62197 (= lt!130304 (containsKey!305 (toList!1894 lt!130077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62197 (= (contains!1854 lt!130077 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130305)))

(declare-fun b!258746 () Bool)

(declare-fun lt!130306 () Unit!7989)

(assert (=> b!258746 (= e!167694 lt!130306)))

(assert (=> b!258746 (= lt!130306 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1894 lt!130077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258746 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258747 () Bool)

(declare-fun Unit!8016 () Unit!7989)

(assert (=> b!258747 (= e!167694 Unit!8016)))

(declare-fun b!258748 () Bool)

(assert (=> b!258748 (= e!167695 (isDefined!254 (getValueByKey!314 (toList!1894 lt!130077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62197 c!43871) b!258746))

(assert (= (and d!62197 (not c!43871)) b!258747))

(assert (= (and d!62197 (not res!126519)) b!258748))

(declare-fun m!274411 () Bool)

(assert (=> d!62197 m!274411))

(declare-fun m!274413 () Bool)

(assert (=> b!258746 m!274413))

(assert (=> b!258746 m!274329))

(assert (=> b!258746 m!274329))

(declare-fun m!274415 () Bool)

(assert (=> b!258746 m!274415))

(assert (=> b!258748 m!274329))

(assert (=> b!258748 m!274329))

(assert (=> b!258748 m!274415))

(assert (=> bm!24554 d!62197))

(declare-fun d!62199 () Bool)

(assert (=> d!62199 (= (apply!255 lt!130019 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1894 lt!130019) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9138 () Bool)

(assert (= bs!9138 d!62199))

(assert (=> bs!9138 m!274303))

(assert (=> bs!9138 m!274303))

(declare-fun m!274417 () Bool)

(assert (=> bs!9138 m!274417))

(assert (=> b!258268 d!62199))

(declare-fun d!62201 () Bool)

(assert (=> d!62201 (arrayContainsKey!0 lt!129838 lt!129941 #b00000000000000000000000000000000)))

(declare-fun lt!130307 () Unit!7989)

(assert (=> d!62201 (= lt!130307 (choose!13 lt!129838 lt!129941 #b00000000000000000000000000000000))))

(assert (=> d!62201 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62201 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129838 lt!129941 #b00000000000000000000000000000000) lt!130307)))

(declare-fun bs!9139 () Bool)

(assert (= bs!9139 d!62201))

(assert (=> bs!9139 m!273647))

(declare-fun m!274419 () Bool)

(assert (=> bs!9139 m!274419))

(assert (=> b!258170 d!62201))

(declare-fun d!62203 () Bool)

(declare-fun res!126520 () Bool)

(declare-fun e!167696 () Bool)

(assert (=> d!62203 (=> res!126520 e!167696)))

(assert (=> d!62203 (= res!126520 (= (select (arr!5942 lt!129838) #b00000000000000000000000000000000) lt!129941))))

(assert (=> d!62203 (= (arrayContainsKey!0 lt!129838 lt!129941 #b00000000000000000000000000000000) e!167696)))

(declare-fun b!258749 () Bool)

(declare-fun e!167697 () Bool)

(assert (=> b!258749 (= e!167696 e!167697)))

(declare-fun res!126521 () Bool)

(assert (=> b!258749 (=> (not res!126521) (not e!167697))))

(assert (=> b!258749 (= res!126521 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6289 lt!129838)))))

(declare-fun b!258750 () Bool)

(assert (=> b!258750 (= e!167697 (arrayContainsKey!0 lt!129838 lt!129941 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62203 (not res!126520)) b!258749))

(assert (= (and b!258749 res!126521) b!258750))

(assert (=> d!62203 m!273629))

(declare-fun m!274421 () Bool)

(assert (=> b!258750 m!274421))

(assert (=> b!258170 d!62203))

(declare-fun b!258751 () Bool)

(declare-fun c!43872 () Bool)

(declare-fun lt!130308 () (_ BitVec 64))

(assert (=> b!258751 (= c!43872 (= lt!130308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167698 () SeekEntryResult!1141)

(declare-fun e!167699 () SeekEntryResult!1141)

(assert (=> b!258751 (= e!167698 e!167699)))

(declare-fun b!258752 () Bool)

(declare-fun e!167700 () SeekEntryResult!1141)

(assert (=> b!258752 (= e!167700 Undefined!1141)))

(declare-fun b!258753 () Bool)

(declare-fun lt!130310 () SeekEntryResult!1141)

(assert (=> b!258753 (= e!167699 (seekKeyOrZeroReturnVacant!0 (x!25009 lt!130310) (index!6736 lt!130310) (index!6736 lt!130310) (select (arr!5942 lt!129838) #b00000000000000000000000000000000) lt!129838 (mask!11057 thiss!1504)))))

(declare-fun d!62205 () Bool)

(declare-fun lt!130309 () SeekEntryResult!1141)

(assert (=> d!62205 (and (or ((_ is Undefined!1141) lt!130309) (not ((_ is Found!1141) lt!130309)) (and (bvsge (index!6735 lt!130309) #b00000000000000000000000000000000) (bvslt (index!6735 lt!130309) (size!6289 lt!129838)))) (or ((_ is Undefined!1141) lt!130309) ((_ is Found!1141) lt!130309) (not ((_ is MissingZero!1141) lt!130309)) (and (bvsge (index!6734 lt!130309) #b00000000000000000000000000000000) (bvslt (index!6734 lt!130309) (size!6289 lt!129838)))) (or ((_ is Undefined!1141) lt!130309) ((_ is Found!1141) lt!130309) ((_ is MissingZero!1141) lt!130309) (not ((_ is MissingVacant!1141) lt!130309)) (and (bvsge (index!6737 lt!130309) #b00000000000000000000000000000000) (bvslt (index!6737 lt!130309) (size!6289 lt!129838)))) (or ((_ is Undefined!1141) lt!130309) (ite ((_ is Found!1141) lt!130309) (= (select (arr!5942 lt!129838) (index!6735 lt!130309)) (select (arr!5942 lt!129838) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1141) lt!130309) (= (select (arr!5942 lt!129838) (index!6734 lt!130309)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1141) lt!130309) (= (select (arr!5942 lt!129838) (index!6737 lt!130309)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62205 (= lt!130309 e!167700)))

(declare-fun c!43874 () Bool)

(assert (=> d!62205 (= c!43874 (and ((_ is Intermediate!1141) lt!130310) (undefined!1953 lt!130310)))))

(assert (=> d!62205 (= lt!130310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) (mask!11057 thiss!1504)) (select (arr!5942 lt!129838) #b00000000000000000000000000000000) lt!129838 (mask!11057 thiss!1504)))))

(assert (=> d!62205 (validMask!0 (mask!11057 thiss!1504))))

(assert (=> d!62205 (= (seekEntryOrOpen!0 (select (arr!5942 lt!129838) #b00000000000000000000000000000000) lt!129838 (mask!11057 thiss!1504)) lt!130309)))

(declare-fun b!258754 () Bool)

(assert (=> b!258754 (= e!167698 (Found!1141 (index!6736 lt!130310)))))

(declare-fun b!258755 () Bool)

(assert (=> b!258755 (= e!167699 (MissingZero!1141 (index!6736 lt!130310)))))

(declare-fun b!258756 () Bool)

(assert (=> b!258756 (= e!167700 e!167698)))

(assert (=> b!258756 (= lt!130308 (select (arr!5942 lt!129838) (index!6736 lt!130310)))))

(declare-fun c!43873 () Bool)

(assert (=> b!258756 (= c!43873 (= lt!130308 (select (arr!5942 lt!129838) #b00000000000000000000000000000000)))))

(assert (= (and d!62205 c!43874) b!258752))

(assert (= (and d!62205 (not c!43874)) b!258756))

(assert (= (and b!258756 c!43873) b!258754))

(assert (= (and b!258756 (not c!43873)) b!258751))

(assert (= (and b!258751 c!43872) b!258755))

(assert (= (and b!258751 (not c!43872)) b!258753))

(assert (=> b!258753 m!273629))

(declare-fun m!274423 () Bool)

(assert (=> b!258753 m!274423))

(assert (=> d!62205 m!273459))

(assert (=> d!62205 m!273629))

(declare-fun m!274425 () Bool)

(assert (=> d!62205 m!274425))

(assert (=> d!62205 m!274425))

(assert (=> d!62205 m!273629))

(declare-fun m!274427 () Bool)

(assert (=> d!62205 m!274427))

(declare-fun m!274429 () Bool)

(assert (=> d!62205 m!274429))

(declare-fun m!274431 () Bool)

(assert (=> d!62205 m!274431))

(declare-fun m!274433 () Bool)

(assert (=> d!62205 m!274433))

(declare-fun m!274435 () Bool)

(assert (=> b!258756 m!274435))

(assert (=> b!258170 d!62205))

(declare-fun b!258757 () Bool)

(declare-fun e!167702 () Bool)

(assert (=> b!258757 (= e!167702 tp_is_empty!6601)))

(declare-fun mapIsEmpty!11251 () Bool)

(declare-fun mapRes!11251 () Bool)

(assert (=> mapIsEmpty!11251 mapRes!11251))

(declare-fun condMapEmpty!11251 () Bool)

(declare-fun mapDefault!11251 () ValueCell!2957)

(assert (=> mapNonEmpty!11250 (= condMapEmpty!11251 (= mapRest!11250 ((as const (Array (_ BitVec 32) ValueCell!2957)) mapDefault!11251)))))

(declare-fun e!167701 () Bool)

(assert (=> mapNonEmpty!11250 (= tp!23544 (and e!167701 mapRes!11251))))

(declare-fun mapNonEmpty!11251 () Bool)

(declare-fun tp!23545 () Bool)

(assert (=> mapNonEmpty!11251 (= mapRes!11251 (and tp!23545 e!167702))))

(declare-fun mapValue!11251 () ValueCell!2957)

(declare-fun mapRest!11251 () (Array (_ BitVec 32) ValueCell!2957))

(declare-fun mapKey!11251 () (_ BitVec 32))

(assert (=> mapNonEmpty!11251 (= mapRest!11250 (store mapRest!11251 mapKey!11251 mapValue!11251))))

(declare-fun b!258758 () Bool)

(assert (=> b!258758 (= e!167701 tp_is_empty!6601)))

(assert (= (and mapNonEmpty!11250 condMapEmpty!11251) mapIsEmpty!11251))

(assert (= (and mapNonEmpty!11250 (not condMapEmpty!11251)) mapNonEmpty!11251))

(assert (= (and mapNonEmpty!11251 ((_ is ValueCellFull!2957) mapValue!11251)) b!258757))

(assert (= (and mapNonEmpty!11250 ((_ is ValueCellFull!2957) mapDefault!11251)) b!258758))

(declare-fun m!274437 () Bool)

(assert (=> mapNonEmpty!11251 m!274437))

(declare-fun b_lambda!8235 () Bool)

(assert (= b_lambda!8225 (or (and b!257999 b_free!6739) b_lambda!8235)))

(declare-fun b_lambda!8237 () Bool)

(assert (= b_lambda!8229 (or (and b!257999 b_free!6739) b_lambda!8237)))

(declare-fun b_lambda!8239 () Bool)

(assert (= b_lambda!8233 (or (and b!257999 b_free!6739) b_lambda!8239)))

(declare-fun b_lambda!8241 () Bool)

(assert (= b_lambda!8231 (or (and b!257999 b_free!6739) b_lambda!8241)))

(declare-fun b_lambda!8243 () Bool)

(assert (= b_lambda!8227 (or (and b!257999 b_free!6739) b_lambda!8243)))

(check-sat (not b!258454) (not d!62127) (not b!258555) (not d!62145) (not bm!24593) (not bm!24583) (not b!258529) (not b!258548) (not d!62141) (not b!258556) (not d!62183) (not d!62201) (not b!258562) (not d!62173) (not b!258420) (not b!258750) (not d!62091) (not b_lambda!8243) (not d!62077) (not b!258485) (not b!258746) (not d!62103) (not b!258486) (not b!258460) (not d!62193) (not b!258723) (not d!62029) (not d!62169) (not b!258455) (not d!62065) (not d!62117) (not b!258391) (not b!258483) (not d!62045) (not b!258701) (not b!258463) (not d!62101) (not b!258545) (not b!258740) (not b!258753) (not b!258482) (not bm!24596) (not d!62071) (not d!62199) (not d!62111) (not b!258745) (not b!258673) (not d!62139) (not d!62083) (not b!258462) (not d!62037) (not b!258725) (not b!258561) (not d!62059) (not bm!24573) (not b!258538) (not b!258533) (not mapNonEmpty!11251) (not b!258396) (not d!62097) (not bm!24565) (not d!62175) (not b!258597) (not b!258547) (not bm!24580) (not b!258534) (not b!258659) (not b!258410) (not d!62181) (not b!258397) (not d!62159) (not d!62069) (not b!258696) (not d!62053) (not d!62031) (not b!258546) (not b!258730) (not d!62105) (not bm!24582) (not b!258636) (not b!258708) (not b_next!6739) (not b!258530) (not b!258664) (not b!258722) (not d!62085) (not d!62049) (not b!258630) (not b!258542) (not bm!24569) (not b!258638) (not d!62151) (not d!62051) (not b!258409) (not d!62075) (not b!258655) (not d!62095) (not b!258499) (not b!258551) (not d!62107) (not b!258541) (not d!62195) (not b!258531) (not b!258497) (not b!258707) (not bm!24566) (not d!62197) (not b!258616) (not d!62153) (not b!258719) (not b!258618) (not b!258621) (not b!258718) (not d!62099) (not d!62081) (not b_lambda!8241) (not d!62017) (not b!258674) (not b!258472) (not b!258424) (not b!258628) (not d!62009) (not d!62067) (not d!62093) (not b!258627) (not d!62115) (not b_lambda!8237) (not bm!24594) (not d!62137) (not b!258495) (not b!258399) (not b!258553) (not b!258466) (not b!258711) tp_is_empty!6601 (not b!258532) (not b!258591) (not b!258543) (not d!62061) (not d!62063) (not d!62163) (not b!258418) (not b_lambda!8235) (not b!258461) (not b!258493) (not bm!24595) b_and!13845 (not b!258657) (not b!258709) (not b_lambda!8221) (not b!258468) (not b!258619) (not b!258494) (not bm!24562) (not d!62089) (not d!62087) (not bm!24579) (not bm!24568) (not bm!24572) (not d!62157) (not d!62057) (not b!258741) (not b!258658) (not b!258748) (not b_lambda!8223) (not d!62055) (not b!258395) (not b!258560) (not d!62123) (not b!258481) (not b!258398) (not d!62047) (not b!258419) (not b!258469) (not b!258564) (not b!258537) (not bm!24590) (not d!62121) (not d!62015) (not b!258479) (not b!258465) (not bm!24581) (not d!62129) (not d!62147) (not b!258667) (not d!62165) (not d!62125) (not d!62131) (not b!258408) (not b!258563) (not b!258500) (not d!62079) (not b!258662) (not b!258544) (not b!258470) (not b!258478) (not b!258661) (not b!258412) (not d!62133) (not b!258626) (not d!62205) (not b!258720) (not b!258411) (not b!258459) (not bm!24574) (not bm!24560) (not b!258458) (not b!258492) (not d!62043) (not d!62013) (not b_lambda!8239) (not b!258702) (not b!258613) (not b!258637) (not bm!24564) (not d!62023) (not b!258714) (not b!258643))
(check-sat b_and!13845 (not b_next!6739))

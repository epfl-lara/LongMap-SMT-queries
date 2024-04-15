; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17536 () Bool)

(assert start!17536)

(declare-fun b!175459 () Bool)

(declare-fun b_free!4339 () Bool)

(declare-fun b_next!4339 () Bool)

(assert (=> b!175459 (= b_free!4339 (not b_next!4339))))

(declare-fun tp!15699 () Bool)

(declare-fun b_and!10795 () Bool)

(assert (=> b!175459 (= tp!15699 b_and!10795)))

(declare-fun b!175454 () Bool)

(declare-fun res!83150 () Bool)

(declare-fun e!115801 () Bool)

(assert (=> b!175454 (=> (not res!83150) (not e!115801))))

(declare-datatypes ((V!5129 0))(
  ( (V!5130 (val!2100 Int)) )
))
(declare-datatypes ((ValueCell!1712 0))(
  ( (ValueCellFull!1712 (v!3969 V!5129)) (EmptyCell!1712) )
))
(declare-datatypes ((array!7343 0))(
  ( (array!7344 (arr!3484 (Array (_ BitVec 32) (_ BitVec 64))) (size!3787 (_ BitVec 32))) )
))
(declare-datatypes ((array!7345 0))(
  ( (array!7346 (arr!3485 (Array (_ BitVec 32) ValueCell!1712)) (size!3788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2332 0))(
  ( (LongMapFixedSize!2333 (defaultEntry!3622 Int) (mask!8522 (_ BitVec 32)) (extraKeys!3359 (_ BitVec 32)) (zeroValue!3463 V!5129) (minValue!3463 V!5129) (_size!1215 (_ BitVec 32)) (_keys!5474 array!7343) (_values!3605 array!7345) (_vacant!1215 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2332)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175454 (= res!83150 (validMask!0 (mask!8522 thiss!1248)))))

(declare-fun mapIsEmpty!7012 () Bool)

(declare-fun mapRes!7012 () Bool)

(assert (=> mapIsEmpty!7012 mapRes!7012))

(declare-fun b!175455 () Bool)

(assert (=> b!175455 (= e!115801 (and (= (size!3788 (_values!3605 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8522 thiss!1248))) (= (size!3787 (_keys!5474 thiss!1248)) (size!3788 (_values!3605 thiss!1248))) (bvsge (mask!8522 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3359 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!7012 () Bool)

(declare-fun tp!15700 () Bool)

(declare-fun e!115805 () Bool)

(assert (=> mapNonEmpty!7012 (= mapRes!7012 (and tp!15700 e!115805))))

(declare-fun mapRest!7012 () (Array (_ BitVec 32) ValueCell!1712))

(declare-fun mapValue!7012 () ValueCell!1712)

(declare-fun mapKey!7012 () (_ BitVec 32))

(assert (=> mapNonEmpty!7012 (= (arr!3485 (_values!3605 thiss!1248)) (store mapRest!7012 mapKey!7012 mapValue!7012))))

(declare-fun b!175456 () Bool)

(declare-fun res!83149 () Bool)

(assert (=> b!175456 (=> (not res!83149) (not e!115801))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3258 0))(
  ( (tuple2!3259 (_1!1640 (_ BitVec 64)) (_2!1640 V!5129)) )
))
(declare-datatypes ((List!2230 0))(
  ( (Nil!2227) (Cons!2226 (h!2845 tuple2!3258) (t!7041 List!2230)) )
))
(declare-datatypes ((ListLongMap!2177 0))(
  ( (ListLongMap!2178 (toList!1104 List!2230)) )
))
(declare-fun contains!1169 (ListLongMap!2177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!740 (array!7343 array!7345 (_ BitVec 32) (_ BitVec 32) V!5129 V!5129 (_ BitVec 32) Int) ListLongMap!2177)

(assert (=> b!175456 (= res!83149 (contains!1169 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) key!828))))

(declare-fun b!175457 () Bool)

(declare-fun e!115802 () Bool)

(declare-fun e!115800 () Bool)

(assert (=> b!175457 (= e!115802 (and e!115800 mapRes!7012))))

(declare-fun condMapEmpty!7012 () Bool)

(declare-fun mapDefault!7012 () ValueCell!1712)

(assert (=> b!175457 (= condMapEmpty!7012 (= (arr!3485 (_values!3605 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1712)) mapDefault!7012)))))

(declare-fun b!175458 () Bool)

(declare-fun res!83146 () Bool)

(assert (=> b!175458 (=> (not res!83146) (not e!115801))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!562 0))(
  ( (MissingZero!562 (index!4416 (_ BitVec 32))) (Found!562 (index!4417 (_ BitVec 32))) (Intermediate!562 (undefined!1374 Bool) (index!4418 (_ BitVec 32)) (x!19319 (_ BitVec 32))) (Undefined!562) (MissingVacant!562 (index!4419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7343 (_ BitVec 32)) SeekEntryResult!562)

(assert (=> b!175458 (= res!83146 ((_ is Undefined!562) (seekEntryOrOpen!0 key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248))))))

(declare-fun e!115804 () Bool)

(declare-fun tp_is_empty!4111 () Bool)

(declare-fun array_inv!2245 (array!7343) Bool)

(declare-fun array_inv!2246 (array!7345) Bool)

(assert (=> b!175459 (= e!115804 (and tp!15699 tp_is_empty!4111 (array_inv!2245 (_keys!5474 thiss!1248)) (array_inv!2246 (_values!3605 thiss!1248)) e!115802))))

(declare-fun b!175460 () Bool)

(assert (=> b!175460 (= e!115805 tp_is_empty!4111)))

(declare-fun res!83147 () Bool)

(assert (=> start!17536 (=> (not res!83147) (not e!115801))))

(declare-fun valid!1000 (LongMapFixedSize!2332) Bool)

(assert (=> start!17536 (= res!83147 (valid!1000 thiss!1248))))

(assert (=> start!17536 e!115801))

(assert (=> start!17536 e!115804))

(assert (=> start!17536 true))

(declare-fun b!175461 () Bool)

(declare-fun res!83148 () Bool)

(assert (=> b!175461 (=> (not res!83148) (not e!115801))))

(assert (=> b!175461 (= res!83148 (not (= key!828 (bvneg key!828))))))

(declare-fun b!175462 () Bool)

(assert (=> b!175462 (= e!115800 tp_is_empty!4111)))

(assert (= (and start!17536 res!83147) b!175461))

(assert (= (and b!175461 res!83148) b!175458))

(assert (= (and b!175458 res!83146) b!175456))

(assert (= (and b!175456 res!83149) b!175454))

(assert (= (and b!175454 res!83150) b!175455))

(assert (= (and b!175457 condMapEmpty!7012) mapIsEmpty!7012))

(assert (= (and b!175457 (not condMapEmpty!7012)) mapNonEmpty!7012))

(assert (= (and mapNonEmpty!7012 ((_ is ValueCellFull!1712) mapValue!7012)) b!175460))

(assert (= (and b!175457 ((_ is ValueCellFull!1712) mapDefault!7012)) b!175462))

(assert (= b!175459 b!175457))

(assert (= start!17536 b!175459))

(declare-fun m!203881 () Bool)

(assert (=> b!175459 m!203881))

(declare-fun m!203883 () Bool)

(assert (=> b!175459 m!203883))

(declare-fun m!203885 () Bool)

(assert (=> mapNonEmpty!7012 m!203885))

(declare-fun m!203887 () Bool)

(assert (=> b!175456 m!203887))

(assert (=> b!175456 m!203887))

(declare-fun m!203889 () Bool)

(assert (=> b!175456 m!203889))

(declare-fun m!203891 () Bool)

(assert (=> b!175454 m!203891))

(declare-fun m!203893 () Bool)

(assert (=> start!17536 m!203893))

(declare-fun m!203895 () Bool)

(assert (=> b!175458 m!203895))

(check-sat (not b!175454) b_and!10795 (not b!175456) (not b!175459) (not mapNonEmpty!7012) tp_is_empty!4111 (not b_next!4339) (not b!175458) (not start!17536))
(check-sat b_and!10795 (not b_next!4339))
(get-model)

(declare-fun b!175530 () Bool)

(declare-fun e!115849 () SeekEntryResult!562)

(declare-fun lt!86713 () SeekEntryResult!562)

(assert (=> b!175530 (= e!115849 (MissingZero!562 (index!4418 lt!86713)))))

(declare-fun b!175531 () Bool)

(declare-fun e!115850 () SeekEntryResult!562)

(declare-fun e!115848 () SeekEntryResult!562)

(assert (=> b!175531 (= e!115850 e!115848)))

(declare-fun lt!86712 () (_ BitVec 64))

(assert (=> b!175531 (= lt!86712 (select (arr!3484 (_keys!5474 thiss!1248)) (index!4418 lt!86713)))))

(declare-fun c!31440 () Bool)

(assert (=> b!175531 (= c!31440 (= lt!86712 key!828))))

(declare-fun b!175532 () Bool)

(assert (=> b!175532 (= e!115850 Undefined!562)))

(declare-fun b!175533 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7343 (_ BitVec 32)) SeekEntryResult!562)

(assert (=> b!175533 (= e!115849 (seekKeyOrZeroReturnVacant!0 (x!19319 lt!86713) (index!4418 lt!86713) (index!4418 lt!86713) key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)))))

(declare-fun b!175534 () Bool)

(assert (=> b!175534 (= e!115848 (Found!562 (index!4418 lt!86713)))))

(declare-fun d!53341 () Bool)

(declare-fun lt!86711 () SeekEntryResult!562)

(assert (=> d!53341 (and (or ((_ is Undefined!562) lt!86711) (not ((_ is Found!562) lt!86711)) (and (bvsge (index!4417 lt!86711) #b00000000000000000000000000000000) (bvslt (index!4417 lt!86711) (size!3787 (_keys!5474 thiss!1248))))) (or ((_ is Undefined!562) lt!86711) ((_ is Found!562) lt!86711) (not ((_ is MissingZero!562) lt!86711)) (and (bvsge (index!4416 lt!86711) #b00000000000000000000000000000000) (bvslt (index!4416 lt!86711) (size!3787 (_keys!5474 thiss!1248))))) (or ((_ is Undefined!562) lt!86711) ((_ is Found!562) lt!86711) ((_ is MissingZero!562) lt!86711) (not ((_ is MissingVacant!562) lt!86711)) (and (bvsge (index!4419 lt!86711) #b00000000000000000000000000000000) (bvslt (index!4419 lt!86711) (size!3787 (_keys!5474 thiss!1248))))) (or ((_ is Undefined!562) lt!86711) (ite ((_ is Found!562) lt!86711) (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4417 lt!86711)) key!828) (ite ((_ is MissingZero!562) lt!86711) (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4416 lt!86711)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!562) lt!86711) (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4419 lt!86711)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53341 (= lt!86711 e!115850)))

(declare-fun c!31438 () Bool)

(assert (=> d!53341 (= c!31438 (and ((_ is Intermediate!562) lt!86713) (undefined!1374 lt!86713)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7343 (_ BitVec 32)) SeekEntryResult!562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53341 (= lt!86713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8522 thiss!1248)) key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)))))

(assert (=> d!53341 (validMask!0 (mask!8522 thiss!1248))))

(assert (=> d!53341 (= (seekEntryOrOpen!0 key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)) lt!86711)))

(declare-fun b!175529 () Bool)

(declare-fun c!31439 () Bool)

(assert (=> b!175529 (= c!31439 (= lt!86712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175529 (= e!115848 e!115849)))

(assert (= (and d!53341 c!31438) b!175532))

(assert (= (and d!53341 (not c!31438)) b!175531))

(assert (= (and b!175531 c!31440) b!175534))

(assert (= (and b!175531 (not c!31440)) b!175529))

(assert (= (and b!175529 c!31439) b!175530))

(assert (= (and b!175529 (not c!31439)) b!175533))

(declare-fun m!203929 () Bool)

(assert (=> b!175531 m!203929))

(declare-fun m!203931 () Bool)

(assert (=> b!175533 m!203931))

(declare-fun m!203933 () Bool)

(assert (=> d!53341 m!203933))

(declare-fun m!203935 () Bool)

(assert (=> d!53341 m!203935))

(declare-fun m!203937 () Bool)

(assert (=> d!53341 m!203937))

(declare-fun m!203939 () Bool)

(assert (=> d!53341 m!203939))

(assert (=> d!53341 m!203891))

(declare-fun m!203941 () Bool)

(assert (=> d!53341 m!203941))

(assert (=> d!53341 m!203933))

(assert (=> b!175458 d!53341))

(declare-fun d!53343 () Bool)

(assert (=> d!53343 (= (array_inv!2245 (_keys!5474 thiss!1248)) (bvsge (size!3787 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175459 d!53343))

(declare-fun d!53345 () Bool)

(assert (=> d!53345 (= (array_inv!2246 (_values!3605 thiss!1248)) (bvsge (size!3788 (_values!3605 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175459 d!53345))

(declare-fun d!53347 () Bool)

(assert (=> d!53347 (= (validMask!0 (mask!8522 thiss!1248)) (and (or (= (mask!8522 thiss!1248) #b00000000000000000000000000000111) (= (mask!8522 thiss!1248) #b00000000000000000000000000001111) (= (mask!8522 thiss!1248) #b00000000000000000000000000011111) (= (mask!8522 thiss!1248) #b00000000000000000000000000111111) (= (mask!8522 thiss!1248) #b00000000000000000000000001111111) (= (mask!8522 thiss!1248) #b00000000000000000000000011111111) (= (mask!8522 thiss!1248) #b00000000000000000000000111111111) (= (mask!8522 thiss!1248) #b00000000000000000000001111111111) (= (mask!8522 thiss!1248) #b00000000000000000000011111111111) (= (mask!8522 thiss!1248) #b00000000000000000000111111111111) (= (mask!8522 thiss!1248) #b00000000000000000001111111111111) (= (mask!8522 thiss!1248) #b00000000000000000011111111111111) (= (mask!8522 thiss!1248) #b00000000000000000111111111111111) (= (mask!8522 thiss!1248) #b00000000000000001111111111111111) (= (mask!8522 thiss!1248) #b00000000000000011111111111111111) (= (mask!8522 thiss!1248) #b00000000000000111111111111111111) (= (mask!8522 thiss!1248) #b00000000000001111111111111111111) (= (mask!8522 thiss!1248) #b00000000000011111111111111111111) (= (mask!8522 thiss!1248) #b00000000000111111111111111111111) (= (mask!8522 thiss!1248) #b00000000001111111111111111111111) (= (mask!8522 thiss!1248) #b00000000011111111111111111111111) (= (mask!8522 thiss!1248) #b00000000111111111111111111111111) (= (mask!8522 thiss!1248) #b00000001111111111111111111111111) (= (mask!8522 thiss!1248) #b00000011111111111111111111111111) (= (mask!8522 thiss!1248) #b00000111111111111111111111111111) (= (mask!8522 thiss!1248) #b00001111111111111111111111111111) (= (mask!8522 thiss!1248) #b00011111111111111111111111111111) (= (mask!8522 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8522 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175454 d!53347))

(declare-fun d!53349 () Bool)

(declare-fun res!83187 () Bool)

(declare-fun e!115853 () Bool)

(assert (=> d!53349 (=> (not res!83187) (not e!115853))))

(declare-fun simpleValid!149 (LongMapFixedSize!2332) Bool)

(assert (=> d!53349 (= res!83187 (simpleValid!149 thiss!1248))))

(assert (=> d!53349 (= (valid!1000 thiss!1248) e!115853)))

(declare-fun b!175541 () Bool)

(declare-fun res!83188 () Bool)

(assert (=> b!175541 (=> (not res!83188) (not e!115853))))

(declare-fun arrayCountValidKeys!0 (array!7343 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175541 (= res!83188 (= (arrayCountValidKeys!0 (_keys!5474 thiss!1248) #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))) (_size!1215 thiss!1248)))))

(declare-fun b!175542 () Bool)

(declare-fun res!83189 () Bool)

(assert (=> b!175542 (=> (not res!83189) (not e!115853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7343 (_ BitVec 32)) Bool)

(assert (=> b!175542 (= res!83189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)))))

(declare-fun b!175543 () Bool)

(declare-datatypes ((List!2233 0))(
  ( (Nil!2230) (Cons!2229 (h!2848 (_ BitVec 64)) (t!7046 List!2233)) )
))
(declare-fun arrayNoDuplicates!0 (array!7343 (_ BitVec 32) List!2233) Bool)

(assert (=> b!175543 (= e!115853 (arrayNoDuplicates!0 (_keys!5474 thiss!1248) #b00000000000000000000000000000000 Nil!2230))))

(assert (= (and d!53349 res!83187) b!175541))

(assert (= (and b!175541 res!83188) b!175542))

(assert (= (and b!175542 res!83189) b!175543))

(declare-fun m!203943 () Bool)

(assert (=> d!53349 m!203943))

(declare-fun m!203945 () Bool)

(assert (=> b!175541 m!203945))

(declare-fun m!203947 () Bool)

(assert (=> b!175542 m!203947))

(declare-fun m!203949 () Bool)

(assert (=> b!175543 m!203949))

(assert (=> start!17536 d!53349))

(declare-fun d!53351 () Bool)

(declare-fun e!115858 () Bool)

(assert (=> d!53351 e!115858))

(declare-fun res!83192 () Bool)

(assert (=> d!53351 (=> res!83192 e!115858)))

(declare-fun lt!86723 () Bool)

(assert (=> d!53351 (= res!83192 (not lt!86723))))

(declare-fun lt!86722 () Bool)

(assert (=> d!53351 (= lt!86723 lt!86722)))

(declare-datatypes ((Unit!5363 0))(
  ( (Unit!5364) )
))
(declare-fun lt!86725 () Unit!5363)

(declare-fun e!115859 () Unit!5363)

(assert (=> d!53351 (= lt!86725 e!115859)))

(declare-fun c!31443 () Bool)

(assert (=> d!53351 (= c!31443 lt!86722)))

(declare-fun containsKey!192 (List!2230 (_ BitVec 64)) Bool)

(assert (=> d!53351 (= lt!86722 (containsKey!192 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(assert (=> d!53351 (= (contains!1169 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) key!828) lt!86723)))

(declare-fun b!175550 () Bool)

(declare-fun lt!86724 () Unit!5363)

(assert (=> b!175550 (= e!115859 lt!86724)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!141 (List!2230 (_ BitVec 64)) Unit!5363)

(assert (=> b!175550 (= lt!86724 (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-datatypes ((Option!194 0))(
  ( (Some!193 (v!3972 V!5129)) (None!192) )
))
(declare-fun isDefined!142 (Option!194) Bool)

(declare-fun getValueByKey!188 (List!2230 (_ BitVec 64)) Option!194)

(assert (=> b!175550 (isDefined!142 (getValueByKey!188 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-fun b!175551 () Bool)

(declare-fun Unit!5365 () Unit!5363)

(assert (=> b!175551 (= e!115859 Unit!5365)))

(declare-fun b!175552 () Bool)

(assert (=> b!175552 (= e!115858 (isDefined!142 (getValueByKey!188 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828)))))

(assert (= (and d!53351 c!31443) b!175550))

(assert (= (and d!53351 (not c!31443)) b!175551))

(assert (= (and d!53351 (not res!83192)) b!175552))

(declare-fun m!203951 () Bool)

(assert (=> d!53351 m!203951))

(declare-fun m!203953 () Bool)

(assert (=> b!175550 m!203953))

(declare-fun m!203955 () Bool)

(assert (=> b!175550 m!203955))

(assert (=> b!175550 m!203955))

(declare-fun m!203957 () Bool)

(assert (=> b!175550 m!203957))

(assert (=> b!175552 m!203955))

(assert (=> b!175552 m!203955))

(assert (=> b!175552 m!203957))

(assert (=> b!175456 d!53351))

(declare-fun b!175595 () Bool)

(declare-fun e!115886 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175595 (= e!115886 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175596 () Bool)

(declare-fun e!115893 () Bool)

(declare-fun lt!86790 () ListLongMap!2177)

(declare-fun apply!135 (ListLongMap!2177 (_ BitVec 64)) V!5129)

(assert (=> b!175596 (= e!115893 (= (apply!135 lt!86790 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3463 thiss!1248)))))

(declare-fun b!175597 () Bool)

(declare-fun e!115891 () ListLongMap!2177)

(declare-fun call!17771 () ListLongMap!2177)

(assert (=> b!175597 (= e!115891 call!17771)))

(declare-fun b!175598 () Bool)

(declare-fun e!115897 () ListLongMap!2177)

(declare-fun e!115888 () ListLongMap!2177)

(assert (=> b!175598 (= e!115897 e!115888)))

(declare-fun c!31456 () Bool)

(assert (=> b!175598 (= c!31456 (and (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!17770 () ListLongMap!2177)

(declare-fun c!31459 () Bool)

(declare-fun call!17772 () ListLongMap!2177)

(declare-fun call!17773 () ListLongMap!2177)

(declare-fun bm!17767 () Bool)

(declare-fun +!247 (ListLongMap!2177 tuple2!3258) ListLongMap!2177)

(assert (=> bm!17767 (= call!17773 (+!247 (ite c!31459 call!17772 (ite c!31456 call!17770 call!17771)) (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun b!175599 () Bool)

(declare-fun e!115894 () Bool)

(declare-fun e!115892 () Bool)

(assert (=> b!175599 (= e!115894 e!115892)))

(declare-fun res!83218 () Bool)

(declare-fun call!17774 () Bool)

(assert (=> b!175599 (= res!83218 call!17774)))

(assert (=> b!175599 (=> (not res!83218) (not e!115892))))

(declare-fun b!175600 () Bool)

(declare-fun e!115889 () Bool)

(declare-fun call!17775 () Bool)

(assert (=> b!175600 (= e!115889 (not call!17775))))

(declare-fun d!53353 () Bool)

(declare-fun e!115890 () Bool)

(assert (=> d!53353 e!115890))

(declare-fun res!83216 () Bool)

(assert (=> d!53353 (=> (not res!83216) (not e!115890))))

(assert (=> d!53353 (= res!83216 (or (bvsge #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))))

(declare-fun lt!86786 () ListLongMap!2177)

(assert (=> d!53353 (= lt!86790 lt!86786)))

(declare-fun lt!86772 () Unit!5363)

(declare-fun e!115895 () Unit!5363)

(assert (=> d!53353 (= lt!86772 e!115895)))

(declare-fun c!31457 () Bool)

(assert (=> d!53353 (= c!31457 e!115886)))

(declare-fun res!83214 () Bool)

(assert (=> d!53353 (=> (not res!83214) (not e!115886))))

(assert (=> d!53353 (= res!83214 (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(assert (=> d!53353 (= lt!86786 e!115897)))

(assert (=> d!53353 (= c!31459 (and (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53353 (validMask!0 (mask!8522 thiss!1248))))

(assert (=> d!53353 (= (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) lt!86790)))

(declare-fun b!175601 () Bool)

(assert (=> b!175601 (= e!115897 (+!247 call!17773 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))

(declare-fun b!175602 () Bool)

(assert (=> b!175602 (= e!115892 (= (apply!135 lt!86790 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3463 thiss!1248)))))

(declare-fun b!175603 () Bool)

(declare-fun res!83219 () Bool)

(assert (=> b!175603 (=> (not res!83219) (not e!115890))))

(declare-fun e!115898 () Bool)

(assert (=> b!175603 (= res!83219 e!115898)))

(declare-fun res!83217 () Bool)

(assert (=> b!175603 (=> res!83217 e!115898)))

(declare-fun e!115887 () Bool)

(assert (=> b!175603 (= res!83217 (not e!115887))))

(declare-fun res!83211 () Bool)

(assert (=> b!175603 (=> (not res!83211) (not e!115887))))

(assert (=> b!175603 (= res!83211 (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun b!175604 () Bool)

(assert (=> b!175604 (= e!115894 (not call!17774))))

(declare-fun b!175605 () Bool)

(declare-fun e!115896 () Bool)

(assert (=> b!175605 (= e!115898 e!115896)))

(declare-fun res!83212 () Bool)

(assert (=> b!175605 (=> (not res!83212) (not e!115896))))

(assert (=> b!175605 (= res!83212 (contains!1169 lt!86790 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun b!175606 () Bool)

(declare-fun call!17776 () ListLongMap!2177)

(assert (=> b!175606 (= e!115891 call!17776)))

(declare-fun bm!17768 () Bool)

(assert (=> bm!17768 (= call!17771 call!17770)))

(declare-fun bm!17769 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!156 (array!7343 array!7345 (_ BitVec 32) (_ BitVec 32) V!5129 V!5129 (_ BitVec 32) Int) ListLongMap!2177)

(assert (=> bm!17769 (= call!17772 (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun bm!17770 () Bool)

(assert (=> bm!17770 (= call!17774 (contains!1169 lt!86790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175607 () Bool)

(declare-fun Unit!5366 () Unit!5363)

(assert (=> b!175607 (= e!115895 Unit!5366)))

(declare-fun b!175608 () Bool)

(assert (=> b!175608 (= e!115890 e!115889)))

(declare-fun c!31458 () Bool)

(assert (=> b!175608 (= c!31458 (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175609 () Bool)

(declare-fun c!31461 () Bool)

(assert (=> b!175609 (= c!31461 (and (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!175609 (= e!115888 e!115891)))

(declare-fun b!175610 () Bool)

(declare-fun res!83213 () Bool)

(assert (=> b!175610 (=> (not res!83213) (not e!115890))))

(assert (=> b!175610 (= res!83213 e!115894)))

(declare-fun c!31460 () Bool)

(assert (=> b!175610 (= c!31460 (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!175611 () Bool)

(assert (=> b!175611 (= e!115887 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175612 () Bool)

(assert (=> b!175612 (= e!115889 e!115893)))

(declare-fun res!83215 () Bool)

(assert (=> b!175612 (= res!83215 call!17775)))

(assert (=> b!175612 (=> (not res!83215) (not e!115893))))

(declare-fun bm!17771 () Bool)

(assert (=> bm!17771 (= call!17776 call!17773)))

(declare-fun bm!17772 () Bool)

(assert (=> bm!17772 (= call!17770 call!17772)))

(declare-fun b!175613 () Bool)

(assert (=> b!175613 (= e!115888 call!17776)))

(declare-fun b!175614 () Bool)

(declare-fun get!1986 (ValueCell!1712 V!5129) V!5129)

(declare-fun dynLambda!469 (Int (_ BitVec 64)) V!5129)

(assert (=> b!175614 (= e!115896 (= (apply!135 lt!86790 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)) (get!1986 (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!469 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175614 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3788 (_values!3605 thiss!1248))))))

(assert (=> b!175614 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun b!175615 () Bool)

(declare-fun lt!86784 () Unit!5363)

(assert (=> b!175615 (= e!115895 lt!86784)))

(declare-fun lt!86785 () ListLongMap!2177)

(assert (=> b!175615 (= lt!86785 (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!86770 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86773 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86773 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86774 () Unit!5363)

(declare-fun addStillContains!111 (ListLongMap!2177 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5363)

(assert (=> b!175615 (= lt!86774 (addStillContains!111 lt!86785 lt!86770 (zeroValue!3463 thiss!1248) lt!86773))))

(assert (=> b!175615 (contains!1169 (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))) lt!86773)))

(declare-fun lt!86775 () Unit!5363)

(assert (=> b!175615 (= lt!86775 lt!86774)))

(declare-fun lt!86777 () ListLongMap!2177)

(assert (=> b!175615 (= lt!86777 (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!86778 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86778 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86783 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86783 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86781 () Unit!5363)

(declare-fun addApplyDifferent!111 (ListLongMap!2177 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5363)

(assert (=> b!175615 (= lt!86781 (addApplyDifferent!111 lt!86777 lt!86778 (minValue!3463 thiss!1248) lt!86783))))

(assert (=> b!175615 (= (apply!135 (+!247 lt!86777 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))) lt!86783) (apply!135 lt!86777 lt!86783))))

(declare-fun lt!86788 () Unit!5363)

(assert (=> b!175615 (= lt!86788 lt!86781)))

(declare-fun lt!86779 () ListLongMap!2177)

(assert (=> b!175615 (= lt!86779 (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!86771 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86791 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86791 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86789 () Unit!5363)

(assert (=> b!175615 (= lt!86789 (addApplyDifferent!111 lt!86779 lt!86771 (zeroValue!3463 thiss!1248) lt!86791))))

(assert (=> b!175615 (= (apply!135 (+!247 lt!86779 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))) lt!86791) (apply!135 lt!86779 lt!86791))))

(declare-fun lt!86787 () Unit!5363)

(assert (=> b!175615 (= lt!86787 lt!86789)))

(declare-fun lt!86776 () ListLongMap!2177)

(assert (=> b!175615 (= lt!86776 (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!86780 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86780 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86782 () (_ BitVec 64))

(assert (=> b!175615 (= lt!86782 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175615 (= lt!86784 (addApplyDifferent!111 lt!86776 lt!86780 (minValue!3463 thiss!1248) lt!86782))))

(assert (=> b!175615 (= (apply!135 (+!247 lt!86776 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))) lt!86782) (apply!135 lt!86776 lt!86782))))

(declare-fun bm!17773 () Bool)

(assert (=> bm!17773 (= call!17775 (contains!1169 lt!86790 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53353 c!31459) b!175601))

(assert (= (and d!53353 (not c!31459)) b!175598))

(assert (= (and b!175598 c!31456) b!175613))

(assert (= (and b!175598 (not c!31456)) b!175609))

(assert (= (and b!175609 c!31461) b!175606))

(assert (= (and b!175609 (not c!31461)) b!175597))

(assert (= (or b!175606 b!175597) bm!17768))

(assert (= (or b!175613 bm!17768) bm!17772))

(assert (= (or b!175613 b!175606) bm!17771))

(assert (= (or b!175601 bm!17772) bm!17769))

(assert (= (or b!175601 bm!17771) bm!17767))

(assert (= (and d!53353 res!83214) b!175595))

(assert (= (and d!53353 c!31457) b!175615))

(assert (= (and d!53353 (not c!31457)) b!175607))

(assert (= (and d!53353 res!83216) b!175603))

(assert (= (and b!175603 res!83211) b!175611))

(assert (= (and b!175603 (not res!83217)) b!175605))

(assert (= (and b!175605 res!83212) b!175614))

(assert (= (and b!175603 res!83219) b!175610))

(assert (= (and b!175610 c!31460) b!175599))

(assert (= (and b!175610 (not c!31460)) b!175604))

(assert (= (and b!175599 res!83218) b!175602))

(assert (= (or b!175599 b!175604) bm!17770))

(assert (= (and b!175610 res!83213) b!175608))

(assert (= (and b!175608 c!31458) b!175612))

(assert (= (and b!175608 (not c!31458)) b!175600))

(assert (= (and b!175612 res!83215) b!175596))

(assert (= (or b!175612 b!175600) bm!17773))

(declare-fun b_lambda!6997 () Bool)

(assert (=> (not b_lambda!6997) (not b!175614)))

(declare-fun t!7045 () Bool)

(declare-fun tb!2773 () Bool)

(assert (=> (and b!175459 (= (defaultEntry!3622 thiss!1248) (defaultEntry!3622 thiss!1248)) t!7045) tb!2773))

(declare-fun result!4609 () Bool)

(assert (=> tb!2773 (= result!4609 tp_is_empty!4111)))

(assert (=> b!175614 t!7045))

(declare-fun b_and!10801 () Bool)

(assert (= b_and!10795 (and (=> t!7045 result!4609) b_and!10801)))

(declare-fun m!203959 () Bool)

(assert (=> bm!17769 m!203959))

(declare-fun m!203961 () Bool)

(assert (=> bm!17767 m!203961))

(declare-fun m!203963 () Bool)

(assert (=> b!175595 m!203963))

(assert (=> b!175595 m!203963))

(declare-fun m!203965 () Bool)

(assert (=> b!175595 m!203965))

(declare-fun m!203967 () Bool)

(assert (=> b!175602 m!203967))

(assert (=> b!175614 m!203963))

(declare-fun m!203969 () Bool)

(assert (=> b!175614 m!203969))

(declare-fun m!203971 () Bool)

(assert (=> b!175614 m!203971))

(declare-fun m!203973 () Bool)

(assert (=> b!175614 m!203973))

(declare-fun m!203975 () Bool)

(assert (=> b!175614 m!203975))

(assert (=> b!175614 m!203963))

(assert (=> b!175614 m!203973))

(assert (=> b!175614 m!203971))

(declare-fun m!203977 () Bool)

(assert (=> bm!17770 m!203977))

(declare-fun m!203979 () Bool)

(assert (=> b!175601 m!203979))

(assert (=> b!175605 m!203963))

(assert (=> b!175605 m!203963))

(declare-fun m!203981 () Bool)

(assert (=> b!175605 m!203981))

(declare-fun m!203983 () Bool)

(assert (=> bm!17773 m!203983))

(assert (=> b!175611 m!203963))

(assert (=> b!175611 m!203963))

(assert (=> b!175611 m!203965))

(declare-fun m!203985 () Bool)

(assert (=> b!175615 m!203985))

(declare-fun m!203987 () Bool)

(assert (=> b!175615 m!203987))

(declare-fun m!203989 () Bool)

(assert (=> b!175615 m!203989))

(declare-fun m!203991 () Bool)

(assert (=> b!175615 m!203991))

(declare-fun m!203993 () Bool)

(assert (=> b!175615 m!203993))

(declare-fun m!203995 () Bool)

(assert (=> b!175615 m!203995))

(assert (=> b!175615 m!203963))

(declare-fun m!203997 () Bool)

(assert (=> b!175615 m!203997))

(declare-fun m!203999 () Bool)

(assert (=> b!175615 m!203999))

(assert (=> b!175615 m!203993))

(declare-fun m!204001 () Bool)

(assert (=> b!175615 m!204001))

(declare-fun m!204003 () Bool)

(assert (=> b!175615 m!204003))

(declare-fun m!204005 () Bool)

(assert (=> b!175615 m!204005))

(assert (=> b!175615 m!203989))

(declare-fun m!204007 () Bool)

(assert (=> b!175615 m!204007))

(assert (=> b!175615 m!203959))

(assert (=> b!175615 m!203987))

(declare-fun m!204009 () Bool)

(assert (=> b!175615 m!204009))

(declare-fun m!204011 () Bool)

(assert (=> b!175615 m!204011))

(assert (=> b!175615 m!204011))

(declare-fun m!204013 () Bool)

(assert (=> b!175615 m!204013))

(declare-fun m!204015 () Bool)

(assert (=> b!175596 m!204015))

(assert (=> d!53353 m!203891))

(assert (=> b!175456 d!53353))

(declare-fun condMapEmpty!7021 () Bool)

(declare-fun mapDefault!7021 () ValueCell!1712)

(assert (=> mapNonEmpty!7012 (= condMapEmpty!7021 (= mapRest!7012 ((as const (Array (_ BitVec 32) ValueCell!1712)) mapDefault!7021)))))

(declare-fun e!115903 () Bool)

(declare-fun mapRes!7021 () Bool)

(assert (=> mapNonEmpty!7012 (= tp!15700 (and e!115903 mapRes!7021))))

(declare-fun mapNonEmpty!7021 () Bool)

(declare-fun tp!15715 () Bool)

(declare-fun e!115904 () Bool)

(assert (=> mapNonEmpty!7021 (= mapRes!7021 (and tp!15715 e!115904))))

(declare-fun mapKey!7021 () (_ BitVec 32))

(declare-fun mapValue!7021 () ValueCell!1712)

(declare-fun mapRest!7021 () (Array (_ BitVec 32) ValueCell!1712))

(assert (=> mapNonEmpty!7021 (= mapRest!7012 (store mapRest!7021 mapKey!7021 mapValue!7021))))

(declare-fun b!175625 () Bool)

(assert (=> b!175625 (= e!115903 tp_is_empty!4111)))

(declare-fun b!175624 () Bool)

(assert (=> b!175624 (= e!115904 tp_is_empty!4111)))

(declare-fun mapIsEmpty!7021 () Bool)

(assert (=> mapIsEmpty!7021 mapRes!7021))

(assert (= (and mapNonEmpty!7012 condMapEmpty!7021) mapIsEmpty!7021))

(assert (= (and mapNonEmpty!7012 (not condMapEmpty!7021)) mapNonEmpty!7021))

(assert (= (and mapNonEmpty!7021 ((_ is ValueCellFull!1712) mapValue!7021)) b!175624))

(assert (= (and mapNonEmpty!7012 ((_ is ValueCellFull!1712) mapDefault!7021)) b!175625))

(declare-fun m!204017 () Bool)

(assert (=> mapNonEmpty!7021 m!204017))

(declare-fun b_lambda!6999 () Bool)

(assert (= b_lambda!6997 (or (and b!175459 b_free!4339) b_lambda!6999)))

(check-sat (not b!175595) (not b!175614) (not b!175601) (not bm!17769) (not b_next!4339) (not b!175550) (not b_lambda!6999) (not b!175615) (not bm!17773) (not d!53341) b_and!10801 (not b!175611) (not d!53349) (not b!175543) (not b!175602) (not bm!17767) (not bm!17770) (not d!53353) tp_is_empty!4111 (not b!175605) (not d!53351) (not b!175533) (not b!175542) (not mapNonEmpty!7021) (not b!175552) (not b!175541) (not b!175596))
(check-sat b_and!10801 (not b_next!4339))
(get-model)

(declare-fun b!175634 () Bool)

(declare-fun e!115909 () (_ BitVec 32))

(declare-fun call!17779 () (_ BitVec 32))

(assert (=> b!175634 (= e!115909 (bvadd #b00000000000000000000000000000001 call!17779))))

(declare-fun b!175635 () Bool)

(declare-fun e!115910 () (_ BitVec 32))

(assert (=> b!175635 (= e!115910 e!115909)))

(declare-fun c!31466 () Bool)

(assert (=> b!175635 (= c!31466 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175636 () Bool)

(assert (=> b!175636 (= e!115909 call!17779)))

(declare-fun b!175637 () Bool)

(assert (=> b!175637 (= e!115910 #b00000000000000000000000000000000)))

(declare-fun bm!17776 () Bool)

(assert (=> bm!17776 (= call!17779 (arrayCountValidKeys!0 (_keys!5474 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun d!53355 () Bool)

(declare-fun lt!86794 () (_ BitVec 32))

(assert (=> d!53355 (and (bvsge lt!86794 #b00000000000000000000000000000000) (bvsle lt!86794 (bvsub (size!3787 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53355 (= lt!86794 e!115910)))

(declare-fun c!31467 () Bool)

(assert (=> d!53355 (= c!31467 (bvsge #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(assert (=> d!53355 (and (bvsle #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3787 (_keys!5474 thiss!1248)) (size!3787 (_keys!5474 thiss!1248))))))

(assert (=> d!53355 (= (arrayCountValidKeys!0 (_keys!5474 thiss!1248) #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))) lt!86794)))

(assert (= (and d!53355 c!31467) b!175637))

(assert (= (and d!53355 (not c!31467)) b!175635))

(assert (= (and b!175635 c!31466) b!175634))

(assert (= (and b!175635 (not c!31466)) b!175636))

(assert (= (or b!175634 b!175636) bm!17776))

(assert (=> b!175635 m!203963))

(assert (=> b!175635 m!203963))

(assert (=> b!175635 m!203965))

(declare-fun m!204019 () Bool)

(assert (=> bm!17776 m!204019))

(assert (=> b!175541 d!53355))

(declare-fun b!175656 () Bool)

(declare-fun e!115921 () Bool)

(declare-fun lt!86800 () SeekEntryResult!562)

(assert (=> b!175656 (= e!115921 (bvsge (x!19319 lt!86800) #b01111111111111111111111111111110))))

(declare-fun b!175657 () Bool)

(assert (=> b!175657 (and (bvsge (index!4418 lt!86800) #b00000000000000000000000000000000) (bvslt (index!4418 lt!86800) (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun e!115925 () Bool)

(assert (=> b!175657 (= e!115925 (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4418 lt!86800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53357 () Bool)

(assert (=> d!53357 e!115921))

(declare-fun c!31475 () Bool)

(assert (=> d!53357 (= c!31475 (and ((_ is Intermediate!562) lt!86800) (undefined!1374 lt!86800)))))

(declare-fun e!115923 () SeekEntryResult!562)

(assert (=> d!53357 (= lt!86800 e!115923)))

(declare-fun c!31474 () Bool)

(assert (=> d!53357 (= c!31474 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!86799 () (_ BitVec 64))

(assert (=> d!53357 (= lt!86799 (select (arr!3484 (_keys!5474 thiss!1248)) (toIndex!0 key!828 (mask!8522 thiss!1248))))))

(assert (=> d!53357 (validMask!0 (mask!8522 thiss!1248))))

(assert (=> d!53357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8522 thiss!1248)) key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)) lt!86800)))

(declare-fun b!175658 () Bool)

(assert (=> b!175658 (and (bvsge (index!4418 lt!86800) #b00000000000000000000000000000000) (bvslt (index!4418 lt!86800) (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun res!83227 () Bool)

(assert (=> b!175658 (= res!83227 (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4418 lt!86800)) key!828))))

(assert (=> b!175658 (=> res!83227 e!115925)))

(declare-fun e!115922 () Bool)

(assert (=> b!175658 (= e!115922 e!115925)))

(declare-fun b!175659 () Bool)

(assert (=> b!175659 (= e!115921 e!115922)))

(declare-fun res!83226 () Bool)

(assert (=> b!175659 (= res!83226 (and ((_ is Intermediate!562) lt!86800) (not (undefined!1374 lt!86800)) (bvslt (x!19319 lt!86800) #b01111111111111111111111111111110) (bvsge (x!19319 lt!86800) #b00000000000000000000000000000000) (bvsge (x!19319 lt!86800) #b00000000000000000000000000000000)))))

(assert (=> b!175659 (=> (not res!83226) (not e!115922))))

(declare-fun b!175660 () Bool)

(declare-fun e!115924 () SeekEntryResult!562)

(assert (=> b!175660 (= e!115923 e!115924)))

(declare-fun c!31476 () Bool)

(assert (=> b!175660 (= c!31476 (or (= lt!86799 key!828) (= (bvadd lt!86799 lt!86799) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175661 () Bool)

(assert (=> b!175661 (= e!115924 (Intermediate!562 false (toIndex!0 key!828 (mask!8522 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175662 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175662 (= e!115924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8522 thiss!1248)) #b00000000000000000000000000000000 (mask!8522 thiss!1248)) key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)))))

(declare-fun b!175663 () Bool)

(assert (=> b!175663 (and (bvsge (index!4418 lt!86800) #b00000000000000000000000000000000) (bvslt (index!4418 lt!86800) (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun res!83228 () Bool)

(assert (=> b!175663 (= res!83228 (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4418 lt!86800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175663 (=> res!83228 e!115925)))

(declare-fun b!175664 () Bool)

(assert (=> b!175664 (= e!115923 (Intermediate!562 true (toIndex!0 key!828 (mask!8522 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!53357 c!31474) b!175664))

(assert (= (and d!53357 (not c!31474)) b!175660))

(assert (= (and b!175660 c!31476) b!175661))

(assert (= (and b!175660 (not c!31476)) b!175662))

(assert (= (and d!53357 c!31475) b!175656))

(assert (= (and d!53357 (not c!31475)) b!175659))

(assert (= (and b!175659 res!83226) b!175658))

(assert (= (and b!175658 (not res!83227)) b!175663))

(assert (= (and b!175663 (not res!83228)) b!175657))

(assert (=> b!175662 m!203933))

(declare-fun m!204021 () Bool)

(assert (=> b!175662 m!204021))

(assert (=> b!175662 m!204021))

(declare-fun m!204023 () Bool)

(assert (=> b!175662 m!204023))

(declare-fun m!204025 () Bool)

(assert (=> b!175657 m!204025))

(assert (=> b!175663 m!204025))

(assert (=> b!175658 m!204025))

(assert (=> d!53357 m!203933))

(declare-fun m!204027 () Bool)

(assert (=> d!53357 m!204027))

(assert (=> d!53357 m!203891))

(assert (=> d!53341 d!53357))

(declare-fun d!53359 () Bool)

(declare-fun lt!86806 () (_ BitVec 32))

(declare-fun lt!86805 () (_ BitVec 32))

(assert (=> d!53359 (= lt!86806 (bvmul (bvxor lt!86805 (bvlshr lt!86805 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53359 (= lt!86805 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53359 (and (bvsge (mask!8522 thiss!1248) #b00000000000000000000000000000000) (let ((res!83229 (let ((h!2849 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19337 (bvmul (bvxor h!2849 (bvlshr h!2849 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19337 (bvlshr x!19337 #b00000000000000000000000000001101)) (mask!8522 thiss!1248)))))) (and (bvslt res!83229 (bvadd (mask!8522 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83229 #b00000000000000000000000000000000))))))

(assert (=> d!53359 (= (toIndex!0 key!828 (mask!8522 thiss!1248)) (bvand (bvxor lt!86806 (bvlshr lt!86806 #b00000000000000000000000000001101)) (mask!8522 thiss!1248)))))

(assert (=> d!53341 d!53359))

(assert (=> d!53341 d!53347))

(declare-fun d!53361 () Bool)

(assert (=> d!53361 (= (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175595 d!53361))

(declare-fun d!53363 () Bool)

(declare-fun e!115926 () Bool)

(assert (=> d!53363 e!115926))

(declare-fun res!83230 () Bool)

(assert (=> d!53363 (=> res!83230 e!115926)))

(declare-fun lt!86808 () Bool)

(assert (=> d!53363 (= res!83230 (not lt!86808))))

(declare-fun lt!86807 () Bool)

(assert (=> d!53363 (= lt!86808 lt!86807)))

(declare-fun lt!86810 () Unit!5363)

(declare-fun e!115927 () Unit!5363)

(assert (=> d!53363 (= lt!86810 e!115927)))

(declare-fun c!31477 () Bool)

(assert (=> d!53363 (= c!31477 lt!86807)))

(assert (=> d!53363 (= lt!86807 (containsKey!192 (toList!1104 lt!86790) (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53363 (= (contains!1169 lt!86790 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)) lt!86808)))

(declare-fun b!175665 () Bool)

(declare-fun lt!86809 () Unit!5363)

(assert (=> b!175665 (= e!115927 lt!86809)))

(assert (=> b!175665 (= lt!86809 (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1104 lt!86790) (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175665 (isDefined!142 (getValueByKey!188 (toList!1104 lt!86790) (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175666 () Bool)

(declare-fun Unit!5367 () Unit!5363)

(assert (=> b!175666 (= e!115927 Unit!5367)))

(declare-fun b!175667 () Bool)

(assert (=> b!175667 (= e!115926 (isDefined!142 (getValueByKey!188 (toList!1104 lt!86790) (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53363 c!31477) b!175665))

(assert (= (and d!53363 (not c!31477)) b!175666))

(assert (= (and d!53363 (not res!83230)) b!175667))

(assert (=> d!53363 m!203963))

(declare-fun m!204029 () Bool)

(assert (=> d!53363 m!204029))

(assert (=> b!175665 m!203963))

(declare-fun m!204031 () Bool)

(assert (=> b!175665 m!204031))

(assert (=> b!175665 m!203963))

(declare-fun m!204033 () Bool)

(assert (=> b!175665 m!204033))

(assert (=> b!175665 m!204033))

(declare-fun m!204035 () Bool)

(assert (=> b!175665 m!204035))

(assert (=> b!175667 m!203963))

(assert (=> b!175667 m!204033))

(assert (=> b!175667 m!204033))

(assert (=> b!175667 m!204035))

(assert (=> b!175605 d!53363))

(declare-fun b!175680 () Bool)

(declare-fun e!115934 () SeekEntryResult!562)

(assert (=> b!175680 (= e!115934 Undefined!562)))

(declare-fun b!175681 () Bool)

(declare-fun c!31484 () Bool)

(declare-fun lt!86815 () (_ BitVec 64))

(assert (=> b!175681 (= c!31484 (= lt!86815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115935 () SeekEntryResult!562)

(declare-fun e!115936 () SeekEntryResult!562)

(assert (=> b!175681 (= e!115935 e!115936)))

(declare-fun b!175682 () Bool)

(assert (=> b!175682 (= e!115935 (Found!562 (index!4418 lt!86713)))))

(declare-fun lt!86816 () SeekEntryResult!562)

(declare-fun d!53365 () Bool)

(assert (=> d!53365 (and (or ((_ is Undefined!562) lt!86816) (not ((_ is Found!562) lt!86816)) (and (bvsge (index!4417 lt!86816) #b00000000000000000000000000000000) (bvslt (index!4417 lt!86816) (size!3787 (_keys!5474 thiss!1248))))) (or ((_ is Undefined!562) lt!86816) ((_ is Found!562) lt!86816) (not ((_ is MissingVacant!562) lt!86816)) (not (= (index!4419 lt!86816) (index!4418 lt!86713))) (and (bvsge (index!4419 lt!86816) #b00000000000000000000000000000000) (bvslt (index!4419 lt!86816) (size!3787 (_keys!5474 thiss!1248))))) (or ((_ is Undefined!562) lt!86816) (ite ((_ is Found!562) lt!86816) (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4417 lt!86816)) key!828) (and ((_ is MissingVacant!562) lt!86816) (= (index!4419 lt!86816) (index!4418 lt!86713)) (= (select (arr!3484 (_keys!5474 thiss!1248)) (index!4419 lt!86816)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53365 (= lt!86816 e!115934)))

(declare-fun c!31485 () Bool)

(assert (=> d!53365 (= c!31485 (bvsge (x!19319 lt!86713) #b01111111111111111111111111111110))))

(assert (=> d!53365 (= lt!86815 (select (arr!3484 (_keys!5474 thiss!1248)) (index!4418 lt!86713)))))

(assert (=> d!53365 (validMask!0 (mask!8522 thiss!1248))))

(assert (=> d!53365 (= (seekKeyOrZeroReturnVacant!0 (x!19319 lt!86713) (index!4418 lt!86713) (index!4418 lt!86713) key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)) lt!86816)))

(declare-fun b!175683 () Bool)

(assert (=> b!175683 (= e!115936 (MissingVacant!562 (index!4418 lt!86713)))))

(declare-fun b!175684 () Bool)

(assert (=> b!175684 (= e!115936 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19319 lt!86713) #b00000000000000000000000000000001) (nextIndex!0 (index!4418 lt!86713) (x!19319 lt!86713) (mask!8522 thiss!1248)) (index!4418 lt!86713) key!828 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)))))

(declare-fun b!175685 () Bool)

(assert (=> b!175685 (= e!115934 e!115935)))

(declare-fun c!31486 () Bool)

(assert (=> b!175685 (= c!31486 (= lt!86815 key!828))))

(assert (= (and d!53365 c!31485) b!175680))

(assert (= (and d!53365 (not c!31485)) b!175685))

(assert (= (and b!175685 c!31486) b!175682))

(assert (= (and b!175685 (not c!31486)) b!175681))

(assert (= (and b!175681 c!31484) b!175683))

(assert (= (and b!175681 (not c!31484)) b!175684))

(declare-fun m!204037 () Bool)

(assert (=> d!53365 m!204037))

(declare-fun m!204039 () Bool)

(assert (=> d!53365 m!204039))

(assert (=> d!53365 m!203929))

(assert (=> d!53365 m!203891))

(declare-fun m!204041 () Bool)

(assert (=> b!175684 m!204041))

(assert (=> b!175684 m!204041))

(declare-fun m!204043 () Bool)

(assert (=> b!175684 m!204043))

(assert (=> b!175533 d!53365))

(declare-fun b!175696 () Bool)

(declare-fun res!83241 () Bool)

(declare-fun e!115939 () Bool)

(assert (=> b!175696 (=> (not res!83241) (not e!115939))))

(declare-fun size!3793 (LongMapFixedSize!2332) (_ BitVec 32))

(assert (=> b!175696 (= res!83241 (= (size!3793 thiss!1248) (bvadd (_size!1215 thiss!1248) (bvsdiv (bvadd (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!175694 () Bool)

(declare-fun res!83240 () Bool)

(assert (=> b!175694 (=> (not res!83240) (not e!115939))))

(assert (=> b!175694 (= res!83240 (and (= (size!3788 (_values!3605 thiss!1248)) (bvadd (mask!8522 thiss!1248) #b00000000000000000000000000000001)) (= (size!3787 (_keys!5474 thiss!1248)) (size!3788 (_values!3605 thiss!1248))) (bvsge (_size!1215 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1215 thiss!1248) (bvadd (mask!8522 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53367 () Bool)

(declare-fun res!83239 () Bool)

(assert (=> d!53367 (=> (not res!83239) (not e!115939))))

(assert (=> d!53367 (= res!83239 (validMask!0 (mask!8522 thiss!1248)))))

(assert (=> d!53367 (= (simpleValid!149 thiss!1248) e!115939)))

(declare-fun b!175697 () Bool)

(assert (=> b!175697 (= e!115939 (and (bvsge (extraKeys!3359 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3359 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1215 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175695 () Bool)

(declare-fun res!83242 () Bool)

(assert (=> b!175695 (=> (not res!83242) (not e!115939))))

(assert (=> b!175695 (= res!83242 (bvsge (size!3793 thiss!1248) (_size!1215 thiss!1248)))))

(assert (= (and d!53367 res!83239) b!175694))

(assert (= (and b!175694 res!83240) b!175695))

(assert (= (and b!175695 res!83242) b!175696))

(assert (= (and b!175696 res!83241) b!175697))

(declare-fun m!204045 () Bool)

(assert (=> b!175696 m!204045))

(assert (=> d!53367 m!203891))

(assert (=> b!175695 m!204045))

(assert (=> d!53349 d!53367))

(declare-fun d!53369 () Bool)

(declare-fun get!1987 (Option!194) V!5129)

(assert (=> d!53369 (= (apply!135 lt!86790 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1987 (getValueByKey!188 (toList!1104 lt!86790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7222 () Bool)

(assert (= bs!7222 d!53369))

(declare-fun m!204047 () Bool)

(assert (=> bs!7222 m!204047))

(assert (=> bs!7222 m!204047))

(declare-fun m!204049 () Bool)

(assert (=> bs!7222 m!204049))

(assert (=> b!175596 d!53369))

(assert (=> b!175611 d!53361))

(declare-fun d!53371 () Bool)

(assert (=> d!53371 (= (apply!135 lt!86790 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1987 (getValueByKey!188 (toList!1104 lt!86790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7223 () Bool)

(assert (= bs!7223 d!53371))

(declare-fun m!204051 () Bool)

(assert (=> bs!7223 m!204051))

(assert (=> bs!7223 m!204051))

(declare-fun m!204053 () Bool)

(assert (=> bs!7223 m!204053))

(assert (=> b!175602 d!53371))

(declare-fun d!53373 () Bool)

(declare-fun isEmpty!447 (Option!194) Bool)

(assert (=> d!53373 (= (isDefined!142 (getValueByKey!188 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828)) (not (isEmpty!447 (getValueByKey!188 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))))

(declare-fun bs!7224 () Bool)

(assert (= bs!7224 d!53373))

(assert (=> bs!7224 m!203955))

(declare-fun m!204055 () Bool)

(assert (=> bs!7224 m!204055))

(assert (=> b!175552 d!53373))

(declare-fun b!175709 () Bool)

(declare-fun e!115945 () Option!194)

(assert (=> b!175709 (= e!115945 None!192)))

(declare-fun b!175706 () Bool)

(declare-fun e!115944 () Option!194)

(assert (=> b!175706 (= e!115944 (Some!193 (_2!1640 (h!2845 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))))))

(declare-fun d!53375 () Bool)

(declare-fun c!31491 () Bool)

(assert (=> d!53375 (= c!31491 (and ((_ is Cons!2226) (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (= (_1!1640 (h!2845 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)))))

(assert (=> d!53375 (= (getValueByKey!188 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828) e!115944)))

(declare-fun b!175707 () Bool)

(assert (=> b!175707 (= e!115944 e!115945)))

(declare-fun c!31492 () Bool)

(assert (=> b!175707 (= c!31492 (and ((_ is Cons!2226) (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (not (= (_1!1640 (h!2845 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828))))))

(declare-fun b!175708 () Bool)

(assert (=> b!175708 (= e!115945 (getValueByKey!188 (t!7041 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) key!828))))

(assert (= (and d!53375 c!31491) b!175706))

(assert (= (and d!53375 (not c!31491)) b!175707))

(assert (= (and b!175707 c!31492) b!175708))

(assert (= (and b!175707 (not c!31492)) b!175709))

(declare-fun m!204057 () Bool)

(assert (=> b!175708 m!204057))

(assert (=> b!175552 d!53375))

(declare-fun d!53377 () Bool)

(declare-fun e!115948 () Bool)

(assert (=> d!53377 e!115948))

(declare-fun res!83247 () Bool)

(assert (=> d!53377 (=> (not res!83247) (not e!115948))))

(declare-fun lt!86825 () ListLongMap!2177)

(assert (=> d!53377 (= res!83247 (contains!1169 lt!86825 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun lt!86826 () List!2230)

(assert (=> d!53377 (= lt!86825 (ListLongMap!2178 lt!86826))))

(declare-fun lt!86828 () Unit!5363)

(declare-fun lt!86827 () Unit!5363)

(assert (=> d!53377 (= lt!86828 lt!86827)))

(assert (=> d!53377 (= (getValueByKey!188 lt!86826 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!102 (List!2230 (_ BitVec 64) V!5129) Unit!5363)

(assert (=> d!53377 (= lt!86827 (lemmaContainsTupThenGetReturnValue!102 lt!86826 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun insertStrictlySorted!105 (List!2230 (_ BitVec 64) V!5129) List!2230)

(assert (=> d!53377 (= lt!86826 (insertStrictlySorted!105 (toList!1104 call!17773) (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(assert (=> d!53377 (= (+!247 call!17773 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))) lt!86825)))

(declare-fun b!175714 () Bool)

(declare-fun res!83248 () Bool)

(assert (=> b!175714 (=> (not res!83248) (not e!115948))))

(assert (=> b!175714 (= res!83248 (= (getValueByKey!188 (toList!1104 lt!86825) (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(declare-fun b!175715 () Bool)

(declare-fun contains!1172 (List!2230 tuple2!3258) Bool)

(assert (=> b!175715 (= e!115948 (contains!1172 (toList!1104 lt!86825) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))

(assert (= (and d!53377 res!83247) b!175714))

(assert (= (and b!175714 res!83248) b!175715))

(declare-fun m!204059 () Bool)

(assert (=> d!53377 m!204059))

(declare-fun m!204061 () Bool)

(assert (=> d!53377 m!204061))

(declare-fun m!204063 () Bool)

(assert (=> d!53377 m!204063))

(declare-fun m!204065 () Bool)

(assert (=> d!53377 m!204065))

(declare-fun m!204067 () Bool)

(assert (=> b!175714 m!204067))

(declare-fun m!204069 () Bool)

(assert (=> b!175715 m!204069))

(assert (=> b!175601 d!53377))

(assert (=> d!53353 d!53347))

(declare-fun d!53379 () Bool)

(declare-fun e!115949 () Bool)

(assert (=> d!53379 e!115949))

(declare-fun res!83249 () Bool)

(assert (=> d!53379 (=> res!83249 e!115949)))

(declare-fun lt!86830 () Bool)

(assert (=> d!53379 (= res!83249 (not lt!86830))))

(declare-fun lt!86829 () Bool)

(assert (=> d!53379 (= lt!86830 lt!86829)))

(declare-fun lt!86832 () Unit!5363)

(declare-fun e!115950 () Unit!5363)

(assert (=> d!53379 (= lt!86832 e!115950)))

(declare-fun c!31493 () Bool)

(assert (=> d!53379 (= c!31493 lt!86829)))

(assert (=> d!53379 (= lt!86829 (containsKey!192 (toList!1104 lt!86790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53379 (= (contains!1169 lt!86790 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86830)))

(declare-fun b!175716 () Bool)

(declare-fun lt!86831 () Unit!5363)

(assert (=> b!175716 (= e!115950 lt!86831)))

(assert (=> b!175716 (= lt!86831 (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1104 lt!86790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175716 (isDefined!142 (getValueByKey!188 (toList!1104 lt!86790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175717 () Bool)

(declare-fun Unit!5368 () Unit!5363)

(assert (=> b!175717 (= e!115950 Unit!5368)))

(declare-fun b!175718 () Bool)

(assert (=> b!175718 (= e!115949 (isDefined!142 (getValueByKey!188 (toList!1104 lt!86790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53379 c!31493) b!175716))

(assert (= (and d!53379 (not c!31493)) b!175717))

(assert (= (and d!53379 (not res!83249)) b!175718))

(declare-fun m!204071 () Bool)

(assert (=> d!53379 m!204071))

(declare-fun m!204073 () Bool)

(assert (=> b!175716 m!204073))

(assert (=> b!175716 m!204047))

(assert (=> b!175716 m!204047))

(declare-fun m!204075 () Bool)

(assert (=> b!175716 m!204075))

(assert (=> b!175718 m!204047))

(assert (=> b!175718 m!204047))

(assert (=> b!175718 m!204075))

(assert (=> bm!17773 d!53379))

(declare-fun d!53381 () Bool)

(assert (=> d!53381 (isDefined!142 (getValueByKey!188 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-fun lt!86835 () Unit!5363)

(declare-fun choose!947 (List!2230 (_ BitVec 64)) Unit!5363)

(assert (=> d!53381 (= lt!86835 (choose!947 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-fun e!115953 () Bool)

(assert (=> d!53381 e!115953))

(declare-fun res!83252 () Bool)

(assert (=> d!53381 (=> (not res!83252) (not e!115953))))

(declare-fun isStrictlySorted!330 (List!2230) Bool)

(assert (=> d!53381 (= res!83252 (isStrictlySorted!330 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))))

(assert (=> d!53381 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828) lt!86835)))

(declare-fun b!175721 () Bool)

(assert (=> b!175721 (= e!115953 (containsKey!192 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(assert (= (and d!53381 res!83252) b!175721))

(assert (=> d!53381 m!203955))

(assert (=> d!53381 m!203955))

(assert (=> d!53381 m!203957))

(declare-fun m!204077 () Bool)

(assert (=> d!53381 m!204077))

(declare-fun m!204079 () Bool)

(assert (=> d!53381 m!204079))

(assert (=> b!175721 m!203951))

(assert (=> b!175550 d!53381))

(assert (=> b!175550 d!53373))

(assert (=> b!175550 d!53375))

(declare-fun d!53383 () Bool)

(declare-fun e!115954 () Bool)

(assert (=> d!53383 e!115954))

(declare-fun res!83253 () Bool)

(assert (=> d!53383 (=> (not res!83253) (not e!115954))))

(declare-fun lt!86836 () ListLongMap!2177)

(assert (=> d!53383 (= res!83253 (contains!1169 lt!86836 (_1!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(declare-fun lt!86837 () List!2230)

(assert (=> d!53383 (= lt!86836 (ListLongMap!2178 lt!86837))))

(declare-fun lt!86839 () Unit!5363)

(declare-fun lt!86838 () Unit!5363)

(assert (=> d!53383 (= lt!86839 lt!86838)))

(assert (=> d!53383 (= (getValueByKey!188 lt!86837 (_1!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))) (Some!193 (_2!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(assert (=> d!53383 (= lt!86838 (lemmaContainsTupThenGetReturnValue!102 lt!86837 (_1!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (_2!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(assert (=> d!53383 (= lt!86837 (insertStrictlySorted!105 (toList!1104 (ite c!31459 call!17772 (ite c!31456 call!17770 call!17771))) (_1!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (_2!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(assert (=> d!53383 (= (+!247 (ite c!31459 call!17772 (ite c!31456 call!17770 call!17771)) (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) lt!86836)))

(declare-fun b!175722 () Bool)

(declare-fun res!83254 () Bool)

(assert (=> b!175722 (=> (not res!83254) (not e!115954))))

(assert (=> b!175722 (= res!83254 (= (getValueByKey!188 (toList!1104 lt!86836) (_1!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))) (Some!193 (_2!1640 (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))))

(declare-fun b!175723 () Bool)

(assert (=> b!175723 (= e!115954 (contains!1172 (toList!1104 lt!86836) (ite (or c!31459 c!31456) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(assert (= (and d!53383 res!83253) b!175722))

(assert (= (and b!175722 res!83254) b!175723))

(declare-fun m!204081 () Bool)

(assert (=> d!53383 m!204081))

(declare-fun m!204083 () Bool)

(assert (=> d!53383 m!204083))

(declare-fun m!204085 () Bool)

(assert (=> d!53383 m!204085))

(declare-fun m!204087 () Bool)

(assert (=> d!53383 m!204087))

(declare-fun m!204089 () Bool)

(assert (=> b!175722 m!204089))

(declare-fun m!204091 () Bool)

(assert (=> b!175723 m!204091))

(assert (=> bm!17767 d!53383))

(declare-fun d!53385 () Bool)

(declare-fun e!115955 () Bool)

(assert (=> d!53385 e!115955))

(declare-fun res!83255 () Bool)

(assert (=> d!53385 (=> res!83255 e!115955)))

(declare-fun lt!86841 () Bool)

(assert (=> d!53385 (= res!83255 (not lt!86841))))

(declare-fun lt!86840 () Bool)

(assert (=> d!53385 (= lt!86841 lt!86840)))

(declare-fun lt!86843 () Unit!5363)

(declare-fun e!115956 () Unit!5363)

(assert (=> d!53385 (= lt!86843 e!115956)))

(declare-fun c!31494 () Bool)

(assert (=> d!53385 (= c!31494 lt!86840)))

(assert (=> d!53385 (= lt!86840 (containsKey!192 (toList!1104 lt!86790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53385 (= (contains!1169 lt!86790 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86841)))

(declare-fun b!175724 () Bool)

(declare-fun lt!86842 () Unit!5363)

(assert (=> b!175724 (= e!115956 lt!86842)))

(assert (=> b!175724 (= lt!86842 (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1104 lt!86790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175724 (isDefined!142 (getValueByKey!188 (toList!1104 lt!86790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175725 () Bool)

(declare-fun Unit!5369 () Unit!5363)

(assert (=> b!175725 (= e!115956 Unit!5369)))

(declare-fun b!175726 () Bool)

(assert (=> b!175726 (= e!115955 (isDefined!142 (getValueByKey!188 (toList!1104 lt!86790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53385 c!31494) b!175724))

(assert (= (and d!53385 (not c!31494)) b!175725))

(assert (= (and d!53385 (not res!83255)) b!175726))

(declare-fun m!204093 () Bool)

(assert (=> d!53385 m!204093))

(declare-fun m!204095 () Bool)

(assert (=> b!175724 m!204095))

(assert (=> b!175724 m!204051))

(assert (=> b!175724 m!204051))

(declare-fun m!204097 () Bool)

(assert (=> b!175724 m!204097))

(assert (=> b!175726 m!204051))

(assert (=> b!175726 m!204051))

(assert (=> b!175726 m!204097))

(assert (=> bm!17770 d!53385))

(declare-fun d!53387 () Bool)

(assert (=> d!53387 (= (apply!135 lt!86777 lt!86783) (get!1987 (getValueByKey!188 (toList!1104 lt!86777) lt!86783)))))

(declare-fun bs!7225 () Bool)

(assert (= bs!7225 d!53387))

(declare-fun m!204099 () Bool)

(assert (=> bs!7225 m!204099))

(assert (=> bs!7225 m!204099))

(declare-fun m!204101 () Bool)

(assert (=> bs!7225 m!204101))

(assert (=> b!175615 d!53387))

(declare-fun b!175751 () Bool)

(declare-fun e!115973 () Bool)

(assert (=> b!175751 (= e!115973 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175751 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!175752 () Bool)

(declare-fun e!115972 () ListLongMap!2177)

(declare-fun e!115975 () ListLongMap!2177)

(assert (=> b!175752 (= e!115972 e!115975)))

(declare-fun c!31505 () Bool)

(assert (=> b!175752 (= c!31505 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53389 () Bool)

(declare-fun e!115977 () Bool)

(assert (=> d!53389 e!115977))

(declare-fun res!83265 () Bool)

(assert (=> d!53389 (=> (not res!83265) (not e!115977))))

(declare-fun lt!86860 () ListLongMap!2177)

(assert (=> d!53389 (= res!83265 (not (contains!1169 lt!86860 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53389 (= lt!86860 e!115972)))

(declare-fun c!31506 () Bool)

(assert (=> d!53389 (= c!31506 (bvsge #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(assert (=> d!53389 (validMask!0 (mask!8522 thiss!1248))))

(assert (=> d!53389 (= (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) lt!86860)))

(declare-fun b!175753 () Bool)

(declare-fun lt!86861 () Unit!5363)

(declare-fun lt!86859 () Unit!5363)

(assert (=> b!175753 (= lt!86861 lt!86859)))

(declare-fun lt!86858 () (_ BitVec 64))

(declare-fun lt!86863 () (_ BitVec 64))

(declare-fun lt!86862 () ListLongMap!2177)

(declare-fun lt!86864 () V!5129)

(assert (=> b!175753 (not (contains!1169 (+!247 lt!86862 (tuple2!3259 lt!86858 lt!86864)) lt!86863))))

(declare-fun addStillNotContains!76 (ListLongMap!2177 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5363)

(assert (=> b!175753 (= lt!86859 (addStillNotContains!76 lt!86862 lt!86858 lt!86864 lt!86863))))

(assert (=> b!175753 (= lt!86863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!175753 (= lt!86864 (get!1986 (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!469 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175753 (= lt!86858 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17782 () ListLongMap!2177)

(assert (=> b!175753 (= lt!86862 call!17782)))

(assert (=> b!175753 (= e!115975 (+!247 call!17782 (tuple2!3259 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000) (get!1986 (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!469 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!175754 () Bool)

(assert (=> b!175754 (= e!115975 call!17782)))

(declare-fun bm!17779 () Bool)

(assert (=> bm!17779 (= call!17782 (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3622 thiss!1248)))))

(declare-fun b!175755 () Bool)

(declare-fun res!83267 () Bool)

(assert (=> b!175755 (=> (not res!83267) (not e!115977))))

(assert (=> b!175755 (= res!83267 (not (contains!1169 lt!86860 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175756 () Bool)

(assert (=> b!175756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(assert (=> b!175756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3788 (_values!3605 thiss!1248))))))

(declare-fun e!115971 () Bool)

(assert (=> b!175756 (= e!115971 (= (apply!135 lt!86860 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)) (get!1986 (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!469 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!175757 () Bool)

(declare-fun e!115974 () Bool)

(declare-fun e!115976 () Bool)

(assert (=> b!175757 (= e!115974 e!115976)))

(declare-fun c!31503 () Bool)

(assert (=> b!175757 (= c!31503 (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun b!175758 () Bool)

(assert (=> b!175758 (= e!115977 e!115974)))

(declare-fun c!31504 () Bool)

(assert (=> b!175758 (= c!31504 e!115973)))

(declare-fun res!83266 () Bool)

(assert (=> b!175758 (=> (not res!83266) (not e!115973))))

(assert (=> b!175758 (= res!83266 (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun b!175759 () Bool)

(assert (=> b!175759 (= e!115974 e!115971)))

(assert (=> b!175759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(declare-fun res!83264 () Bool)

(assert (=> b!175759 (= res!83264 (contains!1169 lt!86860 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175759 (=> (not res!83264) (not e!115971))))

(declare-fun b!175760 () Bool)

(assert (=> b!175760 (= e!115972 (ListLongMap!2178 Nil!2227))))

(declare-fun b!175761 () Bool)

(assert (=> b!175761 (= e!115976 (= lt!86860 (getCurrentListMapNoExtraKeys!156 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3622 thiss!1248))))))

(declare-fun b!175762 () Bool)

(declare-fun isEmpty!448 (ListLongMap!2177) Bool)

(assert (=> b!175762 (= e!115976 (isEmpty!448 lt!86860))))

(assert (= (and d!53389 c!31506) b!175760))

(assert (= (and d!53389 (not c!31506)) b!175752))

(assert (= (and b!175752 c!31505) b!175753))

(assert (= (and b!175752 (not c!31505)) b!175754))

(assert (= (or b!175753 b!175754) bm!17779))

(assert (= (and d!53389 res!83265) b!175755))

(assert (= (and b!175755 res!83267) b!175758))

(assert (= (and b!175758 res!83266) b!175751))

(assert (= (and b!175758 c!31504) b!175759))

(assert (= (and b!175758 (not c!31504)) b!175757))

(assert (= (and b!175759 res!83264) b!175756))

(assert (= (and b!175757 c!31503) b!175761))

(assert (= (and b!175757 (not c!31503)) b!175762))

(declare-fun b_lambda!7001 () Bool)

(assert (=> (not b_lambda!7001) (not b!175753)))

(assert (=> b!175753 t!7045))

(declare-fun b_and!10803 () Bool)

(assert (= b_and!10801 (and (=> t!7045 result!4609) b_and!10803)))

(declare-fun b_lambda!7003 () Bool)

(assert (=> (not b_lambda!7003) (not b!175756)))

(assert (=> b!175756 t!7045))

(declare-fun b_and!10805 () Bool)

(assert (= b_and!10803 (and (=> t!7045 result!4609) b_and!10805)))

(assert (=> b!175756 m!203973))

(assert (=> b!175756 m!203971))

(assert (=> b!175756 m!203973))

(assert (=> b!175756 m!203975))

(assert (=> b!175756 m!203963))

(assert (=> b!175756 m!203971))

(assert (=> b!175756 m!203963))

(declare-fun m!204103 () Bool)

(assert (=> b!175756 m!204103))

(declare-fun m!204105 () Bool)

(assert (=> b!175761 m!204105))

(assert (=> b!175753 m!203973))

(assert (=> b!175753 m!203971))

(assert (=> b!175753 m!203973))

(assert (=> b!175753 m!203975))

(declare-fun m!204107 () Bool)

(assert (=> b!175753 m!204107))

(assert (=> b!175753 m!203963))

(declare-fun m!204109 () Bool)

(assert (=> b!175753 m!204109))

(assert (=> b!175753 m!203971))

(declare-fun m!204111 () Bool)

(assert (=> b!175753 m!204111))

(assert (=> b!175753 m!204111))

(declare-fun m!204113 () Bool)

(assert (=> b!175753 m!204113))

(assert (=> b!175752 m!203963))

(assert (=> b!175752 m!203963))

(assert (=> b!175752 m!203965))

(declare-fun m!204115 () Bool)

(assert (=> b!175762 m!204115))

(assert (=> b!175751 m!203963))

(assert (=> b!175751 m!203963))

(assert (=> b!175751 m!203965))

(declare-fun m!204117 () Bool)

(assert (=> b!175755 m!204117))

(declare-fun m!204119 () Bool)

(assert (=> d!53389 m!204119))

(assert (=> d!53389 m!203891))

(assert (=> b!175759 m!203963))

(assert (=> b!175759 m!203963))

(declare-fun m!204121 () Bool)

(assert (=> b!175759 m!204121))

(assert (=> bm!17779 m!204105))

(assert (=> b!175615 d!53389))

(declare-fun d!53391 () Bool)

(declare-fun e!115978 () Bool)

(assert (=> d!53391 e!115978))

(declare-fun res!83268 () Bool)

(assert (=> d!53391 (=> (not res!83268) (not e!115978))))

(declare-fun lt!86865 () ListLongMap!2177)

(assert (=> d!53391 (= res!83268 (contains!1169 lt!86865 (_1!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248)))))))

(declare-fun lt!86866 () List!2230)

(assert (=> d!53391 (= lt!86865 (ListLongMap!2178 lt!86866))))

(declare-fun lt!86868 () Unit!5363)

(declare-fun lt!86867 () Unit!5363)

(assert (=> d!53391 (= lt!86868 lt!86867)))

(assert (=> d!53391 (= (getValueByKey!188 lt!86866 (_1!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248)))))))

(assert (=> d!53391 (= lt!86867 (lemmaContainsTupThenGetReturnValue!102 lt!86866 (_1!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248)))))))

(assert (=> d!53391 (= lt!86866 (insertStrictlySorted!105 (toList!1104 lt!86776) (_1!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248)))))))

(assert (=> d!53391 (= (+!247 lt!86776 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))) lt!86865)))

(declare-fun b!175763 () Bool)

(declare-fun res!83269 () Bool)

(assert (=> b!175763 (=> (not res!83269) (not e!115978))))

(assert (=> b!175763 (= res!83269 (= (getValueByKey!188 (toList!1104 lt!86865) (_1!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))))))))

(declare-fun b!175764 () Bool)

(assert (=> b!175764 (= e!115978 (contains!1172 (toList!1104 lt!86865) (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))))))

(assert (= (and d!53391 res!83268) b!175763))

(assert (= (and b!175763 res!83269) b!175764))

(declare-fun m!204123 () Bool)

(assert (=> d!53391 m!204123))

(declare-fun m!204125 () Bool)

(assert (=> d!53391 m!204125))

(declare-fun m!204127 () Bool)

(assert (=> d!53391 m!204127))

(declare-fun m!204129 () Bool)

(assert (=> d!53391 m!204129))

(declare-fun m!204131 () Bool)

(assert (=> b!175763 m!204131))

(declare-fun m!204133 () Bool)

(assert (=> b!175764 m!204133))

(assert (=> b!175615 d!53391))

(declare-fun d!53393 () Bool)

(assert (=> d!53393 (= (apply!135 (+!247 lt!86777 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))) lt!86783) (get!1987 (getValueByKey!188 (toList!1104 (+!247 lt!86777 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248)))) lt!86783)))))

(declare-fun bs!7226 () Bool)

(assert (= bs!7226 d!53393))

(declare-fun m!204135 () Bool)

(assert (=> bs!7226 m!204135))

(assert (=> bs!7226 m!204135))

(declare-fun m!204137 () Bool)

(assert (=> bs!7226 m!204137))

(assert (=> b!175615 d!53393))

(declare-fun d!53395 () Bool)

(declare-fun e!115979 () Bool)

(assert (=> d!53395 e!115979))

(declare-fun res!83270 () Bool)

(assert (=> d!53395 (=> res!83270 e!115979)))

(declare-fun lt!86870 () Bool)

(assert (=> d!53395 (= res!83270 (not lt!86870))))

(declare-fun lt!86869 () Bool)

(assert (=> d!53395 (= lt!86870 lt!86869)))

(declare-fun lt!86872 () Unit!5363)

(declare-fun e!115980 () Unit!5363)

(assert (=> d!53395 (= lt!86872 e!115980)))

(declare-fun c!31507 () Bool)

(assert (=> d!53395 (= c!31507 lt!86869)))

(assert (=> d!53395 (= lt!86869 (containsKey!192 (toList!1104 (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))) lt!86773))))

(assert (=> d!53395 (= (contains!1169 (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))) lt!86773) lt!86870)))

(declare-fun b!175765 () Bool)

(declare-fun lt!86871 () Unit!5363)

(assert (=> b!175765 (= e!115980 lt!86871)))

(assert (=> b!175765 (= lt!86871 (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1104 (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))) lt!86773))))

(assert (=> b!175765 (isDefined!142 (getValueByKey!188 (toList!1104 (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))) lt!86773))))

(declare-fun b!175766 () Bool)

(declare-fun Unit!5370 () Unit!5363)

(assert (=> b!175766 (= e!115980 Unit!5370)))

(declare-fun b!175767 () Bool)

(assert (=> b!175767 (= e!115979 (isDefined!142 (getValueByKey!188 (toList!1104 (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))) lt!86773)))))

(assert (= (and d!53395 c!31507) b!175765))

(assert (= (and d!53395 (not c!31507)) b!175766))

(assert (= (and d!53395 (not res!83270)) b!175767))

(declare-fun m!204139 () Bool)

(assert (=> d!53395 m!204139))

(declare-fun m!204141 () Bool)

(assert (=> b!175765 m!204141))

(declare-fun m!204143 () Bool)

(assert (=> b!175765 m!204143))

(assert (=> b!175765 m!204143))

(declare-fun m!204145 () Bool)

(assert (=> b!175765 m!204145))

(assert (=> b!175767 m!204143))

(assert (=> b!175767 m!204143))

(assert (=> b!175767 m!204145))

(assert (=> b!175615 d!53395))

(declare-fun d!53397 () Bool)

(assert (=> d!53397 (= (apply!135 (+!247 lt!86777 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))) lt!86783) (apply!135 lt!86777 lt!86783))))

(declare-fun lt!86875 () Unit!5363)

(declare-fun choose!948 (ListLongMap!2177 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5363)

(assert (=> d!53397 (= lt!86875 (choose!948 lt!86777 lt!86778 (minValue!3463 thiss!1248) lt!86783))))

(declare-fun e!115983 () Bool)

(assert (=> d!53397 e!115983))

(declare-fun res!83273 () Bool)

(assert (=> d!53397 (=> (not res!83273) (not e!115983))))

(assert (=> d!53397 (= res!83273 (contains!1169 lt!86777 lt!86783))))

(assert (=> d!53397 (= (addApplyDifferent!111 lt!86777 lt!86778 (minValue!3463 thiss!1248) lt!86783) lt!86875)))

(declare-fun b!175771 () Bool)

(assert (=> b!175771 (= e!115983 (not (= lt!86783 lt!86778)))))

(assert (= (and d!53397 res!83273) b!175771))

(declare-fun m!204147 () Bool)

(assert (=> d!53397 m!204147))

(declare-fun m!204149 () Bool)

(assert (=> d!53397 m!204149))

(assert (=> d!53397 m!204011))

(assert (=> d!53397 m!204011))

(assert (=> d!53397 m!204013))

(assert (=> d!53397 m!203995))

(assert (=> b!175615 d!53397))

(declare-fun d!53399 () Bool)

(assert (=> d!53399 (= (apply!135 (+!247 lt!86776 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))) lt!86782) (get!1987 (getValueByKey!188 (toList!1104 (+!247 lt!86776 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248)))) lt!86782)))))

(declare-fun bs!7227 () Bool)

(assert (= bs!7227 d!53399))

(declare-fun m!204151 () Bool)

(assert (=> bs!7227 m!204151))

(assert (=> bs!7227 m!204151))

(declare-fun m!204153 () Bool)

(assert (=> bs!7227 m!204153))

(assert (=> b!175615 d!53399))

(declare-fun d!53401 () Bool)

(declare-fun e!115984 () Bool)

(assert (=> d!53401 e!115984))

(declare-fun res!83274 () Bool)

(assert (=> d!53401 (=> (not res!83274) (not e!115984))))

(declare-fun lt!86876 () ListLongMap!2177)

(assert (=> d!53401 (= res!83274 (contains!1169 lt!86876 (_1!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248)))))))

(declare-fun lt!86877 () List!2230)

(assert (=> d!53401 (= lt!86876 (ListLongMap!2178 lt!86877))))

(declare-fun lt!86879 () Unit!5363)

(declare-fun lt!86878 () Unit!5363)

(assert (=> d!53401 (= lt!86879 lt!86878)))

(assert (=> d!53401 (= (getValueByKey!188 lt!86877 (_1!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53401 (= lt!86878 (lemmaContainsTupThenGetReturnValue!102 lt!86877 (_1!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53401 (= lt!86877 (insertStrictlySorted!105 (toList!1104 lt!86779) (_1!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53401 (= (+!247 lt!86779 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))) lt!86876)))

(declare-fun b!175772 () Bool)

(declare-fun res!83275 () Bool)

(assert (=> b!175772 (=> (not res!83275) (not e!115984))))

(assert (=> b!175772 (= res!83275 (= (getValueByKey!188 (toList!1104 lt!86876) (_1!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))))))))

(declare-fun b!175773 () Bool)

(assert (=> b!175773 (= e!115984 (contains!1172 (toList!1104 lt!86876) (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))))))

(assert (= (and d!53401 res!83274) b!175772))

(assert (= (and b!175772 res!83275) b!175773))

(declare-fun m!204155 () Bool)

(assert (=> d!53401 m!204155))

(declare-fun m!204157 () Bool)

(assert (=> d!53401 m!204157))

(declare-fun m!204159 () Bool)

(assert (=> d!53401 m!204159))

(declare-fun m!204161 () Bool)

(assert (=> d!53401 m!204161))

(declare-fun m!204163 () Bool)

(assert (=> b!175772 m!204163))

(declare-fun m!204165 () Bool)

(assert (=> b!175773 m!204165))

(assert (=> b!175615 d!53401))

(declare-fun d!53403 () Bool)

(declare-fun e!115985 () Bool)

(assert (=> d!53403 e!115985))

(declare-fun res!83276 () Bool)

(assert (=> d!53403 (=> (not res!83276) (not e!115985))))

(declare-fun lt!86880 () ListLongMap!2177)

(assert (=> d!53403 (= res!83276 (contains!1169 lt!86880 (_1!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248)))))))

(declare-fun lt!86881 () List!2230)

(assert (=> d!53403 (= lt!86880 (ListLongMap!2178 lt!86881))))

(declare-fun lt!86883 () Unit!5363)

(declare-fun lt!86882 () Unit!5363)

(assert (=> d!53403 (= lt!86883 lt!86882)))

(assert (=> d!53403 (= (getValueByKey!188 lt!86881 (_1!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248)))))))

(assert (=> d!53403 (= lt!86882 (lemmaContainsTupThenGetReturnValue!102 lt!86881 (_1!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248)))))))

(assert (=> d!53403 (= lt!86881 (insertStrictlySorted!105 (toList!1104 lt!86777) (_1!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248)))))))

(assert (=> d!53403 (= (+!247 lt!86777 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))) lt!86880)))

(declare-fun b!175774 () Bool)

(declare-fun res!83277 () Bool)

(assert (=> b!175774 (=> (not res!83277) (not e!115985))))

(assert (=> b!175774 (= res!83277 (= (getValueByKey!188 (toList!1104 lt!86880) (_1!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))))))))

(declare-fun b!175775 () Bool)

(assert (=> b!175775 (= e!115985 (contains!1172 (toList!1104 lt!86880) (tuple2!3259 lt!86778 (minValue!3463 thiss!1248))))))

(assert (= (and d!53403 res!83276) b!175774))

(assert (= (and b!175774 res!83277) b!175775))

(declare-fun m!204167 () Bool)

(assert (=> d!53403 m!204167))

(declare-fun m!204169 () Bool)

(assert (=> d!53403 m!204169))

(declare-fun m!204171 () Bool)

(assert (=> d!53403 m!204171))

(declare-fun m!204173 () Bool)

(assert (=> d!53403 m!204173))

(declare-fun m!204175 () Bool)

(assert (=> b!175774 m!204175))

(declare-fun m!204177 () Bool)

(assert (=> b!175775 m!204177))

(assert (=> b!175615 d!53403))

(declare-fun d!53405 () Bool)

(assert (=> d!53405 (contains!1169 (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))) lt!86773)))

(declare-fun lt!86886 () Unit!5363)

(declare-fun choose!949 (ListLongMap!2177 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5363)

(assert (=> d!53405 (= lt!86886 (choose!949 lt!86785 lt!86770 (zeroValue!3463 thiss!1248) lt!86773))))

(assert (=> d!53405 (contains!1169 lt!86785 lt!86773)))

(assert (=> d!53405 (= (addStillContains!111 lt!86785 lt!86770 (zeroValue!3463 thiss!1248) lt!86773) lt!86886)))

(declare-fun bs!7228 () Bool)

(assert (= bs!7228 d!53405))

(assert (=> bs!7228 m!203987))

(assert (=> bs!7228 m!203987))

(assert (=> bs!7228 m!204009))

(declare-fun m!204179 () Bool)

(assert (=> bs!7228 m!204179))

(declare-fun m!204181 () Bool)

(assert (=> bs!7228 m!204181))

(assert (=> b!175615 d!53405))

(declare-fun d!53407 () Bool)

(assert (=> d!53407 (= (apply!135 (+!247 lt!86779 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))) lt!86791) (apply!135 lt!86779 lt!86791))))

(declare-fun lt!86887 () Unit!5363)

(assert (=> d!53407 (= lt!86887 (choose!948 lt!86779 lt!86771 (zeroValue!3463 thiss!1248) lt!86791))))

(declare-fun e!115986 () Bool)

(assert (=> d!53407 e!115986))

(declare-fun res!83278 () Bool)

(assert (=> d!53407 (=> (not res!83278) (not e!115986))))

(assert (=> d!53407 (= res!83278 (contains!1169 lt!86779 lt!86791))))

(assert (=> d!53407 (= (addApplyDifferent!111 lt!86779 lt!86771 (zeroValue!3463 thiss!1248) lt!86791) lt!86887)))

(declare-fun b!175777 () Bool)

(assert (=> b!175777 (= e!115986 (not (= lt!86791 lt!86771)))))

(assert (= (and d!53407 res!83278) b!175777))

(declare-fun m!204183 () Bool)

(assert (=> d!53407 m!204183))

(declare-fun m!204185 () Bool)

(assert (=> d!53407 m!204185))

(assert (=> d!53407 m!203989))

(assert (=> d!53407 m!203989))

(assert (=> d!53407 m!203991))

(assert (=> d!53407 m!203997))

(assert (=> b!175615 d!53407))

(declare-fun d!53409 () Bool)

(declare-fun e!115987 () Bool)

(assert (=> d!53409 e!115987))

(declare-fun res!83279 () Bool)

(assert (=> d!53409 (=> (not res!83279) (not e!115987))))

(declare-fun lt!86888 () ListLongMap!2177)

(assert (=> d!53409 (= res!83279 (contains!1169 lt!86888 (_1!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))))))

(declare-fun lt!86889 () List!2230)

(assert (=> d!53409 (= lt!86888 (ListLongMap!2178 lt!86889))))

(declare-fun lt!86891 () Unit!5363)

(declare-fun lt!86890 () Unit!5363)

(assert (=> d!53409 (= lt!86891 lt!86890)))

(assert (=> d!53409 (= (getValueByKey!188 lt!86889 (_1!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53409 (= lt!86890 (lemmaContainsTupThenGetReturnValue!102 lt!86889 (_1!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53409 (= lt!86889 (insertStrictlySorted!105 (toList!1104 lt!86785) (_1!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))) (_2!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53409 (= (+!247 lt!86785 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))) lt!86888)))

(declare-fun b!175778 () Bool)

(declare-fun res!83280 () Bool)

(assert (=> b!175778 (=> (not res!83280) (not e!115987))))

(assert (=> b!175778 (= res!83280 (= (getValueByKey!188 (toList!1104 lt!86888) (_1!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))))))))

(declare-fun b!175779 () Bool)

(assert (=> b!175779 (= e!115987 (contains!1172 (toList!1104 lt!86888) (tuple2!3259 lt!86770 (zeroValue!3463 thiss!1248))))))

(assert (= (and d!53409 res!83279) b!175778))

(assert (= (and b!175778 res!83280) b!175779))

(declare-fun m!204187 () Bool)

(assert (=> d!53409 m!204187))

(declare-fun m!204189 () Bool)

(assert (=> d!53409 m!204189))

(declare-fun m!204191 () Bool)

(assert (=> d!53409 m!204191))

(declare-fun m!204193 () Bool)

(assert (=> d!53409 m!204193))

(declare-fun m!204195 () Bool)

(assert (=> b!175778 m!204195))

(declare-fun m!204197 () Bool)

(assert (=> b!175779 m!204197))

(assert (=> b!175615 d!53409))

(declare-fun d!53411 () Bool)

(assert (=> d!53411 (= (apply!135 lt!86776 lt!86782) (get!1987 (getValueByKey!188 (toList!1104 lt!86776) lt!86782)))))

(declare-fun bs!7229 () Bool)

(assert (= bs!7229 d!53411))

(declare-fun m!204199 () Bool)

(assert (=> bs!7229 m!204199))

(assert (=> bs!7229 m!204199))

(declare-fun m!204201 () Bool)

(assert (=> bs!7229 m!204201))

(assert (=> b!175615 d!53411))

(declare-fun d!53413 () Bool)

(assert (=> d!53413 (= (apply!135 (+!247 lt!86776 (tuple2!3259 lt!86780 (minValue!3463 thiss!1248))) lt!86782) (apply!135 lt!86776 lt!86782))))

(declare-fun lt!86892 () Unit!5363)

(assert (=> d!53413 (= lt!86892 (choose!948 lt!86776 lt!86780 (minValue!3463 thiss!1248) lt!86782))))

(declare-fun e!115988 () Bool)

(assert (=> d!53413 e!115988))

(declare-fun res!83281 () Bool)

(assert (=> d!53413 (=> (not res!83281) (not e!115988))))

(assert (=> d!53413 (= res!83281 (contains!1169 lt!86776 lt!86782))))

(assert (=> d!53413 (= (addApplyDifferent!111 lt!86776 lt!86780 (minValue!3463 thiss!1248) lt!86782) lt!86892)))

(declare-fun b!175780 () Bool)

(assert (=> b!175780 (= e!115988 (not (= lt!86782 lt!86780)))))

(assert (= (and d!53413 res!83281) b!175780))

(declare-fun m!204203 () Bool)

(assert (=> d!53413 m!204203))

(declare-fun m!204205 () Bool)

(assert (=> d!53413 m!204205))

(assert (=> d!53413 m!203993))

(assert (=> d!53413 m!203993))

(assert (=> d!53413 m!204001))

(assert (=> d!53413 m!204005))

(assert (=> b!175615 d!53413))

(declare-fun d!53415 () Bool)

(assert (=> d!53415 (= (apply!135 (+!247 lt!86779 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248))) lt!86791) (get!1987 (getValueByKey!188 (toList!1104 (+!247 lt!86779 (tuple2!3259 lt!86771 (zeroValue!3463 thiss!1248)))) lt!86791)))))

(declare-fun bs!7230 () Bool)

(assert (= bs!7230 d!53415))

(declare-fun m!204207 () Bool)

(assert (=> bs!7230 m!204207))

(assert (=> bs!7230 m!204207))

(declare-fun m!204209 () Bool)

(assert (=> bs!7230 m!204209))

(assert (=> b!175615 d!53415))

(declare-fun d!53417 () Bool)

(assert (=> d!53417 (= (apply!135 lt!86779 lt!86791) (get!1987 (getValueByKey!188 (toList!1104 lt!86779) lt!86791)))))

(declare-fun bs!7231 () Bool)

(assert (= bs!7231 d!53417))

(declare-fun m!204211 () Bool)

(assert (=> bs!7231 m!204211))

(assert (=> bs!7231 m!204211))

(declare-fun m!204213 () Bool)

(assert (=> bs!7231 m!204213))

(assert (=> b!175615 d!53417))

(declare-fun d!53419 () Bool)

(declare-fun res!83286 () Bool)

(declare-fun e!115993 () Bool)

(assert (=> d!53419 (=> res!83286 e!115993)))

(assert (=> d!53419 (= res!83286 (and ((_ is Cons!2226) (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (= (_1!1640 (h!2845 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)))))

(assert (=> d!53419 (= (containsKey!192 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828) e!115993)))

(declare-fun b!175785 () Bool)

(declare-fun e!115994 () Bool)

(assert (=> b!175785 (= e!115993 e!115994)))

(declare-fun res!83287 () Bool)

(assert (=> b!175785 (=> (not res!83287) (not e!115994))))

(assert (=> b!175785 (= res!83287 (and (or (not ((_ is Cons!2226) (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) (bvsle (_1!1640 (h!2845 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)) ((_ is Cons!2226) (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (bvslt (_1!1640 (h!2845 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)))))

(declare-fun b!175786 () Bool)

(assert (=> b!175786 (= e!115994 (containsKey!192 (t!7041 (toList!1104 (getCurrentListMap!740 (_keys!5474 thiss!1248) (_values!3605 thiss!1248) (mask!8522 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) key!828))))

(assert (= (and d!53419 (not res!83286)) b!175785))

(assert (= (and b!175785 res!83287) b!175786))

(declare-fun m!204215 () Bool)

(assert (=> b!175786 m!204215))

(assert (=> d!53351 d!53419))

(declare-fun b!175795 () Bool)

(declare-fun e!116003 () Bool)

(declare-fun e!116001 () Bool)

(assert (=> b!175795 (= e!116003 e!116001)))

(declare-fun c!31510 () Bool)

(assert (=> b!175795 (= c!31510 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175796 () Bool)

(declare-fun call!17785 () Bool)

(assert (=> b!175796 (= e!116001 call!17785)))

(declare-fun d!53421 () Bool)

(declare-fun res!83293 () Bool)

(assert (=> d!53421 (=> res!83293 e!116003)))

(assert (=> d!53421 (= res!83293 (bvsge #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(assert (=> d!53421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5474 thiss!1248) (mask!8522 thiss!1248)) e!116003)))

(declare-fun b!175797 () Bool)

(declare-fun e!116002 () Bool)

(assert (=> b!175797 (= e!116002 call!17785)))

(declare-fun b!175798 () Bool)

(assert (=> b!175798 (= e!116001 e!116002)))

(declare-fun lt!86900 () (_ BitVec 64))

(assert (=> b!175798 (= lt!86900 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86901 () Unit!5363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7343 (_ BitVec 64) (_ BitVec 32)) Unit!5363)

(assert (=> b!175798 (= lt!86901 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5474 thiss!1248) lt!86900 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!175798 (arrayContainsKey!0 (_keys!5474 thiss!1248) lt!86900 #b00000000000000000000000000000000)))

(declare-fun lt!86899 () Unit!5363)

(assert (=> b!175798 (= lt!86899 lt!86901)))

(declare-fun res!83292 () Bool)

(assert (=> b!175798 (= res!83292 (= (seekEntryOrOpen!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000) (_keys!5474 thiss!1248) (mask!8522 thiss!1248)) (Found!562 #b00000000000000000000000000000000)))))

(assert (=> b!175798 (=> (not res!83292) (not e!116002))))

(declare-fun bm!17782 () Bool)

(assert (=> bm!17782 (= call!17785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5474 thiss!1248) (mask!8522 thiss!1248)))))

(assert (= (and d!53421 (not res!83293)) b!175795))

(assert (= (and b!175795 c!31510) b!175798))

(assert (= (and b!175795 (not c!31510)) b!175796))

(assert (= (and b!175798 res!83292) b!175797))

(assert (= (or b!175797 b!175796) bm!17782))

(assert (=> b!175795 m!203963))

(assert (=> b!175795 m!203963))

(assert (=> b!175795 m!203965))

(assert (=> b!175798 m!203963))

(declare-fun m!204217 () Bool)

(assert (=> b!175798 m!204217))

(declare-fun m!204219 () Bool)

(assert (=> b!175798 m!204219))

(assert (=> b!175798 m!203963))

(declare-fun m!204221 () Bool)

(assert (=> b!175798 m!204221))

(declare-fun m!204223 () Bool)

(assert (=> bm!17782 m!204223))

(assert (=> b!175542 d!53421))

(declare-fun b!175809 () Bool)

(declare-fun e!116014 () Bool)

(declare-fun e!116013 () Bool)

(assert (=> b!175809 (= e!116014 e!116013)))

(declare-fun res!83301 () Bool)

(assert (=> b!175809 (=> (not res!83301) (not e!116013))))

(declare-fun e!116012 () Bool)

(assert (=> b!175809 (= res!83301 (not e!116012))))

(declare-fun res!83300 () Bool)

(assert (=> b!175809 (=> (not res!83300) (not e!116012))))

(assert (=> b!175809 (= res!83300 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175810 () Bool)

(declare-fun contains!1173 (List!2233 (_ BitVec 64)) Bool)

(assert (=> b!175810 (= e!116012 (contains!1173 Nil!2230 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175811 () Bool)

(declare-fun e!116015 () Bool)

(declare-fun call!17788 () Bool)

(assert (=> b!175811 (= e!116015 call!17788)))

(declare-fun b!175812 () Bool)

(assert (=> b!175812 (= e!116013 e!116015)))

(declare-fun c!31513 () Bool)

(assert (=> b!175812 (= c!31513 (validKeyInArray!0 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175813 () Bool)

(assert (=> b!175813 (= e!116015 call!17788)))

(declare-fun d!53423 () Bool)

(declare-fun res!83302 () Bool)

(assert (=> d!53423 (=> res!83302 e!116014)))

(assert (=> d!53423 (= res!83302 (bvsge #b00000000000000000000000000000000 (size!3787 (_keys!5474 thiss!1248))))))

(assert (=> d!53423 (= (arrayNoDuplicates!0 (_keys!5474 thiss!1248) #b00000000000000000000000000000000 Nil!2230) e!116014)))

(declare-fun bm!17785 () Bool)

(assert (=> bm!17785 (= call!17788 (arrayNoDuplicates!0 (_keys!5474 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31513 (Cons!2229 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000) Nil!2230) Nil!2230)))))

(assert (= (and d!53423 (not res!83302)) b!175809))

(assert (= (and b!175809 res!83300) b!175810))

(assert (= (and b!175809 res!83301) b!175812))

(assert (= (and b!175812 c!31513) b!175811))

(assert (= (and b!175812 (not c!31513)) b!175813))

(assert (= (or b!175811 b!175813) bm!17785))

(assert (=> b!175809 m!203963))

(assert (=> b!175809 m!203963))

(assert (=> b!175809 m!203965))

(assert (=> b!175810 m!203963))

(assert (=> b!175810 m!203963))

(declare-fun m!204225 () Bool)

(assert (=> b!175810 m!204225))

(assert (=> b!175812 m!203963))

(assert (=> b!175812 m!203963))

(assert (=> b!175812 m!203965))

(assert (=> bm!17785 m!203963))

(declare-fun m!204227 () Bool)

(assert (=> bm!17785 m!204227))

(assert (=> b!175543 d!53423))

(assert (=> bm!17769 d!53389))

(declare-fun d!53425 () Bool)

(assert (=> d!53425 (= (apply!135 lt!86790 (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000)) (get!1987 (getValueByKey!188 (toList!1104 lt!86790) (select (arr!3484 (_keys!5474 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7232 () Bool)

(assert (= bs!7232 d!53425))

(assert (=> bs!7232 m!203963))

(assert (=> bs!7232 m!204033))

(assert (=> bs!7232 m!204033))

(declare-fun m!204229 () Bool)

(assert (=> bs!7232 m!204229))

(assert (=> b!175614 d!53425))

(declare-fun d!53427 () Bool)

(declare-fun c!31516 () Bool)

(assert (=> d!53427 (= c!31516 ((_ is ValueCellFull!1712) (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!116018 () V!5129)

(assert (=> d!53427 (= (get!1986 (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!469 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!116018)))

(declare-fun b!175818 () Bool)

(declare-fun get!1988 (ValueCell!1712 V!5129) V!5129)

(assert (=> b!175818 (= e!116018 (get!1988 (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!469 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175819 () Bool)

(declare-fun get!1989 (ValueCell!1712 V!5129) V!5129)

(assert (=> b!175819 (= e!116018 (get!1989 (select (arr!3485 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!469 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53427 c!31516) b!175818))

(assert (= (and d!53427 (not c!31516)) b!175819))

(assert (=> b!175818 m!203971))

(assert (=> b!175818 m!203973))

(declare-fun m!204231 () Bool)

(assert (=> b!175818 m!204231))

(assert (=> b!175819 m!203971))

(assert (=> b!175819 m!203973))

(declare-fun m!204233 () Bool)

(assert (=> b!175819 m!204233))

(assert (=> b!175614 d!53427))

(declare-fun condMapEmpty!7022 () Bool)

(declare-fun mapDefault!7022 () ValueCell!1712)

(assert (=> mapNonEmpty!7021 (= condMapEmpty!7022 (= mapRest!7021 ((as const (Array (_ BitVec 32) ValueCell!1712)) mapDefault!7022)))))

(declare-fun e!116019 () Bool)

(declare-fun mapRes!7022 () Bool)

(assert (=> mapNonEmpty!7021 (= tp!15715 (and e!116019 mapRes!7022))))

(declare-fun mapNonEmpty!7022 () Bool)

(declare-fun tp!15716 () Bool)

(declare-fun e!116020 () Bool)

(assert (=> mapNonEmpty!7022 (= mapRes!7022 (and tp!15716 e!116020))))

(declare-fun mapRest!7022 () (Array (_ BitVec 32) ValueCell!1712))

(declare-fun mapValue!7022 () ValueCell!1712)

(declare-fun mapKey!7022 () (_ BitVec 32))

(assert (=> mapNonEmpty!7022 (= mapRest!7021 (store mapRest!7022 mapKey!7022 mapValue!7022))))

(declare-fun b!175821 () Bool)

(assert (=> b!175821 (= e!116019 tp_is_empty!4111)))

(declare-fun b!175820 () Bool)

(assert (=> b!175820 (= e!116020 tp_is_empty!4111)))

(declare-fun mapIsEmpty!7022 () Bool)

(assert (=> mapIsEmpty!7022 mapRes!7022))

(assert (= (and mapNonEmpty!7021 condMapEmpty!7022) mapIsEmpty!7022))

(assert (= (and mapNonEmpty!7021 (not condMapEmpty!7022)) mapNonEmpty!7022))

(assert (= (and mapNonEmpty!7022 ((_ is ValueCellFull!1712) mapValue!7022)) b!175820))

(assert (= (and mapNonEmpty!7021 ((_ is ValueCellFull!1712) mapDefault!7022)) b!175821))

(declare-fun m!204235 () Bool)

(assert (=> mapNonEmpty!7022 m!204235))

(declare-fun b_lambda!7005 () Bool)

(assert (= b_lambda!7003 (or (and b!175459 b_free!4339) b_lambda!7005)))

(declare-fun b_lambda!7007 () Bool)

(assert (= b_lambda!7001 (or (and b!175459 b_free!4339) b_lambda!7007)))

(check-sat (not b!175723) (not b!175809) (not d!53415) (not d!53357) (not b!175819) (not mapNonEmpty!7022) (not b!175695) (not b!175753) (not d!53399) (not d!53425) (not b!175795) (not b!175763) (not d!53371) (not b!175635) (not b!175759) (not b!175761) (not d!53387) (not b!175751) (not b!175756) (not d!53417) (not b!175662) (not b!175812) (not d!53389) (not d!53363) (not d!53405) (not bm!17779) (not b!175722) (not b!175810) (not b_lambda!7005) (not d!53411) (not b!175798) (not d!53385) (not b!175724) (not b!175665) (not d!53373) (not d!53367) (not d!53369) (not d!53379) (not d!53393) (not bm!17785) (not b!175765) (not b!175786) b_and!10805 (not b!175772) (not b!175755) (not b!175767) (not b!175715) (not b!175775) (not b!175773) (not d!53397) tp_is_empty!4111 (not b!175764) (not d!53391) (not d!53381) (not b!175778) (not b!175716) (not d!53403) (not b!175667) (not d!53409) (not b!175708) (not b!175714) (not b_next!4339) (not b!175726) (not b!175774) (not d!53413) (not b!175762) (not bm!17776) (not b_lambda!6999) (not d!53377) (not d!53365) (not b_lambda!7007) (not d!53401) (not b!175696) (not b!175718) (not b!175818) (not bm!17782) (not b!175752) (not d!53407) (not b!175721) (not d!53395) (not d!53383) (not b!175779) (not b!175684))
(check-sat b_and!10805 (not b_next!4339))

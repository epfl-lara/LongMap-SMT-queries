; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21552 () Bool)

(assert start!21552)

(declare-fun b!215879 () Bool)

(declare-fun b_free!5737 () Bool)

(declare-fun b_next!5737 () Bool)

(assert (=> b!215879 (= b_free!5737 (not b_next!5737))))

(declare-fun tp!20336 () Bool)

(declare-fun b_and!12601 () Bool)

(assert (=> b!215879 (= tp!20336 b_and!12601)))

(declare-fun mapIsEmpty!9552 () Bool)

(declare-fun mapRes!9552 () Bool)

(assert (=> mapIsEmpty!9552 mapRes!9552))

(declare-fun b!215877 () Bool)

(declare-fun e!140442 () Bool)

(declare-fun tp_is_empty!5599 () Bool)

(assert (=> b!215877 (= e!140442 tp_is_empty!5599)))

(declare-fun b!215878 () Bool)

(declare-fun res!105532 () Bool)

(declare-fun e!140443 () Bool)

(assert (=> b!215878 (=> (not res!105532) (not e!140443))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215878 (= res!105532 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!140441 () Bool)

(declare-datatypes ((V!7113 0))(
  ( (V!7114 (val!2844 Int)) )
))
(declare-datatypes ((ValueCell!2456 0))(
  ( (ValueCellFull!2456 (v!4856 V!7113)) (EmptyCell!2456) )
))
(declare-datatypes ((array!10423 0))(
  ( (array!10424 (arr!4935 (Array (_ BitVec 32) ValueCell!2456)) (size!5268 (_ BitVec 32))) )
))
(declare-datatypes ((array!10425 0))(
  ( (array!10426 (arr!4936 (Array (_ BitVec 32) (_ BitVec 64))) (size!5269 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2812 0))(
  ( (LongMapFixedSize!2813 (defaultEntry!4056 Int) (mask!9777 (_ BitVec 32)) (extraKeys!3793 (_ BitVec 32)) (zeroValue!3897 V!7113) (minValue!3897 V!7113) (_size!1455 (_ BitVec 32)) (_keys!6098 array!10425) (_values!4039 array!10423) (_vacant!1455 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2812)

(declare-fun e!140445 () Bool)

(declare-fun array_inv!3243 (array!10425) Bool)

(declare-fun array_inv!3244 (array!10423) Bool)

(assert (=> b!215879 (= e!140441 (and tp!20336 tp_is_empty!5599 (array_inv!3243 (_keys!6098 thiss!1504)) (array_inv!3244 (_values!4039 thiss!1504)) e!140445))))

(declare-fun mapNonEmpty!9552 () Bool)

(declare-fun tp!20337 () Bool)

(assert (=> mapNonEmpty!9552 (= mapRes!9552 (and tp!20337 e!140442))))

(declare-fun mapKey!9552 () (_ BitVec 32))

(declare-fun mapRest!9552 () (Array (_ BitVec 32) ValueCell!2456))

(declare-fun mapValue!9552 () ValueCell!2456)

(assert (=> mapNonEmpty!9552 (= (arr!4935 (_values!4039 thiss!1504)) (store mapRest!9552 mapKey!9552 mapValue!9552))))

(declare-fun b!215880 () Bool)

(declare-fun e!140447 () Bool)

(assert (=> b!215880 (= e!140443 e!140447)))

(declare-fun res!105528 () Bool)

(assert (=> b!215880 (=> (not res!105528) (not e!140447))))

(declare-datatypes ((SeekEntryResult!734 0))(
  ( (MissingZero!734 (index!5106 (_ BitVec 32))) (Found!734 (index!5107 (_ BitVec 32))) (Intermediate!734 (undefined!1546 Bool) (index!5108 (_ BitVec 32)) (x!22581 (_ BitVec 32))) (Undefined!734) (MissingVacant!734 (index!5109 (_ BitVec 32))) )
))
(declare-fun lt!110906 () SeekEntryResult!734)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215880 (= res!105528 (or (= lt!110906 (MissingZero!734 index!297)) (= lt!110906 (MissingVacant!734 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10425 (_ BitVec 32)) SeekEntryResult!734)

(assert (=> b!215880 (= lt!110906 (seekEntryOrOpen!0 key!932 (_keys!6098 thiss!1504) (mask!9777 thiss!1504)))))

(declare-fun b!215881 () Bool)

(declare-fun e!140446 () Bool)

(assert (=> b!215881 (= e!140445 (and e!140446 mapRes!9552))))

(declare-fun condMapEmpty!9552 () Bool)

(declare-fun mapDefault!9552 () ValueCell!2456)

(assert (=> b!215881 (= condMapEmpty!9552 (= (arr!4935 (_values!4039 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2456)) mapDefault!9552)))))

(declare-fun res!105531 () Bool)

(assert (=> start!21552 (=> (not res!105531) (not e!140443))))

(declare-fun valid!1162 (LongMapFixedSize!2812) Bool)

(assert (=> start!21552 (= res!105531 (valid!1162 thiss!1504))))

(assert (=> start!21552 e!140443))

(assert (=> start!21552 e!140441))

(assert (=> start!21552 true))

(declare-fun b!215882 () Bool)

(assert (=> b!215882 (= e!140446 tp_is_empty!5599)))

(declare-fun b!215883 () Bool)

(declare-fun res!105529 () Bool)

(assert (=> b!215883 (=> (not res!105529) (not e!140447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215883 (= res!105529 (validMask!0 (mask!9777 thiss!1504)))))

(declare-fun b!215884 () Bool)

(declare-fun res!105530 () Bool)

(assert (=> b!215884 (=> (not res!105530) (not e!140447))))

(assert (=> b!215884 (= res!105530 (and (= (size!5268 (_values!4039 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9777 thiss!1504))) (= (size!5269 (_keys!6098 thiss!1504)) (size!5268 (_values!4039 thiss!1504))) (bvsge (mask!9777 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3793 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3793 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!215885 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10425 (_ BitVec 32)) Bool)

(assert (=> b!215885 (= e!140447 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6098 thiss!1504) (mask!9777 thiss!1504))))))

(assert (= (and start!21552 res!105531) b!215878))

(assert (= (and b!215878 res!105532) b!215880))

(assert (= (and b!215880 res!105528) b!215883))

(assert (= (and b!215883 res!105529) b!215884))

(assert (= (and b!215884 res!105530) b!215885))

(assert (= (and b!215881 condMapEmpty!9552) mapIsEmpty!9552))

(assert (= (and b!215881 (not condMapEmpty!9552)) mapNonEmpty!9552))

(get-info :version)

(assert (= (and mapNonEmpty!9552 ((_ is ValueCellFull!2456) mapValue!9552)) b!215877))

(assert (= (and b!215881 ((_ is ValueCellFull!2456) mapDefault!9552)) b!215882))

(assert (= b!215879 b!215881))

(assert (= start!21552 b!215879))

(declare-fun m!242309 () Bool)

(assert (=> mapNonEmpty!9552 m!242309))

(declare-fun m!242311 () Bool)

(assert (=> b!215880 m!242311))

(declare-fun m!242313 () Bool)

(assert (=> b!215879 m!242313))

(declare-fun m!242315 () Bool)

(assert (=> b!215879 m!242315))

(declare-fun m!242317 () Bool)

(assert (=> b!215885 m!242317))

(declare-fun m!242319 () Bool)

(assert (=> start!21552 m!242319))

(declare-fun m!242321 () Bool)

(assert (=> b!215883 m!242321))

(check-sat (not start!21552) (not b!215883) (not b_next!5737) b_and!12601 (not b!215879) (not mapNonEmpty!9552) tp_is_empty!5599 (not b!215885) (not b!215880))
(check-sat b_and!12601 (not b_next!5737))
(get-model)

(declare-fun d!58363 () Bool)

(declare-fun res!105569 () Bool)

(declare-fun e!140492 () Bool)

(assert (=> d!58363 (=> (not res!105569) (not e!140492))))

(declare-fun simpleValid!221 (LongMapFixedSize!2812) Bool)

(assert (=> d!58363 (= res!105569 (simpleValid!221 thiss!1504))))

(assert (=> d!58363 (= (valid!1162 thiss!1504) e!140492)))

(declare-fun b!215946 () Bool)

(declare-fun res!105570 () Bool)

(assert (=> b!215946 (=> (not res!105570) (not e!140492))))

(declare-fun arrayCountValidKeys!0 (array!10425 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215946 (= res!105570 (= (arrayCountValidKeys!0 (_keys!6098 thiss!1504) #b00000000000000000000000000000000 (size!5269 (_keys!6098 thiss!1504))) (_size!1455 thiss!1504)))))

(declare-fun b!215947 () Bool)

(declare-fun res!105571 () Bool)

(assert (=> b!215947 (=> (not res!105571) (not e!140492))))

(assert (=> b!215947 (= res!105571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6098 thiss!1504) (mask!9777 thiss!1504)))))

(declare-fun b!215948 () Bool)

(declare-datatypes ((List!3127 0))(
  ( (Nil!3124) (Cons!3123 (h!3770 (_ BitVec 64)) (t!8073 List!3127)) )
))
(declare-fun arrayNoDuplicates!0 (array!10425 (_ BitVec 32) List!3127) Bool)

(assert (=> b!215948 (= e!140492 (arrayNoDuplicates!0 (_keys!6098 thiss!1504) #b00000000000000000000000000000000 Nil!3124))))

(assert (= (and d!58363 res!105569) b!215946))

(assert (= (and b!215946 res!105570) b!215947))

(assert (= (and b!215947 res!105571) b!215948))

(declare-fun m!242351 () Bool)

(assert (=> d!58363 m!242351))

(declare-fun m!242353 () Bool)

(assert (=> b!215946 m!242353))

(assert (=> b!215947 m!242317))

(declare-fun m!242355 () Bool)

(assert (=> b!215948 m!242355))

(assert (=> start!21552 d!58363))

(declare-fun d!58365 () Bool)

(assert (=> d!58365 (= (validMask!0 (mask!9777 thiss!1504)) (and (or (= (mask!9777 thiss!1504) #b00000000000000000000000000000111) (= (mask!9777 thiss!1504) #b00000000000000000000000000001111) (= (mask!9777 thiss!1504) #b00000000000000000000000000011111) (= (mask!9777 thiss!1504) #b00000000000000000000000000111111) (= (mask!9777 thiss!1504) #b00000000000000000000000001111111) (= (mask!9777 thiss!1504) #b00000000000000000000000011111111) (= (mask!9777 thiss!1504) #b00000000000000000000000111111111) (= (mask!9777 thiss!1504) #b00000000000000000000001111111111) (= (mask!9777 thiss!1504) #b00000000000000000000011111111111) (= (mask!9777 thiss!1504) #b00000000000000000000111111111111) (= (mask!9777 thiss!1504) #b00000000000000000001111111111111) (= (mask!9777 thiss!1504) #b00000000000000000011111111111111) (= (mask!9777 thiss!1504) #b00000000000000000111111111111111) (= (mask!9777 thiss!1504) #b00000000000000001111111111111111) (= (mask!9777 thiss!1504) #b00000000000000011111111111111111) (= (mask!9777 thiss!1504) #b00000000000000111111111111111111) (= (mask!9777 thiss!1504) #b00000000000001111111111111111111) (= (mask!9777 thiss!1504) #b00000000000011111111111111111111) (= (mask!9777 thiss!1504) #b00000000000111111111111111111111) (= (mask!9777 thiss!1504) #b00000000001111111111111111111111) (= (mask!9777 thiss!1504) #b00000000011111111111111111111111) (= (mask!9777 thiss!1504) #b00000000111111111111111111111111) (= (mask!9777 thiss!1504) #b00000001111111111111111111111111) (= (mask!9777 thiss!1504) #b00000011111111111111111111111111) (= (mask!9777 thiss!1504) #b00000111111111111111111111111111) (= (mask!9777 thiss!1504) #b00001111111111111111111111111111) (= (mask!9777 thiss!1504) #b00011111111111111111111111111111) (= (mask!9777 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9777 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215883 d!58365))

(declare-fun d!58367 () Bool)

(assert (=> d!58367 (= (array_inv!3243 (_keys!6098 thiss!1504)) (bvsge (size!5269 (_keys!6098 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215879 d!58367))

(declare-fun d!58369 () Bool)

(assert (=> d!58369 (= (array_inv!3244 (_values!4039 thiss!1504)) (bvsge (size!5268 (_values!4039 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215879 d!58369))

(declare-fun b!215957 () Bool)

(declare-fun e!140499 () Bool)

(declare-fun e!140501 () Bool)

(assert (=> b!215957 (= e!140499 e!140501)))

(declare-fun lt!110920 () (_ BitVec 64))

(assert (=> b!215957 (= lt!110920 (select (arr!4936 (_keys!6098 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6460 0))(
  ( (Unit!6461) )
))
(declare-fun lt!110919 () Unit!6460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10425 (_ BitVec 64) (_ BitVec 32)) Unit!6460)

(assert (=> b!215957 (= lt!110919 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6098 thiss!1504) lt!110920 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215957 (arrayContainsKey!0 (_keys!6098 thiss!1504) lt!110920 #b00000000000000000000000000000000)))

(declare-fun lt!110921 () Unit!6460)

(assert (=> b!215957 (= lt!110921 lt!110919)))

(declare-fun res!105577 () Bool)

(assert (=> b!215957 (= res!105577 (= (seekEntryOrOpen!0 (select (arr!4936 (_keys!6098 thiss!1504)) #b00000000000000000000000000000000) (_keys!6098 thiss!1504) (mask!9777 thiss!1504)) (Found!734 #b00000000000000000000000000000000)))))

(assert (=> b!215957 (=> (not res!105577) (not e!140501))))

(declare-fun d!58371 () Bool)

(declare-fun res!105576 () Bool)

(declare-fun e!140500 () Bool)

(assert (=> d!58371 (=> res!105576 e!140500)))

(assert (=> d!58371 (= res!105576 (bvsge #b00000000000000000000000000000000 (size!5269 (_keys!6098 thiss!1504))))))

(assert (=> d!58371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6098 thiss!1504) (mask!9777 thiss!1504)) e!140500)))

(declare-fun b!215958 () Bool)

(declare-fun call!20346 () Bool)

(assert (=> b!215958 (= e!140501 call!20346)))

(declare-fun b!215959 () Bool)

(assert (=> b!215959 (= e!140500 e!140499)))

(declare-fun c!36264 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215959 (= c!36264 (validKeyInArray!0 (select (arr!4936 (_keys!6098 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215960 () Bool)

(assert (=> b!215960 (= e!140499 call!20346)))

(declare-fun bm!20343 () Bool)

(assert (=> bm!20343 (= call!20346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6098 thiss!1504) (mask!9777 thiss!1504)))))

(assert (= (and d!58371 (not res!105576)) b!215959))

(assert (= (and b!215959 c!36264) b!215957))

(assert (= (and b!215959 (not c!36264)) b!215960))

(assert (= (and b!215957 res!105577) b!215958))

(assert (= (or b!215958 b!215960) bm!20343))

(declare-fun m!242357 () Bool)

(assert (=> b!215957 m!242357))

(declare-fun m!242359 () Bool)

(assert (=> b!215957 m!242359))

(declare-fun m!242361 () Bool)

(assert (=> b!215957 m!242361))

(assert (=> b!215957 m!242357))

(declare-fun m!242363 () Bool)

(assert (=> b!215957 m!242363))

(assert (=> b!215959 m!242357))

(assert (=> b!215959 m!242357))

(declare-fun m!242365 () Bool)

(assert (=> b!215959 m!242365))

(declare-fun m!242367 () Bool)

(assert (=> bm!20343 m!242367))

(assert (=> b!215885 d!58371))

(declare-fun b!215973 () Bool)

(declare-fun c!36272 () Bool)

(declare-fun lt!110929 () (_ BitVec 64))

(assert (=> b!215973 (= c!36272 (= lt!110929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140509 () SeekEntryResult!734)

(declare-fun e!140510 () SeekEntryResult!734)

(assert (=> b!215973 (= e!140509 e!140510)))

(declare-fun b!215974 () Bool)

(declare-fun lt!110928 () SeekEntryResult!734)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10425 (_ BitVec 32)) SeekEntryResult!734)

(assert (=> b!215974 (= e!140510 (seekKeyOrZeroReturnVacant!0 (x!22581 lt!110928) (index!5108 lt!110928) (index!5108 lt!110928) key!932 (_keys!6098 thiss!1504) (mask!9777 thiss!1504)))))

(declare-fun d!58373 () Bool)

(declare-fun lt!110930 () SeekEntryResult!734)

(assert (=> d!58373 (and (or ((_ is Undefined!734) lt!110930) (not ((_ is Found!734) lt!110930)) (and (bvsge (index!5107 lt!110930) #b00000000000000000000000000000000) (bvslt (index!5107 lt!110930) (size!5269 (_keys!6098 thiss!1504))))) (or ((_ is Undefined!734) lt!110930) ((_ is Found!734) lt!110930) (not ((_ is MissingZero!734) lt!110930)) (and (bvsge (index!5106 lt!110930) #b00000000000000000000000000000000) (bvslt (index!5106 lt!110930) (size!5269 (_keys!6098 thiss!1504))))) (or ((_ is Undefined!734) lt!110930) ((_ is Found!734) lt!110930) ((_ is MissingZero!734) lt!110930) (not ((_ is MissingVacant!734) lt!110930)) (and (bvsge (index!5109 lt!110930) #b00000000000000000000000000000000) (bvslt (index!5109 lt!110930) (size!5269 (_keys!6098 thiss!1504))))) (or ((_ is Undefined!734) lt!110930) (ite ((_ is Found!734) lt!110930) (= (select (arr!4936 (_keys!6098 thiss!1504)) (index!5107 lt!110930)) key!932) (ite ((_ is MissingZero!734) lt!110930) (= (select (arr!4936 (_keys!6098 thiss!1504)) (index!5106 lt!110930)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!734) lt!110930) (= (select (arr!4936 (_keys!6098 thiss!1504)) (index!5109 lt!110930)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140508 () SeekEntryResult!734)

(assert (=> d!58373 (= lt!110930 e!140508)))

(declare-fun c!36271 () Bool)

(assert (=> d!58373 (= c!36271 (and ((_ is Intermediate!734) lt!110928) (undefined!1546 lt!110928)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10425 (_ BitVec 32)) SeekEntryResult!734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58373 (= lt!110928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9777 thiss!1504)) key!932 (_keys!6098 thiss!1504) (mask!9777 thiss!1504)))))

(assert (=> d!58373 (validMask!0 (mask!9777 thiss!1504))))

(assert (=> d!58373 (= (seekEntryOrOpen!0 key!932 (_keys!6098 thiss!1504) (mask!9777 thiss!1504)) lt!110930)))

(declare-fun b!215975 () Bool)

(assert (=> b!215975 (= e!140509 (Found!734 (index!5108 lt!110928)))))

(declare-fun b!215976 () Bool)

(assert (=> b!215976 (= e!140510 (MissingZero!734 (index!5108 lt!110928)))))

(declare-fun b!215977 () Bool)

(assert (=> b!215977 (= e!140508 e!140509)))

(assert (=> b!215977 (= lt!110929 (select (arr!4936 (_keys!6098 thiss!1504)) (index!5108 lt!110928)))))

(declare-fun c!36273 () Bool)

(assert (=> b!215977 (= c!36273 (= lt!110929 key!932))))

(declare-fun b!215978 () Bool)

(assert (=> b!215978 (= e!140508 Undefined!734)))

(assert (= (and d!58373 c!36271) b!215978))

(assert (= (and d!58373 (not c!36271)) b!215977))

(assert (= (and b!215977 c!36273) b!215975))

(assert (= (and b!215977 (not c!36273)) b!215973))

(assert (= (and b!215973 c!36272) b!215976))

(assert (= (and b!215973 (not c!36272)) b!215974))

(declare-fun m!242369 () Bool)

(assert (=> b!215974 m!242369))

(declare-fun m!242371 () Bool)

(assert (=> d!58373 m!242371))

(assert (=> d!58373 m!242321))

(declare-fun m!242373 () Bool)

(assert (=> d!58373 m!242373))

(declare-fun m!242375 () Bool)

(assert (=> d!58373 m!242375))

(assert (=> d!58373 m!242373))

(declare-fun m!242377 () Bool)

(assert (=> d!58373 m!242377))

(declare-fun m!242379 () Bool)

(assert (=> d!58373 m!242379))

(declare-fun m!242381 () Bool)

(assert (=> b!215977 m!242381))

(assert (=> b!215880 d!58373))

(declare-fun condMapEmpty!9561 () Bool)

(declare-fun mapDefault!9561 () ValueCell!2456)

(assert (=> mapNonEmpty!9552 (= condMapEmpty!9561 (= mapRest!9552 ((as const (Array (_ BitVec 32) ValueCell!2456)) mapDefault!9561)))))

(declare-fun e!140516 () Bool)

(declare-fun mapRes!9561 () Bool)

(assert (=> mapNonEmpty!9552 (= tp!20337 (and e!140516 mapRes!9561))))

(declare-fun mapIsEmpty!9561 () Bool)

(assert (=> mapIsEmpty!9561 mapRes!9561))

(declare-fun b!215985 () Bool)

(declare-fun e!140515 () Bool)

(assert (=> b!215985 (= e!140515 tp_is_empty!5599)))

(declare-fun mapNonEmpty!9561 () Bool)

(declare-fun tp!20352 () Bool)

(assert (=> mapNonEmpty!9561 (= mapRes!9561 (and tp!20352 e!140515))))

(declare-fun mapRest!9561 () (Array (_ BitVec 32) ValueCell!2456))

(declare-fun mapKey!9561 () (_ BitVec 32))

(declare-fun mapValue!9561 () ValueCell!2456)

(assert (=> mapNonEmpty!9561 (= mapRest!9552 (store mapRest!9561 mapKey!9561 mapValue!9561))))

(declare-fun b!215986 () Bool)

(assert (=> b!215986 (= e!140516 tp_is_empty!5599)))

(assert (= (and mapNonEmpty!9552 condMapEmpty!9561) mapIsEmpty!9561))

(assert (= (and mapNonEmpty!9552 (not condMapEmpty!9561)) mapNonEmpty!9561))

(assert (= (and mapNonEmpty!9561 ((_ is ValueCellFull!2456) mapValue!9561)) b!215985))

(assert (= (and mapNonEmpty!9552 ((_ is ValueCellFull!2456) mapDefault!9561)) b!215986))

(declare-fun m!242383 () Bool)

(assert (=> mapNonEmpty!9561 m!242383))

(check-sat (not b_next!5737) b_and!12601 (not d!58373) (not b!215959) (not b!215957) (not bm!20343) (not b!215974) (not d!58363) tp_is_empty!5599 (not mapNonEmpty!9561) (not b!215948) (not b!215947) (not b!215946))
(check-sat b_and!12601 (not b_next!5737))

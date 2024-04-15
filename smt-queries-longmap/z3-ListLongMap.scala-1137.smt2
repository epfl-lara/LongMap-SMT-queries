; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23490 () Bool)

(assert start!23490)

(declare-fun b!246513 () Bool)

(declare-fun b_free!6571 () Bool)

(declare-fun b_next!6571 () Bool)

(assert (=> b!246513 (= b_free!6571 (not b_next!6571))))

(declare-fun tp!22955 () Bool)

(declare-fun b_and!13543 () Bool)

(assert (=> b!246513 (= tp!22955 b_and!13543)))

(declare-fun b!246499 () Bool)

(declare-fun e!159907 () Bool)

(declare-fun e!159909 () Bool)

(assert (=> b!246499 (= e!159907 e!159909)))

(declare-fun res!120839 () Bool)

(assert (=> b!246499 (=> (not res!120839) (not e!159909))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8225 0))(
  ( (V!8226 (val!3261 Int)) )
))
(declare-datatypes ((ValueCell!2873 0))(
  ( (ValueCellFull!2873 (v!5311 V!8225)) (EmptyCell!2873) )
))
(declare-datatypes ((array!12161 0))(
  ( (array!12162 (arr!5769 (Array (_ BitVec 32) ValueCell!2873)) (size!6113 (_ BitVec 32))) )
))
(declare-datatypes ((array!12163 0))(
  ( (array!12164 (arr!5770 (Array (_ BitVec 32) (_ BitVec 64))) (size!6114 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3646 0))(
  ( (LongMapFixedSize!3647 (defaultEntry!4564 Int) (mask!10691 (_ BitVec 32)) (extraKeys!4301 (_ BitVec 32)) (zeroValue!4405 V!8225) (minValue!4405 V!8225) (_size!1872 (_ BitVec 32)) (_keys!6683 array!12163) (_values!4547 array!12161) (_vacant!1872 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3646)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246499 (= res!120839 (inRange!0 index!297 (mask!10691 thiss!1504)))))

(declare-datatypes ((Unit!7606 0))(
  ( (Unit!7607) )
))
(declare-fun lt!123359 () Unit!7606)

(declare-fun e!159911 () Unit!7606)

(assert (=> b!246499 (= lt!123359 e!159911)))

(declare-fun c!41232 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4768 0))(
  ( (tuple2!4769 (_1!2395 (_ BitVec 64)) (_2!2395 V!8225)) )
))
(declare-datatypes ((List!3671 0))(
  ( (Nil!3668) (Cons!3667 (h!4325 tuple2!4768) (t!8681 List!3671)) )
))
(declare-datatypes ((ListLongMap!3671 0))(
  ( (ListLongMap!3672 (toList!1851 List!3671)) )
))
(declare-fun contains!1768 (ListLongMap!3671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1360 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 32) Int) ListLongMap!3671)

(assert (=> b!246499 (= c!41232 (contains!1768 (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) key!932))))

(declare-fun b!246500 () Bool)

(declare-fun e!159903 () Bool)

(assert (=> b!246500 (= e!159903 e!159907)))

(declare-fun res!120833 () Bool)

(assert (=> b!246500 (=> (not res!120833) (not e!159907))))

(declare-datatypes ((SeekEntryResult!1093 0))(
  ( (MissingZero!1093 (index!6542 (_ BitVec 32))) (Found!1093 (index!6543 (_ BitVec 32))) (Intermediate!1093 (undefined!1905 Bool) (index!6544 (_ BitVec 32)) (x!24484 (_ BitVec 32))) (Undefined!1093) (MissingVacant!1093 (index!6545 (_ BitVec 32))) )
))
(declare-fun lt!123355 () SeekEntryResult!1093)

(assert (=> b!246500 (= res!120833 (or (= lt!123355 (MissingZero!1093 index!297)) (= lt!123355 (MissingVacant!1093 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12163 (_ BitVec 32)) SeekEntryResult!1093)

(assert (=> b!246500 (= lt!123355 (seekEntryOrOpen!0 key!932 (_keys!6683 thiss!1504) (mask!10691 thiss!1504)))))

(declare-fun b!246501 () Bool)

(declare-fun Unit!7608 () Unit!7606)

(assert (=> b!246501 (= e!159911 Unit!7608)))

(declare-fun lt!123360 () Unit!7606)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7606)

(assert (=> b!246501 (= lt!123360 (lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(assert (=> b!246501 false))

(declare-fun b!246502 () Bool)

(declare-fun res!120836 () Bool)

(assert (=> b!246502 (=> (not res!120836) (not e!159903))))

(assert (=> b!246502 (= res!120836 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246504 () Bool)

(declare-fun e!159914 () Bool)

(declare-fun e!159910 () Bool)

(declare-fun mapRes!10919 () Bool)

(assert (=> b!246504 (= e!159914 (and e!159910 mapRes!10919))))

(declare-fun condMapEmpty!10919 () Bool)

(declare-fun mapDefault!10919 () ValueCell!2873)

(assert (=> b!246504 (= condMapEmpty!10919 (= (arr!5769 (_values!4547 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2873)) mapDefault!10919)))))

(declare-fun b!246505 () Bool)

(declare-fun res!120834 () Bool)

(declare-fun e!159905 () Bool)

(assert (=> b!246505 (=> (not res!120834) (not e!159905))))

(declare-fun call!23043 () Bool)

(assert (=> b!246505 (= res!120834 call!23043)))

(declare-fun e!159912 () Bool)

(assert (=> b!246505 (= e!159912 e!159905)))

(declare-fun c!41233 () Bool)

(declare-fun bm!23039 () Bool)

(assert (=> bm!23039 (= call!23043 (inRange!0 (ite c!41233 (index!6542 lt!123355) (index!6545 lt!123355)) (mask!10691 thiss!1504)))))

(declare-fun b!246506 () Bool)

(declare-fun e!159902 () Bool)

(declare-fun e!159915 () Bool)

(assert (=> b!246506 (= e!159902 e!159915)))

(declare-fun res!120838 () Bool)

(assert (=> b!246506 (= res!120838 call!23043)))

(assert (=> b!246506 (=> (not res!120838) (not e!159915))))

(declare-fun b!246507 () Bool)

(declare-fun e!159901 () Bool)

(assert (=> b!246507 (= e!159909 (not e!159901))))

(declare-fun res!120831 () Bool)

(assert (=> b!246507 (=> res!120831 e!159901)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246507 (= res!120831 (not (validMask!0 (mask!10691 thiss!1504))))))

(declare-fun lt!123357 () array!12163)

(declare-fun arrayCountValidKeys!0 (array!12163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246507 (= (arrayCountValidKeys!0 lt!123357 #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6683 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504)))))))

(declare-fun lt!123353 () Unit!7606)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12163 (_ BitVec 32) (_ BitVec 64)) Unit!7606)

(assert (=> b!246507 (= lt!123353 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6683 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3672 0))(
  ( (Nil!3669) (Cons!3668 (h!4326 (_ BitVec 64)) (t!8682 List!3672)) )
))
(declare-fun arrayNoDuplicates!0 (array!12163 (_ BitVec 32) List!3672) Bool)

(assert (=> b!246507 (arrayNoDuplicates!0 lt!123357 #b00000000000000000000000000000000 Nil!3669)))

(assert (=> b!246507 (= lt!123357 (array!12164 (store (arr!5770 (_keys!6683 thiss!1504)) index!297 key!932) (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun lt!123354 () Unit!7606)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12163 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3672) Unit!7606)

(assert (=> b!246507 (= lt!123354 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6683 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3669))))

(declare-fun lt!123352 () Unit!7606)

(declare-fun e!159908 () Unit!7606)

(assert (=> b!246507 (= lt!123352 e!159908)))

(declare-fun c!41231 () Bool)

(declare-fun arrayContainsKey!0 (array!12163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!246507 (= c!41231 (arrayContainsKey!0 (_keys!6683 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246508 () Bool)

(get-info :version)

(assert (=> b!246508 (= e!159902 ((_ is Undefined!1093) lt!123355))))

(declare-fun mapNonEmpty!10919 () Bool)

(declare-fun tp!22954 () Bool)

(declare-fun e!159906 () Bool)

(assert (=> mapNonEmpty!10919 (= mapRes!10919 (and tp!22954 e!159906))))

(declare-fun mapKey!10919 () (_ BitVec 32))

(declare-fun mapValue!10919 () ValueCell!2873)

(declare-fun mapRest!10919 () (Array (_ BitVec 32) ValueCell!2873))

(assert (=> mapNonEmpty!10919 (= (arr!5769 (_values!4547 thiss!1504)) (store mapRest!10919 mapKey!10919 mapValue!10919))))

(declare-fun b!246509 () Bool)

(declare-fun call!23042 () Bool)

(assert (=> b!246509 (= e!159915 (not call!23042))))

(declare-fun b!246510 () Bool)

(declare-fun Unit!7609 () Unit!7606)

(assert (=> b!246510 (= e!159908 Unit!7609)))

(declare-fun lt!123358 () Unit!7606)

(declare-fun lemmaArrayContainsKeyThenInListMap!190 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) (_ BitVec 32) Int) Unit!7606)

(assert (=> b!246510 (= lt!123358 (lemmaArrayContainsKeyThenInListMap!190 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(assert (=> b!246510 false))

(declare-fun b!246511 () Bool)

(declare-fun tp_is_empty!6433 () Bool)

(assert (=> b!246511 (= e!159910 tp_is_empty!6433)))

(declare-fun b!246512 () Bool)

(declare-fun Unit!7610 () Unit!7606)

(assert (=> b!246512 (= e!159908 Unit!7610)))

(declare-fun e!159904 () Bool)

(declare-fun array_inv!3805 (array!12163) Bool)

(declare-fun array_inv!3806 (array!12161) Bool)

(assert (=> b!246513 (= e!159904 (and tp!22955 tp_is_empty!6433 (array_inv!3805 (_keys!6683 thiss!1504)) (array_inv!3806 (_values!4547 thiss!1504)) e!159914))))

(declare-fun res!120832 () Bool)

(assert (=> start!23490 (=> (not res!120832) (not e!159903))))

(declare-fun valid!1435 (LongMapFixedSize!3646) Bool)

(assert (=> start!23490 (= res!120832 (valid!1435 thiss!1504))))

(assert (=> start!23490 e!159903))

(assert (=> start!23490 e!159904))

(assert (=> start!23490 true))

(declare-fun b!246503 () Bool)

(declare-fun res!120837 () Bool)

(assert (=> b!246503 (= res!120837 (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6545 lt!123355)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246503 (=> (not res!120837) (not e!159915))))

(declare-fun b!246514 () Bool)

(assert (=> b!246514 (= e!159906 tp_is_empty!6433)))

(declare-fun b!246515 () Bool)

(declare-fun res!120835 () Bool)

(assert (=> b!246515 (=> (not res!120835) (not e!159905))))

(assert (=> b!246515 (= res!120835 (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6542 lt!123355)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246516 () Bool)

(declare-fun c!41234 () Bool)

(assert (=> b!246516 (= c!41234 ((_ is MissingVacant!1093) lt!123355))))

(assert (=> b!246516 (= e!159912 e!159902)))

(declare-fun bm!23040 () Bool)

(assert (=> bm!23040 (= call!23042 (arrayContainsKey!0 (_keys!6683 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10919 () Bool)

(assert (=> mapIsEmpty!10919 mapRes!10919))

(declare-fun b!246517 () Bool)

(declare-fun lt!123356 () Unit!7606)

(assert (=> b!246517 (= e!159911 lt!123356)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7606)

(assert (=> b!246517 (= lt!123356 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(assert (=> b!246517 (= c!41233 ((_ is MissingZero!1093) lt!123355))))

(assert (=> b!246517 e!159912))

(declare-fun b!246518 () Bool)

(assert (=> b!246518 (= e!159905 (not call!23042))))

(declare-fun b!246519 () Bool)

(assert (=> b!246519 (= e!159901 (or (not (= (size!6114 (_keys!6683 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10691 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6114 (_keys!6683 thiss!1504)))))))

(assert (= (and start!23490 res!120832) b!246502))

(assert (= (and b!246502 res!120836) b!246500))

(assert (= (and b!246500 res!120833) b!246499))

(assert (= (and b!246499 c!41232) b!246501))

(assert (= (and b!246499 (not c!41232)) b!246517))

(assert (= (and b!246517 c!41233) b!246505))

(assert (= (and b!246517 (not c!41233)) b!246516))

(assert (= (and b!246505 res!120834) b!246515))

(assert (= (and b!246515 res!120835) b!246518))

(assert (= (and b!246516 c!41234) b!246506))

(assert (= (and b!246516 (not c!41234)) b!246508))

(assert (= (and b!246506 res!120838) b!246503))

(assert (= (and b!246503 res!120837) b!246509))

(assert (= (or b!246505 b!246506) bm!23039))

(assert (= (or b!246518 b!246509) bm!23040))

(assert (= (and b!246499 res!120839) b!246507))

(assert (= (and b!246507 c!41231) b!246510))

(assert (= (and b!246507 (not c!41231)) b!246512))

(assert (= (and b!246507 (not res!120831)) b!246519))

(assert (= (and b!246504 condMapEmpty!10919) mapIsEmpty!10919))

(assert (= (and b!246504 (not condMapEmpty!10919)) mapNonEmpty!10919))

(assert (= (and mapNonEmpty!10919 ((_ is ValueCellFull!2873) mapValue!10919)) b!246514))

(assert (= (and b!246504 ((_ is ValueCellFull!2873) mapDefault!10919)) b!246511))

(assert (= b!246513 b!246504))

(assert (= start!23490 b!246513))

(declare-fun m!263345 () Bool)

(assert (=> b!246503 m!263345))

(declare-fun m!263347 () Bool)

(assert (=> b!246499 m!263347))

(declare-fun m!263349 () Bool)

(assert (=> b!246499 m!263349))

(assert (=> b!246499 m!263349))

(declare-fun m!263351 () Bool)

(assert (=> b!246499 m!263351))

(declare-fun m!263353 () Bool)

(assert (=> start!23490 m!263353))

(declare-fun m!263355 () Bool)

(assert (=> bm!23040 m!263355))

(declare-fun m!263357 () Bool)

(assert (=> bm!23039 m!263357))

(declare-fun m!263359 () Bool)

(assert (=> b!246517 m!263359))

(declare-fun m!263361 () Bool)

(assert (=> b!246515 m!263361))

(declare-fun m!263363 () Bool)

(assert (=> b!246507 m!263363))

(assert (=> b!246507 m!263355))

(declare-fun m!263365 () Bool)

(assert (=> b!246507 m!263365))

(declare-fun m!263367 () Bool)

(assert (=> b!246507 m!263367))

(declare-fun m!263369 () Bool)

(assert (=> b!246507 m!263369))

(declare-fun m!263371 () Bool)

(assert (=> b!246507 m!263371))

(declare-fun m!263373 () Bool)

(assert (=> b!246507 m!263373))

(declare-fun m!263375 () Bool)

(assert (=> b!246507 m!263375))

(declare-fun m!263377 () Bool)

(assert (=> b!246510 m!263377))

(declare-fun m!263379 () Bool)

(assert (=> b!246513 m!263379))

(declare-fun m!263381 () Bool)

(assert (=> b!246513 m!263381))

(declare-fun m!263383 () Bool)

(assert (=> b!246500 m!263383))

(declare-fun m!263385 () Bool)

(assert (=> mapNonEmpty!10919 m!263385))

(declare-fun m!263387 () Bool)

(assert (=> b!246501 m!263387))

(check-sat (not b!246517) (not b_next!6571) (not b!246513) b_and!13543 (not bm!23040) (not b!246510) (not start!23490) (not b!246499) (not bm!23039) tp_is_empty!6433 (not mapNonEmpty!10919) (not b!246500) (not b!246507) (not b!246501))
(check-sat b_and!13543 (not b_next!6571))
(get-model)

(declare-fun d!60253 () Bool)

(assert (=> d!60253 (contains!1768 (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) key!932)))

(declare-fun lt!123417 () Unit!7606)

(declare-fun choose!1165 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) (_ BitVec 32) Int) Unit!7606)

(assert (=> d!60253 (= lt!123417 (choose!1165 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(assert (=> d!60253 (validMask!0 (mask!10691 thiss!1504))))

(assert (=> d!60253 (= (lemmaArrayContainsKeyThenInListMap!190 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) lt!123417)))

(declare-fun bs!8892 () Bool)

(assert (= bs!8892 d!60253))

(assert (=> bs!8892 m!263349))

(assert (=> bs!8892 m!263349))

(assert (=> bs!8892 m!263351))

(declare-fun m!263477 () Bool)

(assert (=> bs!8892 m!263477))

(assert (=> bs!8892 m!263363))

(assert (=> b!246510 d!60253))

(declare-fun d!60255 () Bool)

(declare-fun e!160008 () Bool)

(assert (=> d!60255 e!160008))

(declare-fun res!120898 () Bool)

(assert (=> d!60255 (=> (not res!120898) (not e!160008))))

(declare-fun lt!123422 () SeekEntryResult!1093)

(assert (=> d!60255 (= res!120898 ((_ is Found!1093) lt!123422))))

(assert (=> d!60255 (= lt!123422 (seekEntryOrOpen!0 key!932 (_keys!6683 thiss!1504) (mask!10691 thiss!1504)))))

(declare-fun lt!123423 () Unit!7606)

(declare-fun choose!1166 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7606)

(assert (=> d!60255 (= lt!123423 (choose!1166 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(assert (=> d!60255 (validMask!0 (mask!10691 thiss!1504))))

(assert (=> d!60255 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)) lt!123423)))

(declare-fun b!246650 () Bool)

(declare-fun res!120899 () Bool)

(assert (=> b!246650 (=> (not res!120899) (not e!160008))))

(assert (=> b!246650 (= res!120899 (inRange!0 (index!6543 lt!123422) (mask!10691 thiss!1504)))))

(declare-fun b!246651 () Bool)

(assert (=> b!246651 (= e!160008 (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6543 lt!123422)) key!932))))

(assert (=> b!246651 (and (bvsge (index!6543 lt!123422) #b00000000000000000000000000000000) (bvslt (index!6543 lt!123422) (size!6114 (_keys!6683 thiss!1504))))))

(assert (= (and d!60255 res!120898) b!246650))

(assert (= (and b!246650 res!120899) b!246651))

(assert (=> d!60255 m!263383))

(declare-fun m!263479 () Bool)

(assert (=> d!60255 m!263479))

(assert (=> d!60255 m!263363))

(declare-fun m!263481 () Bool)

(assert (=> b!246650 m!263481))

(declare-fun m!263483 () Bool)

(assert (=> b!246651 m!263483))

(assert (=> b!246501 d!60255))

(declare-fun d!60257 () Bool)

(assert (=> d!60257 (= (inRange!0 (ite c!41233 (index!6542 lt!123355) (index!6545 lt!123355)) (mask!10691 thiss!1504)) (and (bvsge (ite c!41233 (index!6542 lt!123355) (index!6545 lt!123355)) #b00000000000000000000000000000000) (bvslt (ite c!41233 (index!6542 lt!123355) (index!6545 lt!123355)) (bvadd (mask!10691 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23039 d!60257))

(declare-fun d!60259 () Bool)

(declare-fun res!120904 () Bool)

(declare-fun e!160013 () Bool)

(assert (=> d!60259 (=> res!120904 e!160013)))

(assert (=> d!60259 (= res!120904 (= (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60259 (= (arrayContainsKey!0 (_keys!6683 thiss!1504) key!932 #b00000000000000000000000000000000) e!160013)))

(declare-fun b!246656 () Bool)

(declare-fun e!160014 () Bool)

(assert (=> b!246656 (= e!160013 e!160014)))

(declare-fun res!120905 () Bool)

(assert (=> b!246656 (=> (not res!120905) (not e!160014))))

(assert (=> b!246656 (= res!120905 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun b!246657 () Bool)

(assert (=> b!246657 (= e!160014 (arrayContainsKey!0 (_keys!6683 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60259 (not res!120904)) b!246656))

(assert (= (and b!246656 res!120905) b!246657))

(declare-fun m!263485 () Bool)

(assert (=> d!60259 m!263485))

(declare-fun m!263487 () Bool)

(assert (=> b!246657 m!263487))

(assert (=> bm!23040 d!60259))

(declare-fun b!246667 () Bool)

(declare-fun res!120917 () Bool)

(declare-fun e!160019 () Bool)

(assert (=> b!246667 (=> (not res!120917) (not e!160019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!246667 (= res!120917 (validKeyInArray!0 key!932))))

(declare-fun b!246668 () Bool)

(assert (=> b!246668 (= e!160019 (bvslt (size!6114 (_keys!6683 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!60261 () Bool)

(declare-fun e!160020 () Bool)

(assert (=> d!60261 e!160020))

(declare-fun res!120915 () Bool)

(assert (=> d!60261 (=> (not res!120915) (not e!160020))))

(assert (=> d!60261 (= res!120915 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6114 (_keys!6683 thiss!1504)))))))

(declare-fun lt!123426 () Unit!7606)

(declare-fun choose!1 (array!12163 (_ BitVec 32) (_ BitVec 64)) Unit!7606)

(assert (=> d!60261 (= lt!123426 (choose!1 (_keys!6683 thiss!1504) index!297 key!932))))

(assert (=> d!60261 e!160019))

(declare-fun res!120916 () Bool)

(assert (=> d!60261 (=> (not res!120916) (not e!160019))))

(assert (=> d!60261 (= res!120916 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6114 (_keys!6683 thiss!1504)))))))

(assert (=> d!60261 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6683 thiss!1504) index!297 key!932) lt!123426)))

(declare-fun b!246666 () Bool)

(declare-fun res!120914 () Bool)

(assert (=> b!246666 (=> (not res!120914) (not e!160019))))

(assert (=> b!246666 (= res!120914 (not (validKeyInArray!0 (select (arr!5770 (_keys!6683 thiss!1504)) index!297))))))

(declare-fun b!246669 () Bool)

(assert (=> b!246669 (= e!160020 (= (arrayCountValidKeys!0 (array!12164 (store (arr!5770 (_keys!6683 thiss!1504)) index!297 key!932) (size!6114 (_keys!6683 thiss!1504))) #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6683 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!60261 res!120916) b!246666))

(assert (= (and b!246666 res!120914) b!246667))

(assert (= (and b!246667 res!120917) b!246668))

(assert (= (and d!60261 res!120915) b!246669))

(declare-fun m!263489 () Bool)

(assert (=> b!246667 m!263489))

(declare-fun m!263491 () Bool)

(assert (=> d!60261 m!263491))

(declare-fun m!263493 () Bool)

(assert (=> b!246666 m!263493))

(assert (=> b!246666 m!263493))

(declare-fun m!263495 () Bool)

(assert (=> b!246666 m!263495))

(assert (=> b!246669 m!263371))

(declare-fun m!263497 () Bool)

(assert (=> b!246669 m!263497))

(assert (=> b!246669 m!263373))

(assert (=> b!246507 d!60261))

(assert (=> b!246507 d!60259))

(declare-fun b!246678 () Bool)

(declare-fun e!160026 () (_ BitVec 32))

(assert (=> b!246678 (= e!160026 #b00000000000000000000000000000000)))

(declare-fun bm!23055 () Bool)

(declare-fun call!23058 () (_ BitVec 32))

(assert (=> bm!23055 (= call!23058 (arrayCountValidKeys!0 (_keys!6683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun d!60263 () Bool)

(declare-fun lt!123429 () (_ BitVec 32))

(assert (=> d!60263 (and (bvsge lt!123429 #b00000000000000000000000000000000) (bvsle lt!123429 (bvsub (size!6114 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60263 (= lt!123429 e!160026)))

(declare-fun c!41264 () Bool)

(assert (=> d!60263 (= c!41264 (bvsge #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))))))

(assert (=> d!60263 (and (bvsle #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6114 (_keys!6683 thiss!1504)) (size!6114 (_keys!6683 thiss!1504))))))

(assert (=> d!60263 (= (arrayCountValidKeys!0 (_keys!6683 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) lt!123429)))

(declare-fun b!246679 () Bool)

(declare-fun e!160025 () (_ BitVec 32))

(assert (=> b!246679 (= e!160025 call!23058)))

(declare-fun b!246680 () Bool)

(assert (=> b!246680 (= e!160025 (bvadd #b00000000000000000000000000000001 call!23058))))

(declare-fun b!246681 () Bool)

(assert (=> b!246681 (= e!160026 e!160025)))

(declare-fun c!41263 () Bool)

(assert (=> b!246681 (= c!41263 (validKeyInArray!0 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60263 c!41264) b!246678))

(assert (= (and d!60263 (not c!41264)) b!246681))

(assert (= (and b!246681 c!41263) b!246680))

(assert (= (and b!246681 (not c!41263)) b!246679))

(assert (= (or b!246680 b!246679) bm!23055))

(declare-fun m!263499 () Bool)

(assert (=> bm!23055 m!263499))

(assert (=> b!246681 m!263485))

(assert (=> b!246681 m!263485))

(declare-fun m!263501 () Bool)

(assert (=> b!246681 m!263501))

(assert (=> b!246507 d!60263))

(declare-fun d!60265 () Bool)

(assert (=> d!60265 (= (validMask!0 (mask!10691 thiss!1504)) (and (or (= (mask!10691 thiss!1504) #b00000000000000000000000000000111) (= (mask!10691 thiss!1504) #b00000000000000000000000000001111) (= (mask!10691 thiss!1504) #b00000000000000000000000000011111) (= (mask!10691 thiss!1504) #b00000000000000000000000000111111) (= (mask!10691 thiss!1504) #b00000000000000000000000001111111) (= (mask!10691 thiss!1504) #b00000000000000000000000011111111) (= (mask!10691 thiss!1504) #b00000000000000000000000111111111) (= (mask!10691 thiss!1504) #b00000000000000000000001111111111) (= (mask!10691 thiss!1504) #b00000000000000000000011111111111) (= (mask!10691 thiss!1504) #b00000000000000000000111111111111) (= (mask!10691 thiss!1504) #b00000000000000000001111111111111) (= (mask!10691 thiss!1504) #b00000000000000000011111111111111) (= (mask!10691 thiss!1504) #b00000000000000000111111111111111) (= (mask!10691 thiss!1504) #b00000000000000001111111111111111) (= (mask!10691 thiss!1504) #b00000000000000011111111111111111) (= (mask!10691 thiss!1504) #b00000000000000111111111111111111) (= (mask!10691 thiss!1504) #b00000000000001111111111111111111) (= (mask!10691 thiss!1504) #b00000000000011111111111111111111) (= (mask!10691 thiss!1504) #b00000000000111111111111111111111) (= (mask!10691 thiss!1504) #b00000000001111111111111111111111) (= (mask!10691 thiss!1504) #b00000000011111111111111111111111) (= (mask!10691 thiss!1504) #b00000000111111111111111111111111) (= (mask!10691 thiss!1504) #b00000001111111111111111111111111) (= (mask!10691 thiss!1504) #b00000011111111111111111111111111) (= (mask!10691 thiss!1504) #b00000111111111111111111111111111) (= (mask!10691 thiss!1504) #b00001111111111111111111111111111) (= (mask!10691 thiss!1504) #b00011111111111111111111111111111) (= (mask!10691 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10691 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!246507 d!60265))

(declare-fun d!60267 () Bool)

(declare-fun e!160029 () Bool)

(assert (=> d!60267 e!160029))

(declare-fun res!120920 () Bool)

(assert (=> d!60267 (=> (not res!120920) (not e!160029))))

(assert (=> d!60267 (= res!120920 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6114 (_keys!6683 thiss!1504)))))))

(declare-fun lt!123432 () Unit!7606)

(declare-fun choose!41 (array!12163 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3672) Unit!7606)

(assert (=> d!60267 (= lt!123432 (choose!41 (_keys!6683 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3669))))

(assert (=> d!60267 (bvslt (size!6114 (_keys!6683 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60267 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6683 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3669) lt!123432)))

(declare-fun b!246684 () Bool)

(assert (=> b!246684 (= e!160029 (arrayNoDuplicates!0 (array!12164 (store (arr!5770 (_keys!6683 thiss!1504)) index!297 key!932) (size!6114 (_keys!6683 thiss!1504))) #b00000000000000000000000000000000 Nil!3669))))

(assert (= (and d!60267 res!120920) b!246684))

(declare-fun m!263503 () Bool)

(assert (=> d!60267 m!263503))

(assert (=> b!246684 m!263371))

(declare-fun m!263505 () Bool)

(assert (=> b!246684 m!263505))

(assert (=> b!246507 d!60267))

(declare-fun b!246695 () Bool)

(declare-fun e!160038 () Bool)

(declare-fun contains!1770 (List!3672 (_ BitVec 64)) Bool)

(assert (=> b!246695 (= e!160038 (contains!1770 Nil!3669 (select (arr!5770 lt!123357) #b00000000000000000000000000000000)))))

(declare-fun bm!23058 () Bool)

(declare-fun call!23061 () Bool)

(declare-fun c!41267 () Bool)

(assert (=> bm!23058 (= call!23061 (arrayNoDuplicates!0 lt!123357 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41267 (Cons!3668 (select (arr!5770 lt!123357) #b00000000000000000000000000000000) Nil!3669) Nil!3669)))))

(declare-fun b!246696 () Bool)

(declare-fun e!160041 () Bool)

(assert (=> b!246696 (= e!160041 call!23061)))

(declare-fun b!246697 () Bool)

(assert (=> b!246697 (= e!160041 call!23061)))

(declare-fun d!60269 () Bool)

(declare-fun res!120927 () Bool)

(declare-fun e!160039 () Bool)

(assert (=> d!60269 (=> res!120927 e!160039)))

(assert (=> d!60269 (= res!120927 (bvsge #b00000000000000000000000000000000 (size!6114 lt!123357)))))

(assert (=> d!60269 (= (arrayNoDuplicates!0 lt!123357 #b00000000000000000000000000000000 Nil!3669) e!160039)))

(declare-fun b!246698 () Bool)

(declare-fun e!160040 () Bool)

(assert (=> b!246698 (= e!160040 e!160041)))

(assert (=> b!246698 (= c!41267 (validKeyInArray!0 (select (arr!5770 lt!123357) #b00000000000000000000000000000000)))))

(declare-fun b!246699 () Bool)

(assert (=> b!246699 (= e!160039 e!160040)))

(declare-fun res!120928 () Bool)

(assert (=> b!246699 (=> (not res!120928) (not e!160040))))

(assert (=> b!246699 (= res!120928 (not e!160038))))

(declare-fun res!120929 () Bool)

(assert (=> b!246699 (=> (not res!120929) (not e!160038))))

(assert (=> b!246699 (= res!120929 (validKeyInArray!0 (select (arr!5770 lt!123357) #b00000000000000000000000000000000)))))

(assert (= (and d!60269 (not res!120927)) b!246699))

(assert (= (and b!246699 res!120929) b!246695))

(assert (= (and b!246699 res!120928) b!246698))

(assert (= (and b!246698 c!41267) b!246696))

(assert (= (and b!246698 (not c!41267)) b!246697))

(assert (= (or b!246696 b!246697) bm!23058))

(declare-fun m!263507 () Bool)

(assert (=> b!246695 m!263507))

(assert (=> b!246695 m!263507))

(declare-fun m!263509 () Bool)

(assert (=> b!246695 m!263509))

(assert (=> bm!23058 m!263507))

(declare-fun m!263511 () Bool)

(assert (=> bm!23058 m!263511))

(assert (=> b!246698 m!263507))

(assert (=> b!246698 m!263507))

(declare-fun m!263513 () Bool)

(assert (=> b!246698 m!263513))

(assert (=> b!246699 m!263507))

(assert (=> b!246699 m!263507))

(assert (=> b!246699 m!263513))

(assert (=> b!246507 d!60269))

(declare-fun b!246700 () Bool)

(declare-fun e!160043 () (_ BitVec 32))

(assert (=> b!246700 (= e!160043 #b00000000000000000000000000000000)))

(declare-fun bm!23059 () Bool)

(declare-fun call!23062 () (_ BitVec 32))

(assert (=> bm!23059 (= call!23062 (arrayCountValidKeys!0 lt!123357 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun d!60271 () Bool)

(declare-fun lt!123433 () (_ BitVec 32))

(assert (=> d!60271 (and (bvsge lt!123433 #b00000000000000000000000000000000) (bvsle lt!123433 (bvsub (size!6114 lt!123357) #b00000000000000000000000000000000)))))

(assert (=> d!60271 (= lt!123433 e!160043)))

(declare-fun c!41269 () Bool)

(assert (=> d!60271 (= c!41269 (bvsge #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))))))

(assert (=> d!60271 (and (bvsle #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6114 (_keys!6683 thiss!1504)) (size!6114 lt!123357)))))

(assert (=> d!60271 (= (arrayCountValidKeys!0 lt!123357 #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) lt!123433)))

(declare-fun b!246701 () Bool)

(declare-fun e!160042 () (_ BitVec 32))

(assert (=> b!246701 (= e!160042 call!23062)))

(declare-fun b!246702 () Bool)

(assert (=> b!246702 (= e!160042 (bvadd #b00000000000000000000000000000001 call!23062))))

(declare-fun b!246703 () Bool)

(assert (=> b!246703 (= e!160043 e!160042)))

(declare-fun c!41268 () Bool)

(assert (=> b!246703 (= c!41268 (validKeyInArray!0 (select (arr!5770 lt!123357) #b00000000000000000000000000000000)))))

(assert (= (and d!60271 c!41269) b!246700))

(assert (= (and d!60271 (not c!41269)) b!246703))

(assert (= (and b!246703 c!41268) b!246702))

(assert (= (and b!246703 (not c!41268)) b!246701))

(assert (= (or b!246702 b!246701) bm!23059))

(declare-fun m!263515 () Bool)

(assert (=> bm!23059 m!263515))

(assert (=> b!246703 m!263507))

(assert (=> b!246703 m!263507))

(assert (=> b!246703 m!263513))

(assert (=> b!246507 d!60271))

(declare-fun d!60273 () Bool)

(declare-fun res!120936 () Bool)

(declare-fun e!160046 () Bool)

(assert (=> d!60273 (=> (not res!120936) (not e!160046))))

(declare-fun simpleValid!256 (LongMapFixedSize!3646) Bool)

(assert (=> d!60273 (= res!120936 (simpleValid!256 thiss!1504))))

(assert (=> d!60273 (= (valid!1435 thiss!1504) e!160046)))

(declare-fun b!246710 () Bool)

(declare-fun res!120937 () Bool)

(assert (=> b!246710 (=> (not res!120937) (not e!160046))))

(assert (=> b!246710 (= res!120937 (= (arrayCountValidKeys!0 (_keys!6683 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) (_size!1872 thiss!1504)))))

(declare-fun b!246711 () Bool)

(declare-fun res!120938 () Bool)

(assert (=> b!246711 (=> (not res!120938) (not e!160046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12163 (_ BitVec 32)) Bool)

(assert (=> b!246711 (= res!120938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6683 thiss!1504) (mask!10691 thiss!1504)))))

(declare-fun b!246712 () Bool)

(assert (=> b!246712 (= e!160046 (arrayNoDuplicates!0 (_keys!6683 thiss!1504) #b00000000000000000000000000000000 Nil!3669))))

(assert (= (and d!60273 res!120936) b!246710))

(assert (= (and b!246710 res!120937) b!246711))

(assert (= (and b!246711 res!120938) b!246712))

(declare-fun m!263517 () Bool)

(assert (=> d!60273 m!263517))

(assert (=> b!246710 m!263373))

(declare-fun m!263519 () Bool)

(assert (=> b!246711 m!263519))

(declare-fun m!263521 () Bool)

(assert (=> b!246712 m!263521))

(assert (=> start!23490 d!60273))

(declare-fun d!60275 () Bool)

(assert (=> d!60275 (= (array_inv!3805 (_keys!6683 thiss!1504)) (bvsge (size!6114 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246513 d!60275))

(declare-fun d!60277 () Bool)

(assert (=> d!60277 (= (array_inv!3806 (_values!4547 thiss!1504)) (bvsge (size!6113 (_values!4547 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246513 d!60277))

(declare-fun d!60279 () Bool)

(assert (=> d!60279 (= (inRange!0 index!297 (mask!10691 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10691 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246499 d!60279))

(declare-fun d!60281 () Bool)

(declare-fun e!160051 () Bool)

(assert (=> d!60281 e!160051))

(declare-fun res!120941 () Bool)

(assert (=> d!60281 (=> res!120941 e!160051)))

(declare-fun lt!123442 () Bool)

(assert (=> d!60281 (= res!120941 (not lt!123442))))

(declare-fun lt!123444 () Bool)

(assert (=> d!60281 (= lt!123442 lt!123444)))

(declare-fun lt!123445 () Unit!7606)

(declare-fun e!160052 () Unit!7606)

(assert (=> d!60281 (= lt!123445 e!160052)))

(declare-fun c!41272 () Bool)

(assert (=> d!60281 (= c!41272 lt!123444)))

(declare-fun containsKey!281 (List!3671 (_ BitVec 64)) Bool)

(assert (=> d!60281 (= lt!123444 (containsKey!281 (toList!1851 (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932))))

(assert (=> d!60281 (= (contains!1768 (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) key!932) lt!123442)))

(declare-fun b!246719 () Bool)

(declare-fun lt!123443 () Unit!7606)

(assert (=> b!246719 (= e!160052 lt!123443)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!230 (List!3671 (_ BitVec 64)) Unit!7606)

(assert (=> b!246719 (= lt!123443 (lemmaContainsKeyImpliesGetValueByKeyDefined!230 (toList!1851 (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932))))

(declare-datatypes ((Option!295 0))(
  ( (Some!294 (v!5314 V!8225)) (None!293) )
))
(declare-fun isDefined!231 (Option!295) Bool)

(declare-fun getValueByKey!289 (List!3671 (_ BitVec 64)) Option!295)

(assert (=> b!246719 (isDefined!231 (getValueByKey!289 (toList!1851 (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932))))

(declare-fun b!246720 () Bool)

(declare-fun Unit!7618 () Unit!7606)

(assert (=> b!246720 (= e!160052 Unit!7618)))

(declare-fun b!246721 () Bool)

(assert (=> b!246721 (= e!160051 (isDefined!231 (getValueByKey!289 (toList!1851 (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504))) key!932)))))

(assert (= (and d!60281 c!41272) b!246719))

(assert (= (and d!60281 (not c!41272)) b!246720))

(assert (= (and d!60281 (not res!120941)) b!246721))

(declare-fun m!263523 () Bool)

(assert (=> d!60281 m!263523))

(declare-fun m!263525 () Bool)

(assert (=> b!246719 m!263525))

(declare-fun m!263527 () Bool)

(assert (=> b!246719 m!263527))

(assert (=> b!246719 m!263527))

(declare-fun m!263529 () Bool)

(assert (=> b!246719 m!263529))

(assert (=> b!246721 m!263527))

(assert (=> b!246721 m!263527))

(assert (=> b!246721 m!263529))

(assert (=> b!246499 d!60281))

(declare-fun b!246764 () Bool)

(declare-fun e!160089 () Bool)

(declare-fun call!23083 () Bool)

(assert (=> b!246764 (= e!160089 (not call!23083))))

(declare-fun b!246765 () Bool)

(declare-fun e!160080 () Unit!7606)

(declare-fun Unit!7619 () Unit!7606)

(assert (=> b!246765 (= e!160080 Unit!7619)))

(declare-fun b!246766 () Bool)

(declare-fun e!160081 () ListLongMap!3671)

(declare-fun call!23081 () ListLongMap!3671)

(assert (=> b!246766 (= e!160081 call!23081)))

(declare-fun b!246767 () Bool)

(declare-fun e!160090 () ListLongMap!3671)

(assert (=> b!246767 (= e!160090 call!23081)))

(declare-fun b!246768 () Bool)

(declare-fun e!160087 () Bool)

(assert (=> b!246768 (= e!160087 (validKeyInArray!0 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23074 () Bool)

(declare-fun call!23079 () ListLongMap!3671)

(declare-fun call!23077 () ListLongMap!3671)

(assert (=> bm!23074 (= call!23079 call!23077)))

(declare-fun bm!23075 () Bool)

(declare-fun lt!123497 () ListLongMap!3671)

(assert (=> bm!23075 (= call!23083 (contains!1768 lt!123497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23076 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!549 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 32) Int) ListLongMap!3671)

(assert (=> bm!23076 (= call!23077 (getCurrentListMapNoExtraKeys!549 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun b!246770 () Bool)

(declare-fun e!160084 () ListLongMap!3671)

(declare-fun call!23080 () ListLongMap!3671)

(declare-fun +!666 (ListLongMap!3671 tuple2!4768) ListLongMap!3671)

(assert (=> b!246770 (= e!160084 (+!666 call!23080 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4405 thiss!1504))))))

(declare-fun b!246771 () Bool)

(declare-fun e!160085 () Bool)

(declare-fun apply!233 (ListLongMap!3671 (_ BitVec 64)) V!8225)

(assert (=> b!246771 (= e!160085 (= (apply!233 lt!123497 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4405 thiss!1504)))))

(declare-fun b!246772 () Bool)

(declare-fun e!160082 () Bool)

(assert (=> b!246772 (= e!160082 (validKeyInArray!0 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246773 () Bool)

(declare-fun e!160088 () Bool)

(declare-fun e!160083 () Bool)

(assert (=> b!246773 (= e!160088 e!160083)))

(declare-fun res!120962 () Bool)

(assert (=> b!246773 (=> (not res!120962) (not e!160083))))

(assert (=> b!246773 (= res!120962 (contains!1768 lt!123497 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun b!246774 () Bool)

(declare-fun get!2960 (ValueCell!2873 V!8225) V!8225)

(declare-fun dynLambda!567 (Int (_ BitVec 64)) V!8225)

(assert (=> b!246774 (= e!160083 (= (apply!233 lt!123497 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000)) (get!2960 (select (arr!5769 (_values!4547 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!567 (defaultEntry!4564 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246774 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6113 (_values!4547 thiss!1504))))))

(assert (=> b!246774 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun b!246775 () Bool)

(declare-fun lt!123511 () Unit!7606)

(assert (=> b!246775 (= e!160080 lt!123511)))

(declare-fun lt!123502 () ListLongMap!3671)

(assert (=> b!246775 (= lt!123502 (getCurrentListMapNoExtraKeys!549 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123510 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123500 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123500 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123503 () Unit!7606)

(declare-fun addStillContains!209 (ListLongMap!3671 (_ BitVec 64) V!8225 (_ BitVec 64)) Unit!7606)

(assert (=> b!246775 (= lt!123503 (addStillContains!209 lt!123502 lt!123510 (zeroValue!4405 thiss!1504) lt!123500))))

(assert (=> b!246775 (contains!1768 (+!666 lt!123502 (tuple2!4769 lt!123510 (zeroValue!4405 thiss!1504))) lt!123500)))

(declare-fun lt!123507 () Unit!7606)

(assert (=> b!246775 (= lt!123507 lt!123503)))

(declare-fun lt!123501 () ListLongMap!3671)

(assert (=> b!246775 (= lt!123501 (getCurrentListMapNoExtraKeys!549 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123505 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123506 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123506 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123508 () Unit!7606)

(declare-fun addApplyDifferent!209 (ListLongMap!3671 (_ BitVec 64) V!8225 (_ BitVec 64)) Unit!7606)

(assert (=> b!246775 (= lt!123508 (addApplyDifferent!209 lt!123501 lt!123505 (minValue!4405 thiss!1504) lt!123506))))

(assert (=> b!246775 (= (apply!233 (+!666 lt!123501 (tuple2!4769 lt!123505 (minValue!4405 thiss!1504))) lt!123506) (apply!233 lt!123501 lt!123506))))

(declare-fun lt!123494 () Unit!7606)

(assert (=> b!246775 (= lt!123494 lt!123508)))

(declare-fun lt!123492 () ListLongMap!3671)

(assert (=> b!246775 (= lt!123492 (getCurrentListMapNoExtraKeys!549 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123490 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123495 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123495 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123509 () Unit!7606)

(assert (=> b!246775 (= lt!123509 (addApplyDifferent!209 lt!123492 lt!123490 (zeroValue!4405 thiss!1504) lt!123495))))

(assert (=> b!246775 (= (apply!233 (+!666 lt!123492 (tuple2!4769 lt!123490 (zeroValue!4405 thiss!1504))) lt!123495) (apply!233 lt!123492 lt!123495))))

(declare-fun lt!123499 () Unit!7606)

(assert (=> b!246775 (= lt!123499 lt!123509)))

(declare-fun lt!123504 () ListLongMap!3671)

(assert (=> b!246775 (= lt!123504 (getCurrentListMapNoExtraKeys!549 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(declare-fun lt!123491 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123491 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123496 () (_ BitVec 64))

(assert (=> b!246775 (= lt!123496 (select (arr!5770 (_keys!6683 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246775 (= lt!123511 (addApplyDifferent!209 lt!123504 lt!123491 (minValue!4405 thiss!1504) lt!123496))))

(assert (=> b!246775 (= (apply!233 (+!666 lt!123504 (tuple2!4769 lt!123491 (minValue!4405 thiss!1504))) lt!123496) (apply!233 lt!123504 lt!123496))))

(declare-fun b!246776 () Bool)

(declare-fun e!160086 () Bool)

(assert (=> b!246776 (= e!160086 e!160089)))

(declare-fun c!41290 () Bool)

(assert (=> b!246776 (= c!41290 (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!41286 () Bool)

(declare-fun bm!23077 () Bool)

(declare-fun c!41289 () Bool)

(declare-fun call!23078 () ListLongMap!3671)

(assert (=> bm!23077 (= call!23080 (+!666 (ite c!41286 call!23077 (ite c!41289 call!23079 call!23078)) (ite (or c!41286 c!41289) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4405 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4405 thiss!1504)))))))

(declare-fun bm!23078 () Bool)

(assert (=> bm!23078 (= call!23081 call!23080)))

(declare-fun b!246777 () Bool)

(declare-fun res!120960 () Bool)

(assert (=> b!246777 (=> (not res!120960) (not e!160086))))

(assert (=> b!246777 (= res!120960 e!160088)))

(declare-fun res!120963 () Bool)

(assert (=> b!246777 (=> res!120963 e!160088)))

(assert (=> b!246777 (= res!120963 (not e!160087))))

(declare-fun res!120966 () Bool)

(assert (=> b!246777 (=> (not res!120966) (not e!160087))))

(assert (=> b!246777 (= res!120966 (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun b!246778 () Bool)

(declare-fun e!160091 () Bool)

(assert (=> b!246778 (= e!160091 e!160085)))

(declare-fun res!120964 () Bool)

(declare-fun call!23082 () Bool)

(assert (=> b!246778 (= res!120964 call!23082)))

(assert (=> b!246778 (=> (not res!120964) (not e!160085))))

(declare-fun b!246779 () Bool)

(declare-fun e!160079 () Bool)

(assert (=> b!246779 (= e!160089 e!160079)))

(declare-fun res!120965 () Bool)

(assert (=> b!246779 (= res!120965 call!23083)))

(assert (=> b!246779 (=> (not res!120965) (not e!160079))))

(declare-fun bm!23079 () Bool)

(assert (=> bm!23079 (= call!23078 call!23079)))

(declare-fun b!246780 () Bool)

(assert (=> b!246780 (= e!160084 e!160090)))

(assert (=> b!246780 (= c!41289 (and (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246781 () Bool)

(assert (=> b!246781 (= e!160079 (= (apply!233 lt!123497 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4405 thiss!1504)))))

(declare-fun b!246782 () Bool)

(declare-fun res!120968 () Bool)

(assert (=> b!246782 (=> (not res!120968) (not e!160086))))

(assert (=> b!246782 (= res!120968 e!160091)))

(declare-fun c!41285 () Bool)

(assert (=> b!246782 (= c!41285 (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!246783 () Bool)

(assert (=> b!246783 (= e!160081 call!23078)))

(declare-fun d!60283 () Bool)

(assert (=> d!60283 e!160086))

(declare-fun res!120961 () Bool)

(assert (=> d!60283 (=> (not res!120961) (not e!160086))))

(assert (=> d!60283 (= res!120961 (or (bvsge #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))))))))

(declare-fun lt!123498 () ListLongMap!3671)

(assert (=> d!60283 (= lt!123497 lt!123498)))

(declare-fun lt!123493 () Unit!7606)

(assert (=> d!60283 (= lt!123493 e!160080)))

(declare-fun c!41287 () Bool)

(assert (=> d!60283 (= c!41287 e!160082)))

(declare-fun res!120967 () Bool)

(assert (=> d!60283 (=> (not res!120967) (not e!160082))))

(assert (=> d!60283 (= res!120967 (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6683 thiss!1504))))))

(assert (=> d!60283 (= lt!123498 e!160084)))

(assert (=> d!60283 (= c!41286 (and (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60283 (validMask!0 (mask!10691 thiss!1504))))

(assert (=> d!60283 (= (getCurrentListMap!1360 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) lt!123497)))

(declare-fun b!246769 () Bool)

(declare-fun c!41288 () Bool)

(assert (=> b!246769 (= c!41288 (and (not (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4301 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!246769 (= e!160090 e!160081)))

(declare-fun bm!23080 () Bool)

(assert (=> bm!23080 (= call!23082 (contains!1768 lt!123497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246784 () Bool)

(assert (=> b!246784 (= e!160091 (not call!23082))))

(assert (= (and d!60283 c!41286) b!246770))

(assert (= (and d!60283 (not c!41286)) b!246780))

(assert (= (and b!246780 c!41289) b!246767))

(assert (= (and b!246780 (not c!41289)) b!246769))

(assert (= (and b!246769 c!41288) b!246766))

(assert (= (and b!246769 (not c!41288)) b!246783))

(assert (= (or b!246766 b!246783) bm!23079))

(assert (= (or b!246767 bm!23079) bm!23074))

(assert (= (or b!246767 b!246766) bm!23078))

(assert (= (or b!246770 bm!23074) bm!23076))

(assert (= (or b!246770 bm!23078) bm!23077))

(assert (= (and d!60283 res!120967) b!246772))

(assert (= (and d!60283 c!41287) b!246775))

(assert (= (and d!60283 (not c!41287)) b!246765))

(assert (= (and d!60283 res!120961) b!246777))

(assert (= (and b!246777 res!120966) b!246768))

(assert (= (and b!246777 (not res!120963)) b!246773))

(assert (= (and b!246773 res!120962) b!246774))

(assert (= (and b!246777 res!120960) b!246782))

(assert (= (and b!246782 c!41285) b!246778))

(assert (= (and b!246782 (not c!41285)) b!246784))

(assert (= (and b!246778 res!120964) b!246771))

(assert (= (or b!246778 b!246784) bm!23080))

(assert (= (and b!246782 res!120968) b!246776))

(assert (= (and b!246776 c!41290) b!246779))

(assert (= (and b!246776 (not c!41290)) b!246764))

(assert (= (and b!246779 res!120965) b!246781))

(assert (= (or b!246779 b!246764) bm!23075))

(declare-fun b_lambda!8025 () Bool)

(assert (=> (not b_lambda!8025) (not b!246774)))

(declare-fun t!8685 () Bool)

(declare-fun tb!2971 () Bool)

(assert (=> (and b!246513 (= (defaultEntry!4564 thiss!1504) (defaultEntry!4564 thiss!1504)) t!8685) tb!2971))

(declare-fun result!5251 () Bool)

(assert (=> tb!2971 (= result!5251 tp_is_empty!6433)))

(assert (=> b!246774 t!8685))

(declare-fun b_and!13549 () Bool)

(assert (= b_and!13543 (and (=> t!8685 result!5251) b_and!13549)))

(declare-fun m!263531 () Bool)

(assert (=> bm!23076 m!263531))

(assert (=> d!60283 m!263363))

(declare-fun m!263533 () Bool)

(assert (=> b!246775 m!263533))

(declare-fun m!263535 () Bool)

(assert (=> b!246775 m!263535))

(declare-fun m!263537 () Bool)

(assert (=> b!246775 m!263537))

(assert (=> b!246775 m!263485))

(declare-fun m!263539 () Bool)

(assert (=> b!246775 m!263539))

(declare-fun m!263541 () Bool)

(assert (=> b!246775 m!263541))

(declare-fun m!263543 () Bool)

(assert (=> b!246775 m!263543))

(assert (=> b!246775 m!263533))

(declare-fun m!263545 () Bool)

(assert (=> b!246775 m!263545))

(declare-fun m!263547 () Bool)

(assert (=> b!246775 m!263547))

(declare-fun m!263549 () Bool)

(assert (=> b!246775 m!263549))

(declare-fun m!263551 () Bool)

(assert (=> b!246775 m!263551))

(declare-fun m!263553 () Bool)

(assert (=> b!246775 m!263553))

(declare-fun m!263555 () Bool)

(assert (=> b!246775 m!263555))

(assert (=> b!246775 m!263541))

(assert (=> b!246775 m!263547))

(declare-fun m!263557 () Bool)

(assert (=> b!246775 m!263557))

(assert (=> b!246775 m!263535))

(declare-fun m!263559 () Bool)

(assert (=> b!246775 m!263559))

(assert (=> b!246775 m!263531))

(declare-fun m!263561 () Bool)

(assert (=> b!246775 m!263561))

(declare-fun m!263563 () Bool)

(assert (=> bm!23075 m!263563))

(declare-fun m!263565 () Bool)

(assert (=> b!246781 m!263565))

(declare-fun m!263567 () Bool)

(assert (=> b!246774 m!263567))

(declare-fun m!263569 () Bool)

(assert (=> b!246774 m!263569))

(declare-fun m!263571 () Bool)

(assert (=> b!246774 m!263571))

(assert (=> b!246774 m!263485))

(assert (=> b!246774 m!263567))

(assert (=> b!246774 m!263569))

(assert (=> b!246774 m!263485))

(declare-fun m!263573 () Bool)

(assert (=> b!246774 m!263573))

(declare-fun m!263575 () Bool)

(assert (=> b!246770 m!263575))

(declare-fun m!263577 () Bool)

(assert (=> bm!23080 m!263577))

(assert (=> b!246768 m!263485))

(assert (=> b!246768 m!263485))

(assert (=> b!246768 m!263501))

(declare-fun m!263579 () Bool)

(assert (=> b!246771 m!263579))

(declare-fun m!263581 () Bool)

(assert (=> bm!23077 m!263581))

(assert (=> b!246772 m!263485))

(assert (=> b!246772 m!263485))

(assert (=> b!246772 m!263501))

(assert (=> b!246773 m!263485))

(assert (=> b!246773 m!263485))

(declare-fun m!263583 () Bool)

(assert (=> b!246773 m!263583))

(assert (=> b!246499 d!60283))

(declare-fun d!60285 () Bool)

(declare-fun lt!123518 () SeekEntryResult!1093)

(assert (=> d!60285 (and (or ((_ is Undefined!1093) lt!123518) (not ((_ is Found!1093) lt!123518)) (and (bvsge (index!6543 lt!123518) #b00000000000000000000000000000000) (bvslt (index!6543 lt!123518) (size!6114 (_keys!6683 thiss!1504))))) (or ((_ is Undefined!1093) lt!123518) ((_ is Found!1093) lt!123518) (not ((_ is MissingZero!1093) lt!123518)) (and (bvsge (index!6542 lt!123518) #b00000000000000000000000000000000) (bvslt (index!6542 lt!123518) (size!6114 (_keys!6683 thiss!1504))))) (or ((_ is Undefined!1093) lt!123518) ((_ is Found!1093) lt!123518) ((_ is MissingZero!1093) lt!123518) (not ((_ is MissingVacant!1093) lt!123518)) (and (bvsge (index!6545 lt!123518) #b00000000000000000000000000000000) (bvslt (index!6545 lt!123518) (size!6114 (_keys!6683 thiss!1504))))) (or ((_ is Undefined!1093) lt!123518) (ite ((_ is Found!1093) lt!123518) (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6543 lt!123518)) key!932) (ite ((_ is MissingZero!1093) lt!123518) (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6542 lt!123518)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1093) lt!123518) (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6545 lt!123518)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!160098 () SeekEntryResult!1093)

(assert (=> d!60285 (= lt!123518 e!160098)))

(declare-fun c!41298 () Bool)

(declare-fun lt!123520 () SeekEntryResult!1093)

(assert (=> d!60285 (= c!41298 (and ((_ is Intermediate!1093) lt!123520) (undefined!1905 lt!123520)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12163 (_ BitVec 32)) SeekEntryResult!1093)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60285 (= lt!123520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10691 thiss!1504)) key!932 (_keys!6683 thiss!1504) (mask!10691 thiss!1504)))))

(assert (=> d!60285 (validMask!0 (mask!10691 thiss!1504))))

(assert (=> d!60285 (= (seekEntryOrOpen!0 key!932 (_keys!6683 thiss!1504) (mask!10691 thiss!1504)) lt!123518)))

(declare-fun b!246799 () Bool)

(declare-fun e!160100 () SeekEntryResult!1093)

(assert (=> b!246799 (= e!160098 e!160100)))

(declare-fun lt!123519 () (_ BitVec 64))

(assert (=> b!246799 (= lt!123519 (select (arr!5770 (_keys!6683 thiss!1504)) (index!6544 lt!123520)))))

(declare-fun c!41299 () Bool)

(assert (=> b!246799 (= c!41299 (= lt!123519 key!932))))

(declare-fun b!246800 () Bool)

(assert (=> b!246800 (= e!160098 Undefined!1093)))

(declare-fun b!246801 () Bool)

(assert (=> b!246801 (= e!160100 (Found!1093 (index!6544 lt!123520)))))

(declare-fun b!246802 () Bool)

(declare-fun e!160099 () SeekEntryResult!1093)

(assert (=> b!246802 (= e!160099 (MissingZero!1093 (index!6544 lt!123520)))))

(declare-fun b!246803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12163 (_ BitVec 32)) SeekEntryResult!1093)

(assert (=> b!246803 (= e!160099 (seekKeyOrZeroReturnVacant!0 (x!24484 lt!123520) (index!6544 lt!123520) (index!6544 lt!123520) key!932 (_keys!6683 thiss!1504) (mask!10691 thiss!1504)))))

(declare-fun b!246804 () Bool)

(declare-fun c!41297 () Bool)

(assert (=> b!246804 (= c!41297 (= lt!123519 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246804 (= e!160100 e!160099)))

(assert (= (and d!60285 c!41298) b!246800))

(assert (= (and d!60285 (not c!41298)) b!246799))

(assert (= (and b!246799 c!41299) b!246801))

(assert (= (and b!246799 (not c!41299)) b!246804))

(assert (= (and b!246804 c!41297) b!246802))

(assert (= (and b!246804 (not c!41297)) b!246803))

(declare-fun m!263585 () Bool)

(assert (=> d!60285 m!263585))

(assert (=> d!60285 m!263363))

(declare-fun m!263587 () Bool)

(assert (=> d!60285 m!263587))

(declare-fun m!263589 () Bool)

(assert (=> d!60285 m!263589))

(declare-fun m!263591 () Bool)

(assert (=> d!60285 m!263591))

(assert (=> d!60285 m!263587))

(declare-fun m!263593 () Bool)

(assert (=> d!60285 m!263593))

(declare-fun m!263595 () Bool)

(assert (=> b!246799 m!263595))

(declare-fun m!263597 () Bool)

(assert (=> b!246803 m!263597))

(assert (=> b!246500 d!60285))

(declare-fun b!246821 () Bool)

(declare-fun res!120977 () Bool)

(declare-fun e!160112 () Bool)

(assert (=> b!246821 (=> (not res!120977) (not e!160112))))

(declare-fun call!23088 () Bool)

(assert (=> b!246821 (= res!120977 call!23088)))

(declare-fun e!160109 () Bool)

(assert (=> b!246821 (= e!160109 e!160112)))

(declare-fun b!246822 () Bool)

(declare-fun lt!123525 () SeekEntryResult!1093)

(assert (=> b!246822 (and (bvsge (index!6542 lt!123525) #b00000000000000000000000000000000) (bvslt (index!6542 lt!123525) (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun res!120980 () Bool)

(assert (=> b!246822 (= res!120980 (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6542 lt!123525)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160111 () Bool)

(assert (=> b!246822 (=> (not res!120980) (not e!160111))))

(declare-fun d!60287 () Bool)

(declare-fun e!160110 () Bool)

(assert (=> d!60287 e!160110))

(declare-fun c!41304 () Bool)

(assert (=> d!60287 (= c!41304 ((_ is MissingZero!1093) lt!123525))))

(assert (=> d!60287 (= lt!123525 (seekEntryOrOpen!0 key!932 (_keys!6683 thiss!1504) (mask!10691 thiss!1504)))))

(declare-fun lt!123526 () Unit!7606)

(declare-fun choose!1167 (array!12163 array!12161 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) Int) Unit!7606)

(assert (=> d!60287 (= lt!123526 (choose!1167 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)))))

(assert (=> d!60287 (validMask!0 (mask!10691 thiss!1504))))

(assert (=> d!60287 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (_keys!6683 thiss!1504) (_values!4547 thiss!1504) (mask!10691 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 (defaultEntry!4564 thiss!1504)) lt!123526)))

(declare-fun b!246823 () Bool)

(declare-fun res!120979 () Bool)

(assert (=> b!246823 (=> (not res!120979) (not e!160112))))

(assert (=> b!246823 (= res!120979 (= (select (arr!5770 (_keys!6683 thiss!1504)) (index!6545 lt!123525)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246823 (and (bvsge (index!6545 lt!123525) #b00000000000000000000000000000000) (bvslt (index!6545 lt!123525) (size!6114 (_keys!6683 thiss!1504))))))

(declare-fun bm!23085 () Bool)

(assert (=> bm!23085 (= call!23088 (inRange!0 (ite c!41304 (index!6542 lt!123525) (index!6545 lt!123525)) (mask!10691 thiss!1504)))))

(declare-fun bm!23086 () Bool)

(declare-fun call!23089 () Bool)

(assert (=> bm!23086 (= call!23089 (arrayContainsKey!0 (_keys!6683 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246824 () Bool)

(assert (=> b!246824 (= e!160111 (not call!23089))))

(declare-fun b!246825 () Bool)

(assert (=> b!246825 (= e!160109 ((_ is Undefined!1093) lt!123525))))

(declare-fun b!246826 () Bool)

(assert (=> b!246826 (= e!160110 e!160111)))

(declare-fun res!120978 () Bool)

(assert (=> b!246826 (= res!120978 call!23088)))

(assert (=> b!246826 (=> (not res!120978) (not e!160111))))

(declare-fun b!246827 () Bool)

(assert (=> b!246827 (= e!160112 (not call!23089))))

(declare-fun b!246828 () Bool)

(assert (=> b!246828 (= e!160110 e!160109)))

(declare-fun c!41305 () Bool)

(assert (=> b!246828 (= c!41305 ((_ is MissingVacant!1093) lt!123525))))

(assert (= (and d!60287 c!41304) b!246826))

(assert (= (and d!60287 (not c!41304)) b!246828))

(assert (= (and b!246826 res!120978) b!246822))

(assert (= (and b!246822 res!120980) b!246824))

(assert (= (and b!246828 c!41305) b!246821))

(assert (= (and b!246828 (not c!41305)) b!246825))

(assert (= (and b!246821 res!120977) b!246823))

(assert (= (and b!246823 res!120979) b!246827))

(assert (= (or b!246826 b!246821) bm!23085))

(assert (= (or b!246824 b!246827) bm!23086))

(declare-fun m!263599 () Bool)

(assert (=> bm!23085 m!263599))

(assert (=> bm!23086 m!263355))

(declare-fun m!263601 () Bool)

(assert (=> b!246823 m!263601))

(assert (=> d!60287 m!263383))

(declare-fun m!263603 () Bool)

(assert (=> d!60287 m!263603))

(assert (=> d!60287 m!263363))

(declare-fun m!263605 () Bool)

(assert (=> b!246822 m!263605))

(assert (=> b!246517 d!60287))

(declare-fun condMapEmpty!10928 () Bool)

(declare-fun mapDefault!10928 () ValueCell!2873)

(assert (=> mapNonEmpty!10919 (= condMapEmpty!10928 (= mapRest!10919 ((as const (Array (_ BitVec 32) ValueCell!2873)) mapDefault!10928)))))

(declare-fun e!160118 () Bool)

(declare-fun mapRes!10928 () Bool)

(assert (=> mapNonEmpty!10919 (= tp!22954 (and e!160118 mapRes!10928))))

(declare-fun b!246835 () Bool)

(declare-fun e!160117 () Bool)

(assert (=> b!246835 (= e!160117 tp_is_empty!6433)))

(declare-fun mapIsEmpty!10928 () Bool)

(assert (=> mapIsEmpty!10928 mapRes!10928))

(declare-fun b!246836 () Bool)

(assert (=> b!246836 (= e!160118 tp_is_empty!6433)))

(declare-fun mapNonEmpty!10928 () Bool)

(declare-fun tp!22970 () Bool)

(assert (=> mapNonEmpty!10928 (= mapRes!10928 (and tp!22970 e!160117))))

(declare-fun mapRest!10928 () (Array (_ BitVec 32) ValueCell!2873))

(declare-fun mapKey!10928 () (_ BitVec 32))

(declare-fun mapValue!10928 () ValueCell!2873)

(assert (=> mapNonEmpty!10928 (= mapRest!10919 (store mapRest!10928 mapKey!10928 mapValue!10928))))

(assert (= (and mapNonEmpty!10919 condMapEmpty!10928) mapIsEmpty!10928))

(assert (= (and mapNonEmpty!10919 (not condMapEmpty!10928)) mapNonEmpty!10928))

(assert (= (and mapNonEmpty!10928 ((_ is ValueCellFull!2873) mapValue!10928)) b!246835))

(assert (= (and mapNonEmpty!10919 ((_ is ValueCellFull!2873) mapDefault!10928)) b!246836))

(declare-fun m!263607 () Bool)

(assert (=> mapNonEmpty!10928 m!263607))

(declare-fun b_lambda!8027 () Bool)

(assert (= b_lambda!8025 (or (and b!246513 b_free!6571) b_lambda!8027)))

(check-sat (not d!60253) (not bm!23085) (not b!246650) (not b!246684) (not b_next!6571) (not b!246774) (not bm!23086) (not d!60285) (not bm!23075) (not b!246711) (not b!246719) (not d!60283) (not b!246771) (not b!246657) (not d!60273) (not b!246775) (not b!246773) (not b!246681) (not bm!23076) (not b!246666) (not b_lambda!8027) (not b!246770) (not b!246710) (not b!246781) (not b!246721) (not bm!23080) (not b!246695) (not b!246803) (not b!246698) (not d!60261) (not b!246667) (not bm!23059) (not d!60281) (not b!246669) (not bm!23077) (not bm!23058) (not bm!23055) (not b!246772) (not d!60267) (not mapNonEmpty!10928) (not b!246768) (not d!60287) tp_is_empty!6433 b_and!13549 (not b!246699) (not d!60255) (not b!246712) (not b!246703))
(check-sat b_and!13549 (not b_next!6571))

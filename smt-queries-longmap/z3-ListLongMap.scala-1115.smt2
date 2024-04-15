; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22940 () Bool)

(assert start!22940)

(declare-fun b!239405 () Bool)

(declare-fun b_free!6439 () Bool)

(declare-fun b_next!6439 () Bool)

(assert (=> b!239405 (= b_free!6439 (not b_next!6439))))

(declare-fun tp!22521 () Bool)

(declare-fun b_and!13379 () Bool)

(assert (=> b!239405 (= tp!22521 b_and!13379)))

(declare-fun mapIsEmpty!10683 () Bool)

(declare-fun mapRes!10683 () Bool)

(assert (=> mapIsEmpty!10683 mapRes!10683))

(declare-fun mapNonEmpty!10683 () Bool)

(declare-fun tp!22520 () Bool)

(declare-fun e!155435 () Bool)

(assert (=> mapNonEmpty!10683 (= mapRes!10683 (and tp!22520 e!155435))))

(declare-datatypes ((V!8049 0))(
  ( (V!8050 (val!3195 Int)) )
))
(declare-datatypes ((ValueCell!2807 0))(
  ( (ValueCellFull!2807 (v!5227 V!8049)) (EmptyCell!2807) )
))
(declare-datatypes ((array!11873 0))(
  ( (array!11874 (arr!5637 (Array (_ BitVec 32) ValueCell!2807)) (size!5979 (_ BitVec 32))) )
))
(declare-datatypes ((array!11875 0))(
  ( (array!11876 (arr!5638 (Array (_ BitVec 32) (_ BitVec 64))) (size!5980 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3514 0))(
  ( (LongMapFixedSize!3515 (defaultEntry!4442 Int) (mask!10489 (_ BitVec 32)) (extraKeys!4179 (_ BitVec 32)) (zeroValue!4283 V!8049) (minValue!4283 V!8049) (_size!1806 (_ BitVec 32)) (_keys!6543 array!11875) (_values!4425 array!11873) (_vacant!1806 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3514)

(declare-fun mapRest!10683 () (Array (_ BitVec 32) ValueCell!2807))

(declare-fun mapValue!10683 () ValueCell!2807)

(declare-fun mapKey!10683 () (_ BitVec 32))

(assert (=> mapNonEmpty!10683 (= (arr!5637 (_values!4425 thiss!1504)) (store mapRest!10683 mapKey!10683 mapValue!10683))))

(declare-fun res!117310 () Bool)

(declare-fun e!155431 () Bool)

(assert (=> start!22940 (=> (not res!117310) (not e!155431))))

(declare-fun valid!1391 (LongMapFixedSize!3514) Bool)

(assert (=> start!22940 (= res!117310 (valid!1391 thiss!1504))))

(assert (=> start!22940 e!155431))

(declare-fun e!155430 () Bool)

(assert (=> start!22940 e!155430))

(assert (=> start!22940 true))

(declare-fun b!239393 () Bool)

(declare-fun e!155437 () Bool)

(declare-fun e!155426 () Bool)

(assert (=> b!239393 (= e!155437 e!155426)))

(declare-fun res!117307 () Bool)

(declare-fun call!22254 () Bool)

(assert (=> b!239393 (= res!117307 call!22254)))

(assert (=> b!239393 (=> (not res!117307) (not e!155426))))

(declare-fun bm!22250 () Bool)

(declare-fun call!22253 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22250 (= call!22253 (arrayContainsKey!0 (_keys!6543 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!1031 0))(
  ( (MissingZero!1031 (index!6294 (_ BitVec 32))) (Found!1031 (index!6295 (_ BitVec 32))) (Intermediate!1031 (undefined!1843 Bool) (index!6296 (_ BitVec 32)) (x!24110 (_ BitVec 32))) (Undefined!1031) (MissingVacant!1031 (index!6297 (_ BitVec 32))) )
))
(declare-fun lt!120632 () SeekEntryResult!1031)

(declare-fun c!39901 () Bool)

(declare-fun bm!22251 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22251 (= call!22254 (inRange!0 (ite c!39901 (index!6294 lt!120632) (index!6297 lt!120632)) (mask!10489 thiss!1504)))))

(declare-fun b!239394 () Bool)

(get-info :version)

(assert (=> b!239394 (= e!155437 ((_ is Undefined!1031) lt!120632))))

(declare-fun b!239395 () Bool)

(assert (=> b!239395 (= e!155426 (not call!22253))))

(declare-fun b!239396 () Bool)

(declare-datatypes ((Unit!7347 0))(
  ( (Unit!7348) )
))
(declare-fun e!155428 () Unit!7347)

(declare-fun Unit!7349 () Unit!7347)

(assert (=> b!239396 (= e!155428 Unit!7349)))

(declare-fun lt!120629 () Unit!7347)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!335 (array!11875 array!11873 (_ BitVec 32) (_ BitVec 32) V!8049 V!8049 (_ BitVec 64) Int) Unit!7347)

(assert (=> b!239396 (= lt!120629 (lemmaInListMapThenSeekEntryOrOpenFindsIt!335 (_keys!6543 thiss!1504) (_values!4425 thiss!1504) (mask!10489 thiss!1504) (extraKeys!4179 thiss!1504) (zeroValue!4283 thiss!1504) (minValue!4283 thiss!1504) key!932 (defaultEntry!4442 thiss!1504)))))

(assert (=> b!239396 false))

(declare-fun b!239397 () Bool)

(declare-fun tp_is_empty!6301 () Bool)

(assert (=> b!239397 (= e!155435 tp_is_empty!6301)))

(declare-fun b!239398 () Bool)

(declare-fun res!117304 () Bool)

(declare-fun e!155429 () Bool)

(assert (=> b!239398 (=> (not res!117304) (not e!155429))))

(assert (=> b!239398 (= res!117304 (= (select (arr!5638 (_keys!6543 thiss!1504)) (index!6294 lt!120632)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239399 () Bool)

(declare-fun res!117303 () Bool)

(declare-fun e!155425 () Bool)

(assert (=> b!239399 (=> (not res!117303) (not e!155425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239399 (= res!117303 (validMask!0 (mask!10489 thiss!1504)))))

(declare-fun b!239400 () Bool)

(declare-fun res!117306 () Bool)

(assert (=> b!239400 (= res!117306 (= (select (arr!5638 (_keys!6543 thiss!1504)) (index!6297 lt!120632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239400 (=> (not res!117306) (not e!155426))))

(declare-fun b!239401 () Bool)

(declare-fun e!155434 () Bool)

(declare-fun e!155436 () Bool)

(assert (=> b!239401 (= e!155434 (and e!155436 mapRes!10683))))

(declare-fun condMapEmpty!10683 () Bool)

(declare-fun mapDefault!10683 () ValueCell!2807)

(assert (=> b!239401 (= condMapEmpty!10683 (= (arr!5637 (_values!4425 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2807)) mapDefault!10683)))))

(declare-fun b!239402 () Bool)

(declare-fun c!39902 () Bool)

(assert (=> b!239402 (= c!39902 ((_ is MissingVacant!1031) lt!120632))))

(declare-fun e!155432 () Bool)

(assert (=> b!239402 (= e!155432 e!155437)))

(declare-fun b!239403 () Bool)

(declare-fun e!155433 () Bool)

(assert (=> b!239403 (= e!155433 e!155425)))

(declare-fun res!117309 () Bool)

(assert (=> b!239403 (=> (not res!117309) (not e!155425))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239403 (= res!117309 (inRange!0 index!297 (mask!10489 thiss!1504)))))

(declare-fun lt!120630 () Unit!7347)

(assert (=> b!239403 (= lt!120630 e!155428)))

(declare-fun c!39903 () Bool)

(declare-datatypes ((tuple2!4682 0))(
  ( (tuple2!4683 (_1!2352 (_ BitVec 64)) (_2!2352 V!8049)) )
))
(declare-datatypes ((List!3584 0))(
  ( (Nil!3581) (Cons!3580 (h!4236 tuple2!4682) (t!8570 List!3584)) )
))
(declare-datatypes ((ListLongMap!3585 0))(
  ( (ListLongMap!3586 (toList!1808 List!3584)) )
))
(declare-fun contains!1699 (ListLongMap!3585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1317 (array!11875 array!11873 (_ BitVec 32) (_ BitVec 32) V!8049 V!8049 (_ BitVec 32) Int) ListLongMap!3585)

(assert (=> b!239403 (= c!39903 (contains!1699 (getCurrentListMap!1317 (_keys!6543 thiss!1504) (_values!4425 thiss!1504) (mask!10489 thiss!1504) (extraKeys!4179 thiss!1504) (zeroValue!4283 thiss!1504) (minValue!4283 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4442 thiss!1504)) key!932))))

(declare-fun b!239404 () Bool)

(assert (=> b!239404 (= e!155429 (not call!22253))))

(declare-fun array_inv!3717 (array!11875) Bool)

(declare-fun array_inv!3718 (array!11873) Bool)

(assert (=> b!239405 (= e!155430 (and tp!22521 tp_is_empty!6301 (array_inv!3717 (_keys!6543 thiss!1504)) (array_inv!3718 (_values!4425 thiss!1504)) e!155434))))

(declare-fun b!239406 () Bool)

(assert (=> b!239406 (= e!155436 tp_is_empty!6301)))

(declare-fun b!239407 () Bool)

(assert (=> b!239407 (= e!155431 e!155433)))

(declare-fun res!117308 () Bool)

(assert (=> b!239407 (=> (not res!117308) (not e!155433))))

(assert (=> b!239407 (= res!117308 (or (= lt!120632 (MissingZero!1031 index!297)) (= lt!120632 (MissingVacant!1031 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11875 (_ BitVec 32)) SeekEntryResult!1031)

(assert (=> b!239407 (= lt!120632 (seekEntryOrOpen!0 key!932 (_keys!6543 thiss!1504) (mask!10489 thiss!1504)))))

(declare-fun b!239408 () Bool)

(assert (=> b!239408 (= e!155425 (and (= (size!5979 (_values!4425 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10489 thiss!1504))) (= (size!5980 (_keys!6543 thiss!1504)) (size!5979 (_values!4425 thiss!1504))) (bvsge (mask!10489 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4179 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4179 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239409 () Bool)

(declare-fun res!117312 () Bool)

(assert (=> b!239409 (=> (not res!117312) (not e!155431))))

(assert (=> b!239409 (= res!117312 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239410 () Bool)

(declare-fun res!117305 () Bool)

(assert (=> b!239410 (=> (not res!117305) (not e!155425))))

(assert (=> b!239410 (= res!117305 (arrayContainsKey!0 (_keys!6543 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239411 () Bool)

(declare-fun res!117311 () Bool)

(assert (=> b!239411 (=> (not res!117311) (not e!155429))))

(assert (=> b!239411 (= res!117311 call!22254)))

(assert (=> b!239411 (= e!155432 e!155429)))

(declare-fun b!239412 () Bool)

(declare-fun lt!120631 () Unit!7347)

(assert (=> b!239412 (= e!155428 lt!120631)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!332 (array!11875 array!11873 (_ BitVec 32) (_ BitVec 32) V!8049 V!8049 (_ BitVec 64) Int) Unit!7347)

(assert (=> b!239412 (= lt!120631 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!332 (_keys!6543 thiss!1504) (_values!4425 thiss!1504) (mask!10489 thiss!1504) (extraKeys!4179 thiss!1504) (zeroValue!4283 thiss!1504) (minValue!4283 thiss!1504) key!932 (defaultEntry!4442 thiss!1504)))))

(assert (=> b!239412 (= c!39901 ((_ is MissingZero!1031) lt!120632))))

(assert (=> b!239412 e!155432))

(assert (= (and start!22940 res!117310) b!239409))

(assert (= (and b!239409 res!117312) b!239407))

(assert (= (and b!239407 res!117308) b!239403))

(assert (= (and b!239403 c!39903) b!239396))

(assert (= (and b!239403 (not c!39903)) b!239412))

(assert (= (and b!239412 c!39901) b!239411))

(assert (= (and b!239412 (not c!39901)) b!239402))

(assert (= (and b!239411 res!117311) b!239398))

(assert (= (and b!239398 res!117304) b!239404))

(assert (= (and b!239402 c!39902) b!239393))

(assert (= (and b!239402 (not c!39902)) b!239394))

(assert (= (and b!239393 res!117307) b!239400))

(assert (= (and b!239400 res!117306) b!239395))

(assert (= (or b!239411 b!239393) bm!22251))

(assert (= (or b!239404 b!239395) bm!22250))

(assert (= (and b!239403 res!117309) b!239410))

(assert (= (and b!239410 res!117305) b!239399))

(assert (= (and b!239399 res!117303) b!239408))

(assert (= (and b!239401 condMapEmpty!10683) mapIsEmpty!10683))

(assert (= (and b!239401 (not condMapEmpty!10683)) mapNonEmpty!10683))

(assert (= (and mapNonEmpty!10683 ((_ is ValueCellFull!2807) mapValue!10683)) b!239397))

(assert (= (and b!239401 ((_ is ValueCellFull!2807) mapDefault!10683)) b!239406))

(assert (= b!239405 b!239401))

(assert (= start!22940 b!239405))

(declare-fun m!258943 () Bool)

(assert (=> start!22940 m!258943))

(declare-fun m!258945 () Bool)

(assert (=> b!239403 m!258945))

(declare-fun m!258947 () Bool)

(assert (=> b!239403 m!258947))

(assert (=> b!239403 m!258947))

(declare-fun m!258949 () Bool)

(assert (=> b!239403 m!258949))

(declare-fun m!258951 () Bool)

(assert (=> b!239396 m!258951))

(declare-fun m!258953 () Bool)

(assert (=> b!239407 m!258953))

(declare-fun m!258955 () Bool)

(assert (=> b!239405 m!258955))

(declare-fun m!258957 () Bool)

(assert (=> b!239405 m!258957))

(declare-fun m!258959 () Bool)

(assert (=> b!239412 m!258959))

(declare-fun m!258961 () Bool)

(assert (=> bm!22250 m!258961))

(declare-fun m!258963 () Bool)

(assert (=> b!239399 m!258963))

(assert (=> b!239410 m!258961))

(declare-fun m!258965 () Bool)

(assert (=> bm!22251 m!258965))

(declare-fun m!258967 () Bool)

(assert (=> b!239398 m!258967))

(declare-fun m!258969 () Bool)

(assert (=> mapNonEmpty!10683 m!258969))

(declare-fun m!258971 () Bool)

(assert (=> b!239400 m!258971))

(check-sat (not b!239407) (not b!239403) (not bm!22250) (not start!22940) (not b!239410) (not b!239412) (not b!239399) (not b!239396) (not bm!22251) (not b!239405) (not b_next!6439) b_and!13379 (not mapNonEmpty!10683) tp_is_empty!6301)
(check-sat b_and!13379 (not b_next!6439))

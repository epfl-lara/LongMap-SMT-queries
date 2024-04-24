; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22934 () Bool)

(assert start!22934)

(declare-fun b!239417 () Bool)

(declare-fun b_free!6433 () Bool)

(declare-fun b_next!6433 () Bool)

(assert (=> b!239417 (= b_free!6433 (not b_next!6433))))

(declare-fun tp!22503 () Bool)

(declare-fun b_and!13413 () Bool)

(assert (=> b!239417 (= tp!22503 b_and!13413)))

(declare-fun b!239407 () Bool)

(declare-datatypes ((Unit!7335 0))(
  ( (Unit!7336) )
))
(declare-fun e!155439 () Unit!7335)

(declare-fun Unit!7337 () Unit!7335)

(assert (=> b!239407 (= e!155439 Unit!7337)))

(declare-fun lt!120834 () Unit!7335)

(declare-datatypes ((V!8041 0))(
  ( (V!8042 (val!3192 Int)) )
))
(declare-datatypes ((ValueCell!2804 0))(
  ( (ValueCellFull!2804 (v!5231 V!8041)) (EmptyCell!2804) )
))
(declare-datatypes ((array!11867 0))(
  ( (array!11868 (arr!5635 (Array (_ BitVec 32) ValueCell!2804)) (size!5976 (_ BitVec 32))) )
))
(declare-datatypes ((array!11869 0))(
  ( (array!11870 (arr!5636 (Array (_ BitVec 32) (_ BitVec 64))) (size!5977 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3508 0))(
  ( (LongMapFixedSize!3509 (defaultEntry!4439 Int) (mask!10485 (_ BitVec 32)) (extraKeys!4176 (_ BitVec 32)) (zeroValue!4280 V!8041) (minValue!4280 V!8041) (_size!1803 (_ BitVec 32)) (_keys!6541 array!11869) (_values!4422 array!11867) (_vacant!1803 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3508)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!331 (array!11869 array!11867 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 64) Int) Unit!7335)

(assert (=> b!239407 (= lt!120834 (lemmaInListMapThenSeekEntryOrOpenFindsIt!331 (_keys!6541 thiss!1504) (_values!4422 thiss!1504) (mask!10485 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) key!932 (defaultEntry!4439 thiss!1504)))))

(assert (=> b!239407 false))

(declare-fun b!239408 () Bool)

(declare-fun res!117330 () Bool)

(declare-fun e!155441 () Bool)

(assert (=> b!239408 (=> (not res!117330) (not e!155441))))

(declare-fun call!22248 () Bool)

(assert (=> b!239408 (= res!117330 call!22248)))

(declare-fun e!155438 () Bool)

(assert (=> b!239408 (= e!155438 e!155441)))

(declare-datatypes ((SeekEntryResult!1000 0))(
  ( (MissingZero!1000 (index!6170 (_ BitVec 32))) (Found!1000 (index!6171 (_ BitVec 32))) (Intermediate!1000 (undefined!1812 Bool) (index!6172 (_ BitVec 32)) (x!24072 (_ BitVec 32))) (Undefined!1000) (MissingVacant!1000 (index!6173 (_ BitVec 32))) )
))
(declare-fun lt!120836 () SeekEntryResult!1000)

(declare-fun bm!22244 () Bool)

(declare-fun c!39913 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22244 (= call!22248 (inRange!0 (ite c!39913 (index!6170 lt!120836) (index!6173 lt!120836)) (mask!10485 thiss!1504)))))

(declare-fun b!239409 () Bool)

(declare-fun res!117336 () Bool)

(declare-fun e!155440 () Bool)

(assert (=> b!239409 (=> (not res!117336) (not e!155440))))

(declare-fun arrayContainsKey!0 (array!11869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239409 (= res!117336 (arrayContainsKey!0 (_keys!6541 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239410 () Bool)

(declare-fun res!117332 () Bool)

(assert (=> b!239410 (= res!117332 (= (select (arr!5636 (_keys!6541 thiss!1504)) (index!6173 lt!120836)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155435 () Bool)

(assert (=> b!239410 (=> (not res!117332) (not e!155435))))

(declare-fun b!239411 () Bool)

(declare-fun res!117338 () Bool)

(assert (=> b!239411 (=> (not res!117338) (not e!155441))))

(assert (=> b!239411 (= res!117338 (= (select (arr!5636 (_keys!6541 thiss!1504)) (index!6170 lt!120836)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!117329 () Bool)

(declare-fun e!155442 () Bool)

(assert (=> start!22934 (=> (not res!117329) (not e!155442))))

(declare-fun valid!1395 (LongMapFixedSize!3508) Bool)

(assert (=> start!22934 (= res!117329 (valid!1395 thiss!1504))))

(assert (=> start!22934 e!155442))

(declare-fun e!155444 () Bool)

(assert (=> start!22934 e!155444))

(assert (=> start!22934 true))

(declare-fun b!239412 () Bool)

(declare-fun e!155443 () Bool)

(assert (=> b!239412 (= e!155442 e!155443)))

(declare-fun res!117334 () Bool)

(assert (=> b!239412 (=> (not res!117334) (not e!155443))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239412 (= res!117334 (or (= lt!120836 (MissingZero!1000 index!297)) (= lt!120836 (MissingVacant!1000 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11869 (_ BitVec 32)) SeekEntryResult!1000)

(assert (=> b!239412 (= lt!120836 (seekEntryOrOpen!0 key!932 (_keys!6541 thiss!1504) (mask!10485 thiss!1504)))))

(declare-fun mapIsEmpty!10674 () Bool)

(declare-fun mapRes!10674 () Bool)

(assert (=> mapIsEmpty!10674 mapRes!10674))

(declare-fun b!239413 () Bool)

(assert (=> b!239413 (= e!155440 (and (= (size!5976 (_values!4422 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10485 thiss!1504))) (= (size!5977 (_keys!6541 thiss!1504)) (size!5976 (_values!4422 thiss!1504))) (bvsge (mask!10485 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4176 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!239414 () Bool)

(declare-fun lt!120833 () Unit!7335)

(assert (=> b!239414 (= e!155439 lt!120833)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!323 (array!11869 array!11867 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 64) Int) Unit!7335)

(assert (=> b!239414 (= lt!120833 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!323 (_keys!6541 thiss!1504) (_values!4422 thiss!1504) (mask!10485 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) key!932 (defaultEntry!4439 thiss!1504)))))

(get-info :version)

(assert (=> b!239414 (= c!39913 ((_ is MissingZero!1000) lt!120836))))

(assert (=> b!239414 e!155438))

(declare-fun bm!22245 () Bool)

(declare-fun call!22247 () Bool)

(assert (=> bm!22245 (= call!22247 (arrayContainsKey!0 (_keys!6541 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239415 () Bool)

(declare-fun res!117331 () Bool)

(assert (=> b!239415 (=> (not res!117331) (not e!155442))))

(assert (=> b!239415 (= res!117331 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239416 () Bool)

(assert (=> b!239416 (= e!155441 (not call!22247))))

(declare-fun e!155433 () Bool)

(declare-fun tp_is_empty!6295 () Bool)

(declare-fun array_inv!3705 (array!11869) Bool)

(declare-fun array_inv!3706 (array!11867) Bool)

(assert (=> b!239417 (= e!155444 (and tp!22503 tp_is_empty!6295 (array_inv!3705 (_keys!6541 thiss!1504)) (array_inv!3706 (_values!4422 thiss!1504)) e!155433))))

(declare-fun b!239418 () Bool)

(declare-fun e!155434 () Bool)

(assert (=> b!239418 (= e!155434 tp_is_empty!6295)))

(declare-fun b!239419 () Bool)

(declare-fun c!39914 () Bool)

(assert (=> b!239419 (= c!39914 ((_ is MissingVacant!1000) lt!120836))))

(declare-fun e!155436 () Bool)

(assert (=> b!239419 (= e!155438 e!155436)))

(declare-fun b!239420 () Bool)

(declare-fun res!117333 () Bool)

(assert (=> b!239420 (=> (not res!117333) (not e!155440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239420 (= res!117333 (validMask!0 (mask!10485 thiss!1504)))))

(declare-fun b!239421 () Bool)

(assert (=> b!239421 (= e!155433 (and e!155434 mapRes!10674))))

(declare-fun condMapEmpty!10674 () Bool)

(declare-fun mapDefault!10674 () ValueCell!2804)

(assert (=> b!239421 (= condMapEmpty!10674 (= (arr!5635 (_values!4422 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2804)) mapDefault!10674)))))

(declare-fun b!239422 () Bool)

(declare-fun e!155437 () Bool)

(assert (=> b!239422 (= e!155437 tp_is_empty!6295)))

(declare-fun b!239423 () Bool)

(assert (=> b!239423 (= e!155436 e!155435)))

(declare-fun res!117335 () Bool)

(assert (=> b!239423 (= res!117335 call!22248)))

(assert (=> b!239423 (=> (not res!117335) (not e!155435))))

(declare-fun b!239424 () Bool)

(assert (=> b!239424 (= e!155443 e!155440)))

(declare-fun res!117337 () Bool)

(assert (=> b!239424 (=> (not res!117337) (not e!155440))))

(assert (=> b!239424 (= res!117337 (inRange!0 index!297 (mask!10485 thiss!1504)))))

(declare-fun lt!120835 () Unit!7335)

(assert (=> b!239424 (= lt!120835 e!155439)))

(declare-fun c!39915 () Bool)

(declare-datatypes ((tuple2!4632 0))(
  ( (tuple2!4633 (_1!2327 (_ BitVec 64)) (_2!2327 V!8041)) )
))
(declare-datatypes ((List!3513 0))(
  ( (Nil!3510) (Cons!3509 (h!4165 tuple2!4632) (t!8500 List!3513)) )
))
(declare-datatypes ((ListLongMap!3547 0))(
  ( (ListLongMap!3548 (toList!1789 List!3513)) )
))
(declare-fun contains!1691 (ListLongMap!3547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1321 (array!11869 array!11867 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 32) Int) ListLongMap!3547)

(assert (=> b!239424 (= c!39915 (contains!1691 (getCurrentListMap!1321 (_keys!6541 thiss!1504) (_values!4422 thiss!1504) (mask!10485 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4439 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10674 () Bool)

(declare-fun tp!22502 () Bool)

(assert (=> mapNonEmpty!10674 (= mapRes!10674 (and tp!22502 e!155437))))

(declare-fun mapValue!10674 () ValueCell!2804)

(declare-fun mapRest!10674 () (Array (_ BitVec 32) ValueCell!2804))

(declare-fun mapKey!10674 () (_ BitVec 32))

(assert (=> mapNonEmpty!10674 (= (arr!5635 (_values!4422 thiss!1504)) (store mapRest!10674 mapKey!10674 mapValue!10674))))

(declare-fun b!239425 () Bool)

(assert (=> b!239425 (= e!155436 ((_ is Undefined!1000) lt!120836))))

(declare-fun b!239426 () Bool)

(assert (=> b!239426 (= e!155435 (not call!22247))))

(assert (= (and start!22934 res!117329) b!239415))

(assert (= (and b!239415 res!117331) b!239412))

(assert (= (and b!239412 res!117334) b!239424))

(assert (= (and b!239424 c!39915) b!239407))

(assert (= (and b!239424 (not c!39915)) b!239414))

(assert (= (and b!239414 c!39913) b!239408))

(assert (= (and b!239414 (not c!39913)) b!239419))

(assert (= (and b!239408 res!117330) b!239411))

(assert (= (and b!239411 res!117338) b!239416))

(assert (= (and b!239419 c!39914) b!239423))

(assert (= (and b!239419 (not c!39914)) b!239425))

(assert (= (and b!239423 res!117335) b!239410))

(assert (= (and b!239410 res!117332) b!239426))

(assert (= (or b!239408 b!239423) bm!22244))

(assert (= (or b!239416 b!239426) bm!22245))

(assert (= (and b!239424 res!117337) b!239409))

(assert (= (and b!239409 res!117336) b!239420))

(assert (= (and b!239420 res!117333) b!239413))

(assert (= (and b!239421 condMapEmpty!10674) mapIsEmpty!10674))

(assert (= (and b!239421 (not condMapEmpty!10674)) mapNonEmpty!10674))

(assert (= (and mapNonEmpty!10674 ((_ is ValueCellFull!2804) mapValue!10674)) b!239422))

(assert (= (and b!239421 ((_ is ValueCellFull!2804) mapDefault!10674)) b!239418))

(assert (= b!239417 b!239421))

(assert (= start!22934 b!239417))

(declare-fun m!259651 () Bool)

(assert (=> b!239417 m!259651))

(declare-fun m!259653 () Bool)

(assert (=> b!239417 m!259653))

(declare-fun m!259655 () Bool)

(assert (=> b!239420 m!259655))

(declare-fun m!259657 () Bool)

(assert (=> mapNonEmpty!10674 m!259657))

(declare-fun m!259659 () Bool)

(assert (=> b!239409 m!259659))

(declare-fun m!259661 () Bool)

(assert (=> b!239407 m!259661))

(declare-fun m!259663 () Bool)

(assert (=> b!239414 m!259663))

(declare-fun m!259665 () Bool)

(assert (=> b!239410 m!259665))

(declare-fun m!259667 () Bool)

(assert (=> start!22934 m!259667))

(declare-fun m!259669 () Bool)

(assert (=> bm!22244 m!259669))

(declare-fun m!259671 () Bool)

(assert (=> b!239412 m!259671))

(assert (=> bm!22245 m!259659))

(declare-fun m!259673 () Bool)

(assert (=> b!239411 m!259673))

(declare-fun m!259675 () Bool)

(assert (=> b!239424 m!259675))

(declare-fun m!259677 () Bool)

(assert (=> b!239424 m!259677))

(assert (=> b!239424 m!259677))

(declare-fun m!259679 () Bool)

(assert (=> b!239424 m!259679))

(check-sat (not b_next!6433) (not b!239409) (not b!239417) b_and!13413 (not bm!22244) (not b!239407) (not bm!22245) (not b!239424) (not b!239412) (not b!239414) (not mapNonEmpty!10674) (not b!239420) (not start!22934) tp_is_empty!6295)
(check-sat b_and!13413 (not b_next!6433))

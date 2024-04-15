; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22976 () Bool)

(assert start!22976)

(declare-fun b!240585 () Bool)

(declare-fun b_free!6475 () Bool)

(declare-fun b_next!6475 () Bool)

(assert (=> b!240585 (= b_free!6475 (not b_next!6475))))

(declare-fun tp!22628 () Bool)

(declare-fun b_and!13415 () Bool)

(assert (=> b!240585 (= tp!22628 b_and!13415)))

(declare-fun mapIsEmpty!10737 () Bool)

(declare-fun mapRes!10737 () Bool)

(assert (=> mapIsEmpty!10737 mapRes!10737))

(declare-fun b!240579 () Bool)

(declare-fun res!117951 () Bool)

(declare-fun e!156130 () Bool)

(assert (=> b!240579 (=> (not res!117951) (not e!156130))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!240579 (= res!117951 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!117953 () Bool)

(assert (=> start!22976 (=> (not res!117953) (not e!156130))))

(declare-datatypes ((V!8097 0))(
  ( (V!8098 (val!3213 Int)) )
))
(declare-datatypes ((ValueCell!2825 0))(
  ( (ValueCellFull!2825 (v!5245 V!8097)) (EmptyCell!2825) )
))
(declare-datatypes ((array!11945 0))(
  ( (array!11946 (arr!5673 (Array (_ BitVec 32) ValueCell!2825)) (size!6015 (_ BitVec 32))) )
))
(declare-datatypes ((array!11947 0))(
  ( (array!11948 (arr!5674 (Array (_ BitVec 32) (_ BitVec 64))) (size!6016 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3550 0))(
  ( (LongMapFixedSize!3551 (defaultEntry!4460 Int) (mask!10519 (_ BitVec 32)) (extraKeys!4197 (_ BitVec 32)) (zeroValue!4301 V!8097) (minValue!4301 V!8097) (_size!1824 (_ BitVec 32)) (_keys!6561 array!11947) (_values!4443 array!11945) (_vacant!1824 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3550)

(declare-fun valid!1401 (LongMapFixedSize!3550) Bool)

(assert (=> start!22976 (= res!117953 (valid!1401 thiss!1504))))

(assert (=> start!22976 e!156130))

(declare-fun e!156129 () Bool)

(assert (=> start!22976 e!156129))

(assert (=> start!22976 true))

(declare-fun mapNonEmpty!10737 () Bool)

(declare-fun tp!22629 () Bool)

(declare-fun e!156139 () Bool)

(assert (=> mapNonEmpty!10737 (= mapRes!10737 (and tp!22629 e!156139))))

(declare-fun mapRest!10737 () (Array (_ BitVec 32) ValueCell!2825))

(declare-fun mapKey!10737 () (_ BitVec 32))

(declare-fun mapValue!10737 () ValueCell!2825)

(assert (=> mapNonEmpty!10737 (= (arr!5673 (_values!4443 thiss!1504)) (store mapRest!10737 mapKey!10737 mapValue!10737))))

(declare-fun b!240580 () Bool)

(declare-fun res!117950 () Bool)

(declare-fun e!156135 () Bool)

(assert (=> b!240580 (=> (not res!117950) (not e!156135))))

(declare-datatypes ((SeekEntryResult!1049 0))(
  ( (MissingZero!1049 (index!6366 (_ BitVec 32))) (Found!1049 (index!6367 (_ BitVec 32))) (Intermediate!1049 (undefined!1861 Bool) (index!6368 (_ BitVec 32)) (x!24176 (_ BitVec 32))) (Undefined!1049) (MissingVacant!1049 (index!6369 (_ BitVec 32))) )
))
(declare-fun lt!120861 () SeekEntryResult!1049)

(assert (=> b!240580 (= res!117950 (= (select (arr!5674 (_keys!6561 thiss!1504)) (index!6366 lt!120861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240581 () Bool)

(declare-datatypes ((Unit!7393 0))(
  ( (Unit!7394) )
))
(declare-fun e!156127 () Unit!7393)

(declare-fun Unit!7395 () Unit!7393)

(assert (=> b!240581 (= e!156127 Unit!7395)))

(declare-fun lt!120859 () Unit!7393)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!347 (array!11947 array!11945 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 64) Int) Unit!7393)

(assert (=> b!240581 (= lt!120859 (lemmaInListMapThenSeekEntryOrOpenFindsIt!347 (_keys!6561 thiss!1504) (_values!4443 thiss!1504) (mask!10519 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) key!932 (defaultEntry!4460 thiss!1504)))))

(assert (=> b!240581 false))

(declare-fun b!240582 () Bool)

(declare-fun e!156134 () Bool)

(get-info :version)

(assert (=> b!240582 (= e!156134 ((_ is Undefined!1049) lt!120861))))

(declare-fun b!240583 () Bool)

(declare-fun e!156128 () Bool)

(assert (=> b!240583 (= e!156130 e!156128)))

(declare-fun res!117949 () Bool)

(assert (=> b!240583 (=> (not res!117949) (not e!156128))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240583 (= res!117949 (or (= lt!120861 (MissingZero!1049 index!297)) (= lt!120861 (MissingVacant!1049 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11947 (_ BitVec 32)) SeekEntryResult!1049)

(assert (=> b!240583 (= lt!120861 (seekEntryOrOpen!0 key!932 (_keys!6561 thiss!1504) (mask!10519 thiss!1504)))))

(declare-fun b!240584 () Bool)

(declare-fun e!156132 () Bool)

(assert (=> b!240584 (= e!156134 e!156132)))

(declare-fun res!117955 () Bool)

(declare-fun call!22362 () Bool)

(assert (=> b!240584 (= res!117955 call!22362)))

(assert (=> b!240584 (=> (not res!117955) (not e!156132))))

(declare-fun tp_is_empty!6337 () Bool)

(declare-fun e!156137 () Bool)

(declare-fun array_inv!3741 (array!11947) Bool)

(declare-fun array_inv!3742 (array!11945) Bool)

(assert (=> b!240585 (= e!156129 (and tp!22628 tp_is_empty!6337 (array_inv!3741 (_keys!6561 thiss!1504)) (array_inv!3742 (_values!4443 thiss!1504)) e!156137))))

(declare-fun b!240586 () Bool)

(declare-fun res!117956 () Bool)

(assert (=> b!240586 (= res!117956 (= (select (arr!5674 (_keys!6561 thiss!1504)) (index!6369 lt!120861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240586 (=> (not res!117956) (not e!156132))))

(declare-fun b!240587 () Bool)

(declare-fun c!40064 () Bool)

(assert (=> b!240587 (= c!40064 ((_ is MissingVacant!1049) lt!120861))))

(declare-fun e!156133 () Bool)

(assert (=> b!240587 (= e!156133 e!156134)))

(declare-fun b!240588 () Bool)

(declare-fun e!156131 () Bool)

(assert (=> b!240588 (= e!156137 (and e!156131 mapRes!10737))))

(declare-fun condMapEmpty!10737 () Bool)

(declare-fun mapDefault!10737 () ValueCell!2825)

(assert (=> b!240588 (= condMapEmpty!10737 (= (arr!5673 (_values!4443 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2825)) mapDefault!10737)))))

(declare-fun b!240589 () Bool)

(declare-fun call!22361 () Bool)

(assert (=> b!240589 (= e!156132 (not call!22361))))

(declare-fun b!240590 () Bool)

(assert (=> b!240590 (= e!156139 tp_is_empty!6337)))

(declare-fun b!240591 () Bool)

(declare-fun res!117954 () Bool)

(declare-fun e!156136 () Bool)

(assert (=> b!240591 (=> (not res!117954) (not e!156136))))

(declare-fun arrayContainsKey!0 (array!11947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240591 (= res!117954 (arrayContainsKey!0 (_keys!6561 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240592 () Bool)

(assert (=> b!240592 (= e!156136 (not false))))

(declare-fun lt!120858 () Bool)

(assert (=> b!240592 lt!120858))

(declare-fun lt!120860 () Unit!7393)

(declare-fun lemmaArrayContainsKeyThenInListMap!161 (array!11947 array!11945 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 64) (_ BitVec 32) Int) Unit!7393)

(assert (=> b!240592 (= lt!120860 (lemmaArrayContainsKeyThenInListMap!161 (_keys!6561 thiss!1504) (_values!4443 thiss!1504) (mask!10519 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4460 thiss!1504)))))

(declare-fun c!40063 () Bool)

(declare-fun bm!22358 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22358 (= call!22362 (inRange!0 (ite c!40063 (index!6366 lt!120861) (index!6369 lt!120861)) (mask!10519 thiss!1504)))))

(declare-fun bm!22359 () Bool)

(assert (=> bm!22359 (= call!22361 (arrayContainsKey!0 (_keys!6561 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240593 () Bool)

(declare-fun lt!120862 () Unit!7393)

(assert (=> b!240593 (= e!156127 lt!120862)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!348 (array!11947 array!11945 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 64) Int) Unit!7393)

(assert (=> b!240593 (= lt!120862 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!348 (_keys!6561 thiss!1504) (_values!4443 thiss!1504) (mask!10519 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) key!932 (defaultEntry!4460 thiss!1504)))))

(assert (=> b!240593 (= c!40063 ((_ is MissingZero!1049) lt!120861))))

(assert (=> b!240593 e!156133))

(declare-fun b!240594 () Bool)

(assert (=> b!240594 (= e!156128 e!156136)))

(declare-fun res!117952 () Bool)

(assert (=> b!240594 (=> (not res!117952) (not e!156136))))

(assert (=> b!240594 (= res!117952 (inRange!0 index!297 (mask!10519 thiss!1504)))))

(declare-fun lt!120863 () Unit!7393)

(assert (=> b!240594 (= lt!120863 e!156127)))

(declare-fun c!40065 () Bool)

(assert (=> b!240594 (= c!40065 lt!120858)))

(declare-datatypes ((tuple2!4706 0))(
  ( (tuple2!4707 (_1!2364 (_ BitVec 64)) (_2!2364 V!8097)) )
))
(declare-datatypes ((List!3607 0))(
  ( (Nil!3604) (Cons!3603 (h!4259 tuple2!4706) (t!8593 List!3607)) )
))
(declare-datatypes ((ListLongMap!3609 0))(
  ( (ListLongMap!3610 (toList!1820 List!3607)) )
))
(declare-fun contains!1711 (ListLongMap!3609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1329 (array!11947 array!11945 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 32) Int) ListLongMap!3609)

(assert (=> b!240594 (= lt!120858 (contains!1711 (getCurrentListMap!1329 (_keys!6561 thiss!1504) (_values!4443 thiss!1504) (mask!10519 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4460 thiss!1504)) key!932))))

(declare-fun b!240595 () Bool)

(declare-fun res!117957 () Bool)

(assert (=> b!240595 (=> (not res!117957) (not e!156135))))

(assert (=> b!240595 (= res!117957 call!22362)))

(assert (=> b!240595 (= e!156133 e!156135)))

(declare-fun b!240596 () Bool)

(assert (=> b!240596 (= e!156131 tp_is_empty!6337)))

(declare-fun b!240597 () Bool)

(assert (=> b!240597 (= e!156135 (not call!22361))))

(assert (= (and start!22976 res!117953) b!240579))

(assert (= (and b!240579 res!117951) b!240583))

(assert (= (and b!240583 res!117949) b!240594))

(assert (= (and b!240594 c!40065) b!240581))

(assert (= (and b!240594 (not c!40065)) b!240593))

(assert (= (and b!240593 c!40063) b!240595))

(assert (= (and b!240593 (not c!40063)) b!240587))

(assert (= (and b!240595 res!117957) b!240580))

(assert (= (and b!240580 res!117950) b!240597))

(assert (= (and b!240587 c!40064) b!240584))

(assert (= (and b!240587 (not c!40064)) b!240582))

(assert (= (and b!240584 res!117955) b!240586))

(assert (= (and b!240586 res!117956) b!240589))

(assert (= (or b!240595 b!240584) bm!22358))

(assert (= (or b!240597 b!240589) bm!22359))

(assert (= (and b!240594 res!117952) b!240591))

(assert (= (and b!240591 res!117954) b!240592))

(assert (= (and b!240588 condMapEmpty!10737) mapIsEmpty!10737))

(assert (= (and b!240588 (not condMapEmpty!10737)) mapNonEmpty!10737))

(assert (= (and mapNonEmpty!10737 ((_ is ValueCellFull!2825) mapValue!10737)) b!240590))

(assert (= (and b!240588 ((_ is ValueCellFull!2825) mapDefault!10737)) b!240596))

(assert (= b!240585 b!240588))

(assert (= start!22976 b!240585))

(declare-fun m!259549 () Bool)

(assert (=> mapNonEmpty!10737 m!259549))

(declare-fun m!259551 () Bool)

(assert (=> b!240583 m!259551))

(declare-fun m!259553 () Bool)

(assert (=> b!240592 m!259553))

(declare-fun m!259555 () Bool)

(assert (=> bm!22358 m!259555))

(declare-fun m!259557 () Bool)

(assert (=> b!240591 m!259557))

(declare-fun m!259559 () Bool)

(assert (=> start!22976 m!259559))

(assert (=> bm!22359 m!259557))

(declare-fun m!259561 () Bool)

(assert (=> b!240580 m!259561))

(declare-fun m!259563 () Bool)

(assert (=> b!240581 m!259563))

(declare-fun m!259565 () Bool)

(assert (=> b!240593 m!259565))

(declare-fun m!259567 () Bool)

(assert (=> b!240586 m!259567))

(declare-fun m!259569 () Bool)

(assert (=> b!240585 m!259569))

(declare-fun m!259571 () Bool)

(assert (=> b!240585 m!259571))

(declare-fun m!259573 () Bool)

(assert (=> b!240594 m!259573))

(declare-fun m!259575 () Bool)

(assert (=> b!240594 m!259575))

(assert (=> b!240594 m!259575))

(declare-fun m!259577 () Bool)

(assert (=> b!240594 m!259577))

(check-sat (not b!240581) (not b!240591) (not b!240585) (not start!22976) (not b!240593) (not b!240583) (not b!240592) (not b_next!6475) b_and!13415 tp_is_empty!6337 (not bm!22358) (not b!240594) (not mapNonEmpty!10737) (not bm!22359))
(check-sat b_and!13415 (not b_next!6475))

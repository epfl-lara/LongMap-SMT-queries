; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22938 () Bool)

(assert start!22938)

(declare-fun b!239607 () Bool)

(declare-fun b_free!6441 () Bool)

(declare-fun b_next!6441 () Bool)

(assert (=> b!239607 (= b_free!6441 (not b_next!6441))))

(declare-fun tp!22527 () Bool)

(declare-fun b_and!13407 () Bool)

(assert (=> b!239607 (= tp!22527 b_and!13407)))

(declare-fun b!239600 () Bool)

(declare-fun res!117435 () Bool)

(declare-fun e!155576 () Bool)

(assert (=> b!239600 (=> (not res!117435) (not e!155576))))

(declare-datatypes ((V!8051 0))(
  ( (V!8052 (val!3196 Int)) )
))
(declare-datatypes ((ValueCell!2808 0))(
  ( (ValueCellFull!2808 (v!5234 V!8051)) (EmptyCell!2808) )
))
(declare-datatypes ((array!11885 0))(
  ( (array!11886 (arr!5644 (Array (_ BitVec 32) ValueCell!2808)) (size!5985 (_ BitVec 32))) )
))
(declare-datatypes ((array!11887 0))(
  ( (array!11888 (arr!5645 (Array (_ BitVec 32) (_ BitVec 64))) (size!5986 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3516 0))(
  ( (LongMapFixedSize!3517 (defaultEntry!4443 Int) (mask!10491 (_ BitVec 32)) (extraKeys!4180 (_ BitVec 32)) (zeroValue!4284 V!8051) (minValue!4284 V!8051) (_size!1807 (_ BitVec 32)) (_keys!6545 array!11887) (_values!4426 array!11885) (_vacant!1807 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3516)

(declare-datatypes ((SeekEntryResult!1034 0))(
  ( (MissingZero!1034 (index!6306 (_ BitVec 32))) (Found!1034 (index!6307 (_ BitVec 32))) (Intermediate!1034 (undefined!1846 Bool) (index!6308 (_ BitVec 32)) (x!24114 (_ BitVec 32))) (Undefined!1034) (MissingVacant!1034 (index!6309 (_ BitVec 32))) )
))
(declare-fun lt!120824 () SeekEntryResult!1034)

(assert (=> b!239600 (= res!117435 (= (select (arr!5645 (_keys!6545 thiss!1504)) (index!6306 lt!120824)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239601 () Bool)

(declare-fun e!155570 () Bool)

(declare-fun e!155571 () Bool)

(assert (=> b!239601 (= e!155570 e!155571)))

(declare-fun res!117432 () Bool)

(declare-fun call!22284 () Bool)

(assert (=> b!239601 (= res!117432 call!22284)))

(assert (=> b!239601 (=> (not res!117432) (not e!155571))))

(declare-fun b!239602 () Bool)

(declare-fun res!117433 () Bool)

(declare-fun e!155573 () Bool)

(assert (=> b!239602 (=> (not res!117433) (not e!155573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239602 (= res!117433 (validMask!0 (mask!10491 thiss!1504)))))

(declare-fun bm!22280 () Bool)

(declare-fun call!22283 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22280 (= call!22283 (arrayContainsKey!0 (_keys!6545 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239603 () Bool)

(declare-fun e!155569 () Bool)

(assert (=> b!239603 (= e!155569 e!155573)))

(declare-fun res!117434 () Bool)

(assert (=> b!239603 (=> (not res!117434) (not e!155573))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239603 (= res!117434 (inRange!0 index!297 (mask!10491 thiss!1504)))))

(declare-datatypes ((Unit!7359 0))(
  ( (Unit!7360) )
))
(declare-fun lt!120823 () Unit!7359)

(declare-fun e!155577 () Unit!7359)

(assert (=> b!239603 (= lt!120823 e!155577)))

(declare-fun c!39937 () Bool)

(declare-datatypes ((tuple2!4708 0))(
  ( (tuple2!4709 (_1!2365 (_ BitVec 64)) (_2!2365 V!8051)) )
))
(declare-datatypes ((List!3596 0))(
  ( (Nil!3593) (Cons!3592 (h!4248 tuple2!4708) (t!8591 List!3596)) )
))
(declare-datatypes ((ListLongMap!3621 0))(
  ( (ListLongMap!3622 (toList!1826 List!3596)) )
))
(declare-fun contains!1714 (ListLongMap!3621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1354 (array!11887 array!11885 (_ BitVec 32) (_ BitVec 32) V!8051 V!8051 (_ BitVec 32) Int) ListLongMap!3621)

(assert (=> b!239603 (= c!39937 (contains!1714 (getCurrentListMap!1354 (_keys!6545 thiss!1504) (_values!4426 thiss!1504) (mask!10491 thiss!1504) (extraKeys!4180 thiss!1504) (zeroValue!4284 thiss!1504) (minValue!4284 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4443 thiss!1504)) key!932))))

(declare-fun b!239604 () Bool)

(declare-fun e!155567 () Bool)

(assert (=> b!239604 (= e!155567 e!155569)))

(declare-fun res!117430 () Bool)

(assert (=> b!239604 (=> (not res!117430) (not e!155569))))

(assert (=> b!239604 (= res!117430 (or (= lt!120824 (MissingZero!1034 index!297)) (= lt!120824 (MissingVacant!1034 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11887 (_ BitVec 32)) SeekEntryResult!1034)

(assert (=> b!239604 (= lt!120824 (seekEntryOrOpen!0 key!932 (_keys!6545 thiss!1504) (mask!10491 thiss!1504)))))

(declare-fun mapIsEmpty!10686 () Bool)

(declare-fun mapRes!10686 () Bool)

(assert (=> mapIsEmpty!10686 mapRes!10686))

(declare-fun b!239606 () Bool)

(get-info :version)

(assert (=> b!239606 (= e!155570 ((_ is Undefined!1034) lt!120824))))

(declare-fun e!155572 () Bool)

(declare-fun tp_is_empty!6303 () Bool)

(declare-fun e!155565 () Bool)

(declare-fun array_inv!3733 (array!11887) Bool)

(declare-fun array_inv!3734 (array!11885) Bool)

(assert (=> b!239607 (= e!155572 (and tp!22527 tp_is_empty!6303 (array_inv!3733 (_keys!6545 thiss!1504)) (array_inv!3734 (_values!4426 thiss!1504)) e!155565))))

(declare-fun b!239608 () Bool)

(declare-fun res!117437 () Bool)

(assert (=> b!239608 (=> (not res!117437) (not e!155567))))

(assert (=> b!239608 (= res!117437 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239609 () Bool)

(declare-fun c!39938 () Bool)

(assert (=> b!239609 (= c!39938 ((_ is MissingVacant!1034) lt!120824))))

(declare-fun e!155568 () Bool)

(assert (=> b!239609 (= e!155568 e!155570)))

(declare-fun b!239610 () Bool)

(declare-fun res!117428 () Bool)

(assert (=> b!239610 (=> (not res!117428) (not e!155573))))

(assert (=> b!239610 (= res!117428 (arrayContainsKey!0 (_keys!6545 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239611 () Bool)

(assert (=> b!239611 (= e!155571 (not call!22283))))

(declare-fun b!239612 () Bool)

(declare-fun Unit!7361 () Unit!7359)

(assert (=> b!239612 (= e!155577 Unit!7361)))

(declare-fun lt!120825 () Unit!7359)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!329 (array!11887 array!11885 (_ BitVec 32) (_ BitVec 32) V!8051 V!8051 (_ BitVec 64) Int) Unit!7359)

(assert (=> b!239612 (= lt!120825 (lemmaInListMapThenSeekEntryOrOpenFindsIt!329 (_keys!6545 thiss!1504) (_values!4426 thiss!1504) (mask!10491 thiss!1504) (extraKeys!4180 thiss!1504) (zeroValue!4284 thiss!1504) (minValue!4284 thiss!1504) key!932 (defaultEntry!4443 thiss!1504)))))

(assert (=> b!239612 false))

(declare-fun b!239605 () Bool)

(declare-fun res!117436 () Bool)

(assert (=> b!239605 (=> (not res!117436) (not e!155576))))

(assert (=> b!239605 (= res!117436 call!22284)))

(assert (=> b!239605 (= e!155568 e!155576)))

(declare-fun res!117431 () Bool)

(assert (=> start!22938 (=> (not res!117431) (not e!155567))))

(declare-fun valid!1386 (LongMapFixedSize!3516) Bool)

(assert (=> start!22938 (= res!117431 (valid!1386 thiss!1504))))

(assert (=> start!22938 e!155567))

(assert (=> start!22938 e!155572))

(assert (=> start!22938 true))

(declare-fun mapNonEmpty!10686 () Bool)

(declare-fun tp!22526 () Bool)

(declare-fun e!155575 () Bool)

(assert (=> mapNonEmpty!10686 (= mapRes!10686 (and tp!22526 e!155575))))

(declare-fun mapValue!10686 () ValueCell!2808)

(declare-fun mapKey!10686 () (_ BitVec 32))

(declare-fun mapRest!10686 () (Array (_ BitVec 32) ValueCell!2808))

(assert (=> mapNonEmpty!10686 (= (arr!5644 (_values!4426 thiss!1504)) (store mapRest!10686 mapKey!10686 mapValue!10686))))

(declare-fun b!239613 () Bool)

(assert (=> b!239613 (= e!155576 (not call!22283))))

(declare-fun b!239614 () Bool)

(assert (=> b!239614 (= e!155575 tp_is_empty!6303)))

(declare-fun b!239615 () Bool)

(assert (=> b!239615 (= e!155573 (and (= (size!5985 (_values!4426 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10491 thiss!1504))) (= (size!5986 (_keys!6545 thiss!1504)) (size!5985 (_values!4426 thiss!1504))) (bvsge (mask!10491 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4180 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4180 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239616 () Bool)

(declare-fun e!155574 () Bool)

(assert (=> b!239616 (= e!155574 tp_is_empty!6303)))

(declare-fun b!239617 () Bool)

(declare-fun res!117429 () Bool)

(assert (=> b!239617 (= res!117429 (= (select (arr!5645 (_keys!6545 thiss!1504)) (index!6309 lt!120824)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239617 (=> (not res!117429) (not e!155571))))

(declare-fun b!239618 () Bool)

(declare-fun lt!120822 () Unit!7359)

(assert (=> b!239618 (= e!155577 lt!120822)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!345 (array!11887 array!11885 (_ BitVec 32) (_ BitVec 32) V!8051 V!8051 (_ BitVec 64) Int) Unit!7359)

(assert (=> b!239618 (= lt!120822 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!345 (_keys!6545 thiss!1504) (_values!4426 thiss!1504) (mask!10491 thiss!1504) (extraKeys!4180 thiss!1504) (zeroValue!4284 thiss!1504) (minValue!4284 thiss!1504) key!932 (defaultEntry!4443 thiss!1504)))))

(declare-fun c!39936 () Bool)

(assert (=> b!239618 (= c!39936 ((_ is MissingZero!1034) lt!120824))))

(assert (=> b!239618 e!155568))

(declare-fun b!239619 () Bool)

(assert (=> b!239619 (= e!155565 (and e!155574 mapRes!10686))))

(declare-fun condMapEmpty!10686 () Bool)

(declare-fun mapDefault!10686 () ValueCell!2808)

(assert (=> b!239619 (= condMapEmpty!10686 (= (arr!5644 (_values!4426 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2808)) mapDefault!10686)))))

(declare-fun bm!22281 () Bool)

(assert (=> bm!22281 (= call!22284 (inRange!0 (ite c!39936 (index!6306 lt!120824) (index!6309 lt!120824)) (mask!10491 thiss!1504)))))

(assert (= (and start!22938 res!117431) b!239608))

(assert (= (and b!239608 res!117437) b!239604))

(assert (= (and b!239604 res!117430) b!239603))

(assert (= (and b!239603 c!39937) b!239612))

(assert (= (and b!239603 (not c!39937)) b!239618))

(assert (= (and b!239618 c!39936) b!239605))

(assert (= (and b!239618 (not c!39936)) b!239609))

(assert (= (and b!239605 res!117436) b!239600))

(assert (= (and b!239600 res!117435) b!239613))

(assert (= (and b!239609 c!39938) b!239601))

(assert (= (and b!239609 (not c!39938)) b!239606))

(assert (= (and b!239601 res!117432) b!239617))

(assert (= (and b!239617 res!117429) b!239611))

(assert (= (or b!239605 b!239601) bm!22281))

(assert (= (or b!239613 b!239611) bm!22280))

(assert (= (and b!239603 res!117434) b!239610))

(assert (= (and b!239610 res!117428) b!239602))

(assert (= (and b!239602 res!117433) b!239615))

(assert (= (and b!239619 condMapEmpty!10686) mapIsEmpty!10686))

(assert (= (and b!239619 (not condMapEmpty!10686)) mapNonEmpty!10686))

(assert (= (and mapNonEmpty!10686 ((_ is ValueCellFull!2808) mapValue!10686)) b!239614))

(assert (= (and b!239619 ((_ is ValueCellFull!2808) mapDefault!10686)) b!239616))

(assert (= b!239607 b!239619))

(assert (= start!22938 b!239607))

(declare-fun m!259589 () Bool)

(assert (=> start!22938 m!259589))

(declare-fun m!259591 () Bool)

(assert (=> b!239607 m!259591))

(declare-fun m!259593 () Bool)

(assert (=> b!239607 m!259593))

(declare-fun m!259595 () Bool)

(assert (=> b!239604 m!259595))

(declare-fun m!259597 () Bool)

(assert (=> b!239610 m!259597))

(declare-fun m!259599 () Bool)

(assert (=> b!239600 m!259599))

(assert (=> bm!22280 m!259597))

(declare-fun m!259601 () Bool)

(assert (=> b!239602 m!259601))

(declare-fun m!259603 () Bool)

(assert (=> b!239612 m!259603))

(declare-fun m!259605 () Bool)

(assert (=> bm!22281 m!259605))

(declare-fun m!259607 () Bool)

(assert (=> b!239617 m!259607))

(declare-fun m!259609 () Bool)

(assert (=> mapNonEmpty!10686 m!259609))

(declare-fun m!259611 () Bool)

(assert (=> b!239603 m!259611))

(declare-fun m!259613 () Bool)

(assert (=> b!239603 m!259613))

(assert (=> b!239603 m!259613))

(declare-fun m!259615 () Bool)

(assert (=> b!239603 m!259615))

(declare-fun m!259617 () Bool)

(assert (=> b!239618 m!259617))

(check-sat (not b!239612) (not b!239618) (not mapNonEmpty!10686) tp_is_empty!6303 (not b!239604) (not b!239607) (not bm!22281) (not start!22938) (not b!239610) (not b!239603) (not b!239602) (not bm!22280) b_and!13407 (not b_next!6441))
(check-sat b_and!13407 (not b_next!6441))

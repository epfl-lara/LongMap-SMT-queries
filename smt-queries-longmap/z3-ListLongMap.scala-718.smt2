; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16814 () Bool)

(assert start!16814)

(declare-fun b!169493 () Bool)

(declare-fun b_free!4139 () Bool)

(declare-fun b_next!4139 () Bool)

(assert (=> b!169493 (= b_free!4139 (not b_next!4139))))

(declare-fun tp!15021 () Bool)

(declare-fun b_and!10553 () Bool)

(assert (=> b!169493 (= tp!15021 b_and!10553)))

(declare-fun b!169490 () Bool)

(declare-fun b_free!4141 () Bool)

(declare-fun b_next!4141 () Bool)

(assert (=> b!169490 (= b_free!4141 (not b_next!4141))))

(declare-fun tp!15023 () Bool)

(declare-fun b_and!10555 () Bool)

(assert (=> b!169490 (= tp!15023 b_and!10555)))

(declare-fun mapIsEmpty!6632 () Bool)

(declare-fun mapRes!6633 () Bool)

(assert (=> mapIsEmpty!6632 mapRes!6633))

(declare-fun mapNonEmpty!6632 () Bool)

(declare-fun mapRes!6632 () Bool)

(declare-fun tp!15022 () Bool)

(declare-fun e!111714 () Bool)

(assert (=> mapNonEmpty!6632 (= mapRes!6632 (and tp!15022 e!111714))))

(declare-datatypes ((V!4875 0))(
  ( (V!4876 (val!2005 Int)) )
))
(declare-datatypes ((ValueCell!1617 0))(
  ( (ValueCellFull!1617 (v!3870 V!4875)) (EmptyCell!1617) )
))
(declare-fun mapRest!6632 () (Array (_ BitVec 32) ValueCell!1617))

(declare-fun mapKey!6633 () (_ BitVec 32))

(declare-datatypes ((array!6939 0))(
  ( (array!6940 (arr!3305 (Array (_ BitVec 32) (_ BitVec 64))) (size!3593 (_ BitVec 32))) )
))
(declare-datatypes ((array!6941 0))(
  ( (array!6942 (arr!3306 (Array (_ BitVec 32) ValueCell!1617)) (size!3594 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2142 0))(
  ( (LongMapFixedSize!2143 (defaultEntry!3513 Int) (mask!8298 (_ BitVec 32)) (extraKeys!3254 (_ BitVec 32)) (zeroValue!3356 V!4875) (minValue!3356 V!4875) (_size!1120 (_ BitVec 32)) (_keys!5338 array!6939) (_values!3496 array!6941) (_vacant!1120 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2142)

(declare-fun mapValue!6633 () ValueCell!1617)

(assert (=> mapNonEmpty!6632 (= (arr!3306 (_values!3496 thiss!1248)) (store mapRest!6632 mapKey!6633 mapValue!6633))))

(declare-fun b!169487 () Bool)

(declare-fun e!111711 () Bool)

(declare-fun tp_is_empty!3921 () Bool)

(assert (=> b!169487 (= e!111711 tp_is_empty!3921)))

(declare-fun b!169488 () Bool)

(declare-fun res!80611 () Bool)

(declare-fun e!111713 () Bool)

(assert (=> b!169488 (=> (not res!80611) (not e!111713))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169488 (= res!80611 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169489 () Bool)

(declare-fun e!111716 () Bool)

(assert (=> b!169489 (= e!111713 e!111716)))

(declare-fun res!80613 () Bool)

(assert (=> b!169489 (=> (not res!80613) (not e!111716))))

(declare-datatypes ((SeekEntryResult!525 0))(
  ( (MissingZero!525 (index!4268 (_ BitVec 32))) (Found!525 (index!4269 (_ BitVec 32))) (Intermediate!525 (undefined!1337 Bool) (index!4270 (_ BitVec 32)) (x!18721 (_ BitVec 32))) (Undefined!525) (MissingVacant!525 (index!4271 (_ BitVec 32))) )
))
(declare-fun lt!84924 () SeekEntryResult!525)

(get-info :version)

(assert (=> b!169489 (= res!80613 (and (not ((_ is Undefined!525) lt!84924)) (not ((_ is MissingVacant!525) lt!84924)) (not ((_ is MissingZero!525) lt!84924)) (not ((_ is Found!525) lt!84924))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6939 (_ BitVec 32)) SeekEntryResult!525)

(assert (=> b!169489 (= lt!84924 (seekEntryOrOpen!0 key!828 (_keys!5338 thiss!1248) (mask!8298 thiss!1248)))))

(declare-fun e!111712 () Bool)

(declare-fun e!111709 () Bool)

(declare-fun array_inv!2121 (array!6939) Bool)

(declare-fun array_inv!2122 (array!6941) Bool)

(assert (=> b!169490 (= e!111709 (and tp!15023 tp_is_empty!3921 (array_inv!2121 (_keys!5338 thiss!1248)) (array_inv!2122 (_values!3496 thiss!1248)) e!111712))))

(declare-fun b!169491 () Bool)

(declare-fun e!111705 () Bool)

(assert (=> b!169491 (= e!111705 tp_is_empty!3921)))

(declare-fun b!169492 () Bool)

(declare-fun e!111710 () Bool)

(assert (=> b!169492 (= e!111710 tp_is_empty!3921)))

(declare-fun e!111708 () Bool)

(declare-datatypes ((tuple2!3222 0))(
  ( (tuple2!3223 (_1!1622 Bool) (_2!1622 LongMapFixedSize!2142)) )
))
(declare-fun err!79 () tuple2!3222)

(declare-fun e!111715 () Bool)

(assert (=> b!169493 (= e!111708 (and tp!15021 tp_is_empty!3921 (array_inv!2121 (_keys!5338 (_2!1622 err!79))) (array_inv!2122 (_values!3496 (_2!1622 err!79))) e!111715))))

(declare-fun b!169494 () Bool)

(assert (=> b!169494 (= e!111712 (and e!111711 mapRes!6632))))

(declare-fun condMapEmpty!6632 () Bool)

(declare-fun mapDefault!6633 () ValueCell!1617)

(assert (=> b!169494 (= condMapEmpty!6632 (= (arr!3306 (_values!3496 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1617)) mapDefault!6633)))))

(declare-fun b!169495 () Bool)

(assert (=> b!169495 (= e!111715 (and e!111705 mapRes!6633))))

(declare-fun condMapEmpty!6633 () Bool)

(declare-fun mapDefault!6632 () ValueCell!1617)

(assert (=> b!169495 (= condMapEmpty!6633 (= (arr!3306 (_values!3496 (_2!1622 err!79))) ((as const (Array (_ BitVec 32) ValueCell!1617)) mapDefault!6632)))))

(declare-fun mapIsEmpty!6633 () Bool)

(assert (=> mapIsEmpty!6633 mapRes!6632))

(declare-fun res!80612 () Bool)

(assert (=> start!16814 (=> (not res!80612) (not e!111713))))

(declare-fun valid!923 (LongMapFixedSize!2142) Bool)

(assert (=> start!16814 (= res!80612 (valid!923 thiss!1248))))

(assert (=> start!16814 e!111713))

(assert (=> start!16814 e!111709))

(assert (=> start!16814 true))

(declare-fun mapNonEmpty!6633 () Bool)

(declare-fun tp!15024 () Bool)

(assert (=> mapNonEmpty!6633 (= mapRes!6633 (and tp!15024 e!111710))))

(declare-fun mapValue!6632 () ValueCell!1617)

(declare-fun mapKey!6632 () (_ BitVec 32))

(declare-fun mapRest!6633 () (Array (_ BitVec 32) ValueCell!1617))

(assert (=> mapNonEmpty!6633 (= (arr!3306 (_values!3496 (_2!1622 err!79))) (store mapRest!6633 mapKey!6632 mapValue!6632))))

(declare-fun b!169496 () Bool)

(assert (=> b!169496 (= e!111714 tp_is_empty!3921)))

(declare-fun b!169497 () Bool)

(assert (=> b!169497 (= e!111716 false)))

(declare-fun lt!84925 () Bool)

(assert (=> b!169497 (= lt!84925 (valid!923 (_2!1622 err!79)))))

(assert (=> b!169497 true))

(assert (=> b!169497 e!111708))

(assert (= (and start!16814 res!80612) b!169488))

(assert (= (and b!169488 res!80611) b!169489))

(assert (= (and b!169489 res!80613) b!169497))

(assert (= (and b!169495 condMapEmpty!6633) mapIsEmpty!6632))

(assert (= (and b!169495 (not condMapEmpty!6633)) mapNonEmpty!6633))

(assert (= (and mapNonEmpty!6633 ((_ is ValueCellFull!1617) mapValue!6632)) b!169492))

(assert (= (and b!169495 ((_ is ValueCellFull!1617) mapDefault!6632)) b!169491))

(assert (= b!169493 b!169495))

(assert (= b!169497 b!169493))

(assert (= (and b!169494 condMapEmpty!6632) mapIsEmpty!6633))

(assert (= (and b!169494 (not condMapEmpty!6632)) mapNonEmpty!6632))

(assert (= (and mapNonEmpty!6632 ((_ is ValueCellFull!1617) mapValue!6633)) b!169496))

(assert (= (and b!169494 ((_ is ValueCellFull!1617) mapDefault!6633)) b!169487))

(assert (= b!169490 b!169494))

(assert (= start!16814 b!169490))

(declare-fun m!198483 () Bool)

(assert (=> start!16814 m!198483))

(declare-fun m!198485 () Bool)

(assert (=> mapNonEmpty!6633 m!198485))

(declare-fun m!198487 () Bool)

(assert (=> b!169490 m!198487))

(declare-fun m!198489 () Bool)

(assert (=> b!169490 m!198489))

(declare-fun m!198491 () Bool)

(assert (=> b!169493 m!198491))

(declare-fun m!198493 () Bool)

(assert (=> b!169493 m!198493))

(declare-fun m!198495 () Bool)

(assert (=> b!169489 m!198495))

(declare-fun m!198497 () Bool)

(assert (=> mapNonEmpty!6632 m!198497))

(declare-fun m!198499 () Bool)

(assert (=> b!169497 m!198499))

(check-sat tp_is_empty!3921 (not mapNonEmpty!6632) b_and!10553 (not b!169489) (not b_next!4141) (not b_next!4139) (not mapNonEmpty!6633) (not b!169490) (not b!169493) (not start!16814) (not b!169497) b_and!10555)
(check-sat b_and!10553 b_and!10555 (not b_next!4141) (not b_next!4139))

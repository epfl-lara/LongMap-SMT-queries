; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16286 () Bool)

(assert start!16286)

(declare-fun b!162489 () Bool)

(declare-fun b_free!3747 () Bool)

(declare-fun b_next!3747 () Bool)

(assert (=> b!162489 (= b_free!3747 (not b_next!3747))))

(declare-fun tp!13810 () Bool)

(declare-fun b_and!10161 () Bool)

(assert (=> b!162489 (= tp!13810 b_and!10161)))

(declare-fun b!162485 () Bool)

(declare-fun res!76946 () Bool)

(declare-fun e!106499 () Bool)

(assert (=> b!162485 (=> (not res!76946) (not e!106499))))

(declare-datatypes ((V!4379 0))(
  ( (V!4380 (val!1819 Int)) )
))
(declare-datatypes ((ValueCell!1431 0))(
  ( (ValueCellFull!1431 (v!3684 V!4379)) (EmptyCell!1431) )
))
(declare-datatypes ((array!6177 0))(
  ( (array!6178 (arr!2933 (Array (_ BitVec 32) (_ BitVec 64))) (size!3217 (_ BitVec 32))) )
))
(declare-datatypes ((array!6179 0))(
  ( (array!6180 (arr!2934 (Array (_ BitVec 32) ValueCell!1431)) (size!3218 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1770 0))(
  ( (LongMapFixedSize!1771 (defaultEntry!3327 Int) (mask!7951 (_ BitVec 32)) (extraKeys!3068 (_ BitVec 32)) (zeroValue!3170 V!4379) (minValue!3170 V!4379) (_size!934 (_ BitVec 32)) (_keys!5128 array!6177) (_values!3310 array!6179) (_vacant!934 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2994 0))(
  ( (tuple2!2995 (_1!1508 Bool) (_2!1508 LongMapFixedSize!1770)) )
))
(declare-fun lt!82462 () tuple2!2994)

(assert (=> b!162485 (= res!76946 (_1!1508 lt!82462))))

(declare-fun b!162486 () Bool)

(declare-fun res!76947 () Bool)

(declare-fun e!106498 () Bool)

(assert (=> b!162486 (=> (not res!76947) (not e!106498))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162486 (= res!76947 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162487 () Bool)

(declare-fun e!106500 () Bool)

(assert (=> b!162487 (= e!106500 e!106499)))

(declare-fun res!76949 () Bool)

(assert (=> b!162487 (=> (not res!76949) (not e!106499))))

(declare-fun valid!800 (LongMapFixedSize!1770) Bool)

(assert (=> b!162487 (= res!76949 (valid!800 (_2!1508 lt!82462)))))

(declare-datatypes ((SeekEntryResult!383 0))(
  ( (MissingZero!383 (index!3700 (_ BitVec 32))) (Found!383 (index!3701 (_ BitVec 32))) (Intermediate!383 (undefined!1195 Bool) (index!3702 (_ BitVec 32)) (x!17975 (_ BitVec 32))) (Undefined!383) (MissingVacant!383 (index!3703 (_ BitVec 32))) )
))
(declare-fun lt!82460 () SeekEntryResult!383)

(declare-fun v!309 () V!4379)

(declare-fun thiss!1248 () LongMapFixedSize!1770)

(declare-fun updateHelperNewKey!80 (LongMapFixedSize!1770 (_ BitVec 64) V!4379 (_ BitVec 32)) tuple2!2994)

(assert (=> b!162487 (= lt!82462 (updateHelperNewKey!80 thiss!1248 key!828 v!309 (index!3700 lt!82460)))))

(declare-fun b!162488 () Bool)

(declare-fun e!106503 () Bool)

(declare-fun tp_is_empty!3549 () Bool)

(assert (=> b!162488 (= e!106503 tp_is_empty!3549)))

(declare-fun e!106501 () Bool)

(declare-fun e!106497 () Bool)

(declare-fun array_inv!1877 (array!6177) Bool)

(declare-fun array_inv!1878 (array!6179) Bool)

(assert (=> b!162489 (= e!106497 (and tp!13810 tp_is_empty!3549 (array_inv!1877 (_keys!5128 thiss!1248)) (array_inv!1878 (_values!3310 thiss!1248)) e!106501))))

(declare-fun res!76948 () Bool)

(assert (=> start!16286 (=> (not res!76948) (not e!106498))))

(assert (=> start!16286 (= res!76948 (valid!800 thiss!1248))))

(assert (=> start!16286 e!106498))

(assert (=> start!16286 e!106497))

(assert (=> start!16286 true))

(assert (=> start!16286 tp_is_empty!3549))

(declare-fun b!162490 () Bool)

(assert (=> b!162490 (= e!106499 false)))

(declare-fun lt!82461 () Bool)

(declare-datatypes ((tuple2!2996 0))(
  ( (tuple2!2997 (_1!1509 (_ BitVec 64)) (_2!1509 V!4379)) )
))
(declare-datatypes ((List!1984 0))(
  ( (Nil!1981) (Cons!1980 (h!2593 tuple2!2996) (t!6786 List!1984)) )
))
(declare-datatypes ((ListLongMap!1963 0))(
  ( (ListLongMap!1964 (toList!997 List!1984)) )
))
(declare-fun contains!1033 (ListLongMap!1963 (_ BitVec 64)) Bool)

(declare-fun map!1687 (LongMapFixedSize!1770) ListLongMap!1963)

(assert (=> b!162490 (= lt!82461 (contains!1033 (map!1687 (_2!1508 lt!82462)) key!828))))

(declare-fun b!162491 () Bool)

(declare-fun e!106496 () Bool)

(assert (=> b!162491 (= e!106496 tp_is_empty!3549)))

(declare-fun b!162492 () Bool)

(declare-fun mapRes!6011 () Bool)

(assert (=> b!162492 (= e!106501 (and e!106496 mapRes!6011))))

(declare-fun condMapEmpty!6011 () Bool)

(declare-fun mapDefault!6011 () ValueCell!1431)

(assert (=> b!162492 (= condMapEmpty!6011 (= (arr!2934 (_values!3310 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1431)) mapDefault!6011)))))

(declare-fun b!162493 () Bool)

(assert (=> b!162493 (= e!106498 e!106500)))

(declare-fun res!76945 () Bool)

(assert (=> b!162493 (=> (not res!76945) (not e!106500))))

(get-info :version)

(assert (=> b!162493 (= res!76945 (and (not ((_ is Undefined!383) lt!82460)) (not ((_ is MissingVacant!383) lt!82460)) ((_ is MissingZero!383) lt!82460)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6177 (_ BitVec 32)) SeekEntryResult!383)

(assert (=> b!162493 (= lt!82460 (seekEntryOrOpen!0 key!828 (_keys!5128 thiss!1248) (mask!7951 thiss!1248)))))

(declare-fun mapIsEmpty!6011 () Bool)

(assert (=> mapIsEmpty!6011 mapRes!6011))

(declare-fun mapNonEmpty!6011 () Bool)

(declare-fun tp!13811 () Bool)

(assert (=> mapNonEmpty!6011 (= mapRes!6011 (and tp!13811 e!106503))))

(declare-fun mapKey!6011 () (_ BitVec 32))

(declare-fun mapValue!6011 () ValueCell!1431)

(declare-fun mapRest!6011 () (Array (_ BitVec 32) ValueCell!1431))

(assert (=> mapNonEmpty!6011 (= (arr!2934 (_values!3310 thiss!1248)) (store mapRest!6011 mapKey!6011 mapValue!6011))))

(assert (= (and start!16286 res!76948) b!162486))

(assert (= (and b!162486 res!76947) b!162493))

(assert (= (and b!162493 res!76945) b!162487))

(assert (= (and b!162487 res!76949) b!162485))

(assert (= (and b!162485 res!76946) b!162490))

(assert (= (and b!162492 condMapEmpty!6011) mapIsEmpty!6011))

(assert (= (and b!162492 (not condMapEmpty!6011)) mapNonEmpty!6011))

(assert (= (and mapNonEmpty!6011 ((_ is ValueCellFull!1431) mapValue!6011)) b!162488))

(assert (= (and b!162492 ((_ is ValueCellFull!1431) mapDefault!6011)) b!162491))

(assert (= b!162489 b!162492))

(assert (= start!16286 b!162489))

(declare-fun m!193581 () Bool)

(assert (=> b!162489 m!193581))

(declare-fun m!193583 () Bool)

(assert (=> b!162489 m!193583))

(declare-fun m!193585 () Bool)

(assert (=> b!162490 m!193585))

(assert (=> b!162490 m!193585))

(declare-fun m!193587 () Bool)

(assert (=> b!162490 m!193587))

(declare-fun m!193589 () Bool)

(assert (=> start!16286 m!193589))

(declare-fun m!193591 () Bool)

(assert (=> b!162487 m!193591))

(declare-fun m!193593 () Bool)

(assert (=> b!162487 m!193593))

(declare-fun m!193595 () Bool)

(assert (=> b!162493 m!193595))

(declare-fun m!193597 () Bool)

(assert (=> mapNonEmpty!6011 m!193597))

(check-sat (not b!162493) (not mapNonEmpty!6011) (not b!162489) (not b!162487) (not b_next!3747) (not b!162490) tp_is_empty!3549 b_and!10161 (not start!16286))
(check-sat b_and!10161 (not b_next!3747))

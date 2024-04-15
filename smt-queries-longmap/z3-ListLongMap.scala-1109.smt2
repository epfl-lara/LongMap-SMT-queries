; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22904 () Bool)

(assert start!22904)

(declare-fun b!238392 () Bool)

(declare-fun b_free!6403 () Bool)

(declare-fun b_next!6403 () Bool)

(assert (=> b!238392 (= b_free!6403 (not b_next!6403))))

(declare-fun tp!22413 () Bool)

(declare-fun b_and!13343 () Bool)

(assert (=> b!238392 (= tp!22413 b_and!13343)))

(declare-fun b!238385 () Bool)

(declare-fun res!116798 () Bool)

(declare-fun e!154767 () Bool)

(assert (=> b!238385 (=> (not res!116798) (not e!154767))))

(declare-datatypes ((V!8001 0))(
  ( (V!8002 (val!3177 Int)) )
))
(declare-datatypes ((ValueCell!2789 0))(
  ( (ValueCellFull!2789 (v!5209 V!8001)) (EmptyCell!2789) )
))
(declare-datatypes ((array!11801 0))(
  ( (array!11802 (arr!5601 (Array (_ BitVec 32) ValueCell!2789)) (size!5943 (_ BitVec 32))) )
))
(declare-datatypes ((array!11803 0))(
  ( (array!11804 (arr!5602 (Array (_ BitVec 32) (_ BitVec 64))) (size!5944 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3478 0))(
  ( (LongMapFixedSize!3479 (defaultEntry!4424 Int) (mask!10459 (_ BitVec 32)) (extraKeys!4161 (_ BitVec 32)) (zeroValue!4265 V!8001) (minValue!4265 V!8001) (_size!1788 (_ BitVec 32)) (_keys!6525 array!11803) (_values!4407 array!11801) (_vacant!1788 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3478)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11803 (_ BitVec 32)) Bool)

(assert (=> b!238385 (= res!116798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6525 thiss!1504) (mask!10459 thiss!1504)))))

(declare-fun b!238386 () Bool)

(declare-fun e!154768 () Bool)

(declare-fun tp_is_empty!6265 () Bool)

(assert (=> b!238386 (= e!154768 tp_is_empty!6265)))

(declare-fun b!238387 () Bool)

(assert (=> b!238387 (= e!154767 false)))

(declare-fun lt!120428 () Bool)

(declare-datatypes ((List!3573 0))(
  ( (Nil!3570) (Cons!3569 (h!4225 (_ BitVec 64)) (t!8559 List!3573)) )
))
(declare-fun arrayNoDuplicates!0 (array!11803 (_ BitVec 32) List!3573) Bool)

(assert (=> b!238387 (= lt!120428 (arrayNoDuplicates!0 (_keys!6525 thiss!1504) #b00000000000000000000000000000000 Nil!3570))))

(declare-fun b!238388 () Bool)

(declare-fun e!154769 () Bool)

(assert (=> b!238388 (= e!154769 e!154767)))

(declare-fun res!116797 () Bool)

(assert (=> b!238388 (=> (not res!116797) (not e!154767))))

(declare-datatypes ((SeekEntryResult!1015 0))(
  ( (MissingZero!1015 (index!6230 (_ BitVec 32))) (Found!1015 (index!6231 (_ BitVec 32))) (Intermediate!1015 (undefined!1827 Bool) (index!6232 (_ BitVec 32)) (x!24046 (_ BitVec 32))) (Undefined!1015) (MissingVacant!1015 (index!6233 (_ BitVec 32))) )
))
(declare-fun lt!120427 () SeekEntryResult!1015)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238388 (= res!116797 (or (= lt!120427 (MissingZero!1015 index!297)) (= lt!120427 (MissingVacant!1015 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11803 (_ BitVec 32)) SeekEntryResult!1015)

(assert (=> b!238388 (= lt!120427 (seekEntryOrOpen!0 key!932 (_keys!6525 thiss!1504) (mask!10459 thiss!1504)))))

(declare-fun b!238389 () Bool)

(declare-fun res!116795 () Bool)

(assert (=> b!238389 (=> (not res!116795) (not e!154769))))

(assert (=> b!238389 (= res!116795 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238390 () Bool)

(declare-fun res!116793 () Bool)

(assert (=> b!238390 (=> (not res!116793) (not e!154767))))

(declare-datatypes ((tuple2!4662 0))(
  ( (tuple2!4663 (_1!2342 (_ BitVec 64)) (_2!2342 V!8001)) )
))
(declare-datatypes ((List!3574 0))(
  ( (Nil!3571) (Cons!3570 (h!4226 tuple2!4662) (t!8560 List!3574)) )
))
(declare-datatypes ((ListLongMap!3565 0))(
  ( (ListLongMap!3566 (toList!1798 List!3574)) )
))
(declare-fun contains!1689 (ListLongMap!3565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1307 (array!11803 array!11801 (_ BitVec 32) (_ BitVec 32) V!8001 V!8001 (_ BitVec 32) Int) ListLongMap!3565)

(assert (=> b!238390 (= res!116793 (not (contains!1689 (getCurrentListMap!1307 (_keys!6525 thiss!1504) (_values!4407 thiss!1504) (mask!10459 thiss!1504) (extraKeys!4161 thiss!1504) (zeroValue!4265 thiss!1504) (minValue!4265 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4424 thiss!1504)) key!932)))))

(declare-fun mapNonEmpty!10629 () Bool)

(declare-fun mapRes!10629 () Bool)

(declare-fun tp!22412 () Bool)

(declare-fun e!154766 () Bool)

(assert (=> mapNonEmpty!10629 (= mapRes!10629 (and tp!22412 e!154766))))

(declare-fun mapValue!10629 () ValueCell!2789)

(declare-fun mapRest!10629 () (Array (_ BitVec 32) ValueCell!2789))

(declare-fun mapKey!10629 () (_ BitVec 32))

(assert (=> mapNonEmpty!10629 (= (arr!5601 (_values!4407 thiss!1504)) (store mapRest!10629 mapKey!10629 mapValue!10629))))

(declare-fun b!238391 () Bool)

(declare-fun res!116796 () Bool)

(assert (=> b!238391 (=> (not res!116796) (not e!154767))))

(assert (=> b!238391 (= res!116796 (and (= (size!5943 (_values!4407 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10459 thiss!1504))) (= (size!5944 (_keys!6525 thiss!1504)) (size!5943 (_values!4407 thiss!1504))) (bvsge (mask!10459 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4161 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4161 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!154770 () Bool)

(declare-fun e!154771 () Bool)

(declare-fun array_inv!3699 (array!11803) Bool)

(declare-fun array_inv!3700 (array!11801) Bool)

(assert (=> b!238392 (= e!154770 (and tp!22413 tp_is_empty!6265 (array_inv!3699 (_keys!6525 thiss!1504)) (array_inv!3700 (_values!4407 thiss!1504)) e!154771))))

(declare-fun b!238393 () Bool)

(assert (=> b!238393 (= e!154766 tp_is_empty!6265)))

(declare-fun b!238394 () Bool)

(declare-fun res!116799 () Bool)

(assert (=> b!238394 (=> (not res!116799) (not e!154767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238394 (= res!116799 (validMask!0 (mask!10459 thiss!1504)))))

(declare-fun res!116794 () Bool)

(assert (=> start!22904 (=> (not res!116794) (not e!154769))))

(declare-fun valid!1379 (LongMapFixedSize!3478) Bool)

(assert (=> start!22904 (= res!116794 (valid!1379 thiss!1504))))

(assert (=> start!22904 e!154769))

(assert (=> start!22904 e!154770))

(assert (=> start!22904 true))

(declare-fun b!238395 () Bool)

(assert (=> b!238395 (= e!154771 (and e!154768 mapRes!10629))))

(declare-fun condMapEmpty!10629 () Bool)

(declare-fun mapDefault!10629 () ValueCell!2789)

(assert (=> b!238395 (= condMapEmpty!10629 (= (arr!5601 (_values!4407 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2789)) mapDefault!10629)))))

(declare-fun mapIsEmpty!10629 () Bool)

(assert (=> mapIsEmpty!10629 mapRes!10629))

(assert (= (and start!22904 res!116794) b!238389))

(assert (= (and b!238389 res!116795) b!238388))

(assert (= (and b!238388 res!116797) b!238390))

(assert (= (and b!238390 res!116793) b!238394))

(assert (= (and b!238394 res!116799) b!238391))

(assert (= (and b!238391 res!116796) b!238385))

(assert (= (and b!238385 res!116798) b!238387))

(assert (= (and b!238395 condMapEmpty!10629) mapIsEmpty!10629))

(assert (= (and b!238395 (not condMapEmpty!10629)) mapNonEmpty!10629))

(get-info :version)

(assert (= (and mapNonEmpty!10629 ((_ is ValueCellFull!2789) mapValue!10629)) b!238393))

(assert (= (and b!238395 ((_ is ValueCellFull!2789) mapDefault!10629)) b!238386))

(assert (= b!238392 b!238395))

(assert (= start!22904 b!238392))

(declare-fun m!258433 () Bool)

(assert (=> b!238394 m!258433))

(declare-fun m!258435 () Bool)

(assert (=> b!238385 m!258435))

(declare-fun m!258437 () Bool)

(assert (=> mapNonEmpty!10629 m!258437))

(declare-fun m!258439 () Bool)

(assert (=> b!238392 m!258439))

(declare-fun m!258441 () Bool)

(assert (=> b!238392 m!258441))

(declare-fun m!258443 () Bool)

(assert (=> b!238388 m!258443))

(declare-fun m!258445 () Bool)

(assert (=> start!22904 m!258445))

(declare-fun m!258447 () Bool)

(assert (=> b!238387 m!258447))

(declare-fun m!258449 () Bool)

(assert (=> b!238390 m!258449))

(assert (=> b!238390 m!258449))

(declare-fun m!258451 () Bool)

(assert (=> b!238390 m!258451))

(check-sat (not b!238394) (not b!238387) (not b!238385) b_and!13343 (not b!238390) (not start!22904) (not b!238392) (not b_next!6403) (not b!238388) (not mapNonEmpty!10629) tp_is_empty!6265)
(check-sat b_and!13343 (not b_next!6403))

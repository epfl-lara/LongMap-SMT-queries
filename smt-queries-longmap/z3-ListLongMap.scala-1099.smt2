; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22562 () Bool)

(assert start!22562)

(declare-fun b!235688 () Bool)

(declare-fun b_free!6343 () Bool)

(declare-fun b_next!6343 () Bool)

(assert (=> b!235688 (= b_free!6343 (not b_next!6343))))

(declare-fun tp!22202 () Bool)

(declare-fun b_and!13249 () Bool)

(assert (=> b!235688 (= tp!22202 b_and!13249)))

(declare-fun tp_is_empty!6205 () Bool)

(declare-datatypes ((V!7921 0))(
  ( (V!7922 (val!3147 Int)) )
))
(declare-datatypes ((ValueCell!2759 0))(
  ( (ValueCellFull!2759 (v!5170 V!7921)) (EmptyCell!2759) )
))
(declare-datatypes ((array!11663 0))(
  ( (array!11664 (arr!5541 (Array (_ BitVec 32) ValueCell!2759)) (size!5879 (_ BitVec 32))) )
))
(declare-datatypes ((array!11665 0))(
  ( (array!11666 (arr!5542 (Array (_ BitVec 32) (_ BitVec 64))) (size!5880 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3418 0))(
  ( (LongMapFixedSize!3419 (defaultEntry!4381 Int) (mask!10359 (_ BitVec 32)) (extraKeys!4118 (_ BitVec 32)) (zeroValue!4222 V!7921) (minValue!4222 V!7921) (_size!1758 (_ BitVec 32)) (_keys!6458 array!11665) (_values!4364 array!11663) (_vacant!1758 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3418)

(declare-fun e!153051 () Bool)

(declare-fun e!153049 () Bool)

(declare-fun array_inv!3657 (array!11665) Bool)

(declare-fun array_inv!3658 (array!11663) Bool)

(assert (=> b!235688 (= e!153049 (and tp!22202 tp_is_empty!6205 (array_inv!3657 (_keys!6458 thiss!1504)) (array_inv!3658 (_values!4364 thiss!1504)) e!153051))))

(declare-fun b!235689 () Bool)

(declare-fun e!153052 () Bool)

(assert (=> b!235689 (= e!153052 (not false))))

(declare-fun e!153050 () Bool)

(assert (=> b!235689 e!153050))

(declare-fun res!115573 () Bool)

(assert (=> b!235689 (=> (not res!115573) (not e!153050))))

(declare-datatypes ((SeekEntryResult!994 0))(
  ( (MissingZero!994 (index!6146 (_ BitVec 32))) (Found!994 (index!6147 (_ BitVec 32))) (Intermediate!994 (undefined!1806 Bool) (index!6148 (_ BitVec 32)) (x!23823 (_ BitVec 32))) (Undefined!994) (MissingVacant!994 (index!6149 (_ BitVec 32))) )
))
(declare-fun lt!119079 () SeekEntryResult!994)

(get-info :version)

(assert (=> b!235689 (= res!115573 ((_ is Found!994) lt!119079))))

(declare-datatypes ((Unit!7258 0))(
  ( (Unit!7259) )
))
(declare-fun lt!119078 () Unit!7258)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!325 (array!11665 array!11663 (_ BitVec 32) (_ BitVec 32) V!7921 V!7921 (_ BitVec 64) Int) Unit!7258)

(assert (=> b!235689 (= lt!119078 (lemmaInListMapThenSeekEntryOrOpenFindsIt!325 (_keys!6458 thiss!1504) (_values!4364 thiss!1504) (mask!10359 thiss!1504) (extraKeys!4118 thiss!1504) (zeroValue!4222 thiss!1504) (minValue!4222 thiss!1504) key!932 (defaultEntry!4381 thiss!1504)))))

(declare-fun b!235690 () Bool)

(declare-fun e!153053 () Bool)

(assert (=> b!235690 (= e!153053 tp_is_empty!6205)))

(declare-fun b!235691 () Bool)

(assert (=> b!235691 (= e!153050 (= (select (arr!5542 (_keys!6458 thiss!1504)) (index!6147 lt!119079)) key!932))))

(declare-fun b!235692 () Bool)

(declare-fun res!115571 () Bool)

(assert (=> b!235692 (=> (not res!115571) (not e!153052))))

(declare-datatypes ((tuple2!4616 0))(
  ( (tuple2!4617 (_1!2319 (_ BitVec 64)) (_2!2319 V!7921)) )
))
(declare-datatypes ((List!3540 0))(
  ( (Nil!3537) (Cons!3536 (h!4188 tuple2!4616) (t!8508 List!3540)) )
))
(declare-datatypes ((ListLongMap!3519 0))(
  ( (ListLongMap!3520 (toList!1775 List!3540)) )
))
(declare-fun contains!1656 (ListLongMap!3519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1284 (array!11665 array!11663 (_ BitVec 32) (_ BitVec 32) V!7921 V!7921 (_ BitVec 32) Int) ListLongMap!3519)

(assert (=> b!235692 (= res!115571 (contains!1656 (getCurrentListMap!1284 (_keys!6458 thiss!1504) (_values!4364 thiss!1504) (mask!10359 thiss!1504) (extraKeys!4118 thiss!1504) (zeroValue!4222 thiss!1504) (minValue!4222 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4381 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10508 () Bool)

(declare-fun mapRes!10508 () Bool)

(assert (=> mapIsEmpty!10508 mapRes!10508))

(declare-fun b!235693 () Bool)

(declare-fun e!153047 () Bool)

(assert (=> b!235693 (= e!153047 e!153052)))

(declare-fun res!115568 () Bool)

(assert (=> b!235693 (=> (not res!115568) (not e!153052))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235693 (= res!115568 (or (= lt!119079 (MissingZero!994 index!297)) (= lt!119079 (MissingVacant!994 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11665 (_ BitVec 32)) SeekEntryResult!994)

(assert (=> b!235693 (= lt!119079 (seekEntryOrOpen!0 key!932 (_keys!6458 thiss!1504) (mask!10359 thiss!1504)))))

(declare-fun b!235694 () Bool)

(declare-fun res!115572 () Bool)

(assert (=> b!235694 (=> (not res!115572) (not e!153050))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235694 (= res!115572 (inRange!0 (index!6147 lt!119079) (mask!10359 thiss!1504)))))

(declare-fun b!235695 () Bool)

(declare-fun res!115569 () Bool)

(assert (=> b!235695 (=> (not res!115569) (not e!153047))))

(assert (=> b!235695 (= res!115569 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10508 () Bool)

(declare-fun tp!22201 () Bool)

(declare-fun e!153046 () Bool)

(assert (=> mapNonEmpty!10508 (= mapRes!10508 (and tp!22201 e!153046))))

(declare-fun mapKey!10508 () (_ BitVec 32))

(declare-fun mapValue!10508 () ValueCell!2759)

(declare-fun mapRest!10508 () (Array (_ BitVec 32) ValueCell!2759))

(assert (=> mapNonEmpty!10508 (= (arr!5541 (_values!4364 thiss!1504)) (store mapRest!10508 mapKey!10508 mapValue!10508))))

(declare-fun res!115570 () Bool)

(assert (=> start!22562 (=> (not res!115570) (not e!153047))))

(declare-fun valid!1360 (LongMapFixedSize!3418) Bool)

(assert (=> start!22562 (= res!115570 (valid!1360 thiss!1504))))

(assert (=> start!22562 e!153047))

(assert (=> start!22562 e!153049))

(assert (=> start!22562 true))

(declare-fun b!235696 () Bool)

(assert (=> b!235696 (= e!153051 (and e!153053 mapRes!10508))))

(declare-fun condMapEmpty!10508 () Bool)

(declare-fun mapDefault!10508 () ValueCell!2759)

(assert (=> b!235696 (= condMapEmpty!10508 (= (arr!5541 (_values!4364 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2759)) mapDefault!10508)))))

(declare-fun b!235697 () Bool)

(assert (=> b!235697 (= e!153046 tp_is_empty!6205)))

(assert (= (and start!22562 res!115570) b!235695))

(assert (= (and b!235695 res!115569) b!235693))

(assert (= (and b!235693 res!115568) b!235692))

(assert (= (and b!235692 res!115571) b!235689))

(assert (= (and b!235689 res!115573) b!235694))

(assert (= (and b!235694 res!115572) b!235691))

(assert (= (and b!235696 condMapEmpty!10508) mapIsEmpty!10508))

(assert (= (and b!235696 (not condMapEmpty!10508)) mapNonEmpty!10508))

(assert (= (and mapNonEmpty!10508 ((_ is ValueCellFull!2759) mapValue!10508)) b!235697))

(assert (= (and b!235696 ((_ is ValueCellFull!2759) mapDefault!10508)) b!235690))

(assert (= b!235688 b!235696))

(assert (= start!22562 b!235688))

(declare-fun m!256201 () Bool)

(assert (=> mapNonEmpty!10508 m!256201))

(declare-fun m!256203 () Bool)

(assert (=> b!235693 m!256203))

(declare-fun m!256205 () Bool)

(assert (=> b!235689 m!256205))

(declare-fun m!256207 () Bool)

(assert (=> b!235691 m!256207))

(declare-fun m!256209 () Bool)

(assert (=> b!235688 m!256209))

(declare-fun m!256211 () Bool)

(assert (=> b!235688 m!256211))

(declare-fun m!256213 () Bool)

(assert (=> start!22562 m!256213))

(declare-fun m!256215 () Bool)

(assert (=> b!235692 m!256215))

(assert (=> b!235692 m!256215))

(declare-fun m!256217 () Bool)

(assert (=> b!235692 m!256217))

(declare-fun m!256219 () Bool)

(assert (=> b!235694 m!256219))

(check-sat (not b!235694) tp_is_empty!6205 (not b_next!6343) (not b!235692) (not b!235693) (not mapNonEmpty!10508) (not start!22562) b_and!13249 (not b!235689) (not b!235688))
(check-sat b_and!13249 (not b_next!6343))

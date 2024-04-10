; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21626 () Bool)

(assert start!21626)

(declare-fun b!216807 () Bool)

(declare-fun b_free!5775 () Bool)

(declare-fun b_next!5775 () Bool)

(assert (=> b!216807 (= b_free!5775 (not b_next!5775))))

(declare-fun tp!20459 () Bool)

(declare-fun b_and!12665 () Bool)

(assert (=> b!216807 (= tp!20459 b_and!12665)))

(declare-fun b!216799 () Bool)

(declare-fun res!106068 () Bool)

(declare-fun e!141048 () Bool)

(assert (=> b!216799 (=> (not res!106068) (not e!141048))))

(declare-datatypes ((V!7163 0))(
  ( (V!7164 (val!2863 Int)) )
))
(declare-datatypes ((ValueCell!2475 0))(
  ( (ValueCellFull!2475 (v!4881 V!7163)) (EmptyCell!2475) )
))
(declare-datatypes ((array!10513 0))(
  ( (array!10514 (arr!4978 (Array (_ BitVec 32) ValueCell!2475)) (size!5310 (_ BitVec 32))) )
))
(declare-datatypes ((array!10515 0))(
  ( (array!10516 (arr!4979 (Array (_ BitVec 32) (_ BitVec 64))) (size!5311 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2850 0))(
  ( (LongMapFixedSize!2851 (defaultEntry!4075 Int) (mask!9818 (_ BitVec 32)) (extraKeys!3812 (_ BitVec 32)) (zeroValue!3916 V!7163) (minValue!3916 V!7163) (_size!1474 (_ BitVec 32)) (_keys!6124 array!10515) (_values!4058 array!10513) (_vacant!1474 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2850)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10515 (_ BitVec 32)) Bool)

(assert (=> b!216799 (= res!106068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6124 thiss!1504) (mask!9818 thiss!1504)))))

(declare-fun b!216800 () Bool)

(declare-fun e!141049 () Bool)

(declare-fun tp_is_empty!5637 () Bool)

(assert (=> b!216800 (= e!141049 tp_is_empty!5637)))

(declare-fun b!216801 () Bool)

(assert (=> b!216801 (= e!141048 false)))

(declare-fun lt!111230 () Bool)

(declare-datatypes ((List!3164 0))(
  ( (Nil!3161) (Cons!3160 (h!3807 (_ BitVec 64)) (t!8119 List!3164)) )
))
(declare-fun arrayNoDuplicates!0 (array!10515 (_ BitVec 32) List!3164) Bool)

(assert (=> b!216801 (= lt!111230 (arrayNoDuplicates!0 (_keys!6124 thiss!1504) #b00000000000000000000000000000000 Nil!3161))))

(declare-fun b!216802 () Bool)

(declare-fun res!106066 () Bool)

(assert (=> b!216802 (=> (not res!106066) (not e!141048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216802 (= res!106066 (validMask!0 (mask!9818 thiss!1504)))))

(declare-fun res!106064 () Bool)

(declare-fun e!141046 () Bool)

(assert (=> start!21626 (=> (not res!106064) (not e!141046))))

(declare-fun valid!1158 (LongMapFixedSize!2850) Bool)

(assert (=> start!21626 (= res!106064 (valid!1158 thiss!1504))))

(assert (=> start!21626 e!141046))

(declare-fun e!141050 () Bool)

(assert (=> start!21626 e!141050))

(assert (=> start!21626 true))

(declare-fun b!216803 () Bool)

(declare-fun e!141051 () Bool)

(declare-fun mapRes!9618 () Bool)

(assert (=> b!216803 (= e!141051 (and e!141049 mapRes!9618))))

(declare-fun condMapEmpty!9618 () Bool)

(declare-fun mapDefault!9618 () ValueCell!2475)

(assert (=> b!216803 (= condMapEmpty!9618 (= (arr!4978 (_values!4058 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2475)) mapDefault!9618)))))

(declare-fun b!216804 () Bool)

(declare-fun e!141052 () Bool)

(assert (=> b!216804 (= e!141052 tp_is_empty!5637)))

(declare-fun b!216805 () Bool)

(assert (=> b!216805 (= e!141046 e!141048)))

(declare-fun res!106065 () Bool)

(assert (=> b!216805 (=> (not res!106065) (not e!141048))))

(declare-datatypes ((SeekEntryResult!752 0))(
  ( (MissingZero!752 (index!5178 (_ BitVec 32))) (Found!752 (index!5179 (_ BitVec 32))) (Intermediate!752 (undefined!1564 Bool) (index!5180 (_ BitVec 32)) (x!22672 (_ BitVec 32))) (Undefined!752) (MissingVacant!752 (index!5181 (_ BitVec 32))) )
))
(declare-fun lt!111231 () SeekEntryResult!752)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216805 (= res!106065 (or (= lt!111231 (MissingZero!752 index!297)) (= lt!111231 (MissingVacant!752 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10515 (_ BitVec 32)) SeekEntryResult!752)

(assert (=> b!216805 (= lt!111231 (seekEntryOrOpen!0 key!932 (_keys!6124 thiss!1504) (mask!9818 thiss!1504)))))

(declare-fun b!216806 () Bool)

(declare-fun res!106067 () Bool)

(assert (=> b!216806 (=> (not res!106067) (not e!141048))))

(declare-datatypes ((tuple2!4260 0))(
  ( (tuple2!4261 (_1!2141 (_ BitVec 64)) (_2!2141 V!7163)) )
))
(declare-datatypes ((List!3165 0))(
  ( (Nil!3162) (Cons!3161 (h!3808 tuple2!4260) (t!8120 List!3165)) )
))
(declare-datatypes ((ListLongMap!3173 0))(
  ( (ListLongMap!3174 (toList!1602 List!3165)) )
))
(declare-fun contains!1443 (ListLongMap!3173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1130 (array!10515 array!10513 (_ BitVec 32) (_ BitVec 32) V!7163 V!7163 (_ BitVec 32) Int) ListLongMap!3173)

(assert (=> b!216806 (= res!106067 (contains!1443 (getCurrentListMap!1130 (_keys!6124 thiss!1504) (_values!4058 thiss!1504) (mask!9818 thiss!1504) (extraKeys!3812 thiss!1504) (zeroValue!3916 thiss!1504) (minValue!3916 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4075 thiss!1504)) key!932))))

(declare-fun array_inv!3291 (array!10515) Bool)

(declare-fun array_inv!3292 (array!10513) Bool)

(assert (=> b!216807 (= e!141050 (and tp!20459 tp_is_empty!5637 (array_inv!3291 (_keys!6124 thiss!1504)) (array_inv!3292 (_values!4058 thiss!1504)) e!141051))))

(declare-fun b!216808 () Bool)

(declare-fun res!106063 () Bool)

(assert (=> b!216808 (=> (not res!106063) (not e!141046))))

(assert (=> b!216808 (= res!106063 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9618 () Bool)

(declare-fun tp!20460 () Bool)

(assert (=> mapNonEmpty!9618 (= mapRes!9618 (and tp!20460 e!141052))))

(declare-fun mapValue!9618 () ValueCell!2475)

(declare-fun mapKey!9618 () (_ BitVec 32))

(declare-fun mapRest!9618 () (Array (_ BitVec 32) ValueCell!2475))

(assert (=> mapNonEmpty!9618 (= (arr!4978 (_values!4058 thiss!1504)) (store mapRest!9618 mapKey!9618 mapValue!9618))))

(declare-fun b!216809 () Bool)

(declare-fun res!106062 () Bool)

(assert (=> b!216809 (=> (not res!106062) (not e!141048))))

(assert (=> b!216809 (= res!106062 (and (= (size!5310 (_values!4058 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9818 thiss!1504))) (= (size!5311 (_keys!6124 thiss!1504)) (size!5310 (_values!4058 thiss!1504))) (bvsge (mask!9818 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3812 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3812 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9618 () Bool)

(assert (=> mapIsEmpty!9618 mapRes!9618))

(assert (= (and start!21626 res!106064) b!216808))

(assert (= (and b!216808 res!106063) b!216805))

(assert (= (and b!216805 res!106065) b!216806))

(assert (= (and b!216806 res!106067) b!216802))

(assert (= (and b!216802 res!106066) b!216809))

(assert (= (and b!216809 res!106062) b!216799))

(assert (= (and b!216799 res!106068) b!216801))

(assert (= (and b!216803 condMapEmpty!9618) mapIsEmpty!9618))

(assert (= (and b!216803 (not condMapEmpty!9618)) mapNonEmpty!9618))

(get-info :version)

(assert (= (and mapNonEmpty!9618 ((_ is ValueCellFull!2475) mapValue!9618)) b!216804))

(assert (= (and b!216803 ((_ is ValueCellFull!2475) mapDefault!9618)) b!216800))

(assert (= b!216807 b!216803))

(assert (= start!21626 b!216807))

(declare-fun m!243369 () Bool)

(assert (=> b!216805 m!243369))

(declare-fun m!243371 () Bool)

(assert (=> b!216802 m!243371))

(declare-fun m!243373 () Bool)

(assert (=> mapNonEmpty!9618 m!243373))

(declare-fun m!243375 () Bool)

(assert (=> b!216807 m!243375))

(declare-fun m!243377 () Bool)

(assert (=> b!216807 m!243377))

(declare-fun m!243379 () Bool)

(assert (=> b!216799 m!243379))

(declare-fun m!243381 () Bool)

(assert (=> b!216801 m!243381))

(declare-fun m!243383 () Bool)

(assert (=> start!21626 m!243383))

(declare-fun m!243385 () Bool)

(assert (=> b!216806 m!243385))

(assert (=> b!216806 m!243385))

(declare-fun m!243387 () Bool)

(assert (=> b!216806 m!243387))

(check-sat (not b!216807) b_and!12665 (not start!21626) (not b!216799) (not mapNonEmpty!9618) (not b!216801) (not b!216805) (not b!216802) (not b_next!5775) (not b!216806) tp_is_empty!5637)
(check-sat b_and!12665 (not b_next!5775))

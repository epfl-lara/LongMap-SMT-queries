; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21616 () Bool)

(assert start!21616)

(declare-fun b!216430 () Bool)

(declare-fun b_free!5761 () Bool)

(declare-fun b_next!5761 () Bool)

(assert (=> b!216430 (= b_free!5761 (not b_next!5761))))

(declare-fun tp!20417 () Bool)

(declare-fun b_and!12625 () Bool)

(assert (=> b!216430 (= tp!20417 b_and!12625)))

(declare-fun b!216421 () Bool)

(declare-fun res!105826 () Bool)

(declare-fun e!140799 () Bool)

(assert (=> b!216421 (=> (not res!105826) (not e!140799))))

(declare-datatypes ((V!7145 0))(
  ( (V!7146 (val!2856 Int)) )
))
(declare-datatypes ((ValueCell!2468 0))(
  ( (ValueCellFull!2468 (v!4868 V!7145)) (EmptyCell!2468) )
))
(declare-datatypes ((array!10477 0))(
  ( (array!10478 (arr!4959 (Array (_ BitVec 32) ValueCell!2468)) (size!5292 (_ BitVec 32))) )
))
(declare-datatypes ((array!10479 0))(
  ( (array!10480 (arr!4960 (Array (_ BitVec 32) (_ BitVec 64))) (size!5293 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2836 0))(
  ( (LongMapFixedSize!2837 (defaultEntry!4068 Int) (mask!9806 (_ BitVec 32)) (extraKeys!3805 (_ BitVec 32)) (zeroValue!3909 V!7145) (minValue!3909 V!7145) (_size!1467 (_ BitVec 32)) (_keys!6116 array!10479) (_values!4051 array!10477) (_vacant!1467 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2836)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4212 0))(
  ( (tuple2!4213 (_1!2117 (_ BitVec 64)) (_2!2117 V!7145)) )
))
(declare-datatypes ((List!3135 0))(
  ( (Nil!3132) (Cons!3131 (h!3778 tuple2!4212) (t!8081 List!3135)) )
))
(declare-datatypes ((ListLongMap!3115 0))(
  ( (ListLongMap!3116 (toList!1573 List!3135)) )
))
(declare-fun contains!1414 (ListLongMap!3115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1082 (array!10479 array!10477 (_ BitVec 32) (_ BitVec 32) V!7145 V!7145 (_ BitVec 32) Int) ListLongMap!3115)

(assert (=> b!216421 (= res!105826 (contains!1414 (getCurrentListMap!1082 (_keys!6116 thiss!1504) (_values!4051 thiss!1504) (mask!9806 thiss!1504) (extraKeys!3805 thiss!1504) (zeroValue!3909 thiss!1504) (minValue!3909 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4068 thiss!1504)) key!932))))

(declare-fun b!216422 () Bool)

(declare-fun e!140801 () Bool)

(declare-fun e!140803 () Bool)

(declare-fun mapRes!9597 () Bool)

(assert (=> b!216422 (= e!140801 (and e!140803 mapRes!9597))))

(declare-fun condMapEmpty!9597 () Bool)

(declare-fun mapDefault!9597 () ValueCell!2468)

(assert (=> b!216422 (= condMapEmpty!9597 (= (arr!4959 (_values!4051 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2468)) mapDefault!9597)))))

(declare-fun res!105824 () Bool)

(declare-fun e!140798 () Bool)

(assert (=> start!21616 (=> (not res!105824) (not e!140798))))

(declare-fun valid!1170 (LongMapFixedSize!2836) Bool)

(assert (=> start!21616 (= res!105824 (valid!1170 thiss!1504))))

(assert (=> start!21616 e!140798))

(declare-fun e!140800 () Bool)

(assert (=> start!21616 e!140800))

(assert (=> start!21616 true))

(declare-fun mapIsEmpty!9597 () Bool)

(assert (=> mapIsEmpty!9597 mapRes!9597))

(declare-fun b!216423 () Bool)

(declare-fun tp_is_empty!5623 () Bool)

(assert (=> b!216423 (= e!140803 tp_is_empty!5623)))

(declare-fun b!216424 () Bool)

(declare-fun e!140802 () Bool)

(assert (=> b!216424 (= e!140802 tp_is_empty!5623)))

(declare-fun b!216425 () Bool)

(declare-fun res!105820 () Bool)

(assert (=> b!216425 (=> (not res!105820) (not e!140799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10479 (_ BitVec 32)) Bool)

(assert (=> b!216425 (= res!105820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6116 thiss!1504) (mask!9806 thiss!1504)))))

(declare-fun b!216426 () Bool)

(assert (=> b!216426 (= e!140798 e!140799)))

(declare-fun res!105821 () Bool)

(assert (=> b!216426 (=> (not res!105821) (not e!140799))))

(declare-datatypes ((SeekEntryResult!742 0))(
  ( (MissingZero!742 (index!5138 (_ BitVec 32))) (Found!742 (index!5139 (_ BitVec 32))) (Intermediate!742 (undefined!1554 Bool) (index!5140 (_ BitVec 32)) (x!22645 (_ BitVec 32))) (Undefined!742) (MissingVacant!742 (index!5141 (_ BitVec 32))) )
))
(declare-fun lt!111008 () SeekEntryResult!742)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216426 (= res!105821 (or (= lt!111008 (MissingZero!742 index!297)) (= lt!111008 (MissingVacant!742 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10479 (_ BitVec 32)) SeekEntryResult!742)

(assert (=> b!216426 (= lt!111008 (seekEntryOrOpen!0 key!932 (_keys!6116 thiss!1504) (mask!9806 thiss!1504)))))

(declare-fun b!216427 () Bool)

(declare-fun res!105822 () Bool)

(assert (=> b!216427 (=> (not res!105822) (not e!140799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216427 (= res!105822 (validMask!0 (mask!9806 thiss!1504)))))

(declare-fun mapNonEmpty!9597 () Bool)

(declare-fun tp!20418 () Bool)

(assert (=> mapNonEmpty!9597 (= mapRes!9597 (and tp!20418 e!140802))))

(declare-fun mapKey!9597 () (_ BitVec 32))

(declare-fun mapRest!9597 () (Array (_ BitVec 32) ValueCell!2468))

(declare-fun mapValue!9597 () ValueCell!2468)

(assert (=> mapNonEmpty!9597 (= (arr!4959 (_values!4051 thiss!1504)) (store mapRest!9597 mapKey!9597 mapValue!9597))))

(declare-fun b!216428 () Bool)

(declare-fun res!105825 () Bool)

(assert (=> b!216428 (=> (not res!105825) (not e!140799))))

(assert (=> b!216428 (= res!105825 (and (= (size!5292 (_values!4051 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9806 thiss!1504))) (= (size!5293 (_keys!6116 thiss!1504)) (size!5292 (_values!4051 thiss!1504))) (bvsge (mask!9806 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3805 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3805 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216429 () Bool)

(assert (=> b!216429 (= e!140799 false)))

(declare-fun lt!111007 () Bool)

(declare-datatypes ((List!3136 0))(
  ( (Nil!3133) (Cons!3132 (h!3779 (_ BitVec 64)) (t!8082 List!3136)) )
))
(declare-fun arrayNoDuplicates!0 (array!10479 (_ BitVec 32) List!3136) Bool)

(assert (=> b!216429 (= lt!111007 (arrayNoDuplicates!0 (_keys!6116 thiss!1504) #b00000000000000000000000000000000 Nil!3133))))

(declare-fun array_inv!3261 (array!10479) Bool)

(declare-fun array_inv!3262 (array!10477) Bool)

(assert (=> b!216430 (= e!140800 (and tp!20417 tp_is_empty!5623 (array_inv!3261 (_keys!6116 thiss!1504)) (array_inv!3262 (_values!4051 thiss!1504)) e!140801))))

(declare-fun b!216431 () Bool)

(declare-fun res!105823 () Bool)

(assert (=> b!216431 (=> (not res!105823) (not e!140798))))

(assert (=> b!216431 (= res!105823 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!21616 res!105824) b!216431))

(assert (= (and b!216431 res!105823) b!216426))

(assert (= (and b!216426 res!105821) b!216421))

(assert (= (and b!216421 res!105826) b!216427))

(assert (= (and b!216427 res!105822) b!216428))

(assert (= (and b!216428 res!105825) b!216425))

(assert (= (and b!216425 res!105820) b!216429))

(assert (= (and b!216422 condMapEmpty!9597) mapIsEmpty!9597))

(assert (= (and b!216422 (not condMapEmpty!9597)) mapNonEmpty!9597))

(get-info :version)

(assert (= (and mapNonEmpty!9597 ((_ is ValueCellFull!2468) mapValue!9597)) b!216424))

(assert (= (and b!216422 ((_ is ValueCellFull!2468) mapDefault!9597)) b!216423))

(assert (= b!216430 b!216422))

(assert (= start!21616 b!216430))

(declare-fun m!242613 () Bool)

(assert (=> b!216425 m!242613))

(declare-fun m!242615 () Bool)

(assert (=> b!216429 m!242615))

(declare-fun m!242617 () Bool)

(assert (=> mapNonEmpty!9597 m!242617))

(declare-fun m!242619 () Bool)

(assert (=> b!216430 m!242619))

(declare-fun m!242621 () Bool)

(assert (=> b!216430 m!242621))

(declare-fun m!242623 () Bool)

(assert (=> b!216427 m!242623))

(declare-fun m!242625 () Bool)

(assert (=> b!216426 m!242625))

(declare-fun m!242627 () Bool)

(assert (=> b!216421 m!242627))

(assert (=> b!216421 m!242627))

(declare-fun m!242629 () Bool)

(assert (=> b!216421 m!242629))

(declare-fun m!242631 () Bool)

(assert (=> start!21616 m!242631))

(check-sat (not start!21616) (not b!216421) (not b!216425) (not b!216430) (not mapNonEmpty!9597) (not b!216427) (not b!216429) (not b_next!5761) b_and!12625 tp_is_empty!5623 (not b!216426))
(check-sat b_and!12625 (not b_next!5761))

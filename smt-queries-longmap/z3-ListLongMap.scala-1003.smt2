; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21622 () Bool)

(assert start!21622)

(declare-fun b!216719 () Bool)

(declare-fun b_free!5767 () Bool)

(declare-fun b_next!5767 () Bool)

(assert (=> b!216719 (= b_free!5767 (not b_next!5767))))

(declare-fun tp!20436 () Bool)

(declare-fun b_and!12671 () Bool)

(assert (=> b!216719 (= tp!20436 b_and!12671)))

(declare-fun b!216714 () Bool)

(declare-fun res!106004 () Bool)

(declare-fun e!140989 () Bool)

(assert (=> b!216714 (=> (not res!106004) (not e!140989))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216714 (= res!106004 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216715 () Bool)

(declare-fun e!140987 () Bool)

(declare-fun e!140988 () Bool)

(declare-fun mapRes!9606 () Bool)

(assert (=> b!216715 (= e!140987 (and e!140988 mapRes!9606))))

(declare-fun condMapEmpty!9606 () Bool)

(declare-datatypes ((V!7153 0))(
  ( (V!7154 (val!2859 Int)) )
))
(declare-datatypes ((ValueCell!2471 0))(
  ( (ValueCellFull!2471 (v!4878 V!7153)) (EmptyCell!2471) )
))
(declare-datatypes ((array!10495 0))(
  ( (array!10496 (arr!4969 (Array (_ BitVec 32) ValueCell!2471)) (size!5301 (_ BitVec 32))) )
))
(declare-datatypes ((array!10497 0))(
  ( (array!10498 (arr!4970 (Array (_ BitVec 32) (_ BitVec 64))) (size!5302 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2842 0))(
  ( (LongMapFixedSize!2843 (defaultEntry!4071 Int) (mask!9812 (_ BitVec 32)) (extraKeys!3808 (_ BitVec 32)) (zeroValue!3912 V!7153) (minValue!3912 V!7153) (_size!1470 (_ BitVec 32)) (_keys!6120 array!10497) (_values!4054 array!10495) (_vacant!1470 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2842)

(declare-fun mapDefault!9606 () ValueCell!2471)

(assert (=> b!216715 (= condMapEmpty!9606 (= (arr!4969 (_values!4054 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2471)) mapDefault!9606)))))

(declare-fun b!216716 () Bool)

(declare-fun e!140991 () Bool)

(declare-fun tp_is_empty!5629 () Bool)

(assert (=> b!216716 (= e!140991 tp_is_empty!5629)))

(declare-fun b!216717 () Bool)

(declare-fun e!140992 () Bool)

(assert (=> b!216717 (= e!140989 e!140992)))

(declare-fun res!106001 () Bool)

(assert (=> b!216717 (=> (not res!106001) (not e!140992))))

(declare-datatypes ((SeekEntryResult!734 0))(
  ( (MissingZero!734 (index!5106 (_ BitVec 32))) (Found!734 (index!5107 (_ BitVec 32))) (Intermediate!734 (undefined!1546 Bool) (index!5108 (_ BitVec 32)) (x!22646 (_ BitVec 32))) (Undefined!734) (MissingVacant!734 (index!5109 (_ BitVec 32))) )
))
(declare-fun lt!111265 () SeekEntryResult!734)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216717 (= res!106001 (or (= lt!111265 (MissingZero!734 index!297)) (= lt!111265 (MissingVacant!734 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10497 (_ BitVec 32)) SeekEntryResult!734)

(assert (=> b!216717 (= lt!111265 (seekEntryOrOpen!0 key!932 (_keys!6120 thiss!1504) (mask!9812 thiss!1504)))))

(declare-fun b!216718 () Bool)

(declare-fun res!106003 () Bool)

(assert (=> b!216718 (=> (not res!106003) (not e!140992))))

(declare-datatypes ((tuple2!4182 0))(
  ( (tuple2!4183 (_1!2102 (_ BitVec 64)) (_2!2102 V!7153)) )
))
(declare-datatypes ((List!3084 0))(
  ( (Nil!3081) (Cons!3080 (h!3727 tuple2!4182) (t!8031 List!3084)) )
))
(declare-datatypes ((ListLongMap!3097 0))(
  ( (ListLongMap!3098 (toList!1564 List!3084)) )
))
(declare-fun contains!1419 (ListLongMap!3097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1096 (array!10497 array!10495 (_ BitVec 32) (_ BitVec 32) V!7153 V!7153 (_ BitVec 32) Int) ListLongMap!3097)

(assert (=> b!216718 (= res!106003 (contains!1419 (getCurrentListMap!1096 (_keys!6120 thiss!1504) (_values!4054 thiss!1504) (mask!9812 thiss!1504) (extraKeys!3808 thiss!1504) (zeroValue!3912 thiss!1504) (minValue!3912 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4071 thiss!1504)) key!932))))

(declare-fun res!106005 () Bool)

(assert (=> start!21622 (=> (not res!106005) (not e!140989))))

(declare-fun valid!1175 (LongMapFixedSize!2842) Bool)

(assert (=> start!21622 (= res!106005 (valid!1175 thiss!1504))))

(assert (=> start!21622 e!140989))

(declare-fun e!140990 () Bool)

(assert (=> start!21622 e!140990))

(assert (=> start!21622 true))

(declare-fun mapNonEmpty!9606 () Bool)

(declare-fun tp!20435 () Bool)

(assert (=> mapNonEmpty!9606 (= mapRes!9606 (and tp!20435 e!140991))))

(declare-fun mapValue!9606 () ValueCell!2471)

(declare-fun mapRest!9606 () (Array (_ BitVec 32) ValueCell!2471))

(declare-fun mapKey!9606 () (_ BitVec 32))

(assert (=> mapNonEmpty!9606 (= (arr!4969 (_values!4054 thiss!1504)) (store mapRest!9606 mapKey!9606 mapValue!9606))))

(declare-fun array_inv!3263 (array!10497) Bool)

(declare-fun array_inv!3264 (array!10495) Bool)

(assert (=> b!216719 (= e!140990 (and tp!20436 tp_is_empty!5629 (array_inv!3263 (_keys!6120 thiss!1504)) (array_inv!3264 (_values!4054 thiss!1504)) e!140987))))

(declare-fun mapIsEmpty!9606 () Bool)

(assert (=> mapIsEmpty!9606 mapRes!9606))

(declare-fun b!216720 () Bool)

(declare-fun res!105999 () Bool)

(assert (=> b!216720 (=> (not res!105999) (not e!140992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216720 (= res!105999 (validMask!0 (mask!9812 thiss!1504)))))

(declare-fun b!216721 () Bool)

(declare-fun res!106000 () Bool)

(assert (=> b!216721 (=> (not res!106000) (not e!140992))))

(assert (=> b!216721 (= res!106000 (and (= (size!5301 (_values!4054 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9812 thiss!1504))) (= (size!5302 (_keys!6120 thiss!1504)) (size!5301 (_values!4054 thiss!1504))) (bvsge (mask!9812 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3808 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3808 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216722 () Bool)

(assert (=> b!216722 (= e!140992 false)))

(declare-fun lt!111266 () Bool)

(declare-datatypes ((List!3085 0))(
  ( (Nil!3082) (Cons!3081 (h!3728 (_ BitVec 64)) (t!8032 List!3085)) )
))
(declare-fun arrayNoDuplicates!0 (array!10497 (_ BitVec 32) List!3085) Bool)

(assert (=> b!216722 (= lt!111266 (arrayNoDuplicates!0 (_keys!6120 thiss!1504) #b00000000000000000000000000000000 Nil!3082))))

(declare-fun b!216723 () Bool)

(assert (=> b!216723 (= e!140988 tp_is_empty!5629)))

(declare-fun b!216724 () Bool)

(declare-fun res!106002 () Bool)

(assert (=> b!216724 (=> (not res!106002) (not e!140992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10497 (_ BitVec 32)) Bool)

(assert (=> b!216724 (= res!106002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6120 thiss!1504) (mask!9812 thiss!1504)))))

(assert (= (and start!21622 res!106005) b!216714))

(assert (= (and b!216714 res!106004) b!216717))

(assert (= (and b!216717 res!106001) b!216718))

(assert (= (and b!216718 res!106003) b!216720))

(assert (= (and b!216720 res!105999) b!216721))

(assert (= (and b!216721 res!106000) b!216724))

(assert (= (and b!216724 res!106002) b!216722))

(assert (= (and b!216715 condMapEmpty!9606) mapIsEmpty!9606))

(assert (= (and b!216715 (not condMapEmpty!9606)) mapNonEmpty!9606))

(get-info :version)

(assert (= (and mapNonEmpty!9606 ((_ is ValueCellFull!2471) mapValue!9606)) b!216716))

(assert (= (and b!216715 ((_ is ValueCellFull!2471) mapDefault!9606)) b!216723))

(assert (= b!216719 b!216715))

(assert (= start!21622 b!216719))

(declare-fun m!243471 () Bool)

(assert (=> b!216718 m!243471))

(assert (=> b!216718 m!243471))

(declare-fun m!243473 () Bool)

(assert (=> b!216718 m!243473))

(declare-fun m!243475 () Bool)

(assert (=> b!216717 m!243475))

(declare-fun m!243477 () Bool)

(assert (=> start!21622 m!243477))

(declare-fun m!243479 () Bool)

(assert (=> mapNonEmpty!9606 m!243479))

(declare-fun m!243481 () Bool)

(assert (=> b!216720 m!243481))

(declare-fun m!243483 () Bool)

(assert (=> b!216719 m!243483))

(declare-fun m!243485 () Bool)

(assert (=> b!216719 m!243485))

(declare-fun m!243487 () Bool)

(assert (=> b!216722 m!243487))

(declare-fun m!243489 () Bool)

(assert (=> b!216724 m!243489))

(check-sat (not b!216717) (not b!216719) (not b!216722) b_and!12671 (not mapNonEmpty!9606) tp_is_empty!5629 (not b!216718) (not start!21622) (not b_next!5767) (not b!216720) (not b!216724))
(check-sat b_and!12671 (not b_next!5767))

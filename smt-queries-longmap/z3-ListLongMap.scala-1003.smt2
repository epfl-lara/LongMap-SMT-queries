; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21622 () Bool)

(assert start!21622)

(declare-fun b!216530 () Bool)

(declare-fun b_free!5767 () Bool)

(declare-fun b_next!5767 () Bool)

(assert (=> b!216530 (= b_free!5767 (not b_next!5767))))

(declare-fun tp!20435 () Bool)

(declare-fun b_and!12631 () Bool)

(assert (=> b!216530 (= tp!20435 b_and!12631)))

(declare-fun b!216520 () Bool)

(declare-fun res!105888 () Bool)

(declare-fun e!140862 () Bool)

(assert (=> b!216520 (=> (not res!105888) (not e!140862))))

(declare-datatypes ((V!7153 0))(
  ( (V!7154 (val!2859 Int)) )
))
(declare-datatypes ((ValueCell!2471 0))(
  ( (ValueCellFull!2471 (v!4871 V!7153)) (EmptyCell!2471) )
))
(declare-datatypes ((array!10489 0))(
  ( (array!10490 (arr!4965 (Array (_ BitVec 32) ValueCell!2471)) (size!5298 (_ BitVec 32))) )
))
(declare-datatypes ((array!10491 0))(
  ( (array!10492 (arr!4966 (Array (_ BitVec 32) (_ BitVec 64))) (size!5299 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2842 0))(
  ( (LongMapFixedSize!2843 (defaultEntry!4071 Int) (mask!9811 (_ BitVec 32)) (extraKeys!3808 (_ BitVec 32)) (zeroValue!3912 V!7153) (minValue!3912 V!7153) (_size!1470 (_ BitVec 32)) (_keys!6119 array!10491) (_values!4054 array!10489) (_vacant!1470 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2842)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10491 (_ BitVec 32)) Bool)

(assert (=> b!216520 (= res!105888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6119 thiss!1504) (mask!9811 thiss!1504)))))

(declare-fun b!216521 () Bool)

(declare-fun e!140863 () Bool)

(assert (=> b!216521 (= e!140863 e!140862)))

(declare-fun res!105886 () Bool)

(assert (=> b!216521 (=> (not res!105886) (not e!140862))))

(declare-datatypes ((SeekEntryResult!744 0))(
  ( (MissingZero!744 (index!5146 (_ BitVec 32))) (Found!744 (index!5147 (_ BitVec 32))) (Intermediate!744 (undefined!1556 Bool) (index!5148 (_ BitVec 32)) (x!22655 (_ BitVec 32))) (Undefined!744) (MissingVacant!744 (index!5149 (_ BitVec 32))) )
))
(declare-fun lt!111026 () SeekEntryResult!744)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216521 (= res!105886 (or (= lt!111026 (MissingZero!744 index!297)) (= lt!111026 (MissingVacant!744 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10491 (_ BitVec 32)) SeekEntryResult!744)

(assert (=> b!216521 (= lt!111026 (seekEntryOrOpen!0 key!932 (_keys!6119 thiss!1504) (mask!9811 thiss!1504)))))

(declare-fun b!216522 () Bool)

(declare-fun e!140861 () Bool)

(declare-fun e!140866 () Bool)

(declare-fun mapRes!9606 () Bool)

(assert (=> b!216522 (= e!140861 (and e!140866 mapRes!9606))))

(declare-fun condMapEmpty!9606 () Bool)

(declare-fun mapDefault!9606 () ValueCell!2471)

(assert (=> b!216522 (= condMapEmpty!9606 (= (arr!4965 (_values!4054 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2471)) mapDefault!9606)))))

(declare-fun b!216523 () Bool)

(declare-fun tp_is_empty!5629 () Bool)

(assert (=> b!216523 (= e!140866 tp_is_empty!5629)))

(declare-fun b!216524 () Bool)

(declare-fun res!105883 () Bool)

(assert (=> b!216524 (=> (not res!105883) (not e!140862))))

(declare-datatypes ((tuple2!4216 0))(
  ( (tuple2!4217 (_1!2119 (_ BitVec 64)) (_2!2119 V!7153)) )
))
(declare-datatypes ((List!3140 0))(
  ( (Nil!3137) (Cons!3136 (h!3783 tuple2!4216) (t!8086 List!3140)) )
))
(declare-datatypes ((ListLongMap!3119 0))(
  ( (ListLongMap!3120 (toList!1575 List!3140)) )
))
(declare-fun contains!1416 (ListLongMap!3119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1084 (array!10491 array!10489 (_ BitVec 32) (_ BitVec 32) V!7153 V!7153 (_ BitVec 32) Int) ListLongMap!3119)

(assert (=> b!216524 (= res!105883 (contains!1416 (getCurrentListMap!1084 (_keys!6119 thiss!1504) (_values!4054 thiss!1504) (mask!9811 thiss!1504) (extraKeys!3808 thiss!1504) (zeroValue!3912 thiss!1504) (minValue!3912 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4071 thiss!1504)) key!932))))

(declare-fun b!216525 () Bool)

(assert (=> b!216525 (= e!140862 false)))

(declare-fun lt!111025 () Bool)

(declare-datatypes ((List!3141 0))(
  ( (Nil!3138) (Cons!3137 (h!3784 (_ BitVec 64)) (t!8087 List!3141)) )
))
(declare-fun arrayNoDuplicates!0 (array!10491 (_ BitVec 32) List!3141) Bool)

(assert (=> b!216525 (= lt!111025 (arrayNoDuplicates!0 (_keys!6119 thiss!1504) #b00000000000000000000000000000000 Nil!3138))))

(declare-fun b!216527 () Bool)

(declare-fun res!105887 () Bool)

(assert (=> b!216527 (=> (not res!105887) (not e!140862))))

(assert (=> b!216527 (= res!105887 (and (= (size!5298 (_values!4054 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9811 thiss!1504))) (= (size!5299 (_keys!6119 thiss!1504)) (size!5298 (_values!4054 thiss!1504))) (bvsge (mask!9811 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3808 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3808 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216528 () Bool)

(declare-fun e!140867 () Bool)

(assert (=> b!216528 (= e!140867 tp_is_empty!5629)))

(declare-fun mapNonEmpty!9606 () Bool)

(declare-fun tp!20436 () Bool)

(assert (=> mapNonEmpty!9606 (= mapRes!9606 (and tp!20436 e!140867))))

(declare-fun mapRest!9606 () (Array (_ BitVec 32) ValueCell!2471))

(declare-fun mapValue!9606 () ValueCell!2471)

(declare-fun mapKey!9606 () (_ BitVec 32))

(assert (=> mapNonEmpty!9606 (= (arr!4965 (_values!4054 thiss!1504)) (store mapRest!9606 mapKey!9606 mapValue!9606))))

(declare-fun mapIsEmpty!9606 () Bool)

(assert (=> mapIsEmpty!9606 mapRes!9606))

(declare-fun b!216529 () Bool)

(declare-fun res!105884 () Bool)

(assert (=> b!216529 (=> (not res!105884) (not e!140863))))

(assert (=> b!216529 (= res!105884 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!140865 () Bool)

(declare-fun array_inv!3267 (array!10491) Bool)

(declare-fun array_inv!3268 (array!10489) Bool)

(assert (=> b!216530 (= e!140865 (and tp!20435 tp_is_empty!5629 (array_inv!3267 (_keys!6119 thiss!1504)) (array_inv!3268 (_values!4054 thiss!1504)) e!140861))))

(declare-fun res!105885 () Bool)

(assert (=> start!21622 (=> (not res!105885) (not e!140863))))

(declare-fun valid!1171 (LongMapFixedSize!2842) Bool)

(assert (=> start!21622 (= res!105885 (valid!1171 thiss!1504))))

(assert (=> start!21622 e!140863))

(assert (=> start!21622 e!140865))

(assert (=> start!21622 true))

(declare-fun b!216526 () Bool)

(declare-fun res!105889 () Bool)

(assert (=> b!216526 (=> (not res!105889) (not e!140862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216526 (= res!105889 (validMask!0 (mask!9811 thiss!1504)))))

(assert (= (and start!21622 res!105885) b!216529))

(assert (= (and b!216529 res!105884) b!216521))

(assert (= (and b!216521 res!105886) b!216524))

(assert (= (and b!216524 res!105883) b!216526))

(assert (= (and b!216526 res!105889) b!216527))

(assert (= (and b!216527 res!105887) b!216520))

(assert (= (and b!216520 res!105888) b!216525))

(assert (= (and b!216522 condMapEmpty!9606) mapIsEmpty!9606))

(assert (= (and b!216522 (not condMapEmpty!9606)) mapNonEmpty!9606))

(get-info :version)

(assert (= (and mapNonEmpty!9606 ((_ is ValueCellFull!2471) mapValue!9606)) b!216528))

(assert (= (and b!216522 ((_ is ValueCellFull!2471) mapDefault!9606)) b!216523))

(assert (= b!216530 b!216522))

(assert (= start!21622 b!216530))

(declare-fun m!242673 () Bool)

(assert (=> b!216530 m!242673))

(declare-fun m!242675 () Bool)

(assert (=> b!216530 m!242675))

(declare-fun m!242677 () Bool)

(assert (=> start!21622 m!242677))

(declare-fun m!242679 () Bool)

(assert (=> b!216520 m!242679))

(declare-fun m!242681 () Bool)

(assert (=> b!216526 m!242681))

(declare-fun m!242683 () Bool)

(assert (=> b!216521 m!242683))

(declare-fun m!242685 () Bool)

(assert (=> mapNonEmpty!9606 m!242685))

(declare-fun m!242687 () Bool)

(assert (=> b!216525 m!242687))

(declare-fun m!242689 () Bool)

(assert (=> b!216524 m!242689))

(assert (=> b!216524 m!242689))

(declare-fun m!242691 () Bool)

(assert (=> b!216524 m!242691))

(check-sat (not mapNonEmpty!9606) (not b!216525) b_and!12631 (not b!216520) (not b!216521) (not b!216530) (not start!21622) (not b!216524) (not b!216526) (not b_next!5767) tp_is_empty!5629)
(check-sat b_and!12631 (not b_next!5767))

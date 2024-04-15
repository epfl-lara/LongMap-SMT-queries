; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17694 () Bool)

(assert start!17694)

(declare-fun b!176685 () Bool)

(declare-fun b_free!4363 () Bool)

(declare-fun b_next!4363 () Bool)

(assert (=> b!176685 (= b_free!4363 (not b_next!4363))))

(declare-fun tp!15786 () Bool)

(declare-fun b_and!10835 () Bool)

(assert (=> b!176685 (= tp!15786 b_and!10835)))

(declare-fun b!176676 () Bool)

(declare-fun res!83704 () Bool)

(declare-fun e!116531 () Bool)

(assert (=> b!176676 (=> (not res!83704) (not e!116531))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!176676 (= res!83704 (not (= key!828 (bvneg key!828))))))

(declare-fun res!83703 () Bool)

(assert (=> start!17694 (=> (not res!83703) (not e!116531))))

(declare-datatypes ((V!5161 0))(
  ( (V!5162 (val!2112 Int)) )
))
(declare-datatypes ((ValueCell!1724 0))(
  ( (ValueCellFull!1724 (v!3985 V!5161)) (EmptyCell!1724) )
))
(declare-datatypes ((array!7399 0))(
  ( (array!7400 (arr!3508 (Array (_ BitVec 32) (_ BitVec 64))) (size!3813 (_ BitVec 32))) )
))
(declare-datatypes ((array!7401 0))(
  ( (array!7402 (arr!3509 (Array (_ BitVec 32) ValueCell!1724)) (size!3814 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2356 0))(
  ( (LongMapFixedSize!2357 (defaultEntry!3640 Int) (mask!8566 (_ BitVec 32)) (extraKeys!3377 (_ BitVec 32)) (zeroValue!3481 V!5161) (minValue!3481 V!5161) (_size!1227 (_ BitVec 32)) (_keys!5504 array!7399) (_values!3623 array!7401) (_vacant!1227 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2356)

(declare-fun valid!1008 (LongMapFixedSize!2356) Bool)

(assert (=> start!17694 (= res!83703 (valid!1008 thiss!1248))))

(assert (=> start!17694 e!116531))

(declare-fun e!116535 () Bool)

(assert (=> start!17694 e!116535))

(assert (=> start!17694 true))

(declare-fun b!176677 () Bool)

(declare-fun e!116530 () Bool)

(declare-fun tp_is_empty!4135 () Bool)

(assert (=> b!176677 (= e!116530 tp_is_empty!4135)))

(declare-fun b!176678 () Bool)

(assert (=> b!176678 (= e!116531 false)))

(declare-fun lt!87293 () Bool)

(declare-datatypes ((List!2245 0))(
  ( (Nil!2242) (Cons!2241 (h!2862 (_ BitVec 64)) (t!7064 List!2245)) )
))
(declare-fun arrayNoDuplicates!0 (array!7399 (_ BitVec 32) List!2245) Bool)

(assert (=> b!176678 (= lt!87293 (arrayNoDuplicates!0 (_keys!5504 thiss!1248) #b00000000000000000000000000000000 Nil!2242))))

(declare-fun b!176679 () Bool)

(declare-fun e!116533 () Bool)

(declare-fun mapRes!7062 () Bool)

(assert (=> b!176679 (= e!116533 (and e!116530 mapRes!7062))))

(declare-fun condMapEmpty!7062 () Bool)

(declare-fun mapDefault!7062 () ValueCell!1724)

(assert (=> b!176679 (= condMapEmpty!7062 (= (arr!3509 (_values!3623 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1724)) mapDefault!7062)))))

(declare-fun b!176680 () Bool)

(declare-fun res!83701 () Bool)

(assert (=> b!176680 (=> (not res!83701) (not e!116531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176680 (= res!83701 (validMask!0 (mask!8566 thiss!1248)))))

(declare-fun b!176681 () Bool)

(declare-fun res!83705 () Bool)

(assert (=> b!176681 (=> (not res!83705) (not e!116531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7399 (_ BitVec 32)) Bool)

(assert (=> b!176681 (= res!83705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5504 thiss!1248) (mask!8566 thiss!1248)))))

(declare-fun b!176682 () Bool)

(declare-fun res!83700 () Bool)

(assert (=> b!176682 (=> (not res!83700) (not e!116531))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!571 0))(
  ( (MissingZero!571 (index!4452 (_ BitVec 32))) (Found!571 (index!4453 (_ BitVec 32))) (Intermediate!571 (undefined!1383 Bool) (index!4454 (_ BitVec 32)) (x!19416 (_ BitVec 32))) (Undefined!571) (MissingVacant!571 (index!4455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7399 (_ BitVec 32)) SeekEntryResult!571)

(assert (=> b!176682 (= res!83700 ((_ is Undefined!571) (seekEntryOrOpen!0 key!828 (_keys!5504 thiss!1248) (mask!8566 thiss!1248))))))

(declare-fun b!176683 () Bool)

(declare-fun e!116534 () Bool)

(assert (=> b!176683 (= e!116534 tp_is_empty!4135)))

(declare-fun mapIsEmpty!7062 () Bool)

(assert (=> mapIsEmpty!7062 mapRes!7062))

(declare-fun b!176684 () Bool)

(declare-fun res!83706 () Bool)

(assert (=> b!176684 (=> (not res!83706) (not e!116531))))

(assert (=> b!176684 (= res!83706 (and (= (size!3814 (_values!3623 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8566 thiss!1248))) (= (size!3813 (_keys!5504 thiss!1248)) (size!3814 (_values!3623 thiss!1248))) (bvsge (mask!8566 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3377 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3377 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun array_inv!2265 (array!7399) Bool)

(declare-fun array_inv!2266 (array!7401) Bool)

(assert (=> b!176685 (= e!116535 (and tp!15786 tp_is_empty!4135 (array_inv!2265 (_keys!5504 thiss!1248)) (array_inv!2266 (_values!3623 thiss!1248)) e!116533))))

(declare-fun b!176686 () Bool)

(declare-fun res!83702 () Bool)

(assert (=> b!176686 (=> (not res!83702) (not e!116531))))

(declare-datatypes ((tuple2!3276 0))(
  ( (tuple2!3277 (_1!1649 (_ BitVec 64)) (_2!1649 V!5161)) )
))
(declare-datatypes ((List!2246 0))(
  ( (Nil!2243) (Cons!2242 (h!2863 tuple2!3276) (t!7065 List!2246)) )
))
(declare-datatypes ((ListLongMap!2195 0))(
  ( (ListLongMap!2196 (toList!1113 List!2246)) )
))
(declare-fun contains!1183 (ListLongMap!2195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!749 (array!7399 array!7401 (_ BitVec 32) (_ BitVec 32) V!5161 V!5161 (_ BitVec 32) Int) ListLongMap!2195)

(assert (=> b!176686 (= res!83702 (contains!1183 (getCurrentListMap!749 (_keys!5504 thiss!1248) (_values!3623 thiss!1248) (mask!8566 thiss!1248) (extraKeys!3377 thiss!1248) (zeroValue!3481 thiss!1248) (minValue!3481 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3640 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7062 () Bool)

(declare-fun tp!15785 () Bool)

(assert (=> mapNonEmpty!7062 (= mapRes!7062 (and tp!15785 e!116534))))

(declare-fun mapValue!7062 () ValueCell!1724)

(declare-fun mapRest!7062 () (Array (_ BitVec 32) ValueCell!1724))

(declare-fun mapKey!7062 () (_ BitVec 32))

(assert (=> mapNonEmpty!7062 (= (arr!3509 (_values!3623 thiss!1248)) (store mapRest!7062 mapKey!7062 mapValue!7062))))

(assert (= (and start!17694 res!83703) b!176676))

(assert (= (and b!176676 res!83704) b!176682))

(assert (= (and b!176682 res!83700) b!176686))

(assert (= (and b!176686 res!83702) b!176680))

(assert (= (and b!176680 res!83701) b!176684))

(assert (= (and b!176684 res!83706) b!176681))

(assert (= (and b!176681 res!83705) b!176678))

(assert (= (and b!176679 condMapEmpty!7062) mapIsEmpty!7062))

(assert (= (and b!176679 (not condMapEmpty!7062)) mapNonEmpty!7062))

(assert (= (and mapNonEmpty!7062 ((_ is ValueCellFull!1724) mapValue!7062)) b!176683))

(assert (= (and b!176679 ((_ is ValueCellFull!1724) mapDefault!7062)) b!176677))

(assert (= b!176685 b!176679))

(assert (= start!17694 b!176685))

(declare-fun m!204901 () Bool)

(assert (=> b!176686 m!204901))

(assert (=> b!176686 m!204901))

(declare-fun m!204903 () Bool)

(assert (=> b!176686 m!204903))

(declare-fun m!204905 () Bool)

(assert (=> b!176678 m!204905))

(declare-fun m!204907 () Bool)

(assert (=> mapNonEmpty!7062 m!204907))

(declare-fun m!204909 () Bool)

(assert (=> b!176682 m!204909))

(declare-fun m!204911 () Bool)

(assert (=> start!17694 m!204911))

(declare-fun m!204913 () Bool)

(assert (=> b!176685 m!204913))

(declare-fun m!204915 () Bool)

(assert (=> b!176685 m!204915))

(declare-fun m!204917 () Bool)

(assert (=> b!176680 m!204917))

(declare-fun m!204919 () Bool)

(assert (=> b!176681 m!204919))

(check-sat b_and!10835 (not mapNonEmpty!7062) (not b!176681) (not b!176680) (not b!176678) (not b!176685) (not b!176682) tp_is_empty!4135 (not b!176686) (not start!17694) (not b_next!4363))
(check-sat b_and!10835 (not b_next!4363))

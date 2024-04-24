; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16252 () Bool)

(assert start!16252)

(declare-fun b!162163 () Bool)

(declare-fun b_free!3709 () Bool)

(declare-fun b_next!3709 () Bool)

(assert (=> b!162163 (= b_free!3709 (not b_next!3709))))

(declare-fun tp!13696 () Bool)

(declare-fun b_and!10137 () Bool)

(assert (=> b!162163 (= tp!13696 b_and!10137)))

(declare-fun b!162159 () Bool)

(declare-fun e!106152 () Bool)

(assert (=> b!162159 (= e!106152 false)))

(declare-fun lt!82436 () Bool)

(declare-datatypes ((V!4329 0))(
  ( (V!4330 (val!1800 Int)) )
))
(declare-fun v!309 () V!4329)

(declare-datatypes ((ValueCell!1412 0))(
  ( (ValueCellFull!1412 (v!3666 V!4329)) (EmptyCell!1412) )
))
(declare-datatypes ((array!6087 0))(
  ( (array!6088 (arr!2888 (Array (_ BitVec 32) (_ BitVec 64))) (size!3172 (_ BitVec 32))) )
))
(declare-datatypes ((array!6089 0))(
  ( (array!6090 (arr!2889 (Array (_ BitVec 32) ValueCell!1412)) (size!3173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1732 0))(
  ( (LongMapFixedSize!1733 (defaultEntry!3308 Int) (mask!7920 (_ BitVec 32)) (extraKeys!3049 (_ BitVec 32)) (zeroValue!3151 V!4329) (minValue!3151 V!4329) (_size!915 (_ BitVec 32)) (_keys!5109 array!6087) (_values!3291 array!6089) (_vacant!915 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1732)

(declare-datatypes ((SeekEntryResult!366 0))(
  ( (MissingZero!366 (index!3632 (_ BitVec 32))) (Found!366 (index!3633 (_ BitVec 32))) (Intermediate!366 (undefined!1178 Bool) (index!3634 (_ BitVec 32)) (x!17910 (_ BitVec 32))) (Undefined!366) (MissingVacant!366 (index!3635 (_ BitVec 32))) )
))
(declare-fun lt!82437 () SeekEntryResult!366)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun valid!805 (LongMapFixedSize!1732) Bool)

(declare-datatypes ((tuple2!2940 0))(
  ( (tuple2!2941 (_1!1481 Bool) (_2!1481 LongMapFixedSize!1732)) )
))
(declare-fun updateHelperNewKey!78 (LongMapFixedSize!1732 (_ BitVec 64) V!4329 (_ BitVec 32)) tuple2!2940)

(assert (=> b!162159 (= lt!82436 (valid!805 (_2!1481 (updateHelperNewKey!78 thiss!1248 key!828 v!309 (index!3635 lt!82437)))))))

(declare-fun b!162160 () Bool)

(declare-fun e!106157 () Bool)

(declare-fun tp_is_empty!3511 () Bool)

(assert (=> b!162160 (= e!106157 tp_is_empty!3511)))

(declare-fun b!162161 () Bool)

(declare-fun res!76821 () Bool)

(declare-fun e!106156 () Bool)

(assert (=> b!162161 (=> (not res!76821) (not e!106156))))

(assert (=> b!162161 (= res!76821 (not (= key!828 (bvneg key!828))))))

(declare-fun e!106154 () Bool)

(declare-fun e!106153 () Bool)

(declare-fun array_inv!1851 (array!6087) Bool)

(declare-fun array_inv!1852 (array!6089) Bool)

(assert (=> b!162163 (= e!106154 (and tp!13696 tp_is_empty!3511 (array_inv!1851 (_keys!5109 thiss!1248)) (array_inv!1852 (_values!3291 thiss!1248)) e!106153))))

(declare-fun mapNonEmpty!5954 () Bool)

(declare-fun mapRes!5954 () Bool)

(declare-fun tp!13697 () Bool)

(assert (=> mapNonEmpty!5954 (= mapRes!5954 (and tp!13697 e!106157))))

(declare-fun mapValue!5954 () ValueCell!1412)

(declare-fun mapKey!5954 () (_ BitVec 32))

(declare-fun mapRest!5954 () (Array (_ BitVec 32) ValueCell!1412))

(assert (=> mapNonEmpty!5954 (= (arr!2889 (_values!3291 thiss!1248)) (store mapRest!5954 mapKey!5954 mapValue!5954))))

(declare-fun b!162164 () Bool)

(declare-fun e!106155 () Bool)

(assert (=> b!162164 (= e!106155 tp_is_empty!3511)))

(declare-fun mapIsEmpty!5954 () Bool)

(assert (=> mapIsEmpty!5954 mapRes!5954))

(declare-fun b!162165 () Bool)

(assert (=> b!162165 (= e!106156 e!106152)))

(declare-fun res!76823 () Bool)

(assert (=> b!162165 (=> (not res!76823) (not e!106152))))

(get-info :version)

(assert (=> b!162165 (= res!76823 (and (not ((_ is Undefined!366) lt!82437)) ((_ is MissingVacant!366) lt!82437)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6087 (_ BitVec 32)) SeekEntryResult!366)

(assert (=> b!162165 (= lt!82437 (seekEntryOrOpen!0 key!828 (_keys!5109 thiss!1248) (mask!7920 thiss!1248)))))

(declare-fun res!76822 () Bool)

(assert (=> start!16252 (=> (not res!76822) (not e!106156))))

(assert (=> start!16252 (= res!76822 (valid!805 thiss!1248))))

(assert (=> start!16252 e!106156))

(assert (=> start!16252 e!106154))

(assert (=> start!16252 true))

(assert (=> start!16252 tp_is_empty!3511))

(declare-fun b!162162 () Bool)

(assert (=> b!162162 (= e!106153 (and e!106155 mapRes!5954))))

(declare-fun condMapEmpty!5954 () Bool)

(declare-fun mapDefault!5954 () ValueCell!1412)

(assert (=> b!162162 (= condMapEmpty!5954 (= (arr!2889 (_values!3291 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1412)) mapDefault!5954)))))

(assert (= (and start!16252 res!76822) b!162161))

(assert (= (and b!162161 res!76821) b!162165))

(assert (= (and b!162165 res!76823) b!162159))

(assert (= (and b!162162 condMapEmpty!5954) mapIsEmpty!5954))

(assert (= (and b!162162 (not condMapEmpty!5954)) mapNonEmpty!5954))

(assert (= (and mapNonEmpty!5954 ((_ is ValueCellFull!1412) mapValue!5954)) b!162160))

(assert (= (and b!162162 ((_ is ValueCellFull!1412) mapDefault!5954)) b!162164))

(assert (= b!162163 b!162162))

(assert (= start!16252 b!162163))

(declare-fun m!193541 () Bool)

(assert (=> start!16252 m!193541))

(declare-fun m!193543 () Bool)

(assert (=> b!162159 m!193543))

(declare-fun m!193545 () Bool)

(assert (=> b!162159 m!193545))

(declare-fun m!193547 () Bool)

(assert (=> b!162165 m!193547))

(declare-fun m!193549 () Bool)

(assert (=> mapNonEmpty!5954 m!193549))

(declare-fun m!193551 () Bool)

(assert (=> b!162163 m!193551))

(declare-fun m!193553 () Bool)

(assert (=> b!162163 m!193553))

(check-sat (not b!162163) (not start!16252) (not b!162159) (not b!162165) tp_is_empty!3511 (not b_next!3709) (not mapNonEmpty!5954) b_and!10137)
(check-sat b_and!10137 (not b_next!3709))

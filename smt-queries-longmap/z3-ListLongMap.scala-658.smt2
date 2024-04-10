; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16298 () Bool)

(assert start!16298)

(declare-fun b!162640 () Bool)

(declare-fun b_free!3759 () Bool)

(declare-fun b_next!3759 () Bool)

(assert (=> b!162640 (= b_free!3759 (not b_next!3759))))

(declare-fun tp!13846 () Bool)

(declare-fun b_and!10173 () Bool)

(assert (=> b!162640 (= tp!13846 b_and!10173)))

(declare-fun b!162637 () Bool)

(declare-fun e!106641 () Bool)

(assert (=> b!162637 (= e!106641 false)))

(declare-fun lt!82509 () Bool)

(declare-datatypes ((V!4395 0))(
  ( (V!4396 (val!1825 Int)) )
))
(declare-datatypes ((ValueCell!1437 0))(
  ( (ValueCellFull!1437 (v!3690 V!4395)) (EmptyCell!1437) )
))
(declare-datatypes ((array!6201 0))(
  ( (array!6202 (arr!2945 (Array (_ BitVec 32) (_ BitVec 64))) (size!3229 (_ BitVec 32))) )
))
(declare-datatypes ((array!6203 0))(
  ( (array!6204 (arr!2946 (Array (_ BitVec 32) ValueCell!1437)) (size!3230 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1782 0))(
  ( (LongMapFixedSize!1783 (defaultEntry!3333 Int) (mask!7961 (_ BitVec 32)) (extraKeys!3074 (_ BitVec 32)) (zeroValue!3176 V!4395) (minValue!3176 V!4395) (_size!940 (_ BitVec 32)) (_keys!5134 array!6201) (_values!3316 array!6203) (_vacant!940 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1782)

(declare-datatypes ((SeekEntryResult!387 0))(
  ( (MissingZero!387 (index!3716 (_ BitVec 32))) (Found!387 (index!3717 (_ BitVec 32))) (Intermediate!387 (undefined!1199 Bool) (index!3718 (_ BitVec 32)) (x!17995 (_ BitVec 32))) (Undefined!387) (MissingVacant!387 (index!3719 (_ BitVec 32))) )
))
(declare-fun lt!82510 () SeekEntryResult!387)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4395)

(declare-fun valid!803 (LongMapFixedSize!1782) Bool)

(declare-datatypes ((tuple2!3006 0))(
  ( (tuple2!3007 (_1!1514 Bool) (_2!1514 LongMapFixedSize!1782)) )
))
(declare-fun updateHelperNewKey!83 (LongMapFixedSize!1782 (_ BitVec 64) V!4395 (_ BitVec 32)) tuple2!3006)

(assert (=> b!162637 (= lt!82509 (valid!803 (_2!1514 (updateHelperNewKey!83 thiss!1248 key!828 v!309 (index!3716 lt!82510)))))))

(declare-fun b!162638 () Bool)

(declare-fun e!106638 () Bool)

(declare-fun e!106639 () Bool)

(declare-fun mapRes!6029 () Bool)

(assert (=> b!162638 (= e!106638 (and e!106639 mapRes!6029))))

(declare-fun condMapEmpty!6029 () Bool)

(declare-fun mapDefault!6029 () ValueCell!1437)

(assert (=> b!162638 (= condMapEmpty!6029 (= (arr!2946 (_values!3316 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1437)) mapDefault!6029)))))

(declare-fun b!162639 () Bool)

(declare-fun res!77027 () Bool)

(declare-fun e!106637 () Bool)

(assert (=> b!162639 (=> (not res!77027) (not e!106637))))

(assert (=> b!162639 (= res!77027 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6029 () Bool)

(assert (=> mapIsEmpty!6029 mapRes!6029))

(declare-fun e!106636 () Bool)

(declare-fun tp_is_empty!3561 () Bool)

(declare-fun array_inv!1883 (array!6201) Bool)

(declare-fun array_inv!1884 (array!6203) Bool)

(assert (=> b!162640 (= e!106636 (and tp!13846 tp_is_empty!3561 (array_inv!1883 (_keys!5134 thiss!1248)) (array_inv!1884 (_values!3316 thiss!1248)) e!106638))))

(declare-fun res!77026 () Bool)

(assert (=> start!16298 (=> (not res!77026) (not e!106637))))

(assert (=> start!16298 (= res!77026 (valid!803 thiss!1248))))

(assert (=> start!16298 e!106637))

(assert (=> start!16298 e!106636))

(assert (=> start!16298 true))

(assert (=> start!16298 tp_is_empty!3561))

(declare-fun b!162641 () Bool)

(assert (=> b!162641 (= e!106639 tp_is_empty!3561)))

(declare-fun b!162642 () Bool)

(assert (=> b!162642 (= e!106637 e!106641)))

(declare-fun res!77025 () Bool)

(assert (=> b!162642 (=> (not res!77025) (not e!106641))))

(get-info :version)

(assert (=> b!162642 (= res!77025 (and (not ((_ is Undefined!387) lt!82510)) (not ((_ is MissingVacant!387) lt!82510)) ((_ is MissingZero!387) lt!82510)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6201 (_ BitVec 32)) SeekEntryResult!387)

(assert (=> b!162642 (= lt!82510 (seekEntryOrOpen!0 key!828 (_keys!5134 thiss!1248) (mask!7961 thiss!1248)))))

(declare-fun mapNonEmpty!6029 () Bool)

(declare-fun tp!13847 () Bool)

(declare-fun e!106640 () Bool)

(assert (=> mapNonEmpty!6029 (= mapRes!6029 (and tp!13847 e!106640))))

(declare-fun mapKey!6029 () (_ BitVec 32))

(declare-fun mapValue!6029 () ValueCell!1437)

(declare-fun mapRest!6029 () (Array (_ BitVec 32) ValueCell!1437))

(assert (=> mapNonEmpty!6029 (= (arr!2946 (_values!3316 thiss!1248)) (store mapRest!6029 mapKey!6029 mapValue!6029))))

(declare-fun b!162643 () Bool)

(assert (=> b!162643 (= e!106640 tp_is_empty!3561)))

(assert (= (and start!16298 res!77026) b!162639))

(assert (= (and b!162639 res!77027) b!162642))

(assert (= (and b!162642 res!77025) b!162637))

(assert (= (and b!162638 condMapEmpty!6029) mapIsEmpty!6029))

(assert (= (and b!162638 (not condMapEmpty!6029)) mapNonEmpty!6029))

(assert (= (and mapNonEmpty!6029 ((_ is ValueCellFull!1437) mapValue!6029)) b!162643))

(assert (= (and b!162638 ((_ is ValueCellFull!1437) mapDefault!6029)) b!162641))

(assert (= b!162640 b!162638))

(assert (= start!16298 b!162640))

(declare-fun m!193685 () Bool)

(assert (=> b!162640 m!193685))

(declare-fun m!193687 () Bool)

(assert (=> b!162640 m!193687))

(declare-fun m!193689 () Bool)

(assert (=> mapNonEmpty!6029 m!193689))

(declare-fun m!193691 () Bool)

(assert (=> b!162642 m!193691))

(declare-fun m!193693 () Bool)

(assert (=> start!16298 m!193693))

(declare-fun m!193695 () Bool)

(assert (=> b!162637 m!193695))

(declare-fun m!193697 () Bool)

(assert (=> b!162637 m!193697))

(check-sat b_and!10173 (not b!162642) (not mapNonEmpty!6029) tp_is_empty!3561 (not b_next!3759) (not b!162640) (not b!162637) (not start!16298))
(check-sat b_and!10173 (not b_next!3759))

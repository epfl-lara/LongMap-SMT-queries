; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16300 () Bool)

(assert start!16300)

(declare-fun b!162666 () Bool)

(declare-fun b_free!3757 () Bool)

(declare-fun b_next!3757 () Bool)

(assert (=> b!162666 (= b_free!3757 (not b_next!3757))))

(declare-fun tp!13841 () Bool)

(declare-fun b_and!10185 () Bool)

(assert (=> b!162666 (= tp!13841 b_and!10185)))

(declare-fun b!162663 () Bool)

(declare-fun e!106638 () Bool)

(assert (=> b!162663 (= e!106638 false)))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4393 0))(
  ( (V!4394 (val!1824 Int)) )
))
(declare-fun v!309 () V!4393)

(declare-datatypes ((ValueCell!1436 0))(
  ( (ValueCellFull!1436 (v!3690 V!4393)) (EmptyCell!1436) )
))
(declare-datatypes ((array!6183 0))(
  ( (array!6184 (arr!2936 (Array (_ BitVec 32) (_ BitVec 64))) (size!3220 (_ BitVec 32))) )
))
(declare-datatypes ((array!6185 0))(
  ( (array!6186 (arr!2937 (Array (_ BitVec 32) ValueCell!1436)) (size!3221 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1780 0))(
  ( (LongMapFixedSize!1781 (defaultEntry!3332 Int) (mask!7960 (_ BitVec 32)) (extraKeys!3073 (_ BitVec 32)) (zeroValue!3175 V!4393) (minValue!3175 V!4393) (_size!939 (_ BitVec 32)) (_keys!5133 array!6183) (_values!3315 array!6185) (_vacant!939 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1780)

(declare-fun lt!82562 () Bool)

(declare-datatypes ((SeekEntryResult!387 0))(
  ( (MissingZero!387 (index!3716 (_ BitVec 32))) (Found!387 (index!3717 (_ BitVec 32))) (Intermediate!387 (undefined!1199 Bool) (index!3718 (_ BitVec 32)) (x!17995 (_ BitVec 32))) (Undefined!387) (MissingVacant!387 (index!3719 (_ BitVec 32))) )
))
(declare-fun lt!82563 () SeekEntryResult!387)

(declare-fun valid!823 (LongMapFixedSize!1780) Bool)

(declare-datatypes ((tuple2!2964 0))(
  ( (tuple2!2965 (_1!1493 Bool) (_2!1493 LongMapFixedSize!1780)) )
))
(declare-fun updateHelperNewKey!86 (LongMapFixedSize!1780 (_ BitVec 64) V!4393 (_ BitVec 32)) tuple2!2964)

(assert (=> b!162663 (= lt!82562 (valid!823 (_2!1493 (updateHelperNewKey!86 thiss!1248 key!828 v!309 (index!3716 lt!82563)))))))

(declare-fun b!162664 () Bool)

(declare-fun e!106641 () Bool)

(assert (=> b!162664 (= e!106641 e!106638)))

(declare-fun res!77037 () Bool)

(assert (=> b!162664 (=> (not res!77037) (not e!106638))))

(get-info :version)

(assert (=> b!162664 (= res!77037 (and (not ((_ is Undefined!387) lt!82563)) (not ((_ is MissingVacant!387) lt!82563)) ((_ is MissingZero!387) lt!82563)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6183 (_ BitVec 32)) SeekEntryResult!387)

(assert (=> b!162664 (= lt!82563 (seekEntryOrOpen!0 key!828 (_keys!5133 thiss!1248) (mask!7960 thiss!1248)))))

(declare-fun b!162665 () Bool)

(declare-fun e!106639 () Bool)

(declare-fun tp_is_empty!3559 () Bool)

(assert (=> b!162665 (= e!106639 tp_is_empty!3559)))

(declare-fun e!106642 () Bool)

(declare-fun e!106644 () Bool)

(declare-fun array_inv!1883 (array!6183) Bool)

(declare-fun array_inv!1884 (array!6185) Bool)

(assert (=> b!162666 (= e!106642 (and tp!13841 tp_is_empty!3559 (array_inv!1883 (_keys!5133 thiss!1248)) (array_inv!1884 (_values!3315 thiss!1248)) e!106644))))

(declare-fun b!162667 () Bool)

(declare-fun mapRes!6026 () Bool)

(assert (=> b!162667 (= e!106644 (and e!106639 mapRes!6026))))

(declare-fun condMapEmpty!6026 () Bool)

(declare-fun mapDefault!6026 () ValueCell!1436)

(assert (=> b!162667 (= condMapEmpty!6026 (= (arr!2937 (_values!3315 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1436)) mapDefault!6026)))))

(declare-fun mapNonEmpty!6026 () Bool)

(declare-fun tp!13840 () Bool)

(declare-fun e!106640 () Bool)

(assert (=> mapNonEmpty!6026 (= mapRes!6026 (and tp!13840 e!106640))))

(declare-fun mapKey!6026 () (_ BitVec 32))

(declare-fun mapRest!6026 () (Array (_ BitVec 32) ValueCell!1436))

(declare-fun mapValue!6026 () ValueCell!1436)

(assert (=> mapNonEmpty!6026 (= (arr!2937 (_values!3315 thiss!1248)) (store mapRest!6026 mapKey!6026 mapValue!6026))))

(declare-fun b!162669 () Bool)

(declare-fun res!77039 () Bool)

(assert (=> b!162669 (=> (not res!77039) (not e!106641))))

(assert (=> b!162669 (= res!77039 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6026 () Bool)

(assert (=> mapIsEmpty!6026 mapRes!6026))

(declare-fun b!162668 () Bool)

(assert (=> b!162668 (= e!106640 tp_is_empty!3559)))

(declare-fun res!77038 () Bool)

(assert (=> start!16300 (=> (not res!77038) (not e!106641))))

(assert (=> start!16300 (= res!77038 (valid!823 thiss!1248))))

(assert (=> start!16300 e!106641))

(assert (=> start!16300 e!106642))

(assert (=> start!16300 true))

(assert (=> start!16300 tp_is_empty!3559))

(assert (= (and start!16300 res!77038) b!162669))

(assert (= (and b!162669 res!77039) b!162664))

(assert (= (and b!162664 res!77037) b!162663))

(assert (= (and b!162667 condMapEmpty!6026) mapIsEmpty!6026))

(assert (= (and b!162667 (not condMapEmpty!6026)) mapNonEmpty!6026))

(assert (= (and mapNonEmpty!6026 ((_ is ValueCellFull!1436) mapValue!6026)) b!162668))

(assert (= (and b!162667 ((_ is ValueCellFull!1436) mapDefault!6026)) b!162665))

(assert (= b!162666 b!162667))

(assert (= start!16300 b!162666))

(declare-fun m!193853 () Bool)

(assert (=> b!162666 m!193853))

(declare-fun m!193855 () Bool)

(assert (=> b!162666 m!193855))

(declare-fun m!193857 () Bool)

(assert (=> b!162664 m!193857))

(declare-fun m!193859 () Bool)

(assert (=> start!16300 m!193859))

(declare-fun m!193861 () Bool)

(assert (=> mapNonEmpty!6026 m!193861))

(declare-fun m!193863 () Bool)

(assert (=> b!162663 m!193863))

(declare-fun m!193865 () Bool)

(assert (=> b!162663 m!193865))

(check-sat (not start!16300) (not b!162664) b_and!10185 tp_is_empty!3559 (not b!162663) (not mapNonEmpty!6026) (not b!162666) (not b_next!3757))
(check-sat b_and!10185 (not b_next!3757))

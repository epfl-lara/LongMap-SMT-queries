; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16270 () Bool)

(assert start!16270)

(declare-fun b!162328 () Bool)

(declare-fun b_free!3727 () Bool)

(declare-fun b_next!3727 () Bool)

(assert (=> b!162328 (= b_free!3727 (not b_next!3727))))

(declare-fun tp!13751 () Bool)

(declare-fun b_and!10155 () Bool)

(assert (=> b!162328 (= tp!13751 b_and!10155)))

(declare-fun e!106326 () Bool)

(declare-fun tp_is_empty!3529 () Bool)

(declare-datatypes ((V!4353 0))(
  ( (V!4354 (val!1809 Int)) )
))
(declare-datatypes ((ValueCell!1421 0))(
  ( (ValueCellFull!1421 (v!3675 V!4353)) (EmptyCell!1421) )
))
(declare-datatypes ((array!6123 0))(
  ( (array!6124 (arr!2906 (Array (_ BitVec 32) (_ BitVec 64))) (size!3190 (_ BitVec 32))) )
))
(declare-datatypes ((array!6125 0))(
  ( (array!6126 (arr!2907 (Array (_ BitVec 32) ValueCell!1421)) (size!3191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1750 0))(
  ( (LongMapFixedSize!1751 (defaultEntry!3317 Int) (mask!7935 (_ BitVec 32)) (extraKeys!3058 (_ BitVec 32)) (zeroValue!3160 V!4353) (minValue!3160 V!4353) (_size!924 (_ BitVec 32)) (_keys!5118 array!6123) (_values!3300 array!6125) (_vacant!924 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1750)

(declare-fun e!106325 () Bool)

(declare-fun array_inv!1865 (array!6123) Bool)

(declare-fun array_inv!1866 (array!6125) Bool)

(assert (=> b!162328 (= e!106325 (and tp!13751 tp_is_empty!3529 (array_inv!1865 (_keys!5118 thiss!1248)) (array_inv!1866 (_values!3300 thiss!1248)) e!106326))))

(declare-fun b!162329 () Bool)

(declare-fun res!76883 () Bool)

(declare-fun e!106322 () Bool)

(assert (=> b!162329 (=> (not res!76883) (not e!106322))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162329 (= res!76883 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5981 () Bool)

(declare-fun mapRes!5981 () Bool)

(assert (=> mapIsEmpty!5981 mapRes!5981))

(declare-fun b!162330 () Bool)

(declare-fun e!106321 () Bool)

(assert (=> b!162330 (= e!106326 (and e!106321 mapRes!5981))))

(declare-fun condMapEmpty!5981 () Bool)

(declare-fun mapDefault!5981 () ValueCell!1421)

(assert (=> b!162330 (= condMapEmpty!5981 (= (arr!2907 (_values!3300 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1421)) mapDefault!5981)))))

(declare-fun res!76882 () Bool)

(assert (=> start!16270 (=> (not res!76882) (not e!106322))))

(declare-fun valid!814 (LongMapFixedSize!1750) Bool)

(assert (=> start!16270 (= res!76882 (valid!814 thiss!1248))))

(assert (=> start!16270 e!106322))

(assert (=> start!16270 e!106325))

(assert (=> start!16270 true))

(declare-fun b!162331 () Bool)

(declare-datatypes ((SeekEntryResult!375 0))(
  ( (MissingZero!375 (index!3668 (_ BitVec 32))) (Found!375 (index!3669 (_ BitVec 32))) (Intermediate!375 (undefined!1187 Bool) (index!3670 (_ BitVec 32)) (x!17943 (_ BitVec 32))) (Undefined!375) (MissingVacant!375 (index!3671 (_ BitVec 32))) )
))
(declare-fun lt!82470 () SeekEntryResult!375)

(get-info :version)

(assert (=> b!162331 (= e!106322 (and (not ((_ is Undefined!375) lt!82470)) (not ((_ is MissingVacant!375) lt!82470)) ((_ is MissingZero!375) lt!82470) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6123 (_ BitVec 32)) SeekEntryResult!375)

(assert (=> b!162331 (= lt!82470 (seekEntryOrOpen!0 key!828 (_keys!5118 thiss!1248) (mask!7935 thiss!1248)))))

(declare-fun mapNonEmpty!5981 () Bool)

(declare-fun tp!13750 () Bool)

(declare-fun e!106323 () Bool)

(assert (=> mapNonEmpty!5981 (= mapRes!5981 (and tp!13750 e!106323))))

(declare-fun mapValue!5981 () ValueCell!1421)

(declare-fun mapKey!5981 () (_ BitVec 32))

(declare-fun mapRest!5981 () (Array (_ BitVec 32) ValueCell!1421))

(assert (=> mapNonEmpty!5981 (= (arr!2907 (_values!3300 thiss!1248)) (store mapRest!5981 mapKey!5981 mapValue!5981))))

(declare-fun b!162332 () Bool)

(assert (=> b!162332 (= e!106323 tp_is_empty!3529)))

(declare-fun b!162333 () Bool)

(assert (=> b!162333 (= e!106321 tp_is_empty!3529)))

(assert (= (and start!16270 res!76882) b!162329))

(assert (= (and b!162329 res!76883) b!162331))

(assert (= (and b!162330 condMapEmpty!5981) mapIsEmpty!5981))

(assert (= (and b!162330 (not condMapEmpty!5981)) mapNonEmpty!5981))

(assert (= (and mapNonEmpty!5981 ((_ is ValueCellFull!1421) mapValue!5981)) b!162332))

(assert (= (and b!162330 ((_ is ValueCellFull!1421) mapDefault!5981)) b!162333))

(assert (= b!162328 b!162330))

(assert (= start!16270 b!162328))

(declare-fun m!193643 () Bool)

(assert (=> b!162328 m!193643))

(declare-fun m!193645 () Bool)

(assert (=> b!162328 m!193645))

(declare-fun m!193647 () Bool)

(assert (=> start!16270 m!193647))

(declare-fun m!193649 () Bool)

(assert (=> b!162331 m!193649))

(declare-fun m!193651 () Bool)

(assert (=> mapNonEmpty!5981 m!193651))

(check-sat b_and!10155 (not mapNonEmpty!5981) (not start!16270) tp_is_empty!3529 (not b!162331) (not b_next!3727) (not b!162328))
(check-sat b_and!10155 (not b_next!3727))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16264 () Bool)

(assert start!16264)

(declare-fun b!162279 () Bool)

(declare-fun b_free!3721 () Bool)

(declare-fun b_next!3721 () Bool)

(assert (=> b!162279 (= b_free!3721 (not b_next!3721))))

(declare-fun tp!13733 () Bool)

(declare-fun b_and!10149 () Bool)

(assert (=> b!162279 (= tp!13733 b_and!10149)))

(declare-fun b!162274 () Bool)

(declare-fun e!106271 () Bool)

(declare-datatypes ((SeekEntryResult!372 0))(
  ( (MissingZero!372 (index!3656 (_ BitVec 32))) (Found!372 (index!3657 (_ BitVec 32))) (Intermediate!372 (undefined!1184 Bool) (index!3658 (_ BitVec 32)) (x!17932 (_ BitVec 32))) (Undefined!372) (MissingVacant!372 (index!3659 (_ BitVec 32))) )
))
(declare-fun lt!82461 () SeekEntryResult!372)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!162274 (= e!106271 (and (not ((_ is Undefined!372) lt!82461)) (not ((_ is MissingVacant!372) lt!82461)) ((_ is MissingZero!372) lt!82461) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!4345 0))(
  ( (V!4346 (val!1806 Int)) )
))
(declare-datatypes ((ValueCell!1418 0))(
  ( (ValueCellFull!1418 (v!3672 V!4345)) (EmptyCell!1418) )
))
(declare-datatypes ((array!6111 0))(
  ( (array!6112 (arr!2900 (Array (_ BitVec 32) (_ BitVec 64))) (size!3184 (_ BitVec 32))) )
))
(declare-datatypes ((array!6113 0))(
  ( (array!6114 (arr!2901 (Array (_ BitVec 32) ValueCell!1418)) (size!3185 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1744 0))(
  ( (LongMapFixedSize!1745 (defaultEntry!3314 Int) (mask!7930 (_ BitVec 32)) (extraKeys!3055 (_ BitVec 32)) (zeroValue!3157 V!4345) (minValue!3157 V!4345) (_size!921 (_ BitVec 32)) (_keys!5115 array!6111) (_values!3297 array!6113) (_vacant!921 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1744)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6111 (_ BitVec 32)) SeekEntryResult!372)

(assert (=> b!162274 (= lt!82461 (seekEntryOrOpen!0 key!828 (_keys!5115 thiss!1248) (mask!7930 thiss!1248)))))

(declare-fun b!162275 () Bool)

(declare-fun res!76864 () Bool)

(assert (=> b!162275 (=> (not res!76864) (not e!106271))))

(assert (=> b!162275 (= res!76864 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162276 () Bool)

(declare-fun e!106269 () Bool)

(declare-fun e!106267 () Bool)

(declare-fun mapRes!5972 () Bool)

(assert (=> b!162276 (= e!106269 (and e!106267 mapRes!5972))))

(declare-fun condMapEmpty!5972 () Bool)

(declare-fun mapDefault!5972 () ValueCell!1418)

(assert (=> b!162276 (= condMapEmpty!5972 (= (arr!2901 (_values!3297 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1418)) mapDefault!5972)))))

(declare-fun mapIsEmpty!5972 () Bool)

(assert (=> mapIsEmpty!5972 mapRes!5972))

(declare-fun res!76865 () Bool)

(assert (=> start!16264 (=> (not res!76865) (not e!106271))))

(declare-fun valid!811 (LongMapFixedSize!1744) Bool)

(assert (=> start!16264 (= res!76865 (valid!811 thiss!1248))))

(assert (=> start!16264 e!106271))

(declare-fun e!106268 () Bool)

(assert (=> start!16264 e!106268))

(assert (=> start!16264 true))

(declare-fun b!162277 () Bool)

(declare-fun e!106270 () Bool)

(declare-fun tp_is_empty!3523 () Bool)

(assert (=> b!162277 (= e!106270 tp_is_empty!3523)))

(declare-fun b!162278 () Bool)

(assert (=> b!162278 (= e!106267 tp_is_empty!3523)))

(declare-fun mapNonEmpty!5972 () Bool)

(declare-fun tp!13732 () Bool)

(assert (=> mapNonEmpty!5972 (= mapRes!5972 (and tp!13732 e!106270))))

(declare-fun mapRest!5972 () (Array (_ BitVec 32) ValueCell!1418))

(declare-fun mapValue!5972 () ValueCell!1418)

(declare-fun mapKey!5972 () (_ BitVec 32))

(assert (=> mapNonEmpty!5972 (= (arr!2901 (_values!3297 thiss!1248)) (store mapRest!5972 mapKey!5972 mapValue!5972))))

(declare-fun array_inv!1861 (array!6111) Bool)

(declare-fun array_inv!1862 (array!6113) Bool)

(assert (=> b!162279 (= e!106268 (and tp!13733 tp_is_empty!3523 (array_inv!1861 (_keys!5115 thiss!1248)) (array_inv!1862 (_values!3297 thiss!1248)) e!106269))))

(assert (= (and start!16264 res!76865) b!162275))

(assert (= (and b!162275 res!76864) b!162274))

(assert (= (and b!162276 condMapEmpty!5972) mapIsEmpty!5972))

(assert (= (and b!162276 (not condMapEmpty!5972)) mapNonEmpty!5972))

(assert (= (and mapNonEmpty!5972 ((_ is ValueCellFull!1418) mapValue!5972)) b!162277))

(assert (= (and b!162276 ((_ is ValueCellFull!1418) mapDefault!5972)) b!162278))

(assert (= b!162279 b!162276))

(assert (= start!16264 b!162279))

(declare-fun m!193613 () Bool)

(assert (=> b!162274 m!193613))

(declare-fun m!193615 () Bool)

(assert (=> start!16264 m!193615))

(declare-fun m!193617 () Bool)

(assert (=> mapNonEmpty!5972 m!193617))

(declare-fun m!193619 () Bool)

(assert (=> b!162279 m!193619))

(declare-fun m!193621 () Bool)

(assert (=> b!162279 m!193621))

(check-sat (not mapNonEmpty!5972) (not b!162279) (not b!162274) tp_is_empty!3523 (not b_next!3721) (not start!16264) b_and!10149)
(check-sat b_and!10149 (not b_next!3721))

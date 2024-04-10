; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16256 () Bool)

(assert start!16256)

(declare-fun b!162195 () Bool)

(declare-fun b_free!3717 () Bool)

(declare-fun b_next!3717 () Bool)

(assert (=> b!162195 (= b_free!3717 (not b_next!3717))))

(declare-fun tp!13720 () Bool)

(declare-fun b_and!10131 () Bool)

(assert (=> b!162195 (= tp!13720 b_and!10131)))

(declare-fun mapNonEmpty!5966 () Bool)

(declare-fun mapRes!5966 () Bool)

(declare-fun tp!13721 () Bool)

(declare-fun e!106210 () Bool)

(assert (=> mapNonEmpty!5966 (= mapRes!5966 (and tp!13721 e!106210))))

(declare-datatypes ((V!4339 0))(
  ( (V!4340 (val!1804 Int)) )
))
(declare-datatypes ((ValueCell!1416 0))(
  ( (ValueCellFull!1416 (v!3669 V!4339)) (EmptyCell!1416) )
))
(declare-fun mapRest!5966 () (Array (_ BitVec 32) ValueCell!1416))

(declare-fun mapKey!5966 () (_ BitVec 32))

(declare-datatypes ((array!6117 0))(
  ( (array!6118 (arr!2903 (Array (_ BitVec 32) (_ BitVec 64))) (size!3187 (_ BitVec 32))) )
))
(declare-datatypes ((array!6119 0))(
  ( (array!6120 (arr!2904 (Array (_ BitVec 32) ValueCell!1416)) (size!3188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1740 0))(
  ( (LongMapFixedSize!1741 (defaultEntry!3312 Int) (mask!7926 (_ BitVec 32)) (extraKeys!3053 (_ BitVec 32)) (zeroValue!3155 V!4339) (minValue!3155 V!4339) (_size!919 (_ BitVec 32)) (_keys!5113 array!6117) (_values!3295 array!6119) (_vacant!919 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1740)

(declare-fun mapValue!5966 () ValueCell!1416)

(assert (=> mapNonEmpty!5966 (= (arr!2904 (_values!3295 thiss!1248)) (store mapRest!5966 mapKey!5966 mapValue!5966))))

(declare-fun b!162191 () Bool)

(declare-fun e!106212 () Bool)

(assert (=> b!162191 (= e!106212 false)))

(declare-datatypes ((SeekEntryResult!375 0))(
  ( (MissingZero!375 (index!3668 (_ BitVec 32))) (Found!375 (index!3669 (_ BitVec 32))) (Intermediate!375 (undefined!1187 Bool) (index!3670 (_ BitVec 32)) (x!17927 (_ BitVec 32))) (Undefined!375) (MissingVacant!375 (index!3671 (_ BitVec 32))) )
))
(declare-fun lt!82396 () SeekEntryResult!375)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6117 (_ BitVec 32)) SeekEntryResult!375)

(assert (=> b!162191 (= lt!82396 (seekEntryOrOpen!0 key!828 (_keys!5113 thiss!1248) (mask!7926 thiss!1248)))))

(declare-fun b!162192 () Bool)

(declare-fun e!106207 () Bool)

(declare-fun tp_is_empty!3519 () Bool)

(assert (=> b!162192 (= e!106207 tp_is_empty!3519)))

(declare-fun mapIsEmpty!5966 () Bool)

(assert (=> mapIsEmpty!5966 mapRes!5966))

(declare-fun res!76832 () Bool)

(assert (=> start!16256 (=> (not res!76832) (not e!106212))))

(declare-fun valid!789 (LongMapFixedSize!1740) Bool)

(assert (=> start!16256 (= res!76832 (valid!789 thiss!1248))))

(assert (=> start!16256 e!106212))

(declare-fun e!106211 () Bool)

(assert (=> start!16256 e!106211))

(assert (=> start!16256 true))

(declare-fun b!162193 () Bool)

(declare-fun res!76831 () Bool)

(assert (=> b!162193 (=> (not res!76831) (not e!106212))))

(assert (=> b!162193 (= res!76831 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162194 () Bool)

(declare-fun e!106208 () Bool)

(assert (=> b!162194 (= e!106208 (and e!106207 mapRes!5966))))

(declare-fun condMapEmpty!5966 () Bool)

(declare-fun mapDefault!5966 () ValueCell!1416)

(assert (=> b!162194 (= condMapEmpty!5966 (= (arr!2904 (_values!3295 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1416)) mapDefault!5966)))))

(declare-fun array_inv!1857 (array!6117) Bool)

(declare-fun array_inv!1858 (array!6119) Bool)

(assert (=> b!162195 (= e!106211 (and tp!13720 tp_is_empty!3519 (array_inv!1857 (_keys!5113 thiss!1248)) (array_inv!1858 (_values!3295 thiss!1248)) e!106208))))

(declare-fun b!162196 () Bool)

(assert (=> b!162196 (= e!106210 tp_is_empty!3519)))

(assert (= (and start!16256 res!76832) b!162193))

(assert (= (and b!162193 res!76831) b!162191))

(assert (= (and b!162194 condMapEmpty!5966) mapIsEmpty!5966))

(assert (= (and b!162194 (not condMapEmpty!5966)) mapNonEmpty!5966))

(get-info :version)

(assert (= (and mapNonEmpty!5966 ((_ is ValueCellFull!1416) mapValue!5966)) b!162196))

(assert (= (and b!162194 ((_ is ValueCellFull!1416) mapDefault!5966)) b!162192))

(assert (= b!162195 b!162194))

(assert (= start!16256 b!162195))

(declare-fun m!193411 () Bool)

(assert (=> mapNonEmpty!5966 m!193411))

(declare-fun m!193413 () Bool)

(assert (=> b!162191 m!193413))

(declare-fun m!193415 () Bool)

(assert (=> start!16256 m!193415))

(declare-fun m!193417 () Bool)

(assert (=> b!162195 m!193417))

(declare-fun m!193419 () Bool)

(assert (=> b!162195 m!193419))

(check-sat (not start!16256) (not b!162191) (not mapNonEmpty!5966) b_and!10131 (not b_next!3717) tp_is_empty!3519 (not b!162195))
(check-sat b_and!10131 (not b_next!3717))

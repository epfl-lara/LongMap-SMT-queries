; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16210 () Bool)

(assert start!16210)

(declare-fun b!161513 () Bool)

(declare-fun b_free!3667 () Bool)

(declare-fun b_next!3667 () Bool)

(assert (=> b!161513 (= b_free!3667 (not b_next!3667))))

(declare-fun tp!13571 () Bool)

(declare-fun b_and!10055 () Bool)

(assert (=> b!161513 (= tp!13571 b_and!10055)))

(declare-fun tp_is_empty!3469 () Bool)

(declare-fun e!105593 () Bool)

(declare-datatypes ((V!4273 0))(
  ( (V!4274 (val!1779 Int)) )
))
(declare-datatypes ((ValueCell!1391 0))(
  ( (ValueCellFull!1391 (v!3638 V!4273)) (EmptyCell!1391) )
))
(declare-datatypes ((array!5997 0))(
  ( (array!5998 (arr!2842 (Array (_ BitVec 32) (_ BitVec 64))) (size!3127 (_ BitVec 32))) )
))
(declare-datatypes ((array!5999 0))(
  ( (array!6000 (arr!2843 (Array (_ BitVec 32) ValueCell!1391)) (size!3128 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1690 0))(
  ( (LongMapFixedSize!1691 (defaultEntry!3287 Int) (mask!7884 (_ BitVec 32)) (extraKeys!3028 (_ BitVec 32)) (zeroValue!3130 V!4273) (minValue!3130 V!4273) (_size!894 (_ BitVec 32)) (_keys!5087 array!5997) (_values!3270 array!5999) (_vacant!894 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1690)

(declare-fun e!105594 () Bool)

(declare-fun array_inv!1835 (array!5997) Bool)

(declare-fun array_inv!1836 (array!5999) Bool)

(assert (=> b!161513 (= e!105594 (and tp!13571 tp_is_empty!3469 (array_inv!1835 (_keys!5087 thiss!1248)) (array_inv!1836 (_values!3270 thiss!1248)) e!105593))))

(declare-fun b!161514 () Bool)

(declare-fun e!105598 () Bool)

(declare-datatypes ((SeekEntryResult!364 0))(
  ( (MissingZero!364 (index!3624 (_ BitVec 32))) (Found!364 (index!3625 (_ BitVec 32))) (Intermediate!364 (undefined!1176 Bool) (index!3626 (_ BitVec 32)) (x!17851 (_ BitVec 32))) (Undefined!364) (MissingVacant!364 (index!3627 (_ BitVec 32))) )
))
(declare-fun lt!82077 () SeekEntryResult!364)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!161514 (= e!105598 (and (not ((_ is Undefined!364) lt!82077)) ((_ is MissingVacant!364) lt!82077) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5997 (_ BitVec 32)) SeekEntryResult!364)

(assert (=> b!161514 (= lt!82077 (seekEntryOrOpen!0 key!828 (_keys!5087 thiss!1248) (mask!7884 thiss!1248)))))

(declare-fun mapIsEmpty!5891 () Bool)

(declare-fun mapRes!5891 () Bool)

(assert (=> mapIsEmpty!5891 mapRes!5891))

(declare-fun res!76505 () Bool)

(assert (=> start!16210 (=> (not res!76505) (not e!105598))))

(declare-fun valid!772 (LongMapFixedSize!1690) Bool)

(assert (=> start!16210 (= res!76505 (valid!772 thiss!1248))))

(assert (=> start!16210 e!105598))

(assert (=> start!16210 e!105594))

(assert (=> start!16210 true))

(declare-fun b!161515 () Bool)

(declare-fun res!76506 () Bool)

(assert (=> b!161515 (=> (not res!76506) (not e!105598))))

(assert (=> b!161515 (= res!76506 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161516 () Bool)

(declare-fun e!105597 () Bool)

(assert (=> b!161516 (= e!105597 tp_is_empty!3469)))

(declare-fun b!161517 () Bool)

(declare-fun e!105595 () Bool)

(assert (=> b!161517 (= e!105595 tp_is_empty!3469)))

(declare-fun mapNonEmpty!5891 () Bool)

(declare-fun tp!13570 () Bool)

(assert (=> mapNonEmpty!5891 (= mapRes!5891 (and tp!13570 e!105597))))

(declare-fun mapKey!5891 () (_ BitVec 32))

(declare-fun mapRest!5891 () (Array (_ BitVec 32) ValueCell!1391))

(declare-fun mapValue!5891 () ValueCell!1391)

(assert (=> mapNonEmpty!5891 (= (arr!2843 (_values!3270 thiss!1248)) (store mapRest!5891 mapKey!5891 mapValue!5891))))

(declare-fun b!161518 () Bool)

(assert (=> b!161518 (= e!105593 (and e!105595 mapRes!5891))))

(declare-fun condMapEmpty!5891 () Bool)

(declare-fun mapDefault!5891 () ValueCell!1391)

(assert (=> b!161518 (= condMapEmpty!5891 (= (arr!2843 (_values!3270 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1391)) mapDefault!5891)))))

(assert (= (and start!16210 res!76505) b!161515))

(assert (= (and b!161515 res!76506) b!161514))

(assert (= (and b!161518 condMapEmpty!5891) mapIsEmpty!5891))

(assert (= (and b!161518 (not condMapEmpty!5891)) mapNonEmpty!5891))

(assert (= (and mapNonEmpty!5891 ((_ is ValueCellFull!1391) mapValue!5891)) b!161516))

(assert (= (and b!161518 ((_ is ValueCellFull!1391) mapDefault!5891)) b!161517))

(assert (= b!161513 b!161518))

(assert (= start!16210 b!161513))

(declare-fun m!192457 () Bool)

(assert (=> b!161513 m!192457))

(declare-fun m!192459 () Bool)

(assert (=> b!161513 m!192459))

(declare-fun m!192461 () Bool)

(assert (=> b!161514 m!192461))

(declare-fun m!192463 () Bool)

(assert (=> start!16210 m!192463))

(declare-fun m!192465 () Bool)

(assert (=> mapNonEmpty!5891 m!192465))

(check-sat (not b!161513) (not b!161514) (not mapNonEmpty!5891) tp_is_empty!3469 (not start!16210) b_and!10055 (not b_next!3667))
(check-sat b_and!10055 (not b_next!3667))

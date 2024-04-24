; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16282 () Bool)

(assert start!16282)

(declare-fun b!162439 () Bool)

(declare-fun b_free!3739 () Bool)

(declare-fun b_next!3739 () Bool)

(assert (=> b!162439 (= b_free!3739 (not b_next!3739))))

(declare-fun tp!13786 () Bool)

(declare-fun b_and!10167 () Bool)

(assert (=> b!162439 (= tp!13786 b_and!10167)))

(declare-fun b!162438 () Bool)

(declare-fun e!106435 () Bool)

(declare-fun tp_is_empty!3541 () Bool)

(assert (=> b!162438 (= e!106435 tp_is_empty!3541)))

(declare-fun res!76921 () Bool)

(declare-fun e!106434 () Bool)

(assert (=> start!16282 (=> (not res!76921) (not e!106434))))

(declare-datatypes ((V!4369 0))(
  ( (V!4370 (val!1815 Int)) )
))
(declare-datatypes ((ValueCell!1427 0))(
  ( (ValueCellFull!1427 (v!3681 V!4369)) (EmptyCell!1427) )
))
(declare-datatypes ((array!6147 0))(
  ( (array!6148 (arr!2918 (Array (_ BitVec 32) (_ BitVec 64))) (size!3202 (_ BitVec 32))) )
))
(declare-datatypes ((array!6149 0))(
  ( (array!6150 (arr!2919 (Array (_ BitVec 32) ValueCell!1427)) (size!3203 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1762 0))(
  ( (LongMapFixedSize!1763 (defaultEntry!3323 Int) (mask!7945 (_ BitVec 32)) (extraKeys!3064 (_ BitVec 32)) (zeroValue!3166 V!4369) (minValue!3166 V!4369) (_size!930 (_ BitVec 32)) (_keys!5124 array!6147) (_values!3306 array!6149) (_vacant!930 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1762)

(declare-fun valid!818 (LongMapFixedSize!1762) Bool)

(assert (=> start!16282 (= res!76921 (valid!818 thiss!1248))))

(assert (=> start!16282 e!106434))

(declare-fun e!106432 () Bool)

(assert (=> start!16282 e!106432))

(assert (=> start!16282 true))

(assert (=> start!16282 tp_is_empty!3541))

(declare-fun e!106431 () Bool)

(declare-fun array_inv!1873 (array!6147) Bool)

(declare-fun array_inv!1874 (array!6149) Bool)

(assert (=> b!162439 (= e!106432 (and tp!13786 tp_is_empty!3541 (array_inv!1873 (_keys!5124 thiss!1248)) (array_inv!1874 (_values!3306 thiss!1248)) e!106431))))

(declare-fun mapNonEmpty!5999 () Bool)

(declare-fun mapRes!5999 () Bool)

(declare-fun tp!13787 () Bool)

(assert (=> mapNonEmpty!5999 (= mapRes!5999 (and tp!13787 e!106435))))

(declare-fun mapKey!5999 () (_ BitVec 32))

(declare-fun mapRest!5999 () (Array (_ BitVec 32) ValueCell!1427))

(declare-fun mapValue!5999 () ValueCell!1427)

(assert (=> mapNonEmpty!5999 (= (arr!2919 (_values!3306 thiss!1248)) (store mapRest!5999 mapKey!5999 mapValue!5999))))

(declare-fun b!162440 () Bool)

(declare-fun res!76920 () Bool)

(assert (=> b!162440 (=> (not res!76920) (not e!106434))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162440 (= res!76920 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5999 () Bool)

(assert (=> mapIsEmpty!5999 mapRes!5999))

(declare-fun b!162441 () Bool)

(declare-fun e!106433 () Bool)

(assert (=> b!162441 (= e!106433 tp_is_empty!3541)))

(declare-fun b!162442 () Bool)

(assert (=> b!162442 (= e!106431 (and e!106433 mapRes!5999))))

(declare-fun condMapEmpty!5999 () Bool)

(declare-fun mapDefault!5999 () ValueCell!1427)

(assert (=> b!162442 (= condMapEmpty!5999 (= (arr!2919 (_values!3306 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1427)) mapDefault!5999)))))

(declare-fun b!162443 () Bool)

(declare-fun e!106436 () Bool)

(assert (=> b!162443 (= e!106434 e!106436)))

(declare-fun res!76922 () Bool)

(assert (=> b!162443 (=> (not res!76922) (not e!106436))))

(declare-datatypes ((SeekEntryResult!380 0))(
  ( (MissingZero!380 (index!3688 (_ BitVec 32))) (Found!380 (index!3689 (_ BitVec 32))) (Intermediate!380 (undefined!1192 Bool) (index!3690 (_ BitVec 32)) (x!17964 (_ BitVec 32))) (Undefined!380) (MissingVacant!380 (index!3691 (_ BitVec 32))) )
))
(declare-fun lt!82491 () SeekEntryResult!380)

(get-info :version)

(assert (=> b!162443 (= res!76922 (and (not ((_ is Undefined!380) lt!82491)) (not ((_ is MissingVacant!380) lt!82491)) ((_ is MissingZero!380) lt!82491)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6147 (_ BitVec 32)) SeekEntryResult!380)

(assert (=> b!162443 (= lt!82491 (seekEntryOrOpen!0 key!828 (_keys!5124 thiss!1248) (mask!7945 thiss!1248)))))

(declare-fun b!162444 () Bool)

(assert (=> b!162444 (= e!106436 false)))

(declare-fun v!309 () V!4369)

(declare-fun lt!82490 () Bool)

(declare-datatypes ((tuple2!2946 0))(
  ( (tuple2!2947 (_1!1484 Bool) (_2!1484 LongMapFixedSize!1762)) )
))
(declare-fun updateHelperNewKey!81 (LongMapFixedSize!1762 (_ BitVec 64) V!4369 (_ BitVec 32)) tuple2!2946)

(assert (=> b!162444 (= lt!82490 (valid!818 (_2!1484 (updateHelperNewKey!81 thiss!1248 key!828 v!309 (index!3688 lt!82491)))))))

(assert (= (and start!16282 res!76921) b!162440))

(assert (= (and b!162440 res!76920) b!162443))

(assert (= (and b!162443 res!76922) b!162444))

(assert (= (and b!162442 condMapEmpty!5999) mapIsEmpty!5999))

(assert (= (and b!162442 (not condMapEmpty!5999)) mapNonEmpty!5999))

(assert (= (and mapNonEmpty!5999 ((_ is ValueCellFull!1427) mapValue!5999)) b!162438))

(assert (= (and b!162442 ((_ is ValueCellFull!1427) mapDefault!5999)) b!162441))

(assert (= b!162439 b!162442))

(assert (= start!16282 b!162439))

(declare-fun m!193703 () Bool)

(assert (=> b!162439 m!193703))

(declare-fun m!193705 () Bool)

(assert (=> b!162439 m!193705))

(declare-fun m!193707 () Bool)

(assert (=> b!162444 m!193707))

(declare-fun m!193709 () Bool)

(assert (=> b!162444 m!193709))

(declare-fun m!193711 () Bool)

(assert (=> mapNonEmpty!5999 m!193711))

(declare-fun m!193713 () Bool)

(assert (=> start!16282 m!193713))

(declare-fun m!193715 () Bool)

(assert (=> b!162443 m!193715))

(check-sat (not b_next!3739) (not b!162444) b_and!10167 tp_is_empty!3541 (not b!162439) (not b!162443) (not mapNonEmpty!5999) (not start!16282))
(check-sat b_and!10167 (not b_next!3739))

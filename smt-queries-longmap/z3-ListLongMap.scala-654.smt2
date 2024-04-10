; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16274 () Bool)

(assert start!16274)

(declare-fun b!162358 () Bool)

(declare-fun b_free!3735 () Bool)

(declare-fun b_next!3735 () Bool)

(assert (=> b!162358 (= b_free!3735 (not b_next!3735))))

(declare-fun tp!13775 () Bool)

(declare-fun b_and!10149 () Bool)

(assert (=> b!162358 (= tp!13775 b_and!10149)))

(declare-fun mapIsEmpty!5993 () Bool)

(declare-fun mapRes!5993 () Bool)

(assert (=> mapIsEmpty!5993 mapRes!5993))

(declare-fun b!162353 () Bool)

(declare-fun e!106369 () Bool)

(declare-datatypes ((SeekEntryResult!381 0))(
  ( (MissingZero!381 (index!3692 (_ BitVec 32))) (Found!381 (index!3693 (_ BitVec 32))) (Intermediate!381 (undefined!1193 Bool) (index!3694 (_ BitVec 32)) (x!17957 (_ BitVec 32))) (Undefined!381) (MissingVacant!381 (index!3695 (_ BitVec 32))) )
))
(declare-fun lt!82423 () SeekEntryResult!381)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!162353 (= e!106369 (and (not ((_ is Undefined!381) lt!82423)) (not ((_ is MissingVacant!381) lt!82423)) ((_ is MissingZero!381) lt!82423) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!82423 (MissingZero!381 (index!3692 lt!82423)))) (not (= lt!82423 (MissingVacant!381 (index!3692 lt!82423))))))))

(declare-datatypes ((V!4363 0))(
  ( (V!4364 (val!1813 Int)) )
))
(declare-datatypes ((ValueCell!1425 0))(
  ( (ValueCellFull!1425 (v!3678 V!4363)) (EmptyCell!1425) )
))
(declare-datatypes ((array!6153 0))(
  ( (array!6154 (arr!2921 (Array (_ BitVec 32) (_ BitVec 64))) (size!3205 (_ BitVec 32))) )
))
(declare-datatypes ((array!6155 0))(
  ( (array!6156 (arr!2922 (Array (_ BitVec 32) ValueCell!1425)) (size!3206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1758 0))(
  ( (LongMapFixedSize!1759 (defaultEntry!3321 Int) (mask!7941 (_ BitVec 32)) (extraKeys!3062 (_ BitVec 32)) (zeroValue!3164 V!4363) (minValue!3164 V!4363) (_size!928 (_ BitVec 32)) (_keys!5122 array!6153) (_values!3304 array!6155) (_vacant!928 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1758)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6153 (_ BitVec 32)) SeekEntryResult!381)

(assert (=> b!162353 (= lt!82423 (seekEntryOrOpen!0 key!828 (_keys!5122 thiss!1248) (mask!7941 thiss!1248)))))

(declare-fun b!162354 () Bool)

(declare-fun res!76885 () Bool)

(assert (=> b!162354 (=> (not res!76885) (not e!106369))))

(assert (=> b!162354 (= res!76885 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162355 () Bool)

(declare-fun e!106373 () Bool)

(declare-fun e!106374 () Bool)

(assert (=> b!162355 (= e!106373 (and e!106374 mapRes!5993))))

(declare-fun condMapEmpty!5993 () Bool)

(declare-fun mapDefault!5993 () ValueCell!1425)

(assert (=> b!162355 (= condMapEmpty!5993 (= (arr!2922 (_values!3304 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1425)) mapDefault!5993)))))

(declare-fun res!76886 () Bool)

(assert (=> start!16274 (=> (not res!76886) (not e!106369))))

(declare-fun valid!795 (LongMapFixedSize!1758) Bool)

(assert (=> start!16274 (= res!76886 (valid!795 thiss!1248))))

(assert (=> start!16274 e!106369))

(declare-fun e!106371 () Bool)

(assert (=> start!16274 e!106371))

(assert (=> start!16274 true))

(declare-fun b!162356 () Bool)

(declare-fun e!106372 () Bool)

(declare-fun tp_is_empty!3537 () Bool)

(assert (=> b!162356 (= e!106372 tp_is_empty!3537)))

(declare-fun mapNonEmpty!5993 () Bool)

(declare-fun tp!13774 () Bool)

(assert (=> mapNonEmpty!5993 (= mapRes!5993 (and tp!13774 e!106372))))

(declare-fun mapValue!5993 () ValueCell!1425)

(declare-fun mapKey!5993 () (_ BitVec 32))

(declare-fun mapRest!5993 () (Array (_ BitVec 32) ValueCell!1425))

(assert (=> mapNonEmpty!5993 (= (arr!2922 (_values!3304 thiss!1248)) (store mapRest!5993 mapKey!5993 mapValue!5993))))

(declare-fun b!162357 () Bool)

(assert (=> b!162357 (= e!106374 tp_is_empty!3537)))

(declare-fun array_inv!1871 (array!6153) Bool)

(declare-fun array_inv!1872 (array!6155) Bool)

(assert (=> b!162358 (= e!106371 (and tp!13775 tp_is_empty!3537 (array_inv!1871 (_keys!5122 thiss!1248)) (array_inv!1872 (_values!3304 thiss!1248)) e!106373))))

(assert (= (and start!16274 res!76886) b!162354))

(assert (= (and b!162354 res!76885) b!162353))

(assert (= (and b!162355 condMapEmpty!5993) mapIsEmpty!5993))

(assert (= (and b!162355 (not condMapEmpty!5993)) mapNonEmpty!5993))

(assert (= (and mapNonEmpty!5993 ((_ is ValueCellFull!1425) mapValue!5993)) b!162356))

(assert (= (and b!162355 ((_ is ValueCellFull!1425) mapDefault!5993)) b!162357))

(assert (= b!162358 b!162355))

(assert (= start!16274 b!162358))

(declare-fun m!193501 () Bool)

(assert (=> b!162353 m!193501))

(declare-fun m!193503 () Bool)

(assert (=> start!16274 m!193503))

(declare-fun m!193505 () Bool)

(assert (=> mapNonEmpty!5993 m!193505))

(declare-fun m!193507 () Bool)

(assert (=> b!162358 m!193507))

(declare-fun m!193509 () Bool)

(assert (=> b!162358 m!193509))

(check-sat tp_is_empty!3537 b_and!10149 (not b!162358) (not start!16274) (not b!162353) (not mapNonEmpty!5993) (not b_next!3735))
(check-sat b_and!10149 (not b_next!3735))

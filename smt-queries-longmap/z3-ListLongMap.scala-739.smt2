; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17228 () Bool)

(assert start!17228)

(declare-fun b!172806 () Bool)

(declare-fun b_free!4275 () Bool)

(declare-fun b_next!4275 () Bool)

(assert (=> b!172806 (= b_free!4275 (not b_next!4275))))

(declare-fun tp!15482 () Bool)

(declare-fun b_and!10715 () Bool)

(assert (=> b!172806 (= tp!15482 b_and!10715)))

(declare-fun e!114094 () Bool)

(declare-fun tp_is_empty!4047 () Bool)

(declare-datatypes ((V!5043 0))(
  ( (V!5044 (val!2068 Int)) )
))
(declare-datatypes ((ValueCell!1680 0))(
  ( (ValueCellFull!1680 (v!3936 V!5043)) (EmptyCell!1680) )
))
(declare-datatypes ((array!7221 0))(
  ( (array!7222 (arr!3431 (Array (_ BitVec 32) (_ BitVec 64))) (size!3730 (_ BitVec 32))) )
))
(declare-datatypes ((array!7223 0))(
  ( (array!7224 (arr!3432 (Array (_ BitVec 32) ValueCell!1680)) (size!3731 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2268 0))(
  ( (LongMapFixedSize!2269 (defaultEntry!3580 Int) (mask!8436 (_ BitVec 32)) (extraKeys!3319 (_ BitVec 32)) (zeroValue!3421 V!5043) (minValue!3423 V!5043) (_size!1183 (_ BitVec 32)) (_keys!5419 array!7221) (_values!3563 array!7223) (_vacant!1183 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2268)

(declare-fun e!114093 () Bool)

(declare-fun array_inv!2199 (array!7221) Bool)

(declare-fun array_inv!2200 (array!7223) Bool)

(assert (=> b!172806 (= e!114094 (and tp!15482 tp_is_empty!4047 (array_inv!2199 (_keys!5419 thiss!1248)) (array_inv!2200 (_values!3563 thiss!1248)) e!114093))))

(declare-fun b!172807 () Bool)

(declare-fun res!82052 () Bool)

(declare-fun e!114095 () Bool)

(assert (=> b!172807 (=> (not res!82052) (not e!114095))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172807 (= res!82052 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172808 () Bool)

(assert (=> b!172808 (= e!114095 (and (= (size!3731 (_values!3563 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8436 thiss!1248))) (= (size!3730 (_keys!5419 thiss!1248)) (size!3731 (_values!3563 thiss!1248))) (bvsge (mask!8436 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3319 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3319 thiss!1248) #b00000000000000000000000000000011) (bvslt (bvor (extraKeys!3319 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!82051 () Bool)

(assert (=> start!17228 (=> (not res!82051) (not e!114095))))

(declare-fun valid!961 (LongMapFixedSize!2268) Bool)

(assert (=> start!17228 (= res!82051 (valid!961 thiss!1248))))

(assert (=> start!17228 e!114095))

(assert (=> start!17228 e!114094))

(assert (=> start!17228 true))

(declare-fun mapNonEmpty!6891 () Bool)

(declare-fun mapRes!6891 () Bool)

(declare-fun tp!15483 () Bool)

(declare-fun e!114097 () Bool)

(assert (=> mapNonEmpty!6891 (= mapRes!6891 (and tp!15483 e!114097))))

(declare-fun mapKey!6891 () (_ BitVec 32))

(declare-fun mapValue!6891 () ValueCell!1680)

(declare-fun mapRest!6891 () (Array (_ BitVec 32) ValueCell!1680))

(assert (=> mapNonEmpty!6891 (= (arr!3432 (_values!3563 thiss!1248)) (store mapRest!6891 mapKey!6891 mapValue!6891))))

(declare-fun mapIsEmpty!6891 () Bool)

(assert (=> mapIsEmpty!6891 mapRes!6891))

(declare-fun b!172809 () Bool)

(declare-fun e!114098 () Bool)

(assert (=> b!172809 (= e!114098 tp_is_empty!4047)))

(declare-fun b!172810 () Bool)

(assert (=> b!172810 (= e!114097 tp_is_empty!4047)))

(declare-fun b!172811 () Bool)

(assert (=> b!172811 (= e!114093 (and e!114098 mapRes!6891))))

(declare-fun condMapEmpty!6891 () Bool)

(declare-fun mapDefault!6891 () ValueCell!1680)

(assert (=> b!172811 (= condMapEmpty!6891 (= (arr!3432 (_values!3563 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1680)) mapDefault!6891)))))

(declare-fun b!172812 () Bool)

(declare-fun res!82053 () Bool)

(assert (=> b!172812 (=> (not res!82053) (not e!114095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172812 (= res!82053 (validMask!0 (mask!8436 thiss!1248)))))

(assert (= (and start!17228 res!82051) b!172807))

(assert (= (and b!172807 res!82052) b!172812))

(assert (= (and b!172812 res!82053) b!172808))

(assert (= (and b!172811 condMapEmpty!6891) mapIsEmpty!6891))

(assert (= (and b!172811 (not condMapEmpty!6891)) mapNonEmpty!6891))

(get-info :version)

(assert (= (and mapNonEmpty!6891 ((_ is ValueCellFull!1680) mapValue!6891)) b!172810))

(assert (= (and b!172811 ((_ is ValueCellFull!1680) mapDefault!6891)) b!172809))

(assert (= b!172806 b!172811))

(assert (= start!17228 b!172806))

(declare-fun m!201403 () Bool)

(assert (=> b!172806 m!201403))

(declare-fun m!201405 () Bool)

(assert (=> b!172806 m!201405))

(declare-fun m!201407 () Bool)

(assert (=> start!17228 m!201407))

(declare-fun m!201409 () Bool)

(assert (=> mapNonEmpty!6891 m!201409))

(declare-fun m!201411 () Bool)

(assert (=> b!172812 m!201411))

(check-sat (not mapNonEmpty!6891) (not b!172812) (not b_next!4275) (not start!17228) tp_is_empty!4047 (not b!172806) b_and!10715)
(check-sat b_and!10715 (not b_next!4275))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17248 () Bool)

(assert start!17248)

(declare-fun b!172828 () Bool)

(declare-fun b_free!4291 () Bool)

(declare-fun b_next!4291 () Bool)

(assert (=> b!172828 (= b_free!4291 (not b_next!4291))))

(declare-fun tp!15531 () Bool)

(declare-fun b_and!10705 () Bool)

(assert (=> b!172828 (= tp!15531 b_and!10705)))

(declare-fun b!172827 () Bool)

(declare-fun e!114141 () Bool)

(declare-fun tp_is_empty!4063 () Bool)

(assert (=> b!172827 (= e!114141 tp_is_empty!4063)))

(declare-fun e!114138 () Bool)

(declare-fun e!114137 () Bool)

(declare-datatypes ((V!5065 0))(
  ( (V!5066 (val!2076 Int)) )
))
(declare-datatypes ((ValueCell!1688 0))(
  ( (ValueCellFull!1688 (v!3938 V!5065)) (EmptyCell!1688) )
))
(declare-datatypes ((array!7233 0))(
  ( (array!7234 (arr!3436 (Array (_ BitVec 32) (_ BitVec 64))) (size!3736 (_ BitVec 32))) )
))
(declare-datatypes ((array!7235 0))(
  ( (array!7236 (arr!3437 (Array (_ BitVec 32) ValueCell!1688)) (size!3737 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2284 0))(
  ( (LongMapFixedSize!2285 (defaultEntry!3588 Int) (mask!8449 (_ BitVec 32)) (extraKeys!3327 (_ BitVec 32)) (zeroValue!3429 V!5065) (minValue!3431 V!5065) (_size!1191 (_ BitVec 32)) (_keys!5426 array!7233) (_values!3571 array!7235) (_vacant!1191 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2284)

(declare-fun array_inv!2213 (array!7233) Bool)

(declare-fun array_inv!2214 (array!7235) Bool)

(assert (=> b!172828 (= e!114138 (and tp!15531 tp_is_empty!4063 (array_inv!2213 (_keys!5426 thiss!1248)) (array_inv!2214 (_values!3571 thiss!1248)) e!114137))))

(declare-fun mapIsEmpty!6915 () Bool)

(declare-fun mapRes!6915 () Bool)

(assert (=> mapIsEmpty!6915 mapRes!6915))

(declare-fun b!172829 () Bool)

(declare-fun res!82029 () Bool)

(declare-fun e!114140 () Bool)

(assert (=> b!172829 (=> (not res!82029) (not e!114140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172829 (= res!82029 (validMask!0 (mask!8449 thiss!1248)))))

(declare-fun b!172830 () Bool)

(declare-fun e!114139 () Bool)

(assert (=> b!172830 (= e!114139 tp_is_empty!4063)))

(declare-fun res!82028 () Bool)

(assert (=> start!17248 (=> (not res!82028) (not e!114140))))

(declare-fun valid!985 (LongMapFixedSize!2284) Bool)

(assert (=> start!17248 (= res!82028 (valid!985 thiss!1248))))

(assert (=> start!17248 e!114140))

(assert (=> start!17248 e!114138))

(assert (=> start!17248 true))

(declare-fun b!172831 () Bool)

(declare-fun res!82030 () Bool)

(assert (=> b!172831 (=> (not res!82030) (not e!114140))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172831 (= res!82030 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!6915 () Bool)

(declare-fun tp!15530 () Bool)

(assert (=> mapNonEmpty!6915 (= mapRes!6915 (and tp!15530 e!114141))))

(declare-fun mapKey!6915 () (_ BitVec 32))

(declare-fun mapRest!6915 () (Array (_ BitVec 32) ValueCell!1688))

(declare-fun mapValue!6915 () ValueCell!1688)

(assert (=> mapNonEmpty!6915 (= (arr!3437 (_values!3571 thiss!1248)) (store mapRest!6915 mapKey!6915 mapValue!6915))))

(declare-fun b!172832 () Bool)

(assert (=> b!172832 (= e!114137 (and e!114139 mapRes!6915))))

(declare-fun condMapEmpty!6915 () Bool)

(declare-fun mapDefault!6915 () ValueCell!1688)

(assert (=> b!172832 (= condMapEmpty!6915 (= (arr!3437 (_values!3571 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1688)) mapDefault!6915)))))

(declare-fun b!172833 () Bool)

(assert (=> b!172833 (= e!114140 (and (= (size!3737 (_values!3571 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8449 thiss!1248))) (= (size!3736 (_keys!5426 thiss!1248)) (size!3737 (_values!3571 thiss!1248))) (bvsge (mask!8449 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3327 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3327 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3327 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (= (bvand (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!17248 res!82028) b!172831))

(assert (= (and b!172831 res!82030) b!172829))

(assert (= (and b!172829 res!82029) b!172833))

(assert (= (and b!172832 condMapEmpty!6915) mapIsEmpty!6915))

(assert (= (and b!172832 (not condMapEmpty!6915)) mapNonEmpty!6915))

(get-info :version)

(assert (= (and mapNonEmpty!6915 ((_ is ValueCellFull!1688) mapValue!6915)) b!172827))

(assert (= (and b!172832 ((_ is ValueCellFull!1688) mapDefault!6915)) b!172830))

(assert (= b!172828 b!172832))

(assert (= start!17248 b!172828))

(declare-fun m!200863 () Bool)

(assert (=> b!172828 m!200863))

(declare-fun m!200865 () Bool)

(assert (=> b!172828 m!200865))

(declare-fun m!200867 () Bool)

(assert (=> b!172829 m!200867))

(declare-fun m!200869 () Bool)

(assert (=> start!17248 m!200869))

(declare-fun m!200871 () Bool)

(assert (=> mapNonEmpty!6915 m!200871))

(check-sat (not b!172828) (not mapNonEmpty!6915) tp_is_empty!4063 (not b!172829) b_and!10705 (not b_next!4291) (not start!17248))
(check-sat b_and!10705 (not b_next!4291))

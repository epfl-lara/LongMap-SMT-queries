; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17248 () Bool)

(assert start!17248)

(declare-fun b!173022 () Bool)

(declare-fun b_free!4291 () Bool)

(declare-fun b_next!4291 () Bool)

(assert (=> b!173022 (= b_free!4291 (not b_next!4291))))

(declare-fun tp!15530 () Bool)

(declare-fun b_and!10745 () Bool)

(assert (=> b!173022 (= tp!15530 b_and!10745)))

(declare-fun b!173021 () Bool)

(declare-fun e!114263 () Bool)

(declare-fun e!114261 () Bool)

(declare-fun mapRes!6915 () Bool)

(assert (=> b!173021 (= e!114263 (and e!114261 mapRes!6915))))

(declare-fun condMapEmpty!6915 () Bool)

(declare-datatypes ((V!5065 0))(
  ( (V!5066 (val!2076 Int)) )
))
(declare-datatypes ((ValueCell!1688 0))(
  ( (ValueCellFull!1688 (v!3945 V!5065)) (EmptyCell!1688) )
))
(declare-datatypes ((array!7239 0))(
  ( (array!7240 (arr!3440 (Array (_ BitVec 32) (_ BitVec 64))) (size!3739 (_ BitVec 32))) )
))
(declare-datatypes ((array!7241 0))(
  ( (array!7242 (arr!3441 (Array (_ BitVec 32) ValueCell!1688)) (size!3740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2284 0))(
  ( (LongMapFixedSize!2285 (defaultEntry!3588 Int) (mask!8450 (_ BitVec 32)) (extraKeys!3327 (_ BitVec 32)) (zeroValue!3429 V!5065) (minValue!3431 V!5065) (_size!1191 (_ BitVec 32)) (_keys!5427 array!7239) (_values!3571 array!7241) (_vacant!1191 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2284)

(declare-fun mapDefault!6915 () ValueCell!1688)

(assert (=> b!173021 (= condMapEmpty!6915 (= (arr!3441 (_values!3571 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1688)) mapDefault!6915)))))

(declare-fun mapNonEmpty!6915 () Bool)

(declare-fun tp!15531 () Bool)

(declare-fun e!114264 () Bool)

(assert (=> mapNonEmpty!6915 (= mapRes!6915 (and tp!15531 e!114264))))

(declare-fun mapValue!6915 () ValueCell!1688)

(declare-fun mapRest!6915 () (Array (_ BitVec 32) ValueCell!1688))

(declare-fun mapKey!6915 () (_ BitVec 32))

(assert (=> mapNonEmpty!6915 (= (arr!3441 (_values!3571 thiss!1248)) (store mapRest!6915 mapKey!6915 mapValue!6915))))

(declare-fun mapIsEmpty!6915 () Bool)

(assert (=> mapIsEmpty!6915 mapRes!6915))

(declare-fun tp_is_empty!4063 () Bool)

(declare-fun e!114266 () Bool)

(declare-fun array_inv!2215 (array!7239) Bool)

(declare-fun array_inv!2216 (array!7241) Bool)

(assert (=> b!173022 (= e!114266 (and tp!15530 tp_is_empty!4063 (array_inv!2215 (_keys!5427 thiss!1248)) (array_inv!2216 (_values!3571 thiss!1248)) e!114263))))

(declare-fun b!173023 () Bool)

(declare-fun e!114265 () Bool)

(assert (=> b!173023 (= e!114265 (and (= (size!3740 (_values!3571 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8450 thiss!1248))) (= (size!3739 (_keys!5427 thiss!1248)) (size!3740 (_values!3571 thiss!1248))) (bvsge (mask!8450 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3327 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3327 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3327 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (= (bvand (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173024 () Bool)

(declare-fun res!82145 () Bool)

(assert (=> b!173024 (=> (not res!82145) (not e!114265))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173024 (= res!82145 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!82144 () Bool)

(assert (=> start!17248 (=> (not res!82144) (not e!114265))))

(declare-fun valid!981 (LongMapFixedSize!2284) Bool)

(assert (=> start!17248 (= res!82144 (valid!981 thiss!1248))))

(assert (=> start!17248 e!114265))

(assert (=> start!17248 e!114266))

(assert (=> start!17248 true))

(declare-fun b!173025 () Bool)

(assert (=> b!173025 (= e!114264 tp_is_empty!4063)))

(declare-fun b!173026 () Bool)

(declare-fun res!82146 () Bool)

(assert (=> b!173026 (=> (not res!82146) (not e!114265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!173026 (= res!82146 (validMask!0 (mask!8450 thiss!1248)))))

(declare-fun b!173027 () Bool)

(assert (=> b!173027 (= e!114261 tp_is_empty!4063)))

(assert (= (and start!17248 res!82144) b!173024))

(assert (= (and b!173024 res!82145) b!173026))

(assert (= (and b!173026 res!82146) b!173023))

(assert (= (and b!173021 condMapEmpty!6915) mapIsEmpty!6915))

(assert (= (and b!173021 (not condMapEmpty!6915)) mapNonEmpty!6915))

(get-info :version)

(assert (= (and mapNonEmpty!6915 ((_ is ValueCellFull!1688) mapValue!6915)) b!173025))

(assert (= (and b!173021 ((_ is ValueCellFull!1688) mapDefault!6915)) b!173027))

(assert (= b!173022 b!173021))

(assert (= start!17248 b!173022))

(declare-fun m!201665 () Bool)

(assert (=> mapNonEmpty!6915 m!201665))

(declare-fun m!201667 () Bool)

(assert (=> b!173022 m!201667))

(declare-fun m!201669 () Bool)

(assert (=> b!173022 m!201669))

(declare-fun m!201671 () Bool)

(assert (=> start!17248 m!201671))

(declare-fun m!201673 () Bool)

(assert (=> b!173026 m!201673))

(check-sat (not start!17248) (not b!173022) (not mapNonEmpty!6915) (not b_next!4291) tp_is_empty!4063 b_and!10745 (not b!173026))
(check-sat b_and!10745 (not b_next!4291))

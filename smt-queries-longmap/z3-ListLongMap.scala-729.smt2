; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16970 () Bool)

(assert start!16970)

(declare-fun b!170616 () Bool)

(declare-fun b_free!4213 () Bool)

(declare-fun b_next!4213 () Bool)

(assert (=> b!170616 (= b_free!4213 (not b_next!4213))))

(declare-fun tp!15262 () Bool)

(declare-fun b_and!10641 () Bool)

(assert (=> b!170616 (= tp!15262 b_and!10641)))

(declare-fun e!112602 () Bool)

(declare-fun e!112597 () Bool)

(declare-datatypes ((V!4961 0))(
  ( (V!4962 (val!2037 Int)) )
))
(declare-datatypes ((ValueCell!1649 0))(
  ( (ValueCellFull!1649 (v!3903 V!4961)) (EmptyCell!1649) )
))
(declare-datatypes ((array!7065 0))(
  ( (array!7066 (arr!3362 (Array (_ BitVec 32) (_ BitVec 64))) (size!3655 (_ BitVec 32))) )
))
(declare-datatypes ((array!7067 0))(
  ( (array!7068 (arr!3363 (Array (_ BitVec 32) ValueCell!1649)) (size!3656 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2206 0))(
  ( (LongMapFixedSize!2207 (defaultEntry!3545 Int) (mask!8363 (_ BitVec 32)) (extraKeys!3286 (_ BitVec 32)) (zeroValue!3388 V!4961) (minValue!3388 V!4961) (_size!1152 (_ BitVec 32)) (_keys!5375 array!7065) (_values!3528 array!7067) (_vacant!1152 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2206)

(declare-fun tp_is_empty!3985 () Bool)

(declare-fun array_inv!2161 (array!7065) Bool)

(declare-fun array_inv!2162 (array!7067) Bool)

(assert (=> b!170616 (= e!112597 (and tp!15262 tp_is_empty!3985 (array_inv!2161 (_keys!5375 thiss!1248)) (array_inv!2162 (_values!3528 thiss!1248)) e!112602))))

(declare-fun b!170617 () Bool)

(declare-fun e!112600 () Bool)

(assert (=> b!170617 (= e!112600 tp_is_empty!3985)))

(declare-fun b!170618 () Bool)

(declare-fun e!112599 () Bool)

(declare-fun mapRes!6764 () Bool)

(assert (=> b!170618 (= e!112602 (and e!112599 mapRes!6764))))

(declare-fun condMapEmpty!6764 () Bool)

(declare-fun mapDefault!6764 () ValueCell!1649)

(assert (=> b!170618 (= condMapEmpty!6764 (= (arr!3363 (_values!3528 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1649)) mapDefault!6764)))))

(declare-fun b!170619 () Bool)

(declare-fun res!81100 () Bool)

(declare-fun e!112598 () Bool)

(assert (=> b!170619 (=> (not res!81100) (not e!112598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170619 (= res!81100 (validMask!0 (mask!8363 thiss!1248)))))

(declare-fun b!170620 () Bool)

(assert (=> b!170620 (= e!112598 (and (= (size!3656 (_values!3528 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8363 thiss!1248))) (= (size!3655 (_keys!5375 thiss!1248)) (size!3656 (_values!3528 thiss!1248))) (bvsge (mask!8363 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3286 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3286 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3286 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (= (bvand (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!81101 () Bool)

(assert (=> start!16970 (=> (not res!81101) (not e!112598))))

(declare-fun valid!956 (LongMapFixedSize!2206) Bool)

(assert (=> start!16970 (= res!81101 (valid!956 thiss!1248))))

(assert (=> start!16970 e!112598))

(assert (=> start!16970 e!112597))

(assert (=> start!16970 true))

(declare-fun b!170621 () Bool)

(declare-fun res!81102 () Bool)

(assert (=> b!170621 (=> (not res!81102) (not e!112598))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170621 (= res!81102 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6764 () Bool)

(declare-fun tp!15263 () Bool)

(assert (=> mapNonEmpty!6764 (= mapRes!6764 (and tp!15263 e!112600))))

(declare-fun mapKey!6764 () (_ BitVec 32))

(declare-fun mapRest!6764 () (Array (_ BitVec 32) ValueCell!1649))

(declare-fun mapValue!6764 () ValueCell!1649)

(assert (=> mapNonEmpty!6764 (= (arr!3363 (_values!3528 thiss!1248)) (store mapRest!6764 mapKey!6764 mapValue!6764))))

(declare-fun mapIsEmpty!6764 () Bool)

(assert (=> mapIsEmpty!6764 mapRes!6764))

(declare-fun b!170622 () Bool)

(assert (=> b!170622 (= e!112599 tp_is_empty!3985)))

(assert (= (and start!16970 res!81101) b!170621))

(assert (= (and b!170621 res!81102) b!170619))

(assert (= (and b!170619 res!81100) b!170620))

(assert (= (and b!170618 condMapEmpty!6764) mapIsEmpty!6764))

(assert (= (and b!170618 (not condMapEmpty!6764)) mapNonEmpty!6764))

(get-info :version)

(assert (= (and mapNonEmpty!6764 ((_ is ValueCellFull!1649) mapValue!6764)) b!170617))

(assert (= (and b!170618 ((_ is ValueCellFull!1649) mapDefault!6764)) b!170622))

(assert (= b!170616 b!170618))

(assert (= start!16970 b!170616))

(declare-fun m!199195 () Bool)

(assert (=> b!170616 m!199195))

(declare-fun m!199197 () Bool)

(assert (=> b!170616 m!199197))

(declare-fun m!199199 () Bool)

(assert (=> b!170619 m!199199))

(declare-fun m!199201 () Bool)

(assert (=> start!16970 m!199201))

(declare-fun m!199203 () Bool)

(assert (=> mapNonEmpty!6764 m!199203))

(check-sat (not b_next!4213) (not b!170619) (not b!170616) tp_is_empty!3985 (not mapNonEmpty!6764) b_and!10641 (not start!16970))
(check-sat b_and!10641 (not b_next!4213))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16970 () Bool)

(assert start!16970)

(declare-fun b!170426 () Bool)

(declare-fun b_free!4213 () Bool)

(declare-fun b_next!4213 () Bool)

(assert (=> b!170426 (= b_free!4213 (not b_next!4213))))

(declare-fun tp!15263 () Bool)

(declare-fun b_and!10601 () Bool)

(assert (=> b!170426 (= tp!15263 b_and!10601)))

(declare-fun mapNonEmpty!6764 () Bool)

(declare-fun mapRes!6764 () Bool)

(declare-fun tp!15262 () Bool)

(declare-fun e!112476 () Bool)

(assert (=> mapNonEmpty!6764 (= mapRes!6764 (and tp!15262 e!112476))))

(declare-datatypes ((V!4961 0))(
  ( (V!4962 (val!2037 Int)) )
))
(declare-datatypes ((ValueCell!1649 0))(
  ( (ValueCellFull!1649 (v!3896 V!4961)) (EmptyCell!1649) )
))
(declare-fun mapValue!6764 () ValueCell!1649)

(declare-fun mapRest!6764 () (Array (_ BitVec 32) ValueCell!1649))

(declare-fun mapKey!6764 () (_ BitVec 32))

(declare-datatypes ((array!7059 0))(
  ( (array!7060 (arr!3358 (Array (_ BitVec 32) (_ BitVec 64))) (size!3652 (_ BitVec 32))) )
))
(declare-datatypes ((array!7061 0))(
  ( (array!7062 (arr!3359 (Array (_ BitVec 32) ValueCell!1649)) (size!3653 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2206 0))(
  ( (LongMapFixedSize!2207 (defaultEntry!3545 Int) (mask!8362 (_ BitVec 32)) (extraKeys!3286 (_ BitVec 32)) (zeroValue!3388 V!4961) (minValue!3388 V!4961) (_size!1152 (_ BitVec 32)) (_keys!5374 array!7059) (_values!3528 array!7061) (_vacant!1152 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2206)

(assert (=> mapNonEmpty!6764 (= (arr!3359 (_values!3528 thiss!1248)) (store mapRest!6764 mapKey!6764 mapValue!6764))))

(declare-fun res!80984 () Bool)

(declare-fun e!112473 () Bool)

(assert (=> start!16970 (=> (not res!80984) (not e!112473))))

(declare-fun valid!961 (LongMapFixedSize!2206) Bool)

(assert (=> start!16970 (= res!80984 (valid!961 thiss!1248))))

(assert (=> start!16970 e!112473))

(declare-fun e!112474 () Bool)

(assert (=> start!16970 e!112474))

(assert (=> start!16970 true))

(declare-fun b!170422 () Bool)

(declare-fun res!80986 () Bool)

(assert (=> b!170422 (=> (not res!80986) (not e!112473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170422 (= res!80986 (validMask!0 (mask!8362 thiss!1248)))))

(declare-fun b!170423 () Bool)

(declare-fun res!80985 () Bool)

(assert (=> b!170423 (=> (not res!80985) (not e!112473))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170423 (= res!80985 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170424 () Bool)

(assert (=> b!170424 (= e!112473 (and (= (size!3653 (_values!3528 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8362 thiss!1248))) (= (size!3652 (_keys!5374 thiss!1248)) (size!3653 (_values!3528 thiss!1248))) (bvsge (mask!8362 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3286 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3286 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3286 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (= (bvand (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!170425 () Bool)

(declare-fun tp_is_empty!3985 () Bool)

(assert (=> b!170425 (= e!112476 tp_is_empty!3985)))

(declare-fun e!112472 () Bool)

(declare-fun array_inv!2165 (array!7059) Bool)

(declare-fun array_inv!2166 (array!7061) Bool)

(assert (=> b!170426 (= e!112474 (and tp!15263 tp_is_empty!3985 (array_inv!2165 (_keys!5374 thiss!1248)) (array_inv!2166 (_values!3528 thiss!1248)) e!112472))))

(declare-fun b!170427 () Bool)

(declare-fun e!112477 () Bool)

(assert (=> b!170427 (= e!112477 tp_is_empty!3985)))

(declare-fun mapIsEmpty!6764 () Bool)

(assert (=> mapIsEmpty!6764 mapRes!6764))

(declare-fun b!170428 () Bool)

(assert (=> b!170428 (= e!112472 (and e!112477 mapRes!6764))))

(declare-fun condMapEmpty!6764 () Bool)

(declare-fun mapDefault!6764 () ValueCell!1649)

(assert (=> b!170428 (= condMapEmpty!6764 (= (arr!3359 (_values!3528 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1649)) mapDefault!6764)))))

(assert (= (and start!16970 res!80984) b!170423))

(assert (= (and b!170423 res!80985) b!170422))

(assert (= (and b!170422 res!80986) b!170424))

(assert (= (and b!170428 condMapEmpty!6764) mapIsEmpty!6764))

(assert (= (and b!170428 (not condMapEmpty!6764)) mapNonEmpty!6764))

(get-info :version)

(assert (= (and mapNonEmpty!6764 ((_ is ValueCellFull!1649) mapValue!6764)) b!170425))

(assert (= (and b!170428 ((_ is ValueCellFull!1649) mapDefault!6764)) b!170427))

(assert (= b!170426 b!170428))

(assert (= start!16970 b!170426))

(declare-fun m!198393 () Bool)

(assert (=> mapNonEmpty!6764 m!198393))

(declare-fun m!198395 () Bool)

(assert (=> start!16970 m!198395))

(declare-fun m!198397 () Bool)

(assert (=> b!170422 m!198397))

(declare-fun m!198399 () Bool)

(assert (=> b!170426 m!198399))

(declare-fun m!198401 () Bool)

(assert (=> b!170426 m!198401))

(check-sat (not start!16970) (not b!170422) (not b_next!4213) b_and!10601 (not b!170426) tp_is_empty!3985 (not mapNonEmpty!6764))
(check-sat b_and!10601 (not b_next!4213))

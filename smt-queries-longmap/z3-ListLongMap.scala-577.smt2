; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15608 () Bool)

(assert start!15608)

(declare-fun b!155240 () Bool)

(declare-fun b_free!3271 () Bool)

(declare-fun b_next!3271 () Bool)

(assert (=> b!155240 (= b_free!3271 (not b_next!3271))))

(declare-fun tp!12337 () Bool)

(declare-fun b_and!9659 () Bool)

(assert (=> b!155240 (= tp!12337 b_and!9659)))

(declare-fun b!155235 () Bool)

(declare-fun res!73286 () Bool)

(declare-fun e!101412 () Bool)

(assert (=> b!155235 (=> (not res!73286) (not e!101412))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155235 (= res!73286 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155236 () Bool)

(declare-fun res!73287 () Bool)

(assert (=> b!155236 (=> (not res!73287) (not e!101412))))

(declare-datatypes ((V!3745 0))(
  ( (V!3746 (val!1581 Int)) )
))
(declare-datatypes ((ValueCell!1193 0))(
  ( (ValueCellFull!1193 (v!3440 V!3745)) (EmptyCell!1193) )
))
(declare-datatypes ((array!5179 0))(
  ( (array!5180 (arr!2446 (Array (_ BitVec 32) (_ BitVec 64))) (size!2725 (_ BitVec 32))) )
))
(declare-datatypes ((array!5181 0))(
  ( (array!5182 (arr!2447 (Array (_ BitVec 32) ValueCell!1193)) (size!2726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1294 0))(
  ( (LongMapFixedSize!1295 (defaultEntry!3089 Int) (mask!7511 (_ BitVec 32)) (extraKeys!2830 (_ BitVec 32)) (zeroValue!2932 V!3745) (minValue!2932 V!3745) (_size!696 (_ BitVec 32)) (_keys!4863 array!5179) (_values!3072 array!5181) (_vacant!696 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1294)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155236 (= res!73287 (validMask!0 (mask!7511 thiss!1248)))))

(declare-fun b!155237 () Bool)

(assert (=> b!155237 (= e!101412 false)))

(declare-fun lt!81177 () Bool)

(declare-datatypes ((List!1826 0))(
  ( (Nil!1823) (Cons!1822 (h!2431 (_ BitVec 64)) (t!6619 List!1826)) )
))
(declare-fun arrayNoDuplicates!0 (array!5179 (_ BitVec 32) List!1826) Bool)

(assert (=> b!155237 (= lt!81177 (arrayNoDuplicates!0 (_keys!4863 thiss!1248) #b00000000000000000000000000000000 Nil!1823))))

(declare-fun mapNonEmpty!5252 () Bool)

(declare-fun mapRes!5252 () Bool)

(declare-fun tp!12338 () Bool)

(declare-fun e!101416 () Bool)

(assert (=> mapNonEmpty!5252 (= mapRes!5252 (and tp!12338 e!101416))))

(declare-fun mapRest!5252 () (Array (_ BitVec 32) ValueCell!1193))

(declare-fun mapKey!5252 () (_ BitVec 32))

(declare-fun mapValue!5252 () ValueCell!1193)

(assert (=> mapNonEmpty!5252 (= (arr!2447 (_values!3072 thiss!1248)) (store mapRest!5252 mapKey!5252 mapValue!5252))))

(declare-fun b!155238 () Bool)

(declare-fun res!73289 () Bool)

(assert (=> b!155238 (=> (not res!73289) (not e!101412))))

(assert (=> b!155238 (= res!73289 (and (= (size!2726 (_values!3072 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7511 thiss!1248))) (= (size!2725 (_keys!4863 thiss!1248)) (size!2726 (_values!3072 thiss!1248))) (bvsge (mask!7511 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2830 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2830 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2830 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155239 () Bool)

(declare-fun res!73288 () Bool)

(assert (=> b!155239 (=> (not res!73288) (not e!101412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5179 (_ BitVec 32)) Bool)

(assert (=> b!155239 (= res!73288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4863 thiss!1248) (mask!7511 thiss!1248)))))

(declare-fun mapIsEmpty!5252 () Bool)

(assert (=> mapIsEmpty!5252 mapRes!5252))

(declare-fun b!155241 () Bool)

(declare-fun tp_is_empty!3073 () Bool)

(assert (=> b!155241 (= e!101416 tp_is_empty!3073)))

(declare-fun b!155242 () Bool)

(declare-fun e!101414 () Bool)

(declare-fun e!101415 () Bool)

(assert (=> b!155242 (= e!101414 (and e!101415 mapRes!5252))))

(declare-fun condMapEmpty!5252 () Bool)

(declare-fun mapDefault!5252 () ValueCell!1193)

(assert (=> b!155242 (= condMapEmpty!5252 (= (arr!2447 (_values!3072 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1193)) mapDefault!5252)))))

(declare-fun b!155243 () Bool)

(assert (=> b!155243 (= e!101415 tp_is_empty!3073)))

(declare-fun e!101411 () Bool)

(declare-fun array_inv!1567 (array!5179) Bool)

(declare-fun array_inv!1568 (array!5181) Bool)

(assert (=> b!155240 (= e!101411 (and tp!12337 tp_is_empty!3073 (array_inv!1567 (_keys!4863 thiss!1248)) (array_inv!1568 (_values!3072 thiss!1248)) e!101414))))

(declare-fun res!73285 () Bool)

(assert (=> start!15608 (=> (not res!73285) (not e!101412))))

(declare-fun valid!640 (LongMapFixedSize!1294) Bool)

(assert (=> start!15608 (= res!73285 (valid!640 thiss!1248))))

(assert (=> start!15608 e!101412))

(assert (=> start!15608 e!101411))

(assert (=> start!15608 true))

(assert (= (and start!15608 res!73285) b!155235))

(assert (= (and b!155235 res!73286) b!155236))

(assert (= (and b!155236 res!73287) b!155238))

(assert (= (and b!155238 res!73289) b!155239))

(assert (= (and b!155239 res!73288) b!155237))

(assert (= (and b!155242 condMapEmpty!5252) mapIsEmpty!5252))

(assert (= (and b!155242 (not condMapEmpty!5252)) mapNonEmpty!5252))

(get-info :version)

(assert (= (and mapNonEmpty!5252 ((_ is ValueCellFull!1193) mapValue!5252)) b!155241))

(assert (= (and b!155242 ((_ is ValueCellFull!1193) mapDefault!5252)) b!155243))

(assert (= b!155240 b!155242))

(assert (= start!15608 b!155240))

(declare-fun m!188689 () Bool)

(assert (=> b!155236 m!188689))

(declare-fun m!188691 () Bool)

(assert (=> b!155239 m!188691))

(declare-fun m!188693 () Bool)

(assert (=> start!15608 m!188693))

(declare-fun m!188695 () Bool)

(assert (=> b!155240 m!188695))

(declare-fun m!188697 () Bool)

(assert (=> b!155240 m!188697))

(declare-fun m!188699 () Bool)

(assert (=> b!155237 m!188699))

(declare-fun m!188701 () Bool)

(assert (=> mapNonEmpty!5252 m!188701))

(check-sat (not b!155236) (not b!155239) (not b!155240) (not mapNonEmpty!5252) tp_is_empty!3073 b_and!9659 (not b!155237) (not start!15608) (not b_next!3271))
(check-sat b_and!9659 (not b_next!3271))

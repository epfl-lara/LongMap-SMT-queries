; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15618 () Bool)

(assert start!15618)

(declare-fun b!155575 () Bool)

(declare-fun b_free!3285 () Bool)

(declare-fun b_next!3285 () Bool)

(assert (=> b!155575 (= b_free!3285 (not b_next!3285))))

(declare-fun tp!12380 () Bool)

(declare-fun b_and!9699 () Bool)

(assert (=> b!155575 (= tp!12380 b_and!9699)))

(declare-fun b!155571 () Bool)

(declare-fun res!73489 () Bool)

(declare-fun e!101640 () Bool)

(assert (=> b!155571 (=> (not res!73489) (not e!101640))))

(declare-datatypes ((V!3763 0))(
  ( (V!3764 (val!1588 Int)) )
))
(declare-datatypes ((ValueCell!1200 0))(
  ( (ValueCellFull!1200 (v!3453 V!3763)) (EmptyCell!1200) )
))
(declare-datatypes ((array!5227 0))(
  ( (array!5228 (arr!2471 (Array (_ BitVec 32) (_ BitVec 64))) (size!2749 (_ BitVec 32))) )
))
(declare-datatypes ((array!5229 0))(
  ( (array!5230 (arr!2472 (Array (_ BitVec 32) ValueCell!1200)) (size!2750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1308 0))(
  ( (LongMapFixedSize!1309 (defaultEntry!3096 Int) (mask!7523 (_ BitVec 32)) (extraKeys!2837 (_ BitVec 32)) (zeroValue!2939 V!3763) (minValue!2939 V!3763) (_size!703 (_ BitVec 32)) (_keys!4871 array!5227) (_values!3079 array!5229) (_vacant!703 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1308)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155571 (= res!73489 (validMask!0 (mask!7523 thiss!1248)))))

(declare-fun b!155572 () Bool)

(declare-fun res!73488 () Bool)

(assert (=> b!155572 (=> (not res!73488) (not e!101640))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155572 (= res!73488 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155573 () Bool)

(declare-fun res!73486 () Bool)

(assert (=> b!155573 (=> (not res!73486) (not e!101640))))

(assert (=> b!155573 (= res!73486 (and (= (size!2750 (_values!3079 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7523 thiss!1248))) (= (size!2749 (_keys!4871 thiss!1248)) (size!2750 (_values!3079 thiss!1248))) (bvsge (mask!7523 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2837 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2837 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2837 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2837 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2837 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2837 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2837 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155574 () Bool)

(declare-fun e!101642 () Bool)

(declare-fun e!101641 () Bool)

(declare-fun mapRes!5273 () Bool)

(assert (=> b!155574 (= e!101642 (and e!101641 mapRes!5273))))

(declare-fun condMapEmpty!5273 () Bool)

(declare-fun mapDefault!5273 () ValueCell!1200)

(assert (=> b!155574 (= condMapEmpty!5273 (= (arr!2472 (_values!3079 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1200)) mapDefault!5273)))))

(declare-fun e!101643 () Bool)

(declare-fun tp_is_empty!3087 () Bool)

(declare-fun array_inv!1559 (array!5227) Bool)

(declare-fun array_inv!1560 (array!5229) Bool)

(assert (=> b!155575 (= e!101643 (and tp!12380 tp_is_empty!3087 (array_inv!1559 (_keys!4871 thiss!1248)) (array_inv!1560 (_values!3079 thiss!1248)) e!101642))))

(declare-fun b!155576 () Bool)

(assert (=> b!155576 (= e!101641 tp_is_empty!3087)))

(declare-fun res!73487 () Bool)

(assert (=> start!15618 (=> (not res!73487) (not e!101640))))

(declare-fun valid!642 (LongMapFixedSize!1308) Bool)

(assert (=> start!15618 (= res!73487 (valid!642 thiss!1248))))

(assert (=> start!15618 e!101640))

(assert (=> start!15618 e!101643))

(assert (=> start!15618 true))

(declare-fun mapNonEmpty!5273 () Bool)

(declare-fun tp!12379 () Bool)

(declare-fun e!101638 () Bool)

(assert (=> mapNonEmpty!5273 (= mapRes!5273 (and tp!12379 e!101638))))

(declare-fun mapKey!5273 () (_ BitVec 32))

(declare-fun mapRest!5273 () (Array (_ BitVec 32) ValueCell!1200))

(declare-fun mapValue!5273 () ValueCell!1200)

(assert (=> mapNonEmpty!5273 (= (arr!2472 (_values!3079 thiss!1248)) (store mapRest!5273 mapKey!5273 mapValue!5273))))

(declare-fun b!155577 () Bool)

(assert (=> b!155577 (= e!101640 false)))

(declare-fun lt!81379 () Bool)

(declare-datatypes ((List!1829 0))(
  ( (Nil!1826) (Cons!1825 (h!2434 (_ BitVec 64)) (t!6631 List!1829)) )
))
(declare-fun arrayNoDuplicates!0 (array!5227 (_ BitVec 32) List!1829) Bool)

(assert (=> b!155577 (= lt!81379 (arrayNoDuplicates!0 (_keys!4871 thiss!1248) #b00000000000000000000000000000000 Nil!1826))))

(declare-fun b!155578 () Bool)

(assert (=> b!155578 (= e!101638 tp_is_empty!3087)))

(declare-fun b!155579 () Bool)

(declare-fun res!73485 () Bool)

(assert (=> b!155579 (=> (not res!73485) (not e!101640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5227 (_ BitVec 32)) Bool)

(assert (=> b!155579 (= res!73485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4871 thiss!1248) (mask!7523 thiss!1248)))))

(declare-fun mapIsEmpty!5273 () Bool)

(assert (=> mapIsEmpty!5273 mapRes!5273))

(assert (= (and start!15618 res!73487) b!155572))

(assert (= (and b!155572 res!73488) b!155571))

(assert (= (and b!155571 res!73489) b!155573))

(assert (= (and b!155573 res!73486) b!155579))

(assert (= (and b!155579 res!73485) b!155577))

(assert (= (and b!155574 condMapEmpty!5273) mapIsEmpty!5273))

(assert (= (and b!155574 (not condMapEmpty!5273)) mapNonEmpty!5273))

(get-info :version)

(assert (= (and mapNonEmpty!5273 ((_ is ValueCellFull!1200) mapValue!5273)) b!155578))

(assert (= (and b!155574 ((_ is ValueCellFull!1200) mapDefault!5273)) b!155576))

(assert (= b!155575 b!155574))

(assert (= start!15618 b!155575))

(declare-fun m!189407 () Bool)

(assert (=> b!155575 m!189407))

(declare-fun m!189409 () Bool)

(assert (=> b!155575 m!189409))

(declare-fun m!189411 () Bool)

(assert (=> b!155571 m!189411))

(declare-fun m!189413 () Bool)

(assert (=> mapNonEmpty!5273 m!189413))

(declare-fun m!189415 () Bool)

(assert (=> start!15618 m!189415))

(declare-fun m!189417 () Bool)

(assert (=> b!155579 m!189417))

(declare-fun m!189419 () Bool)

(assert (=> b!155577 m!189419))

(check-sat (not b!155571) (not b!155577) b_and!9699 (not b_next!3285) (not start!15618) tp_is_empty!3087 (not mapNonEmpty!5273) (not b!155579) (not b!155575))
(check-sat b_and!9699 (not b_next!3285))

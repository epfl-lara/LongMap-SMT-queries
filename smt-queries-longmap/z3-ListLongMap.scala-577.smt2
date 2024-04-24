; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15608 () Bool)

(assert start!15608)

(declare-fun b!155429 () Bool)

(declare-fun b_free!3271 () Bool)

(declare-fun b_next!3271 () Bool)

(assert (=> b!155429 (= b_free!3271 (not b_next!3271))))

(declare-fun tp!12338 () Bool)

(declare-fun b_and!9699 () Bool)

(assert (=> b!155429 (= tp!12338 b_and!9699)))

(declare-fun e!101538 () Bool)

(declare-datatypes ((V!3745 0))(
  ( (V!3746 (val!1581 Int)) )
))
(declare-datatypes ((ValueCell!1193 0))(
  ( (ValueCellFull!1193 (v!3447 V!3745)) (EmptyCell!1193) )
))
(declare-datatypes ((array!5185 0))(
  ( (array!5186 (arr!2450 (Array (_ BitVec 32) (_ BitVec 64))) (size!2728 (_ BitVec 32))) )
))
(declare-datatypes ((array!5187 0))(
  ( (array!5188 (arr!2451 (Array (_ BitVec 32) ValueCell!1193)) (size!2729 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1294 0))(
  ( (LongMapFixedSize!1295 (defaultEntry!3089 Int) (mask!7512 (_ BitVec 32)) (extraKeys!2830 (_ BitVec 32)) (zeroValue!2932 V!3745) (minValue!2932 V!3745) (_size!696 (_ BitVec 32)) (_keys!4864 array!5185) (_values!3072 array!5187) (_vacant!696 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1294)

(declare-fun tp_is_empty!3073 () Bool)

(declare-fun e!101537 () Bool)

(declare-fun array_inv!1549 (array!5185) Bool)

(declare-fun array_inv!1550 (array!5187) Bool)

(assert (=> b!155429 (= e!101538 (and tp!12338 tp_is_empty!3073 (array_inv!1549 (_keys!4864 thiss!1248)) (array_inv!1550 (_values!3072 thiss!1248)) e!101537))))

(declare-fun b!155430 () Bool)

(declare-fun res!73401 () Bool)

(declare-fun e!101539 () Bool)

(assert (=> b!155430 (=> (not res!73401) (not e!101539))))

(assert (=> b!155430 (= res!73401 (and (= (size!2729 (_values!3072 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7512 thiss!1248))) (= (size!2728 (_keys!4864 thiss!1248)) (size!2729 (_values!3072 thiss!1248))) (bvsge (mask!7512 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2830 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2830 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2830 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155431 () Bool)

(declare-fun e!101540 () Bool)

(assert (=> b!155431 (= e!101540 tp_is_empty!3073)))

(declare-fun res!73403 () Bool)

(assert (=> start!15608 (=> (not res!73403) (not e!101539))))

(declare-fun valid!649 (LongMapFixedSize!1294) Bool)

(assert (=> start!15608 (= res!73403 (valid!649 thiss!1248))))

(assert (=> start!15608 e!101539))

(assert (=> start!15608 e!101538))

(assert (=> start!15608 true))

(declare-fun b!155432 () Bool)

(declare-fun e!101536 () Bool)

(declare-fun mapRes!5252 () Bool)

(assert (=> b!155432 (= e!101537 (and e!101536 mapRes!5252))))

(declare-fun condMapEmpty!5252 () Bool)

(declare-fun mapDefault!5252 () ValueCell!1193)

(assert (=> b!155432 (= condMapEmpty!5252 (= (arr!2451 (_values!3072 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1193)) mapDefault!5252)))))

(declare-fun b!155433 () Bool)

(assert (=> b!155433 (= e!101536 tp_is_empty!3073)))

(declare-fun mapIsEmpty!5252 () Bool)

(assert (=> mapIsEmpty!5252 mapRes!5252))

(declare-fun b!155434 () Bool)

(declare-fun res!73405 () Bool)

(assert (=> b!155434 (=> (not res!73405) (not e!101539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155434 (= res!73405 (validMask!0 (mask!7512 thiss!1248)))))

(declare-fun b!155435 () Bool)

(declare-fun res!73402 () Bool)

(assert (=> b!155435 (=> (not res!73402) (not e!101539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5185 (_ BitVec 32)) Bool)

(assert (=> b!155435 (= res!73402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4864 thiss!1248) (mask!7512 thiss!1248)))))

(declare-fun b!155436 () Bool)

(declare-fun res!73404 () Bool)

(assert (=> b!155436 (=> (not res!73404) (not e!101539))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155436 (= res!73404 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5252 () Bool)

(declare-fun tp!12337 () Bool)

(assert (=> mapNonEmpty!5252 (= mapRes!5252 (and tp!12337 e!101540))))

(declare-fun mapKey!5252 () (_ BitVec 32))

(declare-fun mapValue!5252 () ValueCell!1193)

(declare-fun mapRest!5252 () (Array (_ BitVec 32) ValueCell!1193))

(assert (=> mapNonEmpty!5252 (= (arr!2451 (_values!3072 thiss!1248)) (store mapRest!5252 mapKey!5252 mapValue!5252))))

(declare-fun b!155437 () Bool)

(assert (=> b!155437 (= e!101539 false)))

(declare-fun lt!81417 () Bool)

(declare-datatypes ((List!1807 0))(
  ( (Nil!1804) (Cons!1803 (h!2412 (_ BitVec 64)) (t!6601 List!1807)) )
))
(declare-fun arrayNoDuplicates!0 (array!5185 (_ BitVec 32) List!1807) Bool)

(assert (=> b!155437 (= lt!81417 (arrayNoDuplicates!0 (_keys!4864 thiss!1248) #b00000000000000000000000000000000 Nil!1804))))

(assert (= (and start!15608 res!73403) b!155436))

(assert (= (and b!155436 res!73404) b!155434))

(assert (= (and b!155434 res!73405) b!155430))

(assert (= (and b!155430 res!73401) b!155435))

(assert (= (and b!155435 res!73402) b!155437))

(assert (= (and b!155432 condMapEmpty!5252) mapIsEmpty!5252))

(assert (= (and b!155432 (not condMapEmpty!5252)) mapNonEmpty!5252))

(get-info :version)

(assert (= (and mapNonEmpty!5252 ((_ is ValueCellFull!1193) mapValue!5252)) b!155431))

(assert (= (and b!155432 ((_ is ValueCellFull!1193) mapDefault!5252)) b!155433))

(assert (= b!155429 b!155432))

(assert (= start!15608 b!155429))

(declare-fun m!189491 () Bool)

(assert (=> b!155434 m!189491))

(declare-fun m!189493 () Bool)

(assert (=> b!155429 m!189493))

(declare-fun m!189495 () Bool)

(assert (=> b!155429 m!189495))

(declare-fun m!189497 () Bool)

(assert (=> mapNonEmpty!5252 m!189497))

(declare-fun m!189499 () Bool)

(assert (=> b!155435 m!189499))

(declare-fun m!189501 () Bool)

(assert (=> start!15608 m!189501))

(declare-fun m!189503 () Bool)

(assert (=> b!155437 m!189503))

(check-sat tp_is_empty!3073 (not b!155434) b_and!9699 (not b!155429) (not b_next!3271) (not b!155437) (not b!155435) (not mapNonEmpty!5252) (not start!15608))
(check-sat b_and!9699 (not b_next!3271))

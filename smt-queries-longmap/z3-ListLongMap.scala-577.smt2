; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15606 () Bool)

(assert start!15606)

(declare-fun b!155409 () Bool)

(declare-fun b_free!3273 () Bool)

(declare-fun b_next!3273 () Bool)

(assert (=> b!155409 (= b_free!3273 (not b_next!3273))))

(declare-fun tp!12344 () Bool)

(declare-fun b_and!9687 () Bool)

(assert (=> b!155409 (= tp!12344 b_and!9687)))

(declare-fun e!101534 () Bool)

(declare-fun tp_is_empty!3075 () Bool)

(declare-fun e!101535 () Bool)

(declare-datatypes ((V!3747 0))(
  ( (V!3748 (val!1582 Int)) )
))
(declare-datatypes ((ValueCell!1194 0))(
  ( (ValueCellFull!1194 (v!3447 V!3747)) (EmptyCell!1194) )
))
(declare-datatypes ((array!5203 0))(
  ( (array!5204 (arr!2459 (Array (_ BitVec 32) (_ BitVec 64))) (size!2737 (_ BitVec 32))) )
))
(declare-datatypes ((array!5205 0))(
  ( (array!5206 (arr!2460 (Array (_ BitVec 32) ValueCell!1194)) (size!2738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1296 0))(
  ( (LongMapFixedSize!1297 (defaultEntry!3090 Int) (mask!7513 (_ BitVec 32)) (extraKeys!2831 (_ BitVec 32)) (zeroValue!2933 V!3747) (minValue!2933 V!3747) (_size!697 (_ BitVec 32)) (_keys!4865 array!5203) (_values!3073 array!5205) (_vacant!697 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1296)

(declare-fun array_inv!1553 (array!5203) Bool)

(declare-fun array_inv!1554 (array!5205) Bool)

(assert (=> b!155409 (= e!101534 (and tp!12344 tp_is_empty!3075 (array_inv!1553 (_keys!4865 thiss!1248)) (array_inv!1554 (_values!3073 thiss!1248)) e!101535))))

(declare-fun res!73396 () Bool)

(declare-fun e!101532 () Bool)

(assert (=> start!15606 (=> (not res!73396) (not e!101532))))

(declare-fun valid!637 (LongMapFixedSize!1296) Bool)

(assert (=> start!15606 (= res!73396 (valid!637 thiss!1248))))

(assert (=> start!15606 e!101532))

(assert (=> start!15606 e!101534))

(assert (=> start!15606 true))

(declare-fun b!155410 () Bool)

(declare-fun res!73395 () Bool)

(assert (=> b!155410 (=> (not res!73395) (not e!101532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5203 (_ BitVec 32)) Bool)

(assert (=> b!155410 (= res!73395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4865 thiss!1248) (mask!7513 thiss!1248)))))

(declare-fun mapNonEmpty!5255 () Bool)

(declare-fun mapRes!5255 () Bool)

(declare-fun tp!12343 () Bool)

(declare-fun e!101533 () Bool)

(assert (=> mapNonEmpty!5255 (= mapRes!5255 (and tp!12343 e!101533))))

(declare-fun mapRest!5255 () (Array (_ BitVec 32) ValueCell!1194))

(declare-fun mapKey!5255 () (_ BitVec 32))

(declare-fun mapValue!5255 () ValueCell!1194)

(assert (=> mapNonEmpty!5255 (= (arr!2460 (_values!3073 thiss!1248)) (store mapRest!5255 mapKey!5255 mapValue!5255))))

(declare-fun b!155411 () Bool)

(declare-fun e!101530 () Bool)

(assert (=> b!155411 (= e!101530 tp_is_empty!3075)))

(declare-fun b!155412 () Bool)

(declare-fun res!73399 () Bool)

(assert (=> b!155412 (=> (not res!73399) (not e!101532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155412 (= res!73399 (validMask!0 (mask!7513 thiss!1248)))))

(declare-fun mapIsEmpty!5255 () Bool)

(assert (=> mapIsEmpty!5255 mapRes!5255))

(declare-fun b!155413 () Bool)

(declare-fun res!73397 () Bool)

(assert (=> b!155413 (=> (not res!73397) (not e!101532))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155413 (= res!73397 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155414 () Bool)

(assert (=> b!155414 (= e!101533 tp_is_empty!3075)))

(declare-fun b!155415 () Bool)

(assert (=> b!155415 (= e!101532 false)))

(declare-fun lt!81361 () Bool)

(declare-datatypes ((List!1825 0))(
  ( (Nil!1822) (Cons!1821 (h!2430 (_ BitVec 64)) (t!6627 List!1825)) )
))
(declare-fun arrayNoDuplicates!0 (array!5203 (_ BitVec 32) List!1825) Bool)

(assert (=> b!155415 (= lt!81361 (arrayNoDuplicates!0 (_keys!4865 thiss!1248) #b00000000000000000000000000000000 Nil!1822))))

(declare-fun b!155416 () Bool)

(declare-fun res!73398 () Bool)

(assert (=> b!155416 (=> (not res!73398) (not e!101532))))

(assert (=> b!155416 (= res!73398 (and (= (size!2738 (_values!3073 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7513 thiss!1248))) (= (size!2737 (_keys!4865 thiss!1248)) (size!2738 (_values!3073 thiss!1248))) (bvsge (mask!7513 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2831 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2831 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2831 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2831 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2831 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2831 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2831 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155417 () Bool)

(assert (=> b!155417 (= e!101535 (and e!101530 mapRes!5255))))

(declare-fun condMapEmpty!5255 () Bool)

(declare-fun mapDefault!5255 () ValueCell!1194)

(assert (=> b!155417 (= condMapEmpty!5255 (= (arr!2460 (_values!3073 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1194)) mapDefault!5255)))))

(assert (= (and start!15606 res!73396) b!155413))

(assert (= (and b!155413 res!73397) b!155412))

(assert (= (and b!155412 res!73399) b!155416))

(assert (= (and b!155416 res!73398) b!155410))

(assert (= (and b!155410 res!73395) b!155415))

(assert (= (and b!155417 condMapEmpty!5255) mapIsEmpty!5255))

(assert (= (and b!155417 (not condMapEmpty!5255)) mapNonEmpty!5255))

(get-info :version)

(assert (= (and mapNonEmpty!5255 ((_ is ValueCellFull!1194) mapValue!5255)) b!155414))

(assert (= (and b!155417 ((_ is ValueCellFull!1194) mapDefault!5255)) b!155411))

(assert (= b!155409 b!155417))

(assert (= start!15606 b!155409))

(declare-fun m!189323 () Bool)

(assert (=> b!155409 m!189323))

(declare-fun m!189325 () Bool)

(assert (=> b!155409 m!189325))

(declare-fun m!189327 () Bool)

(assert (=> start!15606 m!189327))

(declare-fun m!189329 () Bool)

(assert (=> b!155412 m!189329))

(declare-fun m!189331 () Bool)

(assert (=> b!155410 m!189331))

(declare-fun m!189333 () Bool)

(assert (=> b!155415 m!189333))

(declare-fun m!189335 () Bool)

(assert (=> mapNonEmpty!5255 m!189335))

(check-sat b_and!9687 (not mapNonEmpty!5255) (not b!155412) (not b!155415) tp_is_empty!3075 (not b!155409) (not start!15606) (not b_next!3273) (not b!155410))
(check-sat b_and!9687 (not b_next!3273))

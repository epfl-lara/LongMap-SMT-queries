; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15600 () Bool)

(assert start!15600)

(declare-fun b!155332 () Bool)

(declare-fun b_free!3267 () Bool)

(declare-fun b_next!3267 () Bool)

(assert (=> b!155332 (= b_free!3267 (not b_next!3267))))

(declare-fun tp!12325 () Bool)

(declare-fun b_and!9681 () Bool)

(assert (=> b!155332 (= tp!12325 b_and!9681)))

(declare-fun mapNonEmpty!5246 () Bool)

(declare-fun mapRes!5246 () Bool)

(declare-fun tp!12326 () Bool)

(declare-fun e!101481 () Bool)

(assert (=> mapNonEmpty!5246 (= mapRes!5246 (and tp!12326 e!101481))))

(declare-datatypes ((V!3739 0))(
  ( (V!3740 (val!1579 Int)) )
))
(declare-datatypes ((ValueCell!1191 0))(
  ( (ValueCellFull!1191 (v!3444 V!3739)) (EmptyCell!1191) )
))
(declare-fun mapValue!5246 () ValueCell!1191)

(declare-fun mapKey!5246 () (_ BitVec 32))

(declare-datatypes ((array!5191 0))(
  ( (array!5192 (arr!2453 (Array (_ BitVec 32) (_ BitVec 64))) (size!2731 (_ BitVec 32))) )
))
(declare-datatypes ((array!5193 0))(
  ( (array!5194 (arr!2454 (Array (_ BitVec 32) ValueCell!1191)) (size!2732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1290 0))(
  ( (LongMapFixedSize!1291 (defaultEntry!3087 Int) (mask!7508 (_ BitVec 32)) (extraKeys!2828 (_ BitVec 32)) (zeroValue!2930 V!3739) (minValue!2930 V!3739) (_size!694 (_ BitVec 32)) (_keys!4862 array!5191) (_values!3070 array!5193) (_vacant!694 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1290)

(declare-fun mapRest!5246 () (Array (_ BitVec 32) ValueCell!1191))

(assert (=> mapNonEmpty!5246 (= (arr!2454 (_values!3070 thiss!1248)) (store mapRest!5246 mapKey!5246 mapValue!5246))))

(declare-fun b!155328 () Bool)

(declare-fun e!101477 () Bool)

(declare-fun e!101476 () Bool)

(assert (=> b!155328 (= e!101477 (and e!101476 mapRes!5246))))

(declare-fun condMapEmpty!5246 () Bool)

(declare-fun mapDefault!5246 () ValueCell!1191)

(assert (=> b!155328 (= condMapEmpty!5246 (= (arr!2454 (_values!3070 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1191)) mapDefault!5246)))))

(declare-fun b!155329 () Bool)

(declare-fun res!73352 () Bool)

(declare-fun e!101478 () Bool)

(assert (=> b!155329 (=> (not res!73352) (not e!101478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5191 (_ BitVec 32)) Bool)

(assert (=> b!155329 (= res!73352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4862 thiss!1248) (mask!7508 thiss!1248)))))

(declare-fun res!73350 () Bool)

(assert (=> start!15600 (=> (not res!73350) (not e!101478))))

(declare-fun valid!634 (LongMapFixedSize!1290) Bool)

(assert (=> start!15600 (= res!73350 (valid!634 thiss!1248))))

(assert (=> start!15600 e!101478))

(declare-fun e!101480 () Bool)

(assert (=> start!15600 e!101480))

(assert (=> start!15600 true))

(declare-fun b!155330 () Bool)

(declare-fun res!73351 () Bool)

(assert (=> b!155330 (=> (not res!73351) (not e!101478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155330 (= res!73351 (validMask!0 (mask!7508 thiss!1248)))))

(declare-fun b!155331 () Bool)

(declare-fun tp_is_empty!3069 () Bool)

(assert (=> b!155331 (= e!101476 tp_is_empty!3069)))

(declare-fun array_inv!1549 (array!5191) Bool)

(declare-fun array_inv!1550 (array!5193) Bool)

(assert (=> b!155332 (= e!101480 (and tp!12325 tp_is_empty!3069 (array_inv!1549 (_keys!4862 thiss!1248)) (array_inv!1550 (_values!3070 thiss!1248)) e!101477))))

(declare-fun b!155333 () Bool)

(assert (=> b!155333 (= e!101478 false)))

(declare-fun lt!81352 () Bool)

(declare-datatypes ((List!1822 0))(
  ( (Nil!1819) (Cons!1818 (h!2427 (_ BitVec 64)) (t!6624 List!1822)) )
))
(declare-fun arrayNoDuplicates!0 (array!5191 (_ BitVec 32) List!1822) Bool)

(assert (=> b!155333 (= lt!81352 (arrayNoDuplicates!0 (_keys!4862 thiss!1248) #b00000000000000000000000000000000 Nil!1819))))

(declare-fun b!155334 () Bool)

(declare-fun res!73354 () Bool)

(assert (=> b!155334 (=> (not res!73354) (not e!101478))))

(assert (=> b!155334 (= res!73354 (and (= (size!2732 (_values!3070 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7508 thiss!1248))) (= (size!2731 (_keys!4862 thiss!1248)) (size!2732 (_values!3070 thiss!1248))) (bvsge (mask!7508 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2828 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2828 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2828 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2828 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2828 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2828 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2828 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155335 () Bool)

(declare-fun res!73353 () Bool)

(assert (=> b!155335 (=> (not res!73353) (not e!101478))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155335 (= res!73353 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5246 () Bool)

(assert (=> mapIsEmpty!5246 mapRes!5246))

(declare-fun b!155336 () Bool)

(assert (=> b!155336 (= e!101481 tp_is_empty!3069)))

(assert (= (and start!15600 res!73350) b!155335))

(assert (= (and b!155335 res!73353) b!155330))

(assert (= (and b!155330 res!73351) b!155334))

(assert (= (and b!155334 res!73354) b!155329))

(assert (= (and b!155329 res!73352) b!155333))

(assert (= (and b!155328 condMapEmpty!5246) mapIsEmpty!5246))

(assert (= (and b!155328 (not condMapEmpty!5246)) mapNonEmpty!5246))

(get-info :version)

(assert (= (and mapNonEmpty!5246 ((_ is ValueCellFull!1191) mapValue!5246)) b!155336))

(assert (= (and b!155328 ((_ is ValueCellFull!1191) mapDefault!5246)) b!155331))

(assert (= b!155332 b!155328))

(assert (= start!15600 b!155332))

(declare-fun m!189281 () Bool)

(assert (=> b!155333 m!189281))

(declare-fun m!189283 () Bool)

(assert (=> b!155332 m!189283))

(declare-fun m!189285 () Bool)

(assert (=> b!155332 m!189285))

(declare-fun m!189287 () Bool)

(assert (=> mapNonEmpty!5246 m!189287))

(declare-fun m!189289 () Bool)

(assert (=> b!155330 m!189289))

(declare-fun m!189291 () Bool)

(assert (=> b!155329 m!189291))

(declare-fun m!189293 () Bool)

(assert (=> start!15600 m!189293))

(check-sat (not b!155329) (not b!155332) (not mapNonEmpty!5246) b_and!9681 (not start!15600) tp_is_empty!3069 (not b_next!3267) (not b!155333) (not b!155330))
(check-sat b_and!9681 (not b_next!3267))

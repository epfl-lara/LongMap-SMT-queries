; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15614 () Bool)

(assert start!15614)

(declare-fun b!155525 () Bool)

(declare-fun b_free!3281 () Bool)

(declare-fun b_next!3281 () Bool)

(assert (=> b!155525 (= b_free!3281 (not b_next!3281))))

(declare-fun tp!12368 () Bool)

(declare-fun b_and!9695 () Bool)

(assert (=> b!155525 (= tp!12368 b_and!9695)))

(declare-fun b!155517 () Bool)

(declare-fun res!73456 () Bool)

(declare-fun e!101605 () Bool)

(assert (=> b!155517 (=> (not res!73456) (not e!101605))))

(declare-datatypes ((V!3757 0))(
  ( (V!3758 (val!1586 Int)) )
))
(declare-datatypes ((ValueCell!1198 0))(
  ( (ValueCellFull!1198 (v!3451 V!3757)) (EmptyCell!1198) )
))
(declare-datatypes ((array!5219 0))(
  ( (array!5220 (arr!2467 (Array (_ BitVec 32) (_ BitVec 64))) (size!2745 (_ BitVec 32))) )
))
(declare-datatypes ((array!5221 0))(
  ( (array!5222 (arr!2468 (Array (_ BitVec 32) ValueCell!1198)) (size!2746 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1304 0))(
  ( (LongMapFixedSize!1305 (defaultEntry!3094 Int) (mask!7519 (_ BitVec 32)) (extraKeys!2835 (_ BitVec 32)) (zeroValue!2937 V!3757) (minValue!2937 V!3757) (_size!701 (_ BitVec 32)) (_keys!4869 array!5219) (_values!3077 array!5221) (_vacant!701 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1304)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5219 (_ BitVec 32)) Bool)

(assert (=> b!155517 (= res!73456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4869 thiss!1248) (mask!7519 thiss!1248)))))

(declare-fun b!155518 () Bool)

(declare-fun res!73458 () Bool)

(assert (=> b!155518 (=> (not res!73458) (not e!101605))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155518 (= res!73458 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!73459 () Bool)

(assert (=> start!15614 (=> (not res!73459) (not e!101605))))

(declare-fun valid!640 (LongMapFixedSize!1304) Bool)

(assert (=> start!15614 (= res!73459 (valid!640 thiss!1248))))

(assert (=> start!15614 e!101605))

(declare-fun e!101604 () Bool)

(assert (=> start!15614 e!101604))

(assert (=> start!15614 true))

(declare-fun b!155519 () Bool)

(declare-fun e!101602 () Bool)

(declare-fun tp_is_empty!3083 () Bool)

(assert (=> b!155519 (= e!101602 tp_is_empty!3083)))

(declare-fun mapNonEmpty!5267 () Bool)

(declare-fun mapRes!5267 () Bool)

(declare-fun tp!12367 () Bool)

(assert (=> mapNonEmpty!5267 (= mapRes!5267 (and tp!12367 e!101602))))

(declare-fun mapKey!5267 () (_ BitVec 32))

(declare-fun mapRest!5267 () (Array (_ BitVec 32) ValueCell!1198))

(declare-fun mapValue!5267 () ValueCell!1198)

(assert (=> mapNonEmpty!5267 (= (arr!2468 (_values!3077 thiss!1248)) (store mapRest!5267 mapKey!5267 mapValue!5267))))

(declare-fun b!155520 () Bool)

(declare-fun res!73457 () Bool)

(assert (=> b!155520 (=> (not res!73457) (not e!101605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155520 (= res!73457 (validMask!0 (mask!7519 thiss!1248)))))

(declare-fun b!155521 () Bool)

(assert (=> b!155521 (= e!101605 false)))

(declare-fun lt!81373 () Bool)

(declare-datatypes ((List!1828 0))(
  ( (Nil!1825) (Cons!1824 (h!2433 (_ BitVec 64)) (t!6630 List!1828)) )
))
(declare-fun arrayNoDuplicates!0 (array!5219 (_ BitVec 32) List!1828) Bool)

(assert (=> b!155521 (= lt!81373 (arrayNoDuplicates!0 (_keys!4869 thiss!1248) #b00000000000000000000000000000000 Nil!1825))))

(declare-fun b!155522 () Bool)

(declare-fun e!101607 () Bool)

(assert (=> b!155522 (= e!101607 tp_is_empty!3083)))

(declare-fun b!155523 () Bool)

(declare-fun res!73455 () Bool)

(assert (=> b!155523 (=> (not res!73455) (not e!101605))))

(assert (=> b!155523 (= res!73455 (and (= (size!2746 (_values!3077 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7519 thiss!1248))) (= (size!2745 (_keys!4869 thiss!1248)) (size!2746 (_values!3077 thiss!1248))) (bvsge (mask!7519 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2835 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2835 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2835 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2835 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2835 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2835 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2835 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5267 () Bool)

(assert (=> mapIsEmpty!5267 mapRes!5267))

(declare-fun b!155524 () Bool)

(declare-fun e!101603 () Bool)

(assert (=> b!155524 (= e!101603 (and e!101607 mapRes!5267))))

(declare-fun condMapEmpty!5267 () Bool)

(declare-fun mapDefault!5267 () ValueCell!1198)


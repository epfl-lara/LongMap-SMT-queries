; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15604 () Bool)

(assert start!15604)

(declare-fun b!155385 () Bool)

(declare-fun b_free!3271 () Bool)

(declare-fun b_next!3271 () Bool)

(assert (=> b!155385 (= b_free!3271 (not b_next!3271))))

(declare-fun tp!12337 () Bool)

(declare-fun b_and!9685 () Bool)

(assert (=> b!155385 (= tp!12337 b_and!9685)))

(declare-fun b!155382 () Bool)

(declare-fun res!73382 () Bool)

(declare-fun e!101513 () Bool)

(assert (=> b!155382 (=> (not res!73382) (not e!101513))))

(declare-datatypes ((V!3745 0))(
  ( (V!3746 (val!1581 Int)) )
))
(declare-datatypes ((ValueCell!1193 0))(
  ( (ValueCellFull!1193 (v!3446 V!3745)) (EmptyCell!1193) )
))
(declare-datatypes ((array!5199 0))(
  ( (array!5200 (arr!2457 (Array (_ BitVec 32) (_ BitVec 64))) (size!2735 (_ BitVec 32))) )
))
(declare-datatypes ((array!5201 0))(
  ( (array!5202 (arr!2458 (Array (_ BitVec 32) ValueCell!1193)) (size!2736 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1294 0))(
  ( (LongMapFixedSize!1295 (defaultEntry!3089 Int) (mask!7512 (_ BitVec 32)) (extraKeys!2830 (_ BitVec 32)) (zeroValue!2932 V!3745) (minValue!2932 V!3745) (_size!696 (_ BitVec 32)) (_keys!4864 array!5199) (_values!3072 array!5201) (_vacant!696 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1294)

(assert (=> b!155382 (= res!73382 (and (= (size!2736 (_values!3072 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7512 thiss!1248))) (= (size!2735 (_keys!4864 thiss!1248)) (size!2736 (_values!3072 thiss!1248))) (bvsge (mask!7512 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2830 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2830 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2830 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2830 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155383 () Bool)

(assert (=> b!155383 (= e!101513 false)))

(declare-fun lt!81358 () Bool)

(declare-datatypes ((List!1824 0))(
  ( (Nil!1821) (Cons!1820 (h!2429 (_ BitVec 64)) (t!6626 List!1824)) )
))
(declare-fun arrayNoDuplicates!0 (array!5199 (_ BitVec 32) List!1824) Bool)

(assert (=> b!155383 (= lt!81358 (arrayNoDuplicates!0 (_keys!4864 thiss!1248) #b00000000000000000000000000000000 Nil!1821))))

(declare-fun mapIsEmpty!5252 () Bool)

(declare-fun mapRes!5252 () Bool)

(assert (=> mapIsEmpty!5252 mapRes!5252))

(declare-fun res!73381 () Bool)

(assert (=> start!15604 (=> (not res!73381) (not e!101513))))

(declare-fun valid!636 (LongMapFixedSize!1294) Bool)

(assert (=> start!15604 (= res!73381 (valid!636 thiss!1248))))

(assert (=> start!15604 e!101513))

(declare-fun e!101517 () Bool)

(assert (=> start!15604 e!101517))

(assert (=> start!15604 true))

(declare-fun b!155384 () Bool)

(declare-fun res!73384 () Bool)

(assert (=> b!155384 (=> (not res!73384) (not e!101513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155384 (= res!73384 (validMask!0 (mask!7512 thiss!1248)))))

(declare-fun mapNonEmpty!5252 () Bool)

(declare-fun tp!12338 () Bool)

(declare-fun e!101515 () Bool)

(assert (=> mapNonEmpty!5252 (= mapRes!5252 (and tp!12338 e!101515))))

(declare-fun mapRest!5252 () (Array (_ BitVec 32) ValueCell!1193))

(declare-fun mapKey!5252 () (_ BitVec 32))

(declare-fun mapValue!5252 () ValueCell!1193)

(assert (=> mapNonEmpty!5252 (= (arr!2458 (_values!3072 thiss!1248)) (store mapRest!5252 mapKey!5252 mapValue!5252))))

(declare-fun e!101516 () Bool)

(declare-fun tp_is_empty!3073 () Bool)

(declare-fun array_inv!1551 (array!5199) Bool)

(declare-fun array_inv!1552 (array!5201) Bool)

(assert (=> b!155385 (= e!101517 (and tp!12337 tp_is_empty!3073 (array_inv!1551 (_keys!4864 thiss!1248)) (array_inv!1552 (_values!3072 thiss!1248)) e!101516))))

(declare-fun b!155386 () Bool)

(assert (=> b!155386 (= e!101515 tp_is_empty!3073)))

(declare-fun b!155387 () Bool)

(declare-fun res!73380 () Bool)

(assert (=> b!155387 (=> (not res!73380) (not e!101513))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155387 (= res!73380 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155388 () Bool)

(declare-fun e!101512 () Bool)

(assert (=> b!155388 (= e!101516 (and e!101512 mapRes!5252))))

(declare-fun condMapEmpty!5252 () Bool)

(declare-fun mapDefault!5252 () ValueCell!1193)


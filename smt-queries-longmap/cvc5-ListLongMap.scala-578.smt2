; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15610 () Bool)

(assert start!15610)

(declare-fun b!155470 () Bool)

(declare-fun b_free!3277 () Bool)

(declare-fun b_next!3277 () Bool)

(assert (=> b!155470 (= b_free!3277 (not b_next!3277))))

(declare-fun tp!12355 () Bool)

(declare-fun b_and!9691 () Bool)

(assert (=> b!155470 (= tp!12355 b_and!9691)))

(declare-fun b!155463 () Bool)

(declare-fun e!101566 () Bool)

(declare-fun tp_is_empty!3079 () Bool)

(assert (=> b!155463 (= e!101566 tp_is_empty!3079)))

(declare-fun b!155464 () Bool)

(declare-fun e!101571 () Bool)

(assert (=> b!155464 (= e!101571 false)))

(declare-fun lt!81367 () Bool)

(declare-datatypes ((V!3753 0))(
  ( (V!3754 (val!1584 Int)) )
))
(declare-datatypes ((ValueCell!1196 0))(
  ( (ValueCellFull!1196 (v!3449 V!3753)) (EmptyCell!1196) )
))
(declare-datatypes ((array!5211 0))(
  ( (array!5212 (arr!2463 (Array (_ BitVec 32) (_ BitVec 64))) (size!2741 (_ BitVec 32))) )
))
(declare-datatypes ((array!5213 0))(
  ( (array!5214 (arr!2464 (Array (_ BitVec 32) ValueCell!1196)) (size!2742 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1300 0))(
  ( (LongMapFixedSize!1301 (defaultEntry!3092 Int) (mask!7517 (_ BitVec 32)) (extraKeys!2833 (_ BitVec 32)) (zeroValue!2935 V!3753) (minValue!2935 V!3753) (_size!699 (_ BitVec 32)) (_keys!4867 array!5211) (_values!3075 array!5213) (_vacant!699 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1300)

(declare-datatypes ((List!1826 0))(
  ( (Nil!1823) (Cons!1822 (h!2431 (_ BitVec 64)) (t!6628 List!1826)) )
))
(declare-fun arrayNoDuplicates!0 (array!5211 (_ BitVec 32) List!1826) Bool)

(assert (=> b!155464 (= lt!81367 (arrayNoDuplicates!0 (_keys!4867 thiss!1248) #b00000000000000000000000000000000 Nil!1823))))

(declare-fun b!155465 () Bool)

(declare-fun res!73429 () Bool)

(assert (=> b!155465 (=> (not res!73429) (not e!101571))))

(assert (=> b!155465 (= res!73429 (and (= (size!2742 (_values!3075 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7517 thiss!1248))) (= (size!2741 (_keys!4867 thiss!1248)) (size!2742 (_values!3075 thiss!1248))) (bvsge (mask!7517 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2833 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2833 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2833 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155466 () Bool)

(declare-fun res!73427 () Bool)

(assert (=> b!155466 (=> (not res!73427) (not e!101571))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155466 (= res!73427 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155467 () Bool)

(declare-fun e!101570 () Bool)

(assert (=> b!155467 (= e!101570 tp_is_empty!3079)))

(declare-fun mapIsEmpty!5261 () Bool)

(declare-fun mapRes!5261 () Bool)

(assert (=> mapIsEmpty!5261 mapRes!5261))

(declare-fun res!73425 () Bool)

(assert (=> start!15610 (=> (not res!73425) (not e!101571))))

(declare-fun valid!638 (LongMapFixedSize!1300) Bool)

(assert (=> start!15610 (= res!73425 (valid!638 thiss!1248))))

(assert (=> start!15610 e!101571))

(declare-fun e!101569 () Bool)

(assert (=> start!15610 e!101569))

(assert (=> start!15610 true))

(declare-fun b!155468 () Bool)

(declare-fun e!101568 () Bool)

(assert (=> b!155468 (= e!101568 (and e!101570 mapRes!5261))))

(declare-fun condMapEmpty!5261 () Bool)

(declare-fun mapDefault!5261 () ValueCell!1196)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15634 () Bool)

(assert start!15634)

(declare-fun b!155785 () Bool)

(declare-fun b_free!3301 () Bool)

(declare-fun b_next!3301 () Bool)

(assert (=> b!155785 (= b_free!3301 (not b_next!3301))))

(declare-fun tp!12428 () Bool)

(declare-fun b_and!9715 () Bool)

(assert (=> b!155785 (= tp!12428 b_and!9715)))

(declare-fun b!155781 () Bool)

(declare-fun e!101784 () Bool)

(assert (=> b!155781 (= e!101784 (not true))))

(declare-fun lt!81405 () Bool)

(declare-datatypes ((V!3785 0))(
  ( (V!3786 (val!1596 Int)) )
))
(declare-datatypes ((ValueCell!1208 0))(
  ( (ValueCellFull!1208 (v!3461 V!3785)) (EmptyCell!1208) )
))
(declare-datatypes ((array!5259 0))(
  ( (array!5260 (arr!2487 (Array (_ BitVec 32) (_ BitVec 64))) (size!2765 (_ BitVec 32))) )
))
(declare-datatypes ((array!5261 0))(
  ( (array!5262 (arr!2488 (Array (_ BitVec 32) ValueCell!1208)) (size!2766 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1324 0))(
  ( (LongMapFixedSize!1325 (defaultEntry!3104 Int) (mask!7537 (_ BitVec 32)) (extraKeys!2845 (_ BitVec 32)) (zeroValue!2947 V!3785) (minValue!2947 V!3785) (_size!711 (_ BitVec 32)) (_keys!4879 array!5259) (_values!3087 array!5261) (_vacant!711 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1324)

(declare-fun v!309 () V!3785)

(declare-fun valid!647 (LongMapFixedSize!1324) Bool)

(assert (=> b!155781 (= lt!81405 (valid!647 (LongMapFixedSize!1325 (defaultEntry!3104 thiss!1248) (mask!7537 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2947 thiss!1248) (_size!711 thiss!1248) (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (_vacant!711 thiss!1248))))))

(declare-datatypes ((tuple2!2832 0))(
  ( (tuple2!2833 (_1!1427 (_ BitVec 64)) (_2!1427 V!3785)) )
))
(declare-datatypes ((List!1834 0))(
  ( (Nil!1831) (Cons!1830 (h!2439 tuple2!2832) (t!6636 List!1834)) )
))
(declare-datatypes ((ListLongMap!1819 0))(
  ( (ListLongMap!1820 (toList!925 List!1834)) )
))
(declare-fun +!193 (ListLongMap!1819 tuple2!2832) ListLongMap!1819)

(declare-fun getCurrentListMap!589 (array!5259 array!5261 (_ BitVec 32) (_ BitVec 32) V!3785 V!3785 (_ BitVec 32) Int) ListLongMap!1819)

(assert (=> b!155781 (= (+!193 (getCurrentListMap!589 (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (mask!7537 thiss!1248) (extraKeys!2845 thiss!1248) (zeroValue!2947 thiss!1248) (minValue!2947 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3104 thiss!1248)) (tuple2!2833 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!589 (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (mask!7537 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2947 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3104 thiss!1248)))))

(declare-datatypes ((Unit!4930 0))(
  ( (Unit!4931) )
))
(declare-fun lt!81406 () Unit!4930)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!72 (array!5259 array!5261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3785 V!3785 V!3785 Int) Unit!4930)

(assert (=> b!155781 (= lt!81406 (lemmaChangeZeroKeyThenAddPairToListMap!72 (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (mask!7537 thiss!1248) (extraKeys!2845 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2947 thiss!1248) v!309 (minValue!2947 thiss!1248) (defaultEntry!3104 thiss!1248)))))

(declare-fun mapIsEmpty!5297 () Bool)

(declare-fun mapRes!5297 () Bool)

(assert (=> mapIsEmpty!5297 mapRes!5297))

(declare-fun b!155782 () Bool)

(declare-fun e!101783 () Bool)

(declare-fun e!101782 () Bool)

(assert (=> b!155782 (= e!101783 (and e!101782 mapRes!5297))))

(declare-fun condMapEmpty!5297 () Bool)

(declare-fun mapDefault!5297 () ValueCell!1208)


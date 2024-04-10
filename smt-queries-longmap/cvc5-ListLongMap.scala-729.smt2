; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16966 () Bool)

(assert start!16966)

(declare-fun b!170572 () Bool)

(declare-fun b_free!4213 () Bool)

(declare-fun b_next!4213 () Bool)

(assert (=> b!170572 (= b_free!4213 (not b_next!4213))))

(declare-fun tp!15263 () Bool)

(declare-fun b_and!10627 () Bool)

(assert (=> b!170572 (= tp!15263 b_and!10627)))

(declare-fun b!170569 () Bool)

(declare-fun e!112577 () Bool)

(declare-fun tp_is_empty!3985 () Bool)

(assert (=> b!170569 (= e!112577 tp_is_empty!3985)))

(declare-fun b!170570 () Bool)

(declare-fun e!112573 () Bool)

(declare-datatypes ((V!4961 0))(
  ( (V!4962 (val!2037 Int)) )
))
(declare-datatypes ((ValueCell!1649 0))(
  ( (ValueCellFull!1649 (v!3902 V!4961)) (EmptyCell!1649) )
))
(declare-datatypes ((array!7079 0))(
  ( (array!7080 (arr!3369 (Array (_ BitVec 32) (_ BitVec 64))) (size!3662 (_ BitVec 32))) )
))
(declare-datatypes ((array!7081 0))(
  ( (array!7082 (arr!3370 (Array (_ BitVec 32) ValueCell!1649)) (size!3663 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2206 0))(
  ( (LongMapFixedSize!2207 (defaultEntry!3545 Int) (mask!8363 (_ BitVec 32)) (extraKeys!3286 (_ BitVec 32)) (zeroValue!3388 V!4961) (minValue!3388 V!4961) (_size!1152 (_ BitVec 32)) (_keys!5375 array!7079) (_values!3528 array!7081) (_vacant!1152 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2206)

(assert (=> b!170570 (= e!112573 (and (= (size!3663 (_values!3528 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8363 thiss!1248))) (= (size!3662 (_keys!5375 thiss!1248)) (size!3663 (_values!3528 thiss!1248))) (bvsge (mask!8363 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3286 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3286 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3286 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (= (bvand (bvor (extraKeys!3286 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!170571 () Bool)

(declare-fun res!81080 () Bool)

(assert (=> b!170571 (=> (not res!81080) (not e!112573))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170571 (= res!81080 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!112575 () Bool)

(declare-fun e!112576 () Bool)

(declare-fun array_inv!2153 (array!7079) Bool)

(declare-fun array_inv!2154 (array!7081) Bool)

(assert (=> b!170572 (= e!112575 (and tp!15263 tp_is_empty!3985 (array_inv!2153 (_keys!5375 thiss!1248)) (array_inv!2154 (_values!3528 thiss!1248)) e!112576))))

(declare-fun mapIsEmpty!6764 () Bool)

(declare-fun mapRes!6764 () Bool)

(assert (=> mapIsEmpty!6764 mapRes!6764))

(declare-fun b!170573 () Bool)

(assert (=> b!170573 (= e!112576 (and e!112577 mapRes!6764))))

(declare-fun condMapEmpty!6764 () Bool)

(declare-fun mapDefault!6764 () ValueCell!1649)


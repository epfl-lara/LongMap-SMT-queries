; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16930 () Bool)

(assert start!16930)

(declare-fun b!170292 () Bool)

(declare-fun b_free!4193 () Bool)

(declare-fun b_next!4193 () Bool)

(assert (=> b!170292 (= b_free!4193 (not b_next!4193))))

(declare-fun tp!15199 () Bool)

(declare-fun b_and!10607 () Bool)

(assert (=> b!170292 (= tp!15199 b_and!10607)))

(declare-fun b!170289 () Bool)

(declare-fun e!112354 () Bool)

(declare-datatypes ((V!4933 0))(
  ( (V!4934 (val!2027 Int)) )
))
(declare-datatypes ((ValueCell!1639 0))(
  ( (ValueCellFull!1639 (v!3892 V!4933)) (EmptyCell!1639) )
))
(declare-datatypes ((array!7037 0))(
  ( (array!7038 (arr!3349 (Array (_ BitVec 32) (_ BitVec 64))) (size!3641 (_ BitVec 32))) )
))
(declare-datatypes ((array!7039 0))(
  ( (array!7040 (arr!3350 (Array (_ BitVec 32) ValueCell!1639)) (size!3642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2186 0))(
  ( (LongMapFixedSize!2187 (defaultEntry!3535 Int) (mask!8343 (_ BitVec 32)) (extraKeys!3276 (_ BitVec 32)) (zeroValue!3378 V!4933) (minValue!3378 V!4933) (_size!1142 (_ BitVec 32)) (_keys!5364 array!7037) (_values!3518 array!7039) (_vacant!1142 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2186)

(assert (=> b!170289 (= e!112354 (and (= (size!3642 (_values!3518 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8343 thiss!1248))) (= (size!3641 (_keys!5364 thiss!1248)) (size!3642 (_values!3518 thiss!1248))) (bvsge (mask!8343 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3276 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3276 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!170290 () Bool)

(declare-fun e!112353 () Bool)

(declare-fun tp_is_empty!3965 () Bool)

(assert (=> b!170290 (= e!112353 tp_is_empty!3965)))

(declare-fun mapNonEmpty!6730 () Bool)

(declare-fun mapRes!6730 () Bool)

(declare-fun tp!15198 () Bool)

(assert (=> mapNonEmpty!6730 (= mapRes!6730 (and tp!15198 e!112353))))

(declare-fun mapKey!6730 () (_ BitVec 32))

(declare-fun mapValue!6730 () ValueCell!1639)

(declare-fun mapRest!6730 () (Array (_ BitVec 32) ValueCell!1639))

(assert (=> mapNonEmpty!6730 (= (arr!3350 (_values!3518 thiss!1248)) (store mapRest!6730 mapKey!6730 mapValue!6730))))

(declare-fun b!170291 () Bool)

(declare-fun e!112355 () Bool)

(declare-fun e!112356 () Bool)

(assert (=> b!170291 (= e!112355 (and e!112356 mapRes!6730))))

(declare-fun condMapEmpty!6730 () Bool)

(declare-fun mapDefault!6730 () ValueCell!1639)


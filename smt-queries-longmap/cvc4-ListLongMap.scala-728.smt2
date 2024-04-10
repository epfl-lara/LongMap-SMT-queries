; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16964 () Bool)

(assert start!16964)

(declare-fun b!170553 () Bool)

(declare-fun b_free!4211 () Bool)

(declare-fun b_next!4211 () Bool)

(assert (=> b!170553 (= b_free!4211 (not b_next!4211))))

(declare-fun tp!15257 () Bool)

(declare-fun b_and!10625 () Bool)

(assert (=> b!170553 (= tp!15257 b_and!10625)))

(declare-fun b!170548 () Bool)

(declare-fun res!81070 () Bool)

(declare-fun e!112556 () Bool)

(assert (=> b!170548 (=> (not res!81070) (not e!112556))))

(declare-datatypes ((V!4957 0))(
  ( (V!4958 (val!2036 Int)) )
))
(declare-datatypes ((ValueCell!1648 0))(
  ( (ValueCellFull!1648 (v!3901 V!4957)) (EmptyCell!1648) )
))
(declare-datatypes ((array!7075 0))(
  ( (array!7076 (arr!3367 (Array (_ BitVec 32) (_ BitVec 64))) (size!3660 (_ BitVec 32))) )
))
(declare-datatypes ((array!7077 0))(
  ( (array!7078 (arr!3368 (Array (_ BitVec 32) ValueCell!1648)) (size!3661 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2204 0))(
  ( (LongMapFixedSize!2205 (defaultEntry!3544 Int) (mask!8360 (_ BitVec 32)) (extraKeys!3285 (_ BitVec 32)) (zeroValue!3387 V!4957) (minValue!3387 V!4957) (_size!1151 (_ BitVec 32)) (_keys!5374 array!7075) (_values!3527 array!7077) (_vacant!1151 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2204)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170548 (= res!81070 (validMask!0 (mask!8360 thiss!1248)))))

(declare-fun b!170549 () Bool)

(assert (=> b!170549 (= e!112556 (and (= (size!3661 (_values!3527 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8360 thiss!1248))) (= (size!3660 (_keys!5374 thiss!1248)) (size!3661 (_values!3527 thiss!1248))) (bvsge (mask!8360 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3285 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3285 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3285 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3285 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3285 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3285 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))))

(declare-fun b!170550 () Bool)

(declare-fun e!112555 () Bool)

(declare-fun e!112560 () Bool)

(declare-fun mapRes!6761 () Bool)

(assert (=> b!170550 (= e!112555 (and e!112560 mapRes!6761))))

(declare-fun condMapEmpty!6761 () Bool)

(declare-fun mapDefault!6761 () ValueCell!1648)


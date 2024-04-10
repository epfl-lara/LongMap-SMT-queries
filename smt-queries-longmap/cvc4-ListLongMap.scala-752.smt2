; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17648 () Bool)

(assert start!17648)

(declare-fun b!176438 () Bool)

(declare-fun b_free!4355 () Bool)

(declare-fun b_next!4355 () Bool)

(assert (=> b!176438 (= b_free!4355 (not b_next!4355))))

(declare-fun tp!15756 () Bool)

(declare-fun b_and!10849 () Bool)

(assert (=> b!176438 (= tp!15756 b_and!10849)))

(declare-fun b!176435 () Bool)

(declare-fun res!83613 () Bool)

(declare-fun e!116408 () Bool)

(assert (=> b!176435 (=> (not res!83613) (not e!116408))))

(declare-datatypes ((V!5149 0))(
  ( (V!5150 (val!2108 Int)) )
))
(declare-datatypes ((ValueCell!1720 0))(
  ( (ValueCellFull!1720 (v!3985 V!5149)) (EmptyCell!1720) )
))
(declare-datatypes ((array!7399 0))(
  ( (array!7400 (arr!3511 (Array (_ BitVec 32) (_ BitVec 64))) (size!3815 (_ BitVec 32))) )
))
(declare-datatypes ((array!7401 0))(
  ( (array!7402 (arr!3512 (Array (_ BitVec 32) ValueCell!1720)) (size!3816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2348 0))(
  ( (LongMapFixedSize!2349 (defaultEntry!3634 Int) (mask!8551 (_ BitVec 32)) (extraKeys!3371 (_ BitVec 32)) (zeroValue!3475 V!5149) (minValue!3475 V!5149) (_size!1223 (_ BitVec 32)) (_keys!5495 array!7399) (_values!3617 array!7401) (_vacant!1223 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2348)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3280 0))(
  ( (tuple2!3281 (_1!1651 (_ BitVec 64)) (_2!1651 V!5149)) )
))
(declare-datatypes ((List!2233 0))(
  ( (Nil!2230) (Cons!2229 (h!2850 tuple2!3280) (t!7057 List!2233)) )
))
(declare-datatypes ((ListLongMap!2207 0))(
  ( (ListLongMap!2208 (toList!1119 List!2233)) )
))
(declare-fun contains!1183 (ListLongMap!2207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!771 (array!7399 array!7401 (_ BitVec 32) (_ BitVec 32) V!5149 V!5149 (_ BitVec 32) Int) ListLongMap!2207)

(assert (=> b!176435 (= res!83613 (contains!1183 (getCurrentListMap!771 (_keys!5495 thiss!1248) (_values!3617 thiss!1248) (mask!8551 thiss!1248) (extraKeys!3371 thiss!1248) (zeroValue!3475 thiss!1248) (minValue!3475 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3634 thiss!1248)) key!828))))

(declare-fun b!176436 () Bool)

(declare-fun e!116406 () Bool)

(declare-fun e!116407 () Bool)

(declare-fun mapRes!7044 () Bool)

(assert (=> b!176436 (= e!116406 (and e!116407 mapRes!7044))))

(declare-fun condMapEmpty!7044 () Bool)

(declare-fun mapDefault!7044 () ValueCell!1720)


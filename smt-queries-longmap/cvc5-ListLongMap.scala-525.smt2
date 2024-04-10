; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13140 () Bool)

(assert start!13140)

(declare-fun b!115361 () Bool)

(declare-fun b_free!2689 () Bool)

(declare-fun b_next!2689 () Bool)

(assert (=> b!115361 (= b_free!2689 (not b_next!2689))))

(declare-fun tp!10431 () Bool)

(declare-fun b_and!7159 () Bool)

(assert (=> b!115361 (= tp!10431 b_and!7159)))

(declare-fun b!115357 () Bool)

(declare-fun b_free!2691 () Bool)

(declare-fun b_next!2691 () Bool)

(assert (=> b!115357 (= b_free!2691 (not b_next!2691))))

(declare-fun tp!10429 () Bool)

(declare-fun b_and!7161 () Bool)

(assert (=> b!115357 (= tp!10429 b_and!7161)))

(declare-fun mapNonEmpty!4215 () Bool)

(declare-fun mapRes!4216 () Bool)

(declare-fun tp!10430 () Bool)

(declare-fun e!75199 () Bool)

(assert (=> mapNonEmpty!4215 (= mapRes!4216 (and tp!10430 e!75199))))

(declare-datatypes ((V!3329 0))(
  ( (V!3330 (val!1425 Int)) )
))
(declare-datatypes ((array!4525 0))(
  ( (array!4526 (arr!2145 (Array (_ BitVec 32) (_ BitVec 64))) (size!2405 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1037 0))(
  ( (ValueCellFull!1037 (v!3019 V!3329)) (EmptyCell!1037) )
))
(declare-datatypes ((array!4527 0))(
  ( (array!4528 (arr!2146 (Array (_ BitVec 32) ValueCell!1037)) (size!2406 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!982 0))(
  ( (LongMapFixedSize!983 (defaultEntry!2700 Int) (mask!6906 (_ BitVec 32)) (extraKeys!2489 (_ BitVec 32)) (zeroValue!2567 V!3329) (minValue!2567 V!3329) (_size!540 (_ BitVec 32)) (_keys!4422 array!4525) (_values!2683 array!4527) (_vacant!540 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!782 0))(
  ( (Cell!783 (v!3020 LongMapFixedSize!982)) )
))
(declare-datatypes ((LongMap!782 0))(
  ( (LongMap!783 (underlying!402 Cell!782)) )
))
(declare-fun thiss!992 () LongMap!782)

(declare-fun mapValue!4215 () ValueCell!1037)

(declare-fun mapKey!4216 () (_ BitVec 32))

(declare-fun mapRest!4216 () (Array (_ BitVec 32) ValueCell!1037))

(assert (=> mapNonEmpty!4215 (= (arr!2146 (_values!2683 (v!3020 (underlying!402 thiss!992)))) (store mapRest!4216 mapKey!4216 mapValue!4215))))

(declare-fun b!115354 () Bool)

(declare-fun e!75207 () Bool)

(declare-fun e!75198 () Bool)

(assert (=> b!115354 (= e!75207 e!75198)))

(declare-fun b!115355 () Bool)

(declare-fun e!75206 () Bool)

(declare-fun e!75205 () Bool)

(declare-fun mapRes!4215 () Bool)

(assert (=> b!115355 (= e!75206 (and e!75205 mapRes!4215))))

(declare-fun condMapEmpty!4215 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!982)

(declare-fun mapDefault!4216 () ValueCell!1037)


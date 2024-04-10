; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22936 () Bool)

(assert start!22936)

(declare-fun b!239557 () Bool)

(declare-fun b_free!6439 () Bool)

(declare-fun b_next!6439 () Bool)

(assert (=> b!239557 (= b_free!6439 (not b_next!6439))))

(declare-fun tp!22521 () Bool)

(declare-fun b_and!13405 () Bool)

(assert (=> b!239557 (= tp!22521 b_and!13405)))

(declare-fun b!239540 () Bool)

(declare-fun e!155536 () Bool)

(declare-fun e!155538 () Bool)

(declare-fun mapRes!10683 () Bool)

(assert (=> b!239540 (= e!155536 (and e!155538 mapRes!10683))))

(declare-fun condMapEmpty!10683 () Bool)

(declare-datatypes ((V!8049 0))(
  ( (V!8050 (val!3195 Int)) )
))
(declare-datatypes ((ValueCell!2807 0))(
  ( (ValueCellFull!2807 (v!5233 V!8049)) (EmptyCell!2807) )
))
(declare-datatypes ((array!11881 0))(
  ( (array!11882 (arr!5642 (Array (_ BitVec 32) ValueCell!2807)) (size!5983 (_ BitVec 32))) )
))
(declare-datatypes ((array!11883 0))(
  ( (array!11884 (arr!5643 (Array (_ BitVec 32) (_ BitVec 64))) (size!5984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3514 0))(
  ( (LongMapFixedSize!3515 (defaultEntry!4442 Int) (mask!10490 (_ BitVec 32)) (extraKeys!4179 (_ BitVec 32)) (zeroValue!4283 V!8049) (minValue!4283 V!8049) (_size!1806 (_ BitVec 32)) (_keys!6544 array!11883) (_values!4425 array!11881) (_vacant!1806 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3514)

(declare-fun mapDefault!10683 () ValueCell!2807)


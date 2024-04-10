; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3202 () Bool)

(assert start!3202)

(declare-fun b!19482 () Bool)

(declare-fun b_free!679 () Bool)

(declare-fun b_next!679 () Bool)

(assert (=> b!19482 (= b_free!679 (not b_next!679))))

(declare-fun tp!3250 () Bool)

(declare-fun b_and!1339 () Bool)

(assert (=> b!19482 (= tp!3250 b_and!1339)))

(declare-fun b!19479 () Bool)

(declare-fun e!12585 () Bool)

(declare-datatypes ((V!1083 0))(
  ( (V!1084 (val!498 Int)) )
))
(declare-datatypes ((ValueCell!272 0))(
  ( (ValueCellFull!272 (v!1512 V!1083)) (EmptyCell!272) )
))
(declare-datatypes ((array!1101 0))(
  ( (array!1102 (arr!527 (Array (_ BitVec 32) ValueCell!272)) (size!620 (_ BitVec 32))) )
))
(declare-datatypes ((array!1103 0))(
  ( (array!1104 (arr!528 (Array (_ BitVec 32) (_ BitVec 64))) (size!621 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!130 0))(
  ( (LongMapFixedSize!131 (defaultEntry!1684 Int) (mask!4635 (_ BitVec 32)) (extraKeys!1594 (_ BitVec 32)) (zeroValue!1618 V!1083) (minValue!1618 V!1083) (_size!98 (_ BitVec 32)) (_keys!3112 array!1103) (_values!1680 array!1101) (_vacant!98 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!130 0))(
  ( (Cell!131 (v!1513 LongMapFixedSize!130)) )
))
(declare-datatypes ((LongMap!130 0))(
  ( (LongMap!131 (underlying!76 Cell!130)) )
))
(declare-fun thiss!938 () LongMap!130)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-fun computeNewMask!4 (LongMap!130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19479 (= e!12585 (not (validMask!0 (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))))))))

(declare-fun b!19480 () Bool)

(declare-fun e!12582 () Bool)

(declare-fun e!12587 () Bool)

(assert (=> b!19480 (= e!12582 e!12587)))

(declare-fun b!19481 () Bool)

(declare-fun e!12583 () Bool)

(declare-fun tp_is_empty!943 () Bool)

(assert (=> b!19481 (= e!12583 tp_is_empty!943)))

(declare-fun e!12586 () Bool)

(declare-fun array_inv!357 (array!1103) Bool)

(declare-fun array_inv!358 (array!1101) Bool)

(assert (=> b!19482 (= e!12587 (and tp!3250 tp_is_empty!943 (array_inv!357 (_keys!3112 (v!1513 (underlying!76 thiss!938)))) (array_inv!358 (_values!1680 (v!1513 (underlying!76 thiss!938)))) e!12586))))

(declare-fun b!19483 () Bool)

(declare-fun e!12581 () Bool)

(assert (=> b!19483 (= e!12581 e!12582)))

(declare-fun res!13210 () Bool)

(assert (=> start!3202 (=> (not res!13210) (not e!12585))))

(declare-fun valid!60 (LongMap!130) Bool)

(assert (=> start!3202 (= res!13210 (valid!60 thiss!938))))

(assert (=> start!3202 e!12585))

(assert (=> start!3202 e!12581))

(declare-fun b!19484 () Bool)

(declare-fun e!12580 () Bool)

(declare-fun mapRes!871 () Bool)

(assert (=> b!19484 (= e!12586 (and e!12580 mapRes!871))))

(declare-fun condMapEmpty!871 () Bool)

(declare-fun mapDefault!871 () ValueCell!272)


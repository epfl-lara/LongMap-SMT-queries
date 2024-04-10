; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3218 () Bool)

(assert start!3218)

(declare-fun b!19567 () Bool)

(declare-fun b_free!685 () Bool)

(declare-fun b_next!685 () Bool)

(assert (=> b!19567 (= b_free!685 (not b_next!685))))

(declare-fun tp!3271 () Bool)

(declare-fun b_and!1345 () Bool)

(assert (=> b!19567 (= tp!3271 b_and!1345)))

(declare-fun b!19561 () Bool)

(declare-fun e!12674 () Bool)

(declare-fun tp_is_empty!949 () Bool)

(assert (=> b!19561 (= e!12674 tp_is_empty!949)))

(declare-fun b!19562 () Bool)

(declare-fun e!12669 () Bool)

(assert (=> b!19562 (= e!12669 tp_is_empty!949)))

(declare-fun res!13224 () Bool)

(declare-fun e!12670 () Bool)

(assert (=> start!3218 (=> (not res!13224) (not e!12670))))

(declare-datatypes ((V!1091 0))(
  ( (V!1092 (val!501 Int)) )
))
(declare-datatypes ((ValueCell!275 0))(
  ( (ValueCellFull!275 (v!1518 V!1091)) (EmptyCell!275) )
))
(declare-datatypes ((array!1115 0))(
  ( (array!1116 (arr!533 (Array (_ BitVec 32) ValueCell!275)) (size!626 (_ BitVec 32))) )
))
(declare-datatypes ((array!1117 0))(
  ( (array!1118 (arr!534 (Array (_ BitVec 32) (_ BitVec 64))) (size!627 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!136 0))(
  ( (LongMapFixedSize!137 (defaultEntry!1687 Int) (mask!4641 (_ BitVec 32)) (extraKeys!1597 (_ BitVec 32)) (zeroValue!1621 V!1091) (minValue!1621 V!1091) (_size!102 (_ BitVec 32)) (_keys!3115 array!1117) (_values!1683 array!1115) (_vacant!102 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!136 0))(
  ( (Cell!137 (v!1519 LongMapFixedSize!136)) )
))
(declare-datatypes ((LongMap!136 0))(
  ( (LongMap!137 (underlying!79 Cell!136)) )
))
(declare-fun thiss!938 () LongMap!136)

(declare-fun valid!64 (LongMap!136) Bool)

(assert (=> start!3218 (= res!13224 (valid!64 thiss!938))))

(assert (=> start!3218 e!12670))

(declare-fun e!12668 () Bool)

(assert (=> start!3218 e!12668))

(declare-fun mapNonEmpty!883 () Bool)

(declare-fun mapRes!883 () Bool)

(declare-fun tp!3270 () Bool)

(assert (=> mapNonEmpty!883 (= mapRes!883 (and tp!3270 e!12674))))

(declare-fun mapValue!883 () ValueCell!275)

(declare-fun mapKey!883 () (_ BitVec 32))

(declare-fun mapRest!883 () (Array (_ BitVec 32) ValueCell!275))

(assert (=> mapNonEmpty!883 (= (arr!533 (_values!1683 (v!1519 (underlying!79 thiss!938)))) (store mapRest!883 mapKey!883 mapValue!883))))

(declare-fun b!19563 () Bool)

(declare-fun e!12667 () Bool)

(assert (=> b!19563 (= e!12667 (and e!12669 mapRes!883))))

(declare-fun condMapEmpty!883 () Bool)

(declare-fun mapDefault!883 () ValueCell!275)


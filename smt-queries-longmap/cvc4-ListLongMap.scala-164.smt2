; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3134 () Bool)

(assert start!3134)

(declare-fun b!19103 () Bool)

(declare-fun b_free!665 () Bool)

(declare-fun b_next!665 () Bool)

(assert (=> b!19103 (= b_free!665 (not b_next!665))))

(declare-fun tp!3192 () Bool)

(declare-fun b_and!1325 () Bool)

(assert (=> b!19103 (= tp!3192 b_and!1325)))

(declare-fun b!19098 () Bool)

(declare-fun e!12288 () Bool)

(declare-fun e!12289 () Bool)

(declare-fun mapRes!835 () Bool)

(assert (=> b!19098 (= e!12288 (and e!12289 mapRes!835))))

(declare-fun condMapEmpty!835 () Bool)

(declare-datatypes ((V!1063 0))(
  ( (V!1064 (val!491 Int)) )
))
(declare-datatypes ((ValueCell!265 0))(
  ( (ValueCellFull!265 (v!1498 V!1063)) (EmptyCell!265) )
))
(declare-datatypes ((array!1067 0))(
  ( (array!1068 (arr!513 (Array (_ BitVec 32) ValueCell!265)) (size!603 (_ BitVec 32))) )
))
(declare-datatypes ((array!1069 0))(
  ( (array!1070 (arr!514 (Array (_ BitVec 32) (_ BitVec 64))) (size!604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!116 0))(
  ( (LongMapFixedSize!117 (defaultEntry!1677 Int) (mask!4616 (_ BitVec 32)) (extraKeys!1587 (_ BitVec 32)) (zeroValue!1611 V!1063) (minValue!1611 V!1063) (_size!91 (_ BitVec 32)) (_keys!3102 array!1069) (_values!1673 array!1067) (_vacant!91 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!116 0))(
  ( (Cell!117 (v!1499 LongMapFixedSize!116)) )
))
(declare-datatypes ((LongMap!116 0))(
  ( (LongMap!117 (underlying!69 Cell!116)) )
))
(declare-fun thiss!938 () LongMap!116)

(declare-fun mapDefault!835 () ValueCell!265)


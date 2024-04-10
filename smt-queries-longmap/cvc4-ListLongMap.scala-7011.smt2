; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89062 () Bool)

(assert start!89062)

(declare-fun b!1021156 () Bool)

(declare-fun b_free!20123 () Bool)

(declare-fun b_next!20123 () Bool)

(assert (=> b!1021156 (= b_free!20123 (not b_next!20123))))

(declare-fun tp!71397 () Bool)

(declare-fun b_and!32311 () Bool)

(assert (=> b!1021156 (= tp!71397 b_and!32311)))

(declare-fun b!1021150 () Bool)

(declare-fun e!575028 () Bool)

(declare-fun e!575029 () Bool)

(declare-fun mapRes!37176 () Bool)

(assert (=> b!1021150 (= e!575028 (and e!575029 mapRes!37176))))

(declare-fun condMapEmpty!37176 () Bool)

(declare-datatypes ((V!36663 0))(
  ( (V!36664 (val!11972 Int)) )
))
(declare-datatypes ((array!63726 0))(
  ( (array!63727 (arr!30677 (Array (_ BitVec 32) (_ BitVec 64))) (size!31188 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11218 0))(
  ( (ValueCellFull!11218 (v!14531 V!36663)) (EmptyCell!11218) )
))
(declare-datatypes ((array!63728 0))(
  ( (array!63729 (arr!30678 (Array (_ BitVec 32) ValueCell!11218)) (size!31189 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5030 0))(
  ( (LongMapFixedSize!5031 (defaultEntry!5867 Int) (mask!29430 (_ BitVec 32)) (extraKeys!5599 (_ BitVec 32)) (zeroValue!5703 V!36663) (minValue!5703 V!36663) (_size!2570 (_ BitVec 32)) (_keys!11012 array!63726) (_values!5890 array!63728) (_vacant!2570 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1104 0))(
  ( (Cell!1105 (v!14532 LongMapFixedSize!5030)) )
))
(declare-datatypes ((LongMap!1104 0))(
  ( (LongMap!1105 (underlying!563 Cell!1104)) )
))
(declare-fun thiss!908 () LongMap!1104)

(declare-fun mapDefault!37176 () ValueCell!11218)


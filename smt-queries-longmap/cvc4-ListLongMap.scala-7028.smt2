; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89184 () Bool)

(assert start!89184)

(declare-fun b!1022539 () Bool)

(declare-fun b_free!20225 () Bool)

(declare-fun b_next!20225 () Bool)

(assert (=> b!1022539 (= b_free!20225 (not b_next!20225))))

(declare-fun tp!71709 () Bool)

(declare-fun b_and!32433 () Bool)

(assert (=> b!1022539 (= tp!71709 b_and!32433)))

(declare-fun b!1022535 () Bool)

(declare-fun e!576060 () Bool)

(declare-fun e!576063 () Bool)

(declare-fun mapRes!37335 () Bool)

(assert (=> b!1022535 (= e!576060 (and e!576063 mapRes!37335))))

(declare-fun condMapEmpty!37335 () Bool)

(declare-datatypes ((V!36799 0))(
  ( (V!36800 (val!12023 Int)) )
))
(declare-datatypes ((ValueCell!11269 0))(
  ( (ValueCellFull!11269 (v!14592 V!36799)) (EmptyCell!11269) )
))
(declare-datatypes ((array!63934 0))(
  ( (array!63935 (arr!30779 (Array (_ BitVec 32) (_ BitVec 64))) (size!31290 (_ BitVec 32))) )
))
(declare-datatypes ((array!63936 0))(
  ( (array!63937 (arr!30780 (Array (_ BitVec 32) ValueCell!11269)) (size!31291 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5132 0))(
  ( (LongMapFixedSize!5133 (defaultEntry!5918 Int) (mask!29515 (_ BitVec 32)) (extraKeys!5650 (_ BitVec 32)) (zeroValue!5754 V!36799) (minValue!5754 V!36799) (_size!2621 (_ BitVec 32)) (_keys!11063 array!63934) (_values!5941 array!63936) (_vacant!2621 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5132)

(declare-fun mapDefault!37335 () ValueCell!11269)


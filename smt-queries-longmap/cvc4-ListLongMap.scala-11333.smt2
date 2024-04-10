; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131906 () Bool)

(assert start!131906)

(declare-fun b_free!31619 () Bool)

(declare-fun b_next!31619 () Bool)

(assert (=> start!131906 (= b_free!31619 (not b_next!31619))))

(declare-fun tp!111108 () Bool)

(declare-fun b_and!51029 () Bool)

(assert (=> start!131906 (= tp!111108 b_and!51029)))

(declare-fun mapIsEmpty!58546 () Bool)

(declare-fun mapRes!58546 () Bool)

(assert (=> mapIsEmpty!58546 mapRes!58546))

(declare-fun b!1544389 () Bool)

(declare-fun e!859631 () Bool)

(declare-fun tp_is_empty!37895 () Bool)

(assert (=> b!1544389 (= e!859631 tp_is_empty!37895)))

(declare-fun b!1544390 () Bool)

(declare-fun e!859630 () Bool)

(declare-fun e!859627 () Bool)

(assert (=> b!1544390 (= e!859630 (and e!859627 mapRes!58546))))

(declare-fun condMapEmpty!58546 () Bool)

(declare-datatypes ((V!58969 0))(
  ( (V!58970 (val!19025 Int)) )
))
(declare-datatypes ((ValueCell!18037 0))(
  ( (ValueCellFull!18037 (v!21826 V!58969)) (EmptyCell!18037) )
))
(declare-datatypes ((array!103004 0))(
  ( (array!103005 (arr!49704 (Array (_ BitVec 32) ValueCell!18037)) (size!50254 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103004)

(declare-fun mapDefault!58546 () ValueCell!18037)


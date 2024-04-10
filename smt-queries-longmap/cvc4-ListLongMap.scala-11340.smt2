; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131948 () Bool)

(assert start!131948)

(declare-fun b_free!31661 () Bool)

(declare-fun b_next!31661 () Bool)

(assert (=> start!131948 (= b_free!31661 (not b_next!31661))))

(declare-fun tp!111234 () Bool)

(declare-fun b_and!51071 () Bool)

(assert (=> start!131948 (= tp!111234 b_and!51071)))

(declare-fun b!1545305 () Bool)

(declare-fun e!860147 () Bool)

(declare-fun e!860149 () Bool)

(declare-fun mapRes!58609 () Bool)

(assert (=> b!1545305 (= e!860147 (and e!860149 mapRes!58609))))

(declare-fun condMapEmpty!58609 () Bool)

(declare-datatypes ((V!59025 0))(
  ( (V!59026 (val!19046 Int)) )
))
(declare-datatypes ((ValueCell!18058 0))(
  ( (ValueCellFull!18058 (v!21847 V!59025)) (EmptyCell!18058) )
))
(declare-datatypes ((array!103082 0))(
  ( (array!103083 (arr!49743 (Array (_ BitVec 32) ValueCell!18058)) (size!50293 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103082)

(declare-fun mapDefault!58609 () ValueCell!18058)


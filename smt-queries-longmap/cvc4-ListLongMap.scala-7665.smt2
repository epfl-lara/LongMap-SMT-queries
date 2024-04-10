; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96314 () Bool)

(assert start!96314)

(declare-fun b!1094529 () Bool)

(declare-fun e!624900 () Bool)

(declare-fun e!624902 () Bool)

(declare-fun mapRes!42208 () Bool)

(assert (=> b!1094529 (= e!624900 (and e!624902 mapRes!42208))))

(declare-fun condMapEmpty!42208 () Bool)

(declare-datatypes ((V!41085 0))(
  ( (V!41086 (val!13541 Int)) )
))
(declare-datatypes ((ValueCell!12775 0))(
  ( (ValueCellFull!12775 (v!16162 V!41085)) (EmptyCell!12775) )
))
(declare-datatypes ((array!70853 0))(
  ( (array!70854 (arr!34100 (Array (_ BitVec 32) ValueCell!12775)) (size!34636 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70853)

(declare-fun mapDefault!42208 () ValueCell!12775)


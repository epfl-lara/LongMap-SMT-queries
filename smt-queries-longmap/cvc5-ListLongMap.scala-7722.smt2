; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97018 () Bool)

(assert start!97018)

(declare-fun b!1103495 () Bool)

(declare-fun e!629928 () Bool)

(declare-fun e!629927 () Bool)

(declare-fun mapRes!42766 () Bool)

(assert (=> b!1103495 (= e!629928 (and e!629927 mapRes!42766))))

(declare-fun condMapEmpty!42766 () Bool)

(declare-datatypes ((V!41537 0))(
  ( (V!41538 (val!13710 Int)) )
))
(declare-datatypes ((ValueCell!12944 0))(
  ( (ValueCellFull!12944 (v!16342 V!41537)) (EmptyCell!12944) )
))
(declare-datatypes ((array!71539 0))(
  ( (array!71540 (arr!34426 (Array (_ BitVec 32) ValueCell!12944)) (size!34962 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71539)

(declare-fun mapDefault!42766 () ValueCell!12944)


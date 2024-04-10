; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97000 () Bool)

(assert start!97000)

(declare-fun b!1103377 () Bool)

(declare-fun res!736114 () Bool)

(declare-fun e!629847 () Bool)

(assert (=> b!1103377 (=> (not res!736114) (not e!629847))))

(declare-datatypes ((array!71525 0))(
  ( (array!71526 (arr!34420 (Array (_ BitVec 32) (_ BitVec 64))) (size!34956 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71525)

(assert (=> b!1103377 (= res!736114 (and (bvsle #b00000000000000000000000000000000 (size!34956 _keys!1208)) (bvslt (size!34956 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103378 () Bool)

(declare-fun e!629851 () Bool)

(declare-fun e!629848 () Bool)

(declare-fun mapRes!42754 () Bool)

(assert (=> b!1103378 (= e!629851 (and e!629848 mapRes!42754))))

(declare-fun condMapEmpty!42754 () Bool)

(declare-datatypes ((V!41529 0))(
  ( (V!41530 (val!13707 Int)) )
))
(declare-datatypes ((ValueCell!12941 0))(
  ( (ValueCellFull!12941 (v!16338 V!41529)) (EmptyCell!12941) )
))
(declare-datatypes ((array!71527 0))(
  ( (array!71528 (arr!34421 (Array (_ BitVec 32) ValueCell!12941)) (size!34957 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71527)

(declare-fun mapDefault!42754 () ValueCell!12941)


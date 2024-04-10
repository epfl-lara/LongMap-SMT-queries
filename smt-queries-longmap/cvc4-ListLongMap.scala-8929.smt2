; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108274 () Bool)

(assert start!108274)

(declare-fun b!1278291 () Bool)

(declare-fun e!730175 () Bool)

(declare-fun e!730176 () Bool)

(declare-fun mapRes!51779 () Bool)

(assert (=> b!1278291 (= e!730175 (and e!730176 mapRes!51779))))

(declare-fun condMapEmpty!51779 () Bool)

(declare-datatypes ((V!49757 0))(
  ( (V!49758 (val!16820 Int)) )
))
(declare-datatypes ((ValueCell!15847 0))(
  ( (ValueCellFull!15847 (v!19419 V!49757)) (EmptyCell!15847) )
))
(declare-datatypes ((array!84074 0))(
  ( (array!84075 (arr!40544 (Array (_ BitVec 32) ValueCell!15847)) (size!41094 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84074)

(declare-fun mapDefault!51779 () ValueCell!15847)


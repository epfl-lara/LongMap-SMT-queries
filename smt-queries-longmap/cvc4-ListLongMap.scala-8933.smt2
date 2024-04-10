; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108328 () Bool)

(assert start!108328)

(declare-fun b!1278623 () Bool)

(declare-fun e!730430 () Bool)

(declare-fun tp_is_empty!33515 () Bool)

(assert (=> b!1278623 (= e!730430 tp_is_empty!33515)))

(declare-fun b!1278624 () Bool)

(declare-fun e!730427 () Bool)

(declare-fun mapRes!51824 () Bool)

(assert (=> b!1278624 (= e!730427 (and e!730430 mapRes!51824))))

(declare-fun condMapEmpty!51824 () Bool)

(declare-datatypes ((V!49789 0))(
  ( (V!49790 (val!16832 Int)) )
))
(declare-datatypes ((ValueCell!15859 0))(
  ( (ValueCellFull!15859 (v!19432 V!49789)) (EmptyCell!15859) )
))
(declare-datatypes ((array!84124 0))(
  ( (array!84125 (arr!40566 (Array (_ BitVec 32) ValueCell!15859)) (size!41116 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84124)

(declare-fun mapDefault!51824 () ValueCell!15859)


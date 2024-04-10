; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108352 () Bool)

(assert start!108352)

(declare-fun b!1278839 () Bool)

(declare-fun e!730606 () Bool)

(declare-fun tp_is_empty!33539 () Bool)

(assert (=> b!1278839 (= e!730606 tp_is_empty!33539)))

(declare-fun b!1278840 () Bool)

(declare-fun e!730610 () Bool)

(declare-fun e!730608 () Bool)

(declare-fun mapRes!51860 () Bool)

(assert (=> b!1278840 (= e!730610 (and e!730608 mapRes!51860))))

(declare-fun condMapEmpty!51860 () Bool)

(declare-datatypes ((V!49821 0))(
  ( (V!49822 (val!16844 Int)) )
))
(declare-datatypes ((ValueCell!15871 0))(
  ( (ValueCellFull!15871 (v!19444 V!49821)) (EmptyCell!15871) )
))
(declare-datatypes ((array!84170 0))(
  ( (array!84171 (arr!40589 (Array (_ BitVec 32) ValueCell!15871)) (size!41139 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84170)

(declare-fun mapDefault!51860 () ValueCell!15871)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108354 () Bool)

(assert start!108354)

(declare-fun b!1278857 () Bool)

(declare-fun e!730621 () Bool)

(declare-fun tp_is_empty!33541 () Bool)

(assert (=> b!1278857 (= e!730621 tp_is_empty!33541)))

(declare-fun mapIsEmpty!51863 () Bool)

(declare-fun mapRes!51863 () Bool)

(assert (=> mapIsEmpty!51863 mapRes!51863))

(declare-fun b!1278858 () Bool)

(declare-fun e!730623 () Bool)

(assert (=> b!1278858 (= e!730623 (and e!730621 mapRes!51863))))

(declare-fun condMapEmpty!51863 () Bool)

(declare-datatypes ((V!49825 0))(
  ( (V!49826 (val!16845 Int)) )
))
(declare-datatypes ((ValueCell!15872 0))(
  ( (ValueCellFull!15872 (v!19445 V!49825)) (EmptyCell!15872) )
))
(declare-datatypes ((array!84172 0))(
  ( (array!84173 (arr!40590 (Array (_ BitVec 32) ValueCell!15872)) (size!41140 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84172)

(declare-fun mapDefault!51863 () ValueCell!15872)


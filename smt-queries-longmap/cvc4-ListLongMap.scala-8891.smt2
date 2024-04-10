; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107968 () Bool)

(assert start!107968)

(declare-fun b!1275516 () Bool)

(declare-fun e!728166 () Bool)

(declare-fun tp_is_empty!33263 () Bool)

(assert (=> b!1275516 (= e!728166 tp_is_empty!33263)))

(declare-fun b!1275517 () Bool)

(declare-fun e!728168 () Bool)

(declare-fun e!728169 () Bool)

(declare-fun mapRes!51416 () Bool)

(assert (=> b!1275517 (= e!728168 (and e!728169 mapRes!51416))))

(declare-fun condMapEmpty!51416 () Bool)

(declare-datatypes ((V!49453 0))(
  ( (V!49454 (val!16706 Int)) )
))
(declare-datatypes ((ValueCell!15733 0))(
  ( (ValueCellFull!15733 (v!19302 V!49453)) (EmptyCell!15733) )
))
(declare-datatypes ((array!83634 0))(
  ( (array!83635 (arr!40331 (Array (_ BitVec 32) ValueCell!15733)) (size!40881 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83634)

(declare-fun mapDefault!51416 () ValueCell!15733)


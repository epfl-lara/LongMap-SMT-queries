; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108330 () Bool)

(assert start!108330)

(declare-fun b!1278641 () Bool)

(declare-fun res!849450 () Bool)

(declare-fun e!730443 () Bool)

(assert (=> b!1278641 (=> (not res!849450) (not e!730443))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49793 0))(
  ( (V!49794 (val!16833 Int)) )
))
(declare-datatypes ((ValueCell!15860 0))(
  ( (ValueCellFull!15860 (v!19433 V!49793)) (EmptyCell!15860) )
))
(declare-datatypes ((array!84126 0))(
  ( (array!84127 (arr!40567 (Array (_ BitVec 32) ValueCell!15860)) (size!41117 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84126)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84128 0))(
  ( (array!84129 (arr!40568 (Array (_ BitVec 32) (_ BitVec 64))) (size!41118 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84128)

(assert (=> b!1278641 (= res!849450 (and (= (size!41117 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41118 _keys!1741) (size!41117 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278642 () Bool)

(declare-fun e!730441 () Bool)

(declare-fun e!730442 () Bool)

(declare-fun mapRes!51827 () Bool)

(assert (=> b!1278642 (= e!730441 (and e!730442 mapRes!51827))))

(declare-fun condMapEmpty!51827 () Bool)

(declare-fun mapDefault!51827 () ValueCell!15860)


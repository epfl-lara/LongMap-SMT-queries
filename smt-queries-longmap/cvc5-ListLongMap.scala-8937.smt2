; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108348 () Bool)

(assert start!108348)

(declare-fun b!1278803 () Bool)

(declare-fun res!849533 () Bool)

(declare-fun e!730578 () Bool)

(assert (=> b!1278803 (=> (not res!849533) (not e!730578))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49817 0))(
  ( (V!49818 (val!16842 Int)) )
))
(declare-datatypes ((ValueCell!15869 0))(
  ( (ValueCellFull!15869 (v!19442 V!49817)) (EmptyCell!15869) )
))
(declare-datatypes ((array!84162 0))(
  ( (array!84163 (arr!40585 (Array (_ BitVec 32) ValueCell!15869)) (size!41135 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84162)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84164 0))(
  ( (array!84165 (arr!40586 (Array (_ BitVec 32) (_ BitVec 64))) (size!41136 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84164)

(assert (=> b!1278803 (= res!849533 (and (= (size!41135 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41136 _keys!1741) (size!41135 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278804 () Bool)

(declare-fun e!730576 () Bool)

(declare-fun e!730579 () Bool)

(declare-fun mapRes!51854 () Bool)

(assert (=> b!1278804 (= e!730576 (and e!730579 mapRes!51854))))

(declare-fun condMapEmpty!51854 () Bool)

(declare-fun mapDefault!51854 () ValueCell!15869)


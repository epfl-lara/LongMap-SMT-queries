; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108334 () Bool)

(assert start!108334)

(declare-fun b!1278677 () Bool)

(declare-fun res!849470 () Bool)

(declare-fun e!730473 () Bool)

(assert (=> b!1278677 (=> (not res!849470) (not e!730473))))

(declare-datatypes ((array!84134 0))(
  ( (array!84135 (arr!40571 (Array (_ BitVec 32) (_ BitVec 64))) (size!41121 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84134)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84134 (_ BitVec 32)) Bool)

(assert (=> b!1278677 (= res!849470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51833 () Bool)

(declare-fun mapRes!51833 () Bool)

(assert (=> mapIsEmpty!51833 mapRes!51833))

(declare-fun res!849469 () Bool)

(assert (=> start!108334 (=> (not res!849469) (not e!730473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108334 (= res!849469 (validMask!0 mask!2175))))

(assert (=> start!108334 e!730473))

(assert (=> start!108334 true))

(declare-datatypes ((V!49797 0))(
  ( (V!49798 (val!16835 Int)) )
))
(declare-datatypes ((ValueCell!15862 0))(
  ( (ValueCellFull!15862 (v!19435 V!49797)) (EmptyCell!15862) )
))
(declare-datatypes ((array!84136 0))(
  ( (array!84137 (arr!40572 (Array (_ BitVec 32) ValueCell!15862)) (size!41122 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84136)

(declare-fun e!730471 () Bool)

(declare-fun array_inv!30813 (array!84136) Bool)

(assert (=> start!108334 (and (array_inv!30813 _values!1445) e!730471)))

(declare-fun array_inv!30814 (array!84134) Bool)

(assert (=> start!108334 (array_inv!30814 _keys!1741)))

(declare-fun mapNonEmpty!51833 () Bool)

(declare-fun tp!98807 () Bool)

(declare-fun e!730472 () Bool)

(assert (=> mapNonEmpty!51833 (= mapRes!51833 (and tp!98807 e!730472))))

(declare-fun mapValue!51833 () ValueCell!15862)

(declare-fun mapKey!51833 () (_ BitVec 32))

(declare-fun mapRest!51833 () (Array (_ BitVec 32) ValueCell!15862))

(assert (=> mapNonEmpty!51833 (= (arr!40572 _values!1445) (store mapRest!51833 mapKey!51833 mapValue!51833))))

(declare-fun b!1278678 () Bool)

(declare-fun res!849468 () Bool)

(assert (=> b!1278678 (=> (not res!849468) (not e!730473))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278678 (= res!849468 (and (= (size!41122 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41121 _keys!1741) (size!41122 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278679 () Bool)

(declare-fun e!730475 () Bool)

(declare-fun tp_is_empty!33521 () Bool)

(assert (=> b!1278679 (= e!730475 tp_is_empty!33521)))

(declare-fun b!1278680 () Bool)

(assert (=> b!1278680 (= e!730471 (and e!730475 mapRes!51833))))

(declare-fun condMapEmpty!51833 () Bool)

(declare-fun mapDefault!51833 () ValueCell!15862)


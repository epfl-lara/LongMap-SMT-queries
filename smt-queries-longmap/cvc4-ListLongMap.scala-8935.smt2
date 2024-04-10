; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108340 () Bool)

(assert start!108340)

(declare-fun b!1278731 () Bool)

(declare-fun e!730517 () Bool)

(declare-fun tp_is_empty!33527 () Bool)

(assert (=> b!1278731 (= e!730517 tp_is_empty!33527)))

(declare-fun mapIsEmpty!51842 () Bool)

(declare-fun mapRes!51842 () Bool)

(assert (=> mapIsEmpty!51842 mapRes!51842))

(declare-fun mapNonEmpty!51842 () Bool)

(declare-fun tp!98816 () Bool)

(declare-fun e!730516 () Bool)

(assert (=> mapNonEmpty!51842 (= mapRes!51842 (and tp!98816 e!730516))))

(declare-fun mapKey!51842 () (_ BitVec 32))

(declare-datatypes ((V!49805 0))(
  ( (V!49806 (val!16838 Int)) )
))
(declare-datatypes ((ValueCell!15865 0))(
  ( (ValueCellFull!15865 (v!19438 V!49805)) (EmptyCell!15865) )
))
(declare-fun mapRest!51842 () (Array (_ BitVec 32) ValueCell!15865))

(declare-datatypes ((array!84146 0))(
  ( (array!84147 (arr!40577 (Array (_ BitVec 32) ValueCell!15865)) (size!41127 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84146)

(declare-fun mapValue!51842 () ValueCell!15865)

(assert (=> mapNonEmpty!51842 (= (arr!40577 _values!1445) (store mapRest!51842 mapKey!51842 mapValue!51842))))

(declare-fun b!1278732 () Bool)

(assert (=> b!1278732 (= e!730516 tp_is_empty!33527)))

(declare-fun b!1278733 () Bool)

(declare-fun e!730518 () Bool)

(assert (=> b!1278733 (= e!730518 false)))

(declare-fun lt!575921 () Bool)

(declare-datatypes ((array!84148 0))(
  ( (array!84149 (arr!40578 (Array (_ BitVec 32) (_ BitVec 64))) (size!41128 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84148)

(declare-datatypes ((List!28748 0))(
  ( (Nil!28745) (Cons!28744 (h!29953 (_ BitVec 64)) (t!42288 List!28748)) )
))
(declare-fun arrayNoDuplicates!0 (array!84148 (_ BitVec 32) List!28748) Bool)

(assert (=> b!1278733 (= lt!575921 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28745))))

(declare-fun b!1278734 () Bool)

(declare-fun res!849495 () Bool)

(assert (=> b!1278734 (=> (not res!849495) (not e!730518))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278734 (= res!849495 (and (= (size!41127 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41128 _keys!1741) (size!41127 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278735 () Bool)

(declare-fun res!849496 () Bool)

(assert (=> b!1278735 (=> (not res!849496) (not e!730518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84148 (_ BitVec 32)) Bool)

(assert (=> b!1278735 (= res!849496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278736 () Bool)

(declare-fun e!730519 () Bool)

(assert (=> b!1278736 (= e!730519 (and e!730517 mapRes!51842))))

(declare-fun condMapEmpty!51842 () Bool)

(declare-fun mapDefault!51842 () ValueCell!15865)


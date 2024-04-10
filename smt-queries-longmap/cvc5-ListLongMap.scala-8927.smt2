; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108244 () Bool)

(assert start!108244)

(declare-fun b!1278133 () Bool)

(declare-fun e!730033 () Bool)

(declare-fun tp_is_empty!33475 () Bool)

(assert (=> b!1278133 (= e!730033 tp_is_empty!33475)))

(declare-fun mapNonEmpty!51749 () Bool)

(declare-fun mapRes!51749 () Bool)

(declare-fun tp!98723 () Bool)

(declare-fun e!730035 () Bool)

(assert (=> mapNonEmpty!51749 (= mapRes!51749 (and tp!98723 e!730035))))

(declare-fun mapKey!51749 () (_ BitVec 32))

(declare-datatypes ((V!49737 0))(
  ( (V!49738 (val!16812 Int)) )
))
(declare-datatypes ((ValueCell!15839 0))(
  ( (ValueCellFull!15839 (v!19411 V!49737)) (EmptyCell!15839) )
))
(declare-fun mapRest!51749 () (Array (_ BitVec 32) ValueCell!15839))

(declare-datatypes ((array!84038 0))(
  ( (array!84039 (arr!40528 (Array (_ BitVec 32) ValueCell!15839)) (size!41078 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84038)

(declare-fun mapValue!51749 () ValueCell!15839)

(assert (=> mapNonEmpty!51749 (= (arr!40528 _values!1445) (store mapRest!51749 mapKey!51749 mapValue!51749))))

(declare-fun res!849195 () Bool)

(declare-fun e!730031 () Bool)

(assert (=> start!108244 (=> (not res!849195) (not e!730031))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108244 (= res!849195 (validMask!0 mask!2175))))

(assert (=> start!108244 e!730031))

(assert (=> start!108244 true))

(declare-fun e!730034 () Bool)

(declare-fun array_inv!30787 (array!84038) Bool)

(assert (=> start!108244 (and (array_inv!30787 _values!1445) e!730034)))

(declare-datatypes ((array!84040 0))(
  ( (array!84041 (arr!40529 (Array (_ BitVec 32) (_ BitVec 64))) (size!41079 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84040)

(declare-fun array_inv!30788 (array!84040) Bool)

(assert (=> start!108244 (array_inv!30788 _keys!1741)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun b!1278134 () Bool)

(assert (=> b!1278134 (= e!730031 (and (= (size!41078 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41079 _keys!1741) (size!41078 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (= (size!41079 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)) (bvsgt #b00000000000000000000000000000000 (size!41079 _keys!1741))))))

(declare-fun b!1278135 () Bool)

(assert (=> b!1278135 (= e!730034 (and e!730033 mapRes!51749))))

(declare-fun condMapEmpty!51749 () Bool)

(declare-fun mapDefault!51749 () ValueCell!15839)


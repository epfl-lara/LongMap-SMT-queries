; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108360 () Bool)

(assert start!108360)

(declare-fun b!1278911 () Bool)

(declare-fun e!730668 () Bool)

(declare-fun tp_is_empty!33547 () Bool)

(assert (=> b!1278911 (= e!730668 tp_is_empty!33547)))

(declare-fun b!1278912 () Bool)

(declare-fun e!730670 () Bool)

(assert (=> b!1278912 (= e!730670 tp_is_empty!33547)))

(declare-fun b!1278913 () Bool)

(declare-fun e!730667 () Bool)

(assert (=> b!1278913 (= e!730667 false)))

(declare-fun lt!575951 () Bool)

(declare-datatypes ((array!84182 0))(
  ( (array!84183 (arr!40595 (Array (_ BitVec 32) (_ BitVec 64))) (size!41145 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84182)

(declare-datatypes ((List!28754 0))(
  ( (Nil!28751) (Cons!28750 (h!29959 (_ BitVec 64)) (t!42294 List!28754)) )
))
(declare-fun arrayNoDuplicates!0 (array!84182 (_ BitVec 32) List!28754) Bool)

(assert (=> b!1278913 (= lt!575951 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28751))))

(declare-fun res!849586 () Bool)

(assert (=> start!108360 (=> (not res!849586) (not e!730667))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108360 (= res!849586 (validMask!0 mask!2175))))

(assert (=> start!108360 e!730667))

(assert (=> start!108360 true))

(declare-datatypes ((V!49833 0))(
  ( (V!49834 (val!16848 Int)) )
))
(declare-datatypes ((ValueCell!15875 0))(
  ( (ValueCellFull!15875 (v!19448 V!49833)) (EmptyCell!15875) )
))
(declare-datatypes ((array!84184 0))(
  ( (array!84185 (arr!40596 (Array (_ BitVec 32) ValueCell!15875)) (size!41146 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84184)

(declare-fun e!730669 () Bool)

(declare-fun array_inv!30825 (array!84184) Bool)

(assert (=> start!108360 (and (array_inv!30825 _values!1445) e!730669)))

(declare-fun array_inv!30826 (array!84182) Bool)

(assert (=> start!108360 (array_inv!30826 _keys!1741)))

(declare-fun b!1278914 () Bool)

(declare-fun res!849585 () Bool)

(assert (=> b!1278914 (=> (not res!849585) (not e!730667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84182 (_ BitVec 32)) Bool)

(assert (=> b!1278914 (= res!849585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51872 () Bool)

(declare-fun mapRes!51872 () Bool)

(assert (=> mapIsEmpty!51872 mapRes!51872))

(declare-fun mapNonEmpty!51872 () Bool)

(declare-fun tp!98846 () Bool)

(assert (=> mapNonEmpty!51872 (= mapRes!51872 (and tp!98846 e!730668))))

(declare-fun mapValue!51872 () ValueCell!15875)

(declare-fun mapKey!51872 () (_ BitVec 32))

(declare-fun mapRest!51872 () (Array (_ BitVec 32) ValueCell!15875))

(assert (=> mapNonEmpty!51872 (= (arr!40596 _values!1445) (store mapRest!51872 mapKey!51872 mapValue!51872))))

(declare-fun b!1278915 () Bool)

(declare-fun res!849587 () Bool)

(assert (=> b!1278915 (=> (not res!849587) (not e!730667))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278915 (= res!849587 (and (= (size!41146 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41145 _keys!1741) (size!41146 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278916 () Bool)

(assert (=> b!1278916 (= e!730669 (and e!730670 mapRes!51872))))

(declare-fun condMapEmpty!51872 () Bool)

(declare-fun mapDefault!51872 () ValueCell!15875)


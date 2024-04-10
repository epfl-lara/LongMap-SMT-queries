; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108356 () Bool)

(assert start!108356)

(declare-fun b!1278875 () Bool)

(declare-fun res!849567 () Bool)

(declare-fun e!730636 () Bool)

(assert (=> b!1278875 (=> (not res!849567) (not e!730636))))

(declare-datatypes ((array!84174 0))(
  ( (array!84175 (arr!40591 (Array (_ BitVec 32) (_ BitVec 64))) (size!41141 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84174)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84174 (_ BitVec 32)) Bool)

(assert (=> b!1278875 (= res!849567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278876 () Bool)

(assert (=> b!1278876 (= e!730636 false)))

(declare-fun lt!575945 () Bool)

(declare-datatypes ((List!28753 0))(
  ( (Nil!28750) (Cons!28749 (h!29958 (_ BitVec 64)) (t!42293 List!28753)) )
))
(declare-fun arrayNoDuplicates!0 (array!84174 (_ BitVec 32) List!28753) Bool)

(assert (=> b!1278876 (= lt!575945 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28750))))

(declare-fun b!1278877 () Bool)

(declare-fun e!730638 () Bool)

(declare-fun e!730639 () Bool)

(declare-fun mapRes!51866 () Bool)

(assert (=> b!1278877 (= e!730638 (and e!730639 mapRes!51866))))

(declare-fun condMapEmpty!51866 () Bool)

(declare-datatypes ((V!49827 0))(
  ( (V!49828 (val!16846 Int)) )
))
(declare-datatypes ((ValueCell!15873 0))(
  ( (ValueCellFull!15873 (v!19446 V!49827)) (EmptyCell!15873) )
))
(declare-datatypes ((array!84176 0))(
  ( (array!84177 (arr!40592 (Array (_ BitVec 32) ValueCell!15873)) (size!41142 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84176)

(declare-fun mapDefault!51866 () ValueCell!15873)

(assert (=> b!1278877 (= condMapEmpty!51866 (= (arr!40592 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15873)) mapDefault!51866)))))

(declare-fun mapIsEmpty!51866 () Bool)

(assert (=> mapIsEmpty!51866 mapRes!51866))

(declare-fun res!849569 () Bool)

(assert (=> start!108356 (=> (not res!849569) (not e!730636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108356 (= res!849569 (validMask!0 mask!2175))))

(assert (=> start!108356 e!730636))

(assert (=> start!108356 true))

(declare-fun array_inv!30823 (array!84176) Bool)

(assert (=> start!108356 (and (array_inv!30823 _values!1445) e!730638)))

(declare-fun array_inv!30824 (array!84174) Bool)

(assert (=> start!108356 (array_inv!30824 _keys!1741)))

(declare-fun b!1278878 () Bool)

(declare-fun e!730637 () Bool)

(declare-fun tp_is_empty!33543 () Bool)

(assert (=> b!1278878 (= e!730637 tp_is_empty!33543)))

(declare-fun b!1278879 () Bool)

(declare-fun res!849568 () Bool)

(assert (=> b!1278879 (=> (not res!849568) (not e!730636))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278879 (= res!849568 (and (= (size!41142 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41141 _keys!1741) (size!41142 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51866 () Bool)

(declare-fun tp!98840 () Bool)

(assert (=> mapNonEmpty!51866 (= mapRes!51866 (and tp!98840 e!730637))))

(declare-fun mapKey!51866 () (_ BitVec 32))

(declare-fun mapValue!51866 () ValueCell!15873)

(declare-fun mapRest!51866 () (Array (_ BitVec 32) ValueCell!15873))

(assert (=> mapNonEmpty!51866 (= (arr!40592 _values!1445) (store mapRest!51866 mapKey!51866 mapValue!51866))))

(declare-fun b!1278880 () Bool)

(assert (=> b!1278880 (= e!730639 tp_is_empty!33543)))

(assert (= (and start!108356 res!849569) b!1278879))

(assert (= (and b!1278879 res!849568) b!1278875))

(assert (= (and b!1278875 res!849567) b!1278876))

(assert (= (and b!1278877 condMapEmpty!51866) mapIsEmpty!51866))

(assert (= (and b!1278877 (not condMapEmpty!51866)) mapNonEmpty!51866))

(get-info :version)

(assert (= (and mapNonEmpty!51866 ((_ is ValueCellFull!15873) mapValue!51866)) b!1278878))

(assert (= (and b!1278877 ((_ is ValueCellFull!15873) mapDefault!51866)) b!1278880))

(assert (= start!108356 b!1278877))

(declare-fun m!1174037 () Bool)

(assert (=> b!1278875 m!1174037))

(declare-fun m!1174039 () Bool)

(assert (=> b!1278876 m!1174039))

(declare-fun m!1174041 () Bool)

(assert (=> start!108356 m!1174041))

(declare-fun m!1174043 () Bool)

(assert (=> start!108356 m!1174043))

(declare-fun m!1174045 () Bool)

(assert (=> start!108356 m!1174045))

(declare-fun m!1174047 () Bool)

(assert (=> mapNonEmpty!51866 m!1174047))

(check-sat (not b!1278876) (not start!108356) (not mapNonEmpty!51866) (not b!1278875) tp_is_empty!33543)
(check-sat)

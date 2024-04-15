; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108354 () Bool)

(assert start!108354)

(declare-fun b!1278793 () Bool)

(declare-fun res!849531 () Bool)

(declare-fun e!730593 () Bool)

(assert (=> b!1278793 (=> (not res!849531) (not e!730593))))

(declare-datatypes ((array!84065 0))(
  ( (array!84066 (arr!40537 (Array (_ BitVec 32) (_ BitVec 64))) (size!41089 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84065)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84065 (_ BitVec 32)) Bool)

(assert (=> b!1278793 (= res!849531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278794 () Bool)

(declare-fun e!730595 () Bool)

(declare-fun e!730592 () Bool)

(declare-fun mapRes!51863 () Bool)

(assert (=> b!1278794 (= e!730595 (and e!730592 mapRes!51863))))

(declare-fun condMapEmpty!51863 () Bool)

(declare-datatypes ((V!49825 0))(
  ( (V!49826 (val!16845 Int)) )
))
(declare-datatypes ((ValueCell!15872 0))(
  ( (ValueCellFull!15872 (v!19444 V!49825)) (EmptyCell!15872) )
))
(declare-datatypes ((array!84067 0))(
  ( (array!84068 (arr!40538 (Array (_ BitVec 32) ValueCell!15872)) (size!41090 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84067)

(declare-fun mapDefault!51863 () ValueCell!15872)

(assert (=> b!1278794 (= condMapEmpty!51863 (= (arr!40538 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15872)) mapDefault!51863)))))

(declare-fun b!1278796 () Bool)

(declare-fun res!849532 () Bool)

(assert (=> b!1278796 (=> (not res!849532) (not e!730593))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278796 (= res!849532 (and (= (size!41090 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41089 _keys!1741) (size!41090 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278797 () Bool)

(declare-fun tp_is_empty!33541 () Bool)

(assert (=> b!1278797 (= e!730592 tp_is_empty!33541)))

(declare-fun mapNonEmpty!51863 () Bool)

(declare-fun tp!98838 () Bool)

(declare-fun e!730594 () Bool)

(assert (=> mapNonEmpty!51863 (= mapRes!51863 (and tp!98838 e!730594))))

(declare-fun mapKey!51863 () (_ BitVec 32))

(declare-fun mapRest!51863 () (Array (_ BitVec 32) ValueCell!15872))

(declare-fun mapValue!51863 () ValueCell!15872)

(assert (=> mapNonEmpty!51863 (= (arr!40538 _values!1445) (store mapRest!51863 mapKey!51863 mapValue!51863))))

(declare-fun b!1278798 () Bool)

(assert (=> b!1278798 (= e!730593 false)))

(declare-fun lt!575764 () Bool)

(declare-datatypes ((List!28826 0))(
  ( (Nil!28823) (Cons!28822 (h!30031 (_ BitVec 64)) (t!42358 List!28826)) )
))
(declare-fun arrayNoDuplicates!0 (array!84065 (_ BitVec 32) List!28826) Bool)

(assert (=> b!1278798 (= lt!575764 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28823))))

(declare-fun mapIsEmpty!51863 () Bool)

(assert (=> mapIsEmpty!51863 mapRes!51863))

(declare-fun res!849533 () Bool)

(assert (=> start!108354 (=> (not res!849533) (not e!730593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108354 (= res!849533 (validMask!0 mask!2175))))

(assert (=> start!108354 e!730593))

(assert (=> start!108354 true))

(declare-fun array_inv!30943 (array!84067) Bool)

(assert (=> start!108354 (and (array_inv!30943 _values!1445) e!730595)))

(declare-fun array_inv!30944 (array!84065) Bool)

(assert (=> start!108354 (array_inv!30944 _keys!1741)))

(declare-fun b!1278795 () Bool)

(assert (=> b!1278795 (= e!730594 tp_is_empty!33541)))

(assert (= (and start!108354 res!849533) b!1278796))

(assert (= (and b!1278796 res!849532) b!1278793))

(assert (= (and b!1278793 res!849531) b!1278798))

(assert (= (and b!1278794 condMapEmpty!51863) mapIsEmpty!51863))

(assert (= (and b!1278794 (not condMapEmpty!51863)) mapNonEmpty!51863))

(get-info :version)

(assert (= (and mapNonEmpty!51863 ((_ is ValueCellFull!15872) mapValue!51863)) b!1278795))

(assert (= (and b!1278794 ((_ is ValueCellFull!15872) mapDefault!51863)) b!1278797))

(assert (= start!108354 b!1278794))

(declare-fun m!1173525 () Bool)

(assert (=> b!1278793 m!1173525))

(declare-fun m!1173527 () Bool)

(assert (=> mapNonEmpty!51863 m!1173527))

(declare-fun m!1173529 () Bool)

(assert (=> b!1278798 m!1173529))

(declare-fun m!1173531 () Bool)

(assert (=> start!108354 m!1173531))

(declare-fun m!1173533 () Bool)

(assert (=> start!108354 m!1173533))

(declare-fun m!1173535 () Bool)

(assert (=> start!108354 m!1173535))

(check-sat tp_is_empty!33541 (not mapNonEmpty!51863) (not b!1278798) (not b!1278793) (not start!108354))
(check-sat)

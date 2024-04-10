; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83922 () Bool)

(assert start!83922)

(declare-fun mapNonEmpty!36116 () Bool)

(declare-fun mapRes!36116 () Bool)

(declare-fun tp!68629 () Bool)

(declare-fun e!552827 () Bool)

(assert (=> mapNonEmpty!36116 (= mapRes!36116 (and tp!68629 e!552827))))

(declare-datatypes ((V!35283 0))(
  ( (V!35284 (val!11413 Int)) )
))
(declare-datatypes ((ValueCell!10881 0))(
  ( (ValueCellFull!10881 (v!13975 V!35283)) (EmptyCell!10881) )
))
(declare-fun mapValue!36116 () ValueCell!10881)

(declare-fun mapRest!36116 () (Array (_ BitVec 32) ValueCell!10881))

(declare-fun mapKey!36116 () (_ BitVec 32))

(declare-datatypes ((array!61455 0))(
  ( (array!61456 (arr!29585 (Array (_ BitVec 32) ValueCell!10881)) (size!30064 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61455)

(assert (=> mapNonEmpty!36116 (= (arr!29585 _values!1278) (store mapRest!36116 mapKey!36116 mapValue!36116))))

(declare-fun b!980809 () Bool)

(declare-fun e!552824 () Bool)

(declare-fun e!552825 () Bool)

(assert (=> b!980809 (= e!552824 (and e!552825 mapRes!36116))))

(declare-fun condMapEmpty!36116 () Bool)

(declare-fun mapDefault!36116 () ValueCell!10881)

(assert (=> b!980809 (= condMapEmpty!36116 (= (arr!29585 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10881)) mapDefault!36116)))))

(declare-fun b!980810 () Bool)

(declare-fun res!656399 () Bool)

(declare-fun e!552826 () Bool)

(assert (=> b!980810 (=> (not res!656399) (not e!552826))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61457 0))(
  ( (array!61458 (arr!29586 (Array (_ BitVec 32) (_ BitVec 64))) (size!30065 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61457)

(assert (=> b!980810 (= res!656399 (and (= (size!30064 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30065 _keys!1544) (size!30064 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656398 () Bool)

(assert (=> start!83922 (=> (not res!656398) (not e!552826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83922 (= res!656398 (validMask!0 mask!1948))))

(assert (=> start!83922 e!552826))

(assert (=> start!83922 true))

(declare-fun array_inv!22873 (array!61455) Bool)

(assert (=> start!83922 (and (array_inv!22873 _values!1278) e!552824)))

(declare-fun array_inv!22874 (array!61457) Bool)

(assert (=> start!83922 (array_inv!22874 _keys!1544)))

(declare-fun b!980811 () Bool)

(declare-fun tp_is_empty!22725 () Bool)

(assert (=> b!980811 (= e!552827 tp_is_empty!22725)))

(declare-fun b!980812 () Bool)

(assert (=> b!980812 (= e!552825 tp_is_empty!22725)))

(declare-fun b!980813 () Bool)

(assert (=> b!980813 (= e!552826 false)))

(declare-fun lt!435605 () Bool)

(declare-datatypes ((List!20506 0))(
  ( (Nil!20503) (Cons!20502 (h!21664 (_ BitVec 64)) (t!29189 List!20506)) )
))
(declare-fun arrayNoDuplicates!0 (array!61457 (_ BitVec 32) List!20506) Bool)

(assert (=> b!980813 (= lt!435605 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20503))))

(declare-fun mapIsEmpty!36116 () Bool)

(assert (=> mapIsEmpty!36116 mapRes!36116))

(declare-fun b!980814 () Bool)

(declare-fun res!656397 () Bool)

(assert (=> b!980814 (=> (not res!656397) (not e!552826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61457 (_ BitVec 32)) Bool)

(assert (=> b!980814 (= res!656397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83922 res!656398) b!980810))

(assert (= (and b!980810 res!656399) b!980814))

(assert (= (and b!980814 res!656397) b!980813))

(assert (= (and b!980809 condMapEmpty!36116) mapIsEmpty!36116))

(assert (= (and b!980809 (not condMapEmpty!36116)) mapNonEmpty!36116))

(get-info :version)

(assert (= (and mapNonEmpty!36116 ((_ is ValueCellFull!10881) mapValue!36116)) b!980811))

(assert (= (and b!980809 ((_ is ValueCellFull!10881) mapDefault!36116)) b!980812))

(assert (= start!83922 b!980809))

(declare-fun m!908395 () Bool)

(assert (=> mapNonEmpty!36116 m!908395))

(declare-fun m!908397 () Bool)

(assert (=> start!83922 m!908397))

(declare-fun m!908399 () Bool)

(assert (=> start!83922 m!908399))

(declare-fun m!908401 () Bool)

(assert (=> start!83922 m!908401))

(declare-fun m!908403 () Bool)

(assert (=> b!980813 m!908403))

(declare-fun m!908405 () Bool)

(assert (=> b!980814 m!908405))

(check-sat tp_is_empty!22725 (not mapNonEmpty!36116) (not b!980813) (not start!83922) (not b!980814))
(check-sat)

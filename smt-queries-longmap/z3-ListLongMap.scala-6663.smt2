; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83932 () Bool)

(assert start!83932)

(declare-fun b!980822 () Bool)

(declare-fun e!552889 () Bool)

(declare-fun tp_is_empty!22753 () Bool)

(assert (=> b!980822 (= e!552889 tp_is_empty!22753)))

(declare-fun mapNonEmpty!36158 () Bool)

(declare-fun mapRes!36158 () Bool)

(declare-fun tp!68672 () Bool)

(assert (=> mapNonEmpty!36158 (= mapRes!36158 (and tp!68672 e!552889))))

(declare-datatypes ((V!35321 0))(
  ( (V!35322 (val!11427 Int)) )
))
(declare-datatypes ((ValueCell!10895 0))(
  ( (ValueCellFull!10895 (v!13988 V!35321)) (EmptyCell!10895) )
))
(declare-datatypes ((array!61436 0))(
  ( (array!61437 (arr!29576 (Array (_ BitVec 32) ValueCell!10895)) (size!30057 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61436)

(declare-fun mapRest!36158 () (Array (_ BitVec 32) ValueCell!10895))

(declare-fun mapKey!36158 () (_ BitVec 32))

(declare-fun mapValue!36158 () ValueCell!10895)

(assert (=> mapNonEmpty!36158 (= (arr!29576 _values!1278) (store mapRest!36158 mapKey!36158 mapValue!36158))))

(declare-fun b!980823 () Bool)

(declare-fun e!552890 () Bool)

(assert (=> b!980823 (= e!552890 false)))

(declare-fun lt!435411 () Bool)

(declare-datatypes ((array!61438 0))(
  ( (array!61439 (arr!29577 (Array (_ BitVec 32) (_ BitVec 64))) (size!30058 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61438)

(declare-datatypes ((List!20544 0))(
  ( (Nil!20541) (Cons!20540 (h!21702 (_ BitVec 64)) (t!29218 List!20544)) )
))
(declare-fun arrayNoDuplicates!0 (array!61438 (_ BitVec 32) List!20544) Bool)

(assert (=> b!980823 (= lt!435411 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20541))))

(declare-fun b!980824 () Bool)

(declare-fun e!552887 () Bool)

(declare-fun e!552886 () Bool)

(assert (=> b!980824 (= e!552887 (and e!552886 mapRes!36158))))

(declare-fun condMapEmpty!36158 () Bool)

(declare-fun mapDefault!36158 () ValueCell!10895)

(assert (=> b!980824 (= condMapEmpty!36158 (= (arr!29576 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10895)) mapDefault!36158)))))

(declare-fun b!980825 () Bool)

(assert (=> b!980825 (= e!552886 tp_is_empty!22753)))

(declare-fun b!980826 () Bool)

(declare-fun res!656414 () Bool)

(assert (=> b!980826 (=> (not res!656414) (not e!552890))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61438 (_ BitVec 32)) Bool)

(assert (=> b!980826 (= res!656414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656413 () Bool)

(assert (=> start!83932 (=> (not res!656413) (not e!552890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83932 (= res!656413 (validMask!0 mask!1948))))

(assert (=> start!83932 e!552890))

(assert (=> start!83932 true))

(declare-fun array_inv!22889 (array!61436) Bool)

(assert (=> start!83932 (and (array_inv!22889 _values!1278) e!552887)))

(declare-fun array_inv!22890 (array!61438) Bool)

(assert (=> start!83932 (array_inv!22890 _keys!1544)))

(declare-fun b!980827 () Bool)

(declare-fun res!656415 () Bool)

(assert (=> b!980827 (=> (not res!656415) (not e!552890))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980827 (= res!656415 (and (= (size!30057 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30058 _keys!1544) (size!30057 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36158 () Bool)

(assert (=> mapIsEmpty!36158 mapRes!36158))

(assert (= (and start!83932 res!656413) b!980827))

(assert (= (and b!980827 res!656415) b!980826))

(assert (= (and b!980826 res!656414) b!980823))

(assert (= (and b!980824 condMapEmpty!36158) mapIsEmpty!36158))

(assert (= (and b!980824 (not condMapEmpty!36158)) mapNonEmpty!36158))

(get-info :version)

(assert (= (and mapNonEmpty!36158 ((_ is ValueCellFull!10895) mapValue!36158)) b!980822))

(assert (= (and b!980824 ((_ is ValueCellFull!10895) mapDefault!36158)) b!980825))

(assert (= start!83932 b!980824))

(declare-fun m!907805 () Bool)

(assert (=> mapNonEmpty!36158 m!907805))

(declare-fun m!907807 () Bool)

(assert (=> b!980823 m!907807))

(declare-fun m!907809 () Bool)

(assert (=> b!980826 m!907809))

(declare-fun m!907811 () Bool)

(assert (=> start!83932 m!907811))

(declare-fun m!907813 () Bool)

(assert (=> start!83932 m!907813))

(declare-fun m!907815 () Bool)

(assert (=> start!83932 m!907815))

(check-sat tp_is_empty!22753 (not b!980826) (not b!980823) (not start!83932) (not mapNonEmpty!36158))
(check-sat)

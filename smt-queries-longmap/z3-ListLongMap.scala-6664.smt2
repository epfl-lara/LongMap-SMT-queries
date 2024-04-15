; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83938 () Bool)

(assert start!83938)

(declare-fun res!656441 () Bool)

(declare-fun e!552935 () Bool)

(assert (=> start!83938 (=> (not res!656441) (not e!552935))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83938 (= res!656441 (validMask!0 mask!1948))))

(assert (=> start!83938 e!552935))

(assert (=> start!83938 true))

(declare-datatypes ((V!35329 0))(
  ( (V!35330 (val!11430 Int)) )
))
(declare-datatypes ((ValueCell!10898 0))(
  ( (ValueCellFull!10898 (v!13991 V!35329)) (EmptyCell!10898) )
))
(declare-datatypes ((array!61448 0))(
  ( (array!61449 (arr!29582 (Array (_ BitVec 32) ValueCell!10898)) (size!30063 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61448)

(declare-fun e!552931 () Bool)

(declare-fun array_inv!22893 (array!61448) Bool)

(assert (=> start!83938 (and (array_inv!22893 _values!1278) e!552931)))

(declare-datatypes ((array!61450 0))(
  ( (array!61451 (arr!29583 (Array (_ BitVec 32) (_ BitVec 64))) (size!30064 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61450)

(declare-fun array_inv!22894 (array!61450) Bool)

(assert (=> start!83938 (array_inv!22894 _keys!1544)))

(declare-fun b!980876 () Bool)

(assert (=> b!980876 (= e!552935 false)))

(declare-fun lt!435420 () Bool)

(declare-datatypes ((List!20547 0))(
  ( (Nil!20544) (Cons!20543 (h!21705 (_ BitVec 64)) (t!29221 List!20547)) )
))
(declare-fun arrayNoDuplicates!0 (array!61450 (_ BitVec 32) List!20547) Bool)

(assert (=> b!980876 (= lt!435420 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20544))))

(declare-fun b!980877 () Bool)

(declare-fun e!552934 () Bool)

(declare-fun tp_is_empty!22759 () Bool)

(assert (=> b!980877 (= e!552934 tp_is_empty!22759)))

(declare-fun b!980878 () Bool)

(declare-fun res!656440 () Bool)

(assert (=> b!980878 (=> (not res!656440) (not e!552935))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980878 (= res!656440 (and (= (size!30063 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30064 _keys!1544) (size!30063 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980879 () Bool)

(declare-fun res!656442 () Bool)

(assert (=> b!980879 (=> (not res!656442) (not e!552935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61450 (_ BitVec 32)) Bool)

(assert (=> b!980879 (= res!656442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980880 () Bool)

(declare-fun e!552932 () Bool)

(assert (=> b!980880 (= e!552932 tp_is_empty!22759)))

(declare-fun mapNonEmpty!36167 () Bool)

(declare-fun mapRes!36167 () Bool)

(declare-fun tp!68681 () Bool)

(assert (=> mapNonEmpty!36167 (= mapRes!36167 (and tp!68681 e!552934))))

(declare-fun mapRest!36167 () (Array (_ BitVec 32) ValueCell!10898))

(declare-fun mapValue!36167 () ValueCell!10898)

(declare-fun mapKey!36167 () (_ BitVec 32))

(assert (=> mapNonEmpty!36167 (= (arr!29582 _values!1278) (store mapRest!36167 mapKey!36167 mapValue!36167))))

(declare-fun mapIsEmpty!36167 () Bool)

(assert (=> mapIsEmpty!36167 mapRes!36167))

(declare-fun b!980881 () Bool)

(assert (=> b!980881 (= e!552931 (and e!552932 mapRes!36167))))

(declare-fun condMapEmpty!36167 () Bool)

(declare-fun mapDefault!36167 () ValueCell!10898)

(assert (=> b!980881 (= condMapEmpty!36167 (= (arr!29582 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10898)) mapDefault!36167)))))

(assert (= (and start!83938 res!656441) b!980878))

(assert (= (and b!980878 res!656440) b!980879))

(assert (= (and b!980879 res!656442) b!980876))

(assert (= (and b!980881 condMapEmpty!36167) mapIsEmpty!36167))

(assert (= (and b!980881 (not condMapEmpty!36167)) mapNonEmpty!36167))

(get-info :version)

(assert (= (and mapNonEmpty!36167 ((_ is ValueCellFull!10898) mapValue!36167)) b!980877))

(assert (= (and b!980881 ((_ is ValueCellFull!10898) mapDefault!36167)) b!980880))

(assert (= start!83938 b!980881))

(declare-fun m!907841 () Bool)

(assert (=> start!83938 m!907841))

(declare-fun m!907843 () Bool)

(assert (=> start!83938 m!907843))

(declare-fun m!907845 () Bool)

(assert (=> start!83938 m!907845))

(declare-fun m!907847 () Bool)

(assert (=> b!980876 m!907847))

(declare-fun m!907849 () Bool)

(assert (=> b!980879 m!907849))

(declare-fun m!907851 () Bool)

(assert (=> mapNonEmpty!36167 m!907851))

(check-sat (not start!83938) (not b!980876) tp_is_empty!22759 (not mapNonEmpty!36167) (not b!980879))
(check-sat)

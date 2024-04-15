; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97502 () Bool)

(assert start!97502)

(declare-fun b!1113016 () Bool)

(declare-fun res!742843 () Bool)

(declare-fun e!634494 () Bool)

(assert (=> b!1113016 (=> (not res!742843) (not e!634494))))

(declare-datatypes ((array!72286 0))(
  ( (array!72287 (arr!34796 (Array (_ BitVec 32) (_ BitVec 64))) (size!35334 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72286)

(declare-datatypes ((List!24335 0))(
  ( (Nil!24332) (Cons!24331 (h!25540 (_ BitVec 64)) (t!34807 List!24335)) )
))
(declare-fun arrayNoDuplicates!0 (array!72286 (_ BitVec 32) List!24335) Bool)

(assert (=> b!1113016 (= res!742843 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24332))))

(declare-fun b!1113017 () Bool)

(declare-fun res!742834 () Bool)

(assert (=> b!1113017 (=> (not res!742834) (not e!634494))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42113 0))(
  ( (V!42114 (val!13926 Int)) )
))
(declare-datatypes ((ValueCell!13160 0))(
  ( (ValueCellFull!13160 (v!16558 V!42113)) (EmptyCell!13160) )
))
(declare-datatypes ((array!72288 0))(
  ( (array!72289 (arr!34797 (Array (_ BitVec 32) ValueCell!13160)) (size!35335 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72288)

(assert (=> b!1113017 (= res!742834 (and (= (size!35335 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35334 _keys!1208) (size!35335 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43426 () Bool)

(declare-fun mapRes!43426 () Bool)

(declare-fun tp!82670 () Bool)

(declare-fun e!634491 () Bool)

(assert (=> mapNonEmpty!43426 (= mapRes!43426 (and tp!82670 e!634491))))

(declare-fun mapRest!43426 () (Array (_ BitVec 32) ValueCell!13160))

(declare-fun mapKey!43426 () (_ BitVec 32))

(declare-fun mapValue!43426 () ValueCell!13160)

(assert (=> mapNonEmpty!43426 (= (arr!34797 _values!996) (store mapRest!43426 mapKey!43426 mapValue!43426))))

(declare-fun b!1113018 () Bool)

(declare-fun res!742838 () Bool)

(assert (=> b!1113018 (=> (not res!742838) (not e!634494))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113018 (= res!742838 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35334 _keys!1208))))))

(declare-fun b!1113019 () Bool)

(declare-fun res!742835 () Bool)

(declare-fun e!634490 () Bool)

(assert (=> b!1113019 (=> (not res!742835) (not e!634490))))

(declare-fun lt!496427 () array!72286)

(assert (=> b!1113019 (= res!742835 (arrayNoDuplicates!0 lt!496427 #b00000000000000000000000000000000 Nil!24332))))

(declare-fun b!1113020 () Bool)

(declare-fun res!742837 () Bool)

(assert (=> b!1113020 (=> (not res!742837) (not e!634494))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113020 (= res!742837 (= (select (arr!34796 _keys!1208) i!673) k0!934))))

(declare-fun b!1113021 () Bool)

(declare-fun res!742841 () Bool)

(assert (=> b!1113021 (=> (not res!742841) (not e!634494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113021 (= res!742841 (validKeyInArray!0 k0!934))))

(declare-fun b!1113022 () Bool)

(assert (=> b!1113022 (= e!634494 e!634490)))

(declare-fun res!742839 () Bool)

(assert (=> b!1113022 (=> (not res!742839) (not e!634490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72286 (_ BitVec 32)) Bool)

(assert (=> b!1113022 (= res!742839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496427 mask!1564))))

(assert (=> b!1113022 (= lt!496427 (array!72287 (store (arr!34796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35334 _keys!1208)))))

(declare-fun b!1113015 () Bool)

(assert (=> b!1113015 (= e!634490 (not true))))

(declare-fun arrayContainsKey!0 (array!72286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36349 0))(
  ( (Unit!36350) )
))
(declare-fun lt!496428 () Unit!36349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72286 (_ BitVec 64) (_ BitVec 32)) Unit!36349)

(assert (=> b!1113015 (= lt!496428 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!742842 () Bool)

(assert (=> start!97502 (=> (not res!742842) (not e!634494))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97502 (= res!742842 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35334 _keys!1208))))))

(assert (=> start!97502 e!634494))

(declare-fun array_inv!26828 (array!72286) Bool)

(assert (=> start!97502 (array_inv!26828 _keys!1208)))

(assert (=> start!97502 true))

(declare-fun e!634493 () Bool)

(declare-fun array_inv!26829 (array!72288) Bool)

(assert (=> start!97502 (and (array_inv!26829 _values!996) e!634493)))

(declare-fun b!1113023 () Bool)

(declare-fun res!742836 () Bool)

(assert (=> b!1113023 (=> (not res!742836) (not e!634494))))

(assert (=> b!1113023 (= res!742836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113024 () Bool)

(declare-fun res!742840 () Bool)

(assert (=> b!1113024 (=> (not res!742840) (not e!634494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113024 (= res!742840 (validMask!0 mask!1564))))

(declare-fun b!1113025 () Bool)

(declare-fun e!634492 () Bool)

(assert (=> b!1113025 (= e!634493 (and e!634492 mapRes!43426))))

(declare-fun condMapEmpty!43426 () Bool)

(declare-fun mapDefault!43426 () ValueCell!13160)

(assert (=> b!1113025 (= condMapEmpty!43426 (= (arr!34797 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13160)) mapDefault!43426)))))

(declare-fun b!1113026 () Bool)

(declare-fun tp_is_empty!27739 () Bool)

(assert (=> b!1113026 (= e!634492 tp_is_empty!27739)))

(declare-fun b!1113027 () Bool)

(assert (=> b!1113027 (= e!634491 tp_is_empty!27739)))

(declare-fun mapIsEmpty!43426 () Bool)

(assert (=> mapIsEmpty!43426 mapRes!43426))

(assert (= (and start!97502 res!742842) b!1113024))

(assert (= (and b!1113024 res!742840) b!1113017))

(assert (= (and b!1113017 res!742834) b!1113023))

(assert (= (and b!1113023 res!742836) b!1113016))

(assert (= (and b!1113016 res!742843) b!1113018))

(assert (= (and b!1113018 res!742838) b!1113021))

(assert (= (and b!1113021 res!742841) b!1113020))

(assert (= (and b!1113020 res!742837) b!1113022))

(assert (= (and b!1113022 res!742839) b!1113019))

(assert (= (and b!1113019 res!742835) b!1113015))

(assert (= (and b!1113025 condMapEmpty!43426) mapIsEmpty!43426))

(assert (= (and b!1113025 (not condMapEmpty!43426)) mapNonEmpty!43426))

(get-info :version)

(assert (= (and mapNonEmpty!43426 ((_ is ValueCellFull!13160) mapValue!43426)) b!1113027))

(assert (= (and b!1113025 ((_ is ValueCellFull!13160) mapDefault!43426)) b!1113026))

(assert (= start!97502 b!1113025))

(declare-fun m!1029825 () Bool)

(assert (=> b!1113022 m!1029825))

(declare-fun m!1029827 () Bool)

(assert (=> b!1113022 m!1029827))

(declare-fun m!1029829 () Bool)

(assert (=> b!1113024 m!1029829))

(declare-fun m!1029831 () Bool)

(assert (=> b!1113021 m!1029831))

(declare-fun m!1029833 () Bool)

(assert (=> b!1113023 m!1029833))

(declare-fun m!1029835 () Bool)

(assert (=> b!1113019 m!1029835))

(declare-fun m!1029837 () Bool)

(assert (=> b!1113020 m!1029837))

(declare-fun m!1029839 () Bool)

(assert (=> b!1113016 m!1029839))

(declare-fun m!1029841 () Bool)

(assert (=> b!1113015 m!1029841))

(declare-fun m!1029843 () Bool)

(assert (=> b!1113015 m!1029843))

(declare-fun m!1029845 () Bool)

(assert (=> start!97502 m!1029845))

(declare-fun m!1029847 () Bool)

(assert (=> start!97502 m!1029847))

(declare-fun m!1029849 () Bool)

(assert (=> mapNonEmpty!43426 m!1029849))

(check-sat (not mapNonEmpty!43426) (not b!1113015) (not b!1113023) (not b!1113019) (not b!1113024) (not b!1113021) (not start!97502) tp_is_empty!27739 (not b!1113022) (not b!1113016))
(check-sat)

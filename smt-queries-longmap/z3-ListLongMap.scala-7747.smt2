; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97462 () Bool)

(assert start!97462)

(declare-fun mapNonEmpty!43003 () Bool)

(declare-fun mapRes!43003 () Bool)

(declare-fun tp!81923 () Bool)

(declare-fun e!632224 () Bool)

(assert (=> mapNonEmpty!43003 (= mapRes!43003 (and tp!81923 e!632224))))

(declare-datatypes ((V!41737 0))(
  ( (V!41738 (val!13785 Int)) )
))
(declare-datatypes ((ValueCell!13019 0))(
  ( (ValueCellFull!13019 (v!16414 V!41737)) (EmptyCell!13019) )
))
(declare-fun mapRest!43003 () (Array (_ BitVec 32) ValueCell!13019))

(declare-fun mapValue!43003 () ValueCell!13019)

(declare-datatypes ((array!71867 0))(
  ( (array!71868 (arr!34580 (Array (_ BitVec 32) ValueCell!13019)) (size!35117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71867)

(declare-fun mapKey!43003 () (_ BitVec 32))

(assert (=> mapNonEmpty!43003 (= (arr!34580 _values!996) (store mapRest!43003 mapKey!43003 mapValue!43003))))

(declare-fun b!1107748 () Bool)

(declare-fun e!632223 () Bool)

(declare-fun e!632222 () Bool)

(assert (=> b!1107748 (= e!632223 (and e!632222 mapRes!43003))))

(declare-fun condMapEmpty!43003 () Bool)

(declare-fun mapDefault!43003 () ValueCell!13019)

(assert (=> b!1107748 (= condMapEmpty!43003 (= (arr!34580 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13019)) mapDefault!43003)))))

(declare-fun b!1107749 () Bool)

(declare-fun e!632221 () Bool)

(declare-fun e!632225 () Bool)

(assert (=> b!1107749 (= e!632221 e!632225)))

(declare-fun res!738877 () Bool)

(assert (=> b!1107749 (=> (not res!738877) (not e!632225))))

(declare-datatypes ((array!71869 0))(
  ( (array!71870 (arr!34581 (Array (_ BitVec 32) (_ BitVec 64))) (size!35118 (_ BitVec 32))) )
))
(declare-fun lt!495973 () array!71869)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71869 (_ BitVec 32)) Bool)

(assert (=> b!1107749 (= res!738877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495973 mask!1564))))

(declare-fun _keys!1208 () array!71869)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107749 (= lt!495973 (array!71870 (store (arr!34581 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35118 _keys!1208)))))

(declare-fun b!1107750 () Bool)

(declare-fun res!738879 () Bool)

(assert (=> b!1107750 (=> (not res!738879) (not e!632221))))

(assert (=> b!1107750 (= res!738879 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35118 _keys!1208))))))

(declare-fun b!1107751 () Bool)

(declare-fun tp_is_empty!27457 () Bool)

(assert (=> b!1107751 (= e!632224 tp_is_empty!27457)))

(declare-fun b!1107752 () Bool)

(declare-fun res!738878 () Bool)

(assert (=> b!1107752 (=> (not res!738878) (not e!632221))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1107752 (= res!738878 (= (select (arr!34581 _keys!1208) i!673) k0!934))))

(declare-fun b!1107753 () Bool)

(declare-fun res!738873 () Bool)

(assert (=> b!1107753 (=> (not res!738873) (not e!632225))))

(declare-datatypes ((List!24114 0))(
  ( (Nil!24111) (Cons!24110 (h!25328 (_ BitVec 64)) (t!34371 List!24114)) )
))
(declare-fun arrayNoDuplicates!0 (array!71869 (_ BitVec 32) List!24114) Bool)

(assert (=> b!1107753 (= res!738873 (arrayNoDuplicates!0 lt!495973 #b00000000000000000000000000000000 Nil!24111))))

(declare-fun b!1107754 () Bool)

(declare-fun res!738880 () Bool)

(assert (=> b!1107754 (=> (not res!738880) (not e!632221))))

(assert (=> b!1107754 (= res!738880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43003 () Bool)

(assert (=> mapIsEmpty!43003 mapRes!43003))

(declare-fun b!1107755 () Bool)

(declare-fun res!738872 () Bool)

(assert (=> b!1107755 (=> (not res!738872) (not e!632221))))

(assert (=> b!1107755 (= res!738872 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24111))))

(declare-fun b!1107756 () Bool)

(declare-fun res!738876 () Bool)

(assert (=> b!1107756 (=> (not res!738876) (not e!632221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107756 (= res!738876 (validMask!0 mask!1564))))

(declare-fun res!738875 () Bool)

(assert (=> start!97462 (=> (not res!738875) (not e!632221))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97462 (= res!738875 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35118 _keys!1208))))))

(assert (=> start!97462 e!632221))

(declare-fun array_inv!26646 (array!71869) Bool)

(assert (=> start!97462 (array_inv!26646 _keys!1208)))

(assert (=> start!97462 true))

(declare-fun array_inv!26647 (array!71867) Bool)

(assert (=> start!97462 (and (array_inv!26647 _values!996) e!632223)))

(declare-fun b!1107757 () Bool)

(assert (=> b!1107757 (= e!632225 (not true))))

(declare-fun arrayContainsKey!0 (array!71869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107757 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36299 0))(
  ( (Unit!36300) )
))
(declare-fun lt!495972 () Unit!36299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71869 (_ BitVec 64) (_ BitVec 32)) Unit!36299)

(assert (=> b!1107757 (= lt!495972 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107758 () Bool)

(assert (=> b!1107758 (= e!632222 tp_is_empty!27457)))

(declare-fun b!1107759 () Bool)

(declare-fun res!738871 () Bool)

(assert (=> b!1107759 (=> (not res!738871) (not e!632221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107759 (= res!738871 (validKeyInArray!0 k0!934))))

(declare-fun b!1107760 () Bool)

(declare-fun res!738874 () Bool)

(assert (=> b!1107760 (=> (not res!738874) (not e!632221))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107760 (= res!738874 (and (= (size!35117 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35118 _keys!1208) (size!35117 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97462 res!738875) b!1107756))

(assert (= (and b!1107756 res!738876) b!1107760))

(assert (= (and b!1107760 res!738874) b!1107754))

(assert (= (and b!1107754 res!738880) b!1107755))

(assert (= (and b!1107755 res!738872) b!1107750))

(assert (= (and b!1107750 res!738879) b!1107759))

(assert (= (and b!1107759 res!738871) b!1107752))

(assert (= (and b!1107752 res!738878) b!1107749))

(assert (= (and b!1107749 res!738877) b!1107753))

(assert (= (and b!1107753 res!738873) b!1107757))

(assert (= (and b!1107748 condMapEmpty!43003) mapIsEmpty!43003))

(assert (= (and b!1107748 (not condMapEmpty!43003)) mapNonEmpty!43003))

(get-info :version)

(assert (= (and mapNonEmpty!43003 ((_ is ValueCellFull!13019) mapValue!43003)) b!1107751))

(assert (= (and b!1107748 ((_ is ValueCellFull!13019) mapDefault!43003)) b!1107758))

(assert (= start!97462 b!1107748))

(declare-fun m!1027161 () Bool)

(assert (=> b!1107754 m!1027161))

(declare-fun m!1027163 () Bool)

(assert (=> b!1107759 m!1027163))

(declare-fun m!1027165 () Bool)

(assert (=> b!1107756 m!1027165))

(declare-fun m!1027167 () Bool)

(assert (=> b!1107755 m!1027167))

(declare-fun m!1027169 () Bool)

(assert (=> start!97462 m!1027169))

(declare-fun m!1027171 () Bool)

(assert (=> start!97462 m!1027171))

(declare-fun m!1027173 () Bool)

(assert (=> b!1107749 m!1027173))

(declare-fun m!1027175 () Bool)

(assert (=> b!1107749 m!1027175))

(declare-fun m!1027177 () Bool)

(assert (=> b!1107752 m!1027177))

(declare-fun m!1027179 () Bool)

(assert (=> b!1107757 m!1027179))

(declare-fun m!1027181 () Bool)

(assert (=> b!1107757 m!1027181))

(declare-fun m!1027183 () Bool)

(assert (=> b!1107753 m!1027183))

(declare-fun m!1027185 () Bool)

(assert (=> mapNonEmpty!43003 m!1027185))

(check-sat (not b!1107755) (not b!1107759) (not b!1107754) (not b!1107756) tp_is_empty!27457 (not b!1107749) (not start!97462) (not mapNonEmpty!43003) (not b!1107753) (not b!1107757))
(check-sat)

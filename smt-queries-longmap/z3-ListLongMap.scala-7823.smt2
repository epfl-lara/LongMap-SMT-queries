; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97918 () Bool)

(assert start!97918)

(declare-fun b!1117864 () Bool)

(declare-fun res!746043 () Bool)

(declare-fun e!636991 () Bool)

(assert (=> b!1117864 (=> (not res!746043) (not e!636991))))

(declare-datatypes ((array!72765 0))(
  ( (array!72766 (arr!35029 (Array (_ BitVec 32) (_ BitVec 64))) (size!35566 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72765)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117864 (= res!746043 (= (select (arr!35029 _keys!1208) i!673) k0!934))))

(declare-fun b!1117865 () Bool)

(declare-fun res!746037 () Bool)

(assert (=> b!1117865 (=> (not res!746037) (not e!636991))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42345 0))(
  ( (V!42346 (val!14013 Int)) )
))
(declare-datatypes ((ValueCell!13247 0))(
  ( (ValueCellFull!13247 (v!16642 V!42345)) (EmptyCell!13247) )
))
(declare-datatypes ((array!72767 0))(
  ( (array!72768 (arr!35030 (Array (_ BitVec 32) ValueCell!13247)) (size!35567 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72767)

(assert (=> b!1117865 (= res!746037 (and (= (size!35567 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35566 _keys!1208) (size!35567 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117866 () Bool)

(declare-fun res!746035 () Bool)

(assert (=> b!1117866 (=> (not res!746035) (not e!636991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117866 (= res!746035 (validMask!0 mask!1564))))

(declare-fun b!1117867 () Bool)

(declare-fun e!636993 () Bool)

(assert (=> b!1117867 (= e!636993 (not true))))

(declare-fun arrayContainsKey!0 (array!72765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117867 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36617 0))(
  ( (Unit!36618) )
))
(declare-fun lt!497664 () Unit!36617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72765 (_ BitVec 64) (_ BitVec 32)) Unit!36617)

(assert (=> b!1117867 (= lt!497664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117868 () Bool)

(assert (=> b!1117868 (= e!636991 e!636993)))

(declare-fun res!746036 () Bool)

(assert (=> b!1117868 (=> (not res!746036) (not e!636993))))

(declare-fun lt!497665 () array!72765)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72765 (_ BitVec 32)) Bool)

(assert (=> b!1117868 (= res!746036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497665 mask!1564))))

(assert (=> b!1117868 (= lt!497665 (array!72766 (store (arr!35029 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35566 _keys!1208)))))

(declare-fun b!1117869 () Bool)

(declare-fun res!746040 () Bool)

(assert (=> b!1117869 (=> (not res!746040) (not e!636991))))

(assert (=> b!1117869 (= res!746040 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35566 _keys!1208))))))

(declare-fun b!1117870 () Bool)

(declare-fun res!746044 () Bool)

(assert (=> b!1117870 (=> (not res!746044) (not e!636993))))

(declare-datatypes ((List!24391 0))(
  ( (Nil!24388) (Cons!24387 (h!25605 (_ BitVec 64)) (t!34864 List!24391)) )
))
(declare-fun arrayNoDuplicates!0 (array!72765 (_ BitVec 32) List!24391) Bool)

(assert (=> b!1117870 (= res!746044 (arrayNoDuplicates!0 lt!497665 #b00000000000000000000000000000000 Nil!24388))))

(declare-fun b!1117871 () Bool)

(declare-fun res!746042 () Bool)

(assert (=> b!1117871 (=> (not res!746042) (not e!636991))))

(assert (=> b!1117871 (= res!746042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117873 () Bool)

(declare-fun res!746039 () Bool)

(assert (=> b!1117873 (=> (not res!746039) (not e!636991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117873 (= res!746039 (validKeyInArray!0 k0!934))))

(declare-fun b!1117874 () Bool)

(declare-fun res!746038 () Bool)

(assert (=> b!1117874 (=> (not res!746038) (not e!636991))))

(assert (=> b!1117874 (= res!746038 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24388))))

(declare-fun b!1117875 () Bool)

(declare-fun e!636992 () Bool)

(declare-fun tp_is_empty!27913 () Bool)

(assert (=> b!1117875 (= e!636992 tp_is_empty!27913)))

(declare-fun mapIsEmpty!43687 () Bool)

(declare-fun mapRes!43687 () Bool)

(assert (=> mapIsEmpty!43687 mapRes!43687))

(declare-fun res!746041 () Bool)

(assert (=> start!97918 (=> (not res!746041) (not e!636991))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97918 (= res!746041 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35566 _keys!1208))))))

(assert (=> start!97918 e!636991))

(declare-fun array_inv!26988 (array!72765) Bool)

(assert (=> start!97918 (array_inv!26988 _keys!1208)))

(assert (=> start!97918 true))

(declare-fun e!636994 () Bool)

(declare-fun array_inv!26989 (array!72767) Bool)

(assert (=> start!97918 (and (array_inv!26989 _values!996) e!636994)))

(declare-fun b!1117872 () Bool)

(declare-fun e!636995 () Bool)

(assert (=> b!1117872 (= e!636994 (and e!636995 mapRes!43687))))

(declare-fun condMapEmpty!43687 () Bool)

(declare-fun mapDefault!43687 () ValueCell!13247)

(assert (=> b!1117872 (= condMapEmpty!43687 (= (arr!35030 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13247)) mapDefault!43687)))))

(declare-fun mapNonEmpty!43687 () Bool)

(declare-fun tp!82931 () Bool)

(assert (=> mapNonEmpty!43687 (= mapRes!43687 (and tp!82931 e!636992))))

(declare-fun mapKey!43687 () (_ BitVec 32))

(declare-fun mapValue!43687 () ValueCell!13247)

(declare-fun mapRest!43687 () (Array (_ BitVec 32) ValueCell!13247))

(assert (=> mapNonEmpty!43687 (= (arr!35030 _values!996) (store mapRest!43687 mapKey!43687 mapValue!43687))))

(declare-fun b!1117876 () Bool)

(assert (=> b!1117876 (= e!636995 tp_is_empty!27913)))

(assert (= (and start!97918 res!746041) b!1117866))

(assert (= (and b!1117866 res!746035) b!1117865))

(assert (= (and b!1117865 res!746037) b!1117871))

(assert (= (and b!1117871 res!746042) b!1117874))

(assert (= (and b!1117874 res!746038) b!1117869))

(assert (= (and b!1117869 res!746040) b!1117873))

(assert (= (and b!1117873 res!746039) b!1117864))

(assert (= (and b!1117864 res!746043) b!1117868))

(assert (= (and b!1117868 res!746036) b!1117870))

(assert (= (and b!1117870 res!746044) b!1117867))

(assert (= (and b!1117872 condMapEmpty!43687) mapIsEmpty!43687))

(assert (= (and b!1117872 (not condMapEmpty!43687)) mapNonEmpty!43687))

(get-info :version)

(assert (= (and mapNonEmpty!43687 ((_ is ValueCellFull!13247) mapValue!43687)) b!1117875))

(assert (= (and b!1117872 ((_ is ValueCellFull!13247) mapDefault!43687)) b!1117876))

(assert (= start!97918 b!1117872))

(declare-fun m!1034385 () Bool)

(assert (=> b!1117864 m!1034385))

(declare-fun m!1034387 () Bool)

(assert (=> b!1117866 m!1034387))

(declare-fun m!1034389 () Bool)

(assert (=> b!1117871 m!1034389))

(declare-fun m!1034391 () Bool)

(assert (=> b!1117874 m!1034391))

(declare-fun m!1034393 () Bool)

(assert (=> mapNonEmpty!43687 m!1034393))

(declare-fun m!1034395 () Bool)

(assert (=> start!97918 m!1034395))

(declare-fun m!1034397 () Bool)

(assert (=> start!97918 m!1034397))

(declare-fun m!1034399 () Bool)

(assert (=> b!1117873 m!1034399))

(declare-fun m!1034401 () Bool)

(assert (=> b!1117870 m!1034401))

(declare-fun m!1034403 () Bool)

(assert (=> b!1117867 m!1034403))

(declare-fun m!1034405 () Bool)

(assert (=> b!1117867 m!1034405))

(declare-fun m!1034407 () Bool)

(assert (=> b!1117868 m!1034407))

(declare-fun m!1034409 () Bool)

(assert (=> b!1117868 m!1034409))

(check-sat (not mapNonEmpty!43687) (not b!1117871) (not b!1117868) (not b!1117867) (not b!1117874) (not b!1117866) (not b!1117870) (not b!1117873) tp_is_empty!27913 (not start!97918))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97468 () Bool)

(assert start!97468)

(declare-fun b!1107865 () Bool)

(declare-fun res!738968 () Bool)

(declare-fun e!632275 () Bool)

(assert (=> b!1107865 (=> (not res!738968) (not e!632275))))

(declare-datatypes ((array!71879 0))(
  ( (array!71880 (arr!34586 (Array (_ BitVec 32) (_ BitVec 64))) (size!35123 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71879)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41745 0))(
  ( (V!41746 (val!13788 Int)) )
))
(declare-datatypes ((ValueCell!13022 0))(
  ( (ValueCellFull!13022 (v!16417 V!41745)) (EmptyCell!13022) )
))
(declare-datatypes ((array!71881 0))(
  ( (array!71882 (arr!34587 (Array (_ BitVec 32) ValueCell!13022)) (size!35124 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71881)

(assert (=> b!1107865 (= res!738968 (and (= (size!35124 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35123 _keys!1208) (size!35124 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!738965 () Bool)

(assert (=> start!97468 (=> (not res!738965) (not e!632275))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97468 (= res!738965 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35123 _keys!1208))))))

(assert (=> start!97468 e!632275))

(declare-fun array_inv!26650 (array!71879) Bool)

(assert (=> start!97468 (array_inv!26650 _keys!1208)))

(assert (=> start!97468 true))

(declare-fun e!632276 () Bool)

(declare-fun array_inv!26651 (array!71881) Bool)

(assert (=> start!97468 (and (array_inv!26651 _values!996) e!632276)))

(declare-fun b!1107866 () Bool)

(declare-fun e!632280 () Bool)

(declare-fun mapRes!43012 () Bool)

(assert (=> b!1107866 (= e!632276 (and e!632280 mapRes!43012))))

(declare-fun condMapEmpty!43012 () Bool)

(declare-fun mapDefault!43012 () ValueCell!13022)

(assert (=> b!1107866 (= condMapEmpty!43012 (= (arr!34587 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13022)) mapDefault!43012)))))

(declare-fun mapNonEmpty!43012 () Bool)

(declare-fun tp!81932 () Bool)

(declare-fun e!632277 () Bool)

(assert (=> mapNonEmpty!43012 (= mapRes!43012 (and tp!81932 e!632277))))

(declare-fun mapRest!43012 () (Array (_ BitVec 32) ValueCell!13022))

(declare-fun mapKey!43012 () (_ BitVec 32))

(declare-fun mapValue!43012 () ValueCell!13022)

(assert (=> mapNonEmpty!43012 (= (arr!34587 _values!996) (store mapRest!43012 mapKey!43012 mapValue!43012))))

(declare-fun b!1107867 () Bool)

(declare-fun res!738963 () Bool)

(assert (=> b!1107867 (=> (not res!738963) (not e!632275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71879 (_ BitVec 32)) Bool)

(assert (=> b!1107867 (= res!738963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107868 () Bool)

(declare-fun tp_is_empty!27463 () Bool)

(assert (=> b!1107868 (= e!632280 tp_is_empty!27463)))

(declare-fun b!1107869 () Bool)

(declare-fun res!738964 () Bool)

(assert (=> b!1107869 (=> (not res!738964) (not e!632275))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107869 (= res!738964 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35123 _keys!1208))))))

(declare-fun b!1107870 () Bool)

(declare-fun res!738962 () Bool)

(assert (=> b!1107870 (=> (not res!738962) (not e!632275))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1107870 (= res!738962 (= (select (arr!34586 _keys!1208) i!673) k0!934))))

(declare-fun b!1107871 () Bool)

(declare-fun res!738970 () Bool)

(assert (=> b!1107871 (=> (not res!738970) (not e!632275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107871 (= res!738970 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43012 () Bool)

(assert (=> mapIsEmpty!43012 mapRes!43012))

(declare-fun b!1107872 () Bool)

(declare-fun e!632278 () Bool)

(assert (=> b!1107872 (= e!632278 (not true))))

(declare-fun arrayContainsKey!0 (array!71879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107872 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36305 0))(
  ( (Unit!36306) )
))
(declare-fun lt!495991 () Unit!36305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71879 (_ BitVec 64) (_ BitVec 32)) Unit!36305)

(assert (=> b!1107872 (= lt!495991 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107873 () Bool)

(declare-fun res!738967 () Bool)

(assert (=> b!1107873 (=> (not res!738967) (not e!632278))))

(declare-fun lt!495990 () array!71879)

(declare-datatypes ((List!24117 0))(
  ( (Nil!24114) (Cons!24113 (h!25331 (_ BitVec 64)) (t!34374 List!24117)) )
))
(declare-fun arrayNoDuplicates!0 (array!71879 (_ BitVec 32) List!24117) Bool)

(assert (=> b!1107873 (= res!738967 (arrayNoDuplicates!0 lt!495990 #b00000000000000000000000000000000 Nil!24114))))

(declare-fun b!1107874 () Bool)

(assert (=> b!1107874 (= e!632277 tp_is_empty!27463)))

(declare-fun b!1107875 () Bool)

(declare-fun res!738961 () Bool)

(assert (=> b!1107875 (=> (not res!738961) (not e!632275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107875 (= res!738961 (validMask!0 mask!1564))))

(declare-fun b!1107876 () Bool)

(declare-fun res!738969 () Bool)

(assert (=> b!1107876 (=> (not res!738969) (not e!632275))))

(assert (=> b!1107876 (= res!738969 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24114))))

(declare-fun b!1107877 () Bool)

(assert (=> b!1107877 (= e!632275 e!632278)))

(declare-fun res!738966 () Bool)

(assert (=> b!1107877 (=> (not res!738966) (not e!632278))))

(assert (=> b!1107877 (= res!738966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495990 mask!1564))))

(assert (=> b!1107877 (= lt!495990 (array!71880 (store (arr!34586 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35123 _keys!1208)))))

(assert (= (and start!97468 res!738965) b!1107875))

(assert (= (and b!1107875 res!738961) b!1107865))

(assert (= (and b!1107865 res!738968) b!1107867))

(assert (= (and b!1107867 res!738963) b!1107876))

(assert (= (and b!1107876 res!738969) b!1107869))

(assert (= (and b!1107869 res!738964) b!1107871))

(assert (= (and b!1107871 res!738970) b!1107870))

(assert (= (and b!1107870 res!738962) b!1107877))

(assert (= (and b!1107877 res!738966) b!1107873))

(assert (= (and b!1107873 res!738967) b!1107872))

(assert (= (and b!1107866 condMapEmpty!43012) mapIsEmpty!43012))

(assert (= (and b!1107866 (not condMapEmpty!43012)) mapNonEmpty!43012))

(get-info :version)

(assert (= (and mapNonEmpty!43012 ((_ is ValueCellFull!13022) mapValue!43012)) b!1107874))

(assert (= (and b!1107866 ((_ is ValueCellFull!13022) mapDefault!43012)) b!1107868))

(assert (= start!97468 b!1107866))

(declare-fun m!1027239 () Bool)

(assert (=> b!1107867 m!1027239))

(declare-fun m!1027241 () Bool)

(assert (=> b!1107875 m!1027241))

(declare-fun m!1027243 () Bool)

(assert (=> b!1107877 m!1027243))

(declare-fun m!1027245 () Bool)

(assert (=> b!1107877 m!1027245))

(declare-fun m!1027247 () Bool)

(assert (=> b!1107872 m!1027247))

(declare-fun m!1027249 () Bool)

(assert (=> b!1107872 m!1027249))

(declare-fun m!1027251 () Bool)

(assert (=> mapNonEmpty!43012 m!1027251))

(declare-fun m!1027253 () Bool)

(assert (=> start!97468 m!1027253))

(declare-fun m!1027255 () Bool)

(assert (=> start!97468 m!1027255))

(declare-fun m!1027257 () Bool)

(assert (=> b!1107870 m!1027257))

(declare-fun m!1027259 () Bool)

(assert (=> b!1107873 m!1027259))

(declare-fun m!1027261 () Bool)

(assert (=> b!1107871 m!1027261))

(declare-fun m!1027263 () Bool)

(assert (=> b!1107876 m!1027263))

(check-sat (not b!1107872) (not b!1107875) (not b!1107876) (not b!1107867) (not b!1107877) tp_is_empty!27463 (not b!1107871) (not b!1107873) (not mapNonEmpty!43012) (not start!97468))
(check-sat)

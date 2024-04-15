; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99074 () Bool)

(assert start!99074)

(declare-fun b_free!24685 () Bool)

(declare-fun b_next!24685 () Bool)

(assert (=> start!99074 (= b_free!24685 (not b_next!24685))))

(declare-fun tp!86765 () Bool)

(declare-fun b_and!40197 () Bool)

(assert (=> start!99074 (= tp!86765 b_and!40197)))

(declare-fun res!772684 () Bool)

(declare-fun e!662345 () Bool)

(assert (=> start!99074 (=> (not res!772684) (not e!662345))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75186 0))(
  ( (array!75187 (arr!36244 (Array (_ BitVec 32) (_ BitVec 64))) (size!36782 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75186)

(assert (=> start!99074 (= res!772684 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36782 _keys!1208))))))

(assert (=> start!99074 e!662345))

(declare-fun tp_is_empty!29215 () Bool)

(assert (=> start!99074 tp_is_empty!29215))

(declare-fun array_inv!27822 (array!75186) Bool)

(assert (=> start!99074 (array_inv!27822 _keys!1208)))

(assert (=> start!99074 true))

(assert (=> start!99074 tp!86765))

(declare-datatypes ((V!44081 0))(
  ( (V!44082 (val!14664 Int)) )
))
(declare-datatypes ((ValueCell!13898 0))(
  ( (ValueCellFull!13898 (v!17300 V!44081)) (EmptyCell!13898) )
))
(declare-datatypes ((array!75188 0))(
  ( (array!75189 (arr!36245 (Array (_ BitVec 32) ValueCell!13898)) (size!36783 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75188)

(declare-fun e!662347 () Bool)

(declare-fun array_inv!27823 (array!75188) Bool)

(assert (=> start!99074 (and (array_inv!27823 _values!996) e!662347)))

(declare-fun b!1165070 () Bool)

(declare-fun e!662348 () Bool)

(assert (=> b!1165070 (= e!662348 true)))

(declare-fun zeroValue!944 () V!44081)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!524652 () array!75186)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18786 0))(
  ( (tuple2!18787 (_1!9404 (_ BitVec 64)) (_2!9404 V!44081)) )
))
(declare-datatypes ((List!25504 0))(
  ( (Nil!25501) (Cons!25500 (h!26709 tuple2!18786) (t!37172 List!25504)) )
))
(declare-datatypes ((ListLongMap!16755 0))(
  ( (ListLongMap!16756 (toList!8393 List!25504)) )
))
(declare-fun lt!524654 () ListLongMap!16755)

(declare-fun minValue!944 () V!44081)

(declare-fun getCurrentListMapNoExtraKeys!4869 (array!75186 array!75188 (_ BitVec 32) (_ BitVec 32) V!44081 V!44081 (_ BitVec 32) Int) ListLongMap!16755)

(declare-fun dynLambda!2802 (Int (_ BitVec 64)) V!44081)

(assert (=> b!1165070 (= lt!524654 (getCurrentListMapNoExtraKeys!4869 lt!524652 (array!75189 (store (arr!36245 _values!996) i!673 (ValueCellFull!13898 (dynLambda!2802 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36783 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524653 () ListLongMap!16755)

(assert (=> b!1165070 (= lt!524653 (getCurrentListMapNoExtraKeys!4869 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165071 () Bool)

(declare-fun e!662346 () Bool)

(assert (=> b!1165071 (= e!662346 tp_is_empty!29215)))

(declare-fun b!1165072 () Bool)

(declare-fun res!772691 () Bool)

(assert (=> b!1165072 (=> (not res!772691) (not e!662345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165072 (= res!772691 (validMask!0 mask!1564))))

(declare-fun b!1165073 () Bool)

(declare-fun res!772690 () Bool)

(declare-fun e!662343 () Bool)

(assert (=> b!1165073 (=> (not res!772690) (not e!662343))))

(declare-datatypes ((List!25505 0))(
  ( (Nil!25502) (Cons!25501 (h!26710 (_ BitVec 64)) (t!37173 List!25505)) )
))
(declare-fun arrayNoDuplicates!0 (array!75186 (_ BitVec 32) List!25505) Bool)

(assert (=> b!1165073 (= res!772690 (arrayNoDuplicates!0 lt!524652 #b00000000000000000000000000000000 Nil!25502))))

(declare-fun b!1165074 () Bool)

(declare-fun res!772686 () Bool)

(assert (=> b!1165074 (=> (not res!772686) (not e!662345))))

(assert (=> b!1165074 (= res!772686 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36782 _keys!1208))))))

(declare-fun b!1165075 () Bool)

(declare-fun mapRes!45647 () Bool)

(assert (=> b!1165075 (= e!662347 (and e!662346 mapRes!45647))))

(declare-fun condMapEmpty!45647 () Bool)

(declare-fun mapDefault!45647 () ValueCell!13898)

(assert (=> b!1165075 (= condMapEmpty!45647 (= (arr!36245 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13898)) mapDefault!45647)))))

(declare-fun b!1165076 () Bool)

(declare-fun res!772681 () Bool)

(assert (=> b!1165076 (=> (not res!772681) (not e!662345))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165076 (= res!772681 (validKeyInArray!0 k0!934))))

(declare-fun b!1165077 () Bool)

(assert (=> b!1165077 (= e!662345 e!662343)))

(declare-fun res!772688 () Bool)

(assert (=> b!1165077 (=> (not res!772688) (not e!662343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75186 (_ BitVec 32)) Bool)

(assert (=> b!1165077 (= res!772688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524652 mask!1564))))

(assert (=> b!1165077 (= lt!524652 (array!75187 (store (arr!36244 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36782 _keys!1208)))))

(declare-fun mapIsEmpty!45647 () Bool)

(assert (=> mapIsEmpty!45647 mapRes!45647))

(declare-fun b!1165078 () Bool)

(declare-fun res!772689 () Bool)

(assert (=> b!1165078 (=> (not res!772689) (not e!662345))))

(assert (=> b!1165078 (= res!772689 (and (= (size!36783 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36782 _keys!1208) (size!36783 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165079 () Bool)

(declare-fun res!772685 () Bool)

(assert (=> b!1165079 (=> (not res!772685) (not e!662345))))

(assert (=> b!1165079 (= res!772685 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25502))))

(declare-fun b!1165080 () Bool)

(assert (=> b!1165080 (= e!662343 (not e!662348))))

(declare-fun res!772687 () Bool)

(assert (=> b!1165080 (=> res!772687 e!662348)))

(assert (=> b!1165080 (= res!772687 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165080 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38281 0))(
  ( (Unit!38282) )
))
(declare-fun lt!524655 () Unit!38281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75186 (_ BitVec 64) (_ BitVec 32)) Unit!38281)

(assert (=> b!1165080 (= lt!524655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165081 () Bool)

(declare-fun e!662349 () Bool)

(assert (=> b!1165081 (= e!662349 tp_is_empty!29215)))

(declare-fun b!1165082 () Bool)

(declare-fun res!772682 () Bool)

(assert (=> b!1165082 (=> (not res!772682) (not e!662345))))

(assert (=> b!1165082 (= res!772682 (= (select (arr!36244 _keys!1208) i!673) k0!934))))

(declare-fun b!1165083 () Bool)

(declare-fun res!772683 () Bool)

(assert (=> b!1165083 (=> (not res!772683) (not e!662345))))

(assert (=> b!1165083 (= res!772683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45647 () Bool)

(declare-fun tp!86766 () Bool)

(assert (=> mapNonEmpty!45647 (= mapRes!45647 (and tp!86766 e!662349))))

(declare-fun mapValue!45647 () ValueCell!13898)

(declare-fun mapRest!45647 () (Array (_ BitVec 32) ValueCell!13898))

(declare-fun mapKey!45647 () (_ BitVec 32))

(assert (=> mapNonEmpty!45647 (= (arr!36245 _values!996) (store mapRest!45647 mapKey!45647 mapValue!45647))))

(assert (= (and start!99074 res!772684) b!1165072))

(assert (= (and b!1165072 res!772691) b!1165078))

(assert (= (and b!1165078 res!772689) b!1165083))

(assert (= (and b!1165083 res!772683) b!1165079))

(assert (= (and b!1165079 res!772685) b!1165074))

(assert (= (and b!1165074 res!772686) b!1165076))

(assert (= (and b!1165076 res!772681) b!1165082))

(assert (= (and b!1165082 res!772682) b!1165077))

(assert (= (and b!1165077 res!772688) b!1165073))

(assert (= (and b!1165073 res!772690) b!1165080))

(assert (= (and b!1165080 (not res!772687)) b!1165070))

(assert (= (and b!1165075 condMapEmpty!45647) mapIsEmpty!45647))

(assert (= (and b!1165075 (not condMapEmpty!45647)) mapNonEmpty!45647))

(get-info :version)

(assert (= (and mapNonEmpty!45647 ((_ is ValueCellFull!13898) mapValue!45647)) b!1165081))

(assert (= (and b!1165075 ((_ is ValueCellFull!13898) mapDefault!45647)) b!1165071))

(assert (= start!99074 b!1165075))

(declare-fun b_lambda!19773 () Bool)

(assert (=> (not b_lambda!19773) (not b!1165070)))

(declare-fun t!37171 () Bool)

(declare-fun tb!9489 () Bool)

(assert (=> (and start!99074 (= defaultEntry!1004 defaultEntry!1004) t!37171) tb!9489))

(declare-fun result!19551 () Bool)

(assert (=> tb!9489 (= result!19551 tp_is_empty!29215)))

(assert (=> b!1165070 t!37171))

(declare-fun b_and!40199 () Bool)

(assert (= b_and!40197 (and (=> t!37171 result!19551) b_and!40199)))

(declare-fun m!1072837 () Bool)

(assert (=> b!1165072 m!1072837))

(declare-fun m!1072839 () Bool)

(assert (=> b!1165070 m!1072839))

(declare-fun m!1072841 () Bool)

(assert (=> b!1165070 m!1072841))

(declare-fun m!1072843 () Bool)

(assert (=> b!1165070 m!1072843))

(declare-fun m!1072845 () Bool)

(assert (=> b!1165070 m!1072845))

(declare-fun m!1072847 () Bool)

(assert (=> b!1165076 m!1072847))

(declare-fun m!1072849 () Bool)

(assert (=> b!1165077 m!1072849))

(declare-fun m!1072851 () Bool)

(assert (=> b!1165077 m!1072851))

(declare-fun m!1072853 () Bool)

(assert (=> start!99074 m!1072853))

(declare-fun m!1072855 () Bool)

(assert (=> start!99074 m!1072855))

(declare-fun m!1072857 () Bool)

(assert (=> b!1165080 m!1072857))

(declare-fun m!1072859 () Bool)

(assert (=> b!1165080 m!1072859))

(declare-fun m!1072861 () Bool)

(assert (=> mapNonEmpty!45647 m!1072861))

(declare-fun m!1072863 () Bool)

(assert (=> b!1165073 m!1072863))

(declare-fun m!1072865 () Bool)

(assert (=> b!1165082 m!1072865))

(declare-fun m!1072867 () Bool)

(assert (=> b!1165079 m!1072867))

(declare-fun m!1072869 () Bool)

(assert (=> b!1165083 m!1072869))

(check-sat (not b!1165080) b_and!40199 (not b!1165076) tp_is_empty!29215 (not b!1165083) (not b!1165079) (not start!99074) (not b!1165077) (not b!1165073) (not b!1165070) (not b_lambda!19773) (not b!1165072) (not mapNonEmpty!45647) (not b_next!24685))
(check-sat b_and!40199 (not b_next!24685))

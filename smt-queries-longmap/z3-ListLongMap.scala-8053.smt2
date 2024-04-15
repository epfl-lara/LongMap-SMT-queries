; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99152 () Bool)

(assert start!99152)

(declare-fun b_free!24763 () Bool)

(declare-fun b_next!24763 () Bool)

(assert (=> start!99152 (= b_free!24763 (not b_next!24763))))

(declare-fun tp!86999 () Bool)

(declare-fun b_and!40353 () Bool)

(assert (=> start!99152 (= tp!86999 b_and!40353)))

(declare-fun b!1166861 () Bool)

(declare-fun res!774045 () Bool)

(declare-fun e!663243 () Bool)

(assert (=> b!1166861 (=> (not res!774045) (not e!663243))))

(declare-datatypes ((array!75338 0))(
  ( (array!75339 (arr!36320 (Array (_ BitVec 32) (_ BitVec 64))) (size!36858 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75338)

(declare-datatypes ((List!25563 0))(
  ( (Nil!25560) (Cons!25559 (h!26768 (_ BitVec 64)) (t!37309 List!25563)) )
))
(declare-fun arrayNoDuplicates!0 (array!75338 (_ BitVec 32) List!25563) Bool)

(assert (=> b!1166861 (= res!774045 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25560))))

(declare-fun b!1166862 () Bool)

(declare-fun e!663242 () Bool)

(declare-fun e!663237 () Bool)

(assert (=> b!1166862 (= e!663242 (not e!663237))))

(declare-fun res!774046 () Bool)

(assert (=> b!1166862 (=> res!774046 e!663237)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166862 (= res!774046 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166862 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38331 0))(
  ( (Unit!38332) )
))
(declare-fun lt!525269 () Unit!38331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75338 (_ BitVec 64) (_ BitVec 32)) Unit!38331)

(assert (=> b!1166862 (= lt!525269 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45764 () Bool)

(declare-fun mapRes!45764 () Bool)

(assert (=> mapIsEmpty!45764 mapRes!45764))

(declare-fun b!1166863 () Bool)

(assert (=> b!1166863 (= e!663243 e!663242)))

(declare-fun res!774044 () Bool)

(assert (=> b!1166863 (=> (not res!774044) (not e!663242))))

(declare-fun lt!525268 () array!75338)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75338 (_ BitVec 32)) Bool)

(assert (=> b!1166863 (= res!774044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525268 mask!1564))))

(assert (=> b!1166863 (= lt!525268 (array!75339 (store (arr!36320 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36858 _keys!1208)))))

(declare-fun b!1166864 () Bool)

(declare-fun e!663238 () Bool)

(declare-fun e!663241 () Bool)

(assert (=> b!1166864 (= e!663238 (and e!663241 mapRes!45764))))

(declare-fun condMapEmpty!45764 () Bool)

(declare-datatypes ((V!44185 0))(
  ( (V!44186 (val!14703 Int)) )
))
(declare-datatypes ((ValueCell!13937 0))(
  ( (ValueCellFull!13937 (v!17339 V!44185)) (EmptyCell!13937) )
))
(declare-datatypes ((array!75340 0))(
  ( (array!75341 (arr!36321 (Array (_ BitVec 32) ValueCell!13937)) (size!36859 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75340)

(declare-fun mapDefault!45764 () ValueCell!13937)

(assert (=> b!1166864 (= condMapEmpty!45764 (= (arr!36321 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13937)) mapDefault!45764)))))

(declare-fun b!1166865 () Bool)

(declare-fun res!774049 () Bool)

(assert (=> b!1166865 (=> (not res!774049) (not e!663243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166865 (= res!774049 (validMask!0 mask!1564))))

(declare-fun b!1166866 () Bool)

(declare-fun res!774053 () Bool)

(assert (=> b!1166866 (=> (not res!774053) (not e!663243))))

(assert (=> b!1166866 (= res!774053 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36858 _keys!1208))))))

(declare-fun b!1166867 () Bool)

(declare-fun res!774048 () Bool)

(assert (=> b!1166867 (=> (not res!774048) (not e!663243))))

(assert (=> b!1166867 (= res!774048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166868 () Bool)

(declare-fun e!663239 () Bool)

(assert (=> b!1166868 (= e!663237 e!663239)))

(declare-fun res!774042 () Bool)

(assert (=> b!1166868 (=> res!774042 e!663239)))

(assert (=> b!1166868 (= res!774042 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44185)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525272 () array!75340)

(declare-datatypes ((tuple2!18846 0))(
  ( (tuple2!18847 (_1!9434 (_ BitVec 64)) (_2!9434 V!44185)) )
))
(declare-datatypes ((List!25564 0))(
  ( (Nil!25561) (Cons!25560 (h!26769 tuple2!18846) (t!37310 List!25564)) )
))
(declare-datatypes ((ListLongMap!16815 0))(
  ( (ListLongMap!16816 (toList!8423 List!25564)) )
))
(declare-fun lt!525271 () ListLongMap!16815)

(declare-fun minValue!944 () V!44185)

(declare-fun getCurrentListMapNoExtraKeys!4899 (array!75338 array!75340 (_ BitVec 32) (_ BitVec 32) V!44185 V!44185 (_ BitVec 32) Int) ListLongMap!16815)

(assert (=> b!1166868 (= lt!525271 (getCurrentListMapNoExtraKeys!4899 lt!525268 lt!525272 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2832 (Int (_ BitVec 64)) V!44185)

(assert (=> b!1166868 (= lt!525272 (array!75341 (store (arr!36321 _values!996) i!673 (ValueCellFull!13937 (dynLambda!2832 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36859 _values!996)))))

(declare-fun lt!525270 () ListLongMap!16815)

(assert (=> b!1166868 (= lt!525270 (getCurrentListMapNoExtraKeys!4899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166869 () Bool)

(declare-fun e!663236 () Bool)

(declare-fun tp_is_empty!29293 () Bool)

(assert (=> b!1166869 (= e!663236 tp_is_empty!29293)))

(declare-fun b!1166870 () Bool)

(assert (=> b!1166870 (= e!663239 true)))

(declare-fun -!1433 (ListLongMap!16815 (_ BitVec 64)) ListLongMap!16815)

(assert (=> b!1166870 (= (getCurrentListMapNoExtraKeys!4899 lt!525268 lt!525272 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1433 (getCurrentListMapNoExtraKeys!4899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525273 () Unit!38331)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!697 (array!75338 array!75340 (_ BitVec 32) (_ BitVec 32) V!44185 V!44185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38331)

(assert (=> b!1166870 (= lt!525273 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!697 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166860 () Bool)

(assert (=> b!1166860 (= e!663241 tp_is_empty!29293)))

(declare-fun res!774052 () Bool)

(assert (=> start!99152 (=> (not res!774052) (not e!663243))))

(assert (=> start!99152 (= res!774052 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36858 _keys!1208))))))

(assert (=> start!99152 e!663243))

(assert (=> start!99152 tp_is_empty!29293))

(declare-fun array_inv!27872 (array!75338) Bool)

(assert (=> start!99152 (array_inv!27872 _keys!1208)))

(assert (=> start!99152 true))

(assert (=> start!99152 tp!86999))

(declare-fun array_inv!27873 (array!75340) Bool)

(assert (=> start!99152 (and (array_inv!27873 _values!996) e!663238)))

(declare-fun b!1166871 () Bool)

(declare-fun res!774047 () Bool)

(assert (=> b!1166871 (=> (not res!774047) (not e!663243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166871 (= res!774047 (validKeyInArray!0 k0!934))))

(declare-fun b!1166872 () Bool)

(declare-fun res!774050 () Bool)

(assert (=> b!1166872 (=> (not res!774050) (not e!663242))))

(assert (=> b!1166872 (= res!774050 (arrayNoDuplicates!0 lt!525268 #b00000000000000000000000000000000 Nil!25560))))

(declare-fun b!1166873 () Bool)

(declare-fun res!774051 () Bool)

(assert (=> b!1166873 (=> (not res!774051) (not e!663243))))

(assert (=> b!1166873 (= res!774051 (= (select (arr!36320 _keys!1208) i!673) k0!934))))

(declare-fun b!1166874 () Bool)

(declare-fun res!774043 () Bool)

(assert (=> b!1166874 (=> (not res!774043) (not e!663243))))

(assert (=> b!1166874 (= res!774043 (and (= (size!36859 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36858 _keys!1208) (size!36859 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45764 () Bool)

(declare-fun tp!87000 () Bool)

(assert (=> mapNonEmpty!45764 (= mapRes!45764 (and tp!87000 e!663236))))

(declare-fun mapValue!45764 () ValueCell!13937)

(declare-fun mapRest!45764 () (Array (_ BitVec 32) ValueCell!13937))

(declare-fun mapKey!45764 () (_ BitVec 32))

(assert (=> mapNonEmpty!45764 (= (arr!36321 _values!996) (store mapRest!45764 mapKey!45764 mapValue!45764))))

(assert (= (and start!99152 res!774052) b!1166865))

(assert (= (and b!1166865 res!774049) b!1166874))

(assert (= (and b!1166874 res!774043) b!1166867))

(assert (= (and b!1166867 res!774048) b!1166861))

(assert (= (and b!1166861 res!774045) b!1166866))

(assert (= (and b!1166866 res!774053) b!1166871))

(assert (= (and b!1166871 res!774047) b!1166873))

(assert (= (and b!1166873 res!774051) b!1166863))

(assert (= (and b!1166863 res!774044) b!1166872))

(assert (= (and b!1166872 res!774050) b!1166862))

(assert (= (and b!1166862 (not res!774046)) b!1166868))

(assert (= (and b!1166868 (not res!774042)) b!1166870))

(assert (= (and b!1166864 condMapEmpty!45764) mapIsEmpty!45764))

(assert (= (and b!1166864 (not condMapEmpty!45764)) mapNonEmpty!45764))

(get-info :version)

(assert (= (and mapNonEmpty!45764 ((_ is ValueCellFull!13937) mapValue!45764)) b!1166869))

(assert (= (and b!1166864 ((_ is ValueCellFull!13937) mapDefault!45764)) b!1166860))

(assert (= start!99152 b!1166864))

(declare-fun b_lambda!19851 () Bool)

(assert (=> (not b_lambda!19851) (not b!1166868)))

(declare-fun t!37308 () Bool)

(declare-fun tb!9567 () Bool)

(assert (=> (and start!99152 (= defaultEntry!1004 defaultEntry!1004) t!37308) tb!9567))

(declare-fun result!19707 () Bool)

(assert (=> tb!9567 (= result!19707 tp_is_empty!29293)))

(assert (=> b!1166868 t!37308))

(declare-fun b_and!40355 () Bool)

(assert (= b_and!40353 (and (=> t!37308 result!19707) b_and!40355)))

(declare-fun m!1074355 () Bool)

(assert (=> b!1166872 m!1074355))

(declare-fun m!1074357 () Bool)

(assert (=> mapNonEmpty!45764 m!1074357))

(declare-fun m!1074359 () Bool)

(assert (=> b!1166865 m!1074359))

(declare-fun m!1074361 () Bool)

(assert (=> b!1166861 m!1074361))

(declare-fun m!1074363 () Bool)

(assert (=> b!1166868 m!1074363))

(declare-fun m!1074365 () Bool)

(assert (=> b!1166868 m!1074365))

(declare-fun m!1074367 () Bool)

(assert (=> b!1166868 m!1074367))

(declare-fun m!1074369 () Bool)

(assert (=> b!1166868 m!1074369))

(declare-fun m!1074371 () Bool)

(assert (=> b!1166871 m!1074371))

(declare-fun m!1074373 () Bool)

(assert (=> b!1166870 m!1074373))

(declare-fun m!1074375 () Bool)

(assert (=> b!1166870 m!1074375))

(assert (=> b!1166870 m!1074375))

(declare-fun m!1074377 () Bool)

(assert (=> b!1166870 m!1074377))

(declare-fun m!1074379 () Bool)

(assert (=> b!1166870 m!1074379))

(declare-fun m!1074381 () Bool)

(assert (=> b!1166867 m!1074381))

(declare-fun m!1074383 () Bool)

(assert (=> b!1166862 m!1074383))

(declare-fun m!1074385 () Bool)

(assert (=> b!1166862 m!1074385))

(declare-fun m!1074387 () Bool)

(assert (=> b!1166873 m!1074387))

(declare-fun m!1074389 () Bool)

(assert (=> b!1166863 m!1074389))

(declare-fun m!1074391 () Bool)

(assert (=> b!1166863 m!1074391))

(declare-fun m!1074393 () Bool)

(assert (=> start!99152 m!1074393))

(declare-fun m!1074395 () Bool)

(assert (=> start!99152 m!1074395))

(check-sat (not b!1166867) (not b!1166870) (not start!99152) (not b!1166865) (not b!1166861) (not b!1166863) (not b_lambda!19851) tp_is_empty!29293 (not b!1166871) (not b!1166872) (not b!1166868) b_and!40355 (not b!1166862) (not b_next!24763) (not mapNonEmpty!45764))
(check-sat b_and!40355 (not b_next!24763))

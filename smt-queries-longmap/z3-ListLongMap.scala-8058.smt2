; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99424 () Bool)

(assert start!99424)

(declare-fun b_free!24793 () Bool)

(declare-fun b_next!24793 () Bool)

(assert (=> start!99424 (= b_free!24793 (not b_next!24793))))

(declare-fun tp!87090 () Bool)

(declare-fun b_and!40437 () Bool)

(assert (=> start!99424 (= tp!87090 b_and!40437)))

(declare-fun b!1168978 () Bool)

(declare-fun e!664512 () Bool)

(declare-fun e!664509 () Bool)

(assert (=> b!1168978 (= e!664512 e!664509)))

(declare-fun res!775158 () Bool)

(assert (=> b!1168978 (=> res!775158 e!664509)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168978 (= res!775158 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44225 0))(
  ( (V!44226 (val!14718 Int)) )
))
(declare-fun zeroValue!944 () V!44225)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13952 0))(
  ( (ValueCellFull!13952 (v!17351 V!44225)) (EmptyCell!13952) )
))
(declare-datatypes ((array!75519 0))(
  ( (array!75520 (arr!36404 (Array (_ BitVec 32) ValueCell!13952)) (size!36941 (_ BitVec 32))) )
))
(declare-fun lt!526215 () array!75519)

(declare-fun minValue!944 () V!44225)

(declare-datatypes ((tuple2!18812 0))(
  ( (tuple2!18813 (_1!9417 (_ BitVec 64)) (_2!9417 V!44225)) )
))
(declare-datatypes ((List!25552 0))(
  ( (Nil!25549) (Cons!25548 (h!26766 tuple2!18812) (t!37329 List!25552)) )
))
(declare-datatypes ((ListLongMap!16789 0))(
  ( (ListLongMap!16790 (toList!8410 List!25552)) )
))
(declare-fun lt!526216 () ListLongMap!16789)

(declare-datatypes ((array!75521 0))(
  ( (array!75522 (arr!36405 (Array (_ BitVec 32) (_ BitVec 64))) (size!36942 (_ BitVec 32))) )
))
(declare-fun lt!526214 () array!75521)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4901 (array!75521 array!75519 (_ BitVec 32) (_ BitVec 32) V!44225 V!44225 (_ BitVec 32) Int) ListLongMap!16789)

(assert (=> b!1168978 (= lt!526216 (getCurrentListMapNoExtraKeys!4901 lt!526214 lt!526215 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75519)

(declare-fun dynLambda!2888 (Int (_ BitVec 64)) V!44225)

(assert (=> b!1168978 (= lt!526215 (array!75520 (store (arr!36404 _values!996) i!673 (ValueCellFull!13952 (dynLambda!2888 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36941 _values!996)))))

(declare-fun _keys!1208 () array!75521)

(declare-fun lt!526217 () ListLongMap!16789)

(assert (=> b!1168978 (= lt!526217 (getCurrentListMapNoExtraKeys!4901 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!775157 () Bool)

(declare-fun e!664513 () Bool)

(assert (=> start!99424 (=> (not res!775157) (not e!664513))))

(assert (=> start!99424 (= res!775157 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36942 _keys!1208))))))

(assert (=> start!99424 e!664513))

(declare-fun tp_is_empty!29323 () Bool)

(assert (=> start!99424 tp_is_empty!29323))

(declare-fun array_inv!27908 (array!75521) Bool)

(assert (=> start!99424 (array_inv!27908 _keys!1208)))

(assert (=> start!99424 true))

(assert (=> start!99424 tp!87090))

(declare-fun e!664510 () Bool)

(declare-fun array_inv!27909 (array!75519) Bool)

(assert (=> start!99424 (and (array_inv!27909 _values!996) e!664510)))

(declare-fun mapIsEmpty!45809 () Bool)

(declare-fun mapRes!45809 () Bool)

(assert (=> mapIsEmpty!45809 mapRes!45809))

(declare-fun b!1168979 () Bool)

(declare-fun res!775166 () Bool)

(assert (=> b!1168979 (=> (not res!775166) (not e!664513))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168979 (= res!775166 (validKeyInArray!0 k0!934))))

(declare-fun b!1168980 () Bool)

(declare-fun res!775165 () Bool)

(assert (=> b!1168980 (=> (not res!775165) (not e!664513))))

(assert (=> b!1168980 (= res!775165 (and (= (size!36941 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36942 _keys!1208) (size!36941 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168981 () Bool)

(declare-fun e!664506 () Bool)

(assert (=> b!1168981 (= e!664506 tp_is_empty!29323)))

(declare-fun b!1168982 () Bool)

(assert (=> b!1168982 (= e!664509 true)))

(declare-fun -!1472 (ListLongMap!16789 (_ BitVec 64)) ListLongMap!16789)

(assert (=> b!1168982 (= (getCurrentListMapNoExtraKeys!4901 lt!526214 lt!526215 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1472 (getCurrentListMapNoExtraKeys!4901 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38515 0))(
  ( (Unit!38516) )
))
(declare-fun lt!526219 () Unit!38515)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!697 (array!75521 array!75519 (_ BitVec 32) (_ BitVec 32) V!44225 V!44225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38515)

(assert (=> b!1168982 (= lt!526219 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!697 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168983 () Bool)

(declare-fun e!664507 () Bool)

(assert (=> b!1168983 (= e!664513 e!664507)))

(declare-fun res!775163 () Bool)

(assert (=> b!1168983 (=> (not res!775163) (not e!664507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75521 (_ BitVec 32)) Bool)

(assert (=> b!1168983 (= res!775163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526214 mask!1564))))

(assert (=> b!1168983 (= lt!526214 (array!75522 (store (arr!36405 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36942 _keys!1208)))))

(declare-fun b!1168984 () Bool)

(declare-fun res!775160 () Bool)

(assert (=> b!1168984 (=> (not res!775160) (not e!664513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168984 (= res!775160 (validMask!0 mask!1564))))

(declare-fun b!1168985 () Bool)

(declare-fun res!775164 () Bool)

(assert (=> b!1168985 (=> (not res!775164) (not e!664513))))

(assert (=> b!1168985 (= res!775164 (= (select (arr!36405 _keys!1208) i!673) k0!934))))

(declare-fun b!1168986 () Bool)

(declare-fun e!664511 () Bool)

(assert (=> b!1168986 (= e!664510 (and e!664511 mapRes!45809))))

(declare-fun condMapEmpty!45809 () Bool)

(declare-fun mapDefault!45809 () ValueCell!13952)

(assert (=> b!1168986 (= condMapEmpty!45809 (= (arr!36404 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13952)) mapDefault!45809)))))

(declare-fun mapNonEmpty!45809 () Bool)

(declare-fun tp!87089 () Bool)

(assert (=> mapNonEmpty!45809 (= mapRes!45809 (and tp!87089 e!664506))))

(declare-fun mapRest!45809 () (Array (_ BitVec 32) ValueCell!13952))

(declare-fun mapKey!45809 () (_ BitVec 32))

(declare-fun mapValue!45809 () ValueCell!13952)

(assert (=> mapNonEmpty!45809 (= (arr!36404 _values!996) (store mapRest!45809 mapKey!45809 mapValue!45809))))

(declare-fun b!1168987 () Bool)

(declare-fun res!775156 () Bool)

(assert (=> b!1168987 (=> (not res!775156) (not e!664507))))

(declare-datatypes ((List!25553 0))(
  ( (Nil!25550) (Cons!25549 (h!26767 (_ BitVec 64)) (t!37330 List!25553)) )
))
(declare-fun arrayNoDuplicates!0 (array!75521 (_ BitVec 32) List!25553) Bool)

(assert (=> b!1168987 (= res!775156 (arrayNoDuplicates!0 lt!526214 #b00000000000000000000000000000000 Nil!25550))))

(declare-fun b!1168988 () Bool)

(declare-fun res!775162 () Bool)

(assert (=> b!1168988 (=> (not res!775162) (not e!664513))))

(assert (=> b!1168988 (= res!775162 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36942 _keys!1208))))))

(declare-fun b!1168989 () Bool)

(declare-fun res!775161 () Bool)

(assert (=> b!1168989 (=> (not res!775161) (not e!664513))))

(assert (=> b!1168989 (= res!775161 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25550))))

(declare-fun b!1168990 () Bool)

(assert (=> b!1168990 (= e!664507 (not e!664512))))

(declare-fun res!775167 () Bool)

(assert (=> b!1168990 (=> res!775167 e!664512)))

(assert (=> b!1168990 (= res!775167 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168990 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526218 () Unit!38515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75521 (_ BitVec 64) (_ BitVec 32)) Unit!38515)

(assert (=> b!1168990 (= lt!526218 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168991 () Bool)

(declare-fun res!775159 () Bool)

(assert (=> b!1168991 (=> (not res!775159) (not e!664513))))

(assert (=> b!1168991 (= res!775159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168992 () Bool)

(assert (=> b!1168992 (= e!664511 tp_is_empty!29323)))

(assert (= (and start!99424 res!775157) b!1168984))

(assert (= (and b!1168984 res!775160) b!1168980))

(assert (= (and b!1168980 res!775165) b!1168991))

(assert (= (and b!1168991 res!775159) b!1168989))

(assert (= (and b!1168989 res!775161) b!1168988))

(assert (= (and b!1168988 res!775162) b!1168979))

(assert (= (and b!1168979 res!775166) b!1168985))

(assert (= (and b!1168985 res!775164) b!1168983))

(assert (= (and b!1168983 res!775163) b!1168987))

(assert (= (and b!1168987 res!775156) b!1168990))

(assert (= (and b!1168990 (not res!775167)) b!1168978))

(assert (= (and b!1168978 (not res!775158)) b!1168982))

(assert (= (and b!1168986 condMapEmpty!45809) mapIsEmpty!45809))

(assert (= (and b!1168986 (not condMapEmpty!45809)) mapNonEmpty!45809))

(get-info :version)

(assert (= (and mapNonEmpty!45809 ((_ is ValueCellFull!13952) mapValue!45809)) b!1168981))

(assert (= (and b!1168986 ((_ is ValueCellFull!13952) mapDefault!45809)) b!1168992))

(assert (= start!99424 b!1168986))

(declare-fun b_lambda!19893 () Bool)

(assert (=> (not b_lambda!19893) (not b!1168978)))

(declare-fun t!37328 () Bool)

(declare-fun tb!9597 () Bool)

(assert (=> (and start!99424 (= defaultEntry!1004 defaultEntry!1004) t!37328) tb!9597))

(declare-fun result!19767 () Bool)

(assert (=> tb!9597 (= result!19767 tp_is_empty!29323)))

(assert (=> b!1168978 t!37328))

(declare-fun b_and!40439 () Bool)

(assert (= b_and!40437 (and (=> t!37328 result!19767) b_and!40439)))

(declare-fun m!1077167 () Bool)

(assert (=> b!1168989 m!1077167))

(declare-fun m!1077169 () Bool)

(assert (=> start!99424 m!1077169))

(declare-fun m!1077171 () Bool)

(assert (=> start!99424 m!1077171))

(declare-fun m!1077173 () Bool)

(assert (=> b!1168983 m!1077173))

(declare-fun m!1077175 () Bool)

(assert (=> b!1168983 m!1077175))

(declare-fun m!1077177 () Bool)

(assert (=> b!1168984 m!1077177))

(declare-fun m!1077179 () Bool)

(assert (=> b!1168987 m!1077179))

(declare-fun m!1077181 () Bool)

(assert (=> b!1168985 m!1077181))

(declare-fun m!1077183 () Bool)

(assert (=> b!1168990 m!1077183))

(declare-fun m!1077185 () Bool)

(assert (=> b!1168990 m!1077185))

(declare-fun m!1077187 () Bool)

(assert (=> mapNonEmpty!45809 m!1077187))

(declare-fun m!1077189 () Bool)

(assert (=> b!1168982 m!1077189))

(declare-fun m!1077191 () Bool)

(assert (=> b!1168982 m!1077191))

(assert (=> b!1168982 m!1077191))

(declare-fun m!1077193 () Bool)

(assert (=> b!1168982 m!1077193))

(declare-fun m!1077195 () Bool)

(assert (=> b!1168982 m!1077195))

(declare-fun m!1077197 () Bool)

(assert (=> b!1168978 m!1077197))

(declare-fun m!1077199 () Bool)

(assert (=> b!1168978 m!1077199))

(declare-fun m!1077201 () Bool)

(assert (=> b!1168978 m!1077201))

(declare-fun m!1077203 () Bool)

(assert (=> b!1168978 m!1077203))

(declare-fun m!1077205 () Bool)

(assert (=> b!1168979 m!1077205))

(declare-fun m!1077207 () Bool)

(assert (=> b!1168991 m!1077207))

(check-sat (not b!1168989) (not mapNonEmpty!45809) (not b!1168991) (not b!1168978) (not b_lambda!19893) (not b!1168979) (not b!1168990) (not b!1168987) tp_is_empty!29323 (not b!1168984) (not b!1168983) (not b_next!24793) (not start!99424) (not b!1168982) b_and!40439)
(check-sat b_and!40439 (not b_next!24793))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99462 () Bool)

(assert start!99462)

(declare-fun b_free!25041 () Bool)

(declare-fun b_next!25041 () Bool)

(assert (=> start!99462 (= b_free!25041 (not b_next!25041))))

(declare-fun tp!87837 () Bool)

(declare-fun b_and!40949 () Bool)

(assert (=> start!99462 (= tp!87837 b_and!40949)))

(declare-fun b!1175215 () Bool)

(declare-fun res!780482 () Bool)

(declare-fun e!668020 () Bool)

(assert (=> b!1175215 (=> (not res!780482) (not e!668020))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175215 (= res!780482 (validKeyInArray!0 k0!934))))

(declare-fun b!1175216 () Bool)

(declare-fun res!780490 () Bool)

(assert (=> b!1175216 (=> (not res!780490) (not e!668020))))

(declare-datatypes ((array!75953 0))(
  ( (array!75954 (arr!36626 (Array (_ BitVec 32) (_ BitVec 64))) (size!37162 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75953)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175216 (= res!780490 (= (select (arr!36626 _keys!1208) i!673) k0!934))))

(declare-fun b!1175217 () Bool)

(declare-fun res!780488 () Bool)

(assert (=> b!1175217 (=> (not res!780488) (not e!668020))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175217 (= res!780488 (validMask!0 mask!1564))))

(declare-fun b!1175218 () Bool)

(declare-fun res!780491 () Bool)

(assert (=> b!1175218 (=> (not res!780491) (not e!668020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75953 (_ BitVec 32)) Bool)

(assert (=> b!1175218 (= res!780491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175219 () Bool)

(declare-fun e!668016 () Bool)

(declare-fun arrayContainsKey!0 (array!75953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175219 (= e!668016 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175220 () Bool)

(declare-fun e!668018 () Bool)

(assert (=> b!1175220 (= e!668018 e!668016)))

(declare-fun res!780493 () Bool)

(assert (=> b!1175220 (=> res!780493 e!668016)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1175220 (= res!780493 (not (= (select (arr!36626 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175221 () Bool)

(declare-fun res!780485 () Bool)

(declare-fun e!668021 () Bool)

(assert (=> b!1175221 (=> (not res!780485) (not e!668021))))

(declare-fun lt!530136 () array!75953)

(declare-datatypes ((List!25718 0))(
  ( (Nil!25715) (Cons!25714 (h!26923 (_ BitVec 64)) (t!37751 List!25718)) )
))
(declare-fun arrayNoDuplicates!0 (array!75953 (_ BitVec 32) List!25718) Bool)

(assert (=> b!1175221 (= res!780485 (arrayNoDuplicates!0 lt!530136 #b00000000000000000000000000000000 Nil!25715))))

(declare-fun mapIsEmpty!46184 () Bool)

(declare-fun mapRes!46184 () Bool)

(assert (=> mapIsEmpty!46184 mapRes!46184))

(declare-fun b!1175222 () Bool)

(declare-fun e!668024 () Bool)

(assert (=> b!1175222 (= e!668024 true)))

(assert (=> b!1175222 (not (= (select (arr!36626 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38785 0))(
  ( (Unit!38786) )
))
(declare-fun lt!530131 () Unit!38785)

(declare-fun e!668019 () Unit!38785)

(assert (=> b!1175222 (= lt!530131 e!668019)))

(declare-fun c!116685 () Bool)

(assert (=> b!1175222 (= c!116685 (= (select (arr!36626 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175222 e!668018))

(declare-fun res!780494 () Bool)

(assert (=> b!1175222 (=> (not res!780494) (not e!668018))))

(declare-datatypes ((V!44555 0))(
  ( (V!44556 (val!14842 Int)) )
))
(declare-datatypes ((ValueCell!14076 0))(
  ( (ValueCellFull!14076 (v!17480 V!44555)) (EmptyCell!14076) )
))
(declare-datatypes ((array!75955 0))(
  ( (array!75956 (arr!36627 (Array (_ BitVec 32) ValueCell!14076)) (size!37163 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75955)

(declare-datatypes ((tuple2!18980 0))(
  ( (tuple2!18981 (_1!9501 (_ BitVec 64)) (_2!9501 V!44555)) )
))
(declare-datatypes ((List!25719 0))(
  ( (Nil!25716) (Cons!25715 (h!26924 tuple2!18980) (t!37752 List!25719)) )
))
(declare-datatypes ((ListLongMap!16949 0))(
  ( (ListLongMap!16950 (toList!8490 List!25719)) )
))
(declare-fun lt!530138 () ListLongMap!16949)

(declare-fun lt!530137 () ListLongMap!16949)

(declare-fun lt!530140 () V!44555)

(declare-fun +!3806 (ListLongMap!16949 tuple2!18980) ListLongMap!16949)

(declare-fun get!18700 (ValueCell!14076 V!44555) V!44555)

(assert (=> b!1175222 (= res!780494 (= lt!530138 (+!3806 lt!530137 (tuple2!18981 (select (arr!36626 _keys!1208) from!1455) (get!18700 (select (arr!36627 _values!996) from!1455) lt!530140)))))))

(declare-fun b!1175223 () Bool)

(assert (=> b!1175223 (= e!668020 e!668021)))

(declare-fun res!780484 () Bool)

(assert (=> b!1175223 (=> (not res!780484) (not e!668021))))

(assert (=> b!1175223 (= res!780484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530136 mask!1564))))

(assert (=> b!1175223 (= lt!530136 (array!75954 (store (arr!36626 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37162 _keys!1208)))))

(declare-fun b!1175224 () Bool)

(declare-fun res!780486 () Bool)

(assert (=> b!1175224 (=> (not res!780486) (not e!668020))))

(assert (=> b!1175224 (= res!780486 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37162 _keys!1208))))))

(declare-fun b!1175225 () Bool)

(declare-fun e!668025 () Bool)

(declare-fun tp_is_empty!29571 () Bool)

(assert (=> b!1175225 (= e!668025 tp_is_empty!29571)))

(declare-fun b!1175226 () Bool)

(declare-fun e!668022 () Bool)

(assert (=> b!1175226 (= e!668022 tp_is_empty!29571)))

(declare-fun b!1175227 () Bool)

(declare-fun Unit!38787 () Unit!38785)

(assert (=> b!1175227 (= e!668019 Unit!38787)))

(declare-fun res!780492 () Bool)

(assert (=> start!99462 (=> (not res!780492) (not e!668020))))

(assert (=> start!99462 (= res!780492 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37162 _keys!1208))))))

(assert (=> start!99462 e!668020))

(assert (=> start!99462 tp_is_empty!29571))

(declare-fun array_inv!27978 (array!75953) Bool)

(assert (=> start!99462 (array_inv!27978 _keys!1208)))

(assert (=> start!99462 true))

(assert (=> start!99462 tp!87837))

(declare-fun e!668026 () Bool)

(declare-fun array_inv!27979 (array!75955) Bool)

(assert (=> start!99462 (and (array_inv!27979 _values!996) e!668026)))

(declare-fun b!1175228 () Bool)

(declare-fun e!668023 () Bool)

(declare-fun e!668015 () Bool)

(assert (=> b!1175228 (= e!668023 e!668015)))

(declare-fun res!780495 () Bool)

(assert (=> b!1175228 (=> res!780495 e!668015)))

(assert (=> b!1175228 (= res!780495 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44555)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530130 () array!75955)

(declare-fun minValue!944 () V!44555)

(declare-fun getCurrentListMapNoExtraKeys!4950 (array!75953 array!75955 (_ BitVec 32) (_ BitVec 32) V!44555 V!44555 (_ BitVec 32) Int) ListLongMap!16949)

(assert (=> b!1175228 (= lt!530138 (getCurrentListMapNoExtraKeys!4950 lt!530136 lt!530130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175228 (= lt!530130 (array!75956 (store (arr!36627 _values!996) i!673 (ValueCellFull!14076 lt!530140)) (size!37163 _values!996)))))

(declare-fun dynLambda!2916 (Int (_ BitVec 64)) V!44555)

(assert (=> b!1175228 (= lt!530140 (dynLambda!2916 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530132 () ListLongMap!16949)

(assert (=> b!1175228 (= lt!530132 (getCurrentListMapNoExtraKeys!4950 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175229 () Bool)

(declare-fun res!780487 () Bool)

(assert (=> b!1175229 (=> (not res!780487) (not e!668020))))

(assert (=> b!1175229 (= res!780487 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25715))))

(declare-fun b!1175230 () Bool)

(declare-fun res!780483 () Bool)

(assert (=> b!1175230 (=> (not res!780483) (not e!668020))))

(assert (=> b!1175230 (= res!780483 (and (= (size!37163 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37162 _keys!1208) (size!37163 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175231 () Bool)

(assert (=> b!1175231 (= e!668021 (not e!668023))))

(declare-fun res!780496 () Bool)

(assert (=> b!1175231 (=> res!780496 e!668023)))

(assert (=> b!1175231 (= res!780496 (bvsgt from!1455 i!673))))

(assert (=> b!1175231 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530139 () Unit!38785)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75953 (_ BitVec 64) (_ BitVec 32)) Unit!38785)

(assert (=> b!1175231 (= lt!530139 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175232 () Bool)

(declare-fun Unit!38788 () Unit!38785)

(assert (=> b!1175232 (= e!668019 Unit!38788)))

(declare-fun lt!530133 () Unit!38785)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75953 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38785)

(assert (=> b!1175232 (= lt!530133 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175232 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530141 () Unit!38785)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75953 (_ BitVec 32) (_ BitVec 32)) Unit!38785)

(assert (=> b!1175232 (= lt!530141 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175232 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25715)))

(declare-fun lt!530134 () Unit!38785)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75953 (_ BitVec 64) (_ BitVec 32) List!25718) Unit!38785)

(assert (=> b!1175232 (= lt!530134 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25715))))

(assert (=> b!1175232 false))

(declare-fun mapNonEmpty!46184 () Bool)

(declare-fun tp!87836 () Bool)

(assert (=> mapNonEmpty!46184 (= mapRes!46184 (and tp!87836 e!668022))))

(declare-fun mapKey!46184 () (_ BitVec 32))

(declare-fun mapValue!46184 () ValueCell!14076)

(declare-fun mapRest!46184 () (Array (_ BitVec 32) ValueCell!14076))

(assert (=> mapNonEmpty!46184 (= (arr!36627 _values!996) (store mapRest!46184 mapKey!46184 mapValue!46184))))

(declare-fun b!1175233 () Bool)

(assert (=> b!1175233 (= e!668026 (and e!668025 mapRes!46184))))

(declare-fun condMapEmpty!46184 () Bool)

(declare-fun mapDefault!46184 () ValueCell!14076)

(assert (=> b!1175233 (= condMapEmpty!46184 (= (arr!36627 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14076)) mapDefault!46184)))))

(declare-fun b!1175234 () Bool)

(assert (=> b!1175234 (= e!668015 e!668024)))

(declare-fun res!780489 () Bool)

(assert (=> b!1175234 (=> res!780489 e!668024)))

(assert (=> b!1175234 (= res!780489 (not (validKeyInArray!0 (select (arr!36626 _keys!1208) from!1455))))))

(declare-fun lt!530135 () ListLongMap!16949)

(assert (=> b!1175234 (= lt!530135 lt!530137)))

(declare-fun lt!530129 () ListLongMap!16949)

(declare-fun -!1546 (ListLongMap!16949 (_ BitVec 64)) ListLongMap!16949)

(assert (=> b!1175234 (= lt!530137 (-!1546 lt!530129 k0!934))))

(assert (=> b!1175234 (= lt!530135 (getCurrentListMapNoExtraKeys!4950 lt!530136 lt!530130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175234 (= lt!530129 (getCurrentListMapNoExtraKeys!4950 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530142 () Unit!38785)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!773 (array!75953 array!75955 (_ BitVec 32) (_ BitVec 32) V!44555 V!44555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38785)

(assert (=> b!1175234 (= lt!530142 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99462 res!780492) b!1175217))

(assert (= (and b!1175217 res!780488) b!1175230))

(assert (= (and b!1175230 res!780483) b!1175218))

(assert (= (and b!1175218 res!780491) b!1175229))

(assert (= (and b!1175229 res!780487) b!1175224))

(assert (= (and b!1175224 res!780486) b!1175215))

(assert (= (and b!1175215 res!780482) b!1175216))

(assert (= (and b!1175216 res!780490) b!1175223))

(assert (= (and b!1175223 res!780484) b!1175221))

(assert (= (and b!1175221 res!780485) b!1175231))

(assert (= (and b!1175231 (not res!780496)) b!1175228))

(assert (= (and b!1175228 (not res!780495)) b!1175234))

(assert (= (and b!1175234 (not res!780489)) b!1175222))

(assert (= (and b!1175222 res!780494) b!1175220))

(assert (= (and b!1175220 (not res!780493)) b!1175219))

(assert (= (and b!1175222 c!116685) b!1175232))

(assert (= (and b!1175222 (not c!116685)) b!1175227))

(assert (= (and b!1175233 condMapEmpty!46184) mapIsEmpty!46184))

(assert (= (and b!1175233 (not condMapEmpty!46184)) mapNonEmpty!46184))

(get-info :version)

(assert (= (and mapNonEmpty!46184 ((_ is ValueCellFull!14076) mapValue!46184)) b!1175226))

(assert (= (and b!1175233 ((_ is ValueCellFull!14076) mapDefault!46184)) b!1175225))

(assert (= start!99462 b!1175233))

(declare-fun b_lambda!20185 () Bool)

(assert (=> (not b_lambda!20185) (not b!1175228)))

(declare-fun t!37750 () Bool)

(declare-fun tb!9853 () Bool)

(assert (=> (and start!99462 (= defaultEntry!1004 defaultEntry!1004) t!37750) tb!9853))

(declare-fun result!20273 () Bool)

(assert (=> tb!9853 (= result!20273 tp_is_empty!29571)))

(assert (=> b!1175228 t!37750))

(declare-fun b_and!40951 () Bool)

(assert (= b_and!40949 (and (=> t!37750 result!20273) b_and!40951)))

(declare-fun m!1083115 () Bool)

(assert (=> b!1175223 m!1083115))

(declare-fun m!1083117 () Bool)

(assert (=> b!1175223 m!1083117))

(declare-fun m!1083119 () Bool)

(assert (=> b!1175219 m!1083119))

(declare-fun m!1083121 () Bool)

(assert (=> b!1175216 m!1083121))

(declare-fun m!1083123 () Bool)

(assert (=> b!1175220 m!1083123))

(declare-fun m!1083125 () Bool)

(assert (=> b!1175215 m!1083125))

(declare-fun m!1083127 () Bool)

(assert (=> b!1175218 m!1083127))

(declare-fun m!1083129 () Bool)

(assert (=> b!1175217 m!1083129))

(declare-fun m!1083131 () Bool)

(assert (=> b!1175231 m!1083131))

(declare-fun m!1083133 () Bool)

(assert (=> b!1175231 m!1083133))

(declare-fun m!1083135 () Bool)

(assert (=> b!1175229 m!1083135))

(declare-fun m!1083137 () Bool)

(assert (=> b!1175228 m!1083137))

(declare-fun m!1083139 () Bool)

(assert (=> b!1175228 m!1083139))

(declare-fun m!1083141 () Bool)

(assert (=> b!1175228 m!1083141))

(declare-fun m!1083143 () Bool)

(assert (=> b!1175228 m!1083143))

(declare-fun m!1083145 () Bool)

(assert (=> mapNonEmpty!46184 m!1083145))

(declare-fun m!1083147 () Bool)

(assert (=> b!1175232 m!1083147))

(declare-fun m!1083149 () Bool)

(assert (=> b!1175232 m!1083149))

(declare-fun m!1083151 () Bool)

(assert (=> b!1175232 m!1083151))

(declare-fun m!1083153 () Bool)

(assert (=> b!1175232 m!1083153))

(declare-fun m!1083155 () Bool)

(assert (=> b!1175232 m!1083155))

(declare-fun m!1083157 () Bool)

(assert (=> b!1175234 m!1083157))

(declare-fun m!1083159 () Bool)

(assert (=> b!1175234 m!1083159))

(declare-fun m!1083161 () Bool)

(assert (=> b!1175234 m!1083161))

(declare-fun m!1083163 () Bool)

(assert (=> b!1175234 m!1083163))

(assert (=> b!1175234 m!1083123))

(declare-fun m!1083165 () Bool)

(assert (=> b!1175234 m!1083165))

(assert (=> b!1175234 m!1083123))

(assert (=> b!1175222 m!1083123))

(declare-fun m!1083167 () Bool)

(assert (=> b!1175222 m!1083167))

(assert (=> b!1175222 m!1083167))

(declare-fun m!1083169 () Bool)

(assert (=> b!1175222 m!1083169))

(declare-fun m!1083171 () Bool)

(assert (=> b!1175222 m!1083171))

(declare-fun m!1083173 () Bool)

(assert (=> start!99462 m!1083173))

(declare-fun m!1083175 () Bool)

(assert (=> start!99462 m!1083175))

(declare-fun m!1083177 () Bool)

(assert (=> b!1175221 m!1083177))

(check-sat (not b!1175231) (not start!99462) (not b!1175229) (not b_lambda!20185) b_and!40951 (not b_next!25041) (not b!1175218) (not b!1175223) (not b!1175219) (not b!1175222) (not b!1175228) (not b!1175232) tp_is_empty!29571 (not b!1175221) (not b!1175217) (not mapNonEmpty!46184) (not b!1175234) (not b!1175215))
(check-sat b_and!40951 (not b_next!25041))

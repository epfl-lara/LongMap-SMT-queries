; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99738 () Bool)

(assert start!99738)

(declare-fun b_free!25317 () Bool)

(declare-fun b_next!25317 () Bool)

(assert (=> start!99738 (= b_free!25317 (not b_next!25317))))

(declare-fun tp!88665 () Bool)

(declare-fun b_and!41501 () Bool)

(assert (=> start!99738 (= tp!88665 b_and!41501)))

(declare-fun b!1184113 () Bool)

(declare-fun e!673246 () Bool)

(declare-fun e!673243 () Bool)

(assert (=> b!1184113 (= e!673246 (not e!673243))))

(declare-fun res!787044 () Bool)

(assert (=> b!1184113 (=> res!787044 e!673243)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184113 (= res!787044 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76495 0))(
  ( (array!76496 (arr!36897 (Array (_ BitVec 32) (_ BitVec 64))) (size!37433 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76495)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184113 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39200 0))(
  ( (Unit!39201) )
))
(declare-fun lt!536799 () Unit!39200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76495 (_ BitVec 64) (_ BitVec 32)) Unit!39200)

(assert (=> b!1184113 (= lt!536799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!787036 () Bool)

(declare-fun e!673242 () Bool)

(assert (=> start!99738 (=> (not res!787036) (not e!673242))))

(assert (=> start!99738 (= res!787036 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37433 _keys!1208))))))

(assert (=> start!99738 e!673242))

(declare-fun tp_is_empty!29847 () Bool)

(assert (=> start!99738 tp_is_empty!29847))

(declare-fun array_inv!28162 (array!76495) Bool)

(assert (=> start!99738 (array_inv!28162 _keys!1208)))

(assert (=> start!99738 true))

(assert (=> start!99738 tp!88665))

(declare-datatypes ((V!44923 0))(
  ( (V!44924 (val!14980 Int)) )
))
(declare-datatypes ((ValueCell!14214 0))(
  ( (ValueCellFull!14214 (v!17618 V!44923)) (EmptyCell!14214) )
))
(declare-datatypes ((array!76497 0))(
  ( (array!76498 (arr!36898 (Array (_ BitVec 32) ValueCell!14214)) (size!37434 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76497)

(declare-fun e!673241 () Bool)

(declare-fun array_inv!28163 (array!76497) Bool)

(assert (=> start!99738 (and (array_inv!28163 _values!996) e!673241)))

(declare-fun mapNonEmpty!46598 () Bool)

(declare-fun mapRes!46598 () Bool)

(declare-fun tp!88664 () Bool)

(declare-fun e!673236 () Bool)

(assert (=> mapNonEmpty!46598 (= mapRes!46598 (and tp!88664 e!673236))))

(declare-fun mapKey!46598 () (_ BitVec 32))

(declare-fun mapValue!46598 () ValueCell!14214)

(declare-fun mapRest!46598 () (Array (_ BitVec 32) ValueCell!14214))

(assert (=> mapNonEmpty!46598 (= (arr!36898 _values!996) (store mapRest!46598 mapKey!46598 mapValue!46598))))

(declare-fun b!1184114 () Bool)

(declare-fun e!673244 () Bool)

(declare-fun e!673239 () Bool)

(assert (=> b!1184114 (= e!673244 e!673239)))

(declare-fun res!787042 () Bool)

(assert (=> b!1184114 (=> res!787042 e!673239)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184114 (= res!787042 (not (validKeyInArray!0 (select (arr!36897 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19208 0))(
  ( (tuple2!19209 (_1!9615 (_ BitVec 64)) (_2!9615 V!44923)) )
))
(declare-datatypes ((List!25947 0))(
  ( (Nil!25944) (Cons!25943 (h!27152 tuple2!19208) (t!38256 List!25947)) )
))
(declare-datatypes ((ListLongMap!17177 0))(
  ( (ListLongMap!17178 (toList!8604 List!25947)) )
))
(declare-fun lt!536804 () ListLongMap!17177)

(declare-fun lt!536800 () ListLongMap!17177)

(assert (=> b!1184114 (= lt!536804 lt!536800)))

(declare-fun lt!536787 () ListLongMap!17177)

(declare-fun -!1639 (ListLongMap!17177 (_ BitVec 64)) ListLongMap!17177)

(assert (=> b!1184114 (= lt!536800 (-!1639 lt!536787 k0!934))))

(declare-fun zeroValue!944 () V!44923)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536802 () array!76495)

(declare-fun lt!536796 () array!76497)

(declare-fun minValue!944 () V!44923)

(declare-fun getCurrentListMapNoExtraKeys!5054 (array!76495 array!76497 (_ BitVec 32) (_ BitVec 32) V!44923 V!44923 (_ BitVec 32) Int) ListLongMap!17177)

(assert (=> b!1184114 (= lt!536804 (getCurrentListMapNoExtraKeys!5054 lt!536802 lt!536796 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184114 (= lt!536787 (getCurrentListMapNoExtraKeys!5054 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536803 () Unit!39200)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!859 (array!76495 array!76497 (_ BitVec 32) (_ BitVec 32) V!44923 V!44923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39200)

(assert (=> b!1184114 (= lt!536803 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!859 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46598 () Bool)

(assert (=> mapIsEmpty!46598 mapRes!46598))

(declare-fun b!1184115 () Bool)

(assert (=> b!1184115 (= e!673236 tp_is_empty!29847)))

(declare-fun b!1184116 () Bool)

(declare-fun res!787037 () Bool)

(assert (=> b!1184116 (=> (not res!787037) (not e!673246))))

(declare-datatypes ((List!25948 0))(
  ( (Nil!25945) (Cons!25944 (h!27153 (_ BitVec 64)) (t!38257 List!25948)) )
))
(declare-fun arrayNoDuplicates!0 (array!76495 (_ BitVec 32) List!25948) Bool)

(assert (=> b!1184116 (= res!787037 (arrayNoDuplicates!0 lt!536802 #b00000000000000000000000000000000 Nil!25945))))

(declare-fun b!1184117 () Bool)

(declare-fun e!673235 () Unit!39200)

(declare-fun Unit!39202 () Unit!39200)

(assert (=> b!1184117 (= e!673235 Unit!39202)))

(declare-fun lt!536792 () Unit!39200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76495 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39200)

(assert (=> b!1184117 (= lt!536792 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184117 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536797 () Unit!39200)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76495 (_ BitVec 32) (_ BitVec 32)) Unit!39200)

(assert (=> b!1184117 (= lt!536797 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184117 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25945)))

(declare-fun lt!536790 () Unit!39200)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76495 (_ BitVec 64) (_ BitVec 32) List!25948) Unit!39200)

(assert (=> b!1184117 (= lt!536790 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25945))))

(assert (=> b!1184117 false))

(declare-fun b!1184118 () Bool)

(declare-fun res!787035 () Bool)

(assert (=> b!1184118 (=> (not res!787035) (not e!673242))))

(assert (=> b!1184118 (= res!787035 (and (= (size!37434 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37433 _keys!1208) (size!37434 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184119 () Bool)

(declare-fun res!787034 () Bool)

(assert (=> b!1184119 (=> (not res!787034) (not e!673242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184119 (= res!787034 (validMask!0 mask!1564))))

(declare-fun b!1184120 () Bool)

(declare-fun res!787040 () Bool)

(assert (=> b!1184120 (=> (not res!787040) (not e!673242))))

(assert (=> b!1184120 (= res!787040 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25945))))

(declare-fun b!1184121 () Bool)

(declare-fun res!787038 () Bool)

(assert (=> b!1184121 (=> (not res!787038) (not e!673242))))

(assert (=> b!1184121 (= res!787038 (= (select (arr!36897 _keys!1208) i!673) k0!934))))

(declare-fun b!1184122 () Bool)

(declare-fun e!673245 () Bool)

(declare-fun e!673237 () Bool)

(assert (=> b!1184122 (= e!673245 e!673237)))

(declare-fun res!787046 () Bool)

(assert (=> b!1184122 (=> res!787046 e!673237)))

(assert (=> b!1184122 (= res!787046 (not (= (select (arr!36897 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184123 () Bool)

(assert (=> b!1184123 (= e!673243 e!673244)))

(declare-fun res!787039 () Bool)

(assert (=> b!1184123 (=> res!787039 e!673244)))

(assert (=> b!1184123 (= res!787039 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!536795 () ListLongMap!17177)

(assert (=> b!1184123 (= lt!536795 (getCurrentListMapNoExtraKeys!5054 lt!536802 lt!536796 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536789 () V!44923)

(assert (=> b!1184123 (= lt!536796 (array!76498 (store (arr!36898 _values!996) i!673 (ValueCellFull!14214 lt!536789)) (size!37434 _values!996)))))

(declare-fun dynLambda!3005 (Int (_ BitVec 64)) V!44923)

(assert (=> b!1184123 (= lt!536789 (dynLambda!3005 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536794 () ListLongMap!17177)

(assert (=> b!1184123 (= lt!536794 (getCurrentListMapNoExtraKeys!5054 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184124 () Bool)

(declare-fun res!787047 () Bool)

(assert (=> b!1184124 (=> (not res!787047) (not e!673242))))

(assert (=> b!1184124 (= res!787047 (validKeyInArray!0 k0!934))))

(declare-fun b!1184125 () Bool)

(declare-fun e!673240 () Bool)

(assert (=> b!1184125 (= e!673241 (and e!673240 mapRes!46598))))

(declare-fun condMapEmpty!46598 () Bool)

(declare-fun mapDefault!46598 () ValueCell!14214)

(assert (=> b!1184125 (= condMapEmpty!46598 (= (arr!36898 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14214)) mapDefault!46598)))))

(declare-fun b!1184126 () Bool)

(declare-fun res!787043 () Bool)

(assert (=> b!1184126 (=> (not res!787043) (not e!673242))))

(assert (=> b!1184126 (= res!787043 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37433 _keys!1208))))))

(declare-fun b!1184127 () Bool)

(assert (=> b!1184127 (= e!673240 tp_is_empty!29847)))

(declare-fun b!1184128 () Bool)

(assert (=> b!1184128 (= e!673237 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184129 () Bool)

(declare-fun Unit!39203 () Unit!39200)

(assert (=> b!1184129 (= e!673235 Unit!39203)))

(declare-fun b!1184130 () Bool)

(assert (=> b!1184130 (= e!673239 true)))

(declare-fun lt!536805 () ListLongMap!17177)

(declare-fun lt!536791 () ListLongMap!17177)

(assert (=> b!1184130 (= (-!1639 lt!536805 k0!934) lt!536791)))

(declare-fun lt!536788 () V!44923)

(declare-fun lt!536793 () Unit!39200)

(declare-fun addRemoveCommutativeForDiffKeys!164 (ListLongMap!17177 (_ BitVec 64) V!44923 (_ BitVec 64)) Unit!39200)

(assert (=> b!1184130 (= lt!536793 (addRemoveCommutativeForDiffKeys!164 lt!536787 (select (arr!36897 _keys!1208) from!1455) lt!536788 k0!934))))

(assert (=> b!1184130 (and (= lt!536794 lt!536805) (= lt!536800 lt!536804))))

(declare-fun lt!536801 () tuple2!19208)

(declare-fun +!3901 (ListLongMap!17177 tuple2!19208) ListLongMap!17177)

(assert (=> b!1184130 (= lt!536805 (+!3901 lt!536787 lt!536801))))

(assert (=> b!1184130 (not (= (select (arr!36897 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536798 () Unit!39200)

(assert (=> b!1184130 (= lt!536798 e!673235)))

(declare-fun c!117099 () Bool)

(assert (=> b!1184130 (= c!117099 (= (select (arr!36897 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184130 e!673245))

(declare-fun res!787041 () Bool)

(assert (=> b!1184130 (=> (not res!787041) (not e!673245))))

(assert (=> b!1184130 (= res!787041 (= lt!536795 lt!536791))))

(assert (=> b!1184130 (= lt!536791 (+!3901 lt!536800 lt!536801))))

(assert (=> b!1184130 (= lt!536801 (tuple2!19209 (select (arr!36897 _keys!1208) from!1455) lt!536788))))

(declare-fun get!18880 (ValueCell!14214 V!44923) V!44923)

(assert (=> b!1184130 (= lt!536788 (get!18880 (select (arr!36898 _values!996) from!1455) lt!536789))))

(declare-fun b!1184131 () Bool)

(assert (=> b!1184131 (= e!673242 e!673246)))

(declare-fun res!787045 () Bool)

(assert (=> b!1184131 (=> (not res!787045) (not e!673246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76495 (_ BitVec 32)) Bool)

(assert (=> b!1184131 (= res!787045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536802 mask!1564))))

(assert (=> b!1184131 (= lt!536802 (array!76496 (store (arr!36897 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37433 _keys!1208)))))

(declare-fun b!1184132 () Bool)

(declare-fun res!787048 () Bool)

(assert (=> b!1184132 (=> (not res!787048) (not e!673242))))

(assert (=> b!1184132 (= res!787048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99738 res!787036) b!1184119))

(assert (= (and b!1184119 res!787034) b!1184118))

(assert (= (and b!1184118 res!787035) b!1184132))

(assert (= (and b!1184132 res!787048) b!1184120))

(assert (= (and b!1184120 res!787040) b!1184126))

(assert (= (and b!1184126 res!787043) b!1184124))

(assert (= (and b!1184124 res!787047) b!1184121))

(assert (= (and b!1184121 res!787038) b!1184131))

(assert (= (and b!1184131 res!787045) b!1184116))

(assert (= (and b!1184116 res!787037) b!1184113))

(assert (= (and b!1184113 (not res!787044)) b!1184123))

(assert (= (and b!1184123 (not res!787039)) b!1184114))

(assert (= (and b!1184114 (not res!787042)) b!1184130))

(assert (= (and b!1184130 res!787041) b!1184122))

(assert (= (and b!1184122 (not res!787046)) b!1184128))

(assert (= (and b!1184130 c!117099) b!1184117))

(assert (= (and b!1184130 (not c!117099)) b!1184129))

(assert (= (and b!1184125 condMapEmpty!46598) mapIsEmpty!46598))

(assert (= (and b!1184125 (not condMapEmpty!46598)) mapNonEmpty!46598))

(get-info :version)

(assert (= (and mapNonEmpty!46598 ((_ is ValueCellFull!14214) mapValue!46598)) b!1184115))

(assert (= (and b!1184125 ((_ is ValueCellFull!14214) mapDefault!46598)) b!1184127))

(assert (= start!99738 b!1184125))

(declare-fun b_lambda!20461 () Bool)

(assert (=> (not b_lambda!20461) (not b!1184123)))

(declare-fun t!38255 () Bool)

(declare-fun tb!10129 () Bool)

(assert (=> (and start!99738 (= defaultEntry!1004 defaultEntry!1004) t!38255) tb!10129))

(declare-fun result!20825 () Bool)

(assert (=> tb!10129 (= result!20825 tp_is_empty!29847)))

(assert (=> b!1184123 t!38255))

(declare-fun b_and!41503 () Bool)

(assert (= b_and!41501 (and (=> t!38255 result!20825) b_and!41503)))

(declare-fun m!1092355 () Bool)

(assert (=> b!1184120 m!1092355))

(declare-fun m!1092357 () Bool)

(assert (=> b!1184117 m!1092357))

(declare-fun m!1092359 () Bool)

(assert (=> b!1184117 m!1092359))

(declare-fun m!1092361 () Bool)

(assert (=> b!1184117 m!1092361))

(declare-fun m!1092363 () Bool)

(assert (=> b!1184117 m!1092363))

(declare-fun m!1092365 () Bool)

(assert (=> b!1184117 m!1092365))

(declare-fun m!1092367 () Bool)

(assert (=> b!1184130 m!1092367))

(declare-fun m!1092369 () Bool)

(assert (=> b!1184130 m!1092369))

(declare-fun m!1092371 () Bool)

(assert (=> b!1184130 m!1092371))

(declare-fun m!1092373 () Bool)

(assert (=> b!1184130 m!1092373))

(assert (=> b!1184130 m!1092369))

(declare-fun m!1092375 () Bool)

(assert (=> b!1184130 m!1092375))

(declare-fun m!1092377 () Bool)

(assert (=> b!1184130 m!1092377))

(declare-fun m!1092379 () Bool)

(assert (=> b!1184130 m!1092379))

(assert (=> b!1184130 m!1092371))

(declare-fun m!1092381 () Bool)

(assert (=> b!1184114 m!1092381))

(declare-fun m!1092383 () Bool)

(assert (=> b!1184114 m!1092383))

(declare-fun m!1092385 () Bool)

(assert (=> b!1184114 m!1092385))

(declare-fun m!1092387 () Bool)

(assert (=> b!1184114 m!1092387))

(assert (=> b!1184114 m!1092371))

(declare-fun m!1092389 () Bool)

(assert (=> b!1184114 m!1092389))

(assert (=> b!1184114 m!1092371))

(declare-fun m!1092391 () Bool)

(assert (=> b!1184128 m!1092391))

(declare-fun m!1092393 () Bool)

(assert (=> b!1184123 m!1092393))

(declare-fun m!1092395 () Bool)

(assert (=> b!1184123 m!1092395))

(declare-fun m!1092397 () Bool)

(assert (=> b!1184123 m!1092397))

(declare-fun m!1092399 () Bool)

(assert (=> b!1184123 m!1092399))

(declare-fun m!1092401 () Bool)

(assert (=> b!1184116 m!1092401))

(declare-fun m!1092403 () Bool)

(assert (=> b!1184131 m!1092403))

(declare-fun m!1092405 () Bool)

(assert (=> b!1184131 m!1092405))

(declare-fun m!1092407 () Bool)

(assert (=> b!1184124 m!1092407))

(declare-fun m!1092409 () Bool)

(assert (=> b!1184119 m!1092409))

(declare-fun m!1092411 () Bool)

(assert (=> start!99738 m!1092411))

(declare-fun m!1092413 () Bool)

(assert (=> start!99738 m!1092413))

(declare-fun m!1092415 () Bool)

(assert (=> b!1184132 m!1092415))

(assert (=> b!1184122 m!1092371))

(declare-fun m!1092417 () Bool)

(assert (=> b!1184113 m!1092417))

(declare-fun m!1092419 () Bool)

(assert (=> b!1184113 m!1092419))

(declare-fun m!1092421 () Bool)

(assert (=> mapNonEmpty!46598 m!1092421))

(declare-fun m!1092423 () Bool)

(assert (=> b!1184121 m!1092423))

(check-sat (not b!1184123) (not b!1184119) (not mapNonEmpty!46598) (not b!1184124) (not b!1184120) (not b!1184117) tp_is_empty!29847 (not b!1184114) (not b!1184128) (not b!1184116) (not b_lambda!20461) (not b!1184113) (not b!1184130) (not b_next!25317) (not b!1184131) (not b!1184132) (not start!99738) b_and!41503)
(check-sat b_and!41503 (not b_next!25317))

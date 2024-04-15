; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99418 () Bool)

(assert start!99418)

(declare-fun b_free!25003 () Bool)

(declare-fun b_next!25003 () Bool)

(assert (=> start!99418 (= b_free!25003 (not b_next!25003))))

(declare-fun tp!87723 () Bool)

(declare-fun b_and!40851 () Bool)

(assert (=> start!99418 (= tp!87723 b_and!40851)))

(declare-fun b!1173913 () Bool)

(declare-fun e!667259 () Bool)

(declare-fun tp_is_empty!29533 () Bool)

(assert (=> b!1173913 (= e!667259 tp_is_empty!29533)))

(declare-fun b!1173915 () Bool)

(declare-fun e!667253 () Bool)

(declare-fun e!667263 () Bool)

(declare-fun mapRes!46127 () Bool)

(assert (=> b!1173915 (= e!667253 (and e!667263 mapRes!46127))))

(declare-fun condMapEmpty!46127 () Bool)

(declare-datatypes ((V!44505 0))(
  ( (V!44506 (val!14823 Int)) )
))
(declare-datatypes ((ValueCell!14057 0))(
  ( (ValueCellFull!14057 (v!17460 V!44505)) (EmptyCell!14057) )
))
(declare-datatypes ((array!75806 0))(
  ( (array!75807 (arr!36553 (Array (_ BitVec 32) ValueCell!14057)) (size!37091 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75806)

(declare-fun mapDefault!46127 () ValueCell!14057)

(assert (=> b!1173915 (= condMapEmpty!46127 (= (arr!36553 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14057)) mapDefault!46127)))))

(declare-fun b!1173916 () Bool)

(declare-fun res!779575 () Bool)

(declare-fun e!667257 () Bool)

(assert (=> b!1173916 (=> (not res!779575) (not e!667257))))

(declare-datatypes ((array!75808 0))(
  ( (array!75809 (arr!36554 (Array (_ BitVec 32) (_ BitVec 64))) (size!37092 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75808)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1173916 (= res!779575 (and (= (size!37091 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37092 _keys!1208) (size!37091 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173917 () Bool)

(declare-datatypes ((Unit!38547 0))(
  ( (Unit!38548) )
))
(declare-fun e!667261 () Unit!38547)

(declare-fun Unit!38549 () Unit!38547)

(assert (=> b!1173917 (= e!667261 Unit!38549)))

(declare-fun b!1173918 () Bool)

(declare-fun e!667260 () Bool)

(declare-fun e!667256 () Bool)

(assert (=> b!1173918 (= e!667260 e!667256)))

(declare-fun res!779572 () Bool)

(assert (=> b!1173918 (=> res!779572 e!667256)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173918 (= res!779572 (not (validKeyInArray!0 (select (arr!36554 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19042 0))(
  ( (tuple2!19043 (_1!9532 (_ BitVec 64)) (_2!9532 V!44505)) )
))
(declare-datatypes ((List!25757 0))(
  ( (Nil!25754) (Cons!25753 (h!26962 tuple2!19042) (t!37743 List!25757)) )
))
(declare-datatypes ((ListLongMap!17011 0))(
  ( (ListLongMap!17012 (toList!8521 List!25757)) )
))
(declare-fun lt!529152 () ListLongMap!17011)

(declare-fun lt!529145 () ListLongMap!17011)

(assert (=> b!1173918 (= lt!529152 lt!529145)))

(declare-fun lt!529150 () ListLongMap!17011)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1508 (ListLongMap!17011 (_ BitVec 64)) ListLongMap!17011)

(assert (=> b!1173918 (= lt!529145 (-!1508 lt!529150 k0!934))))

(declare-fun zeroValue!944 () V!44505)

(declare-fun lt!529144 () array!75806)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529143 () array!75808)

(declare-fun minValue!944 () V!44505)

(declare-fun getCurrentListMapNoExtraKeys!4994 (array!75808 array!75806 (_ BitVec 32) (_ BitVec 32) V!44505 V!44505 (_ BitVec 32) Int) ListLongMap!17011)

(assert (=> b!1173918 (= lt!529152 (getCurrentListMapNoExtraKeys!4994 lt!529143 lt!529144 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173918 (= lt!529150 (getCurrentListMapNoExtraKeys!4994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!529142 () Unit!38547)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!772 (array!75808 array!75806 (_ BitVec 32) (_ BitVec 32) V!44505 V!44505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38547)

(assert (=> b!1173918 (= lt!529142 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173919 () Bool)

(declare-fun res!779571 () Bool)

(assert (=> b!1173919 (=> (not res!779571) (not e!667257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173919 (= res!779571 (validMask!0 mask!1564))))

(declare-fun b!1173920 () Bool)

(declare-fun Unit!38550 () Unit!38547)

(assert (=> b!1173920 (= e!667261 Unit!38550)))

(declare-fun lt!529151 () Unit!38547)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75808 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38547)

(assert (=> b!1173920 (= lt!529151 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173920 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529149 () Unit!38547)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75808 (_ BitVec 32) (_ BitVec 32)) Unit!38547)

(assert (=> b!1173920 (= lt!529149 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25758 0))(
  ( (Nil!25755) (Cons!25754 (h!26963 (_ BitVec 64)) (t!37744 List!25758)) )
))
(declare-fun arrayNoDuplicates!0 (array!75808 (_ BitVec 32) List!25758) Bool)

(assert (=> b!1173920 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25755)))

(declare-fun lt!529140 () Unit!38547)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75808 (_ BitVec 64) (_ BitVec 32) List!25758) Unit!38547)

(assert (=> b!1173920 (= lt!529140 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25755))))

(assert (=> b!1173920 false))

(declare-fun mapIsEmpty!46127 () Bool)

(assert (=> mapIsEmpty!46127 mapRes!46127))

(declare-fun b!1173921 () Bool)

(assert (=> b!1173921 (= e!667256 true)))

(assert (=> b!1173921 (not (= (select (arr!36554 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529141 () Unit!38547)

(assert (=> b!1173921 (= lt!529141 e!667261)))

(declare-fun c!116602 () Bool)

(assert (=> b!1173921 (= c!116602 (= (select (arr!36554 _keys!1208) from!1455) k0!934))))

(declare-fun e!667255 () Bool)

(assert (=> b!1173921 e!667255))

(declare-fun res!779570 () Bool)

(assert (=> b!1173921 (=> (not res!779570) (not e!667255))))

(declare-fun lt!529146 () ListLongMap!17011)

(declare-fun lt!529147 () V!44505)

(declare-fun +!3832 (ListLongMap!17011 tuple2!19042) ListLongMap!17011)

(declare-fun get!18666 (ValueCell!14057 V!44505) V!44505)

(assert (=> b!1173921 (= res!779570 (= lt!529146 (+!3832 lt!529145 (tuple2!19043 (select (arr!36554 _keys!1208) from!1455) (get!18666 (select (arr!36553 _values!996) from!1455) lt!529147)))))))

(declare-fun b!1173922 () Bool)

(declare-fun e!667262 () Bool)

(assert (=> b!1173922 (= e!667255 e!667262)))

(declare-fun res!779565 () Bool)

(assert (=> b!1173922 (=> res!779565 e!667262)))

(assert (=> b!1173922 (= res!779565 (not (= (select (arr!36554 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173923 () Bool)

(assert (=> b!1173923 (= e!667263 tp_is_empty!29533)))

(declare-fun b!1173924 () Bool)

(declare-fun res!779564 () Bool)

(assert (=> b!1173924 (=> (not res!779564) (not e!667257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75808 (_ BitVec 32)) Bool)

(assert (=> b!1173924 (= res!779564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173925 () Bool)

(declare-fun e!667258 () Bool)

(declare-fun e!667254 () Bool)

(assert (=> b!1173925 (= e!667258 (not e!667254))))

(declare-fun res!779562 () Bool)

(assert (=> b!1173925 (=> res!779562 e!667254)))

(assert (=> b!1173925 (= res!779562 (bvsgt from!1455 i!673))))

(assert (=> b!1173925 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529139 () Unit!38547)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75808 (_ BitVec 64) (_ BitVec 32)) Unit!38547)

(assert (=> b!1173925 (= lt!529139 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!779568 () Bool)

(assert (=> start!99418 (=> (not res!779568) (not e!667257))))

(assert (=> start!99418 (= res!779568 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37092 _keys!1208))))))

(assert (=> start!99418 e!667257))

(assert (=> start!99418 tp_is_empty!29533))

(declare-fun array_inv!28034 (array!75808) Bool)

(assert (=> start!99418 (array_inv!28034 _keys!1208)))

(assert (=> start!99418 true))

(assert (=> start!99418 tp!87723))

(declare-fun array_inv!28035 (array!75806) Bool)

(assert (=> start!99418 (and (array_inv!28035 _values!996) e!667253)))

(declare-fun b!1173914 () Bool)

(declare-fun res!779563 () Bool)

(assert (=> b!1173914 (=> (not res!779563) (not e!667257))))

(assert (=> b!1173914 (= res!779563 (= (select (arr!36554 _keys!1208) i!673) k0!934))))

(declare-fun b!1173926 () Bool)

(declare-fun res!779561 () Bool)

(assert (=> b!1173926 (=> (not res!779561) (not e!667258))))

(assert (=> b!1173926 (= res!779561 (arrayNoDuplicates!0 lt!529143 #b00000000000000000000000000000000 Nil!25755))))

(declare-fun b!1173927 () Bool)

(assert (=> b!1173927 (= e!667257 e!667258)))

(declare-fun res!779569 () Bool)

(assert (=> b!1173927 (=> (not res!779569) (not e!667258))))

(assert (=> b!1173927 (= res!779569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529143 mask!1564))))

(assert (=> b!1173927 (= lt!529143 (array!75809 (store (arr!36554 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37092 _keys!1208)))))

(declare-fun b!1173928 () Bool)

(assert (=> b!1173928 (= e!667262 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46127 () Bool)

(declare-fun tp!87722 () Bool)

(assert (=> mapNonEmpty!46127 (= mapRes!46127 (and tp!87722 e!667259))))

(declare-fun mapKey!46127 () (_ BitVec 32))

(declare-fun mapValue!46127 () ValueCell!14057)

(declare-fun mapRest!46127 () (Array (_ BitVec 32) ValueCell!14057))

(assert (=> mapNonEmpty!46127 (= (arr!36553 _values!996) (store mapRest!46127 mapKey!46127 mapValue!46127))))

(declare-fun b!1173929 () Bool)

(assert (=> b!1173929 (= e!667254 e!667260)))

(declare-fun res!779574 () Bool)

(assert (=> b!1173929 (=> res!779574 e!667260)))

(assert (=> b!1173929 (= res!779574 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173929 (= lt!529146 (getCurrentListMapNoExtraKeys!4994 lt!529143 lt!529144 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173929 (= lt!529144 (array!75807 (store (arr!36553 _values!996) i!673 (ValueCellFull!14057 lt!529147)) (size!37091 _values!996)))))

(declare-fun dynLambda!2916 (Int (_ BitVec 64)) V!44505)

(assert (=> b!1173929 (= lt!529147 (dynLambda!2916 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529148 () ListLongMap!17011)

(assert (=> b!1173929 (= lt!529148 (getCurrentListMapNoExtraKeys!4994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173930 () Bool)

(declare-fun res!779573 () Bool)

(assert (=> b!1173930 (=> (not res!779573) (not e!667257))))

(assert (=> b!1173930 (= res!779573 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25755))))

(declare-fun b!1173931 () Bool)

(declare-fun res!779566 () Bool)

(assert (=> b!1173931 (=> (not res!779566) (not e!667257))))

(assert (=> b!1173931 (= res!779566 (validKeyInArray!0 k0!934))))

(declare-fun b!1173932 () Bool)

(declare-fun res!779567 () Bool)

(assert (=> b!1173932 (=> (not res!779567) (not e!667257))))

(assert (=> b!1173932 (= res!779567 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37092 _keys!1208))))))

(assert (= (and start!99418 res!779568) b!1173919))

(assert (= (and b!1173919 res!779571) b!1173916))

(assert (= (and b!1173916 res!779575) b!1173924))

(assert (= (and b!1173924 res!779564) b!1173930))

(assert (= (and b!1173930 res!779573) b!1173932))

(assert (= (and b!1173932 res!779567) b!1173931))

(assert (= (and b!1173931 res!779566) b!1173914))

(assert (= (and b!1173914 res!779563) b!1173927))

(assert (= (and b!1173927 res!779569) b!1173926))

(assert (= (and b!1173926 res!779561) b!1173925))

(assert (= (and b!1173925 (not res!779562)) b!1173929))

(assert (= (and b!1173929 (not res!779574)) b!1173918))

(assert (= (and b!1173918 (not res!779572)) b!1173921))

(assert (= (and b!1173921 res!779570) b!1173922))

(assert (= (and b!1173922 (not res!779565)) b!1173928))

(assert (= (and b!1173921 c!116602) b!1173920))

(assert (= (and b!1173921 (not c!116602)) b!1173917))

(assert (= (and b!1173915 condMapEmpty!46127) mapIsEmpty!46127))

(assert (= (and b!1173915 (not condMapEmpty!46127)) mapNonEmpty!46127))

(get-info :version)

(assert (= (and mapNonEmpty!46127 ((_ is ValueCellFull!14057) mapValue!46127)) b!1173913))

(assert (= (and b!1173915 ((_ is ValueCellFull!14057) mapDefault!46127)) b!1173923))

(assert (= start!99418 b!1173915))

(declare-fun b_lambda!20129 () Bool)

(assert (=> (not b_lambda!20129) (not b!1173929)))

(declare-fun t!37742 () Bool)

(declare-fun tb!9807 () Bool)

(assert (=> (and start!99418 (= defaultEntry!1004 defaultEntry!1004) t!37742) tb!9807))

(declare-fun result!20189 () Bool)

(assert (=> tb!9807 (= result!20189 tp_is_empty!29533)))

(assert (=> b!1173929 t!37742))

(declare-fun b_and!40853 () Bool)

(assert (= b_and!40851 (and (=> t!37742 result!20189) b_and!40853)))

(declare-fun m!1081289 () Bool)

(assert (=> b!1173929 m!1081289))

(declare-fun m!1081291 () Bool)

(assert (=> b!1173929 m!1081291))

(declare-fun m!1081293 () Bool)

(assert (=> b!1173929 m!1081293))

(declare-fun m!1081295 () Bool)

(assert (=> b!1173929 m!1081295))

(declare-fun m!1081297 () Bool)

(assert (=> b!1173924 m!1081297))

(declare-fun m!1081299 () Bool)

(assert (=> b!1173928 m!1081299))

(declare-fun m!1081301 () Bool)

(assert (=> b!1173927 m!1081301))

(declare-fun m!1081303 () Bool)

(assert (=> b!1173927 m!1081303))

(declare-fun m!1081305 () Bool)

(assert (=> b!1173931 m!1081305))

(declare-fun m!1081307 () Bool)

(assert (=> mapNonEmpty!46127 m!1081307))

(declare-fun m!1081309 () Bool)

(assert (=> start!99418 m!1081309))

(declare-fun m!1081311 () Bool)

(assert (=> start!99418 m!1081311))

(declare-fun m!1081313 () Bool)

(assert (=> b!1173919 m!1081313))

(declare-fun m!1081315 () Bool)

(assert (=> b!1173921 m!1081315))

(declare-fun m!1081317 () Bool)

(assert (=> b!1173921 m!1081317))

(assert (=> b!1173921 m!1081317))

(declare-fun m!1081319 () Bool)

(assert (=> b!1173921 m!1081319))

(declare-fun m!1081321 () Bool)

(assert (=> b!1173921 m!1081321))

(declare-fun m!1081323 () Bool)

(assert (=> b!1173926 m!1081323))

(declare-fun m!1081325 () Bool)

(assert (=> b!1173920 m!1081325))

(declare-fun m!1081327 () Bool)

(assert (=> b!1173920 m!1081327))

(declare-fun m!1081329 () Bool)

(assert (=> b!1173920 m!1081329))

(declare-fun m!1081331 () Bool)

(assert (=> b!1173920 m!1081331))

(declare-fun m!1081333 () Bool)

(assert (=> b!1173920 m!1081333))

(declare-fun m!1081335 () Bool)

(assert (=> b!1173918 m!1081335))

(declare-fun m!1081337 () Bool)

(assert (=> b!1173918 m!1081337))

(declare-fun m!1081339 () Bool)

(assert (=> b!1173918 m!1081339))

(declare-fun m!1081341 () Bool)

(assert (=> b!1173918 m!1081341))

(assert (=> b!1173918 m!1081315))

(declare-fun m!1081343 () Bool)

(assert (=> b!1173918 m!1081343))

(assert (=> b!1173918 m!1081315))

(declare-fun m!1081345 () Bool)

(assert (=> b!1173925 m!1081345))

(declare-fun m!1081347 () Bool)

(assert (=> b!1173925 m!1081347))

(assert (=> b!1173922 m!1081315))

(declare-fun m!1081349 () Bool)

(assert (=> b!1173914 m!1081349))

(declare-fun m!1081351 () Bool)

(assert (=> b!1173930 m!1081351))

(check-sat (not b!1173931) (not b!1173926) (not b!1173928) (not b!1173920) (not mapNonEmpty!46127) (not b!1173918) (not b!1173925) b_and!40853 (not b!1173921) (not b_lambda!20129) tp_is_empty!29533 (not b!1173924) (not b!1173930) (not start!99418) (not b_next!25003) (not b!1173927) (not b!1173919) (not b!1173929))
(check-sat b_and!40853 (not b_next!25003))

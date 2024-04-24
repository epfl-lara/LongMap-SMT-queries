; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99594 () Bool)

(assert start!99594)

(declare-fun b_free!24937 () Bool)

(declare-fun b_next!24937 () Bool)

(assert (=> start!99594 (= b_free!24937 (not b_next!24937))))

(declare-fun tp!87524 () Bool)

(declare-fun b_and!40743 () Bool)

(assert (=> start!99594 (= tp!87524 b_and!40743)))

(declare-fun res!778524 () Bool)

(declare-fun e!666948 () Bool)

(assert (=> start!99594 (=> (not res!778524) (not e!666948))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75803 0))(
  ( (array!75804 (arr!36545 (Array (_ BitVec 32) (_ BitVec 64))) (size!37082 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75803)

(assert (=> start!99594 (= res!778524 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37082 _keys!1208))))))

(assert (=> start!99594 e!666948))

(declare-fun tp_is_empty!29467 () Bool)

(assert (=> start!99594 tp_is_empty!29467))

(declare-fun array_inv!28000 (array!75803) Bool)

(assert (=> start!99594 (array_inv!28000 _keys!1208)))

(assert (=> start!99594 true))

(assert (=> start!99594 tp!87524))

(declare-datatypes ((V!44417 0))(
  ( (V!44418 (val!14790 Int)) )
))
(declare-datatypes ((ValueCell!14024 0))(
  ( (ValueCellFull!14024 (v!17424 V!44417)) (EmptyCell!14024) )
))
(declare-datatypes ((array!75805 0))(
  ( (array!75806 (arr!36546 (Array (_ BitVec 32) ValueCell!14024)) (size!37083 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75805)

(declare-fun e!666945 () Bool)

(declare-fun array_inv!28001 (array!75805) Bool)

(assert (=> start!99594 (and (array_inv!28001 _values!996) e!666945)))

(declare-fun b!1173212 () Bool)

(declare-fun res!778518 () Bool)

(declare-fun e!666944 () Bool)

(assert (=> b!1173212 (=> res!778518 e!666944)))

(declare-datatypes ((List!25664 0))(
  ( (Nil!25661) (Cons!25660 (h!26878 (_ BitVec 64)) (t!37585 List!25664)) )
))
(declare-fun contains!6884 (List!25664 (_ BitVec 64)) Bool)

(assert (=> b!1173212 (= res!778518 (contains!6884 Nil!25661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173213 () Bool)

(declare-fun e!666943 () Bool)

(assert (=> b!1173213 (= e!666943 tp_is_empty!29467)))

(declare-fun b!1173214 () Bool)

(declare-fun e!666947 () Bool)

(assert (=> b!1173214 (= e!666947 tp_is_empty!29467)))

(declare-fun b!1173215 () Bool)

(declare-fun res!778527 () Bool)

(declare-fun e!666949 () Bool)

(assert (=> b!1173215 (=> (not res!778527) (not e!666949))))

(declare-fun lt!528465 () array!75803)

(declare-fun arrayNoDuplicates!0 (array!75803 (_ BitVec 32) List!25664) Bool)

(assert (=> b!1173215 (= res!778527 (arrayNoDuplicates!0 lt!528465 #b00000000000000000000000000000000 Nil!25661))))

(declare-fun b!1173216 () Bool)

(declare-fun res!778526 () Bool)

(assert (=> b!1173216 (=> (not res!778526) (not e!666948))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173216 (= res!778526 (validMask!0 mask!1564))))

(declare-fun b!1173217 () Bool)

(declare-fun res!778528 () Bool)

(assert (=> b!1173217 (=> (not res!778528) (not e!666948))))

(assert (=> b!1173217 (= res!778528 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25661))))

(declare-fun b!1173218 () Bool)

(declare-fun res!778531 () Bool)

(assert (=> b!1173218 (=> (not res!778531) (not e!666948))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173218 (= res!778531 (validKeyInArray!0 k0!934))))

(declare-fun b!1173219 () Bool)

(assert (=> b!1173219 (= e!666944 true)))

(declare-fun lt!528475 () Bool)

(assert (=> b!1173219 (= lt!528475 (contains!6884 Nil!25661 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173220 () Bool)

(assert (=> b!1173220 (= e!666948 e!666949)))

(declare-fun res!778530 () Bool)

(assert (=> b!1173220 (=> (not res!778530) (not e!666949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75803 (_ BitVec 32)) Bool)

(assert (=> b!1173220 (= res!778530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528465 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173220 (= lt!528465 (array!75804 (store (arr!36545 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37082 _keys!1208)))))

(declare-fun mapNonEmpty!46028 () Bool)

(declare-fun mapRes!46028 () Bool)

(declare-fun tp!87525 () Bool)

(assert (=> mapNonEmpty!46028 (= mapRes!46028 (and tp!87525 e!666947))))

(declare-fun mapRest!46028 () (Array (_ BitVec 32) ValueCell!14024))

(declare-fun mapValue!46028 () ValueCell!14024)

(declare-fun mapKey!46028 () (_ BitVec 32))

(assert (=> mapNonEmpty!46028 (= (arr!36546 _values!996) (store mapRest!46028 mapKey!46028 mapValue!46028))))

(declare-fun b!1173221 () Bool)

(declare-fun res!778523 () Bool)

(assert (=> b!1173221 (=> res!778523 e!666944)))

(declare-fun noDuplicate!1632 (List!25664) Bool)

(assert (=> b!1173221 (= res!778523 (not (noDuplicate!1632 Nil!25661)))))

(declare-fun b!1173222 () Bool)

(declare-fun e!666952 () Bool)

(assert (=> b!1173222 (= e!666949 (not e!666952))))

(declare-fun res!778516 () Bool)

(assert (=> b!1173222 (=> res!778516 e!666952)))

(assert (=> b!1173222 (= res!778516 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173222 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38627 0))(
  ( (Unit!38628) )
))
(declare-fun lt!528473 () Unit!38627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75803 (_ BitVec 64) (_ BitVec 32)) Unit!38627)

(assert (=> b!1173222 (= lt!528473 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173223 () Bool)

(declare-fun res!778514 () Bool)

(assert (=> b!1173223 (=> (not res!778514) (not e!666948))))

(assert (=> b!1173223 (= res!778514 (= (select (arr!36545 _keys!1208) i!673) k0!934))))

(declare-fun b!1173224 () Bool)

(declare-fun e!666951 () Bool)

(declare-fun e!666950 () Bool)

(assert (=> b!1173224 (= e!666951 e!666950)))

(declare-fun res!778515 () Bool)

(assert (=> b!1173224 (=> res!778515 e!666950)))

(assert (=> b!1173224 (= res!778515 (not (validKeyInArray!0 (select (arr!36545 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18928 0))(
  ( (tuple2!18929 (_1!9475 (_ BitVec 64)) (_2!9475 V!44417)) )
))
(declare-datatypes ((List!25665 0))(
  ( (Nil!25662) (Cons!25661 (h!26879 tuple2!18928) (t!37586 List!25665)) )
))
(declare-datatypes ((ListLongMap!16905 0))(
  ( (ListLongMap!16906 (toList!8468 List!25665)) )
))
(declare-fun lt!528471 () ListLongMap!16905)

(declare-fun lt!528467 () ListLongMap!16905)

(assert (=> b!1173224 (= lt!528471 lt!528467)))

(declare-fun lt!528472 () ListLongMap!16905)

(declare-fun -!1521 (ListLongMap!16905 (_ BitVec 64)) ListLongMap!16905)

(assert (=> b!1173224 (= lt!528467 (-!1521 lt!528472 k0!934))))

(declare-fun zeroValue!944 () V!44417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44417)

(declare-fun lt!528470 () array!75805)

(declare-fun getCurrentListMapNoExtraKeys!4955 (array!75803 array!75805 (_ BitVec 32) (_ BitVec 32) V!44417 V!44417 (_ BitVec 32) Int) ListLongMap!16905)

(assert (=> b!1173224 (= lt!528471 (getCurrentListMapNoExtraKeys!4955 lt!528465 lt!528470 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173224 (= lt!528472 (getCurrentListMapNoExtraKeys!4955 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528464 () Unit!38627)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!746 (array!75803 array!75805 (_ BitVec 32) (_ BitVec 32) V!44417 V!44417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38627)

(assert (=> b!1173224 (= lt!528464 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!746 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173225 () Bool)

(declare-fun e!666941 () Bool)

(assert (=> b!1173225 (= e!666950 e!666941)))

(declare-fun res!778520 () Bool)

(assert (=> b!1173225 (=> res!778520 e!666941)))

(assert (=> b!1173225 (= res!778520 (not (= (select (arr!36545 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666942 () Bool)

(assert (=> b!1173225 e!666942))

(declare-fun res!778517 () Bool)

(assert (=> b!1173225 (=> (not res!778517) (not e!666942))))

(declare-fun lt!528466 () V!44417)

(declare-fun lt!528474 () ListLongMap!16905)

(declare-fun +!3804 (ListLongMap!16905 tuple2!18928) ListLongMap!16905)

(declare-fun get!18668 (ValueCell!14024 V!44417) V!44417)

(assert (=> b!1173225 (= res!778517 (= lt!528474 (+!3804 lt!528467 (tuple2!18929 (select (arr!36545 _keys!1208) from!1455) (get!18668 (select (arr!36546 _values!996) from!1455) lt!528466)))))))

(declare-fun b!1173226 () Bool)

(declare-fun res!778521 () Bool)

(assert (=> b!1173226 (=> (not res!778521) (not e!666948))))

(assert (=> b!1173226 (= res!778521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173227 () Bool)

(declare-fun e!666946 () Bool)

(assert (=> b!1173227 (= e!666946 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46028 () Bool)

(assert (=> mapIsEmpty!46028 mapRes!46028))

(declare-fun b!1173228 () Bool)

(assert (=> b!1173228 (= e!666942 e!666946)))

(declare-fun res!778522 () Bool)

(assert (=> b!1173228 (=> res!778522 e!666946)))

(assert (=> b!1173228 (= res!778522 (not (= (select (arr!36545 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173229 () Bool)

(assert (=> b!1173229 (= e!666945 (and e!666943 mapRes!46028))))

(declare-fun condMapEmpty!46028 () Bool)

(declare-fun mapDefault!46028 () ValueCell!14024)

(assert (=> b!1173229 (= condMapEmpty!46028 (= (arr!36546 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14024)) mapDefault!46028)))))

(declare-fun b!1173230 () Bool)

(assert (=> b!1173230 (= e!666941 e!666944)))

(declare-fun res!778532 () Bool)

(assert (=> b!1173230 (=> res!778532 e!666944)))

(assert (=> b!1173230 (= res!778532 (or (bvsge (size!37082 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37082 _keys!1208)) (bvsge from!1455 (size!37082 _keys!1208))))))

(assert (=> b!1173230 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25661)))

(declare-fun lt!528468 () Unit!38627)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75803 (_ BitVec 32) (_ BitVec 32)) Unit!38627)

(assert (=> b!1173230 (= lt!528468 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173230 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528469 () Unit!38627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75803 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38627)

(assert (=> b!1173230 (= lt!528469 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1173231 () Bool)

(declare-fun res!778529 () Bool)

(assert (=> b!1173231 (=> (not res!778529) (not e!666948))))

(assert (=> b!1173231 (= res!778529 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37082 _keys!1208))))))

(declare-fun b!1173232 () Bool)

(declare-fun res!778519 () Bool)

(assert (=> b!1173232 (=> (not res!778519) (not e!666948))))

(assert (=> b!1173232 (= res!778519 (and (= (size!37083 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37082 _keys!1208) (size!37083 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173233 () Bool)

(assert (=> b!1173233 (= e!666952 e!666951)))

(declare-fun res!778525 () Bool)

(assert (=> b!1173233 (=> res!778525 e!666951)))

(assert (=> b!1173233 (= res!778525 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173233 (= lt!528474 (getCurrentListMapNoExtraKeys!4955 lt!528465 lt!528470 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173233 (= lt!528470 (array!75806 (store (arr!36546 _values!996) i!673 (ValueCellFull!14024 lt!528466)) (size!37083 _values!996)))))

(declare-fun dynLambda!2934 (Int (_ BitVec 64)) V!44417)

(assert (=> b!1173233 (= lt!528466 (dynLambda!2934 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528463 () ListLongMap!16905)

(assert (=> b!1173233 (= lt!528463 (getCurrentListMapNoExtraKeys!4955 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99594 res!778524) b!1173216))

(assert (= (and b!1173216 res!778526) b!1173232))

(assert (= (and b!1173232 res!778519) b!1173226))

(assert (= (and b!1173226 res!778521) b!1173217))

(assert (= (and b!1173217 res!778528) b!1173231))

(assert (= (and b!1173231 res!778529) b!1173218))

(assert (= (and b!1173218 res!778531) b!1173223))

(assert (= (and b!1173223 res!778514) b!1173220))

(assert (= (and b!1173220 res!778530) b!1173215))

(assert (= (and b!1173215 res!778527) b!1173222))

(assert (= (and b!1173222 (not res!778516)) b!1173233))

(assert (= (and b!1173233 (not res!778525)) b!1173224))

(assert (= (and b!1173224 (not res!778515)) b!1173225))

(assert (= (and b!1173225 res!778517) b!1173228))

(assert (= (and b!1173228 (not res!778522)) b!1173227))

(assert (= (and b!1173225 (not res!778520)) b!1173230))

(assert (= (and b!1173230 (not res!778532)) b!1173221))

(assert (= (and b!1173221 (not res!778523)) b!1173212))

(assert (= (and b!1173212 (not res!778518)) b!1173219))

(assert (= (and b!1173229 condMapEmpty!46028) mapIsEmpty!46028))

(assert (= (and b!1173229 (not condMapEmpty!46028)) mapNonEmpty!46028))

(get-info :version)

(assert (= (and mapNonEmpty!46028 ((_ is ValueCellFull!14024) mapValue!46028)) b!1173214))

(assert (= (and b!1173229 ((_ is ValueCellFull!14024) mapDefault!46028)) b!1173213))

(assert (= start!99594 b!1173229))

(declare-fun b_lambda!20075 () Bool)

(assert (=> (not b_lambda!20075) (not b!1173233)))

(declare-fun t!37584 () Bool)

(declare-fun tb!9741 () Bool)

(assert (=> (and start!99594 (= defaultEntry!1004 defaultEntry!1004) t!37584) tb!9741))

(declare-fun result!20057 () Bool)

(assert (=> tb!9741 (= result!20057 tp_is_empty!29467)))

(assert (=> b!1173233 t!37584))

(declare-fun b_and!40745 () Bool)

(assert (= b_and!40743 (and (=> t!37584 result!20057) b_and!40745)))

(declare-fun m!1081311 () Bool)

(assert (=> b!1173228 m!1081311))

(declare-fun m!1081313 () Bool)

(assert (=> b!1173220 m!1081313))

(declare-fun m!1081315 () Bool)

(assert (=> b!1173220 m!1081315))

(declare-fun m!1081317 () Bool)

(assert (=> b!1173227 m!1081317))

(declare-fun m!1081319 () Bool)

(assert (=> b!1173223 m!1081319))

(declare-fun m!1081321 () Bool)

(assert (=> b!1173218 m!1081321))

(declare-fun m!1081323 () Bool)

(assert (=> b!1173219 m!1081323))

(declare-fun m!1081325 () Bool)

(assert (=> b!1173221 m!1081325))

(declare-fun m!1081327 () Bool)

(assert (=> b!1173224 m!1081327))

(declare-fun m!1081329 () Bool)

(assert (=> b!1173224 m!1081329))

(declare-fun m!1081331 () Bool)

(assert (=> b!1173224 m!1081331))

(assert (=> b!1173224 m!1081311))

(declare-fun m!1081333 () Bool)

(assert (=> b!1173224 m!1081333))

(declare-fun m!1081335 () Bool)

(assert (=> b!1173224 m!1081335))

(assert (=> b!1173224 m!1081311))

(declare-fun m!1081337 () Bool)

(assert (=> b!1173233 m!1081337))

(declare-fun m!1081339 () Bool)

(assert (=> b!1173233 m!1081339))

(declare-fun m!1081341 () Bool)

(assert (=> b!1173233 m!1081341))

(declare-fun m!1081343 () Bool)

(assert (=> b!1173233 m!1081343))

(declare-fun m!1081345 () Bool)

(assert (=> b!1173226 m!1081345))

(declare-fun m!1081347 () Bool)

(assert (=> mapNonEmpty!46028 m!1081347))

(declare-fun m!1081349 () Bool)

(assert (=> b!1173212 m!1081349))

(declare-fun m!1081351 () Bool)

(assert (=> b!1173217 m!1081351))

(declare-fun m!1081353 () Bool)

(assert (=> b!1173230 m!1081353))

(declare-fun m!1081355 () Bool)

(assert (=> b!1173230 m!1081355))

(declare-fun m!1081357 () Bool)

(assert (=> b!1173230 m!1081357))

(declare-fun m!1081359 () Bool)

(assert (=> b!1173230 m!1081359))

(declare-fun m!1081361 () Bool)

(assert (=> start!99594 m!1081361))

(declare-fun m!1081363 () Bool)

(assert (=> start!99594 m!1081363))

(declare-fun m!1081365 () Bool)

(assert (=> b!1173215 m!1081365))

(declare-fun m!1081367 () Bool)

(assert (=> b!1173222 m!1081367))

(declare-fun m!1081369 () Bool)

(assert (=> b!1173222 m!1081369))

(declare-fun m!1081371 () Bool)

(assert (=> b!1173216 m!1081371))

(assert (=> b!1173225 m!1081311))

(declare-fun m!1081373 () Bool)

(assert (=> b!1173225 m!1081373))

(assert (=> b!1173225 m!1081373))

(declare-fun m!1081375 () Bool)

(assert (=> b!1173225 m!1081375))

(declare-fun m!1081377 () Bool)

(assert (=> b!1173225 m!1081377))

(check-sat (not b!1173215) b_and!40745 (not b!1173226) (not b_next!24937) (not b!1173227) (not b!1173217) (not b!1173219) tp_is_empty!29467 (not b!1173233) (not b!1173220) (not b!1173222) (not b!1173216) (not b!1173218) (not b!1173212) (not b!1173225) (not b_lambda!20075) (not b!1173230) (not b!1173224) (not start!99594) (not b!1173221) (not mapNonEmpty!46028))
(check-sat b_and!40745 (not b_next!24937))

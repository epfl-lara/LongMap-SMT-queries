; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99400 () Bool)

(assert start!99400)

(declare-fun b_free!24985 () Bool)

(declare-fun b_next!24985 () Bool)

(assert (=> start!99400 (= b_free!24985 (not b_next!24985))))

(declare-fun tp!87669 () Bool)

(declare-fun b_and!40815 () Bool)

(assert (=> start!99400 (= tp!87669 b_and!40815)))

(declare-fun b!1173355 () Bool)

(declare-fun res!779168 () Bool)

(declare-fun e!666937 () Bool)

(assert (=> b!1173355 (=> (not res!779168) (not e!666937))))

(declare-datatypes ((array!75772 0))(
  ( (array!75773 (arr!36536 (Array (_ BitVec 32) (_ BitVec 64))) (size!37074 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75772)

(declare-datatypes ((List!25742 0))(
  ( (Nil!25739) (Cons!25738 (h!26947 (_ BitVec 64)) (t!37710 List!25742)) )
))
(declare-fun arrayNoDuplicates!0 (array!75772 (_ BitVec 32) List!25742) Bool)

(assert (=> b!1173355 (= res!779168 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25739))))

(declare-fun b!1173356 () Bool)

(declare-fun res!779160 () Bool)

(assert (=> b!1173356 (=> (not res!779160) (not e!666937))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1173356 (= res!779160 (= (select (arr!36536 _keys!1208) i!673) k0!934))))

(declare-fun b!1173357 () Bool)

(declare-fun e!666933 () Bool)

(declare-fun e!666932 () Bool)

(assert (=> b!1173357 (= e!666933 e!666932)))

(declare-fun res!779170 () Bool)

(assert (=> b!1173357 (=> res!779170 e!666932)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173357 (= res!779170 (not (validKeyInArray!0 (select (arr!36536 _keys!1208) from!1455))))))

(declare-datatypes ((V!44481 0))(
  ( (V!44482 (val!14814 Int)) )
))
(declare-datatypes ((tuple2!19026 0))(
  ( (tuple2!19027 (_1!9524 (_ BitVec 64)) (_2!9524 V!44481)) )
))
(declare-datatypes ((List!25743 0))(
  ( (Nil!25740) (Cons!25739 (h!26948 tuple2!19026) (t!37711 List!25743)) )
))
(declare-datatypes ((ListLongMap!16995 0))(
  ( (ListLongMap!16996 (toList!8513 List!25743)) )
))
(declare-fun lt!528770 () ListLongMap!16995)

(declare-fun lt!528769 () ListLongMap!16995)

(assert (=> b!1173357 (= lt!528770 lt!528769)))

(declare-fun lt!528773 () ListLongMap!16995)

(declare-fun -!1500 (ListLongMap!16995 (_ BitVec 64)) ListLongMap!16995)

(assert (=> b!1173357 (= lt!528769 (-!1500 lt!528773 k0!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14048 0))(
  ( (ValueCellFull!14048 (v!17451 V!44481)) (EmptyCell!14048) )
))
(declare-datatypes ((array!75774 0))(
  ( (array!75775 (arr!36537 (Array (_ BitVec 32) ValueCell!14048)) (size!37075 (_ BitVec 32))) )
))
(declare-fun lt!528771 () array!75774)

(declare-fun minValue!944 () V!44481)

(declare-fun zeroValue!944 () V!44481)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528772 () array!75772)

(declare-fun getCurrentListMapNoExtraKeys!4986 (array!75772 array!75774 (_ BitVec 32) (_ BitVec 32) V!44481 V!44481 (_ BitVec 32) Int) ListLongMap!16995)

(assert (=> b!1173357 (= lt!528770 (getCurrentListMapNoExtraKeys!4986 lt!528772 lt!528771 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75774)

(assert (=> b!1173357 (= lt!528773 (getCurrentListMapNoExtraKeys!4986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38522 0))(
  ( (Unit!38523) )
))
(declare-fun lt!528768 () Unit!38522)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!764 (array!75772 array!75774 (_ BitVec 32) (_ BitVec 32) V!44481 V!44481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38522)

(assert (=> b!1173357 (= lt!528768 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173358 () Bool)

(declare-fun e!666934 () Bool)

(declare-fun e!666936 () Bool)

(declare-fun mapRes!46100 () Bool)

(assert (=> b!1173358 (= e!666934 (and e!666936 mapRes!46100))))

(declare-fun condMapEmpty!46100 () Bool)

(declare-fun mapDefault!46100 () ValueCell!14048)

(assert (=> b!1173358 (= condMapEmpty!46100 (= (arr!36537 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14048)) mapDefault!46100)))))

(declare-fun b!1173359 () Bool)

(declare-fun e!666929 () Bool)

(declare-fun tp_is_empty!29515 () Bool)

(assert (=> b!1173359 (= e!666929 tp_is_empty!29515)))

(declare-fun b!1173360 () Bool)

(declare-fun e!666940 () Bool)

(declare-fun e!666938 () Bool)

(assert (=> b!1173360 (= e!666940 (not e!666938))))

(declare-fun res!779159 () Bool)

(assert (=> b!1173360 (=> res!779159 e!666938)))

(assert (=> b!1173360 (= res!779159 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173360 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528765 () Unit!38522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75772 (_ BitVec 64) (_ BitVec 32)) Unit!38522)

(assert (=> b!1173360 (= lt!528765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173361 () Bool)

(declare-fun res!779157 () Bool)

(assert (=> b!1173361 (=> (not res!779157) (not e!666937))))

(assert (=> b!1173361 (= res!779157 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37074 _keys!1208))))))

(declare-fun e!666931 () Bool)

(declare-fun b!1173362 () Bool)

(assert (=> b!1173362 (= e!666931 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173363 () Bool)

(declare-fun res!779162 () Bool)

(assert (=> b!1173363 (=> (not res!779162) (not e!666940))))

(assert (=> b!1173363 (= res!779162 (arrayNoDuplicates!0 lt!528772 #b00000000000000000000000000000000 Nil!25739))))

(declare-fun mapNonEmpty!46100 () Bool)

(declare-fun tp!87668 () Bool)

(assert (=> mapNonEmpty!46100 (= mapRes!46100 (and tp!87668 e!666929))))

(declare-fun mapKey!46100 () (_ BitVec 32))

(declare-fun mapValue!46100 () ValueCell!14048)

(declare-fun mapRest!46100 () (Array (_ BitVec 32) ValueCell!14048))

(assert (=> mapNonEmpty!46100 (= (arr!36537 _values!996) (store mapRest!46100 mapKey!46100 mapValue!46100))))

(declare-fun res!779166 () Bool)

(assert (=> start!99400 (=> (not res!779166) (not e!666937))))

(assert (=> start!99400 (= res!779166 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37074 _keys!1208))))))

(assert (=> start!99400 e!666937))

(assert (=> start!99400 tp_is_empty!29515))

(declare-fun array_inv!28020 (array!75772) Bool)

(assert (=> start!99400 (array_inv!28020 _keys!1208)))

(assert (=> start!99400 true))

(assert (=> start!99400 tp!87669))

(declare-fun array_inv!28021 (array!75774) Bool)

(assert (=> start!99400 (and (array_inv!28021 _values!996) e!666934)))

(declare-fun b!1173364 () Bool)

(assert (=> b!1173364 (= e!666936 tp_is_empty!29515)))

(declare-fun b!1173365 () Bool)

(declare-fun e!666939 () Unit!38522)

(declare-fun Unit!38524 () Unit!38522)

(assert (=> b!1173365 (= e!666939 Unit!38524)))

(declare-fun lt!528766 () Unit!38522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75772 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38522)

(assert (=> b!1173365 (= lt!528766 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1173365 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528763 () Unit!38522)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75772 (_ BitVec 32) (_ BitVec 32)) Unit!38522)

(assert (=> b!1173365 (= lt!528763 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173365 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25739)))

(declare-fun lt!528762 () Unit!38522)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75772 (_ BitVec 64) (_ BitVec 32) List!25742) Unit!38522)

(assert (=> b!1173365 (= lt!528762 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25739))))

(assert (=> b!1173365 false))

(declare-fun b!1173366 () Bool)

(declare-fun res!779163 () Bool)

(assert (=> b!1173366 (=> (not res!779163) (not e!666937))))

(assert (=> b!1173366 (= res!779163 (and (= (size!37075 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37074 _keys!1208) (size!37075 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173367 () Bool)

(declare-fun res!779164 () Bool)

(assert (=> b!1173367 (=> (not res!779164) (not e!666937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173367 (= res!779164 (validMask!0 mask!1564))))

(declare-fun b!1173368 () Bool)

(declare-fun Unit!38525 () Unit!38522)

(assert (=> b!1173368 (= e!666939 Unit!38525)))

(declare-fun b!1173369 () Bool)

(assert (=> b!1173369 (= e!666937 e!666940)))

(declare-fun res!779167 () Bool)

(assert (=> b!1173369 (=> (not res!779167) (not e!666940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75772 (_ BitVec 32)) Bool)

(assert (=> b!1173369 (= res!779167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528772 mask!1564))))

(assert (=> b!1173369 (= lt!528772 (array!75773 (store (arr!36536 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37074 _keys!1208)))))

(declare-fun b!1173370 () Bool)

(assert (=> b!1173370 (= e!666938 e!666933)))

(declare-fun res!779158 () Bool)

(assert (=> b!1173370 (=> res!779158 e!666933)))

(assert (=> b!1173370 (= res!779158 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!528774 () ListLongMap!16995)

(assert (=> b!1173370 (= lt!528774 (getCurrentListMapNoExtraKeys!4986 lt!528772 lt!528771 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528761 () V!44481)

(assert (=> b!1173370 (= lt!528771 (array!75775 (store (arr!36537 _values!996) i!673 (ValueCellFull!14048 lt!528761)) (size!37075 _values!996)))))

(declare-fun dynLambda!2910 (Int (_ BitVec 64)) V!44481)

(assert (=> b!1173370 (= lt!528761 (dynLambda!2910 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528764 () ListLongMap!16995)

(assert (=> b!1173370 (= lt!528764 (getCurrentListMapNoExtraKeys!4986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173371 () Bool)

(assert (=> b!1173371 (= e!666932 true)))

(assert (=> b!1173371 (not (= (select (arr!36536 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528767 () Unit!38522)

(assert (=> b!1173371 (= lt!528767 e!666939)))

(declare-fun c!116575 () Bool)

(assert (=> b!1173371 (= c!116575 (= (select (arr!36536 _keys!1208) from!1455) k0!934))))

(declare-fun e!666935 () Bool)

(assert (=> b!1173371 e!666935))

(declare-fun res!779169 () Bool)

(assert (=> b!1173371 (=> (not res!779169) (not e!666935))))

(declare-fun +!3827 (ListLongMap!16995 tuple2!19026) ListLongMap!16995)

(declare-fun get!18655 (ValueCell!14048 V!44481) V!44481)

(assert (=> b!1173371 (= res!779169 (= lt!528774 (+!3827 lt!528769 (tuple2!19027 (select (arr!36536 _keys!1208) from!1455) (get!18655 (select (arr!36537 _values!996) from!1455) lt!528761)))))))

(declare-fun b!1173372 () Bool)

(assert (=> b!1173372 (= e!666935 e!666931)))

(declare-fun res!779156 () Bool)

(assert (=> b!1173372 (=> res!779156 e!666931)))

(assert (=> b!1173372 (= res!779156 (not (= (select (arr!36536 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173373 () Bool)

(declare-fun res!779161 () Bool)

(assert (=> b!1173373 (=> (not res!779161) (not e!666937))))

(assert (=> b!1173373 (= res!779161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46100 () Bool)

(assert (=> mapIsEmpty!46100 mapRes!46100))

(declare-fun b!1173374 () Bool)

(declare-fun res!779165 () Bool)

(assert (=> b!1173374 (=> (not res!779165) (not e!666937))))

(assert (=> b!1173374 (= res!779165 (validKeyInArray!0 k0!934))))

(assert (= (and start!99400 res!779166) b!1173367))

(assert (= (and b!1173367 res!779164) b!1173366))

(assert (= (and b!1173366 res!779163) b!1173373))

(assert (= (and b!1173373 res!779161) b!1173355))

(assert (= (and b!1173355 res!779168) b!1173361))

(assert (= (and b!1173361 res!779157) b!1173374))

(assert (= (and b!1173374 res!779165) b!1173356))

(assert (= (and b!1173356 res!779160) b!1173369))

(assert (= (and b!1173369 res!779167) b!1173363))

(assert (= (and b!1173363 res!779162) b!1173360))

(assert (= (and b!1173360 (not res!779159)) b!1173370))

(assert (= (and b!1173370 (not res!779158)) b!1173357))

(assert (= (and b!1173357 (not res!779170)) b!1173371))

(assert (= (and b!1173371 res!779169) b!1173372))

(assert (= (and b!1173372 (not res!779156)) b!1173362))

(assert (= (and b!1173371 c!116575) b!1173365))

(assert (= (and b!1173371 (not c!116575)) b!1173368))

(assert (= (and b!1173358 condMapEmpty!46100) mapIsEmpty!46100))

(assert (= (and b!1173358 (not condMapEmpty!46100)) mapNonEmpty!46100))

(get-info :version)

(assert (= (and mapNonEmpty!46100 ((_ is ValueCellFull!14048) mapValue!46100)) b!1173359))

(assert (= (and b!1173358 ((_ is ValueCellFull!14048) mapDefault!46100)) b!1173364))

(assert (= start!99400 b!1173358))

(declare-fun b_lambda!20111 () Bool)

(assert (=> (not b_lambda!20111) (not b!1173370)))

(declare-fun t!37709 () Bool)

(declare-fun tb!9789 () Bool)

(assert (=> (and start!99400 (= defaultEntry!1004 defaultEntry!1004) t!37709) tb!9789))

(declare-fun result!20153 () Bool)

(assert (=> tb!9789 (= result!20153 tp_is_empty!29515)))

(assert (=> b!1173370 t!37709))

(declare-fun b_and!40817 () Bool)

(assert (= b_and!40815 (and (=> t!37709 result!20153) b_and!40817)))

(declare-fun m!1080713 () Bool)

(assert (=> b!1173357 m!1080713))

(declare-fun m!1080715 () Bool)

(assert (=> b!1173357 m!1080715))

(declare-fun m!1080717 () Bool)

(assert (=> b!1173357 m!1080717))

(declare-fun m!1080719 () Bool)

(assert (=> b!1173357 m!1080719))

(declare-fun m!1080721 () Bool)

(assert (=> b!1173357 m!1080721))

(assert (=> b!1173357 m!1080719))

(declare-fun m!1080723 () Bool)

(assert (=> b!1173357 m!1080723))

(declare-fun m!1080725 () Bool)

(assert (=> b!1173356 m!1080725))

(declare-fun m!1080727 () Bool)

(assert (=> b!1173365 m!1080727))

(declare-fun m!1080729 () Bool)

(assert (=> b!1173365 m!1080729))

(declare-fun m!1080731 () Bool)

(assert (=> b!1173365 m!1080731))

(declare-fun m!1080733 () Bool)

(assert (=> b!1173365 m!1080733))

(declare-fun m!1080735 () Bool)

(assert (=> b!1173365 m!1080735))

(declare-fun m!1080737 () Bool)

(assert (=> mapNonEmpty!46100 m!1080737))

(declare-fun m!1080739 () Bool)

(assert (=> b!1173362 m!1080739))

(declare-fun m!1080741 () Bool)

(assert (=> b!1173360 m!1080741))

(declare-fun m!1080743 () Bool)

(assert (=> b!1173360 m!1080743))

(declare-fun m!1080745 () Bool)

(assert (=> b!1173363 m!1080745))

(declare-fun m!1080747 () Bool)

(assert (=> b!1173370 m!1080747))

(declare-fun m!1080749 () Bool)

(assert (=> b!1173370 m!1080749))

(declare-fun m!1080751 () Bool)

(assert (=> b!1173370 m!1080751))

(declare-fun m!1080753 () Bool)

(assert (=> b!1173370 m!1080753))

(assert (=> b!1173371 m!1080719))

(declare-fun m!1080755 () Bool)

(assert (=> b!1173371 m!1080755))

(assert (=> b!1173371 m!1080755))

(declare-fun m!1080757 () Bool)

(assert (=> b!1173371 m!1080757))

(declare-fun m!1080759 () Bool)

(assert (=> b!1173371 m!1080759))

(declare-fun m!1080761 () Bool)

(assert (=> b!1173355 m!1080761))

(declare-fun m!1080763 () Bool)

(assert (=> b!1173373 m!1080763))

(declare-fun m!1080765 () Bool)

(assert (=> b!1173369 m!1080765))

(declare-fun m!1080767 () Bool)

(assert (=> b!1173369 m!1080767))

(declare-fun m!1080769 () Bool)

(assert (=> b!1173367 m!1080769))

(declare-fun m!1080771 () Bool)

(assert (=> b!1173374 m!1080771))

(assert (=> b!1173372 m!1080719))

(declare-fun m!1080773 () Bool)

(assert (=> start!99400 m!1080773))

(declare-fun m!1080775 () Bool)

(assert (=> start!99400 m!1080775))

(check-sat (not b!1173360) (not b_next!24985) (not b!1173369) (not b!1173355) (not b!1173362) (not b!1173367) (not b!1173357) tp_is_empty!29515 (not b!1173363) (not b!1173373) (not mapNonEmpty!46100) b_and!40817 (not b!1173370) (not start!99400) (not b!1173365) (not b!1173374) (not b_lambda!20111) (not b!1173371))
(check-sat b_and!40817 (not b_next!24985))

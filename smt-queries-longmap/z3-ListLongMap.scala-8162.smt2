; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99840 () Bool)

(assert start!99840)

(declare-fun b_free!25419 () Bool)

(declare-fun b_next!25419 () Bool)

(assert (=> start!99840 (= b_free!25419 (not b_next!25419))))

(declare-fun tp!88971 () Bool)

(declare-fun b_and!41705 () Bool)

(assert (=> start!99840 (= tp!88971 b_and!41705)))

(declare-fun b!1187276 () Bool)

(declare-fun e!675073 () Bool)

(declare-fun tp_is_empty!29949 () Bool)

(assert (=> b!1187276 (= e!675073 tp_is_empty!29949)))

(declare-fun b!1187277 () Bool)

(declare-fun e!675075 () Bool)

(declare-fun e!675071 () Bool)

(assert (=> b!1187277 (= e!675075 e!675071)))

(declare-fun res!789336 () Bool)

(assert (=> b!1187277 (=> res!789336 e!675071)))

(declare-datatypes ((array!76693 0))(
  ( (array!76694 (arr!36996 (Array (_ BitVec 32) (_ BitVec 64))) (size!37532 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76693)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187277 (= res!789336 (not (validKeyInArray!0 (select (arr!36996 _keys!1208) from!1455))))))

(declare-datatypes ((V!45059 0))(
  ( (V!45060 (val!15031 Int)) )
))
(declare-datatypes ((tuple2!19294 0))(
  ( (tuple2!19295 (_1!9658 (_ BitVec 64)) (_2!9658 V!45059)) )
))
(declare-datatypes ((List!26034 0))(
  ( (Nil!26031) (Cons!26030 (h!27239 tuple2!19294) (t!38445 List!26034)) )
))
(declare-datatypes ((ListLongMap!17263 0))(
  ( (ListLongMap!17264 (toList!8647 List!26034)) )
))
(declare-fun lt!539705 () ListLongMap!17263)

(declare-fun lt!539710 () ListLongMap!17263)

(assert (=> b!1187277 (= lt!539705 lt!539710)))

(declare-fun lt!539699 () ListLongMap!17263)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1678 (ListLongMap!17263 (_ BitVec 64)) ListLongMap!17263)

(assert (=> b!1187277 (= lt!539710 (-!1678 lt!539699 k0!934))))

(declare-fun zeroValue!944 () V!45059)

(declare-fun lt!539694 () array!76693)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14265 0))(
  ( (ValueCellFull!14265 (v!17669 V!45059)) (EmptyCell!14265) )
))
(declare-datatypes ((array!76695 0))(
  ( (array!76696 (arr!36997 (Array (_ BitVec 32) ValueCell!14265)) (size!37533 (_ BitVec 32))) )
))
(declare-fun lt!539712 () array!76695)

(declare-fun minValue!944 () V!45059)

(declare-fun getCurrentListMapNoExtraKeys!5090 (array!76693 array!76695 (_ BitVec 32) (_ BitVec 32) V!45059 V!45059 (_ BitVec 32) Int) ListLongMap!17263)

(assert (=> b!1187277 (= lt!539705 (getCurrentListMapNoExtraKeys!5090 lt!539694 lt!539712 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76695)

(assert (=> b!1187277 (= lt!539699 (getCurrentListMapNoExtraKeys!5090 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39367 0))(
  ( (Unit!39368) )
))
(declare-fun lt!539708 () Unit!39367)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!890 (array!76693 array!76695 (_ BitVec 32) (_ BitVec 32) V!45059 V!45059 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39367)

(assert (=> b!1187277 (= lt!539708 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!890 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187278 () Bool)

(assert (=> b!1187278 (= e!675071 true)))

(declare-fun lt!539709 () ListLongMap!17263)

(declare-fun lt!539707 () ListLongMap!17263)

(assert (=> b!1187278 (= (-!1678 lt!539709 k0!934) lt!539707)))

(declare-fun lt!539706 () Unit!39367)

(declare-fun lt!539704 () V!45059)

(declare-fun addRemoveCommutativeForDiffKeys!198 (ListLongMap!17263 (_ BitVec 64) V!45059 (_ BitVec 64)) Unit!39367)

(assert (=> b!1187278 (= lt!539706 (addRemoveCommutativeForDiffKeys!198 lt!539699 (select (arr!36996 _keys!1208) from!1455) lt!539704 k0!934))))

(declare-fun lt!539695 () ListLongMap!17263)

(assert (=> b!1187278 (and (= lt!539695 lt!539709) (= lt!539710 lt!539705))))

(declare-fun lt!539696 () tuple2!19294)

(declare-fun +!3935 (ListLongMap!17263 tuple2!19294) ListLongMap!17263)

(assert (=> b!1187278 (= lt!539709 (+!3935 lt!539699 lt!539696))))

(assert (=> b!1187278 (not (= (select (arr!36996 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539700 () Unit!39367)

(declare-fun e!675080 () Unit!39367)

(assert (=> b!1187278 (= lt!539700 e!675080)))

(declare-fun c!117252 () Bool)

(assert (=> b!1187278 (= c!117252 (= (select (arr!36996 _keys!1208) from!1455) k0!934))))

(declare-fun e!675081 () Bool)

(assert (=> b!1187278 e!675081))

(declare-fun res!789341 () Bool)

(assert (=> b!1187278 (=> (not res!789341) (not e!675081))))

(declare-fun lt!539703 () ListLongMap!17263)

(assert (=> b!1187278 (= res!789341 (= lt!539703 lt!539707))))

(assert (=> b!1187278 (= lt!539707 (+!3935 lt!539710 lt!539696))))

(assert (=> b!1187278 (= lt!539696 (tuple2!19295 (select (arr!36996 _keys!1208) from!1455) lt!539704))))

(declare-fun lt!539697 () V!45059)

(declare-fun get!18948 (ValueCell!14265 V!45059) V!45059)

(assert (=> b!1187278 (= lt!539704 (get!18948 (select (arr!36997 _values!996) from!1455) lt!539697))))

(declare-fun b!1187279 () Bool)

(declare-fun Unit!39369 () Unit!39367)

(assert (=> b!1187279 (= e!675080 Unit!39369)))

(declare-fun b!1187280 () Bool)

(declare-fun e!675072 () Bool)

(assert (=> b!1187280 (= e!675072 tp_is_empty!29949)))

(declare-fun b!1187281 () Bool)

(declare-fun res!789334 () Bool)

(declare-fun e!675079 () Bool)

(assert (=> b!1187281 (=> (not res!789334) (not e!675079))))

(assert (=> b!1187281 (= res!789334 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46751 () Bool)

(declare-fun mapRes!46751 () Bool)

(assert (=> mapIsEmpty!46751 mapRes!46751))

(declare-fun b!1187282 () Bool)

(declare-fun Unit!39370 () Unit!39367)

(assert (=> b!1187282 (= e!675080 Unit!39370)))

(declare-fun lt!539702 () Unit!39367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76693 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39367)

(assert (=> b!1187282 (= lt!539702 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187282 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539698 () Unit!39367)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76693 (_ BitVec 32) (_ BitVec 32)) Unit!39367)

(assert (=> b!1187282 (= lt!539698 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26035 0))(
  ( (Nil!26032) (Cons!26031 (h!27240 (_ BitVec 64)) (t!38446 List!26035)) )
))
(declare-fun arrayNoDuplicates!0 (array!76693 (_ BitVec 32) List!26035) Bool)

(assert (=> b!1187282 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26032)))

(declare-fun lt!539701 () Unit!39367)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76693 (_ BitVec 64) (_ BitVec 32) List!26035) Unit!39367)

(assert (=> b!1187282 (= lt!539701 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26032))))

(assert (=> b!1187282 false))

(declare-fun b!1187283 () Bool)

(declare-fun res!789330 () Bool)

(declare-fun e!675082 () Bool)

(assert (=> b!1187283 (=> (not res!789330) (not e!675082))))

(assert (=> b!1187283 (= res!789330 (arrayNoDuplicates!0 lt!539694 #b00000000000000000000000000000000 Nil!26032))))

(declare-fun b!1187284 () Bool)

(declare-fun res!789332 () Bool)

(assert (=> b!1187284 (=> (not res!789332) (not e!675079))))

(assert (=> b!1187284 (= res!789332 (= (select (arr!36996 _keys!1208) i!673) k0!934))))

(declare-fun b!1187285 () Bool)

(declare-fun res!789338 () Bool)

(assert (=> b!1187285 (=> (not res!789338) (not e!675079))))

(assert (=> b!1187285 (= res!789338 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37532 _keys!1208))))))

(declare-fun e!675077 () Bool)

(declare-fun b!1187286 () Bool)

(assert (=> b!1187286 (= e!675077 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46751 () Bool)

(declare-fun tp!88970 () Bool)

(assert (=> mapNonEmpty!46751 (= mapRes!46751 (and tp!88970 e!675072))))

(declare-fun mapKey!46751 () (_ BitVec 32))

(declare-fun mapValue!46751 () ValueCell!14265)

(declare-fun mapRest!46751 () (Array (_ BitVec 32) ValueCell!14265))

(assert (=> mapNonEmpty!46751 (= (arr!36997 _values!996) (store mapRest!46751 mapKey!46751 mapValue!46751))))

(declare-fun b!1187275 () Bool)

(assert (=> b!1187275 (= e!675081 e!675077)))

(declare-fun res!789329 () Bool)

(assert (=> b!1187275 (=> res!789329 e!675077)))

(assert (=> b!1187275 (= res!789329 (not (= (select (arr!36996 _keys!1208) from!1455) k0!934)))))

(declare-fun res!789343 () Bool)

(assert (=> start!99840 (=> (not res!789343) (not e!675079))))

(assert (=> start!99840 (= res!789343 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37532 _keys!1208))))))

(assert (=> start!99840 e!675079))

(assert (=> start!99840 tp_is_empty!29949))

(declare-fun array_inv!28230 (array!76693) Bool)

(assert (=> start!99840 (array_inv!28230 _keys!1208)))

(assert (=> start!99840 true))

(assert (=> start!99840 tp!88971))

(declare-fun e!675076 () Bool)

(declare-fun array_inv!28231 (array!76695) Bool)

(assert (=> start!99840 (and (array_inv!28231 _values!996) e!675076)))

(declare-fun b!1187287 () Bool)

(declare-fun res!789333 () Bool)

(assert (=> b!1187287 (=> (not res!789333) (not e!675079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187287 (= res!789333 (validMask!0 mask!1564))))

(declare-fun b!1187288 () Bool)

(assert (=> b!1187288 (= e!675079 e!675082)))

(declare-fun res!789342 () Bool)

(assert (=> b!1187288 (=> (not res!789342) (not e!675082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76693 (_ BitVec 32)) Bool)

(assert (=> b!1187288 (= res!789342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539694 mask!1564))))

(assert (=> b!1187288 (= lt!539694 (array!76694 (store (arr!36996 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37532 _keys!1208)))))

(declare-fun b!1187289 () Bool)

(assert (=> b!1187289 (= e!675076 (and e!675073 mapRes!46751))))

(declare-fun condMapEmpty!46751 () Bool)

(declare-fun mapDefault!46751 () ValueCell!14265)

(assert (=> b!1187289 (= condMapEmpty!46751 (= (arr!36997 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14265)) mapDefault!46751)))))

(declare-fun b!1187290 () Bool)

(declare-fun e!675078 () Bool)

(assert (=> b!1187290 (= e!675082 (not e!675078))))

(declare-fun res!789339 () Bool)

(assert (=> b!1187290 (=> res!789339 e!675078)))

(assert (=> b!1187290 (= res!789339 (bvsgt from!1455 i!673))))

(assert (=> b!1187290 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539711 () Unit!39367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76693 (_ BitVec 64) (_ BitVec 32)) Unit!39367)

(assert (=> b!1187290 (= lt!539711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187291 () Bool)

(assert (=> b!1187291 (= e!675078 e!675075)))

(declare-fun res!789331 () Bool)

(assert (=> b!1187291 (=> res!789331 e!675075)))

(assert (=> b!1187291 (= res!789331 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187291 (= lt!539703 (getCurrentListMapNoExtraKeys!5090 lt!539694 lt!539712 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187291 (= lt!539712 (array!76696 (store (arr!36997 _values!996) i!673 (ValueCellFull!14265 lt!539697)) (size!37533 _values!996)))))

(declare-fun dynLambda!3037 (Int (_ BitVec 64)) V!45059)

(assert (=> b!1187291 (= lt!539697 (dynLambda!3037 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187291 (= lt!539695 (getCurrentListMapNoExtraKeys!5090 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187292 () Bool)

(declare-fun res!789337 () Bool)

(assert (=> b!1187292 (=> (not res!789337) (not e!675079))))

(assert (=> b!1187292 (= res!789337 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26032))))

(declare-fun b!1187293 () Bool)

(declare-fun res!789340 () Bool)

(assert (=> b!1187293 (=> (not res!789340) (not e!675079))))

(assert (=> b!1187293 (= res!789340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187294 () Bool)

(declare-fun res!789335 () Bool)

(assert (=> b!1187294 (=> (not res!789335) (not e!675079))))

(assert (=> b!1187294 (= res!789335 (and (= (size!37533 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37532 _keys!1208) (size!37533 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99840 res!789343) b!1187287))

(assert (= (and b!1187287 res!789333) b!1187294))

(assert (= (and b!1187294 res!789335) b!1187293))

(assert (= (and b!1187293 res!789340) b!1187292))

(assert (= (and b!1187292 res!789337) b!1187285))

(assert (= (and b!1187285 res!789338) b!1187281))

(assert (= (and b!1187281 res!789334) b!1187284))

(assert (= (and b!1187284 res!789332) b!1187288))

(assert (= (and b!1187288 res!789342) b!1187283))

(assert (= (and b!1187283 res!789330) b!1187290))

(assert (= (and b!1187290 (not res!789339)) b!1187291))

(assert (= (and b!1187291 (not res!789331)) b!1187277))

(assert (= (and b!1187277 (not res!789336)) b!1187278))

(assert (= (and b!1187278 res!789341) b!1187275))

(assert (= (and b!1187275 (not res!789329)) b!1187286))

(assert (= (and b!1187278 c!117252) b!1187282))

(assert (= (and b!1187278 (not c!117252)) b!1187279))

(assert (= (and b!1187289 condMapEmpty!46751) mapIsEmpty!46751))

(assert (= (and b!1187289 (not condMapEmpty!46751)) mapNonEmpty!46751))

(get-info :version)

(assert (= (and mapNonEmpty!46751 ((_ is ValueCellFull!14265) mapValue!46751)) b!1187280))

(assert (= (and b!1187289 ((_ is ValueCellFull!14265) mapDefault!46751)) b!1187276))

(assert (= start!99840 b!1187289))

(declare-fun b_lambda!20563 () Bool)

(assert (=> (not b_lambda!20563) (not b!1187291)))

(declare-fun t!38444 () Bool)

(declare-fun tb!10231 () Bool)

(assert (=> (and start!99840 (= defaultEntry!1004 defaultEntry!1004) t!38444) tb!10231))

(declare-fun result!21029 () Bool)

(assert (=> tb!10231 (= result!21029 tp_is_empty!29949)))

(assert (=> b!1187291 t!38444))

(declare-fun b_and!41707 () Bool)

(assert (= b_and!41705 (and (=> t!38444 result!21029) b_and!41707)))

(declare-fun m!1095925 () Bool)

(assert (=> b!1187287 m!1095925))

(declare-fun m!1095927 () Bool)

(assert (=> b!1187288 m!1095927))

(declare-fun m!1095929 () Bool)

(assert (=> b!1187288 m!1095929))

(declare-fun m!1095931 () Bool)

(assert (=> b!1187277 m!1095931))

(declare-fun m!1095933 () Bool)

(assert (=> b!1187277 m!1095933))

(declare-fun m!1095935 () Bool)

(assert (=> b!1187277 m!1095935))

(declare-fun m!1095937 () Bool)

(assert (=> b!1187277 m!1095937))

(declare-fun m!1095939 () Bool)

(assert (=> b!1187277 m!1095939))

(declare-fun m!1095941 () Bool)

(assert (=> b!1187277 m!1095941))

(assert (=> b!1187277 m!1095939))

(declare-fun m!1095943 () Bool)

(assert (=> b!1187281 m!1095943))

(declare-fun m!1095945 () Bool)

(assert (=> b!1187284 m!1095945))

(declare-fun m!1095947 () Bool)

(assert (=> b!1187292 m!1095947))

(declare-fun m!1095949 () Bool)

(assert (=> b!1187290 m!1095949))

(declare-fun m!1095951 () Bool)

(assert (=> b!1187290 m!1095951))

(declare-fun m!1095953 () Bool)

(assert (=> b!1187283 m!1095953))

(declare-fun m!1095955 () Bool)

(assert (=> b!1187278 m!1095955))

(assert (=> b!1187278 m!1095939))

(declare-fun m!1095957 () Bool)

(assert (=> b!1187278 m!1095957))

(declare-fun m!1095959 () Bool)

(assert (=> b!1187278 m!1095959))

(assert (=> b!1187278 m!1095955))

(declare-fun m!1095961 () Bool)

(assert (=> b!1187278 m!1095961))

(declare-fun m!1095963 () Bool)

(assert (=> b!1187278 m!1095963))

(declare-fun m!1095965 () Bool)

(assert (=> b!1187278 m!1095965))

(assert (=> b!1187278 m!1095939))

(assert (=> b!1187275 m!1095939))

(declare-fun m!1095967 () Bool)

(assert (=> b!1187293 m!1095967))

(declare-fun m!1095969 () Bool)

(assert (=> b!1187286 m!1095969))

(declare-fun m!1095971 () Bool)

(assert (=> b!1187291 m!1095971))

(declare-fun m!1095973 () Bool)

(assert (=> b!1187291 m!1095973))

(declare-fun m!1095975 () Bool)

(assert (=> b!1187291 m!1095975))

(declare-fun m!1095977 () Bool)

(assert (=> b!1187291 m!1095977))

(declare-fun m!1095979 () Bool)

(assert (=> b!1187282 m!1095979))

(declare-fun m!1095981 () Bool)

(assert (=> b!1187282 m!1095981))

(declare-fun m!1095983 () Bool)

(assert (=> b!1187282 m!1095983))

(declare-fun m!1095985 () Bool)

(assert (=> b!1187282 m!1095985))

(declare-fun m!1095987 () Bool)

(assert (=> b!1187282 m!1095987))

(declare-fun m!1095989 () Bool)

(assert (=> mapNonEmpty!46751 m!1095989))

(declare-fun m!1095991 () Bool)

(assert (=> start!99840 m!1095991))

(declare-fun m!1095993 () Bool)

(assert (=> start!99840 m!1095993))

(check-sat b_and!41707 (not b!1187291) (not b!1187290) (not b!1187283) (not b!1187288) tp_is_empty!29949 (not b!1187287) (not b!1187278) (not b!1187282) (not b!1187277) (not b_next!25419) (not b!1187292) (not b!1187293) (not b!1187286) (not start!99840) (not b_lambda!20563) (not b!1187281) (not mapNonEmpty!46751))
(check-sat b_and!41707 (not b_next!25419))

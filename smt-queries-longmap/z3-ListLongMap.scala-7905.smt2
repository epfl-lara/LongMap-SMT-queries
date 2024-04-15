; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98168 () Bool)

(assert start!98168)

(declare-fun b_free!23875 () Bool)

(declare-fun b_next!23875 () Bool)

(assert (=> start!98168 (= b_free!23875 (not b_next!23875))))

(declare-fun tp!84328 () Bool)

(declare-fun b_and!38511 () Bool)

(assert (=> start!98168 (= tp!84328 b_and!38511)))

(declare-fun b!1129067 () Bool)

(declare-fun res!754543 () Bool)

(declare-fun e!642564 () Bool)

(assert (=> b!1129067 (=> (not res!754543) (not e!642564))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129067 (= res!754543 (validMask!0 mask!1564))))

(declare-fun b!1129068 () Bool)

(declare-fun e!642567 () Bool)

(declare-fun e!642576 () Bool)

(declare-fun mapRes!44425 () Bool)

(assert (=> b!1129068 (= e!642567 (and e!642576 mapRes!44425))))

(declare-fun condMapEmpty!44425 () Bool)

(declare-datatypes ((V!43001 0))(
  ( (V!43002 (val!14259 Int)) )
))
(declare-datatypes ((ValueCell!13493 0))(
  ( (ValueCellFull!13493 (v!16891 V!43001)) (EmptyCell!13493) )
))
(declare-datatypes ((array!73592 0))(
  ( (array!73593 (arr!35449 (Array (_ BitVec 32) ValueCell!13493)) (size!35987 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73592)

(declare-fun mapDefault!44425 () ValueCell!13493)

(assert (=> b!1129068 (= condMapEmpty!44425 (= (arr!35449 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13493)) mapDefault!44425)))))

(declare-fun b!1129069 () Bool)

(declare-fun e!642565 () Bool)

(declare-fun tp_is_empty!28405 () Bool)

(assert (=> b!1129069 (= e!642565 tp_is_empty!28405)))

(declare-fun bm!47947 () Bool)

(declare-datatypes ((tuple2!18042 0))(
  ( (tuple2!18043 (_1!9032 (_ BitVec 64)) (_2!9032 V!43001)) )
))
(declare-datatypes ((List!24795 0))(
  ( (Nil!24792) (Cons!24791 (h!26000 tuple2!18042) (t!35653 List!24795)) )
))
(declare-datatypes ((ListLongMap!16011 0))(
  ( (ListLongMap!16012 (toList!8021 List!24795)) )
))
(declare-fun call!47952 () ListLongMap!16011)

(declare-fun call!47951 () ListLongMap!16011)

(assert (=> bm!47947 (= call!47952 call!47951)))

(declare-fun b!1129070 () Bool)

(declare-fun e!642563 () Bool)

(assert (=> b!1129070 (= e!642563 true)))

(declare-fun zeroValue!944 () V!43001)

(declare-fun lt!501088 () Bool)

(declare-datatypes ((array!73594 0))(
  ( (array!73595 (arr!35450 (Array (_ BitVec 32) (_ BitVec 64))) (size!35988 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73594)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43001)

(declare-fun contains!6473 (ListLongMap!16011 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4352 (array!73594 array!73592 (_ BitVec 32) (_ BitVec 32) V!43001 V!43001 (_ BitVec 32) Int) ListLongMap!16011)

(assert (=> b!1129070 (= lt!501088 (contains!6473 (getCurrentListMap!4352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1129071 () Bool)

(declare-fun res!754544 () Bool)

(assert (=> b!1129071 (=> (not res!754544) (not e!642564))))

(declare-datatypes ((List!24796 0))(
  ( (Nil!24793) (Cons!24792 (h!26001 (_ BitVec 64)) (t!35654 List!24796)) )
))
(declare-fun arrayNoDuplicates!0 (array!73594 (_ BitVec 32) List!24796) Bool)

(assert (=> b!1129071 (= res!754544 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24793))))

(declare-fun b!1129072 () Bool)

(declare-datatypes ((Unit!36837 0))(
  ( (Unit!36838) )
))
(declare-fun e!642574 () Unit!36837)

(declare-fun lt!501095 () Unit!36837)

(assert (=> b!1129072 (= e!642574 lt!501095)))

(declare-fun lt!501099 () Unit!36837)

(declare-fun lt!501097 () ListLongMap!16011)

(declare-fun addStillContains!683 (ListLongMap!16011 (_ BitVec 64) V!43001 (_ BitVec 64)) Unit!36837)

(assert (=> b!1129072 (= lt!501099 (addStillContains!683 lt!501097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!501098 () ListLongMap!16011)

(assert (=> b!1129072 (= lt!501098 call!47951)))

(declare-fun call!47950 () Bool)

(assert (=> b!1129072 call!47950))

(declare-fun call!47956 () Unit!36837)

(assert (=> b!1129072 (= lt!501095 call!47956)))

(declare-fun +!3465 (ListLongMap!16011 tuple2!18042) ListLongMap!16011)

(assert (=> b!1129072 (contains!6473 (+!3465 lt!501098 (tuple2!18043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1129073 () Bool)

(declare-fun e!642571 () Unit!36837)

(declare-fun lt!501089 () Unit!36837)

(assert (=> b!1129073 (= e!642571 lt!501089)))

(declare-fun call!47957 () Unit!36837)

(assert (=> b!1129073 (= lt!501089 call!47957)))

(declare-fun call!47954 () Bool)

(assert (=> b!1129073 call!47954))

(declare-fun bm!47948 () Bool)

(assert (=> bm!47948 (= call!47957 call!47956)))

(declare-fun call!47953 () ListLongMap!16011)

(declare-fun b!1129074 () Bool)

(declare-fun call!47955 () ListLongMap!16011)

(declare-fun e!642570 () Bool)

(declare-fun -!1136 (ListLongMap!16011 (_ BitVec 64)) ListLongMap!16011)

(assert (=> b!1129074 (= e!642570 (= call!47953 (-!1136 call!47955 k0!934)))))

(declare-fun b!1129075 () Bool)

(declare-fun Unit!36839 () Unit!36837)

(assert (=> b!1129075 (= e!642571 Unit!36839)))

(declare-fun b!1129076 () Bool)

(declare-fun c!109812 () Bool)

(declare-fun lt!501093 () Bool)

(assert (=> b!1129076 (= c!109812 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501093))))

(declare-fun e!642568 () Unit!36837)

(assert (=> b!1129076 (= e!642568 e!642571)))

(declare-fun c!109809 () Bool)

(declare-fun c!109811 () Bool)

(declare-fun bm!47949 () Bool)

(assert (=> bm!47949 (= call!47956 (addStillContains!683 (ite c!109809 lt!501098 lt!501097) (ite c!109809 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109811 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109809 minValue!944 (ite c!109811 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!44425 () Bool)

(assert (=> mapIsEmpty!44425 mapRes!44425))

(declare-fun bm!47950 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4521 (array!73594 array!73592 (_ BitVec 32) (_ BitVec 32) V!43001 V!43001 (_ BitVec 32) Int) ListLongMap!16011)

(assert (=> bm!47950 (= call!47955 (getCurrentListMapNoExtraKeys!4521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129077 () Bool)

(declare-fun e!642575 () Bool)

(declare-fun e!642572 () Bool)

(assert (=> b!1129077 (= e!642575 e!642572)))

(declare-fun res!754540 () Bool)

(assert (=> b!1129077 (=> res!754540 e!642572)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129077 (= res!754540 (not (= from!1455 i!673)))))

(declare-fun lt!501092 () array!73594)

(declare-fun lt!501102 () array!73592)

(declare-fun lt!501101 () ListLongMap!16011)

(assert (=> b!1129077 (= lt!501101 (getCurrentListMapNoExtraKeys!4521 lt!501092 lt!501102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2527 (Int (_ BitVec 64)) V!43001)

(assert (=> b!1129077 (= lt!501102 (array!73593 (store (arr!35449 _values!996) i!673 (ValueCellFull!13493 (dynLambda!2527 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35987 _values!996)))))

(declare-fun lt!501096 () ListLongMap!16011)

(assert (=> b!1129077 (= lt!501096 (getCurrentListMapNoExtraKeys!4521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44425 () Bool)

(declare-fun tp!84329 () Bool)

(assert (=> mapNonEmpty!44425 (= mapRes!44425 (and tp!84329 e!642565))))

(declare-fun mapKey!44425 () (_ BitVec 32))

(declare-fun mapValue!44425 () ValueCell!13493)

(declare-fun mapRest!44425 () (Array (_ BitVec 32) ValueCell!13493))

(assert (=> mapNonEmpty!44425 (= (arr!35449 _values!996) (store mapRest!44425 mapKey!44425 mapValue!44425))))

(declare-fun bm!47951 () Bool)

(assert (=> bm!47951 (= call!47951 (+!3465 lt!501097 (ite (or c!109809 c!109811) (tuple2!18043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129078 () Bool)

(declare-fun res!754547 () Bool)

(assert (=> b!1129078 (=> (not res!754547) (not e!642564))))

(assert (=> b!1129078 (= res!754547 (= (select (arr!35450 _keys!1208) i!673) k0!934))))

(declare-fun b!1129079 () Bool)

(declare-fun e!642566 () Bool)

(assert (=> b!1129079 (= e!642566 (not e!642575))))

(declare-fun res!754542 () Bool)

(assert (=> b!1129079 (=> res!754542 e!642575)))

(assert (=> b!1129079 (= res!754542 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129079 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501100 () Unit!36837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73594 (_ BitVec 64) (_ BitVec 32)) Unit!36837)

(assert (=> b!1129079 (= lt!501100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129080 () Bool)

(declare-fun res!754545 () Bool)

(assert (=> b!1129080 (=> (not res!754545) (not e!642564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129080 (= res!754545 (validKeyInArray!0 k0!934))))

(declare-fun b!1129081 () Bool)

(assert (=> b!1129081 (= e!642576 tp_is_empty!28405)))

(declare-fun res!754539 () Bool)

(assert (=> start!98168 (=> (not res!754539) (not e!642564))))

(assert (=> start!98168 (= res!754539 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35988 _keys!1208))))))

(assert (=> start!98168 e!642564))

(assert (=> start!98168 tp_is_empty!28405))

(declare-fun array_inv!27274 (array!73594) Bool)

(assert (=> start!98168 (array_inv!27274 _keys!1208)))

(assert (=> start!98168 true))

(assert (=> start!98168 tp!84328))

(declare-fun array_inv!27275 (array!73592) Bool)

(assert (=> start!98168 (and (array_inv!27275 _values!996) e!642567)))

(declare-fun b!1129082 () Bool)

(assert (=> b!1129082 (= e!642574 e!642568)))

(assert (=> b!1129082 (= c!109811 (and (not lt!501093) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129083 () Bool)

(declare-fun res!754549 () Bool)

(assert (=> b!1129083 (=> (not res!754549) (not e!642566))))

(assert (=> b!1129083 (= res!754549 (arrayNoDuplicates!0 lt!501092 #b00000000000000000000000000000000 Nil!24793))))

(declare-fun bm!47952 () Bool)

(assert (=> bm!47952 (= call!47954 call!47950)))

(declare-fun b!1129084 () Bool)

(assert (=> b!1129084 call!47954))

(declare-fun lt!501091 () Unit!36837)

(assert (=> b!1129084 (= lt!501091 call!47957)))

(assert (=> b!1129084 (= e!642568 lt!501091)))

(declare-fun b!1129085 () Bool)

(assert (=> b!1129085 (= e!642564 e!642566)))

(declare-fun res!754546 () Bool)

(assert (=> b!1129085 (=> (not res!754546) (not e!642566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73594 (_ BitVec 32)) Bool)

(assert (=> b!1129085 (= res!754546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501092 mask!1564))))

(assert (=> b!1129085 (= lt!501092 (array!73595 (store (arr!35450 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35988 _keys!1208)))))

(declare-fun b!1129086 () Bool)

(declare-fun res!754541 () Bool)

(assert (=> b!1129086 (=> (not res!754541) (not e!642564))))

(assert (=> b!1129086 (= res!754541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129087 () Bool)

(declare-fun e!642573 () Bool)

(declare-fun e!642569 () Bool)

(assert (=> b!1129087 (= e!642573 e!642569)))

(declare-fun res!754537 () Bool)

(assert (=> b!1129087 (=> res!754537 e!642569)))

(assert (=> b!1129087 (= res!754537 (not (contains!6473 lt!501097 k0!934)))))

(assert (=> b!1129087 (= lt!501097 (getCurrentListMapNoExtraKeys!4521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129088 () Bool)

(declare-fun res!754535 () Bool)

(assert (=> b!1129088 (=> (not res!754535) (not e!642564))))

(assert (=> b!1129088 (= res!754535 (and (= (size!35987 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35988 _keys!1208) (size!35987 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129089 () Bool)

(assert (=> b!1129089 (= e!642570 (= call!47953 call!47955))))

(declare-fun bm!47953 () Bool)

(assert (=> bm!47953 (= call!47953 (getCurrentListMapNoExtraKeys!4521 lt!501092 lt!501102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129090 () Bool)

(assert (=> b!1129090 (= e!642572 e!642573)))

(declare-fun res!754536 () Bool)

(assert (=> b!1129090 (=> res!754536 e!642573)))

(assert (=> b!1129090 (= res!754536 (not (= (select (arr!35450 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1129090 e!642570))

(declare-fun c!109810 () Bool)

(assert (=> b!1129090 (= c!109810 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501094 () Unit!36837)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!418 (array!73594 array!73592 (_ BitVec 32) (_ BitVec 32) V!43001 V!43001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36837)

(assert (=> b!1129090 (= lt!501094 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129091 () Bool)

(declare-fun res!754538 () Bool)

(assert (=> b!1129091 (=> (not res!754538) (not e!642564))))

(assert (=> b!1129091 (= res!754538 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35988 _keys!1208))))))

(declare-fun bm!47954 () Bool)

(assert (=> bm!47954 (= call!47950 (contains!6473 (ite c!109809 lt!501098 call!47952) k0!934))))

(declare-fun b!1129092 () Bool)

(assert (=> b!1129092 (= e!642569 e!642563)))

(declare-fun res!754548 () Bool)

(assert (=> b!1129092 (=> res!754548 e!642563)))

(assert (=> b!1129092 (= res!754548 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!35988 _keys!1208))))))

(declare-fun lt!501090 () Unit!36837)

(assert (=> b!1129092 (= lt!501090 e!642574)))

(assert (=> b!1129092 (= c!109809 (and (not lt!501093) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129092 (= lt!501093 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!98168 res!754539) b!1129067))

(assert (= (and b!1129067 res!754543) b!1129088))

(assert (= (and b!1129088 res!754535) b!1129086))

(assert (= (and b!1129086 res!754541) b!1129071))

(assert (= (and b!1129071 res!754544) b!1129091))

(assert (= (and b!1129091 res!754538) b!1129080))

(assert (= (and b!1129080 res!754545) b!1129078))

(assert (= (and b!1129078 res!754547) b!1129085))

(assert (= (and b!1129085 res!754546) b!1129083))

(assert (= (and b!1129083 res!754549) b!1129079))

(assert (= (and b!1129079 (not res!754542)) b!1129077))

(assert (= (and b!1129077 (not res!754540)) b!1129090))

(assert (= (and b!1129090 c!109810) b!1129074))

(assert (= (and b!1129090 (not c!109810)) b!1129089))

(assert (= (or b!1129074 b!1129089) bm!47953))

(assert (= (or b!1129074 b!1129089) bm!47950))

(assert (= (and b!1129090 (not res!754536)) b!1129087))

(assert (= (and b!1129087 (not res!754537)) b!1129092))

(assert (= (and b!1129092 c!109809) b!1129072))

(assert (= (and b!1129092 (not c!109809)) b!1129082))

(assert (= (and b!1129082 c!109811) b!1129084))

(assert (= (and b!1129082 (not c!109811)) b!1129076))

(assert (= (and b!1129076 c!109812) b!1129073))

(assert (= (and b!1129076 (not c!109812)) b!1129075))

(assert (= (or b!1129084 b!1129073) bm!47948))

(assert (= (or b!1129084 b!1129073) bm!47947))

(assert (= (or b!1129084 b!1129073) bm!47952))

(assert (= (or b!1129072 bm!47952) bm!47954))

(assert (= (or b!1129072 bm!47948) bm!47949))

(assert (= (or b!1129072 bm!47947) bm!47951))

(assert (= (and b!1129092 (not res!754548)) b!1129070))

(assert (= (and b!1129068 condMapEmpty!44425) mapIsEmpty!44425))

(assert (= (and b!1129068 (not condMapEmpty!44425)) mapNonEmpty!44425))

(get-info :version)

(assert (= (and mapNonEmpty!44425 ((_ is ValueCellFull!13493) mapValue!44425)) b!1129069))

(assert (= (and b!1129068 ((_ is ValueCellFull!13493) mapDefault!44425)) b!1129081))

(assert (= start!98168 b!1129068))

(declare-fun b_lambda!18827 () Bool)

(assert (=> (not b_lambda!18827) (not b!1129077)))

(declare-fun t!35652 () Bool)

(declare-fun tb!8679 () Bool)

(assert (=> (and start!98168 (= defaultEntry!1004 defaultEntry!1004) t!35652) tb!8679))

(declare-fun result!17927 () Bool)

(assert (=> tb!8679 (= result!17927 tp_is_empty!28405)))

(assert (=> b!1129077 t!35652))

(declare-fun b_and!38513 () Bool)

(assert (= b_and!38511 (and (=> t!35652 result!17927) b_and!38513)))

(declare-fun m!1041999 () Bool)

(assert (=> bm!47950 m!1041999))

(declare-fun m!1042001 () Bool)

(assert (=> bm!47951 m!1042001))

(declare-fun m!1042003 () Bool)

(assert (=> b!1129080 m!1042003))

(declare-fun m!1042005 () Bool)

(assert (=> b!1129090 m!1042005))

(declare-fun m!1042007 () Bool)

(assert (=> b!1129090 m!1042007))

(declare-fun m!1042009 () Bool)

(assert (=> b!1129067 m!1042009))

(declare-fun m!1042011 () Bool)

(assert (=> b!1129087 m!1042011))

(assert (=> b!1129087 m!1041999))

(declare-fun m!1042013 () Bool)

(assert (=> b!1129070 m!1042013))

(assert (=> b!1129070 m!1042013))

(declare-fun m!1042015 () Bool)

(assert (=> b!1129070 m!1042015))

(declare-fun m!1042017 () Bool)

(assert (=> b!1129071 m!1042017))

(declare-fun m!1042019 () Bool)

(assert (=> b!1129078 m!1042019))

(declare-fun m!1042021 () Bool)

(assert (=> b!1129077 m!1042021))

(declare-fun m!1042023 () Bool)

(assert (=> b!1129077 m!1042023))

(declare-fun m!1042025 () Bool)

(assert (=> b!1129077 m!1042025))

(declare-fun m!1042027 () Bool)

(assert (=> b!1129077 m!1042027))

(declare-fun m!1042029 () Bool)

(assert (=> mapNonEmpty!44425 m!1042029))

(declare-fun m!1042031 () Bool)

(assert (=> b!1129079 m!1042031))

(declare-fun m!1042033 () Bool)

(assert (=> b!1129079 m!1042033))

(declare-fun m!1042035 () Bool)

(assert (=> b!1129072 m!1042035))

(declare-fun m!1042037 () Bool)

(assert (=> b!1129072 m!1042037))

(assert (=> b!1129072 m!1042037))

(declare-fun m!1042039 () Bool)

(assert (=> b!1129072 m!1042039))

(declare-fun m!1042041 () Bool)

(assert (=> b!1129086 m!1042041))

(declare-fun m!1042043 () Bool)

(assert (=> bm!47949 m!1042043))

(declare-fun m!1042045 () Bool)

(assert (=> b!1129074 m!1042045))

(declare-fun m!1042047 () Bool)

(assert (=> b!1129083 m!1042047))

(declare-fun m!1042049 () Bool)

(assert (=> bm!47953 m!1042049))

(declare-fun m!1042051 () Bool)

(assert (=> b!1129085 m!1042051))

(declare-fun m!1042053 () Bool)

(assert (=> b!1129085 m!1042053))

(declare-fun m!1042055 () Bool)

(assert (=> start!98168 m!1042055))

(declare-fun m!1042057 () Bool)

(assert (=> start!98168 m!1042057))

(declare-fun m!1042059 () Bool)

(assert (=> bm!47954 m!1042059))

(check-sat (not bm!47954) (not b!1129085) (not b!1129079) (not start!98168) (not b!1129072) (not b!1129067) (not bm!47951) (not b!1129080) (not b_lambda!18827) (not b!1129077) (not bm!47949) (not b!1129086) (not b!1129083) (not b_next!23875) (not b!1129071) tp_is_empty!28405 (not mapNonEmpty!44425) (not b!1129074) (not bm!47953) (not b!1129087) (not b!1129070) (not bm!47950) (not b!1129090) b_and!38513)
(check-sat b_and!38513 (not b_next!23875))

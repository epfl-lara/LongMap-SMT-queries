; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99552 () Bool)

(assert start!99552)

(declare-fun b_free!25131 () Bool)

(declare-fun b_next!25131 () Bool)

(assert (=> start!99552 (= b_free!25131 (not b_next!25131))))

(declare-fun tp!88107 () Bool)

(declare-fun b_and!41129 () Bool)

(assert (=> start!99552 (= tp!88107 b_and!41129)))

(declare-fun b!1178100 () Bool)

(declare-fun res!782605 () Bool)

(declare-fun e!669739 () Bool)

(assert (=> b!1178100 (=> (not res!782605) (not e!669739))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76125 0))(
  ( (array!76126 (arr!36712 (Array (_ BitVec 32) (_ BitVec 64))) (size!37248 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76125)

(assert (=> b!1178100 (= res!782605 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37248 _keys!1208))))))

(declare-fun b!1178101 () Bool)

(declare-fun res!782606 () Bool)

(assert (=> b!1178101 (=> (not res!782606) (not e!669739))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178101 (= res!782606 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46319 () Bool)

(declare-fun mapRes!46319 () Bool)

(assert (=> mapIsEmpty!46319 mapRes!46319))

(declare-fun b!1178102 () Bool)

(declare-datatypes ((Unit!38911 0))(
  ( (Unit!38912) )
))
(declare-fun e!669742 () Unit!38911)

(declare-fun Unit!38913 () Unit!38911)

(assert (=> b!1178102 (= e!669742 Unit!38913)))

(declare-fun b!1178103 () Bool)

(declare-fun e!669733 () Bool)

(assert (=> b!1178103 (= e!669739 e!669733)))

(declare-fun res!782616 () Bool)

(assert (=> b!1178103 (=> (not res!782616) (not e!669733))))

(declare-fun lt!532116 () array!76125)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76125 (_ BitVec 32)) Bool)

(assert (=> b!1178103 (= res!782616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532116 mask!1564))))

(assert (=> b!1178103 (= lt!532116 (array!76126 (store (arr!36712 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37248 _keys!1208)))))

(declare-fun b!1178104 () Bool)

(declare-fun res!782607 () Bool)

(assert (=> b!1178104 (=> (not res!782607) (not e!669739))))

(assert (=> b!1178104 (= res!782607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178105 () Bool)

(declare-fun e!669738 () Bool)

(declare-fun tp_is_empty!29661 () Bool)

(assert (=> b!1178105 (= e!669738 tp_is_empty!29661)))

(declare-fun b!1178106 () Bool)

(declare-fun res!782611 () Bool)

(assert (=> b!1178106 (=> (not res!782611) (not e!669733))))

(declare-datatypes ((List!25785 0))(
  ( (Nil!25782) (Cons!25781 (h!26990 (_ BitVec 64)) (t!37908 List!25785)) )
))
(declare-fun arrayNoDuplicates!0 (array!76125 (_ BitVec 32) List!25785) Bool)

(assert (=> b!1178106 (= res!782611 (arrayNoDuplicates!0 lt!532116 #b00000000000000000000000000000000 Nil!25782))))

(declare-fun b!1178107 () Bool)

(declare-fun res!782612 () Bool)

(assert (=> b!1178107 (=> (not res!782612) (not e!669739))))

(assert (=> b!1178107 (= res!782612 (= (select (arr!36712 _keys!1208) i!673) k0!934))))

(declare-fun b!1178108 () Bool)

(declare-fun Unit!38914 () Unit!38911)

(assert (=> b!1178108 (= e!669742 Unit!38914)))

(declare-fun lt!532127 () Unit!38911)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38911)

(assert (=> b!1178108 (= lt!532127 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178108 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532118 () Unit!38911)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76125 (_ BitVec 32) (_ BitVec 32)) Unit!38911)

(assert (=> b!1178108 (= lt!532118 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178108 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25782)))

(declare-fun lt!532120 () Unit!38911)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76125 (_ BitVec 64) (_ BitVec 32) List!25785) Unit!38911)

(assert (=> b!1178108 (= lt!532120 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25782))))

(assert (=> b!1178108 false))

(declare-fun b!1178109 () Bool)

(declare-fun res!782617 () Bool)

(assert (=> b!1178109 (=> (not res!782617) (not e!669739))))

(assert (=> b!1178109 (= res!782617 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25782))))

(declare-fun b!1178110 () Bool)

(declare-fun res!782610 () Bool)

(assert (=> b!1178110 (=> (not res!782610) (not e!669739))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44675 0))(
  ( (V!44676 (val!14887 Int)) )
))
(declare-datatypes ((ValueCell!14121 0))(
  ( (ValueCellFull!14121 (v!17525 V!44675)) (EmptyCell!14121) )
))
(declare-datatypes ((array!76127 0))(
  ( (array!76128 (arr!36713 (Array (_ BitVec 32) ValueCell!14121)) (size!37249 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76127)

(assert (=> b!1178110 (= res!782610 (and (= (size!37249 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37248 _keys!1208) (size!37249 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46319 () Bool)

(declare-fun tp!88106 () Bool)

(declare-fun e!669730 () Bool)

(assert (=> mapNonEmpty!46319 (= mapRes!46319 (and tp!88106 e!669730))))

(declare-fun mapValue!46319 () ValueCell!14121)

(declare-fun mapKey!46319 () (_ BitVec 32))

(declare-fun mapRest!46319 () (Array (_ BitVec 32) ValueCell!14121))

(assert (=> mapNonEmpty!46319 (= (arr!36713 _values!996) (store mapRest!46319 mapKey!46319 mapValue!46319))))

(declare-fun b!1178111 () Bool)

(declare-fun e!669731 () Bool)

(declare-fun e!669740 () Bool)

(assert (=> b!1178111 (= e!669731 e!669740)))

(declare-fun res!782608 () Bool)

(assert (=> b!1178111 (=> res!782608 e!669740)))

(assert (=> b!1178111 (= res!782608 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!532117 () array!76127)

(declare-datatypes ((tuple2!19048 0))(
  ( (tuple2!19049 (_1!9535 (_ BitVec 64)) (_2!9535 V!44675)) )
))
(declare-datatypes ((List!25786 0))(
  ( (Nil!25783) (Cons!25782 (h!26991 tuple2!19048) (t!37909 List!25786)) )
))
(declare-datatypes ((ListLongMap!17017 0))(
  ( (ListLongMap!17018 (toList!8524 List!25786)) )
))
(declare-fun lt!532122 () ListLongMap!17017)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44675)

(declare-fun zeroValue!944 () V!44675)

(declare-fun getCurrentListMapNoExtraKeys!4981 (array!76125 array!76127 (_ BitVec 32) (_ BitVec 32) V!44675 V!44675 (_ BitVec 32) Int) ListLongMap!17017)

(assert (=> b!1178111 (= lt!532122 (getCurrentListMapNoExtraKeys!4981 lt!532116 lt!532117 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532114 () V!44675)

(assert (=> b!1178111 (= lt!532117 (array!76128 (store (arr!36713 _values!996) i!673 (ValueCellFull!14121 lt!532114)) (size!37249 _values!996)))))

(declare-fun dynLambda!2943 (Int (_ BitVec 64)) V!44675)

(assert (=> b!1178111 (= lt!532114 (dynLambda!2943 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532123 () ListLongMap!17017)

(assert (=> b!1178111 (= lt!532123 (getCurrentListMapNoExtraKeys!4981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178113 () Bool)

(declare-fun e!669735 () Bool)

(assert (=> b!1178113 (= e!669735 true)))

(declare-fun e!669734 () Bool)

(assert (=> b!1178113 e!669734))

(declare-fun res!782609 () Bool)

(assert (=> b!1178113 (=> (not res!782609) (not e!669734))))

(assert (=> b!1178113 (= res!782609 (not (= (select (arr!36712 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532119 () Unit!38911)

(assert (=> b!1178113 (= lt!532119 e!669742)))

(declare-fun c!116820 () Bool)

(assert (=> b!1178113 (= c!116820 (= (select (arr!36712 _keys!1208) from!1455) k0!934))))

(declare-fun e!669736 () Bool)

(assert (=> b!1178113 e!669736))

(declare-fun res!782602 () Bool)

(assert (=> b!1178113 (=> (not res!782602) (not e!669736))))

(declare-fun lt!532126 () ListLongMap!17017)

(declare-fun lt!532128 () tuple2!19048)

(declare-fun +!3838 (ListLongMap!17017 tuple2!19048) ListLongMap!17017)

(assert (=> b!1178113 (= res!782602 (= lt!532122 (+!3838 lt!532126 lt!532128)))))

(declare-fun get!18762 (ValueCell!14121 V!44675) V!44675)

(assert (=> b!1178113 (= lt!532128 (tuple2!19049 (select (arr!36712 _keys!1208) from!1455) (get!18762 (select (arr!36713 _values!996) from!1455) lt!532114)))))

(declare-fun b!1178114 () Bool)

(assert (=> b!1178114 (= e!669740 e!669735)))

(declare-fun res!782613 () Bool)

(assert (=> b!1178114 (=> res!782613 e!669735)))

(assert (=> b!1178114 (= res!782613 (not (validKeyInArray!0 (select (arr!36712 _keys!1208) from!1455))))))

(declare-fun lt!532121 () ListLongMap!17017)

(assert (=> b!1178114 (= lt!532121 lt!532126)))

(declare-fun lt!532124 () ListLongMap!17017)

(declare-fun -!1572 (ListLongMap!17017 (_ BitVec 64)) ListLongMap!17017)

(assert (=> b!1178114 (= lt!532126 (-!1572 lt!532124 k0!934))))

(assert (=> b!1178114 (= lt!532121 (getCurrentListMapNoExtraKeys!4981 lt!532116 lt!532117 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178114 (= lt!532124 (getCurrentListMapNoExtraKeys!4981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532115 () Unit!38911)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!799 (array!76125 array!76127 (_ BitVec 32) (_ BitVec 32) V!44675 V!44675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38911)

(assert (=> b!1178114 (= lt!532115 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178115 () Bool)

(assert (=> b!1178115 (= e!669730 tp_is_empty!29661)))

(declare-fun b!1178116 () Bool)

(assert (=> b!1178116 (= e!669734 (= lt!532123 (+!3838 lt!532124 lt!532128)))))

(declare-fun e!669741 () Bool)

(declare-fun b!1178117 () Bool)

(assert (=> b!1178117 (= e!669741 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178118 () Bool)

(assert (=> b!1178118 (= e!669733 (not e!669731))))

(declare-fun res!782614 () Bool)

(assert (=> b!1178118 (=> res!782614 e!669731)))

(assert (=> b!1178118 (= res!782614 (bvsgt from!1455 i!673))))

(assert (=> b!1178118 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532125 () Unit!38911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76125 (_ BitVec 64) (_ BitVec 32)) Unit!38911)

(assert (=> b!1178118 (= lt!532125 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178119 () Bool)

(declare-fun res!782604 () Bool)

(assert (=> b!1178119 (=> (not res!782604) (not e!669739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178119 (= res!782604 (validMask!0 mask!1564))))

(declare-fun b!1178120 () Bool)

(declare-fun e!669732 () Bool)

(assert (=> b!1178120 (= e!669732 (and e!669738 mapRes!46319))))

(declare-fun condMapEmpty!46319 () Bool)

(declare-fun mapDefault!46319 () ValueCell!14121)

(assert (=> b!1178120 (= condMapEmpty!46319 (= (arr!36713 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14121)) mapDefault!46319)))))

(declare-fun b!1178112 () Bool)

(assert (=> b!1178112 (= e!669736 e!669741)))

(declare-fun res!782603 () Bool)

(assert (=> b!1178112 (=> res!782603 e!669741)))

(assert (=> b!1178112 (= res!782603 (not (= (select (arr!36712 _keys!1208) from!1455) k0!934)))))

(declare-fun res!782615 () Bool)

(assert (=> start!99552 (=> (not res!782615) (not e!669739))))

(assert (=> start!99552 (= res!782615 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37248 _keys!1208))))))

(assert (=> start!99552 e!669739))

(assert (=> start!99552 tp_is_empty!29661))

(declare-fun array_inv!28034 (array!76125) Bool)

(assert (=> start!99552 (array_inv!28034 _keys!1208)))

(assert (=> start!99552 true))

(assert (=> start!99552 tp!88107))

(declare-fun array_inv!28035 (array!76127) Bool)

(assert (=> start!99552 (and (array_inv!28035 _values!996) e!669732)))

(assert (= (and start!99552 res!782615) b!1178119))

(assert (= (and b!1178119 res!782604) b!1178110))

(assert (= (and b!1178110 res!782610) b!1178104))

(assert (= (and b!1178104 res!782607) b!1178109))

(assert (= (and b!1178109 res!782617) b!1178100))

(assert (= (and b!1178100 res!782605) b!1178101))

(assert (= (and b!1178101 res!782606) b!1178107))

(assert (= (and b!1178107 res!782612) b!1178103))

(assert (= (and b!1178103 res!782616) b!1178106))

(assert (= (and b!1178106 res!782611) b!1178118))

(assert (= (and b!1178118 (not res!782614)) b!1178111))

(assert (= (and b!1178111 (not res!782608)) b!1178114))

(assert (= (and b!1178114 (not res!782613)) b!1178113))

(assert (= (and b!1178113 res!782602) b!1178112))

(assert (= (and b!1178112 (not res!782603)) b!1178117))

(assert (= (and b!1178113 c!116820) b!1178108))

(assert (= (and b!1178113 (not c!116820)) b!1178102))

(assert (= (and b!1178113 res!782609) b!1178116))

(assert (= (and b!1178120 condMapEmpty!46319) mapIsEmpty!46319))

(assert (= (and b!1178120 (not condMapEmpty!46319)) mapNonEmpty!46319))

(get-info :version)

(assert (= (and mapNonEmpty!46319 ((_ is ValueCellFull!14121) mapValue!46319)) b!1178115))

(assert (= (and b!1178120 ((_ is ValueCellFull!14121) mapDefault!46319)) b!1178105))

(assert (= start!99552 b!1178120))

(declare-fun b_lambda!20275 () Bool)

(assert (=> (not b_lambda!20275) (not b!1178111)))

(declare-fun t!37907 () Bool)

(declare-fun tb!9943 () Bool)

(assert (=> (and start!99552 (= defaultEntry!1004 defaultEntry!1004) t!37907) tb!9943))

(declare-fun result!20453 () Bool)

(assert (=> tb!9943 (= result!20453 tp_is_empty!29661)))

(assert (=> b!1178111 t!37907))

(declare-fun b_and!41131 () Bool)

(assert (= b_and!41129 (and (=> t!37907 result!20453) b_and!41131)))

(declare-fun m!1086057 () Bool)

(assert (=> b!1178104 m!1086057))

(declare-fun m!1086059 () Bool)

(assert (=> mapNonEmpty!46319 m!1086059))

(declare-fun m!1086061 () Bool)

(assert (=> b!1178107 m!1086061))

(declare-fun m!1086063 () Bool)

(assert (=> b!1178106 m!1086063))

(declare-fun m!1086065 () Bool)

(assert (=> b!1178116 m!1086065))

(declare-fun m!1086067 () Bool)

(assert (=> b!1178119 m!1086067))

(declare-fun m!1086069 () Bool)

(assert (=> b!1178118 m!1086069))

(declare-fun m!1086071 () Bool)

(assert (=> b!1178118 m!1086071))

(declare-fun m!1086073 () Bool)

(assert (=> b!1178108 m!1086073))

(declare-fun m!1086075 () Bool)

(assert (=> b!1178108 m!1086075))

(declare-fun m!1086077 () Bool)

(assert (=> b!1178108 m!1086077))

(declare-fun m!1086079 () Bool)

(assert (=> b!1178108 m!1086079))

(declare-fun m!1086081 () Bool)

(assert (=> b!1178108 m!1086081))

(declare-fun m!1086083 () Bool)

(assert (=> b!1178117 m!1086083))

(declare-fun m!1086085 () Bool)

(assert (=> b!1178101 m!1086085))

(declare-fun m!1086087 () Bool)

(assert (=> start!99552 m!1086087))

(declare-fun m!1086089 () Bool)

(assert (=> start!99552 m!1086089))

(declare-fun m!1086091 () Bool)

(assert (=> b!1178112 m!1086091))

(declare-fun m!1086093 () Bool)

(assert (=> b!1178109 m!1086093))

(declare-fun m!1086095 () Bool)

(assert (=> b!1178103 m!1086095))

(declare-fun m!1086097 () Bool)

(assert (=> b!1178103 m!1086097))

(declare-fun m!1086099 () Bool)

(assert (=> b!1178111 m!1086099))

(declare-fun m!1086101 () Bool)

(assert (=> b!1178111 m!1086101))

(declare-fun m!1086103 () Bool)

(assert (=> b!1178111 m!1086103))

(declare-fun m!1086105 () Bool)

(assert (=> b!1178111 m!1086105))

(declare-fun m!1086107 () Bool)

(assert (=> b!1178114 m!1086107))

(declare-fun m!1086109 () Bool)

(assert (=> b!1178114 m!1086109))

(declare-fun m!1086111 () Bool)

(assert (=> b!1178114 m!1086111))

(declare-fun m!1086113 () Bool)

(assert (=> b!1178114 m!1086113))

(assert (=> b!1178114 m!1086091))

(declare-fun m!1086115 () Bool)

(assert (=> b!1178114 m!1086115))

(assert (=> b!1178114 m!1086091))

(assert (=> b!1178113 m!1086091))

(declare-fun m!1086117 () Bool)

(assert (=> b!1178113 m!1086117))

(declare-fun m!1086119 () Bool)

(assert (=> b!1178113 m!1086119))

(assert (=> b!1178113 m!1086119))

(declare-fun m!1086121 () Bool)

(assert (=> b!1178113 m!1086121))

(check-sat (not b!1178108) (not b!1178104) (not b_lambda!20275) (not b!1178106) b_and!41131 (not b!1178114) (not mapNonEmpty!46319) (not b!1178111) (not b!1178117) (not b_next!25131) (not b!1178113) (not b!1178109) (not b!1178119) (not b!1178116) (not start!99552) tp_is_empty!29661 (not b!1178101) (not b!1178103) (not b!1178118))
(check-sat b_and!41131 (not b_next!25131))

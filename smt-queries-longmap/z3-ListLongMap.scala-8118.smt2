; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99568 () Bool)

(assert start!99568)

(declare-fun b_free!25153 () Bool)

(declare-fun b_next!25153 () Bool)

(assert (=> start!99568 (= b_free!25153 (not b_next!25153))))

(declare-fun tp!88173 () Bool)

(declare-fun b_and!41151 () Bool)

(assert (=> start!99568 (= tp!88173 b_and!41151)))

(declare-fun b!1178691 () Bool)

(declare-fun res!783074 () Bool)

(declare-fun e!670088 () Bool)

(assert (=> b!1178691 (=> (not res!783074) (not e!670088))))

(declare-datatypes ((array!76104 0))(
  ( (array!76105 (arr!36702 (Array (_ BitVec 32) (_ BitVec 64))) (size!37240 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76104)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1178691 (= res!783074 (= (select (arr!36702 _keys!1208) i!673) k0!934))))

(declare-fun b!1178692 () Bool)

(declare-fun e!670083 () Bool)

(declare-fun e!670089 () Bool)

(assert (=> b!1178692 (= e!670083 e!670089)))

(declare-fun res!783068 () Bool)

(assert (=> b!1178692 (=> res!783068 e!670089)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178692 (= res!783068 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!44705 0))(
  ( (V!44706 (val!14898 Int)) )
))
(declare-datatypes ((ValueCell!14132 0))(
  ( (ValueCellFull!14132 (v!17535 V!44705)) (EmptyCell!14132) )
))
(declare-datatypes ((array!76106 0))(
  ( (array!76107 (arr!36703 (Array (_ BitVec 32) ValueCell!14132)) (size!37241 (_ BitVec 32))) )
))
(declare-fun lt!532419 () array!76106)

(declare-fun lt!532420 () array!76104)

(declare-datatypes ((tuple2!19178 0))(
  ( (tuple2!19179 (_1!9600 (_ BitVec 64)) (_2!9600 V!44705)) )
))
(declare-datatypes ((List!25884 0))(
  ( (Nil!25881) (Cons!25880 (h!27089 tuple2!19178) (t!38020 List!25884)) )
))
(declare-datatypes ((ListLongMap!17147 0))(
  ( (ListLongMap!17148 (toList!8589 List!25884)) )
))
(declare-fun lt!532422 () ListLongMap!17147)

(declare-fun minValue!944 () V!44705)

(declare-fun zeroValue!944 () V!44705)

(declare-fun getCurrentListMapNoExtraKeys!5050 (array!76104 array!76106 (_ BitVec 32) (_ BitVec 32) V!44705 V!44705 (_ BitVec 32) Int) ListLongMap!17147)

(assert (=> b!1178692 (= lt!532422 (getCurrentListMapNoExtraKeys!5050 lt!532420 lt!532419 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76106)

(declare-fun lt!532430 () V!44705)

(assert (=> b!1178692 (= lt!532419 (array!76107 (store (arr!36703 _values!996) i!673 (ValueCellFull!14132 lt!532430)) (size!37241 _values!996)))))

(declare-fun dynLambda!2963 (Int (_ BitVec 64)) V!44705)

(assert (=> b!1178692 (= lt!532430 (dynLambda!2963 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532418 () ListLongMap!17147)

(assert (=> b!1178692 (= lt!532418 (getCurrentListMapNoExtraKeys!5050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178693 () Bool)

(declare-fun e!670082 () Bool)

(declare-fun tp_is_empty!29683 () Bool)

(assert (=> b!1178693 (= e!670082 tp_is_empty!29683)))

(declare-fun mapNonEmpty!46352 () Bool)

(declare-fun mapRes!46352 () Bool)

(declare-fun tp!88172 () Bool)

(declare-fun e!670087 () Bool)

(assert (=> mapNonEmpty!46352 (= mapRes!46352 (and tp!88172 e!670087))))

(declare-fun mapRest!46352 () (Array (_ BitVec 32) ValueCell!14132))

(declare-fun mapKey!46352 () (_ BitVec 32))

(declare-fun mapValue!46352 () ValueCell!14132)

(assert (=> mapNonEmpty!46352 (= (arr!36703 _values!996) (store mapRest!46352 mapKey!46352 mapValue!46352))))

(declare-fun b!1178694 () Bool)

(declare-fun e!670092 () Bool)

(assert (=> b!1178694 (= e!670092 (and e!670082 mapRes!46352))))

(declare-fun condMapEmpty!46352 () Bool)

(declare-fun mapDefault!46352 () ValueCell!14132)

(assert (=> b!1178694 (= condMapEmpty!46352 (= (arr!36703 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14132)) mapDefault!46352)))))

(declare-fun b!1178696 () Bool)

(declare-fun res!783072 () Bool)

(assert (=> b!1178696 (=> (not res!783072) (not e!670088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178696 (= res!783072 (validMask!0 mask!1564))))

(declare-fun b!1178697 () Bool)

(declare-fun res!783073 () Bool)

(assert (=> b!1178697 (=> (not res!783073) (not e!670088))))

(assert (=> b!1178697 (= res!783073 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37240 _keys!1208))))))

(declare-fun b!1178698 () Bool)

(declare-fun e!670085 () Bool)

(assert (=> b!1178698 (= e!670089 e!670085)))

(declare-fun res!783069 () Bool)

(assert (=> b!1178698 (=> res!783069 e!670085)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178698 (= res!783069 (not (validKeyInArray!0 (select (arr!36702 _keys!1208) from!1455))))))

(declare-fun lt!532417 () ListLongMap!17147)

(declare-fun lt!532429 () ListLongMap!17147)

(assert (=> b!1178698 (= lt!532417 lt!532429)))

(declare-fun lt!532428 () ListLongMap!17147)

(declare-fun -!1557 (ListLongMap!17147 (_ BitVec 64)) ListLongMap!17147)

(assert (=> b!1178698 (= lt!532429 (-!1557 lt!532428 k0!934))))

(assert (=> b!1178698 (= lt!532417 (getCurrentListMapNoExtraKeys!5050 lt!532420 lt!532419 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178698 (= lt!532428 (getCurrentListMapNoExtraKeys!5050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38791 0))(
  ( (Unit!38792) )
))
(declare-fun lt!532425 () Unit!38791)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!821 (array!76104 array!76106 (_ BitVec 32) (_ BitVec 32) V!44705 V!44705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38791)

(assert (=> b!1178698 (= lt!532425 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178699 () Bool)

(assert (=> b!1178699 (= e!670085 true)))

(declare-fun e!670081 () Bool)

(assert (=> b!1178699 e!670081))

(declare-fun res!783071 () Bool)

(assert (=> b!1178699 (=> (not res!783071) (not e!670081))))

(assert (=> b!1178699 (= res!783071 (not (= (select (arr!36702 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532427 () Unit!38791)

(declare-fun e!670084 () Unit!38791)

(assert (=> b!1178699 (= lt!532427 e!670084)))

(declare-fun c!116827 () Bool)

(assert (=> b!1178699 (= c!116827 (= (select (arr!36702 _keys!1208) from!1455) k0!934))))

(declare-fun e!670086 () Bool)

(assert (=> b!1178699 e!670086))

(declare-fun res!783075 () Bool)

(assert (=> b!1178699 (=> (not res!783075) (not e!670086))))

(declare-fun lt!532421 () tuple2!19178)

(declare-fun +!3890 (ListLongMap!17147 tuple2!19178) ListLongMap!17147)

(assert (=> b!1178699 (= res!783075 (= lt!532422 (+!3890 lt!532429 lt!532421)))))

(declare-fun get!18767 (ValueCell!14132 V!44705) V!44705)

(assert (=> b!1178699 (= lt!532421 (tuple2!19179 (select (arr!36702 _keys!1208) from!1455) (get!18767 (select (arr!36703 _values!996) from!1455) lt!532430)))))

(declare-fun b!1178700 () Bool)

(assert (=> b!1178700 (= e!670081 (= lt!532418 (+!3890 lt!532428 lt!532421)))))

(declare-fun b!1178701 () Bool)

(declare-fun e!670093 () Bool)

(assert (=> b!1178701 (= e!670093 (not e!670083))))

(declare-fun res!783065 () Bool)

(assert (=> b!1178701 (=> res!783065 e!670083)))

(assert (=> b!1178701 (= res!783065 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178701 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532424 () Unit!38791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76104 (_ BitVec 64) (_ BitVec 32)) Unit!38791)

(assert (=> b!1178701 (= lt!532424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178702 () Bool)

(declare-fun e!670091 () Bool)

(assert (=> b!1178702 (= e!670086 e!670091)))

(declare-fun res!783078 () Bool)

(assert (=> b!1178702 (=> res!783078 e!670091)))

(assert (=> b!1178702 (= res!783078 (not (= (select (arr!36702 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178703 () Bool)

(declare-fun res!783064 () Bool)

(assert (=> b!1178703 (=> (not res!783064) (not e!670088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76104 (_ BitVec 32)) Bool)

(assert (=> b!1178703 (= res!783064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178704 () Bool)

(declare-fun res!783067 () Bool)

(assert (=> b!1178704 (=> (not res!783067) (not e!670088))))

(assert (=> b!1178704 (= res!783067 (validKeyInArray!0 k0!934))))

(declare-fun b!1178705 () Bool)

(declare-fun res!783079 () Bool)

(assert (=> b!1178705 (=> (not res!783079) (not e!670088))))

(assert (=> b!1178705 (= res!783079 (and (= (size!37241 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37240 _keys!1208) (size!37241 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178706 () Bool)

(assert (=> b!1178706 (= e!670088 e!670093)))

(declare-fun res!783070 () Bool)

(assert (=> b!1178706 (=> (not res!783070) (not e!670093))))

(assert (=> b!1178706 (= res!783070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532420 mask!1564))))

(assert (=> b!1178706 (= lt!532420 (array!76105 (store (arr!36702 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37240 _keys!1208)))))

(declare-fun b!1178707 () Bool)

(assert (=> b!1178707 (= e!670091 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178708 () Bool)

(declare-fun res!783076 () Bool)

(assert (=> b!1178708 (=> (not res!783076) (not e!670093))))

(declare-datatypes ((List!25885 0))(
  ( (Nil!25882) (Cons!25881 (h!27090 (_ BitVec 64)) (t!38021 List!25885)) )
))
(declare-fun arrayNoDuplicates!0 (array!76104 (_ BitVec 32) List!25885) Bool)

(assert (=> b!1178708 (= res!783076 (arrayNoDuplicates!0 lt!532420 #b00000000000000000000000000000000 Nil!25882))))

(declare-fun b!1178709 () Bool)

(assert (=> b!1178709 (= e!670087 tp_is_empty!29683)))

(declare-fun b!1178695 () Bool)

(declare-fun Unit!38793 () Unit!38791)

(assert (=> b!1178695 (= e!670084 Unit!38793)))

(declare-fun lt!532426 () Unit!38791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76104 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38791)

(assert (=> b!1178695 (= lt!532426 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178695 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532423 () Unit!38791)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76104 (_ BitVec 32) (_ BitVec 32)) Unit!38791)

(assert (=> b!1178695 (= lt!532423 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178695 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25882)))

(declare-fun lt!532431 () Unit!38791)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76104 (_ BitVec 64) (_ BitVec 32) List!25885) Unit!38791)

(assert (=> b!1178695 (= lt!532431 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25882))))

(assert (=> b!1178695 false))

(declare-fun res!783066 () Bool)

(assert (=> start!99568 (=> (not res!783066) (not e!670088))))

(assert (=> start!99568 (= res!783066 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37240 _keys!1208))))))

(assert (=> start!99568 e!670088))

(assert (=> start!99568 tp_is_empty!29683))

(declare-fun array_inv!28136 (array!76104) Bool)

(assert (=> start!99568 (array_inv!28136 _keys!1208)))

(assert (=> start!99568 true))

(assert (=> start!99568 tp!88173))

(declare-fun array_inv!28137 (array!76106) Bool)

(assert (=> start!99568 (and (array_inv!28137 _values!996) e!670092)))

(declare-fun b!1178710 () Bool)

(declare-fun Unit!38794 () Unit!38791)

(assert (=> b!1178710 (= e!670084 Unit!38794)))

(declare-fun mapIsEmpty!46352 () Bool)

(assert (=> mapIsEmpty!46352 mapRes!46352))

(declare-fun b!1178711 () Bool)

(declare-fun res!783077 () Bool)

(assert (=> b!1178711 (=> (not res!783077) (not e!670088))))

(assert (=> b!1178711 (= res!783077 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25882))))

(assert (= (and start!99568 res!783066) b!1178696))

(assert (= (and b!1178696 res!783072) b!1178705))

(assert (= (and b!1178705 res!783079) b!1178703))

(assert (= (and b!1178703 res!783064) b!1178711))

(assert (= (and b!1178711 res!783077) b!1178697))

(assert (= (and b!1178697 res!783073) b!1178704))

(assert (= (and b!1178704 res!783067) b!1178691))

(assert (= (and b!1178691 res!783074) b!1178706))

(assert (= (and b!1178706 res!783070) b!1178708))

(assert (= (and b!1178708 res!783076) b!1178701))

(assert (= (and b!1178701 (not res!783065)) b!1178692))

(assert (= (and b!1178692 (not res!783068)) b!1178698))

(assert (= (and b!1178698 (not res!783069)) b!1178699))

(assert (= (and b!1178699 res!783075) b!1178702))

(assert (= (and b!1178702 (not res!783078)) b!1178707))

(assert (= (and b!1178699 c!116827) b!1178695))

(assert (= (and b!1178699 (not c!116827)) b!1178710))

(assert (= (and b!1178699 res!783071) b!1178700))

(assert (= (and b!1178694 condMapEmpty!46352) mapIsEmpty!46352))

(assert (= (and b!1178694 (not condMapEmpty!46352)) mapNonEmpty!46352))

(get-info :version)

(assert (= (and mapNonEmpty!46352 ((_ is ValueCellFull!14132) mapValue!46352)) b!1178709))

(assert (= (and b!1178694 ((_ is ValueCellFull!14132) mapDefault!46352)) b!1178693))

(assert (= start!99568 b!1178694))

(declare-fun b_lambda!20279 () Bool)

(assert (=> (not b_lambda!20279) (not b!1178692)))

(declare-fun t!38019 () Bool)

(declare-fun tb!9957 () Bool)

(assert (=> (and start!99568 (= defaultEntry!1004 defaultEntry!1004) t!38019) tb!9957))

(declare-fun result!20489 () Bool)

(assert (=> tb!9957 (= result!20489 tp_is_empty!29683)))

(assert (=> b!1178692 t!38019))

(declare-fun b_and!41153 () Bool)

(assert (= b_and!41151 (and (=> t!38019 result!20489) b_and!41153)))

(declare-fun m!1086173 () Bool)

(assert (=> b!1178703 m!1086173))

(declare-fun m!1086175 () Bool)

(assert (=> mapNonEmpty!46352 m!1086175))

(declare-fun m!1086177 () Bool)

(assert (=> start!99568 m!1086177))

(declare-fun m!1086179 () Bool)

(assert (=> start!99568 m!1086179))

(declare-fun m!1086181 () Bool)

(assert (=> b!1178701 m!1086181))

(declare-fun m!1086183 () Bool)

(assert (=> b!1178701 m!1086183))

(declare-fun m!1086185 () Bool)

(assert (=> b!1178698 m!1086185))

(declare-fun m!1086187 () Bool)

(assert (=> b!1178698 m!1086187))

(declare-fun m!1086189 () Bool)

(assert (=> b!1178698 m!1086189))

(declare-fun m!1086191 () Bool)

(assert (=> b!1178698 m!1086191))

(declare-fun m!1086193 () Bool)

(assert (=> b!1178698 m!1086193))

(declare-fun m!1086195 () Bool)

(assert (=> b!1178698 m!1086195))

(assert (=> b!1178698 m!1086193))

(declare-fun m!1086197 () Bool)

(assert (=> b!1178706 m!1086197))

(declare-fun m!1086199 () Bool)

(assert (=> b!1178706 m!1086199))

(declare-fun m!1086201 () Bool)

(assert (=> b!1178704 m!1086201))

(declare-fun m!1086203 () Bool)

(assert (=> b!1178700 m!1086203))

(declare-fun m!1086205 () Bool)

(assert (=> b!1178707 m!1086205))

(declare-fun m!1086207 () Bool)

(assert (=> b!1178691 m!1086207))

(declare-fun m!1086209 () Bool)

(assert (=> b!1178711 m!1086209))

(declare-fun m!1086211 () Bool)

(assert (=> b!1178692 m!1086211))

(declare-fun m!1086213 () Bool)

(assert (=> b!1178692 m!1086213))

(declare-fun m!1086215 () Bool)

(assert (=> b!1178692 m!1086215))

(declare-fun m!1086217 () Bool)

(assert (=> b!1178692 m!1086217))

(declare-fun m!1086219 () Bool)

(assert (=> b!1178696 m!1086219))

(declare-fun m!1086221 () Bool)

(assert (=> b!1178695 m!1086221))

(declare-fun m!1086223 () Bool)

(assert (=> b!1178695 m!1086223))

(declare-fun m!1086225 () Bool)

(assert (=> b!1178695 m!1086225))

(declare-fun m!1086227 () Bool)

(assert (=> b!1178695 m!1086227))

(declare-fun m!1086229 () Bool)

(assert (=> b!1178695 m!1086229))

(assert (=> b!1178702 m!1086193))

(assert (=> b!1178699 m!1086193))

(declare-fun m!1086231 () Bool)

(assert (=> b!1178699 m!1086231))

(declare-fun m!1086233 () Bool)

(assert (=> b!1178699 m!1086233))

(assert (=> b!1178699 m!1086233))

(declare-fun m!1086235 () Bool)

(assert (=> b!1178699 m!1086235))

(declare-fun m!1086237 () Bool)

(assert (=> b!1178708 m!1086237))

(check-sat (not b_next!25153) (not b!1178701) (not b!1178698) (not b!1178706) (not b!1178708) tp_is_empty!29683 (not b!1178700) (not b!1178704) (not b_lambda!20279) (not b!1178711) (not b!1178695) b_and!41153 (not b!1178707) (not b!1178699) (not start!99568) (not b!1178696) (not b!1178692) (not mapNonEmpty!46352) (not b!1178703))
(check-sat b_and!41153 (not b_next!25153))

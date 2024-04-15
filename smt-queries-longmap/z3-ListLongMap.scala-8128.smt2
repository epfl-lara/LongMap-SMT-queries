; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99628 () Bool)

(assert start!99628)

(declare-fun b_free!25213 () Bool)

(declare-fun b_next!25213 () Bool)

(assert (=> start!99628 (= b_free!25213 (not b_next!25213))))

(declare-fun tp!88352 () Bool)

(declare-fun b_and!41271 () Bool)

(assert (=> start!99628 (= tp!88352 b_and!41271)))

(declare-fun res!784568 () Bool)

(declare-fun e!671263 () Bool)

(assert (=> start!99628 (=> (not res!784568) (not e!671263))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76222 0))(
  ( (array!76223 (arr!36761 (Array (_ BitVec 32) (_ BitVec 64))) (size!37299 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76222)

(assert (=> start!99628 (= res!784568 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37299 _keys!1208))))))

(assert (=> start!99628 e!671263))

(declare-fun tp_is_empty!29743 () Bool)

(assert (=> start!99628 tp_is_empty!29743))

(declare-fun array_inv!28180 (array!76222) Bool)

(assert (=> start!99628 (array_inv!28180 _keys!1208)))

(assert (=> start!99628 true))

(assert (=> start!99628 tp!88352))

(declare-datatypes ((V!44785 0))(
  ( (V!44786 (val!14928 Int)) )
))
(declare-datatypes ((ValueCell!14162 0))(
  ( (ValueCellFull!14162 (v!17565 V!44785)) (EmptyCell!14162) )
))
(declare-datatypes ((array!76224 0))(
  ( (array!76225 (arr!36762 (Array (_ BitVec 32) ValueCell!14162)) (size!37300 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76224)

(declare-fun e!671251 () Bool)

(declare-fun array_inv!28181 (array!76224) Bool)

(assert (=> start!99628 (and (array_inv!28181 _values!996) e!671251)))

(declare-fun mapIsEmpty!46442 () Bool)

(declare-fun mapRes!46442 () Bool)

(assert (=> mapIsEmpty!46442 mapRes!46442))

(declare-fun b!1180697 () Bool)

(declare-fun e!671262 () Bool)

(declare-fun e!671259 () Bool)

(assert (=> b!1180697 (= e!671262 e!671259)))

(declare-fun res!784566 () Bool)

(assert (=> b!1180697 (=> res!784566 e!671259)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180697 (= res!784566 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44785)

(declare-datatypes ((tuple2!19230 0))(
  ( (tuple2!19231 (_1!9626 (_ BitVec 64)) (_2!9626 V!44785)) )
))
(declare-datatypes ((List!25937 0))(
  ( (Nil!25934) (Cons!25933 (h!27142 tuple2!19230) (t!38133 List!25937)) )
))
(declare-datatypes ((ListLongMap!17199 0))(
  ( (ListLongMap!17200 (toList!8615 List!25937)) )
))
(declare-fun lt!533770 () ListLongMap!17199)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!533778 () array!76224)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44785)

(declare-fun lt!533779 () array!76222)

(declare-fun getCurrentListMapNoExtraKeys!5072 (array!76222 array!76224 (_ BitVec 32) (_ BitVec 32) V!44785 V!44785 (_ BitVec 32) Int) ListLongMap!17199)

(assert (=> b!1180697 (= lt!533770 (getCurrentListMapNoExtraKeys!5072 lt!533779 lt!533778 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533777 () V!44785)

(assert (=> b!1180697 (= lt!533778 (array!76225 (store (arr!36762 _values!996) i!673 (ValueCellFull!14162 lt!533777)) (size!37300 _values!996)))))

(declare-fun dynLambda!2982 (Int (_ BitVec 64)) V!44785)

(assert (=> b!1180697 (= lt!533777 (dynLambda!2982 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533769 () ListLongMap!17199)

(assert (=> b!1180697 (= lt!533769 (getCurrentListMapNoExtraKeys!5072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180698 () Bool)

(declare-fun e!671252 () Bool)

(declare-fun e!671261 () Bool)

(assert (=> b!1180698 (= e!671252 e!671261)))

(declare-fun res!784565 () Bool)

(assert (=> b!1180698 (=> res!784565 e!671261)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1180698 (= res!784565 (not (= (select (arr!36761 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180699 () Bool)

(declare-fun res!784575 () Bool)

(assert (=> b!1180699 (=> (not res!784575) (not e!671263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76222 (_ BitVec 32)) Bool)

(assert (=> b!1180699 (= res!784575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180700 () Bool)

(declare-fun e!671255 () Bool)

(assert (=> b!1180700 (= e!671263 e!671255)))

(declare-fun res!784569 () Bool)

(assert (=> b!1180700 (=> (not res!784569) (not e!671255))))

(assert (=> b!1180700 (= res!784569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533779 mask!1564))))

(assert (=> b!1180700 (= lt!533779 (array!76223 (store (arr!36761 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37299 _keys!1208)))))

(declare-fun b!1180701 () Bool)

(assert (=> b!1180701 (= e!671255 (not e!671262))))

(declare-fun res!784563 () Bool)

(assert (=> b!1180701 (=> res!784563 e!671262)))

(assert (=> b!1180701 (= res!784563 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180701 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38887 0))(
  ( (Unit!38888) )
))
(declare-fun lt!533774 () Unit!38887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76222 (_ BitVec 64) (_ BitVec 32)) Unit!38887)

(assert (=> b!1180701 (= lt!533774 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180702 () Bool)

(declare-fun e!671260 () Bool)

(assert (=> b!1180702 (= e!671260 true)))

(declare-fun e!671253 () Bool)

(assert (=> b!1180702 e!671253))

(declare-fun res!784571 () Bool)

(assert (=> b!1180702 (=> (not res!784571) (not e!671253))))

(assert (=> b!1180702 (= res!784571 (not (= (select (arr!36761 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533780 () Unit!38887)

(declare-fun e!671256 () Unit!38887)

(assert (=> b!1180702 (= lt!533780 e!671256)))

(declare-fun c!116917 () Bool)

(assert (=> b!1180702 (= c!116917 (= (select (arr!36761 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180702 e!671252))

(declare-fun res!784561 () Bool)

(assert (=> b!1180702 (=> (not res!784561) (not e!671252))))

(declare-fun lt!533775 () tuple2!19230)

(declare-fun lt!533767 () ListLongMap!17199)

(declare-fun +!3913 (ListLongMap!17199 tuple2!19230) ListLongMap!17199)

(assert (=> b!1180702 (= res!784561 (= lt!533770 (+!3913 lt!533767 lt!533775)))))

(declare-fun get!18808 (ValueCell!14162 V!44785) V!44785)

(assert (=> b!1180702 (= lt!533775 (tuple2!19231 (select (arr!36761 _keys!1208) from!1455) (get!18808 (select (arr!36762 _values!996) from!1455) lt!533777)))))

(declare-fun mapNonEmpty!46442 () Bool)

(declare-fun tp!88353 () Bool)

(declare-fun e!671257 () Bool)

(assert (=> mapNonEmpty!46442 (= mapRes!46442 (and tp!88353 e!671257))))

(declare-fun mapKey!46442 () (_ BitVec 32))

(declare-fun mapRest!46442 () (Array (_ BitVec 32) ValueCell!14162))

(declare-fun mapValue!46442 () ValueCell!14162)

(assert (=> mapNonEmpty!46442 (= (arr!36762 _values!996) (store mapRest!46442 mapKey!46442 mapValue!46442))))

(declare-fun b!1180703 () Bool)

(declare-fun res!784564 () Bool)

(assert (=> b!1180703 (=> (not res!784564) (not e!671263))))

(assert (=> b!1180703 (= res!784564 (= (select (arr!36761 _keys!1208) i!673) k0!934))))

(declare-fun b!1180704 () Bool)

(assert (=> b!1180704 (= e!671261 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180705 () Bool)

(declare-fun e!671254 () Bool)

(assert (=> b!1180705 (= e!671251 (and e!671254 mapRes!46442))))

(declare-fun condMapEmpty!46442 () Bool)

(declare-fun mapDefault!46442 () ValueCell!14162)

(assert (=> b!1180705 (= condMapEmpty!46442 (= (arr!36762 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14162)) mapDefault!46442)))))

(declare-fun b!1180706 () Bool)

(declare-fun res!784576 () Bool)

(assert (=> b!1180706 (=> (not res!784576) (not e!671263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180706 (= res!784576 (validKeyInArray!0 k0!934))))

(declare-fun b!1180707 () Bool)

(assert (=> b!1180707 (= e!671257 tp_is_empty!29743)))

(declare-fun b!1180708 () Bool)

(declare-fun Unit!38889 () Unit!38887)

(assert (=> b!1180708 (= e!671256 Unit!38889)))

(declare-fun lt!533771 () Unit!38887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76222 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38887)

(assert (=> b!1180708 (= lt!533771 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180708 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533781 () Unit!38887)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76222 (_ BitVec 32) (_ BitVec 32)) Unit!38887)

(assert (=> b!1180708 (= lt!533781 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25938 0))(
  ( (Nil!25935) (Cons!25934 (h!27143 (_ BitVec 64)) (t!38134 List!25938)) )
))
(declare-fun arrayNoDuplicates!0 (array!76222 (_ BitVec 32) List!25938) Bool)

(assert (=> b!1180708 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25935)))

(declare-fun lt!533773 () Unit!38887)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76222 (_ BitVec 64) (_ BitVec 32) List!25938) Unit!38887)

(assert (=> b!1180708 (= lt!533773 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25935))))

(assert (=> b!1180708 false))

(declare-fun b!1180709 () Bool)

(assert (=> b!1180709 (= e!671254 tp_is_empty!29743)))

(declare-fun b!1180710 () Bool)

(declare-fun res!784574 () Bool)

(assert (=> b!1180710 (=> (not res!784574) (not e!671255))))

(assert (=> b!1180710 (= res!784574 (arrayNoDuplicates!0 lt!533779 #b00000000000000000000000000000000 Nil!25935))))

(declare-fun b!1180711 () Bool)

(declare-fun res!784567 () Bool)

(assert (=> b!1180711 (=> (not res!784567) (not e!671263))))

(assert (=> b!1180711 (= res!784567 (and (= (size!37300 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37299 _keys!1208) (size!37300 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180712 () Bool)

(declare-fun lt!533776 () ListLongMap!17199)

(assert (=> b!1180712 (= e!671253 (= lt!533767 lt!533776))))

(declare-fun b!1180713 () Bool)

(declare-fun res!784573 () Bool)

(assert (=> b!1180713 (=> (not res!784573) (not e!671253))))

(declare-fun lt!533772 () ListLongMap!17199)

(assert (=> b!1180713 (= res!784573 (= lt!533769 (+!3913 lt!533772 lt!533775)))))

(declare-fun b!1180714 () Bool)

(assert (=> b!1180714 (= e!671259 e!671260)))

(declare-fun res!784562 () Bool)

(assert (=> b!1180714 (=> res!784562 e!671260)))

(assert (=> b!1180714 (= res!784562 (not (validKeyInArray!0 (select (arr!36761 _keys!1208) from!1455))))))

(assert (=> b!1180714 (= lt!533776 lt!533767)))

(declare-fun -!1576 (ListLongMap!17199 (_ BitVec 64)) ListLongMap!17199)

(assert (=> b!1180714 (= lt!533767 (-!1576 lt!533772 k0!934))))

(assert (=> b!1180714 (= lt!533776 (getCurrentListMapNoExtraKeys!5072 lt!533779 lt!533778 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180714 (= lt!533772 (getCurrentListMapNoExtraKeys!5072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533768 () Unit!38887)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!840 (array!76222 array!76224 (_ BitVec 32) (_ BitVec 32) V!44785 V!44785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38887)

(assert (=> b!1180714 (= lt!533768 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180715 () Bool)

(declare-fun res!784572 () Bool)

(assert (=> b!1180715 (=> (not res!784572) (not e!671263))))

(assert (=> b!1180715 (= res!784572 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37299 _keys!1208))))))

(declare-fun b!1180716 () Bool)

(declare-fun res!784570 () Bool)

(assert (=> b!1180716 (=> (not res!784570) (not e!671263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180716 (= res!784570 (validMask!0 mask!1564))))

(declare-fun b!1180717 () Bool)

(declare-fun res!784560 () Bool)

(assert (=> b!1180717 (=> (not res!784560) (not e!671263))))

(assert (=> b!1180717 (= res!784560 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25935))))

(declare-fun b!1180718 () Bool)

(declare-fun Unit!38890 () Unit!38887)

(assert (=> b!1180718 (= e!671256 Unit!38890)))

(assert (= (and start!99628 res!784568) b!1180716))

(assert (= (and b!1180716 res!784570) b!1180711))

(assert (= (and b!1180711 res!784567) b!1180699))

(assert (= (and b!1180699 res!784575) b!1180717))

(assert (= (and b!1180717 res!784560) b!1180715))

(assert (= (and b!1180715 res!784572) b!1180706))

(assert (= (and b!1180706 res!784576) b!1180703))

(assert (= (and b!1180703 res!784564) b!1180700))

(assert (= (and b!1180700 res!784569) b!1180710))

(assert (= (and b!1180710 res!784574) b!1180701))

(assert (= (and b!1180701 (not res!784563)) b!1180697))

(assert (= (and b!1180697 (not res!784566)) b!1180714))

(assert (= (and b!1180714 (not res!784562)) b!1180702))

(assert (= (and b!1180702 res!784561) b!1180698))

(assert (= (and b!1180698 (not res!784565)) b!1180704))

(assert (= (and b!1180702 c!116917) b!1180708))

(assert (= (and b!1180702 (not c!116917)) b!1180718))

(assert (= (and b!1180702 res!784571) b!1180713))

(assert (= (and b!1180713 res!784573) b!1180712))

(assert (= (and b!1180705 condMapEmpty!46442) mapIsEmpty!46442))

(assert (= (and b!1180705 (not condMapEmpty!46442)) mapNonEmpty!46442))

(get-info :version)

(assert (= (and mapNonEmpty!46442 ((_ is ValueCellFull!14162) mapValue!46442)) b!1180707))

(assert (= (and b!1180705 ((_ is ValueCellFull!14162) mapDefault!46442)) b!1180709))

(assert (= start!99628 b!1180705))

(declare-fun b_lambda!20339 () Bool)

(assert (=> (not b_lambda!20339) (not b!1180697)))

(declare-fun t!38132 () Bool)

(declare-fun tb!10017 () Bool)

(assert (=> (and start!99628 (= defaultEntry!1004 defaultEntry!1004) t!38132) tb!10017))

(declare-fun result!20609 () Bool)

(assert (=> tb!10017 (= result!20609 tp_is_empty!29743)))

(assert (=> b!1180697 t!38132))

(declare-fun b_and!41273 () Bool)

(assert (= b_and!41271 (and (=> t!38132 result!20609) b_and!41273)))

(declare-fun m!1088153 () Bool)

(assert (=> b!1180698 m!1088153))

(declare-fun m!1088155 () Bool)

(assert (=> b!1180704 m!1088155))

(declare-fun m!1088157 () Bool)

(assert (=> b!1180714 m!1088157))

(declare-fun m!1088159 () Bool)

(assert (=> b!1180714 m!1088159))

(assert (=> b!1180714 m!1088153))

(declare-fun m!1088161 () Bool)

(assert (=> b!1180714 m!1088161))

(assert (=> b!1180714 m!1088153))

(declare-fun m!1088163 () Bool)

(assert (=> b!1180714 m!1088163))

(declare-fun m!1088165 () Bool)

(assert (=> b!1180714 m!1088165))

(declare-fun m!1088167 () Bool)

(assert (=> b!1180710 m!1088167))

(declare-fun m!1088169 () Bool)

(assert (=> mapNonEmpty!46442 m!1088169))

(declare-fun m!1088171 () Bool)

(assert (=> b!1180697 m!1088171))

(declare-fun m!1088173 () Bool)

(assert (=> b!1180697 m!1088173))

(declare-fun m!1088175 () Bool)

(assert (=> b!1180697 m!1088175))

(declare-fun m!1088177 () Bool)

(assert (=> b!1180697 m!1088177))

(declare-fun m!1088179 () Bool)

(assert (=> b!1180706 m!1088179))

(declare-fun m!1088181 () Bool)

(assert (=> b!1180699 m!1088181))

(declare-fun m!1088183 () Bool)

(assert (=> b!1180701 m!1088183))

(declare-fun m!1088185 () Bool)

(assert (=> b!1180701 m!1088185))

(declare-fun m!1088187 () Bool)

(assert (=> b!1180717 m!1088187))

(assert (=> b!1180702 m!1088153))

(declare-fun m!1088189 () Bool)

(assert (=> b!1180702 m!1088189))

(declare-fun m!1088191 () Bool)

(assert (=> b!1180702 m!1088191))

(assert (=> b!1180702 m!1088191))

(declare-fun m!1088193 () Bool)

(assert (=> b!1180702 m!1088193))

(declare-fun m!1088195 () Bool)

(assert (=> b!1180700 m!1088195))

(declare-fun m!1088197 () Bool)

(assert (=> b!1180700 m!1088197))

(declare-fun m!1088199 () Bool)

(assert (=> b!1180713 m!1088199))

(declare-fun m!1088201 () Bool)

(assert (=> start!99628 m!1088201))

(declare-fun m!1088203 () Bool)

(assert (=> start!99628 m!1088203))

(declare-fun m!1088205 () Bool)

(assert (=> b!1180716 m!1088205))

(declare-fun m!1088207 () Bool)

(assert (=> b!1180703 m!1088207))

(declare-fun m!1088209 () Bool)

(assert (=> b!1180708 m!1088209))

(declare-fun m!1088211 () Bool)

(assert (=> b!1180708 m!1088211))

(declare-fun m!1088213 () Bool)

(assert (=> b!1180708 m!1088213))

(declare-fun m!1088215 () Bool)

(assert (=> b!1180708 m!1088215))

(declare-fun m!1088217 () Bool)

(assert (=> b!1180708 m!1088217))

(check-sat (not b!1180697) (not b!1180714) tp_is_empty!29743 (not start!99628) (not b_lambda!20339) (not b!1180708) (not b!1180701) (not b!1180706) (not b!1180700) (not b_next!25213) (not b!1180704) (not b!1180702) (not mapNonEmpty!46442) b_and!41273 (not b!1180699) (not b!1180716) (not b!1180713) (not b!1180710) (not b!1180717))
(check-sat b_and!41273 (not b_next!25213))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99658 () Bool)

(assert start!99658)

(declare-fun b_free!25243 () Bool)

(declare-fun b_next!25243 () Bool)

(assert (=> start!99658 (= b_free!25243 (not b_next!25243))))

(declare-fun tp!88443 () Bool)

(declare-fun b_and!41331 () Bool)

(assert (=> start!99658 (= tp!88443 b_and!41331)))

(declare-fun mapNonEmpty!46487 () Bool)

(declare-fun mapRes!46487 () Bool)

(declare-fun tp!88442 () Bool)

(declare-fun e!671835 () Bool)

(assert (=> mapNonEmpty!46487 (= mapRes!46487 (and tp!88442 e!671835))))

(declare-datatypes ((V!44825 0))(
  ( (V!44826 (val!14943 Int)) )
))
(declare-datatypes ((ValueCell!14177 0))(
  ( (ValueCellFull!14177 (v!17580 V!44825)) (EmptyCell!14177) )
))
(declare-fun mapRest!46487 () (Array (_ BitVec 32) ValueCell!14177))

(declare-fun mapKey!46487 () (_ BitVec 32))

(declare-fun mapValue!46487 () ValueCell!14177)

(declare-datatypes ((array!76280 0))(
  ( (array!76281 (arr!36790 (Array (_ BitVec 32) ValueCell!14177)) (size!37328 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76280)

(assert (=> mapNonEmpty!46487 (= (arr!36790 _values!996) (store mapRest!46487 mapKey!46487 mapValue!46487))))

(declare-fun res!785310 () Bool)

(declare-fun e!671833 () Bool)

(assert (=> start!99658 (=> (not res!785310) (not e!671833))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76282 0))(
  ( (array!76283 (arr!36791 (Array (_ BitVec 32) (_ BitVec 64))) (size!37329 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76282)

(assert (=> start!99658 (= res!785310 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37329 _keys!1208))))))

(assert (=> start!99658 e!671833))

(declare-fun tp_is_empty!29773 () Bool)

(assert (=> start!99658 tp_is_empty!29773))

(declare-fun array_inv!28198 (array!76282) Bool)

(assert (=> start!99658 (array_inv!28198 _keys!1208)))

(assert (=> start!99658 true))

(assert (=> start!99658 tp!88443))

(declare-fun e!671830 () Bool)

(declare-fun array_inv!28199 (array!76280) Bool)

(assert (=> start!99658 (and (array_inv!28199 _values!996) e!671830)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1181695 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!671836 () Bool)

(declare-fun arrayContainsKey!0 (array!76282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181695 (= e!671836 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181696 () Bool)

(declare-fun res!785311 () Bool)

(declare-fun e!671826 () Bool)

(assert (=> b!1181696 (=> (not res!785311) (not e!671826))))

(declare-fun lt!534491 () array!76282)

(declare-datatypes ((List!25960 0))(
  ( (Nil!25957) (Cons!25956 (h!27165 (_ BitVec 64)) (t!38186 List!25960)) )
))
(declare-fun arrayNoDuplicates!0 (array!76282 (_ BitVec 32) List!25960) Bool)

(assert (=> b!1181696 (= res!785311 (arrayNoDuplicates!0 lt!534491 #b00000000000000000000000000000000 Nil!25957))))

(declare-fun b!1181697 () Bool)

(declare-fun e!671832 () Bool)

(assert (=> b!1181697 (= e!671832 e!671836)))

(declare-fun res!785306 () Bool)

(assert (=> b!1181697 (=> res!785306 e!671836)))

(assert (=> b!1181697 (= res!785306 (not (= (select (arr!36791 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181698 () Bool)

(declare-fun e!671829 () Bool)

(assert (=> b!1181698 (= e!671826 (not e!671829))))

(declare-fun res!785304 () Bool)

(assert (=> b!1181698 (=> res!785304 e!671829)))

(assert (=> b!1181698 (= res!785304 (bvsgt from!1455 i!673))))

(assert (=> b!1181698 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38929 0))(
  ( (Unit!38930) )
))
(declare-fun lt!534494 () Unit!38929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76282 (_ BitVec 64) (_ BitVec 32)) Unit!38929)

(assert (=> b!1181698 (= lt!534494 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181699 () Bool)

(declare-fun e!671828 () Unit!38929)

(declare-fun Unit!38931 () Unit!38929)

(assert (=> b!1181699 (= e!671828 Unit!38931)))

(declare-fun lt!534486 () Unit!38929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76282 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38929)

(assert (=> b!1181699 (= lt!534486 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181699 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534502 () Unit!38929)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76282 (_ BitVec 32) (_ BitVec 32)) Unit!38929)

(assert (=> b!1181699 (= lt!534502 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181699 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25957)))

(declare-fun lt!534489 () Unit!38929)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76282 (_ BitVec 64) (_ BitVec 32) List!25960) Unit!38929)

(assert (=> b!1181699 (= lt!534489 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25957))))

(assert (=> b!1181699 false))

(declare-fun b!1181700 () Bool)

(declare-fun res!785312 () Bool)

(assert (=> b!1181700 (=> (not res!785312) (not e!671833))))

(assert (=> b!1181700 (= res!785312 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25957))))

(declare-fun b!1181701 () Bool)

(declare-fun res!785316 () Bool)

(assert (=> b!1181701 (=> (not res!785316) (not e!671833))))

(assert (=> b!1181701 (= res!785316 (= (select (arr!36791 _keys!1208) i!673) k0!934))))

(declare-fun b!1181702 () Bool)

(assert (=> b!1181702 (= e!671835 tp_is_empty!29773)))

(declare-fun b!1181703 () Bool)

(declare-fun Unit!38932 () Unit!38929)

(assert (=> b!1181703 (= e!671828 Unit!38932)))

(declare-fun b!1181704 () Bool)

(declare-fun res!785309 () Bool)

(assert (=> b!1181704 (=> (not res!785309) (not e!671833))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1181704 (= res!785309 (and (= (size!37328 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37329 _keys!1208) (size!37328 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181705 () Bool)

(declare-fun res!785315 () Bool)

(assert (=> b!1181705 (=> (not res!785315) (not e!671833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181705 (= res!785315 (validKeyInArray!0 k0!934))))

(declare-fun b!1181706 () Bool)

(declare-fun e!671834 () Bool)

(assert (=> b!1181706 (= e!671834 tp_is_empty!29773)))

(declare-fun b!1181707 () Bool)

(declare-fun res!785305 () Bool)

(assert (=> b!1181707 (=> (not res!785305) (not e!671833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181707 (= res!785305 (validMask!0 mask!1564))))

(declare-fun b!1181708 () Bool)

(assert (=> b!1181708 (= e!671833 e!671826)))

(declare-fun res!785317 () Bool)

(assert (=> b!1181708 (=> (not res!785317) (not e!671826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76282 (_ BitVec 32)) Bool)

(assert (=> b!1181708 (= res!785317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534491 mask!1564))))

(assert (=> b!1181708 (= lt!534491 (array!76283 (store (arr!36791 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37329 _keys!1208)))))

(declare-fun b!1181709 () Bool)

(declare-fun res!785313 () Bool)

(assert (=> b!1181709 (=> (not res!785313) (not e!671833))))

(assert (=> b!1181709 (= res!785313 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37329 _keys!1208))))))

(declare-fun b!1181710 () Bool)

(declare-fun e!671827 () Bool)

(declare-fun e!671831 () Bool)

(assert (=> b!1181710 (= e!671827 e!671831)))

(declare-fun res!785303 () Bool)

(assert (=> b!1181710 (=> res!785303 e!671831)))

(assert (=> b!1181710 (= res!785303 (not (validKeyInArray!0 (select (arr!36791 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19256 0))(
  ( (tuple2!19257 (_1!9639 (_ BitVec 64)) (_2!9639 V!44825)) )
))
(declare-datatypes ((List!25961 0))(
  ( (Nil!25958) (Cons!25957 (h!27166 tuple2!19256) (t!38187 List!25961)) )
))
(declare-datatypes ((ListLongMap!17225 0))(
  ( (ListLongMap!17226 (toList!8628 List!25961)) )
))
(declare-fun lt!534501 () ListLongMap!17225)

(declare-fun lt!534500 () ListLongMap!17225)

(assert (=> b!1181710 (= lt!534501 lt!534500)))

(declare-fun lt!534496 () ListLongMap!17225)

(declare-fun -!1587 (ListLongMap!17225 (_ BitVec 64)) ListLongMap!17225)

(assert (=> b!1181710 (= lt!534500 (-!1587 lt!534496 k0!934))))

(declare-fun zeroValue!944 () V!44825)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44825)

(declare-fun lt!534499 () array!76280)

(declare-fun getCurrentListMapNoExtraKeys!5083 (array!76282 array!76280 (_ BitVec 32) (_ BitVec 32) V!44825 V!44825 (_ BitVec 32) Int) ListLongMap!17225)

(assert (=> b!1181710 (= lt!534501 (getCurrentListMapNoExtraKeys!5083 lt!534491 lt!534499 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181710 (= lt!534496 (getCurrentListMapNoExtraKeys!5083 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534492 () Unit!38929)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!850 (array!76282 array!76280 (_ BitVec 32) (_ BitVec 32) V!44825 V!44825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38929)

(assert (=> b!1181710 (= lt!534492 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!850 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46487 () Bool)

(assert (=> mapIsEmpty!46487 mapRes!46487))

(declare-fun b!1181711 () Bool)

(assert (=> b!1181711 (= e!671831 true)))

(declare-fun lt!534490 () ListLongMap!17225)

(declare-fun lt!534487 () ListLongMap!17225)

(assert (=> b!1181711 (= (-!1587 lt!534490 k0!934) lt!534487)))

(declare-fun lt!534493 () Unit!38929)

(declare-fun lt!534495 () V!44825)

(declare-fun addRemoveCommutativeForDiffKeys!138 (ListLongMap!17225 (_ BitVec 64) V!44825 (_ BitVec 64)) Unit!38929)

(assert (=> b!1181711 (= lt!534493 (addRemoveCommutativeForDiffKeys!138 lt!534496 (select (arr!36791 _keys!1208) from!1455) lt!534495 k0!934))))

(declare-fun lt!534504 () ListLongMap!17225)

(assert (=> b!1181711 (and (= lt!534504 lt!534490) (= lt!534500 lt!534501))))

(declare-fun lt!534497 () tuple2!19256)

(declare-fun +!3924 (ListLongMap!17225 tuple2!19256) ListLongMap!17225)

(assert (=> b!1181711 (= lt!534490 (+!3924 lt!534496 lt!534497))))

(assert (=> b!1181711 (not (= (select (arr!36791 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534488 () Unit!38929)

(assert (=> b!1181711 (= lt!534488 e!671828)))

(declare-fun c!116962 () Bool)

(assert (=> b!1181711 (= c!116962 (= (select (arr!36791 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181711 e!671832))

(declare-fun res!785314 () Bool)

(assert (=> b!1181711 (=> (not res!785314) (not e!671832))))

(declare-fun lt!534503 () ListLongMap!17225)

(assert (=> b!1181711 (= res!785314 (= lt!534503 lt!534487))))

(assert (=> b!1181711 (= lt!534487 (+!3924 lt!534500 lt!534497))))

(assert (=> b!1181711 (= lt!534497 (tuple2!19257 (select (arr!36791 _keys!1208) from!1455) lt!534495))))

(declare-fun lt!534498 () V!44825)

(declare-fun get!18827 (ValueCell!14177 V!44825) V!44825)

(assert (=> b!1181711 (= lt!534495 (get!18827 (select (arr!36790 _values!996) from!1455) lt!534498))))

(declare-fun b!1181712 () Bool)

(assert (=> b!1181712 (= e!671829 e!671827)))

(declare-fun res!785308 () Bool)

(assert (=> b!1181712 (=> res!785308 e!671827)))

(assert (=> b!1181712 (= res!785308 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1181712 (= lt!534503 (getCurrentListMapNoExtraKeys!5083 lt!534491 lt!534499 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1181712 (= lt!534499 (array!76281 (store (arr!36790 _values!996) i!673 (ValueCellFull!14177 lt!534498)) (size!37328 _values!996)))))

(declare-fun dynLambda!2991 (Int (_ BitVec 64)) V!44825)

(assert (=> b!1181712 (= lt!534498 (dynLambda!2991 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181712 (= lt!534504 (getCurrentListMapNoExtraKeys!5083 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181713 () Bool)

(assert (=> b!1181713 (= e!671830 (and e!671834 mapRes!46487))))

(declare-fun condMapEmpty!46487 () Bool)

(declare-fun mapDefault!46487 () ValueCell!14177)

(assert (=> b!1181713 (= condMapEmpty!46487 (= (arr!36790 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14177)) mapDefault!46487)))))

(declare-fun b!1181714 () Bool)

(declare-fun res!785307 () Bool)

(assert (=> b!1181714 (=> (not res!785307) (not e!671833))))

(assert (=> b!1181714 (= res!785307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99658 res!785310) b!1181707))

(assert (= (and b!1181707 res!785305) b!1181704))

(assert (= (and b!1181704 res!785309) b!1181714))

(assert (= (and b!1181714 res!785307) b!1181700))

(assert (= (and b!1181700 res!785312) b!1181709))

(assert (= (and b!1181709 res!785313) b!1181705))

(assert (= (and b!1181705 res!785315) b!1181701))

(assert (= (and b!1181701 res!785316) b!1181708))

(assert (= (and b!1181708 res!785317) b!1181696))

(assert (= (and b!1181696 res!785311) b!1181698))

(assert (= (and b!1181698 (not res!785304)) b!1181712))

(assert (= (and b!1181712 (not res!785308)) b!1181710))

(assert (= (and b!1181710 (not res!785303)) b!1181711))

(assert (= (and b!1181711 res!785314) b!1181697))

(assert (= (and b!1181697 (not res!785306)) b!1181695))

(assert (= (and b!1181711 c!116962) b!1181699))

(assert (= (and b!1181711 (not c!116962)) b!1181703))

(assert (= (and b!1181713 condMapEmpty!46487) mapIsEmpty!46487))

(assert (= (and b!1181713 (not condMapEmpty!46487)) mapNonEmpty!46487))

(get-info :version)

(assert (= (and mapNonEmpty!46487 ((_ is ValueCellFull!14177) mapValue!46487)) b!1181702))

(assert (= (and b!1181713 ((_ is ValueCellFull!14177) mapDefault!46487)) b!1181706))

(assert (= start!99658 b!1181713))

(declare-fun b_lambda!20369 () Bool)

(assert (=> (not b_lambda!20369) (not b!1181712)))

(declare-fun t!38185 () Bool)

(declare-fun tb!10047 () Bool)

(assert (=> (and start!99658 (= defaultEntry!1004 defaultEntry!1004) t!38185) tb!10047))

(declare-fun result!20669 () Bool)

(assert (=> tb!10047 (= result!20669 tp_is_empty!29773)))

(assert (=> b!1181712 t!38185))

(declare-fun b_and!41333 () Bool)

(assert (= b_and!41331 (and (=> t!38185 result!20669) b_and!41333)))

(declare-fun m!1089155 () Bool)

(assert (=> b!1181705 m!1089155))

(declare-fun m!1089157 () Bool)

(assert (=> b!1181697 m!1089157))

(declare-fun m!1089159 () Bool)

(assert (=> b!1181698 m!1089159))

(declare-fun m!1089161 () Bool)

(assert (=> b!1181698 m!1089161))

(declare-fun m!1089163 () Bool)

(assert (=> b!1181699 m!1089163))

(declare-fun m!1089165 () Bool)

(assert (=> b!1181699 m!1089165))

(declare-fun m!1089167 () Bool)

(assert (=> b!1181699 m!1089167))

(declare-fun m!1089169 () Bool)

(assert (=> b!1181699 m!1089169))

(declare-fun m!1089171 () Bool)

(assert (=> b!1181699 m!1089171))

(declare-fun m!1089173 () Bool)

(assert (=> b!1181695 m!1089173))

(declare-fun m!1089175 () Bool)

(assert (=> mapNonEmpty!46487 m!1089175))

(declare-fun m!1089177 () Bool)

(assert (=> start!99658 m!1089177))

(declare-fun m!1089179 () Bool)

(assert (=> start!99658 m!1089179))

(declare-fun m!1089181 () Bool)

(assert (=> b!1181714 m!1089181))

(declare-fun m!1089183 () Bool)

(assert (=> b!1181701 m!1089183))

(declare-fun m!1089185 () Bool)

(assert (=> b!1181710 m!1089185))

(declare-fun m!1089187 () Bool)

(assert (=> b!1181710 m!1089187))

(declare-fun m!1089189 () Bool)

(assert (=> b!1181710 m!1089189))

(assert (=> b!1181710 m!1089157))

(declare-fun m!1089191 () Bool)

(assert (=> b!1181710 m!1089191))

(assert (=> b!1181710 m!1089157))

(declare-fun m!1089193 () Bool)

(assert (=> b!1181710 m!1089193))

(declare-fun m!1089195 () Bool)

(assert (=> b!1181707 m!1089195))

(declare-fun m!1089197 () Bool)

(assert (=> b!1181708 m!1089197))

(declare-fun m!1089199 () Bool)

(assert (=> b!1181708 m!1089199))

(declare-fun m!1089201 () Bool)

(assert (=> b!1181700 m!1089201))

(declare-fun m!1089203 () Bool)

(assert (=> b!1181712 m!1089203))

(declare-fun m!1089205 () Bool)

(assert (=> b!1181712 m!1089205))

(declare-fun m!1089207 () Bool)

(assert (=> b!1181712 m!1089207))

(declare-fun m!1089209 () Bool)

(assert (=> b!1181712 m!1089209))

(declare-fun m!1089211 () Bool)

(assert (=> b!1181696 m!1089211))

(assert (=> b!1181711 m!1089157))

(declare-fun m!1089213 () Bool)

(assert (=> b!1181711 m!1089213))

(declare-fun m!1089215 () Bool)

(assert (=> b!1181711 m!1089215))

(assert (=> b!1181711 m!1089157))

(declare-fun m!1089217 () Bool)

(assert (=> b!1181711 m!1089217))

(assert (=> b!1181711 m!1089217))

(declare-fun m!1089219 () Bool)

(assert (=> b!1181711 m!1089219))

(declare-fun m!1089221 () Bool)

(assert (=> b!1181711 m!1089221))

(declare-fun m!1089223 () Bool)

(assert (=> b!1181711 m!1089223))

(check-sat (not b!1181710) (not b!1181698) (not b!1181714) (not b_lambda!20369) (not b!1181699) (not b!1181700) b_and!41333 (not b!1181707) (not b!1181696) tp_is_empty!29773 (not b_next!25243) (not mapNonEmpty!46487) (not b!1181695) (not b!1181708) (not b!1181711) (not start!99658) (not b!1181712) (not b!1181705))
(check-sat b_and!41333 (not b_next!25243))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99966 () Bool)

(assert start!99966)

(declare-fun b_free!25309 () Bool)

(declare-fun b_next!25309 () Bool)

(assert (=> start!99966 (= b_free!25309 (not b_next!25309))))

(declare-fun tp!88640 () Bool)

(declare-fun b_and!41487 () Bool)

(assert (=> start!99966 (= tp!88640 b_and!41487)))

(declare-fun b!1185154 () Bool)

(declare-fun e!673930 () Bool)

(declare-fun e!673932 () Bool)

(assert (=> b!1185154 (= e!673930 e!673932)))

(declare-fun res!787373 () Bool)

(assert (=> b!1185154 (=> (not res!787373) (not e!673932))))

(declare-datatypes ((array!76523 0))(
  ( (array!76524 (arr!36905 (Array (_ BitVec 32) (_ BitVec 64))) (size!37442 (_ BitVec 32))) )
))
(declare-fun lt!537055 () array!76523)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76523 (_ BitVec 32)) Bool)

(assert (=> b!1185154 (= res!787373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537055 mask!1564))))

(declare-fun _keys!1208 () array!76523)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185154 (= lt!537055 (array!76524 (store (arr!36905 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37442 _keys!1208)))))

(declare-fun mapIsEmpty!46586 () Bool)

(declare-fun mapRes!46586 () Bool)

(assert (=> mapIsEmpty!46586 mapRes!46586))

(declare-fun b!1185155 () Bool)

(declare-fun e!673928 () Bool)

(assert (=> b!1185155 (= e!673928 true)))

(declare-datatypes ((V!44913 0))(
  ( (V!44914 (val!14976 Int)) )
))
(declare-datatypes ((tuple2!19244 0))(
  ( (tuple2!19245 (_1!9633 (_ BitVec 64)) (_2!9633 V!44913)) )
))
(declare-datatypes ((List!25976 0))(
  ( (Nil!25973) (Cons!25972 (h!27190 tuple2!19244) (t!38269 List!25976)) )
))
(declare-datatypes ((ListLongMap!17221 0))(
  ( (ListLongMap!17222 (toList!8626 List!25976)) )
))
(declare-fun lt!537044 () ListLongMap!17221)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!537056 () ListLongMap!17221)

(declare-fun -!1647 (ListLongMap!17221 (_ BitVec 64)) ListLongMap!17221)

(assert (=> b!1185155 (= (-!1647 lt!537044 k0!934) lt!537056)))

(declare-fun lt!537060 () V!44913)

(declare-fun lt!537059 () ListLongMap!17221)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!39188 0))(
  ( (Unit!39189) )
))
(declare-fun lt!537045 () Unit!39188)

(declare-fun addRemoveCommutativeForDiffKeys!161 (ListLongMap!17221 (_ BitVec 64) V!44913 (_ BitVec 64)) Unit!39188)

(assert (=> b!1185155 (= lt!537045 (addRemoveCommutativeForDiffKeys!161 lt!537059 (select (arr!36905 _keys!1208) from!1455) lt!537060 k0!934))))

(declare-fun lt!537046 () ListLongMap!17221)

(declare-fun lt!537058 () ListLongMap!17221)

(declare-fun lt!537052 () ListLongMap!17221)

(assert (=> b!1185155 (and (= lt!537052 lt!537044) (= lt!537046 lt!537058))))

(declare-fun lt!537053 () tuple2!19244)

(declare-fun +!3945 (ListLongMap!17221 tuple2!19244) ListLongMap!17221)

(assert (=> b!1185155 (= lt!537044 (+!3945 lt!537059 lt!537053))))

(assert (=> b!1185155 (not (= (select (arr!36905 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537061 () Unit!39188)

(declare-fun e!673924 () Unit!39188)

(assert (=> b!1185155 (= lt!537061 e!673924)))

(declare-fun c!117485 () Bool)

(assert (=> b!1185155 (= c!117485 (= (select (arr!36905 _keys!1208) from!1455) k0!934))))

(declare-fun e!673925 () Bool)

(assert (=> b!1185155 e!673925))

(declare-fun res!787366 () Bool)

(assert (=> b!1185155 (=> (not res!787366) (not e!673925))))

(declare-fun lt!537049 () ListLongMap!17221)

(assert (=> b!1185155 (= res!787366 (= lt!537049 lt!537056))))

(assert (=> b!1185155 (= lt!537056 (+!3945 lt!537046 lt!537053))))

(assert (=> b!1185155 (= lt!537053 (tuple2!19245 (select (arr!36905 _keys!1208) from!1455) lt!537060))))

(declare-fun lt!537050 () V!44913)

(declare-datatypes ((ValueCell!14210 0))(
  ( (ValueCellFull!14210 (v!17610 V!44913)) (EmptyCell!14210) )
))
(declare-datatypes ((array!76525 0))(
  ( (array!76526 (arr!36906 (Array (_ BitVec 32) ValueCell!14210)) (size!37443 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76525)

(declare-fun get!18926 (ValueCell!14210 V!44913) V!44913)

(assert (=> b!1185155 (= lt!537060 (get!18926 (select (arr!36906 _values!996) from!1455) lt!537050))))

(declare-fun b!1185156 () Bool)

(declare-fun res!787376 () Bool)

(assert (=> b!1185156 (=> (not res!787376) (not e!673930))))

(assert (=> b!1185156 (= res!787376 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37442 _keys!1208))))))

(declare-fun b!1185157 () Bool)

(declare-fun e!673926 () Bool)

(assert (=> b!1185157 (= e!673926 e!673928)))

(declare-fun res!787369 () Bool)

(assert (=> b!1185157 (=> res!787369 e!673928)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185157 (= res!787369 (not (validKeyInArray!0 (select (arr!36905 _keys!1208) from!1455))))))

(assert (=> b!1185157 (= lt!537058 lt!537046)))

(assert (=> b!1185157 (= lt!537046 (-!1647 lt!537059 k0!934))))

(declare-fun zeroValue!944 () V!44913)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537047 () array!76525)

(declare-fun minValue!944 () V!44913)

(declare-fun getCurrentListMapNoExtraKeys!5097 (array!76523 array!76525 (_ BitVec 32) (_ BitVec 32) V!44913 V!44913 (_ BitVec 32) Int) ListLongMap!17221)

(assert (=> b!1185157 (= lt!537058 (getCurrentListMapNoExtraKeys!5097 lt!537055 lt!537047 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185157 (= lt!537059 (getCurrentListMapNoExtraKeys!5097 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537057 () Unit!39188)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!868 (array!76523 array!76525 (_ BitVec 32) (_ BitVec 32) V!44913 V!44913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39188)

(assert (=> b!1185157 (= lt!537057 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!868 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185158 () Bool)

(declare-fun Unit!39190 () Unit!39188)

(assert (=> b!1185158 (= e!673924 Unit!39190)))

(declare-fun b!1185160 () Bool)

(declare-fun res!787364 () Bool)

(assert (=> b!1185160 (=> (not res!787364) (not e!673930))))

(assert (=> b!1185160 (= res!787364 (validKeyInArray!0 k0!934))))

(declare-fun b!1185161 () Bool)

(declare-fun e!673923 () Bool)

(assert (=> b!1185161 (= e!673923 e!673926)))

(declare-fun res!787371 () Bool)

(assert (=> b!1185161 (=> res!787371 e!673926)))

(assert (=> b!1185161 (= res!787371 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185161 (= lt!537049 (getCurrentListMapNoExtraKeys!5097 lt!537055 lt!537047 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185161 (= lt!537047 (array!76526 (store (arr!36906 _values!996) i!673 (ValueCellFull!14210 lt!537050)) (size!37443 _values!996)))))

(declare-fun dynLambda!3060 (Int (_ BitVec 64)) V!44913)

(assert (=> b!1185161 (= lt!537050 (dynLambda!3060 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185161 (= lt!537052 (getCurrentListMapNoExtraKeys!5097 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185162 () Bool)

(declare-fun e!673933 () Bool)

(assert (=> b!1185162 (= e!673925 e!673933)))

(declare-fun res!787374 () Bool)

(assert (=> b!1185162 (=> res!787374 e!673933)))

(assert (=> b!1185162 (= res!787374 (not (= (select (arr!36905 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185163 () Bool)

(declare-fun res!787365 () Bool)

(assert (=> b!1185163 (=> (not res!787365) (not e!673930))))

(declare-datatypes ((List!25977 0))(
  ( (Nil!25974) (Cons!25973 (h!27191 (_ BitVec 64)) (t!38270 List!25977)) )
))
(declare-fun arrayNoDuplicates!0 (array!76523 (_ BitVec 32) List!25977) Bool)

(assert (=> b!1185163 (= res!787365 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25974))))

(declare-fun b!1185164 () Bool)

(declare-fun e!673934 () Bool)

(declare-fun e!673931 () Bool)

(assert (=> b!1185164 (= e!673934 (and e!673931 mapRes!46586))))

(declare-fun condMapEmpty!46586 () Bool)

(declare-fun mapDefault!46586 () ValueCell!14210)

(assert (=> b!1185164 (= condMapEmpty!46586 (= (arr!36906 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14210)) mapDefault!46586)))))

(declare-fun b!1185165 () Bool)

(assert (=> b!1185165 (= e!673932 (not e!673923))))

(declare-fun res!787367 () Bool)

(assert (=> b!1185165 (=> res!787367 e!673923)))

(assert (=> b!1185165 (= res!787367 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185165 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537054 () Unit!39188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76523 (_ BitVec 64) (_ BitVec 32)) Unit!39188)

(assert (=> b!1185165 (= lt!537054 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185166 () Bool)

(declare-fun Unit!39191 () Unit!39188)

(assert (=> b!1185166 (= e!673924 Unit!39191)))

(declare-fun lt!537043 () Unit!39188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76523 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39188)

(assert (=> b!1185166 (= lt!537043 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185166 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537048 () Unit!39188)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76523 (_ BitVec 32) (_ BitVec 32)) Unit!39188)

(assert (=> b!1185166 (= lt!537048 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185166 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25974)))

(declare-fun lt!537051 () Unit!39188)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76523 (_ BitVec 64) (_ BitVec 32) List!25977) Unit!39188)

(assert (=> b!1185166 (= lt!537051 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25974))))

(assert (=> b!1185166 false))

(declare-fun b!1185167 () Bool)

(declare-fun res!787375 () Bool)

(assert (=> b!1185167 (=> (not res!787375) (not e!673932))))

(assert (=> b!1185167 (= res!787375 (arrayNoDuplicates!0 lt!537055 #b00000000000000000000000000000000 Nil!25974))))

(declare-fun b!1185168 () Bool)

(declare-fun tp_is_empty!29839 () Bool)

(assert (=> b!1185168 (= e!673931 tp_is_empty!29839)))

(declare-fun mapNonEmpty!46586 () Bool)

(declare-fun tp!88641 () Bool)

(declare-fun e!673929 () Bool)

(assert (=> mapNonEmpty!46586 (= mapRes!46586 (and tp!88641 e!673929))))

(declare-fun mapValue!46586 () ValueCell!14210)

(declare-fun mapKey!46586 () (_ BitVec 32))

(declare-fun mapRest!46586 () (Array (_ BitVec 32) ValueCell!14210))

(assert (=> mapNonEmpty!46586 (= (arr!36906 _values!996) (store mapRest!46586 mapKey!46586 mapValue!46586))))

(declare-fun b!1185169 () Bool)

(declare-fun res!787368 () Bool)

(assert (=> b!1185169 (=> (not res!787368) (not e!673930))))

(assert (=> b!1185169 (= res!787368 (and (= (size!37443 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37442 _keys!1208) (size!37443 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185159 () Bool)

(declare-fun res!787370 () Bool)

(assert (=> b!1185159 (=> (not res!787370) (not e!673930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185159 (= res!787370 (validMask!0 mask!1564))))

(declare-fun res!787362 () Bool)

(assert (=> start!99966 (=> (not res!787362) (not e!673930))))

(assert (=> start!99966 (= res!787362 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37442 _keys!1208))))))

(assert (=> start!99966 e!673930))

(assert (=> start!99966 tp_is_empty!29839))

(declare-fun array_inv!28242 (array!76523) Bool)

(assert (=> start!99966 (array_inv!28242 _keys!1208)))

(assert (=> start!99966 true))

(assert (=> start!99966 tp!88640))

(declare-fun array_inv!28243 (array!76525) Bool)

(assert (=> start!99966 (and (array_inv!28243 _values!996) e!673934)))

(declare-fun b!1185170 () Bool)

(declare-fun res!787372 () Bool)

(assert (=> b!1185170 (=> (not res!787372) (not e!673930))))

(assert (=> b!1185170 (= res!787372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185171 () Bool)

(assert (=> b!1185171 (= e!673933 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185172 () Bool)

(declare-fun res!787363 () Bool)

(assert (=> b!1185172 (=> (not res!787363) (not e!673930))))

(assert (=> b!1185172 (= res!787363 (= (select (arr!36905 _keys!1208) i!673) k0!934))))

(declare-fun b!1185173 () Bool)

(assert (=> b!1185173 (= e!673929 tp_is_empty!29839)))

(assert (= (and start!99966 res!787362) b!1185159))

(assert (= (and b!1185159 res!787370) b!1185169))

(assert (= (and b!1185169 res!787368) b!1185170))

(assert (= (and b!1185170 res!787372) b!1185163))

(assert (= (and b!1185163 res!787365) b!1185156))

(assert (= (and b!1185156 res!787376) b!1185160))

(assert (= (and b!1185160 res!787364) b!1185172))

(assert (= (and b!1185172 res!787363) b!1185154))

(assert (= (and b!1185154 res!787373) b!1185167))

(assert (= (and b!1185167 res!787375) b!1185165))

(assert (= (and b!1185165 (not res!787367)) b!1185161))

(assert (= (and b!1185161 (not res!787371)) b!1185157))

(assert (= (and b!1185157 (not res!787369)) b!1185155))

(assert (= (and b!1185155 res!787366) b!1185162))

(assert (= (and b!1185162 (not res!787374)) b!1185171))

(assert (= (and b!1185155 c!117485) b!1185166))

(assert (= (and b!1185155 (not c!117485)) b!1185158))

(assert (= (and b!1185164 condMapEmpty!46586) mapIsEmpty!46586))

(assert (= (and b!1185164 (not condMapEmpty!46586)) mapNonEmpty!46586))

(get-info :version)

(assert (= (and mapNonEmpty!46586 ((_ is ValueCellFull!14210) mapValue!46586)) b!1185173))

(assert (= (and b!1185164 ((_ is ValueCellFull!14210) mapDefault!46586)) b!1185168))

(assert (= start!99966 b!1185164))

(declare-fun b_lambda!20447 () Bool)

(assert (=> (not b_lambda!20447) (not b!1185161)))

(declare-fun t!38268 () Bool)

(declare-fun tb!10113 () Bool)

(assert (=> (and start!99966 (= defaultEntry!1004 defaultEntry!1004) t!38268) tb!10113))

(declare-fun result!20801 () Bool)

(assert (=> tb!10113 (= result!20801 tp_is_empty!29839)))

(assert (=> b!1185161 t!38268))

(declare-fun b_and!41489 () Bool)

(assert (= b_and!41487 (and (=> t!38268 result!20801) b_and!41489)))

(declare-fun m!1093647 () Bool)

(assert (=> b!1185159 m!1093647))

(declare-fun m!1093649 () Bool)

(assert (=> b!1185157 m!1093649))

(declare-fun m!1093651 () Bool)

(assert (=> b!1185157 m!1093651))

(declare-fun m!1093653 () Bool)

(assert (=> b!1185157 m!1093653))

(declare-fun m!1093655 () Bool)

(assert (=> b!1185157 m!1093655))

(declare-fun m!1093657 () Bool)

(assert (=> b!1185157 m!1093657))

(declare-fun m!1093659 () Bool)

(assert (=> b!1185157 m!1093659))

(assert (=> b!1185157 m!1093657))

(declare-fun m!1093661 () Bool)

(assert (=> b!1185155 m!1093661))

(declare-fun m!1093663 () Bool)

(assert (=> b!1185155 m!1093663))

(assert (=> b!1185155 m!1093657))

(declare-fun m!1093665 () Bool)

(assert (=> b!1185155 m!1093665))

(declare-fun m!1093667 () Bool)

(assert (=> b!1185155 m!1093667))

(declare-fun m!1093669 () Bool)

(assert (=> b!1185155 m!1093669))

(assert (=> b!1185155 m!1093661))

(declare-fun m!1093671 () Bool)

(assert (=> b!1185155 m!1093671))

(assert (=> b!1185155 m!1093657))

(declare-fun m!1093673 () Bool)

(assert (=> b!1185161 m!1093673))

(declare-fun m!1093675 () Bool)

(assert (=> b!1185161 m!1093675))

(declare-fun m!1093677 () Bool)

(assert (=> b!1185161 m!1093677))

(declare-fun m!1093679 () Bool)

(assert (=> b!1185161 m!1093679))

(declare-fun m!1093681 () Bool)

(assert (=> b!1185172 m!1093681))

(declare-fun m!1093683 () Bool)

(assert (=> b!1185154 m!1093683))

(declare-fun m!1093685 () Bool)

(assert (=> b!1185154 m!1093685))

(declare-fun m!1093687 () Bool)

(assert (=> b!1185160 m!1093687))

(declare-fun m!1093689 () Bool)

(assert (=> b!1185167 m!1093689))

(declare-fun m!1093691 () Bool)

(assert (=> b!1185166 m!1093691))

(declare-fun m!1093693 () Bool)

(assert (=> b!1185166 m!1093693))

(declare-fun m!1093695 () Bool)

(assert (=> b!1185166 m!1093695))

(declare-fun m!1093697 () Bool)

(assert (=> b!1185166 m!1093697))

(declare-fun m!1093699 () Bool)

(assert (=> b!1185166 m!1093699))

(declare-fun m!1093701 () Bool)

(assert (=> start!99966 m!1093701))

(declare-fun m!1093703 () Bool)

(assert (=> start!99966 m!1093703))

(declare-fun m!1093705 () Bool)

(assert (=> b!1185170 m!1093705))

(declare-fun m!1093707 () Bool)

(assert (=> b!1185163 m!1093707))

(declare-fun m!1093709 () Bool)

(assert (=> mapNonEmpty!46586 m!1093709))

(declare-fun m!1093711 () Bool)

(assert (=> b!1185165 m!1093711))

(declare-fun m!1093713 () Bool)

(assert (=> b!1185165 m!1093713))

(assert (=> b!1185162 m!1093657))

(declare-fun m!1093715 () Bool)

(assert (=> b!1185171 m!1093715))

(check-sat (not b!1185171) (not b!1185155) (not b_next!25309) b_and!41489 (not b!1185166) (not b!1185163) (not b!1185165) (not b!1185154) (not mapNonEmpty!46586) (not b!1185160) (not b_lambda!20447) tp_is_empty!29839 (not b!1185161) (not b!1185167) (not b!1185157) (not b!1185159) (not b!1185170) (not start!99966))
(check-sat b_and!41489 (not b_next!25309))

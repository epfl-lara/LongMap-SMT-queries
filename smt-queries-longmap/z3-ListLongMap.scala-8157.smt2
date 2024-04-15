; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99802 () Bool)

(assert start!99802)

(declare-fun b_free!25387 () Bool)

(declare-fun b_next!25387 () Bool)

(assert (=> start!99802 (= b_free!25387 (not b_next!25387))))

(declare-fun tp!88874 () Bool)

(declare-fun b_and!41619 () Bool)

(assert (=> start!99802 (= tp!88874 b_and!41619)))

(declare-fun b!1186159 () Bool)

(declare-fun res!788547 () Bool)

(declare-fun e!674424 () Bool)

(assert (=> b!1186159 (=> (not res!788547) (not e!674424))))

(declare-datatypes ((array!76568 0))(
  ( (array!76569 (arr!36934 (Array (_ BitVec 32) (_ BitVec 64))) (size!37472 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76568)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76568 (_ BitVec 32)) Bool)

(assert (=> b!1186159 (= res!788547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186160 () Bool)

(declare-fun e!674419 () Bool)

(declare-fun e!674428 () Bool)

(assert (=> b!1186160 (= e!674419 e!674428)))

(declare-fun res!788549 () Bool)

(assert (=> b!1186160 (=> res!788549 e!674428)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186160 (= res!788549 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45017 0))(
  ( (V!45018 (val!15015 Int)) )
))
(declare-fun zeroValue!944 () V!45017)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14249 0))(
  ( (ValueCellFull!14249 (v!17652 V!45017)) (EmptyCell!14249) )
))
(declare-datatypes ((array!76570 0))(
  ( (array!76571 (arr!36935 (Array (_ BitVec 32) ValueCell!14249)) (size!37473 (_ BitVec 32))) )
))
(declare-fun lt!538607 () array!76570)

(declare-datatypes ((tuple2!19378 0))(
  ( (tuple2!19379 (_1!9700 (_ BitVec 64)) (_2!9700 V!45017)) )
))
(declare-datatypes ((List!26092 0))(
  ( (Nil!26089) (Cons!26088 (h!27297 tuple2!19378) (t!38462 List!26092)) )
))
(declare-datatypes ((ListLongMap!17347 0))(
  ( (ListLongMap!17348 (toList!8689 List!26092)) )
))
(declare-fun lt!538604 () ListLongMap!17347)

(declare-fun lt!538596 () array!76568)

(declare-fun minValue!944 () V!45017)

(declare-fun getCurrentListMapNoExtraKeys!5141 (array!76568 array!76570 (_ BitVec 32) (_ BitVec 32) V!45017 V!45017 (_ BitVec 32) Int) ListLongMap!17347)

(assert (=> b!1186160 (= lt!538604 (getCurrentListMapNoExtraKeys!5141 lt!538596 lt!538607 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76570)

(declare-fun lt!538606 () V!45017)

(assert (=> b!1186160 (= lt!538607 (array!76571 (store (arr!36935 _values!996) i!673 (ValueCellFull!14249 lt!538606)) (size!37473 _values!996)))))

(declare-fun dynLambda!3042 (Int (_ BitVec 64)) V!45017)

(assert (=> b!1186160 (= lt!538606 (dynLambda!3042 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538603 () ListLongMap!17347)

(assert (=> b!1186160 (= lt!538603 (getCurrentListMapNoExtraKeys!5141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186161 () Bool)

(declare-datatypes ((Unit!39188 0))(
  ( (Unit!39189) )
))
(declare-fun e!674421 () Unit!39188)

(declare-fun Unit!39190 () Unit!39188)

(assert (=> b!1186161 (= e!674421 Unit!39190)))

(declare-fun b!1186162 () Bool)

(declare-fun e!674423 () Bool)

(declare-fun tp_is_empty!29917 () Bool)

(assert (=> b!1186162 (= e!674423 tp_is_empty!29917)))

(declare-fun res!788555 () Bool)

(assert (=> start!99802 (=> (not res!788555) (not e!674424))))

(assert (=> start!99802 (= res!788555 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37472 _keys!1208))))))

(assert (=> start!99802 e!674424))

(assert (=> start!99802 tp_is_empty!29917))

(declare-fun array_inv!28298 (array!76568) Bool)

(assert (=> start!99802 (array_inv!28298 _keys!1208)))

(assert (=> start!99802 true))

(assert (=> start!99802 tp!88874))

(declare-fun e!674417 () Bool)

(declare-fun array_inv!28299 (array!76570) Bool)

(assert (=> start!99802 (and (array_inv!28299 _values!996) e!674417)))

(declare-fun b!1186163 () Bool)

(declare-fun e!674418 () Bool)

(declare-fun e!674425 () Bool)

(assert (=> b!1186163 (= e!674418 e!674425)))

(declare-fun res!788544 () Bool)

(assert (=> b!1186163 (=> res!788544 e!674425)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1186163 (= res!788544 (not (= (select (arr!36934 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186164 () Bool)

(declare-fun e!674427 () Bool)

(assert (=> b!1186164 (= e!674427 (not e!674419))))

(declare-fun res!788553 () Bool)

(assert (=> b!1186164 (=> res!788553 e!674419)))

(assert (=> b!1186164 (= res!788553 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186164 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538597 () Unit!39188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76568 (_ BitVec 64) (_ BitVec 32)) Unit!39188)

(assert (=> b!1186164 (= lt!538597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186165 () Bool)

(declare-fun res!788545 () Bool)

(assert (=> b!1186165 (=> (not res!788545) (not e!674424))))

(assert (=> b!1186165 (= res!788545 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37472 _keys!1208))))))

(declare-fun b!1186166 () Bool)

(declare-fun res!788548 () Bool)

(assert (=> b!1186166 (=> (not res!788548) (not e!674424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186166 (= res!788548 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46703 () Bool)

(declare-fun mapRes!46703 () Bool)

(assert (=> mapIsEmpty!46703 mapRes!46703))

(declare-fun b!1186167 () Bool)

(declare-fun res!788552 () Bool)

(assert (=> b!1186167 (=> (not res!788552) (not e!674427))))

(declare-datatypes ((List!26093 0))(
  ( (Nil!26090) (Cons!26089 (h!27298 (_ BitVec 64)) (t!38463 List!26093)) )
))
(declare-fun arrayNoDuplicates!0 (array!76568 (_ BitVec 32) List!26093) Bool)

(assert (=> b!1186167 (= res!788552 (arrayNoDuplicates!0 lt!538596 #b00000000000000000000000000000000 Nil!26090))))

(declare-fun b!1186168 () Bool)

(declare-fun e!674422 () Bool)

(assert (=> b!1186168 (= e!674422 tp_is_empty!29917)))

(declare-fun b!1186169 () Bool)

(declare-fun Unit!39191 () Unit!39188)

(assert (=> b!1186169 (= e!674421 Unit!39191)))

(declare-fun lt!538602 () Unit!39188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39188)

(assert (=> b!1186169 (= lt!538602 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186169 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538601 () Unit!39188)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76568 (_ BitVec 32) (_ BitVec 32)) Unit!39188)

(assert (=> b!1186169 (= lt!538601 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186169 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26090)))

(declare-fun lt!538592 () Unit!39188)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76568 (_ BitVec 64) (_ BitVec 32) List!26093) Unit!39188)

(assert (=> b!1186169 (= lt!538592 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26090))))

(assert (=> b!1186169 false))

(declare-fun b!1186170 () Bool)

(declare-fun res!788546 () Bool)

(assert (=> b!1186170 (=> (not res!788546) (not e!674424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186170 (= res!788546 (validMask!0 mask!1564))))

(declare-fun b!1186171 () Bool)

(declare-fun res!788550 () Bool)

(assert (=> b!1186171 (=> (not res!788550) (not e!674424))))

(assert (=> b!1186171 (= res!788550 (and (= (size!37473 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37472 _keys!1208) (size!37473 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186172 () Bool)

(declare-fun e!674420 () Bool)

(assert (=> b!1186172 (= e!674420 true)))

(declare-fun lt!538605 () ListLongMap!17347)

(declare-fun lt!538593 () ListLongMap!17347)

(declare-fun -!1641 (ListLongMap!17347 (_ BitVec 64)) ListLongMap!17347)

(assert (=> b!1186172 (= (-!1641 lt!538605 k0!934) lt!538593)))

(declare-fun lt!538590 () ListLongMap!17347)

(declare-fun lt!538600 () V!45017)

(declare-fun lt!538608 () Unit!39188)

(declare-fun addRemoveCommutativeForDiffKeys!184 (ListLongMap!17347 (_ BitVec 64) V!45017 (_ BitVec 64)) Unit!39188)

(assert (=> b!1186172 (= lt!538608 (addRemoveCommutativeForDiffKeys!184 lt!538590 (select (arr!36934 _keys!1208) from!1455) lt!538600 k0!934))))

(declare-fun lt!538594 () ListLongMap!17347)

(declare-fun lt!538591 () ListLongMap!17347)

(assert (=> b!1186172 (and (= lt!538603 lt!538605) (= lt!538594 lt!538591))))

(declare-fun lt!538599 () tuple2!19378)

(declare-fun +!3970 (ListLongMap!17347 tuple2!19378) ListLongMap!17347)

(assert (=> b!1186172 (= lt!538605 (+!3970 lt!538590 lt!538599))))

(assert (=> b!1186172 (not (= (select (arr!36934 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538595 () Unit!39188)

(assert (=> b!1186172 (= lt!538595 e!674421)))

(declare-fun c!117178 () Bool)

(assert (=> b!1186172 (= c!117178 (= (select (arr!36934 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186172 e!674418))

(declare-fun res!788543 () Bool)

(assert (=> b!1186172 (=> (not res!788543) (not e!674418))))

(assert (=> b!1186172 (= res!788543 (= lt!538604 lt!538593))))

(assert (=> b!1186172 (= lt!538593 (+!3970 lt!538594 lt!538599))))

(assert (=> b!1186172 (= lt!538599 (tuple2!19379 (select (arr!36934 _keys!1208) from!1455) lt!538600))))

(declare-fun get!18921 (ValueCell!14249 V!45017) V!45017)

(assert (=> b!1186172 (= lt!538600 (get!18921 (select (arr!36935 _values!996) from!1455) lt!538606))))

(declare-fun b!1186173 () Bool)

(assert (=> b!1186173 (= e!674428 e!674420)))

(declare-fun res!788551 () Bool)

(assert (=> b!1186173 (=> res!788551 e!674420)))

(assert (=> b!1186173 (= res!788551 (not (validKeyInArray!0 (select (arr!36934 _keys!1208) from!1455))))))

(assert (=> b!1186173 (= lt!538591 lt!538594)))

(assert (=> b!1186173 (= lt!538594 (-!1641 lt!538590 k0!934))))

(assert (=> b!1186173 (= lt!538591 (getCurrentListMapNoExtraKeys!5141 lt!538596 lt!538607 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186173 (= lt!538590 (getCurrentListMapNoExtraKeys!5141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538598 () Unit!39188)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!897 (array!76568 array!76570 (_ BitVec 32) (_ BitVec 32) V!45017 V!45017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39188)

(assert (=> b!1186173 (= lt!538598 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!897 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46703 () Bool)

(declare-fun tp!88875 () Bool)

(assert (=> mapNonEmpty!46703 (= mapRes!46703 (and tp!88875 e!674423))))

(declare-fun mapValue!46703 () ValueCell!14249)

(declare-fun mapKey!46703 () (_ BitVec 32))

(declare-fun mapRest!46703 () (Array (_ BitVec 32) ValueCell!14249))

(assert (=> mapNonEmpty!46703 (= (arr!36935 _values!996) (store mapRest!46703 mapKey!46703 mapValue!46703))))

(declare-fun b!1186174 () Bool)

(declare-fun res!788554 () Bool)

(assert (=> b!1186174 (=> (not res!788554) (not e!674424))))

(assert (=> b!1186174 (= res!788554 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26090))))

(declare-fun b!1186175 () Bool)

(assert (=> b!1186175 (= e!674424 e!674427)))

(declare-fun res!788557 () Bool)

(assert (=> b!1186175 (=> (not res!788557) (not e!674427))))

(assert (=> b!1186175 (= res!788557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538596 mask!1564))))

(assert (=> b!1186175 (= lt!538596 (array!76569 (store (arr!36934 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37472 _keys!1208)))))

(declare-fun b!1186176 () Bool)

(assert (=> b!1186176 (= e!674425 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186177 () Bool)

(declare-fun res!788556 () Bool)

(assert (=> b!1186177 (=> (not res!788556) (not e!674424))))

(assert (=> b!1186177 (= res!788556 (= (select (arr!36934 _keys!1208) i!673) k0!934))))

(declare-fun b!1186178 () Bool)

(assert (=> b!1186178 (= e!674417 (and e!674422 mapRes!46703))))

(declare-fun condMapEmpty!46703 () Bool)

(declare-fun mapDefault!46703 () ValueCell!14249)

(assert (=> b!1186178 (= condMapEmpty!46703 (= (arr!36935 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14249)) mapDefault!46703)))))

(assert (= (and start!99802 res!788555) b!1186170))

(assert (= (and b!1186170 res!788546) b!1186171))

(assert (= (and b!1186171 res!788550) b!1186159))

(assert (= (and b!1186159 res!788547) b!1186174))

(assert (= (and b!1186174 res!788554) b!1186165))

(assert (= (and b!1186165 res!788545) b!1186166))

(assert (= (and b!1186166 res!788548) b!1186177))

(assert (= (and b!1186177 res!788556) b!1186175))

(assert (= (and b!1186175 res!788557) b!1186167))

(assert (= (and b!1186167 res!788552) b!1186164))

(assert (= (and b!1186164 (not res!788553)) b!1186160))

(assert (= (and b!1186160 (not res!788549)) b!1186173))

(assert (= (and b!1186173 (not res!788551)) b!1186172))

(assert (= (and b!1186172 res!788543) b!1186163))

(assert (= (and b!1186163 (not res!788544)) b!1186176))

(assert (= (and b!1186172 c!117178) b!1186169))

(assert (= (and b!1186172 (not c!117178)) b!1186161))

(assert (= (and b!1186178 condMapEmpty!46703) mapIsEmpty!46703))

(assert (= (and b!1186178 (not condMapEmpty!46703)) mapNonEmpty!46703))

(get-info :version)

(assert (= (and mapNonEmpty!46703 ((_ is ValueCellFull!14249) mapValue!46703)) b!1186162))

(assert (= (and b!1186178 ((_ is ValueCellFull!14249) mapDefault!46703)) b!1186168))

(assert (= start!99802 b!1186178))

(declare-fun b_lambda!20513 () Bool)

(assert (=> (not b_lambda!20513) (not b!1186160)))

(declare-fun t!38461 () Bool)

(declare-fun tb!10191 () Bool)

(assert (=> (and start!99802 (= defaultEntry!1004 defaultEntry!1004) t!38461) tb!10191))

(declare-fun result!20957 () Bool)

(assert (=> tb!10191 (= result!20957 tp_is_empty!29917)))

(assert (=> b!1186160 t!38461))

(declare-fun b_and!41621 () Bool)

(assert (= b_and!41619 (and (=> t!38461 result!20957) b_and!41621)))

(declare-fun m!1094195 () Bool)

(assert (=> b!1186159 m!1094195))

(declare-fun m!1094197 () Bool)

(assert (=> b!1186175 m!1094197))

(declare-fun m!1094199 () Bool)

(assert (=> b!1186175 m!1094199))

(declare-fun m!1094201 () Bool)

(assert (=> b!1186166 m!1094201))

(declare-fun m!1094203 () Bool)

(assert (=> b!1186170 m!1094203))

(declare-fun m!1094205 () Bool)

(assert (=> b!1186177 m!1094205))

(declare-fun m!1094207 () Bool)

(assert (=> b!1186172 m!1094207))

(declare-fun m!1094209 () Bool)

(assert (=> b!1186172 m!1094209))

(declare-fun m!1094211 () Bool)

(assert (=> b!1186172 m!1094211))

(assert (=> b!1186172 m!1094207))

(declare-fun m!1094213 () Bool)

(assert (=> b!1186172 m!1094213))

(declare-fun m!1094215 () Bool)

(assert (=> b!1186172 m!1094215))

(declare-fun m!1094217 () Bool)

(assert (=> b!1186172 m!1094217))

(declare-fun m!1094219 () Bool)

(assert (=> b!1186172 m!1094219))

(assert (=> b!1186172 m!1094215))

(declare-fun m!1094221 () Bool)

(assert (=> b!1186176 m!1094221))

(assert (=> b!1186163 m!1094215))

(declare-fun m!1094223 () Bool)

(assert (=> b!1186169 m!1094223))

(declare-fun m!1094225 () Bool)

(assert (=> b!1186169 m!1094225))

(declare-fun m!1094227 () Bool)

(assert (=> b!1186169 m!1094227))

(declare-fun m!1094229 () Bool)

(assert (=> b!1186169 m!1094229))

(declare-fun m!1094231 () Bool)

(assert (=> b!1186169 m!1094231))

(declare-fun m!1094233 () Bool)

(assert (=> b!1186174 m!1094233))

(declare-fun m!1094235 () Bool)

(assert (=> b!1186173 m!1094235))

(declare-fun m!1094237 () Bool)

(assert (=> b!1186173 m!1094237))

(declare-fun m!1094239 () Bool)

(assert (=> b!1186173 m!1094239))

(declare-fun m!1094241 () Bool)

(assert (=> b!1186173 m!1094241))

(assert (=> b!1186173 m!1094215))

(declare-fun m!1094243 () Bool)

(assert (=> b!1186173 m!1094243))

(assert (=> b!1186173 m!1094215))

(declare-fun m!1094245 () Bool)

(assert (=> mapNonEmpty!46703 m!1094245))

(declare-fun m!1094247 () Bool)

(assert (=> b!1186160 m!1094247))

(declare-fun m!1094249 () Bool)

(assert (=> b!1186160 m!1094249))

(declare-fun m!1094251 () Bool)

(assert (=> b!1186160 m!1094251))

(declare-fun m!1094253 () Bool)

(assert (=> b!1186160 m!1094253))

(declare-fun m!1094255 () Bool)

(assert (=> b!1186164 m!1094255))

(declare-fun m!1094257 () Bool)

(assert (=> b!1186164 m!1094257))

(declare-fun m!1094259 () Bool)

(assert (=> b!1186167 m!1094259))

(declare-fun m!1094261 () Bool)

(assert (=> start!99802 m!1094261))

(declare-fun m!1094263 () Bool)

(assert (=> start!99802 m!1094263))

(check-sat (not b!1186159) (not b!1186174) (not b!1186175) (not b_lambda!20513) (not b!1186160) (not b!1186164) (not start!99802) tp_is_empty!29917 (not b!1186172) (not b!1186166) (not mapNonEmpty!46703) (not b!1186176) (not b_next!25387) (not b!1186167) (not b!1186169) (not b!1186173) b_and!41621 (not b!1186170))
(check-sat b_and!41621 (not b_next!25387))

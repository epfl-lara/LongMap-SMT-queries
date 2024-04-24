; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99654 () Bool)

(assert start!99654)

(declare-fun b_free!24997 () Bool)

(declare-fun b_next!24997 () Bool)

(assert (=> start!99654 (= b_free!24997 (not b_next!24997))))

(declare-fun tp!87704 () Bool)

(declare-fun b_and!40863 () Bool)

(assert (=> start!99654 (= tp!87704 b_and!40863)))

(declare-fun b!1175140 () Bool)

(declare-fun res!780007 () Bool)

(declare-fun e!668055 () Bool)

(assert (=> b!1175140 (=> (not res!780007) (not e!668055))))

(declare-datatypes ((array!75919 0))(
  ( (array!75920 (arr!36603 (Array (_ BitVec 32) (_ BitVec 64))) (size!37140 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75919)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1175140 (= res!780007 (= (select (arr!36603 _keys!1208) i!673) k0!934))))

(declare-fun b!1175141 () Bool)

(declare-fun e!668062 () Bool)

(declare-fun e!668059 () Bool)

(assert (=> b!1175141 (= e!668062 e!668059)))

(declare-fun res!780011 () Bool)

(assert (=> b!1175141 (=> res!780011 e!668059)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175141 (= res!780011 (not (validKeyInArray!0 (select (arr!36603 _keys!1208) from!1455))))))

(declare-datatypes ((V!44497 0))(
  ( (V!44498 (val!14820 Int)) )
))
(declare-datatypes ((tuple2!18978 0))(
  ( (tuple2!18979 (_1!9500 (_ BitVec 64)) (_2!9500 V!44497)) )
))
(declare-datatypes ((List!25716 0))(
  ( (Nil!25713) (Cons!25712 (h!26930 tuple2!18978) (t!37697 List!25716)) )
))
(declare-datatypes ((ListLongMap!16955 0))(
  ( (ListLongMap!16956 (toList!8493 List!25716)) )
))
(declare-fun lt!529695 () ListLongMap!16955)

(declare-fun lt!529699 () ListLongMap!16955)

(assert (=> b!1175141 (= lt!529695 lt!529699)))

(declare-fun lt!529693 () ListLongMap!16955)

(declare-fun -!1539 (ListLongMap!16955 (_ BitVec 64)) ListLongMap!16955)

(assert (=> b!1175141 (= lt!529699 (-!1539 lt!529693 k0!934))))

(declare-fun lt!529689 () array!75919)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14054 0))(
  ( (ValueCellFull!14054 (v!17454 V!44497)) (EmptyCell!14054) )
))
(declare-datatypes ((array!75921 0))(
  ( (array!75922 (arr!36604 (Array (_ BitVec 32) ValueCell!14054)) (size!37141 (_ BitVec 32))) )
))
(declare-fun lt!529690 () array!75921)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44497)

(declare-fun zeroValue!944 () V!44497)

(declare-fun getCurrentListMapNoExtraKeys!4978 (array!75919 array!75921 (_ BitVec 32) (_ BitVec 32) V!44497 V!44497 (_ BitVec 32) Int) ListLongMap!16955)

(assert (=> b!1175141 (= lt!529695 (getCurrentListMapNoExtraKeys!4978 lt!529689 lt!529690 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75921)

(assert (=> b!1175141 (= lt!529693 (getCurrentListMapNoExtraKeys!4978 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38702 0))(
  ( (Unit!38703) )
))
(declare-fun lt!529697 () Unit!38702)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!764 (array!75919 array!75921 (_ BitVec 32) (_ BitVec 32) V!44497 V!44497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38702)

(assert (=> b!1175141 (= lt!529697 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!780006 () Bool)

(assert (=> start!99654 (=> (not res!780006) (not e!668055))))

(assert (=> start!99654 (= res!780006 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37140 _keys!1208))))))

(assert (=> start!99654 e!668055))

(declare-fun tp_is_empty!29527 () Bool)

(assert (=> start!99654 tp_is_empty!29527))

(declare-fun array_inv!28042 (array!75919) Bool)

(assert (=> start!99654 (array_inv!28042 _keys!1208)))

(assert (=> start!99654 true))

(assert (=> start!99654 tp!87704))

(declare-fun e!668064 () Bool)

(declare-fun array_inv!28043 (array!75921) Bool)

(assert (=> start!99654 (and (array_inv!28043 _values!996) e!668064)))

(declare-fun b!1175142 () Bool)

(declare-fun res!780009 () Bool)

(assert (=> b!1175142 (=> (not res!780009) (not e!668055))))

(assert (=> b!1175142 (= res!780009 (and (= (size!37141 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37140 _keys!1208) (size!37141 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175143 () Bool)

(declare-fun e!668065 () Bool)

(assert (=> b!1175143 (= e!668065 tp_is_empty!29527)))

(declare-fun b!1175144 () Bool)

(declare-fun e!668058 () Unit!38702)

(declare-fun Unit!38704 () Unit!38702)

(assert (=> b!1175144 (= e!668058 Unit!38704)))

(declare-fun b!1175145 () Bool)

(declare-fun e!668057 () Bool)

(declare-fun e!668066 () Bool)

(assert (=> b!1175145 (= e!668057 e!668066)))

(declare-fun res!780013 () Bool)

(assert (=> b!1175145 (=> res!780013 e!668066)))

(assert (=> b!1175145 (= res!780013 (not (= (select (arr!36603 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175146 () Bool)

(declare-fun e!668063 () Bool)

(assert (=> b!1175146 (= e!668063 tp_is_empty!29527)))

(declare-fun b!1175147 () Bool)

(declare-fun res!780004 () Bool)

(declare-fun e!668060 () Bool)

(assert (=> b!1175147 (=> (not res!780004) (not e!668060))))

(declare-datatypes ((List!25717 0))(
  ( (Nil!25714) (Cons!25713 (h!26931 (_ BitVec 64)) (t!37698 List!25717)) )
))
(declare-fun arrayNoDuplicates!0 (array!75919 (_ BitVec 32) List!25717) Bool)

(assert (=> b!1175147 (= res!780004 (arrayNoDuplicates!0 lt!529689 #b00000000000000000000000000000000 Nil!25714))))

(declare-fun b!1175148 () Bool)

(declare-fun res!780014 () Bool)

(assert (=> b!1175148 (=> (not res!780014) (not e!668055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75919 (_ BitVec 32)) Bool)

(assert (=> b!1175148 (= res!780014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175149 () Bool)

(declare-fun res!780003 () Bool)

(assert (=> b!1175149 (=> (not res!780003) (not e!668055))))

(assert (=> b!1175149 (= res!780003 (validKeyInArray!0 k0!934))))

(declare-fun b!1175150 () Bool)

(declare-fun Unit!38705 () Unit!38702)

(assert (=> b!1175150 (= e!668058 Unit!38705)))

(declare-fun lt!529700 () Unit!38702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75919 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38702)

(assert (=> b!1175150 (= lt!529700 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175150 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529698 () Unit!38702)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75919 (_ BitVec 32) (_ BitVec 32)) Unit!38702)

(assert (=> b!1175150 (= lt!529698 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175150 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25714)))

(declare-fun lt!529702 () Unit!38702)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75919 (_ BitVec 64) (_ BitVec 32) List!25717) Unit!38702)

(assert (=> b!1175150 (= lt!529702 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25714))))

(assert (=> b!1175150 false))

(declare-fun b!1175151 () Bool)

(declare-fun res!780002 () Bool)

(assert (=> b!1175151 (=> (not res!780002) (not e!668055))))

(assert (=> b!1175151 (= res!780002 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25714))))

(declare-fun mapNonEmpty!46118 () Bool)

(declare-fun mapRes!46118 () Bool)

(declare-fun tp!87705 () Bool)

(assert (=> mapNonEmpty!46118 (= mapRes!46118 (and tp!87705 e!668065))))

(declare-fun mapKey!46118 () (_ BitVec 32))

(declare-fun mapRest!46118 () (Array (_ BitVec 32) ValueCell!14054))

(declare-fun mapValue!46118 () ValueCell!14054)

(assert (=> mapNonEmpty!46118 (= (arr!36604 _values!996) (store mapRest!46118 mapKey!46118 mapValue!46118))))

(declare-fun b!1175152 () Bool)

(assert (=> b!1175152 (= e!668066 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46118 () Bool)

(assert (=> mapIsEmpty!46118 mapRes!46118))

(declare-fun b!1175153 () Bool)

(declare-fun res!780000 () Bool)

(assert (=> b!1175153 (=> (not res!780000) (not e!668055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175153 (= res!780000 (validMask!0 mask!1564))))

(declare-fun b!1175154 () Bool)

(assert (=> b!1175154 (= e!668055 e!668060)))

(declare-fun res!780008 () Bool)

(assert (=> b!1175154 (=> (not res!780008) (not e!668060))))

(assert (=> b!1175154 (= res!780008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529689 mask!1564))))

(assert (=> b!1175154 (= lt!529689 (array!75920 (store (arr!36603 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37140 _keys!1208)))))

(declare-fun b!1175155 () Bool)

(assert (=> b!1175155 (= e!668064 (and e!668063 mapRes!46118))))

(declare-fun condMapEmpty!46118 () Bool)

(declare-fun mapDefault!46118 () ValueCell!14054)

(assert (=> b!1175155 (= condMapEmpty!46118 (= (arr!36604 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14054)) mapDefault!46118)))))

(declare-fun b!1175156 () Bool)

(declare-fun e!668056 () Bool)

(assert (=> b!1175156 (= e!668060 (not e!668056))))

(declare-fun res!780010 () Bool)

(assert (=> b!1175156 (=> res!780010 e!668056)))

(assert (=> b!1175156 (= res!780010 (bvsgt from!1455 i!673))))

(assert (=> b!1175156 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529694 () Unit!38702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75919 (_ BitVec 64) (_ BitVec 32)) Unit!38702)

(assert (=> b!1175156 (= lt!529694 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175157 () Bool)

(assert (=> b!1175157 (= e!668056 e!668062)))

(declare-fun res!780012 () Bool)

(assert (=> b!1175157 (=> res!780012 e!668062)))

(assert (=> b!1175157 (= res!780012 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!529696 () ListLongMap!16955)

(assert (=> b!1175157 (= lt!529696 (getCurrentListMapNoExtraKeys!4978 lt!529689 lt!529690 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529692 () V!44497)

(assert (=> b!1175157 (= lt!529690 (array!75922 (store (arr!36604 _values!996) i!673 (ValueCellFull!14054 lt!529692)) (size!37141 _values!996)))))

(declare-fun dynLambda!2956 (Int (_ BitVec 64)) V!44497)

(assert (=> b!1175157 (= lt!529692 (dynLambda!2956 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529691 () ListLongMap!16955)

(assert (=> b!1175157 (= lt!529691 (getCurrentListMapNoExtraKeys!4978 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175158 () Bool)

(assert (=> b!1175158 (= e!668059 true)))

(assert (=> b!1175158 (not (= (select (arr!36603 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529701 () Unit!38702)

(assert (=> b!1175158 (= lt!529701 e!668058)))

(declare-fun c!117017 () Bool)

(assert (=> b!1175158 (= c!117017 (= (select (arr!36603 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175158 e!668057))

(declare-fun res!780005 () Bool)

(assert (=> b!1175158 (=> (not res!780005) (not e!668057))))

(declare-fun +!3825 (ListLongMap!16955 tuple2!18978) ListLongMap!16955)

(declare-fun get!18709 (ValueCell!14054 V!44497) V!44497)

(assert (=> b!1175158 (= res!780005 (= lt!529696 (+!3825 lt!529699 (tuple2!18979 (select (arr!36603 _keys!1208) from!1455) (get!18709 (select (arr!36604 _values!996) from!1455) lt!529692)))))))

(declare-fun b!1175159 () Bool)

(declare-fun res!780001 () Bool)

(assert (=> b!1175159 (=> (not res!780001) (not e!668055))))

(assert (=> b!1175159 (= res!780001 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37140 _keys!1208))))))

(assert (= (and start!99654 res!780006) b!1175153))

(assert (= (and b!1175153 res!780000) b!1175142))

(assert (= (and b!1175142 res!780009) b!1175148))

(assert (= (and b!1175148 res!780014) b!1175151))

(assert (= (and b!1175151 res!780002) b!1175159))

(assert (= (and b!1175159 res!780001) b!1175149))

(assert (= (and b!1175149 res!780003) b!1175140))

(assert (= (and b!1175140 res!780007) b!1175154))

(assert (= (and b!1175154 res!780008) b!1175147))

(assert (= (and b!1175147 res!780004) b!1175156))

(assert (= (and b!1175156 (not res!780010)) b!1175157))

(assert (= (and b!1175157 (not res!780012)) b!1175141))

(assert (= (and b!1175141 (not res!780011)) b!1175158))

(assert (= (and b!1175158 res!780005) b!1175145))

(assert (= (and b!1175145 (not res!780013)) b!1175152))

(assert (= (and b!1175158 c!117017) b!1175150))

(assert (= (and b!1175158 (not c!117017)) b!1175144))

(assert (= (and b!1175155 condMapEmpty!46118) mapIsEmpty!46118))

(assert (= (and b!1175155 (not condMapEmpty!46118)) mapNonEmpty!46118))

(get-info :version)

(assert (= (and mapNonEmpty!46118 ((_ is ValueCellFull!14054) mapValue!46118)) b!1175143))

(assert (= (and b!1175155 ((_ is ValueCellFull!14054) mapDefault!46118)) b!1175146))

(assert (= start!99654 b!1175155))

(declare-fun b_lambda!20135 () Bool)

(assert (=> (not b_lambda!20135) (not b!1175157)))

(declare-fun t!37696 () Bool)

(declare-fun tb!9801 () Bool)

(assert (=> (and start!99654 (= defaultEntry!1004 defaultEntry!1004) t!37696) tb!9801))

(declare-fun result!20177 () Bool)

(assert (=> tb!9801 (= result!20177 tp_is_empty!29527)))

(assert (=> b!1175157 t!37696))

(declare-fun b_and!40865 () Bool)

(assert (= b_and!40863 (and (=> t!37696 result!20177) b_and!40865)))

(declare-fun m!1083279 () Bool)

(assert (=> b!1175151 m!1083279))

(declare-fun m!1083281 () Bool)

(assert (=> b!1175158 m!1083281))

(declare-fun m!1083283 () Bool)

(assert (=> b!1175158 m!1083283))

(assert (=> b!1175158 m!1083283))

(declare-fun m!1083285 () Bool)

(assert (=> b!1175158 m!1083285))

(declare-fun m!1083287 () Bool)

(assert (=> b!1175158 m!1083287))

(declare-fun m!1083289 () Bool)

(assert (=> b!1175140 m!1083289))

(declare-fun m!1083291 () Bool)

(assert (=> b!1175148 m!1083291))

(declare-fun m!1083293 () Bool)

(assert (=> b!1175147 m!1083293))

(declare-fun m!1083295 () Bool)

(assert (=> b!1175141 m!1083295))

(declare-fun m!1083297 () Bool)

(assert (=> b!1175141 m!1083297))

(declare-fun m!1083299 () Bool)

(assert (=> b!1175141 m!1083299))

(declare-fun m!1083301 () Bool)

(assert (=> b!1175141 m!1083301))

(assert (=> b!1175141 m!1083281))

(declare-fun m!1083303 () Bool)

(assert (=> b!1175141 m!1083303))

(assert (=> b!1175141 m!1083281))

(declare-fun m!1083305 () Bool)

(assert (=> start!99654 m!1083305))

(declare-fun m!1083307 () Bool)

(assert (=> start!99654 m!1083307))

(declare-fun m!1083309 () Bool)

(assert (=> mapNonEmpty!46118 m!1083309))

(declare-fun m!1083311 () Bool)

(assert (=> b!1175157 m!1083311))

(declare-fun m!1083313 () Bool)

(assert (=> b!1175157 m!1083313))

(declare-fun m!1083315 () Bool)

(assert (=> b!1175157 m!1083315))

(declare-fun m!1083317 () Bool)

(assert (=> b!1175157 m!1083317))

(declare-fun m!1083319 () Bool)

(assert (=> b!1175150 m!1083319))

(declare-fun m!1083321 () Bool)

(assert (=> b!1175150 m!1083321))

(declare-fun m!1083323 () Bool)

(assert (=> b!1175150 m!1083323))

(declare-fun m!1083325 () Bool)

(assert (=> b!1175150 m!1083325))

(declare-fun m!1083327 () Bool)

(assert (=> b!1175150 m!1083327))

(declare-fun m!1083329 () Bool)

(assert (=> b!1175156 m!1083329))

(declare-fun m!1083331 () Bool)

(assert (=> b!1175156 m!1083331))

(assert (=> b!1175145 m!1083281))

(declare-fun m!1083333 () Bool)

(assert (=> b!1175154 m!1083333))

(declare-fun m!1083335 () Bool)

(assert (=> b!1175154 m!1083335))

(declare-fun m!1083337 () Bool)

(assert (=> b!1175152 m!1083337))

(declare-fun m!1083339 () Bool)

(assert (=> b!1175149 m!1083339))

(declare-fun m!1083341 () Bool)

(assert (=> b!1175153 m!1083341))

(check-sat (not b!1175156) (not start!99654) (not mapNonEmpty!46118) b_and!40865 (not b_lambda!20135) (not b!1175151) tp_is_empty!29527 (not b!1175150) (not b!1175152) (not b!1175141) (not b!1175149) (not b!1175158) (not b_next!24997) (not b!1175147) (not b!1175157) (not b!1175154) (not b!1175148) (not b!1175153))
(check-sat b_and!40865 (not b_next!24997))

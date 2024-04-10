; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99124 () Bool)

(assert start!99124)

(declare-fun b_free!24729 () Bool)

(declare-fun b_next!24729 () Bool)

(assert (=> start!99124 (= b_free!24729 (not b_next!24729))))

(declare-fun tp!86897 () Bool)

(declare-fun b_and!40307 () Bool)

(assert (=> start!99124 (= tp!86897 b_and!40307)))

(declare-fun b!1166185 () Bool)

(declare-fun res!773502 () Bool)

(declare-fun e!662909 () Bool)

(assert (=> b!1166185 (=> (not res!773502) (not e!662909))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166185 (= res!773502 (validKeyInArray!0 k0!934))))

(declare-fun b!1166186 () Bool)

(declare-fun res!773505 () Bool)

(assert (=> b!1166186 (=> (not res!773505) (not e!662909))))

(declare-datatypes ((array!75349 0))(
  ( (array!75350 (arr!36325 (Array (_ BitVec 32) (_ BitVec 64))) (size!36861 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75349)

(declare-datatypes ((List!25469 0))(
  ( (Nil!25466) (Cons!25465 (h!26674 (_ BitVec 64)) (t!37190 List!25469)) )
))
(declare-fun arrayNoDuplicates!0 (array!75349 (_ BitVec 32) List!25469) Bool)

(assert (=> b!1166186 (= res!773505 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25466))))

(declare-fun b!1166187 () Bool)

(declare-fun e!662908 () Bool)

(declare-fun e!662913 () Bool)

(assert (=> b!1166187 (= e!662908 e!662913)))

(declare-fun res!773500 () Bool)

(assert (=> b!1166187 (=> res!773500 e!662913)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166187 (= res!773500 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44139 0))(
  ( (V!44140 (val!14686 Int)) )
))
(declare-fun zeroValue!944 () V!44139)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18730 0))(
  ( (tuple2!18731 (_1!9376 (_ BitVec 64)) (_2!9376 V!44139)) )
))
(declare-datatypes ((List!25470 0))(
  ( (Nil!25467) (Cons!25466 (h!26675 tuple2!18730) (t!37191 List!25470)) )
))
(declare-datatypes ((ListLongMap!16699 0))(
  ( (ListLongMap!16700 (toList!8365 List!25470)) )
))
(declare-fun lt!525154 () ListLongMap!16699)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525157 () array!75349)

(declare-fun minValue!944 () V!44139)

(declare-datatypes ((ValueCell!13920 0))(
  ( (ValueCellFull!13920 (v!17323 V!44139)) (EmptyCell!13920) )
))
(declare-datatypes ((array!75351 0))(
  ( (array!75352 (arr!36326 (Array (_ BitVec 32) ValueCell!13920)) (size!36862 (_ BitVec 32))) )
))
(declare-fun lt!525155 () array!75351)

(declare-fun getCurrentListMapNoExtraKeys!4829 (array!75349 array!75351 (_ BitVec 32) (_ BitVec 32) V!44139 V!44139 (_ BitVec 32) Int) ListLongMap!16699)

(assert (=> b!1166187 (= lt!525154 (getCurrentListMapNoExtraKeys!4829 lt!525157 lt!525155 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75351)

(declare-fun dynLambda!2818 (Int (_ BitVec 64)) V!44139)

(assert (=> b!1166187 (= lt!525155 (array!75352 (store (arr!36326 _values!996) i!673 (ValueCellFull!13920 (dynLambda!2818 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36862 _values!996)))))

(declare-fun lt!525159 () ListLongMap!16699)

(assert (=> b!1166187 (= lt!525159 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166188 () Bool)

(declare-fun e!662907 () Bool)

(declare-fun e!662912 () Bool)

(declare-fun mapRes!45713 () Bool)

(assert (=> b!1166188 (= e!662907 (and e!662912 mapRes!45713))))

(declare-fun condMapEmpty!45713 () Bool)

(declare-fun mapDefault!45713 () ValueCell!13920)

(assert (=> b!1166188 (= condMapEmpty!45713 (= (arr!36326 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13920)) mapDefault!45713)))))

(declare-fun b!1166190 () Bool)

(declare-fun res!773501 () Bool)

(assert (=> b!1166190 (=> (not res!773501) (not e!662909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75349 (_ BitVec 32)) Bool)

(assert (=> b!1166190 (= res!773501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166191 () Bool)

(declare-fun e!662910 () Bool)

(assert (=> b!1166191 (= e!662910 (not e!662908))))

(declare-fun res!773497 () Bool)

(assert (=> b!1166191 (=> res!773497 e!662908)))

(assert (=> b!1166191 (= res!773497 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166191 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38482 0))(
  ( (Unit!38483) )
))
(declare-fun lt!525156 () Unit!38482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75349 (_ BitVec 64) (_ BitVec 32)) Unit!38482)

(assert (=> b!1166191 (= lt!525156 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166192 () Bool)

(declare-fun e!662911 () Bool)

(declare-fun tp_is_empty!29259 () Bool)

(assert (=> b!1166192 (= e!662911 tp_is_empty!29259)))

(declare-fun b!1166193 () Bool)

(assert (=> b!1166193 (= e!662912 tp_is_empty!29259)))

(declare-fun mapIsEmpty!45713 () Bool)

(assert (=> mapIsEmpty!45713 mapRes!45713))

(declare-fun b!1166194 () Bool)

(assert (=> b!1166194 (= e!662909 e!662910)))

(declare-fun res!773499 () Bool)

(assert (=> b!1166194 (=> (not res!773499) (not e!662910))))

(assert (=> b!1166194 (= res!773499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525157 mask!1564))))

(assert (=> b!1166194 (= lt!525157 (array!75350 (store (arr!36325 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36861 _keys!1208)))))

(declare-fun b!1166195 () Bool)

(declare-fun res!773506 () Bool)

(assert (=> b!1166195 (=> (not res!773506) (not e!662910))))

(assert (=> b!1166195 (= res!773506 (arrayNoDuplicates!0 lt!525157 #b00000000000000000000000000000000 Nil!25466))))

(declare-fun res!773503 () Bool)

(assert (=> start!99124 (=> (not res!773503) (not e!662909))))

(assert (=> start!99124 (= res!773503 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36861 _keys!1208))))))

(assert (=> start!99124 e!662909))

(assert (=> start!99124 tp_is_empty!29259))

(declare-fun array_inv!27782 (array!75349) Bool)

(assert (=> start!99124 (array_inv!27782 _keys!1208)))

(assert (=> start!99124 true))

(assert (=> start!99124 tp!86897))

(declare-fun array_inv!27783 (array!75351) Bool)

(assert (=> start!99124 (and (array_inv!27783 _values!996) e!662907)))

(declare-fun b!1166189 () Bool)

(assert (=> b!1166189 (= e!662913 true)))

(declare-fun -!1442 (ListLongMap!16699 (_ BitVec 64)) ListLongMap!16699)

(assert (=> b!1166189 (= (getCurrentListMapNoExtraKeys!4829 lt!525157 lt!525155 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1442 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525158 () Unit!38482)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!669 (array!75349 array!75351 (_ BitVec 32) (_ BitVec 32) V!44139 V!44139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38482)

(assert (=> b!1166189 (= lt!525158 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!669 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166196 () Bool)

(declare-fun res!773504 () Bool)

(assert (=> b!1166196 (=> (not res!773504) (not e!662909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166196 (= res!773504 (validMask!0 mask!1564))))

(declare-fun b!1166197 () Bool)

(declare-fun res!773496 () Bool)

(assert (=> b!1166197 (=> (not res!773496) (not e!662909))))

(assert (=> b!1166197 (= res!773496 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36861 _keys!1208))))))

(declare-fun b!1166198 () Bool)

(declare-fun res!773507 () Bool)

(assert (=> b!1166198 (=> (not res!773507) (not e!662909))))

(assert (=> b!1166198 (= res!773507 (and (= (size!36862 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36861 _keys!1208) (size!36862 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45713 () Bool)

(declare-fun tp!86898 () Bool)

(assert (=> mapNonEmpty!45713 (= mapRes!45713 (and tp!86898 e!662911))))

(declare-fun mapRest!45713 () (Array (_ BitVec 32) ValueCell!13920))

(declare-fun mapValue!45713 () ValueCell!13920)

(declare-fun mapKey!45713 () (_ BitVec 32))

(assert (=> mapNonEmpty!45713 (= (arr!36326 _values!996) (store mapRest!45713 mapKey!45713 mapValue!45713))))

(declare-fun b!1166199 () Bool)

(declare-fun res!773498 () Bool)

(assert (=> b!1166199 (=> (not res!773498) (not e!662909))))

(assert (=> b!1166199 (= res!773498 (= (select (arr!36325 _keys!1208) i!673) k0!934))))

(assert (= (and start!99124 res!773503) b!1166196))

(assert (= (and b!1166196 res!773504) b!1166198))

(assert (= (and b!1166198 res!773507) b!1166190))

(assert (= (and b!1166190 res!773501) b!1166186))

(assert (= (and b!1166186 res!773505) b!1166197))

(assert (= (and b!1166197 res!773496) b!1166185))

(assert (= (and b!1166185 res!773502) b!1166199))

(assert (= (and b!1166199 res!773498) b!1166194))

(assert (= (and b!1166194 res!773499) b!1166195))

(assert (= (and b!1166195 res!773506) b!1166191))

(assert (= (and b!1166191 (not res!773497)) b!1166187))

(assert (= (and b!1166187 (not res!773500)) b!1166189))

(assert (= (and b!1166188 condMapEmpty!45713) mapIsEmpty!45713))

(assert (= (and b!1166188 (not condMapEmpty!45713)) mapNonEmpty!45713))

(get-info :version)

(assert (= (and mapNonEmpty!45713 ((_ is ValueCellFull!13920) mapValue!45713)) b!1166192))

(assert (= (and b!1166188 ((_ is ValueCellFull!13920) mapDefault!45713)) b!1166193))

(assert (= start!99124 b!1166188))

(declare-fun b_lambda!19835 () Bool)

(assert (=> (not b_lambda!19835) (not b!1166187)))

(declare-fun t!37189 () Bool)

(declare-fun tb!9541 () Bool)

(assert (=> (and start!99124 (= defaultEntry!1004 defaultEntry!1004) t!37189) tb!9541))

(declare-fun result!19647 () Bool)

(assert (=> tb!9541 (= result!19647 tp_is_empty!29259)))

(assert (=> b!1166187 t!37189))

(declare-fun b_and!40309 () Bool)

(assert (= b_and!40307 (and (=> t!37189 result!19647) b_and!40309)))

(declare-fun m!1074251 () Bool)

(assert (=> b!1166195 m!1074251))

(declare-fun m!1074253 () Bool)

(assert (=> b!1166189 m!1074253))

(declare-fun m!1074255 () Bool)

(assert (=> b!1166189 m!1074255))

(assert (=> b!1166189 m!1074255))

(declare-fun m!1074257 () Bool)

(assert (=> b!1166189 m!1074257))

(declare-fun m!1074259 () Bool)

(assert (=> b!1166189 m!1074259))

(declare-fun m!1074261 () Bool)

(assert (=> b!1166196 m!1074261))

(declare-fun m!1074263 () Bool)

(assert (=> b!1166190 m!1074263))

(declare-fun m!1074265 () Bool)

(assert (=> mapNonEmpty!45713 m!1074265))

(declare-fun m!1074267 () Bool)

(assert (=> b!1166187 m!1074267))

(declare-fun m!1074269 () Bool)

(assert (=> b!1166187 m!1074269))

(declare-fun m!1074271 () Bool)

(assert (=> b!1166187 m!1074271))

(declare-fun m!1074273 () Bool)

(assert (=> b!1166187 m!1074273))

(declare-fun m!1074275 () Bool)

(assert (=> b!1166194 m!1074275))

(declare-fun m!1074277 () Bool)

(assert (=> b!1166194 m!1074277))

(declare-fun m!1074279 () Bool)

(assert (=> start!99124 m!1074279))

(declare-fun m!1074281 () Bool)

(assert (=> start!99124 m!1074281))

(declare-fun m!1074283 () Bool)

(assert (=> b!1166186 m!1074283))

(declare-fun m!1074285 () Bool)

(assert (=> b!1166199 m!1074285))

(declare-fun m!1074287 () Bool)

(assert (=> b!1166191 m!1074287))

(declare-fun m!1074289 () Bool)

(assert (=> b!1166191 m!1074289))

(declare-fun m!1074291 () Bool)

(assert (=> b!1166185 m!1074291))

(check-sat (not b!1166185) b_and!40309 (not b!1166194) (not b!1166195) (not b!1166196) (not b!1166189) (not b!1166187) (not start!99124) (not mapNonEmpty!45713) (not b_lambda!19835) (not b!1166191) tp_is_empty!29259 (not b!1166186) (not b!1166190) (not b_next!24729))
(check-sat b_and!40309 (not b_next!24729))

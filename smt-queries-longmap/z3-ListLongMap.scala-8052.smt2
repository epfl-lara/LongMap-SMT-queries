; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99146 () Bool)

(assert start!99146)

(declare-fun b_free!24757 () Bool)

(declare-fun b_next!24757 () Bool)

(assert (=> start!99146 (= b_free!24757 (not b_next!24757))))

(declare-fun tp!86981 () Bool)

(declare-fun b_and!40341 () Bool)

(assert (=> start!99146 (= tp!86981 b_and!40341)))

(declare-fun b!1166719 () Bool)

(declare-fun res!773942 () Bool)

(declare-fun e!663165 () Bool)

(assert (=> b!1166719 (=> (not res!773942) (not e!663165))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166719 (= res!773942 (validKeyInArray!0 k0!934))))

(declare-fun b!1166720 () Bool)

(declare-fun res!773937 () Bool)

(assert (=> b!1166720 (=> (not res!773937) (not e!663165))))

(declare-datatypes ((array!75326 0))(
  ( (array!75327 (arr!36314 (Array (_ BitVec 32) (_ BitVec 64))) (size!36852 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75326)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166720 (= res!773937 (= (select (arr!36314 _keys!1208) i!673) k0!934))))

(declare-fun b!1166721 () Bool)

(declare-fun e!663166 () Bool)

(assert (=> b!1166721 (= e!663166 true)))

(declare-datatypes ((V!44177 0))(
  ( (V!44178 (val!14700 Int)) )
))
(declare-fun zeroValue!944 () V!44177)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525217 () array!75326)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13934 0))(
  ( (ValueCellFull!13934 (v!17336 V!44177)) (EmptyCell!13934) )
))
(declare-datatypes ((array!75328 0))(
  ( (array!75329 (arr!36315 (Array (_ BitVec 32) ValueCell!13934)) (size!36853 (_ BitVec 32))) )
))
(declare-fun lt!525215 () array!75328)

(declare-fun _values!996 () array!75328)

(declare-fun minValue!944 () V!44177)

(declare-datatypes ((tuple2!18840 0))(
  ( (tuple2!18841 (_1!9431 (_ BitVec 64)) (_2!9431 V!44177)) )
))
(declare-datatypes ((List!25558 0))(
  ( (Nil!25555) (Cons!25554 (h!26763 tuple2!18840) (t!37298 List!25558)) )
))
(declare-datatypes ((ListLongMap!16809 0))(
  ( (ListLongMap!16810 (toList!8420 List!25558)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4896 (array!75326 array!75328 (_ BitVec 32) (_ BitVec 32) V!44177 V!44177 (_ BitVec 32) Int) ListLongMap!16809)

(declare-fun -!1432 (ListLongMap!16809 (_ BitVec 64)) ListLongMap!16809)

(assert (=> b!1166721 (= (getCurrentListMapNoExtraKeys!4896 lt!525217 lt!525215 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1432 (getCurrentListMapNoExtraKeys!4896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38329 0))(
  ( (Unit!38330) )
))
(declare-fun lt!525216 () Unit!38329)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!696 (array!75326 array!75328 (_ BitVec 32) (_ BitVec 32) V!44177 V!44177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38329)

(assert (=> b!1166721 (= lt!525216 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!696 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166722 () Bool)

(declare-fun e!663169 () Bool)

(declare-fun tp_is_empty!29287 () Bool)

(assert (=> b!1166722 (= e!663169 tp_is_empty!29287)))

(declare-fun b!1166723 () Bool)

(declare-fun e!663164 () Bool)

(declare-fun e!663171 () Bool)

(assert (=> b!1166723 (= e!663164 (not e!663171))))

(declare-fun res!773940 () Bool)

(assert (=> b!1166723 (=> res!773940 e!663171)))

(assert (=> b!1166723 (= res!773940 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166723 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525218 () Unit!38329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75326 (_ BitVec 64) (_ BitVec 32)) Unit!38329)

(assert (=> b!1166723 (= lt!525218 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45755 () Bool)

(declare-fun mapRes!45755 () Bool)

(declare-fun tp!86982 () Bool)

(assert (=> mapNonEmpty!45755 (= mapRes!45755 (and tp!86982 e!663169))))

(declare-fun mapRest!45755 () (Array (_ BitVec 32) ValueCell!13934))

(declare-fun mapValue!45755 () ValueCell!13934)

(declare-fun mapKey!45755 () (_ BitVec 32))

(assert (=> mapNonEmpty!45755 (= (arr!36315 _values!996) (store mapRest!45755 mapKey!45755 mapValue!45755))))

(declare-fun b!1166724 () Bool)

(declare-fun e!663168 () Bool)

(assert (=> b!1166724 (= e!663168 tp_is_empty!29287)))

(declare-fun res!773939 () Bool)

(assert (=> start!99146 (=> (not res!773939) (not e!663165))))

(assert (=> start!99146 (= res!773939 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36852 _keys!1208))))))

(assert (=> start!99146 e!663165))

(assert (=> start!99146 tp_is_empty!29287))

(declare-fun array_inv!27868 (array!75326) Bool)

(assert (=> start!99146 (array_inv!27868 _keys!1208)))

(assert (=> start!99146 true))

(assert (=> start!99146 tp!86981))

(declare-fun e!663167 () Bool)

(declare-fun array_inv!27869 (array!75328) Bool)

(assert (=> start!99146 (and (array_inv!27869 _values!996) e!663167)))

(declare-fun b!1166725 () Bool)

(declare-fun res!773935 () Bool)

(assert (=> b!1166725 (=> (not res!773935) (not e!663165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75326 (_ BitVec 32)) Bool)

(assert (=> b!1166725 (= res!773935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45755 () Bool)

(assert (=> mapIsEmpty!45755 mapRes!45755))

(declare-fun b!1166726 () Bool)

(assert (=> b!1166726 (= e!663167 (and e!663168 mapRes!45755))))

(declare-fun condMapEmpty!45755 () Bool)

(declare-fun mapDefault!45755 () ValueCell!13934)

(assert (=> b!1166726 (= condMapEmpty!45755 (= (arr!36315 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13934)) mapDefault!45755)))))

(declare-fun b!1166727 () Bool)

(assert (=> b!1166727 (= e!663165 e!663164)))

(declare-fun res!773938 () Bool)

(assert (=> b!1166727 (=> (not res!773938) (not e!663164))))

(assert (=> b!1166727 (= res!773938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525217 mask!1564))))

(assert (=> b!1166727 (= lt!525217 (array!75327 (store (arr!36314 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36852 _keys!1208)))))

(declare-fun b!1166728 () Bool)

(assert (=> b!1166728 (= e!663171 e!663166)))

(declare-fun res!773934 () Bool)

(assert (=> b!1166728 (=> res!773934 e!663166)))

(assert (=> b!1166728 (= res!773934 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525219 () ListLongMap!16809)

(assert (=> b!1166728 (= lt!525219 (getCurrentListMapNoExtraKeys!4896 lt!525217 lt!525215 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2829 (Int (_ BitVec 64)) V!44177)

(assert (=> b!1166728 (= lt!525215 (array!75329 (store (arr!36315 _values!996) i!673 (ValueCellFull!13934 (dynLambda!2829 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36853 _values!996)))))

(declare-fun lt!525214 () ListLongMap!16809)

(assert (=> b!1166728 (= lt!525214 (getCurrentListMapNoExtraKeys!4896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166729 () Bool)

(declare-fun res!773943 () Bool)

(assert (=> b!1166729 (=> (not res!773943) (not e!663165))))

(declare-datatypes ((List!25559 0))(
  ( (Nil!25556) (Cons!25555 (h!26764 (_ BitVec 64)) (t!37299 List!25559)) )
))
(declare-fun arrayNoDuplicates!0 (array!75326 (_ BitVec 32) List!25559) Bool)

(assert (=> b!1166729 (= res!773943 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25556))))

(declare-fun b!1166730 () Bool)

(declare-fun res!773945 () Bool)

(assert (=> b!1166730 (=> (not res!773945) (not e!663165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166730 (= res!773945 (validMask!0 mask!1564))))

(declare-fun b!1166731 () Bool)

(declare-fun res!773944 () Bool)

(assert (=> b!1166731 (=> (not res!773944) (not e!663165))))

(assert (=> b!1166731 (= res!773944 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36852 _keys!1208))))))

(declare-fun b!1166732 () Bool)

(declare-fun res!773941 () Bool)

(assert (=> b!1166732 (=> (not res!773941) (not e!663165))))

(assert (=> b!1166732 (= res!773941 (and (= (size!36853 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36852 _keys!1208) (size!36853 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166733 () Bool)

(declare-fun res!773936 () Bool)

(assert (=> b!1166733 (=> (not res!773936) (not e!663164))))

(assert (=> b!1166733 (= res!773936 (arrayNoDuplicates!0 lt!525217 #b00000000000000000000000000000000 Nil!25556))))

(assert (= (and start!99146 res!773939) b!1166730))

(assert (= (and b!1166730 res!773945) b!1166732))

(assert (= (and b!1166732 res!773941) b!1166725))

(assert (= (and b!1166725 res!773935) b!1166729))

(assert (= (and b!1166729 res!773943) b!1166731))

(assert (= (and b!1166731 res!773944) b!1166719))

(assert (= (and b!1166719 res!773942) b!1166720))

(assert (= (and b!1166720 res!773937) b!1166727))

(assert (= (and b!1166727 res!773938) b!1166733))

(assert (= (and b!1166733 res!773936) b!1166723))

(assert (= (and b!1166723 (not res!773940)) b!1166728))

(assert (= (and b!1166728 (not res!773934)) b!1166721))

(assert (= (and b!1166726 condMapEmpty!45755) mapIsEmpty!45755))

(assert (= (and b!1166726 (not condMapEmpty!45755)) mapNonEmpty!45755))

(get-info :version)

(assert (= (and mapNonEmpty!45755 ((_ is ValueCellFull!13934) mapValue!45755)) b!1166722))

(assert (= (and b!1166726 ((_ is ValueCellFull!13934) mapDefault!45755)) b!1166724))

(assert (= start!99146 b!1166726))

(declare-fun b_lambda!19845 () Bool)

(assert (=> (not b_lambda!19845) (not b!1166728)))

(declare-fun t!37297 () Bool)

(declare-fun tb!9561 () Bool)

(assert (=> (and start!99146 (= defaultEntry!1004 defaultEntry!1004) t!37297) tb!9561))

(declare-fun result!19695 () Bool)

(assert (=> tb!9561 (= result!19695 tp_is_empty!29287)))

(assert (=> b!1166728 t!37297))

(declare-fun b_and!40343 () Bool)

(assert (= b_and!40341 (and (=> t!37297 result!19695) b_and!40343)))

(declare-fun m!1074229 () Bool)

(assert (=> b!1166723 m!1074229))

(declare-fun m!1074231 () Bool)

(assert (=> b!1166723 m!1074231))

(declare-fun m!1074233 () Bool)

(assert (=> b!1166733 m!1074233))

(declare-fun m!1074235 () Bool)

(assert (=> b!1166719 m!1074235))

(declare-fun m!1074237 () Bool)

(assert (=> b!1166728 m!1074237))

(declare-fun m!1074239 () Bool)

(assert (=> b!1166728 m!1074239))

(declare-fun m!1074241 () Bool)

(assert (=> b!1166728 m!1074241))

(declare-fun m!1074243 () Bool)

(assert (=> b!1166728 m!1074243))

(declare-fun m!1074245 () Bool)

(assert (=> start!99146 m!1074245))

(declare-fun m!1074247 () Bool)

(assert (=> start!99146 m!1074247))

(declare-fun m!1074249 () Bool)

(assert (=> b!1166727 m!1074249))

(declare-fun m!1074251 () Bool)

(assert (=> b!1166727 m!1074251))

(declare-fun m!1074253 () Bool)

(assert (=> mapNonEmpty!45755 m!1074253))

(declare-fun m!1074255 () Bool)

(assert (=> b!1166725 m!1074255))

(declare-fun m!1074257 () Bool)

(assert (=> b!1166720 m!1074257))

(declare-fun m!1074259 () Bool)

(assert (=> b!1166729 m!1074259))

(declare-fun m!1074261 () Bool)

(assert (=> b!1166730 m!1074261))

(declare-fun m!1074263 () Bool)

(assert (=> b!1166721 m!1074263))

(declare-fun m!1074265 () Bool)

(assert (=> b!1166721 m!1074265))

(assert (=> b!1166721 m!1074265))

(declare-fun m!1074267 () Bool)

(assert (=> b!1166721 m!1074267))

(declare-fun m!1074269 () Bool)

(assert (=> b!1166721 m!1074269))

(check-sat b_and!40343 (not b_lambda!19845) (not b!1166727) (not b!1166729) (not start!99146) (not b!1166730) (not b!1166733) tp_is_empty!29287 (not b!1166728) (not b!1166725) (not mapNonEmpty!45755) (not b!1166723) (not b_next!24757) (not b!1166721) (not b!1166719))
(check-sat b_and!40343 (not b_next!24757))

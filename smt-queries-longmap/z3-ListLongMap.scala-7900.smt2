; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98138 () Bool)

(assert start!98138)

(declare-fun b_free!23845 () Bool)

(declare-fun b_next!23845 () Bool)

(assert (=> start!98138 (= b_free!23845 (not b_next!23845))))

(declare-fun tp!84238 () Bool)

(declare-fun b_and!38451 () Bool)

(assert (=> start!98138 (= tp!84238 b_and!38451)))

(declare-fun b!1128131 () Bool)

(declare-fun res!753931 () Bool)

(declare-fun e!642057 () Bool)

(assert (=> b!1128131 (=> (not res!753931) (not e!642057))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73536 0))(
  ( (array!73537 (arr!35421 (Array (_ BitVec 32) (_ BitVec 64))) (size!35959 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73536)

(assert (=> b!1128131 (= res!753931 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35959 _keys!1208))))))

(declare-fun b!1128132 () Bool)

(declare-fun e!642066 () Bool)

(declare-fun e!642063 () Bool)

(assert (=> b!1128132 (= e!642066 (not e!642063))))

(declare-fun res!753922 () Bool)

(assert (=> b!1128132 (=> res!753922 e!642063)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128132 (= res!753922 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128132 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36815 0))(
  ( (Unit!36816) )
))
(declare-fun lt!500696 () Unit!36815)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73536 (_ BitVec 64) (_ BitVec 32)) Unit!36815)

(assert (=> b!1128132 (= lt!500696 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!42961 0))(
  ( (V!42962 (val!14244 Int)) )
))
(declare-fun zeroValue!944 () V!42961)

(declare-fun lt!500694 () array!73536)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13478 0))(
  ( (ValueCellFull!13478 (v!16876 V!42961)) (EmptyCell!13478) )
))
(declare-datatypes ((array!73538 0))(
  ( (array!73539 (arr!35422 (Array (_ BitVec 32) ValueCell!13478)) (size!35960 (_ BitVec 32))) )
))
(declare-fun lt!500698 () array!73538)

(declare-fun bm!47791 () Bool)

(declare-fun minValue!944 () V!42961)

(declare-datatypes ((tuple2!18020 0))(
  ( (tuple2!18021 (_1!9021 (_ BitVec 64)) (_2!9021 V!42961)) )
))
(declare-datatypes ((List!24774 0))(
  ( (Nil!24771) (Cons!24770 (h!25979 tuple2!18020) (t!35602 List!24774)) )
))
(declare-datatypes ((ListLongMap!15989 0))(
  ( (ListLongMap!15990 (toList!8010 List!24774)) )
))
(declare-fun call!47795 () ListLongMap!15989)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4510 (array!73536 array!73538 (_ BitVec 32) (_ BitVec 32) V!42961 V!42961 (_ BitVec 32) Int) ListLongMap!15989)

(assert (=> bm!47791 (= call!47795 (getCurrentListMapNoExtraKeys!4510 lt!500694 lt!500698 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128133 () Bool)

(declare-fun e!642059 () Bool)

(assert (=> b!1128133 (= e!642059 true)))

(declare-fun _values!996 () array!73538)

(declare-fun lt!500700 () Bool)

(declare-fun contains!6465 (ListLongMap!15989 (_ BitVec 64)) Bool)

(assert (=> b!1128133 (= lt!500700 (contains!6465 (getCurrentListMapNoExtraKeys!4510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapIsEmpty!44380 () Bool)

(declare-fun mapRes!44380 () Bool)

(assert (=> mapIsEmpty!44380 mapRes!44380))

(declare-fun call!47794 () ListLongMap!15989)

(declare-fun bm!47792 () Bool)

(assert (=> bm!47792 (= call!47794 (getCurrentListMapNoExtraKeys!4510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128134 () Bool)

(declare-fun res!753928 () Bool)

(assert (=> b!1128134 (=> (not res!753928) (not e!642057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73536 (_ BitVec 32)) Bool)

(assert (=> b!1128134 (= res!753928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!753925 () Bool)

(assert (=> start!98138 (=> (not res!753925) (not e!642057))))

(assert (=> start!98138 (= res!753925 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35959 _keys!1208))))))

(assert (=> start!98138 e!642057))

(declare-fun tp_is_empty!28375 () Bool)

(assert (=> start!98138 tp_is_empty!28375))

(declare-fun array_inv!27258 (array!73536) Bool)

(assert (=> start!98138 (array_inv!27258 _keys!1208)))

(assert (=> start!98138 true))

(assert (=> start!98138 tp!84238))

(declare-fun e!642058 () Bool)

(declare-fun array_inv!27259 (array!73538) Bool)

(assert (=> start!98138 (and (array_inv!27259 _values!996) e!642058)))

(declare-fun b!1128130 () Bool)

(declare-fun e!642062 () Bool)

(declare-fun -!1129 (ListLongMap!15989 (_ BitVec 64)) ListLongMap!15989)

(assert (=> b!1128130 (= e!642062 (= call!47795 (-!1129 call!47794 k0!934)))))

(declare-fun b!1128135 () Bool)

(declare-fun e!642064 () Bool)

(assert (=> b!1128135 (= e!642064 e!642059)))

(declare-fun res!753930 () Bool)

(assert (=> b!1128135 (=> res!753930 e!642059)))

(assert (=> b!1128135 (= res!753930 (not (= (select (arr!35421 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128135 e!642062))

(declare-fun c!109731 () Bool)

(assert (=> b!1128135 (= c!109731 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500695 () Unit!36815)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!410 (array!73536 array!73538 (_ BitVec 32) (_ BitVec 32) V!42961 V!42961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36815)

(assert (=> b!1128135 (= lt!500695 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128136 () Bool)

(declare-fun e!642065 () Bool)

(assert (=> b!1128136 (= e!642065 tp_is_empty!28375)))

(declare-fun b!1128137 () Bool)

(declare-fun res!753927 () Bool)

(assert (=> b!1128137 (=> (not res!753927) (not e!642066))))

(declare-datatypes ((List!24775 0))(
  ( (Nil!24772) (Cons!24771 (h!25980 (_ BitVec 64)) (t!35603 List!24775)) )
))
(declare-fun arrayNoDuplicates!0 (array!73536 (_ BitVec 32) List!24775) Bool)

(assert (=> b!1128137 (= res!753927 (arrayNoDuplicates!0 lt!500694 #b00000000000000000000000000000000 Nil!24772))))

(declare-fun b!1128138 () Bool)

(declare-fun res!753929 () Bool)

(assert (=> b!1128138 (=> (not res!753929) (not e!642057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128138 (= res!753929 (validKeyInArray!0 k0!934))))

(declare-fun b!1128139 () Bool)

(assert (=> b!1128139 (= e!642062 (= call!47795 call!47794))))

(declare-fun mapNonEmpty!44380 () Bool)

(declare-fun tp!84239 () Bool)

(declare-fun e!642060 () Bool)

(assert (=> mapNonEmpty!44380 (= mapRes!44380 (and tp!84239 e!642060))))

(declare-fun mapValue!44380 () ValueCell!13478)

(declare-fun mapRest!44380 () (Array (_ BitVec 32) ValueCell!13478))

(declare-fun mapKey!44380 () (_ BitVec 32))

(assert (=> mapNonEmpty!44380 (= (arr!35422 _values!996) (store mapRest!44380 mapKey!44380 mapValue!44380))))

(declare-fun b!1128140 () Bool)

(declare-fun res!753924 () Bool)

(assert (=> b!1128140 (=> (not res!753924) (not e!642057))))

(assert (=> b!1128140 (= res!753924 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24772))))

(declare-fun b!1128141 () Bool)

(declare-fun res!753919 () Bool)

(assert (=> b!1128141 (=> (not res!753919) (not e!642057))))

(assert (=> b!1128141 (= res!753919 (and (= (size!35960 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35959 _keys!1208) (size!35960 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128142 () Bool)

(assert (=> b!1128142 (= e!642057 e!642066)))

(declare-fun res!753923 () Bool)

(assert (=> b!1128142 (=> (not res!753923) (not e!642066))))

(assert (=> b!1128142 (= res!753923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500694 mask!1564))))

(assert (=> b!1128142 (= lt!500694 (array!73537 (store (arr!35421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35959 _keys!1208)))))

(declare-fun b!1128143 () Bool)

(declare-fun res!753921 () Bool)

(assert (=> b!1128143 (=> (not res!753921) (not e!642057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128143 (= res!753921 (validMask!0 mask!1564))))

(declare-fun b!1128144 () Bool)

(declare-fun res!753926 () Bool)

(assert (=> b!1128144 (=> (not res!753926) (not e!642057))))

(assert (=> b!1128144 (= res!753926 (= (select (arr!35421 _keys!1208) i!673) k0!934))))

(declare-fun b!1128145 () Bool)

(assert (=> b!1128145 (= e!642060 tp_is_empty!28375)))

(declare-fun b!1128146 () Bool)

(assert (=> b!1128146 (= e!642058 (and e!642065 mapRes!44380))))

(declare-fun condMapEmpty!44380 () Bool)

(declare-fun mapDefault!44380 () ValueCell!13478)

(assert (=> b!1128146 (= condMapEmpty!44380 (= (arr!35422 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13478)) mapDefault!44380)))))

(declare-fun b!1128147 () Bool)

(assert (=> b!1128147 (= e!642063 e!642064)))

(declare-fun res!753920 () Bool)

(assert (=> b!1128147 (=> res!753920 e!642064)))

(assert (=> b!1128147 (= res!753920 (not (= from!1455 i!673)))))

(declare-fun lt!500699 () ListLongMap!15989)

(assert (=> b!1128147 (= lt!500699 (getCurrentListMapNoExtraKeys!4510 lt!500694 lt!500698 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2521 (Int (_ BitVec 64)) V!42961)

(assert (=> b!1128147 (= lt!500698 (array!73539 (store (arr!35422 _values!996) i!673 (ValueCellFull!13478 (dynLambda!2521 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35960 _values!996)))))

(declare-fun lt!500697 () ListLongMap!15989)

(assert (=> b!1128147 (= lt!500697 (getCurrentListMapNoExtraKeys!4510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98138 res!753925) b!1128143))

(assert (= (and b!1128143 res!753921) b!1128141))

(assert (= (and b!1128141 res!753919) b!1128134))

(assert (= (and b!1128134 res!753928) b!1128140))

(assert (= (and b!1128140 res!753924) b!1128131))

(assert (= (and b!1128131 res!753931) b!1128138))

(assert (= (and b!1128138 res!753929) b!1128144))

(assert (= (and b!1128144 res!753926) b!1128142))

(assert (= (and b!1128142 res!753923) b!1128137))

(assert (= (and b!1128137 res!753927) b!1128132))

(assert (= (and b!1128132 (not res!753922)) b!1128147))

(assert (= (and b!1128147 (not res!753920)) b!1128135))

(assert (= (and b!1128135 c!109731) b!1128130))

(assert (= (and b!1128135 (not c!109731)) b!1128139))

(assert (= (or b!1128130 b!1128139) bm!47791))

(assert (= (or b!1128130 b!1128139) bm!47792))

(assert (= (and b!1128135 (not res!753930)) b!1128133))

(assert (= (and b!1128146 condMapEmpty!44380) mapIsEmpty!44380))

(assert (= (and b!1128146 (not condMapEmpty!44380)) mapNonEmpty!44380))

(get-info :version)

(assert (= (and mapNonEmpty!44380 ((_ is ValueCellFull!13478) mapValue!44380)) b!1128145))

(assert (= (and b!1128146 ((_ is ValueCellFull!13478) mapDefault!44380)) b!1128136))

(assert (= start!98138 b!1128146))

(declare-fun b_lambda!18797 () Bool)

(assert (=> (not b_lambda!18797) (not b!1128147)))

(declare-fun t!35601 () Bool)

(declare-fun tb!8649 () Bool)

(assert (=> (and start!98138 (= defaultEntry!1004 defaultEntry!1004) t!35601) tb!8649))

(declare-fun result!17867 () Bool)

(assert (=> tb!8649 (= result!17867 tp_is_empty!28375)))

(assert (=> b!1128147 t!35601))

(declare-fun b_and!38453 () Bool)

(assert (= b_and!38451 (and (=> t!35601 result!17867) b_and!38453)))

(declare-fun m!1041261 () Bool)

(assert (=> b!1128132 m!1041261))

(declare-fun m!1041263 () Bool)

(assert (=> b!1128132 m!1041263))

(declare-fun m!1041265 () Bool)

(assert (=> bm!47792 m!1041265))

(declare-fun m!1041267 () Bool)

(assert (=> b!1128138 m!1041267))

(declare-fun m!1041269 () Bool)

(assert (=> b!1128144 m!1041269))

(assert (=> b!1128133 m!1041265))

(assert (=> b!1128133 m!1041265))

(declare-fun m!1041271 () Bool)

(assert (=> b!1128133 m!1041271))

(declare-fun m!1041273 () Bool)

(assert (=> b!1128147 m!1041273))

(declare-fun m!1041275 () Bool)

(assert (=> b!1128147 m!1041275))

(declare-fun m!1041277 () Bool)

(assert (=> b!1128147 m!1041277))

(declare-fun m!1041279 () Bool)

(assert (=> b!1128147 m!1041279))

(declare-fun m!1041281 () Bool)

(assert (=> b!1128137 m!1041281))

(declare-fun m!1041283 () Bool)

(assert (=> b!1128142 m!1041283))

(declare-fun m!1041285 () Bool)

(assert (=> b!1128142 m!1041285))

(declare-fun m!1041287 () Bool)

(assert (=> b!1128135 m!1041287))

(declare-fun m!1041289 () Bool)

(assert (=> b!1128135 m!1041289))

(declare-fun m!1041291 () Bool)

(assert (=> b!1128140 m!1041291))

(declare-fun m!1041293 () Bool)

(assert (=> start!98138 m!1041293))

(declare-fun m!1041295 () Bool)

(assert (=> start!98138 m!1041295))

(declare-fun m!1041297 () Bool)

(assert (=> b!1128130 m!1041297))

(declare-fun m!1041299 () Bool)

(assert (=> bm!47791 m!1041299))

(declare-fun m!1041301 () Bool)

(assert (=> b!1128134 m!1041301))

(declare-fun m!1041303 () Bool)

(assert (=> mapNonEmpty!44380 m!1041303))

(declare-fun m!1041305 () Bool)

(assert (=> b!1128143 m!1041305))

(check-sat (not b!1128135) (not b!1128140) (not b!1128133) (not b!1128132) tp_is_empty!28375 (not start!98138) (not b!1128143) (not b!1128134) (not b_next!23845) b_and!38453 (not b!1128138) (not mapNonEmpty!44380) (not bm!47792) (not bm!47791) (not b!1128137) (not b!1128147) (not b_lambda!18797) (not b!1128130) (not b!1128142))
(check-sat b_and!38453 (not b_next!23845))

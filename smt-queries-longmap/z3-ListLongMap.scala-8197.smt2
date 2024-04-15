; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100042 () Bool)

(assert start!100042)

(declare-fun b_free!25627 () Bool)

(declare-fun b_next!25627 () Bool)

(assert (=> start!100042 (= b_free!25627 (not b_next!25627))))

(declare-fun tp!89595 () Bool)

(declare-fun b_and!42099 () Bool)

(assert (=> start!100042 (= tp!89595 b_and!42099)))

(declare-fun b!1192284 () Bool)

(declare-fun res!793155 () Bool)

(declare-fun e!677692 () Bool)

(assert (=> b!1192284 (=> (not res!793155) (not e!677692))))

(declare-datatypes ((array!77032 0))(
  ( (array!77033 (arr!37166 (Array (_ BitVec 32) (_ BitVec 64))) (size!37704 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77032)

(declare-datatypes ((List!26280 0))(
  ( (Nil!26277) (Cons!26276 (h!27485 (_ BitVec 64)) (t!38890 List!26280)) )
))
(declare-fun arrayNoDuplicates!0 (array!77032 (_ BitVec 32) List!26280) Bool)

(assert (=> b!1192284 (= res!793155 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26277))))

(declare-fun b!1192285 () Bool)

(declare-fun res!793162 () Bool)

(assert (=> b!1192285 (=> (not res!793162) (not e!677692))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77032 (_ BitVec 32)) Bool)

(assert (=> b!1192285 (= res!793162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192286 () Bool)

(declare-fun e!677691 () Bool)

(declare-fun tp_is_empty!30157 () Bool)

(assert (=> b!1192286 (= e!677691 tp_is_empty!30157)))

(declare-fun b!1192287 () Bool)

(declare-fun e!677688 () Bool)

(assert (=> b!1192287 (= e!677692 e!677688)))

(declare-fun res!793161 () Bool)

(assert (=> b!1192287 (=> (not res!793161) (not e!677688))))

(declare-fun lt!542013 () array!77032)

(assert (=> b!1192287 (= res!793161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542013 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192287 (= lt!542013 (array!77033 (store (arr!37166 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37704 _keys!1208)))))

(declare-fun b!1192288 () Bool)

(declare-fun e!677690 () Bool)

(declare-fun mapRes!47063 () Bool)

(assert (=> b!1192288 (= e!677690 (and e!677691 mapRes!47063))))

(declare-fun condMapEmpty!47063 () Bool)

(declare-datatypes ((V!45337 0))(
  ( (V!45338 (val!15135 Int)) )
))
(declare-datatypes ((ValueCell!14369 0))(
  ( (ValueCellFull!14369 (v!17772 V!45337)) (EmptyCell!14369) )
))
(declare-datatypes ((array!77034 0))(
  ( (array!77035 (arr!37167 (Array (_ BitVec 32) ValueCell!14369)) (size!37705 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77034)

(declare-fun mapDefault!47063 () ValueCell!14369)

(assert (=> b!1192288 (= condMapEmpty!47063 (= (arr!37167 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14369)) mapDefault!47063)))))

(declare-fun b!1192289 () Bool)

(declare-fun e!677687 () Bool)

(assert (=> b!1192289 (= e!677687 true)))

(declare-fun zeroValue!944 () V!45337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45337)

(declare-fun lt!542016 () array!77034)

(declare-datatypes ((tuple2!19566 0))(
  ( (tuple2!19567 (_1!9794 (_ BitVec 64)) (_2!9794 V!45337)) )
))
(declare-datatypes ((List!26281 0))(
  ( (Nil!26278) (Cons!26277 (h!27486 tuple2!19566) (t!38891 List!26281)) )
))
(declare-datatypes ((ListLongMap!17535 0))(
  ( (ListLongMap!17536 (toList!8783 List!26281)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5233 (array!77032 array!77034 (_ BitVec 32) (_ BitVec 32) V!45337 V!45337 (_ BitVec 32) Int) ListLongMap!17535)

(declare-fun -!1725 (ListLongMap!17535 (_ BitVec 64)) ListLongMap!17535)

(assert (=> b!1192289 (= (getCurrentListMapNoExtraKeys!5233 lt!542013 lt!542016 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1725 (getCurrentListMapNoExtraKeys!5233 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39433 0))(
  ( (Unit!39434) )
))
(declare-fun lt!542011 () Unit!39433)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!975 (array!77032 array!77034 (_ BitVec 32) (_ BitVec 32) V!45337 V!45337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39433)

(assert (=> b!1192289 (= lt!542011 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!975 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192290 () Bool)

(declare-fun e!677686 () Bool)

(assert (=> b!1192290 (= e!677686 tp_is_empty!30157)))

(declare-fun b!1192291 () Bool)

(declare-fun res!793154 () Bool)

(assert (=> b!1192291 (=> (not res!793154) (not e!677692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192291 (= res!793154 (validKeyInArray!0 k0!934))))

(declare-fun b!1192292 () Bool)

(declare-fun res!793159 () Bool)

(assert (=> b!1192292 (=> (not res!793159) (not e!677692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192292 (= res!793159 (validMask!0 mask!1564))))

(declare-fun res!793160 () Bool)

(assert (=> start!100042 (=> (not res!793160) (not e!677692))))

(assert (=> start!100042 (= res!793160 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37704 _keys!1208))))))

(assert (=> start!100042 e!677692))

(assert (=> start!100042 tp_is_empty!30157))

(declare-fun array_inv!28464 (array!77032) Bool)

(assert (=> start!100042 (array_inv!28464 _keys!1208)))

(assert (=> start!100042 true))

(assert (=> start!100042 tp!89595))

(declare-fun array_inv!28465 (array!77034) Bool)

(assert (=> start!100042 (and (array_inv!28465 _values!996) e!677690)))

(declare-fun mapNonEmpty!47063 () Bool)

(declare-fun tp!89594 () Bool)

(assert (=> mapNonEmpty!47063 (= mapRes!47063 (and tp!89594 e!677686))))

(declare-fun mapValue!47063 () ValueCell!14369)

(declare-fun mapRest!47063 () (Array (_ BitVec 32) ValueCell!14369))

(declare-fun mapKey!47063 () (_ BitVec 32))

(assert (=> mapNonEmpty!47063 (= (arr!37167 _values!996) (store mapRest!47063 mapKey!47063 mapValue!47063))))

(declare-fun mapIsEmpty!47063 () Bool)

(assert (=> mapIsEmpty!47063 mapRes!47063))

(declare-fun b!1192293 () Bool)

(declare-fun res!793157 () Bool)

(assert (=> b!1192293 (=> (not res!793157) (not e!677688))))

(assert (=> b!1192293 (= res!793157 (arrayNoDuplicates!0 lt!542013 #b00000000000000000000000000000000 Nil!26277))))

(declare-fun b!1192294 () Bool)

(declare-fun e!677685 () Bool)

(assert (=> b!1192294 (= e!677685 e!677687)))

(declare-fun res!793163 () Bool)

(assert (=> b!1192294 (=> res!793163 e!677687)))

(assert (=> b!1192294 (= res!793163 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542012 () ListLongMap!17535)

(assert (=> b!1192294 (= lt!542012 (getCurrentListMapNoExtraKeys!5233 lt!542013 lt!542016 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3119 (Int (_ BitVec 64)) V!45337)

(assert (=> b!1192294 (= lt!542016 (array!77035 (store (arr!37167 _values!996) i!673 (ValueCellFull!14369 (dynLambda!3119 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37705 _values!996)))))

(declare-fun lt!542015 () ListLongMap!17535)

(assert (=> b!1192294 (= lt!542015 (getCurrentListMapNoExtraKeys!5233 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192295 () Bool)

(declare-fun res!793156 () Bool)

(assert (=> b!1192295 (=> (not res!793156) (not e!677692))))

(assert (=> b!1192295 (= res!793156 (and (= (size!37705 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37704 _keys!1208) (size!37705 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192296 () Bool)

(declare-fun res!793164 () Bool)

(assert (=> b!1192296 (=> (not res!793164) (not e!677692))))

(assert (=> b!1192296 (= res!793164 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37704 _keys!1208))))))

(declare-fun b!1192297 () Bool)

(assert (=> b!1192297 (= e!677688 (not e!677685))))

(declare-fun res!793165 () Bool)

(assert (=> b!1192297 (=> res!793165 e!677685)))

(assert (=> b!1192297 (= res!793165 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192297 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542014 () Unit!39433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77032 (_ BitVec 64) (_ BitVec 32)) Unit!39433)

(assert (=> b!1192297 (= lt!542014 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192298 () Bool)

(declare-fun res!793158 () Bool)

(assert (=> b!1192298 (=> (not res!793158) (not e!677692))))

(assert (=> b!1192298 (= res!793158 (= (select (arr!37166 _keys!1208) i!673) k0!934))))

(assert (= (and start!100042 res!793160) b!1192292))

(assert (= (and b!1192292 res!793159) b!1192295))

(assert (= (and b!1192295 res!793156) b!1192285))

(assert (= (and b!1192285 res!793162) b!1192284))

(assert (= (and b!1192284 res!793155) b!1192296))

(assert (= (and b!1192296 res!793164) b!1192291))

(assert (= (and b!1192291 res!793154) b!1192298))

(assert (= (and b!1192298 res!793158) b!1192287))

(assert (= (and b!1192287 res!793161) b!1192293))

(assert (= (and b!1192293 res!793157) b!1192297))

(assert (= (and b!1192297 (not res!793165)) b!1192294))

(assert (= (and b!1192294 (not res!793163)) b!1192289))

(assert (= (and b!1192288 condMapEmpty!47063) mapIsEmpty!47063))

(assert (= (and b!1192288 (not condMapEmpty!47063)) mapNonEmpty!47063))

(get-info :version)

(assert (= (and mapNonEmpty!47063 ((_ is ValueCellFull!14369) mapValue!47063)) b!1192290))

(assert (= (and b!1192288 ((_ is ValueCellFull!14369) mapDefault!47063)) b!1192286))

(assert (= start!100042 b!1192288))

(declare-fun b_lambda!20753 () Bool)

(assert (=> (not b_lambda!20753) (not b!1192294)))

(declare-fun t!38889 () Bool)

(declare-fun tb!10431 () Bool)

(assert (=> (and start!100042 (= defaultEntry!1004 defaultEntry!1004) t!38889) tb!10431))

(declare-fun result!21437 () Bool)

(assert (=> tb!10431 (= result!21437 tp_is_empty!30157)))

(assert (=> b!1192294 t!38889))

(declare-fun b_and!42101 () Bool)

(assert (= b_and!42099 (and (=> t!38889 result!21437) b_and!42101)))

(declare-fun m!1100159 () Bool)

(assert (=> b!1192284 m!1100159))

(declare-fun m!1100161 () Bool)

(assert (=> b!1192293 m!1100161))

(declare-fun m!1100163 () Bool)

(assert (=> b!1192291 m!1100163))

(declare-fun m!1100165 () Bool)

(assert (=> mapNonEmpty!47063 m!1100165))

(declare-fun m!1100167 () Bool)

(assert (=> b!1192289 m!1100167))

(declare-fun m!1100169 () Bool)

(assert (=> b!1192289 m!1100169))

(assert (=> b!1192289 m!1100169))

(declare-fun m!1100171 () Bool)

(assert (=> b!1192289 m!1100171))

(declare-fun m!1100173 () Bool)

(assert (=> b!1192289 m!1100173))

(declare-fun m!1100175 () Bool)

(assert (=> b!1192298 m!1100175))

(declare-fun m!1100177 () Bool)

(assert (=> b!1192287 m!1100177))

(declare-fun m!1100179 () Bool)

(assert (=> b!1192287 m!1100179))

(declare-fun m!1100181 () Bool)

(assert (=> b!1192292 m!1100181))

(declare-fun m!1100183 () Bool)

(assert (=> b!1192285 m!1100183))

(declare-fun m!1100185 () Bool)

(assert (=> b!1192294 m!1100185))

(declare-fun m!1100187 () Bool)

(assert (=> b!1192294 m!1100187))

(declare-fun m!1100189 () Bool)

(assert (=> b!1192294 m!1100189))

(declare-fun m!1100191 () Bool)

(assert (=> b!1192294 m!1100191))

(declare-fun m!1100193 () Bool)

(assert (=> b!1192297 m!1100193))

(declare-fun m!1100195 () Bool)

(assert (=> b!1192297 m!1100195))

(declare-fun m!1100197 () Bool)

(assert (=> start!100042 m!1100197))

(declare-fun m!1100199 () Bool)

(assert (=> start!100042 m!1100199))

(check-sat (not b!1192293) (not b_next!25627) (not start!100042) (not b!1192297) (not b!1192287) (not b!1192291) (not b!1192294) b_and!42101 (not b!1192292) (not b!1192285) (not mapNonEmpty!47063) (not b!1192289) tp_is_empty!30157 (not b!1192284) (not b_lambda!20753))
(check-sat b_and!42101 (not b_next!25627))

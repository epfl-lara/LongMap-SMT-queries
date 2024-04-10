; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99882 () Bool)

(assert start!99882)

(declare-fun b_free!25461 () Bool)

(declare-fun b_next!25461 () Bool)

(assert (=> start!99882 (= b_free!25461 (not b_next!25461))))

(declare-fun tp!89096 () Bool)

(declare-fun b_and!41789 () Bool)

(assert (=> start!99882 (= tp!89096 b_and!41789)))

(declare-fun b!1188507 () Bool)

(declare-fun res!790240 () Bool)

(declare-fun e!675777 () Bool)

(assert (=> b!1188507 (=> (not res!790240) (not e!675777))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188507 (= res!790240 (validKeyInArray!0 k0!934))))

(declare-fun b!1188508 () Bool)

(declare-fun res!790234 () Bool)

(declare-fun e!675775 () Bool)

(assert (=> b!1188508 (=> (not res!790234) (not e!675775))))

(declare-datatypes ((array!76777 0))(
  ( (array!76778 (arr!37038 (Array (_ BitVec 32) (_ BitVec 64))) (size!37574 (_ BitVec 32))) )
))
(declare-fun lt!540711 () array!76777)

(declare-datatypes ((List!26072 0))(
  ( (Nil!26069) (Cons!26068 (h!27277 (_ BitVec 64)) (t!38525 List!26072)) )
))
(declare-fun arrayNoDuplicates!0 (array!76777 (_ BitVec 32) List!26072) Bool)

(assert (=> b!1188508 (= res!790234 (arrayNoDuplicates!0 lt!540711 #b00000000000000000000000000000000 Nil!26069))))

(declare-fun b!1188509 () Bool)

(declare-fun e!675771 () Bool)

(declare-fun e!675776 () Bool)

(assert (=> b!1188509 (= e!675771 e!675776)))

(declare-fun res!790236 () Bool)

(assert (=> b!1188509 (=> res!790236 e!675776)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188509 (= res!790236 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45115 0))(
  ( (V!45116 (val!15052 Int)) )
))
(declare-fun zeroValue!944 () V!45115)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19330 0))(
  ( (tuple2!19331 (_1!9676 (_ BitVec 64)) (_2!9676 V!45115)) )
))
(declare-datatypes ((List!26073 0))(
  ( (Nil!26070) (Cons!26069 (h!27278 tuple2!19330) (t!38526 List!26073)) )
))
(declare-datatypes ((ListLongMap!17299 0))(
  ( (ListLongMap!17300 (toList!8665 List!26073)) )
))
(declare-fun lt!540713 () ListLongMap!17299)

(declare-datatypes ((ValueCell!14286 0))(
  ( (ValueCellFull!14286 (v!17690 V!45115)) (EmptyCell!14286) )
))
(declare-datatypes ((array!76779 0))(
  ( (array!76780 (arr!37039 (Array (_ BitVec 32) ValueCell!14286)) (size!37575 (_ BitVec 32))) )
))
(declare-fun lt!540709 () array!76779)

(declare-fun minValue!944 () V!45115)

(declare-fun getCurrentListMapNoExtraKeys!5106 (array!76777 array!76779 (_ BitVec 32) (_ BitVec 32) V!45115 V!45115 (_ BitVec 32) Int) ListLongMap!17299)

(assert (=> b!1188509 (= lt!540713 (getCurrentListMapNoExtraKeys!5106 lt!540711 lt!540709 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76779)

(declare-fun dynLambda!3050 (Int (_ BitVec 64)) V!45115)

(assert (=> b!1188509 (= lt!540709 (array!76780 (store (arr!37039 _values!996) i!673 (ValueCellFull!14286 (dynLambda!3050 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37575 _values!996)))))

(declare-fun _keys!1208 () array!76777)

(declare-fun lt!540710 () ListLongMap!17299)

(assert (=> b!1188509 (= lt!540710 (getCurrentListMapNoExtraKeys!5106 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188510 () Bool)

(declare-fun res!790235 () Bool)

(assert (=> b!1188510 (=> (not res!790235) (not e!675777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76777 (_ BitVec 32)) Bool)

(assert (=> b!1188510 (= res!790235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46814 () Bool)

(declare-fun mapRes!46814 () Bool)

(declare-fun tp!89097 () Bool)

(declare-fun e!675773 () Bool)

(assert (=> mapNonEmpty!46814 (= mapRes!46814 (and tp!89097 e!675773))))

(declare-fun mapKey!46814 () (_ BitVec 32))

(declare-fun mapRest!46814 () (Array (_ BitVec 32) ValueCell!14286))

(declare-fun mapValue!46814 () ValueCell!14286)

(assert (=> mapNonEmpty!46814 (= (arr!37039 _values!996) (store mapRest!46814 mapKey!46814 mapValue!46814))))

(declare-fun b!1188511 () Bool)

(declare-fun res!790239 () Bool)

(assert (=> b!1188511 (=> (not res!790239) (not e!675777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188511 (= res!790239 (validMask!0 mask!1564))))

(declare-fun b!1188513 () Bool)

(declare-fun tp_is_empty!29991 () Bool)

(assert (=> b!1188513 (= e!675773 tp_is_empty!29991)))

(declare-fun mapIsEmpty!46814 () Bool)

(assert (=> mapIsEmpty!46814 mapRes!46814))

(declare-fun b!1188514 () Bool)

(assert (=> b!1188514 (= e!675777 e!675775)))

(declare-fun res!790238 () Bool)

(assert (=> b!1188514 (=> (not res!790238) (not e!675775))))

(assert (=> b!1188514 (= res!790238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540711 mask!1564))))

(assert (=> b!1188514 (= lt!540711 (array!76778 (store (arr!37038 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37574 _keys!1208)))))

(declare-fun b!1188515 () Bool)

(assert (=> b!1188515 (= e!675776 true)))

(declare-fun -!1695 (ListLongMap!17299 (_ BitVec 64)) ListLongMap!17299)

(assert (=> b!1188515 (= (getCurrentListMapNoExtraKeys!5106 lt!540711 lt!540709 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1695 (getCurrentListMapNoExtraKeys!5106 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39428 0))(
  ( (Unit!39429) )
))
(declare-fun lt!540712 () Unit!39428)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!904 (array!76777 array!76779 (_ BitVec 32) (_ BitVec 32) V!45115 V!45115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39428)

(assert (=> b!1188515 (= lt!540712 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!904 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188516 () Bool)

(declare-fun e!675774 () Bool)

(assert (=> b!1188516 (= e!675774 tp_is_empty!29991)))

(declare-fun b!1188517 () Bool)

(declare-fun res!790241 () Bool)

(assert (=> b!1188517 (=> (not res!790241) (not e!675777))))

(assert (=> b!1188517 (= res!790241 (and (= (size!37575 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37574 _keys!1208) (size!37575 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188518 () Bool)

(assert (=> b!1188518 (= e!675775 (not e!675771))))

(declare-fun res!790243 () Bool)

(assert (=> b!1188518 (=> res!790243 e!675771)))

(assert (=> b!1188518 (= res!790243 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188518 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540714 () Unit!39428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76777 (_ BitVec 64) (_ BitVec 32)) Unit!39428)

(assert (=> b!1188518 (= lt!540714 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188519 () Bool)

(declare-fun res!790232 () Bool)

(assert (=> b!1188519 (=> (not res!790232) (not e!675777))))

(assert (=> b!1188519 (= res!790232 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37574 _keys!1208))))))

(declare-fun b!1188520 () Bool)

(declare-fun e!675778 () Bool)

(assert (=> b!1188520 (= e!675778 (and e!675774 mapRes!46814))))

(declare-fun condMapEmpty!46814 () Bool)

(declare-fun mapDefault!46814 () ValueCell!14286)

(assert (=> b!1188520 (= condMapEmpty!46814 (= (arr!37039 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14286)) mapDefault!46814)))))

(declare-fun b!1188521 () Bool)

(declare-fun res!790237 () Bool)

(assert (=> b!1188521 (=> (not res!790237) (not e!675777))))

(assert (=> b!1188521 (= res!790237 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26069))))

(declare-fun res!790242 () Bool)

(assert (=> start!99882 (=> (not res!790242) (not e!675777))))

(assert (=> start!99882 (= res!790242 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37574 _keys!1208))))))

(assert (=> start!99882 e!675777))

(assert (=> start!99882 tp_is_empty!29991))

(declare-fun array_inv!28256 (array!76777) Bool)

(assert (=> start!99882 (array_inv!28256 _keys!1208)))

(assert (=> start!99882 true))

(assert (=> start!99882 tp!89096))

(declare-fun array_inv!28257 (array!76779) Bool)

(assert (=> start!99882 (and (array_inv!28257 _values!996) e!675778)))

(declare-fun b!1188512 () Bool)

(declare-fun res!790233 () Bool)

(assert (=> b!1188512 (=> (not res!790233) (not e!675777))))

(assert (=> b!1188512 (= res!790233 (= (select (arr!37038 _keys!1208) i!673) k0!934))))

(assert (= (and start!99882 res!790242) b!1188511))

(assert (= (and b!1188511 res!790239) b!1188517))

(assert (= (and b!1188517 res!790241) b!1188510))

(assert (= (and b!1188510 res!790235) b!1188521))

(assert (= (and b!1188521 res!790237) b!1188519))

(assert (= (and b!1188519 res!790232) b!1188507))

(assert (= (and b!1188507 res!790240) b!1188512))

(assert (= (and b!1188512 res!790233) b!1188514))

(assert (= (and b!1188514 res!790238) b!1188508))

(assert (= (and b!1188508 res!790234) b!1188518))

(assert (= (and b!1188518 (not res!790243)) b!1188509))

(assert (= (and b!1188509 (not res!790236)) b!1188515))

(assert (= (and b!1188520 condMapEmpty!46814) mapIsEmpty!46814))

(assert (= (and b!1188520 (not condMapEmpty!46814)) mapNonEmpty!46814))

(get-info :version)

(assert (= (and mapNonEmpty!46814 ((_ is ValueCellFull!14286) mapValue!46814)) b!1188513))

(assert (= (and b!1188520 ((_ is ValueCellFull!14286) mapDefault!46814)) b!1188516))

(assert (= start!99882 b!1188520))

(declare-fun b_lambda!20605 () Bool)

(assert (=> (not b_lambda!20605) (not b!1188509)))

(declare-fun t!38524 () Bool)

(declare-fun tb!10273 () Bool)

(assert (=> (and start!99882 (= defaultEntry!1004 defaultEntry!1004) t!38524) tb!10273))

(declare-fun result!21113 () Bool)

(assert (=> tb!10273 (= result!21113 tp_is_empty!29991)))

(assert (=> b!1188509 t!38524))

(declare-fun b_and!41791 () Bool)

(assert (= b_and!41789 (and (=> t!38524 result!21113) b_and!41791)))

(declare-fun m!1097283 () Bool)

(assert (=> b!1188512 m!1097283))

(declare-fun m!1097285 () Bool)

(assert (=> mapNonEmpty!46814 m!1097285))

(declare-fun m!1097287 () Bool)

(assert (=> start!99882 m!1097287))

(declare-fun m!1097289 () Bool)

(assert (=> start!99882 m!1097289))

(declare-fun m!1097291 () Bool)

(assert (=> b!1188507 m!1097291))

(declare-fun m!1097293 () Bool)

(assert (=> b!1188521 m!1097293))

(declare-fun m!1097295 () Bool)

(assert (=> b!1188514 m!1097295))

(declare-fun m!1097297 () Bool)

(assert (=> b!1188514 m!1097297))

(declare-fun m!1097299 () Bool)

(assert (=> b!1188511 m!1097299))

(declare-fun m!1097301 () Bool)

(assert (=> b!1188515 m!1097301))

(declare-fun m!1097303 () Bool)

(assert (=> b!1188515 m!1097303))

(assert (=> b!1188515 m!1097303))

(declare-fun m!1097305 () Bool)

(assert (=> b!1188515 m!1097305))

(declare-fun m!1097307 () Bool)

(assert (=> b!1188515 m!1097307))

(declare-fun m!1097309 () Bool)

(assert (=> b!1188510 m!1097309))

(declare-fun m!1097311 () Bool)

(assert (=> b!1188509 m!1097311))

(declare-fun m!1097313 () Bool)

(assert (=> b!1188509 m!1097313))

(declare-fun m!1097315 () Bool)

(assert (=> b!1188509 m!1097315))

(declare-fun m!1097317 () Bool)

(assert (=> b!1188509 m!1097317))

(declare-fun m!1097319 () Bool)

(assert (=> b!1188518 m!1097319))

(declare-fun m!1097321 () Bool)

(assert (=> b!1188518 m!1097321))

(declare-fun m!1097323 () Bool)

(assert (=> b!1188508 m!1097323))

(check-sat (not mapNonEmpty!46814) (not b!1188518) (not start!99882) b_and!41791 (not b!1188521) (not b!1188514) (not b!1188509) (not b!1188515) tp_is_empty!29991 (not b!1188510) (not b_next!25461) (not b_lambda!20605) (not b!1188508) (not b!1188511) (not b!1188507))
(check-sat b_and!41791 (not b_next!25461))

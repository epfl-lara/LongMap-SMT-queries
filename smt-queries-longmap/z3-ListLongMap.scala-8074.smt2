; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99312 () Bool)

(assert start!99312)

(declare-fun b_free!24891 () Bool)

(declare-fun b_next!24891 () Bool)

(assert (=> start!99312 (= b_free!24891 (not b_next!24891))))

(declare-fun tp!87386 () Bool)

(declare-fun b_and!40649 () Bool)

(assert (=> start!99312 (= tp!87386 b_and!40649)))

(declare-fun b!1170425 () Bool)

(declare-fun e!665236 () Bool)

(declare-fun e!665241 () Bool)

(assert (=> b!1170425 (= e!665236 e!665241)))

(declare-fun res!776767 () Bool)

(assert (=> b!1170425 (=> res!776767 e!665241)))

(declare-datatypes ((array!75661 0))(
  ( (array!75662 (arr!36480 (Array (_ BitVec 32) (_ BitVec 64))) (size!37016 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75661)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170425 (= res!776767 (not (= (select (arr!36480 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665239 () Bool)

(assert (=> b!1170425 e!665239))

(declare-fun res!776769 () Bool)

(assert (=> b!1170425 (=> (not res!776769) (not e!665239))))

(declare-datatypes ((V!44355 0))(
  ( (V!44356 (val!14767 Int)) )
))
(declare-datatypes ((tuple2!18858 0))(
  ( (tuple2!18859 (_1!9440 (_ BitVec 64)) (_2!9440 V!44355)) )
))
(declare-datatypes ((List!25594 0))(
  ( (Nil!25591) (Cons!25590 (h!26799 tuple2!18858) (t!37477 List!25594)) )
))
(declare-datatypes ((ListLongMap!16827 0))(
  ( (ListLongMap!16828 (toList!8429 List!25594)) )
))
(declare-fun lt!527136 () ListLongMap!16827)

(declare-fun lt!527132 () V!44355)

(declare-datatypes ((ValueCell!14001 0))(
  ( (ValueCellFull!14001 (v!17405 V!44355)) (EmptyCell!14001) )
))
(declare-datatypes ((array!75663 0))(
  ( (array!75664 (arr!36481 (Array (_ BitVec 32) ValueCell!14001)) (size!37017 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75663)

(declare-fun lt!527130 () ListLongMap!16827)

(declare-fun +!3758 (ListLongMap!16827 tuple2!18858) ListLongMap!16827)

(declare-fun get!18602 (ValueCell!14001 V!44355) V!44355)

(assert (=> b!1170425 (= res!776769 (= lt!527136 (+!3758 lt!527130 (tuple2!18859 (select (arr!36480 _keys!1208) from!1455) (get!18602 (select (arr!36481 _values!996) from!1455) lt!527132)))))))

(declare-fun b!1170426 () Bool)

(declare-fun res!776771 () Bool)

(declare-fun e!665237 () Bool)

(assert (=> b!1170426 (=> (not res!776771) (not e!665237))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170426 (= res!776771 (= (select (arr!36480 _keys!1208) i!673) k0!934))))

(declare-fun b!1170427 () Bool)

(declare-fun res!776761 () Bool)

(assert (=> b!1170427 (=> (not res!776761) (not e!665237))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1170427 (= res!776761 (and (= (size!37017 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37016 _keys!1208) (size!37017 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170428 () Bool)

(declare-fun res!776772 () Bool)

(declare-fun e!665240 () Bool)

(assert (=> b!1170428 (=> (not res!776772) (not e!665240))))

(declare-fun lt!527129 () array!75661)

(declare-datatypes ((List!25595 0))(
  ( (Nil!25592) (Cons!25591 (h!26800 (_ BitVec 64)) (t!37478 List!25595)) )
))
(declare-fun arrayNoDuplicates!0 (array!75661 (_ BitVec 32) List!25595) Bool)

(assert (=> b!1170428 (= res!776772 (arrayNoDuplicates!0 lt!527129 #b00000000000000000000000000000000 Nil!25592))))

(declare-fun b!1170429 () Bool)

(declare-fun res!776776 () Bool)

(assert (=> b!1170429 (=> (not res!776776) (not e!665237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75661 (_ BitVec 32)) Bool)

(assert (=> b!1170429 (= res!776776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170430 () Bool)

(declare-fun res!776773 () Bool)

(assert (=> b!1170430 (=> (not res!776773) (not e!665237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170430 (= res!776773 (validMask!0 mask!1564))))

(declare-fun b!1170431 () Bool)

(declare-fun e!665243 () Bool)

(assert (=> b!1170431 (= e!665239 e!665243)))

(declare-fun res!776770 () Bool)

(assert (=> b!1170431 (=> res!776770 e!665243)))

(assert (=> b!1170431 (= res!776770 (not (= (select (arr!36480 _keys!1208) from!1455) k0!934)))))

(declare-fun res!776762 () Bool)

(assert (=> start!99312 (=> (not res!776762) (not e!665237))))

(assert (=> start!99312 (= res!776762 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37016 _keys!1208))))))

(assert (=> start!99312 e!665237))

(declare-fun tp_is_empty!29421 () Bool)

(assert (=> start!99312 tp_is_empty!29421))

(declare-fun array_inv!27884 (array!75661) Bool)

(assert (=> start!99312 (array_inv!27884 _keys!1208)))

(assert (=> start!99312 true))

(assert (=> start!99312 tp!87386))

(declare-fun e!665244 () Bool)

(declare-fun array_inv!27885 (array!75663) Bool)

(assert (=> start!99312 (and (array_inv!27885 _values!996) e!665244)))

(declare-fun mapIsEmpty!45959 () Bool)

(declare-fun mapRes!45959 () Bool)

(assert (=> mapIsEmpty!45959 mapRes!45959))

(declare-fun b!1170432 () Bool)

(declare-fun e!665238 () Bool)

(assert (=> b!1170432 (= e!665238 e!665236)))

(declare-fun res!776764 () Bool)

(assert (=> b!1170432 (=> res!776764 e!665236)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170432 (= res!776764 (not (validKeyInArray!0 (select (arr!36480 _keys!1208) from!1455))))))

(declare-fun lt!527126 () ListLongMap!16827)

(assert (=> b!1170432 (= lt!527126 lt!527130)))

(declare-fun lt!527135 () ListLongMap!16827)

(declare-fun -!1500 (ListLongMap!16827 (_ BitVec 64)) ListLongMap!16827)

(assert (=> b!1170432 (= lt!527130 (-!1500 lt!527135 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44355)

(declare-fun lt!527128 () array!75663)

(declare-fun zeroValue!944 () V!44355)

(declare-fun getCurrentListMapNoExtraKeys!4893 (array!75661 array!75663 (_ BitVec 32) (_ BitVec 32) V!44355 V!44355 (_ BitVec 32) Int) ListLongMap!16827)

(assert (=> b!1170432 (= lt!527126 (getCurrentListMapNoExtraKeys!4893 lt!527129 lt!527128 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170432 (= lt!527135 (getCurrentListMapNoExtraKeys!4893 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38612 0))(
  ( (Unit!38613) )
))
(declare-fun lt!527131 () Unit!38612)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!727 (array!75661 array!75663 (_ BitVec 32) (_ BitVec 32) V!44355 V!44355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38612)

(assert (=> b!1170432 (= lt!527131 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!727 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170433 () Bool)

(declare-fun e!665234 () Bool)

(assert (=> b!1170433 (= e!665240 (not e!665234))))

(declare-fun res!776765 () Bool)

(assert (=> b!1170433 (=> res!776765 e!665234)))

(assert (=> b!1170433 (= res!776765 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170433 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527134 () Unit!38612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75661 (_ BitVec 64) (_ BitVec 32)) Unit!38612)

(assert (=> b!1170433 (= lt!527134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45959 () Bool)

(declare-fun tp!87387 () Bool)

(declare-fun e!665245 () Bool)

(assert (=> mapNonEmpty!45959 (= mapRes!45959 (and tp!87387 e!665245))))

(declare-fun mapRest!45959 () (Array (_ BitVec 32) ValueCell!14001))

(declare-fun mapValue!45959 () ValueCell!14001)

(declare-fun mapKey!45959 () (_ BitVec 32))

(assert (=> mapNonEmpty!45959 (= (arr!36481 _values!996) (store mapRest!45959 mapKey!45959 mapValue!45959))))

(declare-fun b!1170434 () Bool)

(assert (=> b!1170434 (= e!665243 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170435 () Bool)

(declare-fun e!665242 () Bool)

(assert (=> b!1170435 (= e!665242 tp_is_empty!29421)))

(declare-fun b!1170436 () Bool)

(assert (=> b!1170436 (= e!665237 e!665240)))

(declare-fun res!776774 () Bool)

(assert (=> b!1170436 (=> (not res!776774) (not e!665240))))

(assert (=> b!1170436 (= res!776774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527129 mask!1564))))

(assert (=> b!1170436 (= lt!527129 (array!75662 (store (arr!36480 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37016 _keys!1208)))))

(declare-fun b!1170437 () Bool)

(declare-fun res!776768 () Bool)

(assert (=> b!1170437 (=> (not res!776768) (not e!665237))))

(assert (=> b!1170437 (= res!776768 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37016 _keys!1208))))))

(declare-fun b!1170438 () Bool)

(assert (=> b!1170438 (= e!665241 true)))

(assert (=> b!1170438 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527127 () Unit!38612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75661 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38612)

(assert (=> b!1170438 (= lt!527127 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170439 () Bool)

(assert (=> b!1170439 (= e!665244 (and e!665242 mapRes!45959))))

(declare-fun condMapEmpty!45959 () Bool)

(declare-fun mapDefault!45959 () ValueCell!14001)

(assert (=> b!1170439 (= condMapEmpty!45959 (= (arr!36481 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14001)) mapDefault!45959)))))

(declare-fun b!1170440 () Bool)

(assert (=> b!1170440 (= e!665245 tp_is_empty!29421)))

(declare-fun b!1170441 () Bool)

(declare-fun res!776766 () Bool)

(assert (=> b!1170441 (=> (not res!776766) (not e!665237))))

(assert (=> b!1170441 (= res!776766 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25592))))

(declare-fun b!1170442 () Bool)

(declare-fun res!776775 () Bool)

(assert (=> b!1170442 (=> (not res!776775) (not e!665237))))

(assert (=> b!1170442 (= res!776775 (validKeyInArray!0 k0!934))))

(declare-fun b!1170443 () Bool)

(assert (=> b!1170443 (= e!665234 e!665238)))

(declare-fun res!776763 () Bool)

(assert (=> b!1170443 (=> res!776763 e!665238)))

(assert (=> b!1170443 (= res!776763 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170443 (= lt!527136 (getCurrentListMapNoExtraKeys!4893 lt!527129 lt!527128 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170443 (= lt!527128 (array!75664 (store (arr!36481 _values!996) i!673 (ValueCellFull!14001 lt!527132)) (size!37017 _values!996)))))

(declare-fun dynLambda!2870 (Int (_ BitVec 64)) V!44355)

(assert (=> b!1170443 (= lt!527132 (dynLambda!2870 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527133 () ListLongMap!16827)

(assert (=> b!1170443 (= lt!527133 (getCurrentListMapNoExtraKeys!4893 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99312 res!776762) b!1170430))

(assert (= (and b!1170430 res!776773) b!1170427))

(assert (= (and b!1170427 res!776761) b!1170429))

(assert (= (and b!1170429 res!776776) b!1170441))

(assert (= (and b!1170441 res!776766) b!1170437))

(assert (= (and b!1170437 res!776768) b!1170442))

(assert (= (and b!1170442 res!776775) b!1170426))

(assert (= (and b!1170426 res!776771) b!1170436))

(assert (= (and b!1170436 res!776774) b!1170428))

(assert (= (and b!1170428 res!776772) b!1170433))

(assert (= (and b!1170433 (not res!776765)) b!1170443))

(assert (= (and b!1170443 (not res!776763)) b!1170432))

(assert (= (and b!1170432 (not res!776764)) b!1170425))

(assert (= (and b!1170425 res!776769) b!1170431))

(assert (= (and b!1170431 (not res!776770)) b!1170434))

(assert (= (and b!1170425 (not res!776767)) b!1170438))

(assert (= (and b!1170439 condMapEmpty!45959) mapIsEmpty!45959))

(assert (= (and b!1170439 (not condMapEmpty!45959)) mapNonEmpty!45959))

(get-info :version)

(assert (= (and mapNonEmpty!45959 ((_ is ValueCellFull!14001) mapValue!45959)) b!1170440))

(assert (= (and b!1170439 ((_ is ValueCellFull!14001) mapDefault!45959)) b!1170435))

(assert (= start!99312 b!1170439))

(declare-fun b_lambda!20035 () Bool)

(assert (=> (not b_lambda!20035) (not b!1170443)))

(declare-fun t!37476 () Bool)

(declare-fun tb!9703 () Bool)

(assert (=> (and start!99312 (= defaultEntry!1004 defaultEntry!1004) t!37476) tb!9703))

(declare-fun result!19973 () Bool)

(assert (=> tb!9703 (= result!19973 tp_is_empty!29421)))

(assert (=> b!1170443 t!37476))

(declare-fun b_and!40651 () Bool)

(assert (= b_and!40649 (and (=> t!37476 result!19973) b_and!40651)))

(declare-fun m!1078255 () Bool)

(assert (=> b!1170432 m!1078255))

(declare-fun m!1078257 () Bool)

(assert (=> b!1170432 m!1078257))

(declare-fun m!1078259 () Bool)

(assert (=> b!1170432 m!1078259))

(declare-fun m!1078261 () Bool)

(assert (=> b!1170432 m!1078261))

(assert (=> b!1170432 m!1078259))

(declare-fun m!1078263 () Bool)

(assert (=> b!1170432 m!1078263))

(declare-fun m!1078265 () Bool)

(assert (=> b!1170432 m!1078265))

(declare-fun m!1078267 () Bool)

(assert (=> b!1170434 m!1078267))

(declare-fun m!1078269 () Bool)

(assert (=> b!1170443 m!1078269))

(declare-fun m!1078271 () Bool)

(assert (=> b!1170443 m!1078271))

(declare-fun m!1078273 () Bool)

(assert (=> b!1170443 m!1078273))

(declare-fun m!1078275 () Bool)

(assert (=> b!1170443 m!1078275))

(assert (=> b!1170431 m!1078259))

(declare-fun m!1078277 () Bool)

(assert (=> b!1170436 m!1078277))

(declare-fun m!1078279 () Bool)

(assert (=> b!1170436 m!1078279))

(assert (=> b!1170425 m!1078259))

(declare-fun m!1078281 () Bool)

(assert (=> b!1170425 m!1078281))

(assert (=> b!1170425 m!1078281))

(declare-fun m!1078283 () Bool)

(assert (=> b!1170425 m!1078283))

(declare-fun m!1078285 () Bool)

(assert (=> b!1170425 m!1078285))

(declare-fun m!1078287 () Bool)

(assert (=> b!1170442 m!1078287))

(declare-fun m!1078289 () Bool)

(assert (=> b!1170430 m!1078289))

(declare-fun m!1078291 () Bool)

(assert (=> b!1170433 m!1078291))

(declare-fun m!1078293 () Bool)

(assert (=> b!1170433 m!1078293))

(declare-fun m!1078295 () Bool)

(assert (=> b!1170441 m!1078295))

(declare-fun m!1078297 () Bool)

(assert (=> b!1170428 m!1078297))

(declare-fun m!1078299 () Bool)

(assert (=> b!1170426 m!1078299))

(declare-fun m!1078301 () Bool)

(assert (=> b!1170429 m!1078301))

(declare-fun m!1078303 () Bool)

(assert (=> start!99312 m!1078303))

(declare-fun m!1078305 () Bool)

(assert (=> start!99312 m!1078305))

(declare-fun m!1078307 () Bool)

(assert (=> b!1170438 m!1078307))

(declare-fun m!1078309 () Bool)

(assert (=> b!1170438 m!1078309))

(declare-fun m!1078311 () Bool)

(assert (=> mapNonEmpty!45959 m!1078311))

(check-sat (not b!1170434) (not b!1170442) (not b!1170443) (not mapNonEmpty!45959) (not start!99312) (not b!1170433) (not b!1170430) (not b_lambda!20035) b_and!40651 (not b!1170429) (not b!1170436) (not b!1170438) (not b_next!24891) (not b!1170428) (not b!1170432) (not b!1170441) tp_is_empty!29421 (not b!1170425))
(check-sat b_and!40651 (not b_next!24891))

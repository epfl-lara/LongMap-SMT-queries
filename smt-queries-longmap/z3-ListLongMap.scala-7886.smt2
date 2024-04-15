; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98054 () Bool)

(assert start!98054)

(declare-fun b_free!23761 () Bool)

(declare-fun b_next!23761 () Bool)

(assert (=> start!98054 (= b_free!23761 (not b_next!23761))))

(declare-fun tp!83986 () Bool)

(declare-fun b_and!38283 () Bool)

(assert (=> start!98054 (= tp!83986 b_and!38283)))

(declare-fun b!1125769 () Bool)

(declare-fun e!640804 () Bool)

(declare-fun e!640798 () Bool)

(assert (=> b!1125769 (= e!640804 e!640798)))

(declare-fun res!752280 () Bool)

(assert (=> b!1125769 (=> (not res!752280) (not e!640798))))

(declare-datatypes ((array!73372 0))(
  ( (array!73373 (arr!35339 (Array (_ BitVec 32) (_ BitVec 64))) (size!35877 (_ BitVec 32))) )
))
(declare-fun lt!499826 () array!73372)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73372 (_ BitVec 32)) Bool)

(assert (=> b!1125769 (= res!752280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499826 mask!1564))))

(declare-fun _keys!1208 () array!73372)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125769 (= lt!499826 (array!73373 (store (arr!35339 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35877 _keys!1208)))))

(declare-fun b!1125770 () Bool)

(declare-fun res!752272 () Bool)

(assert (=> b!1125770 (=> (not res!752272) (not e!640804))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1125770 (= res!752272 (= (select (arr!35339 _keys!1208) i!673) k0!934))))

(declare-fun b!1125771 () Bool)

(declare-fun res!752274 () Bool)

(assert (=> b!1125771 (=> (not res!752274) (not e!640804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125771 (= res!752274 (validKeyInArray!0 k0!934))))

(declare-fun b!1125772 () Bool)

(declare-fun e!640800 () Bool)

(declare-fun tp_is_empty!28291 () Bool)

(assert (=> b!1125772 (= e!640800 tp_is_empty!28291)))

(declare-fun b!1125773 () Bool)

(declare-fun res!752276 () Bool)

(assert (=> b!1125773 (=> (not res!752276) (not e!640804))))

(declare-datatypes ((List!24702 0))(
  ( (Nil!24699) (Cons!24698 (h!25907 (_ BitVec 64)) (t!35446 List!24702)) )
))
(declare-fun arrayNoDuplicates!0 (array!73372 (_ BitVec 32) List!24702) Bool)

(assert (=> b!1125773 (= res!752276 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24699))))

(declare-fun e!640806 () Bool)

(declare-fun b!1125774 () Bool)

(declare-datatypes ((V!42849 0))(
  ( (V!42850 (val!14202 Int)) )
))
(declare-datatypes ((tuple2!17942 0))(
  ( (tuple2!17943 (_1!8982 (_ BitVec 64)) (_2!8982 V!42849)) )
))
(declare-datatypes ((List!24703 0))(
  ( (Nil!24700) (Cons!24699 (h!25908 tuple2!17942) (t!35447 List!24703)) )
))
(declare-datatypes ((ListLongMap!15911 0))(
  ( (ListLongMap!15912 (toList!7971 List!24703)) )
))
(declare-fun call!47543 () ListLongMap!15911)

(declare-fun call!47542 () ListLongMap!15911)

(declare-fun -!1100 (ListLongMap!15911 (_ BitVec 64)) ListLongMap!15911)

(assert (=> b!1125774 (= e!640806 (= call!47543 (-!1100 call!47542 k0!934)))))

(declare-fun b!1125775 () Bool)

(declare-fun res!752283 () Bool)

(assert (=> b!1125775 (=> (not res!752283) (not e!640798))))

(assert (=> b!1125775 (= res!752283 (arrayNoDuplicates!0 lt!499826 #b00000000000000000000000000000000 Nil!24699))))

(declare-fun b!1125776 () Bool)

(declare-fun res!752281 () Bool)

(assert (=> b!1125776 (=> (not res!752281) (not e!640804))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13436 0))(
  ( (ValueCellFull!13436 (v!16834 V!42849)) (EmptyCell!13436) )
))
(declare-datatypes ((array!73374 0))(
  ( (array!73375 (arr!35340 (Array (_ BitVec 32) ValueCell!13436)) (size!35878 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73374)

(assert (=> b!1125776 (= res!752281 (and (= (size!35878 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35877 _keys!1208) (size!35878 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44254 () Bool)

(declare-fun mapRes!44254 () Bool)

(assert (=> mapIsEmpty!44254 mapRes!44254))

(declare-fun b!1125777 () Bool)

(declare-fun e!640802 () Bool)

(assert (=> b!1125777 (= e!640802 true)))

(declare-fun zeroValue!944 () V!42849)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42849)

(declare-fun lt!499822 () Bool)

(declare-fun contains!6439 (ListLongMap!15911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4475 (array!73372 array!73374 (_ BitVec 32) (_ BitVec 32) V!42849 V!42849 (_ BitVec 32) Int) ListLongMap!15911)

(assert (=> b!1125777 (= lt!499822 (contains!6439 (getCurrentListMapNoExtraKeys!4475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1125778 () Bool)

(declare-fun e!640801 () Bool)

(declare-fun e!640805 () Bool)

(assert (=> b!1125778 (= e!640801 (and e!640805 mapRes!44254))))

(declare-fun condMapEmpty!44254 () Bool)

(declare-fun mapDefault!44254 () ValueCell!13436)

(assert (=> b!1125778 (= condMapEmpty!44254 (= (arr!35340 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13436)) mapDefault!44254)))))

(declare-fun res!752279 () Bool)

(assert (=> start!98054 (=> (not res!752279) (not e!640804))))

(assert (=> start!98054 (= res!752279 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35877 _keys!1208))))))

(assert (=> start!98054 e!640804))

(assert (=> start!98054 tp_is_empty!28291))

(declare-fun array_inv!27198 (array!73372) Bool)

(assert (=> start!98054 (array_inv!27198 _keys!1208)))

(assert (=> start!98054 true))

(assert (=> start!98054 tp!83986))

(declare-fun array_inv!27199 (array!73374) Bool)

(assert (=> start!98054 (and (array_inv!27199 _values!996) e!640801)))

(declare-fun bm!47539 () Bool)

(assert (=> bm!47539 (= call!47542 (getCurrentListMapNoExtraKeys!4475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125779 () Bool)

(assert (=> b!1125779 (= e!640805 tp_is_empty!28291)))

(declare-fun b!1125780 () Bool)

(assert (=> b!1125780 (= e!640806 (= call!47543 call!47542))))

(declare-fun b!1125781 () Bool)

(declare-fun res!752284 () Bool)

(assert (=> b!1125781 (=> (not res!752284) (not e!640804))))

(assert (=> b!1125781 (= res!752284 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35877 _keys!1208))))))

(declare-fun mapNonEmpty!44254 () Bool)

(declare-fun tp!83987 () Bool)

(assert (=> mapNonEmpty!44254 (= mapRes!44254 (and tp!83987 e!640800))))

(declare-fun mapValue!44254 () ValueCell!13436)

(declare-fun mapRest!44254 () (Array (_ BitVec 32) ValueCell!13436))

(declare-fun mapKey!44254 () (_ BitVec 32))

(assert (=> mapNonEmpty!44254 (= (arr!35340 _values!996) (store mapRest!44254 mapKey!44254 mapValue!44254))))

(declare-fun b!1125782 () Bool)

(declare-fun res!752282 () Bool)

(assert (=> b!1125782 (=> (not res!752282) (not e!640804))))

(assert (=> b!1125782 (= res!752282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125783 () Bool)

(declare-fun e!640797 () Bool)

(assert (=> b!1125783 (= e!640798 (not e!640797))))

(declare-fun res!752277 () Bool)

(assert (=> b!1125783 (=> res!752277 e!640797)))

(assert (=> b!1125783 (= res!752277 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125783 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36749 0))(
  ( (Unit!36750) )
))
(declare-fun lt!499827 () Unit!36749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73372 (_ BitVec 64) (_ BitVec 32)) Unit!36749)

(assert (=> b!1125783 (= lt!499827 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!47540 () Bool)

(declare-fun lt!499824 () array!73374)

(assert (=> bm!47540 (= call!47543 (getCurrentListMapNoExtraKeys!4475 lt!499826 lt!499824 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125784 () Bool)

(declare-fun res!752275 () Bool)

(assert (=> b!1125784 (=> (not res!752275) (not e!640804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125784 (= res!752275 (validMask!0 mask!1564))))

(declare-fun b!1125785 () Bool)

(declare-fun e!640803 () Bool)

(assert (=> b!1125785 (= e!640797 e!640803)))

(declare-fun res!752278 () Bool)

(assert (=> b!1125785 (=> res!752278 e!640803)))

(assert (=> b!1125785 (= res!752278 (not (= from!1455 i!673)))))

(declare-fun lt!499825 () ListLongMap!15911)

(assert (=> b!1125785 (= lt!499825 (getCurrentListMapNoExtraKeys!4475 lt!499826 lt!499824 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2492 (Int (_ BitVec 64)) V!42849)

(assert (=> b!1125785 (= lt!499824 (array!73375 (store (arr!35340 _values!996) i!673 (ValueCellFull!13436 (dynLambda!2492 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35878 _values!996)))))

(declare-fun lt!499823 () ListLongMap!15911)

(assert (=> b!1125785 (= lt!499823 (getCurrentListMapNoExtraKeys!4475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125786 () Bool)

(assert (=> b!1125786 (= e!640803 e!640802)))

(declare-fun res!752273 () Bool)

(assert (=> b!1125786 (=> res!752273 e!640802)))

(assert (=> b!1125786 (= res!752273 (not (= (select (arr!35339 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125786 e!640806))

(declare-fun c!109605 () Bool)

(assert (=> b!1125786 (= c!109605 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499821 () Unit!36749)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!380 (array!73372 array!73374 (_ BitVec 32) (_ BitVec 32) V!42849 V!42849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36749)

(assert (=> b!1125786 (= lt!499821 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98054 res!752279) b!1125784))

(assert (= (and b!1125784 res!752275) b!1125776))

(assert (= (and b!1125776 res!752281) b!1125782))

(assert (= (and b!1125782 res!752282) b!1125773))

(assert (= (and b!1125773 res!752276) b!1125781))

(assert (= (and b!1125781 res!752284) b!1125771))

(assert (= (and b!1125771 res!752274) b!1125770))

(assert (= (and b!1125770 res!752272) b!1125769))

(assert (= (and b!1125769 res!752280) b!1125775))

(assert (= (and b!1125775 res!752283) b!1125783))

(assert (= (and b!1125783 (not res!752277)) b!1125785))

(assert (= (and b!1125785 (not res!752278)) b!1125786))

(assert (= (and b!1125786 c!109605) b!1125774))

(assert (= (and b!1125786 (not c!109605)) b!1125780))

(assert (= (or b!1125774 b!1125780) bm!47540))

(assert (= (or b!1125774 b!1125780) bm!47539))

(assert (= (and b!1125786 (not res!752273)) b!1125777))

(assert (= (and b!1125778 condMapEmpty!44254) mapIsEmpty!44254))

(assert (= (and b!1125778 (not condMapEmpty!44254)) mapNonEmpty!44254))

(get-info :version)

(assert (= (and mapNonEmpty!44254 ((_ is ValueCellFull!13436) mapValue!44254)) b!1125772))

(assert (= (and b!1125778 ((_ is ValueCellFull!13436) mapDefault!44254)) b!1125779))

(assert (= start!98054 b!1125778))

(declare-fun b_lambda!18713 () Bool)

(assert (=> (not b_lambda!18713) (not b!1125785)))

(declare-fun t!35445 () Bool)

(declare-fun tb!8565 () Bool)

(assert (=> (and start!98054 (= defaultEntry!1004 defaultEntry!1004) t!35445) tb!8565))

(declare-fun result!17699 () Bool)

(assert (=> tb!8565 (= result!17699 tp_is_empty!28291)))

(assert (=> b!1125785 t!35445))

(declare-fun b_and!38285 () Bool)

(assert (= b_and!38283 (and (=> t!35445 result!17699) b_and!38285)))

(declare-fun m!1039329 () Bool)

(assert (=> b!1125774 m!1039329))

(declare-fun m!1039331 () Bool)

(assert (=> b!1125783 m!1039331))

(declare-fun m!1039333 () Bool)

(assert (=> b!1125783 m!1039333))

(declare-fun m!1039335 () Bool)

(assert (=> b!1125770 m!1039335))

(declare-fun m!1039337 () Bool)

(assert (=> bm!47539 m!1039337))

(declare-fun m!1039339 () Bool)

(assert (=> b!1125785 m!1039339))

(declare-fun m!1039341 () Bool)

(assert (=> b!1125785 m!1039341))

(declare-fun m!1039343 () Bool)

(assert (=> b!1125785 m!1039343))

(declare-fun m!1039345 () Bool)

(assert (=> b!1125785 m!1039345))

(declare-fun m!1039347 () Bool)

(assert (=> start!98054 m!1039347))

(declare-fun m!1039349 () Bool)

(assert (=> start!98054 m!1039349))

(declare-fun m!1039351 () Bool)

(assert (=> b!1125771 m!1039351))

(declare-fun m!1039353 () Bool)

(assert (=> b!1125775 m!1039353))

(declare-fun m!1039355 () Bool)

(assert (=> b!1125782 m!1039355))

(declare-fun m!1039357 () Bool)

(assert (=> b!1125784 m!1039357))

(declare-fun m!1039359 () Bool)

(assert (=> mapNonEmpty!44254 m!1039359))

(declare-fun m!1039361 () Bool)

(assert (=> b!1125769 m!1039361))

(declare-fun m!1039363 () Bool)

(assert (=> b!1125769 m!1039363))

(declare-fun m!1039365 () Bool)

(assert (=> b!1125786 m!1039365))

(declare-fun m!1039367 () Bool)

(assert (=> b!1125786 m!1039367))

(declare-fun m!1039369 () Bool)

(assert (=> bm!47540 m!1039369))

(declare-fun m!1039371 () Bool)

(assert (=> b!1125773 m!1039371))

(assert (=> b!1125777 m!1039337))

(assert (=> b!1125777 m!1039337))

(declare-fun m!1039373 () Bool)

(assert (=> b!1125777 m!1039373))

(check-sat (not b!1125769) (not bm!47540) (not b!1125773) (not b!1125771) (not b!1125783) tp_is_empty!28291 b_and!38285 (not b!1125782) (not start!98054) (not bm!47539) (not b!1125777) (not b_next!23761) (not b!1125774) (not b!1125786) (not b!1125784) (not b_lambda!18713) (not b!1125785) (not mapNonEmpty!44254) (not b!1125775))
(check-sat b_and!38285 (not b_next!23761))

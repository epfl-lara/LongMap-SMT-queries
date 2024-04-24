; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98812 () Bool)

(assert start!98812)

(declare-fun b_free!24181 () Bool)

(declare-fun b_next!24181 () Bool)

(assert (=> start!98812 (= b_free!24181 (not b_next!24181))))

(declare-fun tp!85254 () Bool)

(declare-fun b_and!39213 () Bool)

(assert (=> start!98812 (= tp!85254 b_and!39213)))

(declare-datatypes ((V!43409 0))(
  ( (V!43410 (val!14412 Int)) )
))
(declare-fun zeroValue!944 () V!43409)

(declare-datatypes ((tuple2!18258 0))(
  ( (tuple2!18259 (_1!9140 (_ BitVec 64)) (_2!9140 V!43409)) )
))
(declare-datatypes ((List!25014 0))(
  ( (Nil!25011) (Cons!25010 (h!26228 tuple2!18258) (t!36179 List!25014)) )
))
(declare-datatypes ((ListLongMap!16235 0))(
  ( (ListLongMap!16236 (toList!8133 List!25014)) )
))
(declare-fun lt!510390 () ListLongMap!16235)

(declare-fun c!112887 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!37496 0))(
  ( (Unit!37497) )
))
(declare-fun call!51786 () Unit!37496)

(declare-fun lt!510386 () ListLongMap!16235)

(declare-fun minValue!944 () V!43409)

(declare-fun c!112890 () Bool)

(declare-fun bm!51776 () Bool)

(declare-fun addStillContains!805 (ListLongMap!16235 (_ BitVec 64) V!43409 (_ BitVec 64)) Unit!37496)

(assert (=> bm!51776 (= call!51786 (addStillContains!805 (ite c!112890 lt!510390 lt!510386) (ite c!112890 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112887 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112890 minValue!944 (ite c!112887 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1144652 () Bool)

(declare-fun e!651258 () Bool)

(declare-fun tp_is_empty!28711 () Bool)

(assert (=> b!1144652 (= e!651258 tp_is_empty!28711)))

(declare-fun b!1144653 () Bool)

(declare-fun res!762280 () Bool)

(declare-fun e!651269 () Bool)

(assert (=> b!1144653 (=> (not res!762280) (not e!651269))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144653 (= res!762280 (validMask!0 mask!1564))))

(declare-fun b!1144654 () Bool)

(declare-fun res!762276 () Bool)

(assert (=> b!1144654 (=> (not res!762276) (not e!651269))))

(declare-datatypes ((array!74321 0))(
  ( (array!74322 (arr!35805 (Array (_ BitVec 32) (_ BitVec 64))) (size!36342 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74321)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13646 0))(
  ( (ValueCellFull!13646 (v!17045 V!43409)) (EmptyCell!13646) )
))
(declare-datatypes ((array!74323 0))(
  ( (array!74324 (arr!35806 (Array (_ BitVec 32) ValueCell!13646)) (size!36343 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74323)

(assert (=> b!1144654 (= res!762276 (and (= (size!36343 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36342 _keys!1208) (size!36343 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1144655 () Bool)

(declare-fun e!651257 () Bool)

(declare-fun e!651266 () Bool)

(assert (=> b!1144655 (= e!651257 e!651266)))

(declare-fun res!762275 () Bool)

(assert (=> b!1144655 (=> res!762275 e!651266)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1144655 (= res!762275 (not (= (select (arr!35805 _keys!1208) from!1455) k0!934)))))

(declare-fun e!651256 () Bool)

(assert (=> b!1144655 e!651256))

(declare-fun c!112889 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144655 (= c!112889 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!510384 () Unit!37496)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!513 (array!74321 array!74323 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37496)

(assert (=> b!1144655 (= lt!510384 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144656 () Bool)

(declare-fun res!762274 () Bool)

(assert (=> b!1144656 (=> (not res!762274) (not e!651269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74321 (_ BitVec 32)) Bool)

(assert (=> b!1144656 (= res!762274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144657 () Bool)

(declare-fun e!651265 () Unit!37496)

(declare-fun lt!510378 () Unit!37496)

(assert (=> b!1144657 (= e!651265 lt!510378)))

(declare-fun call!51781 () Unit!37496)

(assert (=> b!1144657 (= lt!510378 call!51781)))

(declare-fun call!51784 () Bool)

(assert (=> b!1144657 call!51784))

(declare-fun b!1144658 () Bool)

(declare-fun call!51783 () ListLongMap!16235)

(declare-fun contains!6677 (ListLongMap!16235 (_ BitVec 64)) Bool)

(assert (=> b!1144658 (contains!6677 call!51783 k0!934)))

(declare-fun lt!510394 () Unit!37496)

(assert (=> b!1144658 (= lt!510394 call!51786)))

(declare-fun call!51779 () Bool)

(assert (=> b!1144658 call!51779))

(declare-fun +!3578 (ListLongMap!16235 tuple2!18258) ListLongMap!16235)

(assert (=> b!1144658 (= lt!510390 (+!3578 lt!510386 (tuple2!18259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510391 () Unit!37496)

(assert (=> b!1144658 (= lt!510391 (addStillContains!805 lt!510386 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!651268 () Unit!37496)

(assert (=> b!1144658 (= e!651268 lt!510394)))

(declare-fun call!51785 () ListLongMap!16235)

(declare-fun call!51782 () ListLongMap!16235)

(declare-fun b!1144659 () Bool)

(declare-fun -!1262 (ListLongMap!16235 (_ BitVec 64)) ListLongMap!16235)

(assert (=> b!1144659 (= e!651256 (= call!51782 (-!1262 call!51785 k0!934)))))

(declare-fun b!1144660 () Bool)

(assert (=> b!1144660 call!51784))

(declare-fun lt!510389 () Unit!37496)

(assert (=> b!1144660 (= lt!510389 call!51781)))

(declare-fun e!651271 () Unit!37496)

(assert (=> b!1144660 (= e!651271 lt!510389)))

(declare-fun b!1144661 () Bool)

(assert (=> b!1144661 (= e!651265 e!651271)))

(declare-fun c!112888 () Bool)

(declare-fun lt!510388 () Bool)

(assert (=> b!1144661 (= c!112888 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510388))))

(declare-fun b!1144662 () Bool)

(assert (=> b!1144662 (= c!112887 (and (not lt!510388) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144662 (= e!651268 e!651265)))

(declare-fun mapNonEmpty!44891 () Bool)

(declare-fun mapRes!44891 () Bool)

(declare-fun tp!85253 () Bool)

(declare-fun e!651262 () Bool)

(assert (=> mapNonEmpty!44891 (= mapRes!44891 (and tp!85253 e!651262))))

(declare-fun mapRest!44891 () (Array (_ BitVec 32) ValueCell!13646))

(declare-fun mapKey!44891 () (_ BitVec 32))

(declare-fun mapValue!44891 () ValueCell!13646)

(assert (=> mapNonEmpty!44891 (= (arr!35806 _values!996) (store mapRest!44891 mapKey!44891 mapValue!44891))))

(declare-fun bm!51777 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4638 (array!74321 array!74323 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 32) Int) ListLongMap!16235)

(assert (=> bm!51777 (= call!51785 (getCurrentListMapNoExtraKeys!4638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144663 () Bool)

(declare-fun res!762272 () Bool)

(assert (=> b!1144663 (=> (not res!762272) (not e!651269))))

(assert (=> b!1144663 (= res!762272 (= (select (arr!35805 _keys!1208) i!673) k0!934))))

(declare-fun bm!51778 () Bool)

(assert (=> bm!51778 (= call!51783 (+!3578 (ite c!112890 lt!510390 lt!510386) (ite c!112890 (tuple2!18259 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112887 (tuple2!18259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18259 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1144664 () Bool)

(declare-fun res!762285 () Bool)

(assert (=> b!1144664 (=> (not res!762285) (not e!651269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144664 (= res!762285 (validKeyInArray!0 k0!934))))

(declare-fun bm!51779 () Bool)

(declare-fun call!51780 () ListLongMap!16235)

(assert (=> bm!51779 (= call!51780 call!51783)))

(declare-fun res!762281 () Bool)

(assert (=> start!98812 (=> (not res!762281) (not e!651269))))

(assert (=> start!98812 (= res!762281 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36342 _keys!1208))))))

(assert (=> start!98812 e!651269))

(assert (=> start!98812 tp_is_empty!28711))

(declare-fun array_inv!27482 (array!74321) Bool)

(assert (=> start!98812 (array_inv!27482 _keys!1208)))

(assert (=> start!98812 true))

(assert (=> start!98812 tp!85254))

(declare-fun e!651260 () Bool)

(declare-fun array_inv!27483 (array!74323) Bool)

(assert (=> start!98812 (and (array_inv!27483 _values!996) e!651260)))

(declare-fun b!1144665 () Bool)

(declare-fun Unit!37498 () Unit!37496)

(assert (=> b!1144665 (= e!651271 Unit!37498)))

(declare-fun b!1144666 () Bool)

(declare-fun e!651263 () Unit!37496)

(declare-fun Unit!37499 () Unit!37496)

(assert (=> b!1144666 (= e!651263 Unit!37499)))

(declare-fun b!1144667 () Bool)

(declare-fun res!762279 () Bool)

(assert (=> b!1144667 (=> (not res!762279) (not e!651269))))

(assert (=> b!1144667 (= res!762279 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36342 _keys!1208))))))

(declare-fun b!1144668 () Bool)

(assert (=> b!1144668 (= e!651256 (= call!51782 call!51785))))

(declare-fun b!1144669 () Bool)

(assert (=> b!1144669 (= e!651266 true)))

(declare-fun lt!510393 () V!43409)

(assert (=> b!1144669 (= (-!1262 (+!3578 lt!510386 (tuple2!18259 (select (arr!35805 _keys!1208) from!1455) lt!510393)) (select (arr!35805 _keys!1208) from!1455)) lt!510386)))

(declare-fun lt!510397 () Unit!37496)

(declare-fun addThenRemoveForNewKeyIsSame!119 (ListLongMap!16235 (_ BitVec 64) V!43409) Unit!37496)

(assert (=> b!1144669 (= lt!510397 (addThenRemoveForNewKeyIsSame!119 lt!510386 (select (arr!35805 _keys!1208) from!1455) lt!510393))))

(declare-fun lt!510382 () V!43409)

(declare-fun get!18224 (ValueCell!13646 V!43409) V!43409)

(assert (=> b!1144669 (= lt!510393 (get!18224 (select (arr!35806 _values!996) from!1455) lt!510382))))

(declare-fun lt!510381 () Unit!37496)

(assert (=> b!1144669 (= lt!510381 e!651263)))

(declare-fun c!112886 () Bool)

(assert (=> b!1144669 (= c!112886 (contains!6677 lt!510386 k0!934))))

(assert (=> b!1144669 (= lt!510386 (getCurrentListMapNoExtraKeys!4638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!651270 () Bool)

(declare-fun b!1144670 () Bool)

(declare-fun arrayContainsKey!0 (array!74321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144670 (= e!651270 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144671 () Bool)

(declare-fun res!762277 () Bool)

(declare-fun e!651261 () Bool)

(assert (=> b!1144671 (=> (not res!762277) (not e!651261))))

(declare-fun lt!510380 () array!74321)

(declare-datatypes ((List!25015 0))(
  ( (Nil!25012) (Cons!25011 (h!26229 (_ BitVec 64)) (t!36180 List!25015)) )
))
(declare-fun arrayNoDuplicates!0 (array!74321 (_ BitVec 32) List!25015) Bool)

(assert (=> b!1144671 (= res!762277 (arrayNoDuplicates!0 lt!510380 #b00000000000000000000000000000000 Nil!25012))))

(declare-fun b!1144672 () Bool)

(assert (=> b!1144672 (= e!651262 tp_is_empty!28711)))

(declare-fun b!1144673 () Bool)

(declare-fun e!651264 () Bool)

(assert (=> b!1144673 (= e!651264 e!651257)))

(declare-fun res!762283 () Bool)

(assert (=> b!1144673 (=> res!762283 e!651257)))

(assert (=> b!1144673 (= res!762283 (not (= from!1455 i!673)))))

(declare-fun lt!510383 () ListLongMap!16235)

(declare-fun lt!510395 () array!74323)

(assert (=> b!1144673 (= lt!510383 (getCurrentListMapNoExtraKeys!4638 lt!510380 lt!510395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1144673 (= lt!510395 (array!74324 (store (arr!35806 _values!996) i!673 (ValueCellFull!13646 lt!510382)) (size!36343 _values!996)))))

(declare-fun dynLambda!2672 (Int (_ BitVec 64)) V!43409)

(assert (=> b!1144673 (= lt!510382 (dynLambda!2672 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510377 () ListLongMap!16235)

(assert (=> b!1144673 (= lt!510377 (getCurrentListMapNoExtraKeys!4638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144674 () Bool)

(assert (=> b!1144674 (= e!651261 (not e!651264))))

(declare-fun res!762282 () Bool)

(assert (=> b!1144674 (=> res!762282 e!651264)))

(assert (=> b!1144674 (= res!762282 (bvsgt from!1455 i!673))))

(assert (=> b!1144674 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510396 () Unit!37496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74321 (_ BitVec 64) (_ BitVec 32)) Unit!37496)

(assert (=> b!1144674 (= lt!510396 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1144675 () Bool)

(declare-fun res!762273 () Bool)

(assert (=> b!1144675 (=> (not res!762273) (not e!651269))))

(assert (=> b!1144675 (= res!762273 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25012))))

(declare-fun bm!51780 () Bool)

(assert (=> bm!51780 (= call!51781 call!51786)))

(declare-fun mapIsEmpty!44891 () Bool)

(assert (=> mapIsEmpty!44891 mapRes!44891))

(declare-fun bm!51781 () Bool)

(assert (=> bm!51781 (= call!51784 call!51779)))

(declare-fun bm!51782 () Bool)

(assert (=> bm!51782 (= call!51779 (contains!6677 (ite c!112890 lt!510390 call!51780) k0!934))))

(declare-fun b!1144676 () Bool)

(declare-fun e!651259 () Bool)

(assert (=> b!1144676 (= e!651259 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510388) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51783 () Bool)

(assert (=> bm!51783 (= call!51782 (getCurrentListMapNoExtraKeys!4638 lt!510380 lt!510395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144677 () Bool)

(assert (=> b!1144677 (= e!651259 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144678 () Bool)

(assert (=> b!1144678 (= e!651260 (and e!651258 mapRes!44891))))

(declare-fun condMapEmpty!44891 () Bool)

(declare-fun mapDefault!44891 () ValueCell!13646)

(assert (=> b!1144678 (= condMapEmpty!44891 (= (arr!35806 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13646)) mapDefault!44891)))))

(declare-fun b!1144679 () Bool)

(assert (=> b!1144679 (= e!651269 e!651261)))

(declare-fun res!762284 () Bool)

(assert (=> b!1144679 (=> (not res!762284) (not e!651261))))

(assert (=> b!1144679 (= res!762284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510380 mask!1564))))

(assert (=> b!1144679 (= lt!510380 (array!74322 (store (arr!35805 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36342 _keys!1208)))))

(declare-fun b!1144680 () Bool)

(declare-fun Unit!37500 () Unit!37496)

(assert (=> b!1144680 (= e!651263 Unit!37500)))

(assert (=> b!1144680 (= lt!510388 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144680 (= c!112890 (and (not lt!510388) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510385 () Unit!37496)

(assert (=> b!1144680 (= lt!510385 e!651268)))

(declare-fun lt!510392 () Unit!37496)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!404 (array!74321 array!74323 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 64) (_ BitVec 32) Int) Unit!37496)

(assert (=> b!1144680 (= lt!510392 (lemmaListMapContainsThenArrayContainsFrom!404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112885 () Bool)

(assert (=> b!1144680 (= c!112885 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762278 () Bool)

(assert (=> b!1144680 (= res!762278 e!651259)))

(assert (=> b!1144680 (=> (not res!762278) (not e!651270))))

(assert (=> b!1144680 e!651270))

(declare-fun lt!510387 () Unit!37496)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74321 (_ BitVec 32) (_ BitVec 32)) Unit!37496)

(assert (=> b!1144680 (= lt!510387 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1144680 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25012)))

(declare-fun lt!510379 () Unit!37496)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74321 (_ BitVec 64) (_ BitVec 32) List!25015) Unit!37496)

(assert (=> b!1144680 (= lt!510379 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25012))))

(assert (=> b!1144680 false))

(assert (= (and start!98812 res!762281) b!1144653))

(assert (= (and b!1144653 res!762280) b!1144654))

(assert (= (and b!1144654 res!762276) b!1144656))

(assert (= (and b!1144656 res!762274) b!1144675))

(assert (= (and b!1144675 res!762273) b!1144667))

(assert (= (and b!1144667 res!762279) b!1144664))

(assert (= (and b!1144664 res!762285) b!1144663))

(assert (= (and b!1144663 res!762272) b!1144679))

(assert (= (and b!1144679 res!762284) b!1144671))

(assert (= (and b!1144671 res!762277) b!1144674))

(assert (= (and b!1144674 (not res!762282)) b!1144673))

(assert (= (and b!1144673 (not res!762283)) b!1144655))

(assert (= (and b!1144655 c!112889) b!1144659))

(assert (= (and b!1144655 (not c!112889)) b!1144668))

(assert (= (or b!1144659 b!1144668) bm!51783))

(assert (= (or b!1144659 b!1144668) bm!51777))

(assert (= (and b!1144655 (not res!762275)) b!1144669))

(assert (= (and b!1144669 c!112886) b!1144680))

(assert (= (and b!1144669 (not c!112886)) b!1144666))

(assert (= (and b!1144680 c!112890) b!1144658))

(assert (= (and b!1144680 (not c!112890)) b!1144662))

(assert (= (and b!1144662 c!112887) b!1144657))

(assert (= (and b!1144662 (not c!112887)) b!1144661))

(assert (= (and b!1144661 c!112888) b!1144660))

(assert (= (and b!1144661 (not c!112888)) b!1144665))

(assert (= (or b!1144657 b!1144660) bm!51780))

(assert (= (or b!1144657 b!1144660) bm!51779))

(assert (= (or b!1144657 b!1144660) bm!51781))

(assert (= (or b!1144658 bm!51781) bm!51782))

(assert (= (or b!1144658 bm!51780) bm!51776))

(assert (= (or b!1144658 bm!51779) bm!51778))

(assert (= (and b!1144680 c!112885) b!1144677))

(assert (= (and b!1144680 (not c!112885)) b!1144676))

(assert (= (and b!1144680 res!762278) b!1144670))

(assert (= (and b!1144678 condMapEmpty!44891) mapIsEmpty!44891))

(assert (= (and b!1144678 (not condMapEmpty!44891)) mapNonEmpty!44891))

(get-info :version)

(assert (= (and mapNonEmpty!44891 ((_ is ValueCellFull!13646) mapValue!44891)) b!1144672))

(assert (= (and b!1144678 ((_ is ValueCellFull!13646) mapDefault!44891)) b!1144652))

(assert (= start!98812 b!1144678))

(declare-fun b_lambda!19281 () Bool)

(assert (=> (not b_lambda!19281) (not b!1144673)))

(declare-fun t!36178 () Bool)

(declare-fun tb!8985 () Bool)

(assert (=> (and start!98812 (= defaultEntry!1004 defaultEntry!1004) t!36178) tb!8985))

(declare-fun result!18543 () Bool)

(assert (=> tb!8985 (= result!18543 tp_is_empty!28711)))

(assert (=> b!1144673 t!36178))

(declare-fun b_and!39215 () Bool)

(assert (= b_and!39213 (and (=> t!36178 result!18543) b_and!39215)))

(declare-fun m!1056089 () Bool)

(assert (=> b!1144659 m!1056089))

(declare-fun m!1056091 () Bool)

(assert (=> b!1144673 m!1056091))

(declare-fun m!1056093 () Bool)

(assert (=> b!1144673 m!1056093))

(declare-fun m!1056095 () Bool)

(assert (=> b!1144673 m!1056095))

(declare-fun m!1056097 () Bool)

(assert (=> b!1144673 m!1056097))

(declare-fun m!1056099 () Bool)

(assert (=> start!98812 m!1056099))

(declare-fun m!1056101 () Bool)

(assert (=> start!98812 m!1056101))

(declare-fun m!1056103 () Bool)

(assert (=> b!1144670 m!1056103))

(declare-fun m!1056105 () Bool)

(assert (=> b!1144656 m!1056105))

(declare-fun m!1056107 () Bool)

(assert (=> b!1144674 m!1056107))

(declare-fun m!1056109 () Bool)

(assert (=> b!1144674 m!1056109))

(declare-fun m!1056111 () Bool)

(assert (=> b!1144653 m!1056111))

(declare-fun m!1056113 () Bool)

(assert (=> b!1144675 m!1056113))

(declare-fun m!1056115 () Bool)

(assert (=> b!1144658 m!1056115))

(declare-fun m!1056117 () Bool)

(assert (=> b!1144658 m!1056117))

(declare-fun m!1056119 () Bool)

(assert (=> b!1144658 m!1056119))

(declare-fun m!1056121 () Bool)

(assert (=> bm!51778 m!1056121))

(declare-fun m!1056123 () Bool)

(assert (=> bm!51783 m!1056123))

(declare-fun m!1056125 () Bool)

(assert (=> b!1144655 m!1056125))

(declare-fun m!1056127 () Bool)

(assert (=> b!1144655 m!1056127))

(declare-fun m!1056129 () Bool)

(assert (=> bm!51776 m!1056129))

(declare-fun m!1056131 () Bool)

(assert (=> b!1144663 m!1056131))

(declare-fun m!1056133 () Bool)

(assert (=> mapNonEmpty!44891 m!1056133))

(declare-fun m!1056135 () Bool)

(assert (=> b!1144679 m!1056135))

(declare-fun m!1056137 () Bool)

(assert (=> b!1144679 m!1056137))

(declare-fun m!1056139 () Bool)

(assert (=> b!1144680 m!1056139))

(declare-fun m!1056141 () Bool)

(assert (=> b!1144680 m!1056141))

(declare-fun m!1056143 () Bool)

(assert (=> b!1144680 m!1056143))

(declare-fun m!1056145 () Bool)

(assert (=> b!1144680 m!1056145))

(declare-fun m!1056147 () Bool)

(assert (=> b!1144671 m!1056147))

(declare-fun m!1056149 () Bool)

(assert (=> bm!51777 m!1056149))

(assert (=> b!1144669 m!1056149))

(declare-fun m!1056151 () Bool)

(assert (=> b!1144669 m!1056151))

(declare-fun m!1056153 () Bool)

(assert (=> b!1144669 m!1056153))

(assert (=> b!1144669 m!1056125))

(declare-fun m!1056155 () Bool)

(assert (=> b!1144669 m!1056155))

(assert (=> b!1144669 m!1056151))

(declare-fun m!1056157 () Bool)

(assert (=> b!1144669 m!1056157))

(assert (=> b!1144669 m!1056125))

(assert (=> b!1144669 m!1056153))

(assert (=> b!1144669 m!1056125))

(declare-fun m!1056159 () Bool)

(assert (=> b!1144669 m!1056159))

(declare-fun m!1056161 () Bool)

(assert (=> b!1144669 m!1056161))

(declare-fun m!1056163 () Bool)

(assert (=> b!1144664 m!1056163))

(declare-fun m!1056165 () Bool)

(assert (=> bm!51782 m!1056165))

(assert (=> b!1144677 m!1056103))

(check-sat (not b!1144680) (not b!1144653) (not b!1144658) (not b!1144674) (not b_next!24181) (not b!1144673) (not b!1144675) (not bm!51778) (not bm!51783) (not b!1144655) (not bm!51782) (not b!1144671) (not b!1144679) (not bm!51777) (not b!1144669) b_and!39215 (not b!1144677) (not mapNonEmpty!44891) (not b_lambda!19281) (not bm!51776) (not start!98812) (not b!1144664) (not b!1144659) (not b!1144670) (not b!1144656) tp_is_empty!28711)
(check-sat b_and!39215 (not b_next!24181))

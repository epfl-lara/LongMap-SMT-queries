; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98204 () Bool)

(assert start!98204)

(declare-fun b_free!23911 () Bool)

(declare-fun b_next!23911 () Bool)

(assert (=> start!98204 (= b_free!23911 (not b_next!23911))))

(declare-fun tp!84436 () Bool)

(declare-fun b_and!38583 () Bool)

(assert (=> start!98204 (= tp!84436 b_and!38583)))

(declare-fun b!1130507 () Bool)

(declare-fun e!643379 () Bool)

(declare-fun e!643380 () Bool)

(assert (=> b!1130507 (= e!643379 e!643380)))

(declare-fun res!755349 () Bool)

(assert (=> b!1130507 (=> res!755349 e!643380)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130507 (= res!755349 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43049 0))(
  ( (V!43050 (val!14277 Int)) )
))
(declare-fun zeroValue!944 () V!43049)

(declare-datatypes ((ValueCell!13511 0))(
  ( (ValueCellFull!13511 (v!16909 V!43049)) (EmptyCell!13511) )
))
(declare-datatypes ((array!73662 0))(
  ( (array!73663 (arr!35484 (Array (_ BitVec 32) ValueCell!13511)) (size!36022 (_ BitVec 32))) )
))
(declare-fun lt!501906 () array!73662)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18074 0))(
  ( (tuple2!18075 (_1!9048 (_ BitVec 64)) (_2!9048 V!43049)) )
))
(declare-datatypes ((List!24825 0))(
  ( (Nil!24822) (Cons!24821 (h!26030 tuple2!18074) (t!35719 List!24825)) )
))
(declare-datatypes ((ListLongMap!16043 0))(
  ( (ListLongMap!16044 (toList!8037 List!24825)) )
))
(declare-fun lt!501903 () ListLongMap!16043)

(declare-datatypes ((array!73664 0))(
  ( (array!73665 (arr!35485 (Array (_ BitVec 32) (_ BitVec 64))) (size!36023 (_ BitVec 32))) )
))
(declare-fun lt!501900 () array!73664)

(declare-fun minValue!944 () V!43049)

(declare-fun getCurrentListMapNoExtraKeys!4536 (array!73664 array!73662 (_ BitVec 32) (_ BitVec 32) V!43049 V!43049 (_ BitVec 32) Int) ListLongMap!16043)

(assert (=> b!1130507 (= lt!501903 (getCurrentListMapNoExtraKeys!4536 lt!501900 lt!501906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73662)

(declare-fun dynLambda!2540 (Int (_ BitVec 64)) V!43049)

(assert (=> b!1130507 (= lt!501906 (array!73663 (store (arr!35484 _values!996) i!673 (ValueCellFull!13511 (dynLambda!2540 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36022 _values!996)))))

(declare-fun _keys!1208 () array!73664)

(declare-fun lt!501901 () ListLongMap!16043)

(assert (=> b!1130507 (= lt!501901 (getCurrentListMapNoExtraKeys!4536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130508 () Bool)

(declare-fun e!643376 () Bool)

(assert (=> b!1130508 (= e!643376 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!501905 () Bool)

(declare-fun contains!6489 (ListLongMap!16043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4365 (array!73664 array!73662 (_ BitVec 32) (_ BitVec 32) V!43049 V!43049 (_ BitVec 32) Int) ListLongMap!16043)

(assert (=> b!1130508 (= lt!501905 (contains!6489 (getCurrentListMap!4365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!48379 () Bool)

(declare-fun call!48389 () ListLongMap!16043)

(assert (=> bm!48379 (= call!48389 (getCurrentListMapNoExtraKeys!4536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48380 () Bool)

(declare-fun call!48383 () ListLongMap!16043)

(declare-fun call!48382 () ListLongMap!16043)

(assert (=> bm!48380 (= call!48383 call!48382)))

(declare-fun b!1130509 () Bool)

(declare-fun e!643374 () Bool)

(declare-fun tp_is_empty!28441 () Bool)

(assert (=> b!1130509 (= e!643374 tp_is_empty!28441)))

(declare-fun b!1130510 () Bool)

(declare-fun e!643385 () Bool)

(assert (=> b!1130510 (= e!643380 e!643385)))

(declare-fun res!755352 () Bool)

(assert (=> b!1130510 (=> res!755352 e!643385)))

(assert (=> b!1130510 (= res!755352 (not (= (select (arr!35485 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643382 () Bool)

(assert (=> b!1130510 e!643382))

(declare-fun c!110026 () Bool)

(assert (=> b!1130510 (= c!110026 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36879 0))(
  ( (Unit!36880) )
))
(declare-fun lt!501910 () Unit!36879)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!429 (array!73664 array!73662 (_ BitVec 32) (_ BitVec 32) V!43049 V!43049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36879)

(assert (=> b!1130510 (= lt!501910 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130511 () Bool)

(declare-fun e!643377 () Bool)

(declare-fun e!643386 () Bool)

(assert (=> b!1130511 (= e!643377 e!643386)))

(declare-fun res!755357 () Bool)

(assert (=> b!1130511 (=> (not res!755357) (not e!643386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73664 (_ BitVec 32)) Bool)

(assert (=> b!1130511 (= res!755357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501900 mask!1564))))

(assert (=> b!1130511 (= lt!501900 (array!73665 (store (arr!35485 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36023 _keys!1208)))))

(declare-fun mapNonEmpty!44479 () Bool)

(declare-fun mapRes!44479 () Bool)

(declare-fun tp!84437 () Bool)

(declare-fun e!643375 () Bool)

(assert (=> mapNonEmpty!44479 (= mapRes!44479 (and tp!84437 e!643375))))

(declare-fun mapKey!44479 () (_ BitVec 32))

(declare-fun mapValue!44479 () ValueCell!13511)

(declare-fun mapRest!44479 () (Array (_ BitVec 32) ValueCell!13511))

(assert (=> mapNonEmpty!44479 (= (arr!35484 _values!996) (store mapRest!44479 mapKey!44479 mapValue!44479))))

(declare-fun bm!48381 () Bool)

(declare-fun call!48386 () Unit!36879)

(declare-fun call!48385 () Unit!36879)

(assert (=> bm!48381 (= call!48386 call!48385)))

(declare-fun b!1130512 () Bool)

(declare-fun call!48387 () ListLongMap!16043)

(declare-fun -!1147 (ListLongMap!16043 (_ BitVec 64)) ListLongMap!16043)

(assert (=> b!1130512 (= e!643382 (= call!48387 (-!1147 call!48389 k0!934)))))

(declare-fun b!1130513 () Bool)

(declare-fun e!643372 () Bool)

(assert (=> b!1130513 (= e!643372 e!643376)))

(declare-fun res!755353 () Bool)

(assert (=> b!1130513 (=> res!755353 e!643376)))

(assert (=> b!1130513 (= res!755353 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36023 _keys!1208))))))

(declare-fun lt!501904 () Unit!36879)

(declare-fun e!643378 () Unit!36879)

(assert (=> b!1130513 (= lt!501904 e!643378)))

(declare-fun c!110027 () Bool)

(declare-fun lt!501909 () Bool)

(assert (=> b!1130513 (= c!110027 (and (not lt!501909) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130513 (= lt!501909 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!110025 () Bool)

(declare-fun lt!501902 () ListLongMap!16043)

(declare-fun lt!501898 () ListLongMap!16043)

(declare-fun bm!48382 () Bool)

(declare-fun +!3478 (ListLongMap!16043 tuple2!18074) ListLongMap!16043)

(assert (=> bm!48382 (= call!48382 (+!3478 (ite c!110027 lt!501902 lt!501898) (ite c!110027 (tuple2!18075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110025 (tuple2!18075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1130514 () Bool)

(declare-fun e!643384 () Unit!36879)

(declare-fun lt!501899 () Unit!36879)

(assert (=> b!1130514 (= e!643384 lt!501899)))

(assert (=> b!1130514 (= lt!501899 call!48386)))

(declare-fun call!48384 () Bool)

(assert (=> b!1130514 call!48384))

(declare-fun b!1130515 () Bool)

(assert (=> b!1130515 (= e!643382 (= call!48387 call!48389))))

(declare-fun b!1130516 () Bool)

(declare-fun res!755355 () Bool)

(assert (=> b!1130516 (=> (not res!755355) (not e!643377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130516 (= res!755355 (validMask!0 mask!1564))))

(declare-fun b!1130517 () Bool)

(assert (=> b!1130517 (= e!643385 e!643372)))

(declare-fun res!755345 () Bool)

(assert (=> b!1130517 (=> res!755345 e!643372)))

(assert (=> b!1130517 (= res!755345 (not (contains!6489 lt!501898 k0!934)))))

(assert (=> b!1130517 (= lt!501898 (getCurrentListMapNoExtraKeys!4536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130518 () Bool)

(declare-fun e!643381 () Unit!36879)

(assert (=> b!1130518 (= e!643378 e!643381)))

(assert (=> b!1130518 (= c!110025 (and (not lt!501909) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130519 () Bool)

(declare-fun Unit!36881 () Unit!36879)

(assert (=> b!1130519 (= e!643384 Unit!36881)))

(declare-fun b!1130520 () Bool)

(declare-fun res!755354 () Bool)

(assert (=> b!1130520 (=> (not res!755354) (not e!643377))))

(assert (=> b!1130520 (= res!755354 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36023 _keys!1208))))))

(declare-fun b!1130521 () Bool)

(declare-fun e!643373 () Bool)

(assert (=> b!1130521 (= e!643373 (and e!643374 mapRes!44479))))

(declare-fun condMapEmpty!44479 () Bool)

(declare-fun mapDefault!44479 () ValueCell!13511)

(assert (=> b!1130521 (= condMapEmpty!44479 (= (arr!35484 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13511)) mapDefault!44479)))))

(declare-fun bm!48383 () Bool)

(assert (=> bm!48383 (= call!48387 (getCurrentListMapNoExtraKeys!4536 lt!501900 lt!501906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48388 () Bool)

(declare-fun bm!48384 () Bool)

(assert (=> bm!48384 (= call!48388 (contains!6489 (ite c!110027 lt!501902 call!48383) k0!934))))

(declare-fun b!1130522 () Bool)

(assert (=> b!1130522 (= e!643375 tp_is_empty!28441)))

(declare-fun b!1130523 () Bool)

(declare-fun res!755346 () Bool)

(assert (=> b!1130523 (=> (not res!755346) (not e!643377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130523 (= res!755346 (validKeyInArray!0 k0!934))))

(declare-fun b!1130524 () Bool)

(declare-fun lt!501911 () Unit!36879)

(assert (=> b!1130524 (= e!643378 lt!501911)))

(declare-fun lt!501908 () Unit!36879)

(assert (=> b!1130524 (= lt!501908 call!48385)))

(assert (=> b!1130524 (= lt!501902 (+!3478 lt!501898 (tuple2!18075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1130524 call!48388))

(declare-fun addStillContains!695 (ListLongMap!16043 (_ BitVec 64) V!43049 (_ BitVec 64)) Unit!36879)

(assert (=> b!1130524 (= lt!501911 (addStillContains!695 lt!501902 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1130524 (contains!6489 call!48382 k0!934)))

(declare-fun b!1130525 () Bool)

(declare-fun res!755348 () Bool)

(assert (=> b!1130525 (=> (not res!755348) (not e!643377))))

(declare-datatypes ((List!24826 0))(
  ( (Nil!24823) (Cons!24822 (h!26031 (_ BitVec 64)) (t!35720 List!24826)) )
))
(declare-fun arrayNoDuplicates!0 (array!73664 (_ BitVec 32) List!24826) Bool)

(assert (=> b!1130525 (= res!755348 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24823))))

(declare-fun b!1130526 () Bool)

(declare-fun res!755350 () Bool)

(assert (=> b!1130526 (=> (not res!755350) (not e!643386))))

(assert (=> b!1130526 (= res!755350 (arrayNoDuplicates!0 lt!501900 #b00000000000000000000000000000000 Nil!24823))))

(declare-fun b!1130527 () Bool)

(declare-fun res!755347 () Bool)

(assert (=> b!1130527 (=> (not res!755347) (not e!643377))))

(assert (=> b!1130527 (= res!755347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44479 () Bool)

(assert (=> mapIsEmpty!44479 mapRes!44479))

(declare-fun b!1130528 () Bool)

(declare-fun c!110028 () Bool)

(assert (=> b!1130528 (= c!110028 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501909))))

(assert (=> b!1130528 (= e!643381 e!643384)))

(declare-fun b!1130529 () Bool)

(assert (=> b!1130529 call!48384))

(declare-fun lt!501907 () Unit!36879)

(assert (=> b!1130529 (= lt!501907 call!48386)))

(assert (=> b!1130529 (= e!643381 lt!501907)))

(declare-fun b!1130530 () Bool)

(declare-fun res!755358 () Bool)

(assert (=> b!1130530 (=> (not res!755358) (not e!643377))))

(assert (=> b!1130530 (= res!755358 (= (select (arr!35485 _keys!1208) i!673) k0!934))))

(declare-fun res!755356 () Bool)

(assert (=> start!98204 (=> (not res!755356) (not e!643377))))

(assert (=> start!98204 (= res!755356 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36023 _keys!1208))))))

(assert (=> start!98204 e!643377))

(assert (=> start!98204 tp_is_empty!28441))

(declare-fun array_inv!27296 (array!73664) Bool)

(assert (=> start!98204 (array_inv!27296 _keys!1208)))

(assert (=> start!98204 true))

(assert (=> start!98204 tp!84436))

(declare-fun array_inv!27297 (array!73662) Bool)

(assert (=> start!98204 (and (array_inv!27297 _values!996) e!643373)))

(declare-fun bm!48385 () Bool)

(assert (=> bm!48385 (= call!48385 (addStillContains!695 lt!501898 (ite (or c!110027 c!110025) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110027 c!110025) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1130531 () Bool)

(assert (=> b!1130531 (= e!643386 (not e!643379))))

(declare-fun res!755351 () Bool)

(assert (=> b!1130531 (=> res!755351 e!643379)))

(assert (=> b!1130531 (= res!755351 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130531 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501912 () Unit!36879)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73664 (_ BitVec 64) (_ BitVec 32)) Unit!36879)

(assert (=> b!1130531 (= lt!501912 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!48386 () Bool)

(assert (=> bm!48386 (= call!48384 call!48388)))

(declare-fun b!1130532 () Bool)

(declare-fun res!755359 () Bool)

(assert (=> b!1130532 (=> (not res!755359) (not e!643377))))

(assert (=> b!1130532 (= res!755359 (and (= (size!36022 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36023 _keys!1208) (size!36022 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98204 res!755356) b!1130516))

(assert (= (and b!1130516 res!755355) b!1130532))

(assert (= (and b!1130532 res!755359) b!1130527))

(assert (= (and b!1130527 res!755347) b!1130525))

(assert (= (and b!1130525 res!755348) b!1130520))

(assert (= (and b!1130520 res!755354) b!1130523))

(assert (= (and b!1130523 res!755346) b!1130530))

(assert (= (and b!1130530 res!755358) b!1130511))

(assert (= (and b!1130511 res!755357) b!1130526))

(assert (= (and b!1130526 res!755350) b!1130531))

(assert (= (and b!1130531 (not res!755351)) b!1130507))

(assert (= (and b!1130507 (not res!755349)) b!1130510))

(assert (= (and b!1130510 c!110026) b!1130512))

(assert (= (and b!1130510 (not c!110026)) b!1130515))

(assert (= (or b!1130512 b!1130515) bm!48383))

(assert (= (or b!1130512 b!1130515) bm!48379))

(assert (= (and b!1130510 (not res!755352)) b!1130517))

(assert (= (and b!1130517 (not res!755345)) b!1130513))

(assert (= (and b!1130513 c!110027) b!1130524))

(assert (= (and b!1130513 (not c!110027)) b!1130518))

(assert (= (and b!1130518 c!110025) b!1130529))

(assert (= (and b!1130518 (not c!110025)) b!1130528))

(assert (= (and b!1130528 c!110028) b!1130514))

(assert (= (and b!1130528 (not c!110028)) b!1130519))

(assert (= (or b!1130529 b!1130514) bm!48381))

(assert (= (or b!1130529 b!1130514) bm!48380))

(assert (= (or b!1130529 b!1130514) bm!48386))

(assert (= (or b!1130524 bm!48386) bm!48384))

(assert (= (or b!1130524 bm!48381) bm!48385))

(assert (= (or b!1130524 bm!48380) bm!48382))

(assert (= (and b!1130513 (not res!755353)) b!1130508))

(assert (= (and b!1130521 condMapEmpty!44479) mapIsEmpty!44479))

(assert (= (and b!1130521 (not condMapEmpty!44479)) mapNonEmpty!44479))

(get-info :version)

(assert (= (and mapNonEmpty!44479 ((_ is ValueCellFull!13511) mapValue!44479)) b!1130522))

(assert (= (and b!1130521 ((_ is ValueCellFull!13511) mapDefault!44479)) b!1130509))

(assert (= start!98204 b!1130521))

(declare-fun b_lambda!18863 () Bool)

(assert (=> (not b_lambda!18863) (not b!1130507)))

(declare-fun t!35718 () Bool)

(declare-fun tb!8715 () Bool)

(assert (=> (and start!98204 (= defaultEntry!1004 defaultEntry!1004) t!35718) tb!8715))

(declare-fun result!17999 () Bool)

(assert (=> tb!8715 (= result!17999 tp_is_empty!28441)))

(assert (=> b!1130507 t!35718))

(declare-fun b_and!38585 () Bool)

(assert (= b_and!38583 (and (=> t!35718 result!17999) b_and!38585)))

(declare-fun m!1043117 () Bool)

(assert (=> bm!48383 m!1043117))

(declare-fun m!1043119 () Bool)

(assert (=> bm!48385 m!1043119))

(declare-fun m!1043121 () Bool)

(assert (=> b!1130524 m!1043121))

(declare-fun m!1043123 () Bool)

(assert (=> b!1130524 m!1043123))

(declare-fun m!1043125 () Bool)

(assert (=> b!1130524 m!1043125))

(declare-fun m!1043127 () Bool)

(assert (=> bm!48379 m!1043127))

(declare-fun m!1043129 () Bool)

(assert (=> b!1130517 m!1043129))

(assert (=> b!1130517 m!1043127))

(declare-fun m!1043131 () Bool)

(assert (=> b!1130512 m!1043131))

(declare-fun m!1043133 () Bool)

(assert (=> b!1130525 m!1043133))

(declare-fun m!1043135 () Bool)

(assert (=> b!1130523 m!1043135))

(declare-fun m!1043137 () Bool)

(assert (=> b!1130507 m!1043137))

(declare-fun m!1043139 () Bool)

(assert (=> b!1130507 m!1043139))

(declare-fun m!1043141 () Bool)

(assert (=> b!1130507 m!1043141))

(declare-fun m!1043143 () Bool)

(assert (=> b!1130507 m!1043143))

(declare-fun m!1043145 () Bool)

(assert (=> b!1130527 m!1043145))

(declare-fun m!1043147 () Bool)

(assert (=> b!1130510 m!1043147))

(declare-fun m!1043149 () Bool)

(assert (=> b!1130510 m!1043149))

(declare-fun m!1043151 () Bool)

(assert (=> b!1130516 m!1043151))

(declare-fun m!1043153 () Bool)

(assert (=> b!1130531 m!1043153))

(declare-fun m!1043155 () Bool)

(assert (=> b!1130531 m!1043155))

(declare-fun m!1043157 () Bool)

(assert (=> bm!48384 m!1043157))

(declare-fun m!1043159 () Bool)

(assert (=> b!1130530 m!1043159))

(declare-fun m!1043161 () Bool)

(assert (=> bm!48382 m!1043161))

(declare-fun m!1043163 () Bool)

(assert (=> b!1130511 m!1043163))

(declare-fun m!1043165 () Bool)

(assert (=> b!1130511 m!1043165))

(declare-fun m!1043167 () Bool)

(assert (=> mapNonEmpty!44479 m!1043167))

(declare-fun m!1043169 () Bool)

(assert (=> b!1130526 m!1043169))

(declare-fun m!1043171 () Bool)

(assert (=> start!98204 m!1043171))

(declare-fun m!1043173 () Bool)

(assert (=> start!98204 m!1043173))

(declare-fun m!1043175 () Bool)

(assert (=> b!1130508 m!1043175))

(assert (=> b!1130508 m!1043175))

(declare-fun m!1043177 () Bool)

(assert (=> b!1130508 m!1043177))

(check-sat (not b!1130507) (not b!1130524) (not b!1130511) b_and!38585 (not b!1130510) (not b!1130525) (not start!98204) (not b!1130516) (not bm!48383) (not mapNonEmpty!44479) (not b!1130512) (not bm!48379) tp_is_empty!28441 (not b!1130508) (not b!1130526) (not b!1130517) (not b_next!23911) (not b_lambda!18863) (not b!1130531) (not bm!48382) (not b!1130527) (not b!1130523) (not bm!48384) (not bm!48385))
(check-sat b_and!38585 (not b_next!23911))

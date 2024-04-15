; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98354 () Bool)

(assert start!98354)

(declare-fun b_free!23965 () Bool)

(declare-fun b_next!23965 () Bool)

(assert (=> start!98354 (= b_free!23965 (not b_next!23965))))

(declare-fun tp!84605 () Bool)

(declare-fun b_and!38757 () Bool)

(assert (=> start!98354 (= tp!84605 b_and!38757)))

(declare-fun b!1133481 () Bool)

(declare-datatypes ((Unit!36985 0))(
  ( (Unit!36986) )
))
(declare-fun e!645083 () Unit!36985)

(declare-fun lt!503582 () Unit!36985)

(assert (=> b!1133481 (= e!645083 lt!503582)))

(declare-fun call!49100 () Unit!36985)

(assert (=> b!1133481 (= lt!503582 call!49100)))

(declare-fun call!49101 () Bool)

(assert (=> b!1133481 call!49101))

(declare-fun b!1133482 () Bool)

(declare-fun e!645089 () Bool)

(declare-fun e!645090 () Bool)

(assert (=> b!1133482 (= e!645089 e!645090)))

(declare-fun res!756829 () Bool)

(assert (=> b!1133482 (=> (not res!756829) (not e!645090))))

(declare-datatypes ((array!73774 0))(
  ( (array!73775 (arr!35538 (Array (_ BitVec 32) (_ BitVec 64))) (size!36076 (_ BitVec 32))) )
))
(declare-fun lt!503580 () array!73774)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73774 (_ BitVec 32)) Bool)

(assert (=> b!1133482 (= res!756829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503580 mask!1564))))

(declare-fun _keys!1208 () array!73774)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133482 (= lt!503580 (array!73775 (store (arr!35538 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36076 _keys!1208)))))

(declare-fun b!1133483 () Bool)

(declare-fun res!756836 () Bool)

(assert (=> b!1133483 (=> (not res!756836) (not e!645089))))

(declare-datatypes ((List!24872 0))(
  ( (Nil!24869) (Cons!24868 (h!26077 (_ BitVec 64)) (t!35820 List!24872)) )
))
(declare-fun arrayNoDuplicates!0 (array!73774 (_ BitVec 32) List!24872) Bool)

(assert (=> b!1133483 (= res!756836 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24869))))

(declare-fun b!1133484 () Bool)

(declare-fun e!645088 () Bool)

(declare-fun e!645095 () Bool)

(assert (=> b!1133484 (= e!645088 e!645095)))

(declare-fun res!756826 () Bool)

(assert (=> b!1133484 (=> res!756826 e!645095)))

(declare-datatypes ((V!43121 0))(
  ( (V!43122 (val!14304 Int)) )
))
(declare-datatypes ((tuple2!18126 0))(
  ( (tuple2!18127 (_1!9074 (_ BitVec 64)) (_2!9074 V!43121)) )
))
(declare-datatypes ((List!24873 0))(
  ( (Nil!24870) (Cons!24869 (h!26078 tuple2!18126) (t!35821 List!24873)) )
))
(declare-datatypes ((ListLongMap!16095 0))(
  ( (ListLongMap!16096 (toList!8063 List!24873)) )
))
(declare-fun lt!503581 () ListLongMap!16095)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6517 (ListLongMap!16095 (_ BitVec 64)) Bool)

(assert (=> b!1133484 (= res!756826 (not (contains!6517 lt!503581 k0!934)))))

(declare-fun zeroValue!944 () V!43121)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43121)

(declare-datatypes ((ValueCell!13538 0))(
  ( (ValueCellFull!13538 (v!16940 V!43121)) (EmptyCell!13538) )
))
(declare-datatypes ((array!73776 0))(
  ( (array!73777 (arr!35539 (Array (_ BitVec 32) ValueCell!13538)) (size!36077 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73776)

(declare-fun getCurrentListMapNoExtraKeys!4561 (array!73774 array!73776 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 32) Int) ListLongMap!16095)

(assert (=> b!1133484 (= lt!503581 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133485 () Bool)

(declare-fun lt!503591 () Bool)

(declare-fun e!645096 () Bool)

(assert (=> b!1133485 (= e!645096 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503591) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133486 () Bool)

(declare-fun e!645085 () Unit!36985)

(declare-fun e!645094 () Unit!36985)

(assert (=> b!1133486 (= e!645085 e!645094)))

(declare-fun c!110616 () Bool)

(assert (=> b!1133486 (= c!110616 (and (not lt!503591) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133487 () Bool)

(declare-fun c!110617 () Bool)

(assert (=> b!1133487 (= c!110617 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503591))))

(assert (=> b!1133487 (= e!645094 e!645083)))

(declare-fun b!1133488 () Bool)

(declare-fun Unit!36987 () Unit!36985)

(assert (=> b!1133488 (= e!645083 Unit!36987)))

(declare-fun b!1133490 () Bool)

(declare-fun e!645091 () Bool)

(assert (=> b!1133490 (= e!645091 e!645088)))

(declare-fun res!756824 () Bool)

(assert (=> b!1133490 (=> res!756824 e!645088)))

(assert (=> b!1133490 (= res!756824 (not (= (select (arr!35538 _keys!1208) from!1455) k0!934)))))

(declare-fun e!645082 () Bool)

(assert (=> b!1133490 e!645082))

(declare-fun c!110618 () Bool)

(assert (=> b!1133490 (= c!110618 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503583 () Unit!36985)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!449 (array!73774 array!73776 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36985)

(assert (=> b!1133490 (= lt!503583 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133491 () Bool)

(declare-fun e!645093 () Bool)

(assert (=> b!1133491 (= e!645093 e!645091)))

(declare-fun res!756833 () Bool)

(assert (=> b!1133491 (=> res!756833 e!645091)))

(assert (=> b!1133491 (= res!756833 (not (= from!1455 i!673)))))

(declare-fun lt!503585 () array!73776)

(declare-fun lt!503592 () ListLongMap!16095)

(assert (=> b!1133491 (= lt!503592 (getCurrentListMapNoExtraKeys!4561 lt!503580 lt!503585 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2560 (Int (_ BitVec 64)) V!43121)

(assert (=> b!1133491 (= lt!503585 (array!73777 (store (arr!35539 _values!996) i!673 (ValueCellFull!13538 (dynLambda!2560 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36077 _values!996)))))

(declare-fun lt!503579 () ListLongMap!16095)

(assert (=> b!1133491 (= lt!503579 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133492 () Bool)

(declare-fun res!756835 () Bool)

(assert (=> b!1133492 (=> (not res!756835) (not e!645089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133492 (= res!756835 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44567 () Bool)

(declare-fun mapRes!44567 () Bool)

(declare-fun tp!84606 () Bool)

(declare-fun e!645087 () Bool)

(assert (=> mapNonEmpty!44567 (= mapRes!44567 (and tp!84606 e!645087))))

(declare-fun mapKey!44567 () (_ BitVec 32))

(declare-fun mapValue!44567 () ValueCell!13538)

(declare-fun mapRest!44567 () (Array (_ BitVec 32) ValueCell!13538))

(assert (=> mapNonEmpty!44567 (= (arr!35539 _values!996) (store mapRest!44567 mapKey!44567 mapValue!44567))))

(declare-fun b!1133493 () Bool)

(declare-fun e!645081 () Bool)

(declare-fun tp_is_empty!28495 () Bool)

(assert (=> b!1133493 (= e!645081 tp_is_empty!28495)))

(declare-fun bm!49096 () Bool)

(declare-fun call!49102 () Bool)

(assert (=> bm!49096 (= call!49101 call!49102)))

(declare-fun bm!49097 () Bool)

(declare-fun call!49104 () ListLongMap!16095)

(declare-fun call!49105 () ListLongMap!16095)

(assert (=> bm!49097 (= call!49104 call!49105)))

(declare-fun mapIsEmpty!44567 () Bool)

(assert (=> mapIsEmpty!44567 mapRes!44567))

(declare-fun bm!49098 () Bool)

(declare-fun c!110615 () Bool)

(declare-fun lt!503586 () ListLongMap!16095)

(assert (=> bm!49098 (= call!49102 (contains!6517 (ite c!110615 lt!503586 call!49104) k0!934))))

(declare-fun b!1133494 () Bool)

(declare-fun res!756830 () Bool)

(assert (=> b!1133494 (=> (not res!756830) (not e!645089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133494 (= res!756830 (validMask!0 mask!1564))))

(declare-fun bm!49099 () Bool)

(declare-fun +!3497 (ListLongMap!16095 tuple2!18126) ListLongMap!16095)

(assert (=> bm!49099 (= call!49105 (+!3497 (ite c!110615 lt!503586 lt!503581) (ite c!110615 (tuple2!18127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110616 (tuple2!18127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!49103 () ListLongMap!16095)

(declare-fun bm!49100 () Bool)

(assert (=> bm!49100 (= call!49103 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133495 () Bool)

(declare-fun lt!503588 () Unit!36985)

(assert (=> b!1133495 (= e!645085 lt!503588)))

(declare-fun lt!503587 () Unit!36985)

(declare-fun addStillContains!715 (ListLongMap!16095 (_ BitVec 64) V!43121 (_ BitVec 64)) Unit!36985)

(assert (=> b!1133495 (= lt!503587 (addStillContains!715 lt!503581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1133495 (= lt!503586 (+!3497 lt!503581 (tuple2!18127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1133495 call!49102))

(declare-fun call!49099 () Unit!36985)

(assert (=> b!1133495 (= lt!503588 call!49099)))

(assert (=> b!1133495 (contains!6517 call!49105 k0!934)))

(declare-fun b!1133496 () Bool)

(declare-fun e!645086 () Bool)

(declare-fun arrayContainsKey!0 (array!73774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133496 (= e!645086 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49101 () Bool)

(assert (=> bm!49101 (= call!49100 call!49099)))

(declare-fun b!1133497 () Bool)

(assert (=> b!1133497 call!49101))

(declare-fun lt!503578 () Unit!36985)

(assert (=> b!1133497 (= lt!503578 call!49100)))

(assert (=> b!1133497 (= e!645094 lt!503578)))

(declare-fun b!1133498 () Bool)

(declare-fun e!645084 () Bool)

(assert (=> b!1133498 (= e!645084 (and e!645081 mapRes!44567))))

(declare-fun condMapEmpty!44567 () Bool)

(declare-fun mapDefault!44567 () ValueCell!13538)

(assert (=> b!1133498 (= condMapEmpty!44567 (= (arr!35539 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13538)) mapDefault!44567)))))

(declare-fun b!1133499 () Bool)

(declare-fun res!756831 () Bool)

(assert (=> b!1133499 (=> (not res!756831) (not e!645089))))

(assert (=> b!1133499 (= res!756831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133500 () Bool)

(declare-fun call!49106 () ListLongMap!16095)

(assert (=> b!1133500 (= e!645082 (= call!49106 call!49103))))

(declare-fun b!1133501 () Bool)

(assert (=> b!1133501 (= e!645087 tp_is_empty!28495)))

(declare-fun bm!49102 () Bool)

(assert (=> bm!49102 (= call!49106 (getCurrentListMapNoExtraKeys!4561 lt!503580 lt!503585 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133489 () Bool)

(declare-fun -!1165 (ListLongMap!16095 (_ BitVec 64)) ListLongMap!16095)

(assert (=> b!1133489 (= e!645082 (= call!49106 (-!1165 call!49103 k0!934)))))

(declare-fun res!756825 () Bool)

(assert (=> start!98354 (=> (not res!756825) (not e!645089))))

(assert (=> start!98354 (= res!756825 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36076 _keys!1208))))))

(assert (=> start!98354 e!645089))

(assert (=> start!98354 tp_is_empty!28495))

(declare-fun array_inv!27330 (array!73774) Bool)

(assert (=> start!98354 (array_inv!27330 _keys!1208)))

(assert (=> start!98354 true))

(assert (=> start!98354 tp!84605))

(declare-fun array_inv!27331 (array!73776) Bool)

(assert (=> start!98354 (and (array_inv!27331 _values!996) e!645084)))

(declare-fun b!1133502 () Bool)

(declare-fun res!756823 () Bool)

(assert (=> b!1133502 (=> (not res!756823) (not e!645089))))

(assert (=> b!1133502 (= res!756823 (and (= (size!36077 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36076 _keys!1208) (size!36077 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1133503 () Bool)

(assert (=> b!1133503 (= e!645096 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133504 () Bool)

(declare-fun res!756822 () Bool)

(assert (=> b!1133504 (=> (not res!756822) (not e!645090))))

(assert (=> b!1133504 (= res!756822 (arrayNoDuplicates!0 lt!503580 #b00000000000000000000000000000000 Nil!24869))))

(declare-fun b!1133505 () Bool)

(assert (=> b!1133505 (= e!645095 true)))

(assert (=> b!1133505 e!645086))

(declare-fun res!756828 () Bool)

(assert (=> b!1133505 (=> (not res!756828) (not e!645086))))

(assert (=> b!1133505 (= res!756828 e!645096)))

(declare-fun c!110614 () Bool)

(assert (=> b!1133505 (= c!110614 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503590 () Unit!36985)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!329 (array!73774 array!73776 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 64) (_ BitVec 32) Int) Unit!36985)

(assert (=> b!1133505 (= lt!503590 (lemmaListMapContainsThenArrayContainsFrom!329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503584 () Unit!36985)

(assert (=> b!1133505 (= lt!503584 e!645085)))

(assert (=> b!1133505 (= c!110615 (and (not lt!503591) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133505 (= lt!503591 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133506 () Bool)

(declare-fun res!756834 () Bool)

(assert (=> b!1133506 (=> (not res!756834) (not e!645089))))

(assert (=> b!1133506 (= res!756834 (= (select (arr!35538 _keys!1208) i!673) k0!934))))

(declare-fun bm!49103 () Bool)

(assert (=> bm!49103 (= call!49099 (addStillContains!715 (ite c!110615 lt!503586 lt!503581) (ite c!110615 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110616 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110615 minValue!944 (ite c!110616 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1133507 () Bool)

(declare-fun res!756827 () Bool)

(assert (=> b!1133507 (=> (not res!756827) (not e!645089))))

(assert (=> b!1133507 (= res!756827 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36076 _keys!1208))))))

(declare-fun b!1133508 () Bool)

(assert (=> b!1133508 (= e!645090 (not e!645093))))

(declare-fun res!756832 () Bool)

(assert (=> b!1133508 (=> res!756832 e!645093)))

(assert (=> b!1133508 (= res!756832 (bvsgt from!1455 i!673))))

(assert (=> b!1133508 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503589 () Unit!36985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73774 (_ BitVec 64) (_ BitVec 32)) Unit!36985)

(assert (=> b!1133508 (= lt!503589 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98354 res!756825) b!1133494))

(assert (= (and b!1133494 res!756830) b!1133502))

(assert (= (and b!1133502 res!756823) b!1133499))

(assert (= (and b!1133499 res!756831) b!1133483))

(assert (= (and b!1133483 res!756836) b!1133507))

(assert (= (and b!1133507 res!756827) b!1133492))

(assert (= (and b!1133492 res!756835) b!1133506))

(assert (= (and b!1133506 res!756834) b!1133482))

(assert (= (and b!1133482 res!756829) b!1133504))

(assert (= (and b!1133504 res!756822) b!1133508))

(assert (= (and b!1133508 (not res!756832)) b!1133491))

(assert (= (and b!1133491 (not res!756833)) b!1133490))

(assert (= (and b!1133490 c!110618) b!1133489))

(assert (= (and b!1133490 (not c!110618)) b!1133500))

(assert (= (or b!1133489 b!1133500) bm!49102))

(assert (= (or b!1133489 b!1133500) bm!49100))

(assert (= (and b!1133490 (not res!756824)) b!1133484))

(assert (= (and b!1133484 (not res!756826)) b!1133505))

(assert (= (and b!1133505 c!110615) b!1133495))

(assert (= (and b!1133505 (not c!110615)) b!1133486))

(assert (= (and b!1133486 c!110616) b!1133497))

(assert (= (and b!1133486 (not c!110616)) b!1133487))

(assert (= (and b!1133487 c!110617) b!1133481))

(assert (= (and b!1133487 (not c!110617)) b!1133488))

(assert (= (or b!1133497 b!1133481) bm!49101))

(assert (= (or b!1133497 b!1133481) bm!49097))

(assert (= (or b!1133497 b!1133481) bm!49096))

(assert (= (or b!1133495 bm!49096) bm!49098))

(assert (= (or b!1133495 bm!49101) bm!49103))

(assert (= (or b!1133495 bm!49097) bm!49099))

(assert (= (and b!1133505 c!110614) b!1133503))

(assert (= (and b!1133505 (not c!110614)) b!1133485))

(assert (= (and b!1133505 res!756828) b!1133496))

(assert (= (and b!1133498 condMapEmpty!44567) mapIsEmpty!44567))

(assert (= (and b!1133498 (not condMapEmpty!44567)) mapNonEmpty!44567))

(get-info :version)

(assert (= (and mapNonEmpty!44567 ((_ is ValueCellFull!13538) mapValue!44567)) b!1133501))

(assert (= (and b!1133498 ((_ is ValueCellFull!13538) mapDefault!44567)) b!1133493))

(assert (= start!98354 b!1133498))

(declare-fun b_lambda!19053 () Bool)

(assert (=> (not b_lambda!19053) (not b!1133491)))

(declare-fun t!35819 () Bool)

(declare-fun tb!8769 () Bool)

(assert (=> (and start!98354 (= defaultEntry!1004 defaultEntry!1004) t!35819) tb!8769))

(declare-fun result!18111 () Bool)

(assert (=> tb!8769 (= result!18111 tp_is_empty!28495)))

(assert (=> b!1133491 t!35819))

(declare-fun b_and!38759 () Bool)

(assert (= b_and!38757 (and (=> t!35819 result!18111) b_and!38759)))

(declare-fun m!1046035 () Bool)

(assert (=> b!1133491 m!1046035))

(declare-fun m!1046037 () Bool)

(assert (=> b!1133491 m!1046037))

(declare-fun m!1046039 () Bool)

(assert (=> b!1133491 m!1046039))

(declare-fun m!1046041 () Bool)

(assert (=> b!1133491 m!1046041))

(declare-fun m!1046043 () Bool)

(assert (=> bm!49100 m!1046043))

(declare-fun m!1046045 () Bool)

(assert (=> b!1133484 m!1046045))

(assert (=> b!1133484 m!1046043))

(declare-fun m!1046047 () Bool)

(assert (=> b!1133505 m!1046047))

(declare-fun m!1046049 () Bool)

(assert (=> b!1133503 m!1046049))

(declare-fun m!1046051 () Bool)

(assert (=> b!1133482 m!1046051))

(declare-fun m!1046053 () Bool)

(assert (=> b!1133482 m!1046053))

(declare-fun m!1046055 () Bool)

(assert (=> b!1133495 m!1046055))

(declare-fun m!1046057 () Bool)

(assert (=> b!1133495 m!1046057))

(declare-fun m!1046059 () Bool)

(assert (=> b!1133495 m!1046059))

(declare-fun m!1046061 () Bool)

(assert (=> b!1133483 m!1046061))

(declare-fun m!1046063 () Bool)

(assert (=> bm!49103 m!1046063))

(declare-fun m!1046065 () Bool)

(assert (=> b!1133504 m!1046065))

(declare-fun m!1046067 () Bool)

(assert (=> b!1133490 m!1046067))

(declare-fun m!1046069 () Bool)

(assert (=> b!1133490 m!1046069))

(declare-fun m!1046071 () Bool)

(assert (=> b!1133494 m!1046071))

(declare-fun m!1046073 () Bool)

(assert (=> b!1133506 m!1046073))

(declare-fun m!1046075 () Bool)

(assert (=> bm!49098 m!1046075))

(declare-fun m!1046077 () Bool)

(assert (=> start!98354 m!1046077))

(declare-fun m!1046079 () Bool)

(assert (=> start!98354 m!1046079))

(declare-fun m!1046081 () Bool)

(assert (=> bm!49099 m!1046081))

(declare-fun m!1046083 () Bool)

(assert (=> bm!49102 m!1046083))

(declare-fun m!1046085 () Bool)

(assert (=> mapNonEmpty!44567 m!1046085))

(declare-fun m!1046087 () Bool)

(assert (=> b!1133508 m!1046087))

(declare-fun m!1046089 () Bool)

(assert (=> b!1133508 m!1046089))

(assert (=> b!1133496 m!1046049))

(declare-fun m!1046091 () Bool)

(assert (=> b!1133492 m!1046091))

(declare-fun m!1046093 () Bool)

(assert (=> b!1133499 m!1046093))

(declare-fun m!1046095 () Bool)

(assert (=> b!1133489 m!1046095))

(check-sat (not start!98354) tp_is_empty!28495 b_and!38759 (not bm!49100) (not b!1133505) (not b!1133504) (not b!1133508) (not b!1133496) (not bm!49102) (not mapNonEmpty!44567) (not b_lambda!19053) (not b!1133491) (not b_next!23965) (not b!1133489) (not b!1133483) (not b!1133495) (not b!1133499) (not bm!49099) (not b!1133503) (not b!1133484) (not bm!49103) (not b!1133490) (not b!1133482) (not b!1133494) (not bm!49098) (not b!1133492))
(check-sat b_and!38759 (not b_next!23965))

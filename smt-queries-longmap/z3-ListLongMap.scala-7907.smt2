; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98180 () Bool)

(assert start!98180)

(declare-fun b_free!23887 () Bool)

(declare-fun b_next!23887 () Bool)

(assert (=> start!98180 (= b_free!23887 (not b_next!23887))))

(declare-fun tp!84365 () Bool)

(declare-fun b_and!38535 () Bool)

(assert (=> start!98180 (= tp!84365 b_and!38535)))

(declare-fun b!1129547 () Bool)

(declare-fun res!754817 () Bool)

(declare-fun e!642835 () Bool)

(assert (=> b!1129547 (=> (not res!754817) (not e!642835))))

(declare-datatypes ((array!73616 0))(
  ( (array!73617 (arr!35461 (Array (_ BitVec 32) (_ BitVec 64))) (size!35999 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73616)

(declare-datatypes ((List!24805 0))(
  ( (Nil!24802) (Cons!24801 (h!26010 (_ BitVec 64)) (t!35675 List!24805)) )
))
(declare-fun arrayNoDuplicates!0 (array!73616 (_ BitVec 32) List!24805) Bool)

(assert (=> b!1129547 (= res!754817 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24802))))

(declare-fun b!1129548 () Bool)

(declare-datatypes ((Unit!36850 0))(
  ( (Unit!36851) )
))
(declare-fun e!642834 () Unit!36850)

(declare-fun e!642833 () Unit!36850)

(assert (=> b!1129548 (= e!642834 e!642833)))

(declare-fun c!109883 () Bool)

(declare-fun lt!501359 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1129548 (= c!109883 (and (not lt!501359) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129549 () Bool)

(declare-fun res!754809 () Bool)

(assert (=> b!1129549 (=> (not res!754809) (not e!642835))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129549 (= res!754809 (validMask!0 mask!1564))))

(declare-datatypes ((V!43017 0))(
  ( (V!43018 (val!14265 Int)) )
))
(declare-fun zeroValue!944 () V!43017)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!48091 () Bool)

(declare-datatypes ((ValueCell!13499 0))(
  ( (ValueCellFull!13499 (v!16897 V!43017)) (EmptyCell!13499) )
))
(declare-datatypes ((array!73618 0))(
  ( (array!73619 (arr!35462 (Array (_ BitVec 32) ValueCell!13499)) (size!36000 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73618)

(declare-datatypes ((tuple2!18054 0))(
  ( (tuple2!18055 (_1!9038 (_ BitVec 64)) (_2!9038 V!43017)) )
))
(declare-datatypes ((List!24806 0))(
  ( (Nil!24803) (Cons!24802 (h!26011 tuple2!18054) (t!35676 List!24806)) )
))
(declare-datatypes ((ListLongMap!16023 0))(
  ( (ListLongMap!16024 (toList!8027 List!24806)) )
))
(declare-fun call!48100 () ListLongMap!16023)

(declare-fun minValue!944 () V!43017)

(declare-fun getCurrentListMapNoExtraKeys!4527 (array!73616 array!73618 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) Int) ListLongMap!16023)

(assert (=> bm!48091 (= call!48100 (getCurrentListMapNoExtraKeys!4527 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129550 () Bool)

(declare-fun e!642839 () Unit!36850)

(declare-fun Unit!36852 () Unit!36850)

(assert (=> b!1129550 (= e!642839 Unit!36852)))

(declare-fun b!1129552 () Bool)

(declare-fun e!642837 () Bool)

(declare-fun e!642844 () Bool)

(assert (=> b!1129552 (= e!642837 e!642844)))

(declare-fun res!754808 () Bool)

(assert (=> b!1129552 (=> res!754808 e!642844)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1129552 (= res!754808 (not (= (select (arr!35461 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642838 () Bool)

(assert (=> b!1129552 e!642838))

(declare-fun c!109882 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129552 (= c!109882 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501364 () Unit!36850)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!422 (array!73616 array!73618 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36850)

(assert (=> b!1129552 (= lt!501364 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129553 () Bool)

(declare-fun e!642845 () Bool)

(assert (=> b!1129553 (= e!642835 e!642845)))

(declare-fun res!754819 () Bool)

(assert (=> b!1129553 (=> (not res!754819) (not e!642845))))

(declare-fun lt!501371 () array!73616)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73616 (_ BitVec 32)) Bool)

(assert (=> b!1129553 (= res!754819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501371 mask!1564))))

(assert (=> b!1129553 (= lt!501371 (array!73617 (store (arr!35461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35999 _keys!1208)))))

(declare-fun mapIsEmpty!44443 () Bool)

(declare-fun mapRes!44443 () Bool)

(assert (=> mapIsEmpty!44443 mapRes!44443))

(declare-fun b!1129554 () Bool)

(declare-fun e!642841 () Bool)

(assert (=> b!1129554 (= e!642841 true)))

(declare-fun lt!501358 () Bool)

(declare-fun contains!6479 (ListLongMap!16023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4357 (array!73616 array!73618 (_ BitVec 32) (_ BitVec 32) V!43017 V!43017 (_ BitVec 32) Int) ListLongMap!16023)

(assert (=> b!1129554 (= lt!501358 (contains!6479 (getCurrentListMap!4357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!48092 () Bool)

(declare-fun call!48094 () Bool)

(declare-fun call!48101 () Bool)

(assert (=> bm!48092 (= call!48094 call!48101)))

(declare-fun b!1129555 () Bool)

(declare-fun e!642832 () Bool)

(assert (=> b!1129555 (= e!642832 e!642841)))

(declare-fun res!754815 () Bool)

(assert (=> b!1129555 (=> res!754815 e!642841)))

(assert (=> b!1129555 (= res!754815 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!35999 _keys!1208))))))

(declare-fun lt!501360 () Unit!36850)

(assert (=> b!1129555 (= lt!501360 e!642834)))

(declare-fun c!109881 () Bool)

(assert (=> b!1129555 (= c!109881 (and (not lt!501359) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129555 (= lt!501359 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!501366 () ListLongMap!16023)

(declare-fun call!48096 () ListLongMap!16023)

(declare-fun bm!48093 () Bool)

(assert (=> bm!48093 (= call!48101 (contains!6479 (ite c!109881 lt!501366 call!48096) k0!934))))

(declare-fun b!1129556 () Bool)

(declare-fun c!109884 () Bool)

(assert (=> b!1129556 (= c!109884 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501359))))

(assert (=> b!1129556 (= e!642833 e!642839)))

(declare-fun call!48099 () ListLongMap!16023)

(declare-fun b!1129557 () Bool)

(declare-fun -!1140 (ListLongMap!16023 (_ BitVec 64)) ListLongMap!16023)

(assert (=> b!1129557 (= e!642838 (= call!48099 (-!1140 call!48100 k0!934)))))

(declare-fun b!1129558 () Bool)

(assert (=> b!1129558 (= e!642838 (= call!48099 call!48100))))

(declare-fun b!1129559 () Bool)

(declare-fun lt!501367 () Unit!36850)

(assert (=> b!1129559 (= e!642834 lt!501367)))

(declare-fun lt!501368 () Unit!36850)

(declare-fun call!48095 () Unit!36850)

(assert (=> b!1129559 (= lt!501368 call!48095)))

(declare-fun call!48097 () ListLongMap!16023)

(assert (=> b!1129559 (= lt!501366 call!48097)))

(assert (=> b!1129559 call!48101))

(declare-fun addStillContains!686 (ListLongMap!16023 (_ BitVec 64) V!43017 (_ BitVec 64)) Unit!36850)

(assert (=> b!1129559 (= lt!501367 (addStillContains!686 lt!501366 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3469 (ListLongMap!16023 tuple2!18054) ListLongMap!16023)

(assert (=> b!1129559 (contains!6479 (+!3469 lt!501366 (tuple2!18055 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1129560 () Bool)

(declare-fun res!754814 () Bool)

(assert (=> b!1129560 (=> (not res!754814) (not e!642835))))

(assert (=> b!1129560 (= res!754814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129561 () Bool)

(declare-fun e!642843 () Bool)

(declare-fun tp_is_empty!28417 () Bool)

(assert (=> b!1129561 (= e!642843 tp_is_empty!28417)))

(declare-fun b!1129562 () Bool)

(declare-fun res!754806 () Bool)

(assert (=> b!1129562 (=> (not res!754806) (not e!642835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129562 (= res!754806 (validKeyInArray!0 k0!934))))

(declare-fun b!1129563 () Bool)

(declare-fun e!642836 () Bool)

(assert (=> b!1129563 (= e!642845 (not e!642836))))

(declare-fun res!754810 () Bool)

(assert (=> b!1129563 (=> res!754810 e!642836)))

(assert (=> b!1129563 (= res!754810 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129563 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501361 () Unit!36850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73616 (_ BitVec 64) (_ BitVec 32)) Unit!36850)

(assert (=> b!1129563 (= lt!501361 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129564 () Bool)

(assert (=> b!1129564 (= e!642844 e!642832)))

(declare-fun res!754818 () Bool)

(assert (=> b!1129564 (=> res!754818 e!642832)))

(declare-fun lt!501365 () ListLongMap!16023)

(assert (=> b!1129564 (= res!754818 (not (contains!6479 lt!501365 k0!934)))))

(assert (=> b!1129564 (= lt!501365 (getCurrentListMapNoExtraKeys!4527 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129565 () Bool)

(declare-fun e!642842 () Bool)

(assert (=> b!1129565 (= e!642842 (and e!642843 mapRes!44443))))

(declare-fun condMapEmpty!44443 () Bool)

(declare-fun mapDefault!44443 () ValueCell!13499)

(assert (=> b!1129565 (= condMapEmpty!44443 (= (arr!35462 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13499)) mapDefault!44443)))))

(declare-fun res!754811 () Bool)

(assert (=> start!98180 (=> (not res!754811) (not e!642835))))

(assert (=> start!98180 (= res!754811 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35999 _keys!1208))))))

(assert (=> start!98180 e!642835))

(assert (=> start!98180 tp_is_empty!28417))

(declare-fun array_inv!27284 (array!73616) Bool)

(assert (=> start!98180 (array_inv!27284 _keys!1208)))

(assert (=> start!98180 true))

(assert (=> start!98180 tp!84365))

(declare-fun array_inv!27285 (array!73618) Bool)

(assert (=> start!98180 (and (array_inv!27285 _values!996) e!642842)))

(declare-fun b!1129551 () Bool)

(declare-fun res!754805 () Bool)

(assert (=> b!1129551 (=> (not res!754805) (not e!642835))))

(assert (=> b!1129551 (= res!754805 (= (select (arr!35461 _keys!1208) i!673) k0!934))))

(declare-fun lt!501372 () array!73618)

(declare-fun bm!48094 () Bool)

(assert (=> bm!48094 (= call!48099 (getCurrentListMapNoExtraKeys!4527 lt!501371 lt!501372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48095 () Bool)

(assert (=> bm!48095 (= call!48096 call!48097)))

(declare-fun b!1129566 () Bool)

(declare-fun res!754807 () Bool)

(assert (=> b!1129566 (=> (not res!754807) (not e!642835))))

(assert (=> b!1129566 (= res!754807 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35999 _keys!1208))))))

(declare-fun b!1129567 () Bool)

(assert (=> b!1129567 call!48094))

(declare-fun lt!501362 () Unit!36850)

(declare-fun call!48098 () Unit!36850)

(assert (=> b!1129567 (= lt!501362 call!48098)))

(assert (=> b!1129567 (= e!642833 lt!501362)))

(declare-fun bm!48096 () Bool)

(assert (=> bm!48096 (= call!48095 (addStillContains!686 lt!501365 (ite (or c!109881 c!109883) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109881 c!109883) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1129568 () Bool)

(assert (=> b!1129568 (= e!642836 e!642837)))

(declare-fun res!754816 () Bool)

(assert (=> b!1129568 (=> res!754816 e!642837)))

(assert (=> b!1129568 (= res!754816 (not (= from!1455 i!673)))))

(declare-fun lt!501363 () ListLongMap!16023)

(assert (=> b!1129568 (= lt!501363 (getCurrentListMapNoExtraKeys!4527 lt!501371 lt!501372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2532 (Int (_ BitVec 64)) V!43017)

(assert (=> b!1129568 (= lt!501372 (array!73619 (store (arr!35462 _values!996) i!673 (ValueCellFull!13499 (dynLambda!2532 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36000 _values!996)))))

(declare-fun lt!501370 () ListLongMap!16023)

(assert (=> b!1129568 (= lt!501370 (getCurrentListMapNoExtraKeys!4527 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129569 () Bool)

(declare-fun res!754813 () Bool)

(assert (=> b!1129569 (=> (not res!754813) (not e!642845))))

(assert (=> b!1129569 (= res!754813 (arrayNoDuplicates!0 lt!501371 #b00000000000000000000000000000000 Nil!24802))))

(declare-fun mapNonEmpty!44443 () Bool)

(declare-fun tp!84364 () Bool)

(declare-fun e!642840 () Bool)

(assert (=> mapNonEmpty!44443 (= mapRes!44443 (and tp!84364 e!642840))))

(declare-fun mapRest!44443 () (Array (_ BitVec 32) ValueCell!13499))

(declare-fun mapKey!44443 () (_ BitVec 32))

(declare-fun mapValue!44443 () ValueCell!13499)

(assert (=> mapNonEmpty!44443 (= (arr!35462 _values!996) (store mapRest!44443 mapKey!44443 mapValue!44443))))

(declare-fun b!1129570 () Bool)

(declare-fun lt!501369 () Unit!36850)

(assert (=> b!1129570 (= e!642839 lt!501369)))

(assert (=> b!1129570 (= lt!501369 call!48098)))

(assert (=> b!1129570 call!48094))

(declare-fun bm!48097 () Bool)

(assert (=> bm!48097 (= call!48097 (+!3469 lt!501365 (ite (or c!109881 c!109883) (tuple2!18055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18055 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129571 () Bool)

(declare-fun res!754812 () Bool)

(assert (=> b!1129571 (=> (not res!754812) (not e!642835))))

(assert (=> b!1129571 (= res!754812 (and (= (size!36000 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35999 _keys!1208) (size!36000 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129572 () Bool)

(assert (=> b!1129572 (= e!642840 tp_is_empty!28417)))

(declare-fun bm!48098 () Bool)

(assert (=> bm!48098 (= call!48098 call!48095)))

(assert (= (and start!98180 res!754811) b!1129549))

(assert (= (and b!1129549 res!754809) b!1129571))

(assert (= (and b!1129571 res!754812) b!1129560))

(assert (= (and b!1129560 res!754814) b!1129547))

(assert (= (and b!1129547 res!754817) b!1129566))

(assert (= (and b!1129566 res!754807) b!1129562))

(assert (= (and b!1129562 res!754806) b!1129551))

(assert (= (and b!1129551 res!754805) b!1129553))

(assert (= (and b!1129553 res!754819) b!1129569))

(assert (= (and b!1129569 res!754813) b!1129563))

(assert (= (and b!1129563 (not res!754810)) b!1129568))

(assert (= (and b!1129568 (not res!754816)) b!1129552))

(assert (= (and b!1129552 c!109882) b!1129557))

(assert (= (and b!1129552 (not c!109882)) b!1129558))

(assert (= (or b!1129557 b!1129558) bm!48094))

(assert (= (or b!1129557 b!1129558) bm!48091))

(assert (= (and b!1129552 (not res!754808)) b!1129564))

(assert (= (and b!1129564 (not res!754818)) b!1129555))

(assert (= (and b!1129555 c!109881) b!1129559))

(assert (= (and b!1129555 (not c!109881)) b!1129548))

(assert (= (and b!1129548 c!109883) b!1129567))

(assert (= (and b!1129548 (not c!109883)) b!1129556))

(assert (= (and b!1129556 c!109884) b!1129570))

(assert (= (and b!1129556 (not c!109884)) b!1129550))

(assert (= (or b!1129567 b!1129570) bm!48098))

(assert (= (or b!1129567 b!1129570) bm!48095))

(assert (= (or b!1129567 b!1129570) bm!48092))

(assert (= (or b!1129559 bm!48092) bm!48093))

(assert (= (or b!1129559 bm!48098) bm!48096))

(assert (= (or b!1129559 bm!48095) bm!48097))

(assert (= (and b!1129555 (not res!754815)) b!1129554))

(assert (= (and b!1129565 condMapEmpty!44443) mapIsEmpty!44443))

(assert (= (and b!1129565 (not condMapEmpty!44443)) mapNonEmpty!44443))

(get-info :version)

(assert (= (and mapNonEmpty!44443 ((_ is ValueCellFull!13499) mapValue!44443)) b!1129572))

(assert (= (and b!1129565 ((_ is ValueCellFull!13499) mapDefault!44443)) b!1129561))

(assert (= start!98180 b!1129565))

(declare-fun b_lambda!18839 () Bool)

(assert (=> (not b_lambda!18839) (not b!1129568)))

(declare-fun t!35674 () Bool)

(declare-fun tb!8691 () Bool)

(assert (=> (and start!98180 (= defaultEntry!1004 defaultEntry!1004) t!35674) tb!8691))

(declare-fun result!17951 () Bool)

(assert (=> tb!8691 (= result!17951 tp_is_empty!28417)))

(assert (=> b!1129568 t!35674))

(declare-fun b_and!38537 () Bool)

(assert (= b_and!38535 (and (=> t!35674 result!17951) b_and!38537)))

(declare-fun m!1042371 () Bool)

(assert (=> b!1129562 m!1042371))

(declare-fun m!1042373 () Bool)

(assert (=> bm!48096 m!1042373))

(declare-fun m!1042375 () Bool)

(assert (=> b!1129554 m!1042375))

(assert (=> b!1129554 m!1042375))

(declare-fun m!1042377 () Bool)

(assert (=> b!1129554 m!1042377))

(declare-fun m!1042379 () Bool)

(assert (=> mapNonEmpty!44443 m!1042379))

(declare-fun m!1042381 () Bool)

(assert (=> b!1129564 m!1042381))

(declare-fun m!1042383 () Bool)

(assert (=> b!1129564 m!1042383))

(assert (=> bm!48091 m!1042383))

(declare-fun m!1042385 () Bool)

(assert (=> b!1129563 m!1042385))

(declare-fun m!1042387 () Bool)

(assert (=> b!1129563 m!1042387))

(declare-fun m!1042389 () Bool)

(assert (=> b!1129557 m!1042389))

(declare-fun m!1042391 () Bool)

(assert (=> b!1129547 m!1042391))

(declare-fun m!1042393 () Bool)

(assert (=> bm!48097 m!1042393))

(declare-fun m!1042395 () Bool)

(assert (=> b!1129552 m!1042395))

(declare-fun m!1042397 () Bool)

(assert (=> b!1129552 m!1042397))

(declare-fun m!1042399 () Bool)

(assert (=> b!1129568 m!1042399))

(declare-fun m!1042401 () Bool)

(assert (=> b!1129568 m!1042401))

(declare-fun m!1042403 () Bool)

(assert (=> b!1129568 m!1042403))

(declare-fun m!1042405 () Bool)

(assert (=> b!1129568 m!1042405))

(declare-fun m!1042407 () Bool)

(assert (=> b!1129569 m!1042407))

(declare-fun m!1042409 () Bool)

(assert (=> b!1129553 m!1042409))

(declare-fun m!1042411 () Bool)

(assert (=> b!1129553 m!1042411))

(declare-fun m!1042413 () Bool)

(assert (=> b!1129559 m!1042413))

(declare-fun m!1042415 () Bool)

(assert (=> b!1129559 m!1042415))

(assert (=> b!1129559 m!1042415))

(declare-fun m!1042417 () Bool)

(assert (=> b!1129559 m!1042417))

(declare-fun m!1042419 () Bool)

(assert (=> b!1129551 m!1042419))

(declare-fun m!1042421 () Bool)

(assert (=> bm!48093 m!1042421))

(declare-fun m!1042423 () Bool)

(assert (=> b!1129549 m!1042423))

(declare-fun m!1042425 () Bool)

(assert (=> start!98180 m!1042425))

(declare-fun m!1042427 () Bool)

(assert (=> start!98180 m!1042427))

(declare-fun m!1042429 () Bool)

(assert (=> bm!48094 m!1042429))

(declare-fun m!1042431 () Bool)

(assert (=> b!1129560 m!1042431))

(check-sat (not b!1129560) (not start!98180) (not b!1129564) (not bm!48097) (not b!1129559) (not b!1129547) (not b!1129557) (not b!1129563) b_and!38537 (not b!1129568) (not b!1129549) (not b!1129554) (not bm!48096) (not bm!48091) (not bm!48094) tp_is_empty!28417 (not bm!48093) (not b!1129562) (not b_next!23887) (not b_lambda!18839) (not b!1129553) (not b!1129569) (not b!1129552) (not mapNonEmpty!44443))
(check-sat b_and!38537 (not b_next!23887))

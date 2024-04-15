; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98228 () Bool)

(assert start!98228)

(declare-fun b_free!23935 () Bool)

(declare-fun b_next!23935 () Bool)

(assert (=> start!98228 (= b_free!23935 (not b_next!23935))))

(declare-fun tp!84508 () Bool)

(declare-fun b_and!38631 () Bool)

(assert (=> start!98228 (= tp!84508 b_and!38631)))

(declare-fun b!1131478 () Bool)

(declare-fun res!755883 () Bool)

(declare-fun e!643924 () Bool)

(assert (=> b!1131478 (=> (not res!755883) (not e!643924))))

(declare-datatypes ((array!73710 0))(
  ( (array!73711 (arr!35508 (Array (_ BitVec 32) (_ BitVec 64))) (size!36046 (_ BitVec 32))) )
))
(declare-fun lt!502441 () array!73710)

(declare-datatypes ((List!24845 0))(
  ( (Nil!24842) (Cons!24841 (h!26050 (_ BitVec 64)) (t!35763 List!24845)) )
))
(declare-fun arrayNoDuplicates!0 (array!73710 (_ BitVec 32) List!24845) Bool)

(assert (=> b!1131478 (= res!755883 (arrayNoDuplicates!0 lt!502441 #b00000000000000000000000000000000 Nil!24842))))

(declare-fun b!1131479 () Bool)

(declare-fun res!755876 () Bool)

(declare-fun e!643925 () Bool)

(assert (=> b!1131479 (=> (not res!755876) (not e!643925))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73710)

(assert (=> b!1131479 (= res!755876 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36046 _keys!1208))))))

(declare-fun mapNonEmpty!44515 () Bool)

(declare-fun mapRes!44515 () Bool)

(declare-fun tp!84509 () Bool)

(declare-fun e!643914 () Bool)

(assert (=> mapNonEmpty!44515 (= mapRes!44515 (and tp!84509 e!643914))))

(declare-fun mapKey!44515 () (_ BitVec 32))

(declare-datatypes ((V!43081 0))(
  ( (V!43082 (val!14289 Int)) )
))
(declare-datatypes ((ValueCell!13523 0))(
  ( (ValueCellFull!13523 (v!16921 V!43081)) (EmptyCell!13523) )
))
(declare-fun mapValue!44515 () ValueCell!13523)

(declare-datatypes ((array!73712 0))(
  ( (array!73713 (arr!35509 (Array (_ BitVec 32) ValueCell!13523)) (size!36047 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73712)

(declare-fun mapRest!44515 () (Array (_ BitVec 32) ValueCell!13523))

(assert (=> mapNonEmpty!44515 (= (arr!35509 _values!996) (store mapRest!44515 mapKey!44515 mapValue!44515))))

(declare-fun bm!48667 () Bool)

(declare-fun call!48673 () Bool)

(declare-fun call!48671 () Bool)

(assert (=> bm!48667 (= call!48673 call!48671)))

(declare-fun b!1131480 () Bool)

(declare-fun e!643916 () Bool)

(declare-datatypes ((tuple2!18096 0))(
  ( (tuple2!18097 (_1!9059 (_ BitVec 64)) (_2!9059 V!43081)) )
))
(declare-datatypes ((List!24846 0))(
  ( (Nil!24843) (Cons!24842 (h!26051 tuple2!18096) (t!35764 List!24846)) )
))
(declare-datatypes ((ListLongMap!16065 0))(
  ( (ListLongMap!16066 (toList!8048 List!24846)) )
))
(declare-fun call!48672 () ListLongMap!16065)

(declare-fun call!48670 () ListLongMap!16065)

(assert (=> b!1131480 (= e!643916 (= call!48672 call!48670))))

(declare-fun lt!502448 () ListLongMap!16065)

(declare-fun c!110181 () Bool)

(declare-fun minValue!944 () V!43081)

(declare-fun c!110183 () Bool)

(declare-fun zeroValue!944 () V!43081)

(declare-fun call!48676 () ListLongMap!16065)

(declare-fun bm!48668 () Bool)

(declare-fun +!3486 (ListLongMap!16065 tuple2!18096) ListLongMap!16065)

(assert (=> bm!48668 (= call!48676 (+!3486 lt!502448 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1131481 () Bool)

(declare-fun res!755882 () Bool)

(assert (=> b!1131481 (=> (not res!755882) (not e!643925))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73710 (_ BitVec 32)) Bool)

(assert (=> b!1131481 (= res!755882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1131482 () Bool)

(declare-fun -!1153 (ListLongMap!16065 (_ BitVec 64)) ListLongMap!16065)

(assert (=> b!1131482 (= e!643916 (= call!48670 (-!1153 call!48672 k0!934)))))

(declare-fun b!1131483 () Bool)

(declare-datatypes ((Unit!36912 0))(
  ( (Unit!36913) )
))
(declare-fun e!643915 () Unit!36912)

(declare-fun Unit!36914 () Unit!36912)

(assert (=> b!1131483 (= e!643915 Unit!36914)))

(declare-fun b!1131485 () Bool)

(declare-fun e!643913 () Bool)

(assert (=> b!1131485 (= e!643924 (not e!643913))))

(declare-fun res!755877 () Bool)

(assert (=> b!1131485 (=> res!755877 e!643913)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1131485 (= res!755877 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131485 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502442 () Unit!36912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73710 (_ BitVec 64) (_ BitVec 32)) Unit!36912)

(assert (=> b!1131485 (= lt!502442 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!48677 () Unit!36912)

(declare-fun bm!48669 () Bool)

(declare-fun lt!502440 () ListLongMap!16065)

(declare-fun addStillContains!704 (ListLongMap!16065 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!36912)

(assert (=> bm!48669 (= call!48677 (addStillContains!704 (ite c!110181 lt!502440 lt!502448) (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!48670 () Bool)

(declare-fun call!48674 () ListLongMap!16065)

(assert (=> bm!48670 (= call!48674 call!48676)))

(declare-fun b!1131486 () Bool)

(declare-fun e!643921 () Bool)

(declare-fun e!643920 () Bool)

(assert (=> b!1131486 (= e!643921 e!643920)))

(declare-fun res!755875 () Bool)

(assert (=> b!1131486 (=> res!755875 e!643920)))

(declare-fun contains!6500 (ListLongMap!16065 (_ BitVec 64)) Bool)

(assert (=> b!1131486 (= res!755875 (not (contains!6500 lt!502448 k0!934)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4547 (array!73710 array!73712 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 32) Int) ListLongMap!16065)

(assert (=> b!1131486 (= lt!502448 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131487 () Bool)

(declare-fun e!643926 () Bool)

(declare-fun tp_is_empty!28465 () Bool)

(assert (=> b!1131487 (= e!643926 tp_is_empty!28465)))

(declare-fun b!1131488 () Bool)

(declare-fun res!755884 () Bool)

(assert (=> b!1131488 (=> (not res!755884) (not e!643925))))

(assert (=> b!1131488 (= res!755884 (= (select (arr!35508 _keys!1208) i!673) k0!934))))

(declare-fun bm!48671 () Bool)

(declare-fun lt!502452 () array!73712)

(declare-fun c!110180 () Bool)

(assert (=> bm!48671 (= call!48670 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 lt!502441 _keys!1208) (ite c!110180 lt!502452 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131489 () Bool)

(declare-fun res!755878 () Bool)

(assert (=> b!1131489 (=> (not res!755878) (not e!643925))))

(assert (=> b!1131489 (= res!755878 (and (= (size!36047 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36046 _keys!1208) (size!36047 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131490 () Bool)

(declare-fun e!643922 () Bool)

(assert (=> b!1131490 (= e!643922 (and e!643926 mapRes!44515))))

(declare-fun condMapEmpty!44515 () Bool)

(declare-fun mapDefault!44515 () ValueCell!13523)

(assert (=> b!1131490 (= condMapEmpty!44515 (= (arr!35509 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13523)) mapDefault!44515)))))

(declare-fun bm!48672 () Bool)

(assert (=> bm!48672 (= call!48671 (contains!6500 (ite c!110181 lt!502440 call!48674) k0!934))))

(declare-fun b!1131491 () Bool)

(declare-fun lt!502443 () Unit!36912)

(assert (=> b!1131491 (= e!643915 lt!502443)))

(declare-fun call!48675 () Unit!36912)

(assert (=> b!1131491 (= lt!502443 call!48675)))

(assert (=> b!1131491 call!48673))

(declare-fun b!1131492 () Bool)

(assert (=> b!1131492 (= e!643920 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208))))))

(declare-fun e!643917 () Bool)

(assert (=> b!1131492 e!643917))

(declare-fun c!110184 () Bool)

(assert (=> b!1131492 (= c!110184 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!502444 () Unit!36912)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!318 (array!73710 array!73712 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 64) (_ BitVec 32) Int) Unit!36912)

(assert (=> b!1131492 (= lt!502444 (lemmaListMapContainsThenArrayContainsFrom!318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502445 () Unit!36912)

(declare-fun e!643923 () Unit!36912)

(assert (=> b!1131492 (= lt!502445 e!643923)))

(declare-fun lt!502447 () Bool)

(assert (=> b!1131492 (= c!110181 (and (not lt!502447) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131492 (= lt!502447 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131493 () Bool)

(declare-fun lt!502446 () Unit!36912)

(assert (=> b!1131493 (= e!643923 lt!502446)))

(declare-fun lt!502450 () Unit!36912)

(assert (=> b!1131493 (= lt!502450 (addStillContains!704 lt!502448 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1131493 (= lt!502440 call!48676)))

(assert (=> b!1131493 call!48671))

(assert (=> b!1131493 (= lt!502446 call!48677)))

(assert (=> b!1131493 (contains!6500 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1131494 () Bool)

(assert (=> b!1131494 (= e!643925 e!643924)))

(declare-fun res!755886 () Bool)

(assert (=> b!1131494 (=> (not res!755886) (not e!643924))))

(assert (=> b!1131494 (= res!755886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502441 mask!1564))))

(assert (=> b!1131494 (= lt!502441 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))

(declare-fun mapIsEmpty!44515 () Bool)

(assert (=> mapIsEmpty!44515 mapRes!44515))

(declare-fun b!1131495 () Bool)

(declare-fun res!755881 () Bool)

(assert (=> b!1131495 (=> (not res!755881) (not e!643925))))

(assert (=> b!1131495 (= res!755881 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24842))))

(declare-fun b!1131496 () Bool)

(declare-fun res!755879 () Bool)

(assert (=> b!1131496 (=> (not res!755879) (not e!643925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131496 (= res!755879 (validKeyInArray!0 k0!934))))

(declare-fun bm!48673 () Bool)

(assert (=> bm!48673 (= call!48672 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 _keys!1208 lt!502441) (ite c!110180 _values!996 lt!502452) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131497 () Bool)

(declare-fun e!643912 () Unit!36912)

(assert (=> b!1131497 (= e!643923 e!643912)))

(assert (=> b!1131497 (= c!110183 (and (not lt!502447) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131498 () Bool)

(assert (=> b!1131498 (= e!643917 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502447) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1131499 () Bool)

(assert (=> b!1131499 (= e!643917 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!48674 () Bool)

(assert (=> bm!48674 (= call!48675 call!48677)))

(declare-fun b!1131500 () Bool)

(declare-fun res!755887 () Bool)

(assert (=> b!1131500 (=> (not res!755887) (not e!643925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131500 (= res!755887 (validMask!0 mask!1564))))

(declare-fun res!755885 () Bool)

(assert (=> start!98228 (=> (not res!755885) (not e!643925))))

(assert (=> start!98228 (= res!755885 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36046 _keys!1208))))))

(assert (=> start!98228 e!643925))

(assert (=> start!98228 tp_is_empty!28465))

(declare-fun array_inv!27310 (array!73710) Bool)

(assert (=> start!98228 (array_inv!27310 _keys!1208)))

(assert (=> start!98228 true))

(assert (=> start!98228 tp!84508))

(declare-fun array_inv!27311 (array!73712) Bool)

(assert (=> start!98228 (and (array_inv!27311 _values!996) e!643922)))

(declare-fun b!1131484 () Bool)

(assert (=> b!1131484 (= e!643914 tp_is_empty!28465)))

(declare-fun b!1131501 () Bool)

(assert (=> b!1131501 call!48673))

(declare-fun lt!502439 () Unit!36912)

(assert (=> b!1131501 (= lt!502439 call!48675)))

(assert (=> b!1131501 (= e!643912 lt!502439)))

(declare-fun b!1131502 () Bool)

(declare-fun e!643918 () Bool)

(assert (=> b!1131502 (= e!643913 e!643918)))

(declare-fun res!755874 () Bool)

(assert (=> b!1131502 (=> res!755874 e!643918)))

(assert (=> b!1131502 (= res!755874 (not (= from!1455 i!673)))))

(declare-fun lt!502449 () ListLongMap!16065)

(assert (=> b!1131502 (= lt!502449 (getCurrentListMapNoExtraKeys!4547 lt!502441 lt!502452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2548 (Int (_ BitVec 64)) V!43081)

(assert (=> b!1131502 (= lt!502452 (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)))))

(declare-fun lt!502438 () ListLongMap!16065)

(assert (=> b!1131502 (= lt!502438 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131503 () Bool)

(declare-fun c!110182 () Bool)

(assert (=> b!1131503 (= c!110182 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502447))))

(assert (=> b!1131503 (= e!643912 e!643915)))

(declare-fun b!1131504 () Bool)

(assert (=> b!1131504 (= e!643918 e!643921)))

(declare-fun res!755880 () Bool)

(assert (=> b!1131504 (=> res!755880 e!643921)))

(assert (=> b!1131504 (= res!755880 (not (= (select (arr!35508 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1131504 e!643916))

(assert (=> b!1131504 (= c!110180 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502451 () Unit!36912)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!437 (array!73710 array!73712 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36912)

(assert (=> b!1131504 (= lt!502451 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98228 res!755885) b!1131500))

(assert (= (and b!1131500 res!755887) b!1131489))

(assert (= (and b!1131489 res!755878) b!1131481))

(assert (= (and b!1131481 res!755882) b!1131495))

(assert (= (and b!1131495 res!755881) b!1131479))

(assert (= (and b!1131479 res!755876) b!1131496))

(assert (= (and b!1131496 res!755879) b!1131488))

(assert (= (and b!1131488 res!755884) b!1131494))

(assert (= (and b!1131494 res!755886) b!1131478))

(assert (= (and b!1131478 res!755883) b!1131485))

(assert (= (and b!1131485 (not res!755877)) b!1131502))

(assert (= (and b!1131502 (not res!755874)) b!1131504))

(assert (= (and b!1131504 c!110180) b!1131482))

(assert (= (and b!1131504 (not c!110180)) b!1131480))

(assert (= (or b!1131482 b!1131480) bm!48673))

(assert (= (or b!1131482 b!1131480) bm!48671))

(assert (= (and b!1131504 (not res!755880)) b!1131486))

(assert (= (and b!1131486 (not res!755875)) b!1131492))

(assert (= (and b!1131492 c!110181) b!1131493))

(assert (= (and b!1131492 (not c!110181)) b!1131497))

(assert (= (and b!1131497 c!110183) b!1131501))

(assert (= (and b!1131497 (not c!110183)) b!1131503))

(assert (= (and b!1131503 c!110182) b!1131491))

(assert (= (and b!1131503 (not c!110182)) b!1131483))

(assert (= (or b!1131501 b!1131491) bm!48674))

(assert (= (or b!1131501 b!1131491) bm!48670))

(assert (= (or b!1131501 b!1131491) bm!48667))

(assert (= (or b!1131493 bm!48667) bm!48672))

(assert (= (or b!1131493 bm!48674) bm!48669))

(assert (= (or b!1131493 bm!48670) bm!48668))

(assert (= (and b!1131492 c!110184) b!1131499))

(assert (= (and b!1131492 (not c!110184)) b!1131498))

(assert (= (and b!1131490 condMapEmpty!44515) mapIsEmpty!44515))

(assert (= (and b!1131490 (not condMapEmpty!44515)) mapNonEmpty!44515))

(get-info :version)

(assert (= (and mapNonEmpty!44515 ((_ is ValueCellFull!13523) mapValue!44515)) b!1131484))

(assert (= (and b!1131490 ((_ is ValueCellFull!13523) mapDefault!44515)) b!1131487))

(assert (= start!98228 b!1131490))

(declare-fun b_lambda!18887 () Bool)

(assert (=> (not b_lambda!18887) (not b!1131502)))

(declare-fun t!35762 () Bool)

(declare-fun tb!8739 () Bool)

(assert (=> (and start!98228 (= defaultEntry!1004 defaultEntry!1004) t!35762) tb!8739))

(declare-fun result!18047 () Bool)

(assert (=> tb!8739 (= result!18047 tp_is_empty!28465)))

(assert (=> b!1131502 t!35762))

(declare-fun b_and!38633 () Bool)

(assert (= b_and!38631 (and (=> t!35762 result!18047) b_and!38633)))

(declare-fun m!1043863 () Bool)

(assert (=> b!1131478 m!1043863))

(declare-fun m!1043865 () Bool)

(assert (=> b!1131485 m!1043865))

(declare-fun m!1043867 () Bool)

(assert (=> b!1131485 m!1043867))

(declare-fun m!1043869 () Bool)

(assert (=> b!1131482 m!1043869))

(declare-fun m!1043871 () Bool)

(assert (=> start!98228 m!1043871))

(declare-fun m!1043873 () Bool)

(assert (=> start!98228 m!1043873))

(declare-fun m!1043875 () Bool)

(assert (=> mapNonEmpty!44515 m!1043875))

(declare-fun m!1043877 () Bool)

(assert (=> b!1131494 m!1043877))

(declare-fun m!1043879 () Bool)

(assert (=> b!1131494 m!1043879))

(declare-fun m!1043881 () Bool)

(assert (=> b!1131499 m!1043881))

(declare-fun m!1043883 () Bool)

(assert (=> b!1131493 m!1043883))

(declare-fun m!1043885 () Bool)

(assert (=> b!1131493 m!1043885))

(assert (=> b!1131493 m!1043885))

(declare-fun m!1043887 () Bool)

(assert (=> b!1131493 m!1043887))

(declare-fun m!1043889 () Bool)

(assert (=> bm!48673 m!1043889))

(declare-fun m!1043891 () Bool)

(assert (=> b!1131488 m!1043891))

(declare-fun m!1043893 () Bool)

(assert (=> b!1131500 m!1043893))

(declare-fun m!1043895 () Bool)

(assert (=> bm!48668 m!1043895))

(declare-fun m!1043897 () Bool)

(assert (=> b!1131492 m!1043897))

(declare-fun m!1043899 () Bool)

(assert (=> b!1131486 m!1043899))

(declare-fun m!1043901 () Bool)

(assert (=> b!1131486 m!1043901))

(declare-fun m!1043903 () Bool)

(assert (=> bm!48672 m!1043903))

(declare-fun m!1043905 () Bool)

(assert (=> b!1131496 m!1043905))

(declare-fun m!1043907 () Bool)

(assert (=> bm!48671 m!1043907))

(declare-fun m!1043909 () Bool)

(assert (=> b!1131504 m!1043909))

(declare-fun m!1043911 () Bool)

(assert (=> b!1131504 m!1043911))

(declare-fun m!1043913 () Bool)

(assert (=> b!1131481 m!1043913))

(declare-fun m!1043915 () Bool)

(assert (=> b!1131495 m!1043915))

(declare-fun m!1043917 () Bool)

(assert (=> b!1131502 m!1043917))

(declare-fun m!1043919 () Bool)

(assert (=> b!1131502 m!1043919))

(declare-fun m!1043921 () Bool)

(assert (=> b!1131502 m!1043921))

(declare-fun m!1043923 () Bool)

(assert (=> b!1131502 m!1043923))

(declare-fun m!1043925 () Bool)

(assert (=> bm!48669 m!1043925))

(check-sat (not b!1131500) (not b!1131504) tp_is_empty!28465 (not b_lambda!18887) (not b!1131485) (not start!98228) (not b!1131493) (not b!1131486) (not b!1131478) (not bm!48668) (not b!1131499) (not b!1131492) (not b!1131482) (not bm!48669) (not b!1131494) (not bm!48673) (not b!1131496) (not b!1131495) b_and!38633 (not bm!48671) (not mapNonEmpty!44515) (not bm!48672) (not b!1131481) (not b!1131502) (not b_next!23935))
(check-sat b_and!38633 (not b_next!23935))
(get-model)

(declare-fun b_lambda!18893 () Bool)

(assert (= b_lambda!18887 (or (and start!98228 b_free!23935) b_lambda!18893)))

(check-sat (not b!1131500) (not b!1131504) tp_is_empty!28465 (not b!1131485) (not start!98228) (not b!1131493) (not b!1131486) (not b!1131478) (not bm!48668) (not b!1131499) (not b!1131492) (not b!1131482) (not bm!48669) (not b!1131494) (not bm!48673) (not b_lambda!18893) (not b!1131496) (not b!1131495) b_and!38633 (not bm!48671) (not mapNonEmpty!44515) (not bm!48672) (not b!1131481) (not b!1131502) (not b_next!23935))
(check-sat b_and!38633 (not b_next!23935))
(get-model)

(declare-fun b!1131681 () Bool)

(declare-fun e!644024 () Bool)

(declare-fun call!48728 () Bool)

(assert (=> b!1131681 (= e!644024 call!48728)))

(declare-fun b!1131682 () Bool)

(declare-fun e!644023 () Bool)

(assert (=> b!1131682 (= e!644023 e!644024)))

(declare-fun c!110217 () Bool)

(assert (=> b!1131682 (= c!110217 (validKeyInArray!0 (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(declare-fun b!1131683 () Bool)

(declare-fun e!644025 () Bool)

(assert (=> b!1131683 (= e!644024 e!644025)))

(declare-fun lt!502549 () (_ BitVec 64))

(assert (=> b!1131683 (= lt!502549 (select (arr!35508 lt!502441) #b00000000000000000000000000000000))))

(declare-fun lt!502551 () Unit!36912)

(assert (=> b!1131683 (= lt!502551 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!502441 lt!502549 #b00000000000000000000000000000000))))

(assert (=> b!1131683 (arrayContainsKey!0 lt!502441 lt!502549 #b00000000000000000000000000000000)))

(declare-fun lt!502550 () Unit!36912)

(assert (=> b!1131683 (= lt!502550 lt!502551)))

(declare-fun res!755977 () Bool)

(declare-datatypes ((SeekEntryResult!9924 0))(
  ( (MissingZero!9924 (index!42067 (_ BitVec 32))) (Found!9924 (index!42068 (_ BitVec 32))) (Intermediate!9924 (undefined!10736 Bool) (index!42069 (_ BitVec 32)) (x!101487 (_ BitVec 32))) (Undefined!9924) (MissingVacant!9924 (index!42070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!73710 (_ BitVec 32)) SeekEntryResult!9924)

(assert (=> b!1131683 (= res!755977 (= (seekEntryOrOpen!0 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) lt!502441 mask!1564) (Found!9924 #b00000000000000000000000000000000)))))

(assert (=> b!1131683 (=> (not res!755977) (not e!644025))))

(declare-fun b!1131684 () Bool)

(assert (=> b!1131684 (= e!644025 call!48728)))

(declare-fun bm!48725 () Bool)

(assert (=> bm!48725 (= call!48728 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!502441 mask!1564))))

(declare-fun d!131141 () Bool)

(declare-fun res!755976 () Bool)

(assert (=> d!131141 (=> res!755976 e!644023)))

(assert (=> d!131141 (= res!755976 (bvsge #b00000000000000000000000000000000 (size!36046 lt!502441)))))

(assert (=> d!131141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502441 mask!1564) e!644023)))

(assert (= (and d!131141 (not res!755976)) b!1131682))

(assert (= (and b!1131682 c!110217) b!1131683))

(assert (= (and b!1131682 (not c!110217)) b!1131681))

(assert (= (and b!1131683 res!755977) b!1131684))

(assert (= (or b!1131684 b!1131681) bm!48725))

(declare-fun m!1044051 () Bool)

(assert (=> b!1131682 m!1044051))

(assert (=> b!1131682 m!1044051))

(declare-fun m!1044053 () Bool)

(assert (=> b!1131682 m!1044053))

(assert (=> b!1131683 m!1044051))

(declare-fun m!1044055 () Bool)

(assert (=> b!1131683 m!1044055))

(declare-fun m!1044057 () Bool)

(assert (=> b!1131683 m!1044057))

(assert (=> b!1131683 m!1044051))

(declare-fun m!1044059 () Bool)

(assert (=> b!1131683 m!1044059))

(declare-fun m!1044061 () Bool)

(assert (=> bm!48725 m!1044061))

(assert (=> b!1131494 d!131141))

(declare-fun b!1131709 () Bool)

(declare-fun lt!502566 () Unit!36912)

(declare-fun lt!502569 () Unit!36912)

(assert (=> b!1131709 (= lt!502566 lt!502569)))

(declare-fun lt!502567 () (_ BitVec 64))

(declare-fun lt!502572 () V!43081)

(declare-fun lt!502568 () (_ BitVec 64))

(declare-fun lt!502570 () ListLongMap!16065)

(assert (=> b!1131709 (not (contains!6500 (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572)) lt!502568))))

(declare-fun addStillNotContains!284 (ListLongMap!16065 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!36912)

(assert (=> b!1131709 (= lt!502569 (addStillNotContains!284 lt!502570 lt!502567 lt!502572 lt!502568))))

(assert (=> b!1131709 (= lt!502568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!18068 (ValueCell!13523 V!43081) V!43081)

(assert (=> b!1131709 (= lt!502572 (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131709 (= lt!502567 (select (arr!35508 lt!502441) from!1455))))

(declare-fun call!48731 () ListLongMap!16065)

(assert (=> b!1131709 (= lt!502570 call!48731)))

(declare-fun e!644042 () ListLongMap!16065)

(assert (=> b!1131709 (= e!644042 (+!3486 call!48731 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48728 () Bool)

(assert (=> bm!48728 (= call!48731 (getCurrentListMapNoExtraKeys!4547 lt!502441 lt!502452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131710 () Bool)

(assert (=> b!1131710 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36046 lt!502441)))))

(assert (=> b!1131710 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36047 lt!502452)))))

(declare-fun lt!502571 () ListLongMap!16065)

(declare-fun e!644044 () Bool)

(declare-fun apply!948 (ListLongMap!16065 (_ BitVec 64)) V!43081)

(assert (=> b!1131710 (= e!644044 (= (apply!948 lt!502571 (select (arr!35508 lt!502441) from!1455)) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131143 () Bool)

(declare-fun e!644043 () Bool)

(assert (=> d!131143 e!644043))

(declare-fun res!755986 () Bool)

(assert (=> d!131143 (=> (not res!755986) (not e!644043))))

(assert (=> d!131143 (= res!755986 (not (contains!6500 lt!502571 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644041 () ListLongMap!16065)

(assert (=> d!131143 (= lt!502571 e!644041)))

(declare-fun c!110227 () Bool)

(assert (=> d!131143 (= c!110227 (bvsge from!1455 (size!36046 lt!502441)))))

(assert (=> d!131143 (validMask!0 mask!1564)))

(assert (=> d!131143 (= (getCurrentListMapNoExtraKeys!4547 lt!502441 lt!502452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!502571)))

(declare-fun b!1131711 () Bool)

(declare-fun e!644040 () Bool)

(declare-fun e!644046 () Bool)

(assert (=> b!1131711 (= e!644040 e!644046)))

(declare-fun c!110228 () Bool)

(assert (=> b!1131711 (= c!110228 (bvslt from!1455 (size!36046 lt!502441)))))

(declare-fun b!1131712 () Bool)

(assert (=> b!1131712 (= e!644040 e!644044)))

(assert (=> b!1131712 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36046 lt!502441)))))

(declare-fun res!755989 () Bool)

(assert (=> b!1131712 (= res!755989 (contains!6500 lt!502571 (select (arr!35508 lt!502441) from!1455)))))

(assert (=> b!1131712 (=> (not res!755989) (not e!644044))))

(declare-fun b!1131713 () Bool)

(assert (=> b!1131713 (= e!644041 e!644042)))

(declare-fun c!110226 () Bool)

(assert (=> b!1131713 (= c!110226 (validKeyInArray!0 (select (arr!35508 lt!502441) from!1455)))))

(declare-fun b!1131714 () Bool)

(assert (=> b!1131714 (= e!644046 (= lt!502571 (getCurrentListMapNoExtraKeys!4547 lt!502441 lt!502452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131715 () Bool)

(assert (=> b!1131715 (= e!644041 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131716 () Bool)

(assert (=> b!1131716 (= e!644043 e!644040)))

(declare-fun c!110229 () Bool)

(declare-fun e!644045 () Bool)

(assert (=> b!1131716 (= c!110229 e!644045)))

(declare-fun res!755988 () Bool)

(assert (=> b!1131716 (=> (not res!755988) (not e!644045))))

(assert (=> b!1131716 (= res!755988 (bvslt from!1455 (size!36046 lt!502441)))))

(declare-fun b!1131717 () Bool)

(assert (=> b!1131717 (= e!644045 (validKeyInArray!0 (select (arr!35508 lt!502441) from!1455)))))

(assert (=> b!1131717 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1131718 () Bool)

(declare-fun isEmpty!978 (ListLongMap!16065) Bool)

(assert (=> b!1131718 (= e!644046 (isEmpty!978 lt!502571))))

(declare-fun b!1131719 () Bool)

(assert (=> b!1131719 (= e!644042 call!48731)))

(declare-fun b!1131720 () Bool)

(declare-fun res!755987 () Bool)

(assert (=> b!1131720 (=> (not res!755987) (not e!644043))))

(assert (=> b!1131720 (= res!755987 (not (contains!6500 lt!502571 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131143 c!110227) b!1131715))

(assert (= (and d!131143 (not c!110227)) b!1131713))

(assert (= (and b!1131713 c!110226) b!1131709))

(assert (= (and b!1131713 (not c!110226)) b!1131719))

(assert (= (or b!1131709 b!1131719) bm!48728))

(assert (= (and d!131143 res!755986) b!1131720))

(assert (= (and b!1131720 res!755987) b!1131716))

(assert (= (and b!1131716 res!755988) b!1131717))

(assert (= (and b!1131716 c!110229) b!1131712))

(assert (= (and b!1131716 (not c!110229)) b!1131711))

(assert (= (and b!1131712 res!755989) b!1131710))

(assert (= (and b!1131711 c!110228) b!1131714))

(assert (= (and b!1131711 (not c!110228)) b!1131718))

(declare-fun b_lambda!18895 () Bool)

(assert (=> (not b_lambda!18895) (not b!1131709)))

(assert (=> b!1131709 t!35762))

(declare-fun b_and!38643 () Bool)

(assert (= b_and!38633 (and (=> t!35762 result!18047) b_and!38643)))

(declare-fun b_lambda!18897 () Bool)

(assert (=> (not b_lambda!18897) (not b!1131710)))

(assert (=> b!1131710 t!35762))

(declare-fun b_and!38645 () Bool)

(assert (= b_and!38643 (and (=> t!35762 result!18047) b_and!38645)))

(declare-fun m!1044063 () Bool)

(assert (=> b!1131712 m!1044063))

(assert (=> b!1131712 m!1044063))

(declare-fun m!1044065 () Bool)

(assert (=> b!1131712 m!1044065))

(declare-fun m!1044067 () Bool)

(assert (=> bm!48728 m!1044067))

(assert (=> b!1131709 m!1043919))

(declare-fun m!1044069 () Bool)

(assert (=> b!1131709 m!1044069))

(assert (=> b!1131709 m!1044063))

(declare-fun m!1044071 () Bool)

(assert (=> b!1131709 m!1044071))

(declare-fun m!1044073 () Bool)

(assert (=> b!1131709 m!1044073))

(declare-fun m!1044075 () Bool)

(assert (=> b!1131709 m!1044075))

(assert (=> b!1131709 m!1044073))

(declare-fun m!1044077 () Bool)

(assert (=> b!1131709 m!1044077))

(assert (=> b!1131709 m!1044075))

(assert (=> b!1131709 m!1043919))

(declare-fun m!1044079 () Bool)

(assert (=> b!1131709 m!1044079))

(assert (=> b!1131717 m!1044063))

(assert (=> b!1131717 m!1044063))

(declare-fun m!1044081 () Bool)

(assert (=> b!1131717 m!1044081))

(declare-fun m!1044083 () Bool)

(assert (=> b!1131720 m!1044083))

(declare-fun m!1044085 () Bool)

(assert (=> d!131143 m!1044085))

(assert (=> d!131143 m!1043893))

(declare-fun m!1044087 () Bool)

(assert (=> b!1131718 m!1044087))

(assert (=> b!1131714 m!1044067))

(assert (=> b!1131710 m!1043919))

(assert (=> b!1131710 m!1044063))

(assert (=> b!1131710 m!1044063))

(declare-fun m!1044089 () Bool)

(assert (=> b!1131710 m!1044089))

(assert (=> b!1131710 m!1044075))

(assert (=> b!1131710 m!1043919))

(assert (=> b!1131710 m!1044079))

(assert (=> b!1131710 m!1044075))

(assert (=> b!1131713 m!1044063))

(assert (=> b!1131713 m!1044063))

(assert (=> b!1131713 m!1044081))

(assert (=> b!1131502 d!131143))

(declare-fun b!1131721 () Bool)

(declare-fun lt!502573 () Unit!36912)

(declare-fun lt!502576 () Unit!36912)

(assert (=> b!1131721 (= lt!502573 lt!502576)))

(declare-fun lt!502579 () V!43081)

(declare-fun lt!502575 () (_ BitVec 64))

(declare-fun lt!502577 () ListLongMap!16065)

(declare-fun lt!502574 () (_ BitVec 64))

(assert (=> b!1131721 (not (contains!6500 (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579)) lt!502575))))

(assert (=> b!1131721 (= lt!502576 (addStillNotContains!284 lt!502577 lt!502574 lt!502579 lt!502575))))

(assert (=> b!1131721 (= lt!502575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131721 (= lt!502579 (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131721 (= lt!502574 (select (arr!35508 _keys!1208) from!1455))))

(declare-fun call!48732 () ListLongMap!16065)

(assert (=> b!1131721 (= lt!502577 call!48732)))

(declare-fun e!644049 () ListLongMap!16065)

(assert (=> b!1131721 (= e!644049 (+!3486 call!48732 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48729 () Bool)

(assert (=> bm!48729 (= call!48732 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131722 () Bool)

(assert (=> b!1131722 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36046 _keys!1208)))))

(assert (=> b!1131722 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36047 _values!996)))))

(declare-fun e!644051 () Bool)

(declare-fun lt!502578 () ListLongMap!16065)

(assert (=> b!1131722 (= e!644051 (= (apply!948 lt!502578 (select (arr!35508 _keys!1208) from!1455)) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131145 () Bool)

(declare-fun e!644050 () Bool)

(assert (=> d!131145 e!644050))

(declare-fun res!755990 () Bool)

(assert (=> d!131145 (=> (not res!755990) (not e!644050))))

(assert (=> d!131145 (= res!755990 (not (contains!6500 lt!502578 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644048 () ListLongMap!16065)

(assert (=> d!131145 (= lt!502578 e!644048)))

(declare-fun c!110231 () Bool)

(assert (=> d!131145 (= c!110231 (bvsge from!1455 (size!36046 _keys!1208)))))

(assert (=> d!131145 (validMask!0 mask!1564)))

(assert (=> d!131145 (= (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!502578)))

(declare-fun b!1131723 () Bool)

(declare-fun e!644047 () Bool)

(declare-fun e!644053 () Bool)

(assert (=> b!1131723 (= e!644047 e!644053)))

(declare-fun c!110232 () Bool)

(assert (=> b!1131723 (= c!110232 (bvslt from!1455 (size!36046 _keys!1208)))))

(declare-fun b!1131724 () Bool)

(assert (=> b!1131724 (= e!644047 e!644051)))

(assert (=> b!1131724 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36046 _keys!1208)))))

(declare-fun res!755993 () Bool)

(assert (=> b!1131724 (= res!755993 (contains!6500 lt!502578 (select (arr!35508 _keys!1208) from!1455)))))

(assert (=> b!1131724 (=> (not res!755993) (not e!644051))))

(declare-fun b!1131725 () Bool)

(assert (=> b!1131725 (= e!644048 e!644049)))

(declare-fun c!110230 () Bool)

(assert (=> b!1131725 (= c!110230 (validKeyInArray!0 (select (arr!35508 _keys!1208) from!1455)))))

(declare-fun b!1131726 () Bool)

(assert (=> b!1131726 (= e!644053 (= lt!502578 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131727 () Bool)

(assert (=> b!1131727 (= e!644048 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131728 () Bool)

(assert (=> b!1131728 (= e!644050 e!644047)))

(declare-fun c!110233 () Bool)

(declare-fun e!644052 () Bool)

(assert (=> b!1131728 (= c!110233 e!644052)))

(declare-fun res!755992 () Bool)

(assert (=> b!1131728 (=> (not res!755992) (not e!644052))))

(assert (=> b!1131728 (= res!755992 (bvslt from!1455 (size!36046 _keys!1208)))))

(declare-fun b!1131729 () Bool)

(assert (=> b!1131729 (= e!644052 (validKeyInArray!0 (select (arr!35508 _keys!1208) from!1455)))))

(assert (=> b!1131729 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1131730 () Bool)

(assert (=> b!1131730 (= e!644053 (isEmpty!978 lt!502578))))

(declare-fun b!1131731 () Bool)

(assert (=> b!1131731 (= e!644049 call!48732)))

(declare-fun b!1131732 () Bool)

(declare-fun res!755991 () Bool)

(assert (=> b!1131732 (=> (not res!755991) (not e!644050))))

(assert (=> b!1131732 (= res!755991 (not (contains!6500 lt!502578 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131145 c!110231) b!1131727))

(assert (= (and d!131145 (not c!110231)) b!1131725))

(assert (= (and b!1131725 c!110230) b!1131721))

(assert (= (and b!1131725 (not c!110230)) b!1131731))

(assert (= (or b!1131721 b!1131731) bm!48729))

(assert (= (and d!131145 res!755990) b!1131732))

(assert (= (and b!1131732 res!755991) b!1131728))

(assert (= (and b!1131728 res!755992) b!1131729))

(assert (= (and b!1131728 c!110233) b!1131724))

(assert (= (and b!1131728 (not c!110233)) b!1131723))

(assert (= (and b!1131724 res!755993) b!1131722))

(assert (= (and b!1131723 c!110232) b!1131726))

(assert (= (and b!1131723 (not c!110232)) b!1131730))

(declare-fun b_lambda!18899 () Bool)

(assert (=> (not b_lambda!18899) (not b!1131721)))

(assert (=> b!1131721 t!35762))

(declare-fun b_and!38647 () Bool)

(assert (= b_and!38645 (and (=> t!35762 result!18047) b_and!38647)))

(declare-fun b_lambda!18901 () Bool)

(assert (=> (not b_lambda!18901) (not b!1131722)))

(assert (=> b!1131722 t!35762))

(declare-fun b_and!38649 () Bool)

(assert (= b_and!38647 (and (=> t!35762 result!18047) b_and!38649)))

(assert (=> b!1131724 m!1043909))

(assert (=> b!1131724 m!1043909))

(declare-fun m!1044091 () Bool)

(assert (=> b!1131724 m!1044091))

(declare-fun m!1044093 () Bool)

(assert (=> bm!48729 m!1044093))

(assert (=> b!1131721 m!1043919))

(declare-fun m!1044095 () Bool)

(assert (=> b!1131721 m!1044095))

(assert (=> b!1131721 m!1043909))

(declare-fun m!1044097 () Bool)

(assert (=> b!1131721 m!1044097))

(declare-fun m!1044099 () Bool)

(assert (=> b!1131721 m!1044099))

(declare-fun m!1044101 () Bool)

(assert (=> b!1131721 m!1044101))

(assert (=> b!1131721 m!1044099))

(declare-fun m!1044103 () Bool)

(assert (=> b!1131721 m!1044103))

(assert (=> b!1131721 m!1044101))

(assert (=> b!1131721 m!1043919))

(declare-fun m!1044105 () Bool)

(assert (=> b!1131721 m!1044105))

(assert (=> b!1131729 m!1043909))

(assert (=> b!1131729 m!1043909))

(declare-fun m!1044107 () Bool)

(assert (=> b!1131729 m!1044107))

(declare-fun m!1044109 () Bool)

(assert (=> b!1131732 m!1044109))

(declare-fun m!1044111 () Bool)

(assert (=> d!131145 m!1044111))

(assert (=> d!131145 m!1043893))

(declare-fun m!1044113 () Bool)

(assert (=> b!1131730 m!1044113))

(assert (=> b!1131726 m!1044093))

(assert (=> b!1131722 m!1043919))

(assert (=> b!1131722 m!1043909))

(assert (=> b!1131722 m!1043909))

(declare-fun m!1044115 () Bool)

(assert (=> b!1131722 m!1044115))

(assert (=> b!1131722 m!1044101))

(assert (=> b!1131722 m!1043919))

(assert (=> b!1131722 m!1044105))

(assert (=> b!1131722 m!1044101))

(assert (=> b!1131725 m!1043909))

(assert (=> b!1131725 m!1043909))

(assert (=> b!1131725 m!1044107))

(assert (=> b!1131502 d!131145))

(declare-fun d!131147 () Bool)

(declare-fun e!644059 () Bool)

(assert (=> d!131147 e!644059))

(declare-fun res!755996 () Bool)

(assert (=> d!131147 (=> res!755996 e!644059)))

(declare-fun lt!502590 () Bool)

(assert (=> d!131147 (= res!755996 (not lt!502590))))

(declare-fun lt!502588 () Bool)

(assert (=> d!131147 (= lt!502590 lt!502588)))

(declare-fun lt!502591 () Unit!36912)

(declare-fun e!644058 () Unit!36912)

(assert (=> d!131147 (= lt!502591 e!644058)))

(declare-fun c!110236 () Bool)

(assert (=> d!131147 (= c!110236 lt!502588)))

(declare-fun containsKey!585 (List!24846 (_ BitVec 64)) Bool)

(assert (=> d!131147 (= lt!502588 (containsKey!585 (toList!8048 lt!502448) k0!934))))

(assert (=> d!131147 (= (contains!6500 lt!502448 k0!934) lt!502590)))

(declare-fun b!1131739 () Bool)

(declare-fun lt!502589 () Unit!36912)

(assert (=> b!1131739 (= e!644058 lt!502589)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!414 (List!24846 (_ BitVec 64)) Unit!36912)

(assert (=> b!1131739 (= lt!502589 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502448) k0!934))))

(declare-datatypes ((Option!681 0))(
  ( (Some!680 (v!16924 V!43081)) (None!679) )
))
(declare-fun isDefined!457 (Option!681) Bool)

(declare-fun getValueByKey!630 (List!24846 (_ BitVec 64)) Option!681)

(assert (=> b!1131739 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502448) k0!934))))

(declare-fun b!1131740 () Bool)

(declare-fun Unit!36920 () Unit!36912)

(assert (=> b!1131740 (= e!644058 Unit!36920)))

(declare-fun b!1131741 () Bool)

(assert (=> b!1131741 (= e!644059 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502448) k0!934)))))

(assert (= (and d!131147 c!110236) b!1131739))

(assert (= (and d!131147 (not c!110236)) b!1131740))

(assert (= (and d!131147 (not res!755996)) b!1131741))

(declare-fun m!1044117 () Bool)

(assert (=> d!131147 m!1044117))

(declare-fun m!1044119 () Bool)

(assert (=> b!1131739 m!1044119))

(declare-fun m!1044121 () Bool)

(assert (=> b!1131739 m!1044121))

(assert (=> b!1131739 m!1044121))

(declare-fun m!1044123 () Bool)

(assert (=> b!1131739 m!1044123))

(assert (=> b!1131741 m!1044121))

(assert (=> b!1131741 m!1044121))

(assert (=> b!1131741 m!1044123))

(assert (=> b!1131486 d!131147))

(declare-fun b!1131742 () Bool)

(declare-fun lt!502592 () Unit!36912)

(declare-fun lt!502595 () Unit!36912)

(assert (=> b!1131742 (= lt!502592 lt!502595)))

(declare-fun lt!502598 () V!43081)

(declare-fun lt!502596 () ListLongMap!16065)

(declare-fun lt!502593 () (_ BitVec 64))

(declare-fun lt!502594 () (_ BitVec 64))

(assert (=> b!1131742 (not (contains!6500 (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598)) lt!502594))))

(assert (=> b!1131742 (= lt!502595 (addStillNotContains!284 lt!502596 lt!502593 lt!502598 lt!502594))))

(assert (=> b!1131742 (= lt!502594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131742 (= lt!502598 (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131742 (= lt!502593 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48733 () ListLongMap!16065)

(assert (=> b!1131742 (= lt!502596 call!48733)))

(declare-fun e!644062 () ListLongMap!16065)

(assert (=> b!1131742 (= e!644062 (+!3486 call!48733 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48730 () Bool)

(assert (=> bm!48730 (= call!48733 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131743 () Bool)

(assert (=> b!1131743 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208)))))

(assert (=> b!1131743 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36047 _values!996)))))

(declare-fun lt!502597 () ListLongMap!16065)

(declare-fun e!644064 () Bool)

(assert (=> b!1131743 (= e!644064 (= (apply!948 lt!502597 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131149 () Bool)

(declare-fun e!644063 () Bool)

(assert (=> d!131149 e!644063))

(declare-fun res!755997 () Bool)

(assert (=> d!131149 (=> (not res!755997) (not e!644063))))

(assert (=> d!131149 (= res!755997 (not (contains!6500 lt!502597 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644061 () ListLongMap!16065)

(assert (=> d!131149 (= lt!502597 e!644061)))

(declare-fun c!110238 () Bool)

(assert (=> d!131149 (= c!110238 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208)))))

(assert (=> d!131149 (validMask!0 mask!1564)))

(assert (=> d!131149 (= (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502597)))

(declare-fun b!1131744 () Bool)

(declare-fun e!644060 () Bool)

(declare-fun e!644066 () Bool)

(assert (=> b!1131744 (= e!644060 e!644066)))

(declare-fun c!110239 () Bool)

(assert (=> b!1131744 (= c!110239 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208)))))

(declare-fun b!1131745 () Bool)

(assert (=> b!1131745 (= e!644060 e!644064)))

(assert (=> b!1131745 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208)))))

(declare-fun res!756000 () Bool)

(assert (=> b!1131745 (= res!756000 (contains!6500 lt!502597 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131745 (=> (not res!756000) (not e!644064))))

(declare-fun b!1131746 () Bool)

(assert (=> b!1131746 (= e!644061 e!644062)))

(declare-fun c!110237 () Bool)

(assert (=> b!1131746 (= c!110237 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1131747 () Bool)

(assert (=> b!1131747 (= e!644066 (= lt!502597 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131748 () Bool)

(assert (=> b!1131748 (= e!644061 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131749 () Bool)

(assert (=> b!1131749 (= e!644063 e!644060)))

(declare-fun c!110240 () Bool)

(declare-fun e!644065 () Bool)

(assert (=> b!1131749 (= c!110240 e!644065)))

(declare-fun res!755999 () Bool)

(assert (=> b!1131749 (=> (not res!755999) (not e!644065))))

(assert (=> b!1131749 (= res!755999 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208)))))

(declare-fun b!1131750 () Bool)

(assert (=> b!1131750 (= e!644065 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131750 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1131751 () Bool)

(assert (=> b!1131751 (= e!644066 (isEmpty!978 lt!502597))))

(declare-fun b!1131752 () Bool)

(assert (=> b!1131752 (= e!644062 call!48733)))

(declare-fun b!1131753 () Bool)

(declare-fun res!755998 () Bool)

(assert (=> b!1131753 (=> (not res!755998) (not e!644063))))

(assert (=> b!1131753 (= res!755998 (not (contains!6500 lt!502597 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131149 c!110238) b!1131748))

(assert (= (and d!131149 (not c!110238)) b!1131746))

(assert (= (and b!1131746 c!110237) b!1131742))

(assert (= (and b!1131746 (not c!110237)) b!1131752))

(assert (= (or b!1131742 b!1131752) bm!48730))

(assert (= (and d!131149 res!755997) b!1131753))

(assert (= (and b!1131753 res!755998) b!1131749))

(assert (= (and b!1131749 res!755999) b!1131750))

(assert (= (and b!1131749 c!110240) b!1131745))

(assert (= (and b!1131749 (not c!110240)) b!1131744))

(assert (= (and b!1131745 res!756000) b!1131743))

(assert (= (and b!1131744 c!110239) b!1131747))

(assert (= (and b!1131744 (not c!110239)) b!1131751))

(declare-fun b_lambda!18903 () Bool)

(assert (=> (not b_lambda!18903) (not b!1131742)))

(assert (=> b!1131742 t!35762))

(declare-fun b_and!38651 () Bool)

(assert (= b_and!38649 (and (=> t!35762 result!18047) b_and!38651)))

(declare-fun b_lambda!18905 () Bool)

(assert (=> (not b_lambda!18905) (not b!1131743)))

(assert (=> b!1131743 t!35762))

(declare-fun b_and!38653 () Bool)

(assert (= b_and!38651 (and (=> t!35762 result!18047) b_and!38653)))

(declare-fun m!1044125 () Bool)

(assert (=> b!1131745 m!1044125))

(assert (=> b!1131745 m!1044125))

(declare-fun m!1044127 () Bool)

(assert (=> b!1131745 m!1044127))

(declare-fun m!1044129 () Bool)

(assert (=> bm!48730 m!1044129))

(assert (=> b!1131742 m!1043919))

(declare-fun m!1044131 () Bool)

(assert (=> b!1131742 m!1044131))

(assert (=> b!1131742 m!1044125))

(declare-fun m!1044133 () Bool)

(assert (=> b!1131742 m!1044133))

(declare-fun m!1044135 () Bool)

(assert (=> b!1131742 m!1044135))

(declare-fun m!1044137 () Bool)

(assert (=> b!1131742 m!1044137))

(assert (=> b!1131742 m!1044135))

(declare-fun m!1044139 () Bool)

(assert (=> b!1131742 m!1044139))

(assert (=> b!1131742 m!1044137))

(assert (=> b!1131742 m!1043919))

(declare-fun m!1044141 () Bool)

(assert (=> b!1131742 m!1044141))

(assert (=> b!1131750 m!1044125))

(assert (=> b!1131750 m!1044125))

(declare-fun m!1044143 () Bool)

(assert (=> b!1131750 m!1044143))

(declare-fun m!1044145 () Bool)

(assert (=> b!1131753 m!1044145))

(declare-fun m!1044147 () Bool)

(assert (=> d!131149 m!1044147))

(assert (=> d!131149 m!1043893))

(declare-fun m!1044149 () Bool)

(assert (=> b!1131751 m!1044149))

(assert (=> b!1131747 m!1044129))

(assert (=> b!1131743 m!1043919))

(assert (=> b!1131743 m!1044125))

(assert (=> b!1131743 m!1044125))

(declare-fun m!1044151 () Bool)

(assert (=> b!1131743 m!1044151))

(assert (=> b!1131743 m!1044137))

(assert (=> b!1131743 m!1043919))

(assert (=> b!1131743 m!1044141))

(assert (=> b!1131743 m!1044137))

(assert (=> b!1131746 m!1044125))

(assert (=> b!1131746 m!1044125))

(assert (=> b!1131746 m!1044143))

(assert (=> b!1131486 d!131149))

(declare-fun b!1131764 () Bool)

(declare-fun e!644078 () Bool)

(declare-fun e!644076 () Bool)

(assert (=> b!1131764 (= e!644078 e!644076)))

(declare-fun c!110243 () Bool)

(assert (=> b!1131764 (= c!110243 (validKeyInArray!0 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1131765 () Bool)

(declare-fun e!644077 () Bool)

(declare-fun contains!6503 (List!24845 (_ BitVec 64)) Bool)

(assert (=> b!1131765 (= e!644077 (contains!6503 Nil!24842 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1131766 () Bool)

(declare-fun e!644075 () Bool)

(assert (=> b!1131766 (= e!644075 e!644078)))

(declare-fun res!756008 () Bool)

(assert (=> b!1131766 (=> (not res!756008) (not e!644078))))

(assert (=> b!1131766 (= res!756008 (not e!644077))))

(declare-fun res!756009 () Bool)

(assert (=> b!1131766 (=> (not res!756009) (not e!644077))))

(assert (=> b!1131766 (= res!756009 (validKeyInArray!0 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1131767 () Bool)

(declare-fun call!48736 () Bool)

(assert (=> b!1131767 (= e!644076 call!48736)))

(declare-fun bm!48733 () Bool)

(assert (=> bm!48733 (= call!48736 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110243 (Cons!24841 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) Nil!24842) Nil!24842)))))

(declare-fun b!1131768 () Bool)

(assert (=> b!1131768 (= e!644076 call!48736)))

(declare-fun d!131151 () Bool)

(declare-fun res!756007 () Bool)

(assert (=> d!131151 (=> res!756007 e!644075)))

(assert (=> d!131151 (= res!756007 (bvsge #b00000000000000000000000000000000 (size!36046 _keys!1208)))))

(assert (=> d!131151 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24842) e!644075)))

(assert (= (and d!131151 (not res!756007)) b!1131766))

(assert (= (and b!1131766 res!756009) b!1131765))

(assert (= (and b!1131766 res!756008) b!1131764))

(assert (= (and b!1131764 c!110243) b!1131768))

(assert (= (and b!1131764 (not c!110243)) b!1131767))

(assert (= (or b!1131768 b!1131767) bm!48733))

(declare-fun m!1044153 () Bool)

(assert (=> b!1131764 m!1044153))

(assert (=> b!1131764 m!1044153))

(declare-fun m!1044155 () Bool)

(assert (=> b!1131764 m!1044155))

(assert (=> b!1131765 m!1044153))

(assert (=> b!1131765 m!1044153))

(declare-fun m!1044157 () Bool)

(assert (=> b!1131765 m!1044157))

(assert (=> b!1131766 m!1044153))

(assert (=> b!1131766 m!1044153))

(assert (=> b!1131766 m!1044155))

(assert (=> bm!48733 m!1044153))

(declare-fun m!1044159 () Bool)

(assert (=> bm!48733 m!1044159))

(assert (=> b!1131495 d!131151))

(declare-fun b!1131775 () Bool)

(declare-fun e!644084 () Bool)

(declare-fun call!48742 () ListLongMap!16065)

(declare-fun call!48741 () ListLongMap!16065)

(assert (=> b!1131775 (= e!644084 (= call!48742 call!48741))))

(assert (=> b!1131775 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36047 _values!996)))))

(declare-fun b!1131776 () Bool)

(declare-fun e!644083 () Bool)

(assert (=> b!1131776 (= e!644083 e!644084)))

(declare-fun c!110246 () Bool)

(assert (=> b!1131776 (= c!110246 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!131153 () Bool)

(assert (=> d!131153 e!644083))

(declare-fun res!756012 () Bool)

(assert (=> d!131153 (=> (not res!756012) (not e!644083))))

(assert (=> d!131153 (= res!756012 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36046 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36046 _keys!1208))))))))

(declare-fun lt!502601 () Unit!36912)

(declare-fun choose!1782 (array!73710 array!73712 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36912)

(assert (=> d!131153 (= lt!502601 (choose!1782 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131153 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208)))))

(assert (=> d!131153 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502601)))

(declare-fun b!1131777 () Bool)

(assert (=> b!1131777 (= e!644084 (= call!48742 (-!1153 call!48741 k0!934)))))

(assert (=> b!1131777 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36047 _values!996)))))

(declare-fun bm!48738 () Bool)

(assert (=> bm!48738 (= call!48741 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48739 () Bool)

(assert (=> bm!48739 (= call!48742 (getCurrentListMapNoExtraKeys!4547 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)) (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!131153 res!756012) b!1131776))

(assert (= (and b!1131776 c!110246) b!1131777))

(assert (= (and b!1131776 (not c!110246)) b!1131775))

(assert (= (or b!1131777 b!1131775) bm!48738))

(assert (= (or b!1131777 b!1131775) bm!48739))

(declare-fun b_lambda!18907 () Bool)

(assert (=> (not b_lambda!18907) (not bm!48739)))

(assert (=> bm!48739 t!35762))

(declare-fun b_and!38655 () Bool)

(assert (= b_and!38653 (and (=> t!35762 result!18047) b_and!38655)))

(declare-fun m!1044161 () Bool)

(assert (=> d!131153 m!1044161))

(declare-fun m!1044163 () Bool)

(assert (=> b!1131777 m!1044163))

(assert (=> bm!48738 m!1043901))

(assert (=> bm!48739 m!1043879))

(assert (=> bm!48739 m!1043919))

(assert (=> bm!48739 m!1043921))

(declare-fun m!1044165 () Bool)

(assert (=> bm!48739 m!1044165))

(assert (=> b!1131504 d!131153))

(declare-fun d!131155 () Bool)

(assert (=> d!131155 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131496 d!131155))

(declare-fun d!131157 () Bool)

(declare-fun e!644087 () Bool)

(assert (=> d!131157 e!644087))

(declare-fun res!756018 () Bool)

(assert (=> d!131157 (=> (not res!756018) (not e!644087))))

(declare-fun lt!502611 () ListLongMap!16065)

(assert (=> d!131157 (= res!756018 (contains!6500 lt!502611 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!502612 () List!24846)

(assert (=> d!131157 (= lt!502611 (ListLongMap!16066 lt!502612))))

(declare-fun lt!502610 () Unit!36912)

(declare-fun lt!502613 () Unit!36912)

(assert (=> d!131157 (= lt!502610 lt!502613)))

(assert (=> d!131157 (= (getValueByKey!630 lt!502612 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!680 (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!306 (List!24846 (_ BitVec 64) V!43081) Unit!36912)

(assert (=> d!131157 (= lt!502613 (lemmaContainsTupThenGetReturnValue!306 lt!502612 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!399 (List!24846 (_ BitVec 64) V!43081) List!24846)

(assert (=> d!131157 (= lt!502612 (insertStrictlySorted!399 (toList!8048 lt!502448) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131157 (= (+!3486 lt!502448 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!502611)))

(declare-fun b!1131782 () Bool)

(declare-fun res!756017 () Bool)

(assert (=> b!1131782 (=> (not res!756017) (not e!644087))))

(assert (=> b!1131782 (= res!756017 (= (getValueByKey!630 (toList!8048 lt!502611) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!680 (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1131783 () Bool)

(declare-fun contains!6504 (List!24846 tuple2!18096) Bool)

(assert (=> b!1131783 (= e!644087 (contains!6504 (toList!8048 lt!502611) (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131157 res!756018) b!1131782))

(assert (= (and b!1131782 res!756017) b!1131783))

(declare-fun m!1044167 () Bool)

(assert (=> d!131157 m!1044167))

(declare-fun m!1044169 () Bool)

(assert (=> d!131157 m!1044169))

(declare-fun m!1044171 () Bool)

(assert (=> d!131157 m!1044171))

(declare-fun m!1044173 () Bool)

(assert (=> d!131157 m!1044173))

(declare-fun m!1044175 () Bool)

(assert (=> b!1131782 m!1044175))

(declare-fun m!1044177 () Bool)

(assert (=> b!1131783 m!1044177))

(assert (=> bm!48668 d!131157))

(declare-fun d!131159 () Bool)

(assert (=> d!131159 (= (array_inv!27310 _keys!1208) (bvsge (size!36046 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!98228 d!131159))

(declare-fun d!131161 () Bool)

(assert (=> d!131161 (= (array_inv!27311 _values!996) (bvsge (size!36047 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!98228 d!131161))

(declare-fun b!1131784 () Bool)

(declare-fun lt!502614 () Unit!36912)

(declare-fun lt!502617 () Unit!36912)

(assert (=> b!1131784 (= lt!502614 lt!502617)))

(declare-fun lt!502615 () (_ BitVec 64))

(declare-fun lt!502620 () V!43081)

(declare-fun lt!502618 () ListLongMap!16065)

(declare-fun lt!502616 () (_ BitVec 64))

(assert (=> b!1131784 (not (contains!6500 (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620)) lt!502616))))

(assert (=> b!1131784 (= lt!502617 (addStillNotContains!284 lt!502618 lt!502615 lt!502620 lt!502616))))

(assert (=> b!1131784 (= lt!502616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131784 (= lt!502620 (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131784 (= lt!502615 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48743 () ListLongMap!16065)

(assert (=> b!1131784 (= lt!502618 call!48743)))

(declare-fun e!644090 () ListLongMap!16065)

(assert (=> b!1131784 (= e!644090 (+!3486 call!48743 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48740 () Bool)

(assert (=> bm!48740 (= call!48743 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 lt!502441 _keys!1208) (ite c!110180 lt!502452 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131785 () Bool)

(assert (=> b!1131785 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(assert (=> b!1131785 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36047 (ite c!110180 lt!502452 _values!996))))))

(declare-fun lt!502619 () ListLongMap!16065)

(declare-fun e!644092 () Bool)

(assert (=> b!1131785 (= e!644092 (= (apply!948 lt!502619 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131163 () Bool)

(declare-fun e!644091 () Bool)

(assert (=> d!131163 e!644091))

(declare-fun res!756019 () Bool)

(assert (=> d!131163 (=> (not res!756019) (not e!644091))))

(assert (=> d!131163 (= res!756019 (not (contains!6500 lt!502619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644089 () ListLongMap!16065)

(assert (=> d!131163 (= lt!502619 e!644089)))

(declare-fun c!110248 () Bool)

(assert (=> d!131163 (= c!110248 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(assert (=> d!131163 (validMask!0 mask!1564)))

(assert (=> d!131163 (= (getCurrentListMapNoExtraKeys!4547 (ite c!110180 lt!502441 _keys!1208) (ite c!110180 lt!502452 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502619)))

(declare-fun b!1131786 () Bool)

(declare-fun e!644088 () Bool)

(declare-fun e!644094 () Bool)

(assert (=> b!1131786 (= e!644088 e!644094)))

(declare-fun c!110249 () Bool)

(assert (=> b!1131786 (= c!110249 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(declare-fun b!1131787 () Bool)

(assert (=> b!1131787 (= e!644088 e!644092)))

(assert (=> b!1131787 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(declare-fun res!756022 () Bool)

(assert (=> b!1131787 (= res!756022 (contains!6500 lt!502619 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131787 (=> (not res!756022) (not e!644092))))

(declare-fun b!1131788 () Bool)

(assert (=> b!1131788 (= e!644089 e!644090)))

(declare-fun c!110247 () Bool)

(assert (=> b!1131788 (= c!110247 (validKeyInArray!0 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1131789 () Bool)

(assert (=> b!1131789 (= e!644094 (= lt!502619 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 lt!502441 _keys!1208) (ite c!110180 lt!502452 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131790 () Bool)

(assert (=> b!1131790 (= e!644089 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131791 () Bool)

(assert (=> b!1131791 (= e!644091 e!644088)))

(declare-fun c!110250 () Bool)

(declare-fun e!644093 () Bool)

(assert (=> b!1131791 (= c!110250 e!644093)))

(declare-fun res!756021 () Bool)

(assert (=> b!1131791 (=> (not res!756021) (not e!644093))))

(assert (=> b!1131791 (= res!756021 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(declare-fun b!1131792 () Bool)

(assert (=> b!1131792 (= e!644093 (validKeyInArray!0 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131792 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1131793 () Bool)

(assert (=> b!1131793 (= e!644094 (isEmpty!978 lt!502619))))

(declare-fun b!1131794 () Bool)

(assert (=> b!1131794 (= e!644090 call!48743)))

(declare-fun b!1131795 () Bool)

(declare-fun res!756020 () Bool)

(assert (=> b!1131795 (=> (not res!756020) (not e!644091))))

(assert (=> b!1131795 (= res!756020 (not (contains!6500 lt!502619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131163 c!110248) b!1131790))

(assert (= (and d!131163 (not c!110248)) b!1131788))

(assert (= (and b!1131788 c!110247) b!1131784))

(assert (= (and b!1131788 (not c!110247)) b!1131794))

(assert (= (or b!1131784 b!1131794) bm!48740))

(assert (= (and d!131163 res!756019) b!1131795))

(assert (= (and b!1131795 res!756020) b!1131791))

(assert (= (and b!1131791 res!756021) b!1131792))

(assert (= (and b!1131791 c!110250) b!1131787))

(assert (= (and b!1131791 (not c!110250)) b!1131786))

(assert (= (and b!1131787 res!756022) b!1131785))

(assert (= (and b!1131786 c!110249) b!1131789))

(assert (= (and b!1131786 (not c!110249)) b!1131793))

(declare-fun b_lambda!18909 () Bool)

(assert (=> (not b_lambda!18909) (not b!1131784)))

(assert (=> b!1131784 t!35762))

(declare-fun b_and!38657 () Bool)

(assert (= b_and!38655 (and (=> t!35762 result!18047) b_and!38657)))

(declare-fun b_lambda!18911 () Bool)

(assert (=> (not b_lambda!18911) (not b!1131785)))

(assert (=> b!1131785 t!35762))

(declare-fun b_and!38659 () Bool)

(assert (= b_and!38657 (and (=> t!35762 result!18047) b_and!38659)))

(declare-fun m!1044179 () Bool)

(assert (=> b!1131787 m!1044179))

(assert (=> b!1131787 m!1044179))

(declare-fun m!1044181 () Bool)

(assert (=> b!1131787 m!1044181))

(declare-fun m!1044183 () Bool)

(assert (=> bm!48740 m!1044183))

(assert (=> b!1131784 m!1043919))

(declare-fun m!1044185 () Bool)

(assert (=> b!1131784 m!1044185))

(assert (=> b!1131784 m!1044179))

(declare-fun m!1044187 () Bool)

(assert (=> b!1131784 m!1044187))

(declare-fun m!1044189 () Bool)

(assert (=> b!1131784 m!1044189))

(declare-fun m!1044191 () Bool)

(assert (=> b!1131784 m!1044191))

(assert (=> b!1131784 m!1044189))

(declare-fun m!1044193 () Bool)

(assert (=> b!1131784 m!1044193))

(assert (=> b!1131784 m!1044191))

(assert (=> b!1131784 m!1043919))

(declare-fun m!1044195 () Bool)

(assert (=> b!1131784 m!1044195))

(assert (=> b!1131792 m!1044179))

(assert (=> b!1131792 m!1044179))

(declare-fun m!1044197 () Bool)

(assert (=> b!1131792 m!1044197))

(declare-fun m!1044199 () Bool)

(assert (=> b!1131795 m!1044199))

(declare-fun m!1044201 () Bool)

(assert (=> d!131163 m!1044201))

(assert (=> d!131163 m!1043893))

(declare-fun m!1044203 () Bool)

(assert (=> b!1131793 m!1044203))

(assert (=> b!1131789 m!1044183))

(assert (=> b!1131785 m!1043919))

(assert (=> b!1131785 m!1044179))

(assert (=> b!1131785 m!1044179))

(declare-fun m!1044205 () Bool)

(assert (=> b!1131785 m!1044205))

(assert (=> b!1131785 m!1044191))

(assert (=> b!1131785 m!1043919))

(assert (=> b!1131785 m!1044195))

(assert (=> b!1131785 m!1044191))

(assert (=> b!1131788 m!1044179))

(assert (=> b!1131788 m!1044179))

(assert (=> b!1131788 m!1044197))

(assert (=> bm!48671 d!131163))

(declare-fun b!1131796 () Bool)

(declare-fun lt!502621 () Unit!36912)

(declare-fun lt!502624 () Unit!36912)

(assert (=> b!1131796 (= lt!502621 lt!502624)))

(declare-fun lt!502625 () ListLongMap!16065)

(declare-fun lt!502627 () V!43081)

(declare-fun lt!502623 () (_ BitVec 64))

(declare-fun lt!502622 () (_ BitVec 64))

(assert (=> b!1131796 (not (contains!6500 (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627)) lt!502623))))

(assert (=> b!1131796 (= lt!502624 (addStillNotContains!284 lt!502625 lt!502622 lt!502627 lt!502623))))

(assert (=> b!1131796 (= lt!502623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131796 (= lt!502627 (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131796 (= lt!502622 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48744 () ListLongMap!16065)

(assert (=> b!1131796 (= lt!502625 call!48744)))

(declare-fun e!644097 () ListLongMap!16065)

(assert (=> b!1131796 (= e!644097 (+!3486 call!48744 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48741 () Bool)

(assert (=> bm!48741 (= call!48744 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 _keys!1208 lt!502441) (ite c!110180 _values!996 lt!502452) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131797 () Bool)

(assert (=> b!1131797 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(assert (=> b!1131797 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36047 (ite c!110180 _values!996 lt!502452))))))

(declare-fun lt!502626 () ListLongMap!16065)

(declare-fun e!644099 () Bool)

(assert (=> b!1131797 (= e!644099 (= (apply!948 lt!502626 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131165 () Bool)

(declare-fun e!644098 () Bool)

(assert (=> d!131165 e!644098))

(declare-fun res!756023 () Bool)

(assert (=> d!131165 (=> (not res!756023) (not e!644098))))

(assert (=> d!131165 (= res!756023 (not (contains!6500 lt!502626 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644096 () ListLongMap!16065)

(assert (=> d!131165 (= lt!502626 e!644096)))

(declare-fun c!110252 () Bool)

(assert (=> d!131165 (= c!110252 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(assert (=> d!131165 (validMask!0 mask!1564)))

(assert (=> d!131165 (= (getCurrentListMapNoExtraKeys!4547 (ite c!110180 _keys!1208 lt!502441) (ite c!110180 _values!996 lt!502452) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502626)))

(declare-fun b!1131798 () Bool)

(declare-fun e!644095 () Bool)

(declare-fun e!644101 () Bool)

(assert (=> b!1131798 (= e!644095 e!644101)))

(declare-fun c!110253 () Bool)

(assert (=> b!1131798 (= c!110253 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(declare-fun b!1131799 () Bool)

(assert (=> b!1131799 (= e!644095 e!644099)))

(assert (=> b!1131799 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(declare-fun res!756026 () Bool)

(assert (=> b!1131799 (= res!756026 (contains!6500 lt!502626 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131799 (=> (not res!756026) (not e!644099))))

(declare-fun b!1131800 () Bool)

(assert (=> b!1131800 (= e!644096 e!644097)))

(declare-fun c!110251 () Bool)

(assert (=> b!1131800 (= c!110251 (validKeyInArray!0 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1131801 () Bool)

(assert (=> b!1131801 (= e!644101 (= lt!502626 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 _keys!1208 lt!502441) (ite c!110180 _values!996 lt!502452) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131802 () Bool)

(assert (=> b!1131802 (= e!644096 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131803 () Bool)

(assert (=> b!1131803 (= e!644098 e!644095)))

(declare-fun c!110254 () Bool)

(declare-fun e!644100 () Bool)

(assert (=> b!1131803 (= c!110254 e!644100)))

(declare-fun res!756025 () Bool)

(assert (=> b!1131803 (=> (not res!756025) (not e!644100))))

(assert (=> b!1131803 (= res!756025 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(declare-fun b!1131804 () Bool)

(assert (=> b!1131804 (= e!644100 (validKeyInArray!0 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131804 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1131805 () Bool)

(assert (=> b!1131805 (= e!644101 (isEmpty!978 lt!502626))))

(declare-fun b!1131806 () Bool)

(assert (=> b!1131806 (= e!644097 call!48744)))

(declare-fun b!1131807 () Bool)

(declare-fun res!756024 () Bool)

(assert (=> b!1131807 (=> (not res!756024) (not e!644098))))

(assert (=> b!1131807 (= res!756024 (not (contains!6500 lt!502626 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131165 c!110252) b!1131802))

(assert (= (and d!131165 (not c!110252)) b!1131800))

(assert (= (and b!1131800 c!110251) b!1131796))

(assert (= (and b!1131800 (not c!110251)) b!1131806))

(assert (= (or b!1131796 b!1131806) bm!48741))

(assert (= (and d!131165 res!756023) b!1131807))

(assert (= (and b!1131807 res!756024) b!1131803))

(assert (= (and b!1131803 res!756025) b!1131804))

(assert (= (and b!1131803 c!110254) b!1131799))

(assert (= (and b!1131803 (not c!110254)) b!1131798))

(assert (= (and b!1131799 res!756026) b!1131797))

(assert (= (and b!1131798 c!110253) b!1131801))

(assert (= (and b!1131798 (not c!110253)) b!1131805))

(declare-fun b_lambda!18913 () Bool)

(assert (=> (not b_lambda!18913) (not b!1131796)))

(assert (=> b!1131796 t!35762))

(declare-fun b_and!38661 () Bool)

(assert (= b_and!38659 (and (=> t!35762 result!18047) b_and!38661)))

(declare-fun b_lambda!18915 () Bool)

(assert (=> (not b_lambda!18915) (not b!1131797)))

(assert (=> b!1131797 t!35762))

(declare-fun b_and!38663 () Bool)

(assert (= b_and!38661 (and (=> t!35762 result!18047) b_and!38663)))

(declare-fun m!1044207 () Bool)

(assert (=> b!1131799 m!1044207))

(assert (=> b!1131799 m!1044207))

(declare-fun m!1044209 () Bool)

(assert (=> b!1131799 m!1044209))

(declare-fun m!1044211 () Bool)

(assert (=> bm!48741 m!1044211))

(assert (=> b!1131796 m!1043919))

(declare-fun m!1044213 () Bool)

(assert (=> b!1131796 m!1044213))

(assert (=> b!1131796 m!1044207))

(declare-fun m!1044215 () Bool)

(assert (=> b!1131796 m!1044215))

(declare-fun m!1044217 () Bool)

(assert (=> b!1131796 m!1044217))

(declare-fun m!1044219 () Bool)

(assert (=> b!1131796 m!1044219))

(assert (=> b!1131796 m!1044217))

(declare-fun m!1044221 () Bool)

(assert (=> b!1131796 m!1044221))

(assert (=> b!1131796 m!1044219))

(assert (=> b!1131796 m!1043919))

(declare-fun m!1044223 () Bool)

(assert (=> b!1131796 m!1044223))

(assert (=> b!1131804 m!1044207))

(assert (=> b!1131804 m!1044207))

(declare-fun m!1044225 () Bool)

(assert (=> b!1131804 m!1044225))

(declare-fun m!1044227 () Bool)

(assert (=> b!1131807 m!1044227))

(declare-fun m!1044229 () Bool)

(assert (=> d!131165 m!1044229))

(assert (=> d!131165 m!1043893))

(declare-fun m!1044231 () Bool)

(assert (=> b!1131805 m!1044231))

(assert (=> b!1131801 m!1044211))

(assert (=> b!1131797 m!1043919))

(assert (=> b!1131797 m!1044207))

(assert (=> b!1131797 m!1044207))

(declare-fun m!1044233 () Bool)

(assert (=> b!1131797 m!1044233))

(assert (=> b!1131797 m!1044219))

(assert (=> b!1131797 m!1043919))

(assert (=> b!1131797 m!1044223))

(assert (=> b!1131797 m!1044219))

(assert (=> b!1131800 m!1044207))

(assert (=> b!1131800 m!1044207))

(assert (=> b!1131800 m!1044225))

(assert (=> bm!48673 d!131165))

(declare-fun b!1131808 () Bool)

(declare-fun e!644103 () Bool)

(declare-fun call!48745 () Bool)

(assert (=> b!1131808 (= e!644103 call!48745)))

(declare-fun b!1131809 () Bool)

(declare-fun e!644102 () Bool)

(assert (=> b!1131809 (= e!644102 e!644103)))

(declare-fun c!110255 () Bool)

(assert (=> b!1131809 (= c!110255 (validKeyInArray!0 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1131810 () Bool)

(declare-fun e!644104 () Bool)

(assert (=> b!1131810 (= e!644103 e!644104)))

(declare-fun lt!502628 () (_ BitVec 64))

(assert (=> b!1131810 (= lt!502628 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!502630 () Unit!36912)

(assert (=> b!1131810 (= lt!502630 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!502628 #b00000000000000000000000000000000))))

(assert (=> b!1131810 (arrayContainsKey!0 _keys!1208 lt!502628 #b00000000000000000000000000000000)))

(declare-fun lt!502629 () Unit!36912)

(assert (=> b!1131810 (= lt!502629 lt!502630)))

(declare-fun res!756028 () Bool)

(assert (=> b!1131810 (= res!756028 (= (seekEntryOrOpen!0 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9924 #b00000000000000000000000000000000)))))

(assert (=> b!1131810 (=> (not res!756028) (not e!644104))))

(declare-fun b!1131811 () Bool)

(assert (=> b!1131811 (= e!644104 call!48745)))

(declare-fun bm!48742 () Bool)

(assert (=> bm!48742 (= call!48745 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!131167 () Bool)

(declare-fun res!756027 () Bool)

(assert (=> d!131167 (=> res!756027 e!644102)))

(assert (=> d!131167 (= res!756027 (bvsge #b00000000000000000000000000000000 (size!36046 _keys!1208)))))

(assert (=> d!131167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!644102)))

(assert (= (and d!131167 (not res!756027)) b!1131809))

(assert (= (and b!1131809 c!110255) b!1131810))

(assert (= (and b!1131809 (not c!110255)) b!1131808))

(assert (= (and b!1131810 res!756028) b!1131811))

(assert (= (or b!1131811 b!1131808) bm!48742))

(assert (=> b!1131809 m!1044153))

(assert (=> b!1131809 m!1044153))

(assert (=> b!1131809 m!1044155))

(assert (=> b!1131810 m!1044153))

(declare-fun m!1044235 () Bool)

(assert (=> b!1131810 m!1044235))

(declare-fun m!1044237 () Bool)

(assert (=> b!1131810 m!1044237))

(assert (=> b!1131810 m!1044153))

(declare-fun m!1044239 () Bool)

(assert (=> b!1131810 m!1044239))

(declare-fun m!1044241 () Bool)

(assert (=> bm!48742 m!1044241))

(assert (=> b!1131481 d!131167))

(declare-fun d!131169 () Bool)

(declare-fun lt!502633 () ListLongMap!16065)

(assert (=> d!131169 (not (contains!6500 lt!502633 k0!934))))

(declare-fun removeStrictlySorted!89 (List!24846 (_ BitVec 64)) List!24846)

(assert (=> d!131169 (= lt!502633 (ListLongMap!16066 (removeStrictlySorted!89 (toList!8048 call!48672) k0!934)))))

(assert (=> d!131169 (= (-!1153 call!48672 k0!934) lt!502633)))

(declare-fun bs!32928 () Bool)

(assert (= bs!32928 d!131169))

(declare-fun m!1044243 () Bool)

(assert (=> bs!32928 m!1044243))

(declare-fun m!1044245 () Bool)

(assert (=> bs!32928 m!1044245))

(assert (=> b!1131482 d!131169))

(declare-fun d!131171 () Bool)

(declare-fun e!644106 () Bool)

(assert (=> d!131171 e!644106))

(declare-fun res!756029 () Bool)

(assert (=> d!131171 (=> res!756029 e!644106)))

(declare-fun lt!502636 () Bool)

(assert (=> d!131171 (= res!756029 (not lt!502636))))

(declare-fun lt!502634 () Bool)

(assert (=> d!131171 (= lt!502636 lt!502634)))

(declare-fun lt!502637 () Unit!36912)

(declare-fun e!644105 () Unit!36912)

(assert (=> d!131171 (= lt!502637 e!644105)))

(declare-fun c!110256 () Bool)

(assert (=> d!131171 (= c!110256 lt!502634)))

(assert (=> d!131171 (= lt!502634 (containsKey!585 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934))))

(assert (=> d!131171 (= (contains!6500 (ite c!110181 lt!502440 call!48674) k0!934) lt!502636)))

(declare-fun b!1131812 () Bool)

(declare-fun lt!502635 () Unit!36912)

(assert (=> b!1131812 (= e!644105 lt!502635)))

(assert (=> b!1131812 (= lt!502635 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934))))

(assert (=> b!1131812 (isDefined!457 (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934))))

(declare-fun b!1131813 () Bool)

(declare-fun Unit!36921 () Unit!36912)

(assert (=> b!1131813 (= e!644105 Unit!36921)))

(declare-fun b!1131814 () Bool)

(assert (=> b!1131814 (= e!644106 (isDefined!457 (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934)))))

(assert (= (and d!131171 c!110256) b!1131812))

(assert (= (and d!131171 (not c!110256)) b!1131813))

(assert (= (and d!131171 (not res!756029)) b!1131814))

(declare-fun m!1044247 () Bool)

(assert (=> d!131171 m!1044247))

(declare-fun m!1044249 () Bool)

(assert (=> b!1131812 m!1044249))

(declare-fun m!1044251 () Bool)

(assert (=> b!1131812 m!1044251))

(assert (=> b!1131812 m!1044251))

(declare-fun m!1044253 () Bool)

(assert (=> b!1131812 m!1044253))

(assert (=> b!1131814 m!1044251))

(assert (=> b!1131814 m!1044251))

(assert (=> b!1131814 m!1044253))

(assert (=> bm!48672 d!131171))

(declare-fun d!131173 () Bool)

(declare-fun res!756034 () Bool)

(declare-fun e!644111 () Bool)

(assert (=> d!131173 (=> res!756034 e!644111)))

(assert (=> d!131173 (= res!756034 (= (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!131173 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!644111)))

(declare-fun b!1131819 () Bool)

(declare-fun e!644112 () Bool)

(assert (=> b!1131819 (= e!644111 e!644112)))

(declare-fun res!756035 () Bool)

(assert (=> b!1131819 (=> (not res!756035) (not e!644112))))

(assert (=> b!1131819 (= res!756035 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1131820 () Bool)

(assert (=> b!1131820 (= e!644112 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!131173 (not res!756034)) b!1131819))

(assert (= (and b!1131819 res!756035) b!1131820))

(assert (=> d!131173 m!1044125))

(declare-fun m!1044255 () Bool)

(assert (=> b!1131820 m!1044255))

(assert (=> b!1131499 d!131173))

(declare-fun d!131175 () Bool)

(declare-fun res!756036 () Bool)

(declare-fun e!644113 () Bool)

(assert (=> d!131175 (=> res!756036 e!644113)))

(assert (=> d!131175 (= res!756036 (= (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131175 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!644113)))

(declare-fun b!1131821 () Bool)

(declare-fun e!644114 () Bool)

(assert (=> b!1131821 (= e!644113 e!644114)))

(declare-fun res!756037 () Bool)

(assert (=> b!1131821 (=> (not res!756037) (not e!644114))))

(assert (=> b!1131821 (= res!756037 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1131822 () Bool)

(assert (=> b!1131822 (= e!644114 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131175 (not res!756036)) b!1131821))

(assert (= (and b!1131821 res!756037) b!1131822))

(assert (=> d!131175 m!1044153))

(declare-fun m!1044257 () Bool)

(assert (=> b!1131822 m!1044257))

(assert (=> b!1131485 d!131175))

(declare-fun d!131177 () Bool)

(assert (=> d!131177 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502640 () Unit!36912)

(declare-fun choose!13 (array!73710 (_ BitVec 64) (_ BitVec 32)) Unit!36912)

(assert (=> d!131177 (= lt!502640 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131177 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131177 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!502640)))

(declare-fun bs!32929 () Bool)

(assert (= bs!32929 d!131177))

(assert (=> bs!32929 m!1043865))

(declare-fun m!1044259 () Bool)

(assert (=> bs!32929 m!1044259))

(assert (=> b!1131485 d!131177))

(declare-fun d!131179 () Bool)

(declare-fun e!644117 () Bool)

(assert (=> d!131179 e!644117))

(declare-fun c!110259 () Bool)

(assert (=> d!131179 (= c!110259 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!502643 () Unit!36912)

(declare-fun choose!1783 (array!73710 array!73712 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 64) (_ BitVec 32) Int) Unit!36912)

(assert (=> d!131179 (= lt!502643 (choose!1783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131179 (validMask!0 mask!1564)))

(assert (=> d!131179 (= (lemmaListMapContainsThenArrayContainsFrom!318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502643)))

(declare-fun b!1131827 () Bool)

(assert (=> b!1131827 (= e!644117 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1131828 () Bool)

(assert (=> b!1131828 (= e!644117 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131179 c!110259) b!1131827))

(assert (= (and d!131179 (not c!110259)) b!1131828))

(declare-fun m!1044261 () Bool)

(assert (=> d!131179 m!1044261))

(assert (=> d!131179 m!1043893))

(assert (=> b!1131827 m!1043881))

(assert (=> b!1131492 d!131179))

(declare-fun b!1131829 () Bool)

(declare-fun e!644121 () Bool)

(declare-fun e!644119 () Bool)

(assert (=> b!1131829 (= e!644121 e!644119)))

(declare-fun c!110260 () Bool)

(assert (=> b!1131829 (= c!110260 (validKeyInArray!0 (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(declare-fun b!1131830 () Bool)

(declare-fun e!644120 () Bool)

(assert (=> b!1131830 (= e!644120 (contains!6503 Nil!24842 (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(declare-fun b!1131831 () Bool)

(declare-fun e!644118 () Bool)

(assert (=> b!1131831 (= e!644118 e!644121)))

(declare-fun res!756039 () Bool)

(assert (=> b!1131831 (=> (not res!756039) (not e!644121))))

(assert (=> b!1131831 (= res!756039 (not e!644120))))

(declare-fun res!756040 () Bool)

(assert (=> b!1131831 (=> (not res!756040) (not e!644120))))

(assert (=> b!1131831 (= res!756040 (validKeyInArray!0 (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(declare-fun b!1131832 () Bool)

(declare-fun call!48746 () Bool)

(assert (=> b!1131832 (= e!644119 call!48746)))

(declare-fun bm!48743 () Bool)

(assert (=> bm!48743 (= call!48746 (arrayNoDuplicates!0 lt!502441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110260 (Cons!24841 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) Nil!24842) Nil!24842)))))

(declare-fun b!1131833 () Bool)

(assert (=> b!1131833 (= e!644119 call!48746)))

(declare-fun d!131181 () Bool)

(declare-fun res!756038 () Bool)

(assert (=> d!131181 (=> res!756038 e!644118)))

(assert (=> d!131181 (= res!756038 (bvsge #b00000000000000000000000000000000 (size!36046 lt!502441)))))

(assert (=> d!131181 (= (arrayNoDuplicates!0 lt!502441 #b00000000000000000000000000000000 Nil!24842) e!644118)))

(assert (= (and d!131181 (not res!756038)) b!1131831))

(assert (= (and b!1131831 res!756040) b!1131830))

(assert (= (and b!1131831 res!756039) b!1131829))

(assert (= (and b!1131829 c!110260) b!1131833))

(assert (= (and b!1131829 (not c!110260)) b!1131832))

(assert (= (or b!1131833 b!1131832) bm!48743))

(assert (=> b!1131829 m!1044051))

(assert (=> b!1131829 m!1044051))

(assert (=> b!1131829 m!1044053))

(assert (=> b!1131830 m!1044051))

(assert (=> b!1131830 m!1044051))

(declare-fun m!1044263 () Bool)

(assert (=> b!1131830 m!1044263))

(assert (=> b!1131831 m!1044051))

(assert (=> b!1131831 m!1044051))

(assert (=> b!1131831 m!1044053))

(assert (=> bm!48743 m!1044051))

(declare-fun m!1044265 () Bool)

(assert (=> bm!48743 m!1044265))

(assert (=> b!1131478 d!131181))

(declare-fun d!131183 () Bool)

(assert (=> d!131183 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1131500 d!131183))

(declare-fun d!131185 () Bool)

(assert (=> d!131185 (contains!6500 (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!502646 () Unit!36912)

(declare-fun choose!1784 (ListLongMap!16065 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!36912)

(assert (=> d!131185 (= lt!502646 (choose!1784 (ite c!110181 lt!502440 lt!502448) (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!131185 (contains!6500 (ite c!110181 lt!502440 lt!502448) k0!934)))

(assert (=> d!131185 (= (addStillContains!704 (ite c!110181 lt!502440 lt!502448) (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)) k0!934) lt!502646)))

(declare-fun bs!32930 () Bool)

(assert (= bs!32930 d!131185))

(declare-fun m!1044267 () Bool)

(assert (=> bs!32930 m!1044267))

(assert (=> bs!32930 m!1044267))

(declare-fun m!1044269 () Bool)

(assert (=> bs!32930 m!1044269))

(declare-fun m!1044271 () Bool)

(assert (=> bs!32930 m!1044271))

(declare-fun m!1044273 () Bool)

(assert (=> bs!32930 m!1044273))

(assert (=> bm!48669 d!131185))

(declare-fun d!131187 () Bool)

(assert (=> d!131187 (contains!6500 (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!502647 () Unit!36912)

(assert (=> d!131187 (= lt!502647 (choose!1784 lt!502448 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!131187 (contains!6500 lt!502448 k0!934)))

(assert (=> d!131187 (= (addStillContains!704 lt!502448 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!502647)))

(declare-fun bs!32931 () Bool)

(assert (= bs!32931 d!131187))

(declare-fun m!1044275 () Bool)

(assert (=> bs!32931 m!1044275))

(assert (=> bs!32931 m!1044275))

(declare-fun m!1044277 () Bool)

(assert (=> bs!32931 m!1044277))

(declare-fun m!1044279 () Bool)

(assert (=> bs!32931 m!1044279))

(assert (=> bs!32931 m!1043899))

(assert (=> b!1131493 d!131187))

(declare-fun d!131189 () Bool)

(declare-fun e!644123 () Bool)

(assert (=> d!131189 e!644123))

(declare-fun res!756041 () Bool)

(assert (=> d!131189 (=> res!756041 e!644123)))

(declare-fun lt!502650 () Bool)

(assert (=> d!131189 (= res!756041 (not lt!502650))))

(declare-fun lt!502648 () Bool)

(assert (=> d!131189 (= lt!502650 lt!502648)))

(declare-fun lt!502651 () Unit!36912)

(declare-fun e!644122 () Unit!36912)

(assert (=> d!131189 (= lt!502651 e!644122)))

(declare-fun c!110261 () Bool)

(assert (=> d!131189 (= c!110261 lt!502648)))

(assert (=> d!131189 (= lt!502648 (containsKey!585 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!131189 (= (contains!6500 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!502650)))

(declare-fun b!1131835 () Bool)

(declare-fun lt!502649 () Unit!36912)

(assert (=> b!1131835 (= e!644122 lt!502649)))

(assert (=> b!1131835 (= lt!502649 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1131835 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1131836 () Bool)

(declare-fun Unit!36922 () Unit!36912)

(assert (=> b!1131836 (= e!644122 Unit!36922)))

(declare-fun b!1131837 () Bool)

(assert (=> b!1131837 (= e!644123 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!131189 c!110261) b!1131835))

(assert (= (and d!131189 (not c!110261)) b!1131836))

(assert (= (and d!131189 (not res!756041)) b!1131837))

(declare-fun m!1044281 () Bool)

(assert (=> d!131189 m!1044281))

(declare-fun m!1044283 () Bool)

(assert (=> b!1131835 m!1044283))

(declare-fun m!1044285 () Bool)

(assert (=> b!1131835 m!1044285))

(assert (=> b!1131835 m!1044285))

(declare-fun m!1044287 () Bool)

(assert (=> b!1131835 m!1044287))

(assert (=> b!1131837 m!1044285))

(assert (=> b!1131837 m!1044285))

(assert (=> b!1131837 m!1044287))

(assert (=> b!1131493 d!131189))

(declare-fun d!131191 () Bool)

(declare-fun e!644124 () Bool)

(assert (=> d!131191 e!644124))

(declare-fun res!756043 () Bool)

(assert (=> d!131191 (=> (not res!756043) (not e!644124))))

(declare-fun lt!502653 () ListLongMap!16065)

(assert (=> d!131191 (= res!756043 (contains!6500 lt!502653 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!502654 () List!24846)

(assert (=> d!131191 (= lt!502653 (ListLongMap!16066 lt!502654))))

(declare-fun lt!502652 () Unit!36912)

(declare-fun lt!502655 () Unit!36912)

(assert (=> d!131191 (= lt!502652 lt!502655)))

(assert (=> d!131191 (= (getValueByKey!630 lt!502654 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!680 (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131191 (= lt!502655 (lemmaContainsTupThenGetReturnValue!306 lt!502654 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131191 (= lt!502654 (insertStrictlySorted!399 (toList!8048 lt!502440) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131191 (= (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!502653)))

(declare-fun b!1131838 () Bool)

(declare-fun res!756042 () Bool)

(assert (=> b!1131838 (=> (not res!756042) (not e!644124))))

(assert (=> b!1131838 (= res!756042 (= (getValueByKey!630 (toList!8048 lt!502653) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!680 (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1131839 () Bool)

(assert (=> b!1131839 (= e!644124 (contains!6504 (toList!8048 lt!502653) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131191 res!756043) b!1131838))

(assert (= (and b!1131838 res!756042) b!1131839))

(declare-fun m!1044289 () Bool)

(assert (=> d!131191 m!1044289))

(declare-fun m!1044291 () Bool)

(assert (=> d!131191 m!1044291))

(declare-fun m!1044293 () Bool)

(assert (=> d!131191 m!1044293))

(declare-fun m!1044295 () Bool)

(assert (=> d!131191 m!1044295))

(declare-fun m!1044297 () Bool)

(assert (=> b!1131838 m!1044297))

(declare-fun m!1044299 () Bool)

(assert (=> b!1131839 m!1044299))

(assert (=> b!1131493 d!131191))

(declare-fun mapIsEmpty!44524 () Bool)

(declare-fun mapRes!44524 () Bool)

(assert (=> mapIsEmpty!44524 mapRes!44524))

(declare-fun condMapEmpty!44524 () Bool)

(declare-fun mapDefault!44524 () ValueCell!13523)

(assert (=> mapNonEmpty!44515 (= condMapEmpty!44524 (= mapRest!44515 ((as const (Array (_ BitVec 32) ValueCell!13523)) mapDefault!44524)))))

(declare-fun e!644129 () Bool)

(assert (=> mapNonEmpty!44515 (= tp!84509 (and e!644129 mapRes!44524))))

(declare-fun b!1131846 () Bool)

(declare-fun e!644130 () Bool)

(assert (=> b!1131846 (= e!644130 tp_is_empty!28465)))

(declare-fun mapNonEmpty!44524 () Bool)

(declare-fun tp!84524 () Bool)

(assert (=> mapNonEmpty!44524 (= mapRes!44524 (and tp!84524 e!644130))))

(declare-fun mapRest!44524 () (Array (_ BitVec 32) ValueCell!13523))

(declare-fun mapKey!44524 () (_ BitVec 32))

(declare-fun mapValue!44524 () ValueCell!13523)

(assert (=> mapNonEmpty!44524 (= mapRest!44515 (store mapRest!44524 mapKey!44524 mapValue!44524))))

(declare-fun b!1131847 () Bool)

(assert (=> b!1131847 (= e!644129 tp_is_empty!28465)))

(assert (= (and mapNonEmpty!44515 condMapEmpty!44524) mapIsEmpty!44524))

(assert (= (and mapNonEmpty!44515 (not condMapEmpty!44524)) mapNonEmpty!44524))

(assert (= (and mapNonEmpty!44524 ((_ is ValueCellFull!13523) mapValue!44524)) b!1131846))

(assert (= (and mapNonEmpty!44515 ((_ is ValueCellFull!13523) mapDefault!44524)) b!1131847))

(declare-fun m!1044301 () Bool)

(assert (=> mapNonEmpty!44524 m!1044301))

(declare-fun b_lambda!18917 () Bool)

(assert (= b_lambda!18895 (or (and start!98228 b_free!23935) b_lambda!18917)))

(declare-fun b_lambda!18919 () Bool)

(assert (= b_lambda!18911 (or (and start!98228 b_free!23935) b_lambda!18919)))

(declare-fun b_lambda!18921 () Bool)

(assert (= b_lambda!18909 (or (and start!98228 b_free!23935) b_lambda!18921)))

(declare-fun b_lambda!18923 () Bool)

(assert (= b_lambda!18915 (or (and start!98228 b_free!23935) b_lambda!18923)))

(declare-fun b_lambda!18925 () Bool)

(assert (= b_lambda!18905 (or (and start!98228 b_free!23935) b_lambda!18925)))

(declare-fun b_lambda!18927 () Bool)

(assert (= b_lambda!18907 (or (and start!98228 b_free!23935) b_lambda!18927)))

(declare-fun b_lambda!18929 () Bool)

(assert (= b_lambda!18903 (or (and start!98228 b_free!23935) b_lambda!18929)))

(declare-fun b_lambda!18931 () Bool)

(assert (= b_lambda!18913 (or (and start!98228 b_free!23935) b_lambda!18931)))

(declare-fun b_lambda!18933 () Bool)

(assert (= b_lambda!18901 (or (and start!98228 b_free!23935) b_lambda!18933)))

(declare-fun b_lambda!18935 () Bool)

(assert (= b_lambda!18897 (or (and start!98228 b_free!23935) b_lambda!18935)))

(declare-fun b_lambda!18937 () Bool)

(assert (= b_lambda!18899 (or (and start!98228 b_free!23935) b_lambda!18937)))

(check-sat (not bm!48725) (not b!1131720) (not b!1131750) (not b_lambda!18937) (not bm!48729) (not b!1131730) (not b!1131789) (not bm!48739) (not b_lambda!18893) (not d!131163) (not b_lambda!18933) (not b!1131764) (not b_lambda!18921) (not d!131177) (not b!1131724) (not b!1131747) (not b!1131682) (not bm!48730) tp_is_empty!28465 (not b_lambda!18935) (not b_lambda!18931) (not b!1131729) (not b!1131830) (not b!1131732) (not b!1131837) (not b!1131741) (not b!1131785) (not d!131179) (not b!1131777) (not b_lambda!18927) (not b_lambda!18925) (not b!1131713) (not b!1131831) (not b!1131822) (not b!1131829) (not b_lambda!18929) (not bm!48733) (not b!1131751) (not b!1131746) (not bm!48741) (not b!1131718) (not b_lambda!18917) (not b!1131792) (not b!1131805) (not b!1131753) (not b!1131721) (not b!1131787) (not b!1131709) (not b!1131800) (not b!1131809) (not b!1131745) (not d!131185) (not b!1131812) (not b!1131710) (not d!131149) (not bm!48743) (not b!1131725) (not d!131153) (not b!1131743) (not d!131171) (not b!1131795) (not bm!48728) (not b!1131782) (not b_lambda!18919) (not d!131169) (not b!1131714) (not b!1131788) (not b!1131810) (not b!1131765) (not mapNonEmpty!44524) (not b!1131712) (not b!1131820) (not b!1131683) (not b!1131796) (not bm!48742) (not d!131191) b_and!38663 (not b_next!23935) (not b!1131807) (not d!131147) (not d!131187) (not bm!48740) (not b!1131838) (not b!1131839) (not b!1131793) (not b!1131835) (not d!131145) (not b!1131827) (not b!1131797) (not b!1131717) (not b!1131799) (not b!1131726) (not d!131165) (not b_lambda!18923) (not b!1131742) (not b!1131722) (not b!1131783) (not b!1131804) (not bm!48738) (not b!1131766) (not b!1131801) (not b!1131739) (not d!131189) (not d!131143) (not b!1131784) (not b!1131814) (not d!131157))
(check-sat b_and!38663 (not b_next!23935))
(get-model)

(declare-fun d!131193 () Bool)

(assert (=> d!131193 (isDefined!457 (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934))))

(declare-fun lt!502658 () Unit!36912)

(declare-fun choose!1785 (List!24846 (_ BitVec 64)) Unit!36912)

(assert (=> d!131193 (= lt!502658 (choose!1785 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934))))

(declare-fun e!644133 () Bool)

(assert (=> d!131193 e!644133))

(declare-fun res!756046 () Bool)

(assert (=> d!131193 (=> (not res!756046) (not e!644133))))

(declare-fun isStrictlySorted!723 (List!24846) Bool)

(assert (=> d!131193 (= res!756046 (isStrictlySorted!723 (toList!8048 (ite c!110181 lt!502440 call!48674))))))

(assert (=> d!131193 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934) lt!502658)))

(declare-fun b!1131850 () Bool)

(assert (=> b!1131850 (= e!644133 (containsKey!585 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934))))

(assert (= (and d!131193 res!756046) b!1131850))

(assert (=> d!131193 m!1044251))

(assert (=> d!131193 m!1044251))

(assert (=> d!131193 m!1044253))

(declare-fun m!1044303 () Bool)

(assert (=> d!131193 m!1044303))

(declare-fun m!1044305 () Bool)

(assert (=> d!131193 m!1044305))

(assert (=> b!1131850 m!1044247))

(assert (=> b!1131812 d!131193))

(declare-fun d!131195 () Bool)

(declare-fun isEmpty!979 (Option!681) Bool)

(assert (=> d!131195 (= (isDefined!457 (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934)) (not (isEmpty!979 (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934))))))

(declare-fun bs!32932 () Bool)

(assert (= bs!32932 d!131195))

(assert (=> bs!32932 m!1044251))

(declare-fun m!1044307 () Bool)

(assert (=> bs!32932 m!1044307))

(assert (=> b!1131812 d!131195))

(declare-fun d!131197 () Bool)

(declare-fun c!110266 () Bool)

(assert (=> d!131197 (= c!110266 (and ((_ is Cons!24842) (toList!8048 (ite c!110181 lt!502440 call!48674))) (= (_1!9059 (h!26051 (toList!8048 (ite c!110181 lt!502440 call!48674)))) k0!934)))))

(declare-fun e!644138 () Option!681)

(assert (=> d!131197 (= (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934) e!644138)))

(declare-fun b!1131860 () Bool)

(declare-fun e!644139 () Option!681)

(assert (=> b!1131860 (= e!644138 e!644139)))

(declare-fun c!110267 () Bool)

(assert (=> b!1131860 (= c!110267 (and ((_ is Cons!24842) (toList!8048 (ite c!110181 lt!502440 call!48674))) (not (= (_1!9059 (h!26051 (toList!8048 (ite c!110181 lt!502440 call!48674)))) k0!934))))))

(declare-fun b!1131862 () Bool)

(assert (=> b!1131862 (= e!644139 None!679)))

(declare-fun b!1131859 () Bool)

(assert (=> b!1131859 (= e!644138 (Some!680 (_2!9059 (h!26051 (toList!8048 (ite c!110181 lt!502440 call!48674))))))))

(declare-fun b!1131861 () Bool)

(assert (=> b!1131861 (= e!644139 (getValueByKey!630 (t!35764 (toList!8048 (ite c!110181 lt!502440 call!48674))) k0!934))))

(assert (= (and d!131197 c!110266) b!1131859))

(assert (= (and d!131197 (not c!110266)) b!1131860))

(assert (= (and b!1131860 c!110267) b!1131861))

(assert (= (and b!1131860 (not c!110267)) b!1131862))

(declare-fun m!1044309 () Bool)

(assert (=> b!1131861 m!1044309))

(assert (=> b!1131812 d!131197))

(declare-fun d!131199 () Bool)

(declare-fun get!18069 (Option!681) V!43081)

(assert (=> d!131199 (= (apply!948 lt!502571 (select (arr!35508 lt!502441) from!1455)) (get!18069 (getValueByKey!630 (toList!8048 lt!502571) (select (arr!35508 lt!502441) from!1455))))))

(declare-fun bs!32933 () Bool)

(assert (= bs!32933 d!131199))

(assert (=> bs!32933 m!1044063))

(declare-fun m!1044311 () Bool)

(assert (=> bs!32933 m!1044311))

(assert (=> bs!32933 m!1044311))

(declare-fun m!1044313 () Bool)

(assert (=> bs!32933 m!1044313))

(assert (=> b!1131710 d!131199))

(declare-fun d!131201 () Bool)

(declare-fun c!110270 () Bool)

(assert (=> d!131201 (= c!110270 ((_ is ValueCellFull!13523) (select (arr!35509 lt!502452) from!1455)))))

(declare-fun e!644142 () V!43081)

(assert (=> d!131201 (= (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644142)))

(declare-fun b!1131867 () Bool)

(declare-fun get!18070 (ValueCell!13523 V!43081) V!43081)

(assert (=> b!1131867 (= e!644142 (get!18070 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131868 () Bool)

(declare-fun get!18071 (ValueCell!13523 V!43081) V!43081)

(assert (=> b!1131868 (= e!644142 (get!18071 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131201 c!110270) b!1131867))

(assert (= (and d!131201 (not c!110270)) b!1131868))

(assert (=> b!1131867 m!1044075))

(assert (=> b!1131867 m!1043919))

(declare-fun m!1044315 () Bool)

(assert (=> b!1131867 m!1044315))

(assert (=> b!1131868 m!1044075))

(assert (=> b!1131868 m!1043919))

(declare-fun m!1044317 () Bool)

(assert (=> b!1131868 m!1044317))

(assert (=> b!1131710 d!131201))

(declare-fun d!131203 () Bool)

(declare-fun e!644144 () Bool)

(assert (=> d!131203 e!644144))

(declare-fun res!756047 () Bool)

(assert (=> d!131203 (=> res!756047 e!644144)))

(declare-fun lt!502661 () Bool)

(assert (=> d!131203 (= res!756047 (not lt!502661))))

(declare-fun lt!502659 () Bool)

(assert (=> d!131203 (= lt!502661 lt!502659)))

(declare-fun lt!502662 () Unit!36912)

(declare-fun e!644143 () Unit!36912)

(assert (=> d!131203 (= lt!502662 e!644143)))

(declare-fun c!110271 () Bool)

(assert (=> d!131203 (= c!110271 lt!502659)))

(assert (=> d!131203 (= lt!502659 (containsKey!585 (toList!8048 lt!502626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131203 (= (contains!6500 lt!502626 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502661)))

(declare-fun b!1131869 () Bool)

(declare-fun lt!502660 () Unit!36912)

(assert (=> b!1131869 (= e!644143 lt!502660)))

(assert (=> b!1131869 (= lt!502660 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1131869 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1131870 () Bool)

(declare-fun Unit!36923 () Unit!36912)

(assert (=> b!1131870 (= e!644143 Unit!36923)))

(declare-fun b!1131871 () Bool)

(assert (=> b!1131871 (= e!644144 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131203 c!110271) b!1131869))

(assert (= (and d!131203 (not c!110271)) b!1131870))

(assert (= (and d!131203 (not res!756047)) b!1131871))

(declare-fun m!1044319 () Bool)

(assert (=> d!131203 m!1044319))

(declare-fun m!1044321 () Bool)

(assert (=> b!1131869 m!1044321))

(declare-fun m!1044323 () Bool)

(assert (=> b!1131869 m!1044323))

(assert (=> b!1131869 m!1044323))

(declare-fun m!1044325 () Bool)

(assert (=> b!1131869 m!1044325))

(assert (=> b!1131871 m!1044323))

(assert (=> b!1131871 m!1044323))

(assert (=> b!1131871 m!1044325))

(assert (=> b!1131807 d!131203))

(declare-fun d!131205 () Bool)

(declare-fun c!110272 () Bool)

(assert (=> d!131205 (= c!110272 ((_ is ValueCellFull!13523) (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!644145 () V!43081)

(assert (=> d!131205 (= (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644145)))

(declare-fun b!1131872 () Bool)

(assert (=> b!1131872 (= e!644145 (get!18070 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131873 () Bool)

(assert (=> b!1131873 (= e!644145 (get!18071 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131205 c!110272) b!1131872))

(assert (= (and d!131205 (not c!110272)) b!1131873))

(assert (=> b!1131872 m!1044137))

(assert (=> b!1131872 m!1043919))

(declare-fun m!1044327 () Bool)

(assert (=> b!1131872 m!1044327))

(assert (=> b!1131873 m!1044137))

(assert (=> b!1131873 m!1043919))

(declare-fun m!1044329 () Bool)

(assert (=> b!1131873 m!1044329))

(assert (=> b!1131742 d!131205))

(declare-fun d!131207 () Bool)

(declare-fun e!644146 () Bool)

(assert (=> d!131207 e!644146))

(declare-fun res!756049 () Bool)

(assert (=> d!131207 (=> (not res!756049) (not e!644146))))

(declare-fun lt!502664 () ListLongMap!16065)

(assert (=> d!131207 (= res!756049 (contains!6500 lt!502664 (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502665 () List!24846)

(assert (=> d!131207 (= lt!502664 (ListLongMap!16066 lt!502665))))

(declare-fun lt!502663 () Unit!36912)

(declare-fun lt!502666 () Unit!36912)

(assert (=> d!131207 (= lt!502663 lt!502666)))

(assert (=> d!131207 (= (getValueByKey!630 lt!502665 (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131207 (= lt!502666 (lemmaContainsTupThenGetReturnValue!306 lt!502665 (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131207 (= lt!502665 (insertStrictlySorted!399 (toList!8048 call!48733) (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131207 (= (+!3486 call!48733 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502664)))

(declare-fun b!1131874 () Bool)

(declare-fun res!756048 () Bool)

(assert (=> b!1131874 (=> (not res!756048) (not e!644146))))

(assert (=> b!1131874 (= res!756048 (= (getValueByKey!630 (toList!8048 lt!502664) (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1131875 () Bool)

(assert (=> b!1131875 (= e!644146 (contains!6504 (toList!8048 lt!502664) (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131207 res!756049) b!1131874))

(assert (= (and b!1131874 res!756048) b!1131875))

(declare-fun m!1044331 () Bool)

(assert (=> d!131207 m!1044331))

(declare-fun m!1044333 () Bool)

(assert (=> d!131207 m!1044333))

(declare-fun m!1044335 () Bool)

(assert (=> d!131207 m!1044335))

(declare-fun m!1044337 () Bool)

(assert (=> d!131207 m!1044337))

(declare-fun m!1044339 () Bool)

(assert (=> b!1131874 m!1044339))

(declare-fun m!1044341 () Bool)

(assert (=> b!1131875 m!1044341))

(assert (=> b!1131742 d!131207))

(declare-fun d!131209 () Bool)

(assert (=> d!131209 (not (contains!6500 (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598)) lt!502594))))

(declare-fun lt!502669 () Unit!36912)

(declare-fun choose!1786 (ListLongMap!16065 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!36912)

(assert (=> d!131209 (= lt!502669 (choose!1786 lt!502596 lt!502593 lt!502598 lt!502594))))

(declare-fun e!644149 () Bool)

(assert (=> d!131209 e!644149))

(declare-fun res!756052 () Bool)

(assert (=> d!131209 (=> (not res!756052) (not e!644149))))

(assert (=> d!131209 (= res!756052 (not (contains!6500 lt!502596 lt!502594)))))

(assert (=> d!131209 (= (addStillNotContains!284 lt!502596 lt!502593 lt!502598 lt!502594) lt!502669)))

(declare-fun b!1131879 () Bool)

(assert (=> b!1131879 (= e!644149 (not (= lt!502593 lt!502594)))))

(assert (= (and d!131209 res!756052) b!1131879))

(assert (=> d!131209 m!1044135))

(assert (=> d!131209 m!1044135))

(assert (=> d!131209 m!1044139))

(declare-fun m!1044343 () Bool)

(assert (=> d!131209 m!1044343))

(declare-fun m!1044345 () Bool)

(assert (=> d!131209 m!1044345))

(assert (=> b!1131742 d!131209))

(declare-fun d!131211 () Bool)

(declare-fun e!644151 () Bool)

(assert (=> d!131211 e!644151))

(declare-fun res!756053 () Bool)

(assert (=> d!131211 (=> res!756053 e!644151)))

(declare-fun lt!502672 () Bool)

(assert (=> d!131211 (= res!756053 (not lt!502672))))

(declare-fun lt!502670 () Bool)

(assert (=> d!131211 (= lt!502672 lt!502670)))

(declare-fun lt!502673 () Unit!36912)

(declare-fun e!644150 () Unit!36912)

(assert (=> d!131211 (= lt!502673 e!644150)))

(declare-fun c!110273 () Bool)

(assert (=> d!131211 (= c!110273 lt!502670)))

(assert (=> d!131211 (= lt!502670 (containsKey!585 (toList!8048 (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598))) lt!502594))))

(assert (=> d!131211 (= (contains!6500 (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598)) lt!502594) lt!502672)))

(declare-fun b!1131880 () Bool)

(declare-fun lt!502671 () Unit!36912)

(assert (=> b!1131880 (= e!644150 lt!502671)))

(assert (=> b!1131880 (= lt!502671 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598))) lt!502594))))

(assert (=> b!1131880 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598))) lt!502594))))

(declare-fun b!1131881 () Bool)

(declare-fun Unit!36924 () Unit!36912)

(assert (=> b!1131881 (= e!644150 Unit!36924)))

(declare-fun b!1131882 () Bool)

(assert (=> b!1131882 (= e!644151 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598))) lt!502594)))))

(assert (= (and d!131211 c!110273) b!1131880))

(assert (= (and d!131211 (not c!110273)) b!1131881))

(assert (= (and d!131211 (not res!756053)) b!1131882))

(declare-fun m!1044347 () Bool)

(assert (=> d!131211 m!1044347))

(declare-fun m!1044349 () Bool)

(assert (=> b!1131880 m!1044349))

(declare-fun m!1044351 () Bool)

(assert (=> b!1131880 m!1044351))

(assert (=> b!1131880 m!1044351))

(declare-fun m!1044353 () Bool)

(assert (=> b!1131880 m!1044353))

(assert (=> b!1131882 m!1044351))

(assert (=> b!1131882 m!1044351))

(assert (=> b!1131882 m!1044353))

(assert (=> b!1131742 d!131211))

(declare-fun d!131213 () Bool)

(declare-fun e!644152 () Bool)

(assert (=> d!131213 e!644152))

(declare-fun res!756055 () Bool)

(assert (=> d!131213 (=> (not res!756055) (not e!644152))))

(declare-fun lt!502675 () ListLongMap!16065)

(assert (=> d!131213 (= res!756055 (contains!6500 lt!502675 (_1!9059 (tuple2!18097 lt!502593 lt!502598))))))

(declare-fun lt!502676 () List!24846)

(assert (=> d!131213 (= lt!502675 (ListLongMap!16066 lt!502676))))

(declare-fun lt!502674 () Unit!36912)

(declare-fun lt!502677 () Unit!36912)

(assert (=> d!131213 (= lt!502674 lt!502677)))

(assert (=> d!131213 (= (getValueByKey!630 lt!502676 (_1!9059 (tuple2!18097 lt!502593 lt!502598))) (Some!680 (_2!9059 (tuple2!18097 lt!502593 lt!502598))))))

(assert (=> d!131213 (= lt!502677 (lemmaContainsTupThenGetReturnValue!306 lt!502676 (_1!9059 (tuple2!18097 lt!502593 lt!502598)) (_2!9059 (tuple2!18097 lt!502593 lt!502598))))))

(assert (=> d!131213 (= lt!502676 (insertStrictlySorted!399 (toList!8048 lt!502596) (_1!9059 (tuple2!18097 lt!502593 lt!502598)) (_2!9059 (tuple2!18097 lt!502593 lt!502598))))))

(assert (=> d!131213 (= (+!3486 lt!502596 (tuple2!18097 lt!502593 lt!502598)) lt!502675)))

(declare-fun b!1131883 () Bool)

(declare-fun res!756054 () Bool)

(assert (=> b!1131883 (=> (not res!756054) (not e!644152))))

(assert (=> b!1131883 (= res!756054 (= (getValueByKey!630 (toList!8048 lt!502675) (_1!9059 (tuple2!18097 lt!502593 lt!502598))) (Some!680 (_2!9059 (tuple2!18097 lt!502593 lt!502598)))))))

(declare-fun b!1131884 () Bool)

(assert (=> b!1131884 (= e!644152 (contains!6504 (toList!8048 lt!502675) (tuple2!18097 lt!502593 lt!502598)))))

(assert (= (and d!131213 res!756055) b!1131883))

(assert (= (and b!1131883 res!756054) b!1131884))

(declare-fun m!1044355 () Bool)

(assert (=> d!131213 m!1044355))

(declare-fun m!1044357 () Bool)

(assert (=> d!131213 m!1044357))

(declare-fun m!1044359 () Bool)

(assert (=> d!131213 m!1044359))

(declare-fun m!1044361 () Bool)

(assert (=> d!131213 m!1044361))

(declare-fun m!1044363 () Bool)

(assert (=> b!1131883 m!1044363))

(declare-fun m!1044365 () Bool)

(assert (=> b!1131884 m!1044365))

(assert (=> b!1131742 d!131213))

(declare-fun d!131215 () Bool)

(declare-fun e!644153 () Bool)

(assert (=> d!131215 e!644153))

(declare-fun res!756057 () Bool)

(assert (=> d!131215 (=> (not res!756057) (not e!644153))))

(declare-fun lt!502679 () ListLongMap!16065)

(assert (=> d!131215 (= res!756057 (contains!6500 lt!502679 (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502680 () List!24846)

(assert (=> d!131215 (= lt!502679 (ListLongMap!16066 lt!502680))))

(declare-fun lt!502678 () Unit!36912)

(declare-fun lt!502681 () Unit!36912)

(assert (=> d!131215 (= lt!502678 lt!502681)))

(assert (=> d!131215 (= (getValueByKey!630 lt!502680 (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131215 (= lt!502681 (lemmaContainsTupThenGetReturnValue!306 lt!502680 (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131215 (= lt!502680 (insertStrictlySorted!399 (toList!8048 call!48743) (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131215 (= (+!3486 call!48743 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502679)))

(declare-fun b!1131885 () Bool)

(declare-fun res!756056 () Bool)

(assert (=> b!1131885 (=> (not res!756056) (not e!644153))))

(assert (=> b!1131885 (= res!756056 (= (getValueByKey!630 (toList!8048 lt!502679) (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1131886 () Bool)

(assert (=> b!1131886 (= e!644153 (contains!6504 (toList!8048 lt!502679) (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131215 res!756057) b!1131885))

(assert (= (and b!1131885 res!756056) b!1131886))

(declare-fun m!1044367 () Bool)

(assert (=> d!131215 m!1044367))

(declare-fun m!1044369 () Bool)

(assert (=> d!131215 m!1044369))

(declare-fun m!1044371 () Bool)

(assert (=> d!131215 m!1044371))

(declare-fun m!1044373 () Bool)

(assert (=> d!131215 m!1044373))

(declare-fun m!1044375 () Bool)

(assert (=> b!1131885 m!1044375))

(declare-fun m!1044377 () Bool)

(assert (=> b!1131886 m!1044377))

(assert (=> b!1131784 d!131215))

(declare-fun c!110274 () Bool)

(declare-fun d!131217 () Bool)

(assert (=> d!131217 (= c!110274 ((_ is ValueCellFull!13523) (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!644154 () V!43081)

(assert (=> d!131217 (= (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644154)))

(declare-fun b!1131887 () Bool)

(assert (=> b!1131887 (= e!644154 (get!18070 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1131888 () Bool)

(assert (=> b!1131888 (= e!644154 (get!18071 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131217 c!110274) b!1131887))

(assert (= (and d!131217 (not c!110274)) b!1131888))

(assert (=> b!1131887 m!1044191))

(assert (=> b!1131887 m!1043919))

(declare-fun m!1044379 () Bool)

(assert (=> b!1131887 m!1044379))

(assert (=> b!1131888 m!1044191))

(assert (=> b!1131888 m!1043919))

(declare-fun m!1044381 () Bool)

(assert (=> b!1131888 m!1044381))

(assert (=> b!1131784 d!131217))

(declare-fun d!131219 () Bool)

(assert (=> d!131219 (not (contains!6500 (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620)) lt!502616))))

(declare-fun lt!502682 () Unit!36912)

(assert (=> d!131219 (= lt!502682 (choose!1786 lt!502618 lt!502615 lt!502620 lt!502616))))

(declare-fun e!644155 () Bool)

(assert (=> d!131219 e!644155))

(declare-fun res!756058 () Bool)

(assert (=> d!131219 (=> (not res!756058) (not e!644155))))

(assert (=> d!131219 (= res!756058 (not (contains!6500 lt!502618 lt!502616)))))

(assert (=> d!131219 (= (addStillNotContains!284 lt!502618 lt!502615 lt!502620 lt!502616) lt!502682)))

(declare-fun b!1131889 () Bool)

(assert (=> b!1131889 (= e!644155 (not (= lt!502615 lt!502616)))))

(assert (= (and d!131219 res!756058) b!1131889))

(assert (=> d!131219 m!1044189))

(assert (=> d!131219 m!1044189))

(assert (=> d!131219 m!1044193))

(declare-fun m!1044383 () Bool)

(assert (=> d!131219 m!1044383))

(declare-fun m!1044385 () Bool)

(assert (=> d!131219 m!1044385))

(assert (=> b!1131784 d!131219))

(declare-fun d!131221 () Bool)

(declare-fun e!644156 () Bool)

(assert (=> d!131221 e!644156))

(declare-fun res!756060 () Bool)

(assert (=> d!131221 (=> (not res!756060) (not e!644156))))

(declare-fun lt!502684 () ListLongMap!16065)

(assert (=> d!131221 (= res!756060 (contains!6500 lt!502684 (_1!9059 (tuple2!18097 lt!502615 lt!502620))))))

(declare-fun lt!502685 () List!24846)

(assert (=> d!131221 (= lt!502684 (ListLongMap!16066 lt!502685))))

(declare-fun lt!502683 () Unit!36912)

(declare-fun lt!502686 () Unit!36912)

(assert (=> d!131221 (= lt!502683 lt!502686)))

(assert (=> d!131221 (= (getValueByKey!630 lt!502685 (_1!9059 (tuple2!18097 lt!502615 lt!502620))) (Some!680 (_2!9059 (tuple2!18097 lt!502615 lt!502620))))))

(assert (=> d!131221 (= lt!502686 (lemmaContainsTupThenGetReturnValue!306 lt!502685 (_1!9059 (tuple2!18097 lt!502615 lt!502620)) (_2!9059 (tuple2!18097 lt!502615 lt!502620))))))

(assert (=> d!131221 (= lt!502685 (insertStrictlySorted!399 (toList!8048 lt!502618) (_1!9059 (tuple2!18097 lt!502615 lt!502620)) (_2!9059 (tuple2!18097 lt!502615 lt!502620))))))

(assert (=> d!131221 (= (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620)) lt!502684)))

(declare-fun b!1131890 () Bool)

(declare-fun res!756059 () Bool)

(assert (=> b!1131890 (=> (not res!756059) (not e!644156))))

(assert (=> b!1131890 (= res!756059 (= (getValueByKey!630 (toList!8048 lt!502684) (_1!9059 (tuple2!18097 lt!502615 lt!502620))) (Some!680 (_2!9059 (tuple2!18097 lt!502615 lt!502620)))))))

(declare-fun b!1131891 () Bool)

(assert (=> b!1131891 (= e!644156 (contains!6504 (toList!8048 lt!502684) (tuple2!18097 lt!502615 lt!502620)))))

(assert (= (and d!131221 res!756060) b!1131890))

(assert (= (and b!1131890 res!756059) b!1131891))

(declare-fun m!1044387 () Bool)

(assert (=> d!131221 m!1044387))

(declare-fun m!1044389 () Bool)

(assert (=> d!131221 m!1044389))

(declare-fun m!1044391 () Bool)

(assert (=> d!131221 m!1044391))

(declare-fun m!1044393 () Bool)

(assert (=> d!131221 m!1044393))

(declare-fun m!1044395 () Bool)

(assert (=> b!1131890 m!1044395))

(declare-fun m!1044397 () Bool)

(assert (=> b!1131891 m!1044397))

(assert (=> b!1131784 d!131221))

(declare-fun d!131223 () Bool)

(declare-fun e!644158 () Bool)

(assert (=> d!131223 e!644158))

(declare-fun res!756061 () Bool)

(assert (=> d!131223 (=> res!756061 e!644158)))

(declare-fun lt!502689 () Bool)

(assert (=> d!131223 (= res!756061 (not lt!502689))))

(declare-fun lt!502687 () Bool)

(assert (=> d!131223 (= lt!502689 lt!502687)))

(declare-fun lt!502690 () Unit!36912)

(declare-fun e!644157 () Unit!36912)

(assert (=> d!131223 (= lt!502690 e!644157)))

(declare-fun c!110275 () Bool)

(assert (=> d!131223 (= c!110275 lt!502687)))

(assert (=> d!131223 (= lt!502687 (containsKey!585 (toList!8048 (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620))) lt!502616))))

(assert (=> d!131223 (= (contains!6500 (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620)) lt!502616) lt!502689)))

(declare-fun b!1131892 () Bool)

(declare-fun lt!502688 () Unit!36912)

(assert (=> b!1131892 (= e!644157 lt!502688)))

(assert (=> b!1131892 (= lt!502688 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620))) lt!502616))))

(assert (=> b!1131892 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620))) lt!502616))))

(declare-fun b!1131893 () Bool)

(declare-fun Unit!36925 () Unit!36912)

(assert (=> b!1131893 (= e!644157 Unit!36925)))

(declare-fun b!1131894 () Bool)

(assert (=> b!1131894 (= e!644158 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502618 (tuple2!18097 lt!502615 lt!502620))) lt!502616)))))

(assert (= (and d!131223 c!110275) b!1131892))

(assert (= (and d!131223 (not c!110275)) b!1131893))

(assert (= (and d!131223 (not res!756061)) b!1131894))

(declare-fun m!1044399 () Bool)

(assert (=> d!131223 m!1044399))

(declare-fun m!1044401 () Bool)

(assert (=> b!1131892 m!1044401))

(declare-fun m!1044403 () Bool)

(assert (=> b!1131892 m!1044403))

(assert (=> b!1131892 m!1044403))

(declare-fun m!1044405 () Bool)

(assert (=> b!1131892 m!1044405))

(assert (=> b!1131894 m!1044403))

(assert (=> b!1131894 m!1044403))

(assert (=> b!1131894 m!1044405))

(assert (=> b!1131784 d!131223))

(declare-fun d!131225 () Bool)

(declare-fun e!644160 () Bool)

(assert (=> d!131225 e!644160))

(declare-fun res!756062 () Bool)

(assert (=> d!131225 (=> res!756062 e!644160)))

(declare-fun lt!502693 () Bool)

(assert (=> d!131225 (= res!756062 (not lt!502693))))

(declare-fun lt!502691 () Bool)

(assert (=> d!131225 (= lt!502693 lt!502691)))

(declare-fun lt!502694 () Unit!36912)

(declare-fun e!644159 () Unit!36912)

(assert (=> d!131225 (= lt!502694 e!644159)))

(declare-fun c!110276 () Bool)

(assert (=> d!131225 (= c!110276 lt!502691)))

(assert (=> d!131225 (= lt!502691 (containsKey!585 (toList!8048 lt!502578) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131225 (= (contains!6500 lt!502578 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502693)))

(declare-fun b!1131895 () Bool)

(declare-fun lt!502692 () Unit!36912)

(assert (=> b!1131895 (= e!644159 lt!502692)))

(assert (=> b!1131895 (= lt!502692 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502578) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1131895 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502578) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1131896 () Bool)

(declare-fun Unit!36926 () Unit!36912)

(assert (=> b!1131896 (= e!644159 Unit!36926)))

(declare-fun b!1131897 () Bool)

(assert (=> b!1131897 (= e!644160 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131225 c!110276) b!1131895))

(assert (= (and d!131225 (not c!110276)) b!1131896))

(assert (= (and d!131225 (not res!756062)) b!1131897))

(declare-fun m!1044407 () Bool)

(assert (=> d!131225 m!1044407))

(declare-fun m!1044409 () Bool)

(assert (=> b!1131895 m!1044409))

(declare-fun m!1044411 () Bool)

(assert (=> b!1131895 m!1044411))

(assert (=> b!1131895 m!1044411))

(declare-fun m!1044413 () Bool)

(assert (=> b!1131895 m!1044413))

(assert (=> b!1131897 m!1044411))

(assert (=> b!1131897 m!1044411))

(assert (=> b!1131897 m!1044413))

(assert (=> b!1131732 d!131225))

(declare-fun d!131227 () Bool)

(declare-fun e!644162 () Bool)

(assert (=> d!131227 e!644162))

(declare-fun res!756063 () Bool)

(assert (=> d!131227 (=> res!756063 e!644162)))

(declare-fun lt!502697 () Bool)

(assert (=> d!131227 (= res!756063 (not lt!502697))))

(declare-fun lt!502695 () Bool)

(assert (=> d!131227 (= lt!502697 lt!502695)))

(declare-fun lt!502698 () Unit!36912)

(declare-fun e!644161 () Unit!36912)

(assert (=> d!131227 (= lt!502698 e!644161)))

(declare-fun c!110277 () Bool)

(assert (=> d!131227 (= c!110277 lt!502695)))

(assert (=> d!131227 (= lt!502695 (containsKey!585 (toList!8048 lt!502633) k0!934))))

(assert (=> d!131227 (= (contains!6500 lt!502633 k0!934) lt!502697)))

(declare-fun b!1131898 () Bool)

(declare-fun lt!502696 () Unit!36912)

(assert (=> b!1131898 (= e!644161 lt!502696)))

(assert (=> b!1131898 (= lt!502696 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502633) k0!934))))

(assert (=> b!1131898 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502633) k0!934))))

(declare-fun b!1131899 () Bool)

(declare-fun Unit!36927 () Unit!36912)

(assert (=> b!1131899 (= e!644161 Unit!36927)))

(declare-fun b!1131900 () Bool)

(assert (=> b!1131900 (= e!644162 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502633) k0!934)))))

(assert (= (and d!131227 c!110277) b!1131898))

(assert (= (and d!131227 (not c!110277)) b!1131899))

(assert (= (and d!131227 (not res!756063)) b!1131900))

(declare-fun m!1044415 () Bool)

(assert (=> d!131227 m!1044415))

(declare-fun m!1044417 () Bool)

(assert (=> b!1131898 m!1044417))

(declare-fun m!1044419 () Bool)

(assert (=> b!1131898 m!1044419))

(assert (=> b!1131898 m!1044419))

(declare-fun m!1044421 () Bool)

(assert (=> b!1131898 m!1044421))

(assert (=> b!1131900 m!1044419))

(assert (=> b!1131900 m!1044419))

(assert (=> b!1131900 m!1044421))

(assert (=> d!131169 d!131227))

(declare-fun b!1131911 () Bool)

(declare-fun e!644170 () List!24846)

(declare-fun e!644171 () List!24846)

(assert (=> b!1131911 (= e!644170 e!644171)))

(declare-fun c!110282 () Bool)

(assert (=> b!1131911 (= c!110282 (and ((_ is Cons!24842) (toList!8048 call!48672)) (not (= (_1!9059 (h!26051 (toList!8048 call!48672))) k0!934))))))

(declare-fun b!1131912 () Bool)

(declare-fun e!644169 () Bool)

(declare-fun lt!502701 () List!24846)

(assert (=> b!1131912 (= e!644169 (not (containsKey!585 lt!502701 k0!934)))))

(declare-fun d!131229 () Bool)

(assert (=> d!131229 e!644169))

(declare-fun res!756066 () Bool)

(assert (=> d!131229 (=> (not res!756066) (not e!644169))))

(assert (=> d!131229 (= res!756066 (isStrictlySorted!723 lt!502701))))

(assert (=> d!131229 (= lt!502701 e!644170)))

(declare-fun c!110283 () Bool)

(assert (=> d!131229 (= c!110283 (and ((_ is Cons!24842) (toList!8048 call!48672)) (= (_1!9059 (h!26051 (toList!8048 call!48672))) k0!934)))))

(assert (=> d!131229 (isStrictlySorted!723 (toList!8048 call!48672))))

(assert (=> d!131229 (= (removeStrictlySorted!89 (toList!8048 call!48672) k0!934) lt!502701)))

(declare-fun b!1131913 () Bool)

(assert (=> b!1131913 (= e!644170 (t!35764 (toList!8048 call!48672)))))

(declare-fun b!1131914 () Bool)

(assert (=> b!1131914 (= e!644171 Nil!24843)))

(declare-fun b!1131915 () Bool)

(declare-fun $colon$colon!610 (List!24846 tuple2!18096) List!24846)

(assert (=> b!1131915 (= e!644171 ($colon$colon!610 (removeStrictlySorted!89 (t!35764 (toList!8048 call!48672)) k0!934) (h!26051 (toList!8048 call!48672))))))

(assert (= (and d!131229 c!110283) b!1131913))

(assert (= (and d!131229 (not c!110283)) b!1131911))

(assert (= (and b!1131911 c!110282) b!1131915))

(assert (= (and b!1131911 (not c!110282)) b!1131914))

(assert (= (and d!131229 res!756066) b!1131912))

(declare-fun m!1044423 () Bool)

(assert (=> b!1131912 m!1044423))

(declare-fun m!1044425 () Bool)

(assert (=> d!131229 m!1044425))

(declare-fun m!1044427 () Bool)

(assert (=> d!131229 m!1044427))

(declare-fun m!1044429 () Bool)

(assert (=> b!1131915 m!1044429))

(assert (=> b!1131915 m!1044429))

(declare-fun m!1044431 () Bool)

(assert (=> b!1131915 m!1044431))

(assert (=> d!131169 d!131229))

(declare-fun d!131231 () Bool)

(declare-fun e!644172 () Bool)

(assert (=> d!131231 e!644172))

(declare-fun res!756068 () Bool)

(assert (=> d!131231 (=> (not res!756068) (not e!644172))))

(declare-fun lt!502703 () ListLongMap!16065)

(assert (=> d!131231 (= res!756068 (contains!6500 lt!502703 (_1!9059 (tuple2!18097 lt!502567 lt!502572))))))

(declare-fun lt!502704 () List!24846)

(assert (=> d!131231 (= lt!502703 (ListLongMap!16066 lt!502704))))

(declare-fun lt!502702 () Unit!36912)

(declare-fun lt!502705 () Unit!36912)

(assert (=> d!131231 (= lt!502702 lt!502705)))

(assert (=> d!131231 (= (getValueByKey!630 lt!502704 (_1!9059 (tuple2!18097 lt!502567 lt!502572))) (Some!680 (_2!9059 (tuple2!18097 lt!502567 lt!502572))))))

(assert (=> d!131231 (= lt!502705 (lemmaContainsTupThenGetReturnValue!306 lt!502704 (_1!9059 (tuple2!18097 lt!502567 lt!502572)) (_2!9059 (tuple2!18097 lt!502567 lt!502572))))))

(assert (=> d!131231 (= lt!502704 (insertStrictlySorted!399 (toList!8048 lt!502570) (_1!9059 (tuple2!18097 lt!502567 lt!502572)) (_2!9059 (tuple2!18097 lt!502567 lt!502572))))))

(assert (=> d!131231 (= (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572)) lt!502703)))

(declare-fun b!1131916 () Bool)

(declare-fun res!756067 () Bool)

(assert (=> b!1131916 (=> (not res!756067) (not e!644172))))

(assert (=> b!1131916 (= res!756067 (= (getValueByKey!630 (toList!8048 lt!502703) (_1!9059 (tuple2!18097 lt!502567 lt!502572))) (Some!680 (_2!9059 (tuple2!18097 lt!502567 lt!502572)))))))

(declare-fun b!1131917 () Bool)

(assert (=> b!1131917 (= e!644172 (contains!6504 (toList!8048 lt!502703) (tuple2!18097 lt!502567 lt!502572)))))

(assert (= (and d!131231 res!756068) b!1131916))

(assert (= (and b!1131916 res!756067) b!1131917))

(declare-fun m!1044433 () Bool)

(assert (=> d!131231 m!1044433))

(declare-fun m!1044435 () Bool)

(assert (=> d!131231 m!1044435))

(declare-fun m!1044437 () Bool)

(assert (=> d!131231 m!1044437))

(declare-fun m!1044439 () Bool)

(assert (=> d!131231 m!1044439))

(declare-fun m!1044441 () Bool)

(assert (=> b!1131916 m!1044441))

(declare-fun m!1044443 () Bool)

(assert (=> b!1131917 m!1044443))

(assert (=> b!1131709 d!131231))

(declare-fun d!131233 () Bool)

(assert (=> d!131233 (not (contains!6500 (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572)) lt!502568))))

(declare-fun lt!502706 () Unit!36912)

(assert (=> d!131233 (= lt!502706 (choose!1786 lt!502570 lt!502567 lt!502572 lt!502568))))

(declare-fun e!644173 () Bool)

(assert (=> d!131233 e!644173))

(declare-fun res!756069 () Bool)

(assert (=> d!131233 (=> (not res!756069) (not e!644173))))

(assert (=> d!131233 (= res!756069 (not (contains!6500 lt!502570 lt!502568)))))

(assert (=> d!131233 (= (addStillNotContains!284 lt!502570 lt!502567 lt!502572 lt!502568) lt!502706)))

(declare-fun b!1131918 () Bool)

(assert (=> b!1131918 (= e!644173 (not (= lt!502567 lt!502568)))))

(assert (= (and d!131233 res!756069) b!1131918))

(assert (=> d!131233 m!1044073))

(assert (=> d!131233 m!1044073))

(assert (=> d!131233 m!1044077))

(declare-fun m!1044445 () Bool)

(assert (=> d!131233 m!1044445))

(declare-fun m!1044447 () Bool)

(assert (=> d!131233 m!1044447))

(assert (=> b!1131709 d!131233))

(declare-fun d!131235 () Bool)

(declare-fun e!644174 () Bool)

(assert (=> d!131235 e!644174))

(declare-fun res!756071 () Bool)

(assert (=> d!131235 (=> (not res!756071) (not e!644174))))

(declare-fun lt!502708 () ListLongMap!16065)

(assert (=> d!131235 (= res!756071 (contains!6500 lt!502708 (_1!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502709 () List!24846)

(assert (=> d!131235 (= lt!502708 (ListLongMap!16066 lt!502709))))

(declare-fun lt!502707 () Unit!36912)

(declare-fun lt!502710 () Unit!36912)

(assert (=> d!131235 (= lt!502707 lt!502710)))

(assert (=> d!131235 (= (getValueByKey!630 lt!502709 (_1!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131235 (= lt!502710 (lemmaContainsTupThenGetReturnValue!306 lt!502709 (_1!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131235 (= lt!502709 (insertStrictlySorted!399 (toList!8048 call!48731) (_1!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131235 (= (+!3486 call!48731 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502708)))

(declare-fun b!1131919 () Bool)

(declare-fun res!756070 () Bool)

(assert (=> b!1131919 (=> (not res!756070) (not e!644174))))

(assert (=> b!1131919 (= res!756070 (= (getValueByKey!630 (toList!8048 lt!502708) (_1!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1131920 () Bool)

(assert (=> b!1131920 (= e!644174 (contains!6504 (toList!8048 lt!502708) (tuple2!18097 (select (arr!35508 lt!502441) from!1455) (get!18068 (select (arr!35509 lt!502452) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131235 res!756071) b!1131919))

(assert (= (and b!1131919 res!756070) b!1131920))

(declare-fun m!1044449 () Bool)

(assert (=> d!131235 m!1044449))

(declare-fun m!1044451 () Bool)

(assert (=> d!131235 m!1044451))

(declare-fun m!1044453 () Bool)

(assert (=> d!131235 m!1044453))

(declare-fun m!1044455 () Bool)

(assert (=> d!131235 m!1044455))

(declare-fun m!1044457 () Bool)

(assert (=> b!1131919 m!1044457))

(declare-fun m!1044459 () Bool)

(assert (=> b!1131920 m!1044459))

(assert (=> b!1131709 d!131235))

(declare-fun d!131237 () Bool)

(declare-fun e!644176 () Bool)

(assert (=> d!131237 e!644176))

(declare-fun res!756072 () Bool)

(assert (=> d!131237 (=> res!756072 e!644176)))

(declare-fun lt!502713 () Bool)

(assert (=> d!131237 (= res!756072 (not lt!502713))))

(declare-fun lt!502711 () Bool)

(assert (=> d!131237 (= lt!502713 lt!502711)))

(declare-fun lt!502714 () Unit!36912)

(declare-fun e!644175 () Unit!36912)

(assert (=> d!131237 (= lt!502714 e!644175)))

(declare-fun c!110284 () Bool)

(assert (=> d!131237 (= c!110284 lt!502711)))

(assert (=> d!131237 (= lt!502711 (containsKey!585 (toList!8048 (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572))) lt!502568))))

(assert (=> d!131237 (= (contains!6500 (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572)) lt!502568) lt!502713)))

(declare-fun b!1131921 () Bool)

(declare-fun lt!502712 () Unit!36912)

(assert (=> b!1131921 (= e!644175 lt!502712)))

(assert (=> b!1131921 (= lt!502712 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572))) lt!502568))))

(assert (=> b!1131921 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572))) lt!502568))))

(declare-fun b!1131922 () Bool)

(declare-fun Unit!36928 () Unit!36912)

(assert (=> b!1131922 (= e!644175 Unit!36928)))

(declare-fun b!1131923 () Bool)

(assert (=> b!1131923 (= e!644176 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502570 (tuple2!18097 lt!502567 lt!502572))) lt!502568)))))

(assert (= (and d!131237 c!110284) b!1131921))

(assert (= (and d!131237 (not c!110284)) b!1131922))

(assert (= (and d!131237 (not res!756072)) b!1131923))

(declare-fun m!1044461 () Bool)

(assert (=> d!131237 m!1044461))

(declare-fun m!1044463 () Bool)

(assert (=> b!1131921 m!1044463))

(declare-fun m!1044465 () Bool)

(assert (=> b!1131921 m!1044465))

(assert (=> b!1131921 m!1044465))

(declare-fun m!1044467 () Bool)

(assert (=> b!1131921 m!1044467))

(assert (=> b!1131923 m!1044465))

(assert (=> b!1131923 m!1044465))

(assert (=> b!1131923 m!1044467))

(assert (=> b!1131709 d!131237))

(assert (=> b!1131709 d!131201))

(declare-fun d!131239 () Bool)

(declare-fun e!644178 () Bool)

(assert (=> d!131239 e!644178))

(declare-fun res!756073 () Bool)

(assert (=> d!131239 (=> res!756073 e!644178)))

(declare-fun lt!502717 () Bool)

(assert (=> d!131239 (= res!756073 (not lt!502717))))

(declare-fun lt!502715 () Bool)

(assert (=> d!131239 (= lt!502717 lt!502715)))

(declare-fun lt!502718 () Unit!36912)

(declare-fun e!644177 () Unit!36912)

(assert (=> d!131239 (= lt!502718 e!644177)))

(declare-fun c!110285 () Bool)

(assert (=> d!131239 (= c!110285 lt!502715)))

(assert (=> d!131239 (= lt!502715 (containsKey!585 (toList!8048 lt!502571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131239 (= (contains!6500 lt!502571 #b0000000000000000000000000000000000000000000000000000000000000000) lt!502717)))

(declare-fun b!1131924 () Bool)

(declare-fun lt!502716 () Unit!36912)

(assert (=> b!1131924 (= e!644177 lt!502716)))

(assert (=> b!1131924 (= lt!502716 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1131924 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1131925 () Bool)

(declare-fun Unit!36929 () Unit!36912)

(assert (=> b!1131925 (= e!644177 Unit!36929)))

(declare-fun b!1131926 () Bool)

(assert (=> b!1131926 (= e!644178 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131239 c!110285) b!1131924))

(assert (= (and d!131239 (not c!110285)) b!1131925))

(assert (= (and d!131239 (not res!756073)) b!1131926))

(declare-fun m!1044469 () Bool)

(assert (=> d!131239 m!1044469))

(declare-fun m!1044471 () Bool)

(assert (=> b!1131924 m!1044471))

(declare-fun m!1044473 () Bool)

(assert (=> b!1131924 m!1044473))

(assert (=> b!1131924 m!1044473))

(declare-fun m!1044475 () Bool)

(assert (=> b!1131924 m!1044475))

(assert (=> b!1131926 m!1044473))

(assert (=> b!1131926 m!1044473))

(assert (=> b!1131926 m!1044475))

(assert (=> d!131143 d!131239))

(assert (=> d!131143 d!131183))

(declare-fun d!131241 () Bool)

(declare-fun isEmpty!980 (List!24846) Bool)

(assert (=> d!131241 (= (isEmpty!978 lt!502626) (isEmpty!980 (toList!8048 lt!502626)))))

(declare-fun bs!32934 () Bool)

(assert (= bs!32934 d!131241))

(declare-fun m!1044477 () Bool)

(assert (=> bs!32934 m!1044477))

(assert (=> b!1131805 d!131241))

(declare-fun d!131243 () Bool)

(assert (=> d!131243 (= (isEmpty!978 lt!502578) (isEmpty!980 (toList!8048 lt!502578)))))

(declare-fun bs!32935 () Bool)

(assert (= bs!32935 d!131243))

(declare-fun m!1044479 () Bool)

(assert (=> bs!32935 m!1044479))

(assert (=> b!1131730 d!131243))

(declare-fun d!131245 () Bool)

(declare-fun lt!502721 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!538 (List!24845) (InoxSet (_ BitVec 64)))

(assert (=> d!131245 (= lt!502721 (select (content!538 Nil!24842) (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(declare-fun e!644184 () Bool)

(assert (=> d!131245 (= lt!502721 e!644184)))

(declare-fun res!756079 () Bool)

(assert (=> d!131245 (=> (not res!756079) (not e!644184))))

(assert (=> d!131245 (= res!756079 ((_ is Cons!24841) Nil!24842))))

(assert (=> d!131245 (= (contains!6503 Nil!24842 (select (arr!35508 lt!502441) #b00000000000000000000000000000000)) lt!502721)))

(declare-fun b!1131931 () Bool)

(declare-fun e!644183 () Bool)

(assert (=> b!1131931 (= e!644184 e!644183)))

(declare-fun res!756078 () Bool)

(assert (=> b!1131931 (=> res!756078 e!644183)))

(assert (=> b!1131931 (= res!756078 (= (h!26050 Nil!24842) (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(declare-fun b!1131932 () Bool)

(assert (=> b!1131932 (= e!644183 (contains!6503 (t!35763 Nil!24842) (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(assert (= (and d!131245 res!756079) b!1131931))

(assert (= (and b!1131931 (not res!756078)) b!1131932))

(declare-fun m!1044481 () Bool)

(assert (=> d!131245 m!1044481))

(assert (=> d!131245 m!1044051))

(declare-fun m!1044483 () Bool)

(assert (=> d!131245 m!1044483))

(assert (=> b!1131932 m!1044051))

(declare-fun m!1044485 () Bool)

(assert (=> b!1131932 m!1044485))

(assert (=> b!1131830 d!131245))

(declare-fun d!131247 () Bool)

(assert (=> d!131247 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502448) k0!934))))

(declare-fun lt!502722 () Unit!36912)

(assert (=> d!131247 (= lt!502722 (choose!1785 (toList!8048 lt!502448) k0!934))))

(declare-fun e!644185 () Bool)

(assert (=> d!131247 e!644185))

(declare-fun res!756080 () Bool)

(assert (=> d!131247 (=> (not res!756080) (not e!644185))))

(assert (=> d!131247 (= res!756080 (isStrictlySorted!723 (toList!8048 lt!502448)))))

(assert (=> d!131247 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502448) k0!934) lt!502722)))

(declare-fun b!1131933 () Bool)

(assert (=> b!1131933 (= e!644185 (containsKey!585 (toList!8048 lt!502448) k0!934))))

(assert (= (and d!131247 res!756080) b!1131933))

(assert (=> d!131247 m!1044121))

(assert (=> d!131247 m!1044121))

(assert (=> d!131247 m!1044123))

(declare-fun m!1044487 () Bool)

(assert (=> d!131247 m!1044487))

(declare-fun m!1044489 () Bool)

(assert (=> d!131247 m!1044489))

(assert (=> b!1131933 m!1044117))

(assert (=> b!1131739 d!131247))

(declare-fun d!131249 () Bool)

(assert (=> d!131249 (= (isDefined!457 (getValueByKey!630 (toList!8048 lt!502448) k0!934)) (not (isEmpty!979 (getValueByKey!630 (toList!8048 lt!502448) k0!934))))))

(declare-fun bs!32936 () Bool)

(assert (= bs!32936 d!131249))

(assert (=> bs!32936 m!1044121))

(declare-fun m!1044491 () Bool)

(assert (=> bs!32936 m!1044491))

(assert (=> b!1131739 d!131249))

(declare-fun d!131251 () Bool)

(declare-fun c!110286 () Bool)

(assert (=> d!131251 (= c!110286 (and ((_ is Cons!24842) (toList!8048 lt!502448)) (= (_1!9059 (h!26051 (toList!8048 lt!502448))) k0!934)))))

(declare-fun e!644186 () Option!681)

(assert (=> d!131251 (= (getValueByKey!630 (toList!8048 lt!502448) k0!934) e!644186)))

(declare-fun b!1131935 () Bool)

(declare-fun e!644187 () Option!681)

(assert (=> b!1131935 (= e!644186 e!644187)))

(declare-fun c!110287 () Bool)

(assert (=> b!1131935 (= c!110287 (and ((_ is Cons!24842) (toList!8048 lt!502448)) (not (= (_1!9059 (h!26051 (toList!8048 lt!502448))) k0!934))))))

(declare-fun b!1131937 () Bool)

(assert (=> b!1131937 (= e!644187 None!679)))

(declare-fun b!1131934 () Bool)

(assert (=> b!1131934 (= e!644186 (Some!680 (_2!9059 (h!26051 (toList!8048 lt!502448)))))))

(declare-fun b!1131936 () Bool)

(assert (=> b!1131936 (= e!644187 (getValueByKey!630 (t!35764 (toList!8048 lt!502448)) k0!934))))

(assert (= (and d!131251 c!110286) b!1131934))

(assert (= (and d!131251 (not c!110286)) b!1131935))

(assert (= (and b!1131935 c!110287) b!1131936))

(assert (= (and b!1131935 (not c!110287)) b!1131937))

(declare-fun m!1044493 () Bool)

(assert (=> b!1131936 m!1044493))

(assert (=> b!1131739 d!131251))

(declare-fun d!131253 () Bool)

(declare-fun e!644189 () Bool)

(assert (=> d!131253 e!644189))

(declare-fun res!756081 () Bool)

(assert (=> d!131253 (=> res!756081 e!644189)))

(declare-fun lt!502725 () Bool)

(assert (=> d!131253 (= res!756081 (not lt!502725))))

(declare-fun lt!502723 () Bool)

(assert (=> d!131253 (= lt!502725 lt!502723)))

(declare-fun lt!502726 () Unit!36912)

(declare-fun e!644188 () Unit!36912)

(assert (=> d!131253 (= lt!502726 e!644188)))

(declare-fun c!110288 () Bool)

(assert (=> d!131253 (= c!110288 lt!502723)))

(assert (=> d!131253 (= lt!502723 (containsKey!585 (toList!8048 lt!502578) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131253 (= (contains!6500 lt!502578 #b0000000000000000000000000000000000000000000000000000000000000000) lt!502725)))

(declare-fun b!1131938 () Bool)

(declare-fun lt!502724 () Unit!36912)

(assert (=> b!1131938 (= e!644188 lt!502724)))

(assert (=> b!1131938 (= lt!502724 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502578) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1131938 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502578) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1131939 () Bool)

(declare-fun Unit!36930 () Unit!36912)

(assert (=> b!1131939 (= e!644188 Unit!36930)))

(declare-fun b!1131940 () Bool)

(assert (=> b!1131940 (= e!644189 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502578) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131253 c!110288) b!1131938))

(assert (= (and d!131253 (not c!110288)) b!1131939))

(assert (= (and d!131253 (not res!756081)) b!1131940))

(declare-fun m!1044495 () Bool)

(assert (=> d!131253 m!1044495))

(declare-fun m!1044497 () Bool)

(assert (=> b!1131938 m!1044497))

(declare-fun m!1044499 () Bool)

(assert (=> b!1131938 m!1044499))

(assert (=> b!1131938 m!1044499))

(declare-fun m!1044501 () Bool)

(assert (=> b!1131938 m!1044501))

(assert (=> b!1131940 m!1044499))

(assert (=> b!1131940 m!1044499))

(assert (=> b!1131940 m!1044501))

(assert (=> d!131145 d!131253))

(assert (=> d!131145 d!131183))

(declare-fun b!1131941 () Bool)

(declare-fun lt!502727 () Unit!36912)

(declare-fun lt!502730 () Unit!36912)

(assert (=> b!1131941 (= lt!502727 lt!502730)))

(declare-fun lt!502728 () (_ BitVec 64))

(declare-fun lt!502733 () V!43081)

(declare-fun lt!502729 () (_ BitVec 64))

(declare-fun lt!502731 () ListLongMap!16065)

(assert (=> b!1131941 (not (contains!6500 (+!3486 lt!502731 (tuple2!18097 lt!502728 lt!502733)) lt!502729))))

(assert (=> b!1131941 (= lt!502730 (addStillNotContains!284 lt!502731 lt!502728 lt!502733 lt!502729))))

(assert (=> b!1131941 (= lt!502729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131941 (= lt!502733 (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131941 (= lt!502728 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!48747 () ListLongMap!16065)

(assert (=> b!1131941 (= lt!502731 call!48747)))

(declare-fun e!644192 () ListLongMap!16065)

(assert (=> b!1131941 (= e!644192 (+!3486 call!48747 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48744 () Bool)

(assert (=> bm!48744 (= call!48747 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131942 () Bool)

(assert (=> b!1131942 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(assert (=> b!1131942 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36047 _values!996)))))

(declare-fun lt!502732 () ListLongMap!16065)

(declare-fun e!644194 () Bool)

(assert (=> b!1131942 (= e!644194 (= (apply!948 lt!502732 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18068 (select (arr!35509 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131255 () Bool)

(declare-fun e!644193 () Bool)

(assert (=> d!131255 e!644193))

(declare-fun res!756082 () Bool)

(assert (=> d!131255 (=> (not res!756082) (not e!644193))))

(assert (=> d!131255 (= res!756082 (not (contains!6500 lt!502732 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644191 () ListLongMap!16065)

(assert (=> d!131255 (= lt!502732 e!644191)))

(declare-fun c!110290 () Bool)

(assert (=> d!131255 (= c!110290 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(assert (=> d!131255 (validMask!0 mask!1564)))

(assert (=> d!131255 (= (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502732)))

(declare-fun b!1131943 () Bool)

(declare-fun e!644190 () Bool)

(declare-fun e!644196 () Bool)

(assert (=> b!1131943 (= e!644190 e!644196)))

(declare-fun c!110291 () Bool)

(assert (=> b!1131943 (= c!110291 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1131944 () Bool)

(assert (=> b!1131944 (= e!644190 e!644194)))

(assert (=> b!1131944 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun res!756085 () Bool)

(assert (=> b!1131944 (= res!756085 (contains!6500 lt!502732 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131944 (=> (not res!756085) (not e!644194))))

(declare-fun b!1131945 () Bool)

(assert (=> b!1131945 (= e!644191 e!644192)))

(declare-fun c!110289 () Bool)

(assert (=> b!1131945 (= c!110289 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1131946 () Bool)

(assert (=> b!1131946 (= e!644196 (= lt!502732 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131947 () Bool)

(assert (=> b!1131947 (= e!644191 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131948 () Bool)

(assert (=> b!1131948 (= e!644193 e!644190)))

(declare-fun c!110292 () Bool)

(declare-fun e!644195 () Bool)

(assert (=> b!1131948 (= c!110292 e!644195)))

(declare-fun res!756084 () Bool)

(assert (=> b!1131948 (=> (not res!756084) (not e!644195))))

(assert (=> b!1131948 (= res!756084 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1131949 () Bool)

(assert (=> b!1131949 (= e!644195 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131949 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1131950 () Bool)

(assert (=> b!1131950 (= e!644196 (isEmpty!978 lt!502732))))

(declare-fun b!1131951 () Bool)

(assert (=> b!1131951 (= e!644192 call!48747)))

(declare-fun b!1131952 () Bool)

(declare-fun res!756083 () Bool)

(assert (=> b!1131952 (=> (not res!756083) (not e!644193))))

(assert (=> b!1131952 (= res!756083 (not (contains!6500 lt!502732 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131255 c!110290) b!1131947))

(assert (= (and d!131255 (not c!110290)) b!1131945))

(assert (= (and b!1131945 c!110289) b!1131941))

(assert (= (and b!1131945 (not c!110289)) b!1131951))

(assert (= (or b!1131941 b!1131951) bm!48744))

(assert (= (and d!131255 res!756082) b!1131952))

(assert (= (and b!1131952 res!756083) b!1131948))

(assert (= (and b!1131948 res!756084) b!1131949))

(assert (= (and b!1131948 c!110292) b!1131944))

(assert (= (and b!1131948 (not c!110292)) b!1131943))

(assert (= (and b!1131944 res!756085) b!1131942))

(assert (= (and b!1131943 c!110291) b!1131946))

(assert (= (and b!1131943 (not c!110291)) b!1131950))

(declare-fun b_lambda!18939 () Bool)

(assert (=> (not b_lambda!18939) (not b!1131941)))

(assert (=> b!1131941 t!35762))

(declare-fun b_and!38665 () Bool)

(assert (= b_and!38663 (and (=> t!35762 result!18047) b_and!38665)))

(declare-fun b_lambda!18941 () Bool)

(assert (=> (not b_lambda!18941) (not b!1131942)))

(assert (=> b!1131942 t!35762))

(declare-fun b_and!38667 () Bool)

(assert (= b_and!38665 (and (=> t!35762 result!18047) b_and!38667)))

(declare-fun m!1044503 () Bool)

(assert (=> b!1131944 m!1044503))

(assert (=> b!1131944 m!1044503))

(declare-fun m!1044505 () Bool)

(assert (=> b!1131944 m!1044505))

(declare-fun m!1044507 () Bool)

(assert (=> bm!48744 m!1044507))

(assert (=> b!1131941 m!1043919))

(declare-fun m!1044509 () Bool)

(assert (=> b!1131941 m!1044509))

(assert (=> b!1131941 m!1044503))

(declare-fun m!1044511 () Bool)

(assert (=> b!1131941 m!1044511))

(declare-fun m!1044513 () Bool)

(assert (=> b!1131941 m!1044513))

(declare-fun m!1044515 () Bool)

(assert (=> b!1131941 m!1044515))

(assert (=> b!1131941 m!1044513))

(declare-fun m!1044517 () Bool)

(assert (=> b!1131941 m!1044517))

(assert (=> b!1131941 m!1044515))

(assert (=> b!1131941 m!1043919))

(declare-fun m!1044519 () Bool)

(assert (=> b!1131941 m!1044519))

(assert (=> b!1131949 m!1044503))

(assert (=> b!1131949 m!1044503))

(declare-fun m!1044521 () Bool)

(assert (=> b!1131949 m!1044521))

(declare-fun m!1044523 () Bool)

(assert (=> b!1131952 m!1044523))

(declare-fun m!1044525 () Bool)

(assert (=> d!131255 m!1044525))

(assert (=> d!131255 m!1043893))

(declare-fun m!1044527 () Bool)

(assert (=> b!1131950 m!1044527))

(assert (=> b!1131946 m!1044507))

(assert (=> b!1131942 m!1043919))

(assert (=> b!1131942 m!1044503))

(assert (=> b!1131942 m!1044503))

(declare-fun m!1044529 () Bool)

(assert (=> b!1131942 m!1044529))

(assert (=> b!1131942 m!1044515))

(assert (=> b!1131942 m!1043919))

(assert (=> b!1131942 m!1044519))

(assert (=> b!1131942 m!1044515))

(assert (=> b!1131945 m!1044503))

(assert (=> b!1131945 m!1044503))

(assert (=> b!1131945 m!1044521))

(assert (=> b!1131747 d!131255))

(declare-fun b!1131953 () Bool)

(declare-fun lt!502734 () Unit!36912)

(declare-fun lt!502737 () Unit!36912)

(assert (=> b!1131953 (= lt!502734 lt!502737)))

(declare-fun lt!502736 () (_ BitVec 64))

(declare-fun lt!502740 () V!43081)

(declare-fun lt!502738 () ListLongMap!16065)

(declare-fun lt!502735 () (_ BitVec 64))

(assert (=> b!1131953 (not (contains!6500 (+!3486 lt!502738 (tuple2!18097 lt!502735 lt!502740)) lt!502736))))

(assert (=> b!1131953 (= lt!502737 (addStillNotContains!284 lt!502738 lt!502735 lt!502740 lt!502736))))

(assert (=> b!1131953 (= lt!502736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131953 (= lt!502740 (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131953 (= lt!502735 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!48748 () ListLongMap!16065)

(assert (=> b!1131953 (= lt!502738 call!48748)))

(declare-fun e!644199 () ListLongMap!16065)

(assert (=> b!1131953 (= e!644199 (+!3486 call!48748 (tuple2!18097 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48745 () Bool)

(assert (=> bm!48745 (= call!48748 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 lt!502441 _keys!1208) (ite c!110180 lt!502452 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131954 () Bool)

(assert (=> b!1131954 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(assert (=> b!1131954 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36047 (ite c!110180 lt!502452 _values!996))))))

(declare-fun e!644201 () Bool)

(declare-fun lt!502739 () ListLongMap!16065)

(assert (=> b!1131954 (= e!644201 (= (apply!948 lt!502739 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18068 (select (arr!35509 (ite c!110180 lt!502452 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131257 () Bool)

(declare-fun e!644200 () Bool)

(assert (=> d!131257 e!644200))

(declare-fun res!756086 () Bool)

(assert (=> d!131257 (=> (not res!756086) (not e!644200))))

(assert (=> d!131257 (= res!756086 (not (contains!6500 lt!502739 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644198 () ListLongMap!16065)

(assert (=> d!131257 (= lt!502739 e!644198)))

(declare-fun c!110294 () Bool)

(assert (=> d!131257 (= c!110294 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(assert (=> d!131257 (validMask!0 mask!1564)))

(assert (=> d!131257 (= (getCurrentListMapNoExtraKeys!4547 (ite c!110180 lt!502441 _keys!1208) (ite c!110180 lt!502452 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502739)))

(declare-fun b!1131955 () Bool)

(declare-fun e!644197 () Bool)

(declare-fun e!644203 () Bool)

(assert (=> b!1131955 (= e!644197 e!644203)))

(declare-fun c!110295 () Bool)

(assert (=> b!1131955 (= c!110295 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(declare-fun b!1131956 () Bool)

(assert (=> b!1131956 (= e!644197 e!644201)))

(assert (=> b!1131956 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(declare-fun res!756089 () Bool)

(assert (=> b!1131956 (= res!756089 (contains!6500 lt!502739 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131956 (=> (not res!756089) (not e!644201))))

(declare-fun b!1131957 () Bool)

(assert (=> b!1131957 (= e!644198 e!644199)))

(declare-fun c!110293 () Bool)

(assert (=> b!1131957 (= c!110293 (validKeyInArray!0 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1131958 () Bool)

(assert (=> b!1131958 (= e!644203 (= lt!502739 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 lt!502441 _keys!1208) (ite c!110180 lt!502452 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131959 () Bool)

(assert (=> b!1131959 (= e!644198 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131960 () Bool)

(assert (=> b!1131960 (= e!644200 e!644197)))

(declare-fun c!110296 () Bool)

(declare-fun e!644202 () Bool)

(assert (=> b!1131960 (= c!110296 e!644202)))

(declare-fun res!756088 () Bool)

(assert (=> b!1131960 (=> (not res!756088) (not e!644202))))

(assert (=> b!1131960 (= res!756088 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 lt!502441 _keys!1208))))))

(declare-fun b!1131961 () Bool)

(assert (=> b!1131961 (= e!644202 (validKeyInArray!0 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131961 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1131962 () Bool)

(assert (=> b!1131962 (= e!644203 (isEmpty!978 lt!502739))))

(declare-fun b!1131963 () Bool)

(assert (=> b!1131963 (= e!644199 call!48748)))

(declare-fun b!1131964 () Bool)

(declare-fun res!756087 () Bool)

(assert (=> b!1131964 (=> (not res!756087) (not e!644200))))

(assert (=> b!1131964 (= res!756087 (not (contains!6500 lt!502739 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131257 c!110294) b!1131959))

(assert (= (and d!131257 (not c!110294)) b!1131957))

(assert (= (and b!1131957 c!110293) b!1131953))

(assert (= (and b!1131957 (not c!110293)) b!1131963))

(assert (= (or b!1131953 b!1131963) bm!48745))

(assert (= (and d!131257 res!756086) b!1131964))

(assert (= (and b!1131964 res!756087) b!1131960))

(assert (= (and b!1131960 res!756088) b!1131961))

(assert (= (and b!1131960 c!110296) b!1131956))

(assert (= (and b!1131960 (not c!110296)) b!1131955))

(assert (= (and b!1131956 res!756089) b!1131954))

(assert (= (and b!1131955 c!110295) b!1131958))

(assert (= (and b!1131955 (not c!110295)) b!1131962))

(declare-fun b_lambda!18943 () Bool)

(assert (=> (not b_lambda!18943) (not b!1131953)))

(assert (=> b!1131953 t!35762))

(declare-fun b_and!38669 () Bool)

(assert (= b_and!38667 (and (=> t!35762 result!18047) b_and!38669)))

(declare-fun b_lambda!18945 () Bool)

(assert (=> (not b_lambda!18945) (not b!1131954)))

(assert (=> b!1131954 t!35762))

(declare-fun b_and!38671 () Bool)

(assert (= b_and!38669 (and (=> t!35762 result!18047) b_and!38671)))

(declare-fun m!1044531 () Bool)

(assert (=> b!1131956 m!1044531))

(assert (=> b!1131956 m!1044531))

(declare-fun m!1044533 () Bool)

(assert (=> b!1131956 m!1044533))

(declare-fun m!1044535 () Bool)

(assert (=> bm!48745 m!1044535))

(assert (=> b!1131953 m!1043919))

(declare-fun m!1044537 () Bool)

(assert (=> b!1131953 m!1044537))

(assert (=> b!1131953 m!1044531))

(declare-fun m!1044539 () Bool)

(assert (=> b!1131953 m!1044539))

(declare-fun m!1044541 () Bool)

(assert (=> b!1131953 m!1044541))

(declare-fun m!1044543 () Bool)

(assert (=> b!1131953 m!1044543))

(assert (=> b!1131953 m!1044541))

(declare-fun m!1044545 () Bool)

(assert (=> b!1131953 m!1044545))

(assert (=> b!1131953 m!1044543))

(assert (=> b!1131953 m!1043919))

(declare-fun m!1044547 () Bool)

(assert (=> b!1131953 m!1044547))

(assert (=> b!1131961 m!1044531))

(assert (=> b!1131961 m!1044531))

(declare-fun m!1044549 () Bool)

(assert (=> b!1131961 m!1044549))

(declare-fun m!1044551 () Bool)

(assert (=> b!1131964 m!1044551))

(declare-fun m!1044553 () Bool)

(assert (=> d!131257 m!1044553))

(assert (=> d!131257 m!1043893))

(declare-fun m!1044555 () Bool)

(assert (=> b!1131962 m!1044555))

(assert (=> b!1131958 m!1044535))

(assert (=> b!1131954 m!1043919))

(assert (=> b!1131954 m!1044531))

(assert (=> b!1131954 m!1044531))

(declare-fun m!1044557 () Bool)

(assert (=> b!1131954 m!1044557))

(assert (=> b!1131954 m!1044543))

(assert (=> b!1131954 m!1043919))

(assert (=> b!1131954 m!1044547))

(assert (=> b!1131954 m!1044543))

(assert (=> b!1131957 m!1044531))

(assert (=> b!1131957 m!1044531))

(assert (=> b!1131957 m!1044549))

(assert (=> b!1131789 d!131257))

(declare-fun d!131259 () Bool)

(assert (=> d!131259 (arrayContainsKey!0 lt!502441 lt!502549 #b00000000000000000000000000000000)))

(declare-fun lt!502741 () Unit!36912)

(assert (=> d!131259 (= lt!502741 (choose!13 lt!502441 lt!502549 #b00000000000000000000000000000000))))

(assert (=> d!131259 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!131259 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!502441 lt!502549 #b00000000000000000000000000000000) lt!502741)))

(declare-fun bs!32937 () Bool)

(assert (= bs!32937 d!131259))

(assert (=> bs!32937 m!1044057))

(declare-fun m!1044559 () Bool)

(assert (=> bs!32937 m!1044559))

(assert (=> b!1131683 d!131259))

(declare-fun d!131261 () Bool)

(declare-fun res!756090 () Bool)

(declare-fun e!644204 () Bool)

(assert (=> d!131261 (=> res!756090 e!644204)))

(assert (=> d!131261 (= res!756090 (= (select (arr!35508 lt!502441) #b00000000000000000000000000000000) lt!502549))))

(assert (=> d!131261 (= (arrayContainsKey!0 lt!502441 lt!502549 #b00000000000000000000000000000000) e!644204)))

(declare-fun b!1131965 () Bool)

(declare-fun e!644205 () Bool)

(assert (=> b!1131965 (= e!644204 e!644205)))

(declare-fun res!756091 () Bool)

(assert (=> b!1131965 (=> (not res!756091) (not e!644205))))

(assert (=> b!1131965 (= res!756091 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(declare-fun b!1131966 () Bool)

(assert (=> b!1131966 (= e!644205 (arrayContainsKey!0 lt!502441 lt!502549 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131261 (not res!756090)) b!1131965))

(assert (= (and b!1131965 res!756091) b!1131966))

(assert (=> d!131261 m!1044051))

(declare-fun m!1044561 () Bool)

(assert (=> b!1131966 m!1044561))

(assert (=> b!1131683 d!131261))

(declare-fun b!1131979 () Bool)

(declare-fun e!644212 () SeekEntryResult!9924)

(declare-fun lt!502749 () SeekEntryResult!9924)

(assert (=> b!1131979 (= e!644212 (Found!9924 (index!42069 lt!502749)))))

(declare-fun b!1131980 () Bool)

(declare-fun e!644214 () SeekEntryResult!9924)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!73710 (_ BitVec 32)) SeekEntryResult!9924)

(assert (=> b!1131980 (= e!644214 (seekKeyOrZeroReturnVacant!0 (x!101487 lt!502749) (index!42069 lt!502749) (index!42069 lt!502749) (select (arr!35508 lt!502441) #b00000000000000000000000000000000) lt!502441 mask!1564))))

(declare-fun b!1131981 () Bool)

(declare-fun e!644213 () SeekEntryResult!9924)

(assert (=> b!1131981 (= e!644213 Undefined!9924)))

(declare-fun b!1131982 () Bool)

(declare-fun c!110305 () Bool)

(declare-fun lt!502750 () (_ BitVec 64))

(assert (=> b!1131982 (= c!110305 (= lt!502750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1131982 (= e!644212 e!644214)))

(declare-fun d!131263 () Bool)

(declare-fun lt!502748 () SeekEntryResult!9924)

(assert (=> d!131263 (and (or ((_ is Undefined!9924) lt!502748) (not ((_ is Found!9924) lt!502748)) (and (bvsge (index!42068 lt!502748) #b00000000000000000000000000000000) (bvslt (index!42068 lt!502748) (size!36046 lt!502441)))) (or ((_ is Undefined!9924) lt!502748) ((_ is Found!9924) lt!502748) (not ((_ is MissingZero!9924) lt!502748)) (and (bvsge (index!42067 lt!502748) #b00000000000000000000000000000000) (bvslt (index!42067 lt!502748) (size!36046 lt!502441)))) (or ((_ is Undefined!9924) lt!502748) ((_ is Found!9924) lt!502748) ((_ is MissingZero!9924) lt!502748) (not ((_ is MissingVacant!9924) lt!502748)) (and (bvsge (index!42070 lt!502748) #b00000000000000000000000000000000) (bvslt (index!42070 lt!502748) (size!36046 lt!502441)))) (or ((_ is Undefined!9924) lt!502748) (ite ((_ is Found!9924) lt!502748) (= (select (arr!35508 lt!502441) (index!42068 lt!502748)) (select (arr!35508 lt!502441) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9924) lt!502748) (= (select (arr!35508 lt!502441) (index!42067 lt!502748)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9924) lt!502748) (= (select (arr!35508 lt!502441) (index!42070 lt!502748)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131263 (= lt!502748 e!644213)))

(declare-fun c!110304 () Bool)

(assert (=> d!131263 (= c!110304 (and ((_ is Intermediate!9924) lt!502749) (undefined!10736 lt!502749)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!73710 (_ BitVec 32)) SeekEntryResult!9924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!131263 (= lt!502749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) mask!1564) (select (arr!35508 lt!502441) #b00000000000000000000000000000000) lt!502441 mask!1564))))

(assert (=> d!131263 (validMask!0 mask!1564)))

(assert (=> d!131263 (= (seekEntryOrOpen!0 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) lt!502441 mask!1564) lt!502748)))

(declare-fun b!1131983 () Bool)

(assert (=> b!1131983 (= e!644214 (MissingZero!9924 (index!42069 lt!502749)))))

(declare-fun b!1131984 () Bool)

(assert (=> b!1131984 (= e!644213 e!644212)))

(assert (=> b!1131984 (= lt!502750 (select (arr!35508 lt!502441) (index!42069 lt!502749)))))

(declare-fun c!110303 () Bool)

(assert (=> b!1131984 (= c!110303 (= lt!502750 (select (arr!35508 lt!502441) #b00000000000000000000000000000000)))))

(assert (= (and d!131263 c!110304) b!1131981))

(assert (= (and d!131263 (not c!110304)) b!1131984))

(assert (= (and b!1131984 c!110303) b!1131979))

(assert (= (and b!1131984 (not c!110303)) b!1131982))

(assert (= (and b!1131982 c!110305) b!1131983))

(assert (= (and b!1131982 (not c!110305)) b!1131980))

(assert (=> b!1131980 m!1044051))

(declare-fun m!1044563 () Bool)

(assert (=> b!1131980 m!1044563))

(assert (=> d!131263 m!1043893))

(declare-fun m!1044565 () Bool)

(assert (=> d!131263 m!1044565))

(assert (=> d!131263 m!1044051))

(declare-fun m!1044567 () Bool)

(assert (=> d!131263 m!1044567))

(declare-fun m!1044569 () Bool)

(assert (=> d!131263 m!1044569))

(assert (=> d!131263 m!1044051))

(assert (=> d!131263 m!1044565))

(declare-fun m!1044571 () Bool)

(assert (=> d!131263 m!1044571))

(declare-fun m!1044573 () Bool)

(assert (=> d!131263 m!1044573))

(declare-fun m!1044575 () Bool)

(assert (=> b!1131984 m!1044575))

(assert (=> b!1131683 d!131263))

(declare-fun b!1131985 () Bool)

(declare-fun lt!502751 () Unit!36912)

(declare-fun lt!502754 () Unit!36912)

(assert (=> b!1131985 (= lt!502751 lt!502754)))

(declare-fun lt!502752 () (_ BitVec 64))

(declare-fun lt!502757 () V!43081)

(declare-fun lt!502753 () (_ BitVec 64))

(declare-fun lt!502755 () ListLongMap!16065)

(assert (=> b!1131985 (not (contains!6500 (+!3486 lt!502755 (tuple2!18097 lt!502752 lt!502757)) lt!502753))))

(assert (=> b!1131985 (= lt!502754 (addStillNotContains!284 lt!502755 lt!502752 lt!502757 lt!502753))))

(assert (=> b!1131985 (= lt!502753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1131985 (= lt!502757 (get!18068 (select (arr!35509 lt!502452) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1131985 (= lt!502752 (select (arr!35508 lt!502441) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!48749 () ListLongMap!16065)

(assert (=> b!1131985 (= lt!502755 call!48749)))

(declare-fun e!644217 () ListLongMap!16065)

(assert (=> b!1131985 (= e!644217 (+!3486 call!48749 (tuple2!18097 (select (arr!35508 lt!502441) (bvadd from!1455 #b00000000000000000000000000000001)) (get!18068 (select (arr!35509 lt!502452) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48746 () Bool)

(assert (=> bm!48746 (= call!48749 (getCurrentListMapNoExtraKeys!4547 lt!502441 lt!502452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1131986 () Bool)

(assert (=> b!1131986 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(assert (=> b!1131986 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36047 lt!502452)))))

(declare-fun e!644219 () Bool)

(declare-fun lt!502756 () ListLongMap!16065)

(assert (=> b!1131986 (= e!644219 (= (apply!948 lt!502756 (select (arr!35508 lt!502441) (bvadd from!1455 #b00000000000000000000000000000001))) (get!18068 (select (arr!35509 lt!502452) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131265 () Bool)

(declare-fun e!644218 () Bool)

(assert (=> d!131265 e!644218))

(declare-fun res!756092 () Bool)

(assert (=> d!131265 (=> (not res!756092) (not e!644218))))

(assert (=> d!131265 (= res!756092 (not (contains!6500 lt!502756 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644216 () ListLongMap!16065)

(assert (=> d!131265 (= lt!502756 e!644216)))

(declare-fun c!110307 () Bool)

(assert (=> d!131265 (= c!110307 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(assert (=> d!131265 (validMask!0 mask!1564)))

(assert (=> d!131265 (= (getCurrentListMapNoExtraKeys!4547 lt!502441 lt!502452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502756)))

(declare-fun b!1131987 () Bool)

(declare-fun e!644215 () Bool)

(declare-fun e!644221 () Bool)

(assert (=> b!1131987 (= e!644215 e!644221)))

(declare-fun c!110308 () Bool)

(assert (=> b!1131987 (= c!110308 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(declare-fun b!1131988 () Bool)

(assert (=> b!1131988 (= e!644215 e!644219)))

(assert (=> b!1131988 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(declare-fun res!756095 () Bool)

(assert (=> b!1131988 (= res!756095 (contains!6500 lt!502756 (select (arr!35508 lt!502441) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131988 (=> (not res!756095) (not e!644219))))

(declare-fun b!1131989 () Bool)

(assert (=> b!1131989 (= e!644216 e!644217)))

(declare-fun c!110306 () Bool)

(assert (=> b!1131989 (= c!110306 (validKeyInArray!0 (select (arr!35508 lt!502441) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1131990 () Bool)

(assert (=> b!1131990 (= e!644221 (= lt!502756 (getCurrentListMapNoExtraKeys!4547 lt!502441 lt!502452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1131991 () Bool)

(assert (=> b!1131991 (= e!644216 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1131992 () Bool)

(assert (=> b!1131992 (= e!644218 e!644215)))

(declare-fun c!110309 () Bool)

(declare-fun e!644220 () Bool)

(assert (=> b!1131992 (= c!110309 e!644220)))

(declare-fun res!756094 () Bool)

(assert (=> b!1131992 (=> (not res!756094) (not e!644220))))

(assert (=> b!1131992 (= res!756094 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(declare-fun b!1131993 () Bool)

(assert (=> b!1131993 (= e!644220 (validKeyInArray!0 (select (arr!35508 lt!502441) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1131993 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1131994 () Bool)

(assert (=> b!1131994 (= e!644221 (isEmpty!978 lt!502756))))

(declare-fun b!1131995 () Bool)

(assert (=> b!1131995 (= e!644217 call!48749)))

(declare-fun b!1131996 () Bool)

(declare-fun res!756093 () Bool)

(assert (=> b!1131996 (=> (not res!756093) (not e!644218))))

(assert (=> b!1131996 (= res!756093 (not (contains!6500 lt!502756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131265 c!110307) b!1131991))

(assert (= (and d!131265 (not c!110307)) b!1131989))

(assert (= (and b!1131989 c!110306) b!1131985))

(assert (= (and b!1131989 (not c!110306)) b!1131995))

(assert (= (or b!1131985 b!1131995) bm!48746))

(assert (= (and d!131265 res!756092) b!1131996))

(assert (= (and b!1131996 res!756093) b!1131992))

(assert (= (and b!1131992 res!756094) b!1131993))

(assert (= (and b!1131992 c!110309) b!1131988))

(assert (= (and b!1131992 (not c!110309)) b!1131987))

(assert (= (and b!1131988 res!756095) b!1131986))

(assert (= (and b!1131987 c!110308) b!1131990))

(assert (= (and b!1131987 (not c!110308)) b!1131994))

(declare-fun b_lambda!18947 () Bool)

(assert (=> (not b_lambda!18947) (not b!1131985)))

(assert (=> b!1131985 t!35762))

(declare-fun b_and!38673 () Bool)

(assert (= b_and!38671 (and (=> t!35762 result!18047) b_and!38673)))

(declare-fun b_lambda!18949 () Bool)

(assert (=> (not b_lambda!18949) (not b!1131986)))

(assert (=> b!1131986 t!35762))

(declare-fun b_and!38675 () Bool)

(assert (= b_and!38673 (and (=> t!35762 result!18047) b_and!38675)))

(declare-fun m!1044577 () Bool)

(assert (=> b!1131988 m!1044577))

(assert (=> b!1131988 m!1044577))

(declare-fun m!1044579 () Bool)

(assert (=> b!1131988 m!1044579))

(declare-fun m!1044581 () Bool)

(assert (=> bm!48746 m!1044581))

(assert (=> b!1131985 m!1043919))

(declare-fun m!1044583 () Bool)

(assert (=> b!1131985 m!1044583))

(assert (=> b!1131985 m!1044577))

(declare-fun m!1044585 () Bool)

(assert (=> b!1131985 m!1044585))

(declare-fun m!1044587 () Bool)

(assert (=> b!1131985 m!1044587))

(declare-fun m!1044589 () Bool)

(assert (=> b!1131985 m!1044589))

(assert (=> b!1131985 m!1044587))

(declare-fun m!1044591 () Bool)

(assert (=> b!1131985 m!1044591))

(assert (=> b!1131985 m!1044589))

(assert (=> b!1131985 m!1043919))

(declare-fun m!1044593 () Bool)

(assert (=> b!1131985 m!1044593))

(assert (=> b!1131993 m!1044577))

(assert (=> b!1131993 m!1044577))

(declare-fun m!1044595 () Bool)

(assert (=> b!1131993 m!1044595))

(declare-fun m!1044597 () Bool)

(assert (=> b!1131996 m!1044597))

(declare-fun m!1044599 () Bool)

(assert (=> d!131265 m!1044599))

(assert (=> d!131265 m!1043893))

(declare-fun m!1044601 () Bool)

(assert (=> b!1131994 m!1044601))

(assert (=> b!1131990 m!1044581))

(assert (=> b!1131986 m!1043919))

(assert (=> b!1131986 m!1044577))

(assert (=> b!1131986 m!1044577))

(declare-fun m!1044603 () Bool)

(assert (=> b!1131986 m!1044603))

(assert (=> b!1131986 m!1044589))

(assert (=> b!1131986 m!1043919))

(assert (=> b!1131986 m!1044593))

(assert (=> b!1131986 m!1044589))

(assert (=> b!1131989 m!1044577))

(assert (=> b!1131989 m!1044577))

(assert (=> b!1131989 m!1044595))

(assert (=> b!1131714 d!131265))

(declare-fun d!131267 () Bool)

(declare-fun e!644223 () Bool)

(assert (=> d!131267 e!644223))

(declare-fun res!756096 () Bool)

(assert (=> d!131267 (=> res!756096 e!644223)))

(declare-fun lt!502760 () Bool)

(assert (=> d!131267 (= res!756096 (not lt!502760))))

(declare-fun lt!502758 () Bool)

(assert (=> d!131267 (= lt!502760 lt!502758)))

(declare-fun lt!502761 () Unit!36912)

(declare-fun e!644222 () Unit!36912)

(assert (=> d!131267 (= lt!502761 e!644222)))

(declare-fun c!110310 () Bool)

(assert (=> d!131267 (= c!110310 lt!502758)))

(assert (=> d!131267 (= lt!502758 (containsKey!585 (toList!8048 lt!502597) (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!131267 (= (contains!6500 lt!502597 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!502760)))

(declare-fun b!1131997 () Bool)

(declare-fun lt!502759 () Unit!36912)

(assert (=> b!1131997 (= e!644222 lt!502759)))

(assert (=> b!1131997 (= lt!502759 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502597) (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1131997 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502597) (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1131998 () Bool)

(declare-fun Unit!36931 () Unit!36912)

(assert (=> b!1131998 (= e!644222 Unit!36931)))

(declare-fun b!1131999 () Bool)

(assert (=> b!1131999 (= e!644223 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502597) (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!131267 c!110310) b!1131997))

(assert (= (and d!131267 (not c!110310)) b!1131998))

(assert (= (and d!131267 (not res!756096)) b!1131999))

(assert (=> d!131267 m!1044125))

(declare-fun m!1044605 () Bool)

(assert (=> d!131267 m!1044605))

(assert (=> b!1131997 m!1044125))

(declare-fun m!1044607 () Bool)

(assert (=> b!1131997 m!1044607))

(assert (=> b!1131997 m!1044125))

(declare-fun m!1044609 () Bool)

(assert (=> b!1131997 m!1044609))

(assert (=> b!1131997 m!1044609))

(declare-fun m!1044611 () Bool)

(assert (=> b!1131997 m!1044611))

(assert (=> b!1131999 m!1044125))

(assert (=> b!1131999 m!1044609))

(assert (=> b!1131999 m!1044609))

(assert (=> b!1131999 m!1044611))

(assert (=> b!1131745 d!131267))

(declare-fun d!131269 () Bool)

(declare-fun e!644225 () Bool)

(assert (=> d!131269 e!644225))

(declare-fun res!756097 () Bool)

(assert (=> d!131269 (=> res!756097 e!644225)))

(declare-fun lt!502764 () Bool)

(assert (=> d!131269 (= res!756097 (not lt!502764))))

(declare-fun lt!502762 () Bool)

(assert (=> d!131269 (= lt!502764 lt!502762)))

(declare-fun lt!502765 () Unit!36912)

(declare-fun e!644224 () Unit!36912)

(assert (=> d!131269 (= lt!502765 e!644224)))

(declare-fun c!110311 () Bool)

(assert (=> d!131269 (= c!110311 lt!502762)))

(assert (=> d!131269 (= lt!502762 (containsKey!585 (toList!8048 lt!502619) (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!131269 (= (contains!6500 lt!502619 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) lt!502764)))

(declare-fun b!1132000 () Bool)

(declare-fun lt!502763 () Unit!36912)

(assert (=> b!1132000 (= e!644224 lt!502763)))

(assert (=> b!1132000 (= lt!502763 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502619) (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132000 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502619) (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132001 () Bool)

(declare-fun Unit!36932 () Unit!36912)

(assert (=> b!1132001 (= e!644224 Unit!36932)))

(declare-fun b!1132002 () Bool)

(assert (=> b!1132002 (= e!644225 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502619) (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!131269 c!110311) b!1132000))

(assert (= (and d!131269 (not c!110311)) b!1132001))

(assert (= (and d!131269 (not res!756097)) b!1132002))

(assert (=> d!131269 m!1044179))

(declare-fun m!1044613 () Bool)

(assert (=> d!131269 m!1044613))

(assert (=> b!1132000 m!1044179))

(declare-fun m!1044615 () Bool)

(assert (=> b!1132000 m!1044615))

(assert (=> b!1132000 m!1044179))

(declare-fun m!1044617 () Bool)

(assert (=> b!1132000 m!1044617))

(assert (=> b!1132000 m!1044617))

(declare-fun m!1044619 () Bool)

(assert (=> b!1132000 m!1044619))

(assert (=> b!1132002 m!1044179))

(assert (=> b!1132002 m!1044617))

(assert (=> b!1132002 m!1044617))

(assert (=> b!1132002 m!1044619))

(assert (=> b!1131787 d!131269))

(assert (=> b!1131814 d!131195))

(assert (=> b!1131814 d!131197))

(declare-fun b!1132003 () Bool)

(declare-fun e!644227 () Bool)

(declare-fun call!48750 () Bool)

(assert (=> b!1132003 (= e!644227 call!48750)))

(declare-fun b!1132004 () Bool)

(declare-fun e!644226 () Bool)

(assert (=> b!1132004 (= e!644226 e!644227)))

(declare-fun c!110312 () Bool)

(assert (=> b!1132004 (= c!110312 (validKeyInArray!0 (select (arr!35508 lt!502441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132005 () Bool)

(declare-fun e!644228 () Bool)

(assert (=> b!1132005 (= e!644227 e!644228)))

(declare-fun lt!502766 () (_ BitVec 64))

(assert (=> b!1132005 (= lt!502766 (select (arr!35508 lt!502441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!502768 () Unit!36912)

(assert (=> b!1132005 (= lt!502768 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!502441 lt!502766 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1132005 (arrayContainsKey!0 lt!502441 lt!502766 #b00000000000000000000000000000000)))

(declare-fun lt!502767 () Unit!36912)

(assert (=> b!1132005 (= lt!502767 lt!502768)))

(declare-fun res!756099 () Bool)

(assert (=> b!1132005 (= res!756099 (= (seekEntryOrOpen!0 (select (arr!35508 lt!502441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!502441 mask!1564) (Found!9924 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1132005 (=> (not res!756099) (not e!644228))))

(declare-fun b!1132006 () Bool)

(assert (=> b!1132006 (= e!644228 call!48750)))

(declare-fun bm!48747 () Bool)

(assert (=> bm!48747 (= call!48750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!502441 mask!1564))))

(declare-fun d!131271 () Bool)

(declare-fun res!756098 () Bool)

(assert (=> d!131271 (=> res!756098 e!644226)))

(assert (=> d!131271 (= res!756098 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(assert (=> d!131271 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!502441 mask!1564) e!644226)))

(assert (= (and d!131271 (not res!756098)) b!1132004))

(assert (= (and b!1132004 c!110312) b!1132005))

(assert (= (and b!1132004 (not c!110312)) b!1132003))

(assert (= (and b!1132005 res!756099) b!1132006))

(assert (= (or b!1132006 b!1132003) bm!48747))

(declare-fun m!1044621 () Bool)

(assert (=> b!1132004 m!1044621))

(assert (=> b!1132004 m!1044621))

(declare-fun m!1044623 () Bool)

(assert (=> b!1132004 m!1044623))

(assert (=> b!1132005 m!1044621))

(declare-fun m!1044625 () Bool)

(assert (=> b!1132005 m!1044625))

(declare-fun m!1044627 () Bool)

(assert (=> b!1132005 m!1044627))

(assert (=> b!1132005 m!1044621))

(declare-fun m!1044629 () Bool)

(assert (=> b!1132005 m!1044629))

(declare-fun m!1044631 () Bool)

(assert (=> bm!48747 m!1044631))

(assert (=> bm!48725 d!131271))

(declare-fun d!131273 () Bool)

(declare-fun e!644230 () Bool)

(assert (=> d!131273 e!644230))

(declare-fun res!756100 () Bool)

(assert (=> d!131273 (=> res!756100 e!644230)))

(declare-fun lt!502771 () Bool)

(assert (=> d!131273 (= res!756100 (not lt!502771))))

(declare-fun lt!502769 () Bool)

(assert (=> d!131273 (= lt!502771 lt!502769)))

(declare-fun lt!502772 () Unit!36912)

(declare-fun e!644229 () Unit!36912)

(assert (=> d!131273 (= lt!502772 e!644229)))

(declare-fun c!110313 () Bool)

(assert (=> d!131273 (= c!110313 lt!502769)))

(assert (=> d!131273 (= lt!502769 (containsKey!585 (toList!8048 lt!502571) (select (arr!35508 lt!502441) from!1455)))))

(assert (=> d!131273 (= (contains!6500 lt!502571 (select (arr!35508 lt!502441) from!1455)) lt!502771)))

(declare-fun b!1132007 () Bool)

(declare-fun lt!502770 () Unit!36912)

(assert (=> b!1132007 (= e!644229 lt!502770)))

(assert (=> b!1132007 (= lt!502770 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502571) (select (arr!35508 lt!502441) from!1455)))))

(assert (=> b!1132007 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502571) (select (arr!35508 lt!502441) from!1455)))))

(declare-fun b!1132008 () Bool)

(declare-fun Unit!36933 () Unit!36912)

(assert (=> b!1132008 (= e!644229 Unit!36933)))

(declare-fun b!1132009 () Bool)

(assert (=> b!1132009 (= e!644230 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502571) (select (arr!35508 lt!502441) from!1455))))))

(assert (= (and d!131273 c!110313) b!1132007))

(assert (= (and d!131273 (not c!110313)) b!1132008))

(assert (= (and d!131273 (not res!756100)) b!1132009))

(assert (=> d!131273 m!1044063))

(declare-fun m!1044633 () Bool)

(assert (=> d!131273 m!1044633))

(assert (=> b!1132007 m!1044063))

(declare-fun m!1044635 () Bool)

(assert (=> b!1132007 m!1044635))

(assert (=> b!1132007 m!1044063))

(assert (=> b!1132007 m!1044311))

(assert (=> b!1132007 m!1044311))

(declare-fun m!1044637 () Bool)

(assert (=> b!1132007 m!1044637))

(assert (=> b!1132009 m!1044063))

(assert (=> b!1132009 m!1044311))

(assert (=> b!1132009 m!1044311))

(assert (=> b!1132009 m!1044637))

(assert (=> b!1131712 d!131273))

(declare-fun d!131275 () Bool)

(assert (=> d!131275 (= (apply!948 lt!502597 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18069 (getValueByKey!630 (toList!8048 lt!502597) (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32938 () Bool)

(assert (= bs!32938 d!131275))

(assert (=> bs!32938 m!1044125))

(assert (=> bs!32938 m!1044609))

(assert (=> bs!32938 m!1044609))

(declare-fun m!1044639 () Bool)

(assert (=> bs!32938 m!1044639))

(assert (=> b!1131743 d!131275))

(assert (=> b!1131743 d!131205))

(declare-fun d!131277 () Bool)

(assert (=> d!131277 (= (apply!948 lt!502619 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18069 (getValueByKey!630 (toList!8048 lt!502619) (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32939 () Bool)

(assert (= bs!32939 d!131277))

(assert (=> bs!32939 m!1044179))

(assert (=> bs!32939 m!1044617))

(assert (=> bs!32939 m!1044617))

(declare-fun m!1044641 () Bool)

(assert (=> bs!32939 m!1044641))

(assert (=> b!1131785 d!131277))

(assert (=> b!1131785 d!131217))

(declare-fun d!131279 () Bool)

(declare-fun e!644232 () Bool)

(assert (=> d!131279 e!644232))

(declare-fun res!756101 () Bool)

(assert (=> d!131279 (=> res!756101 e!644232)))

(declare-fun lt!502775 () Bool)

(assert (=> d!131279 (= res!756101 (not lt!502775))))

(declare-fun lt!502773 () Bool)

(assert (=> d!131279 (= lt!502775 lt!502773)))

(declare-fun lt!502776 () Unit!36912)

(declare-fun e!644231 () Unit!36912)

(assert (=> d!131279 (= lt!502776 e!644231)))

(declare-fun c!110314 () Bool)

(assert (=> d!131279 (= c!110314 lt!502773)))

(assert (=> d!131279 (= lt!502773 (containsKey!585 (toList!8048 lt!502597) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131279 (= (contains!6500 lt!502597 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502775)))

(declare-fun b!1132010 () Bool)

(declare-fun lt!502774 () Unit!36912)

(assert (=> b!1132010 (= e!644231 lt!502774)))

(assert (=> b!1132010 (= lt!502774 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502597) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132010 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502597) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132011 () Bool)

(declare-fun Unit!36934 () Unit!36912)

(assert (=> b!1132011 (= e!644231 Unit!36934)))

(declare-fun b!1132012 () Bool)

(assert (=> b!1132012 (= e!644232 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131279 c!110314) b!1132010))

(assert (= (and d!131279 (not c!110314)) b!1132011))

(assert (= (and d!131279 (not res!756101)) b!1132012))

(declare-fun m!1044643 () Bool)

(assert (=> d!131279 m!1044643))

(declare-fun m!1044645 () Bool)

(assert (=> b!1132010 m!1044645))

(declare-fun m!1044647 () Bool)

(assert (=> b!1132010 m!1044647))

(assert (=> b!1132010 m!1044647))

(declare-fun m!1044649 () Bool)

(assert (=> b!1132010 m!1044649))

(assert (=> b!1132012 m!1044647))

(assert (=> b!1132012 m!1044647))

(assert (=> b!1132012 m!1044649))

(assert (=> b!1131753 d!131279))

(declare-fun d!131281 () Bool)

(declare-fun e!644234 () Bool)

(assert (=> d!131281 e!644234))

(declare-fun res!756102 () Bool)

(assert (=> d!131281 (=> res!756102 e!644234)))

(declare-fun lt!502779 () Bool)

(assert (=> d!131281 (= res!756102 (not lt!502779))))

(declare-fun lt!502777 () Bool)

(assert (=> d!131281 (= lt!502779 lt!502777)))

(declare-fun lt!502780 () Unit!36912)

(declare-fun e!644233 () Unit!36912)

(assert (=> d!131281 (= lt!502780 e!644233)))

(declare-fun c!110315 () Bool)

(assert (=> d!131281 (= c!110315 lt!502777)))

(assert (=> d!131281 (= lt!502777 (containsKey!585 (toList!8048 lt!502619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131281 (= (contains!6500 lt!502619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502779)))

(declare-fun b!1132013 () Bool)

(declare-fun lt!502778 () Unit!36912)

(assert (=> b!1132013 (= e!644233 lt!502778)))

(assert (=> b!1132013 (= lt!502778 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132013 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132014 () Bool)

(declare-fun Unit!36935 () Unit!36912)

(assert (=> b!1132014 (= e!644233 Unit!36935)))

(declare-fun b!1132015 () Bool)

(assert (=> b!1132015 (= e!644234 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131281 c!110315) b!1132013))

(assert (= (and d!131281 (not c!110315)) b!1132014))

(assert (= (and d!131281 (not res!756102)) b!1132015))

(declare-fun m!1044651 () Bool)

(assert (=> d!131281 m!1044651))

(declare-fun m!1044653 () Bool)

(assert (=> b!1132013 m!1044653))

(declare-fun m!1044655 () Bool)

(assert (=> b!1132013 m!1044655))

(assert (=> b!1132013 m!1044655))

(declare-fun m!1044657 () Bool)

(assert (=> b!1132013 m!1044657))

(assert (=> b!1132015 m!1044655))

(assert (=> b!1132015 m!1044655))

(assert (=> b!1132015 m!1044657))

(assert (=> b!1131795 d!131281))

(declare-fun d!131283 () Bool)

(declare-fun e!644236 () Bool)

(assert (=> d!131283 e!644236))

(declare-fun res!756103 () Bool)

(assert (=> d!131283 (=> res!756103 e!644236)))

(declare-fun lt!502783 () Bool)

(assert (=> d!131283 (= res!756103 (not lt!502783))))

(declare-fun lt!502781 () Bool)

(assert (=> d!131283 (= lt!502783 lt!502781)))

(declare-fun lt!502784 () Unit!36912)

(declare-fun e!644235 () Unit!36912)

(assert (=> d!131283 (= lt!502784 e!644235)))

(declare-fun c!110316 () Bool)

(assert (=> d!131283 (= c!110316 lt!502781)))

(assert (=> d!131283 (= lt!502781 (containsKey!585 (toList!8048 (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> d!131283 (= (contains!6500 (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934) lt!502783)))

(declare-fun b!1132016 () Bool)

(declare-fun lt!502782 () Unit!36912)

(assert (=> b!1132016 (= e!644235 lt!502782)))

(assert (=> b!1132016 (= lt!502782 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> b!1132016 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(declare-fun b!1132017 () Bool)

(declare-fun Unit!36936 () Unit!36912)

(assert (=> b!1132017 (= e!644235 Unit!36936)))

(declare-fun b!1132018 () Bool)

(assert (=> b!1132018 (= e!644236 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934)))))

(assert (= (and d!131283 c!110316) b!1132016))

(assert (= (and d!131283 (not c!110316)) b!1132017))

(assert (= (and d!131283 (not res!756103)) b!1132018))

(declare-fun m!1044659 () Bool)

(assert (=> d!131283 m!1044659))

(declare-fun m!1044661 () Bool)

(assert (=> b!1132016 m!1044661))

(declare-fun m!1044663 () Bool)

(assert (=> b!1132016 m!1044663))

(assert (=> b!1132016 m!1044663))

(declare-fun m!1044665 () Bool)

(assert (=> b!1132016 m!1044665))

(assert (=> b!1132018 m!1044663))

(assert (=> b!1132018 m!1044663))

(assert (=> b!1132018 m!1044665))

(assert (=> d!131187 d!131283))

(declare-fun d!131285 () Bool)

(declare-fun e!644237 () Bool)

(assert (=> d!131285 e!644237))

(declare-fun res!756105 () Bool)

(assert (=> d!131285 (=> (not res!756105) (not e!644237))))

(declare-fun lt!502786 () ListLongMap!16065)

(assert (=> d!131285 (= res!756105 (contains!6500 lt!502786 (_1!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!502787 () List!24846)

(assert (=> d!131285 (= lt!502786 (ListLongMap!16066 lt!502787))))

(declare-fun lt!502785 () Unit!36912)

(declare-fun lt!502788 () Unit!36912)

(assert (=> d!131285 (= lt!502785 lt!502788)))

(assert (=> d!131285 (= (getValueByKey!630 lt!502787 (_1!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!680 (_2!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!131285 (= lt!502788 (lemmaContainsTupThenGetReturnValue!306 lt!502787 (_1!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!131285 (= lt!502787 (insertStrictlySorted!399 (toList!8048 lt!502448) (_1!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!131285 (= (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!502786)))

(declare-fun b!1132019 () Bool)

(declare-fun res!756104 () Bool)

(assert (=> b!1132019 (=> (not res!756104) (not e!644237))))

(assert (=> b!1132019 (= res!756104 (= (getValueByKey!630 (toList!8048 lt!502786) (_1!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!680 (_2!9059 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1132020 () Bool)

(assert (=> b!1132020 (= e!644237 (contains!6504 (toList!8048 lt!502786) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!131285 res!756105) b!1132019))

(assert (= (and b!1132019 res!756104) b!1132020))

(declare-fun m!1044667 () Bool)

(assert (=> d!131285 m!1044667))

(declare-fun m!1044669 () Bool)

(assert (=> d!131285 m!1044669))

(declare-fun m!1044671 () Bool)

(assert (=> d!131285 m!1044671))

(declare-fun m!1044673 () Bool)

(assert (=> d!131285 m!1044673))

(declare-fun m!1044675 () Bool)

(assert (=> b!1132019 m!1044675))

(declare-fun m!1044677 () Bool)

(assert (=> b!1132020 m!1044677))

(assert (=> d!131187 d!131285))

(declare-fun d!131287 () Bool)

(assert (=> d!131287 (contains!6500 (+!3486 lt!502448 (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(assert (=> d!131287 true))

(declare-fun _$35!451 () Unit!36912)

(assert (=> d!131287 (= (choose!1784 lt!502448 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) _$35!451)))

(declare-fun bs!32940 () Bool)

(assert (= bs!32940 d!131287))

(assert (=> bs!32940 m!1044275))

(assert (=> bs!32940 m!1044275))

(assert (=> bs!32940 m!1044277))

(assert (=> d!131187 d!131287))

(assert (=> d!131187 d!131147))

(declare-fun d!131289 () Bool)

(declare-fun e!644239 () Bool)

(assert (=> d!131289 e!644239))

(declare-fun res!756106 () Bool)

(assert (=> d!131289 (=> res!756106 e!644239)))

(declare-fun lt!502791 () Bool)

(assert (=> d!131289 (= res!756106 (not lt!502791))))

(declare-fun lt!502789 () Bool)

(assert (=> d!131289 (= lt!502791 lt!502789)))

(declare-fun lt!502792 () Unit!36912)

(declare-fun e!644238 () Unit!36912)

(assert (=> d!131289 (= lt!502792 e!644238)))

(declare-fun c!110317 () Bool)

(assert (=> d!131289 (= c!110317 lt!502789)))

(assert (=> d!131289 (= lt!502789 (containsKey!585 (toList!8048 lt!502571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131289 (= (contains!6500 lt!502571 #b1000000000000000000000000000000000000000000000000000000000000000) lt!502791)))

(declare-fun b!1132022 () Bool)

(declare-fun lt!502790 () Unit!36912)

(assert (=> b!1132022 (= e!644238 lt!502790)))

(assert (=> b!1132022 (= lt!502790 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132022 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132023 () Bool)

(declare-fun Unit!36937 () Unit!36912)

(assert (=> b!1132023 (= e!644238 Unit!36937)))

(declare-fun b!1132024 () Bool)

(assert (=> b!1132024 (= e!644239 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131289 c!110317) b!1132022))

(assert (= (and d!131289 (not c!110317)) b!1132023))

(assert (= (and d!131289 (not res!756106)) b!1132024))

(declare-fun m!1044679 () Bool)

(assert (=> d!131289 m!1044679))

(declare-fun m!1044681 () Bool)

(assert (=> b!1132022 m!1044681))

(declare-fun m!1044683 () Bool)

(assert (=> b!1132022 m!1044683))

(assert (=> b!1132022 m!1044683))

(declare-fun m!1044685 () Bool)

(assert (=> b!1132022 m!1044685))

(assert (=> b!1132024 m!1044683))

(assert (=> b!1132024 m!1044683))

(assert (=> b!1132024 m!1044685))

(assert (=> b!1131720 d!131289))

(declare-fun b!1132025 () Bool)

(declare-fun lt!502793 () Unit!36912)

(declare-fun lt!502796 () Unit!36912)

(assert (=> b!1132025 (= lt!502793 lt!502796)))

(declare-fun lt!502797 () ListLongMap!16065)

(declare-fun lt!502795 () (_ BitVec 64))

(declare-fun lt!502799 () V!43081)

(declare-fun lt!502794 () (_ BitVec 64))

(assert (=> b!1132025 (not (contains!6500 (+!3486 lt!502797 (tuple2!18097 lt!502794 lt!502799)) lt!502795))))

(assert (=> b!1132025 (= lt!502796 (addStillNotContains!284 lt!502797 lt!502794 lt!502799 lt!502795))))

(assert (=> b!1132025 (= lt!502795 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132025 (= lt!502799 (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132025 (= lt!502794 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!48751 () ListLongMap!16065)

(assert (=> b!1132025 (= lt!502797 call!48751)))

(declare-fun e!644242 () ListLongMap!16065)

(assert (=> b!1132025 (= e!644242 (+!3486 call!48751 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48748 () Bool)

(assert (=> bm!48748 (= call!48751 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 _keys!1208 lt!502441) (ite c!110180 _values!996 lt!502452) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132026 () Bool)

(assert (=> b!1132026 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(assert (=> b!1132026 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36047 (ite c!110180 _values!996 lt!502452))))))

(declare-fun e!644244 () Bool)

(declare-fun lt!502798 () ListLongMap!16065)

(assert (=> b!1132026 (= e!644244 (= (apply!948 lt!502798 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131291 () Bool)

(declare-fun e!644243 () Bool)

(assert (=> d!131291 e!644243))

(declare-fun res!756107 () Bool)

(assert (=> d!131291 (=> (not res!756107) (not e!644243))))

(assert (=> d!131291 (= res!756107 (not (contains!6500 lt!502798 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644241 () ListLongMap!16065)

(assert (=> d!131291 (= lt!502798 e!644241)))

(declare-fun c!110319 () Bool)

(assert (=> d!131291 (= c!110319 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(assert (=> d!131291 (validMask!0 mask!1564)))

(assert (=> d!131291 (= (getCurrentListMapNoExtraKeys!4547 (ite c!110180 _keys!1208 lt!502441) (ite c!110180 _values!996 lt!502452) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502798)))

(declare-fun b!1132027 () Bool)

(declare-fun e!644240 () Bool)

(declare-fun e!644246 () Bool)

(assert (=> b!1132027 (= e!644240 e!644246)))

(declare-fun c!110320 () Bool)

(assert (=> b!1132027 (= c!110320 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(declare-fun b!1132028 () Bool)

(assert (=> b!1132028 (= e!644240 e!644244)))

(assert (=> b!1132028 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(declare-fun res!756110 () Bool)

(assert (=> b!1132028 (= res!756110 (contains!6500 lt!502798 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132028 (=> (not res!756110) (not e!644244))))

(declare-fun b!1132029 () Bool)

(assert (=> b!1132029 (= e!644241 e!644242)))

(declare-fun c!110318 () Bool)

(assert (=> b!1132029 (= c!110318 (validKeyInArray!0 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1132030 () Bool)

(assert (=> b!1132030 (= e!644246 (= lt!502798 (getCurrentListMapNoExtraKeys!4547 (ite c!110180 _keys!1208 lt!502441) (ite c!110180 _values!996 lt!502452) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132031 () Bool)

(assert (=> b!1132031 (= e!644241 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1132032 () Bool)

(assert (=> b!1132032 (= e!644243 e!644240)))

(declare-fun c!110321 () Bool)

(declare-fun e!644245 () Bool)

(assert (=> b!1132032 (= c!110321 e!644245)))

(declare-fun res!756109 () Bool)

(assert (=> b!1132032 (=> (not res!756109) (not e!644245))))

(assert (=> b!1132032 (= res!756109 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36046 (ite c!110180 _keys!1208 lt!502441))))))

(declare-fun b!1132033 () Bool)

(assert (=> b!1132033 (= e!644245 (validKeyInArray!0 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132033 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1132034 () Bool)

(assert (=> b!1132034 (= e!644246 (isEmpty!978 lt!502798))))

(declare-fun b!1132035 () Bool)

(assert (=> b!1132035 (= e!644242 call!48751)))

(declare-fun b!1132036 () Bool)

(declare-fun res!756108 () Bool)

(assert (=> b!1132036 (=> (not res!756108) (not e!644243))))

(assert (=> b!1132036 (= res!756108 (not (contains!6500 lt!502798 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131291 c!110319) b!1132031))

(assert (= (and d!131291 (not c!110319)) b!1132029))

(assert (= (and b!1132029 c!110318) b!1132025))

(assert (= (and b!1132029 (not c!110318)) b!1132035))

(assert (= (or b!1132025 b!1132035) bm!48748))

(assert (= (and d!131291 res!756107) b!1132036))

(assert (= (and b!1132036 res!756108) b!1132032))

(assert (= (and b!1132032 res!756109) b!1132033))

(assert (= (and b!1132032 c!110321) b!1132028))

(assert (= (and b!1132032 (not c!110321)) b!1132027))

(assert (= (and b!1132028 res!756110) b!1132026))

(assert (= (and b!1132027 c!110320) b!1132030))

(assert (= (and b!1132027 (not c!110320)) b!1132034))

(declare-fun b_lambda!18951 () Bool)

(assert (=> (not b_lambda!18951) (not b!1132025)))

(assert (=> b!1132025 t!35762))

(declare-fun b_and!38677 () Bool)

(assert (= b_and!38675 (and (=> t!35762 result!18047) b_and!38677)))

(declare-fun b_lambda!18953 () Bool)

(assert (=> (not b_lambda!18953) (not b!1132026)))

(assert (=> b!1132026 t!35762))

(declare-fun b_and!38679 () Bool)

(assert (= b_and!38677 (and (=> t!35762 result!18047) b_and!38679)))

(declare-fun m!1044687 () Bool)

(assert (=> b!1132028 m!1044687))

(assert (=> b!1132028 m!1044687))

(declare-fun m!1044689 () Bool)

(assert (=> b!1132028 m!1044689))

(declare-fun m!1044691 () Bool)

(assert (=> bm!48748 m!1044691))

(assert (=> b!1132025 m!1043919))

(declare-fun m!1044693 () Bool)

(assert (=> b!1132025 m!1044693))

(assert (=> b!1132025 m!1044687))

(declare-fun m!1044695 () Bool)

(assert (=> b!1132025 m!1044695))

(declare-fun m!1044697 () Bool)

(assert (=> b!1132025 m!1044697))

(declare-fun m!1044699 () Bool)

(assert (=> b!1132025 m!1044699))

(assert (=> b!1132025 m!1044697))

(declare-fun m!1044701 () Bool)

(assert (=> b!1132025 m!1044701))

(assert (=> b!1132025 m!1044699))

(assert (=> b!1132025 m!1043919))

(declare-fun m!1044703 () Bool)

(assert (=> b!1132025 m!1044703))

(assert (=> b!1132033 m!1044687))

(assert (=> b!1132033 m!1044687))

(declare-fun m!1044705 () Bool)

(assert (=> b!1132033 m!1044705))

(declare-fun m!1044707 () Bool)

(assert (=> b!1132036 m!1044707))

(declare-fun m!1044709 () Bool)

(assert (=> d!131291 m!1044709))

(assert (=> d!131291 m!1043893))

(declare-fun m!1044711 () Bool)

(assert (=> b!1132034 m!1044711))

(assert (=> b!1132030 m!1044691))

(assert (=> b!1132026 m!1043919))

(assert (=> b!1132026 m!1044687))

(assert (=> b!1132026 m!1044687))

(declare-fun m!1044713 () Bool)

(assert (=> b!1132026 m!1044713))

(assert (=> b!1132026 m!1044699))

(assert (=> b!1132026 m!1043919))

(assert (=> b!1132026 m!1044703))

(assert (=> b!1132026 m!1044699))

(assert (=> b!1132029 m!1044687))

(assert (=> b!1132029 m!1044687))

(assert (=> b!1132029 m!1044705))

(assert (=> bm!48741 d!131291))

(declare-fun d!131293 () Bool)

(declare-fun lt!502800 () Bool)

(assert (=> d!131293 (= lt!502800 (select (content!538 Nil!24842) (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!644248 () Bool)

(assert (=> d!131293 (= lt!502800 e!644248)))

(declare-fun res!756112 () Bool)

(assert (=> d!131293 (=> (not res!756112) (not e!644248))))

(assert (=> d!131293 (= res!756112 ((_ is Cons!24841) Nil!24842))))

(assert (=> d!131293 (= (contains!6503 Nil!24842 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)) lt!502800)))

(declare-fun b!1132037 () Bool)

(declare-fun e!644247 () Bool)

(assert (=> b!1132037 (= e!644248 e!644247)))

(declare-fun res!756111 () Bool)

(assert (=> b!1132037 (=> res!756111 e!644247)))

(assert (=> b!1132037 (= res!756111 (= (h!26050 Nil!24842) (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1132038 () Bool)

(assert (=> b!1132038 (= e!644247 (contains!6503 (t!35763 Nil!24842) (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131293 res!756112) b!1132037))

(assert (= (and b!1132037 (not res!756111)) b!1132038))

(assert (=> d!131293 m!1044481))

(assert (=> d!131293 m!1044153))

(declare-fun m!1044715 () Bool)

(assert (=> d!131293 m!1044715))

(assert (=> b!1132038 m!1044153))

(declare-fun m!1044717 () Bool)

(assert (=> b!1132038 m!1044717))

(assert (=> b!1131765 d!131293))

(declare-fun d!131295 () Bool)

(assert (=> d!131295 (= (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)) (not (isEmpty!979 (getValueByKey!630 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))))

(declare-fun bs!32941 () Bool)

(assert (= bs!32941 d!131295))

(assert (=> bs!32941 m!1044285))

(declare-fun m!1044719 () Bool)

(assert (=> bs!32941 m!1044719))

(assert (=> b!1131837 d!131295))

(declare-fun d!131297 () Bool)

(declare-fun c!110322 () Bool)

(assert (=> d!131297 (= c!110322 (and ((_ is Cons!24842) (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9059 (h!26051 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(declare-fun e!644249 () Option!681)

(assert (=> d!131297 (= (getValueByKey!630 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!644249)))

(declare-fun b!1132040 () Bool)

(declare-fun e!644250 () Option!681)

(assert (=> b!1132040 (= e!644249 e!644250)))

(declare-fun c!110323 () Bool)

(assert (=> b!1132040 (= c!110323 (and ((_ is Cons!24842) (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (not (= (_1!9059 (h!26051 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934))))))

(declare-fun b!1132042 () Bool)

(assert (=> b!1132042 (= e!644250 None!679)))

(declare-fun b!1132039 () Bool)

(assert (=> b!1132039 (= e!644249 (Some!680 (_2!9059 (h!26051 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1132041 () Bool)

(assert (=> b!1132041 (= e!644250 (getValueByKey!630 (t!35764 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(assert (= (and d!131297 c!110322) b!1132039))

(assert (= (and d!131297 (not c!110322)) b!1132040))

(assert (= (and b!1132040 c!110323) b!1132041))

(assert (= (and b!1132040 (not c!110323)) b!1132042))

(declare-fun m!1044721 () Bool)

(assert (=> b!1132041 m!1044721))

(assert (=> b!1131837 d!131297))

(declare-fun d!131299 () Bool)

(assert (=> d!131299 (arrayContainsKey!0 _keys!1208 lt!502628 #b00000000000000000000000000000000)))

(declare-fun lt!502801 () Unit!36912)

(assert (=> d!131299 (= lt!502801 (choose!13 _keys!1208 lt!502628 #b00000000000000000000000000000000))))

(assert (=> d!131299 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!131299 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!502628 #b00000000000000000000000000000000) lt!502801)))

(declare-fun bs!32942 () Bool)

(assert (= bs!32942 d!131299))

(assert (=> bs!32942 m!1044237))

(declare-fun m!1044723 () Bool)

(assert (=> bs!32942 m!1044723))

(assert (=> b!1131810 d!131299))

(declare-fun d!131301 () Bool)

(declare-fun res!756113 () Bool)

(declare-fun e!644251 () Bool)

(assert (=> d!131301 (=> res!756113 e!644251)))

(assert (=> d!131301 (= res!756113 (= (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) lt!502628))))

(assert (=> d!131301 (= (arrayContainsKey!0 _keys!1208 lt!502628 #b00000000000000000000000000000000) e!644251)))

(declare-fun b!1132043 () Bool)

(declare-fun e!644252 () Bool)

(assert (=> b!1132043 (= e!644251 e!644252)))

(declare-fun res!756114 () Bool)

(assert (=> b!1132043 (=> (not res!756114) (not e!644252))))

(assert (=> b!1132043 (= res!756114 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1132044 () Bool)

(assert (=> b!1132044 (= e!644252 (arrayContainsKey!0 _keys!1208 lt!502628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131301 (not res!756113)) b!1132043))

(assert (= (and b!1132043 res!756114) b!1132044))

(assert (=> d!131301 m!1044153))

(declare-fun m!1044725 () Bool)

(assert (=> b!1132044 m!1044725))

(assert (=> b!1131810 d!131301))

(declare-fun b!1132045 () Bool)

(declare-fun e!644253 () SeekEntryResult!9924)

(declare-fun lt!502803 () SeekEntryResult!9924)

(assert (=> b!1132045 (= e!644253 (Found!9924 (index!42069 lt!502803)))))

(declare-fun e!644255 () SeekEntryResult!9924)

(declare-fun b!1132046 () Bool)

(assert (=> b!1132046 (= e!644255 (seekKeyOrZeroReturnVacant!0 (x!101487 lt!502803) (index!42069 lt!502803) (index!42069 lt!502803) (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(declare-fun b!1132047 () Bool)

(declare-fun e!644254 () SeekEntryResult!9924)

(assert (=> b!1132047 (= e!644254 Undefined!9924)))

(declare-fun b!1132048 () Bool)

(declare-fun c!110326 () Bool)

(declare-fun lt!502804 () (_ BitVec 64))

(assert (=> b!1132048 (= c!110326 (= lt!502804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132048 (= e!644253 e!644255)))

(declare-fun d!131303 () Bool)

(declare-fun lt!502802 () SeekEntryResult!9924)

(assert (=> d!131303 (and (or ((_ is Undefined!9924) lt!502802) (not ((_ is Found!9924) lt!502802)) (and (bvsge (index!42068 lt!502802) #b00000000000000000000000000000000) (bvslt (index!42068 lt!502802) (size!36046 _keys!1208)))) (or ((_ is Undefined!9924) lt!502802) ((_ is Found!9924) lt!502802) (not ((_ is MissingZero!9924) lt!502802)) (and (bvsge (index!42067 lt!502802) #b00000000000000000000000000000000) (bvslt (index!42067 lt!502802) (size!36046 _keys!1208)))) (or ((_ is Undefined!9924) lt!502802) ((_ is Found!9924) lt!502802) ((_ is MissingZero!9924) lt!502802) (not ((_ is MissingVacant!9924) lt!502802)) (and (bvsge (index!42070 lt!502802) #b00000000000000000000000000000000) (bvslt (index!42070 lt!502802) (size!36046 _keys!1208)))) (or ((_ is Undefined!9924) lt!502802) (ite ((_ is Found!9924) lt!502802) (= (select (arr!35508 _keys!1208) (index!42068 lt!502802)) (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9924) lt!502802) (= (select (arr!35508 _keys!1208) (index!42067 lt!502802)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9924) lt!502802) (= (select (arr!35508 _keys!1208) (index!42070 lt!502802)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131303 (= lt!502802 e!644254)))

(declare-fun c!110325 () Bool)

(assert (=> d!131303 (= c!110325 (and ((_ is Intermediate!9924) lt!502803) (undefined!10736 lt!502803)))))

(assert (=> d!131303 (= lt!502803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!131303 (validMask!0 mask!1564)))

(assert (=> d!131303 (= (seekEntryOrOpen!0 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!502802)))

(declare-fun b!1132049 () Bool)

(assert (=> b!1132049 (= e!644255 (MissingZero!9924 (index!42069 lt!502803)))))

(declare-fun b!1132050 () Bool)

(assert (=> b!1132050 (= e!644254 e!644253)))

(assert (=> b!1132050 (= lt!502804 (select (arr!35508 _keys!1208) (index!42069 lt!502803)))))

(declare-fun c!110324 () Bool)

(assert (=> b!1132050 (= c!110324 (= lt!502804 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131303 c!110325) b!1132047))

(assert (= (and d!131303 (not c!110325)) b!1132050))

(assert (= (and b!1132050 c!110324) b!1132045))

(assert (= (and b!1132050 (not c!110324)) b!1132048))

(assert (= (and b!1132048 c!110326) b!1132049))

(assert (= (and b!1132048 (not c!110326)) b!1132046))

(assert (=> b!1132046 m!1044153))

(declare-fun m!1044727 () Bool)

(assert (=> b!1132046 m!1044727))

(assert (=> d!131303 m!1043893))

(declare-fun m!1044729 () Bool)

(assert (=> d!131303 m!1044729))

(assert (=> d!131303 m!1044153))

(declare-fun m!1044731 () Bool)

(assert (=> d!131303 m!1044731))

(declare-fun m!1044733 () Bool)

(assert (=> d!131303 m!1044733))

(assert (=> d!131303 m!1044153))

(assert (=> d!131303 m!1044729))

(declare-fun m!1044735 () Bool)

(assert (=> d!131303 m!1044735))

(declare-fun m!1044737 () Bool)

(assert (=> d!131303 m!1044737))

(declare-fun m!1044739 () Bool)

(assert (=> b!1132050 m!1044739))

(assert (=> b!1131810 d!131303))

(declare-fun b!1132051 () Bool)

(declare-fun lt!502805 () Unit!36912)

(declare-fun lt!502808 () Unit!36912)

(assert (=> b!1132051 (= lt!502805 lt!502808)))

(declare-fun lt!502809 () ListLongMap!16065)

(declare-fun lt!502811 () V!43081)

(declare-fun lt!502807 () (_ BitVec 64))

(declare-fun lt!502806 () (_ BitVec 64))

(assert (=> b!1132051 (not (contains!6500 (+!3486 lt!502809 (tuple2!18097 lt!502806 lt!502811)) lt!502807))))

(assert (=> b!1132051 (= lt!502808 (addStillNotContains!284 lt!502809 lt!502806 lt!502811 lt!502807))))

(assert (=> b!1132051 (= lt!502807 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132051 (= lt!502811 (get!18068 (select (arr!35509 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132051 (= lt!502806 (select (arr!35508 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!48752 () ListLongMap!16065)

(assert (=> b!1132051 (= lt!502809 call!48752)))

(declare-fun e!644258 () ListLongMap!16065)

(assert (=> b!1132051 (= e!644258 (+!3486 call!48752 (tuple2!18097 (select (arr!35508 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!18068 (select (arr!35509 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48749 () Bool)

(assert (=> bm!48749 (= call!48752 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132052 () Bool)

(assert (=> b!1132052 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(assert (=> b!1132052 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36047 _values!996)))))

(declare-fun e!644260 () Bool)

(declare-fun lt!502810 () ListLongMap!16065)

(assert (=> b!1132052 (= e!644260 (= (apply!948 lt!502810 (select (arr!35508 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!18068 (select (arr!35509 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131305 () Bool)

(declare-fun e!644259 () Bool)

(assert (=> d!131305 e!644259))

(declare-fun res!756115 () Bool)

(assert (=> d!131305 (=> (not res!756115) (not e!644259))))

(assert (=> d!131305 (= res!756115 (not (contains!6500 lt!502810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644257 () ListLongMap!16065)

(assert (=> d!131305 (= lt!502810 e!644257)))

(declare-fun c!110328 () Bool)

(assert (=> d!131305 (= c!110328 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(assert (=> d!131305 (validMask!0 mask!1564)))

(assert (=> d!131305 (= (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!502810)))

(declare-fun b!1132053 () Bool)

(declare-fun e!644256 () Bool)

(declare-fun e!644262 () Bool)

(assert (=> b!1132053 (= e!644256 e!644262)))

(declare-fun c!110329 () Bool)

(assert (=> b!1132053 (= c!110329 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1132054 () Bool)

(assert (=> b!1132054 (= e!644256 e!644260)))

(assert (=> b!1132054 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun res!756118 () Bool)

(assert (=> b!1132054 (= res!756118 (contains!6500 lt!502810 (select (arr!35508 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132054 (=> (not res!756118) (not e!644260))))

(declare-fun b!1132055 () Bool)

(assert (=> b!1132055 (= e!644257 e!644258)))

(declare-fun c!110327 () Bool)

(assert (=> b!1132055 (= c!110327 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1132056 () Bool)

(assert (=> b!1132056 (= e!644262 (= lt!502810 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132057 () Bool)

(assert (=> b!1132057 (= e!644257 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1132058 () Bool)

(assert (=> b!1132058 (= e!644259 e!644256)))

(declare-fun c!110330 () Bool)

(declare-fun e!644261 () Bool)

(assert (=> b!1132058 (= c!110330 e!644261)))

(declare-fun res!756117 () Bool)

(assert (=> b!1132058 (=> (not res!756117) (not e!644261))))

(assert (=> b!1132058 (= res!756117 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1132059 () Bool)

(assert (=> b!1132059 (= e!644261 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1132059 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1132060 () Bool)

(assert (=> b!1132060 (= e!644262 (isEmpty!978 lt!502810))))

(declare-fun b!1132061 () Bool)

(assert (=> b!1132061 (= e!644258 call!48752)))

(declare-fun b!1132062 () Bool)

(declare-fun res!756116 () Bool)

(assert (=> b!1132062 (=> (not res!756116) (not e!644259))))

(assert (=> b!1132062 (= res!756116 (not (contains!6500 lt!502810 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131305 c!110328) b!1132057))

(assert (= (and d!131305 (not c!110328)) b!1132055))

(assert (= (and b!1132055 c!110327) b!1132051))

(assert (= (and b!1132055 (not c!110327)) b!1132061))

(assert (= (or b!1132051 b!1132061) bm!48749))

(assert (= (and d!131305 res!756115) b!1132062))

(assert (= (and b!1132062 res!756116) b!1132058))

(assert (= (and b!1132058 res!756117) b!1132059))

(assert (= (and b!1132058 c!110330) b!1132054))

(assert (= (and b!1132058 (not c!110330)) b!1132053))

(assert (= (and b!1132054 res!756118) b!1132052))

(assert (= (and b!1132053 c!110329) b!1132056))

(assert (= (and b!1132053 (not c!110329)) b!1132060))

(declare-fun b_lambda!18955 () Bool)

(assert (=> (not b_lambda!18955) (not b!1132051)))

(assert (=> b!1132051 t!35762))

(declare-fun b_and!38681 () Bool)

(assert (= b_and!38679 (and (=> t!35762 result!18047) b_and!38681)))

(declare-fun b_lambda!18957 () Bool)

(assert (=> (not b_lambda!18957) (not b!1132052)))

(assert (=> b!1132052 t!35762))

(declare-fun b_and!38683 () Bool)

(assert (= b_and!38681 (and (=> t!35762 result!18047) b_and!38683)))

(declare-fun m!1044741 () Bool)

(assert (=> b!1132054 m!1044741))

(assert (=> b!1132054 m!1044741))

(declare-fun m!1044743 () Bool)

(assert (=> b!1132054 m!1044743))

(declare-fun m!1044745 () Bool)

(assert (=> bm!48749 m!1044745))

(assert (=> b!1132051 m!1043919))

(declare-fun m!1044747 () Bool)

(assert (=> b!1132051 m!1044747))

(assert (=> b!1132051 m!1044741))

(declare-fun m!1044749 () Bool)

(assert (=> b!1132051 m!1044749))

(declare-fun m!1044751 () Bool)

(assert (=> b!1132051 m!1044751))

(declare-fun m!1044753 () Bool)

(assert (=> b!1132051 m!1044753))

(assert (=> b!1132051 m!1044751))

(declare-fun m!1044755 () Bool)

(assert (=> b!1132051 m!1044755))

(assert (=> b!1132051 m!1044753))

(assert (=> b!1132051 m!1043919))

(declare-fun m!1044757 () Bool)

(assert (=> b!1132051 m!1044757))

(assert (=> b!1132059 m!1044741))

(assert (=> b!1132059 m!1044741))

(declare-fun m!1044759 () Bool)

(assert (=> b!1132059 m!1044759))

(declare-fun m!1044761 () Bool)

(assert (=> b!1132062 m!1044761))

(declare-fun m!1044763 () Bool)

(assert (=> d!131305 m!1044763))

(assert (=> d!131305 m!1043893))

(declare-fun m!1044765 () Bool)

(assert (=> b!1132060 m!1044765))

(assert (=> b!1132056 m!1044745))

(assert (=> b!1132052 m!1043919))

(assert (=> b!1132052 m!1044741))

(assert (=> b!1132052 m!1044741))

(declare-fun m!1044767 () Bool)

(assert (=> b!1132052 m!1044767))

(assert (=> b!1132052 m!1044753))

(assert (=> b!1132052 m!1043919))

(assert (=> b!1132052 m!1044757))

(assert (=> b!1132052 m!1044753))

(assert (=> b!1132055 m!1044741))

(assert (=> b!1132055 m!1044741))

(assert (=> b!1132055 m!1044759))

(assert (=> bm!48729 d!131305))

(declare-fun d!131307 () Bool)

(assert (=> d!131307 (= (isEmpty!978 lt!502597) (isEmpty!980 (toList!8048 lt!502597)))))

(declare-fun bs!32943 () Bool)

(assert (= bs!32943 d!131307))

(declare-fun m!1044769 () Bool)

(assert (=> bs!32943 m!1044769))

(assert (=> b!1131751 d!131307))

(declare-fun d!131309 () Bool)

(assert (=> d!131309 (= (isEmpty!978 lt!502619) (isEmpty!980 (toList!8048 lt!502619)))))

(declare-fun bs!32944 () Bool)

(assert (= bs!32944 d!131309))

(declare-fun m!1044771 () Bool)

(assert (=> bs!32944 m!1044771))

(assert (=> b!1131793 d!131309))

(assert (=> bm!48738 d!131149))

(declare-fun d!131311 () Bool)

(assert (=> d!131311 (= (isEmpty!978 lt!502571) (isEmpty!980 (toList!8048 lt!502571)))))

(declare-fun bs!32945 () Bool)

(assert (= bs!32945 d!131311))

(declare-fun m!1044773 () Bool)

(assert (=> bs!32945 m!1044773))

(assert (=> b!1131718 d!131311))

(declare-fun d!131313 () Bool)

(declare-fun lt!502814 () Bool)

(declare-fun content!539 (List!24846) (InoxSet tuple2!18096))

(assert (=> d!131313 (= lt!502814 (select (content!539 (toList!8048 lt!502653)) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun e!644268 () Bool)

(assert (=> d!131313 (= lt!502814 e!644268)))

(declare-fun res!756124 () Bool)

(assert (=> d!131313 (=> (not res!756124) (not e!644268))))

(assert (=> d!131313 (= res!756124 ((_ is Cons!24842) (toList!8048 lt!502653)))))

(assert (=> d!131313 (= (contains!6504 (toList!8048 lt!502653) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!502814)))

(declare-fun b!1132067 () Bool)

(declare-fun e!644267 () Bool)

(assert (=> b!1132067 (= e!644268 e!644267)))

(declare-fun res!756123 () Bool)

(assert (=> b!1132067 (=> res!756123 e!644267)))

(assert (=> b!1132067 (= res!756123 (= (h!26051 (toList!8048 lt!502653)) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1132068 () Bool)

(assert (=> b!1132068 (= e!644267 (contains!6504 (t!35764 (toList!8048 lt!502653)) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131313 res!756124) b!1132067))

(assert (= (and b!1132067 (not res!756123)) b!1132068))

(declare-fun m!1044775 () Bool)

(assert (=> d!131313 m!1044775))

(declare-fun m!1044777 () Bool)

(assert (=> d!131313 m!1044777))

(declare-fun m!1044779 () Bool)

(assert (=> b!1132068 m!1044779))

(assert (=> b!1131839 d!131313))

(assert (=> b!1131741 d!131249))

(assert (=> b!1131741 d!131251))

(declare-fun d!131315 () Bool)

(assert (=> d!131315 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun lt!502815 () Unit!36912)

(assert (=> d!131315 (= lt!502815 (choose!1785 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun e!644269 () Bool)

(assert (=> d!131315 e!644269))

(declare-fun res!756125 () Bool)

(assert (=> d!131315 (=> (not res!756125) (not e!644269))))

(assert (=> d!131315 (= res!756125 (isStrictlySorted!723 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131315 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) lt!502815)))

(declare-fun b!1132069 () Bool)

(assert (=> b!1132069 (= e!644269 (containsKey!585 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (= (and d!131315 res!756125) b!1132069))

(assert (=> d!131315 m!1044285))

(assert (=> d!131315 m!1044285))

(assert (=> d!131315 m!1044287))

(declare-fun m!1044781 () Bool)

(assert (=> d!131315 m!1044781))

(declare-fun m!1044783 () Bool)

(assert (=> d!131315 m!1044783))

(assert (=> b!1132069 m!1044281))

(assert (=> b!1131835 d!131315))

(assert (=> b!1131835 d!131295))

(assert (=> b!1131835 d!131297))

(declare-fun b!1132070 () Bool)

(declare-fun e!644271 () Bool)

(declare-fun call!48753 () Bool)

(assert (=> b!1132070 (= e!644271 call!48753)))

(declare-fun b!1132071 () Bool)

(declare-fun e!644270 () Bool)

(assert (=> b!1132071 (= e!644270 e!644271)))

(declare-fun c!110331 () Bool)

(assert (=> b!1132071 (= c!110331 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132072 () Bool)

(declare-fun e!644272 () Bool)

(assert (=> b!1132072 (= e!644271 e!644272)))

(declare-fun lt!502816 () (_ BitVec 64))

(assert (=> b!1132072 (= lt!502816 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!502818 () Unit!36912)

(assert (=> b!1132072 (= lt!502818 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!502816 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1132072 (arrayContainsKey!0 _keys!1208 lt!502816 #b00000000000000000000000000000000)))

(declare-fun lt!502817 () Unit!36912)

(assert (=> b!1132072 (= lt!502817 lt!502818)))

(declare-fun res!756127 () Bool)

(assert (=> b!1132072 (= res!756127 (= (seekEntryOrOpen!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9924 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1132072 (=> (not res!756127) (not e!644272))))

(declare-fun b!1132073 () Bool)

(assert (=> b!1132073 (= e!644272 call!48753)))

(declare-fun bm!48750 () Bool)

(assert (=> bm!48750 (= call!48753 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!131317 () Bool)

(declare-fun res!756126 () Bool)

(assert (=> d!131317 (=> res!756126 e!644270)))

(assert (=> d!131317 (= res!756126 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(assert (=> d!131317 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!644270)))

(assert (= (and d!131317 (not res!756126)) b!1132071))

(assert (= (and b!1132071 c!110331) b!1132072))

(assert (= (and b!1132071 (not c!110331)) b!1132070))

(assert (= (and b!1132072 res!756127) b!1132073))

(assert (= (or b!1132073 b!1132070) bm!48750))

(declare-fun m!1044785 () Bool)

(assert (=> b!1132071 m!1044785))

(assert (=> b!1132071 m!1044785))

(declare-fun m!1044787 () Bool)

(assert (=> b!1132071 m!1044787))

(assert (=> b!1132072 m!1044785))

(declare-fun m!1044789 () Bool)

(assert (=> b!1132072 m!1044789))

(declare-fun m!1044791 () Bool)

(assert (=> b!1132072 m!1044791))

(assert (=> b!1132072 m!1044785))

(declare-fun m!1044793 () Bool)

(assert (=> b!1132072 m!1044793))

(declare-fun m!1044795 () Bool)

(assert (=> bm!48750 m!1044795))

(assert (=> bm!48742 d!131317))

(declare-fun d!131319 () Bool)

(declare-fun e!644274 () Bool)

(assert (=> d!131319 e!644274))

(declare-fun res!756128 () Bool)

(assert (=> d!131319 (=> res!756128 e!644274)))

(declare-fun lt!502821 () Bool)

(assert (=> d!131319 (= res!756128 (not lt!502821))))

(declare-fun lt!502819 () Bool)

(assert (=> d!131319 (= lt!502821 lt!502819)))

(declare-fun lt!502822 () Unit!36912)

(declare-fun e!644273 () Unit!36912)

(assert (=> d!131319 (= lt!502822 e!644273)))

(declare-fun c!110332 () Bool)

(assert (=> d!131319 (= c!110332 lt!502819)))

(assert (=> d!131319 (= lt!502819 (containsKey!585 (toList!8048 lt!502626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131319 (= (contains!6500 lt!502626 #b0000000000000000000000000000000000000000000000000000000000000000) lt!502821)))

(declare-fun b!1132074 () Bool)

(declare-fun lt!502820 () Unit!36912)

(assert (=> b!1132074 (= e!644273 lt!502820)))

(assert (=> b!1132074 (= lt!502820 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132074 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132075 () Bool)

(declare-fun Unit!36938 () Unit!36912)

(assert (=> b!1132075 (= e!644273 Unit!36938)))

(declare-fun b!1132076 () Bool)

(assert (=> b!1132076 (= e!644274 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131319 c!110332) b!1132074))

(assert (= (and d!131319 (not c!110332)) b!1132075))

(assert (= (and d!131319 (not res!756128)) b!1132076))

(declare-fun m!1044797 () Bool)

(assert (=> d!131319 m!1044797))

(declare-fun m!1044799 () Bool)

(assert (=> b!1132074 m!1044799))

(declare-fun m!1044801 () Bool)

(assert (=> b!1132074 m!1044801))

(assert (=> b!1132074 m!1044801))

(declare-fun m!1044803 () Bool)

(assert (=> b!1132074 m!1044803))

(assert (=> b!1132076 m!1044801))

(assert (=> b!1132076 m!1044801))

(assert (=> b!1132076 m!1044803))

(assert (=> d!131165 d!131319))

(assert (=> d!131165 d!131183))

(declare-fun d!131321 () Bool)

(declare-fun c!110333 () Bool)

(assert (=> d!131321 (= c!110333 (and ((_ is Cons!24842) (toList!8048 lt!502611)) (= (_1!9059 (h!26051 (toList!8048 lt!502611))) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!644275 () Option!681)

(assert (=> d!131321 (= (getValueByKey!630 (toList!8048 lt!502611) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!644275)))

(declare-fun b!1132078 () Bool)

(declare-fun e!644276 () Option!681)

(assert (=> b!1132078 (= e!644275 e!644276)))

(declare-fun c!110334 () Bool)

(assert (=> b!1132078 (= c!110334 (and ((_ is Cons!24842) (toList!8048 lt!502611)) (not (= (_1!9059 (h!26051 (toList!8048 lt!502611))) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1132080 () Bool)

(assert (=> b!1132080 (= e!644276 None!679)))

(declare-fun b!1132077 () Bool)

(assert (=> b!1132077 (= e!644275 (Some!680 (_2!9059 (h!26051 (toList!8048 lt!502611)))))))

(declare-fun b!1132079 () Bool)

(assert (=> b!1132079 (= e!644276 (getValueByKey!630 (t!35764 (toList!8048 lt!502611)) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131321 c!110333) b!1132077))

(assert (= (and d!131321 (not c!110333)) b!1132078))

(assert (= (and b!1132078 c!110334) b!1132079))

(assert (= (and b!1132078 (not c!110334)) b!1132080))

(declare-fun m!1044805 () Bool)

(assert (=> b!1132079 m!1044805))

(assert (=> b!1131782 d!131321))

(declare-fun d!131323 () Bool)

(assert (=> d!131323 (= (validKeyInArray!0 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131800 d!131323))

(declare-fun d!131325 () Bool)

(declare-fun res!756129 () Bool)

(declare-fun e!644277 () Bool)

(assert (=> d!131325 (=> res!756129 e!644277)))

(assert (=> d!131325 (= res!756129 (= (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!131325 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) e!644277)))

(declare-fun b!1132081 () Bool)

(declare-fun e!644278 () Bool)

(assert (=> b!1132081 (= e!644277 e!644278)))

(declare-fun res!756130 () Bool)

(assert (=> b!1132081 (=> (not res!756130) (not e!644278))))

(assert (=> b!1132081 (= res!756130 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1132082 () Bool)

(assert (=> b!1132082 (= e!644278 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!131325 (not res!756129)) b!1132081))

(assert (= (and b!1132081 res!756130) b!1132082))

(assert (=> d!131325 m!1044503))

(declare-fun m!1044807 () Bool)

(assert (=> b!1132082 m!1044807))

(assert (=> b!1131820 d!131325))

(declare-fun d!131327 () Bool)

(assert (=> d!131327 (= (validKeyInArray!0 (select (arr!35508 _keys!1208) from!1455)) (and (not (= (select (arr!35508 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35508 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131725 d!131327))

(declare-fun d!131329 () Bool)

(declare-fun res!756135 () Bool)

(declare-fun e!644283 () Bool)

(assert (=> d!131329 (=> res!756135 e!644283)))

(assert (=> d!131329 (= res!756135 (and ((_ is Cons!24842) (toList!8048 (ite c!110181 lt!502440 call!48674))) (= (_1!9059 (h!26051 (toList!8048 (ite c!110181 lt!502440 call!48674)))) k0!934)))))

(assert (=> d!131329 (= (containsKey!585 (toList!8048 (ite c!110181 lt!502440 call!48674)) k0!934) e!644283)))

(declare-fun b!1132087 () Bool)

(declare-fun e!644284 () Bool)

(assert (=> b!1132087 (= e!644283 e!644284)))

(declare-fun res!756136 () Bool)

(assert (=> b!1132087 (=> (not res!756136) (not e!644284))))

(assert (=> b!1132087 (= res!756136 (and (or (not ((_ is Cons!24842) (toList!8048 (ite c!110181 lt!502440 call!48674)))) (bvsle (_1!9059 (h!26051 (toList!8048 (ite c!110181 lt!502440 call!48674)))) k0!934)) ((_ is Cons!24842) (toList!8048 (ite c!110181 lt!502440 call!48674))) (bvslt (_1!9059 (h!26051 (toList!8048 (ite c!110181 lt!502440 call!48674)))) k0!934)))))

(declare-fun b!1132088 () Bool)

(assert (=> b!1132088 (= e!644284 (containsKey!585 (t!35764 (toList!8048 (ite c!110181 lt!502440 call!48674))) k0!934))))

(assert (= (and d!131329 (not res!756135)) b!1132087))

(assert (= (and b!1132087 res!756136) b!1132088))

(declare-fun m!1044809 () Bool)

(assert (=> b!1132088 m!1044809))

(assert (=> d!131171 d!131329))

(assert (=> bm!48730 d!131255))

(assert (=> bm!48740 d!131257))

(declare-fun b!1132089 () Bool)

(declare-fun e!644288 () Bool)

(declare-fun e!644286 () Bool)

(assert (=> b!1132089 (= e!644288 e!644286)))

(declare-fun c!110335 () Bool)

(assert (=> b!1132089 (= c!110335 (validKeyInArray!0 (select (arr!35508 lt!502441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132090 () Bool)

(declare-fun e!644287 () Bool)

(assert (=> b!1132090 (= e!644287 (contains!6503 (ite c!110260 (Cons!24841 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) Nil!24842) Nil!24842) (select (arr!35508 lt!502441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132091 () Bool)

(declare-fun e!644285 () Bool)

(assert (=> b!1132091 (= e!644285 e!644288)))

(declare-fun res!756138 () Bool)

(assert (=> b!1132091 (=> (not res!756138) (not e!644288))))

(assert (=> b!1132091 (= res!756138 (not e!644287))))

(declare-fun res!756139 () Bool)

(assert (=> b!1132091 (=> (not res!756139) (not e!644287))))

(assert (=> b!1132091 (= res!756139 (validKeyInArray!0 (select (arr!35508 lt!502441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132092 () Bool)

(declare-fun call!48754 () Bool)

(assert (=> b!1132092 (= e!644286 call!48754)))

(declare-fun bm!48751 () Bool)

(assert (=> bm!48751 (= call!48754 (arrayNoDuplicates!0 lt!502441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!110335 (Cons!24841 (select (arr!35508 lt!502441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!110260 (Cons!24841 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) Nil!24842) Nil!24842)) (ite c!110260 (Cons!24841 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) Nil!24842) Nil!24842))))))

(declare-fun b!1132093 () Bool)

(assert (=> b!1132093 (= e!644286 call!48754)))

(declare-fun d!131331 () Bool)

(declare-fun res!756137 () Bool)

(assert (=> d!131331 (=> res!756137 e!644285)))

(assert (=> d!131331 (= res!756137 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36046 lt!502441)))))

(assert (=> d!131331 (= (arrayNoDuplicates!0 lt!502441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110260 (Cons!24841 (select (arr!35508 lt!502441) #b00000000000000000000000000000000) Nil!24842) Nil!24842)) e!644285)))

(assert (= (and d!131331 (not res!756137)) b!1132091))

(assert (= (and b!1132091 res!756139) b!1132090))

(assert (= (and b!1132091 res!756138) b!1132089))

(assert (= (and b!1132089 c!110335) b!1132093))

(assert (= (and b!1132089 (not c!110335)) b!1132092))

(assert (= (or b!1132093 b!1132092) bm!48751))

(assert (=> b!1132089 m!1044621))

(assert (=> b!1132089 m!1044621))

(assert (=> b!1132089 m!1044623))

(assert (=> b!1132090 m!1044621))

(assert (=> b!1132090 m!1044621))

(declare-fun m!1044811 () Bool)

(assert (=> b!1132090 m!1044811))

(assert (=> b!1132091 m!1044621))

(assert (=> b!1132091 m!1044621))

(assert (=> b!1132091 m!1044623))

(assert (=> bm!48751 m!1044621))

(declare-fun m!1044813 () Bool)

(assert (=> bm!48751 m!1044813))

(assert (=> bm!48743 d!131331))

(declare-fun d!131333 () Bool)

(declare-fun res!756140 () Bool)

(declare-fun e!644289 () Bool)

(assert (=> d!131333 (=> res!756140 e!644289)))

(assert (=> d!131333 (= res!756140 (and ((_ is Cons!24842) (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9059 (h!26051 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!131333 (= (containsKey!585 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!644289)))

(declare-fun b!1132094 () Bool)

(declare-fun e!644290 () Bool)

(assert (=> b!1132094 (= e!644289 e!644290)))

(declare-fun res!756141 () Bool)

(assert (=> b!1132094 (=> (not res!756141) (not e!644290))))

(assert (=> b!1132094 (= res!756141 (and (or (not ((_ is Cons!24842) (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (bvsle (_1!9059 (h!26051 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)) ((_ is Cons!24842) (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (bvslt (_1!9059 (h!26051 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(declare-fun b!1132095 () Bool)

(assert (=> b!1132095 (= e!644290 (containsKey!585 (t!35764 (toList!8048 (+!3486 lt!502440 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(assert (= (and d!131333 (not res!756140)) b!1132094))

(assert (= (and b!1132094 res!756141) b!1132095))

(declare-fun m!1044815 () Bool)

(assert (=> b!1132095 m!1044815))

(assert (=> d!131189 d!131333))

(assert (=> bm!48728 d!131265))

(declare-fun d!131335 () Bool)

(declare-fun e!644293 () Bool)

(assert (=> d!131335 e!644293))

(declare-fun c!110338 () Bool)

(assert (=> d!131335 (= c!110338 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!131335 true))

(declare-fun _$29!186 () Unit!36912)

(assert (=> d!131335 (= (choose!1783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$29!186)))

(declare-fun b!1132100 () Bool)

(assert (=> b!1132100 (= e!644293 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132101 () Bool)

(assert (=> b!1132101 (= e!644293 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131335 c!110338) b!1132100))

(assert (= (and d!131335 (not c!110338)) b!1132101))

(assert (=> b!1132100 m!1043881))

(assert (=> d!131179 d!131335))

(assert (=> d!131179 d!131183))

(declare-fun d!131337 () Bool)

(declare-fun e!644295 () Bool)

(assert (=> d!131337 e!644295))

(declare-fun res!756142 () Bool)

(assert (=> d!131337 (=> res!756142 e!644295)))

(declare-fun lt!502825 () Bool)

(assert (=> d!131337 (= res!756142 (not lt!502825))))

(declare-fun lt!502823 () Bool)

(assert (=> d!131337 (= lt!502825 lt!502823)))

(declare-fun lt!502826 () Unit!36912)

(declare-fun e!644294 () Unit!36912)

(assert (=> d!131337 (= lt!502826 e!644294)))

(declare-fun c!110339 () Bool)

(assert (=> d!131337 (= c!110339 lt!502823)))

(assert (=> d!131337 (= lt!502823 (containsKey!585 (toList!8048 lt!502653) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131337 (= (contains!6500 lt!502653 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!502825)))

(declare-fun b!1132102 () Bool)

(declare-fun lt!502824 () Unit!36912)

(assert (=> b!1132102 (= e!644294 lt!502824)))

(assert (=> b!1132102 (= lt!502824 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502653) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> b!1132102 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502653) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132103 () Bool)

(declare-fun Unit!36939 () Unit!36912)

(assert (=> b!1132103 (= e!644294 Unit!36939)))

(declare-fun b!1132104 () Bool)

(assert (=> b!1132104 (= e!644295 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502653) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131337 c!110339) b!1132102))

(assert (= (and d!131337 (not c!110339)) b!1132103))

(assert (= (and d!131337 (not res!756142)) b!1132104))

(declare-fun m!1044817 () Bool)

(assert (=> d!131337 m!1044817))

(declare-fun m!1044819 () Bool)

(assert (=> b!1132102 m!1044819))

(assert (=> b!1132102 m!1044297))

(assert (=> b!1132102 m!1044297))

(declare-fun m!1044821 () Bool)

(assert (=> b!1132102 m!1044821))

(assert (=> b!1132104 m!1044297))

(assert (=> b!1132104 m!1044297))

(assert (=> b!1132104 m!1044821))

(assert (=> d!131191 d!131337))

(declare-fun d!131339 () Bool)

(declare-fun c!110340 () Bool)

(assert (=> d!131339 (= c!110340 (and ((_ is Cons!24842) lt!502654) (= (_1!9059 (h!26051 lt!502654)) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!644296 () Option!681)

(assert (=> d!131339 (= (getValueByKey!630 lt!502654 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!644296)))

(declare-fun b!1132106 () Bool)

(declare-fun e!644297 () Option!681)

(assert (=> b!1132106 (= e!644296 e!644297)))

(declare-fun c!110341 () Bool)

(assert (=> b!1132106 (= c!110341 (and ((_ is Cons!24842) lt!502654) (not (= (_1!9059 (h!26051 lt!502654)) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1132108 () Bool)

(assert (=> b!1132108 (= e!644297 None!679)))

(declare-fun b!1132105 () Bool)

(assert (=> b!1132105 (= e!644296 (Some!680 (_2!9059 (h!26051 lt!502654))))))

(declare-fun b!1132107 () Bool)

(assert (=> b!1132107 (= e!644297 (getValueByKey!630 (t!35764 lt!502654) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131339 c!110340) b!1132105))

(assert (= (and d!131339 (not c!110340)) b!1132106))

(assert (= (and b!1132106 c!110341) b!1132107))

(assert (= (and b!1132106 (not c!110341)) b!1132108))

(declare-fun m!1044823 () Bool)

(assert (=> b!1132107 m!1044823))

(assert (=> d!131191 d!131339))

(declare-fun d!131341 () Bool)

(assert (=> d!131341 (= (getValueByKey!630 lt!502654 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!680 (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!502829 () Unit!36912)

(declare-fun choose!1787 (List!24846 (_ BitVec 64) V!43081) Unit!36912)

(assert (=> d!131341 (= lt!502829 (choose!1787 lt!502654 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!644300 () Bool)

(assert (=> d!131341 e!644300))

(declare-fun res!756147 () Bool)

(assert (=> d!131341 (=> (not res!756147) (not e!644300))))

(assert (=> d!131341 (= res!756147 (isStrictlySorted!723 lt!502654))))

(assert (=> d!131341 (= (lemmaContainsTupThenGetReturnValue!306 lt!502654 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!502829)))

(declare-fun b!1132113 () Bool)

(declare-fun res!756148 () Bool)

(assert (=> b!1132113 (=> (not res!756148) (not e!644300))))

(assert (=> b!1132113 (= res!756148 (containsKey!585 lt!502654 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132114 () Bool)

(assert (=> b!1132114 (= e!644300 (contains!6504 lt!502654 (tuple2!18097 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131341 res!756147) b!1132113))

(assert (= (and b!1132113 res!756148) b!1132114))

(assert (=> d!131341 m!1044291))

(declare-fun m!1044825 () Bool)

(assert (=> d!131341 m!1044825))

(declare-fun m!1044827 () Bool)

(assert (=> d!131341 m!1044827))

(declare-fun m!1044829 () Bool)

(assert (=> b!1132113 m!1044829))

(declare-fun m!1044831 () Bool)

(assert (=> b!1132114 m!1044831))

(assert (=> d!131191 d!131341))

(declare-fun b!1132135 () Bool)

(declare-fun c!110350 () Bool)

(assert (=> b!1132135 (= c!110350 (and ((_ is Cons!24842) (toList!8048 lt!502440)) (bvsgt (_1!9059 (h!26051 (toList!8048 lt!502440))) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!644315 () List!24846)

(declare-fun e!644313 () List!24846)

(assert (=> b!1132135 (= e!644315 e!644313)))

(declare-fun b!1132136 () Bool)

(declare-fun call!48762 () List!24846)

(assert (=> b!1132136 (= e!644313 call!48762)))

(declare-fun b!1132137 () Bool)

(declare-fun e!644314 () List!24846)

(declare-fun call!48763 () List!24846)

(assert (=> b!1132137 (= e!644314 call!48763)))

(declare-fun b!1132138 () Bool)

(declare-fun res!756153 () Bool)

(declare-fun e!644311 () Bool)

(assert (=> b!1132138 (=> (not res!756153) (not e!644311))))

(declare-fun lt!502832 () List!24846)

(assert (=> b!1132138 (= res!756153 (containsKey!585 lt!502832 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!48758 () Bool)

(declare-fun call!48761 () List!24846)

(assert (=> bm!48758 (= call!48761 call!48763)))

(declare-fun bm!48759 () Bool)

(assert (=> bm!48759 (= call!48762 call!48761)))

(declare-fun b!1132139 () Bool)

(assert (=> b!1132139 (= e!644315 call!48761)))

(declare-fun b!1132140 () Bool)

(assert (=> b!1132140 (= e!644313 call!48762)))

(declare-fun d!131343 () Bool)

(assert (=> d!131343 e!644311))

(declare-fun res!756154 () Bool)

(assert (=> d!131343 (=> (not res!756154) (not e!644311))))

(assert (=> d!131343 (= res!756154 (isStrictlySorted!723 lt!502832))))

(assert (=> d!131343 (= lt!502832 e!644314)))

(declare-fun c!110351 () Bool)

(assert (=> d!131343 (= c!110351 (and ((_ is Cons!24842) (toList!8048 lt!502440)) (bvslt (_1!9059 (h!26051 (toList!8048 lt!502440))) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131343 (isStrictlySorted!723 (toList!8048 lt!502440))))

(assert (=> d!131343 (= (insertStrictlySorted!399 (toList!8048 lt!502440) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!502832)))

(declare-fun c!110352 () Bool)

(declare-fun e!644312 () List!24846)

(declare-fun b!1132141 () Bool)

(assert (=> b!1132141 (= e!644312 (ite c!110352 (t!35764 (toList!8048 lt!502440)) (ite c!110350 (Cons!24842 (h!26051 (toList!8048 lt!502440)) (t!35764 (toList!8048 lt!502440))) Nil!24843)))))

(declare-fun b!1132142 () Bool)

(assert (=> b!1132142 (= e!644312 (insertStrictlySorted!399 (t!35764 (toList!8048 lt!502440)) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132143 () Bool)

(assert (=> b!1132143 (= e!644311 (contains!6504 lt!502832 (tuple2!18097 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!48760 () Bool)

(assert (=> bm!48760 (= call!48763 ($colon$colon!610 e!644312 (ite c!110351 (h!26051 (toList!8048 lt!502440)) (tuple2!18097 (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!110353 () Bool)

(assert (=> bm!48760 (= c!110353 c!110351)))

(declare-fun b!1132144 () Bool)

(assert (=> b!1132144 (= e!644314 e!644315)))

(assert (=> b!1132144 (= c!110352 (and ((_ is Cons!24842) (toList!8048 lt!502440)) (= (_1!9059 (h!26051 (toList!8048 lt!502440))) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131343 c!110351) b!1132137))

(assert (= (and d!131343 (not c!110351)) b!1132144))

(assert (= (and b!1132144 c!110352) b!1132139))

(assert (= (and b!1132144 (not c!110352)) b!1132135))

(assert (= (and b!1132135 c!110350) b!1132136))

(assert (= (and b!1132135 (not c!110350)) b!1132140))

(assert (= (or b!1132136 b!1132140) bm!48759))

(assert (= (or b!1132139 bm!48759) bm!48758))

(assert (= (or b!1132137 bm!48758) bm!48760))

(assert (= (and bm!48760 c!110353) b!1132142))

(assert (= (and bm!48760 (not c!110353)) b!1132141))

(assert (= (and d!131343 res!756154) b!1132138))

(assert (= (and b!1132138 res!756153) b!1132143))

(declare-fun m!1044833 () Bool)

(assert (=> b!1132142 m!1044833))

(declare-fun m!1044835 () Bool)

(assert (=> b!1132138 m!1044835))

(declare-fun m!1044837 () Bool)

(assert (=> bm!48760 m!1044837))

(declare-fun m!1044839 () Bool)

(assert (=> b!1132143 m!1044839))

(declare-fun m!1044841 () Bool)

(assert (=> d!131343 m!1044841))

(declare-fun m!1044843 () Bool)

(assert (=> d!131343 m!1044843))

(assert (=> d!131191 d!131343))

(declare-fun d!131345 () Bool)

(assert (=> d!131345 (= (validKeyInArray!0 (select (arr!35508 lt!502441) #b00000000000000000000000000000000)) (and (not (= (select (arr!35508 lt!502441) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35508 lt!502441) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131831 d!131345))

(assert (=> b!1131804 d!131323))

(declare-fun d!131347 () Bool)

(declare-fun e!644317 () Bool)

(assert (=> d!131347 e!644317))

(declare-fun res!756155 () Bool)

(assert (=> d!131347 (=> res!756155 e!644317)))

(declare-fun lt!502835 () Bool)

(assert (=> d!131347 (= res!756155 (not lt!502835))))

(declare-fun lt!502833 () Bool)

(assert (=> d!131347 (= lt!502835 lt!502833)))

(declare-fun lt!502836 () Unit!36912)

(declare-fun e!644316 () Unit!36912)

(assert (=> d!131347 (= lt!502836 e!644316)))

(declare-fun c!110354 () Bool)

(assert (=> d!131347 (= c!110354 lt!502833)))

(assert (=> d!131347 (= lt!502833 (containsKey!585 (toList!8048 lt!502597) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131347 (= (contains!6500 lt!502597 #b0000000000000000000000000000000000000000000000000000000000000000) lt!502835)))

(declare-fun b!1132145 () Bool)

(declare-fun lt!502834 () Unit!36912)

(assert (=> b!1132145 (= e!644316 lt!502834)))

(assert (=> b!1132145 (= lt!502834 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502597) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132145 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502597) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132146 () Bool)

(declare-fun Unit!36940 () Unit!36912)

(assert (=> b!1132146 (= e!644316 Unit!36940)))

(declare-fun b!1132147 () Bool)

(assert (=> b!1132147 (= e!644317 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502597) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131347 c!110354) b!1132145))

(assert (= (and d!131347 (not c!110354)) b!1132146))

(assert (= (and d!131347 (not res!756155)) b!1132147))

(declare-fun m!1044845 () Bool)

(assert (=> d!131347 m!1044845))

(declare-fun m!1044847 () Bool)

(assert (=> b!1132145 m!1044847))

(declare-fun m!1044849 () Bool)

(assert (=> b!1132145 m!1044849))

(assert (=> b!1132145 m!1044849))

(declare-fun m!1044851 () Bool)

(assert (=> b!1132145 m!1044851))

(assert (=> b!1132147 m!1044849))

(assert (=> b!1132147 m!1044849))

(assert (=> b!1132147 m!1044851))

(assert (=> d!131149 d!131347))

(assert (=> d!131149 d!131183))

(declare-fun d!131349 () Bool)

(declare-fun e!644319 () Bool)

(assert (=> d!131349 e!644319))

(declare-fun res!756156 () Bool)

(assert (=> d!131349 (=> res!756156 e!644319)))

(declare-fun lt!502839 () Bool)

(assert (=> d!131349 (= res!756156 (not lt!502839))))

(declare-fun lt!502837 () Bool)

(assert (=> d!131349 (= lt!502839 lt!502837)))

(declare-fun lt!502840 () Unit!36912)

(declare-fun e!644318 () Unit!36912)

(assert (=> d!131349 (= lt!502840 e!644318)))

(declare-fun c!110355 () Bool)

(assert (=> d!131349 (= c!110355 lt!502837)))

(assert (=> d!131349 (= lt!502837 (containsKey!585 (toList!8048 lt!502619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131349 (= (contains!6500 lt!502619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!502839)))

(declare-fun b!1132148 () Bool)

(declare-fun lt!502838 () Unit!36912)

(assert (=> b!1132148 (= e!644318 lt!502838)))

(assert (=> b!1132148 (= lt!502838 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1132148 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1132149 () Bool)

(declare-fun Unit!36941 () Unit!36912)

(assert (=> b!1132149 (= e!644318 Unit!36941)))

(declare-fun b!1132150 () Bool)

(assert (=> b!1132150 (= e!644319 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502619) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131349 c!110355) b!1132148))

(assert (= (and d!131349 (not c!110355)) b!1132149))

(assert (= (and d!131349 (not res!756156)) b!1132150))

(declare-fun m!1044853 () Bool)

(assert (=> d!131349 m!1044853))

(declare-fun m!1044855 () Bool)

(assert (=> b!1132148 m!1044855))

(declare-fun m!1044857 () Bool)

(assert (=> b!1132148 m!1044857))

(assert (=> b!1132148 m!1044857))

(declare-fun m!1044859 () Bool)

(assert (=> b!1132148 m!1044859))

(assert (=> b!1132150 m!1044857))

(assert (=> b!1132150 m!1044857))

(assert (=> b!1132150 m!1044859))

(assert (=> d!131163 d!131349))

(assert (=> d!131163 d!131183))

(assert (=> b!1131829 d!131345))

(assert (=> b!1131729 d!131327))

(declare-fun d!131351 () Bool)

(declare-fun e!644321 () Bool)

(assert (=> d!131351 e!644321))

(declare-fun res!756157 () Bool)

(assert (=> d!131351 (=> res!756157 e!644321)))

(declare-fun lt!502843 () Bool)

(assert (=> d!131351 (= res!756157 (not lt!502843))))

(declare-fun lt!502841 () Bool)

(assert (=> d!131351 (= lt!502843 lt!502841)))

(declare-fun lt!502844 () Unit!36912)

(declare-fun e!644320 () Unit!36912)

(assert (=> d!131351 (= lt!502844 e!644320)))

(declare-fun c!110356 () Bool)

(assert (=> d!131351 (= c!110356 lt!502841)))

(assert (=> d!131351 (= lt!502841 (containsKey!585 (toList!8048 lt!502611) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131351 (= (contains!6500 lt!502611 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!502843)))

(declare-fun b!1132151 () Bool)

(declare-fun lt!502842 () Unit!36912)

(assert (=> b!1132151 (= e!644320 lt!502842)))

(assert (=> b!1132151 (= lt!502842 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502611) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1132151 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502611) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132152 () Bool)

(declare-fun Unit!36942 () Unit!36912)

(assert (=> b!1132152 (= e!644320 Unit!36942)))

(declare-fun b!1132153 () Bool)

(assert (=> b!1132153 (= e!644321 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502611) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!131351 c!110356) b!1132151))

(assert (= (and d!131351 (not c!110356)) b!1132152))

(assert (= (and d!131351 (not res!756157)) b!1132153))

(declare-fun m!1044861 () Bool)

(assert (=> d!131351 m!1044861))

(declare-fun m!1044863 () Bool)

(assert (=> b!1132151 m!1044863))

(assert (=> b!1132151 m!1044175))

(assert (=> b!1132151 m!1044175))

(declare-fun m!1044865 () Bool)

(assert (=> b!1132151 m!1044865))

(assert (=> b!1132153 m!1044175))

(assert (=> b!1132153 m!1044175))

(assert (=> b!1132153 m!1044865))

(assert (=> d!131157 d!131351))

(declare-fun c!110357 () Bool)

(declare-fun d!131353 () Bool)

(assert (=> d!131353 (= c!110357 (and ((_ is Cons!24842) lt!502612) (= (_1!9059 (h!26051 lt!502612)) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!644322 () Option!681)

(assert (=> d!131353 (= (getValueByKey!630 lt!502612 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!644322)))

(declare-fun b!1132155 () Bool)

(declare-fun e!644323 () Option!681)

(assert (=> b!1132155 (= e!644322 e!644323)))

(declare-fun c!110358 () Bool)

(assert (=> b!1132155 (= c!110358 (and ((_ is Cons!24842) lt!502612) (not (= (_1!9059 (h!26051 lt!502612)) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1132157 () Bool)

(assert (=> b!1132157 (= e!644323 None!679)))

(declare-fun b!1132154 () Bool)

(assert (=> b!1132154 (= e!644322 (Some!680 (_2!9059 (h!26051 lt!502612))))))

(declare-fun b!1132156 () Bool)

(assert (=> b!1132156 (= e!644323 (getValueByKey!630 (t!35764 lt!502612) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131353 c!110357) b!1132154))

(assert (= (and d!131353 (not c!110357)) b!1132155))

(assert (= (and b!1132155 c!110358) b!1132156))

(assert (= (and b!1132155 (not c!110358)) b!1132157))

(declare-fun m!1044867 () Bool)

(assert (=> b!1132156 m!1044867))

(assert (=> d!131157 d!131353))

(declare-fun d!131355 () Bool)

(assert (=> d!131355 (= (getValueByKey!630 lt!502612 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!680 (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!502845 () Unit!36912)

(assert (=> d!131355 (= lt!502845 (choose!1787 lt!502612 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!644324 () Bool)

(assert (=> d!131355 e!644324))

(declare-fun res!756158 () Bool)

(assert (=> d!131355 (=> (not res!756158) (not e!644324))))

(assert (=> d!131355 (= res!756158 (isStrictlySorted!723 lt!502612))))

(assert (=> d!131355 (= (lemmaContainsTupThenGetReturnValue!306 lt!502612 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!502845)))

(declare-fun b!1132158 () Bool)

(declare-fun res!756159 () Bool)

(assert (=> b!1132158 (=> (not res!756159) (not e!644324))))

(assert (=> b!1132158 (= res!756159 (containsKey!585 lt!502612 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132159 () Bool)

(assert (=> b!1132159 (= e!644324 (contains!6504 lt!502612 (tuple2!18097 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!131355 res!756158) b!1132158))

(assert (= (and b!1132158 res!756159) b!1132159))

(assert (=> d!131355 m!1044169))

(declare-fun m!1044869 () Bool)

(assert (=> d!131355 m!1044869))

(declare-fun m!1044871 () Bool)

(assert (=> d!131355 m!1044871))

(declare-fun m!1044873 () Bool)

(assert (=> b!1132158 m!1044873))

(declare-fun m!1044875 () Bool)

(assert (=> b!1132159 m!1044875))

(assert (=> d!131157 d!131355))

(declare-fun c!110359 () Bool)

(declare-fun b!1132160 () Bool)

(assert (=> b!1132160 (= c!110359 (and ((_ is Cons!24842) (toList!8048 lt!502448)) (bvsgt (_1!9059 (h!26051 (toList!8048 lt!502448))) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!644329 () List!24846)

(declare-fun e!644327 () List!24846)

(assert (=> b!1132160 (= e!644329 e!644327)))

(declare-fun b!1132161 () Bool)

(declare-fun call!48765 () List!24846)

(assert (=> b!1132161 (= e!644327 call!48765)))

(declare-fun b!1132162 () Bool)

(declare-fun e!644328 () List!24846)

(declare-fun call!48766 () List!24846)

(assert (=> b!1132162 (= e!644328 call!48766)))

(declare-fun b!1132163 () Bool)

(declare-fun res!756160 () Bool)

(declare-fun e!644325 () Bool)

(assert (=> b!1132163 (=> (not res!756160) (not e!644325))))

(declare-fun lt!502846 () List!24846)

(assert (=> b!1132163 (= res!756160 (containsKey!585 lt!502846 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!48761 () Bool)

(declare-fun call!48764 () List!24846)

(assert (=> bm!48761 (= call!48764 call!48766)))

(declare-fun bm!48762 () Bool)

(assert (=> bm!48762 (= call!48765 call!48764)))

(declare-fun b!1132164 () Bool)

(assert (=> b!1132164 (= e!644329 call!48764)))

(declare-fun b!1132165 () Bool)

(assert (=> b!1132165 (= e!644327 call!48765)))

(declare-fun d!131357 () Bool)

(assert (=> d!131357 e!644325))

(declare-fun res!756161 () Bool)

(assert (=> d!131357 (=> (not res!756161) (not e!644325))))

(assert (=> d!131357 (= res!756161 (isStrictlySorted!723 lt!502846))))

(assert (=> d!131357 (= lt!502846 e!644328)))

(declare-fun c!110360 () Bool)

(assert (=> d!131357 (= c!110360 (and ((_ is Cons!24842) (toList!8048 lt!502448)) (bvslt (_1!9059 (h!26051 (toList!8048 lt!502448))) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!131357 (isStrictlySorted!723 (toList!8048 lt!502448))))

(assert (=> d!131357 (= (insertStrictlySorted!399 (toList!8048 lt!502448) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!502846)))

(declare-fun c!110361 () Bool)

(declare-fun b!1132166 () Bool)

(declare-fun e!644326 () List!24846)

(assert (=> b!1132166 (= e!644326 (ite c!110361 (t!35764 (toList!8048 lt!502448)) (ite c!110359 (Cons!24842 (h!26051 (toList!8048 lt!502448)) (t!35764 (toList!8048 lt!502448))) Nil!24843)))))

(declare-fun b!1132167 () Bool)

(assert (=> b!1132167 (= e!644326 (insertStrictlySorted!399 (t!35764 (toList!8048 lt!502448)) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132168 () Bool)

(assert (=> b!1132168 (= e!644325 (contains!6504 lt!502846 (tuple2!18097 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun bm!48763 () Bool)

(assert (=> bm!48763 (= call!48766 ($colon$colon!610 e!644326 (ite c!110360 (h!26051 (toList!8048 lt!502448)) (tuple2!18097 (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!110362 () Bool)

(assert (=> bm!48763 (= c!110362 c!110360)))

(declare-fun b!1132169 () Bool)

(assert (=> b!1132169 (= e!644328 e!644329)))

(assert (=> b!1132169 (= c!110361 (and ((_ is Cons!24842) (toList!8048 lt!502448)) (= (_1!9059 (h!26051 (toList!8048 lt!502448))) (_1!9059 (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!131357 c!110360) b!1132162))

(assert (= (and d!131357 (not c!110360)) b!1132169))

(assert (= (and b!1132169 c!110361) b!1132164))

(assert (= (and b!1132169 (not c!110361)) b!1132160))

(assert (= (and b!1132160 c!110359) b!1132161))

(assert (= (and b!1132160 (not c!110359)) b!1132165))

(assert (= (or b!1132161 b!1132165) bm!48762))

(assert (= (or b!1132164 bm!48762) bm!48761))

(assert (= (or b!1132162 bm!48761) bm!48763))

(assert (= (and bm!48763 c!110362) b!1132167))

(assert (= (and bm!48763 (not c!110362)) b!1132166))

(assert (= (and d!131357 res!756161) b!1132163))

(assert (= (and b!1132163 res!756160) b!1132168))

(declare-fun m!1044877 () Bool)

(assert (=> b!1132167 m!1044877))

(declare-fun m!1044879 () Bool)

(assert (=> b!1132163 m!1044879))

(declare-fun m!1044881 () Bool)

(assert (=> bm!48763 m!1044881))

(declare-fun m!1044883 () Bool)

(assert (=> b!1132168 m!1044883))

(declare-fun m!1044885 () Bool)

(assert (=> d!131357 m!1044885))

(assert (=> d!131357 m!1044489))

(assert (=> d!131157 d!131357))

(declare-fun d!131359 () Bool)

(assert (=> d!131359 (= (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131746 d!131359))

(declare-fun d!131361 () Bool)

(assert (=> d!131361 (= (validKeyInArray!0 (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35508 (ite c!110180 lt!502441 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131788 d!131361))

(assert (=> b!1131682 d!131345))

(declare-fun d!131363 () Bool)

(assert (=> d!131363 (= (validKeyInArray!0 (select (arr!35508 lt!502441) from!1455)) (and (not (= (select (arr!35508 lt!502441) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35508 lt!502441) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131713 d!131363))

(declare-fun call!48772 () ListLongMap!16065)

(declare-fun bm!48769 () Bool)

(assert (=> bm!48769 (= call!48772 (getCurrentListMapNoExtraKeys!4547 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)) (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48768 () Bool)

(declare-fun call!48771 () ListLongMap!16065)

(assert (=> bm!48768 (= call!48771 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!644332 () Bool)

(declare-fun b!1132174 () Bool)

(assert (=> b!1132174 (= e!644332 (= call!48772 (-!1153 call!48771 k0!934)))))

(declare-fun b!1132175 () Bool)

(assert (=> b!1132175 (= e!644332 (= call!48772 call!48771))))

(declare-fun d!131365 () Bool)

(assert (=> d!131365 e!644332))

(declare-fun c!110365 () Bool)

(assert (=> d!131365 (= c!110365 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!131365 true))

(declare-fun _$12!462 () Unit!36912)

(assert (=> d!131365 (= (choose!1782 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!462)))

(assert (= (and d!131365 c!110365) b!1132174))

(assert (= (and d!131365 (not c!110365)) b!1132175))

(assert (= (or b!1132174 b!1132175) bm!48768))

(assert (= (or b!1132174 b!1132175) bm!48769))

(declare-fun b_lambda!18959 () Bool)

(assert (=> (not b_lambda!18959) (not bm!48769)))

(assert (=> bm!48769 t!35762))

(declare-fun b_and!38685 () Bool)

(assert (= b_and!38683 (and (=> t!35762 result!18047) b_and!38685)))

(assert (=> bm!48769 m!1043879))

(assert (=> bm!48769 m!1043919))

(assert (=> bm!48769 m!1043921))

(assert (=> bm!48769 m!1044165))

(assert (=> bm!48768 m!1043901))

(declare-fun m!1044887 () Bool)

(assert (=> b!1132174 m!1044887))

(assert (=> d!131153 d!131365))

(declare-fun d!131367 () Bool)

(declare-fun res!756162 () Bool)

(declare-fun e!644333 () Bool)

(assert (=> d!131367 (=> res!756162 e!644333)))

(assert (=> d!131367 (= res!756162 (= (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!131367 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!644333)))

(declare-fun b!1132176 () Bool)

(declare-fun e!644334 () Bool)

(assert (=> b!1132176 (= e!644333 e!644334)))

(declare-fun res!756163 () Bool)

(assert (=> b!1132176 (=> (not res!756163) (not e!644334))))

(assert (=> b!1132176 (= res!756163 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(declare-fun b!1132177 () Bool)

(assert (=> b!1132177 (= e!644334 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!131367 (not res!756162)) b!1132176))

(assert (= (and b!1132176 res!756163) b!1132177))

(assert (=> d!131367 m!1044785))

(declare-fun m!1044889 () Bool)

(assert (=> b!1132177 m!1044889))

(assert (=> b!1131822 d!131367))

(assert (=> b!1131827 d!131173))

(declare-fun d!131369 () Bool)

(assert (=> d!131369 (= (apply!948 lt!502626 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18069 (getValueByKey!630 (toList!8048 lt!502626) (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32946 () Bool)

(assert (= bs!32946 d!131369))

(assert (=> bs!32946 m!1044207))

(declare-fun m!1044891 () Bool)

(assert (=> bs!32946 m!1044891))

(assert (=> bs!32946 m!1044891))

(declare-fun m!1044893 () Bool)

(assert (=> bs!32946 m!1044893))

(assert (=> b!1131797 d!131369))

(declare-fun d!131371 () Bool)

(declare-fun c!110366 () Bool)

(assert (=> d!131371 (= c!110366 ((_ is ValueCellFull!13523) (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!644335 () V!43081)

(assert (=> d!131371 (= (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644335)))

(declare-fun b!1132178 () Bool)

(assert (=> b!1132178 (= e!644335 (get!18070 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132179 () Bool)

(assert (=> b!1132179 (= e!644335 (get!18071 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131371 c!110366) b!1132178))

(assert (= (and d!131371 (not c!110366)) b!1132179))

(assert (=> b!1132178 m!1044219))

(assert (=> b!1132178 m!1043919))

(declare-fun m!1044895 () Bool)

(assert (=> b!1132178 m!1044895))

(assert (=> b!1132179 m!1044219))

(assert (=> b!1132179 m!1043919))

(declare-fun m!1044897 () Bool)

(assert (=> b!1132179 m!1044897))

(assert (=> b!1131797 d!131371))

(declare-fun d!131373 () Bool)

(assert (=> d!131373 (= (validKeyInArray!0 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1131766 d!131373))

(declare-fun d!131375 () Bool)

(assert (=> d!131375 (= (apply!948 lt!502578 (select (arr!35508 _keys!1208) from!1455)) (get!18069 (getValueByKey!630 (toList!8048 lt!502578) (select (arr!35508 _keys!1208) from!1455))))))

(declare-fun bs!32947 () Bool)

(assert (= bs!32947 d!131375))

(assert (=> bs!32947 m!1043909))

(declare-fun m!1044899 () Bool)

(assert (=> bs!32947 m!1044899))

(assert (=> bs!32947 m!1044899))

(declare-fun m!1044901 () Bool)

(assert (=> bs!32947 m!1044901))

(assert (=> b!1131722 d!131375))

(declare-fun d!131377 () Bool)

(declare-fun c!110367 () Bool)

(assert (=> d!131377 (= c!110367 ((_ is ValueCellFull!13523) (select (arr!35509 _values!996) from!1455)))))

(declare-fun e!644336 () V!43081)

(assert (=> d!131377 (= (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!644336)))

(declare-fun b!1132180 () Bool)

(assert (=> b!1132180 (= e!644336 (get!18070 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132181 () Bool)

(assert (=> b!1132181 (= e!644336 (get!18071 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131377 c!110367) b!1132180))

(assert (= (and d!131377 (not c!110367)) b!1132181))

(assert (=> b!1132180 m!1044101))

(assert (=> b!1132180 m!1043919))

(declare-fun m!1044903 () Bool)

(assert (=> b!1132180 m!1044903))

(assert (=> b!1132181 m!1044101))

(assert (=> b!1132181 m!1043919))

(declare-fun m!1044905 () Bool)

(assert (=> b!1132181 m!1044905))

(assert (=> b!1131722 d!131377))

(declare-fun b!1132182 () Bool)

(declare-fun lt!502847 () Unit!36912)

(declare-fun lt!502850 () Unit!36912)

(assert (=> b!1132182 (= lt!502847 lt!502850)))

(declare-fun lt!502849 () (_ BitVec 64))

(declare-fun lt!502853 () V!43081)

(declare-fun lt!502848 () (_ BitVec 64))

(declare-fun lt!502851 () ListLongMap!16065)

(assert (=> b!1132182 (not (contains!6500 (+!3486 lt!502851 (tuple2!18097 lt!502848 lt!502853)) lt!502849))))

(assert (=> b!1132182 (= lt!502850 (addStillNotContains!284 lt!502851 lt!502848 lt!502853 lt!502849))))

(assert (=> b!1132182 (= lt!502849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132182 (= lt!502853 (get!18068 (select (arr!35509 (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132182 (= lt!502848 (select (arr!35508 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48773 () ListLongMap!16065)

(assert (=> b!1132182 (= lt!502851 call!48773)))

(declare-fun e!644339 () ListLongMap!16065)

(assert (=> b!1132182 (= e!644339 (+!3486 call!48773 (tuple2!18097 (select (arr!35508 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!48770 () Bool)

(assert (=> bm!48770 (= call!48773 (getCurrentListMapNoExtraKeys!4547 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)) (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132183 () Bool)

(assert (=> b!1132183 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))))

(assert (=> b!1132183 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36047 (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)))))))

(declare-fun lt!502852 () ListLongMap!16065)

(declare-fun e!644341 () Bool)

(assert (=> b!1132183 (= e!644341 (= (apply!948 lt!502852 (select (arr!35508 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18068 (select (arr!35509 (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131379 () Bool)

(declare-fun e!644340 () Bool)

(assert (=> d!131379 e!644340))

(declare-fun res!756164 () Bool)

(assert (=> d!131379 (=> (not res!756164) (not e!644340))))

(assert (=> d!131379 (= res!756164 (not (contains!6500 lt!502852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644338 () ListLongMap!16065)

(assert (=> d!131379 (= lt!502852 e!644338)))

(declare-fun c!110369 () Bool)

(assert (=> d!131379 (= c!110369 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))))

(assert (=> d!131379 (validMask!0 mask!1564)))

(assert (=> d!131379 (= (getCurrentListMapNoExtraKeys!4547 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)) (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!502852)))

(declare-fun b!1132184 () Bool)

(declare-fun e!644337 () Bool)

(declare-fun e!644343 () Bool)

(assert (=> b!1132184 (= e!644337 e!644343)))

(declare-fun c!110370 () Bool)

(assert (=> b!1132184 (= c!110370 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))))

(declare-fun b!1132185 () Bool)

(assert (=> b!1132185 (= e!644337 e!644341)))

(assert (=> b!1132185 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))))

(declare-fun res!756167 () Bool)

(assert (=> b!1132185 (= res!756167 (contains!6500 lt!502852 (select (arr!35508 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132185 (=> (not res!756167) (not e!644341))))

(declare-fun b!1132186 () Bool)

(assert (=> b!1132186 (= e!644338 e!644339)))

(declare-fun c!110368 () Bool)

(assert (=> b!1132186 (= c!110368 (validKeyInArray!0 (select (arr!35508 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132187 () Bool)

(assert (=> b!1132187 (= e!644343 (= lt!502852 (getCurrentListMapNoExtraKeys!4547 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)) (array!73713 (store (arr!35509 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132188 () Bool)

(assert (=> b!1132188 (= e!644338 (ListLongMap!16066 Nil!24843))))

(declare-fun b!1132189 () Bool)

(assert (=> b!1132189 (= e!644340 e!644337)))

(declare-fun c!110371 () Bool)

(declare-fun e!644342 () Bool)

(assert (=> b!1132189 (= c!110371 e!644342)))

(declare-fun res!756166 () Bool)

(assert (=> b!1132189 (=> (not res!756166) (not e!644342))))

(assert (=> b!1132189 (= res!756166 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))))

(declare-fun b!1132190 () Bool)

(assert (=> b!1132190 (= e!644342 (validKeyInArray!0 (select (arr!35508 (array!73711 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132190 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1132191 () Bool)

(assert (=> b!1132191 (= e!644343 (isEmpty!978 lt!502852))))

(declare-fun b!1132192 () Bool)

(assert (=> b!1132192 (= e!644339 call!48773)))

(declare-fun b!1132193 () Bool)

(declare-fun res!756165 () Bool)

(assert (=> b!1132193 (=> (not res!756165) (not e!644340))))

(assert (=> b!1132193 (= res!756165 (not (contains!6500 lt!502852 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131379 c!110369) b!1132188))

(assert (= (and d!131379 (not c!110369)) b!1132186))

(assert (= (and b!1132186 c!110368) b!1132182))

(assert (= (and b!1132186 (not c!110368)) b!1132192))

(assert (= (or b!1132182 b!1132192) bm!48770))

(assert (= (and d!131379 res!756164) b!1132193))

(assert (= (and b!1132193 res!756165) b!1132189))

(assert (= (and b!1132189 res!756166) b!1132190))

(assert (= (and b!1132189 c!110371) b!1132185))

(assert (= (and b!1132189 (not c!110371)) b!1132184))

(assert (= (and b!1132185 res!756167) b!1132183))

(assert (= (and b!1132184 c!110370) b!1132187))

(assert (= (and b!1132184 (not c!110370)) b!1132191))

(declare-fun b_lambda!18961 () Bool)

(assert (=> (not b_lambda!18961) (not b!1132182)))

(assert (=> b!1132182 t!35762))

(declare-fun b_and!38687 () Bool)

(assert (= b_and!38685 (and (=> t!35762 result!18047) b_and!38687)))

(declare-fun b_lambda!18963 () Bool)

(assert (=> (not b_lambda!18963) (not b!1132183)))

(assert (=> b!1132183 t!35762))

(declare-fun b_and!38689 () Bool)

(assert (= b_and!38687 (and (=> t!35762 result!18047) b_and!38689)))

(declare-fun m!1044907 () Bool)

(assert (=> b!1132185 m!1044907))

(assert (=> b!1132185 m!1044907))

(declare-fun m!1044909 () Bool)

(assert (=> b!1132185 m!1044909))

(declare-fun m!1044911 () Bool)

(assert (=> bm!48770 m!1044911))

(assert (=> b!1132182 m!1043919))

(declare-fun m!1044913 () Bool)

(assert (=> b!1132182 m!1044913))

(assert (=> b!1132182 m!1044907))

(declare-fun m!1044915 () Bool)

(assert (=> b!1132182 m!1044915))

(declare-fun m!1044917 () Bool)

(assert (=> b!1132182 m!1044917))

(declare-fun m!1044919 () Bool)

(assert (=> b!1132182 m!1044919))

(assert (=> b!1132182 m!1044917))

(declare-fun m!1044921 () Bool)

(assert (=> b!1132182 m!1044921))

(assert (=> b!1132182 m!1044919))

(assert (=> b!1132182 m!1043919))

(declare-fun m!1044923 () Bool)

(assert (=> b!1132182 m!1044923))

(assert (=> b!1132190 m!1044907))

(assert (=> b!1132190 m!1044907))

(declare-fun m!1044925 () Bool)

(assert (=> b!1132190 m!1044925))

(declare-fun m!1044927 () Bool)

(assert (=> b!1132193 m!1044927))

(declare-fun m!1044929 () Bool)

(assert (=> d!131379 m!1044929))

(assert (=> d!131379 m!1043893))

(declare-fun m!1044931 () Bool)

(assert (=> b!1132191 m!1044931))

(assert (=> b!1132187 m!1044911))

(assert (=> b!1132183 m!1043919))

(assert (=> b!1132183 m!1044907))

(assert (=> b!1132183 m!1044907))

(declare-fun m!1044933 () Bool)

(assert (=> b!1132183 m!1044933))

(assert (=> b!1132183 m!1044919))

(assert (=> b!1132183 m!1043919))

(assert (=> b!1132183 m!1044923))

(assert (=> b!1132183 m!1044919))

(assert (=> b!1132186 m!1044907))

(assert (=> b!1132186 m!1044907))

(assert (=> b!1132186 m!1044925))

(assert (=> bm!48739 d!131379))

(declare-fun d!131381 () Bool)

(assert (=> d!131381 (not (contains!6500 (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627)) lt!502623))))

(declare-fun lt!502854 () Unit!36912)

(assert (=> d!131381 (= lt!502854 (choose!1786 lt!502625 lt!502622 lt!502627 lt!502623))))

(declare-fun e!644344 () Bool)

(assert (=> d!131381 e!644344))

(declare-fun res!756168 () Bool)

(assert (=> d!131381 (=> (not res!756168) (not e!644344))))

(assert (=> d!131381 (= res!756168 (not (contains!6500 lt!502625 lt!502623)))))

(assert (=> d!131381 (= (addStillNotContains!284 lt!502625 lt!502622 lt!502627 lt!502623) lt!502854)))

(declare-fun b!1132194 () Bool)

(assert (=> b!1132194 (= e!644344 (not (= lt!502622 lt!502623)))))

(assert (= (and d!131381 res!756168) b!1132194))

(assert (=> d!131381 m!1044217))

(assert (=> d!131381 m!1044217))

(assert (=> d!131381 m!1044221))

(declare-fun m!1044935 () Bool)

(assert (=> d!131381 m!1044935))

(declare-fun m!1044937 () Bool)

(assert (=> d!131381 m!1044937))

(assert (=> b!1131796 d!131381))

(declare-fun d!131383 () Bool)

(declare-fun e!644345 () Bool)

(assert (=> d!131383 e!644345))

(declare-fun res!756170 () Bool)

(assert (=> d!131383 (=> (not res!756170) (not e!644345))))

(declare-fun lt!502856 () ListLongMap!16065)

(assert (=> d!131383 (= res!756170 (contains!6500 lt!502856 (_1!9059 (tuple2!18097 lt!502622 lt!502627))))))

(declare-fun lt!502857 () List!24846)

(assert (=> d!131383 (= lt!502856 (ListLongMap!16066 lt!502857))))

(declare-fun lt!502855 () Unit!36912)

(declare-fun lt!502858 () Unit!36912)

(assert (=> d!131383 (= lt!502855 lt!502858)))

(assert (=> d!131383 (= (getValueByKey!630 lt!502857 (_1!9059 (tuple2!18097 lt!502622 lt!502627))) (Some!680 (_2!9059 (tuple2!18097 lt!502622 lt!502627))))))

(assert (=> d!131383 (= lt!502858 (lemmaContainsTupThenGetReturnValue!306 lt!502857 (_1!9059 (tuple2!18097 lt!502622 lt!502627)) (_2!9059 (tuple2!18097 lt!502622 lt!502627))))))

(assert (=> d!131383 (= lt!502857 (insertStrictlySorted!399 (toList!8048 lt!502625) (_1!9059 (tuple2!18097 lt!502622 lt!502627)) (_2!9059 (tuple2!18097 lt!502622 lt!502627))))))

(assert (=> d!131383 (= (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627)) lt!502856)))

(declare-fun b!1132195 () Bool)

(declare-fun res!756169 () Bool)

(assert (=> b!1132195 (=> (not res!756169) (not e!644345))))

(assert (=> b!1132195 (= res!756169 (= (getValueByKey!630 (toList!8048 lt!502856) (_1!9059 (tuple2!18097 lt!502622 lt!502627))) (Some!680 (_2!9059 (tuple2!18097 lt!502622 lt!502627)))))))

(declare-fun b!1132196 () Bool)

(assert (=> b!1132196 (= e!644345 (contains!6504 (toList!8048 lt!502856) (tuple2!18097 lt!502622 lt!502627)))))

(assert (= (and d!131383 res!756170) b!1132195))

(assert (= (and b!1132195 res!756169) b!1132196))

(declare-fun m!1044939 () Bool)

(assert (=> d!131383 m!1044939))

(declare-fun m!1044941 () Bool)

(assert (=> d!131383 m!1044941))

(declare-fun m!1044943 () Bool)

(assert (=> d!131383 m!1044943))

(declare-fun m!1044945 () Bool)

(assert (=> d!131383 m!1044945))

(declare-fun m!1044947 () Bool)

(assert (=> b!1132195 m!1044947))

(declare-fun m!1044949 () Bool)

(assert (=> b!1132196 m!1044949))

(assert (=> b!1131796 d!131383))

(assert (=> b!1131796 d!131371))

(declare-fun d!131385 () Bool)

(declare-fun e!644346 () Bool)

(assert (=> d!131385 e!644346))

(declare-fun res!756172 () Bool)

(assert (=> d!131385 (=> (not res!756172) (not e!644346))))

(declare-fun lt!502860 () ListLongMap!16065)

(assert (=> d!131385 (= res!756172 (contains!6500 lt!502860 (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502861 () List!24846)

(assert (=> d!131385 (= lt!502860 (ListLongMap!16066 lt!502861))))

(declare-fun lt!502859 () Unit!36912)

(declare-fun lt!502862 () Unit!36912)

(assert (=> d!131385 (= lt!502859 lt!502862)))

(assert (=> d!131385 (= (getValueByKey!630 lt!502861 (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131385 (= lt!502862 (lemmaContainsTupThenGetReturnValue!306 lt!502861 (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131385 (= lt!502861 (insertStrictlySorted!399 (toList!8048 call!48744) (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131385 (= (+!3486 call!48744 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502860)))

(declare-fun b!1132197 () Bool)

(declare-fun res!756171 () Bool)

(assert (=> b!1132197 (=> (not res!756171) (not e!644346))))

(assert (=> b!1132197 (= res!756171 (= (getValueByKey!630 (toList!8048 lt!502860) (_1!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1132198 () Bool)

(assert (=> b!1132198 (= e!644346 (contains!6504 (toList!8048 lt!502860) (tuple2!18097 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18068 (select (arr!35509 (ite c!110180 _values!996 lt!502452)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131385 res!756172) b!1132197))

(assert (= (and b!1132197 res!756171) b!1132198))

(declare-fun m!1044951 () Bool)

(assert (=> d!131385 m!1044951))

(declare-fun m!1044953 () Bool)

(assert (=> d!131385 m!1044953))

(declare-fun m!1044955 () Bool)

(assert (=> d!131385 m!1044955))

(declare-fun m!1044957 () Bool)

(assert (=> d!131385 m!1044957))

(declare-fun m!1044959 () Bool)

(assert (=> b!1132197 m!1044959))

(declare-fun m!1044961 () Bool)

(assert (=> b!1132198 m!1044961))

(assert (=> b!1131796 d!131385))

(declare-fun d!131387 () Bool)

(declare-fun e!644348 () Bool)

(assert (=> d!131387 e!644348))

(declare-fun res!756173 () Bool)

(assert (=> d!131387 (=> res!756173 e!644348)))

(declare-fun lt!502865 () Bool)

(assert (=> d!131387 (= res!756173 (not lt!502865))))

(declare-fun lt!502863 () Bool)

(assert (=> d!131387 (= lt!502865 lt!502863)))

(declare-fun lt!502866 () Unit!36912)

(declare-fun e!644347 () Unit!36912)

(assert (=> d!131387 (= lt!502866 e!644347)))

(declare-fun c!110372 () Bool)

(assert (=> d!131387 (= c!110372 lt!502863)))

(assert (=> d!131387 (= lt!502863 (containsKey!585 (toList!8048 (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627))) lt!502623))))

(assert (=> d!131387 (= (contains!6500 (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627)) lt!502623) lt!502865)))

(declare-fun b!1132199 () Bool)

(declare-fun lt!502864 () Unit!36912)

(assert (=> b!1132199 (= e!644347 lt!502864)))

(assert (=> b!1132199 (= lt!502864 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627))) lt!502623))))

(assert (=> b!1132199 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627))) lt!502623))))

(declare-fun b!1132200 () Bool)

(declare-fun Unit!36943 () Unit!36912)

(assert (=> b!1132200 (= e!644347 Unit!36943)))

(declare-fun b!1132201 () Bool)

(assert (=> b!1132201 (= e!644348 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502625 (tuple2!18097 lt!502622 lt!502627))) lt!502623)))))

(assert (= (and d!131387 c!110372) b!1132199))

(assert (= (and d!131387 (not c!110372)) b!1132200))

(assert (= (and d!131387 (not res!756173)) b!1132201))

(declare-fun m!1044963 () Bool)

(assert (=> d!131387 m!1044963))

(declare-fun m!1044965 () Bool)

(assert (=> b!1132199 m!1044965))

(declare-fun m!1044967 () Bool)

(assert (=> b!1132199 m!1044967))

(assert (=> b!1132199 m!1044967))

(declare-fun m!1044969 () Bool)

(assert (=> b!1132199 m!1044969))

(assert (=> b!1132201 m!1044967))

(assert (=> b!1132201 m!1044967))

(assert (=> b!1132201 m!1044969))

(assert (=> b!1131796 d!131387))

(assert (=> b!1131764 d!131373))

(declare-fun d!131389 () Bool)

(declare-fun e!644349 () Bool)

(assert (=> d!131389 e!644349))

(declare-fun res!756175 () Bool)

(assert (=> d!131389 (=> (not res!756175) (not e!644349))))

(declare-fun lt!502868 () ListLongMap!16065)

(assert (=> d!131389 (= res!756175 (contains!6500 lt!502868 (_1!9059 (tuple2!18097 lt!502574 lt!502579))))))

(declare-fun lt!502869 () List!24846)

(assert (=> d!131389 (= lt!502868 (ListLongMap!16066 lt!502869))))

(declare-fun lt!502867 () Unit!36912)

(declare-fun lt!502870 () Unit!36912)

(assert (=> d!131389 (= lt!502867 lt!502870)))

(assert (=> d!131389 (= (getValueByKey!630 lt!502869 (_1!9059 (tuple2!18097 lt!502574 lt!502579))) (Some!680 (_2!9059 (tuple2!18097 lt!502574 lt!502579))))))

(assert (=> d!131389 (= lt!502870 (lemmaContainsTupThenGetReturnValue!306 lt!502869 (_1!9059 (tuple2!18097 lt!502574 lt!502579)) (_2!9059 (tuple2!18097 lt!502574 lt!502579))))))

(assert (=> d!131389 (= lt!502869 (insertStrictlySorted!399 (toList!8048 lt!502577) (_1!9059 (tuple2!18097 lt!502574 lt!502579)) (_2!9059 (tuple2!18097 lt!502574 lt!502579))))))

(assert (=> d!131389 (= (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579)) lt!502868)))

(declare-fun b!1132202 () Bool)

(declare-fun res!756174 () Bool)

(assert (=> b!1132202 (=> (not res!756174) (not e!644349))))

(assert (=> b!1132202 (= res!756174 (= (getValueByKey!630 (toList!8048 lt!502868) (_1!9059 (tuple2!18097 lt!502574 lt!502579))) (Some!680 (_2!9059 (tuple2!18097 lt!502574 lt!502579)))))))

(declare-fun b!1132203 () Bool)

(assert (=> b!1132203 (= e!644349 (contains!6504 (toList!8048 lt!502868) (tuple2!18097 lt!502574 lt!502579)))))

(assert (= (and d!131389 res!756175) b!1132202))

(assert (= (and b!1132202 res!756174) b!1132203))

(declare-fun m!1044971 () Bool)

(assert (=> d!131389 m!1044971))

(declare-fun m!1044973 () Bool)

(assert (=> d!131389 m!1044973))

(declare-fun m!1044975 () Bool)

(assert (=> d!131389 m!1044975))

(declare-fun m!1044977 () Bool)

(assert (=> d!131389 m!1044977))

(declare-fun m!1044979 () Bool)

(assert (=> b!1132202 m!1044979))

(declare-fun m!1044981 () Bool)

(assert (=> b!1132203 m!1044981))

(assert (=> b!1131721 d!131389))

(declare-fun d!131391 () Bool)

(assert (=> d!131391 (not (contains!6500 (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579)) lt!502575))))

(declare-fun lt!502871 () Unit!36912)

(assert (=> d!131391 (= lt!502871 (choose!1786 lt!502577 lt!502574 lt!502579 lt!502575))))

(declare-fun e!644350 () Bool)

(assert (=> d!131391 e!644350))

(declare-fun res!756176 () Bool)

(assert (=> d!131391 (=> (not res!756176) (not e!644350))))

(assert (=> d!131391 (= res!756176 (not (contains!6500 lt!502577 lt!502575)))))

(assert (=> d!131391 (= (addStillNotContains!284 lt!502577 lt!502574 lt!502579 lt!502575) lt!502871)))

(declare-fun b!1132204 () Bool)

(assert (=> b!1132204 (= e!644350 (not (= lt!502574 lt!502575)))))

(assert (= (and d!131391 res!756176) b!1132204))

(assert (=> d!131391 m!1044099))

(assert (=> d!131391 m!1044099))

(assert (=> d!131391 m!1044103))

(declare-fun m!1044983 () Bool)

(assert (=> d!131391 m!1044983))

(declare-fun m!1044985 () Bool)

(assert (=> d!131391 m!1044985))

(assert (=> b!1131721 d!131391))

(assert (=> b!1131721 d!131377))

(declare-fun d!131393 () Bool)

(declare-fun e!644352 () Bool)

(assert (=> d!131393 e!644352))

(declare-fun res!756177 () Bool)

(assert (=> d!131393 (=> res!756177 e!644352)))

(declare-fun lt!502874 () Bool)

(assert (=> d!131393 (= res!756177 (not lt!502874))))

(declare-fun lt!502872 () Bool)

(assert (=> d!131393 (= lt!502874 lt!502872)))

(declare-fun lt!502875 () Unit!36912)

(declare-fun e!644351 () Unit!36912)

(assert (=> d!131393 (= lt!502875 e!644351)))

(declare-fun c!110373 () Bool)

(assert (=> d!131393 (= c!110373 lt!502872)))

(assert (=> d!131393 (= lt!502872 (containsKey!585 (toList!8048 (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579))) lt!502575))))

(assert (=> d!131393 (= (contains!6500 (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579)) lt!502575) lt!502874)))

(declare-fun b!1132205 () Bool)

(declare-fun lt!502873 () Unit!36912)

(assert (=> b!1132205 (= e!644351 lt!502873)))

(assert (=> b!1132205 (= lt!502873 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579))) lt!502575))))

(assert (=> b!1132205 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579))) lt!502575))))

(declare-fun b!1132206 () Bool)

(declare-fun Unit!36944 () Unit!36912)

(assert (=> b!1132206 (= e!644351 Unit!36944)))

(declare-fun b!1132207 () Bool)

(assert (=> b!1132207 (= e!644352 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 lt!502577 (tuple2!18097 lt!502574 lt!502579))) lt!502575)))))

(assert (= (and d!131393 c!110373) b!1132205))

(assert (= (and d!131393 (not c!110373)) b!1132206))

(assert (= (and d!131393 (not res!756177)) b!1132207))

(declare-fun m!1044987 () Bool)

(assert (=> d!131393 m!1044987))

(declare-fun m!1044989 () Bool)

(assert (=> b!1132205 m!1044989))

(declare-fun m!1044991 () Bool)

(assert (=> b!1132205 m!1044991))

(assert (=> b!1132205 m!1044991))

(declare-fun m!1044993 () Bool)

(assert (=> b!1132205 m!1044993))

(assert (=> b!1132207 m!1044991))

(assert (=> b!1132207 m!1044991))

(assert (=> b!1132207 m!1044993))

(assert (=> b!1131721 d!131393))

(declare-fun d!131395 () Bool)

(declare-fun e!644353 () Bool)

(assert (=> d!131395 e!644353))

(declare-fun res!756179 () Bool)

(assert (=> d!131395 (=> (not res!756179) (not e!644353))))

(declare-fun lt!502877 () ListLongMap!16065)

(assert (=> d!131395 (= res!756179 (contains!6500 lt!502877 (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!502878 () List!24846)

(assert (=> d!131395 (= lt!502877 (ListLongMap!16066 lt!502878))))

(declare-fun lt!502876 () Unit!36912)

(declare-fun lt!502879 () Unit!36912)

(assert (=> d!131395 (= lt!502876 lt!502879)))

(assert (=> d!131395 (= (getValueByKey!630 lt!502878 (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131395 (= lt!502879 (lemmaContainsTupThenGetReturnValue!306 lt!502878 (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131395 (= lt!502878 (insertStrictlySorted!399 (toList!8048 call!48732) (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131395 (= (+!3486 call!48732 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!502877)))

(declare-fun b!1132208 () Bool)

(declare-fun res!756178 () Bool)

(assert (=> b!1132208 (=> (not res!756178) (not e!644353))))

(assert (=> b!1132208 (= res!756178 (= (getValueByKey!630 (toList!8048 lt!502877) (_1!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!680 (_2!9059 (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1132209 () Bool)

(assert (=> b!1132209 (= e!644353 (contains!6504 (toList!8048 lt!502877) (tuple2!18097 (select (arr!35508 _keys!1208) from!1455) (get!18068 (select (arr!35509 _values!996) from!1455) (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131395 res!756179) b!1132208))

(assert (= (and b!1132208 res!756178) b!1132209))

(declare-fun m!1044995 () Bool)

(assert (=> d!131395 m!1044995))

(declare-fun m!1044997 () Bool)

(assert (=> d!131395 m!1044997))

(declare-fun m!1044999 () Bool)

(assert (=> d!131395 m!1044999))

(declare-fun m!1045001 () Bool)

(assert (=> d!131395 m!1045001))

(declare-fun m!1045003 () Bool)

(assert (=> b!1132208 m!1045003))

(declare-fun m!1045005 () Bool)

(assert (=> b!1132209 m!1045005))

(assert (=> b!1131721 d!131395))

(assert (=> b!1131750 d!131359))

(assert (=> b!1131792 d!131361))

(declare-fun d!131397 () Bool)

(declare-fun lt!502880 () ListLongMap!16065)

(assert (=> d!131397 (not (contains!6500 lt!502880 k0!934))))

(assert (=> d!131397 (= lt!502880 (ListLongMap!16066 (removeStrictlySorted!89 (toList!8048 call!48741) k0!934)))))

(assert (=> d!131397 (= (-!1153 call!48741 k0!934) lt!502880)))

(declare-fun bs!32948 () Bool)

(assert (= bs!32948 d!131397))

(declare-fun m!1045007 () Bool)

(assert (=> bs!32948 m!1045007))

(declare-fun m!1045009 () Bool)

(assert (=> bs!32948 m!1045009))

(assert (=> b!1131777 d!131397))

(assert (=> b!1131809 d!131373))

(assert (=> b!1131717 d!131363))

(assert (=> d!131177 d!131175))

(declare-fun d!131399 () Bool)

(assert (=> d!131399 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!131399 true))

(declare-fun _$60!442 () Unit!36912)

(assert (=> d!131399 (= (choose!13 _keys!1208 k0!934 i!673) _$60!442)))

(declare-fun bs!32949 () Bool)

(assert (= bs!32949 d!131399))

(assert (=> bs!32949 m!1043865))

(assert (=> d!131177 d!131399))

(declare-fun d!131401 () Bool)

(declare-fun c!110374 () Bool)

(assert (=> d!131401 (= c!110374 (and ((_ is Cons!24842) (toList!8048 lt!502653)) (= (_1!9059 (h!26051 (toList!8048 lt!502653))) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!644354 () Option!681)

(assert (=> d!131401 (= (getValueByKey!630 (toList!8048 lt!502653) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!644354)))

(declare-fun b!1132211 () Bool)

(declare-fun e!644355 () Option!681)

(assert (=> b!1132211 (= e!644354 e!644355)))

(declare-fun c!110375 () Bool)

(assert (=> b!1132211 (= c!110375 (and ((_ is Cons!24842) (toList!8048 lt!502653)) (not (= (_1!9059 (h!26051 (toList!8048 lt!502653))) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1132213 () Bool)

(assert (=> b!1132213 (= e!644355 None!679)))

(declare-fun b!1132210 () Bool)

(assert (=> b!1132210 (= e!644354 (Some!680 (_2!9059 (h!26051 (toList!8048 lt!502653)))))))

(declare-fun b!1132212 () Bool)

(assert (=> b!1132212 (= e!644355 (getValueByKey!630 (t!35764 (toList!8048 lt!502653)) (_1!9059 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131401 c!110374) b!1132210))

(assert (= (and d!131401 (not c!110374)) b!1132211))

(assert (= (and b!1132211 c!110375) b!1132212))

(assert (= (and b!1132211 (not c!110375)) b!1132213))

(declare-fun m!1045011 () Bool)

(assert (=> b!1132212 m!1045011))

(assert (=> b!1131838 d!131401))

(declare-fun lt!502881 () Bool)

(declare-fun d!131403 () Bool)

(assert (=> d!131403 (= lt!502881 (select (content!539 (toList!8048 lt!502611)) (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!644357 () Bool)

(assert (=> d!131403 (= lt!502881 e!644357)))

(declare-fun res!756181 () Bool)

(assert (=> d!131403 (=> (not res!756181) (not e!644357))))

(assert (=> d!131403 (= res!756181 ((_ is Cons!24842) (toList!8048 lt!502611)))))

(assert (=> d!131403 (= (contains!6504 (toList!8048 lt!502611) (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!502881)))

(declare-fun b!1132214 () Bool)

(declare-fun e!644356 () Bool)

(assert (=> b!1132214 (= e!644357 e!644356)))

(declare-fun res!756180 () Bool)

(assert (=> b!1132214 (=> res!756180 e!644356)))

(assert (=> b!1132214 (= res!756180 (= (h!26051 (toList!8048 lt!502611)) (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132215 () Bool)

(assert (=> b!1132215 (= e!644356 (contains!6504 (t!35764 (toList!8048 lt!502611)) (ite (or c!110181 c!110183) (tuple2!18097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131403 res!756181) b!1132214))

(assert (= (and b!1132214 (not res!756180)) b!1132215))

(declare-fun m!1045013 () Bool)

(assert (=> d!131403 m!1045013))

(declare-fun m!1045015 () Bool)

(assert (=> d!131403 m!1045015))

(declare-fun m!1045017 () Bool)

(assert (=> b!1132215 m!1045017))

(assert (=> b!1131783 d!131403))

(assert (=> b!1131801 d!131291))

(assert (=> b!1131726 d!131305))

(declare-fun d!131405 () Bool)

(declare-fun res!756182 () Bool)

(declare-fun e!644358 () Bool)

(assert (=> d!131405 (=> res!756182 e!644358)))

(assert (=> d!131405 (= res!756182 (and ((_ is Cons!24842) (toList!8048 lt!502448)) (= (_1!9059 (h!26051 (toList!8048 lt!502448))) k0!934)))))

(assert (=> d!131405 (= (containsKey!585 (toList!8048 lt!502448) k0!934) e!644358)))

(declare-fun b!1132216 () Bool)

(declare-fun e!644359 () Bool)

(assert (=> b!1132216 (= e!644358 e!644359)))

(declare-fun res!756183 () Bool)

(assert (=> b!1132216 (=> (not res!756183) (not e!644359))))

(assert (=> b!1132216 (= res!756183 (and (or (not ((_ is Cons!24842) (toList!8048 lt!502448))) (bvsle (_1!9059 (h!26051 (toList!8048 lt!502448))) k0!934)) ((_ is Cons!24842) (toList!8048 lt!502448)) (bvslt (_1!9059 (h!26051 (toList!8048 lt!502448))) k0!934)))))

(declare-fun b!1132217 () Bool)

(assert (=> b!1132217 (= e!644359 (containsKey!585 (t!35764 (toList!8048 lt!502448)) k0!934))))

(assert (= (and d!131405 (not res!756182)) b!1132216))

(assert (= (and b!1132216 res!756183) b!1132217))

(declare-fun m!1045019 () Bool)

(assert (=> b!1132217 m!1045019))

(assert (=> d!131147 d!131405))

(declare-fun d!131407 () Bool)

(declare-fun e!644361 () Bool)

(assert (=> d!131407 e!644361))

(declare-fun res!756184 () Bool)

(assert (=> d!131407 (=> res!756184 e!644361)))

(declare-fun lt!502884 () Bool)

(assert (=> d!131407 (= res!756184 (not lt!502884))))

(declare-fun lt!502882 () Bool)

(assert (=> d!131407 (= lt!502884 lt!502882)))

(declare-fun lt!502885 () Unit!36912)

(declare-fun e!644360 () Unit!36912)

(assert (=> d!131407 (= lt!502885 e!644360)))

(declare-fun c!110376 () Bool)

(assert (=> d!131407 (= c!110376 lt!502882)))

(assert (=> d!131407 (= lt!502882 (containsKey!585 (toList!8048 lt!502626) (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!131407 (= (contains!6500 lt!502626 (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))) lt!502884)))

(declare-fun b!1132218 () Bool)

(declare-fun lt!502883 () Unit!36912)

(assert (=> b!1132218 (= e!644360 lt!502883)))

(assert (=> b!1132218 (= lt!502883 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502626) (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132218 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502626) (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132219 () Bool)

(declare-fun Unit!36945 () Unit!36912)

(assert (=> b!1132219 (= e!644360 Unit!36945)))

(declare-fun b!1132220 () Bool)

(assert (=> b!1132220 (= e!644361 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502626) (select (arr!35508 (ite c!110180 _keys!1208 lt!502441)) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!131407 c!110376) b!1132218))

(assert (= (and d!131407 (not c!110376)) b!1132219))

(assert (= (and d!131407 (not res!756184)) b!1132220))

(assert (=> d!131407 m!1044207))

(declare-fun m!1045021 () Bool)

(assert (=> d!131407 m!1045021))

(assert (=> b!1132218 m!1044207))

(declare-fun m!1045023 () Bool)

(assert (=> b!1132218 m!1045023))

(assert (=> b!1132218 m!1044207))

(assert (=> b!1132218 m!1044891))

(assert (=> b!1132218 m!1044891))

(declare-fun m!1045025 () Bool)

(assert (=> b!1132218 m!1045025))

(assert (=> b!1132220 m!1044207))

(assert (=> b!1132220 m!1044891))

(assert (=> b!1132220 m!1044891))

(assert (=> b!1132220 m!1045025))

(assert (=> b!1131799 d!131407))

(declare-fun b!1132221 () Bool)

(declare-fun e!644365 () Bool)

(declare-fun e!644363 () Bool)

(assert (=> b!1132221 (= e!644365 e!644363)))

(declare-fun c!110377 () Bool)

(assert (=> b!1132221 (= c!110377 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132222 () Bool)

(declare-fun e!644364 () Bool)

(assert (=> b!1132222 (= e!644364 (contains!6503 (ite c!110243 (Cons!24841 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) Nil!24842) Nil!24842) (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132223 () Bool)

(declare-fun e!644362 () Bool)

(assert (=> b!1132223 (= e!644362 e!644365)))

(declare-fun res!756186 () Bool)

(assert (=> b!1132223 (=> (not res!756186) (not e!644365))))

(assert (=> b!1132223 (= res!756186 (not e!644364))))

(declare-fun res!756187 () Bool)

(assert (=> b!1132223 (=> (not res!756187) (not e!644364))))

(assert (=> b!1132223 (= res!756187 (validKeyInArray!0 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1132224 () Bool)

(declare-fun call!48774 () Bool)

(assert (=> b!1132224 (= e!644363 call!48774)))

(declare-fun bm!48771 () Bool)

(assert (=> bm!48771 (= call!48774 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!110377 (Cons!24841 (select (arr!35508 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!110243 (Cons!24841 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) Nil!24842) Nil!24842)) (ite c!110243 (Cons!24841 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) Nil!24842) Nil!24842))))))

(declare-fun b!1132225 () Bool)

(assert (=> b!1132225 (= e!644363 call!48774)))

(declare-fun d!131409 () Bool)

(declare-fun res!756185 () Bool)

(assert (=> d!131409 (=> res!756185 e!644362)))

(assert (=> d!131409 (= res!756185 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36046 _keys!1208)))))

(assert (=> d!131409 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110243 (Cons!24841 (select (arr!35508 _keys!1208) #b00000000000000000000000000000000) Nil!24842) Nil!24842)) e!644362)))

(assert (= (and d!131409 (not res!756185)) b!1132223))

(assert (= (and b!1132223 res!756187) b!1132222))

(assert (= (and b!1132223 res!756186) b!1132221))

(assert (= (and b!1132221 c!110377) b!1132225))

(assert (= (and b!1132221 (not c!110377)) b!1132224))

(assert (= (or b!1132225 b!1132224) bm!48771))

(assert (=> b!1132221 m!1044785))

(assert (=> b!1132221 m!1044785))

(assert (=> b!1132221 m!1044787))

(assert (=> b!1132222 m!1044785))

(assert (=> b!1132222 m!1044785))

(declare-fun m!1045027 () Bool)

(assert (=> b!1132222 m!1045027))

(assert (=> b!1132223 m!1044785))

(assert (=> b!1132223 m!1044785))

(assert (=> b!1132223 m!1044787))

(assert (=> bm!48771 m!1044785))

(declare-fun m!1045029 () Bool)

(assert (=> bm!48771 m!1045029))

(assert (=> bm!48733 d!131409))

(declare-fun d!131411 () Bool)

(declare-fun e!644367 () Bool)

(assert (=> d!131411 e!644367))

(declare-fun res!756188 () Bool)

(assert (=> d!131411 (=> res!756188 e!644367)))

(declare-fun lt!502888 () Bool)

(assert (=> d!131411 (= res!756188 (not lt!502888))))

(declare-fun lt!502886 () Bool)

(assert (=> d!131411 (= lt!502888 lt!502886)))

(declare-fun lt!502889 () Unit!36912)

(declare-fun e!644366 () Unit!36912)

(assert (=> d!131411 (= lt!502889 e!644366)))

(declare-fun c!110378 () Bool)

(assert (=> d!131411 (= c!110378 lt!502886)))

(assert (=> d!131411 (= lt!502886 (containsKey!585 (toList!8048 lt!502578) (select (arr!35508 _keys!1208) from!1455)))))

(assert (=> d!131411 (= (contains!6500 lt!502578 (select (arr!35508 _keys!1208) from!1455)) lt!502888)))

(declare-fun b!1132226 () Bool)

(declare-fun lt!502887 () Unit!36912)

(assert (=> b!1132226 (= e!644366 lt!502887)))

(assert (=> b!1132226 (= lt!502887 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 lt!502578) (select (arr!35508 _keys!1208) from!1455)))))

(assert (=> b!1132226 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502578) (select (arr!35508 _keys!1208) from!1455)))))

(declare-fun b!1132227 () Bool)

(declare-fun Unit!36946 () Unit!36912)

(assert (=> b!1132227 (= e!644366 Unit!36946)))

(declare-fun b!1132228 () Bool)

(assert (=> b!1132228 (= e!644367 (isDefined!457 (getValueByKey!630 (toList!8048 lt!502578) (select (arr!35508 _keys!1208) from!1455))))))

(assert (= (and d!131411 c!110378) b!1132226))

(assert (= (and d!131411 (not c!110378)) b!1132227))

(assert (= (and d!131411 (not res!756188)) b!1132228))

(assert (=> d!131411 m!1043909))

(declare-fun m!1045031 () Bool)

(assert (=> d!131411 m!1045031))

(assert (=> b!1132226 m!1043909))

(declare-fun m!1045033 () Bool)

(assert (=> b!1132226 m!1045033))

(assert (=> b!1132226 m!1043909))

(assert (=> b!1132226 m!1044899))

(assert (=> b!1132226 m!1044899))

(declare-fun m!1045035 () Bool)

(assert (=> b!1132226 m!1045035))

(assert (=> b!1132228 m!1043909))

(assert (=> b!1132228 m!1044899))

(assert (=> b!1132228 m!1044899))

(assert (=> b!1132228 m!1045035))

(assert (=> b!1131724 d!131411))

(declare-fun d!131413 () Bool)

(declare-fun e!644369 () Bool)

(assert (=> d!131413 e!644369))

(declare-fun res!756189 () Bool)

(assert (=> d!131413 (=> res!756189 e!644369)))

(declare-fun lt!502892 () Bool)

(assert (=> d!131413 (= res!756189 (not lt!502892))))

(declare-fun lt!502890 () Bool)

(assert (=> d!131413 (= lt!502892 lt!502890)))

(declare-fun lt!502893 () Unit!36912)

(declare-fun e!644368 () Unit!36912)

(assert (=> d!131413 (= lt!502893 e!644368)))

(declare-fun c!110379 () Bool)

(assert (=> d!131413 (= c!110379 lt!502890)))

(assert (=> d!131413 (= lt!502890 (containsKey!585 (toList!8048 (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> d!131413 (= (contains!6500 (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))) k0!934) lt!502892)))

(declare-fun b!1132229 () Bool)

(declare-fun lt!502891 () Unit!36912)

(assert (=> b!1132229 (= e!644368 lt!502891)))

(assert (=> b!1132229 (= lt!502891 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> b!1132229 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))) k0!934))))

(declare-fun b!1132230 () Bool)

(declare-fun Unit!36947 () Unit!36912)

(assert (=> b!1132230 (= e!644368 Unit!36947)))

(declare-fun b!1132231 () Bool)

(assert (=> b!1132231 (= e!644369 (isDefined!457 (getValueByKey!630 (toList!8048 (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))) k0!934)))))

(assert (= (and d!131413 c!110379) b!1132229))

(assert (= (and d!131413 (not c!110379)) b!1132230))

(assert (= (and d!131413 (not res!756189)) b!1132231))

(declare-fun m!1045037 () Bool)

(assert (=> d!131413 m!1045037))

(declare-fun m!1045039 () Bool)

(assert (=> b!1132229 m!1045039))

(declare-fun m!1045041 () Bool)

(assert (=> b!1132229 m!1045041))

(assert (=> b!1132229 m!1045041))

(declare-fun m!1045043 () Bool)

(assert (=> b!1132229 m!1045043))

(assert (=> b!1132231 m!1045041))

(assert (=> b!1132231 m!1045041))

(assert (=> b!1132231 m!1045043))

(assert (=> d!131185 d!131413))

(declare-fun d!131415 () Bool)

(declare-fun e!644370 () Bool)

(assert (=> d!131415 e!644370))

(declare-fun res!756191 () Bool)

(assert (=> d!131415 (=> (not res!756191) (not e!644370))))

(declare-fun lt!502895 () ListLongMap!16065)

(assert (=> d!131415 (= res!756191 (contains!6500 lt!502895 (_1!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))))))

(declare-fun lt!502896 () List!24846)

(assert (=> d!131415 (= lt!502895 (ListLongMap!16066 lt!502896))))

(declare-fun lt!502894 () Unit!36912)

(declare-fun lt!502897 () Unit!36912)

(assert (=> d!131415 (= lt!502894 lt!502897)))

(assert (=> d!131415 (= (getValueByKey!630 lt!502896 (_1!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))) (Some!680 (_2!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))))))

(assert (=> d!131415 (= lt!502897 (lemmaContainsTupThenGetReturnValue!306 lt!502896 (_1!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))) (_2!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))))))

(assert (=> d!131415 (= lt!502896 (insertStrictlySorted!399 (toList!8048 (ite c!110181 lt!502440 lt!502448)) (_1!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))) (_2!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))))))

(assert (=> d!131415 (= (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))) lt!502895)))

(declare-fun b!1132232 () Bool)

(declare-fun res!756190 () Bool)

(assert (=> b!1132232 (=> (not res!756190) (not e!644370))))

(assert (=> b!1132232 (= res!756190 (= (getValueByKey!630 (toList!8048 lt!502895) (_1!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944))))) (Some!680 (_2!9059 (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))))))))

(declare-fun b!1132233 () Bool)

(assert (=> b!1132233 (= e!644370 (contains!6504 (toList!8048 lt!502895) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))))))

(assert (= (and d!131415 res!756191) b!1132232))

(assert (= (and b!1132232 res!756190) b!1132233))

(declare-fun m!1045045 () Bool)

(assert (=> d!131415 m!1045045))

(declare-fun m!1045047 () Bool)

(assert (=> d!131415 m!1045047))

(declare-fun m!1045049 () Bool)

(assert (=> d!131415 m!1045049))

(declare-fun m!1045051 () Bool)

(assert (=> d!131415 m!1045051))

(declare-fun m!1045053 () Bool)

(assert (=> b!1132232 m!1045053))

(declare-fun m!1045055 () Bool)

(assert (=> b!1132233 m!1045055))

(assert (=> d!131185 d!131415))

(declare-fun d!131417 () Bool)

(assert (=> d!131417 (contains!6500 (+!3486 (ite c!110181 lt!502440 lt!502448) (tuple2!18097 (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)))) k0!934)))

(assert (=> d!131417 true))

(declare-fun _$35!452 () Unit!36912)

(assert (=> d!131417 (= (choose!1784 (ite c!110181 lt!502440 lt!502448) (ite c!110181 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110183 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110181 minValue!944 (ite c!110183 zeroValue!944 minValue!944)) k0!934) _$35!452)))

(declare-fun bs!32950 () Bool)

(assert (= bs!32950 d!131417))

(assert (=> bs!32950 m!1044267))

(assert (=> bs!32950 m!1044267))

(assert (=> bs!32950 m!1044269))

(assert (=> d!131185 d!131417))

(declare-fun d!131419 () Bool)

(declare-fun e!644372 () Bool)

(assert (=> d!131419 e!644372))

(declare-fun res!756192 () Bool)

(assert (=> d!131419 (=> res!756192 e!644372)))

(declare-fun lt!502900 () Bool)

(assert (=> d!131419 (= res!756192 (not lt!502900))))

(declare-fun lt!502898 () Bool)

(assert (=> d!131419 (= lt!502900 lt!502898)))

(declare-fun lt!502901 () Unit!36912)

(declare-fun e!644371 () Unit!36912)

(assert (=> d!131419 (= lt!502901 e!644371)))

(declare-fun c!110380 () Bool)

(assert (=> d!131419 (= c!110380 lt!502898)))

(assert (=> d!131419 (= lt!502898 (containsKey!585 (toList!8048 (ite c!110181 lt!502440 lt!502448)) k0!934))))

(assert (=> d!131419 (= (contains!6500 (ite c!110181 lt!502440 lt!502448) k0!934) lt!502900)))

(declare-fun b!1132234 () Bool)

(declare-fun lt!502899 () Unit!36912)

(assert (=> b!1132234 (= e!644371 lt!502899)))

(assert (=> b!1132234 (= lt!502899 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!8048 (ite c!110181 lt!502440 lt!502448)) k0!934))))

(assert (=> b!1132234 (isDefined!457 (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 lt!502448)) k0!934))))

(declare-fun b!1132235 () Bool)

(declare-fun Unit!36948 () Unit!36912)

(assert (=> b!1132235 (= e!644371 Unit!36948)))

(declare-fun b!1132236 () Bool)

(assert (=> b!1132236 (= e!644372 (isDefined!457 (getValueByKey!630 (toList!8048 (ite c!110181 lt!502440 lt!502448)) k0!934)))))

(assert (= (and d!131419 c!110380) b!1132234))

(assert (= (and d!131419 (not c!110380)) b!1132235))

(assert (= (and d!131419 (not res!756192)) b!1132236))

(declare-fun m!1045057 () Bool)

(assert (=> d!131419 m!1045057))

(declare-fun m!1045059 () Bool)

(assert (=> b!1132234 m!1045059))

(declare-fun m!1045061 () Bool)

(assert (=> b!1132234 m!1045061))

(assert (=> b!1132234 m!1045061))

(declare-fun m!1045063 () Bool)

(assert (=> b!1132234 m!1045063))

(assert (=> b!1132236 m!1045061))

(assert (=> b!1132236 m!1045061))

(assert (=> b!1132236 m!1045063))

(assert (=> d!131185 d!131419))

(declare-fun mapIsEmpty!44525 () Bool)

(declare-fun mapRes!44525 () Bool)

(assert (=> mapIsEmpty!44525 mapRes!44525))

(declare-fun condMapEmpty!44525 () Bool)

(declare-fun mapDefault!44525 () ValueCell!13523)

(assert (=> mapNonEmpty!44524 (= condMapEmpty!44525 (= mapRest!44524 ((as const (Array (_ BitVec 32) ValueCell!13523)) mapDefault!44525)))))

(declare-fun e!644373 () Bool)

(assert (=> mapNonEmpty!44524 (= tp!84524 (and e!644373 mapRes!44525))))

(declare-fun b!1132237 () Bool)

(declare-fun e!644374 () Bool)

(assert (=> b!1132237 (= e!644374 tp_is_empty!28465)))

(declare-fun mapNonEmpty!44525 () Bool)

(declare-fun tp!84525 () Bool)

(assert (=> mapNonEmpty!44525 (= mapRes!44525 (and tp!84525 e!644374))))

(declare-fun mapRest!44525 () (Array (_ BitVec 32) ValueCell!13523))

(declare-fun mapKey!44525 () (_ BitVec 32))

(declare-fun mapValue!44525 () ValueCell!13523)

(assert (=> mapNonEmpty!44525 (= mapRest!44524 (store mapRest!44525 mapKey!44525 mapValue!44525))))

(declare-fun b!1132238 () Bool)

(assert (=> b!1132238 (= e!644373 tp_is_empty!28465)))

(assert (= (and mapNonEmpty!44524 condMapEmpty!44525) mapIsEmpty!44525))

(assert (= (and mapNonEmpty!44524 (not condMapEmpty!44525)) mapNonEmpty!44525))

(assert (= (and mapNonEmpty!44525 ((_ is ValueCellFull!13523) mapValue!44525)) b!1132237))

(assert (= (and mapNonEmpty!44524 ((_ is ValueCellFull!13523) mapDefault!44525)) b!1132238))

(declare-fun m!1045065 () Bool)

(assert (=> mapNonEmpty!44525 m!1045065))

(declare-fun b_lambda!18965 () Bool)

(assert (= b_lambda!18941 (or (and start!98228 b_free!23935) b_lambda!18965)))

(declare-fun b_lambda!18967 () Bool)

(assert (= b_lambda!18949 (or (and start!98228 b_free!23935) b_lambda!18967)))

(declare-fun b_lambda!18969 () Bool)

(assert (= b_lambda!18961 (or (and start!98228 b_free!23935) b_lambda!18969)))

(declare-fun b_lambda!18971 () Bool)

(assert (= b_lambda!18955 (or (and start!98228 b_free!23935) b_lambda!18971)))

(declare-fun b_lambda!18973 () Bool)

(assert (= b_lambda!18943 (or (and start!98228 b_free!23935) b_lambda!18973)))

(declare-fun b_lambda!18975 () Bool)

(assert (= b_lambda!18947 (or (and start!98228 b_free!23935) b_lambda!18975)))

(declare-fun b_lambda!18977 () Bool)

(assert (= b_lambda!18963 (or (and start!98228 b_free!23935) b_lambda!18977)))

(declare-fun b_lambda!18979 () Bool)

(assert (= b_lambda!18953 (or (and start!98228 b_free!23935) b_lambda!18979)))

(declare-fun b_lambda!18981 () Bool)

(assert (= b_lambda!18951 (or (and start!98228 b_free!23935) b_lambda!18981)))

(declare-fun b_lambda!18983 () Bool)

(assert (= b_lambda!18939 (or (and start!98228 b_free!23935) b_lambda!18983)))

(declare-fun b_lambda!18985 () Bool)

(assert (= b_lambda!18957 (or (and start!98228 b_free!23935) b_lambda!18985)))

(declare-fun b_lambda!18987 () Bool)

(assert (= b_lambda!18959 (or (and start!98228 b_free!23935) b_lambda!18987)))

(declare-fun b_lambda!18989 () Bool)

(assert (= b_lambda!18945 (or (and start!98228 b_free!23935) b_lambda!18989)))

(check-sat (not d!131399) (not b!1131942) (not b!1132036) (not d!131287) (not d!131269) (not b!1131964) (not b!1132025) (not b!1132019) (not bm!48763) (not b!1132163) (not b!1131886) (not bm!48744) (not d!131407) (not b_lambda!18893) (not b!1132104) (not b!1132201) (not b!1132022) (not b_lambda!18933) (not b_lambda!18987) (not d!131351) (not d!131395) (not d!131221) (not b!1132095) (not b_lambda!18921) (not b!1132190) (not b!1131986) (not bm!48771) (not b!1132151) (not b!1131882) (not b!1131884) (not d!131237) (not d!131389) (not b!1131890) (not b!1131874) tp_is_empty!28465 (not b_lambda!18935) (not b_lambda!18983) (not b!1132233) (not b!1132202) (not d!131397) (not d!131309) (not b!1132185) (not b!1131961) (not d!131419) (not b_lambda!18931) (not d!131403) (not d!131341) (not d!131279) (not bm!48760) (not b!1132012) (not b_lambda!18973) (not b!1132060) (not d!131293) (not b!1131888) (not d!131355) (not b_lambda!18927) (not b!1132041) (not b!1132000) (not b!1132015) (not b_lambda!18925) (not d!131281) (not b!1132181) (not b!1132076) (not b!1131985) (not d!131411) (not b!1132056) (not b!1132197) (not d!131393) (not b!1131921) (not b!1132069) (not b!1132074) (not b!1132179) (not b!1132158) (not b!1131867) (not d!131243) (not b!1131868) (not b!1132212) (not b!1131988) (not b!1132059) (not b!1132199) (not b!1131871) (not b!1131875) (not b!1132236) (not b!1132226) (not b!1132232) (not b!1131933) (not b_lambda!18979) (not b!1132187) (not b_lambda!18929) (not b!1131900) (not d!131291) (not b!1131932) (not b!1132072) (not b!1131954) (not b!1132038) (not b!1132026) (not b_lambda!18917) b_and!38689 (not d!131255) (not b!1132178) (not b!1131891) (not b!1132013) (not b!1131897) (not b!1131941) (not b!1132177) (not b!1132079) (not d!131253) (not b!1132020) (not b!1131926) (not d!131349) (not b!1131990) (not b!1132229) (not b!1131980) (not d!131249) (not b!1132234) (not d!131283) (not b!1132089) (not bm!48745) (not d!131299) (not b!1132159) (not d!131357) (not d!131267) (not bm!48746) (not b!1132174) (not b!1132010) (not d!131277) (not b!1131873) (not b!1131999) (not b!1132062) (not b!1132082) (not b!1132046) (not b_lambda!18967) (not b!1131936) (not b!1132091) (not b!1132030) (not d!131387) (not b!1132191) (not b!1131850) (not b!1132054) (not b!1132033) (not b!1132044) (not b!1132221) (not b_lambda!18937) (not b!1132005) (not b!1132113) (not b!1131919) (not b!1132198) (not b!1131917) (not d!131415) (not b!1131950) (not bm!48768) (not b!1132007) (not b!1132153) (not b!1131915) (not d!131209) (not b!1131912) (not d!131379) (not b!1131997) (not b!1131887) (not b!1131957) (not b!1131958) (not bm!48748) (not b!1131952) (not b!1132034) (not b!1132114) (not d!131231) (not b!1132002) (not b!1132223) (not d!131383) (not b!1131953) (not b!1132024) (not b!1132180) (not b!1131885) (not b!1132068) (not d!131273) (not b!1132102) (not b!1132228) (not b!1132193) (not b!1132209) (not bm!48747) (not b!1131944) (not b!1131898) (not b!1131994) (not b!1132009) (not b_lambda!18971) (not b!1131869) (not b!1132148) (not b!1131949) (not d!131381) (not b!1132217) (not b!1132100) (not d!131337) (not b!1132215) (not d!131245) (not b_lambda!18981) (not b_lambda!18919) (not d!131259) (not b!1131880) (not b!1132168) (not d!131219) (not b_lambda!18985) (not b!1131916) (not b!1132051) (not b!1132029) (not d!131257) (not b!1131920) (not b!1131894) (not b!1131895) (not b!1132028) (not b_next!23935) (not d!131311) (not d!131241) (not b!1132090) (not b!1132196) (not d!131203) (not b!1132167) (not b!1131940) (not d!131319) (not d!131347) (not b!1131956) (not d!131295) (not bm!48770) (not d!131193) (not b!1132004) (not b!1132208) (not b_lambda!18975) (not b!1132203) (not d!131263) (not d!131215) (not d!131227) (not b!1132207) (not b!1132016) (not b!1131946) (not d!131391) (not b!1131945) (not b!1132218) (not d!131289) (not b!1132147) (not b!1132142) (not b_lambda!18965) (not d!131223) (not b!1131872) (not d!131343) (not d!131233) (not d!131239) (not b!1132088) (not b!1132055) (not d!131247) (not b_lambda!18969) (not b!1131989) (not b!1132205) (not b!1132107) (not b!1132182) (not d!131199) (not b_lambda!18977) (not b!1132018) (not d!131275) (not b!1132145) (not b!1131883) (not b!1131861) (not d!131285) (not b!1132143) (not b!1131924) (not d!131303) (not bm!48751) (not b!1131996) (not b!1131892) (not d!131385) (not d!131207) (not d!131313) (not b!1131938) (not b!1132195) (not d!131225) (not b!1132052) (not b!1131923) (not d!131229) (not b_lambda!18923) (not b!1132222) (not b!1131966) (not d!131305) (not b!1132183) (not bm!48750) (not b!1132156) (not b!1132071) (not d!131213) (not bm!48749) (not d!131307) (not b_lambda!18989) (not b!1131993) (not b!1132231) (not d!131315) (not b!1132186) (not d!131195) (not bm!48769) (not d!131417) (not b!1132150) (not d!131375) (not mapNonEmpty!44525) (not d!131211) (not b!1132220) (not b!1131962) (not d!131235) (not d!131413) (not d!131265) (not d!131369) (not b!1132138))
(check-sat b_and!38689 (not b_next!23935))

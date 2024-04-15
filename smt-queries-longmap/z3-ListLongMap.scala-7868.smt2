; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97946 () Bool)

(assert start!97946)

(declare-fun b_free!23653 () Bool)

(declare-fun b_next!23653 () Bool)

(assert (=> start!97946 (= b_free!23653 (not b_next!23653))))

(declare-fun tp!83663 () Bool)

(declare-fun b_and!38067 () Bool)

(assert (=> start!97946 (= tp!83663 b_and!38067)))

(declare-fun b!1122556 () Bool)

(declare-fun e!639095 () Bool)

(declare-fun tp_is_empty!28183 () Bool)

(assert (=> b!1122556 (= e!639095 tp_is_empty!28183)))

(declare-fun b!1122557 () Bool)

(declare-fun e!639096 () Bool)

(assert (=> b!1122557 (= e!639096 tp_is_empty!28183)))

(declare-fun b!1122558 () Bool)

(declare-fun res!749979 () Bool)

(declare-fun e!639090 () Bool)

(assert (=> b!1122558 (=> (not res!749979) (not e!639090))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122558 (= res!749979 (validMask!0 mask!1564))))

(declare-fun b!1122559 () Bool)

(declare-fun res!749988 () Bool)

(assert (=> b!1122559 (=> (not res!749988) (not e!639090))))

(declare-datatypes ((array!73158 0))(
  ( (array!73159 (arr!35232 (Array (_ BitVec 32) (_ BitVec 64))) (size!35770 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73158)

(declare-datatypes ((List!24604 0))(
  ( (Nil!24601) (Cons!24600 (h!25809 (_ BitVec 64)) (t!35240 List!24604)) )
))
(declare-fun arrayNoDuplicates!0 (array!73158 (_ BitVec 32) List!24604) Bool)

(assert (=> b!1122559 (= res!749988 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24601))))

(declare-fun b!1122560 () Bool)

(declare-fun res!749980 () Bool)

(assert (=> b!1122560 (=> (not res!749980) (not e!639090))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122560 (= res!749980 (validKeyInArray!0 k0!934))))

(declare-fun res!749985 () Bool)

(assert (=> start!97946 (=> (not res!749985) (not e!639090))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97946 (= res!749985 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35770 _keys!1208))))))

(assert (=> start!97946 e!639090))

(assert (=> start!97946 tp_is_empty!28183))

(declare-fun array_inv!27122 (array!73158) Bool)

(assert (=> start!97946 (array_inv!27122 _keys!1208)))

(assert (=> start!97946 true))

(assert (=> start!97946 tp!83663))

(declare-datatypes ((V!42705 0))(
  ( (V!42706 (val!14148 Int)) )
))
(declare-datatypes ((ValueCell!13382 0))(
  ( (ValueCellFull!13382 (v!16780 V!42705)) (EmptyCell!13382) )
))
(declare-datatypes ((array!73160 0))(
  ( (array!73161 (arr!35233 (Array (_ BitVec 32) ValueCell!13382)) (size!35771 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73160)

(declare-fun e!639094 () Bool)

(declare-fun array_inv!27123 (array!73160) Bool)

(assert (=> start!97946 (and (array_inv!27123 _values!996) e!639094)))

(declare-fun mapNonEmpty!44092 () Bool)

(declare-fun mapRes!44092 () Bool)

(declare-fun tp!83662 () Bool)

(assert (=> mapNonEmpty!44092 (= mapRes!44092 (and tp!83662 e!639095))))

(declare-fun mapKey!44092 () (_ BitVec 32))

(declare-fun mapValue!44092 () ValueCell!13382)

(declare-fun mapRest!44092 () (Array (_ BitVec 32) ValueCell!13382))

(assert (=> mapNonEmpty!44092 (= (arr!35233 _values!996) (store mapRest!44092 mapKey!44092 mapValue!44092))))

(declare-fun b!1122561 () Bool)

(declare-fun e!639088 () Bool)

(assert (=> b!1122561 (= e!639090 e!639088)))

(declare-fun res!749989 () Bool)

(assert (=> b!1122561 (=> (not res!749989) (not e!639088))))

(declare-fun lt!498607 () array!73158)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73158 (_ BitVec 32)) Bool)

(assert (=> b!1122561 (= res!749989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498607 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122561 (= lt!498607 (array!73159 (store (arr!35232 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35770 _keys!1208)))))

(declare-fun b!1122562 () Bool)

(declare-fun res!749978 () Bool)

(assert (=> b!1122562 (=> (not res!749978) (not e!639090))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1122562 (= res!749978 (and (= (size!35771 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35770 _keys!1208) (size!35771 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122563 () Bool)

(declare-fun res!749977 () Bool)

(assert (=> b!1122563 (=> (not res!749977) (not e!639088))))

(assert (=> b!1122563 (= res!749977 (arrayNoDuplicates!0 lt!498607 #b00000000000000000000000000000000 Nil!24601))))

(declare-fun b!1122564 () Bool)

(declare-fun e!639091 () Bool)

(assert (=> b!1122564 (= e!639088 (not e!639091))))

(declare-fun res!749987 () Bool)

(assert (=> b!1122564 (=> res!749987 e!639091)))

(assert (=> b!1122564 (= res!749987 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122564 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36657 0))(
  ( (Unit!36658) )
))
(declare-fun lt!498608 () Unit!36657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73158 (_ BitVec 64) (_ BitVec 32)) Unit!36657)

(assert (=> b!1122564 (= lt!498608 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!639093 () Bool)

(declare-datatypes ((tuple2!17836 0))(
  ( (tuple2!17837 (_1!8929 (_ BitVec 64)) (_2!8929 V!42705)) )
))
(declare-datatypes ((List!24605 0))(
  ( (Nil!24602) (Cons!24601 (h!25810 tuple2!17836) (t!35241 List!24605)) )
))
(declare-datatypes ((ListLongMap!15805 0))(
  ( (ListLongMap!15806 (toList!7918 List!24605)) )
))
(declare-fun call!47218 () ListLongMap!15805)

(declare-fun b!1122565 () Bool)

(declare-fun call!47219 () ListLongMap!15805)

(declare-fun -!1065 (ListLongMap!15805 (_ BitVec 64)) ListLongMap!15805)

(assert (=> b!1122565 (= e!639093 (= call!47219 (-!1065 call!47218 k0!934)))))

(declare-fun b!1122566 () Bool)

(declare-fun res!749981 () Bool)

(assert (=> b!1122566 (=> (not res!749981) (not e!639090))))

(assert (=> b!1122566 (= res!749981 (= (select (arr!35232 _keys!1208) i!673) k0!934))))

(declare-fun b!1122567 () Bool)

(declare-fun e!639092 () Bool)

(assert (=> b!1122567 (= e!639091 e!639092)))

(declare-fun res!749983 () Bool)

(assert (=> b!1122567 (=> res!749983 e!639092)))

(assert (=> b!1122567 (= res!749983 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42705)

(declare-fun lt!498611 () array!73160)

(declare-fun minValue!944 () V!42705)

(declare-fun lt!498606 () ListLongMap!15805)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4425 (array!73158 array!73160 (_ BitVec 32) (_ BitVec 32) V!42705 V!42705 (_ BitVec 32) Int) ListLongMap!15805)

(assert (=> b!1122567 (= lt!498606 (getCurrentListMapNoExtraKeys!4425 lt!498607 lt!498611 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2460 (Int (_ BitVec 64)) V!42705)

(assert (=> b!1122567 (= lt!498611 (array!73161 (store (arr!35233 _values!996) i!673 (ValueCellFull!13382 (dynLambda!2460 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35771 _values!996)))))

(declare-fun lt!498612 () ListLongMap!15805)

(assert (=> b!1122567 (= lt!498612 (getCurrentListMapNoExtraKeys!4425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47215 () Bool)

(assert (=> bm!47215 (= call!47218 (getCurrentListMapNoExtraKeys!4425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122568 () Bool)

(assert (=> b!1122568 (= e!639093 (= call!47219 call!47218))))

(declare-fun b!1122569 () Bool)

(declare-fun res!749984 () Bool)

(assert (=> b!1122569 (=> (not res!749984) (not e!639090))))

(assert (=> b!1122569 (= res!749984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44092 () Bool)

(assert (=> mapIsEmpty!44092 mapRes!44092))

(declare-fun b!1122570 () Bool)

(declare-fun e!639089 () Bool)

(assert (=> b!1122570 (= e!639089 true)))

(declare-fun lt!498610 () Bool)

(declare-fun contains!6395 (ListLongMap!15805 (_ BitVec 64)) Bool)

(assert (=> b!1122570 (= lt!498610 (contains!6395 (getCurrentListMapNoExtraKeys!4425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122571 () Bool)

(declare-fun res!749986 () Bool)

(assert (=> b!1122571 (=> (not res!749986) (not e!639090))))

(assert (=> b!1122571 (= res!749986 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35770 _keys!1208))))))

(declare-fun b!1122572 () Bool)

(assert (=> b!1122572 (= e!639092 e!639089)))

(declare-fun res!749982 () Bool)

(assert (=> b!1122572 (=> res!749982 e!639089)))

(assert (=> b!1122572 (= res!749982 (not (= (select (arr!35232 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1122572 e!639093))

(declare-fun c!109443 () Bool)

(assert (=> b!1122572 (= c!109443 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498609 () Unit!36657)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!342 (array!73158 array!73160 (_ BitVec 32) (_ BitVec 32) V!42705 V!42705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36657)

(assert (=> b!1122572 (= lt!498609 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122573 () Bool)

(assert (=> b!1122573 (= e!639094 (and e!639096 mapRes!44092))))

(declare-fun condMapEmpty!44092 () Bool)

(declare-fun mapDefault!44092 () ValueCell!13382)

(assert (=> b!1122573 (= condMapEmpty!44092 (= (arr!35233 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13382)) mapDefault!44092)))))

(declare-fun bm!47216 () Bool)

(assert (=> bm!47216 (= call!47219 (getCurrentListMapNoExtraKeys!4425 lt!498607 lt!498611 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97946 res!749985) b!1122558))

(assert (= (and b!1122558 res!749979) b!1122562))

(assert (= (and b!1122562 res!749978) b!1122569))

(assert (= (and b!1122569 res!749984) b!1122559))

(assert (= (and b!1122559 res!749988) b!1122571))

(assert (= (and b!1122571 res!749986) b!1122560))

(assert (= (and b!1122560 res!749980) b!1122566))

(assert (= (and b!1122566 res!749981) b!1122561))

(assert (= (and b!1122561 res!749989) b!1122563))

(assert (= (and b!1122563 res!749977) b!1122564))

(assert (= (and b!1122564 (not res!749987)) b!1122567))

(assert (= (and b!1122567 (not res!749983)) b!1122572))

(assert (= (and b!1122572 c!109443) b!1122565))

(assert (= (and b!1122572 (not c!109443)) b!1122568))

(assert (= (or b!1122565 b!1122568) bm!47216))

(assert (= (or b!1122565 b!1122568) bm!47215))

(assert (= (and b!1122572 (not res!749982)) b!1122570))

(assert (= (and b!1122573 condMapEmpty!44092) mapIsEmpty!44092))

(assert (= (and b!1122573 (not condMapEmpty!44092)) mapNonEmpty!44092))

(get-info :version)

(assert (= (and mapNonEmpty!44092 ((_ is ValueCellFull!13382) mapValue!44092)) b!1122556))

(assert (= (and b!1122573 ((_ is ValueCellFull!13382) mapDefault!44092)) b!1122557))

(assert (= start!97946 b!1122573))

(declare-fun b_lambda!18605 () Bool)

(assert (=> (not b_lambda!18605) (not b!1122567)))

(declare-fun t!35239 () Bool)

(declare-fun tb!8457 () Bool)

(assert (=> (and start!97946 (= defaultEntry!1004 defaultEntry!1004) t!35239) tb!8457))

(declare-fun result!17483 () Bool)

(assert (=> tb!8457 (= result!17483 tp_is_empty!28183)))

(assert (=> b!1122567 t!35239))

(declare-fun b_and!38069 () Bool)

(assert (= b_and!38067 (and (=> t!35239 result!17483) b_and!38069)))

(declare-fun m!1036665 () Bool)

(assert (=> b!1122565 m!1036665))

(declare-fun m!1036667 () Bool)

(assert (=> b!1122570 m!1036667))

(assert (=> b!1122570 m!1036667))

(declare-fun m!1036669 () Bool)

(assert (=> b!1122570 m!1036669))

(declare-fun m!1036671 () Bool)

(assert (=> b!1122569 m!1036671))

(declare-fun m!1036673 () Bool)

(assert (=> b!1122566 m!1036673))

(declare-fun m!1036675 () Bool)

(assert (=> mapNonEmpty!44092 m!1036675))

(declare-fun m!1036677 () Bool)

(assert (=> b!1122564 m!1036677))

(declare-fun m!1036679 () Bool)

(assert (=> b!1122564 m!1036679))

(declare-fun m!1036681 () Bool)

(assert (=> b!1122561 m!1036681))

(declare-fun m!1036683 () Bool)

(assert (=> b!1122561 m!1036683))

(declare-fun m!1036685 () Bool)

(assert (=> b!1122572 m!1036685))

(declare-fun m!1036687 () Bool)

(assert (=> b!1122572 m!1036687))

(declare-fun m!1036689 () Bool)

(assert (=> b!1122563 m!1036689))

(declare-fun m!1036691 () Bool)

(assert (=> b!1122558 m!1036691))

(assert (=> bm!47215 m!1036667))

(declare-fun m!1036693 () Bool)

(assert (=> start!97946 m!1036693))

(declare-fun m!1036695 () Bool)

(assert (=> start!97946 m!1036695))

(declare-fun m!1036697 () Bool)

(assert (=> b!1122567 m!1036697))

(declare-fun m!1036699 () Bool)

(assert (=> b!1122567 m!1036699))

(declare-fun m!1036701 () Bool)

(assert (=> b!1122567 m!1036701))

(declare-fun m!1036703 () Bool)

(assert (=> b!1122567 m!1036703))

(declare-fun m!1036705 () Bool)

(assert (=> b!1122560 m!1036705))

(declare-fun m!1036707 () Bool)

(assert (=> bm!47216 m!1036707))

(declare-fun m!1036709 () Bool)

(assert (=> b!1122559 m!1036709))

(check-sat (not mapNonEmpty!44092) (not b!1122564) (not b!1122559) (not bm!47215) (not b_lambda!18605) (not start!97946) (not b!1122565) (not b!1122561) tp_is_empty!28183 (not b!1122569) (not b!1122563) (not b_next!23653) (not b!1122558) (not bm!47216) (not b!1122572) (not b!1122570) b_and!38069 (not b!1122560) (not b!1122567))
(check-sat b_and!38069 (not b_next!23653))

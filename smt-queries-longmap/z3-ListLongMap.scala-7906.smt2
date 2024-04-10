; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98182 () Bool)

(assert start!98182)

(declare-fun b_free!23883 () Bool)

(declare-fun b_next!23883 () Bool)

(assert (=> start!98182 (= b_free!23883 (not b_next!23883))))

(declare-fun tp!84353 () Bool)

(declare-fun b_and!38549 () Bool)

(assert (=> start!98182 (= tp!84353 b_and!38549)))

(declare-fun bm!48066 () Bool)

(declare-datatypes ((V!43011 0))(
  ( (V!43012 (val!14263 Int)) )
))
(declare-datatypes ((tuple2!17960 0))(
  ( (tuple2!17961 (_1!8991 (_ BitVec 64)) (_2!8991 V!43011)) )
))
(declare-datatypes ((List!24727 0))(
  ( (Nil!24724) (Cons!24723 (h!25932 tuple2!17960) (t!35602 List!24727)) )
))
(declare-datatypes ((ListLongMap!15929 0))(
  ( (ListLongMap!15930 (toList!7980 List!24727)) )
))
(declare-fun call!48070 () ListLongMap!15929)

(declare-fun call!48072 () ListLongMap!15929)

(assert (=> bm!48066 (= call!48070 call!48072)))

(declare-fun b!1129516 () Bool)

(declare-fun e!642828 () Bool)

(declare-fun e!642836 () Bool)

(assert (=> b!1129516 (= e!642828 e!642836)))

(declare-fun res!754791 () Bool)

(assert (=> b!1129516 (=> (not res!754791) (not e!642836))))

(declare-datatypes ((array!73683 0))(
  ( (array!73684 (arr!35494 (Array (_ BitVec 32) (_ BitVec 64))) (size!36030 (_ BitVec 32))) )
))
(declare-fun lt!501468 () array!73683)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73683 (_ BitVec 32)) Bool)

(assert (=> b!1129516 (= res!754791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501468 mask!1564))))

(declare-fun _keys!1208 () array!73683)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129516 (= lt!501468 (array!73684 (store (arr!35494 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36030 _keys!1208)))))

(declare-fun b!1129517 () Bool)

(declare-fun e!642823 () Bool)

(declare-fun e!642835 () Bool)

(assert (=> b!1129517 (= e!642823 e!642835)))

(declare-fun res!754792 () Bool)

(assert (=> b!1129517 (=> res!754792 e!642835)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1129517 (= res!754792 (not (= (select (arr!35494 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642827 () Bool)

(assert (=> b!1129517 e!642827))

(declare-fun c!109886 () Bool)

(assert (=> b!1129517 (= c!109886 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43011)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13497 0))(
  ( (ValueCellFull!13497 (v!16896 V!43011)) (EmptyCell!13497) )
))
(declare-datatypes ((array!73685 0))(
  ( (array!73686 (arr!35495 (Array (_ BitVec 32) ValueCell!13497)) (size!36031 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73685)

(declare-fun minValue!944 () V!43011)

(declare-datatypes ((Unit!37003 0))(
  ( (Unit!37004) )
))
(declare-fun lt!501471 () Unit!37003)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!413 (array!73683 array!73685 (_ BitVec 32) (_ BitVec 32) V!43011 V!43011 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37003)

(assert (=> b!1129517 (= lt!501471 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129518 () Bool)

(declare-fun e!642832 () Unit!37003)

(declare-fun e!642837 () Unit!37003)

(assert (=> b!1129518 (= e!642832 e!642837)))

(declare-fun c!109887 () Bool)

(declare-fun lt!501481 () Bool)

(assert (=> b!1129518 (= c!109887 (and (not lt!501481) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129519 () Bool)

(declare-fun e!642825 () Bool)

(declare-fun e!642831 () Bool)

(declare-fun mapRes!44437 () Bool)

(assert (=> b!1129519 (= e!642825 (and e!642831 mapRes!44437))))

(declare-fun condMapEmpty!44437 () Bool)

(declare-fun mapDefault!44437 () ValueCell!13497)

(assert (=> b!1129519 (= condMapEmpty!44437 (= (arr!35495 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13497)) mapDefault!44437)))))

(declare-fun c!109885 () Bool)

(declare-fun lt!501480 () ListLongMap!15929)

(declare-fun bm!48067 () Bool)

(declare-fun +!3431 (ListLongMap!15929 tuple2!17960) ListLongMap!15929)

(assert (=> bm!48067 (= call!48072 (+!3431 lt!501480 (ite (or c!109885 c!109887) (tuple2!17961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129520 () Bool)

(declare-fun e!642829 () Bool)

(assert (=> b!1129520 (= e!642835 e!642829)))

(declare-fun res!754798 () Bool)

(assert (=> b!1129520 (=> res!754798 e!642829)))

(declare-fun contains!6503 (ListLongMap!15929 (_ BitVec 64)) Bool)

(assert (=> b!1129520 (= res!754798 (not (contains!6503 lt!501480 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4467 (array!73683 array!73685 (_ BitVec 32) (_ BitVec 32) V!43011 V!43011 (_ BitVec 32) Int) ListLongMap!15929)

(assert (=> b!1129520 (= lt!501480 (getCurrentListMapNoExtraKeys!4467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!754790 () Bool)

(assert (=> start!98182 (=> (not res!754790) (not e!642828))))

(assert (=> start!98182 (= res!754790 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36030 _keys!1208))))))

(assert (=> start!98182 e!642828))

(declare-fun tp_is_empty!28413 () Bool)

(assert (=> start!98182 tp_is_empty!28413))

(declare-fun array_inv!27230 (array!73683) Bool)

(assert (=> start!98182 (array_inv!27230 _keys!1208)))

(assert (=> start!98182 true))

(assert (=> start!98182 tp!84353))

(declare-fun array_inv!27231 (array!73685) Bool)

(assert (=> start!98182 (and (array_inv!27231 _values!996) e!642825)))

(declare-fun b!1129521 () Bool)

(declare-fun res!754797 () Bool)

(assert (=> b!1129521 (=> (not res!754797) (not e!642828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129521 (= res!754797 (validKeyInArray!0 k0!934))))

(declare-fun b!1129522 () Bool)

(declare-fun e!642830 () Bool)

(assert (=> b!1129522 (= e!642830 e!642823)))

(declare-fun res!754786 () Bool)

(assert (=> b!1129522 (=> res!754786 e!642823)))

(assert (=> b!1129522 (= res!754786 (not (= from!1455 i!673)))))

(declare-fun lt!501473 () array!73685)

(declare-fun lt!501472 () ListLongMap!15929)

(assert (=> b!1129522 (= lt!501472 (getCurrentListMapNoExtraKeys!4467 lt!501468 lt!501473 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2545 (Int (_ BitVec 64)) V!43011)

(assert (=> b!1129522 (= lt!501473 (array!73686 (store (arr!35495 _values!996) i!673 (ValueCellFull!13497 (dynLambda!2545 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36031 _values!996)))))

(declare-fun lt!501469 () ListLongMap!15929)

(assert (=> b!1129522 (= lt!501469 (getCurrentListMapNoExtraKeys!4467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!501470 () ListLongMap!15929)

(declare-fun bm!48068 () Bool)

(declare-fun call!48071 () Bool)

(assert (=> bm!48068 (= call!48071 (contains!6503 (ite c!109885 lt!501470 call!48070) k0!934))))

(declare-fun b!1129523 () Bool)

(declare-fun e!642833 () Bool)

(assert (=> b!1129523 (= e!642833 tp_is_empty!28413)))

(declare-fun call!48069 () ListLongMap!15929)

(declare-fun call!48074 () ListLongMap!15929)

(declare-fun b!1129524 () Bool)

(declare-fun -!1161 (ListLongMap!15929 (_ BitVec 64)) ListLongMap!15929)

(assert (=> b!1129524 (= e!642827 (= call!48069 (-!1161 call!48074 k0!934)))))

(declare-fun mapIsEmpty!44437 () Bool)

(assert (=> mapIsEmpty!44437 mapRes!44437))

(declare-fun b!1129525 () Bool)

(declare-fun c!109884 () Bool)

(assert (=> b!1129525 (= c!109884 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501481))))

(declare-fun e!642824 () Unit!37003)

(assert (=> b!1129525 (= e!642837 e!642824)))

(declare-fun b!1129526 () Bool)

(assert (=> b!1129526 (= e!642831 tp_is_empty!28413)))

(declare-fun bm!48069 () Bool)

(assert (=> bm!48069 (= call!48074 (getCurrentListMapNoExtraKeys!4467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48070 () Bool)

(assert (=> bm!48070 (= call!48069 (getCurrentListMapNoExtraKeys!4467 lt!501468 lt!501473 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48071 () Bool)

(declare-fun call!48073 () Unit!37003)

(declare-fun call!48076 () Unit!37003)

(assert (=> bm!48071 (= call!48073 call!48076)))

(declare-fun b!1129527 () Bool)

(declare-fun res!754789 () Bool)

(assert (=> b!1129527 (=> (not res!754789) (not e!642828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129527 (= res!754789 (validMask!0 mask!1564))))

(declare-fun b!1129528 () Bool)

(declare-fun res!754784 () Bool)

(assert (=> b!1129528 (=> (not res!754784) (not e!642828))))

(assert (=> b!1129528 (= res!754784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129529 () Bool)

(assert (=> b!1129529 (= e!642827 (= call!48069 call!48074))))

(declare-fun b!1129530 () Bool)

(declare-fun res!754785 () Bool)

(assert (=> b!1129530 (=> (not res!754785) (not e!642828))))

(assert (=> b!1129530 (= res!754785 (and (= (size!36031 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36030 _keys!1208) (size!36031 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129531 () Bool)

(declare-fun call!48075 () Bool)

(assert (=> b!1129531 call!48075))

(declare-fun lt!501479 () Unit!37003)

(assert (=> b!1129531 (= lt!501479 call!48073)))

(assert (=> b!1129531 (= e!642837 lt!501479)))

(declare-fun b!1129532 () Bool)

(declare-fun res!754793 () Bool)

(assert (=> b!1129532 (=> (not res!754793) (not e!642828))))

(declare-datatypes ((List!24728 0))(
  ( (Nil!24725) (Cons!24724 (h!25933 (_ BitVec 64)) (t!35603 List!24728)) )
))
(declare-fun arrayNoDuplicates!0 (array!73683 (_ BitVec 32) List!24728) Bool)

(assert (=> b!1129532 (= res!754793 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24725))))

(declare-fun bm!48072 () Bool)

(assert (=> bm!48072 (= call!48075 call!48071)))

(declare-fun b!1129533 () Bool)

(assert (=> b!1129533 (= e!642836 (not e!642830))))

(declare-fun res!754794 () Bool)

(assert (=> b!1129533 (=> res!754794 e!642830)))

(assert (=> b!1129533 (= res!754794 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129533 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501475 () Unit!37003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73683 (_ BitVec 64) (_ BitVec 32)) Unit!37003)

(assert (=> b!1129533 (= lt!501475 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44437 () Bool)

(declare-fun tp!84352 () Bool)

(assert (=> mapNonEmpty!44437 (= mapRes!44437 (and tp!84352 e!642833))))

(declare-fun mapValue!44437 () ValueCell!13497)

(declare-fun mapKey!44437 () (_ BitVec 32))

(declare-fun mapRest!44437 () (Array (_ BitVec 32) ValueCell!13497))

(assert (=> mapNonEmpty!44437 (= (arr!35495 _values!996) (store mapRest!44437 mapKey!44437 mapValue!44437))))

(declare-fun b!1129534 () Bool)

(declare-fun lt!501477 () Unit!37003)

(assert (=> b!1129534 (= e!642832 lt!501477)))

(declare-fun lt!501478 () Unit!37003)

(declare-fun addStillContains!694 (ListLongMap!15929 (_ BitVec 64) V!43011 (_ BitVec 64)) Unit!37003)

(assert (=> b!1129534 (= lt!501478 (addStillContains!694 lt!501480 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1129534 (= lt!501470 call!48072)))

(assert (=> b!1129534 call!48071))

(assert (=> b!1129534 (= lt!501477 call!48076)))

(assert (=> b!1129534 (contains!6503 (+!3431 lt!501470 (tuple2!17961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1129535 () Bool)

(declare-fun e!642826 () Bool)

(assert (=> b!1129535 (= e!642829 e!642826)))

(declare-fun res!754787 () Bool)

(assert (=> b!1129535 (=> res!754787 e!642826)))

(assert (=> b!1129535 (= res!754787 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36030 _keys!1208))))))

(declare-fun lt!501474 () Unit!37003)

(assert (=> b!1129535 (= lt!501474 e!642832)))

(assert (=> b!1129535 (= c!109885 (and (not lt!501481) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129535 (= lt!501481 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1129536 () Bool)

(declare-fun res!754796 () Bool)

(assert (=> b!1129536 (=> (not res!754796) (not e!642836))))

(assert (=> b!1129536 (= res!754796 (arrayNoDuplicates!0 lt!501468 #b00000000000000000000000000000000 Nil!24725))))

(declare-fun bm!48073 () Bool)

(assert (=> bm!48073 (= call!48076 (addStillContains!694 (ite c!109885 lt!501470 lt!501480) (ite c!109885 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109887 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109885 minValue!944 (ite c!109887 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1129537 () Bool)

(declare-fun res!754788 () Bool)

(assert (=> b!1129537 (=> (not res!754788) (not e!642828))))

(assert (=> b!1129537 (= res!754788 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36030 _keys!1208))))))

(declare-fun b!1129538 () Bool)

(declare-fun res!754795 () Bool)

(assert (=> b!1129538 (=> (not res!754795) (not e!642828))))

(assert (=> b!1129538 (= res!754795 (= (select (arr!35494 _keys!1208) i!673) k0!934))))

(declare-fun b!1129539 () Bool)

(assert (=> b!1129539 (= e!642826 true)))

(declare-fun lt!501476 () Bool)

(declare-fun getCurrentListMap!4416 (array!73683 array!73685 (_ BitVec 32) (_ BitVec 32) V!43011 V!43011 (_ BitVec 32) Int) ListLongMap!15929)

(assert (=> b!1129539 (= lt!501476 (contains!6503 (getCurrentListMap!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1129540 () Bool)

(declare-fun lt!501482 () Unit!37003)

(assert (=> b!1129540 (= e!642824 lt!501482)))

(assert (=> b!1129540 (= lt!501482 call!48073)))

(assert (=> b!1129540 call!48075))

(declare-fun b!1129541 () Bool)

(declare-fun Unit!37005 () Unit!37003)

(assert (=> b!1129541 (= e!642824 Unit!37005)))

(assert (= (and start!98182 res!754790) b!1129527))

(assert (= (and b!1129527 res!754789) b!1129530))

(assert (= (and b!1129530 res!754785) b!1129528))

(assert (= (and b!1129528 res!754784) b!1129532))

(assert (= (and b!1129532 res!754793) b!1129537))

(assert (= (and b!1129537 res!754788) b!1129521))

(assert (= (and b!1129521 res!754797) b!1129538))

(assert (= (and b!1129538 res!754795) b!1129516))

(assert (= (and b!1129516 res!754791) b!1129536))

(assert (= (and b!1129536 res!754796) b!1129533))

(assert (= (and b!1129533 (not res!754794)) b!1129522))

(assert (= (and b!1129522 (not res!754786)) b!1129517))

(assert (= (and b!1129517 c!109886) b!1129524))

(assert (= (and b!1129517 (not c!109886)) b!1129529))

(assert (= (or b!1129524 b!1129529) bm!48070))

(assert (= (or b!1129524 b!1129529) bm!48069))

(assert (= (and b!1129517 (not res!754792)) b!1129520))

(assert (= (and b!1129520 (not res!754798)) b!1129535))

(assert (= (and b!1129535 c!109885) b!1129534))

(assert (= (and b!1129535 (not c!109885)) b!1129518))

(assert (= (and b!1129518 c!109887) b!1129531))

(assert (= (and b!1129518 (not c!109887)) b!1129525))

(assert (= (and b!1129525 c!109884) b!1129540))

(assert (= (and b!1129525 (not c!109884)) b!1129541))

(assert (= (or b!1129531 b!1129540) bm!48071))

(assert (= (or b!1129531 b!1129540) bm!48066))

(assert (= (or b!1129531 b!1129540) bm!48072))

(assert (= (or b!1129534 bm!48072) bm!48068))

(assert (= (or b!1129534 bm!48071) bm!48073))

(assert (= (or b!1129534 bm!48066) bm!48067))

(assert (= (and b!1129535 (not res!754787)) b!1129539))

(assert (= (and b!1129519 condMapEmpty!44437) mapIsEmpty!44437))

(assert (= (and b!1129519 (not condMapEmpty!44437)) mapNonEmpty!44437))

(get-info :version)

(assert (= (and mapNonEmpty!44437 ((_ is ValueCellFull!13497) mapValue!44437)) b!1129523))

(assert (= (and b!1129519 ((_ is ValueCellFull!13497) mapDefault!44437)) b!1129526))

(assert (= start!98182 b!1129519))

(declare-fun b_lambda!18853 () Bool)

(assert (=> (not b_lambda!18853) (not b!1129522)))

(declare-fun t!35601 () Bool)

(declare-fun tb!8695 () Bool)

(assert (=> (and start!98182 (= defaultEntry!1004 defaultEntry!1004) t!35601) tb!8695))

(declare-fun result!17951 () Bool)

(assert (=> tb!8695 (= result!17951 tp_is_empty!28413)))

(assert (=> b!1129522 t!35601))

(declare-fun b_and!38551 () Bool)

(assert (= b_and!38549 (and (=> t!35601 result!17951) b_and!38551)))

(declare-fun m!1042879 () Bool)

(assert (=> start!98182 m!1042879))

(declare-fun m!1042881 () Bool)

(assert (=> start!98182 m!1042881))

(declare-fun m!1042883 () Bool)

(assert (=> bm!48069 m!1042883))

(declare-fun m!1042885 () Bool)

(assert (=> b!1129527 m!1042885))

(declare-fun m!1042887 () Bool)

(assert (=> b!1129538 m!1042887))

(declare-fun m!1042889 () Bool)

(assert (=> b!1129536 m!1042889))

(declare-fun m!1042891 () Bool)

(assert (=> b!1129528 m!1042891))

(declare-fun m!1042893 () Bool)

(assert (=> b!1129524 m!1042893))

(declare-fun m!1042895 () Bool)

(assert (=> b!1129539 m!1042895))

(assert (=> b!1129539 m!1042895))

(declare-fun m!1042897 () Bool)

(assert (=> b!1129539 m!1042897))

(declare-fun m!1042899 () Bool)

(assert (=> mapNonEmpty!44437 m!1042899))

(declare-fun m!1042901 () Bool)

(assert (=> b!1129516 m!1042901))

(declare-fun m!1042903 () Bool)

(assert (=> b!1129516 m!1042903))

(declare-fun m!1042905 () Bool)

(assert (=> b!1129517 m!1042905))

(declare-fun m!1042907 () Bool)

(assert (=> b!1129517 m!1042907))

(declare-fun m!1042909 () Bool)

(assert (=> bm!48067 m!1042909))

(declare-fun m!1042911 () Bool)

(assert (=> b!1129520 m!1042911))

(assert (=> b!1129520 m!1042883))

(declare-fun m!1042913 () Bool)

(assert (=> bm!48068 m!1042913))

(declare-fun m!1042915 () Bool)

(assert (=> bm!48073 m!1042915))

(declare-fun m!1042917 () Bool)

(assert (=> b!1129534 m!1042917))

(declare-fun m!1042919 () Bool)

(assert (=> b!1129534 m!1042919))

(assert (=> b!1129534 m!1042919))

(declare-fun m!1042921 () Bool)

(assert (=> b!1129534 m!1042921))

(declare-fun m!1042923 () Bool)

(assert (=> b!1129533 m!1042923))

(declare-fun m!1042925 () Bool)

(assert (=> b!1129533 m!1042925))

(declare-fun m!1042927 () Bool)

(assert (=> b!1129532 m!1042927))

(declare-fun m!1042929 () Bool)

(assert (=> bm!48070 m!1042929))

(declare-fun m!1042931 () Bool)

(assert (=> b!1129521 m!1042931))

(declare-fun m!1042933 () Bool)

(assert (=> b!1129522 m!1042933))

(declare-fun m!1042935 () Bool)

(assert (=> b!1129522 m!1042935))

(declare-fun m!1042937 () Bool)

(assert (=> b!1129522 m!1042937))

(declare-fun m!1042939 () Bool)

(assert (=> b!1129522 m!1042939))

(check-sat (not b!1129528) b_and!38551 (not b!1129539) (not b!1129517) (not bm!48067) (not b_lambda!18853) (not bm!48073) (not b!1129534) (not b!1129516) (not bm!48070) (not b!1129532) tp_is_empty!28413 (not mapNonEmpty!44437) (not b!1129522) (not b_next!23883) (not b!1129524) (not b!1129533) (not b!1129520) (not b!1129521) (not bm!48069) (not b!1129527) (not b!1129536) (not start!98182) (not bm!48068))
(check-sat b_and!38551 (not b_next!23883))

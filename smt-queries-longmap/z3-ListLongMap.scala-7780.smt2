; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97660 () Bool)

(assert start!97660)

(declare-fun b_free!23395 () Bool)

(declare-fun b_next!23395 () Bool)

(assert (=> start!97660 (= b_free!23395 (not b_next!23395))))

(declare-fun tp!82484 () Bool)

(declare-fun b_and!37633 () Bool)

(assert (=> start!97660 (= tp!82484 b_and!37633)))

(declare-fun b!1112592 () Bool)

(declare-fun res!742112 () Bool)

(declare-fun e!634546 () Bool)

(assert (=> b!1112592 (=> (not res!742112) (not e!634546))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112592 (= res!742112 (validKeyInArray!0 k0!934))))

(declare-fun b!1112593 () Bool)

(declare-fun res!742110 () Bool)

(declare-fun e!634544 () Bool)

(assert (=> b!1112593 (=> (not res!742110) (not e!634544))))

(declare-datatypes ((array!72261 0))(
  ( (array!72262 (arr!34777 (Array (_ BitVec 32) (_ BitVec 64))) (size!35314 (_ BitVec 32))) )
))
(declare-fun lt!496831 () array!72261)

(declare-datatypes ((List!24270 0))(
  ( (Nil!24267) (Cons!24266 (h!25484 (_ BitVec 64)) (t!34703 List!24270)) )
))
(declare-fun arrayNoDuplicates!0 (array!72261 (_ BitVec 32) List!24270) Bool)

(assert (=> b!1112593 (= res!742110 (arrayNoDuplicates!0 lt!496831 #b00000000000000000000000000000000 Nil!24267))))

(declare-fun b!1112594 () Bool)

(assert (=> b!1112594 (= e!634546 e!634544)))

(declare-fun res!742107 () Bool)

(assert (=> b!1112594 (=> (not res!742107) (not e!634544))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72261 (_ BitVec 32)) Bool)

(assert (=> b!1112594 (= res!742107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496831 mask!1564))))

(declare-fun _keys!1208 () array!72261)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112594 (= lt!496831 (array!72262 (store (arr!34777 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35314 _keys!1208)))))

(declare-fun res!742113 () Bool)

(assert (=> start!97660 (=> (not res!742113) (not e!634546))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97660 (= res!742113 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35314 _keys!1208))))))

(assert (=> start!97660 e!634546))

(declare-fun tp_is_empty!27655 () Bool)

(assert (=> start!97660 tp_is_empty!27655))

(declare-fun array_inv!26798 (array!72261) Bool)

(assert (=> start!97660 (array_inv!26798 _keys!1208)))

(assert (=> start!97660 true))

(assert (=> start!97660 tp!82484))

(declare-datatypes ((V!42001 0))(
  ( (V!42002 (val!13884 Int)) )
))
(declare-datatypes ((ValueCell!13118 0))(
  ( (ValueCellFull!13118 (v!16513 V!42001)) (EmptyCell!13118) )
))
(declare-datatypes ((array!72263 0))(
  ( (array!72264 (arr!34778 (Array (_ BitVec 32) ValueCell!13118)) (size!35315 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72263)

(declare-fun e!634548 () Bool)

(declare-fun array_inv!26799 (array!72263) Bool)

(assert (=> start!97660 (and (array_inv!26799 _values!996) e!634548)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1112595 () Bool)

(declare-fun e!634539 () array!72263)

(declare-fun dynLambda!2441 (Int (_ BitVec 64)) V!42001)

(assert (=> b!1112595 (= e!634539 (array!72264 (store (arr!34778 _values!996) i!673 (ValueCellFull!13118 (dynLambda!2441 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35315 _values!996)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!634543 () array!72263)

(declare-fun c!109692 () Bool)

(declare-fun minValue!944 () V!42001)

(declare-datatypes ((tuple2!17588 0))(
  ( (tuple2!17589 (_1!8805 (_ BitVec 64)) (_2!8805 V!42001)) )
))
(declare-datatypes ((List!24271 0))(
  ( (Nil!24268) (Cons!24267 (h!25485 tuple2!17588) (t!34704 List!24271)) )
))
(declare-datatypes ((ListLongMap!15565 0))(
  ( (ListLongMap!15566 (toList!7798 List!24271)) )
))
(declare-fun call!46949 () ListLongMap!15565)

(declare-fun bm!46945 () Bool)

(declare-fun zeroValue!944 () V!42001)

(declare-fun getCurrentListMapNoExtraKeys!4329 (array!72261 array!72263 (_ BitVec 32) (_ BitVec 32) V!42001 V!42001 (_ BitVec 32) Int) ListLongMap!15565)

(assert (=> bm!46945 (= call!46949 (getCurrentListMapNoExtraKeys!4329 (ite c!109692 _keys!1208 lt!496831) e!634543 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!109694 () Bool)

(assert (=> bm!46945 (= c!109694 c!109692)))

(declare-fun b!1112596 () Bool)

(declare-fun res!742105 () Bool)

(assert (=> b!1112596 (=> (not res!742105) (not e!634546))))

(assert (=> b!1112596 (= res!742105 (and (= (size!35315 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35314 _keys!1208) (size!35315 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!46948 () ListLongMap!15565)

(declare-fun bm!46946 () Bool)

(assert (=> bm!46946 (= call!46948 (getCurrentListMapNoExtraKeys!4329 (ite c!109692 lt!496831 _keys!1208) e!634539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!109693 () Bool)

(assert (=> bm!46946 (= c!109693 c!109692)))

(declare-fun b!1112597 () Bool)

(declare-fun res!742104 () Bool)

(assert (=> b!1112597 (=> (not res!742104) (not e!634546))))

(assert (=> b!1112597 (= res!742104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112598 () Bool)

(declare-fun e!634541 () Bool)

(assert (=> b!1112598 (= e!634541 tp_is_empty!27655)))

(declare-fun b!1112599 () Bool)

(declare-fun e!634542 () Bool)

(assert (=> b!1112599 (= e!634542 (= call!46949 call!46948))))

(declare-fun b!1112600 () Bool)

(declare-fun -!1046 (ListLongMap!15565 (_ BitVec 64)) ListLongMap!15565)

(assert (=> b!1112600 (= e!634542 (= call!46948 (-!1046 call!46949 k0!934)))))

(declare-fun mapIsEmpty!43300 () Bool)

(declare-fun mapRes!43300 () Bool)

(assert (=> mapIsEmpty!43300 mapRes!43300))

(declare-fun b!1112601 () Bool)

(declare-fun res!742108 () Bool)

(assert (=> b!1112601 (=> (not res!742108) (not e!634546))))

(assert (=> b!1112601 (= res!742108 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35314 _keys!1208))))))

(declare-fun b!1112602 () Bool)

(declare-fun e!634547 () Bool)

(assert (=> b!1112602 (= e!634547 true)))

(assert (=> b!1112602 e!634542))

(assert (=> b!1112602 (= c!109692 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36443 0))(
  ( (Unit!36444) )
))
(declare-fun lt!496829 () Unit!36443)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!310 (array!72261 array!72263 (_ BitVec 32) (_ BitVec 32) V!42001 V!42001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36443)

(assert (=> b!1112602 (= lt!496829 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112603 () Bool)

(declare-fun e!634540 () Bool)

(assert (=> b!1112603 (= e!634540 tp_is_empty!27655)))

(declare-fun b!1112604 () Bool)

(declare-fun res!742114 () Bool)

(assert (=> b!1112604 (=> (not res!742114) (not e!634546))))

(assert (=> b!1112604 (= res!742114 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24267))))

(declare-fun b!1112605 () Bool)

(declare-fun res!742111 () Bool)

(assert (=> b!1112605 (=> (not res!742111) (not e!634546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112605 (= res!742111 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43300 () Bool)

(declare-fun tp!82483 () Bool)

(assert (=> mapNonEmpty!43300 (= mapRes!43300 (and tp!82483 e!634540))))

(declare-fun mapKey!43300 () (_ BitVec 32))

(declare-fun mapValue!43300 () ValueCell!13118)

(declare-fun mapRest!43300 () (Array (_ BitVec 32) ValueCell!13118))

(assert (=> mapNonEmpty!43300 (= (arr!34778 _values!996) (store mapRest!43300 mapKey!43300 mapValue!43300))))

(declare-fun b!1112606 () Bool)

(assert (=> b!1112606 (= e!634548 (and e!634541 mapRes!43300))))

(declare-fun condMapEmpty!43300 () Bool)

(declare-fun mapDefault!43300 () ValueCell!13118)

(assert (=> b!1112606 (= condMapEmpty!43300 (= (arr!34778 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13118)) mapDefault!43300)))))

(declare-fun b!1112607 () Bool)

(assert (=> b!1112607 (= e!634543 _values!996)))

(declare-fun b!1112608 () Bool)

(declare-fun res!742106 () Bool)

(assert (=> b!1112608 (=> (not res!742106) (not e!634546))))

(assert (=> b!1112608 (= res!742106 (= (select (arr!34777 _keys!1208) i!673) k0!934))))

(declare-fun b!1112609 () Bool)

(assert (=> b!1112609 (= e!634543 (array!72264 (store (arr!34778 _values!996) i!673 (ValueCellFull!13118 (dynLambda!2441 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35315 _values!996)))))

(declare-fun b!1112610 () Bool)

(assert (=> b!1112610 (= e!634544 (not e!634547))))

(declare-fun res!742109 () Bool)

(assert (=> b!1112610 (=> res!742109 e!634547)))

(assert (=> b!1112610 (= res!742109 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35314 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112610 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496830 () Unit!36443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72261 (_ BitVec 64) (_ BitVec 32)) Unit!36443)

(assert (=> b!1112610 (= lt!496830 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112611 () Bool)

(assert (=> b!1112611 (= e!634539 _values!996)))

(assert (= (and start!97660 res!742113) b!1112605))

(assert (= (and b!1112605 res!742111) b!1112596))

(assert (= (and b!1112596 res!742105) b!1112597))

(assert (= (and b!1112597 res!742104) b!1112604))

(assert (= (and b!1112604 res!742114) b!1112601))

(assert (= (and b!1112601 res!742108) b!1112592))

(assert (= (and b!1112592 res!742112) b!1112608))

(assert (= (and b!1112608 res!742106) b!1112594))

(assert (= (and b!1112594 res!742107) b!1112593))

(assert (= (and b!1112593 res!742110) b!1112610))

(assert (= (and b!1112610 (not res!742109)) b!1112602))

(assert (= (and b!1112602 c!109692) b!1112600))

(assert (= (and b!1112602 (not c!109692)) b!1112599))

(assert (= (or b!1112600 b!1112599) bm!46945))

(assert (= (and bm!46945 c!109694) b!1112607))

(assert (= (and bm!46945 (not c!109694)) b!1112609))

(assert (= (or b!1112600 b!1112599) bm!46946))

(assert (= (and bm!46946 c!109693) b!1112595))

(assert (= (and bm!46946 (not c!109693)) b!1112611))

(assert (= (and b!1112606 condMapEmpty!43300) mapIsEmpty!43300))

(assert (= (and b!1112606 (not condMapEmpty!43300)) mapNonEmpty!43300))

(get-info :version)

(assert (= (and mapNonEmpty!43300 ((_ is ValueCellFull!13118) mapValue!43300)) b!1112603))

(assert (= (and b!1112606 ((_ is ValueCellFull!13118) mapDefault!43300)) b!1112598))

(assert (= start!97660 b!1112606))

(declare-fun b_lambda!18425 () Bool)

(assert (=> (not b_lambda!18425) (not b!1112595)))

(declare-fun t!34702 () Bool)

(declare-fun tb!8253 () Bool)

(assert (=> (and start!97660 (= defaultEntry!1004 defaultEntry!1004) t!34702) tb!8253))

(declare-fun result!17075 () Bool)

(assert (=> tb!8253 (= result!17075 tp_is_empty!27655)))

(assert (=> b!1112595 t!34702))

(declare-fun b_and!37635 () Bool)

(assert (= b_and!37633 (and (=> t!34702 result!17075) b_and!37635)))

(declare-fun b_lambda!18427 () Bool)

(assert (=> (not b_lambda!18427) (not b!1112609)))

(assert (=> b!1112609 t!34702))

(declare-fun b_and!37637 () Bool)

(assert (= b_and!37635 (and (=> t!34702 result!17075) b_and!37637)))

(declare-fun m!1030779 () Bool)

(assert (=> b!1112608 m!1030779))

(declare-fun m!1030781 () Bool)

(assert (=> b!1112595 m!1030781))

(declare-fun m!1030783 () Bool)

(assert (=> b!1112595 m!1030783))

(declare-fun m!1030785 () Bool)

(assert (=> start!97660 m!1030785))

(declare-fun m!1030787 () Bool)

(assert (=> start!97660 m!1030787))

(declare-fun m!1030789 () Bool)

(assert (=> b!1112605 m!1030789))

(declare-fun m!1030791 () Bool)

(assert (=> b!1112610 m!1030791))

(declare-fun m!1030793 () Bool)

(assert (=> b!1112610 m!1030793))

(declare-fun m!1030795 () Bool)

(assert (=> bm!46945 m!1030795))

(declare-fun m!1030797 () Bool)

(assert (=> b!1112602 m!1030797))

(declare-fun m!1030799 () Bool)

(assert (=> b!1112604 m!1030799))

(declare-fun m!1030801 () Bool)

(assert (=> b!1112600 m!1030801))

(declare-fun m!1030803 () Bool)

(assert (=> b!1112593 m!1030803))

(declare-fun m!1030805 () Bool)

(assert (=> b!1112594 m!1030805))

(declare-fun m!1030807 () Bool)

(assert (=> b!1112594 m!1030807))

(assert (=> b!1112609 m!1030781))

(assert (=> b!1112609 m!1030783))

(declare-fun m!1030809 () Bool)

(assert (=> mapNonEmpty!43300 m!1030809))

(declare-fun m!1030811 () Bool)

(assert (=> b!1112597 m!1030811))

(declare-fun m!1030813 () Bool)

(assert (=> bm!46946 m!1030813))

(declare-fun m!1030815 () Bool)

(assert (=> b!1112592 m!1030815))

(check-sat (not bm!46945) (not b!1112602) (not b!1112592) (not b!1112593) (not mapNonEmpty!43300) (not b!1112600) (not b!1112604) (not b!1112605) (not start!97660) (not b_lambda!18425) (not b!1112610) tp_is_empty!27655 (not b!1112594) (not b_lambda!18427) b_and!37637 (not bm!46946) (not b!1112597) (not b_next!23395))
(check-sat b_and!37637 (not b_next!23395))

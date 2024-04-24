; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98410 () Bool)

(assert start!98410)

(declare-fun b_free!23875 () Bool)

(declare-fun b_next!23875 () Bool)

(assert (=> start!98410 (= b_free!23875 (not b_next!23875))))

(declare-fun tp!84329 () Bool)

(declare-fun b_and!38543 () Bool)

(assert (=> start!98410 (= tp!84329 b_and!38543)))

(declare-fun b!1130523 () Bool)

(declare-fun c!110248 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!501803 () Bool)

(assert (=> b!1130523 (= c!110248 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501803))))

(declare-datatypes ((Unit!36972 0))(
  ( (Unit!36973) )
))
(declare-fun e!643504 () Unit!36972)

(declare-fun e!643508 () Unit!36972)

(assert (=> b!1130523 (= e!643504 e!643508)))

(declare-fun b!1130524 () Bool)

(declare-fun e!643499 () Bool)

(declare-fun tp_is_empty!28405 () Bool)

(assert (=> b!1130524 (= e!643499 tp_is_empty!28405)))

(declare-datatypes ((V!43001 0))(
  ( (V!43002 (val!14259 Int)) )
))
(declare-fun zeroValue!944 () V!43001)

(declare-fun c!110247 () Bool)

(declare-fun bm!48037 () Bool)

(declare-fun c!110249 () Bool)

(declare-datatypes ((tuple2!17968 0))(
  ( (tuple2!17969 (_1!8995 (_ BitVec 64)) (_2!8995 V!43001)) )
))
(declare-datatypes ((List!24747 0))(
  ( (Nil!24744) (Cons!24743 (h!25961 tuple2!17968) (t!35606 List!24747)) )
))
(declare-datatypes ((ListLongMap!15945 0))(
  ( (ListLongMap!15946 (toList!7988 List!24747)) )
))
(declare-fun lt!501815 () ListLongMap!15945)

(declare-fun call!48047 () ListLongMap!15945)

(declare-fun minValue!944 () V!43001)

(declare-fun +!3457 (ListLongMap!15945 tuple2!17968) ListLongMap!15945)

(assert (=> bm!48037 (= call!48047 (+!3457 lt!501815 (ite (or c!110247 c!110249) (tuple2!17969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1130525 () Bool)

(declare-fun e!643503 () Bool)

(declare-fun e!643510 () Bool)

(assert (=> b!1130525 (= e!643503 e!643510)))

(declare-fun res!755126 () Bool)

(assert (=> b!1130525 (=> (not res!755126) (not e!643510))))

(declare-datatypes ((array!73713 0))(
  ( (array!73714 (arr!35503 (Array (_ BitVec 32) (_ BitVec 64))) (size!36040 (_ BitVec 32))) )
))
(declare-fun lt!501813 () array!73713)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73713 (_ BitVec 32)) Bool)

(assert (=> b!1130525 (= res!755126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501813 mask!1564))))

(declare-fun _keys!1208 () array!73713)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130525 (= lt!501813 (array!73714 (store (arr!35503 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36040 _keys!1208)))))

(declare-fun res!755135 () Bool)

(assert (=> start!98410 (=> (not res!755135) (not e!643503))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98410 (= res!755135 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36040 _keys!1208))))))

(assert (=> start!98410 e!643503))

(assert (=> start!98410 tp_is_empty!28405))

(declare-fun array_inv!27296 (array!73713) Bool)

(assert (=> start!98410 (array_inv!27296 _keys!1208)))

(assert (=> start!98410 true))

(assert (=> start!98410 tp!84329))

(declare-datatypes ((ValueCell!13493 0))(
  ( (ValueCellFull!13493 (v!16888 V!43001)) (EmptyCell!13493) )
))
(declare-datatypes ((array!73715 0))(
  ( (array!73716 (arr!35504 (Array (_ BitVec 32) ValueCell!13493)) (size!36041 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73715)

(declare-fun e!643511 () Bool)

(declare-fun array_inv!27297 (array!73715) Bool)

(assert (=> start!98410 (and (array_inv!27297 _values!996) e!643511)))

(declare-fun b!1130526 () Bool)

(declare-fun e!643502 () Bool)

(assert (=> b!1130526 (= e!643502 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!501804 () Bool)

(declare-fun contains!6523 (ListLongMap!15945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4421 (array!73713 array!73715 (_ BitVec 32) (_ BitVec 32) V!43001 V!43001 (_ BitVec 32) Int) ListLongMap!15945)

(assert (=> b!1130526 (= lt!501804 (contains!6523 (getCurrentListMap!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!48038 () Bool)

(declare-fun call!48044 () ListLongMap!15945)

(declare-fun getCurrentListMapNoExtraKeys!4508 (array!73713 array!73715 (_ BitVec 32) (_ BitVec 32) V!43001 V!43001 (_ BitVec 32) Int) ListLongMap!15945)

(assert (=> bm!48038 (= call!48044 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130527 () Bool)

(declare-fun res!755134 () Bool)

(assert (=> b!1130527 (=> (not res!755134) (not e!643503))))

(assert (=> b!1130527 (= res!755134 (= (select (arr!35503 _keys!1208) i!673) k0!934))))

(declare-fun b!1130528 () Bool)

(declare-fun res!755133 () Bool)

(assert (=> b!1130528 (=> (not res!755133) (not e!643503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130528 (= res!755133 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44425 () Bool)

(declare-fun mapRes!44425 () Bool)

(assert (=> mapIsEmpty!44425 mapRes!44425))

(declare-fun bm!48039 () Bool)

(declare-fun call!48045 () Bool)

(declare-fun call!48040 () Bool)

(assert (=> bm!48039 (= call!48045 call!48040)))

(declare-fun call!48041 () ListLongMap!15945)

(declare-fun bm!48040 () Bool)

(declare-fun lt!501817 () ListLongMap!15945)

(assert (=> bm!48040 (= call!48040 (contains!6523 (ite c!110247 lt!501817 call!48041) k0!934))))

(declare-fun b!1130529 () Bool)

(declare-fun e!643507 () Bool)

(declare-fun e!643498 () Bool)

(assert (=> b!1130529 (= e!643507 e!643498)))

(declare-fun res!755139 () Bool)

(assert (=> b!1130529 (=> res!755139 e!643498)))

(assert (=> b!1130529 (= res!755139 (not (= from!1455 i!673)))))

(declare-fun lt!501816 () array!73715)

(declare-fun lt!501808 () ListLongMap!15945)

(assert (=> b!1130529 (= lt!501808 (getCurrentListMapNoExtraKeys!4508 lt!501813 lt!501816 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2571 (Int (_ BitVec 64)) V!43001)

(assert (=> b!1130529 (= lt!501816 (array!73716 (store (arr!35504 _values!996) i!673 (ValueCellFull!13493 (dynLambda!2571 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36041 _values!996)))))

(declare-fun lt!501806 () ListLongMap!15945)

(assert (=> b!1130529 (= lt!501806 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130530 () Bool)

(declare-fun e!643500 () Unit!36972)

(assert (=> b!1130530 (= e!643500 e!643504)))

(assert (=> b!1130530 (= c!110249 (and (not lt!501803) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44425 () Bool)

(declare-fun tp!84328 () Bool)

(declare-fun e!643505 () Bool)

(assert (=> mapNonEmpty!44425 (= mapRes!44425 (and tp!84328 e!643505))))

(declare-fun mapValue!44425 () ValueCell!13493)

(declare-fun mapKey!44425 () (_ BitVec 32))

(declare-fun mapRest!44425 () (Array (_ BitVec 32) ValueCell!13493))

(assert (=> mapNonEmpty!44425 (= (arr!35504 _values!996) (store mapRest!44425 mapKey!44425 mapValue!44425))))

(declare-fun b!1130531 () Bool)

(declare-fun res!755131 () Bool)

(assert (=> b!1130531 (=> (not res!755131) (not e!643503))))

(assert (=> b!1130531 (= res!755131 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36040 _keys!1208))))))

(declare-fun bm!48041 () Bool)

(declare-fun call!48046 () ListLongMap!15945)

(assert (=> bm!48041 (= call!48046 (getCurrentListMapNoExtraKeys!4508 lt!501813 lt!501816 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130532 () Bool)

(assert (=> b!1130532 (= e!643510 (not e!643507))))

(declare-fun res!755136 () Bool)

(assert (=> b!1130532 (=> res!755136 e!643507)))

(assert (=> b!1130532 (= res!755136 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130532 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501809 () Unit!36972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73713 (_ BitVec 64) (_ BitVec 32)) Unit!36972)

(assert (=> b!1130532 (= lt!501809 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130533 () Bool)

(declare-fun e!643501 () Bool)

(assert (=> b!1130533 (= e!643498 e!643501)))

(declare-fun res!755127 () Bool)

(assert (=> b!1130533 (=> res!755127 e!643501)))

(assert (=> b!1130533 (= res!755127 (not (= (select (arr!35503 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643512 () Bool)

(assert (=> b!1130533 e!643512))

(declare-fun c!110246 () Bool)

(assert (=> b!1130533 (= c!110246 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501805 () Unit!36972)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!413 (array!73713 array!73715 (_ BitVec 32) (_ BitVec 32) V!43001 V!43001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36972)

(assert (=> b!1130533 (= lt!501805 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130534 () Bool)

(assert (=> b!1130534 (= e!643512 (= call!48046 call!48044))))

(declare-fun b!1130535 () Bool)

(declare-fun res!755138 () Bool)

(assert (=> b!1130535 (=> (not res!755138) (not e!643503))))

(assert (=> b!1130535 (= res!755138 (and (= (size!36041 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36040 _keys!1208) (size!36041 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130536 () Bool)

(declare-fun res!755137 () Bool)

(assert (=> b!1130536 (=> (not res!755137) (not e!643503))))

(assert (=> b!1130536 (= res!755137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130537 () Bool)

(declare-fun e!643506 () Bool)

(assert (=> b!1130537 (= e!643501 e!643506)))

(declare-fun res!755140 () Bool)

(assert (=> b!1130537 (=> res!755140 e!643506)))

(assert (=> b!1130537 (= res!755140 (not (contains!6523 lt!501815 k0!934)))))

(assert (=> b!1130537 (= lt!501815 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130538 () Bool)

(assert (=> b!1130538 (= e!643506 e!643502)))

(declare-fun res!755130 () Bool)

(assert (=> b!1130538 (=> res!755130 e!643502)))

(assert (=> b!1130538 (= res!755130 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36040 _keys!1208))))))

(declare-fun lt!501812 () Unit!36972)

(assert (=> b!1130538 (= lt!501812 e!643500)))

(assert (=> b!1130538 (= c!110247 (and (not lt!501803) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130538 (= lt!501803 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!48042 () Unit!36972)

(declare-fun bm!48042 () Bool)

(declare-fun addStillContains!683 (ListLongMap!15945 (_ BitVec 64) V!43001 (_ BitVec 64)) Unit!36972)

(assert (=> bm!48042 (= call!48042 (addStillContains!683 lt!501815 (ite (or c!110247 c!110249) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110247 c!110249) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1130539 () Bool)

(assert (=> b!1130539 call!48045))

(declare-fun lt!501814 () Unit!36972)

(declare-fun call!48043 () Unit!36972)

(assert (=> b!1130539 (= lt!501814 call!48043)))

(assert (=> b!1130539 (= e!643504 lt!501814)))

(declare-fun b!1130540 () Bool)

(assert (=> b!1130540 (= e!643511 (and e!643499 mapRes!44425))))

(declare-fun condMapEmpty!44425 () Bool)

(declare-fun mapDefault!44425 () ValueCell!13493)

(assert (=> b!1130540 (= condMapEmpty!44425 (= (arr!35504 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13493)) mapDefault!44425)))))

(declare-fun b!1130541 () Bool)

(declare-fun Unit!36974 () Unit!36972)

(assert (=> b!1130541 (= e!643508 Unit!36974)))

(declare-fun bm!48043 () Bool)

(assert (=> bm!48043 (= call!48043 call!48042)))

(declare-fun b!1130542 () Bool)

(declare-fun res!755129 () Bool)

(assert (=> b!1130542 (=> (not res!755129) (not e!643503))))

(declare-datatypes ((List!24748 0))(
  ( (Nil!24745) (Cons!24744 (h!25962 (_ BitVec 64)) (t!35607 List!24748)) )
))
(declare-fun arrayNoDuplicates!0 (array!73713 (_ BitVec 32) List!24748) Bool)

(assert (=> b!1130542 (= res!755129 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24745))))

(declare-fun b!1130543 () Bool)

(assert (=> b!1130543 (= e!643505 tp_is_empty!28405)))

(declare-fun b!1130544 () Bool)

(declare-fun res!755128 () Bool)

(assert (=> b!1130544 (=> (not res!755128) (not e!643510))))

(assert (=> b!1130544 (= res!755128 (arrayNoDuplicates!0 lt!501813 #b00000000000000000000000000000000 Nil!24745))))

(declare-fun b!1130545 () Bool)

(declare-fun -!1153 (ListLongMap!15945 (_ BitVec 64)) ListLongMap!15945)

(assert (=> b!1130545 (= e!643512 (= call!48046 (-!1153 call!48044 k0!934)))))

(declare-fun b!1130546 () Bool)

(declare-fun lt!501810 () Unit!36972)

(assert (=> b!1130546 (= e!643500 lt!501810)))

(declare-fun lt!501807 () Unit!36972)

(assert (=> b!1130546 (= lt!501807 call!48042)))

(assert (=> b!1130546 (= lt!501817 call!48047)))

(assert (=> b!1130546 call!48040))

(assert (=> b!1130546 (= lt!501810 (addStillContains!683 lt!501817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1130546 (contains!6523 (+!3457 lt!501817 (tuple2!17969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130547 () Bool)

(declare-fun res!755132 () Bool)

(assert (=> b!1130547 (=> (not res!755132) (not e!643503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130547 (= res!755132 (validMask!0 mask!1564))))

(declare-fun bm!48044 () Bool)

(assert (=> bm!48044 (= call!48041 call!48047)))

(declare-fun b!1130548 () Bool)

(declare-fun lt!501811 () Unit!36972)

(assert (=> b!1130548 (= e!643508 lt!501811)))

(assert (=> b!1130548 (= lt!501811 call!48043)))

(assert (=> b!1130548 call!48045))

(assert (= (and start!98410 res!755135) b!1130547))

(assert (= (and b!1130547 res!755132) b!1130535))

(assert (= (and b!1130535 res!755138) b!1130536))

(assert (= (and b!1130536 res!755137) b!1130542))

(assert (= (and b!1130542 res!755129) b!1130531))

(assert (= (and b!1130531 res!755131) b!1130528))

(assert (= (and b!1130528 res!755133) b!1130527))

(assert (= (and b!1130527 res!755134) b!1130525))

(assert (= (and b!1130525 res!755126) b!1130544))

(assert (= (and b!1130544 res!755128) b!1130532))

(assert (= (and b!1130532 (not res!755136)) b!1130529))

(assert (= (and b!1130529 (not res!755139)) b!1130533))

(assert (= (and b!1130533 c!110246) b!1130545))

(assert (= (and b!1130533 (not c!110246)) b!1130534))

(assert (= (or b!1130545 b!1130534) bm!48041))

(assert (= (or b!1130545 b!1130534) bm!48038))

(assert (= (and b!1130533 (not res!755127)) b!1130537))

(assert (= (and b!1130537 (not res!755140)) b!1130538))

(assert (= (and b!1130538 c!110247) b!1130546))

(assert (= (and b!1130538 (not c!110247)) b!1130530))

(assert (= (and b!1130530 c!110249) b!1130539))

(assert (= (and b!1130530 (not c!110249)) b!1130523))

(assert (= (and b!1130523 c!110248) b!1130548))

(assert (= (and b!1130523 (not c!110248)) b!1130541))

(assert (= (or b!1130539 b!1130548) bm!48043))

(assert (= (or b!1130539 b!1130548) bm!48044))

(assert (= (or b!1130539 b!1130548) bm!48039))

(assert (= (or b!1130546 bm!48039) bm!48040))

(assert (= (or b!1130546 bm!48043) bm!48042))

(assert (= (or b!1130546 bm!48044) bm!48037))

(assert (= (and b!1130538 (not res!755130)) b!1130526))

(assert (= (and b!1130540 condMapEmpty!44425) mapIsEmpty!44425))

(assert (= (and b!1130540 (not condMapEmpty!44425)) mapNonEmpty!44425))

(get-info :version)

(assert (= (and mapNonEmpty!44425 ((_ is ValueCellFull!13493) mapValue!44425)) b!1130543))

(assert (= (and b!1130540 ((_ is ValueCellFull!13493) mapDefault!44425)) b!1130524))

(assert (= start!98410 b!1130540))

(declare-fun b_lambda!18855 () Bool)

(assert (=> (not b_lambda!18855) (not b!1130529)))

(declare-fun t!35605 () Bool)

(declare-fun tb!8679 () Bool)

(assert (=> (and start!98410 (= defaultEntry!1004 defaultEntry!1004) t!35605) tb!8679))

(declare-fun result!17927 () Bool)

(assert (=> tb!8679 (= result!17927 tp_is_empty!28405)))

(assert (=> b!1130529 t!35605))

(declare-fun b_and!38545 () Bool)

(assert (= b_and!38543 (and (=> t!35605 result!17927) b_and!38545)))

(declare-fun m!1044307 () Bool)

(assert (=> bm!48042 m!1044307))

(declare-fun m!1044309 () Bool)

(assert (=> b!1130528 m!1044309))

(declare-fun m!1044311 () Bool)

(assert (=> mapNonEmpty!44425 m!1044311))

(declare-fun m!1044313 () Bool)

(assert (=> bm!48038 m!1044313))

(declare-fun m!1044315 () Bool)

(assert (=> b!1130545 m!1044315))

(declare-fun m!1044317 () Bool)

(assert (=> b!1130547 m!1044317))

(declare-fun m!1044319 () Bool)

(assert (=> b!1130525 m!1044319))

(declare-fun m!1044321 () Bool)

(assert (=> b!1130525 m!1044321))

(declare-fun m!1044323 () Bool)

(assert (=> bm!48037 m!1044323))

(declare-fun m!1044325 () Bool)

(assert (=> b!1130533 m!1044325))

(declare-fun m!1044327 () Bool)

(assert (=> b!1130533 m!1044327))

(declare-fun m!1044329 () Bool)

(assert (=> start!98410 m!1044329))

(declare-fun m!1044331 () Bool)

(assert (=> start!98410 m!1044331))

(declare-fun m!1044333 () Bool)

(assert (=> bm!48040 m!1044333))

(declare-fun m!1044335 () Bool)

(assert (=> b!1130527 m!1044335))

(declare-fun m!1044337 () Bool)

(assert (=> b!1130536 m!1044337))

(declare-fun m!1044339 () Bool)

(assert (=> b!1130529 m!1044339))

(declare-fun m!1044341 () Bool)

(assert (=> b!1130529 m!1044341))

(declare-fun m!1044343 () Bool)

(assert (=> b!1130529 m!1044343))

(declare-fun m!1044345 () Bool)

(assert (=> b!1130529 m!1044345))

(declare-fun m!1044347 () Bool)

(assert (=> bm!48041 m!1044347))

(declare-fun m!1044349 () Bool)

(assert (=> b!1130532 m!1044349))

(declare-fun m!1044351 () Bool)

(assert (=> b!1130532 m!1044351))

(declare-fun m!1044353 () Bool)

(assert (=> b!1130526 m!1044353))

(assert (=> b!1130526 m!1044353))

(declare-fun m!1044355 () Bool)

(assert (=> b!1130526 m!1044355))

(declare-fun m!1044357 () Bool)

(assert (=> b!1130544 m!1044357))

(declare-fun m!1044359 () Bool)

(assert (=> b!1130542 m!1044359))

(declare-fun m!1044361 () Bool)

(assert (=> b!1130546 m!1044361))

(declare-fun m!1044363 () Bool)

(assert (=> b!1130546 m!1044363))

(assert (=> b!1130546 m!1044363))

(declare-fun m!1044365 () Bool)

(assert (=> b!1130546 m!1044365))

(declare-fun m!1044367 () Bool)

(assert (=> b!1130537 m!1044367))

(assert (=> b!1130537 m!1044313))

(check-sat (not bm!48040) (not b!1130536) (not mapNonEmpty!44425) (not b!1130525) (not bm!48037) (not b!1130547) (not bm!48042) (not b!1130532) (not b!1130526) (not b_lambda!18855) b_and!38545 (not b!1130537) (not b!1130528) (not b!1130544) (not b!1130533) (not b!1130545) (not start!98410) tp_is_empty!28405 (not b!1130542) (not bm!48041) (not b!1130546) (not bm!48038) (not b!1130529) (not b_next!23875))
(check-sat b_and!38545 (not b_next!23875))

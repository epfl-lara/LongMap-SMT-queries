; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98580 () Bool)

(assert start!98580)

(declare-fun b_free!24185 () Bool)

(declare-fun b_next!24185 () Bool)

(assert (=> start!98580 (= b_free!24185 (not b_next!24185))))

(declare-fun tp!85265 () Bool)

(declare-fun b_and!39219 () Bool)

(assert (=> start!98580 (= tp!85265 b_and!39219)))

(declare-fun mapIsEmpty!44897 () Bool)

(declare-fun mapRes!44897 () Bool)

(assert (=> mapIsEmpty!44897 mapRes!44897))

(declare-fun b!1143541 () Bool)

(declare-fun res!761861 () Bool)

(declare-fun e!650533 () Bool)

(assert (=> b!1143541 (=> (not res!761861) (not e!650533))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143541 (= res!761861 (validMask!0 mask!1564))))

(declare-fun b!1143542 () Bool)

(declare-fun e!650529 () Bool)

(declare-fun tp_is_empty!28715 () Bool)

(assert (=> b!1143542 (= e!650529 tp_is_empty!28715)))

(declare-fun res!761856 () Bool)

(assert (=> start!98580 (=> (not res!761856) (not e!650533))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74283 0))(
  ( (array!74284 (arr!35792 (Array (_ BitVec 32) (_ BitVec 64))) (size!36328 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74283)

(assert (=> start!98580 (= res!761856 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36328 _keys!1208))))))

(assert (=> start!98580 e!650533))

(assert (=> start!98580 tp_is_empty!28715))

(declare-fun array_inv!27428 (array!74283) Bool)

(assert (=> start!98580 (array_inv!27428 _keys!1208)))

(assert (=> start!98580 true))

(assert (=> start!98580 tp!85265))

(declare-datatypes ((V!43413 0))(
  ( (V!43414 (val!14414 Int)) )
))
(declare-datatypes ((ValueCell!13648 0))(
  ( (ValueCellFull!13648 (v!17051 V!43413)) (EmptyCell!13648) )
))
(declare-datatypes ((array!74285 0))(
  ( (array!74286 (arr!35793 (Array (_ BitVec 32) ValueCell!13648)) (size!36329 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74285)

(declare-fun e!650520 () Bool)

(declare-fun array_inv!27429 (array!74285) Bool)

(assert (=> start!98580 (and (array_inv!27429 _values!996) e!650520)))

(declare-fun b!1143543 () Bool)

(declare-datatypes ((tuple2!18248 0))(
  ( (tuple2!18249 (_1!9135 (_ BitVec 64)) (_2!9135 V!43413)) )
))
(declare-datatypes ((List!25001 0))(
  ( (Nil!24998) (Cons!24997 (h!26206 tuple2!18248) (t!36178 List!25001)) )
))
(declare-datatypes ((ListLongMap!16217 0))(
  ( (ListLongMap!16218 (toList!8124 List!25001)) )
))
(declare-fun call!51766 () ListLongMap!16217)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6656 (ListLongMap!16217 (_ BitVec 64)) Bool)

(assert (=> b!1143543 (contains!6656 call!51766 k!934)))

(declare-datatypes ((Unit!37528 0))(
  ( (Unit!37529) )
))
(declare-fun lt!510036 () Unit!37528)

(declare-fun lt!510025 () ListLongMap!16217)

(declare-fun minValue!944 () V!43413)

(declare-fun addStillContains!809 (ListLongMap!16217 (_ BitVec 64) V!43413 (_ BitVec 64)) Unit!37528)

(assert (=> b!1143543 (= lt!510036 (addStillContains!809 lt!510025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!51769 () Bool)

(assert (=> b!1143543 call!51769))

(declare-fun lt!510032 () ListLongMap!16217)

(declare-fun zeroValue!944 () V!43413)

(declare-fun +!3553 (ListLongMap!16217 tuple2!18248) ListLongMap!16217)

(assert (=> b!1143543 (= lt!510025 (+!3553 lt!510032 (tuple2!18249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510023 () Unit!37528)

(declare-fun call!51765 () Unit!37528)

(assert (=> b!1143543 (= lt!510023 call!51765)))

(declare-fun e!650534 () Unit!37528)

(assert (=> b!1143543 (= e!650534 lt!510036)))

(declare-fun b!1143544 () Bool)

(declare-fun e!650528 () Bool)

(declare-fun e!650523 () Bool)

(assert (=> b!1143544 (= e!650528 (not e!650523))))

(declare-fun res!761850 () Bool)

(assert (=> b!1143544 (=> res!761850 e!650523)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143544 (= res!761850 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143544 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!510022 () Unit!37528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74283 (_ BitVec 64) (_ BitVec 32)) Unit!37528)

(assert (=> b!1143544 (= lt!510022 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!51764 () ListLongMap!16217)

(declare-fun bm!51759 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4604 (array!74283 array!74285 (_ BitVec 32) (_ BitVec 32) V!43413 V!43413 (_ BitVec 32) Int) ListLongMap!16217)

(assert (=> bm!51759 (= call!51764 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!51762 () ListLongMap!16217)

(declare-fun b!1143545 () Bool)

(declare-fun e!650530 () Bool)

(declare-fun -!1270 (ListLongMap!16217 (_ BitVec 64)) ListLongMap!16217)

(assert (=> b!1143545 (= e!650530 (= call!51762 (-!1270 call!51764 k!934)))))

(declare-fun b!1143546 () Bool)

(declare-fun res!761852 () Bool)

(assert (=> b!1143546 (=> (not res!761852) (not e!650533))))

(assert (=> b!1143546 (= res!761852 (= (select (arr!35792 _keys!1208) i!673) k!934))))

(declare-fun b!1143547 () Bool)

(declare-fun res!761860 () Bool)

(assert (=> b!1143547 (=> (not res!761860) (not e!650533))))

(assert (=> b!1143547 (= res!761860 (and (= (size!36329 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36328 _keys!1208) (size!36329 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun c!112523 () Bool)

(declare-fun bm!51760 () Bool)

(declare-fun c!112525 () Bool)

(assert (=> bm!51760 (= call!51766 (+!3553 (ite c!112523 lt!510025 lt!510032) (ite c!112523 (tuple2!18249 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112525 (tuple2!18249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18249 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!51761 () Bool)

(assert (=> bm!51761 (= call!51765 (addStillContains!809 lt!510032 (ite (or c!112523 c!112525) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112523 c!112525) zeroValue!944 minValue!944) k!934))))

(declare-fun bm!51762 () Bool)

(declare-fun call!51768 () ListLongMap!16217)

(assert (=> bm!51762 (= call!51768 call!51766)))

(declare-fun mapNonEmpty!44897 () Bool)

(declare-fun tp!85266 () Bool)

(declare-fun e!650522 () Bool)

(assert (=> mapNonEmpty!44897 (= mapRes!44897 (and tp!85266 e!650522))))

(declare-fun mapKey!44897 () (_ BitVec 32))

(declare-fun mapValue!44897 () ValueCell!13648)

(declare-fun mapRest!44897 () (Array (_ BitVec 32) ValueCell!13648))

(assert (=> mapNonEmpty!44897 (= (arr!35793 _values!996) (store mapRest!44897 mapKey!44897 mapValue!44897))))

(declare-fun bm!51763 () Bool)

(declare-fun call!51767 () Unit!37528)

(assert (=> bm!51763 (= call!51767 call!51765)))

(declare-fun b!1143548 () Bool)

(assert (=> b!1143548 (= e!650530 (= call!51762 call!51764))))

(declare-fun b!1143549 () Bool)

(declare-fun e!650527 () Bool)

(assert (=> b!1143549 (= e!650523 e!650527)))

(declare-fun res!761851 () Bool)

(assert (=> b!1143549 (=> res!761851 e!650527)))

(assert (=> b!1143549 (= res!761851 (not (= from!1455 i!673)))))

(declare-fun lt!510034 () ListLongMap!16217)

(declare-fun lt!510031 () array!74285)

(declare-fun lt!510030 () array!74283)

(assert (=> b!1143549 (= lt!510034 (getCurrentListMapNoExtraKeys!4604 lt!510030 lt!510031 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510026 () V!43413)

(assert (=> b!1143549 (= lt!510031 (array!74286 (store (arr!35793 _values!996) i!673 (ValueCellFull!13648 lt!510026)) (size!36329 _values!996)))))

(declare-fun dynLambda!2642 (Int (_ BitVec 64)) V!43413)

(assert (=> b!1143549 (= lt!510026 (dynLambda!2642 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510027 () ListLongMap!16217)

(assert (=> b!1143549 (= lt!510027 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143550 () Bool)

(declare-fun e!650526 () Unit!37528)

(declare-fun Unit!37530 () Unit!37528)

(assert (=> b!1143550 (= e!650526 Unit!37530)))

(declare-fun b!1143551 () Bool)

(declare-fun res!761853 () Bool)

(assert (=> b!1143551 (=> (not res!761853) (not e!650533))))

(declare-datatypes ((List!25002 0))(
  ( (Nil!24999) (Cons!24998 (h!26207 (_ BitVec 64)) (t!36179 List!25002)) )
))
(declare-fun arrayNoDuplicates!0 (array!74283 (_ BitVec 32) List!25002) Bool)

(assert (=> b!1143551 (= res!761853 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24999))))

(declare-fun b!1143552 () Bool)

(assert (=> b!1143552 (= e!650533 e!650528)))

(declare-fun res!761858 () Bool)

(assert (=> b!1143552 (=> (not res!761858) (not e!650528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74283 (_ BitVec 32)) Bool)

(assert (=> b!1143552 (= res!761858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510030 mask!1564))))

(assert (=> b!1143552 (= lt!510030 (array!74284 (store (arr!35792 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36328 _keys!1208)))))

(declare-fun b!1143553 () Bool)

(declare-fun res!761848 () Bool)

(assert (=> b!1143553 (=> (not res!761848) (not e!650533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143553 (= res!761848 (validKeyInArray!0 k!934))))

(declare-fun b!1143554 () Bool)

(declare-fun e!650525 () Unit!37528)

(assert (=> b!1143554 (= e!650525 e!650526)))

(declare-fun c!112524 () Bool)

(declare-fun lt!510035 () Bool)

(assert (=> b!1143554 (= c!112524 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510035))))

(declare-fun e!650532 () Bool)

(declare-fun b!1143555 () Bool)

(assert (=> b!1143555 (= e!650532 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143556 () Bool)

(declare-fun e!650524 () Bool)

(assert (=> b!1143556 (= e!650527 e!650524)))

(declare-fun res!761854 () Bool)

(assert (=> b!1143556 (=> res!761854 e!650524)))

(assert (=> b!1143556 (= res!761854 (not (= (select (arr!35792 _keys!1208) from!1455) k!934)))))

(assert (=> b!1143556 e!650530))

(declare-fun c!112527 () Bool)

(assert (=> b!1143556 (= c!112527 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510021 () Unit!37528)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!512 (array!74283 array!74285 (_ BitVec 32) (_ BitVec 32) V!43413 V!43413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37528)

(assert (=> b!1143556 (= lt!510021 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51764 () Bool)

(assert (=> bm!51764 (= call!51769 (contains!6656 (ite c!112523 lt!510025 call!51768) k!934))))

(declare-fun b!1143557 () Bool)

(declare-fun e!650531 () Unit!37528)

(declare-fun Unit!37531 () Unit!37528)

(assert (=> b!1143557 (= e!650531 Unit!37531)))

(declare-fun b!1143558 () Bool)

(assert (=> b!1143558 (= e!650524 true)))

(declare-fun lt!510033 () V!43413)

(assert (=> b!1143558 (= (-!1270 (+!3553 lt!510032 (tuple2!18249 (select (arr!35792 _keys!1208) from!1455) lt!510033)) (select (arr!35792 _keys!1208) from!1455)) lt!510032)))

(declare-fun lt!510024 () Unit!37528)

(declare-fun addThenRemoveForNewKeyIsSame!122 (ListLongMap!16217 (_ BitVec 64) V!43413) Unit!37528)

(assert (=> b!1143558 (= lt!510024 (addThenRemoveForNewKeyIsSame!122 lt!510032 (select (arr!35792 _keys!1208) from!1455) lt!510033))))

(declare-fun get!18196 (ValueCell!13648 V!43413) V!43413)

(assert (=> b!1143558 (= lt!510033 (get!18196 (select (arr!35793 _values!996) from!1455) lt!510026))))

(declare-fun lt!510038 () Unit!37528)

(assert (=> b!1143558 (= lt!510038 e!650531)))

(declare-fun c!112528 () Bool)

(assert (=> b!1143558 (= c!112528 (contains!6656 lt!510032 k!934))))

(assert (=> b!1143558 (= lt!510032 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143559 () Bool)

(assert (=> b!1143559 (= e!650522 tp_is_empty!28715)))

(declare-fun b!1143560 () Bool)

(declare-fun res!761859 () Bool)

(assert (=> b!1143560 (=> (not res!761859) (not e!650533))))

(assert (=> b!1143560 (= res!761859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143561 () Bool)

(assert (=> b!1143561 (= c!112525 (and (not lt!510035) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1143561 (= e!650534 e!650525)))

(declare-fun e!650521 () Bool)

(declare-fun b!1143562 () Bool)

(assert (=> b!1143562 (= e!650521 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51765 () Bool)

(assert (=> bm!51765 (= call!51762 (getCurrentListMapNoExtraKeys!4604 lt!510030 lt!510031 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143563 () Bool)

(assert (=> b!1143563 (= e!650520 (and e!650529 mapRes!44897))))

(declare-fun condMapEmpty!44897 () Bool)

(declare-fun mapDefault!44897 () ValueCell!13648)


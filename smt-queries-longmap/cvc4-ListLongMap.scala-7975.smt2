; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98694 () Bool)

(assert start!98694)

(declare-fun b_free!24299 () Bool)

(declare-fun b_next!24299 () Bool)

(assert (=> start!98694 (= b_free!24299 (not b_next!24299))))

(declare-fun tp!85607 () Bool)

(declare-fun b_and!39447 () Bool)

(assert (=> start!98694 (= tp!85607 b_and!39447)))

(declare-fun b!1148766 () Bool)

(declare-fun e!653422 () Bool)

(declare-fun e!653408 () Bool)

(assert (=> b!1148766 (= e!653422 e!653408)))

(declare-fun res!764408 () Bool)

(assert (=> b!1148766 (=> res!764408 e!653408)))

(declare-datatypes ((array!74505 0))(
  ( (array!74506 (arr!35903 (Array (_ BitVec 32) (_ BitVec 64))) (size!36439 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74505)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1148766 (= res!764408 (not (= (select (arr!35903 _keys!1208) from!1455) k!934)))))

(declare-fun e!653424 () Bool)

(assert (=> b!1148766 e!653424))

(declare-fun c!113550 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148766 (= c!113550 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43565 0))(
  ( (V!43566 (val!14471 Int)) )
))
(declare-fun zeroValue!944 () V!43565)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37755 0))(
  ( (Unit!37756) )
))
(declare-fun lt!513624 () Unit!37755)

(declare-datatypes ((ValueCell!13705 0))(
  ( (ValueCellFull!13705 (v!17108 V!43565)) (EmptyCell!13705) )
))
(declare-datatypes ((array!74507 0))(
  ( (array!74508 (arr!35904 (Array (_ BitVec 32) ValueCell!13705)) (size!36440 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74507)

(declare-fun minValue!944 () V!43565)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!550 (array!74505 array!74507 (_ BitVec 32) (_ BitVec 32) V!43565 V!43565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37755)

(assert (=> b!1148766 (= lt!513624 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45068 () Bool)

(declare-fun mapRes!45068 () Bool)

(declare-fun tp!85608 () Bool)

(declare-fun e!653413 () Bool)

(assert (=> mapNonEmpty!45068 (= mapRes!45068 (and tp!85608 e!653413))))

(declare-fun mapValue!45068 () ValueCell!13705)

(declare-fun mapRest!45068 () (Array (_ BitVec 32) ValueCell!13705))

(declare-fun mapKey!45068 () (_ BitVec 32))

(assert (=> mapNonEmpty!45068 (= (arr!35904 _values!996) (store mapRest!45068 mapKey!45068 mapValue!45068))))

(declare-fun b!1148767 () Bool)

(declare-datatypes ((tuple2!18354 0))(
  ( (tuple2!18355 (_1!9188 (_ BitVec 64)) (_2!9188 V!43565)) )
))
(declare-datatypes ((List!25105 0))(
  ( (Nil!25102) (Cons!25101 (h!26310 tuple2!18354) (t!36396 List!25105)) )
))
(declare-datatypes ((ListLongMap!16323 0))(
  ( (ListLongMap!16324 (toList!8177 List!25105)) )
))
(declare-fun lt!513626 () ListLongMap!16323)

(declare-fun e!653419 () Bool)

(declare-fun lt!513612 () ListLongMap!16323)

(declare-fun -!1312 (ListLongMap!16323 (_ BitVec 64)) ListLongMap!16323)

(assert (=> b!1148767 (= e!653419 (= (-!1312 lt!513626 k!934) lt!513612))))

(declare-fun b!1148768 () Bool)

(declare-fun call!53131 () ListLongMap!16323)

(declare-fun call!53135 () ListLongMap!16323)

(assert (=> b!1148768 (= e!653424 (= call!53131 call!53135))))

(declare-fun b!1148769 () Bool)

(declare-fun e!653418 () Unit!37755)

(declare-fun Unit!37757 () Unit!37755)

(assert (=> b!1148769 (= e!653418 Unit!37757)))

(declare-fun bm!53127 () Bool)

(declare-fun call!53132 () ListLongMap!16323)

(declare-fun call!53134 () ListLongMap!16323)

(assert (=> bm!53127 (= call!53132 call!53134)))

(declare-fun b!1148771 () Bool)

(declare-fun res!764400 () Bool)

(declare-fun e!653420 () Bool)

(assert (=> b!1148771 (=> (not res!764400) (not e!653420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148771 (= res!764400 (validMask!0 mask!1564))))

(declare-fun c!113553 () Bool)

(declare-fun call!53133 () Bool)

(declare-fun lt!513621 () ListLongMap!16323)

(declare-fun bm!53128 () Bool)

(declare-fun contains!6700 (ListLongMap!16323 (_ BitVec 64)) Bool)

(assert (=> bm!53128 (= call!53133 (contains!6700 (ite c!113553 lt!513621 call!53132) k!934))))

(declare-fun e!653414 () Bool)

(declare-fun b!1148772 () Bool)

(declare-fun lt!513610 () Bool)

(assert (=> b!1148772 (= e!653414 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513610) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148773 () Bool)

(declare-fun e!653415 () Bool)

(declare-fun e!653412 () Bool)

(assert (=> b!1148773 (= e!653415 (not e!653412))))

(declare-fun res!764398 () Bool)

(assert (=> b!1148773 (=> res!764398 e!653412)))

(assert (=> b!1148773 (= res!764398 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148773 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513622 () Unit!37755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74505 (_ BitVec 64) (_ BitVec 32)) Unit!37755)

(assert (=> b!1148773 (= lt!513622 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1148774 () Bool)

(assert (=> b!1148774 (= e!653408 true)))

(assert (=> b!1148774 e!653419))

(declare-fun res!764406 () Bool)

(assert (=> b!1148774 (=> (not res!764406) (not e!653419))))

(declare-fun lt!513613 () V!43565)

(declare-fun +!3599 (ListLongMap!16323 tuple2!18354) ListLongMap!16323)

(assert (=> b!1148774 (= res!764406 (= (-!1312 (+!3599 lt!513612 (tuple2!18355 (select (arr!35903 _keys!1208) from!1455) lt!513613)) (select (arr!35903 _keys!1208) from!1455)) lt!513612))))

(declare-fun lt!513620 () Unit!37755)

(declare-fun addThenRemoveForNewKeyIsSame!157 (ListLongMap!16323 (_ BitVec 64) V!43565) Unit!37755)

(assert (=> b!1148774 (= lt!513620 (addThenRemoveForNewKeyIsSame!157 lt!513612 (select (arr!35903 _keys!1208) from!1455) lt!513613))))

(declare-fun lt!513614 () V!43565)

(declare-fun get!18269 (ValueCell!13705 V!43565) V!43565)

(assert (=> b!1148774 (= lt!513613 (get!18269 (select (arr!35904 _values!996) from!1455) lt!513614))))

(declare-fun lt!513628 () Unit!37755)

(declare-fun e!653423 () Unit!37755)

(assert (=> b!1148774 (= lt!513628 e!653423)))

(declare-fun c!113549 () Bool)

(assert (=> b!1148774 (= c!113549 (contains!6700 lt!513612 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4650 (array!74505 array!74507 (_ BitVec 32) (_ BitVec 32) V!43565 V!43565 (_ BitVec 32) Int) ListLongMap!16323)

(assert (=> b!1148774 (= lt!513612 (getCurrentListMapNoExtraKeys!4650 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53129 () Bool)

(assert (=> bm!53129 (= call!53135 (getCurrentListMapNoExtraKeys!4650 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148775 () Bool)

(assert (=> b!1148775 (= e!653424 (= call!53131 (-!1312 call!53135 k!934)))))

(declare-fun b!1148776 () Bool)

(declare-fun tp_is_empty!28829 () Bool)

(assert (=> b!1148776 (= e!653413 tp_is_empty!28829)))

(declare-fun e!653411 () Bool)

(declare-fun b!1148777 () Bool)

(assert (=> b!1148777 (= e!653411 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53130 () Bool)

(declare-fun call!53137 () Bool)

(assert (=> bm!53130 (= call!53137 call!53133)))

(declare-fun bm!53131 () Bool)

(declare-fun lt!513616 () array!74505)

(declare-fun lt!513623 () array!74507)

(assert (=> bm!53131 (= call!53131 (getCurrentListMapNoExtraKeys!4650 lt!513616 lt!513623 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!764399 () Bool)

(assert (=> start!98694 (=> (not res!764399) (not e!653420))))

(assert (=> start!98694 (= res!764399 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36439 _keys!1208))))))

(assert (=> start!98694 e!653420))

(assert (=> start!98694 tp_is_empty!28829))

(declare-fun array_inv!27498 (array!74505) Bool)

(assert (=> start!98694 (array_inv!27498 _keys!1208)))

(assert (=> start!98694 true))

(assert (=> start!98694 tp!85607))

(declare-fun e!653409 () Bool)

(declare-fun array_inv!27499 (array!74507) Bool)

(assert (=> start!98694 (and (array_inv!27499 _values!996) e!653409)))

(declare-fun b!1148770 () Bool)

(declare-fun res!764404 () Bool)

(assert (=> b!1148770 (=> (not res!764404) (not e!653420))))

(assert (=> b!1148770 (= res!764404 (= (select (arr!35903 _keys!1208) i!673) k!934))))

(declare-fun b!1148778 () Bool)

(assert (=> b!1148778 call!53137))

(declare-fun lt!513611 () Unit!37755)

(declare-fun call!53136 () Unit!37755)

(assert (=> b!1148778 (= lt!513611 call!53136)))

(assert (=> b!1148778 (= e!653418 lt!513611)))

(declare-fun mapIsEmpty!45068 () Bool)

(assert (=> mapIsEmpty!45068 mapRes!45068))

(declare-fun b!1148779 () Bool)

(declare-fun e!653417 () Bool)

(assert (=> b!1148779 (= e!653417 tp_is_empty!28829)))

(declare-fun b!1148780 () Bool)

(declare-fun res!764405 () Bool)

(assert (=> b!1148780 (=> (not res!764405) (not e!653420))))

(declare-datatypes ((List!25106 0))(
  ( (Nil!25103) (Cons!25102 (h!26311 (_ BitVec 64)) (t!36397 List!25106)) )
))
(declare-fun arrayNoDuplicates!0 (array!74505 (_ BitVec 32) List!25106) Bool)

(assert (=> b!1148780 (= res!764405 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25103))))

(declare-fun b!1148781 () Bool)

(declare-fun res!764394 () Bool)

(assert (=> b!1148781 (=> (not res!764394) (not e!653420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148781 (= res!764394 (validKeyInArray!0 k!934))))

(declare-fun c!113554 () Bool)

(declare-fun bm!53132 () Bool)

(assert (=> bm!53132 (= call!53134 (+!3599 lt!513612 (ite (or c!113553 c!113554) (tuple2!18355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1148782 () Bool)

(declare-fun Unit!37758 () Unit!37755)

(assert (=> b!1148782 (= e!653423 Unit!37758)))

(declare-fun call!53130 () Unit!37755)

(declare-fun bm!53133 () Bool)

(declare-fun addStillContains!849 (ListLongMap!16323 (_ BitVec 64) V!43565 (_ BitVec 64)) Unit!37755)

(assert (=> bm!53133 (= call!53130 (addStillContains!849 lt!513612 (ite (or c!113553 c!113554) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113553 c!113554) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1148783 () Bool)

(assert (=> b!1148783 (= c!113554 (and (not lt!513610) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653410 () Unit!37755)

(declare-fun e!653421 () Unit!37755)

(assert (=> b!1148783 (= e!653410 e!653421)))

(declare-fun b!1148784 () Bool)

(declare-fun res!764397 () Bool)

(assert (=> b!1148784 (=> (not res!764397) (not e!653420))))

(assert (=> b!1148784 (= res!764397 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36439 _keys!1208))))))

(declare-fun b!1148785 () Bool)

(declare-fun lt!513630 () Unit!37755)

(assert (=> b!1148785 (= e!653421 lt!513630)))

(assert (=> b!1148785 (= lt!513630 call!53136)))

(assert (=> b!1148785 call!53137))

(declare-fun b!1148786 () Bool)

(assert (=> b!1148786 (= e!653420 e!653415)))

(declare-fun res!764395 () Bool)

(assert (=> b!1148786 (=> (not res!764395) (not e!653415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74505 (_ BitVec 32)) Bool)

(assert (=> b!1148786 (= res!764395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513616 mask!1564))))

(assert (=> b!1148786 (= lt!513616 (array!74506 (store (arr!35903 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36439 _keys!1208)))))

(declare-fun b!1148787 () Bool)

(declare-fun res!764403 () Bool)

(assert (=> b!1148787 (=> (not res!764403) (not e!653420))))

(assert (=> b!1148787 (= res!764403 (and (= (size!36440 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36439 _keys!1208) (size!36440 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148788 () Bool)

(assert (=> b!1148788 (= e!653421 e!653418)))

(declare-fun c!113551 () Bool)

(assert (=> b!1148788 (= c!113551 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513610))))

(declare-fun b!1148789 () Bool)

(assert (=> b!1148789 (= e!653409 (and e!653417 mapRes!45068))))

(declare-fun condMapEmpty!45068 () Bool)

(declare-fun mapDefault!45068 () ValueCell!13705)


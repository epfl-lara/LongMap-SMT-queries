; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98174 () Bool)

(assert start!98174)

(declare-fun b_free!23875 () Bool)

(declare-fun b_next!23875 () Bool)

(assert (=> start!98174 (= b_free!23875 (not b_next!23875))))

(declare-fun tp!84328 () Bool)

(declare-fun b_and!38533 () Bool)

(assert (=> start!98174 (= tp!84328 b_and!38533)))

(declare-datatypes ((V!43001 0))(
  ( (V!43002 (val!14259 Int)) )
))
(declare-fun zeroValue!944 () V!43001)

(declare-datatypes ((tuple2!17952 0))(
  ( (tuple2!17953 (_1!8987 (_ BitVec 64)) (_2!8987 V!43001)) )
))
(declare-datatypes ((List!24719 0))(
  ( (Nil!24716) (Cons!24715 (h!25924 tuple2!17952) (t!35586 List!24719)) )
))
(declare-datatypes ((ListLongMap!15921 0))(
  ( (ListLongMap!15922 (toList!7976 List!24719)) )
))
(declare-fun call!47977 () ListLongMap!15921)

(declare-datatypes ((array!73667 0))(
  ( (array!73668 (arr!35486 (Array (_ BitVec 32) (_ BitVec 64))) (size!36022 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73667)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13493 0))(
  ( (ValueCellFull!13493 (v!16892 V!43001)) (EmptyCell!13493) )
))
(declare-datatypes ((array!73669 0))(
  ( (array!73670 (arr!35487 (Array (_ BitVec 32) ValueCell!13493)) (size!36023 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73669)

(declare-fun minValue!944 () V!43001)

(declare-fun bm!47970 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4463 (array!73667 array!73669 (_ BitVec 32) (_ BitVec 32) V!43001 V!43001 (_ BitVec 32) Int) ListLongMap!15921)

(assert (=> bm!47970 (= call!47977 (getCurrentListMapNoExtraKeys!4463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129196 () Bool)

(declare-fun e!642652 () Bool)

(declare-fun e!642644 () Bool)

(assert (=> b!1129196 (= e!642652 e!642644)))

(declare-fun res!754618 () Bool)

(assert (=> b!1129196 (=> res!754618 e!642644)))

(declare-fun lt!501294 () ListLongMap!15921)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6499 (ListLongMap!15921 (_ BitVec 64)) Bool)

(assert (=> b!1129196 (= res!754618 (not (contains!6499 lt!501294 k!934)))))

(assert (=> b!1129196 (= lt!501294 (getCurrentListMapNoExtraKeys!4463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129197 () Bool)

(declare-fun res!754604 () Bool)

(declare-fun e!642648 () Bool)

(assert (=> b!1129197 (=> (not res!754604) (not e!642648))))

(assert (=> b!1129197 (= res!754604 (and (= (size!36023 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36022 _keys!1208) (size!36023 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47971 () Bool)

(declare-fun call!47973 () ListLongMap!15921)

(declare-fun call!47975 () ListLongMap!15921)

(assert (=> bm!47971 (= call!47973 call!47975)))

(declare-fun b!1129198 () Bool)

(declare-fun res!754614 () Bool)

(assert (=> b!1129198 (=> (not res!754614) (not e!642648))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129198 (= res!754614 (= (select (arr!35486 _keys!1208) i!673) k!934))))

(declare-fun bm!47972 () Bool)

(declare-datatypes ((Unit!36991 0))(
  ( (Unit!36992) )
))
(declare-fun call!47976 () Unit!36991)

(declare-fun call!47980 () Unit!36991)

(assert (=> bm!47972 (= call!47976 call!47980)))

(declare-fun b!1129199 () Bool)

(declare-fun res!754608 () Bool)

(assert (=> b!1129199 (=> (not res!754608) (not e!642648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129199 (= res!754608 (validKeyInArray!0 k!934))))

(declare-fun b!1129200 () Bool)

(declare-fun res!754611 () Bool)

(assert (=> b!1129200 (=> (not res!754611) (not e!642648))))

(declare-datatypes ((List!24720 0))(
  ( (Nil!24717) (Cons!24716 (h!25925 (_ BitVec 64)) (t!35587 List!24720)) )
))
(declare-fun arrayNoDuplicates!0 (array!73667 (_ BitVec 32) List!24720) Bool)

(assert (=> b!1129200 (= res!754611 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24717))))

(declare-fun bm!47973 () Bool)

(declare-fun call!47974 () Bool)

(declare-fun call!47978 () Bool)

(assert (=> bm!47973 (= call!47974 call!47978)))

(declare-fun b!1129201 () Bool)

(declare-fun e!642646 () Unit!36991)

(declare-fun Unit!36993 () Unit!36991)

(assert (=> b!1129201 (= e!642646 Unit!36993)))

(declare-fun b!1129202 () Bool)

(declare-fun res!754617 () Bool)

(assert (=> b!1129202 (=> (not res!754617) (not e!642648))))

(assert (=> b!1129202 (= res!754617 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36022 _keys!1208))))))

(declare-fun bm!47974 () Bool)

(declare-fun call!47979 () ListLongMap!15921)

(declare-fun lt!501288 () array!73669)

(declare-fun lt!501289 () array!73667)

(assert (=> bm!47974 (= call!47979 (getCurrentListMapNoExtraKeys!4463 lt!501289 lt!501288 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!501300 () ListLongMap!15921)

(declare-fun c!109838 () Bool)

(declare-fun bm!47975 () Bool)

(assert (=> bm!47975 (= call!47978 (contains!6499 (ite c!109838 lt!501300 call!47973) k!934))))

(declare-fun c!109837 () Bool)

(declare-fun bm!47976 () Bool)

(declare-fun addStillContains!690 (ListLongMap!15921 (_ BitVec 64) V!43001 (_ BitVec 64)) Unit!36991)

(assert (=> bm!47976 (= call!47980 (addStillContains!690 (ite c!109838 lt!501300 lt!501294) (ite c!109838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109838 minValue!944 (ite c!109837 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1129203 () Bool)

(declare-fun e!642645 () Bool)

(assert (=> b!1129203 (= e!642644 e!642645)))

(declare-fun res!754610 () Bool)

(assert (=> b!1129203 (=> res!754610 e!642645)))

(assert (=> b!1129203 (= res!754610 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36022 _keys!1208))))))

(declare-fun lt!501298 () Unit!36991)

(declare-fun e!642657 () Unit!36991)

(assert (=> b!1129203 (= lt!501298 e!642657)))

(declare-fun lt!501290 () Bool)

(assert (=> b!1129203 (= c!109838 (and (not lt!501290) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129203 (= lt!501290 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1129204 () Bool)

(declare-fun e!642653 () Bool)

(declare-fun tp_is_empty!28405 () Bool)

(assert (=> b!1129204 (= e!642653 tp_is_empty!28405)))

(declare-fun b!1129205 () Bool)

(declare-fun e!642655 () Bool)

(declare-fun e!642650 () Bool)

(declare-fun mapRes!44425 () Bool)

(assert (=> b!1129205 (= e!642655 (and e!642650 mapRes!44425))))

(declare-fun condMapEmpty!44425 () Bool)

(declare-fun mapDefault!44425 () ValueCell!13493)


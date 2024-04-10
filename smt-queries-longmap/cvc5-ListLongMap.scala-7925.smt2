; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98390 () Bool)

(assert start!98390)

(declare-fun b_free!23995 () Bool)

(declare-fun b_next!23995 () Bool)

(assert (=> start!98390 (= b_free!23995 (not b_next!23995))))

(declare-fun tp!84695 () Bool)

(declare-fun b_and!38839 () Bool)

(assert (=> start!98390 (= tp!84695 b_and!38839)))

(declare-datatypes ((V!43161 0))(
  ( (V!43162 (val!14319 Int)) )
))
(declare-fun zeroValue!944 () V!43161)

(declare-datatypes ((array!73911 0))(
  ( (array!73912 (arr!35606 (Array (_ BitVec 32) (_ BitVec 64))) (size!36142 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73911)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18068 0))(
  ( (tuple2!18069 (_1!9045 (_ BitVec 64)) (_2!9045 V!43161)) )
))
(declare-datatypes ((List!24826 0))(
  ( (Nil!24823) (Cons!24822 (h!26031 tuple2!18068) (t!35813 List!24826)) )
))
(declare-datatypes ((ListLongMap!16037 0))(
  ( (ListLongMap!16038 (toList!8034 List!24826)) )
))
(declare-fun call!49483 () ListLongMap!16037)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!49479 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13553 0))(
  ( (ValueCellFull!13553 (v!16956 V!43161)) (EmptyCell!13553) )
))
(declare-datatypes ((array!73913 0))(
  ( (array!73914 (arr!35607 (Array (_ BitVec 32) ValueCell!13553)) (size!36143 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73913)

(declare-fun minValue!944 () V!43161)

(declare-fun getCurrentListMapNoExtraKeys!4520 (array!73911 array!73913 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 32) Int) ListLongMap!16037)

(assert (=> bm!49479 (= call!49483 (getCurrentListMapNoExtraKeys!4520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134982 () Bool)

(declare-fun e!645908 () Bool)

(declare-fun e!645921 () Bool)

(assert (=> b!1134982 (= e!645908 e!645921)))

(declare-fun res!757665 () Bool)

(assert (=> b!1134982 (=> res!757665 e!645921)))

(declare-fun lt!504505 () ListLongMap!16037)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6562 (ListLongMap!16037 (_ BitVec 64)) Bool)

(assert (=> b!1134982 (= res!757665 (not (contains!6562 lt!504505 k!934)))))

(assert (=> b!1134982 (= lt!504505 (getCurrentListMapNoExtraKeys!4520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134983 () Bool)

(declare-fun e!645911 () Bool)

(assert (=> b!1134983 (= e!645921 e!645911)))

(declare-fun res!757651 () Bool)

(assert (=> b!1134983 (=> res!757651 e!645911)))

(assert (=> b!1134983 (= res!757651 (or (bvsge (size!36142 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36142 _keys!1208)) (bvsge from!1455 (size!36142 _keys!1208))))))

(declare-datatypes ((List!24827 0))(
  ( (Nil!24824) (Cons!24823 (h!26032 (_ BitVec 64)) (t!35814 List!24827)) )
))
(declare-fun arrayNoDuplicates!0 (array!73911 (_ BitVec 32) List!24827) Bool)

(assert (=> b!1134983 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24824)))

(declare-datatypes ((Unit!37183 0))(
  ( (Unit!37184) )
))
(declare-fun lt!504514 () Unit!37183)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73911 (_ BitVec 32) (_ BitVec 32)) Unit!37183)

(assert (=> b!1134983 (= lt!504514 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!645912 () Bool)

(assert (=> b!1134983 e!645912))

(declare-fun res!757667 () Bool)

(assert (=> b!1134983 (=> (not res!757667) (not e!645912))))

(declare-fun e!645920 () Bool)

(assert (=> b!1134983 (= res!757667 e!645920)))

(declare-fun c!110867 () Bool)

(assert (=> b!1134983 (= c!110867 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504515 () Unit!37183)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!340 (array!73911 array!73913 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 64) (_ BitVec 32) Int) Unit!37183)

(assert (=> b!1134983 (= lt!504515 (lemmaListMapContainsThenArrayContainsFrom!340 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504509 () Unit!37183)

(declare-fun e!645919 () Unit!37183)

(assert (=> b!1134983 (= lt!504509 e!645919)))

(declare-fun c!110869 () Bool)

(declare-fun lt!504513 () Bool)

(assert (=> b!1134983 (= c!110869 (and (not lt!504513) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134983 (= lt!504513 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134984 () Bool)

(declare-fun e!645914 () Bool)

(declare-fun tp_is_empty!28525 () Bool)

(assert (=> b!1134984 (= e!645914 tp_is_empty!28525)))

(declare-fun b!1134985 () Bool)

(declare-fun res!757650 () Bool)

(declare-fun e!645923 () Bool)

(assert (=> b!1134985 (=> (not res!757650) (not e!645923))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134985 (= res!757650 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36142 _keys!1208))))))

(declare-fun b!1134986 () Bool)

(declare-fun res!757664 () Bool)

(assert (=> b!1134986 (=> (not res!757664) (not e!645923))))

(assert (=> b!1134986 (= res!757664 (= (select (arr!35606 _keys!1208) i!673) k!934))))

(declare-fun bm!49480 () Bool)

(declare-fun call!49487 () Unit!37183)

(declare-fun call!49484 () Unit!37183)

(assert (=> bm!49480 (= call!49487 call!49484)))

(declare-fun e!645913 () Bool)

(declare-fun b!1134987 () Bool)

(declare-fun call!49486 () ListLongMap!16037)

(declare-fun -!1198 (ListLongMap!16037 (_ BitVec 64)) ListLongMap!16037)

(assert (=> b!1134987 (= e!645913 (= call!49486 (-!1198 call!49483 k!934)))))

(declare-fun bm!49481 () Bool)

(declare-fun c!110865 () Bool)

(declare-fun call!49489 () ListLongMap!16037)

(declare-fun +!3471 (ListLongMap!16037 tuple2!18068) ListLongMap!16037)

(assert (=> bm!49481 (= call!49489 (+!3471 lt!504505 (ite (or c!110869 c!110865) (tuple2!18069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1134988 () Bool)

(declare-fun lt!504517 () Unit!37183)

(assert (=> b!1134988 (= e!645919 lt!504517)))

(declare-fun lt!504507 () Unit!37183)

(assert (=> b!1134988 (= lt!504507 call!49484)))

(declare-fun lt!504518 () ListLongMap!16037)

(assert (=> b!1134988 (= lt!504518 call!49489)))

(declare-fun call!49485 () Bool)

(assert (=> b!1134988 call!49485))

(declare-fun addStillContains!735 (ListLongMap!16037 (_ BitVec 64) V!43161 (_ BitVec 64)) Unit!37183)

(assert (=> b!1134988 (= lt!504517 (addStillContains!735 lt!504518 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1134988 (contains!6562 (+!3471 lt!504518 (tuple2!18069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1134989 () Bool)

(declare-fun arrayContainsKey!0 (array!73911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134989 (= e!645920 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134990 () Bool)

(declare-fun res!757652 () Bool)

(assert (=> b!1134990 (=> (not res!757652) (not e!645923))))

(assert (=> b!1134990 (= res!757652 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24824))))

(declare-fun b!1134991 () Bool)

(declare-fun e!645916 () Bool)

(declare-fun e!645910 () Bool)

(assert (=> b!1134991 (= e!645916 (not e!645910))))

(declare-fun res!757662 () Bool)

(assert (=> b!1134991 (=> res!757662 e!645910)))

(assert (=> b!1134991 (= res!757662 (bvsgt from!1455 i!673))))

(assert (=> b!1134991 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!504506 () Unit!37183)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73911 (_ BitVec 64) (_ BitVec 32)) Unit!37183)

(assert (=> b!1134991 (= lt!504506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1134992 () Bool)

(declare-fun c!110866 () Bool)

(assert (=> b!1134992 (= c!110866 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504513))))

(declare-fun e!645924 () Unit!37183)

(declare-fun e!645922 () Unit!37183)

(assert (=> b!1134992 (= e!645924 e!645922)))

(declare-fun b!1134993 () Bool)

(declare-fun res!757656 () Bool)

(assert (=> b!1134993 (=> (not res!757656) (not e!645923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73911 (_ BitVec 32)) Bool)

(assert (=> b!1134993 (= res!757656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!49482 () Bool)

(declare-fun call!49482 () ListLongMap!16037)

(assert (=> bm!49482 (= call!49482 call!49489)))

(declare-fun lt!504511 () array!73913)

(declare-fun lt!504512 () array!73911)

(declare-fun bm!49483 () Bool)

(assert (=> bm!49483 (= call!49486 (getCurrentListMapNoExtraKeys!4520 lt!504512 lt!504511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134994 () Bool)

(assert (=> b!1134994 (= e!645911 true)))

(declare-fun lt!504510 () Bool)

(declare-fun contains!6563 (List!24827 (_ BitVec 64)) Bool)

(assert (=> b!1134994 (= lt!504510 (contains!6563 Nil!24824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49484 () Bool)

(declare-fun call!49488 () Bool)

(assert (=> bm!49484 (= call!49488 call!49485)))

(declare-fun b!1134995 () Bool)

(declare-fun res!757657 () Bool)

(assert (=> b!1134995 (=> (not res!757657) (not e!645923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134995 (= res!757657 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!44612 () Bool)

(declare-fun mapRes!44612 () Bool)

(assert (=> mapIsEmpty!44612 mapRes!44612))

(declare-fun b!1134996 () Bool)

(declare-fun Unit!37185 () Unit!37183)

(assert (=> b!1134996 (= e!645922 Unit!37185)))

(declare-fun b!1134997 () Bool)

(declare-fun e!645918 () Bool)

(assert (=> b!1134997 (= e!645918 (and e!645914 mapRes!44612))))

(declare-fun condMapEmpty!44612 () Bool)

(declare-fun mapDefault!44612 () ValueCell!13553)


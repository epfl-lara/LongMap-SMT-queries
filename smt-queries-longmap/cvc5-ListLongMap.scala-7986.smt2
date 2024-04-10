; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98756 () Bool)

(assert start!98756)

(declare-fun b_free!24361 () Bool)

(declare-fun b_next!24361 () Bool)

(assert (=> start!98756 (= b_free!24361 (not b_next!24361))))

(declare-fun tp!85793 () Bool)

(declare-fun b_and!39571 () Bool)

(assert (=> start!98756 (= tp!85793 b_and!39571)))

(declare-fun b!1151618 () Bool)

(declare-datatypes ((V!43649 0))(
  ( (V!43650 (val!14502 Int)) )
))
(declare-datatypes ((tuple2!18414 0))(
  ( (tuple2!18415 (_1!9218 (_ BitVec 64)) (_2!9218 V!43649)) )
))
(declare-datatypes ((List!25162 0))(
  ( (Nil!25159) (Cons!25158 (h!26367 tuple2!18414) (t!36515 List!25162)) )
))
(declare-datatypes ((ListLongMap!16383 0))(
  ( (ListLongMap!16384 (toList!8207 List!25162)) )
))
(declare-fun call!53880 () ListLongMap!16383)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6725 (ListLongMap!16383 (_ BitVec 64)) Bool)

(assert (=> b!1151618 (contains!6725 call!53880 k!934)))

(declare-datatypes ((Unit!37886 0))(
  ( (Unit!37887) )
))
(declare-fun lt!515663 () Unit!37886)

(declare-fun call!53874 () Unit!37886)

(assert (=> b!1151618 (= lt!515663 call!53874)))

(declare-fun call!53881 () Bool)

(assert (=> b!1151618 call!53881))

(declare-fun lt!515652 () ListLongMap!16383)

(declare-fun lt!515655 () ListLongMap!16383)

(declare-fun zeroValue!944 () V!43649)

(declare-fun +!3625 (ListLongMap!16383 tuple2!18414) ListLongMap!16383)

(assert (=> b!1151618 (= lt!515652 (+!3625 lt!515655 (tuple2!18415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515666 () Unit!37886)

(declare-fun addStillContains!873 (ListLongMap!16383 (_ BitVec 64) V!43649 (_ BitVec 64)) Unit!37886)

(assert (=> b!1151618 (= lt!515666 (addStillContains!873 lt!515655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!654996 () Unit!37886)

(assert (=> b!1151618 (= e!654996 lt!515663)))

(declare-fun b!1151619 () Bool)

(declare-fun res!765793 () Bool)

(declare-fun e!655000 () Bool)

(assert (=> b!1151619 (=> (not res!765793) (not e!655000))))

(declare-datatypes ((array!74629 0))(
  ( (array!74630 (arr!35965 (Array (_ BitVec 32) (_ BitVec 64))) (size!36501 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74629)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151619 (= res!765793 (= (select (arr!35965 _keys!1208) i!673) k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1151621 () Bool)

(declare-fun lt!515664 () Bool)

(declare-fun e!655001 () Bool)

(assert (=> b!1151621 (= e!655001 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515664) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151622 () Bool)

(declare-fun res!765798 () Bool)

(assert (=> b!1151622 (=> (not res!765798) (not e!655000))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13736 0))(
  ( (ValueCellFull!13736 (v!17139 V!43649)) (EmptyCell!13736) )
))
(declare-datatypes ((array!74631 0))(
  ( (array!74632 (arr!35966 (Array (_ BitVec 32) ValueCell!13736)) (size!36502 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74631)

(assert (=> b!1151622 (= res!765798 (and (= (size!36502 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36501 _keys!1208) (size!36502 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1151623 () Bool)

(declare-fun arrayContainsKey!0 (array!74629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151623 (= e!655001 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!53879 () ListLongMap!16383)

(declare-fun b!1151624 () Bool)

(declare-fun e!654993 () Bool)

(declare-fun call!53875 () ListLongMap!16383)

(declare-fun -!1338 (ListLongMap!16383 (_ BitVec 64)) ListLongMap!16383)

(assert (=> b!1151624 (= e!654993 (= call!53875 (-!1338 call!53879 k!934)))))

(declare-fun b!1151625 () Bool)

(declare-fun res!765799 () Bool)

(assert (=> b!1151625 (=> (not res!765799) (not e!655000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151625 (= res!765799 (validKeyInArray!0 k!934))))

(declare-fun b!1151626 () Bool)

(declare-fun e!655002 () Unit!37886)

(declare-fun Unit!37888 () Unit!37886)

(assert (=> b!1151626 (= e!655002 Unit!37888)))

(declare-fun b!1151627 () Bool)

(declare-fun res!765800 () Bool)

(assert (=> b!1151627 (=> (not res!765800) (not e!655000))))

(assert (=> b!1151627 (= res!765800 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36501 _keys!1208))))))

(declare-fun b!1151628 () Bool)

(declare-fun e!654991 () Unit!37886)

(declare-fun Unit!37889 () Unit!37886)

(assert (=> b!1151628 (= e!654991 Unit!37889)))

(assert (=> b!1151628 (= lt!515664 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114110 () Bool)

(assert (=> b!1151628 (= c!114110 (and (not lt!515664) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515665 () Unit!37886)

(assert (=> b!1151628 (= lt!515665 e!654996)))

(declare-fun lt!515648 () Unit!37886)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43649)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!466 (array!74629 array!74631 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 64) (_ BitVec 32) Int) Unit!37886)

(assert (=> b!1151628 (= lt!515648 (lemmaListMapContainsThenArrayContainsFrom!466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114109 () Bool)

(assert (=> b!1151628 (= c!114109 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765796 () Bool)

(assert (=> b!1151628 (= res!765796 e!655001)))

(declare-fun e!655005 () Bool)

(assert (=> b!1151628 (=> (not res!765796) (not e!655005))))

(assert (=> b!1151628 e!655005))

(declare-fun lt!515660 () Unit!37886)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74629 (_ BitVec 32) (_ BitVec 32)) Unit!37886)

(assert (=> b!1151628 (= lt!515660 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25163 0))(
  ( (Nil!25160) (Cons!25159 (h!26368 (_ BitVec 64)) (t!36516 List!25163)) )
))
(declare-fun arrayNoDuplicates!0 (array!74629 (_ BitVec 32) List!25163) Bool)

(assert (=> b!1151628 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25160)))

(declare-fun lt!515658 () Unit!37886)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74629 (_ BitVec 64) (_ BitVec 32) List!25163) Unit!37886)

(assert (=> b!1151628 (= lt!515658 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25160))))

(assert (=> b!1151628 false))

(declare-fun b!1151629 () Bool)

(declare-fun Unit!37890 () Unit!37886)

(assert (=> b!1151629 (= e!654991 Unit!37890)))

(declare-fun b!1151630 () Bool)

(declare-fun e!654999 () Bool)

(assert (=> b!1151630 (= e!654999 true)))

(declare-fun e!654989 () Bool)

(assert (=> b!1151630 e!654989))

(declare-fun res!765789 () Bool)

(assert (=> b!1151630 (=> (not res!765789) (not e!654989))))

(declare-fun lt!515661 () ListLongMap!16383)

(assert (=> b!1151630 (= res!765789 (= lt!515661 lt!515655))))

(declare-fun lt!515654 () ListLongMap!16383)

(assert (=> b!1151630 (= lt!515661 (-!1338 lt!515654 k!934))))

(declare-fun lt!515656 () V!43649)

(assert (=> b!1151630 (= (-!1338 (+!3625 lt!515655 (tuple2!18415 (select (arr!35965 _keys!1208) from!1455) lt!515656)) (select (arr!35965 _keys!1208) from!1455)) lt!515655)))

(declare-fun lt!515646 () Unit!37886)

(declare-fun addThenRemoveForNewKeyIsSame!180 (ListLongMap!16383 (_ BitVec 64) V!43649) Unit!37886)

(assert (=> b!1151630 (= lt!515646 (addThenRemoveForNewKeyIsSame!180 lt!515655 (select (arr!35965 _keys!1208) from!1455) lt!515656))))

(declare-fun lt!515657 () V!43649)

(declare-fun get!18314 (ValueCell!13736 V!43649) V!43649)

(assert (=> b!1151630 (= lt!515656 (get!18314 (select (arr!35966 _values!996) from!1455) lt!515657))))

(declare-fun lt!515667 () Unit!37886)

(assert (=> b!1151630 (= lt!515667 e!654991)))

(declare-fun c!114107 () Bool)

(assert (=> b!1151630 (= c!114107 (contains!6725 lt!515655 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4679 (array!74629 array!74631 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 32) Int) ListLongMap!16383)

(assert (=> b!1151630 (= lt!515655 (getCurrentListMapNoExtraKeys!4679 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151631 () Bool)

(declare-fun res!765795 () Bool)

(declare-fun e!655004 () Bool)

(assert (=> b!1151631 (=> (not res!765795) (not e!655004))))

(declare-fun lt!515653 () array!74629)

(assert (=> b!1151631 (= res!765795 (arrayNoDuplicates!0 lt!515653 #b00000000000000000000000000000000 Nil!25160))))

(declare-fun b!1151632 () Bool)

(declare-fun e!654995 () Bool)

(declare-fun tp_is_empty!28891 () Bool)

(assert (=> b!1151632 (= e!654995 tp_is_empty!28891)))

(declare-fun b!1151633 () Bool)

(declare-fun call!53878 () Bool)

(assert (=> b!1151633 call!53878))

(declare-fun lt!515659 () Unit!37886)

(declare-fun call!53876 () Unit!37886)

(assert (=> b!1151633 (= lt!515659 call!53876)))

(assert (=> b!1151633 (= e!655002 lt!515659)))

(declare-fun b!1151634 () Bool)

(declare-fun e!654998 () Bool)

(declare-fun mapRes!45161 () Bool)

(assert (=> b!1151634 (= e!654998 (and e!654995 mapRes!45161))))

(declare-fun condMapEmpty!45161 () Bool)

(declare-fun mapDefault!45161 () ValueCell!13736)


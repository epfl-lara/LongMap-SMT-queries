; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98498 () Bool)

(assert start!98498)

(declare-fun b_free!24103 () Bool)

(declare-fun b_next!24103 () Bool)

(assert (=> start!98498 (= b_free!24103 (not b_next!24103))))

(declare-fun tp!85019 () Bool)

(declare-fun b_and!39055 () Bool)

(assert (=> start!98498 (= tp!85019 b_and!39055)))

(declare-fun b!1139892 () Bool)

(declare-datatypes ((V!43305 0))(
  ( (V!43306 (val!14373 Int)) )
))
(declare-datatypes ((tuple2!18172 0))(
  ( (tuple2!18173 (_1!9097 (_ BitVec 64)) (_2!9097 V!43305)) )
))
(declare-datatypes ((List!24927 0))(
  ( (Nil!24924) (Cons!24923 (h!26132 tuple2!18172) (t!36022 List!24927)) )
))
(declare-datatypes ((ListLongMap!16141 0))(
  ( (ListLongMap!16142 (toList!8086 List!24927)) )
))
(declare-fun lt!507441 () ListLongMap!16141)

(declare-fun minValue!944 () V!43305)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6621 (ListLongMap!16141 (_ BitVec 64)) Bool)

(declare-fun +!3518 (ListLongMap!16141 tuple2!18172) ListLongMap!16141)

(assert (=> b!1139892 (contains!6621 (+!3518 lt!507441 (tuple2!18173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-datatypes ((Unit!37368 0))(
  ( (Unit!37369) )
))
(declare-fun lt!507444 () Unit!37368)

(declare-fun call!50783 () Unit!37368)

(assert (=> b!1139892 (= lt!507444 call!50783)))

(declare-fun call!50779 () Bool)

(assert (=> b!1139892 call!50779))

(declare-fun call!50781 () ListLongMap!16141)

(assert (=> b!1139892 (= lt!507441 call!50781)))

(declare-fun zeroValue!944 () V!43305)

(declare-fun lt!507451 () Unit!37368)

(declare-fun lt!507439 () ListLongMap!16141)

(declare-fun addStillContains!776 (ListLongMap!16141 (_ BitVec 64) V!43305 (_ BitVec 64)) Unit!37368)

(assert (=> b!1139892 (= lt!507451 (addStillContains!776 lt!507439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!648556 () Unit!37368)

(assert (=> b!1139892 (= e!648556 lt!507444)))

(declare-fun b!1139893 () Bool)

(declare-fun e!648562 () Unit!37368)

(declare-fun Unit!37370 () Unit!37368)

(assert (=> b!1139893 (= e!648562 Unit!37370)))

(declare-fun lt!507455 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1139893 (= lt!507455 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111790 () Bool)

(assert (=> b!1139893 (= c!111790 (and (not lt!507455) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507442 () Unit!37368)

(assert (=> b!1139893 (= lt!507442 e!648556)))

(declare-datatypes ((array!74125 0))(
  ( (array!74126 (arr!35713 (Array (_ BitVec 32) (_ BitVec 64))) (size!36249 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74125)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13607 0))(
  ( (ValueCellFull!13607 (v!17010 V!43305)) (EmptyCell!13607) )
))
(declare-datatypes ((array!74127 0))(
  ( (array!74128 (arr!35714 (Array (_ BitVec 32) ValueCell!13607)) (size!36250 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74127)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!507443 () Unit!37368)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!376 (array!74125 array!74127 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 64) (_ BitVec 32) Int) Unit!37368)

(assert (=> b!1139893 (= lt!507443 (lemmaListMapContainsThenArrayContainsFrom!376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111789 () Bool)

(assert (=> b!1139893 (= c!111789 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760128 () Bool)

(declare-fun e!648565 () Bool)

(assert (=> b!1139893 (= res!760128 e!648565)))

(declare-fun e!648561 () Bool)

(assert (=> b!1139893 (=> (not res!760128) (not e!648561))))

(assert (=> b!1139893 e!648561))

(declare-fun lt!507437 () Unit!37368)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74125 (_ BitVec 32) (_ BitVec 32)) Unit!37368)

(assert (=> b!1139893 (= lt!507437 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24928 0))(
  ( (Nil!24925) (Cons!24924 (h!26133 (_ BitVec 64)) (t!36023 List!24928)) )
))
(declare-fun arrayNoDuplicates!0 (array!74125 (_ BitVec 32) List!24928) Bool)

(assert (=> b!1139893 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24925)))

(declare-fun lt!507453 () Unit!37368)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74125 (_ BitVec 64) (_ BitVec 32) List!24928) Unit!37368)

(assert (=> b!1139893 (= lt!507453 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24925))))

(assert (=> b!1139893 false))

(declare-fun b!1139894 () Bool)

(assert (=> b!1139894 (= e!648565 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507455) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139895 () Bool)

(declare-fun res!760131 () Bool)

(declare-fun e!648553 () Bool)

(assert (=> b!1139895 (=> (not res!760131) (not e!648553))))

(declare-fun lt!507440 () array!74125)

(assert (=> b!1139895 (= res!760131 (arrayNoDuplicates!0 lt!507440 #b00000000000000000000000000000000 Nil!24925))))

(declare-fun b!1139896 () Bool)

(declare-fun e!648567 () Bool)

(declare-fun tp_is_empty!28633 () Bool)

(assert (=> b!1139896 (= e!648567 tp_is_empty!28633)))

(declare-fun b!1139897 () Bool)

(declare-fun res!760134 () Bool)

(declare-fun e!648564 () Bool)

(assert (=> b!1139897 (=> (not res!760134) (not e!648564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74125 (_ BitVec 32)) Bool)

(assert (=> b!1139897 (= res!760134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139898 () Bool)

(declare-fun e!648566 () Unit!37368)

(declare-fun e!648558 () Unit!37368)

(assert (=> b!1139898 (= e!648566 e!648558)))

(declare-fun c!111786 () Bool)

(assert (=> b!1139898 (= c!111786 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507455))))

(declare-fun b!1139899 () Bool)

(declare-fun res!760132 () Bool)

(assert (=> b!1139899 (=> (not res!760132) (not e!648564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139899 (= res!760132 (validKeyInArray!0 k!934))))

(declare-fun b!1139900 () Bool)

(declare-fun res!760129 () Bool)

(assert (=> b!1139900 (=> (not res!760129) (not e!648564))))

(assert (=> b!1139900 (= res!760129 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24925))))

(declare-fun bm!50775 () Bool)

(declare-fun call!50782 () Bool)

(assert (=> bm!50775 (= call!50782 call!50779)))

(declare-fun bm!50776 () Bool)

(declare-fun call!50785 () Unit!37368)

(assert (=> bm!50776 (= call!50785 call!50783)))

(declare-fun b!1139901 () Bool)

(declare-fun arrayContainsKey!0 (array!74125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139901 (= e!648561 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!760136 () Bool)

(assert (=> start!98498 (=> (not res!760136) (not e!648564))))

(assert (=> start!98498 (= res!760136 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36249 _keys!1208))))))

(assert (=> start!98498 e!648564))

(assert (=> start!98498 tp_is_empty!28633))

(declare-fun array_inv!27374 (array!74125) Bool)

(assert (=> start!98498 (array_inv!27374 _keys!1208)))

(assert (=> start!98498 true))

(assert (=> start!98498 tp!85019))

(declare-fun e!648557 () Bool)

(declare-fun array_inv!27375 (array!74127) Bool)

(assert (=> start!98498 (and (array_inv!27375 _values!996) e!648557)))

(declare-fun mapIsEmpty!44774 () Bool)

(declare-fun mapRes!44774 () Bool)

(assert (=> mapIsEmpty!44774 mapRes!44774))

(declare-fun b!1139902 () Bool)

(declare-fun e!648563 () Bool)

(declare-fun e!648552 () Bool)

(assert (=> b!1139902 (= e!648563 e!648552)))

(declare-fun res!760127 () Bool)

(assert (=> b!1139902 (=> res!760127 e!648552)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139902 (= res!760127 (not (= from!1455 i!673)))))

(declare-fun lt!507456 () ListLongMap!16141)

(declare-fun lt!507445 () array!74127)

(declare-fun getCurrentListMapNoExtraKeys!4568 (array!74125 array!74127 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 32) Int) ListLongMap!16141)

(assert (=> b!1139902 (= lt!507456 (getCurrentListMapNoExtraKeys!4568 lt!507440 lt!507445 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507446 () V!43305)

(assert (=> b!1139902 (= lt!507445 (array!74128 (store (arr!35714 _values!996) i!673 (ValueCellFull!13607 lt!507446)) (size!36250 _values!996)))))

(declare-fun dynLambda!2617 (Int (_ BitVec 64)) V!43305)

(assert (=> b!1139902 (= lt!507446 (dynLambda!2617 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507450 () ListLongMap!16141)

(assert (=> b!1139902 (= lt!507450 (getCurrentListMapNoExtraKeys!4568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139903 () Bool)

(declare-fun e!648560 () Bool)

(declare-fun call!50780 () ListLongMap!16141)

(declare-fun call!50784 () ListLongMap!16141)

(assert (=> b!1139903 (= e!648560 (= call!50780 call!50784))))

(declare-fun b!1139904 () Bool)

(declare-fun e!648554 () Bool)

(assert (=> b!1139904 (= e!648554 true)))

(declare-fun lt!507452 () V!43305)

(declare-fun -!1236 (ListLongMap!16141 (_ BitVec 64)) ListLongMap!16141)

(assert (=> b!1139904 (= (-!1236 (+!3518 lt!507439 (tuple2!18173 (select (arr!35713 _keys!1208) from!1455) lt!507452)) (select (arr!35713 _keys!1208) from!1455)) lt!507439)))

(declare-fun lt!507438 () Unit!37368)

(declare-fun addThenRemoveForNewKeyIsSame!91 (ListLongMap!16141 (_ BitVec 64) V!43305) Unit!37368)

(assert (=> b!1139904 (= lt!507438 (addThenRemoveForNewKeyIsSame!91 lt!507439 (select (arr!35713 _keys!1208) from!1455) lt!507452))))

(declare-fun get!18139 (ValueCell!13607 V!43305) V!43305)

(assert (=> b!1139904 (= lt!507452 (get!18139 (select (arr!35714 _values!996) from!1455) lt!507446))))

(declare-fun lt!507436 () Unit!37368)

(assert (=> b!1139904 (= lt!507436 e!648562)))

(declare-fun c!111788 () Bool)

(assert (=> b!1139904 (= c!111788 (contains!6621 lt!507439 k!934))))

(assert (=> b!1139904 (= lt!507439 (getCurrentListMapNoExtraKeys!4568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139905 () Bool)

(assert (=> b!1139905 call!50782))

(declare-fun lt!507447 () Unit!37368)

(assert (=> b!1139905 (= lt!507447 call!50785)))

(assert (=> b!1139905 (= e!648558 lt!507447)))

(declare-fun b!1139906 () Bool)

(declare-fun lt!507448 () Unit!37368)

(assert (=> b!1139906 (= e!648566 lt!507448)))

(assert (=> b!1139906 (= lt!507448 call!50785)))

(assert (=> b!1139906 call!50782))

(declare-fun b!1139907 () Bool)

(declare-fun Unit!37371 () Unit!37368)

(assert (=> b!1139907 (= e!648558 Unit!37371)))

(declare-fun b!1139908 () Bool)

(assert (=> b!1139908 (= e!648553 (not e!648563))))

(declare-fun res!760130 () Bool)

(assert (=> b!1139908 (=> res!760130 e!648563)))

(assert (=> b!1139908 (= res!760130 (bvsgt from!1455 i!673))))

(assert (=> b!1139908 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!507454 () Unit!37368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74125 (_ BitVec 64) (_ BitVec 32)) Unit!37368)

(assert (=> b!1139908 (= lt!507454 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1139909 () Bool)

(declare-fun res!760137 () Bool)

(assert (=> b!1139909 (=> (not res!760137) (not e!648564))))

(assert (=> b!1139909 (= res!760137 (= (select (arr!35713 _keys!1208) i!673) k!934))))

(declare-fun bm!50777 () Bool)

(assert (=> bm!50777 (= call!50784 (getCurrentListMapNoExtraKeys!4568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111785 () Bool)

(declare-fun bm!50778 () Bool)

(assert (=> bm!50778 (= call!50781 (+!3518 lt!507439 (ite (or c!111790 c!111785) (tuple2!18173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1139910 () Bool)

(declare-fun res!760138 () Bool)

(assert (=> b!1139910 (=> (not res!760138) (not e!648564))))

(assert (=> b!1139910 (= res!760138 (and (= (size!36250 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36249 _keys!1208) (size!36250 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139911 () Bool)

(assert (=> b!1139911 (= c!111785 (and (not lt!507455) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139911 (= e!648556 e!648566)))

(declare-fun b!1139912 () Bool)

(declare-fun res!760126 () Bool)

(assert (=> b!1139912 (=> (not res!760126) (not e!648564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139912 (= res!760126 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44774 () Bool)

(declare-fun tp!85020 () Bool)

(declare-fun e!648555 () Bool)

(assert (=> mapNonEmpty!44774 (= mapRes!44774 (and tp!85020 e!648555))))

(declare-fun mapValue!44774 () ValueCell!13607)

(declare-fun mapRest!44774 () (Array (_ BitVec 32) ValueCell!13607))

(declare-fun mapKey!44774 () (_ BitVec 32))

(assert (=> mapNonEmpty!44774 (= (arr!35714 _values!996) (store mapRest!44774 mapKey!44774 mapValue!44774))))

(declare-fun b!1139913 () Bool)

(assert (=> b!1139913 (= e!648560 (= call!50780 (-!1236 call!50784 k!934)))))

(declare-fun bm!50779 () Bool)

(assert (=> bm!50779 (= call!50783 (addStillContains!776 (ite c!111790 lt!507441 lt!507439) (ite c!111790 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111785 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111790 minValue!944 (ite c!111785 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1139914 () Bool)

(declare-fun Unit!37372 () Unit!37368)

(assert (=> b!1139914 (= e!648562 Unit!37372)))

(declare-fun b!1139915 () Bool)

(assert (=> b!1139915 (= e!648557 (and e!648567 mapRes!44774))))

(declare-fun condMapEmpty!44774 () Bool)

(declare-fun mapDefault!44774 () ValueCell!13607)


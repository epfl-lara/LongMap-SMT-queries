; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98516 () Bool)

(assert start!98516)

(declare-fun b_free!24121 () Bool)

(declare-fun b_next!24121 () Bool)

(assert (=> start!98516 (= b_free!24121 (not b_next!24121))))

(declare-fun tp!85073 () Bool)

(declare-fun b_and!39091 () Bool)

(assert (=> start!98516 (= tp!85073 b_and!39091)))

(declare-fun b!1140693 () Bool)

(declare-fun res!760509 () Bool)

(declare-fun e!648995 () Bool)

(assert (=> b!1140693 (=> (not res!760509) (not e!648995))))

(declare-datatypes ((array!74159 0))(
  ( (array!74160 (arr!35730 (Array (_ BitVec 32) (_ BitVec 64))) (size!36266 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74159)

(declare-datatypes ((List!24943 0))(
  ( (Nil!24940) (Cons!24939 (h!26148 (_ BitVec 64)) (t!36056 List!24943)) )
))
(declare-fun arrayNoDuplicates!0 (array!74159 (_ BitVec 32) List!24943) Bool)

(assert (=> b!1140693 (= res!760509 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24940))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1140694 () Bool)

(declare-fun e!648996 () Bool)

(declare-fun lt!508009 () Bool)

(assert (=> b!1140694 (= e!648996 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508009) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140695 () Bool)

(declare-datatypes ((Unit!37404 0))(
  ( (Unit!37405) )
))
(declare-fun e!648999 () Unit!37404)

(declare-fun Unit!37406 () Unit!37404)

(assert (=> b!1140695 (= e!648999 Unit!37406)))

(declare-fun b!1140696 () Bool)

(declare-fun e!648990 () Bool)

(declare-fun e!648992 () Bool)

(assert (=> b!1140696 (= e!648990 (not e!648992))))

(declare-fun res!760504 () Bool)

(assert (=> b!1140696 (=> res!760504 e!648992)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140696 (= res!760504 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140696 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!508008 () Unit!37404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74159 (_ BitVec 64) (_ BitVec 32)) Unit!37404)

(assert (=> b!1140696 (= lt!508008 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1140697 () Bool)

(declare-fun e!648988 () Bool)

(assert (=> b!1140697 (= e!648988 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140698 () Bool)

(assert (=> b!1140698 (= e!648996 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140699 () Bool)

(declare-fun res!760515 () Bool)

(assert (=> b!1140699 (=> (not res!760515) (not e!648995))))

(assert (=> b!1140699 (= res!760515 (= (select (arr!35730 _keys!1208) i!673) k!934))))

(declare-fun b!1140700 () Bool)

(declare-fun c!111948 () Bool)

(assert (=> b!1140700 (= c!111948 (and (not lt!508009) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648991 () Unit!37404)

(declare-fun e!648984 () Unit!37404)

(assert (=> b!1140700 (= e!648991 e!648984)))

(declare-fun c!111951 () Bool)

(declare-datatypes ((V!43329 0))(
  ( (V!43330 (val!14382 Int)) )
))
(declare-datatypes ((tuple2!18188 0))(
  ( (tuple2!18189 (_1!9105 (_ BitVec 64)) (_2!9105 V!43329)) )
))
(declare-datatypes ((List!24944 0))(
  ( (Nil!24941) (Cons!24940 (h!26149 tuple2!18188) (t!36057 List!24944)) )
))
(declare-datatypes ((ListLongMap!16157 0))(
  ( (ListLongMap!16158 (toList!8094 List!24944)) )
))
(declare-fun lt!508021 () ListLongMap!16157)

(declare-fun call!50994 () ListLongMap!16157)

(declare-fun bm!50991 () Bool)

(declare-fun call!50995 () Bool)

(declare-fun contains!6629 (ListLongMap!16157 (_ BitVec 64)) Bool)

(assert (=> bm!50991 (= call!50995 (contains!6629 (ite c!111951 lt!508021 call!50994) k!934))))

(declare-fun b!1140701 () Bool)

(declare-fun res!760516 () Bool)

(assert (=> b!1140701 (=> (not res!760516) (not e!648990))))

(declare-fun lt!508023 () array!74159)

(assert (=> b!1140701 (= res!760516 (arrayNoDuplicates!0 lt!508023 #b00000000000000000000000000000000 Nil!24940))))

(declare-fun b!1140703 () Bool)

(declare-fun call!50998 () Bool)

(assert (=> b!1140703 call!50998))

(declare-fun lt!508010 () Unit!37404)

(declare-fun call!51001 () Unit!37404)

(assert (=> b!1140703 (= lt!508010 call!51001)))

(declare-fun e!648987 () Unit!37404)

(assert (=> b!1140703 (= e!648987 lt!508010)))

(declare-fun zeroValue!944 () V!43329)

(declare-fun call!50997 () ListLongMap!16157)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13616 0))(
  ( (ValueCellFull!13616 (v!17019 V!43329)) (EmptyCell!13616) )
))
(declare-datatypes ((array!74161 0))(
  ( (array!74162 (arr!35731 (Array (_ BitVec 32) ValueCell!13616)) (size!36267 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74161)

(declare-fun minValue!944 () V!43329)

(declare-fun bm!50992 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4576 (array!74159 array!74161 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 32) Int) ListLongMap!16157)

(assert (=> bm!50992 (= call!50997 (getCurrentListMapNoExtraKeys!4576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140704 () Bool)

(declare-fun e!648997 () Bool)

(declare-fun call!51000 () ListLongMap!16157)

(assert (=> b!1140704 (= e!648997 (= call!51000 call!50997))))

(declare-fun b!1140705 () Bool)

(declare-fun e!648986 () Bool)

(assert (=> b!1140705 (= e!648986 true)))

(declare-fun lt!508003 () ListLongMap!16157)

(declare-fun lt!508012 () V!43329)

(declare-fun -!1244 (ListLongMap!16157 (_ BitVec 64)) ListLongMap!16157)

(declare-fun +!3526 (ListLongMap!16157 tuple2!18188) ListLongMap!16157)

(assert (=> b!1140705 (= (-!1244 (+!3526 lt!508003 (tuple2!18189 (select (arr!35730 _keys!1208) from!1455) lt!508012)) (select (arr!35730 _keys!1208) from!1455)) lt!508003)))

(declare-fun lt!508014 () Unit!37404)

(declare-fun addThenRemoveForNewKeyIsSame!98 (ListLongMap!16157 (_ BitVec 64) V!43329) Unit!37404)

(assert (=> b!1140705 (= lt!508014 (addThenRemoveForNewKeyIsSame!98 lt!508003 (select (arr!35730 _keys!1208) from!1455) lt!508012))))

(declare-fun lt!508018 () V!43329)

(declare-fun get!18152 (ValueCell!13616 V!43329) V!43329)

(assert (=> b!1140705 (= lt!508012 (get!18152 (select (arr!35731 _values!996) from!1455) lt!508018))))

(declare-fun lt!508020 () Unit!37404)

(assert (=> b!1140705 (= lt!508020 e!648999)))

(declare-fun c!111949 () Bool)

(assert (=> b!1140705 (= c!111949 (contains!6629 lt!508003 k!934))))

(assert (=> b!1140705 (= lt!508003 (getCurrentListMapNoExtraKeys!4576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140706 () Bool)

(declare-fun res!760507 () Bool)

(assert (=> b!1140706 (=> (not res!760507) (not e!648995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74159 (_ BitVec 32)) Bool)

(assert (=> b!1140706 (= res!760507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!50999 () ListLongMap!16157)

(declare-fun bm!50993 () Bool)

(assert (=> bm!50993 (= call!50999 (+!3526 lt!508003 (ite (or c!111951 c!111948) (tuple2!18189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1140707 () Bool)

(assert (=> b!1140707 (= e!648995 e!648990)))

(declare-fun res!760506 () Bool)

(assert (=> b!1140707 (=> (not res!760506) (not e!648990))))

(assert (=> b!1140707 (= res!760506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508023 mask!1564))))

(assert (=> b!1140707 (= lt!508023 (array!74160 (store (arr!35730 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36266 _keys!1208)))))

(declare-fun b!1140708 () Bool)

(declare-fun e!648994 () Bool)

(declare-fun tp_is_empty!28651 () Bool)

(assert (=> b!1140708 (= e!648994 tp_is_empty!28651)))

(declare-fun mapNonEmpty!44801 () Bool)

(declare-fun mapRes!44801 () Bool)

(declare-fun tp!85074 () Bool)

(assert (=> mapNonEmpty!44801 (= mapRes!44801 (and tp!85074 e!648994))))

(declare-fun mapKey!44801 () (_ BitVec 32))

(declare-fun mapValue!44801 () ValueCell!13616)

(declare-fun mapRest!44801 () (Array (_ BitVec 32) ValueCell!13616))

(assert (=> mapNonEmpty!44801 (= (arr!35731 _values!996) (store mapRest!44801 mapKey!44801 mapValue!44801))))

(declare-fun b!1140709 () Bool)

(declare-fun e!648985 () Bool)

(assert (=> b!1140709 (= e!648985 e!648986)))

(declare-fun res!760505 () Bool)

(assert (=> b!1140709 (=> res!760505 e!648986)))

(assert (=> b!1140709 (= res!760505 (not (= (select (arr!35730 _keys!1208) from!1455) k!934)))))

(assert (=> b!1140709 e!648997))

(declare-fun c!111952 () Bool)

(assert (=> b!1140709 (= c!111952 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508005 () Unit!37404)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!489 (array!74159 array!74161 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37404)

(assert (=> b!1140709 (= lt!508005 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50994 () Bool)

(assert (=> bm!50994 (= call!50994 call!50999)))

(declare-fun b!1140710 () Bool)

(assert (=> b!1140710 (= e!648984 e!648987)))

(declare-fun c!111950 () Bool)

(assert (=> b!1140710 (= c!111950 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508009))))

(declare-fun b!1140711 () Bool)

(declare-fun lt!508019 () Unit!37404)

(assert (=> b!1140711 (= e!648984 lt!508019)))

(assert (=> b!1140711 (= lt!508019 call!51001)))

(assert (=> b!1140711 call!50998))

(declare-fun b!1140712 () Bool)

(declare-fun res!760514 () Bool)

(assert (=> b!1140712 (=> (not res!760514) (not e!648995))))

(assert (=> b!1140712 (= res!760514 (and (= (size!36267 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36266 _keys!1208) (size!36267 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140713 () Bool)

(assert (=> b!1140713 (contains!6629 (+!3526 lt!508021 (tuple2!18189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!508011 () Unit!37404)

(declare-fun call!50996 () Unit!37404)

(assert (=> b!1140713 (= lt!508011 call!50996)))

(assert (=> b!1140713 call!50995))

(assert (=> b!1140713 (= lt!508021 call!50999)))

(declare-fun lt!508015 () Unit!37404)

(declare-fun addStillContains!783 (ListLongMap!16157 (_ BitVec 64) V!43329 (_ BitVec 64)) Unit!37404)

(assert (=> b!1140713 (= lt!508015 (addStillContains!783 lt!508003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1140713 (= e!648991 lt!508011)))

(declare-fun bm!50995 () Bool)

(assert (=> bm!50995 (= call!51001 call!50996)))

(declare-fun b!1140714 () Bool)

(declare-fun Unit!37407 () Unit!37404)

(assert (=> b!1140714 (= e!648987 Unit!37407)))

(declare-fun b!1140715 () Bool)

(declare-fun Unit!37408 () Unit!37404)

(assert (=> b!1140715 (= e!648999 Unit!37408)))

(assert (=> b!1140715 (= lt!508009 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140715 (= c!111951 (and (not lt!508009) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508004 () Unit!37404)

(assert (=> b!1140715 (= lt!508004 e!648991)))

(declare-fun lt!508006 () Unit!37404)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!382 (array!74159 array!74161 (_ BitVec 32) (_ BitVec 32) V!43329 V!43329 (_ BitVec 64) (_ BitVec 32) Int) Unit!37404)

(assert (=> b!1140715 (= lt!508006 (lemmaListMapContainsThenArrayContainsFrom!382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111947 () Bool)

(assert (=> b!1140715 (= c!111947 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760512 () Bool)

(assert (=> b!1140715 (= res!760512 e!648996)))

(assert (=> b!1140715 (=> (not res!760512) (not e!648988))))

(assert (=> b!1140715 e!648988))

(declare-fun lt!508007 () Unit!37404)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74159 (_ BitVec 32) (_ BitVec 32)) Unit!37404)

(assert (=> b!1140715 (= lt!508007 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140715 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24940)))

(declare-fun lt!508016 () Unit!37404)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74159 (_ BitVec 64) (_ BitVec 32) List!24943) Unit!37404)

(assert (=> b!1140715 (= lt!508016 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24940))))

(assert (=> b!1140715 false))

(declare-fun b!1140716 () Bool)

(declare-fun e!648989 () Bool)

(declare-fun e!648993 () Bool)

(assert (=> b!1140716 (= e!648989 (and e!648993 mapRes!44801))))

(declare-fun condMapEmpty!44801 () Bool)

(declare-fun mapDefault!44801 () ValueCell!13616)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98450 () Bool)

(assert start!98450)

(declare-fun b_free!24055 () Bool)

(declare-fun b_next!24055 () Bool)

(assert (=> start!98450 (= b_free!24055 (not b_next!24055))))

(declare-fun tp!84876 () Bool)

(declare-fun b_and!38959 () Bool)

(assert (=> start!98450 (= tp!84876 b_and!38959)))

(declare-fun b!1137756 () Bool)

(declare-fun res!759125 () Bool)

(declare-fun e!647400 () Bool)

(assert (=> b!1137756 (=> (not res!759125) (not e!647400))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137756 (= res!759125 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!43241 0))(
  ( (V!43242 (val!14349 Int)) )
))
(declare-fun zeroValue!944 () V!43241)

(declare-fun c!111358 () Bool)

(declare-fun bm!50199 () Bool)

(declare-datatypes ((tuple2!18124 0))(
  ( (tuple2!18125 (_1!9073 (_ BitVec 64)) (_2!9073 V!43241)) )
))
(declare-datatypes ((List!24881 0))(
  ( (Nil!24878) (Cons!24877 (h!26086 tuple2!18124) (t!35928 List!24881)) )
))
(declare-datatypes ((ListLongMap!16093 0))(
  ( (ListLongMap!16094 (toList!8062 List!24881)) )
))
(declare-fun lt!506071 () ListLongMap!16093)

(declare-datatypes ((Unit!37268 0))(
  ( (Unit!37269) )
))
(declare-fun call!50207 () Unit!37268)

(declare-fun c!111357 () Bool)

(declare-fun minValue!944 () V!43241)

(declare-fun addStillContains!757 (ListLongMap!16093 (_ BitVec 64) V!43241 (_ BitVec 64)) Unit!37268)

(assert (=> bm!50199 (= call!50207 (addStillContains!757 lt!506071 (ite (or c!111357 c!111358) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111357 c!111358) zeroValue!944 minValue!944) k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!74029 0))(
  ( (array!74030 (arr!35665 (Array (_ BitVec 32) (_ BitVec 64))) (size!36201 (_ BitVec 32))) )
))
(declare-fun lt!506083 () array!74029)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13583 0))(
  ( (ValueCellFull!13583 (v!16986 V!43241)) (EmptyCell!13583) )
))
(declare-datatypes ((array!74031 0))(
  ( (array!74032 (arr!35666 (Array (_ BitVec 32) ValueCell!13583)) (size!36202 (_ BitVec 32))) )
))
(declare-fun lt!506077 () array!74031)

(declare-fun call!50202 () ListLongMap!16093)

(declare-fun bm!50200 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4546 (array!74029 array!74031 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 32) Int) ListLongMap!16093)

(assert (=> bm!50200 (= call!50202 (getCurrentListMapNoExtraKeys!4546 lt!506083 lt!506077 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44702 () Bool)

(declare-fun mapRes!44702 () Bool)

(declare-fun tp!84875 () Bool)

(declare-fun e!647412 () Bool)

(assert (=> mapNonEmpty!44702 (= mapRes!44702 (and tp!84875 e!647412))))

(declare-fun mapValue!44702 () ValueCell!13583)

(declare-fun mapKey!44702 () (_ BitVec 32))

(declare-fun mapRest!44702 () (Array (_ BitVec 32) ValueCell!13583))

(declare-fun _values!996 () array!74031)

(assert (=> mapNonEmpty!44702 (= (arr!35666 _values!996) (store mapRest!44702 mapKey!44702 mapValue!44702))))

(declare-fun b!1137757 () Bool)

(declare-fun e!647415 () Unit!37268)

(declare-fun e!647402 () Unit!37268)

(assert (=> b!1137757 (= e!647415 e!647402)))

(declare-fun c!111355 () Bool)

(declare-fun lt!506087 () Bool)

(assert (=> b!1137757 (= c!111355 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506087))))

(declare-fun b!1137758 () Bool)

(declare-fun res!759121 () Bool)

(assert (=> b!1137758 (=> (not res!759121) (not e!647400))))

(declare-fun _keys!1208 () array!74029)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137758 (= res!759121 (= (select (arr!35665 _keys!1208) i!673) k!934))))

(declare-fun b!1137759 () Bool)

(declare-fun res!759124 () Bool)

(assert (=> b!1137759 (=> (not res!759124) (not e!647400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74029 (_ BitVec 32)) Bool)

(assert (=> b!1137759 (= res!759124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137760 () Bool)

(declare-fun e!647403 () Bool)

(declare-fun arrayContainsKey!0 (array!74029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137760 (= e!647403 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137761 () Bool)

(declare-fun res!759118 () Bool)

(assert (=> b!1137761 (=> (not res!759118) (not e!647400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137761 (= res!759118 (validMask!0 mask!1564))))

(declare-fun b!1137762 () Bool)

(declare-fun e!647406 () Bool)

(declare-fun e!647413 () Bool)

(assert (=> b!1137762 (= e!647406 (not e!647413))))

(declare-fun res!759120 () Bool)

(assert (=> b!1137762 (=> res!759120 e!647413)))

(assert (=> b!1137762 (= res!759120 (bvsgt from!1455 i!673))))

(assert (=> b!1137762 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!506088 () Unit!37268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74029 (_ BitVec 64) (_ BitVec 32)) Unit!37268)

(assert (=> b!1137762 (= lt!506088 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1137763 () Bool)

(assert (=> b!1137763 (= e!647400 e!647406)))

(declare-fun res!759119 () Bool)

(assert (=> b!1137763 (=> (not res!759119) (not e!647406))))

(assert (=> b!1137763 (= res!759119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506083 mask!1564))))

(assert (=> b!1137763 (= lt!506083 (array!74030 (store (arr!35665 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36201 _keys!1208)))))

(declare-fun b!1137764 () Bool)

(declare-fun tp_is_empty!28585 () Bool)

(assert (=> b!1137764 (= e!647412 tp_is_empty!28585)))

(declare-fun bm!50201 () Bool)

(declare-fun call!50208 () ListLongMap!16093)

(assert (=> bm!50201 (= call!50208 (getCurrentListMapNoExtraKeys!4546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137765 () Bool)

(declare-fun call!50205 () ListLongMap!16093)

(declare-fun contains!6600 (ListLongMap!16093 (_ BitVec 64)) Bool)

(assert (=> b!1137765 (contains!6600 call!50205 k!934)))

(declare-fun lt!506076 () ListLongMap!16093)

(declare-fun lt!506073 () Unit!37268)

(assert (=> b!1137765 (= lt!506073 (addStillContains!757 lt!506076 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!50209 () Bool)

(assert (=> b!1137765 call!50209))

(declare-fun +!3497 (ListLongMap!16093 tuple2!18124) ListLongMap!16093)

(assert (=> b!1137765 (= lt!506076 (+!3497 lt!506071 (tuple2!18125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506074 () Unit!37268)

(assert (=> b!1137765 (= lt!506074 call!50207)))

(declare-fun e!647410 () Unit!37268)

(assert (=> b!1137765 (= e!647410 lt!506073)))

(declare-fun b!1137766 () Bool)

(declare-fun res!759128 () Bool)

(assert (=> b!1137766 (=> (not res!759128) (not e!647406))))

(declare-datatypes ((List!24882 0))(
  ( (Nil!24879) (Cons!24878 (h!26087 (_ BitVec 64)) (t!35929 List!24882)) )
))
(declare-fun arrayNoDuplicates!0 (array!74029 (_ BitVec 32) List!24882) Bool)

(assert (=> b!1137766 (= res!759128 (arrayNoDuplicates!0 lt!506083 #b00000000000000000000000000000000 Nil!24879))))

(declare-fun call!50206 () ListLongMap!16093)

(declare-fun bm!50202 () Bool)

(assert (=> bm!50202 (= call!50209 (contains!6600 (ite c!111357 lt!506076 call!50206) k!934))))

(declare-fun b!1137767 () Bool)

(declare-fun e!647411 () Unit!37268)

(declare-fun Unit!37270 () Unit!37268)

(assert (=> b!1137767 (= e!647411 Unit!37270)))

(assert (=> b!1137767 (= lt!506087 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137767 (= c!111357 (and (not lt!506087) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506082 () Unit!37268)

(assert (=> b!1137767 (= lt!506082 e!647410)))

(declare-fun lt!506072 () Unit!37268)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!359 (array!74029 array!74031 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 64) (_ BitVec 32) Int) Unit!37268)

(assert (=> b!1137767 (= lt!506072 (lemmaListMapContainsThenArrayContainsFrom!359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111354 () Bool)

(assert (=> b!1137767 (= c!111354 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759122 () Bool)

(declare-fun e!647409 () Bool)

(assert (=> b!1137767 (= res!759122 e!647409)))

(assert (=> b!1137767 (=> (not res!759122) (not e!647403))))

(assert (=> b!1137767 e!647403))

(declare-fun lt!506086 () Unit!37268)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74029 (_ BitVec 32) (_ BitVec 32)) Unit!37268)

(assert (=> b!1137767 (= lt!506086 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137767 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24879)))

(declare-fun lt!506084 () Unit!37268)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74029 (_ BitVec 64) (_ BitVec 32) List!24882) Unit!37268)

(assert (=> b!1137767 (= lt!506084 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24879))))

(assert (=> b!1137767 false))

(declare-fun b!1137768 () Bool)

(declare-fun res!759130 () Bool)

(assert (=> b!1137768 (=> (not res!759130) (not e!647400))))

(assert (=> b!1137768 (= res!759130 (and (= (size!36202 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36201 _keys!1208) (size!36202 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137769 () Bool)

(assert (=> b!1137769 (= c!111358 (and (not lt!506087) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1137769 (= e!647410 e!647415)))

(declare-fun b!1137770 () Bool)

(declare-fun res!759123 () Bool)

(assert (=> b!1137770 (=> (not res!759123) (not e!647400))))

(assert (=> b!1137770 (= res!759123 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36201 _keys!1208))))))

(declare-fun b!1137771 () Bool)

(assert (=> b!1137771 (= e!647409 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!44702 () Bool)

(assert (=> mapIsEmpty!44702 mapRes!44702))

(declare-fun b!1137772 () Bool)

(declare-fun res!759131 () Bool)

(assert (=> b!1137772 (=> (not res!759131) (not e!647400))))

(assert (=> b!1137772 (= res!759131 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24879))))

(declare-fun b!1137773 () Bool)

(declare-fun e!647407 () Bool)

(assert (=> b!1137773 (= e!647407 (= call!50202 call!50208))))

(declare-fun b!1137774 () Bool)

(declare-fun e!647404 () Bool)

(declare-fun e!647401 () Bool)

(assert (=> b!1137774 (= e!647404 e!647401)))

(declare-fun res!759127 () Bool)

(assert (=> b!1137774 (=> res!759127 e!647401)))

(assert (=> b!1137774 (= res!759127 (not (= (select (arr!35665 _keys!1208) from!1455) k!934)))))

(assert (=> b!1137774 e!647407))

(declare-fun c!111353 () Bool)

(assert (=> b!1137774 (= c!111353 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506081 () Unit!37268)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!466 (array!74029 array!74031 (_ BitVec 32) (_ BitVec 32) V!43241 V!43241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37268)

(assert (=> b!1137774 (= lt!506081 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137775 () Bool)

(declare-fun e!647405 () Bool)

(declare-fun e!647414 () Bool)

(assert (=> b!1137775 (= e!647405 (and e!647414 mapRes!44702))))

(declare-fun condMapEmpty!44702 () Bool)

(declare-fun mapDefault!44702 () ValueCell!13583)


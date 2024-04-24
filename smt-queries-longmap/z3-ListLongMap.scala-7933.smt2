; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98674 () Bool)

(assert start!98674)

(declare-fun b_free!24043 () Bool)

(declare-fun b_next!24043 () Bool)

(assert (=> start!98674 (= b_free!24043 (not b_next!24043))))

(declare-fun tp!84840 () Bool)

(declare-fun b_and!38937 () Bool)

(assert (=> start!98674 (= tp!84840 b_and!38937)))

(declare-fun b!1138511 () Bool)

(declare-fun res!759375 () Bool)

(declare-fun e!647949 () Bool)

(assert (=> b!1138511 (=> (not res!759375) (not e!647949))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74047 0))(
  ( (array!74048 (arr!35668 (Array (_ BitVec 32) (_ BitVec 64))) (size!36205 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74047)

(assert (=> b!1138511 (= res!759375 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36205 _keys!1208))))))

(declare-fun b!1138512 () Bool)

(declare-datatypes ((V!43225 0))(
  ( (V!43226 (val!14343 Int)) )
))
(declare-datatypes ((tuple2!18124 0))(
  ( (tuple2!18125 (_1!9073 (_ BitVec 64)) (_2!9073 V!43225)) )
))
(declare-datatypes ((List!24889 0))(
  ( (Nil!24886) (Cons!24885 (h!26103 tuple2!18124) (t!35916 List!24889)) )
))
(declare-datatypes ((ListLongMap!16101 0))(
  ( (ListLongMap!16102 (toList!8066 List!24889)) )
))
(declare-fun lt!506246 () ListLongMap!16101)

(declare-fun minValue!944 () V!43225)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6617 (ListLongMap!16101 (_ BitVec 64)) Bool)

(declare-fun +!3519 (ListLongMap!16101 tuple2!18124) ListLongMap!16101)

(assert (=> b!1138512 (contains!6617 (+!3519 lt!506246 (tuple2!18125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!37221 0))(
  ( (Unit!37222) )
))
(declare-fun lt!506241 () Unit!37221)

(declare-fun addStillContains!746 (ListLongMap!16101 (_ BitVec 64) V!43225 (_ BitVec 64)) Unit!37221)

(assert (=> b!1138512 (= lt!506241 (addStillContains!746 lt!506246 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50130 () Bool)

(assert (=> b!1138512 call!50130))

(declare-fun call!50124 () ListLongMap!16101)

(assert (=> b!1138512 (= lt!506246 call!50124)))

(declare-fun lt!506234 () Unit!37221)

(declare-fun call!50126 () Unit!37221)

(assert (=> b!1138512 (= lt!506234 call!50126)))

(declare-fun e!647959 () Unit!37221)

(assert (=> b!1138512 (= e!647959 lt!506241)))

(declare-fun b!1138513 () Bool)

(declare-fun res!759384 () Bool)

(assert (=> b!1138513 (=> (not res!759384) (not e!647949))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138513 (= res!759384 (validMask!0 mask!1564))))

(declare-fun b!1138514 () Bool)

(declare-fun e!647950 () Bool)

(declare-fun e!647954 () Bool)

(declare-fun mapRes!44684 () Bool)

(assert (=> b!1138514 (= e!647950 (and e!647954 mapRes!44684))))

(declare-fun condMapEmpty!44684 () Bool)

(declare-datatypes ((ValueCell!13577 0))(
  ( (ValueCellFull!13577 (v!16976 V!43225)) (EmptyCell!13577) )
))
(declare-datatypes ((array!74049 0))(
  ( (array!74050 (arr!35669 (Array (_ BitVec 32) ValueCell!13577)) (size!36206 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74049)

(declare-fun mapDefault!44684 () ValueCell!13577)

(assert (=> b!1138514 (= condMapEmpty!44684 (= (arr!35669 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13577)) mapDefault!44684)))))

(declare-fun zeroValue!944 () V!43225)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!50120 () Bool)

(declare-fun lt!506237 () array!74047)

(declare-fun call!50128 () ListLongMap!16101)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!506231 () array!74049)

(declare-fun getCurrentListMapNoExtraKeys!4576 (array!74047 array!74049 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 32) Int) ListLongMap!16101)

(assert (=> bm!50120 (= call!50128 (getCurrentListMapNoExtraKeys!4576 lt!506237 lt!506231 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138515 () Bool)

(declare-fun e!647951 () Bool)

(assert (=> b!1138515 (= e!647949 e!647951)))

(declare-fun res!759383 () Bool)

(assert (=> b!1138515 (=> (not res!759383) (not e!647951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74047 (_ BitVec 32)) Bool)

(assert (=> b!1138515 (= res!759383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506237 mask!1564))))

(assert (=> b!1138515 (= lt!506237 (array!74048 (store (arr!35668 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36205 _keys!1208)))))

(declare-fun e!647945 () Bool)

(declare-fun b!1138516 () Bool)

(declare-fun arrayContainsKey!0 (array!74047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138516 (= e!647945 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138517 () Bool)

(declare-fun e!647955 () Bool)

(declare-fun tp_is_empty!28573 () Bool)

(assert (=> b!1138517 (= e!647955 tp_is_empty!28573)))

(declare-fun b!1138518 () Bool)

(declare-fun e!647947 () Bool)

(declare-fun e!647946 () Bool)

(assert (=> b!1138518 (= e!647947 e!647946)))

(declare-fun res!759381 () Bool)

(assert (=> b!1138518 (=> res!759381 e!647946)))

(assert (=> b!1138518 (= res!759381 (not (= from!1455 i!673)))))

(declare-fun lt!506233 () ListLongMap!16101)

(assert (=> b!1138518 (= lt!506233 (getCurrentListMapNoExtraKeys!4576 lt!506237 lt!506231 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2624 (Int (_ BitVec 64)) V!43225)

(assert (=> b!1138518 (= lt!506231 (array!74050 (store (arr!35669 _values!996) i!673 (ValueCellFull!13577 (dynLambda!2624 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36206 _values!996)))))

(declare-fun lt!506236 () ListLongMap!16101)

(assert (=> b!1138518 (= lt!506236 (getCurrentListMapNoExtraKeys!4576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138519 () Bool)

(declare-fun e!647958 () Bool)

(assert (=> b!1138519 (= e!647946 e!647958)))

(declare-fun res!759377 () Bool)

(assert (=> b!1138519 (=> res!759377 e!647958)))

(assert (=> b!1138519 (= res!759377 (not (= (select (arr!35668 _keys!1208) from!1455) k0!934)))))

(declare-fun e!647952 () Bool)

(assert (=> b!1138519 e!647952))

(declare-fun c!111646 () Bool)

(assert (=> b!1138519 (= c!111646 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506240 () Unit!37221)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!465 (array!74047 array!74049 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37221)

(assert (=> b!1138519 (= lt!506240 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138520 () Bool)

(declare-fun res!759374 () Bool)

(assert (=> b!1138520 (=> (not res!759374) (not e!647949))))

(assert (=> b!1138520 (= res!759374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!44684 () Bool)

(declare-fun tp!84839 () Bool)

(assert (=> mapNonEmpty!44684 (= mapRes!44684 (and tp!84839 e!647955))))

(declare-fun mapKey!44684 () (_ BitVec 32))

(declare-fun mapRest!44684 () (Array (_ BitVec 32) ValueCell!13577))

(declare-fun mapValue!44684 () ValueCell!13577)

(assert (=> mapNonEmpty!44684 (= (arr!35669 _values!996) (store mapRest!44684 mapKey!44684 mapValue!44684))))

(declare-fun b!1138521 () Bool)

(declare-fun e!647953 () Unit!37221)

(declare-fun Unit!37223 () Unit!37221)

(assert (=> b!1138521 (= e!647953 Unit!37223)))

(declare-fun lt!506238 () Bool)

(assert (=> b!1138521 (= lt!506238 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111644 () Bool)

(assert (=> b!1138521 (= c!111644 (and (not lt!506238) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506239 () Unit!37221)

(assert (=> b!1138521 (= lt!506239 e!647959)))

(declare-fun lt!506242 () Unit!37221)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!354 (array!74047 array!74049 (_ BitVec 32) (_ BitVec 32) V!43225 V!43225 (_ BitVec 64) (_ BitVec 32) Int) Unit!37221)

(assert (=> b!1138521 (= lt!506242 (lemmaListMapContainsThenArrayContainsFrom!354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111648 () Bool)

(assert (=> b!1138521 (= c!111648 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759382 () Bool)

(assert (=> b!1138521 (= res!759382 e!647945)))

(declare-fun e!647948 () Bool)

(assert (=> b!1138521 (=> (not res!759382) (not e!647948))))

(assert (=> b!1138521 e!647948))

(declare-fun lt!506247 () Unit!37221)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74047 (_ BitVec 32) (_ BitVec 32)) Unit!37221)

(assert (=> b!1138521 (= lt!506247 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24890 0))(
  ( (Nil!24887) (Cons!24886 (h!26104 (_ BitVec 64)) (t!35917 List!24890)) )
))
(declare-fun arrayNoDuplicates!0 (array!74047 (_ BitVec 32) List!24890) Bool)

(assert (=> b!1138521 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24887)))

(declare-fun lt!506243 () Unit!37221)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74047 (_ BitVec 64) (_ BitVec 32) List!24890) Unit!37221)

(assert (=> b!1138521 (= lt!506243 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24887))))

(assert (=> b!1138521 false))

(declare-fun b!1138522 () Bool)

(assert (=> b!1138522 (= e!647958 true)))

(declare-fun lt!506244 () Unit!37221)

(assert (=> b!1138522 (= lt!506244 e!647953)))

(declare-fun c!111645 () Bool)

(declare-fun lt!506235 () ListLongMap!16101)

(assert (=> b!1138522 (= c!111645 (contains!6617 lt!506235 k0!934))))

(assert (=> b!1138522 (= lt!506235 (getCurrentListMapNoExtraKeys!4576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138523 () Bool)

(declare-fun res!759385 () Bool)

(assert (=> b!1138523 (=> (not res!759385) (not e!647949))))

(assert (=> b!1138523 (= res!759385 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24887))))

(declare-fun b!1138524 () Bool)

(declare-fun call!50129 () Bool)

(assert (=> b!1138524 call!50129))

(declare-fun lt!506245 () Unit!37221)

(declare-fun call!50127 () Unit!37221)

(assert (=> b!1138524 (= lt!506245 call!50127)))

(declare-fun e!647944 () Unit!37221)

(assert (=> b!1138524 (= e!647944 lt!506245)))

(declare-fun bm!50122 () Bool)

(assert (=> bm!50122 (= call!50129 call!50130)))

(declare-fun b!1138525 () Bool)

(declare-fun res!759376 () Bool)

(assert (=> b!1138525 (=> (not res!759376) (not e!647949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138525 (= res!759376 (validKeyInArray!0 k0!934))))

(declare-fun b!1138526 () Bool)

(declare-fun call!50125 () ListLongMap!16101)

(assert (=> b!1138526 (= e!647952 (= call!50128 call!50125))))

(declare-fun b!1138527 () Bool)

(declare-fun e!647956 () Unit!37221)

(assert (=> b!1138527 (= e!647956 e!647944)))

(declare-fun c!111643 () Bool)

(assert (=> b!1138527 (= c!111643 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506238))))

(declare-fun b!1138528 () Bool)

(declare-fun res!759380 () Bool)

(assert (=> b!1138528 (=> (not res!759380) (not e!647949))))

(assert (=> b!1138528 (= res!759380 (and (= (size!36206 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36205 _keys!1208) (size!36206 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138529 () Bool)

(declare-fun Unit!37224 () Unit!37221)

(assert (=> b!1138529 (= e!647944 Unit!37224)))

(declare-fun c!111647 () Bool)

(declare-fun bm!50123 () Bool)

(assert (=> bm!50123 (= call!50124 (+!3519 lt!506235 (ite (or c!111644 c!111647) (tuple2!18125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1138530 () Bool)

(assert (=> b!1138530 (= e!647954 tp_is_empty!28573)))

(declare-fun b!1138531 () Bool)

(assert (=> b!1138531 (= e!647948 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50124 () Bool)

(assert (=> bm!50124 (= call!50127 call!50126)))

(declare-fun bm!50125 () Bool)

(declare-fun call!50123 () ListLongMap!16101)

(assert (=> bm!50125 (= call!50123 call!50124)))

(declare-fun b!1138532 () Bool)

(declare-fun Unit!37225 () Unit!37221)

(assert (=> b!1138532 (= e!647953 Unit!37225)))

(declare-fun b!1138533 () Bool)

(assert (=> b!1138533 (= e!647945 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506238) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138534 () Bool)

(assert (=> b!1138534 (= e!647951 (not e!647947))))

(declare-fun res!759386 () Bool)

(assert (=> b!1138534 (=> res!759386 e!647947)))

(assert (=> b!1138534 (= res!759386 (bvsgt from!1455 i!673))))

(assert (=> b!1138534 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506248 () Unit!37221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74047 (_ BitVec 64) (_ BitVec 32)) Unit!37221)

(assert (=> b!1138534 (= lt!506248 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50126 () Bool)

(assert (=> bm!50126 (= call!50126 (addStillContains!746 lt!506235 (ite (or c!111644 c!111647) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111644 c!111647) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!44684 () Bool)

(assert (=> mapIsEmpty!44684 mapRes!44684))

(declare-fun b!1138535 () Bool)

(declare-fun -!1207 (ListLongMap!16101 (_ BitVec 64)) ListLongMap!16101)

(assert (=> b!1138535 (= e!647952 (= call!50128 (-!1207 call!50125 k0!934)))))

(declare-fun b!1138536 () Bool)

(declare-fun res!759378 () Bool)

(assert (=> b!1138536 (=> (not res!759378) (not e!647951))))

(assert (=> b!1138536 (= res!759378 (arrayNoDuplicates!0 lt!506237 #b00000000000000000000000000000000 Nil!24887))))

(declare-fun b!1138537 () Bool)

(assert (=> b!1138537 (= c!111647 (and (not lt!506238) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138537 (= e!647959 e!647956)))

(declare-fun bm!50127 () Bool)

(assert (=> bm!50127 (= call!50130 (contains!6617 (ite c!111644 lt!506246 call!50123) k0!934))))

(declare-fun b!1138538 () Bool)

(declare-fun res!759387 () Bool)

(assert (=> b!1138538 (=> (not res!759387) (not e!647949))))

(assert (=> b!1138538 (= res!759387 (= (select (arr!35668 _keys!1208) i!673) k0!934))))

(declare-fun b!1138539 () Bool)

(declare-fun lt!506232 () Unit!37221)

(assert (=> b!1138539 (= e!647956 lt!506232)))

(assert (=> b!1138539 (= lt!506232 call!50127)))

(assert (=> b!1138539 call!50129))

(declare-fun bm!50121 () Bool)

(assert (=> bm!50121 (= call!50125 (getCurrentListMapNoExtraKeys!4576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!759379 () Bool)

(assert (=> start!98674 (=> (not res!759379) (not e!647949))))

(assert (=> start!98674 (= res!759379 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36205 _keys!1208))))))

(assert (=> start!98674 e!647949))

(assert (=> start!98674 tp_is_empty!28573))

(declare-fun array_inv!27394 (array!74047) Bool)

(assert (=> start!98674 (array_inv!27394 _keys!1208)))

(assert (=> start!98674 true))

(assert (=> start!98674 tp!84840))

(declare-fun array_inv!27395 (array!74049) Bool)

(assert (=> start!98674 (and (array_inv!27395 _values!996) e!647950)))

(assert (= (and start!98674 res!759379) b!1138513))

(assert (= (and b!1138513 res!759384) b!1138528))

(assert (= (and b!1138528 res!759380) b!1138520))

(assert (= (and b!1138520 res!759374) b!1138523))

(assert (= (and b!1138523 res!759385) b!1138511))

(assert (= (and b!1138511 res!759375) b!1138525))

(assert (= (and b!1138525 res!759376) b!1138538))

(assert (= (and b!1138538 res!759387) b!1138515))

(assert (= (and b!1138515 res!759383) b!1138536))

(assert (= (and b!1138536 res!759378) b!1138534))

(assert (= (and b!1138534 (not res!759386)) b!1138518))

(assert (= (and b!1138518 (not res!759381)) b!1138519))

(assert (= (and b!1138519 c!111646) b!1138535))

(assert (= (and b!1138519 (not c!111646)) b!1138526))

(assert (= (or b!1138535 b!1138526) bm!50120))

(assert (= (or b!1138535 b!1138526) bm!50121))

(assert (= (and b!1138519 (not res!759377)) b!1138522))

(assert (= (and b!1138522 c!111645) b!1138521))

(assert (= (and b!1138522 (not c!111645)) b!1138532))

(assert (= (and b!1138521 c!111644) b!1138512))

(assert (= (and b!1138521 (not c!111644)) b!1138537))

(assert (= (and b!1138537 c!111647) b!1138539))

(assert (= (and b!1138537 (not c!111647)) b!1138527))

(assert (= (and b!1138527 c!111643) b!1138524))

(assert (= (and b!1138527 (not c!111643)) b!1138529))

(assert (= (or b!1138539 b!1138524) bm!50124))

(assert (= (or b!1138539 b!1138524) bm!50125))

(assert (= (or b!1138539 b!1138524) bm!50122))

(assert (= (or b!1138512 bm!50122) bm!50127))

(assert (= (or b!1138512 bm!50124) bm!50126))

(assert (= (or b!1138512 bm!50125) bm!50123))

(assert (= (and b!1138521 c!111648) b!1138516))

(assert (= (and b!1138521 (not c!111648)) b!1138533))

(assert (= (and b!1138521 res!759382) b!1138531))

(assert (= (and b!1138514 condMapEmpty!44684) mapIsEmpty!44684))

(assert (= (and b!1138514 (not condMapEmpty!44684)) mapNonEmpty!44684))

(get-info :version)

(assert (= (and mapNonEmpty!44684 ((_ is ValueCellFull!13577) mapValue!44684)) b!1138517))

(assert (= (and b!1138514 ((_ is ValueCellFull!13577) mapDefault!44684)) b!1138530))

(assert (= start!98674 b!1138514))

(declare-fun b_lambda!19143 () Bool)

(assert (=> (not b_lambda!19143) (not b!1138518)))

(declare-fun t!35915 () Bool)

(declare-fun tb!8847 () Bool)

(assert (=> (and start!98674 (= defaultEntry!1004 defaultEntry!1004) t!35915) tb!8847))

(declare-fun result!18267 () Bool)

(assert (=> tb!8847 (= result!18267 tp_is_empty!28573)))

(assert (=> b!1138518 t!35915))

(declare-fun b_and!38939 () Bool)

(assert (= b_and!38937 (and (=> t!35915 result!18267) b_and!38939)))

(declare-fun m!1050939 () Bool)

(assert (=> b!1138525 m!1050939))

(declare-fun m!1050941 () Bool)

(assert (=> b!1138521 m!1050941))

(declare-fun m!1050943 () Bool)

(assert (=> b!1138521 m!1050943))

(declare-fun m!1050945 () Bool)

(assert (=> b!1138521 m!1050945))

(declare-fun m!1050947 () Bool)

(assert (=> b!1138521 m!1050947))

(declare-fun m!1050949 () Bool)

(assert (=> b!1138513 m!1050949))

(declare-fun m!1050951 () Bool)

(assert (=> mapNonEmpty!44684 m!1050951))

(declare-fun m!1050953 () Bool)

(assert (=> b!1138520 m!1050953))

(declare-fun m!1050955 () Bool)

(assert (=> b!1138515 m!1050955))

(declare-fun m!1050957 () Bool)

(assert (=> b!1138515 m!1050957))

(declare-fun m!1050959 () Bool)

(assert (=> bm!50120 m!1050959))

(declare-fun m!1050961 () Bool)

(assert (=> b!1138538 m!1050961))

(declare-fun m!1050963 () Bool)

(assert (=> b!1138518 m!1050963))

(declare-fun m!1050965 () Bool)

(assert (=> b!1138518 m!1050965))

(declare-fun m!1050967 () Bool)

(assert (=> b!1138518 m!1050967))

(declare-fun m!1050969 () Bool)

(assert (=> b!1138518 m!1050969))

(declare-fun m!1050971 () Bool)

(assert (=> b!1138519 m!1050971))

(declare-fun m!1050973 () Bool)

(assert (=> b!1138519 m!1050973))

(declare-fun m!1050975 () Bool)

(assert (=> bm!50127 m!1050975))

(declare-fun m!1050977 () Bool)

(assert (=> b!1138512 m!1050977))

(assert (=> b!1138512 m!1050977))

(declare-fun m!1050979 () Bool)

(assert (=> b!1138512 m!1050979))

(declare-fun m!1050981 () Bool)

(assert (=> b!1138512 m!1050981))

(declare-fun m!1050983 () Bool)

(assert (=> b!1138535 m!1050983))

(declare-fun m!1050985 () Bool)

(assert (=> start!98674 m!1050985))

(declare-fun m!1050987 () Bool)

(assert (=> start!98674 m!1050987))

(declare-fun m!1050989 () Bool)

(assert (=> b!1138523 m!1050989))

(declare-fun m!1050991 () Bool)

(assert (=> bm!50123 m!1050991))

(declare-fun m!1050993 () Bool)

(assert (=> b!1138534 m!1050993))

(declare-fun m!1050995 () Bool)

(assert (=> b!1138534 m!1050995))

(declare-fun m!1050997 () Bool)

(assert (=> b!1138531 m!1050997))

(declare-fun m!1050999 () Bool)

(assert (=> b!1138536 m!1050999))

(declare-fun m!1051001 () Bool)

(assert (=> bm!50121 m!1051001))

(assert (=> b!1138516 m!1050997))

(declare-fun m!1051003 () Bool)

(assert (=> b!1138522 m!1051003))

(assert (=> b!1138522 m!1051001))

(declare-fun m!1051005 () Bool)

(assert (=> bm!50126 m!1051005))

(check-sat (not b!1138535) (not mapNonEmpty!44684) (not b!1138525) (not bm!50126) (not b_lambda!19143) (not b!1138522) (not b!1138513) (not b_next!24043) (not b!1138520) (not b!1138523) (not b!1138512) (not b!1138515) (not b!1138519) (not bm!50127) (not start!98674) (not bm!50121) (not b!1138518) (not b!1138516) tp_is_empty!28573 b_and!38939 (not b!1138536) (not b!1138531) (not b!1138521) (not bm!50123) (not b!1138534) (not bm!50120))
(check-sat b_and!38939 (not b_next!24043))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98466 () Bool)

(assert start!98466)

(declare-fun b_free!24071 () Bool)

(declare-fun b_next!24071 () Bool)

(assert (=> start!98466 (= b_free!24071 (not b_next!24071))))

(declare-fun tp!84923 () Bool)

(declare-fun b_and!38991 () Bool)

(assert (=> start!98466 (= tp!84923 b_and!38991)))

(declare-datatypes ((V!43261 0))(
  ( (V!43262 (val!14357 Int)) )
))
(declare-fun zeroValue!944 () V!43261)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18140 0))(
  ( (tuple2!18141 (_1!9081 (_ BitVec 64)) (_2!9081 V!43261)) )
))
(declare-datatypes ((List!24896 0))(
  ( (Nil!24893) (Cons!24892 (h!26101 tuple2!18140) (t!35959 List!24896)) )
))
(declare-datatypes ((ListLongMap!16109 0))(
  ( (ListLongMap!16110 (toList!8070 List!24896)) )
))
(declare-fun call!50401 () ListLongMap!16109)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13591 0))(
  ( (ValueCellFull!13591 (v!16994 V!43261)) (EmptyCell!13591) )
))
(declare-datatypes ((array!74061 0))(
  ( (array!74062 (arr!35681 (Array (_ BitVec 32) ValueCell!13591)) (size!36217 (_ BitVec 32))) )
))
(declare-fun lt!506505 () array!74061)

(declare-datatypes ((array!74063 0))(
  ( (array!74064 (arr!35682 (Array (_ BitVec 32) (_ BitVec 64))) (size!36218 (_ BitVec 32))) )
))
(declare-fun lt!506504 () array!74063)

(declare-fun minValue!944 () V!43261)

(declare-fun bm!50391 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4554 (array!74063 array!74061 (_ BitVec 32) (_ BitVec 32) V!43261 V!43261 (_ BitVec 32) Int) ListLongMap!16109)

(assert (=> bm!50391 (= call!50401 (getCurrentListMapNoExtraKeys!4554 lt!506504 lt!506505 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138468 () Bool)

(declare-datatypes ((Unit!37299 0))(
  ( (Unit!37300) )
))
(declare-fun e!647788 () Unit!37299)

(declare-fun lt!506508 () Unit!37299)

(assert (=> b!1138468 (= e!647788 lt!506508)))

(declare-fun call!50397 () Unit!37299)

(assert (=> b!1138468 (= lt!506508 call!50397)))

(declare-fun call!50394 () Bool)

(assert (=> b!1138468 call!50394))

(declare-fun b!1138469 () Bool)

(declare-fun call!50399 () ListLongMap!16109)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6606 (ListLongMap!16109 (_ BitVec 64)) Bool)

(assert (=> b!1138469 (contains!6606 call!50399 k!934)))

(declare-fun lt!506515 () Unit!37299)

(declare-fun call!50396 () Unit!37299)

(assert (=> b!1138469 (= lt!506515 call!50396)))

(declare-fun call!50395 () Bool)

(assert (=> b!1138469 call!50395))

(declare-fun lt!506510 () ListLongMap!16109)

(declare-fun lt!506511 () ListLongMap!16109)

(declare-fun +!3503 (ListLongMap!16109 tuple2!18140) ListLongMap!16109)

(assert (=> b!1138469 (= lt!506510 (+!3503 lt!506511 (tuple2!18141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506520 () Unit!37299)

(declare-fun addStillContains!763 (ListLongMap!16109 (_ BitVec 64) V!43261 (_ BitVec 64)) Unit!37299)

(assert (=> b!1138469 (= lt!506520 (addStillContains!763 lt!506511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!647799 () Unit!37299)

(assert (=> b!1138469 (= e!647799 lt!506515)))

(declare-fun b!1138470 () Bool)

(declare-fun res!759458 () Bool)

(declare-fun e!647784 () Bool)

(assert (=> b!1138470 (=> (not res!759458) (not e!647784))))

(declare-datatypes ((List!24897 0))(
  ( (Nil!24894) (Cons!24893 (h!26102 (_ BitVec 64)) (t!35960 List!24897)) )
))
(declare-fun arrayNoDuplicates!0 (array!74063 (_ BitVec 32) List!24897) Bool)

(assert (=> b!1138470 (= res!759458 (arrayNoDuplicates!0 lt!506504 #b00000000000000000000000000000000 Nil!24894))))

(declare-fun b!1138471 () Bool)

(declare-fun e!647787 () Unit!37299)

(declare-fun Unit!37301 () Unit!37299)

(assert (=> b!1138471 (= e!647787 Unit!37301)))

(declare-fun bm!50392 () Bool)

(declare-fun call!50400 () ListLongMap!16109)

(assert (=> bm!50392 (= call!50400 call!50399)))

(declare-fun b!1138473 () Bool)

(declare-fun res!759466 () Bool)

(declare-fun e!647796 () Bool)

(assert (=> b!1138473 (=> (not res!759466) (not e!647796))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!74063)

(assert (=> b!1138473 (= res!759466 (= (select (arr!35682 _keys!1208) i!673) k!934))))

(declare-fun b!1138474 () Bool)

(declare-fun lt!506514 () Bool)

(declare-fun e!647791 () Bool)

(assert (=> b!1138474 (= e!647791 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506514) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138475 () Bool)

(declare-fun e!647792 () Bool)

(declare-fun e!647798 () Bool)

(assert (=> b!1138475 (= e!647792 e!647798)))

(declare-fun res!759461 () Bool)

(assert (=> b!1138475 (=> res!759461 e!647798)))

(assert (=> b!1138475 (= res!759461 (not (= (select (arr!35682 _keys!1208) from!1455) k!934)))))

(declare-fun e!647794 () Bool)

(assert (=> b!1138475 e!647794))

(declare-fun c!111500 () Bool)

(assert (=> b!1138475 (= c!111500 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun _values!996 () array!74061)

(declare-fun lt!506517 () Unit!37299)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!471 (array!74063 array!74061 (_ BitVec 32) (_ BitVec 32) V!43261 V!43261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37299)

(assert (=> b!1138475 (= lt!506517 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44726 () Bool)

(declare-fun mapRes!44726 () Bool)

(assert (=> mapIsEmpty!44726 mapRes!44726))

(declare-fun b!1138476 () Bool)

(declare-fun c!111498 () Bool)

(assert (=> b!1138476 (= c!111498 (and (not lt!506514) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138476 (= e!647799 e!647788)))

(declare-fun b!1138477 () Bool)

(declare-fun e!647795 () Bool)

(assert (=> b!1138477 (= e!647795 e!647792)))

(declare-fun res!759455 () Bool)

(assert (=> b!1138477 (=> res!759455 e!647792)))

(assert (=> b!1138477 (= res!759455 (not (= from!1455 i!673)))))

(declare-fun lt!506513 () ListLongMap!16109)

(assert (=> b!1138477 (= lt!506513 (getCurrentListMapNoExtraKeys!4554 lt!506504 lt!506505 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2605 (Int (_ BitVec 64)) V!43261)

(assert (=> b!1138477 (= lt!506505 (array!74062 (store (arr!35681 _values!996) i!673 (ValueCellFull!13591 (dynLambda!2605 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36217 _values!996)))))

(declare-fun lt!506519 () ListLongMap!16109)

(assert (=> b!1138477 (= lt!506519 (getCurrentListMapNoExtraKeys!4554 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138478 () Bool)

(declare-fun res!759454 () Bool)

(assert (=> b!1138478 (=> (not res!759454) (not e!647796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138478 (= res!759454 (validKeyInArray!0 k!934))))

(declare-fun bm!50393 () Bool)

(declare-fun call!50398 () ListLongMap!16109)

(assert (=> bm!50393 (= call!50398 (getCurrentListMapNoExtraKeys!4554 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138479 () Bool)

(declare-fun res!759467 () Bool)

(assert (=> b!1138479 (=> (not res!759467) (not e!647796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138479 (= res!759467 (validMask!0 mask!1564))))

(declare-fun b!1138480 () Bool)

(declare-fun res!759456 () Bool)

(assert (=> b!1138480 (=> (not res!759456) (not e!647796))))

(assert (=> b!1138480 (= res!759456 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24894))))

(declare-fun b!1138481 () Bool)

(declare-fun e!647790 () Bool)

(declare-fun tp_is_empty!28601 () Bool)

(assert (=> b!1138481 (= e!647790 tp_is_empty!28601)))

(declare-fun b!1138482 () Bool)

(assert (=> b!1138482 (= e!647798 true)))

(declare-fun lt!506507 () Unit!37299)

(declare-fun e!647797 () Unit!37299)

(assert (=> b!1138482 (= lt!506507 e!647797)))

(declare-fun c!111499 () Bool)

(assert (=> b!1138482 (= c!111499 (contains!6606 lt!506511 k!934))))

(assert (=> b!1138482 (= lt!506511 (getCurrentListMapNoExtraKeys!4554 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50394 () Bool)

(assert (=> bm!50394 (= call!50397 call!50396)))

(declare-fun b!1138483 () Bool)

(assert (=> b!1138483 call!50394))

(declare-fun lt!506512 () Unit!37299)

(assert (=> b!1138483 (= lt!506512 call!50397)))

(assert (=> b!1138483 (= e!647787 lt!506512)))

(declare-fun b!1138484 () Bool)

(declare-fun e!647786 () Bool)

(assert (=> b!1138484 (= e!647786 (and e!647790 mapRes!44726))))

(declare-fun condMapEmpty!44726 () Bool)

(declare-fun mapDefault!44726 () ValueCell!13591)


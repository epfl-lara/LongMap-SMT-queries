; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98654 () Bool)

(assert start!98654)

(declare-fun b_free!24259 () Bool)

(declare-fun b_next!24259 () Bool)

(assert (=> start!98654 (= b_free!24259 (not b_next!24259))))

(declare-fun tp!85488 () Bool)

(declare-fun b_and!39367 () Bool)

(assert (=> start!98654 (= tp!85488 b_and!39367)))

(declare-fun mapNonEmpty!45008 () Bool)

(declare-fun mapRes!45008 () Bool)

(declare-fun tp!85487 () Bool)

(declare-fun e!652400 () Bool)

(assert (=> mapNonEmpty!45008 (= mapRes!45008 (and tp!85487 e!652400))))

(declare-fun mapKey!45008 () (_ BitVec 32))

(declare-datatypes ((V!43513 0))(
  ( (V!43514 (val!14451 Int)) )
))
(declare-datatypes ((ValueCell!13685 0))(
  ( (ValueCellFull!13685 (v!17088 V!43513)) (EmptyCell!13685) )
))
(declare-fun mapValue!45008 () ValueCell!13685)

(declare-fun mapRest!45008 () (Array (_ BitVec 32) ValueCell!13685))

(declare-datatypes ((array!74425 0))(
  ( (array!74426 (arr!35863 (Array (_ BitVec 32) ValueCell!13685)) (size!36399 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74425)

(assert (=> mapNonEmpty!45008 (= (arr!35863 _values!996) (store mapRest!45008 mapKey!45008 mapValue!45008))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!512357 () array!74425)

(declare-datatypes ((array!74427 0))(
  ( (array!74428 (arr!35864 (Array (_ BitVec 32) (_ BitVec 64))) (size!36400 (_ BitVec 32))) )
))
(declare-fun lt!512362 () array!74427)

(declare-fun zeroValue!944 () V!43513)

(declare-fun bm!52647 () Bool)

(declare-datatypes ((tuple2!18314 0))(
  ( (tuple2!18315 (_1!9168 (_ BitVec 64)) (_2!9168 V!43513)) )
))
(declare-datatypes ((List!25065 0))(
  ( (Nil!25062) (Cons!25061 (h!26270 tuple2!18314) (t!36316 List!25065)) )
))
(declare-datatypes ((ListLongMap!16283 0))(
  ( (ListLongMap!16284 (toList!8157 List!25065)) )
))
(declare-fun call!52652 () ListLongMap!16283)

(declare-fun minValue!944 () V!43513)

(declare-fun getCurrentListMapNoExtraKeys!4631 (array!74427 array!74425 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 32) Int) ListLongMap!16283)

(assert (=> bm!52647 (= call!52652 (getCurrentListMapNoExtraKeys!4631 lt!512362 lt!512357 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45008 () Bool)

(assert (=> mapIsEmpty!45008 mapRes!45008))

(declare-fun b!1146926 () Bool)

(declare-fun e!652401 () Bool)

(declare-fun call!52654 () ListLongMap!16283)

(assert (=> b!1146926 (= e!652401 (= call!52652 call!52654))))

(declare-fun lt!512351 () ListLongMap!16283)

(declare-fun call!52653 () ListLongMap!16283)

(declare-fun c!113194 () Bool)

(declare-fun call!52650 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!52648 () Bool)

(declare-fun contains!6681 (ListLongMap!16283 (_ BitVec 64)) Bool)

(assert (=> bm!52648 (= call!52650 (contains!6681 (ite c!113194 lt!512351 call!52653) k!934))))

(declare-fun b!1146928 () Bool)

(declare-fun -!1294 (ListLongMap!16283 (_ BitVec 64)) ListLongMap!16283)

(assert (=> b!1146928 (= e!652401 (= call!52652 (-!1294 call!52654 k!934)))))

(declare-fun _keys!1208 () array!74427)

(declare-fun b!1146929 () Bool)

(declare-fun e!652395 () Bool)

(declare-fun arrayContainsKey!0 (array!74427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146929 (= e!652395 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146930 () Bool)

(declare-fun e!652389 () Bool)

(declare-fun e!652394 () Bool)

(assert (=> b!1146930 (= e!652389 e!652394)))

(declare-fun res!763504 () Bool)

(assert (=> b!1146930 (=> (not res!763504) (not e!652394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74427 (_ BitVec 32)) Bool)

(assert (=> b!1146930 (= res!763504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512362 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146930 (= lt!512362 (array!74428 (store (arr!35864 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36400 _keys!1208)))))

(declare-fun b!1146931 () Bool)

(declare-datatypes ((Unit!37665 0))(
  ( (Unit!37666) )
))
(declare-fun e!652397 () Unit!37665)

(declare-fun Unit!37667 () Unit!37665)

(assert (=> b!1146931 (= e!652397 Unit!37667)))

(declare-fun b!1146932 () Bool)

(declare-fun e!652399 () Unit!37665)

(declare-fun Unit!37668 () Unit!37665)

(assert (=> b!1146932 (= e!652399 Unit!37668)))

(declare-fun b!1146933 () Bool)

(declare-fun e!652403 () Bool)

(assert (=> b!1146933 (= e!652403 true)))

(declare-fun e!652404 () Bool)

(assert (=> b!1146933 e!652404))

(declare-fun res!763502 () Bool)

(assert (=> b!1146933 (=> (not res!763502) (not e!652404))))

(declare-fun lt!512350 () ListLongMap!16283)

(declare-fun lt!512361 () V!43513)

(declare-fun +!3581 (ListLongMap!16283 tuple2!18314) ListLongMap!16283)

(assert (=> b!1146933 (= res!763502 (= (-!1294 (+!3581 lt!512350 (tuple2!18315 (select (arr!35864 _keys!1208) from!1455) lt!512361)) (select (arr!35864 _keys!1208) from!1455)) lt!512350))))

(declare-fun lt!512359 () Unit!37665)

(declare-fun addThenRemoveForNewKeyIsSame!142 (ListLongMap!16283 (_ BitVec 64) V!43513) Unit!37665)

(assert (=> b!1146933 (= lt!512359 (addThenRemoveForNewKeyIsSame!142 lt!512350 (select (arr!35864 _keys!1208) from!1455) lt!512361))))

(declare-fun lt!512352 () V!43513)

(declare-fun get!18242 (ValueCell!13685 V!43513) V!43513)

(assert (=> b!1146933 (= lt!512361 (get!18242 (select (arr!35863 _values!996) from!1455) lt!512352))))

(declare-fun lt!512355 () Unit!37665)

(assert (=> b!1146933 (= lt!512355 e!652399)))

(declare-fun c!113190 () Bool)

(assert (=> b!1146933 (= c!113190 (contains!6681 lt!512350 k!934))))

(assert (=> b!1146933 (= lt!512350 (getCurrentListMapNoExtraKeys!4631 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146934 () Bool)

(declare-fun e!652396 () Bool)

(assert (=> b!1146934 (= e!652396 e!652403)))

(declare-fun res!763501 () Bool)

(assert (=> b!1146934 (=> res!763501 e!652403)))

(assert (=> b!1146934 (= res!763501 (not (= (select (arr!35864 _keys!1208) from!1455) k!934)))))

(assert (=> b!1146934 e!652401))

(declare-fun c!113191 () Bool)

(assert (=> b!1146934 (= c!113191 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512360 () Unit!37665)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!532 (array!74427 array!74425 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37665)

(assert (=> b!1146934 (= lt!512360 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146935 () Bool)

(declare-fun e!652402 () Bool)

(declare-fun tp_is_empty!28789 () Bool)

(assert (=> b!1146935 (= e!652402 tp_is_empty!28789)))

(declare-fun bm!52649 () Bool)

(assert (=> bm!52649 (= call!52654 (getCurrentListMapNoExtraKeys!4631 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146936 () Bool)

(declare-fun Unit!37669 () Unit!37665)

(assert (=> b!1146936 (= e!652399 Unit!37669)))

(declare-fun lt!512363 () Bool)

(assert (=> b!1146936 (= lt!512363 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146936 (= c!113194 (and (not lt!512363) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512367 () Unit!37665)

(declare-fun e!652393 () Unit!37665)

(assert (=> b!1146936 (= lt!512367 e!652393)))

(declare-fun lt!512365 () Unit!37665)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!426 (array!74427 array!74425 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 64) (_ BitVec 32) Int) Unit!37665)

(assert (=> b!1146936 (= lt!512365 (lemmaListMapContainsThenArrayContainsFrom!426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113189 () Bool)

(assert (=> b!1146936 (= c!113189 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763505 () Bool)

(declare-fun e!652390 () Bool)

(assert (=> b!1146936 (= res!763505 e!652390)))

(assert (=> b!1146936 (=> (not res!763505) (not e!652395))))

(assert (=> b!1146936 e!652395))

(declare-fun lt!512370 () Unit!37665)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74427 (_ BitVec 32) (_ BitVec 32)) Unit!37665)

(assert (=> b!1146936 (= lt!512370 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25066 0))(
  ( (Nil!25063) (Cons!25062 (h!26271 (_ BitVec 64)) (t!36317 List!25066)) )
))
(declare-fun arrayNoDuplicates!0 (array!74427 (_ BitVec 32) List!25066) Bool)

(assert (=> b!1146936 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25063)))

(declare-fun lt!512366 () Unit!37665)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74427 (_ BitVec 64) (_ BitVec 32) List!25066) Unit!37665)

(assert (=> b!1146936 (= lt!512366 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25063))))

(assert (=> b!1146936 false))

(declare-fun b!1146937 () Bool)

(assert (=> b!1146937 (= e!652400 tp_is_empty!28789)))

(declare-fun b!1146938 () Bool)

(declare-fun res!763494 () Bool)

(assert (=> b!1146938 (=> (not res!763494) (not e!652389))))

(assert (=> b!1146938 (= res!763494 (and (= (size!36399 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36400 _keys!1208) (size!36399 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146939 () Bool)

(declare-fun call!52655 () Bool)

(assert (=> b!1146939 call!52655))

(declare-fun lt!512364 () Unit!37665)

(declare-fun call!52657 () Unit!37665)

(assert (=> b!1146939 (= lt!512364 call!52657)))

(assert (=> b!1146939 (= e!652397 lt!512364)))

(declare-fun b!1146940 () Bool)

(declare-fun e!652392 () Unit!37665)

(declare-fun lt!512353 () Unit!37665)

(assert (=> b!1146940 (= e!652392 lt!512353)))

(assert (=> b!1146940 (= lt!512353 call!52657)))

(assert (=> b!1146940 call!52655))

(declare-fun call!52656 () Unit!37665)

(declare-fun bm!52650 () Bool)

(declare-fun c!113192 () Bool)

(declare-fun addStillContains!833 (ListLongMap!16283 (_ BitVec 64) V!43513 (_ BitVec 64)) Unit!37665)

(assert (=> bm!52650 (= call!52656 (addStillContains!833 lt!512350 (ite (or c!113194 c!113192) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113194 c!113192) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1146941 () Bool)

(declare-fun res!763506 () Bool)

(assert (=> b!1146941 (=> (not res!763506) (not e!652389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146941 (= res!763506 (validMask!0 mask!1564))))

(declare-fun bm!52651 () Bool)

(assert (=> bm!52651 (= call!52657 call!52656)))

(declare-fun b!1146942 () Bool)

(assert (=> b!1146942 (= e!652390 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512363) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52652 () Bool)

(assert (=> bm!52652 (= call!52655 call!52650)))

(declare-fun b!1146943 () Bool)

(declare-fun res!763503 () Bool)

(assert (=> b!1146943 (=> (not res!763503) (not e!652394))))

(assert (=> b!1146943 (= res!763503 (arrayNoDuplicates!0 lt!512362 #b00000000000000000000000000000000 Nil!25063))))

(declare-fun lt!512368 () ListLongMap!16283)

(declare-fun b!1146944 () Bool)

(assert (=> b!1146944 (= e!652404 (= (-!1294 lt!512368 k!934) lt!512350))))

(declare-fun b!1146945 () Bool)

(declare-fun e!652388 () Bool)

(assert (=> b!1146945 (= e!652394 (not e!652388))))

(declare-fun res!763497 () Bool)

(assert (=> b!1146945 (=> res!763497 e!652388)))

(assert (=> b!1146945 (= res!763497 (bvsgt from!1455 i!673))))

(assert (=> b!1146945 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!512358 () Unit!37665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74427 (_ BitVec 64) (_ BitVec 32)) Unit!37665)

(assert (=> b!1146945 (= lt!512358 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1146946 () Bool)

(declare-fun res!763496 () Bool)

(assert (=> b!1146946 (=> (not res!763496) (not e!652389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146946 (= res!763496 (validKeyInArray!0 k!934))))

(declare-fun b!1146947 () Bool)

(assert (=> b!1146947 (contains!6681 (+!3581 lt!512351 (tuple2!18315 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!512356 () Unit!37665)

(assert (=> b!1146947 (= lt!512356 (addStillContains!833 lt!512351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1146947 call!52650))

(declare-fun call!52651 () ListLongMap!16283)

(assert (=> b!1146947 (= lt!512351 call!52651)))

(declare-fun lt!512369 () Unit!37665)

(assert (=> b!1146947 (= lt!512369 call!52656)))

(assert (=> b!1146947 (= e!652393 lt!512356)))

(declare-fun b!1146927 () Bool)

(declare-fun e!652391 () Bool)

(assert (=> b!1146927 (= e!652391 (and e!652402 mapRes!45008))))

(declare-fun condMapEmpty!45008 () Bool)

(declare-fun mapDefault!45008 () ValueCell!13685)


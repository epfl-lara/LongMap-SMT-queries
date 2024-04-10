; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98464 () Bool)

(assert start!98464)

(declare-fun b_free!24069 () Bool)

(declare-fun b_next!24069 () Bool)

(assert (=> start!98464 (= b_free!24069 (not b_next!24069))))

(declare-fun tp!84917 () Bool)

(declare-fun b_and!38987 () Bool)

(assert (=> start!98464 (= tp!84917 b_and!38987)))

(declare-fun bm!50367 () Bool)

(declare-datatypes ((Unit!37294 0))(
  ( (Unit!37295) )
))
(declare-fun call!50377 () Unit!37294)

(declare-fun call!50376 () Unit!37294)

(assert (=> bm!50367 (= call!50377 call!50376)))

(declare-fun b!1138379 () Bool)

(declare-fun res!759419 () Bool)

(declare-fun e!647744 () Bool)

(assert (=> b!1138379 (=> (not res!759419) (not e!647744))))

(declare-datatypes ((array!74057 0))(
  ( (array!74058 (arr!35679 (Array (_ BitVec 32) (_ BitVec 64))) (size!36215 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74057)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74057 (_ BitVec 32)) Bool)

(assert (=> b!1138379 (= res!759419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1138380 () Bool)

(declare-fun e!647738 () Bool)

(declare-fun tp_is_empty!28599 () Bool)

(assert (=> b!1138380 (= e!647738 tp_is_empty!28599)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!43259 0))(
  ( (V!43260 (val!14356 Int)) )
))
(declare-datatypes ((tuple2!18138 0))(
  ( (tuple2!18139 (_1!9080 (_ BitVec 64)) (_2!9080 V!43259)) )
))
(declare-datatypes ((List!24894 0))(
  ( (Nil!24891) (Cons!24890 (h!26099 tuple2!18138) (t!35955 List!24894)) )
))
(declare-datatypes ((ListLongMap!16107 0))(
  ( (ListLongMap!16108 (toList!8069 List!24894)) )
))
(declare-fun lt!506457 () ListLongMap!16107)

(declare-fun minValue!944 () V!43259)

(declare-fun lt!506454 () ListLongMap!16107)

(declare-fun zeroValue!944 () V!43259)

(declare-fun c!111479 () Bool)

(declare-fun c!111484 () Bool)

(declare-fun bm!50368 () Bool)

(declare-fun addStillContains!762 (ListLongMap!16107 (_ BitVec 64) V!43259 (_ BitVec 64)) Unit!37294)

(assert (=> bm!50368 (= call!50376 (addStillContains!762 (ite c!111484 lt!506454 lt!506457) (ite c!111484 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111479 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111484 minValue!944 (ite c!111479 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1138381 () Bool)

(declare-fun res!759425 () Bool)

(assert (=> b!1138381 (=> (not res!759425) (not e!647744))))

(declare-datatypes ((List!24895 0))(
  ( (Nil!24892) (Cons!24891 (h!26100 (_ BitVec 64)) (t!35956 List!24895)) )
))
(declare-fun arrayNoDuplicates!0 (array!74057 (_ BitVec 32) List!24895) Bool)

(assert (=> b!1138381 (= res!759425 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24892))))

(declare-fun b!1138382 () Bool)

(declare-fun e!647750 () Unit!37294)

(declare-fun e!647748 () Unit!37294)

(assert (=> b!1138382 (= e!647750 e!647748)))

(declare-fun c!111480 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!506453 () Bool)

(assert (=> b!1138382 (= c!111480 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506453))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!50369 () Bool)

(declare-datatypes ((ValueCell!13590 0))(
  ( (ValueCellFull!13590 (v!16993 V!43259)) (EmptyCell!13590) )
))
(declare-datatypes ((array!74059 0))(
  ( (array!74060 (arr!35680 (Array (_ BitVec 32) ValueCell!13590)) (size!36216 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74059)

(declare-fun call!50372 () ListLongMap!16107)

(declare-fun getCurrentListMapNoExtraKeys!4553 (array!74057 array!74059 (_ BitVec 32) (_ BitVec 32) V!43259 V!43259 (_ BitVec 32) Int) ListLongMap!16107)

(assert (=> bm!50369 (= call!50372 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50370 () Bool)

(declare-fun call!50375 () ListLongMap!16107)

(declare-fun +!3502 (ListLongMap!16107 tuple2!18138) ListLongMap!16107)

(assert (=> bm!50370 (= call!50375 (+!3502 lt!506457 (ite (or c!111484 c!111479) (tuple2!18139 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun res!759420 () Bool)

(assert (=> start!98464 (=> (not res!759420) (not e!647744))))

(assert (=> start!98464 (= res!759420 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36215 _keys!1208))))))

(assert (=> start!98464 e!647744))

(assert (=> start!98464 tp_is_empty!28599))

(declare-fun array_inv!27352 (array!74057) Bool)

(assert (=> start!98464 (array_inv!27352 _keys!1208)))

(assert (=> start!98464 true))

(assert (=> start!98464 tp!84917))

(declare-fun e!647736 () Bool)

(declare-fun array_inv!27353 (array!74059) Bool)

(assert (=> start!98464 (and (array_inv!27353 _values!996) e!647736)))

(declare-fun b!1138383 () Bool)

(declare-fun call!50370 () Bool)

(assert (=> b!1138383 call!50370))

(declare-fun lt!506456 () Unit!37294)

(assert (=> b!1138383 (= lt!506456 call!50377)))

(assert (=> b!1138383 (= e!647748 lt!506456)))

(declare-fun b!1138384 () Bool)

(declare-fun e!647740 () Unit!37294)

(declare-fun Unit!37296 () Unit!37294)

(assert (=> b!1138384 (= e!647740 Unit!37296)))

(assert (=> b!1138384 (= lt!506453 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138384 (= c!111484 (and (not lt!506453) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506449 () Unit!37294)

(declare-fun e!647747 () Unit!37294)

(assert (=> b!1138384 (= lt!506449 e!647747)))

(declare-fun lt!506455 () Unit!37294)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!364 (array!74057 array!74059 (_ BitVec 32) (_ BitVec 32) V!43259 V!43259 (_ BitVec 64) (_ BitVec 32) Int) Unit!37294)

(assert (=> b!1138384 (= lt!506455 (lemmaListMapContainsThenArrayContainsFrom!364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111481 () Bool)

(assert (=> b!1138384 (= c!111481 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759422 () Bool)

(declare-fun e!647737 () Bool)

(assert (=> b!1138384 (= res!759422 e!647737)))

(declare-fun e!647743 () Bool)

(assert (=> b!1138384 (=> (not res!759422) (not e!647743))))

(assert (=> b!1138384 e!647743))

(declare-fun lt!506459 () Unit!37294)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74057 (_ BitVec 32) (_ BitVec 32)) Unit!37294)

(assert (=> b!1138384 (= lt!506459 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1138384 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24892)))

(declare-fun lt!506463 () Unit!37294)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74057 (_ BitVec 64) (_ BitVec 32) List!24895) Unit!37294)

(assert (=> b!1138384 (= lt!506463 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24892))))

(assert (=> b!1138384 false))

(declare-fun b!1138385 () Bool)

(declare-fun Unit!37297 () Unit!37294)

(assert (=> b!1138385 (= e!647748 Unit!37297)))

(declare-fun b!1138386 () Bool)

(declare-fun e!647749 () Bool)

(assert (=> b!1138386 (= e!647749 true)))

(declare-fun lt!506465 () Unit!37294)

(assert (=> b!1138386 (= lt!506465 e!647740)))

(declare-fun c!111483 () Bool)

(declare-fun contains!6605 (ListLongMap!16107 (_ BitVec 64)) Bool)

(assert (=> b!1138386 (= c!111483 (contains!6605 lt!506457 k0!934))))

(assert (=> b!1138386 (= lt!506457 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138387 () Bool)

(declare-fun e!647751 () Bool)

(declare-fun e!647739 () Bool)

(assert (=> b!1138387 (= e!647751 (not e!647739))))

(declare-fun res!759412 () Bool)

(assert (=> b!1138387 (=> res!759412 e!647739)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138387 (= res!759412 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138387 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506450 () Unit!37294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74057 (_ BitVec 64) (_ BitVec 32)) Unit!37294)

(assert (=> b!1138387 (= lt!506450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1138388 () Bool)

(declare-fun res!759421 () Bool)

(assert (=> b!1138388 (=> (not res!759421) (not e!647751))))

(declare-fun lt!506461 () array!74057)

(assert (=> b!1138388 (= res!759421 (arrayNoDuplicates!0 lt!506461 #b00000000000000000000000000000000 Nil!24892))))

(declare-fun b!1138389 () Bool)

(assert (=> b!1138389 (= e!647743 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138390 () Bool)

(declare-fun Unit!37298 () Unit!37294)

(assert (=> b!1138390 (= e!647740 Unit!37298)))

(declare-fun mapIsEmpty!44723 () Bool)

(declare-fun mapRes!44723 () Bool)

(assert (=> mapIsEmpty!44723 mapRes!44723))

(declare-fun bm!50371 () Bool)

(declare-fun call!50374 () Bool)

(assert (=> bm!50371 (= call!50370 call!50374)))

(declare-fun b!1138391 () Bool)

(declare-fun res!759416 () Bool)

(assert (=> b!1138391 (=> (not res!759416) (not e!647744))))

(assert (=> b!1138391 (= res!759416 (and (= (size!36216 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36215 _keys!1208) (size!36216 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138392 () Bool)

(declare-fun e!647746 () Bool)

(assert (=> b!1138392 (= e!647746 tp_is_empty!28599)))

(declare-fun call!50373 () ListLongMap!16107)

(declare-fun bm!50372 () Bool)

(assert (=> bm!50372 (= call!50374 (contains!6605 (ite c!111484 lt!506454 call!50373) k0!934))))

(declare-fun b!1138393 () Bool)

(declare-fun e!647745 () Bool)

(assert (=> b!1138393 (= e!647739 e!647745)))

(declare-fun res!759424 () Bool)

(assert (=> b!1138393 (=> res!759424 e!647745)))

(assert (=> b!1138393 (= res!759424 (not (= from!1455 i!673)))))

(declare-fun lt!506451 () ListLongMap!16107)

(declare-fun lt!506464 () array!74059)

(assert (=> b!1138393 (= lt!506451 (getCurrentListMapNoExtraKeys!4553 lt!506461 lt!506464 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2604 (Int (_ BitVec 64)) V!43259)

(assert (=> b!1138393 (= lt!506464 (array!74060 (store (arr!35680 _values!996) i!673 (ValueCellFull!13590 (dynLambda!2604 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36216 _values!996)))))

(declare-fun lt!506458 () ListLongMap!16107)

(assert (=> b!1138393 (= lt!506458 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138394 () Bool)

(declare-fun res!759414 () Bool)

(assert (=> b!1138394 (=> (not res!759414) (not e!647744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138394 (= res!759414 (validKeyInArray!0 k0!934))))

(declare-fun b!1138395 () Bool)

(assert (=> b!1138395 (= c!111479 (and (not lt!506453) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138395 (= e!647747 e!647750)))

(declare-fun b!1138396 () Bool)

(declare-fun lt!506462 () Unit!37294)

(assert (=> b!1138396 (= e!647750 lt!506462)))

(assert (=> b!1138396 (= lt!506462 call!50377)))

(assert (=> b!1138396 call!50370))

(declare-fun b!1138397 () Bool)

(declare-fun res!759413 () Bool)

(assert (=> b!1138397 (=> (not res!759413) (not e!647744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138397 (= res!759413 (validMask!0 mask!1564))))

(declare-fun b!1138398 () Bool)

(assert (=> b!1138398 (= e!647737 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138399 () Bool)

(declare-fun res!759423 () Bool)

(assert (=> b!1138399 (=> (not res!759423) (not e!647744))))

(assert (=> b!1138399 (= res!759423 (= (select (arr!35679 _keys!1208) i!673) k0!934))))

(declare-fun b!1138400 () Bool)

(declare-fun e!647741 () Bool)

(declare-fun call!50371 () ListLongMap!16107)

(assert (=> b!1138400 (= e!647741 (= call!50371 call!50372))))

(declare-fun bm!50373 () Bool)

(assert (=> bm!50373 (= call!50371 (getCurrentListMapNoExtraKeys!4553 lt!506461 lt!506464 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138401 () Bool)

(assert (=> b!1138401 (= e!647744 e!647751)))

(declare-fun res!759415 () Bool)

(assert (=> b!1138401 (=> (not res!759415) (not e!647751))))

(assert (=> b!1138401 (= res!759415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506461 mask!1564))))

(assert (=> b!1138401 (= lt!506461 (array!74058 (store (arr!35679 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36215 _keys!1208)))))

(declare-fun b!1138402 () Bool)

(declare-fun res!759418 () Bool)

(assert (=> b!1138402 (=> (not res!759418) (not e!647744))))

(assert (=> b!1138402 (= res!759418 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36215 _keys!1208))))))

(declare-fun bm!50374 () Bool)

(assert (=> bm!50374 (= call!50373 call!50375)))

(declare-fun b!1138403 () Bool)

(declare-fun -!1222 (ListLongMap!16107 (_ BitVec 64)) ListLongMap!16107)

(assert (=> b!1138403 (= e!647741 (= call!50371 (-!1222 call!50372 k0!934)))))

(declare-fun b!1138404 () Bool)

(assert (=> b!1138404 (= e!647745 e!647749)))

(declare-fun res!759417 () Bool)

(assert (=> b!1138404 (=> res!759417 e!647749)))

(assert (=> b!1138404 (= res!759417 (not (= (select (arr!35679 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1138404 e!647741))

(declare-fun c!111482 () Bool)

(assert (=> b!1138404 (= c!111482 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506452 () Unit!37294)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!470 (array!74057 array!74059 (_ BitVec 32) (_ BitVec 32) V!43259 V!43259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37294)

(assert (=> b!1138404 (= lt!506452 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138405 () Bool)

(assert (=> b!1138405 (= e!647737 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506453) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!44723 () Bool)

(declare-fun tp!84918 () Bool)

(assert (=> mapNonEmpty!44723 (= mapRes!44723 (and tp!84918 e!647746))))

(declare-fun mapKey!44723 () (_ BitVec 32))

(declare-fun mapValue!44723 () ValueCell!13590)

(declare-fun mapRest!44723 () (Array (_ BitVec 32) ValueCell!13590))

(assert (=> mapNonEmpty!44723 (= (arr!35680 _values!996) (store mapRest!44723 mapKey!44723 mapValue!44723))))

(declare-fun b!1138406 () Bool)

(assert (=> b!1138406 (= e!647736 (and e!647738 mapRes!44723))))

(declare-fun condMapEmpty!44723 () Bool)

(declare-fun mapDefault!44723 () ValueCell!13590)

(assert (=> b!1138406 (= condMapEmpty!44723 (= (arr!35680 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13590)) mapDefault!44723)))))

(declare-fun b!1138407 () Bool)

(assert (=> b!1138407 (contains!6605 (+!3502 lt!506454 (tuple2!18139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506460 () Unit!37294)

(assert (=> b!1138407 (= lt!506460 call!50376)))

(assert (=> b!1138407 call!50374))

(assert (=> b!1138407 (= lt!506454 call!50375)))

(declare-fun lt!506466 () Unit!37294)

(assert (=> b!1138407 (= lt!506466 (addStillContains!762 lt!506457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1138407 (= e!647747 lt!506460)))

(assert (= (and start!98464 res!759420) b!1138397))

(assert (= (and b!1138397 res!759413) b!1138391))

(assert (= (and b!1138391 res!759416) b!1138379))

(assert (= (and b!1138379 res!759419) b!1138381))

(assert (= (and b!1138381 res!759425) b!1138402))

(assert (= (and b!1138402 res!759418) b!1138394))

(assert (= (and b!1138394 res!759414) b!1138399))

(assert (= (and b!1138399 res!759423) b!1138401))

(assert (= (and b!1138401 res!759415) b!1138388))

(assert (= (and b!1138388 res!759421) b!1138387))

(assert (= (and b!1138387 (not res!759412)) b!1138393))

(assert (= (and b!1138393 (not res!759424)) b!1138404))

(assert (= (and b!1138404 c!111482) b!1138403))

(assert (= (and b!1138404 (not c!111482)) b!1138400))

(assert (= (or b!1138403 b!1138400) bm!50373))

(assert (= (or b!1138403 b!1138400) bm!50369))

(assert (= (and b!1138404 (not res!759417)) b!1138386))

(assert (= (and b!1138386 c!111483) b!1138384))

(assert (= (and b!1138386 (not c!111483)) b!1138390))

(assert (= (and b!1138384 c!111484) b!1138407))

(assert (= (and b!1138384 (not c!111484)) b!1138395))

(assert (= (and b!1138395 c!111479) b!1138396))

(assert (= (and b!1138395 (not c!111479)) b!1138382))

(assert (= (and b!1138382 c!111480) b!1138383))

(assert (= (and b!1138382 (not c!111480)) b!1138385))

(assert (= (or b!1138396 b!1138383) bm!50367))

(assert (= (or b!1138396 b!1138383) bm!50374))

(assert (= (or b!1138396 b!1138383) bm!50371))

(assert (= (or b!1138407 bm!50371) bm!50372))

(assert (= (or b!1138407 bm!50367) bm!50368))

(assert (= (or b!1138407 bm!50374) bm!50370))

(assert (= (and b!1138384 c!111481) b!1138398))

(assert (= (and b!1138384 (not c!111481)) b!1138405))

(assert (= (and b!1138384 res!759422) b!1138389))

(assert (= (and b!1138406 condMapEmpty!44723) mapIsEmpty!44723))

(assert (= (and b!1138406 (not condMapEmpty!44723)) mapNonEmpty!44723))

(get-info :version)

(assert (= (and mapNonEmpty!44723 ((_ is ValueCellFull!13590) mapValue!44723)) b!1138392))

(assert (= (and b!1138406 ((_ is ValueCellFull!13590) mapDefault!44723)) b!1138380))

(assert (= start!98464 b!1138406))

(declare-fun b_lambda!19175 () Bool)

(assert (=> (not b_lambda!19175) (not b!1138393)))

(declare-fun t!35954 () Bool)

(declare-fun tb!8881 () Bool)

(assert (=> (and start!98464 (= defaultEntry!1004 defaultEntry!1004) t!35954) tb!8881))

(declare-fun result!18327 () Bool)

(assert (=> tb!8881 (= result!18327 tp_is_empty!28599)))

(assert (=> b!1138393 t!35954))

(declare-fun b_and!38989 () Bool)

(assert (= b_and!38987 (and (=> t!35954 result!18327) b_and!38989)))

(declare-fun m!1050245 () Bool)

(assert (=> bm!50368 m!1050245))

(declare-fun m!1050247 () Bool)

(assert (=> bm!50369 m!1050247))

(declare-fun m!1050249 () Bool)

(assert (=> b!1138407 m!1050249))

(assert (=> b!1138407 m!1050249))

(declare-fun m!1050251 () Bool)

(assert (=> b!1138407 m!1050251))

(declare-fun m!1050253 () Bool)

(assert (=> b!1138407 m!1050253))

(declare-fun m!1050255 () Bool)

(assert (=> b!1138399 m!1050255))

(declare-fun m!1050257 () Bool)

(assert (=> start!98464 m!1050257))

(declare-fun m!1050259 () Bool)

(assert (=> start!98464 m!1050259))

(declare-fun m!1050261 () Bool)

(assert (=> b!1138388 m!1050261))

(declare-fun m!1050263 () Bool)

(assert (=> b!1138397 m!1050263))

(declare-fun m!1050265 () Bool)

(assert (=> b!1138387 m!1050265))

(declare-fun m!1050267 () Bool)

(assert (=> b!1138387 m!1050267))

(declare-fun m!1050269 () Bool)

(assert (=> bm!50372 m!1050269))

(declare-fun m!1050271 () Bool)

(assert (=> b!1138379 m!1050271))

(declare-fun m!1050273 () Bool)

(assert (=> b!1138386 m!1050273))

(assert (=> b!1138386 m!1050247))

(declare-fun m!1050275 () Bool)

(assert (=> bm!50370 m!1050275))

(declare-fun m!1050277 () Bool)

(assert (=> mapNonEmpty!44723 m!1050277))

(declare-fun m!1050279 () Bool)

(assert (=> b!1138398 m!1050279))

(declare-fun m!1050281 () Bool)

(assert (=> b!1138401 m!1050281))

(declare-fun m!1050283 () Bool)

(assert (=> b!1138401 m!1050283))

(declare-fun m!1050285 () Bool)

(assert (=> b!1138381 m!1050285))

(assert (=> b!1138389 m!1050279))

(declare-fun m!1050287 () Bool)

(assert (=> b!1138394 m!1050287))

(declare-fun m!1050289 () Bool)

(assert (=> b!1138403 m!1050289))

(declare-fun m!1050291 () Bool)

(assert (=> b!1138393 m!1050291))

(declare-fun m!1050293 () Bool)

(assert (=> b!1138393 m!1050293))

(declare-fun m!1050295 () Bool)

(assert (=> b!1138393 m!1050295))

(declare-fun m!1050297 () Bool)

(assert (=> b!1138393 m!1050297))

(declare-fun m!1050299 () Bool)

(assert (=> bm!50373 m!1050299))

(declare-fun m!1050301 () Bool)

(assert (=> b!1138384 m!1050301))

(declare-fun m!1050303 () Bool)

(assert (=> b!1138384 m!1050303))

(declare-fun m!1050305 () Bool)

(assert (=> b!1138384 m!1050305))

(declare-fun m!1050307 () Bool)

(assert (=> b!1138384 m!1050307))

(declare-fun m!1050309 () Bool)

(assert (=> b!1138404 m!1050309))

(declare-fun m!1050311 () Bool)

(assert (=> b!1138404 m!1050311))

(check-sat (not start!98464) (not b!1138393) (not b!1138401) (not mapNonEmpty!44723) (not b!1138407) b_and!38989 (not b!1138386) (not b!1138388) (not b!1138387) (not b_lambda!19175) (not b!1138398) (not b!1138394) (not b!1138384) (not b!1138397) (not bm!50370) (not b!1138389) (not b!1138381) (not bm!50369) tp_is_empty!28599 (not bm!50372) (not b!1138379) (not bm!50368) (not b!1138404) (not b_next!24069) (not bm!50373) (not b!1138403))
(check-sat b_and!38989 (not b_next!24069))

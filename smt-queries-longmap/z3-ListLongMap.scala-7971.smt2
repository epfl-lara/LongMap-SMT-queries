; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98660 () Bool)

(assert start!98660)

(declare-fun b_free!24271 () Bool)

(declare-fun b_next!24271 () Bool)

(assert (=> start!98660 (= b_free!24271 (not b_next!24271))))

(declare-fun tp!85524 () Bool)

(declare-fun b_and!39369 () Bool)

(assert (=> start!98660 (= tp!85524 b_and!39369)))

(declare-fun b!1147354 () Bool)

(declare-fun e!652627 () Bool)

(declare-fun e!652620 () Bool)

(assert (=> b!1147354 (= e!652627 e!652620)))

(declare-fun res!763699 () Bool)

(assert (=> b!1147354 (=> (not res!763699) (not e!652620))))

(declare-datatypes ((array!74372 0))(
  ( (array!74373 (arr!35837 (Array (_ BitVec 32) (_ BitVec 64))) (size!36375 (_ BitVec 32))) )
))
(declare-fun lt!512550 () array!74372)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74372 (_ BitVec 32)) Bool)

(assert (=> b!1147354 (= res!763699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512550 mask!1564))))

(declare-fun _keys!1208 () array!74372)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147354 (= lt!512550 (array!74373 (store (arr!35837 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36375 _keys!1208)))))

(declare-fun b!1147355 () Bool)

(declare-fun e!652628 () Bool)

(declare-fun tp_is_empty!28801 () Bool)

(assert (=> b!1147355 (= e!652628 tp_is_empty!28801)))

(declare-fun b!1147356 () Bool)

(declare-datatypes ((Unit!37544 0))(
  ( (Unit!37545) )
))
(declare-fun e!652623 () Unit!37544)

(declare-fun e!652631 () Unit!37544)

(assert (=> b!1147356 (= e!652623 e!652631)))

(declare-fun c!113273 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!512537 () Bool)

(assert (=> b!1147356 (= c!113273 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512537))))

(declare-fun b!1147357 () Bool)

(declare-fun e!652619 () Bool)

(declare-fun e!652632 () Bool)

(assert (=> b!1147357 (= e!652619 e!652632)))

(declare-fun res!763705 () Bool)

(assert (=> b!1147357 (=> res!763705 e!652632)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1147357 (= res!763705 (not (= (select (arr!35837 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652622 () Bool)

(assert (=> b!1147357 e!652622))

(declare-fun c!113274 () Bool)

(assert (=> b!1147357 (= c!113274 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43529 0))(
  ( (V!43530 (val!14457 Int)) )
))
(declare-fun zeroValue!944 () V!43529)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13691 0))(
  ( (ValueCellFull!13691 (v!17093 V!43529)) (EmptyCell!13691) )
))
(declare-datatypes ((array!74374 0))(
  ( (array!74375 (arr!35838 (Array (_ BitVec 32) ValueCell!13691)) (size!36376 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74374)

(declare-fun minValue!944 () V!43529)

(declare-fun lt!512539 () Unit!37544)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!555 (array!74372 array!74374 (_ BitVec 32) (_ BitVec 32) V!43529 V!43529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37544)

(assert (=> b!1147357 (= lt!512539 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147358 () Bool)

(declare-fun e!652626 () Bool)

(declare-fun e!652621 () Bool)

(declare-fun mapRes!45026 () Bool)

(assert (=> b!1147358 (= e!652626 (and e!652621 mapRes!45026))))

(declare-fun condMapEmpty!45026 () Bool)

(declare-fun mapDefault!45026 () ValueCell!13691)

(assert (=> b!1147358 (= condMapEmpty!45026 (= (arr!35838 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13691)) mapDefault!45026)))))

(declare-fun mapIsEmpty!45026 () Bool)

(assert (=> mapIsEmpty!45026 mapRes!45026))

(declare-fun b!1147359 () Bool)

(declare-fun e!652629 () Bool)

(assert (=> b!1147359 (= e!652620 (not e!652629))))

(declare-fun res!763700 () Bool)

(assert (=> b!1147359 (=> res!763700 e!652629)))

(assert (=> b!1147359 (= res!763700 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147359 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512536 () Unit!37544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74372 (_ BitVec 64) (_ BitVec 32)) Unit!37544)

(assert (=> b!1147359 (= lt!512536 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45026 () Bool)

(declare-fun tp!85523 () Bool)

(assert (=> mapNonEmpty!45026 (= mapRes!45026 (and tp!85523 e!652628))))

(declare-fun mapRest!45026 () (Array (_ BitVec 32) ValueCell!13691))

(declare-fun mapKey!45026 () (_ BitVec 32))

(declare-fun mapValue!45026 () ValueCell!13691)

(assert (=> mapNonEmpty!45026 (= (arr!35838 _values!996) (store mapRest!45026 mapKey!45026 mapValue!45026))))

(declare-fun b!1147360 () Bool)

(declare-fun res!763711 () Bool)

(assert (=> b!1147360 (=> (not res!763711) (not e!652627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147360 (= res!763711 (validMask!0 mask!1564))))

(declare-fun bm!52768 () Bool)

(declare-datatypes ((tuple2!18410 0))(
  ( (tuple2!18411 (_1!9216 (_ BitVec 64)) (_2!9216 V!43529)) )
))
(declare-datatypes ((List!25146 0))(
  ( (Nil!25143) (Cons!25142 (h!26351 tuple2!18410) (t!36400 List!25146)) )
))
(declare-datatypes ((ListLongMap!16379 0))(
  ( (ListLongMap!16380 (toList!8205 List!25146)) )
))
(declare-fun call!52775 () ListLongMap!16379)

(declare-fun call!52778 () ListLongMap!16379)

(assert (=> bm!52768 (= call!52775 call!52778)))

(declare-fun b!1147361 () Bool)

(declare-fun e!652617 () Bool)

(assert (=> b!1147361 (= e!652617 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512537) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147362 () Bool)

(declare-fun res!763698 () Bool)

(assert (=> b!1147362 (=> (not res!763698) (not e!652627))))

(assert (=> b!1147362 (= res!763698 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36375 _keys!1208))))))

(declare-fun b!1147363 () Bool)

(declare-fun e!652625 () Bool)

(assert (=> b!1147363 (= e!652625 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147364 () Bool)

(assert (=> b!1147364 (= e!652621 tp_is_empty!28801)))

(declare-fun b!1147365 () Bool)

(declare-fun res!763712 () Bool)

(assert (=> b!1147365 (=> (not res!763712) (not e!652627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147365 (= res!763712 (validKeyInArray!0 k0!934))))

(declare-fun c!113272 () Bool)

(declare-fun lt!512552 () ListLongMap!16379)

(declare-fun bm!52769 () Bool)

(declare-fun c!113271 () Bool)

(declare-fun +!3624 (ListLongMap!16379 tuple2!18410) ListLongMap!16379)

(assert (=> bm!52769 (= call!52778 (+!3624 lt!512552 (ite (or c!113271 c!113272) (tuple2!18411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18411 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1147366 () Bool)

(declare-fun res!763702 () Bool)

(assert (=> b!1147366 (=> (not res!763702) (not e!652627))))

(assert (=> b!1147366 (= res!763702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147367 () Bool)

(declare-fun e!652618 () Unit!37544)

(declare-fun Unit!37546 () Unit!37544)

(assert (=> b!1147367 (= e!652618 Unit!37546)))

(assert (=> b!1147367 (= lt!512537 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147367 (= c!113271 (and (not lt!512537) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512540 () Unit!37544)

(declare-fun e!652624 () Unit!37544)

(assert (=> b!1147367 (= lt!512540 e!652624)))

(declare-fun lt!512555 () Unit!37544)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!430 (array!74372 array!74374 (_ BitVec 32) (_ BitVec 32) V!43529 V!43529 (_ BitVec 64) (_ BitVec 32) Int) Unit!37544)

(assert (=> b!1147367 (= lt!512555 (lemmaListMapContainsThenArrayContainsFrom!430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113275 () Bool)

(assert (=> b!1147367 (= c!113275 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763704 () Bool)

(assert (=> b!1147367 (= res!763704 e!652617)))

(assert (=> b!1147367 (=> (not res!763704) (not e!652625))))

(assert (=> b!1147367 e!652625))

(declare-fun lt!512543 () Unit!37544)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74372 (_ BitVec 32) (_ BitVec 32)) Unit!37544)

(assert (=> b!1147367 (= lt!512543 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25147 0))(
  ( (Nil!25144) (Cons!25143 (h!26352 (_ BitVec 64)) (t!36401 List!25147)) )
))
(declare-fun arrayNoDuplicates!0 (array!74372 (_ BitVec 32) List!25147) Bool)

(assert (=> b!1147367 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25144)))

(declare-fun lt!512542 () Unit!37544)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74372 (_ BitVec 64) (_ BitVec 32) List!25147) Unit!37544)

(assert (=> b!1147367 (= lt!512542 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25144))))

(assert (=> b!1147367 false))

(declare-fun b!1147368 () Bool)

(declare-fun res!763707 () Bool)

(assert (=> b!1147368 (=> (not res!763707) (not e!652620))))

(assert (=> b!1147368 (= res!763707 (arrayNoDuplicates!0 lt!512550 #b00000000000000000000000000000000 Nil!25144))))

(declare-fun b!1147369 () Bool)

(declare-fun res!763706 () Bool)

(assert (=> b!1147369 (=> (not res!763706) (not e!652627))))

(assert (=> b!1147369 (= res!763706 (and (= (size!36376 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36375 _keys!1208) (size!36376 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!52774 () ListLongMap!16379)

(declare-fun bm!52770 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4691 (array!74372 array!74374 (_ BitVec 32) (_ BitVec 32) V!43529 V!43529 (_ BitVec 32) Int) ListLongMap!16379)

(assert (=> bm!52770 (= call!52774 (getCurrentListMapNoExtraKeys!4691 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!52777 () ListLongMap!16379)

(declare-fun b!1147370 () Bool)

(declare-fun -!1278 (ListLongMap!16379 (_ BitVec 64)) ListLongMap!16379)

(assert (=> b!1147370 (= e!652622 (= call!52777 (-!1278 call!52774 k0!934)))))

(declare-fun b!1147371 () Bool)

(declare-fun res!763710 () Bool)

(assert (=> b!1147371 (=> (not res!763710) (not e!652627))))

(assert (=> b!1147371 (= res!763710 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25144))))

(declare-fun b!1147372 () Bool)

(assert (=> b!1147372 (= e!652622 (= call!52777 call!52774))))

(declare-fun bm!52771 () Bool)

(declare-fun call!52772 () Unit!37544)

(declare-fun call!52773 () Unit!37544)

(assert (=> bm!52771 (= call!52772 call!52773)))

(declare-fun lt!512545 () array!74374)

(declare-fun bm!52772 () Bool)

(assert (=> bm!52772 (= call!52777 (getCurrentListMapNoExtraKeys!4691 lt!512550 lt!512545 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!763701 () Bool)

(assert (=> start!98660 (=> (not res!763701) (not e!652627))))

(assert (=> start!98660 (= res!763701 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36375 _keys!1208))))))

(assert (=> start!98660 e!652627))

(assert (=> start!98660 tp_is_empty!28801))

(declare-fun array_inv!27540 (array!74372) Bool)

(assert (=> start!98660 (array_inv!27540 _keys!1208)))

(assert (=> start!98660 true))

(assert (=> start!98660 tp!85524))

(declare-fun array_inv!27541 (array!74374) Bool)

(assert (=> start!98660 (and (array_inv!27541 _values!996) e!652626)))

(declare-fun b!1147373 () Bool)

(declare-fun Unit!37547 () Unit!37544)

(assert (=> b!1147373 (= e!652618 Unit!37547)))

(declare-fun b!1147374 () Bool)

(assert (=> b!1147374 (= e!652617 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147375 () Bool)

(declare-fun Unit!37548 () Unit!37544)

(assert (=> b!1147375 (= e!652631 Unit!37548)))

(declare-fun lt!512541 () ListLongMap!16379)

(declare-fun call!52771 () Bool)

(declare-fun bm!52773 () Bool)

(declare-fun contains!6668 (ListLongMap!16379 (_ BitVec 64)) Bool)

(assert (=> bm!52773 (= call!52771 (contains!6668 (ite c!113271 lt!512541 call!52775) k0!934))))

(declare-fun bm!52774 () Bool)

(declare-fun call!52776 () Bool)

(assert (=> bm!52774 (= call!52776 call!52771)))

(declare-fun b!1147376 () Bool)

(declare-fun res!763708 () Bool)

(assert (=> b!1147376 (=> (not res!763708) (not e!652627))))

(assert (=> b!1147376 (= res!763708 (= (select (arr!35837 _keys!1208) i!673) k0!934))))

(declare-fun b!1147377 () Bool)

(assert (=> b!1147377 (= e!652629 e!652619)))

(declare-fun res!763703 () Bool)

(assert (=> b!1147377 (=> res!763703 e!652619)))

(assert (=> b!1147377 (= res!763703 (not (= from!1455 i!673)))))

(declare-fun lt!512551 () ListLongMap!16379)

(assert (=> b!1147377 (= lt!512551 (getCurrentListMapNoExtraKeys!4691 lt!512550 lt!512545 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512544 () V!43529)

(assert (=> b!1147377 (= lt!512545 (array!74375 (store (arr!35838 _values!996) i!673 (ValueCellFull!13691 lt!512544)) (size!36376 _values!996)))))

(declare-fun dynLambda!2660 (Int (_ BitVec 64)) V!43529)

(assert (=> b!1147377 (= lt!512544 (dynLambda!2660 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512546 () ListLongMap!16379)

(assert (=> b!1147377 (= lt!512546 (getCurrentListMapNoExtraKeys!4691 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147378 () Bool)

(declare-fun lt!512554 () Unit!37544)

(assert (=> b!1147378 (= e!652623 lt!512554)))

(assert (=> b!1147378 (= lt!512554 call!52772)))

(assert (=> b!1147378 call!52776))

(declare-fun b!1147379 () Bool)

(assert (=> b!1147379 (= c!113272 (and (not lt!512537) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147379 (= e!652624 e!652623)))

(declare-fun b!1147380 () Bool)

(assert (=> b!1147380 (contains!6668 (+!3624 lt!512541 (tuple2!18411 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!512548 () Unit!37544)

(assert (=> b!1147380 (= lt!512548 call!52773)))

(assert (=> b!1147380 call!52771))

(assert (=> b!1147380 (= lt!512541 call!52778)))

(declare-fun lt!512547 () Unit!37544)

(declare-fun addStillContains!837 (ListLongMap!16379 (_ BitVec 64) V!43529 (_ BitVec 64)) Unit!37544)

(assert (=> b!1147380 (= lt!512547 (addStillContains!837 lt!512552 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1147380 (= e!652624 lt!512548)))

(declare-fun b!1147381 () Bool)

(assert (=> b!1147381 call!52776))

(declare-fun lt!512556 () Unit!37544)

(assert (=> b!1147381 (= lt!512556 call!52772)))

(assert (=> b!1147381 (= e!652631 lt!512556)))

(declare-fun bm!52775 () Bool)

(assert (=> bm!52775 (= call!52773 (addStillContains!837 (ite c!113271 lt!512541 lt!512552) (ite c!113271 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113272 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113271 minValue!944 (ite c!113272 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147382 () Bool)

(assert (=> b!1147382 (= e!652632 true)))

(declare-fun e!652616 () Bool)

(assert (=> b!1147382 e!652616))

(declare-fun res!763709 () Bool)

(assert (=> b!1147382 (=> (not res!763709) (not e!652616))))

(declare-fun lt!512549 () V!43529)

(assert (=> b!1147382 (= res!763709 (= (-!1278 (+!3624 lt!512552 (tuple2!18411 (select (arr!35837 _keys!1208) from!1455) lt!512549)) (select (arr!35837 _keys!1208) from!1455)) lt!512552))))

(declare-fun lt!512538 () Unit!37544)

(declare-fun addThenRemoveForNewKeyIsSame!140 (ListLongMap!16379 (_ BitVec 64) V!43529) Unit!37544)

(assert (=> b!1147382 (= lt!512538 (addThenRemoveForNewKeyIsSame!140 lt!512552 (select (arr!35837 _keys!1208) from!1455) lt!512549))))

(declare-fun get!18244 (ValueCell!13691 V!43529) V!43529)

(assert (=> b!1147382 (= lt!512549 (get!18244 (select (arr!35838 _values!996) from!1455) lt!512544))))

(declare-fun lt!512553 () Unit!37544)

(assert (=> b!1147382 (= lt!512553 e!652618)))

(declare-fun c!113276 () Bool)

(assert (=> b!1147382 (= c!113276 (contains!6668 lt!512552 k0!934))))

(assert (=> b!1147382 (= lt!512552 (getCurrentListMapNoExtraKeys!4691 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147383 () Bool)

(assert (=> b!1147383 (= e!652616 (= (-!1278 lt!512546 k0!934) lt!512552))))

(assert (= (and start!98660 res!763701) b!1147360))

(assert (= (and b!1147360 res!763711) b!1147369))

(assert (= (and b!1147369 res!763706) b!1147366))

(assert (= (and b!1147366 res!763702) b!1147371))

(assert (= (and b!1147371 res!763710) b!1147362))

(assert (= (and b!1147362 res!763698) b!1147365))

(assert (= (and b!1147365 res!763712) b!1147376))

(assert (= (and b!1147376 res!763708) b!1147354))

(assert (= (and b!1147354 res!763699) b!1147368))

(assert (= (and b!1147368 res!763707) b!1147359))

(assert (= (and b!1147359 (not res!763700)) b!1147377))

(assert (= (and b!1147377 (not res!763703)) b!1147357))

(assert (= (and b!1147357 c!113274) b!1147370))

(assert (= (and b!1147357 (not c!113274)) b!1147372))

(assert (= (or b!1147370 b!1147372) bm!52772))

(assert (= (or b!1147370 b!1147372) bm!52770))

(assert (= (and b!1147357 (not res!763705)) b!1147382))

(assert (= (and b!1147382 c!113276) b!1147367))

(assert (= (and b!1147382 (not c!113276)) b!1147373))

(assert (= (and b!1147367 c!113271) b!1147380))

(assert (= (and b!1147367 (not c!113271)) b!1147379))

(assert (= (and b!1147379 c!113272) b!1147378))

(assert (= (and b!1147379 (not c!113272)) b!1147356))

(assert (= (and b!1147356 c!113273) b!1147381))

(assert (= (and b!1147356 (not c!113273)) b!1147375))

(assert (= (or b!1147378 b!1147381) bm!52771))

(assert (= (or b!1147378 b!1147381) bm!52768))

(assert (= (or b!1147378 b!1147381) bm!52774))

(assert (= (or b!1147380 bm!52774) bm!52773))

(assert (= (or b!1147380 bm!52771) bm!52775))

(assert (= (or b!1147380 bm!52768) bm!52769))

(assert (= (and b!1147367 c!113275) b!1147374))

(assert (= (and b!1147367 (not c!113275)) b!1147361))

(assert (= (and b!1147367 res!763704) b!1147363))

(assert (= (and b!1147382 res!763709) b!1147383))

(assert (= (and b!1147358 condMapEmpty!45026) mapIsEmpty!45026))

(assert (= (and b!1147358 (not condMapEmpty!45026)) mapNonEmpty!45026))

(get-info :version)

(assert (= (and mapNonEmpty!45026 ((_ is ValueCellFull!13691) mapValue!45026)) b!1147355))

(assert (= (and b!1147358 ((_ is ValueCellFull!13691) mapDefault!45026)) b!1147364))

(assert (= start!98660 b!1147358))

(declare-fun b_lambda!19359 () Bool)

(assert (=> (not b_lambda!19359) (not b!1147377)))

(declare-fun t!36399 () Bool)

(declare-fun tb!9075 () Bool)

(assert (=> (and start!98660 (= defaultEntry!1004 defaultEntry!1004) t!36399) tb!9075))

(declare-fun result!18723 () Bool)

(assert (=> tb!9075 (= result!18723 tp_is_empty!28801)))

(assert (=> b!1147377 t!36399))

(declare-fun b_and!39371 () Bool)

(assert (= b_and!39369 (and (=> t!36399 result!18723) b_and!39371)))

(declare-fun m!1057501 () Bool)

(assert (=> bm!52773 m!1057501))

(declare-fun m!1057503 () Bool)

(assert (=> b!1147365 m!1057503))

(declare-fun m!1057505 () Bool)

(assert (=> b!1147370 m!1057505))

(declare-fun m!1057507 () Bool)

(assert (=> b!1147367 m!1057507))

(declare-fun m!1057509 () Bool)

(assert (=> b!1147367 m!1057509))

(declare-fun m!1057511 () Bool)

(assert (=> b!1147367 m!1057511))

(declare-fun m!1057513 () Bool)

(assert (=> b!1147367 m!1057513))

(declare-fun m!1057515 () Bool)

(assert (=> bm!52772 m!1057515))

(declare-fun m!1057517 () Bool)

(assert (=> bm!52775 m!1057517))

(declare-fun m!1057519 () Bool)

(assert (=> start!98660 m!1057519))

(declare-fun m!1057521 () Bool)

(assert (=> start!98660 m!1057521))

(declare-fun m!1057523 () Bool)

(assert (=> b!1147374 m!1057523))

(declare-fun m!1057525 () Bool)

(assert (=> bm!52769 m!1057525))

(declare-fun m!1057527 () Bool)

(assert (=> b!1147354 m!1057527))

(declare-fun m!1057529 () Bool)

(assert (=> b!1147354 m!1057529))

(declare-fun m!1057531 () Bool)

(assert (=> b!1147368 m!1057531))

(declare-fun m!1057533 () Bool)

(assert (=> b!1147360 m!1057533))

(declare-fun m!1057535 () Bool)

(assert (=> b!1147382 m!1057535))

(declare-fun m!1057537 () Bool)

(assert (=> b!1147382 m!1057537))

(declare-fun m!1057539 () Bool)

(assert (=> b!1147382 m!1057539))

(declare-fun m!1057541 () Bool)

(assert (=> b!1147382 m!1057541))

(declare-fun m!1057543 () Bool)

(assert (=> b!1147382 m!1057543))

(assert (=> b!1147382 m!1057539))

(declare-fun m!1057545 () Bool)

(assert (=> b!1147382 m!1057545))

(assert (=> b!1147382 m!1057543))

(assert (=> b!1147382 m!1057539))

(declare-fun m!1057547 () Bool)

(assert (=> b!1147382 m!1057547))

(declare-fun m!1057549 () Bool)

(assert (=> b!1147382 m!1057549))

(assert (=> b!1147382 m!1057535))

(declare-fun m!1057551 () Bool)

(assert (=> b!1147371 m!1057551))

(assert (=> bm!52770 m!1057545))

(declare-fun m!1057553 () Bool)

(assert (=> mapNonEmpty!45026 m!1057553))

(assert (=> b!1147357 m!1057539))

(declare-fun m!1057555 () Bool)

(assert (=> b!1147357 m!1057555))

(declare-fun m!1057557 () Bool)

(assert (=> b!1147380 m!1057557))

(assert (=> b!1147380 m!1057557))

(declare-fun m!1057559 () Bool)

(assert (=> b!1147380 m!1057559))

(declare-fun m!1057561 () Bool)

(assert (=> b!1147380 m!1057561))

(declare-fun m!1057563 () Bool)

(assert (=> b!1147359 m!1057563))

(declare-fun m!1057565 () Bool)

(assert (=> b!1147359 m!1057565))

(declare-fun m!1057567 () Bool)

(assert (=> b!1147377 m!1057567))

(declare-fun m!1057569 () Bool)

(assert (=> b!1147377 m!1057569))

(declare-fun m!1057571 () Bool)

(assert (=> b!1147377 m!1057571))

(declare-fun m!1057573 () Bool)

(assert (=> b!1147377 m!1057573))

(declare-fun m!1057575 () Bool)

(assert (=> b!1147376 m!1057575))

(assert (=> b!1147363 m!1057523))

(declare-fun m!1057577 () Bool)

(assert (=> b!1147366 m!1057577))

(declare-fun m!1057579 () Bool)

(assert (=> b!1147383 m!1057579))

(check-sat (not b!1147382) (not b!1147354) tp_is_empty!28801 (not b!1147368) (not b!1147370) (not b!1147380) (not bm!52775) (not mapNonEmpty!45026) (not bm!52772) (not b!1147383) (not b!1147374) (not b!1147365) (not b_next!24271) (not start!98660) (not b!1147360) (not bm!52773) (not b!1147377) (not b!1147371) (not b!1147357) (not b!1147359) (not b_lambda!19359) (not b!1147366) (not b!1147367) (not bm!52769) b_and!39371 (not b!1147363) (not bm!52770))
(check-sat b_and!39371 (not b_next!24271))

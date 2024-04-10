; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98968 () Bool)

(assert start!98968)

(declare-fun b_free!24573 () Bool)

(declare-fun b_next!24573 () Bool)

(assert (=> start!98968 (= b_free!24573 (not b_next!24573))))

(declare-fun tp!86429 () Bool)

(declare-fun b_and!39995 () Bool)

(assert (=> start!98968 (= tp!86429 b_and!39995)))

(declare-datatypes ((V!43931 0))(
  ( (V!43932 (val!14608 Int)) )
))
(declare-fun zeroValue!944 () V!43931)

(declare-fun c!116018 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!18612 0))(
  ( (tuple2!18613 (_1!9317 (_ BitVec 64)) (_2!9317 V!43931)) )
))
(declare-datatypes ((List!25348 0))(
  ( (Nil!25345) (Cons!25344 (h!26553 tuple2!18612) (t!36913 List!25348)) )
))
(declare-datatypes ((ListLongMap!16581 0))(
  ( (ListLongMap!16582 (toList!8306 List!25348)) )
))
(declare-fun lt!522651 () ListLongMap!16581)

(declare-fun minValue!944 () V!43931)

(declare-fun c!116017 () Bool)

(declare-fun bm!56415 () Bool)

(declare-datatypes ((Unit!38300 0))(
  ( (Unit!38301) )
))
(declare-fun call!56418 () Unit!38300)

(declare-fun addStillContains!952 (ListLongMap!16581 (_ BitVec 64) V!43931 (_ BitVec 64)) Unit!38300)

(assert (=> bm!56415 (= call!56418 (addStillContains!952 lt!522651 (ite (or c!116018 c!116017) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116018 c!116017) zeroValue!944 minValue!944) k0!934))))

(declare-datatypes ((array!75045 0))(
  ( (array!75046 (arr!36173 (Array (_ BitVec 32) (_ BitVec 64))) (size!36709 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75045)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!660404 () Bool)

(declare-fun b!1161370 () Bool)

(declare-fun arrayContainsKey!0 (array!75045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161370 (= e!660404 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161371 () Bool)

(declare-fun lt!522659 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161371 (= c!116017 (and (not lt!522659) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660407 () Unit!38300)

(declare-fun e!660403 () Unit!38300)

(assert (=> b!1161371 (= e!660407 e!660403)))

(declare-fun b!1161372 () Bool)

(declare-fun e!660400 () Unit!38300)

(assert (=> b!1161372 (= e!660403 e!660400)))

(declare-fun c!116020 () Bool)

(assert (=> b!1161372 (= c!116020 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522659))))

(declare-fun b!1161373 () Bool)

(declare-fun res!770570 () Bool)

(declare-fun e!660402 () Bool)

(assert (=> b!1161373 (=> (not res!770570) (not e!660402))))

(declare-datatypes ((List!25349 0))(
  ( (Nil!25346) (Cons!25345 (h!26554 (_ BitVec 64)) (t!36914 List!25349)) )
))
(declare-fun arrayNoDuplicates!0 (array!75045 (_ BitVec 32) List!25349) Bool)

(assert (=> b!1161373 (= res!770570 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25346))))

(declare-fun b!1161374 () Bool)

(declare-fun res!770569 () Bool)

(assert (=> b!1161374 (=> (not res!770569) (not e!660402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161374 (= res!770569 (validKeyInArray!0 k0!934))))

(declare-fun b!1161375 () Bool)

(declare-fun res!770562 () Bool)

(assert (=> b!1161375 (=> (not res!770562) (not e!660402))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161375 (= res!770562 (validMask!0 mask!1564))))

(declare-fun b!1161376 () Bool)

(declare-fun e!660409 () Bool)

(declare-fun call!56424 () ListLongMap!16581)

(declare-fun call!56420 () ListLongMap!16581)

(assert (=> b!1161376 (= e!660409 (= call!56424 call!56420))))

(declare-fun bm!56417 () Bool)

(declare-fun call!56422 () Bool)

(declare-fun call!56419 () Bool)

(assert (=> bm!56417 (= call!56422 call!56419)))

(declare-fun b!1161377 () Bool)

(declare-fun e!660399 () Bool)

(declare-fun e!660396 () Bool)

(assert (=> b!1161377 (= e!660399 e!660396)))

(declare-fun res!770559 () Bool)

(assert (=> b!1161377 (=> res!770559 e!660396)))

(assert (=> b!1161377 (= res!770559 (not (= (select (arr!36173 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161377 e!660409))

(declare-fun c!116019 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161377 (= c!116019 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13842 0))(
  ( (ValueCellFull!13842 (v!17245 V!43931)) (EmptyCell!13842) )
))
(declare-datatypes ((array!75047 0))(
  ( (array!75048 (arr!36174 (Array (_ BitVec 32) ValueCell!13842)) (size!36710 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75047)

(declare-fun lt!522650 () Unit!38300)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!643 (array!75045 array!75047 (_ BitVec 32) (_ BitVec 32) V!43931 V!43931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38300)

(assert (=> b!1161377 (= lt!522650 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!643 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161378 () Bool)

(declare-fun call!56423 () ListLongMap!16581)

(declare-fun contains!6811 (ListLongMap!16581 (_ BitVec 64)) Bool)

(assert (=> b!1161378 (contains!6811 call!56423 k0!934)))

(declare-fun lt!522656 () ListLongMap!16581)

(declare-fun lt!522662 () Unit!38300)

(assert (=> b!1161378 (= lt!522662 (addStillContains!952 lt!522656 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1161378 call!56419))

(declare-fun +!3710 (ListLongMap!16581 tuple2!18612) ListLongMap!16581)

(assert (=> b!1161378 (= lt!522656 (+!3710 lt!522651 (tuple2!18613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522649 () Unit!38300)

(assert (=> b!1161378 (= lt!522649 call!56418)))

(assert (=> b!1161378 (= e!660407 lt!522662)))

(declare-fun b!1161379 () Bool)

(assert (=> b!1161379 (= e!660396 true)))

(declare-fun e!660398 () Bool)

(assert (=> b!1161379 e!660398))

(declare-fun res!770572 () Bool)

(assert (=> b!1161379 (=> (not res!770572) (not e!660398))))

(declare-fun lt!522653 () ListLongMap!16581)

(assert (=> b!1161379 (= res!770572 (= lt!522653 lt!522651))))

(declare-fun lt!522663 () ListLongMap!16581)

(declare-fun -!1413 (ListLongMap!16581 (_ BitVec 64)) ListLongMap!16581)

(assert (=> b!1161379 (= lt!522653 (-!1413 lt!522663 k0!934))))

(declare-fun lt!522645 () V!43931)

(assert (=> b!1161379 (= (-!1413 (+!3710 lt!522651 (tuple2!18613 (select (arr!36173 _keys!1208) from!1455) lt!522645)) (select (arr!36173 _keys!1208) from!1455)) lt!522651)))

(declare-fun lt!522657 () Unit!38300)

(declare-fun addThenRemoveForNewKeyIsSame!247 (ListLongMap!16581 (_ BitVec 64) V!43931) Unit!38300)

(assert (=> b!1161379 (= lt!522657 (addThenRemoveForNewKeyIsSame!247 lt!522651 (select (arr!36173 _keys!1208) from!1455) lt!522645))))

(declare-fun lt!522652 () V!43931)

(declare-fun get!18451 (ValueCell!13842 V!43931) V!43931)

(assert (=> b!1161379 (= lt!522645 (get!18451 (select (arr!36174 _values!996) from!1455) lt!522652))))

(declare-fun lt!522654 () Unit!38300)

(declare-fun e!660401 () Unit!38300)

(assert (=> b!1161379 (= lt!522654 e!660401)))

(declare-fun c!116016 () Bool)

(assert (=> b!1161379 (= c!116016 (contains!6811 lt!522651 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4770 (array!75045 array!75047 (_ BitVec 32) (_ BitVec 32) V!43931 V!43931 (_ BitVec 32) Int) ListLongMap!16581)

(assert (=> b!1161379 (= lt!522651 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161380 () Bool)

(assert (=> b!1161380 (= e!660409 (= call!56424 (-!1413 call!56420 k0!934)))))

(declare-fun lt!522643 () array!75047)

(declare-fun lt!522647 () array!75045)

(declare-fun bm!56416 () Bool)

(assert (=> bm!56416 (= call!56424 (getCurrentListMapNoExtraKeys!4770 lt!522647 lt!522643 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770571 () Bool)

(assert (=> start!98968 (=> (not res!770571) (not e!660402))))

(assert (=> start!98968 (= res!770571 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36709 _keys!1208))))))

(assert (=> start!98968 e!660402))

(declare-fun tp_is_empty!29103 () Bool)

(assert (=> start!98968 tp_is_empty!29103))

(declare-fun array_inv!27676 (array!75045) Bool)

(assert (=> start!98968 (array_inv!27676 _keys!1208)))

(assert (=> start!98968 true))

(assert (=> start!98968 tp!86429))

(declare-fun e!660411 () Bool)

(declare-fun array_inv!27677 (array!75047) Bool)

(assert (=> start!98968 (and (array_inv!27677 _values!996) e!660411)))

(declare-fun b!1161381 () Bool)

(declare-fun Unit!38302 () Unit!38300)

(assert (=> b!1161381 (= e!660400 Unit!38302)))

(declare-fun b!1161382 () Bool)

(declare-fun e!660410 () Bool)

(declare-fun e!660397 () Bool)

(assert (=> b!1161382 (= e!660410 (not e!660397))))

(declare-fun res!770573 () Bool)

(assert (=> b!1161382 (=> res!770573 e!660397)))

(assert (=> b!1161382 (= res!770573 (bvsgt from!1455 i!673))))

(assert (=> b!1161382 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522655 () Unit!38300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75045 (_ BitVec 64) (_ BitVec 32)) Unit!38300)

(assert (=> b!1161382 (= lt!522655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!56418 () Bool)

(declare-fun call!56421 () Unit!38300)

(assert (=> bm!56418 (= call!56421 call!56418)))

(declare-fun b!1161383 () Bool)

(assert (=> b!1161383 call!56422))

(declare-fun lt!522644 () Unit!38300)

(assert (=> b!1161383 (= lt!522644 call!56421)))

(assert (=> b!1161383 (= e!660400 lt!522644)))

(declare-fun b!1161384 () Bool)

(declare-fun res!770561 () Bool)

(assert (=> b!1161384 (=> (not res!770561) (not e!660402))))

(assert (=> b!1161384 (= res!770561 (= (select (arr!36173 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45479 () Bool)

(declare-fun mapRes!45479 () Bool)

(declare-fun tp!86430 () Bool)

(declare-fun e!660406 () Bool)

(assert (=> mapNonEmpty!45479 (= mapRes!45479 (and tp!86430 e!660406))))

(declare-fun mapRest!45479 () (Array (_ BitVec 32) ValueCell!13842))

(declare-fun mapKey!45479 () (_ BitVec 32))

(declare-fun mapValue!45479 () ValueCell!13842)

(assert (=> mapNonEmpty!45479 (= (arr!36174 _values!996) (store mapRest!45479 mapKey!45479 mapValue!45479))))

(declare-fun b!1161385 () Bool)

(assert (=> b!1161385 (= e!660402 e!660410)))

(declare-fun res!770565 () Bool)

(assert (=> b!1161385 (=> (not res!770565) (not e!660410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75045 (_ BitVec 32)) Bool)

(assert (=> b!1161385 (= res!770565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522647 mask!1564))))

(assert (=> b!1161385 (= lt!522647 (array!75046 (store (arr!36173 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36709 _keys!1208)))))

(declare-fun b!1161386 () Bool)

(declare-fun e!660405 () Bool)

(assert (=> b!1161386 (= e!660411 (and e!660405 mapRes!45479))))

(declare-fun condMapEmpty!45479 () Bool)

(declare-fun mapDefault!45479 () ValueCell!13842)

(assert (=> b!1161386 (= condMapEmpty!45479 (= (arr!36174 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13842)) mapDefault!45479)))))

(declare-fun b!1161387 () Bool)

(assert (=> b!1161387 (= e!660406 tp_is_empty!29103)))

(declare-fun b!1161388 () Bool)

(assert (=> b!1161388 (= e!660398 (= lt!522653 (getCurrentListMapNoExtraKeys!4770 lt!522647 lt!522643 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161389 () Bool)

(declare-fun res!770566 () Bool)

(assert (=> b!1161389 (=> (not res!770566) (not e!660402))))

(assert (=> b!1161389 (= res!770566 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36709 _keys!1208))))))

(declare-fun b!1161390 () Bool)

(declare-fun res!770560 () Bool)

(assert (=> b!1161390 (=> (not res!770560) (not e!660410))))

(assert (=> b!1161390 (= res!770560 (arrayNoDuplicates!0 lt!522647 #b00000000000000000000000000000000 Nil!25346))))

(declare-fun bm!56419 () Bool)

(declare-fun call!56425 () ListLongMap!16581)

(assert (=> bm!56419 (= call!56425 call!56423)))

(declare-fun b!1161391 () Bool)

(declare-fun e!660408 () Bool)

(assert (=> b!1161391 (= e!660408 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522659) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161392 () Bool)

(declare-fun res!770563 () Bool)

(assert (=> b!1161392 (=> (not res!770563) (not e!660402))))

(assert (=> b!1161392 (= res!770563 (and (= (size!36710 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36709 _keys!1208) (size!36710 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161393 () Bool)

(declare-fun lt!522660 () Unit!38300)

(assert (=> b!1161393 (= e!660403 lt!522660)))

(assert (=> b!1161393 (= lt!522660 call!56421)))

(assert (=> b!1161393 call!56422))

(declare-fun b!1161394 () Bool)

(declare-fun res!770568 () Bool)

(assert (=> b!1161394 (=> (not res!770568) (not e!660402))))

(assert (=> b!1161394 (= res!770568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161395 () Bool)

(declare-fun Unit!38303 () Unit!38300)

(assert (=> b!1161395 (= e!660401 Unit!38303)))

(assert (=> b!1161395 (= lt!522659 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161395 (= c!116018 (and (not lt!522659) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522642 () Unit!38300)

(assert (=> b!1161395 (= lt!522642 e!660407)))

(declare-fun lt!522648 () Unit!38300)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!538 (array!75045 array!75047 (_ BitVec 32) (_ BitVec 32) V!43931 V!43931 (_ BitVec 64) (_ BitVec 32) Int) Unit!38300)

(assert (=> b!1161395 (= lt!522648 (lemmaListMapContainsThenArrayContainsFrom!538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116015 () Bool)

(assert (=> b!1161395 (= c!116015 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770567 () Bool)

(assert (=> b!1161395 (= res!770567 e!660408)))

(assert (=> b!1161395 (=> (not res!770567) (not e!660404))))

(assert (=> b!1161395 e!660404))

(declare-fun lt!522646 () Unit!38300)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75045 (_ BitVec 32) (_ BitVec 32)) Unit!38300)

(assert (=> b!1161395 (= lt!522646 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161395 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25346)))

(declare-fun lt!522661 () Unit!38300)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75045 (_ BitVec 64) (_ BitVec 32) List!25349) Unit!38300)

(assert (=> b!1161395 (= lt!522661 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25346))))

(assert (=> b!1161395 false))

(declare-fun mapIsEmpty!45479 () Bool)

(assert (=> mapIsEmpty!45479 mapRes!45479))

(declare-fun b!1161396 () Bool)

(assert (=> b!1161396 (= e!660408 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161397 () Bool)

(declare-fun Unit!38304 () Unit!38300)

(assert (=> b!1161397 (= e!660401 Unit!38304)))

(declare-fun bm!56420 () Bool)

(assert (=> bm!56420 (= call!56419 (contains!6811 (ite c!116018 lt!522656 call!56425) k0!934))))

(declare-fun bm!56421 () Bool)

(assert (=> bm!56421 (= call!56420 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161398 () Bool)

(assert (=> b!1161398 (= e!660397 e!660399)))

(declare-fun res!770564 () Bool)

(assert (=> b!1161398 (=> res!770564 e!660399)))

(assert (=> b!1161398 (= res!770564 (not (= from!1455 i!673)))))

(declare-fun lt!522658 () ListLongMap!16581)

(assert (=> b!1161398 (= lt!522658 (getCurrentListMapNoExtraKeys!4770 lt!522647 lt!522643 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1161398 (= lt!522643 (array!75048 (store (arr!36174 _values!996) i!673 (ValueCellFull!13842 lt!522652)) (size!36710 _values!996)))))

(declare-fun dynLambda!2767 (Int (_ BitVec 64)) V!43931)

(assert (=> b!1161398 (= lt!522652 (dynLambda!2767 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1161398 (= lt!522663 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56422 () Bool)

(assert (=> bm!56422 (= call!56423 (+!3710 (ite c!116018 lt!522656 lt!522651) (ite c!116018 (tuple2!18613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116017 (tuple2!18613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1161399 () Bool)

(assert (=> b!1161399 (= e!660405 tp_is_empty!29103)))

(assert (= (and start!98968 res!770571) b!1161375))

(assert (= (and b!1161375 res!770562) b!1161392))

(assert (= (and b!1161392 res!770563) b!1161394))

(assert (= (and b!1161394 res!770568) b!1161373))

(assert (= (and b!1161373 res!770570) b!1161389))

(assert (= (and b!1161389 res!770566) b!1161374))

(assert (= (and b!1161374 res!770569) b!1161384))

(assert (= (and b!1161384 res!770561) b!1161385))

(assert (= (and b!1161385 res!770565) b!1161390))

(assert (= (and b!1161390 res!770560) b!1161382))

(assert (= (and b!1161382 (not res!770573)) b!1161398))

(assert (= (and b!1161398 (not res!770564)) b!1161377))

(assert (= (and b!1161377 c!116019) b!1161380))

(assert (= (and b!1161377 (not c!116019)) b!1161376))

(assert (= (or b!1161380 b!1161376) bm!56416))

(assert (= (or b!1161380 b!1161376) bm!56421))

(assert (= (and b!1161377 (not res!770559)) b!1161379))

(assert (= (and b!1161379 c!116016) b!1161395))

(assert (= (and b!1161379 (not c!116016)) b!1161397))

(assert (= (and b!1161395 c!116018) b!1161378))

(assert (= (and b!1161395 (not c!116018)) b!1161371))

(assert (= (and b!1161371 c!116017) b!1161393))

(assert (= (and b!1161371 (not c!116017)) b!1161372))

(assert (= (and b!1161372 c!116020) b!1161383))

(assert (= (and b!1161372 (not c!116020)) b!1161381))

(assert (= (or b!1161393 b!1161383) bm!56418))

(assert (= (or b!1161393 b!1161383) bm!56419))

(assert (= (or b!1161393 b!1161383) bm!56417))

(assert (= (or b!1161378 bm!56417) bm!56420))

(assert (= (or b!1161378 bm!56418) bm!56415))

(assert (= (or b!1161378 bm!56419) bm!56422))

(assert (= (and b!1161395 c!116015) b!1161396))

(assert (= (and b!1161395 (not c!116015)) b!1161391))

(assert (= (and b!1161395 res!770567) b!1161370))

(assert (= (and b!1161379 res!770572) b!1161388))

(assert (= (and b!1161386 condMapEmpty!45479) mapIsEmpty!45479))

(assert (= (and b!1161386 (not condMapEmpty!45479)) mapNonEmpty!45479))

(get-info :version)

(assert (= (and mapNonEmpty!45479 ((_ is ValueCellFull!13842) mapValue!45479)) b!1161387))

(assert (= (and b!1161386 ((_ is ValueCellFull!13842) mapDefault!45479)) b!1161399))

(assert (= start!98968 b!1161386))

(declare-fun b_lambda!19679 () Bool)

(assert (=> (not b_lambda!19679) (not b!1161398)))

(declare-fun t!36912 () Bool)

(declare-fun tb!9385 () Bool)

(assert (=> (and start!98968 (= defaultEntry!1004 defaultEntry!1004) t!36912) tb!9385))

(declare-fun result!19335 () Bool)

(assert (=> tb!9385 (= result!19335 tp_is_empty!29103)))

(assert (=> b!1161398 t!36912))

(declare-fun b_and!39997 () Bool)

(assert (= b_and!39995 (and (=> t!36912 result!19335) b_and!39997)))

(declare-fun m!1070205 () Bool)

(assert (=> bm!56421 m!1070205))

(declare-fun m!1070207 () Bool)

(assert (=> b!1161382 m!1070207))

(declare-fun m!1070209 () Bool)

(assert (=> b!1161382 m!1070209))

(declare-fun m!1070211 () Bool)

(assert (=> b!1161378 m!1070211))

(declare-fun m!1070213 () Bool)

(assert (=> b!1161378 m!1070213))

(declare-fun m!1070215 () Bool)

(assert (=> b!1161378 m!1070215))

(declare-fun m!1070217 () Bool)

(assert (=> b!1161370 m!1070217))

(declare-fun m!1070219 () Bool)

(assert (=> b!1161377 m!1070219))

(declare-fun m!1070221 () Bool)

(assert (=> b!1161377 m!1070221))

(declare-fun m!1070223 () Bool)

(assert (=> bm!56416 m!1070223))

(declare-fun m!1070225 () Bool)

(assert (=> b!1161398 m!1070225))

(declare-fun m!1070227 () Bool)

(assert (=> b!1161398 m!1070227))

(declare-fun m!1070229 () Bool)

(assert (=> b!1161398 m!1070229))

(declare-fun m!1070231 () Bool)

(assert (=> b!1161398 m!1070231))

(declare-fun m!1070233 () Bool)

(assert (=> b!1161395 m!1070233))

(declare-fun m!1070235 () Bool)

(assert (=> b!1161395 m!1070235))

(declare-fun m!1070237 () Bool)

(assert (=> b!1161395 m!1070237))

(declare-fun m!1070239 () Bool)

(assert (=> b!1161395 m!1070239))

(declare-fun m!1070241 () Bool)

(assert (=> b!1161384 m!1070241))

(declare-fun m!1070243 () Bool)

(assert (=> b!1161373 m!1070243))

(declare-fun m!1070245 () Bool)

(assert (=> bm!56420 m!1070245))

(declare-fun m!1070247 () Bool)

(assert (=> start!98968 m!1070247))

(declare-fun m!1070249 () Bool)

(assert (=> start!98968 m!1070249))

(declare-fun m!1070251 () Bool)

(assert (=> b!1161390 m!1070251))

(declare-fun m!1070253 () Bool)

(assert (=> bm!56422 m!1070253))

(declare-fun m!1070255 () Bool)

(assert (=> b!1161374 m!1070255))

(declare-fun m!1070257 () Bool)

(assert (=> mapNonEmpty!45479 m!1070257))

(declare-fun m!1070259 () Bool)

(assert (=> b!1161394 m!1070259))

(declare-fun m!1070261 () Bool)

(assert (=> b!1161375 m!1070261))

(assert (=> b!1161388 m!1070223))

(assert (=> b!1161379 m!1070205))

(declare-fun m!1070263 () Bool)

(assert (=> b!1161379 m!1070263))

(declare-fun m!1070265 () Bool)

(assert (=> b!1161379 m!1070265))

(assert (=> b!1161379 m!1070263))

(declare-fun m!1070267 () Bool)

(assert (=> b!1161379 m!1070267))

(assert (=> b!1161379 m!1070219))

(declare-fun m!1070269 () Bool)

(assert (=> b!1161379 m!1070269))

(assert (=> b!1161379 m!1070219))

(declare-fun m!1070271 () Bool)

(assert (=> b!1161379 m!1070271))

(declare-fun m!1070273 () Bool)

(assert (=> b!1161379 m!1070273))

(assert (=> b!1161379 m!1070219))

(declare-fun m!1070275 () Bool)

(assert (=> b!1161379 m!1070275))

(assert (=> b!1161379 m!1070273))

(assert (=> b!1161396 m!1070217))

(declare-fun m!1070277 () Bool)

(assert (=> bm!56415 m!1070277))

(declare-fun m!1070279 () Bool)

(assert (=> b!1161385 m!1070279))

(declare-fun m!1070281 () Bool)

(assert (=> b!1161385 m!1070281))

(declare-fun m!1070283 () Bool)

(assert (=> b!1161380 m!1070283))

(check-sat (not b!1161385) (not b_next!24573) (not b!1161394) (not start!98968) (not b!1161380) (not b!1161398) (not b!1161373) (not bm!56416) (not b!1161374) (not b!1161396) (not mapNonEmpty!45479) (not b!1161388) (not bm!56422) (not b!1161370) (not bm!56420) (not b!1161390) (not b!1161377) b_and!39997 (not b!1161379) (not b!1161375) (not b_lambda!19679) (not b!1161395) tp_is_empty!29103 (not bm!56415) (not b!1161378) (not bm!56421) (not b!1161382))
(check-sat b_and!39997 (not b_next!24573))

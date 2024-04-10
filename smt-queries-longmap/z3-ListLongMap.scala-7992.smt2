; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98794 () Bool)

(assert start!98794)

(declare-fun b_free!24399 () Bool)

(declare-fun b_next!24399 () Bool)

(assert (=> start!98794 (= b_free!24399 (not b_next!24399))))

(declare-fun tp!85907 () Bool)

(declare-fun b_and!39647 () Bool)

(assert (=> start!98794 (= tp!85907 b_and!39647)))

(declare-fun b!1153366 () Bool)

(declare-datatypes ((Unit!37958 0))(
  ( (Unit!37959) )
))
(declare-fun e!655958 () Unit!37958)

(declare-fun Unit!37960 () Unit!37958)

(assert (=> b!1153366 (= e!655958 Unit!37960)))

(declare-fun b!1153367 () Bool)

(declare-fun e!655969 () Unit!37958)

(declare-fun lt!516900 () Unit!37958)

(assert (=> b!1153367 (= e!655969 lt!516900)))

(declare-fun call!54333 () Unit!37958)

(assert (=> b!1153367 (= lt!516900 call!54333)))

(declare-fun call!54332 () Bool)

(assert (=> b!1153367 call!54332))

(declare-fun mapNonEmpty!45218 () Bool)

(declare-fun mapRes!45218 () Bool)

(declare-fun tp!85908 () Bool)

(declare-fun e!655965 () Bool)

(assert (=> mapNonEmpty!45218 (= mapRes!45218 (and tp!85908 e!655965))))

(declare-fun mapKey!45218 () (_ BitVec 32))

(declare-datatypes ((V!43699 0))(
  ( (V!43700 (val!14521 Int)) )
))
(declare-datatypes ((ValueCell!13755 0))(
  ( (ValueCellFull!13755 (v!17158 V!43699)) (EmptyCell!13755) )
))
(declare-fun mapRest!45218 () (Array (_ BitVec 32) ValueCell!13755))

(declare-fun mapValue!45218 () ValueCell!13755)

(declare-datatypes ((array!74705 0))(
  ( (array!74706 (arr!36003 (Array (_ BitVec 32) ValueCell!13755)) (size!36539 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74705)

(assert (=> mapNonEmpty!45218 (= (arr!36003 _values!996) (store mapRest!45218 mapKey!45218 mapValue!45218))))

(declare-fun b!1153369 () Bool)

(declare-fun res!766650 () Bool)

(declare-fun e!655967 () Bool)

(assert (=> b!1153369 (=> (not res!766650) (not e!655967))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153369 (= res!766650 (validKeyInArray!0 k0!934))))

(declare-fun b!1153370 () Bool)

(declare-fun e!655961 () Bool)

(declare-fun e!655974 () Bool)

(assert (=> b!1153370 (= e!655961 e!655974)))

(declare-fun res!766658 () Bool)

(assert (=> b!1153370 (=> res!766658 e!655974)))

(declare-datatypes ((array!74707 0))(
  ( (array!74708 (arr!36004 (Array (_ BitVec 32) (_ BitVec 64))) (size!36540 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74707)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1153370 (= res!766658 (not (= (select (arr!36004 _keys!1208) from!1455) k0!934)))))

(declare-fun e!655968 () Bool)

(assert (=> b!1153370 e!655968))

(declare-fun c!114449 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153370 (= c!114449 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43699)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43699)

(declare-fun lt!516901 () Unit!37958)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!585 (array!74707 array!74705 (_ BitVec 32) (_ BitVec 32) V!43699 V!43699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37958)

(assert (=> b!1153370 (= lt!516901 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54327 () Bool)

(declare-datatypes ((tuple2!18450 0))(
  ( (tuple2!18451 (_1!9236 (_ BitVec 64)) (_2!9236 V!43699)) )
))
(declare-datatypes ((List!25196 0))(
  ( (Nil!25193) (Cons!25192 (h!26401 tuple2!18450) (t!36587 List!25196)) )
))
(declare-datatypes ((ListLongMap!16419 0))(
  ( (ListLongMap!16420 (toList!8225 List!25196)) )
))
(declare-fun call!54330 () ListLongMap!16419)

(declare-fun call!54336 () ListLongMap!16419)

(assert (=> bm!54327 (= call!54330 call!54336)))

(declare-fun lt!516903 () array!74705)

(declare-fun lt!516910 () array!74707)

(declare-fun lt!516919 () ListLongMap!16419)

(declare-fun b!1153371 () Bool)

(declare-fun e!655960 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4695 (array!74707 array!74705 (_ BitVec 32) (_ BitVec 32) V!43699 V!43699 (_ BitVec 32) Int) ListLongMap!16419)

(assert (=> b!1153371 (= e!655960 (= lt!516919 (getCurrentListMapNoExtraKeys!4695 lt!516910 lt!516903 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1153372 () Bool)

(declare-fun res!766657 () Bool)

(assert (=> b!1153372 (=> (not res!766657) (not e!655967))))

(assert (=> b!1153372 (= res!766657 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36540 _keys!1208))))))

(declare-fun b!1153373 () Bool)

(assert (=> b!1153373 call!54332))

(declare-fun lt!516921 () Unit!37958)

(assert (=> b!1153373 (= lt!516921 call!54333)))

(assert (=> b!1153373 (= e!655958 lt!516921)))

(declare-fun bm!54328 () Bool)

(declare-fun lt!516909 () ListLongMap!16419)

(declare-fun c!114454 () Bool)

(declare-fun c!114453 () Bool)

(declare-fun lt!516915 () ListLongMap!16419)

(declare-fun +!3640 (ListLongMap!16419 tuple2!18450) ListLongMap!16419)

(assert (=> bm!54328 (= call!54336 (+!3640 (ite c!114454 lt!516915 lt!516909) (ite c!114454 (tuple2!18451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114453 (tuple2!18451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1153374 () Bool)

(declare-fun res!766645 () Bool)

(assert (=> b!1153374 (=> (not res!766645) (not e!655967))))

(declare-datatypes ((List!25197 0))(
  ( (Nil!25194) (Cons!25193 (h!26402 (_ BitVec 64)) (t!36588 List!25197)) )
))
(declare-fun arrayNoDuplicates!0 (array!74707 (_ BitVec 32) List!25197) Bool)

(assert (=> b!1153374 (= res!766645 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25194))))

(declare-fun b!1153375 () Bool)

(declare-fun call!54335 () ListLongMap!16419)

(declare-fun call!54334 () ListLongMap!16419)

(assert (=> b!1153375 (= e!655968 (= call!54335 call!54334))))

(declare-fun mapIsEmpty!45218 () Bool)

(assert (=> mapIsEmpty!45218 mapRes!45218))

(declare-fun b!1153376 () Bool)

(declare-fun e!655962 () Unit!37958)

(declare-fun Unit!37961 () Unit!37958)

(assert (=> b!1153376 (= e!655962 Unit!37961)))

(declare-fun e!655963 () Bool)

(declare-fun b!1153377 () Bool)

(declare-fun arrayContainsKey!0 (array!74707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153377 (= e!655963 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153378 () Bool)

(assert (=> b!1153378 (= e!655969 e!655958)))

(declare-fun c!114452 () Bool)

(declare-fun lt!516916 () Bool)

(assert (=> b!1153378 (= c!114452 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516916))))

(declare-fun b!1153379 () Bool)

(declare-fun e!655959 () Bool)

(assert (=> b!1153379 (= e!655967 e!655959)))

(declare-fun res!766649 () Bool)

(assert (=> b!1153379 (=> (not res!766649) (not e!655959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74707 (_ BitVec 32)) Bool)

(assert (=> b!1153379 (= res!766649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516910 mask!1564))))

(assert (=> b!1153379 (= lt!516910 (array!74708 (store (arr!36004 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36540 _keys!1208)))))

(declare-fun b!1153380 () Bool)

(declare-fun res!766653 () Bool)

(assert (=> b!1153380 (=> (not res!766653) (not e!655967))))

(assert (=> b!1153380 (= res!766653 (and (= (size!36539 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36540 _keys!1208) (size!36539 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54329 () Bool)

(assert (=> bm!54329 (= call!54335 (getCurrentListMapNoExtraKeys!4695 lt!516910 lt!516903 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54330 () Bool)

(assert (=> bm!54330 (= call!54334 (getCurrentListMapNoExtraKeys!4695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153381 () Bool)

(declare-fun e!655973 () Bool)

(declare-fun e!655971 () Bool)

(assert (=> b!1153381 (= e!655973 (and e!655971 mapRes!45218))))

(declare-fun condMapEmpty!45218 () Bool)

(declare-fun mapDefault!45218 () ValueCell!13755)

(assert (=> b!1153381 (= condMapEmpty!45218 (= (arr!36003 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13755)) mapDefault!45218)))))

(declare-fun res!766655 () Bool)

(assert (=> start!98794 (=> (not res!766655) (not e!655967))))

(assert (=> start!98794 (= res!766655 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36540 _keys!1208))))))

(assert (=> start!98794 e!655967))

(declare-fun tp_is_empty!28929 () Bool)

(assert (=> start!98794 tp_is_empty!28929))

(declare-fun array_inv!27564 (array!74707) Bool)

(assert (=> start!98794 (array_inv!27564 _keys!1208)))

(assert (=> start!98794 true))

(assert (=> start!98794 tp!85907))

(declare-fun array_inv!27565 (array!74705) Bool)

(assert (=> start!98794 (and (array_inv!27565 _values!996) e!655973)))

(declare-fun b!1153368 () Bool)

(declare-fun contains!6741 (ListLongMap!16419 (_ BitVec 64)) Bool)

(assert (=> b!1153368 (contains!6741 call!54336 k0!934)))

(declare-fun lt!516914 () Unit!37958)

(declare-fun call!54331 () Unit!37958)

(assert (=> b!1153368 (= lt!516914 call!54331)))

(declare-fun call!54337 () Bool)

(assert (=> b!1153368 call!54337))

(assert (=> b!1153368 (= lt!516915 (+!3640 lt!516909 (tuple2!18451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516917 () Unit!37958)

(declare-fun addStillContains!885 (ListLongMap!16419 (_ BitVec 64) V!43699 (_ BitVec 64)) Unit!37958)

(assert (=> b!1153368 (= lt!516917 (addStillContains!885 lt!516909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!655972 () Unit!37958)

(assert (=> b!1153368 (= e!655972 lt!516914)))

(declare-fun bm!54331 () Bool)

(assert (=> bm!54331 (= call!54337 (contains!6741 (ite c!114454 lt!516915 call!54330) k0!934))))

(declare-fun b!1153382 () Bool)

(assert (=> b!1153382 (= c!114453 (and (not lt!516916) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153382 (= e!655972 e!655969)))

(declare-fun e!655970 () Bool)

(declare-fun b!1153383 () Bool)

(assert (=> b!1153383 (= e!655970 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153384 () Bool)

(declare-fun res!766654 () Bool)

(assert (=> b!1153384 (=> (not res!766654) (not e!655959))))

(assert (=> b!1153384 (= res!766654 (arrayNoDuplicates!0 lt!516910 #b00000000000000000000000000000000 Nil!25194))))

(declare-fun b!1153385 () Bool)

(assert (=> b!1153385 (= e!655971 tp_is_empty!28929)))

(declare-fun b!1153386 () Bool)

(declare-fun e!655964 () Bool)

(assert (=> b!1153386 (= e!655964 e!655961)))

(declare-fun res!766652 () Bool)

(assert (=> b!1153386 (=> res!766652 e!655961)))

(assert (=> b!1153386 (= res!766652 (not (= from!1455 i!673)))))

(declare-fun lt!516912 () ListLongMap!16419)

(assert (=> b!1153386 (= lt!516912 (getCurrentListMapNoExtraKeys!4695 lt!516910 lt!516903 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516902 () V!43699)

(assert (=> b!1153386 (= lt!516903 (array!74706 (store (arr!36003 _values!996) i!673 (ValueCellFull!13755 lt!516902)) (size!36539 _values!996)))))

(declare-fun dynLambda!2712 (Int (_ BitVec 64)) V!43699)

(assert (=> b!1153386 (= lt!516902 (dynLambda!2712 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516908 () ListLongMap!16419)

(assert (=> b!1153386 (= lt!516908 (getCurrentListMapNoExtraKeys!4695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153387 () Bool)

(declare-fun -!1350 (ListLongMap!16419 (_ BitVec 64)) ListLongMap!16419)

(assert (=> b!1153387 (= e!655968 (= call!54335 (-!1350 call!54334 k0!934)))))

(declare-fun b!1153388 () Bool)

(declare-fun res!766648 () Bool)

(assert (=> b!1153388 (=> (not res!766648) (not e!655967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153388 (= res!766648 (validMask!0 mask!1564))))

(declare-fun bm!54332 () Bool)

(assert (=> bm!54332 (= call!54333 call!54331)))

(declare-fun b!1153389 () Bool)

(declare-fun res!766647 () Bool)

(assert (=> b!1153389 (=> (not res!766647) (not e!655967))))

(assert (=> b!1153389 (= res!766647 (= (select (arr!36004 _keys!1208) i!673) k0!934))))

(declare-fun b!1153390 () Bool)

(assert (=> b!1153390 (= e!655959 (not e!655964))))

(declare-fun res!766656 () Bool)

(assert (=> b!1153390 (=> res!766656 e!655964)))

(assert (=> b!1153390 (= res!766656 (bvsgt from!1455 i!673))))

(assert (=> b!1153390 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516906 () Unit!37958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74707 (_ BitVec 64) (_ BitVec 32)) Unit!37958)

(assert (=> b!1153390 (= lt!516906 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1153391 () Bool)

(assert (=> b!1153391 (= e!655970 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516916) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1153392 () Bool)

(assert (=> b!1153392 (= e!655965 tp_is_empty!28929)))

(declare-fun bm!54333 () Bool)

(assert (=> bm!54333 (= call!54332 call!54337)))

(declare-fun b!1153393 () Bool)

(assert (=> b!1153393 (= e!655974 true)))

(assert (=> b!1153393 e!655960))

(declare-fun res!766651 () Bool)

(assert (=> b!1153393 (=> (not res!766651) (not e!655960))))

(assert (=> b!1153393 (= res!766651 (= lt!516919 lt!516909))))

(assert (=> b!1153393 (= lt!516919 (-!1350 lt!516908 k0!934))))

(declare-fun lt!516918 () V!43699)

(assert (=> b!1153393 (= (-!1350 (+!3640 lt!516909 (tuple2!18451 (select (arr!36004 _keys!1208) from!1455) lt!516918)) (select (arr!36004 _keys!1208) from!1455)) lt!516909)))

(declare-fun lt!516920 () Unit!37958)

(declare-fun addThenRemoveForNewKeyIsSame!191 (ListLongMap!16419 (_ BitVec 64) V!43699) Unit!37958)

(assert (=> b!1153393 (= lt!516920 (addThenRemoveForNewKeyIsSame!191 lt!516909 (select (arr!36004 _keys!1208) from!1455) lt!516918))))

(declare-fun get!18337 (ValueCell!13755 V!43699) V!43699)

(assert (=> b!1153393 (= lt!516918 (get!18337 (select (arr!36003 _values!996) from!1455) lt!516902))))

(declare-fun lt!516911 () Unit!37958)

(assert (=> b!1153393 (= lt!516911 e!655962)))

(declare-fun c!114451 () Bool)

(assert (=> b!1153393 (= c!114451 (contains!6741 lt!516909 k0!934))))

(assert (=> b!1153393 (= lt!516909 (getCurrentListMapNoExtraKeys!4695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153394 () Bool)

(declare-fun Unit!37962 () Unit!37958)

(assert (=> b!1153394 (= e!655962 Unit!37962)))

(assert (=> b!1153394 (= lt!516916 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153394 (= c!114454 (and (not lt!516916) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516913 () Unit!37958)

(assert (=> b!1153394 (= lt!516913 e!655972)))

(declare-fun lt!516905 () Unit!37958)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!479 (array!74707 array!74705 (_ BitVec 32) (_ BitVec 32) V!43699 V!43699 (_ BitVec 64) (_ BitVec 32) Int) Unit!37958)

(assert (=> b!1153394 (= lt!516905 (lemmaListMapContainsThenArrayContainsFrom!479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114450 () Bool)

(assert (=> b!1153394 (= c!114450 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766644 () Bool)

(assert (=> b!1153394 (= res!766644 e!655970)))

(assert (=> b!1153394 (=> (not res!766644) (not e!655963))))

(assert (=> b!1153394 e!655963))

(declare-fun lt!516904 () Unit!37958)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74707 (_ BitVec 32) (_ BitVec 32)) Unit!37958)

(assert (=> b!1153394 (= lt!516904 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1153394 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25194)))

(declare-fun lt!516907 () Unit!37958)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74707 (_ BitVec 64) (_ BitVec 32) List!25197) Unit!37958)

(assert (=> b!1153394 (= lt!516907 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25194))))

(assert (=> b!1153394 false))

(declare-fun bm!54334 () Bool)

(assert (=> bm!54334 (= call!54331 (addStillContains!885 (ite c!114454 lt!516915 lt!516909) (ite c!114454 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114453 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114454 minValue!944 (ite c!114453 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1153395 () Bool)

(declare-fun res!766646 () Bool)

(assert (=> b!1153395 (=> (not res!766646) (not e!655967))))

(assert (=> b!1153395 (= res!766646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98794 res!766655) b!1153388))

(assert (= (and b!1153388 res!766648) b!1153380))

(assert (= (and b!1153380 res!766653) b!1153395))

(assert (= (and b!1153395 res!766646) b!1153374))

(assert (= (and b!1153374 res!766645) b!1153372))

(assert (= (and b!1153372 res!766657) b!1153369))

(assert (= (and b!1153369 res!766650) b!1153389))

(assert (= (and b!1153389 res!766647) b!1153379))

(assert (= (and b!1153379 res!766649) b!1153384))

(assert (= (and b!1153384 res!766654) b!1153390))

(assert (= (and b!1153390 (not res!766656)) b!1153386))

(assert (= (and b!1153386 (not res!766652)) b!1153370))

(assert (= (and b!1153370 c!114449) b!1153387))

(assert (= (and b!1153370 (not c!114449)) b!1153375))

(assert (= (or b!1153387 b!1153375) bm!54329))

(assert (= (or b!1153387 b!1153375) bm!54330))

(assert (= (and b!1153370 (not res!766658)) b!1153393))

(assert (= (and b!1153393 c!114451) b!1153394))

(assert (= (and b!1153393 (not c!114451)) b!1153376))

(assert (= (and b!1153394 c!114454) b!1153368))

(assert (= (and b!1153394 (not c!114454)) b!1153382))

(assert (= (and b!1153382 c!114453) b!1153367))

(assert (= (and b!1153382 (not c!114453)) b!1153378))

(assert (= (and b!1153378 c!114452) b!1153373))

(assert (= (and b!1153378 (not c!114452)) b!1153366))

(assert (= (or b!1153367 b!1153373) bm!54332))

(assert (= (or b!1153367 b!1153373) bm!54327))

(assert (= (or b!1153367 b!1153373) bm!54333))

(assert (= (or b!1153368 bm!54333) bm!54331))

(assert (= (or b!1153368 bm!54332) bm!54334))

(assert (= (or b!1153368 bm!54327) bm!54328))

(assert (= (and b!1153394 c!114450) b!1153383))

(assert (= (and b!1153394 (not c!114450)) b!1153391))

(assert (= (and b!1153394 res!766644) b!1153377))

(assert (= (and b!1153393 res!766651) b!1153371))

(assert (= (and b!1153381 condMapEmpty!45218) mapIsEmpty!45218))

(assert (= (and b!1153381 (not condMapEmpty!45218)) mapNonEmpty!45218))

(get-info :version)

(assert (= (and mapNonEmpty!45218 ((_ is ValueCellFull!13755) mapValue!45218)) b!1153392))

(assert (= (and b!1153381 ((_ is ValueCellFull!13755) mapDefault!45218)) b!1153385))

(assert (= start!98794 b!1153381))

(declare-fun b_lambda!19505 () Bool)

(assert (=> (not b_lambda!19505) (not b!1153386)))

(declare-fun t!36586 () Bool)

(declare-fun tb!9211 () Bool)

(assert (=> (and start!98794 (= defaultEntry!1004 defaultEntry!1004) t!36586) tb!9211))

(declare-fun result!18987 () Bool)

(assert (=> tb!9211 (= result!18987 tp_is_empty!28929)))

(assert (=> b!1153386 t!36586))

(declare-fun b_and!39649 () Bool)

(assert (= b_and!39647 (and (=> t!36586 result!18987) b_and!39649)))

(declare-fun m!1063225 () Bool)

(assert (=> b!1153379 m!1063225))

(declare-fun m!1063227 () Bool)

(assert (=> b!1153379 m!1063227))

(declare-fun m!1063229 () Bool)

(assert (=> bm!54334 m!1063229))

(declare-fun m!1063231 () Bool)

(assert (=> bm!54331 m!1063231))

(declare-fun m!1063233 () Bool)

(assert (=> b!1153377 m!1063233))

(declare-fun m!1063235 () Bool)

(assert (=> b!1153388 m!1063235))

(declare-fun m!1063237 () Bool)

(assert (=> b!1153374 m!1063237))

(declare-fun m!1063239 () Bool)

(assert (=> b!1153394 m!1063239))

(declare-fun m!1063241 () Bool)

(assert (=> b!1153394 m!1063241))

(declare-fun m!1063243 () Bool)

(assert (=> b!1153394 m!1063243))

(declare-fun m!1063245 () Bool)

(assert (=> b!1153394 m!1063245))

(declare-fun m!1063247 () Bool)

(assert (=> b!1153368 m!1063247))

(declare-fun m!1063249 () Bool)

(assert (=> b!1153368 m!1063249))

(declare-fun m!1063251 () Bool)

(assert (=> b!1153368 m!1063251))

(declare-fun m!1063253 () Bool)

(assert (=> b!1153369 m!1063253))

(declare-fun m!1063255 () Bool)

(assert (=> b!1153393 m!1063255))

(declare-fun m!1063257 () Bool)

(assert (=> b!1153393 m!1063257))

(declare-fun m!1063259 () Bool)

(assert (=> b!1153393 m!1063259))

(declare-fun m!1063261 () Bool)

(assert (=> b!1153393 m!1063261))

(assert (=> b!1153393 m!1063259))

(declare-fun m!1063263 () Bool)

(assert (=> b!1153393 m!1063263))

(assert (=> b!1153393 m!1063257))

(assert (=> b!1153393 m!1063259))

(declare-fun m!1063265 () Bool)

(assert (=> b!1153393 m!1063265))

(declare-fun m!1063267 () Bool)

(assert (=> b!1153393 m!1063267))

(declare-fun m!1063269 () Bool)

(assert (=> b!1153393 m!1063269))

(assert (=> b!1153393 m!1063255))

(declare-fun m!1063271 () Bool)

(assert (=> b!1153393 m!1063271))

(declare-fun m!1063273 () Bool)

(assert (=> mapNonEmpty!45218 m!1063273))

(declare-fun m!1063275 () Bool)

(assert (=> b!1153389 m!1063275))

(declare-fun m!1063277 () Bool)

(assert (=> b!1153384 m!1063277))

(declare-fun m!1063279 () Bool)

(assert (=> b!1153390 m!1063279))

(declare-fun m!1063281 () Bool)

(assert (=> b!1153390 m!1063281))

(declare-fun m!1063283 () Bool)

(assert (=> b!1153371 m!1063283))

(declare-fun m!1063285 () Bool)

(assert (=> b!1153387 m!1063285))

(declare-fun m!1063287 () Bool)

(assert (=> b!1153386 m!1063287))

(declare-fun m!1063289 () Bool)

(assert (=> b!1153386 m!1063289))

(declare-fun m!1063291 () Bool)

(assert (=> b!1153386 m!1063291))

(declare-fun m!1063293 () Bool)

(assert (=> b!1153386 m!1063293))

(declare-fun m!1063295 () Bool)

(assert (=> b!1153395 m!1063295))

(assert (=> bm!54329 m!1063283))

(assert (=> bm!54330 m!1063265))

(declare-fun m!1063297 () Bool)

(assert (=> start!98794 m!1063297))

(declare-fun m!1063299 () Bool)

(assert (=> start!98794 m!1063299))

(assert (=> b!1153383 m!1063233))

(declare-fun m!1063301 () Bool)

(assert (=> bm!54328 m!1063301))

(assert (=> b!1153370 m!1063259))

(declare-fun m!1063303 () Bool)

(assert (=> b!1153370 m!1063303))

(check-sat (not start!98794) (not b!1153383) (not b!1153393) (not b!1153377) (not b!1153388) (not bm!54329) b_and!39649 (not b!1153395) (not bm!54331) (not b!1153387) (not b_lambda!19505) (not b!1153368) (not bm!54328) (not b!1153369) (not b!1153394) (not bm!54330) tp_is_empty!28929 (not b!1153379) (not mapNonEmpty!45218) (not b_next!24399) (not b!1153371) (not b!1153386) (not b!1153370) (not b!1153390) (not bm!54334) (not b!1153384) (not b!1153374))
(check-sat b_and!39649 (not b_next!24399))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98656 () Bool)

(assert start!98656)

(declare-fun b_free!24261 () Bool)

(declare-fun b_next!24261 () Bool)

(assert (=> start!98656 (= b_free!24261 (not b_next!24261))))

(declare-fun tp!85494 () Bool)

(declare-fun b_and!39371 () Bool)

(assert (=> start!98656 (= tp!85494 b_and!39371)))

(declare-fun b!1147018 () Bool)

(declare-fun e!652451 () Bool)

(declare-fun e!652440 () Bool)

(assert (=> b!1147018 (= e!652451 (not e!652440))))

(declare-fun res!763552 () Bool)

(assert (=> b!1147018 (=> res!763552 e!652440)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147018 (= res!763552 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74429 0))(
  ( (array!74430 (arr!35865 (Array (_ BitVec 32) (_ BitVec 64))) (size!36401 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74429)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147018 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37670 0))(
  ( (Unit!37671) )
))
(declare-fun lt!512431 () Unit!37670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74429 (_ BitVec 64) (_ BitVec 32)) Unit!37670)

(assert (=> b!1147018 (= lt!512431 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1147019 () Bool)

(declare-fun e!652444 () Bool)

(assert (=> b!1147019 (= e!652444 e!652451)))

(declare-fun res!763553 () Bool)

(assert (=> b!1147019 (=> (not res!763553) (not e!652451))))

(declare-fun lt!512424 () array!74429)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74429 (_ BitVec 32)) Bool)

(assert (=> b!1147019 (= res!763553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512424 mask!1564))))

(assert (=> b!1147019 (= lt!512424 (array!74430 (store (arr!35865 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36401 _keys!1208)))))

(declare-fun b!1147020 () Bool)

(declare-fun res!763544 () Bool)

(assert (=> b!1147020 (=> (not res!763544) (not e!652444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147020 (= res!763544 (validMask!0 mask!1564))))

(declare-fun b!1147021 () Bool)

(declare-datatypes ((V!43515 0))(
  ( (V!43516 (val!14452 Int)) )
))
(declare-datatypes ((tuple2!18316 0))(
  ( (tuple2!18317 (_1!9169 (_ BitVec 64)) (_2!9169 V!43515)) )
))
(declare-datatypes ((List!25067 0))(
  ( (Nil!25064) (Cons!25063 (h!26272 tuple2!18316) (t!36320 List!25067)) )
))
(declare-datatypes ((ListLongMap!16285 0))(
  ( (ListLongMap!16286 (toList!8158 List!25067)) )
))
(declare-fun call!52681 () ListLongMap!16285)

(declare-fun contains!6682 (ListLongMap!16285 (_ BitVec 64)) Bool)

(assert (=> b!1147021 (contains!6682 call!52681 k0!934)))

(declare-fun lt!512422 () ListLongMap!16285)

(declare-fun minValue!944 () V!43515)

(declare-fun lt!512433 () Unit!37670)

(declare-fun addStillContains!834 (ListLongMap!16285 (_ BitVec 64) V!43515 (_ BitVec 64)) Unit!37670)

(assert (=> b!1147021 (= lt!512433 (addStillContains!834 lt!512422 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!52674 () Bool)

(assert (=> b!1147021 call!52674))

(declare-fun lt!512417 () ListLongMap!16285)

(declare-fun zeroValue!944 () V!43515)

(declare-fun +!3582 (ListLongMap!16285 tuple2!18316) ListLongMap!16285)

(assert (=> b!1147021 (= lt!512422 (+!3582 lt!512417 (tuple2!18317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512430 () Unit!37670)

(declare-fun call!52679 () Unit!37670)

(assert (=> b!1147021 (= lt!512430 call!52679)))

(declare-fun e!652450 () Unit!37670)

(assert (=> b!1147021 (= e!652450 lt!512433)))

(declare-fun b!1147022 () Bool)

(declare-fun res!763546 () Bool)

(assert (=> b!1147022 (=> (not res!763546) (not e!652444))))

(assert (=> b!1147022 (= res!763546 (= (select (arr!35865 _keys!1208) i!673) k0!934))))

(declare-fun b!1147023 () Bool)

(declare-fun e!652439 () Unit!37670)

(declare-fun lt!512420 () Unit!37670)

(assert (=> b!1147023 (= e!652439 lt!512420)))

(declare-fun call!52676 () Unit!37670)

(assert (=> b!1147023 (= lt!512420 call!52676)))

(declare-fun call!52678 () Bool)

(assert (=> b!1147023 call!52678))

(declare-fun b!1147024 () Bool)

(declare-fun e!652447 () Bool)

(declare-fun e!652448 () Bool)

(assert (=> b!1147024 (= e!652447 e!652448)))

(declare-fun res!763543 () Bool)

(assert (=> b!1147024 (=> res!763543 e!652448)))

(assert (=> b!1147024 (= res!763543 (not (= (select (arr!35865 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652442 () Bool)

(assert (=> b!1147024 e!652442))

(declare-fun c!113209 () Bool)

(assert (=> b!1147024 (= c!113209 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13686 0))(
  ( (ValueCellFull!13686 (v!17089 V!43515)) (EmptyCell!13686) )
))
(declare-datatypes ((array!74431 0))(
  ( (array!74432 (arr!35866 (Array (_ BitVec 32) ValueCell!13686)) (size!36402 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74431)

(declare-fun lt!512425 () Unit!37670)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!533 (array!74429 array!74431 (_ BitVec 32) (_ BitVec 32) V!43515 V!43515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37670)

(assert (=> b!1147024 (= lt!512425 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45011 () Bool)

(declare-fun mapRes!45011 () Bool)

(assert (=> mapIsEmpty!45011 mapRes!45011))

(declare-fun b!1147025 () Bool)

(declare-fun call!52675 () ListLongMap!16285)

(declare-fun call!52677 () ListLongMap!16285)

(assert (=> b!1147025 (= e!652442 (= call!52675 call!52677))))

(declare-fun lt!512427 () array!74431)

(declare-fun bm!52671 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4632 (array!74429 array!74431 (_ BitVec 32) (_ BitVec 32) V!43515 V!43515 (_ BitVec 32) Int) ListLongMap!16285)

(assert (=> bm!52671 (= call!52675 (getCurrentListMapNoExtraKeys!4632 lt!512424 lt!512427 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147026 () Bool)

(assert (=> b!1147026 (= e!652448 true)))

(declare-fun e!652449 () Bool)

(assert (=> b!1147026 e!652449))

(declare-fun res!763541 () Bool)

(assert (=> b!1147026 (=> (not res!763541) (not e!652449))))

(declare-fun lt!512413 () V!43515)

(declare-fun -!1295 (ListLongMap!16285 (_ BitVec 64)) ListLongMap!16285)

(assert (=> b!1147026 (= res!763541 (= (-!1295 (+!3582 lt!512417 (tuple2!18317 (select (arr!35865 _keys!1208) from!1455) lt!512413)) (select (arr!35865 _keys!1208) from!1455)) lt!512417))))

(declare-fun lt!512423 () Unit!37670)

(declare-fun addThenRemoveForNewKeyIsSame!143 (ListLongMap!16285 (_ BitVec 64) V!43515) Unit!37670)

(assert (=> b!1147026 (= lt!512423 (addThenRemoveForNewKeyIsSame!143 lt!512417 (select (arr!35865 _keys!1208) from!1455) lt!512413))))

(declare-fun lt!512418 () V!43515)

(declare-fun get!18243 (ValueCell!13686 V!43515) V!43515)

(assert (=> b!1147026 (= lt!512413 (get!18243 (select (arr!35866 _values!996) from!1455) lt!512418))))

(declare-fun lt!512426 () Unit!37670)

(declare-fun e!652443 () Unit!37670)

(assert (=> b!1147026 (= lt!512426 e!652443)))

(declare-fun c!113212 () Bool)

(assert (=> b!1147026 (= c!113212 (contains!6682 lt!512417 k0!934))))

(assert (=> b!1147026 (= lt!512417 (getCurrentListMapNoExtraKeys!4632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147027 () Bool)

(declare-fun res!763542 () Bool)

(assert (=> b!1147027 (=> (not res!763542) (not e!652444))))

(assert (=> b!1147027 (= res!763542 (and (= (size!36402 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36401 _keys!1208) (size!36402 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147028 () Bool)

(declare-fun Unit!37672 () Unit!37670)

(assert (=> b!1147028 (= e!652443 Unit!37672)))

(declare-fun lt!512416 () ListLongMap!16285)

(declare-fun b!1147029 () Bool)

(assert (=> b!1147029 (= e!652449 (= (-!1295 lt!512416 k0!934) lt!512417))))

(declare-fun b!1147030 () Bool)

(declare-fun e!652445 () Bool)

(assert (=> b!1147030 (= e!652445 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!652453 () Bool)

(declare-fun b!1147031 () Bool)

(assert (=> b!1147031 (= e!652453 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147032 () Bool)

(assert (=> b!1147032 (= e!652442 (= call!52675 (-!1295 call!52677 k0!934)))))

(declare-fun mapNonEmpty!45011 () Bool)

(declare-fun tp!85493 () Bool)

(declare-fun e!652455 () Bool)

(assert (=> mapNonEmpty!45011 (= mapRes!45011 (and tp!85493 e!652455))))

(declare-fun mapKey!45011 () (_ BitVec 32))

(declare-fun mapRest!45011 () (Array (_ BitVec 32) ValueCell!13686))

(declare-fun mapValue!45011 () ValueCell!13686)

(assert (=> mapNonEmpty!45011 (= (arr!35866 _values!996) (store mapRest!45011 mapKey!45011 mapValue!45011))))

(declare-fun b!1147033 () Bool)

(declare-fun res!763548 () Bool)

(assert (=> b!1147033 (=> (not res!763548) (not e!652451))))

(declare-datatypes ((List!25068 0))(
  ( (Nil!25065) (Cons!25064 (h!26273 (_ BitVec 64)) (t!36321 List!25068)) )
))
(declare-fun arrayNoDuplicates!0 (array!74429 (_ BitVec 32) List!25068) Bool)

(assert (=> b!1147033 (= res!763548 (arrayNoDuplicates!0 lt!512424 #b00000000000000000000000000000000 Nil!25065))))

(declare-fun call!52680 () ListLongMap!16285)

(declare-fun bm!52672 () Bool)

(declare-fun c!113210 () Bool)

(assert (=> bm!52672 (= call!52674 (contains!6682 (ite c!113210 lt!512422 call!52680) k0!934))))

(declare-fun b!1147034 () Bool)

(declare-fun tp_is_empty!28791 () Bool)

(assert (=> b!1147034 (= e!652455 tp_is_empty!28791)))

(declare-fun bm!52673 () Bool)

(assert (=> bm!52673 (= call!52678 call!52674)))

(declare-fun b!1147035 () Bool)

(declare-fun lt!512415 () Bool)

(assert (=> b!1147035 (= e!652445 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512415) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147036 () Bool)

(declare-fun res!763550 () Bool)

(assert (=> b!1147036 (=> (not res!763550) (not e!652444))))

(assert (=> b!1147036 (= res!763550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun c!113208 () Bool)

(declare-fun bm!52674 () Bool)

(assert (=> bm!52674 (= call!52681 (+!3582 (ite c!113210 lt!512422 lt!512417) (ite c!113210 (tuple2!18317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113208 (tuple2!18317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147037 () Bool)

(declare-fun res!763540 () Bool)

(assert (=> b!1147037 (=> (not res!763540) (not e!652444))))

(assert (=> b!1147037 (= res!763540 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25065))))

(declare-fun b!1147038 () Bool)

(declare-fun Unit!37673 () Unit!37670)

(assert (=> b!1147038 (= e!652443 Unit!37673)))

(assert (=> b!1147038 (= lt!512415 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147038 (= c!113210 (and (not lt!512415) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512421 () Unit!37670)

(assert (=> b!1147038 (= lt!512421 e!652450)))

(declare-fun lt!512414 () Unit!37670)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!427 (array!74429 array!74431 (_ BitVec 32) (_ BitVec 32) V!43515 V!43515 (_ BitVec 64) (_ BitVec 32) Int) Unit!37670)

(assert (=> b!1147038 (= lt!512414 (lemmaListMapContainsThenArrayContainsFrom!427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113207 () Bool)

(assert (=> b!1147038 (= c!113207 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763549 () Bool)

(assert (=> b!1147038 (= res!763549 e!652445)))

(assert (=> b!1147038 (=> (not res!763549) (not e!652453))))

(assert (=> b!1147038 e!652453))

(declare-fun lt!512432 () Unit!37670)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74429 (_ BitVec 32) (_ BitVec 32)) Unit!37670)

(assert (=> b!1147038 (= lt!512432 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147038 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25065)))

(declare-fun lt!512428 () Unit!37670)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74429 (_ BitVec 64) (_ BitVec 32) List!25068) Unit!37670)

(assert (=> b!1147038 (= lt!512428 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25065))))

(assert (=> b!1147038 false))

(declare-fun b!1147039 () Bool)

(assert (=> b!1147039 (= e!652440 e!652447)))

(declare-fun res!763545 () Bool)

(assert (=> b!1147039 (=> res!763545 e!652447)))

(assert (=> b!1147039 (= res!763545 (not (= from!1455 i!673)))))

(declare-fun lt!512419 () ListLongMap!16285)

(assert (=> b!1147039 (= lt!512419 (getCurrentListMapNoExtraKeys!4632 lt!512424 lt!512427 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147039 (= lt!512427 (array!74432 (store (arr!35866 _values!996) i!673 (ValueCellFull!13686 lt!512418)) (size!36402 _values!996)))))

(declare-fun dynLambda!2663 (Int (_ BitVec 64)) V!43515)

(assert (=> b!1147039 (= lt!512418 (dynLambda!2663 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147039 (= lt!512416 (getCurrentListMapNoExtraKeys!4632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147040 () Bool)

(assert (=> b!1147040 call!52678))

(declare-fun lt!512429 () Unit!37670)

(assert (=> b!1147040 (= lt!512429 call!52676)))

(declare-fun e!652441 () Unit!37670)

(assert (=> b!1147040 (= e!652441 lt!512429)))

(declare-fun b!1147041 () Bool)

(assert (=> b!1147041 (= c!113208 (and (not lt!512415) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147041 (= e!652450 e!652439)))

(declare-fun b!1147042 () Bool)

(declare-fun res!763539 () Bool)

(assert (=> b!1147042 (=> (not res!763539) (not e!652444))))

(assert (=> b!1147042 (= res!763539 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36401 _keys!1208))))))

(declare-fun res!763551 () Bool)

(assert (=> start!98656 (=> (not res!763551) (not e!652444))))

(assert (=> start!98656 (= res!763551 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36401 _keys!1208))))))

(assert (=> start!98656 e!652444))

(assert (=> start!98656 tp_is_empty!28791))

(declare-fun array_inv!27472 (array!74429) Bool)

(assert (=> start!98656 (array_inv!27472 _keys!1208)))

(assert (=> start!98656 true))

(assert (=> start!98656 tp!85494))

(declare-fun e!652452 () Bool)

(declare-fun array_inv!27473 (array!74431) Bool)

(assert (=> start!98656 (and (array_inv!27473 _values!996) e!652452)))

(declare-fun bm!52675 () Bool)

(assert (=> bm!52675 (= call!52680 call!52681)))

(declare-fun b!1147043 () Bool)

(declare-fun res!763547 () Bool)

(assert (=> b!1147043 (=> (not res!763547) (not e!652444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147043 (= res!763547 (validKeyInArray!0 k0!934))))

(declare-fun b!1147044 () Bool)

(assert (=> b!1147044 (= e!652439 e!652441)))

(declare-fun c!113211 () Bool)

(assert (=> b!1147044 (= c!113211 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512415))))

(declare-fun b!1147045 () Bool)

(declare-fun e!652446 () Bool)

(assert (=> b!1147045 (= e!652452 (and e!652446 mapRes!45011))))

(declare-fun condMapEmpty!45011 () Bool)

(declare-fun mapDefault!45011 () ValueCell!13686)

(assert (=> b!1147045 (= condMapEmpty!45011 (= (arr!35866 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13686)) mapDefault!45011)))))

(declare-fun b!1147046 () Bool)

(declare-fun Unit!37674 () Unit!37670)

(assert (=> b!1147046 (= e!652441 Unit!37674)))

(declare-fun bm!52676 () Bool)

(assert (=> bm!52676 (= call!52677 (getCurrentListMapNoExtraKeys!4632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52677 () Bool)

(assert (=> bm!52677 (= call!52679 (addStillContains!834 lt!512417 (ite (or c!113210 c!113208) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113210 c!113208) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!52678 () Bool)

(assert (=> bm!52678 (= call!52676 call!52679)))

(declare-fun b!1147047 () Bool)

(assert (=> b!1147047 (= e!652446 tp_is_empty!28791)))

(assert (= (and start!98656 res!763551) b!1147020))

(assert (= (and b!1147020 res!763544) b!1147027))

(assert (= (and b!1147027 res!763542) b!1147036))

(assert (= (and b!1147036 res!763550) b!1147037))

(assert (= (and b!1147037 res!763540) b!1147042))

(assert (= (and b!1147042 res!763539) b!1147043))

(assert (= (and b!1147043 res!763547) b!1147022))

(assert (= (and b!1147022 res!763546) b!1147019))

(assert (= (and b!1147019 res!763553) b!1147033))

(assert (= (and b!1147033 res!763548) b!1147018))

(assert (= (and b!1147018 (not res!763552)) b!1147039))

(assert (= (and b!1147039 (not res!763545)) b!1147024))

(assert (= (and b!1147024 c!113209) b!1147032))

(assert (= (and b!1147024 (not c!113209)) b!1147025))

(assert (= (or b!1147032 b!1147025) bm!52676))

(assert (= (or b!1147032 b!1147025) bm!52671))

(assert (= (and b!1147024 (not res!763543)) b!1147026))

(assert (= (and b!1147026 c!113212) b!1147038))

(assert (= (and b!1147026 (not c!113212)) b!1147028))

(assert (= (and b!1147038 c!113210) b!1147021))

(assert (= (and b!1147038 (not c!113210)) b!1147041))

(assert (= (and b!1147041 c!113208) b!1147023))

(assert (= (and b!1147041 (not c!113208)) b!1147044))

(assert (= (and b!1147044 c!113211) b!1147040))

(assert (= (and b!1147044 (not c!113211)) b!1147046))

(assert (= (or b!1147023 b!1147040) bm!52678))

(assert (= (or b!1147023 b!1147040) bm!52675))

(assert (= (or b!1147023 b!1147040) bm!52673))

(assert (= (or b!1147021 bm!52673) bm!52672))

(assert (= (or b!1147021 bm!52678) bm!52677))

(assert (= (or b!1147021 bm!52675) bm!52674))

(assert (= (and b!1147038 c!113207) b!1147030))

(assert (= (and b!1147038 (not c!113207)) b!1147035))

(assert (= (and b!1147038 res!763549) b!1147031))

(assert (= (and b!1147026 res!763541) b!1147029))

(assert (= (and b!1147045 condMapEmpty!45011) mapIsEmpty!45011))

(assert (= (and b!1147045 (not condMapEmpty!45011)) mapNonEmpty!45011))

(get-info :version)

(assert (= (and mapNonEmpty!45011 ((_ is ValueCellFull!13686) mapValue!45011)) b!1147034))

(assert (= (and b!1147045 ((_ is ValueCellFull!13686) mapDefault!45011)) b!1147047))

(assert (= start!98656 b!1147045))

(declare-fun b_lambda!19367 () Bool)

(assert (=> (not b_lambda!19367) (not b!1147039)))

(declare-fun t!36319 () Bool)

(declare-fun tb!9073 () Bool)

(assert (=> (and start!98656 (= defaultEntry!1004 defaultEntry!1004) t!36319) tb!9073))

(declare-fun result!18711 () Bool)

(assert (=> tb!9073 (= result!18711 tp_is_empty!28791)))

(assert (=> b!1147039 t!36319))

(declare-fun b_and!39373 () Bool)

(assert (= b_and!39371 (and (=> t!36319 result!18711) b_and!39373)))

(declare-fun m!1057701 () Bool)

(assert (=> b!1147024 m!1057701))

(declare-fun m!1057703 () Bool)

(assert (=> b!1147024 m!1057703))

(declare-fun m!1057705 () Bool)

(assert (=> bm!52672 m!1057705))

(declare-fun m!1057707 () Bool)

(assert (=> b!1147037 m!1057707))

(declare-fun m!1057709 () Bool)

(assert (=> start!98656 m!1057709))

(declare-fun m!1057711 () Bool)

(assert (=> start!98656 m!1057711))

(declare-fun m!1057713 () Bool)

(assert (=> b!1147020 m!1057713))

(declare-fun m!1057715 () Bool)

(assert (=> b!1147019 m!1057715))

(declare-fun m!1057717 () Bool)

(assert (=> b!1147019 m!1057717))

(declare-fun m!1057719 () Bool)

(assert (=> mapNonEmpty!45011 m!1057719))

(declare-fun m!1057721 () Bool)

(assert (=> bm!52674 m!1057721))

(declare-fun m!1057723 () Bool)

(assert (=> bm!52671 m!1057723))

(declare-fun m!1057725 () Bool)

(assert (=> b!1147022 m!1057725))

(declare-fun m!1057727 () Bool)

(assert (=> b!1147043 m!1057727))

(declare-fun m!1057729 () Bool)

(assert (=> b!1147038 m!1057729))

(declare-fun m!1057731 () Bool)

(assert (=> b!1147038 m!1057731))

(declare-fun m!1057733 () Bool)

(assert (=> b!1147038 m!1057733))

(declare-fun m!1057735 () Bool)

(assert (=> b!1147038 m!1057735))

(declare-fun m!1057737 () Bool)

(assert (=> b!1147031 m!1057737))

(declare-fun m!1057739 () Bool)

(assert (=> bm!52676 m!1057739))

(declare-fun m!1057741 () Bool)

(assert (=> bm!52677 m!1057741))

(declare-fun m!1057743 () Bool)

(assert (=> b!1147039 m!1057743))

(declare-fun m!1057745 () Bool)

(assert (=> b!1147039 m!1057745))

(declare-fun m!1057747 () Bool)

(assert (=> b!1147039 m!1057747))

(declare-fun m!1057749 () Bool)

(assert (=> b!1147039 m!1057749))

(assert (=> b!1147030 m!1057737))

(declare-fun m!1057751 () Bool)

(assert (=> b!1147029 m!1057751))

(assert (=> b!1147026 m!1057739))

(declare-fun m!1057753 () Bool)

(assert (=> b!1147026 m!1057753))

(declare-fun m!1057755 () Bool)

(assert (=> b!1147026 m!1057755))

(assert (=> b!1147026 m!1057701))

(declare-fun m!1057757 () Bool)

(assert (=> b!1147026 m!1057757))

(assert (=> b!1147026 m!1057753))

(declare-fun m!1057759 () Bool)

(assert (=> b!1147026 m!1057759))

(assert (=> b!1147026 m!1057701))

(assert (=> b!1147026 m!1057755))

(declare-fun m!1057761 () Bool)

(assert (=> b!1147026 m!1057761))

(assert (=> b!1147026 m!1057701))

(declare-fun m!1057763 () Bool)

(assert (=> b!1147026 m!1057763))

(declare-fun m!1057765 () Bool)

(assert (=> b!1147021 m!1057765))

(declare-fun m!1057767 () Bool)

(assert (=> b!1147021 m!1057767))

(declare-fun m!1057769 () Bool)

(assert (=> b!1147021 m!1057769))

(declare-fun m!1057771 () Bool)

(assert (=> b!1147036 m!1057771))

(declare-fun m!1057773 () Bool)

(assert (=> b!1147032 m!1057773))

(declare-fun m!1057775 () Bool)

(assert (=> b!1147018 m!1057775))

(declare-fun m!1057777 () Bool)

(assert (=> b!1147018 m!1057777))

(declare-fun m!1057779 () Bool)

(assert (=> b!1147033 m!1057779))

(check-sat (not b!1147019) (not b!1147043) (not b_next!24261) (not mapNonEmpty!45011) (not b!1147030) (not b!1147024) b_and!39373 (not b!1147039) (not b!1147032) (not start!98656) (not bm!52676) (not bm!52672) (not b!1147021) (not bm!52677) (not b!1147031) (not bm!52671) (not b!1147037) (not b!1147033) (not b!1147038) (not bm!52674) (not b!1147029) (not b!1147036) (not b_lambda!19367) (not b!1147026) tp_is_empty!28791 (not b!1147020) (not b!1147018))
(check-sat b_and!39373 (not b_next!24261))

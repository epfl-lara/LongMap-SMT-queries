; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101402 () Bool)

(assert start!101402)

(declare-fun b_free!26089 () Bool)

(declare-fun b_next!26089 () Bool)

(assert (=> start!101402 (= b_free!26089 (not b_next!26089))))

(declare-fun tp!91288 () Bool)

(declare-fun b_and!43297 () Bool)

(assert (=> start!101402 (= tp!91288 b_and!43297)))

(declare-fun b!1215407 () Bool)

(declare-fun res!806585 () Bool)

(declare-fun e!690341 () Bool)

(assert (=> b!1215407 (=> (not res!806585) (not e!690341))))

(declare-datatypes ((array!78407 0))(
  ( (array!78408 (arr!37832 (Array (_ BitVec 32) (_ BitVec 64))) (size!38369 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78407)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78407 (_ BitVec 32)) Bool)

(assert (=> b!1215407 (= res!806585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!46185 0))(
  ( (V!46186 (val!15453 Int)) )
))
(declare-fun zeroValue!944 () V!46185)

(declare-datatypes ((Unit!40232 0))(
  ( (Unit!40233) )
))
(declare-fun call!60617 () Unit!40232)

(declare-fun c!120405 () Bool)

(declare-datatypes ((tuple2!19880 0))(
  ( (tuple2!19881 (_1!9951 (_ BitVec 64)) (_2!9951 V!46185)) )
))
(declare-datatypes ((List!26682 0))(
  ( (Nil!26679) (Cons!26678 (h!27896 tuple2!19880) (t!39743 List!26682)) )
))
(declare-datatypes ((ListLongMap!17857 0))(
  ( (ListLongMap!17858 (toList!8944 List!26682)) )
))
(declare-fun lt!552647 () ListLongMap!17857)

(declare-fun c!120410 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!552652 () ListLongMap!17857)

(declare-fun minValue!944 () V!46185)

(declare-fun bm!60613 () Bool)

(declare-fun addStillContains!1081 (ListLongMap!17857 (_ BitVec 64) V!46185 (_ BitVec 64)) Unit!40232)

(assert (=> bm!60613 (= call!60617 (addStillContains!1081 (ite c!120410 lt!552652 lt!552647) (ite c!120410 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120405 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120410 minValue!944 (ite c!120405 zeroValue!944 minValue!944)) k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!690330 () Bool)

(declare-fun b!1215408 () Bool)

(declare-fun lt!552644 () Bool)

(assert (=> b!1215408 (= e!690330 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552644) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60614 () Bool)

(declare-fun call!60623 () Bool)

(declare-fun call!60618 () Bool)

(assert (=> bm!60614 (= call!60623 call!60618)))

(declare-fun b!1215409 () Bool)

(declare-fun res!806579 () Bool)

(declare-fun e!690337 () Bool)

(assert (=> b!1215409 (=> (not res!806579) (not e!690337))))

(declare-fun lt!552654 () array!78407)

(declare-datatypes ((List!26683 0))(
  ( (Nil!26680) (Cons!26679 (h!27897 (_ BitVec 64)) (t!39744 List!26683)) )
))
(declare-fun arrayNoDuplicates!0 (array!78407 (_ BitVec 32) List!26683) Bool)

(assert (=> b!1215409 (= res!806579 (arrayNoDuplicates!0 lt!552654 #b00000000000000000000000000000000 Nil!26680))))

(declare-fun b!1215410 () Bool)

(declare-fun res!806582 () Bool)

(assert (=> b!1215410 (=> (not res!806582) (not e!690341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215410 (= res!806582 (validKeyInArray!0 k0!934))))

(declare-fun b!1215411 () Bool)

(declare-fun e!690331 () Bool)

(declare-fun call!60616 () ListLongMap!17857)

(declare-fun call!60622 () ListLongMap!17857)

(assert (=> b!1215411 (= e!690331 (= call!60616 call!60622))))

(declare-fun b!1215412 () Bool)

(assert (=> b!1215412 (= c!120405 (and (not lt!552644) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!690334 () Unit!40232)

(declare-fun e!690328 () Unit!40232)

(assert (=> b!1215412 (= e!690334 e!690328)))

(declare-fun b!1215413 () Bool)

(declare-fun e!690329 () Bool)

(declare-fun tp_is_empty!30793 () Bool)

(assert (=> b!1215413 (= e!690329 tp_is_empty!30793)))

(declare-fun b!1215414 () Bool)

(declare-fun e!690336 () Unit!40232)

(declare-fun Unit!40234 () Unit!40232)

(assert (=> b!1215414 (= e!690336 Unit!40234)))

(assert (=> b!1215414 (= lt!552644 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1215414 (= c!120410 (and (not lt!552644) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552658 () Unit!40232)

(assert (=> b!1215414 (= lt!552658 e!690334)))

(declare-fun lt!552639 () Unit!40232)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14687 0))(
  ( (ValueCellFull!14687 (v!18102 V!46185)) (EmptyCell!14687) )
))
(declare-datatypes ((array!78409 0))(
  ( (array!78410 (arr!37833 (Array (_ BitVec 32) ValueCell!14687)) (size!38370 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78409)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!627 (array!78407 array!78409 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 64) (_ BitVec 32) Int) Unit!40232)

(assert (=> b!1215414 (= lt!552639 (lemmaListMapContainsThenArrayContainsFrom!627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120409 () Bool)

(assert (=> b!1215414 (= c!120409 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806590 () Bool)

(assert (=> b!1215414 (= res!806590 e!690330)))

(declare-fun e!690339 () Bool)

(assert (=> b!1215414 (=> (not res!806590) (not e!690339))))

(assert (=> b!1215414 e!690339))

(declare-fun lt!552641 () Unit!40232)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78407 (_ BitVec 32) (_ BitVec 32)) Unit!40232)

(assert (=> b!1215414 (= lt!552641 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1215414 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26680)))

(declare-fun lt!552643 () Unit!40232)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78407 (_ BitVec 64) (_ BitVec 32) List!26683) Unit!40232)

(assert (=> b!1215414 (= lt!552643 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26680))))

(assert (=> b!1215414 false))

(declare-fun bm!60615 () Bool)

(declare-fun call!60620 () Unit!40232)

(assert (=> bm!60615 (= call!60620 call!60617)))

(declare-fun bm!60616 () Bool)

(declare-fun lt!552657 () array!78409)

(declare-fun c!120406 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5402 (array!78407 array!78409 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 32) Int) ListLongMap!17857)

(assert (=> bm!60616 (= call!60616 (getCurrentListMapNoExtraKeys!5402 (ite c!120406 _keys!1208 lt!552654) (ite c!120406 _values!996 lt!552657) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60619 () ListLongMap!17857)

(declare-fun bm!60617 () Bool)

(declare-fun +!4099 (ListLongMap!17857 tuple2!19880) ListLongMap!17857)

(assert (=> bm!60617 (= call!60619 (+!4099 (ite c!120410 lt!552652 lt!552647) (ite c!120410 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120405 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1215415 () Bool)

(declare-fun res!806583 () Bool)

(assert (=> b!1215415 (=> (not res!806583) (not e!690341))))

(assert (=> b!1215415 (= res!806583 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26680))))

(declare-fun b!1215416 () Bool)

(declare-fun e!690343 () Unit!40232)

(declare-fun Unit!40235 () Unit!40232)

(assert (=> b!1215416 (= e!690343 Unit!40235)))

(declare-fun b!1215417 () Bool)

(assert (=> b!1215417 (= e!690328 e!690343)))

(declare-fun c!120407 () Bool)

(assert (=> b!1215417 (= c!120407 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552644))))

(declare-fun b!1215418 () Bool)

(declare-fun res!806580 () Bool)

(assert (=> b!1215418 (=> (not res!806580) (not e!690341))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215418 (= res!806580 (= (select (arr!37832 _keys!1208) i!673) k0!934))))

(declare-fun b!1215419 () Bool)

(declare-fun e!690340 () Bool)

(declare-fun e!690327 () Bool)

(assert (=> b!1215419 (= e!690340 e!690327)))

(declare-fun res!806584 () Bool)

(assert (=> b!1215419 (=> res!806584 e!690327)))

(assert (=> b!1215419 (= res!806584 (not (= from!1455 i!673)))))

(declare-fun lt!552653 () ListLongMap!17857)

(assert (=> b!1215419 (= lt!552653 (getCurrentListMapNoExtraKeys!5402 lt!552654 lt!552657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552648 () V!46185)

(assert (=> b!1215419 (= lt!552657 (array!78410 (store (arr!37833 _values!996) i!673 (ValueCellFull!14687 lt!552648)) (size!38370 _values!996)))))

(declare-fun dynLambda!3315 (Int (_ BitVec 64)) V!46185)

(assert (=> b!1215419 (= lt!552648 (dynLambda!3315 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!552649 () ListLongMap!17857)

(assert (=> b!1215419 (= lt!552649 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215420 () Bool)

(declare-fun res!806586 () Bool)

(assert (=> b!1215420 (=> (not res!806586) (not e!690341))))

(assert (=> b!1215420 (= res!806586 (and (= (size!38370 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38369 _keys!1208) (size!38370 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215421 () Bool)

(declare-fun e!690335 () Bool)

(declare-fun e!690333 () Bool)

(declare-fun mapRes!48064 () Bool)

(assert (=> b!1215421 (= e!690335 (and e!690333 mapRes!48064))))

(declare-fun condMapEmpty!48064 () Bool)

(declare-fun mapDefault!48064 () ValueCell!14687)

(assert (=> b!1215421 (= condMapEmpty!48064 (= (arr!37833 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14687)) mapDefault!48064)))))

(declare-fun b!1215422 () Bool)

(declare-fun arrayContainsKey!0 (array!78407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215422 (= e!690330 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1215423 () Bool)

(declare-fun Unit!40236 () Unit!40232)

(assert (=> b!1215423 (= e!690336 Unit!40236)))

(declare-fun bm!60618 () Bool)

(assert (=> bm!60618 (= call!60622 (getCurrentListMapNoExtraKeys!5402 (ite c!120406 lt!552654 _keys!1208) (ite c!120406 lt!552657 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1215424 () Bool)

(declare-fun res!806589 () Bool)

(assert (=> b!1215424 (=> (not res!806589) (not e!690341))))

(assert (=> b!1215424 (= res!806589 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38369 _keys!1208))))))

(declare-fun b!1215425 () Bool)

(declare-fun lt!552642 () ListLongMap!17857)

(declare-fun e!690342 () Bool)

(assert (=> b!1215425 (= e!690342 (= lt!552642 (getCurrentListMapNoExtraKeys!5402 lt!552654 lt!552657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!60621 () ListLongMap!17857)

(declare-fun bm!60619 () Bool)

(declare-fun contains!7038 (ListLongMap!17857 (_ BitVec 64)) Bool)

(assert (=> bm!60619 (= call!60618 (contains!7038 (ite c!120410 lt!552652 call!60621) k0!934))))

(declare-fun b!1215426 () Bool)

(assert (=> b!1215426 (= e!690341 e!690337)))

(declare-fun res!806578 () Bool)

(assert (=> b!1215426 (=> (not res!806578) (not e!690337))))

(assert (=> b!1215426 (= res!806578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552654 mask!1564))))

(assert (=> b!1215426 (= lt!552654 (array!78408 (store (arr!37832 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38369 _keys!1208)))))

(declare-fun b!1215427 () Bool)

(assert (=> b!1215427 (contains!7038 call!60619 k0!934)))

(declare-fun lt!552645 () Unit!40232)

(assert (=> b!1215427 (= lt!552645 call!60617)))

(assert (=> b!1215427 call!60618))

(assert (=> b!1215427 (= lt!552652 (+!4099 lt!552647 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!552655 () Unit!40232)

(assert (=> b!1215427 (= lt!552655 (addStillContains!1081 lt!552647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1215427 (= e!690334 lt!552645)))

(declare-fun b!1215428 () Bool)

(assert (=> b!1215428 (= e!690333 tp_is_empty!30793)))

(declare-fun b!1215429 () Bool)

(declare-fun res!806587 () Bool)

(assert (=> b!1215429 (=> (not res!806587) (not e!690341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215429 (= res!806587 (validMask!0 mask!1564))))

(declare-fun b!1215430 () Bool)

(declare-fun e!690332 () Bool)

(assert (=> b!1215430 (= e!690332 (or (not (= lt!552642 lt!552653)) (= lt!552653 lt!552642)))))

(assert (=> b!1215430 e!690342))

(declare-fun res!806576 () Bool)

(assert (=> b!1215430 (=> (not res!806576) (not e!690342))))

(assert (=> b!1215430 (= res!806576 (= lt!552642 lt!552647))))

(declare-fun -!1866 (ListLongMap!17857 (_ BitVec 64)) ListLongMap!17857)

(assert (=> b!1215430 (= lt!552642 (-!1866 lt!552649 k0!934))))

(declare-fun lt!552659 () V!46185)

(assert (=> b!1215430 (= (-!1866 (+!4099 lt!552647 (tuple2!19881 (select (arr!37832 _keys!1208) from!1455) lt!552659)) (select (arr!37832 _keys!1208) from!1455)) lt!552647)))

(declare-fun lt!552650 () Unit!40232)

(declare-fun addThenRemoveForNewKeyIsSame!291 (ListLongMap!17857 (_ BitVec 64) V!46185) Unit!40232)

(assert (=> b!1215430 (= lt!552650 (addThenRemoveForNewKeyIsSame!291 lt!552647 (select (arr!37832 _keys!1208) from!1455) lt!552659))))

(declare-fun get!19334 (ValueCell!14687 V!46185) V!46185)

(assert (=> b!1215430 (= lt!552659 (get!19334 (select (arr!37833 _values!996) from!1455) lt!552648))))

(declare-fun lt!552646 () Unit!40232)

(assert (=> b!1215430 (= lt!552646 e!690336)))

(declare-fun c!120408 () Bool)

(assert (=> b!1215430 (= c!120408 (contains!7038 lt!552647 k0!934))))

(assert (=> b!1215430 (= lt!552647 (getCurrentListMapNoExtraKeys!5402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1215431 () Bool)

(assert (=> b!1215431 (= e!690339 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!806577 () Bool)

(assert (=> start!101402 (=> (not res!806577) (not e!690341))))

(assert (=> start!101402 (= res!806577 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38369 _keys!1208))))))

(assert (=> start!101402 e!690341))

(assert (=> start!101402 tp_is_empty!30793))

(declare-fun array_inv!28872 (array!78407) Bool)

(assert (=> start!101402 (array_inv!28872 _keys!1208)))

(assert (=> start!101402 true))

(assert (=> start!101402 tp!91288))

(declare-fun array_inv!28873 (array!78409) Bool)

(assert (=> start!101402 (and (array_inv!28873 _values!996) e!690335)))

(declare-fun mapNonEmpty!48064 () Bool)

(declare-fun tp!91289 () Bool)

(assert (=> mapNonEmpty!48064 (= mapRes!48064 (and tp!91289 e!690329))))

(declare-fun mapValue!48064 () ValueCell!14687)

(declare-fun mapKey!48064 () (_ BitVec 32))

(declare-fun mapRest!48064 () (Array (_ BitVec 32) ValueCell!14687))

(assert (=> mapNonEmpty!48064 (= (arr!37833 _values!996) (store mapRest!48064 mapKey!48064 mapValue!48064))))

(declare-fun b!1215432 () Bool)

(assert (=> b!1215432 (= e!690327 e!690332)))

(declare-fun res!806588 () Bool)

(assert (=> b!1215432 (=> res!806588 e!690332)))

(assert (=> b!1215432 (= res!806588 (not (= (select (arr!37832 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1215432 e!690331))

(assert (=> b!1215432 (= c!120406 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!552640 () Unit!40232)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1080 (array!78407 array!78409 (_ BitVec 32) (_ BitVec 32) V!46185 V!46185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40232)

(assert (=> b!1215432 (= lt!552640 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1080 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60620 () Bool)

(assert (=> bm!60620 (= call!60621 call!60619)))

(declare-fun mapIsEmpty!48064 () Bool)

(assert (=> mapIsEmpty!48064 mapRes!48064))

(declare-fun b!1215433 () Bool)

(assert (=> b!1215433 (= e!690331 (= call!60622 (-!1866 call!60616 k0!934)))))

(declare-fun b!1215434 () Bool)

(assert (=> b!1215434 call!60623))

(declare-fun lt!552651 () Unit!40232)

(assert (=> b!1215434 (= lt!552651 call!60620)))

(assert (=> b!1215434 (= e!690343 lt!552651)))

(declare-fun b!1215435 () Bool)

(assert (=> b!1215435 (= e!690337 (not e!690340))))

(declare-fun res!806581 () Bool)

(assert (=> b!1215435 (=> res!806581 e!690340)))

(assert (=> b!1215435 (= res!806581 (bvsgt from!1455 i!673))))

(assert (=> b!1215435 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552660 () Unit!40232)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78407 (_ BitVec 64) (_ BitVec 32)) Unit!40232)

(assert (=> b!1215435 (= lt!552660 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215436 () Bool)

(declare-fun lt!552656 () Unit!40232)

(assert (=> b!1215436 (= e!690328 lt!552656)))

(assert (=> b!1215436 (= lt!552656 call!60620)))

(assert (=> b!1215436 call!60623))

(assert (= (and start!101402 res!806577) b!1215429))

(assert (= (and b!1215429 res!806587) b!1215420))

(assert (= (and b!1215420 res!806586) b!1215407))

(assert (= (and b!1215407 res!806585) b!1215415))

(assert (= (and b!1215415 res!806583) b!1215424))

(assert (= (and b!1215424 res!806589) b!1215410))

(assert (= (and b!1215410 res!806582) b!1215418))

(assert (= (and b!1215418 res!806580) b!1215426))

(assert (= (and b!1215426 res!806578) b!1215409))

(assert (= (and b!1215409 res!806579) b!1215435))

(assert (= (and b!1215435 (not res!806581)) b!1215419))

(assert (= (and b!1215419 (not res!806584)) b!1215432))

(assert (= (and b!1215432 c!120406) b!1215433))

(assert (= (and b!1215432 (not c!120406)) b!1215411))

(assert (= (or b!1215433 b!1215411) bm!60616))

(assert (= (or b!1215433 b!1215411) bm!60618))

(assert (= (and b!1215432 (not res!806588)) b!1215430))

(assert (= (and b!1215430 c!120408) b!1215414))

(assert (= (and b!1215430 (not c!120408)) b!1215423))

(assert (= (and b!1215414 c!120410) b!1215427))

(assert (= (and b!1215414 (not c!120410)) b!1215412))

(assert (= (and b!1215412 c!120405) b!1215436))

(assert (= (and b!1215412 (not c!120405)) b!1215417))

(assert (= (and b!1215417 c!120407) b!1215434))

(assert (= (and b!1215417 (not c!120407)) b!1215416))

(assert (= (or b!1215436 b!1215434) bm!60615))

(assert (= (or b!1215436 b!1215434) bm!60620))

(assert (= (or b!1215436 b!1215434) bm!60614))

(assert (= (or b!1215427 bm!60614) bm!60619))

(assert (= (or b!1215427 bm!60615) bm!60613))

(assert (= (or b!1215427 bm!60620) bm!60617))

(assert (= (and b!1215414 c!120409) b!1215422))

(assert (= (and b!1215414 (not c!120409)) b!1215408))

(assert (= (and b!1215414 res!806590) b!1215431))

(assert (= (and b!1215430 res!806576) b!1215425))

(assert (= (and b!1215421 condMapEmpty!48064) mapIsEmpty!48064))

(assert (= (and b!1215421 (not condMapEmpty!48064)) mapNonEmpty!48064))

(get-info :version)

(assert (= (and mapNonEmpty!48064 ((_ is ValueCellFull!14687) mapValue!48064)) b!1215413))

(assert (= (and b!1215421 ((_ is ValueCellFull!14687) mapDefault!48064)) b!1215428))

(assert (= start!101402 b!1215421))

(declare-fun b_lambda!21759 () Bool)

(assert (=> (not b_lambda!21759) (not b!1215419)))

(declare-fun t!39742 () Bool)

(declare-fun tb!10881 () Bool)

(assert (=> (and start!101402 (= defaultEntry!1004 defaultEntry!1004) t!39742) tb!10881))

(declare-fun result!22367 () Bool)

(assert (=> tb!10881 (= result!22367 tp_is_empty!30793)))

(assert (=> b!1215419 t!39742))

(declare-fun b_and!43299 () Bool)

(assert (= b_and!43297 (and (=> t!39742 result!22367) b_and!43299)))

(declare-fun m!1120925 () Bool)

(assert (=> bm!60619 m!1120925))

(declare-fun m!1120927 () Bool)

(assert (=> b!1215414 m!1120927))

(declare-fun m!1120929 () Bool)

(assert (=> b!1215414 m!1120929))

(declare-fun m!1120931 () Bool)

(assert (=> b!1215414 m!1120931))

(declare-fun m!1120933 () Bool)

(assert (=> b!1215414 m!1120933))

(declare-fun m!1120935 () Bool)

(assert (=> b!1215433 m!1120935))

(declare-fun m!1120937 () Bool)

(assert (=> b!1215429 m!1120937))

(declare-fun m!1120939 () Bool)

(assert (=> bm!60617 m!1120939))

(declare-fun m!1120941 () Bool)

(assert (=> b!1215431 m!1120941))

(declare-fun m!1120943 () Bool)

(assert (=> b!1215427 m!1120943))

(declare-fun m!1120945 () Bool)

(assert (=> b!1215427 m!1120945))

(declare-fun m!1120947 () Bool)

(assert (=> b!1215427 m!1120947))

(declare-fun m!1120949 () Bool)

(assert (=> b!1215415 m!1120949))

(assert (=> b!1215422 m!1120941))

(declare-fun m!1120951 () Bool)

(assert (=> b!1215407 m!1120951))

(declare-fun m!1120953 () Bool)

(assert (=> b!1215435 m!1120953))

(declare-fun m!1120955 () Bool)

(assert (=> b!1215435 m!1120955))

(declare-fun m!1120957 () Bool)

(assert (=> b!1215409 m!1120957))

(declare-fun m!1120959 () Bool)

(assert (=> bm!60616 m!1120959))

(declare-fun m!1120961 () Bool)

(assert (=> bm!60618 m!1120961))

(declare-fun m!1120963 () Bool)

(assert (=> b!1215410 m!1120963))

(declare-fun m!1120965 () Bool)

(assert (=> mapNonEmpty!48064 m!1120965))

(declare-fun m!1120967 () Bool)

(assert (=> start!101402 m!1120967))

(declare-fun m!1120969 () Bool)

(assert (=> start!101402 m!1120969))

(declare-fun m!1120971 () Bool)

(assert (=> b!1215425 m!1120971))

(declare-fun m!1120973 () Bool)

(assert (=> b!1215432 m!1120973))

(declare-fun m!1120975 () Bool)

(assert (=> b!1215432 m!1120975))

(declare-fun m!1120977 () Bool)

(assert (=> b!1215418 m!1120977))

(declare-fun m!1120979 () Bool)

(assert (=> b!1215426 m!1120979))

(declare-fun m!1120981 () Bool)

(assert (=> b!1215426 m!1120981))

(declare-fun m!1120983 () Bool)

(assert (=> bm!60613 m!1120983))

(declare-fun m!1120985 () Bool)

(assert (=> b!1215419 m!1120985))

(declare-fun m!1120987 () Bool)

(assert (=> b!1215419 m!1120987))

(declare-fun m!1120989 () Bool)

(assert (=> b!1215419 m!1120989))

(declare-fun m!1120991 () Bool)

(assert (=> b!1215419 m!1120991))

(declare-fun m!1120993 () Bool)

(assert (=> b!1215430 m!1120993))

(assert (=> b!1215430 m!1120973))

(declare-fun m!1120995 () Bool)

(assert (=> b!1215430 m!1120995))

(declare-fun m!1120997 () Bool)

(assert (=> b!1215430 m!1120997))

(declare-fun m!1120999 () Bool)

(assert (=> b!1215430 m!1120999))

(assert (=> b!1215430 m!1120973))

(declare-fun m!1121001 () Bool)

(assert (=> b!1215430 m!1121001))

(declare-fun m!1121003 () Bool)

(assert (=> b!1215430 m!1121003))

(declare-fun m!1121005 () Bool)

(assert (=> b!1215430 m!1121005))

(assert (=> b!1215430 m!1120999))

(assert (=> b!1215430 m!1120973))

(assert (=> b!1215430 m!1121003))

(declare-fun m!1121007 () Bool)

(assert (=> b!1215430 m!1121007))

(check-sat (not bm!60618) (not b!1215427) (not bm!60619) (not b!1215409) (not b!1215432) (not b!1215410) (not bm!60613) (not bm!60617) (not start!101402) (not b!1215415) (not b_next!26089) (not b!1215431) (not b!1215407) (not b!1215430) (not b!1215429) (not b!1215419) tp_is_empty!30793 (not b!1215422) (not b!1215414) (not b!1215426) (not bm!60616) (not b!1215435) (not mapNonEmpty!48064) (not b!1215433) (not b!1215425) (not b_lambda!21759) b_and!43299)
(check-sat b_and!43299 (not b_next!26089))

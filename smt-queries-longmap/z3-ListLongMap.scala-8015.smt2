; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98932 () Bool)

(assert start!98932)

(declare-fun b_free!24537 () Bool)

(declare-fun b_next!24537 () Bool)

(assert (=> start!98932 (= b_free!24537 (not b_next!24537))))

(declare-fun tp!86322 () Bool)

(declare-fun b_and!39923 () Bool)

(assert (=> start!98932 (= tp!86322 b_and!39923)))

(declare-fun b!1159714 () Bool)

(declare-fun res!769751 () Bool)

(declare-fun e!659493 () Bool)

(assert (=> b!1159714 (=> (not res!769751) (not e!659493))))

(declare-datatypes ((array!74975 0))(
  ( (array!74976 (arr!36138 (Array (_ BitVec 32) (_ BitVec 64))) (size!36674 (_ BitVec 32))) )
))
(declare-fun lt!521454 () array!74975)

(declare-datatypes ((List!25316 0))(
  ( (Nil!25313) (Cons!25312 (h!26521 (_ BitVec 64)) (t!36845 List!25316)) )
))
(declare-fun arrayNoDuplicates!0 (array!74975 (_ BitVec 32) List!25316) Bool)

(assert (=> b!1159714 (= res!769751 (arrayNoDuplicates!0 lt!521454 #b00000000000000000000000000000000 Nil!25313))))

(declare-fun b!1159715 () Bool)

(declare-fun e!659485 () Bool)

(assert (=> b!1159715 (= e!659485 e!659493)))

(declare-fun res!769758 () Bool)

(assert (=> b!1159715 (=> (not res!769758) (not e!659493))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74975 (_ BitVec 32)) Bool)

(assert (=> b!1159715 (= res!769758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521454 mask!1564))))

(declare-fun _keys!1208 () array!74975)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159715 (= lt!521454 (array!74976 (store (arr!36138 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36674 _keys!1208)))))

(declare-fun b!1159716 () Bool)

(declare-datatypes ((Unit!38225 0))(
  ( (Unit!38226) )
))
(declare-fun e!659478 () Unit!38225)

(declare-fun Unit!38227 () Unit!38225)

(assert (=> b!1159716 (= e!659478 Unit!38227)))

(declare-fun b!1159717 () Bool)

(declare-fun e!659479 () Bool)

(assert (=> b!1159717 (= e!659479 true)))

(declare-fun e!659482 () Bool)

(assert (=> b!1159717 e!659482))

(declare-fun res!769761 () Bool)

(assert (=> b!1159717 (=> (not res!769761) (not e!659482))))

(declare-datatypes ((V!43883 0))(
  ( (V!43884 (val!14590 Int)) )
))
(declare-datatypes ((tuple2!18578 0))(
  ( (tuple2!18579 (_1!9300 (_ BitVec 64)) (_2!9300 V!43883)) )
))
(declare-datatypes ((List!25317 0))(
  ( (Nil!25314) (Cons!25313 (h!26522 tuple2!18578) (t!36846 List!25317)) )
))
(declare-datatypes ((ListLongMap!16547 0))(
  ( (ListLongMap!16548 (toList!8289 List!25317)) )
))
(declare-fun lt!521462 () ListLongMap!16547)

(declare-fun lt!521470 () ListLongMap!16547)

(assert (=> b!1159717 (= res!769761 (= lt!521462 lt!521470))))

(declare-fun lt!521466 () ListLongMap!16547)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1399 (ListLongMap!16547 (_ BitVec 64)) ListLongMap!16547)

(assert (=> b!1159717 (= lt!521462 (-!1399 lt!521466 k0!934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!521465 () V!43883)

(declare-fun +!3695 (ListLongMap!16547 tuple2!18578) ListLongMap!16547)

(assert (=> b!1159717 (= (-!1399 (+!3695 lt!521470 (tuple2!18579 (select (arr!36138 _keys!1208) from!1455) lt!521465)) (select (arr!36138 _keys!1208) from!1455)) lt!521470)))

(declare-fun lt!521463 () Unit!38225)

(declare-fun addThenRemoveForNewKeyIsSame!234 (ListLongMap!16547 (_ BitVec 64) V!43883) Unit!38225)

(assert (=> b!1159717 (= lt!521463 (addThenRemoveForNewKeyIsSame!234 lt!521470 (select (arr!36138 _keys!1208) from!1455) lt!521465))))

(declare-datatypes ((ValueCell!13824 0))(
  ( (ValueCellFull!13824 (v!17227 V!43883)) (EmptyCell!13824) )
))
(declare-datatypes ((array!74977 0))(
  ( (array!74978 (arr!36139 (Array (_ BitVec 32) ValueCell!13824)) (size!36675 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74977)

(declare-fun lt!521457 () V!43883)

(declare-fun get!18426 (ValueCell!13824 V!43883) V!43883)

(assert (=> b!1159717 (= lt!521465 (get!18426 (select (arr!36139 _values!996) from!1455) lt!521457))))

(declare-fun lt!521474 () Unit!38225)

(assert (=> b!1159717 (= lt!521474 e!659478)))

(declare-fun c!115695 () Bool)

(declare-fun contains!6796 (ListLongMap!16547 (_ BitVec 64)) Bool)

(assert (=> b!1159717 (= c!115695 (contains!6796 lt!521470 k0!934))))

(declare-fun zeroValue!944 () V!43883)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43883)

(declare-fun getCurrentListMapNoExtraKeys!4753 (array!74975 array!74977 (_ BitVec 32) (_ BitVec 32) V!43883 V!43883 (_ BitVec 32) Int) ListLongMap!16547)

(assert (=> b!1159717 (= lt!521470 (getCurrentListMapNoExtraKeys!4753 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159718 () Bool)

(declare-fun e!659484 () Bool)

(declare-fun call!55991 () ListLongMap!16547)

(declare-fun call!55987 () ListLongMap!16547)

(assert (=> b!1159718 (= e!659484 (= call!55991 call!55987))))

(declare-fun b!1159719 () Bool)

(declare-fun e!659483 () Bool)

(declare-fun tp_is_empty!29067 () Bool)

(assert (=> b!1159719 (= e!659483 tp_is_empty!29067)))

(declare-fun b!1159720 () Bool)

(declare-fun e!659481 () Bool)

(declare-fun e!659486 () Bool)

(assert (=> b!1159720 (= e!659481 e!659486)))

(declare-fun res!769762 () Bool)

(assert (=> b!1159720 (=> res!769762 e!659486)))

(assert (=> b!1159720 (= res!769762 (not (= from!1455 i!673)))))

(declare-fun lt!521468 () ListLongMap!16547)

(declare-fun lt!521459 () array!74977)

(assert (=> b!1159720 (= lt!521468 (getCurrentListMapNoExtraKeys!4753 lt!521454 lt!521459 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159720 (= lt!521459 (array!74978 (store (arr!36139 _values!996) i!673 (ValueCellFull!13824 lt!521457)) (size!36675 _values!996)))))

(declare-fun dynLambda!2754 (Int (_ BitVec 64)) V!43883)

(assert (=> b!1159720 (= lt!521457 (dynLambda!2754 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159720 (= lt!521466 (getCurrentListMapNoExtraKeys!4753 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159721 () Bool)

(declare-fun res!769759 () Bool)

(assert (=> b!1159721 (=> (not res!769759) (not e!659485))))

(assert (=> b!1159721 (= res!769759 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36674 _keys!1208))))))

(declare-fun bm!55983 () Bool)

(declare-fun call!55988 () Bool)

(declare-fun call!55989 () Bool)

(assert (=> bm!55983 (= call!55988 call!55989)))

(declare-fun mapIsEmpty!45425 () Bool)

(declare-fun mapRes!45425 () Bool)

(assert (=> mapIsEmpty!45425 mapRes!45425))

(declare-fun b!1159722 () Bool)

(declare-fun call!55992 () ListLongMap!16547)

(assert (=> b!1159722 (contains!6796 call!55992 k0!934)))

(declare-fun lt!521455 () Unit!38225)

(declare-fun lt!521464 () ListLongMap!16547)

(declare-fun addStillContains!937 (ListLongMap!16547 (_ BitVec 64) V!43883 (_ BitVec 64)) Unit!38225)

(assert (=> b!1159722 (= lt!521455 (addStillContains!937 lt!521464 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1159722 call!55989))

(assert (=> b!1159722 (= lt!521464 (+!3695 lt!521470 (tuple2!18579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521467 () Unit!38225)

(declare-fun call!55990 () Unit!38225)

(assert (=> b!1159722 (= lt!521467 call!55990)))

(declare-fun e!659480 () Unit!38225)

(assert (=> b!1159722 (= e!659480 lt!521455)))

(declare-fun b!1159723 () Bool)

(declare-fun e!659477 () Bool)

(assert (=> b!1159723 (= e!659477 (and e!659483 mapRes!45425))))

(declare-fun condMapEmpty!45425 () Bool)

(declare-fun mapDefault!45425 () ValueCell!13824)

(assert (=> b!1159723 (= condMapEmpty!45425 (= (arr!36139 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13824)) mapDefault!45425)))))

(declare-fun bm!55984 () Bool)

(declare-fun call!55986 () ListLongMap!16547)

(assert (=> bm!55984 (= call!55986 call!55992)))

(declare-fun b!1159724 () Bool)

(declare-fun e!659488 () Bool)

(declare-fun arrayContainsKey!0 (array!74975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159724 (= e!659488 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159725 () Bool)

(declare-fun res!769749 () Bool)

(assert (=> b!1159725 (=> (not res!769749) (not e!659485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159725 (= res!769749 (validKeyInArray!0 k0!934))))

(declare-fun bm!55985 () Bool)

(assert (=> bm!55985 (= call!55991 (getCurrentListMapNoExtraKeys!4753 lt!521454 lt!521459 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159726 () Bool)

(declare-fun res!769752 () Bool)

(assert (=> b!1159726 (=> (not res!769752) (not e!659485))))

(assert (=> b!1159726 (= res!769752 (= (select (arr!36138 _keys!1208) i!673) k0!934))))

(declare-fun b!1159727 () Bool)

(declare-fun e!659492 () Unit!38225)

(declare-fun e!659490 () Unit!38225)

(assert (=> b!1159727 (= e!659492 e!659490)))

(declare-fun c!115696 () Bool)

(declare-fun lt!521472 () Bool)

(assert (=> b!1159727 (= c!115696 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521472))))

(declare-fun b!1159728 () Bool)

(assert (=> b!1159728 (= e!659486 e!659479)))

(declare-fun res!769754 () Bool)

(assert (=> b!1159728 (=> res!769754 e!659479)))

(assert (=> b!1159728 (= res!769754 (not (= (select (arr!36138 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1159728 e!659484))

(declare-fun c!115693 () Bool)

(assert (=> b!1159728 (= c!115693 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521471 () Unit!38225)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!630 (array!74975 array!74977 (_ BitVec 32) (_ BitVec 32) V!43883 V!43883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38225)

(assert (=> b!1159728 (= lt!521471 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!630 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55986 () Bool)

(assert (=> bm!55986 (= call!55987 (getCurrentListMapNoExtraKeys!4753 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115691 () Bool)

(declare-fun bm!55987 () Bool)

(declare-fun c!115692 () Bool)

(assert (=> bm!55987 (= call!55992 (+!3695 (ite c!115692 lt!521464 lt!521470) (ite c!115692 (tuple2!18579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115691 (tuple2!18579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!55988 () Bool)

(declare-fun call!55993 () Unit!38225)

(assert (=> bm!55988 (= call!55993 call!55990)))

(declare-fun b!1159729 () Bool)

(declare-fun res!769763 () Bool)

(assert (=> b!1159729 (=> (not res!769763) (not e!659485))))

(assert (=> b!1159729 (= res!769763 (and (= (size!36675 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36674 _keys!1208) (size!36675 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159730 () Bool)

(declare-fun Unit!38228 () Unit!38225)

(assert (=> b!1159730 (= e!659478 Unit!38228)))

(assert (=> b!1159730 (= lt!521472 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159730 (= c!115692 (and (not lt!521472) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521475 () Unit!38225)

(assert (=> b!1159730 (= lt!521475 e!659480)))

(declare-fun lt!521460 () Unit!38225)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!524 (array!74975 array!74977 (_ BitVec 32) (_ BitVec 32) V!43883 V!43883 (_ BitVec 64) (_ BitVec 32) Int) Unit!38225)

(assert (=> b!1159730 (= lt!521460 (lemmaListMapContainsThenArrayContainsFrom!524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115694 () Bool)

(assert (=> b!1159730 (= c!115694 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769756 () Bool)

(declare-fun e!659491 () Bool)

(assert (=> b!1159730 (= res!769756 e!659491)))

(assert (=> b!1159730 (=> (not res!769756) (not e!659488))))

(assert (=> b!1159730 e!659488))

(declare-fun lt!521473 () Unit!38225)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74975 (_ BitVec 32) (_ BitVec 32)) Unit!38225)

(assert (=> b!1159730 (= lt!521473 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159730 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25313)))

(declare-fun lt!521458 () Unit!38225)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74975 (_ BitVec 64) (_ BitVec 32) List!25316) Unit!38225)

(assert (=> b!1159730 (= lt!521458 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25313))))

(assert (=> b!1159730 false))

(declare-fun b!1159731 () Bool)

(declare-fun res!769750 () Bool)

(assert (=> b!1159731 (=> (not res!769750) (not e!659485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159731 (= res!769750 (validMask!0 mask!1564))))

(declare-fun bm!55989 () Bool)

(assert (=> bm!55989 (= call!55990 (addStillContains!937 lt!521470 (ite (or c!115692 c!115691) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115692 c!115691) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1159732 () Bool)

(declare-fun lt!521456 () Unit!38225)

(assert (=> b!1159732 (= e!659492 lt!521456)))

(assert (=> b!1159732 (= lt!521456 call!55993)))

(assert (=> b!1159732 call!55988))

(declare-fun b!1159733 () Bool)

(assert (=> b!1159733 (= e!659484 (= call!55991 (-!1399 call!55987 k0!934)))))

(declare-fun b!1159734 () Bool)

(assert (=> b!1159734 (= e!659491 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159735 () Bool)

(declare-fun e!659489 () Bool)

(assert (=> b!1159735 (= e!659489 tp_is_empty!29067)))

(declare-fun b!1159736 () Bool)

(assert (=> b!1159736 (= e!659482 (= lt!521462 (getCurrentListMapNoExtraKeys!4753 lt!521454 lt!521459 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapNonEmpty!45425 () Bool)

(declare-fun tp!86321 () Bool)

(assert (=> mapNonEmpty!45425 (= mapRes!45425 (and tp!86321 e!659489))))

(declare-fun mapValue!45425 () ValueCell!13824)

(declare-fun mapRest!45425 () (Array (_ BitVec 32) ValueCell!13824))

(declare-fun mapKey!45425 () (_ BitVec 32))

(assert (=> mapNonEmpty!45425 (= (arr!36139 _values!996) (store mapRest!45425 mapKey!45425 mapValue!45425))))

(declare-fun b!1159737 () Bool)

(assert (=> b!1159737 (= c!115691 (and (not lt!521472) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1159737 (= e!659480 e!659492)))

(declare-fun b!1159738 () Bool)

(assert (=> b!1159738 (= e!659493 (not e!659481))))

(declare-fun res!769757 () Bool)

(assert (=> b!1159738 (=> res!769757 e!659481)))

(assert (=> b!1159738 (= res!769757 (bvsgt from!1455 i!673))))

(assert (=> b!1159738 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521461 () Unit!38225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74975 (_ BitVec 64) (_ BitVec 32)) Unit!38225)

(assert (=> b!1159738 (= lt!521461 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159739 () Bool)

(declare-fun Unit!38229 () Unit!38225)

(assert (=> b!1159739 (= e!659490 Unit!38229)))

(declare-fun b!1159740 () Bool)

(declare-fun res!769753 () Bool)

(assert (=> b!1159740 (=> (not res!769753) (not e!659485))))

(assert (=> b!1159740 (= res!769753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1159741 () Bool)

(declare-fun res!769755 () Bool)

(assert (=> b!1159741 (=> (not res!769755) (not e!659485))))

(assert (=> b!1159741 (= res!769755 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25313))))

(declare-fun res!769760 () Bool)

(assert (=> start!98932 (=> (not res!769760) (not e!659485))))

(assert (=> start!98932 (= res!769760 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36674 _keys!1208))))))

(assert (=> start!98932 e!659485))

(assert (=> start!98932 tp_is_empty!29067))

(declare-fun array_inv!27652 (array!74975) Bool)

(assert (=> start!98932 (array_inv!27652 _keys!1208)))

(assert (=> start!98932 true))

(assert (=> start!98932 tp!86322))

(declare-fun array_inv!27653 (array!74977) Bool)

(assert (=> start!98932 (and (array_inv!27653 _values!996) e!659477)))

(declare-fun b!1159742 () Bool)

(assert (=> b!1159742 (= e!659491 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521472) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55990 () Bool)

(assert (=> bm!55990 (= call!55989 (contains!6796 (ite c!115692 lt!521464 call!55986) k0!934))))

(declare-fun b!1159743 () Bool)

(assert (=> b!1159743 call!55988))

(declare-fun lt!521469 () Unit!38225)

(assert (=> b!1159743 (= lt!521469 call!55993)))

(assert (=> b!1159743 (= e!659490 lt!521469)))

(assert (= (and start!98932 res!769760) b!1159731))

(assert (= (and b!1159731 res!769750) b!1159729))

(assert (= (and b!1159729 res!769763) b!1159740))

(assert (= (and b!1159740 res!769753) b!1159741))

(assert (= (and b!1159741 res!769755) b!1159721))

(assert (= (and b!1159721 res!769759) b!1159725))

(assert (= (and b!1159725 res!769749) b!1159726))

(assert (= (and b!1159726 res!769752) b!1159715))

(assert (= (and b!1159715 res!769758) b!1159714))

(assert (= (and b!1159714 res!769751) b!1159738))

(assert (= (and b!1159738 (not res!769757)) b!1159720))

(assert (= (and b!1159720 (not res!769762)) b!1159728))

(assert (= (and b!1159728 c!115693) b!1159733))

(assert (= (and b!1159728 (not c!115693)) b!1159718))

(assert (= (or b!1159733 b!1159718) bm!55985))

(assert (= (or b!1159733 b!1159718) bm!55986))

(assert (= (and b!1159728 (not res!769754)) b!1159717))

(assert (= (and b!1159717 c!115695) b!1159730))

(assert (= (and b!1159717 (not c!115695)) b!1159716))

(assert (= (and b!1159730 c!115692) b!1159722))

(assert (= (and b!1159730 (not c!115692)) b!1159737))

(assert (= (and b!1159737 c!115691) b!1159732))

(assert (= (and b!1159737 (not c!115691)) b!1159727))

(assert (= (and b!1159727 c!115696) b!1159743))

(assert (= (and b!1159727 (not c!115696)) b!1159739))

(assert (= (or b!1159732 b!1159743) bm!55988))

(assert (= (or b!1159732 b!1159743) bm!55984))

(assert (= (or b!1159732 b!1159743) bm!55983))

(assert (= (or b!1159722 bm!55983) bm!55990))

(assert (= (or b!1159722 bm!55988) bm!55989))

(assert (= (or b!1159722 bm!55984) bm!55987))

(assert (= (and b!1159730 c!115694) b!1159734))

(assert (= (and b!1159730 (not c!115694)) b!1159742))

(assert (= (and b!1159730 res!769756) b!1159724))

(assert (= (and b!1159717 res!769761) b!1159736))

(assert (= (and b!1159723 condMapEmpty!45425) mapIsEmpty!45425))

(assert (= (and b!1159723 (not condMapEmpty!45425)) mapNonEmpty!45425))

(get-info :version)

(assert (= (and mapNonEmpty!45425 ((_ is ValueCellFull!13824) mapValue!45425)) b!1159735))

(assert (= (and b!1159723 ((_ is ValueCellFull!13824) mapDefault!45425)) b!1159719))

(assert (= start!98932 b!1159723))

(declare-fun b_lambda!19643 () Bool)

(assert (=> (not b_lambda!19643) (not b!1159720)))

(declare-fun t!36844 () Bool)

(declare-fun tb!9349 () Bool)

(assert (=> (and start!98932 (= defaultEntry!1004 defaultEntry!1004) t!36844) tb!9349))

(declare-fun result!19263 () Bool)

(assert (=> tb!9349 (= result!19263 tp_is_empty!29067)))

(assert (=> b!1159720 t!36844))

(declare-fun b_and!39925 () Bool)

(assert (= b_and!39923 (and (=> t!36844 result!19263) b_and!39925)))

(declare-fun m!1068753 () Bool)

(assert (=> b!1159736 m!1068753))

(declare-fun m!1068755 () Bool)

(assert (=> b!1159733 m!1068755))

(declare-fun m!1068757 () Bool)

(assert (=> b!1159726 m!1068757))

(declare-fun m!1068759 () Bool)

(assert (=> b!1159725 m!1068759))

(declare-fun m!1068761 () Bool)

(assert (=> b!1159738 m!1068761))

(declare-fun m!1068763 () Bool)

(assert (=> b!1159738 m!1068763))

(declare-fun m!1068765 () Bool)

(assert (=> b!1159731 m!1068765))

(declare-fun m!1068767 () Bool)

(assert (=> bm!55986 m!1068767))

(declare-fun m!1068769 () Bool)

(assert (=> b!1159728 m!1068769))

(declare-fun m!1068771 () Bool)

(assert (=> b!1159728 m!1068771))

(declare-fun m!1068773 () Bool)

(assert (=> b!1159734 m!1068773))

(declare-fun m!1068775 () Bool)

(assert (=> b!1159720 m!1068775))

(declare-fun m!1068777 () Bool)

(assert (=> b!1159720 m!1068777))

(declare-fun m!1068779 () Bool)

(assert (=> b!1159720 m!1068779))

(declare-fun m!1068781 () Bool)

(assert (=> b!1159720 m!1068781))

(declare-fun m!1068783 () Bool)

(assert (=> bm!55989 m!1068783))

(declare-fun m!1068785 () Bool)

(assert (=> b!1159740 m!1068785))

(declare-fun m!1068787 () Bool)

(assert (=> bm!55990 m!1068787))

(declare-fun m!1068789 () Bool)

(assert (=> mapNonEmpty!45425 m!1068789))

(declare-fun m!1068791 () Bool)

(assert (=> b!1159741 m!1068791))

(declare-fun m!1068793 () Bool)

(assert (=> b!1159730 m!1068793))

(declare-fun m!1068795 () Bool)

(assert (=> b!1159730 m!1068795))

(declare-fun m!1068797 () Bool)

(assert (=> b!1159730 m!1068797))

(declare-fun m!1068799 () Bool)

(assert (=> b!1159730 m!1068799))

(assert (=> bm!55985 m!1068753))

(assert (=> b!1159717 m!1068767))

(declare-fun m!1068801 () Bool)

(assert (=> b!1159717 m!1068801))

(declare-fun m!1068803 () Bool)

(assert (=> b!1159717 m!1068803))

(declare-fun m!1068805 () Bool)

(assert (=> b!1159717 m!1068805))

(assert (=> b!1159717 m!1068805))

(assert (=> b!1159717 m!1068769))

(declare-fun m!1068807 () Bool)

(assert (=> b!1159717 m!1068807))

(declare-fun m!1068809 () Bool)

(assert (=> b!1159717 m!1068809))

(assert (=> b!1159717 m!1068801))

(declare-fun m!1068811 () Bool)

(assert (=> b!1159717 m!1068811))

(assert (=> b!1159717 m!1068769))

(assert (=> b!1159717 m!1068769))

(declare-fun m!1068813 () Bool)

(assert (=> b!1159717 m!1068813))

(declare-fun m!1068815 () Bool)

(assert (=> start!98932 m!1068815))

(declare-fun m!1068817 () Bool)

(assert (=> start!98932 m!1068817))

(assert (=> b!1159724 m!1068773))

(declare-fun m!1068819 () Bool)

(assert (=> b!1159714 m!1068819))

(declare-fun m!1068821 () Bool)

(assert (=> b!1159715 m!1068821))

(declare-fun m!1068823 () Bool)

(assert (=> b!1159715 m!1068823))

(declare-fun m!1068825 () Bool)

(assert (=> bm!55987 m!1068825))

(declare-fun m!1068827 () Bool)

(assert (=> b!1159722 m!1068827))

(declare-fun m!1068829 () Bool)

(assert (=> b!1159722 m!1068829))

(declare-fun m!1068831 () Bool)

(assert (=> b!1159722 m!1068831))

(check-sat (not bm!55985) (not b!1159730) (not b!1159715) (not b!1159724) tp_is_empty!29067 (not start!98932) (not b!1159741) (not b!1159736) (not bm!55987) b_and!39925 (not b!1159738) (not b!1159733) (not b!1159714) (not bm!55986) (not bm!55990) (not b!1159728) (not bm!55989) (not b!1159731) (not b_next!24537) (not b!1159720) (not b!1159734) (not b!1159740) (not b!1159722) (not mapNonEmpty!45425) (not b!1159725) (not b_lambda!19643) (not b!1159717))
(check-sat b_and!39925 (not b_next!24537))

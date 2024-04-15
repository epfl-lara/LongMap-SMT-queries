; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98630 () Bool)

(assert start!98630)

(declare-fun b_free!24241 () Bool)

(declare-fun b_next!24241 () Bool)

(assert (=> start!98630 (= b_free!24241 (not b_next!24241))))

(declare-fun tp!85433 () Bool)

(declare-fun b_and!39309 () Bool)

(assert (=> start!98630 (= tp!85433 b_and!39309)))

(declare-fun b!1145974 () Bool)

(declare-fun res!763026 () Bool)

(declare-fun e!651851 () Bool)

(assert (=> b!1145974 (=> (not res!763026) (not e!651851))))

(declare-datatypes ((array!74314 0))(
  ( (array!74315 (arr!35808 (Array (_ BitVec 32) (_ BitVec 64))) (size!36346 (_ BitVec 32))) )
))
(declare-fun lt!511611 () array!74314)

(declare-datatypes ((List!25122 0))(
  ( (Nil!25119) (Cons!25118 (h!26327 (_ BitVec 64)) (t!36346 List!25122)) )
))
(declare-fun arrayNoDuplicates!0 (array!74314 (_ BitVec 32) List!25122) Bool)

(assert (=> b!1145974 (= res!763026 (arrayNoDuplicates!0 lt!511611 #b00000000000000000000000000000000 Nil!25119))))

(declare-fun bm!52408 () Bool)

(declare-datatypes ((Unit!37491 0))(
  ( (Unit!37492) )
))
(declare-fun call!52418 () Unit!37491)

(declare-fun call!52411 () Unit!37491)

(assert (=> bm!52408 (= call!52418 call!52411)))

(declare-fun b!1145975 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!651859 () Bool)

(declare-datatypes ((V!43489 0))(
  ( (V!43490 (val!14442 Int)) )
))
(declare-datatypes ((tuple2!18386 0))(
  ( (tuple2!18387 (_1!9204 (_ BitVec 64)) (_2!9204 V!43489)) )
))
(declare-datatypes ((List!25123 0))(
  ( (Nil!25120) (Cons!25119 (h!26328 tuple2!18386) (t!36347 List!25123)) )
))
(declare-datatypes ((ListLongMap!16355 0))(
  ( (ListLongMap!16356 (toList!8193 List!25123)) )
))
(declare-fun call!52413 () ListLongMap!16355)

(declare-fun call!52417 () ListLongMap!16355)

(declare-fun -!1267 (ListLongMap!16355 (_ BitVec 64)) ListLongMap!16355)

(assert (=> b!1145975 (= e!651859 (= call!52413 (-!1267 call!52417 k0!934)))))

(declare-fun b!1145976 () Bool)

(declare-fun e!651861 () Bool)

(assert (=> b!1145976 (= e!651861 true)))

(declare-fun e!651855 () Bool)

(assert (=> b!1145976 e!651855))

(declare-fun res!763023 () Bool)

(assert (=> b!1145976 (=> (not res!763023) (not e!651855))))

(declare-fun lt!511603 () V!43489)

(declare-fun _keys!1208 () array!74314)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!511600 () ListLongMap!16355)

(declare-fun +!3613 (ListLongMap!16355 tuple2!18386) ListLongMap!16355)

(assert (=> b!1145976 (= res!763023 (= (-!1267 (+!3613 lt!511600 (tuple2!18387 (select (arr!35808 _keys!1208) from!1455) lt!511603)) (select (arr!35808 _keys!1208) from!1455)) lt!511600))))

(declare-fun lt!511597 () Unit!37491)

(declare-fun addThenRemoveForNewKeyIsSame!130 (ListLongMap!16355 (_ BitVec 64) V!43489) Unit!37491)

(assert (=> b!1145976 (= lt!511597 (addThenRemoveForNewKeyIsSame!130 lt!511600 (select (arr!35808 _keys!1208) from!1455) lt!511603))))

(declare-fun lt!511591 () V!43489)

(declare-datatypes ((ValueCell!13676 0))(
  ( (ValueCellFull!13676 (v!17078 V!43489)) (EmptyCell!13676) )
))
(declare-datatypes ((array!74316 0))(
  ( (array!74317 (arr!35809 (Array (_ BitVec 32) ValueCell!13676)) (size!36347 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74316)

(declare-fun get!18224 (ValueCell!13676 V!43489) V!43489)

(assert (=> b!1145976 (= lt!511603 (get!18224 (select (arr!35809 _values!996) from!1455) lt!511591))))

(declare-fun lt!511606 () Unit!37491)

(declare-fun e!651866 () Unit!37491)

(assert (=> b!1145976 (= lt!511606 e!651866)))

(declare-fun c!113001 () Bool)

(declare-fun contains!6657 (ListLongMap!16355 (_ BitVec 64)) Bool)

(assert (=> b!1145976 (= c!113001 (contains!6657 lt!511600 k0!934))))

(declare-fun zeroValue!944 () V!43489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43489)

(declare-fun getCurrentListMapNoExtraKeys!4679 (array!74314 array!74316 (_ BitVec 32) (_ BitVec 32) V!43489 V!43489 (_ BitVec 32) Int) ListLongMap!16355)

(assert (=> b!1145976 (= lt!511600 (getCurrentListMapNoExtraKeys!4679 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145977 () Bool)

(declare-fun e!651856 () Unit!37491)

(declare-fun e!651854 () Unit!37491)

(assert (=> b!1145977 (= e!651856 e!651854)))

(declare-fun c!113004 () Bool)

(declare-fun lt!511598 () Bool)

(assert (=> b!1145977 (= c!113004 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511598))))

(declare-fun b!1145978 () Bool)

(declare-fun res!763025 () Bool)

(declare-fun e!651858 () Bool)

(assert (=> b!1145978 (=> (not res!763025) (not e!651858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145978 (= res!763025 (validKeyInArray!0 k0!934))))

(declare-fun b!1145979 () Bool)

(declare-fun e!651857 () Bool)

(declare-fun tp_is_empty!28771 () Bool)

(assert (=> b!1145979 (= e!651857 tp_is_empty!28771)))

(declare-fun bm!52409 () Bool)

(declare-fun lt!511599 () array!74316)

(assert (=> bm!52409 (= call!52413 (getCurrentListMapNoExtraKeys!4679 lt!511611 lt!511599 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145981 () Bool)

(declare-fun res!763024 () Bool)

(assert (=> b!1145981 (=> (not res!763024) (not e!651858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74314 (_ BitVec 32)) Bool)

(assert (=> b!1145981 (= res!763024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145982 () Bool)

(declare-fun c!113006 () Bool)

(assert (=> b!1145982 (= c!113006 (and (not lt!511598) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651862 () Unit!37491)

(assert (=> b!1145982 (= e!651862 e!651856)))

(declare-fun b!1145983 () Bool)

(declare-fun lt!511595 () Unit!37491)

(assert (=> b!1145983 (= e!651856 lt!511595)))

(assert (=> b!1145983 (= lt!511595 call!52418)))

(declare-fun call!52416 () Bool)

(assert (=> b!1145983 call!52416))

(declare-fun mapNonEmpty!44981 () Bool)

(declare-fun mapRes!44981 () Bool)

(declare-fun tp!85434 () Bool)

(assert (=> mapNonEmpty!44981 (= mapRes!44981 (and tp!85434 e!651857))))

(declare-fun mapValue!44981 () ValueCell!13676)

(declare-fun mapKey!44981 () (_ BitVec 32))

(declare-fun mapRest!44981 () (Array (_ BitVec 32) ValueCell!13676))

(assert (=> mapNonEmpty!44981 (= (arr!35809 _values!996) (store mapRest!44981 mapKey!44981 mapValue!44981))))

(declare-fun b!1145984 () Bool)

(declare-fun call!52414 () ListLongMap!16355)

(assert (=> b!1145984 (contains!6657 call!52414 k0!934)))

(declare-fun lt!511607 () Unit!37491)

(assert (=> b!1145984 (= lt!511607 call!52411)))

(declare-fun call!52412 () Bool)

(assert (=> b!1145984 call!52412))

(declare-fun lt!511610 () ListLongMap!16355)

(assert (=> b!1145984 (= lt!511610 (+!3613 lt!511600 (tuple2!18387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511609 () Unit!37491)

(declare-fun addStillContains!826 (ListLongMap!16355 (_ BitVec 64) V!43489 (_ BitVec 64)) Unit!37491)

(assert (=> b!1145984 (= lt!511609 (addStillContains!826 lt!511600 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1145984 (= e!651862 lt!511607)))

(declare-fun mapIsEmpty!44981 () Bool)

(assert (=> mapIsEmpty!44981 mapRes!44981))

(declare-fun b!1145985 () Bool)

(declare-fun Unit!37493 () Unit!37491)

(assert (=> b!1145985 (= e!651866 Unit!37493)))

(assert (=> b!1145985 (= lt!511598 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113002 () Bool)

(assert (=> b!1145985 (= c!113002 (and (not lt!511598) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511593 () Unit!37491)

(assert (=> b!1145985 (= lt!511593 e!651862)))

(declare-fun lt!511596 () Unit!37491)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!422 (array!74314 array!74316 (_ BitVec 32) (_ BitVec 32) V!43489 V!43489 (_ BitVec 64) (_ BitVec 32) Int) Unit!37491)

(assert (=> b!1145985 (= lt!511596 (lemmaListMapContainsThenArrayContainsFrom!422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113005 () Bool)

(assert (=> b!1145985 (= c!113005 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763034 () Bool)

(declare-fun e!651865 () Bool)

(assert (=> b!1145985 (= res!763034 e!651865)))

(declare-fun e!651860 () Bool)

(assert (=> b!1145985 (=> (not res!763034) (not e!651860))))

(assert (=> b!1145985 e!651860))

(declare-fun lt!511608 () Unit!37491)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74314 (_ BitVec 32) (_ BitVec 32)) Unit!37491)

(assert (=> b!1145985 (= lt!511608 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1145985 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25119)))

(declare-fun lt!511604 () Unit!37491)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74314 (_ BitVec 64) (_ BitVec 32) List!25122) Unit!37491)

(assert (=> b!1145985 (= lt!511604 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25119))))

(assert (=> b!1145985 false))

(declare-fun b!1145986 () Bool)

(declare-fun Unit!37494 () Unit!37491)

(assert (=> b!1145986 (= e!651854 Unit!37494)))

(declare-fun call!52415 () ListLongMap!16355)

(declare-fun bm!52410 () Bool)

(assert (=> bm!52410 (= call!52412 (contains!6657 (ite c!113002 lt!511610 call!52415) k0!934))))

(declare-fun bm!52411 () Bool)

(assert (=> bm!52411 (= call!52411 (addStillContains!826 (ite c!113002 lt!511610 lt!511600) (ite c!113002 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113006 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113002 minValue!944 (ite c!113006 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1145987 () Bool)

(declare-fun arrayContainsKey!0 (array!74314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145987 (= e!651865 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145988 () Bool)

(assert (=> b!1145988 (= e!651865 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511598) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145989 () Bool)

(declare-fun e!651852 () Bool)

(declare-fun e!651863 () Bool)

(assert (=> b!1145989 (= e!651852 e!651863)))

(declare-fun res!763031 () Bool)

(assert (=> b!1145989 (=> res!763031 e!651863)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145989 (= res!763031 (not (= from!1455 i!673)))))

(declare-fun lt!511602 () ListLongMap!16355)

(assert (=> b!1145989 (= lt!511602 (getCurrentListMapNoExtraKeys!4679 lt!511611 lt!511599 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145989 (= lt!511599 (array!74317 (store (arr!35809 _values!996) i!673 (ValueCellFull!13676 lt!511591)) (size!36347 _values!996)))))

(declare-fun dynLambda!2651 (Int (_ BitVec 64)) V!43489)

(assert (=> b!1145989 (= lt!511591 (dynLambda!2651 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511605 () ListLongMap!16355)

(assert (=> b!1145989 (= lt!511605 (getCurrentListMapNoExtraKeys!4679 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145990 () Bool)

(declare-fun e!651864 () Bool)

(assert (=> b!1145990 (= e!651864 tp_is_empty!28771)))

(declare-fun b!1145991 () Bool)

(declare-fun res!763030 () Bool)

(assert (=> b!1145991 (=> (not res!763030) (not e!651858))))

(assert (=> b!1145991 (= res!763030 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25119))))

(declare-fun b!1145992 () Bool)

(declare-fun res!763032 () Bool)

(assert (=> b!1145992 (=> (not res!763032) (not e!651858))))

(assert (=> b!1145992 (= res!763032 (and (= (size!36347 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36346 _keys!1208) (size!36347 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145980 () Bool)

(assert (=> b!1145980 (= e!651851 (not e!651852))))

(declare-fun res!763036 () Bool)

(assert (=> b!1145980 (=> res!763036 e!651852)))

(assert (=> b!1145980 (= res!763036 (bvsgt from!1455 i!673))))

(assert (=> b!1145980 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511594 () Unit!37491)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74314 (_ BitVec 64) (_ BitVec 32)) Unit!37491)

(assert (=> b!1145980 (= lt!511594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!763037 () Bool)

(assert (=> start!98630 (=> (not res!763037) (not e!651858))))

(assert (=> start!98630 (= res!763037 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36346 _keys!1208))))))

(assert (=> start!98630 e!651858))

(assert (=> start!98630 tp_is_empty!28771))

(declare-fun array_inv!27520 (array!74314) Bool)

(assert (=> start!98630 (array_inv!27520 _keys!1208)))

(assert (=> start!98630 true))

(assert (=> start!98630 tp!85433))

(declare-fun e!651867 () Bool)

(declare-fun array_inv!27521 (array!74316) Bool)

(assert (=> start!98630 (and (array_inv!27521 _values!996) e!651867)))

(declare-fun b!1145993 () Bool)

(declare-fun Unit!37495 () Unit!37491)

(assert (=> b!1145993 (= e!651866 Unit!37495)))

(declare-fun bm!52412 () Bool)

(assert (=> bm!52412 (= call!52417 (getCurrentListMapNoExtraKeys!4679 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145994 () Bool)

(assert (=> b!1145994 (= e!651855 (= (-!1267 lt!511605 k0!934) lt!511600))))

(declare-fun bm!52413 () Bool)

(assert (=> bm!52413 (= call!52414 (+!3613 (ite c!113002 lt!511610 lt!511600) (ite c!113002 (tuple2!18387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113006 (tuple2!18387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!52414 () Bool)

(assert (=> bm!52414 (= call!52416 call!52412)))

(declare-fun b!1145995 () Bool)

(assert (=> b!1145995 call!52416))

(declare-fun lt!511601 () Unit!37491)

(assert (=> b!1145995 (= lt!511601 call!52418)))

(assert (=> b!1145995 (= e!651854 lt!511601)))

(declare-fun b!1145996 () Bool)

(declare-fun res!763028 () Bool)

(assert (=> b!1145996 (=> (not res!763028) (not e!651858))))

(assert (=> b!1145996 (= res!763028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36346 _keys!1208))))))

(declare-fun b!1145997 () Bool)

(assert (=> b!1145997 (= e!651858 e!651851)))

(declare-fun res!763035 () Bool)

(assert (=> b!1145997 (=> (not res!763035) (not e!651851))))

(assert (=> b!1145997 (= res!763035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511611 mask!1564))))

(assert (=> b!1145997 (= lt!511611 (array!74315 (store (arr!35808 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36346 _keys!1208)))))

(declare-fun b!1145998 () Bool)

(assert (=> b!1145998 (= e!651859 (= call!52413 call!52417))))

(declare-fun b!1145999 () Bool)

(assert (=> b!1145999 (= e!651860 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52415 () Bool)

(assert (=> bm!52415 (= call!52415 call!52414)))

(declare-fun b!1146000 () Bool)

(assert (=> b!1146000 (= e!651867 (and e!651864 mapRes!44981))))

(declare-fun condMapEmpty!44981 () Bool)

(declare-fun mapDefault!44981 () ValueCell!13676)

(assert (=> b!1146000 (= condMapEmpty!44981 (= (arr!35809 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13676)) mapDefault!44981)))))

(declare-fun b!1146001 () Bool)

(declare-fun res!763029 () Bool)

(assert (=> b!1146001 (=> (not res!763029) (not e!651858))))

(assert (=> b!1146001 (= res!763029 (= (select (arr!35808 _keys!1208) i!673) k0!934))))

(declare-fun b!1146002 () Bool)

(declare-fun res!763027 () Bool)

(assert (=> b!1146002 (=> (not res!763027) (not e!651858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146002 (= res!763027 (validMask!0 mask!1564))))

(declare-fun b!1146003 () Bool)

(assert (=> b!1146003 (= e!651863 e!651861)))

(declare-fun res!763033 () Bool)

(assert (=> b!1146003 (=> res!763033 e!651861)))

(assert (=> b!1146003 (= res!763033 (not (= (select (arr!35808 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146003 e!651859))

(declare-fun c!113003 () Bool)

(assert (=> b!1146003 (= c!113003 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511592 () Unit!37491)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!546 (array!74314 array!74316 (_ BitVec 32) (_ BitVec 32) V!43489 V!43489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37491)

(assert (=> b!1146003 (= lt!511592 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98630 res!763037) b!1146002))

(assert (= (and b!1146002 res!763027) b!1145992))

(assert (= (and b!1145992 res!763032) b!1145981))

(assert (= (and b!1145981 res!763024) b!1145991))

(assert (= (and b!1145991 res!763030) b!1145996))

(assert (= (and b!1145996 res!763028) b!1145978))

(assert (= (and b!1145978 res!763025) b!1146001))

(assert (= (and b!1146001 res!763029) b!1145997))

(assert (= (and b!1145997 res!763035) b!1145974))

(assert (= (and b!1145974 res!763026) b!1145980))

(assert (= (and b!1145980 (not res!763036)) b!1145989))

(assert (= (and b!1145989 (not res!763031)) b!1146003))

(assert (= (and b!1146003 c!113003) b!1145975))

(assert (= (and b!1146003 (not c!113003)) b!1145998))

(assert (= (or b!1145975 b!1145998) bm!52412))

(assert (= (or b!1145975 b!1145998) bm!52409))

(assert (= (and b!1146003 (not res!763033)) b!1145976))

(assert (= (and b!1145976 c!113001) b!1145985))

(assert (= (and b!1145976 (not c!113001)) b!1145993))

(assert (= (and b!1145985 c!113002) b!1145984))

(assert (= (and b!1145985 (not c!113002)) b!1145982))

(assert (= (and b!1145982 c!113006) b!1145983))

(assert (= (and b!1145982 (not c!113006)) b!1145977))

(assert (= (and b!1145977 c!113004) b!1145995))

(assert (= (and b!1145977 (not c!113004)) b!1145986))

(assert (= (or b!1145983 b!1145995) bm!52408))

(assert (= (or b!1145983 b!1145995) bm!52415))

(assert (= (or b!1145983 b!1145995) bm!52414))

(assert (= (or b!1145984 bm!52414) bm!52410))

(assert (= (or b!1145984 bm!52408) bm!52411))

(assert (= (or b!1145984 bm!52415) bm!52413))

(assert (= (and b!1145985 c!113005) b!1145987))

(assert (= (and b!1145985 (not c!113005)) b!1145988))

(assert (= (and b!1145985 res!763034) b!1145999))

(assert (= (and b!1145976 res!763023) b!1145994))

(assert (= (and b!1146000 condMapEmpty!44981) mapIsEmpty!44981))

(assert (= (and b!1146000 (not condMapEmpty!44981)) mapNonEmpty!44981))

(get-info :version)

(assert (= (and mapNonEmpty!44981 ((_ is ValueCellFull!13676) mapValue!44981)) b!1145979))

(assert (= (and b!1146000 ((_ is ValueCellFull!13676) mapDefault!44981)) b!1145990))

(assert (= start!98630 b!1146000))

(declare-fun b_lambda!19329 () Bool)

(assert (=> (not b_lambda!19329) (not b!1145989)))

(declare-fun t!36345 () Bool)

(declare-fun tb!9045 () Bool)

(assert (=> (and start!98630 (= defaultEntry!1004 defaultEntry!1004) t!36345) tb!9045))

(declare-fun result!18663 () Bool)

(assert (=> tb!9045 (= result!18663 tp_is_empty!28771)))

(assert (=> b!1145989 t!36345))

(declare-fun b_and!39311 () Bool)

(assert (= b_and!39309 (and (=> t!36345 result!18663) b_and!39311)))

(declare-fun m!1056299 () Bool)

(assert (=> b!1145981 m!1056299))

(declare-fun m!1056301 () Bool)

(assert (=> b!1146003 m!1056301))

(declare-fun m!1056303 () Bool)

(assert (=> b!1146003 m!1056303))

(declare-fun m!1056305 () Bool)

(assert (=> b!1145974 m!1056305))

(declare-fun m!1056307 () Bool)

(assert (=> b!1145980 m!1056307))

(declare-fun m!1056309 () Bool)

(assert (=> b!1145980 m!1056309))

(declare-fun m!1056311 () Bool)

(assert (=> b!1145997 m!1056311))

(declare-fun m!1056313 () Bool)

(assert (=> b!1145997 m!1056313))

(declare-fun m!1056315 () Bool)

(assert (=> bm!52412 m!1056315))

(declare-fun m!1056317 () Bool)

(assert (=> b!1145991 m!1056317))

(assert (=> b!1145976 m!1056315))

(declare-fun m!1056319 () Bool)

(assert (=> b!1145976 m!1056319))

(declare-fun m!1056321 () Bool)

(assert (=> b!1145976 m!1056321))

(assert (=> b!1145976 m!1056301))

(declare-fun m!1056323 () Bool)

(assert (=> b!1145976 m!1056323))

(declare-fun m!1056325 () Bool)

(assert (=> b!1145976 m!1056325))

(assert (=> b!1145976 m!1056319))

(declare-fun m!1056327 () Bool)

(assert (=> b!1145976 m!1056327))

(assert (=> b!1145976 m!1056301))

(assert (=> b!1145976 m!1056321))

(assert (=> b!1145976 m!1056301))

(declare-fun m!1056329 () Bool)

(assert (=> b!1145976 m!1056329))

(declare-fun m!1056331 () Bool)

(assert (=> mapNonEmpty!44981 m!1056331))

(declare-fun m!1056333 () Bool)

(assert (=> bm!52413 m!1056333))

(declare-fun m!1056335 () Bool)

(assert (=> bm!52411 m!1056335))

(declare-fun m!1056337 () Bool)

(assert (=> b!1146002 m!1056337))

(declare-fun m!1056339 () Bool)

(assert (=> b!1146001 m!1056339))

(declare-fun m!1056341 () Bool)

(assert (=> b!1145985 m!1056341))

(declare-fun m!1056343 () Bool)

(assert (=> b!1145985 m!1056343))

(declare-fun m!1056345 () Bool)

(assert (=> b!1145985 m!1056345))

(declare-fun m!1056347 () Bool)

(assert (=> b!1145985 m!1056347))

(declare-fun m!1056349 () Bool)

(assert (=> bm!52409 m!1056349))

(declare-fun m!1056351 () Bool)

(assert (=> b!1145987 m!1056351))

(assert (=> b!1145999 m!1056351))

(declare-fun m!1056353 () Bool)

(assert (=> b!1145975 m!1056353))

(declare-fun m!1056355 () Bool)

(assert (=> b!1145978 m!1056355))

(declare-fun m!1056357 () Bool)

(assert (=> b!1145984 m!1056357))

(declare-fun m!1056359 () Bool)

(assert (=> b!1145984 m!1056359))

(declare-fun m!1056361 () Bool)

(assert (=> b!1145984 m!1056361))

(declare-fun m!1056363 () Bool)

(assert (=> start!98630 m!1056363))

(declare-fun m!1056365 () Bool)

(assert (=> start!98630 m!1056365))

(declare-fun m!1056367 () Bool)

(assert (=> b!1145989 m!1056367))

(declare-fun m!1056369 () Bool)

(assert (=> b!1145989 m!1056369))

(declare-fun m!1056371 () Bool)

(assert (=> b!1145989 m!1056371))

(declare-fun m!1056373 () Bool)

(assert (=> b!1145989 m!1056373))

(declare-fun m!1056375 () Bool)

(assert (=> b!1145994 m!1056375))

(declare-fun m!1056377 () Bool)

(assert (=> bm!52410 m!1056377))

(check-sat (not bm!52413) (not b!1145981) (not b!1145999) (not b!1145974) (not b!1145994) (not b!1145976) (not b_lambda!19329) (not b!1145980) (not b!1145984) (not b!1146003) (not bm!52411) (not bm!52412) (not b!1145997) (not b!1145975) (not b!1145987) (not b!1145989) (not b!1145991) (not b!1146002) (not b_next!24241) (not bm!52410) (not start!98630) (not b!1145978) (not bm!52409) tp_is_empty!28771 (not mapNonEmpty!44981) (not b!1145985) b_and!39311)
(check-sat b_and!39311 (not b_next!24241))

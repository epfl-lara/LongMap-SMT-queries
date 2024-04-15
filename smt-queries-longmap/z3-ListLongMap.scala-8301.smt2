; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101148 () Bool)

(assert start!101148)

(declare-fun b_free!26077 () Bool)

(declare-fun b_next!26077 () Bool)

(assert (=> start!101148 (= b_free!26077 (not b_next!26077))))

(declare-fun tp!91252 () Bool)

(declare-fun b_and!43253 () Bool)

(assert (=> start!101148 (= tp!91252 b_and!43253)))

(declare-fun b!1213459 () Bool)

(declare-fun res!805744 () Bool)

(declare-fun e!689126 () Bool)

(assert (=> b!1213459 (=> (not res!805744) (not e!689126))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78264 0))(
  ( (array!78265 (arr!37767 (Array (_ BitVec 32) (_ BitVec 64))) (size!38305 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78264)

(assert (=> b!1213459 (= res!805744 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38305 _keys!1208))))))

(declare-fun e!689133 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1213460 () Bool)

(declare-fun arrayContainsKey!0 (array!78264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213460 (= e!689133 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60382 () Bool)

(declare-datatypes ((V!46169 0))(
  ( (V!46170 (val!15447 Int)) )
))
(declare-datatypes ((tuple2!19930 0))(
  ( (tuple2!19931 (_1!9976 (_ BitVec 64)) (_2!9976 V!46169)) )
))
(declare-datatypes ((List!26708 0))(
  ( (Nil!26705) (Cons!26704 (h!27913 tuple2!19930) (t!39756 List!26708)) )
))
(declare-datatypes ((ListLongMap!17899 0))(
  ( (ListLongMap!17900 (toList!8965 List!26708)) )
))
(declare-fun call!60386 () ListLongMap!17899)

(declare-fun call!60392 () ListLongMap!17899)

(assert (=> bm!60382 (= call!60386 call!60392)))

(declare-fun c!119878 () Bool)

(declare-fun lt!551592 () ListLongMap!17899)

(declare-fun bm!60383 () Bool)

(declare-fun call!60389 () Bool)

(declare-fun contains!6972 (ListLongMap!17899 (_ BitVec 64)) Bool)

(assert (=> bm!60383 (= call!60389 (contains!6972 (ite c!119878 lt!551592 call!60386) k0!934))))

(declare-fun b!1213461 () Bool)

(declare-datatypes ((Unit!40088 0))(
  ( (Unit!40089) )
))
(declare-fun e!689123 () Unit!40088)

(declare-fun lt!551596 () Unit!40088)

(assert (=> b!1213461 (= e!689123 lt!551596)))

(declare-fun call!60390 () Unit!40088)

(assert (=> b!1213461 (= lt!551596 call!60390)))

(declare-fun call!60391 () Bool)

(assert (=> b!1213461 call!60391))

(declare-fun b!1213463 () Bool)

(declare-fun res!805742 () Bool)

(assert (=> b!1213463 (=> (not res!805742) (not e!689126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213463 (= res!805742 (validKeyInArray!0 k0!934))))

(declare-fun bm!60384 () Bool)

(assert (=> bm!60384 (= call!60391 call!60389)))

(declare-fun b!1213464 () Bool)

(declare-fun e!689130 () Bool)

(declare-fun tp_is_empty!30781 () Bool)

(assert (=> b!1213464 (= e!689130 tp_is_empty!30781)))

(declare-fun b!1213465 () Bool)

(declare-fun e!689121 () Unit!40088)

(declare-fun Unit!40090 () Unit!40088)

(assert (=> b!1213465 (= e!689121 Unit!40090)))

(declare-fun mapIsEmpty!48046 () Bool)

(declare-fun mapRes!48046 () Bool)

(assert (=> mapIsEmpty!48046 mapRes!48046))

(declare-fun b!1213466 () Bool)

(declare-fun e!689137 () Bool)

(declare-fun e!689136 () Bool)

(assert (=> b!1213466 (= e!689137 e!689136)))

(declare-fun res!805739 () Bool)

(assert (=> b!1213466 (=> res!805739 e!689136)))

(assert (=> b!1213466 (= res!805739 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!551582 () array!78264)

(declare-fun minValue!944 () V!46169)

(declare-datatypes ((ValueCell!14681 0))(
  ( (ValueCellFull!14681 (v!18099 V!46169)) (EmptyCell!14681) )
))
(declare-datatypes ((array!78266 0))(
  ( (array!78267 (arr!37768 (Array (_ BitVec 32) ValueCell!14681)) (size!38306 (_ BitVec 32))) )
))
(declare-fun lt!551602 () array!78266)

(declare-fun zeroValue!944 () V!46169)

(declare-fun lt!551600 () ListLongMap!17899)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5406 (array!78264 array!78266 (_ BitVec 32) (_ BitVec 32) V!46169 V!46169 (_ BitVec 32) Int) ListLongMap!17899)

(assert (=> b!1213466 (= lt!551600 (getCurrentListMapNoExtraKeys!5406 lt!551582 lt!551602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551587 () V!46169)

(declare-fun _values!996 () array!78266)

(assert (=> b!1213466 (= lt!551602 (array!78267 (store (arr!37768 _values!996) i!673 (ValueCellFull!14681 lt!551587)) (size!38306 _values!996)))))

(declare-fun dynLambda!3260 (Int (_ BitVec 64)) V!46169)

(assert (=> b!1213466 (= lt!551587 (dynLambda!3260 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551583 () ListLongMap!17899)

(assert (=> b!1213466 (= lt!551583 (getCurrentListMapNoExtraKeys!5406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1213467 () Bool)

(declare-fun e!689127 () Bool)

(assert (=> b!1213467 (= e!689127 (and e!689130 mapRes!48046))))

(declare-fun condMapEmpty!48046 () Bool)

(declare-fun mapDefault!48046 () ValueCell!14681)

(assert (=> b!1213467 (= condMapEmpty!48046 (= (arr!37768 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14681)) mapDefault!48046)))))

(declare-fun b!1213468 () Bool)

(declare-fun res!805746 () Bool)

(assert (=> b!1213468 (=> (not res!805746) (not e!689126))))

(assert (=> b!1213468 (= res!805746 (and (= (size!38306 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38305 _keys!1208) (size!38306 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!60387 () ListLongMap!17899)

(declare-fun bm!60385 () Bool)

(assert (=> bm!60385 (= call!60387 (getCurrentListMapNoExtraKeys!5406 lt!551582 lt!551602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213469 () Bool)

(assert (=> b!1213469 (= e!689123 e!689121)))

(declare-fun c!119881 () Bool)

(declare-fun lt!551598 () Bool)

(assert (=> b!1213469 (= c!119881 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551598))))

(declare-fun b!1213470 () Bool)

(declare-fun res!805750 () Bool)

(declare-fun e!689132 () Bool)

(assert (=> b!1213470 (=> (not res!805750) (not e!689132))))

(declare-datatypes ((List!26709 0))(
  ( (Nil!26706) (Cons!26705 (h!27914 (_ BitVec 64)) (t!39757 List!26709)) )
))
(declare-fun arrayNoDuplicates!0 (array!78264 (_ BitVec 32) List!26709) Bool)

(assert (=> b!1213470 (= res!805750 (arrayNoDuplicates!0 lt!551582 #b00000000000000000000000000000000 Nil!26706))))

(declare-fun b!1213471 () Bool)

(declare-fun e!689124 () Bool)

(assert (=> b!1213471 (= e!689136 e!689124)))

(declare-fun res!805753 () Bool)

(assert (=> b!1213471 (=> res!805753 e!689124)))

(assert (=> b!1213471 (= res!805753 (not (= (select (arr!37767 _keys!1208) from!1455) k0!934)))))

(declare-fun e!689122 () Bool)

(assert (=> b!1213471 e!689122))

(declare-fun c!119882 () Bool)

(assert (=> b!1213471 (= c!119882 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551588 () Unit!40088)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1077 (array!78264 array!78266 (_ BitVec 32) (_ BitVec 32) V!46169 V!46169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40088)

(assert (=> b!1213471 (= lt!551588 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!689135 () Bool)

(declare-fun b!1213472 () Bool)

(assert (=> b!1213472 (= e!689135 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60385 () ListLongMap!17899)

(declare-fun bm!60386 () Bool)

(assert (=> bm!60386 (= call!60385 (getCurrentListMapNoExtraKeys!5406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213473 () Bool)

(declare-fun -!1841 (ListLongMap!17899 (_ BitVec 64)) ListLongMap!17899)

(assert (=> b!1213473 (= e!689122 (= call!60387 (-!1841 call!60385 k0!934)))))

(declare-fun bm!60387 () Bool)

(declare-fun call!60388 () Unit!40088)

(declare-fun c!119880 () Bool)

(declare-fun lt!551584 () ListLongMap!17899)

(declare-fun addStillContains!1069 (ListLongMap!17899 (_ BitVec 64) V!46169 (_ BitVec 64)) Unit!40088)

(assert (=> bm!60387 (= call!60388 (addStillContains!1069 lt!551584 (ite (or c!119878 c!119880) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119878 c!119880) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapNonEmpty!48046 () Bool)

(declare-fun tp!91253 () Bool)

(declare-fun e!689125 () Bool)

(assert (=> mapNonEmpty!48046 (= mapRes!48046 (and tp!91253 e!689125))))

(declare-fun mapKey!48046 () (_ BitVec 32))

(declare-fun mapRest!48046 () (Array (_ BitVec 32) ValueCell!14681))

(declare-fun mapValue!48046 () ValueCell!14681)

(assert (=> mapNonEmpty!48046 (= (arr!37768 _values!996) (store mapRest!48046 mapKey!48046 mapValue!48046))))

(declare-fun b!1213474 () Bool)

(declare-fun +!4084 (ListLongMap!17899 tuple2!19930) ListLongMap!17899)

(assert (=> b!1213474 (contains!6972 (+!4084 lt!551592 (tuple2!19931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!551586 () Unit!40088)

(assert (=> b!1213474 (= lt!551586 (addStillContains!1069 lt!551592 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1213474 call!60389))

(assert (=> b!1213474 (= lt!551592 call!60392)))

(declare-fun lt!551603 () Unit!40088)

(assert (=> b!1213474 (= lt!551603 call!60388)))

(declare-fun e!689129 () Unit!40088)

(assert (=> b!1213474 (= e!689129 lt!551586)))

(declare-fun b!1213475 () Bool)

(declare-fun e!689131 () Unit!40088)

(declare-fun Unit!40091 () Unit!40088)

(assert (=> b!1213475 (= e!689131 Unit!40091)))

(assert (=> b!1213475 (= lt!551598 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213475 (= c!119878 (and (not lt!551598) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551591 () Unit!40088)

(assert (=> b!1213475 (= lt!551591 e!689129)))

(declare-fun lt!551597 () Unit!40088)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!609 (array!78264 array!78266 (_ BitVec 32) (_ BitVec 32) V!46169 V!46169 (_ BitVec 64) (_ BitVec 32) Int) Unit!40088)

(assert (=> b!1213475 (= lt!551597 (lemmaListMapContainsThenArrayContainsFrom!609 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119883 () Bool)

(assert (=> b!1213475 (= c!119883 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805749 () Bool)

(assert (=> b!1213475 (= res!805749 e!689133)))

(assert (=> b!1213475 (=> (not res!805749) (not e!689135))))

(assert (=> b!1213475 e!689135))

(declare-fun lt!551601 () Unit!40088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78264 (_ BitVec 32) (_ BitVec 32)) Unit!40088)

(assert (=> b!1213475 (= lt!551601 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213475 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26706)))

(declare-fun lt!551590 () Unit!40088)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78264 (_ BitVec 64) (_ BitVec 32) List!26709) Unit!40088)

(assert (=> b!1213475 (= lt!551590 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26706))))

(assert (=> b!1213475 false))

(declare-fun b!1213476 () Bool)

(assert (=> b!1213476 (= e!689126 e!689132)))

(declare-fun res!805745 () Bool)

(assert (=> b!1213476 (=> (not res!805745) (not e!689132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78264 (_ BitVec 32)) Bool)

(assert (=> b!1213476 (= res!805745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551582 mask!1564))))

(assert (=> b!1213476 (= lt!551582 (array!78265 (store (arr!37767 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38305 _keys!1208)))))

(declare-fun bm!60388 () Bool)

(assert (=> bm!60388 (= call!60390 call!60388)))

(declare-fun b!1213477 () Bool)

(declare-fun res!805748 () Bool)

(assert (=> b!1213477 (=> (not res!805748) (not e!689126))))

(assert (=> b!1213477 (= res!805748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213478 () Bool)

(assert (=> b!1213478 call!60391))

(declare-fun lt!551585 () Unit!40088)

(assert (=> b!1213478 (= lt!551585 call!60390)))

(assert (=> b!1213478 (= e!689121 lt!551585)))

(declare-fun bm!60389 () Bool)

(assert (=> bm!60389 (= call!60392 (+!4084 lt!551584 (ite (or c!119878 c!119880) (tuple2!19931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1213479 () Bool)

(assert (=> b!1213479 (= e!689125 tp_is_empty!30781)))

(declare-fun b!1213480 () Bool)

(assert (=> b!1213480 (= c!119880 (and (not lt!551598) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1213480 (= e!689129 e!689123)))

(declare-fun b!1213481 () Bool)

(assert (=> b!1213481 (= e!689124 true)))

(declare-fun e!689128 () Bool)

(assert (=> b!1213481 e!689128))

(declare-fun res!805743 () Bool)

(assert (=> b!1213481 (=> (not res!805743) (not e!689128))))

(declare-fun lt!551594 () ListLongMap!17899)

(assert (=> b!1213481 (= res!805743 (= lt!551594 lt!551584))))

(assert (=> b!1213481 (= lt!551594 (-!1841 lt!551583 k0!934))))

(declare-fun lt!551589 () V!46169)

(assert (=> b!1213481 (= (-!1841 (+!4084 lt!551584 (tuple2!19931 (select (arr!37767 _keys!1208) from!1455) lt!551589)) (select (arr!37767 _keys!1208) from!1455)) lt!551584)))

(declare-fun lt!551599 () Unit!40088)

(declare-fun addThenRemoveForNewKeyIsSame!274 (ListLongMap!17899 (_ BitVec 64) V!46169) Unit!40088)

(assert (=> b!1213481 (= lt!551599 (addThenRemoveForNewKeyIsSame!274 lt!551584 (select (arr!37767 _keys!1208) from!1455) lt!551589))))

(declare-fun get!19271 (ValueCell!14681 V!46169) V!46169)

(assert (=> b!1213481 (= lt!551589 (get!19271 (select (arr!37768 _values!996) from!1455) lt!551587))))

(declare-fun lt!551595 () Unit!40088)

(assert (=> b!1213481 (= lt!551595 e!689131)))

(declare-fun c!119879 () Bool)

(assert (=> b!1213481 (= c!119879 (contains!6972 lt!551584 k0!934))))

(assert (=> b!1213481 (= lt!551584 (getCurrentListMapNoExtraKeys!5406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213482 () Bool)

(declare-fun res!805740 () Bool)

(assert (=> b!1213482 (=> (not res!805740) (not e!689126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213482 (= res!805740 (validMask!0 mask!1564))))

(declare-fun b!1213483 () Bool)

(assert (=> b!1213483 (= e!689132 (not e!689137))))

(declare-fun res!805747 () Bool)

(assert (=> b!1213483 (=> res!805747 e!689137)))

(assert (=> b!1213483 (= res!805747 (bvsgt from!1455 i!673))))

(assert (=> b!1213483 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551593 () Unit!40088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78264 (_ BitVec 64) (_ BitVec 32)) Unit!40088)

(assert (=> b!1213483 (= lt!551593 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1213484 () Bool)

(assert (=> b!1213484 (= e!689133 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551598) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213462 () Bool)

(declare-fun res!805751 () Bool)

(assert (=> b!1213462 (=> (not res!805751) (not e!689126))))

(assert (=> b!1213462 (= res!805751 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26706))))

(declare-fun res!805741 () Bool)

(assert (=> start!101148 (=> (not res!805741) (not e!689126))))

(assert (=> start!101148 (= res!805741 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38305 _keys!1208))))))

(assert (=> start!101148 e!689126))

(assert (=> start!101148 tp_is_empty!30781))

(declare-fun array_inv!28874 (array!78264) Bool)

(assert (=> start!101148 (array_inv!28874 _keys!1208)))

(assert (=> start!101148 true))

(assert (=> start!101148 tp!91252))

(declare-fun array_inv!28875 (array!78266) Bool)

(assert (=> start!101148 (and (array_inv!28875 _values!996) e!689127)))

(declare-fun b!1213485 () Bool)

(declare-fun res!805752 () Bool)

(assert (=> b!1213485 (=> (not res!805752) (not e!689126))))

(assert (=> b!1213485 (= res!805752 (= (select (arr!37767 _keys!1208) i!673) k0!934))))

(declare-fun b!1213486 () Bool)

(assert (=> b!1213486 (= e!689122 (= call!60387 call!60385))))

(declare-fun b!1213487 () Bool)

(assert (=> b!1213487 (= e!689128 (= lt!551594 (getCurrentListMapNoExtraKeys!5406 lt!551582 lt!551602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213488 () Bool)

(declare-fun Unit!40092 () Unit!40088)

(assert (=> b!1213488 (= e!689131 Unit!40092)))

(assert (= (and start!101148 res!805741) b!1213482))

(assert (= (and b!1213482 res!805740) b!1213468))

(assert (= (and b!1213468 res!805746) b!1213477))

(assert (= (and b!1213477 res!805748) b!1213462))

(assert (= (and b!1213462 res!805751) b!1213459))

(assert (= (and b!1213459 res!805744) b!1213463))

(assert (= (and b!1213463 res!805742) b!1213485))

(assert (= (and b!1213485 res!805752) b!1213476))

(assert (= (and b!1213476 res!805745) b!1213470))

(assert (= (and b!1213470 res!805750) b!1213483))

(assert (= (and b!1213483 (not res!805747)) b!1213466))

(assert (= (and b!1213466 (not res!805739)) b!1213471))

(assert (= (and b!1213471 c!119882) b!1213473))

(assert (= (and b!1213471 (not c!119882)) b!1213486))

(assert (= (or b!1213473 b!1213486) bm!60385))

(assert (= (or b!1213473 b!1213486) bm!60386))

(assert (= (and b!1213471 (not res!805753)) b!1213481))

(assert (= (and b!1213481 c!119879) b!1213475))

(assert (= (and b!1213481 (not c!119879)) b!1213488))

(assert (= (and b!1213475 c!119878) b!1213474))

(assert (= (and b!1213475 (not c!119878)) b!1213480))

(assert (= (and b!1213480 c!119880) b!1213461))

(assert (= (and b!1213480 (not c!119880)) b!1213469))

(assert (= (and b!1213469 c!119881) b!1213478))

(assert (= (and b!1213469 (not c!119881)) b!1213465))

(assert (= (or b!1213461 b!1213478) bm!60388))

(assert (= (or b!1213461 b!1213478) bm!60382))

(assert (= (or b!1213461 b!1213478) bm!60384))

(assert (= (or b!1213474 bm!60384) bm!60383))

(assert (= (or b!1213474 bm!60388) bm!60387))

(assert (= (or b!1213474 bm!60382) bm!60389))

(assert (= (and b!1213475 c!119883) b!1213460))

(assert (= (and b!1213475 (not c!119883)) b!1213484))

(assert (= (and b!1213475 res!805749) b!1213472))

(assert (= (and b!1213481 res!805743) b!1213487))

(assert (= (and b!1213467 condMapEmpty!48046) mapIsEmpty!48046))

(assert (= (and b!1213467 (not condMapEmpty!48046)) mapNonEmpty!48046))

(get-info :version)

(assert (= (and mapNonEmpty!48046 ((_ is ValueCellFull!14681) mapValue!48046)) b!1213479))

(assert (= (and b!1213467 ((_ is ValueCellFull!14681) mapDefault!48046)) b!1213464))

(assert (= start!101148 b!1213467))

(declare-fun b_lambda!21743 () Bool)

(assert (=> (not b_lambda!21743) (not b!1213466)))

(declare-fun t!39755 () Bool)

(declare-fun tb!10869 () Bool)

(assert (=> (and start!101148 (= defaultEntry!1004 defaultEntry!1004) t!39755) tb!10869))

(declare-fun result!22343 () Bool)

(assert (=> tb!10869 (= result!22343 tp_is_empty!30781)))

(assert (=> b!1213466 t!39755))

(declare-fun b_and!43255 () Bool)

(assert (= b_and!43253 (and (=> t!39755 result!22343) b_and!43255)))

(declare-fun m!1118295 () Bool)

(assert (=> b!1213472 m!1118295))

(declare-fun m!1118297 () Bool)

(assert (=> b!1213466 m!1118297))

(declare-fun m!1118299 () Bool)

(assert (=> b!1213466 m!1118299))

(declare-fun m!1118301 () Bool)

(assert (=> b!1213466 m!1118301))

(declare-fun m!1118303 () Bool)

(assert (=> b!1213466 m!1118303))

(declare-fun m!1118305 () Bool)

(assert (=> b!1213485 m!1118305))

(declare-fun m!1118307 () Bool)

(assert (=> bm!60383 m!1118307))

(declare-fun m!1118309 () Bool)

(assert (=> mapNonEmpty!48046 m!1118309))

(declare-fun m!1118311 () Bool)

(assert (=> b!1213462 m!1118311))

(declare-fun m!1118313 () Bool)

(assert (=> b!1213470 m!1118313))

(declare-fun m!1118315 () Bool)

(assert (=> b!1213474 m!1118315))

(assert (=> b!1213474 m!1118315))

(declare-fun m!1118317 () Bool)

(assert (=> b!1213474 m!1118317))

(declare-fun m!1118319 () Bool)

(assert (=> b!1213474 m!1118319))

(declare-fun m!1118321 () Bool)

(assert (=> b!1213483 m!1118321))

(declare-fun m!1118323 () Bool)

(assert (=> b!1213483 m!1118323))

(declare-fun m!1118325 () Bool)

(assert (=> b!1213487 m!1118325))

(declare-fun m!1118327 () Bool)

(assert (=> b!1213476 m!1118327))

(declare-fun m!1118329 () Bool)

(assert (=> b!1213476 m!1118329))

(declare-fun m!1118331 () Bool)

(assert (=> bm!60387 m!1118331))

(assert (=> bm!60385 m!1118325))

(assert (=> b!1213460 m!1118295))

(declare-fun m!1118333 () Bool)

(assert (=> b!1213477 m!1118333))

(declare-fun m!1118335 () Bool)

(assert (=> bm!60386 m!1118335))

(declare-fun m!1118337 () Bool)

(assert (=> b!1213463 m!1118337))

(declare-fun m!1118339 () Bool)

(assert (=> b!1213475 m!1118339))

(declare-fun m!1118341 () Bool)

(assert (=> b!1213475 m!1118341))

(declare-fun m!1118343 () Bool)

(assert (=> b!1213475 m!1118343))

(declare-fun m!1118345 () Bool)

(assert (=> b!1213475 m!1118345))

(declare-fun m!1118347 () Bool)

(assert (=> start!101148 m!1118347))

(declare-fun m!1118349 () Bool)

(assert (=> start!101148 m!1118349))

(declare-fun m!1118351 () Bool)

(assert (=> b!1213482 m!1118351))

(declare-fun m!1118353 () Bool)

(assert (=> b!1213471 m!1118353))

(declare-fun m!1118355 () Bool)

(assert (=> b!1213471 m!1118355))

(assert (=> b!1213481 m!1118335))

(declare-fun m!1118357 () Bool)

(assert (=> b!1213481 m!1118357))

(declare-fun m!1118359 () Bool)

(assert (=> b!1213481 m!1118359))

(declare-fun m!1118361 () Bool)

(assert (=> b!1213481 m!1118361))

(declare-fun m!1118363 () Bool)

(assert (=> b!1213481 m!1118363))

(assert (=> b!1213481 m!1118363))

(assert (=> b!1213481 m!1118353))

(declare-fun m!1118365 () Bool)

(assert (=> b!1213481 m!1118365))

(assert (=> b!1213481 m!1118353))

(assert (=> b!1213481 m!1118353))

(declare-fun m!1118367 () Bool)

(assert (=> b!1213481 m!1118367))

(declare-fun m!1118369 () Bool)

(assert (=> b!1213481 m!1118369))

(assert (=> b!1213481 m!1118357))

(declare-fun m!1118371 () Bool)

(assert (=> b!1213473 m!1118371))

(declare-fun m!1118373 () Bool)

(assert (=> bm!60389 m!1118373))

(check-sat (not b!1213462) (not b!1213477) (not bm!60383) (not b!1213475) (not bm!60387) b_and!43255 (not b!1213481) (not mapNonEmpty!48046) (not b!1213470) tp_is_empty!30781 (not b!1213476) (not b!1213474) (not b!1213460) (not b_lambda!21743) (not bm!60389) (not b!1213482) (not bm!60386) (not b!1213472) (not start!101148) (not b_next!26077) (not b!1213463) (not b!1213483) (not b!1213473) (not b!1213466) (not b!1213487) (not b!1213471) (not bm!60385))
(check-sat b_and!43255 (not b_next!26077))

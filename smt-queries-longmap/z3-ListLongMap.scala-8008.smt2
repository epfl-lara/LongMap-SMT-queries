; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98890 () Bool)

(assert start!98890)

(declare-fun b_free!24495 () Bool)

(declare-fun b_next!24495 () Bool)

(assert (=> start!98890 (= b_free!24495 (not b_next!24495))))

(declare-fun tp!86196 () Bool)

(declare-fun b_and!39839 () Bool)

(assert (=> start!98890 (= tp!86196 b_and!39839)))

(declare-fun bm!55479 () Bool)

(declare-fun call!55483 () Bool)

(declare-fun call!55487 () Bool)

(assert (=> bm!55479 (= call!55483 call!55487)))

(declare-fun b!1157782 () Bool)

(declare-fun e!658410 () Bool)

(declare-datatypes ((V!43827 0))(
  ( (V!43828 (val!14569 Int)) )
))
(declare-datatypes ((tuple2!18540 0))(
  ( (tuple2!18541 (_1!9281 (_ BitVec 64)) (_2!9281 V!43827)) )
))
(declare-datatypes ((List!25280 0))(
  ( (Nil!25277) (Cons!25276 (h!26485 tuple2!18540) (t!36767 List!25280)) )
))
(declare-datatypes ((ListLongMap!16509 0))(
  ( (ListLongMap!16510 (toList!8270 List!25280)) )
))
(declare-fun call!55489 () ListLongMap!16509)

(declare-fun call!55484 () ListLongMap!16509)

(assert (=> b!1157782 (= e!658410 (= call!55489 call!55484))))

(declare-fun b!1157783 () Bool)

(declare-fun e!658418 () Bool)

(declare-fun e!658406 () Bool)

(declare-fun mapRes!45362 () Bool)

(assert (=> b!1157783 (= e!658418 (and e!658406 mapRes!45362))))

(declare-fun condMapEmpty!45362 () Bool)

(declare-datatypes ((ValueCell!13803 0))(
  ( (ValueCellFull!13803 (v!17206 V!43827)) (EmptyCell!13803) )
))
(declare-datatypes ((array!74893 0))(
  ( (array!74894 (arr!36097 (Array (_ BitVec 32) ValueCell!13803)) (size!36633 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74893)

(declare-fun mapDefault!45362 () ValueCell!13803)

(assert (=> b!1157783 (= condMapEmpty!45362 (= (arr!36097 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13803)) mapDefault!45362)))))

(declare-fun b!1157784 () Bool)

(declare-fun tp_is_empty!29025 () Bool)

(assert (=> b!1157784 (= e!658406 tp_is_empty!29025)))

(declare-fun b!1157785 () Bool)

(declare-datatypes ((Unit!38144 0))(
  ( (Unit!38145) )
))
(declare-fun e!658420 () Unit!38144)

(declare-fun Unit!38146 () Unit!38144)

(assert (=> b!1157785 (= e!658420 Unit!38146)))

(declare-datatypes ((array!74895 0))(
  ( (array!74896 (arr!36098 (Array (_ BitVec 32) (_ BitVec 64))) (size!36634 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74895)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!658407 () Bool)

(declare-fun b!1157786 () Bool)

(declare-fun arrayContainsKey!0 (array!74895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157786 (= e!658407 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157787 () Bool)

(declare-fun res!768810 () Bool)

(declare-fun e!658414 () Bool)

(assert (=> b!1157787 (=> (not res!768810) (not e!658414))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157787 (= res!768810 (validMask!0 mask!1564))))

(declare-fun zeroValue!944 () V!43827)

(declare-fun call!55485 () Unit!38144)

(declare-fun c!115313 () Bool)

(declare-fun lt!520071 () ListLongMap!16509)

(declare-fun minValue!944 () V!43827)

(declare-fun bm!55480 () Bool)

(declare-fun c!115316 () Bool)

(declare-fun addStillContains!923 (ListLongMap!16509 (_ BitVec 64) V!43827 (_ BitVec 64)) Unit!38144)

(assert (=> bm!55480 (= call!55485 (addStillContains!923 lt!520071 (ite (or c!115316 c!115313) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115316 c!115313) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1157789 () Bool)

(declare-fun e!658422 () Bool)

(declare-fun e!658409 () Bool)

(assert (=> b!1157789 (= e!658422 (not e!658409))))

(declare-fun res!768813 () Bool)

(assert (=> b!1157789 (=> res!768813 e!658409)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157789 (= res!768813 (bvsgt from!1455 i!673))))

(assert (=> b!1157789 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520078 () Unit!38144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74895 (_ BitVec 64) (_ BitVec 32)) Unit!38144)

(assert (=> b!1157789 (= lt!520078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!55481 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4737 (array!74895 array!74893 (_ BitVec 32) (_ BitVec 32) V!43827 V!43827 (_ BitVec 32) Int) ListLongMap!16509)

(assert (=> bm!55481 (= call!55484 (getCurrentListMapNoExtraKeys!4737 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157790 () Bool)

(declare-fun e!658415 () Bool)

(assert (=> b!1157790 (= e!658415 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157791 () Bool)

(declare-fun e!658408 () Unit!38144)

(declare-fun Unit!38147 () Unit!38144)

(assert (=> b!1157791 (= e!658408 Unit!38147)))

(declare-fun b!1157792 () Bool)

(declare-fun e!658417 () Bool)

(assert (=> b!1157792 (= e!658417 tp_is_empty!29025)))

(declare-fun bm!55482 () Bool)

(declare-fun call!55486 () ListLongMap!16509)

(declare-fun call!55488 () ListLongMap!16509)

(assert (=> bm!55482 (= call!55486 call!55488)))

(declare-fun b!1157793 () Bool)

(assert (=> b!1157793 call!55483))

(declare-fun lt!520086 () Unit!38144)

(declare-fun call!55482 () Unit!38144)

(assert (=> b!1157793 (= lt!520086 call!55482)))

(assert (=> b!1157793 (= e!658420 lt!520086)))

(declare-fun mapIsEmpty!45362 () Bool)

(assert (=> mapIsEmpty!45362 mapRes!45362))

(declare-fun b!1157794 () Bool)

(declare-fun e!658412 () Bool)

(declare-fun e!658421 () Bool)

(assert (=> b!1157794 (= e!658412 e!658421)))

(declare-fun res!768805 () Bool)

(assert (=> b!1157794 (=> res!768805 e!658421)))

(assert (=> b!1157794 (= res!768805 (not (= (select (arr!36098 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1157794 e!658410))

(declare-fun c!115318 () Bool)

(assert (=> b!1157794 (= c!115318 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520074 () Unit!38144)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!616 (array!74895 array!74893 (_ BitVec 32) (_ BitVec 32) V!43827 V!43827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38144)

(assert (=> b!1157794 (= lt!520074 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!658411 () Bool)

(declare-fun lt!520089 () array!74895)

(declare-fun lt!520084 () ListLongMap!16509)

(declare-fun b!1157795 () Bool)

(declare-fun lt!520068 () array!74893)

(assert (=> b!1157795 (= e!658411 (= lt!520084 (getCurrentListMapNoExtraKeys!4737 lt!520089 lt!520068 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapNonEmpty!45362 () Bool)

(declare-fun tp!86195 () Bool)

(assert (=> mapNonEmpty!45362 (= mapRes!45362 (and tp!86195 e!658417))))

(declare-fun mapKey!45362 () (_ BitVec 32))

(declare-fun mapValue!45362 () ValueCell!13803)

(declare-fun mapRest!45362 () (Array (_ BitVec 32) ValueCell!13803))

(assert (=> mapNonEmpty!45362 (= (arr!36097 _values!996) (store mapRest!45362 mapKey!45362 mapValue!45362))))

(declare-fun b!1157796 () Bool)

(declare-fun e!658416 () Unit!38144)

(declare-fun lt!520076 () Unit!38144)

(assert (=> b!1157796 (= e!658416 lt!520076)))

(assert (=> b!1157796 (= lt!520076 call!55482)))

(assert (=> b!1157796 call!55483))

(declare-fun b!1157797 () Bool)

(assert (=> b!1157797 (= e!658416 e!658420)))

(declare-fun c!115315 () Bool)

(declare-fun lt!520083 () Bool)

(assert (=> b!1157797 (= c!115315 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520083))))

(declare-fun b!1157798 () Bool)

(assert (=> b!1157798 (= e!658421 true)))

(assert (=> b!1157798 e!658411))

(declare-fun res!768804 () Bool)

(assert (=> b!1157798 (=> (not res!768804) (not e!658411))))

(assert (=> b!1157798 (= res!768804 (= lt!520084 lt!520071))))

(declare-fun lt!520069 () ListLongMap!16509)

(declare-fun -!1384 (ListLongMap!16509 (_ BitVec 64)) ListLongMap!16509)

(assert (=> b!1157798 (= lt!520084 (-!1384 lt!520069 k0!934))))

(declare-fun lt!520079 () V!43827)

(declare-fun +!3681 (ListLongMap!16509 tuple2!18540) ListLongMap!16509)

(assert (=> b!1157798 (= (-!1384 (+!3681 lt!520071 (tuple2!18541 (select (arr!36098 _keys!1208) from!1455) lt!520079)) (select (arr!36098 _keys!1208) from!1455)) lt!520071)))

(declare-fun lt!520075 () Unit!38144)

(declare-fun addThenRemoveForNewKeyIsSame!223 (ListLongMap!16509 (_ BitVec 64) V!43827) Unit!38144)

(assert (=> b!1157798 (= lt!520075 (addThenRemoveForNewKeyIsSame!223 lt!520071 (select (arr!36098 _keys!1208) from!1455) lt!520079))))

(declare-fun lt!520070 () V!43827)

(declare-fun get!18401 (ValueCell!13803 V!43827) V!43827)

(assert (=> b!1157798 (= lt!520079 (get!18401 (select (arr!36097 _values!996) from!1455) lt!520070))))

(declare-fun lt!520072 () Unit!38144)

(assert (=> b!1157798 (= lt!520072 e!658408)))

(declare-fun c!115317 () Bool)

(declare-fun contains!6781 (ListLongMap!16509 (_ BitVec 64)) Bool)

(assert (=> b!1157798 (= c!115317 (contains!6781 lt!520071 k0!934))))

(assert (=> b!1157798 (= lt!520071 (getCurrentListMapNoExtraKeys!4737 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157799 () Bool)

(declare-fun res!768808 () Bool)

(assert (=> b!1157799 (=> (not res!768808) (not e!658414))))

(assert (=> b!1157799 (= res!768808 (and (= (size!36633 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36634 _keys!1208) (size!36633 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157800 () Bool)

(declare-fun res!768815 () Bool)

(assert (=> b!1157800 (=> (not res!768815) (not e!658414))))

(declare-datatypes ((List!25281 0))(
  ( (Nil!25278) (Cons!25277 (h!26486 (_ BitVec 64)) (t!36768 List!25281)) )
))
(declare-fun arrayNoDuplicates!0 (array!74895 (_ BitVec 32) List!25281) Bool)

(assert (=> b!1157800 (= res!768815 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25278))))

(declare-fun bm!55483 () Bool)

(declare-fun lt!520073 () ListLongMap!16509)

(assert (=> bm!55483 (= call!55487 (contains!6781 (ite c!115316 lt!520073 call!55486) k0!934))))

(declare-fun b!1157801 () Bool)

(declare-fun res!768806 () Bool)

(assert (=> b!1157801 (=> (not res!768806) (not e!658414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157801 (= res!768806 (validKeyInArray!0 k0!934))))

(declare-fun b!1157802 () Bool)

(declare-fun res!768809 () Bool)

(assert (=> b!1157802 (=> (not res!768809) (not e!658414))))

(assert (=> b!1157802 (= res!768809 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36634 _keys!1208))))))

(declare-fun bm!55484 () Bool)

(assert (=> bm!55484 (= call!55482 call!55485)))

(declare-fun b!1157803 () Bool)

(assert (=> b!1157803 (= e!658409 e!658412)))

(declare-fun res!768811 () Bool)

(assert (=> b!1157803 (=> res!768811 e!658412)))

(assert (=> b!1157803 (= res!768811 (not (= from!1455 i!673)))))

(declare-fun lt!520087 () ListLongMap!16509)

(assert (=> b!1157803 (= lt!520087 (getCurrentListMapNoExtraKeys!4737 lt!520089 lt!520068 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157803 (= lt!520068 (array!74894 (store (arr!36097 _values!996) i!673 (ValueCellFull!13803 lt!520070)) (size!36633 _values!996)))))

(declare-fun dynLambda!2743 (Int (_ BitVec 64)) V!43827)

(assert (=> b!1157803 (= lt!520070 (dynLambda!2743 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157803 (= lt!520069 (getCurrentListMapNoExtraKeys!4737 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55485 () Bool)

(assert (=> bm!55485 (= call!55489 (getCurrentListMapNoExtraKeys!4737 lt!520089 lt!520068 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157804 () Bool)

(declare-fun res!768818 () Bool)

(assert (=> b!1157804 (=> (not res!768818) (not e!658414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74895 (_ BitVec 32)) Bool)

(assert (=> b!1157804 (= res!768818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!768816 () Bool)

(assert (=> start!98890 (=> (not res!768816) (not e!658414))))

(assert (=> start!98890 (= res!768816 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36634 _keys!1208))))))

(assert (=> start!98890 e!658414))

(assert (=> start!98890 tp_is_empty!29025))

(declare-fun array_inv!27626 (array!74895) Bool)

(assert (=> start!98890 (array_inv!27626 _keys!1208)))

(assert (=> start!98890 true))

(assert (=> start!98890 tp!86196))

(declare-fun array_inv!27627 (array!74893) Bool)

(assert (=> start!98890 (and (array_inv!27627 _values!996) e!658418)))

(declare-fun b!1157788 () Bool)

(declare-fun res!768814 () Bool)

(assert (=> b!1157788 (=> (not res!768814) (not e!658414))))

(assert (=> b!1157788 (= res!768814 (= (select (arr!36098 _keys!1208) i!673) k0!934))))

(declare-fun b!1157805 () Bool)

(assert (=> b!1157805 (= c!115313 (and (not lt!520083) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!658413 () Unit!38144)

(assert (=> b!1157805 (= e!658413 e!658416)))

(declare-fun b!1157806 () Bool)

(assert (=> b!1157806 (= e!658410 (= call!55489 (-!1384 call!55484 k0!934)))))

(declare-fun b!1157807 () Bool)

(assert (=> b!1157807 (= e!658414 e!658422)))

(declare-fun res!768812 () Bool)

(assert (=> b!1157807 (=> (not res!768812) (not e!658422))))

(assert (=> b!1157807 (= res!768812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520089 mask!1564))))

(assert (=> b!1157807 (= lt!520089 (array!74896 (store (arr!36098 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36634 _keys!1208)))))

(declare-fun bm!55486 () Bool)

(assert (=> bm!55486 (= call!55488 (+!3681 lt!520071 (ite (or c!115316 c!115313) (tuple2!18541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1157808 () Bool)

(declare-fun res!768817 () Bool)

(assert (=> b!1157808 (=> (not res!768817) (not e!658422))))

(assert (=> b!1157808 (= res!768817 (arrayNoDuplicates!0 lt!520089 #b00000000000000000000000000000000 Nil!25278))))

(declare-fun b!1157809 () Bool)

(declare-fun Unit!38148 () Unit!38144)

(assert (=> b!1157809 (= e!658408 Unit!38148)))

(assert (=> b!1157809 (= lt!520083 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157809 (= c!115316 (and (not lt!520083) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520081 () Unit!38144)

(assert (=> b!1157809 (= lt!520081 e!658413)))

(declare-fun lt!520085 () Unit!38144)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!509 (array!74895 array!74893 (_ BitVec 32) (_ BitVec 32) V!43827 V!43827 (_ BitVec 64) (_ BitVec 32) Int) Unit!38144)

(assert (=> b!1157809 (= lt!520085 (lemmaListMapContainsThenArrayContainsFrom!509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115314 () Bool)

(assert (=> b!1157809 (= c!115314 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768807 () Bool)

(assert (=> b!1157809 (= res!768807 e!658407)))

(assert (=> b!1157809 (=> (not res!768807) (not e!658415))))

(assert (=> b!1157809 e!658415))

(declare-fun lt!520082 () Unit!38144)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74895 (_ BitVec 32) (_ BitVec 32)) Unit!38144)

(assert (=> b!1157809 (= lt!520082 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157809 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25278)))

(declare-fun lt!520088 () Unit!38144)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74895 (_ BitVec 64) (_ BitVec 32) List!25281) Unit!38144)

(assert (=> b!1157809 (= lt!520088 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25278))))

(assert (=> b!1157809 false))

(declare-fun b!1157810 () Bool)

(assert (=> b!1157810 (= e!658407 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520083) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157811 () Bool)

(assert (=> b!1157811 (contains!6781 (+!3681 lt!520073 (tuple2!18541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!520077 () Unit!38144)

(assert (=> b!1157811 (= lt!520077 (addStillContains!923 lt!520073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1157811 call!55487))

(assert (=> b!1157811 (= lt!520073 call!55488)))

(declare-fun lt!520080 () Unit!38144)

(assert (=> b!1157811 (= lt!520080 call!55485)))

(assert (=> b!1157811 (= e!658413 lt!520077)))

(assert (= (and start!98890 res!768816) b!1157787))

(assert (= (and b!1157787 res!768810) b!1157799))

(assert (= (and b!1157799 res!768808) b!1157804))

(assert (= (and b!1157804 res!768818) b!1157800))

(assert (= (and b!1157800 res!768815) b!1157802))

(assert (= (and b!1157802 res!768809) b!1157801))

(assert (= (and b!1157801 res!768806) b!1157788))

(assert (= (and b!1157788 res!768814) b!1157807))

(assert (= (and b!1157807 res!768812) b!1157808))

(assert (= (and b!1157808 res!768817) b!1157789))

(assert (= (and b!1157789 (not res!768813)) b!1157803))

(assert (= (and b!1157803 (not res!768811)) b!1157794))

(assert (= (and b!1157794 c!115318) b!1157806))

(assert (= (and b!1157794 (not c!115318)) b!1157782))

(assert (= (or b!1157806 b!1157782) bm!55485))

(assert (= (or b!1157806 b!1157782) bm!55481))

(assert (= (and b!1157794 (not res!768805)) b!1157798))

(assert (= (and b!1157798 c!115317) b!1157809))

(assert (= (and b!1157798 (not c!115317)) b!1157791))

(assert (= (and b!1157809 c!115316) b!1157811))

(assert (= (and b!1157809 (not c!115316)) b!1157805))

(assert (= (and b!1157805 c!115313) b!1157796))

(assert (= (and b!1157805 (not c!115313)) b!1157797))

(assert (= (and b!1157797 c!115315) b!1157793))

(assert (= (and b!1157797 (not c!115315)) b!1157785))

(assert (= (or b!1157796 b!1157793) bm!55484))

(assert (= (or b!1157796 b!1157793) bm!55482))

(assert (= (or b!1157796 b!1157793) bm!55479))

(assert (= (or b!1157811 bm!55479) bm!55483))

(assert (= (or b!1157811 bm!55484) bm!55480))

(assert (= (or b!1157811 bm!55482) bm!55486))

(assert (= (and b!1157809 c!115314) b!1157786))

(assert (= (and b!1157809 (not c!115314)) b!1157810))

(assert (= (and b!1157809 res!768807) b!1157790))

(assert (= (and b!1157798 res!768804) b!1157795))

(assert (= (and b!1157783 condMapEmpty!45362) mapIsEmpty!45362))

(assert (= (and b!1157783 (not condMapEmpty!45362)) mapNonEmpty!45362))

(get-info :version)

(assert (= (and mapNonEmpty!45362 ((_ is ValueCellFull!13803) mapValue!45362)) b!1157792))

(assert (= (and b!1157783 ((_ is ValueCellFull!13803) mapDefault!45362)) b!1157784))

(assert (= start!98890 b!1157783))

(declare-fun b_lambda!19601 () Bool)

(assert (=> (not b_lambda!19601) (not b!1157803)))

(declare-fun t!36766 () Bool)

(declare-fun tb!9307 () Bool)

(assert (=> (and start!98890 (= defaultEntry!1004 defaultEntry!1004) t!36766) tb!9307))

(declare-fun result!19179 () Bool)

(assert (=> tb!9307 (= result!19179 tp_is_empty!29025)))

(assert (=> b!1157803 t!36766))

(declare-fun b_and!39841 () Bool)

(assert (= b_and!39839 (and (=> t!36766 result!19179) b_and!39841)))

(declare-fun m!1067069 () Bool)

(assert (=> bm!55481 m!1067069))

(declare-fun m!1067071 () Bool)

(assert (=> bm!55483 m!1067071))

(declare-fun m!1067073 () Bool)

(assert (=> b!1157795 m!1067073))

(declare-fun m!1067075 () Bool)

(assert (=> b!1157787 m!1067075))

(declare-fun m!1067077 () Bool)

(assert (=> b!1157807 m!1067077))

(declare-fun m!1067079 () Bool)

(assert (=> b!1157807 m!1067079))

(declare-fun m!1067081 () Bool)

(assert (=> b!1157786 m!1067081))

(declare-fun m!1067083 () Bool)

(assert (=> b!1157794 m!1067083))

(declare-fun m!1067085 () Bool)

(assert (=> b!1157794 m!1067085))

(declare-fun m!1067087 () Bool)

(assert (=> b!1157788 m!1067087))

(declare-fun m!1067089 () Bool)

(assert (=> bm!55486 m!1067089))

(declare-fun m!1067091 () Bool)

(assert (=> mapNonEmpty!45362 m!1067091))

(declare-fun m!1067093 () Bool)

(assert (=> b!1157800 m!1067093))

(declare-fun m!1067095 () Bool)

(assert (=> b!1157803 m!1067095))

(declare-fun m!1067097 () Bool)

(assert (=> b!1157803 m!1067097))

(declare-fun m!1067099 () Bool)

(assert (=> b!1157803 m!1067099))

(declare-fun m!1067101 () Bool)

(assert (=> b!1157803 m!1067101))

(assert (=> bm!55485 m!1067073))

(declare-fun m!1067103 () Bool)

(assert (=> b!1157811 m!1067103))

(assert (=> b!1157811 m!1067103))

(declare-fun m!1067105 () Bool)

(assert (=> b!1157811 m!1067105))

(declare-fun m!1067107 () Bool)

(assert (=> b!1157811 m!1067107))

(declare-fun m!1067109 () Bool)

(assert (=> bm!55480 m!1067109))

(assert (=> b!1157798 m!1067069))

(assert (=> b!1157798 m!1067083))

(declare-fun m!1067111 () Bool)

(assert (=> b!1157798 m!1067111))

(declare-fun m!1067113 () Bool)

(assert (=> b!1157798 m!1067113))

(declare-fun m!1067115 () Bool)

(assert (=> b!1157798 m!1067115))

(declare-fun m!1067117 () Bool)

(assert (=> b!1157798 m!1067117))

(declare-fun m!1067119 () Bool)

(assert (=> b!1157798 m!1067119))

(assert (=> b!1157798 m!1067117))

(assert (=> b!1157798 m!1067083))

(declare-fun m!1067121 () Bool)

(assert (=> b!1157798 m!1067121))

(assert (=> b!1157798 m!1067083))

(assert (=> b!1157798 m!1067113))

(declare-fun m!1067123 () Bool)

(assert (=> b!1157798 m!1067123))

(declare-fun m!1067125 () Bool)

(assert (=> b!1157806 m!1067125))

(assert (=> b!1157790 m!1067081))

(declare-fun m!1067127 () Bool)

(assert (=> start!98890 m!1067127))

(declare-fun m!1067129 () Bool)

(assert (=> start!98890 m!1067129))

(declare-fun m!1067131 () Bool)

(assert (=> b!1157808 m!1067131))

(declare-fun m!1067133 () Bool)

(assert (=> b!1157804 m!1067133))

(declare-fun m!1067135 () Bool)

(assert (=> b!1157801 m!1067135))

(declare-fun m!1067137 () Bool)

(assert (=> b!1157789 m!1067137))

(declare-fun m!1067139 () Bool)

(assert (=> b!1157789 m!1067139))

(declare-fun m!1067141 () Bool)

(assert (=> b!1157809 m!1067141))

(declare-fun m!1067143 () Bool)

(assert (=> b!1157809 m!1067143))

(declare-fun m!1067145 () Bool)

(assert (=> b!1157809 m!1067145))

(declare-fun m!1067147 () Bool)

(assert (=> b!1157809 m!1067147))

(check-sat b_and!39841 (not b!1157806) (not start!98890) (not bm!55486) (not b_lambda!19601) (not b!1157789) (not b!1157808) (not b!1157800) (not b!1157798) (not b!1157801) (not b!1157790) (not b!1157795) (not bm!55480) (not b_next!24495) (not b!1157803) tp_is_empty!29025 (not bm!55483) (not b!1157811) (not mapNonEmpty!45362) (not b!1157807) (not b!1157804) (not b!1157794) (not bm!55481) (not bm!55485) (not b!1157809) (not b!1157786) (not b!1157787))
(check-sat b_and!39841 (not b_next!24495))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101028 () Bool)

(assert start!101028)

(declare-fun b_free!26027 () Bool)

(declare-fun b_next!26027 () Bool)

(assert (=> start!101028 (= b_free!26027 (not b_next!26027))))

(declare-fun tp!91097 () Bool)

(declare-fun b_and!43135 () Bool)

(assert (=> start!101028 (= tp!91097 b_and!43135)))

(declare-fun b!1210926 () Bool)

(declare-fun res!804545 () Bool)

(declare-fun e!687707 () Bool)

(assert (=> b!1210926 (=> (not res!804545) (not e!687707))))

(declare-datatypes ((array!78247 0))(
  ( (array!78248 (arr!37760 (Array (_ BitVec 32) (_ BitVec 64))) (size!38296 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78247)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78247 (_ BitVec 32)) Bool)

(assert (=> b!1210926 (= res!804545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210927 () Bool)

(declare-fun res!804548 () Bool)

(assert (=> b!1210927 (=> (not res!804548) (not e!687707))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210927 (= res!804548 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38296 _keys!1208))))))

(declare-datatypes ((V!46101 0))(
  ( (V!46102 (val!15422 Int)) )
))
(declare-fun zeroValue!944 () V!46101)

(declare-datatypes ((tuple2!19808 0))(
  ( (tuple2!19809 (_1!9915 (_ BitVec 64)) (_2!9915 V!46101)) )
))
(declare-datatypes ((List!26609 0))(
  ( (Nil!26606) (Cons!26605 (h!27814 tuple2!19808) (t!39616 List!26609)) )
))
(declare-datatypes ((ListLongMap!17777 0))(
  ( (ListLongMap!17778 (toList!8904 List!26609)) )
))
(declare-fun lt!549905 () ListLongMap!17777)

(declare-fun c!119358 () Bool)

(declare-fun bm!59762 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!119359 () Bool)

(declare-datatypes ((Unit!40148 0))(
  ( (Unit!40149) )
))
(declare-fun call!59771 () Unit!40148)

(declare-fun minValue!944 () V!46101)

(declare-fun addStillContains!1050 (ListLongMap!17777 (_ BitVec 64) V!46101 (_ BitVec 64)) Unit!40148)

(assert (=> bm!59762 (= call!59771 (addStillContains!1050 lt!549905 (ite (or c!119359 c!119358) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119359 c!119358) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1210928 () Bool)

(declare-fun res!804542 () Bool)

(declare-fun e!687708 () Bool)

(assert (=> b!1210928 (=> (not res!804542) (not e!687708))))

(declare-fun lt!549908 () array!78247)

(declare-datatypes ((List!26610 0))(
  ( (Nil!26607) (Cons!26606 (h!27815 (_ BitVec 64)) (t!39617 List!26610)) )
))
(declare-fun arrayNoDuplicates!0 (array!78247 (_ BitVec 32) List!26610) Bool)

(assert (=> b!1210928 (= res!804542 (arrayNoDuplicates!0 lt!549908 #b00000000000000000000000000000000 Nil!26607))))

(declare-fun e!687704 () Bool)

(declare-fun lt!549906 () ListLongMap!17777)

(declare-fun b!1210929 () Bool)

(declare-fun -!1853 (ListLongMap!17777 (_ BitVec 64)) ListLongMap!17777)

(assert (=> b!1210929 (= e!687704 (= (-!1853 lt!549906 k!934) lt!549905))))

(declare-fun lt!549907 () V!46101)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!4022 (ListLongMap!17777 tuple2!19808) ListLongMap!17777)

(assert (=> b!1210929 (= (-!1853 (+!4022 lt!549905 (tuple2!19809 (select (arr!37760 _keys!1208) from!1455) lt!549907)) (select (arr!37760 _keys!1208) from!1455)) lt!549905)))

(declare-fun lt!549890 () Unit!40148)

(declare-fun addThenRemoveForNewKeyIsSame!271 (ListLongMap!17777 (_ BitVec 64) V!46101) Unit!40148)

(assert (=> b!1210929 (= lt!549890 (addThenRemoveForNewKeyIsSame!271 lt!549905 (select (arr!37760 _keys!1208) from!1455) lt!549907))))

(declare-datatypes ((ValueCell!14656 0))(
  ( (ValueCellFull!14656 (v!18073 V!46101)) (EmptyCell!14656) )
))
(declare-datatypes ((array!78249 0))(
  ( (array!78250 (arr!37761 (Array (_ BitVec 32) ValueCell!14656)) (size!38297 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78249)

(declare-fun lt!549893 () V!46101)

(declare-fun get!19238 (ValueCell!14656 V!46101) V!46101)

(assert (=> b!1210929 (= lt!549907 (get!19238 (select (arr!37761 _values!996) from!1455) lt!549893))))

(declare-fun lt!549897 () Unit!40148)

(declare-fun e!687701 () Unit!40148)

(assert (=> b!1210929 (= lt!549897 e!687701)))

(declare-fun c!119360 () Bool)

(declare-fun contains!6975 (ListLongMap!17777 (_ BitVec 64)) Bool)

(assert (=> b!1210929 (= c!119360 (contains!6975 lt!549905 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5336 (array!78247 array!78249 (_ BitVec 32) (_ BitVec 32) V!46101 V!46101 (_ BitVec 32) Int) ListLongMap!17777)

(assert (=> b!1210929 (= lt!549905 (getCurrentListMapNoExtraKeys!5336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59763 () Bool)

(declare-fun call!59767 () Unit!40148)

(assert (=> bm!59763 (= call!59767 call!59771)))

(declare-fun b!1210930 () Bool)

(declare-fun e!687695 () Bool)

(declare-fun tp_is_empty!30731 () Bool)

(assert (=> b!1210930 (= e!687695 tp_is_empty!30731)))

(declare-fun b!1210931 () Bool)

(declare-fun e!687700 () Unit!40148)

(declare-fun Unit!40150 () Unit!40148)

(assert (=> b!1210931 (= e!687700 Unit!40150)))

(declare-fun b!1210932 () Bool)

(declare-fun e!687702 () Bool)

(assert (=> b!1210932 (= e!687702 tp_is_empty!30731)))

(declare-fun mapNonEmpty!47965 () Bool)

(declare-fun mapRes!47965 () Bool)

(declare-fun tp!91096 () Bool)

(assert (=> mapNonEmpty!47965 (= mapRes!47965 (and tp!91096 e!687702))))

(declare-fun mapRest!47965 () (Array (_ BitVec 32) ValueCell!14656))

(declare-fun mapKey!47965 () (_ BitVec 32))

(declare-fun mapValue!47965 () ValueCell!14656)

(assert (=> mapNonEmpty!47965 (= (arr!37761 _values!996) (store mapRest!47965 mapKey!47965 mapValue!47965))))

(declare-fun b!1210933 () Bool)

(declare-fun e!687705 () Bool)

(declare-fun e!687709 () Bool)

(assert (=> b!1210933 (= e!687705 e!687709)))

(declare-fun res!804550 () Bool)

(assert (=> b!1210933 (=> res!804550 e!687709)))

(assert (=> b!1210933 (= res!804550 (not (= from!1455 i!673)))))

(declare-fun lt!549894 () array!78249)

(declare-fun lt!549891 () ListLongMap!17777)

(assert (=> b!1210933 (= lt!549891 (getCurrentListMapNoExtraKeys!5336 lt!549908 lt!549894 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1210933 (= lt!549894 (array!78250 (store (arr!37761 _values!996) i!673 (ValueCellFull!14656 lt!549893)) (size!38297 _values!996)))))

(declare-fun dynLambda!3233 (Int (_ BitVec 64)) V!46101)

(assert (=> b!1210933 (= lt!549893 (dynLambda!3233 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1210933 (= lt!549906 (getCurrentListMapNoExtraKeys!5336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59764 () Bool)

(declare-fun call!59772 () Bool)

(declare-fun call!59765 () Bool)

(assert (=> bm!59764 (= call!59772 call!59765)))

(declare-fun b!1210934 () Bool)

(declare-fun res!804539 () Bool)

(assert (=> b!1210934 (=> (not res!804539) (not e!687707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210934 (= res!804539 (validKeyInArray!0 k!934))))

(declare-fun call!59768 () ListLongMap!17777)

(declare-fun bm!59765 () Bool)

(assert (=> bm!59765 (= call!59768 (+!4022 lt!549905 (ite (or c!119359 c!119358) (tuple2!19809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1210935 () Bool)

(declare-fun e!687697 () Bool)

(declare-fun arrayContainsKey!0 (array!78247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210935 (= e!687697 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210936 () Bool)

(assert (=> b!1210936 (= e!687708 (not e!687705))))

(declare-fun res!804543 () Bool)

(assert (=> b!1210936 (=> res!804543 e!687705)))

(assert (=> b!1210936 (= res!804543 (bvsgt from!1455 i!673))))

(assert (=> b!1210936 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549904 () Unit!40148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78247 (_ BitVec 64) (_ BitVec 32)) Unit!40148)

(assert (=> b!1210936 (= lt!549904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!804547 () Bool)

(assert (=> start!101028 (=> (not res!804547) (not e!687707))))

(assert (=> start!101028 (= res!804547 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38296 _keys!1208))))))

(assert (=> start!101028 e!687707))

(assert (=> start!101028 tp_is_empty!30731))

(declare-fun array_inv!28762 (array!78247) Bool)

(assert (=> start!101028 (array_inv!28762 _keys!1208)))

(assert (=> start!101028 true))

(assert (=> start!101028 tp!91097))

(declare-fun e!687698 () Bool)

(declare-fun array_inv!28763 (array!78249) Bool)

(assert (=> start!101028 (and (array_inv!28763 _values!996) e!687698)))

(declare-fun b!1210937 () Bool)

(declare-fun Unit!40151 () Unit!40148)

(assert (=> b!1210937 (= e!687701 Unit!40151)))

(declare-fun mapIsEmpty!47965 () Bool)

(assert (=> mapIsEmpty!47965 mapRes!47965))

(declare-fun b!1210938 () Bool)

(declare-fun res!804551 () Bool)

(assert (=> b!1210938 (=> (not res!804551) (not e!687707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210938 (= res!804551 (validMask!0 mask!1564))))

(declare-fun b!1210939 () Bool)

(declare-fun res!804541 () Bool)

(assert (=> b!1210939 (=> (not res!804541) (not e!687707))))

(assert (=> b!1210939 (= res!804541 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26607))))

(declare-fun b!1210940 () Bool)

(declare-fun res!804546 () Bool)

(assert (=> b!1210940 (=> (not res!804546) (not e!687707))))

(assert (=> b!1210940 (= res!804546 (and (= (size!38297 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38296 _keys!1208) (size!38297 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210941 () Bool)

(declare-fun res!804552 () Bool)

(assert (=> b!1210941 (=> (not res!804552) (not e!687707))))

(assert (=> b!1210941 (= res!804552 (= (select (arr!37760 _keys!1208) i!673) k!934))))

(declare-fun b!1210942 () Bool)

(declare-fun lt!549900 () ListLongMap!17777)

(assert (=> b!1210942 (contains!6975 (+!4022 lt!549900 (tuple2!19809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!549896 () Unit!40148)

(assert (=> b!1210942 (= lt!549896 (addStillContains!1050 lt!549900 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1210942 call!59765))

(assert (=> b!1210942 (= lt!549900 call!59768)))

(declare-fun lt!549899 () Unit!40148)

(assert (=> b!1210942 (= lt!549899 call!59771)))

(declare-fun e!687696 () Unit!40148)

(assert (=> b!1210942 (= e!687696 lt!549896)))

(declare-fun bm!59766 () Bool)

(declare-fun call!59770 () ListLongMap!17777)

(assert (=> bm!59766 (= call!59770 call!59768)))

(declare-fun b!1210943 () Bool)

(assert (=> b!1210943 call!59772))

(declare-fun lt!549902 () Unit!40148)

(assert (=> b!1210943 (= lt!549902 call!59767)))

(assert (=> b!1210943 (= e!687700 lt!549902)))

(declare-fun b!1210944 () Bool)

(declare-fun Unit!40152 () Unit!40148)

(assert (=> b!1210944 (= e!687701 Unit!40152)))

(declare-fun lt!549903 () Bool)

(assert (=> b!1210944 (= lt!549903 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210944 (= c!119359 (and (not lt!549903) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549898 () Unit!40148)

(assert (=> b!1210944 (= lt!549898 e!687696)))

(declare-fun lt!549909 () Unit!40148)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!601 (array!78247 array!78249 (_ BitVec 32) (_ BitVec 32) V!46101 V!46101 (_ BitVec 64) (_ BitVec 32) Int) Unit!40148)

(assert (=> b!1210944 (= lt!549909 (lemmaListMapContainsThenArrayContainsFrom!601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119355 () Bool)

(assert (=> b!1210944 (= c!119355 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804544 () Bool)

(assert (=> b!1210944 (= res!804544 e!687697)))

(declare-fun e!687710 () Bool)

(assert (=> b!1210944 (=> (not res!804544) (not e!687710))))

(assert (=> b!1210944 e!687710))

(declare-fun lt!549895 () Unit!40148)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78247 (_ BitVec 32) (_ BitVec 32)) Unit!40148)

(assert (=> b!1210944 (= lt!549895 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210944 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26607)))

(declare-fun lt!549910 () Unit!40148)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78247 (_ BitVec 64) (_ BitVec 32) List!26610) Unit!40148)

(assert (=> b!1210944 (= lt!549910 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26607))))

(assert (=> b!1210944 false))

(declare-fun b!1210945 () Bool)

(assert (=> b!1210945 (= e!687709 e!687704)))

(declare-fun res!804540 () Bool)

(assert (=> b!1210945 (=> res!804540 e!687704)))

(assert (=> b!1210945 (= res!804540 (not (= (select (arr!37760 _keys!1208) from!1455) k!934)))))

(declare-fun e!687706 () Bool)

(assert (=> b!1210945 e!687706))

(declare-fun c!119357 () Bool)

(assert (=> b!1210945 (= c!119357 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549892 () Unit!40148)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1063 (array!78247 array!78249 (_ BitVec 32) (_ BitVec 32) V!46101 V!46101 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40148)

(assert (=> b!1210945 (= lt!549892 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1063 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210946 () Bool)

(assert (=> b!1210946 (= e!687697 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549903) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210947 () Bool)

(declare-fun e!687703 () Unit!40148)

(declare-fun lt!549901 () Unit!40148)

(assert (=> b!1210947 (= e!687703 lt!549901)))

(assert (=> b!1210947 (= lt!549901 call!59767)))

(assert (=> b!1210947 call!59772))

(declare-fun call!59766 () ListLongMap!17777)

(declare-fun bm!59767 () Bool)

(assert (=> bm!59767 (= call!59766 (getCurrentListMapNoExtraKeys!5336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210948 () Bool)

(declare-fun call!59769 () ListLongMap!17777)

(assert (=> b!1210948 (= e!687706 (= call!59769 (-!1853 call!59766 k!934)))))

(declare-fun b!1210949 () Bool)

(assert (=> b!1210949 (= e!687706 (= call!59769 call!59766))))

(declare-fun b!1210950 () Bool)

(assert (=> b!1210950 (= e!687707 e!687708)))

(declare-fun res!804549 () Bool)

(assert (=> b!1210950 (=> (not res!804549) (not e!687708))))

(assert (=> b!1210950 (= res!804549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549908 mask!1564))))

(assert (=> b!1210950 (= lt!549908 (array!78248 (store (arr!37760 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38296 _keys!1208)))))

(declare-fun b!1210951 () Bool)

(assert (=> b!1210951 (= e!687698 (and e!687695 mapRes!47965))))

(declare-fun condMapEmpty!47965 () Bool)

(declare-fun mapDefault!47965 () ValueCell!14656)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101024 () Bool)

(assert start!101024)

(declare-fun b_free!26023 () Bool)

(declare-fun b_next!26023 () Bool)

(assert (=> start!101024 (= b_free!26023 (not b_next!26023))))

(declare-fun tp!91084 () Bool)

(declare-fun b_and!43127 () Bool)

(assert (=> start!101024 (= tp!91084 b_and!43127)))

(declare-datatypes ((V!46097 0))(
  ( (V!46098 (val!15420 Int)) )
))
(declare-datatypes ((tuple2!19804 0))(
  ( (tuple2!19805 (_1!9913 (_ BitVec 64)) (_2!9913 V!46097)) )
))
(declare-datatypes ((List!26605 0))(
  ( (Nil!26602) (Cons!26601 (h!27810 tuple2!19804) (t!39608 List!26605)) )
))
(declare-datatypes ((ListLongMap!17773 0))(
  ( (ListLongMap!17774 (toList!8902 List!26605)) )
))
(declare-fun call!59719 () ListLongMap!17773)

(declare-fun b!1210748 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!59722 () ListLongMap!17773)

(declare-fun e!687601 () Bool)

(declare-fun -!1851 (ListLongMap!17773 (_ BitVec 64)) ListLongMap!17773)

(assert (=> b!1210748 (= e!687601 (= call!59722 (-!1851 call!59719 k!934)))))

(declare-fun b!1210749 () Bool)

(declare-datatypes ((Unit!40138 0))(
  ( (Unit!40139) )
))
(declare-fun e!687605 () Unit!40138)

(declare-fun e!687613 () Unit!40138)

(assert (=> b!1210749 (= e!687605 e!687613)))

(declare-fun c!119321 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!549780 () Bool)

(assert (=> b!1210749 (= c!119321 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549780))))

(declare-fun b!1210750 () Bool)

(declare-fun c!119323 () Bool)

(assert (=> b!1210750 (= c!119323 (and (not lt!549780) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687606 () Unit!40138)

(assert (=> b!1210750 (= e!687606 e!687605)))

(declare-fun b!1210751 () Bool)

(declare-fun res!804457 () Bool)

(declare-fun e!687602 () Bool)

(assert (=> b!1210751 (=> (not res!804457) (not e!687602))))

(declare-datatypes ((array!78239 0))(
  ( (array!78240 (arr!37756 (Array (_ BitVec 32) (_ BitVec 64))) (size!38292 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78239)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78239 (_ BitVec 32)) Bool)

(assert (=> b!1210751 (= res!804457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59714 () Bool)

(declare-fun call!59720 () Bool)

(declare-fun call!59723 () Bool)

(assert (=> bm!59714 (= call!59720 call!59723)))

(declare-fun b!1210752 () Bool)

(declare-fun e!687607 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210752 (= e!687607 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!804466 () Bool)

(assert (=> start!101024 (=> (not res!804466) (not e!687602))))

(assert (=> start!101024 (= res!804466 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38292 _keys!1208))))))

(assert (=> start!101024 e!687602))

(declare-fun tp_is_empty!30727 () Bool)

(assert (=> start!101024 tp_is_empty!30727))

(declare-fun array_inv!28758 (array!78239) Bool)

(assert (=> start!101024 (array_inv!28758 _keys!1208)))

(assert (=> start!101024 true))

(assert (=> start!101024 tp!91084))

(declare-datatypes ((ValueCell!14654 0))(
  ( (ValueCellFull!14654 (v!18071 V!46097)) (EmptyCell!14654) )
))
(declare-datatypes ((array!78241 0))(
  ( (array!78242 (arr!37757 (Array (_ BitVec 32) ValueCell!14654)) (size!38293 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78241)

(declare-fun e!687614 () Bool)

(declare-fun array_inv!28759 (array!78241) Bool)

(assert (=> start!101024 (and (array_inv!28759 _values!996) e!687614)))

(declare-fun zeroValue!944 () V!46097)

(declare-fun lt!549774 () array!78239)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!59715 () Bool)

(declare-fun lt!549777 () array!78241)

(declare-fun minValue!944 () V!46097)

(declare-fun getCurrentListMapNoExtraKeys!5334 (array!78239 array!78241 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) Int) ListLongMap!17773)

(assert (=> bm!59715 (= call!59722 (getCurrentListMapNoExtraKeys!5334 lt!549774 lt!549777 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549783 () ListLongMap!17773)

(declare-fun lt!549770 () ListLongMap!17773)

(declare-fun e!687599 () Bool)

(declare-fun b!1210753 () Bool)

(assert (=> b!1210753 (= e!687599 (= (-!1851 lt!549770 k!934) lt!549783))))

(declare-fun lt!549778 () V!46097)

(declare-fun +!4020 (ListLongMap!17773 tuple2!19804) ListLongMap!17773)

(assert (=> b!1210753 (= (-!1851 (+!4020 lt!549783 (tuple2!19805 (select (arr!37756 _keys!1208) from!1455) lt!549778)) (select (arr!37756 _keys!1208) from!1455)) lt!549783)))

(declare-fun lt!549772 () Unit!40138)

(declare-fun addThenRemoveForNewKeyIsSame!269 (ListLongMap!17773 (_ BitVec 64) V!46097) Unit!40138)

(assert (=> b!1210753 (= lt!549772 (addThenRemoveForNewKeyIsSame!269 lt!549783 (select (arr!37756 _keys!1208) from!1455) lt!549778))))

(declare-fun lt!549765 () V!46097)

(declare-fun get!19236 (ValueCell!14654 V!46097) V!46097)

(assert (=> b!1210753 (= lt!549778 (get!19236 (select (arr!37757 _values!996) from!1455) lt!549765))))

(declare-fun lt!549776 () Unit!40138)

(declare-fun e!687612 () Unit!40138)

(assert (=> b!1210753 (= lt!549776 e!687612)))

(declare-fun c!119319 () Bool)

(declare-fun contains!6973 (ListLongMap!17773 (_ BitVec 64)) Bool)

(assert (=> b!1210753 (= c!119319 (contains!6973 lt!549783 k!934))))

(assert (=> b!1210753 (= lt!549783 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59716 () Bool)

(declare-fun call!59718 () Unit!40138)

(declare-fun call!59724 () Unit!40138)

(assert (=> bm!59716 (= call!59718 call!59724)))

(declare-fun b!1210754 () Bool)

(declare-fun e!687610 () Bool)

(assert (=> b!1210754 (= e!687610 e!687599)))

(declare-fun res!804465 () Bool)

(assert (=> b!1210754 (=> res!804465 e!687599)))

(assert (=> b!1210754 (= res!804465 (not (= (select (arr!37756 _keys!1208) from!1455) k!934)))))

(assert (=> b!1210754 e!687601))

(declare-fun c!119322 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210754 (= c!119322 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549781 () Unit!40138)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1061 (array!78239 array!78241 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40138)

(assert (=> b!1210754 (= lt!549781 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210755 () Bool)

(declare-fun Unit!40140 () Unit!40138)

(assert (=> b!1210755 (= e!687612 Unit!40140)))

(assert (=> b!1210755 (= lt!549780 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119324 () Bool)

(assert (=> b!1210755 (= c!119324 (and (not lt!549780) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549768 () Unit!40138)

(assert (=> b!1210755 (= lt!549768 e!687606)))

(declare-fun lt!549771 () Unit!40138)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!599 (array!78239 array!78241 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 64) (_ BitVec 32) Int) Unit!40138)

(assert (=> b!1210755 (= lt!549771 (lemmaListMapContainsThenArrayContainsFrom!599 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119320 () Bool)

(assert (=> b!1210755 (= c!119320 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804462 () Bool)

(declare-fun e!687608 () Bool)

(assert (=> b!1210755 (= res!804462 e!687608)))

(assert (=> b!1210755 (=> (not res!804462) (not e!687607))))

(assert (=> b!1210755 e!687607))

(declare-fun lt!549769 () Unit!40138)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78239 (_ BitVec 32) (_ BitVec 32)) Unit!40138)

(assert (=> b!1210755 (= lt!549769 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26606 0))(
  ( (Nil!26603) (Cons!26602 (h!27811 (_ BitVec 64)) (t!39609 List!26606)) )
))
(declare-fun arrayNoDuplicates!0 (array!78239 (_ BitVec 32) List!26606) Bool)

(assert (=> b!1210755 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26603)))

(declare-fun lt!549779 () Unit!40138)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78239 (_ BitVec 64) (_ BitVec 32) List!26606) Unit!40138)

(assert (=> b!1210755 (= lt!549779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26603))))

(assert (=> b!1210755 false))

(declare-fun b!1210756 () Bool)

(declare-fun e!687600 () Bool)

(assert (=> b!1210756 (= e!687600 tp_is_empty!30727)))

(declare-fun b!1210757 () Bool)

(declare-fun Unit!40141 () Unit!40138)

(assert (=> b!1210757 (= e!687613 Unit!40141)))

(declare-fun b!1210758 () Bool)

(declare-fun res!804458 () Bool)

(assert (=> b!1210758 (=> (not res!804458) (not e!687602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210758 (= res!804458 (validMask!0 mask!1564))))

(declare-fun b!1210759 () Bool)

(declare-fun res!804459 () Bool)

(declare-fun e!687604 () Bool)

(assert (=> b!1210759 (=> (not res!804459) (not e!687604))))

(assert (=> b!1210759 (= res!804459 (arrayNoDuplicates!0 lt!549774 #b00000000000000000000000000000000 Nil!26603))))

(declare-fun b!1210760 () Bool)

(declare-fun res!804456 () Bool)

(assert (=> b!1210760 (=> (not res!804456) (not e!687602))))

(assert (=> b!1210760 (= res!804456 (and (= (size!38293 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38292 _keys!1208) (size!38293 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!549766 () ListLongMap!17773)

(declare-fun bm!59717 () Bool)

(declare-fun addStillContains!1048 (ListLongMap!17773 (_ BitVec 64) V!46097 (_ BitVec 64)) Unit!40138)

(assert (=> bm!59717 (= call!59724 (addStillContains!1048 (ite c!119324 lt!549766 lt!549783) (ite c!119324 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119323 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119324 minValue!944 (ite c!119323 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1210761 () Bool)

(declare-fun call!59717 () ListLongMap!17773)

(assert (=> b!1210761 (contains!6973 call!59717 k!934)))

(declare-fun lt!549784 () Unit!40138)

(assert (=> b!1210761 (= lt!549784 call!59724)))

(assert (=> b!1210761 call!59723))

(assert (=> b!1210761 (= lt!549766 (+!4020 lt!549783 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549764 () Unit!40138)

(assert (=> b!1210761 (= lt!549764 (addStillContains!1048 lt!549783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1210761 (= e!687606 lt!549784)))

(declare-fun mapIsEmpty!47959 () Bool)

(declare-fun mapRes!47959 () Bool)

(assert (=> mapIsEmpty!47959 mapRes!47959))

(declare-fun call!59721 () ListLongMap!17773)

(declare-fun bm!59718 () Bool)

(assert (=> bm!59718 (= call!59723 (contains!6973 (ite c!119324 lt!549766 call!59721) k!934))))

(declare-fun b!1210762 () Bool)

(assert (=> b!1210762 (= e!687608 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210763 () Bool)

(declare-fun e!687609 () Bool)

(assert (=> b!1210763 (= e!687609 e!687610)))

(declare-fun res!804461 () Bool)

(assert (=> b!1210763 (=> res!804461 e!687610)))

(assert (=> b!1210763 (= res!804461 (not (= from!1455 i!673)))))

(declare-fun lt!549767 () ListLongMap!17773)

(assert (=> b!1210763 (= lt!549767 (getCurrentListMapNoExtraKeys!5334 lt!549774 lt!549777 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1210763 (= lt!549777 (array!78242 (store (arr!37757 _values!996) i!673 (ValueCellFull!14654 lt!549765)) (size!38293 _values!996)))))

(declare-fun dynLambda!3231 (Int (_ BitVec 64)) V!46097)

(assert (=> b!1210763 (= lt!549765 (dynLambda!3231 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1210763 (= lt!549770 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210764 () Bool)

(declare-fun res!804464 () Bool)

(assert (=> b!1210764 (=> (not res!804464) (not e!687602))))

(assert (=> b!1210764 (= res!804464 (= (select (arr!37756 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!47959 () Bool)

(declare-fun tp!91085 () Bool)

(assert (=> mapNonEmpty!47959 (= mapRes!47959 (and tp!91085 e!687600))))

(declare-fun mapValue!47959 () ValueCell!14654)

(declare-fun mapKey!47959 () (_ BitVec 32))

(declare-fun mapRest!47959 () (Array (_ BitVec 32) ValueCell!14654))

(assert (=> mapNonEmpty!47959 (= (arr!37757 _values!996) (store mapRest!47959 mapKey!47959 mapValue!47959))))

(declare-fun b!1210765 () Bool)

(declare-fun Unit!40142 () Unit!40138)

(assert (=> b!1210765 (= e!687612 Unit!40142)))

(declare-fun b!1210766 () Bool)

(declare-fun res!804463 () Bool)

(assert (=> b!1210766 (=> (not res!804463) (not e!687602))))

(assert (=> b!1210766 (= res!804463 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26603))))

(declare-fun b!1210767 () Bool)

(declare-fun res!804455 () Bool)

(assert (=> b!1210767 (=> (not res!804455) (not e!687602))))

(assert (=> b!1210767 (= res!804455 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38292 _keys!1208))))))

(declare-fun bm!59719 () Bool)

(assert (=> bm!59719 (= call!59717 (+!4020 (ite c!119324 lt!549766 lt!549783) (ite c!119324 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119323 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210768 () Bool)

(declare-fun e!687603 () Bool)

(assert (=> b!1210768 (= e!687614 (and e!687603 mapRes!47959))))

(declare-fun condMapEmpty!47959 () Bool)

(declare-fun mapDefault!47959 () ValueCell!14654)


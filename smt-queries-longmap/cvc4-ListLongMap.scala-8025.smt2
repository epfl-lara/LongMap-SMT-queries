; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98994 () Bool)

(assert start!98994)

(declare-fun b_free!24599 () Bool)

(declare-fun b_next!24599 () Bool)

(assert (=> start!98994 (= b_free!24599 (not b_next!24599))))

(declare-fun tp!86507 () Bool)

(declare-fun b_and!40047 () Bool)

(assert (=> start!98994 (= tp!86507 b_and!40047)))

(declare-fun b!1162566 () Bool)

(declare-fun e!661060 () Bool)

(declare-fun e!661074 () Bool)

(assert (=> b!1162566 (= e!661060 e!661074)))

(declare-fun res!771152 () Bool)

(assert (=> b!1162566 (=> (not res!771152) (not e!661074))))

(declare-datatypes ((array!75097 0))(
  ( (array!75098 (arr!36199 (Array (_ BitVec 32) (_ BitVec 64))) (size!36735 (_ BitVec 32))) )
))
(declare-fun lt!523518 () array!75097)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75097 (_ BitVec 32)) Bool)

(assert (=> b!1162566 (= res!771152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523518 mask!1564))))

(declare-fun _keys!1208 () array!75097)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162566 (= lt!523518 (array!75098 (store (arr!36199 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36735 _keys!1208)))))

(declare-fun b!1162567 () Bool)

(declare-fun e!661066 () Bool)

(declare-fun e!661072 () Bool)

(assert (=> b!1162567 (= e!661066 e!661072)))

(declare-fun res!771153 () Bool)

(assert (=> b!1162567 (=> res!771153 e!661072)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1162567 (= res!771153 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43965 0))(
  ( (V!43966 (val!14621 Int)) )
))
(declare-fun zeroValue!944 () V!43965)

(declare-datatypes ((tuple2!18638 0))(
  ( (tuple2!18639 (_1!9330 (_ BitVec 64)) (_2!9330 V!43965)) )
))
(declare-datatypes ((List!25372 0))(
  ( (Nil!25369) (Cons!25368 (h!26577 tuple2!18638) (t!36963 List!25372)) )
))
(declare-datatypes ((ListLongMap!16607 0))(
  ( (ListLongMap!16608 (toList!8319 List!25372)) )
))
(declare-fun lt!523511 () ListLongMap!16607)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13855 0))(
  ( (ValueCellFull!13855 (v!17258 V!43965)) (EmptyCell!13855) )
))
(declare-datatypes ((array!75099 0))(
  ( (array!75100 (arr!36200 (Array (_ BitVec 32) ValueCell!13855)) (size!36736 (_ BitVec 32))) )
))
(declare-fun lt!523507 () array!75099)

(declare-fun minValue!944 () V!43965)

(declare-fun getCurrentListMapNoExtraKeys!4783 (array!75097 array!75099 (_ BitVec 32) (_ BitVec 32) V!43965 V!43965 (_ BitVec 32) Int) ListLongMap!16607)

(assert (=> b!1162567 (= lt!523511 (getCurrentListMapNoExtraKeys!4783 lt!523518 lt!523507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523504 () V!43965)

(declare-fun _values!996 () array!75099)

(assert (=> b!1162567 (= lt!523507 (array!75100 (store (arr!36200 _values!996) i!673 (ValueCellFull!13855 lt!523504)) (size!36736 _values!996)))))

(declare-fun dynLambda!2779 (Int (_ BitVec 64)) V!43965)

(assert (=> b!1162567 (= lt!523504 (dynLambda!2779 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523517 () ListLongMap!16607)

(assert (=> b!1162567 (= lt!523517 (getCurrentListMapNoExtraKeys!4783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162568 () Bool)

(declare-fun res!771151 () Bool)

(assert (=> b!1162568 (=> (not res!771151) (not e!661060))))

(assert (=> b!1162568 (= res!771151 (and (= (size!36736 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36735 _keys!1208) (size!36736 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162569 () Bool)

(declare-fun e!661062 () Bool)

(declare-fun tp_is_empty!29129 () Bool)

(assert (=> b!1162569 (= e!661062 tp_is_empty!29129)))

(declare-fun b!1162570 () Bool)

(declare-datatypes ((Unit!38359 0))(
  ( (Unit!38360) )
))
(declare-fun e!661063 () Unit!38359)

(declare-fun e!661065 () Unit!38359)

(assert (=> b!1162570 (= e!661063 e!661065)))

(declare-fun c!116253 () Bool)

(declare-fun lt!523500 () Bool)

(assert (=> b!1162570 (= c!116253 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523500))))

(declare-fun bm!56727 () Bool)

(declare-fun call!56730 () Bool)

(declare-fun call!56733 () Bool)

(assert (=> bm!56727 (= call!56730 call!56733)))

(declare-fun b!1162571 () Bool)

(declare-fun e!661071 () Bool)

(assert (=> b!1162571 (= e!661071 true)))

(declare-fun e!661058 () Bool)

(assert (=> b!1162571 e!661058))

(declare-fun res!771149 () Bool)

(assert (=> b!1162571 (=> (not res!771149) (not e!661058))))

(declare-fun lt!523510 () ListLongMap!16607)

(declare-fun lt!523505 () ListLongMap!16607)

(assert (=> b!1162571 (= res!771149 (= lt!523510 lt!523505))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1425 (ListLongMap!16607 (_ BitVec 64)) ListLongMap!16607)

(assert (=> b!1162571 (= lt!523510 (-!1425 lt!523517 k!934))))

(declare-fun lt!523515 () V!43965)

(declare-fun +!3723 (ListLongMap!16607 tuple2!18638) ListLongMap!16607)

(assert (=> b!1162571 (= (-!1425 (+!3723 lt!523505 (tuple2!18639 (select (arr!36199 _keys!1208) from!1455) lt!523515)) (select (arr!36199 _keys!1208) from!1455)) lt!523505)))

(declare-fun lt!523514 () Unit!38359)

(declare-fun addThenRemoveForNewKeyIsSame!259 (ListLongMap!16607 (_ BitVec 64) V!43965) Unit!38359)

(assert (=> b!1162571 (= lt!523514 (addThenRemoveForNewKeyIsSame!259 lt!523505 (select (arr!36199 _keys!1208) from!1455) lt!523515))))

(declare-fun get!18471 (ValueCell!13855 V!43965) V!43965)

(assert (=> b!1162571 (= lt!523515 (get!18471 (select (arr!36200 _values!996) from!1455) lt!523504))))

(declare-fun lt!523519 () Unit!38359)

(declare-fun e!661067 () Unit!38359)

(assert (=> b!1162571 (= lt!523519 e!661067)))

(declare-fun c!116252 () Bool)

(declare-fun contains!6824 (ListLongMap!16607 (_ BitVec 64)) Bool)

(assert (=> b!1162571 (= c!116252 (contains!6824 lt!523505 k!934))))

(assert (=> b!1162571 (= lt!523505 (getCurrentListMapNoExtraKeys!4783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162572 () Bool)

(declare-fun Unit!38361 () Unit!38359)

(assert (=> b!1162572 (= e!661067 Unit!38361)))

(assert (=> b!1162572 (= lt!523500 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116249 () Bool)

(assert (=> b!1162572 (= c!116249 (and (not lt!523500) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523508 () Unit!38359)

(declare-fun e!661069 () Unit!38359)

(assert (=> b!1162572 (= lt!523508 e!661069)))

(declare-fun lt!523513 () Unit!38359)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!549 (array!75097 array!75099 (_ BitVec 32) (_ BitVec 32) V!43965 V!43965 (_ BitVec 64) (_ BitVec 32) Int) Unit!38359)

(assert (=> b!1162572 (= lt!523513 (lemmaListMapContainsThenArrayContainsFrom!549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116254 () Bool)

(assert (=> b!1162572 (= c!116254 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771157 () Bool)

(declare-fun e!661059 () Bool)

(assert (=> b!1162572 (= res!771157 e!661059)))

(declare-fun e!661064 () Bool)

(assert (=> b!1162572 (=> (not res!771157) (not e!661064))))

(assert (=> b!1162572 e!661064))

(declare-fun lt!523520 () Unit!38359)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75097 (_ BitVec 32) (_ BitVec 32)) Unit!38359)

(assert (=> b!1162572 (= lt!523520 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25373 0))(
  ( (Nil!25370) (Cons!25369 (h!26578 (_ BitVec 64)) (t!36964 List!25373)) )
))
(declare-fun arrayNoDuplicates!0 (array!75097 (_ BitVec 32) List!25373) Bool)

(assert (=> b!1162572 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25370)))

(declare-fun lt!523516 () Unit!38359)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75097 (_ BitVec 64) (_ BitVec 32) List!25373) Unit!38359)

(assert (=> b!1162572 (= lt!523516 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25370))))

(assert (=> b!1162572 false))

(declare-fun b!1162573 () Bool)

(assert (=> b!1162573 (= e!661058 (= lt!523510 (getCurrentListMapNoExtraKeys!4783 lt!523518 lt!523507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162575 () Bool)

(declare-fun lt!523521 () Unit!38359)

(assert (=> b!1162575 (= e!661063 lt!523521)))

(declare-fun call!56735 () Unit!38359)

(assert (=> b!1162575 (= lt!523521 call!56735)))

(assert (=> b!1162575 call!56730))

(declare-fun b!1162576 () Bool)

(declare-fun e!661061 () Bool)

(assert (=> b!1162576 (= e!661061 tp_is_empty!29129)))

(declare-fun b!1162577 () Bool)

(declare-fun arrayContainsKey!0 (array!75097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162577 (= e!661059 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162578 () Bool)

(declare-fun Unit!38362 () Unit!38359)

(assert (=> b!1162578 (= e!661067 Unit!38362)))

(declare-fun b!1162579 () Bool)

(assert (=> b!1162579 (= e!661072 e!661071)))

(declare-fun res!771150 () Bool)

(assert (=> b!1162579 (=> res!771150 e!661071)))

(assert (=> b!1162579 (= res!771150 (not (= (select (arr!36199 _keys!1208) from!1455) k!934)))))

(declare-fun e!661073 () Bool)

(assert (=> b!1162579 e!661073))

(declare-fun c!116250 () Bool)

(assert (=> b!1162579 (= c!116250 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523502 () Unit!38359)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!654 (array!75097 array!75099 (_ BitVec 32) (_ BitVec 32) V!43965 V!43965 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38359)

(assert (=> b!1162579 (= lt!523502 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!654 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162580 () Bool)

(declare-fun res!771154 () Bool)

(assert (=> b!1162580 (=> (not res!771154) (not e!661074))))

(assert (=> b!1162580 (= res!771154 (arrayNoDuplicates!0 lt!523518 #b00000000000000000000000000000000 Nil!25370))))

(declare-fun b!1162581 () Bool)

(declare-fun res!771155 () Bool)

(assert (=> b!1162581 (=> (not res!771155) (not e!661060))))

(assert (=> b!1162581 (= res!771155 (= (select (arr!36199 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!45518 () Bool)

(declare-fun mapRes!45518 () Bool)

(declare-fun tp!86508 () Bool)

(assert (=> mapNonEmpty!45518 (= mapRes!45518 (and tp!86508 e!661061))))

(declare-fun mapValue!45518 () ValueCell!13855)

(declare-fun mapKey!45518 () (_ BitVec 32))

(declare-fun mapRest!45518 () (Array (_ BitVec 32) ValueCell!13855))

(assert (=> mapNonEmpty!45518 (= (arr!36200 _values!996) (store mapRest!45518 mapKey!45518 mapValue!45518))))

(declare-fun bm!56728 () Bool)

(declare-fun call!56731 () ListLongMap!16607)

(declare-fun call!56732 () ListLongMap!16607)

(assert (=> bm!56728 (= call!56731 call!56732)))

(declare-fun mapIsEmpty!45518 () Bool)

(assert (=> mapIsEmpty!45518 mapRes!45518))

(declare-fun b!1162582 () Bool)

(assert (=> b!1162582 (contains!6824 call!56732 k!934)))

(declare-fun lt!523501 () Unit!38359)

(declare-fun lt!523506 () ListLongMap!16607)

(declare-fun addStillContains!964 (ListLongMap!16607 (_ BitVec 64) V!43965 (_ BitVec 64)) Unit!38359)

(assert (=> b!1162582 (= lt!523501 (addStillContains!964 lt!523506 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1162582 call!56733))

(assert (=> b!1162582 (= lt!523506 (+!3723 lt!523505 (tuple2!18639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523503 () Unit!38359)

(declare-fun call!56736 () Unit!38359)

(assert (=> b!1162582 (= lt!523503 call!56736)))

(assert (=> b!1162582 (= e!661069 lt!523501)))

(declare-fun b!1162583 () Bool)

(declare-fun res!771144 () Bool)

(assert (=> b!1162583 (=> (not res!771144) (not e!661060))))

(assert (=> b!1162583 (= res!771144 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25370))))

(declare-fun b!1162584 () Bool)

(declare-fun c!116251 () Bool)

(assert (=> b!1162584 (= c!116251 (and (not lt!523500) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1162584 (= e!661069 e!661063)))

(declare-fun b!1162585 () Bool)

(declare-fun res!771148 () Bool)

(assert (=> b!1162585 (=> (not res!771148) (not e!661060))))

(assert (=> b!1162585 (= res!771148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!56729 () Bool)

(declare-fun call!56734 () ListLongMap!16607)

(assert (=> bm!56729 (= call!56734 (getCurrentListMapNoExtraKeys!4783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56730 () Bool)

(assert (=> bm!56730 (= call!56735 call!56736)))

(declare-fun bm!56731 () Bool)

(assert (=> bm!56731 (= call!56732 (+!3723 (ite c!116249 lt!523506 lt!523505) (ite c!116249 (tuple2!18639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116251 (tuple2!18639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1162574 () Bool)

(declare-fun call!56737 () ListLongMap!16607)

(assert (=> b!1162574 (= e!661073 (= call!56737 call!56734))))

(declare-fun res!771146 () Bool)

(assert (=> start!98994 (=> (not res!771146) (not e!661060))))

(assert (=> start!98994 (= res!771146 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36735 _keys!1208))))))

(assert (=> start!98994 e!661060))

(assert (=> start!98994 tp_is_empty!29129))

(declare-fun array_inv!27700 (array!75097) Bool)

(assert (=> start!98994 (array_inv!27700 _keys!1208)))

(assert (=> start!98994 true))

(assert (=> start!98994 tp!86507))

(declare-fun e!661068 () Bool)

(declare-fun array_inv!27701 (array!75099) Bool)

(assert (=> start!98994 (and (array_inv!27701 _values!996) e!661068)))

(declare-fun b!1162586 () Bool)

(assert (=> b!1162586 (= e!661059 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523500) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162587 () Bool)

(declare-fun res!771145 () Bool)

(assert (=> b!1162587 (=> (not res!771145) (not e!661060))))

(assert (=> b!1162587 (= res!771145 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36735 _keys!1208))))))

(declare-fun bm!56732 () Bool)

(assert (=> bm!56732 (= call!56737 (getCurrentListMapNoExtraKeys!4783 lt!523518 lt!523507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162588 () Bool)

(assert (=> b!1162588 (= e!661074 (not e!661066))))

(declare-fun res!771156 () Bool)

(assert (=> b!1162588 (=> res!771156 e!661066)))

(assert (=> b!1162588 (= res!771156 (bvsgt from!1455 i!673))))

(assert (=> b!1162588 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!523509 () Unit!38359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75097 (_ BitVec 64) (_ BitVec 32)) Unit!38359)

(assert (=> b!1162588 (= lt!523509 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!56733 () Bool)

(assert (=> bm!56733 (= call!56733 (contains!6824 (ite c!116249 lt!523506 call!56731) k!934))))

(declare-fun b!1162589 () Bool)

(declare-fun Unit!38363 () Unit!38359)

(assert (=> b!1162589 (= e!661065 Unit!38363)))

(declare-fun b!1162590 () Bool)

(declare-fun res!771147 () Bool)

(assert (=> b!1162590 (=> (not res!771147) (not e!661060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162590 (= res!771147 (validKeyInArray!0 k!934))))

(declare-fun b!1162591 () Bool)

(declare-fun res!771158 () Bool)

(assert (=> b!1162591 (=> (not res!771158) (not e!661060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162591 (= res!771158 (validMask!0 mask!1564))))

(declare-fun b!1162592 () Bool)

(assert (=> b!1162592 call!56730))

(declare-fun lt!523512 () Unit!38359)

(assert (=> b!1162592 (= lt!523512 call!56735)))

(assert (=> b!1162592 (= e!661065 lt!523512)))

(declare-fun b!1162593 () Bool)

(assert (=> b!1162593 (= e!661068 (and e!661062 mapRes!45518))))

(declare-fun condMapEmpty!45518 () Bool)

(declare-fun mapDefault!45518 () ValueCell!13855)


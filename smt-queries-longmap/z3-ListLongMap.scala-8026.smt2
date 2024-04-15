; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98990 () Bool)

(assert start!98990)

(declare-fun b_free!24601 () Bool)

(declare-fun b_next!24601 () Bool)

(assert (=> start!98990 (= b_free!24601 (not b_next!24601))))

(declare-fun tp!86513 () Bool)

(declare-fun b_and!40029 () Bool)

(assert (=> start!98990 (= tp!86513 b_and!40029)))

(declare-fun b!1162534 () Bool)

(declare-fun res!771129 () Bool)

(declare-fun e!661044 () Bool)

(assert (=> b!1162534 (=> (not res!771129) (not e!661044))))

(declare-datatypes ((array!75020 0))(
  ( (array!75021 (arr!36161 (Array (_ BitVec 32) (_ BitVec 64))) (size!36699 (_ BitVec 32))) )
))
(declare-fun lt!523385 () array!75020)

(declare-datatypes ((List!25441 0))(
  ( (Nil!25438) (Cons!25437 (h!26646 (_ BitVec 64)) (t!37025 List!25441)) )
))
(declare-fun arrayNoDuplicates!0 (array!75020 (_ BitVec 32) List!25441) Bool)

(assert (=> b!1162534 (= res!771129 (arrayNoDuplicates!0 lt!523385 #b00000000000000000000000000000000 Nil!25438))))

(declare-fun mapNonEmpty!45521 () Bool)

(declare-fun mapRes!45521 () Bool)

(declare-fun tp!86514 () Bool)

(declare-fun e!661037 () Bool)

(assert (=> mapNonEmpty!45521 (= mapRes!45521 (and tp!86514 e!661037))))

(declare-datatypes ((V!43969 0))(
  ( (V!43970 (val!14622 Int)) )
))
(declare-datatypes ((ValueCell!13856 0))(
  ( (ValueCellFull!13856 (v!17258 V!43969)) (EmptyCell!13856) )
))
(declare-fun mapRest!45521 () (Array (_ BitVec 32) ValueCell!13856))

(declare-fun mapKey!45521 () (_ BitVec 32))

(declare-fun mapValue!45521 () ValueCell!13856)

(declare-datatypes ((array!75022 0))(
  ( (array!75023 (arr!36162 (Array (_ BitVec 32) ValueCell!13856)) (size!36700 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75022)

(assert (=> mapNonEmpty!45521 (= (arr!36162 _values!996) (store mapRest!45521 mapKey!45521 mapValue!45521))))

(declare-fun e!661035 () Bool)

(declare-fun _keys!1208 () array!75020)

(declare-fun b!1162535 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!75020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162535 (= e!661035 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!523391 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!661045 () Bool)

(declare-fun b!1162536 () Bool)

(assert (=> b!1162536 (= e!661045 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523391) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162537 () Bool)

(declare-fun c!116244 () Bool)

(assert (=> b!1162537 (= c!116244 (and (not lt!523391) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38192 0))(
  ( (Unit!38193) )
))
(declare-fun e!661047 () Unit!38192)

(declare-fun e!661041 () Unit!38192)

(assert (=> b!1162537 (= e!661047 e!661041)))

(declare-fun zeroValue!944 () V!43969)

(declare-fun e!661033 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18724 0))(
  ( (tuple2!18725 (_1!9373 (_ BitVec 64)) (_2!9373 V!43969)) )
))
(declare-datatypes ((List!25442 0))(
  ( (Nil!25439) (Cons!25438 (h!26647 tuple2!18724) (t!37026 List!25442)) )
))
(declare-datatypes ((ListLongMap!16693 0))(
  ( (ListLongMap!16694 (toList!8362 List!25442)) )
))
(declare-fun lt!523381 () ListLongMap!16693)

(declare-fun lt!523395 () array!75022)

(declare-fun b!1162538 () Bool)

(declare-fun minValue!944 () V!43969)

(declare-fun getCurrentListMapNoExtraKeys!4840 (array!75020 array!75022 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 32) Int) ListLongMap!16693)

(assert (=> b!1162538 (= e!661033 (= lt!523381 (getCurrentListMapNoExtraKeys!4840 lt!523385 lt!523395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162539 () Bool)

(declare-fun res!771133 () Bool)

(declare-fun e!661046 () Bool)

(assert (=> b!1162539 (=> (not res!771133) (not e!661046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75020 (_ BitVec 32)) Bool)

(assert (=> b!1162539 (= res!771133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!56728 () Bool)

(declare-fun call!56734 () Unit!38192)

(declare-fun call!56733 () Unit!38192)

(assert (=> bm!56728 (= call!56734 call!56733)))

(declare-fun b!1162540 () Bool)

(declare-fun e!661042 () Unit!38192)

(declare-fun Unit!38194 () Unit!38192)

(assert (=> b!1162540 (= e!661042 Unit!38194)))

(declare-fun b!1162541 () Bool)

(declare-fun e!661031 () Bool)

(declare-fun e!661034 () Bool)

(assert (=> b!1162541 (= e!661031 e!661034)))

(declare-fun res!771134 () Bool)

(assert (=> b!1162541 (=> res!771134 e!661034)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162541 (= res!771134 (not (= from!1455 i!673)))))

(declare-fun lt!523386 () ListLongMap!16693)

(assert (=> b!1162541 (= lt!523386 (getCurrentListMapNoExtraKeys!4840 lt!523385 lt!523395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523393 () V!43969)

(assert (=> b!1162541 (= lt!523395 (array!75023 (store (arr!36162 _values!996) i!673 (ValueCellFull!13856 lt!523393)) (size!36700 _values!996)))))

(declare-fun dynLambda!2776 (Int (_ BitVec 64)) V!43969)

(assert (=> b!1162541 (= lt!523393 (dynLambda!2776 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523376 () ListLongMap!16693)

(assert (=> b!1162541 (= lt!523376 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162542 () Bool)

(declare-fun e!661040 () Bool)

(declare-fun call!56737 () ListLongMap!16693)

(declare-fun call!56736 () ListLongMap!16693)

(assert (=> b!1162542 (= e!661040 (= call!56737 call!56736))))

(declare-fun res!771136 () Bool)

(assert (=> start!98990 (=> (not res!771136) (not e!661046))))

(assert (=> start!98990 (= res!771136 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36699 _keys!1208))))))

(assert (=> start!98990 e!661046))

(declare-fun tp_is_empty!29131 () Bool)

(assert (=> start!98990 tp_is_empty!29131))

(declare-fun array_inv!27780 (array!75020) Bool)

(assert (=> start!98990 (array_inv!27780 _keys!1208)))

(assert (=> start!98990 true))

(assert (=> start!98990 tp!86513))

(declare-fun e!661036 () Bool)

(declare-fun array_inv!27781 (array!75022) Bool)

(assert (=> start!98990 (and (array_inv!27781 _values!996) e!661036)))

(declare-fun b!1162543 () Bool)

(declare-fun e!661043 () Unit!38192)

(declare-fun Unit!38195 () Unit!38192)

(assert (=> b!1162543 (= e!661043 Unit!38195)))

(declare-fun c!116243 () Bool)

(declare-fun lt!523374 () ListLongMap!16693)

(declare-fun bm!56729 () Bool)

(declare-fun addStillContains!973 (ListLongMap!16693 (_ BitVec 64) V!43969 (_ BitVec 64)) Unit!38192)

(assert (=> bm!56729 (= call!56733 (addStillContains!973 lt!523374 (ite (or c!116243 c!116244) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116243 c!116244) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1162544 () Bool)

(declare-fun lt!523383 () ListLongMap!16693)

(declare-fun contains!6808 (ListLongMap!16693 (_ BitVec 64)) Bool)

(declare-fun +!3765 (ListLongMap!16693 tuple2!18724) ListLongMap!16693)

(assert (=> b!1162544 (contains!6808 (+!3765 lt!523383 (tuple2!18725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!523390 () Unit!38192)

(assert (=> b!1162544 (= lt!523390 (addStillContains!973 lt!523383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!56738 () Bool)

(assert (=> b!1162544 call!56738))

(declare-fun call!56735 () ListLongMap!16693)

(assert (=> b!1162544 (= lt!523383 call!56735)))

(declare-fun lt!523394 () Unit!38192)

(assert (=> b!1162544 (= lt!523394 call!56733)))

(assert (=> b!1162544 (= e!661047 lt!523390)))

(declare-fun b!1162545 () Bool)

(assert (=> b!1162545 (= e!661045 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56730 () Bool)

(assert (=> bm!56730 (= call!56735 (+!3765 lt!523374 (ite (or c!116243 c!116244) (tuple2!18725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1162546 () Bool)

(declare-fun e!661032 () Bool)

(assert (=> b!1162546 (= e!661032 tp_is_empty!29131)))

(declare-fun bm!56731 () Bool)

(declare-fun call!56732 () ListLongMap!16693)

(assert (=> bm!56731 (= call!56738 (contains!6808 (ite c!116243 lt!523383 call!56732) k0!934))))

(declare-fun b!1162547 () Bool)

(declare-fun res!771127 () Bool)

(assert (=> b!1162547 (=> (not res!771127) (not e!661046))))

(assert (=> b!1162547 (= res!771127 (and (= (size!36700 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36699 _keys!1208) (size!36700 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162548 () Bool)

(declare-fun lt!523380 () Unit!38192)

(assert (=> b!1162548 (= e!661041 lt!523380)))

(assert (=> b!1162548 (= lt!523380 call!56734)))

(declare-fun call!56731 () Bool)

(assert (=> b!1162548 call!56731))

(declare-fun bm!56732 () Bool)

(assert (=> bm!56732 (= call!56736 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162549 () Bool)

(assert (=> b!1162549 (= e!661041 e!661043)))

(declare-fun c!116241 () Bool)

(assert (=> b!1162549 (= c!116241 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523391))))

(declare-fun bm!56733 () Bool)

(assert (=> bm!56733 (= call!56732 call!56735)))

(declare-fun b!1162550 () Bool)

(declare-fun Unit!38196 () Unit!38192)

(assert (=> b!1162550 (= e!661042 Unit!38196)))

(assert (=> b!1162550 (= lt!523391 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162550 (= c!116243 (and (not lt!523391) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523388 () Unit!38192)

(assert (=> b!1162550 (= lt!523388 e!661047)))

(declare-fun lt!523384 () Unit!38192)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!543 (array!75020 array!75022 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 64) (_ BitVec 32) Int) Unit!38192)

(assert (=> b!1162550 (= lt!523384 (lemmaListMapContainsThenArrayContainsFrom!543 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116245 () Bool)

(assert (=> b!1162550 (= c!116245 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771131 () Bool)

(assert (=> b!1162550 (= res!771131 e!661045)))

(assert (=> b!1162550 (=> (not res!771131) (not e!661035))))

(assert (=> b!1162550 e!661035))

(declare-fun lt!523377 () Unit!38192)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75020 (_ BitVec 32) (_ BitVec 32)) Unit!38192)

(assert (=> b!1162550 (= lt!523377 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162550 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25438)))

(declare-fun lt!523389 () Unit!38192)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75020 (_ BitVec 64) (_ BitVec 32) List!25441) Unit!38192)

(assert (=> b!1162550 (= lt!523389 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25438))))

(assert (=> b!1162550 false))

(declare-fun bm!56734 () Bool)

(assert (=> bm!56734 (= call!56731 call!56738)))

(declare-fun b!1162551 () Bool)

(assert (=> b!1162551 (= e!661037 tp_is_empty!29131)))

(declare-fun b!1162552 () Bool)

(declare-fun e!661038 () Bool)

(assert (=> b!1162552 (= e!661038 true)))

(assert (=> b!1162552 e!661033))

(declare-fun res!771128 () Bool)

(assert (=> b!1162552 (=> (not res!771128) (not e!661033))))

(assert (=> b!1162552 (= res!771128 (= lt!523381 lt!523374))))

(declare-fun -!1409 (ListLongMap!16693 (_ BitVec 64)) ListLongMap!16693)

(assert (=> b!1162552 (= lt!523381 (-!1409 lt!523376 k0!934))))

(declare-fun lt!523382 () V!43969)

(assert (=> b!1162552 (= (-!1409 (+!3765 lt!523374 (tuple2!18725 (select (arr!36161 _keys!1208) from!1455) lt!523382)) (select (arr!36161 _keys!1208) from!1455)) lt!523374)))

(declare-fun lt!523392 () Unit!38192)

(declare-fun addThenRemoveForNewKeyIsSame!250 (ListLongMap!16693 (_ BitVec 64) V!43969) Unit!38192)

(assert (=> b!1162552 (= lt!523392 (addThenRemoveForNewKeyIsSame!250 lt!523374 (select (arr!36161 _keys!1208) from!1455) lt!523382))))

(declare-fun get!18464 (ValueCell!13856 V!43969) V!43969)

(assert (=> b!1162552 (= lt!523382 (get!18464 (select (arr!36162 _values!996) from!1455) lt!523393))))

(declare-fun lt!523378 () Unit!38192)

(assert (=> b!1162552 (= lt!523378 e!661042)))

(declare-fun c!116242 () Bool)

(assert (=> b!1162552 (= c!116242 (contains!6808 lt!523374 k0!934))))

(assert (=> b!1162552 (= lt!523374 (getCurrentListMapNoExtraKeys!4840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162553 () Bool)

(declare-fun res!771126 () Bool)

(assert (=> b!1162553 (=> (not res!771126) (not e!661046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162553 (= res!771126 (validMask!0 mask!1564))))

(declare-fun b!1162554 () Bool)

(assert (=> b!1162554 call!56731))

(declare-fun lt!523387 () Unit!38192)

(assert (=> b!1162554 (= lt!523387 call!56734)))

(assert (=> b!1162554 (= e!661043 lt!523387)))

(declare-fun b!1162555 () Bool)

(assert (=> b!1162555 (= e!661040 (= call!56737 (-!1409 call!56736 k0!934)))))

(declare-fun b!1162556 () Bool)

(assert (=> b!1162556 (= e!661036 (and e!661032 mapRes!45521))))

(declare-fun condMapEmpty!45521 () Bool)

(declare-fun mapDefault!45521 () ValueCell!13856)

(assert (=> b!1162556 (= condMapEmpty!45521 (= (arr!36162 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13856)) mapDefault!45521)))))

(declare-fun b!1162557 () Bool)

(assert (=> b!1162557 (= e!661044 (not e!661031))))

(declare-fun res!771124 () Bool)

(assert (=> b!1162557 (=> res!771124 e!661031)))

(assert (=> b!1162557 (= res!771124 (bvsgt from!1455 i!673))))

(assert (=> b!1162557 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523375 () Unit!38192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75020 (_ BitVec 64) (_ BitVec 32)) Unit!38192)

(assert (=> b!1162557 (= lt!523375 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162558 () Bool)

(assert (=> b!1162558 (= e!661046 e!661044)))

(declare-fun res!771125 () Bool)

(assert (=> b!1162558 (=> (not res!771125) (not e!661044))))

(assert (=> b!1162558 (= res!771125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523385 mask!1564))))

(assert (=> b!1162558 (= lt!523385 (array!75021 (store (arr!36161 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36699 _keys!1208)))))

(declare-fun bm!56735 () Bool)

(assert (=> bm!56735 (= call!56737 (getCurrentListMapNoExtraKeys!4840 lt!523385 lt!523395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162559 () Bool)

(declare-fun res!771123 () Bool)

(assert (=> b!1162559 (=> (not res!771123) (not e!661046))))

(assert (=> b!1162559 (= res!771123 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25438))))

(declare-fun b!1162560 () Bool)

(declare-fun res!771130 () Bool)

(assert (=> b!1162560 (=> (not res!771130) (not e!661046))))

(assert (=> b!1162560 (= res!771130 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36699 _keys!1208))))))

(declare-fun mapIsEmpty!45521 () Bool)

(assert (=> mapIsEmpty!45521 mapRes!45521))

(declare-fun b!1162561 () Bool)

(declare-fun res!771137 () Bool)

(assert (=> b!1162561 (=> (not res!771137) (not e!661046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162561 (= res!771137 (validKeyInArray!0 k0!934))))

(declare-fun b!1162562 () Bool)

(declare-fun res!771132 () Bool)

(assert (=> b!1162562 (=> (not res!771132) (not e!661046))))

(assert (=> b!1162562 (= res!771132 (= (select (arr!36161 _keys!1208) i!673) k0!934))))

(declare-fun b!1162563 () Bool)

(assert (=> b!1162563 (= e!661034 e!661038)))

(declare-fun res!771135 () Bool)

(assert (=> b!1162563 (=> res!771135 e!661038)))

(assert (=> b!1162563 (= res!771135 (not (= (select (arr!36161 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1162563 e!661040))

(declare-fun c!116246 () Bool)

(assert (=> b!1162563 (= c!116246 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523379 () Unit!38192)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!676 (array!75020 array!75022 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38192)

(assert (=> b!1162563 (= lt!523379 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98990 res!771136) b!1162553))

(assert (= (and b!1162553 res!771126) b!1162547))

(assert (= (and b!1162547 res!771127) b!1162539))

(assert (= (and b!1162539 res!771133) b!1162559))

(assert (= (and b!1162559 res!771123) b!1162560))

(assert (= (and b!1162560 res!771130) b!1162561))

(assert (= (and b!1162561 res!771137) b!1162562))

(assert (= (and b!1162562 res!771132) b!1162558))

(assert (= (and b!1162558 res!771125) b!1162534))

(assert (= (and b!1162534 res!771129) b!1162557))

(assert (= (and b!1162557 (not res!771124)) b!1162541))

(assert (= (and b!1162541 (not res!771134)) b!1162563))

(assert (= (and b!1162563 c!116246) b!1162555))

(assert (= (and b!1162563 (not c!116246)) b!1162542))

(assert (= (or b!1162555 b!1162542) bm!56735))

(assert (= (or b!1162555 b!1162542) bm!56732))

(assert (= (and b!1162563 (not res!771135)) b!1162552))

(assert (= (and b!1162552 c!116242) b!1162550))

(assert (= (and b!1162552 (not c!116242)) b!1162540))

(assert (= (and b!1162550 c!116243) b!1162544))

(assert (= (and b!1162550 (not c!116243)) b!1162537))

(assert (= (and b!1162537 c!116244) b!1162548))

(assert (= (and b!1162537 (not c!116244)) b!1162549))

(assert (= (and b!1162549 c!116241) b!1162554))

(assert (= (and b!1162549 (not c!116241)) b!1162543))

(assert (= (or b!1162548 b!1162554) bm!56728))

(assert (= (or b!1162548 b!1162554) bm!56733))

(assert (= (or b!1162548 b!1162554) bm!56734))

(assert (= (or b!1162544 bm!56734) bm!56731))

(assert (= (or b!1162544 bm!56728) bm!56729))

(assert (= (or b!1162544 bm!56733) bm!56730))

(assert (= (and b!1162550 c!116245) b!1162545))

(assert (= (and b!1162550 (not c!116245)) b!1162536))

(assert (= (and b!1162550 res!771131) b!1162535))

(assert (= (and b!1162552 res!771128) b!1162538))

(assert (= (and b!1162556 condMapEmpty!45521) mapIsEmpty!45521))

(assert (= (and b!1162556 (not condMapEmpty!45521)) mapNonEmpty!45521))

(get-info :version)

(assert (= (and mapNonEmpty!45521 ((_ is ValueCellFull!13856) mapValue!45521)) b!1162551))

(assert (= (and b!1162556 ((_ is ValueCellFull!13856) mapDefault!45521)) b!1162546))

(assert (= start!98990 b!1162556))

(declare-fun b_lambda!19689 () Bool)

(assert (=> (not b_lambda!19689) (not b!1162541)))

(declare-fun t!37024 () Bool)

(declare-fun tb!9405 () Bool)

(assert (=> (and start!98990 (= defaultEntry!1004 defaultEntry!1004) t!37024) tb!9405))

(declare-fun result!19383 () Bool)

(assert (=> tb!9405 (= result!19383 tp_is_empty!29131)))

(assert (=> b!1162541 t!37024))

(declare-fun b_and!40031 () Bool)

(assert (= b_and!40029 (and (=> t!37024 result!19383) b_and!40031)))

(declare-fun m!1070715 () Bool)

(assert (=> b!1162559 m!1070715))

(declare-fun m!1070717 () Bool)

(assert (=> start!98990 m!1070717))

(declare-fun m!1070719 () Bool)

(assert (=> start!98990 m!1070719))

(declare-fun m!1070721 () Bool)

(assert (=> b!1162561 m!1070721))

(declare-fun m!1070723 () Bool)

(assert (=> b!1162541 m!1070723))

(declare-fun m!1070725 () Bool)

(assert (=> b!1162541 m!1070725))

(declare-fun m!1070727 () Bool)

(assert (=> b!1162541 m!1070727))

(declare-fun m!1070729 () Bool)

(assert (=> b!1162541 m!1070729))

(declare-fun m!1070731 () Bool)

(assert (=> bm!56731 m!1070731))

(declare-fun m!1070733 () Bool)

(assert (=> b!1162534 m!1070733))

(declare-fun m!1070735 () Bool)

(assert (=> bm!56730 m!1070735))

(declare-fun m!1070737 () Bool)

(assert (=> b!1162538 m!1070737))

(declare-fun m!1070739 () Bool)

(assert (=> b!1162545 m!1070739))

(declare-fun m!1070741 () Bool)

(assert (=> bm!56732 m!1070741))

(assert (=> bm!56735 m!1070737))

(declare-fun m!1070743 () Bool)

(assert (=> b!1162555 m!1070743))

(declare-fun m!1070745 () Bool)

(assert (=> b!1162550 m!1070745))

(declare-fun m!1070747 () Bool)

(assert (=> b!1162550 m!1070747))

(declare-fun m!1070749 () Bool)

(assert (=> b!1162550 m!1070749))

(declare-fun m!1070751 () Bool)

(assert (=> b!1162550 m!1070751))

(assert (=> b!1162535 m!1070739))

(declare-fun m!1070753 () Bool)

(assert (=> bm!56729 m!1070753))

(declare-fun m!1070755 () Bool)

(assert (=> b!1162552 m!1070755))

(declare-fun m!1070757 () Bool)

(assert (=> b!1162552 m!1070757))

(declare-fun m!1070759 () Bool)

(assert (=> b!1162552 m!1070759))

(declare-fun m!1070761 () Bool)

(assert (=> b!1162552 m!1070761))

(declare-fun m!1070763 () Bool)

(assert (=> b!1162552 m!1070763))

(declare-fun m!1070765 () Bool)

(assert (=> b!1162552 m!1070765))

(assert (=> b!1162552 m!1070757))

(declare-fun m!1070767 () Bool)

(assert (=> b!1162552 m!1070767))

(assert (=> b!1162552 m!1070761))

(declare-fun m!1070769 () Bool)

(assert (=> b!1162552 m!1070769))

(assert (=> b!1162552 m!1070761))

(assert (=> b!1162552 m!1070741))

(assert (=> b!1162552 m!1070759))

(declare-fun m!1070771 () Bool)

(assert (=> b!1162558 m!1070771))

(declare-fun m!1070773 () Bool)

(assert (=> b!1162558 m!1070773))

(declare-fun m!1070775 () Bool)

(assert (=> b!1162544 m!1070775))

(assert (=> b!1162544 m!1070775))

(declare-fun m!1070777 () Bool)

(assert (=> b!1162544 m!1070777))

(declare-fun m!1070779 () Bool)

(assert (=> b!1162544 m!1070779))

(declare-fun m!1070781 () Bool)

(assert (=> b!1162553 m!1070781))

(declare-fun m!1070783 () Bool)

(assert (=> mapNonEmpty!45521 m!1070783))

(assert (=> b!1162563 m!1070761))

(declare-fun m!1070785 () Bool)

(assert (=> b!1162563 m!1070785))

(declare-fun m!1070787 () Bool)

(assert (=> b!1162539 m!1070787))

(declare-fun m!1070789 () Bool)

(assert (=> b!1162562 m!1070789))

(declare-fun m!1070791 () Bool)

(assert (=> b!1162557 m!1070791))

(declare-fun m!1070793 () Bool)

(assert (=> b!1162557 m!1070793))

(check-sat (not bm!56732) (not b!1162539) (not b!1162538) (not b!1162541) (not bm!56729) (not b!1162534) (not b!1162544) (not b!1162558) (not b_next!24601) (not b!1162553) (not bm!56730) (not b!1162552) (not mapNonEmpty!45521) (not b!1162557) (not b!1162550) (not b!1162555) (not bm!56731) (not bm!56735) tp_is_empty!29131 (not b!1162561) (not b_lambda!19689) (not b!1162559) (not b!1162535) b_and!40031 (not start!98990) (not b!1162545) (not b!1162563))
(check-sat b_and!40031 (not b_next!24601))

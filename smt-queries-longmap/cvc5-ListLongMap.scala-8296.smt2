; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101086 () Bool)

(assert start!101086)

(declare-fun b_free!26047 () Bool)

(declare-fun b_next!26047 () Bool)

(assert (=> start!101086 (= b_free!26047 (not b_next!26047))))

(declare-fun tp!91159 () Bool)

(declare-fun b_and!43193 () Bool)

(assert (=> start!101086 (= tp!91159 b_and!43193)))

(declare-fun b!1212012 () Bool)

(declare-fun res!805052 () Bool)

(declare-fun e!688321 () Bool)

(assert (=> b!1212012 (=> (not res!805052) (not e!688321))))

(declare-datatypes ((array!78289 0))(
  ( (array!78290 (arr!37780 (Array (_ BitVec 32) (_ BitVec 64))) (size!38316 (_ BitVec 32))) )
))
(declare-fun lt!550666 () array!78289)

(declare-datatypes ((List!26629 0))(
  ( (Nil!26626) (Cons!26625 (h!27834 (_ BitVec 64)) (t!39656 List!26629)) )
))
(declare-fun arrayNoDuplicates!0 (array!78289 (_ BitVec 32) List!26629) Bool)

(assert (=> b!1212012 (= res!805052 (arrayNoDuplicates!0 lt!550666 #b00000000000000000000000000000000 Nil!26626))))

(declare-fun b!1212014 () Bool)

(declare-fun res!805061 () Bool)

(declare-fun e!688317 () Bool)

(assert (=> b!1212014 (=> (not res!805061) (not e!688317))))

(declare-fun _keys!1208 () array!78289)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46129 0))(
  ( (V!46130 (val!15432 Int)) )
))
(declare-datatypes ((ValueCell!14666 0))(
  ( (ValueCellFull!14666 (v!18084 V!46129)) (EmptyCell!14666) )
))
(declare-datatypes ((array!78291 0))(
  ( (array!78292 (arr!37781 (Array (_ BitVec 32) ValueCell!14666)) (size!38317 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78291)

(assert (=> b!1212014 (= res!805061 (and (= (size!38317 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38316 _keys!1208) (size!38317 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1212015 () Bool)

(declare-fun e!688312 () Bool)

(declare-fun tp_is_empty!30751 () Bool)

(assert (=> b!1212015 (= e!688312 tp_is_empty!30751)))

(declare-fun b!1212016 () Bool)

(declare-datatypes ((Unit!40194 0))(
  ( (Unit!40195) )
))
(declare-fun e!688313 () Unit!40194)

(declare-fun Unit!40196 () Unit!40194)

(assert (=> b!1212016 (= e!688313 Unit!40196)))

(declare-fun lt!550656 () Bool)

(assert (=> b!1212016 (= lt!550656 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119587 () Bool)

(assert (=> b!1212016 (= c!119587 (and (not lt!550656) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550654 () Unit!40194)

(declare-fun e!688315 () Unit!40194)

(assert (=> b!1212016 (= lt!550654 e!688315)))

(declare-fun zeroValue!944 () V!46129)

(declare-fun lt!550652 () Unit!40194)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!46129)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!609 (array!78289 array!78291 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 64) (_ BitVec 32) Int) Unit!40194)

(assert (=> b!1212016 (= lt!550652 (lemmaListMapContainsThenArrayContainsFrom!609 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119583 () Bool)

(assert (=> b!1212016 (= c!119583 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805053 () Bool)

(declare-fun e!688325 () Bool)

(assert (=> b!1212016 (= res!805053 e!688325)))

(declare-fun e!688320 () Bool)

(assert (=> b!1212016 (=> (not res!805053) (not e!688320))))

(assert (=> b!1212016 e!688320))

(declare-fun lt!550672 () Unit!40194)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78289 (_ BitVec 32) (_ BitVec 32)) Unit!40194)

(assert (=> b!1212016 (= lt!550672 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212016 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26626)))

(declare-fun lt!550658 () Unit!40194)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78289 (_ BitVec 64) (_ BitVec 32) List!26629) Unit!40194)

(assert (=> b!1212016 (= lt!550658 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26626))))

(assert (=> b!1212016 false))

(declare-fun lt!550657 () array!78291)

(declare-fun e!688326 () Bool)

(declare-fun b!1212017 () Bool)

(declare-datatypes ((tuple2!19828 0))(
  ( (tuple2!19829 (_1!9925 (_ BitVec 64)) (_2!9925 V!46129)) )
))
(declare-datatypes ((List!26630 0))(
  ( (Nil!26627) (Cons!26626 (h!27835 tuple2!19828) (t!39657 List!26630)) )
))
(declare-datatypes ((ListLongMap!17797 0))(
  ( (ListLongMap!17798 (toList!8914 List!26630)) )
))
(declare-fun lt!550667 () ListLongMap!17797)

(declare-fun getCurrentListMapNoExtraKeys!5346 (array!78289 array!78291 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 32) Int) ListLongMap!17797)

(assert (=> b!1212017 (= e!688326 (= lt!550667 (getCurrentListMapNoExtraKeys!5346 lt!550666 lt!550657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1212018 () Bool)

(declare-fun e!688318 () Bool)

(assert (=> b!1212018 (= e!688318 true)))

(assert (=> b!1212018 e!688326))

(declare-fun res!805056 () Bool)

(assert (=> b!1212018 (=> (not res!805056) (not e!688326))))

(declare-fun lt!550670 () ListLongMap!17797)

(assert (=> b!1212018 (= res!805056 (= lt!550667 lt!550670))))

(declare-fun lt!550669 () ListLongMap!17797)

(declare-fun -!1862 (ListLongMap!17797 (_ BitVec 64)) ListLongMap!17797)

(assert (=> b!1212018 (= lt!550667 (-!1862 lt!550669 k!934))))

(declare-fun lt!550668 () V!46129)

(declare-fun +!4032 (ListLongMap!17797 tuple2!19828) ListLongMap!17797)

(assert (=> b!1212018 (= (-!1862 (+!4032 lt!550670 (tuple2!19829 (select (arr!37780 _keys!1208) from!1455) lt!550668)) (select (arr!37780 _keys!1208) from!1455)) lt!550670)))

(declare-fun lt!550663 () Unit!40194)

(declare-fun addThenRemoveForNewKeyIsSame!279 (ListLongMap!17797 (_ BitVec 64) V!46129) Unit!40194)

(assert (=> b!1212018 (= lt!550663 (addThenRemoveForNewKeyIsSame!279 lt!550670 (select (arr!37780 _keys!1208) from!1455) lt!550668))))

(declare-fun lt!550665 () V!46129)

(declare-fun get!19256 (ValueCell!14666 V!46129) V!46129)

(assert (=> b!1212018 (= lt!550668 (get!19256 (select (arr!37781 _values!996) from!1455) lt!550665))))

(declare-fun lt!550661 () Unit!40194)

(assert (=> b!1212018 (= lt!550661 e!688313)))

(declare-fun c!119586 () Bool)

(declare-fun contains!6986 (ListLongMap!17797 (_ BitVec 64)) Bool)

(assert (=> b!1212018 (= c!119586 (contains!6986 lt!550670 k!934))))

(assert (=> b!1212018 (= lt!550670 (getCurrentListMapNoExtraKeys!5346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119585 () Bool)

(declare-fun call!60027 () ListLongMap!17797)

(declare-fun bm!60023 () Bool)

(assert (=> bm!60023 (= call!60027 (+!4032 lt!550670 (ite (or c!119587 c!119585) (tuple2!19829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun call!60030 () ListLongMap!17797)

(declare-fun bm!60024 () Bool)

(assert (=> bm!60024 (= call!60030 (getCurrentListMapNoExtraKeys!5346 lt!550666 lt!550657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212019 () Bool)

(declare-fun e!688319 () Unit!40194)

(declare-fun lt!550653 () Unit!40194)

(assert (=> b!1212019 (= e!688319 lt!550653)))

(declare-fun call!60026 () Unit!40194)

(assert (=> b!1212019 (= lt!550653 call!60026)))

(declare-fun call!60032 () Bool)

(assert (=> b!1212019 call!60032))

(declare-fun b!1212020 () Bool)

(declare-fun e!688324 () Bool)

(declare-fun e!688311 () Bool)

(assert (=> b!1212020 (= e!688324 e!688311)))

(declare-fun res!805064 () Bool)

(assert (=> b!1212020 (=> res!805064 e!688311)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212020 (= res!805064 (not (= from!1455 i!673)))))

(declare-fun lt!550673 () ListLongMap!17797)

(assert (=> b!1212020 (= lt!550673 (getCurrentListMapNoExtraKeys!5346 lt!550666 lt!550657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1212020 (= lt!550657 (array!78292 (store (arr!37781 _values!996) i!673 (ValueCellFull!14666 lt!550665)) (size!38317 _values!996)))))

(declare-fun dynLambda!3240 (Int (_ BitVec 64)) V!46129)

(assert (=> b!1212020 (= lt!550665 (dynLambda!3240 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1212020 (= lt!550669 (getCurrentListMapNoExtraKeys!5346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1212021 () Bool)

(declare-fun lt!550660 () ListLongMap!17797)

(assert (=> b!1212021 (contains!6986 (+!4032 lt!550660 (tuple2!19829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!550664 () Unit!40194)

(declare-fun addStillContains!1059 (ListLongMap!17797 (_ BitVec 64) V!46129 (_ BitVec 64)) Unit!40194)

(assert (=> b!1212021 (= lt!550664 (addStillContains!1059 lt!550660 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!60029 () Bool)

(assert (=> b!1212021 call!60029))

(assert (=> b!1212021 (= lt!550660 call!60027)))

(declare-fun lt!550671 () Unit!40194)

(declare-fun call!60031 () Unit!40194)

(assert (=> b!1212021 (= lt!550671 call!60031)))

(assert (=> b!1212021 (= e!688315 lt!550664)))

(declare-fun b!1212013 () Bool)

(declare-fun res!805063 () Bool)

(assert (=> b!1212013 (=> (not res!805063) (not e!688317))))

(assert (=> b!1212013 (= res!805063 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26626))))

(declare-fun res!805054 () Bool)

(assert (=> start!101086 (=> (not res!805054) (not e!688317))))

(assert (=> start!101086 (= res!805054 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38316 _keys!1208))))))

(assert (=> start!101086 e!688317))

(assert (=> start!101086 tp_is_empty!30751))

(declare-fun array_inv!28780 (array!78289) Bool)

(assert (=> start!101086 (array_inv!28780 _keys!1208)))

(assert (=> start!101086 true))

(assert (=> start!101086 tp!91159))

(declare-fun e!688322 () Bool)

(declare-fun array_inv!28781 (array!78291) Bool)

(assert (=> start!101086 (and (array_inv!28781 _values!996) e!688322)))

(declare-fun mapNonEmpty!47998 () Bool)

(declare-fun mapRes!47998 () Bool)

(declare-fun tp!91160 () Bool)

(assert (=> mapNonEmpty!47998 (= mapRes!47998 (and tp!91160 e!688312))))

(declare-fun mapKey!47998 () (_ BitVec 32))

(declare-fun mapValue!47998 () ValueCell!14666)

(declare-fun mapRest!47998 () (Array (_ BitVec 32) ValueCell!14666))

(assert (=> mapNonEmpty!47998 (= (arr!37781 _values!996) (store mapRest!47998 mapKey!47998 mapValue!47998))))

(declare-fun b!1212022 () Bool)

(declare-fun res!805055 () Bool)

(assert (=> b!1212022 (=> (not res!805055) (not e!688317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78289 (_ BitVec 32)) Bool)

(assert (=> b!1212022 (= res!805055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!60025 () Bool)

(assert (=> bm!60025 (= call!60032 call!60029)))

(declare-fun b!1212023 () Bool)

(declare-fun res!805062 () Bool)

(assert (=> b!1212023 (=> (not res!805062) (not e!688317))))

(assert (=> b!1212023 (= res!805062 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38316 _keys!1208))))))

(declare-fun call!60033 () ListLongMap!17797)

(declare-fun bm!60026 () Bool)

(assert (=> bm!60026 (= call!60033 (getCurrentListMapNoExtraKeys!5346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212024 () Bool)

(assert (=> b!1212024 (= e!688325 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550656) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212025 () Bool)

(declare-fun e!688314 () Bool)

(assert (=> b!1212025 (= e!688314 (= call!60030 (-!1862 call!60033 k!934)))))

(declare-fun b!1212026 () Bool)

(assert (=> b!1212026 (= e!688317 e!688321)))

(declare-fun res!805058 () Bool)

(assert (=> b!1212026 (=> (not res!805058) (not e!688321))))

(assert (=> b!1212026 (= res!805058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550666 mask!1564))))

(assert (=> b!1212026 (= lt!550666 (array!78290 (store (arr!37780 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38316 _keys!1208)))))

(declare-fun b!1212027 () Bool)

(declare-fun res!805057 () Bool)

(assert (=> b!1212027 (=> (not res!805057) (not e!688317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212027 (= res!805057 (validKeyInArray!0 k!934))))

(declare-fun call!60028 () ListLongMap!17797)

(declare-fun bm!60027 () Bool)

(assert (=> bm!60027 (= call!60029 (contains!6986 (ite c!119587 lt!550660 call!60028) k!934))))

(declare-fun b!1212028 () Bool)

(assert (=> b!1212028 (= c!119585 (and (not lt!550656) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212028 (= e!688315 e!688319)))

(declare-fun b!1212029 () Bool)

(declare-fun res!805059 () Bool)

(assert (=> b!1212029 (=> (not res!805059) (not e!688317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212029 (= res!805059 (validMask!0 mask!1564))))

(declare-fun b!1212030 () Bool)

(assert (=> b!1212030 (= e!688311 e!688318)))

(declare-fun res!805065 () Bool)

(assert (=> b!1212030 (=> res!805065 e!688318)))

(assert (=> b!1212030 (= res!805065 (not (= (select (arr!37780 _keys!1208) from!1455) k!934)))))

(assert (=> b!1212030 e!688314))

(declare-fun c!119584 () Bool)

(assert (=> b!1212030 (= c!119584 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550655 () Unit!40194)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1072 (array!78289 array!78291 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40194)

(assert (=> b!1212030 (= lt!550655 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212031 () Bool)

(assert (=> b!1212031 (= e!688321 (not e!688324))))

(declare-fun res!805060 () Bool)

(assert (=> b!1212031 (=> res!805060 e!688324)))

(assert (=> b!1212031 (= res!805060 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212031 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!550662 () Unit!40194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78289 (_ BitVec 64) (_ BitVec 32)) Unit!40194)

(assert (=> b!1212031 (= lt!550662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!60028 () Bool)

(assert (=> bm!60028 (= call!60031 (addStillContains!1059 lt!550670 (ite (or c!119587 c!119585) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119587 c!119585) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1212032 () Bool)

(assert (=> b!1212032 call!60032))

(declare-fun lt!550659 () Unit!40194)

(assert (=> b!1212032 (= lt!550659 call!60026)))

(declare-fun e!688316 () Unit!40194)

(assert (=> b!1212032 (= e!688316 lt!550659)))

(declare-fun b!1212033 () Bool)

(declare-fun e!688310 () Bool)

(assert (=> b!1212033 (= e!688310 tp_is_empty!30751)))

(declare-fun b!1212034 () Bool)

(assert (=> b!1212034 (= e!688325 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212035 () Bool)

(declare-fun res!805066 () Bool)

(assert (=> b!1212035 (=> (not res!805066) (not e!688317))))

(assert (=> b!1212035 (= res!805066 (= (select (arr!37780 _keys!1208) i!673) k!934))))

(declare-fun b!1212036 () Bool)

(assert (=> b!1212036 (= e!688322 (and e!688310 mapRes!47998))))

(declare-fun condMapEmpty!47998 () Bool)

(declare-fun mapDefault!47998 () ValueCell!14666)


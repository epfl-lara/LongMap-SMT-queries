; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101084 () Bool)

(assert start!101084)

(declare-fun b_free!26045 () Bool)

(declare-fun b_next!26045 () Bool)

(assert (=> start!101084 (= b_free!26045 (not b_next!26045))))

(declare-fun tp!91154 () Bool)

(declare-fun b_and!43189 () Bool)

(assert (=> start!101084 (= tp!91154 b_and!43189)))

(declare-datatypes ((V!46125 0))(
  ( (V!46126 (val!15431 Int)) )
))
(declare-fun zeroValue!944 () V!46125)

(declare-datatypes ((array!78285 0))(
  ( (array!78286 (arr!37778 (Array (_ BitVec 32) (_ BitVec 64))) (size!38314 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78285)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!59999 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19826 0))(
  ( (tuple2!19827 (_1!9924 (_ BitVec 64)) (_2!9924 V!46125)) )
))
(declare-datatypes ((List!26627 0))(
  ( (Nil!26624) (Cons!26623 (h!27832 tuple2!19826) (t!39652 List!26627)) )
))
(declare-datatypes ((ListLongMap!17795 0))(
  ( (ListLongMap!17796 (toList!8913 List!26627)) )
))
(declare-fun call!60004 () ListLongMap!17795)

(declare-datatypes ((ValueCell!14665 0))(
  ( (ValueCellFull!14665 (v!18083 V!46125)) (EmptyCell!14665) )
))
(declare-datatypes ((array!78287 0))(
  ( (array!78288 (arr!37779 (Array (_ BitVec 32) ValueCell!14665)) (size!38315 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78287)

(declare-fun minValue!944 () V!46125)

(declare-fun getCurrentListMapNoExtraKeys!5345 (array!78285 array!78287 (_ BitVec 32) (_ BitVec 32) V!46125 V!46125 (_ BitVec 32) Int) ListLongMap!17795)

(assert (=> bm!59999 (= call!60004 (getCurrentListMapNoExtraKeys!5345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211921 () Bool)

(declare-fun res!805015 () Bool)

(declare-fun e!688275 () Bool)

(assert (=> b!1211921 (=> (not res!805015) (not e!688275))))

(assert (=> b!1211921 (= res!805015 (and (= (size!38315 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38314 _keys!1208) (size!38315 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211922 () Bool)

(declare-fun res!805013 () Bool)

(assert (=> b!1211922 (=> (not res!805013) (not e!688275))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1211922 (= res!805013 (= (select (arr!37778 _keys!1208) i!673) k!934))))

(declare-fun b!1211923 () Bool)

(declare-fun e!688273 () Bool)

(declare-fun e!688263 () Bool)

(assert (=> b!1211923 (= e!688273 (not e!688263))))

(declare-fun res!805014 () Bool)

(assert (=> b!1211923 (=> res!805014 e!688263)))

(assert (=> b!1211923 (= res!805014 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211923 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40189 0))(
  ( (Unit!40190) )
))
(declare-fun lt!550594 () Unit!40189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78285 (_ BitVec 64) (_ BitVec 32)) Unit!40189)

(assert (=> b!1211923 (= lt!550594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1211924 () Bool)

(declare-fun e!688265 () Bool)

(declare-fun call!60003 () ListLongMap!17795)

(assert (=> b!1211924 (= e!688265 (= call!60003 call!60004))))

(declare-fun b!1211925 () Bool)

(declare-fun e!688262 () Unit!40189)

(declare-fun lt!550602 () Unit!40189)

(assert (=> b!1211925 (= e!688262 lt!550602)))

(declare-fun call!60008 () Unit!40189)

(assert (=> b!1211925 (= lt!550602 call!60008)))

(declare-fun call!60005 () Bool)

(assert (=> b!1211925 call!60005))

(declare-fun b!1211926 () Bool)

(declare-fun e!688272 () Bool)

(assert (=> b!1211926 (= e!688263 e!688272)))

(declare-fun res!805012 () Bool)

(assert (=> b!1211926 (=> res!805012 e!688272)))

(assert (=> b!1211926 (= res!805012 (not (= from!1455 i!673)))))

(declare-fun lt!550590 () array!78285)

(declare-fun lt!550605 () array!78287)

(declare-fun lt!550588 () ListLongMap!17795)

(assert (=> b!1211926 (= lt!550588 (getCurrentListMapNoExtraKeys!5345 lt!550590 lt!550605 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550587 () V!46125)

(assert (=> b!1211926 (= lt!550605 (array!78288 (store (arr!37779 _values!996) i!673 (ValueCellFull!14665 lt!550587)) (size!38315 _values!996)))))

(declare-fun dynLambda!3239 (Int (_ BitVec 64)) V!46125)

(assert (=> b!1211926 (= lt!550587 (dynLambda!3239 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550591 () ListLongMap!17795)

(assert (=> b!1211926 (= lt!550591 (getCurrentListMapNoExtraKeys!5345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211927 () Bool)

(declare-fun e!688270 () Bool)

(assert (=> b!1211927 (= e!688272 e!688270)))

(declare-fun res!805017 () Bool)

(assert (=> b!1211927 (=> res!805017 e!688270)))

(assert (=> b!1211927 (= res!805017 (not (= (select (arr!37778 _keys!1208) from!1455) k!934)))))

(assert (=> b!1211927 e!688265))

(declare-fun c!119564 () Bool)

(assert (=> b!1211927 (= c!119564 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550603 () Unit!40189)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1071 (array!78285 array!78287 (_ BitVec 32) (_ BitVec 32) V!46125 V!46125 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40189)

(assert (=> b!1211927 (= lt!550603 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1071 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211928 () Bool)

(declare-fun res!805020 () Bool)

(assert (=> b!1211928 (=> (not res!805020) (not e!688275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78285 (_ BitVec 32)) Bool)

(assert (=> b!1211928 (= res!805020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211929 () Bool)

(declare-fun -!1861 (ListLongMap!17795 (_ BitVec 64)) ListLongMap!17795)

(assert (=> b!1211929 (= e!688265 (= call!60003 (-!1861 call!60004 k!934)))))

(declare-fun b!1211930 () Bool)

(declare-fun e!688271 () Unit!40189)

(declare-fun Unit!40191 () Unit!40189)

(assert (=> b!1211930 (= e!688271 Unit!40191)))

(declare-fun bm!60000 () Bool)

(declare-fun call!60009 () Bool)

(declare-fun call!60007 () ListLongMap!17795)

(declare-fun c!119565 () Bool)

(declare-fun lt!550604 () ListLongMap!17795)

(declare-fun contains!6985 (ListLongMap!17795 (_ BitVec 64)) Bool)

(assert (=> bm!60000 (= call!60009 (contains!6985 (ite c!119565 lt!550604 call!60007) k!934))))

(declare-fun b!1211931 () Bool)

(declare-fun lt!550600 () ListLongMap!17795)

(assert (=> b!1211931 (= e!688270 (= lt!550600 (getCurrentListMapNoExtraKeys!5345 lt!550590 lt!550605 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun lt!550586 () ListLongMap!17795)

(assert (=> b!1211931 (= lt!550600 lt!550586)))

(assert (=> b!1211931 (= lt!550600 (-!1861 lt!550591 k!934))))

(declare-fun lt!550599 () V!46125)

(declare-fun +!4031 (ListLongMap!17795 tuple2!19826) ListLongMap!17795)

(assert (=> b!1211931 (= (-!1861 (+!4031 lt!550586 (tuple2!19827 (select (arr!37778 _keys!1208) from!1455) lt!550599)) (select (arr!37778 _keys!1208) from!1455)) lt!550586)))

(declare-fun lt!550597 () Unit!40189)

(declare-fun addThenRemoveForNewKeyIsSame!278 (ListLongMap!17795 (_ BitVec 64) V!46125) Unit!40189)

(assert (=> b!1211931 (= lt!550597 (addThenRemoveForNewKeyIsSame!278 lt!550586 (select (arr!37778 _keys!1208) from!1455) lt!550599))))

(declare-fun get!19253 (ValueCell!14665 V!46125) V!46125)

(assert (=> b!1211931 (= lt!550599 (get!19253 (select (arr!37779 _values!996) from!1455) lt!550587))))

(declare-fun lt!550592 () Unit!40189)

(declare-fun e!688267 () Unit!40189)

(assert (=> b!1211931 (= lt!550592 e!688267)))

(declare-fun c!119569 () Bool)

(assert (=> b!1211931 (= c!119569 (contains!6985 lt!550586 k!934))))

(assert (=> b!1211931 (= lt!550586 (getCurrentListMapNoExtraKeys!5345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211932 () Bool)

(declare-fun e!688264 () Bool)

(declare-fun tp_is_empty!30749 () Bool)

(assert (=> b!1211932 (= e!688264 tp_is_empty!30749)))

(declare-fun b!1211933 () Bool)

(declare-fun e!688269 () Bool)

(assert (=> b!1211933 (= e!688269 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211934 () Bool)

(assert (=> b!1211934 (= e!688262 e!688271)))

(declare-fun c!119567 () Bool)

(declare-fun lt!550596 () Bool)

(assert (=> b!1211934 (= c!119567 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550596))))

(declare-fun bm!60001 () Bool)

(assert (=> bm!60001 (= call!60003 (getCurrentListMapNoExtraKeys!5345 lt!550590 lt!550605 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211935 () Bool)

(declare-fun c!119566 () Bool)

(assert (=> b!1211935 (= c!119566 (and (not lt!550596) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688274 () Unit!40189)

(assert (=> b!1211935 (= e!688274 e!688262)))

(declare-fun b!1211936 () Bool)

(declare-fun res!805021 () Bool)

(assert (=> b!1211936 (=> (not res!805021) (not e!688275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211936 (= res!805021 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!47995 () Bool)

(declare-fun mapRes!47995 () Bool)

(assert (=> mapIsEmpty!47995 mapRes!47995))

(declare-fun b!1211937 () Bool)

(declare-fun Unit!40192 () Unit!40189)

(assert (=> b!1211937 (= e!688267 Unit!40192)))

(declare-fun bm!60002 () Bool)

(assert (=> bm!60002 (= call!60005 call!60009)))

(declare-fun bm!60003 () Bool)

(declare-fun call!60006 () Unit!40189)

(assert (=> bm!60003 (= call!60008 call!60006)))

(declare-fun b!1211938 () Bool)

(declare-fun Unit!40193 () Unit!40189)

(assert (=> b!1211938 (= e!688267 Unit!40193)))

(assert (=> b!1211938 (= lt!550596 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211938 (= c!119565 (and (not lt!550596) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550589 () Unit!40189)

(assert (=> b!1211938 (= lt!550589 e!688274)))

(declare-fun lt!550593 () Unit!40189)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!608 (array!78285 array!78287 (_ BitVec 32) (_ BitVec 32) V!46125 V!46125 (_ BitVec 64) (_ BitVec 32) Int) Unit!40189)

(assert (=> b!1211938 (= lt!550593 (lemmaListMapContainsThenArrayContainsFrom!608 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119568 () Bool)

(assert (=> b!1211938 (= c!119568 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805008 () Bool)

(assert (=> b!1211938 (= res!805008 e!688269)))

(declare-fun e!688261 () Bool)

(assert (=> b!1211938 (=> (not res!805008) (not e!688261))))

(assert (=> b!1211938 e!688261))

(declare-fun lt!550601 () Unit!40189)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78285 (_ BitVec 32) (_ BitVec 32)) Unit!40189)

(assert (=> b!1211938 (= lt!550601 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26628 0))(
  ( (Nil!26625) (Cons!26624 (h!27833 (_ BitVec 64)) (t!39653 List!26628)) )
))
(declare-fun arrayNoDuplicates!0 (array!78285 (_ BitVec 32) List!26628) Bool)

(assert (=> b!1211938 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26625)))

(declare-fun lt!550606 () Unit!40189)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78285 (_ BitVec 64) (_ BitVec 32) List!26628) Unit!40189)

(assert (=> b!1211938 (= lt!550606 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26625))))

(assert (=> b!1211938 false))

(declare-fun bm!60004 () Bool)

(declare-fun addStillContains!1058 (ListLongMap!17795 (_ BitVec 64) V!46125 (_ BitVec 64)) Unit!40189)

(assert (=> bm!60004 (= call!60006 (addStillContains!1058 (ite c!119565 lt!550604 lt!550586) (ite c!119565 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119566 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119565 minValue!944 (ite c!119566 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1211939 () Bool)

(assert (=> b!1211939 (= e!688261 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!805010 () Bool)

(assert (=> start!101084 (=> (not res!805010) (not e!688275))))

(assert (=> start!101084 (= res!805010 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38314 _keys!1208))))))

(assert (=> start!101084 e!688275))

(assert (=> start!101084 tp_is_empty!30749))

(declare-fun array_inv!28778 (array!78285) Bool)

(assert (=> start!101084 (array_inv!28778 _keys!1208)))

(assert (=> start!101084 true))

(assert (=> start!101084 tp!91154))

(declare-fun e!688260 () Bool)

(declare-fun array_inv!28779 (array!78287) Bool)

(assert (=> start!101084 (and (array_inv!28779 _values!996) e!688260)))

(declare-fun b!1211940 () Bool)

(declare-fun e!688266 () Bool)

(assert (=> b!1211940 (= e!688266 tp_is_empty!30749)))

(declare-fun bm!60005 () Bool)

(declare-fun call!60002 () ListLongMap!17795)

(assert (=> bm!60005 (= call!60007 call!60002)))

(declare-fun b!1211941 () Bool)

(assert (=> b!1211941 (= e!688260 (and e!688264 mapRes!47995))))

(declare-fun condMapEmpty!47995 () Bool)

(declare-fun mapDefault!47995 () ValueCell!14665)


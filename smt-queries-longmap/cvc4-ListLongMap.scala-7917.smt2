; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98346 () Bool)

(assert start!98346)

(declare-fun b_free!23951 () Bool)

(declare-fun b_next!23951 () Bool)

(assert (=> start!98346 (= b_free!23951 (not b_next!23951))))

(declare-fun tp!84564 () Bool)

(declare-fun b_and!38751 () Bool)

(assert (=> start!98346 (= tp!84564 b_and!38751)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1133003 () Bool)

(declare-fun lt!503468 () Bool)

(declare-fun e!644838 () Bool)

(assert (=> b!1133003 (= e!644838 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503468) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133004 () Bool)

(declare-fun res!756584 () Bool)

(declare-fun e!644833 () Bool)

(assert (=> b!1133004 (=> (not res!756584) (not e!644833))))

(declare-datatypes ((array!73823 0))(
  ( (array!73824 (arr!35562 (Array (_ BitVec 32) (_ BitVec 64))) (size!36098 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73823)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73823 (_ BitVec 32)) Bool)

(assert (=> b!1133004 (= res!756584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133005 () Bool)

(declare-fun res!756576 () Bool)

(assert (=> b!1133005 (=> (not res!756576) (not e!644833))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133005 (= res!756576 (= (select (arr!35562 _keys!1208) i!673) k!934))))

(declare-fun res!756574 () Bool)

(assert (=> start!98346 (=> (not res!756574) (not e!644833))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98346 (= res!756574 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36098 _keys!1208))))))

(assert (=> start!98346 e!644833))

(declare-fun tp_is_empty!28481 () Bool)

(assert (=> start!98346 tp_is_empty!28481))

(declare-fun array_inv!27278 (array!73823) Bool)

(assert (=> start!98346 (array_inv!27278 _keys!1208)))

(assert (=> start!98346 true))

(assert (=> start!98346 tp!84564))

(declare-datatypes ((V!43101 0))(
  ( (V!43102 (val!14297 Int)) )
))
(declare-datatypes ((ValueCell!13531 0))(
  ( (ValueCellFull!13531 (v!16934 V!43101)) (EmptyCell!13531) )
))
(declare-datatypes ((array!73825 0))(
  ( (array!73826 (arr!35563 (Array (_ BitVec 32) ValueCell!13531)) (size!36099 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73825)

(declare-fun e!644836 () Bool)

(declare-fun array_inv!27279 (array!73825) Bool)

(assert (=> start!98346 (and (array_inv!27279 _values!996) e!644836)))

(declare-fun b!1133006 () Bool)

(declare-fun e!644830 () Bool)

(declare-fun arrayContainsKey!0 (array!73823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133006 (= e!644830 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133007 () Bool)

(declare-fun e!644829 () Bool)

(declare-fun e!644832 () Bool)

(assert (=> b!1133007 (= e!644829 (not e!644832))))

(declare-fun res!756579 () Bool)

(assert (=> b!1133007 (=> res!756579 e!644832)))

(assert (=> b!1133007 (= res!756579 (bvsgt from!1455 i!673))))

(assert (=> b!1133007 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37125 0))(
  ( (Unit!37126) )
))
(declare-fun lt!503459 () Unit!37125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73823 (_ BitVec 64) (_ BitVec 32)) Unit!37125)

(assert (=> b!1133007 (= lt!503459 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!48951 () Bool)

(declare-datatypes ((tuple2!18026 0))(
  ( (tuple2!18027 (_1!9024 (_ BitVec 64)) (_2!9024 V!43101)) )
))
(declare-datatypes ((List!24788 0))(
  ( (Nil!24785) (Cons!24784 (h!25993 tuple2!18026) (t!35731 List!24788)) )
))
(declare-datatypes ((ListLongMap!15995 0))(
  ( (ListLongMap!15996 (toList!8013 List!24788)) )
))
(declare-fun call!48961 () ListLongMap!15995)

(declare-fun call!48957 () ListLongMap!15995)

(assert (=> bm!48951 (= call!48961 call!48957)))

(declare-fun zeroValue!944 () V!43101)

(declare-fun c!110537 () Bool)

(declare-fun c!110539 () Bool)

(declare-fun bm!48952 () Bool)

(declare-fun lt!503469 () ListLongMap!15995)

(declare-fun lt!503456 () ListLongMap!15995)

(declare-fun minValue!944 () V!43101)

(declare-fun +!3456 (ListLongMap!15995 tuple2!18026) ListLongMap!15995)

(assert (=> bm!48952 (= call!48957 (+!3456 (ite c!110537 lt!503456 lt!503469) (ite c!110537 (tuple2!18027 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110539 (tuple2!18027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18027 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133008 () Bool)

(declare-fun e!644825 () Unit!37125)

(declare-fun e!644823 () Unit!37125)

(assert (=> b!1133008 (= e!644825 e!644823)))

(assert (=> b!1133008 (= c!110539 (and (not lt!503468) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133009 () Bool)

(declare-fun res!756582 () Bool)

(assert (=> b!1133009 (=> (not res!756582) (not e!644833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133009 (= res!756582 (validKeyInArray!0 k!934))))

(declare-fun b!1133010 () Bool)

(declare-fun e!644834 () Bool)

(assert (=> b!1133010 (= e!644834 tp_is_empty!28481)))

(declare-fun b!1133011 () Bool)

(declare-fun e!644826 () Bool)

(declare-fun e!644837 () Bool)

(assert (=> b!1133011 (= e!644826 e!644837)))

(declare-fun res!756580 () Bool)

(assert (=> b!1133011 (=> res!756580 e!644837)))

(declare-fun contains!6539 (ListLongMap!15995 (_ BitVec 64)) Bool)

(assert (=> b!1133011 (= res!756580 (not (contains!6539 lt!503469 k!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4500 (array!73823 array!73825 (_ BitVec 32) (_ BitVec 32) V!43101 V!43101 (_ BitVec 32) Int) ListLongMap!15995)

(assert (=> b!1133011 (= lt!503469 (getCurrentListMapNoExtraKeys!4500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48953 () Bool)

(declare-fun call!48958 () Unit!37125)

(declare-fun call!48955 () Unit!37125)

(assert (=> bm!48953 (= call!48958 call!48955)))

(declare-fun bm!48954 () Bool)

(declare-fun call!48959 () ListLongMap!15995)

(assert (=> bm!48954 (= call!48959 (getCurrentListMapNoExtraKeys!4500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503455 () array!73823)

(declare-fun bm!48955 () Bool)

(declare-fun call!48954 () ListLongMap!15995)

(declare-fun lt!503461 () array!73825)

(assert (=> bm!48955 (= call!48954 (getCurrentListMapNoExtraKeys!4500 lt!503455 lt!503461 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133012 () Bool)

(declare-fun e!644827 () Bool)

(assert (=> b!1133012 (= e!644827 e!644826)))

(declare-fun res!756583 () Bool)

(assert (=> b!1133012 (=> res!756583 e!644826)))

(assert (=> b!1133012 (= res!756583 (not (= (select (arr!35562 _keys!1208) from!1455) k!934)))))

(declare-fun e!644835 () Bool)

(assert (=> b!1133012 e!644835))

(declare-fun c!110538 () Bool)

(assert (=> b!1133012 (= c!110538 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503462 () Unit!37125)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!437 (array!73823 array!73825 (_ BitVec 32) (_ BitVec 32) V!43101 V!43101 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37125)

(assert (=> b!1133012 (= lt!503462 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133013 () Bool)

(declare-fun res!756587 () Bool)

(assert (=> b!1133013 (=> (not res!756587) (not e!644833))))

(declare-datatypes ((List!24789 0))(
  ( (Nil!24786) (Cons!24785 (h!25994 (_ BitVec 64)) (t!35732 List!24789)) )
))
(declare-fun arrayNoDuplicates!0 (array!73823 (_ BitVec 32) List!24789) Bool)

(assert (=> b!1133013 (= res!756587 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24786))))

(declare-fun b!1133014 () Bool)

(declare-fun res!756585 () Bool)

(assert (=> b!1133014 (=> (not res!756585) (not e!644833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133014 (= res!756585 (validMask!0 mask!1564))))

(declare-fun b!1133015 () Bool)

(declare-fun -!1183 (ListLongMap!15995 (_ BitVec 64)) ListLongMap!15995)

(assert (=> b!1133015 (= e!644835 (= call!48954 (-!1183 call!48959 k!934)))))

(declare-fun b!1133016 () Bool)

(assert (=> b!1133016 (= e!644835 (= call!48954 call!48959))))

(declare-fun b!1133017 () Bool)

(declare-fun e!644828 () Unit!37125)

(declare-fun Unit!37127 () Unit!37125)

(assert (=> b!1133017 (= e!644828 Unit!37127)))

(declare-fun b!1133018 () Bool)

(declare-fun res!756575 () Bool)

(assert (=> b!1133018 (=> (not res!756575) (not e!644833))))

(assert (=> b!1133018 (= res!756575 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36098 _keys!1208))))))

(declare-fun b!1133019 () Bool)

(declare-fun c!110535 () Bool)

(assert (=> b!1133019 (= c!110535 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503468))))

(assert (=> b!1133019 (= e!644823 e!644828)))

(declare-fun mapNonEmpty!44546 () Bool)

(declare-fun mapRes!44546 () Bool)

(declare-fun tp!84563 () Bool)

(assert (=> mapNonEmpty!44546 (= mapRes!44546 (and tp!84563 e!644834))))

(declare-fun mapValue!44546 () ValueCell!13531)

(declare-fun mapRest!44546 () (Array (_ BitVec 32) ValueCell!13531))

(declare-fun mapKey!44546 () (_ BitVec 32))

(assert (=> mapNonEmpty!44546 (= (arr!35563 _values!996) (store mapRest!44546 mapKey!44546 mapValue!44546))))

(declare-fun bm!48956 () Bool)

(declare-fun addStillContains!719 (ListLongMap!15995 (_ BitVec 64) V!43101 (_ BitVec 64)) Unit!37125)

(assert (=> bm!48956 (= call!48955 (addStillContains!719 (ite c!110537 lt!503456 lt!503469) (ite c!110537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110539 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110537 minValue!944 (ite c!110539 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!48957 () Bool)

(declare-fun call!48956 () Bool)

(assert (=> bm!48957 (= call!48956 (contains!6539 (ite c!110537 lt!503456 call!48961) k!934))))

(declare-fun b!1133020 () Bool)

(declare-fun call!48960 () Bool)

(assert (=> b!1133020 call!48960))

(declare-fun lt!503460 () Unit!37125)

(assert (=> b!1133020 (= lt!503460 call!48958)))

(assert (=> b!1133020 (= e!644823 lt!503460)))

(declare-fun b!1133021 () Bool)

(declare-fun lt!503464 () Unit!37125)

(assert (=> b!1133021 (= e!644825 lt!503464)))

(declare-fun lt!503463 () Unit!37125)

(assert (=> b!1133021 (= lt!503463 (addStillContains!719 lt!503469 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1133021 (= lt!503456 (+!3456 lt!503469 (tuple2!18027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1133021 call!48956))

(assert (=> b!1133021 (= lt!503464 call!48955)))

(assert (=> b!1133021 (contains!6539 call!48957 k!934)))

(declare-fun b!1133022 () Bool)

(assert (=> b!1133022 (= e!644832 e!644827)))

(declare-fun res!756581 () Bool)

(assert (=> b!1133022 (=> res!756581 e!644827)))

(assert (=> b!1133022 (= res!756581 (not (= from!1455 i!673)))))

(declare-fun lt!503457 () ListLongMap!15995)

(assert (=> b!1133022 (= lt!503457 (getCurrentListMapNoExtraKeys!4500 lt!503455 lt!503461 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2569 (Int (_ BitVec 64)) V!43101)

(assert (=> b!1133022 (= lt!503461 (array!73826 (store (arr!35563 _values!996) i!673 (ValueCellFull!13531 (dynLambda!2569 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36099 _values!996)))))

(declare-fun lt!503466 () ListLongMap!15995)

(assert (=> b!1133022 (= lt!503466 (getCurrentListMapNoExtraKeys!4500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133023 () Bool)

(declare-fun res!756577 () Bool)

(assert (=> b!1133023 (=> (not res!756577) (not e!644829))))

(assert (=> b!1133023 (= res!756577 (arrayNoDuplicates!0 lt!503455 #b00000000000000000000000000000000 Nil!24786))))

(declare-fun mapIsEmpty!44546 () Bool)

(assert (=> mapIsEmpty!44546 mapRes!44546))

(declare-fun b!1133024 () Bool)

(declare-fun res!756586 () Bool)

(assert (=> b!1133024 (=> (not res!756586) (not e!644833))))

(assert (=> b!1133024 (= res!756586 (and (= (size!36099 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36098 _keys!1208) (size!36099 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48958 () Bool)

(assert (=> bm!48958 (= call!48960 call!48956)))

(declare-fun b!1133025 () Bool)

(assert (=> b!1133025 (= e!644833 e!644829)))

(declare-fun res!756573 () Bool)

(assert (=> b!1133025 (=> (not res!756573) (not e!644829))))

(assert (=> b!1133025 (= res!756573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503455 mask!1564))))

(assert (=> b!1133025 (= lt!503455 (array!73824 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36098 _keys!1208)))))

(declare-fun b!1133026 () Bool)

(declare-fun lt!503458 () Unit!37125)

(assert (=> b!1133026 (= e!644828 lt!503458)))

(assert (=> b!1133026 (= lt!503458 call!48958)))

(assert (=> b!1133026 call!48960))

(declare-fun b!1133027 () Bool)

(declare-fun e!644824 () Bool)

(assert (=> b!1133027 (= e!644824 tp_is_empty!28481)))

(declare-fun b!1133028 () Bool)

(assert (=> b!1133028 (= e!644836 (and e!644824 mapRes!44546))))

(declare-fun condMapEmpty!44546 () Bool)

(declare-fun mapDefault!44546 () ValueCell!13531)


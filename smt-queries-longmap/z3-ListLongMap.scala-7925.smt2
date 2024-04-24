; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98626 () Bool)

(assert start!98626)

(declare-fun b_free!23995 () Bool)

(declare-fun b_next!23995 () Bool)

(assert (=> start!98626 (= b_free!23995 (not b_next!23995))))

(declare-fun tp!84695 () Bool)

(declare-fun b_and!38841 () Bool)

(assert (=> start!98626 (= tp!84695 b_and!38841)))

(declare-fun b!1136271 () Bool)

(declare-fun e!646749 () Bool)

(declare-fun e!646747 () Bool)

(assert (=> b!1136271 (= e!646749 e!646747)))

(declare-fun res!758174 () Bool)

(assert (=> b!1136271 (=> res!758174 e!646747)))

(declare-datatypes ((V!43161 0))(
  ( (V!43162 (val!14319 Int)) )
))
(declare-datatypes ((tuple2!18080 0))(
  ( (tuple2!18081 (_1!9051 (_ BitVec 64)) (_2!9051 V!43161)) )
))
(declare-datatypes ((List!24846 0))(
  ( (Nil!24843) (Cons!24842 (h!26060 tuple2!18080) (t!35825 List!24846)) )
))
(declare-datatypes ((ListLongMap!16057 0))(
  ( (ListLongMap!16058 (toList!8044 List!24846)) )
))
(declare-fun lt!505003 () ListLongMap!16057)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6584 (ListLongMap!16057 (_ BitVec 64)) Bool)

(assert (=> b!1136271 (= res!758174 (not (contains!6584 lt!505003 k0!934)))))

(declare-fun zeroValue!944 () V!43161)

(declare-datatypes ((array!73953 0))(
  ( (array!73954 (arr!35621 (Array (_ BitVec 32) (_ BitVec 64))) (size!36158 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13553 0))(
  ( (ValueCellFull!13553 (v!16952 V!43161)) (EmptyCell!13553) )
))
(declare-datatypes ((array!73955 0))(
  ( (array!73956 (arr!35622 (Array (_ BitVec 32) ValueCell!13553)) (size!36159 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73955)

(declare-fun minValue!944 () V!43161)

(declare-fun getCurrentListMapNoExtraKeys!4555 (array!73953 array!73955 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 32) Int) ListLongMap!16057)

(assert (=> b!1136271 (= lt!505003 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136272 () Bool)

(declare-datatypes ((Unit!37151 0))(
  ( (Unit!37152) )
))
(declare-fun e!646744 () Unit!37151)

(declare-fun Unit!37153 () Unit!37151)

(assert (=> b!1136272 (= e!646744 Unit!37153)))

(declare-fun bm!49544 () Bool)

(declare-fun call!49548 () ListLongMap!16057)

(declare-fun call!49553 () ListLongMap!16057)

(assert (=> bm!49544 (= call!49548 call!49553)))

(declare-fun b!1136273 () Bool)

(declare-fun res!758167 () Bool)

(declare-fun e!646753 () Bool)

(assert (=> b!1136273 (=> (not res!758167) (not e!646753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136273 (= res!758167 (validMask!0 mask!1564))))

(declare-fun b!1136274 () Bool)

(declare-fun res!758159 () Bool)

(declare-fun e!646748 () Bool)

(assert (=> b!1136274 (=> res!758159 e!646748)))

(declare-datatypes ((List!24847 0))(
  ( (Nil!24844) (Cons!24843 (h!26061 (_ BitVec 64)) (t!35826 List!24847)) )
))
(declare-fun contains!6585 (List!24847 (_ BitVec 64)) Bool)

(assert (=> b!1136274 (= res!758159 (contains!6585 Nil!24844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136275 () Bool)

(declare-fun res!758173 () Bool)

(assert (=> b!1136275 (=> (not res!758173) (not e!646753))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136275 (= res!758173 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36158 _keys!1208))))))

(declare-fun b!1136276 () Bool)

(declare-fun e!646742 () Unit!37151)

(declare-fun lt!504991 () Unit!37151)

(assert (=> b!1136276 (= e!646742 lt!504991)))

(declare-fun lt!505002 () Unit!37151)

(declare-fun addStillContains!727 (ListLongMap!16057 (_ BitVec 64) V!43161 (_ BitVec 64)) Unit!37151)

(assert (=> b!1136276 (= lt!505002 (addStillContains!727 lt!505003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!504990 () ListLongMap!16057)

(assert (=> b!1136276 (= lt!504990 call!49553)))

(declare-fun call!49550 () Bool)

(assert (=> b!1136276 call!49550))

(declare-fun call!49554 () Unit!37151)

(assert (=> b!1136276 (= lt!504991 call!49554)))

(declare-fun +!3500 (ListLongMap!16057 tuple2!18080) ListLongMap!16057)

(assert (=> b!1136276 (contains!6584 (+!3500 lt!504990 (tuple2!18081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1136277 () Bool)

(declare-fun e!646751 () Bool)

(declare-fun tp_is_empty!28525 () Bool)

(assert (=> b!1136277 (= e!646751 tp_is_empty!28525)))

(declare-fun e!646740 () Bool)

(declare-fun b!1136278 () Bool)

(declare-fun call!49551 () ListLongMap!16057)

(declare-fun call!49547 () ListLongMap!16057)

(declare-fun -!1193 (ListLongMap!16057 (_ BitVec 64)) ListLongMap!16057)

(assert (=> b!1136278 (= e!646740 (= call!49547 (-!1193 call!49551 k0!934)))))

(declare-fun e!646754 () Bool)

(declare-fun b!1136279 () Bool)

(declare-fun arrayContainsKey!0 (array!73953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136279 (= e!646754 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136280 () Bool)

(declare-fun res!758170 () Bool)

(assert (=> b!1136280 (=> res!758170 e!646748)))

(declare-fun noDuplicate!1610 (List!24847) Bool)

(assert (=> b!1136280 (= res!758170 (not (noDuplicate!1610 Nil!24844)))))

(declare-fun b!1136281 () Bool)

(declare-fun e!646743 () Unit!37151)

(assert (=> b!1136281 (= e!646742 e!646743)))

(declare-fun c!111263 () Bool)

(declare-fun lt!504995 () Bool)

(assert (=> b!1136281 (= c!111263 (and (not lt!504995) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!49545 () Bool)

(assert (=> bm!49545 (= call!49551 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44612 () Bool)

(declare-fun mapRes!44612 () Bool)

(declare-fun tp!84696 () Bool)

(declare-fun e!646746 () Bool)

(assert (=> mapNonEmpty!44612 (= mapRes!44612 (and tp!84696 e!646746))))

(declare-fun mapValue!44612 () ValueCell!13553)

(declare-fun mapKey!44612 () (_ BitVec 32))

(declare-fun mapRest!44612 () (Array (_ BitVec 32) ValueCell!13553))

(assert (=> mapNonEmpty!44612 (= (arr!35622 _values!996) (store mapRest!44612 mapKey!44612 mapValue!44612))))

(declare-fun e!646752 () Bool)

(declare-fun b!1136282 () Bool)

(assert (=> b!1136282 (= e!646752 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136283 () Bool)

(declare-fun e!646750 () Bool)

(declare-fun e!646755 () Bool)

(assert (=> b!1136283 (= e!646750 e!646755)))

(declare-fun res!758164 () Bool)

(assert (=> b!1136283 (=> res!758164 e!646755)))

(assert (=> b!1136283 (= res!758164 (not (= from!1455 i!673)))))

(declare-fun lt!504999 () ListLongMap!16057)

(declare-fun lt!504998 () array!73955)

(declare-fun lt!504987 () array!73953)

(assert (=> b!1136283 (= lt!504999 (getCurrentListMapNoExtraKeys!4555 lt!504987 lt!504998 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2610 (Int (_ BitVec 64)) V!43161)

(assert (=> b!1136283 (= lt!504998 (array!73956 (store (arr!35622 _values!996) i!673 (ValueCellFull!13553 (dynLambda!2610 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36159 _values!996)))))

(declare-fun lt!504994 () ListLongMap!16057)

(assert (=> b!1136283 (= lt!504994 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136284 () Bool)

(declare-fun res!758168 () Bool)

(assert (=> b!1136284 (=> (not res!758168) (not e!646753))))

(assert (=> b!1136284 (= res!758168 (and (= (size!36159 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36158 _keys!1208) (size!36159 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44612 () Bool)

(assert (=> mapIsEmpty!44612 mapRes!44612))

(declare-fun b!1136285 () Bool)

(declare-fun e!646745 () Bool)

(assert (=> b!1136285 (= e!646745 (not e!646750))))

(declare-fun res!758163 () Bool)

(assert (=> b!1136285 (=> res!758163 e!646750)))

(assert (=> b!1136285 (= res!758163 (bvsgt from!1455 i!673))))

(assert (=> b!1136285 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504989 () Unit!37151)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73953 (_ BitVec 64) (_ BitVec 32)) Unit!37151)

(assert (=> b!1136285 (= lt!504989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1136286 () Bool)

(assert (=> b!1136286 (= e!646740 (= call!49547 call!49551))))

(declare-fun b!1136287 () Bool)

(declare-fun res!758166 () Bool)

(assert (=> b!1136287 (=> (not res!758166) (not e!646745))))

(declare-fun arrayNoDuplicates!0 (array!73953 (_ BitVec 32) List!24847) Bool)

(assert (=> b!1136287 (= res!758166 (arrayNoDuplicates!0 lt!504987 #b00000000000000000000000000000000 Nil!24844))))

(declare-fun bm!49546 () Bool)

(declare-fun call!49549 () Bool)

(assert (=> bm!49546 (= call!49549 call!49550)))

(declare-fun b!1136288 () Bool)

(declare-fun c!111267 () Bool)

(assert (=> b!1136288 (= c!111267 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504995))))

(assert (=> b!1136288 (= e!646743 e!646744)))

(declare-fun b!1136289 () Bool)

(declare-fun e!646756 () Bool)

(assert (=> b!1136289 (= e!646756 (and e!646751 mapRes!44612))))

(declare-fun condMapEmpty!44612 () Bool)

(declare-fun mapDefault!44612 () ValueCell!13553)

(assert (=> b!1136289 (= condMapEmpty!44612 (= (arr!35622 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13553)) mapDefault!44612)))))

(declare-fun b!1136290 () Bool)

(assert (=> b!1136290 call!49549))

(declare-fun lt!504997 () Unit!37151)

(declare-fun call!49552 () Unit!37151)

(assert (=> b!1136290 (= lt!504997 call!49552)))

(assert (=> b!1136290 (= e!646743 lt!504997)))

(declare-fun b!1136291 () Bool)

(assert (=> b!1136291 (= e!646746 tp_is_empty!28525)))

(declare-fun b!1136292 () Bool)

(declare-fun res!758158 () Bool)

(assert (=> b!1136292 (=> (not res!758158) (not e!646753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136292 (= res!758158 (validKeyInArray!0 k0!934))))

(declare-fun b!1136293 () Bool)

(assert (=> b!1136293 (= e!646755 e!646749)))

(declare-fun res!758175 () Bool)

(assert (=> b!1136293 (=> res!758175 e!646749)))

(assert (=> b!1136293 (= res!758175 (not (= (select (arr!35621 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1136293 e!646740))

(declare-fun c!111265 () Bool)

(assert (=> b!1136293 (= c!111265 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505000 () Unit!37151)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!449 (array!73953 array!73955 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37151)

(assert (=> b!1136293 (= lt!505000 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49547 () Bool)

(declare-fun c!111266 () Bool)

(assert (=> bm!49547 (= call!49553 (+!3500 lt!505003 (ite (or c!111266 c!111263) (tuple2!18081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1136294 () Bool)

(declare-fun lt!504988 () Unit!37151)

(assert (=> b!1136294 (= e!646744 lt!504988)))

(assert (=> b!1136294 (= lt!504988 call!49552)))

(assert (=> b!1136294 call!49549))

(declare-fun bm!49548 () Bool)

(assert (=> bm!49548 (= call!49554 (addStillContains!727 (ite c!111266 lt!504990 lt!505003) (ite c!111266 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111263 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111266 minValue!944 (ite c!111263 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1136295 () Bool)

(declare-fun res!758171 () Bool)

(assert (=> b!1136295 (=> (not res!758171) (not e!646753))))

(assert (=> b!1136295 (= res!758171 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24844))))

(declare-fun bm!49549 () Bool)

(assert (=> bm!49549 (= call!49552 call!49554)))

(declare-fun bm!49550 () Bool)

(assert (=> bm!49550 (= call!49547 (getCurrentListMapNoExtraKeys!4555 lt!504987 lt!504998 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136296 () Bool)

(assert (=> b!1136296 (= e!646747 e!646748)))

(declare-fun res!758172 () Bool)

(assert (=> b!1136296 (=> res!758172 e!646748)))

(assert (=> b!1136296 (= res!758172 (or (bvsge (size!36158 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36158 _keys!1208)) (bvsge from!1455 (size!36158 _keys!1208))))))

(assert (=> b!1136296 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24844)))

(declare-fun lt!504993 () Unit!37151)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73953 (_ BitVec 32) (_ BitVec 32)) Unit!37151)

(assert (=> b!1136296 (= lt!504993 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1136296 e!646754))

(declare-fun res!758161 () Bool)

(assert (=> b!1136296 (=> (not res!758161) (not e!646754))))

(assert (=> b!1136296 (= res!758161 e!646752)))

(declare-fun c!111264 () Bool)

(assert (=> b!1136296 (= c!111264 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504996 () Unit!37151)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!336 (array!73953 array!73955 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 64) (_ BitVec 32) Int) Unit!37151)

(assert (=> b!1136296 (= lt!504996 (lemmaListMapContainsThenArrayContainsFrom!336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504992 () Unit!37151)

(assert (=> b!1136296 (= lt!504992 e!646742)))

(assert (=> b!1136296 (= c!111266 (and (not lt!504995) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136296 (= lt!504995 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!758160 () Bool)

(assert (=> start!98626 (=> (not res!758160) (not e!646753))))

(assert (=> start!98626 (= res!758160 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36158 _keys!1208))))))

(assert (=> start!98626 e!646753))

(assert (=> start!98626 tp_is_empty!28525))

(declare-fun array_inv!27370 (array!73953) Bool)

(assert (=> start!98626 (array_inv!27370 _keys!1208)))

(assert (=> start!98626 true))

(assert (=> start!98626 tp!84695))

(declare-fun array_inv!27371 (array!73955) Bool)

(assert (=> start!98626 (and (array_inv!27371 _values!996) e!646756)))

(declare-fun b!1136297 () Bool)

(assert (=> b!1136297 (= e!646752 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504995) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136298 () Bool)

(assert (=> b!1136298 (= e!646748 true)))

(declare-fun lt!505001 () Bool)

(assert (=> b!1136298 (= lt!505001 (contains!6585 Nil!24844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136299 () Bool)

(declare-fun res!758165 () Bool)

(assert (=> b!1136299 (=> (not res!758165) (not e!646753))))

(assert (=> b!1136299 (= res!758165 (= (select (arr!35621 _keys!1208) i!673) k0!934))))

(declare-fun b!1136300 () Bool)

(declare-fun res!758169 () Bool)

(assert (=> b!1136300 (=> (not res!758169) (not e!646753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73953 (_ BitVec 32)) Bool)

(assert (=> b!1136300 (= res!758169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!49551 () Bool)

(assert (=> bm!49551 (= call!49550 (contains!6584 (ite c!111266 lt!504990 call!49548) k0!934))))

(declare-fun b!1136301 () Bool)

(assert (=> b!1136301 (= e!646753 e!646745)))

(declare-fun res!758162 () Bool)

(assert (=> b!1136301 (=> (not res!758162) (not e!646745))))

(assert (=> b!1136301 (= res!758162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504987 mask!1564))))

(assert (=> b!1136301 (= lt!504987 (array!73954 (store (arr!35621 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36158 _keys!1208)))))

(assert (= (and start!98626 res!758160) b!1136273))

(assert (= (and b!1136273 res!758167) b!1136284))

(assert (= (and b!1136284 res!758168) b!1136300))

(assert (= (and b!1136300 res!758169) b!1136295))

(assert (= (and b!1136295 res!758171) b!1136275))

(assert (= (and b!1136275 res!758173) b!1136292))

(assert (= (and b!1136292 res!758158) b!1136299))

(assert (= (and b!1136299 res!758165) b!1136301))

(assert (= (and b!1136301 res!758162) b!1136287))

(assert (= (and b!1136287 res!758166) b!1136285))

(assert (= (and b!1136285 (not res!758163)) b!1136283))

(assert (= (and b!1136283 (not res!758164)) b!1136293))

(assert (= (and b!1136293 c!111265) b!1136278))

(assert (= (and b!1136293 (not c!111265)) b!1136286))

(assert (= (or b!1136278 b!1136286) bm!49550))

(assert (= (or b!1136278 b!1136286) bm!49545))

(assert (= (and b!1136293 (not res!758175)) b!1136271))

(assert (= (and b!1136271 (not res!758174)) b!1136296))

(assert (= (and b!1136296 c!111266) b!1136276))

(assert (= (and b!1136296 (not c!111266)) b!1136281))

(assert (= (and b!1136281 c!111263) b!1136290))

(assert (= (and b!1136281 (not c!111263)) b!1136288))

(assert (= (and b!1136288 c!111267) b!1136294))

(assert (= (and b!1136288 (not c!111267)) b!1136272))

(assert (= (or b!1136290 b!1136294) bm!49549))

(assert (= (or b!1136290 b!1136294) bm!49544))

(assert (= (or b!1136290 b!1136294) bm!49546))

(assert (= (or b!1136276 bm!49546) bm!49551))

(assert (= (or b!1136276 bm!49549) bm!49548))

(assert (= (or b!1136276 bm!49544) bm!49547))

(assert (= (and b!1136296 c!111264) b!1136282))

(assert (= (and b!1136296 (not c!111264)) b!1136297))

(assert (= (and b!1136296 res!758161) b!1136279))

(assert (= (and b!1136296 (not res!758172)) b!1136280))

(assert (= (and b!1136280 (not res!758170)) b!1136274))

(assert (= (and b!1136274 (not res!758159)) b!1136298))

(assert (= (and b!1136289 condMapEmpty!44612) mapIsEmpty!44612))

(assert (= (and b!1136289 (not condMapEmpty!44612)) mapNonEmpty!44612))

(get-info :version)

(assert (= (and mapNonEmpty!44612 ((_ is ValueCellFull!13553) mapValue!44612)) b!1136291))

(assert (= (and b!1136289 ((_ is ValueCellFull!13553) mapDefault!44612)) b!1136277))

(assert (= start!98626 b!1136289))

(declare-fun b_lambda!19095 () Bool)

(assert (=> (not b_lambda!19095) (not b!1136283)))

(declare-fun t!35824 () Bool)

(declare-fun tb!8799 () Bool)

(assert (=> (and start!98626 (= defaultEntry!1004 defaultEntry!1004) t!35824) tb!8799))

(declare-fun result!18171 () Bool)

(assert (=> tb!8799 (= result!18171 tp_is_empty!28525)))

(assert (=> b!1136283 t!35824))

(declare-fun b_and!38843 () Bool)

(assert (= b_and!38841 (and (=> t!35824 result!18171) b_and!38843)))

(declare-fun m!1049235 () Bool)

(assert (=> b!1136282 m!1049235))

(declare-fun m!1049237 () Bool)

(assert (=> bm!49551 m!1049237))

(declare-fun m!1049239 () Bool)

(assert (=> b!1136276 m!1049239))

(declare-fun m!1049241 () Bool)

(assert (=> b!1136276 m!1049241))

(assert (=> b!1136276 m!1049241))

(declare-fun m!1049243 () Bool)

(assert (=> b!1136276 m!1049243))

(assert (=> b!1136279 m!1049235))

(declare-fun m!1049245 () Bool)

(assert (=> bm!49550 m!1049245))

(declare-fun m!1049247 () Bool)

(assert (=> mapNonEmpty!44612 m!1049247))

(declare-fun m!1049249 () Bool)

(assert (=> b!1136296 m!1049249))

(declare-fun m!1049251 () Bool)

(assert (=> b!1136296 m!1049251))

(declare-fun m!1049253 () Bool)

(assert (=> b!1136296 m!1049253))

(declare-fun m!1049255 () Bool)

(assert (=> b!1136293 m!1049255))

(declare-fun m!1049257 () Bool)

(assert (=> b!1136293 m!1049257))

(declare-fun m!1049259 () Bool)

(assert (=> b!1136280 m!1049259))

(declare-fun m!1049261 () Bool)

(assert (=> start!98626 m!1049261))

(declare-fun m!1049263 () Bool)

(assert (=> start!98626 m!1049263))

(declare-fun m!1049265 () Bool)

(assert (=> b!1136273 m!1049265))

(declare-fun m!1049267 () Bool)

(assert (=> b!1136301 m!1049267))

(declare-fun m!1049269 () Bool)

(assert (=> b!1136301 m!1049269))

(declare-fun m!1049271 () Bool)

(assert (=> bm!49548 m!1049271))

(declare-fun m!1049273 () Bool)

(assert (=> b!1136292 m!1049273))

(declare-fun m!1049275 () Bool)

(assert (=> bm!49547 m!1049275))

(declare-fun m!1049277 () Bool)

(assert (=> b!1136278 m!1049277))

(declare-fun m!1049279 () Bool)

(assert (=> b!1136287 m!1049279))

(declare-fun m!1049281 () Bool)

(assert (=> bm!49545 m!1049281))

(declare-fun m!1049283 () Bool)

(assert (=> b!1136274 m!1049283))

(declare-fun m!1049285 () Bool)

(assert (=> b!1136295 m!1049285))

(declare-fun m!1049287 () Bool)

(assert (=> b!1136300 m!1049287))

(declare-fun m!1049289 () Bool)

(assert (=> b!1136299 m!1049289))

(declare-fun m!1049291 () Bool)

(assert (=> b!1136285 m!1049291))

(declare-fun m!1049293 () Bool)

(assert (=> b!1136285 m!1049293))

(declare-fun m!1049295 () Bool)

(assert (=> b!1136271 m!1049295))

(assert (=> b!1136271 m!1049281))

(declare-fun m!1049297 () Bool)

(assert (=> b!1136283 m!1049297))

(declare-fun m!1049299 () Bool)

(assert (=> b!1136283 m!1049299))

(declare-fun m!1049301 () Bool)

(assert (=> b!1136283 m!1049301))

(declare-fun m!1049303 () Bool)

(assert (=> b!1136283 m!1049303))

(declare-fun m!1049305 () Bool)

(assert (=> b!1136298 m!1049305))

(check-sat (not b!1136300) (not b!1136274) (not start!98626) (not b!1136295) (not b!1136296) (not b!1136298) (not b!1136285) (not b!1136283) (not b_next!23995) (not b!1136276) (not b!1136273) (not mapNonEmpty!44612) (not b!1136301) (not bm!49545) (not b!1136287) (not b!1136293) (not bm!49548) (not b!1136282) (not b!1136271) (not bm!49551) tp_is_empty!28525 (not bm!49550) (not b!1136279) (not b_lambda!19095) (not bm!49547) (not b!1136278) (not b!1136292) b_and!38843 (not b!1136280))
(check-sat b_and!38843 (not b_next!23995))

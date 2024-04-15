; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98372 () Bool)

(assert start!98372)

(declare-fun b_free!23983 () Bool)

(declare-fun b_next!23983 () Bool)

(assert (=> start!98372 (= b_free!23983 (not b_next!23983))))

(declare-fun tp!84660 () Bool)

(declare-fun b_and!38793 () Bool)

(assert (=> start!98372 (= tp!84660 b_and!38793)))

(declare-fun b!1134288 () Bool)

(declare-datatypes ((Unit!37007 0))(
  ( (Unit!37008) )
))
(declare-fun e!645530 () Unit!37007)

(declare-fun e!645525 () Unit!37007)

(assert (=> b!1134288 (= e!645530 e!645525)))

(declare-fun c!110751 () Bool)

(declare-fun lt!504009 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1134288 (= c!110751 (and (not lt!504009) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!43145 0))(
  ( (V!43146 (val!14313 Int)) )
))
(declare-fun zeroValue!944 () V!43145)

(declare-datatypes ((array!73810 0))(
  ( (array!73811 (arr!35556 (Array (_ BitVec 32) (_ BitVec 64))) (size!36094 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73810)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18142 0))(
  ( (tuple2!18143 (_1!9082 (_ BitVec 64)) (_2!9082 V!43145)) )
))
(declare-datatypes ((List!24888 0))(
  ( (Nil!24885) (Cons!24884 (h!26093 tuple2!18142) (t!35854 List!24888)) )
))
(declare-datatypes ((ListLongMap!16111 0))(
  ( (ListLongMap!16112 (toList!8071 List!24888)) )
))
(declare-fun call!49317 () ListLongMap!16111)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13547 0))(
  ( (ValueCellFull!13547 (v!16949 V!43145)) (EmptyCell!13547) )
))
(declare-datatypes ((array!73812 0))(
  ( (array!73813 (arr!35557 (Array (_ BitVec 32) ValueCell!13547)) (size!36095 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73812)

(declare-fun bm!49312 () Bool)

(declare-fun minValue!944 () V!43145)

(declare-fun getCurrentListMapNoExtraKeys!4569 (array!73810 array!73812 (_ BitVec 32) (_ BitVec 32) V!43145 V!43145 (_ BitVec 32) Int) ListLongMap!16111)

(assert (=> bm!49312 (= call!49317 (getCurrentListMapNoExtraKeys!4569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134289 () Bool)

(declare-fun res!757276 () Bool)

(declare-fun e!645529 () Bool)

(assert (=> b!1134289 (=> (not res!757276) (not e!645529))))

(declare-datatypes ((List!24889 0))(
  ( (Nil!24886) (Cons!24885 (h!26094 (_ BitVec 64)) (t!35855 List!24889)) )
))
(declare-fun arrayNoDuplicates!0 (array!73810 (_ BitVec 32) List!24889) Bool)

(assert (=> b!1134289 (= res!757276 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24886))))

(declare-fun b!1134290 () Bool)

(declare-fun res!757268 () Bool)

(assert (=> b!1134290 (=> (not res!757268) (not e!645529))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134290 (= res!757268 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36094 _keys!1208))))))

(declare-fun b!1134291 () Bool)

(declare-fun call!49316 () Bool)

(assert (=> b!1134291 call!49316))

(declare-fun lt!504015 () Unit!37007)

(declare-fun call!49320 () Unit!37007)

(assert (=> b!1134291 (= lt!504015 call!49320)))

(assert (=> b!1134291 (= e!645525 lt!504015)))

(declare-fun b!1134292 () Bool)

(declare-fun res!757266 () Bool)

(assert (=> b!1134292 (=> (not res!757266) (not e!645529))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1134292 (= res!757266 (= (select (arr!35556 _keys!1208) i!673) k0!934))))

(declare-fun b!1134293 () Bool)

(declare-fun e!645526 () Bool)

(assert (=> b!1134293 (= e!645526 true)))

(declare-fun lt!504018 () Bool)

(declare-fun contains!6528 (List!24889 (_ BitVec 64)) Bool)

(assert (=> b!1134293 (= lt!504018 (contains!6528 Nil!24886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!757263 () Bool)

(assert (=> start!98372 (=> (not res!757263) (not e!645529))))

(assert (=> start!98372 (= res!757263 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36094 _keys!1208))))))

(assert (=> start!98372 e!645529))

(declare-fun tp_is_empty!28513 () Bool)

(assert (=> start!98372 tp_is_empty!28513))

(declare-fun array_inv!27342 (array!73810) Bool)

(assert (=> start!98372 (array_inv!27342 _keys!1208)))

(assert (=> start!98372 true))

(assert (=> start!98372 tp!84660))

(declare-fun e!645533 () Bool)

(declare-fun array_inv!27343 (array!73812) Bool)

(assert (=> start!98372 (and (array_inv!27343 _values!996) e!645533)))

(declare-fun e!645538 () Bool)

(declare-fun b!1134294 () Bool)

(declare-fun call!49319 () ListLongMap!16111)

(declare-fun -!1171 (ListLongMap!16111 (_ BitVec 64)) ListLongMap!16111)

(assert (=> b!1134294 (= e!645538 (= call!49319 (-!1171 call!49317 k0!934)))))

(declare-fun b!1134295 () Bool)

(declare-fun e!645527 () Bool)

(assert (=> b!1134295 (= e!645527 e!645526)))

(declare-fun res!757260 () Bool)

(assert (=> b!1134295 (=> res!757260 e!645526)))

(assert (=> b!1134295 (= res!757260 (or (bvsge (size!36094 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36094 _keys!1208)) (bvsge from!1455 (size!36094 _keys!1208))))))

(assert (=> b!1134295 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24886)))

(declare-fun lt!504006 () Unit!37007)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73810 (_ BitVec 32) (_ BitVec 32)) Unit!37007)

(assert (=> b!1134295 (= lt!504006 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!645536 () Bool)

(assert (=> b!1134295 e!645536))

(declare-fun res!757272 () Bool)

(assert (=> b!1134295 (=> (not res!757272) (not e!645536))))

(declare-fun e!645537 () Bool)

(assert (=> b!1134295 (= res!757272 e!645537)))

(declare-fun c!110750 () Bool)

(assert (=> b!1134295 (= c!110750 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504021 () Unit!37007)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!336 (array!73810 array!73812 (_ BitVec 32) (_ BitVec 32) V!43145 V!43145 (_ BitVec 64) (_ BitVec 32) Int) Unit!37007)

(assert (=> b!1134295 (= lt!504021 (lemmaListMapContainsThenArrayContainsFrom!336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504020 () Unit!37007)

(assert (=> b!1134295 (= lt!504020 e!645530)))

(declare-fun c!110753 () Bool)

(assert (=> b!1134295 (= c!110753 (and (not lt!504009) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134295 (= lt!504009 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134296 () Bool)

(declare-fun arrayContainsKey!0 (array!73810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134296 (= e!645537 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134297 () Bool)

(declare-fun e!645531 () Bool)

(declare-fun e!645532 () Bool)

(assert (=> b!1134297 (= e!645531 e!645532)))

(declare-fun res!757267 () Bool)

(assert (=> b!1134297 (=> res!757267 e!645532)))

(assert (=> b!1134297 (= res!757267 (not (= (select (arr!35556 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1134297 e!645538))

(declare-fun c!110752 () Bool)

(assert (=> b!1134297 (= c!110752 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504010 () Unit!37007)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!456 (array!73810 array!73812 (_ BitVec 32) (_ BitVec 32) V!43145 V!43145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37007)

(assert (=> b!1134297 (= lt!504010 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504013 () array!73812)

(declare-fun bm!49313 () Bool)

(declare-fun lt!504014 () array!73810)

(assert (=> bm!49313 (= call!49319 (getCurrentListMapNoExtraKeys!4569 lt!504014 lt!504013 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504007 () ListLongMap!16111)

(declare-fun bm!49314 () Bool)

(declare-fun call!49321 () ListLongMap!16111)

(declare-fun call!49318 () Bool)

(declare-fun contains!6529 (ListLongMap!16111 (_ BitVec 64)) Bool)

(assert (=> bm!49314 (= call!49318 (contains!6529 (ite c!110753 lt!504007 call!49321) k0!934))))

(declare-fun b!1134298 () Bool)

(declare-fun e!645535 () Bool)

(assert (=> b!1134298 (= e!645529 e!645535)))

(declare-fun res!757277 () Bool)

(assert (=> b!1134298 (=> (not res!757277) (not e!645535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73810 (_ BitVec 32)) Bool)

(assert (=> b!1134298 (= res!757277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504014 mask!1564))))

(assert (=> b!1134298 (= lt!504014 (array!73811 (store (arr!35556 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36094 _keys!1208)))))

(declare-fun b!1134299 () Bool)

(declare-fun res!757265 () Bool)

(assert (=> b!1134299 (=> (not res!757265) (not e!645529))))

(assert (=> b!1134299 (= res!757265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134300 () Bool)

(declare-fun e!645539 () Bool)

(assert (=> b!1134300 (= e!645535 (not e!645539))))

(declare-fun res!757262 () Bool)

(assert (=> b!1134300 (=> res!757262 e!645539)))

(assert (=> b!1134300 (= res!757262 (bvsgt from!1455 i!673))))

(assert (=> b!1134300 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504008 () Unit!37007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73810 (_ BitVec 64) (_ BitVec 32)) Unit!37007)

(assert (=> b!1134300 (= lt!504008 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1134301 () Bool)

(declare-fun res!757270 () Bool)

(assert (=> b!1134301 (=> (not res!757270) (not e!645535))))

(assert (=> b!1134301 (= res!757270 (arrayNoDuplicates!0 lt!504014 #b00000000000000000000000000000000 Nil!24886))))

(declare-fun b!1134302 () Bool)

(declare-fun c!110749 () Bool)

(assert (=> b!1134302 (= c!110749 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504009))))

(declare-fun e!645528 () Unit!37007)

(assert (=> b!1134302 (= e!645525 e!645528)))

(declare-fun bm!49315 () Bool)

(declare-fun lt!504011 () ListLongMap!16111)

(declare-fun call!49315 () Unit!37007)

(declare-fun addStillContains!723 (ListLongMap!16111 (_ BitVec 64) V!43145 (_ BitVec 64)) Unit!37007)

(assert (=> bm!49315 (= call!49315 (addStillContains!723 (ite c!110753 lt!504007 lt!504011) (ite c!110753 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110751 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110753 minValue!944 (ite c!110751 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!49316 () Bool)

(declare-fun call!49322 () ListLongMap!16111)

(declare-fun +!3505 (ListLongMap!16111 tuple2!18142) ListLongMap!16111)

(assert (=> bm!49316 (= call!49322 (+!3505 (ite c!110753 lt!504007 lt!504011) (ite c!110753 (tuple2!18143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110751 (tuple2!18143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1134303 () Bool)

(assert (=> b!1134303 (= e!645538 (= call!49319 call!49317))))

(declare-fun b!1134304 () Bool)

(declare-fun lt!504012 () Unit!37007)

(assert (=> b!1134304 (= e!645528 lt!504012)))

(assert (=> b!1134304 (= lt!504012 call!49320)))

(assert (=> b!1134304 call!49316))

(declare-fun mapNonEmpty!44594 () Bool)

(declare-fun mapRes!44594 () Bool)

(declare-fun tp!84659 () Bool)

(declare-fun e!645534 () Bool)

(assert (=> mapNonEmpty!44594 (= mapRes!44594 (and tp!84659 e!645534))))

(declare-fun mapValue!44594 () ValueCell!13547)

(declare-fun mapKey!44594 () (_ BitVec 32))

(declare-fun mapRest!44594 () (Array (_ BitVec 32) ValueCell!13547))

(assert (=> mapNonEmpty!44594 (= (arr!35557 _values!996) (store mapRest!44594 mapKey!44594 mapValue!44594))))

(declare-fun bm!49317 () Bool)

(assert (=> bm!49317 (= call!49321 call!49322)))

(declare-fun b!1134305 () Bool)

(assert (=> b!1134305 (= e!645532 e!645527)))

(declare-fun res!757264 () Bool)

(assert (=> b!1134305 (=> res!757264 e!645527)))

(assert (=> b!1134305 (= res!757264 (not (contains!6529 lt!504011 k0!934)))))

(assert (=> b!1134305 (= lt!504011 (getCurrentListMapNoExtraKeys!4569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134306 () Bool)

(declare-fun lt!504019 () Unit!37007)

(assert (=> b!1134306 (= e!645530 lt!504019)))

(declare-fun lt!504016 () Unit!37007)

(assert (=> b!1134306 (= lt!504016 (addStillContains!723 lt!504011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1134306 (= lt!504007 (+!3505 lt!504011 (tuple2!18143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1134306 call!49318))

(assert (=> b!1134306 (= lt!504019 call!49315)))

(assert (=> b!1134306 (contains!6529 call!49322 k0!934)))

(declare-fun b!1134307 () Bool)

(declare-fun Unit!37009 () Unit!37007)

(assert (=> b!1134307 (= e!645528 Unit!37009)))

(declare-fun b!1134308 () Bool)

(assert (=> b!1134308 (= e!645534 tp_is_empty!28513)))

(declare-fun b!1134309 () Bool)

(assert (=> b!1134309 (= e!645539 e!645531)))

(declare-fun res!757269 () Bool)

(assert (=> b!1134309 (=> res!757269 e!645531)))

(assert (=> b!1134309 (= res!757269 (not (= from!1455 i!673)))))

(declare-fun lt!504005 () ListLongMap!16111)

(assert (=> b!1134309 (= lt!504005 (getCurrentListMapNoExtraKeys!4569 lt!504014 lt!504013 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2567 (Int (_ BitVec 64)) V!43145)

(assert (=> b!1134309 (= lt!504013 (array!73813 (store (arr!35557 _values!996) i!673 (ValueCellFull!13547 (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36095 _values!996)))))

(declare-fun lt!504017 () ListLongMap!16111)

(assert (=> b!1134309 (= lt!504017 (getCurrentListMapNoExtraKeys!4569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1134310 () Bool)

(declare-fun e!645524 () Bool)

(assert (=> b!1134310 (= e!645524 tp_is_empty!28513)))

(declare-fun b!1134311 () Bool)

(declare-fun res!757275 () Bool)

(assert (=> b!1134311 (=> res!757275 e!645526)))

(assert (=> b!1134311 (= res!757275 (contains!6528 Nil!24886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134312 () Bool)

(assert (=> b!1134312 (= e!645536 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134313 () Bool)

(declare-fun res!757271 () Bool)

(assert (=> b!1134313 (=> (not res!757271) (not e!645529))))

(assert (=> b!1134313 (= res!757271 (and (= (size!36095 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36094 _keys!1208) (size!36095 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134314 () Bool)

(declare-fun res!757273 () Bool)

(assert (=> b!1134314 (=> res!757273 e!645526)))

(declare-fun noDuplicate!1603 (List!24889) Bool)

(assert (=> b!1134314 (= res!757273 (not (noDuplicate!1603 Nil!24886)))))

(declare-fun b!1134315 () Bool)

(assert (=> b!1134315 (= e!645537 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504009) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134316 () Bool)

(declare-fun res!757261 () Bool)

(assert (=> b!1134316 (=> (not res!757261) (not e!645529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134316 (= res!757261 (validKeyInArray!0 k0!934))))

(declare-fun bm!49318 () Bool)

(assert (=> bm!49318 (= call!49316 call!49318)))

(declare-fun mapIsEmpty!44594 () Bool)

(assert (=> mapIsEmpty!44594 mapRes!44594))

(declare-fun b!1134317 () Bool)

(declare-fun res!757274 () Bool)

(assert (=> b!1134317 (=> (not res!757274) (not e!645529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134317 (= res!757274 (validMask!0 mask!1564))))

(declare-fun b!1134318 () Bool)

(assert (=> b!1134318 (= e!645533 (and e!645524 mapRes!44594))))

(declare-fun condMapEmpty!44594 () Bool)

(declare-fun mapDefault!44594 () ValueCell!13547)

(assert (=> b!1134318 (= condMapEmpty!44594 (= (arr!35557 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13547)) mapDefault!44594)))))

(declare-fun bm!49319 () Bool)

(assert (=> bm!49319 (= call!49320 call!49315)))

(assert (= (and start!98372 res!757263) b!1134317))

(assert (= (and b!1134317 res!757274) b!1134313))

(assert (= (and b!1134313 res!757271) b!1134299))

(assert (= (and b!1134299 res!757265) b!1134289))

(assert (= (and b!1134289 res!757276) b!1134290))

(assert (= (and b!1134290 res!757268) b!1134316))

(assert (= (and b!1134316 res!757261) b!1134292))

(assert (= (and b!1134292 res!757266) b!1134298))

(assert (= (and b!1134298 res!757277) b!1134301))

(assert (= (and b!1134301 res!757270) b!1134300))

(assert (= (and b!1134300 (not res!757262)) b!1134309))

(assert (= (and b!1134309 (not res!757269)) b!1134297))

(assert (= (and b!1134297 c!110752) b!1134294))

(assert (= (and b!1134297 (not c!110752)) b!1134303))

(assert (= (or b!1134294 b!1134303) bm!49313))

(assert (= (or b!1134294 b!1134303) bm!49312))

(assert (= (and b!1134297 (not res!757267)) b!1134305))

(assert (= (and b!1134305 (not res!757264)) b!1134295))

(assert (= (and b!1134295 c!110753) b!1134306))

(assert (= (and b!1134295 (not c!110753)) b!1134288))

(assert (= (and b!1134288 c!110751) b!1134291))

(assert (= (and b!1134288 (not c!110751)) b!1134302))

(assert (= (and b!1134302 c!110749) b!1134304))

(assert (= (and b!1134302 (not c!110749)) b!1134307))

(assert (= (or b!1134291 b!1134304) bm!49319))

(assert (= (or b!1134291 b!1134304) bm!49317))

(assert (= (or b!1134291 b!1134304) bm!49318))

(assert (= (or b!1134306 bm!49318) bm!49314))

(assert (= (or b!1134306 bm!49319) bm!49315))

(assert (= (or b!1134306 bm!49317) bm!49316))

(assert (= (and b!1134295 c!110750) b!1134296))

(assert (= (and b!1134295 (not c!110750)) b!1134315))

(assert (= (and b!1134295 res!757272) b!1134312))

(assert (= (and b!1134295 (not res!757260)) b!1134314))

(assert (= (and b!1134314 (not res!757273)) b!1134311))

(assert (= (and b!1134311 (not res!757275)) b!1134293))

(assert (= (and b!1134318 condMapEmpty!44594) mapIsEmpty!44594))

(assert (= (and b!1134318 (not condMapEmpty!44594)) mapNonEmpty!44594))

(get-info :version)

(assert (= (and mapNonEmpty!44594 ((_ is ValueCellFull!13547) mapValue!44594)) b!1134308))

(assert (= (and b!1134318 ((_ is ValueCellFull!13547) mapDefault!44594)) b!1134310))

(assert (= start!98372 b!1134318))

(declare-fun b_lambda!19071 () Bool)

(assert (=> (not b_lambda!19071) (not b!1134309)))

(declare-fun t!35853 () Bool)

(declare-fun tb!8787 () Bool)

(assert (=> (and start!98372 (= defaultEntry!1004 defaultEntry!1004) t!35853) tb!8787))

(declare-fun result!18147 () Bool)

(assert (=> tb!8787 (= result!18147 tp_is_empty!28513)))

(assert (=> b!1134309 t!35853))

(declare-fun b_and!38795 () Bool)

(assert (= b_and!38793 (and (=> t!35853 result!18147) b_and!38795)))

(declare-fun m!1046623 () Bool)

(assert (=> b!1134293 m!1046623))

(declare-fun m!1046625 () Bool)

(assert (=> b!1134312 m!1046625))

(declare-fun m!1046627 () Bool)

(assert (=> b!1134297 m!1046627))

(declare-fun m!1046629 () Bool)

(assert (=> b!1134297 m!1046629))

(declare-fun m!1046631 () Bool)

(assert (=> b!1134299 m!1046631))

(declare-fun m!1046633 () Bool)

(assert (=> bm!49316 m!1046633))

(declare-fun m!1046635 () Bool)

(assert (=> b!1134316 m!1046635))

(declare-fun m!1046637 () Bool)

(assert (=> b!1134294 m!1046637))

(declare-fun m!1046639 () Bool)

(assert (=> b!1134295 m!1046639))

(declare-fun m!1046641 () Bool)

(assert (=> b!1134295 m!1046641))

(declare-fun m!1046643 () Bool)

(assert (=> b!1134295 m!1046643))

(declare-fun m!1046645 () Bool)

(assert (=> b!1134305 m!1046645))

(declare-fun m!1046647 () Bool)

(assert (=> b!1134305 m!1046647))

(declare-fun m!1046649 () Bool)

(assert (=> b!1134314 m!1046649))

(declare-fun m!1046651 () Bool)

(assert (=> b!1134317 m!1046651))

(declare-fun m!1046653 () Bool)

(assert (=> b!1134309 m!1046653))

(declare-fun m!1046655 () Bool)

(assert (=> b!1134309 m!1046655))

(declare-fun m!1046657 () Bool)

(assert (=> b!1134309 m!1046657))

(declare-fun m!1046659 () Bool)

(assert (=> b!1134309 m!1046659))

(assert (=> b!1134296 m!1046625))

(declare-fun m!1046661 () Bool)

(assert (=> b!1134311 m!1046661))

(declare-fun m!1046663 () Bool)

(assert (=> b!1134306 m!1046663))

(declare-fun m!1046665 () Bool)

(assert (=> b!1134306 m!1046665))

(declare-fun m!1046667 () Bool)

(assert (=> b!1134306 m!1046667))

(declare-fun m!1046669 () Bool)

(assert (=> b!1134289 m!1046669))

(declare-fun m!1046671 () Bool)

(assert (=> b!1134300 m!1046671))

(declare-fun m!1046673 () Bool)

(assert (=> b!1134300 m!1046673))

(declare-fun m!1046675 () Bool)

(assert (=> b!1134292 m!1046675))

(assert (=> bm!49312 m!1046647))

(declare-fun m!1046677 () Bool)

(assert (=> bm!49314 m!1046677))

(declare-fun m!1046679 () Bool)

(assert (=> mapNonEmpty!44594 m!1046679))

(declare-fun m!1046681 () Bool)

(assert (=> b!1134301 m!1046681))

(declare-fun m!1046683 () Bool)

(assert (=> bm!49313 m!1046683))

(declare-fun m!1046685 () Bool)

(assert (=> b!1134298 m!1046685))

(declare-fun m!1046687 () Bool)

(assert (=> b!1134298 m!1046687))

(declare-fun m!1046689 () Bool)

(assert (=> start!98372 m!1046689))

(declare-fun m!1046691 () Bool)

(assert (=> start!98372 m!1046691))

(declare-fun m!1046693 () Bool)

(assert (=> bm!49315 m!1046693))

(check-sat (not b!1134316) (not b!1134301) (not mapNonEmpty!44594) (not b!1134317) (not bm!49313) (not bm!49314) (not b!1134297) (not b!1134300) (not b!1134298) (not b!1134289) (not b!1134293) (not b!1134312) (not bm!49316) (not b_next!23983) (not b!1134296) (not bm!49315) (not b!1134294) (not bm!49312) (not b!1134309) (not b!1134306) (not b!1134295) (not b!1134314) tp_is_empty!28513 b_and!38795 (not b!1134305) (not b_lambda!19071) (not b!1134299) (not b!1134311) (not start!98372))
(check-sat b_and!38795 (not b_next!23983))

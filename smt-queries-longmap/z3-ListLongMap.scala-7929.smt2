; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98408 () Bool)

(assert start!98408)

(declare-fun b_free!24019 () Bool)

(declare-fun b_next!24019 () Bool)

(assert (=> start!98408 (= b_free!24019 (not b_next!24019))))

(declare-fun tp!84768 () Bool)

(declare-fun b_and!38865 () Bool)

(assert (=> start!98408 (= tp!84768 b_and!38865)))

(declare-datatypes ((V!43193 0))(
  ( (V!43194 (val!14331 Int)) )
))
(declare-fun zeroValue!944 () V!43193)

(declare-fun c!111021 () Bool)

(declare-datatypes ((tuple2!18178 0))(
  ( (tuple2!18179 (_1!9100 (_ BitVec 64)) (_2!9100 V!43193)) )
))
(declare-datatypes ((List!24924 0))(
  ( (Nil!24921) (Cons!24920 (h!26129 tuple2!18178) (t!35926 List!24924)) )
))
(declare-datatypes ((ListLongMap!16147 0))(
  ( (ListLongMap!16148 (toList!8089 List!24924)) )
))
(declare-fun lt!504932 () ListLongMap!16147)

(declare-fun bm!49744 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!504937 () ListLongMap!16147)

(declare-datatypes ((Unit!37059 0))(
  ( (Unit!37060) )
))
(declare-fun call!49752 () Unit!37059)

(declare-fun c!111023 () Bool)

(declare-fun minValue!944 () V!43193)

(declare-fun addStillContains!738 (ListLongMap!16147 (_ BitVec 64) V!43193 (_ BitVec 64)) Unit!37059)

(assert (=> bm!49744 (= call!49752 (addStillContains!738 (ite c!111023 lt!504937 lt!504932) (ite c!111023 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111021 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111023 minValue!944 (ite c!111021 zeroValue!944 minValue!944)) k0!934))))

(declare-fun e!646448 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73882 0))(
  ( (array!73883 (arr!35592 (Array (_ BitVec 32) (_ BitVec 64))) (size!36130 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73882)

(declare-fun b!1135998 () Bool)

(declare-fun arrayContainsKey!0 (array!73882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135998 (= e!646448 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136000 () Bool)

(declare-fun res!758242 () Bool)

(declare-fun e!646454 () Bool)

(assert (=> b!1136000 (=> (not res!758242) (not e!646454))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136000 (= res!758242 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36130 _keys!1208))))))

(declare-fun bm!49745 () Bool)

(declare-fun call!49754 () Unit!37059)

(assert (=> bm!49745 (= call!49754 call!49752)))

(declare-fun b!1136001 () Bool)

(declare-fun e!646446 () Bool)

(declare-fun tp_is_empty!28549 () Bool)

(assert (=> b!1136001 (= e!646446 tp_is_empty!28549)))

(declare-fun bm!49746 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!49749 () ListLongMap!16147)

(declare-datatypes ((ValueCell!13565 0))(
  ( (ValueCellFull!13565 (v!16967 V!43193)) (EmptyCell!13565) )
))
(declare-datatypes ((array!73884 0))(
  ( (array!73885 (arr!35593 (Array (_ BitVec 32) ValueCell!13565)) (size!36131 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73884)

(declare-fun getCurrentListMapNoExtraKeys!4587 (array!73882 array!73884 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 32) Int) ListLongMap!16147)

(assert (=> bm!49746 (= call!49749 (getCurrentListMapNoExtraKeys!4587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136002 () Bool)

(declare-fun e!646443 () Unit!37059)

(declare-fun e!646444 () Unit!37059)

(assert (=> b!1136002 (= e!646443 e!646444)))

(declare-fun lt!504933 () Bool)

(assert (=> b!1136002 (= c!111021 (and (not lt!504933) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1136003 () Bool)

(declare-fun call!49747 () Bool)

(assert (=> b!1136003 call!49747))

(declare-fun lt!504939 () Unit!37059)

(assert (=> b!1136003 (= lt!504939 call!49754)))

(assert (=> b!1136003 (= e!646444 lt!504939)))

(declare-fun b!1136004 () Bool)

(declare-fun lt!504927 () Unit!37059)

(assert (=> b!1136004 (= e!646443 lt!504927)))

(declare-fun lt!504936 () Unit!37059)

(assert (=> b!1136004 (= lt!504936 (addStillContains!738 lt!504932 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!49750 () ListLongMap!16147)

(assert (=> b!1136004 (= lt!504937 call!49750)))

(declare-fun call!49748 () Bool)

(assert (=> b!1136004 call!49748))

(assert (=> b!1136004 (= lt!504927 call!49752)))

(declare-fun contains!6561 (ListLongMap!16147 (_ BitVec 64)) Bool)

(declare-fun +!3521 (ListLongMap!16147 tuple2!18178) ListLongMap!16147)

(assert (=> b!1136004 (contains!6561 (+!3521 lt!504937 (tuple2!18179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1136005 () Bool)

(declare-fun res!758238 () Bool)

(assert (=> b!1136005 (=> (not res!758238) (not e!646454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136005 (= res!758238 (validMask!0 mask!1564))))

(declare-fun b!1136006 () Bool)

(declare-fun e!646442 () Unit!37059)

(declare-fun lt!504928 () Unit!37059)

(assert (=> b!1136006 (= e!646442 lt!504928)))

(assert (=> b!1136006 (= lt!504928 call!49754)))

(assert (=> b!1136006 call!49747))

(declare-fun mapNonEmpty!44648 () Bool)

(declare-fun mapRes!44648 () Bool)

(declare-fun tp!84767 () Bool)

(assert (=> mapNonEmpty!44648 (= mapRes!44648 (and tp!84767 e!646446))))

(declare-fun mapRest!44648 () (Array (_ BitVec 32) ValueCell!13565))

(declare-fun mapKey!44648 () (_ BitVec 32))

(declare-fun mapValue!44648 () ValueCell!13565)

(assert (=> mapNonEmpty!44648 (= (arr!35593 _values!996) (store mapRest!44648 mapKey!44648 mapValue!44648))))

(declare-fun b!1136007 () Bool)

(declare-fun e!646455 () Bool)

(declare-fun e!646451 () Bool)

(assert (=> b!1136007 (= e!646455 e!646451)))

(declare-fun res!758248 () Bool)

(assert (=> b!1136007 (=> res!758248 e!646451)))

(assert (=> b!1136007 (= res!758248 (not (contains!6561 lt!504932 k0!934)))))

(assert (=> b!1136007 (= lt!504932 (getCurrentListMapNoExtraKeys!4587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136008 () Bool)

(declare-fun e!646449 () Bool)

(declare-fun e!646457 () Bool)

(assert (=> b!1136008 (= e!646449 (not e!646457))))

(declare-fun res!758243 () Bool)

(assert (=> b!1136008 (=> res!758243 e!646457)))

(assert (=> b!1136008 (= res!758243 (bvsgt from!1455 i!673))))

(assert (=> b!1136008 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504924 () Unit!37059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73882 (_ BitVec 64) (_ BitVec 32)) Unit!37059)

(assert (=> b!1136008 (= lt!504924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1136009 () Bool)

(declare-fun e!646456 () Bool)

(assert (=> b!1136009 (= e!646456 e!646455)))

(declare-fun res!758241 () Bool)

(assert (=> b!1136009 (=> res!758241 e!646455)))

(assert (=> b!1136009 (= res!758241 (not (= (select (arr!35592 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646458 () Bool)

(assert (=> b!1136009 e!646458))

(declare-fun c!111020 () Bool)

(assert (=> b!1136009 (= c!111020 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504925 () Unit!37059)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!470 (array!73882 array!73884 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37059)

(assert (=> b!1136009 (= lt!504925 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135999 () Bool)

(declare-fun c!111022 () Bool)

(assert (=> b!1135999 (= c!111022 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504933))))

(assert (=> b!1135999 (= e!646444 e!646442)))

(declare-fun res!758244 () Bool)

(assert (=> start!98408 (=> (not res!758244) (not e!646454))))

(assert (=> start!98408 (= res!758244 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36130 _keys!1208))))))

(assert (=> start!98408 e!646454))

(assert (=> start!98408 tp_is_empty!28549))

(declare-fun array_inv!27368 (array!73882) Bool)

(assert (=> start!98408 (array_inv!27368 _keys!1208)))

(assert (=> start!98408 true))

(assert (=> start!98408 tp!84768))

(declare-fun e!646450 () Bool)

(declare-fun array_inv!27369 (array!73884) Bool)

(assert (=> start!98408 (and (array_inv!27369 _values!996) e!646450)))

(declare-fun b!1136010 () Bool)

(assert (=> b!1136010 (= e!646457 e!646456)))

(declare-fun res!758247 () Bool)

(assert (=> b!1136010 (=> res!758247 e!646456)))

(assert (=> b!1136010 (= res!758247 (not (= from!1455 i!673)))))

(declare-fun lt!504938 () array!73882)

(declare-fun lt!504930 () ListLongMap!16147)

(declare-fun lt!504923 () array!73884)

(assert (=> b!1136010 (= lt!504930 (getCurrentListMapNoExtraKeys!4587 lt!504938 lt!504923 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2581 (Int (_ BitVec 64)) V!43193)

(assert (=> b!1136010 (= lt!504923 (array!73885 (store (arr!35593 _values!996) i!673 (ValueCellFull!13565 (dynLambda!2581 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36131 _values!996)))))

(declare-fun lt!504926 () ListLongMap!16147)

(assert (=> b!1136010 (= lt!504926 (getCurrentListMapNoExtraKeys!4587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136011 () Bool)

(declare-fun e!646452 () Bool)

(assert (=> b!1136011 (= e!646452 true)))

(declare-fun lt!504934 () Bool)

(declare-datatypes ((List!24925 0))(
  ( (Nil!24922) (Cons!24921 (h!26130 (_ BitVec 64)) (t!35927 List!24925)) )
))
(declare-fun contains!6562 (List!24925 (_ BitVec 64)) Bool)

(assert (=> b!1136011 (= lt!504934 (contains!6562 Nil!24922 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136012 () Bool)

(declare-fun e!646453 () Bool)

(assert (=> b!1136012 (= e!646450 (and e!646453 mapRes!44648))))

(declare-fun condMapEmpty!44648 () Bool)

(declare-fun mapDefault!44648 () ValueCell!13565)

(assert (=> b!1136012 (= condMapEmpty!44648 (= (arr!35593 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13565)) mapDefault!44648)))))

(declare-fun b!1136013 () Bool)

(assert (=> b!1136013 (= e!646453 tp_is_empty!28549)))

(declare-fun bm!49747 () Bool)

(assert (=> bm!49747 (= call!49750 (+!3521 lt!504932 (ite (or c!111023 c!111021) (tuple2!18179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1136014 () Bool)

(declare-fun res!758245 () Bool)

(assert (=> b!1136014 (=> (not res!758245) (not e!646454))))

(assert (=> b!1136014 (= res!758245 (= (select (arr!35592 _keys!1208) i!673) k0!934))))

(declare-fun b!1136015 () Bool)

(declare-fun call!49751 () ListLongMap!16147)

(assert (=> b!1136015 (= e!646458 (= call!49751 call!49749))))

(declare-fun b!1136016 () Bool)

(assert (=> b!1136016 (= e!646451 e!646452)))

(declare-fun res!758232 () Bool)

(assert (=> b!1136016 (=> res!758232 e!646452)))

(assert (=> b!1136016 (= res!758232 (or (bvsge (size!36130 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36130 _keys!1208)) (bvsge from!1455 (size!36130 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!73882 (_ BitVec 32) List!24925) Bool)

(assert (=> b!1136016 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24922)))

(declare-fun lt!504931 () Unit!37059)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73882 (_ BitVec 32) (_ BitVec 32)) Unit!37059)

(assert (=> b!1136016 (= lt!504931 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646445 () Bool)

(assert (=> b!1136016 e!646445))

(declare-fun res!758249 () Bool)

(assert (=> b!1136016 (=> (not res!758249) (not e!646445))))

(assert (=> b!1136016 (= res!758249 e!646448)))

(declare-fun c!111019 () Bool)

(assert (=> b!1136016 (= c!111019 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504929 () Unit!37059)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!351 (array!73882 array!73884 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 64) (_ BitVec 32) Int) Unit!37059)

(assert (=> b!1136016 (= lt!504929 (lemmaListMapContainsThenArrayContainsFrom!351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504935 () Unit!37059)

(assert (=> b!1136016 (= lt!504935 e!646443)))

(assert (=> b!1136016 (= c!111023 (and (not lt!504933) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136016 (= lt!504933 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1136017 () Bool)

(declare-fun -!1186 (ListLongMap!16147 (_ BitVec 64)) ListLongMap!16147)

(assert (=> b!1136017 (= e!646458 (= call!49751 (-!1186 call!49749 k0!934)))))

(declare-fun b!1136018 () Bool)

(declare-fun res!758234 () Bool)

(assert (=> b!1136018 (=> (not res!758234) (not e!646454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73882 (_ BitVec 32)) Bool)

(assert (=> b!1136018 (= res!758234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!49748 () Bool)

(assert (=> bm!49748 (= call!49747 call!49748)))

(declare-fun b!1136019 () Bool)

(declare-fun res!758237 () Bool)

(assert (=> b!1136019 (=> (not res!758237) (not e!646454))))

(assert (=> b!1136019 (= res!758237 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24922))))

(declare-fun b!1136020 () Bool)

(declare-fun res!758233 () Bool)

(assert (=> b!1136020 (=> (not res!758233) (not e!646449))))

(assert (=> b!1136020 (= res!758233 (arrayNoDuplicates!0 lt!504938 #b00000000000000000000000000000000 Nil!24922))))

(declare-fun b!1136021 () Bool)

(declare-fun res!758239 () Bool)

(assert (=> b!1136021 (=> (not res!758239) (not e!646454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136021 (= res!758239 (validKeyInArray!0 k0!934))))

(declare-fun bm!49749 () Bool)

(declare-fun call!49753 () ListLongMap!16147)

(assert (=> bm!49749 (= call!49748 (contains!6561 (ite c!111023 lt!504937 call!49753) k0!934))))

(declare-fun b!1136022 () Bool)

(declare-fun Unit!37061 () Unit!37059)

(assert (=> b!1136022 (= e!646442 Unit!37061)))

(declare-fun b!1136023 () Bool)

(declare-fun res!758240 () Bool)

(assert (=> b!1136023 (=> res!758240 e!646452)))

(assert (=> b!1136023 (= res!758240 (contains!6562 Nil!24922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136024 () Bool)

(assert (=> b!1136024 (= e!646448 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504933) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136025 () Bool)

(assert (=> b!1136025 (= e!646445 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136026 () Bool)

(declare-fun res!758246 () Bool)

(assert (=> b!1136026 (=> (not res!758246) (not e!646454))))

(assert (=> b!1136026 (= res!758246 (and (= (size!36131 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36130 _keys!1208) (size!36131 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49750 () Bool)

(assert (=> bm!49750 (= call!49753 call!49750)))

(declare-fun mapIsEmpty!44648 () Bool)

(assert (=> mapIsEmpty!44648 mapRes!44648))

(declare-fun bm!49751 () Bool)

(assert (=> bm!49751 (= call!49751 (getCurrentListMapNoExtraKeys!4587 lt!504938 lt!504923 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136027 () Bool)

(declare-fun res!758235 () Bool)

(assert (=> b!1136027 (=> res!758235 e!646452)))

(declare-fun noDuplicate!1615 (List!24925) Bool)

(assert (=> b!1136027 (= res!758235 (not (noDuplicate!1615 Nil!24922)))))

(declare-fun b!1136028 () Bool)

(assert (=> b!1136028 (= e!646454 e!646449)))

(declare-fun res!758236 () Bool)

(assert (=> b!1136028 (=> (not res!758236) (not e!646449))))

(assert (=> b!1136028 (= res!758236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504938 mask!1564))))

(assert (=> b!1136028 (= lt!504938 (array!73883 (store (arr!35592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36130 _keys!1208)))))

(assert (= (and start!98408 res!758244) b!1136005))

(assert (= (and b!1136005 res!758238) b!1136026))

(assert (= (and b!1136026 res!758246) b!1136018))

(assert (= (and b!1136018 res!758234) b!1136019))

(assert (= (and b!1136019 res!758237) b!1136000))

(assert (= (and b!1136000 res!758242) b!1136021))

(assert (= (and b!1136021 res!758239) b!1136014))

(assert (= (and b!1136014 res!758245) b!1136028))

(assert (= (and b!1136028 res!758236) b!1136020))

(assert (= (and b!1136020 res!758233) b!1136008))

(assert (= (and b!1136008 (not res!758243)) b!1136010))

(assert (= (and b!1136010 (not res!758247)) b!1136009))

(assert (= (and b!1136009 c!111020) b!1136017))

(assert (= (and b!1136009 (not c!111020)) b!1136015))

(assert (= (or b!1136017 b!1136015) bm!49746))

(assert (= (or b!1136017 b!1136015) bm!49751))

(assert (= (and b!1136009 (not res!758241)) b!1136007))

(assert (= (and b!1136007 (not res!758248)) b!1136016))

(assert (= (and b!1136016 c!111023) b!1136004))

(assert (= (and b!1136016 (not c!111023)) b!1136002))

(assert (= (and b!1136002 c!111021) b!1136003))

(assert (= (and b!1136002 (not c!111021)) b!1135999))

(assert (= (and b!1135999 c!111022) b!1136006))

(assert (= (and b!1135999 (not c!111022)) b!1136022))

(assert (= (or b!1136003 b!1136006) bm!49745))

(assert (= (or b!1136003 b!1136006) bm!49750))

(assert (= (or b!1136003 b!1136006) bm!49748))

(assert (= (or b!1136004 bm!49748) bm!49749))

(assert (= (or b!1136004 bm!49745) bm!49744))

(assert (= (or b!1136004 bm!49750) bm!49747))

(assert (= (and b!1136016 c!111019) b!1135998))

(assert (= (and b!1136016 (not c!111019)) b!1136024))

(assert (= (and b!1136016 res!758249) b!1136025))

(assert (= (and b!1136016 (not res!758232)) b!1136027))

(assert (= (and b!1136027 (not res!758235)) b!1136023))

(assert (= (and b!1136023 (not res!758240)) b!1136011))

(assert (= (and b!1136012 condMapEmpty!44648) mapIsEmpty!44648))

(assert (= (and b!1136012 (not condMapEmpty!44648)) mapNonEmpty!44648))

(get-info :version)

(assert (= (and mapNonEmpty!44648 ((_ is ValueCellFull!13565) mapValue!44648)) b!1136001))

(assert (= (and b!1136012 ((_ is ValueCellFull!13565) mapDefault!44648)) b!1136013))

(assert (= start!98408 b!1136012))

(declare-fun b_lambda!19107 () Bool)

(assert (=> (not b_lambda!19107) (not b!1136010)))

(declare-fun t!35925 () Bool)

(declare-fun tb!8823 () Bool)

(assert (=> (and start!98408 (= defaultEntry!1004 defaultEntry!1004) t!35925) tb!8823))

(declare-fun result!18219 () Bool)

(assert (=> tb!8823 (= result!18219 tp_is_empty!28549)))

(assert (=> b!1136010 t!35925))

(declare-fun b_and!38867 () Bool)

(assert (= b_and!38865 (and (=> t!35925 result!18219) b_and!38867)))

(declare-fun m!1047921 () Bool)

(assert (=> b!1136004 m!1047921))

(declare-fun m!1047923 () Bool)

(assert (=> b!1136004 m!1047923))

(assert (=> b!1136004 m!1047923))

(declare-fun m!1047925 () Bool)

(assert (=> b!1136004 m!1047925))

(declare-fun m!1047927 () Bool)

(assert (=> bm!49744 m!1047927))

(declare-fun m!1047929 () Bool)

(assert (=> b!1136007 m!1047929))

(declare-fun m!1047931 () Bool)

(assert (=> b!1136007 m!1047931))

(declare-fun m!1047933 () Bool)

(assert (=> b!1136008 m!1047933))

(declare-fun m!1047935 () Bool)

(assert (=> b!1136008 m!1047935))

(declare-fun m!1047937 () Bool)

(assert (=> b!1136021 m!1047937))

(declare-fun m!1047939 () Bool)

(assert (=> b!1136028 m!1047939))

(declare-fun m!1047941 () Bool)

(assert (=> b!1136028 m!1047941))

(declare-fun m!1047943 () Bool)

(assert (=> bm!49749 m!1047943))

(declare-fun m!1047945 () Bool)

(assert (=> b!1136009 m!1047945))

(declare-fun m!1047947 () Bool)

(assert (=> b!1136009 m!1047947))

(declare-fun m!1047949 () Bool)

(assert (=> b!1136010 m!1047949))

(declare-fun m!1047951 () Bool)

(assert (=> b!1136010 m!1047951))

(declare-fun m!1047953 () Bool)

(assert (=> b!1136010 m!1047953))

(declare-fun m!1047955 () Bool)

(assert (=> b!1136010 m!1047955))

(declare-fun m!1047957 () Bool)

(assert (=> b!1136014 m!1047957))

(declare-fun m!1047959 () Bool)

(assert (=> b!1136019 m!1047959))

(declare-fun m!1047961 () Bool)

(assert (=> b!1136011 m!1047961))

(declare-fun m!1047963 () Bool)

(assert (=> b!1135998 m!1047963))

(declare-fun m!1047965 () Bool)

(assert (=> start!98408 m!1047965))

(declare-fun m!1047967 () Bool)

(assert (=> start!98408 m!1047967))

(declare-fun m!1047969 () Bool)

(assert (=> b!1136017 m!1047969))

(declare-fun m!1047971 () Bool)

(assert (=> bm!49751 m!1047971))

(declare-fun m!1047973 () Bool)

(assert (=> b!1136027 m!1047973))

(declare-fun m!1047975 () Bool)

(assert (=> mapNonEmpty!44648 m!1047975))

(declare-fun m!1047977 () Bool)

(assert (=> b!1136018 m!1047977))

(declare-fun m!1047979 () Bool)

(assert (=> b!1136023 m!1047979))

(declare-fun m!1047981 () Bool)

(assert (=> b!1136020 m!1047981))

(declare-fun m!1047983 () Bool)

(assert (=> bm!49747 m!1047983))

(assert (=> bm!49746 m!1047931))

(declare-fun m!1047985 () Bool)

(assert (=> b!1136016 m!1047985))

(declare-fun m!1047987 () Bool)

(assert (=> b!1136016 m!1047987))

(declare-fun m!1047989 () Bool)

(assert (=> b!1136016 m!1047989))

(assert (=> b!1136025 m!1047963))

(declare-fun m!1047991 () Bool)

(assert (=> b!1136005 m!1047991))

(check-sat (not b!1136020) (not b!1136017) (not b!1136009) tp_is_empty!28549 (not b!1136005) (not b!1136018) (not start!98408) (not b_next!24019) (not b!1136023) (not bm!49744) (not b!1136027) (not b!1136011) b_and!38867 (not bm!49751) (not b!1136028) (not bm!49749) (not b!1136007) (not b!1135998) (not bm!49747) (not b!1136008) (not mapNonEmpty!44648) (not b!1136016) (not bm!49746) (not b!1136025) (not b!1136004) (not b!1136010) (not b!1136019) (not b!1136021) (not b_lambda!19107))
(check-sat b_and!38867 (not b_next!24019))

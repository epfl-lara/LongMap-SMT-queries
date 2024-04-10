; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98434 () Bool)

(assert start!98434)

(declare-fun b_free!24039 () Bool)

(declare-fun b_next!24039 () Bool)

(assert (=> start!98434 (= b_free!24039 (not b_next!24039))))

(declare-fun tp!84828 () Bool)

(declare-fun b_and!38927 () Bool)

(assert (=> start!98434 (= tp!84828 b_and!38927)))

(declare-fun b!1137044 () Bool)

(declare-datatypes ((Unit!37241 0))(
  ( (Unit!37242) )
))
(declare-fun e!647023 () Unit!37241)

(declare-fun Unit!37243 () Unit!37241)

(assert (=> b!1137044 (= e!647023 Unit!37243)))

(declare-fun b!1137045 () Bool)

(declare-fun e!647027 () Unit!37241)

(declare-fun Unit!37244 () Unit!37241)

(assert (=> b!1137045 (= e!647027 Unit!37244)))

(declare-fun b!1137046 () Bool)

(declare-fun e!647030 () Unit!37241)

(assert (=> b!1137046 (= e!647030 e!647027)))

(declare-fun c!111212 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!505655 () Bool)

(assert (=> b!1137046 (= c!111212 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505655))))

(declare-fun bm!50007 () Bool)

(declare-fun c!111214 () Bool)

(declare-datatypes ((V!43219 0))(
  ( (V!43220 (val!14341 Int)) )
))
(declare-datatypes ((tuple2!18110 0))(
  ( (tuple2!18111 (_1!9066 (_ BitVec 64)) (_2!9066 V!43219)) )
))
(declare-datatypes ((List!24868 0))(
  ( (Nil!24865) (Cons!24864 (h!26073 tuple2!18110) (t!35899 List!24868)) )
))
(declare-datatypes ((ListLongMap!16079 0))(
  ( (ListLongMap!16080 (toList!8055 List!24868)) )
))
(declare-fun call!50015 () ListLongMap!16079)

(declare-fun lt!505652 () ListLongMap!16079)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!50011 () Bool)

(declare-fun contains!6594 (ListLongMap!16079 (_ BitVec 64)) Bool)

(assert (=> bm!50007 (= call!50011 (contains!6594 (ite c!111214 lt!505652 call!50015) k0!934))))

(declare-fun mapNonEmpty!44678 () Bool)

(declare-fun mapRes!44678 () Bool)

(declare-fun tp!84827 () Bool)

(declare-fun e!647022 () Bool)

(assert (=> mapNonEmpty!44678 (= mapRes!44678 (and tp!84827 e!647022))))

(declare-fun mapKey!44678 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13575 0))(
  ( (ValueCellFull!13575 (v!16978 V!43219)) (EmptyCell!13575) )
))
(declare-fun mapRest!44678 () (Array (_ BitVec 32) ValueCell!13575))

(declare-datatypes ((array!73999 0))(
  ( (array!74000 (arr!35650 (Array (_ BitVec 32) ValueCell!13575)) (size!36186 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73999)

(declare-fun mapValue!44678 () ValueCell!13575)

(assert (=> mapNonEmpty!44678 (= (arr!35650 _values!996) (store mapRest!44678 mapKey!44678 mapValue!44678))))

(declare-fun b!1137047 () Bool)

(declare-fun call!50012 () ListLongMap!16079)

(assert (=> b!1137047 (contains!6594 call!50012 k0!934)))

(declare-fun lt!505650 () Unit!37241)

(declare-fun call!50010 () Unit!37241)

(assert (=> b!1137047 (= lt!505650 call!50010)))

(assert (=> b!1137047 call!50011))

(declare-fun lt!505653 () ListLongMap!16079)

(declare-fun zeroValue!944 () V!43219)

(declare-fun +!3491 (ListLongMap!16079 tuple2!18110) ListLongMap!16079)

(assert (=> b!1137047 (= lt!505652 (+!3491 lt!505653 (tuple2!18111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!505644 () Unit!37241)

(declare-fun addStillContains!751 (ListLongMap!16079 (_ BitVec 64) V!43219 (_ BitVec 64)) Unit!37241)

(assert (=> b!1137047 (= lt!505644 (addStillContains!751 lt!505653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!647026 () Unit!37241)

(assert (=> b!1137047 (= e!647026 lt!505650)))

(declare-fun b!1137048 () Bool)

(declare-fun res!758795 () Bool)

(declare-fun e!647031 () Bool)

(assert (=> b!1137048 (=> (not res!758795) (not e!647031))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74001 0))(
  ( (array!74002 (arr!35651 (Array (_ BitVec 32) (_ BitVec 64))) (size!36187 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74001)

(assert (=> b!1137048 (= res!758795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36187 _keys!1208))))))

(declare-fun b!1137049 () Bool)

(declare-fun tp_is_empty!28569 () Bool)

(assert (=> b!1137049 (= e!647022 tp_is_empty!28569)))

(declare-fun b!1137050 () Bool)

(declare-fun e!647018 () Bool)

(assert (=> b!1137050 (= e!647018 tp_is_empty!28569)))

(declare-fun b!1137051 () Bool)

(declare-fun e!647020 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137051 (= e!647020 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!647024 () Bool)

(declare-fun b!1137052 () Bool)

(assert (=> b!1137052 (= e!647024 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137053 () Bool)

(declare-fun e!647019 () Bool)

(assert (=> b!1137053 (= e!647031 e!647019)))

(declare-fun res!758785 () Bool)

(assert (=> b!1137053 (=> (not res!758785) (not e!647019))))

(declare-fun lt!505651 () array!74001)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74001 (_ BitVec 32)) Bool)

(assert (=> b!1137053 (= res!758785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505651 mask!1564))))

(assert (=> b!1137053 (= lt!505651 (array!74002 (store (arr!35651 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36187 _keys!1208)))))

(declare-fun res!758784 () Bool)

(assert (=> start!98434 (=> (not res!758784) (not e!647031))))

(assert (=> start!98434 (= res!758784 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36187 _keys!1208))))))

(assert (=> start!98434 e!647031))

(assert (=> start!98434 tp_is_empty!28569))

(declare-fun array_inv!27336 (array!74001) Bool)

(assert (=> start!98434 (array_inv!27336 _keys!1208)))

(assert (=> start!98434 true))

(assert (=> start!98434 tp!84828))

(declare-fun e!647029 () Bool)

(declare-fun array_inv!27337 (array!73999) Bool)

(assert (=> start!98434 (and (array_inv!27337 _values!996) e!647029)))

(declare-fun b!1137054 () Bool)

(declare-fun call!50016 () ListLongMap!16079)

(declare-fun e!647021 () Bool)

(declare-fun call!50013 () ListLongMap!16079)

(declare-fun -!1214 (ListLongMap!16079 (_ BitVec 64)) ListLongMap!16079)

(assert (=> b!1137054 (= e!647021 (= call!50013 (-!1214 call!50016 k0!934)))))

(declare-fun b!1137055 () Bool)

(declare-fun lt!505654 () Unit!37241)

(assert (=> b!1137055 (= e!647030 lt!505654)))

(declare-fun call!50017 () Unit!37241)

(assert (=> b!1137055 (= lt!505654 call!50017)))

(declare-fun call!50014 () Bool)

(assert (=> b!1137055 call!50014))

(declare-fun b!1137056 () Bool)

(assert (=> b!1137056 (= e!647021 (= call!50013 call!50016))))

(declare-fun b!1137057 () Bool)

(declare-fun e!647017 () Bool)

(declare-fun e!647016 () Bool)

(assert (=> b!1137057 (= e!647017 e!647016)))

(declare-fun res!758789 () Bool)

(assert (=> b!1137057 (=> res!758789 e!647016)))

(assert (=> b!1137057 (= res!758789 (not (= from!1455 i!673)))))

(declare-fun lt!505656 () ListLongMap!16079)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!505642 () array!73999)

(declare-fun minValue!944 () V!43219)

(declare-fun getCurrentListMapNoExtraKeys!4539 (array!74001 array!73999 (_ BitVec 32) (_ BitVec 32) V!43219 V!43219 (_ BitVec 32) Int) ListLongMap!16079)

(assert (=> b!1137057 (= lt!505656 (getCurrentListMapNoExtraKeys!4539 lt!505651 lt!505642 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2595 (Int (_ BitVec 64)) V!43219)

(assert (=> b!1137057 (= lt!505642 (array!74000 (store (arr!35650 _values!996) i!673 (ValueCellFull!13575 (dynLambda!2595 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36186 _values!996)))))

(declare-fun lt!505639 () ListLongMap!16079)

(assert (=> b!1137057 (= lt!505639 (getCurrentListMapNoExtraKeys!4539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137058 () Bool)

(declare-fun res!758787 () Bool)

(assert (=> b!1137058 (=> (not res!758787) (not e!647031))))

(assert (=> b!1137058 (= res!758787 (= (select (arr!35651 _keys!1208) i!673) k0!934))))

(declare-fun bm!50008 () Bool)

(declare-fun c!111213 () Bool)

(assert (=> bm!50008 (= call!50012 (+!3491 (ite c!111214 lt!505652 lt!505653) (ite c!111214 (tuple2!18111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111213 (tuple2!18111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1137059 () Bool)

(declare-fun res!758791 () Bool)

(assert (=> b!1137059 (=> (not res!758791) (not e!647031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137059 (= res!758791 (validKeyInArray!0 k0!934))))

(declare-fun b!1137060 () Bool)

(declare-fun e!647025 () Bool)

(assert (=> b!1137060 (= e!647016 e!647025)))

(declare-fun res!758788 () Bool)

(assert (=> b!1137060 (=> res!758788 e!647025)))

(assert (=> b!1137060 (= res!758788 (not (= (select (arr!35651 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137060 e!647021))

(declare-fun c!111210 () Bool)

(assert (=> b!1137060 (= c!111210 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505646 () Unit!37241)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!460 (array!74001 array!73999 (_ BitVec 32) (_ BitVec 32) V!43219 V!43219 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37241)

(assert (=> b!1137060 (= lt!505646 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!460 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137061 () Bool)

(assert (=> b!1137061 call!50014))

(declare-fun lt!505640 () Unit!37241)

(assert (=> b!1137061 (= lt!505640 call!50017)))

(assert (=> b!1137061 (= e!647027 lt!505640)))

(declare-fun b!1137062 () Bool)

(assert (=> b!1137062 (= e!647019 (not e!647017))))

(declare-fun res!758794 () Bool)

(assert (=> b!1137062 (=> res!758794 e!647017)))

(assert (=> b!1137062 (= res!758794 (bvsgt from!1455 i!673))))

(assert (=> b!1137062 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505641 () Unit!37241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74001 (_ BitVec 64) (_ BitVec 32)) Unit!37241)

(assert (=> b!1137062 (= lt!505641 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44678 () Bool)

(assert (=> mapIsEmpty!44678 mapRes!44678))

(declare-fun b!1137063 () Bool)

(assert (=> b!1137063 (= e!647025 true)))

(declare-fun lt!505645 () Unit!37241)

(assert (=> b!1137063 (= lt!505645 e!647023)))

(declare-fun c!111211 () Bool)

(assert (=> b!1137063 (= c!111211 (contains!6594 lt!505653 k0!934))))

(assert (=> b!1137063 (= lt!505653 (getCurrentListMapNoExtraKeys!4539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137064 () Bool)

(declare-fun res!758783 () Bool)

(assert (=> b!1137064 (=> (not res!758783) (not e!647031))))

(assert (=> b!1137064 (= res!758783 (and (= (size!36186 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36187 _keys!1208) (size!36186 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50009 () Bool)

(assert (=> bm!50009 (= call!50016 (getCurrentListMapNoExtraKeys!4539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137065 () Bool)

(assert (=> b!1137065 (= e!647029 (and e!647018 mapRes!44678))))

(declare-fun condMapEmpty!44678 () Bool)

(declare-fun mapDefault!44678 () ValueCell!13575)

(assert (=> b!1137065 (= condMapEmpty!44678 (= (arr!35650 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13575)) mapDefault!44678)))))

(declare-fun b!1137066 () Bool)

(declare-fun res!758790 () Bool)

(assert (=> b!1137066 (=> (not res!758790) (not e!647031))))

(assert (=> b!1137066 (= res!758790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137067 () Bool)

(declare-fun res!758782 () Bool)

(assert (=> b!1137067 (=> (not res!758782) (not e!647031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137067 (= res!758782 (validMask!0 mask!1564))))

(declare-fun b!1137068 () Bool)

(assert (=> b!1137068 (= c!111213 (and (not lt!505655) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1137068 (= e!647026 e!647030)))

(declare-fun b!1137069 () Bool)

(declare-fun Unit!37245 () Unit!37241)

(assert (=> b!1137069 (= e!647023 Unit!37245)))

(assert (=> b!1137069 (= lt!505655 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137069 (= c!111214 (and (not lt!505655) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505647 () Unit!37241)

(assert (=> b!1137069 (= lt!505647 e!647026)))

(declare-fun lt!505648 () Unit!37241)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!354 (array!74001 array!73999 (_ BitVec 32) (_ BitVec 32) V!43219 V!43219 (_ BitVec 64) (_ BitVec 32) Int) Unit!37241)

(assert (=> b!1137069 (= lt!505648 (lemmaListMapContainsThenArrayContainsFrom!354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111209 () Bool)

(assert (=> b!1137069 (= c!111209 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758793 () Bool)

(assert (=> b!1137069 (= res!758793 e!647020)))

(assert (=> b!1137069 (=> (not res!758793) (not e!647024))))

(assert (=> b!1137069 e!647024))

(declare-fun lt!505643 () Unit!37241)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74001 (_ BitVec 32) (_ BitVec 32)) Unit!37241)

(assert (=> b!1137069 (= lt!505643 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24869 0))(
  ( (Nil!24866) (Cons!24865 (h!26074 (_ BitVec 64)) (t!35900 List!24869)) )
))
(declare-fun arrayNoDuplicates!0 (array!74001 (_ BitVec 32) List!24869) Bool)

(assert (=> b!1137069 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24866)))

(declare-fun lt!505649 () Unit!37241)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74001 (_ BitVec 64) (_ BitVec 32) List!24869) Unit!37241)

(assert (=> b!1137069 (= lt!505649 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24866))))

(assert (=> b!1137069 false))

(declare-fun b!1137070 () Bool)

(assert (=> b!1137070 (= e!647020 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505655) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!50010 () Bool)

(assert (=> bm!50010 (= call!50010 (addStillContains!751 (ite c!111214 lt!505652 lt!505653) (ite c!111214 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111213 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111214 minValue!944 (ite c!111213 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!50011 () Bool)

(assert (=> bm!50011 (= call!50014 call!50011)))

(declare-fun b!1137071 () Bool)

(declare-fun res!758786 () Bool)

(assert (=> b!1137071 (=> (not res!758786) (not e!647031))))

(assert (=> b!1137071 (= res!758786 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24866))))

(declare-fun bm!50012 () Bool)

(assert (=> bm!50012 (= call!50017 call!50010)))

(declare-fun bm!50013 () Bool)

(assert (=> bm!50013 (= call!50013 (getCurrentListMapNoExtraKeys!4539 lt!505651 lt!505642 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137072 () Bool)

(declare-fun res!758792 () Bool)

(assert (=> b!1137072 (=> (not res!758792) (not e!647019))))

(assert (=> b!1137072 (= res!758792 (arrayNoDuplicates!0 lt!505651 #b00000000000000000000000000000000 Nil!24866))))

(declare-fun bm!50014 () Bool)

(assert (=> bm!50014 (= call!50015 call!50012)))

(assert (= (and start!98434 res!758784) b!1137067))

(assert (= (and b!1137067 res!758782) b!1137064))

(assert (= (and b!1137064 res!758783) b!1137066))

(assert (= (and b!1137066 res!758790) b!1137071))

(assert (= (and b!1137071 res!758786) b!1137048))

(assert (= (and b!1137048 res!758795) b!1137059))

(assert (= (and b!1137059 res!758791) b!1137058))

(assert (= (and b!1137058 res!758787) b!1137053))

(assert (= (and b!1137053 res!758785) b!1137072))

(assert (= (and b!1137072 res!758792) b!1137062))

(assert (= (and b!1137062 (not res!758794)) b!1137057))

(assert (= (and b!1137057 (not res!758789)) b!1137060))

(assert (= (and b!1137060 c!111210) b!1137054))

(assert (= (and b!1137060 (not c!111210)) b!1137056))

(assert (= (or b!1137054 b!1137056) bm!50013))

(assert (= (or b!1137054 b!1137056) bm!50009))

(assert (= (and b!1137060 (not res!758788)) b!1137063))

(assert (= (and b!1137063 c!111211) b!1137069))

(assert (= (and b!1137063 (not c!111211)) b!1137044))

(assert (= (and b!1137069 c!111214) b!1137047))

(assert (= (and b!1137069 (not c!111214)) b!1137068))

(assert (= (and b!1137068 c!111213) b!1137055))

(assert (= (and b!1137068 (not c!111213)) b!1137046))

(assert (= (and b!1137046 c!111212) b!1137061))

(assert (= (and b!1137046 (not c!111212)) b!1137045))

(assert (= (or b!1137055 b!1137061) bm!50012))

(assert (= (or b!1137055 b!1137061) bm!50014))

(assert (= (or b!1137055 b!1137061) bm!50011))

(assert (= (or b!1137047 bm!50011) bm!50007))

(assert (= (or b!1137047 bm!50012) bm!50010))

(assert (= (or b!1137047 bm!50014) bm!50008))

(assert (= (and b!1137069 c!111209) b!1137051))

(assert (= (and b!1137069 (not c!111209)) b!1137070))

(assert (= (and b!1137069 res!758793) b!1137052))

(assert (= (and b!1137065 condMapEmpty!44678) mapIsEmpty!44678))

(assert (= (and b!1137065 (not condMapEmpty!44678)) mapNonEmpty!44678))

(get-info :version)

(assert (= (and mapNonEmpty!44678 ((_ is ValueCellFull!13575) mapValue!44678)) b!1137049))

(assert (= (and b!1137065 ((_ is ValueCellFull!13575) mapDefault!44678)) b!1137050))

(assert (= start!98434 b!1137065))

(declare-fun b_lambda!19145 () Bool)

(assert (=> (not b_lambda!19145) (not b!1137057)))

(declare-fun t!35898 () Bool)

(declare-fun tb!8851 () Bool)

(assert (=> (and start!98434 (= defaultEntry!1004 defaultEntry!1004) t!35898) tb!8851))

(declare-fun result!18267 () Bool)

(assert (=> tb!8851 (= result!18267 tp_is_empty!28569)))

(assert (=> b!1137057 t!35898))

(declare-fun b_and!38929 () Bool)

(assert (= b_and!38927 (and (=> t!35898 result!18267) b_and!38929)))

(declare-fun m!1049225 () Bool)

(assert (=> b!1137054 m!1049225))

(declare-fun m!1049227 () Bool)

(assert (=> b!1137062 m!1049227))

(declare-fun m!1049229 () Bool)

(assert (=> b!1137062 m!1049229))

(declare-fun m!1049231 () Bool)

(assert (=> bm!50010 m!1049231))

(declare-fun m!1049233 () Bool)

(assert (=> b!1137058 m!1049233))

(declare-fun m!1049235 () Bool)

(assert (=> b!1137071 m!1049235))

(declare-fun m!1049237 () Bool)

(assert (=> b!1137047 m!1049237))

(declare-fun m!1049239 () Bool)

(assert (=> b!1137047 m!1049239))

(declare-fun m!1049241 () Bool)

(assert (=> b!1137047 m!1049241))

(declare-fun m!1049243 () Bool)

(assert (=> b!1137057 m!1049243))

(declare-fun m!1049245 () Bool)

(assert (=> b!1137057 m!1049245))

(declare-fun m!1049247 () Bool)

(assert (=> b!1137057 m!1049247))

(declare-fun m!1049249 () Bool)

(assert (=> b!1137057 m!1049249))

(declare-fun m!1049251 () Bool)

(assert (=> b!1137052 m!1049251))

(declare-fun m!1049253 () Bool)

(assert (=> b!1137053 m!1049253))

(declare-fun m!1049255 () Bool)

(assert (=> b!1137053 m!1049255))

(declare-fun m!1049257 () Bool)

(assert (=> b!1137059 m!1049257))

(declare-fun m!1049259 () Bool)

(assert (=> bm!50007 m!1049259))

(declare-fun m!1049261 () Bool)

(assert (=> mapNonEmpty!44678 m!1049261))

(declare-fun m!1049263 () Bool)

(assert (=> start!98434 m!1049263))

(declare-fun m!1049265 () Bool)

(assert (=> start!98434 m!1049265))

(declare-fun m!1049267 () Bool)

(assert (=> b!1137072 m!1049267))

(declare-fun m!1049269 () Bool)

(assert (=> b!1137066 m!1049269))

(declare-fun m!1049271 () Bool)

(assert (=> b!1137063 m!1049271))

(declare-fun m!1049273 () Bool)

(assert (=> b!1137063 m!1049273))

(declare-fun m!1049275 () Bool)

(assert (=> b!1137067 m!1049275))

(declare-fun m!1049277 () Bool)

(assert (=> b!1137069 m!1049277))

(declare-fun m!1049279 () Bool)

(assert (=> b!1137069 m!1049279))

(declare-fun m!1049281 () Bool)

(assert (=> b!1137069 m!1049281))

(declare-fun m!1049283 () Bool)

(assert (=> b!1137069 m!1049283))

(declare-fun m!1049285 () Bool)

(assert (=> b!1137060 m!1049285))

(declare-fun m!1049287 () Bool)

(assert (=> b!1137060 m!1049287))

(assert (=> b!1137051 m!1049251))

(declare-fun m!1049289 () Bool)

(assert (=> bm!50013 m!1049289))

(assert (=> bm!50009 m!1049273))

(declare-fun m!1049291 () Bool)

(assert (=> bm!50008 m!1049291))

(check-sat (not b!1137060) (not bm!50010) (not bm!50013) (not b!1137054) (not b!1137063) (not b!1137071) b_and!38929 (not bm!50008) (not b!1137047) (not b!1137062) (not b!1137052) (not b!1137059) (not b!1137051) (not start!98434) (not bm!50009) (not mapNonEmpty!44678) (not b!1137067) (not b!1137053) (not b_lambda!19145) (not b!1137072) (not b!1137069) (not b_next!24039) (not b!1137066) (not b!1137057) tp_is_empty!28569 (not bm!50007))
(check-sat b_and!38929 (not b_next!24039))

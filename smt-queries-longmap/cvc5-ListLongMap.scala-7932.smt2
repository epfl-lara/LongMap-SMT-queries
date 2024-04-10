; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98432 () Bool)

(assert start!98432)

(declare-fun b_free!24037 () Bool)

(declare-fun b_next!24037 () Bool)

(assert (=> start!98432 (= b_free!24037 (not b_next!24037))))

(declare-fun tp!84822 () Bool)

(declare-fun b_and!38923 () Bool)

(assert (=> start!98432 (= tp!84822 b_and!38923)))

(declare-fun b!1136955 () Bool)

(declare-fun res!758752 () Bool)

(declare-fun e!646982 () Bool)

(assert (=> b!1136955 (=> (not res!758752) (not e!646982))))

(declare-datatypes ((array!73995 0))(
  ( (array!73996 (arr!35648 (Array (_ BitVec 32) (_ BitVec 64))) (size!36184 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73995)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43217 0))(
  ( (V!43218 (val!14340 Int)) )
))
(declare-datatypes ((ValueCell!13574 0))(
  ( (ValueCellFull!13574 (v!16977 V!43217)) (EmptyCell!13574) )
))
(declare-datatypes ((array!73997 0))(
  ( (array!73998 (arr!35649 (Array (_ BitVec 32) ValueCell!13574)) (size!36185 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73997)

(assert (=> b!1136955 (= res!758752 (and (= (size!36185 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36184 _keys!1208) (size!36185 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1136956 () Bool)

(declare-datatypes ((Unit!37236 0))(
  ( (Unit!37237) )
))
(declare-fun e!646980 () Unit!37236)

(declare-fun Unit!37238 () Unit!37236)

(assert (=> b!1136956 (= e!646980 Unit!37238)))

(declare-fun lt!505599 () Bool)

(assert (=> b!1136956 (= lt!505599 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111195 () Bool)

(assert (=> b!1136956 (= c!111195 (and (not lt!505599) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505591 () Unit!37236)

(declare-fun e!646968 () Unit!37236)

(assert (=> b!1136956 (= lt!505591 e!646968)))

(declare-fun zeroValue!944 () V!43217)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!505586 () Unit!37236)

(declare-fun minValue!944 () V!43217)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!353 (array!73995 array!73997 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 64) (_ BitVec 32) Int) Unit!37236)

(assert (=> b!1136956 (= lt!505586 (lemmaListMapContainsThenArrayContainsFrom!353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111191 () Bool)

(assert (=> b!1136956 (= c!111191 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758749 () Bool)

(declare-fun e!646976 () Bool)

(assert (=> b!1136956 (= res!758749 e!646976)))

(declare-fun e!646969 () Bool)

(assert (=> b!1136956 (=> (not res!758749) (not e!646969))))

(assert (=> b!1136956 e!646969))

(declare-fun lt!505595 () Unit!37236)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73995 (_ BitVec 32) (_ BitVec 32)) Unit!37236)

(assert (=> b!1136956 (= lt!505595 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24866 0))(
  ( (Nil!24863) (Cons!24862 (h!26071 (_ BitVec 64)) (t!35895 List!24866)) )
))
(declare-fun arrayNoDuplicates!0 (array!73995 (_ BitVec 32) List!24866) Bool)

(assert (=> b!1136956 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24863)))

(declare-fun lt!505598 () Unit!37236)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73995 (_ BitVec 64) (_ BitVec 32) List!24866) Unit!37236)

(assert (=> b!1136956 (= lt!505598 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24863))))

(assert (=> b!1136956 false))

(declare-fun b!1136957 () Bool)

(declare-fun e!646978 () Unit!37236)

(declare-fun Unit!37239 () Unit!37236)

(assert (=> b!1136957 (= e!646978 Unit!37239)))

(declare-fun b!1136958 () Bool)

(declare-fun e!646972 () Bool)

(declare-fun tp_is_empty!28567 () Bool)

(assert (=> b!1136958 (= e!646972 tp_is_empty!28567)))

(declare-fun b!1136959 () Bool)

(declare-fun Unit!37240 () Unit!37236)

(assert (=> b!1136959 (= e!646980 Unit!37240)))

(declare-datatypes ((tuple2!18108 0))(
  ( (tuple2!18109 (_1!9065 (_ BitVec 64)) (_2!9065 V!43217)) )
))
(declare-datatypes ((List!24867 0))(
  ( (Nil!24864) (Cons!24863 (h!26072 tuple2!18108) (t!35896 List!24867)) )
))
(declare-datatypes ((ListLongMap!16077 0))(
  ( (ListLongMap!16078 (toList!8054 List!24867)) )
))
(declare-fun call!49991 () ListLongMap!16077)

(declare-fun lt!505601 () array!73997)

(declare-fun lt!505588 () array!73995)

(declare-fun bm!49983 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4538 (array!73995 array!73997 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 32) Int) ListLongMap!16077)

(assert (=> bm!49983 (= call!49991 (getCurrentListMapNoExtraKeys!4538 lt!505588 lt!505601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!49990 () ListLongMap!16077)

(declare-fun bm!49984 () Bool)

(assert (=> bm!49984 (= call!49990 (getCurrentListMapNoExtraKeys!4538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!49993 () ListLongMap!16077)

(declare-fun c!111194 () Bool)

(declare-fun bm!49985 () Bool)

(declare-fun lt!505590 () ListLongMap!16077)

(declare-fun +!3490 (ListLongMap!16077 tuple2!18108) ListLongMap!16077)

(assert (=> bm!49985 (= call!49993 (+!3490 lt!505590 (ite (or c!111195 c!111194) (tuple2!18109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1136960 () Bool)

(declare-fun call!49986 () Bool)

(assert (=> b!1136960 call!49986))

(declare-fun lt!505589 () Unit!37236)

(declare-fun call!49987 () Unit!37236)

(assert (=> b!1136960 (= lt!505589 call!49987)))

(assert (=> b!1136960 (= e!646978 lt!505589)))

(declare-fun b!1136961 () Bool)

(declare-fun e!646970 () Bool)

(assert (=> b!1136961 (= e!646970 (= call!49991 call!49990))))

(declare-fun b!1136962 () Bool)

(declare-fun e!646974 () Bool)

(declare-fun e!646981 () Bool)

(assert (=> b!1136962 (= e!646974 (not e!646981))))

(declare-fun res!758742 () Bool)

(assert (=> b!1136962 (=> res!758742 e!646981)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136962 (= res!758742 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136962 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505587 () Unit!37236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73995 (_ BitVec 64) (_ BitVec 32)) Unit!37236)

(assert (=> b!1136962 (= lt!505587 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!49986 () Bool)

(declare-fun call!49992 () Unit!37236)

(assert (=> bm!49986 (= call!49987 call!49992)))

(declare-fun b!1136963 () Bool)

(assert (=> b!1136963 (= e!646976 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505599) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49987 () Bool)

(declare-fun call!49988 () ListLongMap!16077)

(assert (=> bm!49987 (= call!49988 call!49993)))

(declare-fun b!1136964 () Bool)

(declare-fun lt!505596 () ListLongMap!16077)

(declare-fun contains!6593 (ListLongMap!16077 (_ BitVec 64)) Bool)

(assert (=> b!1136964 (contains!6593 (+!3490 lt!505596 (tuple2!18109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!505600 () Unit!37236)

(declare-fun addStillContains!750 (ListLongMap!16077 (_ BitVec 64) V!43217 (_ BitVec 64)) Unit!37236)

(assert (=> b!1136964 (= lt!505600 (addStillContains!750 lt!505596 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!49989 () Bool)

(assert (=> b!1136964 call!49989))

(assert (=> b!1136964 (= lt!505596 call!49993)))

(declare-fun lt!505597 () Unit!37236)

(assert (=> b!1136964 (= lt!505597 call!49992)))

(assert (=> b!1136964 (= e!646968 lt!505600)))

(declare-fun res!758746 () Bool)

(assert (=> start!98432 (=> (not res!758746) (not e!646982))))

(assert (=> start!98432 (= res!758746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36184 _keys!1208))))))

(assert (=> start!98432 e!646982))

(assert (=> start!98432 tp_is_empty!28567))

(declare-fun array_inv!27334 (array!73995) Bool)

(assert (=> start!98432 (array_inv!27334 _keys!1208)))

(assert (=> start!98432 true))

(assert (=> start!98432 tp!84822))

(declare-fun e!646979 () Bool)

(declare-fun array_inv!27335 (array!73997) Bool)

(assert (=> start!98432 (and (array_inv!27335 _values!996) e!646979)))

(declare-fun b!1136965 () Bool)

(declare-fun res!758751 () Bool)

(assert (=> b!1136965 (=> (not res!758751) (not e!646982))))

(assert (=> b!1136965 (= res!758751 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24863))))

(declare-fun bm!49988 () Bool)

(assert (=> bm!49988 (= call!49992 (addStillContains!750 lt!505590 (ite (or c!111195 c!111194) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111195 c!111194) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1136966 () Bool)

(declare-fun e!646973 () Bool)

(assert (=> b!1136966 (= e!646973 tp_is_empty!28567)))

(declare-fun b!1136967 () Bool)

(declare-fun mapRes!44675 () Bool)

(assert (=> b!1136967 (= e!646979 (and e!646972 mapRes!44675))))

(declare-fun condMapEmpty!44675 () Bool)

(declare-fun mapDefault!44675 () ValueCell!13574)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98192 () Bool)

(assert start!98192)

(declare-fun b_free!23893 () Bool)

(declare-fun b_next!23893 () Bool)

(assert (=> start!98192 (= b_free!23893 (not b_next!23893))))

(declare-fun tp!84382 () Bool)

(declare-fun b_and!38569 () Bool)

(assert (=> start!98192 (= tp!84382 b_and!38569)))

(declare-fun b!1129916 () Bool)

(declare-fun c!109946 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!501694 () Bool)

(assert (=> b!1129916 (= c!109946 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501694))))

(declare-datatypes ((Unit!37015 0))(
  ( (Unit!37016) )
))
(declare-fun e!643062 () Unit!37015)

(declare-fun e!643049 () Unit!37015)

(assert (=> b!1129916 (= e!643062 e!643049)))

(declare-fun b!1129917 () Bool)

(declare-fun e!643055 () Bool)

(declare-fun e!643050 () Bool)

(assert (=> b!1129917 (= e!643055 e!643050)))

(declare-fun res!755011 () Bool)

(assert (=> b!1129917 (=> (not res!755011) (not e!643050))))

(declare-datatypes ((array!73703 0))(
  ( (array!73704 (arr!35504 (Array (_ BitVec 32) (_ BitVec 64))) (size!36040 (_ BitVec 32))) )
))
(declare-fun lt!501696 () array!73703)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73703 (_ BitVec 32)) Bool)

(assert (=> b!1129917 (= res!755011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501696 mask!1564))))

(declare-fun _keys!1208 () array!73703)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129917 (= lt!501696 (array!73704 (store (arr!35504 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36040 _keys!1208)))))

(declare-fun b!1129918 () Bool)

(declare-fun e!643057 () Bool)

(declare-fun e!643058 () Bool)

(assert (=> b!1129918 (= e!643057 e!643058)))

(declare-fun res!755019 () Bool)

(assert (=> b!1129918 (=> res!755019 e!643058)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1129918 (= res!755019 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43025 0))(
  ( (V!43026 (val!14268 Int)) )
))
(declare-fun zeroValue!944 () V!43025)

(declare-datatypes ((ValueCell!13502 0))(
  ( (ValueCellFull!13502 (v!16901 V!43025)) (EmptyCell!13502) )
))
(declare-datatypes ((array!73705 0))(
  ( (array!73706 (arr!35505 (Array (_ BitVec 32) ValueCell!13502)) (size!36041 (_ BitVec 32))) )
))
(declare-fun lt!501706 () array!73705)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17970 0))(
  ( (tuple2!17971 (_1!8996 (_ BitVec 64)) (_2!8996 V!43025)) )
))
(declare-datatypes ((List!24735 0))(
  ( (Nil!24732) (Cons!24731 (h!25940 tuple2!17970) (t!35620 List!24735)) )
))
(declare-datatypes ((ListLongMap!15939 0))(
  ( (ListLongMap!15940 (toList!7985 List!24735)) )
))
(declare-fun lt!501702 () ListLongMap!15939)

(declare-fun minValue!944 () V!43025)

(declare-fun getCurrentListMapNoExtraKeys!4472 (array!73703 array!73705 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) Int) ListLongMap!15939)

(assert (=> b!1129918 (= lt!501702 (getCurrentListMapNoExtraKeys!4472 lt!501696 lt!501706 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73705)

(declare-fun dynLambda!2549 (Int (_ BitVec 64)) V!43025)

(assert (=> b!1129918 (= lt!501706 (array!73706 (store (arr!35505 _values!996) i!673 (ValueCellFull!13502 (dynLambda!2549 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36041 _values!996)))))

(declare-fun lt!501699 () ListLongMap!15939)

(assert (=> b!1129918 (= lt!501699 (getCurrentListMapNoExtraKeys!4472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129919 () Bool)

(declare-fun res!755020 () Bool)

(assert (=> b!1129919 (=> (not res!755020) (not e!643055))))

(assert (=> b!1129919 (= res!755020 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36040 _keys!1208))))))

(declare-fun b!1129920 () Bool)

(declare-fun e!643051 () Bool)

(assert (=> b!1129920 (= e!643051 true)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!501697 () Bool)

(declare-fun contains!6508 (ListLongMap!15939 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4418 (array!73703 array!73705 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) Int) ListLongMap!15939)

(assert (=> b!1129920 (= lt!501697 (contains!6508 (getCurrentListMap!4418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1129921 () Bool)

(declare-fun res!755013 () Bool)

(assert (=> b!1129921 (=> (not res!755013) (not e!643055))))

(assert (=> b!1129921 (= res!755013 (= (select (arr!35504 _keys!1208) i!673) k!934))))

(declare-fun b!1129922 () Bool)

(declare-fun call!48195 () Bool)

(assert (=> b!1129922 call!48195))

(declare-fun lt!501701 () Unit!37015)

(declare-fun call!48194 () Unit!37015)

(assert (=> b!1129922 (= lt!501701 call!48194)))

(assert (=> b!1129922 (= e!643062 lt!501701)))

(declare-fun b!1129923 () Bool)

(declare-fun lt!501693 () Unit!37015)

(assert (=> b!1129923 (= e!643049 lt!501693)))

(assert (=> b!1129923 (= lt!501693 call!48194)))

(assert (=> b!1129923 call!48195))

(declare-fun b!1129924 () Bool)

(assert (=> b!1129924 (= e!643050 (not e!643057))))

(declare-fun res!755010 () Bool)

(assert (=> b!1129924 (=> res!755010 e!643057)))

(assert (=> b!1129924 (= res!755010 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129924 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501705 () Unit!37015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73703 (_ BitVec 64) (_ BitVec 32)) Unit!37015)

(assert (=> b!1129924 (= lt!501705 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1129925 () Bool)

(declare-fun res!755016 () Bool)

(assert (=> b!1129925 (=> (not res!755016) (not e!643055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129925 (= res!755016 (validMask!0 mask!1564))))

(declare-fun bm!48186 () Bool)

(declare-fun call!48192 () ListLongMap!15939)

(declare-fun call!48190 () ListLongMap!15939)

(assert (=> bm!48186 (= call!48192 call!48190)))

(declare-fun b!1129926 () Bool)

(declare-fun e!643056 () Bool)

(assert (=> b!1129926 (= e!643058 e!643056)))

(declare-fun res!755022 () Bool)

(assert (=> b!1129926 (=> res!755022 e!643056)))

(assert (=> b!1129926 (= res!755022 (not (= (select (arr!35504 _keys!1208) from!1455) k!934)))))

(declare-fun e!643053 () Bool)

(assert (=> b!1129926 e!643053))

(declare-fun c!109945 () Bool)

(assert (=> b!1129926 (= c!109945 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501704 () Unit!37015)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!417 (array!73703 array!73705 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37015)

(assert (=> b!1129926 (= lt!501704 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129928 () Bool)

(declare-fun e!643054 () Unit!37015)

(assert (=> b!1129928 (= e!643054 e!643062)))

(declare-fun c!109947 () Bool)

(assert (=> b!1129928 (= c!109947 (and (not lt!501694) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129929 () Bool)

(declare-fun res!755015 () Bool)

(assert (=> b!1129929 (=> (not res!755015) (not e!643055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129929 (= res!755015 (validKeyInArray!0 k!934))))

(declare-fun b!1129930 () Bool)

(declare-fun e!643048 () Bool)

(declare-fun e!643052 () Bool)

(declare-fun mapRes!44452 () Bool)

(assert (=> b!1129930 (= e!643048 (and e!643052 mapRes!44452))))

(declare-fun condMapEmpty!44452 () Bool)

(declare-fun mapDefault!44452 () ValueCell!13502)


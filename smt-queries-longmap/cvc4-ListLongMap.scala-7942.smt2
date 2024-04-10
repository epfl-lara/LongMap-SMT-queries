; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98496 () Bool)

(assert start!98496)

(declare-fun b_free!24101 () Bool)

(declare-fun b_next!24101 () Bool)

(assert (=> start!98496 (= b_free!24101 (not b_next!24101))))

(declare-fun tp!85013 () Bool)

(declare-fun b_and!39051 () Bool)

(assert (=> start!98496 (= tp!85013 b_and!39051)))

(declare-fun b!1139803 () Bool)

(declare-fun res!760096 () Bool)

(declare-fun e!648505 () Bool)

(assert (=> b!1139803 (=> (not res!760096) (not e!648505))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74121 0))(
  ( (array!74122 (arr!35711 (Array (_ BitVec 32) (_ BitVec 64))) (size!36247 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74121)

(assert (=> b!1139803 (= res!760096 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36247 _keys!1208))))))

(declare-fun b!1139804 () Bool)

(declare-fun e!648509 () Bool)

(declare-fun e!648517 () Bool)

(assert (=> b!1139804 (= e!648509 (not e!648517))))

(declare-fun res!760097 () Bool)

(assert (=> b!1139804 (=> res!760097 e!648517)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139804 (= res!760097 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139804 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37365 0))(
  ( (Unit!37366) )
))
(declare-fun lt!507390 () Unit!37365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74121 (_ BitVec 64) (_ BitVec 32)) Unit!37365)

(assert (=> b!1139804 (= lt!507390 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1139805 () Bool)

(declare-fun e!648510 () Unit!37365)

(declare-fun Unit!37367 () Unit!37365)

(assert (=> b!1139805 (= e!648510 Unit!37367)))

(declare-fun b!1139806 () Bool)

(declare-fun e!648516 () Bool)

(declare-fun e!648506 () Bool)

(assert (=> b!1139806 (= e!648516 e!648506)))

(declare-fun res!760092 () Bool)

(assert (=> b!1139806 (=> res!760092 e!648506)))

(assert (=> b!1139806 (= res!760092 (not (= (select (arr!35711 _keys!1208) from!1455) k!934)))))

(declare-fun e!648514 () Bool)

(assert (=> b!1139806 e!648514))

(declare-fun c!111772 () Bool)

(assert (=> b!1139806 (= c!111772 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43301 0))(
  ( (V!43302 (val!14372 Int)) )
))
(declare-fun zeroValue!944 () V!43301)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!507385 () Unit!37365)

(declare-datatypes ((ValueCell!13606 0))(
  ( (ValueCellFull!13606 (v!17009 V!43301)) (EmptyCell!13606) )
))
(declare-datatypes ((array!74123 0))(
  ( (array!74124 (arr!35712 (Array (_ BitVec 32) ValueCell!13606)) (size!36248 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74123)

(declare-fun minValue!944 () V!43301)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!483 (array!74121 array!74123 (_ BitVec 32) (_ BitVec 32) V!43301 V!43301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37365)

(assert (=> b!1139806 (= lt!507385 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139807 () Bool)

(declare-datatypes ((tuple2!18170 0))(
  ( (tuple2!18171 (_1!9096 (_ BitVec 64)) (_2!9096 V!43301)) )
))
(declare-datatypes ((List!24926 0))(
  ( (Nil!24923) (Cons!24922 (h!26131 tuple2!18170) (t!36019 List!24926)) )
))
(declare-datatypes ((ListLongMap!16139 0))(
  ( (ListLongMap!16140 (toList!8085 List!24926)) )
))
(declare-fun call!50756 () ListLongMap!16139)

(declare-fun contains!6620 (ListLongMap!16139 (_ BitVec 64)) Bool)

(assert (=> b!1139807 (contains!6620 call!50756 k!934)))

(declare-fun lt!507382 () Unit!37365)

(declare-fun call!50760 () Unit!37365)

(assert (=> b!1139807 (= lt!507382 call!50760)))

(declare-fun call!50755 () Bool)

(assert (=> b!1139807 call!50755))

(declare-fun lt!507376 () ListLongMap!16139)

(declare-fun lt!507387 () ListLongMap!16139)

(declare-fun +!3517 (ListLongMap!16139 tuple2!18170) ListLongMap!16139)

(assert (=> b!1139807 (= lt!507376 (+!3517 lt!507387 (tuple2!18171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507381 () Unit!37365)

(declare-fun addStillContains!775 (ListLongMap!16139 (_ BitVec 64) V!43301 (_ BitVec 64)) Unit!37365)

(assert (=> b!1139807 (= lt!507381 (addStillContains!775 lt!507387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!648508 () Unit!37365)

(assert (=> b!1139807 (= e!648508 lt!507382)))

(declare-fun b!1139808 () Bool)

(declare-fun e!648512 () Bool)

(declare-fun e!648511 () Bool)

(declare-fun mapRes!44771 () Bool)

(assert (=> b!1139808 (= e!648512 (and e!648511 mapRes!44771))))

(declare-fun condMapEmpty!44771 () Bool)

(declare-fun mapDefault!44771 () ValueCell!13606)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98462 () Bool)

(assert start!98462)

(declare-fun b_free!24067 () Bool)

(declare-fun b_next!24067 () Bool)

(assert (=> start!98462 (= b_free!24067 (not b_next!24067))))

(declare-fun tp!84911 () Bool)

(declare-fun b_and!38983 () Bool)

(assert (=> start!98462 (= tp!84911 b_and!38983)))

(declare-fun b!1138290 () Bool)

(declare-fun res!759379 () Bool)

(declare-fun e!647688 () Bool)

(assert (=> b!1138290 (=> (not res!759379) (not e!647688))))

(declare-datatypes ((array!74053 0))(
  ( (array!74054 (arr!35677 (Array (_ BitVec 32) (_ BitVec 64))) (size!36213 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74053)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43257 0))(
  ( (V!43258 (val!14355 Int)) )
))
(declare-datatypes ((ValueCell!13589 0))(
  ( (ValueCellFull!13589 (v!16992 V!43257)) (EmptyCell!13589) )
))
(declare-datatypes ((array!74055 0))(
  ( (array!74056 (arr!35678 (Array (_ BitVec 32) ValueCell!13589)) (size!36214 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74055)

(assert (=> b!1138290 (= res!759379 (and (= (size!36214 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36213 _keys!1208) (size!36214 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138291 () Bool)

(declare-fun res!759381 () Bool)

(assert (=> b!1138291 (=> (not res!759381) (not e!647688))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138291 (= res!759381 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36213 _keys!1208))))))

(declare-fun zeroValue!944 () V!43257)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18136 0))(
  ( (tuple2!18137 (_1!9079 (_ BitVec 64)) (_2!9079 V!43257)) )
))
(declare-datatypes ((List!24893 0))(
  ( (Nil!24890) (Cons!24889 (h!26098 tuple2!18136) (t!35952 List!24893)) )
))
(declare-datatypes ((ListLongMap!16105 0))(
  ( (ListLongMap!16106 (toList!8068 List!24893)) )
))
(declare-fun call!50353 () ListLongMap!16105)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43257)

(declare-fun bm!50343 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4552 (array!74053 array!74055 (_ BitVec 32) (_ BitVec 32) V!43257 V!43257 (_ BitVec 32) Int) ListLongMap!16105)

(assert (=> bm!50343 (= call!50353 (getCurrentListMapNoExtraKeys!4552 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138292 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!647693 () Bool)

(declare-fun lt!506400 () Bool)

(assert (=> b!1138292 (= e!647693 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506400) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138293 () Bool)

(declare-fun e!647691 () Bool)

(declare-fun e!647699 () Bool)

(declare-fun mapRes!44720 () Bool)

(assert (=> b!1138293 (= e!647691 (and e!647699 mapRes!44720))))

(declare-fun condMapEmpty!44720 () Bool)

(declare-fun mapDefault!44720 () ValueCell!13589)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98876 () Bool)

(assert start!98876)

(declare-fun b_free!24481 () Bool)

(declare-fun b_next!24481 () Bool)

(assert (=> start!98876 (= b_free!24481 (not b_next!24481))))

(declare-fun tp!86154 () Bool)

(declare-fun b_and!39811 () Bool)

(assert (=> start!98876 (= tp!86154 b_and!39811)))

(declare-datatypes ((V!43809 0))(
  ( (V!43810 (val!14562 Int)) )
))
(declare-fun zeroValue!944 () V!43809)

(declare-datatypes ((array!74865 0))(
  ( (array!74866 (arr!36083 (Array (_ BitVec 32) (_ BitVec 64))) (size!36619 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74865)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18526 0))(
  ( (tuple2!18527 (_1!9274 (_ BitVec 64)) (_2!9274 V!43809)) )
))
(declare-datatypes ((List!25268 0))(
  ( (Nil!25265) (Cons!25264 (h!26473 tuple2!18526) (t!36741 List!25268)) )
))
(declare-datatypes ((ListLongMap!16495 0))(
  ( (ListLongMap!16496 (toList!8263 List!25268)) )
))
(declare-fun call!55320 () ListLongMap!16495)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!55311 () Bool)

(declare-datatypes ((ValueCell!13796 0))(
  ( (ValueCellFull!13796 (v!17199 V!43809)) (EmptyCell!13796) )
))
(declare-datatypes ((array!74867 0))(
  ( (array!74868 (arr!36084 (Array (_ BitVec 32) ValueCell!13796)) (size!36620 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74867)

(declare-fun minValue!944 () V!43809)

(declare-fun getCurrentListMapNoExtraKeys!4730 (array!74865 array!74867 (_ BitVec 32) (_ BitVec 32) V!43809 V!43809 (_ BitVec 32) Int) ListLongMap!16495)

(assert (=> bm!55311 (= call!55320 (getCurrentListMapNoExtraKeys!4730 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55312 () Bool)

(declare-fun call!55314 () Bool)

(declare-fun call!55318 () Bool)

(assert (=> bm!55312 (= call!55314 call!55318)))

(declare-fun b!1157138 () Bool)

(declare-fun lt!519616 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!658056 () Bool)

(assert (=> b!1157138 (= e!658056 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519616) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157139 () Bool)

(declare-datatypes ((Unit!38117 0))(
  ( (Unit!38118) )
))
(declare-fun e!658060 () Unit!38117)

(declare-fun Unit!38119 () Unit!38117)

(assert (=> b!1157139 (= e!658060 Unit!38119)))

(declare-fun bm!55313 () Bool)

(declare-fun call!55319 () ListLongMap!16495)

(declare-fun call!55317 () ListLongMap!16495)

(assert (=> bm!55313 (= call!55319 call!55317)))

(declare-fun b!1157140 () Bool)

(declare-fun e!658050 () Bool)

(declare-fun e!658057 () Bool)

(declare-fun mapRes!45341 () Bool)

(assert (=> b!1157140 (= e!658050 (and e!658057 mapRes!45341))))

(declare-fun condMapEmpty!45341 () Bool)

(declare-fun mapDefault!45341 () ValueCell!13796)


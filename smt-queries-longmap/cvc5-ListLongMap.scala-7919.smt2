; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98354 () Bool)

(assert start!98354)

(declare-fun b_free!23959 () Bool)

(declare-fun b_next!23959 () Bool)

(assert (=> start!98354 (= b_free!23959 (not b_next!23959))))

(declare-fun tp!84587 () Bool)

(declare-fun b_and!38767 () Bool)

(assert (=> start!98354 (= tp!84587 b_and!38767)))

(declare-fun b!1133347 () Bool)

(declare-fun res!756762 () Bool)

(declare-fun e!645018 () Bool)

(assert (=> b!1133347 (=> (not res!756762) (not e!645018))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73839 0))(
  ( (array!73840 (arr!35570 (Array (_ BitVec 32) (_ BitVec 64))) (size!36106 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73839)

(assert (=> b!1133347 (= res!756762 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36106 _keys!1208))))))

(declare-fun bm!49047 () Bool)

(declare-datatypes ((Unit!37137 0))(
  ( (Unit!37138) )
))
(declare-fun call!49054 () Unit!37137)

(declare-fun call!49055 () Unit!37137)

(assert (=> bm!49047 (= call!49054 call!49055)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43113 0))(
  ( (V!43114 (val!14301 Int)) )
))
(declare-fun minValue!944 () V!43113)

(declare-fun bm!49048 () Bool)

(declare-fun zeroValue!944 () V!43113)

(declare-datatypes ((ValueCell!13535 0))(
  ( (ValueCellFull!13535 (v!16938 V!43113)) (EmptyCell!13535) )
))
(declare-datatypes ((array!73841 0))(
  ( (array!73842 (arr!35571 (Array (_ BitVec 32) ValueCell!13535)) (size!36107 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73841)

(declare-datatypes ((tuple2!18034 0))(
  ( (tuple2!18035 (_1!9028 (_ BitVec 64)) (_2!9028 V!43113)) )
))
(declare-datatypes ((List!24796 0))(
  ( (Nil!24793) (Cons!24792 (h!26001 tuple2!18034) (t!35747 List!24796)) )
))
(declare-datatypes ((ListLongMap!16003 0))(
  ( (ListLongMap!16004 (toList!8017 List!24796)) )
))
(declare-fun call!49052 () ListLongMap!16003)

(declare-fun getCurrentListMapNoExtraKeys!4504 (array!73839 array!73841 (_ BitVec 32) (_ BitVec 32) V!43113 V!43113 (_ BitVec 32) Int) ListLongMap!16003)

(assert (=> bm!49048 (= call!49052 (getCurrentListMapNoExtraKeys!4504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49049 () Bool)

(declare-fun call!49051 () ListLongMap!16003)

(declare-fun call!49053 () ListLongMap!16003)

(assert (=> bm!49049 (= call!49051 call!49053)))

(declare-fun b!1133348 () Bool)

(declare-fun e!645024 () Bool)

(assert (=> b!1133348 (= e!645018 e!645024)))

(declare-fun res!756760 () Bool)

(assert (=> b!1133348 (=> (not res!756760) (not e!645024))))

(declare-fun lt!503636 () array!73839)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73839 (_ BitVec 32)) Bool)

(assert (=> b!1133348 (= res!756760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503636 mask!1564))))

(assert (=> b!1133348 (= lt!503636 (array!73840 (store (arr!35570 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36106 _keys!1208)))))

(declare-fun e!645023 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1133349 () Bool)

(declare-fun arrayContainsKey!0 (array!73839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133349 (= e!645023 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133350 () Bool)

(declare-fun lt!503642 () Bool)

(assert (=> b!1133350 (= e!645023 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503642) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133351 () Bool)

(declare-fun e!645016 () Bool)

(declare-fun e!645028 () Bool)

(declare-fun mapRes!44558 () Bool)

(assert (=> b!1133351 (= e!645016 (and e!645028 mapRes!44558))))

(declare-fun condMapEmpty!44558 () Bool)

(declare-fun mapDefault!44558 () ValueCell!13535)


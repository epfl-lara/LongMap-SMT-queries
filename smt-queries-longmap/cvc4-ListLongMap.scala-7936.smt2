; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98460 () Bool)

(assert start!98460)

(declare-fun b_free!24065 () Bool)

(declare-fun b_next!24065 () Bool)

(assert (=> start!98460 (= b_free!24065 (not b_next!24065))))

(declare-fun tp!84905 () Bool)

(declare-fun b_and!38979 () Bool)

(assert (=> start!98460 (= tp!84905 b_and!38979)))

(declare-fun b!1138201 () Bool)

(declare-fun res!759339 () Bool)

(declare-fun e!647655 () Bool)

(assert (=> b!1138201 (=> (not res!759339) (not e!647655))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138201 (= res!759339 (validMask!0 mask!1564))))

(declare-datatypes ((V!43253 0))(
  ( (V!43254 (val!14354 Int)) )
))
(declare-datatypes ((tuple2!18134 0))(
  ( (tuple2!18135 (_1!9078 (_ BitVec 64)) (_2!9078 V!43253)) )
))
(declare-datatypes ((List!24891 0))(
  ( (Nil!24888) (Cons!24887 (h!26096 tuple2!18134) (t!35948 List!24891)) )
))
(declare-datatypes ((ListLongMap!16103 0))(
  ( (ListLongMap!16104 (toList!8067 List!24891)) )
))
(declare-fun call!50326 () ListLongMap!16103)

(declare-fun b!1138202 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!50323 () ListLongMap!16103)

(declare-fun e!647641 () Bool)

(declare-fun -!1221 (ListLongMap!16103 (_ BitVec 64)) ListLongMap!16103)

(assert (=> b!1138202 (= e!647641 (= call!50323 (-!1221 call!50326 k!934)))))

(declare-fun zeroValue!944 () V!43253)

(declare-datatypes ((array!74049 0))(
  ( (array!74050 (arr!35675 (Array (_ BitVec 32) (_ BitVec 64))) (size!36211 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74049)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13588 0))(
  ( (ValueCellFull!13588 (v!16991 V!43253)) (EmptyCell!13588) )
))
(declare-datatypes ((array!74051 0))(
  ( (array!74052 (arr!35676 (Array (_ BitVec 32) ValueCell!13588)) (size!36212 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74051)

(declare-fun minValue!944 () V!43253)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!50319 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4551 (array!74049 array!74051 (_ BitVec 32) (_ BitVec 32) V!43253 V!43253 (_ BitVec 32) Int) ListLongMap!16103)

(assert (=> bm!50319 (= call!50326 (getCurrentListMapNoExtraKeys!4551 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138203 () Bool)

(declare-datatypes ((Unit!37290 0))(
  ( (Unit!37291) )
))
(declare-fun e!647642 () Unit!37290)

(declare-fun Unit!37292 () Unit!37290)

(assert (=> b!1138203 (= e!647642 Unit!37292)))

(declare-fun b!1138204 () Bool)

(declare-fun res!759341 () Bool)

(declare-fun e!647643 () Bool)

(assert (=> b!1138204 (=> (not res!759341) (not e!647643))))

(declare-fun lt!506349 () array!74049)

(declare-datatypes ((List!24892 0))(
  ( (Nil!24889) (Cons!24888 (h!26097 (_ BitVec 64)) (t!35949 List!24892)) )
))
(declare-fun arrayNoDuplicates!0 (array!74049 (_ BitVec 32) List!24892) Bool)

(assert (=> b!1138204 (= res!759341 (arrayNoDuplicates!0 lt!506349 #b00000000000000000000000000000000 Nil!24889))))

(declare-fun lt!506357 () ListLongMap!16103)

(declare-fun lt!506353 () ListLongMap!16103)

(declare-fun c!111446 () Bool)

(declare-fun c!111445 () Bool)

(declare-fun call!50327 () Unit!37290)

(declare-fun bm!50320 () Bool)

(declare-fun addStillContains!761 (ListLongMap!16103 (_ BitVec 64) V!43253 (_ BitVec 64)) Unit!37290)

(assert (=> bm!50320 (= call!50327 (addStillContains!761 (ite c!111445 lt!506357 lt!506353) (ite c!111445 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111446 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111445 minValue!944 (ite c!111446 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!50321 () Bool)

(declare-fun call!50328 () Bool)

(declare-fun call!50324 () Bool)

(assert (=> bm!50321 (= call!50328 call!50324)))

(declare-fun b!1138205 () Bool)

(declare-fun e!647646 () Unit!37290)

(declare-fun lt!506358 () Unit!37290)

(assert (=> b!1138205 (= e!647646 lt!506358)))

(declare-fun call!50322 () Unit!37290)

(assert (=> b!1138205 (= lt!506358 call!50322)))

(assert (=> b!1138205 call!50328))

(declare-fun b!1138206 () Bool)

(declare-fun e!647648 () Unit!37290)

(declare-fun Unit!37293 () Unit!37290)

(assert (=> b!1138206 (= e!647648 Unit!37293)))

(declare-fun e!647650 () Bool)

(declare-fun b!1138207 () Bool)

(declare-fun arrayContainsKey!0 (array!74049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138207 (= e!647650 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138208 () Bool)

(assert (=> b!1138208 (= e!647655 e!647643)))

(declare-fun res!759338 () Bool)

(assert (=> b!1138208 (=> (not res!759338) (not e!647643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74049 (_ BitVec 32)) Bool)

(assert (=> b!1138208 (= res!759338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506349 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138208 (= lt!506349 (array!74050 (store (arr!35675 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36211 _keys!1208)))))

(declare-fun b!1138209 () Bool)

(declare-fun e!647651 () Bool)

(declare-fun e!647653 () Bool)

(declare-fun mapRes!44717 () Bool)

(assert (=> b!1138209 (= e!647651 (and e!647653 mapRes!44717))))

(declare-fun condMapEmpty!44717 () Bool)

(declare-fun mapDefault!44717 () ValueCell!13588)


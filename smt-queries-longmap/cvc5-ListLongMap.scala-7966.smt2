; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98636 () Bool)

(assert start!98636)

(declare-fun b_free!24241 () Bool)

(declare-fun b_next!24241 () Bool)

(assert (=> start!98636 (= b_free!24241 (not b_next!24241))))

(declare-fun tp!85434 () Bool)

(declare-fun b_and!39331 () Bool)

(assert (=> start!98636 (= tp!85434 b_and!39331)))

(declare-fun b!1146098 () Bool)

(declare-datatypes ((Unit!37631 0))(
  ( (Unit!37632) )
))
(declare-fun e!651932 () Unit!37631)

(declare-fun Unit!37633 () Unit!37631)

(assert (=> b!1146098 (= e!651932 Unit!37633)))

(declare-fun lt!511802 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1146098 (= lt!511802 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113031 () Bool)

(assert (=> b!1146098 (= c!113031 (and (not lt!511802) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511796 () Unit!37631)

(declare-fun e!651937 () Unit!37631)

(assert (=> b!1146098 (= lt!511796 e!651937)))

(declare-datatypes ((V!43489 0))(
  ( (V!43490 (val!14442 Int)) )
))
(declare-fun zeroValue!944 () V!43489)

(declare-datatypes ((array!74391 0))(
  ( (array!74392 (arr!35846 (Array (_ BitVec 32) (_ BitVec 64))) (size!36382 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74391)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13676 0))(
  ( (ValueCellFull!13676 (v!17079 V!43489)) (EmptyCell!13676) )
))
(declare-datatypes ((array!74393 0))(
  ( (array!74394 (arr!35847 (Array (_ BitVec 32) ValueCell!13676)) (size!36383 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74393)

(declare-fun minValue!944 () V!43489)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!511784 () Unit!37631)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!420 (array!74391 array!74393 (_ BitVec 32) (_ BitVec 32) V!43489 V!43489 (_ BitVec 64) (_ BitVec 32) Int) Unit!37631)

(assert (=> b!1146098 (= lt!511784 (lemmaListMapContainsThenArrayContainsFrom!420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113029 () Bool)

(assert (=> b!1146098 (= c!113029 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763099 () Bool)

(declare-fun e!651945 () Bool)

(assert (=> b!1146098 (= res!763099 e!651945)))

(declare-fun e!651944 () Bool)

(assert (=> b!1146098 (=> (not res!763099) (not e!651944))))

(assert (=> b!1146098 e!651944))

(declare-fun lt!511799 () Unit!37631)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74391 (_ BitVec 32) (_ BitVec 32)) Unit!37631)

(assert (=> b!1146098 (= lt!511799 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25049 0))(
  ( (Nil!25046) (Cons!25045 (h!26254 (_ BitVec 64)) (t!36282 List!25049)) )
))
(declare-fun arrayNoDuplicates!0 (array!74391 (_ BitVec 32) List!25049) Bool)

(assert (=> b!1146098 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25046)))

(declare-fun lt!511789 () Unit!37631)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74391 (_ BitVec 64) (_ BitVec 32) List!25049) Unit!37631)

(assert (=> b!1146098 (= lt!511789 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25046))))

(assert (=> b!1146098 false))

(declare-fun bm!52431 () Bool)

(declare-fun c!113028 () Bool)

(declare-datatypes ((tuple2!18296 0))(
  ( (tuple2!18297 (_1!9159 (_ BitVec 64)) (_2!9159 V!43489)) )
))
(declare-datatypes ((List!25050 0))(
  ( (Nil!25047) (Cons!25046 (h!26255 tuple2!18296) (t!36283 List!25050)) )
))
(declare-datatypes ((ListLongMap!16265 0))(
  ( (ListLongMap!16266 (toList!8148 List!25050)) )
))
(declare-fun call!52436 () ListLongMap!16265)

(declare-fun lt!511785 () ListLongMap!16265)

(declare-fun +!3573 (ListLongMap!16265 tuple2!18296) ListLongMap!16265)

(assert (=> bm!52431 (= call!52436 (+!3573 lt!511785 (ite (or c!113031 c!113028) (tuple2!18297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18297 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146099 () Bool)

(declare-fun e!651938 () Bool)

(declare-fun e!651939 () Bool)

(declare-fun mapRes!44981 () Bool)

(assert (=> b!1146099 (= e!651938 (and e!651939 mapRes!44981))))

(declare-fun condMapEmpty!44981 () Bool)

(declare-fun mapDefault!44981 () ValueCell!13676)


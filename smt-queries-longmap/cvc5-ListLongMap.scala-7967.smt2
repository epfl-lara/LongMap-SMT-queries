; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98642 () Bool)

(assert start!98642)

(declare-fun b_free!24247 () Bool)

(declare-fun b_next!24247 () Bool)

(assert (=> start!98642 (= b_free!24247 (not b_next!24247))))

(declare-fun tp!85451 () Bool)

(declare-fun b_and!39343 () Bool)

(assert (=> start!98642 (= tp!85451 b_and!39343)))

(declare-fun c!113083 () Bool)

(declare-datatypes ((V!43497 0))(
  ( (V!43498 (val!14445 Int)) )
))
(declare-datatypes ((tuple2!18302 0))(
  ( (tuple2!18303 (_1!9162 (_ BitVec 64)) (_2!9162 V!43497)) )
))
(declare-datatypes ((List!25054 0))(
  ( (Nil!25051) (Cons!25050 (h!26259 tuple2!18302) (t!36293 List!25054)) )
))
(declare-datatypes ((ListLongMap!16271 0))(
  ( (ListLongMap!16272 (toList!8151 List!25054)) )
))
(declare-fun lt!511977 () ListLongMap!16271)

(declare-fun bm!52503 () Bool)

(declare-fun c!113084 () Bool)

(declare-fun lt!511981 () ListLongMap!16271)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43497)

(declare-datatypes ((Unit!37642 0))(
  ( (Unit!37643) )
))
(declare-fun call!52506 () Unit!37642)

(declare-fun zeroValue!944 () V!43497)

(declare-fun addStillContains!828 (ListLongMap!16271 (_ BitVec 64) V!43497 (_ BitVec 64)) Unit!37642)

(assert (=> bm!52503 (= call!52506 (addStillContains!828 (ite c!113084 lt!511977 lt!511981) (ite c!113084 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113083 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113084 minValue!944 (ite c!113083 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!52504 () Bool)

(declare-fun call!52509 () ListLongMap!16271)

(declare-fun call!52511 () ListLongMap!16271)

(assert (=> bm!52504 (= call!52509 call!52511)))

(declare-fun bm!52505 () Bool)

(declare-fun call!52507 () Unit!37642)

(assert (=> bm!52505 (= call!52507 call!52506)))

(declare-fun b!1146374 () Bool)

(declare-fun e!652096 () Bool)

(declare-fun e!652088 () Bool)

(declare-fun mapRes!44990 () Bool)

(assert (=> b!1146374 (= e!652096 (and e!652088 mapRes!44990))))

(declare-fun condMapEmpty!44990 () Bool)

(declare-datatypes ((ValueCell!13679 0))(
  ( (ValueCellFull!13679 (v!17082 V!43497)) (EmptyCell!13679) )
))
(declare-datatypes ((array!74403 0))(
  ( (array!74404 (arr!35852 (Array (_ BitVec 32) ValueCell!13679)) (size!36388 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74403)

(declare-fun mapDefault!44990 () ValueCell!13679)


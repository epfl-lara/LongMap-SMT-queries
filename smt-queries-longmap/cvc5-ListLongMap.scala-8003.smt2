; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98858 () Bool)

(assert start!98858)

(declare-fun b_free!24463 () Bool)

(declare-fun b_next!24463 () Bool)

(assert (=> start!98858 (= b_free!24463 (not b_next!24463))))

(declare-fun tp!86100 () Bool)

(declare-fun b_and!39775 () Bool)

(assert (=> start!98858 (= tp!86100 b_and!39775)))

(declare-fun bm!55095 () Bool)

(declare-fun call!55105 () Bool)

(declare-fun call!55101 () Bool)

(assert (=> bm!55095 (= call!55105 call!55101)))

(declare-fun b!1156310 () Bool)

(declare-datatypes ((V!43785 0))(
  ( (V!43786 (val!14553 Int)) )
))
(declare-datatypes ((tuple2!18514 0))(
  ( (tuple2!18515 (_1!9268 (_ BitVec 64)) (_2!9268 V!43785)) )
))
(declare-datatypes ((List!25256 0))(
  ( (Nil!25253) (Cons!25252 (h!26461 tuple2!18514) (t!36711 List!25256)) )
))
(declare-datatypes ((ListLongMap!16483 0))(
  ( (ListLongMap!16484 (toList!8257 List!25256)) )
))
(declare-fun call!55104 () ListLongMap!16483)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6769 (ListLongMap!16483 (_ BitVec 64)) Bool)

(assert (=> b!1156310 (contains!6769 call!55104 k!934)))

(declare-datatypes ((Unit!38089 0))(
  ( (Unit!38090) )
))
(declare-fun lt!519016 () Unit!38089)

(declare-fun call!55102 () Unit!38089)

(assert (=> b!1156310 (= lt!519016 call!55102)))

(assert (=> b!1156310 call!55101))

(declare-fun lt!519026 () ListLongMap!16483)

(declare-fun lt!519033 () ListLongMap!16483)

(declare-fun zeroValue!944 () V!43785)

(declare-fun +!3670 (ListLongMap!16483 tuple2!18514) ListLongMap!16483)

(assert (=> b!1156310 (= lt!519026 (+!3670 lt!519033 (tuple2!18515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519024 () Unit!38089)

(declare-fun addStillContains!912 (ListLongMap!16483 (_ BitVec 64) V!43785 (_ BitVec 64)) Unit!38089)

(assert (=> b!1156310 (= lt!519024 (addStillContains!912 lt!519033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!657598 () Unit!38089)

(assert (=> b!1156310 (= e!657598 lt!519016)))

(declare-datatypes ((array!74833 0))(
  ( (array!74834 (arr!36067 (Array (_ BitVec 32) (_ BitVec 64))) (size!36603 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74833)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!657590 () Bool)

(declare-fun b!1156311 () Bool)

(declare-fun arrayContainsKey!0 (array!74833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156311 (= e!657590 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156312 () Bool)

(declare-fun e!657601 () Bool)

(declare-fun e!657603 () Bool)

(declare-fun mapRes!45314 () Bool)

(assert (=> b!1156312 (= e!657601 (and e!657603 mapRes!45314))))

(declare-fun condMapEmpty!45314 () Bool)

(declare-datatypes ((ValueCell!13787 0))(
  ( (ValueCellFull!13787 (v!17190 V!43785)) (EmptyCell!13787) )
))
(declare-datatypes ((array!74835 0))(
  ( (array!74836 (arr!36068 (Array (_ BitVec 32) ValueCell!13787)) (size!36604 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74835)

(declare-fun mapDefault!45314 () ValueCell!13787)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98898 () Bool)

(assert start!98898)

(declare-fun b_free!24503 () Bool)

(declare-fun b_next!24503 () Bool)

(assert (=> start!98898 (= b_free!24503 (not b_next!24503))))

(declare-fun tp!86220 () Bool)

(declare-fun b_and!39855 () Bool)

(assert (=> start!98898 (= tp!86220 b_and!39855)))

(declare-datatypes ((array!74909 0))(
  ( (array!74910 (arr!36105 (Array (_ BitVec 32) (_ BitVec 64))) (size!36641 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74909)

(declare-fun b!1158150 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!658614 () Bool)

(declare-fun arrayContainsKey!0 (array!74909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158150 (= e!658614 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-datatypes ((V!43837 0))(
  ( (V!43838 (val!14573 Int)) )
))
(declare-fun zeroValue!944 () V!43837)

(declare-datatypes ((tuple2!18548 0))(
  ( (tuple2!18549 (_1!9285 (_ BitVec 64)) (_2!9285 V!43837)) )
))
(declare-datatypes ((List!25288 0))(
  ( (Nil!25285) (Cons!25284 (h!26493 tuple2!18548) (t!36783 List!25288)) )
))
(declare-datatypes ((ListLongMap!16517 0))(
  ( (ListLongMap!16518 (toList!8274 List!25288)) )
))
(declare-fun call!55581 () ListLongMap!16517)

(declare-fun c!115386 () Bool)

(declare-fun lt!520343 () ListLongMap!16517)

(declare-fun c!115390 () Bool)

(declare-fun bm!55575 () Bool)

(declare-fun minValue!944 () V!43837)

(declare-fun +!3684 (ListLongMap!16517 tuple2!18548) ListLongMap!16517)

(assert (=> bm!55575 (= call!55581 (+!3684 lt!520343 (ite (or c!115390 c!115386) (tuple2!18549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1158151 () Bool)

(declare-fun e!658622 () Bool)

(declare-fun tp_is_empty!29033 () Bool)

(assert (=> b!1158151 (= e!658622 tp_is_empty!29033)))

(declare-fun b!1158152 () Bool)

(declare-fun res!768986 () Bool)

(declare-fun e!658616 () Bool)

(assert (=> b!1158152 (=> (not res!768986) (not e!658616))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158152 (= res!768986 (= (select (arr!36105 _keys!1208) i!673) k!934))))

(declare-fun b!1158153 () Bool)

(declare-fun e!658610 () Bool)

(declare-fun e!658613 () Bool)

(declare-fun mapRes!45374 () Bool)

(assert (=> b!1158153 (= e!658610 (and e!658613 mapRes!45374))))

(declare-fun condMapEmpty!45374 () Bool)

(declare-datatypes ((ValueCell!13807 0))(
  ( (ValueCellFull!13807 (v!17210 V!43837)) (EmptyCell!13807) )
))
(declare-datatypes ((array!74911 0))(
  ( (array!74912 (arr!36106 (Array (_ BitVec 32) ValueCell!13807)) (size!36642 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74911)

(declare-fun mapDefault!45374 () ValueCell!13807)


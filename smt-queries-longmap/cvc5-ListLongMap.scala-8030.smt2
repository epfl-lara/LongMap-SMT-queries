; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99020 () Bool)

(assert start!99020)

(declare-fun b_free!24625 () Bool)

(declare-fun b_next!24625 () Bool)

(assert (=> start!99020 (= b_free!24625 (not b_next!24625))))

(declare-fun tp!86585 () Bool)

(declare-fun b_and!40099 () Bool)

(assert (=> start!99020 (= tp!86585 b_and!40099)))

(declare-datatypes ((V!44001 0))(
  ( (V!44002 (val!14634 Int)) )
))
(declare-fun zeroValue!944 () V!44001)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18664 0))(
  ( (tuple2!18665 (_1!9343 (_ BitVec 64)) (_2!9343 V!44001)) )
))
(declare-datatypes ((List!25397 0))(
  ( (Nil!25394) (Cons!25393 (h!26602 tuple2!18664) (t!37014 List!25397)) )
))
(declare-datatypes ((ListLongMap!16633 0))(
  ( (ListLongMap!16634 (toList!8332 List!25397)) )
))
(declare-fun call!57046 () ListLongMap!16633)

(declare-fun bm!57039 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13868 0))(
  ( (ValueCellFull!13868 (v!17271 V!44001)) (EmptyCell!13868) )
))
(declare-datatypes ((array!75149 0))(
  ( (array!75150 (arr!36225 (Array (_ BitVec 32) ValueCell!13868)) (size!36761 (_ BitVec 32))) )
))
(declare-fun lt!524359 () array!75149)

(declare-datatypes ((array!75151 0))(
  ( (array!75152 (arr!36226 (Array (_ BitVec 32) (_ BitVec 64))) (size!36762 (_ BitVec 32))) )
))
(declare-fun lt!524366 () array!75151)

(declare-fun minValue!944 () V!44001)

(declare-fun getCurrentListMapNoExtraKeys!4796 (array!75151 array!75149 (_ BitVec 32) (_ BitVec 32) V!44001 V!44001 (_ BitVec 32) Int) ListLongMap!16633)

(assert (=> bm!57039 (= call!57046 (getCurrentListMapNoExtraKeys!4796 lt!524366 lt!524359 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163762 () Bool)

(declare-fun c!116484 () Bool)

(declare-fun lt!524361 () Bool)

(assert (=> b!1163762 (= c!116484 (and (not lt!524361) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38409 0))(
  ( (Unit!38410) )
))
(declare-fun e!661736 () Unit!38409)

(declare-fun e!661732 () Unit!38409)

(assert (=> b!1163762 (= e!661736 e!661732)))

(declare-fun b!1163763 () Bool)

(declare-fun e!661735 () Bool)

(declare-fun e!661733 () Bool)

(declare-fun mapRes!45557 () Bool)

(assert (=> b!1163763 (= e!661735 (and e!661733 mapRes!45557))))

(declare-fun condMapEmpty!45557 () Bool)

(declare-fun _values!996 () array!75149)

(declare-fun mapDefault!45557 () ValueCell!13868)


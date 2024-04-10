; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99014 () Bool)

(assert start!99014)

(declare-fun b_free!24619 () Bool)

(declare-fun b_next!24619 () Bool)

(assert (=> start!99014 (= b_free!24619 (not b_next!24619))))

(declare-fun tp!86567 () Bool)

(declare-fun b_and!40087 () Bool)

(assert (=> start!99014 (= tp!86567 b_and!40087)))

(declare-datatypes ((array!75137 0))(
  ( (array!75138 (arr!36219 (Array (_ BitVec 32) (_ BitVec 64))) (size!36755 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75137)

(declare-fun e!661578 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1163486 () Bool)

(declare-fun arrayContainsKey!0 (array!75137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163486 (= e!661578 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163487 () Bool)

(declare-fun res!771594 () Bool)

(declare-fun e!661573 () Bool)

(assert (=> b!1163487 (=> (not res!771594) (not e!661573))))

(declare-fun lt!524163 () array!75137)

(declare-datatypes ((List!25391 0))(
  ( (Nil!25388) (Cons!25387 (h!26596 (_ BitVec 64)) (t!37002 List!25391)) )
))
(declare-fun arrayNoDuplicates!0 (array!75137 (_ BitVec 32) List!25391) Bool)

(assert (=> b!1163487 (= res!771594 (arrayNoDuplicates!0 lt!524163 #b00000000000000000000000000000000 Nil!25388))))

(declare-datatypes ((V!43993 0))(
  ( (V!43994 (val!14631 Int)) )
))
(declare-datatypes ((tuple2!18658 0))(
  ( (tuple2!18659 (_1!9340 (_ BitVec 64)) (_2!9340 V!43993)) )
))
(declare-datatypes ((List!25392 0))(
  ( (Nil!25389) (Cons!25388 (h!26597 tuple2!18658) (t!37003 List!25392)) )
))
(declare-datatypes ((ListLongMap!16627 0))(
  ( (ListLongMap!16628 (toList!8329 List!25392)) )
))
(declare-fun call!56972 () ListLongMap!16627)

(declare-fun c!116433 () Bool)

(declare-fun lt!524177 () ListLongMap!16627)

(declare-fun call!56971 () Bool)

(declare-fun bm!56967 () Bool)

(declare-fun contains!6833 (ListLongMap!16627 (_ BitVec 64)) Bool)

(assert (=> bm!56967 (= call!56971 (contains!6833 (ite c!116433 lt!524177 call!56972) k!934))))

(declare-fun bm!56968 () Bool)

(declare-fun call!56977 () ListLongMap!16627)

(assert (=> bm!56968 (= call!56972 call!56977)))

(declare-fun zeroValue!944 () V!43993)

(declare-fun lt!524181 () ListLongMap!16627)

(declare-fun c!116430 () Bool)

(declare-fun minValue!944 () V!43993)

(declare-fun bm!56969 () Bool)

(declare-fun +!3732 (ListLongMap!16627 tuple2!18658) ListLongMap!16627)

(assert (=> bm!56969 (= call!56977 (+!3732 lt!524181 (ite (or c!116433 c!116430) (tuple2!18659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun call!56970 () ListLongMap!16627)

(declare-fun call!56973 () ListLongMap!16627)

(declare-fun b!1163488 () Bool)

(declare-fun e!661575 () Bool)

(declare-fun -!1433 (ListLongMap!16627 (_ BitVec 64)) ListLongMap!16627)

(assert (=> b!1163488 (= e!661575 (= call!56970 (-!1433 call!56973 k!934)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1163489 () Bool)

(declare-fun lt!524175 () ListLongMap!16627)

(declare-datatypes ((ValueCell!13865 0))(
  ( (ValueCellFull!13865 (v!17268 V!43993)) (EmptyCell!13865) )
))
(declare-datatypes ((array!75139 0))(
  ( (array!75140 (arr!36220 (Array (_ BitVec 32) ValueCell!13865)) (size!36756 (_ BitVec 32))) )
))
(declare-fun lt!524178 () array!75139)

(declare-fun e!661570 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4793 (array!75137 array!75139 (_ BitVec 32) (_ BitVec 32) V!43993 V!43993 (_ BitVec 32) Int) ListLongMap!16627)

(assert (=> b!1163489 (= e!661570 (= lt!524175 (getCurrentListMapNoExtraKeys!4793 lt!524163 lt!524178 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163490 () Bool)

(declare-fun res!771599 () Bool)

(declare-fun e!661582 () Bool)

(assert (=> b!1163490 (=> (not res!771599) (not e!661582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163490 (= res!771599 (validMask!0 mask!1564))))

(declare-fun b!1163491 () Bool)

(declare-fun res!771601 () Bool)

(assert (=> b!1163491 (=> (not res!771601) (not e!661582))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163491 (= res!771601 (= (select (arr!36219 _keys!1208) i!673) k!934))))

(declare-fun b!1163492 () Bool)

(declare-fun e!661583 () Bool)

(declare-fun e!661576 () Bool)

(assert (=> b!1163492 (= e!661583 e!661576)))

(declare-fun res!771600 () Bool)

(assert (=> b!1163492 (=> res!771600 e!661576)))

(assert (=> b!1163492 (= res!771600 (not (= from!1455 i!673)))))

(declare-fun lt!524173 () ListLongMap!16627)

(assert (=> b!1163492 (= lt!524173 (getCurrentListMapNoExtraKeys!4793 lt!524163 lt!524178 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524164 () V!43993)

(declare-fun _values!996 () array!75139)

(assert (=> b!1163492 (= lt!524178 (array!75140 (store (arr!36220 _values!996) i!673 (ValueCellFull!13865 lt!524164)) (size!36756 _values!996)))))

(declare-fun dynLambda!2785 (Int (_ BitVec 64)) V!43993)

(assert (=> b!1163492 (= lt!524164 (dynLambda!2785 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!524168 () ListLongMap!16627)

(assert (=> b!1163492 (= lt!524168 (getCurrentListMapNoExtraKeys!4793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163493 () Bool)

(declare-fun e!661568 () Bool)

(declare-fun e!661579 () Bool)

(declare-fun mapRes!45548 () Bool)

(assert (=> b!1163493 (= e!661568 (and e!661579 mapRes!45548))))

(declare-fun condMapEmpty!45548 () Bool)

(declare-fun mapDefault!45548 () ValueCell!13865)


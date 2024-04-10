; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101160 () Bool)

(assert start!101160)

(declare-fun b_free!26083 () Bool)

(declare-fun b_next!26083 () Bool)

(assert (=> start!101160 (= b_free!26083 (not b_next!26083))))

(declare-fun tp!91271 () Bool)

(declare-fun b_and!43283 () Bool)

(assert (=> start!101160 (= tp!91271 b_and!43283)))

(declare-fun bm!60476 () Bool)

(declare-datatypes ((V!46177 0))(
  ( (V!46178 (val!15450 Int)) )
))
(declare-datatypes ((tuple2!19860 0))(
  ( (tuple2!19861 (_1!9941 (_ BitVec 64)) (_2!9941 V!46177)) )
))
(declare-datatypes ((List!26659 0))(
  ( (Nil!26656) (Cons!26655 (h!27864 tuple2!19860) (t!39722 List!26659)) )
))
(declare-datatypes ((ListLongMap!17829 0))(
  ( (ListLongMap!17830 (toList!8930 List!26659)) )
))
(declare-fun call!60481 () ListLongMap!17829)

(declare-fun call!60483 () ListLongMap!17829)

(assert (=> bm!60476 (= call!60481 call!60483)))

(declare-fun mapIsEmpty!48055 () Bool)

(declare-fun mapRes!48055 () Bool)

(assert (=> mapIsEmpty!48055 mapRes!48055))

(declare-fun zeroValue!944 () V!46177)

(declare-datatypes ((Unit!40253 0))(
  ( (Unit!40254) )
))
(declare-fun call!60479 () Unit!40253)

(declare-fun lt!551978 () ListLongMap!17829)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!119954 () Bool)

(declare-fun bm!60477 () Bool)

(declare-fun lt!551976 () ListLongMap!17829)

(declare-fun c!119957 () Bool)

(declare-fun minValue!944 () V!46177)

(declare-fun addStillContains!1070 (ListLongMap!17829 (_ BitVec 64) V!46177 (_ BitVec 64)) Unit!40253)

(assert (=> bm!60477 (= call!60479 (addStillContains!1070 (ite c!119957 lt!551978 lt!551976) (ite c!119957 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119954 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119957 minValue!944 (ite c!119954 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1213844 () Bool)

(declare-fun contains!7000 (ListLongMap!17829 (_ BitVec 64)) Bool)

(assert (=> b!1213844 (contains!7000 call!60483 k!934)))

(declare-fun lt!551963 () Unit!40253)

(assert (=> b!1213844 (= lt!551963 call!60479)))

(declare-fun call!60485 () Bool)

(assert (=> b!1213844 call!60485))

(declare-fun +!4042 (ListLongMap!17829 tuple2!19860) ListLongMap!17829)

(assert (=> b!1213844 (= lt!551978 (+!4042 lt!551976 (tuple2!19861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551967 () Unit!40253)

(assert (=> b!1213844 (= lt!551967 (addStillContains!1070 lt!551976 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!689357 () Unit!40253)

(assert (=> b!1213844 (= e!689357 lt!551963)))

(declare-fun b!1213845 () Bool)

(declare-fun e!689347 () Bool)

(declare-fun e!689354 () Bool)

(assert (=> b!1213845 (= e!689347 e!689354)))

(declare-fun res!805942 () Bool)

(assert (=> b!1213845 (=> (not res!805942) (not e!689354))))

(declare-datatypes ((array!78361 0))(
  ( (array!78362 (arr!37815 (Array (_ BitVec 32) (_ BitVec 64))) (size!38351 (_ BitVec 32))) )
))
(declare-fun lt!551964 () array!78361)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78361 (_ BitVec 32)) Bool)

(assert (=> b!1213845 (= res!805942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551964 mask!1564))))

(declare-fun _keys!1208 () array!78361)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213845 (= lt!551964 (array!78362 (store (arr!37815 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38351 _keys!1208)))))

(declare-fun b!1213846 () Bool)

(declare-fun e!689353 () Bool)

(declare-fun e!689359 () Bool)

(assert (=> b!1213846 (= e!689353 (and e!689359 mapRes!48055))))

(declare-fun condMapEmpty!48055 () Bool)

(declare-datatypes ((ValueCell!14684 0))(
  ( (ValueCellFull!14684 (v!18103 V!46177)) (EmptyCell!14684) )
))
(declare-datatypes ((array!78363 0))(
  ( (array!78364 (arr!37816 (Array (_ BitVec 32) ValueCell!14684)) (size!38352 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78363)

(declare-fun mapDefault!48055 () ValueCell!14684)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100778 () Bool)

(assert start!100778)

(declare-fun b_free!25949 () Bool)

(declare-fun b_next!25949 () Bool)

(assert (=> start!100778 (= b_free!25949 (not b_next!25949))))

(declare-fun tp!90850 () Bool)

(declare-fun b_and!42881 () Bool)

(assert (=> start!100778 (= tp!90850 b_and!42881)))

(declare-fun b!1206381 () Bool)

(declare-datatypes ((Unit!39993 0))(
  ( (Unit!39994) )
))
(declare-fun e!685086 () Unit!39993)

(declare-fun lt!547246 () Unit!39993)

(assert (=> b!1206381 (= e!685086 lt!547246)))

(declare-datatypes ((V!45997 0))(
  ( (V!45998 (val!15383 Int)) )
))
(declare-fun zeroValue!944 () V!45997)

(declare-fun lt!547258 () Unit!39993)

(declare-datatypes ((tuple2!19738 0))(
  ( (tuple2!19739 (_1!9880 (_ BitVec 64)) (_2!9880 V!45997)) )
))
(declare-datatypes ((List!26541 0))(
  ( (Nil!26538) (Cons!26537 (h!27746 tuple2!19738) (t!39470 List!26541)) )
))
(declare-datatypes ((ListLongMap!17707 0))(
  ( (ListLongMap!17708 (toList!8869 List!26541)) )
))
(declare-fun lt!547257 () ListLongMap!17707)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun addStillContains!1019 (ListLongMap!17707 (_ BitVec 64) V!45997 (_ BitVec 64)) Unit!39993)

(assert (=> b!1206381 (= lt!547258 (addStillContains!1019 lt!547257 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!547250 () ListLongMap!17707)

(declare-fun +!3990 (ListLongMap!17707 tuple2!19738) ListLongMap!17707)

(assert (=> b!1206381 (= lt!547250 (+!3990 lt!547257 (tuple2!19739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!58721 () Bool)

(assert (=> b!1206381 call!58721))

(declare-fun call!58718 () Unit!39993)

(assert (=> b!1206381 (= lt!547246 call!58718)))

(declare-fun call!58723 () ListLongMap!17707)

(declare-fun contains!6927 (ListLongMap!17707 (_ BitVec 64)) Bool)

(assert (=> b!1206381 (contains!6927 call!58723 k!934)))

(declare-fun bm!58713 () Bool)

(declare-fun call!58717 () ListLongMap!17707)

(assert (=> bm!58713 (= call!58717 call!58723)))

(declare-fun b!1206383 () Bool)

(declare-fun e!685088 () Bool)

(declare-fun e!685080 () Bool)

(assert (=> b!1206383 (= e!685088 (not e!685080))))

(declare-fun res!802288 () Bool)

(assert (=> b!1206383 (=> res!802288 e!685080)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206383 (= res!802288 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78087 0))(
  ( (array!78088 (arr!37684 (Array (_ BitVec 32) (_ BitVec 64))) (size!38220 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78087)

(declare-fun arrayContainsKey!0 (array!78087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206383 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!547248 () Unit!39993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78087 (_ BitVec 64) (_ BitVec 32)) Unit!39993)

(assert (=> b!1206383 (= lt!547248 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1206384 () Bool)

(declare-fun res!802292 () Bool)

(declare-fun e!685083 () Bool)

(assert (=> b!1206384 (=> (not res!802292) (not e!685083))))

(assert (=> b!1206384 (= res!802292 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38220 _keys!1208))))))

(declare-fun b!1206385 () Bool)

(declare-fun call!58722 () Bool)

(assert (=> b!1206385 call!58722))

(declare-fun lt!547252 () Unit!39993)

(declare-fun call!58716 () Unit!39993)

(assert (=> b!1206385 (= lt!547252 call!58716)))

(declare-fun e!685090 () Unit!39993)

(assert (=> b!1206385 (= e!685090 lt!547252)))

(declare-fun b!1206386 () Bool)

(declare-fun e!685089 () Unit!39993)

(declare-fun Unit!39995 () Unit!39993)

(assert (=> b!1206386 (= e!685089 Unit!39995)))

(declare-fun c!118446 () Bool)

(declare-fun bm!58714 () Bool)

(declare-fun c!118449 () Bool)

(declare-fun minValue!944 () V!45997)

(assert (=> bm!58714 (= call!58718 (addStillContains!1019 (ite c!118446 lt!547250 lt!547257) (ite c!118446 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118446 minValue!944 (ite c!118449 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1206387 () Bool)

(declare-fun e!685094 () Bool)

(declare-fun e!685084 () Bool)

(declare-fun mapRes!47835 () Bool)

(assert (=> b!1206387 (= e!685094 (and e!685084 mapRes!47835))))

(declare-fun condMapEmpty!47835 () Bool)

(declare-datatypes ((ValueCell!14617 0))(
  ( (ValueCellFull!14617 (v!18027 V!45997)) (EmptyCell!14617) )
))
(declare-datatypes ((array!78089 0))(
  ( (array!78090 (arr!37685 (Array (_ BitVec 32) ValueCell!14617)) (size!38221 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78089)

(declare-fun mapDefault!47835 () ValueCell!14617)


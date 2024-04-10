; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99754 () Bool)

(assert start!99754)

(declare-fun b_free!25333 () Bool)

(declare-fun b_next!25333 () Bool)

(assert (=> start!99754 (= b_free!25333 (not b_next!25333))))

(declare-fun tp!88713 () Bool)

(declare-fun b_and!41533 () Bool)

(assert (=> start!99754 (= tp!88713 b_and!41533)))

(declare-fun b!1184609 () Bool)

(declare-fun e!673529 () Bool)

(assert (=> b!1184609 (= e!673529 true)))

(declare-datatypes ((V!44945 0))(
  ( (V!44946 (val!14988 Int)) )
))
(declare-datatypes ((tuple2!19218 0))(
  ( (tuple2!19219 (_1!9620 (_ BitVec 64)) (_2!9620 V!44945)) )
))
(declare-datatypes ((List!25959 0))(
  ( (Nil!25956) (Cons!25955 (h!27164 tuple2!19218) (t!38284 List!25959)) )
))
(declare-datatypes ((ListLongMap!17187 0))(
  ( (ListLongMap!17188 (toList!8609 List!25959)) )
))
(declare-fun lt!537249 () ListLongMap!17187)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!537248 () ListLongMap!17187)

(declare-fun -!1644 (ListLongMap!17187 (_ BitVec 64)) ListLongMap!17187)

(assert (=> b!1184609 (= (-!1644 lt!537249 k!934) lt!537248)))

(declare-datatypes ((array!76525 0))(
  ( (array!76526 (arr!36912 (Array (_ BitVec 32) (_ BitVec 64))) (size!37448 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76525)

(declare-fun lt!537254 () V!44945)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!537257 () ListLongMap!17187)

(declare-datatypes ((Unit!39227 0))(
  ( (Unit!39228) )
))
(declare-fun lt!537251 () Unit!39227)

(declare-fun addRemoveCommutativeForDiffKeys!169 (ListLongMap!17187 (_ BitVec 64) V!44945 (_ BitVec 64)) Unit!39227)

(assert (=> b!1184609 (= lt!537251 (addRemoveCommutativeForDiffKeys!169 lt!537257 (select (arr!36912 _keys!1208) from!1455) lt!537254 k!934))))

(declare-fun lt!537256 () ListLongMap!17187)

(declare-fun lt!537245 () ListLongMap!17187)

(declare-fun lt!537261 () ListLongMap!17187)

(assert (=> b!1184609 (and (= lt!537261 lt!537249) (= lt!537256 lt!537245))))

(declare-fun lt!537243 () tuple2!19218)

(declare-fun +!3906 (ListLongMap!17187 tuple2!19218) ListLongMap!17187)

(assert (=> b!1184609 (= lt!537249 (+!3906 lt!537257 lt!537243))))

(assert (=> b!1184609 (not (= (select (arr!36912 _keys!1208) from!1455) k!934))))

(declare-fun lt!537250 () Unit!39227)

(declare-fun e!673532 () Unit!39227)

(assert (=> b!1184609 (= lt!537250 e!673532)))

(declare-fun c!117123 () Bool)

(assert (=> b!1184609 (= c!117123 (= (select (arr!36912 _keys!1208) from!1455) k!934))))

(declare-fun e!673533 () Bool)

(assert (=> b!1184609 e!673533))

(declare-fun res!787398 () Bool)

(assert (=> b!1184609 (=> (not res!787398) (not e!673533))))

(declare-fun lt!537258 () ListLongMap!17187)

(assert (=> b!1184609 (= res!787398 (= lt!537258 lt!537248))))

(assert (=> b!1184609 (= lt!537248 (+!3906 lt!537256 lt!537243))))

(assert (=> b!1184609 (= lt!537243 (tuple2!19219 (select (arr!36912 _keys!1208) from!1455) lt!537254))))

(declare-fun lt!537260 () V!44945)

(declare-datatypes ((ValueCell!14222 0))(
  ( (ValueCellFull!14222 (v!17626 V!44945)) (EmptyCell!14222) )
))
(declare-datatypes ((array!76527 0))(
  ( (array!76528 (arr!36913 (Array (_ BitVec 32) ValueCell!14222)) (size!37449 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76527)

(declare-fun get!18891 (ValueCell!14222 V!44945) V!44945)

(assert (=> b!1184609 (= lt!537254 (get!18891 (select (arr!36913 _values!996) from!1455) lt!537260))))

(declare-fun b!1184610 () Bool)

(declare-fun e!673528 () Bool)

(declare-fun e!673524 () Bool)

(declare-fun mapRes!46622 () Bool)

(assert (=> b!1184610 (= e!673528 (and e!673524 mapRes!46622))))

(declare-fun condMapEmpty!46622 () Bool)

(declare-fun mapDefault!46622 () ValueCell!14222)


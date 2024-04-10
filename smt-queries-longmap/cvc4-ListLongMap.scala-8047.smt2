; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99126 () Bool)

(assert start!99126)

(declare-fun b_free!24731 () Bool)

(declare-fun b_next!24731 () Bool)

(assert (=> start!99126 (= b_free!24731 (not b_next!24731))))

(declare-fun tp!86904 () Bool)

(declare-fun b_and!40311 () Bool)

(assert (=> start!99126 (= tp!86904 b_and!40311)))

(declare-fun b!1166232 () Bool)

(declare-fun e!662935 () Bool)

(declare-fun e!662937 () Bool)

(assert (=> b!1166232 (= e!662935 (not e!662937))))

(declare-fun res!773536 () Bool)

(assert (=> b!1166232 (=> res!773536 e!662937)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166232 (= res!773536 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75353 0))(
  ( (array!75354 (arr!36327 (Array (_ BitVec 32) (_ BitVec 64))) (size!36863 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75353)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166232 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38484 0))(
  ( (Unit!38485) )
))
(declare-fun lt!525172 () Unit!38484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75353 (_ BitVec 64) (_ BitVec 32)) Unit!38484)

(assert (=> b!1166232 (= lt!525172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1166233 () Bool)

(declare-fun e!662931 () Bool)

(declare-fun e!662932 () Bool)

(declare-fun mapRes!45716 () Bool)

(assert (=> b!1166233 (= e!662931 (and e!662932 mapRes!45716))))

(declare-fun condMapEmpty!45716 () Bool)

(declare-datatypes ((V!44141 0))(
  ( (V!44142 (val!14687 Int)) )
))
(declare-datatypes ((ValueCell!13921 0))(
  ( (ValueCellFull!13921 (v!17324 V!44141)) (EmptyCell!13921) )
))
(declare-datatypes ((array!75355 0))(
  ( (array!75356 (arr!36328 (Array (_ BitVec 32) ValueCell!13921)) (size!36864 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75355)

(declare-fun mapDefault!45716 () ValueCell!13921)


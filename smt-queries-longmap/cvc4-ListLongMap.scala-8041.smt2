; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99090 () Bool)

(assert start!99090)

(declare-fun b_free!24695 () Bool)

(declare-fun b_next!24695 () Bool)

(assert (=> start!99090 (= b_free!24695 (not b_next!24695))))

(declare-fun tp!86796 () Bool)

(declare-fun b_and!40239 () Bool)

(assert (=> start!99090 (= tp!86796 b_and!40239)))

(declare-fun b!1165414 () Bool)

(declare-fun e!662529 () Bool)

(declare-fun e!662526 () Bool)

(assert (=> b!1165414 (= e!662529 (not e!662526))))

(declare-fun res!772919 () Bool)

(assert (=> b!1165414 (=> res!772919 e!662526)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165414 (= res!772919 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75281 0))(
  ( (array!75282 (arr!36291 (Array (_ BitVec 32) (_ BitVec 64))) (size!36827 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75281)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165414 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38456 0))(
  ( (Unit!38457) )
))
(declare-fun lt!524907 () Unit!38456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75281 (_ BitVec 64) (_ BitVec 32)) Unit!38456)

(assert (=> b!1165414 (= lt!524907 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1165415 () Bool)

(declare-fun res!772916 () Bool)

(declare-fun e!662527 () Bool)

(assert (=> b!1165415 (=> (not res!772916) (not e!662527))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75281 (_ BitVec 32)) Bool)

(assert (=> b!1165415 (= res!772916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165416 () Bool)

(declare-fun e!662531 () Bool)

(declare-fun e!662532 () Bool)

(declare-fun mapRes!45662 () Bool)

(assert (=> b!1165416 (= e!662531 (and e!662532 mapRes!45662))))

(declare-fun condMapEmpty!45662 () Bool)

(declare-datatypes ((V!44093 0))(
  ( (V!44094 (val!14669 Int)) )
))
(declare-datatypes ((ValueCell!13903 0))(
  ( (ValueCellFull!13903 (v!17306 V!44093)) (EmptyCell!13903) )
))
(declare-datatypes ((array!75283 0))(
  ( (array!75284 (arr!36292 (Array (_ BitVec 32) ValueCell!13903)) (size!36828 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75283)

(declare-fun mapDefault!45662 () ValueCell!13903)


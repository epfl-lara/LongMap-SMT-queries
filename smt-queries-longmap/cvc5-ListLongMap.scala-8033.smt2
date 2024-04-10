; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99038 () Bool)

(assert start!99038)

(declare-fun b_free!24643 () Bool)

(declare-fun b_next!24643 () Bool)

(assert (=> start!99038 (= b_free!24643 (not b_next!24643))))

(declare-fun tp!86639 () Bool)

(declare-fun b_and!40135 () Bool)

(assert (=> start!99038 (= tp!86639 b_and!40135)))

(declare-fun b!1164270 () Bool)

(declare-fun e!661986 () Bool)

(declare-fun e!661984 () Bool)

(assert (=> b!1164270 (= e!661986 (not e!661984))))

(declare-fun res!772058 () Bool)

(assert (=> b!1164270 (=> res!772058 e!661984)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164270 (= res!772058 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75181 0))(
  ( (array!75182 (arr!36241 (Array (_ BitVec 32) (_ BitVec 64))) (size!36777 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75181)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164270 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38428 0))(
  ( (Unit!38429) )
))
(declare-fun lt!524594 () Unit!38428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75181 (_ BitVec 64) (_ BitVec 32)) Unit!38428)

(assert (=> b!1164270 (= lt!524594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1164271 () Bool)

(declare-fun e!661982 () Bool)

(declare-fun e!661983 () Bool)

(declare-fun mapRes!45584 () Bool)

(assert (=> b!1164271 (= e!661982 (and e!661983 mapRes!45584))))

(declare-fun condMapEmpty!45584 () Bool)

(declare-datatypes ((V!44025 0))(
  ( (V!44026 (val!14643 Int)) )
))
(declare-datatypes ((ValueCell!13877 0))(
  ( (ValueCellFull!13877 (v!17280 V!44025)) (EmptyCell!13877) )
))
(declare-datatypes ((array!75183 0))(
  ( (array!75184 (arr!36242 (Array (_ BitVec 32) ValueCell!13877)) (size!36778 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75183)

(declare-fun mapDefault!45584 () ValueCell!13877)


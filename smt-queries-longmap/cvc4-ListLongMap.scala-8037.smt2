; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99066 () Bool)

(assert start!99066)

(declare-fun b_free!24671 () Bool)

(declare-fun b_next!24671 () Bool)

(assert (=> start!99066 (= b_free!24671 (not b_next!24671))))

(declare-fun tp!86723 () Bool)

(declare-fun b_and!40191 () Bool)

(assert (=> start!99066 (= tp!86723 b_and!40191)))

(declare-fun b!1164886 () Bool)

(declare-fun e!662275 () Bool)

(declare-fun e!662279 () Bool)

(assert (=> b!1164886 (= e!662275 e!662279)))

(declare-fun res!772521 () Bool)

(assert (=> b!1164886 (=> (not res!772521) (not e!662279))))

(declare-datatypes ((array!75233 0))(
  ( (array!75234 (arr!36267 (Array (_ BitVec 32) (_ BitVec 64))) (size!36803 (_ BitVec 32))) )
))
(declare-fun lt!524762 () array!75233)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75233 (_ BitVec 32)) Bool)

(assert (=> b!1164886 (= res!772521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524762 mask!1564))))

(declare-fun _keys!1208 () array!75233)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164886 (= lt!524762 (array!75234 (store (arr!36267 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36803 _keys!1208)))))

(declare-fun b!1164887 () Bool)

(declare-fun res!772526 () Bool)

(assert (=> b!1164887 (=> (not res!772526) (not e!662275))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44061 0))(
  ( (V!44062 (val!14657 Int)) )
))
(declare-datatypes ((ValueCell!13891 0))(
  ( (ValueCellFull!13891 (v!17294 V!44061)) (EmptyCell!13891) )
))
(declare-datatypes ((array!75235 0))(
  ( (array!75236 (arr!36268 (Array (_ BitVec 32) ValueCell!13891)) (size!36804 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75235)

(assert (=> b!1164887 (= res!772526 (and (= (size!36804 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36803 _keys!1208) (size!36804 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164888 () Bool)

(declare-fun res!772522 () Bool)

(assert (=> b!1164888 (=> (not res!772522) (not e!662279))))

(declare-datatypes ((List!25425 0))(
  ( (Nil!25422) (Cons!25421 (h!26630 (_ BitVec 64)) (t!37088 List!25425)) )
))
(declare-fun arrayNoDuplicates!0 (array!75233 (_ BitVec 32) List!25425) Bool)

(assert (=> b!1164888 (= res!772522 (arrayNoDuplicates!0 lt!524762 #b00000000000000000000000000000000 Nil!25422))))

(declare-fun b!1164890 () Bool)

(declare-fun e!662280 () Bool)

(assert (=> b!1164890 (= e!662279 (not e!662280))))

(declare-fun res!772519 () Bool)

(assert (=> b!1164890 (=> res!772519 e!662280)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1164890 (= res!772519 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164890 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38442 0))(
  ( (Unit!38443) )
))
(declare-fun lt!524761 () Unit!38442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75233 (_ BitVec 64) (_ BitVec 32)) Unit!38442)

(assert (=> b!1164890 (= lt!524761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1164891 () Bool)

(declare-fun res!772516 () Bool)

(assert (=> b!1164891 (=> (not res!772516) (not e!662275))))

(assert (=> b!1164891 (= res!772516 (= (select (arr!36267 _keys!1208) i!673) k!934))))

(declare-fun b!1164892 () Bool)

(declare-fun e!662274 () Bool)

(declare-fun e!662277 () Bool)

(declare-fun mapRes!45626 () Bool)

(assert (=> b!1164892 (= e!662274 (and e!662277 mapRes!45626))))

(declare-fun condMapEmpty!45626 () Bool)

(declare-fun mapDefault!45626 () ValueCell!13891)


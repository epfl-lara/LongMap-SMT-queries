; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97818 () Bool)

(assert start!97818)

(declare-fun b_free!23519 () Bool)

(declare-fun b_next!23519 () Bool)

(assert (=> start!97818 (= b_free!23519 (not b_next!23519))))

(declare-fun tp!83260 () Bool)

(declare-fun b_and!37821 () Bool)

(assert (=> start!97818 (= tp!83260 b_and!37821)))

(declare-fun b!1119342 () Bool)

(declare-fun res!747687 () Bool)

(declare-fun e!637487 () Bool)

(assert (=> b!1119342 (=> (not res!747687) (not e!637487))))

(declare-datatypes ((array!72983 0))(
  ( (array!72984 (arr!35144 (Array (_ BitVec 32) (_ BitVec 64))) (size!35680 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72983)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42525 0))(
  ( (V!42526 (val!14081 Int)) )
))
(declare-datatypes ((ValueCell!13315 0))(
  ( (ValueCellFull!13315 (v!16714 V!42525)) (EmptyCell!13315) )
))
(declare-datatypes ((array!72985 0))(
  ( (array!72986 (arr!35145 (Array (_ BitVec 32) ValueCell!13315)) (size!35681 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72985)

(assert (=> b!1119342 (= res!747687 (and (= (size!35681 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35680 _keys!1208) (size!35681 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119343 () Bool)

(declare-fun e!637488 () Bool)

(declare-fun e!637485 () Bool)

(assert (=> b!1119343 (= e!637488 (not e!637485))))

(declare-fun res!747686 () Bool)

(assert (=> b!1119343 (=> res!747686 e!637485)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119343 (= res!747686 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119343 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36734 0))(
  ( (Unit!36735) )
))
(declare-fun lt!497729 () Unit!36734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72983 (_ BitVec 64) (_ BitVec 32)) Unit!36734)

(assert (=> b!1119343 (= lt!497729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1119344 () Bool)

(declare-fun e!637491 () Bool)

(declare-fun e!637489 () Bool)

(declare-fun mapRes!43891 () Bool)

(assert (=> b!1119344 (= e!637491 (and e!637489 mapRes!43891))))

(declare-fun condMapEmpty!43891 () Bool)

(declare-fun mapDefault!43891 () ValueCell!13315)


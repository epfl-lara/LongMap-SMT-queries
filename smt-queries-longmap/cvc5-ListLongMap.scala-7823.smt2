; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97682 () Bool)

(assert start!97682)

(declare-fun b!1116537 () Bool)

(declare-fun e!636139 () Bool)

(assert (=> b!1116537 (= e!636139 (not true))))

(declare-datatypes ((array!72723 0))(
  ( (array!72724 (arr!35014 (Array (_ BitVec 32) (_ BitVec 64))) (size!35550 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72723)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116537 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36642 0))(
  ( (Unit!36643) )
))
(declare-fun lt!497149 () Unit!36642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72723 (_ BitVec 64) (_ BitVec 32)) Unit!36642)

(assert (=> b!1116537 (= lt!497149 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1116538 () Bool)

(declare-fun res!745522 () Bool)

(declare-fun e!636138 () Bool)

(assert (=> b!1116538 (=> (not res!745522) (not e!636138))))

(assert (=> b!1116538 (= res!745522 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35550 _keys!1208))))))

(declare-fun b!1116539 () Bool)

(declare-fun e!636137 () Bool)

(declare-fun tp_is_empty!27913 () Bool)

(assert (=> b!1116539 (= e!636137 tp_is_empty!27913)))

(declare-fun b!1116540 () Bool)

(declare-fun e!636140 () Bool)

(declare-fun e!636141 () Bool)

(declare-fun mapRes!43687 () Bool)

(assert (=> b!1116540 (= e!636140 (and e!636141 mapRes!43687))))

(declare-fun condMapEmpty!43687 () Bool)

(declare-datatypes ((V!42345 0))(
  ( (V!42346 (val!14013 Int)) )
))
(declare-datatypes ((ValueCell!13247 0))(
  ( (ValueCellFull!13247 (v!16646 V!42345)) (EmptyCell!13247) )
))
(declare-datatypes ((array!72725 0))(
  ( (array!72726 (arr!35015 (Array (_ BitVec 32) ValueCell!13247)) (size!35551 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72725)

(declare-fun mapDefault!43687 () ValueCell!13247)


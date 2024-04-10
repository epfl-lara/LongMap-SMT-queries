; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97742 () Bool)

(assert start!97742)

(declare-fun b_free!23443 () Bool)

(declare-fun b_next!23443 () Bool)

(assert (=> start!97742 (= b_free!23443 (not b_next!23443))))

(declare-fun tp!83033 () Bool)

(declare-fun b_and!37717 () Bool)

(assert (=> start!97742 (= tp!83033 b_and!37717)))

(declare-fun b!1117718 () Bool)

(declare-fun e!636690 () Bool)

(declare-fun e!636693 () Bool)

(assert (=> b!1117718 (= e!636690 (not e!636693))))

(declare-fun res!746426 () Bool)

(assert (=> b!1117718 (=> res!746426 e!636693)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117718 (= res!746426 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72837 0))(
  ( (array!72838 (arr!35071 (Array (_ BitVec 32) (_ BitVec 64))) (size!35607 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72837)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117718 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36680 0))(
  ( (Unit!36681) )
))
(declare-fun lt!497342 () Unit!36680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72837 (_ BitVec 64) (_ BitVec 32)) Unit!36680)

(assert (=> b!1117718 (= lt!497342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1117720 () Bool)

(declare-fun res!746429 () Bool)

(assert (=> b!1117720 (=> (not res!746429) (not e!636690))))

(declare-fun lt!497341 () array!72837)

(declare-datatypes ((List!24394 0))(
  ( (Nil!24391) (Cons!24390 (h!25599 (_ BitVec 64)) (t!34875 List!24394)) )
))
(declare-fun arrayNoDuplicates!0 (array!72837 (_ BitVec 32) List!24394) Bool)

(assert (=> b!1117720 (= res!746429 (arrayNoDuplicates!0 lt!497341 #b00000000000000000000000000000000 Nil!24391))))

(declare-fun b!1117721 () Bool)

(declare-fun res!746431 () Bool)

(declare-fun e!636687 () Bool)

(assert (=> b!1117721 (=> (not res!746431) (not e!636687))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72837 (_ BitVec 32)) Bool)

(assert (=> b!1117721 (= res!746431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117722 () Bool)

(declare-fun e!636692 () Bool)

(declare-fun e!636689 () Bool)

(declare-fun mapRes!43777 () Bool)

(assert (=> b!1117722 (= e!636692 (and e!636689 mapRes!43777))))

(declare-fun condMapEmpty!43777 () Bool)

(declare-datatypes ((V!42425 0))(
  ( (V!42426 (val!14043 Int)) )
))
(declare-datatypes ((ValueCell!13277 0))(
  ( (ValueCellFull!13277 (v!16676 V!42425)) (EmptyCell!13277) )
))
(declare-datatypes ((array!72839 0))(
  ( (array!72840 (arr!35072 (Array (_ BitVec 32) ValueCell!13277)) (size!35608 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72839)

(declare-fun mapDefault!43777 () ValueCell!13277)


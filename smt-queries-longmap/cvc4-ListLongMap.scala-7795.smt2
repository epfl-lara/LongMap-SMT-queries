; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97518 () Bool)

(assert start!97518)

(declare-fun b!1113339 () Bool)

(declare-fun e!634662 () Bool)

(assert (=> b!1113339 (= e!634662 (not true))))

(declare-datatypes ((array!72407 0))(
  ( (array!72408 (arr!34856 (Array (_ BitVec 32) (_ BitVec 64))) (size!35392 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72407)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113339 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36534 0))(
  ( (Unit!36535) )
))
(declare-fun lt!496658 () Unit!36534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72407 (_ BitVec 64) (_ BitVec 32)) Unit!36534)

(assert (=> b!1113339 (= lt!496658 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113340 () Bool)

(declare-fun e!634663 () Bool)

(assert (=> b!1113340 (= e!634663 e!634662)))

(declare-fun res!743061 () Bool)

(assert (=> b!1113340 (=> (not res!743061) (not e!634662))))

(declare-fun lt!496657 () array!72407)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72407 (_ BitVec 32)) Bool)

(assert (=> b!1113340 (= res!743061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496657 mask!1564))))

(assert (=> b!1113340 (= lt!496657 (array!72408 (store (arr!34856 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35392 _keys!1208)))))

(declare-fun b!1113341 () Bool)

(declare-fun res!743054 () Bool)

(assert (=> b!1113341 (=> (not res!743054) (not e!634663))))

(assert (=> b!1113341 (= res!743054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113342 () Bool)

(declare-fun e!634665 () Bool)

(declare-fun e!634660 () Bool)

(declare-fun mapRes!43441 () Bool)

(assert (=> b!1113342 (= e!634665 (and e!634660 mapRes!43441))))

(declare-fun condMapEmpty!43441 () Bool)

(declare-datatypes ((V!42125 0))(
  ( (V!42126 (val!13931 Int)) )
))
(declare-datatypes ((ValueCell!13165 0))(
  ( (ValueCellFull!13165 (v!16564 V!42125)) (EmptyCell!13165) )
))
(declare-datatypes ((array!72409 0))(
  ( (array!72410 (arr!34857 (Array (_ BitVec 32) ValueCell!13165)) (size!35393 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72409)

(declare-fun mapDefault!43441 () ValueCell!13165)


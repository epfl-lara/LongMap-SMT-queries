; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97550 () Bool)

(assert start!97550)

(declare-fun b!1113963 () Bool)

(declare-fun e!634949 () Bool)

(assert (=> b!1113963 (= e!634949 (not true))))

(declare-datatypes ((array!72469 0))(
  ( (array!72470 (arr!34887 (Array (_ BitVec 32) (_ BitVec 64))) (size!35423 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72469)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113963 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36560 0))(
  ( (Unit!36561) )
))
(declare-fun lt!496754 () Unit!36560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72469 (_ BitVec 64) (_ BitVec 32)) Unit!36560)

(assert (=> b!1113963 (= lt!496754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113964 () Bool)

(declare-fun res!743542 () Bool)

(assert (=> b!1113964 (=> (not res!743542) (not e!634949))))

(declare-fun lt!496753 () array!72469)

(declare-datatypes ((List!24319 0))(
  ( (Nil!24316) (Cons!24315 (h!25524 (_ BitVec 64)) (t!34800 List!24319)) )
))
(declare-fun arrayNoDuplicates!0 (array!72469 (_ BitVec 32) List!24319) Bool)

(assert (=> b!1113964 (= res!743542 (arrayNoDuplicates!0 lt!496753 #b00000000000000000000000000000000 Nil!24316))))

(declare-fun b!1113965 () Bool)

(declare-fun res!743537 () Bool)

(declare-fun e!634953 () Bool)

(assert (=> b!1113965 (=> (not res!743537) (not e!634953))))

(assert (=> b!1113965 (= res!743537 (= (select (arr!34887 _keys!1208) i!673) k!934))))

(declare-fun b!1113966 () Bool)

(declare-fun e!634950 () Bool)

(declare-fun e!634948 () Bool)

(declare-fun mapRes!43489 () Bool)

(assert (=> b!1113966 (= e!634950 (and e!634948 mapRes!43489))))

(declare-fun condMapEmpty!43489 () Bool)

(declare-datatypes ((V!42169 0))(
  ( (V!42170 (val!13947 Int)) )
))
(declare-datatypes ((ValueCell!13181 0))(
  ( (ValueCellFull!13181 (v!16580 V!42169)) (EmptyCell!13181) )
))
(declare-datatypes ((array!72471 0))(
  ( (array!72472 (arr!34888 (Array (_ BitVec 32) ValueCell!13181)) (size!35424 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72471)

(declare-fun mapDefault!43489 () ValueCell!13181)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97524 () Bool)

(assert start!97524)

(declare-fun b!1113456 () Bool)

(declare-fun res!743148 () Bool)

(declare-fun e!634717 () Bool)

(assert (=> b!1113456 (=> (not res!743148) (not e!634717))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113456 (= res!743148 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!43450 () Bool)

(declare-fun mapRes!43450 () Bool)

(assert (=> mapIsEmpty!43450 mapRes!43450))

(declare-fun b!1113457 () Bool)

(declare-fun res!743147 () Bool)

(assert (=> b!1113457 (=> (not res!743147) (not e!634717))))

(declare-datatypes ((array!72417 0))(
  ( (array!72418 (arr!34861 (Array (_ BitVec 32) (_ BitVec 64))) (size!35397 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72417)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113457 (= res!743147 (= (select (arr!34861 _keys!1208) i!673) k!934))))

(declare-fun b!1113458 () Bool)

(declare-fun res!743143 () Bool)

(declare-fun e!634718 () Bool)

(assert (=> b!1113458 (=> (not res!743143) (not e!634718))))

(declare-fun lt!496675 () array!72417)

(declare-datatypes ((List!24310 0))(
  ( (Nil!24307) (Cons!24306 (h!25515 (_ BitVec 64)) (t!34791 List!24310)) )
))
(declare-fun arrayNoDuplicates!0 (array!72417 (_ BitVec 32) List!24310) Bool)

(assert (=> b!1113458 (= res!743143 (arrayNoDuplicates!0 lt!496675 #b00000000000000000000000000000000 Nil!24307))))

(declare-fun b!1113459 () Bool)

(declare-fun res!743146 () Bool)

(assert (=> b!1113459 (=> (not res!743146) (not e!634717))))

(assert (=> b!1113459 (= res!743146 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35397 _keys!1208))))))

(declare-fun b!1113460 () Bool)

(declare-fun res!743151 () Bool)

(assert (=> b!1113460 (=> (not res!743151) (not e!634717))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113460 (= res!743151 (validMask!0 mask!1564))))

(declare-fun b!1113461 () Bool)

(declare-fun e!634714 () Bool)

(declare-fun tp_is_empty!27755 () Bool)

(assert (=> b!1113461 (= e!634714 tp_is_empty!27755)))

(declare-fun b!1113462 () Bool)

(assert (=> b!1113462 (= e!634718 (not true))))

(declare-fun arrayContainsKey!0 (array!72417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113462 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36538 0))(
  ( (Unit!36539) )
))
(declare-fun lt!496676 () Unit!36538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72417 (_ BitVec 64) (_ BitVec 32)) Unit!36538)

(assert (=> b!1113462 (= lt!496676 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113463 () Bool)

(declare-fun e!634715 () Bool)

(assert (=> b!1113463 (= e!634715 tp_is_empty!27755)))

(declare-fun mapNonEmpty!43450 () Bool)

(declare-fun tp!82694 () Bool)

(assert (=> mapNonEmpty!43450 (= mapRes!43450 (and tp!82694 e!634715))))

(declare-fun mapKey!43450 () (_ BitVec 32))

(declare-datatypes ((V!42133 0))(
  ( (V!42134 (val!13934 Int)) )
))
(declare-datatypes ((ValueCell!13168 0))(
  ( (ValueCellFull!13168 (v!16567 V!42133)) (EmptyCell!13168) )
))
(declare-fun mapValue!43450 () ValueCell!13168)

(declare-datatypes ((array!72419 0))(
  ( (array!72420 (arr!34862 (Array (_ BitVec 32) ValueCell!13168)) (size!35398 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72419)

(declare-fun mapRest!43450 () (Array (_ BitVec 32) ValueCell!13168))

(assert (=> mapNonEmpty!43450 (= (arr!34862 _values!996) (store mapRest!43450 mapKey!43450 mapValue!43450))))

(declare-fun res!743144 () Bool)

(assert (=> start!97524 (=> (not res!743144) (not e!634717))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97524 (= res!743144 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35397 _keys!1208))))))

(assert (=> start!97524 e!634717))

(declare-fun array_inv!26800 (array!72417) Bool)

(assert (=> start!97524 (array_inv!26800 _keys!1208)))

(assert (=> start!97524 true))

(declare-fun e!634716 () Bool)

(declare-fun array_inv!26801 (array!72419) Bool)

(assert (=> start!97524 (and (array_inv!26801 _values!996) e!634716)))

(declare-fun b!1113464 () Bool)

(assert (=> b!1113464 (= e!634716 (and e!634714 mapRes!43450))))

(declare-fun condMapEmpty!43450 () Bool)

(declare-fun mapDefault!43450 () ValueCell!13168)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97608 () Bool)

(assert start!97608)

(declare-fun b!1115094 () Bool)

(declare-fun e!635475 () Bool)

(declare-fun tp_is_empty!27839 () Bool)

(assert (=> b!1115094 (= e!635475 tp_is_empty!27839)))

(declare-fun b!1115095 () Bool)

(declare-fun res!744412 () Bool)

(declare-fun e!635470 () Bool)

(assert (=> b!1115095 (=> (not res!744412) (not e!635470))))

(declare-datatypes ((array!72581 0))(
  ( (array!72582 (arr!34943 (Array (_ BitVec 32) (_ BitVec 64))) (size!35479 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72581)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72581 (_ BitVec 32)) Bool)

(assert (=> b!1115095 (= res!744412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115096 () Bool)

(declare-fun res!744407 () Bool)

(assert (=> b!1115096 (=> (not res!744407) (not e!635470))))

(declare-datatypes ((List!24341 0))(
  ( (Nil!24338) (Cons!24337 (h!25546 (_ BitVec 64)) (t!34822 List!24341)) )
))
(declare-fun arrayNoDuplicates!0 (array!72581 (_ BitVec 32) List!24341) Bool)

(assert (=> b!1115096 (= res!744407 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24338))))

(declare-fun res!744405 () Bool)

(assert (=> start!97608 (=> (not res!744405) (not e!635470))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97608 (= res!744405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35479 _keys!1208))))))

(assert (=> start!97608 e!635470))

(declare-fun array_inv!26864 (array!72581) Bool)

(assert (=> start!97608 (array_inv!26864 _keys!1208)))

(assert (=> start!97608 true))

(declare-datatypes ((V!42245 0))(
  ( (V!42246 (val!13976 Int)) )
))
(declare-datatypes ((ValueCell!13210 0))(
  ( (ValueCellFull!13210 (v!16609 V!42245)) (EmptyCell!13210) )
))
(declare-datatypes ((array!72583 0))(
  ( (array!72584 (arr!34944 (Array (_ BitVec 32) ValueCell!13210)) (size!35480 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72583)

(declare-fun e!635474 () Bool)

(declare-fun array_inv!26865 (array!72583) Bool)

(assert (=> start!97608 (and (array_inv!26865 _values!996) e!635474)))

(declare-fun b!1115097 () Bool)

(declare-fun e!635471 () Bool)

(assert (=> b!1115097 (= e!635471 tp_is_empty!27839)))

(declare-fun b!1115098 () Bool)

(declare-fun e!635472 () Bool)

(assert (=> b!1115098 (= e!635472 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115098 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36600 0))(
  ( (Unit!36601) )
))
(declare-fun lt!496927 () Unit!36600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72581 (_ BitVec 64) (_ BitVec 32)) Unit!36600)

(assert (=> b!1115098 (= lt!496927 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1115099 () Bool)

(declare-fun res!744410 () Bool)

(assert (=> b!1115099 (=> (not res!744410) (not e!635470))))

(assert (=> b!1115099 (= res!744410 (= (select (arr!34943 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43576 () Bool)

(declare-fun mapRes!43576 () Bool)

(assert (=> mapIsEmpty!43576 mapRes!43576))

(declare-fun b!1115100 () Bool)

(assert (=> b!1115100 (= e!635474 (and e!635475 mapRes!43576))))

(declare-fun condMapEmpty!43576 () Bool)

(declare-fun mapDefault!43576 () ValueCell!13210)


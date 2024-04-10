; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97596 () Bool)

(assert start!97596)

(declare-fun b!1114860 () Bool)

(declare-fun e!635366 () Bool)

(declare-fun e!635362 () Bool)

(assert (=> b!1114860 (= e!635366 e!635362)))

(declare-fun res!744223 () Bool)

(assert (=> b!1114860 (=> (not res!744223) (not e!635362))))

(declare-datatypes ((array!72559 0))(
  ( (array!72560 (arr!34932 (Array (_ BitVec 32) (_ BitVec 64))) (size!35468 (_ BitVec 32))) )
))
(declare-fun lt!496891 () array!72559)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72559 (_ BitVec 32)) Bool)

(assert (=> b!1114860 (= res!744223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496891 mask!1564))))

(declare-fun _keys!1208 () array!72559)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114860 (= lt!496891 (array!72560 (store (arr!34932 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35468 _keys!1208)))))

(declare-fun b!1114861 () Bool)

(assert (=> b!1114861 (= e!635362 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114861 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36590 0))(
  ( (Unit!36591) )
))
(declare-fun lt!496892 () Unit!36590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72559 (_ BitVec 64) (_ BitVec 32)) Unit!36590)

(assert (=> b!1114861 (= lt!496892 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43558 () Bool)

(declare-fun mapRes!43558 () Bool)

(assert (=> mapIsEmpty!43558 mapRes!43558))

(declare-fun b!1114862 () Bool)

(declare-fun e!635364 () Bool)

(declare-fun tp_is_empty!27827 () Bool)

(assert (=> b!1114862 (= e!635364 tp_is_empty!27827)))

(declare-fun b!1114863 () Bool)

(declare-fun res!744232 () Bool)

(assert (=> b!1114863 (=> (not res!744232) (not e!635366))))

(assert (=> b!1114863 (= res!744232 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35468 _keys!1208))))))

(declare-fun b!1114864 () Bool)

(declare-fun e!635367 () Bool)

(assert (=> b!1114864 (= e!635367 tp_is_empty!27827)))

(declare-fun res!744231 () Bool)

(assert (=> start!97596 (=> (not res!744231) (not e!635366))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97596 (= res!744231 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35468 _keys!1208))))))

(assert (=> start!97596 e!635366))

(declare-fun array_inv!26854 (array!72559) Bool)

(assert (=> start!97596 (array_inv!26854 _keys!1208)))

(assert (=> start!97596 true))

(declare-datatypes ((V!42229 0))(
  ( (V!42230 (val!13970 Int)) )
))
(declare-datatypes ((ValueCell!13204 0))(
  ( (ValueCellFull!13204 (v!16603 V!42229)) (EmptyCell!13204) )
))
(declare-datatypes ((array!72561 0))(
  ( (array!72562 (arr!34933 (Array (_ BitVec 32) ValueCell!13204)) (size!35469 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72561)

(declare-fun e!635363 () Bool)

(declare-fun array_inv!26855 (array!72561) Bool)

(assert (=> start!97596 (and (array_inv!26855 _values!996) e!635363)))

(declare-fun b!1114865 () Bool)

(assert (=> b!1114865 (= e!635363 (and e!635364 mapRes!43558))))

(declare-fun condMapEmpty!43558 () Bool)

(declare-fun mapDefault!43558 () ValueCell!13204)


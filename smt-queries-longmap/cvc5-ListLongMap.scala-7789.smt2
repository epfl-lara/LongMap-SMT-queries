; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97478 () Bool)

(assert start!97478)

(declare-fun b!1112559 () Bool)

(declare-fun res!742462 () Bool)

(declare-fun e!634303 () Bool)

(assert (=> b!1112559 (=> (not res!742462) (not e!634303))))

(declare-datatypes ((array!72331 0))(
  ( (array!72332 (arr!34818 (Array (_ BitVec 32) (_ BitVec 64))) (size!35354 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72331)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42073 0))(
  ( (V!42074 (val!13911 Int)) )
))
(declare-datatypes ((ValueCell!13145 0))(
  ( (ValueCellFull!13145 (v!16544 V!42073)) (EmptyCell!13145) )
))
(declare-datatypes ((array!72333 0))(
  ( (array!72334 (arr!34819 (Array (_ BitVec 32) ValueCell!13145)) (size!35355 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72333)

(assert (=> b!1112559 (= res!742462 (and (= (size!35355 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35354 _keys!1208) (size!35355 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112560 () Bool)

(declare-fun e!634301 () Bool)

(declare-fun tp_is_empty!27709 () Bool)

(assert (=> b!1112560 (= e!634301 tp_is_empty!27709)))

(declare-fun b!1112561 () Bool)

(declare-fun e!634300 () Bool)

(assert (=> b!1112561 (= e!634303 e!634300)))

(declare-fun res!742460 () Bool)

(assert (=> b!1112561 (=> (not res!742460) (not e!634300))))

(declare-fun lt!496537 () array!72331)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72331 (_ BitVec 32)) Bool)

(assert (=> b!1112561 (= res!742460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496537 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112561 (= lt!496537 (array!72332 (store (arr!34818 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35354 _keys!1208)))))

(declare-fun b!1112562 () Bool)

(declare-fun res!742461 () Bool)

(assert (=> b!1112562 (=> (not res!742461) (not e!634300))))

(declare-datatypes ((List!24293 0))(
  ( (Nil!24290) (Cons!24289 (h!25498 (_ BitVec 64)) (t!34774 List!24293)) )
))
(declare-fun arrayNoDuplicates!0 (array!72331 (_ BitVec 32) List!24293) Bool)

(assert (=> b!1112562 (= res!742461 (arrayNoDuplicates!0 lt!496537 #b00000000000000000000000000000000 Nil!24290))))

(declare-fun b!1112563 () Bool)

(declare-fun res!742455 () Bool)

(assert (=> b!1112563 (=> (not res!742455) (not e!634303))))

(assert (=> b!1112563 (= res!742455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!742458 () Bool)

(assert (=> start!97478 (=> (not res!742458) (not e!634303))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97478 (= res!742458 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35354 _keys!1208))))))

(assert (=> start!97478 e!634303))

(declare-fun array_inv!26776 (array!72331) Bool)

(assert (=> start!97478 (array_inv!26776 _keys!1208)))

(assert (=> start!97478 true))

(declare-fun e!634302 () Bool)

(declare-fun array_inv!26777 (array!72333) Bool)

(assert (=> start!97478 (and (array_inv!26777 _values!996) e!634302)))

(declare-fun b!1112564 () Bool)

(declare-fun mapRes!43381 () Bool)

(assert (=> b!1112564 (= e!634302 (and e!634301 mapRes!43381))))

(declare-fun condMapEmpty!43381 () Bool)

(declare-fun mapDefault!43381 () ValueCell!13145)


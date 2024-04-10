; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97572 () Bool)

(assert start!97572)

(declare-fun mapIsEmpty!43522 () Bool)

(declare-fun mapRes!43522 () Bool)

(assert (=> mapIsEmpty!43522 mapRes!43522))

(declare-fun b!1114392 () Bool)

(declare-fun e!635148 () Bool)

(declare-fun tp_is_empty!27803 () Bool)

(assert (=> b!1114392 (= e!635148 tp_is_empty!27803)))

(declare-fun b!1114393 () Bool)

(declare-fun res!743867 () Bool)

(declare-fun e!635150 () Bool)

(assert (=> b!1114393 (=> (not res!743867) (not e!635150))))

(declare-datatypes ((array!72513 0))(
  ( (array!72514 (arr!34909 (Array (_ BitVec 32) (_ BitVec 64))) (size!35445 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42197 0))(
  ( (V!42198 (val!13958 Int)) )
))
(declare-datatypes ((ValueCell!13192 0))(
  ( (ValueCellFull!13192 (v!16591 V!42197)) (EmptyCell!13192) )
))
(declare-datatypes ((array!72515 0))(
  ( (array!72516 (arr!34910 (Array (_ BitVec 32) ValueCell!13192)) (size!35446 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72515)

(assert (=> b!1114393 (= res!743867 (and (= (size!35446 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35445 _keys!1208) (size!35446 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114394 () Bool)

(declare-fun res!743864 () Bool)

(assert (=> b!1114394 (=> (not res!743864) (not e!635150))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114394 (= res!743864 (validKeyInArray!0 k!934))))

(declare-fun res!743865 () Bool)

(assert (=> start!97572 (=> (not res!743865) (not e!635150))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97572 (= res!743865 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35445 _keys!1208))))))

(assert (=> start!97572 e!635150))

(declare-fun array_inv!26834 (array!72513) Bool)

(assert (=> start!97572 (array_inv!26834 _keys!1208)))

(assert (=> start!97572 true))

(declare-fun e!635146 () Bool)

(declare-fun array_inv!26835 (array!72515) Bool)

(assert (=> start!97572 (and (array_inv!26835 _values!996) e!635146)))

(declare-fun b!1114395 () Bool)

(declare-fun res!743869 () Bool)

(assert (=> b!1114395 (=> (not res!743869) (not e!635150))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114395 (= res!743869 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35445 _keys!1208))))))

(declare-fun b!1114396 () Bool)

(assert (=> b!1114396 (= e!635146 (and e!635148 mapRes!43522))))

(declare-fun condMapEmpty!43522 () Bool)

(declare-fun mapDefault!43522 () ValueCell!13192)


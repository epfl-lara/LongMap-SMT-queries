; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97566 () Bool)

(assert start!97566)

(declare-fun mapIsEmpty!43513 () Bool)

(declare-fun mapRes!43513 () Bool)

(assert (=> mapIsEmpty!43513 mapRes!43513))

(declare-fun b!1114275 () Bool)

(declare-fun res!743780 () Bool)

(declare-fun e!635092 () Bool)

(assert (=> b!1114275 (=> (not res!743780) (not e!635092))))

(declare-datatypes ((array!72501 0))(
  ( (array!72502 (arr!34903 (Array (_ BitVec 32) (_ BitVec 64))) (size!35439 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72501)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72501 (_ BitVec 32)) Bool)

(assert (=> b!1114275 (= res!743780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114276 () Bool)

(declare-fun res!743774 () Bool)

(assert (=> b!1114276 (=> (not res!743774) (not e!635092))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42189 0))(
  ( (V!42190 (val!13955 Int)) )
))
(declare-datatypes ((ValueCell!13189 0))(
  ( (ValueCellFull!13189 (v!16588 V!42189)) (EmptyCell!13189) )
))
(declare-datatypes ((array!72503 0))(
  ( (array!72504 (arr!34904 (Array (_ BitVec 32) ValueCell!13189)) (size!35440 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72503)

(assert (=> b!1114276 (= res!743774 (and (= (size!35440 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35439 _keys!1208) (size!35440 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114277 () Bool)

(declare-fun res!743773 () Bool)

(assert (=> b!1114277 (=> (not res!743773) (not e!635092))))

(declare-datatypes ((List!24327 0))(
  ( (Nil!24324) (Cons!24323 (h!25532 (_ BitVec 64)) (t!34808 List!24327)) )
))
(declare-fun arrayNoDuplicates!0 (array!72501 (_ BitVec 32) List!24327) Bool)

(assert (=> b!1114277 (= res!743773 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24324))))

(declare-fun b!1114278 () Bool)

(declare-fun res!743775 () Bool)

(assert (=> b!1114278 (=> (not res!743775) (not e!635092))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1114278 (= res!743775 (= (select (arr!34903 _keys!1208) i!673) k!934))))

(declare-fun b!1114279 () Bool)

(declare-fun e!635096 () Bool)

(assert (=> b!1114279 (= e!635092 e!635096)))

(declare-fun res!743781 () Bool)

(assert (=> b!1114279 (=> (not res!743781) (not e!635096))))

(declare-fun lt!496802 () array!72501)

(assert (=> b!1114279 (= res!743781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496802 mask!1564))))

(assert (=> b!1114279 (= lt!496802 (array!72502 (store (arr!34903 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35439 _keys!1208)))))

(declare-fun res!743777 () Bool)

(assert (=> start!97566 (=> (not res!743777) (not e!635092))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97566 (= res!743777 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35439 _keys!1208))))))

(assert (=> start!97566 e!635092))

(declare-fun array_inv!26830 (array!72501) Bool)

(assert (=> start!97566 (array_inv!26830 _keys!1208)))

(assert (=> start!97566 true))

(declare-fun e!635094 () Bool)

(declare-fun array_inv!26831 (array!72503) Bool)

(assert (=> start!97566 (and (array_inv!26831 _values!996) e!635094)))

(declare-fun b!1114280 () Bool)

(declare-fun e!635097 () Bool)

(declare-fun tp_is_empty!27797 () Bool)

(assert (=> b!1114280 (= e!635097 tp_is_empty!27797)))

(declare-fun b!1114281 () Bool)

(declare-fun res!743778 () Bool)

(assert (=> b!1114281 (=> (not res!743778) (not e!635092))))

(assert (=> b!1114281 (= res!743778 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35439 _keys!1208))))))

(declare-fun b!1114282 () Bool)

(declare-fun e!635093 () Bool)

(assert (=> b!1114282 (= e!635093 tp_is_empty!27797)))

(declare-fun b!1114283 () Bool)

(declare-fun res!743782 () Bool)

(assert (=> b!1114283 (=> (not res!743782) (not e!635092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114283 (= res!743782 (validKeyInArray!0 k!934))))

(declare-fun b!1114284 () Bool)

(declare-fun res!743776 () Bool)

(assert (=> b!1114284 (=> (not res!743776) (not e!635096))))

(assert (=> b!1114284 (= res!743776 (arrayNoDuplicates!0 lt!496802 #b00000000000000000000000000000000 Nil!24324))))

(declare-fun b!1114285 () Bool)

(assert (=> b!1114285 (= e!635094 (and e!635093 mapRes!43513))))

(declare-fun condMapEmpty!43513 () Bool)

(declare-fun mapDefault!43513 () ValueCell!13189)


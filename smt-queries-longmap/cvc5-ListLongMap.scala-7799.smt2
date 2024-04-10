; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97538 () Bool)

(assert start!97538)

(declare-fun res!743360 () Bool)

(declare-fun e!634841 () Bool)

(assert (=> start!97538 (=> (not res!743360) (not e!634841))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72445 0))(
  ( (array!72446 (arr!34875 (Array (_ BitVec 32) (_ BitVec 64))) (size!35411 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72445)

(assert (=> start!97538 (= res!743360 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35411 _keys!1208))))))

(assert (=> start!97538 e!634841))

(declare-fun array_inv!26810 (array!72445) Bool)

(assert (=> start!97538 (array_inv!26810 _keys!1208)))

(assert (=> start!97538 true))

(declare-datatypes ((V!42153 0))(
  ( (V!42154 (val!13941 Int)) )
))
(declare-datatypes ((ValueCell!13175 0))(
  ( (ValueCellFull!13175 (v!16574 V!42153)) (EmptyCell!13175) )
))
(declare-datatypes ((array!72447 0))(
  ( (array!72448 (arr!34876 (Array (_ BitVec 32) ValueCell!13175)) (size!35412 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72447)

(declare-fun e!634842 () Bool)

(declare-fun array_inv!26811 (array!72447) Bool)

(assert (=> start!97538 (and (array_inv!26811 _values!996) e!634842)))

(declare-fun b!1113729 () Bool)

(declare-fun e!634845 () Bool)

(declare-fun tp_is_empty!27769 () Bool)

(assert (=> b!1113729 (= e!634845 tp_is_empty!27769)))

(declare-fun b!1113730 () Bool)

(declare-fun res!743354 () Bool)

(assert (=> b!1113730 (=> (not res!743354) (not e!634841))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113730 (= res!743354 (and (= (size!35412 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35411 _keys!1208) (size!35412 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113731 () Bool)

(declare-fun res!743361 () Bool)

(assert (=> b!1113731 (=> (not res!743361) (not e!634841))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113731 (= res!743361 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35411 _keys!1208))))))

(declare-fun mapIsEmpty!43471 () Bool)

(declare-fun mapRes!43471 () Bool)

(assert (=> mapIsEmpty!43471 mapRes!43471))

(declare-fun mapNonEmpty!43471 () Bool)

(declare-fun tp!82715 () Bool)

(declare-fun e!634844 () Bool)

(assert (=> mapNonEmpty!43471 (= mapRes!43471 (and tp!82715 e!634844))))

(declare-fun mapRest!43471 () (Array (_ BitVec 32) ValueCell!13175))

(declare-fun mapValue!43471 () ValueCell!13175)

(declare-fun mapKey!43471 () (_ BitVec 32))

(assert (=> mapNonEmpty!43471 (= (arr!34876 _values!996) (store mapRest!43471 mapKey!43471 mapValue!43471))))

(declare-fun b!1113732 () Bool)

(declare-fun res!743357 () Bool)

(assert (=> b!1113732 (=> (not res!743357) (not e!634841))))

(declare-datatypes ((List!24314 0))(
  ( (Nil!24311) (Cons!24310 (h!25519 (_ BitVec 64)) (t!34795 List!24314)) )
))
(declare-fun arrayNoDuplicates!0 (array!72445 (_ BitVec 32) List!24314) Bool)

(assert (=> b!1113732 (= res!743357 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24311))))

(declare-fun b!1113733 () Bool)

(assert (=> b!1113733 (= e!634844 tp_is_empty!27769)))

(declare-fun b!1113734 () Bool)

(assert (=> b!1113734 (= e!634842 (and e!634845 mapRes!43471))))

(declare-fun condMapEmpty!43471 () Bool)

(declare-fun mapDefault!43471 () ValueCell!13175)


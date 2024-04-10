; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97626 () Bool)

(assert start!97626)

(declare-fun b!1115445 () Bool)

(declare-fun e!635637 () Bool)

(declare-fun tp_is_empty!27857 () Bool)

(assert (=> b!1115445 (= e!635637 tp_is_empty!27857)))

(declare-fun b!1115446 () Bool)

(declare-fun e!635632 () Bool)

(assert (=> b!1115446 (= e!635632 tp_is_empty!27857)))

(declare-fun b!1115447 () Bool)

(declare-fun res!744681 () Bool)

(declare-fun e!635634 () Bool)

(assert (=> b!1115447 (=> (not res!744681) (not e!635634))))

(declare-datatypes ((array!72615 0))(
  ( (array!72616 (arr!34960 (Array (_ BitVec 32) (_ BitVec 64))) (size!35496 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72615)

(declare-datatypes ((List!24348 0))(
  ( (Nil!24345) (Cons!24344 (h!25553 (_ BitVec 64)) (t!34829 List!24348)) )
))
(declare-fun arrayNoDuplicates!0 (array!72615 (_ BitVec 32) List!24348) Bool)

(assert (=> b!1115447 (= res!744681 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24345))))

(declare-fun b!1115448 () Bool)

(declare-fun e!635636 () Bool)

(declare-fun mapRes!43603 () Bool)

(assert (=> b!1115448 (= e!635636 (and e!635632 mapRes!43603))))

(declare-fun condMapEmpty!43603 () Bool)

(declare-datatypes ((V!42269 0))(
  ( (V!42270 (val!13985 Int)) )
))
(declare-datatypes ((ValueCell!13219 0))(
  ( (ValueCellFull!13219 (v!16618 V!42269)) (EmptyCell!13219) )
))
(declare-datatypes ((array!72617 0))(
  ( (array!72618 (arr!34961 (Array (_ BitVec 32) ValueCell!13219)) (size!35497 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72617)

(declare-fun mapDefault!43603 () ValueCell!13219)


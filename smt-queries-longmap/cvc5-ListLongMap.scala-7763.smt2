; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97322 () Bool)

(assert start!97322)

(declare-fun b_free!23293 () Bool)

(declare-fun b_next!23293 () Bool)

(assert (=> start!97322 (= b_free!23293 (not b_next!23293))))

(declare-fun tp!82177 () Bool)

(declare-fun b_and!37419 () Bool)

(assert (=> start!97322 (= tp!82177 b_and!37419)))

(declare-fun b!1108707 () Bool)

(declare-fun res!739899 () Bool)

(declare-fun e!632462 () Bool)

(assert (=> b!1108707 (=> (not res!739899) (not e!632462))))

(declare-datatypes ((array!72023 0))(
  ( (array!72024 (arr!34664 (Array (_ BitVec 32) (_ BitVec 64))) (size!35200 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72023)

(declare-datatypes ((List!24165 0))(
  ( (Nil!24162) (Cons!24161 (h!25370 (_ BitVec 64)) (t!34504 List!24165)) )
))
(declare-fun arrayNoDuplicates!0 (array!72023 (_ BitVec 32) List!24165) Bool)

(assert (=> b!1108707 (= res!739899 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24162))))

(declare-fun b!1108708 () Bool)

(declare-fun res!739905 () Bool)

(assert (=> b!1108708 (=> (not res!739905) (not e!632462))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72023 (_ BitVec 32)) Bool)

(assert (=> b!1108708 (= res!739905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108709 () Bool)

(declare-fun e!632456 () Bool)

(declare-fun e!632463 () Bool)

(declare-fun mapRes!43147 () Bool)

(assert (=> b!1108709 (= e!632456 (and e!632463 mapRes!43147))))

(declare-fun condMapEmpty!43147 () Bool)

(declare-datatypes ((V!41865 0))(
  ( (V!41866 (val!13833 Int)) )
))
(declare-datatypes ((ValueCell!13067 0))(
  ( (ValueCellFull!13067 (v!16466 V!41865)) (EmptyCell!13067) )
))
(declare-datatypes ((array!72025 0))(
  ( (array!72026 (arr!34665 (Array (_ BitVec 32) ValueCell!13067)) (size!35201 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72025)

(declare-fun mapDefault!43147 () ValueCell!13067)


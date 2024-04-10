; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97530 () Bool)

(assert start!97530)

(declare-fun b!1113573 () Bool)

(declare-fun res!743235 () Bool)

(declare-fun e!634771 () Bool)

(assert (=> b!1113573 (=> (not res!743235) (not e!634771))))

(declare-datatypes ((array!72429 0))(
  ( (array!72430 (arr!34867 (Array (_ BitVec 32) (_ BitVec 64))) (size!35403 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72429)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1113573 (= res!743235 (= (select (arr!34867 _keys!1208) i!673) k!934))))

(declare-fun b!1113574 () Bool)

(declare-fun e!634769 () Bool)

(declare-fun tp_is_empty!27761 () Bool)

(assert (=> b!1113574 (= e!634769 tp_is_empty!27761)))

(declare-fun mapNonEmpty!43459 () Bool)

(declare-fun mapRes!43459 () Bool)

(declare-fun tp!82703 () Bool)

(declare-fun e!634770 () Bool)

(assert (=> mapNonEmpty!43459 (= mapRes!43459 (and tp!82703 e!634770))))

(declare-datatypes ((V!42141 0))(
  ( (V!42142 (val!13937 Int)) )
))
(declare-datatypes ((ValueCell!13171 0))(
  ( (ValueCellFull!13171 (v!16570 V!42141)) (EmptyCell!13171) )
))
(declare-fun mapRest!43459 () (Array (_ BitVec 32) ValueCell!13171))

(declare-fun mapKey!43459 () (_ BitVec 32))

(declare-fun mapValue!43459 () ValueCell!13171)

(declare-datatypes ((array!72431 0))(
  ( (array!72432 (arr!34868 (Array (_ BitVec 32) ValueCell!13171)) (size!35404 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72431)

(assert (=> mapNonEmpty!43459 (= (arr!34868 _values!996) (store mapRest!43459 mapKey!43459 mapValue!43459))))

(declare-fun b!1113575 () Bool)

(declare-fun res!743239 () Bool)

(assert (=> b!1113575 (=> (not res!743239) (not e!634771))))

(assert (=> b!1113575 (= res!743239 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35403 _keys!1208))))))

(declare-fun b!1113576 () Bool)

(declare-fun res!743233 () Bool)

(assert (=> b!1113576 (=> (not res!743233) (not e!634771))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113576 (= res!743233 (and (= (size!35404 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35403 _keys!1208) (size!35404 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113577 () Bool)

(declare-fun e!634768 () Bool)

(assert (=> b!1113577 (= e!634768 (and e!634769 mapRes!43459))))

(declare-fun condMapEmpty!43459 () Bool)

(declare-fun mapDefault!43459 () ValueCell!13171)


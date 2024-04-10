; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97508 () Bool)

(assert start!97508)

(declare-fun b!1113144 () Bool)

(declare-fun res!742905 () Bool)

(declare-fun e!634570 () Bool)

(assert (=> b!1113144 (=> (not res!742905) (not e!634570))))

(declare-datatypes ((array!72387 0))(
  ( (array!72388 (arr!34846 (Array (_ BitVec 32) (_ BitVec 64))) (size!35382 (_ BitVec 32))) )
))
(declare-fun lt!496627 () array!72387)

(declare-datatypes ((List!24305 0))(
  ( (Nil!24302) (Cons!24301 (h!25510 (_ BitVec 64)) (t!34786 List!24305)) )
))
(declare-fun arrayNoDuplicates!0 (array!72387 (_ BitVec 32) List!24305) Bool)

(assert (=> b!1113144 (= res!742905 (arrayNoDuplicates!0 lt!496627 #b00000000000000000000000000000000 Nil!24302))))

(declare-fun b!1113145 () Bool)

(declare-fun res!742911 () Bool)

(declare-fun e!634573 () Bool)

(assert (=> b!1113145 (=> (not res!742911) (not e!634573))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113145 (= res!742911 (validMask!0 mask!1564))))

(declare-fun b!1113146 () Bool)

(declare-fun res!742909 () Bool)

(assert (=> b!1113146 (=> (not res!742909) (not e!634573))))

(declare-fun _keys!1208 () array!72387)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72387 (_ BitVec 32)) Bool)

(assert (=> b!1113146 (= res!742909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113147 () Bool)

(declare-fun res!742907 () Bool)

(assert (=> b!1113147 (=> (not res!742907) (not e!634573))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42113 0))(
  ( (V!42114 (val!13926 Int)) )
))
(declare-datatypes ((ValueCell!13160 0))(
  ( (ValueCellFull!13160 (v!16559 V!42113)) (EmptyCell!13160) )
))
(declare-datatypes ((array!72389 0))(
  ( (array!72390 (arr!34847 (Array (_ BitVec 32) ValueCell!13160)) (size!35383 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72389)

(assert (=> b!1113147 (= res!742907 (and (= (size!35383 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35382 _keys!1208) (size!35383 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113148 () Bool)

(assert (=> b!1113148 (= e!634570 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113148 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36524 0))(
  ( (Unit!36525) )
))
(declare-fun lt!496628 () Unit!36524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72387 (_ BitVec 64) (_ BitVec 32)) Unit!36524)

(assert (=> b!1113148 (= lt!496628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!43426 () Bool)

(declare-fun mapRes!43426 () Bool)

(declare-fun tp!82670 () Bool)

(declare-fun e!634574 () Bool)

(assert (=> mapNonEmpty!43426 (= mapRes!43426 (and tp!82670 e!634574))))

(declare-fun mapValue!43426 () ValueCell!13160)

(declare-fun mapRest!43426 () (Array (_ BitVec 32) ValueCell!13160))

(declare-fun mapKey!43426 () (_ BitVec 32))

(assert (=> mapNonEmpty!43426 (= (arr!34847 _values!996) (store mapRest!43426 mapKey!43426 mapValue!43426))))

(declare-fun b!1113149 () Bool)

(declare-fun tp_is_empty!27739 () Bool)

(assert (=> b!1113149 (= e!634574 tp_is_empty!27739)))

(declare-fun mapIsEmpty!43426 () Bool)

(assert (=> mapIsEmpty!43426 mapRes!43426))

(declare-fun b!1113151 () Bool)

(declare-fun e!634571 () Bool)

(declare-fun e!634572 () Bool)

(assert (=> b!1113151 (= e!634571 (and e!634572 mapRes!43426))))

(declare-fun condMapEmpty!43426 () Bool)

(declare-fun mapDefault!43426 () ValueCell!13160)


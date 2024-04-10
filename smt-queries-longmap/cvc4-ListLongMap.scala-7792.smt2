; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97500 () Bool)

(assert start!97500)

(declare-fun b!1112988 () Bool)

(declare-fun res!742786 () Bool)

(declare-fun e!634501 () Bool)

(assert (=> b!1112988 (=> (not res!742786) (not e!634501))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112988 (= res!742786 (validMask!0 mask!1564))))

(declare-fun b!1112989 () Bool)

(declare-fun res!742791 () Bool)

(declare-fun e!634503 () Bool)

(assert (=> b!1112989 (=> (not res!742791) (not e!634503))))

(declare-datatypes ((array!72371 0))(
  ( (array!72372 (arr!34838 (Array (_ BitVec 32) (_ BitVec 64))) (size!35374 (_ BitVec 32))) )
))
(declare-fun lt!496603 () array!72371)

(declare-datatypes ((List!24302 0))(
  ( (Nil!24299) (Cons!24298 (h!25507 (_ BitVec 64)) (t!34783 List!24302)) )
))
(declare-fun arrayNoDuplicates!0 (array!72371 (_ BitVec 32) List!24302) Bool)

(assert (=> b!1112989 (= res!742791 (arrayNoDuplicates!0 lt!496603 #b00000000000000000000000000000000 Nil!24299))))

(declare-fun b!1112990 () Bool)

(declare-fun res!742785 () Bool)

(assert (=> b!1112990 (=> (not res!742785) (not e!634501))))

(declare-fun _keys!1208 () array!72371)

(assert (=> b!1112990 (= res!742785 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24299))))

(declare-fun b!1112991 () Bool)

(declare-fun e!634502 () Bool)

(declare-fun tp_is_empty!27731 () Bool)

(assert (=> b!1112991 (= e!634502 tp_is_empty!27731)))

(declare-fun b!1112992 () Bool)

(declare-fun res!742792 () Bool)

(assert (=> b!1112992 (=> (not res!742792) (not e!634501))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112992 (= res!742792 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43414 () Bool)

(declare-fun mapRes!43414 () Bool)

(declare-fun tp!82658 () Bool)

(declare-fun e!634500 () Bool)

(assert (=> mapNonEmpty!43414 (= mapRes!43414 (and tp!82658 e!634500))))

(declare-datatypes ((V!42101 0))(
  ( (V!42102 (val!13922 Int)) )
))
(declare-datatypes ((ValueCell!13156 0))(
  ( (ValueCellFull!13156 (v!16555 V!42101)) (EmptyCell!13156) )
))
(declare-fun mapRest!43414 () (Array (_ BitVec 32) ValueCell!13156))

(declare-fun mapKey!43414 () (_ BitVec 32))

(declare-fun mapValue!43414 () ValueCell!13156)

(declare-datatypes ((array!72373 0))(
  ( (array!72374 (arr!34839 (Array (_ BitVec 32) ValueCell!13156)) (size!35375 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72373)

(assert (=> mapNonEmpty!43414 (= (arr!34839 _values!996) (store mapRest!43414 mapKey!43414 mapValue!43414))))

(declare-fun b!1112994 () Bool)

(declare-fun res!742787 () Bool)

(assert (=> b!1112994 (=> (not res!742787) (not e!634501))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112994 (= res!742787 (and (= (size!35375 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35374 _keys!1208) (size!35375 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112995 () Bool)

(declare-fun e!634499 () Bool)

(assert (=> b!1112995 (= e!634499 (and e!634502 mapRes!43414))))

(declare-fun condMapEmpty!43414 () Bool)

(declare-fun mapDefault!43414 () ValueCell!13156)


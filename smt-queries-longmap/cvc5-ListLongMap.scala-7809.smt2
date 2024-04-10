; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97598 () Bool)

(assert start!97598)

(declare-fun b!1114899 () Bool)

(declare-fun res!744257 () Bool)

(declare-fun e!635380 () Bool)

(assert (=> b!1114899 (=> (not res!744257) (not e!635380))))

(declare-datatypes ((array!72563 0))(
  ( (array!72564 (arr!34934 (Array (_ BitVec 32) (_ BitVec 64))) (size!35470 (_ BitVec 32))) )
))
(declare-fun lt!496897 () array!72563)

(declare-datatypes ((List!24337 0))(
  ( (Nil!24334) (Cons!24333 (h!25542 (_ BitVec 64)) (t!34818 List!24337)) )
))
(declare-fun arrayNoDuplicates!0 (array!72563 (_ BitVec 32) List!24337) Bool)

(assert (=> b!1114899 (= res!744257 (arrayNoDuplicates!0 lt!496897 #b00000000000000000000000000000000 Nil!24334))))

(declare-fun b!1114900 () Bool)

(declare-fun res!744253 () Bool)

(declare-fun e!635381 () Bool)

(assert (=> b!1114900 (=> (not res!744253) (not e!635381))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72563)

(assert (=> b!1114900 (= res!744253 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35470 _keys!1208))))))

(declare-fun b!1114901 () Bool)

(assert (=> b!1114901 (= e!635380 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114901 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36592 0))(
  ( (Unit!36593) )
))
(declare-fun lt!496898 () Unit!36592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72563 (_ BitVec 64) (_ BitVec 32)) Unit!36592)

(assert (=> b!1114901 (= lt!496898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114902 () Bool)

(declare-fun res!744256 () Bool)

(assert (=> b!1114902 (=> (not res!744256) (not e!635381))))

(assert (=> b!1114902 (= res!744256 (= (select (arr!34934 _keys!1208) i!673) k!934))))

(declare-fun b!1114903 () Bool)

(declare-fun e!635382 () Bool)

(declare-fun tp_is_empty!27829 () Bool)

(assert (=> b!1114903 (= e!635382 tp_is_empty!27829)))

(declare-fun b!1114904 () Bool)

(declare-fun res!744255 () Bool)

(assert (=> b!1114904 (=> (not res!744255) (not e!635381))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114904 (= res!744255 (validMask!0 mask!1564))))

(declare-fun b!1114905 () Bool)

(declare-fun res!744261 () Bool)

(assert (=> b!1114905 (=> (not res!744261) (not e!635381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114905 (= res!744261 (validKeyInArray!0 k!934))))

(declare-fun res!744259 () Bool)

(assert (=> start!97598 (=> (not res!744259) (not e!635381))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97598 (= res!744259 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35470 _keys!1208))))))

(assert (=> start!97598 e!635381))

(declare-fun array_inv!26856 (array!72563) Bool)

(assert (=> start!97598 (array_inv!26856 _keys!1208)))

(assert (=> start!97598 true))

(declare-datatypes ((V!42233 0))(
  ( (V!42234 (val!13971 Int)) )
))
(declare-datatypes ((ValueCell!13205 0))(
  ( (ValueCellFull!13205 (v!16604 V!42233)) (EmptyCell!13205) )
))
(declare-datatypes ((array!72565 0))(
  ( (array!72566 (arr!34935 (Array (_ BitVec 32) ValueCell!13205)) (size!35471 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72565)

(declare-fun e!635384 () Bool)

(declare-fun array_inv!26857 (array!72565) Bool)

(assert (=> start!97598 (and (array_inv!26857 _values!996) e!635384)))

(declare-fun b!1114906 () Bool)

(declare-fun res!744254 () Bool)

(assert (=> b!1114906 (=> (not res!744254) (not e!635381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72563 (_ BitVec 32)) Bool)

(assert (=> b!1114906 (= res!744254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114907 () Bool)

(declare-fun res!744262 () Bool)

(assert (=> b!1114907 (=> (not res!744262) (not e!635381))))

(assert (=> b!1114907 (= res!744262 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24334))))

(declare-fun mapNonEmpty!43561 () Bool)

(declare-fun mapRes!43561 () Bool)

(declare-fun tp!82805 () Bool)

(assert (=> mapNonEmpty!43561 (= mapRes!43561 (and tp!82805 e!635382))))

(declare-fun mapValue!43561 () ValueCell!13205)

(declare-fun mapRest!43561 () (Array (_ BitVec 32) ValueCell!13205))

(declare-fun mapKey!43561 () (_ BitVec 32))

(assert (=> mapNonEmpty!43561 (= (arr!34935 _values!996) (store mapRest!43561 mapKey!43561 mapValue!43561))))

(declare-fun b!1114908 () Bool)

(declare-fun res!744258 () Bool)

(assert (=> b!1114908 (=> (not res!744258) (not e!635381))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114908 (= res!744258 (and (= (size!35471 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35470 _keys!1208) (size!35471 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114909 () Bool)

(declare-fun e!635383 () Bool)

(assert (=> b!1114909 (= e!635383 tp_is_empty!27829)))

(declare-fun mapIsEmpty!43561 () Bool)

(assert (=> mapIsEmpty!43561 mapRes!43561))

(declare-fun b!1114910 () Bool)

(assert (=> b!1114910 (= e!635384 (and e!635383 mapRes!43561))))

(declare-fun condMapEmpty!43561 () Bool)

(declare-fun mapDefault!43561 () ValueCell!13205)


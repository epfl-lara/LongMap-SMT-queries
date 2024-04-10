; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97536 () Bool)

(assert start!97536)

(declare-fun b!1113690 () Bool)

(declare-fun res!743329 () Bool)

(declare-fun e!634823 () Bool)

(assert (=> b!1113690 (=> (not res!743329) (not e!634823))))

(declare-datatypes ((array!72441 0))(
  ( (array!72442 (arr!34873 (Array (_ BitVec 32) (_ BitVec 64))) (size!35409 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72441)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72441 (_ BitVec 32)) Bool)

(assert (=> b!1113690 (= res!743329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113691 () Bool)

(declare-fun e!634824 () Bool)

(declare-fun tp_is_empty!27767 () Bool)

(assert (=> b!1113691 (= e!634824 tp_is_empty!27767)))

(declare-fun b!1113692 () Bool)

(declare-fun res!743327 () Bool)

(assert (=> b!1113692 (=> (not res!743327) (not e!634823))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42149 0))(
  ( (V!42150 (val!13940 Int)) )
))
(declare-datatypes ((ValueCell!13174 0))(
  ( (ValueCellFull!13174 (v!16573 V!42149)) (EmptyCell!13174) )
))
(declare-datatypes ((array!72443 0))(
  ( (array!72444 (arr!34874 (Array (_ BitVec 32) ValueCell!13174)) (size!35410 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72443)

(assert (=> b!1113692 (= res!743327 (and (= (size!35410 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35409 _keys!1208) (size!35410 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113693 () Bool)

(declare-fun res!743325 () Bool)

(assert (=> b!1113693 (=> (not res!743325) (not e!634823))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113693 (= res!743325 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35409 _keys!1208))))))

(declare-fun b!1113694 () Bool)

(declare-fun res!743328 () Bool)

(assert (=> b!1113694 (=> (not res!743328) (not e!634823))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113694 (= res!743328 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43468 () Bool)

(declare-fun mapRes!43468 () Bool)

(declare-fun tp!82712 () Bool)

(declare-fun e!634825 () Bool)

(assert (=> mapNonEmpty!43468 (= mapRes!43468 (and tp!82712 e!634825))))

(declare-fun mapValue!43468 () ValueCell!13174)

(declare-fun mapRest!43468 () (Array (_ BitVec 32) ValueCell!13174))

(declare-fun mapKey!43468 () (_ BitVec 32))

(assert (=> mapNonEmpty!43468 (= (arr!34874 _values!996) (store mapRest!43468 mapKey!43468 mapValue!43468))))

(declare-fun b!1113695 () Bool)

(declare-fun e!634827 () Bool)

(assert (=> b!1113695 (= e!634827 (not true))))

(declare-fun arrayContainsKey!0 (array!72441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113695 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36548 0))(
  ( (Unit!36549) )
))
(declare-fun lt!496712 () Unit!36548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72441 (_ BitVec 64) (_ BitVec 32)) Unit!36548)

(assert (=> b!1113695 (= lt!496712 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!743331 () Bool)

(assert (=> start!97536 (=> (not res!743331) (not e!634823))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97536 (= res!743331 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35409 _keys!1208))))))

(assert (=> start!97536 e!634823))

(declare-fun array_inv!26808 (array!72441) Bool)

(assert (=> start!97536 (array_inv!26808 _keys!1208)))

(assert (=> start!97536 true))

(declare-fun e!634826 () Bool)

(declare-fun array_inv!26809 (array!72443) Bool)

(assert (=> start!97536 (and (array_inv!26809 _values!996) e!634826)))

(declare-fun b!1113696 () Bool)

(assert (=> b!1113696 (= e!634823 e!634827)))

(declare-fun res!743324 () Bool)

(assert (=> b!1113696 (=> (not res!743324) (not e!634827))))

(declare-fun lt!496711 () array!72441)

(assert (=> b!1113696 (= res!743324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496711 mask!1564))))

(assert (=> b!1113696 (= lt!496711 (array!72442 (store (arr!34873 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35409 _keys!1208)))))

(declare-fun b!1113697 () Bool)

(assert (=> b!1113697 (= e!634826 (and e!634824 mapRes!43468))))

(declare-fun condMapEmpty!43468 () Bool)

(declare-fun mapDefault!43468 () ValueCell!13174)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97526 () Bool)

(assert start!97526)

(declare-fun mapIsEmpty!43453 () Bool)

(declare-fun mapRes!43453 () Bool)

(assert (=> mapIsEmpty!43453 mapRes!43453))

(declare-fun b!1113495 () Bool)

(declare-fun res!743176 () Bool)

(declare-fun e!634735 () Bool)

(assert (=> b!1113495 (=> (not res!743176) (not e!634735))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113495 (= res!743176 (validKeyInArray!0 k!934))))

(declare-fun res!743180 () Bool)

(assert (=> start!97526 (=> (not res!743180) (not e!634735))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72421 0))(
  ( (array!72422 (arr!34863 (Array (_ BitVec 32) (_ BitVec 64))) (size!35399 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72421)

(assert (=> start!97526 (= res!743180 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35399 _keys!1208))))))

(assert (=> start!97526 e!634735))

(declare-fun array_inv!26802 (array!72421) Bool)

(assert (=> start!97526 (array_inv!26802 _keys!1208)))

(assert (=> start!97526 true))

(declare-datatypes ((V!42137 0))(
  ( (V!42138 (val!13935 Int)) )
))
(declare-datatypes ((ValueCell!13169 0))(
  ( (ValueCellFull!13169 (v!16568 V!42137)) (EmptyCell!13169) )
))
(declare-datatypes ((array!72423 0))(
  ( (array!72424 (arr!34864 (Array (_ BitVec 32) ValueCell!13169)) (size!35400 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72423)

(declare-fun e!634737 () Bool)

(declare-fun array_inv!26803 (array!72423) Bool)

(assert (=> start!97526 (and (array_inv!26803 _values!996) e!634737)))

(declare-fun b!1113496 () Bool)

(declare-fun e!634736 () Bool)

(assert (=> b!1113496 (= e!634735 e!634736)))

(declare-fun res!743174 () Bool)

(assert (=> b!1113496 (=> (not res!743174) (not e!634736))))

(declare-fun lt!496681 () array!72421)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72421 (_ BitVec 32)) Bool)

(assert (=> b!1113496 (= res!743174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496681 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113496 (= lt!496681 (array!72422 (store (arr!34863 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35399 _keys!1208)))))

(declare-fun b!1113497 () Bool)

(declare-fun res!743181 () Bool)

(assert (=> b!1113497 (=> (not res!743181) (not e!634735))))

(assert (=> b!1113497 (= res!743181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113498 () Bool)

(declare-fun res!743178 () Bool)

(assert (=> b!1113498 (=> (not res!743178) (not e!634735))))

(assert (=> b!1113498 (= res!743178 (= (select (arr!34863 _keys!1208) i!673) k!934))))

(declare-fun b!1113499 () Bool)

(assert (=> b!1113499 (= e!634736 (not true))))

(declare-fun arrayContainsKey!0 (array!72421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113499 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36540 0))(
  ( (Unit!36541) )
))
(declare-fun lt!496682 () Unit!36540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72421 (_ BitVec 64) (_ BitVec 32)) Unit!36540)

(assert (=> b!1113499 (= lt!496682 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!43453 () Bool)

(declare-fun tp!82697 () Bool)

(declare-fun e!634732 () Bool)

(assert (=> mapNonEmpty!43453 (= mapRes!43453 (and tp!82697 e!634732))))

(declare-fun mapRest!43453 () (Array (_ BitVec 32) ValueCell!13169))

(declare-fun mapKey!43453 () (_ BitVec 32))

(declare-fun mapValue!43453 () ValueCell!13169)

(assert (=> mapNonEmpty!43453 (= (arr!34864 _values!996) (store mapRest!43453 mapKey!43453 mapValue!43453))))

(declare-fun b!1113500 () Bool)

(declare-fun res!743173 () Bool)

(assert (=> b!1113500 (=> (not res!743173) (not e!634735))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113500 (= res!743173 (and (= (size!35400 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35399 _keys!1208) (size!35400 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113501 () Bool)

(declare-fun tp_is_empty!27757 () Bool)

(assert (=> b!1113501 (= e!634732 tp_is_empty!27757)))

(declare-fun b!1113502 () Bool)

(declare-fun e!634733 () Bool)

(assert (=> b!1113502 (= e!634737 (and e!634733 mapRes!43453))))

(declare-fun condMapEmpty!43453 () Bool)

(declare-fun mapDefault!43453 () ValueCell!13169)


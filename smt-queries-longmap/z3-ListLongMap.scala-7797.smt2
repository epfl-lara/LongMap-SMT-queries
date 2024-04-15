; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97520 () Bool)

(assert start!97520)

(declare-fun b!1113366 () Bool)

(declare-fun res!743107 () Bool)

(declare-fun e!634654 () Bool)

(assert (=> b!1113366 (=> (not res!743107) (not e!634654))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72320 0))(
  ( (array!72321 (arr!34813 (Array (_ BitVec 32) (_ BitVec 64))) (size!35351 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72320)

(assert (=> b!1113366 (= res!743107 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35351 _keys!1208))))))

(declare-fun b!1113367 () Bool)

(declare-fun e!634653 () Bool)

(declare-fun tp_is_empty!27757 () Bool)

(assert (=> b!1113367 (= e!634653 tp_is_empty!27757)))

(declare-fun b!1113368 () Bool)

(declare-fun res!743110 () Bool)

(assert (=> b!1113368 (=> (not res!743110) (not e!634654))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72320 (_ BitVec 32)) Bool)

(assert (=> b!1113368 (= res!743110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113369 () Bool)

(declare-fun res!743109 () Bool)

(assert (=> b!1113369 (=> (not res!743109) (not e!634654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113369 (= res!743109 (validMask!0 mask!1564))))

(declare-fun b!1113370 () Bool)

(declare-fun res!743104 () Bool)

(assert (=> b!1113370 (=> (not res!743104) (not e!634654))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113370 (= res!743104 (validKeyInArray!0 k0!934))))

(declare-fun b!1113371 () Bool)

(declare-fun e!634652 () Bool)

(assert (=> b!1113371 (= e!634654 e!634652)))

(declare-fun res!743108 () Bool)

(assert (=> b!1113371 (=> (not res!743108) (not e!634652))))

(declare-fun lt!496482 () array!72320)

(assert (=> b!1113371 (= res!743108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496482 mask!1564))))

(assert (=> b!1113371 (= lt!496482 (array!72321 (store (arr!34813 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35351 _keys!1208)))))

(declare-fun mapNonEmpty!43453 () Bool)

(declare-fun mapRes!43453 () Bool)

(declare-fun tp!82697 () Bool)

(assert (=> mapNonEmpty!43453 (= mapRes!43453 (and tp!82697 e!634653))))

(declare-datatypes ((V!42137 0))(
  ( (V!42138 (val!13935 Int)) )
))
(declare-datatypes ((ValueCell!13169 0))(
  ( (ValueCellFull!13169 (v!16567 V!42137)) (EmptyCell!13169) )
))
(declare-fun mapValue!43453 () ValueCell!13169)

(declare-fun mapRest!43453 () (Array (_ BitVec 32) ValueCell!13169))

(declare-fun mapKey!43453 () (_ BitVec 32))

(declare-datatypes ((array!72322 0))(
  ( (array!72323 (arr!34814 (Array (_ BitVec 32) ValueCell!13169)) (size!35352 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72322)

(assert (=> mapNonEmpty!43453 (= (arr!34814 _values!996) (store mapRest!43453 mapKey!43453 mapValue!43453))))

(declare-fun b!1113372 () Bool)

(declare-fun res!743105 () Bool)

(assert (=> b!1113372 (=> (not res!743105) (not e!634654))))

(assert (=> b!1113372 (= res!743105 (= (select (arr!34813 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43453 () Bool)

(assert (=> mapIsEmpty!43453 mapRes!43453))

(declare-fun res!743112 () Bool)

(assert (=> start!97520 (=> (not res!743112) (not e!634654))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97520 (= res!743112 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35351 _keys!1208))))))

(assert (=> start!97520 e!634654))

(declare-fun array_inv!26842 (array!72320) Bool)

(assert (=> start!97520 (array_inv!26842 _keys!1208)))

(assert (=> start!97520 true))

(declare-fun e!634656 () Bool)

(declare-fun array_inv!26843 (array!72322) Bool)

(assert (=> start!97520 (and (array_inv!26843 _values!996) e!634656)))

(declare-fun b!1113373 () Bool)

(declare-fun e!634651 () Bool)

(assert (=> b!1113373 (= e!634656 (and e!634651 mapRes!43453))))

(declare-fun condMapEmpty!43453 () Bool)

(declare-fun mapDefault!43453 () ValueCell!13169)

(assert (=> b!1113373 (= condMapEmpty!43453 (= (arr!34814 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13169)) mapDefault!43453)))))

(declare-fun b!1113374 () Bool)

(declare-fun res!743111 () Bool)

(assert (=> b!1113374 (=> (not res!743111) (not e!634654))))

(declare-datatypes ((List!24343 0))(
  ( (Nil!24340) (Cons!24339 (h!25548 (_ BitVec 64)) (t!34815 List!24343)) )
))
(declare-fun arrayNoDuplicates!0 (array!72320 (_ BitVec 32) List!24343) Bool)

(assert (=> b!1113374 (= res!743111 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24340))))

(declare-fun b!1113375 () Bool)

(declare-fun res!743113 () Bool)

(assert (=> b!1113375 (=> (not res!743113) (not e!634654))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113375 (= res!743113 (and (= (size!35352 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35351 _keys!1208) (size!35352 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113376 () Bool)

(assert (=> b!1113376 (= e!634652 (not true))))

(declare-fun arrayContainsKey!0 (array!72320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113376 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36359 0))(
  ( (Unit!36360) )
))
(declare-fun lt!496481 () Unit!36359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72320 (_ BitVec 64) (_ BitVec 32)) Unit!36359)

(assert (=> b!1113376 (= lt!496481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113377 () Bool)

(assert (=> b!1113377 (= e!634651 tp_is_empty!27757)))

(declare-fun b!1113378 () Bool)

(declare-fun res!743106 () Bool)

(assert (=> b!1113378 (=> (not res!743106) (not e!634652))))

(assert (=> b!1113378 (= res!743106 (arrayNoDuplicates!0 lt!496482 #b00000000000000000000000000000000 Nil!24340))))

(assert (= (and start!97520 res!743112) b!1113369))

(assert (= (and b!1113369 res!743109) b!1113375))

(assert (= (and b!1113375 res!743113) b!1113368))

(assert (= (and b!1113368 res!743110) b!1113374))

(assert (= (and b!1113374 res!743111) b!1113366))

(assert (= (and b!1113366 res!743107) b!1113370))

(assert (= (and b!1113370 res!743104) b!1113372))

(assert (= (and b!1113372 res!743105) b!1113371))

(assert (= (and b!1113371 res!743108) b!1113378))

(assert (= (and b!1113378 res!743106) b!1113376))

(assert (= (and b!1113373 condMapEmpty!43453) mapIsEmpty!43453))

(assert (= (and b!1113373 (not condMapEmpty!43453)) mapNonEmpty!43453))

(get-info :version)

(assert (= (and mapNonEmpty!43453 ((_ is ValueCellFull!13169) mapValue!43453)) b!1113367))

(assert (= (and b!1113373 ((_ is ValueCellFull!13169) mapDefault!43453)) b!1113377))

(assert (= start!97520 b!1113373))

(declare-fun m!1030059 () Bool)

(assert (=> mapNonEmpty!43453 m!1030059))

(declare-fun m!1030061 () Bool)

(assert (=> b!1113374 m!1030061))

(declare-fun m!1030063 () Bool)

(assert (=> b!1113378 m!1030063))

(declare-fun m!1030065 () Bool)

(assert (=> b!1113376 m!1030065))

(declare-fun m!1030067 () Bool)

(assert (=> b!1113376 m!1030067))

(declare-fun m!1030069 () Bool)

(assert (=> b!1113370 m!1030069))

(declare-fun m!1030071 () Bool)

(assert (=> b!1113371 m!1030071))

(declare-fun m!1030073 () Bool)

(assert (=> b!1113371 m!1030073))

(declare-fun m!1030075 () Bool)

(assert (=> b!1113369 m!1030075))

(declare-fun m!1030077 () Bool)

(assert (=> b!1113372 m!1030077))

(declare-fun m!1030079 () Bool)

(assert (=> start!97520 m!1030079))

(declare-fun m!1030081 () Bool)

(assert (=> start!97520 m!1030081))

(declare-fun m!1030083 () Bool)

(assert (=> b!1113368 m!1030083))

(check-sat (not b!1113371) (not mapNonEmpty!43453) tp_is_empty!27757 (not b!1113376) (not b!1113370) (not b!1113374) (not start!97520) (not b!1113368) (not b!1113369) (not b!1113378))
(check-sat)

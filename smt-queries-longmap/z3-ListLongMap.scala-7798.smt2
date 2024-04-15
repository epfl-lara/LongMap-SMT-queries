; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97526 () Bool)

(assert start!97526)

(declare-fun b!1113483 () Bool)

(declare-fun e!634709 () Bool)

(declare-fun e!634708 () Bool)

(declare-fun mapRes!43462 () Bool)

(assert (=> b!1113483 (= e!634709 (and e!634708 mapRes!43462))))

(declare-fun condMapEmpty!43462 () Bool)

(declare-datatypes ((V!42145 0))(
  ( (V!42146 (val!13938 Int)) )
))
(declare-datatypes ((ValueCell!13172 0))(
  ( (ValueCellFull!13172 (v!16570 V!42145)) (EmptyCell!13172) )
))
(declare-datatypes ((array!72332 0))(
  ( (array!72333 (arr!34819 (Array (_ BitVec 32) ValueCell!13172)) (size!35357 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72332)

(declare-fun mapDefault!43462 () ValueCell!13172)

(assert (=> b!1113483 (= condMapEmpty!43462 (= (arr!34819 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13172)) mapDefault!43462)))))

(declare-fun b!1113484 () Bool)

(declare-fun e!634705 () Bool)

(assert (=> b!1113484 (= e!634705 (not true))))

(declare-datatypes ((array!72334 0))(
  ( (array!72335 (arr!34820 (Array (_ BitVec 32) (_ BitVec 64))) (size!35358 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72334)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113484 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36365 0))(
  ( (Unit!36366) )
))
(declare-fun lt!496500 () Unit!36365)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72334 (_ BitVec 64) (_ BitVec 32)) Unit!36365)

(assert (=> b!1113484 (= lt!496500 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113485 () Bool)

(declare-fun tp_is_empty!27763 () Bool)

(assert (=> b!1113485 (= e!634708 tp_is_empty!27763)))

(declare-fun b!1113486 () Bool)

(declare-fun res!743199 () Bool)

(declare-fun e!634710 () Bool)

(assert (=> b!1113486 (=> (not res!743199) (not e!634710))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113486 (= res!743199 (and (= (size!35357 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35358 _keys!1208) (size!35357 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113487 () Bool)

(declare-fun res!743196 () Bool)

(assert (=> b!1113487 (=> (not res!743196) (not e!634710))))

(assert (=> b!1113487 (= res!743196 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35358 _keys!1208))))))

(declare-fun b!1113488 () Bool)

(declare-fun res!743198 () Bool)

(assert (=> b!1113488 (=> (not res!743198) (not e!634710))))

(declare-datatypes ((List!24346 0))(
  ( (Nil!24343) (Cons!24342 (h!25551 (_ BitVec 64)) (t!34818 List!24346)) )
))
(declare-fun arrayNoDuplicates!0 (array!72334 (_ BitVec 32) List!24346) Bool)

(assert (=> b!1113488 (= res!743198 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24343))))

(declare-fun b!1113489 () Bool)

(declare-fun e!634706 () Bool)

(assert (=> b!1113489 (= e!634706 tp_is_empty!27763)))

(declare-fun res!743200 () Bool)

(assert (=> start!97526 (=> (not res!743200) (not e!634710))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97526 (= res!743200 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35358 _keys!1208))))))

(assert (=> start!97526 e!634710))

(declare-fun array_inv!26846 (array!72334) Bool)

(assert (=> start!97526 (array_inv!26846 _keys!1208)))

(assert (=> start!97526 true))

(declare-fun array_inv!26847 (array!72332) Bool)

(assert (=> start!97526 (and (array_inv!26847 _values!996) e!634709)))

(declare-fun b!1113490 () Bool)

(assert (=> b!1113490 (= e!634710 e!634705)))

(declare-fun res!743197 () Bool)

(assert (=> b!1113490 (=> (not res!743197) (not e!634705))))

(declare-fun lt!496499 () array!72334)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72334 (_ BitVec 32)) Bool)

(assert (=> b!1113490 (= res!743197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496499 mask!1564))))

(assert (=> b!1113490 (= lt!496499 (array!72335 (store (arr!34820 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35358 _keys!1208)))))

(declare-fun b!1113491 () Bool)

(declare-fun res!743195 () Bool)

(assert (=> b!1113491 (=> (not res!743195) (not e!634710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113491 (= res!743195 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43462 () Bool)

(declare-fun tp!82706 () Bool)

(assert (=> mapNonEmpty!43462 (= mapRes!43462 (and tp!82706 e!634706))))

(declare-fun mapValue!43462 () ValueCell!13172)

(declare-fun mapKey!43462 () (_ BitVec 32))

(declare-fun mapRest!43462 () (Array (_ BitVec 32) ValueCell!13172))

(assert (=> mapNonEmpty!43462 (= (arr!34819 _values!996) (store mapRest!43462 mapKey!43462 mapValue!43462))))

(declare-fun b!1113492 () Bool)

(declare-fun res!743203 () Bool)

(assert (=> b!1113492 (=> (not res!743203) (not e!634710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113492 (= res!743203 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43462 () Bool)

(assert (=> mapIsEmpty!43462 mapRes!43462))

(declare-fun b!1113493 () Bool)

(declare-fun res!743194 () Bool)

(assert (=> b!1113493 (=> (not res!743194) (not e!634710))))

(assert (=> b!1113493 (= res!743194 (= (select (arr!34820 _keys!1208) i!673) k0!934))))

(declare-fun b!1113494 () Bool)

(declare-fun res!743201 () Bool)

(assert (=> b!1113494 (=> (not res!743201) (not e!634705))))

(assert (=> b!1113494 (= res!743201 (arrayNoDuplicates!0 lt!496499 #b00000000000000000000000000000000 Nil!24343))))

(declare-fun b!1113495 () Bool)

(declare-fun res!743202 () Bool)

(assert (=> b!1113495 (=> (not res!743202) (not e!634710))))

(assert (=> b!1113495 (= res!743202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97526 res!743200) b!1113492))

(assert (= (and b!1113492 res!743203) b!1113486))

(assert (= (and b!1113486 res!743199) b!1113495))

(assert (= (and b!1113495 res!743202) b!1113488))

(assert (= (and b!1113488 res!743198) b!1113487))

(assert (= (and b!1113487 res!743196) b!1113491))

(assert (= (and b!1113491 res!743195) b!1113493))

(assert (= (and b!1113493 res!743194) b!1113490))

(assert (= (and b!1113490 res!743197) b!1113494))

(assert (= (and b!1113494 res!743201) b!1113484))

(assert (= (and b!1113483 condMapEmpty!43462) mapIsEmpty!43462))

(assert (= (and b!1113483 (not condMapEmpty!43462)) mapNonEmpty!43462))

(get-info :version)

(assert (= (and mapNonEmpty!43462 ((_ is ValueCellFull!13172) mapValue!43462)) b!1113489))

(assert (= (and b!1113483 ((_ is ValueCellFull!13172) mapDefault!43462)) b!1113485))

(assert (= start!97526 b!1113483))

(declare-fun m!1030137 () Bool)

(assert (=> b!1113488 m!1030137))

(declare-fun m!1030139 () Bool)

(assert (=> b!1113495 m!1030139))

(declare-fun m!1030141 () Bool)

(assert (=> b!1113494 m!1030141))

(declare-fun m!1030143 () Bool)

(assert (=> b!1113490 m!1030143))

(declare-fun m!1030145 () Bool)

(assert (=> b!1113490 m!1030145))

(declare-fun m!1030147 () Bool)

(assert (=> start!97526 m!1030147))

(declare-fun m!1030149 () Bool)

(assert (=> start!97526 m!1030149))

(declare-fun m!1030151 () Bool)

(assert (=> mapNonEmpty!43462 m!1030151))

(declare-fun m!1030153 () Bool)

(assert (=> b!1113492 m!1030153))

(declare-fun m!1030155 () Bool)

(assert (=> b!1113484 m!1030155))

(declare-fun m!1030157 () Bool)

(assert (=> b!1113484 m!1030157))

(declare-fun m!1030159 () Bool)

(assert (=> b!1113493 m!1030159))

(declare-fun m!1030161 () Bool)

(assert (=> b!1113491 m!1030161))

(check-sat (not start!97526) (not b!1113491) (not b!1113490) tp_is_empty!27763 (not b!1113494) (not b!1113495) (not mapNonEmpty!43462) (not b!1113488) (not b!1113492) (not b!1113484))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97466 () Bool)

(assert start!97466)

(declare-fun b!1112313 () Bool)

(declare-fun e!634168 () Bool)

(assert (=> b!1112313 (= e!634168 (not true))))

(declare-datatypes ((array!72216 0))(
  ( (array!72217 (arr!34761 (Array (_ BitVec 32) (_ BitVec 64))) (size!35299 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72216)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112313 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36319 0))(
  ( (Unit!36320) )
))
(declare-fun lt!496320 () Unit!36319)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72216 (_ BitVec 64) (_ BitVec 32)) Unit!36319)

(assert (=> b!1112313 (= lt!496320 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112314 () Bool)

(declare-fun res!742296 () Bool)

(declare-fun e!634165 () Bool)

(assert (=> b!1112314 (=> (not res!742296) (not e!634165))))

(assert (=> b!1112314 (= res!742296 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35299 _keys!1208))))))

(declare-fun mapIsEmpty!43372 () Bool)

(declare-fun mapRes!43372 () Bool)

(assert (=> mapIsEmpty!43372 mapRes!43372))

(declare-fun mapNonEmpty!43372 () Bool)

(declare-fun tp!82616 () Bool)

(declare-fun e!634166 () Bool)

(assert (=> mapNonEmpty!43372 (= mapRes!43372 (and tp!82616 e!634166))))

(declare-fun mapKey!43372 () (_ BitVec 32))

(declare-datatypes ((V!42065 0))(
  ( (V!42066 (val!13908 Int)) )
))
(declare-datatypes ((ValueCell!13142 0))(
  ( (ValueCellFull!13142 (v!16540 V!42065)) (EmptyCell!13142) )
))
(declare-fun mapRest!43372 () (Array (_ BitVec 32) ValueCell!13142))

(declare-fun mapValue!43372 () ValueCell!13142)

(declare-datatypes ((array!72218 0))(
  ( (array!72219 (arr!34762 (Array (_ BitVec 32) ValueCell!13142)) (size!35300 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72218)

(assert (=> mapNonEmpty!43372 (= (arr!34762 _values!996) (store mapRest!43372 mapKey!43372 mapValue!43372))))

(declare-fun b!1112315 () Bool)

(declare-fun res!742298 () Bool)

(assert (=> b!1112315 (=> (not res!742298) (not e!634165))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112315 (= res!742298 (validMask!0 mask!1564))))

(declare-fun b!1112316 () Bool)

(declare-fun res!742299 () Bool)

(assert (=> b!1112316 (=> (not res!742299) (not e!634165))))

(declare-datatypes ((List!24323 0))(
  ( (Nil!24320) (Cons!24319 (h!25528 (_ BitVec 64)) (t!34795 List!24323)) )
))
(declare-fun arrayNoDuplicates!0 (array!72216 (_ BitVec 32) List!24323) Bool)

(assert (=> b!1112316 (= res!742299 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24320))))

(declare-fun b!1112317 () Bool)

(declare-fun res!742297 () Bool)

(assert (=> b!1112317 (=> (not res!742297) (not e!634165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72216 (_ BitVec 32)) Bool)

(assert (=> b!1112317 (= res!742297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112318 () Bool)

(declare-fun tp_is_empty!27703 () Bool)

(assert (=> b!1112318 (= e!634166 tp_is_empty!27703)))

(declare-fun b!1112319 () Bool)

(declare-fun res!742303 () Bool)

(assert (=> b!1112319 (=> (not res!742303) (not e!634165))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112319 (= res!742303 (and (= (size!35300 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35299 _keys!1208) (size!35300 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!742302 () Bool)

(assert (=> start!97466 (=> (not res!742302) (not e!634165))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97466 (= res!742302 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35299 _keys!1208))))))

(assert (=> start!97466 e!634165))

(declare-fun array_inv!26800 (array!72216) Bool)

(assert (=> start!97466 (array_inv!26800 _keys!1208)))

(assert (=> start!97466 true))

(declare-fun e!634169 () Bool)

(declare-fun array_inv!26801 (array!72218) Bool)

(assert (=> start!97466 (and (array_inv!26801 _values!996) e!634169)))

(declare-fun b!1112320 () Bool)

(assert (=> b!1112320 (= e!634165 e!634168)))

(declare-fun res!742295 () Bool)

(assert (=> b!1112320 (=> (not res!742295) (not e!634168))))

(declare-fun lt!496319 () array!72216)

(assert (=> b!1112320 (= res!742295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496319 mask!1564))))

(assert (=> b!1112320 (= lt!496319 (array!72217 (store (arr!34761 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35299 _keys!1208)))))

(declare-fun b!1112321 () Bool)

(declare-fun res!742300 () Bool)

(assert (=> b!1112321 (=> (not res!742300) (not e!634168))))

(assert (=> b!1112321 (= res!742300 (arrayNoDuplicates!0 lt!496319 #b00000000000000000000000000000000 Nil!24320))))

(declare-fun b!1112322 () Bool)

(declare-fun e!634167 () Bool)

(assert (=> b!1112322 (= e!634167 tp_is_empty!27703)))

(declare-fun b!1112323 () Bool)

(declare-fun res!742294 () Bool)

(assert (=> b!1112323 (=> (not res!742294) (not e!634165))))

(assert (=> b!1112323 (= res!742294 (= (select (arr!34761 _keys!1208) i!673) k0!934))))

(declare-fun b!1112324 () Bool)

(assert (=> b!1112324 (= e!634169 (and e!634167 mapRes!43372))))

(declare-fun condMapEmpty!43372 () Bool)

(declare-fun mapDefault!43372 () ValueCell!13142)

(assert (=> b!1112324 (= condMapEmpty!43372 (= (arr!34762 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13142)) mapDefault!43372)))))

(declare-fun b!1112325 () Bool)

(declare-fun res!742301 () Bool)

(assert (=> b!1112325 (=> (not res!742301) (not e!634165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112325 (= res!742301 (validKeyInArray!0 k0!934))))

(assert (= (and start!97466 res!742302) b!1112315))

(assert (= (and b!1112315 res!742298) b!1112319))

(assert (= (and b!1112319 res!742303) b!1112317))

(assert (= (and b!1112317 res!742297) b!1112316))

(assert (= (and b!1112316 res!742299) b!1112314))

(assert (= (and b!1112314 res!742296) b!1112325))

(assert (= (and b!1112325 res!742301) b!1112323))

(assert (= (and b!1112323 res!742294) b!1112320))

(assert (= (and b!1112320 res!742295) b!1112321))

(assert (= (and b!1112321 res!742300) b!1112313))

(assert (= (and b!1112324 condMapEmpty!43372) mapIsEmpty!43372))

(assert (= (and b!1112324 (not condMapEmpty!43372)) mapNonEmpty!43372))

(get-info :version)

(assert (= (and mapNonEmpty!43372 ((_ is ValueCellFull!13142) mapValue!43372)) b!1112318))

(assert (= (and b!1112324 ((_ is ValueCellFull!13142) mapDefault!43372)) b!1112322))

(assert (= start!97466 b!1112324))

(declare-fun m!1029357 () Bool)

(assert (=> b!1112323 m!1029357))

(declare-fun m!1029359 () Bool)

(assert (=> b!1112321 m!1029359))

(declare-fun m!1029361 () Bool)

(assert (=> b!1112320 m!1029361))

(declare-fun m!1029363 () Bool)

(assert (=> b!1112320 m!1029363))

(declare-fun m!1029365 () Bool)

(assert (=> b!1112315 m!1029365))

(declare-fun m!1029367 () Bool)

(assert (=> start!97466 m!1029367))

(declare-fun m!1029369 () Bool)

(assert (=> start!97466 m!1029369))

(declare-fun m!1029371 () Bool)

(assert (=> b!1112317 m!1029371))

(declare-fun m!1029373 () Bool)

(assert (=> b!1112316 m!1029373))

(declare-fun m!1029375 () Bool)

(assert (=> b!1112313 m!1029375))

(declare-fun m!1029377 () Bool)

(assert (=> b!1112313 m!1029377))

(declare-fun m!1029379 () Bool)

(assert (=> mapNonEmpty!43372 m!1029379))

(declare-fun m!1029381 () Bool)

(assert (=> b!1112325 m!1029381))

(check-sat (not b!1112316) (not b!1112320) (not b!1112313) (not b!1112315) (not start!97466) tp_is_empty!27703 (not b!1112317) (not mapNonEmpty!43372) (not b!1112321) (not b!1112325))
(check-sat)

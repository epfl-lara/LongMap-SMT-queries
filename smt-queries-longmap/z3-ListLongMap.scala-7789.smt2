; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97472 () Bool)

(assert start!97472)

(declare-fun b!1112430 () Bool)

(declare-fun res!742389 () Bool)

(declare-fun e!634220 () Bool)

(assert (=> b!1112430 (=> (not res!742389) (not e!634220))))

(declare-datatypes ((array!72228 0))(
  ( (array!72229 (arr!34767 (Array (_ BitVec 32) (_ BitVec 64))) (size!35305 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72228)

(declare-datatypes ((List!24324 0))(
  ( (Nil!24321) (Cons!24320 (h!25529 (_ BitVec 64)) (t!34796 List!24324)) )
))
(declare-fun arrayNoDuplicates!0 (array!72228 (_ BitVec 32) List!24324) Bool)

(assert (=> b!1112430 (= res!742389 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24321))))

(declare-fun b!1112431 () Bool)

(declare-fun res!742393 () Bool)

(assert (=> b!1112431 (=> (not res!742393) (not e!634220))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112431 (= res!742393 (validMask!0 mask!1564))))

(declare-fun b!1112432 () Bool)

(declare-fun res!742384 () Bool)

(assert (=> b!1112432 (=> (not res!742384) (not e!634220))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42073 0))(
  ( (V!42074 (val!13911 Int)) )
))
(declare-datatypes ((ValueCell!13145 0))(
  ( (ValueCellFull!13145 (v!16543 V!42073)) (EmptyCell!13145) )
))
(declare-datatypes ((array!72230 0))(
  ( (array!72231 (arr!34768 (Array (_ BitVec 32) ValueCell!13145)) (size!35306 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72230)

(assert (=> b!1112432 (= res!742384 (and (= (size!35306 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35305 _keys!1208) (size!35306 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112433 () Bool)

(declare-fun e!634224 () Bool)

(declare-fun tp_is_empty!27709 () Bool)

(assert (=> b!1112433 (= e!634224 tp_is_empty!27709)))

(declare-fun mapNonEmpty!43381 () Bool)

(declare-fun mapRes!43381 () Bool)

(declare-fun tp!82625 () Bool)

(declare-fun e!634219 () Bool)

(assert (=> mapNonEmpty!43381 (= mapRes!43381 (and tp!82625 e!634219))))

(declare-fun mapRest!43381 () (Array (_ BitVec 32) ValueCell!13145))

(declare-fun mapValue!43381 () ValueCell!13145)

(declare-fun mapKey!43381 () (_ BitVec 32))

(assert (=> mapNonEmpty!43381 (= (arr!34768 _values!996) (store mapRest!43381 mapKey!43381 mapValue!43381))))

(declare-fun res!742387 () Bool)

(assert (=> start!97472 (=> (not res!742387) (not e!634220))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97472 (= res!742387 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35305 _keys!1208))))))

(assert (=> start!97472 e!634220))

(declare-fun array_inv!26804 (array!72228) Bool)

(assert (=> start!97472 (array_inv!26804 _keys!1208)))

(assert (=> start!97472 true))

(declare-fun e!634221 () Bool)

(declare-fun array_inv!26805 (array!72230) Bool)

(assert (=> start!97472 (and (array_inv!26805 _values!996) e!634221)))

(declare-fun b!1112434 () Bool)

(declare-fun e!634223 () Bool)

(assert (=> b!1112434 (= e!634220 e!634223)))

(declare-fun res!742390 () Bool)

(assert (=> b!1112434 (=> (not res!742390) (not e!634223))))

(declare-fun lt!496338 () array!72228)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72228 (_ BitVec 32)) Bool)

(assert (=> b!1112434 (= res!742390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496338 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112434 (= lt!496338 (array!72229 (store (arr!34767 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35305 _keys!1208)))))

(declare-fun mapIsEmpty!43381 () Bool)

(assert (=> mapIsEmpty!43381 mapRes!43381))

(declare-fun b!1112435 () Bool)

(assert (=> b!1112435 (= e!634219 tp_is_empty!27709)))

(declare-fun b!1112436 () Bool)

(declare-fun res!742392 () Bool)

(assert (=> b!1112436 (=> (not res!742392) (not e!634220))))

(assert (=> b!1112436 (= res!742392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112437 () Bool)

(assert (=> b!1112437 (= e!634223 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112437 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36325 0))(
  ( (Unit!36326) )
))
(declare-fun lt!496337 () Unit!36325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72228 (_ BitVec 64) (_ BitVec 32)) Unit!36325)

(assert (=> b!1112437 (= lt!496337 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112438 () Bool)

(declare-fun res!742386 () Bool)

(assert (=> b!1112438 (=> (not res!742386) (not e!634220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112438 (= res!742386 (validKeyInArray!0 k0!934))))

(declare-fun b!1112439 () Bool)

(declare-fun res!742388 () Bool)

(assert (=> b!1112439 (=> (not res!742388) (not e!634220))))

(assert (=> b!1112439 (= res!742388 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35305 _keys!1208))))))

(declare-fun b!1112440 () Bool)

(assert (=> b!1112440 (= e!634221 (and e!634224 mapRes!43381))))

(declare-fun condMapEmpty!43381 () Bool)

(declare-fun mapDefault!43381 () ValueCell!13145)

(assert (=> b!1112440 (= condMapEmpty!43381 (= (arr!34768 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13145)) mapDefault!43381)))))

(declare-fun b!1112441 () Bool)

(declare-fun res!742391 () Bool)

(assert (=> b!1112441 (=> (not res!742391) (not e!634223))))

(assert (=> b!1112441 (= res!742391 (arrayNoDuplicates!0 lt!496338 #b00000000000000000000000000000000 Nil!24321))))

(declare-fun b!1112442 () Bool)

(declare-fun res!742385 () Bool)

(assert (=> b!1112442 (=> (not res!742385) (not e!634220))))

(assert (=> b!1112442 (= res!742385 (= (select (arr!34767 _keys!1208) i!673) k0!934))))

(assert (= (and start!97472 res!742387) b!1112431))

(assert (= (and b!1112431 res!742393) b!1112432))

(assert (= (and b!1112432 res!742384) b!1112436))

(assert (= (and b!1112436 res!742392) b!1112430))

(assert (= (and b!1112430 res!742389) b!1112439))

(assert (= (and b!1112439 res!742388) b!1112438))

(assert (= (and b!1112438 res!742386) b!1112442))

(assert (= (and b!1112442 res!742385) b!1112434))

(assert (= (and b!1112434 res!742390) b!1112441))

(assert (= (and b!1112441 res!742391) b!1112437))

(assert (= (and b!1112440 condMapEmpty!43381) mapIsEmpty!43381))

(assert (= (and b!1112440 (not condMapEmpty!43381)) mapNonEmpty!43381))

(get-info :version)

(assert (= (and mapNonEmpty!43381 ((_ is ValueCellFull!13145) mapValue!43381)) b!1112435))

(assert (= (and b!1112440 ((_ is ValueCellFull!13145) mapDefault!43381)) b!1112433))

(assert (= start!97472 b!1112440))

(declare-fun m!1029435 () Bool)

(assert (=> start!97472 m!1029435))

(declare-fun m!1029437 () Bool)

(assert (=> start!97472 m!1029437))

(declare-fun m!1029439 () Bool)

(assert (=> b!1112442 m!1029439))

(declare-fun m!1029441 () Bool)

(assert (=> b!1112431 m!1029441))

(declare-fun m!1029443 () Bool)

(assert (=> b!1112438 m!1029443))

(declare-fun m!1029445 () Bool)

(assert (=> b!1112430 m!1029445))

(declare-fun m!1029447 () Bool)

(assert (=> b!1112436 m!1029447))

(declare-fun m!1029449 () Bool)

(assert (=> mapNonEmpty!43381 m!1029449))

(declare-fun m!1029451 () Bool)

(assert (=> b!1112434 m!1029451))

(declare-fun m!1029453 () Bool)

(assert (=> b!1112434 m!1029453))

(declare-fun m!1029455 () Bool)

(assert (=> b!1112441 m!1029455))

(declare-fun m!1029457 () Bool)

(assert (=> b!1112437 m!1029457))

(declare-fun m!1029459 () Bool)

(assert (=> b!1112437 m!1029459))

(check-sat (not b!1112441) (not b!1112436) (not start!97472) (not b!1112431) (not b!1112437) (not b!1112430) (not b!1112434) tp_is_empty!27709 (not mapNonEmpty!43381) (not b!1112438))
(check-sat)

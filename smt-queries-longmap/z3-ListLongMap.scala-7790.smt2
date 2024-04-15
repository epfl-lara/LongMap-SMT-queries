; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97478 () Bool)

(assert start!97478)

(declare-fun b!1112547 () Bool)

(declare-fun res!742475 () Bool)

(declare-fun e!634274 () Bool)

(assert (=> b!1112547 (=> (not res!742475) (not e!634274))))

(declare-datatypes ((array!72238 0))(
  ( (array!72239 (arr!34772 (Array (_ BitVec 32) (_ BitVec 64))) (size!35310 (_ BitVec 32))) )
))
(declare-fun lt!496356 () array!72238)

(declare-datatypes ((List!24326 0))(
  ( (Nil!24323) (Cons!24322 (h!25531 (_ BitVec 64)) (t!34798 List!24326)) )
))
(declare-fun arrayNoDuplicates!0 (array!72238 (_ BitVec 32) List!24326) Bool)

(assert (=> b!1112547 (= res!742475 (arrayNoDuplicates!0 lt!496356 #b00000000000000000000000000000000 Nil!24323))))

(declare-fun b!1112548 () Bool)

(declare-fun res!742478 () Bool)

(declare-fun e!634273 () Bool)

(assert (=> b!1112548 (=> (not res!742478) (not e!634273))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112548 (= res!742478 (validKeyInArray!0 k0!934))))

(declare-fun res!742480 () Bool)

(assert (=> start!97478 (=> (not res!742480) (not e!634273))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72238)

(assert (=> start!97478 (= res!742480 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35310 _keys!1208))))))

(assert (=> start!97478 e!634273))

(declare-fun array_inv!26808 (array!72238) Bool)

(assert (=> start!97478 (array_inv!26808 _keys!1208)))

(assert (=> start!97478 true))

(declare-datatypes ((V!42081 0))(
  ( (V!42082 (val!13914 Int)) )
))
(declare-datatypes ((ValueCell!13148 0))(
  ( (ValueCellFull!13148 (v!16546 V!42081)) (EmptyCell!13148) )
))
(declare-datatypes ((array!72240 0))(
  ( (array!72241 (arr!34773 (Array (_ BitVec 32) ValueCell!13148)) (size!35311 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72240)

(declare-fun e!634276 () Bool)

(declare-fun array_inv!26809 (array!72240) Bool)

(assert (=> start!97478 (and (array_inv!26809 _values!996) e!634276)))

(declare-fun mapNonEmpty!43390 () Bool)

(declare-fun mapRes!43390 () Bool)

(declare-fun tp!82634 () Bool)

(declare-fun e!634277 () Bool)

(assert (=> mapNonEmpty!43390 (= mapRes!43390 (and tp!82634 e!634277))))

(declare-fun mapValue!43390 () ValueCell!13148)

(declare-fun mapRest!43390 () (Array (_ BitVec 32) ValueCell!13148))

(declare-fun mapKey!43390 () (_ BitVec 32))

(assert (=> mapNonEmpty!43390 (= (arr!34773 _values!996) (store mapRest!43390 mapKey!43390 mapValue!43390))))

(declare-fun mapIsEmpty!43390 () Bool)

(assert (=> mapIsEmpty!43390 mapRes!43390))

(declare-fun b!1112549 () Bool)

(declare-fun res!742483 () Bool)

(assert (=> b!1112549 (=> (not res!742483) (not e!634273))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112549 (= res!742483 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35310 _keys!1208))))))

(declare-fun b!1112550 () Bool)

(declare-fun res!742479 () Bool)

(assert (=> b!1112550 (=> (not res!742479) (not e!634273))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72238 (_ BitVec 32)) Bool)

(assert (=> b!1112550 (= res!742479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112551 () Bool)

(declare-fun res!742481 () Bool)

(assert (=> b!1112551 (=> (not res!742481) (not e!634273))))

(assert (=> b!1112551 (= res!742481 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24323))))

(declare-fun b!1112552 () Bool)

(declare-fun res!742476 () Bool)

(assert (=> b!1112552 (=> (not res!742476) (not e!634273))))

(assert (=> b!1112552 (= res!742476 (= (select (arr!34772 _keys!1208) i!673) k0!934))))

(declare-fun b!1112553 () Bool)

(declare-fun tp_is_empty!27715 () Bool)

(assert (=> b!1112553 (= e!634277 tp_is_empty!27715)))

(declare-fun b!1112554 () Bool)

(declare-fun res!742474 () Bool)

(assert (=> b!1112554 (=> (not res!742474) (not e!634273))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112554 (= res!742474 (and (= (size!35311 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35310 _keys!1208) (size!35311 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112555 () Bool)

(declare-fun e!634275 () Bool)

(assert (=> b!1112555 (= e!634276 (and e!634275 mapRes!43390))))

(declare-fun condMapEmpty!43390 () Bool)

(declare-fun mapDefault!43390 () ValueCell!13148)

(assert (=> b!1112555 (= condMapEmpty!43390 (= (arr!34773 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13148)) mapDefault!43390)))))

(declare-fun b!1112556 () Bool)

(assert (=> b!1112556 (= e!634274 (not true))))

(declare-fun arrayContainsKey!0 (array!72238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112556 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36329 0))(
  ( (Unit!36330) )
))
(declare-fun lt!496355 () Unit!36329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72238 (_ BitVec 64) (_ BitVec 32)) Unit!36329)

(assert (=> b!1112556 (= lt!496355 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112557 () Bool)

(assert (=> b!1112557 (= e!634273 e!634274)))

(declare-fun res!742477 () Bool)

(assert (=> b!1112557 (=> (not res!742477) (not e!634274))))

(assert (=> b!1112557 (= res!742477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496356 mask!1564))))

(assert (=> b!1112557 (= lt!496356 (array!72239 (store (arr!34772 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35310 _keys!1208)))))

(declare-fun b!1112558 () Bool)

(assert (=> b!1112558 (= e!634275 tp_is_empty!27715)))

(declare-fun b!1112559 () Bool)

(declare-fun res!742482 () Bool)

(assert (=> b!1112559 (=> (not res!742482) (not e!634273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112559 (= res!742482 (validMask!0 mask!1564))))

(assert (= (and start!97478 res!742480) b!1112559))

(assert (= (and b!1112559 res!742482) b!1112554))

(assert (= (and b!1112554 res!742474) b!1112550))

(assert (= (and b!1112550 res!742479) b!1112551))

(assert (= (and b!1112551 res!742481) b!1112549))

(assert (= (and b!1112549 res!742483) b!1112548))

(assert (= (and b!1112548 res!742478) b!1112552))

(assert (= (and b!1112552 res!742476) b!1112557))

(assert (= (and b!1112557 res!742477) b!1112547))

(assert (= (and b!1112547 res!742475) b!1112556))

(assert (= (and b!1112555 condMapEmpty!43390) mapIsEmpty!43390))

(assert (= (and b!1112555 (not condMapEmpty!43390)) mapNonEmpty!43390))

(get-info :version)

(assert (= (and mapNonEmpty!43390 ((_ is ValueCellFull!13148) mapValue!43390)) b!1112553))

(assert (= (and b!1112555 ((_ is ValueCellFull!13148) mapDefault!43390)) b!1112558))

(assert (= start!97478 b!1112555))

(declare-fun m!1029513 () Bool)

(assert (=> start!97478 m!1029513))

(declare-fun m!1029515 () Bool)

(assert (=> start!97478 m!1029515))

(declare-fun m!1029517 () Bool)

(assert (=> b!1112552 m!1029517))

(declare-fun m!1029519 () Bool)

(assert (=> b!1112550 m!1029519))

(declare-fun m!1029521 () Bool)

(assert (=> b!1112557 m!1029521))

(declare-fun m!1029523 () Bool)

(assert (=> b!1112557 m!1029523))

(declare-fun m!1029525 () Bool)

(assert (=> mapNonEmpty!43390 m!1029525))

(declare-fun m!1029527 () Bool)

(assert (=> b!1112548 m!1029527))

(declare-fun m!1029529 () Bool)

(assert (=> b!1112559 m!1029529))

(declare-fun m!1029531 () Bool)

(assert (=> b!1112551 m!1029531))

(declare-fun m!1029533 () Bool)

(assert (=> b!1112547 m!1029533))

(declare-fun m!1029535 () Bool)

(assert (=> b!1112556 m!1029535))

(declare-fun m!1029537 () Bool)

(assert (=> b!1112556 m!1029537))

(check-sat (not b!1112556) (not b!1112550) (not b!1112557) (not start!97478) (not b!1112547) (not b!1112551) (not b!1112559) tp_is_empty!27715 (not mapNonEmpty!43390) (not b!1112548))
(check-sat)

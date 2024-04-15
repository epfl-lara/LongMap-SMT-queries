; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97550 () Bool)

(assert start!97550)

(declare-fun b!1113951 () Bool)

(declare-fun res!743558 () Bool)

(declare-fun e!634924 () Bool)

(assert (=> b!1113951 (=> (not res!743558) (not e!634924))))

(declare-datatypes ((array!72380 0))(
  ( (array!72381 (arr!34843 (Array (_ BitVec 32) (_ BitVec 64))) (size!35381 (_ BitVec 32))) )
))
(declare-fun lt!496572 () array!72380)

(declare-datatypes ((List!24355 0))(
  ( (Nil!24352) (Cons!24351 (h!25560 (_ BitVec 64)) (t!34827 List!24355)) )
))
(declare-fun arrayNoDuplicates!0 (array!72380 (_ BitVec 32) List!24355) Bool)

(assert (=> b!1113951 (= res!743558 (arrayNoDuplicates!0 lt!496572 #b00000000000000000000000000000000 Nil!24352))))

(declare-fun mapIsEmpty!43498 () Bool)

(declare-fun mapRes!43498 () Bool)

(assert (=> mapIsEmpty!43498 mapRes!43498))

(declare-fun b!1113952 () Bool)

(assert (=> b!1113952 (= e!634924 (not true))))

(declare-fun _keys!1208 () array!72380)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113952 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36381 0))(
  ( (Unit!36382) )
))
(declare-fun lt!496571 () Unit!36381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72380 (_ BitVec 64) (_ BitVec 32)) Unit!36381)

(assert (=> b!1113952 (= lt!496571 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113953 () Bool)

(declare-fun e!634921 () Bool)

(assert (=> b!1113953 (= e!634921 e!634924)))

(declare-fun res!743563 () Bool)

(assert (=> b!1113953 (=> (not res!743563) (not e!634924))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72380 (_ BitVec 32)) Bool)

(assert (=> b!1113953 (= res!743563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496572 mask!1564))))

(assert (=> b!1113953 (= lt!496572 (array!72381 (store (arr!34843 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35381 _keys!1208)))))

(declare-fun b!1113954 () Bool)

(declare-fun res!743561 () Bool)

(assert (=> b!1113954 (=> (not res!743561) (not e!634921))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42177 0))(
  ( (V!42178 (val!13950 Int)) )
))
(declare-datatypes ((ValueCell!13184 0))(
  ( (ValueCellFull!13184 (v!16582 V!42177)) (EmptyCell!13184) )
))
(declare-datatypes ((array!72382 0))(
  ( (array!72383 (arr!34844 (Array (_ BitVec 32) ValueCell!13184)) (size!35382 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72382)

(assert (=> b!1113954 (= res!743561 (and (= (size!35382 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35381 _keys!1208) (size!35382 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43498 () Bool)

(declare-fun tp!82742 () Bool)

(declare-fun e!634925 () Bool)

(assert (=> mapNonEmpty!43498 (= mapRes!43498 (and tp!82742 e!634925))))

(declare-fun mapRest!43498 () (Array (_ BitVec 32) ValueCell!13184))

(declare-fun mapKey!43498 () (_ BitVec 32))

(declare-fun mapValue!43498 () ValueCell!13184)

(assert (=> mapNonEmpty!43498 (= (arr!34844 _values!996) (store mapRest!43498 mapKey!43498 mapValue!43498))))

(declare-fun b!1113956 () Bool)

(declare-fun res!743555 () Bool)

(assert (=> b!1113956 (=> (not res!743555) (not e!634921))))

(assert (=> b!1113956 (= res!743555 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24352))))

(declare-fun res!743557 () Bool)

(assert (=> start!97550 (=> (not res!743557) (not e!634921))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97550 (= res!743557 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35381 _keys!1208))))))

(assert (=> start!97550 e!634921))

(declare-fun array_inv!26864 (array!72380) Bool)

(assert (=> start!97550 (array_inv!26864 _keys!1208)))

(assert (=> start!97550 true))

(declare-fun e!634923 () Bool)

(declare-fun array_inv!26865 (array!72382) Bool)

(assert (=> start!97550 (and (array_inv!26865 _values!996) e!634923)))

(declare-fun b!1113955 () Bool)

(declare-fun e!634922 () Bool)

(assert (=> b!1113955 (= e!634923 (and e!634922 mapRes!43498))))

(declare-fun condMapEmpty!43498 () Bool)

(declare-fun mapDefault!43498 () ValueCell!13184)

(assert (=> b!1113955 (= condMapEmpty!43498 (= (arr!34844 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13184)) mapDefault!43498)))))

(declare-fun b!1113957 () Bool)

(declare-fun res!743556 () Bool)

(assert (=> b!1113957 (=> (not res!743556) (not e!634921))))

(assert (=> b!1113957 (= res!743556 (= (select (arr!34843 _keys!1208) i!673) k0!934))))

(declare-fun b!1113958 () Bool)

(declare-fun res!743562 () Bool)

(assert (=> b!1113958 (=> (not res!743562) (not e!634921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113958 (= res!743562 (validMask!0 mask!1564))))

(declare-fun b!1113959 () Bool)

(declare-fun res!743554 () Bool)

(assert (=> b!1113959 (=> (not res!743554) (not e!634921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113959 (= res!743554 (validKeyInArray!0 k0!934))))

(declare-fun b!1113960 () Bool)

(declare-fun res!743559 () Bool)

(assert (=> b!1113960 (=> (not res!743559) (not e!634921))))

(assert (=> b!1113960 (= res!743559 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35381 _keys!1208))))))

(declare-fun b!1113961 () Bool)

(declare-fun tp_is_empty!27787 () Bool)

(assert (=> b!1113961 (= e!634925 tp_is_empty!27787)))

(declare-fun b!1113962 () Bool)

(assert (=> b!1113962 (= e!634922 tp_is_empty!27787)))

(declare-fun b!1113963 () Bool)

(declare-fun res!743560 () Bool)

(assert (=> b!1113963 (=> (not res!743560) (not e!634921))))

(assert (=> b!1113963 (= res!743560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97550 res!743557) b!1113958))

(assert (= (and b!1113958 res!743562) b!1113954))

(assert (= (and b!1113954 res!743561) b!1113963))

(assert (= (and b!1113963 res!743560) b!1113956))

(assert (= (and b!1113956 res!743555) b!1113960))

(assert (= (and b!1113960 res!743559) b!1113959))

(assert (= (and b!1113959 res!743554) b!1113957))

(assert (= (and b!1113957 res!743556) b!1113953))

(assert (= (and b!1113953 res!743563) b!1113951))

(assert (= (and b!1113951 res!743558) b!1113952))

(assert (= (and b!1113955 condMapEmpty!43498) mapIsEmpty!43498))

(assert (= (and b!1113955 (not condMapEmpty!43498)) mapNonEmpty!43498))

(get-info :version)

(assert (= (and mapNonEmpty!43498 ((_ is ValueCellFull!13184) mapValue!43498)) b!1113961))

(assert (= (and b!1113955 ((_ is ValueCellFull!13184) mapDefault!43498)) b!1113962))

(assert (= start!97550 b!1113955))

(declare-fun m!1030449 () Bool)

(assert (=> b!1113953 m!1030449))

(declare-fun m!1030451 () Bool)

(assert (=> b!1113953 m!1030451))

(declare-fun m!1030453 () Bool)

(assert (=> start!97550 m!1030453))

(declare-fun m!1030455 () Bool)

(assert (=> start!97550 m!1030455))

(declare-fun m!1030457 () Bool)

(assert (=> b!1113951 m!1030457))

(declare-fun m!1030459 () Bool)

(assert (=> b!1113952 m!1030459))

(declare-fun m!1030461 () Bool)

(assert (=> b!1113952 m!1030461))

(declare-fun m!1030463 () Bool)

(assert (=> b!1113956 m!1030463))

(declare-fun m!1030465 () Bool)

(assert (=> mapNonEmpty!43498 m!1030465))

(declare-fun m!1030467 () Bool)

(assert (=> b!1113957 m!1030467))

(declare-fun m!1030469 () Bool)

(assert (=> b!1113963 m!1030469))

(declare-fun m!1030471 () Bool)

(assert (=> b!1113958 m!1030471))

(declare-fun m!1030473 () Bool)

(assert (=> b!1113959 m!1030473))

(check-sat (not b!1113956) (not b!1113959) tp_is_empty!27787 (not b!1113953) (not b!1113952) (not b!1113963) (not mapNonEmpty!43498) (not b!1113951) (not b!1113958) (not start!97550))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97498 () Bool)

(assert start!97498)

(declare-fun b!1112949 () Bool)

(declare-fun res!742760 () Bool)

(declare-fun e!634480 () Bool)

(assert (=> b!1112949 (=> (not res!742760) (not e!634480))))

(declare-datatypes ((array!72367 0))(
  ( (array!72368 (arr!34836 (Array (_ BitVec 32) (_ BitVec 64))) (size!35372 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72367)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42099 0))(
  ( (V!42100 (val!13921 Int)) )
))
(declare-datatypes ((ValueCell!13155 0))(
  ( (ValueCellFull!13155 (v!16554 V!42099)) (EmptyCell!13155) )
))
(declare-datatypes ((array!72369 0))(
  ( (array!72370 (arr!34837 (Array (_ BitVec 32) ValueCell!13155)) (size!35373 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72369)

(assert (=> b!1112949 (= res!742760 (and (= (size!35373 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35372 _keys!1208) (size!35373 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112950 () Bool)

(declare-fun res!742753 () Bool)

(assert (=> b!1112950 (=> (not res!742753) (not e!634480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112950 (= res!742753 (validMask!0 mask!1564))))

(declare-fun b!1112951 () Bool)

(declare-fun e!634485 () Bool)

(assert (=> b!1112951 (= e!634485 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112951 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36520 0))(
  ( (Unit!36521) )
))
(declare-fun lt!496597 () Unit!36520)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72367 (_ BitVec 64) (_ BitVec 32)) Unit!36520)

(assert (=> b!1112951 (= lt!496597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112952 () Bool)

(declare-fun res!742754 () Bool)

(assert (=> b!1112952 (=> (not res!742754) (not e!634485))))

(declare-fun lt!496598 () array!72367)

(declare-datatypes ((List!24301 0))(
  ( (Nil!24298) (Cons!24297 (h!25506 (_ BitVec 64)) (t!34782 List!24301)) )
))
(declare-fun arrayNoDuplicates!0 (array!72367 (_ BitVec 32) List!24301) Bool)

(assert (=> b!1112952 (= res!742754 (arrayNoDuplicates!0 lt!496598 #b00000000000000000000000000000000 Nil!24298))))

(declare-fun b!1112953 () Bool)

(declare-fun res!742759 () Bool)

(assert (=> b!1112953 (=> (not res!742759) (not e!634480))))

(assert (=> b!1112953 (= res!742759 (= (select (arr!34836 _keys!1208) i!673) k0!934))))

(declare-fun b!1112954 () Bool)

(declare-fun e!634484 () Bool)

(declare-fun e!634482 () Bool)

(declare-fun mapRes!43411 () Bool)

(assert (=> b!1112954 (= e!634484 (and e!634482 mapRes!43411))))

(declare-fun condMapEmpty!43411 () Bool)

(declare-fun mapDefault!43411 () ValueCell!13155)

(assert (=> b!1112954 (= condMapEmpty!43411 (= (arr!34837 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13155)) mapDefault!43411)))))

(declare-fun b!1112955 () Bool)

(declare-fun res!742755 () Bool)

(assert (=> b!1112955 (=> (not res!742755) (not e!634480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112955 (= res!742755 (validKeyInArray!0 k0!934))))

(declare-fun b!1112956 () Bool)

(declare-fun res!742758 () Bool)

(assert (=> b!1112956 (=> (not res!742758) (not e!634480))))

(assert (=> b!1112956 (= res!742758 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35372 _keys!1208))))))

(declare-fun mapIsEmpty!43411 () Bool)

(assert (=> mapIsEmpty!43411 mapRes!43411))

(declare-fun b!1112957 () Bool)

(declare-fun e!634481 () Bool)

(declare-fun tp_is_empty!27729 () Bool)

(assert (=> b!1112957 (= e!634481 tp_is_empty!27729)))

(declare-fun mapNonEmpty!43411 () Bool)

(declare-fun tp!82655 () Bool)

(assert (=> mapNonEmpty!43411 (= mapRes!43411 (and tp!82655 e!634481))))

(declare-fun mapKey!43411 () (_ BitVec 32))

(declare-fun mapValue!43411 () ValueCell!13155)

(declare-fun mapRest!43411 () (Array (_ BitVec 32) ValueCell!13155))

(assert (=> mapNonEmpty!43411 (= (arr!34837 _values!996) (store mapRest!43411 mapKey!43411 mapValue!43411))))

(declare-fun res!742761 () Bool)

(assert (=> start!97498 (=> (not res!742761) (not e!634480))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97498 (= res!742761 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35372 _keys!1208))))))

(assert (=> start!97498 e!634480))

(declare-fun array_inv!26788 (array!72367) Bool)

(assert (=> start!97498 (array_inv!26788 _keys!1208)))

(assert (=> start!97498 true))

(declare-fun array_inv!26789 (array!72369) Bool)

(assert (=> start!97498 (and (array_inv!26789 _values!996) e!634484)))

(declare-fun b!1112958 () Bool)

(assert (=> b!1112958 (= e!634480 e!634485)))

(declare-fun res!742762 () Bool)

(assert (=> b!1112958 (=> (not res!742762) (not e!634485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72367 (_ BitVec 32)) Bool)

(assert (=> b!1112958 (= res!742762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496598 mask!1564))))

(assert (=> b!1112958 (= lt!496598 (array!72368 (store (arr!34836 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35372 _keys!1208)))))

(declare-fun b!1112959 () Bool)

(declare-fun res!742756 () Bool)

(assert (=> b!1112959 (=> (not res!742756) (not e!634480))))

(assert (=> b!1112959 (= res!742756 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24298))))

(declare-fun b!1112960 () Bool)

(declare-fun res!742757 () Bool)

(assert (=> b!1112960 (=> (not res!742757) (not e!634480))))

(assert (=> b!1112960 (= res!742757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112961 () Bool)

(assert (=> b!1112961 (= e!634482 tp_is_empty!27729)))

(assert (= (and start!97498 res!742761) b!1112950))

(assert (= (and b!1112950 res!742753) b!1112949))

(assert (= (and b!1112949 res!742760) b!1112960))

(assert (= (and b!1112960 res!742757) b!1112959))

(assert (= (and b!1112959 res!742756) b!1112956))

(assert (= (and b!1112956 res!742758) b!1112955))

(assert (= (and b!1112955 res!742755) b!1112953))

(assert (= (and b!1112953 res!742759) b!1112958))

(assert (= (and b!1112958 res!742762) b!1112952))

(assert (= (and b!1112952 res!742754) b!1112951))

(assert (= (and b!1112954 condMapEmpty!43411) mapIsEmpty!43411))

(assert (= (and b!1112954 (not condMapEmpty!43411)) mapNonEmpty!43411))

(get-info :version)

(assert (= (and mapNonEmpty!43411 ((_ is ValueCellFull!13155) mapValue!43411)) b!1112957))

(assert (= (and b!1112954 ((_ is ValueCellFull!13155) mapDefault!43411)) b!1112961))

(assert (= start!97498 b!1112954))

(declare-fun m!1030321 () Bool)

(assert (=> mapNonEmpty!43411 m!1030321))

(declare-fun m!1030323 () Bool)

(assert (=> b!1112953 m!1030323))

(declare-fun m!1030325 () Bool)

(assert (=> b!1112952 m!1030325))

(declare-fun m!1030327 () Bool)

(assert (=> start!97498 m!1030327))

(declare-fun m!1030329 () Bool)

(assert (=> start!97498 m!1030329))

(declare-fun m!1030331 () Bool)

(assert (=> b!1112955 m!1030331))

(declare-fun m!1030333 () Bool)

(assert (=> b!1112960 m!1030333))

(declare-fun m!1030335 () Bool)

(assert (=> b!1112958 m!1030335))

(declare-fun m!1030337 () Bool)

(assert (=> b!1112958 m!1030337))

(declare-fun m!1030339 () Bool)

(assert (=> b!1112950 m!1030339))

(declare-fun m!1030341 () Bool)

(assert (=> b!1112951 m!1030341))

(declare-fun m!1030343 () Bool)

(assert (=> b!1112951 m!1030343))

(declare-fun m!1030345 () Bool)

(assert (=> b!1112959 m!1030345))

(check-sat (not b!1112950) tp_is_empty!27729 (not b!1112958) (not b!1112959) (not b!1112955) (not b!1112951) (not mapNonEmpty!43411) (not start!97498) (not b!1112952) (not b!1112960))
(check-sat)

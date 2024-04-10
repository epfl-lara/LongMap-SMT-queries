; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97606 () Bool)

(assert start!97606)

(declare-fun b!1115055 () Bool)

(declare-fun e!635453 () Bool)

(declare-fun e!635455 () Bool)

(assert (=> b!1115055 (= e!635453 e!635455)))

(declare-fun res!744377 () Bool)

(assert (=> b!1115055 (=> (not res!744377) (not e!635455))))

(declare-datatypes ((array!72577 0))(
  ( (array!72578 (arr!34941 (Array (_ BitVec 32) (_ BitVec 64))) (size!35477 (_ BitVec 32))) )
))
(declare-fun lt!496922 () array!72577)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72577 (_ BitVec 32)) Bool)

(assert (=> b!1115055 (= res!744377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496922 mask!1564))))

(declare-fun _keys!1208 () array!72577)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115055 (= lt!496922 (array!72578 (store (arr!34941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35477 _keys!1208)))))

(declare-fun b!1115056 () Bool)

(declare-fun res!744375 () Bool)

(assert (=> b!1115056 (=> (not res!744375) (not e!635453))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115056 (= res!744375 (validKeyInArray!0 k0!934))))

(declare-fun b!1115057 () Bool)

(declare-fun res!744373 () Bool)

(assert (=> b!1115057 (=> (not res!744373) (not e!635455))))

(declare-datatypes ((List!24340 0))(
  ( (Nil!24337) (Cons!24336 (h!25545 (_ BitVec 64)) (t!34821 List!24340)) )
))
(declare-fun arrayNoDuplicates!0 (array!72577 (_ BitVec 32) List!24340) Bool)

(assert (=> b!1115057 (= res!744373 (arrayNoDuplicates!0 lt!496922 #b00000000000000000000000000000000 Nil!24337))))

(declare-fun b!1115058 () Bool)

(declare-fun e!635454 () Bool)

(declare-fun e!635452 () Bool)

(declare-fun mapRes!43573 () Bool)

(assert (=> b!1115058 (= e!635454 (and e!635452 mapRes!43573))))

(declare-fun condMapEmpty!43573 () Bool)

(declare-datatypes ((V!42243 0))(
  ( (V!42244 (val!13975 Int)) )
))
(declare-datatypes ((ValueCell!13209 0))(
  ( (ValueCellFull!13209 (v!16608 V!42243)) (EmptyCell!13209) )
))
(declare-datatypes ((array!72579 0))(
  ( (array!72580 (arr!34942 (Array (_ BitVec 32) ValueCell!13209)) (size!35478 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72579)

(declare-fun mapDefault!43573 () ValueCell!13209)

(assert (=> b!1115058 (= condMapEmpty!43573 (= (arr!34942 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13209)) mapDefault!43573)))))

(declare-fun mapIsEmpty!43573 () Bool)

(assert (=> mapIsEmpty!43573 mapRes!43573))

(declare-fun b!1115059 () Bool)

(declare-fun tp_is_empty!27837 () Bool)

(assert (=> b!1115059 (= e!635452 tp_is_empty!27837)))

(declare-fun b!1115061 () Bool)

(declare-fun res!744378 () Bool)

(assert (=> b!1115061 (=> (not res!744378) (not e!635453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115061 (= res!744378 (validMask!0 mask!1564))))

(declare-fun b!1115062 () Bool)

(declare-fun res!744382 () Bool)

(assert (=> b!1115062 (=> (not res!744382) (not e!635453))))

(assert (=> b!1115062 (= res!744382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115063 () Bool)

(declare-fun res!744374 () Bool)

(assert (=> b!1115063 (=> (not res!744374) (not e!635453))))

(assert (=> b!1115063 (= res!744374 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35477 _keys!1208))))))

(declare-fun b!1115064 () Bool)

(assert (=> b!1115064 (= e!635455 (not true))))

(declare-fun arrayContainsKey!0 (array!72577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115064 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36598 0))(
  ( (Unit!36599) )
))
(declare-fun lt!496921 () Unit!36598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72577 (_ BitVec 64) (_ BitVec 32)) Unit!36598)

(assert (=> b!1115064 (= lt!496921 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115060 () Bool)

(declare-fun res!744380 () Bool)

(assert (=> b!1115060 (=> (not res!744380) (not e!635453))))

(assert (=> b!1115060 (= res!744380 (= (select (arr!34941 _keys!1208) i!673) k0!934))))

(declare-fun res!744381 () Bool)

(assert (=> start!97606 (=> (not res!744381) (not e!635453))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97606 (= res!744381 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35477 _keys!1208))))))

(assert (=> start!97606 e!635453))

(declare-fun array_inv!26862 (array!72577) Bool)

(assert (=> start!97606 (array_inv!26862 _keys!1208)))

(assert (=> start!97606 true))

(declare-fun array_inv!26863 (array!72579) Bool)

(assert (=> start!97606 (and (array_inv!26863 _values!996) e!635454)))

(declare-fun b!1115065 () Bool)

(declare-fun res!744379 () Bool)

(assert (=> b!1115065 (=> (not res!744379) (not e!635453))))

(assert (=> b!1115065 (= res!744379 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24337))))

(declare-fun b!1115066 () Bool)

(declare-fun e!635457 () Bool)

(assert (=> b!1115066 (= e!635457 tp_is_empty!27837)))

(declare-fun b!1115067 () Bool)

(declare-fun res!744376 () Bool)

(assert (=> b!1115067 (=> (not res!744376) (not e!635453))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115067 (= res!744376 (and (= (size!35478 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35477 _keys!1208) (size!35478 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43573 () Bool)

(declare-fun tp!82817 () Bool)

(assert (=> mapNonEmpty!43573 (= mapRes!43573 (and tp!82817 e!635457))))

(declare-fun mapRest!43573 () (Array (_ BitVec 32) ValueCell!13209))

(declare-fun mapKey!43573 () (_ BitVec 32))

(declare-fun mapValue!43573 () ValueCell!13209)

(assert (=> mapNonEmpty!43573 (= (arr!34942 _values!996) (store mapRest!43573 mapKey!43573 mapValue!43573))))

(assert (= (and start!97606 res!744381) b!1115061))

(assert (= (and b!1115061 res!744378) b!1115067))

(assert (= (and b!1115067 res!744376) b!1115062))

(assert (= (and b!1115062 res!744382) b!1115065))

(assert (= (and b!1115065 res!744379) b!1115063))

(assert (= (and b!1115063 res!744374) b!1115056))

(assert (= (and b!1115056 res!744375) b!1115060))

(assert (= (and b!1115060 res!744380) b!1115055))

(assert (= (and b!1115055 res!744377) b!1115057))

(assert (= (and b!1115057 res!744373) b!1115064))

(assert (= (and b!1115058 condMapEmpty!43573) mapIsEmpty!43573))

(assert (= (and b!1115058 (not condMapEmpty!43573)) mapNonEmpty!43573))

(get-info :version)

(assert (= (and mapNonEmpty!43573 ((_ is ValueCellFull!13209) mapValue!43573)) b!1115066))

(assert (= (and b!1115058 ((_ is ValueCellFull!13209) mapDefault!43573)) b!1115059))

(assert (= start!97606 b!1115058))

(declare-fun m!1031725 () Bool)

(assert (=> b!1115065 m!1031725))

(declare-fun m!1031727 () Bool)

(assert (=> b!1115062 m!1031727))

(declare-fun m!1031729 () Bool)

(assert (=> b!1115061 m!1031729))

(declare-fun m!1031731 () Bool)

(assert (=> b!1115057 m!1031731))

(declare-fun m!1031733 () Bool)

(assert (=> mapNonEmpty!43573 m!1031733))

(declare-fun m!1031735 () Bool)

(assert (=> b!1115056 m!1031735))

(declare-fun m!1031737 () Bool)

(assert (=> b!1115064 m!1031737))

(declare-fun m!1031739 () Bool)

(assert (=> b!1115064 m!1031739))

(declare-fun m!1031741 () Bool)

(assert (=> start!97606 m!1031741))

(declare-fun m!1031743 () Bool)

(assert (=> start!97606 m!1031743))

(declare-fun m!1031745 () Bool)

(assert (=> b!1115060 m!1031745))

(declare-fun m!1031747 () Bool)

(assert (=> b!1115055 m!1031747))

(declare-fun m!1031749 () Bool)

(assert (=> b!1115055 m!1031749))

(check-sat (not start!97606) (not b!1115055) tp_is_empty!27837 (not b!1115064) (not b!1115062) (not b!1115061) (not mapNonEmpty!43573) (not b!1115057) (not b!1115056) (not b!1115065))
(check-sat)

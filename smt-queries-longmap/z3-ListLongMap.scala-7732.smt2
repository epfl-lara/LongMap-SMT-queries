; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97122 () Bool)

(assert start!97122)

(declare-fun b!1104668 () Bool)

(declare-fun res!737020 () Bool)

(declare-fun e!630535 () Bool)

(assert (=> b!1104668 (=> (not res!737020) (not e!630535))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104668 (= res!737020 (validKeyInArray!0 k0!934))))

(declare-fun b!1104669 () Bool)

(declare-fun res!737022 () Bool)

(assert (=> b!1104669 (=> (not res!737022) (not e!630535))))

(declare-datatypes ((array!71661 0))(
  ( (array!71662 (arr!34484 (Array (_ BitVec 32) (_ BitVec 64))) (size!35020 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71661)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41619 0))(
  ( (V!41620 (val!13741 Int)) )
))
(declare-datatypes ((ValueCell!12975 0))(
  ( (ValueCellFull!12975 (v!16374 V!41619)) (EmptyCell!12975) )
))
(declare-datatypes ((array!71663 0))(
  ( (array!71664 (arr!34485 (Array (_ BitVec 32) ValueCell!12975)) (size!35021 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71663)

(assert (=> b!1104669 (= res!737022 (and (= (size!35021 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35020 _keys!1208) (size!35021 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!737019 () Bool)

(assert (=> start!97122 (=> (not res!737019) (not e!630535))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97122 (= res!737019 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35020 _keys!1208))))))

(assert (=> start!97122 e!630535))

(declare-fun array_inv!26548 (array!71661) Bool)

(assert (=> start!97122 (array_inv!26548 _keys!1208)))

(assert (=> start!97122 true))

(declare-fun e!630536 () Bool)

(declare-fun array_inv!26549 (array!71663) Bool)

(assert (=> start!97122 (and (array_inv!26549 _values!996) e!630536)))

(declare-fun b!1104670 () Bool)

(declare-fun e!630539 () Bool)

(assert (=> b!1104670 (= e!630539 false)))

(declare-fun lt!495178 () Bool)

(declare-fun lt!495179 () array!71661)

(declare-datatypes ((List!24061 0))(
  ( (Nil!24058) (Cons!24057 (h!25266 (_ BitVec 64)) (t!34326 List!24061)) )
))
(declare-fun arrayNoDuplicates!0 (array!71661 (_ BitVec 32) List!24061) Bool)

(assert (=> b!1104670 (= lt!495178 (arrayNoDuplicates!0 lt!495179 #b00000000000000000000000000000000 Nil!24058))))

(declare-fun b!1104671 () Bool)

(assert (=> b!1104671 (= e!630535 e!630539)))

(declare-fun res!737023 () Bool)

(assert (=> b!1104671 (=> (not res!737023) (not e!630539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71661 (_ BitVec 32)) Bool)

(assert (=> b!1104671 (= res!737023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495179 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104671 (= lt!495179 (array!71662 (store (arr!34484 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35020 _keys!1208)))))

(declare-fun mapNonEmpty!42868 () Bool)

(declare-fun mapRes!42868 () Bool)

(declare-fun tp!81788 () Bool)

(declare-fun e!630537 () Bool)

(assert (=> mapNonEmpty!42868 (= mapRes!42868 (and tp!81788 e!630537))))

(declare-fun mapRest!42868 () (Array (_ BitVec 32) ValueCell!12975))

(declare-fun mapKey!42868 () (_ BitVec 32))

(declare-fun mapValue!42868 () ValueCell!12975)

(assert (=> mapNonEmpty!42868 (= (arr!34485 _values!996) (store mapRest!42868 mapKey!42868 mapValue!42868))))

(declare-fun b!1104672 () Bool)

(declare-fun res!737016 () Bool)

(assert (=> b!1104672 (=> (not res!737016) (not e!630535))))

(assert (=> b!1104672 (= res!737016 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35020 _keys!1208))))))

(declare-fun b!1104673 () Bool)

(declare-fun tp_is_empty!27369 () Bool)

(assert (=> b!1104673 (= e!630537 tp_is_empty!27369)))

(declare-fun b!1104674 () Bool)

(declare-fun res!737024 () Bool)

(assert (=> b!1104674 (=> (not res!737024) (not e!630535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104674 (= res!737024 (validMask!0 mask!1564))))

(declare-fun b!1104675 () Bool)

(declare-fun res!737018 () Bool)

(assert (=> b!1104675 (=> (not res!737018) (not e!630535))))

(assert (=> b!1104675 (= res!737018 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24058))))

(declare-fun b!1104676 () Bool)

(declare-fun res!737017 () Bool)

(assert (=> b!1104676 (=> (not res!737017) (not e!630535))))

(assert (=> b!1104676 (= res!737017 (= (select (arr!34484 _keys!1208) i!673) k0!934))))

(declare-fun b!1104677 () Bool)

(declare-fun e!630534 () Bool)

(assert (=> b!1104677 (= e!630536 (and e!630534 mapRes!42868))))

(declare-fun condMapEmpty!42868 () Bool)

(declare-fun mapDefault!42868 () ValueCell!12975)

(assert (=> b!1104677 (= condMapEmpty!42868 (= (arr!34485 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12975)) mapDefault!42868)))))

(declare-fun b!1104678 () Bool)

(assert (=> b!1104678 (= e!630534 tp_is_empty!27369)))

(declare-fun b!1104679 () Bool)

(declare-fun res!737021 () Bool)

(assert (=> b!1104679 (=> (not res!737021) (not e!630535))))

(assert (=> b!1104679 (= res!737021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42868 () Bool)

(assert (=> mapIsEmpty!42868 mapRes!42868))

(assert (= (and start!97122 res!737019) b!1104674))

(assert (= (and b!1104674 res!737024) b!1104669))

(assert (= (and b!1104669 res!737022) b!1104679))

(assert (= (and b!1104679 res!737021) b!1104675))

(assert (= (and b!1104675 res!737018) b!1104672))

(assert (= (and b!1104672 res!737016) b!1104668))

(assert (= (and b!1104668 res!737020) b!1104676))

(assert (= (and b!1104676 res!737017) b!1104671))

(assert (= (and b!1104671 res!737023) b!1104670))

(assert (= (and b!1104677 condMapEmpty!42868) mapIsEmpty!42868))

(assert (= (and b!1104677 (not condMapEmpty!42868)) mapNonEmpty!42868))

(get-info :version)

(assert (= (and mapNonEmpty!42868 ((_ is ValueCellFull!12975) mapValue!42868)) b!1104673))

(assert (= (and b!1104677 ((_ is ValueCellFull!12975) mapDefault!42868)) b!1104678))

(assert (= start!97122 b!1104677))

(declare-fun m!1024327 () Bool)

(assert (=> b!1104676 m!1024327))

(declare-fun m!1024329 () Bool)

(assert (=> start!97122 m!1024329))

(declare-fun m!1024331 () Bool)

(assert (=> start!97122 m!1024331))

(declare-fun m!1024333 () Bool)

(assert (=> b!1104679 m!1024333))

(declare-fun m!1024335 () Bool)

(assert (=> b!1104668 m!1024335))

(declare-fun m!1024337 () Bool)

(assert (=> b!1104675 m!1024337))

(declare-fun m!1024339 () Bool)

(assert (=> mapNonEmpty!42868 m!1024339))

(declare-fun m!1024341 () Bool)

(assert (=> b!1104671 m!1024341))

(declare-fun m!1024343 () Bool)

(assert (=> b!1104671 m!1024343))

(declare-fun m!1024345 () Bool)

(assert (=> b!1104674 m!1024345))

(declare-fun m!1024347 () Bool)

(assert (=> b!1104670 m!1024347))

(check-sat (not mapNonEmpty!42868) (not b!1104668) (not b!1104675) (not start!97122) (not b!1104671) (not b!1104670) tp_is_empty!27369 (not b!1104674) (not b!1104679))
(check-sat)

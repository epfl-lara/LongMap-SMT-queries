; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97786 () Bool)

(assert start!97786)

(declare-fun b!1115290 () Bool)

(declare-fun res!744064 () Bool)

(declare-fun e!635806 () Bool)

(assert (=> b!1115290 (=> (not res!744064) (not e!635806))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115290 (= res!744064 (validKeyInArray!0 k0!934))))

(declare-fun b!1115291 () Bool)

(declare-fun e!635804 () Bool)

(declare-fun tp_is_empty!27781 () Bool)

(assert (=> b!1115291 (= e!635804 tp_is_empty!27781)))

(declare-fun mapNonEmpty!43489 () Bool)

(declare-fun mapRes!43489 () Bool)

(declare-fun tp!82733 () Bool)

(declare-fun e!635808 () Bool)

(assert (=> mapNonEmpty!43489 (= mapRes!43489 (and tp!82733 e!635808))))

(declare-fun mapKey!43489 () (_ BitVec 32))

(declare-datatypes ((V!42169 0))(
  ( (V!42170 (val!13947 Int)) )
))
(declare-datatypes ((ValueCell!13181 0))(
  ( (ValueCellFull!13181 (v!16576 V!42169)) (EmptyCell!13181) )
))
(declare-fun mapRest!43489 () (Array (_ BitVec 32) ValueCell!13181))

(declare-datatypes ((array!72503 0))(
  ( (array!72504 (arr!34898 (Array (_ BitVec 32) ValueCell!13181)) (size!35435 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72503)

(declare-fun mapValue!43489 () ValueCell!13181)

(assert (=> mapNonEmpty!43489 (= (arr!34898 _values!996) (store mapRest!43489 mapKey!43489 mapValue!43489))))

(declare-fun b!1115292 () Bool)

(declare-fun res!744060 () Bool)

(assert (=> b!1115292 (=> (not res!744060) (not e!635806))))

(declare-datatypes ((array!72505 0))(
  ( (array!72506 (arr!34899 (Array (_ BitVec 32) (_ BitVec 64))) (size!35436 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72505)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72505 (_ BitVec 32)) Bool)

(assert (=> b!1115292 (= res!744060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115293 () Bool)

(declare-fun res!744057 () Bool)

(declare-fun e!635805 () Bool)

(assert (=> b!1115293 (=> (not res!744057) (not e!635805))))

(declare-fun lt!497268 () array!72505)

(declare-datatypes ((List!24336 0))(
  ( (Nil!24333) (Cons!24332 (h!25550 (_ BitVec 64)) (t!34809 List!24336)) )
))
(declare-fun arrayNoDuplicates!0 (array!72505 (_ BitVec 32) List!24336) Bool)

(assert (=> b!1115293 (= res!744057 (arrayNoDuplicates!0 lt!497268 #b00000000000000000000000000000000 Nil!24333))))

(declare-fun b!1115294 () Bool)

(assert (=> b!1115294 (= e!635806 e!635805)))

(declare-fun res!744056 () Bool)

(assert (=> b!1115294 (=> (not res!744056) (not e!635805))))

(assert (=> b!1115294 (= res!744056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497268 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115294 (= lt!497268 (array!72506 (store (arr!34899 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35436 _keys!1208)))))

(declare-fun b!1115295 () Bool)

(declare-fun e!635807 () Bool)

(assert (=> b!1115295 (= e!635807 (and e!635804 mapRes!43489))))

(declare-fun condMapEmpty!43489 () Bool)

(declare-fun mapDefault!43489 () ValueCell!13181)

(assert (=> b!1115295 (= condMapEmpty!43489 (= (arr!34898 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13181)) mapDefault!43489)))))

(declare-fun b!1115296 () Bool)

(assert (=> b!1115296 (= e!635808 tp_is_empty!27781)))

(declare-fun b!1115298 () Bool)

(declare-fun res!744055 () Bool)

(assert (=> b!1115298 (=> (not res!744055) (not e!635806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115298 (= res!744055 (validMask!0 mask!1564))))

(declare-fun b!1115299 () Bool)

(declare-fun res!744061 () Bool)

(assert (=> b!1115299 (=> (not res!744061) (not e!635806))))

(assert (=> b!1115299 (= res!744061 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35436 _keys!1208))))))

(declare-fun mapIsEmpty!43489 () Bool)

(assert (=> mapIsEmpty!43489 mapRes!43489))

(declare-fun b!1115300 () Bool)

(declare-fun res!744063 () Bool)

(assert (=> b!1115300 (=> (not res!744063) (not e!635806))))

(assert (=> b!1115300 (= res!744063 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24333))))

(declare-fun b!1115301 () Bool)

(declare-fun res!744059 () Bool)

(assert (=> b!1115301 (=> (not res!744059) (not e!635806))))

(assert (=> b!1115301 (= res!744059 (= (select (arr!34899 _keys!1208) i!673) k0!934))))

(declare-fun b!1115302 () Bool)

(assert (=> b!1115302 (= e!635805 (not true))))

(declare-fun arrayContainsKey!0 (array!72505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115302 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36531 0))(
  ( (Unit!36532) )
))
(declare-fun lt!497269 () Unit!36531)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72505 (_ BitVec 64) (_ BitVec 32)) Unit!36531)

(assert (=> b!1115302 (= lt!497269 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115297 () Bool)

(declare-fun res!744058 () Bool)

(assert (=> b!1115297 (=> (not res!744058) (not e!635806))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115297 (= res!744058 (and (= (size!35435 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35436 _keys!1208) (size!35435 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!744062 () Bool)

(assert (=> start!97786 (=> (not res!744062) (not e!635806))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97786 (= res!744062 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35436 _keys!1208))))))

(assert (=> start!97786 e!635806))

(declare-fun array_inv!26892 (array!72505) Bool)

(assert (=> start!97786 (array_inv!26892 _keys!1208)))

(assert (=> start!97786 true))

(declare-fun array_inv!26893 (array!72503) Bool)

(assert (=> start!97786 (and (array_inv!26893 _values!996) e!635807)))

(assert (= (and start!97786 res!744062) b!1115298))

(assert (= (and b!1115298 res!744055) b!1115297))

(assert (= (and b!1115297 res!744058) b!1115292))

(assert (= (and b!1115292 res!744060) b!1115300))

(assert (= (and b!1115300 res!744063) b!1115299))

(assert (= (and b!1115299 res!744061) b!1115290))

(assert (= (and b!1115290 res!744064) b!1115301))

(assert (= (and b!1115301 res!744059) b!1115294))

(assert (= (and b!1115294 res!744056) b!1115293))

(assert (= (and b!1115293 res!744057) b!1115302))

(assert (= (and b!1115295 condMapEmpty!43489) mapIsEmpty!43489))

(assert (= (and b!1115295 (not condMapEmpty!43489)) mapNonEmpty!43489))

(get-info :version)

(assert (= (and mapNonEmpty!43489 ((_ is ValueCellFull!13181) mapValue!43489)) b!1115296))

(assert (= (and b!1115295 ((_ is ValueCellFull!13181) mapDefault!43489)) b!1115291))

(assert (= start!97786 b!1115295))

(declare-fun m!1032669 () Bool)

(assert (=> mapNonEmpty!43489 m!1032669))

(declare-fun m!1032671 () Bool)

(assert (=> b!1115302 m!1032671))

(declare-fun m!1032673 () Bool)

(assert (=> b!1115302 m!1032673))

(declare-fun m!1032675 () Bool)

(assert (=> b!1115301 m!1032675))

(declare-fun m!1032677 () Bool)

(assert (=> start!97786 m!1032677))

(declare-fun m!1032679 () Bool)

(assert (=> start!97786 m!1032679))

(declare-fun m!1032681 () Bool)

(assert (=> b!1115298 m!1032681))

(declare-fun m!1032683 () Bool)

(assert (=> b!1115290 m!1032683))

(declare-fun m!1032685 () Bool)

(assert (=> b!1115300 m!1032685))

(declare-fun m!1032687 () Bool)

(assert (=> b!1115293 m!1032687))

(declare-fun m!1032689 () Bool)

(assert (=> b!1115294 m!1032689))

(declare-fun m!1032691 () Bool)

(assert (=> b!1115294 m!1032691))

(declare-fun m!1032693 () Bool)

(assert (=> b!1115292 m!1032693))

(check-sat (not b!1115293) (not b!1115300) (not b!1115292) (not b!1115298) (not b!1115290) tp_is_empty!27781 (not b!1115294) (not mapNonEmpty!43489) (not start!97786) (not b!1115302))
(check-sat)

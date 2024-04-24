; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97804 () Bool)

(assert start!97804)

(declare-fun res!744330 () Bool)

(declare-fun e!635967 () Bool)

(assert (=> start!97804 (=> (not res!744330) (not e!635967))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72539 0))(
  ( (array!72540 (arr!34916 (Array (_ BitVec 32) (_ BitVec 64))) (size!35453 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72539)

(assert (=> start!97804 (= res!744330 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35453 _keys!1208))))))

(assert (=> start!97804 e!635967))

(declare-fun array_inv!26904 (array!72539) Bool)

(assert (=> start!97804 (array_inv!26904 _keys!1208)))

(assert (=> start!97804 true))

(declare-datatypes ((V!42193 0))(
  ( (V!42194 (val!13956 Int)) )
))
(declare-datatypes ((ValueCell!13190 0))(
  ( (ValueCellFull!13190 (v!16585 V!42193)) (EmptyCell!13190) )
))
(declare-datatypes ((array!72541 0))(
  ( (array!72542 (arr!34917 (Array (_ BitVec 32) ValueCell!13190)) (size!35454 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72541)

(declare-fun e!635969 () Bool)

(declare-fun array_inv!26905 (array!72541) Bool)

(assert (=> start!97804 (and (array_inv!26905 _values!996) e!635969)))

(declare-fun b!1115641 () Bool)

(declare-fun res!744331 () Bool)

(assert (=> b!1115641 (=> (not res!744331) (not e!635967))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115641 (= res!744331 (= (select (arr!34916 _keys!1208) i!673) k0!934))))

(declare-fun b!1115642 () Bool)

(declare-fun e!635966 () Bool)

(declare-fun tp_is_empty!27799 () Bool)

(assert (=> b!1115642 (= e!635966 tp_is_empty!27799)))

(declare-fun b!1115643 () Bool)

(declare-fun e!635968 () Bool)

(assert (=> b!1115643 (= e!635968 tp_is_empty!27799)))

(declare-fun b!1115644 () Bool)

(declare-fun res!744325 () Bool)

(declare-fun e!635965 () Bool)

(assert (=> b!1115644 (=> (not res!744325) (not e!635965))))

(declare-fun lt!497322 () array!72539)

(declare-datatypes ((List!24343 0))(
  ( (Nil!24340) (Cons!24339 (h!25557 (_ BitVec 64)) (t!34816 List!24343)) )
))
(declare-fun arrayNoDuplicates!0 (array!72539 (_ BitVec 32) List!24343) Bool)

(assert (=> b!1115644 (= res!744325 (arrayNoDuplicates!0 lt!497322 #b00000000000000000000000000000000 Nil!24340))))

(declare-fun b!1115645 () Bool)

(declare-fun res!744328 () Bool)

(assert (=> b!1115645 (=> (not res!744328) (not e!635967))))

(assert (=> b!1115645 (= res!744328 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24340))))

(declare-fun b!1115646 () Bool)

(declare-fun res!744326 () Bool)

(assert (=> b!1115646 (=> (not res!744326) (not e!635967))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72539 (_ BitVec 32)) Bool)

(assert (=> b!1115646 (= res!744326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115647 () Bool)

(declare-fun mapRes!43516 () Bool)

(assert (=> b!1115647 (= e!635969 (and e!635968 mapRes!43516))))

(declare-fun condMapEmpty!43516 () Bool)

(declare-fun mapDefault!43516 () ValueCell!13190)

(assert (=> b!1115647 (= condMapEmpty!43516 (= (arr!34917 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13190)) mapDefault!43516)))))

(declare-fun b!1115648 () Bool)

(assert (=> b!1115648 (= e!635965 (not true))))

(declare-fun arrayContainsKey!0 (array!72539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115648 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36543 0))(
  ( (Unit!36544) )
))
(declare-fun lt!497323 () Unit!36543)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72539 (_ BitVec 64) (_ BitVec 32)) Unit!36543)

(assert (=> b!1115648 (= lt!497323 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115649 () Bool)

(declare-fun res!744333 () Bool)

(assert (=> b!1115649 (=> (not res!744333) (not e!635967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115649 (= res!744333 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43516 () Bool)

(assert (=> mapIsEmpty!43516 mapRes!43516))

(declare-fun b!1115650 () Bool)

(assert (=> b!1115650 (= e!635967 e!635965)))

(declare-fun res!744332 () Bool)

(assert (=> b!1115650 (=> (not res!744332) (not e!635965))))

(assert (=> b!1115650 (= res!744332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497322 mask!1564))))

(assert (=> b!1115650 (= lt!497322 (array!72540 (store (arr!34916 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35453 _keys!1208)))))

(declare-fun b!1115651 () Bool)

(declare-fun res!744329 () Bool)

(assert (=> b!1115651 (=> (not res!744329) (not e!635967))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115651 (= res!744329 (and (= (size!35454 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35453 _keys!1208) (size!35454 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115652 () Bool)

(declare-fun res!744327 () Bool)

(assert (=> b!1115652 (=> (not res!744327) (not e!635967))))

(assert (=> b!1115652 (= res!744327 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35453 _keys!1208))))))

(declare-fun b!1115653 () Bool)

(declare-fun res!744334 () Bool)

(assert (=> b!1115653 (=> (not res!744334) (not e!635967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115653 (= res!744334 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43516 () Bool)

(declare-fun tp!82760 () Bool)

(assert (=> mapNonEmpty!43516 (= mapRes!43516 (and tp!82760 e!635966))))

(declare-fun mapKey!43516 () (_ BitVec 32))

(declare-fun mapValue!43516 () ValueCell!13190)

(declare-fun mapRest!43516 () (Array (_ BitVec 32) ValueCell!13190))

(assert (=> mapNonEmpty!43516 (= (arr!34917 _values!996) (store mapRest!43516 mapKey!43516 mapValue!43516))))

(assert (= (and start!97804 res!744330) b!1115649))

(assert (= (and b!1115649 res!744333) b!1115651))

(assert (= (and b!1115651 res!744329) b!1115646))

(assert (= (and b!1115646 res!744326) b!1115645))

(assert (= (and b!1115645 res!744328) b!1115652))

(assert (= (and b!1115652 res!744327) b!1115653))

(assert (= (and b!1115653 res!744334) b!1115641))

(assert (= (and b!1115641 res!744331) b!1115650))

(assert (= (and b!1115650 res!744332) b!1115644))

(assert (= (and b!1115644 res!744325) b!1115648))

(assert (= (and b!1115647 condMapEmpty!43516) mapIsEmpty!43516))

(assert (= (and b!1115647 (not condMapEmpty!43516)) mapNonEmpty!43516))

(get-info :version)

(assert (= (and mapNonEmpty!43516 ((_ is ValueCellFull!13190) mapValue!43516)) b!1115642))

(assert (= (and b!1115647 ((_ is ValueCellFull!13190) mapDefault!43516)) b!1115643))

(assert (= start!97804 b!1115647))

(declare-fun m!1032903 () Bool)

(assert (=> b!1115653 m!1032903))

(declare-fun m!1032905 () Bool)

(assert (=> b!1115645 m!1032905))

(declare-fun m!1032907 () Bool)

(assert (=> b!1115646 m!1032907))

(declare-fun m!1032909 () Bool)

(assert (=> b!1115649 m!1032909))

(declare-fun m!1032911 () Bool)

(assert (=> b!1115648 m!1032911))

(declare-fun m!1032913 () Bool)

(assert (=> b!1115648 m!1032913))

(declare-fun m!1032915 () Bool)

(assert (=> start!97804 m!1032915))

(declare-fun m!1032917 () Bool)

(assert (=> start!97804 m!1032917))

(declare-fun m!1032919 () Bool)

(assert (=> b!1115650 m!1032919))

(declare-fun m!1032921 () Bool)

(assert (=> b!1115650 m!1032921))

(declare-fun m!1032923 () Bool)

(assert (=> mapNonEmpty!43516 m!1032923))

(declare-fun m!1032925 () Bool)

(assert (=> b!1115644 m!1032925))

(declare-fun m!1032927 () Bool)

(assert (=> b!1115641 m!1032927))

(check-sat (not b!1115645) (not b!1115644) (not b!1115650) tp_is_empty!27799 (not mapNonEmpty!43516) (not b!1115649) (not b!1115648) (not b!1115653) (not b!1115646) (not start!97804))
(check-sat)

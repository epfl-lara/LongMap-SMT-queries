; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97408 () Bool)

(assert start!97408)

(declare-fun b!1106695 () Bool)

(declare-fun res!738066 () Bool)

(declare-fun e!631740 () Bool)

(assert (=> b!1106695 (=> (not res!738066) (not e!631740))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106695 (= res!738066 (validMask!0 mask!1564))))

(declare-fun b!1106696 () Bool)

(declare-fun e!631736 () Bool)

(declare-fun tp_is_empty!27403 () Bool)

(assert (=> b!1106696 (= e!631736 tp_is_empty!27403)))

(declare-fun b!1106697 () Bool)

(declare-fun e!631737 () Bool)

(declare-fun mapRes!42922 () Bool)

(assert (=> b!1106697 (= e!631737 (and e!631736 mapRes!42922))))

(declare-fun condMapEmpty!42922 () Bool)

(declare-datatypes ((V!41665 0))(
  ( (V!41666 (val!13758 Int)) )
))
(declare-datatypes ((ValueCell!12992 0))(
  ( (ValueCellFull!12992 (v!16387 V!41665)) (EmptyCell!12992) )
))
(declare-datatypes ((array!71763 0))(
  ( (array!71764 (arr!34528 (Array (_ BitVec 32) ValueCell!12992)) (size!35065 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71763)

(declare-fun mapDefault!42922 () ValueCell!12992)

(assert (=> b!1106697 (= condMapEmpty!42922 (= (arr!34528 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12992)) mapDefault!42922)))))

(declare-fun mapIsEmpty!42922 () Bool)

(assert (=> mapIsEmpty!42922 mapRes!42922))

(declare-fun mapNonEmpty!42922 () Bool)

(declare-fun tp!81842 () Bool)

(declare-fun e!631735 () Bool)

(assert (=> mapNonEmpty!42922 (= mapRes!42922 (and tp!81842 e!631735))))

(declare-fun mapRest!42922 () (Array (_ BitVec 32) ValueCell!12992))

(declare-fun mapValue!42922 () ValueCell!12992)

(declare-fun mapKey!42922 () (_ BitVec 32))

(assert (=> mapNonEmpty!42922 (= (arr!34528 _values!996) (store mapRest!42922 mapKey!42922 mapValue!42922))))

(declare-fun b!1106698 () Bool)

(declare-fun res!738068 () Bool)

(assert (=> b!1106698 (=> (not res!738068) (not e!631740))))

(declare-datatypes ((array!71765 0))(
  ( (array!71766 (arr!34529 (Array (_ BitVec 32) (_ BitVec 64))) (size!35066 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71765)

(declare-datatypes ((List!24096 0))(
  ( (Nil!24093) (Cons!24092 (h!25310 (_ BitVec 64)) (t!34353 List!24096)) )
))
(declare-fun arrayNoDuplicates!0 (array!71765 (_ BitVec 32) List!24096) Bool)

(assert (=> b!1106698 (= res!738068 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24093))))

(declare-fun b!1106699 () Bool)

(declare-fun e!631738 () Bool)

(assert (=> b!1106699 (= e!631738 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106699 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36261 0))(
  ( (Unit!36262) )
))
(declare-fun lt!495810 () Unit!36261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71765 (_ BitVec 64) (_ BitVec 32)) Unit!36261)

(assert (=> b!1106699 (= lt!495810 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106700 () Bool)

(assert (=> b!1106700 (= e!631735 tp_is_empty!27403)))

(declare-fun res!738065 () Bool)

(assert (=> start!97408 (=> (not res!738065) (not e!631740))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97408 (= res!738065 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35066 _keys!1208))))))

(assert (=> start!97408 e!631740))

(declare-fun array_inv!26618 (array!71765) Bool)

(assert (=> start!97408 (array_inv!26618 _keys!1208)))

(assert (=> start!97408 true))

(declare-fun array_inv!26619 (array!71763) Bool)

(assert (=> start!97408 (and (array_inv!26619 _values!996) e!631737)))

(declare-fun b!1106701 () Bool)

(declare-fun res!738067 () Bool)

(assert (=> b!1106701 (=> (not res!738067) (not e!631740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106701 (= res!738067 (validKeyInArray!0 k0!934))))

(declare-fun b!1106702 () Bool)

(declare-fun res!738063 () Bool)

(assert (=> b!1106702 (=> (not res!738063) (not e!631740))))

(assert (=> b!1106702 (= res!738063 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35066 _keys!1208))))))

(declare-fun b!1106703 () Bool)

(declare-fun res!738062 () Bool)

(assert (=> b!1106703 (=> (not res!738062) (not e!631740))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106703 (= res!738062 (and (= (size!35065 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35066 _keys!1208) (size!35065 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106704 () Bool)

(assert (=> b!1106704 (= e!631740 e!631738)))

(declare-fun res!738070 () Bool)

(assert (=> b!1106704 (=> (not res!738070) (not e!631738))))

(declare-fun lt!495811 () array!71765)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71765 (_ BitVec 32)) Bool)

(assert (=> b!1106704 (= res!738070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495811 mask!1564))))

(assert (=> b!1106704 (= lt!495811 (array!71766 (store (arr!34529 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35066 _keys!1208)))))

(declare-fun b!1106705 () Bool)

(declare-fun res!738069 () Bool)

(assert (=> b!1106705 (=> (not res!738069) (not e!631740))))

(assert (=> b!1106705 (= res!738069 (= (select (arr!34529 _keys!1208) i!673) k0!934))))

(declare-fun b!1106706 () Bool)

(declare-fun res!738061 () Bool)

(assert (=> b!1106706 (=> (not res!738061) (not e!631738))))

(assert (=> b!1106706 (= res!738061 (arrayNoDuplicates!0 lt!495811 #b00000000000000000000000000000000 Nil!24093))))

(declare-fun b!1106707 () Bool)

(declare-fun res!738064 () Bool)

(assert (=> b!1106707 (=> (not res!738064) (not e!631740))))

(assert (=> b!1106707 (= res!738064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97408 res!738065) b!1106695))

(assert (= (and b!1106695 res!738066) b!1106703))

(assert (= (and b!1106703 res!738062) b!1106707))

(assert (= (and b!1106707 res!738064) b!1106698))

(assert (= (and b!1106698 res!738068) b!1106702))

(assert (= (and b!1106702 res!738063) b!1106701))

(assert (= (and b!1106701 res!738067) b!1106705))

(assert (= (and b!1106705 res!738069) b!1106704))

(assert (= (and b!1106704 res!738070) b!1106706))

(assert (= (and b!1106706 res!738061) b!1106699))

(assert (= (and b!1106697 condMapEmpty!42922) mapIsEmpty!42922))

(assert (= (and b!1106697 (not condMapEmpty!42922)) mapNonEmpty!42922))

(get-info :version)

(assert (= (and mapNonEmpty!42922 ((_ is ValueCellFull!12992) mapValue!42922)) b!1106700))

(assert (= (and b!1106697 ((_ is ValueCellFull!12992) mapDefault!42922)) b!1106696))

(assert (= start!97408 b!1106697))

(declare-fun m!1026459 () Bool)

(assert (=> b!1106706 m!1026459))

(declare-fun m!1026461 () Bool)

(assert (=> b!1106705 m!1026461))

(declare-fun m!1026463 () Bool)

(assert (=> b!1106698 m!1026463))

(declare-fun m!1026465 () Bool)

(assert (=> b!1106707 m!1026465))

(declare-fun m!1026467 () Bool)

(assert (=> b!1106699 m!1026467))

(declare-fun m!1026469 () Bool)

(assert (=> b!1106699 m!1026469))

(declare-fun m!1026471 () Bool)

(assert (=> b!1106701 m!1026471))

(declare-fun m!1026473 () Bool)

(assert (=> b!1106695 m!1026473))

(declare-fun m!1026475 () Bool)

(assert (=> start!97408 m!1026475))

(declare-fun m!1026477 () Bool)

(assert (=> start!97408 m!1026477))

(declare-fun m!1026479 () Bool)

(assert (=> b!1106704 m!1026479))

(declare-fun m!1026481 () Bool)

(assert (=> b!1106704 m!1026481))

(declare-fun m!1026483 () Bool)

(assert (=> mapNonEmpty!42922 m!1026483))

(check-sat (not b!1106698) (not b!1106695) (not mapNonEmpty!42922) (not b!1106701) tp_is_empty!27403 (not b!1106706) (not start!97408) (not b!1106707) (not b!1106704) (not b!1106699))
(check-sat)

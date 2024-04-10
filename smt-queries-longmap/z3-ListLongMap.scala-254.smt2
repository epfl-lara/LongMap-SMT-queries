; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4208 () Bool)

(assert start!4208)

(declare-fun b_free!1113 () Bool)

(declare-fun b_next!1113 () Bool)

(assert (=> start!4208 (= b_free!1113 (not b_next!1113))))

(declare-fun tp!4759 () Bool)

(declare-fun b_and!1923 () Bool)

(assert (=> start!4208 (= tp!4759 b_and!1923)))

(declare-fun b!32067 () Bool)

(declare-fun res!19481 () Bool)

(declare-fun e!20410 () Bool)

(assert (=> b!32067 (=> (not res!19481) (not e!20410))))

(declare-datatypes ((V!1781 0))(
  ( (V!1782 (val!760 Int)) )
))
(declare-datatypes ((ValueCell!534 0))(
  ( (ValueCellFull!534 (v!1849 V!1781)) (EmptyCell!534) )
))
(declare-datatypes ((array!2145 0))(
  ( (array!2146 (arr!1026 (Array (_ BitVec 32) ValueCell!534)) (size!1127 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2145)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2147 0))(
  ( (array!2148 (arr!1027 (Array (_ BitVec 32) (_ BitVec 64))) (size!1128 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2147)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!32067 (= res!19481 (and (= (size!1127 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1128 _keys!1833) (size!1127 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1729 () Bool)

(declare-fun mapRes!1729 () Bool)

(assert (=> mapIsEmpty!1729 mapRes!1729))

(declare-fun b!32068 () Bool)

(declare-fun res!19478 () Bool)

(assert (=> b!32068 (=> (not res!19478) (not e!20410))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1781)

(declare-fun minValue!1443 () V!1781)

(declare-datatypes ((tuple2!1234 0))(
  ( (tuple2!1235 (_1!628 (_ BitVec 64)) (_2!628 V!1781)) )
))
(declare-datatypes ((List!828 0))(
  ( (Nil!825) (Cons!824 (h!1391 tuple2!1234) (t!3521 List!828)) )
))
(declare-datatypes ((ListLongMap!811 0))(
  ( (ListLongMap!812 (toList!421 List!828)) )
))
(declare-fun contains!361 (ListLongMap!811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!249 (array!2147 array!2145 (_ BitVec 32) (_ BitVec 32) V!1781 V!1781 (_ BitVec 32) Int) ListLongMap!811)

(assert (=> b!32068 (= res!19478 (not (contains!361 (getCurrentListMap!249 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!19480 () Bool)

(assert (=> start!4208 (=> (not res!19480) (not e!20410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4208 (= res!19480 (validMask!0 mask!2294))))

(assert (=> start!4208 e!20410))

(assert (=> start!4208 true))

(assert (=> start!4208 tp!4759))

(declare-fun e!20413 () Bool)

(declare-fun array_inv!717 (array!2145) Bool)

(assert (=> start!4208 (and (array_inv!717 _values!1501) e!20413)))

(declare-fun array_inv!718 (array!2147) Bool)

(assert (=> start!4208 (array_inv!718 _keys!1833)))

(declare-fun tp_is_empty!1467 () Bool)

(assert (=> start!4208 tp_is_empty!1467))

(declare-fun b!32069 () Bool)

(declare-fun e!20412 () Bool)

(assert (=> b!32069 (= e!20412 tp_is_empty!1467)))

(declare-fun b!32070 () Bool)

(declare-fun res!19479 () Bool)

(assert (=> b!32070 (=> (not res!19479) (not e!20410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32070 (= res!19479 (validKeyInArray!0 k0!1304))))

(declare-fun b!32071 () Bool)

(assert (=> b!32071 (= e!20413 (and e!20412 mapRes!1729))))

(declare-fun condMapEmpty!1729 () Bool)

(declare-fun mapDefault!1729 () ValueCell!534)

(assert (=> b!32071 (= condMapEmpty!1729 (= (arr!1026 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!534)) mapDefault!1729)))))

(declare-fun b!32072 () Bool)

(declare-fun res!19477 () Bool)

(assert (=> b!32072 (=> (not res!19477) (not e!20410))))

(declare-fun arrayContainsKey!0 (array!2147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32072 (= res!19477 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32073 () Bool)

(assert (=> b!32073 (= e!20410 false)))

(declare-fun lt!11630 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2147 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32073 (= lt!11630 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32074 () Bool)

(declare-fun e!20414 () Bool)

(assert (=> b!32074 (= e!20414 tp_is_empty!1467)))

(declare-fun b!32075 () Bool)

(declare-fun res!19476 () Bool)

(assert (=> b!32075 (=> (not res!19476) (not e!20410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2147 (_ BitVec 32)) Bool)

(assert (=> b!32075 (= res!19476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1729 () Bool)

(declare-fun tp!4758 () Bool)

(assert (=> mapNonEmpty!1729 (= mapRes!1729 (and tp!4758 e!20414))))

(declare-fun mapValue!1729 () ValueCell!534)

(declare-fun mapKey!1729 () (_ BitVec 32))

(declare-fun mapRest!1729 () (Array (_ BitVec 32) ValueCell!534))

(assert (=> mapNonEmpty!1729 (= (arr!1026 _values!1501) (store mapRest!1729 mapKey!1729 mapValue!1729))))

(declare-fun b!32076 () Bool)

(declare-fun res!19482 () Bool)

(assert (=> b!32076 (=> (not res!19482) (not e!20410))))

(declare-datatypes ((List!829 0))(
  ( (Nil!826) (Cons!825 (h!1392 (_ BitVec 64)) (t!3522 List!829)) )
))
(declare-fun arrayNoDuplicates!0 (array!2147 (_ BitVec 32) List!829) Bool)

(assert (=> b!32076 (= res!19482 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!826))))

(assert (= (and start!4208 res!19480) b!32067))

(assert (= (and b!32067 res!19481) b!32075))

(assert (= (and b!32075 res!19476) b!32076))

(assert (= (and b!32076 res!19482) b!32070))

(assert (= (and b!32070 res!19479) b!32068))

(assert (= (and b!32068 res!19478) b!32072))

(assert (= (and b!32072 res!19477) b!32073))

(assert (= (and b!32071 condMapEmpty!1729) mapIsEmpty!1729))

(assert (= (and b!32071 (not condMapEmpty!1729)) mapNonEmpty!1729))

(get-info :version)

(assert (= (and mapNonEmpty!1729 ((_ is ValueCellFull!534) mapValue!1729)) b!32074))

(assert (= (and b!32071 ((_ is ValueCellFull!534) mapDefault!1729)) b!32069))

(assert (= start!4208 b!32071))

(declare-fun m!25679 () Bool)

(assert (=> b!32075 m!25679))

(declare-fun m!25681 () Bool)

(assert (=> b!32070 m!25681))

(declare-fun m!25683 () Bool)

(assert (=> b!32073 m!25683))

(declare-fun m!25685 () Bool)

(assert (=> b!32072 m!25685))

(declare-fun m!25687 () Bool)

(assert (=> start!4208 m!25687))

(declare-fun m!25689 () Bool)

(assert (=> start!4208 m!25689))

(declare-fun m!25691 () Bool)

(assert (=> start!4208 m!25691))

(declare-fun m!25693 () Bool)

(assert (=> b!32076 m!25693))

(declare-fun m!25695 () Bool)

(assert (=> mapNonEmpty!1729 m!25695))

(declare-fun m!25697 () Bool)

(assert (=> b!32068 m!25697))

(assert (=> b!32068 m!25697))

(declare-fun m!25699 () Bool)

(assert (=> b!32068 m!25699))

(check-sat (not b!32075) tp_is_empty!1467 b_and!1923 (not b!32070) (not b!32072) (not b!32076) (not mapNonEmpty!1729) (not start!4208) (not b!32068) (not b_next!1113) (not b!32073))
(check-sat b_and!1923 (not b_next!1113))

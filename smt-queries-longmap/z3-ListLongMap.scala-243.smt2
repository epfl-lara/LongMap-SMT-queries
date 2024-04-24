; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4136 () Bool)

(assert start!4136)

(declare-fun b_free!1045 () Bool)

(declare-fun b_next!1045 () Bool)

(assert (=> start!4136 (= b_free!1045 (not b_next!1045))))

(declare-fun tp!4554 () Bool)

(declare-fun b_and!1845 () Bool)

(assert (=> start!4136 (= tp!4554 b_and!1845)))

(declare-fun b!31022 () Bool)

(declare-fun e!19849 () Bool)

(declare-fun e!19848 () Bool)

(declare-fun mapRes!1627 () Bool)

(assert (=> b!31022 (= e!19849 (and e!19848 mapRes!1627))))

(declare-fun condMapEmpty!1627 () Bool)

(declare-datatypes ((V!1691 0))(
  ( (V!1692 (val!726 Int)) )
))
(declare-datatypes ((ValueCell!500 0))(
  ( (ValueCellFull!500 (v!1815 V!1691)) (EmptyCell!500) )
))
(declare-datatypes ((array!2003 0))(
  ( (array!2004 (arr!955 (Array (_ BitVec 32) ValueCell!500)) (size!1056 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2003)

(declare-fun mapDefault!1627 () ValueCell!500)

(assert (=> b!31022 (= condMapEmpty!1627 (= (arr!955 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!500)) mapDefault!1627)))))

(declare-fun b!31023 () Bool)

(declare-fun res!18769 () Bool)

(declare-fun e!19851 () Bool)

(assert (=> b!31023 (=> (not res!18769) (not e!19851))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2005 0))(
  ( (array!2006 (arr!956 (Array (_ BitVec 32) (_ BitVec 64))) (size!1057 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2005)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1691)

(declare-fun minValue!1443 () V!1691)

(declare-datatypes ((tuple2!1188 0))(
  ( (tuple2!1189 (_1!605 (_ BitVec 64)) (_2!605 V!1691)) )
))
(declare-datatypes ((List!781 0))(
  ( (Nil!778) (Cons!777 (h!1344 tuple2!1188) (t!3468 List!781)) )
))
(declare-datatypes ((ListLongMap!759 0))(
  ( (ListLongMap!760 (toList!395 List!781)) )
))
(declare-fun contains!337 (ListLongMap!759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!220 (array!2005 array!2003 (_ BitVec 32) (_ BitVec 32) V!1691 V!1691 (_ BitVec 32) Int) ListLongMap!759)

(assert (=> b!31023 (= res!18769 (not (contains!337 (getCurrentListMap!220 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31024 () Bool)

(assert (=> b!31024 (= e!19851 (not (= (size!1057 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun b!31025 () Bool)

(declare-fun res!18771 () Bool)

(assert (=> b!31025 (=> (not res!18771) (not e!19851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31025 (= res!18771 (validKeyInArray!0 k0!1304))))

(declare-fun b!31026 () Bool)

(declare-fun e!19850 () Bool)

(declare-fun tp_is_empty!1399 () Bool)

(assert (=> b!31026 (= e!19850 tp_is_empty!1399)))

(declare-fun mapIsEmpty!1627 () Bool)

(assert (=> mapIsEmpty!1627 mapRes!1627))

(declare-fun mapNonEmpty!1627 () Bool)

(declare-fun tp!4555 () Bool)

(assert (=> mapNonEmpty!1627 (= mapRes!1627 (and tp!4555 e!19850))))

(declare-fun mapKey!1627 () (_ BitVec 32))

(declare-fun mapRest!1627 () (Array (_ BitVec 32) ValueCell!500))

(declare-fun mapValue!1627 () ValueCell!500)

(assert (=> mapNonEmpty!1627 (= (arr!955 _values!1501) (store mapRest!1627 mapKey!1627 mapValue!1627))))

(declare-fun res!18774 () Bool)

(assert (=> start!4136 (=> (not res!18774) (not e!19851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4136 (= res!18774 (validMask!0 mask!2294))))

(assert (=> start!4136 e!19851))

(assert (=> start!4136 true))

(assert (=> start!4136 tp!4554))

(declare-fun array_inv!655 (array!2003) Bool)

(assert (=> start!4136 (and (array_inv!655 _values!1501) e!19849)))

(declare-fun array_inv!656 (array!2005) Bool)

(assert (=> start!4136 (array_inv!656 _keys!1833)))

(assert (=> start!4136 tp_is_empty!1399))

(declare-fun b!31027 () Bool)

(declare-fun res!18775 () Bool)

(assert (=> b!31027 (=> (not res!18775) (not e!19851))))

(assert (=> b!31027 (= res!18775 (and (= (size!1056 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1057 _keys!1833) (size!1056 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31028 () Bool)

(declare-fun res!18772 () Bool)

(assert (=> b!31028 (=> (not res!18772) (not e!19851))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!117 0))(
  ( (MissingZero!117 (index!2590 (_ BitVec 32))) (Found!117 (index!2591 (_ BitVec 32))) (Intermediate!117 (undefined!929 Bool) (index!2592 (_ BitVec 32)) (x!6603 (_ BitVec 32))) (Undefined!117) (MissingVacant!117 (index!2593 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!2005 (_ BitVec 32)) SeekEntryResult!117)

(assert (=> b!31028 (= res!18772 (not ((_ is Found!117) (seekEntry!0 k0!1304 _keys!1833 mask!2294))))))

(declare-fun b!31029 () Bool)

(assert (=> b!31029 (= e!19848 tp_is_empty!1399)))

(declare-fun b!31030 () Bool)

(declare-fun res!18770 () Bool)

(assert (=> b!31030 (=> (not res!18770) (not e!19851))))

(declare-fun arrayContainsKey!0 (array!2005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31030 (= res!18770 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31031 () Bool)

(declare-fun res!18773 () Bool)

(assert (=> b!31031 (=> (not res!18773) (not e!19851))))

(declare-datatypes ((List!782 0))(
  ( (Nil!779) (Cons!778 (h!1345 (_ BitVec 64)) (t!3469 List!782)) )
))
(declare-fun arrayNoDuplicates!0 (array!2005 (_ BitVec 32) List!782) Bool)

(assert (=> b!31031 (= res!18773 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!779))))

(declare-fun b!31032 () Bool)

(declare-fun res!18776 () Bool)

(assert (=> b!31032 (=> (not res!18776) (not e!19851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2005 (_ BitVec 32)) Bool)

(assert (=> b!31032 (= res!18776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!4136 res!18774) b!31027))

(assert (= (and b!31027 res!18775) b!31032))

(assert (= (and b!31032 res!18776) b!31031))

(assert (= (and b!31031 res!18773) b!31025))

(assert (= (and b!31025 res!18771) b!31023))

(assert (= (and b!31023 res!18769) b!31030))

(assert (= (and b!31030 res!18770) b!31028))

(assert (= (and b!31028 res!18772) b!31024))

(assert (= (and b!31022 condMapEmpty!1627) mapIsEmpty!1627))

(assert (= (and b!31022 (not condMapEmpty!1627)) mapNonEmpty!1627))

(assert (= (and mapNonEmpty!1627 ((_ is ValueCellFull!500) mapValue!1627)) b!31026))

(assert (= (and b!31022 ((_ is ValueCellFull!500) mapDefault!1627)) b!31029))

(assert (= start!4136 b!31022))

(declare-fun m!24815 () Bool)

(assert (=> b!31032 m!24815))

(declare-fun m!24817 () Bool)

(assert (=> b!31025 m!24817))

(declare-fun m!24819 () Bool)

(assert (=> mapNonEmpty!1627 m!24819))

(declare-fun m!24821 () Bool)

(assert (=> start!4136 m!24821))

(declare-fun m!24823 () Bool)

(assert (=> start!4136 m!24823))

(declare-fun m!24825 () Bool)

(assert (=> start!4136 m!24825))

(declare-fun m!24827 () Bool)

(assert (=> b!31028 m!24827))

(declare-fun m!24829 () Bool)

(assert (=> b!31031 m!24829))

(declare-fun m!24831 () Bool)

(assert (=> b!31030 m!24831))

(declare-fun m!24833 () Bool)

(assert (=> b!31023 m!24833))

(assert (=> b!31023 m!24833))

(declare-fun m!24835 () Bool)

(assert (=> b!31023 m!24835))

(check-sat (not b!31031) (not b!31032) (not b!31030) (not mapNonEmpty!1627) tp_is_empty!1399 (not start!4136) (not b!31023) b_and!1845 (not b_next!1045) (not b!31025) (not b!31028))
(check-sat b_and!1845 (not b_next!1045))

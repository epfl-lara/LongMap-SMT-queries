; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109494 () Bool)

(assert start!109494)

(declare-fun b_free!28983 () Bool)

(declare-fun b_next!28983 () Bool)

(assert (=> start!109494 (= b_free!28983 (not b_next!28983))))

(declare-fun tp!102067 () Bool)

(declare-fun b_and!47073 () Bool)

(assert (=> start!109494 (= tp!102067 b_and!47073)))

(declare-fun b!1296827 () Bool)

(declare-fun res!861859 () Bool)

(declare-fun e!739845 () Bool)

(assert (=> b!1296827 (=> (not res!861859) (not e!739845))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51267 0))(
  ( (V!51268 (val!17386 Int)) )
))
(declare-datatypes ((ValueCell!16413 0))(
  ( (ValueCellFull!16413 (v!19989 V!51267)) (EmptyCell!16413) )
))
(declare-datatypes ((array!86262 0))(
  ( (array!86263 (arr!41632 (Array (_ BitVec 32) ValueCell!16413)) (size!42182 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86262)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86264 0))(
  ( (array!86265 (arr!41633 (Array (_ BitVec 32) (_ BitVec 64))) (size!42183 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86264)

(assert (=> b!1296827 (= res!861859 (and (= (size!42182 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42183 _keys!1741) (size!42182 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296828 () Bool)

(declare-fun res!861860 () Bool)

(assert (=> b!1296828 (=> (not res!861860) (not e!739845))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296828 (= res!861860 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42183 _keys!1741))))))

(declare-fun b!1296829 () Bool)

(declare-fun res!861862 () Bool)

(assert (=> b!1296829 (=> (not res!861862) (not e!739845))))

(declare-datatypes ((List!29536 0))(
  ( (Nil!29533) (Cons!29532 (h!30741 (_ BitVec 64)) (t!43100 List!29536)) )
))
(declare-fun arrayNoDuplicates!0 (array!86264 (_ BitVec 32) List!29536) Bool)

(assert (=> b!1296829 (= res!861862 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29533))))

(declare-fun mapNonEmpty!53495 () Bool)

(declare-fun mapRes!53495 () Bool)

(declare-fun tp!102068 () Bool)

(declare-fun e!739847 () Bool)

(assert (=> mapNonEmpty!53495 (= mapRes!53495 (and tp!102068 e!739847))))

(declare-fun mapKey!53495 () (_ BitVec 32))

(declare-fun mapValue!53495 () ValueCell!16413)

(declare-fun mapRest!53495 () (Array (_ BitVec 32) ValueCell!16413))

(assert (=> mapNonEmpty!53495 (= (arr!41632 _values!1445) (store mapRest!53495 mapKey!53495 mapValue!53495))))

(declare-fun b!1296830 () Bool)

(declare-fun e!739843 () Bool)

(declare-fun e!739844 () Bool)

(assert (=> b!1296830 (= e!739843 (and e!739844 mapRes!53495))))

(declare-fun condMapEmpty!53495 () Bool)

(declare-fun mapDefault!53495 () ValueCell!16413)

(assert (=> b!1296830 (= condMapEmpty!53495 (= (arr!41632 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16413)) mapDefault!53495)))))

(declare-fun b!1296832 () Bool)

(declare-fun res!861864 () Bool)

(assert (=> b!1296832 (=> (not res!861864) (not e!739845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86264 (_ BitVec 32)) Bool)

(assert (=> b!1296832 (= res!861864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296833 () Bool)

(declare-fun tp_is_empty!34623 () Bool)

(assert (=> b!1296833 (= e!739844 tp_is_empty!34623)))

(declare-fun b!1296834 () Bool)

(declare-fun res!861861 () Bool)

(assert (=> b!1296834 (=> (not res!861861) (not e!739845))))

(declare-fun minValue!1387 () V!51267)

(declare-fun zeroValue!1387 () V!51267)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22400 0))(
  ( (tuple2!22401 (_1!11211 (_ BitVec 64)) (_2!11211 V!51267)) )
))
(declare-datatypes ((List!29537 0))(
  ( (Nil!29534) (Cons!29533 (h!30742 tuple2!22400) (t!43101 List!29537)) )
))
(declare-datatypes ((ListLongMap!20057 0))(
  ( (ListLongMap!20058 (toList!10044 List!29537)) )
))
(declare-fun contains!8162 (ListLongMap!20057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5073 (array!86264 array!86262 (_ BitVec 32) (_ BitVec 32) V!51267 V!51267 (_ BitVec 32) Int) ListLongMap!20057)

(assert (=> b!1296834 (= res!861861 (contains!8162 (getCurrentListMap!5073 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296835 () Bool)

(assert (=> b!1296835 (= e!739845 (bvslt (bvsub (size!42183 _keys!1741) from!2144) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!53495 () Bool)

(assert (=> mapIsEmpty!53495 mapRes!53495))

(declare-fun res!861863 () Bool)

(assert (=> start!109494 (=> (not res!861863) (not e!739845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109494 (= res!861863 (validMask!0 mask!2175))))

(assert (=> start!109494 e!739845))

(assert (=> start!109494 tp_is_empty!34623))

(assert (=> start!109494 true))

(declare-fun array_inv!31509 (array!86262) Bool)

(assert (=> start!109494 (and (array_inv!31509 _values!1445) e!739843)))

(declare-fun array_inv!31510 (array!86264) Bool)

(assert (=> start!109494 (array_inv!31510 _keys!1741)))

(assert (=> start!109494 tp!102067))

(declare-fun b!1296831 () Bool)

(assert (=> b!1296831 (= e!739847 tp_is_empty!34623)))

(assert (= (and start!109494 res!861863) b!1296827))

(assert (= (and b!1296827 res!861859) b!1296832))

(assert (= (and b!1296832 res!861864) b!1296829))

(assert (= (and b!1296829 res!861862) b!1296828))

(assert (= (and b!1296828 res!861860) b!1296834))

(assert (= (and b!1296834 res!861861) b!1296835))

(assert (= (and b!1296830 condMapEmpty!53495) mapIsEmpty!53495))

(assert (= (and b!1296830 (not condMapEmpty!53495)) mapNonEmpty!53495))

(get-info :version)

(assert (= (and mapNonEmpty!53495 ((_ is ValueCellFull!16413) mapValue!53495)) b!1296831))

(assert (= (and b!1296830 ((_ is ValueCellFull!16413) mapDefault!53495)) b!1296833))

(assert (= start!109494 b!1296830))

(declare-fun m!1188627 () Bool)

(assert (=> mapNonEmpty!53495 m!1188627))

(declare-fun m!1188629 () Bool)

(assert (=> start!109494 m!1188629))

(declare-fun m!1188631 () Bool)

(assert (=> start!109494 m!1188631))

(declare-fun m!1188633 () Bool)

(assert (=> start!109494 m!1188633))

(declare-fun m!1188635 () Bool)

(assert (=> b!1296829 m!1188635))

(declare-fun m!1188637 () Bool)

(assert (=> b!1296832 m!1188637))

(declare-fun m!1188639 () Bool)

(assert (=> b!1296834 m!1188639))

(assert (=> b!1296834 m!1188639))

(declare-fun m!1188641 () Bool)

(assert (=> b!1296834 m!1188641))

(check-sat (not b_next!28983) (not b!1296829) (not b!1296834) (not start!109494) tp_is_empty!34623 (not mapNonEmpty!53495) b_and!47073 (not b!1296832))
(check-sat b_and!47073 (not b_next!28983))

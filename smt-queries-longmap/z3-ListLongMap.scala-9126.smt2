; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109764 () Bool)

(assert start!109764)

(declare-fun b_free!29029 () Bool)

(declare-fun b_next!29029 () Bool)

(assert (=> start!109764 (= b_free!29029 (not b_next!29029))))

(declare-fun tp!102206 () Bool)

(declare-fun b_and!47121 () Bool)

(assert (=> start!109764 (= tp!102206 b_and!47121)))

(declare-fun mapNonEmpty!53564 () Bool)

(declare-fun mapRes!53564 () Bool)

(declare-fun tp!102205 () Bool)

(declare-fun e!741038 () Bool)

(assert (=> mapNonEmpty!53564 (= mapRes!53564 (and tp!102205 e!741038))))

(declare-fun mapKey!53564 () (_ BitVec 32))

(declare-datatypes ((V!51329 0))(
  ( (V!51330 (val!17409 Int)) )
))
(declare-datatypes ((ValueCell!16436 0))(
  ( (ValueCellFull!16436 (v!20007 V!51329)) (EmptyCell!16436) )
))
(declare-fun mapRest!53564 () (Array (_ BitVec 32) ValueCell!16436))

(declare-fun mapValue!53564 () ValueCell!16436)

(declare-datatypes ((array!86387 0))(
  ( (array!86388 (arr!41690 (Array (_ BitVec 32) ValueCell!16436)) (size!42241 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86387)

(assert (=> mapNonEmpty!53564 (= (arr!41690 _values!1445) (store mapRest!53564 mapKey!53564 mapValue!53564))))

(declare-fun b!1298688 () Bool)

(declare-fun tp_is_empty!34669 () Bool)

(assert (=> b!1298688 (= e!741038 tp_is_empty!34669)))

(declare-fun res!862731 () Bool)

(declare-fun e!741036 () Bool)

(assert (=> start!109764 (=> (not res!862731) (not e!741036))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109764 (= res!862731 (validMask!0 mask!2175))))

(assert (=> start!109764 e!741036))

(assert (=> start!109764 tp_is_empty!34669))

(assert (=> start!109764 true))

(declare-fun e!741039 () Bool)

(declare-fun array_inv!31789 (array!86387) Bool)

(assert (=> start!109764 (and (array_inv!31789 _values!1445) e!741039)))

(declare-datatypes ((array!86389 0))(
  ( (array!86390 (arr!41691 (Array (_ BitVec 32) (_ BitVec 64))) (size!42242 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86389)

(declare-fun array_inv!31790 (array!86389) Bool)

(assert (=> start!109764 (array_inv!31790 _keys!1741)))

(assert (=> start!109764 tp!102206))

(declare-fun mapIsEmpty!53564 () Bool)

(assert (=> mapIsEmpty!53564 mapRes!53564))

(declare-fun b!1298689 () Bool)

(declare-fun res!862729 () Bool)

(assert (=> b!1298689 (=> (not res!862729) (not e!741036))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298689 (= res!862729 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42242 _keys!1741))))))

(declare-fun b!1298690 () Bool)

(declare-fun res!862728 () Bool)

(assert (=> b!1298690 (=> (not res!862728) (not e!741036))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298690 (= res!862728 (and (= (size!42241 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42242 _keys!1741) (size!42241 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298691 () Bool)

(declare-fun res!862730 () Bool)

(assert (=> b!1298691 (=> (not res!862730) (not e!741036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86389 (_ BitVec 32)) Bool)

(assert (=> b!1298691 (= res!862730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298692 () Bool)

(declare-fun res!862732 () Bool)

(assert (=> b!1298692 (=> (not res!862732) (not e!741036))))

(declare-datatypes ((List!29607 0))(
  ( (Nil!29604) (Cons!29603 (h!30821 (_ BitVec 64)) (t!43163 List!29607)) )
))
(declare-fun arrayNoDuplicates!0 (array!86389 (_ BitVec 32) List!29607) Bool)

(assert (=> b!1298692 (= res!862732 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29604))))

(declare-fun b!1298693 () Bool)

(declare-fun e!741037 () Bool)

(assert (=> b!1298693 (= e!741037 tp_is_empty!34669)))

(declare-fun b!1298694 () Bool)

(assert (=> b!1298694 (= e!741036 false)))

(declare-fun minValue!1387 () V!51329)

(declare-fun zeroValue!1387 () V!51329)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!581073 () Bool)

(declare-datatypes ((tuple2!22442 0))(
  ( (tuple2!22443 (_1!11232 (_ BitVec 64)) (_2!11232 V!51329)) )
))
(declare-datatypes ((List!29608 0))(
  ( (Nil!29605) (Cons!29604 (h!30822 tuple2!22442) (t!43164 List!29608)) )
))
(declare-datatypes ((ListLongMap!20107 0))(
  ( (ListLongMap!20108 (toList!10069 List!29608)) )
))
(declare-fun contains!8199 (ListLongMap!20107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5088 (array!86389 array!86387 (_ BitVec 32) (_ BitVec 32) V!51329 V!51329 (_ BitVec 32) Int) ListLongMap!20107)

(assert (=> b!1298694 (= lt!581073 (contains!8199 (getCurrentListMap!5088 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298695 () Bool)

(assert (=> b!1298695 (= e!741039 (and e!741037 mapRes!53564))))

(declare-fun condMapEmpty!53564 () Bool)

(declare-fun mapDefault!53564 () ValueCell!16436)

(assert (=> b!1298695 (= condMapEmpty!53564 (= (arr!41690 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16436)) mapDefault!53564)))))

(assert (= (and start!109764 res!862731) b!1298690))

(assert (= (and b!1298690 res!862728) b!1298691))

(assert (= (and b!1298691 res!862730) b!1298692))

(assert (= (and b!1298692 res!862732) b!1298689))

(assert (= (and b!1298689 res!862729) b!1298694))

(assert (= (and b!1298695 condMapEmpty!53564) mapIsEmpty!53564))

(assert (= (and b!1298695 (not condMapEmpty!53564)) mapNonEmpty!53564))

(get-info :version)

(assert (= (and mapNonEmpty!53564 ((_ is ValueCellFull!16436) mapValue!53564)) b!1298688))

(assert (= (and b!1298695 ((_ is ValueCellFull!16436) mapDefault!53564)) b!1298693))

(assert (= start!109764 b!1298695))

(declare-fun m!1190613 () Bool)

(assert (=> b!1298692 m!1190613))

(declare-fun m!1190615 () Bool)

(assert (=> start!109764 m!1190615))

(declare-fun m!1190617 () Bool)

(assert (=> start!109764 m!1190617))

(declare-fun m!1190619 () Bool)

(assert (=> start!109764 m!1190619))

(declare-fun m!1190621 () Bool)

(assert (=> mapNonEmpty!53564 m!1190621))

(declare-fun m!1190623 () Bool)

(assert (=> b!1298691 m!1190623))

(declare-fun m!1190625 () Bool)

(assert (=> b!1298694 m!1190625))

(assert (=> b!1298694 m!1190625))

(declare-fun m!1190627 () Bool)

(assert (=> b!1298694 m!1190627))

(check-sat (not mapNonEmpty!53564) (not b_next!29029) (not start!109764) b_and!47121 (not b!1298692) (not b!1298691) (not b!1298694) tp_is_empty!34669)
(check-sat b_and!47121 (not b_next!29029))

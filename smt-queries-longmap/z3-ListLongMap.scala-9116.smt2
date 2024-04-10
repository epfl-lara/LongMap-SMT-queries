; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109482 () Bool)

(assert start!109482)

(declare-fun b_free!28971 () Bool)

(declare-fun b_next!28971 () Bool)

(assert (=> start!109482 (= b_free!28971 (not b_next!28971))))

(declare-fun tp!102032 () Bool)

(declare-fun b_and!47061 () Bool)

(assert (=> start!109482 (= tp!102032 b_and!47061)))

(declare-fun b!1296678 () Bool)

(declare-fun e!739757 () Bool)

(assert (=> b!1296678 (= e!739757 false)))

(declare-datatypes ((V!51251 0))(
  ( (V!51252 (val!17380 Int)) )
))
(declare-fun minValue!1387 () V!51251)

(declare-fun zeroValue!1387 () V!51251)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16407 0))(
  ( (ValueCellFull!16407 (v!19983 V!51251)) (EmptyCell!16407) )
))
(declare-datatypes ((array!86240 0))(
  ( (array!86241 (arr!41621 (Array (_ BitVec 32) ValueCell!16407)) (size!42171 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86240)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86242 0))(
  ( (array!86243 (arr!41622 (Array (_ BitVec 32) (_ BitVec 64))) (size!42172 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86242)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!580511 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22392 0))(
  ( (tuple2!22393 (_1!11207 (_ BitVec 64)) (_2!11207 V!51251)) )
))
(declare-datatypes ((List!29529 0))(
  ( (Nil!29526) (Cons!29525 (h!30734 tuple2!22392) (t!43093 List!29529)) )
))
(declare-datatypes ((ListLongMap!20049 0))(
  ( (ListLongMap!20050 (toList!10040 List!29529)) )
))
(declare-fun contains!8158 (ListLongMap!20049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5069 (array!86242 array!86240 (_ BitVec 32) (_ BitVec 32) V!51251 V!51251 (_ BitVec 32) Int) ListLongMap!20049)

(assert (=> b!1296678 (= lt!580511 (contains!8158 (getCurrentListMap!5069 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296679 () Bool)

(declare-fun res!861767 () Bool)

(assert (=> b!1296679 (=> (not res!861767) (not e!739757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86242 (_ BitVec 32)) Bool)

(assert (=> b!1296679 (= res!861767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296680 () Bool)

(declare-fun res!861766 () Bool)

(assert (=> b!1296680 (=> (not res!861766) (not e!739757))))

(declare-datatypes ((List!29530 0))(
  ( (Nil!29527) (Cons!29526 (h!30735 (_ BitVec 64)) (t!43094 List!29530)) )
))
(declare-fun arrayNoDuplicates!0 (array!86242 (_ BitVec 32) List!29530) Bool)

(assert (=> b!1296680 (= res!861766 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29527))))

(declare-fun b!1296681 () Bool)

(declare-fun e!739754 () Bool)

(declare-fun e!739753 () Bool)

(declare-fun mapRes!53477 () Bool)

(assert (=> b!1296681 (= e!739754 (and e!739753 mapRes!53477))))

(declare-fun condMapEmpty!53477 () Bool)

(declare-fun mapDefault!53477 () ValueCell!16407)

(assert (=> b!1296681 (= condMapEmpty!53477 (= (arr!41621 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16407)) mapDefault!53477)))))

(declare-fun b!1296682 () Bool)

(declare-fun e!739756 () Bool)

(declare-fun tp_is_empty!34611 () Bool)

(assert (=> b!1296682 (= e!739756 tp_is_empty!34611)))

(declare-fun b!1296683 () Bool)

(assert (=> b!1296683 (= e!739753 tp_is_empty!34611)))

(declare-fun b!1296684 () Bool)

(declare-fun res!861765 () Bool)

(assert (=> b!1296684 (=> (not res!861765) (not e!739757))))

(assert (=> b!1296684 (= res!861765 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42172 _keys!1741))))))

(declare-fun mapNonEmpty!53477 () Bool)

(declare-fun tp!102031 () Bool)

(assert (=> mapNonEmpty!53477 (= mapRes!53477 (and tp!102031 e!739756))))

(declare-fun mapRest!53477 () (Array (_ BitVec 32) ValueCell!16407))

(declare-fun mapValue!53477 () ValueCell!16407)

(declare-fun mapKey!53477 () (_ BitVec 32))

(assert (=> mapNonEmpty!53477 (= (arr!41621 _values!1445) (store mapRest!53477 mapKey!53477 mapValue!53477))))

(declare-fun b!1296685 () Bool)

(declare-fun res!861768 () Bool)

(assert (=> b!1296685 (=> (not res!861768) (not e!739757))))

(assert (=> b!1296685 (= res!861768 (and (= (size!42171 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42172 _keys!1741) (size!42171 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!861764 () Bool)

(assert (=> start!109482 (=> (not res!861764) (not e!739757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109482 (= res!861764 (validMask!0 mask!2175))))

(assert (=> start!109482 e!739757))

(assert (=> start!109482 tp_is_empty!34611))

(assert (=> start!109482 true))

(declare-fun array_inv!31503 (array!86240) Bool)

(assert (=> start!109482 (and (array_inv!31503 _values!1445) e!739754)))

(declare-fun array_inv!31504 (array!86242) Bool)

(assert (=> start!109482 (array_inv!31504 _keys!1741)))

(assert (=> start!109482 tp!102032))

(declare-fun mapIsEmpty!53477 () Bool)

(assert (=> mapIsEmpty!53477 mapRes!53477))

(assert (= (and start!109482 res!861764) b!1296685))

(assert (= (and b!1296685 res!861768) b!1296679))

(assert (= (and b!1296679 res!861767) b!1296680))

(assert (= (and b!1296680 res!861766) b!1296684))

(assert (= (and b!1296684 res!861765) b!1296678))

(assert (= (and b!1296681 condMapEmpty!53477) mapIsEmpty!53477))

(assert (= (and b!1296681 (not condMapEmpty!53477)) mapNonEmpty!53477))

(get-info :version)

(assert (= (and mapNonEmpty!53477 ((_ is ValueCellFull!16407) mapValue!53477)) b!1296682))

(assert (= (and b!1296681 ((_ is ValueCellFull!16407) mapDefault!53477)) b!1296683))

(assert (= start!109482 b!1296681))

(declare-fun m!1188531 () Bool)

(assert (=> b!1296680 m!1188531))

(declare-fun m!1188533 () Bool)

(assert (=> start!109482 m!1188533))

(declare-fun m!1188535 () Bool)

(assert (=> start!109482 m!1188535))

(declare-fun m!1188537 () Bool)

(assert (=> start!109482 m!1188537))

(declare-fun m!1188539 () Bool)

(assert (=> mapNonEmpty!53477 m!1188539))

(declare-fun m!1188541 () Bool)

(assert (=> b!1296679 m!1188541))

(declare-fun m!1188543 () Bool)

(assert (=> b!1296678 m!1188543))

(assert (=> b!1296678 m!1188543))

(declare-fun m!1188545 () Bool)

(assert (=> b!1296678 m!1188545))

(check-sat (not start!109482) (not b!1296679) (not b!1296680) tp_is_empty!34611 (not b_next!28971) b_and!47061 (not b!1296678) (not mapNonEmpty!53477))
(check-sat b_and!47061 (not b_next!28971))

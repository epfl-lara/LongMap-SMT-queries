; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109776 () Bool)

(assert start!109776)

(declare-fun b_free!29041 () Bool)

(declare-fun b_next!29041 () Bool)

(assert (=> start!109776 (= b_free!29041 (not b_next!29041))))

(declare-fun tp!102241 () Bool)

(declare-fun b_and!47133 () Bool)

(assert (=> start!109776 (= tp!102241 b_and!47133)))

(declare-fun b!1298832 () Bool)

(declare-fun res!862820 () Bool)

(declare-fun e!741126 () Bool)

(assert (=> b!1298832 (=> (not res!862820) (not e!741126))))

(declare-datatypes ((array!86411 0))(
  ( (array!86412 (arr!41702 (Array (_ BitVec 32) (_ BitVec 64))) (size!42253 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86411)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86411 (_ BitVec 32)) Bool)

(assert (=> b!1298832 (= res!862820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298833 () Bool)

(declare-fun e!741127 () Bool)

(declare-fun e!741128 () Bool)

(declare-fun mapRes!53582 () Bool)

(assert (=> b!1298833 (= e!741127 (and e!741128 mapRes!53582))))

(declare-fun condMapEmpty!53582 () Bool)

(declare-datatypes ((V!51345 0))(
  ( (V!51346 (val!17415 Int)) )
))
(declare-datatypes ((ValueCell!16442 0))(
  ( (ValueCellFull!16442 (v!20013 V!51345)) (EmptyCell!16442) )
))
(declare-datatypes ((array!86413 0))(
  ( (array!86414 (arr!41703 (Array (_ BitVec 32) ValueCell!16442)) (size!42254 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86413)

(declare-fun mapDefault!53582 () ValueCell!16442)

(assert (=> b!1298833 (= condMapEmpty!53582 (= (arr!41703 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16442)) mapDefault!53582)))))

(declare-fun b!1298834 () Bool)

(declare-fun tp_is_empty!34681 () Bool)

(assert (=> b!1298834 (= e!741128 tp_is_empty!34681)))

(declare-fun b!1298835 () Bool)

(declare-fun e!741129 () Bool)

(assert (=> b!1298835 (= e!741129 tp_is_empty!34681)))

(declare-fun b!1298836 () Bool)

(assert (=> b!1298836 (= e!741126 false)))

(declare-fun minValue!1387 () V!51345)

(declare-fun zeroValue!1387 () V!51345)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!581091 () Bool)

(declare-datatypes ((tuple2!22454 0))(
  ( (tuple2!22455 (_1!11238 (_ BitVec 64)) (_2!11238 V!51345)) )
))
(declare-datatypes ((List!29617 0))(
  ( (Nil!29614) (Cons!29613 (h!30831 tuple2!22454) (t!43173 List!29617)) )
))
(declare-datatypes ((ListLongMap!20119 0))(
  ( (ListLongMap!20120 (toList!10075 List!29617)) )
))
(declare-fun contains!8205 (ListLongMap!20119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5094 (array!86411 array!86413 (_ BitVec 32) (_ BitVec 32) V!51345 V!51345 (_ BitVec 32) Int) ListLongMap!20119)

(assert (=> b!1298836 (= lt!581091 (contains!8205 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298837 () Bool)

(declare-fun res!862819 () Bool)

(assert (=> b!1298837 (=> (not res!862819) (not e!741126))))

(assert (=> b!1298837 (= res!862819 (and (= (size!42254 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42253 _keys!1741) (size!42254 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53582 () Bool)

(assert (=> mapIsEmpty!53582 mapRes!53582))

(declare-fun res!862818 () Bool)

(assert (=> start!109776 (=> (not res!862818) (not e!741126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109776 (= res!862818 (validMask!0 mask!2175))))

(assert (=> start!109776 e!741126))

(assert (=> start!109776 tp_is_empty!34681))

(assert (=> start!109776 true))

(declare-fun array_inv!31795 (array!86413) Bool)

(assert (=> start!109776 (and (array_inv!31795 _values!1445) e!741127)))

(declare-fun array_inv!31796 (array!86411) Bool)

(assert (=> start!109776 (array_inv!31796 _keys!1741)))

(assert (=> start!109776 tp!102241))

(declare-fun b!1298838 () Bool)

(declare-fun res!862822 () Bool)

(assert (=> b!1298838 (=> (not res!862822) (not e!741126))))

(declare-datatypes ((List!29618 0))(
  ( (Nil!29615) (Cons!29614 (h!30832 (_ BitVec 64)) (t!43174 List!29618)) )
))
(declare-fun arrayNoDuplicates!0 (array!86411 (_ BitVec 32) List!29618) Bool)

(assert (=> b!1298838 (= res!862822 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29615))))

(declare-fun b!1298839 () Bool)

(declare-fun res!862821 () Bool)

(assert (=> b!1298839 (=> (not res!862821) (not e!741126))))

(assert (=> b!1298839 (= res!862821 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42253 _keys!1741))))))

(declare-fun mapNonEmpty!53582 () Bool)

(declare-fun tp!102242 () Bool)

(assert (=> mapNonEmpty!53582 (= mapRes!53582 (and tp!102242 e!741129))))

(declare-fun mapValue!53582 () ValueCell!16442)

(declare-fun mapRest!53582 () (Array (_ BitVec 32) ValueCell!16442))

(declare-fun mapKey!53582 () (_ BitVec 32))

(assert (=> mapNonEmpty!53582 (= (arr!41703 _values!1445) (store mapRest!53582 mapKey!53582 mapValue!53582))))

(assert (= (and start!109776 res!862818) b!1298837))

(assert (= (and b!1298837 res!862819) b!1298832))

(assert (= (and b!1298832 res!862820) b!1298838))

(assert (= (and b!1298838 res!862822) b!1298839))

(assert (= (and b!1298839 res!862821) b!1298836))

(assert (= (and b!1298833 condMapEmpty!53582) mapIsEmpty!53582))

(assert (= (and b!1298833 (not condMapEmpty!53582)) mapNonEmpty!53582))

(get-info :version)

(assert (= (and mapNonEmpty!53582 ((_ is ValueCellFull!16442) mapValue!53582)) b!1298835))

(assert (= (and b!1298833 ((_ is ValueCellFull!16442) mapDefault!53582)) b!1298834))

(assert (= start!109776 b!1298833))

(declare-fun m!1190709 () Bool)

(assert (=> mapNonEmpty!53582 m!1190709))

(declare-fun m!1190711 () Bool)

(assert (=> b!1298832 m!1190711))

(declare-fun m!1190713 () Bool)

(assert (=> b!1298836 m!1190713))

(assert (=> b!1298836 m!1190713))

(declare-fun m!1190715 () Bool)

(assert (=> b!1298836 m!1190715))

(declare-fun m!1190717 () Bool)

(assert (=> b!1298838 m!1190717))

(declare-fun m!1190719 () Bool)

(assert (=> start!109776 m!1190719))

(declare-fun m!1190721 () Bool)

(assert (=> start!109776 m!1190721))

(declare-fun m!1190723 () Bool)

(assert (=> start!109776 m!1190723))

(check-sat (not mapNonEmpty!53582) b_and!47133 tp_is_empty!34681 (not b!1298838) (not start!109776) (not b!1298832) (not b_next!29041) (not b!1298836))
(check-sat b_and!47133 (not b_next!29041))

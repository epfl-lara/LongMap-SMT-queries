; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109782 () Bool)

(assert start!109782)

(declare-fun b_free!29047 () Bool)

(declare-fun b_next!29047 () Bool)

(assert (=> start!109782 (= b_free!29047 (not b_next!29047))))

(declare-fun tp!102259 () Bool)

(declare-fun b_and!47139 () Bool)

(assert (=> start!109782 (= tp!102259 b_and!47139)))

(declare-fun b!1298904 () Bool)

(declare-fun e!741170 () Bool)

(declare-fun tp_is_empty!34687 () Bool)

(assert (=> b!1298904 (= e!741170 tp_is_empty!34687)))

(declare-fun b!1298905 () Bool)

(declare-fun res!862865 () Bool)

(declare-fun e!741173 () Bool)

(assert (=> b!1298905 (=> (not res!862865) (not e!741173))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51353 0))(
  ( (V!51354 (val!17418 Int)) )
))
(declare-datatypes ((ValueCell!16445 0))(
  ( (ValueCellFull!16445 (v!20016 V!51353)) (EmptyCell!16445) )
))
(declare-datatypes ((array!86421 0))(
  ( (array!86422 (arr!41707 (Array (_ BitVec 32) ValueCell!16445)) (size!42258 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86421)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86423 0))(
  ( (array!86424 (arr!41708 (Array (_ BitVec 32) (_ BitVec 64))) (size!42259 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86423)

(assert (=> b!1298905 (= res!862865 (and (= (size!42258 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42259 _keys!1741) (size!42258 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298906 () Bool)

(declare-fun e!741171 () Bool)

(declare-fun e!741172 () Bool)

(declare-fun mapRes!53591 () Bool)

(assert (=> b!1298906 (= e!741171 (and e!741172 mapRes!53591))))

(declare-fun condMapEmpty!53591 () Bool)

(declare-fun mapDefault!53591 () ValueCell!16445)

(assert (=> b!1298906 (= condMapEmpty!53591 (= (arr!41707 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16445)) mapDefault!53591)))))

(declare-fun res!862866 () Bool)

(assert (=> start!109782 (=> (not res!862866) (not e!741173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109782 (= res!862866 (validMask!0 mask!2175))))

(assert (=> start!109782 e!741173))

(assert (=> start!109782 tp_is_empty!34687))

(assert (=> start!109782 true))

(declare-fun array_inv!31797 (array!86421) Bool)

(assert (=> start!109782 (and (array_inv!31797 _values!1445) e!741171)))

(declare-fun array_inv!31798 (array!86423) Bool)

(assert (=> start!109782 (array_inv!31798 _keys!1741)))

(assert (=> start!109782 tp!102259))

(declare-fun mapNonEmpty!53591 () Bool)

(declare-fun tp!102260 () Bool)

(assert (=> mapNonEmpty!53591 (= mapRes!53591 (and tp!102260 e!741170))))

(declare-fun mapRest!53591 () (Array (_ BitVec 32) ValueCell!16445))

(declare-fun mapValue!53591 () ValueCell!16445)

(declare-fun mapKey!53591 () (_ BitVec 32))

(assert (=> mapNonEmpty!53591 (= (arr!41707 _values!1445) (store mapRest!53591 mapKey!53591 mapValue!53591))))

(declare-fun mapIsEmpty!53591 () Bool)

(assert (=> mapIsEmpty!53591 mapRes!53591))

(declare-fun b!1298907 () Bool)

(declare-fun res!862867 () Bool)

(assert (=> b!1298907 (=> (not res!862867) (not e!741173))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298907 (= res!862867 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42259 _keys!1741))))))

(declare-fun b!1298908 () Bool)

(declare-fun res!862863 () Bool)

(assert (=> b!1298908 (=> (not res!862863) (not e!741173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86423 (_ BitVec 32)) Bool)

(assert (=> b!1298908 (= res!862863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298909 () Bool)

(declare-fun res!862864 () Bool)

(assert (=> b!1298909 (=> (not res!862864) (not e!741173))))

(declare-datatypes ((List!29620 0))(
  ( (Nil!29617) (Cons!29616 (h!30834 (_ BitVec 64)) (t!43176 List!29620)) )
))
(declare-fun arrayNoDuplicates!0 (array!86423 (_ BitVec 32) List!29620) Bool)

(assert (=> b!1298909 (= res!862864 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29617))))

(declare-fun b!1298910 () Bool)

(assert (=> b!1298910 (= e!741173 false)))

(declare-fun minValue!1387 () V!51353)

(declare-fun zeroValue!1387 () V!51353)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!581100 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22458 0))(
  ( (tuple2!22459 (_1!11240 (_ BitVec 64)) (_2!11240 V!51353)) )
))
(declare-datatypes ((List!29621 0))(
  ( (Nil!29618) (Cons!29617 (h!30835 tuple2!22458) (t!43177 List!29621)) )
))
(declare-datatypes ((ListLongMap!20123 0))(
  ( (ListLongMap!20124 (toList!10077 List!29621)) )
))
(declare-fun contains!8207 (ListLongMap!20123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5096 (array!86423 array!86421 (_ BitVec 32) (_ BitVec 32) V!51353 V!51353 (_ BitVec 32) Int) ListLongMap!20123)

(assert (=> b!1298910 (= lt!581100 (contains!8207 (getCurrentListMap!5096 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298911 () Bool)

(assert (=> b!1298911 (= e!741172 tp_is_empty!34687)))

(assert (= (and start!109782 res!862866) b!1298905))

(assert (= (and b!1298905 res!862865) b!1298908))

(assert (= (and b!1298908 res!862863) b!1298909))

(assert (= (and b!1298909 res!862864) b!1298907))

(assert (= (and b!1298907 res!862867) b!1298910))

(assert (= (and b!1298906 condMapEmpty!53591) mapIsEmpty!53591))

(assert (= (and b!1298906 (not condMapEmpty!53591)) mapNonEmpty!53591))

(get-info :version)

(assert (= (and mapNonEmpty!53591 ((_ is ValueCellFull!16445) mapValue!53591)) b!1298904))

(assert (= (and b!1298906 ((_ is ValueCellFull!16445) mapDefault!53591)) b!1298911))

(assert (= start!109782 b!1298906))

(declare-fun m!1190757 () Bool)

(assert (=> b!1298910 m!1190757))

(assert (=> b!1298910 m!1190757))

(declare-fun m!1190759 () Bool)

(assert (=> b!1298910 m!1190759))

(declare-fun m!1190761 () Bool)

(assert (=> mapNonEmpty!53591 m!1190761))

(declare-fun m!1190763 () Bool)

(assert (=> b!1298908 m!1190763))

(declare-fun m!1190765 () Bool)

(assert (=> b!1298909 m!1190765))

(declare-fun m!1190767 () Bool)

(assert (=> start!109782 m!1190767))

(declare-fun m!1190769 () Bool)

(assert (=> start!109782 m!1190769))

(declare-fun m!1190771 () Bool)

(assert (=> start!109782 m!1190771))

(check-sat (not b!1298908) tp_is_empty!34687 (not start!109782) (not b!1298909) (not b_next!29047) (not b!1298910) (not mapNonEmpty!53591) b_and!47139)
(check-sat b_and!47139 (not b_next!29047))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109302 () Bool)

(assert start!109302)

(declare-fun b_free!28791 () Bool)

(declare-fun b_next!28791 () Bool)

(assert (=> start!109302 (= b_free!28791 (not b_next!28791))))

(declare-fun tp!101492 () Bool)

(declare-fun b_and!46881 () Bool)

(assert (=> start!109302 (= tp!101492 b_and!46881)))

(declare-fun b!1293440 () Bool)

(declare-fun res!859504 () Bool)

(declare-fun e!738179 () Bool)

(assert (=> b!1293440 (=> (not res!859504) (not e!738179))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85890 0))(
  ( (array!85891 (arr!41446 (Array (_ BitVec 32) (_ BitVec 64))) (size!41996 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85890)

(assert (=> b!1293440 (= res!859504 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41996 _keys!1741))))))

(declare-fun mapIsEmpty!53207 () Bool)

(declare-fun mapRes!53207 () Bool)

(assert (=> mapIsEmpty!53207 mapRes!53207))

(declare-fun b!1293441 () Bool)

(declare-fun e!738177 () Bool)

(declare-fun e!738175 () Bool)

(assert (=> b!1293441 (= e!738177 (and e!738175 mapRes!53207))))

(declare-fun condMapEmpty!53207 () Bool)

(declare-datatypes ((V!51011 0))(
  ( (V!51012 (val!17290 Int)) )
))
(declare-datatypes ((ValueCell!16317 0))(
  ( (ValueCellFull!16317 (v!19893 V!51011)) (EmptyCell!16317) )
))
(declare-datatypes ((array!85892 0))(
  ( (array!85893 (arr!41447 (Array (_ BitVec 32) ValueCell!16317)) (size!41997 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85892)

(declare-fun mapDefault!53207 () ValueCell!16317)

(assert (=> b!1293441 (= condMapEmpty!53207 (= (arr!41447 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16317)) mapDefault!53207)))))

(declare-fun b!1293442 () Bool)

(declare-fun res!859503 () Bool)

(assert (=> b!1293442 (=> (not res!859503) (not e!738179))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85890 (_ BitVec 32)) Bool)

(assert (=> b!1293442 (= res!859503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293443 () Bool)

(declare-fun tp_is_empty!34431 () Bool)

(assert (=> b!1293443 (= e!738175 tp_is_empty!34431)))

(declare-fun b!1293444 () Bool)

(declare-fun res!859506 () Bool)

(assert (=> b!1293444 (=> (not res!859506) (not e!738179))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293444 (= res!859506 (and (= (size!41997 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41996 _keys!1741) (size!41997 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53207 () Bool)

(declare-fun tp!101491 () Bool)

(declare-fun e!738174 () Bool)

(assert (=> mapNonEmpty!53207 (= mapRes!53207 (and tp!101491 e!738174))))

(declare-fun mapRest!53207 () (Array (_ BitVec 32) ValueCell!16317))

(declare-fun mapValue!53207 () ValueCell!16317)

(declare-fun mapKey!53207 () (_ BitVec 32))

(assert (=> mapNonEmpty!53207 (= (arr!41447 _values!1445) (store mapRest!53207 mapKey!53207 mapValue!53207))))

(declare-fun b!1293445 () Bool)

(declare-fun res!859500 () Bool)

(assert (=> b!1293445 (=> (not res!859500) (not e!738179))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293445 (= res!859500 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41996 _keys!1741))))))

(declare-fun b!1293447 () Bool)

(declare-fun e!738178 () Bool)

(assert (=> b!1293447 (= e!738179 (not e!738178))))

(declare-fun res!859498 () Bool)

(assert (=> b!1293447 (=> res!859498 e!738178)))

(assert (=> b!1293447 (= res!859498 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22252 0))(
  ( (tuple2!22253 (_1!11137 (_ BitVec 64)) (_2!11137 V!51011)) )
))
(declare-datatypes ((List!29400 0))(
  ( (Nil!29397) (Cons!29396 (h!30605 tuple2!22252) (t!42964 List!29400)) )
))
(declare-datatypes ((ListLongMap!19909 0))(
  ( (ListLongMap!19910 (toList!9970 List!29400)) )
))
(declare-fun contains!8088 (ListLongMap!19909 (_ BitVec 64)) Bool)

(assert (=> b!1293447 (not (contains!8088 (ListLongMap!19910 Nil!29397) k0!1205))))

(declare-datatypes ((Unit!42838 0))(
  ( (Unit!42839) )
))
(declare-fun lt!579549 () Unit!42838)

(declare-fun emptyContainsNothing!140 ((_ BitVec 64)) Unit!42838)

(assert (=> b!1293447 (= lt!579549 (emptyContainsNothing!140 k0!1205))))

(declare-fun b!1293448 () Bool)

(declare-fun res!859499 () Bool)

(assert (=> b!1293448 (=> (not res!859499) (not e!738179))))

(declare-datatypes ((List!29401 0))(
  ( (Nil!29398) (Cons!29397 (h!30606 (_ BitVec 64)) (t!42965 List!29401)) )
))
(declare-fun arrayNoDuplicates!0 (array!85890 (_ BitVec 32) List!29401) Bool)

(assert (=> b!1293448 (= res!859499 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29398))))

(declare-fun b!1293449 () Bool)

(declare-fun res!859502 () Bool)

(assert (=> b!1293449 (=> (not res!859502) (not e!738179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293449 (= res!859502 (not (validKeyInArray!0 (select (arr!41446 _keys!1741) from!2144))))))

(declare-fun b!1293446 () Bool)

(assert (=> b!1293446 (= e!738178 true)))

(declare-fun lt!579551 () ListLongMap!19909)

(declare-fun zeroValue!1387 () V!51011)

(declare-fun +!4402 (ListLongMap!19909 tuple2!22252) ListLongMap!19909)

(assert (=> b!1293446 (not (contains!8088 (+!4402 lt!579551 (tuple2!22253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579550 () Unit!42838)

(declare-fun addStillNotContains!420 (ListLongMap!19909 (_ BitVec 64) V!51011 (_ BitVec 64)) Unit!42838)

(assert (=> b!1293446 (= lt!579550 (addStillNotContains!420 lt!579551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51011)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6034 (array!85890 array!85892 (_ BitVec 32) (_ BitVec 32) V!51011 V!51011 (_ BitVec 32) Int) ListLongMap!19909)

(assert (=> b!1293446 (= lt!579551 (getCurrentListMapNoExtraKeys!6034 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!859501 () Bool)

(assert (=> start!109302 (=> (not res!859501) (not e!738179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109302 (= res!859501 (validMask!0 mask!2175))))

(assert (=> start!109302 e!738179))

(assert (=> start!109302 tp_is_empty!34431))

(assert (=> start!109302 true))

(declare-fun array_inv!31399 (array!85892) Bool)

(assert (=> start!109302 (and (array_inv!31399 _values!1445) e!738177)))

(declare-fun array_inv!31400 (array!85890) Bool)

(assert (=> start!109302 (array_inv!31400 _keys!1741)))

(assert (=> start!109302 tp!101492))

(declare-fun b!1293450 () Bool)

(assert (=> b!1293450 (= e!738174 tp_is_empty!34431)))

(declare-fun b!1293451 () Bool)

(declare-fun res!859505 () Bool)

(assert (=> b!1293451 (=> (not res!859505) (not e!738179))))

(declare-fun getCurrentListMap!5012 (array!85890 array!85892 (_ BitVec 32) (_ BitVec 32) V!51011 V!51011 (_ BitVec 32) Int) ListLongMap!19909)

(assert (=> b!1293451 (= res!859505 (contains!8088 (getCurrentListMap!5012 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109302 res!859501) b!1293444))

(assert (= (and b!1293444 res!859506) b!1293442))

(assert (= (and b!1293442 res!859503) b!1293448))

(assert (= (and b!1293448 res!859499) b!1293440))

(assert (= (and b!1293440 res!859504) b!1293451))

(assert (= (and b!1293451 res!859505) b!1293445))

(assert (= (and b!1293445 res!859500) b!1293449))

(assert (= (and b!1293449 res!859502) b!1293447))

(assert (= (and b!1293447 (not res!859498)) b!1293446))

(assert (= (and b!1293441 condMapEmpty!53207) mapIsEmpty!53207))

(assert (= (and b!1293441 (not condMapEmpty!53207)) mapNonEmpty!53207))

(get-info :version)

(assert (= (and mapNonEmpty!53207 ((_ is ValueCellFull!16317) mapValue!53207)) b!1293450))

(assert (= (and b!1293441 ((_ is ValueCellFull!16317) mapDefault!53207)) b!1293443))

(assert (= start!109302 b!1293441))

(declare-fun m!1185835 () Bool)

(assert (=> start!109302 m!1185835))

(declare-fun m!1185837 () Bool)

(assert (=> start!109302 m!1185837))

(declare-fun m!1185839 () Bool)

(assert (=> start!109302 m!1185839))

(declare-fun m!1185841 () Bool)

(assert (=> b!1293447 m!1185841))

(declare-fun m!1185843 () Bool)

(assert (=> b!1293447 m!1185843))

(declare-fun m!1185845 () Bool)

(assert (=> mapNonEmpty!53207 m!1185845))

(declare-fun m!1185847 () Bool)

(assert (=> b!1293449 m!1185847))

(assert (=> b!1293449 m!1185847))

(declare-fun m!1185849 () Bool)

(assert (=> b!1293449 m!1185849))

(declare-fun m!1185851 () Bool)

(assert (=> b!1293451 m!1185851))

(assert (=> b!1293451 m!1185851))

(declare-fun m!1185853 () Bool)

(assert (=> b!1293451 m!1185853))

(declare-fun m!1185855 () Bool)

(assert (=> b!1293442 m!1185855))

(declare-fun m!1185857 () Bool)

(assert (=> b!1293448 m!1185857))

(declare-fun m!1185859 () Bool)

(assert (=> b!1293446 m!1185859))

(assert (=> b!1293446 m!1185859))

(declare-fun m!1185861 () Bool)

(assert (=> b!1293446 m!1185861))

(declare-fun m!1185863 () Bool)

(assert (=> b!1293446 m!1185863))

(declare-fun m!1185865 () Bool)

(assert (=> b!1293446 m!1185865))

(check-sat (not b!1293446) (not b!1293447) b_and!46881 (not b_next!28791) tp_is_empty!34431 (not b!1293451) (not mapNonEmpty!53207) (not b!1293448) (not b!1293442) (not b!1293449) (not start!109302))
(check-sat b_and!46881 (not b_next!28791))

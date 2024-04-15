; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109498 () Bool)

(assert start!109498)

(declare-fun b_free!28987 () Bool)

(declare-fun b_next!28987 () Bool)

(assert (=> start!109498 (= b_free!28987 (not b_next!28987))))

(declare-fun tp!102080 () Bool)

(declare-fun b_and!47059 () Bool)

(assert (=> start!109498 (= tp!102080 b_and!47059)))

(declare-fun b!1296815 () Bool)

(declare-fun res!861870 () Bool)

(declare-fun e!739846 () Bool)

(assert (=> b!1296815 (=> (not res!861870) (not e!739846))))

(declare-datatypes ((array!86163 0))(
  ( (array!86164 (arr!41583 (Array (_ BitVec 32) (_ BitVec 64))) (size!42135 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86163)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86163 (_ BitVec 32)) Bool)

(assert (=> b!1296815 (= res!861870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296816 () Bool)

(assert (=> b!1296816 (= e!739846 false)))

(declare-datatypes ((V!51273 0))(
  ( (V!51274 (val!17388 Int)) )
))
(declare-fun minValue!1387 () V!51273)

(declare-fun zeroValue!1387 () V!51273)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580348 () Bool)

(declare-datatypes ((ValueCell!16415 0))(
  ( (ValueCellFull!16415 (v!19990 V!51273)) (EmptyCell!16415) )
))
(declare-datatypes ((array!86165 0))(
  ( (array!86166 (arr!41584 (Array (_ BitVec 32) ValueCell!16415)) (size!42136 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86165)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22458 0))(
  ( (tuple2!22459 (_1!11240 (_ BitVec 64)) (_2!11240 V!51273)) )
))
(declare-datatypes ((List!29583 0))(
  ( (Nil!29580) (Cons!29579 (h!30788 tuple2!22458) (t!43139 List!29583)) )
))
(declare-datatypes ((ListLongMap!20115 0))(
  ( (ListLongMap!20116 (toList!10073 List!29583)) )
))
(declare-fun contains!8121 (ListLongMap!20115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4989 (array!86163 array!86165 (_ BitVec 32) (_ BitVec 32) V!51273 V!51273 (_ BitVec 32) Int) ListLongMap!20115)

(assert (=> b!1296816 (= lt!580348 (contains!8121 (getCurrentListMap!4989 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296817 () Bool)

(declare-fun res!861867 () Bool)

(assert (=> b!1296817 (=> (not res!861867) (not e!739846))))

(assert (=> b!1296817 (= res!861867 (and (= (size!42136 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42135 _keys!1741) (size!42136 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296818 () Bool)

(declare-fun res!861869 () Bool)

(assert (=> b!1296818 (=> (not res!861869) (not e!739846))))

(assert (=> b!1296818 (= res!861869 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42135 _keys!1741))))))

(declare-fun b!1296819 () Bool)

(declare-fun e!739844 () Bool)

(declare-fun tp_is_empty!34627 () Bool)

(assert (=> b!1296819 (= e!739844 tp_is_empty!34627)))

(declare-fun res!861868 () Bool)

(assert (=> start!109498 (=> (not res!861868) (not e!739846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109498 (= res!861868 (validMask!0 mask!2175))))

(assert (=> start!109498 e!739846))

(assert (=> start!109498 tp_is_empty!34627))

(assert (=> start!109498 true))

(declare-fun e!739847 () Bool)

(declare-fun array_inv!31641 (array!86165) Bool)

(assert (=> start!109498 (and (array_inv!31641 _values!1445) e!739847)))

(declare-fun array_inv!31642 (array!86163) Bool)

(assert (=> start!109498 (array_inv!31642 _keys!1741)))

(assert (=> start!109498 tp!102080))

(declare-fun b!1296820 () Bool)

(declare-fun res!861866 () Bool)

(assert (=> b!1296820 (=> (not res!861866) (not e!739846))))

(declare-datatypes ((List!29584 0))(
  ( (Nil!29581) (Cons!29580 (h!30789 (_ BitVec 64)) (t!43140 List!29584)) )
))
(declare-fun arrayNoDuplicates!0 (array!86163 (_ BitVec 32) List!29584) Bool)

(assert (=> b!1296820 (= res!861866 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29581))))

(declare-fun b!1296821 () Bool)

(declare-fun e!739848 () Bool)

(assert (=> b!1296821 (= e!739848 tp_is_empty!34627)))

(declare-fun mapIsEmpty!53501 () Bool)

(declare-fun mapRes!53501 () Bool)

(assert (=> mapIsEmpty!53501 mapRes!53501))

(declare-fun b!1296822 () Bool)

(assert (=> b!1296822 (= e!739847 (and e!739844 mapRes!53501))))

(declare-fun condMapEmpty!53501 () Bool)

(declare-fun mapDefault!53501 () ValueCell!16415)

(assert (=> b!1296822 (= condMapEmpty!53501 (= (arr!41584 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16415)) mapDefault!53501)))))

(declare-fun mapNonEmpty!53501 () Bool)

(declare-fun tp!102081 () Bool)

(assert (=> mapNonEmpty!53501 (= mapRes!53501 (and tp!102081 e!739848))))

(declare-fun mapRest!53501 () (Array (_ BitVec 32) ValueCell!16415))

(declare-fun mapKey!53501 () (_ BitVec 32))

(declare-fun mapValue!53501 () ValueCell!16415)

(assert (=> mapNonEmpty!53501 (= (arr!41584 _values!1445) (store mapRest!53501 mapKey!53501 mapValue!53501))))

(assert (= (and start!109498 res!861868) b!1296817))

(assert (= (and b!1296817 res!861867) b!1296815))

(assert (= (and b!1296815 res!861870) b!1296820))

(assert (= (and b!1296820 res!861866) b!1296818))

(assert (= (and b!1296818 res!861869) b!1296816))

(assert (= (and b!1296822 condMapEmpty!53501) mapIsEmpty!53501))

(assert (= (and b!1296822 (not condMapEmpty!53501)) mapNonEmpty!53501))

(get-info :version)

(assert (= (and mapNonEmpty!53501 ((_ is ValueCellFull!16415) mapValue!53501)) b!1296821))

(assert (= (and b!1296822 ((_ is ValueCellFull!16415) mapDefault!53501)) b!1296819))

(assert (= start!109498 b!1296822))

(declare-fun m!1188159 () Bool)

(assert (=> start!109498 m!1188159))

(declare-fun m!1188161 () Bool)

(assert (=> start!109498 m!1188161))

(declare-fun m!1188163 () Bool)

(assert (=> start!109498 m!1188163))

(declare-fun m!1188165 () Bool)

(assert (=> b!1296815 m!1188165))

(declare-fun m!1188167 () Bool)

(assert (=> mapNonEmpty!53501 m!1188167))

(declare-fun m!1188169 () Bool)

(assert (=> b!1296820 m!1188169))

(declare-fun m!1188171 () Bool)

(assert (=> b!1296816 m!1188171))

(assert (=> b!1296816 m!1188171))

(declare-fun m!1188173 () Bool)

(assert (=> b!1296816 m!1188173))

(check-sat tp_is_empty!34627 (not mapNonEmpty!53501) (not b_next!28987) (not b!1296820) (not b!1296816) (not b!1296815) (not start!109498) b_and!47059)
(check-sat b_and!47059 (not b_next!28987))

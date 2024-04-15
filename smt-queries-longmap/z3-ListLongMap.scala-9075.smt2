; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109234 () Bool)

(assert start!109234)

(declare-fun b_free!28723 () Bool)

(declare-fun b_next!28723 () Bool)

(assert (=> start!109234 (= b_free!28723 (not b_next!28723))))

(declare-fun tp!101288 () Bool)

(declare-fun b_and!46795 () Bool)

(assert (=> start!109234 (= tp!101288 b_and!46795)))

(declare-fun mapNonEmpty!53105 () Bool)

(declare-fun mapRes!53105 () Bool)

(declare-fun tp!101289 () Bool)

(declare-fun e!737570 () Bool)

(assert (=> mapNonEmpty!53105 (= mapRes!53105 (and tp!101289 e!737570))))

(declare-datatypes ((V!50921 0))(
  ( (V!50922 (val!17256 Int)) )
))
(declare-datatypes ((ValueCell!16283 0))(
  ( (ValueCellFull!16283 (v!19858 V!50921)) (EmptyCell!16283) )
))
(declare-fun mapRest!53105 () (Array (_ BitVec 32) ValueCell!16283))

(declare-datatypes ((array!85643 0))(
  ( (array!85644 (arr!41323 (Array (_ BitVec 32) ValueCell!16283)) (size!41875 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85643)

(declare-fun mapKey!53105 () (_ BitVec 32))

(declare-fun mapValue!53105 () ValueCell!16283)

(assert (=> mapNonEmpty!53105 (= (arr!41323 _values!1445) (store mapRest!53105 mapKey!53105 mapValue!53105))))

(declare-fun b!1292186 () Bool)

(declare-fun res!858587 () Bool)

(declare-fun e!737569 () Bool)

(assert (=> b!1292186 (=> (not res!858587) (not e!737569))))

(declare-fun minValue!1387 () V!50921)

(declare-fun zeroValue!1387 () V!50921)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85645 0))(
  ( (array!85646 (arr!41324 (Array (_ BitVec 32) (_ BitVec 64))) (size!41876 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85645)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22236 0))(
  ( (tuple2!22237 (_1!11129 (_ BitVec 64)) (_2!11129 V!50921)) )
))
(declare-datatypes ((List!29389 0))(
  ( (Nil!29386) (Cons!29385 (h!30594 tuple2!22236) (t!42945 List!29389)) )
))
(declare-datatypes ((ListLongMap!19893 0))(
  ( (ListLongMap!19894 (toList!9962 List!29389)) )
))
(declare-fun contains!8010 (ListLongMap!19893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4905 (array!85645 array!85643 (_ BitVec 32) (_ BitVec 32) V!50921 V!50921 (_ BitVec 32) Int) ListLongMap!19893)

(assert (=> b!1292186 (= res!858587 (contains!8010 (getCurrentListMap!4905 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292187 () Bool)

(declare-fun res!858594 () Bool)

(assert (=> b!1292187 (=> (not res!858594) (not e!737569))))

(assert (=> b!1292187 (= res!858594 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41876 _keys!1741))))))

(declare-fun b!1292188 () Bool)

(declare-fun res!858588 () Bool)

(assert (=> b!1292188 (=> (not res!858588) (not e!737569))))

(declare-datatypes ((List!29390 0))(
  ( (Nil!29387) (Cons!29386 (h!30595 (_ BitVec 64)) (t!42946 List!29390)) )
))
(declare-fun arrayNoDuplicates!0 (array!85645 (_ BitVec 32) List!29390) Bool)

(assert (=> b!1292188 (= res!858588 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29387))))

(declare-fun b!1292189 () Bool)

(declare-fun res!858590 () Bool)

(assert (=> b!1292189 (=> (not res!858590) (not e!737569))))

(assert (=> b!1292189 (= res!858590 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41876 _keys!1741))))))

(declare-fun b!1292190 () Bool)

(declare-fun res!858592 () Bool)

(assert (=> b!1292190 (=> (not res!858592) (not e!737569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292190 (= res!858592 (not (validKeyInArray!0 (select (arr!41324 _keys!1741) from!2144))))))

(declare-fun b!1292191 () Bool)

(declare-fun e!737568 () Bool)

(declare-fun tp_is_empty!34363 () Bool)

(assert (=> b!1292191 (= e!737568 tp_is_empty!34363)))

(declare-fun mapIsEmpty!53105 () Bool)

(assert (=> mapIsEmpty!53105 mapRes!53105))

(declare-fun b!1292192 () Bool)

(declare-fun res!858591 () Bool)

(assert (=> b!1292192 (=> (not res!858591) (not e!737569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85645 (_ BitVec 32)) Bool)

(assert (=> b!1292192 (= res!858591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292193 () Bool)

(declare-fun e!737571 () Bool)

(assert (=> b!1292193 (= e!737571 (and e!737568 mapRes!53105))))

(declare-fun condMapEmpty!53105 () Bool)

(declare-fun mapDefault!53105 () ValueCell!16283)

(assert (=> b!1292193 (= condMapEmpty!53105 (= (arr!41323 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16283)) mapDefault!53105)))))

(declare-fun res!858593 () Bool)

(assert (=> start!109234 (=> (not res!858593) (not e!737569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109234 (= res!858593 (validMask!0 mask!2175))))

(assert (=> start!109234 e!737569))

(assert (=> start!109234 tp_is_empty!34363))

(assert (=> start!109234 true))

(declare-fun array_inv!31469 (array!85643) Bool)

(assert (=> start!109234 (and (array_inv!31469 _values!1445) e!737571)))

(declare-fun array_inv!31470 (array!85645) Bool)

(assert (=> start!109234 (array_inv!31470 _keys!1741)))

(assert (=> start!109234 tp!101288))

(declare-fun b!1292194 () Bool)

(assert (=> b!1292194 (= e!737570 tp_is_empty!34363)))

(declare-fun b!1292195 () Bool)

(assert (=> b!1292195 (= e!737569 (not true))))

(assert (=> b!1292195 (not (contains!8010 (ListLongMap!19894 Nil!29386) k0!1205))))

(declare-datatypes ((Unit!42610 0))(
  ( (Unit!42611) )
))
(declare-fun lt!579142 () Unit!42610)

(declare-fun emptyContainsNothing!102 ((_ BitVec 64)) Unit!42610)

(assert (=> b!1292195 (= lt!579142 (emptyContainsNothing!102 k0!1205))))

(declare-fun b!1292196 () Bool)

(declare-fun res!858589 () Bool)

(assert (=> b!1292196 (=> (not res!858589) (not e!737569))))

(assert (=> b!1292196 (= res!858589 (and (= (size!41875 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41876 _keys!1741) (size!41875 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109234 res!858593) b!1292196))

(assert (= (and b!1292196 res!858589) b!1292192))

(assert (= (and b!1292192 res!858591) b!1292188))

(assert (= (and b!1292188 res!858588) b!1292187))

(assert (= (and b!1292187 res!858594) b!1292186))

(assert (= (and b!1292186 res!858587) b!1292189))

(assert (= (and b!1292189 res!858590) b!1292190))

(assert (= (and b!1292190 res!858592) b!1292195))

(assert (= (and b!1292193 condMapEmpty!53105) mapIsEmpty!53105))

(assert (= (and b!1292193 (not condMapEmpty!53105)) mapNonEmpty!53105))

(get-info :version)

(assert (= (and mapNonEmpty!53105 ((_ is ValueCellFull!16283) mapValue!53105)) b!1292194))

(assert (= (and b!1292193 ((_ is ValueCellFull!16283) mapDefault!53105)) b!1292191))

(assert (= start!109234 b!1292193))

(declare-fun m!1184355 () Bool)

(assert (=> mapNonEmpty!53105 m!1184355))

(declare-fun m!1184357 () Bool)

(assert (=> b!1292192 m!1184357))

(declare-fun m!1184359 () Bool)

(assert (=> b!1292190 m!1184359))

(assert (=> b!1292190 m!1184359))

(declare-fun m!1184361 () Bool)

(assert (=> b!1292190 m!1184361))

(declare-fun m!1184363 () Bool)

(assert (=> b!1292195 m!1184363))

(declare-fun m!1184365 () Bool)

(assert (=> b!1292195 m!1184365))

(declare-fun m!1184367 () Bool)

(assert (=> b!1292188 m!1184367))

(declare-fun m!1184369 () Bool)

(assert (=> b!1292186 m!1184369))

(assert (=> b!1292186 m!1184369))

(declare-fun m!1184371 () Bool)

(assert (=> b!1292186 m!1184371))

(declare-fun m!1184373 () Bool)

(assert (=> start!109234 m!1184373))

(declare-fun m!1184375 () Bool)

(assert (=> start!109234 m!1184375))

(declare-fun m!1184377 () Bool)

(assert (=> start!109234 m!1184377))

(check-sat (not mapNonEmpty!53105) (not b!1292188) tp_is_empty!34363 (not b!1292192) (not start!109234) (not b!1292190) (not b_next!28723) b_and!46795 (not b!1292195) (not b!1292186))
(check-sat b_and!46795 (not b_next!28723))

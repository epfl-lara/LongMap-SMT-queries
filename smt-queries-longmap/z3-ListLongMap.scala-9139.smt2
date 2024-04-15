; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109618 () Bool)

(assert start!109618)

(declare-fun b_free!29107 () Bool)

(declare-fun b_next!29107 () Bool)

(assert (=> start!109618 (= b_free!29107 (not b_next!29107))))

(declare-fun tp!102440 () Bool)

(declare-fun b_and!47179 () Bool)

(assert (=> start!109618 (= tp!102440 b_and!47179)))

(declare-fun b!1298403 () Bool)

(declare-fun e!740745 () Bool)

(declare-fun tp_is_empty!34747 () Bool)

(assert (=> b!1298403 (= e!740745 tp_is_empty!34747)))

(declare-fun mapNonEmpty!53681 () Bool)

(declare-fun mapRes!53681 () Bool)

(declare-fun tp!102441 () Bool)

(assert (=> mapNonEmpty!53681 (= mapRes!53681 (and tp!102441 e!740745))))

(declare-datatypes ((V!51433 0))(
  ( (V!51434 (val!17448 Int)) )
))
(declare-datatypes ((ValueCell!16475 0))(
  ( (ValueCellFull!16475 (v!20050 V!51433)) (EmptyCell!16475) )
))
(declare-fun mapValue!53681 () ValueCell!16475)

(declare-fun mapKey!53681 () (_ BitVec 32))

(declare-fun mapRest!53681 () (Array (_ BitVec 32) ValueCell!16475))

(declare-datatypes ((array!86395 0))(
  ( (array!86396 (arr!41699 (Array (_ BitVec 32) ValueCell!16475)) (size!42251 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86395)

(assert (=> mapNonEmpty!53681 (= (arr!41699 _values!1445) (store mapRest!53681 mapKey!53681 mapValue!53681))))

(declare-fun res!862917 () Bool)

(declare-fun e!740748 () Bool)

(assert (=> start!109618 (=> (not res!862917) (not e!740748))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109618 (= res!862917 (validMask!0 mask!2175))))

(assert (=> start!109618 e!740748))

(assert (=> start!109618 tp_is_empty!34747))

(assert (=> start!109618 true))

(declare-fun e!740747 () Bool)

(declare-fun array_inv!31717 (array!86395) Bool)

(assert (=> start!109618 (and (array_inv!31717 _values!1445) e!740747)))

(declare-datatypes ((array!86397 0))(
  ( (array!86398 (arr!41700 (Array (_ BitVec 32) (_ BitVec 64))) (size!42252 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86397)

(declare-fun array_inv!31718 (array!86397) Bool)

(assert (=> start!109618 (array_inv!31718 _keys!1741)))

(assert (=> start!109618 tp!102440))

(declare-fun b!1298404 () Bool)

(declare-fun res!862920 () Bool)

(assert (=> b!1298404 (=> (not res!862920) (not e!740748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86397 (_ BitVec 32)) Bool)

(assert (=> b!1298404 (= res!862920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298405 () Bool)

(declare-fun res!862914 () Bool)

(assert (=> b!1298405 (=> (not res!862914) (not e!740748))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1298405 (= res!862914 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42252 _keys!1741)) (not (= (select (arr!41700 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298406 () Bool)

(declare-fun e!740744 () Bool)

(assert (=> b!1298406 (= e!740747 (and e!740744 mapRes!53681))))

(declare-fun condMapEmpty!53681 () Bool)

(declare-fun mapDefault!53681 () ValueCell!16475)

(assert (=> b!1298406 (= condMapEmpty!53681 (= (arr!41699 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16475)) mapDefault!53681)))))

(declare-fun b!1298407 () Bool)

(assert (=> b!1298407 (= e!740744 tp_is_empty!34747)))

(declare-fun mapIsEmpty!53681 () Bool)

(assert (=> mapIsEmpty!53681 mapRes!53681))

(declare-fun b!1298408 () Bool)

(declare-fun res!862916 () Bool)

(assert (=> b!1298408 (=> (not res!862916) (not e!740748))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298408 (= res!862916 (and (= (size!42251 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42252 _keys!1741) (size!42251 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298409 () Bool)

(declare-fun res!862918 () Bool)

(assert (=> b!1298409 (=> (not res!862918) (not e!740748))))

(declare-datatypes ((List!29666 0))(
  ( (Nil!29663) (Cons!29662 (h!30871 (_ BitVec 64)) (t!43222 List!29666)) )
))
(declare-fun arrayNoDuplicates!0 (array!86397 (_ BitVec 32) List!29666) Bool)

(assert (=> b!1298409 (= res!862918 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29663))))

(declare-fun b!1298410 () Bool)

(declare-fun res!862919 () Bool)

(assert (=> b!1298410 (=> (not res!862919) (not e!740748))))

(declare-fun zeroValue!1387 () V!51433)

(declare-fun minValue!1387 () V!51433)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22542 0))(
  ( (tuple2!22543 (_1!11282 (_ BitVec 64)) (_2!11282 V!51433)) )
))
(declare-datatypes ((List!29667 0))(
  ( (Nil!29664) (Cons!29663 (h!30872 tuple2!22542) (t!43223 List!29667)) )
))
(declare-datatypes ((ListLongMap!20199 0))(
  ( (ListLongMap!20200 (toList!10115 List!29667)) )
))
(declare-fun contains!8163 (ListLongMap!20199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5031 (array!86397 array!86395 (_ BitVec 32) (_ BitVec 32) V!51433 V!51433 (_ BitVec 32) Int) ListLongMap!20199)

(assert (=> b!1298410 (= res!862919 (contains!8163 (getCurrentListMap!5031 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298411 () Bool)

(declare-fun res!862915 () Bool)

(assert (=> b!1298411 (=> (not res!862915) (not e!740748))))

(assert (=> b!1298411 (= res!862915 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42252 _keys!1741))))))

(declare-fun b!1298412 () Bool)

(assert (=> b!1298412 (= e!740748 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000)))))

(assert (=> b!1298412 (contains!8163 (getCurrentListMap!5031 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42834 0))(
  ( (Unit!42835) )
))
(declare-fun lt!580528 () Unit!42834)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!42 (array!86397 array!86395 (_ BitVec 32) (_ BitVec 32) V!51433 V!51433 (_ BitVec 64) (_ BitVec 32) Int) Unit!42834)

(assert (=> b!1298412 (= lt!580528 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!42 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (= (and start!109618 res!862917) b!1298408))

(assert (= (and b!1298408 res!862916) b!1298404))

(assert (= (and b!1298404 res!862920) b!1298409))

(assert (= (and b!1298409 res!862918) b!1298411))

(assert (= (and b!1298411 res!862915) b!1298410))

(assert (= (and b!1298410 res!862919) b!1298405))

(assert (= (and b!1298405 res!862914) b!1298412))

(assert (= (and b!1298406 condMapEmpty!53681) mapIsEmpty!53681))

(assert (= (and b!1298406 (not condMapEmpty!53681)) mapNonEmpty!53681))

(get-info :version)

(assert (= (and mapNonEmpty!53681 ((_ is ValueCellFull!16475) mapValue!53681)) b!1298403))

(assert (= (and b!1298406 ((_ is ValueCellFull!16475) mapDefault!53681)) b!1298407))

(assert (= start!109618 b!1298406))

(declare-fun m!1189311 () Bool)

(assert (=> b!1298409 m!1189311))

(declare-fun m!1189313 () Bool)

(assert (=> mapNonEmpty!53681 m!1189313))

(declare-fun m!1189315 () Bool)

(assert (=> b!1298404 m!1189315))

(declare-fun m!1189317 () Bool)

(assert (=> b!1298412 m!1189317))

(assert (=> b!1298412 m!1189317))

(declare-fun m!1189319 () Bool)

(assert (=> b!1298412 m!1189319))

(declare-fun m!1189321 () Bool)

(assert (=> b!1298412 m!1189321))

(declare-fun m!1189323 () Bool)

(assert (=> b!1298410 m!1189323))

(assert (=> b!1298410 m!1189323))

(declare-fun m!1189325 () Bool)

(assert (=> b!1298410 m!1189325))

(declare-fun m!1189327 () Bool)

(assert (=> b!1298405 m!1189327))

(declare-fun m!1189329 () Bool)

(assert (=> start!109618 m!1189329))

(declare-fun m!1189331 () Bool)

(assert (=> start!109618 m!1189331))

(declare-fun m!1189333 () Bool)

(assert (=> start!109618 m!1189333))

(check-sat b_and!47179 (not b!1298409) (not mapNonEmpty!53681) (not b_next!29107) (not b!1298410) tp_is_empty!34747 (not b!1298412) (not start!109618) (not b!1298404))
(check-sat b_and!47179 (not b_next!29107))

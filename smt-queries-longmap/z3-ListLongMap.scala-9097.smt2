; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109368 () Bool)

(assert start!109368)

(declare-fun b_free!28857 () Bool)

(declare-fun b_next!28857 () Bool)

(assert (=> start!109368 (= b_free!28857 (not b_next!28857))))

(declare-fun tp!101689 () Bool)

(declare-fun b_and!46947 () Bool)

(assert (=> start!109368 (= tp!101689 b_and!46947)))

(declare-fun b!1294569 () Bool)

(declare-fun res!860333 () Bool)

(declare-fun e!738710 () Bool)

(assert (=> b!1294569 (=> (not res!860333) (not e!738710))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51099 0))(
  ( (V!51100 (val!17323 Int)) )
))
(declare-datatypes ((ValueCell!16350 0))(
  ( (ValueCellFull!16350 (v!19926 V!51099)) (EmptyCell!16350) )
))
(declare-datatypes ((array!86016 0))(
  ( (array!86017 (arr!41509 (Array (_ BitVec 32) ValueCell!16350)) (size!42059 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86016)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86018 0))(
  ( (array!86019 (arr!41510 (Array (_ BitVec 32) (_ BitVec 64))) (size!42060 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86018)

(assert (=> b!1294569 (= res!860333 (and (= (size!42059 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42060 _keys!1741) (size!42059 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294570 () Bool)

(declare-fun e!738712 () Bool)

(declare-fun tp_is_empty!34497 () Bool)

(assert (=> b!1294570 (= e!738712 tp_is_empty!34497)))

(declare-fun res!860336 () Bool)

(assert (=> start!109368 (=> (not res!860336) (not e!738710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109368 (= res!860336 (validMask!0 mask!2175))))

(assert (=> start!109368 e!738710))

(assert (=> start!109368 tp_is_empty!34497))

(assert (=> start!109368 true))

(declare-fun e!738709 () Bool)

(declare-fun array_inv!31435 (array!86016) Bool)

(assert (=> start!109368 (and (array_inv!31435 _values!1445) e!738709)))

(declare-fun array_inv!31436 (array!86018) Bool)

(assert (=> start!109368 (array_inv!31436 _keys!1741)))

(assert (=> start!109368 tp!101689))

(declare-fun b!1294571 () Bool)

(declare-fun mapRes!53306 () Bool)

(assert (=> b!1294571 (= e!738709 (and e!738712 mapRes!53306))))

(declare-fun condMapEmpty!53306 () Bool)

(declare-fun mapDefault!53306 () ValueCell!16350)

(assert (=> b!1294571 (= condMapEmpty!53306 (= (arr!41509 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16350)) mapDefault!53306)))))

(declare-fun b!1294572 () Bool)

(declare-fun res!860335 () Bool)

(assert (=> b!1294572 (=> (not res!860335) (not e!738710))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1294572 (= res!860335 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42060 _keys!1741))))))

(declare-fun mapIsEmpty!53306 () Bool)

(assert (=> mapIsEmpty!53306 mapRes!53306))

(declare-fun b!1294573 () Bool)

(declare-fun e!738711 () Bool)

(assert (=> b!1294573 (= e!738711 tp_is_empty!34497)))

(declare-fun b!1294574 () Bool)

(declare-fun res!860330 () Bool)

(assert (=> b!1294574 (=> (not res!860330) (not e!738710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294574 (= res!860330 (not (validKeyInArray!0 (select (arr!41510 _keys!1741) from!2144))))))

(declare-fun b!1294575 () Bool)

(declare-fun res!860334 () Bool)

(assert (=> b!1294575 (=> (not res!860334) (not e!738710))))

(declare-fun minValue!1387 () V!51099)

(declare-fun zeroValue!1387 () V!51099)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22302 0))(
  ( (tuple2!22303 (_1!11162 (_ BitVec 64)) (_2!11162 V!51099)) )
))
(declare-datatypes ((List!29445 0))(
  ( (Nil!29442) (Cons!29441 (h!30650 tuple2!22302) (t!43009 List!29445)) )
))
(declare-datatypes ((ListLongMap!19959 0))(
  ( (ListLongMap!19960 (toList!9995 List!29445)) )
))
(declare-fun contains!8113 (ListLongMap!19959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5032 (array!86018 array!86016 (_ BitVec 32) (_ BitVec 32) V!51099 V!51099 (_ BitVec 32) Int) ListLongMap!19959)

(assert (=> b!1294575 (= res!860334 (contains!8113 (getCurrentListMap!5032 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294576 () Bool)

(declare-fun res!860332 () Bool)

(assert (=> b!1294576 (=> (not res!860332) (not e!738710))))

(assert (=> b!1294576 (= res!860332 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42060 _keys!1741))))))

(declare-fun mapNonEmpty!53306 () Bool)

(declare-fun tp!101690 () Bool)

(assert (=> mapNonEmpty!53306 (= mapRes!53306 (and tp!101690 e!738711))))

(declare-fun mapRest!53306 () (Array (_ BitVec 32) ValueCell!16350))

(declare-fun mapValue!53306 () ValueCell!16350)

(declare-fun mapKey!53306 () (_ BitVec 32))

(assert (=> mapNonEmpty!53306 (= (arr!41509 _values!1445) (store mapRest!53306 mapKey!53306 mapValue!53306))))

(declare-fun b!1294577 () Bool)

(declare-fun res!860337 () Bool)

(assert (=> b!1294577 (=> (not res!860337) (not e!738710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86018 (_ BitVec 32)) Bool)

(assert (=> b!1294577 (= res!860337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294578 () Bool)

(assert (=> b!1294578 (= e!738710 (not true))))

(assert (=> b!1294578 (not (contains!8113 (ListLongMap!19960 Nil!29442) k0!1205))))

(declare-datatypes ((Unit!42876 0))(
  ( (Unit!42877) )
))
(declare-fun lt!579728 () Unit!42876)

(declare-fun emptyContainsNothing!159 ((_ BitVec 64)) Unit!42876)

(assert (=> b!1294578 (= lt!579728 (emptyContainsNothing!159 k0!1205))))

(declare-fun b!1294579 () Bool)

(declare-fun res!860331 () Bool)

(assert (=> b!1294579 (=> (not res!860331) (not e!738710))))

(declare-datatypes ((List!29446 0))(
  ( (Nil!29443) (Cons!29442 (h!30651 (_ BitVec 64)) (t!43010 List!29446)) )
))
(declare-fun arrayNoDuplicates!0 (array!86018 (_ BitVec 32) List!29446) Bool)

(assert (=> b!1294579 (= res!860331 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29443))))

(assert (= (and start!109368 res!860336) b!1294569))

(assert (= (and b!1294569 res!860333) b!1294577))

(assert (= (and b!1294577 res!860337) b!1294579))

(assert (= (and b!1294579 res!860331) b!1294572))

(assert (= (and b!1294572 res!860335) b!1294575))

(assert (= (and b!1294575 res!860334) b!1294576))

(assert (= (and b!1294576 res!860332) b!1294574))

(assert (= (and b!1294574 res!860330) b!1294578))

(assert (= (and b!1294571 condMapEmpty!53306) mapIsEmpty!53306))

(assert (= (and b!1294571 (not condMapEmpty!53306)) mapNonEmpty!53306))

(get-info :version)

(assert (= (and mapNonEmpty!53306 ((_ is ValueCellFull!16350) mapValue!53306)) b!1294573))

(assert (= (and b!1294571 ((_ is ValueCellFull!16350) mapDefault!53306)) b!1294570))

(assert (= start!109368 b!1294571))

(declare-fun m!1186739 () Bool)

(assert (=> b!1294575 m!1186739))

(assert (=> b!1294575 m!1186739))

(declare-fun m!1186741 () Bool)

(assert (=> b!1294575 m!1186741))

(declare-fun m!1186743 () Bool)

(assert (=> b!1294577 m!1186743))

(declare-fun m!1186745 () Bool)

(assert (=> b!1294579 m!1186745))

(declare-fun m!1186747 () Bool)

(assert (=> b!1294578 m!1186747))

(declare-fun m!1186749 () Bool)

(assert (=> b!1294578 m!1186749))

(declare-fun m!1186751 () Bool)

(assert (=> b!1294574 m!1186751))

(assert (=> b!1294574 m!1186751))

(declare-fun m!1186753 () Bool)

(assert (=> b!1294574 m!1186753))

(declare-fun m!1186755 () Bool)

(assert (=> start!109368 m!1186755))

(declare-fun m!1186757 () Bool)

(assert (=> start!109368 m!1186757))

(declare-fun m!1186759 () Bool)

(assert (=> start!109368 m!1186759))

(declare-fun m!1186761 () Bool)

(assert (=> mapNonEmpty!53306 m!1186761))

(check-sat (not b!1294579) (not b!1294578) tp_is_empty!34497 (not b!1294577) (not b_next!28857) b_and!46947 (not mapNonEmpty!53306) (not b!1294574) (not b!1294575) (not start!109368))
(check-sat b_and!46947 (not b_next!28857))

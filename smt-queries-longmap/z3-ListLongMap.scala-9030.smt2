; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109188 () Bool)

(assert start!109188)

(declare-fun b_free!28453 () Bool)

(declare-fun b_next!28453 () Bool)

(assert (=> start!109188 (= b_free!28453 (not b_next!28453))))

(declare-fun tp!100478 () Bool)

(declare-fun b_and!46545 () Bool)

(assert (=> start!109188 (= tp!100478 b_and!46545)))

(declare-fun b!1288803 () Bool)

(declare-fun e!736121 () Bool)

(declare-fun e!736122 () Bool)

(declare-fun mapRes!52700 () Bool)

(assert (=> b!1288803 (= e!736121 (and e!736122 mapRes!52700))))

(declare-fun condMapEmpty!52700 () Bool)

(declare-datatypes ((V!50561 0))(
  ( (V!50562 (val!17121 Int)) )
))
(declare-datatypes ((ValueCell!16148 0))(
  ( (ValueCellFull!16148 (v!19719 V!50561)) (EmptyCell!16148) )
))
(declare-datatypes ((array!85271 0))(
  ( (array!85272 (arr!41132 (Array (_ BitVec 32) ValueCell!16148)) (size!41683 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85271)

(declare-fun mapDefault!52700 () ValueCell!16148)

(assert (=> b!1288803 (= condMapEmpty!52700 (= (arr!41132 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16148)) mapDefault!52700)))))

(declare-fun mapIsEmpty!52700 () Bool)

(assert (=> mapIsEmpty!52700 mapRes!52700))

(declare-fun b!1288805 () Bool)

(declare-fun res!855599 () Bool)

(declare-fun e!736123 () Bool)

(assert (=> b!1288805 (=> (not res!855599) (not e!736123))))

(declare-datatypes ((array!85273 0))(
  ( (array!85274 (arr!41133 (Array (_ BitVec 32) (_ BitVec 64))) (size!41684 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85273)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288805 (= res!855599 (not (validKeyInArray!0 (select (arr!41133 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52700 () Bool)

(declare-fun tp!100477 () Bool)

(declare-fun e!736125 () Bool)

(assert (=> mapNonEmpty!52700 (= mapRes!52700 (and tp!100477 e!736125))))

(declare-fun mapValue!52700 () ValueCell!16148)

(declare-fun mapRest!52700 () (Array (_ BitVec 32) ValueCell!16148))

(declare-fun mapKey!52700 () (_ BitVec 32))

(assert (=> mapNonEmpty!52700 (= (arr!41132 _values!1445) (store mapRest!52700 mapKey!52700 mapValue!52700))))

(declare-fun b!1288806 () Bool)

(declare-fun res!855601 () Bool)

(assert (=> b!1288806 (=> (not res!855601) (not e!736123))))

(declare-datatypes ((List!29177 0))(
  ( (Nil!29174) (Cons!29173 (h!30391 (_ BitVec 64)) (t!42733 List!29177)) )
))
(declare-fun arrayNoDuplicates!0 (array!85273 (_ BitVec 32) List!29177) Bool)

(assert (=> b!1288806 (= res!855601 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29174))))

(declare-fun b!1288807 () Bool)

(assert (=> b!1288807 (= e!736123 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21986 0))(
  ( (tuple2!21987 (_1!11004 (_ BitVec 64)) (_2!11004 V!50561)) )
))
(declare-datatypes ((List!29178 0))(
  ( (Nil!29175) (Cons!29174 (h!30392 tuple2!21986) (t!42734 List!29178)) )
))
(declare-datatypes ((ListLongMap!19651 0))(
  ( (ListLongMap!19652 (toList!9841 List!29178)) )
))
(declare-fun contains!7972 (ListLongMap!19651 (_ BitVec 64)) Bool)

(assert (=> b!1288807 (not (contains!7972 (ListLongMap!19652 Nil!29175) k0!1205))))

(declare-datatypes ((Unit!42537 0))(
  ( (Unit!42538) )
))
(declare-fun lt!578355 () Unit!42537)

(declare-fun emptyContainsNothing!22 ((_ BitVec 64)) Unit!42537)

(assert (=> b!1288807 (= lt!578355 (emptyContainsNothing!22 k0!1205))))

(declare-fun b!1288808 () Bool)

(declare-fun tp_is_empty!34093 () Bool)

(assert (=> b!1288808 (= e!736125 tp_is_empty!34093)))

(declare-fun b!1288809 () Bool)

(declare-fun res!855602 () Bool)

(assert (=> b!1288809 (=> (not res!855602) (not e!736123))))

(assert (=> b!1288809 (= res!855602 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41684 _keys!1741))))))

(declare-fun b!1288810 () Bool)

(declare-fun res!855597 () Bool)

(assert (=> b!1288810 (=> (not res!855597) (not e!736123))))

(declare-fun minValue!1387 () V!50561)

(declare-fun zeroValue!1387 () V!50561)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4895 (array!85273 array!85271 (_ BitVec 32) (_ BitVec 32) V!50561 V!50561 (_ BitVec 32) Int) ListLongMap!19651)

(assert (=> b!1288810 (= res!855597 (contains!7972 (getCurrentListMap!4895 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288811 () Bool)

(declare-fun res!855604 () Bool)

(assert (=> b!1288811 (=> (not res!855604) (not e!736123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85273 (_ BitVec 32)) Bool)

(assert (=> b!1288811 (= res!855604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288804 () Bool)

(declare-fun res!855603 () Bool)

(assert (=> b!1288804 (=> (not res!855603) (not e!736123))))

(assert (=> b!1288804 (= res!855603 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41684 _keys!1741))))))

(declare-fun res!855600 () Bool)

(assert (=> start!109188 (=> (not res!855600) (not e!736123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109188 (= res!855600 (validMask!0 mask!2175))))

(assert (=> start!109188 e!736123))

(assert (=> start!109188 tp_is_empty!34093))

(assert (=> start!109188 true))

(declare-fun array_inv!31395 (array!85271) Bool)

(assert (=> start!109188 (and (array_inv!31395 _values!1445) e!736121)))

(declare-fun array_inv!31396 (array!85273) Bool)

(assert (=> start!109188 (array_inv!31396 _keys!1741)))

(assert (=> start!109188 tp!100478))

(declare-fun b!1288812 () Bool)

(assert (=> b!1288812 (= e!736122 tp_is_empty!34093)))

(declare-fun b!1288813 () Bool)

(declare-fun res!855598 () Bool)

(assert (=> b!1288813 (=> (not res!855598) (not e!736123))))

(assert (=> b!1288813 (= res!855598 (and (= (size!41683 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41684 _keys!1741) (size!41683 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109188 res!855600) b!1288813))

(assert (= (and b!1288813 res!855598) b!1288811))

(assert (= (and b!1288811 res!855604) b!1288806))

(assert (= (and b!1288806 res!855601) b!1288804))

(assert (= (and b!1288804 res!855603) b!1288810))

(assert (= (and b!1288810 res!855597) b!1288809))

(assert (= (and b!1288809 res!855602) b!1288805))

(assert (= (and b!1288805 res!855599) b!1288807))

(assert (= (and b!1288803 condMapEmpty!52700) mapIsEmpty!52700))

(assert (= (and b!1288803 (not condMapEmpty!52700)) mapNonEmpty!52700))

(get-info :version)

(assert (= (and mapNonEmpty!52700 ((_ is ValueCellFull!16148) mapValue!52700)) b!1288808))

(assert (= (and b!1288803 ((_ is ValueCellFull!16148) mapDefault!52700)) b!1288812))

(assert (= start!109188 b!1288803))

(declare-fun m!1181961 () Bool)

(assert (=> b!1288810 m!1181961))

(assert (=> b!1288810 m!1181961))

(declare-fun m!1181963 () Bool)

(assert (=> b!1288810 m!1181963))

(declare-fun m!1181965 () Bool)

(assert (=> start!109188 m!1181965))

(declare-fun m!1181967 () Bool)

(assert (=> start!109188 m!1181967))

(declare-fun m!1181969 () Bool)

(assert (=> start!109188 m!1181969))

(declare-fun m!1181971 () Bool)

(assert (=> b!1288806 m!1181971))

(declare-fun m!1181973 () Bool)

(assert (=> mapNonEmpty!52700 m!1181973))

(declare-fun m!1181975 () Bool)

(assert (=> b!1288807 m!1181975))

(declare-fun m!1181977 () Bool)

(assert (=> b!1288807 m!1181977))

(declare-fun m!1181979 () Bool)

(assert (=> b!1288811 m!1181979))

(declare-fun m!1181981 () Bool)

(assert (=> b!1288805 m!1181981))

(assert (=> b!1288805 m!1181981))

(declare-fun m!1181983 () Bool)

(assert (=> b!1288805 m!1181983))

(check-sat (not start!109188) (not b_next!28453) (not mapNonEmpty!52700) (not b!1288807) (not b!1288811) (not b!1288806) (not b!1288805) tp_is_empty!34093 (not b!1288810) b_and!46545)
(check-sat b_and!46545 (not b_next!28453))

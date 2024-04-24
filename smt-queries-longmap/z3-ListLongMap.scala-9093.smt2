; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109566 () Bool)

(assert start!109566)

(declare-fun b_free!28831 () Bool)

(declare-fun b_next!28831 () Bool)

(assert (=> start!109566 (= b_free!28831 (not b_next!28831))))

(declare-fun tp!101612 () Bool)

(declare-fun b_and!46923 () Bool)

(assert (=> start!109566 (= tp!101612 b_and!46923)))

(declare-fun b!1295445 () Bool)

(declare-fun res!860543 () Bool)

(declare-fun e!739364 () Bool)

(assert (=> b!1295445 (=> (not res!860543) (not e!739364))))

(declare-datatypes ((array!85997 0))(
  ( (array!85998 (arr!41495 (Array (_ BitVec 32) (_ BitVec 64))) (size!42046 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85997)

(declare-datatypes ((List!29455 0))(
  ( (Nil!29452) (Cons!29451 (h!30669 (_ BitVec 64)) (t!43011 List!29455)) )
))
(declare-fun arrayNoDuplicates!0 (array!85997 (_ BitVec 32) List!29455) Bool)

(assert (=> b!1295445 (= res!860543 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29452))))

(declare-fun res!860538 () Bool)

(assert (=> start!109566 (=> (not res!860538) (not e!739364))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109566 (= res!860538 (validMask!0 mask!2175))))

(assert (=> start!109566 e!739364))

(declare-fun tp_is_empty!34471 () Bool)

(assert (=> start!109566 tp_is_empty!34471))

(assert (=> start!109566 true))

(declare-datatypes ((V!51065 0))(
  ( (V!51066 (val!17310 Int)) )
))
(declare-datatypes ((ValueCell!16337 0))(
  ( (ValueCellFull!16337 (v!19908 V!51065)) (EmptyCell!16337) )
))
(declare-datatypes ((array!85999 0))(
  ( (array!86000 (arr!41496 (Array (_ BitVec 32) ValueCell!16337)) (size!42047 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85999)

(declare-fun e!739361 () Bool)

(declare-fun array_inv!31661 (array!85999) Bool)

(assert (=> start!109566 (and (array_inv!31661 _values!1445) e!739361)))

(declare-fun array_inv!31662 (array!85997) Bool)

(assert (=> start!109566 (array_inv!31662 _keys!1741)))

(assert (=> start!109566 tp!101612))

(declare-fun b!1295446 () Bool)

(declare-fun e!739365 () Bool)

(assert (=> b!1295446 (= e!739365 tp_is_empty!34471)))

(declare-fun mapIsEmpty!53267 () Bool)

(declare-fun mapRes!53267 () Bool)

(assert (=> mapIsEmpty!53267 mapRes!53267))

(declare-fun b!1295447 () Bool)

(assert (=> b!1295447 (= e!739361 (and e!739365 mapRes!53267))))

(declare-fun condMapEmpty!53267 () Bool)

(declare-fun mapDefault!53267 () ValueCell!16337)

(assert (=> b!1295447 (= condMapEmpty!53267 (= (arr!41496 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16337)) mapDefault!53267)))))

(declare-fun b!1295448 () Bool)

(assert (=> b!1295448 (= e!739364 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22288 0))(
  ( (tuple2!22289 (_1!11155 (_ BitVec 64)) (_2!11155 V!51065)) )
))
(declare-datatypes ((List!29456 0))(
  ( (Nil!29453) (Cons!29452 (h!30670 tuple2!22288) (t!43012 List!29456)) )
))
(declare-datatypes ((ListLongMap!19953 0))(
  ( (ListLongMap!19954 (toList!9992 List!29456)) )
))
(declare-fun contains!8123 (ListLongMap!19953 (_ BitVec 64)) Bool)

(assert (=> b!1295448 (not (contains!8123 (ListLongMap!19954 Nil!29453) k0!1205))))

(declare-datatypes ((Unit!42817 0))(
  ( (Unit!42818) )
))
(declare-fun lt!580173 () Unit!42817)

(declare-fun emptyContainsNothing!151 ((_ BitVec 64)) Unit!42817)

(assert (=> b!1295448 (= lt!580173 (emptyContainsNothing!151 k0!1205))))

(declare-fun b!1295449 () Bool)

(declare-fun e!739363 () Bool)

(assert (=> b!1295449 (= e!739363 tp_is_empty!34471)))

(declare-fun b!1295450 () Bool)

(declare-fun res!860539 () Bool)

(assert (=> b!1295450 (=> (not res!860539) (not e!739364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85997 (_ BitVec 32)) Bool)

(assert (=> b!1295450 (= res!860539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295451 () Bool)

(declare-fun res!860545 () Bool)

(assert (=> b!1295451 (=> (not res!860545) (not e!739364))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295451 (= res!860545 (and (= (size!42047 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42046 _keys!1741) (size!42047 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295452 () Bool)

(declare-fun res!860544 () Bool)

(assert (=> b!1295452 (=> (not res!860544) (not e!739364))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1295452 (= res!860544 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42046 _keys!1741))))))

(declare-fun mapNonEmpty!53267 () Bool)

(declare-fun tp!101611 () Bool)

(assert (=> mapNonEmpty!53267 (= mapRes!53267 (and tp!101611 e!739363))))

(declare-fun mapKey!53267 () (_ BitVec 32))

(declare-fun mapRest!53267 () (Array (_ BitVec 32) ValueCell!16337))

(declare-fun mapValue!53267 () ValueCell!16337)

(assert (=> mapNonEmpty!53267 (= (arr!41496 _values!1445) (store mapRest!53267 mapKey!53267 mapValue!53267))))

(declare-fun b!1295453 () Bool)

(declare-fun res!860542 () Bool)

(assert (=> b!1295453 (=> (not res!860542) (not e!739364))))

(assert (=> b!1295453 (= res!860542 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42046 _keys!1741))))))

(declare-fun b!1295454 () Bool)

(declare-fun res!860541 () Bool)

(assert (=> b!1295454 (=> (not res!860541) (not e!739364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295454 (= res!860541 (not (validKeyInArray!0 (select (arr!41495 _keys!1741) from!2144))))))

(declare-fun b!1295455 () Bool)

(declare-fun res!860540 () Bool)

(assert (=> b!1295455 (=> (not res!860540) (not e!739364))))

(declare-fun minValue!1387 () V!51065)

(declare-fun zeroValue!1387 () V!51065)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5020 (array!85997 array!85999 (_ BitVec 32) (_ BitVec 32) V!51065 V!51065 (_ BitVec 32) Int) ListLongMap!19953)

(assert (=> b!1295455 (= res!860540 (contains!8123 (getCurrentListMap!5020 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109566 res!860538) b!1295451))

(assert (= (and b!1295451 res!860545) b!1295450))

(assert (= (and b!1295450 res!860539) b!1295445))

(assert (= (and b!1295445 res!860543) b!1295452))

(assert (= (and b!1295452 res!860544) b!1295455))

(assert (= (and b!1295455 res!860540) b!1295453))

(assert (= (and b!1295453 res!860542) b!1295454))

(assert (= (and b!1295454 res!860541) b!1295448))

(assert (= (and b!1295447 condMapEmpty!53267) mapIsEmpty!53267))

(assert (= (and b!1295447 (not condMapEmpty!53267)) mapNonEmpty!53267))

(get-info :version)

(assert (= (and mapNonEmpty!53267 ((_ is ValueCellFull!16337) mapValue!53267)) b!1295449))

(assert (= (and b!1295447 ((_ is ValueCellFull!16337) mapDefault!53267)) b!1295446))

(assert (= start!109566 b!1295447))

(declare-fun m!1188045 () Bool)

(assert (=> start!109566 m!1188045))

(declare-fun m!1188047 () Bool)

(assert (=> start!109566 m!1188047))

(declare-fun m!1188049 () Bool)

(assert (=> start!109566 m!1188049))

(declare-fun m!1188051 () Bool)

(assert (=> b!1295450 m!1188051))

(declare-fun m!1188053 () Bool)

(assert (=> mapNonEmpty!53267 m!1188053))

(declare-fun m!1188055 () Bool)

(assert (=> b!1295445 m!1188055))

(declare-fun m!1188057 () Bool)

(assert (=> b!1295448 m!1188057))

(declare-fun m!1188059 () Bool)

(assert (=> b!1295448 m!1188059))

(declare-fun m!1188061 () Bool)

(assert (=> b!1295454 m!1188061))

(assert (=> b!1295454 m!1188061))

(declare-fun m!1188063 () Bool)

(assert (=> b!1295454 m!1188063))

(declare-fun m!1188065 () Bool)

(assert (=> b!1295455 m!1188065))

(assert (=> b!1295455 m!1188065))

(declare-fun m!1188067 () Bool)

(assert (=> b!1295455 m!1188067))

(check-sat (not b_next!28831) (not mapNonEmpty!53267) b_and!46923 (not b!1295455) (not start!109566) (not b!1295445) (not b!1295450) (not b!1295448) (not b!1295454) tp_is_empty!34471)
(check-sat b_and!46923 (not b_next!28831))

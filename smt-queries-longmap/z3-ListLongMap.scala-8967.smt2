; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108530 () Bool)

(assert start!108530)

(declare-fun b_free!28077 () Bool)

(declare-fun b_next!28077 () Bool)

(assert (=> start!108530 (= b_free!28077 (not b_next!28077))))

(declare-fun tp!99341 () Bool)

(declare-fun b_and!46137 () Bool)

(assert (=> start!108530 (= tp!99341 b_and!46137)))

(declare-fun b!1281055 () Bool)

(declare-fun e!731941 () Bool)

(declare-fun tp_is_empty!33717 () Bool)

(assert (=> b!1281055 (= e!731941 tp_is_empty!33717)))

(declare-fun b!1281057 () Bool)

(declare-fun res!850967 () Bool)

(declare-fun e!731942 () Bool)

(assert (=> b!1281057 (=> (not res!850967) (not e!731942))))

(declare-datatypes ((array!84506 0))(
  ( (array!84507 (arr!40757 (Array (_ BitVec 32) (_ BitVec 64))) (size!41307 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84506)

(declare-datatypes ((List!28874 0))(
  ( (Nil!28871) (Cons!28870 (h!30079 (_ BitVec 64)) (t!42414 List!28874)) )
))
(declare-fun arrayNoDuplicates!0 (array!84506 (_ BitVec 32) List!28874) Bool)

(assert (=> b!1281057 (= res!850967 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28871))))

(declare-fun b!1281058 () Bool)

(declare-fun res!850970 () Bool)

(assert (=> b!1281058 (=> (not res!850970) (not e!731942))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50059 0))(
  ( (V!50060 (val!16933 Int)) )
))
(declare-datatypes ((ValueCell!15960 0))(
  ( (ValueCellFull!15960 (v!19533 V!50059)) (EmptyCell!15960) )
))
(declare-datatypes ((array!84508 0))(
  ( (array!84509 (arr!40758 (Array (_ BitVec 32) ValueCell!15960)) (size!41308 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84508)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281058 (= res!850970 (and (= (size!41308 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41307 _keys!1741) (size!41308 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52127 () Bool)

(declare-fun mapRes!52127 () Bool)

(declare-fun tp!99340 () Bool)

(assert (=> mapNonEmpty!52127 (= mapRes!52127 (and tp!99340 e!731941))))

(declare-fun mapValue!52127 () ValueCell!15960)

(declare-fun mapKey!52127 () (_ BitVec 32))

(declare-fun mapRest!52127 () (Array (_ BitVec 32) ValueCell!15960))

(assert (=> mapNonEmpty!52127 (= (arr!40758 _values!1445) (store mapRest!52127 mapKey!52127 mapValue!52127))))

(declare-fun b!1281059 () Bool)

(declare-fun e!731943 () Bool)

(declare-fun e!731944 () Bool)

(assert (=> b!1281059 (= e!731943 (and e!731944 mapRes!52127))))

(declare-fun condMapEmpty!52127 () Bool)

(declare-fun mapDefault!52127 () ValueCell!15960)

(assert (=> b!1281059 (= condMapEmpty!52127 (= (arr!40758 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15960)) mapDefault!52127)))))

(declare-fun b!1281060 () Bool)

(assert (=> b!1281060 (= e!731944 tp_is_empty!33717)))

(declare-fun b!1281061 () Bool)

(declare-fun res!850964 () Bool)

(assert (=> b!1281061 (=> (not res!850964) (not e!731942))))

(declare-fun minValue!1387 () V!50059)

(declare-fun zeroValue!1387 () V!50059)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21678 0))(
  ( (tuple2!21679 (_1!10850 (_ BitVec 64)) (_2!10850 V!50059)) )
))
(declare-datatypes ((List!28875 0))(
  ( (Nil!28872) (Cons!28871 (h!30080 tuple2!21678) (t!42415 List!28875)) )
))
(declare-datatypes ((ListLongMap!19335 0))(
  ( (ListLongMap!19336 (toList!9683 List!28875)) )
))
(declare-fun contains!7798 (ListLongMap!19335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4767 (array!84506 array!84508 (_ BitVec 32) (_ BitVec 32) V!50059 V!50059 (_ BitVec 32) Int) ListLongMap!19335)

(assert (=> b!1281061 (= res!850964 (contains!7798 (getCurrentListMap!4767 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281062 () Bool)

(declare-fun res!850966 () Bool)

(assert (=> b!1281062 (=> (not res!850966) (not e!731942))))

(assert (=> b!1281062 (= res!850966 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41307 _keys!1741)) (not (= (select (arr!40757 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!52127 () Bool)

(assert (=> mapIsEmpty!52127 mapRes!52127))

(declare-fun b!1281063 () Bool)

(declare-fun res!850969 () Bool)

(assert (=> b!1281063 (=> (not res!850969) (not e!731942))))

(assert (=> b!1281063 (= res!850969 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41307 _keys!1741))))))

(declare-fun b!1281064 () Bool)

(assert (=> b!1281064 (= e!731942 (not true))))

(assert (=> b!1281064 (contains!7798 (getCurrentListMap!4767 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42423 0))(
  ( (Unit!42424) )
))
(declare-fun lt!576188 () Unit!42423)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!16 (array!84506 array!84508 (_ BitVec 32) (_ BitVec 32) V!50059 V!50059 (_ BitVec 64) (_ BitVec 32) Int) Unit!42423)

(assert (=> b!1281064 (= lt!576188 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!16 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun res!850965 () Bool)

(assert (=> start!108530 (=> (not res!850965) (not e!731942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108530 (= res!850965 (validMask!0 mask!2175))))

(assert (=> start!108530 e!731942))

(assert (=> start!108530 tp_is_empty!33717))

(assert (=> start!108530 true))

(declare-fun array_inv!30929 (array!84508) Bool)

(assert (=> start!108530 (and (array_inv!30929 _values!1445) e!731943)))

(declare-fun array_inv!30930 (array!84506) Bool)

(assert (=> start!108530 (array_inv!30930 _keys!1741)))

(assert (=> start!108530 tp!99341))

(declare-fun b!1281056 () Bool)

(declare-fun res!850968 () Bool)

(assert (=> b!1281056 (=> (not res!850968) (not e!731942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84506 (_ BitVec 32)) Bool)

(assert (=> b!1281056 (= res!850968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108530 res!850965) b!1281058))

(assert (= (and b!1281058 res!850970) b!1281056))

(assert (= (and b!1281056 res!850968) b!1281057))

(assert (= (and b!1281057 res!850967) b!1281063))

(assert (= (and b!1281063 res!850969) b!1281061))

(assert (= (and b!1281061 res!850964) b!1281062))

(assert (= (and b!1281062 res!850966) b!1281064))

(assert (= (and b!1281059 condMapEmpty!52127) mapIsEmpty!52127))

(assert (= (and b!1281059 (not condMapEmpty!52127)) mapNonEmpty!52127))

(get-info :version)

(assert (= (and mapNonEmpty!52127 ((_ is ValueCellFull!15960) mapValue!52127)) b!1281055))

(assert (= (and b!1281059 ((_ is ValueCellFull!15960) mapDefault!52127)) b!1281060))

(assert (= start!108530 b!1281059))

(declare-fun m!1175549 () Bool)

(assert (=> b!1281056 m!1175549))

(declare-fun m!1175551 () Bool)

(assert (=> b!1281057 m!1175551))

(declare-fun m!1175553 () Bool)

(assert (=> b!1281064 m!1175553))

(assert (=> b!1281064 m!1175553))

(declare-fun m!1175555 () Bool)

(assert (=> b!1281064 m!1175555))

(declare-fun m!1175557 () Bool)

(assert (=> b!1281064 m!1175557))

(declare-fun m!1175559 () Bool)

(assert (=> b!1281062 m!1175559))

(declare-fun m!1175561 () Bool)

(assert (=> b!1281061 m!1175561))

(assert (=> b!1281061 m!1175561))

(declare-fun m!1175563 () Bool)

(assert (=> b!1281061 m!1175563))

(declare-fun m!1175565 () Bool)

(assert (=> mapNonEmpty!52127 m!1175565))

(declare-fun m!1175567 () Bool)

(assert (=> start!108530 m!1175567))

(declare-fun m!1175569 () Bool)

(assert (=> start!108530 m!1175569))

(declare-fun m!1175571 () Bool)

(assert (=> start!108530 m!1175571))

(check-sat (not b!1281061) (not b!1281064) (not b!1281057) (not b!1281056) tp_is_empty!33717 (not b_next!28077) (not mapNonEmpty!52127) (not start!108530) b_and!46137)
(check-sat b_and!46137 (not b_next!28077))

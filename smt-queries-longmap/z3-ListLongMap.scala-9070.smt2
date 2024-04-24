; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109428 () Bool)

(assert start!109428)

(declare-fun b_free!28693 () Bool)

(declare-fun b_next!28693 () Bool)

(assert (=> start!109428 (= b_free!28693 (not b_next!28693))))

(declare-fun tp!101198 () Bool)

(declare-fun b_and!46785 () Bool)

(assert (=> start!109428 (= tp!101198 b_and!46785)))

(declare-fun b!1293060 () Bool)

(declare-fun res!858775 () Bool)

(declare-fun e!738218 () Bool)

(assert (=> b!1293060 (=> (not res!858775) (not e!738218))))

(declare-datatypes ((V!50881 0))(
  ( (V!50882 (val!17241 Int)) )
))
(declare-fun minValue!1387 () V!50881)

(declare-fun zeroValue!1387 () V!50881)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16268 0))(
  ( (ValueCellFull!16268 (v!19839 V!50881)) (EmptyCell!16268) )
))
(declare-datatypes ((array!85733 0))(
  ( (array!85734 (arr!41363 (Array (_ BitVec 32) ValueCell!16268)) (size!41914 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85733)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85735 0))(
  ( (array!85736 (arr!41364 (Array (_ BitVec 32) (_ BitVec 64))) (size!41915 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85735)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22186 0))(
  ( (tuple2!22187 (_1!11104 (_ BitVec 64)) (_2!11104 V!50881)) )
))
(declare-datatypes ((List!29358 0))(
  ( (Nil!29355) (Cons!29354 (h!30572 tuple2!22186) (t!42914 List!29358)) )
))
(declare-datatypes ((ListLongMap!19851 0))(
  ( (ListLongMap!19852 (toList!9941 List!29358)) )
))
(declare-fun contains!8072 (ListLongMap!19851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4975 (array!85735 array!85733 (_ BitVec 32) (_ BitVec 32) V!50881 V!50881 (_ BitVec 32) Int) ListLongMap!19851)

(assert (=> b!1293060 (= res!858775 (contains!8072 (getCurrentListMap!4975 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293061 () Bool)

(declare-fun e!738219 () Bool)

(declare-fun tp_is_empty!34333 () Bool)

(assert (=> b!1293061 (= e!738219 tp_is_empty!34333)))

(declare-fun res!858776 () Bool)

(assert (=> start!109428 (=> (not res!858776) (not e!738218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109428 (= res!858776 (validMask!0 mask!2175))))

(assert (=> start!109428 e!738218))

(assert (=> start!109428 tp_is_empty!34333))

(assert (=> start!109428 true))

(declare-fun e!738220 () Bool)

(declare-fun array_inv!31571 (array!85733) Bool)

(assert (=> start!109428 (and (array_inv!31571 _values!1445) e!738220)))

(declare-fun array_inv!31572 (array!85735) Bool)

(assert (=> start!109428 (array_inv!31572 _keys!1741)))

(assert (=> start!109428 tp!101198))

(declare-fun b!1293062 () Bool)

(declare-fun res!858780 () Bool)

(assert (=> b!1293062 (=> (not res!858780) (not e!738218))))

(assert (=> b!1293062 (= res!858780 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41915 _keys!1741))))))

(declare-fun b!1293063 () Bool)

(declare-fun res!858781 () Bool)

(assert (=> b!1293063 (=> (not res!858781) (not e!738218))))

(declare-datatypes ((List!29359 0))(
  ( (Nil!29356) (Cons!29355 (h!30573 (_ BitVec 64)) (t!42915 List!29359)) )
))
(declare-fun arrayNoDuplicates!0 (array!85735 (_ BitVec 32) List!29359) Bool)

(assert (=> b!1293063 (= res!858781 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29356))))

(declare-fun b!1293064 () Bool)

(assert (=> b!1293064 (= e!738218 (not true))))

(assert (=> b!1293064 (not (contains!8072 (ListLongMap!19852 Nil!29355) k0!1205))))

(declare-datatypes ((Unit!42727 0))(
  ( (Unit!42728) )
))
(declare-fun lt!579759 () Unit!42727)

(declare-fun emptyContainsNothing!109 ((_ BitVec 64)) Unit!42727)

(assert (=> b!1293064 (= lt!579759 (emptyContainsNothing!109 k0!1205))))

(declare-fun b!1293065 () Bool)

(declare-fun e!738221 () Bool)

(assert (=> b!1293065 (= e!738221 tp_is_empty!34333)))

(declare-fun mapIsEmpty!53060 () Bool)

(declare-fun mapRes!53060 () Bool)

(assert (=> mapIsEmpty!53060 mapRes!53060))

(declare-fun mapNonEmpty!53060 () Bool)

(declare-fun tp!101197 () Bool)

(assert (=> mapNonEmpty!53060 (= mapRes!53060 (and tp!101197 e!738219))))

(declare-fun mapRest!53060 () (Array (_ BitVec 32) ValueCell!16268))

(declare-fun mapKey!53060 () (_ BitVec 32))

(declare-fun mapValue!53060 () ValueCell!16268)

(assert (=> mapNonEmpty!53060 (= (arr!41363 _values!1445) (store mapRest!53060 mapKey!53060 mapValue!53060))))

(declare-fun b!1293066 () Bool)

(declare-fun res!858778 () Bool)

(assert (=> b!1293066 (=> (not res!858778) (not e!738218))))

(assert (=> b!1293066 (= res!858778 (and (= (size!41914 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41915 _keys!1741) (size!41914 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293067 () Bool)

(declare-fun res!858779 () Bool)

(assert (=> b!1293067 (=> (not res!858779) (not e!738218))))

(assert (=> b!1293067 (= res!858779 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41915 _keys!1741))))))

(declare-fun b!1293068 () Bool)

(declare-fun res!858777 () Bool)

(assert (=> b!1293068 (=> (not res!858777) (not e!738218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85735 (_ BitVec 32)) Bool)

(assert (=> b!1293068 (= res!858777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293069 () Bool)

(declare-fun res!858774 () Bool)

(assert (=> b!1293069 (=> (not res!858774) (not e!738218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293069 (= res!858774 (not (validKeyInArray!0 (select (arr!41364 _keys!1741) from!2144))))))

(declare-fun b!1293070 () Bool)

(assert (=> b!1293070 (= e!738220 (and e!738221 mapRes!53060))))

(declare-fun condMapEmpty!53060 () Bool)

(declare-fun mapDefault!53060 () ValueCell!16268)

(assert (=> b!1293070 (= condMapEmpty!53060 (= (arr!41363 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16268)) mapDefault!53060)))))

(assert (= (and start!109428 res!858776) b!1293066))

(assert (= (and b!1293066 res!858778) b!1293068))

(assert (= (and b!1293068 res!858777) b!1293063))

(assert (= (and b!1293063 res!858781) b!1293062))

(assert (= (and b!1293062 res!858780) b!1293060))

(assert (= (and b!1293060 res!858775) b!1293067))

(assert (= (and b!1293067 res!858779) b!1293069))

(assert (= (and b!1293069 res!858774) b!1293064))

(assert (= (and b!1293070 condMapEmpty!53060) mapIsEmpty!53060))

(assert (= (and b!1293070 (not condMapEmpty!53060)) mapNonEmpty!53060))

(get-info :version)

(assert (= (and mapNonEmpty!53060 ((_ is ValueCellFull!16268) mapValue!53060)) b!1293061))

(assert (= (and b!1293070 ((_ is ValueCellFull!16268) mapDefault!53060)) b!1293065))

(assert (= start!109428 b!1293070))

(declare-fun m!1186113 () Bool)

(assert (=> mapNonEmpty!53060 m!1186113))

(declare-fun m!1186115 () Bool)

(assert (=> b!1293063 m!1186115))

(declare-fun m!1186117 () Bool)

(assert (=> b!1293064 m!1186117))

(declare-fun m!1186119 () Bool)

(assert (=> b!1293064 m!1186119))

(declare-fun m!1186121 () Bool)

(assert (=> b!1293069 m!1186121))

(assert (=> b!1293069 m!1186121))

(declare-fun m!1186123 () Bool)

(assert (=> b!1293069 m!1186123))

(declare-fun m!1186125 () Bool)

(assert (=> start!109428 m!1186125))

(declare-fun m!1186127 () Bool)

(assert (=> start!109428 m!1186127))

(declare-fun m!1186129 () Bool)

(assert (=> start!109428 m!1186129))

(declare-fun m!1186131 () Bool)

(assert (=> b!1293068 m!1186131))

(declare-fun m!1186133 () Bool)

(assert (=> b!1293060 m!1186133))

(assert (=> b!1293060 m!1186133))

(declare-fun m!1186135 () Bool)

(assert (=> b!1293060 m!1186135))

(check-sat (not b_next!28693) (not b!1293060) (not b!1293069) b_and!46785 tp_is_empty!34333 (not b!1293068) (not mapNonEmpty!53060) (not b!1293064) (not b!1293063) (not start!109428))
(check-sat b_and!46785 (not b_next!28693))

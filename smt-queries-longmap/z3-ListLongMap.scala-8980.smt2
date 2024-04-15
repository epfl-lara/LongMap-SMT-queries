; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108640 () Bool)

(assert start!108640)

(declare-fun b_free!28153 () Bool)

(declare-fun b_next!28153 () Bool)

(assert (=> start!108640 (= b_free!28153 (not b_next!28153))))

(declare-fun tp!99575 () Bool)

(declare-fun b_and!46201 () Bool)

(assert (=> start!108640 (= tp!99575 b_and!46201)))

(declare-fun b!1282309 () Bool)

(declare-fun res!851766 () Bool)

(declare-fun e!732679 () Bool)

(assert (=> b!1282309 (=> (not res!851766) (not e!732679))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50161 0))(
  ( (V!50162 (val!16971 Int)) )
))
(declare-datatypes ((ValueCell!15998 0))(
  ( (ValueCellFull!15998 (v!19572 V!50161)) (EmptyCell!15998) )
))
(declare-datatypes ((array!84549 0))(
  ( (array!84550 (arr!40777 (Array (_ BitVec 32) ValueCell!15998)) (size!41329 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84549)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84551 0))(
  ( (array!84552 (arr!40778 (Array (_ BitVec 32) (_ BitVec 64))) (size!41330 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84551)

(assert (=> b!1282309 (= res!851766 (and (= (size!41329 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41330 _keys!1741) (size!41329 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!851768 () Bool)

(assert (=> start!108640 (=> (not res!851768) (not e!732679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108640 (= res!851768 (validMask!0 mask!2175))))

(assert (=> start!108640 e!732679))

(declare-fun tp_is_empty!33793 () Bool)

(assert (=> start!108640 tp_is_empty!33793))

(assert (=> start!108640 true))

(declare-fun e!732681 () Bool)

(declare-fun array_inv!31095 (array!84549) Bool)

(assert (=> start!108640 (and (array_inv!31095 _values!1445) e!732681)))

(declare-fun array_inv!31096 (array!84551) Bool)

(assert (=> start!108640 (array_inv!31096 _keys!1741)))

(assert (=> start!108640 tp!99575))

(declare-fun b!1282310 () Bool)

(declare-fun res!851769 () Bool)

(assert (=> b!1282310 (=> (not res!851769) (not e!732679))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282310 (= res!851769 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41330 _keys!1741))))))

(declare-fun b!1282311 () Bool)

(declare-fun e!732677 () Bool)

(declare-fun mapRes!52247 () Bool)

(assert (=> b!1282311 (= e!732681 (and e!732677 mapRes!52247))))

(declare-fun condMapEmpty!52247 () Bool)

(declare-fun mapDefault!52247 () ValueCell!15998)

(assert (=> b!1282311 (= condMapEmpty!52247 (= (arr!40777 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15998)) mapDefault!52247)))))

(declare-fun mapIsEmpty!52247 () Bool)

(assert (=> mapIsEmpty!52247 mapRes!52247))

(declare-fun b!1282312 () Bool)

(declare-fun res!851765 () Bool)

(assert (=> b!1282312 (=> (not res!851765) (not e!732679))))

(declare-datatypes ((List!28987 0))(
  ( (Nil!28984) (Cons!28983 (h!30192 (_ BitVec 64)) (t!42523 List!28987)) )
))
(declare-fun arrayNoDuplicates!0 (array!84551 (_ BitVec 32) List!28987) Bool)

(assert (=> b!1282312 (= res!851765 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28984))))

(declare-fun b!1282313 () Bool)

(declare-fun res!851767 () Bool)

(assert (=> b!1282313 (=> (not res!851767) (not e!732679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84551 (_ BitVec 32)) Bool)

(assert (=> b!1282313 (= res!851767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282314 () Bool)

(declare-fun e!732678 () Bool)

(assert (=> b!1282314 (= e!732678 tp_is_empty!33793)))

(declare-fun b!1282315 () Bool)

(assert (=> b!1282315 (= e!732679 false)))

(declare-fun minValue!1387 () V!50161)

(declare-fun zeroValue!1387 () V!50161)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576348 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21798 0))(
  ( (tuple2!21799 (_1!10910 (_ BitVec 64)) (_2!10910 V!50161)) )
))
(declare-datatypes ((List!28988 0))(
  ( (Nil!28985) (Cons!28984 (h!30193 tuple2!21798) (t!42524 List!28988)) )
))
(declare-datatypes ((ListLongMap!19455 0))(
  ( (ListLongMap!19456 (toList!9743 List!28988)) )
))
(declare-fun contains!7790 (ListLongMap!19455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4717 (array!84551 array!84549 (_ BitVec 32) (_ BitVec 32) V!50161 V!50161 (_ BitVec 32) Int) ListLongMap!19455)

(assert (=> b!1282315 (= lt!576348 (contains!7790 (getCurrentListMap!4717 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282316 () Bool)

(assert (=> b!1282316 (= e!732677 tp_is_empty!33793)))

(declare-fun mapNonEmpty!52247 () Bool)

(declare-fun tp!99576 () Bool)

(assert (=> mapNonEmpty!52247 (= mapRes!52247 (and tp!99576 e!732678))))

(declare-fun mapKey!52247 () (_ BitVec 32))

(declare-fun mapValue!52247 () ValueCell!15998)

(declare-fun mapRest!52247 () (Array (_ BitVec 32) ValueCell!15998))

(assert (=> mapNonEmpty!52247 (= (arr!40777 _values!1445) (store mapRest!52247 mapKey!52247 mapValue!52247))))

(assert (= (and start!108640 res!851768) b!1282309))

(assert (= (and b!1282309 res!851766) b!1282313))

(assert (= (and b!1282313 res!851767) b!1282312))

(assert (= (and b!1282312 res!851765) b!1282310))

(assert (= (and b!1282310 res!851769) b!1282315))

(assert (= (and b!1282311 condMapEmpty!52247) mapIsEmpty!52247))

(assert (= (and b!1282311 (not condMapEmpty!52247)) mapNonEmpty!52247))

(get-info :version)

(assert (= (and mapNonEmpty!52247 ((_ is ValueCellFull!15998) mapValue!52247)) b!1282314))

(assert (= (and b!1282311 ((_ is ValueCellFull!15998) mapDefault!52247)) b!1282316))

(assert (= start!108640 b!1282311))

(declare-fun m!1176097 () Bool)

(assert (=> b!1282312 m!1176097))

(declare-fun m!1176099 () Bool)

(assert (=> mapNonEmpty!52247 m!1176099))

(declare-fun m!1176101 () Bool)

(assert (=> b!1282313 m!1176101))

(declare-fun m!1176103 () Bool)

(assert (=> start!108640 m!1176103))

(declare-fun m!1176105 () Bool)

(assert (=> start!108640 m!1176105))

(declare-fun m!1176107 () Bool)

(assert (=> start!108640 m!1176107))

(declare-fun m!1176109 () Bool)

(assert (=> b!1282315 m!1176109))

(assert (=> b!1282315 m!1176109))

(declare-fun m!1176111 () Bool)

(assert (=> b!1282315 m!1176111))

(check-sat b_and!46201 (not b!1282313) (not mapNonEmpty!52247) (not b!1282312) (not b_next!28153) tp_is_empty!33793 (not b!1282315) (not start!108640))
(check-sat b_and!46201 (not b_next!28153))

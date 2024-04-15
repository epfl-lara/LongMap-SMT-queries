; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109018 () Bool)

(assert start!109018)

(declare-fun b_free!28507 () Bool)

(declare-fun b_next!28507 () Bool)

(assert (=> start!109018 (= b_free!28507 (not b_next!28507))))

(declare-fun tp!100640 () Bool)

(declare-fun b_and!46579 () Bool)

(assert (=> start!109018 (= tp!100640 b_and!46579)))

(declare-fun b!1288345 () Bool)

(declare-fun e!735674 () Bool)

(declare-fun e!735673 () Bool)

(assert (=> b!1288345 (= e!735674 (not e!735673))))

(declare-fun res!855718 () Bool)

(assert (=> b!1288345 (=> res!855718 e!735673)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288345 (= res!855718 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50633 0))(
  ( (V!50634 (val!17148 Int)) )
))
(declare-datatypes ((tuple2!22066 0))(
  ( (tuple2!22067 (_1!11044 (_ BitVec 64)) (_2!11044 V!50633)) )
))
(declare-datatypes ((List!29236 0))(
  ( (Nil!29233) (Cons!29232 (h!30441 tuple2!22066) (t!42792 List!29236)) )
))
(declare-datatypes ((ListLongMap!19723 0))(
  ( (ListLongMap!19724 (toList!9877 List!29236)) )
))
(declare-fun contains!7925 (ListLongMap!19723 (_ BitVec 64)) Bool)

(assert (=> b!1288345 (not (contains!7925 (ListLongMap!19724 Nil!29233) k0!1205))))

(declare-datatypes ((Unit!42458 0))(
  ( (Unit!42459) )
))
(declare-fun lt!577806 () Unit!42458)

(declare-fun emptyContainsNothing!35 ((_ BitVec 64)) Unit!42458)

(assert (=> b!1288345 (= lt!577806 (emptyContainsNothing!35 k0!1205))))

(declare-fun b!1288346 () Bool)

(declare-fun res!855721 () Bool)

(assert (=> b!1288346 (=> (not res!855721) (not e!735674))))

(declare-datatypes ((array!85229 0))(
  ( (array!85230 (arr!41116 (Array (_ BitVec 32) (_ BitVec 64))) (size!41668 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85229)

(declare-datatypes ((List!29237 0))(
  ( (Nil!29234) (Cons!29233 (h!30442 (_ BitVec 64)) (t!42793 List!29237)) )
))
(declare-fun arrayNoDuplicates!0 (array!85229 (_ BitVec 32) List!29237) Bool)

(assert (=> b!1288346 (= res!855721 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29234))))

(declare-fun b!1288347 () Bool)

(declare-fun res!855720 () Bool)

(assert (=> b!1288347 (=> (not res!855720) (not e!735674))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288347 (= res!855720 (not (validKeyInArray!0 (select (arr!41116 _keys!1741) from!2144))))))

(declare-fun b!1288348 () Bool)

(declare-fun res!855725 () Bool)

(assert (=> b!1288348 (=> (not res!855725) (not e!735674))))

(assert (=> b!1288348 (= res!855725 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41668 _keys!1741))))))

(declare-fun b!1288349 () Bool)

(declare-fun e!735672 () Bool)

(declare-fun e!735670 () Bool)

(declare-fun mapRes!52781 () Bool)

(assert (=> b!1288349 (= e!735672 (and e!735670 mapRes!52781))))

(declare-fun condMapEmpty!52781 () Bool)

(declare-datatypes ((ValueCell!16175 0))(
  ( (ValueCellFull!16175 (v!19750 V!50633)) (EmptyCell!16175) )
))
(declare-datatypes ((array!85231 0))(
  ( (array!85232 (arr!41117 (Array (_ BitVec 32) ValueCell!16175)) (size!41669 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85231)

(declare-fun mapDefault!52781 () ValueCell!16175)

(assert (=> b!1288349 (= condMapEmpty!52781 (= (arr!41117 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16175)) mapDefault!52781)))))

(declare-fun b!1288350 () Bool)

(declare-fun e!735675 () Bool)

(declare-fun tp_is_empty!34147 () Bool)

(assert (=> b!1288350 (= e!735675 tp_is_empty!34147)))

(declare-fun b!1288351 () Bool)

(declare-fun res!855723 () Bool)

(assert (=> b!1288351 (=> (not res!855723) (not e!735674))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85229 (_ BitVec 32)) Bool)

(assert (=> b!1288351 (= res!855723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288352 () Bool)

(assert (=> b!1288352 (= e!735673 true)))

(declare-fun lt!577807 () ListLongMap!19723)

(declare-fun zeroValue!1387 () V!50633)

(declare-fun +!4367 (ListLongMap!19723 tuple2!22066) ListLongMap!19723)

(assert (=> b!1288352 (not (contains!7925 (+!4367 lt!577807 (tuple2!22067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!577805 () Unit!42458)

(declare-fun addStillNotContains!344 (ListLongMap!19723 (_ BitVec 64) V!50633 (_ BitVec 64)) Unit!42458)

(assert (=> b!1288352 (= lt!577805 (addStillNotContains!344 lt!577807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50633)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5998 (array!85229 array!85231 (_ BitVec 32) (_ BitVec 32) V!50633 V!50633 (_ BitVec 32) Int) ListLongMap!19723)

(assert (=> b!1288352 (= lt!577807 (getCurrentListMapNoExtraKeys!5998 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288353 () Bool)

(declare-fun res!855719 () Bool)

(assert (=> b!1288353 (=> (not res!855719) (not e!735674))))

(assert (=> b!1288353 (= res!855719 (and (= (size!41669 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41668 _keys!1741) (size!41669 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!855722 () Bool)

(assert (=> start!109018 (=> (not res!855722) (not e!735674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109018 (= res!855722 (validMask!0 mask!2175))))

(assert (=> start!109018 e!735674))

(assert (=> start!109018 tp_is_empty!34147))

(assert (=> start!109018 true))

(declare-fun array_inv!31335 (array!85231) Bool)

(assert (=> start!109018 (and (array_inv!31335 _values!1445) e!735672)))

(declare-fun array_inv!31336 (array!85229) Bool)

(assert (=> start!109018 (array_inv!31336 _keys!1741)))

(assert (=> start!109018 tp!100640))

(declare-fun mapIsEmpty!52781 () Bool)

(assert (=> mapIsEmpty!52781 mapRes!52781))

(declare-fun b!1288354 () Bool)

(assert (=> b!1288354 (= e!735670 tp_is_empty!34147)))

(declare-fun b!1288355 () Bool)

(declare-fun res!855726 () Bool)

(assert (=> b!1288355 (=> (not res!855726) (not e!735674))))

(declare-fun getCurrentListMap!4835 (array!85229 array!85231 (_ BitVec 32) (_ BitVec 32) V!50633 V!50633 (_ BitVec 32) Int) ListLongMap!19723)

(assert (=> b!1288355 (= res!855726 (contains!7925 (getCurrentListMap!4835 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288356 () Bool)

(declare-fun res!855724 () Bool)

(assert (=> b!1288356 (=> (not res!855724) (not e!735674))))

(assert (=> b!1288356 (= res!855724 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41668 _keys!1741))))))

(declare-fun mapNonEmpty!52781 () Bool)

(declare-fun tp!100641 () Bool)

(assert (=> mapNonEmpty!52781 (= mapRes!52781 (and tp!100641 e!735675))))

(declare-fun mapRest!52781 () (Array (_ BitVec 32) ValueCell!16175))

(declare-fun mapKey!52781 () (_ BitVec 32))

(declare-fun mapValue!52781 () ValueCell!16175)

(assert (=> mapNonEmpty!52781 (= (arr!41117 _values!1445) (store mapRest!52781 mapKey!52781 mapValue!52781))))

(assert (= (and start!109018 res!855722) b!1288353))

(assert (= (and b!1288353 res!855719) b!1288351))

(assert (= (and b!1288351 res!855723) b!1288346))

(assert (= (and b!1288346 res!855721) b!1288348))

(assert (= (and b!1288348 res!855725) b!1288355))

(assert (= (and b!1288355 res!855726) b!1288356))

(assert (= (and b!1288356 res!855724) b!1288347))

(assert (= (and b!1288347 res!855720) b!1288345))

(assert (= (and b!1288345 (not res!855718)) b!1288352))

(assert (= (and b!1288349 condMapEmpty!52781) mapIsEmpty!52781))

(assert (= (and b!1288349 (not condMapEmpty!52781)) mapNonEmpty!52781))

(get-info :version)

(assert (= (and mapNonEmpty!52781 ((_ is ValueCellFull!16175) mapValue!52781)) b!1288350))

(assert (= (and b!1288349 ((_ is ValueCellFull!16175) mapDefault!52781)) b!1288354))

(assert (= start!109018 b!1288349))

(declare-fun m!1180527 () Bool)

(assert (=> b!1288355 m!1180527))

(assert (=> b!1288355 m!1180527))

(declare-fun m!1180529 () Bool)

(assert (=> b!1288355 m!1180529))

(declare-fun m!1180531 () Bool)

(assert (=> b!1288346 m!1180531))

(declare-fun m!1180533 () Bool)

(assert (=> mapNonEmpty!52781 m!1180533))

(declare-fun m!1180535 () Bool)

(assert (=> b!1288351 m!1180535))

(declare-fun m!1180537 () Bool)

(assert (=> b!1288352 m!1180537))

(assert (=> b!1288352 m!1180537))

(declare-fun m!1180539 () Bool)

(assert (=> b!1288352 m!1180539))

(declare-fun m!1180541 () Bool)

(assert (=> b!1288352 m!1180541))

(declare-fun m!1180543 () Bool)

(assert (=> b!1288352 m!1180543))

(declare-fun m!1180545 () Bool)

(assert (=> start!109018 m!1180545))

(declare-fun m!1180547 () Bool)

(assert (=> start!109018 m!1180547))

(declare-fun m!1180549 () Bool)

(assert (=> start!109018 m!1180549))

(declare-fun m!1180551 () Bool)

(assert (=> b!1288347 m!1180551))

(assert (=> b!1288347 m!1180551))

(declare-fun m!1180553 () Bool)

(assert (=> b!1288347 m!1180553))

(declare-fun m!1180555 () Bool)

(assert (=> b!1288345 m!1180555))

(declare-fun m!1180557 () Bool)

(assert (=> b!1288345 m!1180557))

(check-sat (not b!1288355) (not mapNonEmpty!52781) b_and!46579 (not b_next!28507) (not b!1288345) (not b!1288351) (not b!1288346) (not start!109018) (not b!1288347) (not b!1288352) tp_is_empty!34147)
(check-sat b_and!46579 (not b_next!28507))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109024 () Bool)

(assert start!109024)

(declare-fun b_free!28513 () Bool)

(declare-fun b_next!28513 () Bool)

(assert (=> start!109024 (= b_free!28513 (not b_next!28513))))

(declare-fun tp!100658 () Bool)

(declare-fun b_and!46585 () Bool)

(assert (=> start!109024 (= tp!100658 b_and!46585)))

(declare-fun b!1288453 () Bool)

(declare-fun res!855801 () Bool)

(declare-fun e!735728 () Bool)

(assert (=> b!1288453 (=> (not res!855801) (not e!735728))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85239 0))(
  ( (array!85240 (arr!41121 (Array (_ BitVec 32) (_ BitVec 64))) (size!41673 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85239)

(assert (=> b!1288453 (= res!855801 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41673 _keys!1741))))))

(declare-fun mapIsEmpty!52790 () Bool)

(declare-fun mapRes!52790 () Bool)

(assert (=> mapIsEmpty!52790 mapRes!52790))

(declare-fun mapNonEmpty!52790 () Bool)

(declare-fun tp!100659 () Bool)

(declare-fun e!735726 () Bool)

(assert (=> mapNonEmpty!52790 (= mapRes!52790 (and tp!100659 e!735726))))

(declare-datatypes ((V!50641 0))(
  ( (V!50642 (val!17151 Int)) )
))
(declare-datatypes ((ValueCell!16178 0))(
  ( (ValueCellFull!16178 (v!19753 V!50641)) (EmptyCell!16178) )
))
(declare-fun mapRest!52790 () (Array (_ BitVec 32) ValueCell!16178))

(declare-datatypes ((array!85241 0))(
  ( (array!85242 (arr!41122 (Array (_ BitVec 32) ValueCell!16178)) (size!41674 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85241)

(declare-fun mapValue!52790 () ValueCell!16178)

(declare-fun mapKey!52790 () (_ BitVec 32))

(assert (=> mapNonEmpty!52790 (= (arr!41122 _values!1445) (store mapRest!52790 mapKey!52790 mapValue!52790))))

(declare-fun b!1288454 () Bool)

(declare-fun res!855802 () Bool)

(assert (=> b!1288454 (=> (not res!855802) (not e!735728))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288454 (= res!855802 (and (= (size!41674 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41673 _keys!1741) (size!41674 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!855804 () Bool)

(assert (=> start!109024 (=> (not res!855804) (not e!735728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109024 (= res!855804 (validMask!0 mask!2175))))

(assert (=> start!109024 e!735728))

(declare-fun tp_is_empty!34153 () Bool)

(assert (=> start!109024 tp_is_empty!34153))

(assert (=> start!109024 true))

(declare-fun e!735724 () Bool)

(declare-fun array_inv!31337 (array!85241) Bool)

(assert (=> start!109024 (and (array_inv!31337 _values!1445) e!735724)))

(declare-fun array_inv!31338 (array!85239) Bool)

(assert (=> start!109024 (array_inv!31338 _keys!1741)))

(assert (=> start!109024 tp!100658))

(declare-fun b!1288455 () Bool)

(declare-fun e!735725 () Bool)

(assert (=> b!1288455 (= e!735728 (not e!735725))))

(declare-fun res!855800 () Bool)

(assert (=> b!1288455 (=> res!855800 e!735725)))

(assert (=> b!1288455 (= res!855800 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22070 0))(
  ( (tuple2!22071 (_1!11046 (_ BitVec 64)) (_2!11046 V!50641)) )
))
(declare-datatypes ((List!29239 0))(
  ( (Nil!29236) (Cons!29235 (h!30444 tuple2!22070) (t!42795 List!29239)) )
))
(declare-datatypes ((ListLongMap!19727 0))(
  ( (ListLongMap!19728 (toList!9879 List!29239)) )
))
(declare-fun contains!7927 (ListLongMap!19727 (_ BitVec 64)) Bool)

(assert (=> b!1288455 (not (contains!7927 (ListLongMap!19728 Nil!29236) k0!1205))))

(declare-datatypes ((Unit!42462 0))(
  ( (Unit!42463) )
))
(declare-fun lt!577832 () Unit!42462)

(declare-fun emptyContainsNothing!37 ((_ BitVec 64)) Unit!42462)

(assert (=> b!1288455 (= lt!577832 (emptyContainsNothing!37 k0!1205))))

(declare-fun b!1288456 () Bool)

(declare-fun res!855806 () Bool)

(assert (=> b!1288456 (=> (not res!855806) (not e!735728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85239 (_ BitVec 32)) Bool)

(assert (=> b!1288456 (= res!855806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288457 () Bool)

(declare-fun res!855803 () Bool)

(assert (=> b!1288457 (=> (not res!855803) (not e!735728))))

(declare-datatypes ((List!29240 0))(
  ( (Nil!29237) (Cons!29236 (h!30445 (_ BitVec 64)) (t!42796 List!29240)) )
))
(declare-fun arrayNoDuplicates!0 (array!85239 (_ BitVec 32) List!29240) Bool)

(assert (=> b!1288457 (= res!855803 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29237))))

(declare-fun b!1288458 () Bool)

(declare-fun e!735729 () Bool)

(assert (=> b!1288458 (= e!735729 tp_is_empty!34153)))

(declare-fun b!1288459 () Bool)

(declare-fun res!855799 () Bool)

(assert (=> b!1288459 (=> (not res!855799) (not e!735728))))

(declare-fun minValue!1387 () V!50641)

(declare-fun zeroValue!1387 () V!50641)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4836 (array!85239 array!85241 (_ BitVec 32) (_ BitVec 32) V!50641 V!50641 (_ BitVec 32) Int) ListLongMap!19727)

(assert (=> b!1288459 (= res!855799 (contains!7927 (getCurrentListMap!4836 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288460 () Bool)

(declare-fun res!855807 () Bool)

(assert (=> b!1288460 (=> (not res!855807) (not e!735728))))

(assert (=> b!1288460 (= res!855807 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41673 _keys!1741))))))

(declare-fun b!1288461 () Bool)

(declare-fun res!855805 () Bool)

(assert (=> b!1288461 (=> (not res!855805) (not e!735728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288461 (= res!855805 (not (validKeyInArray!0 (select (arr!41121 _keys!1741) from!2144))))))

(declare-fun b!1288462 () Bool)

(assert (=> b!1288462 (= e!735725 true)))

(declare-fun lt!577834 () ListLongMap!19727)

(declare-fun +!4369 (ListLongMap!19727 tuple2!22070) ListLongMap!19727)

(assert (=> b!1288462 (not (contains!7927 (+!4369 lt!577834 (tuple2!22071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!577833 () Unit!42462)

(declare-fun addStillNotContains!346 (ListLongMap!19727 (_ BitVec 64) V!50641 (_ BitVec 64)) Unit!42462)

(assert (=> b!1288462 (= lt!577833 (addStillNotContains!346 lt!577834 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6000 (array!85239 array!85241 (_ BitVec 32) (_ BitVec 32) V!50641 V!50641 (_ BitVec 32) Int) ListLongMap!19727)

(assert (=> b!1288462 (= lt!577834 (getCurrentListMapNoExtraKeys!6000 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288463 () Bool)

(assert (=> b!1288463 (= e!735724 (and e!735729 mapRes!52790))))

(declare-fun condMapEmpty!52790 () Bool)

(declare-fun mapDefault!52790 () ValueCell!16178)

(assert (=> b!1288463 (= condMapEmpty!52790 (= (arr!41122 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16178)) mapDefault!52790)))))

(declare-fun b!1288464 () Bool)

(assert (=> b!1288464 (= e!735726 tp_is_empty!34153)))

(assert (= (and start!109024 res!855804) b!1288454))

(assert (= (and b!1288454 res!855802) b!1288456))

(assert (= (and b!1288456 res!855806) b!1288457))

(assert (= (and b!1288457 res!855803) b!1288460))

(assert (= (and b!1288460 res!855807) b!1288459))

(assert (= (and b!1288459 res!855799) b!1288453))

(assert (= (and b!1288453 res!855801) b!1288461))

(assert (= (and b!1288461 res!855805) b!1288455))

(assert (= (and b!1288455 (not res!855800)) b!1288462))

(assert (= (and b!1288463 condMapEmpty!52790) mapIsEmpty!52790))

(assert (= (and b!1288463 (not condMapEmpty!52790)) mapNonEmpty!52790))

(get-info :version)

(assert (= (and mapNonEmpty!52790 ((_ is ValueCellFull!16178) mapValue!52790)) b!1288464))

(assert (= (and b!1288463 ((_ is ValueCellFull!16178) mapDefault!52790)) b!1288458))

(assert (= start!109024 b!1288463))

(declare-fun m!1180623 () Bool)

(assert (=> b!1288461 m!1180623))

(assert (=> b!1288461 m!1180623))

(declare-fun m!1180625 () Bool)

(assert (=> b!1288461 m!1180625))

(declare-fun m!1180627 () Bool)

(assert (=> b!1288455 m!1180627))

(declare-fun m!1180629 () Bool)

(assert (=> b!1288455 m!1180629))

(declare-fun m!1180631 () Bool)

(assert (=> b!1288457 m!1180631))

(declare-fun m!1180633 () Bool)

(assert (=> start!109024 m!1180633))

(declare-fun m!1180635 () Bool)

(assert (=> start!109024 m!1180635))

(declare-fun m!1180637 () Bool)

(assert (=> start!109024 m!1180637))

(declare-fun m!1180639 () Bool)

(assert (=> b!1288456 m!1180639))

(declare-fun m!1180641 () Bool)

(assert (=> mapNonEmpty!52790 m!1180641))

(declare-fun m!1180643 () Bool)

(assert (=> b!1288459 m!1180643))

(assert (=> b!1288459 m!1180643))

(declare-fun m!1180645 () Bool)

(assert (=> b!1288459 m!1180645))

(declare-fun m!1180647 () Bool)

(assert (=> b!1288462 m!1180647))

(assert (=> b!1288462 m!1180647))

(declare-fun m!1180649 () Bool)

(assert (=> b!1288462 m!1180649))

(declare-fun m!1180651 () Bool)

(assert (=> b!1288462 m!1180651))

(declare-fun m!1180653 () Bool)

(assert (=> b!1288462 m!1180653))

(check-sat (not b!1288461) (not b_next!28513) (not b!1288457) (not start!109024) (not mapNonEmpty!52790) b_and!46585 (not b!1288459) tp_is_empty!34153 (not b!1288462) (not b!1288455) (not b!1288456))
(check-sat b_and!46585 (not b_next!28513))

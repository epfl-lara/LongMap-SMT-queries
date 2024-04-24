; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109644 () Bool)

(assert start!109644)

(declare-fun b_free!28909 () Bool)

(declare-fun b_next!28909 () Bool)

(assert (=> start!109644 (= b_free!28909 (not b_next!28909))))

(declare-fun tp!101846 () Bool)

(declare-fun b_and!47001 () Bool)

(assert (=> start!109644 (= tp!101846 b_and!47001)))

(declare-fun b!1296788 () Bool)

(declare-fun res!861538 () Bool)

(declare-fun e!740006 () Bool)

(assert (=> b!1296788 (=> (not res!861538) (not e!740006))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86151 0))(
  ( (array!86152 (arr!41572 (Array (_ BitVec 32) (_ BitVec 64))) (size!42123 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86151)

(assert (=> b!1296788 (= res!861538 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42123 _keys!1741))))))

(declare-fun b!1296789 () Bool)

(declare-fun e!740002 () Bool)

(assert (=> b!1296789 (= e!740002 true)))

(declare-datatypes ((V!51169 0))(
  ( (V!51170 (val!17349 Int)) )
))
(declare-datatypes ((tuple2!22342 0))(
  ( (tuple2!22343 (_1!11182 (_ BitVec 64)) (_2!11182 V!51169)) )
))
(declare-datatypes ((List!29509 0))(
  ( (Nil!29506) (Cons!29505 (h!30723 tuple2!22342) (t!43065 List!29509)) )
))
(declare-datatypes ((ListLongMap!20007 0))(
  ( (ListLongMap!20008 (toList!10019 List!29509)) )
))
(declare-fun lt!580393 () ListLongMap!20007)

(declare-fun minValue!1387 () V!51169)

(declare-fun contains!8150 (ListLongMap!20007 (_ BitVec 64)) Bool)

(declare-fun +!4463 (ListLongMap!20007 tuple2!22342) ListLongMap!20007)

(assert (=> b!1296789 (not (contains!8150 (+!4463 lt!580393 (tuple2!22343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42869 0))(
  ( (Unit!42870) )
))
(declare-fun lt!580394 () Unit!42869)

(declare-fun addStillNotContains!439 (ListLongMap!20007 (_ BitVec 64) V!51169 (_ BitVec 64)) Unit!42869)

(assert (=> b!1296789 (= lt!580394 (addStillNotContains!439 lt!580393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51169)

(declare-datatypes ((ValueCell!16376 0))(
  ( (ValueCellFull!16376 (v!19947 V!51169)) (EmptyCell!16376) )
))
(declare-datatypes ((array!86153 0))(
  ( (array!86154 (arr!41573 (Array (_ BitVec 32) ValueCell!16376)) (size!42124 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86153)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6105 (array!86151 array!86153 (_ BitVec 32) (_ BitVec 32) V!51169 V!51169 (_ BitVec 32) Int) ListLongMap!20007)

(assert (=> b!1296789 (= lt!580393 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296790 () Bool)

(declare-fun res!861530 () Bool)

(assert (=> b!1296790 (=> (not res!861530) (not e!740006))))

(declare-fun getCurrentListMap!5041 (array!86151 array!86153 (_ BitVec 32) (_ BitVec 32) V!51169 V!51169 (_ BitVec 32) Int) ListLongMap!20007)

(assert (=> b!1296790 (= res!861530 (contains!8150 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296791 () Bool)

(declare-fun res!861532 () Bool)

(assert (=> b!1296791 (=> (not res!861532) (not e!740006))))

(assert (=> b!1296791 (= res!861532 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42123 _keys!1741))))))

(declare-fun b!1296792 () Bool)

(declare-fun e!740005 () Bool)

(declare-fun tp_is_empty!34549 () Bool)

(assert (=> b!1296792 (= e!740005 tp_is_empty!34549)))

(declare-fun res!861533 () Bool)

(assert (=> start!109644 (=> (not res!861533) (not e!740006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109644 (= res!861533 (validMask!0 mask!2175))))

(assert (=> start!109644 e!740006))

(assert (=> start!109644 tp_is_empty!34549))

(assert (=> start!109644 true))

(declare-fun e!740004 () Bool)

(declare-fun array_inv!31707 (array!86153) Bool)

(assert (=> start!109644 (and (array_inv!31707 _values!1445) e!740004)))

(declare-fun array_inv!31708 (array!86151) Bool)

(assert (=> start!109644 (array_inv!31708 _keys!1741)))

(assert (=> start!109644 tp!101846))

(declare-fun b!1296793 () Bool)

(assert (=> b!1296793 (= e!740006 (not e!740002))))

(declare-fun res!861534 () Bool)

(assert (=> b!1296793 (=> res!861534 e!740002)))

(assert (=> b!1296793 (= res!861534 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296793 (not (contains!8150 (ListLongMap!20008 Nil!29506) k0!1205))))

(declare-fun lt!580395 () Unit!42869)

(declare-fun emptyContainsNothing!177 ((_ BitVec 64)) Unit!42869)

(assert (=> b!1296793 (= lt!580395 (emptyContainsNothing!177 k0!1205))))

(declare-fun mapNonEmpty!53384 () Bool)

(declare-fun mapRes!53384 () Bool)

(declare-fun tp!101845 () Bool)

(declare-fun e!740007 () Bool)

(assert (=> mapNonEmpty!53384 (= mapRes!53384 (and tp!101845 e!740007))))

(declare-fun mapValue!53384 () ValueCell!16376)

(declare-fun mapRest!53384 () (Array (_ BitVec 32) ValueCell!16376))

(declare-fun mapKey!53384 () (_ BitVec 32))

(assert (=> mapNonEmpty!53384 (= (arr!41573 _values!1445) (store mapRest!53384 mapKey!53384 mapValue!53384))))

(declare-fun b!1296794 () Bool)

(declare-fun res!861535 () Bool)

(assert (=> b!1296794 (=> (not res!861535) (not e!740006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86151 (_ BitVec 32)) Bool)

(assert (=> b!1296794 (= res!861535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296795 () Bool)

(declare-fun res!861537 () Bool)

(assert (=> b!1296795 (=> (not res!861537) (not e!740006))))

(declare-datatypes ((List!29510 0))(
  ( (Nil!29507) (Cons!29506 (h!30724 (_ BitVec 64)) (t!43066 List!29510)) )
))
(declare-fun arrayNoDuplicates!0 (array!86151 (_ BitVec 32) List!29510) Bool)

(assert (=> b!1296795 (= res!861537 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29507))))

(declare-fun b!1296796 () Bool)

(declare-fun res!861536 () Bool)

(assert (=> b!1296796 (=> (not res!861536) (not e!740006))))

(assert (=> b!1296796 (= res!861536 (and (= (size!42124 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42123 _keys!1741) (size!42124 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296797 () Bool)

(assert (=> b!1296797 (= e!740004 (and e!740005 mapRes!53384))))

(declare-fun condMapEmpty!53384 () Bool)

(declare-fun mapDefault!53384 () ValueCell!16376)

(assert (=> b!1296797 (= condMapEmpty!53384 (= (arr!41573 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16376)) mapDefault!53384)))))

(declare-fun mapIsEmpty!53384 () Bool)

(assert (=> mapIsEmpty!53384 mapRes!53384))

(declare-fun b!1296798 () Bool)

(assert (=> b!1296798 (= e!740007 tp_is_empty!34549)))

(declare-fun b!1296799 () Bool)

(declare-fun res!861531 () Bool)

(assert (=> b!1296799 (=> (not res!861531) (not e!740006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296799 (= res!861531 (not (validKeyInArray!0 (select (arr!41572 _keys!1741) from!2144))))))

(assert (= (and start!109644 res!861533) b!1296796))

(assert (= (and b!1296796 res!861536) b!1296794))

(assert (= (and b!1296794 res!861535) b!1296795))

(assert (= (and b!1296795 res!861537) b!1296791))

(assert (= (and b!1296791 res!861532) b!1296790))

(assert (= (and b!1296790 res!861530) b!1296788))

(assert (= (and b!1296788 res!861538) b!1296799))

(assert (= (and b!1296799 res!861531) b!1296793))

(assert (= (and b!1296793 (not res!861534)) b!1296789))

(assert (= (and b!1296797 condMapEmpty!53384) mapIsEmpty!53384))

(assert (= (and b!1296797 (not condMapEmpty!53384)) mapNonEmpty!53384))

(get-info :version)

(assert (= (and mapNonEmpty!53384 ((_ is ValueCellFull!16376) mapValue!53384)) b!1296798))

(assert (= (and b!1296797 ((_ is ValueCellFull!16376) mapDefault!53384)) b!1296792))

(assert (= start!109644 b!1296797))

(declare-fun m!1189113 () Bool)

(assert (=> b!1296799 m!1189113))

(assert (=> b!1296799 m!1189113))

(declare-fun m!1189115 () Bool)

(assert (=> b!1296799 m!1189115))

(declare-fun m!1189117 () Bool)

(assert (=> b!1296789 m!1189117))

(assert (=> b!1296789 m!1189117))

(declare-fun m!1189119 () Bool)

(assert (=> b!1296789 m!1189119))

(declare-fun m!1189121 () Bool)

(assert (=> b!1296789 m!1189121))

(declare-fun m!1189123 () Bool)

(assert (=> b!1296789 m!1189123))

(declare-fun m!1189125 () Bool)

(assert (=> b!1296793 m!1189125))

(declare-fun m!1189127 () Bool)

(assert (=> b!1296793 m!1189127))

(declare-fun m!1189129 () Bool)

(assert (=> b!1296794 m!1189129))

(declare-fun m!1189131 () Bool)

(assert (=> b!1296795 m!1189131))

(declare-fun m!1189133 () Bool)

(assert (=> start!109644 m!1189133))

(declare-fun m!1189135 () Bool)

(assert (=> start!109644 m!1189135))

(declare-fun m!1189137 () Bool)

(assert (=> start!109644 m!1189137))

(declare-fun m!1189139 () Bool)

(assert (=> mapNonEmpty!53384 m!1189139))

(declare-fun m!1189141 () Bool)

(assert (=> b!1296790 m!1189141))

(assert (=> b!1296790 m!1189141))

(declare-fun m!1189143 () Bool)

(assert (=> b!1296790 m!1189143))

(check-sat (not b_next!28909) (not b!1296789) tp_is_empty!34549 (not b!1296799) (not b!1296790) (not b!1296795) (not mapNonEmpty!53384) b_and!47001 (not b!1296793) (not b!1296794) (not start!109644))
(check-sat b_and!47001 (not b_next!28909))

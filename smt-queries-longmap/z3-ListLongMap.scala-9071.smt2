; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109210 () Bool)

(assert start!109210)

(declare-fun b_free!28699 () Bool)

(declare-fun b_next!28699 () Bool)

(assert (=> start!109210 (= b_free!28699 (not b_next!28699))))

(declare-fun tp!101216 () Bool)

(declare-fun b_and!46771 () Bool)

(assert (=> start!109210 (= tp!101216 b_and!46771)))

(declare-fun b!1291790 () Bool)

(declare-fun e!737390 () Bool)

(declare-fun e!737391 () Bool)

(declare-fun mapRes!53069 () Bool)

(assert (=> b!1291790 (= e!737390 (and e!737391 mapRes!53069))))

(declare-fun condMapEmpty!53069 () Bool)

(declare-datatypes ((V!50889 0))(
  ( (V!50890 (val!17244 Int)) )
))
(declare-datatypes ((ValueCell!16271 0))(
  ( (ValueCellFull!16271 (v!19846 V!50889)) (EmptyCell!16271) )
))
(declare-datatypes ((array!85595 0))(
  ( (array!85596 (arr!41299 (Array (_ BitVec 32) ValueCell!16271)) (size!41851 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85595)

(declare-fun mapDefault!53069 () ValueCell!16271)

(assert (=> b!1291790 (= condMapEmpty!53069 (= (arr!41299 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16271)) mapDefault!53069)))))

(declare-fun b!1291791 () Bool)

(declare-fun e!737388 () Bool)

(declare-fun tp_is_empty!34339 () Bool)

(assert (=> b!1291791 (= e!737388 tp_is_empty!34339)))

(declare-fun b!1291792 () Bool)

(declare-fun e!737387 () Bool)

(assert (=> b!1291792 (= e!737387 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22216 0))(
  ( (tuple2!22217 (_1!11119 (_ BitVec 64)) (_2!11119 V!50889)) )
))
(declare-datatypes ((List!29371 0))(
  ( (Nil!29368) (Cons!29367 (h!30576 tuple2!22216) (t!42927 List!29371)) )
))
(declare-datatypes ((ListLongMap!19873 0))(
  ( (ListLongMap!19874 (toList!9952 List!29371)) )
))
(declare-fun contains!8000 (ListLongMap!19873 (_ BitVec 64)) Bool)

(assert (=> b!1291792 (not (contains!8000 (ListLongMap!19874 Nil!29368) k0!1205))))

(declare-datatypes ((Unit!42596 0))(
  ( (Unit!42597) )
))
(declare-fun lt!579106 () Unit!42596)

(declare-fun emptyContainsNothing!95 ((_ BitVec 64)) Unit!42596)

(assert (=> b!1291792 (= lt!579106 (emptyContainsNothing!95 k0!1205))))

(declare-fun b!1291793 () Bool)

(declare-fun res!858304 () Bool)

(assert (=> b!1291793 (=> (not res!858304) (not e!737387))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85597 0))(
  ( (array!85598 (arr!41300 (Array (_ BitVec 32) (_ BitVec 64))) (size!41852 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85597)

(assert (=> b!1291793 (= res!858304 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41852 _keys!1741))))))

(declare-fun res!858303 () Bool)

(assert (=> start!109210 (=> (not res!858303) (not e!737387))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109210 (= res!858303 (validMask!0 mask!2175))))

(assert (=> start!109210 e!737387))

(assert (=> start!109210 tp_is_empty!34339))

(assert (=> start!109210 true))

(declare-fun array_inv!31455 (array!85595) Bool)

(assert (=> start!109210 (and (array_inv!31455 _values!1445) e!737390)))

(declare-fun array_inv!31456 (array!85597) Bool)

(assert (=> start!109210 (array_inv!31456 _keys!1741)))

(assert (=> start!109210 tp!101216))

(declare-fun b!1291794 () Bool)

(declare-fun res!858302 () Bool)

(assert (=> b!1291794 (=> (not res!858302) (not e!737387))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291794 (= res!858302 (and (= (size!41851 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41852 _keys!1741) (size!41851 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291795 () Bool)

(declare-fun res!858301 () Bool)

(assert (=> b!1291795 (=> (not res!858301) (not e!737387))))

(assert (=> b!1291795 (= res!858301 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41852 _keys!1741))))))

(declare-fun b!1291796 () Bool)

(declare-fun res!858306 () Bool)

(assert (=> b!1291796 (=> (not res!858306) (not e!737387))))

(declare-datatypes ((List!29372 0))(
  ( (Nil!29369) (Cons!29368 (h!30577 (_ BitVec 64)) (t!42928 List!29372)) )
))
(declare-fun arrayNoDuplicates!0 (array!85597 (_ BitVec 32) List!29372) Bool)

(assert (=> b!1291796 (= res!858306 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29369))))

(declare-fun mapIsEmpty!53069 () Bool)

(assert (=> mapIsEmpty!53069 mapRes!53069))

(declare-fun mapNonEmpty!53069 () Bool)

(declare-fun tp!101217 () Bool)

(assert (=> mapNonEmpty!53069 (= mapRes!53069 (and tp!101217 e!737388))))

(declare-fun mapValue!53069 () ValueCell!16271)

(declare-fun mapRest!53069 () (Array (_ BitVec 32) ValueCell!16271))

(declare-fun mapKey!53069 () (_ BitVec 32))

(assert (=> mapNonEmpty!53069 (= (arr!41299 _values!1445) (store mapRest!53069 mapKey!53069 mapValue!53069))))

(declare-fun b!1291797 () Bool)

(declare-fun res!858299 () Bool)

(assert (=> b!1291797 (=> (not res!858299) (not e!737387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291797 (= res!858299 (not (validKeyInArray!0 (select (arr!41300 _keys!1741) from!2144))))))

(declare-fun b!1291798 () Bool)

(declare-fun res!858305 () Bool)

(assert (=> b!1291798 (=> (not res!858305) (not e!737387))))

(declare-fun minValue!1387 () V!50889)

(declare-fun zeroValue!1387 () V!50889)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4897 (array!85597 array!85595 (_ BitVec 32) (_ BitVec 32) V!50889 V!50889 (_ BitVec 32) Int) ListLongMap!19873)

(assert (=> b!1291798 (= res!858305 (contains!8000 (getCurrentListMap!4897 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291799 () Bool)

(declare-fun res!858300 () Bool)

(assert (=> b!1291799 (=> (not res!858300) (not e!737387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85597 (_ BitVec 32)) Bool)

(assert (=> b!1291799 (= res!858300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291800 () Bool)

(assert (=> b!1291800 (= e!737391 tp_is_empty!34339)))

(assert (= (and start!109210 res!858303) b!1291794))

(assert (= (and b!1291794 res!858302) b!1291799))

(assert (= (and b!1291799 res!858300) b!1291796))

(assert (= (and b!1291796 res!858306) b!1291795))

(assert (= (and b!1291795 res!858301) b!1291798))

(assert (= (and b!1291798 res!858305) b!1291793))

(assert (= (and b!1291793 res!858304) b!1291797))

(assert (= (and b!1291797 res!858299) b!1291792))

(assert (= (and b!1291790 condMapEmpty!53069) mapIsEmpty!53069))

(assert (= (and b!1291790 (not condMapEmpty!53069)) mapNonEmpty!53069))

(get-info :version)

(assert (= (and mapNonEmpty!53069 ((_ is ValueCellFull!16271) mapValue!53069)) b!1291791))

(assert (= (and b!1291790 ((_ is ValueCellFull!16271) mapDefault!53069)) b!1291800))

(assert (= start!109210 b!1291790))

(declare-fun m!1184067 () Bool)

(assert (=> b!1291796 m!1184067))

(declare-fun m!1184069 () Bool)

(assert (=> b!1291799 m!1184069))

(declare-fun m!1184071 () Bool)

(assert (=> mapNonEmpty!53069 m!1184071))

(declare-fun m!1184073 () Bool)

(assert (=> start!109210 m!1184073))

(declare-fun m!1184075 () Bool)

(assert (=> start!109210 m!1184075))

(declare-fun m!1184077 () Bool)

(assert (=> start!109210 m!1184077))

(declare-fun m!1184079 () Bool)

(assert (=> b!1291798 m!1184079))

(assert (=> b!1291798 m!1184079))

(declare-fun m!1184081 () Bool)

(assert (=> b!1291798 m!1184081))

(declare-fun m!1184083 () Bool)

(assert (=> b!1291792 m!1184083))

(declare-fun m!1184085 () Bool)

(assert (=> b!1291792 m!1184085))

(declare-fun m!1184087 () Bool)

(assert (=> b!1291797 m!1184087))

(assert (=> b!1291797 m!1184087))

(declare-fun m!1184089 () Bool)

(assert (=> b!1291797 m!1184089))

(check-sat (not b!1291796) (not start!109210) (not b!1291799) (not b!1291797) tp_is_empty!34339 (not b_next!28699) (not b!1291792) b_and!46771 (not mapNonEmpty!53069) (not b!1291798))
(check-sat b_and!46771 (not b_next!28699))

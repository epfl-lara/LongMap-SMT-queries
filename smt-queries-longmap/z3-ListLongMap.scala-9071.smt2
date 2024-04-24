; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109434 () Bool)

(assert start!109434)

(declare-fun b_free!28699 () Bool)

(declare-fun b_next!28699 () Bool)

(assert (=> start!109434 (= b_free!28699 (not b_next!28699))))

(declare-fun tp!101216 () Bool)

(declare-fun b_and!46791 () Bool)

(assert (=> start!109434 (= tp!101216 b_and!46791)))

(declare-fun b!1293159 () Bool)

(declare-fun e!738266 () Bool)

(declare-fun tp_is_empty!34339 () Bool)

(assert (=> b!1293159 (= e!738266 tp_is_empty!34339)))

(declare-fun b!1293160 () Bool)

(declare-fun e!738265 () Bool)

(assert (=> b!1293160 (= e!738265 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50889 0))(
  ( (V!50890 (val!17244 Int)) )
))
(declare-datatypes ((tuple2!22192 0))(
  ( (tuple2!22193 (_1!11107 (_ BitVec 64)) (_2!11107 V!50889)) )
))
(declare-datatypes ((List!29364 0))(
  ( (Nil!29361) (Cons!29360 (h!30578 tuple2!22192) (t!42920 List!29364)) )
))
(declare-datatypes ((ListLongMap!19857 0))(
  ( (ListLongMap!19858 (toList!9944 List!29364)) )
))
(declare-fun contains!8075 (ListLongMap!19857 (_ BitVec 64)) Bool)

(assert (=> b!1293160 (not (contains!8075 (ListLongMap!19858 Nil!29361) k0!1205))))

(declare-datatypes ((Unit!42733 0))(
  ( (Unit!42734) )
))
(declare-fun lt!579768 () Unit!42733)

(declare-fun emptyContainsNothing!112 ((_ BitVec 64)) Unit!42733)

(assert (=> b!1293160 (= lt!579768 (emptyContainsNothing!112 k0!1205))))

(declare-fun b!1293161 () Bool)

(declare-fun res!858852 () Bool)

(assert (=> b!1293161 (=> (not res!858852) (not e!738265))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85745 0))(
  ( (array!85746 (arr!41369 (Array (_ BitVec 32) (_ BitVec 64))) (size!41920 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85745)

(assert (=> b!1293161 (= res!858852 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41920 _keys!1741))))))

(declare-fun mapIsEmpty!53069 () Bool)

(declare-fun mapRes!53069 () Bool)

(assert (=> mapIsEmpty!53069 mapRes!53069))

(declare-fun b!1293162 () Bool)

(declare-fun res!858849 () Bool)

(assert (=> b!1293162 (=> (not res!858849) (not e!738265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293162 (= res!858849 (not (validKeyInArray!0 (select (arr!41369 _keys!1741) from!2144))))))

(declare-fun res!858850 () Bool)

(assert (=> start!109434 (=> (not res!858850) (not e!738265))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109434 (= res!858850 (validMask!0 mask!2175))))

(assert (=> start!109434 e!738265))

(assert (=> start!109434 tp_is_empty!34339))

(assert (=> start!109434 true))

(declare-datatypes ((ValueCell!16271 0))(
  ( (ValueCellFull!16271 (v!19842 V!50889)) (EmptyCell!16271) )
))
(declare-datatypes ((array!85747 0))(
  ( (array!85748 (arr!41370 (Array (_ BitVec 32) ValueCell!16271)) (size!41921 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85747)

(declare-fun e!738263 () Bool)

(declare-fun array_inv!31575 (array!85747) Bool)

(assert (=> start!109434 (and (array_inv!31575 _values!1445) e!738263)))

(declare-fun array_inv!31576 (array!85745) Bool)

(assert (=> start!109434 (array_inv!31576 _keys!1741)))

(assert (=> start!109434 tp!101216))

(declare-fun b!1293163 () Bool)

(declare-fun res!858853 () Bool)

(assert (=> b!1293163 (=> (not res!858853) (not e!738265))))

(declare-datatypes ((List!29365 0))(
  ( (Nil!29362) (Cons!29361 (h!30579 (_ BitVec 64)) (t!42921 List!29365)) )
))
(declare-fun arrayNoDuplicates!0 (array!85745 (_ BitVec 32) List!29365) Bool)

(assert (=> b!1293163 (= res!858853 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29362))))

(declare-fun b!1293164 () Bool)

(declare-fun res!858851 () Bool)

(assert (=> b!1293164 (=> (not res!858851) (not e!738265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85745 (_ BitVec 32)) Bool)

(assert (=> b!1293164 (= res!858851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293165 () Bool)

(declare-fun res!858846 () Bool)

(assert (=> b!1293165 (=> (not res!858846) (not e!738265))))

(declare-fun minValue!1387 () V!50889)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!50889)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4977 (array!85745 array!85747 (_ BitVec 32) (_ BitVec 32) V!50889 V!50889 (_ BitVec 32) Int) ListLongMap!19857)

(assert (=> b!1293165 (= res!858846 (contains!8075 (getCurrentListMap!4977 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293166 () Bool)

(declare-fun res!858848 () Bool)

(assert (=> b!1293166 (=> (not res!858848) (not e!738265))))

(assert (=> b!1293166 (= res!858848 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41920 _keys!1741))))))

(declare-fun mapNonEmpty!53069 () Bool)

(declare-fun tp!101215 () Bool)

(assert (=> mapNonEmpty!53069 (= mapRes!53069 (and tp!101215 e!738266))))

(declare-fun mapRest!53069 () (Array (_ BitVec 32) ValueCell!16271))

(declare-fun mapKey!53069 () (_ BitVec 32))

(declare-fun mapValue!53069 () ValueCell!16271)

(assert (=> mapNonEmpty!53069 (= (arr!41370 _values!1445) (store mapRest!53069 mapKey!53069 mapValue!53069))))

(declare-fun b!1293167 () Bool)

(declare-fun e!738267 () Bool)

(assert (=> b!1293167 (= e!738267 tp_is_empty!34339)))

(declare-fun b!1293168 () Bool)

(assert (=> b!1293168 (= e!738263 (and e!738267 mapRes!53069))))

(declare-fun condMapEmpty!53069 () Bool)

(declare-fun mapDefault!53069 () ValueCell!16271)

(assert (=> b!1293168 (= condMapEmpty!53069 (= (arr!41370 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16271)) mapDefault!53069)))))

(declare-fun b!1293169 () Bool)

(declare-fun res!858847 () Bool)

(assert (=> b!1293169 (=> (not res!858847) (not e!738265))))

(assert (=> b!1293169 (= res!858847 (and (= (size!41921 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41920 _keys!1741) (size!41921 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109434 res!858850) b!1293169))

(assert (= (and b!1293169 res!858847) b!1293164))

(assert (= (and b!1293164 res!858851) b!1293163))

(assert (= (and b!1293163 res!858853) b!1293161))

(assert (= (and b!1293161 res!858852) b!1293165))

(assert (= (and b!1293165 res!858846) b!1293166))

(assert (= (and b!1293166 res!858848) b!1293162))

(assert (= (and b!1293162 res!858849) b!1293160))

(assert (= (and b!1293168 condMapEmpty!53069) mapIsEmpty!53069))

(assert (= (and b!1293168 (not condMapEmpty!53069)) mapNonEmpty!53069))

(get-info :version)

(assert (= (and mapNonEmpty!53069 ((_ is ValueCellFull!16271) mapValue!53069)) b!1293159))

(assert (= (and b!1293168 ((_ is ValueCellFull!16271) mapDefault!53069)) b!1293167))

(assert (= start!109434 b!1293168))

(declare-fun m!1186185 () Bool)

(assert (=> b!1293165 m!1186185))

(assert (=> b!1293165 m!1186185))

(declare-fun m!1186187 () Bool)

(assert (=> b!1293165 m!1186187))

(declare-fun m!1186189 () Bool)

(assert (=> start!109434 m!1186189))

(declare-fun m!1186191 () Bool)

(assert (=> start!109434 m!1186191))

(declare-fun m!1186193 () Bool)

(assert (=> start!109434 m!1186193))

(declare-fun m!1186195 () Bool)

(assert (=> b!1293162 m!1186195))

(assert (=> b!1293162 m!1186195))

(declare-fun m!1186197 () Bool)

(assert (=> b!1293162 m!1186197))

(declare-fun m!1186199 () Bool)

(assert (=> mapNonEmpty!53069 m!1186199))

(declare-fun m!1186201 () Bool)

(assert (=> b!1293164 m!1186201))

(declare-fun m!1186203 () Bool)

(assert (=> b!1293163 m!1186203))

(declare-fun m!1186205 () Bool)

(assert (=> b!1293160 m!1186205))

(declare-fun m!1186207 () Bool)

(assert (=> b!1293160 m!1186207))

(check-sat b_and!46791 (not start!109434) tp_is_empty!34339 (not b!1293164) (not mapNonEmpty!53069) (not b!1293162) (not b_next!28699) (not b!1293165) (not b!1293163) (not b!1293160))
(check-sat b_and!46791 (not b_next!28699))

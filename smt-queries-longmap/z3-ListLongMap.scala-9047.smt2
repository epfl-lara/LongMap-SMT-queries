; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109068 () Bool)

(assert start!109068)

(declare-fun b_free!28557 () Bool)

(declare-fun b_next!28557 () Bool)

(assert (=> start!109068 (= b_free!28557 (not b_next!28557))))

(declare-fun tp!100789 () Bool)

(declare-fun b_and!46647 () Bool)

(assert (=> start!109068 (= tp!100789 b_and!46647)))

(declare-fun mapNonEmpty!52856 () Bool)

(declare-fun mapRes!52856 () Bool)

(declare-fun tp!100790 () Bool)

(declare-fun e!736154 () Bool)

(assert (=> mapNonEmpty!52856 (= mapRes!52856 (and tp!100790 e!736154))))

(declare-datatypes ((V!50699 0))(
  ( (V!50700 (val!17173 Int)) )
))
(declare-datatypes ((ValueCell!16200 0))(
  ( (ValueCellFull!16200 (v!19776 V!50699)) (EmptyCell!16200) )
))
(declare-fun mapRest!52856 () (Array (_ BitVec 32) ValueCell!16200))

(declare-datatypes ((array!85436 0))(
  ( (array!85437 (arr!41219 (Array (_ BitVec 32) ValueCell!16200)) (size!41769 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85436)

(declare-fun mapValue!52856 () ValueCell!16200)

(declare-fun mapKey!52856 () (_ BitVec 32))

(assert (=> mapNonEmpty!52856 (= (arr!41219 _values!1445) (store mapRest!52856 mapKey!52856 mapValue!52856))))

(declare-fun b!1289309 () Bool)

(declare-fun e!736150 () Bool)

(declare-fun e!736153 () Bool)

(assert (=> b!1289309 (= e!736150 (not e!736153))))

(declare-fun res!856420 () Bool)

(assert (=> b!1289309 (=> res!856420 e!736153)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289309 (= res!856420 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22056 0))(
  ( (tuple2!22057 (_1!11039 (_ BitVec 64)) (_2!11039 V!50699)) )
))
(declare-datatypes ((List!29225 0))(
  ( (Nil!29222) (Cons!29221 (h!30430 tuple2!22056) (t!42789 List!29225)) )
))
(declare-datatypes ((ListLongMap!19713 0))(
  ( (ListLongMap!19714 (toList!9872 List!29225)) )
))
(declare-fun contains!7990 (ListLongMap!19713 (_ BitVec 64)) Bool)

(assert (=> b!1289309 (not (contains!7990 (ListLongMap!19714 Nil!29222) k0!1205))))

(declare-datatypes ((Unit!42662 0))(
  ( (Unit!42663) )
))
(declare-fun lt!578216 () Unit!42662)

(declare-fun emptyContainsNothing!59 ((_ BitVec 64)) Unit!42662)

(assert (=> b!1289309 (= lt!578216 (emptyContainsNothing!59 k0!1205))))

(declare-fun b!1289310 () Bool)

(declare-fun res!856425 () Bool)

(assert (=> b!1289310 (=> (not res!856425) (not e!736150))))

(declare-fun minValue!1387 () V!50699)

(declare-fun zeroValue!1387 () V!50699)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85438 0))(
  ( (array!85439 (arr!41220 (Array (_ BitVec 32) (_ BitVec 64))) (size!41770 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85438)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4932 (array!85438 array!85436 (_ BitVec 32) (_ BitVec 32) V!50699 V!50699 (_ BitVec 32) Int) ListLongMap!19713)

(assert (=> b!1289310 (= res!856425 (contains!7990 (getCurrentListMap!4932 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289311 () Bool)

(assert (=> b!1289311 (= e!736153 true)))

(declare-fun lt!578215 () Bool)

(declare-fun lt!578213 () ListLongMap!19713)

(assert (=> b!1289311 (= lt!578215 (contains!7990 lt!578213 k0!1205))))

(declare-fun +!4344 (ListLongMap!19713 tuple2!22056) ListLongMap!19713)

(assert (=> b!1289311 (not (contains!7990 (+!4344 lt!578213 (tuple2!22057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578214 () Unit!42662)

(declare-fun addStillNotContains!362 (ListLongMap!19713 (_ BitVec 64) V!50699 (_ BitVec 64)) Unit!42662)

(assert (=> b!1289311 (= lt!578214 (addStillNotContains!362 lt!578213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5975 (array!85438 array!85436 (_ BitVec 32) (_ BitVec 32) V!50699 V!50699 (_ BitVec 32) Int) ListLongMap!19713)

(assert (=> b!1289311 (= lt!578213 (getCurrentListMapNoExtraKeys!5975 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289312 () Bool)

(declare-fun res!856428 () Bool)

(assert (=> b!1289312 (=> (not res!856428) (not e!736150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289312 (= res!856428 (not (validKeyInArray!0 (select (arr!41220 _keys!1741) from!2144))))))

(declare-fun b!1289313 () Bool)

(declare-fun tp_is_empty!34197 () Bool)

(assert (=> b!1289313 (= e!736154 tp_is_empty!34197)))

(declare-fun b!1289314 () Bool)

(declare-fun e!736149 () Bool)

(declare-fun e!736151 () Bool)

(assert (=> b!1289314 (= e!736149 (and e!736151 mapRes!52856))))

(declare-fun condMapEmpty!52856 () Bool)

(declare-fun mapDefault!52856 () ValueCell!16200)

(assert (=> b!1289314 (= condMapEmpty!52856 (= (arr!41219 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16200)) mapDefault!52856)))))

(declare-fun b!1289315 () Bool)

(declare-fun res!856427 () Bool)

(assert (=> b!1289315 (=> (not res!856427) (not e!736150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85438 (_ BitVec 32)) Bool)

(assert (=> b!1289315 (= res!856427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289316 () Bool)

(declare-fun res!856422 () Bool)

(assert (=> b!1289316 (=> (not res!856422) (not e!736150))))

(assert (=> b!1289316 (= res!856422 (and (= (size!41769 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41770 _keys!1741) (size!41769 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289317 () Bool)

(declare-fun res!856424 () Bool)

(assert (=> b!1289317 (=> (not res!856424) (not e!736150))))

(declare-datatypes ((List!29226 0))(
  ( (Nil!29223) (Cons!29222 (h!30431 (_ BitVec 64)) (t!42790 List!29226)) )
))
(declare-fun arrayNoDuplicates!0 (array!85438 (_ BitVec 32) List!29226) Bool)

(assert (=> b!1289317 (= res!856424 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29223))))

(declare-fun b!1289318 () Bool)

(declare-fun res!856421 () Bool)

(assert (=> b!1289318 (=> (not res!856421) (not e!736150))))

(assert (=> b!1289318 (= res!856421 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41770 _keys!1741))))))

(declare-fun b!1289319 () Bool)

(assert (=> b!1289319 (= e!736151 tp_is_empty!34197)))

(declare-fun b!1289320 () Bool)

(declare-fun res!856423 () Bool)

(assert (=> b!1289320 (=> (not res!856423) (not e!736150))))

(assert (=> b!1289320 (= res!856423 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41770 _keys!1741))))))

(declare-fun mapIsEmpty!52856 () Bool)

(assert (=> mapIsEmpty!52856 mapRes!52856))

(declare-fun res!856426 () Bool)

(assert (=> start!109068 (=> (not res!856426) (not e!736150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109068 (= res!856426 (validMask!0 mask!2175))))

(assert (=> start!109068 e!736150))

(assert (=> start!109068 tp_is_empty!34197))

(assert (=> start!109068 true))

(declare-fun array_inv!31245 (array!85436) Bool)

(assert (=> start!109068 (and (array_inv!31245 _values!1445) e!736149)))

(declare-fun array_inv!31246 (array!85438) Bool)

(assert (=> start!109068 (array_inv!31246 _keys!1741)))

(assert (=> start!109068 tp!100789))

(assert (= (and start!109068 res!856426) b!1289316))

(assert (= (and b!1289316 res!856422) b!1289315))

(assert (= (and b!1289315 res!856427) b!1289317))

(assert (= (and b!1289317 res!856424) b!1289320))

(assert (= (and b!1289320 res!856423) b!1289310))

(assert (= (and b!1289310 res!856425) b!1289318))

(assert (= (and b!1289318 res!856421) b!1289312))

(assert (= (and b!1289312 res!856428) b!1289309))

(assert (= (and b!1289309 (not res!856420)) b!1289311))

(assert (= (and b!1289314 condMapEmpty!52856) mapIsEmpty!52856))

(assert (= (and b!1289314 (not condMapEmpty!52856)) mapNonEmpty!52856))

(get-info :version)

(assert (= (and mapNonEmpty!52856 ((_ is ValueCellFull!16200) mapValue!52856)) b!1289313))

(assert (= (and b!1289314 ((_ is ValueCellFull!16200) mapDefault!52856)) b!1289319))

(assert (= start!109068 b!1289314))

(declare-fun m!1181829 () Bool)

(assert (=> b!1289310 m!1181829))

(assert (=> b!1289310 m!1181829))

(declare-fun m!1181831 () Bool)

(assert (=> b!1289310 m!1181831))

(declare-fun m!1181833 () Bool)

(assert (=> start!109068 m!1181833))

(declare-fun m!1181835 () Bool)

(assert (=> start!109068 m!1181835))

(declare-fun m!1181837 () Bool)

(assert (=> start!109068 m!1181837))

(declare-fun m!1181839 () Bool)

(assert (=> b!1289315 m!1181839))

(declare-fun m!1181841 () Bool)

(assert (=> b!1289312 m!1181841))

(assert (=> b!1289312 m!1181841))

(declare-fun m!1181843 () Bool)

(assert (=> b!1289312 m!1181843))

(declare-fun m!1181845 () Bool)

(assert (=> b!1289317 m!1181845))

(declare-fun m!1181847 () Bool)

(assert (=> mapNonEmpty!52856 m!1181847))

(declare-fun m!1181849 () Bool)

(assert (=> b!1289311 m!1181849))

(declare-fun m!1181851 () Bool)

(assert (=> b!1289311 m!1181851))

(assert (=> b!1289311 m!1181849))

(declare-fun m!1181853 () Bool)

(assert (=> b!1289311 m!1181853))

(declare-fun m!1181855 () Bool)

(assert (=> b!1289311 m!1181855))

(declare-fun m!1181857 () Bool)

(assert (=> b!1289311 m!1181857))

(declare-fun m!1181859 () Bool)

(assert (=> b!1289309 m!1181859))

(declare-fun m!1181861 () Bool)

(assert (=> b!1289309 m!1181861))

(check-sat (not start!109068) (not b!1289311) (not b!1289309) (not b!1289317) tp_is_empty!34197 (not b!1289315) (not mapNonEmpty!52856) (not b!1289310) (not b!1289312) b_and!46647 (not b_next!28557))
(check-sat b_and!46647 (not b_next!28557))

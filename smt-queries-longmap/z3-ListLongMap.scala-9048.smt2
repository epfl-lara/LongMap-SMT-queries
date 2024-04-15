; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109072 () Bool)

(assert start!109072)

(declare-fun b_free!28561 () Bool)

(declare-fun b_next!28561 () Bool)

(assert (=> start!109072 (= b_free!28561 (not b_next!28561))))

(declare-fun tp!100803 () Bool)

(declare-fun b_and!46633 () Bool)

(assert (=> start!109072 (= tp!100803 b_and!46633)))

(declare-fun b!1289317 () Bool)

(declare-fun e!736158 () Bool)

(assert (=> b!1289317 (= e!736158 true)))

(declare-datatypes ((V!50705 0))(
  ( (V!50706 (val!17175 Int)) )
))
(declare-datatypes ((tuple2!22108 0))(
  ( (tuple2!22109 (_1!11065 (_ BitVec 64)) (_2!11065 V!50705)) )
))
(declare-datatypes ((List!29271 0))(
  ( (Nil!29268) (Cons!29267 (h!30476 tuple2!22108) (t!42827 List!29271)) )
))
(declare-datatypes ((ListLongMap!19765 0))(
  ( (ListLongMap!19766 (toList!9898 List!29271)) )
))
(declare-fun lt!578062 () ListLongMap!19765)

(declare-fun minValue!1387 () V!50705)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7946 (ListLongMap!19765 (_ BitVec 64)) Bool)

(declare-fun +!4385 (ListLongMap!19765 tuple2!22108) ListLongMap!19765)

(assert (=> b!1289317 (not (contains!7946 (+!4385 lt!578062 (tuple2!22109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42500 0))(
  ( (Unit!42501) )
))
(declare-fun lt!578061 () Unit!42500)

(declare-fun addStillNotContains!362 (ListLongMap!19765 (_ BitVec 64) V!50705 (_ BitVec 64)) Unit!42500)

(assert (=> b!1289317 (= lt!578061 (addStillNotContains!362 lt!578062 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50705)

(assert (=> b!1289317 (not (contains!7946 (+!4385 lt!578062 (tuple2!22109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578060 () Unit!42500)

(assert (=> b!1289317 (= lt!578060 (addStillNotContains!362 lt!578062 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16202 0))(
  ( (ValueCellFull!16202 (v!19777 V!50705)) (EmptyCell!16202) )
))
(declare-datatypes ((array!85331 0))(
  ( (array!85332 (arr!41167 (Array (_ BitVec 32) ValueCell!16202)) (size!41719 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85331)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85333 0))(
  ( (array!85334 (arr!41168 (Array (_ BitVec 32) (_ BitVec 64))) (size!41720 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85333)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6016 (array!85333 array!85331 (_ BitVec 32) (_ BitVec 32) V!50705 V!50705 (_ BitVec 32) Int) ListLongMap!19765)

(assert (=> b!1289317 (= lt!578062 (getCurrentListMapNoExtraKeys!6016 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52862 () Bool)

(declare-fun mapRes!52862 () Bool)

(assert (=> mapIsEmpty!52862 mapRes!52862))

(declare-fun b!1289318 () Bool)

(declare-fun res!856447 () Bool)

(declare-fun e!736157 () Bool)

(assert (=> b!1289318 (=> (not res!856447) (not e!736157))))

(assert (=> b!1289318 (= res!856447 (and (= (size!41719 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41720 _keys!1741) (size!41719 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289319 () Bool)

(declare-fun e!736161 () Bool)

(declare-fun tp_is_empty!34201 () Bool)

(assert (=> b!1289319 (= e!736161 tp_is_empty!34201)))

(declare-fun b!1289320 () Bool)

(declare-fun res!856453 () Bool)

(assert (=> b!1289320 (=> (not res!856453) (not e!736157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85333 (_ BitVec 32)) Bool)

(assert (=> b!1289320 (= res!856453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289321 () Bool)

(declare-fun res!856455 () Bool)

(assert (=> b!1289321 (=> (not res!856455) (not e!736157))))

(declare-datatypes ((List!29272 0))(
  ( (Nil!29269) (Cons!29268 (h!30477 (_ BitVec 64)) (t!42828 List!29272)) )
))
(declare-fun arrayNoDuplicates!0 (array!85333 (_ BitVec 32) List!29272) Bool)

(assert (=> b!1289321 (= res!856455 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29269))))

(declare-fun res!856448 () Bool)

(assert (=> start!109072 (=> (not res!856448) (not e!736157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109072 (= res!856448 (validMask!0 mask!2175))))

(assert (=> start!109072 e!736157))

(assert (=> start!109072 tp_is_empty!34201))

(assert (=> start!109072 true))

(declare-fun e!736159 () Bool)

(declare-fun array_inv!31369 (array!85331) Bool)

(assert (=> start!109072 (and (array_inv!31369 _values!1445) e!736159)))

(declare-fun array_inv!31370 (array!85333) Bool)

(assert (=> start!109072 (array_inv!31370 _keys!1741)))

(assert (=> start!109072 tp!100803))

(declare-fun b!1289322 () Bool)

(declare-fun res!856450 () Bool)

(assert (=> b!1289322 (=> (not res!856450) (not e!736157))))

(assert (=> b!1289322 (= res!856450 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41720 _keys!1741))))))

(declare-fun b!1289323 () Bool)

(declare-fun res!856454 () Bool)

(assert (=> b!1289323 (=> (not res!856454) (not e!736157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289323 (= res!856454 (not (validKeyInArray!0 (select (arr!41168 _keys!1741) from!2144))))))

(declare-fun b!1289324 () Bool)

(assert (=> b!1289324 (= e!736157 (not e!736158))))

(declare-fun res!856452 () Bool)

(assert (=> b!1289324 (=> res!856452 e!736158)))

(assert (=> b!1289324 (= res!856452 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289324 (not (contains!7946 (ListLongMap!19766 Nil!29268) k0!1205))))

(declare-fun lt!578059 () Unit!42500)

(declare-fun emptyContainsNothing!51 ((_ BitVec 64)) Unit!42500)

(assert (=> b!1289324 (= lt!578059 (emptyContainsNothing!51 k0!1205))))

(declare-fun b!1289325 () Bool)

(assert (=> b!1289325 (= e!736159 (and e!736161 mapRes!52862))))

(declare-fun condMapEmpty!52862 () Bool)

(declare-fun mapDefault!52862 () ValueCell!16202)

(assert (=> b!1289325 (= condMapEmpty!52862 (= (arr!41167 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16202)) mapDefault!52862)))))

(declare-fun b!1289326 () Bool)

(declare-fun res!856449 () Bool)

(assert (=> b!1289326 (=> (not res!856449) (not e!736157))))

(declare-fun getCurrentListMap!4850 (array!85333 array!85331 (_ BitVec 32) (_ BitVec 32) V!50705 V!50705 (_ BitVec 32) Int) ListLongMap!19765)

(assert (=> b!1289326 (= res!856449 (contains!7946 (getCurrentListMap!4850 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52862 () Bool)

(declare-fun tp!100802 () Bool)

(declare-fun e!736156 () Bool)

(assert (=> mapNonEmpty!52862 (= mapRes!52862 (and tp!100802 e!736156))))

(declare-fun mapKey!52862 () (_ BitVec 32))

(declare-fun mapRest!52862 () (Array (_ BitVec 32) ValueCell!16202))

(declare-fun mapValue!52862 () ValueCell!16202)

(assert (=> mapNonEmpty!52862 (= (arr!41167 _values!1445) (store mapRest!52862 mapKey!52862 mapValue!52862))))

(declare-fun b!1289327 () Bool)

(assert (=> b!1289327 (= e!736156 tp_is_empty!34201)))

(declare-fun b!1289328 () Bool)

(declare-fun res!856451 () Bool)

(assert (=> b!1289328 (=> (not res!856451) (not e!736157))))

(assert (=> b!1289328 (= res!856451 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41720 _keys!1741))))))

(assert (= (and start!109072 res!856448) b!1289318))

(assert (= (and b!1289318 res!856447) b!1289320))

(assert (= (and b!1289320 res!856453) b!1289321))

(assert (= (and b!1289321 res!856455) b!1289322))

(assert (= (and b!1289322 res!856450) b!1289326))

(assert (= (and b!1289326 res!856449) b!1289328))

(assert (= (and b!1289328 res!856451) b!1289323))

(assert (= (and b!1289323 res!856454) b!1289324))

(assert (= (and b!1289324 (not res!856452)) b!1289317))

(assert (= (and b!1289325 condMapEmpty!52862) mapIsEmpty!52862))

(assert (= (and b!1289325 (not condMapEmpty!52862)) mapNonEmpty!52862))

(get-info :version)

(assert (= (and mapNonEmpty!52862 ((_ is ValueCellFull!16202) mapValue!52862)) b!1289327))

(assert (= (and b!1289325 ((_ is ValueCellFull!16202) mapDefault!52862)) b!1289319))

(assert (= start!109072 b!1289325))

(declare-fun m!1181397 () Bool)

(assert (=> b!1289323 m!1181397))

(assert (=> b!1289323 m!1181397))

(declare-fun m!1181399 () Bool)

(assert (=> b!1289323 m!1181399))

(declare-fun m!1181401 () Bool)

(assert (=> mapNonEmpty!52862 m!1181401))

(declare-fun m!1181403 () Bool)

(assert (=> b!1289321 m!1181403))

(declare-fun m!1181405 () Bool)

(assert (=> b!1289324 m!1181405))

(declare-fun m!1181407 () Bool)

(assert (=> b!1289324 m!1181407))

(declare-fun m!1181409 () Bool)

(assert (=> start!109072 m!1181409))

(declare-fun m!1181411 () Bool)

(assert (=> start!109072 m!1181411))

(declare-fun m!1181413 () Bool)

(assert (=> start!109072 m!1181413))

(declare-fun m!1181415 () Bool)

(assert (=> b!1289317 m!1181415))

(declare-fun m!1181417 () Bool)

(assert (=> b!1289317 m!1181417))

(declare-fun m!1181419 () Bool)

(assert (=> b!1289317 m!1181419))

(declare-fun m!1181421 () Bool)

(assert (=> b!1289317 m!1181421))

(assert (=> b!1289317 m!1181419))

(declare-fun m!1181423 () Bool)

(assert (=> b!1289317 m!1181423))

(declare-fun m!1181425 () Bool)

(assert (=> b!1289317 m!1181425))

(assert (=> b!1289317 m!1181415))

(declare-fun m!1181427 () Bool)

(assert (=> b!1289317 m!1181427))

(declare-fun m!1181429 () Bool)

(assert (=> b!1289320 m!1181429))

(declare-fun m!1181431 () Bool)

(assert (=> b!1289326 m!1181431))

(assert (=> b!1289326 m!1181431))

(declare-fun m!1181433 () Bool)

(assert (=> b!1289326 m!1181433))

(check-sat b_and!46633 (not b_next!28561) tp_is_empty!34201 (not b!1289320) (not mapNonEmpty!52862) (not b!1289317) (not b!1289323) (not b!1289324) (not b!1289326) (not start!109072) (not b!1289321))
(check-sat b_and!46633 (not b_next!28561))

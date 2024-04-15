; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109300 () Bool)

(assert start!109300)

(declare-fun b_free!28789 () Bool)

(declare-fun b_next!28789 () Bool)

(assert (=> start!109300 (= b_free!28789 (not b_next!28789))))

(declare-fun tp!101487 () Bool)

(declare-fun b_and!46861 () Bool)

(assert (=> start!109300 (= tp!101487 b_and!46861)))

(declare-fun b!1293340 () Bool)

(declare-fun e!738129 () Bool)

(declare-fun e!738127 () Bool)

(assert (=> b!1293340 (= e!738129 (not e!738127))))

(declare-fun res!859447 () Bool)

(assert (=> b!1293340 (=> res!859447 e!738127)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293340 (= res!859447 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51009 0))(
  ( (V!51010 (val!17289 Int)) )
))
(declare-datatypes ((tuple2!22288 0))(
  ( (tuple2!22289 (_1!11155 (_ BitVec 64)) (_2!11155 V!51009)) )
))
(declare-datatypes ((List!29437 0))(
  ( (Nil!29434) (Cons!29433 (h!30642 tuple2!22288) (t!42993 List!29437)) )
))
(declare-datatypes ((ListLongMap!19945 0))(
  ( (ListLongMap!19946 (toList!9988 List!29437)) )
))
(declare-fun contains!8036 (ListLongMap!19945 (_ BitVec 64)) Bool)

(assert (=> b!1293340 (not (contains!8036 (ListLongMap!19946 Nil!29434) k0!1205))))

(declare-datatypes ((Unit!42656 0))(
  ( (Unit!42657) )
))
(declare-fun lt!579363 () Unit!42656)

(declare-fun emptyContainsNothing!122 ((_ BitVec 64)) Unit!42656)

(assert (=> b!1293340 (= lt!579363 (emptyContainsNothing!122 k0!1205))))

(declare-fun mapNonEmpty!53204 () Bool)

(declare-fun mapRes!53204 () Bool)

(declare-fun tp!101486 () Bool)

(declare-fun e!738132 () Bool)

(assert (=> mapNonEmpty!53204 (= mapRes!53204 (and tp!101486 e!738132))))

(declare-datatypes ((ValueCell!16316 0))(
  ( (ValueCellFull!16316 (v!19891 V!51009)) (EmptyCell!16316) )
))
(declare-fun mapRest!53204 () (Array (_ BitVec 32) ValueCell!16316))

(declare-fun mapKey!53204 () (_ BitVec 32))

(declare-fun mapValue!53204 () ValueCell!16316)

(declare-datatypes ((array!85773 0))(
  ( (array!85774 (arr!41388 (Array (_ BitVec 32) ValueCell!16316)) (size!41940 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85773)

(assert (=> mapNonEmpty!53204 (= (arr!41388 _values!1445) (store mapRest!53204 mapKey!53204 mapValue!53204))))

(declare-fun b!1293341 () Bool)

(declare-fun res!859448 () Bool)

(assert (=> b!1293341 (=> (not res!859448) (not e!738129))))

(declare-fun minValue!1387 () V!51009)

(declare-fun zeroValue!1387 () V!51009)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85775 0))(
  ( (array!85776 (arr!41389 (Array (_ BitVec 32) (_ BitVec 64))) (size!41941 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85775)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4925 (array!85775 array!85773 (_ BitVec 32) (_ BitVec 32) V!51009 V!51009 (_ BitVec 32) Int) ListLongMap!19945)

(assert (=> b!1293341 (= res!859448 (contains!8036 (getCurrentListMap!4925 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293343 () Bool)

(declare-fun res!859451 () Bool)

(assert (=> b!1293343 (=> (not res!859451) (not e!738129))))

(assert (=> b!1293343 (= res!859451 (and (= (size!41940 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41941 _keys!1741) (size!41940 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293344 () Bool)

(declare-fun res!859445 () Bool)

(assert (=> b!1293344 (=> (not res!859445) (not e!738129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85775 (_ BitVec 32)) Bool)

(assert (=> b!1293344 (= res!859445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293345 () Bool)

(assert (=> b!1293345 (= e!738127 true)))

(declare-fun lt!579362 () ListLongMap!19945)

(declare-fun +!4436 (ListLongMap!19945 tuple2!22288) ListLongMap!19945)

(assert (=> b!1293345 (not (contains!8036 (+!4436 lt!579362 (tuple2!22289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579364 () Unit!42656)

(declare-fun addStillNotContains!413 (ListLongMap!19945 (_ BitVec 64) V!51009 (_ BitVec 64)) Unit!42656)

(assert (=> b!1293345 (= lt!579364 (addStillNotContains!413 lt!579362 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6068 (array!85775 array!85773 (_ BitVec 32) (_ BitVec 32) V!51009 V!51009 (_ BitVec 32) Int) ListLongMap!19945)

(assert (=> b!1293345 (= lt!579362 (getCurrentListMapNoExtraKeys!6068 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293346 () Bool)

(declare-fun res!859452 () Bool)

(assert (=> b!1293346 (=> (not res!859452) (not e!738129))))

(declare-datatypes ((List!29438 0))(
  ( (Nil!29435) (Cons!29434 (h!30643 (_ BitVec 64)) (t!42994 List!29438)) )
))
(declare-fun arrayNoDuplicates!0 (array!85775 (_ BitVec 32) List!29438) Bool)

(assert (=> b!1293346 (= res!859452 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29435))))

(declare-fun b!1293347 () Bool)

(declare-fun tp_is_empty!34429 () Bool)

(assert (=> b!1293347 (= e!738132 tp_is_empty!34429)))

(declare-fun mapIsEmpty!53204 () Bool)

(assert (=> mapIsEmpty!53204 mapRes!53204))

(declare-fun b!1293348 () Bool)

(declare-fun e!738130 () Bool)

(declare-fun e!738131 () Bool)

(assert (=> b!1293348 (= e!738130 (and e!738131 mapRes!53204))))

(declare-fun condMapEmpty!53204 () Bool)

(declare-fun mapDefault!53204 () ValueCell!16316)

(assert (=> b!1293348 (= condMapEmpty!53204 (= (arr!41388 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16316)) mapDefault!53204)))))

(declare-fun b!1293349 () Bool)

(declare-fun res!859450 () Bool)

(assert (=> b!1293349 (=> (not res!859450) (not e!738129))))

(assert (=> b!1293349 (= res!859450 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41941 _keys!1741))))))

(declare-fun res!859449 () Bool)

(assert (=> start!109300 (=> (not res!859449) (not e!738129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109300 (= res!859449 (validMask!0 mask!2175))))

(assert (=> start!109300 e!738129))

(assert (=> start!109300 tp_is_empty!34429))

(assert (=> start!109300 true))

(declare-fun array_inv!31515 (array!85773) Bool)

(assert (=> start!109300 (and (array_inv!31515 _values!1445) e!738130)))

(declare-fun array_inv!31516 (array!85775) Bool)

(assert (=> start!109300 (array_inv!31516 _keys!1741)))

(assert (=> start!109300 tp!101487))

(declare-fun b!1293342 () Bool)

(declare-fun res!859446 () Bool)

(assert (=> b!1293342 (=> (not res!859446) (not e!738129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293342 (= res!859446 (not (validKeyInArray!0 (select (arr!41389 _keys!1741) from!2144))))))

(declare-fun b!1293350 () Bool)

(declare-fun res!859444 () Bool)

(assert (=> b!1293350 (=> (not res!859444) (not e!738129))))

(assert (=> b!1293350 (= res!859444 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41941 _keys!1741))))))

(declare-fun b!1293351 () Bool)

(assert (=> b!1293351 (= e!738131 tp_is_empty!34429)))

(assert (= (and start!109300 res!859449) b!1293343))

(assert (= (and b!1293343 res!859451) b!1293344))

(assert (= (and b!1293344 res!859445) b!1293346))

(assert (= (and b!1293346 res!859452) b!1293350))

(assert (= (and b!1293350 res!859444) b!1293341))

(assert (= (and b!1293341 res!859448) b!1293349))

(assert (= (and b!1293349 res!859450) b!1293342))

(assert (= (and b!1293342 res!859446) b!1293340))

(assert (= (and b!1293340 (not res!859447)) b!1293345))

(assert (= (and b!1293348 condMapEmpty!53204) mapIsEmpty!53204))

(assert (= (and b!1293348 (not condMapEmpty!53204)) mapNonEmpty!53204))

(get-info :version)

(assert (= (and mapNonEmpty!53204 ((_ is ValueCellFull!16316) mapValue!53204)) b!1293347))

(assert (= (and b!1293348 ((_ is ValueCellFull!16316) mapDefault!53204)) b!1293351))

(assert (= start!109300 b!1293348))

(declare-fun m!1185303 () Bool)

(assert (=> b!1293342 m!1185303))

(assert (=> b!1293342 m!1185303))

(declare-fun m!1185305 () Bool)

(assert (=> b!1293342 m!1185305))

(declare-fun m!1185307 () Bool)

(assert (=> mapNonEmpty!53204 m!1185307))

(declare-fun m!1185309 () Bool)

(assert (=> b!1293340 m!1185309))

(declare-fun m!1185311 () Bool)

(assert (=> b!1293340 m!1185311))

(declare-fun m!1185313 () Bool)

(assert (=> start!109300 m!1185313))

(declare-fun m!1185315 () Bool)

(assert (=> start!109300 m!1185315))

(declare-fun m!1185317 () Bool)

(assert (=> start!109300 m!1185317))

(declare-fun m!1185319 () Bool)

(assert (=> b!1293346 m!1185319))

(declare-fun m!1185321 () Bool)

(assert (=> b!1293341 m!1185321))

(assert (=> b!1293341 m!1185321))

(declare-fun m!1185323 () Bool)

(assert (=> b!1293341 m!1185323))

(declare-fun m!1185325 () Bool)

(assert (=> b!1293344 m!1185325))

(declare-fun m!1185327 () Bool)

(assert (=> b!1293345 m!1185327))

(assert (=> b!1293345 m!1185327))

(declare-fun m!1185329 () Bool)

(assert (=> b!1293345 m!1185329))

(declare-fun m!1185331 () Bool)

(assert (=> b!1293345 m!1185331))

(declare-fun m!1185333 () Bool)

(assert (=> b!1293345 m!1185333))

(check-sat (not b!1293345) (not mapNonEmpty!53204) (not b!1293340) (not b!1293346) (not b!1293342) (not b!1293344) (not start!109300) (not b_next!28789) tp_is_empty!34429 (not b!1293341) b_and!46861)
(check-sat b_and!46861 (not b_next!28789))

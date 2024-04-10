; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108966 () Bool)

(assert start!108966)

(declare-fun b_free!28455 () Bool)

(declare-fun b_next!28455 () Bool)

(assert (=> start!108966 (= b_free!28455 (not b_next!28455))))

(declare-fun tp!100483 () Bool)

(declare-fun b_and!46545 () Bool)

(assert (=> start!108966 (= tp!100483 b_and!46545)))

(declare-fun b!1287531 () Bool)

(declare-fun e!735291 () Bool)

(assert (=> b!1287531 (= e!735291 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50563 0))(
  ( (V!50564 (val!17122 Int)) )
))
(declare-datatypes ((tuple2!21968 0))(
  ( (tuple2!21969 (_1!10995 (_ BitVec 64)) (_2!10995 V!50563)) )
))
(declare-datatypes ((List!29148 0))(
  ( (Nil!29145) (Cons!29144 (h!30353 tuple2!21968) (t!42712 List!29148)) )
))
(declare-datatypes ((ListLongMap!19625 0))(
  ( (ListLongMap!19626 (toList!9828 List!29148)) )
))
(declare-fun contains!7946 (ListLongMap!19625 (_ BitVec 64)) Bool)

(assert (=> b!1287531 (not (contains!7946 (ListLongMap!19626 Nil!29145) k0!1205))))

(declare-datatypes ((Unit!42578 0))(
  ( (Unit!42579) )
))
(declare-fun lt!577874 () Unit!42578)

(declare-fun emptyContainsNothing!18 ((_ BitVec 64)) Unit!42578)

(assert (=> b!1287531 (= lt!577874 (emptyContainsNothing!18 k0!1205))))

(declare-fun b!1287532 () Bool)

(declare-fun e!735289 () Bool)

(declare-fun tp_is_empty!34095 () Bool)

(assert (=> b!1287532 (= e!735289 tp_is_empty!34095)))

(declare-fun b!1287534 () Bool)

(declare-fun res!855108 () Bool)

(assert (=> b!1287534 (=> (not res!855108) (not e!735291))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85240 0))(
  ( (array!85241 (arr!41121 (Array (_ BitVec 32) (_ BitVec 64))) (size!41671 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85240)

(assert (=> b!1287534 (= res!855108 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41671 _keys!1741))))))

(declare-fun b!1287535 () Bool)

(declare-fun res!855107 () Bool)

(assert (=> b!1287535 (=> (not res!855107) (not e!735291))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16149 0))(
  ( (ValueCellFull!16149 (v!19725 V!50563)) (EmptyCell!16149) )
))
(declare-datatypes ((array!85242 0))(
  ( (array!85243 (arr!41122 (Array (_ BitVec 32) ValueCell!16149)) (size!41672 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85242)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287535 (= res!855107 (and (= (size!41672 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41671 _keys!1741) (size!41672 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287536 () Bool)

(declare-fun res!855106 () Bool)

(assert (=> b!1287536 (=> (not res!855106) (not e!735291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85240 (_ BitVec 32)) Bool)

(assert (=> b!1287536 (= res!855106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52703 () Bool)

(declare-fun mapRes!52703 () Bool)

(assert (=> mapIsEmpty!52703 mapRes!52703))

(declare-fun b!1287537 () Bool)

(declare-fun res!855102 () Bool)

(assert (=> b!1287537 (=> (not res!855102) (not e!735291))))

(declare-datatypes ((List!29149 0))(
  ( (Nil!29146) (Cons!29145 (h!30354 (_ BitVec 64)) (t!42713 List!29149)) )
))
(declare-fun arrayNoDuplicates!0 (array!85240 (_ BitVec 32) List!29149) Bool)

(assert (=> b!1287537 (= res!855102 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29146))))

(declare-fun b!1287538 () Bool)

(declare-fun res!855103 () Bool)

(assert (=> b!1287538 (=> (not res!855103) (not e!735291))))

(declare-fun minValue!1387 () V!50563)

(declare-fun zeroValue!1387 () V!50563)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4902 (array!85240 array!85242 (_ BitVec 32) (_ BitVec 32) V!50563 V!50563 (_ BitVec 32) Int) ListLongMap!19625)

(assert (=> b!1287538 (= res!855103 (contains!7946 (getCurrentListMap!4902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287539 () Bool)

(declare-fun res!855105 () Bool)

(assert (=> b!1287539 (=> (not res!855105) (not e!735291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287539 (= res!855105 (not (validKeyInArray!0 (select (arr!41121 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52703 () Bool)

(declare-fun tp!100484 () Bool)

(declare-fun e!735290 () Bool)

(assert (=> mapNonEmpty!52703 (= mapRes!52703 (and tp!100484 e!735290))))

(declare-fun mapRest!52703 () (Array (_ BitVec 32) ValueCell!16149))

(declare-fun mapValue!52703 () ValueCell!16149)

(declare-fun mapKey!52703 () (_ BitVec 32))

(assert (=> mapNonEmpty!52703 (= (arr!41122 _values!1445) (store mapRest!52703 mapKey!52703 mapValue!52703))))

(declare-fun b!1287533 () Bool)

(assert (=> b!1287533 (= e!735290 tp_is_empty!34095)))

(declare-fun res!855101 () Bool)

(assert (=> start!108966 (=> (not res!855101) (not e!735291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108966 (= res!855101 (validMask!0 mask!2175))))

(assert (=> start!108966 e!735291))

(assert (=> start!108966 tp_is_empty!34095))

(assert (=> start!108966 true))

(declare-fun e!735293 () Bool)

(declare-fun array_inv!31185 (array!85242) Bool)

(assert (=> start!108966 (and (array_inv!31185 _values!1445) e!735293)))

(declare-fun array_inv!31186 (array!85240) Bool)

(assert (=> start!108966 (array_inv!31186 _keys!1741)))

(assert (=> start!108966 tp!100483))

(declare-fun b!1287540 () Bool)

(assert (=> b!1287540 (= e!735293 (and e!735289 mapRes!52703))))

(declare-fun condMapEmpty!52703 () Bool)

(declare-fun mapDefault!52703 () ValueCell!16149)

(assert (=> b!1287540 (= condMapEmpty!52703 (= (arr!41122 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16149)) mapDefault!52703)))))

(declare-fun b!1287541 () Bool)

(declare-fun res!855104 () Bool)

(assert (=> b!1287541 (=> (not res!855104) (not e!735291))))

(assert (=> b!1287541 (= res!855104 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41671 _keys!1741))))))

(assert (= (and start!108966 res!855101) b!1287535))

(assert (= (and b!1287535 res!855107) b!1287536))

(assert (= (and b!1287536 res!855106) b!1287537))

(assert (= (and b!1287537 res!855102) b!1287534))

(assert (= (and b!1287534 res!855108) b!1287538))

(assert (= (and b!1287538 res!855103) b!1287541))

(assert (= (and b!1287541 res!855104) b!1287539))

(assert (= (and b!1287539 res!855105) b!1287531))

(assert (= (and b!1287540 condMapEmpty!52703) mapIsEmpty!52703))

(assert (= (and b!1287540 (not condMapEmpty!52703)) mapNonEmpty!52703))

(get-info :version)

(assert (= (and mapNonEmpty!52703 ((_ is ValueCellFull!16149) mapValue!52703)) b!1287533))

(assert (= (and b!1287540 ((_ is ValueCellFull!16149) mapDefault!52703)) b!1287532))

(assert (= start!108966 b!1287540))

(declare-fun m!1180367 () Bool)

(assert (=> b!1287531 m!1180367))

(declare-fun m!1180369 () Bool)

(assert (=> b!1287531 m!1180369))

(declare-fun m!1180371 () Bool)

(assert (=> mapNonEmpty!52703 m!1180371))

(declare-fun m!1180373 () Bool)

(assert (=> start!108966 m!1180373))

(declare-fun m!1180375 () Bool)

(assert (=> start!108966 m!1180375))

(declare-fun m!1180377 () Bool)

(assert (=> start!108966 m!1180377))

(declare-fun m!1180379 () Bool)

(assert (=> b!1287538 m!1180379))

(assert (=> b!1287538 m!1180379))

(declare-fun m!1180381 () Bool)

(assert (=> b!1287538 m!1180381))

(declare-fun m!1180383 () Bool)

(assert (=> b!1287537 m!1180383))

(declare-fun m!1180385 () Bool)

(assert (=> b!1287536 m!1180385))

(declare-fun m!1180387 () Bool)

(assert (=> b!1287539 m!1180387))

(assert (=> b!1287539 m!1180387))

(declare-fun m!1180389 () Bool)

(assert (=> b!1287539 m!1180389))

(check-sat (not b!1287538) (not start!108966) tp_is_empty!34095 (not b_next!28455) (not b!1287537) (not b!1287531) (not b!1287536) (not mapNonEmpty!52703) (not b!1287539) b_and!46545)
(check-sat b_and!46545 (not b_next!28455))

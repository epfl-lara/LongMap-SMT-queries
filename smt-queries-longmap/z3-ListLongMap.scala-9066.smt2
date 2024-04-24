; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109404 () Bool)

(assert start!109404)

(declare-fun b_free!28669 () Bool)

(declare-fun b_next!28669 () Bool)

(assert (=> start!109404 (= b_free!28669 (not b_next!28669))))

(declare-fun tp!101125 () Bool)

(declare-fun b_and!46761 () Bool)

(assert (=> start!109404 (= tp!101125 b_and!46761)))

(declare-fun b!1292630 () Bool)

(declare-fun e!738005 () Bool)

(declare-fun tp_is_empty!34309 () Bool)

(assert (=> b!1292630 (= e!738005 tp_is_empty!34309)))

(declare-fun b!1292631 () Bool)

(declare-fun e!738004 () Bool)

(assert (=> b!1292631 (= e!738004 true)))

(assert (=> b!1292631 false))

(declare-datatypes ((V!50849 0))(
  ( (V!50850 (val!17229 Int)) )
))
(declare-fun minValue!1387 () V!50849)

(declare-datatypes ((tuple2!22166 0))(
  ( (tuple2!22167 (_1!11094 (_ BitVec 64)) (_2!11094 V!50849)) )
))
(declare-datatypes ((List!29339 0))(
  ( (Nil!29336) (Cons!29335 (h!30553 tuple2!22166) (t!42895 List!29339)) )
))
(declare-datatypes ((ListLongMap!19831 0))(
  ( (ListLongMap!19832 (toList!9931 List!29339)) )
))
(declare-fun lt!579555 () ListLongMap!19831)

(declare-datatypes ((Unit!42709 0))(
  ( (Unit!42710) )
))
(declare-fun lt!579557 () Unit!42709)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!58 ((_ BitVec 64) (_ BitVec 64) V!50849 ListLongMap!19831) Unit!42709)

(assert (=> b!1292631 (= lt!579557 (lemmaInListMapAfterAddingDiffThenInBefore!58 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579555))))

(declare-fun lt!579556 () ListLongMap!19831)

(declare-fun contains!8062 (ListLongMap!19831 (_ BitVec 64)) Bool)

(declare-fun +!4429 (ListLongMap!19831 tuple2!22166) ListLongMap!19831)

(assert (=> b!1292631 (not (contains!8062 (+!4429 lt!579556 (tuple2!22167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579558 () Unit!42709)

(declare-fun addStillNotContains!405 (ListLongMap!19831 (_ BitVec 64) V!50849 (_ BitVec 64)) Unit!42709)

(assert (=> b!1292631 (= lt!579558 (addStillNotContains!405 lt!579556 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292631 (not (contains!8062 lt!579555 k0!1205))))

(declare-fun zeroValue!1387 () V!50849)

(assert (=> b!1292631 (= lt!579555 (+!4429 lt!579556 (tuple2!22167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579553 () Unit!42709)

(assert (=> b!1292631 (= lt!579553 (addStillNotContains!405 lt!579556 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16256 0))(
  ( (ValueCellFull!16256 (v!19827 V!50849)) (EmptyCell!16256) )
))
(declare-datatypes ((array!85689 0))(
  ( (array!85690 (arr!41341 (Array (_ BitVec 32) ValueCell!16256)) (size!41892 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85689)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85691 0))(
  ( (array!85692 (arr!41342 (Array (_ BitVec 32) (_ BitVec 64))) (size!41893 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85691)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6067 (array!85691 array!85689 (_ BitVec 32) (_ BitVec 32) V!50849 V!50849 (_ BitVec 32) Int) ListLongMap!19831)

(assert (=> b!1292631 (= lt!579556 (getCurrentListMapNoExtraKeys!6067 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1292632 () Bool)

(declare-fun e!738008 () Bool)

(declare-fun e!738007 () Bool)

(declare-fun mapRes!53024 () Bool)

(assert (=> b!1292632 (= e!738008 (and e!738007 mapRes!53024))))

(declare-fun condMapEmpty!53024 () Bool)

(declare-fun mapDefault!53024 () ValueCell!16256)

(assert (=> b!1292632 (= condMapEmpty!53024 (= (arr!41341 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16256)) mapDefault!53024)))))

(declare-fun b!1292633 () Bool)

(assert (=> b!1292633 (= e!738007 tp_is_empty!34309)))

(declare-fun b!1292634 () Bool)

(declare-fun res!858459 () Bool)

(declare-fun e!738009 () Bool)

(assert (=> b!1292634 (=> (not res!858459) (not e!738009))))

(declare-datatypes ((List!29340 0))(
  ( (Nil!29337) (Cons!29336 (h!30554 (_ BitVec 64)) (t!42896 List!29340)) )
))
(declare-fun arrayNoDuplicates!0 (array!85691 (_ BitVec 32) List!29340) Bool)

(assert (=> b!1292634 (= res!858459 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29337))))

(declare-fun b!1292635 () Bool)

(assert (=> b!1292635 (= e!738009 (not e!738004))))

(declare-fun res!858460 () Bool)

(assert (=> b!1292635 (=> res!858460 e!738004)))

(assert (=> b!1292635 (= res!858460 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1292635 (not (contains!8062 (ListLongMap!19832 Nil!29336) k0!1205))))

(declare-fun lt!579554 () Unit!42709)

(declare-fun emptyContainsNothing!101 ((_ BitVec 64)) Unit!42709)

(assert (=> b!1292635 (= lt!579554 (emptyContainsNothing!101 k0!1205))))

(declare-fun res!858456 () Bool)

(assert (=> start!109404 (=> (not res!858456) (not e!738009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109404 (= res!858456 (validMask!0 mask!2175))))

(assert (=> start!109404 e!738009))

(assert (=> start!109404 tp_is_empty!34309))

(assert (=> start!109404 true))

(declare-fun array_inv!31557 (array!85689) Bool)

(assert (=> start!109404 (and (array_inv!31557 _values!1445) e!738008)))

(declare-fun array_inv!31558 (array!85691) Bool)

(assert (=> start!109404 (array_inv!31558 _keys!1741)))

(assert (=> start!109404 tp!101125))

(declare-fun b!1292636 () Bool)

(declare-fun res!858457 () Bool)

(assert (=> b!1292636 (=> (not res!858457) (not e!738009))))

(assert (=> b!1292636 (= res!858457 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41893 _keys!1741))))))

(declare-fun b!1292637 () Bool)

(declare-fun res!858455 () Bool)

(assert (=> b!1292637 (=> (not res!858455) (not e!738009))))

(declare-fun getCurrentListMap!4966 (array!85691 array!85689 (_ BitVec 32) (_ BitVec 32) V!50849 V!50849 (_ BitVec 32) Int) ListLongMap!19831)

(assert (=> b!1292637 (= res!858455 (contains!8062 (getCurrentListMap!4966 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292638 () Bool)

(declare-fun res!858458 () Bool)

(assert (=> b!1292638 (=> (not res!858458) (not e!738009))))

(assert (=> b!1292638 (= res!858458 (and (= (size!41892 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41893 _keys!1741) (size!41892 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292639 () Bool)

(declare-fun res!858453 () Bool)

(assert (=> b!1292639 (=> (not res!858453) (not e!738009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292639 (= res!858453 (not (validKeyInArray!0 (select (arr!41342 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53024 () Bool)

(assert (=> mapIsEmpty!53024 mapRes!53024))

(declare-fun b!1292640 () Bool)

(declare-fun res!858454 () Bool)

(assert (=> b!1292640 (=> (not res!858454) (not e!738009))))

(assert (=> b!1292640 (= res!858454 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41893 _keys!1741))))))

(declare-fun mapNonEmpty!53024 () Bool)

(declare-fun tp!101126 () Bool)

(assert (=> mapNonEmpty!53024 (= mapRes!53024 (and tp!101126 e!738005))))

(declare-fun mapKey!53024 () (_ BitVec 32))

(declare-fun mapValue!53024 () ValueCell!16256)

(declare-fun mapRest!53024 () (Array (_ BitVec 32) ValueCell!16256))

(assert (=> mapNonEmpty!53024 (= (arr!41341 _values!1445) (store mapRest!53024 mapKey!53024 mapValue!53024))))

(declare-fun b!1292641 () Bool)

(declare-fun res!858452 () Bool)

(assert (=> b!1292641 (=> (not res!858452) (not e!738009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85691 (_ BitVec 32)) Bool)

(assert (=> b!1292641 (= res!858452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109404 res!858456) b!1292638))

(assert (= (and b!1292638 res!858458) b!1292641))

(assert (= (and b!1292641 res!858452) b!1292634))

(assert (= (and b!1292634 res!858459) b!1292640))

(assert (= (and b!1292640 res!858454) b!1292637))

(assert (= (and b!1292637 res!858455) b!1292636))

(assert (= (and b!1292636 res!858457) b!1292639))

(assert (= (and b!1292639 res!858453) b!1292635))

(assert (= (and b!1292635 (not res!858460)) b!1292631))

(assert (= (and b!1292632 condMapEmpty!53024) mapIsEmpty!53024))

(assert (= (and b!1292632 (not condMapEmpty!53024)) mapNonEmpty!53024))

(get-info :version)

(assert (= (and mapNonEmpty!53024 ((_ is ValueCellFull!16256) mapValue!53024)) b!1292630))

(assert (= (and b!1292632 ((_ is ValueCellFull!16256) mapDefault!53024)) b!1292633))

(assert (= start!109404 b!1292632))

(declare-fun m!1185633 () Bool)

(assert (=> b!1292634 m!1185633))

(declare-fun m!1185635 () Bool)

(assert (=> b!1292637 m!1185635))

(assert (=> b!1292637 m!1185635))

(declare-fun m!1185637 () Bool)

(assert (=> b!1292637 m!1185637))

(declare-fun m!1185639 () Bool)

(assert (=> start!109404 m!1185639))

(declare-fun m!1185641 () Bool)

(assert (=> start!109404 m!1185641))

(declare-fun m!1185643 () Bool)

(assert (=> start!109404 m!1185643))

(declare-fun m!1185645 () Bool)

(assert (=> b!1292635 m!1185645))

(declare-fun m!1185647 () Bool)

(assert (=> b!1292635 m!1185647))

(declare-fun m!1185649 () Bool)

(assert (=> b!1292639 m!1185649))

(assert (=> b!1292639 m!1185649))

(declare-fun m!1185651 () Bool)

(assert (=> b!1292639 m!1185651))

(declare-fun m!1185653 () Bool)

(assert (=> mapNonEmpty!53024 m!1185653))

(declare-fun m!1185655 () Bool)

(assert (=> b!1292631 m!1185655))

(declare-fun m!1185657 () Bool)

(assert (=> b!1292631 m!1185657))

(declare-fun m!1185659 () Bool)

(assert (=> b!1292631 m!1185659))

(declare-fun m!1185661 () Bool)

(assert (=> b!1292631 m!1185661))

(declare-fun m!1185663 () Bool)

(assert (=> b!1292631 m!1185663))

(declare-fun m!1185665 () Bool)

(assert (=> b!1292631 m!1185665))

(declare-fun m!1185667 () Bool)

(assert (=> b!1292631 m!1185667))

(assert (=> b!1292631 m!1185655))

(declare-fun m!1185669 () Bool)

(assert (=> b!1292631 m!1185669))

(declare-fun m!1185671 () Bool)

(assert (=> b!1292641 m!1185671))

(check-sat (not b!1292641) b_and!46761 tp_is_empty!34309 (not b!1292639) (not b!1292635) (not start!109404) (not b!1292631) (not mapNonEmpty!53024) (not b!1292634) (not b_next!28669) (not b!1292637))
(check-sat b_and!46761 (not b_next!28669))

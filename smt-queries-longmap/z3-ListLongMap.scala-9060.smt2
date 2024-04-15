; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109144 () Bool)

(assert start!109144)

(declare-fun b_free!28633 () Bool)

(declare-fun b_next!28633 () Bool)

(assert (=> start!109144 (= b_free!28633 (not b_next!28633))))

(declare-fun tp!101018 () Bool)

(declare-fun b_and!46705 () Bool)

(assert (=> start!109144 (= tp!101018 b_and!46705)))

(declare-fun b!1290613 () Bool)

(declare-fun e!736808 () Bool)

(declare-fun tp_is_empty!34273 () Bool)

(assert (=> b!1290613 (= e!736808 tp_is_empty!34273)))

(declare-fun b!1290614 () Bool)

(declare-fun e!736807 () Bool)

(assert (=> b!1290614 (= e!736807 true)))

(assert (=> b!1290614 false))

(declare-datatypes ((Unit!42554 0))(
  ( (Unit!42555) )
))
(declare-fun lt!578568 () Unit!42554)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50801 0))(
  ( (V!50802 (val!17211 Int)) )
))
(declare-fun minValue!1387 () V!50801)

(declare-datatypes ((tuple2!22170 0))(
  ( (tuple2!22171 (_1!11096 (_ BitVec 64)) (_2!11096 V!50801)) )
))
(declare-datatypes ((List!29327 0))(
  ( (Nil!29324) (Cons!29323 (h!30532 tuple2!22170) (t!42883 List!29327)) )
))
(declare-datatypes ((ListLongMap!19827 0))(
  ( (ListLongMap!19828 (toList!9929 List!29327)) )
))
(declare-fun lt!578571 () ListLongMap!19827)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!47 ((_ BitVec 64) (_ BitVec 64) V!50801 ListLongMap!19827) Unit!42554)

(assert (=> b!1290614 (= lt!578568 (lemmaInListMapAfterAddingDiffThenInBefore!47 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578571))))

(declare-fun lt!578572 () ListLongMap!19827)

(declare-fun contains!7977 (ListLongMap!19827 (_ BitVec 64)) Bool)

(declare-fun +!4406 (ListLongMap!19827 tuple2!22170) ListLongMap!19827)

(assert (=> b!1290614 (not (contains!7977 (+!4406 lt!578572 (tuple2!22171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578567 () Unit!42554)

(declare-fun addStillNotContains!383 (ListLongMap!19827 (_ BitVec 64) V!50801 (_ BitVec 64)) Unit!42554)

(assert (=> b!1290614 (= lt!578567 (addStillNotContains!383 lt!578572 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290614 (not (contains!7977 lt!578571 k0!1205))))

(declare-fun zeroValue!1387 () V!50801)

(assert (=> b!1290614 (= lt!578571 (+!4406 lt!578572 (tuple2!22171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578569 () Unit!42554)

(assert (=> b!1290614 (= lt!578569 (addStillNotContains!383 lt!578572 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16238 0))(
  ( (ValueCellFull!16238 (v!19813 V!50801)) (EmptyCell!16238) )
))
(declare-datatypes ((array!85475 0))(
  ( (array!85476 (arr!41239 (Array (_ BitVec 32) ValueCell!16238)) (size!41791 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85475)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85477 0))(
  ( (array!85478 (arr!41240 (Array (_ BitVec 32) (_ BitVec 64))) (size!41792 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85477)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6037 (array!85477 array!85475 (_ BitVec 32) (_ BitVec 32) V!50801 V!50801 (_ BitVec 32) Int) ListLongMap!19827)

(assert (=> b!1290614 (= lt!578572 (getCurrentListMapNoExtraKeys!6037 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290615 () Bool)

(declare-fun res!857425 () Bool)

(declare-fun e!736805 () Bool)

(assert (=> b!1290615 (=> (not res!857425) (not e!736805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85477 (_ BitVec 32)) Bool)

(assert (=> b!1290615 (= res!857425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290616 () Bool)

(declare-fun res!857427 () Bool)

(assert (=> b!1290616 (=> (not res!857427) (not e!736805))))

(assert (=> b!1290616 (= res!857427 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41792 _keys!1741))))))

(declare-fun mapIsEmpty!52970 () Bool)

(declare-fun mapRes!52970 () Bool)

(assert (=> mapIsEmpty!52970 mapRes!52970))

(declare-fun res!857423 () Bool)

(assert (=> start!109144 (=> (not res!857423) (not e!736805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109144 (= res!857423 (validMask!0 mask!2175))))

(assert (=> start!109144 e!736805))

(assert (=> start!109144 tp_is_empty!34273))

(assert (=> start!109144 true))

(declare-fun e!736809 () Bool)

(declare-fun array_inv!31419 (array!85475) Bool)

(assert (=> start!109144 (and (array_inv!31419 _values!1445) e!736809)))

(declare-fun array_inv!31420 (array!85477) Bool)

(assert (=> start!109144 (array_inv!31420 _keys!1741)))

(assert (=> start!109144 tp!101018))

(declare-fun b!1290617 () Bool)

(declare-fun res!857421 () Bool)

(assert (=> b!1290617 (=> (not res!857421) (not e!736805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290617 (= res!857421 (not (validKeyInArray!0 (select (arr!41240 _keys!1741) from!2144))))))

(declare-fun b!1290618 () Bool)

(assert (=> b!1290618 (= e!736805 (not e!736807))))

(declare-fun res!857419 () Bool)

(assert (=> b!1290618 (=> res!857419 e!736807)))

(assert (=> b!1290618 (= res!857419 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290618 (not (contains!7977 (ListLongMap!19828 Nil!29324) k0!1205))))

(declare-fun lt!578570 () Unit!42554)

(declare-fun emptyContainsNothing!75 ((_ BitVec 64)) Unit!42554)

(assert (=> b!1290618 (= lt!578570 (emptyContainsNothing!75 k0!1205))))

(declare-fun b!1290619 () Bool)

(declare-fun res!857424 () Bool)

(assert (=> b!1290619 (=> (not res!857424) (not e!736805))))

(declare-fun getCurrentListMap!4877 (array!85477 array!85475 (_ BitVec 32) (_ BitVec 32) V!50801 V!50801 (_ BitVec 32) Int) ListLongMap!19827)

(assert (=> b!1290619 (= res!857424 (contains!7977 (getCurrentListMap!4877 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290620 () Bool)

(declare-fun e!736806 () Bool)

(assert (=> b!1290620 (= e!736806 tp_is_empty!34273)))

(declare-fun b!1290621 () Bool)

(declare-fun res!857426 () Bool)

(assert (=> b!1290621 (=> (not res!857426) (not e!736805))))

(assert (=> b!1290621 (= res!857426 (and (= (size!41791 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41792 _keys!1741) (size!41791 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52970 () Bool)

(declare-fun tp!101019 () Bool)

(assert (=> mapNonEmpty!52970 (= mapRes!52970 (and tp!101019 e!736808))))

(declare-fun mapValue!52970 () ValueCell!16238)

(declare-fun mapKey!52970 () (_ BitVec 32))

(declare-fun mapRest!52970 () (Array (_ BitVec 32) ValueCell!16238))

(assert (=> mapNonEmpty!52970 (= (arr!41239 _values!1445) (store mapRest!52970 mapKey!52970 mapValue!52970))))

(declare-fun b!1290622 () Bool)

(declare-fun res!857420 () Bool)

(assert (=> b!1290622 (=> (not res!857420) (not e!736805))))

(declare-datatypes ((List!29328 0))(
  ( (Nil!29325) (Cons!29324 (h!30533 (_ BitVec 64)) (t!42884 List!29328)) )
))
(declare-fun arrayNoDuplicates!0 (array!85477 (_ BitVec 32) List!29328) Bool)

(assert (=> b!1290622 (= res!857420 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29325))))

(declare-fun b!1290623 () Bool)

(declare-fun res!857422 () Bool)

(assert (=> b!1290623 (=> (not res!857422) (not e!736805))))

(assert (=> b!1290623 (= res!857422 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41792 _keys!1741))))))

(declare-fun b!1290624 () Bool)

(assert (=> b!1290624 (= e!736809 (and e!736806 mapRes!52970))))

(declare-fun condMapEmpty!52970 () Bool)

(declare-fun mapDefault!52970 () ValueCell!16238)

(assert (=> b!1290624 (= condMapEmpty!52970 (= (arr!41239 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16238)) mapDefault!52970)))))

(assert (= (and start!109144 res!857423) b!1290621))

(assert (= (and b!1290621 res!857426) b!1290615))

(assert (= (and b!1290615 res!857425) b!1290622))

(assert (= (and b!1290622 res!857420) b!1290616))

(assert (= (and b!1290616 res!857427) b!1290619))

(assert (= (and b!1290619 res!857424) b!1290623))

(assert (= (and b!1290623 res!857422) b!1290617))

(assert (= (and b!1290617 res!857421) b!1290618))

(assert (= (and b!1290618 (not res!857419)) b!1290614))

(assert (= (and b!1290624 condMapEmpty!52970) mapIsEmpty!52970))

(assert (= (and b!1290624 (not condMapEmpty!52970)) mapNonEmpty!52970))

(get-info :version)

(assert (= (and mapNonEmpty!52970 ((_ is ValueCellFull!16238) mapValue!52970)) b!1290613))

(assert (= (and b!1290624 ((_ is ValueCellFull!16238) mapDefault!52970)) b!1290620))

(assert (= start!109144 b!1290624))

(declare-fun m!1182795 () Bool)

(assert (=> b!1290617 m!1182795))

(assert (=> b!1290617 m!1182795))

(declare-fun m!1182797 () Bool)

(assert (=> b!1290617 m!1182797))

(declare-fun m!1182799 () Bool)

(assert (=> start!109144 m!1182799))

(declare-fun m!1182801 () Bool)

(assert (=> start!109144 m!1182801))

(declare-fun m!1182803 () Bool)

(assert (=> start!109144 m!1182803))

(declare-fun m!1182805 () Bool)

(assert (=> b!1290622 m!1182805))

(declare-fun m!1182807 () Bool)

(assert (=> mapNonEmpty!52970 m!1182807))

(declare-fun m!1182809 () Bool)

(assert (=> b!1290618 m!1182809))

(declare-fun m!1182811 () Bool)

(assert (=> b!1290618 m!1182811))

(declare-fun m!1182813 () Bool)

(assert (=> b!1290619 m!1182813))

(assert (=> b!1290619 m!1182813))

(declare-fun m!1182815 () Bool)

(assert (=> b!1290619 m!1182815))

(declare-fun m!1182817 () Bool)

(assert (=> b!1290615 m!1182817))

(declare-fun m!1182819 () Bool)

(assert (=> b!1290614 m!1182819))

(declare-fun m!1182821 () Bool)

(assert (=> b!1290614 m!1182821))

(declare-fun m!1182823 () Bool)

(assert (=> b!1290614 m!1182823))

(declare-fun m!1182825 () Bool)

(assert (=> b!1290614 m!1182825))

(declare-fun m!1182827 () Bool)

(assert (=> b!1290614 m!1182827))

(declare-fun m!1182829 () Bool)

(assert (=> b!1290614 m!1182829))

(declare-fun m!1182831 () Bool)

(assert (=> b!1290614 m!1182831))

(declare-fun m!1182833 () Bool)

(assert (=> b!1290614 m!1182833))

(assert (=> b!1290614 m!1182819))

(check-sat b_and!46705 (not mapNonEmpty!52970) (not b_next!28633) (not b!1290619) (not b!1290617) (not b!1290614) (not b!1290618) (not b!1290622) (not b!1290615) tp_is_empty!34273 (not start!109144))
(check-sat b_and!46705 (not b_next!28633))

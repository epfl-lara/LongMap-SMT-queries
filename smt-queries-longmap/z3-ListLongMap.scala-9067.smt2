; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109410 () Bool)

(assert start!109410)

(declare-fun b_free!28675 () Bool)

(declare-fun b_next!28675 () Bool)

(assert (=> start!109410 (= b_free!28675 (not b_next!28675))))

(declare-fun tp!101143 () Bool)

(declare-fun b_and!46767 () Bool)

(assert (=> start!109410 (= tp!101143 b_and!46767)))

(declare-fun b!1292738 () Bool)

(declare-fun res!858534 () Bool)

(declare-fun e!738058 () Bool)

(assert (=> b!1292738 (=> (not res!858534) (not e!738058))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85699 0))(
  ( (array!85700 (arr!41346 (Array (_ BitVec 32) (_ BitVec 64))) (size!41897 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85699)

(assert (=> b!1292738 (= res!858534 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41897 _keys!1741))))))

(declare-fun b!1292739 () Bool)

(declare-fun res!858541 () Bool)

(assert (=> b!1292739 (=> (not res!858541) (not e!738058))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50857 0))(
  ( (V!50858 (val!17232 Int)) )
))
(declare-datatypes ((ValueCell!16259 0))(
  ( (ValueCellFull!16259 (v!19830 V!50857)) (EmptyCell!16259) )
))
(declare-datatypes ((array!85701 0))(
  ( (array!85702 (arr!41347 (Array (_ BitVec 32) ValueCell!16259)) (size!41898 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85701)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292739 (= res!858541 (and (= (size!41898 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41897 _keys!1741) (size!41898 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292740 () Bool)

(declare-fun e!738061 () Bool)

(declare-fun tp_is_empty!34315 () Bool)

(assert (=> b!1292740 (= e!738061 tp_is_empty!34315)))

(declare-fun b!1292741 () Bool)

(declare-fun res!858539 () Bool)

(assert (=> b!1292741 (=> (not res!858539) (not e!738058))))

(declare-fun minValue!1387 () V!50857)

(declare-fun zeroValue!1387 () V!50857)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22170 0))(
  ( (tuple2!22171 (_1!11096 (_ BitVec 64)) (_2!11096 V!50857)) )
))
(declare-datatypes ((List!29343 0))(
  ( (Nil!29340) (Cons!29339 (h!30557 tuple2!22170) (t!42899 List!29343)) )
))
(declare-datatypes ((ListLongMap!19835 0))(
  ( (ListLongMap!19836 (toList!9933 List!29343)) )
))
(declare-fun contains!8064 (ListLongMap!19835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4968 (array!85699 array!85701 (_ BitVec 32) (_ BitVec 32) V!50857 V!50857 (_ BitVec 32) Int) ListLongMap!19835)

(assert (=> b!1292741 (= res!858539 (contains!8064 (getCurrentListMap!4968 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53033 () Bool)

(declare-fun mapRes!53033 () Bool)

(assert (=> mapIsEmpty!53033 mapRes!53033))

(declare-fun res!858537 () Bool)

(assert (=> start!109410 (=> (not res!858537) (not e!738058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109410 (= res!858537 (validMask!0 mask!2175))))

(assert (=> start!109410 e!738058))

(assert (=> start!109410 tp_is_empty!34315))

(assert (=> start!109410 true))

(declare-fun e!738062 () Bool)

(declare-fun array_inv!31559 (array!85701) Bool)

(assert (=> start!109410 (and (array_inv!31559 _values!1445) e!738062)))

(declare-fun array_inv!31560 (array!85699) Bool)

(assert (=> start!109410 (array_inv!31560 _keys!1741)))

(assert (=> start!109410 tp!101143))

(declare-fun b!1292742 () Bool)

(declare-fun e!738060 () Bool)

(assert (=> b!1292742 (= e!738060 tp_is_empty!34315)))

(declare-fun b!1292743 () Bool)

(declare-fun e!738063 () Bool)

(assert (=> b!1292743 (= e!738063 true)))

(assert (=> b!1292743 false))

(declare-datatypes ((Unit!42713 0))(
  ( (Unit!42714) )
))
(declare-fun lt!579609 () Unit!42713)

(declare-fun lt!579608 () ListLongMap!19835)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!60 ((_ BitVec 64) (_ BitVec 64) V!50857 ListLongMap!19835) Unit!42713)

(assert (=> b!1292743 (= lt!579609 (lemmaInListMapAfterAddingDiffThenInBefore!60 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579608))))

(declare-fun lt!579610 () ListLongMap!19835)

(declare-fun +!4431 (ListLongMap!19835 tuple2!22170) ListLongMap!19835)

(assert (=> b!1292743 (not (contains!8064 (+!4431 lt!579610 (tuple2!22171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579612 () Unit!42713)

(declare-fun addStillNotContains!407 (ListLongMap!19835 (_ BitVec 64) V!50857 (_ BitVec 64)) Unit!42713)

(assert (=> b!1292743 (= lt!579612 (addStillNotContains!407 lt!579610 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292743 (not (contains!8064 lt!579608 k0!1205))))

(assert (=> b!1292743 (= lt!579608 (+!4431 lt!579610 (tuple2!22171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579607 () Unit!42713)

(assert (=> b!1292743 (= lt!579607 (addStillNotContains!407 lt!579610 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6069 (array!85699 array!85701 (_ BitVec 32) (_ BitVec 32) V!50857 V!50857 (_ BitVec 32) Int) ListLongMap!19835)

(assert (=> b!1292743 (= lt!579610 (getCurrentListMapNoExtraKeys!6069 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53033 () Bool)

(declare-fun tp!101144 () Bool)

(assert (=> mapNonEmpty!53033 (= mapRes!53033 (and tp!101144 e!738060))))

(declare-fun mapValue!53033 () ValueCell!16259)

(declare-fun mapKey!53033 () (_ BitVec 32))

(declare-fun mapRest!53033 () (Array (_ BitVec 32) ValueCell!16259))

(assert (=> mapNonEmpty!53033 (= (arr!41347 _values!1445) (store mapRest!53033 mapKey!53033 mapValue!53033))))

(declare-fun b!1292744 () Bool)

(declare-fun res!858535 () Bool)

(assert (=> b!1292744 (=> (not res!858535) (not e!738058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85699 (_ BitVec 32)) Bool)

(assert (=> b!1292744 (= res!858535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292745 () Bool)

(assert (=> b!1292745 (= e!738062 (and e!738061 mapRes!53033))))

(declare-fun condMapEmpty!53033 () Bool)

(declare-fun mapDefault!53033 () ValueCell!16259)

(assert (=> b!1292745 (= condMapEmpty!53033 (= (arr!41347 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16259)) mapDefault!53033)))))

(declare-fun b!1292746 () Bool)

(declare-fun res!858540 () Bool)

(assert (=> b!1292746 (=> (not res!858540) (not e!738058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292746 (= res!858540 (not (validKeyInArray!0 (select (arr!41346 _keys!1741) from!2144))))))

(declare-fun b!1292747 () Bool)

(assert (=> b!1292747 (= e!738058 (not e!738063))))

(declare-fun res!858533 () Bool)

(assert (=> b!1292747 (=> res!858533 e!738063)))

(assert (=> b!1292747 (= res!858533 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1292747 (not (contains!8064 (ListLongMap!19836 Nil!29340) k0!1205))))

(declare-fun lt!579611 () Unit!42713)

(declare-fun emptyContainsNothing!103 ((_ BitVec 64)) Unit!42713)

(assert (=> b!1292747 (= lt!579611 (emptyContainsNothing!103 k0!1205))))

(declare-fun b!1292748 () Bool)

(declare-fun res!858536 () Bool)

(assert (=> b!1292748 (=> (not res!858536) (not e!738058))))

(declare-datatypes ((List!29344 0))(
  ( (Nil!29341) (Cons!29340 (h!30558 (_ BitVec 64)) (t!42900 List!29344)) )
))
(declare-fun arrayNoDuplicates!0 (array!85699 (_ BitVec 32) List!29344) Bool)

(assert (=> b!1292748 (= res!858536 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29341))))

(declare-fun b!1292749 () Bool)

(declare-fun res!858538 () Bool)

(assert (=> b!1292749 (=> (not res!858538) (not e!738058))))

(assert (=> b!1292749 (= res!858538 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41897 _keys!1741))))))

(assert (= (and start!109410 res!858537) b!1292739))

(assert (= (and b!1292739 res!858541) b!1292744))

(assert (= (and b!1292744 res!858535) b!1292748))

(assert (= (and b!1292748 res!858536) b!1292738))

(assert (= (and b!1292738 res!858534) b!1292741))

(assert (= (and b!1292741 res!858539) b!1292749))

(assert (= (and b!1292749 res!858538) b!1292746))

(assert (= (and b!1292746 res!858540) b!1292747))

(assert (= (and b!1292747 (not res!858533)) b!1292743))

(assert (= (and b!1292745 condMapEmpty!53033) mapIsEmpty!53033))

(assert (= (and b!1292745 (not condMapEmpty!53033)) mapNonEmpty!53033))

(get-info :version)

(assert (= (and mapNonEmpty!53033 ((_ is ValueCellFull!16259) mapValue!53033)) b!1292742))

(assert (= (and b!1292745 ((_ is ValueCellFull!16259) mapDefault!53033)) b!1292740))

(assert (= start!109410 b!1292745))

(declare-fun m!1185753 () Bool)

(assert (=> b!1292746 m!1185753))

(assert (=> b!1292746 m!1185753))

(declare-fun m!1185755 () Bool)

(assert (=> b!1292746 m!1185755))

(declare-fun m!1185757 () Bool)

(assert (=> start!109410 m!1185757))

(declare-fun m!1185759 () Bool)

(assert (=> start!109410 m!1185759))

(declare-fun m!1185761 () Bool)

(assert (=> start!109410 m!1185761))

(declare-fun m!1185763 () Bool)

(assert (=> b!1292743 m!1185763))

(declare-fun m!1185765 () Bool)

(assert (=> b!1292743 m!1185765))

(declare-fun m!1185767 () Bool)

(assert (=> b!1292743 m!1185767))

(assert (=> b!1292743 m!1185767))

(declare-fun m!1185769 () Bool)

(assert (=> b!1292743 m!1185769))

(declare-fun m!1185771 () Bool)

(assert (=> b!1292743 m!1185771))

(declare-fun m!1185773 () Bool)

(assert (=> b!1292743 m!1185773))

(declare-fun m!1185775 () Bool)

(assert (=> b!1292743 m!1185775))

(declare-fun m!1185777 () Bool)

(assert (=> b!1292743 m!1185777))

(declare-fun m!1185779 () Bool)

(assert (=> b!1292744 m!1185779))

(declare-fun m!1185781 () Bool)

(assert (=> b!1292748 m!1185781))

(declare-fun m!1185783 () Bool)

(assert (=> b!1292747 m!1185783))

(declare-fun m!1185785 () Bool)

(assert (=> b!1292747 m!1185785))

(declare-fun m!1185787 () Bool)

(assert (=> mapNonEmpty!53033 m!1185787))

(declare-fun m!1185789 () Bool)

(assert (=> b!1292741 m!1185789))

(assert (=> b!1292741 m!1185789))

(declare-fun m!1185791 () Bool)

(assert (=> b!1292741 m!1185791))

(check-sat (not b!1292741) (not mapNonEmpty!53033) (not b!1292747) (not b!1292743) (not b!1292746) (not b!1292748) tp_is_empty!34315 (not b_next!28675) (not start!109410) b_and!46767 (not b!1292744))
(check-sat b_and!46767 (not b_next!28675))

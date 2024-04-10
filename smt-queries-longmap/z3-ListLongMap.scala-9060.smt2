; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109146 () Bool)

(assert start!109146)

(declare-fun b_free!28635 () Bool)

(declare-fun b_next!28635 () Bool)

(assert (=> start!109146 (= b_free!28635 (not b_next!28635))))

(declare-fun tp!101024 () Bool)

(declare-fun b_and!46725 () Bool)

(assert (=> start!109146 (= tp!101024 b_and!46725)))

(declare-fun b!1290713 () Bool)

(declare-fun e!736851 () Bool)

(assert (=> b!1290713 (= e!736851 true)))

(assert (=> b!1290713 false))

(declare-datatypes ((V!50803 0))(
  ( (V!50804 (val!17212 Int)) )
))
(declare-fun minValue!1387 () V!50803)

(declare-datatypes ((Unit!42722 0))(
  ( (Unit!42723) )
))
(declare-fun lt!578767 () Unit!42722)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22120 0))(
  ( (tuple2!22121 (_1!11071 (_ BitVec 64)) (_2!11071 V!50803)) )
))
(declare-datatypes ((List!29284 0))(
  ( (Nil!29281) (Cons!29280 (h!30489 tuple2!22120) (t!42848 List!29284)) )
))
(declare-datatypes ((ListLongMap!19777 0))(
  ( (ListLongMap!19778 (toList!9904 List!29284)) )
))
(declare-fun lt!578768 () ListLongMap!19777)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!45 ((_ BitVec 64) (_ BitVec 64) V!50803 ListLongMap!19777) Unit!42722)

(assert (=> b!1290713 (= lt!578767 (lemmaInListMapAfterAddingDiffThenInBefore!45 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578768))))

(declare-fun lt!578766 () ListLongMap!19777)

(declare-fun contains!8022 (ListLongMap!19777 (_ BitVec 64)) Bool)

(declare-fun +!4371 (ListLongMap!19777 tuple2!22120) ListLongMap!19777)

(assert (=> b!1290713 (not (contains!8022 (+!4371 lt!578766 (tuple2!22121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578764 () Unit!42722)

(declare-fun addStillNotContains!389 (ListLongMap!19777 (_ BitVec 64) V!50803 (_ BitVec 64)) Unit!42722)

(assert (=> b!1290713 (= lt!578764 (addStillNotContains!389 lt!578766 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290713 (not (contains!8022 lt!578768 k0!1205))))

(declare-fun zeroValue!1387 () V!50803)

(assert (=> b!1290713 (= lt!578768 (+!4371 lt!578766 (tuple2!22121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578765 () Unit!42722)

(assert (=> b!1290713 (= lt!578765 (addStillNotContains!389 lt!578766 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85588 0))(
  ( (array!85589 (arr!41295 (Array (_ BitVec 32) (_ BitVec 64))) (size!41845 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85588)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16239 0))(
  ( (ValueCellFull!16239 (v!19815 V!50803)) (EmptyCell!16239) )
))
(declare-datatypes ((array!85590 0))(
  ( (array!85591 (arr!41296 (Array (_ BitVec 32) ValueCell!16239)) (size!41846 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85590)

(declare-fun getCurrentListMapNoExtraKeys!6002 (array!85588 array!85590 (_ BitVec 32) (_ BitVec 32) V!50803 V!50803 (_ BitVec 32) Int) ListLongMap!19777)

(assert (=> b!1290713 (= lt!578766 (getCurrentListMapNoExtraKeys!6002 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290714 () Bool)

(declare-fun res!857477 () Bool)

(declare-fun e!736856 () Bool)

(assert (=> b!1290714 (=> (not res!857477) (not e!736856))))

(assert (=> b!1290714 (= res!857477 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41845 _keys!1741))))))

(declare-fun res!857481 () Bool)

(assert (=> start!109146 (=> (not res!857481) (not e!736856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109146 (= res!857481 (validMask!0 mask!2175))))

(assert (=> start!109146 e!736856))

(declare-fun tp_is_empty!34275 () Bool)

(assert (=> start!109146 tp_is_empty!34275))

(assert (=> start!109146 true))

(declare-fun e!736853 () Bool)

(declare-fun array_inv!31295 (array!85590) Bool)

(assert (=> start!109146 (and (array_inv!31295 _values!1445) e!736853)))

(declare-fun array_inv!31296 (array!85588) Bool)

(assert (=> start!109146 (array_inv!31296 _keys!1741)))

(assert (=> start!109146 tp!101024))

(declare-fun b!1290715 () Bool)

(declare-fun e!736855 () Bool)

(assert (=> b!1290715 (= e!736855 tp_is_empty!34275)))

(declare-fun b!1290716 () Bool)

(declare-fun res!857478 () Bool)

(assert (=> b!1290716 (=> (not res!857478) (not e!736856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85588 (_ BitVec 32)) Bool)

(assert (=> b!1290716 (= res!857478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290717 () Bool)

(declare-fun res!857473 () Bool)

(assert (=> b!1290717 (=> (not res!857473) (not e!736856))))

(assert (=> b!1290717 (= res!857473 (and (= (size!41846 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41845 _keys!1741) (size!41846 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290718 () Bool)

(declare-fun res!857479 () Bool)

(assert (=> b!1290718 (=> (not res!857479) (not e!736856))))

(declare-datatypes ((List!29285 0))(
  ( (Nil!29282) (Cons!29281 (h!30490 (_ BitVec 64)) (t!42849 List!29285)) )
))
(declare-fun arrayNoDuplicates!0 (array!85588 (_ BitVec 32) List!29285) Bool)

(assert (=> b!1290718 (= res!857479 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29282))))

(declare-fun mapNonEmpty!52973 () Bool)

(declare-fun mapRes!52973 () Bool)

(declare-fun tp!101023 () Bool)

(assert (=> mapNonEmpty!52973 (= mapRes!52973 (and tp!101023 e!736855))))

(declare-fun mapRest!52973 () (Array (_ BitVec 32) ValueCell!16239))

(declare-fun mapKey!52973 () (_ BitVec 32))

(declare-fun mapValue!52973 () ValueCell!16239)

(assert (=> mapNonEmpty!52973 (= (arr!41296 _values!1445) (store mapRest!52973 mapKey!52973 mapValue!52973))))

(declare-fun b!1290719 () Bool)

(declare-fun res!857474 () Bool)

(assert (=> b!1290719 (=> (not res!857474) (not e!736856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290719 (= res!857474 (not (validKeyInArray!0 (select (arr!41295 _keys!1741) from!2144))))))

(declare-fun b!1290720 () Bool)

(assert (=> b!1290720 (= e!736856 (not e!736851))))

(declare-fun res!857475 () Bool)

(assert (=> b!1290720 (=> res!857475 e!736851)))

(assert (=> b!1290720 (= res!857475 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290720 (not (contains!8022 (ListLongMap!19778 Nil!29281) k0!1205))))

(declare-fun lt!578763 () Unit!42722)

(declare-fun emptyContainsNothing!87 ((_ BitVec 64)) Unit!42722)

(assert (=> b!1290720 (= lt!578763 (emptyContainsNothing!87 k0!1205))))

(declare-fun mapIsEmpty!52973 () Bool)

(assert (=> mapIsEmpty!52973 mapRes!52973))

(declare-fun b!1290721 () Bool)

(declare-fun e!736854 () Bool)

(assert (=> b!1290721 (= e!736854 tp_is_empty!34275)))

(declare-fun b!1290722 () Bool)

(declare-fun res!857480 () Bool)

(assert (=> b!1290722 (=> (not res!857480) (not e!736856))))

(assert (=> b!1290722 (= res!857480 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41845 _keys!1741))))))

(declare-fun b!1290723 () Bool)

(declare-fun res!857476 () Bool)

(assert (=> b!1290723 (=> (not res!857476) (not e!736856))))

(declare-fun getCurrentListMap!4960 (array!85588 array!85590 (_ BitVec 32) (_ BitVec 32) V!50803 V!50803 (_ BitVec 32) Int) ListLongMap!19777)

(assert (=> b!1290723 (= res!857476 (contains!8022 (getCurrentListMap!4960 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290724 () Bool)

(assert (=> b!1290724 (= e!736853 (and e!736854 mapRes!52973))))

(declare-fun condMapEmpty!52973 () Bool)

(declare-fun mapDefault!52973 () ValueCell!16239)

(assert (=> b!1290724 (= condMapEmpty!52973 (= (arr!41296 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16239)) mapDefault!52973)))))

(assert (= (and start!109146 res!857481) b!1290717))

(assert (= (and b!1290717 res!857473) b!1290716))

(assert (= (and b!1290716 res!857478) b!1290718))

(assert (= (and b!1290718 res!857479) b!1290714))

(assert (= (and b!1290714 res!857477) b!1290723))

(assert (= (and b!1290723 res!857476) b!1290722))

(assert (= (and b!1290722 res!857480) b!1290719))

(assert (= (and b!1290719 res!857474) b!1290720))

(assert (= (and b!1290720 (not res!857475)) b!1290713))

(assert (= (and b!1290724 condMapEmpty!52973) mapIsEmpty!52973))

(assert (= (and b!1290724 (not condMapEmpty!52973)) mapNonEmpty!52973))

(get-info :version)

(assert (= (and mapNonEmpty!52973 ((_ is ValueCellFull!16239) mapValue!52973)) b!1290715))

(assert (= (and b!1290724 ((_ is ValueCellFull!16239) mapDefault!52973)) b!1290721))

(assert (= start!109146 b!1290724))

(declare-fun m!1183335 () Bool)

(assert (=> mapNonEmpty!52973 m!1183335))

(declare-fun m!1183337 () Bool)

(assert (=> b!1290720 m!1183337))

(declare-fun m!1183339 () Bool)

(assert (=> b!1290720 m!1183339))

(declare-fun m!1183341 () Bool)

(assert (=> b!1290716 m!1183341))

(declare-fun m!1183343 () Bool)

(assert (=> b!1290719 m!1183343))

(assert (=> b!1290719 m!1183343))

(declare-fun m!1183345 () Bool)

(assert (=> b!1290719 m!1183345))

(declare-fun m!1183347 () Bool)

(assert (=> b!1290718 m!1183347))

(declare-fun m!1183349 () Bool)

(assert (=> b!1290723 m!1183349))

(assert (=> b!1290723 m!1183349))

(declare-fun m!1183351 () Bool)

(assert (=> b!1290723 m!1183351))

(declare-fun m!1183353 () Bool)

(assert (=> start!109146 m!1183353))

(declare-fun m!1183355 () Bool)

(assert (=> start!109146 m!1183355))

(declare-fun m!1183357 () Bool)

(assert (=> start!109146 m!1183357))

(declare-fun m!1183359 () Bool)

(assert (=> b!1290713 m!1183359))

(declare-fun m!1183361 () Bool)

(assert (=> b!1290713 m!1183361))

(declare-fun m!1183363 () Bool)

(assert (=> b!1290713 m!1183363))

(declare-fun m!1183365 () Bool)

(assert (=> b!1290713 m!1183365))

(declare-fun m!1183367 () Bool)

(assert (=> b!1290713 m!1183367))

(declare-fun m!1183369 () Bool)

(assert (=> b!1290713 m!1183369))

(declare-fun m!1183371 () Bool)

(assert (=> b!1290713 m!1183371))

(declare-fun m!1183373 () Bool)

(assert (=> b!1290713 m!1183373))

(assert (=> b!1290713 m!1183365))

(check-sat (not b!1290718) (not mapNonEmpty!52973) (not b!1290720) (not b_next!28635) b_and!46725 (not b!1290713) (not b!1290719) (not start!109146) tp_is_empty!34275 (not b!1290723) (not b!1290716))
(check-sat b_and!46725 (not b_next!28635))

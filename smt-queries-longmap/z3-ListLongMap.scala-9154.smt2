; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109806 () Bool)

(assert start!109806)

(declare-fun b_free!29199 () Bool)

(declare-fun b_next!29199 () Bool)

(assert (=> start!109806 (= b_free!29199 (not b_next!29199))))

(declare-fun tp!102731 () Bool)

(declare-fun b_and!47313 () Bool)

(assert (=> start!109806 (= tp!102731 b_and!47313)))

(declare-fun bm!63742 () Bool)

(declare-datatypes ((Unit!43049 0))(
  ( (Unit!43050) )
))
(declare-fun call!63745 () Unit!43049)

(declare-fun call!63750 () Unit!43049)

(assert (=> bm!63742 (= call!63745 call!63750)))

(declare-fun b!1300806 () Bool)

(declare-fun e!741986 () Unit!43049)

(declare-fun lt!581562 () Unit!43049)

(assert (=> b!1300806 (= e!741986 lt!581562)))

(declare-datatypes ((V!51555 0))(
  ( (V!51556 (val!17494 Int)) )
))
(declare-datatypes ((tuple2!22566 0))(
  ( (tuple2!22567 (_1!11294 (_ BitVec 64)) (_2!11294 V!51555)) )
))
(declare-datatypes ((List!29697 0))(
  ( (Nil!29694) (Cons!29693 (h!30902 tuple2!22566) (t!43271 List!29697)) )
))
(declare-datatypes ((ListLongMap!20223 0))(
  ( (ListLongMap!20224 (toList!10127 List!29697)) )
))
(declare-fun lt!581563 () ListLongMap!20223)

(declare-fun call!63746 () ListLongMap!20223)

(assert (=> b!1300806 (= lt!581563 call!63746)))

(declare-fun lt!581565 () ListLongMap!20223)

(declare-fun zeroValue!1387 () V!51555)

(declare-fun +!4455 (ListLongMap!20223 tuple2!22566) ListLongMap!20223)

(assert (=> b!1300806 (= lt!581565 (+!4455 lt!581563 (tuple2!22567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!51555)

(declare-fun lt!581558 () Unit!43049)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!77 ((_ BitVec 64) (_ BitVec 64) V!51555 ListLongMap!20223) Unit!43049)

(assert (=> b!1300806 (= lt!581558 (lemmaInListMapAfterAddingDiffThenInBefore!77 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581565))))

(declare-fun call!63749 () Bool)

(assert (=> b!1300806 call!63749))

(assert (=> b!1300806 (= lt!581562 call!63750)))

(declare-fun contains!8253 (ListLongMap!20223 (_ BitVec 64)) Bool)

(assert (=> b!1300806 (contains!8253 lt!581563 k0!1205)))

(declare-fun b!1300807 () Bool)

(declare-fun res!864364 () Bool)

(declare-fun e!741989 () Bool)

(assert (=> b!1300807 (=> (not res!864364) (not e!741989))))

(declare-datatypes ((array!86690 0))(
  ( (array!86691 (arr!41841 (Array (_ BitVec 32) (_ BitVec 64))) (size!42391 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86690)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1300807 (= res!864364 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42391 _keys!1741))))))

(declare-fun b!1300808 () Bool)

(declare-fun res!864371 () Bool)

(assert (=> b!1300808 (=> (not res!864371) (not e!741989))))

(declare-datatypes ((List!29698 0))(
  ( (Nil!29695) (Cons!29694 (h!30903 (_ BitVec 64)) (t!43272 List!29698)) )
))
(declare-fun arrayNoDuplicates!0 (array!86690 (_ BitVec 32) List!29698) Bool)

(assert (=> b!1300808 (= res!864371 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29695))))

(declare-fun res!864370 () Bool)

(assert (=> start!109806 (=> (not res!864370) (not e!741989))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109806 (= res!864370 (validMask!0 mask!2175))))

(assert (=> start!109806 e!741989))

(declare-fun tp_is_empty!34839 () Bool)

(assert (=> start!109806 tp_is_empty!34839))

(assert (=> start!109806 true))

(declare-datatypes ((ValueCell!16521 0))(
  ( (ValueCellFull!16521 (v!20102 V!51555)) (EmptyCell!16521) )
))
(declare-datatypes ((array!86692 0))(
  ( (array!86693 (arr!41842 (Array (_ BitVec 32) ValueCell!16521)) (size!42392 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86692)

(declare-fun e!741987 () Bool)

(declare-fun array_inv!31655 (array!86692) Bool)

(assert (=> start!109806 (and (array_inv!31655 _values!1445) e!741987)))

(declare-fun array_inv!31656 (array!86690) Bool)

(assert (=> start!109806 (array_inv!31656 _keys!1741)))

(assert (=> start!109806 tp!102731))

(declare-fun b!1300809 () Bool)

(declare-fun e!741990 () Bool)

(assert (=> b!1300809 (= e!741990 tp_is_empty!34839)))

(declare-fun b!1300810 () Bool)

(declare-fun c!124643 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!581567 () Bool)

(assert (=> b!1300810 (= c!124643 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581567))))

(declare-fun e!741988 () Unit!43049)

(declare-fun e!741992 () Unit!43049)

(assert (=> b!1300810 (= e!741988 e!741992)))

(declare-fun b!1300811 () Bool)

(declare-fun res!864367 () Bool)

(assert (=> b!1300811 (=> (not res!864367) (not e!741989))))

(assert (=> b!1300811 (= res!864367 (and (= (size!42392 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42391 _keys!1741) (size!42392 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53834 () Bool)

(declare-fun mapRes!53834 () Bool)

(declare-fun tp!102730 () Bool)

(declare-fun e!741985 () Bool)

(assert (=> mapNonEmpty!53834 (= mapRes!53834 (and tp!102730 e!741985))))

(declare-fun mapRest!53834 () (Array (_ BitVec 32) ValueCell!16521))

(declare-fun mapKey!53834 () (_ BitVec 32))

(declare-fun mapValue!53834 () ValueCell!16521)

(assert (=> mapNonEmpty!53834 (= (arr!41842 _values!1445) (store mapRest!53834 mapKey!53834 mapValue!53834))))

(declare-fun bm!63743 () Bool)

(declare-fun call!63747 () ListLongMap!20223)

(assert (=> bm!63743 (= call!63747 call!63746)))

(declare-fun c!124642 () Bool)

(declare-fun lt!581561 () ListLongMap!20223)

(declare-fun c!124641 () Bool)

(declare-fun bm!63744 () Bool)

(declare-fun lt!581560 () ListLongMap!20223)

(assert (=> bm!63744 (= call!63750 (lemmaInListMapAfterAddingDiffThenInBefore!77 k0!1205 (ite (or c!124642 c!124641) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124642 c!124641) zeroValue!1387 minValue!1387) (ite c!124642 lt!581563 (ite c!124641 lt!581560 lt!581561))))))

(declare-fun b!1300812 () Bool)

(declare-fun lt!581559 () Unit!43049)

(assert (=> b!1300812 (= e!741992 lt!581559)))

(assert (=> b!1300812 (= lt!581561 call!63747)))

(assert (=> b!1300812 (= lt!581559 call!63745)))

(declare-fun call!63748 () Bool)

(assert (=> b!1300812 call!63748))

(declare-fun bm!63745 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6086 (array!86690 array!86692 (_ BitVec 32) (_ BitVec 32) V!51555 V!51555 (_ BitVec 32) Int) ListLongMap!20223)

(assert (=> bm!63745 (= call!63746 (getCurrentListMapNoExtraKeys!6086 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300813 () Bool)

(assert (=> b!1300813 call!63748))

(declare-fun lt!581564 () Unit!43049)

(assert (=> b!1300813 (= lt!581564 call!63745)))

(assert (=> b!1300813 (= lt!581560 call!63747)))

(assert (=> b!1300813 (= e!741988 lt!581564)))

(declare-fun b!1300814 () Bool)

(declare-fun res!864365 () Bool)

(assert (=> b!1300814 (=> (not res!864365) (not e!741989))))

(assert (=> b!1300814 (= res!864365 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42391 _keys!1741))))))

(declare-fun b!1300815 () Bool)

(declare-fun res!864368 () Bool)

(assert (=> b!1300815 (=> (not res!864368) (not e!741989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86690 (_ BitVec 32)) Bool)

(assert (=> b!1300815 (= res!864368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300816 () Bool)

(declare-fun res!864369 () Bool)

(assert (=> b!1300816 (=> (not res!864369) (not e!741989))))

(declare-fun getCurrentListMap!5153 (array!86690 array!86692 (_ BitVec 32) (_ BitVec 32) V!51555 V!51555 (_ BitVec 32) Int) ListLongMap!20223)

(assert (=> b!1300816 (= res!864369 (contains!8253 (getCurrentListMap!5153 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63746 () Bool)

(assert (=> bm!63746 (= call!63749 (contains!8253 (ite c!124642 lt!581565 (ite c!124641 lt!581560 lt!581561)) k0!1205))))

(declare-fun b!1300817 () Bool)

(declare-fun Unit!43051 () Unit!43049)

(assert (=> b!1300817 (= e!741992 Unit!43051)))

(declare-fun b!1300818 () Bool)

(assert (=> b!1300818 (= e!741989 (not true))))

(assert (=> b!1300818 (not (contains!8253 (ListLongMap!20224 Nil!29694) k0!1205))))

(declare-fun lt!581566 () Unit!43049)

(declare-fun emptyContainsNothing!195 ((_ BitVec 64)) Unit!43049)

(assert (=> b!1300818 (= lt!581566 (emptyContainsNothing!195 k0!1205))))

(declare-fun lt!581557 () Unit!43049)

(assert (=> b!1300818 (= lt!581557 e!741986)))

(assert (=> b!1300818 (= c!124642 (and (not lt!581567) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300818 (= lt!581567 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1300819 () Bool)

(assert (=> b!1300819 (= e!741985 tp_is_empty!34839)))

(declare-fun b!1300820 () Bool)

(assert (=> b!1300820 (= e!741987 (and e!741990 mapRes!53834))))

(declare-fun condMapEmpty!53834 () Bool)

(declare-fun mapDefault!53834 () ValueCell!16521)

(assert (=> b!1300820 (= condMapEmpty!53834 (= (arr!41842 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16521)) mapDefault!53834)))))

(declare-fun mapIsEmpty!53834 () Bool)

(assert (=> mapIsEmpty!53834 mapRes!53834))

(declare-fun b!1300821 () Bool)

(declare-fun res!864366 () Bool)

(assert (=> b!1300821 (=> (not res!864366) (not e!741989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300821 (= res!864366 (validKeyInArray!0 (select (arr!41841 _keys!1741) from!2144)))))

(declare-fun bm!63747 () Bool)

(assert (=> bm!63747 (= call!63748 call!63749)))

(declare-fun b!1300822 () Bool)

(assert (=> b!1300822 (= e!741986 e!741988)))

(assert (=> b!1300822 (= c!124641 (and (not lt!581567) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!109806 res!864370) b!1300811))

(assert (= (and b!1300811 res!864367) b!1300815))

(assert (= (and b!1300815 res!864368) b!1300808))

(assert (= (and b!1300808 res!864371) b!1300814))

(assert (= (and b!1300814 res!864365) b!1300816))

(assert (= (and b!1300816 res!864369) b!1300807))

(assert (= (and b!1300807 res!864364) b!1300821))

(assert (= (and b!1300821 res!864366) b!1300818))

(assert (= (and b!1300818 c!124642) b!1300806))

(assert (= (and b!1300818 (not c!124642)) b!1300822))

(assert (= (and b!1300822 c!124641) b!1300813))

(assert (= (and b!1300822 (not c!124641)) b!1300810))

(assert (= (and b!1300810 c!124643) b!1300812))

(assert (= (and b!1300810 (not c!124643)) b!1300817))

(assert (= (or b!1300813 b!1300812) bm!63743))

(assert (= (or b!1300813 b!1300812) bm!63742))

(assert (= (or b!1300813 b!1300812) bm!63747))

(assert (= (or b!1300806 bm!63743) bm!63745))

(assert (= (or b!1300806 bm!63742) bm!63744))

(assert (= (or b!1300806 bm!63747) bm!63746))

(assert (= (and b!1300820 condMapEmpty!53834) mapIsEmpty!53834))

(assert (= (and b!1300820 (not condMapEmpty!53834)) mapNonEmpty!53834))

(get-info :version)

(assert (= (and mapNonEmpty!53834 ((_ is ValueCellFull!16521) mapValue!53834)) b!1300819))

(assert (= (and b!1300820 ((_ is ValueCellFull!16521) mapDefault!53834)) b!1300809))

(assert (= start!109806 b!1300820))

(declare-fun m!1191625 () Bool)

(assert (=> start!109806 m!1191625))

(declare-fun m!1191627 () Bool)

(assert (=> start!109806 m!1191627))

(declare-fun m!1191629 () Bool)

(assert (=> start!109806 m!1191629))

(declare-fun m!1191631 () Bool)

(assert (=> b!1300818 m!1191631))

(declare-fun m!1191633 () Bool)

(assert (=> b!1300818 m!1191633))

(declare-fun m!1191635 () Bool)

(assert (=> b!1300808 m!1191635))

(declare-fun m!1191637 () Bool)

(assert (=> bm!63745 m!1191637))

(declare-fun m!1191639 () Bool)

(assert (=> bm!63746 m!1191639))

(declare-fun m!1191641 () Bool)

(assert (=> mapNonEmpty!53834 m!1191641))

(declare-fun m!1191643 () Bool)

(assert (=> bm!63744 m!1191643))

(declare-fun m!1191645 () Bool)

(assert (=> b!1300806 m!1191645))

(declare-fun m!1191647 () Bool)

(assert (=> b!1300806 m!1191647))

(declare-fun m!1191649 () Bool)

(assert (=> b!1300806 m!1191649))

(declare-fun m!1191651 () Bool)

(assert (=> b!1300815 m!1191651))

(declare-fun m!1191653 () Bool)

(assert (=> b!1300821 m!1191653))

(assert (=> b!1300821 m!1191653))

(declare-fun m!1191655 () Bool)

(assert (=> b!1300821 m!1191655))

(declare-fun m!1191657 () Bool)

(assert (=> b!1300816 m!1191657))

(assert (=> b!1300816 m!1191657))

(declare-fun m!1191659 () Bool)

(assert (=> b!1300816 m!1191659))

(check-sat (not start!109806) (not mapNonEmpty!53834) tp_is_empty!34839 (not bm!63746) (not bm!63744) (not b!1300806) b_and!47313 (not b!1300821) (not b!1300816) (not b_next!29199) (not b!1300808) (not b!1300818) (not bm!63745) (not b!1300815))
(check-sat b_and!47313 (not b_next!29199))

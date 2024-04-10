; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108912 () Bool)

(assert start!108912)

(declare-fun b_free!28425 () Bool)

(declare-fun b_next!28425 () Bool)

(assert (=> start!108912 (= b_free!28425 (not b_next!28425))))

(declare-fun tp!100391 () Bool)

(declare-fun b_and!46509 () Bool)

(assert (=> start!108912 (= tp!100391 b_and!46509)))

(declare-fun b!1286744 () Bool)

(declare-fun res!854681 () Bool)

(declare-fun e!734903 () Bool)

(assert (=> b!1286744 (=> (not res!854681) (not e!734903))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85178 0))(
  ( (array!85179 (arr!41091 (Array (_ BitVec 32) (_ BitVec 64))) (size!41641 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85178)

(declare-datatypes ((V!50523 0))(
  ( (V!50524 (val!17107 Int)) )
))
(declare-datatypes ((ValueCell!16134 0))(
  ( (ValueCellFull!16134 (v!19709 V!50523)) (EmptyCell!16134) )
))
(declare-datatypes ((array!85180 0))(
  ( (array!85181 (arr!41092 (Array (_ BitVec 32) ValueCell!16134)) (size!41642 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85180)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286744 (= res!854681 (and (= (size!41642 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41641 _keys!1741) (size!41642 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63021 () Bool)

(declare-datatypes ((tuple2!21938 0))(
  ( (tuple2!21939 (_1!10980 (_ BitVec 64)) (_2!10980 V!50523)) )
))
(declare-datatypes ((List!29122 0))(
  ( (Nil!29119) (Cons!29118 (h!30327 tuple2!21938) (t!42684 List!29122)) )
))
(declare-datatypes ((ListLongMap!19595 0))(
  ( (ListLongMap!19596 (toList!9813 List!29122)) )
))
(declare-fun call!63024 () ListLongMap!19595)

(declare-fun call!63027 () ListLongMap!19595)

(assert (=> bm!63021 (= call!63024 call!63027)))

(declare-fun b!1286745 () Bool)

(declare-datatypes ((Unit!42543 0))(
  ( (Unit!42544) )
))
(declare-fun e!734898 () Unit!42543)

(declare-fun Unit!42545 () Unit!42543)

(assert (=> b!1286745 (= e!734898 Unit!42545)))

(declare-fun b!1286746 () Bool)

(declare-fun e!734899 () Bool)

(declare-fun e!734902 () Bool)

(declare-fun mapRes!52655 () Bool)

(assert (=> b!1286746 (= e!734899 (and e!734902 mapRes!52655))))

(declare-fun condMapEmpty!52655 () Bool)

(declare-fun mapDefault!52655 () ValueCell!16134)

(assert (=> b!1286746 (= condMapEmpty!52655 (= (arr!41092 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16134)) mapDefault!52655)))))

(declare-fun b!1286747 () Bool)

(declare-fun res!854680 () Bool)

(assert (=> b!1286747 (=> (not res!854680) (not e!734903))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1286747 (= res!854680 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41641 _keys!1741))))))

(declare-fun b!1286748 () Bool)

(declare-fun e!734897 () Bool)

(declare-fun tp_is_empty!34065 () Bool)

(assert (=> b!1286748 (= e!734897 tp_is_empty!34065)))

(declare-fun minValue!1387 () V!50523)

(declare-fun zeroValue!1387 () V!50523)

(declare-fun lt!577476 () ListLongMap!19595)

(declare-fun lt!577479 () ListLongMap!19595)

(declare-fun call!63026 () Unit!42543)

(declare-fun c!124228 () Bool)

(declare-fun c!124226 () Bool)

(declare-fun bm!63022 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577478 () ListLongMap!19595)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!35 ((_ BitVec 64) (_ BitVec 64) V!50523 ListLongMap!19595) Unit!42543)

(assert (=> bm!63022 (= call!63026 (lemmaInListMapAfterAddingDiffThenInBefore!35 k0!1205 (ite (or c!124226 c!124228) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124226 c!124228) zeroValue!1387 minValue!1387) (ite c!124226 lt!577476 (ite c!124228 lt!577479 lt!577478))))))

(declare-fun b!1286749 () Bool)

(declare-fun call!63029 () Bool)

(assert (=> b!1286749 call!63029))

(declare-fun lt!577471 () Unit!42543)

(declare-fun call!63028 () Unit!42543)

(assert (=> b!1286749 (= lt!577471 call!63028)))

(assert (=> b!1286749 (= lt!577479 call!63024)))

(declare-fun e!734901 () Unit!42543)

(assert (=> b!1286749 (= e!734901 lt!577471)))

(declare-fun b!1286750 () Bool)

(assert (=> b!1286750 (= e!734902 tp_is_empty!34065)))

(declare-fun b!1286751 () Bool)

(declare-fun lt!577477 () Unit!42543)

(assert (=> b!1286751 (= e!734898 lt!577477)))

(assert (=> b!1286751 (= lt!577478 call!63024)))

(assert (=> b!1286751 (= lt!577477 call!63028)))

(assert (=> b!1286751 call!63029))

(declare-fun b!1286752 () Bool)

(assert (=> b!1286752 (= e!734903 (not true))))

(declare-fun contains!7929 (ListLongMap!19595 (_ BitVec 64)) Bool)

(assert (=> b!1286752 (not (contains!7929 (ListLongMap!19596 Nil!29119) k0!1205))))

(declare-fun lt!577470 () Unit!42543)

(declare-fun emptyContainsNothing!7 ((_ BitVec 64)) Unit!42543)

(assert (=> b!1286752 (= lt!577470 (emptyContainsNothing!7 k0!1205))))

(declare-fun lt!577472 () Unit!42543)

(declare-fun e!734896 () Unit!42543)

(assert (=> b!1286752 (= lt!577472 e!734896)))

(declare-fun lt!577475 () Bool)

(assert (=> b!1286752 (= c!124226 (and (not lt!577475) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286752 (= lt!577475 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286753 () Bool)

(declare-fun res!854676 () Bool)

(assert (=> b!1286753 (=> (not res!854676) (not e!734903))))

(declare-datatypes ((List!29123 0))(
  ( (Nil!29120) (Cons!29119 (h!30328 (_ BitVec 64)) (t!42685 List!29123)) )
))
(declare-fun arrayNoDuplicates!0 (array!85178 (_ BitVec 32) List!29123) Bool)

(assert (=> b!1286753 (= res!854676 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29120))))

(declare-fun b!1286754 () Bool)

(declare-fun res!854678 () Bool)

(assert (=> b!1286754 (=> (not res!854678) (not e!734903))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4888 (array!85178 array!85180 (_ BitVec 32) (_ BitVec 32) V!50523 V!50523 (_ BitVec 32) Int) ListLongMap!19595)

(assert (=> b!1286754 (= res!854678 (contains!7929 (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63023 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5947 (array!85178 array!85180 (_ BitVec 32) (_ BitVec 32) V!50523 V!50523 (_ BitVec 32) Int) ListLongMap!19595)

(assert (=> bm!63023 (= call!63027 (getCurrentListMapNoExtraKeys!5947 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286755 () Bool)

(declare-fun res!854679 () Bool)

(assert (=> b!1286755 (=> (not res!854679) (not e!734903))))

(assert (=> b!1286755 (= res!854679 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41641 _keys!1741))))))

(declare-fun bm!63024 () Bool)

(assert (=> bm!63024 (= call!63028 call!63026)))

(declare-fun b!1286756 () Bool)

(declare-fun c!124227 () Bool)

(assert (=> b!1286756 (= c!124227 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577475))))

(assert (=> b!1286756 (= e!734901 e!734898)))

(declare-fun b!1286757 () Bool)

(assert (=> b!1286757 (= e!734896 e!734901)))

(assert (=> b!1286757 (= c!124228 (and (not lt!577475) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!52655 () Bool)

(assert (=> mapIsEmpty!52655 mapRes!52655))

(declare-fun b!1286758 () Bool)

(declare-fun res!854677 () Bool)

(assert (=> b!1286758 (=> (not res!854677) (not e!734903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286758 (= res!854677 (validKeyInArray!0 (select (arr!41091 _keys!1741) from!2144)))))

(declare-fun res!854675 () Bool)

(assert (=> start!108912 (=> (not res!854675) (not e!734903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108912 (= res!854675 (validMask!0 mask!2175))))

(assert (=> start!108912 e!734903))

(assert (=> start!108912 tp_is_empty!34065))

(assert (=> start!108912 true))

(declare-fun array_inv!31159 (array!85180) Bool)

(assert (=> start!108912 (and (array_inv!31159 _values!1445) e!734899)))

(declare-fun array_inv!31160 (array!85178) Bool)

(assert (=> start!108912 (array_inv!31160 _keys!1741)))

(assert (=> start!108912 tp!100391))

(declare-fun bm!63025 () Bool)

(declare-fun call!63025 () Bool)

(assert (=> bm!63025 (= call!63029 call!63025)))

(declare-fun b!1286759 () Bool)

(declare-fun lt!577474 () Unit!42543)

(assert (=> b!1286759 (= e!734896 lt!577474)))

(assert (=> b!1286759 (= lt!577476 call!63027)))

(declare-fun lt!577473 () ListLongMap!19595)

(declare-fun +!4319 (ListLongMap!19595 tuple2!21938) ListLongMap!19595)

(assert (=> b!1286759 (= lt!577473 (+!4319 lt!577476 (tuple2!21939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577480 () Unit!42543)

(assert (=> b!1286759 (= lt!577480 (lemmaInListMapAfterAddingDiffThenInBefore!35 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577473))))

(assert (=> b!1286759 (contains!7929 lt!577473 k0!1205)))

(assert (=> b!1286759 (= lt!577474 call!63026)))

(assert (=> b!1286759 call!63025))

(declare-fun b!1286760 () Bool)

(declare-fun res!854682 () Bool)

(assert (=> b!1286760 (=> (not res!854682) (not e!734903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85178 (_ BitVec 32)) Bool)

(assert (=> b!1286760 (= res!854682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52655 () Bool)

(declare-fun tp!100390 () Bool)

(assert (=> mapNonEmpty!52655 (= mapRes!52655 (and tp!100390 e!734897))))

(declare-fun mapKey!52655 () (_ BitVec 32))

(declare-fun mapValue!52655 () ValueCell!16134)

(declare-fun mapRest!52655 () (Array (_ BitVec 32) ValueCell!16134))

(assert (=> mapNonEmpty!52655 (= (arr!41092 _values!1445) (store mapRest!52655 mapKey!52655 mapValue!52655))))

(declare-fun bm!63026 () Bool)

(assert (=> bm!63026 (= call!63025 (contains!7929 (ite c!124226 lt!577476 (ite c!124228 lt!577479 lt!577478)) k0!1205))))

(assert (= (and start!108912 res!854675) b!1286744))

(assert (= (and b!1286744 res!854681) b!1286760))

(assert (= (and b!1286760 res!854682) b!1286753))

(assert (= (and b!1286753 res!854676) b!1286747))

(assert (= (and b!1286747 res!854680) b!1286754))

(assert (= (and b!1286754 res!854678) b!1286755))

(assert (= (and b!1286755 res!854679) b!1286758))

(assert (= (and b!1286758 res!854677) b!1286752))

(assert (= (and b!1286752 c!124226) b!1286759))

(assert (= (and b!1286752 (not c!124226)) b!1286757))

(assert (= (and b!1286757 c!124228) b!1286749))

(assert (= (and b!1286757 (not c!124228)) b!1286756))

(assert (= (and b!1286756 c!124227) b!1286751))

(assert (= (and b!1286756 (not c!124227)) b!1286745))

(assert (= (or b!1286749 b!1286751) bm!63021))

(assert (= (or b!1286749 b!1286751) bm!63024))

(assert (= (or b!1286749 b!1286751) bm!63025))

(assert (= (or b!1286759 bm!63021) bm!63023))

(assert (= (or b!1286759 bm!63024) bm!63022))

(assert (= (or b!1286759 bm!63025) bm!63026))

(assert (= (and b!1286746 condMapEmpty!52655) mapIsEmpty!52655))

(assert (= (and b!1286746 (not condMapEmpty!52655)) mapNonEmpty!52655))

(get-info :version)

(assert (= (and mapNonEmpty!52655 ((_ is ValueCellFull!16134) mapValue!52655)) b!1286748))

(assert (= (and b!1286746 ((_ is ValueCellFull!16134) mapDefault!52655)) b!1286750))

(assert (= start!108912 b!1286746))

(declare-fun m!1179765 () Bool)

(assert (=> b!1286754 m!1179765))

(assert (=> b!1286754 m!1179765))

(declare-fun m!1179767 () Bool)

(assert (=> b!1286754 m!1179767))

(declare-fun m!1179769 () Bool)

(assert (=> mapNonEmpty!52655 m!1179769))

(declare-fun m!1179771 () Bool)

(assert (=> b!1286753 m!1179771))

(declare-fun m!1179773 () Bool)

(assert (=> b!1286758 m!1179773))

(assert (=> b!1286758 m!1179773))

(declare-fun m!1179775 () Bool)

(assert (=> b!1286758 m!1179775))

(declare-fun m!1179777 () Bool)

(assert (=> bm!63026 m!1179777))

(declare-fun m!1179779 () Bool)

(assert (=> b!1286760 m!1179779))

(declare-fun m!1179781 () Bool)

(assert (=> bm!63022 m!1179781))

(declare-fun m!1179783 () Bool)

(assert (=> b!1286752 m!1179783))

(declare-fun m!1179785 () Bool)

(assert (=> b!1286752 m!1179785))

(declare-fun m!1179787 () Bool)

(assert (=> b!1286759 m!1179787))

(declare-fun m!1179789 () Bool)

(assert (=> b!1286759 m!1179789))

(declare-fun m!1179791 () Bool)

(assert (=> b!1286759 m!1179791))

(declare-fun m!1179793 () Bool)

(assert (=> start!108912 m!1179793))

(declare-fun m!1179795 () Bool)

(assert (=> start!108912 m!1179795))

(declare-fun m!1179797 () Bool)

(assert (=> start!108912 m!1179797))

(declare-fun m!1179799 () Bool)

(assert (=> bm!63023 m!1179799))

(check-sat tp_is_empty!34065 (not b!1286754) (not bm!63023) (not b!1286753) (not b!1286759) (not b_next!28425) (not b!1286760) (not bm!63026) (not start!108912) b_and!46509 (not bm!63022) (not b!1286752) (not mapNonEmpty!52655) (not b!1286758))
(check-sat b_and!46509 (not b_next!28425))

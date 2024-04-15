; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108916 () Bool)

(assert start!108916)

(declare-fun b_free!28429 () Bool)

(declare-fun b_next!28429 () Bool)

(assert (=> start!108916 (= b_free!28429 (not b_next!28429))))

(declare-fun tp!100403 () Bool)

(declare-fun b_and!46495 () Bool)

(assert (=> start!108916 (= tp!100403 b_and!46495)))

(declare-fun b!1286782 () Bool)

(declare-datatypes ((Unit!42391 0))(
  ( (Unit!42392) )
))
(declare-fun e!734922 () Unit!42391)

(declare-fun lt!577367 () Unit!42391)

(assert (=> b!1286782 (= e!734922 lt!577367)))

(declare-datatypes ((V!50529 0))(
  ( (V!50530 (val!17109 Int)) )
))
(declare-datatypes ((tuple2!22006 0))(
  ( (tuple2!22007 (_1!11014 (_ BitVec 64)) (_2!11014 V!50529)) )
))
(declare-datatypes ((List!29181 0))(
  ( (Nil!29178) (Cons!29177 (h!30386 tuple2!22006) (t!42735 List!29181)) )
))
(declare-datatypes ((ListLongMap!19663 0))(
  ( (ListLongMap!19664 (toList!9847 List!29181)) )
))
(declare-fun lt!577366 () ListLongMap!19663)

(declare-fun call!63045 () ListLongMap!19663)

(assert (=> b!1286782 (= lt!577366 call!63045)))

(declare-fun call!63046 () Unit!42391)

(assert (=> b!1286782 (= lt!577367 call!63046)))

(declare-fun call!63042 () Bool)

(assert (=> b!1286782 call!63042))

(declare-fun b!1286783 () Bool)

(declare-fun e!734918 () Bool)

(declare-fun e!734916 () Bool)

(declare-fun mapRes!52661 () Bool)

(assert (=> b!1286783 (= e!734918 (and e!734916 mapRes!52661))))

(declare-fun condMapEmpty!52661 () Bool)

(declare-datatypes ((ValueCell!16136 0))(
  ( (ValueCellFull!16136 (v!19710 V!50529)) (EmptyCell!16136) )
))
(declare-datatypes ((array!85077 0))(
  ( (array!85078 (arr!41041 (Array (_ BitVec 32) ValueCell!16136)) (size!41593 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85077)

(declare-fun mapDefault!52661 () ValueCell!16136)

(assert (=> b!1286783 (= condMapEmpty!52661 (= (arr!41041 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16136)) mapDefault!52661)))))

(declare-fun c!124228 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun call!63041 () Bool)

(declare-fun bm!63038 () Bool)

(declare-fun c!124230 () Bool)

(declare-fun lt!577359 () ListLongMap!19663)

(declare-fun lt!577358 () ListLongMap!19663)

(declare-fun contains!7893 (ListLongMap!19663 (_ BitVec 64)) Bool)

(assert (=> bm!63038 (= call!63041 (contains!7893 (ite c!124230 lt!577359 (ite c!124228 lt!577358 lt!577366)) k0!1205))))

(declare-fun b!1286784 () Bool)

(declare-fun e!734920 () Unit!42391)

(declare-fun e!734919 () Unit!42391)

(assert (=> b!1286784 (= e!734920 e!734919)))

(declare-fun lt!577360 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286784 (= c!124228 (and (not lt!577360) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun minValue!1387 () V!50529)

(declare-fun zeroValue!1387 () V!50529)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun call!63043 () ListLongMap!19663)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun bm!63039 () Bool)

(declare-datatypes ((array!85079 0))(
  ( (array!85080 (arr!41042 (Array (_ BitVec 32) (_ BitVec 64))) (size!41594 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85079)

(declare-fun getCurrentListMapNoExtraKeys!5988 (array!85079 array!85077 (_ BitVec 32) (_ BitVec 32) V!50529 V!50529 (_ BitVec 32) Int) ListLongMap!19663)

(assert (=> bm!63039 (= call!63043 (getCurrentListMapNoExtraKeys!5988 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!854698 () Bool)

(declare-fun e!734921 () Bool)

(assert (=> start!108916 (=> (not res!854698) (not e!734921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108916 (= res!854698 (validMask!0 mask!2175))))

(assert (=> start!108916 e!734921))

(declare-fun tp_is_empty!34069 () Bool)

(assert (=> start!108916 tp_is_empty!34069))

(assert (=> start!108916 true))

(declare-fun array_inv!31277 (array!85077) Bool)

(assert (=> start!108916 (and (array_inv!31277 _values!1445) e!734918)))

(declare-fun array_inv!31278 (array!85079) Bool)

(assert (=> start!108916 (array_inv!31278 _keys!1741)))

(assert (=> start!108916 tp!100403))

(declare-fun mapIsEmpty!52661 () Bool)

(assert (=> mapIsEmpty!52661 mapRes!52661))

(declare-fun bm!63040 () Bool)

(declare-fun call!63044 () Unit!42391)

(assert (=> bm!63040 (= call!63046 call!63044)))

(declare-fun b!1286785 () Bool)

(assert (=> b!1286785 (= e!734921 (not true))))

(assert (=> b!1286785 (not (contains!7893 (ListLongMap!19664 Nil!29178) k0!1205))))

(declare-fun lt!577365 () Unit!42391)

(declare-fun emptyContainsNothing!8 ((_ BitVec 64)) Unit!42391)

(assert (=> b!1286785 (= lt!577365 (emptyContainsNothing!8 k0!1205))))

(declare-fun lt!577368 () Unit!42391)

(assert (=> b!1286785 (= lt!577368 e!734920)))

(assert (=> b!1286785 (= c!124230 (and (not lt!577360) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286785 (= lt!577360 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286786 () Bool)

(declare-fun lt!577363 () Unit!42391)

(assert (=> b!1286786 (= e!734920 lt!577363)))

(declare-fun lt!577361 () ListLongMap!19663)

(assert (=> b!1286786 (= lt!577361 call!63043)))

(declare-fun +!4360 (ListLongMap!19663 tuple2!22006) ListLongMap!19663)

(assert (=> b!1286786 (= lt!577359 (+!4360 lt!577361 (tuple2!22007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577364 () Unit!42391)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!38 ((_ BitVec 64) (_ BitVec 64) V!50529 ListLongMap!19663) Unit!42391)

(assert (=> b!1286786 (= lt!577364 (lemmaInListMapAfterAddingDiffThenInBefore!38 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577359))))

(assert (=> b!1286786 call!63041))

(assert (=> b!1286786 (= lt!577363 call!63044)))

(assert (=> b!1286786 (contains!7893 lt!577361 k0!1205)))

(declare-fun b!1286787 () Bool)

(declare-fun res!854699 () Bool)

(assert (=> b!1286787 (=> (not res!854699) (not e!734921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85079 (_ BitVec 32)) Bool)

(assert (=> b!1286787 (= res!854699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286788 () Bool)

(declare-fun c!124229 () Bool)

(assert (=> b!1286788 (= c!124229 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577360))))

(assert (=> b!1286788 (= e!734919 e!734922)))

(declare-fun b!1286789 () Bool)

(declare-fun e!734915 () Bool)

(assert (=> b!1286789 (= e!734915 tp_is_empty!34069)))

(declare-fun bm!63041 () Bool)

(assert (=> bm!63041 (= call!63045 call!63043)))

(declare-fun b!1286790 () Bool)

(declare-fun res!854701 () Bool)

(assert (=> b!1286790 (=> (not res!854701) (not e!734921))))

(assert (=> b!1286790 (= res!854701 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41594 _keys!1741))))))

(declare-fun b!1286791 () Bool)

(declare-fun Unit!42393 () Unit!42391)

(assert (=> b!1286791 (= e!734922 Unit!42393)))

(declare-fun b!1286792 () Bool)

(assert (=> b!1286792 (= e!734916 tp_is_empty!34069)))

(declare-fun b!1286793 () Bool)

(declare-fun res!854697 () Bool)

(assert (=> b!1286793 (=> (not res!854697) (not e!734921))))

(declare-fun getCurrentListMap!4811 (array!85079 array!85077 (_ BitVec 32) (_ BitVec 32) V!50529 V!50529 (_ BitVec 32) Int) ListLongMap!19663)

(assert (=> b!1286793 (= res!854697 (contains!7893 (getCurrentListMap!4811 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63042 () Bool)

(assert (=> bm!63042 (= call!63044 (lemmaInListMapAfterAddingDiffThenInBefore!38 k0!1205 (ite (or c!124230 c!124228) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124230 c!124228) zeroValue!1387 minValue!1387) (ite c!124230 lt!577361 (ite c!124228 lt!577358 lt!577366))))))

(declare-fun b!1286794 () Bool)

(assert (=> b!1286794 call!63042))

(declare-fun lt!577362 () Unit!42391)

(assert (=> b!1286794 (= lt!577362 call!63046)))

(assert (=> b!1286794 (= lt!577358 call!63045)))

(assert (=> b!1286794 (= e!734919 lt!577362)))

(declare-fun mapNonEmpty!52661 () Bool)

(declare-fun tp!100404 () Bool)

(assert (=> mapNonEmpty!52661 (= mapRes!52661 (and tp!100404 e!734915))))

(declare-fun mapKey!52661 () (_ BitVec 32))

(declare-fun mapValue!52661 () ValueCell!16136)

(declare-fun mapRest!52661 () (Array (_ BitVec 32) ValueCell!16136))

(assert (=> mapNonEmpty!52661 (= (arr!41041 _values!1445) (store mapRest!52661 mapKey!52661 mapValue!52661))))

(declare-fun b!1286795 () Bool)

(declare-fun res!854700 () Bool)

(assert (=> b!1286795 (=> (not res!854700) (not e!734921))))

(declare-datatypes ((List!29182 0))(
  ( (Nil!29179) (Cons!29178 (h!30387 (_ BitVec 64)) (t!42736 List!29182)) )
))
(declare-fun arrayNoDuplicates!0 (array!85079 (_ BitVec 32) List!29182) Bool)

(assert (=> b!1286795 (= res!854700 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29179))))

(declare-fun b!1286796 () Bool)

(declare-fun res!854696 () Bool)

(assert (=> b!1286796 (=> (not res!854696) (not e!734921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286796 (= res!854696 (validKeyInArray!0 (select (arr!41042 _keys!1741) from!2144)))))

(declare-fun b!1286797 () Bool)

(declare-fun res!854702 () Bool)

(assert (=> b!1286797 (=> (not res!854702) (not e!734921))))

(assert (=> b!1286797 (= res!854702 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41594 _keys!1741))))))

(declare-fun b!1286798 () Bool)

(declare-fun res!854703 () Bool)

(assert (=> b!1286798 (=> (not res!854703) (not e!734921))))

(assert (=> b!1286798 (= res!854703 (and (= (size!41593 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41594 _keys!1741) (size!41593 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63043 () Bool)

(assert (=> bm!63043 (= call!63042 call!63041)))

(assert (= (and start!108916 res!854698) b!1286798))

(assert (= (and b!1286798 res!854703) b!1286787))

(assert (= (and b!1286787 res!854699) b!1286795))

(assert (= (and b!1286795 res!854700) b!1286790))

(assert (= (and b!1286790 res!854701) b!1286793))

(assert (= (and b!1286793 res!854697) b!1286797))

(assert (= (and b!1286797 res!854702) b!1286796))

(assert (= (and b!1286796 res!854696) b!1286785))

(assert (= (and b!1286785 c!124230) b!1286786))

(assert (= (and b!1286785 (not c!124230)) b!1286784))

(assert (= (and b!1286784 c!124228) b!1286794))

(assert (= (and b!1286784 (not c!124228)) b!1286788))

(assert (= (and b!1286788 c!124229) b!1286782))

(assert (= (and b!1286788 (not c!124229)) b!1286791))

(assert (= (or b!1286794 b!1286782) bm!63041))

(assert (= (or b!1286794 b!1286782) bm!63040))

(assert (= (or b!1286794 b!1286782) bm!63043))

(assert (= (or b!1286786 bm!63041) bm!63039))

(assert (= (or b!1286786 bm!63040) bm!63042))

(assert (= (or b!1286786 bm!63043) bm!63038))

(assert (= (and b!1286783 condMapEmpty!52661) mapIsEmpty!52661))

(assert (= (and b!1286783 (not condMapEmpty!52661)) mapNonEmpty!52661))

(get-info :version)

(assert (= (and mapNonEmpty!52661 ((_ is ValueCellFull!16136) mapValue!52661)) b!1286789))

(assert (= (and b!1286783 ((_ is ValueCellFull!16136) mapDefault!52661)) b!1286792))

(assert (= start!108916 b!1286783))

(declare-fun m!1179337 () Bool)

(assert (=> bm!63038 m!1179337))

(declare-fun m!1179339 () Bool)

(assert (=> b!1286787 m!1179339))

(declare-fun m!1179341 () Bool)

(assert (=> mapNonEmpty!52661 m!1179341))

(declare-fun m!1179343 () Bool)

(assert (=> b!1286796 m!1179343))

(assert (=> b!1286796 m!1179343))

(declare-fun m!1179345 () Bool)

(assert (=> b!1286796 m!1179345))

(declare-fun m!1179347 () Bool)

(assert (=> start!108916 m!1179347))

(declare-fun m!1179349 () Bool)

(assert (=> start!108916 m!1179349))

(declare-fun m!1179351 () Bool)

(assert (=> start!108916 m!1179351))

(declare-fun m!1179353 () Bool)

(assert (=> b!1286786 m!1179353))

(declare-fun m!1179355 () Bool)

(assert (=> b!1286786 m!1179355))

(declare-fun m!1179357 () Bool)

(assert (=> b!1286786 m!1179357))

(declare-fun m!1179359 () Bool)

(assert (=> b!1286793 m!1179359))

(assert (=> b!1286793 m!1179359))

(declare-fun m!1179361 () Bool)

(assert (=> b!1286793 m!1179361))

(declare-fun m!1179363 () Bool)

(assert (=> b!1286785 m!1179363))

(declare-fun m!1179365 () Bool)

(assert (=> b!1286785 m!1179365))

(declare-fun m!1179367 () Bool)

(assert (=> b!1286795 m!1179367))

(declare-fun m!1179369 () Bool)

(assert (=> bm!63042 m!1179369))

(declare-fun m!1179371 () Bool)

(assert (=> bm!63039 m!1179371))

(check-sat b_and!46495 (not b_next!28429) (not b!1286785) tp_is_empty!34069 (not bm!63038) (not bm!63042) (not b!1286795) (not start!108916) (not bm!63039) (not b!1286786) (not b!1286793) (not mapNonEmpty!52661) (not b!1286787) (not b!1286796))
(check-sat b_and!46495 (not b_next!28429))

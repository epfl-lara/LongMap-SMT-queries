; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110258 () Bool)

(assert start!110258)

(declare-fun b_free!29305 () Bool)

(declare-fun b_next!29305 () Bool)

(assert (=> start!110258 (= b_free!29305 (not b_next!29305))))

(declare-fun tp!103081 () Bool)

(declare-fun b_and!47483 () Bool)

(assert (=> start!110258 (= tp!103081 b_and!47483)))

(declare-fun b!1305114 () Bool)

(declare-fun res!866703 () Bool)

(declare-fun e!744457 () Bool)

(assert (=> b!1305114 (=> (not res!866703) (not e!744457))))

(declare-datatypes ((array!86815 0))(
  ( (array!86816 (arr!41895 (Array (_ BitVec 32) (_ BitVec 64))) (size!42447 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86815)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86815 (_ BitVec 32)) Bool)

(assert (=> b!1305114 (= res!866703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-datatypes ((V!51697 0))(
  ( (V!51698 (val!17547 Int)) )
))
(declare-fun zeroValue!1387 () V!51697)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16574 0))(
  ( (ValueCellFull!16574 (v!20168 V!51697)) (EmptyCell!16574) )
))
(declare-datatypes ((array!86817 0))(
  ( (array!86818 (arr!41896 (Array (_ BitVec 32) ValueCell!16574)) (size!42448 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86817)

(declare-fun bm!64336 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22716 0))(
  ( (tuple2!22717 (_1!11369 (_ BitVec 64)) (_2!11369 V!51697)) )
))
(declare-datatypes ((List!29820 0))(
  ( (Nil!29817) (Cons!29816 (h!31025 tuple2!22716) (t!43414 List!29820)) )
))
(declare-datatypes ((ListLongMap!20373 0))(
  ( (ListLongMap!20374 (toList!10202 List!29820)) )
))
(declare-fun call!64343 () ListLongMap!20373)

(declare-fun minValue!1387 () V!51697)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6158 (array!86815 array!86817 (_ BitVec 32) (_ BitVec 32) V!51697 V!51697 (_ BitVec 32) Int) ListLongMap!20373)

(assert (=> bm!64336 (= call!64343 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305115 () Bool)

(declare-fun e!744461 () Bool)

(declare-fun tp_is_empty!34945 () Bool)

(assert (=> b!1305115 (= e!744461 tp_is_empty!34945)))

(declare-fun b!1305116 () Bool)

(declare-fun res!866699 () Bool)

(assert (=> b!1305116 (=> (not res!866699) (not e!744457))))

(assert (=> b!1305116 (= res!866699 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42447 _keys!1741))))))

(declare-fun c!125330 () Bool)

(declare-datatypes ((Unit!43067 0))(
  ( (Unit!43068) )
))
(declare-fun call!64346 () Unit!43067)

(declare-fun c!125329 () Bool)

(declare-fun lt!584065 () ListLongMap!20373)

(declare-fun lt!584055 () ListLongMap!20373)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun bm!64337 () Bool)

(declare-fun lt!584054 () ListLongMap!20373)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!95 ((_ BitVec 64) (_ BitVec 64) V!51697 ListLongMap!20373) Unit!43067)

(assert (=> bm!64337 (= call!64346 (lemmaInListMapAfterAddingDiffThenInBefore!95 k0!1205 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))))

(declare-fun b!1305117 () Bool)

(declare-fun res!866700 () Bool)

(assert (=> b!1305117 (=> (not res!866700) (not e!744457))))

(declare-datatypes ((List!29821 0))(
  ( (Nil!29818) (Cons!29817 (h!31026 (_ BitVec 64)) (t!43415 List!29821)) )
))
(declare-fun arrayNoDuplicates!0 (array!86815 (_ BitVec 32) List!29821) Bool)

(assert (=> b!1305117 (= res!866700 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29818))))

(declare-fun call!64347 () Bool)

(declare-fun bm!64338 () Bool)

(declare-fun contains!8274 (ListLongMap!20373 (_ BitVec 64)) Bool)

(assert (=> bm!64338 (= call!64347 (contains!8274 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) k0!1205))))

(declare-fun b!1305118 () Bool)

(declare-fun e!744459 () Unit!43067)

(declare-fun e!744456 () Unit!43067)

(assert (=> b!1305118 (= e!744459 e!744456)))

(declare-fun lt!584060 () Bool)

(assert (=> b!1305118 (= c!125330 (and (not lt!584060) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305119 () Bool)

(declare-fun e!744460 () Bool)

(assert (=> b!1305119 (= e!744460 tp_is_empty!34945)))

(declare-fun b!1305120 () Bool)

(declare-fun e!744454 () Bool)

(declare-fun mapRes!54024 () Bool)

(assert (=> b!1305120 (= e!744454 (and e!744461 mapRes!54024))))

(declare-fun condMapEmpty!54024 () Bool)

(declare-fun mapDefault!54024 () ValueCell!16574)

(assert (=> b!1305120 (= condMapEmpty!54024 (= (arr!41896 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16574)) mapDefault!54024)))))

(declare-fun b!1305121 () Bool)

(declare-fun e!744458 () Unit!43067)

(declare-fun lt!584057 () Unit!43067)

(assert (=> b!1305121 (= e!744458 lt!584057)))

(declare-fun call!64345 () ListLongMap!20373)

(assert (=> b!1305121 (= lt!584055 call!64345)))

(declare-fun lt!584067 () Unit!43067)

(declare-fun call!64348 () Unit!43067)

(assert (=> b!1305121 (= lt!584067 call!64348)))

(declare-fun call!64338 () Bool)

(assert (=> b!1305121 (not call!64338)))

(declare-fun call!64339 () Unit!43067)

(assert (=> b!1305121 (= lt!584057 call!64339)))

(declare-fun call!64342 () Bool)

(assert (=> b!1305121 call!64342))

(declare-fun b!1305122 () Bool)

(declare-fun c!125331 () Bool)

(assert (=> b!1305122 (= c!125331 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!584060))))

(assert (=> b!1305122 (= e!744456 e!744458)))

(declare-fun lt!584061 () ListLongMap!20373)

(declare-fun call!64349 () Bool)

(declare-fun call!64344 () ListLongMap!20373)

(declare-fun bm!64339 () Bool)

(assert (=> bm!64339 (= call!64349 (contains!8274 (ite c!125329 lt!584061 call!64344) k0!1205))))

(declare-fun bm!64340 () Bool)

(assert (=> bm!64340 (= call!64339 call!64346)))

(declare-fun bm!64341 () Bool)

(assert (=> bm!64341 (= call!64338 call!64349)))

(declare-fun res!866706 () Bool)

(assert (=> start!110258 (=> (not res!866706) (not e!744457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110258 (= res!866706 (validMask!0 mask!2175))))

(assert (=> start!110258 e!744457))

(assert (=> start!110258 tp_is_empty!34945))

(assert (=> start!110258 true))

(declare-fun array_inv!31863 (array!86817) Bool)

(assert (=> start!110258 (and (array_inv!31863 _values!1445) e!744454)))

(declare-fun array_inv!31864 (array!86815) Bool)

(assert (=> start!110258 (array_inv!31864 _keys!1741)))

(assert (=> start!110258 tp!103081))

(declare-fun call!64340 () Unit!43067)

(declare-fun bm!64335 () Bool)

(declare-fun addStillNotContains!476 (ListLongMap!20373 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43067)

(assert (=> bm!64335 (= call!64340 (addStillNotContains!476 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) k0!1205))))

(declare-fun bm!64342 () Bool)

(assert (=> bm!64342 (= call!64342 call!64347)))

(declare-fun b!1305123 () Bool)

(assert (=> b!1305123 (= e!744457 (not false))))

(declare-fun lt!584053 () Unit!43067)

(assert (=> b!1305123 (= lt!584053 e!744459)))

(assert (=> b!1305123 (= c!125329 (and (not lt!584060) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1305123 (= lt!584060 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1305123 (not (contains!8274 (ListLongMap!20374 Nil!29817) k0!1205))))

(declare-fun lt!584052 () Unit!43067)

(declare-fun emptyContainsNothing!228 ((_ BitVec 64)) Unit!43067)

(assert (=> b!1305123 (= lt!584052 (emptyContainsNothing!228 k0!1205))))

(declare-fun b!1305124 () Bool)

(declare-fun Unit!43069 () Unit!43067)

(assert (=> b!1305124 (= e!744458 Unit!43069)))

(declare-fun b!1305125 () Bool)

(declare-fun res!866704 () Bool)

(assert (=> b!1305125 (=> (not res!866704) (not e!744457))))

(assert (=> b!1305125 (= res!866704 (and (= (size!42448 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42447 _keys!1741) (size!42448 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!64343 () Bool)

(assert (=> bm!64343 (= call!64345 call!64343)))

(declare-fun b!1305126 () Bool)

(declare-fun res!866702 () Bool)

(assert (=> b!1305126 (=> (not res!866702) (not e!744457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305126 (= res!866702 (not (validKeyInArray!0 (select (arr!41895 _keys!1741) from!2144))))))

(declare-fun b!1305127 () Bool)

(declare-fun lt!584062 () Unit!43067)

(assert (=> b!1305127 (= e!744459 lt!584062)))

(assert (=> b!1305127 (= lt!584061 call!64343)))

(declare-fun lt!584064 () Unit!43067)

(assert (=> b!1305127 (= lt!584064 (addStillNotContains!476 lt!584061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun call!64341 () ListLongMap!20373)

(assert (=> b!1305127 (= lt!584054 call!64341)))

(assert (=> b!1305127 (not call!64347)))

(declare-fun lt!584059 () Unit!43067)

(assert (=> b!1305127 (= lt!584059 call!64340)))

(declare-fun +!4523 (ListLongMap!20373 tuple2!22716) ListLongMap!20373)

(assert (=> b!1305127 (not (contains!8274 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584066 () Unit!43067)

(assert (=> b!1305127 (= lt!584066 call!64346)))

(assert (=> b!1305127 false))

(assert (=> b!1305127 (= lt!584062 (lemmaInListMapAfterAddingDiffThenInBefore!95 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584061))))

(declare-fun lt!584058 () Bool)

(assert (=> b!1305127 (= lt!584058 call!64349)))

(declare-fun b!1305128 () Bool)

(declare-fun res!866705 () Bool)

(assert (=> b!1305128 (=> (not res!866705) (not e!744457))))

(declare-fun getCurrentListMap!5101 (array!86815 array!86817 (_ BitVec 32) (_ BitVec 32) V!51697 V!51697 (_ BitVec 32) Int) ListLongMap!20373)

(assert (=> b!1305128 (= res!866705 (contains!8274 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!54024 () Bool)

(assert (=> mapIsEmpty!54024 mapRes!54024))

(declare-fun bm!64344 () Bool)

(assert (=> bm!64344 (= call!64348 call!64340)))

(declare-fun bm!64345 () Bool)

(assert (=> bm!64345 (= call!64341 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun mapNonEmpty!54024 () Bool)

(declare-fun tp!103080 () Bool)

(assert (=> mapNonEmpty!54024 (= mapRes!54024 (and tp!103080 e!744460))))

(declare-fun mapKey!54024 () (_ BitVec 32))

(declare-fun mapValue!54024 () ValueCell!16574)

(declare-fun mapRest!54024 () (Array (_ BitVec 32) ValueCell!16574))

(assert (=> mapNonEmpty!54024 (= (arr!41896 _values!1445) (store mapRest!54024 mapKey!54024 mapValue!54024))))

(declare-fun bm!64346 () Bool)

(assert (=> bm!64346 (= call!64344 call!64341)))

(declare-fun b!1305129 () Bool)

(declare-fun res!866701 () Bool)

(assert (=> b!1305129 (=> (not res!866701) (not e!744457))))

(assert (=> b!1305129 (= res!866701 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42447 _keys!1741))))))

(declare-fun b!1305130 () Bool)

(assert (=> b!1305130 call!64342))

(declare-fun lt!584056 () Unit!43067)

(assert (=> b!1305130 (= lt!584056 call!64339)))

(assert (=> b!1305130 (not call!64338)))

(declare-fun lt!584063 () Unit!43067)

(assert (=> b!1305130 (= lt!584063 call!64348)))

(assert (=> b!1305130 (= lt!584065 call!64345)))

(assert (=> b!1305130 (= e!744456 lt!584056)))

(assert (= (and start!110258 res!866706) b!1305125))

(assert (= (and b!1305125 res!866704) b!1305114))

(assert (= (and b!1305114 res!866703) b!1305117))

(assert (= (and b!1305117 res!866700) b!1305116))

(assert (= (and b!1305116 res!866699) b!1305128))

(assert (= (and b!1305128 res!866705) b!1305129))

(assert (= (and b!1305129 res!866701) b!1305126))

(assert (= (and b!1305126 res!866702) b!1305123))

(assert (= (and b!1305123 c!125329) b!1305127))

(assert (= (and b!1305123 (not c!125329)) b!1305118))

(assert (= (and b!1305118 c!125330) b!1305130))

(assert (= (and b!1305118 (not c!125330)) b!1305122))

(assert (= (and b!1305122 c!125331) b!1305121))

(assert (= (and b!1305122 (not c!125331)) b!1305124))

(assert (= (or b!1305130 b!1305121) bm!64343))

(assert (= (or b!1305130 b!1305121) bm!64344))

(assert (= (or b!1305130 b!1305121) bm!64346))

(assert (= (or b!1305130 b!1305121) bm!64342))

(assert (= (or b!1305130 b!1305121) bm!64340))

(assert (= (or b!1305130 b!1305121) bm!64341))

(assert (= (or b!1305127 bm!64344) bm!64335))

(assert (= (or b!1305127 bm!64346) bm!64345))

(assert (= (or b!1305127 bm!64341) bm!64339))

(assert (= (or b!1305127 bm!64343) bm!64336))

(assert (= (or b!1305127 bm!64342) bm!64338))

(assert (= (or b!1305127 bm!64340) bm!64337))

(assert (= (and b!1305120 condMapEmpty!54024) mapIsEmpty!54024))

(assert (= (and b!1305120 (not condMapEmpty!54024)) mapNonEmpty!54024))

(get-info :version)

(assert (= (and mapNonEmpty!54024 ((_ is ValueCellFull!16574) mapValue!54024)) b!1305119))

(assert (= (and b!1305120 ((_ is ValueCellFull!16574) mapDefault!54024)) b!1305115))

(assert (= start!110258 b!1305120))

(declare-fun m!1195679 () Bool)

(assert (=> bm!64336 m!1195679))

(declare-fun m!1195681 () Bool)

(assert (=> b!1305126 m!1195681))

(assert (=> b!1305126 m!1195681))

(declare-fun m!1195683 () Bool)

(assert (=> b!1305126 m!1195683))

(declare-fun m!1195685 () Bool)

(assert (=> bm!64345 m!1195685))

(declare-fun m!1195687 () Bool)

(assert (=> b!1305123 m!1195687))

(declare-fun m!1195689 () Bool)

(assert (=> b!1305123 m!1195689))

(declare-fun m!1195691 () Bool)

(assert (=> b!1305127 m!1195691))

(declare-fun m!1195693 () Bool)

(assert (=> b!1305127 m!1195693))

(assert (=> b!1305127 m!1195693))

(declare-fun m!1195695 () Bool)

(assert (=> b!1305127 m!1195695))

(declare-fun m!1195697 () Bool)

(assert (=> b!1305127 m!1195697))

(declare-fun m!1195699 () Bool)

(assert (=> mapNonEmpty!54024 m!1195699))

(declare-fun m!1195701 () Bool)

(assert (=> b!1305117 m!1195701))

(declare-fun m!1195703 () Bool)

(assert (=> start!110258 m!1195703))

(declare-fun m!1195705 () Bool)

(assert (=> start!110258 m!1195705))

(declare-fun m!1195707 () Bool)

(assert (=> start!110258 m!1195707))

(declare-fun m!1195709 () Bool)

(assert (=> bm!64335 m!1195709))

(declare-fun m!1195711 () Bool)

(assert (=> b!1305128 m!1195711))

(assert (=> b!1305128 m!1195711))

(declare-fun m!1195713 () Bool)

(assert (=> b!1305128 m!1195713))

(declare-fun m!1195715 () Bool)

(assert (=> b!1305114 m!1195715))

(declare-fun m!1195717 () Bool)

(assert (=> bm!64337 m!1195717))

(declare-fun m!1195719 () Bool)

(assert (=> bm!64338 m!1195719))

(declare-fun m!1195721 () Bool)

(assert (=> bm!64339 m!1195721))

(check-sat (not start!110258) (not b!1305123) (not b!1305128) (not bm!64335) (not b!1305126) (not b!1305117) (not bm!64338) (not bm!64339) (not b_next!29305) tp_is_empty!34945 (not mapNonEmpty!54024) (not bm!64337) (not b!1305114) (not b!1305127) (not bm!64345) b_and!47483 (not bm!64336))
(check-sat b_and!47483 (not b_next!29305))
(get-model)

(declare-fun d!141865 () Bool)

(assert (=> d!141865 (not (contains!8274 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) k0!1205))))

(declare-fun lt!584166 () Unit!43067)

(declare-fun choose!1944 (ListLongMap!20373 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43067)

(assert (=> d!141865 (= lt!584166 (choose!1944 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) k0!1205))))

(declare-fun e!744512 () Bool)

(assert (=> d!141865 e!744512))

(declare-fun res!866757 () Bool)

(assert (=> d!141865 (=> (not res!866757) (not e!744512))))

(assert (=> d!141865 (= res!866757 (not (contains!8274 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) k0!1205)))))

(assert (=> d!141865 (= (addStillNotContains!476 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) k0!1205) lt!584166)))

(declare-fun b!1305236 () Bool)

(assert (=> b!1305236 (= e!744512 (not (= (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) k0!1205)))))

(assert (= (and d!141865 res!866757) b!1305236))

(declare-fun m!1195811 () Bool)

(assert (=> d!141865 m!1195811))

(assert (=> d!141865 m!1195811))

(declare-fun m!1195813 () Bool)

(assert (=> d!141865 m!1195813))

(declare-fun m!1195815 () Bool)

(assert (=> d!141865 m!1195815))

(declare-fun m!1195817 () Bool)

(assert (=> d!141865 m!1195817))

(assert (=> bm!64335 d!141865))

(declare-fun d!141867 () Bool)

(assert (=> d!141867 (= (validKeyInArray!0 (select (arr!41895 _keys!1741) from!2144)) (and (not (= (select (arr!41895 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41895 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305126 d!141867))

(declare-fun d!141869 () Bool)

(declare-fun e!744518 () Bool)

(assert (=> d!141869 e!744518))

(declare-fun res!866760 () Bool)

(assert (=> d!141869 (=> res!866760 e!744518)))

(declare-fun lt!584176 () Bool)

(assert (=> d!141869 (= res!866760 (not lt!584176))))

(declare-fun lt!584178 () Bool)

(assert (=> d!141869 (= lt!584176 lt!584178)))

(declare-fun lt!584177 () Unit!43067)

(declare-fun e!744517 () Unit!43067)

(assert (=> d!141869 (= lt!584177 e!744517)))

(declare-fun c!125352 () Bool)

(assert (=> d!141869 (= c!125352 lt!584178)))

(declare-fun containsKey!729 (List!29820 (_ BitVec 64)) Bool)

(assert (=> d!141869 (= lt!584178 (containsKey!729 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205))))

(assert (=> d!141869 (= (contains!8274 (ite c!125329 lt!584061 call!64344) k0!1205) lt!584176)))

(declare-fun b!1305243 () Bool)

(declare-fun lt!584175 () Unit!43067)

(assert (=> b!1305243 (= e!744517 lt!584175)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!476 (List!29820 (_ BitVec 64)) Unit!43067)

(assert (=> b!1305243 (= lt!584175 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205))))

(declare-datatypes ((Option!763 0))(
  ( (Some!762 (v!20171 V!51697)) (None!761) )
))
(declare-fun isDefined!519 (Option!763) Bool)

(declare-fun getValueByKey!712 (List!29820 (_ BitVec 64)) Option!763)

(assert (=> b!1305243 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205))))

(declare-fun b!1305244 () Bool)

(declare-fun Unit!43075 () Unit!43067)

(assert (=> b!1305244 (= e!744517 Unit!43075)))

(declare-fun b!1305245 () Bool)

(assert (=> b!1305245 (= e!744518 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205)))))

(assert (= (and d!141869 c!125352) b!1305243))

(assert (= (and d!141869 (not c!125352)) b!1305244))

(assert (= (and d!141869 (not res!866760)) b!1305245))

(declare-fun m!1195819 () Bool)

(assert (=> d!141869 m!1195819))

(declare-fun m!1195821 () Bool)

(assert (=> b!1305243 m!1195821))

(declare-fun m!1195823 () Bool)

(assert (=> b!1305243 m!1195823))

(assert (=> b!1305243 m!1195823))

(declare-fun m!1195825 () Bool)

(assert (=> b!1305243 m!1195825))

(assert (=> b!1305245 m!1195823))

(assert (=> b!1305245 m!1195823))

(assert (=> b!1305245 m!1195825))

(assert (=> bm!64339 d!141869))

(declare-fun b!1305270 () Bool)

(declare-fun lt!584194 () ListLongMap!20373)

(declare-fun e!744535 () Bool)

(assert (=> b!1305270 (= e!744535 (= lt!584194 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305271 () Bool)

(declare-fun lt!584193 () Unit!43067)

(declare-fun lt!584196 () Unit!43067)

(assert (=> b!1305271 (= lt!584193 lt!584196)))

(declare-fun lt!584198 () (_ BitVec 64))

(declare-fun lt!584195 () ListLongMap!20373)

(declare-fun lt!584199 () (_ BitVec 64))

(declare-fun lt!584197 () V!51697)

(assert (=> b!1305271 (not (contains!8274 (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197)) lt!584199))))

(assert (=> b!1305271 (= lt!584196 (addStillNotContains!476 lt!584195 lt!584198 lt!584197 lt!584199))))

(assert (=> b!1305271 (= lt!584199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21188 (ValueCell!16574 V!51697) V!51697)

(declare-fun dynLambda!3457 (Int (_ BitVec 64)) V!51697)

(assert (=> b!1305271 (= lt!584197 (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305271 (= lt!584198 (select (arr!41895 _keys!1741) from!2144))))

(declare-fun call!64424 () ListLongMap!20373)

(assert (=> b!1305271 (= lt!584195 call!64424)))

(declare-fun e!744533 () ListLongMap!20373)

(assert (=> b!1305271 (= e!744533 (+!4523 call!64424 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1305272 () Bool)

(assert (=> b!1305272 (= e!744533 call!64424)))

(declare-fun bm!64421 () Bool)

(assert (=> bm!64421 (= call!64424 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305273 () Bool)

(declare-fun e!744537 () ListLongMap!20373)

(assert (=> b!1305273 (= e!744537 e!744533)))

(declare-fun c!125363 () Bool)

(assert (=> b!1305273 (= c!125363 (validKeyInArray!0 (select (arr!41895 _keys!1741) from!2144)))))

(declare-fun b!1305274 () Bool)

(declare-fun e!744539 () Bool)

(declare-fun e!744534 () Bool)

(assert (=> b!1305274 (= e!744539 e!744534)))

(declare-fun c!125364 () Bool)

(declare-fun e!744538 () Bool)

(assert (=> b!1305274 (= c!125364 e!744538)))

(declare-fun res!866771 () Bool)

(assert (=> b!1305274 (=> (not res!866771) (not e!744538))))

(assert (=> b!1305274 (= res!866771 (bvslt from!2144 (size!42447 _keys!1741)))))

(declare-fun b!1305276 () Bool)

(declare-fun isEmpty!1076 (ListLongMap!20373) Bool)

(assert (=> b!1305276 (= e!744535 (isEmpty!1076 lt!584194))))

(declare-fun b!1305277 () Bool)

(declare-fun e!744536 () Bool)

(assert (=> b!1305277 (= e!744534 e!744536)))

(assert (=> b!1305277 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42447 _keys!1741)))))

(declare-fun res!866770 () Bool)

(assert (=> b!1305277 (= res!866770 (contains!8274 lt!584194 (select (arr!41895 _keys!1741) from!2144)))))

(assert (=> b!1305277 (=> (not res!866770) (not e!744536))))

(declare-fun b!1305278 () Bool)

(assert (=> b!1305278 (= e!744534 e!744535)))

(declare-fun c!125361 () Bool)

(assert (=> b!1305278 (= c!125361 (bvslt from!2144 (size!42447 _keys!1741)))))

(declare-fun b!1305279 () Bool)

(assert (=> b!1305279 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42447 _keys!1741)))))

(assert (=> b!1305279 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42448 _values!1445)))))

(declare-fun apply!1019 (ListLongMap!20373 (_ BitVec 64)) V!51697)

(assert (=> b!1305279 (= e!744536 (= (apply!1019 lt!584194 (select (arr!41895 _keys!1741) from!2144)) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1305280 () Bool)

(declare-fun res!866772 () Bool)

(assert (=> b!1305280 (=> (not res!866772) (not e!744539))))

(assert (=> b!1305280 (= res!866772 (not (contains!8274 lt!584194 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305281 () Bool)

(assert (=> b!1305281 (= e!744537 (ListLongMap!20374 Nil!29817))))

(declare-fun d!141871 () Bool)

(assert (=> d!141871 e!744539))

(declare-fun res!866769 () Bool)

(assert (=> d!141871 (=> (not res!866769) (not e!744539))))

(assert (=> d!141871 (= res!866769 (not (contains!8274 lt!584194 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141871 (= lt!584194 e!744537)))

(declare-fun c!125362 () Bool)

(assert (=> d!141871 (= c!125362 (bvsge from!2144 (size!42447 _keys!1741)))))

(assert (=> d!141871 (validMask!0 mask!2175)))

(assert (=> d!141871 (= (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584194)))

(declare-fun b!1305275 () Bool)

(assert (=> b!1305275 (= e!744538 (validKeyInArray!0 (select (arr!41895 _keys!1741) from!2144)))))

(assert (=> b!1305275 (bvsge from!2144 #b00000000000000000000000000000000)))

(assert (= (and d!141871 c!125362) b!1305281))

(assert (= (and d!141871 (not c!125362)) b!1305273))

(assert (= (and b!1305273 c!125363) b!1305271))

(assert (= (and b!1305273 (not c!125363)) b!1305272))

(assert (= (or b!1305271 b!1305272) bm!64421))

(assert (= (and d!141871 res!866769) b!1305280))

(assert (= (and b!1305280 res!866772) b!1305274))

(assert (= (and b!1305274 res!866771) b!1305275))

(assert (= (and b!1305274 c!125364) b!1305277))

(assert (= (and b!1305274 (not c!125364)) b!1305278))

(assert (= (and b!1305277 res!866770) b!1305279))

(assert (= (and b!1305278 c!125361) b!1305270))

(assert (= (and b!1305278 (not c!125361)) b!1305276))

(declare-fun b_lambda!23329 () Bool)

(assert (=> (not b_lambda!23329) (not b!1305271)))

(declare-fun t!43420 () Bool)

(declare-fun tb!11399 () Bool)

(assert (=> (and start!110258 (= defaultEntry!1448 defaultEntry!1448) t!43420) tb!11399))

(declare-fun result!23835 () Bool)

(assert (=> tb!11399 (= result!23835 tp_is_empty!34945)))

(assert (=> b!1305271 t!43420))

(declare-fun b_and!47489 () Bool)

(assert (= b_and!47483 (and (=> t!43420 result!23835) b_and!47489)))

(declare-fun b_lambda!23331 () Bool)

(assert (=> (not b_lambda!23331) (not b!1305279)))

(assert (=> b!1305279 t!43420))

(declare-fun b_and!47491 () Bool)

(assert (= b_and!47489 (and (=> t!43420 result!23835) b_and!47491)))

(assert (=> b!1305275 m!1195681))

(assert (=> b!1305275 m!1195681))

(assert (=> b!1305275 m!1195683))

(assert (=> b!1305273 m!1195681))

(assert (=> b!1305273 m!1195681))

(assert (=> b!1305273 m!1195683))

(declare-fun m!1195827 () Bool)

(assert (=> bm!64421 m!1195827))

(declare-fun m!1195829 () Bool)

(assert (=> b!1305280 m!1195829))

(declare-fun m!1195831 () Bool)

(assert (=> b!1305271 m!1195831))

(declare-fun m!1195833 () Bool)

(assert (=> b!1305271 m!1195833))

(declare-fun m!1195835 () Bool)

(assert (=> b!1305271 m!1195835))

(assert (=> b!1305271 m!1195833))

(declare-fun m!1195837 () Bool)

(assert (=> b!1305271 m!1195837))

(declare-fun m!1195839 () Bool)

(assert (=> b!1305271 m!1195839))

(declare-fun m!1195841 () Bool)

(assert (=> b!1305271 m!1195841))

(assert (=> b!1305271 m!1195681))

(declare-fun m!1195843 () Bool)

(assert (=> b!1305271 m!1195843))

(assert (=> b!1305271 m!1195839))

(assert (=> b!1305271 m!1195831))

(assert (=> b!1305279 m!1195831))

(assert (=> b!1305279 m!1195833))

(assert (=> b!1305279 m!1195835))

(assert (=> b!1305279 m!1195833))

(assert (=> b!1305279 m!1195831))

(assert (=> b!1305279 m!1195681))

(declare-fun m!1195845 () Bool)

(assert (=> b!1305279 m!1195845))

(assert (=> b!1305279 m!1195681))

(assert (=> b!1305270 m!1195827))

(assert (=> b!1305277 m!1195681))

(assert (=> b!1305277 m!1195681))

(declare-fun m!1195847 () Bool)

(assert (=> b!1305277 m!1195847))

(declare-fun m!1195849 () Bool)

(assert (=> b!1305276 m!1195849))

(declare-fun m!1195851 () Bool)

(assert (=> d!141871 m!1195851))

(assert (=> d!141871 m!1195703))

(assert (=> bm!64336 d!141871))

(declare-fun d!141873 () Bool)

(declare-fun e!744541 () Bool)

(assert (=> d!141873 e!744541))

(declare-fun res!866773 () Bool)

(assert (=> d!141873 (=> res!866773 e!744541)))

(declare-fun lt!584201 () Bool)

(assert (=> d!141873 (= res!866773 (not lt!584201))))

(declare-fun lt!584203 () Bool)

(assert (=> d!141873 (= lt!584201 lt!584203)))

(declare-fun lt!584202 () Unit!43067)

(declare-fun e!744540 () Unit!43067)

(assert (=> d!141873 (= lt!584202 e!744540)))

(declare-fun c!125365 () Bool)

(assert (=> d!141873 (= c!125365 lt!584203)))

(assert (=> d!141873 (= lt!584203 (containsKey!729 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141873 (= (contains!8274 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584201)))

(declare-fun b!1305284 () Bool)

(declare-fun lt!584200 () Unit!43067)

(assert (=> b!1305284 (= e!744540 lt!584200)))

(assert (=> b!1305284 (= lt!584200 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1305284 (isDefined!519 (getValueByKey!712 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305285 () Bool)

(declare-fun Unit!43076 () Unit!43067)

(assert (=> b!1305285 (= e!744540 Unit!43076)))

(declare-fun b!1305286 () Bool)

(assert (=> b!1305286 (= e!744541 (isDefined!519 (getValueByKey!712 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141873 c!125365) b!1305284))

(assert (= (and d!141873 (not c!125365)) b!1305285))

(assert (= (and d!141873 (not res!866773)) b!1305286))

(declare-fun m!1195853 () Bool)

(assert (=> d!141873 m!1195853))

(declare-fun m!1195855 () Bool)

(assert (=> b!1305284 m!1195855))

(declare-fun m!1195857 () Bool)

(assert (=> b!1305284 m!1195857))

(assert (=> b!1305284 m!1195857))

(declare-fun m!1195859 () Bool)

(assert (=> b!1305284 m!1195859))

(assert (=> b!1305286 m!1195857))

(assert (=> b!1305286 m!1195857))

(assert (=> b!1305286 m!1195859))

(assert (=> b!1305128 d!141873))

(declare-fun b!1305329 () Bool)

(declare-fun e!744577 () ListLongMap!20373)

(declare-fun call!64443 () ListLongMap!20373)

(assert (=> b!1305329 (= e!744577 call!64443)))

(declare-fun b!1305330 () Bool)

(declare-fun e!744574 () Bool)

(declare-fun call!64444 () Bool)

(assert (=> b!1305330 (= e!744574 (not call!64444))))

(declare-fun b!1305331 () Bool)

(declare-fun e!744576 () Bool)

(declare-fun lt!584264 () ListLongMap!20373)

(assert (=> b!1305331 (= e!744576 (= (apply!1019 lt!584264 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1305332 () Bool)

(declare-fun e!744580 () Bool)

(assert (=> b!1305332 (= e!744580 (validKeyInArray!0 (select (arr!41895 _keys!1741) from!2144)))))

(declare-fun b!1305333 () Bool)

(declare-fun e!744573 () Bool)

(assert (=> b!1305333 (= e!744573 (= (apply!1019 lt!584264 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun call!64440 () ListLongMap!20373)

(declare-fun c!125378 () Bool)

(declare-fun call!64441 () ListLongMap!20373)

(declare-fun c!125383 () Bool)

(declare-fun bm!64436 () Bool)

(declare-fun call!64442 () ListLongMap!20373)

(assert (=> bm!64436 (= call!64442 (+!4523 (ite c!125383 call!64441 (ite c!125378 call!64440 call!64443)) (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305334 () Bool)

(declare-fun e!744570 () ListLongMap!20373)

(declare-fun e!744568 () ListLongMap!20373)

(assert (=> b!1305334 (= e!744570 e!744568)))

(assert (=> b!1305334 (= c!125378 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305335 () Bool)

(declare-fun res!866794 () Bool)

(declare-fun e!744579 () Bool)

(assert (=> b!1305335 (=> (not res!866794) (not e!744579))))

(declare-fun e!744575 () Bool)

(assert (=> b!1305335 (= res!866794 e!744575)))

(declare-fun res!866795 () Bool)

(assert (=> b!1305335 (=> res!866795 e!744575)))

(assert (=> b!1305335 (= res!866795 (not e!744580))))

(declare-fun res!866792 () Bool)

(assert (=> b!1305335 (=> (not res!866792) (not e!744580))))

(assert (=> b!1305335 (= res!866792 (bvslt from!2144 (size!42447 _keys!1741)))))

(declare-fun bm!64437 () Bool)

(assert (=> bm!64437 (= call!64443 call!64440)))

(declare-fun b!1305336 () Bool)

(declare-fun c!125380 () Bool)

(assert (=> b!1305336 (= c!125380 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1305336 (= e!744568 e!744577)))

(declare-fun bm!64438 () Bool)

(assert (=> bm!64438 (= call!64440 call!64441)))

(declare-fun b!1305337 () Bool)

(declare-fun call!64445 () ListLongMap!20373)

(assert (=> b!1305337 (= e!744568 call!64445)))

(declare-fun b!1305338 () Bool)

(declare-fun e!744569 () Unit!43067)

(declare-fun Unit!43077 () Unit!43067)

(assert (=> b!1305338 (= e!744569 Unit!43077)))

(declare-fun b!1305339 () Bool)

(declare-fun e!744571 () Bool)

(assert (=> b!1305339 (= e!744571 e!744573)))

(declare-fun res!866796 () Bool)

(declare-fun call!64439 () Bool)

(assert (=> b!1305339 (= res!866796 call!64439)))

(assert (=> b!1305339 (=> (not res!866796) (not e!744573))))

(declare-fun d!141875 () Bool)

(assert (=> d!141875 e!744579))

(declare-fun res!866800 () Bool)

(assert (=> d!141875 (=> (not res!866800) (not e!744579))))

(assert (=> d!141875 (= res!866800 (or (bvsge from!2144 (size!42447 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42447 _keys!1741)))))))

(declare-fun lt!584261 () ListLongMap!20373)

(assert (=> d!141875 (= lt!584264 lt!584261)))

(declare-fun lt!584253 () Unit!43067)

(assert (=> d!141875 (= lt!584253 e!744569)))

(declare-fun c!125379 () Bool)

(declare-fun e!744578 () Bool)

(assert (=> d!141875 (= c!125379 e!744578)))

(declare-fun res!866797 () Bool)

(assert (=> d!141875 (=> (not res!866797) (not e!744578))))

(assert (=> d!141875 (= res!866797 (bvslt from!2144 (size!42447 _keys!1741)))))

(assert (=> d!141875 (= lt!584261 e!744570)))

(assert (=> d!141875 (= c!125383 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141875 (validMask!0 mask!2175)))

(assert (=> d!141875 (= (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584264)))

(declare-fun b!1305340 () Bool)

(assert (=> b!1305340 (= e!744574 e!744576)))

(declare-fun res!866798 () Bool)

(assert (=> b!1305340 (= res!866798 call!64444)))

(assert (=> b!1305340 (=> (not res!866798) (not e!744576))))

(declare-fun b!1305341 () Bool)

(declare-fun e!744572 () Bool)

(assert (=> b!1305341 (= e!744575 e!744572)))

(declare-fun res!866799 () Bool)

(assert (=> b!1305341 (=> (not res!866799) (not e!744572))))

(assert (=> b!1305341 (= res!866799 (contains!8274 lt!584264 (select (arr!41895 _keys!1741) from!2144)))))

(assert (=> b!1305341 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42447 _keys!1741)))))

(declare-fun b!1305342 () Bool)

(assert (=> b!1305342 (= e!744577 call!64445)))

(declare-fun b!1305343 () Bool)

(assert (=> b!1305343 (= e!744571 (not call!64439))))

(declare-fun b!1305344 () Bool)

(declare-fun lt!584258 () Unit!43067)

(assert (=> b!1305344 (= e!744569 lt!584258)))

(declare-fun lt!584248 () ListLongMap!20373)

(assert (=> b!1305344 (= lt!584248 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584266 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584266 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584250 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584250 (select (arr!41895 _keys!1741) from!2144))))

(declare-fun lt!584257 () Unit!43067)

(declare-fun addStillContains!1114 (ListLongMap!20373 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43067)

(assert (=> b!1305344 (= lt!584257 (addStillContains!1114 lt!584248 lt!584266 zeroValue!1387 lt!584250))))

(assert (=> b!1305344 (contains!8274 (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387)) lt!584250)))

(declare-fun lt!584259 () Unit!43067)

(assert (=> b!1305344 (= lt!584259 lt!584257)))

(declare-fun lt!584256 () ListLongMap!20373)

(assert (=> b!1305344 (= lt!584256 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584268 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584268 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584255 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584255 (select (arr!41895 _keys!1741) from!2144))))

(declare-fun lt!584263 () Unit!43067)

(declare-fun addApplyDifferent!557 (ListLongMap!20373 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43067)

(assert (=> b!1305344 (= lt!584263 (addApplyDifferent!557 lt!584256 lt!584268 minValue!1387 lt!584255))))

(assert (=> b!1305344 (= (apply!1019 (+!4523 lt!584256 (tuple2!22717 lt!584268 minValue!1387)) lt!584255) (apply!1019 lt!584256 lt!584255))))

(declare-fun lt!584262 () Unit!43067)

(assert (=> b!1305344 (= lt!584262 lt!584263)))

(declare-fun lt!584260 () ListLongMap!20373)

(assert (=> b!1305344 (= lt!584260 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584252 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584269 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584269 (select (arr!41895 _keys!1741) from!2144))))

(declare-fun lt!584267 () Unit!43067)

(assert (=> b!1305344 (= lt!584267 (addApplyDifferent!557 lt!584260 lt!584252 zeroValue!1387 lt!584269))))

(assert (=> b!1305344 (= (apply!1019 (+!4523 lt!584260 (tuple2!22717 lt!584252 zeroValue!1387)) lt!584269) (apply!1019 lt!584260 lt!584269))))

(declare-fun lt!584249 () Unit!43067)

(assert (=> b!1305344 (= lt!584249 lt!584267)))

(declare-fun lt!584254 () ListLongMap!20373)

(assert (=> b!1305344 (= lt!584254 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584265 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584265 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584251 () (_ BitVec 64))

(assert (=> b!1305344 (= lt!584251 (select (arr!41895 _keys!1741) from!2144))))

(assert (=> b!1305344 (= lt!584258 (addApplyDifferent!557 lt!584254 lt!584265 minValue!1387 lt!584251))))

(assert (=> b!1305344 (= (apply!1019 (+!4523 lt!584254 (tuple2!22717 lt!584265 minValue!1387)) lt!584251) (apply!1019 lt!584254 lt!584251))))

(declare-fun bm!64439 () Bool)

(assert (=> bm!64439 (= call!64439 (contains!8274 lt!584264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305345 () Bool)

(declare-fun res!866793 () Bool)

(assert (=> b!1305345 (=> (not res!866793) (not e!744579))))

(assert (=> b!1305345 (= res!866793 e!744571)))

(declare-fun c!125381 () Bool)

(assert (=> b!1305345 (= c!125381 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1305346 () Bool)

(assert (=> b!1305346 (= e!744579 e!744574)))

(declare-fun c!125382 () Bool)

(assert (=> b!1305346 (= c!125382 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64440 () Bool)

(assert (=> bm!64440 (= call!64441 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305347 () Bool)

(assert (=> b!1305347 (= e!744578 (validKeyInArray!0 (select (arr!41895 _keys!1741) from!2144)))))

(declare-fun bm!64441 () Bool)

(assert (=> bm!64441 (= call!64445 call!64442)))

(declare-fun bm!64442 () Bool)

(assert (=> bm!64442 (= call!64444 (contains!8274 lt!584264 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305348 () Bool)

(assert (=> b!1305348 (= e!744570 (+!4523 call!64442 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305349 () Bool)

(assert (=> b!1305349 (= e!744572 (= (apply!1019 lt!584264 (select (arr!41895 _keys!1741) from!2144)) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305349 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42448 _values!1445)))))

(assert (=> b!1305349 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42447 _keys!1741)))))

(assert (= (and d!141875 c!125383) b!1305348))

(assert (= (and d!141875 (not c!125383)) b!1305334))

(assert (= (and b!1305334 c!125378) b!1305337))

(assert (= (and b!1305334 (not c!125378)) b!1305336))

(assert (= (and b!1305336 c!125380) b!1305342))

(assert (= (and b!1305336 (not c!125380)) b!1305329))

(assert (= (or b!1305342 b!1305329) bm!64437))

(assert (= (or b!1305337 bm!64437) bm!64438))

(assert (= (or b!1305337 b!1305342) bm!64441))

(assert (= (or b!1305348 bm!64438) bm!64440))

(assert (= (or b!1305348 bm!64441) bm!64436))

(assert (= (and d!141875 res!866797) b!1305347))

(assert (= (and d!141875 c!125379) b!1305344))

(assert (= (and d!141875 (not c!125379)) b!1305338))

(assert (= (and d!141875 res!866800) b!1305335))

(assert (= (and b!1305335 res!866792) b!1305332))

(assert (= (and b!1305335 (not res!866795)) b!1305341))

(assert (= (and b!1305341 res!866799) b!1305349))

(assert (= (and b!1305335 res!866794) b!1305345))

(assert (= (and b!1305345 c!125381) b!1305339))

(assert (= (and b!1305345 (not c!125381)) b!1305343))

(assert (= (and b!1305339 res!866796) b!1305333))

(assert (= (or b!1305339 b!1305343) bm!64439))

(assert (= (and b!1305345 res!866793) b!1305346))

(assert (= (and b!1305346 c!125382) b!1305340))

(assert (= (and b!1305346 (not c!125382)) b!1305330))

(assert (= (and b!1305340 res!866798) b!1305331))

(assert (= (or b!1305340 b!1305330) bm!64442))

(declare-fun b_lambda!23333 () Bool)

(assert (=> (not b_lambda!23333) (not b!1305349)))

(assert (=> b!1305349 t!43420))

(declare-fun b_and!47493 () Bool)

(assert (= b_and!47491 (and (=> t!43420 result!23835) b_and!47493)))

(declare-fun m!1195861 () Bool)

(assert (=> b!1305333 m!1195861))

(declare-fun m!1195863 () Bool)

(assert (=> bm!64442 m!1195863))

(declare-fun m!1195865 () Bool)

(assert (=> b!1305348 m!1195865))

(declare-fun m!1195867 () Bool)

(assert (=> b!1305331 m!1195867))

(declare-fun m!1195869 () Bool)

(assert (=> bm!64436 m!1195869))

(assert (=> b!1305347 m!1195681))

(assert (=> b!1305347 m!1195681))

(assert (=> b!1305347 m!1195683))

(assert (=> bm!64440 m!1195679))

(declare-fun m!1195871 () Bool)

(assert (=> bm!64439 m!1195871))

(assert (=> d!141875 m!1195703))

(assert (=> b!1305332 m!1195681))

(assert (=> b!1305332 m!1195681))

(assert (=> b!1305332 m!1195683))

(declare-fun m!1195873 () Bool)

(assert (=> b!1305344 m!1195873))

(declare-fun m!1195875 () Bool)

(assert (=> b!1305344 m!1195875))

(declare-fun m!1195877 () Bool)

(assert (=> b!1305344 m!1195877))

(assert (=> b!1305344 m!1195875))

(declare-fun m!1195879 () Bool)

(assert (=> b!1305344 m!1195879))

(assert (=> b!1305344 m!1195877))

(declare-fun m!1195881 () Bool)

(assert (=> b!1305344 m!1195881))

(declare-fun m!1195883 () Bool)

(assert (=> b!1305344 m!1195883))

(declare-fun m!1195885 () Bool)

(assert (=> b!1305344 m!1195885))

(declare-fun m!1195887 () Bool)

(assert (=> b!1305344 m!1195887))

(assert (=> b!1305344 m!1195681))

(declare-fun m!1195889 () Bool)

(assert (=> b!1305344 m!1195889))

(assert (=> b!1305344 m!1195887))

(declare-fun m!1195891 () Bool)

(assert (=> b!1305344 m!1195891))

(assert (=> b!1305344 m!1195885))

(declare-fun m!1195893 () Bool)

(assert (=> b!1305344 m!1195893))

(declare-fun m!1195895 () Bool)

(assert (=> b!1305344 m!1195895))

(declare-fun m!1195897 () Bool)

(assert (=> b!1305344 m!1195897))

(declare-fun m!1195899 () Bool)

(assert (=> b!1305344 m!1195899))

(declare-fun m!1195901 () Bool)

(assert (=> b!1305344 m!1195901))

(assert (=> b!1305344 m!1195679))

(assert (=> b!1305341 m!1195681))

(assert (=> b!1305341 m!1195681))

(declare-fun m!1195903 () Bool)

(assert (=> b!1305341 m!1195903))

(assert (=> b!1305349 m!1195681))

(assert (=> b!1305349 m!1195833))

(assert (=> b!1305349 m!1195831))

(assert (=> b!1305349 m!1195833))

(assert (=> b!1305349 m!1195835))

(assert (=> b!1305349 m!1195831))

(assert (=> b!1305349 m!1195681))

(declare-fun m!1195905 () Bool)

(assert (=> b!1305349 m!1195905))

(assert (=> b!1305128 d!141875))

(declare-fun d!141877 () Bool)

(declare-fun res!866805 () Bool)

(declare-fun e!744587 () Bool)

(assert (=> d!141877 (=> res!866805 e!744587)))

(assert (=> d!141877 (= res!866805 (bvsge #b00000000000000000000000000000000 (size!42447 _keys!1741)))))

(assert (=> d!141877 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744587)))

(declare-fun b!1305358 () Bool)

(declare-fun e!744588 () Bool)

(declare-fun e!744589 () Bool)

(assert (=> b!1305358 (= e!744588 e!744589)))

(declare-fun lt!584277 () (_ BitVec 64))

(assert (=> b!1305358 (= lt!584277 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584276 () Unit!43067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86815 (_ BitVec 64) (_ BitVec 32)) Unit!43067)

(assert (=> b!1305358 (= lt!584276 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584277 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1305358 (arrayContainsKey!0 _keys!1741 lt!584277 #b00000000000000000000000000000000)))

(declare-fun lt!584278 () Unit!43067)

(assert (=> b!1305358 (= lt!584278 lt!584276)))

(declare-fun res!866806 () Bool)

(declare-datatypes ((SeekEntryResult!10028 0))(
  ( (MissingZero!10028 (index!42483 (_ BitVec 32))) (Found!10028 (index!42484 (_ BitVec 32))) (Intermediate!10028 (undefined!10840 Bool) (index!42485 (_ BitVec 32)) (x!115926 (_ BitVec 32))) (Undefined!10028) (MissingVacant!10028 (index!42486 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86815 (_ BitVec 32)) SeekEntryResult!10028)

(assert (=> b!1305358 (= res!866806 (= (seekEntryOrOpen!0 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10028 #b00000000000000000000000000000000)))))

(assert (=> b!1305358 (=> (not res!866806) (not e!744589))))

(declare-fun bm!64445 () Bool)

(declare-fun call!64448 () Bool)

(assert (=> bm!64445 (= call!64448 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305359 () Bool)

(assert (=> b!1305359 (= e!744589 call!64448)))

(declare-fun b!1305360 () Bool)

(assert (=> b!1305360 (= e!744588 call!64448)))

(declare-fun b!1305361 () Bool)

(assert (=> b!1305361 (= e!744587 e!744588)))

(declare-fun c!125386 () Bool)

(assert (=> b!1305361 (= c!125386 (validKeyInArray!0 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141877 (not res!866805)) b!1305361))

(assert (= (and b!1305361 c!125386) b!1305358))

(assert (= (and b!1305361 (not c!125386)) b!1305360))

(assert (= (and b!1305358 res!866806) b!1305359))

(assert (= (or b!1305359 b!1305360) bm!64445))

(declare-fun m!1195907 () Bool)

(assert (=> b!1305358 m!1195907))

(declare-fun m!1195909 () Bool)

(assert (=> b!1305358 m!1195909))

(declare-fun m!1195911 () Bool)

(assert (=> b!1305358 m!1195911))

(assert (=> b!1305358 m!1195907))

(declare-fun m!1195913 () Bool)

(assert (=> b!1305358 m!1195913))

(declare-fun m!1195915 () Bool)

(assert (=> bm!64445 m!1195915))

(assert (=> b!1305361 m!1195907))

(assert (=> b!1305361 m!1195907))

(declare-fun m!1195917 () Bool)

(assert (=> b!1305361 m!1195917))

(assert (=> b!1305114 d!141877))

(declare-fun d!141879 () Bool)

(assert (=> d!141879 (not (contains!8274 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!584279 () Unit!43067)

(assert (=> d!141879 (= lt!584279 (choose!1944 lt!584061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!744590 () Bool)

(assert (=> d!141879 e!744590))

(declare-fun res!866807 () Bool)

(assert (=> d!141879 (=> (not res!866807) (not e!744590))))

(assert (=> d!141879 (= res!866807 (not (contains!8274 lt!584061 k0!1205)))))

(assert (=> d!141879 (= (addStillNotContains!476 lt!584061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!584279)))

(declare-fun b!1305362 () Bool)

(assert (=> b!1305362 (= e!744590 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141879 res!866807) b!1305362))

(declare-fun m!1195919 () Bool)

(assert (=> d!141879 m!1195919))

(assert (=> d!141879 m!1195919))

(declare-fun m!1195921 () Bool)

(assert (=> d!141879 m!1195921))

(declare-fun m!1195923 () Bool)

(assert (=> d!141879 m!1195923))

(declare-fun m!1195925 () Bool)

(assert (=> d!141879 m!1195925))

(assert (=> b!1305127 d!141879))

(declare-fun d!141881 () Bool)

(declare-fun e!744592 () Bool)

(assert (=> d!141881 e!744592))

(declare-fun res!866808 () Bool)

(assert (=> d!141881 (=> res!866808 e!744592)))

(declare-fun lt!584281 () Bool)

(assert (=> d!141881 (= res!866808 (not lt!584281))))

(declare-fun lt!584283 () Bool)

(assert (=> d!141881 (= lt!584281 lt!584283)))

(declare-fun lt!584282 () Unit!43067)

(declare-fun e!744591 () Unit!43067)

(assert (=> d!141881 (= lt!584282 e!744591)))

(declare-fun c!125387 () Bool)

(assert (=> d!141881 (= c!125387 lt!584283)))

(assert (=> d!141881 (= lt!584283 (containsKey!729 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141881 (= (contains!8274 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!584281)))

(declare-fun b!1305363 () Bool)

(declare-fun lt!584280 () Unit!43067)

(assert (=> b!1305363 (= e!744591 lt!584280)))

(assert (=> b!1305363 (= lt!584280 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> b!1305363 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1305364 () Bool)

(declare-fun Unit!43078 () Unit!43067)

(assert (=> b!1305364 (= e!744591 Unit!43078)))

(declare-fun b!1305365 () Bool)

(assert (=> b!1305365 (= e!744592 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141881 c!125387) b!1305363))

(assert (= (and d!141881 (not c!125387)) b!1305364))

(assert (= (and d!141881 (not res!866808)) b!1305365))

(declare-fun m!1195927 () Bool)

(assert (=> d!141881 m!1195927))

(declare-fun m!1195929 () Bool)

(assert (=> b!1305363 m!1195929))

(declare-fun m!1195931 () Bool)

(assert (=> b!1305363 m!1195931))

(assert (=> b!1305363 m!1195931))

(declare-fun m!1195933 () Bool)

(assert (=> b!1305363 m!1195933))

(assert (=> b!1305365 m!1195931))

(assert (=> b!1305365 m!1195931))

(assert (=> b!1305365 m!1195933))

(assert (=> b!1305127 d!141881))

(declare-fun d!141883 () Bool)

(declare-fun e!744595 () Bool)

(assert (=> d!141883 e!744595))

(declare-fun res!866813 () Bool)

(assert (=> d!141883 (=> (not res!866813) (not e!744595))))

(declare-fun lt!584293 () ListLongMap!20373)

(assert (=> d!141883 (= res!866813 (contains!8274 lt!584293 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584295 () List!29820)

(assert (=> d!141883 (= lt!584293 (ListLongMap!20374 lt!584295))))

(declare-fun lt!584292 () Unit!43067)

(declare-fun lt!584294 () Unit!43067)

(assert (=> d!141883 (= lt!584292 lt!584294)))

(assert (=> d!141883 (= (getValueByKey!712 lt!584295 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!356 (List!29820 (_ BitVec 64) V!51697) Unit!43067)

(assert (=> d!141883 (= lt!584294 (lemmaContainsTupThenGetReturnValue!356 lt!584295 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!485 (List!29820 (_ BitVec 64) V!51697) List!29820)

(assert (=> d!141883 (= lt!584295 (insertStrictlySorted!485 (toList!10202 lt!584061) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141883 (= (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584293)))

(declare-fun b!1305370 () Bool)

(declare-fun res!866814 () Bool)

(assert (=> b!1305370 (=> (not res!866814) (not e!744595))))

(assert (=> b!1305370 (= res!866814 (= (getValueByKey!712 (toList!10202 lt!584293) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305371 () Bool)

(declare-fun contains!8276 (List!29820 tuple2!22716) Bool)

(assert (=> b!1305371 (= e!744595 (contains!8276 (toList!10202 lt!584293) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141883 res!866813) b!1305370))

(assert (= (and b!1305370 res!866814) b!1305371))

(declare-fun m!1195935 () Bool)

(assert (=> d!141883 m!1195935))

(declare-fun m!1195937 () Bool)

(assert (=> d!141883 m!1195937))

(declare-fun m!1195939 () Bool)

(assert (=> d!141883 m!1195939))

(declare-fun m!1195941 () Bool)

(assert (=> d!141883 m!1195941))

(declare-fun m!1195943 () Bool)

(assert (=> b!1305370 m!1195943))

(declare-fun m!1195945 () Bool)

(assert (=> b!1305371 m!1195945))

(assert (=> b!1305127 d!141883))

(declare-fun d!141885 () Bool)

(assert (=> d!141885 (contains!8274 lt!584061 k0!1205)))

(declare-fun lt!584298 () Unit!43067)

(declare-fun choose!1945 ((_ BitVec 64) (_ BitVec 64) V!51697 ListLongMap!20373) Unit!43067)

(assert (=> d!141885 (= lt!584298 (choose!1945 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584061))))

(assert (=> d!141885 (contains!8274 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!141885 (= (lemmaInListMapAfterAddingDiffThenInBefore!95 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584061) lt!584298)))

(declare-fun bs!37153 () Bool)

(assert (= bs!37153 d!141885))

(assert (=> bs!37153 m!1195925))

(declare-fun m!1195947 () Bool)

(assert (=> bs!37153 m!1195947))

(assert (=> bs!37153 m!1195919))

(assert (=> bs!37153 m!1195919))

(assert (=> bs!37153 m!1195921))

(assert (=> b!1305127 d!141885))

(declare-fun d!141887 () Bool)

(assert (=> d!141887 (contains!8274 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) k0!1205)))

(declare-fun lt!584299 () Unit!43067)

(assert (=> d!141887 (= lt!584299 (choose!1945 k0!1205 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))))

(assert (=> d!141887 (contains!8274 (+!4523 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!141887 (= (lemmaInListMapAfterAddingDiffThenInBefore!95 k0!1205 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) lt!584299)))

(declare-fun bs!37154 () Bool)

(assert (= bs!37154 d!141887))

(assert (=> bs!37154 m!1195719))

(declare-fun m!1195949 () Bool)

(assert (=> bs!37154 m!1195949))

(declare-fun m!1195951 () Bool)

(assert (=> bs!37154 m!1195951))

(assert (=> bs!37154 m!1195951))

(declare-fun m!1195953 () Bool)

(assert (=> bs!37154 m!1195953))

(assert (=> bm!64337 d!141887))

(declare-fun d!141889 () Bool)

(declare-fun e!744596 () Bool)

(assert (=> d!141889 e!744596))

(declare-fun res!866815 () Bool)

(assert (=> d!141889 (=> (not res!866815) (not e!744596))))

(declare-fun lt!584301 () ListLongMap!20373)

(assert (=> d!141889 (= res!866815 (contains!8274 lt!584301 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584303 () List!29820)

(assert (=> d!141889 (= lt!584301 (ListLongMap!20374 lt!584303))))

(declare-fun lt!584300 () Unit!43067)

(declare-fun lt!584302 () Unit!43067)

(assert (=> d!141889 (= lt!584300 lt!584302)))

(assert (=> d!141889 (= (getValueByKey!712 lt!584303 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!762 (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141889 (= lt!584302 (lemmaContainsTupThenGetReturnValue!356 lt!584303 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141889 (= lt!584303 (insertStrictlySorted!485 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141889 (= (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584301)))

(declare-fun b!1305372 () Bool)

(declare-fun res!866816 () Bool)

(assert (=> b!1305372 (=> (not res!866816) (not e!744596))))

(assert (=> b!1305372 (= res!866816 (= (getValueByKey!712 (toList!10202 lt!584301) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!762 (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305373 () Bool)

(assert (=> b!1305373 (= e!744596 (contains!8276 (toList!10202 lt!584301) (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141889 res!866815) b!1305372))

(assert (= (and b!1305372 res!866816) b!1305373))

(declare-fun m!1195955 () Bool)

(assert (=> d!141889 m!1195955))

(declare-fun m!1195957 () Bool)

(assert (=> d!141889 m!1195957))

(declare-fun m!1195959 () Bool)

(assert (=> d!141889 m!1195959))

(declare-fun m!1195961 () Bool)

(assert (=> d!141889 m!1195961))

(declare-fun m!1195963 () Bool)

(assert (=> b!1305372 m!1195963))

(declare-fun m!1195965 () Bool)

(assert (=> b!1305373 m!1195965))

(assert (=> bm!64345 d!141889))

(declare-fun d!141891 () Bool)

(assert (=> d!141891 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110258 d!141891))

(declare-fun d!141893 () Bool)

(assert (=> d!141893 (= (array_inv!31863 _values!1445) (bvsge (size!42448 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110258 d!141893))

(declare-fun d!141895 () Bool)

(assert (=> d!141895 (= (array_inv!31864 _keys!1741) (bvsge (size!42447 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110258 d!141895))

(declare-fun d!141897 () Bool)

(declare-fun e!744598 () Bool)

(assert (=> d!141897 e!744598))

(declare-fun res!866817 () Bool)

(assert (=> d!141897 (=> res!866817 e!744598)))

(declare-fun lt!584305 () Bool)

(assert (=> d!141897 (= res!866817 (not lt!584305))))

(declare-fun lt!584307 () Bool)

(assert (=> d!141897 (= lt!584305 lt!584307)))

(declare-fun lt!584306 () Unit!43067)

(declare-fun e!744597 () Unit!43067)

(assert (=> d!141897 (= lt!584306 e!744597)))

(declare-fun c!125388 () Bool)

(assert (=> d!141897 (= c!125388 lt!584307)))

(assert (=> d!141897 (= lt!584307 (containsKey!729 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(assert (=> d!141897 (= (contains!8274 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) k0!1205) lt!584305)))

(declare-fun b!1305374 () Bool)

(declare-fun lt!584304 () Unit!43067)

(assert (=> b!1305374 (= e!744597 lt!584304)))

(assert (=> b!1305374 (= lt!584304 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(assert (=> b!1305374 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(declare-fun b!1305375 () Bool)

(declare-fun Unit!43079 () Unit!43067)

(assert (=> b!1305375 (= e!744597 Unit!43079)))

(declare-fun b!1305376 () Bool)

(assert (=> b!1305376 (= e!744598 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205)))))

(assert (= (and d!141897 c!125388) b!1305374))

(assert (= (and d!141897 (not c!125388)) b!1305375))

(assert (= (and d!141897 (not res!866817)) b!1305376))

(declare-fun m!1195967 () Bool)

(assert (=> d!141897 m!1195967))

(declare-fun m!1195969 () Bool)

(assert (=> b!1305374 m!1195969))

(declare-fun m!1195971 () Bool)

(assert (=> b!1305374 m!1195971))

(assert (=> b!1305374 m!1195971))

(declare-fun m!1195973 () Bool)

(assert (=> b!1305374 m!1195973))

(assert (=> b!1305376 m!1195971))

(assert (=> b!1305376 m!1195971))

(assert (=> b!1305376 m!1195973))

(assert (=> bm!64338 d!141897))

(declare-fun d!141899 () Bool)

(declare-fun e!744600 () Bool)

(assert (=> d!141899 e!744600))

(declare-fun res!866818 () Bool)

(assert (=> d!141899 (=> res!866818 e!744600)))

(declare-fun lt!584309 () Bool)

(assert (=> d!141899 (= res!866818 (not lt!584309))))

(declare-fun lt!584311 () Bool)

(assert (=> d!141899 (= lt!584309 lt!584311)))

(declare-fun lt!584310 () Unit!43067)

(declare-fun e!744599 () Unit!43067)

(assert (=> d!141899 (= lt!584310 e!744599)))

(declare-fun c!125389 () Bool)

(assert (=> d!141899 (= c!125389 lt!584311)))

(assert (=> d!141899 (= lt!584311 (containsKey!729 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205))))

(assert (=> d!141899 (= (contains!8274 (ListLongMap!20374 Nil!29817) k0!1205) lt!584309)))

(declare-fun b!1305377 () Bool)

(declare-fun lt!584308 () Unit!43067)

(assert (=> b!1305377 (= e!744599 lt!584308)))

(assert (=> b!1305377 (= lt!584308 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205))))

(assert (=> b!1305377 (isDefined!519 (getValueByKey!712 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205))))

(declare-fun b!1305378 () Bool)

(declare-fun Unit!43080 () Unit!43067)

(assert (=> b!1305378 (= e!744599 Unit!43080)))

(declare-fun b!1305379 () Bool)

(assert (=> b!1305379 (= e!744600 (isDefined!519 (getValueByKey!712 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205)))))

(assert (= (and d!141899 c!125389) b!1305377))

(assert (= (and d!141899 (not c!125389)) b!1305378))

(assert (= (and d!141899 (not res!866818)) b!1305379))

(declare-fun m!1195975 () Bool)

(assert (=> d!141899 m!1195975))

(declare-fun m!1195977 () Bool)

(assert (=> b!1305377 m!1195977))

(declare-fun m!1195979 () Bool)

(assert (=> b!1305377 m!1195979))

(assert (=> b!1305377 m!1195979))

(declare-fun m!1195981 () Bool)

(assert (=> b!1305377 m!1195981))

(assert (=> b!1305379 m!1195979))

(assert (=> b!1305379 m!1195979))

(assert (=> b!1305379 m!1195981))

(assert (=> b!1305123 d!141899))

(declare-fun d!141901 () Bool)

(assert (=> d!141901 (not (contains!8274 (ListLongMap!20374 Nil!29817) k0!1205))))

(declare-fun lt!584314 () Unit!43067)

(declare-fun choose!1946 ((_ BitVec 64)) Unit!43067)

(assert (=> d!141901 (= lt!584314 (choose!1946 k0!1205))))

(assert (=> d!141901 (= (emptyContainsNothing!228 k0!1205) lt!584314)))

(declare-fun bs!37155 () Bool)

(assert (= bs!37155 d!141901))

(assert (=> bs!37155 m!1195687))

(declare-fun m!1195983 () Bool)

(assert (=> bs!37155 m!1195983))

(assert (=> b!1305123 d!141901))

(declare-fun d!141903 () Bool)

(declare-fun res!866825 () Bool)

(declare-fun e!744609 () Bool)

(assert (=> d!141903 (=> res!866825 e!744609)))

(assert (=> d!141903 (= res!866825 (bvsge #b00000000000000000000000000000000 (size!42447 _keys!1741)))))

(assert (=> d!141903 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29818) e!744609)))

(declare-fun b!1305390 () Bool)

(declare-fun e!744612 () Bool)

(assert (=> b!1305390 (= e!744609 e!744612)))

(declare-fun res!866826 () Bool)

(assert (=> b!1305390 (=> (not res!866826) (not e!744612))))

(declare-fun e!744611 () Bool)

(assert (=> b!1305390 (= res!866826 (not e!744611))))

(declare-fun res!866827 () Bool)

(assert (=> b!1305390 (=> (not res!866827) (not e!744611))))

(assert (=> b!1305390 (= res!866827 (validKeyInArray!0 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305391 () Bool)

(declare-fun contains!8277 (List!29821 (_ BitVec 64)) Bool)

(assert (=> b!1305391 (= e!744611 (contains!8277 Nil!29818 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64448 () Bool)

(declare-fun call!64451 () Bool)

(declare-fun c!125392 () Bool)

(assert (=> bm!64448 (= call!64451 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125392 (Cons!29817 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) Nil!29818) Nil!29818)))))

(declare-fun b!1305392 () Bool)

(declare-fun e!744610 () Bool)

(assert (=> b!1305392 (= e!744612 e!744610)))

(assert (=> b!1305392 (= c!125392 (validKeyInArray!0 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305393 () Bool)

(assert (=> b!1305393 (= e!744610 call!64451)))

(declare-fun b!1305394 () Bool)

(assert (=> b!1305394 (= e!744610 call!64451)))

(assert (= (and d!141903 (not res!866825)) b!1305390))

(assert (= (and b!1305390 res!866827) b!1305391))

(assert (= (and b!1305390 res!866826) b!1305392))

(assert (= (and b!1305392 c!125392) b!1305394))

(assert (= (and b!1305392 (not c!125392)) b!1305393))

(assert (= (or b!1305394 b!1305393) bm!64448))

(assert (=> b!1305390 m!1195907))

(assert (=> b!1305390 m!1195907))

(assert (=> b!1305390 m!1195917))

(assert (=> b!1305391 m!1195907))

(assert (=> b!1305391 m!1195907))

(declare-fun m!1195985 () Bool)

(assert (=> b!1305391 m!1195985))

(assert (=> bm!64448 m!1195907))

(declare-fun m!1195987 () Bool)

(assert (=> bm!64448 m!1195987))

(assert (=> b!1305392 m!1195907))

(assert (=> b!1305392 m!1195907))

(assert (=> b!1305392 m!1195917))

(assert (=> b!1305117 d!141903))

(declare-fun b!1305401 () Bool)

(declare-fun e!744617 () Bool)

(assert (=> b!1305401 (= e!744617 tp_is_empty!34945)))

(declare-fun mapIsEmpty!54033 () Bool)

(declare-fun mapRes!54033 () Bool)

(assert (=> mapIsEmpty!54033 mapRes!54033))

(declare-fun b!1305402 () Bool)

(declare-fun e!744618 () Bool)

(assert (=> b!1305402 (= e!744618 tp_is_empty!34945)))

(declare-fun mapNonEmpty!54033 () Bool)

(declare-fun tp!103096 () Bool)

(assert (=> mapNonEmpty!54033 (= mapRes!54033 (and tp!103096 e!744617))))

(declare-fun mapRest!54033 () (Array (_ BitVec 32) ValueCell!16574))

(declare-fun mapValue!54033 () ValueCell!16574)

(declare-fun mapKey!54033 () (_ BitVec 32))

(assert (=> mapNonEmpty!54033 (= mapRest!54024 (store mapRest!54033 mapKey!54033 mapValue!54033))))

(declare-fun condMapEmpty!54033 () Bool)

(declare-fun mapDefault!54033 () ValueCell!16574)

(assert (=> mapNonEmpty!54024 (= condMapEmpty!54033 (= mapRest!54024 ((as const (Array (_ BitVec 32) ValueCell!16574)) mapDefault!54033)))))

(assert (=> mapNonEmpty!54024 (= tp!103080 (and e!744618 mapRes!54033))))

(assert (= (and mapNonEmpty!54024 condMapEmpty!54033) mapIsEmpty!54033))

(assert (= (and mapNonEmpty!54024 (not condMapEmpty!54033)) mapNonEmpty!54033))

(assert (= (and mapNonEmpty!54033 ((_ is ValueCellFull!16574) mapValue!54033)) b!1305401))

(assert (= (and mapNonEmpty!54024 ((_ is ValueCellFull!16574) mapDefault!54033)) b!1305402))

(declare-fun m!1195989 () Bool)

(assert (=> mapNonEmpty!54033 m!1195989))

(declare-fun b_lambda!23335 () Bool)

(assert (= b_lambda!23333 (or (and start!110258 b_free!29305) b_lambda!23335)))

(declare-fun b_lambda!23337 () Bool)

(assert (= b_lambda!23331 (or (and start!110258 b_free!29305) b_lambda!23337)))

(declare-fun b_lambda!23339 () Bool)

(assert (= b_lambda!23329 (or (and start!110258 b_free!29305) b_lambda!23339)))

(check-sat (not b!1305331) (not b!1305361) (not b_lambda!23339) (not bm!64442) (not d!141897) (not bm!64445) (not b!1305374) (not b!1305270) b_and!47493 (not b!1305280) (not b_lambda!23337) (not d!141883) (not b!1305275) (not bm!64448) (not b!1305245) (not bm!64421) (not b!1305390) (not b!1305271) (not b!1305332) (not b!1305370) (not d!141887) (not b!1305284) (not mapNonEmpty!54033) (not d!141873) (not b!1305341) (not b!1305358) (not d!141899) (not d!141889) (not b!1305392) (not d!141871) (not b!1305348) (not bm!64436) (not bm!64439) (not b!1305333) (not b_next!29305) (not b!1305347) (not b!1305379) (not b!1305373) (not b!1305377) (not d!141865) tp_is_empty!34945 (not b!1305286) (not b!1305376) (not b!1305363) (not d!141885) (not b!1305344) (not b!1305277) (not b!1305243) (not b!1305349) (not b!1305276) (not b!1305371) (not d!141879) (not d!141901) (not bm!64440) (not b!1305273) (not b!1305372) (not d!141875) (not d!141881) (not b!1305365) (not d!141869) (not b!1305279) (not b_lambda!23335) (not b!1305391))
(check-sat b_and!47493 (not b_next!29305))
(get-model)

(declare-fun d!141905 () Bool)

(declare-fun lt!584317 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!646 (List!29820) (InoxSet tuple2!22716))

(assert (=> d!141905 (= lt!584317 (select (content!646 (toList!10202 lt!584301)) (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun e!744624 () Bool)

(assert (=> d!141905 (= lt!584317 e!744624)))

(declare-fun res!866832 () Bool)

(assert (=> d!141905 (=> (not res!866832) (not e!744624))))

(assert (=> d!141905 (= res!866832 ((_ is Cons!29816) (toList!10202 lt!584301)))))

(assert (=> d!141905 (= (contains!8276 (toList!10202 lt!584301) (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584317)))

(declare-fun b!1305407 () Bool)

(declare-fun e!744623 () Bool)

(assert (=> b!1305407 (= e!744624 e!744623)))

(declare-fun res!866833 () Bool)

(assert (=> b!1305407 (=> res!866833 e!744623)))

(assert (=> b!1305407 (= res!866833 (= (h!31025 (toList!10202 lt!584301)) (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305408 () Bool)

(assert (=> b!1305408 (= e!744623 (contains!8276 (t!43414 (toList!10202 lt!584301)) (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141905 res!866832) b!1305407))

(assert (= (and b!1305407 (not res!866833)) b!1305408))

(declare-fun m!1195991 () Bool)

(assert (=> d!141905 m!1195991))

(declare-fun m!1195993 () Bool)

(assert (=> d!141905 m!1195993))

(declare-fun m!1195995 () Bool)

(assert (=> b!1305408 m!1195995))

(assert (=> b!1305373 d!141905))

(declare-fun d!141907 () Bool)

(declare-fun e!744626 () Bool)

(assert (=> d!141907 e!744626))

(declare-fun res!866834 () Bool)

(assert (=> d!141907 (=> res!866834 e!744626)))

(declare-fun lt!584319 () Bool)

(assert (=> d!141907 (= res!866834 (not lt!584319))))

(declare-fun lt!584321 () Bool)

(assert (=> d!141907 (= lt!584319 lt!584321)))

(declare-fun lt!584320 () Unit!43067)

(declare-fun e!744625 () Unit!43067)

(assert (=> d!141907 (= lt!584320 e!744625)))

(declare-fun c!125393 () Bool)

(assert (=> d!141907 (= c!125393 lt!584321)))

(assert (=> d!141907 (= lt!584321 (containsKey!729 (toList!10202 lt!584194) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141907 (= (contains!8274 lt!584194 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584319)))

(declare-fun b!1305409 () Bool)

(declare-fun lt!584318 () Unit!43067)

(assert (=> b!1305409 (= e!744625 lt!584318)))

(assert (=> b!1305409 (= lt!584318 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584194) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305409 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584194) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305410 () Bool)

(declare-fun Unit!43081 () Unit!43067)

(assert (=> b!1305410 (= e!744625 Unit!43081)))

(declare-fun b!1305411 () Bool)

(assert (=> b!1305411 (= e!744626 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584194) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141907 c!125393) b!1305409))

(assert (= (and d!141907 (not c!125393)) b!1305410))

(assert (= (and d!141907 (not res!866834)) b!1305411))

(declare-fun m!1195997 () Bool)

(assert (=> d!141907 m!1195997))

(declare-fun m!1195999 () Bool)

(assert (=> b!1305409 m!1195999))

(declare-fun m!1196001 () Bool)

(assert (=> b!1305409 m!1196001))

(assert (=> b!1305409 m!1196001))

(declare-fun m!1196003 () Bool)

(assert (=> b!1305409 m!1196003))

(assert (=> b!1305411 m!1196001))

(assert (=> b!1305411 m!1196001))

(assert (=> b!1305411 m!1196003))

(assert (=> d!141871 d!141907))

(assert (=> d!141871 d!141891))

(assert (=> d!141887 d!141897))

(declare-fun d!141909 () Bool)

(assert (=> d!141909 (contains!8274 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) k0!1205)))

(assert (=> d!141909 true))

(declare-fun _$21!124 () Unit!43067)

(assert (=> d!141909 (= (choose!1945 k0!1205 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) _$21!124)))

(declare-fun bs!37156 () Bool)

(assert (= bs!37156 d!141909))

(assert (=> bs!37156 m!1195719))

(assert (=> d!141887 d!141909))

(declare-fun d!141911 () Bool)

(declare-fun e!744628 () Bool)

(assert (=> d!141911 e!744628))

(declare-fun res!866835 () Bool)

(assert (=> d!141911 (=> res!866835 e!744628)))

(declare-fun lt!584323 () Bool)

(assert (=> d!141911 (= res!866835 (not lt!584323))))

(declare-fun lt!584325 () Bool)

(assert (=> d!141911 (= lt!584323 lt!584325)))

(declare-fun lt!584324 () Unit!43067)

(declare-fun e!744627 () Unit!43067)

(assert (=> d!141911 (= lt!584324 e!744627)))

(declare-fun c!125394 () Bool)

(assert (=> d!141911 (= c!125394 lt!584325)))

(assert (=> d!141911 (= lt!584325 (containsKey!729 (toList!10202 (+!4523 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> d!141911 (= (contains!8274 (+!4523 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) k0!1205) lt!584323)))

(declare-fun b!1305412 () Bool)

(declare-fun lt!584322 () Unit!43067)

(assert (=> b!1305412 (= e!744627 lt!584322)))

(assert (=> b!1305412 (= lt!584322 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (+!4523 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> b!1305412 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205))))

(declare-fun b!1305413 () Bool)

(declare-fun Unit!43082 () Unit!43067)

(assert (=> b!1305413 (= e!744627 Unit!43082)))

(declare-fun b!1305414 () Bool)

(assert (=> b!1305414 (= e!744628 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205)))))

(assert (= (and d!141911 c!125394) b!1305412))

(assert (= (and d!141911 (not c!125394)) b!1305413))

(assert (= (and d!141911 (not res!866835)) b!1305414))

(declare-fun m!1196005 () Bool)

(assert (=> d!141911 m!1196005))

(declare-fun m!1196007 () Bool)

(assert (=> b!1305412 m!1196007))

(declare-fun m!1196009 () Bool)

(assert (=> b!1305412 m!1196009))

(assert (=> b!1305412 m!1196009))

(declare-fun m!1196011 () Bool)

(assert (=> b!1305412 m!1196011))

(assert (=> b!1305414 m!1196009))

(assert (=> b!1305414 m!1196009))

(assert (=> b!1305414 m!1196011))

(assert (=> d!141887 d!141911))

(declare-fun d!141913 () Bool)

(declare-fun e!744629 () Bool)

(assert (=> d!141913 e!744629))

(declare-fun res!866836 () Bool)

(assert (=> d!141913 (=> (not res!866836) (not e!744629))))

(declare-fun lt!584327 () ListLongMap!20373)

(assert (=> d!141913 (= res!866836 (contains!8274 lt!584327 (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(declare-fun lt!584329 () List!29820)

(assert (=> d!141913 (= lt!584327 (ListLongMap!20374 lt!584329))))

(declare-fun lt!584326 () Unit!43067)

(declare-fun lt!584328 () Unit!43067)

(assert (=> d!141913 (= lt!584326 lt!584328)))

(assert (=> d!141913 (= (getValueByKey!712 lt!584329 (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) (Some!762 (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141913 (= lt!584328 (lemmaContainsTupThenGetReturnValue!356 lt!584329 (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141913 (= lt!584329 (insertStrictlySorted!485 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141913 (= (+!4523 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) lt!584327)))

(declare-fun b!1305415 () Bool)

(declare-fun res!866837 () Bool)

(assert (=> b!1305415 (=> (not res!866837) (not e!744629))))

(assert (=> b!1305415 (= res!866837 (= (getValueByKey!712 (toList!10202 lt!584327) (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) (Some!762 (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))))))))

(declare-fun b!1305416 () Bool)

(assert (=> b!1305416 (= e!744629 (contains!8276 (toList!10202 lt!584327) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))))))

(assert (= (and d!141913 res!866836) b!1305415))

(assert (= (and b!1305415 res!866837) b!1305416))

(declare-fun m!1196013 () Bool)

(assert (=> d!141913 m!1196013))

(declare-fun m!1196015 () Bool)

(assert (=> d!141913 m!1196015))

(declare-fun m!1196017 () Bool)

(assert (=> d!141913 m!1196017))

(declare-fun m!1196019 () Bool)

(assert (=> d!141913 m!1196019))

(declare-fun m!1196021 () Bool)

(assert (=> b!1305415 m!1196021))

(declare-fun m!1196023 () Bool)

(assert (=> b!1305416 m!1196023))

(assert (=> d!141887 d!141913))

(assert (=> b!1305347 d!141867))

(declare-fun d!141915 () Bool)

(declare-fun get!21189 (Option!763) V!51697)

(assert (=> d!141915 (= (apply!1019 lt!584264 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21189 (getValueByKey!712 (toList!10202 lt!584264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37157 () Bool)

(assert (= bs!37157 d!141915))

(declare-fun m!1196025 () Bool)

(assert (=> bs!37157 m!1196025))

(assert (=> bs!37157 m!1196025))

(declare-fun m!1196027 () Bool)

(assert (=> bs!37157 m!1196027))

(assert (=> b!1305331 d!141915))

(declare-fun b!1305417 () Bool)

(declare-fun lt!584331 () ListLongMap!20373)

(declare-fun e!744632 () Bool)

(assert (=> b!1305417 (= e!744632 (= lt!584331 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305418 () Bool)

(declare-fun lt!584330 () Unit!43067)

(declare-fun lt!584333 () Unit!43067)

(assert (=> b!1305418 (= lt!584330 lt!584333)))

(declare-fun lt!584334 () V!51697)

(declare-fun lt!584336 () (_ BitVec 64))

(declare-fun lt!584332 () ListLongMap!20373)

(declare-fun lt!584335 () (_ BitVec 64))

(assert (=> b!1305418 (not (contains!8274 (+!4523 lt!584332 (tuple2!22717 lt!584335 lt!584334)) lt!584336))))

(assert (=> b!1305418 (= lt!584333 (addStillNotContains!476 lt!584332 lt!584335 lt!584334 lt!584336))))

(assert (=> b!1305418 (= lt!584336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1305418 (= lt!584334 (get!21188 (select (arr!41896 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305418 (= lt!584335 (select (arr!41895 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(declare-fun call!64452 () ListLongMap!20373)

(assert (=> b!1305418 (= lt!584332 call!64452)))

(declare-fun e!744630 () ListLongMap!20373)

(assert (=> b!1305418 (= e!744630 (+!4523 call!64452 (tuple2!22717 (select (arr!41895 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21188 (select (arr!41896 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1305419 () Bool)

(assert (=> b!1305419 (= e!744630 call!64452)))

(declare-fun bm!64449 () Bool)

(assert (=> bm!64449 (= call!64452 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305420 () Bool)

(declare-fun e!744634 () ListLongMap!20373)

(assert (=> b!1305420 (= e!744634 e!744630)))

(declare-fun c!125397 () Bool)

(assert (=> b!1305420 (= c!125397 (validKeyInArray!0 (select (arr!41895 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1305421 () Bool)

(declare-fun e!744636 () Bool)

(declare-fun e!744631 () Bool)

(assert (=> b!1305421 (= e!744636 e!744631)))

(declare-fun c!125398 () Bool)

(declare-fun e!744635 () Bool)

(assert (=> b!1305421 (= c!125398 e!744635)))

(declare-fun res!866840 () Bool)

(assert (=> b!1305421 (=> (not res!866840) (not e!744635))))

(assert (=> b!1305421 (= res!866840 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(declare-fun b!1305423 () Bool)

(assert (=> b!1305423 (= e!744632 (isEmpty!1076 lt!584331))))

(declare-fun b!1305424 () Bool)

(declare-fun e!744633 () Bool)

(assert (=> b!1305424 (= e!744631 e!744633)))

(assert (=> b!1305424 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(declare-fun res!866839 () Bool)

(assert (=> b!1305424 (= res!866839 (contains!8274 lt!584331 (select (arr!41895 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305424 (=> (not res!866839) (not e!744633))))

(declare-fun b!1305425 () Bool)

(assert (=> b!1305425 (= e!744631 e!744632)))

(declare-fun c!125395 () Bool)

(assert (=> b!1305425 (= c!125395 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(declare-fun b!1305426 () Bool)

(assert (=> b!1305426 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(assert (=> b!1305426 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42448 _values!1445)))))

(assert (=> b!1305426 (= e!744633 (= (apply!1019 lt!584331 (select (arr!41895 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21188 (select (arr!41896 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1305427 () Bool)

(declare-fun res!866841 () Bool)

(assert (=> b!1305427 (=> (not res!866841) (not e!744636))))

(assert (=> b!1305427 (= res!866841 (not (contains!8274 lt!584331 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305428 () Bool)

(assert (=> b!1305428 (= e!744634 (ListLongMap!20374 Nil!29817))))

(declare-fun d!141917 () Bool)

(assert (=> d!141917 e!744636))

(declare-fun res!866838 () Bool)

(assert (=> d!141917 (=> (not res!866838) (not e!744636))))

(assert (=> d!141917 (= res!866838 (not (contains!8274 lt!584331 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141917 (= lt!584331 e!744634)))

(declare-fun c!125396 () Bool)

(assert (=> d!141917 (= c!125396 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(assert (=> d!141917 (validMask!0 mask!2175)))

(assert (=> d!141917 (= (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!584331)))

(declare-fun b!1305422 () Bool)

(assert (=> b!1305422 (= e!744635 (validKeyInArray!0 (select (arr!41895 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305422 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!141917 c!125396) b!1305428))

(assert (= (and d!141917 (not c!125396)) b!1305420))

(assert (= (and b!1305420 c!125397) b!1305418))

(assert (= (and b!1305420 (not c!125397)) b!1305419))

(assert (= (or b!1305418 b!1305419) bm!64449))

(assert (= (and d!141917 res!866838) b!1305427))

(assert (= (and b!1305427 res!866841) b!1305421))

(assert (= (and b!1305421 res!866840) b!1305422))

(assert (= (and b!1305421 c!125398) b!1305424))

(assert (= (and b!1305421 (not c!125398)) b!1305425))

(assert (= (and b!1305424 res!866839) b!1305426))

(assert (= (and b!1305425 c!125395) b!1305417))

(assert (= (and b!1305425 (not c!125395)) b!1305423))

(declare-fun b_lambda!23341 () Bool)

(assert (=> (not b_lambda!23341) (not b!1305418)))

(assert (=> b!1305418 t!43420))

(declare-fun b_and!47495 () Bool)

(assert (= b_and!47493 (and (=> t!43420 result!23835) b_and!47495)))

(declare-fun b_lambda!23343 () Bool)

(assert (=> (not b_lambda!23343) (not b!1305426)))

(assert (=> b!1305426 t!43420))

(declare-fun b_and!47497 () Bool)

(assert (= b_and!47495 (and (=> t!43420 result!23835) b_and!47497)))

(declare-fun m!1196029 () Bool)

(assert (=> b!1305422 m!1196029))

(assert (=> b!1305422 m!1196029))

(declare-fun m!1196031 () Bool)

(assert (=> b!1305422 m!1196031))

(assert (=> b!1305420 m!1196029))

(assert (=> b!1305420 m!1196029))

(assert (=> b!1305420 m!1196031))

(declare-fun m!1196033 () Bool)

(assert (=> bm!64449 m!1196033))

(declare-fun m!1196035 () Bool)

(assert (=> b!1305427 m!1196035))

(declare-fun m!1196037 () Bool)

(assert (=> b!1305418 m!1196037))

(assert (=> b!1305418 m!1195833))

(declare-fun m!1196039 () Bool)

(assert (=> b!1305418 m!1196039))

(assert (=> b!1305418 m!1195833))

(declare-fun m!1196041 () Bool)

(assert (=> b!1305418 m!1196041))

(declare-fun m!1196043 () Bool)

(assert (=> b!1305418 m!1196043))

(declare-fun m!1196045 () Bool)

(assert (=> b!1305418 m!1196045))

(assert (=> b!1305418 m!1196029))

(declare-fun m!1196047 () Bool)

(assert (=> b!1305418 m!1196047))

(assert (=> b!1305418 m!1196043))

(assert (=> b!1305418 m!1196037))

(assert (=> b!1305426 m!1196037))

(assert (=> b!1305426 m!1195833))

(assert (=> b!1305426 m!1196039))

(assert (=> b!1305426 m!1195833))

(assert (=> b!1305426 m!1196037))

(assert (=> b!1305426 m!1196029))

(declare-fun m!1196049 () Bool)

(assert (=> b!1305426 m!1196049))

(assert (=> b!1305426 m!1196029))

(assert (=> b!1305417 m!1196033))

(assert (=> b!1305424 m!1196029))

(assert (=> b!1305424 m!1196029))

(declare-fun m!1196051 () Bool)

(assert (=> b!1305424 m!1196051))

(declare-fun m!1196053 () Bool)

(assert (=> b!1305423 m!1196053))

(declare-fun m!1196055 () Bool)

(assert (=> d!141917 m!1196055))

(assert (=> d!141917 m!1195703))

(assert (=> b!1305270 d!141917))

(declare-fun d!141919 () Bool)

(declare-fun lt!584339 () Bool)

(declare-fun content!647 (List!29821) (InoxSet (_ BitVec 64)))

(assert (=> d!141919 (= lt!584339 (select (content!647 Nil!29818) (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!744642 () Bool)

(assert (=> d!141919 (= lt!584339 e!744642)))

(declare-fun res!866846 () Bool)

(assert (=> d!141919 (=> (not res!866846) (not e!744642))))

(assert (=> d!141919 (= res!866846 ((_ is Cons!29817) Nil!29818))))

(assert (=> d!141919 (= (contains!8277 Nil!29818 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)) lt!584339)))

(declare-fun b!1305433 () Bool)

(declare-fun e!744641 () Bool)

(assert (=> b!1305433 (= e!744642 e!744641)))

(declare-fun res!866847 () Bool)

(assert (=> b!1305433 (=> res!866847 e!744641)))

(assert (=> b!1305433 (= res!866847 (= (h!31026 Nil!29818) (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305434 () Bool)

(assert (=> b!1305434 (= e!744641 (contains!8277 (t!43415 Nil!29818) (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141919 res!866846) b!1305433))

(assert (= (and b!1305433 (not res!866847)) b!1305434))

(declare-fun m!1196057 () Bool)

(assert (=> d!141919 m!1196057))

(assert (=> d!141919 m!1195907))

(declare-fun m!1196059 () Bool)

(assert (=> d!141919 m!1196059))

(assert (=> b!1305434 m!1195907))

(declare-fun m!1196061 () Bool)

(assert (=> b!1305434 m!1196061))

(assert (=> b!1305391 d!141919))

(declare-fun b!1305443 () Bool)

(declare-fun e!744647 () Option!763)

(assert (=> b!1305443 (= e!744647 (Some!762 (_2!11369 (h!31025 (toList!10202 lt!584293)))))))

(declare-fun b!1305446 () Bool)

(declare-fun e!744648 () Option!763)

(assert (=> b!1305446 (= e!744648 None!761)))

(declare-fun b!1305444 () Bool)

(assert (=> b!1305444 (= e!744647 e!744648)))

(declare-fun c!125404 () Bool)

(assert (=> b!1305444 (= c!125404 (and ((_ is Cons!29816) (toList!10202 lt!584293)) (not (= (_1!11369 (h!31025 (toList!10202 lt!584293))) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305445 () Bool)

(assert (=> b!1305445 (= e!744648 (getValueByKey!712 (t!43414 (toList!10202 lt!584293)) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun d!141921 () Bool)

(declare-fun c!125403 () Bool)

(assert (=> d!141921 (= c!125403 (and ((_ is Cons!29816) (toList!10202 lt!584293)) (= (_1!11369 (h!31025 (toList!10202 lt!584293))) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141921 (= (getValueByKey!712 (toList!10202 lt!584293) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) e!744647)))

(assert (= (and d!141921 c!125403) b!1305443))

(assert (= (and d!141921 (not c!125403)) b!1305444))

(assert (= (and b!1305444 c!125404) b!1305445))

(assert (= (and b!1305444 (not c!125404)) b!1305446))

(declare-fun m!1196063 () Bool)

(assert (=> b!1305445 m!1196063))

(assert (=> b!1305370 d!141921))

(declare-fun d!141923 () Bool)

(assert (=> d!141923 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun lt!584342 () Unit!43067)

(declare-fun choose!1947 (List!29820 (_ BitVec 64)) Unit!43067)

(assert (=> d!141923 (= lt!584342 (choose!1947 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun e!744651 () Bool)

(assert (=> d!141923 e!744651))

(declare-fun res!866850 () Bool)

(assert (=> d!141923 (=> (not res!866850) (not e!744651))))

(declare-fun isStrictlySorted!871 (List!29820) Bool)

(assert (=> d!141923 (= res!866850 (isStrictlySorted!871 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) lt!584342)))

(declare-fun b!1305449 () Bool)

(assert (=> b!1305449 (= e!744651 (containsKey!729 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (= (and d!141923 res!866850) b!1305449))

(assert (=> d!141923 m!1195931))

(assert (=> d!141923 m!1195931))

(assert (=> d!141923 m!1195933))

(declare-fun m!1196065 () Bool)

(assert (=> d!141923 m!1196065))

(declare-fun m!1196067 () Bool)

(assert (=> d!141923 m!1196067))

(assert (=> b!1305449 m!1195927))

(assert (=> b!1305363 d!141923))

(declare-fun d!141925 () Bool)

(declare-fun isEmpty!1077 (Option!763) Bool)

(assert (=> d!141925 (= (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)) (not (isEmpty!1077 (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))))

(declare-fun bs!37158 () Bool)

(assert (= bs!37158 d!141925))

(assert (=> bs!37158 m!1195931))

(declare-fun m!1196069 () Bool)

(assert (=> bs!37158 m!1196069))

(assert (=> b!1305363 d!141925))

(declare-fun b!1305450 () Bool)

(declare-fun e!744652 () Option!763)

(assert (=> b!1305450 (= e!744652 (Some!762 (_2!11369 (h!31025 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun b!1305453 () Bool)

(declare-fun e!744653 () Option!763)

(assert (=> b!1305453 (= e!744653 None!761)))

(declare-fun b!1305451 () Bool)

(assert (=> b!1305451 (= e!744652 e!744653)))

(declare-fun c!125406 () Bool)

(assert (=> b!1305451 (= c!125406 (and ((_ is Cons!29816) (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (not (= (_1!11369 (h!31025 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205))))))

(declare-fun b!1305452 () Bool)

(assert (=> b!1305452 (= e!744653 (getValueByKey!712 (t!43414 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) k0!1205))))

(declare-fun d!141927 () Bool)

(declare-fun c!125405 () Bool)

(assert (=> d!141927 (= c!125405 (and ((_ is Cons!29816) (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (= (_1!11369 (h!31025 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(assert (=> d!141927 (= (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) e!744652)))

(assert (= (and d!141927 c!125405) b!1305450))

(assert (= (and d!141927 (not c!125405)) b!1305451))

(assert (= (and b!1305451 c!125406) b!1305452))

(assert (= (and b!1305451 (not c!125406)) b!1305453))

(declare-fun m!1196071 () Bool)

(assert (=> b!1305452 m!1196071))

(assert (=> b!1305363 d!141927))

(declare-fun d!141929 () Bool)

(assert (=> d!141929 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(declare-fun lt!584343 () Unit!43067)

(assert (=> d!141929 (= lt!584343 (choose!1947 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(declare-fun e!744654 () Bool)

(assert (=> d!141929 e!744654))

(declare-fun res!866851 () Bool)

(assert (=> d!141929 (=> (not res!866851) (not e!744654))))

(assert (=> d!141929 (= res!866851 (isStrictlySorted!871 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))))))

(assert (=> d!141929 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205) lt!584343)))

(declare-fun b!1305454 () Bool)

(assert (=> b!1305454 (= e!744654 (containsKey!729 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(assert (= (and d!141929 res!866851) b!1305454))

(assert (=> d!141929 m!1195971))

(assert (=> d!141929 m!1195971))

(assert (=> d!141929 m!1195973))

(declare-fun m!1196073 () Bool)

(assert (=> d!141929 m!1196073))

(declare-fun m!1196075 () Bool)

(assert (=> d!141929 m!1196075))

(assert (=> b!1305454 m!1195967))

(assert (=> b!1305374 d!141929))

(declare-fun d!141931 () Bool)

(assert (=> d!141931 (= (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205)) (not (isEmpty!1077 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205))))))

(declare-fun bs!37159 () Bool)

(assert (= bs!37159 d!141931))

(assert (=> bs!37159 m!1195971))

(declare-fun m!1196077 () Bool)

(assert (=> bs!37159 m!1196077))

(assert (=> b!1305374 d!141931))

(declare-fun b!1305455 () Bool)

(declare-fun e!744655 () Option!763)

(assert (=> b!1305455 (= e!744655 (Some!762 (_2!11369 (h!31025 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))))))))

(declare-fun b!1305458 () Bool)

(declare-fun e!744656 () Option!763)

(assert (=> b!1305458 (= e!744656 None!761)))

(declare-fun b!1305456 () Bool)

(assert (=> b!1305456 (= e!744655 e!744656)))

(declare-fun c!125408 () Bool)

(assert (=> b!1305456 (= c!125408 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))) (not (= (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))) k0!1205))))))

(declare-fun b!1305457 () Bool)

(assert (=> b!1305457 (= e!744656 (getValueByKey!712 (t!43414 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))) k0!1205))))

(declare-fun c!125407 () Bool)

(declare-fun d!141933 () Bool)

(assert (=> d!141933 (= c!125407 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))) (= (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))) k0!1205)))))

(assert (=> d!141933 (= (getValueByKey!712 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205) e!744655)))

(assert (= (and d!141933 c!125407) b!1305455))

(assert (= (and d!141933 (not c!125407)) b!1305456))

(assert (= (and b!1305456 c!125408) b!1305457))

(assert (= (and b!1305456 (not c!125408)) b!1305458))

(declare-fun m!1196079 () Bool)

(assert (=> b!1305457 m!1196079))

(assert (=> b!1305374 d!141933))

(declare-fun d!141935 () Bool)

(declare-fun e!744658 () Bool)

(assert (=> d!141935 e!744658))

(declare-fun res!866852 () Bool)

(assert (=> d!141935 (=> res!866852 e!744658)))

(declare-fun lt!584345 () Bool)

(assert (=> d!141935 (= res!866852 (not lt!584345))))

(declare-fun lt!584347 () Bool)

(assert (=> d!141935 (= lt!584345 lt!584347)))

(declare-fun lt!584346 () Unit!43067)

(declare-fun e!744657 () Unit!43067)

(assert (=> d!141935 (= lt!584346 e!744657)))

(declare-fun c!125409 () Bool)

(assert (=> d!141935 (= c!125409 lt!584347)))

(assert (=> d!141935 (= lt!584347 (containsKey!729 (toList!10202 lt!584264) (select (arr!41895 _keys!1741) from!2144)))))

(assert (=> d!141935 (= (contains!8274 lt!584264 (select (arr!41895 _keys!1741) from!2144)) lt!584345)))

(declare-fun b!1305459 () Bool)

(declare-fun lt!584344 () Unit!43067)

(assert (=> b!1305459 (= e!744657 lt!584344)))

(assert (=> b!1305459 (= lt!584344 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584264) (select (arr!41895 _keys!1741) from!2144)))))

(assert (=> b!1305459 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584264) (select (arr!41895 _keys!1741) from!2144)))))

(declare-fun b!1305460 () Bool)

(declare-fun Unit!43083 () Unit!43067)

(assert (=> b!1305460 (= e!744657 Unit!43083)))

(declare-fun b!1305461 () Bool)

(assert (=> b!1305461 (= e!744658 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584264) (select (arr!41895 _keys!1741) from!2144))))))

(assert (= (and d!141935 c!125409) b!1305459))

(assert (= (and d!141935 (not c!125409)) b!1305460))

(assert (= (and d!141935 (not res!866852)) b!1305461))

(assert (=> d!141935 m!1195681))

(declare-fun m!1196081 () Bool)

(assert (=> d!141935 m!1196081))

(assert (=> b!1305459 m!1195681))

(declare-fun m!1196083 () Bool)

(assert (=> b!1305459 m!1196083))

(assert (=> b!1305459 m!1195681))

(declare-fun m!1196085 () Bool)

(assert (=> b!1305459 m!1196085))

(assert (=> b!1305459 m!1196085))

(declare-fun m!1196087 () Bool)

(assert (=> b!1305459 m!1196087))

(assert (=> b!1305461 m!1195681))

(assert (=> b!1305461 m!1196085))

(assert (=> b!1305461 m!1196085))

(assert (=> b!1305461 m!1196087))

(assert (=> b!1305341 d!141935))

(declare-fun d!141937 () Bool)

(declare-fun e!744660 () Bool)

(assert (=> d!141937 e!744660))

(declare-fun res!866853 () Bool)

(assert (=> d!141937 (=> res!866853 e!744660)))

(declare-fun lt!584349 () Bool)

(assert (=> d!141937 (= res!866853 (not lt!584349))))

(declare-fun lt!584351 () Bool)

(assert (=> d!141937 (= lt!584349 lt!584351)))

(declare-fun lt!584350 () Unit!43067)

(declare-fun e!744659 () Unit!43067)

(assert (=> d!141937 (= lt!584350 e!744659)))

(declare-fun c!125410 () Bool)

(assert (=> d!141937 (= c!125410 lt!584351)))

(assert (=> d!141937 (= lt!584351 (containsKey!729 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141937 (= (contains!8274 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!584349)))

(declare-fun b!1305462 () Bool)

(declare-fun lt!584348 () Unit!43067)

(assert (=> b!1305462 (= e!744659 lt!584348)))

(assert (=> b!1305462 (= lt!584348 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1305462 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1305463 () Bool)

(declare-fun Unit!43084 () Unit!43067)

(assert (=> b!1305463 (= e!744659 Unit!43084)))

(declare-fun b!1305464 () Bool)

(assert (=> b!1305464 (= e!744660 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141937 c!125410) b!1305462))

(assert (= (and d!141937 (not c!125410)) b!1305463))

(assert (= (and d!141937 (not res!866853)) b!1305464))

(declare-fun m!1196089 () Bool)

(assert (=> d!141937 m!1196089))

(declare-fun m!1196091 () Bool)

(assert (=> b!1305462 m!1196091))

(declare-fun m!1196093 () Bool)

(assert (=> b!1305462 m!1196093))

(assert (=> b!1305462 m!1196093))

(declare-fun m!1196095 () Bool)

(assert (=> b!1305462 m!1196095))

(assert (=> b!1305464 m!1196093))

(assert (=> b!1305464 m!1196093))

(assert (=> b!1305464 m!1196095))

(assert (=> d!141879 d!141937))

(declare-fun d!141939 () Bool)

(declare-fun e!744661 () Bool)

(assert (=> d!141939 e!744661))

(declare-fun res!866854 () Bool)

(assert (=> d!141939 (=> (not res!866854) (not e!744661))))

(declare-fun lt!584353 () ListLongMap!20373)

(assert (=> d!141939 (= res!866854 (contains!8274 lt!584353 (_1!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!584355 () List!29820)

(assert (=> d!141939 (= lt!584353 (ListLongMap!20374 lt!584355))))

(declare-fun lt!584352 () Unit!43067)

(declare-fun lt!584354 () Unit!43067)

(assert (=> d!141939 (= lt!584352 lt!584354)))

(assert (=> d!141939 (= (getValueByKey!712 lt!584355 (_1!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!762 (_2!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141939 (= lt!584354 (lemmaContainsTupThenGetReturnValue!356 lt!584355 (_1!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141939 (= lt!584355 (insertStrictlySorted!485 (toList!10202 lt!584061) (_1!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141939 (= (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!584353)))

(declare-fun b!1305465 () Bool)

(declare-fun res!866855 () Bool)

(assert (=> b!1305465 (=> (not res!866855) (not e!744661))))

(assert (=> b!1305465 (= res!866855 (= (getValueByKey!712 (toList!10202 lt!584353) (_1!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!762 (_2!11369 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1305466 () Bool)

(assert (=> b!1305466 (= e!744661 (contains!8276 (toList!10202 lt!584353) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141939 res!866854) b!1305465))

(assert (= (and b!1305465 res!866855) b!1305466))

(declare-fun m!1196097 () Bool)

(assert (=> d!141939 m!1196097))

(declare-fun m!1196099 () Bool)

(assert (=> d!141939 m!1196099))

(declare-fun m!1196101 () Bool)

(assert (=> d!141939 m!1196101))

(declare-fun m!1196103 () Bool)

(assert (=> d!141939 m!1196103))

(declare-fun m!1196105 () Bool)

(assert (=> b!1305465 m!1196105))

(declare-fun m!1196107 () Bool)

(assert (=> b!1305466 m!1196107))

(assert (=> d!141879 d!141939))

(declare-fun d!141941 () Bool)

(assert (=> d!141941 (not (contains!8274 (+!4523 lt!584061 (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(assert (=> d!141941 true))

(declare-fun _$36!381 () Unit!43067)

(assert (=> d!141941 (= (choose!1944 lt!584061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) _$36!381)))

(declare-fun bs!37160 () Bool)

(assert (= bs!37160 d!141941))

(assert (=> bs!37160 m!1195919))

(assert (=> bs!37160 m!1195919))

(assert (=> bs!37160 m!1195921))

(assert (=> d!141879 d!141941))

(declare-fun d!141943 () Bool)

(declare-fun e!744663 () Bool)

(assert (=> d!141943 e!744663))

(declare-fun res!866856 () Bool)

(assert (=> d!141943 (=> res!866856 e!744663)))

(declare-fun lt!584357 () Bool)

(assert (=> d!141943 (= res!866856 (not lt!584357))))

(declare-fun lt!584359 () Bool)

(assert (=> d!141943 (= lt!584357 lt!584359)))

(declare-fun lt!584358 () Unit!43067)

(declare-fun e!744662 () Unit!43067)

(assert (=> d!141943 (= lt!584358 e!744662)))

(declare-fun c!125411 () Bool)

(assert (=> d!141943 (= c!125411 lt!584359)))

(assert (=> d!141943 (= lt!584359 (containsKey!729 (toList!10202 lt!584061) k0!1205))))

(assert (=> d!141943 (= (contains!8274 lt!584061 k0!1205) lt!584357)))

(declare-fun b!1305468 () Bool)

(declare-fun lt!584356 () Unit!43067)

(assert (=> b!1305468 (= e!744662 lt!584356)))

(assert (=> b!1305468 (= lt!584356 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584061) k0!1205))))

(assert (=> b!1305468 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584061) k0!1205))))

(declare-fun b!1305469 () Bool)

(declare-fun Unit!43085 () Unit!43067)

(assert (=> b!1305469 (= e!744662 Unit!43085)))

(declare-fun b!1305470 () Bool)

(assert (=> b!1305470 (= e!744663 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584061) k0!1205)))))

(assert (= (and d!141943 c!125411) b!1305468))

(assert (= (and d!141943 (not c!125411)) b!1305469))

(assert (= (and d!141943 (not res!866856)) b!1305470))

(declare-fun m!1196109 () Bool)

(assert (=> d!141943 m!1196109))

(declare-fun m!1196111 () Bool)

(assert (=> b!1305468 m!1196111))

(declare-fun m!1196113 () Bool)

(assert (=> b!1305468 m!1196113))

(assert (=> b!1305468 m!1196113))

(declare-fun m!1196115 () Bool)

(assert (=> b!1305468 m!1196115))

(assert (=> b!1305470 m!1196113))

(assert (=> b!1305470 m!1196113))

(assert (=> b!1305470 m!1196115))

(assert (=> d!141879 d!141943))

(declare-fun d!141945 () Bool)

(declare-fun e!744665 () Bool)

(assert (=> d!141945 e!744665))

(declare-fun res!866857 () Bool)

(assert (=> d!141945 (=> res!866857 e!744665)))

(declare-fun lt!584361 () Bool)

(assert (=> d!141945 (= res!866857 (not lt!584361))))

(declare-fun lt!584363 () Bool)

(assert (=> d!141945 (= lt!584361 lt!584363)))

(declare-fun lt!584362 () Unit!43067)

(declare-fun e!744664 () Unit!43067)

(assert (=> d!141945 (= lt!584362 e!744664)))

(declare-fun c!125412 () Bool)

(assert (=> d!141945 (= c!125412 lt!584363)))

(assert (=> d!141945 (= lt!584363 (containsKey!729 (toList!10202 lt!584264) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141945 (= (contains!8274 lt!584264 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584361)))

(declare-fun b!1305471 () Bool)

(declare-fun lt!584360 () Unit!43067)

(assert (=> b!1305471 (= e!744664 lt!584360)))

(assert (=> b!1305471 (= lt!584360 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584264) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305471 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584264) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305472 () Bool)

(declare-fun Unit!43086 () Unit!43067)

(assert (=> b!1305472 (= e!744664 Unit!43086)))

(declare-fun b!1305473 () Bool)

(assert (=> b!1305473 (= e!744665 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584264) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141945 c!125412) b!1305471))

(assert (= (and d!141945 (not c!125412)) b!1305472))

(assert (= (and d!141945 (not res!866857)) b!1305473))

(declare-fun m!1196117 () Bool)

(assert (=> d!141945 m!1196117))

(declare-fun m!1196119 () Bool)

(assert (=> b!1305471 m!1196119))

(declare-fun m!1196121 () Bool)

(assert (=> b!1305471 m!1196121))

(assert (=> b!1305471 m!1196121))

(declare-fun m!1196123 () Bool)

(assert (=> b!1305471 m!1196123))

(assert (=> b!1305473 m!1196121))

(assert (=> b!1305473 m!1196121))

(assert (=> b!1305473 m!1196123))

(assert (=> bm!64439 d!141945))

(assert (=> b!1305365 d!141925))

(assert (=> b!1305365 d!141927))

(assert (=> b!1305376 d!141931))

(assert (=> b!1305376 d!141933))

(declare-fun d!141947 () Bool)

(declare-fun res!866858 () Bool)

(declare-fun e!744666 () Bool)

(assert (=> d!141947 (=> res!866858 e!744666)))

(assert (=> d!141947 (= res!866858 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(assert (=> d!141947 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!744666)))

(declare-fun b!1305474 () Bool)

(declare-fun e!744667 () Bool)

(declare-fun e!744668 () Bool)

(assert (=> b!1305474 (= e!744667 e!744668)))

(declare-fun lt!584365 () (_ BitVec 64))

(assert (=> b!1305474 (= lt!584365 (select (arr!41895 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!584364 () Unit!43067)

(assert (=> b!1305474 (= lt!584364 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1305474 (arrayContainsKey!0 _keys!1741 lt!584365 #b00000000000000000000000000000000)))

(declare-fun lt!584366 () Unit!43067)

(assert (=> b!1305474 (= lt!584366 lt!584364)))

(declare-fun res!866859 () Bool)

(assert (=> b!1305474 (= res!866859 (= (seekEntryOrOpen!0 (select (arr!41895 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10028 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1305474 (=> (not res!866859) (not e!744668))))

(declare-fun bm!64450 () Bool)

(declare-fun call!64453 () Bool)

(assert (=> bm!64450 (= call!64453 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305475 () Bool)

(assert (=> b!1305475 (= e!744668 call!64453)))

(declare-fun b!1305476 () Bool)

(assert (=> b!1305476 (= e!744667 call!64453)))

(declare-fun b!1305477 () Bool)

(assert (=> b!1305477 (= e!744666 e!744667)))

(declare-fun c!125413 () Bool)

(assert (=> b!1305477 (= c!125413 (validKeyInArray!0 (select (arr!41895 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!141947 (not res!866858)) b!1305477))

(assert (= (and b!1305477 c!125413) b!1305474))

(assert (= (and b!1305477 (not c!125413)) b!1305476))

(assert (= (and b!1305474 res!866859) b!1305475))

(assert (= (or b!1305475 b!1305476) bm!64450))

(declare-fun m!1196125 () Bool)

(assert (=> b!1305474 m!1196125))

(declare-fun m!1196127 () Bool)

(assert (=> b!1305474 m!1196127))

(declare-fun m!1196129 () Bool)

(assert (=> b!1305474 m!1196129))

(assert (=> b!1305474 m!1196125))

(declare-fun m!1196131 () Bool)

(assert (=> b!1305474 m!1196131))

(declare-fun m!1196133 () Bool)

(assert (=> bm!64450 m!1196133))

(assert (=> b!1305477 m!1196125))

(assert (=> b!1305477 m!1196125))

(declare-fun m!1196135 () Bool)

(assert (=> b!1305477 m!1196135))

(assert (=> bm!64445 d!141947))

(declare-fun d!141949 () Bool)

(assert (=> d!141949 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205))))

(declare-fun lt!584367 () Unit!43067)

(assert (=> d!141949 (= lt!584367 (choose!1947 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205))))

(declare-fun e!744669 () Bool)

(assert (=> d!141949 e!744669))

(declare-fun res!866860 () Bool)

(assert (=> d!141949 (=> (not res!866860) (not e!744669))))

(assert (=> d!141949 (= res!866860 (isStrictlySorted!871 (toList!10202 (ite c!125329 lt!584061 call!64344))))))

(assert (=> d!141949 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205) lt!584367)))

(declare-fun b!1305478 () Bool)

(assert (=> b!1305478 (= e!744669 (containsKey!729 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205))))

(assert (= (and d!141949 res!866860) b!1305478))

(assert (=> d!141949 m!1195823))

(assert (=> d!141949 m!1195823))

(assert (=> d!141949 m!1195825))

(declare-fun m!1196137 () Bool)

(assert (=> d!141949 m!1196137))

(declare-fun m!1196139 () Bool)

(assert (=> d!141949 m!1196139))

(assert (=> b!1305478 m!1195819))

(assert (=> b!1305243 d!141949))

(declare-fun d!141951 () Bool)

(assert (=> d!141951 (= (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205)) (not (isEmpty!1077 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205))))))

(declare-fun bs!37161 () Bool)

(assert (= bs!37161 d!141951))

(assert (=> bs!37161 m!1195823))

(declare-fun m!1196141 () Bool)

(assert (=> bs!37161 m!1196141))

(assert (=> b!1305243 d!141951))

(declare-fun e!744670 () Option!763)

(declare-fun b!1305479 () Bool)

(assert (=> b!1305479 (= e!744670 (Some!762 (_2!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 call!64344))))))))

(declare-fun b!1305482 () Bool)

(declare-fun e!744671 () Option!763)

(assert (=> b!1305482 (= e!744671 None!761)))

(declare-fun b!1305480 () Bool)

(assert (=> b!1305480 (= e!744670 e!744671)))

(declare-fun c!125415 () Bool)

(assert (=> b!1305480 (= c!125415 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 call!64344))) (not (= (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 call!64344)))) k0!1205))))))

(declare-fun b!1305481 () Bool)

(assert (=> b!1305481 (= e!744671 (getValueByKey!712 (t!43414 (toList!10202 (ite c!125329 lt!584061 call!64344))) k0!1205))))

(declare-fun c!125414 () Bool)

(declare-fun d!141953 () Bool)

(assert (=> d!141953 (= c!125414 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 call!64344))) (= (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 call!64344)))) k0!1205)))))

(assert (=> d!141953 (= (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205) e!744670)))

(assert (= (and d!141953 c!125414) b!1305479))

(assert (= (and d!141953 (not c!125414)) b!1305480))

(assert (= (and b!1305480 c!125415) b!1305481))

(assert (= (and b!1305480 (not c!125415)) b!1305482))

(declare-fun m!1196143 () Bool)

(assert (=> b!1305481 m!1196143))

(assert (=> b!1305243 d!141953))

(assert (=> d!141885 d!141943))

(declare-fun d!141955 () Bool)

(assert (=> d!141955 (contains!8274 lt!584061 k0!1205)))

(assert (=> d!141955 true))

(declare-fun _$21!125 () Unit!43067)

(assert (=> d!141955 (= (choose!1945 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584061) _$21!125)))

(declare-fun bs!37162 () Bool)

(assert (= bs!37162 d!141955))

(assert (=> bs!37162 m!1195925))

(assert (=> d!141885 d!141955))

(assert (=> d!141885 d!141937))

(assert (=> d!141885 d!141939))

(assert (=> b!1305245 d!141951))

(assert (=> b!1305245 d!141953))

(declare-fun d!141957 () Bool)

(declare-fun e!744673 () Bool)

(assert (=> d!141957 e!744673))

(declare-fun res!866861 () Bool)

(assert (=> d!141957 (=> res!866861 e!744673)))

(declare-fun lt!584369 () Bool)

(assert (=> d!141957 (= res!866861 (not lt!584369))))

(declare-fun lt!584371 () Bool)

(assert (=> d!141957 (= lt!584369 lt!584371)))

(declare-fun lt!584370 () Unit!43067)

(declare-fun e!744672 () Unit!43067)

(assert (=> d!141957 (= lt!584370 e!744672)))

(declare-fun c!125416 () Bool)

(assert (=> d!141957 (= c!125416 lt!584371)))

(assert (=> d!141957 (= lt!584371 (containsKey!729 (toList!10202 lt!584194) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141957 (= (contains!8274 lt!584194 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584369)))

(declare-fun b!1305483 () Bool)

(declare-fun lt!584368 () Unit!43067)

(assert (=> b!1305483 (= e!744672 lt!584368)))

(assert (=> b!1305483 (= lt!584368 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584194) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305483 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584194) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305484 () Bool)

(declare-fun Unit!43087 () Unit!43067)

(assert (=> b!1305484 (= e!744672 Unit!43087)))

(declare-fun b!1305485 () Bool)

(assert (=> b!1305485 (= e!744673 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141957 c!125416) b!1305483))

(assert (= (and d!141957 (not c!125416)) b!1305484))

(assert (= (and d!141957 (not res!866861)) b!1305485))

(declare-fun m!1196145 () Bool)

(assert (=> d!141957 m!1196145))

(declare-fun m!1196147 () Bool)

(assert (=> b!1305483 m!1196147))

(declare-fun m!1196149 () Bool)

(assert (=> b!1305483 m!1196149))

(assert (=> b!1305483 m!1196149))

(declare-fun m!1196151 () Bool)

(assert (=> b!1305483 m!1196151))

(assert (=> b!1305485 m!1196149))

(assert (=> b!1305485 m!1196149))

(assert (=> b!1305485 m!1196151))

(assert (=> b!1305280 d!141957))

(declare-fun d!141959 () Bool)

(declare-fun e!744674 () Bool)

(assert (=> d!141959 e!744674))

(declare-fun res!866862 () Bool)

(assert (=> d!141959 (=> (not res!866862) (not e!744674))))

(declare-fun lt!584373 () ListLongMap!20373)

(assert (=> d!141959 (= res!866862 (contains!8274 lt!584373 (_1!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584375 () List!29820)

(assert (=> d!141959 (= lt!584373 (ListLongMap!20374 lt!584375))))

(declare-fun lt!584372 () Unit!43067)

(declare-fun lt!584374 () Unit!43067)

(assert (=> d!141959 (= lt!584372 lt!584374)))

(assert (=> d!141959 (= (getValueByKey!712 lt!584375 (_1!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!762 (_2!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141959 (= lt!584374 (lemmaContainsTupThenGetReturnValue!356 lt!584375 (_1!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141959 (= lt!584375 (insertStrictlySorted!485 (toList!10202 (ite c!125383 call!64441 (ite c!125378 call!64440 call!64443))) (_1!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141959 (= (+!4523 (ite c!125383 call!64441 (ite c!125378 call!64440 call!64443)) (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584373)))

(declare-fun b!1305486 () Bool)

(declare-fun res!866863 () Bool)

(assert (=> b!1305486 (=> (not res!866863) (not e!744674))))

(assert (=> b!1305486 (= res!866863 (= (getValueByKey!712 (toList!10202 lt!584373) (_1!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!762 (_2!11369 (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305487 () Bool)

(assert (=> b!1305487 (= e!744674 (contains!8276 (toList!10202 lt!584373) (ite (or c!125383 c!125378) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141959 res!866862) b!1305486))

(assert (= (and b!1305486 res!866863) b!1305487))

(declare-fun m!1196153 () Bool)

(assert (=> d!141959 m!1196153))

(declare-fun m!1196155 () Bool)

(assert (=> d!141959 m!1196155))

(declare-fun m!1196157 () Bool)

(assert (=> d!141959 m!1196157))

(declare-fun m!1196159 () Bool)

(assert (=> d!141959 m!1196159))

(declare-fun m!1196161 () Bool)

(assert (=> b!1305486 m!1196161))

(declare-fun m!1196163 () Bool)

(assert (=> b!1305487 m!1196163))

(assert (=> bm!64436 d!141959))

(declare-fun d!141961 () Bool)

(declare-fun e!744675 () Bool)

(assert (=> d!141961 e!744675))

(declare-fun res!866864 () Bool)

(assert (=> d!141961 (=> (not res!866864) (not e!744675))))

(declare-fun lt!584377 () ListLongMap!20373)

(assert (=> d!141961 (= res!866864 (contains!8274 lt!584377 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584379 () List!29820)

(assert (=> d!141961 (= lt!584377 (ListLongMap!20374 lt!584379))))

(declare-fun lt!584376 () Unit!43067)

(declare-fun lt!584378 () Unit!43067)

(assert (=> d!141961 (= lt!584376 lt!584378)))

(assert (=> d!141961 (= (getValueByKey!712 lt!584379 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141961 (= lt!584378 (lemmaContainsTupThenGetReturnValue!356 lt!584379 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141961 (= lt!584379 (insertStrictlySorted!485 (toList!10202 call!64442) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141961 (= (+!4523 call!64442 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584377)))

(declare-fun b!1305488 () Bool)

(declare-fun res!866865 () Bool)

(assert (=> b!1305488 (=> (not res!866865) (not e!744675))))

(assert (=> b!1305488 (= res!866865 (= (getValueByKey!712 (toList!10202 lt!584377) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305489 () Bool)

(assert (=> b!1305489 (= e!744675 (contains!8276 (toList!10202 lt!584377) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141961 res!866864) b!1305488))

(assert (= (and b!1305488 res!866865) b!1305489))

(declare-fun m!1196165 () Bool)

(assert (=> d!141961 m!1196165))

(declare-fun m!1196167 () Bool)

(assert (=> d!141961 m!1196167))

(declare-fun m!1196169 () Bool)

(assert (=> d!141961 m!1196169))

(declare-fun m!1196171 () Bool)

(assert (=> d!141961 m!1196171))

(declare-fun m!1196173 () Bool)

(assert (=> b!1305488 m!1196173))

(declare-fun m!1196175 () Bool)

(assert (=> b!1305489 m!1196175))

(assert (=> b!1305348 d!141961))

(assert (=> bm!64421 d!141917))

(assert (=> d!141901 d!141899))

(declare-fun d!141963 () Bool)

(assert (=> d!141963 (not (contains!8274 (ListLongMap!20374 Nil!29817) k0!1205))))

(assert (=> d!141963 true))

(declare-fun _$29!204 () Unit!43067)

(assert (=> d!141963 (= (choose!1946 k0!1205) _$29!204)))

(declare-fun bs!37163 () Bool)

(assert (= bs!37163 d!141963))

(assert (=> bs!37163 m!1195687))

(assert (=> d!141901 d!141963))

(declare-fun d!141965 () Bool)

(declare-fun isEmpty!1078 (List!29820) Bool)

(assert (=> d!141965 (= (isEmpty!1076 lt!584194) (isEmpty!1078 (toList!10202 lt!584194)))))

(declare-fun bs!37164 () Bool)

(assert (= bs!37164 d!141965))

(declare-fun m!1196177 () Bool)

(assert (=> bs!37164 m!1196177))

(assert (=> b!1305276 d!141965))

(assert (=> bm!64440 d!141871))

(declare-fun b!1305490 () Bool)

(declare-fun e!744676 () Option!763)

(assert (=> b!1305490 (= e!744676 (Some!762 (_2!11369 (h!31025 (toList!10202 lt!584301)))))))

(declare-fun b!1305493 () Bool)

(declare-fun e!744677 () Option!763)

(assert (=> b!1305493 (= e!744677 None!761)))

(declare-fun b!1305491 () Bool)

(assert (=> b!1305491 (= e!744676 e!744677)))

(declare-fun c!125418 () Bool)

(assert (=> b!1305491 (= c!125418 (and ((_ is Cons!29816) (toList!10202 lt!584301)) (not (= (_1!11369 (h!31025 (toList!10202 lt!584301))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun b!1305492 () Bool)

(assert (=> b!1305492 (= e!744677 (getValueByKey!712 (t!43414 (toList!10202 lt!584301)) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun d!141967 () Bool)

(declare-fun c!125417 () Bool)

(assert (=> d!141967 (= c!125417 (and ((_ is Cons!29816) (toList!10202 lt!584301)) (= (_1!11369 (h!31025 (toList!10202 lt!584301))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> d!141967 (= (getValueByKey!712 (toList!10202 lt!584301) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) e!744676)))

(assert (= (and d!141967 c!125417) b!1305490))

(assert (= (and d!141967 (not c!125417)) b!1305491))

(assert (= (and b!1305491 c!125418) b!1305492))

(assert (= (and b!1305491 (not c!125418)) b!1305493))

(declare-fun m!1196179 () Bool)

(assert (=> b!1305492 m!1196179))

(assert (=> b!1305372 d!141967))

(assert (=> b!1305332 d!141867))

(declare-fun d!141969 () Bool)

(declare-fun res!866866 () Bool)

(declare-fun e!744678 () Bool)

(assert (=> d!141969 (=> res!866866 e!744678)))

(assert (=> d!141969 (= res!866866 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(assert (=> d!141969 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125392 (Cons!29817 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) Nil!29818) Nil!29818)) e!744678)))

(declare-fun b!1305494 () Bool)

(declare-fun e!744681 () Bool)

(assert (=> b!1305494 (= e!744678 e!744681)))

(declare-fun res!866867 () Bool)

(assert (=> b!1305494 (=> (not res!866867) (not e!744681))))

(declare-fun e!744680 () Bool)

(assert (=> b!1305494 (= res!866867 (not e!744680))))

(declare-fun res!866868 () Bool)

(assert (=> b!1305494 (=> (not res!866868) (not e!744680))))

(assert (=> b!1305494 (= res!866868 (validKeyInArray!0 (select (arr!41895 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1305495 () Bool)

(assert (=> b!1305495 (= e!744680 (contains!8277 (ite c!125392 (Cons!29817 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) Nil!29818) Nil!29818) (select (arr!41895 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!64454 () Bool)

(declare-fun c!125419 () Bool)

(declare-fun bm!64451 () Bool)

(assert (=> bm!64451 (= call!64454 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125419 (Cons!29817 (select (arr!41895 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125392 (Cons!29817 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) Nil!29818) Nil!29818)) (ite c!125392 (Cons!29817 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) Nil!29818) Nil!29818))))))

(declare-fun b!1305496 () Bool)

(declare-fun e!744679 () Bool)

(assert (=> b!1305496 (= e!744681 e!744679)))

(assert (=> b!1305496 (= c!125419 (validKeyInArray!0 (select (arr!41895 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1305497 () Bool)

(assert (=> b!1305497 (= e!744679 call!64454)))

(declare-fun b!1305498 () Bool)

(assert (=> b!1305498 (= e!744679 call!64454)))

(assert (= (and d!141969 (not res!866866)) b!1305494))

(assert (= (and b!1305494 res!866868) b!1305495))

(assert (= (and b!1305494 res!866867) b!1305496))

(assert (= (and b!1305496 c!125419) b!1305498))

(assert (= (and b!1305496 (not c!125419)) b!1305497))

(assert (= (or b!1305498 b!1305497) bm!64451))

(assert (=> b!1305494 m!1196125))

(assert (=> b!1305494 m!1196125))

(assert (=> b!1305494 m!1196135))

(assert (=> b!1305495 m!1196125))

(assert (=> b!1305495 m!1196125))

(declare-fun m!1196181 () Bool)

(assert (=> b!1305495 m!1196181))

(assert (=> bm!64451 m!1196125))

(declare-fun m!1196183 () Bool)

(assert (=> bm!64451 m!1196183))

(assert (=> b!1305496 m!1196125))

(assert (=> b!1305496 m!1196125))

(assert (=> b!1305496 m!1196135))

(assert (=> bm!64448 d!141969))

(declare-fun d!141971 () Bool)

(declare-fun e!744682 () Bool)

(assert (=> d!141971 e!744682))

(declare-fun res!866869 () Bool)

(assert (=> d!141971 (=> (not res!866869) (not e!744682))))

(declare-fun lt!584381 () ListLongMap!20373)

(assert (=> d!141971 (= res!866869 (contains!8274 lt!584381 (_1!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!584383 () List!29820)

(assert (=> d!141971 (= lt!584381 (ListLongMap!20374 lt!584383))))

(declare-fun lt!584380 () Unit!43067)

(declare-fun lt!584382 () Unit!43067)

(assert (=> d!141971 (= lt!584380 lt!584382)))

(assert (=> d!141971 (= (getValueByKey!712 lt!584383 (_1!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!762 (_2!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141971 (= lt!584382 (lemmaContainsTupThenGetReturnValue!356 lt!584383 (_1!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141971 (= lt!584383 (insertStrictlySorted!485 (toList!10202 call!64424) (_1!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141971 (= (+!4523 call!64424 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!584381)))

(declare-fun b!1305499 () Bool)

(declare-fun res!866870 () Bool)

(assert (=> b!1305499 (=> (not res!866870) (not e!744682))))

(assert (=> b!1305499 (= res!866870 (= (getValueByKey!712 (toList!10202 lt!584381) (_1!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!762 (_2!11369 (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1305500 () Bool)

(assert (=> b!1305500 (= e!744682 (contains!8276 (toList!10202 lt!584381) (tuple2!22717 (select (arr!41895 _keys!1741) from!2144) (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141971 res!866869) b!1305499))

(assert (= (and b!1305499 res!866870) b!1305500))

(declare-fun m!1196185 () Bool)

(assert (=> d!141971 m!1196185))

(declare-fun m!1196187 () Bool)

(assert (=> d!141971 m!1196187))

(declare-fun m!1196189 () Bool)

(assert (=> d!141971 m!1196189))

(declare-fun m!1196191 () Bool)

(assert (=> d!141971 m!1196191))

(declare-fun m!1196193 () Bool)

(assert (=> b!1305499 m!1196193))

(declare-fun m!1196195 () Bool)

(assert (=> b!1305500 m!1196195))

(assert (=> b!1305271 d!141971))

(declare-fun d!141973 () Bool)

(declare-fun e!744684 () Bool)

(assert (=> d!141973 e!744684))

(declare-fun res!866871 () Bool)

(assert (=> d!141973 (=> res!866871 e!744684)))

(declare-fun lt!584385 () Bool)

(assert (=> d!141973 (= res!866871 (not lt!584385))))

(declare-fun lt!584387 () Bool)

(assert (=> d!141973 (= lt!584385 lt!584387)))

(declare-fun lt!584386 () Unit!43067)

(declare-fun e!744683 () Unit!43067)

(assert (=> d!141973 (= lt!584386 e!744683)))

(declare-fun c!125420 () Bool)

(assert (=> d!141973 (= c!125420 lt!584387)))

(assert (=> d!141973 (= lt!584387 (containsKey!729 (toList!10202 (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197))) lt!584199))))

(assert (=> d!141973 (= (contains!8274 (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197)) lt!584199) lt!584385)))

(declare-fun b!1305501 () Bool)

(declare-fun lt!584384 () Unit!43067)

(assert (=> b!1305501 (= e!744683 lt!584384)))

(assert (=> b!1305501 (= lt!584384 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197))) lt!584199))))

(assert (=> b!1305501 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197))) lt!584199))))

(declare-fun b!1305502 () Bool)

(declare-fun Unit!43088 () Unit!43067)

(assert (=> b!1305502 (= e!744683 Unit!43088)))

(declare-fun b!1305503 () Bool)

(assert (=> b!1305503 (= e!744684 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197))) lt!584199)))))

(assert (= (and d!141973 c!125420) b!1305501))

(assert (= (and d!141973 (not c!125420)) b!1305502))

(assert (= (and d!141973 (not res!866871)) b!1305503))

(declare-fun m!1196197 () Bool)

(assert (=> d!141973 m!1196197))

(declare-fun m!1196199 () Bool)

(assert (=> b!1305501 m!1196199))

(declare-fun m!1196201 () Bool)

(assert (=> b!1305501 m!1196201))

(assert (=> b!1305501 m!1196201))

(declare-fun m!1196203 () Bool)

(assert (=> b!1305501 m!1196203))

(assert (=> b!1305503 m!1196201))

(assert (=> b!1305503 m!1196201))

(assert (=> b!1305503 m!1196203))

(assert (=> b!1305271 d!141973))

(declare-fun d!141975 () Bool)

(assert (=> d!141975 (not (contains!8274 (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197)) lt!584199))))

(declare-fun lt!584388 () Unit!43067)

(assert (=> d!141975 (= lt!584388 (choose!1944 lt!584195 lt!584198 lt!584197 lt!584199))))

(declare-fun e!744685 () Bool)

(assert (=> d!141975 e!744685))

(declare-fun res!866872 () Bool)

(assert (=> d!141975 (=> (not res!866872) (not e!744685))))

(assert (=> d!141975 (= res!866872 (not (contains!8274 lt!584195 lt!584199)))))

(assert (=> d!141975 (= (addStillNotContains!476 lt!584195 lt!584198 lt!584197 lt!584199) lt!584388)))

(declare-fun b!1305504 () Bool)

(assert (=> b!1305504 (= e!744685 (not (= lt!584198 lt!584199)))))

(assert (= (and d!141975 res!866872) b!1305504))

(assert (=> d!141975 m!1195839))

(assert (=> d!141975 m!1195839))

(assert (=> d!141975 m!1195841))

(declare-fun m!1196205 () Bool)

(assert (=> d!141975 m!1196205))

(declare-fun m!1196207 () Bool)

(assert (=> d!141975 m!1196207))

(assert (=> b!1305271 d!141975))

(declare-fun d!141977 () Bool)

(declare-fun e!744686 () Bool)

(assert (=> d!141977 e!744686))

(declare-fun res!866873 () Bool)

(assert (=> d!141977 (=> (not res!866873) (not e!744686))))

(declare-fun lt!584390 () ListLongMap!20373)

(assert (=> d!141977 (= res!866873 (contains!8274 lt!584390 (_1!11369 (tuple2!22717 lt!584198 lt!584197))))))

(declare-fun lt!584392 () List!29820)

(assert (=> d!141977 (= lt!584390 (ListLongMap!20374 lt!584392))))

(declare-fun lt!584389 () Unit!43067)

(declare-fun lt!584391 () Unit!43067)

(assert (=> d!141977 (= lt!584389 lt!584391)))

(assert (=> d!141977 (= (getValueByKey!712 lt!584392 (_1!11369 (tuple2!22717 lt!584198 lt!584197))) (Some!762 (_2!11369 (tuple2!22717 lt!584198 lt!584197))))))

(assert (=> d!141977 (= lt!584391 (lemmaContainsTupThenGetReturnValue!356 lt!584392 (_1!11369 (tuple2!22717 lt!584198 lt!584197)) (_2!11369 (tuple2!22717 lt!584198 lt!584197))))))

(assert (=> d!141977 (= lt!584392 (insertStrictlySorted!485 (toList!10202 lt!584195) (_1!11369 (tuple2!22717 lt!584198 lt!584197)) (_2!11369 (tuple2!22717 lt!584198 lt!584197))))))

(assert (=> d!141977 (= (+!4523 lt!584195 (tuple2!22717 lt!584198 lt!584197)) lt!584390)))

(declare-fun b!1305505 () Bool)

(declare-fun res!866874 () Bool)

(assert (=> b!1305505 (=> (not res!866874) (not e!744686))))

(assert (=> b!1305505 (= res!866874 (= (getValueByKey!712 (toList!10202 lt!584390) (_1!11369 (tuple2!22717 lt!584198 lt!584197))) (Some!762 (_2!11369 (tuple2!22717 lt!584198 lt!584197)))))))

(declare-fun b!1305506 () Bool)

(assert (=> b!1305506 (= e!744686 (contains!8276 (toList!10202 lt!584390) (tuple2!22717 lt!584198 lt!584197)))))

(assert (= (and d!141977 res!866873) b!1305505))

(assert (= (and b!1305505 res!866874) b!1305506))

(declare-fun m!1196209 () Bool)

(assert (=> d!141977 m!1196209))

(declare-fun m!1196211 () Bool)

(assert (=> d!141977 m!1196211))

(declare-fun m!1196213 () Bool)

(assert (=> d!141977 m!1196213))

(declare-fun m!1196215 () Bool)

(assert (=> d!141977 m!1196215))

(declare-fun m!1196217 () Bool)

(assert (=> b!1305505 m!1196217))

(declare-fun m!1196219 () Bool)

(assert (=> b!1305506 m!1196219))

(assert (=> b!1305271 d!141977))

(declare-fun d!141979 () Bool)

(declare-fun c!125423 () Bool)

(assert (=> d!141979 (= c!125423 ((_ is ValueCellFull!16574) (select (arr!41896 _values!1445) from!2144)))))

(declare-fun e!744689 () V!51697)

(assert (=> d!141979 (= (get!21188 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!744689)))

(declare-fun b!1305511 () Bool)

(declare-fun get!21190 (ValueCell!16574 V!51697) V!51697)

(assert (=> b!1305511 (= e!744689 (get!21190 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305512 () Bool)

(declare-fun get!21191 (ValueCell!16574 V!51697) V!51697)

(assert (=> b!1305512 (= e!744689 (get!21191 (select (arr!41896 _values!1445) from!2144) (dynLambda!3457 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141979 c!125423) b!1305511))

(assert (= (and d!141979 (not c!125423)) b!1305512))

(assert (=> b!1305511 m!1195831))

(assert (=> b!1305511 m!1195833))

(declare-fun m!1196221 () Bool)

(assert (=> b!1305511 m!1196221))

(assert (=> b!1305512 m!1195831))

(assert (=> b!1305512 m!1195833))

(declare-fun m!1196223 () Bool)

(assert (=> b!1305512 m!1196223))

(assert (=> b!1305271 d!141979))

(declare-fun d!141981 () Bool)

(assert (=> d!141981 (= (validKeyInArray!0 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305361 d!141981))

(assert (=> b!1305390 d!141981))

(declare-fun d!141983 () Bool)

(declare-fun res!866879 () Bool)

(declare-fun e!744694 () Bool)

(assert (=> d!141983 (=> res!866879 e!744694)))

(assert (=> d!141983 (= res!866879 (and ((_ is Cons!29816) (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11369 (h!31025 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141983 (= (containsKey!729 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744694)))

(declare-fun b!1305517 () Bool)

(declare-fun e!744695 () Bool)

(assert (=> b!1305517 (= e!744694 e!744695)))

(declare-fun res!866880 () Bool)

(assert (=> b!1305517 (=> (not res!866880) (not e!744695))))

(assert (=> b!1305517 (= res!866880 (and (or (not ((_ is Cons!29816) (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11369 (h!31025 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29816) (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11369 (h!31025 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1305518 () Bool)

(assert (=> b!1305518 (= e!744695 (containsKey!729 (t!43414 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141983 (not res!866879)) b!1305517))

(assert (= (and b!1305517 res!866880) b!1305518))

(declare-fun m!1196225 () Bool)

(assert (=> b!1305518 m!1196225))

(assert (=> d!141873 d!141983))

(declare-fun d!141985 () Bool)

(assert (=> d!141985 (arrayContainsKey!0 _keys!1741 lt!584277 #b00000000000000000000000000000000)))

(declare-fun lt!584395 () Unit!43067)

(declare-fun choose!13 (array!86815 (_ BitVec 64) (_ BitVec 32)) Unit!43067)

(assert (=> d!141985 (= lt!584395 (choose!13 _keys!1741 lt!584277 #b00000000000000000000000000000000))))

(assert (=> d!141985 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141985 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584277 #b00000000000000000000000000000000) lt!584395)))

(declare-fun bs!37165 () Bool)

(assert (= bs!37165 d!141985))

(assert (=> bs!37165 m!1195911))

(declare-fun m!1196227 () Bool)

(assert (=> bs!37165 m!1196227))

(assert (=> b!1305358 d!141985))

(declare-fun d!141987 () Bool)

(declare-fun res!866885 () Bool)

(declare-fun e!744700 () Bool)

(assert (=> d!141987 (=> res!866885 e!744700)))

(assert (=> d!141987 (= res!866885 (= (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) lt!584277))))

(assert (=> d!141987 (= (arrayContainsKey!0 _keys!1741 lt!584277 #b00000000000000000000000000000000) e!744700)))

(declare-fun b!1305523 () Bool)

(declare-fun e!744701 () Bool)

(assert (=> b!1305523 (= e!744700 e!744701)))

(declare-fun res!866886 () Bool)

(assert (=> b!1305523 (=> (not res!866886) (not e!744701))))

(assert (=> b!1305523 (= res!866886 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42447 _keys!1741)))))

(declare-fun b!1305524 () Bool)

(assert (=> b!1305524 (= e!744701 (arrayContainsKey!0 _keys!1741 lt!584277 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141987 (not res!866885)) b!1305523))

(assert (= (and b!1305523 res!866886) b!1305524))

(assert (=> d!141987 m!1195907))

(declare-fun m!1196229 () Bool)

(assert (=> b!1305524 m!1196229))

(assert (=> b!1305358 d!141987))

(declare-fun b!1305537 () Bool)

(declare-fun e!744710 () SeekEntryResult!10028)

(declare-fun lt!584404 () SeekEntryResult!10028)

(assert (=> b!1305537 (= e!744710 (MissingZero!10028 (index!42485 lt!584404)))))

(declare-fun b!1305538 () Bool)

(declare-fun e!744708 () SeekEntryResult!10028)

(declare-fun e!744709 () SeekEntryResult!10028)

(assert (=> b!1305538 (= e!744708 e!744709)))

(declare-fun lt!584403 () (_ BitVec 64))

(assert (=> b!1305538 (= lt!584403 (select (arr!41895 _keys!1741) (index!42485 lt!584404)))))

(declare-fun c!125430 () Bool)

(assert (=> b!1305538 (= c!125430 (= lt!584403 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305540 () Bool)

(declare-fun c!125432 () Bool)

(assert (=> b!1305540 (= c!125432 (= lt!584403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305540 (= e!744709 e!744710)))

(declare-fun b!1305541 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86815 (_ BitVec 32)) SeekEntryResult!10028)

(assert (=> b!1305541 (= e!744710 (seekKeyOrZeroReturnVacant!0 (x!115926 lt!584404) (index!42485 lt!584404) (index!42485 lt!584404) (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1305542 () Bool)

(assert (=> b!1305542 (= e!744709 (Found!10028 (index!42485 lt!584404)))))

(declare-fun d!141989 () Bool)

(declare-fun lt!584402 () SeekEntryResult!10028)

(assert (=> d!141989 (and (or ((_ is Undefined!10028) lt!584402) (not ((_ is Found!10028) lt!584402)) (and (bvsge (index!42484 lt!584402) #b00000000000000000000000000000000) (bvslt (index!42484 lt!584402) (size!42447 _keys!1741)))) (or ((_ is Undefined!10028) lt!584402) ((_ is Found!10028) lt!584402) (not ((_ is MissingZero!10028) lt!584402)) (and (bvsge (index!42483 lt!584402) #b00000000000000000000000000000000) (bvslt (index!42483 lt!584402) (size!42447 _keys!1741)))) (or ((_ is Undefined!10028) lt!584402) ((_ is Found!10028) lt!584402) ((_ is MissingZero!10028) lt!584402) (not ((_ is MissingVacant!10028) lt!584402)) (and (bvsge (index!42486 lt!584402) #b00000000000000000000000000000000) (bvslt (index!42486 lt!584402) (size!42447 _keys!1741)))) (or ((_ is Undefined!10028) lt!584402) (ite ((_ is Found!10028) lt!584402) (= (select (arr!41895 _keys!1741) (index!42484 lt!584402)) (select (arr!41895 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10028) lt!584402) (= (select (arr!41895 _keys!1741) (index!42483 lt!584402)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10028) lt!584402) (= (select (arr!41895 _keys!1741) (index!42486 lt!584402)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141989 (= lt!584402 e!744708)))

(declare-fun c!125431 () Bool)

(assert (=> d!141989 (= c!125431 (and ((_ is Intermediate!10028) lt!584404) (undefined!10840 lt!584404)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86815 (_ BitVec 32)) SeekEntryResult!10028)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141989 (= lt!584404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141989 (validMask!0 mask!2175)))

(assert (=> d!141989 (= (seekEntryOrOpen!0 (select (arr!41895 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!584402)))

(declare-fun b!1305539 () Bool)

(assert (=> b!1305539 (= e!744708 Undefined!10028)))

(assert (= (and d!141989 c!125431) b!1305539))

(assert (= (and d!141989 (not c!125431)) b!1305538))

(assert (= (and b!1305538 c!125430) b!1305542))

(assert (= (and b!1305538 (not c!125430)) b!1305540))

(assert (= (and b!1305540 c!125432) b!1305537))

(assert (= (and b!1305540 (not c!125432)) b!1305541))

(declare-fun m!1196231 () Bool)

(assert (=> b!1305538 m!1196231))

(assert (=> b!1305541 m!1195907))

(declare-fun m!1196233 () Bool)

(assert (=> b!1305541 m!1196233))

(assert (=> d!141989 m!1195703))

(declare-fun m!1196235 () Bool)

(assert (=> d!141989 m!1196235))

(assert (=> d!141989 m!1195907))

(declare-fun m!1196237 () Bool)

(assert (=> d!141989 m!1196237))

(declare-fun m!1196239 () Bool)

(assert (=> d!141989 m!1196239))

(declare-fun m!1196241 () Bool)

(assert (=> d!141989 m!1196241))

(assert (=> d!141989 m!1195907))

(assert (=> d!141989 m!1196235))

(declare-fun m!1196243 () Bool)

(assert (=> d!141989 m!1196243))

(assert (=> b!1305358 d!141989))

(declare-fun d!141991 () Bool)

(assert (=> d!141991 (= (isDefined!519 (getValueByKey!712 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205)) (not (isEmpty!1077 (getValueByKey!712 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205))))))

(declare-fun bs!37166 () Bool)

(assert (= bs!37166 d!141991))

(assert (=> bs!37166 m!1195979))

(declare-fun m!1196245 () Bool)

(assert (=> bs!37166 m!1196245))

(assert (=> b!1305379 d!141991))

(declare-fun b!1305543 () Bool)

(declare-fun e!744711 () Option!763)

(assert (=> b!1305543 (= e!744711 (Some!762 (_2!11369 (h!31025 (toList!10202 (ListLongMap!20374 Nil!29817))))))))

(declare-fun b!1305546 () Bool)

(declare-fun e!744712 () Option!763)

(assert (=> b!1305546 (= e!744712 None!761)))

(declare-fun b!1305544 () Bool)

(assert (=> b!1305544 (= e!744711 e!744712)))

(declare-fun c!125434 () Bool)

(assert (=> b!1305544 (= c!125434 (and ((_ is Cons!29816) (toList!10202 (ListLongMap!20374 Nil!29817))) (not (= (_1!11369 (h!31025 (toList!10202 (ListLongMap!20374 Nil!29817)))) k0!1205))))))

(declare-fun b!1305545 () Bool)

(assert (=> b!1305545 (= e!744712 (getValueByKey!712 (t!43414 (toList!10202 (ListLongMap!20374 Nil!29817))) k0!1205))))

(declare-fun d!141993 () Bool)

(declare-fun c!125433 () Bool)

(assert (=> d!141993 (= c!125433 (and ((_ is Cons!29816) (toList!10202 (ListLongMap!20374 Nil!29817))) (= (_1!11369 (h!31025 (toList!10202 (ListLongMap!20374 Nil!29817)))) k0!1205)))))

(assert (=> d!141993 (= (getValueByKey!712 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205) e!744711)))

(assert (= (and d!141993 c!125433) b!1305543))

(assert (= (and d!141993 (not c!125433)) b!1305544))

(assert (= (and b!1305544 c!125434) b!1305545))

(assert (= (and b!1305544 (not c!125434)) b!1305546))

(declare-fun m!1196247 () Bool)

(assert (=> b!1305545 m!1196247))

(assert (=> b!1305379 d!141993))

(declare-fun d!141995 () Bool)

(declare-fun res!866887 () Bool)

(declare-fun e!744713 () Bool)

(assert (=> d!141995 (=> res!866887 e!744713)))

(assert (=> d!141995 (= res!866887 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 call!64344))) (= (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 call!64344)))) k0!1205)))))

(assert (=> d!141995 (= (containsKey!729 (toList!10202 (ite c!125329 lt!584061 call!64344)) k0!1205) e!744713)))

(declare-fun b!1305547 () Bool)

(declare-fun e!744714 () Bool)

(assert (=> b!1305547 (= e!744713 e!744714)))

(declare-fun res!866888 () Bool)

(assert (=> b!1305547 (=> (not res!866888) (not e!744714))))

(assert (=> b!1305547 (= res!866888 (and (or (not ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 call!64344)))) (bvsle (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 call!64344)))) k0!1205)) ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 call!64344))) (bvslt (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 call!64344)))) k0!1205)))))

(declare-fun b!1305548 () Bool)

(assert (=> b!1305548 (= e!744714 (containsKey!729 (t!43414 (toList!10202 (ite c!125329 lt!584061 call!64344))) k0!1205))))

(assert (= (and d!141995 (not res!866887)) b!1305547))

(assert (= (and b!1305547 res!866888) b!1305548))

(declare-fun m!1196249 () Bool)

(assert (=> b!1305548 m!1196249))

(assert (=> d!141869 d!141995))

(declare-fun d!141997 () Bool)

(assert (=> d!141997 (isDefined!519 (getValueByKey!712 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205))))

(declare-fun lt!584405 () Unit!43067)

(assert (=> d!141997 (= lt!584405 (choose!1947 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205))))

(declare-fun e!744715 () Bool)

(assert (=> d!141997 e!744715))

(declare-fun res!866889 () Bool)

(assert (=> d!141997 (=> (not res!866889) (not e!744715))))

(assert (=> d!141997 (= res!866889 (isStrictlySorted!871 (toList!10202 (ListLongMap!20374 Nil!29817))))))

(assert (=> d!141997 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205) lt!584405)))

(declare-fun b!1305549 () Bool)

(assert (=> b!1305549 (= e!744715 (containsKey!729 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205))))

(assert (= (and d!141997 res!866889) b!1305549))

(assert (=> d!141997 m!1195979))

(assert (=> d!141997 m!1195979))

(assert (=> d!141997 m!1195981))

(declare-fun m!1196251 () Bool)

(assert (=> d!141997 m!1196251))

(declare-fun m!1196253 () Bool)

(assert (=> d!141997 m!1196253))

(assert (=> b!1305549 m!1195975))

(assert (=> b!1305377 d!141997))

(assert (=> b!1305377 d!141991))

(assert (=> b!1305377 d!141993))

(assert (=> d!141875 d!141891))

(declare-fun d!141999 () Bool)

(declare-fun e!744716 () Bool)

(assert (=> d!141999 e!744716))

(declare-fun res!866890 () Bool)

(assert (=> d!141999 (=> (not res!866890) (not e!744716))))

(declare-fun lt!584407 () ListLongMap!20373)

(assert (=> d!141999 (= res!866890 (contains!8274 lt!584407 (_1!11369 (tuple2!22717 lt!584265 minValue!1387))))))

(declare-fun lt!584409 () List!29820)

(assert (=> d!141999 (= lt!584407 (ListLongMap!20374 lt!584409))))

(declare-fun lt!584406 () Unit!43067)

(declare-fun lt!584408 () Unit!43067)

(assert (=> d!141999 (= lt!584406 lt!584408)))

(assert (=> d!141999 (= (getValueByKey!712 lt!584409 (_1!11369 (tuple2!22717 lt!584265 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584265 minValue!1387))))))

(assert (=> d!141999 (= lt!584408 (lemmaContainsTupThenGetReturnValue!356 lt!584409 (_1!11369 (tuple2!22717 lt!584265 minValue!1387)) (_2!11369 (tuple2!22717 lt!584265 minValue!1387))))))

(assert (=> d!141999 (= lt!584409 (insertStrictlySorted!485 (toList!10202 lt!584254) (_1!11369 (tuple2!22717 lt!584265 minValue!1387)) (_2!11369 (tuple2!22717 lt!584265 minValue!1387))))))

(assert (=> d!141999 (= (+!4523 lt!584254 (tuple2!22717 lt!584265 minValue!1387)) lt!584407)))

(declare-fun b!1305550 () Bool)

(declare-fun res!866891 () Bool)

(assert (=> b!1305550 (=> (not res!866891) (not e!744716))))

(assert (=> b!1305550 (= res!866891 (= (getValueByKey!712 (toList!10202 lt!584407) (_1!11369 (tuple2!22717 lt!584265 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584265 minValue!1387)))))))

(declare-fun b!1305551 () Bool)

(assert (=> b!1305551 (= e!744716 (contains!8276 (toList!10202 lt!584407) (tuple2!22717 lt!584265 minValue!1387)))))

(assert (= (and d!141999 res!866890) b!1305550))

(assert (= (and b!1305550 res!866891) b!1305551))

(declare-fun m!1196255 () Bool)

(assert (=> d!141999 m!1196255))

(declare-fun m!1196257 () Bool)

(assert (=> d!141999 m!1196257))

(declare-fun m!1196259 () Bool)

(assert (=> d!141999 m!1196259))

(declare-fun m!1196261 () Bool)

(assert (=> d!141999 m!1196261))

(declare-fun m!1196263 () Bool)

(assert (=> b!1305550 m!1196263))

(declare-fun m!1196265 () Bool)

(assert (=> b!1305551 m!1196265))

(assert (=> b!1305344 d!141999))

(declare-fun d!142001 () Bool)

(declare-fun e!744717 () Bool)

(assert (=> d!142001 e!744717))

(declare-fun res!866892 () Bool)

(assert (=> d!142001 (=> (not res!866892) (not e!744717))))

(declare-fun lt!584411 () ListLongMap!20373)

(assert (=> d!142001 (= res!866892 (contains!8274 lt!584411 (_1!11369 (tuple2!22717 lt!584252 zeroValue!1387))))))

(declare-fun lt!584413 () List!29820)

(assert (=> d!142001 (= lt!584411 (ListLongMap!20374 lt!584413))))

(declare-fun lt!584410 () Unit!43067)

(declare-fun lt!584412 () Unit!43067)

(assert (=> d!142001 (= lt!584410 lt!584412)))

(assert (=> d!142001 (= (getValueByKey!712 lt!584413 (_1!11369 (tuple2!22717 lt!584252 zeroValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584252 zeroValue!1387))))))

(assert (=> d!142001 (= lt!584412 (lemmaContainsTupThenGetReturnValue!356 lt!584413 (_1!11369 (tuple2!22717 lt!584252 zeroValue!1387)) (_2!11369 (tuple2!22717 lt!584252 zeroValue!1387))))))

(assert (=> d!142001 (= lt!584413 (insertStrictlySorted!485 (toList!10202 lt!584260) (_1!11369 (tuple2!22717 lt!584252 zeroValue!1387)) (_2!11369 (tuple2!22717 lt!584252 zeroValue!1387))))))

(assert (=> d!142001 (= (+!4523 lt!584260 (tuple2!22717 lt!584252 zeroValue!1387)) lt!584411)))

(declare-fun b!1305552 () Bool)

(declare-fun res!866893 () Bool)

(assert (=> b!1305552 (=> (not res!866893) (not e!744717))))

(assert (=> b!1305552 (= res!866893 (= (getValueByKey!712 (toList!10202 lt!584411) (_1!11369 (tuple2!22717 lt!584252 zeroValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584252 zeroValue!1387)))))))

(declare-fun b!1305553 () Bool)

(assert (=> b!1305553 (= e!744717 (contains!8276 (toList!10202 lt!584411) (tuple2!22717 lt!584252 zeroValue!1387)))))

(assert (= (and d!142001 res!866892) b!1305552))

(assert (= (and b!1305552 res!866893) b!1305553))

(declare-fun m!1196267 () Bool)

(assert (=> d!142001 m!1196267))

(declare-fun m!1196269 () Bool)

(assert (=> d!142001 m!1196269))

(declare-fun m!1196271 () Bool)

(assert (=> d!142001 m!1196271))

(declare-fun m!1196273 () Bool)

(assert (=> d!142001 m!1196273))

(declare-fun m!1196275 () Bool)

(assert (=> b!1305552 m!1196275))

(declare-fun m!1196277 () Bool)

(assert (=> b!1305553 m!1196277))

(assert (=> b!1305344 d!142001))

(declare-fun d!142003 () Bool)

(assert (=> d!142003 (= (apply!1019 (+!4523 lt!584256 (tuple2!22717 lt!584268 minValue!1387)) lt!584255) (apply!1019 lt!584256 lt!584255))))

(declare-fun lt!584416 () Unit!43067)

(declare-fun choose!1948 (ListLongMap!20373 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43067)

(assert (=> d!142003 (= lt!584416 (choose!1948 lt!584256 lt!584268 minValue!1387 lt!584255))))

(declare-fun e!744720 () Bool)

(assert (=> d!142003 e!744720))

(declare-fun res!866896 () Bool)

(assert (=> d!142003 (=> (not res!866896) (not e!744720))))

(assert (=> d!142003 (= res!866896 (contains!8274 lt!584256 lt!584255))))

(assert (=> d!142003 (= (addApplyDifferent!557 lt!584256 lt!584268 minValue!1387 lt!584255) lt!584416)))

(declare-fun b!1305557 () Bool)

(assert (=> b!1305557 (= e!744720 (not (= lt!584255 lt!584268)))))

(assert (= (and d!142003 res!866896) b!1305557))

(assert (=> d!142003 m!1195875))

(assert (=> d!142003 m!1195879))

(declare-fun m!1196279 () Bool)

(assert (=> d!142003 m!1196279))

(declare-fun m!1196281 () Bool)

(assert (=> d!142003 m!1196281))

(assert (=> d!142003 m!1195875))

(assert (=> d!142003 m!1195897))

(assert (=> b!1305344 d!142003))

(declare-fun d!142005 () Bool)

(assert (=> d!142005 (contains!8274 (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387)) lt!584250)))

(declare-fun lt!584419 () Unit!43067)

(declare-fun choose!1949 (ListLongMap!20373 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43067)

(assert (=> d!142005 (= lt!584419 (choose!1949 lt!584248 lt!584266 zeroValue!1387 lt!584250))))

(assert (=> d!142005 (contains!8274 lt!584248 lt!584250)))

(assert (=> d!142005 (= (addStillContains!1114 lt!584248 lt!584266 zeroValue!1387 lt!584250) lt!584419)))

(declare-fun bs!37167 () Bool)

(assert (= bs!37167 d!142005))

(assert (=> bs!37167 m!1195877))

(assert (=> bs!37167 m!1195877))

(assert (=> bs!37167 m!1195881))

(declare-fun m!1196283 () Bool)

(assert (=> bs!37167 m!1196283))

(declare-fun m!1196285 () Bool)

(assert (=> bs!37167 m!1196285))

(assert (=> b!1305344 d!142005))

(declare-fun d!142007 () Bool)

(declare-fun e!744721 () Bool)

(assert (=> d!142007 e!744721))

(declare-fun res!866897 () Bool)

(assert (=> d!142007 (=> (not res!866897) (not e!744721))))

(declare-fun lt!584421 () ListLongMap!20373)

(assert (=> d!142007 (= res!866897 (contains!8274 lt!584421 (_1!11369 (tuple2!22717 lt!584266 zeroValue!1387))))))

(declare-fun lt!584423 () List!29820)

(assert (=> d!142007 (= lt!584421 (ListLongMap!20374 lt!584423))))

(declare-fun lt!584420 () Unit!43067)

(declare-fun lt!584422 () Unit!43067)

(assert (=> d!142007 (= lt!584420 lt!584422)))

(assert (=> d!142007 (= (getValueByKey!712 lt!584423 (_1!11369 (tuple2!22717 lt!584266 zeroValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584266 zeroValue!1387))))))

(assert (=> d!142007 (= lt!584422 (lemmaContainsTupThenGetReturnValue!356 lt!584423 (_1!11369 (tuple2!22717 lt!584266 zeroValue!1387)) (_2!11369 (tuple2!22717 lt!584266 zeroValue!1387))))))

(assert (=> d!142007 (= lt!584423 (insertStrictlySorted!485 (toList!10202 lt!584248) (_1!11369 (tuple2!22717 lt!584266 zeroValue!1387)) (_2!11369 (tuple2!22717 lt!584266 zeroValue!1387))))))

(assert (=> d!142007 (= (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387)) lt!584421)))

(declare-fun b!1305559 () Bool)

(declare-fun res!866898 () Bool)

(assert (=> b!1305559 (=> (not res!866898) (not e!744721))))

(assert (=> b!1305559 (= res!866898 (= (getValueByKey!712 (toList!10202 lt!584421) (_1!11369 (tuple2!22717 lt!584266 zeroValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584266 zeroValue!1387)))))))

(declare-fun b!1305560 () Bool)

(assert (=> b!1305560 (= e!744721 (contains!8276 (toList!10202 lt!584421) (tuple2!22717 lt!584266 zeroValue!1387)))))

(assert (= (and d!142007 res!866897) b!1305559))

(assert (= (and b!1305559 res!866898) b!1305560))

(declare-fun m!1196287 () Bool)

(assert (=> d!142007 m!1196287))

(declare-fun m!1196289 () Bool)

(assert (=> d!142007 m!1196289))

(declare-fun m!1196291 () Bool)

(assert (=> d!142007 m!1196291))

(declare-fun m!1196293 () Bool)

(assert (=> d!142007 m!1196293))

(declare-fun m!1196295 () Bool)

(assert (=> b!1305559 m!1196295))

(declare-fun m!1196297 () Bool)

(assert (=> b!1305560 m!1196297))

(assert (=> b!1305344 d!142007))

(declare-fun d!142009 () Bool)

(assert (=> d!142009 (= (apply!1019 (+!4523 lt!584260 (tuple2!22717 lt!584252 zeroValue!1387)) lt!584269) (get!21189 (getValueByKey!712 (toList!10202 (+!4523 lt!584260 (tuple2!22717 lt!584252 zeroValue!1387))) lt!584269)))))

(declare-fun bs!37168 () Bool)

(assert (= bs!37168 d!142009))

(declare-fun m!1196299 () Bool)

(assert (=> bs!37168 m!1196299))

(assert (=> bs!37168 m!1196299))

(declare-fun m!1196301 () Bool)

(assert (=> bs!37168 m!1196301))

(assert (=> b!1305344 d!142009))

(declare-fun d!142011 () Bool)

(assert (=> d!142011 (= (apply!1019 (+!4523 lt!584260 (tuple2!22717 lt!584252 zeroValue!1387)) lt!584269) (apply!1019 lt!584260 lt!584269))))

(declare-fun lt!584424 () Unit!43067)

(assert (=> d!142011 (= lt!584424 (choose!1948 lt!584260 lt!584252 zeroValue!1387 lt!584269))))

(declare-fun e!744722 () Bool)

(assert (=> d!142011 e!744722))

(declare-fun res!866899 () Bool)

(assert (=> d!142011 (=> (not res!866899) (not e!744722))))

(assert (=> d!142011 (= res!866899 (contains!8274 lt!584260 lt!584269))))

(assert (=> d!142011 (= (addApplyDifferent!557 lt!584260 lt!584252 zeroValue!1387 lt!584269) lt!584424)))

(declare-fun b!1305561 () Bool)

(assert (=> b!1305561 (= e!744722 (not (= lt!584269 lt!584252)))))

(assert (= (and d!142011 res!866899) b!1305561))

(assert (=> d!142011 m!1195887))

(assert (=> d!142011 m!1195891))

(declare-fun m!1196303 () Bool)

(assert (=> d!142011 m!1196303))

(declare-fun m!1196305 () Bool)

(assert (=> d!142011 m!1196305))

(assert (=> d!142011 m!1195887))

(assert (=> d!142011 m!1195899))

(assert (=> b!1305344 d!142011))

(declare-fun d!142013 () Bool)

(assert (=> d!142013 (= (apply!1019 (+!4523 lt!584254 (tuple2!22717 lt!584265 minValue!1387)) lt!584251) (get!21189 (getValueByKey!712 (toList!10202 (+!4523 lt!584254 (tuple2!22717 lt!584265 minValue!1387))) lt!584251)))))

(declare-fun bs!37169 () Bool)

(assert (= bs!37169 d!142013))

(declare-fun m!1196307 () Bool)

(assert (=> bs!37169 m!1196307))

(assert (=> bs!37169 m!1196307))

(declare-fun m!1196309 () Bool)

(assert (=> bs!37169 m!1196309))

(assert (=> b!1305344 d!142013))

(assert (=> b!1305344 d!141871))

(declare-fun d!142015 () Bool)

(assert (=> d!142015 (= (apply!1019 lt!584256 lt!584255) (get!21189 (getValueByKey!712 (toList!10202 lt!584256) lt!584255)))))

(declare-fun bs!37170 () Bool)

(assert (= bs!37170 d!142015))

(declare-fun m!1196311 () Bool)

(assert (=> bs!37170 m!1196311))

(assert (=> bs!37170 m!1196311))

(declare-fun m!1196313 () Bool)

(assert (=> bs!37170 m!1196313))

(assert (=> b!1305344 d!142015))

(declare-fun d!142017 () Bool)

(assert (=> d!142017 (= (apply!1019 (+!4523 lt!584256 (tuple2!22717 lt!584268 minValue!1387)) lt!584255) (get!21189 (getValueByKey!712 (toList!10202 (+!4523 lt!584256 (tuple2!22717 lt!584268 minValue!1387))) lt!584255)))))

(declare-fun bs!37171 () Bool)

(assert (= bs!37171 d!142017))

(declare-fun m!1196315 () Bool)

(assert (=> bs!37171 m!1196315))

(assert (=> bs!37171 m!1196315))

(declare-fun m!1196317 () Bool)

(assert (=> bs!37171 m!1196317))

(assert (=> b!1305344 d!142017))

(declare-fun d!142019 () Bool)

(declare-fun e!744724 () Bool)

(assert (=> d!142019 e!744724))

(declare-fun res!866900 () Bool)

(assert (=> d!142019 (=> res!866900 e!744724)))

(declare-fun lt!584426 () Bool)

(assert (=> d!142019 (= res!866900 (not lt!584426))))

(declare-fun lt!584428 () Bool)

(assert (=> d!142019 (= lt!584426 lt!584428)))

(declare-fun lt!584427 () Unit!43067)

(declare-fun e!744723 () Unit!43067)

(assert (=> d!142019 (= lt!584427 e!744723)))

(declare-fun c!125435 () Bool)

(assert (=> d!142019 (= c!125435 lt!584428)))

(assert (=> d!142019 (= lt!584428 (containsKey!729 (toList!10202 (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387))) lt!584250))))

(assert (=> d!142019 (= (contains!8274 (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387)) lt!584250) lt!584426)))

(declare-fun b!1305562 () Bool)

(declare-fun lt!584425 () Unit!43067)

(assert (=> b!1305562 (= e!744723 lt!584425)))

(assert (=> b!1305562 (= lt!584425 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387))) lt!584250))))

(assert (=> b!1305562 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387))) lt!584250))))

(declare-fun b!1305563 () Bool)

(declare-fun Unit!43089 () Unit!43067)

(assert (=> b!1305563 (= e!744723 Unit!43089)))

(declare-fun b!1305564 () Bool)

(assert (=> b!1305564 (= e!744724 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 lt!584248 (tuple2!22717 lt!584266 zeroValue!1387))) lt!584250)))))

(assert (= (and d!142019 c!125435) b!1305562))

(assert (= (and d!142019 (not c!125435)) b!1305563))

(assert (= (and d!142019 (not res!866900)) b!1305564))

(declare-fun m!1196319 () Bool)

(assert (=> d!142019 m!1196319))

(declare-fun m!1196321 () Bool)

(assert (=> b!1305562 m!1196321))

(declare-fun m!1196323 () Bool)

(assert (=> b!1305562 m!1196323))

(assert (=> b!1305562 m!1196323))

(declare-fun m!1196325 () Bool)

(assert (=> b!1305562 m!1196325))

(assert (=> b!1305564 m!1196323))

(assert (=> b!1305564 m!1196323))

(assert (=> b!1305564 m!1196325))

(assert (=> b!1305344 d!142019))

(declare-fun d!142021 () Bool)

(assert (=> d!142021 (= (apply!1019 lt!584254 lt!584251) (get!21189 (getValueByKey!712 (toList!10202 lt!584254) lt!584251)))))

(declare-fun bs!37172 () Bool)

(assert (= bs!37172 d!142021))

(declare-fun m!1196327 () Bool)

(assert (=> bs!37172 m!1196327))

(assert (=> bs!37172 m!1196327))

(declare-fun m!1196329 () Bool)

(assert (=> bs!37172 m!1196329))

(assert (=> b!1305344 d!142021))

(declare-fun d!142023 () Bool)

(assert (=> d!142023 (= (apply!1019 lt!584260 lt!584269) (get!21189 (getValueByKey!712 (toList!10202 lt!584260) lt!584269)))))

(declare-fun bs!37173 () Bool)

(assert (= bs!37173 d!142023))

(declare-fun m!1196331 () Bool)

(assert (=> bs!37173 m!1196331))

(assert (=> bs!37173 m!1196331))

(declare-fun m!1196333 () Bool)

(assert (=> bs!37173 m!1196333))

(assert (=> b!1305344 d!142023))

(declare-fun d!142025 () Bool)

(assert (=> d!142025 (= (apply!1019 (+!4523 lt!584254 (tuple2!22717 lt!584265 minValue!1387)) lt!584251) (apply!1019 lt!584254 lt!584251))))

(declare-fun lt!584429 () Unit!43067)

(assert (=> d!142025 (= lt!584429 (choose!1948 lt!584254 lt!584265 minValue!1387 lt!584251))))

(declare-fun e!744725 () Bool)

(assert (=> d!142025 e!744725))

(declare-fun res!866901 () Bool)

(assert (=> d!142025 (=> (not res!866901) (not e!744725))))

(assert (=> d!142025 (= res!866901 (contains!8274 lt!584254 lt!584251))))

(assert (=> d!142025 (= (addApplyDifferent!557 lt!584254 lt!584265 minValue!1387 lt!584251) lt!584429)))

(declare-fun b!1305565 () Bool)

(assert (=> b!1305565 (= e!744725 (not (= lt!584251 lt!584265)))))

(assert (= (and d!142025 res!866901) b!1305565))

(assert (=> d!142025 m!1195885))

(assert (=> d!142025 m!1195893))

(declare-fun m!1196335 () Bool)

(assert (=> d!142025 m!1196335))

(declare-fun m!1196337 () Bool)

(assert (=> d!142025 m!1196337))

(assert (=> d!142025 m!1195885))

(assert (=> d!142025 m!1195901))

(assert (=> b!1305344 d!142025))

(declare-fun d!142027 () Bool)

(declare-fun e!744726 () Bool)

(assert (=> d!142027 e!744726))

(declare-fun res!866902 () Bool)

(assert (=> d!142027 (=> (not res!866902) (not e!744726))))

(declare-fun lt!584431 () ListLongMap!20373)

(assert (=> d!142027 (= res!866902 (contains!8274 lt!584431 (_1!11369 (tuple2!22717 lt!584268 minValue!1387))))))

(declare-fun lt!584433 () List!29820)

(assert (=> d!142027 (= lt!584431 (ListLongMap!20374 lt!584433))))

(declare-fun lt!584430 () Unit!43067)

(declare-fun lt!584432 () Unit!43067)

(assert (=> d!142027 (= lt!584430 lt!584432)))

(assert (=> d!142027 (= (getValueByKey!712 lt!584433 (_1!11369 (tuple2!22717 lt!584268 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584268 minValue!1387))))))

(assert (=> d!142027 (= lt!584432 (lemmaContainsTupThenGetReturnValue!356 lt!584433 (_1!11369 (tuple2!22717 lt!584268 minValue!1387)) (_2!11369 (tuple2!22717 lt!584268 minValue!1387))))))

(assert (=> d!142027 (= lt!584433 (insertStrictlySorted!485 (toList!10202 lt!584256) (_1!11369 (tuple2!22717 lt!584268 minValue!1387)) (_2!11369 (tuple2!22717 lt!584268 minValue!1387))))))

(assert (=> d!142027 (= (+!4523 lt!584256 (tuple2!22717 lt!584268 minValue!1387)) lt!584431)))

(declare-fun b!1305566 () Bool)

(declare-fun res!866903 () Bool)

(assert (=> b!1305566 (=> (not res!866903) (not e!744726))))

(assert (=> b!1305566 (= res!866903 (= (getValueByKey!712 (toList!10202 lt!584431) (_1!11369 (tuple2!22717 lt!584268 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 lt!584268 minValue!1387)))))))

(declare-fun b!1305567 () Bool)

(assert (=> b!1305567 (= e!744726 (contains!8276 (toList!10202 lt!584431) (tuple2!22717 lt!584268 minValue!1387)))))

(assert (= (and d!142027 res!866902) b!1305566))

(assert (= (and b!1305566 res!866903) b!1305567))

(declare-fun m!1196339 () Bool)

(assert (=> d!142027 m!1196339))

(declare-fun m!1196341 () Bool)

(assert (=> d!142027 m!1196341))

(declare-fun m!1196343 () Bool)

(assert (=> d!142027 m!1196343))

(declare-fun m!1196345 () Bool)

(assert (=> d!142027 m!1196345))

(declare-fun m!1196347 () Bool)

(assert (=> b!1305566 m!1196347))

(declare-fun m!1196349 () Bool)

(assert (=> b!1305567 m!1196349))

(assert (=> b!1305344 d!142027))

(declare-fun d!142029 () Bool)

(declare-fun lt!584434 () Bool)

(assert (=> d!142029 (= lt!584434 (select (content!646 (toList!10202 lt!584293)) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun e!744728 () Bool)

(assert (=> d!142029 (= lt!584434 e!744728)))

(declare-fun res!866904 () Bool)

(assert (=> d!142029 (=> (not res!866904) (not e!744728))))

(assert (=> d!142029 (= res!866904 ((_ is Cons!29816) (toList!10202 lt!584293)))))

(assert (=> d!142029 (= (contains!8276 (toList!10202 lt!584293) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584434)))

(declare-fun b!1305568 () Bool)

(declare-fun e!744727 () Bool)

(assert (=> b!1305568 (= e!744728 e!744727)))

(declare-fun res!866905 () Bool)

(assert (=> b!1305568 (=> res!866905 e!744727)))

(assert (=> b!1305568 (= res!866905 (= (h!31025 (toList!10202 lt!584293)) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305569 () Bool)

(assert (=> b!1305569 (= e!744727 (contains!8276 (t!43414 (toList!10202 lt!584293)) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142029 res!866904) b!1305568))

(assert (= (and b!1305568 (not res!866905)) b!1305569))

(declare-fun m!1196351 () Bool)

(assert (=> d!142029 m!1196351))

(declare-fun m!1196353 () Bool)

(assert (=> d!142029 m!1196353))

(declare-fun m!1196355 () Bool)

(assert (=> b!1305569 m!1196355))

(assert (=> b!1305371 d!142029))

(declare-fun d!142031 () Bool)

(assert (=> d!142031 (= (apply!1019 lt!584194 (select (arr!41895 _keys!1741) from!2144)) (get!21189 (getValueByKey!712 (toList!10202 lt!584194) (select (arr!41895 _keys!1741) from!2144))))))

(declare-fun bs!37174 () Bool)

(assert (= bs!37174 d!142031))

(assert (=> bs!37174 m!1195681))

(declare-fun m!1196357 () Bool)

(assert (=> bs!37174 m!1196357))

(assert (=> bs!37174 m!1196357))

(declare-fun m!1196359 () Bool)

(assert (=> bs!37174 m!1196359))

(assert (=> b!1305279 d!142031))

(assert (=> b!1305279 d!141979))

(declare-fun d!142033 () Bool)

(declare-fun e!744730 () Bool)

(assert (=> d!142033 e!744730))

(declare-fun res!866906 () Bool)

(assert (=> d!142033 (=> res!866906 e!744730)))

(declare-fun lt!584436 () Bool)

(assert (=> d!142033 (= res!866906 (not lt!584436))))

(declare-fun lt!584438 () Bool)

(assert (=> d!142033 (= lt!584436 lt!584438)))

(declare-fun lt!584437 () Unit!43067)

(declare-fun e!744729 () Unit!43067)

(assert (=> d!142033 (= lt!584437 e!744729)))

(declare-fun c!125436 () Bool)

(assert (=> d!142033 (= c!125436 lt!584438)))

(assert (=> d!142033 (= lt!584438 (containsKey!729 (toList!10202 lt!584194) (select (arr!41895 _keys!1741) from!2144)))))

(assert (=> d!142033 (= (contains!8274 lt!584194 (select (arr!41895 _keys!1741) from!2144)) lt!584436)))

(declare-fun b!1305570 () Bool)

(declare-fun lt!584435 () Unit!43067)

(assert (=> b!1305570 (= e!744729 lt!584435)))

(assert (=> b!1305570 (= lt!584435 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584194) (select (arr!41895 _keys!1741) from!2144)))))

(assert (=> b!1305570 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584194) (select (arr!41895 _keys!1741) from!2144)))))

(declare-fun b!1305571 () Bool)

(declare-fun Unit!43090 () Unit!43067)

(assert (=> b!1305571 (= e!744729 Unit!43090)))

(declare-fun b!1305572 () Bool)

(assert (=> b!1305572 (= e!744730 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584194) (select (arr!41895 _keys!1741) from!2144))))))

(assert (= (and d!142033 c!125436) b!1305570))

(assert (= (and d!142033 (not c!125436)) b!1305571))

(assert (= (and d!142033 (not res!866906)) b!1305572))

(assert (=> d!142033 m!1195681))

(declare-fun m!1196361 () Bool)

(assert (=> d!142033 m!1196361))

(assert (=> b!1305570 m!1195681))

(declare-fun m!1196363 () Bool)

(assert (=> b!1305570 m!1196363))

(assert (=> b!1305570 m!1195681))

(assert (=> b!1305570 m!1196357))

(assert (=> b!1305570 m!1196357))

(declare-fun m!1196365 () Bool)

(assert (=> b!1305570 m!1196365))

(assert (=> b!1305572 m!1195681))

(assert (=> b!1305572 m!1196357))

(assert (=> b!1305572 m!1196357))

(assert (=> b!1305572 m!1196365))

(assert (=> b!1305277 d!142033))

(declare-fun d!142035 () Bool)

(declare-fun e!744732 () Bool)

(assert (=> d!142035 e!744732))

(declare-fun res!866907 () Bool)

(assert (=> d!142035 (=> res!866907 e!744732)))

(declare-fun lt!584440 () Bool)

(assert (=> d!142035 (= res!866907 (not lt!584440))))

(declare-fun lt!584442 () Bool)

(assert (=> d!142035 (= lt!584440 lt!584442)))

(declare-fun lt!584441 () Unit!43067)

(declare-fun e!744731 () Unit!43067)

(assert (=> d!142035 (= lt!584441 e!744731)))

(declare-fun c!125437 () Bool)

(assert (=> d!142035 (= c!125437 lt!584442)))

(assert (=> d!142035 (= lt!584442 (containsKey!729 (toList!10202 lt!584301) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142035 (= (contains!8274 lt!584301 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!584440)))

(declare-fun b!1305573 () Bool)

(declare-fun lt!584439 () Unit!43067)

(assert (=> b!1305573 (= e!744731 lt!584439)))

(assert (=> b!1305573 (= lt!584439 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584301) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> b!1305573 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584301) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305574 () Bool)

(declare-fun Unit!43091 () Unit!43067)

(assert (=> b!1305574 (= e!744731 Unit!43091)))

(declare-fun b!1305575 () Bool)

(assert (=> b!1305575 (= e!744732 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584301) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (= (and d!142035 c!125437) b!1305573))

(assert (= (and d!142035 (not c!125437)) b!1305574))

(assert (= (and d!142035 (not res!866907)) b!1305575))

(declare-fun m!1196367 () Bool)

(assert (=> d!142035 m!1196367))

(declare-fun m!1196369 () Bool)

(assert (=> b!1305573 m!1196369))

(assert (=> b!1305573 m!1195963))

(assert (=> b!1305573 m!1195963))

(declare-fun m!1196371 () Bool)

(assert (=> b!1305573 m!1196371))

(assert (=> b!1305575 m!1195963))

(assert (=> b!1305575 m!1195963))

(assert (=> b!1305575 m!1196371))

(assert (=> d!141889 d!142035))

(declare-fun b!1305576 () Bool)

(declare-fun e!744733 () Option!763)

(assert (=> b!1305576 (= e!744733 (Some!762 (_2!11369 (h!31025 lt!584303))))))

(declare-fun b!1305579 () Bool)

(declare-fun e!744734 () Option!763)

(assert (=> b!1305579 (= e!744734 None!761)))

(declare-fun b!1305577 () Bool)

(assert (=> b!1305577 (= e!744733 e!744734)))

(declare-fun c!125439 () Bool)

(assert (=> b!1305577 (= c!125439 (and ((_ is Cons!29816) lt!584303) (not (= (_1!11369 (h!31025 lt!584303)) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun b!1305578 () Bool)

(assert (=> b!1305578 (= e!744734 (getValueByKey!712 (t!43414 lt!584303) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun d!142037 () Bool)

(declare-fun c!125438 () Bool)

(assert (=> d!142037 (= c!125438 (and ((_ is Cons!29816) lt!584303) (= (_1!11369 (h!31025 lt!584303)) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> d!142037 (= (getValueByKey!712 lt!584303 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) e!744733)))

(assert (= (and d!142037 c!125438) b!1305576))

(assert (= (and d!142037 (not c!125438)) b!1305577))

(assert (= (and b!1305577 c!125439) b!1305578))

(assert (= (and b!1305577 (not c!125439)) b!1305579))

(declare-fun m!1196373 () Bool)

(assert (=> b!1305578 m!1196373))

(assert (=> d!141889 d!142037))

(declare-fun d!142039 () Bool)

(assert (=> d!142039 (= (getValueByKey!712 lt!584303 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!762 (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584445 () Unit!43067)

(declare-fun choose!1950 (List!29820 (_ BitVec 64) V!51697) Unit!43067)

(assert (=> d!142039 (= lt!584445 (choose!1950 lt!584303 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun e!744737 () Bool)

(assert (=> d!142039 e!744737))

(declare-fun res!866912 () Bool)

(assert (=> d!142039 (=> (not res!866912) (not e!744737))))

(assert (=> d!142039 (= res!866912 (isStrictlySorted!871 lt!584303))))

(assert (=> d!142039 (= (lemmaContainsTupThenGetReturnValue!356 lt!584303 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!584445)))

(declare-fun b!1305584 () Bool)

(declare-fun res!866913 () Bool)

(assert (=> b!1305584 (=> (not res!866913) (not e!744737))))

(assert (=> b!1305584 (= res!866913 (containsKey!729 lt!584303 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305585 () Bool)

(assert (=> b!1305585 (= e!744737 (contains!8276 lt!584303 (tuple2!22717 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (= (and d!142039 res!866912) b!1305584))

(assert (= (and b!1305584 res!866913) b!1305585))

(assert (=> d!142039 m!1195957))

(declare-fun m!1196375 () Bool)

(assert (=> d!142039 m!1196375))

(declare-fun m!1196377 () Bool)

(assert (=> d!142039 m!1196377))

(declare-fun m!1196379 () Bool)

(assert (=> b!1305584 m!1196379))

(declare-fun m!1196381 () Bool)

(assert (=> b!1305585 m!1196381))

(assert (=> d!141889 d!142039))

(declare-fun bm!64458 () Bool)

(declare-fun call!64461 () List!29820)

(declare-fun e!744752 () List!29820)

(declare-fun c!125449 () Bool)

(declare-fun $colon$colon!670 (List!29820 tuple2!22716) List!29820)

(assert (=> bm!64458 (= call!64461 ($colon$colon!670 e!744752 (ite c!125449 (h!31025 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)))) (tuple2!22717 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun c!125450 () Bool)

(assert (=> bm!64458 (= c!125450 c!125449)))

(declare-fun b!1305606 () Bool)

(declare-fun e!744750 () List!29820)

(declare-fun call!64462 () List!29820)

(assert (=> b!1305606 (= e!744750 call!64462)))

(declare-fun b!1305607 () Bool)

(declare-fun c!125448 () Bool)

(assert (=> b!1305607 (= c!125448 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)))) (bvsgt (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun e!744748 () List!29820)

(assert (=> b!1305607 (= e!744748 e!744750)))

(declare-fun b!1305608 () Bool)

(declare-fun e!744749 () List!29820)

(assert (=> b!1305608 (= e!744749 e!744748)))

(declare-fun c!125451 () Bool)

(assert (=> b!1305608 (= c!125451 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)))) (= (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305609 () Bool)

(declare-fun call!64463 () List!29820)

(assert (=> b!1305609 (= e!744748 call!64463)))

(declare-fun lt!584448 () List!29820)

(declare-fun e!744751 () Bool)

(declare-fun b!1305610 () Bool)

(assert (=> b!1305610 (= e!744751 (contains!8276 lt!584448 (tuple2!22717 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305611 () Bool)

(assert (=> b!1305611 (= e!744750 call!64462)))

(declare-fun b!1305612 () Bool)

(assert (=> b!1305612 (= e!744749 call!64461)))

(declare-fun b!1305613 () Bool)

(assert (=> b!1305613 (= e!744752 (ite c!125451 (t!43414 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)))) (ite c!125448 (Cons!29816 (h!31025 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)))) (t!43414 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))))) Nil!29817)))))

(declare-fun b!1305614 () Bool)

(declare-fun res!866918 () Bool)

(assert (=> b!1305614 (=> (not res!866918) (not e!744751))))

(assert (=> b!1305614 (= res!866918 (containsKey!729 lt!584448 (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun bm!64459 () Bool)

(assert (=> bm!64459 (= call!64462 call!64463)))

(declare-fun d!142041 () Bool)

(assert (=> d!142041 e!744751))

(declare-fun res!866919 () Bool)

(assert (=> d!142041 (=> (not res!866919) (not e!744751))))

(assert (=> d!142041 (= res!866919 (isStrictlySorted!871 lt!584448))))

(assert (=> d!142041 (= lt!584448 e!744749)))

(assert (=> d!142041 (= c!125449 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)))) (bvslt (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> d!142041 (isStrictlySorted!871 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))))))

(assert (=> d!142041 (= (insertStrictlySorted!485 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!584448)))

(declare-fun bm!64460 () Bool)

(assert (=> bm!64460 (= call!64463 call!64461)))

(declare-fun b!1305615 () Bool)

(assert (=> b!1305615 (= e!744752 (insertStrictlySorted!485 (t!43414 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)))) (_1!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11369 (ite (or c!125329 c!125330) (tuple2!22717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142041 c!125449) b!1305612))

(assert (= (and d!142041 (not c!125449)) b!1305608))

(assert (= (and b!1305608 c!125451) b!1305609))

(assert (= (and b!1305608 (not c!125451)) b!1305607))

(assert (= (and b!1305607 c!125448) b!1305611))

(assert (= (and b!1305607 (not c!125448)) b!1305606))

(assert (= (or b!1305611 b!1305606) bm!64459))

(assert (= (or b!1305609 bm!64459) bm!64460))

(assert (= (or b!1305612 bm!64460) bm!64458))

(assert (= (and bm!64458 c!125450) b!1305615))

(assert (= (and bm!64458 (not c!125450)) b!1305613))

(assert (= (and d!142041 res!866919) b!1305614))

(assert (= (and b!1305614 res!866918) b!1305610))

(declare-fun m!1196383 () Bool)

(assert (=> b!1305610 m!1196383))

(declare-fun m!1196385 () Bool)

(assert (=> bm!64458 m!1196385))

(declare-fun m!1196387 () Bool)

(assert (=> b!1305614 m!1196387))

(declare-fun m!1196389 () Bool)

(assert (=> d!142041 m!1196389))

(declare-fun m!1196391 () Bool)

(assert (=> d!142041 m!1196391))

(declare-fun m!1196393 () Bool)

(assert (=> b!1305615 m!1196393))

(assert (=> d!141889 d!142041))

(declare-fun d!142043 () Bool)

(assert (=> d!142043 (= (apply!1019 lt!584264 (select (arr!41895 _keys!1741) from!2144)) (get!21189 (getValueByKey!712 (toList!10202 lt!584264) (select (arr!41895 _keys!1741) from!2144))))))

(declare-fun bs!37175 () Bool)

(assert (= bs!37175 d!142043))

(assert (=> bs!37175 m!1195681))

(assert (=> bs!37175 m!1196085))

(assert (=> bs!37175 m!1196085))

(declare-fun m!1196395 () Bool)

(assert (=> bs!37175 m!1196395))

(assert (=> b!1305349 d!142043))

(assert (=> b!1305349 d!141979))

(declare-fun d!142045 () Bool)

(declare-fun e!744754 () Bool)

(assert (=> d!142045 e!744754))

(declare-fun res!866920 () Bool)

(assert (=> d!142045 (=> res!866920 e!744754)))

(declare-fun lt!584450 () Bool)

(assert (=> d!142045 (= res!866920 (not lt!584450))))

(declare-fun lt!584452 () Bool)

(assert (=> d!142045 (= lt!584450 lt!584452)))

(declare-fun lt!584451 () Unit!43067)

(declare-fun e!744753 () Unit!43067)

(assert (=> d!142045 (= lt!584451 e!744753)))

(declare-fun c!125452 () Bool)

(assert (=> d!142045 (= c!125452 lt!584452)))

(assert (=> d!142045 (= lt!584452 (containsKey!729 (toList!10202 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> d!142045 (= (contains!8274 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) k0!1205) lt!584450)))

(declare-fun b!1305616 () Bool)

(declare-fun lt!584449 () Unit!43067)

(assert (=> b!1305616 (= e!744753 lt!584449)))

(assert (=> b!1305616 (= lt!584449 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> b!1305616 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205))))

(declare-fun b!1305617 () Bool)

(declare-fun Unit!43092 () Unit!43067)

(assert (=> b!1305617 (= e!744753 Unit!43092)))

(declare-fun b!1305618 () Bool)

(assert (=> b!1305618 (= e!744754 (isDefined!519 (getValueByKey!712 (toList!10202 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) k0!1205)))))

(assert (= (and d!142045 c!125452) b!1305616))

(assert (= (and d!142045 (not c!125452)) b!1305617))

(assert (= (and d!142045 (not res!866920)) b!1305618))

(declare-fun m!1196397 () Bool)

(assert (=> d!142045 m!1196397))

(declare-fun m!1196399 () Bool)

(assert (=> b!1305616 m!1196399))

(declare-fun m!1196401 () Bool)

(assert (=> b!1305616 m!1196401))

(assert (=> b!1305616 m!1196401))

(declare-fun m!1196403 () Bool)

(assert (=> b!1305616 m!1196403))

(assert (=> b!1305618 m!1196401))

(assert (=> b!1305618 m!1196401))

(assert (=> b!1305618 m!1196403))

(assert (=> d!141865 d!142045))

(declare-fun d!142047 () Bool)

(declare-fun e!744755 () Bool)

(assert (=> d!142047 e!744755))

(declare-fun res!866921 () Bool)

(assert (=> d!142047 (=> (not res!866921) (not e!744755))))

(declare-fun lt!584454 () ListLongMap!20373)

(assert (=> d!142047 (= res!866921 (contains!8274 lt!584454 (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(declare-fun lt!584456 () List!29820)

(assert (=> d!142047 (= lt!584454 (ListLongMap!20374 lt!584456))))

(declare-fun lt!584453 () Unit!43067)

(declare-fun lt!584455 () Unit!43067)

(assert (=> d!142047 (= lt!584453 lt!584455)))

(assert (=> d!142047 (= (getValueByKey!712 lt!584456 (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) (Some!762 (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142047 (= lt!584455 (lemmaContainsTupThenGetReturnValue!356 lt!584456 (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142047 (= lt!584456 (insertStrictlySorted!485 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))) (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142047 (= (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) lt!584454)))

(declare-fun b!1305619 () Bool)

(declare-fun res!866922 () Bool)

(assert (=> b!1305619 (=> (not res!866922) (not e!744755))))

(assert (=> b!1305619 (= res!866922 (= (getValueByKey!712 (toList!10202 lt!584454) (_1!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387))))) (Some!762 (_2!11369 (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))))))))

(declare-fun b!1305620 () Bool)

(assert (=> b!1305620 (= e!744755 (contains!8276 (toList!10202 lt!584454) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))))))

(assert (= (and d!142047 res!866921) b!1305619))

(assert (= (and b!1305619 res!866922) b!1305620))

(declare-fun m!1196405 () Bool)

(assert (=> d!142047 m!1196405))

(declare-fun m!1196407 () Bool)

(assert (=> d!142047 m!1196407))

(declare-fun m!1196409 () Bool)

(assert (=> d!142047 m!1196409))

(declare-fun m!1196411 () Bool)

(assert (=> d!142047 m!1196411))

(declare-fun m!1196413 () Bool)

(assert (=> b!1305619 m!1196413))

(declare-fun m!1196415 () Bool)

(assert (=> b!1305620 m!1196415))

(assert (=> d!141865 d!142047))

(declare-fun d!142049 () Bool)

(assert (=> d!142049 (not (contains!8274 (+!4523 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (tuple2!22717 (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)))) k0!1205))))

(assert (=> d!142049 true))

(declare-fun _$36!382 () Unit!43067)

(assert (=> d!142049 (= (choose!1944 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) (ite c!125329 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125330 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125329 minValue!1387 (ite c!125330 zeroValue!1387 minValue!1387)) k0!1205) _$36!382)))

(declare-fun bs!37176 () Bool)

(assert (= bs!37176 d!142049))

(assert (=> bs!37176 m!1195811))

(assert (=> bs!37176 m!1195811))

(assert (=> bs!37176 m!1195813))

(assert (=> d!141865 d!142049))

(declare-fun d!142051 () Bool)

(declare-fun e!744757 () Bool)

(assert (=> d!142051 e!744757))

(declare-fun res!866923 () Bool)

(assert (=> d!142051 (=> res!866923 e!744757)))

(declare-fun lt!584458 () Bool)

(assert (=> d!142051 (= res!866923 (not lt!584458))))

(declare-fun lt!584460 () Bool)

(assert (=> d!142051 (= lt!584458 lt!584460)))

(declare-fun lt!584459 () Unit!43067)

(declare-fun e!744756 () Unit!43067)

(assert (=> d!142051 (= lt!584459 e!744756)))

(declare-fun c!125453 () Bool)

(assert (=> d!142051 (= c!125453 lt!584460)))

(assert (=> d!142051 (= lt!584460 (containsKey!729 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(assert (=> d!142051 (= (contains!8274 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055)) k0!1205) lt!584458)))

(declare-fun b!1305621 () Bool)

(declare-fun lt!584457 () Unit!43067)

(assert (=> b!1305621 (= e!744756 lt!584457)))

(assert (=> b!1305621 (= lt!584457 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(assert (=> b!1305621 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))) k0!1205))))

(declare-fun b!1305622 () Bool)

(declare-fun Unit!43093 () Unit!43067)

(assert (=> b!1305622 (= e!744756 Unit!43093)))

(declare-fun b!1305623 () Bool)

(assert (=> b!1305623 (= e!744757 (isDefined!519 (getValueByKey!712 (toList!10202 (ite c!125329 lt!584061 (ite c!125330 lt!584065 lt!584055))) k0!1205)))))

(assert (= (and d!142051 c!125453) b!1305621))

(assert (= (and d!142051 (not c!125453)) b!1305622))

(assert (= (and d!142051 (not res!866923)) b!1305623))

(declare-fun m!1196417 () Bool)

(assert (=> d!142051 m!1196417))

(declare-fun m!1196419 () Bool)

(assert (=> b!1305621 m!1196419))

(declare-fun m!1196421 () Bool)

(assert (=> b!1305621 m!1196421))

(assert (=> b!1305621 m!1196421))

(declare-fun m!1196423 () Bool)

(assert (=> b!1305621 m!1196423))

(assert (=> b!1305623 m!1196421))

(assert (=> b!1305623 m!1196421))

(assert (=> b!1305623 m!1196423))

(assert (=> d!141865 d!142051))

(declare-fun d!142053 () Bool)

(assert (=> d!142053 (isDefined!519 (getValueByKey!712 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!584461 () Unit!43067)

(assert (=> d!142053 (= lt!584461 (choose!1947 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744758 () Bool)

(assert (=> d!142053 e!744758))

(declare-fun res!866924 () Bool)

(assert (=> d!142053 (=> (not res!866924) (not e!744758))))

(assert (=> d!142053 (= res!866924 (isStrictlySorted!871 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!142053 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!584461)))

(declare-fun b!1305624 () Bool)

(assert (=> b!1305624 (= e!744758 (containsKey!729 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!142053 res!866924) b!1305624))

(assert (=> d!142053 m!1195857))

(assert (=> d!142053 m!1195857))

(assert (=> d!142053 m!1195859))

(declare-fun m!1196425 () Bool)

(assert (=> d!142053 m!1196425))

(declare-fun m!1196427 () Bool)

(assert (=> d!142053 m!1196427))

(assert (=> b!1305624 m!1195853))

(assert (=> b!1305284 d!142053))

(declare-fun d!142055 () Bool)

(assert (=> d!142055 (= (isDefined!519 (getValueByKey!712 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1077 (getValueByKey!712 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37177 () Bool)

(assert (= bs!37177 d!142055))

(assert (=> bs!37177 m!1195857))

(declare-fun m!1196429 () Bool)

(assert (=> bs!37177 m!1196429))

(assert (=> b!1305284 d!142055))

(declare-fun e!744759 () Option!763)

(declare-fun b!1305625 () Bool)

(assert (=> b!1305625 (= e!744759 (Some!762 (_2!11369 (h!31025 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1305628 () Bool)

(declare-fun e!744760 () Option!763)

(assert (=> b!1305628 (= e!744760 None!761)))

(declare-fun b!1305626 () Bool)

(assert (=> b!1305626 (= e!744759 e!744760)))

(declare-fun c!125455 () Bool)

(assert (=> b!1305626 (= c!125455 (and ((_ is Cons!29816) (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11369 (h!31025 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1305627 () Bool)

(assert (=> b!1305627 (= e!744760 (getValueByKey!712 (t!43414 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun d!142057 () Bool)

(declare-fun c!125454 () Bool)

(assert (=> d!142057 (= c!125454 (and ((_ is Cons!29816) (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11369 (h!31025 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142057 (= (getValueByKey!712 (toList!10202 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744759)))

(assert (= (and d!142057 c!125454) b!1305625))

(assert (= (and d!142057 (not c!125454)) b!1305626))

(assert (= (and b!1305626 c!125455) b!1305627))

(assert (= (and b!1305626 (not c!125455)) b!1305628))

(declare-fun m!1196431 () Bool)

(assert (=> b!1305627 m!1196431))

(assert (=> b!1305284 d!142057))

(assert (=> b!1305273 d!141867))

(assert (=> b!1305392 d!141981))

(declare-fun d!142059 () Bool)

(declare-fun e!744762 () Bool)

(assert (=> d!142059 e!744762))

(declare-fun res!866925 () Bool)

(assert (=> d!142059 (=> res!866925 e!744762)))

(declare-fun lt!584463 () Bool)

(assert (=> d!142059 (= res!866925 (not lt!584463))))

(declare-fun lt!584465 () Bool)

(assert (=> d!142059 (= lt!584463 lt!584465)))

(declare-fun lt!584464 () Unit!43067)

(declare-fun e!744761 () Unit!43067)

(assert (=> d!142059 (= lt!584464 e!744761)))

(declare-fun c!125456 () Bool)

(assert (=> d!142059 (= c!125456 lt!584465)))

(assert (=> d!142059 (= lt!584465 (containsKey!729 (toList!10202 lt!584264) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142059 (= (contains!8274 lt!584264 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584463)))

(declare-fun b!1305629 () Bool)

(declare-fun lt!584462 () Unit!43067)

(assert (=> b!1305629 (= e!744761 lt!584462)))

(assert (=> b!1305629 (= lt!584462 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584264) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305629 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584264) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305630 () Bool)

(declare-fun Unit!43094 () Unit!43067)

(assert (=> b!1305630 (= e!744761 Unit!43094)))

(declare-fun b!1305631 () Bool)

(assert (=> b!1305631 (= e!744762 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142059 c!125456) b!1305629))

(assert (= (and d!142059 (not c!125456)) b!1305630))

(assert (= (and d!142059 (not res!866925)) b!1305631))

(declare-fun m!1196433 () Bool)

(assert (=> d!142059 m!1196433))

(declare-fun m!1196435 () Bool)

(assert (=> b!1305629 m!1196435))

(assert (=> b!1305629 m!1196025))

(assert (=> b!1305629 m!1196025))

(declare-fun m!1196437 () Bool)

(assert (=> b!1305629 m!1196437))

(assert (=> b!1305631 m!1196025))

(assert (=> b!1305631 m!1196025))

(assert (=> b!1305631 m!1196437))

(assert (=> bm!64442 d!142059))

(declare-fun d!142061 () Bool)

(assert (=> d!142061 (= (apply!1019 lt!584264 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21189 (getValueByKey!712 (toList!10202 lt!584264) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37178 () Bool)

(assert (= bs!37178 d!142061))

(assert (=> bs!37178 m!1196121))

(assert (=> bs!37178 m!1196121))

(declare-fun m!1196439 () Bool)

(assert (=> bs!37178 m!1196439))

(assert (=> b!1305333 d!142061))

(declare-fun d!142063 () Bool)

(declare-fun res!866926 () Bool)

(declare-fun e!744763 () Bool)

(assert (=> d!142063 (=> res!866926 e!744763)))

(assert (=> d!142063 (= res!866926 (and ((_ is Cons!29816) (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (= (_1!11369 (h!31025 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(assert (=> d!142063 (= (containsKey!729 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) e!744763)))

(declare-fun b!1305632 () Bool)

(declare-fun e!744764 () Bool)

(assert (=> b!1305632 (= e!744763 e!744764)))

(declare-fun res!866927 () Bool)

(assert (=> b!1305632 (=> (not res!866927) (not e!744764))))

(assert (=> b!1305632 (= res!866927 (and (or (not ((_ is Cons!29816) (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) (bvsle (_1!11369 (h!31025 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)) ((_ is Cons!29816) (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (bvslt (_1!11369 (h!31025 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(declare-fun b!1305633 () Bool)

(assert (=> b!1305633 (= e!744764 (containsKey!729 (t!43414 (toList!10202 (+!4523 lt!584061 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) k0!1205))))

(assert (= (and d!142063 (not res!866926)) b!1305632))

(assert (= (and b!1305632 res!866927) b!1305633))

(declare-fun m!1196441 () Bool)

(assert (=> b!1305633 m!1196441))

(assert (=> d!141881 d!142063))

(declare-fun d!142065 () Bool)

(declare-fun res!866928 () Bool)

(declare-fun e!744765 () Bool)

(assert (=> d!142065 (=> res!866928 e!744765)))

(assert (=> d!142065 (= res!866928 (and ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))) (= (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))) k0!1205)))))

(assert (=> d!142065 (= (containsKey!729 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))) k0!1205) e!744765)))

(declare-fun b!1305634 () Bool)

(declare-fun e!744766 () Bool)

(assert (=> b!1305634 (= e!744765 e!744766)))

(declare-fun res!866929 () Bool)

(assert (=> b!1305634 (=> (not res!866929) (not e!744766))))

(assert (=> b!1305634 (= res!866929 (and (or (not ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))) (bvsle (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))) k0!1205)) ((_ is Cons!29816) (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))) (bvslt (_1!11369 (h!31025 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055))))) k0!1205)))))

(declare-fun b!1305635 () Bool)

(assert (=> b!1305635 (= e!744766 (containsKey!729 (t!43414 (toList!10202 (ite c!125329 lt!584054 (ite c!125330 lt!584065 lt!584055)))) k0!1205))))

(assert (= (and d!142065 (not res!866928)) b!1305634))

(assert (= (and b!1305634 res!866929) b!1305635))

(declare-fun m!1196443 () Bool)

(assert (=> b!1305635 m!1196443))

(assert (=> d!141897 d!142065))

(assert (=> b!1305286 d!142055))

(assert (=> b!1305286 d!142057))

(assert (=> b!1305275 d!141867))

(declare-fun d!142067 () Bool)

(declare-fun e!744768 () Bool)

(assert (=> d!142067 e!744768))

(declare-fun res!866930 () Bool)

(assert (=> d!142067 (=> res!866930 e!744768)))

(declare-fun lt!584467 () Bool)

(assert (=> d!142067 (= res!866930 (not lt!584467))))

(declare-fun lt!584469 () Bool)

(assert (=> d!142067 (= lt!584467 lt!584469)))

(declare-fun lt!584468 () Unit!43067)

(declare-fun e!744767 () Unit!43067)

(assert (=> d!142067 (= lt!584468 e!744767)))

(declare-fun c!125457 () Bool)

(assert (=> d!142067 (= c!125457 lt!584469)))

(assert (=> d!142067 (= lt!584469 (containsKey!729 (toList!10202 lt!584293) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142067 (= (contains!8274 lt!584293 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584467)))

(declare-fun b!1305636 () Bool)

(declare-fun lt!584466 () Unit!43067)

(assert (=> b!1305636 (= e!744767 lt!584466)))

(assert (=> b!1305636 (= lt!584466 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10202 lt!584293) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> b!1305636 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584293) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305637 () Bool)

(declare-fun Unit!43095 () Unit!43067)

(assert (=> b!1305637 (= e!744767 Unit!43095)))

(declare-fun b!1305638 () Bool)

(assert (=> b!1305638 (= e!744768 (isDefined!519 (getValueByKey!712 (toList!10202 lt!584293) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142067 c!125457) b!1305636))

(assert (= (and d!142067 (not c!125457)) b!1305637))

(assert (= (and d!142067 (not res!866930)) b!1305638))

(declare-fun m!1196445 () Bool)

(assert (=> d!142067 m!1196445))

(declare-fun m!1196447 () Bool)

(assert (=> b!1305636 m!1196447))

(assert (=> b!1305636 m!1195943))

(assert (=> b!1305636 m!1195943))

(declare-fun m!1196449 () Bool)

(assert (=> b!1305636 m!1196449))

(assert (=> b!1305638 m!1195943))

(assert (=> b!1305638 m!1195943))

(assert (=> b!1305638 m!1196449))

(assert (=> d!141883 d!142067))

(declare-fun b!1305639 () Bool)

(declare-fun e!744769 () Option!763)

(assert (=> b!1305639 (= e!744769 (Some!762 (_2!11369 (h!31025 lt!584295))))))

(declare-fun b!1305642 () Bool)

(declare-fun e!744770 () Option!763)

(assert (=> b!1305642 (= e!744770 None!761)))

(declare-fun b!1305640 () Bool)

(assert (=> b!1305640 (= e!744769 e!744770)))

(declare-fun c!125459 () Bool)

(assert (=> b!1305640 (= c!125459 (and ((_ is Cons!29816) lt!584295) (not (= (_1!11369 (h!31025 lt!584295)) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305641 () Bool)

(assert (=> b!1305641 (= e!744770 (getValueByKey!712 (t!43414 lt!584295) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun d!142069 () Bool)

(declare-fun c!125458 () Bool)

(assert (=> d!142069 (= c!125458 (and ((_ is Cons!29816) lt!584295) (= (_1!11369 (h!31025 lt!584295)) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142069 (= (getValueByKey!712 lt!584295 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) e!744769)))

(assert (= (and d!142069 c!125458) b!1305639))

(assert (= (and d!142069 (not c!125458)) b!1305640))

(assert (= (and b!1305640 c!125459) b!1305641))

(assert (= (and b!1305640 (not c!125459)) b!1305642))

(declare-fun m!1196451 () Bool)

(assert (=> b!1305641 m!1196451))

(assert (=> d!141883 d!142069))

(declare-fun d!142071 () Bool)

(assert (=> d!142071 (= (getValueByKey!712 lt!584295 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!762 (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584470 () Unit!43067)

(assert (=> d!142071 (= lt!584470 (choose!1950 lt!584295 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun e!744771 () Bool)

(assert (=> d!142071 e!744771))

(declare-fun res!866931 () Bool)

(assert (=> d!142071 (=> (not res!866931) (not e!744771))))

(assert (=> d!142071 (= res!866931 (isStrictlySorted!871 lt!584295))))

(assert (=> d!142071 (= (lemmaContainsTupThenGetReturnValue!356 lt!584295 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584470)))

(declare-fun b!1305643 () Bool)

(declare-fun res!866932 () Bool)

(assert (=> b!1305643 (=> (not res!866932) (not e!744771))))

(assert (=> b!1305643 (= res!866932 (containsKey!729 lt!584295 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305644 () Bool)

(assert (=> b!1305644 (= e!744771 (contains!8276 lt!584295 (tuple2!22717 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142071 res!866931) b!1305643))

(assert (= (and b!1305643 res!866932) b!1305644))

(assert (=> d!142071 m!1195937))

(declare-fun m!1196453 () Bool)

(assert (=> d!142071 m!1196453))

(declare-fun m!1196455 () Bool)

(assert (=> d!142071 m!1196455))

(declare-fun m!1196457 () Bool)

(assert (=> b!1305643 m!1196457))

(declare-fun m!1196459 () Bool)

(assert (=> b!1305644 m!1196459))

(assert (=> d!141883 d!142071))

(declare-fun e!744776 () List!29820)

(declare-fun bm!64461 () Bool)

(declare-fun call!64464 () List!29820)

(declare-fun c!125461 () Bool)

(assert (=> bm!64461 (= call!64464 ($colon$colon!670 e!744776 (ite c!125461 (h!31025 (toList!10202 lt!584061)) (tuple2!22717 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun c!125462 () Bool)

(assert (=> bm!64461 (= c!125462 c!125461)))

(declare-fun b!1305645 () Bool)

(declare-fun e!744774 () List!29820)

(declare-fun call!64465 () List!29820)

(assert (=> b!1305645 (= e!744774 call!64465)))

(declare-fun b!1305646 () Bool)

(declare-fun c!125460 () Bool)

(assert (=> b!1305646 (= c!125460 (and ((_ is Cons!29816) (toList!10202 lt!584061)) (bvsgt (_1!11369 (h!31025 (toList!10202 lt!584061))) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun e!744772 () List!29820)

(assert (=> b!1305646 (= e!744772 e!744774)))

(declare-fun b!1305647 () Bool)

(declare-fun e!744773 () List!29820)

(assert (=> b!1305647 (= e!744773 e!744772)))

(declare-fun c!125463 () Bool)

(assert (=> b!1305647 (= c!125463 (and ((_ is Cons!29816) (toList!10202 lt!584061)) (= (_1!11369 (h!31025 (toList!10202 lt!584061))) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305648 () Bool)

(declare-fun call!64466 () List!29820)

(assert (=> b!1305648 (= e!744772 call!64466)))

(declare-fun b!1305649 () Bool)

(declare-fun e!744775 () Bool)

(declare-fun lt!584471 () List!29820)

(assert (=> b!1305649 (= e!744775 (contains!8276 lt!584471 (tuple2!22717 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305650 () Bool)

(assert (=> b!1305650 (= e!744774 call!64465)))

(declare-fun b!1305651 () Bool)

(assert (=> b!1305651 (= e!744773 call!64464)))

(declare-fun b!1305652 () Bool)

(assert (=> b!1305652 (= e!744776 (ite c!125463 (t!43414 (toList!10202 lt!584061)) (ite c!125460 (Cons!29816 (h!31025 (toList!10202 lt!584061)) (t!43414 (toList!10202 lt!584061))) Nil!29817)))))

(declare-fun b!1305653 () Bool)

(declare-fun res!866933 () Bool)

(assert (=> b!1305653 (=> (not res!866933) (not e!744775))))

(assert (=> b!1305653 (= res!866933 (containsKey!729 lt!584471 (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64462 () Bool)

(assert (=> bm!64462 (= call!64465 call!64466)))

(declare-fun d!142073 () Bool)

(assert (=> d!142073 e!744775))

(declare-fun res!866934 () Bool)

(assert (=> d!142073 (=> (not res!866934) (not e!744775))))

(assert (=> d!142073 (= res!866934 (isStrictlySorted!871 lt!584471))))

(assert (=> d!142073 (= lt!584471 e!744773)))

(assert (=> d!142073 (= c!125461 (and ((_ is Cons!29816) (toList!10202 lt!584061)) (bvslt (_1!11369 (h!31025 (toList!10202 lt!584061))) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142073 (isStrictlySorted!871 (toList!10202 lt!584061))))

(assert (=> d!142073 (= (insertStrictlySorted!485 (toList!10202 lt!584061) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584471)))

(declare-fun bm!64463 () Bool)

(assert (=> bm!64463 (= call!64466 call!64464)))

(declare-fun b!1305654 () Bool)

(assert (=> b!1305654 (= e!744776 (insertStrictlySorted!485 (t!43414 (toList!10202 lt!584061)) (_1!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11369 (tuple2!22717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142073 c!125461) b!1305651))

(assert (= (and d!142073 (not c!125461)) b!1305647))

(assert (= (and b!1305647 c!125463) b!1305648))

(assert (= (and b!1305647 (not c!125463)) b!1305646))

(assert (= (and b!1305646 c!125460) b!1305650))

(assert (= (and b!1305646 (not c!125460)) b!1305645))

(assert (= (or b!1305650 b!1305645) bm!64462))

(assert (= (or b!1305648 bm!64462) bm!64463))

(assert (= (or b!1305651 bm!64463) bm!64461))

(assert (= (and bm!64461 c!125462) b!1305654))

(assert (= (and bm!64461 (not c!125462)) b!1305652))

(assert (= (and d!142073 res!866934) b!1305653))

(assert (= (and b!1305653 res!866933) b!1305649))

(declare-fun m!1196461 () Bool)

(assert (=> b!1305649 m!1196461))

(declare-fun m!1196463 () Bool)

(assert (=> bm!64461 m!1196463))

(declare-fun m!1196465 () Bool)

(assert (=> b!1305653 m!1196465))

(declare-fun m!1196467 () Bool)

(assert (=> d!142073 m!1196467))

(declare-fun m!1196469 () Bool)

(assert (=> d!142073 m!1196469))

(declare-fun m!1196471 () Bool)

(assert (=> b!1305654 m!1196471))

(assert (=> d!141883 d!142073))

(declare-fun d!142075 () Bool)

(declare-fun res!866935 () Bool)

(declare-fun e!744777 () Bool)

(assert (=> d!142075 (=> res!866935 e!744777)))

(assert (=> d!142075 (= res!866935 (and ((_ is Cons!29816) (toList!10202 (ListLongMap!20374 Nil!29817))) (= (_1!11369 (h!31025 (toList!10202 (ListLongMap!20374 Nil!29817)))) k0!1205)))))

(assert (=> d!142075 (= (containsKey!729 (toList!10202 (ListLongMap!20374 Nil!29817)) k0!1205) e!744777)))

(declare-fun b!1305655 () Bool)

(declare-fun e!744778 () Bool)

(assert (=> b!1305655 (= e!744777 e!744778)))

(declare-fun res!866936 () Bool)

(assert (=> b!1305655 (=> (not res!866936) (not e!744778))))

(assert (=> b!1305655 (= res!866936 (and (or (not ((_ is Cons!29816) (toList!10202 (ListLongMap!20374 Nil!29817)))) (bvsle (_1!11369 (h!31025 (toList!10202 (ListLongMap!20374 Nil!29817)))) k0!1205)) ((_ is Cons!29816) (toList!10202 (ListLongMap!20374 Nil!29817))) (bvslt (_1!11369 (h!31025 (toList!10202 (ListLongMap!20374 Nil!29817)))) k0!1205)))))

(declare-fun b!1305656 () Bool)

(assert (=> b!1305656 (= e!744778 (containsKey!729 (t!43414 (toList!10202 (ListLongMap!20374 Nil!29817))) k0!1205))))

(assert (= (and d!142075 (not res!866935)) b!1305655))

(assert (= (and b!1305655 res!866936) b!1305656))

(declare-fun m!1196473 () Bool)

(assert (=> b!1305656 m!1196473))

(assert (=> d!141899 d!142075))

(declare-fun b!1305657 () Bool)

(declare-fun e!744779 () Bool)

(assert (=> b!1305657 (= e!744779 tp_is_empty!34945)))

(declare-fun mapIsEmpty!54034 () Bool)

(declare-fun mapRes!54034 () Bool)

(assert (=> mapIsEmpty!54034 mapRes!54034))

(declare-fun b!1305658 () Bool)

(declare-fun e!744780 () Bool)

(assert (=> b!1305658 (= e!744780 tp_is_empty!34945)))

(declare-fun mapNonEmpty!54034 () Bool)

(declare-fun tp!103097 () Bool)

(assert (=> mapNonEmpty!54034 (= mapRes!54034 (and tp!103097 e!744779))))

(declare-fun mapKey!54034 () (_ BitVec 32))

(declare-fun mapValue!54034 () ValueCell!16574)

(declare-fun mapRest!54034 () (Array (_ BitVec 32) ValueCell!16574))

(assert (=> mapNonEmpty!54034 (= mapRest!54033 (store mapRest!54034 mapKey!54034 mapValue!54034))))

(declare-fun condMapEmpty!54034 () Bool)

(declare-fun mapDefault!54034 () ValueCell!16574)

(assert (=> mapNonEmpty!54033 (= condMapEmpty!54034 (= mapRest!54033 ((as const (Array (_ BitVec 32) ValueCell!16574)) mapDefault!54034)))))

(assert (=> mapNonEmpty!54033 (= tp!103096 (and e!744780 mapRes!54034))))

(assert (= (and mapNonEmpty!54033 condMapEmpty!54034) mapIsEmpty!54034))

(assert (= (and mapNonEmpty!54033 (not condMapEmpty!54034)) mapNonEmpty!54034))

(assert (= (and mapNonEmpty!54034 ((_ is ValueCellFull!16574) mapValue!54034)) b!1305657))

(assert (= (and mapNonEmpty!54033 ((_ is ValueCellFull!16574) mapDefault!54034)) b!1305658))

(declare-fun m!1196475 () Bool)

(assert (=> mapNonEmpty!54034 m!1196475))

(declare-fun b_lambda!23345 () Bool)

(assert (= b_lambda!23343 (or (and start!110258 b_free!29305) b_lambda!23345)))

(declare-fun b_lambda!23347 () Bool)

(assert (= b_lambda!23341 (or (and start!110258 b_free!29305) b_lambda!23347)))

(check-sat (not b!1305416) (not b!1305459) (not b!1305548) (not d!141911) (not b!1305494) (not b_lambda!23337) (not d!141961) (not d!141935) (not bm!64458) (not d!141997) (not b!1305572) (not b!1305495) (not b!1305503) (not b!1305409) (not b!1305627) (not b!1305631) (not b!1305412) (not d!142001) (not b!1305553) (not d!141971) (not d!141959) (not d!141923) (not d!141977) (not bm!64451) (not b_lambda!23347) (not b!1305551) (not b!1305649) (not d!141905) (not b!1305633) (not mapNonEmpty!54034) (not b!1305653) (not b!1305465) (not b!1305552) (not d!142055) (not d!141989) (not d!142061) (not b!1305559) (not b!1305468) (not d!142017) (not b!1305487) (not d!141973) (not bm!64450) (not d!141951) (not b!1305424) (not b!1305618) (not d!141909) (not b!1305420) (not d!141955) (not b!1305566) (not b!1305500) (not d!142047) (not d!141965) (not d!142023) (not b!1305511) (not d!141963) (not b!1305570) (not b!1305466) (not d!142031) (not d!141913) (not b!1305434) (not d!142011) (not b!1305518) (not b!1305462) (not d!142039) (not b!1305641) (not b!1305506) (not b!1305620) (not b!1305426) (not d!141925) (not d!141915) (not b!1305643) (not b!1305445) (not b!1305549) (not b!1305636) (not b!1305610) (not b!1305619) (not d!142019) (not d!142025) (not b!1305545) (not d!142009) (not b!1305635) (not b_lambda!23339) (not d!142053) (not b!1305615) (not b!1305584) (not d!142003) (not b!1305454) (not b!1305496) (not b!1305560) (not d!142007) (not b!1305489) (not b!1305492) (not d!141943) (not b!1305541) (not b!1305644) (not b!1305414) (not b!1305550) (not d!142051) (not d!142067) (not d!141949) (not b!1305501) (not b!1305461) (not b!1305457) (not b!1305485) (not b!1305512) (not d!141907) (not b!1305562) (not d!141945) (not d!142043) (not b!1305449) (not b!1305415) (not d!141957) (not b!1305575) (not d!142073) (not b!1305483) (not b!1305616) (not b!1305471) (not b!1305569) (not d!141929) (not d!141985) (not b!1305422) (not d!142035) (not bm!64449) (not b!1305573) (not b_lambda!23345) (not b!1305477) (not b!1305470) (not bm!64461) (not d!142059) (not b!1305578) (not b_next!29305) (not b!1305488) (not b!1305624) (not d!141939) b_and!47497 tp_is_empty!34945 (not d!142027) (not b!1305621) (not d!142015) (not b!1305656) (not b!1305423) (not d!142045) (not d!141937) (not b!1305564) (not b!1305481) (not b!1305505) (not d!142049) (not d!142033) (not d!141931) (not d!142029) (not b!1305473) (not b!1305417) (not b!1305614) (not d!142005) (not b!1305638) (not b!1305585) (not b!1305427) (not b!1305452) (not b!1305524) (not b!1305478) (not d!141917) (not b!1305464) (not d!142041) (not d!141941) (not b!1305418) (not d!141975) (not b!1305499) (not b!1305629) (not d!142013) (not b!1305654) (not d!141919) (not b!1305486) (not d!142071) (not d!141991) (not b!1305474) (not b!1305567) (not b!1305411) (not d!142021) (not b!1305408) (not b!1305623) (not d!141999) (not b_lambda!23335))
(check-sat b_and!47497 (not b_next!29305))
